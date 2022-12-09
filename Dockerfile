# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.10-slim

WORKDIR /usr/src/app

# Install production dependencies.
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy codes to the container image.
COPY . .

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and eight threads.
CMD gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app

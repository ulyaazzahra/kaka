#!/bin/bash

echo "Masukkan path ke file video:"
read -r video_file_path

echo "Masukkan URL RTMP:"
read -r url_live

ffmpeg -stream_loop -1 -i "$video_file_path" -c:v libx264 -preset ultrafast -profile:v main -level 3.1 -pix_fmt yuv420p -r 10 -b:v 10000k -c:a aac -b:a 128k -f flv "$url_live"

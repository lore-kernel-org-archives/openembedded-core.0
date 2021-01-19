Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.7760.1611035140706835143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 21:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; 
   d="scan'208";a="103607720"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 Jan 2021 13:45:31 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 31FEF4CE67B1
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 13:45:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 19 Jan 2021 13:45:28 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] ffmpeg: CVE-2020-35965 Security Advisory
Date: Tue, 19 Jan 2021 13:45:24 +0800
Message-ID: <1611035125-38834-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 31FEF4CE67B1.A132D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

refresh patch:CVE-2020-35965.patch

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-35965

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../ffmpeg/ffmpeg/CVE-2020-35965.patch        | 64 ++++++++++++++-----
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
index ddab8e9aca..e865fa387d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
@@ -1,35 +1,69 @@
-From 3e5959b3457f7f1856d997261e6ac672bba49e8b Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 24 Oct 2020 22:21:48 +0200
-Subject: [PATCH] avcodec/exr: Check ymin vs. h
+Subject: [PATCH] CVE-2020-35965
+
+commit id:3e5959b3457f7f1856d997261e6ac672bba49e8b
+avcodec/exr: Check ymin vs. h:
 
 Fixes: out of array access
 Fixes: 26532/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_EXR_fuzzer-5613925708857344
 Fixes: 27443/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_EXR_fuzzer-5631239813595136
 
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/3e5959b3457f7f1856d997261e6ac672bba49e8b]
+commit id:b0a8b40294ea212c1938348ff112ef1b9bf16bb3
+avcodec/exr: skip bottom clearing loop when its outside the image:
 
-CVE: CVE-2020-35965
+Fixes: signed integer overflow: 1633771809 * 32960 cannot be represented in type 'int'
+Fixes: 26532/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_EXR_fuzzer-5613925708857344
 
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
 Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
 ---
- libavcodec/exr.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ libavcodec/exr.c | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
 
 diff --git a/libavcodec/exr.c b/libavcodec/exr.c
-index e907c5c46401..8b701d1cd298 100644
+index 68d5bef..a933bbf 100644
 --- a/libavcodec/exr.c
 +++ b/libavcodec/exr.c
-@@ -1830,7 +1830,7 @@ static int decode_frame(AVCodecContext *avctx, void *data,
+@@ -1654,7 +1654,7 @@ static int decode_frame(AVCodecContext *avctx, void *data,
+     AVFrame *picture = data;
+     uint8_t *ptr;
+ 
+-    int i, y, ret;
++    int i, y, ret, ymax;
+     int planes;
+     int out_line_size;
+     int nb_blocks;   /* nb scanline or nb tile */
+@@ -1794,7 +1794,7 @@ static int decode_frame(AVCodecContext *avctx, void *data,
      // Zero out the start if ymin is not 0
      for (i = 0; i < planes; i++) {
          ptr = picture->data[i];
 -        for (y = 0; y < s->ymin; y++) {
-+        for (y = 0; y < FFMIN(s->ymin, s->h); y++) {
++	for (y = 0; y < FFMIN(s->ymin, s->h); y++) {
              memset(ptr, 0, out_line_size);
              ptr += picture->linesize[i];
          }
+@@ -1804,14 +1804,16 @@ static int decode_frame(AVCodecContext *avctx, void *data,
+ 
+     avctx->execute2(avctx, decode_block, s->thread_data, NULL, nb_blocks);
+ 
++    ymax = FFMAX(0, s->ymax + 1);
+     // Zero out the end if ymax+1 is not h
+-    for (i = 0; i < planes; i++) {
+-        ptr = picture->data[i] + ((s->ymax+1) * picture->linesize[i]);
+-        for (y = s->ymax + 1; y < avctx->height; y++) {
+-            memset(ptr, 0, out_line_size);
+-            ptr += picture->linesize[i];
++    if (ymax < avctx->height)
++        for (i = 0; i < planes; i++) {
++            ptr = picture->data[i] + (ymax * picture->linesize[i]);
++            for (y = ymax; y < avctx->height; y++) {
++                memset(ptr, 0, out_line_size);
++                ptr += picture->linesize[i];
++            }
+         }
+-    }
+ 
+     picture->pict_type = AV_PICTURE_TYPE_I;
+     *got_frame = 1;
+-- 
+2.25.1
+
-- 
2.25.1




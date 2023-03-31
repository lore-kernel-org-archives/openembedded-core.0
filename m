Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430AAC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:26:46 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.47931.1680240404280226134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YGwlJLjF;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id i9so21196008wrp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680240402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iM/MPB6NcJJvNkPrkJxLXlh/y/OFlVS8Di/vsHubwxA=;
        b=YGwlJLjFBIsJ7c/8iVZXz/1hGRtw004knEQHkLjPnbTaWtkm0329LlCEc2SBQ+kW9y
         Bi5lOOkYk7Tm30AU4A3fPq4G+JsR0UVA5WAlM39Sm1M5YXwYHBoU+LhC0+jvKf5QchZW
         sOKaHGLk9mPnsRJqlfweGUZ++hPSviTLBve6D/Gl9MYEm/xbmSOVouE33oXl4WA8ZCfu
         /iACGzVbQa2bhnOx1xsOq1xLk7ifXSnLBN9InhGWWY4tBD/g1usJCwM9Omigxsrzhzh0
         ukM0LADIztZV9g2S9+GxEToAHSuZUQceMicN8QT75CybLRTF42ak+sfMHUuhjAmA4sk4
         yEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680240402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iM/MPB6NcJJvNkPrkJxLXlh/y/OFlVS8Di/vsHubwxA=;
        b=J3EnIvstbmUjSGopjnTPxQkB0iz4H95dN8VB94nqnSwlDGiGOnrT8m5a9IUOhR5Gqw
         rH63xJA3mIlU87P2n5HiFpFTVbi+v/F/C1i3uHZDxLgb3MdzZdhViXKUeqh4X+Amu6sB
         rQA8k8BTs3eCFvFzPDa7X+qODzfVuud9i5AeZR0JtAAS8EdKto/PM8mQLKZu4vzQ6kz+
         hjiHdJn2RQkv09MoC9vRdMjf3aAOe+Vo0nnid4x9nsmVq0UZqK/a4h5wGPcc//WsSOpK
         L9I0cONj1yTvq0lCJS/jHskpyKTvVoArq5ZVTmkO4dHRWrNmrt6ADPkwCo2bVsRCb0wv
         pOFQ==
X-Gm-Message-State: AAQBX9ei32OOvjxUasXpdFzWEM5P6SVeE9dXn428lZyynuJcyr6rwmwd
	aWmAcAcre2csnJBJ9EuZv35hS6KoF2Q=
X-Google-Smtp-Source: AKy350ZbuFNgdQnkynAxcxOykooX/6A97Uel9axlgtV3GmqSQIQIU+1qD3WIH2DPSrMqKsGxZqAF9A==
X-Received: by 2002:adf:e288:0:b0:2ce:a93d:882d with SMTP id v8-20020adfe288000000b002cea93d882dmr20085985wri.11.1680240402177;
        Thu, 30 Mar 2023 22:26:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d5265000000b002e55cc69169sm1146902wrc.38.2023.03.30.22.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:26:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/7] ffmpeg: update 5.1.2 -> 6.0
Date: Fri, 31 Mar 2023 07:26:30 +0200
Message-Id: <20230331052636.978578-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179384

Add a patch to gstreamer1.0-libav to address an API compatibility fail.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...c-stop-accessing-out-of-bounds-frame.patch |  89 ---------------
 ...c-stop-accessing-out-of-bounds-frame.patch | 108 ------------------
 .../ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch     |  34 ------
 .../ffmpeg/{ffmpeg_5.1.2.bb => ffmpeg_6.0.bb} |   8 +-
 .../gstreamer1.0-libav/ffmpeg-6.0.patch       |  49 ++++++++
 .../gstreamer/gstreamer1.0-libav_1.22.0.bb    |   4 +-
 6 files changed, 54 insertions(+), 238 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.1.2.bb => ffmpeg_6.0.bb} (95%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
deleted file mode 100644
index 2775a81cc86..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 2001
-From: Paul B Mahol <onemda@gmail.com>
-Date: Sat, 12 Nov 2022 16:12:00 +0100
-Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984]
-
-Signed-off-by: <narpat.mali@windriver.com>
-
----
- libavcodec/rpzaenc.c | 22 +++++++++++++++-------
- 1 file changed, 15 insertions(+), 7 deletions(-)
-
-diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c
-index d710eb4f82..4ced9523e2 100644
---- a/libavcodec/rpzaenc.c
-+++ b/libavcodec/rpzaenc.c
-@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInfo *bi, const uint16_t *block_pt
- 
-     // loop thru and compare pixels
-     for (y = 0; y < bi->block_height; y++) {
--        for (x = 0; x < bi->block_width; x++){
-+        for (x = 0; x < bi->block_width; x++) {
-             // TODO:  optimize
-             min_r = FFMIN(R(block_ptr[x]), min_r);
-             min_g = FFMIN(G(block_ptr[x]), min_g);
-@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr, const BlockInfo *bi,
-         return -1;
- 
-     for (i = 0; i < bi->block_height; i++) {
--        for (j = 0; j < bi->block_width; j++){
-+        for (j = 0; j < bi->block_width; j++) {
-             x = GET_CHAN(block_ptr[j], xchannel);
-             y = GET_CHAN(block_ptr[j], ychannel);
-             sumx += x;
-@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t *block_ptr, const BlockInfo *bi
-     int max_err = 0;
- 
-     for (i = 0; i < bi->block_height; i++) {
--        for (j = 0; j < bi->block_width; j++){
-+        for (j = 0; j < bi->block_width; j++) {
-             int x_inc, lin_y, lin_x;
-             x = GET_CHAN(block_ptr[j], xchannel);
-             y = GET_CHAN(block_ptr[j], ychannel);
-@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint16_t *src_pixels,
-                                        uint16_t *dest_pixels,
-                                        const BlockInfo *bi, int block_counter)
- {
--    for (int y = 0; y < 4; y++) {
-+    const int y_size = FFMIN(4, bi->image_height - bi->row * 4);
-+
-+    for (int y = 0; y < y_size; y++) {
-         memcpy(dest_pixels, src_pixels, 8);
-         dest_pixels += bi->rowstride;
-         src_pixels += bi->rowstride;
-@@ -730,14 +732,15 @@ post_skip :
- 
-             if (err > s->sixteen_color_thresh) { // DO SIXTEEN COLOR BLOCK
-                 uint16_t *row_ptr;
--                int rgb555;
-+                int y_size, rgb555;
- 
-                 block_offset = get_block_info(&bi, block_counter);
- 
-                 row_ptr = &src_pixels[block_offset];
-+                y_size = FFMIN(4, bi.image_height - bi.row * 4);
- 
--                for (int y = 0; y < 4; y++) {
--                    for (int x = 0; x < 4; x++){
-+                for (int y = 0; y < y_size; y++) {
-+                    for (int x = 0; x < 4; x++) {
-                         rgb555 = row_ptr[x] & ~0x8000;
- 
-                         put_bits(&s->pb, 16, rgb555);
-@@ -745,6 +748,11 @@ post_skip :
-                     row_ptr += bi.rowstride;
-                 }
- 
-+                for (int y = y_size; y < 4; y++) {
-+                    for (int x = 0; x < 4; x++)
-+                        put_bits(&s->pb, 16, 0);
-+                }
-+
-                 block_counter++;
-             } else { // FOUR COLOR BLOCK
-                 block_counter += encode_four_color_block(min_color, max_color,
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
deleted file mode 100644
index 923fc6a9c1b..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 13c13109759090b7f7182480d075e13b36ed8edd Mon Sep 17 00:00:00 2001
-From: Paul B Mahol <onemda@gmail.com>
-Date: Sat, 12 Nov 2022 15:19:21 +0100
-Subject: [PATCH] avcodec/smcenc: stop accessing out of bounds frame
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/13c13109759090b7f7182480d075e13b36ed8edd]
-
-Signed-off-by: <narpat.mali@windriver.com>
-
----
- libavcodec/smcenc.c | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/libavcodec/smcenc.c b/libavcodec/smcenc.c
-index f3d26a4e8d..33549b8ab4 100644
---- a/libavcodec/smcenc.c
-+++ b/libavcodec/smcenc.c
-@@ -61,6 +61,7 @@ typedef struct SMCContext {
-         { \
-             row_ptr += stride * 4; \
-             pixel_ptr = row_ptr; \
-+            cur_y += 4; \
-         } \
-     } \
- }
-@@ -117,6 +118,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
-     const uint8_t *prev_pixels = (const uint8_t *)s->prev_frame->data[0];
-     uint8_t *distinct_values = s->distinct_values;
-     const uint8_t *pixel_ptr, *row_ptr;
-+    const int height = frame->height;
-     const int width = frame->width;
-     uint8_t block_values[16];
-     int block_counter = 0;
-@@ -125,13 +127,14 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
-     int color_octet_index = 0;
-     int color_table_index;  /* indexes to color pair, quad, or octet tables */
-     int total_blocks;
-+    int cur_y = 0;
- 
-     memset(s->color_pairs, 0, sizeof(s->color_pairs));
-     memset(s->color_quads, 0, sizeof(s->color_quads));
-     memset(s->color_octets, 0, sizeof(s->color_octets));
- 
-     /* Number of 4x4 blocks in frame. */
--    total_blocks = ((frame->width + 3) / 4) * ((frame->height + 3) / 4);
-+    total_blocks = ((width + 3) / 4) * ((height + 3) / 4);
- 
-     pixel_ptr = row_ptr = src_pixels;
- 
-@@ -145,11 +148,13 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
-         int cache_index;
-         int distinct = 0;
-         int blocks = 0;
-+        int frame_y = cur_y;
- 
-         while (prev_pixels && s->key_frame == 0 && block_counter + inter_skip_blocks < total_blocks) {
-+            const int y_size = FFMIN(4, height - cur_y);
-             int compare = 0;
- 
--            for (int y = 0; y < 4; y++) {
-+            for (int y = 0; y < y_size; y++) {
-                 const ptrdiff_t offset = pixel_ptr - src_pixels;
-                 const uint8_t *prev_pixel_ptr = prev_pixels + offset;
- 
-@@ -170,8 +175,10 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
- 
-         pixel_ptr = xpixel_ptr;
-         row_ptr = xrow_ptr;
-+        cur_y = frame_y;
- 
-         while (block_counter > 0 && block_counter + intra_skip_blocks < total_blocks) {
-+            const int y_size = FFMIN(4, height - cur_y);
-             const ptrdiff_t offset = pixel_ptr - src_pixels;
-             const int sy = offset / stride;
-             const int sx = offset % stride;
-@@ -180,7 +187,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
-             const uint8_t *old_pixel_ptr = src_pixels + nx + ny * stride;
-             int compare = 0;
- 
--            for (int y = 0; y < 4; y++) {
-+            for (int y = 0; y < y_size; y++) {
-                 compare |= memcmp(old_pixel_ptr + y * stride, pixel_ptr + y * stride, 4);
-                 if (compare)
-                     break;
-@@ -197,9 +204,11 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
- 
-         pixel_ptr = xpixel_ptr;
-         row_ptr = xrow_ptr;
-+        cur_y = frame_y;
- 
-         while (block_counter + coded_blocks < total_blocks && coded_blocks < 256) {
--            for (int y = 0; y < 4; y++)
-+            const int y_size = FFMIN(4, height - cur_y);
-+            for (int y = 0; y < y_size; y++)
-                 memcpy(block_values + y * 4, pixel_ptr + y * stride, 4);
- 
-             qsort(block_values, 16, sizeof(block_values[0]), smc_cmp_values);
-@@ -224,6 +233,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
- 
-         pixel_ptr = xpixel_ptr;
-         row_ptr = xrow_ptr;
-+        cur_y = frame_y;
- 
-         blocks = coded_blocks;
-         distinct = coded_distinct;
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
deleted file mode 100644
index 95bd608a277..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From: Lynne <dev@lynne.ee>
-Date: Sun, 25 Dec 2022 00:03:30 +0000 (+0100)
-Subject: hwcontext_vulkan: remove optional encode/decode extensions from the list
-X-Git-Url: http://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff_plain/eb0455d64690
-
-hwcontext_vulkan: remove optional encode/decode extensions from the list
-
-They're not currently used, so they don't need to be there.
-Vulkan stabilized the decode extensions less than a week ago, and their
-name prefixes were changed from EXT to KHR. It's a bit too soon to be
-depending on it, so rather than bumping, just remove these for now.
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff_plain/eb0455d64690]
----
-
-diff --git a/libavutil/hwcontext_vulkan.c b/libavutil/hwcontext_vulkan.c
-index f1db1c7291..2a9b5f4aac 100644
---- a/libavutil/hwcontext_vulkan.c
-+++ b/libavutil/hwcontext_vulkan.c
-@@ -358,14 +358,6 @@ static const VulkanOptExtension optional_device_exts[] = {
-     { VK_KHR_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME,            FF_VK_EXT_EXTERNAL_WIN32_MEMORY  },
-     { VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME,         FF_VK_EXT_EXTERNAL_WIN32_SEM     },
- #endif
--
--    /* Video encoding/decoding */
--    { VK_KHR_VIDEO_QUEUE_EXTENSION_NAME,                      FF_VK_EXT_NO_FLAG                },
--    { VK_KHR_VIDEO_DECODE_QUEUE_EXTENSION_NAME,               FF_VK_EXT_NO_FLAG                },
--    { VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME,               FF_VK_EXT_NO_FLAG                },
--    { VK_EXT_VIDEO_ENCODE_H264_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
--    { VK_EXT_VIDEO_DECODE_H264_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
--    { VK_EXT_VIDEO_DECODE_H265_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
- };
- 
- /* Converts return values to strings */
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
similarity index 95%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
index cccd9f65abf..e4a4a0effa1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -22,13 +22,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
-           file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
-           file://ffmpeg-fix-vulkan.patch \
-           "
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
+SRC_URI[sha256sum] = "57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89c44e47e289137082"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0.patch
new file mode 100644
index 00000000000..0a06540fb47
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0.patch
@@ -0,0 +1,49 @@
+From cde31d23c071ee93fae96331805f696856084254 Mon Sep 17 00:00:00 2001
+From: "U. Artie Eoff" <ullysses.a.eoff@intel.com>
+Date: Mon, 13 Feb 2023 17:02:01 -0500
+Subject: [PATCH] avviddec: change
+ AV_CODEC_CAP_AUTO_THREADS->AV_CODEC_CAP_OTHER_THREADS
+
+This fixes a compile error with recent upstream FFmpeg.
+
+The AV_CODEC_CAP_AUTO_THREADS was deprecated and renamed to
+AV_CODEC_CAP_OTHER_THREADS in FFmpeg upstream commit
+7d09579190de (lavc 58.132.100).
+
+The AV_CODEC_CAP_AUTO_THREADS was finally removed in FFmpeg upstream
+commit 10c9a0874cb3 (lavc 59.63.100).
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3964>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/cde31d23c071ee93fae96331805f696856084254?merge_request_iid=3964]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ ext/libav/gstavviddec.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
+index 43cea456ae8..6d7c4cd0de8 100644
+--- a/ext/libav/gstavviddec.c
++++ b/ext/libav/gstavviddec.c
+@@ -35,6 +35,10 @@
+ 
+ GST_DEBUG_CATEGORY_STATIC (GST_CAT_PERFORMANCE);
+ 
++#if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(58,132,100)
++#define AV_CODEC_CAP_OTHER_THREADS AV_CODEC_CAP_AUTO_THREADS
++#endif
++
+ #define GST_FFMPEG_VIDEO_CODEC_FRAME_FLAG_ALLOCATED (1<<15)
+ 
+ #define MAX_TS_MASK 0xff
+@@ -615,7 +619,7 @@ gst_ffmpegviddec_set_format (GstVideoDecoder * decoder,
+   if (ffmpegdec->max_threads == 0) {
+     /* When thread type is FF_THREAD_FRAME, extra latency is introduced equal
+      * to one frame per thread. We thus need to calculate the thread count ourselves */
+-    if ((!(oclass->in_plugin->capabilities & AV_CODEC_CAP_AUTO_THREADS)) ||
++    if ((!(oclass->in_plugin->capabilities & AV_CODEC_CAP_OTHER_THREADS)) ||
+         (ffmpegdec->context->thread_type & FF_THREAD_FRAME))
+       ffmpegdec->context->thread_count =
+           MIN (gst_ffmpeg_auto_max_threads (), 16);
+-- 
+GitLab
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
index 625a52ea555..d1dce6739dd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
+           file://ffmpeg-6.0.patch \
+          "
 SRC_URI[sha256sum] = "0e48407b4905227a260213dbda84cba3812f0530fc7a75b43829102ef82810f1"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-- 
2.30.2



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D77E7F13D
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:43:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.3620.1695764618763533060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P9raO7D7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c63164a2b6so16041885ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695764618; x=1696369418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uq82QcoFeVbYi36S+wB33DVXLf/RiBo3vuDsXm7OLKQ=;
        b=P9raO7D7twK+UwSBPL0Jt12A37dhLKfxCbDr8Tn7OCfDa6qat/RcoPett9990oZCMw
         TDk5D27/YRHrlDIDBR7km863DZhVqxR/6qpvXi5tj56U8J78AKUzTVHK9/yCc/HcItuQ
         /g3wzlekrLQM7l4zCmfCbAbPWqRmNgx6zwZFRDAEv9ODYoMwmtyQXN9FaAqG/fQ5F0Tl
         k9yvC2VlSzcDUAw2TQLZV3Am9gHopCpKs0XsJZpydAoLu3bRVvw21qlz3etQDBClc0HD
         55V24YUjnxezBFnTf9vcq40TAVrpeX5361jwlRhQ7+1ofqM9b7a4SPNzJ9GrZM2+HMB5
         YIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764618; x=1696369418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq82QcoFeVbYi36S+wB33DVXLf/RiBo3vuDsXm7OLKQ=;
        b=oUrHQLtYHqmP3MZ1eCzNXyJ1YMCUlmpDtKN/CoO+e5ElpJtT/R2ejfhFPvVShR/YLp
         6ylwroluA0fJ6tRxbslwDyPcEtlHR8vhTI7Vt37ymvaOoa5HMP8Z6TCBOlm6YlBywLSZ
         ZpcYjQhtj5zJ7eDnlyH3U7WukfNq4r9mED8GmZoCj1RYOmeLBmwg20bhsaCGPHM+00VN
         IJfQqMvheLm8/owzC1pQ93AJFwQ7VtyoRlrYVouhEFkFItnJxehvKcmOwqPyLzzJIjCn
         kFPL2DKCkk0yBSJA1HpE3G3mZPm1C2+0MMONb3pQ+q8E0KX1hs7PobWJRlENxdl4JDMT
         3xeQ==
X-Gm-Message-State: AOJu0YzqkwliW9qvEkoziKvDaWwTIechDkS0HZ/lpx0FqDiPgJpqJfWu
	3rPaAkj4HsXXXSAZ/Zxwq5v9SeHgzRShBI4BEZk=
X-Google-Smtp-Source: AGHT+IGfZT8hj0d8mbBhQC9Ea2/KELa2BWj7xuPUjudoZeXCbawqLI60ijhGltyNURzvO3uOeIkIzA==
X-Received: by 2002:a17:902:f7ce:b0:1b2:676d:1143 with SMTP id h14-20020a170902f7ce00b001b2676d1143mr218408plw.15.1695764617691;
        Tue, 26 Sep 2023 14:43:37 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b5247cac3dsm11487713pli.110.2023.09.26.14.43.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:43:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/10] ffmpeg: 5.1.2 -> 5.1.3
Date: Tue, 26 Sep 2023 11:43:16 -1000
Message-Id: <aeee19cda946b67f33c7b7c02c86513676bc89bd.1695764457.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695764457.git.steve@sakoman.com>
References: <cover.1695764457.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188275

From: Lee Chee Yang <chee.yang.lee@intel.com>

drop patch which is already part of 5.1.3.

0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch(CVE-2022-3964):
https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/1eb002596e3761d88de4aeea3158692b82fb6307

0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch(CVE-2022-3965):
https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/293dc39bcaa99f213c6b7a703e11f146abf5d3be

ffmpeg-fix-vulkan.patch :  https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/7268323193d55365f914de39fadd5dbdb1f68976

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...c-stop-accessing-out-of-bounds-frame.patch |  89 ---------------
 ...c-stop-accessing-out-of-bounds-frame.patch | 108 ------------------
 .../ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch     |  34 ------
 .../{ffmpeg_5.1.2.bb => ffmpeg_5.1.3.bb}      |   5 +-
 4 files changed, 1 insertion(+), 235 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.1.2.bb => ffmpeg_5.1.3.bb} (96%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
deleted file mode 100644
index 2775a81cc8..0000000000
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
index 923fc6a9c1..0000000000
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
index 95bd608a27..0000000000
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb
similarity index 96%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb
index aa5a8681cf..9899e570ad 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb
@@ -23,12 +23,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
-           file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
-           file://ffmpeg-fix-vulkan.patch \
            "
 
-SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
+SRC_URI[sha256sum] = "1b113593ff907293be7aed95acdda5e785dd73616d7d4ec90a0f6adbc5a0312e"
 
 # CVE-2023-39018 issue belongs to ffmpeg-cli-wrapper (Java wrapper around the FFmpeg CLI)
 # and not ffmepg itself.
-- 
2.34.1



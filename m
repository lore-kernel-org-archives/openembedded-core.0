Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F735C4708A
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:43 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.92031.1669557338739231194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=C3xoItCd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id r18so7689860pgr.12
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXwPXtRv9WHaQG+YNlVDPu28iw6jccnD2Hz2rs4AAww=;
        b=C3xoItCd6wTP5mc8gbUGM42ifdowz6Wx5S6v+HgVu6j+82adWImB9+dRtNTCeVPwbt
         PaT7tTHPbP/dxV/EprihkZqpRU1VOZmZIXn3fLIESfaN9MoGoL7SDpKjapD+F6mADH0d
         DQXTGpq1drHUHCc7+k2q0u0lSFNorBXgO/n+M0SxSW7ZA+HoX6X34fNjfBSBhpu65mBW
         is2yr+jS30Tzbui5vDedcnDtL+2b+4yYtRNWqo+g/wOpv6iqv5CSqArHh9tHe5BJ/C08
         TwMJ2hOpl6upeKRvKIfZWziD5H6ZCrJrrYSYhG2XsyjtRUYidiImsBFouLYFo4/WuPFb
         ihFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXwPXtRv9WHaQG+YNlVDPu28iw6jccnD2Hz2rs4AAww=;
        b=NAEfkCRQEGk5Qq7qlPjmkexZ+40I4kGqZL36utkdAvaf+hv0zNGIKZcVawM3BzB5TQ
         BL1XIE2+HtScpTd843Xed6mP3gMZLPyfjGB9NxU/mWE6BZ1Jsdd9sAJT4L1/qqHgaw9P
         41rv5UYC08B0lta8MIBtLdMNk4IeHFhhdxDe4g4VQtkSnWFA09yqo17kVIewRHRzhZdz
         vIm7dEwYoJpiyo/tGK3eT/LdPoN8L9Q59TFRdwbo5YtH4t50yf/ghwSXBOdG4u0g1l1J
         zHBLenv1dhNw4knQWlaNT4zv9qijsEtPwBpkKnsVfBFdZaB8PsFPugNnR4nTPLMOt1Hx
         bMew==
X-Gm-Message-State: ANoB5pkuYgmK92iMX7xUs0IWZBdL5iqw1r3955m41htttOmy1hWRp1b/
	0AxPMHrF83Pp3v+1qpmUH1RppMA2WjdtlbtGx1E=
X-Google-Smtp-Source: AA0mqf73uVHQttG6LdYV4zjZYYQGScQQhGT12p3yxcIXSkzgiLcRqYzwC5MhheqB0cPGK5UMzOfgyA==
X-Received: by 2002:a63:5c23:0:b0:46f:b6e1:1966 with SMTP id q35-20020a635c23000000b0046fb6e11966mr32755861pgb.625.1669557337695;
        Sun, 27 Nov 2022 05:55:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/31] ffmpeg: fix for CVE-2022-3965
Date: Sun, 27 Nov 2022 03:54:50 -1000
Message-Id: <c1f1ab29b5e2911a15b072e7feb0133320bad976.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173849

From: Narpat Mali <narpat.mali@windriver.com>

A vulnerability classified as problematic was found in ffmpeg. This vulnerability affects the function
smc_encode_stream of the file libavcodec/smcenc.c of the component QuickTime Graphics Video Encoder. The
manipulation of the argument y_size leads to out-of-bounds read. The attack can be initiated remotely.
The name of the patch is 13c13109759090b7f7182480d075e13b36ed8edd. It is recommended to apply a patch to
fix this issue. The identifier of this vulnerability is VDB-213544.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3965

Upstream Fix:
https://github.com/FFmpeg/FFmpeg/commit/13c13109759090b7f7182480d075e13b36ed8edd

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...c-stop-accessing-out-of-bounds-frame.patch | 108 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
new file mode 100644
index 0000000000..923fc6a9c1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
@@ -0,0 +1,108 @@
+From 13c13109759090b7f7182480d075e13b36ed8edd Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Sat, 12 Nov 2022 15:19:21 +0100
+Subject: [PATCH] avcodec/smcenc: stop accessing out of bounds frame
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/13c13109759090b7f7182480d075e13b36ed8edd]
+
+Signed-off-by: <narpat.mali@windriver.com>
+
+---
+ libavcodec/smcenc.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/libavcodec/smcenc.c b/libavcodec/smcenc.c
+index f3d26a4e8d..33549b8ab4 100644
+--- a/libavcodec/smcenc.c
++++ b/libavcodec/smcenc.c
+@@ -61,6 +61,7 @@ typedef struct SMCContext {
+         { \
+             row_ptr += stride * 4; \
+             pixel_ptr = row_ptr; \
++            cur_y += 4; \
+         } \
+     } \
+ }
+@@ -117,6 +118,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+     const uint8_t *prev_pixels = (const uint8_t *)s->prev_frame->data[0];
+     uint8_t *distinct_values = s->distinct_values;
+     const uint8_t *pixel_ptr, *row_ptr;
++    const int height = frame->height;
+     const int width = frame->width;
+     uint8_t block_values[16];
+     int block_counter = 0;
+@@ -125,13 +127,14 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+     int color_octet_index = 0;
+     int color_table_index;  /* indexes to color pair, quad, or octet tables */
+     int total_blocks;
++    int cur_y = 0;
+ 
+     memset(s->color_pairs, 0, sizeof(s->color_pairs));
+     memset(s->color_quads, 0, sizeof(s->color_quads));
+     memset(s->color_octets, 0, sizeof(s->color_octets));
+ 
+     /* Number of 4x4 blocks in frame. */
+-    total_blocks = ((frame->width + 3) / 4) * ((frame->height + 3) / 4);
++    total_blocks = ((width + 3) / 4) * ((height + 3) / 4);
+ 
+     pixel_ptr = row_ptr = src_pixels;
+ 
+@@ -145,11 +148,13 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+         int cache_index;
+         int distinct = 0;
+         int blocks = 0;
++        int frame_y = cur_y;
+ 
+         while (prev_pixels && s->key_frame == 0 && block_counter + inter_skip_blocks < total_blocks) {
++            const int y_size = FFMIN(4, height - cur_y);
+             int compare = 0;
+ 
+-            for (int y = 0; y < 4; y++) {
++            for (int y = 0; y < y_size; y++) {
+                 const ptrdiff_t offset = pixel_ptr - src_pixels;
+                 const uint8_t *prev_pixel_ptr = prev_pixels + offset;
+ 
+@@ -170,8 +175,10 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+ 
+         pixel_ptr = xpixel_ptr;
+         row_ptr = xrow_ptr;
++        cur_y = frame_y;
+ 
+         while (block_counter > 0 && block_counter + intra_skip_blocks < total_blocks) {
++            const int y_size = FFMIN(4, height - cur_y);
+             const ptrdiff_t offset = pixel_ptr - src_pixels;
+             const int sy = offset / stride;
+             const int sx = offset % stride;
+@@ -180,7 +187,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+             const uint8_t *old_pixel_ptr = src_pixels + nx + ny * stride;
+             int compare = 0;
+ 
+-            for (int y = 0; y < 4; y++) {
++            for (int y = 0; y < y_size; y++) {
+                 compare |= memcmp(old_pixel_ptr + y * stride, pixel_ptr + y * stride, 4);
+                 if (compare)
+                     break;
+@@ -197,9 +204,11 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+ 
+         pixel_ptr = xpixel_ptr;
+         row_ptr = xrow_ptr;
++        cur_y = frame_y;
+ 
+         while (block_counter + coded_blocks < total_blocks && coded_blocks < 256) {
+-            for (int y = 0; y < 4; y++)
++            const int y_size = FFMIN(4, height - cur_y);
++            for (int y = 0; y < y_size; y++)
+                 memcpy(block_values + y * 4, pixel_ptr + y * stride, 4);
+ 
+             qsort(block_values, 16, sizeof(block_values[0]), smc_cmp_values);
+@@ -224,6 +233,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+ 
+         pixel_ptr = xpixel_ptr;
+         row_ptr = xrow_ptr;
++        cur_y = frame_y;
+ 
+         blocks = coded_blocks;
+         distinct = coded_distinct;
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index e8e3462098..95b4bf50ac 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
+           file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
            "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.25.1



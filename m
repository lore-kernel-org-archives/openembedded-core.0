Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4F0C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:12 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.44755.1669904590120506233
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=n1M7BMlz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so2184291pjd.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4gNnGDb2HNg1GL6xcOaEQ3l2ul0vTGSWbcTD1cWlbk=;
        b=n1M7BMlz3CpnYyWvQk0dUMnFtYgh4ZwpeCY79zkx8hOmu3p/6aN1KN0ZPYhmz1CY2j
         XGgOc2j6sXM+ERzCvv0SQL9hDu2Cp1ukDO0f7s59M5dYKoZNb2X8cEwEAiATdSg1zrRa
         ar+hdFOpgW2JsG+w8p4Mtvaf4/WXPqCdhqwBg+Wfra/qogaqagmllJPPglwLlSm30fLJ
         IdmD/xeVWBIpm7EETDhP9udgddmu2jSVUDcugkv6W597lR9Rr93R62eBiCgksFQbkiJS
         Dd5+avoIHEes74jsCe1mKcCTGQ/J8YfxAzUFtWDd7R0aoCknnqoSw6UehQmU81ABf0rw
         zL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4gNnGDb2HNg1GL6xcOaEQ3l2ul0vTGSWbcTD1cWlbk=;
        b=cLzF6a+4rJSMSHub4ne5o288bkfc0RMTTK0mn3nT3kd5oc+2DDzN9i4pUJRGlfyAXI
         kFK4h5Xy9cdOiwXMcWibhSNcwINGbzcMsefYWHTNTCqe+FmFVXCfvG9hdxSBArq51PzY
         z6kR+nxty40BvqcFcOhDChOGN8Vhn9EG2a/fPvUfBF9lmvXpMnLDesUCanlozNxZpnBP
         y386fsrsJMCEkpidelaj/YdwiNo70cNPD0nbGRwZx7Iu3VDHXHNWuEawmK0llAQEu+Dc
         YXl6+Azm0eLeyB/fQlt2MhVbellzvLkUO5aBZFJ+dgMgi/IebwVO/uM2BLlZuFjxNJWR
         NpIQ==
X-Gm-Message-State: ANoB5pnex8mjeRajL7WUjROBolwXvpqgEiTPMgDOn7cDD276VmpsbGEM
	dPGeVxjThe33cmeJRmysYs11mDy5NouWG4atXCE=
X-Google-Smtp-Source: AA0mqf41J2F9NO0aiv9GO4oq8TFFgrxCtzbSEMgS44m59qIKuMi0PbrbtssNzsEv8AIiO6HSkctiOA==
X-Received: by 2002:a17:90b:48c8:b0:20b:25f6:3e30 with SMTP id li8-20020a17090b48c800b0020b25f63e30mr71601964pjb.227.1669904589083;
        Thu, 01 Dec 2022 06:23:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/22] ffmpeg: fix for CVE-2022-3965
Date: Thu,  1 Dec 2022 04:22:33 -1000
Message-Id: <81b75c0331eadc920d27f7115fa9ec99e089bb5a.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174066

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b88c96fe8964614978aa25a65dd34fc3c05c664c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...c-stop-accessing-out-of-bounds-frame.patch | 108 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |   4 +-
 2 files changed, 111 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index 43b858984b..06eca4fefe 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -23,7 +23,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch"
+           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
+           file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
+           "
 
 SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
 
-- 
2.25.1



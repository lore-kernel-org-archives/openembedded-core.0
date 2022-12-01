Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F68AC4708E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.44754.1669904587845081698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5ZDtDDHB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so2193392pjo.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeBPicnAgFAp/cfikvW3EFTJ/dxl38G5B/S8VH5ZUsc=;
        b=5ZDtDDHBKp5TRSmCFq2DgIzViI/Ou1qMvR2tkRx7k/bqjfqyr/xr/Z98gwlDk2qY0Q
         8N8iLtGrfMc5TwcIbpqyrFYpKWvqAQggdf556jGkPe1klO8XFJeLv/u9rGvE62UWx6Ed
         0A4i/lf77o0IHsjXc8/SSqhuq6j0T0GJpSwevy0c2ggdIetLXegyPpLq9eHlUtq6hbZK
         TnIT0H94gowrPgFxv5GQwhnlpgPFaFjjWfBnqpwl3SWssJJwz7wQNrgrcJgFgiPpKn0M
         HQ1oWOu+mhSebvl1ex+uTi19tiM0O4vFaA8CPujUc29GJZvY8vp9A/+4AKYLBYzhXOeA
         ESIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeBPicnAgFAp/cfikvW3EFTJ/dxl38G5B/S8VH5ZUsc=;
        b=BBg800StTAhQjid7NyaUxjhc65KhjkxThntgQzECrxzTIFCyy5KlY6r/h/XW13cMWR
         cPY76UnYAquD7uQ9Y5CpK0hYxpx5m01iWebKzoGm2+qZ7Ezm461FJEbYnIvfzLapi6y+
         Wu/BFsXcQ6nle9XbVC6Yg8Koc7jcgiqrXsHlQp8+oH15MhuUVtWIFZndbsVnuuaEqMgy
         XWuYH+YYpalLdUrs1e/i/amcpg4aO0/mml71x8Jia5tuaXSYl00438/Ff9rzOX3g20mI
         8TWNm8HN/j5PQK/lmTEcf1WZD0CdKDUSrLE+65A4pTAoeCXPGNJJu03cbxebAgLop9Ng
         phPg==
X-Gm-Message-State: ANoB5pm0FEkP+OGmF1ZAqyCrvSKykF1RmJMQ3PaFBqAs3nGDD8fsvJWK
	yVL17Ujk1AQ9jDHVIJfMPhWkPQvFVVkXTAy+VB0=
X-Google-Smtp-Source: AA0mqf6IRXLO0ijm8LJfcHzdFiShZOa8J9KYFWrf/HWakhPP5uh2r9/iqJBZEFHssEomsaUzXC5S5A==
X-Received: by 2002:a17:902:ecd2:b0:189:5f79:6ac2 with SMTP id a18-20020a170902ecd200b001895f796ac2mr35483743plh.132.1669904586701;
        Thu, 01 Dec 2022 06:23:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/22] ffmpeg: fix for CVE-2022-3964
Date: Thu,  1 Dec 2022 04:22:32 -1000
Message-Id: <4d2eec66fb3979b9676466258a1af5321a68b237.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174065

From: Narpat Mali <narpat.mali@windriver.com>

A vulnerability classified as problematic has been found in ffmpeg. This affects an unknown part of the file
libavcodec/rpzaenc.c of the component QuickTime RPZA Video Encoder. The manipulation of the argument y_size
leads to out-of-bounds read. It is possible to initiate the attack remotely. The name of the patch is
92f9b28ed84a77138105475beba16c146bdaf984. It is recommended to apply a patch to fix this issue. The associated
identifier of this vulnerability is VDB-213543.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3964

Upstream Fix:
https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4595f85e7ce867d68ca9d6a6e3ad2544565be3cc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...c-stop-accessing-out-of-bounds-frame.patch | 89 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |  4 +-
 2 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
new file mode 100644
index 0000000000..2775a81cc8
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
@@ -0,0 +1,89 @@
+From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Sat, 12 Nov 2022 16:12:00 +0100
+Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984]
+
+Signed-off-by: <narpat.mali@windriver.com>
+
+---
+ libavcodec/rpzaenc.c | 22 +++++++++++++++-------
+ 1 file changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c
+index d710eb4f82..4ced9523e2 100644
+--- a/libavcodec/rpzaenc.c
++++ b/libavcodec/rpzaenc.c
+@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInfo *bi, const uint16_t *block_pt
+ 
+     // loop thru and compare pixels
+     for (y = 0; y < bi->block_height; y++) {
+-        for (x = 0; x < bi->block_width; x++){
++        for (x = 0; x < bi->block_width; x++) {
+             // TODO:  optimize
+             min_r = FFMIN(R(block_ptr[x]), min_r);
+             min_g = FFMIN(G(block_ptr[x]), min_g);
+@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr, const BlockInfo *bi,
+         return -1;
+ 
+     for (i = 0; i < bi->block_height; i++) {
+-        for (j = 0; j < bi->block_width; j++){
++        for (j = 0; j < bi->block_width; j++) {
+             x = GET_CHAN(block_ptr[j], xchannel);
+             y = GET_CHAN(block_ptr[j], ychannel);
+             sumx += x;
+@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t *block_ptr, const BlockInfo *bi
+     int max_err = 0;
+ 
+     for (i = 0; i < bi->block_height; i++) {
+-        for (j = 0; j < bi->block_width; j++){
++        for (j = 0; j < bi->block_width; j++) {
+             int x_inc, lin_y, lin_x;
+             x = GET_CHAN(block_ptr[j], xchannel);
+             y = GET_CHAN(block_ptr[j], ychannel);
+@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint16_t *src_pixels,
+                                        uint16_t *dest_pixels,
+                                        const BlockInfo *bi, int block_counter)
+ {
+-    for (int y = 0; y < 4; y++) {
++    const int y_size = FFMIN(4, bi->image_height - bi->row * 4);
++
++    for (int y = 0; y < y_size; y++) {
+         memcpy(dest_pixels, src_pixels, 8);
+         dest_pixels += bi->rowstride;
+         src_pixels += bi->rowstride;
+@@ -730,14 +732,15 @@ post_skip :
+ 
+             if (err > s->sixteen_color_thresh) { // DO SIXTEEN COLOR BLOCK
+                 uint16_t *row_ptr;
+-                int rgb555;
++                int y_size, rgb555;
+ 
+                 block_offset = get_block_info(&bi, block_counter);
+ 
+                 row_ptr = &src_pixels[block_offset];
++                y_size = FFMIN(4, bi.image_height - bi.row * 4);
+ 
+-                for (int y = 0; y < 4; y++) {
+-                    for (int x = 0; x < 4; x++){
++                for (int y = 0; y < y_size; y++) {
++                    for (int x = 0; x < 4; x++) {
+                         rgb555 = row_ptr[x] & ~0x8000;
+ 
+                         put_bits(&s->pb, 16, rgb555);
+@@ -745,6 +748,11 @@ post_skip :
+                     row_ptr += bi.rowstride;
+                 }
+ 
++                for (int y = y_size; y < 4; y++) {
++                    for (int x = 0; x < 4; x++)
++                        put_bits(&s->pb, 16, 0);
++                }
++
+                 block_counter++;
+             } else { // FOUR COLOR BLOCK
+                 block_counter += encode_four_color_block(min_color, max_color,
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index a0c98d4ae0..43b858984b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -22,7 +22,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch"
+
 SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
-- 
2.25.1



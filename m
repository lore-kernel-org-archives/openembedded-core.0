Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED14C46467
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:43 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.92030.1669557336713068613
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Chk0o5lv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so7993876pjg.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRXzp5pmm6bUlQLb94B+XrJcz0qZ2Z2jNlTNDnHq2bQ=;
        b=Chk0o5lvfQq+bvViR3I6ozz+7Bmj8J8n0XPVqLNC+4VdvLaT5p8IehpWsMGwBVklbv
         KIk0ohAf9uklgvmYQ8+D2zvh0gWxe4L9DtY+j3VEdGQwSaXM71uy2BvXEKPTJmrn8W0r
         X1e1CsbBeS/iCsqJzvSwGbSbOxEZnjqQRZAAzJqcbc2NDTDU+1Kjlq0GtLlytJISyTCp
         SJpB7V5FhHTD58rTwPY4Xz4c96sTW11NWHunMqnnrCVC7C7HyNnlMgNBAlRpuewG89Fc
         aW3sYvoGu2NqLmTRPRj5BjdXDxXIdHpiB0HMcTLftufAjxfkZ0Ss5UPNkbtvf8lugnso
         RtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRXzp5pmm6bUlQLb94B+XrJcz0qZ2Z2jNlTNDnHq2bQ=;
        b=xO63hLeSuTW+gIOluN7DUvkN1bfErBbxq2uD17S4P8tjxOv6g3+FHbQURzpd0YDYiw
         pZII/njle2cOfdIvBt6PYbs8OHIzdLsTI4CZhy5sZms6g73/nUbbNnRD3O37oneIaprd
         SYONbd6xmUkR+oJOZm1PoekTzx4xvVvpH3SBKEEs3BnDO28sgrNs8w9rz6I2XkZjG8BX
         ueTaMAr3g4/pxA/AlEsi1oIF4o4+goEoOQjvfyppSSnfnPumLQpmwvR0VUywJ/lV1xhj
         5hDLgbT5gwNV+sbWdkppAjkJDAp2CnmJXiSZRePyvb9KA6VoU8aiDksRvjcV1Gz5v4pH
         ThLw==
X-Gm-Message-State: ANoB5pnDWsngBmFArVje0TNh7n0+vIPo1T+X42enGlE+1VHnnNy7NZv4
	lZRw2EyhLDmaIqhcbA7SA18WQsyv05LKpdJiU88=
X-Google-Smtp-Source: AA0mqf5n2cJP90o41VlAUoXEmsDXtuoaAWaGHK1SMvV/DpHCbdm/F9uRBQF8W6JURlIdcJIgbb1YSA==
X-Received: by 2002:a17:902:9a8a:b0:189:58a9:14a4 with SMTP id w10-20020a1709029a8a00b0018958a914a4mr16992799plp.18.1669557335674;
        Sun, 27 Nov 2022 05:55:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/31] ffmpeg: fix for CVE-2022-3964
Date: Sun, 27 Nov 2022 03:54:49 -1000
Message-Id: <40a1c9d3c839df6479582ac27264fac851a0d4c3.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173848

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...c-stop-accessing-out-of-bounds-frame.patch | 89 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  2 +
 2 files changed, 91 insertions(+)
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index dd14f8df6f..e8e3462098 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
+           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
            "
+
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
-- 
2.25.1



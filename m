Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED9FC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:16 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.6944.1645799295800686790
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JWevXUAq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id z15so4818493pfe.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RTspkjQd1CiMldzHPQwhpJgcOCqVY1CmuNAXM+mFUpg=;
        b=JWevXUAqZH+wa2EeitKDVczYF7hpikITbviAZgMO2Wx3o0/aozIWTC8FMPoycx7UpO
         f7czyFHrMV+LSP2MXZGwmYKI13M8IBD9cSITel0TUWp7ROM9UBTryHf4+rn3Z3PcHuBs
         Gb1CIOfE6j65/RLe2vpzrtSXajBcXOcSbtv+YI+0/BhIlFlZgD09SLlQblJJU3ZP5+8A
         sBaPfd7t23fYRVvo5B9WnPWpP58iaI+Vo5zBoEsBQa7Njc+e/9ZzKGIA2MPLhsaylO5a
         DurbpZTz2BsyyzVmi/+m5rzLerAoK+EL7IV2aDaB77vcmQJXKrk/I2uos7Td5nN0ohxB
         AjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RTspkjQd1CiMldzHPQwhpJgcOCqVY1CmuNAXM+mFUpg=;
        b=5zO5caHeVXp0ucM4kyjymfQVCsY0ckMFU6ESWehdnk/AmVuf+a1t0BA/Cx0sAzjSm/
         8gkyTMXdzZtOSDCbXrhuMJ+s7CaWKTG4vfTi0dEwi1lrdWurMJgGZY5SLSnk7TWsuNSr
         Q5qrcMh6bTe/4q8L1HglbI8MrPwlaXbY2jfMIb5V2pJeT8nYXK0QMw0F0EP3knbaL9g7
         WaFC3HjfoQJD4jIah5HMQSuJ9k+qwvxoF+cGxxx2YUv9cfGpXSmN3fCHj02hrBGzrbmX
         tb9fAo3AFNcOAJL4moI/8KKRhUow+CLXcsKaUFKpW27b88E3YmRGYvGizsgOba9wo+Hy
         +XjQ==
X-Gm-Message-State: AOAM533sQcxG8BihUXJYuRb0BhUkmJefq8iSMbnBaelbYLWQH12rPLfU
	5nlfDlKEsghjcPI/P2mBhUrf7+/7IN0qE2QH
X-Google-Smtp-Source: 
 ABdhPJxl10i/oSoTeb7Rh9u8PCpvKbF6Jzz6iVYF0i5hM2h6r/+r5vnvJtUfz6Yjnm+iOQa4P+7svg==
X-Received: by 2002:a63:5051:0:b0:374:5fd0:f131 with SMTP id
 q17-20020a635051000000b003745fd0f131mr6445530pgl.431.1645799294811;
        Fri, 25 Feb 2022 06:28:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 38/50] grub: fix a possible integer overflow
Date: Fri, 25 Feb 2022 04:26:18 -1000
Message-Id: 
 <d15e7cc6fc7de358da2fd1faa8a8ea5bc2fabe98.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162384

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a possible integer overflow in grub's
video/fb/video_fb. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...deo_fb-Fix-possible-integer-overflow.patch | 39 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0034-video-fb-video_fb-Fix-possible-integer-overflow.patch

diff --git a/meta/recipes-bsp/grub/files/0034-video-fb-video_fb-Fix-possible-integer-overflow.patch b/meta/recipes-bsp/grub/files/0034-video-fb-video_fb-Fix-possible-integer-overflow.patch
new file mode 100644
index 0000000000..c82b2c7df0
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0034-video-fb-video_fb-Fix-possible-integer-overflow.patch
@@ -0,0 +1,39 @@
+From aac5574ff340a665ccc78d4c3d61596ac67acbbe Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 4 Dec 2020 14:51:30 +0000
+Subject: [PATCH] video/fb/video_fb: Fix possible integer overflow
+
+It is minimal possibility that the values being used here will overflow.
+So, change the code to use the safemath function grub_mul() to ensure
+that doesn't happen.
+
+Fixes: CID 73761
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=08413f2f4edec0e2d9bf15f836f6ee5ca2e379cb]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/video/fb/video_fb.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/video/fb/video_fb.c b/grub-core/video/fb/video_fb.c
+index 1c9a138..ae6b89f 100644
+--- a/grub-core/video/fb/video_fb.c
++++ b/grub-core/video/fb/video_fb.c
+@@ -1537,7 +1537,13 @@ doublebuf_pageflipping_init (struct grub_video_mode_info *mode_info,
+ 			     volatile void *page1_ptr)
+ {
+   grub_err_t err;
+-  grub_size_t page_size = mode_info->pitch * mode_info->height;
++  grub_size_t page_size = 0;
++
++  if (grub_mul (mode_info->pitch, mode_info->height, &page_size))
++    {
++      /* Shouldn't happen, but if it does we've a bug. */
++      return GRUB_ERR_BUG;
++    }
+ 
+   framebuffer.offscreen_buffer = grub_malloc (page_size);
+   if (! framebuffer.offscreen_buffer)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 8b5b9e3b3e..04c9b4c092 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -80,6 +80,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch \
            file://0032-video-fb-fbfill-Fix-potential-integer-overflow.patch \
            file://0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch \
+           file://0034-video-fb-video_fb-Fix-possible-integer-overflow.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1



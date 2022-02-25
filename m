Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3EEC433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:14 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.6803.1645799293583789461
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vA6SW+lq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id y11so4828523pfa.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UmEFm+PeLKofsBoD5GPzIpJfqv9yZHUopXYH05z+2a8=;
        b=vA6SW+lqamFBwq/T8V0M07+Dg5mTzCtQWQ/9OyzOOLeEXqeCwCfFwEKZP8P7+XJ2V1
         XQuCRjFuqAJdyn3SyMm4Vjux5gyu2hrjRMeOKnFqxRQ296QAH/y64GRLFJ1IGSH1yfn+
         F22qT78SRprEdx5nHi2mvTRLaxdx4OyiwM13HGrelcEd0Yyzc8lpt17YmLsv+wNEY2aK
         CsdCAi4bU7ZJYnnTZXs/grYHMjwBtUCw/g0bgbu/CQ6NL35mdWe59qsThSdiXmpfHpBX
         vMNqe84mueBA+UR+cN8VYvZrzz/hvw3CDyznDnXNeaEz+OpbXA26lt+yqvHfihzcgCE0
         dX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UmEFm+PeLKofsBoD5GPzIpJfqv9yZHUopXYH05z+2a8=;
        b=lCx/YegIwJ0+WhVn3fM5aBlXnq0MgCWqcKS7o3HnZZEokt5aA8ZhT8w5ggLLlGcICu
         v1z9nLmoJYYsZ12iPY11N5xuMd7/QqvFE+P84NWXbhENASg1YhJOrgcEFqphwTALGu/S
         q9kIXIL4pmFExE/D1WRAMQGAmtWeMuwy//PKKSOkBg0BmJdkP+8pk4A8cdRL/6y6VVMa
         Ik3+PdEdr7HbL3eqTA7Ckd32ZWJ91ZKxhVwNi3RcZB2p9Y/Zs0fj3qE40UyoIBjq8q/V
         c8upo3ZNQsHZotg7hQN1Lpw9l+yvEARm04mZ0OGQ6ZIQNfs6HENKzmRP4INieQLRcGTc
         5Pig==
X-Gm-Message-State: AOAM532DrGukZufI88H1jPIDcsJPbxGBgYpU9aEh+w6HF1TZ3vSfhqqT
	2WadBT+ib5qEu6nvJ6fYErx+AOBFP0JH6tVP
X-Google-Smtp-Source: 
 ABdhPJx++RoN4f6TVDKfvqbwpBmR6rFe58W7O0FV01+djzjR6rLPq9CiSpvF93aFLFm3I2IiGQnaOg==
X-Received: by 2002:a05:6a02:193:b0:375:65a5:2fcd with SMTP id
 bj19-20020a056a02019300b0037565a52fcdmr6344765pgb.288.1645799292580;
        Fri, 25 Feb 2022 06:28:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 37/50] grub: fix multiple integer overflows
Date: Fri, 25 Feb 2022 04:26:17 -1000
Message-Id: 
 <68b91792ed00f9decc85f300eefe0b7e8f80c98b.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162383

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for multiple integer overflows in grub's
video/fb/video_fb. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...eo_fb-Fix-multiple-integer-overflows.patch | 104 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch

diff --git a/meta/recipes-bsp/grub/files/0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch b/meta/recipes-bsp/grub/files/0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch
new file mode 100644
index 0000000000..544e7f31ae
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch
@@ -0,0 +1,104 @@
+From 69b91f7466a5ad5fb85039a5b4118efb77ad6347 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Wed, 4 Nov 2020 14:43:44 +0000
+Subject: [PATCH] video/fb/video_fb: Fix multiple integer overflows
+
+The calculation of the unsigned 64-bit value is being generated by
+multiplying 2, signed or unsigned, 32-bit integers which may overflow
+before promotion to unsigned 64-bit. Fix all of them.
+
+Fixes: CID 73703, CID 73767, CID 73833
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=08e098b1dbf01e96376f594b337491bc4cfa48dd]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/video/fb/video_fb.c | 52 ++++++++++++++++++++++++-----------
+ 1 file changed, 36 insertions(+), 16 deletions(-)
+
+diff --git a/grub-core/video/fb/video_fb.c b/grub-core/video/fb/video_fb.c
+index 1a602c8..1c9a138 100644
+--- a/grub-core/video/fb/video_fb.c
++++ b/grub-core/video/fb/video_fb.c
+@@ -25,6 +25,7 @@
+ #include <grub/fbutil.h>
+ #include <grub/bitmap.h>
+ #include <grub/dl.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -1417,15 +1418,23 @@ doublebuf_blit_update_screen (void)
+ {
+   if (framebuffer.current_dirty.first_line
+       <= framebuffer.current_dirty.last_line)
+-    grub_memcpy ((char *) framebuffer.pages[0]
+-		 + framebuffer.current_dirty.first_line
+-		 * framebuffer.back_target->mode_info.pitch,
+-		 (char *) framebuffer.back_target->data
+-		 + framebuffer.current_dirty.first_line
+-		 * framebuffer.back_target->mode_info.pitch,
+-		 framebuffer.back_target->mode_info.pitch
+-		 * (framebuffer.current_dirty.last_line
+-		    - framebuffer.current_dirty.first_line));
++    {
++      grub_size_t copy_size;
++
++      if (grub_sub (framebuffer.current_dirty.last_line,
++		    framebuffer.current_dirty.first_line, &copy_size) ||
++	  grub_mul (framebuffer.back_target->mode_info.pitch, copy_size, &copy_size))
++	{
++	  /* Shouldn't happen, but if it does we've a bug. */
++	  return GRUB_ERR_BUG;
++	}
++
++      grub_memcpy ((char *) framebuffer.pages[0] + framebuffer.current_dirty.first_line *
++		   framebuffer.back_target->mode_info.pitch,
++		   (char *) framebuffer.back_target->data + framebuffer.current_dirty.first_line *
++		   framebuffer.back_target->mode_info.pitch,
++		   copy_size);
++    }
+   framebuffer.current_dirty.first_line
+     = framebuffer.back_target->mode_info.height;
+   framebuffer.current_dirty.last_line = 0;
+@@ -1439,7 +1448,7 @@ grub_video_fb_doublebuf_blit_init (struct grub_video_fbrender_target **back,
+ 				   volatile void *framebuf)
+ {
+   grub_err_t err;
+-  grub_size_t page_size = mode_info.pitch * mode_info.height;
++  grub_size_t page_size = (grub_size_t) mode_info.pitch * mode_info.height;
+ 
+   framebuffer.offscreen_buffer = grub_zalloc (page_size);
+   if (! framebuffer.offscreen_buffer)
+@@ -1482,12 +1491,23 @@ doublebuf_pageflipping_update_screen (void)
+     last_line = framebuffer.previous_dirty.last_line;
+ 
+   if (first_line <= last_line)
+-    grub_memcpy ((char *) framebuffer.pages[framebuffer.render_page]
+-		 + first_line * framebuffer.back_target->mode_info.pitch,
+-		 (char *) framebuffer.back_target->data
+-		 + first_line * framebuffer.back_target->mode_info.pitch,
+-		 framebuffer.back_target->mode_info.pitch
+-		 * (last_line - first_line));
++    {
++      grub_size_t copy_size;
++
++      if (grub_sub (last_line, first_line, &copy_size) ||
++	  grub_mul (framebuffer.back_target->mode_info.pitch, copy_size, &copy_size))
++	{
++	  /* Shouldn't happen, but if it does we've a bug. */
++	  return GRUB_ERR_BUG;
++	}
++
++      grub_memcpy ((char *) framebuffer.pages[framebuffer.render_page] + first_line *
++		   framebuffer.back_target->mode_info.pitch,
++		   (char *) framebuffer.back_target->data + first_line *
++		   framebuffer.back_target->mode_info.pitch,
++		   copy_size);
++    }
++
+   framebuffer.previous_dirty = framebuffer.current_dirty;
+   framebuffer.current_dirty.first_line
+     = framebuffer.back_target->mode_info.height;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 710ab5e361..8b5b9e3b3e 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -79,6 +79,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0030-commands-hashsum-Fix-a-memory-leak.patch \
            file://0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch \
            file://0032-video-fb-fbfill-Fix-potential-integer-overflow.patch \
+           file://0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1



Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3C0C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:54 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.9114.1645178813262102592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oybRagvV;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id h6so13611956wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A97XdPuYf6Q82zKmgid8Vkvy1Y45NM5hVXPS1aZXqaY=;
        b=oybRagvVEnypt7ST67cuadUMP24/55d0uxK4WgZustlGD89CS6WKVbZtlZJyKFaZVN
         D5E1lx2BJ2NlZ6iUWv2BWADRmk/7jRHJW4QjMGNO5X6X1oSvPcHhpQA/mIs3DdtRaecG
         M2PSdB+CC4JjjLcKLrkJyVycMWWuylSgc5m6x3OMTST1EvDsJ6absrCo6suM0nMY7OBs
         Opq0GNL4zY59ywJLORE+HNPlHst9xTwx7nIxL+3LXAHLlwCI25KHBiswe5qB3i4m9TJu
         b+l00C25JurkLR3WPd2LWW6aL98VbB3xsw+cyQD2h0A9kr50iiqxhU5nkriOf1eo04/S
         S9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A97XdPuYf6Q82zKmgid8Vkvy1Y45NM5hVXPS1aZXqaY=;
        b=aE/I1It/cxGuF+5Hh78X4P/wnuwKfePH1xaMPw56q9puiJxXIvRN0v588WCjaLUmEt
         d/pn35Rds37YhzMrTJqNkQ8k5vnhtfNeqvmCrDxXZ1PDy7fEc0QIQ6OwlukXc/d0cAfQ
         ndjJ+H0n8QV9YOKZLiau3yvScE6K5PLlwdZrQThGXC/Gf6BTuoZkoqxu8d54sENcTwnc
         Lxub1O3K8ySzm5eMb+lHSvjOW7p3uc8l/0OCO8JX+bBa0oRfan4b9Mi56dj4oa4rSkyh
         ty3XvWmGsCpImubAhGkgZMMelk9i6ivGGNidRJcYqQSrKIuklGD938CVAH8uKI/5Dild
         GNhA==
X-Gm-Message-State: AOAM531oSKetNANUhRY6z8Lt1UIXM5AViIh5EhBKj70sO/fR/bjN7xnd
	JjY00n/aM525SnZqQixrBko=
X-Google-Smtp-Source: 
 ABdhPJzXNLZ0YHnmC6HSaE6e3aDPyelnsUxGGJNwEjs673JKlfV5uHcxmBTjbzV7cM6APwMRhzVVNQ==
X-Received: by 2002:a5d:6701:0:b0:1e3:3ba6:d2e8 with SMTP id
 o1-20020a5d6701000000b001e33ba6d2e8mr5380180wru.221.1645178811821;
        Fri, 18 Feb 2022 02:06:51 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:51 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 33/46][dunfell] grub: fix multiple integer overflows
Date: Fri, 18 Feb 2022 11:05:41 +0100
Message-Id: <20220218100554.1315511-34-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161921

This patch adds a fix for multiple integer overflows in grub's
video/fb/video_fb. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0



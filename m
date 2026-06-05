Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A1ECD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6278.1780698869470330477
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gMDjmef9;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so1186171f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698868; x=1781303668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gs+wlxpcplb7RQE0SN8nQd14VAaQxp8SC0l6tm/mTw=;
        b=gMDjmef983/JMJwZ3Op3uXP3D2Lj2i9Zc8lOEKhBL8R61qmMiAipK29xlBAotk6evh
         nGXnBQGVl8ekg4iDbbOVYr/KIfhOF+4xXSfFhKxidSylulZc1yHMcckXmdzeU03ZUx9E
         UjuZLWSfLHTx+x8SLYnuC+xt3cU5Nx9ZGkTdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698868; x=1781303668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7gs+wlxpcplb7RQE0SN8nQd14VAaQxp8SC0l6tm/mTw=;
        b=Jbiy88OAl+W3o1oCqczCD/yqlnF4luIBJZm1xtfiwh65mhS09k0vOTNFaCctJ/jcjs
         LSh2RjCZcjNYyOK7gIOmXg8BISMiyn51R7l6HtXPfyREhMd3pXKzY7C0c8HaZP8ztsI4
         Nmxh/1+ZNlvSYLYRG3AAfnFj2ha3L1x6VNu/ad2pduWHLWJdiJpv8lHA+7uC1+n5N+zq
         hMGxz/1KmH72zhnth6QZw9LsBBG/bWZHLvWsU0H5u/9Tzk8yKOtBk+PlThZ05BmYC9Pk
         Ra7sCO9Q67xaUVVLw+q+saljAyh2fjlc10q1uyXNQejCIPjdKT72teUO66t3yvAZEGDC
         AL0w==
X-Gm-Message-State: AOJu0Yxiq2V0/E7d6GTk41cXj4510uoBSQ9FcQjyATyKiFYvEm7mMaVD
	BfxWJT5e96EjtTWBdq8x0sKh1HqnOEbO0P6R2nMqerySXBcTYq5SEvV+uBo2AFzj5kwBjqcNony
	/qIsJ
X-Gm-Gg: Acq92OEhlv8cQDMMRceY34Ih8JSwxOe7RoDosAHJMpuDd8mG2Ugm+XcOeHdiQyu24jL
	Ui86QfmhGCjbkkmmVxAO7qH3JgUFW0fBmYpVoNqUOEvk3xwfrKAyeZ1E8sAWk9xsV1XZTV0ZT1S
	BM6e1FOGloEBtNOm3bPQswGd+FFv+/fgHy4KnwIhlDPgfy4L4DWVgYFIPQrdMod3JS/Kk/Cri5T
	Pm7najr9lp5WGOMZK4mjyQg4SmN0arMBUSfOd1tcxmnnYl2I4pyywFwg9HfDrkubcD+HQhPEfYo
	Y5XnrKqZ0nBjK61+8zweB4HOgaYnc+AM6TVJodJhxIlCJPAHxKwoWGGcmMq0y5PVmoGS2VzHl1E
	4L8yg+hzHyvpEqP4UHzIYpYK62OxDfMKdsRS8Vhk8TJ2BSH3G7DrqQZC/jHUnS7IHrkO5V7MWGj
	INlwz86HiGo5AvstQbX2/fM7bUvfL/bKBEtGLBNu+iDJA/U6jezcg5ISjAIsZG/qBTFcjdtIY6w
	VodyONXg6kDe48G+Hrj767Lq/7pZ/slXtr74Uej4v7C/pUKvg==
X-Received: by 2002:a5d:6910:0:b0:45e:f073:d2fd with SMTP id ffacd0b85a97d-460302ec5b8mr6845575f8f.9.1780698867758;
        Fri, 05 Jun 2026 15:34:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/25] pseudo: Update 1.9.5 -> 1.9.6
Date: Sat,  6 Jun 2026 00:34:09 +0200
Message-ID: <1414f3513099a9a956ec4f602354aa00008e2aff.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238211

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in the changes:

  * Makefile.in: Bump version to 1.9.6
  * pseudo_util.c: Fix symlink processing for symlinkat and related
  * test: Add test symlinkat and related
  * ports/unix: realpath: Fix chroot processing
  * test: Add test cases for canonicalize functions
  * ports/unix: fts_open: Fix chroot behavior
  * ports/unix: fts_*: Certain functions were incorrectly returning stat data
  * test: Add fts test case
  * test: Add test for linkat chroot path stripping
  * linkat: Avoid a segmentation fault
  * Only copy xattrs on a rename if it's cross-filesystem

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50e769a598e79ed4600f7362d5f40799a48f9273)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 3760af2fa4b..839b68d1b72 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "0bad85523ff71f1a84cea5fdf72e7f560c4aeed4"
+SRCREV = "7109ac1b417cd31e0100f6e1c4f3e5743541b9ed"
 S = "${WORKDIR}/git"
-PV = "1.9.5"
+PV = "1.9.6"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be


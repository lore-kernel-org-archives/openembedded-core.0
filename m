Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.1787.1621281171997373367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 12:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y0Y/Du2C;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id l1so10963174ejb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AAbWfZgFzcumHk3JGedNaLZ2tR26yB+UxAFaevN1fuk=;
        b=Y0Y/Du2C1GfGdgjpJYDlTZspHKjF2aXeB4z5EHop1ZsMj6Vq7MweJkB5vkQXN0FGHC
         gLqRfHuNzXnuiAQLpRM0/ElHq/pMgpyekqaKEK0+aGI9tEmp0NzaONy9HeVc8z1mlLa0
         E78L+GjE6uxcxMtLciFqVZZDfBUoGsGwZu5oZkmYwkpz+4IkGn7WrlBsGODlJGN14nXW
         535dahy9lUY3XoAVjopJ/CzWNJtYBbCJDfgZNy1KNT6v2yCfeOzo5yhLP/73coaCVrZB
         4bNQTlnboQq5wGjUE2RbSyU7FeQoQnGNdk89Bg3aNhtrIS6YBoX1uowCKcHc270janI3
         Zucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AAbWfZgFzcumHk3JGedNaLZ2tR26yB+UxAFaevN1fuk=;
        b=QQyzSCHzcRZjQRK6l78FmlJba+iMsSN9mdXSluVfo9zRE8KJRgHCEmHDANlijeluKA
         5zaaXxqKsodgyoVZ9+U+QogtQVqhdKrAOK4fSfW4qMPdWqZR9ULAEK25HHAzyssj1IVI
         Nd3DHLvQQD5hacwuJskqis1Ami3UWao1HEfeyiKbdwFkIyW2w0vXSNVe5dyPQLppR0Df
         /Re1/EWY7P0mA4roS1TM6dXuV6HjwgfcfYpKZWe7ptREpH3BRd9OkpXdDXtco3U/kQ/o
         p2i5FXIJjvx+gUmch1m68eX9LscbaxyKfIi+n3qtNrN7PKIADNJeGBGB0x9gO9NxosIf
         cpyA==
X-Gm-Message-State: AOAM5306AxdCPQEVDYMy4gj0A9K6rXEZHrF05U8IBkpidqHPXHLKx5YR
	t3zyBujWpnm4v8Ij10aUaLRs5u9jqHE=
X-Google-Smtp-Source: ABdhPJyV+JkVU+qlq+hOQSYn9pTKEC6BtPreuxaaacAQPsE/Qf21odJpQ9aZSE2aC6tTLzyDW2Mg9w==
X-Received: by 2002:a17:906:f885:: with SMTP id lg5mr1606650ejb.313.1621281170223;
        Mon, 17 May 2021 12:52:50 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id b12sm9125515ejg.89.2021.05.17.12.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 12:52:49 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] mklibs: drop support for
Date: Mon, 17 May 2021 21:52:29 +0200
Message-Id: <20210517195230.193978-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is not enabled or tested by default, and has never been
ported to python 3 upstream[1], which means it doesn't work at all
with plain poky. If you need it, please put it in a separate layer
and/or modernize to work with py3.

https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample          | 5 +----
 meta-poky/conf/local.conf.sample.extended | 9 ---------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index c27766e901..fb14379d28 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -148,11 +148,8 @@ EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
 # enable extra features. Some available options which can be included in this variable
 # are:
 #   - 'buildstats' collect build statistics
-#   - 'image-mklibs' to reduce shared library files size for an image
 #   - 'image-prelink' in order to prelink the filesystem image
-# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
-# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+USER_CLASSES ?= "buildstats image-prelink"
 
 #
 # Runtime testing of images
diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-poky/conf/local.conf.sample.extended
index c241caa869..a670c74001 100644
--- a/meta-poky/conf/local.conf.sample.extended
+++ b/meta-poky/conf/local.conf.sample.extended
@@ -119,15 +119,6 @@ DISTRO_FEATURES_remove = "x11"
 #
 # TCMODE ?= "external-sourcery"
 
-# mklibs library size optimization is more useful to smaller images,
-# and less useful for bigger images. Also mklibs library optimization
-# can break the ABI compatibility, so should not be applied to the
-# images which are to be extended or upgraded later.
-#This enabled mklibs library size optimization just for the specified image.
-#MKLIBS_OPTIMIZED_IMAGES ?= "core-image-minimal"
-#This enable mklibs library size optimization will be for all the images.
-#MKLIBS_OPTIMIZED_IMAGES ?= "all"
-
 # This value is currently used by pseudo to determine if the recipe should
 # build both the 32-bit and 64-bit wrapper libraries on a 64-bit build system.
 #
-- 
2.31.1


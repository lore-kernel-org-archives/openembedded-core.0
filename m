Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50350C64EC5
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:21:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3128.1675840911843332213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I84jgVIR;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so731024wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xK0dHabTDRA0vl197+8V6wvQljUrdkVyvoY9Zz4wl0=;
        b=I84jgVIRLriYoMCc8vGKI7PktHnUYw8tRfEXb4xiR8QWqZxY+qHd8UoygOvU0c8jUX
         +ncLmDzgo2Cb54m0pRsgLFPPtbSXG/5IGVvaQa62PdzVcN9+2ZIXNzV4oqNfheWqptGp
         IGpCBNF0xphqGg8RxuMtsGmYLybFpn7BF+3EurB5WX5bM6D7urRJqCxBgekrLQ6M7JH7
         Ijoz8uKfWY0lNtuRuPPoGoHfSAlxGaa+cFawNEPpHCHnvy0g6Y9zzpLZ8kk3BFt84Oyy
         EPMD59SC8OEdGp/A//IuzuMJCkmEsm/v+DX95tPBZDGk/RLSqP4sJ3V/jn7elIl1P950
         nohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xK0dHabTDRA0vl197+8V6wvQljUrdkVyvoY9Zz4wl0=;
        b=OtrA8WoU0SXr8TdegsvQdAiGgHfmubhwXdNNxXXb+fNh5PQ3a8nwjuKTbwPygYN/d8
         dKHBcipJKhozPA0yskuBJlTZIKPa28SAE8/xYWJs4qEtHTJfGNLjlDHYa528mXC9i8DD
         7PBBHM2U933lprGD5+pZGquFEBtb1lntaRqCBZl+GZ24YN6Wf60+GQSu1gv6igBMc+eD
         RWovLLsMYAghDNaRYN7YniaHd0gMzG3LxMDa7hel52bHg98AE1wpJLq30KsoHqSCttA1
         iXJ2m0Y17OadRIYr+errsxZ9oJ6wKhdbRjCXRxB46mIW90aXLz5j/FzLDQKznlJ2ranD
         BiXQ==
X-Gm-Message-State: AO0yUKWwJoAGrk3HK0eDoBh02Uma2hXYiF51N2Zz2HyJkqpcLKQu58ys
	RMMsyionRSkjAqmbcMc2+SNByZr6oUU=
X-Google-Smtp-Source: AK7set/KsPpPfcwNwYQ01w0YuvHgcgZTFD/XZO/Ztbs25V6TWm0h+fV3s5xZf8xqs/XdPctJJPGNow==
X-Received: by 2002:a05:600c:18a0:b0:3df:3bd6:63e5 with SMTP id x32-20020a05600c18a000b003df3bd663e5mr5308536wmp.12.1675840910245;
        Tue, 07 Feb 2023 23:21:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/52] xf86-video-vmware: update 13.3.0 -> 13.4.0
Date: Wed,  8 Feb 2023 08:20:56 +0100
Message-Id: <20230208072143.2930292-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176845

Remove 0002-add-option-for-vmwgfx.patch; the original reason has been long resolved:

    Our Mesa doesn't yet ship the XA Gallium state tracker that the VMWGFX
    sub-driver needs, so just disable vmwgfx.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0002-add-option-for-vmwgfx.patch          | 103 ------------------
 ..._13.3.0.bb => xf86-video-vmware_13.4.0.bb} |   9 +-
 2 files changed, 2 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.3.0.bb => xf86-video-vmware_13.4.0.bb} (53%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
deleted file mode 100644
index b37f697aa4..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From da6612659a279bcb02f70622b53a3894fbc11052 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 9 Dec 2016 14:35:45 +0200
-Subject: [PATCH] Add option for vmwgfx
-
-Upstream-Status: Submitted
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 51 +++++++++++++++++++++------------------------------
- 1 file changed, 21 insertions(+), 30 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9f259ce..f3fec57 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -64,6 +64,13 @@ AC_ARG_ENABLE(vmwarectrl-client,
-                              [VMWARECTRL=$enableval], [VMWARECTRL=no])
- AM_CONDITIONAL(BUILD_VMWARECTRL, [test "x$VMWARECTRL" = xyes])
- 
-+# Define a configure option to build the vmwgfx driver
-+AC_ARG_ENABLE(vmwgfx,
-+              AS_HELP_STRING([--disable-vmwgfx],
-+                             [Disable vmwgfx driver (KMS/3D) (default: enabled)]),
-+                             [VMWGFX="$enableval"], [VMWGFX="yes"])
-+AM_CONDITIONAL(BUILD_VMWGFX, test "x$VMWGFX" = xyes)
-+
- # Store the list of server defined optional extensions in REQUIRED_MODULES
- XORG_DRIVER_CHECK_EXT(RANDR, randrproto)
- XORG_DRIVER_CHECK_EXT(RENDER, renderproto)
-@@ -85,11 +92,6 @@ PKG_CHECK_EXISTS([xorg-server >= 1.4.99],
-                  [AC_DEFINE([HAVE_XORG_SERVER_1_5_0], 1,
-                  [Has version 1.5.0 or greater of the Xserver])])
- 
--PKG_CHECK_EXISTS([xorg-server >= 1.7.0],
--                 [AC_DEFINE([HAVE_XORG_SERVER_1_7_0], 1,
--                 [Has version 1.7.0 or greater of the Xserver])
--		 BUILD_VMWGFX=yes],[BUILD_VMWGFX=no])
--
- PKG_CHECK_EXISTS([xorg-server >= 1.12.0],
-                  [AC_DEFINE([HAVE_XORG_SERVER_1_12_0], 1,
-                  [Has version 1.12.0 or greater of the Xserver])])
-@@ -114,34 +116,22 @@ AM_CONDITIONAL(XSERVER_LIBPCIACCESS, test "x$XSERVER_LIBPCIACCESS" = xyes)
- 
- AC_SUBST([moduledir])
- 
--if test x$BUILD_VMWGFX = xyes; then
--	PKG_CHECK_MODULES([LIBDRM], [libdrm],[],[BUILD_VMWGFX=no])
--fi
--if test x$BUILD_VMWGFX = xyes; then
--#
--# Early versions of mesa 10 forgot to bump the XA major version number in
--# the xa_tracker.h header
--#
--	PKG_CHECK_MODULES([XATRACKER], [xatracker >= 0.4.0],
--			  [PKG_CHECK_EXISTS([xatracker = 2.0.0],
--	                  [AC_DEFINE([HAVE_XA_2], 1,
--               		  [Has version 2 of XA])])],
--			  [BUILD_VMWGFX=no])
--#
--# Check for prime.
--#
-+AC_MSG_CHECKING([whether to build Kernel Mode Setting and 3D])
-+if test x$VMWGFX = xyes; then
-+	AC_MSG_RESULT([yes])
-+	PKG_CHECK_MODULES([LIBDRM], [libdrm])
-+	# Check for prime.
- 	PKG_CHECK_EXISTS([libdrm >= 2.4.38],
- 			 [AC_DEFINE([HAVE_LIBDRM_2_4_38], 1,
- 			 [Has version 2.4.38 or greater of libdrm])])
--fi
- 
--DRIVER_NAME=vmware
--AC_SUBST([DRIVER_NAME])
--
--AC_MSG_CHECKING([whether to build Kernel Mode Setting and 3D])
--if test x$BUILD_VMWGFX = xyes; then
--	AC_MSG_RESULT([yes])
--        AC_DEFINE([BUILD_VMWGFX], 1, [Building the vmwgfx driver path])
-+	# Early versions of mesa 10 forgot to bump the XA major version number
-+	# in the xa_tracker.h header
-+	PKG_CHECK_MODULES([XATRACKER], [xatracker >= 0.4.0],
-+			  [PKG_CHECK_EXISTS([xatracker = 2.0.0],
-+			  [AC_DEFINE([HAVE_XA_2], 1,
-+				     [Has version 2 of XA])])])
-+	AC_DEFINE([BUILD_VMWGFX], 1, [Building the vmwgfx driver path])
- 	libudev_check=yes
- 	AC_ARG_WITH([libudev],
- 		[AS_HELP_STRING([--without-libudev],
-@@ -158,7 +148,8 @@ else
- 	AC_MSG_RESULT([no])
- fi
- 
--AM_CONDITIONAL(BUILD_VMWGFX, test "x$BUILD_VMWGFX" = xyes)
-+DRIVER_NAME=vmware
-+AC_SUBST([DRIVER_NAME])
- 
- AC_CONFIG_FILES([
-                 Makefile
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.3.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.4.0.bb
similarity index 53%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.3.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.4.0.bb
index 41612b7f07..d7ba2b9e86 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.3.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.4.0.bb
@@ -7,13 +7,8 @@ DESCRIPTION = "vmware is an Xorg driver for VMware virtual video cards."
 LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 
 DEPENDS += "virtual/libx11 xorgproto libpciaccess"
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
 
-SRC_URI += "file://0002-add-option-for-vmwgfx.patch"
-
-SRC_URI[md5sum] = "08d66d062055080ff699ab4869726ea2"
-SRC_URI[sha256sum] = "47971924659e51666a757269ad941a059ef5afe7a47b5101c174a6022ac4066c"
+SRC_URI[sha256sum] = "aed31ee5ed5ecc6e2226705383e7ad06f7602c1376a295305f376b17af3eb81a"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[vmwgfx] = "--enable-vmwgfx, --disable-vmwgfx, libdrm virtual/mesa"
-- 
2.30.2



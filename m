Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EDAC433FE
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.332.1636573183629304266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nxT1KIX3;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id b12so5924268wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8XewyL6ZC7wvmh9X0zdnkRdBTs9D9RPk1JqM08ddn7s=;
        b=nxT1KIX3pQXDjNOjsg+FWsWglIYPXUT9OGLT2meASok0QJyqfY5MNvgpgmpqf9u2Na
         fkeLu7QFwbG/VznTOSXutDw11iysJSxB7rv5I6xsMGKsrRBzK2yrI3xP3AfXvR2T6W+i
         GEoUqwg4tM158sqgs7gtvPIZfa8YoT0wyRp9ZNpINY9/jJ91fdFTwyM1IDSYPaMLc65g
         p/9O7ZC2Clw9ok6UZSWQ/EwjDokwPV9rlIqo+3lIKadrL+GAA1Gr4/fkoa/V8aBaLMS0
         BuYP6lgmKPiBkSDMNN9CIKIrnABKmdWRQV/7cwVwgrEjJCpKAHzdJLx4mgUuLg4d+9Q3
         Iq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8XewyL6ZC7wvmh9X0zdnkRdBTs9D9RPk1JqM08ddn7s=;
        b=mPN9VRlcVtCp8wOyKt5uDiGLywO62sF1+QKCVVVOL/knuczV3eG+kvCR6J9uY268bg
         vdoxNKct0o2UFJ/qZl1t1Wre9eMEOgwaTAMu04AosHP6FOXgb9XpZfqKe9iO/hWR/RYB
         A6tFyUdb/M3qU3i05WqIrY1ph0Nx9Gg/3twRHlT4Tdu9fqNIcATPFUA4H/BAUMb6rora
         E22g41qjDbCI3xXJKgMzcyHcfPa1K0rupXZIQukxyfGqli/g5g0I9WXybM229Os/2GrD
         tePRfLltCPKm95evtAnS1drhiXmTi2Vyq+0eN4LnCLC6LLGGbAMzAGdW7P19b1QL3s4o
         +nWw==
X-Gm-Message-State: AOAM531YRwhRreOMLuBTgG0VQU0rz/CtCPuA+KUD1pVmZ43PV4bX7A0j
	fzEJaBNgPYb2wU/OXihn21bzmpF2sb8=
X-Google-Smtp-Source: 
 ABdhPJykTdpSK2p6YeoAFHRSZsR+G5j4Jun0usLvMhcpjSLTgCs0qiJfrvVG+rNqWhbxbWWg3dNlvg==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr1797694wrn.318.1636573182271;
        Wed, 10 Nov 2021 11:39:42 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Awais Belal <awais_belal@mentor.com>
Subject: [PATCH 02/24] mesa-demos: drop glx option and patch
Date: Wed, 10 Nov 2021 20:39:15 +0100
Message-Id: <20211110193937.2606747-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158086

As far as I can see the x11 option does the same thing.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0013-only-build-GLX-demos-if-needed.patch | 62 -------------------
 .../recipes-graphics/mesa/mesa-demos_8.4.0.bb |  4 +-
 2 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0013-only-build-GLX-demos-if-needed.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0013-only-build-GLX-demos-if-needed.patch b/meta/recipes-graphics/mesa/mesa-demos/0013-only-build-GLX-demos-if-needed.patch
deleted file mode 100644
index e7be4dfbe1..0000000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0013-only-build-GLX-demos-if-needed.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 322af294390a7f4e1524c5a79312be6cbebce988 Mon Sep 17 00:00:00 2001
-From: Awais Belal <awais_belal@mentor.com>
-Date: Wed, 11 Nov 2015 17:22:12 +0500
-Subject: [PATCH] only build GLX demos if needed
-
-There are platforms that default to EGL only configurations
-in which case the GLX applications are not required
-at all. Allow the user to control generation of these
-demos as needed through a configure switch.
-
-Signed-off-by: Awais Belal <awais_belal@mentor.com>
-Upstream-Status: Pending
----
- configure.ac    | 9 +++++++++
- src/Makefile.am | 6 +++++-
- 2 files changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f8ec7e3..1a4d96d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -132,6 +132,11 @@ if test "x$enable_glu" = xyes; then
-     DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
- fi
- 
-+AC_ARG_ENABLE([glx-demos],
-+    [AS_HELP_STRING([--enable-glx-demos],
-+        [enable GLX demos @<:@default=auto@:>@])],
-+    [glx_demos_enabled="$enableval"],
-+    [glx_demos_enabled=yes])
- AC_ARG_ENABLE([egl],
-     [AS_HELP_STRING([--enable-egl],
-         [enable EGL library @<:@default=auto@:>@])],
-@@ -325,6 +333,7 @@ AC_SUBST([WAYLAND_LIBS])
- 
- AM_CONDITIONAL(HAVE_GLU, test "x$glu_enabled" = "xyes")
- AM_CONDITIONAL(HAVE_GLEW, test "x$glew_enabled" = "xyes")
-+AM_CONDITIONAL(HAVE_GLX, test "x$glx_demos_enabled" = "xyes")
- AM_CONDITIONAL(HAVE_EGL, test "x$egl_enabled" = "xyes")
- AM_CONDITIONAL(HAVE_GLESV1, test "x$glesv1_enabled" = "xyes")
- AM_CONDITIONAL(HAVE_GLESV2, test "x$glesv2_enabled" = "xyes")
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 8b89dee..a4d7e8f 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -44,8 +44,12 @@ SUBDIRS = \
- 	slang \
- 	tests \
- 	tools \
--	wgl \
-+	wgl
-+
-+if HAVE_GLX
-+SUBDIRS += \
- 	xdemos
-+endif
- 
- if HAVE_GLEW
- SUBDIRS += \
--- 
-1.9.1
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
index 368af4e915..01e5b35d0e 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
@@ -17,7 +17,6 @@ SRC_URI = "https://mesa.freedesktop.org/archive/demos/${BPN}-${PV}.tar.bz2 \
            file://0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch \
            file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \
            file://0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch \
-           file://0013-only-build-GLX-demos-if-needed.patch \
            "
 SRC_URI[md5sum] = "6b65a02622765522176d00f553086fa3"
 SRC_URI[sha256sum] = "01e99c94a0184e63e796728af89bfac559795fb2a0d6f506fa900455ca5fff7d"
@@ -27,7 +26,7 @@ inherit autotools pkgconfig features_check
 REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 \
-                  x11 glew glu glx"
+                  x11 glew glu"
 
 # The Wayland code doesn't work with Wayland 1.0, so disable it for now
 #${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
@@ -47,7 +46,6 @@ PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayla
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11"
 PACKAGECONFIG[glew] = "--enable-glew,--disable-glew,glew"
 PACKAGECONFIG[glu] = "--enable-glu,--disable-glu,virtual/libgl"
-PACKAGECONFIG[glx] = "--enable-glx-demos,--disable-glx-demos"
 
 do_install:append() {
 	# it can be completely empty when all PACKAGECONFIG options are disabled
-- 
2.20.1



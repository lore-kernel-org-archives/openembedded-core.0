Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.7862.1589296329498934721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 08:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PchBdEMJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id e1so1955157wrt.5
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jyT46kGfXRqYBzpJImXsf531oySaQUW+vbeNVE/BP4Y=;
        b=PchBdEMJZ9IS5CYBOs/SZNGPXfqTnmijL2nrdBJqm8A5vqGJ7mh54rwqFSEwDRUOG8
         mcPvR8e+8LP2ftq1EVDHWd5k5GuJqaZV95xvdj2hfyWT0cLmEivqkm1pEy9EBJkXLALy
         WEzvLB/6U8ybt9whHSsDtLNuIRJ7fFblWBrcyJd9+p+ptzzchvYsvg9zCbJqmR7Ne05Z
         X0jyN6GUl04ClsINXHKeg+cVajrdOzlMokkMc6ttvmTdqX4CW+mB96qC6xYkzq+P6LHM
         Pm6MtQ4tiVp5ueDBR2LewgJVzcrwdPsCvCKRDBaimUGBhMGf3XcIriDmMk7B7+zTF2uv
         Eg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jyT46kGfXRqYBzpJImXsf531oySaQUW+vbeNVE/BP4Y=;
        b=aDh+tcYuudB7M2nKtJbumO2zCAQ5K+4HiTIpynKcVY/k/sSrLdrHhWiA6aIc/r1vxu
         RhIooH46JUfixTEvULkptDHNRpKJsnXQke3ASjPAeC/2+LvICfctjR+PqxYQI0ZaTY1V
         GUXZcydO/uv9fzQI4MenygCGXVu5GlZmwDOyzVPFWK2PIedRwk8WXsX7wztCbVQ64Gye
         sSNQLDXhmcy1i1gSwUatY8bdpenHf9NGx3h4xhqJHXKbJrDk3IAuGMTBSLKcwmbrk62j
         BkP51zLVfDVpzZrTH000rZovKvOeJ/hjfyxPxYCZZJfGEeKnXXu6as4YWXA2N/BPmWAh
         qlhw==
X-Gm-Message-State: AGi0PuZAxlTtQcB5aD4gtCg9+Px3rkMFShZtHBmncPX5vacgAWOyLGDn
	bIkaN7ilwHLN7TQPhNgq4zXSC7E3
X-Google-Smtp-Source: APiQypIrHrhtEvGFb/xn4lqiXgNK4XyqvOIu0yTWk+/lcCq0DNWbfhH0wpGyN2/ohW/X2phvxtL1fw==
X-Received: by 2002:adf:e751:: with SMTP id c17mr27006552wrn.351.1589296327700;
        Tue, 12 May 2020 08:12:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id y10sm20520193wrd.95.2020.05.12.08.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 08:12:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
Date: Tue, 12 May 2020 17:11:23 +0200
Message-Id: <20200512151125.30472-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will allow better control over native virgl/qemu configurations.

Adjust gtk+3/cairo native configurations to actually ignore opengl
when building for -native: we do not need it, and it would cause build
failures as only a limited subset of mesa-native is currently built.

Drop native/nativesdk overrides from virglrenderer/libepoxy recipes
as opengl feature is now correctly set for those variants.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/bitbake.conf                                     | 4 ++--
 meta/recipes-gnome/gtk+/gtk+3.inc                          | 2 ++
 meta/recipes-graphics/cairo/cairo_1.16.0.bb                | 2 ++
 meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb           | 2 --
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 --
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdade79abe..f7700f1191 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -833,8 +833,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 5d1f59ea1a..6154154004 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -46,6 +46,8 @@ do_compile_prepend() {
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)}"
+PACKAGECONFIG_class-native = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
 PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
 # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index b772c2ece2..092c77b826 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -42,6 +42,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
                    trace"
+PACKAGECONFIG_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
 PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
index 0782c6ce35..6646ef79fe 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
@@ -19,8 +19,6 @@ UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 inherit meson pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-REQUIRED_DISTRO_FEATURES_class-native = ""
-REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
 
 PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
 PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11 virtual/libgl"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index 1046b8504f..29b12628d0 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -22,5 +22,3 @@ inherit meson pkgconfig features_check
 BBCLASSEXTEND = "native nativesdk"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-REQUIRED_DISTRO_FEATURES_class-native = ""
-REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
-- 
2.26.1


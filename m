Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.1142.1587841250757942824
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 12:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t+am730i;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id x4so14983977wmj.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UpC/95UN1XA89tlQQUzoeYplFk8/88MTwAZj9xQ1VJ4=;
        b=t+am730ivqcQ82vPv5KoXJ6qlhgQbMTqOFLjD7LKlxzZZgjXPqtxLhTy3cgZkGUet0
         0x4+6QfquylCpsf7WHL2RAorWaKG7nwcxyUvULETEMlL8Fx14lagyOb5g/huwhhPnl4U
         vXBntkH582d6QHbbUSVyukgAEvu3WbPoGfX36Q2/nDrF6p23WLYR8wpcWy8uHCP936D/
         rxPX6DodbZ53uuBYVSx1/qk+xC7A6frJpRiYvoQUF1jj8TUV2nNXUjm219PvSYWsqvPR
         jWQrQqgRgfEiCJHPZcrF6sInnzwC110UZ0Bp/EQZVjB0JbWvhfTTeLpW+u9gcGBWuev8
         iOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UpC/95UN1XA89tlQQUzoeYplFk8/88MTwAZj9xQ1VJ4=;
        b=by/lrBQAHrq37bdFTXmvBvocmADQbuywJS8iJ7POmuqFnPrDdYPD9GDy1g8GmiWO3I
         NkAK8iF5yipSTuim/cRIm3NSXVTe8Aj5x6+cljvA5tUnD1vB50Bl+6ZbO5XkF0EdGD62
         ozt+jr9TJxkB+KPctHsu/4N7g/6DyFPOq3ITNb7Xp6j40XymsuMAPxTWjDEFXYItELNg
         Q/cV6tFBV4QnXi148RnYfg5zCosMtF+GcwrI3JTyELq8vgfL9ml+e7b5sVt2dB3Hm5FA
         PWRk0HI5k9IX83hrkD5MFm41CXIhGd1kZK7doI0TZ2bpaWFPG3DYv/b5b+3CMYU1nO8b
         1irQ==
X-Gm-Message-State: AGi0PubG/fVMJr0+XZQyqXYMvrMvdEw4lUofDQbqagVtl4VoRp+vr94o
	/JKvcDud7yLPd9qS8/cTZoMpVm/o
X-Google-Smtp-Source: APiQypJgs7WUlnK9btDd0GKD91VZaUiJCcxDBXtdOga50clzPr8q2htQVQb59MG7HahkVEgy2PFAxg==
X-Received: by 2002:a1c:5448:: with SMTP id p8mr16826128wmi.173.1587841248960;
        Sat, 25 Apr 2020 12:00:48 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id n25sm3494135wmk.9.2020.04.25.12.00.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 12:00:48 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
Date: Sat, 25 Apr 2020 21:00:16 +0200
Message-Id: <05d961392eb30920f441731f662ba0dd6a6bd5db.1587841042.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <cover.1587841042.git.alex.kanavin@gmail.com>
References: <cover.1587841042.git.alex.kanavin@gmail.com>
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
index 4b544a22cd..6f3536eff4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -829,8 +829,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
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
index af9867407e..1aa850d004 100644
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


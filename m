Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id E9C877FD95
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 15:38:00 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id g17so3595732wro.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 07:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5eOCuC7hERNo+AjprtSgaMWYBTiX+h+jCnT0cnN0L7Q=;
	b=hBorizMJNbKrJwAEM79Oq6o4lgNgJsP8kbvek5ouYdbSDM/w1uadH2S0GLo4B4Hqga
	3Yt0IDE3VSp9NfFQyJ70W4H/grTGHEu5/tddLLY0iSs9/SWfuHBfIGiF3HPH0AcfAi6O
	HpBrvvb1uhQZuoFxKhusFcJH3gijXiWV6qaLdoQtONElfNML9njjngNXDEENNG4pdz1m
	cpOiQiGO6bEgJStwHHiH8tRF/o8auT99T9A2RGZPn9lVx255zVsZUlbWpfMiPgVhwqnl
	qWT3yJE5BHYfWIBY5TAV7fwYQMOcRoBJ7Hv7CuUJu3+t6iDn0ncnyHmB691ld/TNmuGi
	Gpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5eOCuC7hERNo+AjprtSgaMWYBTiX+h+jCnT0cnN0L7Q=;
	b=hcYSbhjgaLQ3cRfDm1nX0hdqX+3BiDaLL7FK3NjVY/jZGcb2MK0llxIwu59YFHQk3B
	0Hx3vJs47KRKSx5KXpeTLiHZi8c05WJWSz7ilgq/FzYuTaiMvO16534WvFZCRmEBOufI
	nXAmJFyviC0WjIJlNj70Q2PFC4qvuAW8L2e/qO/+iXyD1dwvf+7dOt5Y/auA8SsaioSU
	27jFYE0lZ+qgAQMuxxOLMQhQ0+7pPBM28KnxLKMOIZcuJeaI2CLG0BA2CnRYl9jvR0mr
	3NBKQveLgM9cTfrsCb0wQvYHZI38z17QA9mFcKzc3AmvZnRCSp+ASLHhHl03TA5MBPtj
	LMkA==
X-Gm-Message-State: APjAAAXpaNnKOJq1rpObblLe6S4RzGUtedoBlnMUl1mRHb+U/gjo/qxe
	9MaUPpC/Dtdm/gtnvirHkmEFoaQQ
X-Google-Smtp-Source: APXvYqx8cZu2wnOfDJfWbBTKmpLYcGxvbrUoBYqXwVK8vYEzJzO92hZX7ls63xF09HApq5MpMW1fnA==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr17869951wrr.82.1579793881451; 
	Thu, 23 Jan 2020 07:38:01 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	t25sm3152466wmj.19.2020.01.23.07.38.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 07:38:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 16:37:53 +0100
Message-Id: <6782a0af5e506f5f32c2668885a67ccd5cd83471.1579793597.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579793597.git.alex.kanavin@gmail.com>
References: <cover.1579793597.git.alex.kanavin@gmail.com>
Subject: [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2020 15:38:01 -0000

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
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb | 2 --
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2da7c5849a9..15485ae88b2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -825,8 +825,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index e1f1e0db314..e525a471efa 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -47,6 +47,8 @@ do_compile_prepend() {
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)}"
+PACKAGECONFIG_class-native = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
 PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
 # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index e3de3f6164a..dcca6c1a311 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -41,6 +41,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
+PACKAGECONFIG_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
 PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
index af9867407ed..1aa850d0043 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
@@ -19,8 +19,6 @@ UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 inherit meson pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-REQUIRED_DISTRO_FEATURES_class-native = ""
-REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
 
 PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
 PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11 virtual/libgl"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb
index 133618844a9..deaac5e965c 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb
@@ -22,5 +22,3 @@ inherit meson pkgconfig features_check
 BBCLASSEXTEND = "native nativesdk"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-REQUIRED_DISTRO_FEATURES_class-native = ""
-REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
-- 
2.17.1



Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id E248F7D132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:16:40 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o10so5317385wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2pW1sP5Y6dJl/qR8DXmukLkXsSa4vAFR7o3nz0mf24A=;
	b=qnj/HbHtdHlh/qbn5xhVaVIzstd7yOq8Ig7mdPCDlB7+DzrA4gq7NDy+f434Z2/905
	ta/c8eSiANdj8MYOYTAppHLtNP4Cyu1Bw8yz73okjv+9SKDLAqGTH99h0WH8zbYNI978
	rIy7rIzW134Kw78/jDEj8oAcZZGihiilw5+skpISJJkvwwyoHWm9qS20GuZ7gSIKbj2Q
	4Uh3bF82/GM8PMIh6hp0N8jcixl5jRZq6Xdjep2CX8sNiSNu4qwW3EVMnaksEHLvRggz
	Bz5MUFjUVsfPxZTwD5nRHjwjq7Wl3wK3LZ65kGG1MPWsDb6afPJfiHApjNA9/5oSFcv7
	+r2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2pW1sP5Y6dJl/qR8DXmukLkXsSa4vAFR7o3nz0mf24A=;
	b=Tm8tslu4Xbh6Xlm7+CtzNREdWyuY7G93Os1ZL6nzedkIugpz+tJUfotvnO3MF1fYBH
	5z992HZ2y+ZyHTROSQD4X3Ri0a8+F6bDdyqZhmTI+bX1+souz7wZ26bwWIsYvzqvjLWc
	QZNk9HXnsrtmnc5b8Wl0JXx0D1pMk23eCHgx0jetlYVIKW3NNNFnm3z15rdJkkQD2aNY
	Qo1yHA+99D1itPn03eWMkXGOAKGDGLQRu1OT+X9cnUuFjR6ZgNs9t7fYzfjSowscivHa
	36QfoNZl+Ph3JC3zAhcKaAXh/F40W1xbYshMQfQLJPec/NQWU6IMyo1pnPDsyFoIxvVE
	I9rw==
X-Gm-Message-State: APjAAAWFHmLHx99oBAo3RrNjfi0hZ0jIPu/JJwXPFnF2HOuJDqRJpqjP
	WhZaQM+5e6BRd1pIgLN/E0IDmOoFkEs=
X-Google-Smtp-Source: APXvYqyepvNwGjAdorogiJ0wy/W86iLrpu7hEdCkDY54XuFLDau+oz/YxYErHfaIxP/PpJns8Ux1vQ==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr1173997wmi.57.1553707001303; 
	Wed, 27 Mar 2019 10:16:41 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id x84sm873848wmg.13.2019.03.27.10.16.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 10:16:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 18:16:26 +0100
Message-Id: <20190327171633.34697-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/8] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
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
X-List-Received-Date: Wed, 27 Mar 2019 17:16:41 -0000

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
 meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb           | 2 --
 meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb | 2 --
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7f8b043cc45..b64252eac94 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -833,8 +833,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 77b6c31536b..2f9e05b1cd4 100644
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
index c2628ae0ca0..e875180f6e6 100644
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
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
index dd706a96063..66e8b476dcc 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
@@ -14,8 +14,6 @@ UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-REQUIRED_DISTRO_FEATURES_class-native = ""
-REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
 
 PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
 PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
index 225a0b8b0c9..b1dfb85c49e 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
@@ -18,5 +18,3 @@ inherit autotools pkgconfig distro_features_check
 BBCLASSEXTEND = "native nativesdk"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-REQUIRED_DISTRO_FEATURES_class-native = ""
-REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
-- 
2.17.1



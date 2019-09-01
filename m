Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 48B957ED2F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 20:36:44 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id c3so11939465wrd.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 13:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fh8sGIGKWakqtc9nsHCn0iZMRsHezxXlgfbgURJZQ1c=;
	b=K/5FMBB11cMOziWM6Fbx2WwpVRk/5tuvHRo8Sed+j29zpiuuok+gjuU5WbOEh1lZVh
	1TboTaiFWy65j2pSYB1Bde+hMMtbOZNC7sV30xW8eTWCK9iqly4TMmwDcDVHgNuM3FEq
	6AsDT+uEdi2T3aDSBGtHNaasSKG6LVnNTYTSh3kAstelMP2FA/L8Vu0cRSydwcp5teug
	WixH0T8oip+zQe5+B7hTvjTkaiaJEJJ7Un8PmIyxDwTj98/OaHRZd+NaY8LHq1xG+AFy
	HQtm3Pi6S8884+rVh6flCQjG1XLxBoZJOjpf8qUWB+qqJmZ3oSnXRX/ZUX3ebKiWVDw6
	RFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fh8sGIGKWakqtc9nsHCn0iZMRsHezxXlgfbgURJZQ1c=;
	b=TgUI5aVfaJ4VP7kEf86OyiOSjZ5N1OIhxRgZHfvZl7Pga7+BREhxLLr4v0CxTSbjMn
	hnixxjgd+ObaOvlOuCw3n3lHR83icjZuV37t5Ko4cZJJn84jgRBwN9stcSPbQgYugEQQ
	Ib3Cg3Qu9GbmkKVHo43q4/m0lRZVbpSEY7wSSUVUItK5uVxfQElWWAjpcT7LURvfu3pX
	iGIfYwWNR775942FB96aXYCHwxn4vn16Z89lr8jwGj30fV/Z1309D5+uI7Ahn/6bNWnE
	aXu9IkFasvOM3n/purgnh8dXS4Y/1kjnAeKvGhMhqDDoJ+q8xyUCgowPz2rxCMmzNbyl
	94kg==
X-Gm-Message-State: APjAAAV/br6MUJuA4i6UkL8NULGxWd+NZtHKJB1Pz35WPpwTfALEXBsK
	pPBYihOvVvMJwtIYbWbK+oD49vYr
X-Google-Smtp-Source: APXvYqxmuFcjmnkX43XY9ZlVneuA4+52Cy9YYZuXSUQ6MdGDflGyBrkh307RNckF/dqsYBjo64Glmg==
X-Received: by 2002:adf:fe0f:: with SMTP id n15mr11151249wrr.343.1567370204662;
	Sun, 01 Sep 2019 13:36:44 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f6sm25876192wrh.30.2019.09.01.13.36.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 13:36:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 22:36:31 +0200
Message-Id: <c01dbe93bc173043de6b555042495a5e07f32530.1567369258.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567369258.git.alex.kanavin@gmail.com>
References: <cover.1567369258.git.alex.kanavin@gmail.com>
Subject: [PATCH 1/5] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
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
X-List-Received-Date: Sun, 01 Sep 2019 20:36:44 -0000

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
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb | 2 --
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a0a7f4911e0..d36f4c6ccef 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -824,8 +824,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
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
index f32e9ba1bcd..84c7b0adde9 100644
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
index c8d1650c637..5d7639a929e 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
@@ -14,8 +14,6 @@ UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-REQUIRED_DISTRO_FEATURES_class-native = ""
-REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
 
 PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
 PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
index d2b11c103a3..65365eb900a 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
@@ -17,5 +17,3 @@ inherit autotools pkgconfig distro_features_check
 BBCLASSEXTEND = "native nativesdk"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-REQUIRED_DISTRO_FEATURES_class-native = ""
-REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
-- 
2.17.1



Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id C6B2A613DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:18 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t3so1962521wru.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RGDxX87A9AXOYHgC+nHJbWppTbYjSJWu98zgcLwgpt0=;
	b=GRup0xPF7jhXBjExEv4Da0J7e7dLE7XFw+7ZtdVIIsIi121MInq+Xdw8q90KsASncm
	pKUUnLNZgmTTWnYeLhKs/vHKM9BR3Tmb2O5gBxEfRPwc9JJ9J5v2//NHC7HHpyITQ3Nt
	hGshZyNdeJi7qEYEoyWy1ScwuhGmFpKP0XrNCHqO9CCxbE9pfe1niEOF3rwroKA7Zzug
	wpCHpZElAQHl4ugDG7VpGZ54+xyI0Kp8ZER799ImjiQcdTb0W4XHSdIZA3C6A2o8z8uI
	3Leg0Y3MqdhSjaJZE0Eno/gnLQQL90ROi/r9hZkys0Y8e8p//FiDkTWw+KyAnJwYdGTt
	I02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RGDxX87A9AXOYHgC+nHJbWppTbYjSJWu98zgcLwgpt0=;
	b=FFU0/hToahoUy7+hdOH34aZmtSoNGNR1ej3ZgwZzSj5PYJR3dxKTakzNLOxAbnPn7w
	w3tlGZMVh7xeyBIL1vtGgLRr/pKyfsoHcm1BM5BawWC0JN6TjmfTd+USrpg+Ng8k//91
	BcEghKLiXtcHieOdgoQJph4n81dnz7dZEafb8UgAGWwvR/Il3mBZ3c9Tw39WT23mkW2/
	hSBOrZi02hSpoGR40SUYWjU32DmD+VEioJhZBG9bvoq+9EhUBl/a+krk1olvhMmUjTU6
	R5NbkBNTOhXH4wjwBODHpF8ZOjXGMyJn2DMdXMtA/IbornZbbA1yktqxsq4892CYbHgG
	ZiRA==
X-Gm-Message-State: APjAAAU17d8sPY2oBb6xOolIqqYCroD+mygbeeD/uroo4sNNwsR4+QXo
	exptcKZrOUIqtFYTEMCetSjkZdVa
X-Google-Smtp-Source: APXvYqxqEHmTbhcjP3qHhHYq6Hc/07qXTHjKbvcAL/j8ELc8Mdaw6qMCNgk01A7ygyIHx6dqXXH1Ng==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr39756762wrn.152.1582141699270; 
	Wed, 19 Feb 2020 11:48:19 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:43 +0100
Message-Id: <20200219194752.7967-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/13] wayland: convert to meson build
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:20 -0000
Content-Transfer-Encoding: 8bit

Replace an autotools-specific .pc adjustment patch with a meson-specific one.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...hardcode-the-path-to-wayland-scanner.patch | 26 +++++++++++++++
 ...-the-native-wayland-scanner-directly.patch | 27 ++++++++++++++++
 .../wayland/wayland/fixpathinpcfiles.patch    | 32 -------------------
 .../wayland/wayland_1.18.0.bb                 | 11 ++++---
 4 files changed, 59 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
 create mode 100644 meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
 delete mode 100644 meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch

diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
new file mode 100644
index 0000000000..2199548bdf
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
@@ -0,0 +1,26 @@
+From cbb28635a1079d68e62dbaa1e21791a20dbbbaf4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 17 Feb 2020 21:46:18 +0100
+Subject: [PATCH] Do not hardcode the path to wayland-scanner
+
+This results in host contamination during builds.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 294aee0..7e410fa 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -49,7 +49,7 @@ pkgconfig.generate(
+ 		'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
+ 		'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
+ 		'bindir=' + join_paths('${prefix}', get_option('bindir')),
+-		'wayland_scanner=${bindir}/wayland-scanner'
++		'wayland_scanner=wayland-scanner'
+ 	],
+ 	filebase: 'wayland-scanner'
+ )
diff --git a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
new file mode 100644
index 0000000000..f98037a850
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
@@ -0,0 +1,27 @@
+From 2582d2653ba80917d7bc47088e1a5f49530fddaa Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 16 Feb 2020 16:29:53 +0100
+Subject: [PATCH] meson.build: find the native wayland-scanner directly in PATH
+
+Otherwise, meson attempts to use the target pkg-config and fails.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/meson.build | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 3e8c9bf..294aee0 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -55,8 +55,7 @@ pkgconfig.generate(
+ )
+ 
+ if meson.is_cross_build()
+-	scanner_dep = dependency('wayland-scanner', native: true, version: '>=1.14.0')
+-	wayland_scanner_for_build = find_program(scanner_dep.get_pkgconfig_variable('wayland_scanner'))
++	wayland_scanner_for_build = find_program('wayland-scanner')
+ else
+ 	wayland_scanner_for_build = wayland_scanner
+ endif
diff --git a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
deleted file mode 100644
index ad3526d984..0000000000
--- a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Fix wayland-client and wayland-scanner pc files
-
-Upstream-Status: Pending
-
-Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
-
-Index: wayland-1.14.0/src/wayland-client.pc.in
-===================================================================
---- wayland-1.14.0.orig/src/wayland-client.pc.in
-+++ wayland-1.14.0/src/wayland-client.pc.in
-@@ -1,7 +1,7 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
- datarootdir=@datarootdir@
--pkgdatadir=@datadir@/@PACKAGE@
-+pkgdatadir=${pc_sysrootdir}@datadir@/@PACKAGE@
- libdir=@libdir@
- includedir=@includedir@
- 
-Index: wayland-1.14.0/src/wayland-scanner.pc.in
-===================================================================
---- wayland-1.14.0.orig/src/wayland-scanner.pc.in
-+++ wayland-1.14.0/src/wayland-scanner.pc.in
-@@ -2,7 +2,7 @@ prefix=@prefix@
- exec_prefix=@exec_prefix@
- datarootdir=@datarootdir@
- pkgdatadir=@datadir@/@PACKAGE@
--wayland_scanner=@bindir@/wayland-scanner
-+wayland_scanner=wayland-scanner
- 
- Name: Wayland Scanner
- Description: Wayland scanner
diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
index 7a3f075552..a702b3f6cc 100644
--- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
@@ -13,20 +13,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 DEPENDS = "expat libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           file://fixpathinpcfiles.patch \
+           file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
+           file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            "
 SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
 SRC_URI[sha256sum] = "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-inherit autotools pkgconfig
+inherit meson pkgconfig
 
 PACKAGECONFIG ??= "dtd-validation"
-PACKAGECONFIG[dtd-validation] = "--enable-dtd-validation,--disable-dtd-validation,libxml2,,"
+PACKAGECONFIG[dtd-validation] = "-Ddtd_validation=true,-Ddtd_validation=false,libxml2,,"
 
-EXTRA_OECONF = "--disable-documentation --with-host-scanner"
-EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
+EXTRA_OEMESON = "-Ddocumentation=false"
+EXTRA_OEMESON_class-native = "-Ddocumentation=false -Dlibraries=false"
 
 # Wayland installs a M4 macro for other projects to use, which uses the target
 # pkg-config to find files.  Replace pkg-config with pkg-config-native.
-- 
2.25.0



Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id D5B9B60B59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 22:49:37 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id z1so253567iom.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KsQP+cGVYuXmCUYz64IGlZDk9nOE7+IMmkZgOebeCG4=;
	b=smDBAd/UyDDtepNed4elWQIRMwjp4/5p3wsL/EfyNXvQzSUZENXRRszEE9i745Pf+M
	PMWSwTP4/2DPhEO+CgnaFNcRjIFcRBlpXY+cUHWQFHZmr24MhUh7EtOYYdurXZzuGcW7
	957upIhdxKLS34bW9uFH6bKwAR4GvHVdQO8APsY7i9aZiEiwLr6wDZB2G3ZWaNxPGVvA
	lo1uERPIied1E7O86JAp+Eez+z43n20IEEK8AN4W2FZ2JHNAteoBWxhFKNfViPOJtKmx
	0Cg0pxvyZjJFXzQQK857fnCCKJ3V15B63TPM+oTbhpNu7yhMKXrsUEStOCsceddqwIxh
	e0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KsQP+cGVYuXmCUYz64IGlZDk9nOE7+IMmkZgOebeCG4=;
	b=jm/tfF7xSpKgBXYkmjOOGUUXLZ1u2pa45xi2laBrplaxUGmno6oiaYEsCmAxLstmmf
	Px9+QAe7nLM1nFPxriglo/c/42dkL6RCK+vAysuREOl0UuJm+HLQLCkxVI5IeV4pc+Nl
	Hf1jBQubfSgdmAlpTG2jM9/tls8yjWV2m99gVa1qpluKfDWIOsXR4XwOKcZDd3XI8jjv
	GMl+wBBhKB3CrIfSt864BkhdZGnxNZqWcIhY/pXGD+O4kPhs9W/Ny/5sB7DMQB2zaJWw
	eBjh03TDI5nkgGpqsnrImV/GAdZ2k3YX3oi7sRAhwTgWy+mV9rj9XEmxWpQ7vuqNcwFb
	5usw==
X-Gm-Message-State: APjAAAW/owjyRjoe3IxcnV3kfhwqUyWJ/uV2IpBioJestbmCjq2Ua5wt
	+WlrkD9gTvg3Nf5bcwKolOLGFod3QNU=
X-Google-Smtp-Source: APXvYqwubQxKqJ24ESDP7TWGA+hoFhrZ6TZM2Ew3xxow84/z5eUtkteXQ7f1JUo1DlydAkv2hs1L3A==
X-Received: by 2002:a6b:e506:: with SMTP id y6mr1705766ioc.209.1582238978713; 
	Thu, 20 Feb 2020 14:49:38 -0800 (PST)
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id n26sm203886ioo.9.2020.02.20.14.49.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 14:49:38 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 16:49:31 -0600
Message-Id: <20200220224931.6390-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] wayland: Fix strndup detection on MinGW
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
X-List-Received-Date: Thu, 20 Feb 2020 22:49:39 -0000

Applies a patch to fix strndup being detected as present incorrectly
when building for MinGW.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...build-Fix-strndup-detection-on-MinGW.patch | 39 +++++++++++++++++++
 .../wayland/wayland_1.18.0.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch

diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
new file mode 100644
index 0000000000..e445838750
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
@@ -0,0 +1,39 @@
+From e6783c99f051c6d8252db5f388d805cef0e16357 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Thu, 20 Feb 2020 15:20:45 -0600
+Subject: [PATCH] build: Fix strndup detection on MinGW
+
+GCC and meson conspire together to incorrectly detect that strndup()
+exists on MinGW as __builtin_strndup, when no such function exists. As a
+work around, meson will skip looking for __builtin functions if an
+'#include' is in the prefix, so add '#include <string.h>' when looking
+for strndup().
+
+See: https://github.com/mesonbuild/meson/issues/3672
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayland/merge_requests/63]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 26b084f..c05d019 100644
+--- a/meson.build
++++ b/meson.build
+@@ -36,11 +36,11 @@ have_funcs = [
+ 	'posix_fallocate',
+ 	'prctl',
+ 	'memfd_create',
+-	'strndup',
+ ]
+ foreach f: have_funcs
+ 	config_h.set('HAVE_' + f.underscorify().to_upper(), cc.has_function(f))
+ endforeach
++config_h.set('HAVE_STRNDUP', cc.has_function('strndup', prefix:'#include <string.h>'))
+ 
+ if get_option('libraries')
+ 	ffi_dep = dependency('libffi')
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
index a702b3f6cc..6a6e7495b5 100644
--- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
@@ -15,6 +15,7 @@ DEPENDS = "expat libffi wayland-native"
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
            file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
+           file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
 SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
 SRC_URI[sha256sum] = "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
-- 
2.17.1



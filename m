Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id E11E560B60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 13:10:08 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id q58so8626571wes.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 06:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=i5DX7jKti40buYvOrz+M1XztXt4NM2Oj3x3Dqg+JUkw=;
	b=XjhVR9qLEIEZJHUXcDK74nmAZddDNxhsmii4CKK4CiOlO9qQP2MO6x+XSFnUthNTcp
	Gkk81vdldWKSAJnGLwRFlHF8n3+Q4O7TwBFKanKMKMKJYsHRyMBQLFicbRzzW7BvT7Jn
	POgWdXD1836eWSa2xwnKj1PYOKw/3VUCrjKswYyng+uZBFaQw056UjKBZhqWC+6UnNr7
	m9JbFpYTleUH4tJxi4cnSFXV7KWiHMP8dufFVOCiF8tGVNfhW5Orgawnzs4Bo5d3SDDz
	BayBqv96FU5szGuUX+LTIsmoTol+lZj2p+8lK4sc1O0gZrUsjBEUWg6lK5/hZnexbIm/
	KuVA==
X-Gm-Message-State: ALoCoQnCI5Iy5Gf8x1M+gzAbubkZdmAteSoLqQ3JeHXXc20CFY3XjdRYoc+I4ziuMBzbh6ptvNWE
X-Received: by 10.180.39.134 with SMTP id p6mr19670623wik.9.1381842609689;
	Tue, 15 Oct 2013 06:10:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dl10sm9165wib.1.2013.10.15.06.10.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Oct 2013 06:10:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 14:09:57 +0100
Message-Id: <1381842600-11342-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] wayland: upgrade to 1.3.0
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
X-List-Received-Date: Tue, 15 Oct 2013 13:10:10 -0000

wayland-scanner now uses pkg-config instead of hard-coding paths, so edit the
script to use pkg-config-native.

Based on work by Ewan Le Bideau-Canevet <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/wayland_1.1.0.bb |   39 ------------------------
 meta/recipes-graphics/wayland/wayland_1.3.0.bb |   36 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland_1.1.0.bb
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.3.0.bb

diff --git a/meta/recipes-graphics/wayland/wayland_1.1.0.bb b/meta/recipes-graphics/wayland/wayland_1.1.0.bb
deleted file mode 100644
index a71402e..0000000
--- a/meta/recipes-graphics/wayland/wayland_1.1.0.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Wayland, a protocol between a compositor and clients"
-DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
-as well as a C library implementation of that protocol. The compositor can be \
-a standalone display server running on Linux kernel modesetting and evdev \
-input devices, an X application, or a wayland client itself. The clients can \
-be traditional applications, X servers (rootless or fullscreen) or other \
-display servers."
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
-                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
-
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d2dc9398a83692cafc16eba6e45f85d8"
-SRC_URI[sha256sum] = "2ef587cf1a0e52b6dee44eeb9c288110e8180819abf4e419d247dfe234867a5c"
-
-SRC_URI_append_class-native = " file://just-scanner.patch"
-
-inherit autotools pkgconfig
-
-# We need wayland-native for the wayland-scanner utility
-BBCLASSEXTEND = "native"
-
-DEPENDS_virtclass-native = "expat-native libffi-native"
-DEPENDS = "expat libffi wayland-native"
-
-EXTRA_OECONF_virtclass-native = "--disable-documentation"
-EXTRA_OECONF = "--disable-documentation --disable-scanner"
-
-# Wayland installs a M4 macro for other projects to use. This M4 macro includes
-# a path to a Makefile fragment to get the rules to generate stubs from protocol
-# description files.  The paths to the sysroot end up incorrect, so fix them.
-do_configure_append_class-native() {
-  sed -e 's,@prefix@,${STAGING_DIR_NATIVE},g' \
-      -e 's,@exec_prefix@,${STAGING_DIR_NATIVE},g' \
-      -e 's,@bindir@,${STAGING_BINDIR_NATIVE},g' \
-      -e 's,@datarootdir@,${STAGING_DATADIR_NATIVE},g' \
-  ${S}/wayland-scanner.m4.in > ${B}/wayland-scanner.m4
-}
diff --git a/meta/recipes-graphics/wayland/wayland_1.3.0.bb b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
new file mode 100644
index 0000000..212e08a
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Wayland, a protocol between a compositor and clients"
+DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
+as well as a C library implementation of that protocol. The compositor can be \
+a standalone display server running on Linux kernel modesetting and evdev \
+input devices, an X application, or a wayland client itself. The clients can \
+be traditional applications, X servers (rootless or fullscreen) or other \
+display servers."
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
+                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
+SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
+
+SRC_URI_append_class-native = " file://just-scanner.patch"
+
+inherit autotools pkgconfig
+
+# We need wayland-native for the wayland-scanner utility
+BBCLASSEXTEND = "native"
+
+DEPENDS_virtclass-native = "expat-native libffi-native"
+DEPENDS = "expat libffi wayland-native"
+
+EXTRA_OECONF_virtclass-native = "--disable-documentation"
+EXTRA_OECONF = "--disable-documentation --disable-scanner"
+
+# Wayland installs a M4 macro for other projects to use, which uses the target
+# pkg-config to find files.  Replace pkg-config with pkg-config-native.
+do_install_append_class-native() {
+  sed -e 's,PKG_CHECK_MODULES(.*),,g' \
+      -e 's,$PKG_CONFIG,pkg-config-native,g' \
+      -i ${D}/${datadir}/aclocal/wayland-scanner.m4
+}
-- 
1.7.10.4



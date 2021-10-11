Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 20/25] nghttp2: add recipe from meta-oe
Date: Mon, 11 Oct 2021 11:40:54 +0200
Message-Id: <20211011094059.4184654-20-alex@linutronix.de>
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

It is needed for latest libsoup.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...0001-fetch-ocsp-response-use-python3.patch | 27 ++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.45.1.bb | 35 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch
 create mode 100644 meta/recipes-support/nghttp2/nghttp2_1.45.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e359da3cd04..c203f352caf 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -535,6 +535,7 @@ RECIPE_MAINTAINER:pn-netbase = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-nettle = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-nfs-export-root = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-nfs-utils = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-nghttp2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ninja = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-npth = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch b/meta/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch
new file mode 100644
index 00000000000..e4db09638f8
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch
@@ -0,0 +1,27 @@
+From 73ec79432fc557a8be4f1500982b1c0f5fdf12a9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Thu, 7 Nov 2019 09:58:52 +0000
+Subject: [PATCH] fetch-ocsp-response: use python3
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: André Draszik <git@andred.net>
+---
+ script/fetch-ocsp-response | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/script/fetch-ocsp-response b/script/fetch-ocsp-response
+index 0ff7461..185116b 100755
+--- a/script/fetch-ocsp-response
++++ b/script/fetch-ocsp-response
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ 
+ # nghttp2 - HTTP/2 C Library
+-- 
+2.23.0.rc1
+
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.45.1.bb b/meta/recipes-support/nghttp2/nghttp2_1.45.1.bb
new file mode 100644
index 00000000000..3de509a27c1
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2_1.45.1.bb
@@ -0,0 +1,35 @@
+SUMMARY = "HTTP/2 C Library and tools"
+HOMEPAGE = "https://nghttp2.org/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
+
+UPSTREAM_CHECK_URI = "https://github.com/nghttp2/nghttp2/releases"
+
+SRC_URI = "\
+    https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
+    file://0001-fetch-ocsp-response-use-python3.patch \
+"
+SRC_URI[sha256sum] = "abdc4addccadbc7d89abe27c4d6427d78e57d139f69c1f45749227393c68bf79"
+
+inherit cmake manpages python3native
+PACKAGECONFIG[manpages] = ""
+
+# examples are never installed, and don't need to be built in the
+# first place
+EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
+
+PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
+
+RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
+RDEPENDS:${PN}:class-native = ""
+RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
+
+ALLOW_EMPTY:${PN} = "1"
+FILES:${PN} = ""
+FILES:lib${PN} = "${libdir}/*${SOLIBS}"
+FILES:${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
+FILES:${PN}-proxy = "${bindir}/nghttpx ${datadir}/${BPN}/fetch-ocsp-response"
+FILES:${PN}-server = "${bindir}/nghttpd"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


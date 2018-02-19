Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 043296AC00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:34:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:34:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="19176301"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 19 Feb 2018 00:34:56 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 8BD0258030D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:34:55 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:36:56 +0200
Message-Id: <1519029438-11092-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 05/27] gstreamer1.0: remove PKG_CONFIG_SYSROOT_DIR work-around
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
X-List-Received-Date: Mon, 19 Feb 2018 08:34:55 -0000

We are moving from freedesktop.org's pkg-config to pkgconf.
This enables us to remove the following patch as PKG_CONFIG_SYSROOT_DIR
behaves consistently with pkgconf:

1) 0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...on.m4-prefix-pkgconfig-paths-with-PKG_CON.patch | 42 ----------------------
 .../gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb   |  1 -
 .../gstreamer/gstreamer1.0-plugins-base_1.12.4.bb  |  1 -
 .../gstreamer/gstreamer1.0-plugins-good_1.12.4.bb  |  1 -
 .../gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb  |  1 -
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |  1 -
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  1 -
 7 files changed, 48 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch

diff --git a/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch b/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
deleted file mode 100644
index 2cab87f..0000000
--- a/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 90916f96262fa7b27a0a99788c69f9fd6df11000 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 24 Nov 2015 16:46:27 +0200
-Subject: [PATCH] introspection.m4: prefix pkgconfig paths with
- PKG_CONFIG_SYSROOT_DIR
-
-We can't use our tweaked introspection.m4 from gobject-introspection tarball
-because gstreamer also defines INTROSPECTION_INIT in its introspection.m4, which
-is later supplied to g-ir-scanner.
-
-Upstream-Status: Pending [review on oe-core list]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- common/m4/introspection.m4 | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/common/m4/introspection.m4 b/common/m4/introspection.m4
-index 162be57..217a6ae 100644
---- a/common/m4/introspection.m4
-+++ b/common/m4/introspection.m4
-@@ -54,14 +54,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
-     INTROSPECTION_GIRDIR=
-     INTROSPECTION_TYPELIBDIR=
-     if test "x$found_introspection" = "xyes"; then
--       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
--       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
--       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-+       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
-+       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
-+       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-        INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
-        INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
-        INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
-        INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
--       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-+       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-        INTROSPECTION_INIT="extern void gst_init(gint*,gchar**); gst_init(NULL,NULL);"
-     fi
-     AC_SUBST(INTROSPECTION_SCANNER)
--- 
-2.6.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb
index 82c7ffc..f341d3e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://link-with-libvchostif.patch \
     file://0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch \
     file://0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
index dd895bb..84f6292 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
@@ -10,7 +10,6 @@ SRC_URI = " \
     file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
     file://make-gio_unix_2_0-dependency-configurable.patch \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 SRC_URI[md5sum] = "b35b04071f69b8ab69a7f3a497ff0131"
 SRC_URI[sha256sum] = "4c306b03df0212f1b8903784e29bb3493319ba19ebebf13b0c56a17870292282"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
index a060964..efcdd69 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
@@ -9,7 +9,6 @@ SRC_URI = " \
     file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 SRC_URI[md5sum] = "bdf4791a2b788ec6a149b81ff4032038"
 SRC_URI[sha256sum] = "649f49bec60892d47ee6731b92266974c723554da1c6649f21296097715eb957"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
index f833351..45912b9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 SRC_URI[md5sum] = "e2b836fb2747f6ae3a1a6f33a9d8c952"
 SRC_URI[sha256sum] = "1c165b8d888ed350acd8e6ac9f6fe06508e6fcc0a3afc6ccc9fbeb30df9be522"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 70e90b8..1c373f7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -9,7 +9,6 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
            file://0001-Don-t-hardcode-libtool-name-when-using-introspection.patch \
-           file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
            file://gtk-doc-tweaks.patch"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index c2df1f3..8f1c18b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -15,7 +15,6 @@ inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspecti
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 SRC_URI_append = " \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://gtk-doc-tweaks.patch \
     file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
 "
-- 
2.4.0



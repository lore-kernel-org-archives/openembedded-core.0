Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3DFF26010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 16:44:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 21 Mar 2016 09:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,372,1455004800"; d="scan'208";a="673279584"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2016 09:44:25 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:40:09 +0200
Message-Id: <1458578409-24996-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458578409-24996-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1458578409-24996-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] gstreamer1.0: fix introspection support also for git recipes
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
X-List-Received-Date: Mon, 21 Mar 2016 16:44:25 -0000

This is generally done by moving necessary patches to common
include files, and a few other fixes.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc   | 4 ++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb                  | 1 -
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc  | 9 ++++++++-
 .../gstreamer/gstreamer1.0-plugins-base_1.6.3.bb                 | 4 ----
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc               | 8 ++++++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb          | 1 -
 6 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index a8bff19..9e2b94e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -6,6 +6,10 @@ DEPENDS += "gstreamer1.0-plugins-base libpng jpeg"
 
 inherit gettext bluetooth
 
+SRC_URI_append = " \
+    file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
+"
+
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2', '', d)}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
index 323177b..8eb47c2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
@@ -20,7 +20,6 @@ SRC_URI = " \
     file://configure-allow-to-disable-libssh2.patch \
     file://0001-glimagesink-Downrank-to-marginal.patch \
     file://0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch \
-    file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
 "
 
 SRC_URI[md5sum] = "4857adcafe41e4b9b8805cf88303bd55"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index f0c80ce..7381458 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -1,5 +1,12 @@
 require gstreamer1.0-plugins.inc
 
+SRC_URI_append = "\
+    file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
+    file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch \
+    file://0003-riff-add-missing-include-directories-when-calling-in.patch \
+    file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
+"
+
 LICENSE = "GPLv2+ & LGPLv2+"
 
 DEPENDS += "iso-codes util-linux zlib"
@@ -39,5 +46,5 @@ CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmm
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
 
 do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs"
+        export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst/rtp/.libs"
 }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
index 287d287..429dc93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
@@ -17,10 +17,6 @@ SRC_URI = " \
     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
     file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
     file://0005-convertframe-Support-video-crop-when-convert-frame.patch \
-    file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
-    file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch \
-    file://0003-riff-add-missing-include-directories-when-calling-in.patch \
-    file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
 "
 
 SRC_URI[md5sum] = "3ddde0ad598ef69f58d6a2e87f8b460f"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index e8f29ca..10b4668 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -10,6 +10,14 @@ DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
 
 inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection
 
+# This way common/m4/introspection.m4 will come first
+# (it has a custom INTROSPECTION_INIT macro, and so must be used instead of our common introspection.m4 file)
+acpaths = "-I ${S}/common/m4 -I ${S}/m4"
+
+SRC_URI_append = " \
+    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+"
+
 PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[check] = "--enable-check,--disable-check"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
index a79f449..ba1b83b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 
 SRC_URI[md5sum] = "b4cdeb2b9cb20dd6ac022a4f417eae0d"
-- 
2.7.0



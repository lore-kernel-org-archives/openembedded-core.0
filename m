Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9800C731F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:31 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525556"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:23 +0300
Message-Id: <d205eadc140c3fa5ee24d9145f301cbf1351afe4.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/28] gstreamer1.0: enable gtk-doc support
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:31 -0000

check support is no longer disabled by default because it is a requirement
of gtk-doc support in gstreamer.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc |  2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc   |  2 +-
 .../gstreamer/gstreamer1.0-plugins.inc                   | 14 ++++++++++++--
 .../gstreamer/gstreamer1.0-rtsp-server.inc               | 14 ++++++++++++--
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc       | 16 ++++++++++++----
 5 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index 363101e..b24de62 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -7,7 +7,7 @@ LICENSE_FLAGS = "commercial"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2 xz"
 
-inherit autotools pkgconfig upstream-version-is-even
+inherit autotools pkgconfig upstream-version-is-even gtk-doc
 
 # CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
 # compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index 0fff612..41059d7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -7,7 +7,7 @@ LICENSE_FLAGS = "commercial"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext gtk-doc
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 2dcec50..e29a25f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 
 DEPENDS = "gstreamer1.0 glib-2.0-native"
 
-inherit autotools pkgconfig upstream-version-is-even gobject-introspection
+inherit autotools pkgconfig upstream-version-is-even gobject-introspection gtk-doc
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
@@ -35,6 +35,16 @@ delete_pkg_m4_file() {
 	rm "${S}/common/m4/pkg.m4" || true
 }
 
-do_configure[prefuncs] += " delete_pkg_m4_file"
+# gstreamer is not using system-wide makefiles (which we patch in gtkdoc recipe,
+# but its own custom ones, which we have to patch here
+patch_gtk_doc_makefiles() {
+        # Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient binaries
+        # instead of libtool wrapper or running them directly
+        sed -i \
+           -e "s|GTKDOC_RUN =.*|GTKDOC_RUN = \$(top_builddir)/gtkdoc-qemuwrapper|" \
+           ${S}/common/gtk-doc*mak
+}
+
+do_configure[prefuncs] += " delete_pkg_m4_file patch_gtk_doc_makefiles"
 
 PACKAGES_DYNAMIC = "^${PN}-.*"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 8fc90f1..13ba40d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -13,7 +13,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-inherit autotools pkgconfig upstream-version-is-even gobject-introspection
+inherit autotools pkgconfig upstream-version-is-even gobject-introspection gtk-doc
 
 # Starting with 1.8.0 gst-rtsp-server includes dependency-less plugins as well
 LIBV = "1.0"
@@ -24,5 +24,15 @@ delete_pkg_m4_file() {
         rm "${S}/common/m4/pkg.m4" || true
 }
 
-do_configure[prefuncs] += " delete_pkg_m4_file"
+# gstreamer is not using system-wide makefiles (which we patch in gtkdoc recipe,
+# but its own custom ones, which we have to patch here
+patch_gtk_doc_makefiles() {
+        # Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient binaries
+        # instead of libtool wrapper or running them directly
+        sed -i \
+           -e "s|GTKDOC_RUN =.*|GTKDOC_RUN = \$(top_builddir)/gtkdoc-qemuwrapper|" \
+           ${S}/common/gtk-doc*mak
+}
+
+do_configure[prefuncs] += " delete_pkg_m4_file patch_gtk_doc_makefiles"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 86ac10c..c8af539 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2+"
 
 DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
 
-inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection
+inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc
 
 # This way common/m4/introspection.m4 will come first
 # (it has a custom INTROSPECTION_INIT macro, and so must be used instead of our common introspection.m4 file)
@@ -20,7 +20,6 @@ SRC_URI_append = " \
 
 PACKAGECONFIG ??= ""
 
-PACKAGECONFIG[check] = "--enable-check,--disable-check"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
@@ -31,7 +30,6 @@ EXTRA_OECONF = " \
     --disable-dependency-tracking \
     --disable-docbook \
     --disable-examples \
-    --disable-gtk-doc \
 "
 
 CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
@@ -53,7 +51,17 @@ delete_pkg_m4_file() {
         rm "${S}/common/m4/pkg.m4" || true
 }
 
-do_configure[prefuncs] += " delete_pkg_m4_file"
+# gstreamer is not using system-wide makefiles (which we patch in gtkdoc recipe,
+# but its own custom ones, which we have to patch here
+patch_gtk_doc_makefiles() {
+        # Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient binaries
+        # instead of libtool wrapper or running them directly
+        sed -i \
+           -e "s|GTKDOC_RUN =.*|GTKDOC_RUN = \$(top_builddir)/gtkdoc-qemuwrapper|" \
+           ${S}/common/gtk-doc*mak
+}
+
+do_configure[prefuncs] += " delete_pkg_m4_file patch_gtk_doc_makefiles"
 
 do_compile_prepend() {
         export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
-- 
2.9.3



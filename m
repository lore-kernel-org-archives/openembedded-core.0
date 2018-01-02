Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 03C506FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 16:09:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 08:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,497,1508828400"; d="scan'208";a="188964589"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 02 Jan 2018 08:09:32 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jan 2018 18:04:14 +0200
Message-Id: <20180102160414.33802-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] gobject-introspection: unset LD_LIBRARY_PATH prior to running qemu
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
X-List-Received-Date: Tue, 02 Jan 2018 16:09:33 -0000

Latest g-i upstream adds target paths to this variable which breaks
qemu in various confusing ways.

Also, re-enable parts of g-i on mips64, as it is the same issue.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gobject-introspection/gobject-introspection_1.54.1.bb             | 3 +++
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc                     | 4 ----
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc            | 3 ---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc        | 2 --
 4 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
index 156dac7ca78..ef1d561bbf8 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
@@ -52,6 +52,9 @@ do_configure_prepend_class-target() {
 # Use a modules directory which doesn't exist so we don't load random things
 # which may then get deleted (or their dependencies) and potentially segfault
 export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
+# g-ir-scanner (which executes this script) adds some target library paths to LD_LIBRARY_PATH
+# which fails horribly when running native qemu
+unset LD_LIBRARY_PATH
 
 $qemu_binary "\$@"
 if [ \$? -ne 0 ]; then
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index 26ae91c4847..4c877982b74 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -15,7 +15,3 @@ PACKAGES  =+ "${PN}-examples"
 FILES_${PN}          += "${libdir}/gstreamer-1.0/lib*.so"
 FILES_${PN}-dev      += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-examples  = "${bindir}/video-player ${bindir}/video-sink"
-
-# Needs to be disable due to a dependency on gstreamer-plugins introspection files
-EXTRA_OECONF_append_mips64 = " --disable-introspection "
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index c40d3989119..3f6d4c37038 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -49,6 +49,3 @@ patch_gtk_doc_makefiles() {
 do_configure[prefuncs] += " delete_pkg_m4_file patch_gtk_doc_makefiles"
 
 PACKAGES_DYNAMIC = "^${PN}-.*"
-
-# qemu-mips64: error while loading shared libraries: .../recipe-sysroot/usr/lib/libgthread-2.0.so.0: ELF file data encoding not little-endian
-EXTRA_OECONF_append_mips64 = " --disable-introspection "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 68173ce7d94..7191f9892d7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -36,5 +36,3 @@ patch_gtk_doc_makefiles() {
 
 do_configure[prefuncs] += " delete_pkg_m4_file patch_gtk_doc_makefiles"
 
-# Needs to be disable due to a dependency on gstreamer-plugins introspection files
-EXTRA_OECONF_append_mips64 = " --disable-introspection "
-- 
2.15.1



Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 247046E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 15:24:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 07:24:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,501,1508828400"; d="scan'208";a="17847335"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2018 07:24:05 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jan 2018 17:24:04 +0200
Message-Id: <20180103152404.30045-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] gobject-introspection: do not export LD_LIBRARY_PATH prior to running qemu
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
X-List-Received-Date: Wed, 03 Jan 2018 15:24:06 -0000

Latest g-i upstream adds target paths to this variable which breaks
qemu in various confusing ways.

Instead, the list of target library paths is exported to GIR_EXTRA_LIBS_PATH,
so that it can be picked up automatically by the qemu wrapper script
and given to qemu (manually setting this variable from various recipes
will be removed in a different patch).

Also, re-enable parts of g-i on mips64, as it is the same issue.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...01-giscanner-add-a-lib-dirs-envvar-option.patch | 73 ++++++++++++++++++++++
 .../gobject-introspection_1.54.1.bb                |  3 +-
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |  4 --
 .../gstreamer/gstreamer1.0-plugins.inc             |  3 -
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |  2 -
 5 files changed, 75 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
new file mode 100644
index 00000000000..e1776bc9b40
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
@@ -0,0 +1,73 @@
+From a02076fe916ade6c3f78f6d35072ec53482e9446 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 3 Jan 2018 17:02:01 +0200
+Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
+
+By default LD_LIBRARY_PATH is set to the list of target library paths;
+this breaks down in cross-compilation environment, as we need to run a
+native emulation wrapper rather than the target binary itself. This patch
+allows exporting those paths to a different environment variable
+which can be picked up and used by the wrapper.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ giscanner/ccompiler.py   | 6 ++++--
+ giscanner/dumper.py      | 3 ++-
+ giscanner/scannermain.py | 3 +++
+ 3 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
+index 29de0ee..e969337 100644
+--- a/giscanner/ccompiler.py
++++ b/giscanner/ccompiler.py
+@@ -109,14 +109,16 @@ class CCompiler(object):
+ 
+             self._cflags_no_deprecation_warnings = "-Wno-deprecated-declarations"
+ 
+-    def get_internal_link_flags(self, args, libtool, libraries, extra_libraries, libpaths):
++    def get_internal_link_flags(self, args, libtool, libraries, extra_libraries, libpaths, lib_dirs_envvar):
+         # An "internal" link is where the library to be introspected
+         # is being built in the current directory.
+ 
+         runtime_path_envvar = []
+         runtime_paths = []
+ 
+-        if self.check_is_msvc():
++        if lib_dirs_envvar:
++            runtime_path_envvar = [lib_dirs_envvar]
++        elif self.check_is_msvc():
+             runtime_path_envvar = ['LIB', 'PATH']
+         else:
+             runtime_path_envvar = ['LD_LIBRARY_PATH']
+diff --git a/giscanner/dumper.py b/giscanner/dumper.py
+index 7f77bd2..db96df6 100644
+--- a/giscanner/dumper.py
++++ b/giscanner/dumper.py
+@@ -259,7 +259,8 @@ class DumpCompiler(object):
+                                                    libtool,
+                                                    self._options.libraries,
+                                                    self._options.extra_libraries,
+-                                                   self._options.library_paths)
++                                                   self._options.library_paths,
++                                                   self._options.lib_dirs_envvar)
+             args.extend(pkg_config_libs)
+ 
+         else:
+diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
+index 38a45c1..b603850 100755
+--- a/giscanner/scannermain.py
++++ b/giscanner/scannermain.py
+@@ -130,6 +130,9 @@ def _get_option_parser():
+     parser.add_option("", "--use-ldd-wrapper",
+                       action="store", dest="ldd_wrapper", default=None,
+                       help="wrapper to use instead of ldd (useful when cross-compiling)")
++    parser.add_option("", "--lib-dirs-envvar",
++                      action="store", dest="lib_dirs_envvar", default=None,
++                      help="environment variable to write a list of library directories to (for running the transient binary), instead of standard LD_LIBRARY_PATH")
+     parser.add_option("", "--program-arg",
+                       action="append", dest="program_args", default=[],
+                       help="extra arguments to program")
+-- 
+2.15.1
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
index 156dac7ca78..85c8001dea8 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/1.54/${BPN}-${PV}.tar.xz \
            file://0003-giscanner-add-use-binary-wrapper-option.patch \
            file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
+           file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
            "
 SRC_URI[md5sum] = "126c29e4d54adbed2ed4e2b04483de41"
 SRC_URI[sha256sum] = "b88ded5e5f064ab58a93aadecd6d58db2ec9d970648534c63807d4f9a7bb877e"
@@ -71,7 +72,7 @@ EOF
 # This prevents g-ir-scanner from writing cache data to $HOME
 export GI_SCANNER_DISABLE_CACHE=1
 
-g-ir-scanner --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 "\$@"
+g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 "\$@"
 EOF
         chmod +x ${B}/g-ir-scanner-wrapper
 
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



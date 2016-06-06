Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CD33C7710C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 13:11:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jun 2016 06:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,427,1459839600"; d="scan'208";a="969806197"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 06 Jun 2016 06:11:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 16:11:38 +0300
Message-Id: <1465218698-17824-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gobject-introspection: move to Python 3
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
X-List-Received-Date: Mon, 06 Jun 2016 13:11:42 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gobject-introspection.bbclass                  |  7 +++++--
 .../0003-giscanner-add-use-binary-wrapper-option.patch      |  4 ++--
 .../gobject-introspection/gobject-introspection_1.48.0.bb   | 13 ++++++++-----
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb                |  5 ++++-
 4 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index f16627d..8cd7b7e 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -1,8 +1,11 @@
 # Inherit this class in recipes to enable building their introspection files
 
-# This sets up autoconf-based recipes to build introspection data (or not),
+# python3native is inherited to prevent introspection tools being run with
+# host's python 3 (they need to be run with native python 3)
+#
+# This also sets up autoconf-based recipes to build introspection data (or not),
 # depending on distro and machine features (see gobject-introspection-data class).
-inherit gobject-introspection-data
+inherit python3native gobject-introspection-data
 EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
 
 # When building native recipes, disable introspection, as it is not necessary,
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
index b0d098c..f21eaca 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
@@ -36,11 +36,11 @@ index 633496f..d684cd0 100755
 +        # The wrapper needs the binary itself, not the libtool wrapper script,
 +        # so we check if libtool has sneaked the binary into .libs subdirectory
 +        # and adjust the path accordingly
-+	import os.path
++        import os.path
 +        dir_name, binary_name  = os.path.split(binary.args[0])
 +        libtool_binary = os.path.join(dir_name, '.libs', binary_name)
 +        if os.path.exists(libtool_binary):
-+	    binary.args[0] = libtool_binary
++            binary.args[0] = libtool_binary
 +	# Then prepend the wrapper to the command line to execute
 +        binary.args = [options.wrapper] + binary.args
      gdump_parser.set_introspection_binary(binary)
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
index f368814..8adede6 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
@@ -18,18 +18,21 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/1.48/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "01301fa9019667d48e927353e08bc218"
 SRC_URI[sha256sum] = "fa275aaccdbfc91ec0bc9a6fd0562051acdba731e7d584b64a277fec60e75877"
 
-inherit autotools pkgconfig gtk-doc pythonnative qemu gobject-introspection-data
+inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data
 BBCLASSEXTEND = "native"
 
 # necessary to let the call for python-config from configure.ac succeed
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+# autoconf macros otherwise will default to Python 2
+export PYTHON
+
 # needed for writing out the qemu wrapper script
 export STAGING_DIR_HOST
 export B
 
-DEPENDS_append = " libffi zlib glib-2.0 python flex-native bison-native"
+DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native"
 
 # target build needs qemu to run temporary introspection binaries created
 # on the fly by g-ir-scanner and a native version of itself to run
@@ -44,7 +47,7 @@ do_configure_prepend_class-native() {
         # Tweak the native python scripts so that they don't refer to the
         # full path of native python binary (the solution is taken from glib-2.0 recipe)
         # This removes the risk of exceeding Linux kernel's shebang line limit (128 bytes)
-        sed -i -e '1s,#!.*,#!${USRBINPATH}/env nativepython,' ${S}/tools/g-ir-tool-template.in
+        sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/tools/g-ir-tool-template.in
 }
 
 do_configure_prepend_class-target() {
@@ -97,7 +100,7 @@ EOF
 
         # Also tweak the target python scripts so that they don't refer to the
         # native version of python binary (the solution is taken from glib-2.0 recipe)
-        sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/tools/g-ir-tool-template.in
+        sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/tools/g-ir-tool-template.in
 }
 
 # Configure target build to use native tools of itself and to use a qemu wrapper
@@ -109,7 +112,7 @@ EXTRA_OECONF_class-target += "--enable-host-gi \
                              "
 
 PACKAGECONFIG ?= ""
-PACKAGECONFIG[doctool] = "--enable-doctool,--disable-doctool,python-mako,"
+PACKAGECONFIG[doctool] = "--enable-doctool,--disable-doctool,python3-mako,"
 
 do_compile_prepend_class-target() {
         # This prevents g-ir-scanner from writing cache data to $HOME
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
index 9a2387e..2de698b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
@@ -21,7 +21,10 @@ SRC_URI = "\
 SRC_URI[md5sum] = "aebb4029c09dd81664aa830e4a584c85"
 SRC_URI[sha256sum] = "173cbb9a2eca23eee52e99965483ab25aa9c0569ef5b57041fc0c129cc26c307"
 
-inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check upstream-version-is-even gobject-introspection
+# pythonnative must come after gobject-introspection, otherwise
+# webkit build configuration will not attempt to find Python 2.x after
+# finding (and rejecting) Python 3.x
+inherit cmake lib_package pkgconfig gobject-introspection perlnative pythonnative distro_features_check upstream-version-is-even
 
 # depends on libxt
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.8.1



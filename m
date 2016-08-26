Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED8DF731F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525547"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:19 +0300
Message-Id: <e89839f9fb32072754e1447f39873bd9391293d6.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/28] gtk-doc.bbclass: enable building gtk-doc based documentation
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:27 -0000

This is done similarly to gobject-introspection, but with much
less delicate hacking around the upstream way of working.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gtk-doc.bbclass | 72 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 14 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index e32f98d..d41c80b 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -1,25 +1,69 @@
-# Helper class to pull in the right gtk-doc dependencies and disable
-# gtk-doc.
+# Helper class to pull in the right gtk-doc dependencies and configure
+# gtk-doc to enable or disable documentation building (which requries the
+# use of usermode qemu).
+
+# This variable is set to True if api-documentation is in
+# DISTRO_FEATURES and qemu-usermode is in MACHINE_FEATURES, and False otherwise.
 #
-# Long-term it would be great if this class could be toggled between
-# gtk-doc-stub-native and the real gtk-doc-native, which would enable
-# re-generation of documentation.  For now, we'll make do with this which
-# packages up any existing documentation (so from tarball builds).
+# It should be used in recipes to determine whether gtk-doc based documentation should be built,
+# so that qemu use can be avoided when necessary.
+GTKDOC_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', \
+                      bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d), 'False', d)}"
+
+EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GTKDOC_ENABLED', 'True', '--enable-gtk-doc --enable-gtk-doc-html --disable-gtk-doc-pdf', \
+                                                                                    '--disable-gtk-doc', d)} "
+
+# When building native recipes, disable gtkdoc, as it is not necessary,
+# pulls in additional dependencies, and makes build times longer
+EXTRA_OECONF_prepend_class-native = "--disable-gtk-doc "
+EXTRA_OECONF_prepend_class-nativesdk = "--disable-gtk-doc "
+
+DEPENDS_append_class-target = " gtk-doc-native qemu-native gtk-doc"
+
+# Even though gtkdoc is disabled on -native, gtk-doc package is still
+# needed for m4 macros.
+DEPENDS_append_class-native = " gtk-doc-native"
+DEPENDS_append_class-nativesdk = " gtk-doc-native"
 
 # The documentation directory, where the infrastructure will be copied.
 # gtkdocize has a default of "." so to handle out-of-tree builds set this to $S.
 GTKDOC_DOCDIR ?= "${S}"
 
-DEPENDS_append = " gtk-doc-stub-native"
+do_configure_prepend () {
+	( cd ${S}; gtkdocize --docdir ${GTKDOC_DOCDIR} || true )
+}
+
+inherit qemu
 
-EXTRA_OECONF_append = "\
-  --disable-gtk-doc \
-  --disable-gtk-doc-html \
-  --disable-gtk-doc-pdf \
-"
+export STAGING_DIR_HOST
 
-do_configure_prepend () {
-	( cd ${S}; gtkdocize --docdir ${GTKDOC_DOCDIR} )
+do_compile_prepend_class-target () {
+
+        # Write out a qemu wrapper that will be given to gtkdoc-scangobj so that it
+        # can run target helper binaries through that.
+        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\$GIR_EXTRA_LIBS_PATH','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+        cat > ${B}/gtkdoc-qemuwrapper << EOF
+#!/bin/sh
+# Use a modules directory which doesn't exist so we don't load random things
+# which may then get deleted (or their dependencies) and potentially segfault
+export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
+
+GIR_EXTRA_LIBS_PATH=\`find ${B} -name .libs| tr '\n' ':'\`\$GIR_EXTRA_LIBS_PATH
+
+if test -d ".libs"; then
+    $qemu_binary ".libs/\$@"
+else
+    $qemu_binary "\$@"
+fi
+
+if [ \$? -ne 0 ]; then
+    echo "If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the recipe should help."
+    echo "(typically like this: GIR_EXTRA_LIBS_PATH=\"$""{B}/something/.libs\" )"
+    exit 1
+fi
+EOF
+        chmod +x ${B}/gtkdoc-qemuwrapper
 }
 
+
 inherit pkgconfig
-- 
2.9.3



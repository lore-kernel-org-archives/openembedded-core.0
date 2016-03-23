Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 87DD3601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 08:59:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 23 Mar 2016 01:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,381,1455004800"; d="scan'208";a="674289525"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2016 01:59:12 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 10:59:06 +0200
Message-Id: <ecd54a3428d17f605d310010d1213c4c6cb1cd8f.1458723078.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1458723078.git.jussi.kukkonen@intel.com>
References: <cover.1458723078.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 1/3] glib-2.0: Install gio-querymodules in main package
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
X-List-Received-Date: Wed, 23 Mar 2016 08:59:11 -0000

gio-querymodules should be used whenever new Gio modules are installed
(to regenerate the module cache) so it should be available by default.
Each multilib is going to need its own variant (because the tool
actually dlopens the modules when cache is generated), so it's
packaged as  ${libexecdir}/${MLPREFIX}gio-querymodules

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...stall-gio-querymodules-as-libexec_PROGRAM.patch | 31 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb      |  1 +
 meta/recipes-core/glib-2.0/glib.inc                | 13 +++++++--
 3 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
new file mode 100644
index 0000000..561d100
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -0,0 +1,31 @@
+From 80682c171ccb27d01343d4cfcfb4dd49b7863ccc Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 22 Mar 2016 15:14:58 +0200
+Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
+
+We want to install this binary with the gio library, and debian
+renamer does not cope with library packages with files in ${bindir}
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Inappropriate [OE specific]
+---
+ gio/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gio/Makefile.am b/gio/Makefile.am
+index b7f91cc..4d81cc0 100644
+--- a/gio/Makefile.am
++++ b/gio/Makefile.am
+@@ -702,7 +702,8 @@ gio.def: libgio-2.0.la
+ gio-2.0.lib: libgio-2.0.la gio.def
+ 	$(AM_V_GEN) lib.exe -machine:@LIB_EXE_MACHINE_FLAG@ -name:libgio-2.0-$(LT_CURRENT_MINUS_AGE).dll -def:$(builddir)/gio.def -out:$@
+ 
+-bin_PROGRAMS = gio-querymodules glib-compile-schemas glib-compile-resources gsettings
++bin_PROGRAMS = glib-compile-schemas glib-compile-resources gsettings
++libexec_PROGRAMS = gio-querymodules
+ 
+ glib_compile_resources_LDADD = libgio-2.0.la 		\
+ 	$(top_builddir)/gobject/libgobject-2.0.la	\
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
index 2a2efae..8e445b4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 	   file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
            file://gi-exclude.patch \
+           file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 35153fa..75a7d25 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -48,8 +48,12 @@ do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
 
-FILES_${PN} = "${libdir}/lib*${SOLIBS} ${libdir}/gio ${datadir}/glib-2.0/schemas \
-               ${datadir}/glib-2.0/gettext/mkinstalldirs ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
+FILES_${PN} = "${libdir}/lib*${SOLIBS} \
+               ${libdir}/gio \
+               ${libexecdir}/*gio-querymodules \
+               ${datadir}/glib-2.0/schemas \
+               ${datadir}/glib-2.0/gettext/mkinstalldirs \
+               ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
 FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
                     ${libdir}/gio/modules/*.la"
@@ -81,6 +85,11 @@ do_install_append () {
 			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
 		fi
 	fi
+
+        # Make sure gio-querymodules is unique among multilibs
+        if test "x${MLPREFIX}" != "x"; then
+                mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
+        fi
 }
 
 do_install_append_libc-musl () {
-- 
2.1.4



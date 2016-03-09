Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 984C06FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:07:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083625"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:53 +0200
Message-Id: <18bafd7cf0f6987ff04ab87999807696e505a5f7.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/24] vala: enable the use of vapigen by packages with vala support
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
X-List-Received-Date: Wed, 09 Mar 2016 15:07:14 -0000

Now that gobject-introspection is supported, generation of .vapi
files for develeloping Vala code against gobject-based libraries
should be supported as well.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/vala.inc                | 34 +++++++++++++++++++
 ...001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch | 38 ++++++++++++++++++++++
 meta/recipes-devtools/vala/vala_0.30.1.bb          |  4 ++-
 3 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 43f9bb3..2a8875f 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -3,6 +3,9 @@ DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming.
 Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
 SECTION = "devel"
 DEPENDS = "bison-native flex-native libxslt-native glib-2.0"
+
+# vala-native contains a native version of vapigen, which we use instead of the target one
+DEPENDS_append_class-target = " vala-native"
 BBCLASSEXTEND = "native"
 HOMEPAGE = "http://vala-project.org"
 LICENSE = "LGPLv2.1"
@@ -15,3 +18,34 @@ inherit autotools pkgconfig upstream-version-is-even
 
 FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
 FILES_${PN}-doc += "${datadir}/devhelp"
+
+do_configure_prepend_class-target() {
+        # Write out a vapigen wrapper that will be provided by pkg-config file installed in target sysroot
+        # The wrapper will call a native vapigen
+        cat > ${B}/vapigen-wrapper << EOF
+#!/bin/sh
+vapigen-${SHRT_VER} "\$@"
+EOF
+        chmod +x ${B}/vapigen-wrapper
+}
+
+# Vapigen wrapper needs to be available system-wide, because it will be used
+# to build vapi files from all other packages with vala support
+do_install_append_class-target() {
+        install -d ${D}${bindir}/
+        install ${B}/vapigen-wrapper ${D}${bindir}/
+}
+
+
+SYSROOT_PREPROCESS_FUNCS_append_class-target += "vapigen_sysroot_preprocess"
+
+vapigen_sysroot_preprocess() {
+        # Put vapigen wrapper into target sysroot so that it can be used when building vapi files.
+        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
+
+        # Also, tweak the vapigen name in vapigen pkgconfig file, so that it picks up our
+        # wrapper.
+        sed -i \
+           -e "s|vapigen=.*|vapigen=${bindir}/vapigen-wrapper|" \
+           ${SYSROOT_DESTDIR}${datadir}/pkgconfig/vapigen-${SHRT_VER}.pc
+}
diff --git a/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch b/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
new file mode 100644
index 0000000..ecab0fc
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
@@ -0,0 +1,38 @@
+From dbb1c58e86f2af4613f3ac9571d9b163d4bca675 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 23 Oct 2015 16:13:54 +0300
+Subject: [PATCH] vapigen.m4: use $PKG_CONFIG_SYSROOT_DIR
+
+This is necessary in cross-compiling environments, where directories
+returned by pkg-config should be prefixed with sysroot location.
+
+Upstream-Status: Pending [review in oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ vapigen/vapigen.m4 | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/vapigen/vapigen.m4 b/vapigen/vapigen.m4
+index 2c435e7..6228991 100644
+--- a/vapigen/vapigen.m4
++++ b/vapigen/vapigen.m4
+@@ -82,12 +82,12 @@ AC_DEFUN([VAPIGEN_CHECK],
+ 
+   AS_CASE([$enable_vala],
+     [yes], [
+-      VAPIGEN=`$PKG_CONFIG --variable=vapigen $vapigen_pkg_name`
+-      VAPIGEN_MAKEFILE=`$PKG_CONFIG --variable=datadir $vapigen_pkg_name`/vala/Makefile.vapigen
++      VAPIGEN=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=vapigen $vapigen_pkg_name`
++      VAPIGEN_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir $vapigen_pkg_name`/vala/Makefile.vapigen
+       AS_IF([test "x$2" = "x"], [
+-          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir $vapigen_pkg_name`
++          VAPIGEN_VAPIDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=vapidir $vapigen_pkg_name`
+         ], [
+-          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir_versioned $vapigen_pkg_name`
++          VAPIGEN_VAPIDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=vapidir_versioned $vapigen_pkg_name`
+         ])
+     ])
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/vala/vala_0.30.1.bb b/meta/recipes-devtools/vala/vala_0.30.1.bb
index 4452298..6394afc 100644
--- a/meta/recipes-devtools/vala/vala_0.30.1.bb
+++ b/meta/recipes-devtools/vala/vala_0.30.1.bb
@@ -1,6 +1,8 @@
 require ${BPN}.inc
 
-SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
+SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
+             file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
+"
 
 SRC_URI[md5sum] = "cc2eb2384fc10038b643753d734a5a51"
 SRC_URI[sha256sum] = "23add78e5c6a5e6df019d4a885c9c79814c9e0b957519ec8a4f4d826c4e5df2c"
-- 
2.7.0



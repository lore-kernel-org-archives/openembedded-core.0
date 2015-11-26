Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 639796E665
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574669"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:07 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:13 +0200
Message-Id: <207eeffffb434a874180440f81e61c0f6deb7397.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/29] vala: enable the use of vapigen by packages with vala support
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:06 -0000

Now that gobject-introspection is supported, generation of .vapi
files for develeloping Vala code against gobject-based libraries
should be supported as well.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/vala.inc                | 10 ++++++
 ...001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch | 38 ++++++++++++++++++++++
 meta/recipes-devtools/vala/vala_0.28.0.bb          |  4 ++-
 3 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 63056fd..a0ace39 100644
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
@@ -16,3 +19,10 @@ inherit autotools pkgconfig
 FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
 FILES_${PN}-doc += "${datadir}/devhelp"
 FILES_${PN}-dbg += "${libdir}/${BPN}-${SHRT_VER}/.debug"
+
+SYSROOT_PREPROCESS_FUNCS_append_class-target += "vapigen_sysroot_preprocess"
+
+# Link native vapigen into target sysroot so that it is used when building vapi files.
+vapigen_sysroot_preprocess() {
+        ln -f -s ${STAGING_BINDIR_NATIVE}/vapigen* ${STAGING_BINDIR}
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
diff --git a/meta/recipes-devtools/vala/vala_0.28.0.bb b/meta/recipes-devtools/vala/vala_0.28.0.bb
index 120906c..de9a46b 100644
--- a/meta/recipes-devtools/vala/vala_0.28.0.bb
+++ b/meta/recipes-devtools/vala/vala_0.28.0.bb
@@ -1,6 +1,8 @@
 require ${BPN}.inc
 
-SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
+SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
+             file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
+"
 
 SRC_URI[md5sum] = "8d4ceac3451a0d5497e7be38e5e4c2ad"
 SRC_URI[sha256sum] = "0d9e3bd3f82145664875f7c29b2f544ba92d2814f75412948f774c0727fc977f"
-- 
2.6.2



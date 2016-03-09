Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DD43C6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:06:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 09 Mar 2016 07:06:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083771"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:36 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:02:04 +0200
Message-Id: <5b9e7b90ab551365b9e50841994ed7a63d08e618.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/24] python-pygobject: update to 3.18.2
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
X-List-Received-Date: Wed, 09 Mar 2016 15:06:39 -0000

The new version of pygobject relies in gobject introspection;
this has prevented the update previously.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch | 41 +++++++++++++++++
 .../obsolete_automake_macros.patch                 | 23 ----------
 .../python/python-pygobject_2.28.3.bb              | 53 ----------------------
 .../python/python-pygobject_3.18.2.bb              | 25 ++++++++++
 4 files changed, 66 insertions(+), 76 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygobject_2.28.3.bb
 create mode 100644 meta/recipes-devtools/python/python-pygobject_3.18.2.bb

diff --git a/meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch b/meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
new file mode 100644
index 0000000..a391f7e
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
@@ -0,0 +1,41 @@
+From 5e5350d730f85957a42c6d846d347d080e7dd996 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 23 Oct 2015 12:40:34 +0300
+Subject: [PATCH] configure.ac: add sysroot path to GI_DATADIR; don't set
+ introspection scanner and compiler paths
+
+Upstream-Status: Pending [review on oe-core maillist]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2c0cfbd..cfcb3bf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -194,7 +194,7 @@ PKG_CHECK_MODULES(GI,
+     gobject-introspection-1.0 >= introspection_required_version
+ )
+ 
+-GI_DATADIR=$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
++GI_DATADIR=$PKG_CONFIG_SYSROOT_DIR$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
+ AC_SUBST(GI_DATADIR)
+ 
+ if test "$enable_cairo" != no; then
+@@ -219,12 +219,6 @@ AC_ARG_WITH(common,
+     with_common=yes)
+ AM_CONDITIONAL(WITH_COMMON, test "$with_common" = "yes")
+ 
+-INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-
+-AC_SUBST(INTROSPECTION_SCANNER)
+-AC_SUBST(INTROSPECTION_COMPILER)
+-
+ # compiler warnings, errors, required cflags, and code coverage support
+ GNOME_COMPILE_WARNINGS([maximum])
+ AC_MSG_CHECKING(for Gnome code coverage support)
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch b/meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch
deleted file mode 100644
index c259112..0000000
--- a/meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Accepted [https://bugzilla.gnome.org/show_bug.cgi?id=691101]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd pygobject-2.27.91/configure.ac pygobject-2.27.91/configure.ac
---- pygobject-2.27.91/configure.ac	2011-02-23 22:14:37.000000000 +0200
-+++ pygobject-2.27.91/configure.ac	2013-01-03 05:13:44.034949954 +0200
-@@ -35,7 +35,7 @@
- AC_DEFINE(PYGOBJECT_MICRO_VERSION, pygobject_micro_version, [pygobject micro version])
- AC_SUBST(PYGOBJECT_MICRO_VERSION, pygobject_micro_version)
-
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES(yes)])
- AM_INIT_AUTOMAKE(foreign)
- AM_MAINTAINER_MODE
-@@ -82,7 +82,6 @@
- m4_ifdef([LT_OUTPUT], [LT_OUTPUT])
- AC_ISC_POSIX
- AC_PROG_CC
--AM_PROG_CC_STDC
- AM_PROG_CC_C_O
-
- # check that we have the minimum version of python necisary to build
diff --git a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
deleted file mode 100644
index 81d37b4..0000000
--- a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Python GObject bindings"
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
-
-RECIPE_NO_UPDATE_REASON = "Newer versions of python-pygobject depend on gobject-introspection which doesn't cross-compile"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-DEPENDS = "python python-pygobject-native libffi glib-2.0"
-DEPENDS_class-native = "python-native libffi-native glib-2.0-native"
-RDEPENDS_class-native = ""
-
-MAJ_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-SRC_URI = "${GNOME_MIRROR}/pygobject/${MAJ_VER}/pygobject-${PV}.tar.bz2 \
-           file://obsolete_automake_macros.patch \
-"
-
-# libtool-native doesn't have fixinstall.patch applied which means
-# that libs get relinked at installation time. This triggers a 
-# relinking along the lines of:
-# gcc -L/tmp/foo/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/lib -lpyglib-2.0-python -o .libs/_glib.so
-# where /tmp/foo is DESTDIR and pyglib-2.0-python may be installed/reinstalled
-# at the same time as the gcc command runs.
-# If this happens between the handoff between gcc and ld, you can see:
-# /bin/ld: cannot find -lpyglib-2.0-python
-# Adding a dependency rule like  install-pyglibLTLIBRARIES: install-libLTLIBRARIES
-# would be ideal but automake can't cope with that without manually 
-# defining the whole function. Give up and disable parallel make in native builds.
-PARALLEL_MAKEINST_class-native = ""
-
-SRC_URI[md5sum] = "aa64900b274c4661a5c32e52922977f9"
-SRC_URI[sha256sum] = "7da88c169a56efccc516cebd9237da3fe518a343095a664607b368fe21df95b6"
-S = "${WORKDIR}/pygobject-${PV}"
-
-EXTRA_OECONF += "--disable-introspection"
-
-inherit autotools distutils-base pkgconfig
-
-# necessary to let the call for python-config succeed
-export BUILD_SYS
-export HOST_SYS
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-PACKAGES += "${PN}-lib"
-
-RDEPENDS_${PN} += "python-textutils"
-
-FILES_${PN} = "${libdir}/python*"
-FILES_${PN}-lib = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir} ${datadir}"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
new file mode 100644
index 0000000..e61d75c
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Python GObject bindings"
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+
+inherit autotools pkgconfig gnomebase distutils3-base gobject-introspection
+
+DEPENDS += "python3 glib-2.0 gnome-common"
+
+SRCNAME="pygobject"
+SRC_URI = " \
+    http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
+    file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
+"
+
+SRC_URI[md5sum] = "0a956f3e785e23b0f136832f2e57a862"
+SRC_URI[sha256sum] = "2a3cad1517916b74e131e6002c3824361aee0671ffb0d55ded119477fc1c2c5f"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+BBCLASSEXTEND = "native"
+
+EXTRA_OECONF = "--disable-cairo"
+
+RDEPENDS_${PN} += "python3-setuptools"
-- 
2.7.0



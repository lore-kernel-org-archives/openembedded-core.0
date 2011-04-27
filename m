Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzES-0005O8-CK
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 00:29:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="914945613"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2011 00:29:51 -0700
Message-Id: <ada001e04babff532798bbcf8edb22778d3911f0.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 26 Apr 2011 12:04:40 -0700
Date: Wed, 27 Apr 2011  0:29:50 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 29/52] python: add missing cytpes modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2011 07:32:21 -0000

From: Saul Wold <sgw@linux.intel.com>

Contributed by Martin Jansa via OE

Fixes [YOCTO #1003]

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../python/06-ctypes-libffi-fix-configure.patch    |   58 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
 2 files changed, 60 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch

diff --git a/meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch b/meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch
new file mode 100644
index 0000000..8de5694
--- /dev/null
+++ b/meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch
@@ -0,0 +1,58 @@
+This fixes configure issues with recent autoconf, e.g:
+  autoreconf: Entering directory `Modules/_ctypes/libffi'
+  autoreconf: configure.ac: not using Gettext
+  autoreconf: running: aclocal --force
+  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
+  configure.ac:26: the top level
+
+The problem is still present in python-2.6.5 but fixed in python-svn.
+
+Upstream-Status: Accepted [python-svn]
+
+Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
+Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac Python-2.6.4/Modules/_ctypes/libffi/configure.ac
+--- Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac      2009-04-28 22:01:18.000000000 +0200
++++ Python-2.6.4/Modules/_ctypes/libffi/configure.ac    2010-04-20 22:46:02.000000000 +0200
+@@ -23,6 +23,7 @@ AM_INIT_AUTOMAKE
+ m4_rename([_AC_ARG_VAR_PRECIOUS],[real_PRECIOUS])
+ m4_define([_AC_ARG_VAR_PRECIOUS],[])
+ AC_PROG_CC
++m4_undefine([_AC_ARG_VAR_PRECIOUS])
+ m4_rename([real_PRECIOUS],[_AC_ARG_VAR_PRECIOUS])
+ 
+ AC_SUBST(CFLAGS)
+@@ -366,7 +367,7 @@ test -d src/$TARGETDIR || mkdir src/$TAR
+ 
+ AC_CONFIG_LINKS(include/ffitarget.h:src/$TARGETDIR/ffitarget.h)
+ 
+-AC_CONFIG_FILES(include/ffi.h)
++AC_CONFIG_FILES(include/ffi.h include/Makefile Makefile)
+ 
+ AC_CONFIG_LINKS(include/ffi_common.h:include/ffi_common.h)
+ 
+diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am Python-2.6.4/Modules/_ctypes/libffi/Makefile.am
+--- Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am       2008-03-04 21:09:11.000000000 +0100
++++ Python-2.6.4/Modules/_ctypes/libffi/Makefile.am     2010-04-20 22:54:03.000000000 +0200
+@@ -2,7 +2,7 @@
+ 
+ AUTOMAKE_OPTIONS = foreign subdir-objects
+ 
+-SUBDIRS = include testsuite man
++SUBDIRS = include
+ 
+ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
+        src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
+@@ -32,8 +32,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
+        src/frv/ffi.c src/frv/eabi.S src/frv/ffitarget.h src/dlmalloc.c \
+        libtool-version ChangeLog.libffi
+ 
+-info_TEXINFOS = doc/libffi.texi
+-
+ ## ################################################################
+ 
+ ##
+
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 2939df4..3a0a056 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -13,6 +13,7 @@ SRC_URI = "\
   file://03-fix-tkinter-detection.patch \
   file://04-default-is-optimized.patch \
   file://05-enable-ctypes-cross-build.patch \
+  file://06-ctypes-libffi-fix-configure.patch \
   file://06-avoid_usr_lib_termcap_path_in_linking.patch \
   file://99-ignore-optimization-flag.patch \
   ${DISTRO_SRC_URI} \
-- 
1.7.1.1




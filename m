Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B8EC276ACD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:04:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2015 06:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="756484348"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2015 06:04:15 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:05:59 +0300
Message-Id: <694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1440680489.git.jussi.kukkonen@intel.com>
References: <cover.1440680489.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Thu, 27 Aug 2015 13:04:33 -0000

gmp 4.2.1 was removed in f181c6ce8b apparently accidentally: It
was not noticed that 4.2.1 is LGPL 2.1 (and not GPL) so provides
a useful alternative to the newer "GPLv2 | LGPLv3" version.

* Reintroduce 4.2.1. The source includes files that are GPL but the
  library package is LGPL 2.1+
* Also reintroduce the two patches removed in f181c6ce8b.
* Refactor gmp.inc: gmp 6.0.0 build should not be affected in any way.
* Update 6.0.0 license from "GPLv2 | LGPLv3" to "GPLv2+ | LGPLv3+".

[YOCTO #8197]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gmp/gmp-4.2.1/disable-stdc.patch               | 39 +++++++++++++++
 .../gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch  | 56 ++++++++++++++++++++++
 .../gmp/{gmp => gmp-6.0.0}/amd64.patch             |  0
 .../append_user_provided_flags.patch               |  0
 .../gmp/{gmp => gmp-6.0.0}/configure.patch         |  0
 .../gmp/{gmp => gmp-6.0.0}/gmp-6.0.0-ppc64.patch   |  0
 .../gmp/{gmp => gmp-6.0.0}/use-includedir.patch    |  0
 meta/recipes-support/gmp/gmp.inc                   | 19 +-------
 meta/recipes-support/gmp/gmp_4.2.1.bb              | 15 ++++++
 meta/recipes-support/gmp/gmp_6.0.0.bb              | 33 ++++++++++---
 10 files changed, 137 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
 rename meta/recipes-support/gmp/{gmp => gmp-6.0.0}/amd64.patch (100%)
 rename meta/recipes-support/gmp/{gmp => gmp-6.0.0}/append_user_provided_flags.patch (100%)
 rename meta/recipes-support/gmp/{gmp => gmp-6.0.0}/configure.patch (100%)
 rename meta/recipes-support/gmp/{gmp => gmp-6.0.0}/gmp-6.0.0-ppc64.patch (100%)
 rename meta/recipes-support/gmp/{gmp => gmp-6.0.0}/use-includedir.patch (100%)
 create mode 100644 meta/recipes-support/gmp/gmp_4.2.1.bb

diff --git a/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch b/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
new file mode 100644
index 0000000..5decb1c
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
@@ -0,0 +1,39 @@
+This patch was removed in f181c6ce8b3 when gmp 4.2.1 was mistakenly
+dropped.
+
+Upstream is not interested in patches for ancient versions.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+# "extern inline" in traditional gcc means that the function should be 
+# inlined wherever it's seen, while in C99, "extern inline" means that i
+# the function should only be inlined where the inline definition is 
+# seen while in other places it's not inlined:
+# http://gcc.gnu.org/ml/gcc/2006-11/msg00006.html
+#
+# gmp checks "--std=gnu99" to use C99 convention however it internally 
+# defines some "extern inline" functions in gmp.h, which is included
+# by mainly .c files and finally lead a flood of redefinition function
+# errors when linking objects together.
+#
+# So disable C99/ANSI detection to stick to tranditional gcc behavior
+#
+# by Kevin Tian <kevin.tian@intel.com>, 2010-08-13
+#
+# (this patch is licensed under GPLv2+)
+
+diff --git a/configure.in b/configure.in
+index 450cc92..aab0b59 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1869,9 +1869,7 @@ AC_SUBST(DEFN_LONG_LONG_LIMB)
+ 
+ # The C compiler and preprocessor, put into ANSI mode if possible.
+ AC_PROG_CC
+-AC_PROG_CC_STDC
+ AC_PROG_CPP
+-GMP_H_ANSI
+ 
+ 
+ # The C compiler on the build system, and associated tests.
diff --git a/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch b/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..63aed05
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
@@ -0,0 +1,56 @@
+automake 1.12 has depricated automatic de-ANSI-fication support
+
+this patch avoids these kinds of errors:
+
+| configure.in:2240: error: automatic de-ANSI-fication support has been removed
+| Makefile.am:28: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+
+This patch was removed in f181c6ce8b3 when gmp 4.2.1 was mistakenly
+dropped.
+
+Upstream is not interested in patches for ancient versions.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+Index: gmp-4.2.1/configure.in
+===================================================================
+--- gmp-4.2.1.orig/configure.in
++++ gmp-4.2.1/configure.in
+@@ -67,7 +67,7 @@ dnl
+ dnl  Note that there's a copy of these options in the top-level Makefile.am,
+ dnl  so update there too if changing anything.
+ dnl
+-AM_INIT_AUTOMAKE([1.8 gnu no-dependencies $(top_builddir)/ansi2knr])
++AM_INIT_AUTOMAKE([1.8 gnu no-dependencies])
+ AM_CONFIG_HEADER(config.h:config.in)
+ AM_MAINTAINER_MODE
+ 
+@@ -2022,9 +2022,6 @@ fi
+ echo "      MPN_PATH=\"$path\""
+ 
+ 
+-# Automake ansi2knr support.
+-AM_C_PROTOTYPES
+-
+ GMP_PROG_AR
+ GMP_PROG_NM
+ 
+Index: gmp-4.2.1/Makefile.am
+===================================================================
+--- gmp-4.2.1.orig/Makefile.am
++++ gmp-4.2.1/Makefile.am
+@@ -27,7 +27,7 @@
+ # Makefiles in subdirectories, but here we must omit it so automake gives
+ # the actual ansi2knr build rule, not "cd $(top_builddir) && make ansi2knr".
+ #
+-AUTOMAKE_OPTIONS = 1.8 gnu no-dependencies ansi2knr
++AUTOMAKE_OPTIONS = 1.8 gnu no-dependencies
+ 
+ 
+ # Libtool -version-info for libgmp.la and libmp.la.  See "Versioning" in the
diff --git a/meta/recipes-support/gmp/gmp/amd64.patch b/meta/recipes-support/gmp/gmp-6.0.0/amd64.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp/amd64.patch
rename to meta/recipes-support/gmp/gmp-6.0.0/amd64.patch
diff --git a/meta/recipes-support/gmp/gmp/append_user_provided_flags.patch b/meta/recipes-support/gmp/gmp-6.0.0/append_user_provided_flags.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp/append_user_provided_flags.patch
rename to meta/recipes-support/gmp/gmp-6.0.0/append_user_provided_flags.patch
diff --git a/meta/recipes-support/gmp/gmp/configure.patch b/meta/recipes-support/gmp/gmp-6.0.0/configure.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp/configure.patch
rename to meta/recipes-support/gmp/gmp-6.0.0/configure.patch
diff --git a/meta/recipes-support/gmp/gmp/gmp-6.0.0-ppc64.patch b/meta/recipes-support/gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp/gmp-6.0.0-ppc64.patch
rename to meta/recipes-support/gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch
diff --git a/meta/recipes-support/gmp/gmp/use-includedir.patch b/meta/recipes-support/gmp/gmp-6.0.0/use-includedir.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp/use-includedir.patch
rename to meta/recipes-support/gmp/gmp-6.0.0/use-includedir.patch
diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 65cde21..6752a39 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -2,32 +2,15 @@ SECTION = "devel"
 SUMMARY = "GNU multiprecision arithmetic library"
 DESCRIPTION = "GMP is a free library for arbitrary precision arithmetic, operating on signed integers, rational numbers, and floating point numbers"
 HOMEPAGE = "http://gmplib.org/"
-LICENSE = "GPLv3 LGPLv3"
 
 REVISION ?= ""
-
-SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
-	   file://configure.patch \
-	   file://amd64.patch "
+SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2"
 
 inherit autotools texinfo
 
 ARM_INSTRUCTION_SET = "arm"
 
-acpaths = ""
-
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
-
-EXTRA_OECONF += " --enable-cxx=detect"
-
-PACKAGES =+ "libgmpxx"
-FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
-
-do_install_append_class-target() {
-	sed -i "s|--sysroot=${STAGING_DIR_HOST}||g" ${D}${includedir}/gmp.h
-}
-
-SSTATE_SCAN_FILES += "gmp.h"
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
new file mode 100644
index 0000000..928c01a
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -0,0 +1,15 @@
+require gmp.inc
+
+LICENSE = "LGPLv2.1+ & GPLv2+"
+LICENSE_${PN} = "LGPLv2.1+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
+                    file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
+                    file://gmp-h.in;beginline=6;endline=21;md5=e056f74a12c3277d730dbcfb85d2ca34"
+
+SRC_URI += "file://disable-stdc.patch \
+            file://gmp_fix_for_automake-1.12.patch \
+            "
+
+SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
+SRC_URI[sha256sum] = "d07ffcb37eecec35c5ec72516d10b35fdf6e6fef1fcf1dcd37e30b8cbf8bf941"
diff --git a/meta/recipes-support/gmp/gmp_6.0.0.bb b/meta/recipes-support/gmp/gmp_6.0.0.bb
index 6218491..19b63e5 100644
--- a/meta/recipes-support/gmp/gmp_6.0.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.0.0.bb
@@ -1,14 +1,33 @@
 require gmp.inc
-LICENSE="GPLv2 | LGPLv3"
+
+LICENSE="GPLv2+ | LGPLv3+"
+
 REVISION="a"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-		    file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
-		    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-"
-SRC_URI_append = " file://use-includedir.patch \
-                   file://append_user_provided_flags.patch \
-                   file://gmp-6.0.0-ppc64.patch \
+                   file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
+                   file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 "
 
+SRC_URI += "file://configure.patch \
+            file://amd64.patch \
+            file://use-includedir.patch \
+            file://append_user_provided_flags.patch \
+            file://gmp-6.0.0-ppc64.patch \
+            "
 SRC_URI[md5sum] = "b7ff2d88cae7f8085bd5006096eed470"
 SRC_URI[sha256sum] = "7f8e9a804b9c6d07164cf754207be838ece1219425d64e28cfa3e70d5c759aaf"
+
+acpaths = ""
+
+EXTRA_OECONF += " --enable-cxx=detect"
+
+PACKAGES =+ "libgmpxx"
+FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
+
+do_install_append_class-target() {
+        sed -i "s|--sysroot=${STAGING_DIR_HOST}||g" ${D}${includedir}/gmp.h
+}
+
+SSTATE_SCAN_FILES += "gmp.h"
+
-- 
2.1.4



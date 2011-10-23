Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2rU-0005ru-2D
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250245"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:26:58 -0700
Message-Id: <d546fdc94cb627040c657facc23f00406967c838.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/27] libtool: Upgrade from 2.4 -> 2.4.2
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:32 -0000

From: Khem Raj <raj.khem@gmail.com>

Adjust prefix.patch and delete resolve-sysroot.patch
since its already applied upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtool/{libtool.inc => libtool-2.4.2.inc}     |   26 +++++++++---
 meta/recipes-devtools/libtool/libtool-2.4.inc      |   13 ------
 ...libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} |    2 +-
 ...btool-native_2.4.bb => libtool-native_2.4.2.bb} |    2 +-
 ...nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} |    2 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |   46 ++++++++++----------
 .../libtool/libtool/resolve-sysroot.patch          |   42 ------------------
 .../libtool/{libtool_2.4.bb => libtool_2.4.2.bb}   |    2 +-
 8 files changed, 47 insertions(+), 88 deletions(-)
 rename meta/recipes-devtools/libtool/{libtool.inc => libtool-2.4.2.inc} (57%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool-2.4.inc
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb => libtool-native_2.4.2.bb} (96%)
 rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} (97%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.bb => libtool_2.4.2.bb} (94%)

diff --git a/meta/recipes-devtools/libtool/libtool.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
similarity index 57%
rename from meta/recipes-devtools/libtool/libtool.inc
rename to meta/recipes-devtools/libtool/libtool-2.4.2.inc
index ef9095b..1f652ef 100644
--- a/meta/recipes-devtools/libtool/libtool.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -1,4 +1,3 @@
-SUMMARY = "Generic library support script"
 DESCRIPTION = "This is GNU libtool, a generic library support script. \
 Libtool hides the complexity of generating special library types \
 (such as shared libraries) behind a consistent interface."
@@ -8,21 +7,36 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
     file://libltdl/COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
+INC_PR = "r0"
+
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
            file://prefix-manpage-fix.patch \
            file://rename-with-sysroot.patch \
-           file://resolve-sysroot.patch \
            file://use-sysroot-in-libpath.patch \
            file://fix-final-rpath.patch \
            file://avoid_absolute_paths_for_general_utils.patch \
-           file://fix-rpath.patch "
+           file://fix-rpath.patch \
+          "
+
+SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
+SRC_URI[sha256sum] = "b38de44862a987293cd3d8dfae1c409d514b6c4e794ebc93648febf9afc38918"
 
 do_compile_prepend () {
-	# Sometimes this file doesn't get rebuilt, force the issue
-	rm -f ${S}/libltdl/config/ltmain.sh
-	make libltdl/config/ltmain.sh
+        # Sometimes this file doesn't get rebuilt, force the issue
+        rm -f ${S}/libltdl/config/ltmain.sh
+        make libltdl/config/ltmain.sh
 }
 
 inherit autotools
 EXTRA_AUTORECONF = "--exclude=libtoolize"
+
+DEPENDS = "libtool-native"
+
+PACKAGES =+ "libltdl libltdl-dev libltdl-dbg"
+FILES_${PN} += "${datadir}/aclocal*"
+FILES_libltdl = "${libdir}/libltdl.so.*"
+FILES_libltdl-dev = "${libdir}/libltdl.* ${includedir}/ltdl.h"
+FILES_libltdl-dbg = "${libdir}/.debug/"
+
+EXTRA_OECONF = "--with-sysroot"
diff --git a/meta/recipes-devtools/libtool/libtool-2.4.inc b/meta/recipes-devtools/libtool/libtool-2.4.inc
deleted file mode 100644
index e3d17b7..0000000
--- a/meta/recipes-devtools/libtool/libtool-2.4.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-require libtool.inc
-DEPENDS = "libtool-native"
-
-PACKAGES =+ "libltdl libltdl-dev libltdl-dbg"
-FILES_${PN} += "${datadir}/aclocal*"
-FILES_libltdl = "${libdir}/libltdl.so.*"
-FILES_libltdl-dev = "${libdir}/libltdl.* ${includedir}/ltdl.h"
-FILES_libltdl-dbg = "${libdir}/.debug/"
-
-SRC_URI[md5sum] = "b32b04148ecdd7344abc6fe8bd1bb021"
-SRC_URI[sha256sum] = "13df57ab63a94e196c5d6e95d64e53262834fe780d5e82c28f177f9f71ddf62e"
-
-EXTRA_OECONF = "--with-sysroot"
\ No newline at end of file
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
similarity index 98%
rename from meta/recipes-devtools/libtool/libtool-cross_2.4.bb
rename to meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
index 6d512b1..b7fe851 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-PR = "r4"
+PR = "${INC_PR}.0"
 PACKAGES = ""
 SRC_URI += "file://prefix.patch"
 
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
similarity index 96%
rename from meta/recipes-devtools/libtool/libtool-native_2.4.bb
rename to meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
index 3d0998e..f12e6a1 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
@@ -2,7 +2,7 @@ require libtool-${PV}.inc
 
 DEPENDS = ""
 
-PR = "r4"
+PR = "${INC_PR}.0"
 SRC_URI += "file://prefix.patch"
 
 inherit native
diff --git a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
similarity index 97%
rename from meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
rename to meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
index a96d1d1..bd45dfe 100644
--- a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-PR = "r4"
+PR = "${INC_PR}.0"
 SRC_URI += "file://prefix.patch"
 
 inherit nativesdk
diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch b/meta/recipes-devtools/libtool/libtool/prefix.patch
index 1b20324..fabec7a 100644
--- a/meta/recipes-devtools/libtool/libtool/prefix.patch
+++ b/meta/recipes-devtools/libtool/libtool/prefix.patch
@@ -9,11 +9,11 @@ Updated: Date: 2010/06/28
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
 
-Index: libtool-2.4/libltdl/m4/libtool.m4
+Index: libtool-2.4.2/libltdl/m4/libtool.m4
 ===================================================================
---- libtool-2.4.orig/libltdl/m4/libtool.m4
-+++ libtool-2.4/libltdl/m4/libtool.m4
-@@ -94,7 +94,8 @@ _LT_SET_OPTIONS([$0], [$1])
+--- libtool-2.4.2.orig/libltdl/m4/libtool.m4	2011-10-19 21:22:53.000000000 -0700
++++ libtool-2.4.2/libltdl/m4/libtool.m4	2011-10-19 21:23:30.716036612 -0700
+@@ -94,7 +94,8 @@
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -23,7 +23,7 @@ Index: libtool-2.4/libltdl/m4/libtool.m4
  AC_SUBST(LIBTOOL)dnl
  
  _LT_SETUP
-@@ -204,7 +205,7 @@ aix3*)
+@@ -206,7 +207,7 @@
  esac
  
  # Global variables:
@@ -32,11 +32,11 @@ Index: libtool-2.4/libltdl/m4/libtool.m4
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-Index: libtool-2.4/Makefile.am
+Index: libtool-2.4.2/Makefile.am
 ===================================================================
---- libtool-2.4.orig/Makefile.am
-+++ libtool-2.4/Makefile.am
-@@ -31,7 +31,7 @@ AM_LDFLAGS		=
+--- libtool-2.4.2.orig/Makefile.am	2011-10-19 21:22:53.000000000 -0700
++++ libtool-2.4.2/Makefile.am	2011-10-19 21:25:33.152638032 -0700
+@@ -31,7 +31,7 @@
  DIST_SUBDIRS		= .
  EXTRA_DIST		=
  
@@ -45,8 +45,17 @@ Index: libtool-2.4/Makefile.am
  
  CLEANFILES		=
  MOSTLYCLEANFILES	=
-@@ -65,7 +65,7 @@ rebuild = rebuild=:; $(timestamp); corre
- ## ---------------- ##
+@@ -72,7 +72,7 @@
+ 		  ChangeLog.2002 ChangeLog.2003 ChangeLog.2004 \
+ 		  ChangeLog.2005 ChangeLog.2006 ChangeLog.2007 \
+ 		  ChangeLog.2008 ChangeLog.2009 ChangeLog.2010
+-CLEANFILES     += libtool libtoolize libtoolize.tmp \
++CLEANFILES     += $(host_alias)-libtool libtoolize libtoolize.tmp \
+ 		  $(auxdir)/ltmain.tmp $(m4dir)/ltversion.tmp
+ 
+ ## These are the replacements that need to be made at bootstrap time,
+@@ -231,7 +231,7 @@
+ 	-e 's,@SED\@,$(SED),g'
  
  # The libtool distributor and the standalone libtool script.
 -bin_SCRIPTS = libtoolize libtool
@@ -54,7 +63,7 @@ Index: libtool-2.4/Makefile.am
  
  libtoolize: $(srcdir)/libtoolize.in $(top_builddir)/config.status
  	rm -f libtoolize.tmp libtoolize
-@@ -90,8 +90,8 @@ $(srcdir)/libtoolize.in: $(sh_files) lib
+@@ -244,8 +244,8 @@
  # We used to do this with a 'stamp-vcl' file, but non-gmake builds
  # would rerun configure on every invocation, so now we manually
  # check the version numbers from the build rule when necessary.
@@ -65,7 +74,7 @@ Index: libtool-2.4/Makefile.am
  	if test -f "$$target"; then \
  	  set dummy `./$$target --version | sed 1q`; actualver="$$5"; \
  	  test "$$actualver" = "$$correctver" && rebuild=false; \
-@@ -100,8 +100,8 @@ libtool: $(top_builddir)/config.status $
+@@ -254,8 +254,8 @@
  	  case $$prereq in *ChangeLog);; *) rebuild=:;; esac; \
  	done; \
  	if $$rebuild; then \
@@ -76,16 +85,7 @@ Index: libtool-2.4/Makefile.am
  	fi
  
  .PHONY: configure-subdirs
-@@ -146,7 +146,7 @@ EXTRA_DIST     += bootstrap $(srcdir)/li
- 		  ChangeLog.2002 ChangeLog.2003 ChangeLog.2004 \
- 		  ChangeLog.2005 ChangeLog.2006 ChangeLog.2007 \
- 		  ChangeLog.2008 ChangeLog.2009
--CLEANFILES     += libtool libtoolize libtoolize.tmp \
-+CLEANFILES     += $(host_alias)-libtool libtoolize libtoolize.tmp \
- 		  $(auxdir)/ltmain.tmp $(m4dir)/ltversion.tmp
- 
- ## We build ltversion.m4 here, instead of from config.status,
-@@ -526,12 +526,12 @@ TESTS_ENVIRONMENT = MAKE="$(MAKE)" CC="$
+@@ -535,12 +535,12 @@
  
  BUILDCHECK_ENVIRONMENT = _lt_pkgdatadir="$(abs_top_srcdir)" \
  	LIBTOOLIZE="$(abs_top_builddir)/libtoolize" \
diff --git a/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch b/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
deleted file mode 100644
index 0341987..0000000
--- a/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Pending
-
-Sometimes .las have =/a/b/c.la in dependency_libs. This should be
-resolved to sysroot.
-
--Khem Raj <raj.khem@gmail.com>
-
-Index: libtool-2.4/libltdl/config/ltmain.m4sh
-===================================================================
---- libtool-2.4.orig/libltdl/config/ltmain.m4sh
-+++ libtool-2.4/libltdl/config/ltmain.m4sh
-@@ -8479,7 +8479,8 @@ EOF
- 	      *.la)
- 		func_basename "$deplib"
- 		name="$func_basename_result"
--		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
-+		func_resolve_sysroot "$deplib"
-+		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $func_resolve_sysroot_result`
- 		test -z "$libdir" && \
- 		  func_fatal_error "\`$deplib' is not a valid libtool archive"
- 		func_append newdependency_libs " ${lt_sysroot:+=}$libdir/$name"
-@@ -8505,7 +8506,9 @@ EOF
- 	      *.la)
- 	        func_basename "$lib"
- 		name="$func_basename_result"
--		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $lib`
-+		func_resolve_sysroot "$lib"
-+		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $func_resolve_sysroot_result`
-+
- 		test -z "$libdir" && \
- 		  func_fatal_error "\`$lib' is not a valid libtool archive"
- 		func_append newdlfiles " ${lt_sysroot:+=}$libdir/$name"
-@@ -8524,7 +8527,8 @@ EOF
- 		# the library:
- 		func_basename "$lib"
- 		name="$func_basename_result"
--		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $lib`
-+		func_resolve_sysroot "$lib"
-+		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $func_resolve_sysroot_result`
- 		test -z "$libdir" && \
- 		  func_fatal_error "\`$lib' is not a valid libtool archive"
- 		func_append newdlprefiles " ${lt_sysroot:+=}$libdir/$name"
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.bb b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
similarity index 94%
rename from meta/recipes-devtools/libtool/libtool_2.4.bb
rename to meta/recipes-devtools/libtool/libtool_2.4.2.bb
index 3002215..a2eb4ea 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-PR = "r4"
+PR = "${INC_PR}.0"
 
 #
 # We want the results of libtool-cross preserved - don't stage anything ourselves.
-- 
1.7.6.4




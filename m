Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RQl3U-0007yW-LJ
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 20:21:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,522,1315206000"; d="scan'208";a="86068969"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2011 11:14:39 -0800
Message-Id: <839d81b7f8239d5c3fb01646653d3414ba03dd23.1321470758.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
References: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1321470758.git.nitin.a.kamble@intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/8] libtool: upgrade from 2.4 to 2.4.2
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
X-List-Received-Date: Wed, 16 Nov 2011 19:21:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Rebased patches to the newer source code

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libtool/{libtool-2.4.inc => libtool-2.4.2.inc} |    6 +-
 ...libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} |    2 +-
 ...btool-native_2.4.bb => libtool-native_2.4.2.bb} |    2 +-
 ...nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} |    2 +-
 .../avoid_absolute_paths_for_general_utils.patch   |    8 +-
 .../libtool/libtool/fix-final-rpath.patch          |   10 +-
 .../libtool/libtool/fix-rpath.patch                |   12 +-
 .../libtool/libtool/prefix-manpage-fix.patch       |   10 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |   42 ++--
 .../libtool/libtool/rename-with-sysroot.patch      |  194 ++++++++++----------
 .../libtool/libtool/resolve-sysroot.patch          |   20 +--
 .../libtool/libtool/trailingslash.patch            |   10 +-
 .../libtool/libtool/use-sysroot-in-libpath.patch   |    8 +-
 .../libtool/{libtool_2.4.bb => libtool_2.4.2.bb}   |    2 +-
 14 files changed, 159 insertions(+), 169 deletions(-)
 rename meta/recipes-devtools/libtool/{libtool-2.4.inc => libtool-2.4.2.inc} (61%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} (99%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb => libtool-native_2.4.2.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool_2.4.bb => libtool_2.4.2.bb} (97%)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
similarity index 61%
rename from meta/recipes-devtools/libtool/libtool-2.4.inc
rename to meta/recipes-devtools/libtool/libtool-2.4.2.inc
index e3d17b7..7f610af 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -7,7 +7,7 @@ FILES_libltdl = "${libdir}/libltdl.so.*"
 FILES_libltdl-dev = "${libdir}/libltdl.* ${includedir}/ltdl.h"
 FILES_libltdl-dbg = "${libdir}/.debug/"
 
-SRC_URI[md5sum] = "b32b04148ecdd7344abc6fe8bd1bb021"
-SRC_URI[sha256sum] = "13df57ab63a94e196c5d6e95d64e53262834fe780d5e82c28f177f9f71ddf62e"
+SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
+SRC_URI[sha256sum] = "b38de44862a987293cd3d8dfae1c409d514b6c4e794ebc93648febf9afc38918"
 
-EXTRA_OECONF = "--with-sysroot"
\ No newline at end of file
+EXTRA_OECONF = "--with-sysroot"
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
similarity index 99%
rename from meta/recipes-devtools/libtool/libtool-cross_2.4.bb
rename to meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
index 6d512b1..d669177 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-PR = "r4"
+PR = "r0"
 PACKAGES = ""
 SRC_URI += "file://prefix.patch"
 
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
similarity index 98%
rename from meta/recipes-devtools/libtool/libtool-native_2.4.bb
rename to meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
index 3d0998e..e40b9de 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
@@ -2,7 +2,7 @@ require libtool-${PV}.inc
 
 DEPENDS = ""
 
-PR = "r4"
+PR = "r0"
 SRC_URI += "file://prefix.patch"
 
 inherit native
diff --git a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
similarity index 98%
rename from meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
rename to meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
index a96d1d1..55506ed 100644
--- a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-PR = "r4"
+PR = "r0"
 SRC_URI += "file://prefix.patch"
 
 inherit nativesdk
diff --git a/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch b/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch
index 6cc88d8..3c751ed 100644
--- a/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch
+++ b/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch
@@ -12,11 +12,11 @@ Nitin A Kamble <nitin.a.kamble@intel.com>
 2011/02/18
 
 
-Index: libtool-2.4/libltdl/config/general.m4sh
+Index: libtool-2.4.2/libltdl/config/general.m4sh
 ===================================================================
---- libtool-2.4.orig/libltdl/config/general.m4sh	2010-08-31 23:02:45.000000000 -0700
-+++ libtool-2.4/libltdl/config/general.m4sh	2011-02-18 09:59:09.482038240 -0800
-@@ -45,15 +45,15 @@
+--- libtool-2.4.2.orig/libltdl/config/general.m4sh
++++ libtool-2.4.2/libltdl/config/general.m4sh
+@@ -45,15 +45,15 @@ progpath="$0"
  M4SH_VERBATIM([[
  : ${CP="cp -f"}
  test "${ECHO+set}" = set || ECHO=${as_echo-'printf %s\n'}
diff --git a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch b/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
index 4c36e4e..5c275ff 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
@@ -7,11 +7,11 @@ This works around the issue until it gets sorted out upstream.
 Fix suggested by Richard Purdie <richard.purdie@intel.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-Index: libtool-2.4/libltdl/config/ltmain.m4sh
+Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
 ===================================================================
---- libtool-2.4.orig/libltdl/config/ltmain.m4sh	2011-01-13 14:10:14.580025108 +0000
-+++ libtool-2.4/libltdl/config/ltmain.m4sh	2011-01-13 15:10:18.540025113 +0000
-@@ -7246,9 +7246,11 @@
+--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
++++ libtool-2.4.2/libltdl/config/ltmain.m4sh
+@@ -7268,9 +7268,11 @@ EOF
  	  test "$opt_mode" != relink && rpath="$compile_rpath$rpath"
  	  for libdir in $rpath; do
  	    if test -n "$hardcode_libdir_flag_spec"; then
@@ -25,7 +25,7 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
  		if test -z "$hardcode_libdirs"; then
  		  hardcode_libdirs="$libdir"
  		else
-@@ -7981,6 +7983,10 @@
+@@ -7999,6 +8001,10 @@ EOF
        hardcode_libdirs=
        for libdir in $compile_rpath $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
diff --git a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch b/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
index 3cdeaec..d35bac0 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
@@ -6,11 +6,11 @@ RP 23/9/2011
 
 Upstream-status: Pending
 
-Index: libtool-2.4/libltdl/config/ltmain.m4sh
+Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
 ===================================================================
---- libtool-2.4.orig/libltdl/config/ltmain.m4sh	2011-09-23 08:38:06.365043626 +0100
-+++ libtool-2.4/libltdl/config/ltmain.m4sh	2011-09-23 09:57:05.235003068 +0100
-@@ -7264,8 +7264,14 @@
+--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
++++ libtool-2.4.2/libltdl/config/ltmain.m4sh
+@@ -7286,8 +7286,14 @@ EOF
  		  esac
  		fi
  	      else
@@ -27,7 +27,7 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
  	      fi
  	    elif test -n "$runpath_var"; then
  	      case "$perm_rpath " in
-@@ -8001,8 +8007,14 @@
+@@ -8019,8 +8025,14 @@ EOF
  	      esac
  	    fi
  	  else
@@ -44,7 +44,7 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
  	  fi
  	elif test -n "$runpath_var"; then
  	  case "$perm_rpath " in
-@@ -8052,8 +8064,14 @@
+@@ -8070,8 +8082,14 @@ EOF
  	      esac
  	    fi
  	  else
diff --git a/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch b/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
index f9de383..879778c 100644
--- a/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
+++ b/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
@@ -6,12 +6,12 @@ nstead use the build version of libtool to generate the man pages.
 Date: 2010/07/09
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: libtool-2.2.10/Makefile.am
+Index: libtool-2.4.2/Makefile.am
 ===================================================================
---- libtool-2.2.10.orig/Makefile.am
-+++ libtool-2.2.10/Makefile.am
-@@ -337,7 +337,7 @@ update_mans = \
-   PATH=.$(PATH_SEPARATOR)$$PATH; export PATH; \
+--- libtool-2.4.2.orig/Makefile.am
++++ libtool-2.4.2/Makefile.am
+@@ -333,7 +333,7 @@ update_mans = \
+   PATH=".$(PATH_SEPARATOR)$$PATH"; export PATH; \
    $(HELP2MAN) --output=$@
  $(srcdir)/doc/libtool.1: $(srcdir)/$(auxdir)/ltmain.sh
 -	$(update_mans) --help-option=--help-all libtool
diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch b/meta/recipes-devtools/libtool/libtool/prefix.patch
index e6eca1f..5e46e68 100644
--- a/meta/recipes-devtools/libtool/libtool/prefix.patch
+++ b/meta/recipes-devtools/libtool/libtool/prefix.patch
@@ -18,10 +18,10 @@ the simplest fix is just to remove $SHELL.
 Updated: Date: 2011/11/09
 RP
 
-Index: libtool-2.4/libltdl/m4/libtool.m4
+Index: libtool-2.4.2/libltdl/m4/libtool.m4
 ===================================================================
---- libtool-2.4.orig/libltdl/m4/libtool.m4
-+++ libtool-2.4/libltdl/m4/libtool.m4
+--- libtool-2.4.2.orig/libltdl/m4/libtool.m4
++++ libtool-2.4.2/libltdl/m4/libtool.m4
 @@ -94,7 +94,8 @@ _LT_SET_OPTIONS([$0], [$1])
  LIBTOOL_DEPS="$ltmain"
  
@@ -32,7 +32,7 @@ Index: libtool-2.4/libltdl/m4/libtool.m4
  AC_SUBST(LIBTOOL)dnl
  
  _LT_SETUP
-@@ -204,7 +205,7 @@ aix3*)
+@@ -206,7 +207,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -41,10 +41,10 @@ Index: libtool-2.4/libltdl/m4/libtool.m4
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-Index: libtool-2.4/Makefile.am
+Index: libtool-2.4.2/Makefile.am
 ===================================================================
---- libtool-2.4.orig/Makefile.am
-+++ libtool-2.4/Makefile.am
+--- libtool-2.4.2.orig/Makefile.am
++++ libtool-2.4.2/Makefile.am
 @@ -31,7 +31,7 @@ AM_LDFLAGS		=
  DIST_SUBDIRS		= .
  EXTRA_DIST		=
@@ -54,8 +54,17 @@ Index: libtool-2.4/Makefile.am
  
  CLEANFILES		=
  MOSTLYCLEANFILES	=
-@@ -65,7 +65,7 @@ rebuild = rebuild=:; $(timestamp); corre
- ## ---------------- ##
+@@ -72,7 +72,7 @@ EXTRA_DIST     += bootstrap $(srcdir)/li
+ 		  ChangeLog.2002 ChangeLog.2003 ChangeLog.2004 \
+ 		  ChangeLog.2005 ChangeLog.2006 ChangeLog.2007 \
+ 		  ChangeLog.2008 ChangeLog.2009 ChangeLog.2010
+-CLEANFILES     += libtool libtoolize libtoolize.tmp \
++CLEANFILES     += $(host_alias)-libtool libtoolize libtoolize.tmp \
+ 		  $(auxdir)/ltmain.tmp $(m4dir)/ltversion.tmp
+ 
+ ## These are the replacements that need to be made at bootstrap time,
+@@ -231,7 +231,7 @@ configure_edit = sed \
+ 	-e 's,@SED\@,$(SED),g'
  
  # The libtool distributor and the standalone libtool script.
 -bin_SCRIPTS = libtoolize libtool
@@ -63,7 +72,7 @@ Index: libtool-2.4/Makefile.am
  
  libtoolize: $(srcdir)/libtoolize.in $(top_builddir)/config.status
  	rm -f libtoolize.tmp libtoolize
-@@ -90,8 +90,8 @@ $(srcdir)/libtoolize.in: $(sh_files) lib
+@@ -244,8 +244,8 @@ libtoolize: $(srcdir)/libtoolize.in $(to
  # We used to do this with a 'stamp-vcl' file, but non-gmake builds
  # would rerun configure on every invocation, so now we manually
  # check the version numbers from the build rule when necessary.
@@ -74,7 +83,7 @@ Index: libtool-2.4/Makefile.am
  	if test -f "$$target"; then \
  	  set dummy `./$$target --version | sed 1q`; actualver="$$5"; \
  	  test "$$actualver" = "$$correctver" && rebuild=false; \
-@@ -100,8 +100,8 @@ libtool: $(top_builddir)/config.status $
+@@ -254,8 +254,8 @@ libtool: $(top_builddir)/config.status $
  	  case $$prereq in *ChangeLog);; *) rebuild=:;; esac; \
  	done; \
  	if $$rebuild; then \
@@ -85,16 +94,7 @@ Index: libtool-2.4/Makefile.am
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
+@@ -535,12 +535,12 @@ TESTS_ENVIRONMENT = MAKE="$(MAKE)" CC="$
  
  BUILDCHECK_ENVIRONMENT = _lt_pkgdatadir="$(abs_top_srcdir)" \
  	LIBTOOLIZE="$(abs_top_builddir)/libtoolize" \
diff --git a/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch b/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
index 9c8696b..438c639 100644
--- a/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
+++ b/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
@@ -10,21 +10,21 @@ http://lists.gnu.org/archive/html/libtool/2010-10/msg00048.html
 
 -Khem Raj <raj.khem@gmail.com>
 
-Index: libtool-2.4/configure
+Index: libtool-2.4.2/configure
 ===================================================================
---- libtool-2.4.orig/configure
-+++ libtool-2.4/configure
-@@ -786,7 +786,7 @@ enable_static
+--- libtool-2.4.2.orig/configure
++++ libtool-2.4.2/configure
+@@ -795,7 +795,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
 -with_sysroot
 +with_libtool_sysroot
  enable_libtool_lock
- with_gnu_ld
  '
+       ac_precious_vars='build_alias
 @@ -1451,7 +1451,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -32,7 +32,7 @@ Index: libtool-2.4/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -6798,29 +6798,29 @@ fi
+@@ -6804,29 +6804,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -70,11 +70,11 @@ Index: libtool-2.4/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/libltdl/configure
+Index: libtool-2.4.2/libltdl/configure
 ===================================================================
---- libtool-2.4.orig/libltdl/configure
-+++ libtool-2.4/libltdl/configure
-@@ -739,7 +739,7 @@ with_pic
+--- libtool-2.4.2.orig/libltdl/configure
++++ libtool-2.4.2/libltdl/configure
+@@ -747,7 +747,7 @@ with_pic
  enable_fast_install
  enable_dependency_tracking
  with_gnu_ld
@@ -83,8 +83,8 @@ Index: libtool-2.4/libltdl/configure
  enable_libtool_lock
  enable_ltdl_install
  '
-@@ -1388,7 +1388,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+@@ -1395,7 +1395,7 @@ Optional Packages:
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -92,7 +92,7 @@ Index: libtool-2.4/libltdl/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -6004,29 +6004,29 @@ fi
+@@ -6017,29 +6017,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -130,11 +130,11 @@ Index: libtool-2.4/libltdl/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/libltdl/m4/libtool.m4
+Index: libtool-2.4.2/libltdl/m4/libtool.m4
 ===================================================================
---- libtool-2.4.orig/libltdl/m4/libtool.m4
-+++ libtool-2.4/libltdl/m4/libtool.m4
-@@ -1180,27 +1180,27 @@ _LT_DECL([], [ECHO], [1], [An echo progr
+--- libtool-2.4.2.orig/libltdl/m4/libtool.m4
++++ libtool-2.4.2/libltdl/m4/libtool.m4
+@@ -1224,27 +1224,27 @@ _LT_DECL([], [ECHO], [1], [An echo progr
  # ----------------
  AC_DEFUN([_LT_WITH_SYSROOT],
  [AC_MSG_CHECKING([for sysroot])
@@ -168,11 +168,11 @@ Index: libtool-2.4/libltdl/m4/libtool.m4
     AC_MSG_ERROR([The sysroot must be an absolute path.])
     ;;
  esac
-Index: libtool-2.4/tests/cdemo/configure
+Index: libtool-2.4.2/tests/cdemo/configure
 ===================================================================
---- libtool-2.4.orig/tests/cdemo/configure
-+++ libtool-2.4/tests/cdemo/configure
-@@ -726,7 +726,7 @@ enable_static
+--- libtool-2.4.2.orig/tests/cdemo/configure
++++ libtool-2.4.2/tests/cdemo/configure
+@@ -734,7 +734,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -181,8 +181,8 @@ Index: libtool-2.4/tests/cdemo/configure
  enable_libtool_lock
  '
        ac_precious_vars='build_alias
-@@ -1373,7 +1373,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+@@ -1380,7 +1380,7 @@ Optional Packages:
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -190,7 +190,7 @@ Index: libtool-2.4/tests/cdemo/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -5884,29 +5884,29 @@ fi
+@@ -5897,29 +5897,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -228,11 +228,11 @@ Index: libtool-2.4/tests/cdemo/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/tests/demo/configure
+Index: libtool-2.4.2/tests/demo/configure
 ===================================================================
---- libtool-2.4.orig/tests/demo/configure
-+++ libtool-2.4/tests/demo/configure
-@@ -730,7 +730,7 @@ enable_static
+--- libtool-2.4.2.orig/tests/demo/configure
++++ libtool-2.4.2/tests/demo/configure
+@@ -738,7 +738,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -241,8 +241,8 @@ Index: libtool-2.4/tests/demo/configure
  enable_libtool_lock
  '
        ac_precious_vars='build_alias
-@@ -1377,7 +1377,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+@@ -1384,7 +1384,7 @@ Optional Packages:
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -250,7 +250,7 @@ Index: libtool-2.4/tests/demo/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -5882,29 +5882,29 @@ fi
+@@ -5895,29 +5895,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -288,11 +288,11 @@ Index: libtool-2.4/tests/demo/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/tests/depdemo/configure
+Index: libtool-2.4.2/tests/depdemo/configure
 ===================================================================
---- libtool-2.4.orig/tests/depdemo/configure
-+++ libtool-2.4/tests/depdemo/configure
-@@ -728,7 +728,7 @@ enable_static
+--- libtool-2.4.2.orig/tests/depdemo/configure
++++ libtool-2.4.2/tests/depdemo/configure
+@@ -736,7 +736,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -301,8 +301,8 @@ Index: libtool-2.4/tests/depdemo/configure
  enable_libtool_lock
  '
        ac_precious_vars='build_alias
-@@ -1375,7 +1375,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+@@ -1382,7 +1382,7 @@ Optional Packages:
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -310,7 +310,7 @@ Index: libtool-2.4/tests/depdemo/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -5879,29 +5879,29 @@ fi
+@@ -5892,29 +5892,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -348,11 +348,11 @@ Index: libtool-2.4/tests/depdemo/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/tests/f77demo/configure
+Index: libtool-2.4.2/tests/f77demo/configure
 ===================================================================
---- libtool-2.4.orig/tests/f77demo/configure
-+++ libtool-2.4/tests/f77demo/configure
-@@ -730,7 +730,7 @@ enable_static
+--- libtool-2.4.2.orig/tests/f77demo/configure
++++ libtool-2.4.2/tests/f77demo/configure
+@@ -738,7 +738,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -361,8 +361,8 @@ Index: libtool-2.4/tests/f77demo/configure
  enable_libtool_lock
  '
        ac_precious_vars='build_alias
-@@ -1382,7 +1382,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+@@ -1387,7 +1387,7 @@ Optional Packages:
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -370,7 +370,7 @@ Index: libtool-2.4/tests/f77demo/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -6864,29 +6864,29 @@ fi
+@@ -6877,29 +6877,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -408,11 +408,11 @@ Index: libtool-2.4/tests/f77demo/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/tests/fcdemo/configure
+Index: libtool-2.4.2/tests/fcdemo/configure
 ===================================================================
---- libtool-2.4.orig/tests/fcdemo/configure
-+++ libtool-2.4/tests/fcdemo/configure
-@@ -731,7 +731,7 @@ enable_static
+--- libtool-2.4.2.orig/tests/fcdemo/configure
++++ libtool-2.4.2/tests/fcdemo/configure
+@@ -739,7 +739,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -421,8 +421,8 @@ Index: libtool-2.4/tests/fcdemo/configure
  enable_libtool_lock
  '
        ac_precious_vars='build_alias
-@@ -1383,7 +1383,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+@@ -1388,7 +1388,7 @@ Optional Packages:
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -430,7 +430,7 @@ Index: libtool-2.4/tests/fcdemo/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -6963,29 +6963,29 @@ fi
+@@ -6976,29 +6976,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -468,11 +468,11 @@ Index: libtool-2.4/tests/fcdemo/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/tests/mdemo/configure
+Index: libtool-2.4.2/tests/mdemo/configure
 ===================================================================
---- libtool-2.4.orig/tests/mdemo/configure
-+++ libtool-2.4/tests/mdemo/configure
-@@ -734,7 +734,7 @@ enable_static
+--- libtool-2.4.2.orig/tests/mdemo/configure
++++ libtool-2.4.2/tests/mdemo/configure
+@@ -742,7 +742,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -481,8 +481,8 @@ Index: libtool-2.4/tests/mdemo/configure
  enable_libtool_lock
  '
        ac_precious_vars='build_alias
-@@ -1381,7 +1381,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+@@ -1388,7 +1388,7 @@ Optional Packages:
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -490,7 +490,7 @@ Index: libtool-2.4/tests/mdemo/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -5911,29 +5911,29 @@ fi
+@@ -5924,29 +5924,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -528,11 +528,11 @@ Index: libtool-2.4/tests/mdemo/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/tests/mdemo2/configure
+Index: libtool-2.4.2/tests/mdemo2/configure
 ===================================================================
---- libtool-2.4.orig/tests/mdemo2/configure
-+++ libtool-2.4/tests/mdemo2/configure
-@@ -726,7 +726,7 @@ enable_static
+--- libtool-2.4.2.orig/tests/mdemo2/configure
++++ libtool-2.4.2/tests/mdemo2/configure
+@@ -734,7 +734,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -541,8 +541,8 @@ Index: libtool-2.4/tests/mdemo2/configure
  enable_libtool_lock
  '
        ac_precious_vars='build_alias
-@@ -1373,7 +1373,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+@@ -1380,7 +1380,7 @@ Optional Packages:
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -550,7 +550,7 @@ Index: libtool-2.4/tests/mdemo2/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -5884,29 +5884,29 @@ fi
+@@ -5897,29 +5897,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -588,11 +588,11 @@ Index: libtool-2.4/tests/mdemo2/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/tests/pdemo/configure
+Index: libtool-2.4.2/tests/pdemo/configure
 ===================================================================
---- libtool-2.4.orig/tests/pdemo/configure
-+++ libtool-2.4/tests/pdemo/configure
-@@ -729,7 +729,7 @@ enable_static
+--- libtool-2.4.2.orig/tests/pdemo/configure
++++ libtool-2.4.2/tests/pdemo/configure
+@@ -737,7 +737,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -601,8 +601,8 @@ Index: libtool-2.4/tests/pdemo/configure
  enable_libtool_lock
  '
        ac_precious_vars='build_alias
-@@ -1376,7 +1376,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+@@ -1383,7 +1383,7 @@ Optional Packages:
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -610,7 +610,7 @@ Index: libtool-2.4/tests/pdemo/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -5887,29 +5887,29 @@ fi
+@@ -5900,29 +5900,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -648,10 +648,10 @@ Index: libtool-2.4/tests/pdemo/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/tests/sysroot.at
+Index: libtool-2.4.2/tests/sysroot.at
 ===================================================================
---- libtool-2.4.orig/tests/sysroot.at
-+++ libtool-2.4/tests/sysroot.at
+--- libtool-2.4.2.orig/tests/sysroot.at
++++ libtool-2.4.2/tests/sysroot.at
 @@ -64,7 +64,7 @@ while read file; do
  done])
  
@@ -679,21 +679,21 @@ Index: libtool-2.4/tests/sysroot.at
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  ]])
-Index: libtool-2.4/tests/tagdemo/configure
+Index: libtool-2.4.2/tests/tagdemo/configure
 ===================================================================
---- libtool-2.4.orig/tests/tagdemo/configure
-+++ libtool-2.4/tests/tagdemo/configure
-@@ -736,7 +736,7 @@ enable_static
+--- libtool-2.4.2.orig/tests/tagdemo/configure
++++ libtool-2.4.2/tests/tagdemo/configure
+@@ -744,7 +744,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
 -with_sysroot
 +with_libtool_sysroot
  enable_libtool_lock
- with_gnu_ld
  '
-@@ -1392,7 +1392,7 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
+       ac_precious_vars='build_alias
+@@ -1395,7 +1395,7 @@ Optional Packages:
+   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 -  --with-sysroot=DIR Search for dependent libraries within DIR
@@ -701,7 +701,7 @@ Index: libtool-2.4/tests/tagdemo/configure
                          (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
-@@ -6907,29 +6907,29 @@ fi
+@@ -6916,29 +6916,29 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
  $as_echo_n "checking for sysroot... " >&6; }
  
@@ -739,11 +739,11 @@ Index: libtool-2.4/tests/tagdemo/configure
     as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
     ;;
  esac
-Index: libtool-2.4/tests/testsuite
+Index: libtool-2.4.2/tests/testsuite
 ===================================================================
---- libtool-2.4.orig/tests/testsuite
-+++ libtool-2.4/tests/testsuite
-@@ -25277,7 +25277,7 @@ $at_traceon; }
+--- libtool-2.4.2.orig/tests/testsuite
++++ libtool-2.4.2/tests/testsuite
+@@ -26676,7 +26676,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -752,7 +752,7 @@ Index: libtool-2.4/tests/testsuite
  
  #???
  if test "$shlibpath_var" = PATH; then
-@@ -25475,7 +25475,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -26874,7 +26874,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -761,7 +761,7 @@ Index: libtool-2.4/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -25652,7 +25652,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -27051,7 +27051,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
@@ -770,7 +770,7 @@ Index: libtool-2.4/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -25993,7 +25993,7 @@ $at_traceon; }
+@@ -27392,7 +27392,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -779,7 +779,7 @@ Index: libtool-2.4/tests/testsuite
  
  #???
  if test "$shlibpath_var" = PATH; then
-@@ -26191,7 +26191,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -27590,7 +27590,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -788,7 +788,7 @@ Index: libtool-2.4/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -26368,7 +26368,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -27767,7 +27767,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
@@ -797,7 +797,7 @@ Index: libtool-2.4/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -26709,7 +26709,7 @@ $at_traceon; }
+@@ -28108,7 +28108,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -806,7 +806,7 @@ Index: libtool-2.4/tests/testsuite
  
  #???
  if test "$shlibpath_var" = PATH; then
-@@ -26907,7 +26907,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -28306,7 +28306,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -815,7 +815,7 @@ Index: libtool-2.4/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -27084,7 +27084,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -28483,7 +28483,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
diff --git a/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch b/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
index 0341987..537bce2 100644
--- a/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
+++ b/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
@@ -5,21 +5,11 @@ resolved to sysroot.
 
 -Khem Raj <raj.khem@gmail.com>
 
-Index: libtool-2.4/libltdl/config/ltmain.m4sh
+Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
 ===================================================================
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
+--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
++++ libtool-2.4.2/libltdl/config/ltmain.m4sh
+@@ -8526,7 +8526,9 @@ EOF
  	      *.la)
  	        func_basename "$lib"
  		name="$func_basename_result"
@@ -30,7 +20,7 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
  		test -z "$libdir" && \
  		  func_fatal_error "\`$lib' is not a valid libtool archive"
  		func_append newdlfiles " ${lt_sysroot:+=}$libdir/$name"
-@@ -8524,7 +8527,8 @@ EOF
+@@ -8545,7 +8547,8 @@ EOF
  		# the library:
  		func_basename "$lib"
  		name="$func_basename_result"
diff --git a/meta/recipes-devtools/libtool/libtool/trailingslash.patch b/meta/recipes-devtools/libtool/libtool/trailingslash.patch
index d71a770..bb7a761 100644
--- a/meta/recipes-devtools/libtool/libtool/trailingslash.patch
+++ b/meta/recipes-devtools/libtool/libtool/trailingslash.patch
@@ -11,12 +11,12 @@ Merged a patch received from Gary Thomas <gary@mlbassoc.com>
 Date: 2010/07/12
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: libtool-2.2.10/libltdl/config/ltmain.m4sh
+Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
 ===================================================================
---- libtool-2.2.10.orig/libltdl/config/ltmain.m4sh
-+++ libtool-2.2.10/libltdl/config/ltmain.m4sh
-@@ -1634,8 +1634,15 @@ func_mode_install ()
- 	dir="$dir$objdir"
+--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
++++ libtool-2.4.2/libltdl/config/ltmain.m4sh
+@@ -2167,8 +2167,15 @@ func_mode_install ()
+ 	func_append dir "$objdir"
  
  	if test -n "$relink_command"; then
 +      # Strip any trailing slash from the destination.
diff --git a/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch b/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
index 5e2eec9..0cd66ad 100644
--- a/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
@@ -7,11 +7,11 @@ i.e. when lt_sysroot is not set, it will still behave the same and add
 
 -Khem Raj <raj.khem@gmail.com>
 
-Index: libtool-2.4/libltdl/config/ltmain.m4sh
+Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
 ===================================================================
---- libtool-2.4.orig/libltdl/config/ltmain.m4sh
-+++ libtool-2.4/libltdl/config/ltmain.m4sh
-@@ -6122,7 +6122,7 @@ func_mode_link ()
+--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
++++ libtool-2.4.2/libltdl/config/ltmain.m4sh
+@@ -6138,7 +6138,7 @@ func_mode_link ()
  	      fi
  	    else
  	      # We cannot seem to hardcode it, guess we'll fake it.
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.bb b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
similarity index 97%
rename from meta/recipes-devtools/libtool/libtool_2.4.bb
rename to meta/recipes-devtools/libtool/libtool_2.4.2.bb
index 3002215..0706cf2 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-PR = "r4"
+PR = "r0"
 
 #
 # We want the results of libtool-cross preserved - don't stage anything ourselves.
-- 
1.7.6.4




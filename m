Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB286CF34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:34:28 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Oct 2013 03:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,513,1378882800"; d="scan'208";a="376040036"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 17 Oct 2013 03:34:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:34:16 +0300
Message-Id: <4059e5822c96b94e06810a197ee28c082d6b7ee3.1382005791.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
Subject: [PATCH 6/8] tcl: upgrade to 8.6.1
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
X-List-Received-Date: Thu, 17 Oct 2013 10:34:28 -0000

Following patches were removed/refreshed:
 * let-DST-include-year-2099.patch - removed, fixed upstream
 * tcl-add-soname.patch - refreshed

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../tcltk/tcl/let-DST-include-year-2099.patch      |   35 ------------------
 .../tcltk/tcl/tcl-add-soname.patch                 |   38 ++++++++++----------
 .../tcltk/{tcl_8.6.0.bb => tcl_8.6.1.bb}           |    7 ++--
 3 files changed, 22 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch
 rename meta/recipes-devtools/tcltk/{tcl_8.6.0.bb => tcl_8.6.1.bb} (91%)

diff --git a/meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch b/meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch
deleted file mode 100644
index eef1812..0000000
--- a/meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f10135df3f4751d7c83a66561c988ae799b6372f Mon Sep 17 00:00:00 2001
-From: "Song.Li" <Song.Li@windriver.com>
-Date: Fri, 10 Aug 2012 13:07:20 +0800
-Subject: [PATCH] let DST include year 2099
-
-tcl puts Daylight Saving Time in deffect from 1916 to 2099,
-it should include the year 2099,becuase tcl
-self-contained testing have a DST testcase on 2099.
-so the condition statement "<2099" should be "<=2099"
-
-Upstream-Status: Submitted
-
-Signed-off-by: Song.Li <Song.Li@windriver.com>
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- library/clock.tcl |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/library/clock.tcl b/library/clock.tcl
-index 2e9cae7..e8efe4a 100644
---- a/library/clock.tcl
-+++ b/library/clock.tcl
-@@ -3945,7 +3945,7 @@ proc ::tcl::clock::ProcessPosixTimeZone { z } {
- 
-     # Put DST in effect in all years from 1916 to 2099.
- 
--    for { set y 1916 } { $y < 2099 } { incr y } {
-+    for { set y 1916 } { $y <= 2099 } { incr y } {
- 	set startTime [DeterminePosixDSTTime $z start $y]
- 	incr startTime [expr { - wide($stdOffset) }]
- 	set endTime [DeterminePosixDSTTime $z end $y]
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
index eca0a18..d3691f6 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Pending
 
-diff --git unix.orig/configure unix/configure
-index f778a7b..25083c2 100755
---- unix.orig/configure
-+++ unix/configure
-@@ -6889,6 +6889,7 @@ fi
+Index: unix/configure
+===================================================================
+--- unix.orig/configure	2013-09-19 23:17:13.000000000 +0300
++++ unix/configure	2013-10-16 15:58:37.450136217 +0300
+@@ -6899,6 +6899,7 @@
  	    LIBS="$LIBS -lc"
  	    SHLIB_CFLAGS=""
  	    SHLIB_SUFFIX=".so"
@@ -12,11 +12,19 @@ index f778a7b..25083c2 100755
  
  	    DL_OBJS="tclLoadDl.o"
  	    LD_LIBRARY_PATH_VAR="LIBPATH"
-diff --git unix.orig/tcl.m4 unix/tcl.m4
-index b13fddd..7254f66 100644
---- unix.orig/tcl.m4
-+++ unix/tcl.m4
-@@ -1408,12 +1408,15 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+Index: unix/tcl.m4
+===================================================================
+--- unix.orig/tcl.m4	2013-09-19 23:17:13.000000000 +0300
++++ unix/tcl.m4	2013-10-16 16:18:50.719586228 +0300
+@@ -1408,6 +1408,7 @@
+ 	Linux*|GNU*|NetBSD-Debian)
+ 	    SHLIB_CFLAGS="-fPIC"
+ 	    SHLIB_SUFFIX=".so"
++	    SHARED_LIB_SUFFIX='${TCL_TRIM_DOTS}\$\{DBGX\}.so.0'
+ 
+ 	    CFLAGS_OPTIMIZE="-O2"
+ 	    # egcs-2.91.66 on Redhat Linux 6.0 generates lots of warnings
+@@ -1415,12 +1416,15 @@
  	    # get rid of the warnings.
  	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
  
@@ -33,15 +41,7 @@ index b13fddd..7254f66 100644
  	    LD_SEARCH_FLAGS=${CC_SEARCH_FLAGS}
  	    AS_IF([test "`uname -m`" = "alpha"], [CFLAGS="$CFLAGS -mieee"])
  	    AS_IF([test $do64bit = yes], [
-@@ -1439,6 +1442,7 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
- 	GNU*)
- 	    SHLIB_CFLAGS="-fPIC"
- 	    SHLIB_SUFFIX=".so"
-+	    SHARED_LIB_SUFFIX='${TCL_TRIM_DOTS}\$\{DBGX\}.so.0'
- 
- 	    SHLIB_LD='${CC} -shared'
- 	    DL_OBJS=""
-@@ -2098,7 +2102,7 @@ dnl # preprocessing tests use only CPPFLAGS.
+@@ -2050,7 +2054,7 @@
  
      AS_IF([test "${SHARED_BUILD}" = 1 -a "${SHLIB_SUFFIX}" != ""], [
          LIB_SUFFIX=${SHARED_LIB_SUFFIX}
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.0.bb b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
similarity index 91%
rename from meta/recipes-devtools/tcltk/tcl_8.6.0.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.1.bb
index 8d4df30..e239708 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
@@ -19,10 +19,9 @@ SRC_URI = "${BASE_SRC_URI} \
 	   file://fix_issue_with_old_distro_glibc.patch \
 	   file://no_packages.patch \
 	   file://tcl-remove-hardcoded-install-path.patch \
-	   file://let-DST-include-year-2099.patch;patchdir=.. "
-
-SRC_URI[md5sum] = "573aa5fe678e9185ef2b3c56b24658d3"
-SRC_URI[sha256sum] = "354422b9c4791685499123b2dfe01faa98b555c08906c010cb4449ddc75dcade"
+       "
+SRC_URI[md5sum] = "aae4b701ee527c6e4e1a6f9c7399882e"
+SRC_URI[sha256sum] = "16ee769248e64ba1cae6b4834fcc4e4edd7470d881410e8d58f7dd1434343514"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
1.7.9.5



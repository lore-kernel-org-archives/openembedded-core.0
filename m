Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RGwno-0000MB-SY
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:53:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Oct 2011 10:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,380,1315206000"; d="scan'208";a="75875099"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2011 10:47:11 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 10:47:09 -0700
Message-Id: <ae26526088cce21d9566d5dc4dccc3e90115fb7a.1319132699.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <c12754ae1baee14c13a2467e31efd975f7f33258.1319132699.git.nitin.a.kamble@intel.com>
References: <c12754ae1baee14c13a2467e31efd975f7f33258.1319132699.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1319132699.git.nitin.a.kamble@intel.com>
References: <cover.1319132699.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/2] tcl: upgrade from 8.5.9 to 8.5.10
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
X-List-Received-Date: Thu, 20 Oct 2011 17:53:13 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../tcltk/tcl/fix_non_native_build_issue.patch     |   16 +++---------
 .../tcltk/tcl/tcl-add-soname.patch                 |   26 ++++++++++----------
 .../tcltk/{tcl_8.5.9.bb => tcl_8.5.10.bb}          |    6 ++--
 3 files changed, 20 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.5.9.bb => tcl_8.5.10.bb} (91%)

diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index e9b6793..9c2d379 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -4,7 +4,7 @@ Index: unix/Makefile.in
 ===================================================================
 --- unix.orig/Makefile.in
 +++ unix/Makefile.in
-@@ -619,20 +619,20 @@ ro-test: tcltest@EXEEXT@
+@@ -619,13 +619,13 @@ ro-test: tcltest@EXEEXT@
  shell: ${TCL_EXE}
  	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
  	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
@@ -19,16 +19,8 @@ Index: unix/Makefile.in
 +	$(GDB) ${TCL_EXE} --command=gdb.run
  	rm gdb.run
  
- # This target can be used to run tclsh inside ddd
- ddd: ${TCL_EXE}
- 	@echo "set env @LD_LIBRARY_PATH_VAR@=\"`pwd`:$${@LD_LIBRARY_PATH_VAR@}\"" > gdb.run
- 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
--	$(DDD) -command=gdb.run ./${TCL_EXE}
-+	$(DDD) -command=gdb.run ${TCL_EXE}
- 	rm gdb.run
- 
  VALGRINDARGS=--tool=memcheck --num-callers=8 --leak-resolution=high --leak-check=yes --show-reachable=yes -v
-@@ -645,7 +645,7 @@ valgrind: ${TCL_EXE} tcltest@EXEEXT@
+@@ -638,7 +638,7 @@ valgrind: ${TCL_EXE} tcltest@EXEEXT@
  valgrindshell: ${TCL_EXE}
  	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
  	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
@@ -37,7 +29,7 @@ Index: unix/Makefile.in
  
  # The following target outputs the name of the top-level source directory for
  # Tcl (it is used by Tk's configure script, for example). The .NO_PARALLEL
-@@ -809,14 +809,14 @@ install-tzdata: ${TCL_EXE}
+@@ -802,14 +802,14 @@ install-tzdata: ${TCL_EXE}
  	@echo "Installing time zone data"
  	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
  	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
@@ -54,7 +46,7 @@ Index: unix/Makefile.in
  	    $(TOP_DIR)/library/msgs "$(SCRIPT_INSTALL_DIR)"/msgs
  
  install-doc: doc
-@@ -1756,7 +1756,7 @@ html-tk: ${TCL_EXE}
+@@ -1730,7 +1730,7 @@ html-tk: ${TCL_EXE}
  BUILD_HTML = \
  	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
  	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
index 963576d..93ef186 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
@@ -4,9 +4,9 @@ Index: unix/configure
 ===================================================================
 --- unix.orig/configure
 +++ unix/configure
-@@ -6726,6 +6726,7 @@ fi
- 	    # symbols when dynamically loaded into tclsh.
- 	    SHLIB_LD_LIBS='${LIBS}'
+@@ -6757,6 +6757,7 @@ fi
+ 	    LIBS="$LIBS -lc"
+ 	    SHLIB_CFLAGS=""
  	    SHLIB_SUFFIX=".so"
 +	    SHARED_LIB_SUFFIX='${VERSION}\$\{DBGX\}.so.0'
  
@@ -16,15 +16,7 @@ Index: unix/tcl.m4
 ===================================================================
 --- unix.orig/tcl.m4
 +++ unix/tcl.m4
-@@ -1424,6 +1424,7 @@ dnl AC_CHECK_TOOL(AR, ar)
- 	    SHLIB_CFLAGS="-fPIC"
- 	    SHLIB_LD_LIBS='${LIBS}'
- 	    SHLIB_SUFFIX=".so"
-+	    SHARED_LIB_SUFFIX='${TCL_TRIM_DOTS}\$\{DBGX\}.so.0'
- 
- 	    CFLAGS_OPTIMIZE="-O2"
- 	    # egcs-2.91.66 on Redhat Linux 6.0 generates lots of warnings 
-@@ -1431,12 +1432,15 @@ dnl AC_CHECK_TOOL(AR, ar)
+@@ -1399,12 +1399,15 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
  	    # get rid of the warnings.
  	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
  
@@ -41,7 +33,15 @@ Index: unix/tcl.m4
  	    LD_SEARCH_FLAGS=${CC_SEARCH_FLAGS}
  	    AS_IF([test "`uname -m`" = "alpha"], [CFLAGS="$CFLAGS -mieee"])
  	    AS_IF([test $do64bit = yes], [
-@@ -2079,7 +2083,7 @@ dnl # preprocessing tests use only CPPFL
+@@ -1430,6 +1433,7 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+ 	GNU*)
+ 	    SHLIB_CFLAGS="-fPIC"
+ 	    SHLIB_SUFFIX=".so"
++	    SHARED_LIB_SUFFIX='${TCL_TRIM_DOTS}\$\{DBGX\}.so.0'
+ 
+ 	    SHLIB_LD='${CC} -shared'
+ 	    DL_OBJS=""
+@@ -2081,7 +2085,7 @@ dnl # preprocessing tests use only CPPFL
  
      AS_IF([test "${SHARED_BUILD}" = 1 -a "${SHLIB_SUFFIX}" != ""], [
          LIB_SUFFIX=${SHARED_LIB_SUFFIX}
diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb b/meta/recipes-devtools/tcltk/tcl_8.5.10.bb
similarity index 91%
rename from meta/recipes-devtools/tcltk/tcl_8.5.9.bb
rename to meta/recipes-devtools/tcltk/tcl_8.5.10.bb
index 2eabb4d..a9d80af 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.10.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
     file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
     "
 
-PR = "r1"
+PR = "r0"
 
 BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
@@ -19,8 +19,8 @@ BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
 SRC_URI = "${BASE_SRC_URI} \
 	   file://fix_non_native_build_issue.patch "
 
-SRC_URI[md5sum] = "8512d8db3233041dd68a81476906012a"
-SRC_URI[sha256sum] = "3ab671b417e3eeb41b9cef626d742d8f7f57425101e83e5fcad1d552cd99237d"
+SRC_URI[md5sum] = "a08eaf8467c0631937067c1948dd326b"
+SRC_URI[sha256sum] = "f582063edd5419a39ee8f7b5c8f95d557b5daad13efb0ed2f0967ca185613bb7"
 
 SRC_URI_virtclass-native = "${BASE_SRC_URI}"
 
-- 
1.7.4.4




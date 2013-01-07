Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TsASC-00059y-K5
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:01:18 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jan 2013 02:45:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,423,1355126400"; d="scan'208";a="268576441"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2013 02:46:04 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 12:49:17 +0200
Message-Id: <1357555757-24538-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] tcl: updated to 8.5.13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 11:01:19 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../tcl/fix_issue_with_old_distro_glibc.patch      |  109 --------------------
 .../tcltk/tcl/fix_non_native_build_issue.patch     |   24 ++---
 .../tcltk/tcl/tcl-add-soname.patch                 |   20 ++--
 .../tcltk/{tcl_8.5.11.bb => tcl_8.5.13.bb}         |    9 +-
 4 files changed, 22 insertions(+), 140 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
 rename meta/recipes-devtools/tcltk/{tcl_8.5.11.bb => tcl_8.5.13.bb} (89%)

diff --git a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
deleted file mode 100644
index 9c295a6..0000000
--- a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-Upstream-Status: inappropriate [embedded specific]
-
-Fixes tcl target recipe build on old distros which have glibc older than 2.14
-
-| + echo 'NOTE: make  DESTDIR=/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image install'
-| NOTE: make  DESTDIR=/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image install
-| + make  DESTDIR=/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image install
-| Making directory /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image/usr/lib
-| Installing message catalogs
-| Making directory /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image/usr/share/man
-| tclsh: /lib64/libc.so.6: version `GLIBC_2.14' not found (required by /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/tcl8.5.11/unix/libtcl8.5.so)
-| Making directory /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image/usr/bin
-| make: *** [install-msgs] Error 1
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/04/26
-
-Index: unix/Makefile.in
-===================================================================
---- unix.orig/Makefile.in
-+++ unix/Makefile.in
-@@ -592,12 +592,12 @@ tcltest-real:
- #	% make test TESTFLAGS="-verbose bps -file fileName.test"
- 
- test: tcltest@EXEEXT@
--	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	./tcltest@EXEEXT@ $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
- 
- gdb-test: tcltest@EXEEXT@
--	@echo "set env @LD_LIBRARY_PATH_VAR@=\"`pwd`:$${@LD_LIBRARY_PATH_VAR@}\"" > gdb.run
-+	@echo "set env @LD_LIBRARY_PATH_VAR@=\"$${@LD_LIBRARY_PATH_VAR@}\"" > gdb.run
- 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
- 	@echo "set args $(TOP_DIR)/tests/all.tcl $(TESTFLAGS) -singleproc 1" >> gdb.run
- 	$(GDB) ./tcltest@EXEEXT@ --command=gdb.run
-@@ -605,27 +605,27 @@ gdb-test: tcltest@EXEEXT@
- 
- # Useful target to launch a built tcltest with the proper path,...
- runtest: tcltest@EXEEXT@
--	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	./tcltest@EXEEXT@
- 
- # Useful target for running the test suite with an unwritable current
- # directory...
- ro-test: tcltest@EXEEXT@
--	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chmod +w .' | ./tcltest@EXEEXT@
- 
- # This target can be used to run tclsh from the build directory
- # via `make shell SCRIPT=/tmp/foo.tcl`
- shell: ${TCL_EXE}
--	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	${TCL_EXE} $(SCRIPT)
- 
- # This target can be used to run tclsh inside either gdb or insight
- gdb: ${TCL_EXE}
--	@echo "set env @LD_LIBRARY_PATH_VAR@=\"`pwd`:$${@LD_LIBRARY_PATH_VAR@}\"" > gdb.run
-+	@echo "set env @LD_LIBRARY_PATH_VAR@=\"$${@LD_LIBRARY_PATH_VAR@}\"" > gdb.run
- 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
- 	$(GDB) ${TCL_EXE} --command=gdb.run
- 	rm gdb.run
-@@ -633,12 +633,12 @@ gdb: ${TCL_EXE}
- VALGRINDARGS=--tool=memcheck --num-callers=8 --leak-resolution=high --leak-check=yes --show-reachable=yes -v
- 
- valgrind: ${TCL_EXE} tcltest@EXEEXT@
--	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	valgrind $(VALGRINDARGS) ./tcltest@EXEEXT@ $(TOP_DIR)/tests/all.tcl -singleproc 1 $(TESTFLAGS)
- 
- valgrindshell: ${TCL_EXE}
--	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	valgrind $(VALGRINDARGS) ${TCL_EXE} $(SCRIPT)
- 
-@@ -802,14 +802,14 @@ install-libraries: libraries $(INSTALL_T
- 
- install-tzdata: ${TCL_EXE}
- 	@echo "Installing time zone data"
--	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	${TCL_EXE} $(TOOL_DIR)/installData.tcl \
- 	    $(TOP_DIR)/library/tzdata "$(SCRIPT_INSTALL_DIR)"/tzdata
- 
- install-msgs: ${TCL_EXE}
- 	@echo "Installing message catalogs"
--	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	${TCL_EXE} $(TOOL_DIR)/installData.tcl \
- 	    $(TOP_DIR)/library/msgs "$(SCRIPT_INSTALL_DIR)"/msgs
-@@ -1733,7 +1733,7 @@ html-tk: ${TCL_EXE}
- 	@EXTRA_BUILD_HTML@
- 
- BUILD_HTML = \
--	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	${TCL_EXE} $(TOOL_DIR)/tcltk-man2html.tcl --htmldir="$(HTML_INSTALL_DIR)" \
- 		--srcdir=$(TOP_DIR)/.. $(BUILD_HTML_FLAGS)
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index 9c2d379..c5f6d8e 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Pending
 
-Index: unix/Makefile.in
-===================================================================
+diff --git unix.orig/Makefile.in unix/Makefile.in
+index 87deb20..c8ce872 100644
 --- unix.orig/Makefile.in
 +++ unix/Makefile.in
-@@ -619,13 +619,13 @@ ro-test: tcltest@EXEEXT@
+@@ -623,13 +623,13 @@ ro-test: tcltest@EXEEXT@
  shell: ${TCL_EXE}
  	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
  	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
@@ -20,7 +20,7 @@ Index: unix/Makefile.in
  	rm gdb.run
  
  VALGRINDARGS=--tool=memcheck --num-callers=8 --leak-resolution=high --leak-check=yes --show-reachable=yes -v
-@@ -638,7 +638,7 @@ valgrind: ${TCL_EXE} tcltest@EXEEXT@
+@@ -642,7 +642,7 @@ valgrind: ${TCL_EXE} tcltest@EXEEXT@
  valgrindshell: ${TCL_EXE}
  	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
  	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
@@ -29,24 +29,16 @@ Index: unix/Makefile.in
  
  # The following target outputs the name of the top-level source directory for
  # Tcl (it is used by Tk's configure script, for example). The .NO_PARALLEL
-@@ -802,14 +802,14 @@ install-tzdata: ${TCL_EXE}
- 	@echo "Installing time zone data"
+@@ -797,7 +797,7 @@ install-tzdata: ${TCL_EXE}
+ 	@echo "Installing time zone files to $(SCRIPT_INSTALL_DIR)/tzdata/"
  	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
  	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
 -	./${TCL_EXE} $(TOOL_DIR)/installData.tcl \
 +	${TCL_EXE} $(TOOL_DIR)/installData.tcl \
  	    $(TOP_DIR)/library/tzdata "$(SCRIPT_INSTALL_DIR)"/tzdata
  
- install-msgs: ${TCL_EXE}
- 	@echo "Installing message catalogs"
- 	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
--	./${TCL_EXE} $(TOOL_DIR)/installData.tcl \
-+	${TCL_EXE} $(TOOL_DIR)/installData.tcl \
- 	    $(TOP_DIR)/library/msgs "$(SCRIPT_INSTALL_DIR)"/msgs
- 
- install-doc: doc
-@@ -1730,7 +1730,7 @@ html-tk: ${TCL_EXE}
+ install-msgs:
+@@ -1731,7 +1731,7 @@ html-tk: ${TCL_EXE}
  BUILD_HTML = \
  	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
  	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
index 93ef186..9947954 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending
 
-Index: unix/configure
-===================================================================
+diff --git unix.orig/configure unix/configure
+index 163b210..e531122 100755
 --- unix.orig/configure
 +++ unix/configure
 @@ -6757,6 +6757,7 @@ fi
@@ -12,11 +12,11 @@ Index: unix/configure
  
  	    DL_OBJS="tclLoadDl.o"
  	    LD_LIBRARY_PATH_VAR="LIBPATH"
-Index: unix/tcl.m4
-===================================================================
+diff --git unix.orig/tcl.m4 unix/tcl.m4
+index 3974753..46870fa 100644
 --- unix.orig/tcl.m4
 +++ unix/tcl.m4
-@@ -1399,12 +1399,15 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+@@ -1420,12 +1420,15 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
  	    # get rid of the warnings.
  	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
  
@@ -33,7 +33,7 @@ Index: unix/tcl.m4
  	    LD_SEARCH_FLAGS=${CC_SEARCH_FLAGS}
  	    AS_IF([test "`uname -m`" = "alpha"], [CFLAGS="$CFLAGS -mieee"])
  	    AS_IF([test $do64bit = yes], [
-@@ -1430,6 +1433,7 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+@@ -1451,6 +1454,7 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
  	GNU*)
  	    SHLIB_CFLAGS="-fPIC"
  	    SHLIB_SUFFIX=".so"
@@ -41,12 +41,12 @@ Index: unix/tcl.m4
  
  	    SHLIB_LD='${CC} -shared'
  	    DL_OBJS=""
-@@ -2081,7 +2085,7 @@ dnl # preprocessing tests use only CPPFL
+@@ -2103,7 +2107,7 @@ dnl # preprocessing tests use only CPPFLAGS.
  
      AS_IF([test "${SHARED_BUILD}" = 1 -a "${SHLIB_SUFFIX}" != ""], [
          LIB_SUFFIX=${SHARED_LIB_SUFFIX}
 -        MAKE_LIB='${SHLIB_LD} -o [$]@ ${OBJS} ${SHLIB_LD_LIBS} ${TCL_SHLIB_LD_EXTRAS} ${TK_SHLIB_LD_EXTRAS} ${LD_SEARCH_FLAGS}'
 +        MAKE_LIB='${SHLIB_LD} -o $@ ${OBJS} ${SHLIB_LD_LIBS} ${TCL_SHLIB_LD_EXTRAS} ${TK_SHLIB_LD_EXTRAS} ${LD_SEARCH_FLAGS}'
-         INSTALL_LIB='$(INSTALL_LIBRARY) $(LIB_FILE) "$(LIB_INSTALL_DIR)"/$(LIB_FILE)'
-     ], [
-         LIB_SUFFIX=${UNSHARED_LIB_SUFFIX}
+         AS_IF([test "${SHLIB_SUFFIX}" = ".dll"], [
+             INSTALL_LIB='$(INSTALL_LIBRARY) $(LIB_FILE) "$(BIN_INSTALL_DIR)/$(LIB_FILE)"'
+             DLL_INSTALL_DIR="\$(BIN_INSTALL_DIR)"
diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.13.bb
similarity index 89%
rename from meta/recipes-devtools/tcltk/tcl_8.5.11.bb
rename to meta/recipes-devtools/tcltk/tcl_8.5.13.bb
index b8f1e9a..8cd509d 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.13.bb
@@ -11,17 +11,16 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
     file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
     "
 
-PR = "r6"
+PR = "r0"
 
 BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
 
 SRC_URI = "${BASE_SRC_URI} \
-	   file://fix_non_native_build_issue.patch \
-	   file://fix_issue_with_old_distro_glibc.patch "
+	   file://fix_non_native_build_issue.patch "
 
-SRC_URI[md5sum] = "b01a9691c83990b3db0ce62d1012ca67"
-SRC_URI[sha256sum] = "8addc385fa6b5be4605e6d68fbdc4c0e674c5af1dc1c95ec5420390c4b08042a"
+SRC_URI[md5sum] = "fa3a9bf9b2d6ed2431f1baa46f4058b8"
+SRC_URI[sha256sum] = "9b868dd563e65671a26fcf518b6b86c1bb1b6756f48fdc90f04301d4f3a6596a"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
1.7.10.4




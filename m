Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UaQJQ-0005JC-W6
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 14:51:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2013 05:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,641,1363158000"; d="scan'208";a="299907383"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2013 05:33:02 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 15:36:40 +0300
Message-Id: <1368103000-30955-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] tcl: upgraded to 8.6.0
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
X-List-Received-Date: Thu, 09 May 2013 12:51:48 -0000

The license checksum changed because of a small correction in the
license text.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../tcl/fix_issue_with_old_distro_glibc.patch      |   96 ++++----------------
 .../tcltk/tcl/fix_non_native_build_issue.patch     |   91 +++++++++++--------
 meta/recipes-devtools/tcltk/tcl/no_packages.patch  |   53 +++++++++++
 .../tcltk/tcl/tcl-add-soname.patch                 |   14 +--
 .../tcltk/{tcl_8.5.13.bb => tcl_8.6.0.bb}          |   31 +++----
 5 files changed, 145 insertions(+), 140 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/no_packages.patch
 rename meta/recipes-devtools/tcltk/{tcl_8.5.13.bb => tcl_8.6.0.bb} (60%)

diff --git a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
index 71956f3..ed58175 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
@@ -16,86 +16,24 @@ Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/04/26
 
 diff --git unix.orig/Makefile.in unix/Makefile.in
-index c8ce872..06a6406 100644
+index 571d53f..16351f6 100644
 --- unix.orig/Makefile.in
 +++ unix/Makefile.in
-@@ -594,12 +594,12 @@ tcltest-real:
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
+@@ -679,7 +679,7 @@ topDirName:
+ # tcltest executable gets the build directory burned into its ld search path.
+ # This keeps tcltest from picking up an already installed version of the Tcl
+ # library.
+-SHELL_ENV =	@LD_LIBRARY_PATH_VAR@=`pwd`:${@LD_LIBRARY_PATH_VAR@} \
++SHELL_ENV =	@LD_LIBRARY_PATH_VAR@=${@LD_LIBRARY_PATH_VAR@} \
+ 		TCLLIBPATH="@abs_builddir@/pkgs" \
+ 		TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"
+ 
+@@ -705,7 +705,7 @@ test-tcl: ${TCLTEST_EXE}
+ 	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
+ 
+ gdb-test: ${TCLTEST_EXE}
+-	@echo "set env @LD_LIBRARY_PATH_VAR@=`pwd`:$${@LD_LIBRARY_PATH_VAR@}" > gdb.run
++	@echo "set env @LD_LIBRARY_PATH_VAR@=$${@LD_LIBRARY_PATH_VAR@}" > gdb.run
  	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
  	@echo "set args $(TOP_DIR)/tests/all.tcl $(TESTFLAGS) -singleproc 1" >> gdb.run
- 	$(GDB) ./tcltest@EXEEXT@ --command=gdb.run
-@@ -607,27 +607,27 @@ gdb-test: tcltest@EXEEXT@
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
-@@ -635,12 +635,12 @@ gdb: ${TCL_EXE}
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
-@@ -795,7 +795,7 @@ install-libraries: libraries $(INSTALL_TZDATA) install-msgs
- 
- install-tzdata: ${TCL_EXE}
- 	@echo "Installing time zone files to $(SCRIPT_INSTALL_DIR)/tzdata/"
--	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	${TCL_EXE} $(TOOL_DIR)/installData.tcl \
- 	    $(TOP_DIR)/library/tzdata "$(SCRIPT_INSTALL_DIR)"/tzdata
-@@ -1729,7 +1729,7 @@ html-tk: ${TCL_EXE}
- 	@EXTRA_BUILD_HTML@
- 
- BUILD_HTML = \
--	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
-+	@@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
- 	${TCL_EXE} $(TOOL_DIR)/tcltk-man2html.tcl --htmldir="$(HTML_INSTALL_DIR)" \
- 		--srcdir=$(TOP_DIR)/.. $(BUILD_HTML_FLAGS)
+ 	$(GDB) ${TCLTEST_EXE} --command=gdb.run
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index c5f6d8e..80d718c 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -1,49 +1,64 @@
 Upstream-Status: Pending
 
 diff --git unix.orig/Makefile.in unix/Makefile.in
-index 87deb20..c8ce872 100644
+index df05759..571d53f 100644
 --- unix.orig/Makefile.in
 +++ unix/Makefile.in
-@@ -623,13 +623,13 @@ ro-test: tcltest@EXEEXT@
+@@ -702,23 +702,23 @@ tcltest-real:
+ test: test-tcl test-packages
+ 
+ test-tcl: ${TCLTEST_EXE}
+-	$(SHELL_ENV) ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
++	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
+ 
+ gdb-test: ${TCLTEST_EXE}
+ 	@echo "set env @LD_LIBRARY_PATH_VAR@=`pwd`:$${@LD_LIBRARY_PATH_VAR@}" > gdb.run
+ 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
+ 	@echo "set args $(TOP_DIR)/tests/all.tcl $(TESTFLAGS) -singleproc 1" >> gdb.run
+-	$(GDB) ./${TCLTEST_EXE} --command=gdb.run
++	$(GDB) ${TCLTEST_EXE} --command=gdb.run
+ 	rm gdb.run
+ 
+ # Useful target to launch a built tcltest with the proper path,...
+ runtest: ${TCLTEST_EXE}
+-	$(SHELL_ENV) ./${TCLTEST_EXE}
++	$(SHELL_ENV) ${TCLTEST_EXE}
+ 
+ # Useful target for running the test suite with an unwritable current
+ # directory...
+ ro-test: ${TCLTEST_EXE}
+-	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ./${TCLTEST_EXE}
++	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ${TCLTEST_EXE}
+ 
+ # The following target generates the shared libraries in dltest/ that are used
+ # for testing; they are included as part of the "tcltest" target (via the
+@@ -736,23 +736,23 @@ dltest.marker: ${STUB_LIB_FILE}
+ # This target can be used to run tclsh from the build directory
+ # via `make shell SCRIPT=/tmp/foo.tcl`
  shell: ${TCL_EXE}
- 	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
--	./${TCL_EXE} $(SCRIPT)
-+	${TCL_EXE} $(SCRIPT)
+-	$(SHELL_ENV) ./${TCL_EXE} $(SCRIPT)
++	$(SHELL_ENV) ${TCL_EXE} $(SCRIPT)
  
  # This target can be used to run tclsh inside either gdb or insight
  gdb: ${TCL_EXE}
- 	@echo "set env @LD_LIBRARY_PATH_VAR@=\"`pwd`:$${@LD_LIBRARY_PATH_VAR@}\"" > gdb.run
- 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
--	$(GDB) ./${TCL_EXE} --command=gdb.run
-+	$(GDB) ${TCL_EXE} --command=gdb.run
- 	rm gdb.run
+-	$(SHELL_ENV) $(GDB) ./${TCL_EXE}
++	$(SHELL_ENV) $(GDB) ${TCL_EXE}
+ 
+ valgrind: ${TCL_EXE} ${TCLTEST_EXE}
+-	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl -singleproc 1 -constraints valgrind $(TESTFLAGS)
++	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl -singleproc 1 -constraints valgrind $(TESTFLAGS)
  
- VALGRINDARGS=--tool=memcheck --num-callers=8 --leak-resolution=high --leak-check=yes --show-reachable=yes -v
-@@ -642,7 +642,7 @@ valgrind: ${TCL_EXE} tcltest@EXEEXT@
  valgrindshell: ${TCL_EXE}
- 	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
--	valgrind $(VALGRINDARGS) ./${TCL_EXE} $(SCRIPT)
-+	valgrind $(VALGRINDARGS) ${TCL_EXE} $(SCRIPT)
- 
- # The following target outputs the name of the top-level source directory for
- # Tcl (it is used by Tk's configure script, for example). The .NO_PARALLEL
-@@ -797,7 +797,7 @@ install-tzdata: ${TCL_EXE}
- 	@echo "Installing time zone files to $(SCRIPT_INSTALL_DIR)/tzdata/"
- 	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
--	./${TCL_EXE} $(TOOL_DIR)/installData.tcl \
-+	${TCL_EXE} $(TOOL_DIR)/installData.tcl \
- 	    $(TOP_DIR)/library/tzdata "$(SCRIPT_INSTALL_DIR)"/tzdata
- 
- install-msgs:
-@@ -1731,7 +1731,7 @@ html-tk: ${TCL_EXE}
- BUILD_HTML = \
- 	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
- 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
--	./${TCL_EXE} $(TOOL_DIR)/tcltk-man2html.tcl --htmldir="$(HTML_INSTALL_DIR)" \
-+	${TCL_EXE} $(TOOL_DIR)/tcltk-man2html.tcl --htmldir="$(HTML_INSTALL_DIR)" \
- 		--srcdir=$(TOP_DIR)/.. $(BUILD_HTML_FLAGS)
- 
- #
+-	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCL_EXE} $(SCRIPT)
++	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ${TCL_EXE} $(SCRIPT)
+ 
+ trace-shell: ${TCL_EXE}
+-	$(SHELL_ENV) ${TRACE} $(TRACE_OPTS) ./${TCL_EXE} $(SCRIPT)
++	$(SHELL_ENV) ${TRACE} $(TRACE_OPTS) ${TCL_EXE} $(SCRIPT)
+ 
+ trace-test: ${TCLTEST_EXE}
+-	$(SHELL_ENV) ${TRACE} $(TRACE_OPTS) ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl -singleproc 1 $(TESTFLAGS)
++	$(SHELL_ENV) ${TRACE} $(TRACE_OPTS) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl -singleproc 1 $(TESTFLAGS)
+ 
+ #--------------------------------------------------------------------------
+ # Installation rules
diff --git a/meta/recipes-devtools/tcltk/tcl/no_packages.patch b/meta/recipes-devtools/tcltk/tcl/no_packages.patch
new file mode 100644
index 0000000..b045814
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tcl/no_packages.patch
@@ -0,0 +1,53 @@
+tcl 8.6.0 builds by default a number of packages that are not needed in Yocto.
+This patch changes the makefile so that these packages are not built by default.
+
+Upstream-Status:Inappropriate [embedded specific]
+
+Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
+
+diff --git unix.orig/Makefile.in unix/Makefile.in
+index 16351f6..76ccadb 100644
+--- unix.orig/Makefile.in
++++ unix/Makefile.in
+@@ -601,7 +601,7 @@ SRCS = $(GENERIC_SRCS) $(TOMMATH_SRCS) $(UNIX_SRCS) $(NOTIFY_SRCS) \
+ # Start of rules
+ #--------------------------------------------------------------------------
+ 
+-all: binaries libraries doc packages
++all: binaries libraries doc
+ 
+ binaries: ${LIB_FILE} $(STUB_LIB_FILE) ${TCL_EXE}
+ 
+@@ -646,12 +646,12 @@ Makefile: $(UNIX_DIR)/Makefile.in $(DLTEST_DIR)/Makefile.in
+ #tclConfig.h: $(UNIX_DIR)/tclConfig.h.in
+ #	$(SHELL) config.status
+ 
+-clean: clean-packages
++clean:
+ 	rm -f *.a *.o libtcl* core errs *~ \#* TAGS *.E a.out \
+ 		errors ${TCL_EXE} ${TCLTEST_EXE} lib.exp Tcl @DTRACE_HDR@
+ 	cd dltest ; $(MAKE) clean
+ 
+-distclean: distclean-packages clean
++distclean: clean
+ 	rm -rf Makefile config.status config.cache config.log tclConfig.sh \
+ 		tclConfig.h *.plist Tcl.framework tcl.pc
+ 	cd dltest ; $(MAKE) distclean
+@@ -699,7 +699,7 @@ tcltest-real:
+ # tcltest, ie:
+ #	% make test TESTFLAGS="-verbose bps -file fileName.test"
+ 
+-test: test-tcl test-packages
++test: test-tcl
+ 
+ test-tcl: ${TCLTEST_EXE}
+ 	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
+@@ -764,7 +764,7 @@ INSTALL_PACKAGE_TARGETS = install-packages
+ INSTALL_DEV_TARGETS = install-headers
+ INSTALL_EXTRA_TARGETS = @EXTRA_INSTALL@
+ INSTALL_TARGETS = $(INSTALL_BASE_TARGETS) $(INSTALL_DOC_TARGETS) $(INSTALL_DEV_TARGETS) \
+-		  $(INSTALL_PACKAGE_TARGETS) $(INSTALL_EXTRA_TARGETS)
++		  $(INSTALL_EXTRA_TARGETS)
+ 
+ install: $(INSTALL_TARGETS)
+ 
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
index 9947954..eca0a18 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Pending
 
 diff --git unix.orig/configure unix/configure
-index 163b210..e531122 100755
+index f778a7b..25083c2 100755
 --- unix.orig/configure
 +++ unix/configure
-@@ -6757,6 +6757,7 @@ fi
+@@ -6889,6 +6889,7 @@ fi
  	    LIBS="$LIBS -lc"
  	    SHLIB_CFLAGS=""
  	    SHLIB_SUFFIX=".so"
@@ -13,10 +13,10 @@ index 163b210..e531122 100755
  	    DL_OBJS="tclLoadDl.o"
  	    LD_LIBRARY_PATH_VAR="LIBPATH"
 diff --git unix.orig/tcl.m4 unix/tcl.m4
-index 3974753..46870fa 100644
+index b13fddd..7254f66 100644
 --- unix.orig/tcl.m4
 +++ unix/tcl.m4
-@@ -1420,12 +1420,15 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+@@ -1408,12 +1408,15 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
  	    # get rid of the warnings.
  	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
  
@@ -33,7 +33,7 @@ index 3974753..46870fa 100644
  	    LD_SEARCH_FLAGS=${CC_SEARCH_FLAGS}
  	    AS_IF([test "`uname -m`" = "alpha"], [CFLAGS="$CFLAGS -mieee"])
  	    AS_IF([test $do64bit = yes], [
-@@ -1451,6 +1454,7 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+@@ -1439,6 +1442,7 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
  	GNU*)
  	    SHLIB_CFLAGS="-fPIC"
  	    SHLIB_SUFFIX=".so"
@@ -41,11 +41,11 @@ index 3974753..46870fa 100644
  
  	    SHLIB_LD='${CC} -shared'
  	    DL_OBJS=""
-@@ -2103,7 +2107,7 @@ dnl # preprocessing tests use only CPPFLAGS.
+@@ -2098,7 +2102,7 @@ dnl # preprocessing tests use only CPPFLAGS.
  
      AS_IF([test "${SHARED_BUILD}" = 1 -a "${SHLIB_SUFFIX}" != ""], [
          LIB_SUFFIX=${SHARED_LIB_SUFFIX}
--        MAKE_LIB='${SHLIB_LD} -o [$]@ ${OBJS} ${SHLIB_LD_LIBS} ${TCL_SHLIB_LD_EXTRAS} ${TK_SHLIB_LD_EXTRAS} ${LD_SEARCH_FLAGS}'
+-        MAKE_LIB='${SHLIB_LD} -o [$]@ ${OBJS} ${TCL_SHLIB_LD_EXTRAS} ${SHLIB_LD_LIBS} ${TK_SHLIB_LD_EXTRAS} ${LD_SEARCH_FLAGS}'
 +        MAKE_LIB='${SHLIB_LD} -o $@ ${OBJS} ${SHLIB_LD_LIBS} ${TCL_SHLIB_LD_EXTRAS} ${TK_SHLIB_LD_EXTRAS} ${LD_SEARCH_FLAGS}'
          AS_IF([test "${SHLIB_SUFFIX}" = ".dll"], [
              INSTALL_LIB='$(INSTALL_LIBRARY) $(LIB_FILE) "$(BIN_INSTALL_DIR)/$(LIB_FILE)"'
diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.13.bb b/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
similarity index 60%
rename from meta/recipes-devtools/tcltk/tcl_8.5.13.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.0.bb
index be9c61b..7648a81 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
@@ -3,25 +3,24 @@ LICENSE = "BSD-3-Clause"
 SECTION = "devel/tcltk"
 HOMEPAGE = "http://tcl.sourceforge.net"
 DEPENDS = "tcl-native"
-LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
-    file://../compat/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
-    file://../library/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
-    file://../macosx/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
-    file://../tests/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
-    file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
+LIC_FILES_CHKSUM = "file://../license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
+    file://../compat/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
+    file://../library/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
+    file://../macosx/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
+    file://../tests/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
+    file://../win/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
     "
 
-PR = "r0"
-
 BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
 
 SRC_URI = "${BASE_SRC_URI} \
 	   file://fix_non_native_build_issue.patch \
-	   file://fix_issue_with_old_distro_glibc.patch "
+	   file://fix_issue_with_old_distro_glibc.patch \
+     file://no_packages.patch"
 
-SRC_URI[md5sum] = "fa3a9bf9b2d6ed2431f1baa46f4058b8"
-SRC_URI[sha256sum] = "9b868dd563e65671a26fcf518b6b86c1bb1b6756f48fdc90f04301d4f3a6596a"
+SRC_URI[md5sum] = "573aa5fe678e9185ef2b3c56b24658d3"
+SRC_URI[sha256sum] = "354422b9c4791685499123b2dfe01faa98b555c08906c010cb4449ddc75dcade"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
@@ -44,8 +43,8 @@ do_compile_prepend() {
 
 do_install() {
 	autotools_do_install
-	oe_libinstall -so libtcl8.5 ${D}${libdir}
-	ln -sf ./tclsh8.5 ${D}${bindir}/tclsh
+	oe_libinstall -so libtcl8.6 ${D}${libdir}
+	ln -sf ./tclsh8.6 ${D}${bindir}/tclsh
 	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
 	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh 
@@ -65,9 +64,9 @@ tcl_sysroot_preprocess () {
 }
 
 PACKAGES =+ "tcl-lib"
-FILES_tcl-lib = "${libdir}/libtcl8.5.so*"
-FILES_${PN} += "${prefix}/lib/tcl8.5 ${prefix}/lib/tcl8"
-FILES_${PN}-dev += "${libdir}/tclConfig.sh"
+FILES_tcl-lib = "${libdir}/libtcl8.6.so*"
+FILES_${PN} += "${prefix}/lib/tcl8.6 ${prefix}/lib/tcl8"
+FILES_${PN}-dev += "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
 
 # isn't getting picked up by shlibs code
 RDEPENDS_${PN} += "tcl-lib"
-- 
1.7.10.4




Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SNXiF-0000Wg-9Z
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 01:02:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Apr 2012 15:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158831713"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2012 15:53:20 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Apr 2012 15:53:19 -0700
Message-Id: <7f8b4de3403259b625b5da64b592d8c9db24570a.1335480719.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <385b9b6d43ea3d98d355edc50989d2e0ab488cd7.1335480719.git.nitin.a.kamble@intel.com>
References: <385b9b6d43ea3d98d355edc50989d2e0ab488cd7.1335480719.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1335480719.git.nitin.a.kamble@intel.com>
References: <cover.1335480719.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/2] tcl: fix target recipe build issue on older distros
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
X-List-Received-Date: Thu, 26 Apr 2012 23:02:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

the builddir is put in front of the LD_LIBRARY_PATH, causing dynamically
linking of target library with native tclsh.

Fix this behavior to cross build tcl correctly.

This issue got exposed when eglibc-2.15 was configured for the target.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../tcl/fix_issue_with_old_distro_glibc.patch      |  109 ++++++++++++++++++++
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb          |    5 +-
 2 files changed, 112 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch

diff --git a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
new file mode 100644
index 0000000..9c295a6
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
@@ -0,0 +1,109 @@
+Upstream-Status: inappropriate [embedded specific]
+
+Fixes tcl target recipe build on old distros which have glibc older than 2.14
+
+| + echo 'NOTE: make  DESTDIR=/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image install'
+| NOTE: make  DESTDIR=/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image install
+| + make  DESTDIR=/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image install
+| Making directory /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image/usr/lib
+| Installing message catalogs
+| Making directory /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image/usr/share/man
+| tclsh: /lib64/libc.so.6: version `GLIBC_2.14' not found (required by /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/tcl8.5.11/unix/libtcl8.5.so)
+| Making directory /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image/usr/bin
+| make: *** [install-msgs] Error 1
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/04/26
+
+Index: unix/Makefile.in
+===================================================================
+--- unix.orig/Makefile.in
++++ unix/Makefile.in
+@@ -592,12 +592,12 @@ tcltest-real:
+ #	% make test TESTFLAGS="-verbose bps -file fileName.test"
+ 
+ test: tcltest@EXEEXT@
+-	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
++	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
+ 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
+ 	./tcltest@EXEEXT@ $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
+ 
+ gdb-test: tcltest@EXEEXT@
+-	@echo "set env @LD_LIBRARY_PATH_VAR@=\"`pwd`:$${@LD_LIBRARY_PATH_VAR@}\"" > gdb.run
++	@echo "set env @LD_LIBRARY_PATH_VAR@=\"$${@LD_LIBRARY_PATH_VAR@}\"" > gdb.run
+ 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
+ 	@echo "set args $(TOP_DIR)/tests/all.tcl $(TESTFLAGS) -singleproc 1" >> gdb.run
+ 	$(GDB) ./tcltest@EXEEXT@ --command=gdb.run
+@@ -605,27 +605,27 @@ gdb-test: tcltest@EXEEXT@
+ 
+ # Useful target to launch a built tcltest with the proper path,...
+ runtest: tcltest@EXEEXT@
+-	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
++	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
+ 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
+ 	./tcltest@EXEEXT@
+ 
+ # Useful target for running the test suite with an unwritable current
+ # directory...
+ ro-test: tcltest@EXEEXT@
+-	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
++	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
+ 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
+ 	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chmod +w .' | ./tcltest@EXEEXT@
+ 
+ # This target can be used to run tclsh from the build directory
+ # via `make shell SCRIPT=/tmp/foo.tcl`
+ shell: ${TCL_EXE}
+-	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
++	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
+ 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
+ 	${TCL_EXE} $(SCRIPT)
+ 
+ # This target can be used to run tclsh inside either gdb or insight
+ gdb: ${TCL_EXE}
+-	@echo "set env @LD_LIBRARY_PATH_VAR@=\"`pwd`:$${@LD_LIBRARY_PATH_VAR@}\"" > gdb.run
++	@echo "set env @LD_LIBRARY_PATH_VAR@=\"$${@LD_LIBRARY_PATH_VAR@}\"" > gdb.run
+ 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
+ 	$(GDB) ${TCL_EXE} --command=gdb.run
+ 	rm gdb.run
+@@ -633,12 +633,12 @@ gdb: ${TCL_EXE}
+ VALGRINDARGS=--tool=memcheck --num-callers=8 --leak-resolution=high --leak-check=yes --show-reachable=yes -v
+ 
+ valgrind: ${TCL_EXE} tcltest@EXEEXT@
+-	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
++	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
+ 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
+ 	valgrind $(VALGRINDARGS) ./tcltest@EXEEXT@ $(TOP_DIR)/tests/all.tcl -singleproc 1 $(TESTFLAGS)
+ 
+ valgrindshell: ${TCL_EXE}
+-	@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
++	@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
+ 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
+ 	valgrind $(VALGRINDARGS) ${TCL_EXE} $(SCRIPT)
+ 
+@@ -802,14 +802,14 @@ install-libraries: libraries $(INSTALL_T
+ 
+ install-tzdata: ${TCL_EXE}
+ 	@echo "Installing time zone data"
+-	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
++	@@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
+ 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
+ 	${TCL_EXE} $(TOOL_DIR)/installData.tcl \
+ 	    $(TOP_DIR)/library/tzdata "$(SCRIPT_INSTALL_DIR)"/tzdata
+ 
+ install-msgs: ${TCL_EXE}
+ 	@echo "Installing message catalogs"
+-	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
++	@@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
+ 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
+ 	${TCL_EXE} $(TOOL_DIR)/installData.tcl \
+ 	    $(TOP_DIR)/library/msgs "$(SCRIPT_INSTALL_DIR)"/msgs
+@@ -1733,7 +1733,7 @@ html-tk: ${TCL_EXE}
+ 	@EXTRA_BUILD_HTML@
+ 
+ BUILD_HTML = \
+-	@@LD_LIBRARY_PATH_VAR@="`pwd`:$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
++	@@LD_LIBRARY_PATH_VAR@="$${@LD_LIBRARY_PATH_VAR@}"; export @LD_LIBRARY_PATH_VAR@; \
+ 	TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"; export TCL_LIBRARY; \
+ 	${TCL_EXE} $(TOOL_DIR)/tcltk-man2html.tcl --htmldir="$(HTML_INSTALL_DIR)" \
+ 		--srcdir=$(TOP_DIR)/.. $(BUILD_HTML_FLAGS)
diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index 09dd155..1d43371 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -11,13 +11,14 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
     file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
     "
 
-PR = "r5"
+PR = "r6"
 
 BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
 
 SRC_URI = "${BASE_SRC_URI} \
-	   file://fix_non_native_build_issue.patch "
+	   file://fix_non_native_build_issue.patch \
+	   file://fix_issue_with_old_distro_glibc.patch "
 
 SRC_URI[md5sum] = "b01a9691c83990b3db0ce62d1012ca67"
 SRC_URI[sha256sum] = "8addc385fa6b5be4605e6d68fbdc4c0e674c5af1dc1c95ec5420390c4b08042a"
-- 
1.7.7




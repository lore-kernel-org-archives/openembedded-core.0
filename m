Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQa-0006go-Tb
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772202"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:41 -0700
Message-Id: <65d51d698773b4ebbd67dd3651a0dbbcf7c46196.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/36] python: upgrade from 2.7.2 to 2.7.3
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
X-List-Received-Date: Thu, 03 May 2012 02:05:57 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

bin/python2 link is provided by the python install process,
so no need to create it.

rebase these patches to the newer code:
 fix_for_using_different_libdir.patch
 04-default-is-optimized.patch
remove this patch as it is upstream now:
 sys_platform_is_now_always_linux2.patch

Change default python version to 2.7.3 in the distro config

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/distro/include/default-versions.inc      |    4 +-
 ...thon-native_2.7.2.bb => python-native_2.7.3.bb} |    6 +---
 meta/recipes-devtools/python/python.inc            |    8 ++--
 .../python/python/04-default-is-optimized.patch    |   30 +++++++++------
 .../python/fix_for_using_different_libdir.patch    |   30 +++++++++-------
 .../python/sys_platform_is_now_always_linux2.patch |   39 --------------------
 .../python/{python_2.7.2.bb => python_2.7.3.bb}    |    3 +-
 7 files changed, 43 insertions(+), 77 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.2.bb => python-native_2.7.3.bb} (92%)
 delete mode 100644 meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch
 rename meta/recipes-devtools/python/{python_2.7.2.bb => python_2.7.3.bb} (98%)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index a86bc0c..53ec2e7 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -4,8 +4,8 @@
 
 # Force the python versions in one place
 PYTHON_BASEVERSION ?= "2.7"
-PREFERRED_VERSION_python ?= "2.7.2"
-PREFERRED_VERSION_python-native ?= "2.7.2"
+PREFERRED_VERSION_python ?= "2.7.3"
+PREFERRED_VERSION_python-native ?= "2.7.3"
 
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
diff --git a/meta/recipes-devtools/python/python-native_2.7.2.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python-native_2.7.2.bb
rename to meta/recipes-devtools/python/python-native_2.7.3.bb
index 175f31d..50bf894 100644
--- a/meta/recipes-devtools/python/python-native_2.7.2.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://04-default-is-optimized.patch \
            file://05-enable-ctypes-cross-build.patch \
@@ -13,7 +13,6 @@ SRC_URI += "file://04-default-is-optimized.patch \
            file://nohostlibs.patch \
            file://multilib.patch \
            file://add-md5module-support.patch \
-           file://sys_platform_is_now_always_linux2.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
@@ -42,7 +41,4 @@ do_install() {
 	for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
 		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
 	done
-
-	ln -sf python ${D}${bindir}/python2
-
 }
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 2f17b00..eee7a64 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -3,14 +3,14 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
-INC_PR = "r2"
+INC_PR = "r0"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2dffb81509b47974467ea23409909b1c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed3abfd1059e2d3a36a8cff3986f9bb6"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2"
  
-SRC_URI[md5sum] = "ba7b2f11ffdbf195ee0d111b9455a5bd"
-SRC_URI[sha256sum] = "5057eb067eb5b5a6040dbd0e889e06550bde9ec041dadaa855ee9490034cbdab"
+SRC_URI[md5sum] = "c57477edd6d18bd9eeca2f21add73919"
+SRC_URI[sha256sum] = "726457e11cb153adc3f428aaf1901fc561a374c30e5e7da6742c0742a338663c"
 
 PYTHON_MAJMIN = "2.7"
 
diff --git a/meta/recipes-devtools/python/python/04-default-is-optimized.patch b/meta/recipes-devtools/python/python/04-default-is-optimized.patch
index 042ac5e..7ce819a 100644
--- a/meta/recipes-devtools/python/python/04-default-is-optimized.patch
+++ b/meta/recipes-devtools/python/python/04-default-is-optimized.patch
@@ -1,14 +1,20 @@
 Upstream-Status: Inappropriate [embedded specific]
 
+Updated original patch for python 2.7.3
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/01
+
+
 # when compiling for an embedded system, we need every bit of
 # performance we can get. default to optimized with the option
 # of opt-out.
 # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
 
-Index: Python-2.6.6/Python/compile.c
+Index: Python-2.7.3/Python/compile.c
 ===================================================================
---- Python-2.6.6.orig/Python/compile.c
-+++ Python-2.6.6/Python/compile.c
+--- Python-2.7.3.orig/Python/compile.c
++++ Python-2.7.3/Python/compile.c
 @@ -32,7 +32,7 @@
  #include "symtable.h"
  #include "opcode.h"
@@ -18,16 +24,16 @@ Index: Python-2.6.6/Python/compile.c
  
  #define DEFAULT_BLOCK_SIZE 16
  #define DEFAULT_BLOCKS 8
-Index: Python-2.6.6/Modules/main.c
+Index: Python-2.7.3/Modules/main.c
 ===================================================================
---- Python-2.6.6.orig/Modules/main.c
-+++ Python-2.6.6/Modules/main.c
+--- Python-2.7.3.orig/Modules/main.c
++++ Python-2.7.3/Modules/main.c
 @@ -40,7 +40,7 @@ static char **orig_argv;
  static int  orig_argc;
  
  /* command line options */
--#define BASE_OPTS "3bBc:dEhiJm:OQ:sStuUvVW:xX?"
-+#define BASE_OPTS "3bBc:dEhiJm:NOQ:sStuUvVW:xX?"
+-#define BASE_OPTS "3bBc:dEhiJm:OQ:RsStuUvVW:xX?"
++#define BASE_OPTS "3bBc:dEhiJm:NOQ:RsStuUvVW:xX?"
  
  #ifndef RISCOS
  #define PROGRAM_OPTS BASE_OPTS
@@ -38,10 +44,10 @@ Index: Python-2.6.6/Modules/main.c
 --O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
 --OO    : remove doc-strings in addition to the -O optimizations\n\
 +-N     : do NOT optimize generated bytecode\n\
- -Q arg : division options: -Qold (default), -Qwarn, -Qwarnall, -Qnew\n\
- -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
- -S     : don't imply 'import site' on initialization\n\
-@@ -328,8 +327,8 @@ Py_Main(int argc, char **argv)
+ -R     : use a pseudo-random salt to make hash() values of various types be\n\
+          unpredictable between separate invocations of the interpreter, as\n\
+          a defense against denial-of-service attacks\n\
+@@ -365,8 +364,8 @@ Py_Main(int argc, char **argv)
  
          /* case 'J': reserved for Jython */
  
diff --git a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
index e8f19a2..50d3915 100644
--- a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
+++ b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
@@ -7,10 +7,14 @@ in the install process of the host python.
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2012/03/14
 
-Index: Python-2.7.2/Lib/sysconfig.py
+Updated for python 2.7.3
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2012/05/01
+
+Index: Python-2.7.3/Lib/sysconfig.py
 ===================================================================
---- Python-2.7.2.orig/Lib/sysconfig.py
-+++ Python-2.7.2/Lib/sysconfig.py
+--- Python-2.7.3.orig/Lib/sysconfig.py
++++ Python-2.7.3/Lib/sysconfig.py
 @@ -7,10 +7,10 @@ from os.path import pardir, realpath
  
  _INSTALL_SCHEMES = {
@@ -41,14 +45,14 @@ Index: Python-2.7.2/Lib/sysconfig.py
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
          'data'   : '{userbase}',
-Index: Python-2.7.2/Makefile.pre.in
+Index: Python-2.7.3/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -928,25 +928,25 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
- 		done; \
- 	done
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+--- Python-2.7.3.orig/Makefile.pre.in
++++ Python-2.7.3/Makefile.pre.in
+@@ -941,25 +941,25 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+ 		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
+ 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
+ 	fi
 -	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
 +	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
  		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
@@ -56,7 +60,7 @@ Index: Python-2.7.2/Makefile.pre.in
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
 -	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
-+	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
++	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
  		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
@@ -67,12 +71,12 @@ Index: Python-2.7.2/Makefile.pre.in
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
-+	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
  		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
-+	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
  		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
  
  # Create the PLATDIR source directory, if one wasn't distributed..
diff --git a/meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch b/meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch
deleted file mode 100644
index ed52936..0000000
--- a/meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Accepted [http://hg.python.org/cpython/rev/c816479f6aaf/]
-Bugtracker: http://bugs.python.org/issue12326
-
-[Removed "Misc/NEWS" hunk]
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
-
-# HG changeset patch
-# User Victor Stinner <victor.stinner@haypocalc.com>
-# Date 1313841758 -7200
-# Node ID c816479f6aaf71dbd3f3fe4b239186d60c55ce48
-# Parent  3e093590ac57fdda428c7da3f72ddf0c475ecf2b
-Issue #12326: sys.platform is now always 'linux2' on Linux
-
-Even if Python is compiled on Linux 3.
-
-diff --git a/configure b/configure
---- a/configure
-+++ b/configure
-@@ -2995,6 +2995,7 @@ then
- 	MACHDEP="$ac_md_system$ac_md_release"
- 
- 	case $MACHDEP in
-+	linux*) MACHDEP="linux2";;
- 	cygwin*) MACHDEP="cygwin";;
- 	darwin*) MACHDEP="darwin";;
- 	atheos*) MACHDEP="atheos";;
-diff --git a/configure.in b/configure.in
---- a/configure.in
-+++ b/configure.in
-@@ -293,6 +293,7 @@ then
- 	MACHDEP="$ac_md_system$ac_md_release"
- 
- 	case $MACHDEP in
-+	linux*) MACHDEP="linux2";;
- 	cygwin*) MACHDEP="cygwin";;
- 	darwin*) MACHDEP="darwin";;
- 	atheos*) MACHDEP="atheos";;
-
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.3.bb
similarity index 98%
rename from meta/recipes-devtools/python/python_2.7.2.bb
rename to meta/recipes-devtools/python/python_2.7.3.bb
index bd5c1ff..b06d7b7 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.20"
+PR = "${INC_PR}.0"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -19,7 +19,6 @@ SRC_URI += "\
   file://setup_py_skip_cross_import_check.patch \
   file://add-md5module-support.patch \
   file://host_include_contamination.patch \
-  file://sys_platform_is_now_always_linux2.patch \
   file://fix_for_using_different_libdir.patch \
   file://setuptweaks.patch \
   file://check-if-target-is-64b-not-host.patch \
-- 
1.7.7.6




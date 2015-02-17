Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 718E67354F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 22:22:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 17 Feb 2015 14:15:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,595,1418112000"; d="scan'208";a="528902376"
Received: from unknown (HELO aehernan-DevStation.zpn.intel.com)
	([10.219.4.158])
	by orsmga003.jf.intel.com with ESMTP; 17 Feb 2015 14:14:14 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 16:22:53 -0600
Message-Id: <7c630178dda359245ed1c5e58b191ed927a2e2a0.1424210642.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1424210642.git.alejandro.hernandez@linux.intel.com>
References: <cover.1424210642.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 1/1] Python: Upgrade from 2.7.3 to 2.7.9:
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
X-List-Received-Date: Tue, 17 Feb 2015 22:22:52 -0000

- Based on Paul Eggletons work to partially upgrade to Python 2.7.6

Modified:
default-versions.inc: switched to python 2.7.9
generate-manifest-2.7.py: fixed _sysconfigdata
python-2.7-manifest.inc: fixed _sysconfigdata
python.inc: Updated checksums and source, no LICENSE
change just updated some dates
python-native_2.7.3 -> python-native_2.7.9 and updated patches
python_2.7.3 -> python_2.7.9, and added ac_cv_file__dev_ptmx=no
ac_cv_file__dev_ptc=no in EXTRA_OECONF to solve python
issue #3754, only needed when cross compiling, also updated patches
use_sysroot_ncurses_instead_of_host.patch: New patch to use ncursesw
from sysroot instead of hosts, introduced by fix for python issue #15268

Rebased:
01-use-proper-tools-for-cross-build.patch
03-fix-tkinter-detection.patch
05-enable-ctypes-cross-build.patch
06-avoid_usr_lib_termcap_path_in_linking.patch
avoid_warning_about_tkinter.patch
builddir.patch
fix_for_using_different_libdir.patch
host_include_contamination.patch
multilib.patch
nohostlibs.patch
search_db_h_in_inc_dirs_and_avoid_warning.patch

Deleted (fixed on upstream):
06-ctypes-libffi-fix-configure.patch
CVE-2013-4073_py27.patch
gcc-4.8-fix-configure-Wformat.patch
json-flaw-fix.patch
posix_close.patch
pypirc-secure.patch
python-2.7.3-CVE-2012-2135.patch
python-2.7.3-CVE-2013-1752-smtplib-fix.patch
python-2.7.3-CVE-2014-1912.patch
python-2.7.3-CVE-2014-7185.patch
python-2.7.3-berkeley-db-5.3.patch
python-fix-build-error-with-Readline-6.3.patch
remove-BOM-insection-code.patch
remove_sqlite_rpath.patch
python2.7.3-nossl3.patch

[YOCTO #7059]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/conf/distro/include/default-versions.inc      |    4 +-
 .../python/python-2.7-manifest.inc                 |    8 +-
 .../python/python-native/multilib.patch            |  104 +-
 .../python/python-native/nohostlibs.patch          |   49 +-
 ...thon-native_2.7.3.bb => python-native_2.7.9.bb} |    6 +-
 meta/recipes-devtools/python/python.inc            |   10 +-
 .../01-use-proper-tools-for-cross-build.patch      |  137 +-
 .../python/python/03-fix-tkinter-detection.patch   |   26 +-
 .../python/05-enable-ctypes-cross-build.patch      |   17 +-
 .../06-avoid_usr_lib_termcap_path_in_linking.patch |   16 +-
 .../python/06-ctypes-libffi-fix-configure.patch    |   44 -
 .../python/python/CVE-2013-4073_py27.patch         |  251 ----
 .../python/avoid_warning_about_tkinter.patch       |   15 +-
 meta/recipes-devtools/python/python/builddir.patch |   27 +-
 .../python/fix_for_using_different_libdir.patch    |   63 +-
 .../python/gcc-4.8-fix-configure-Wformat.patch     |   20 -
 .../python/python/host_include_contamination.patch |   23 +-
 .../python/python/json-flaw-fix.patch              |   27 -
 meta/recipes-devtools/python/python/multilib.patch |  205 +--
 .../python/python/posix_close.patch                |   43 -
 .../python/python/pypirc-secure.patch              |   35 -
 .../python/python/python-2.7.3-CVE-2012-2135.patch |   73 -
 .../python-2.7.3-CVE-2013-1752-smtplib-fix.patch   |  101 --
 .../python/python/python-2.7.3-CVE-2014-1912.patch |   26 -
 .../python/python/python-2.7.3-CVE-2014-7185.patch |   75 -
 .../python/python-2.7.3-berkeley-db-5.3.patch      | 1572 --------------------
 .../python-fix-build-error-with-Readline-6.3.patch |   62 -
 .../python/python/python2.7.3-nossl3.patch         |   37 -
 .../python/python/remove-BOM-insection-code.patch  |   24 -
 .../python/python/remove_sqlite_rpath.patch        |   19 -
 ...search_db_h_in_inc_dirs_and_avoid_warning.patch |   23 +-
 .../use_sysroot_ncurses_instead_of_host.patch      |   20 +
 .../python/{python_2.7.3.bb => python_2.7.9.bb}    |   22 +-
 scripts/contrib/python/generate-manifest-2.7.py    |    4 +-
 34 files changed, 368 insertions(+), 2820 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.3.bb => python-native_2.7.9.bb} (90%)
 delete mode 100644 meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2013-4073_py27.patch
 delete mode 100644 meta/recipes-devtools/python/python/gcc-4.8-fix-configure-Wformat.patch
 delete mode 100644 meta/recipes-devtools/python/python/json-flaw-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/posix_close.patch
 delete mode 100644 meta/recipes-devtools/python/python/pypirc-secure.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2012-2135.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-smtplib-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-1912.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-berkeley-db-5.3.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-fix-build-error-with-Readline-6.3.patch
 delete mode 100644 meta/recipes-devtools/python/python/python2.7.3-nossl3.patch
 delete mode 100644 meta/recipes-devtools/python/python/remove-BOM-insection-code.patch
 delete mode 100644 meta/recipes-devtools/python/python/remove_sqlite_rpath.patch
 create mode 100644 meta/recipes-devtools/python/python/use_sysroot_ncurses_instead_of_host.patch
 rename meta/recipes-devtools/python/{python_2.7.3.bb => python_2.7.9.bb} (89%)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 6e92aa5..573063e 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -4,8 +4,8 @@
 
 # Force the python versions in one place
 PYTHON_BASEVERSION ?= "2.7"
-PREFERRED_VERSION_python ?= "2.7.3"
-PREFERRED_VERSION_python-native ?= "2.7.3"
+PREFERRED_VERSION_python ?= "2.7.9"
+PREFERRED_VERSION_python-native ?= "2.7.9"
 
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 2e68a26..12f775e 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -1,6 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: 'scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: '../../../scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
@@ -41,13 +41,13 @@ SUMMARY_${PN}-compression="Python high-level compression support"
 RDEPENDS_${PN}-compression="${PN}-core ${PN}-zlib"
 FILES_${PN}-compression="${libdir}/python2.7/gzip.* ${libdir}/python2.7/zipfile.* ${libdir}/python2.7/tarfile.* ${libdir}/python2.7/lib-dynload/bz2.so "
 
-SUMMARY_${PN}-contextlib="Python utilities for with-statementcontexts.  See PEP 343."
+SUMMARY_${PN}-contextlib="Python utilities for with-statementcontexts."
 RDEPENDS_${PN}-contextlib="${PN}-core"
-FILES_${PN}-contextlib="${libdir}/python${PYTHON_MAJMIN}/contextlib.py* "
+FILES_${PN}-contextlib="${libdir}/python${PYTHON_MAJMIN}/contextlib.* "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
-FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/_sysconfigdata.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
diff --git a/meta/recipes-devtools/python/python-native/multilib.patch b/meta/recipes-devtools/python/python-native/multilib.patch
index 0526031..8ca89e7 100644
--- a/meta/recipes-devtools/python/python-native/multilib.patch
+++ b/meta/recipes-devtools/python/python-native/multilib.patch
@@ -1,15 +1,6 @@
-commit 248279e54467a8cd5cde98fc124d1d1384703513
-Author: Yu Ke <ke.yu@intel.com>
-Date:   Tue Jun 28 21:21:29 2011 +0800
-
-    SUSE patch for the lib64 issue
-    
-    see detail in http://bugs.python.org/issue1294959
-    
-    also rebased a bit for Yocto python 2.6.6
-    
-    Picked-by: Yu Ke <ke.yu@intel.com>
+Rebased for Python 2.7.9
 
+Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 2011/09/29
 The python recipe building was failing because python-native 
@@ -21,10 +12,10 @@ Upstream-Status: Inappropriate [oe-specific]
 
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: Python-2.7.2/Include/pythonrun.h
+Index: Python-2.7.9/Include/pythonrun.h
 ===================================================================
---- Python-2.7.2.orig/Include/pythonrun.h
-+++ Python-2.7.2/Include/pythonrun.h
+--- Python-2.7.9.orig/Include/pythonrun.h
++++ Python-2.7.9/Include/pythonrun.h
 @@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
@@ -33,10 +24,10 @@ Index: Python-2.7.2/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-2.7.2/Lib/distutils/command/install.py
+Index: Python-2.7.9/Lib/distutils/command/install.py
 ===================================================================
---- Python-2.7.2.orig/Lib/distutils/command/install.py
-+++ Python-2.7.2/Lib/distutils/command/install.py
+--- Python-2.7.9.orig/Lib/distutils/command/install.py
++++ Python-2.7.9/Lib/distutils/command/install.py
 @@ -22,6 +22,8 @@ from site import USER_BASE
  from site import USER_SITE
  
@@ -55,11 +46,11 @@ Index: Python-2.7.2/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-2.7.2/Lib/pydoc.py
+Index: Python-2.7.9/Lib/pydoc.py
 ===================================================================
---- Python-2.7.2.orig/Lib/pydoc.py
-+++ Python-2.7.2/Lib/pydoc.py
-@@ -352,7 +352,7 @@ class Doc:
+--- Python-2.7.9.orig/Lib/pydoc.py
++++ Python-2.7.9/Lib/pydoc.py
+@@ -383,7 +383,7 @@ class Doc:
  
          docloc = os.environ.get("PYTHONDOCS",
                                  "http://docs.python.org/library")
@@ -68,11 +59,11 @@ Index: Python-2.7.2/Lib/pydoc.py
                                 "python"+sys.version[0:3])
          if (isinstance(object, type(os)) and
              (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-2.7.2/Lib/site.py
+Index: Python-2.7.9/Lib/site.py
 ===================================================================
---- Python-2.7.2.orig/Lib/site.py
-+++ Python-2.7.2/Lib/site.py
-@@ -300,13 +300,19 @@ def getsitepackages():
+--- Python-2.7.9.orig/Lib/site.py
++++ Python-2.7.9/Lib/site.py
+@@ -288,13 +288,19 @@ def getsitepackages():
          if sys.platform in ('os2emx', 'riscos'):
              sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
          elif os.sep == '/':
@@ -95,11 +86,11 @@ Index: Python-2.7.2/Lib/site.py
          if sys.platform == "darwin":
              # for framework builds *only* we add the standard Apple
              # locations.
-Index: Python-2.7.2/Lib/test/test_dl.py
+Index: Python-2.7.9/Lib/test/test_dl.py
 ===================================================================
---- Python-2.7.2.orig/Lib/test/test_dl.py
-+++ Python-2.7.2/Lib/test/test_dl.py
-@@ -5,10 +5,11 @@
+--- Python-2.7.9.orig/Lib/test/test_dl.py
++++ Python-2.7.9/Lib/test/test_dl.py
+@@ -4,10 +4,11 @@
  import unittest
  from test.test_support import verbose, import_module
  dl = import_module('dl', deprecated=True)
@@ -113,11 +104,11 @@ Index: Python-2.7.2/Lib/test/test_dl.py
      ('/usr/bin/cygwin1.dll', 'getpid'),
      ('/usr/lib/libc.dylib', 'getpid'),
      ]
-Index: Python-2.7.2/Lib/trace.py
+Index: Python-2.7.9/Lib/trace.py
 ===================================================================
---- Python-2.7.2.orig/Lib/trace.py
-+++ Python-2.7.2/Lib/trace.py
-@@ -762,10 +762,10 @@ def main(argv=None):
+--- Python-2.7.9.orig/Lib/trace.py
++++ Python-2.7.9/Lib/trace.py
+@@ -754,10 +754,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
                  s = s.replace("$prefix",
@@ -130,19 +121,19 @@ Index: Python-2.7.2/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-2.7.2/Makefile.pre.in
+Index: Python-2.7.9/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -81,6 +81,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
+--- Python-2.7.9.orig/Makefile.pre.in
++++ Python-2.7.9/Makefile.pre.in
+@@ -87,6 +87,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
 +LIB=		@LIB@
  
- # Install prefix for architecture-independent files
- prefix=		@prefix@
-@@ -97,7 +98,7 @@ LIBDIR=		@libdir@
+ # Multiarch directory (may be empty)
+ MULTIARCH=	@MULTIARCH@
+@@ -106,7 +107,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -151,7 +142,7 @@ Index: Python-2.7.2/Makefile.pre.in
  
  # Detailed destination directories
  BINLIBDEST=	$(LIBDIR)/python$(VERSION)
-@@ -532,6 +533,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -597,6 +598,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -159,7 +150,7 @@ Index: Python-2.7.2/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -566,7 +568,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
+@@ -639,7 +641,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -168,10 +159,10 @@ Index: Python-2.7.2/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-2.7.2/Modules/getpath.c
+Index: Python-2.7.9/Modules/getpath.c
 ===================================================================
---- Python-2.7.2.orig/Modules/getpath.c
-+++ Python-2.7.2/Modules/getpath.c
+--- Python-2.7.9.orig/Modules/getpath.c
++++ Python-2.7.9/Modules/getpath.c
 @@ -116,9 +116,11 @@
  #define EXEC_PREFIX PREFIX
  #endif
@@ -195,10 +186,10 @@ Index: Python-2.7.2/Modules/getpath.c
  
  static void
  reduce(char *dir)
-Index: Python-2.7.2/Python/getplatform.c
+Index: Python-2.7.9/Python/getplatform.c
 ===================================================================
---- Python-2.7.2.orig/Python/getplatform.c
-+++ Python-2.7.2/Python/getplatform.c
+--- Python-2.7.9.orig/Python/getplatform.c
++++ Python-2.7.9/Python/getplatform.c
 @@ -10,3 +10,13 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -213,11 +204,11 @@ Index: Python-2.7.2/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-2.7.2/Python/sysmodule.c
+Index: Python-2.7.9/Python/sysmodule.c
 ===================================================================
---- Python-2.7.2.orig/Python/sysmodule.c
-+++ Python-2.7.2/Python/sysmodule.c
-@@ -1416,6 +1416,8 @@ _PySys_Init(void)
+--- Python-2.7.9.orig/Python/sysmodule.c
++++ Python-2.7.9/Python/sysmodule.c
+@@ -1437,6 +1437,8 @@ _PySys_Init(void)
                          PyString_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
                          PyString_FromString(Py_GetPlatform()));
@@ -226,11 +217,11 @@ Index: Python-2.7.2/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyString_FromString(Py_GetProgramFullPath()));
      SET_SYS_FROM_STRING("prefix",
-Index: Python-2.7.2/configure.in
+Index: Python-2.7.9/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -629,6 +629,10 @@ SunOS*)
+--- Python-2.7.9.orig/configure.ac
++++ Python-2.7.9/configure.ac
+@@ -736,6 +736,11 @@ SunOS*)
      ;;
  esac
  
@@ -238,6 +229,7 @@ Index: Python-2.7.2/configure.in
 +AC_MSG_CHECKING(LIB)
 +LIB=`basename ${libdir}`
 +AC_MSG_RESULT($LIB)
++
  
  AC_SUBST(LIBRARY)
  AC_MSG_CHECKING(LIBRARY)
diff --git a/meta/recipes-devtools/python/python-native/nohostlibs.patch b/meta/recipes-devtools/python/python-native/nohostlibs.patch
index 09c3fb8..8a452e9 100644
--- a/meta/recipes-devtools/python/python-native/nohostlibs.patch
+++ b/meta/recipes-devtools/python/python-native/nohostlibs.patch
@@ -1,25 +1,28 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-2011/09/29
-rebased for python-2.7.2
+2014/12/15
+Rebased for python-2.7.9
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-2.7.2/setup.py
+Index: Python-2.7.9/setup.py
 ===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -369,8 +369,8 @@ class PyBuildExt(build_ext):
+--- Python-2.7.9.orig/setup.py
++++ Python-2.7.9/setup.py
+@@ -439,9 +439,9 @@ class PyBuildExt(build_ext):
  
      def detect_modules(self):
          # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+        #add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+-        if not cross_compiling:
+-            add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-            add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++        # if not cross_compiling:
++            # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++            # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+         if cross_compiling:
+             self.add_gcc_paths()
          self.add_multiarch_paths()
- 
-         # Add paths specified in the environment variables LDFLAGS and
-@@ -407,15 +407,15 @@ class PyBuildExt(build_ext):
+@@ -480,15 +480,15 @@ class PyBuildExt(build_ext):
                      for directory in reversed(options.dirs):
                          add_dir_to_list(dir_list, directory)
  
@@ -39,29 +42,13 @@ Index: Python-2.7.2/setup.py
                              sysconfig.get_config_var("INCLUDEDIR"))
  
          try:
-@@ -426,11 +426,8 @@ class PyBuildExt(build_ext):
-         # lib_dirs and inc_dirs are used to search for files;
-         # if a file is found in one of those directories, it can
-         # be assumed that no additional -I,-L directives are needed.
--        lib_dirs = self.compiler.library_dirs + [
--            '/lib64', '/usr/lib64',
--            '/lib', '/usr/lib',
--            ]
--        inc_dirs = self.compiler.include_dirs + ['/usr/include']
-+        lib_dirs = self.compiler.library_dirs
-+        inc_dirs = self.compiler.include_dirs
-         exts = []
-         missing = []
- 
-@@ -676,9 +673,8 @@ class PyBuildExt(build_ext):
+@@ -761,8 +761,7 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
 -            elif self.compiler.find_library_file(lib_dirs +
 -                                                     ['/usr/lib/termcap'],
--                                                     'termcap'):
 +            elif self.compiler.find_library_file(lib_dirs,
-+                                                     'termcap'):
+                                                      'termcap'):
                  readline_libs.append('termcap')
              exts.append( Extension('readline', ['readline.c'],
-                                    library_dirs=['/usr/lib/termcap'],
diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.9.bb
similarity index 90%
rename from meta/recipes-devtools/python/python-native_2.7.3.bb
rename to meta/recipes-devtools/python/python-native_2.7.9.bb
index e55f5fe..dfde361 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.9.bb
@@ -6,7 +6,6 @@ PR = "${INC_PR}.1"
 
 SRC_URI += "\
            file://05-enable-ctypes-cross-build.patch \
-           file://06-ctypes-libffi-fix-configure.patch \
            file://10-distutils-fix-swig-parameter.patch \
            file://11-distutils-never-modify-shebang-line.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
@@ -17,9 +16,6 @@ SRC_URI += "\
            file://add-md5module-support.patch \
            file://builddir.patch \
            file://parallel-makeinst-create-bindir.patch \
-           file://python-fix-build-error-with-Readline-6.3.patch \
-           file://gcc-4.8-fix-configure-Wformat.patch \
-           file://json-flaw-fix.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
@@ -58,7 +54,7 @@ do_install() {
 	# (these often end up too long for the #! parser in the kernel as the
 	# buffer is 128 bytes long).
 	ln -s python-native/python ${D}${bindir}/nativepython
-	
+
 	# We don't want modules in ~/.local being used in preference to those
 	# installed in the native sysroot, so disable user site support.
 	sed -i -e 's,^\(ENABLE_USER_SITE = \).*,\1False,' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index bc5e5b9..e18ab8e 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -5,12 +5,12 @@ SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ed3abfd1059e2d3a36a8cff3986f9bb6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dff3d00f049545862992d2d097831a13"
 
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2"
- 
-SRC_URI[md5sum] = "c57477edd6d18bd9eeca2f21add73919"
-SRC_URI[sha256sum] = "726457e11cb153adc3f428aaf1901fc561a374c30e5e7da6742c0742a338663c"
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "38d530f7efc373d64a8fb1637e3baaa7"
+SRC_URI[sha256sum] = "90d27e14ea7e03570026850e2e50ba71ad20b7eb31035aada1cf3def8f8d4916"
 
 PYTHON_MAJMIN = "2.7"
 
diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index 691bead..1257ca6 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -1,102 +1,83 @@
+We need to ensure our host tools get run during build, not the freshly
+built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
+
 Upstream-Status: Inappropriate [embedded specific]
 
-# We need to ensure our host tools get run during build, not the freshly
-# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Signed-off-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Rebased for python-2.7.9
+Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-2.7.2/Makefile.pre.in
+Index: Python-2.7.9/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -182,6 +182,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
- 
- PYTHON=		python$(EXE)
- BUILDPYTHON=	python$(BUILDEXE)
-+HOSTPYTHON=	$(BUILDPYTHON)
- 
- # The task to run while instrument when building the profile-opt target
- PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
-@@ -214,7 +215,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+--- Python-2.7.9.orig/Makefile.pre.in
++++ Python-2.7.9/Makefile.pre.in
+@@ -234,6 +234,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
  ##########################################################################
  # Parser
  PGEN=		Parser/pgen$(EXE)
--
 +HOSTPGEN=	$(PGEN)$(EXE)
- POBJS=		\
- 		Parser/acceler.o \
- 		Parser/grammar1.o \
-@@ -401,14 +402,14 @@ $(BUILDPYTHON):	Modules/python.o $(LIBRA
- 			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
- 
- platform: $(BUILDPYTHON)
--	$(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from sysconfig import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
-+	$(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from distutils.util import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
  
+ PSRCS=		\
+ 		Parser/acceler.c \
+@@ -445,7 +446,7 @@ $(BUILDPYTHON):	Modules/python.o $(LIBRA
+ 			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
  
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
- 	esac
+ platform: $(BUILDPYTHON) pybuilddir.txt
+-	$(RUNSHARED) $(PYTHON_FOR_BUILD) -c 'import sys ; from sysconfig import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
++	$(RUNSHARED) $(PYTHON_FOR_BUILD) -c 'import sys ; from distutils.util import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
  
- # Build static library
-@@ -542,7 +543,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
- $(GRAMMAR_H) $(GRAMMAR_C): Parser/pgen.stamp
- Parser/pgen.stamp: $(PGEN) $(GRAMMAR_INPUT)
- 		-@$(INSTALL) -d Include
+ # Create build directory and generate the sysconfig build-time data there.
+ # pybuilddir.txt contains the name of the build dir and is used for
+@@ -611,7 +612,7 @@ Modules/pwdmodule.o: $(srcdir)/Modules/p
+ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS)
+ 		@$(MKDIR_P) Include
+ 		$(MAKE) $(PGEN)
 -		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
 +		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- 		-touch Parser/pgen.stamp
- 
- $(PGEN):	$(PGENOBJS)
-@@ -926,25 +927,25 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
- 	done
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ $(GRAMMAR_C): $(GRAMMAR_H) $(GRAMMAR_INPUT) $(PGENSRCS)
+ 		$(MAKE) $(GRAMMAR_H)
+ 		touch $(GRAMMAR_C)
+@@ -1043,27 +1044,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+ 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
+ 	fi
  	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+-		$(PYTHON_FOR_BUILD) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
 +		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
  	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		$(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+-		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
-+		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+-		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
++		$(HOSTPYTHON) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
++		$(HOSTPYTHON) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
  
  # Create the PLATDIR source directory, if one wasn't distributed..
  $(srcdir)/Lib/$(PLATDIR):
-@@ -1049,7 +1050,7 @@ libainstall:	all python-config
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: sharedmods
--	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-Index: Python-2.7.2/setup.py
+Index: Python-2.7.9/setup.py
 ===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -313,6 +313,7 @@ class PyBuildExt(build_ext):
+--- Python-2.7.9.orig/setup.py
++++ Python-2.7.9/setup.py
+@@ -334,6 +334,7 @@ class PyBuildExt(build_ext):
              self.failed.append(ext.name)
              self.announce('*** WARNING: renaming "%s" since importing it'
                            ' failed: %s' % (ext.name, why), level=3)
@@ -104,18 +85,7 @@ Index: Python-2.7.2/setup.py
              assert not self.inplace
              basename, tail = os.path.splitext(ext_filename)
              newname = basename + "_failed" + tail
-@@ -369,8 +370,8 @@ class PyBuildExt(build_ext):
- 
-     def detect_modules(self):
-         # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+        #add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-         self.add_multiarch_paths()
- 
-         # Add paths specified in the environment variables LDFLAGS and
-@@ -475,6 +476,9 @@ class PyBuildExt(build_ext):
+@@ -558,6 +559,9 @@ class PyBuildExt(build_ext):
  
          # XXX Omitted modules: gl, pure, dl, SGI-specific modules
  
@@ -125,14 +95,3 @@ Index: Python-2.7.2/setup.py
          #
          # The following modules are all pretty straightforward, and compile
          # on pretty much any POSIXish platform.
-@@ -677,8 +681,8 @@ class PyBuildExt(build_ext):
-             elif curses_library:
-                 readline_libs.append(curses_library)
-             elif self.compiler.find_library_file(lib_dirs +
--                                                     ['/usr/lib/termcap'],
--                                                     'termcap'):
-+                                               ['/usr/lib/termcap'],
-+                                               'termcap'):
-                 readline_libs.append('termcap')
-             exts.append( Extension('readline', ['readline.c'],
-                                    library_dirs=['/usr/lib/termcap'],
diff --git a/meta/recipes-devtools/python/python/03-fix-tkinter-detection.patch b/meta/recipes-devtools/python/python/03-fix-tkinter-detection.patch
index d74e4b1..650ceb5 100644
--- a/meta/recipes-devtools/python/python/03-fix-tkinter-detection.patch
+++ b/meta/recipes-devtools/python/python/03-fix-tkinter-detection.patch
@@ -1,14 +1,18 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-# We need to supply STAGING_INCDIR here, otherwise the Tk headers
-# will not be found.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
+We need to supply STAGING_INCDIR here, otherwise the Tk headers
+will not be found.
 
-Index: Python-2.6.1/setup.py
-===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -1543,7 +1543,7 @@ class PyBuildExt(build_ext):
+Signed-off-by: Michael 'Mickey' Lauer <mickey@vanille.de>
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Rebased for python-2.7.9
+
+diff --git a/setup.py b/setup.py
+index 8fe1fb8..67eda74 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1892,7 +1892,7 @@ class PyBuildExt(build_ext):
                  dotversion = dotversion[:-1] + '.' + dotversion[-1]
              tcl_include_sub = []
              tk_include_sub = []
@@ -17,12 +21,12 @@ Index: Python-2.6.1/setup.py
                  tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
                  tk_include_sub += [dir + os.sep + "tk" + dotversion]
              tk_include_sub += tcl_include_sub
-@@ -1562,22 +1562,6 @@ class PyBuildExt(build_ext):
+@@ -1911,22 +1911,6 @@ class PyBuildExt(build_ext):
              if dir not in include_dirs:
                  include_dirs.append(dir)
  
 -        # Check for various platform-specific directories
--        if platform == 'sunos5':
+-        if host_platform == 'sunos5':
 -            include_dirs.append('/usr/openwin/include')
 -            added_lib_dirs.append('/usr/openwin/lib')
 -        elif os.path.exists('/usr/X11R6/include'):
@@ -38,5 +42,5 @@ Index: Python-2.6.1/setup.py
 -            added_lib_dirs.append('/usr/X11/lib')
 -
          # If Cygwin, then verify that X is installed before proceeding
-         if platform == 'cygwin':
+         if host_platform == 'cygwin':
              x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/meta/recipes-devtools/python/python/05-enable-ctypes-cross-build.patch b/meta/recipes-devtools/python/python/05-enable-ctypes-cross-build.patch
index a68a206..5cc8742 100644
--- a/meta/recipes-devtools/python/python/05-enable-ctypes-cross-build.patch
+++ b/meta/recipes-devtools/python/python/05-enable-ctypes-cross-build.patch
@@ -1,25 +1,22 @@
+Rebased for python 2.7.9
+
 Upstream-Status: Inappropriate [embedded specific]
 
 # CTypes need to know the actual host we are building on.
 # Signed-Off: Michael Dietrich <mdt@emdete.de>
 
-Index: Python-2.6.1/setup.py
+Index: Python-2.7.9/setup.py
 ===================================================================
---- Python-2.6.1.orig/setup.py
-+++ Python-2.6.1/setup.py
-@@ -1656,16 +1656,16 @@ class PyBuildExt(build_ext):
-                                          ffi_configfile):
-                 from distutils.dir_util import mkpath
-                 mkpath(ffi_builddir)
--                config_args = []
-+                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
+--- Python-2.7.9.orig/setup.py
++++ Python-2.7.9/setup.py
+@@ -2028,12 +2028,12 @@ class PyBuildExt(build_ext):
  
                  # Pass empty CFLAGS because we'll just append the resulting
                  # CFLAGS to Python's; -g or -O2 is to be avoided.
 -                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
 -                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
 +                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
-+                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
++                    % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
  
                  res = os.system(cmd)
                  if res or not os.path.exists(ffi_configfile):
diff --git a/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch b/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch
index f8ab0e7..e452cb6 100644
--- a/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch
+++ b/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch
@@ -13,18 +13,20 @@ Nitin A Kamble <nitin.a.kamble@intel.com>
 Rebased for python 2.7.2
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -680,12 +680,10 @@ class PyBuildExt(build_ext):
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/setup.py b/setup.py
+index 67eda74..59c537e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -761,12 +761,10 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
 -            elif self.compiler.find_library_file(lib_dirs +
--                                               ['/usr/lib/termcap'],
+-                                                     ['/usr/lib/termcap'],
 +            elif self.compiler.find_library_file(lib_dirs,
-                                                'termcap'):
+                                                      'termcap'):
                  readline_libs.append('termcap')
              exts.append( Extension('readline', ['readline.c'],
 -                                   library_dirs=['/usr/lib/termcap'],
diff --git a/meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch b/meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch
deleted file mode 100644
index abd63d2..0000000
--- a/meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-This fixes configure issues with recent autoconf, e.g:
-  autoreconf: Entering directory `Modules/_ctypes/libffi'
-  autoreconf: configure.ac: not using Gettext
-  autoreconf: running: aclocal --force
-  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
-  configure.ac:26: the top level
-
-The problem is still present in python-2.6.5 but fixed in python-svn.
-
-Upstream-Status: Accepted [python-svn]
-
-Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
-Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-
-2011/09/29
-Rebased for python 2.7.2
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-
-Index: Python-2.7.2/Modules/_ctypes/libffi/Makefile.am
-===================================================================
---- Python-2.7.2.orig/Modules/_ctypes/libffi/Makefile.am
-+++ Python-2.7.2/Modules/_ctypes/libffi/Makefile.am
-@@ -2,7 +2,7 @@
- 
- AUTOMAKE_OPTIONS = foreign subdir-objects
- 
--SUBDIRS = include testsuite man
-+SUBDIRS = include
- 
- EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
- 	src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
-@@ -34,8 +34,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
- 	libtool-version ChangeLog.libffi m4/libtool.m4 \
- 	m4/lt~obsolete.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4
- 
--info_TEXINFOS = doc/libffi.texi
--
- ## ################################################################
- 
- ##
diff --git a/meta/recipes-devtools/python/python/CVE-2013-4073_py27.patch b/meta/recipes-devtools/python/python/CVE-2013-4073_py27.patch
deleted file mode 100644
index 0d17463..0000000
--- a/meta/recipes-devtools/python/python/CVE-2013-4073_py27.patch
+++ /dev/null
@@ -1,251 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-diff -r 9ddc63c039ba Lib/test/nullbytecert.pem
---- /dev/null	Thu Jan 01 00:00:00 1970 +0000
-+++ b/Lib/test/nullbytecert.pem	Sun Aug 11 18:13:17 2013 +0200
-@@ -0,0 +1,90 @@
-+Certificate:
-+    Data:
-+        Version: 3 (0x2)
-+        Serial Number: 0 (0x0)
-+    Signature Algorithm: sha1WithRSAEncryption
-+        Issuer: C=US, ST=Oregon, L=Beaverton, O=Python Software Foundation, OU=Python Core Development, CN=null.python.org\x00example.org/emailAddress=python-dev@python.org
-+        Validity
-+            Not Before: Aug  7 13:11:52 2013 GMT
-+            Not After : Aug  7 13:12:52 2013 GMT
-+        Subject: C=US, ST=Oregon, L=Beaverton, O=Python Software Foundation, OU=Python Core Development, CN=null.python.org\x00example.org/emailAddress=python-dev@python.org
-+        Subject Public Key Info:
-+            Public Key Algorithm: rsaEncryption
-+                Public-Key: (2048 bit)
-+                Modulus:
-+                    00:b5:ea:ed:c9:fb:46:7d:6f:3b:76:80:dd:3a:f3:
-+                    03:94:0b:a7:a6:db:ec:1d:df:ff:23:74:08:9d:97:
-+                    16:3f:a3:a4:7b:3e:1b:0e:96:59:25:03:a7:26:e2:
-+                    88:a9:cf:79:cd:f7:04:56:b0:ab:79:32:6e:59:c1:
-+                    32:30:54:eb:58:a8:cb:91:f0:42:a5:64:27:cb:d4:
-+                    56:31:88:52:ad:cf:bd:7f:f0:06:64:1f:cc:27:b8:
-+                    a3:8b:8c:f3:d8:29:1f:25:0b:f5:46:06:1b:ca:02:
-+                    45:ad:7b:76:0a:9c:bf:bb:b9:ae:0d:16:ab:60:75:
-+                    ae:06:3e:9c:7c:31:dc:92:2f:29:1a:e0:4b:0c:91:
-+                    90:6c:e9:37:c5:90:d7:2a:d7:97:15:a3:80:8f:5d:
-+                    7b:49:8f:54:30:d4:97:2c:1c:5b:37:b5:ab:69:30:
-+                    68:43:d3:33:78:4b:02:60:f5:3c:44:80:a1:8f:e7:
-+                    f0:0f:d1:5e:87:9e:46:cf:62:fc:f9:bf:0c:65:12:
-+                    f1:93:c8:35:79:3f:c8:ec:ec:47:f5:ef:be:44:d5:
-+                    ae:82:1e:2d:9a:9f:98:5a:67:65:e1:74:70:7c:cb:
-+                    d3:c2:ce:0e:45:49:27:dc:e3:2d:d4:fb:48:0e:2f:
-+                    9e:77:b8:14:46:c0:c4:36:ca:02:ae:6a:91:8c:da:
-+                    2f:85
-+                Exponent: 65537 (0x10001)
-+        X509v3 extensions:
-+            X509v3 Basic Constraints: critical
-+                CA:FALSE
-+            X509v3 Subject Key Identifier:
-+                88:5A:55:C0:52:FF:61:CD:52:A3:35:0F:EA:5A:9C:24:38:22:F7:5C
-+            X509v3 Key Usage:
-+                Digital Signature, Non Repudiation, Key Encipherment
-+            X509v3 Subject Alternative Name:
-+                *************************************************************
-+                WARNING: The values for DNS, email and URI are WRONG. OpenSSL
-+                         doesn't print the text after a NULL byte.
-+                *************************************************************
-+                DNS:altnull.python.org, email:null@python.org, URI:http://null.python.org, IP Address:192.0.2.1, IP Address:2001:DB8:0:0:0:0:0:1
-+    Signature Algorithm: sha1WithRSAEncryption
-+         ac:4f:45:ef:7d:49:a8:21:70:8e:88:59:3e:d4:36:42:70:f5:
-+         a3:bd:8b:d7:a8:d0:58:f6:31:4a:b1:a4:a6:dd:6f:d9:e8:44:
-+         3c:b6:0a:71:d6:7f:b1:08:61:9d:60:ce:75:cf:77:0c:d2:37:
-+         86:02:8d:5e:5d:f9:0f:71:b4:16:a8:c1:3d:23:1c:f1:11:b3:
-+         56:6e:ca:d0:8d:34:94:e6:87:2a:99:f2:ae:ae:cc:c2:e8:86:
-+         de:08:a8:7f:c5:05:fa:6f:81:a7:82:e6:d0:53:9d:34:f4:ac:
-+         3e:40:fe:89:57:7a:29:a4:91:7e:0b:c6:51:31:e5:10:2f:a4:
-+         60:76:cd:95:51:1a:be:8b:a1:b0:fd:ad:52:bd:d7:1b:87:60:
-+         d2:31:c7:17:c4:18:4f:2d:08:25:a3:a7:4f:b7:92:ca:e2:f5:
-+         25:f1:54:75:81:9d:b3:3d:61:a2:f7:da:ed:e1:c6:6f:2c:60:
-+         1f:d8:6f:c5:92:05:ab:c9:09:62:49:a9:14:ad:55:11:cc:d6:
-+         4a:19:94:99:97:37:1d:81:5f:8b:cf:a3:a8:96:44:51:08:3d:
-+         0b:05:65:12:eb:b6:70:80:88:48:72:4f:c6:c2:da:cf:cd:8e:
-+         5b:ba:97:2f:60:b4:96:56:49:5e:3a:43:76:63:04:be:2a:f6:
-+         c1:ca:a9:94
-+-----BEGIN CERTIFICATE-----
-+MIIE2DCCA8CgAwIBAgIBADANBgkqhkiG9w0BAQUFADCBxTELMAkGA1UEBhMCVVMx
-+DzANBgNVBAgMBk9yZWdvbjESMBAGA1UEBwwJQmVhdmVydG9uMSMwIQYDVQQKDBpQ
-+eXRob24gU29mdHdhcmUgRm91bmRhdGlvbjEgMB4GA1UECwwXUHl0aG9uIENvcmUg
-+RGV2ZWxvcG1lbnQxJDAiBgNVBAMMG251bGwucHl0aG9uLm9yZwBleGFtcGxlLm9y
-+ZzEkMCIGCSqGSIb3DQEJARYVcHl0aG9uLWRldkBweXRob24ub3JnMB4XDTEzMDgw
-+NzEzMTE1MloXDTEzMDgwNzEzMTI1MlowgcUxCzAJBgNVBAYTAlVTMQ8wDQYDVQQI
-+DAZPcmVnb24xEjAQBgNVBAcMCUJlYXZlcnRvbjEjMCEGA1UECgwaUHl0aG9uIFNv
-+ZnR3YXJlIEZvdW5kYXRpb24xIDAeBgNVBAsMF1B5dGhvbiBDb3JlIERldmVsb3Bt
-+ZW50MSQwIgYDVQQDDBtudWxsLnB5dGhvbi5vcmcAZXhhbXBsZS5vcmcxJDAiBgkq
-+hkiG9w0BCQEWFXB5dGhvbi1kZXZAcHl0aG9uLm9yZzCCASIwDQYJKoZIhvcNAQEB
-+BQADggEPADCCAQoCggEBALXq7cn7Rn1vO3aA3TrzA5QLp6bb7B3f/yN0CJ2XFj+j
-+pHs+Gw6WWSUDpybiiKnPec33BFawq3kyblnBMjBU61ioy5HwQqVkJ8vUVjGIUq3P
-+vX/wBmQfzCe4o4uM89gpHyUL9UYGG8oCRa17dgqcv7u5rg0Wq2B1rgY+nHwx3JIv
-+KRrgSwyRkGzpN8WQ1yrXlxWjgI9de0mPVDDUlywcWze1q2kwaEPTM3hLAmD1PESA
-+oY/n8A/RXoeeRs9i/Pm/DGUS8ZPINXk/yOzsR/XvvkTVroIeLZqfmFpnZeF0cHzL
-+08LODkVJJ9zjLdT7SA4vnne4FEbAxDbKAq5qkYzaL4UCAwEAAaOB0DCBzTAMBgNV
-+HRMBAf8EAjAAMB0GA1UdDgQWBBSIWlXAUv9hzVKjNQ/qWpwkOCL3XDALBgNVHQ8E
-+BAMCBeAwgZAGA1UdEQSBiDCBhYIeYWx0bnVsbC5weXRob24ub3JnAGV4YW1wbGUu
-+Y29tgSBudWxsQHB5dGhvbi5vcmcAdXNlckBleGFtcGxlLm9yZ4YpaHR0cDovL251
-+bGwucHl0aG9uLm9yZwBodHRwOi8vZXhhbXBsZS5vcmeHBMAAAgGHECABDbgAAAAA
-+AAAAAAAAAAEwDQYJKoZIhvcNAQEFBQADggEBAKxPRe99SaghcI6IWT7UNkJw9aO9
-+i9eo0Fj2MUqxpKbdb9noRDy2CnHWf7EIYZ1gznXPdwzSN4YCjV5d+Q9xtBaowT0j
-+HPERs1ZuytCNNJTmhyqZ8q6uzMLoht4IqH/FBfpvgaeC5tBTnTT0rD5A/olXeimk
-+kX4LxlEx5RAvpGB2zZVRGr6LobD9rVK91xuHYNIxxxfEGE8tCCWjp0+3ksri9SXx
-+VHWBnbM9YaL32u3hxm8sYB/Yb8WSBavJCWJJqRStVRHM1koZlJmXNx2BX4vPo6iW
-+RFEIPQsFZRLrtnCAiEhyT8bC2s/Njlu6ly9gtJZWSV46Q3ZjBL4q9sHKqZQ=
-+-----END CERTIFICATE-----
-diff -r 9ddc63c039ba Lib/test/test_ssl.py
---- a/Lib/test/test_ssl.py	Sun Aug 11 13:04:50 2013 +0300
-+++ b/Lib/test/test_ssl.py	Sun Aug 11 18:13:17 2013 +0200
-@@ -25,6 +25,7 @@
- HOST = test_support.HOST
- CERTFILE = None
- SVN_PYTHON_ORG_ROOT_CERT = None
-+NULLBYTECERT = None
- 
- def handle_error(prefix):
-     exc_format = ' '.join(traceback.format_exception(*sys.exc_info()))
-@@ -123,6 +124,27 @@
-                           ('DNS', 'projects.forum.nokia.com'))
-                         )
- 
-+    def test_parse_cert_CVE_2013_4073(self):
-+        p = ssl._ssl._test_decode_cert(NULLBYTECERT)
-+        if test_support.verbose:
-+            sys.stdout.write("\n" + pprint.pformat(p) + "\n")
-+        subject = ((('countryName', 'US'),),
-+                   (('stateOrProvinceName', 'Oregon'),),
-+                   (('localityName', 'Beaverton'),),
-+                   (('organizationName', 'Python Software Foundation'),),
-+                   (('organizationalUnitName', 'Python Core Development'),),
-+                   (('commonName', 'null.python.org\x00example.org'),),
-+                   (('emailAddress', 'python-dev@python.org'),))
-+        self.assertEqual(p['subject'], subject)
-+        self.assertEqual(p['issuer'], subject)
-+        self.assertEqual(p['subjectAltName'],
-+                         (('DNS', 'altnull.python.org\x00example.com'),
-+                         ('email', 'null@python.org\x00user@example.org'),
-+                         ('URI', 'http://null.python.org\x00http://example.org'),
-+                         ('IP Address', '192.0.2.1'),
-+                         ('IP Address', '2001:DB8:0:0:0:0:0:1\n'))
-+                        )
-+
-     def test_DER_to_PEM(self):
-         with open(SVN_PYTHON_ORG_ROOT_CERT, 'r') as f:
-             pem = f.read()
-@@ -1360,7 +1382,7 @@
- 
- 
- def test_main(verbose=False):
--    global CERTFILE, SVN_PYTHON_ORG_ROOT_CERT, NOKIACERT
-+    global CERTFILE, SVN_PYTHON_ORG_ROOT_CERT, NOKIACERT, NULLBYTECERT
-     CERTFILE = os.path.join(os.path.dirname(__file__) or os.curdir,
-                             "keycert.pem")
-     SVN_PYTHON_ORG_ROOT_CERT = os.path.join(
-@@ -1368,10 +1390,13 @@
-         "https_svn_python_org_root.pem")
-     NOKIACERT = os.path.join(os.path.dirname(__file__) or os.curdir,
-                              "nokia.pem")
-+    NULLBYTECERT = os.path.join(os.path.dirname(__file__) or os.curdir,
-+                                "nullbytecert.pem")
- 
-     if (not os.path.exists(CERTFILE) or
-         not os.path.exists(SVN_PYTHON_ORG_ROOT_CERT) or
--        not os.path.exists(NOKIACERT)):
-+        not os.path.exists(NOKIACERT) or
-+        not os.path.exists(NULLBYTECERT)):
-         raise test_support.TestFailed("Can't read certificate files!")
- 
-     tests = [BasicTests, BasicSocketTests]
-diff -r 9ddc63c039ba Modules/_ssl.c
---- a/Modules/_ssl.c	Sun Aug 11 13:04:50 2013 +0300
-+++ b/Modules/_ssl.c	Sun Aug 11 18:13:17 2013 +0200
-@@ -741,8 +741,13 @@
- 
-             /* get a rendering of each name in the set of names */
- 
-+            int gntype;
-+            ASN1_STRING *as = NULL;
-+
-             name = sk_GENERAL_NAME_value(names, j);
--            if (name->type == GEN_DIRNAME) {
-+            gntype = name-> type;
-+            switch (gntype) {
-+            case GEN_DIRNAME:
- 
-                 /* we special-case DirName as a tuple of tuples of attributes */
- 
-@@ -764,11 +769,61 @@
-                     goto fail;
-                 }
-                 PyTuple_SET_ITEM(t, 1, v);
-+                break;
- 
--            } else {
-+            case GEN_EMAIL:
-+            case GEN_DNS:
-+            case GEN_URI:
-+                /* GENERAL_NAME_print() doesn't handle NUL bytes in ASN1_string
-+                   correctly. */
-+                t = PyTuple_New(2);
-+                if (t == NULL)
-+                    goto fail;
-+                switch (gntype) {
-+                case GEN_EMAIL:
-+                    v = PyUnicode_FromString("email");
-+                    as = name->d.rfc822Name;
-+                    break;
-+                case GEN_DNS:
-+                    v = PyUnicode_FromString("DNS");
-+                    as = name->d.dNSName;
-+                    break;
-+                case GEN_URI:
-+                    v = PyUnicode_FromString("URI");
-+                    as = name->d.uniformResourceIdentifier;
-+                    break;
-+                }
-+                if (v == NULL) {
-+                    Py_DECREF(t);
-+                    goto fail;
-+                }
-+                PyTuple_SET_ITEM(t, 0, v);
-+                v = PyString_FromStringAndSize((char *)ASN1_STRING_data(as),
-+                                               ASN1_STRING_length(as));
-+                if (v == NULL) {
-+                    Py_DECREF(t);
-+                    goto fail;
-+                }
-+                PyTuple_SET_ITEM(t, 1, v);
-+                break;
- 
-+            default:
-                 /* for everything else, we use the OpenSSL print form */
--
-+                switch (gntype) {
-+                    /* check for new general name type */
-+                    case GEN_OTHERNAME:
-+                    case GEN_X400:
-+                    case GEN_EDIPARTY:
-+                    case GEN_IPADD:
-+                    case GEN_RID:
-+                        break;
-+                    default:
-+                        if (PyErr_Warn(PyExc_RuntimeWarning,
-+				       "Unknown general name type") == -1) {
-+                            goto fail;
-+                        }
-+                        break;
-+                }
-                 (void) BIO_reset(biobuf);
-                 GENERAL_NAME_print(biobuf, name);
-                 len = BIO_gets(biobuf, buf, sizeof(buf)-1);
-@@ -794,6 +849,7 @@
-                     goto fail;
-                 }
-                 PyTuple_SET_ITEM(t, 1, v);
-+		break;
-             }
- 
-             /* and add that rendering to the list */
diff --git a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
index bedc390..208c57c 100644
--- a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
+++ b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
@@ -2,22 +2,17 @@ _tkinter module needs tk module along with tcl. tk is not yet integrated
 in yocto so we skip the check for this module.
 Avoid a warning by not adding this module to missing variable.
 
-Also simply disable the tk module since its not in DEPENDS.
-
 Upstream-Status: Inappropriate [distribution]
 
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: Python-2.7.3/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.3.orig/setup.py	2014-07-07 13:45:15.056233820 +0000
-+++ Python-2.7.3/setup.py	2014-07-16 16:06:37.145656284 +0000
-@@ -1639,10 +1639,12 @@
-         self.extensions.extend(exts)
- 
+--- Python-2.7.2.orig/setup.py	2012-04-05 23:18:38.500136647 +0300
++++ Python-2.7.2/setup.py	2012-04-05 23:19:35.888134969 +0300
+@@ -1634,8 +1634,10 @@
          # Call the method for detecting whether _tkinter can be compiled
--        self.detect_tkinter(inc_dirs, lib_dirs)
-+        #self.detect_tkinter(inc_dirs, lib_dirs)
+         self.detect_tkinter(inc_dirs, lib_dirs)
  
 -        if '_tkinter' not in [e.name for e in self.extensions]:
 -            missing.append('_tkinter')
diff --git a/meta/recipes-devtools/python/python/builddir.patch b/meta/recipes-devtools/python/python/builddir.patch
index 930170b..ad629a0 100644
--- a/meta/recipes-devtools/python/python/builddir.patch
+++ b/meta/recipes-devtools/python/python/builddir.patch
@@ -7,11 +7,11 @@ python recipe.
 Upstream-Status: Inappropriate
 RP 2012/11/13
 
-Index: Python-2.7.3/Lib/sysconfig.py
+Index: Python-2.7.9/Lib/sysconfig.py
 ===================================================================
---- Python-2.7.3.orig/Lib/sysconfig.py	2012-11-13 14:36:08.429167199 +0000
-+++ Python-2.7.3/Lib/sysconfig.py	2012-11-13 21:58:31.788551800 +0000
-@@ -93,6 +93,7 @@
+--- Python-2.7.9.orig/Lib/sysconfig.py
++++ Python-2.7.9/Lib/sysconfig.py
+@@ -93,6 +93,7 @@ _PREFIX = os.path.normpath(sys.prefix)
  _EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
  _CONFIG_VARS = None
  _USER_BASE = None
@@ -19,7 +19,7 @@ Index: Python-2.7.3/Lib/sysconfig.py
  
  def _safe_realpath(path):
      try:
-@@ -100,7 +102,9 @@
+@@ -100,7 +101,9 @@ def _safe_realpath(path):
      except OSError:
          return path
  
@@ -30,11 +30,11 @@ Index: Python-2.7.3/Lib/sysconfig.py
      _PROJECT_BASE = os.path.dirname(_safe_realpath(sys.executable))
  else:
      # sys.executable can be empty if argv[0] has been changed and Python is
-Index: Python-2.7.3/Lib/distutils/sysconfig.py
+Index: Python-2.7.9/Lib/distutils/sysconfig.py
 ===================================================================
---- Python-2.7.3.orig/Lib/distutils/sysconfig.py	2012-11-13 14:36:08.005167209 +0000
-+++ Python-2.7.3/Lib/distutils/sysconfig.py	2012-11-13 22:07:05.644540695 +0000
-@@ -26,6 +26,9 @@
+--- Python-2.7.9.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.9/Lib/distutils/sysconfig.py
+@@ -26,6 +26,9 @@ EXEC_PREFIX = os.path.normpath(sys.exec_
  # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
  # it'll live in project/PCbuild/amd64.
  project_base = os.path.dirname(os.path.abspath(sys.executable))
@@ -44,12 +44,3 @@ Index: Python-2.7.3/Lib/distutils/sysconfig.py
  if os.name == "nt" and "pcbuild" in project_base[-8:].lower():
      project_base = os.path.abspath(os.path.join(project_base, os.path.pardir))
  # PC/VS7.1
-@@ -247,7 +250,7 @@
- def get_makefile_filename():
-     """Return full pathname of installed Makefile from the Python build."""
-     if python_build:
--        return os.path.join(os.path.dirname(sys.executable), "Makefile")
-+        return os.path.join(project_base, "Makefile")
-     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
-     return os.path.join(lib_dir, "config", "Makefile")
- 
diff --git a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
index 50d3915..e4262d9 100644
--- a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
+++ b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
@@ -11,72 +11,67 @@ Updated for python 2.7.3
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2012/05/01
 
-Index: Python-2.7.3/Lib/sysconfig.py
+Rebased for python-2.7.9
+Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+
+
+Index: Python-2.7.9/Lib/sysconfig.py
 ===================================================================
---- Python-2.7.3.orig/Lib/sysconfig.py
-+++ Python-2.7.3/Lib/sysconfig.py
-@@ -7,10 +7,10 @@ from os.path import pardir, realpath
- 
- _INSTALL_SCHEMES = {
+--- Python-2.7.9.orig/Lib/sysconfig.py
++++ Python-2.7.9/Lib/sysconfig.py
+@@ -9,7 +9,7 @@ _INSTALL_SCHEMES = {
      'posix_prefix': {
--        'stdlib': '{base}/lib/python{py_version_short}',
--        'platstdlib': '{platbase}/lib/python{py_version_short}',
+         'stdlib': '{base}/'+sys.lib+'/python{py_version_short}',
+         'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
 -        'purelib': '{base}/lib/python{py_version_short}/site-packages',
--        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
-+        'stdlib': '{base}/'+sys.lib+'/python{py_version_short}',
-+        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
 +        'purelib': '{base}/'+sys.lib+'/python{py_version_short}/site-packages',
-+        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
          'include': '{base}/include/python{py_version_short}',
          'platinclude': '{platbase}/include/python{py_version_short}',
-         'scripts': '{base}/bin',
-@@ -65,10 +65,10 @@ _INSTALL_SCHEMES = {
-         'data'   : '{userbase}',
-         },
+@@ -67,7 +67,7 @@ _INSTALL_SCHEMES = {
      'posix_user': {
--        'stdlib': '{userbase}/lib/python{py_version_short}',
--        'platstdlib': '{userbase}/lib/python{py_version_short}',
+         'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
+         'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
 -        'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
--        'platlib': '{userbase}/lib/python{py_version_short}/site-packages',
-+        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
-+        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
 +        'purelib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
-+        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
-         'data'   : '{userbase}',
-Index: Python-2.7.3/Makefile.pre.in
+Index: Python-2.7.9/Makefile.pre.in
 ===================================================================
---- Python-2.7.3.orig/Makefile.pre.in
-+++ Python-2.7.3/Makefile.pre.in
-@@ -941,25 +941,25 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+--- Python-2.7.9.orig/Makefile.pre.in
++++ Python-2.7.9/Makefile.pre.in
+@@ -1046,27 +1046,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
 -	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
-+	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
++	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
  		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
 -	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
-+	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}$(RUNSHARED) \
+ 		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
-+	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
+ 		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 +	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 +	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 		$(HOSTPYTHON) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
+ 		$(HOSTPYTHON) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
  
  # Create the PLATDIR source directory, if one wasn't distributed..
diff --git a/meta/recipes-devtools/python/python/gcc-4.8-fix-configure-Wformat.patch b/meta/recipes-devtools/python/python/gcc-4.8-fix-configure-Wformat.patch
deleted file mode 100644
index b5d9d5d..0000000
--- a/meta/recipes-devtools/python/python/gcc-4.8-fix-configure-Wformat.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-backport bug 17547 from http://hg.python.org/cpython/rev/9d50af4c482f/
-
--Wformat is needed by gcc 4.8
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Backport
-Index: Python-2.7.3/configure.in
-===================================================================
---- Python-2.7.3.orig/configure.in	2013-06-11 02:22:04.186529212 -0700
-+++ Python-2.7.3/configure.in	2013-06-13 02:17:06.324403327 -0700
-@@ -1196,7 +1196,7 @@
- then
-   AC_MSG_CHECKING(whether gcc supports ParseTuple __format__)
-   save_CFLAGS=$CFLAGS
--  CFLAGS="$CFLAGS -Werror"
-+  CFLAGS="$CFLAGS -Werror -Wformat"
-   AC_COMPILE_IFELSE([
-     AC_LANG_PROGRAM([[void f(char*,...)__attribute((format(PyArg_ParseTuple, 1, 2)));]], [[]])
-   ],[
diff --git a/meta/recipes-devtools/python/python/host_include_contamination.patch b/meta/recipes-devtools/python/python/host_include_contamination.patch
index 62cb8b1..e0aafb2 100644
--- a/meta/recipes-devtools/python/python/host_include_contamination.patch
+++ b/meta/recipes-devtools/python/python/host_include_contamination.patch
@@ -12,16 +12,17 @@ so we add a check here.
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py	2012-02-03 12:10:42.307057756 -0800
-+++ Python-2.7.2/setup.py	2012-02-03 12:11:12.363059210 -0800
-@@ -360,6 +360,8 @@
-         # https://wiki.ubuntu.com/MultiarchSpec
+
+diff --git a/setup.py b/setup.py
+index ba2d242..bf859be 100644
+--- a/setup.py
++++ b/setup.py
+@@ -393,6 +393,8 @@ class PyBuildExt(build_ext):
+ 
          if not find_executable('dpkg-architecture'):
              return
-+	if os.environ.get('CROSS_COMPILE') is not None:
-+	    return
-         tmpfile = os.path.join(self.build_temp, 'multiarch')
-         if not os.path.exists(self.build_temp):
-             os.makedirs(self.build_temp)
++        if os.environ.get('CROSS_COMPILE') is not None:
++            return
+         opt = ''
+         if cross_compiling:
+             opt = '-t' + sysconfig.get_config_var('HOST_GNU_TYPE')
diff --git a/meta/recipes-devtools/python/python/json-flaw-fix.patch b/meta/recipes-devtools/python/python/json-flaw-fix.patch
deleted file mode 100644
index e9a6cca..0000000
--- a/meta/recipes-devtools/python/python/json-flaw-fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-
-python: fix _json module arbitrary process memory read vulnerability
-
-Upstream-Status: submitted
-
-Signed-off-by: Daniel BORNAZ <daniel.bornaz@enea.com>
-
---- a/Modules/_json.c	2014-07-15 15:37:17.151046356 +0200
-+++ b/Modules/_json.c	2014-07-15 15:38:37.335605042 +0200
-@@ -1491,7 +1491,7 @@ scan_once_str(PyScannerObject *s, PyObje
-     PyObject *res;
-     char *str = PyString_AS_STRING(pystr);
-     Py_ssize_t length = PyString_GET_SIZE(pystr);
--    if (idx >= length) {
-+    if ( idx < 0 || idx >= length) {
-         PyErr_SetNone(PyExc_StopIteration);
-         return NULL;
-     }
-@@ -1578,7 +1578,7 @@ scan_once_unicode(PyScannerObject *s, Py
-     PyObject *res;
-     Py_UNICODE *str = PyUnicode_AS_UNICODE(pystr);
-     Py_ssize_t length = PyUnicode_GET_SIZE(pystr);
--    if (idx >= length) {
-+    if ( idx < 0 || idx >= length) {
-         PyErr_SetNone(PyExc_StopIteration);
-         return NULL;
-     }
diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index df470f7..0bfa0d2 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -1,26 +1,25 @@
-commit 248279e54467a8cd5cde98fc124d1d1384703513
-Author: Yu Ke <ke.yu@intel.com>
-Date:   Tue Jun 28 21:21:29 2011 +0800
+Rebased for python-2.7.9
+Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-    SUSE patch for the lib64 issue
-    
-    see detail in http://bugs.python.org/issue1294959
-    
-    also rebased a bit for Yocto python 2.6.6
-    
-    Picked-by: Yu Ke <ke.yu@intel.com>
-
-2011/09/29
-Rebased for python 2.7.2
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-Index: Python-2.7.2/Include/pythonrun.h
+Index: Python-2.7.9/configure.ac
 ===================================================================
---- Python-2.7.2.orig/Include/pythonrun.h
-+++ Python-2.7.2/Include/pythonrun.h
+--- Python-2.7.9.orig/configure.ac
++++ Python-2.7.9/configure.ac
+@@ -736,6 +736,10 @@ SunOS*)
+     ;;
+ esac
+ 
++AC_SUBST(LIB)
++AC_MSG_CHECKING(LIB)
++LIB=`basename ${libdir}`
++AC_MSG_RESULT($LIB)
+ 
+ AC_SUBST(LIBRARY)
+ AC_MSG_CHECKING(LIBRARY)
+Index: Python-2.7.9/Include/pythonrun.h
+===================================================================
+--- Python-2.7.9.orig/Include/pythonrun.h
++++ Python-2.7.9/Include/pythonrun.h
 @@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
@@ -29,10 +28,10 @@ Index: Python-2.7.2/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-2.7.2/Lib/distutils/command/install.py
+Index: Python-2.7.9/Lib/distutils/command/install.py
 ===================================================================
---- Python-2.7.2.orig/Lib/distutils/command/install.py
-+++ Python-2.7.2/Lib/distutils/command/install.py
+--- Python-2.7.9.orig/Lib/distutils/command/install.py
++++ Python-2.7.9/Lib/distutils/command/install.py
 @@ -22,6 +22,8 @@ from site import USER_BASE
  from site import USER_SITE
  
@@ -51,11 +50,11 @@ Index: Python-2.7.2/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-2.7.2/Lib/distutils/sysconfig.py
+Index: Python-2.7.9/Lib/distutils/sysconfig.py
 ===================================================================
---- Python-2.7.2.orig/Lib/distutils/sysconfig.py
-+++ Python-2.7.2/Lib/distutils/sysconfig.py
-@@ -114,8 +114,11 @@ def get_python_lib(plat_specific=0, stan
+--- Python-2.7.9.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.9/Lib/distutils/sysconfig.py
+@@ -119,8 +119,11 @@ def get_python_lib(plat_specific=0, stan
          prefix = plat_specific and EXEC_PREFIX or PREFIX
  
      if os.name == "posix":
@@ -69,11 +68,11 @@ Index: Python-2.7.2/Lib/distutils/sysconfig.py
          if standard_lib:
              return libpython
          else:
-Index: Python-2.7.2/Lib/pydoc.py
+Index: Python-2.7.9/Lib/pydoc.py
 ===================================================================
---- Python-2.7.2.orig/Lib/pydoc.py
-+++ Python-2.7.2/Lib/pydoc.py
-@@ -352,7 +352,7 @@ class Doc:
+--- Python-2.7.9.orig/Lib/pydoc.py
++++ Python-2.7.9/Lib/pydoc.py
+@@ -383,7 +383,7 @@ class Doc:
  
          docloc = os.environ.get("PYTHONDOCS",
                                  "http://docs.python.org/library")
@@ -82,11 +81,11 @@ Index: Python-2.7.2/Lib/pydoc.py
                                 "python"+sys.version[0:3])
          if (isinstance(object, type(os)) and
              (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-2.7.2/Lib/site.py
+Index: Python-2.7.9/Lib/site.py
 ===================================================================
---- Python-2.7.2.orig/Lib/site.py
-+++ Python-2.7.2/Lib/site.py
-@@ -300,13 +300,19 @@ def getsitepackages():
+--- Python-2.7.9.orig/Lib/site.py
++++ Python-2.7.9/Lib/site.py
+@@ -288,13 +288,18 @@ def getsitepackages():
          if sys.platform in ('os2emx', 'riscos'):
              sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
          elif os.sep == '/':
@@ -95,12 +94,11 @@ Index: Python-2.7.2/Lib/site.py
                                          "python" + sys.version[:3],
                                          "site-packages"))
 -            sitepackages.append(os.path.join(prefix, "lib", "site-python"))
-+            if sys.lib != "lib":
-+                sitepackages.append(os.path.join(prefix, "lib",
-+                                        "python" + sys.version[:3],
-+                                        "site-packages"))
 +            sitepackages.append(os.path.join(prefix, sys.lib, "site-python"))
 +            if sys.lib != "lib":
++                sitepackages.append(os.path.join(prefix, "lib",
++                                            "python" + sys.version[:3],
++                                            "site-packages"))
 +                sitepackages.append(os.path.join(prefix, "lib", "site-python"))
          else:
              sitepackages.append(prefix)
@@ -109,11 +107,43 @@ Index: Python-2.7.2/Lib/site.py
          if sys.platform == "darwin":
              # for framework builds *only* we add the standard Apple
              # locations.
-Index: Python-2.7.2/Lib/test/test_dl.py
+Index: Python-2.7.9/Lib/sysconfig.py
+===================================================================
+--- Python-2.7.9.orig/Lib/sysconfig.py
++++ Python-2.7.9/Lib/sysconfig.py
+@@ -7,10 +7,10 @@ from os.path import pardir, realpath
+ 
+ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+-        'stdlib': '{base}/lib/python{py_version_short}',
+-        'platstdlib': '{platbase}/lib/python{py_version_short}',
++        'stdlib': '{base}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{base}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
++        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include': '{base}/include/python{py_version_short}',
+         'platinclude': '{platbase}/include/python{py_version_short}',
+         'scripts': '{base}/bin',
+@@ -65,10 +65,10 @@ _INSTALL_SCHEMES = {
+         'data'   : '{userbase}',
+         },
+     'posix_user': {
+-        'stdlib': '{userbase}/lib/python{py_version_short}',
+-        'platstdlib': '{userbase}/lib/python{py_version_short}',
++        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{userbase}/lib/python{py_version_short}/site-packages',
++        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include': '{userbase}/include/python{py_version_short}',
+         'scripts': '{userbase}/bin',
+         'data'   : '{userbase}',
+Index: Python-2.7.9/Lib/test/test_dl.py
 ===================================================================
---- Python-2.7.2.orig/Lib/test/test_dl.py
-+++ Python-2.7.2/Lib/test/test_dl.py
-@@ -5,10 +5,11 @@
+--- Python-2.7.9.orig/Lib/test/test_dl.py
++++ Python-2.7.9/Lib/test/test_dl.py
+@@ -4,10 +4,11 @@
  import unittest
  from test.test_support import verbose, import_module
  dl = import_module('dl', deprecated=True)
@@ -127,11 +157,35 @@ Index: Python-2.7.2/Lib/test/test_dl.py
      ('/usr/bin/cygwin1.dll', 'getpid'),
      ('/usr/lib/libc.dylib', 'getpid'),
      ]
-Index: Python-2.7.2/Lib/trace.py
+Index: Python-2.7.9/Lib/test/test_site.py
 ===================================================================
---- Python-2.7.2.orig/Lib/trace.py
-+++ Python-2.7.2/Lib/trace.py
-@@ -762,10 +762,10 @@ def main(argv=None):
+--- Python-2.7.9.orig/Lib/test/test_site.py
++++ Python-2.7.9/Lib/test/test_site.py
+@@ -241,12 +241,16 @@ class HelperFunctionsTests(unittest.Test
+             self.assertEqual(dirs[2], wanted)
+         elif os.sep == '/':
+             # OS X non-framwework builds, Linux, FreeBSD, etc
+-            self.assertEqual(len(dirs), 2)
+             wanted = os.path.join('xoxo', 'lib', 'python' + sys.version[:3],
+                                   'site-packages')
+-            self.assertEqual(dirs[0], wanted)
++            self.assertTrue(wanted in dirs)
+             wanted = os.path.join('xoxo', 'lib', 'site-python')
+-            self.assertEqual(dirs[1], wanted)
++            self.assertTrue(wanted in dirs)
++            wanted = os.path.join('xoxo', sys.lib, 'python' + sys.version[:3],
++                                  'site-packages')
++            self.assertTrue(wanted in dirs)
++            wanted = os.path.join('xoxo', sys.lib, 'site-python')
++            self.assertTrue(wanted in dirs)
+         else:
+             # other platforms
+             self.assertEqual(len(dirs), 2)
+Index: Python-2.7.9/Lib/trace.py
+===================================================================
+--- Python-2.7.9.orig/Lib/trace.py
++++ Python-2.7.9/Lib/trace.py
+@@ -754,10 +754,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
                  s = s.replace("$prefix",
@@ -144,19 +198,19 @@ Index: Python-2.7.2/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-2.7.2/Makefile.pre.in
+Index: Python-2.7.9/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -81,6 +81,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
+--- Python-2.7.9.orig/Makefile.pre.in
++++ Python-2.7.9/Makefile.pre.in
+@@ -87,6 +87,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
 +LIB=		@LIB@
  
- # Install prefix for architecture-independent files
- prefix=		@prefix@
-@@ -97,7 +98,7 @@ LIBDIR=		@libdir@
+ # Multiarch directory (may be empty)
+ MULTIARCH=	@MULTIARCH@
+@@ -106,7 +107,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -165,7 +219,7 @@ Index: Python-2.7.2/Makefile.pre.in
  
  # Detailed destination directories
  BINLIBDEST=	$(LIBDIR)/python$(VERSION)
-@@ -533,6 +534,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -598,6 +599,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -173,7 +227,7 @@ Index: Python-2.7.2/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -567,7 +569,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
+@@ -640,7 +642,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -182,10 +236,10 @@ Index: Python-2.7.2/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-2.7.2/Modules/getpath.c
+Index: Python-2.7.9/Modules/getpath.c
 ===================================================================
---- Python-2.7.2.orig/Modules/getpath.c
-+++ Python-2.7.2/Modules/getpath.c
+--- Python-2.7.9.orig/Modules/getpath.c
++++ Python-2.7.9/Modules/getpath.c
 @@ -116,9 +116,11 @@
  #define EXEC_PREFIX PREFIX
  #endif
@@ -209,10 +263,10 @@ Index: Python-2.7.2/Modules/getpath.c
  
  static void
  reduce(char *dir)
-Index: Python-2.7.2/Python/getplatform.c
+Index: Python-2.7.9/Python/getplatform.c
 ===================================================================
---- Python-2.7.2.orig/Python/getplatform.c
-+++ Python-2.7.2/Python/getplatform.c
+--- Python-2.7.9.orig/Python/getplatform.c
++++ Python-2.7.9/Python/getplatform.c
 @@ -10,3 +10,13 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -227,31 +281,16 @@ Index: Python-2.7.2/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-2.7.2/Python/sysmodule.c
+Index: Python-2.7.9/Python/sysmodule.c
 ===================================================================
---- Python-2.7.2.orig/Python/sysmodule.c
-+++ Python-2.7.2/Python/sysmodule.c
-@@ -1416,6 +1416,8 @@ _PySys_Init(void)
+--- Python-2.7.9.orig/Python/sysmodule.c
++++ Python-2.7.9/Python/sysmodule.c
+@@ -1437,6 +1437,8 @@ _PySys_Init(void)
                          PyString_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
                          PyString_FromString(Py_GetPlatform()));
 +    SET_SYS_FROM_STRING("lib",
-+                PyString_FromString(Py_GetLib()));
++                        PyString_FromString(Py_GetLib()));
      SET_SYS_FROM_STRING("executable",
                          PyString_FromString(Py_GetProgramFullPath()));
      SET_SYS_FROM_STRING("prefix",
-Index: Python-2.7.2/configure.in
-===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -629,6 +629,10 @@ SunOS*)
-     ;;
- esac
- 
-+AC_SUBST(LIB)
-+AC_MSG_CHECKING(LIB)
-+LIB=`basename ${libdir}`
-+AC_MSG_RESULT($LIB)
- 
- AC_SUBST(LIBRARY)
- AC_MSG_CHECKING(LIBRARY)
diff --git a/meta/recipes-devtools/python/python/posix_close.patch b/meta/recipes-devtools/python/python/posix_close.patch
deleted file mode 100644
index 725531a..0000000
--- a/meta/recipes-devtools/python/python/posix_close.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-backport from http://bugs.python.org/issue20594
-
-- Issue #20594: Avoid name clash with the libc function posix_close.
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-
-# HG changeset patch
-# User Benjamin Peterson <benjamin@python.org>
-# Date 1392131776 18000
-# Node ID 1d253360d5a6d8d987fb2480e26f4fcc2d730932
-# Parent  41e49f1c5bd8ff48a6c18804c958e82c659daab3
-avoid name clash with posix_close (closes #20594)
-
-diff --git a/Modules/posixmodule.c b/Modules/posixmodule.c
---- a/Modules/posixmodule.c
-+++ b/Modules/posixmodule.c
-@@ -6581,8 +6581,12 @@ PyDoc_STRVAR(posix_close__doc__,
- "close(fd)\n\n\
- Close a file descriptor (for low level IO).");
- 
--static PyObject *
--posix_close(PyObject *self, PyObject *args)
-+/*
-+The underscore at end of function name avoids a name clash with the libc
-+function posix_close.
-+*/
-+static PyObject *
-+posix_close_(PyObject *self, PyObject *args)
- {
-     int fd, res;
-     if (!PyArg_ParseTuple(args, "i:close", &fd))
-@@ -8960,7 +8964,7 @@ static PyMethodDef posix_methods[] = {
-     {"tcsetpgrp",       posix_tcsetpgrp, METH_VARARGS, posix_tcsetpgrp__doc__},
- #endif /* HAVE_TCSETPGRP */
-     {"open",            posix_open, METH_VARARGS, posix_open__doc__},
--    {"close",           posix_close, METH_VARARGS, posix_close__doc__},
-+    {"close",           posix_close_, METH_VARARGS, posix_close__doc__},
-     {"closerange",      posix_closerange, METH_VARARGS, posix_closerange__doc__},
-     {"dup",             posix_dup, METH_VARARGS, posix_dup__doc__},
-     {"dup2",            posix_dup2, METH_VARARGS, posix_dup2__doc__},
-
diff --git a/meta/recipes-devtools/python/python/pypirc-secure.patch b/meta/recipes-devtools/python/python/pypirc-secure.patch
deleted file mode 100644
index 8e2df67..0000000
--- a/meta/recipes-devtools/python/python/pypirc-secure.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-# HG changeset patch
-# User Philip Jenvey <pjenvey@underboss.org>
-# Date 1322701507 28800
-# Branch 2.7
-# Node ID e7c20a8476a0e2ca18f8040864cbc400818d8f24
-# Parent  3ecddf168f1f554a17a047384fe0b02f2d688277
-create the .pypirc securely
-
-Upstream-Status: Backport
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-
-diff -r 3ecddf168f1f -r e7c20a8476a0 Lib/distutils/config.py
---- a/Lib/distutils/config.py	Tue Nov 29 00:53:09 2011 +0100
-+++ b/Lib/distutils/config.py	Wed Nov 30 17:05:07 2011 -0800
-@@ -42,16 +42,8 @@
-     def _store_pypirc(self, username, password):
-         """Creates a default .pypirc file."""
-         rc = self._get_rc_file()
--        f = open(rc, 'w')
--        try:
--            f.write(DEFAULT_PYPIRC % (username, password))
--        finally:
--            f.close()
--        try:
--            os.chmod(rc, 0600)
--        except OSError:
--            # should do something better here
--            pass
-+        with os.fdopen(os.open(rc, os.O_CREAT | os.O_WRONLY, 0600), 'w') as fp:
-+            fp.write(DEFAULT_PYPIRC % (username, password))
- 
-     def _read_pypirc(self):
-         """Reads the .pypirc file."""
diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2012-2135.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2012-2135.patch
deleted file mode 100644
index 3afdbc0..0000000
--- a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2012-2135.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Upstream-Status: Backport
-
-Reference:http://bugs.python.org/issue14579
-
-The utf-16 decoder in Python 3.1 through 3.3 does not update the
-aligned_end variable after calling the unicode_decode_call_errorhandler
-function, which allows remote attackers to obtain sensitive information
-(process memory) or cause a denial of service (memory corruption and crash)
-via unspecified vectors.
-
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135
-
-diff -urpN a/Lib/test/test_codecs.py b/Lib/test/test_codecs.py
---- a/Lib/test/test_codecs.py
-+++ b/Lib/test/test_codecs.py
-@@ -495,8 +495,21 @@ class UTF16LETest(ReadTest):
-         )
- 
-     def test_errors(self):
--        self.assertRaises(UnicodeDecodeError, codecs.utf_16_le_decode, "\xff", "strict", True)
--
-+        tests = [
-+            (b'\xff', u'\ufffd'),
-+            (b'A\x00Z', u'A\ufffd'),
-+            (b'A\x00B\x00C\x00D\x00Z', u'ABCD\ufffd'),
-+            (b'\x00\xd8', u'\ufffd'),
-+            (b'\x00\xd8A', u'\ufffd'),
-+            (b'\x00\xd8A\x00', u'\ufffdA'),
-+            (b'\x00\xdcA\x00', u'\ufffdA'),
-+        ]
-+        for raw, expected in tests:
-+            print('*****', raw, expected)
-+            self.assertRaises(UnicodeDecodeError, codecs.utf_16_le_decode,
-+                              raw, 'strict', True)
-+            self.assertEqual(raw.decode('utf-16le', 'replace'), expected)
-+        
- class UTF16BETest(ReadTest):
-     encoding = "utf-16-be"
- 
-@@ -516,7 +529,20 @@ class UTF16BETest(ReadTest):
-         )
- 
-     def test_errors(self):
--        self.assertRaises(UnicodeDecodeError, codecs.utf_16_be_decode, "\xff", "strict", True)
-+        tests = [
-+            (b'\xff', u'\ufffd'),
-+            (b'\x00A\xff', u'A\ufffd'),
-+            (b'\x00A\x00B\x00C\x00DZ', u'ABCD\ufffd'),
-+            (b'\xd8\x00', u'\ufffd'),
-+            (b'\xd8\x00\xdc', u'\ufffd'),
-+            (b'\xd8\x00\x00A', u'\ufffdA'),
-+            (b'\xdc\x00\x00A', u'\ufffdA'),
-+        ]
-+        for raw, expected in tests:
-+            print('*****', raw, expected)
-+            self.assertRaises(UnicodeDecodeError, codecs.utf_16_be_decode,
-+                              raw, 'strict', True)
-+            self.assertEqual(raw.decode('utf-16be', 'replace'), expected)
- 
- class UTF8Test(ReadTest):
-     encoding = "utf-8"
-diff -urpN a/Objects/unicodeobject.c b/Objects/unicodeobject.c
---- a/Objects/unicodeobject.c	2013-03-04 11:34:34.000000000 +0800
-+++ b/Objects/unicodeobject.c	2013-03-04 11:36:01.000000000 +0800
-@@ -2564,7 +2564,7 @@ PyUnicode_DecodeUTF16Stateful(const char
-         }
- 
-         /* UTF-16 code pair: */
--        if (q >= e) {
-+        if (e - q < 2) {
-             errmsg = "unexpected end of data";
-             startinpos = (((const char *)q)-2)-starts;
-             endinpos = ((const char *)e)-starts;
diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-smtplib-fix.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-smtplib-fix.patch
deleted file mode 100644
index f34ff40..0000000
--- a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-smtplib-fix.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-Upstream-Status: Backport
-
-Reference: http://bugs.python.org/issue16042
-
-CVE-2013-1752: smtplib: Limit amount of data read by limiting the 
-call to readline().  Original patch by Christian Heimes
-
-Signed-off-by: Maxin B. John <maxin.john@enea.com>
----
-diff -Naur Python-2.7.3-orig/Lib/smtplib.py Python-2.7.3/Lib/smtplib.py
---- Python-2.7.3-orig/Lib/smtplib.py	2012-04-10 01:07:31.000000000 +0200
-+++ Python-2.7.3/Lib/smtplib.py	2014-02-27 14:15:24.444198465 +0100
-@@ -57,6 +57,7 @@
- SMTP_PORT = 25
- SMTP_SSL_PORT = 465
- CRLF = "\r\n"
-+_MAXLINE = 8192 # more than 8 times larger than RFC 821, 4.5.3
- 
- OLDSTYLE_AUTH = re.compile(r"auth=(.*)", re.I)
- 
-@@ -179,10 +180,14 @@
-         def __init__(self, sslobj):
-             self.sslobj = sslobj
- 
--        def readline(self):
-+        def readline(self, size=-1):
-+            if size < 0:
-+                size = None
-             str = ""
-             chr = None
-             while chr != "\n":
-+                if size is not None and len(str) >= size:
-+                    break
-                 chr = self.sslobj.read(1)
-                 if not chr:
-                     break
-@@ -351,7 +356,7 @@
-             self.file = self.sock.makefile('rb')
-         while 1:
-             try:
--                line = self.file.readline()
-+                line = self.file.readline(_MAXLINE + 1)
-             except socket.error as e:
-                 self.close()
-                 raise SMTPServerDisconnected("Connection unexpectedly closed: "
-@@ -361,6 +366,8 @@
-                 raise SMTPServerDisconnected("Connection unexpectedly closed")
-             if self.debuglevel > 0:
-                 print>>stderr, 'reply:', repr(line)
-+            if len(line) > _MAXLINE:
-+                raise SMTPResponseException(500, "Line too long.")
-             resp.append(line[4:].strip())
-             code = line[:3]
-             # Check that the error code is syntactically correct.
-diff -Naur Python-2.7.3-orig/Lib/test/test_smtplib.py Python-2.7.3/Lib/test/test_smtplib.py
---- Python-2.7.3-orig/Lib/test/test_smtplib.py	2012-04-10 01:07:32.000000000 +0200
-+++ Python-2.7.3/Lib/test/test_smtplib.py	2014-02-27 14:15:24.448198293 +0100
-@@ -292,6 +292,33 @@
-                             HOST, self.port, 'localhost', 3)
- 
- 
-+@unittest.skipUnless(threading, 'Threading required for this test.')
-+class TooLongLineTests(unittest.TestCase):
-+    respdata = '250 OK' + ('.' * smtplib._MAXLINE * 2) + '\n'
-+
-+    def setUp(self):
-+        self.old_stdout = sys.stdout
-+        self.output = StringIO.StringIO()
-+        sys.stdout = self.output
-+
-+        self.evt = threading.Event()
-+        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-+        self.sock.settimeout(15)
-+        self.port = test_support.bind_port(self.sock)
-+        servargs = (self.evt, self.respdata, self.sock)
-+        threading.Thread(target=server, args=servargs).start()
-+        self.evt.wait()
-+        self.evt.clear()
-+
-+    def tearDown(self):
-+        self.evt.wait()
-+        sys.stdout = self.old_stdout
-+
-+    def testLineTooLong(self):
-+        self.assertRaises(smtplib.SMTPResponseException, smtplib.SMTP,
-+                          HOST, self.port, 'localhost', 3)
-+
-+
- sim_users = {'Mr.A@somewhere.com':'John A',
-              'Ms.B@somewhere.com':'Sally B',
-              'Mrs.C@somewhereesle.com':'Ruth C',
-@@ -511,7 +538,8 @@
- def test_main(verbose=None):
-     test_support.run_unittest(GeneralTests, DebuggingServerTests,
-                               NonConnectingTests,
--                              BadHELOServerTests, SMTPSimTests)
-+                              BadHELOServerTests, SMTPSimTests,
-+                              TooLongLineTests)
- 
- if __name__ == '__main__':
-     test_main()
diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-1912.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-1912.patch
deleted file mode 100644
index 02cc83d..0000000
--- a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-1912.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Backport
-
-Reference: http://bugs.python.org/issue20246
-
-CVE-2014-1912: Python buffer overflow in socket.recvfrom_into()
-lets remote users execute arbitrary code.Original patch by Benjamin Peterson
-
-Signed-off-by: Maxin B. John <maxin.john@enea.com>
----
-diff -r 40fb60df4755 Modules/socketmodule.c
---- a/Modules/socketmodule.c	Sun Jan 12 12:11:47 2014 +0200
-+++ b/Modules/socketmodule.c	Mon Jan 13 16:36:35 2014 -0800
-@@ -2744,6 +2744,13 @@
-         recvlen = buflen;
-     }
- 
-+    /* Check if the buffer is large enough */
-+    if (buflen < recvlen) {
-+        PyErr_SetString(PyExc_ValueError,
-+                        "buffer too small for requested bytes");
-+        goto error;
-+    }
-+
-     readlen = sock_recvfrom_guts(s, buf.buf, recvlen, flags, &addr);
-     if (readlen < 0) {
-         /* Return an error */
diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch
deleted file mode 100644
index 60ef145..0000000
--- a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 104eb318283dde5203aa6cf7384287bef181e308 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Wed, 12 Nov 2014 01:58:02 -0500
-Subject: [PATCH] python: fix CVE-2014-7185
-
-Reference: http://bugs.python.org/issue21831
-
-CVE-2014-7185: Integer overflow in bufferobject.c in Python before
-2.7.8 allows context-dependent attackers to obtain sensitive
-information from process memory via a large size and offset in a
-"buffer" function.
-
-Upstream-Status: Backport
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- Lib/test/test_buffer.py |    6 ++++++
- Misc/NEWS               |    3 +++
- Objects/bufferobject.c  |    2 +-
- 3 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/test/test_buffer.py b/Lib/test/test_buffer.py
-index 6bdc34d..3ac1f8c 100644
---- a/Lib/test/test_buffer.py
-+++ b/Lib/test/test_buffer.py
-@@ -4,6 +4,7 @@ For now, tests just new or changed functionality.
- 
- """
- 
-+import sys
- import unittest
- from test import test_support
- 
-@@ -21,6 +22,11 @@ class BufferTests(unittest.TestCase):
-                     self.assertEqual(b[start:stop:step],
-                                      s[start:stop:step])
- 
-+    def test_large_buffer_size_and_offset(self):
-+        data = bytearray('hola mundo')
-+        buf = buffer(data, sys.maxsize, sys.maxsize)
-+        self.assertEqual(buf[:4096], "")
-+
- 
- def test_main():
-     with test_support.check_py3k_warnings(("buffer.. not supported",
-diff --git a/Misc/NEWS b/Misc/NEWS
-index e8778ad..77396c5 100644
---- a/Misc/NEWS
-+++ b/Misc/NEWS
-@@ -1896,6 +1896,9 @@ What's New in Python 2.7 Release Candidate 1?
- Core and Builtins
- -----------------
- 
-+- Issue #21831: Avoid integer overflow when large sizes and offsets are given to
-+  the buffer type. CVE-2014-7185.
-+
- - Issue #8271: during the decoding of an invalid UTF-8 byte sequence, only the
-   start byte and the continuation byte(s) are now considered invalid, instead
-   of the number of bytes specified by the start byte.
-diff --git a/Objects/bufferobject.c b/Objects/bufferobject.c
-index c52f0bc..c542506 100644
---- a/Objects/bufferobject.c
-+++ b/Objects/bufferobject.c
-@@ -88,7 +88,7 @@ get_buf(PyBufferObject *self, void **ptr, Py_ssize_t *size,
-             *size = count;
-         else
-             *size = self->b_size;
--        if (offset + *size > count)
-+        if (*size > count - offset)
-             *size = count - offset;
-     }
-     return 1;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/python/python/python-2.7.3-berkeley-db-5.3.patch b/meta/recipes-devtools/python/python/python-2.7.3-berkeley-db-5.3.patch
deleted file mode 100644
index 3df3336..0000000
--- a/meta/recipes-devtools/python/python/python-2.7.3-berkeley-db-5.3.patch
+++ /dev/null
@@ -1,1572 +0,0 @@
-Upstream-Status: Inappropriate [not author]
-
-Fix to support db 5.3 for bsddb module in python 2.7.2
-
-This patch is made from the db5.1.diff in
-http://archive.ubuntu.com/ubuntu/pool/main/p/python2.7/python2.7_2.7.3-0ubuntu3.diff.gz
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- Lib/bsddb/__init__.py        |    2 +-
- Lib/bsddb/test/test_all.py   |    5 +-
- Lib/bsddb/test/test_dbenv.py |   29 +++-
- Modules/_bsddb.c             |  439 +++++++++++++++++++++++-------------------
- Modules/bsddb.h              |   20 +-
- setup.py                     |   25 +++-
- 6 files changed, 307 insertions(+), 213 deletions(-)
-
-diff --git a/Lib/bsddb/__init__.py b/Lib/bsddb/__init__.py
-index ed4deea..1b1c388 100644
---- a/Lib/bsddb/__init__.py
-+++ b/Lib/bsddb/__init__.py
-@@ -33,7 +33,7 @@
- #----------------------------------------------------------------------
- 
- 
--"""Support for Berkeley DB 4.1 through 4.8 with a simple interface.
-+"""Support for Berkeley DB 4.2 through 5.3 with a simple interface.
- 
- For the full featured object oriented interface use the bsddb.db module
- instead.  It mirrors the Oracle Berkeley DB C API.
-diff --git a/Lib/bsddb/test/test_all.py b/Lib/bsddb/test/test_all.py
-index e9fe618..6a25f4a 100644
---- a/Lib/bsddb/test/test_all.py
-+++ b/Lib/bsddb/test/test_all.py
-@@ -484,6 +484,8 @@ def print_versions():
-     print '-=' * 38
-     print db.DB_VERSION_STRING
-     print 'bsddb.db.version():   %s' % (db.version(), )
-+    if db.version() >= (5, 0) :
-+        print 'bsddb.db.full_version(): %s' %repr(db.full_version())
-     print 'bsddb.db.__version__: %s' % db.__version__
-     print 'bsddb.db.cvsid:       %s' % db.cvsid
- 
-@@ -528,7 +530,8 @@ def get_new_database_path() :
- 
- # This path can be overriden via "set_test_path_prefix()".
- import os, os.path
--get_new_path.prefix=os.path.join(os.sep,"tmp","z-Berkeley_DB")
-+get_new_path.prefix=os.path.join(os.environ.get("TMPDIR",
-+    os.path.join(os.sep,"tmp")), "z-Berkeley_DB")
- get_new_path.num=0
- 
- def get_test_path_prefix() :
-diff --git a/Lib/bsddb/test/test_dbenv.py b/Lib/bsddb/test/test_dbenv.py
-index 37281df..6ac1e54 100644
---- a/Lib/bsddb/test/test_dbenv.py
-+++ b/Lib/bsddb/test/test_dbenv.py
-@@ -25,12 +25,31 @@ class DBEnv(unittest.TestCase):
-         test_support.rmtree(self.homeDir)
- 
- class DBEnv_general(DBEnv) :
-+    def test_get_open_flags(self) :
-+        flags = db.DB_CREATE | db.DB_INIT_MPOOL
-+        self.env.open(self.homeDir, flags)
-+        self.assertEqual(flags, self.env.get_open_flags())
-+
-+    def test_get_open_flags2(self) :
-+        flags = db.DB_CREATE | db.DB_INIT_MPOOL | \
-+                db.DB_INIT_LOCK | db.DB_THREAD
-+        self.env.open(self.homeDir, flags)
-+        self.assertEqual(flags, self.env.get_open_flags())
-+
-     if db.version() >= (4, 7) :
-         def test_lk_partitions(self) :
-             for i in [10, 20, 40] :
-                 self.env.set_lk_partitions(i)
-                 self.assertEqual(i, self.env.get_lk_partitions())
- 
-+        def test_getset_intermediate_dir_mode(self) :
-+            self.assertEqual(None, self.env.get_intermediate_dir_mode())
-+            for mode in ["rwx------", "rw-rw-rw-", "rw-r--r--"] :
-+                self.env.set_intermediate_dir_mode(mode)
-+                self.assertEqual(mode, self.env.get_intermediate_dir_mode())
-+            self.assertRaises(db.DBInvalidArgError,
-+                    self.env.set_intermediate_dir_mode, "abcde")
-+
-     if db.version() >= (4, 6) :
-         def test_thread(self) :
-             for i in [16, 100, 1000] :
-@@ -115,7 +134,7 @@ class DBEnv_general(DBEnv) :
-                 self.assertEqual(i, self.env.get_lk_max_lockers())
- 
-         def test_lg_regionmax(self) :
--            for i in [128, 256, 1024] :
-+            for i in [128, 256, 1000] :
-                 i = i*1024*1024
-                 self.env.set_lg_regionmax(i)
-                 j = self.env.get_lg_regionmax()
-@@ -172,8 +191,12 @@ class DBEnv_general(DBEnv) :
-             self.env.open(self.homeDir, db.DB_CREATE | db.DB_INIT_MPOOL)
-             cachesize = (0, 2*1024*1024, 1)
-             self.assertRaises(db.DBInvalidArgError,
--                self.env.set_cachesize, *cachesize)
--            self.assertEqual(cachesize2, self.env.get_cachesize())
-+                              self.env.set_cachesize, *cachesize)
-+            cachesize3 = self.env.get_cachesize()
-+            self.assertEqual(cachesize2[0], cachesize3[0])
-+            self.assertEqual(cachesize2[2], cachesize3[2])
-+            # In Berkeley DB 5.3, the cachesize can change when opening the Env
-+            self.assertTrue(cachesize2[1] <= cachesize3[1])
- 
-         def test_set_cachesize_dbenv_db(self) :
-             # You can not configure the cachesize using
-diff --git a/Modules/_bsddb.c b/Modules/_bsddb.c
-index d2d12ff..e98e4bc 100644
---- a/Modules/_bsddb.c
-+++ b/Modules/_bsddb.c
-@@ -187,8 +187,10 @@ static PyObject* DBOldVersionError;     /* DB_OLD_VERSION */
- static PyObject* DBRunRecoveryError;    /* DB_RUNRECOVERY */
- static PyObject* DBVerifyBadError;      /* DB_VERIFY_BAD */
- static PyObject* DBNoServerError;       /* DB_NOSERVER */
-+#if (DBVER < 52)
- static PyObject* DBNoServerHomeError;   /* DB_NOSERVER_HOME */
- static PyObject* DBNoServerIDError;     /* DB_NOSERVER_ID */
-+#endif
- static PyObject* DBPageNotFoundError;   /* DB_PAGE_NOTFOUND */
- static PyObject* DBSecondaryBadError;   /* DB_SECONDARY_BAD */
- 
-@@ -202,9 +204,7 @@ static PyObject* DBFileExistsError;     /* EEXIST */
- static PyObject* DBNoSuchFileError;     /* ENOENT */
- static PyObject* DBPermissionsError;    /* EPERM  */
- 
--#if (DBVER >= 42)
- static PyObject* DBRepHandleDeadError;  /* DB_REP_HANDLE_DEAD */
--#endif
- #if (DBVER >= 44)
- static PyObject* DBRepLockoutError;     /* DB_REP_LOCKOUT */
- #endif
-@@ -696,8 +696,10 @@ static int makeDBError(int err)
-         case DB_RUNRECOVERY:        errObj = DBRunRecoveryError;    break;
-         case DB_VERIFY_BAD:         errObj = DBVerifyBadError;      break;
-         case DB_NOSERVER:           errObj = DBNoServerError;       break;
-+#if (DBVER < 52)
-         case DB_NOSERVER_HOME:      errObj = DBNoServerHomeError;   break;
-         case DB_NOSERVER_ID:        errObj = DBNoServerIDError;     break;
-+#endif
-         case DB_PAGE_NOTFOUND:      errObj = DBPageNotFoundError;   break;
-         case DB_SECONDARY_BAD:      errObj = DBSecondaryBadError;   break;
-         case DB_BUFFER_SMALL:       errObj = DBNoMemoryError;       break;
-@@ -715,9 +717,7 @@ static int makeDBError(int err)
-         case ENOENT:  errObj = DBNoSuchFileError;   break;
-         case EPERM :  errObj = DBPermissionsError;  break;
- 
--#if (DBVER >= 42)
-         case DB_REP_HANDLE_DEAD : errObj = DBRepHandleDeadError; break;
--#endif
- #if (DBVER >= 44)
-         case DB_REP_LOCKOUT : errObj = DBRepLockoutError; break;
- #endif
-@@ -2132,7 +2132,7 @@ DB_get_size(DBObject* self, PyObject* args, PyObject* kwargs)
-     MYDB_BEGIN_ALLOW_THREADS;
-     err = self->db->get(self->db, txn, &key, &data, flags);
-     MYDB_END_ALLOW_THREADS;
--    if (err == DB_BUFFER_SMALL) {
-+    if ((err == DB_BUFFER_SMALL) || (err == 0)) {
-         retval = NUMBER_FromLong((long)data.size);
-         err = 0;
-     }
-@@ -2385,9 +2385,7 @@ DB_open(DBObject* self, PyObject* args, PyObject* kwargs)
-         return NULL;
-     }
- 
--#if (DBVER >= 42)
-     self->db->get_flags(self->db, &self->setflags);
--#endif
- 
-     self->flags = flags;
- 
-@@ -2539,6 +2537,37 @@ DB_get_priority(DBObject* self)
- #endif
- 
- static PyObject*
-+DB_get_dbname(DBObject* self)
-+{
-+    int err;
-+    const char *filename, *dbname;
-+
-+    CHECK_DB_NOT_CLOSED(self);
-+
-+    MYDB_BEGIN_ALLOW_THREADS;
-+    err = self->db->get_dbname(self->db, &filename, &dbname);
-+    MYDB_END_ALLOW_THREADS;
-+    RETURN_IF_ERR();
-+    /* If "dbname==NULL", it is correctly converted to "None" */
-+    return Py_BuildValue("(ss)", filename, dbname);
-+}
-+
-+static PyObject*
-+DB_get_open_flags(DBObject* self)
-+{
-+    int err;
-+    unsigned int flags;
-+
-+    CHECK_DB_NOT_CLOSED(self);
-+
-+    MYDB_BEGIN_ALLOW_THREADS;
-+    err = self->db->get_open_flags(self->db, &flags);
-+    MYDB_END_ALLOW_THREADS;
-+    RETURN_IF_ERR();
-+    return NUMBER_FromLong(flags);
-+}
-+
-+static PyObject*
- DB_set_q_extentsize(DBObject* self, PyObject* args)
- {
-     int err;
-@@ -2555,7 +2584,6 @@ DB_set_q_extentsize(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_q_extentsize(DBObject* self)
- {
-@@ -2570,7 +2598,6 @@ DB_get_q_extentsize(DBObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(extentsize);
- }
--#endif
- 
- static PyObject*
- DB_set_bt_minkey(DBObject* self, PyObject* args)
-@@ -2588,7 +2615,6 @@ DB_set_bt_minkey(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_bt_minkey(DBObject* self)
- {
-@@ -2603,7 +2629,6 @@ DB_get_bt_minkey(DBObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(bt_minkey);
- }
--#endif
- 
- static int
- _default_cmp(const DBT *leftKey,
-@@ -2759,7 +2784,6 @@ DB_set_cachesize(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_cachesize(DBObject* self)
- {
-@@ -2777,7 +2801,6 @@ DB_get_cachesize(DBObject* self)
- 
-     return Py_BuildValue("(iii)", gbytes, bytes, ncache);
- }
--#endif
- 
- static PyObject*
- DB_set_flags(DBObject* self, PyObject* args)
-@@ -2797,7 +2820,6 @@ DB_set_flags(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_flags(DBObject* self)
- {
-@@ -2812,6 +2834,35 @@ DB_get_flags(DBObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(flags);
- }
-+
-+#if (DBVER >= 43)
-+static PyObject*
-+DB_get_transactional(DBObject* self)
-+{
-+    int err;
-+
-+    CHECK_DB_NOT_CLOSED(self);
-+
-+    MYDB_BEGIN_ALLOW_THREADS;
-+    err = self->db->get_transactional(self->db);
-+    MYDB_END_ALLOW_THREADS;
-+
-+    if(err == 0) {
-+        Py_INCREF(Py_False);
-+        return Py_False;
-+    } else if(err == 1) {
-+        Py_INCREF(Py_True);
-+        return Py_True;
-+    }
-+
-+    /*
-+    ** If we reach there, there was an error. The
-+    ** "return" should be unreachable.
-+    */
-+    RETURN_IF_ERR();
-+    assert(0);  /* This coude SHOULD be unreachable */
-+    return NULL;
-+}
- #endif
- 
- static PyObject*
-@@ -2830,7 +2881,6 @@ DB_set_h_ffactor(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_h_ffactor(DBObject* self)
- {
-@@ -2845,7 +2895,6 @@ DB_get_h_ffactor(DBObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(ffactor);
- }
--#endif
- 
- static PyObject*
- DB_set_h_nelem(DBObject* self, PyObject* args)
-@@ -2863,7 +2912,6 @@ DB_set_h_nelem(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_h_nelem(DBObject* self)
- {
-@@ -2878,7 +2926,6 @@ DB_get_h_nelem(DBObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(nelem);
- }
--#endif
- 
- static PyObject*
- DB_set_lorder(DBObject* self, PyObject* args)
-@@ -2896,7 +2943,6 @@ DB_set_lorder(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_lorder(DBObject* self)
- {
-@@ -2911,7 +2957,6 @@ DB_get_lorder(DBObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(lorder);
- }
--#endif
- 
- static PyObject*
- DB_set_pagesize(DBObject* self, PyObject* args)
-@@ -2929,7 +2974,6 @@ DB_set_pagesize(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_pagesize(DBObject* self)
- {
-@@ -2944,7 +2988,6 @@ DB_get_pagesize(DBObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(pagesize);
- }
--#endif
- 
- static PyObject*
- DB_set_re_delim(DBObject* self, PyObject* args)
-@@ -2967,7 +3010,6 @@ DB_set_re_delim(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_re_delim(DBObject* self)
- {
-@@ -2981,7 +3023,6 @@ DB_get_re_delim(DBObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(re_delim);
- }
--#endif
- 
- static PyObject*
- DB_set_re_len(DBObject* self, PyObject* args)
-@@ -2999,7 +3040,6 @@ DB_set_re_len(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_re_len(DBObject* self)
- {
-@@ -3014,7 +3054,6 @@ DB_get_re_len(DBObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(re_len);
- }
--#endif
- 
- static PyObject*
- DB_set_re_pad(DBObject* self, PyObject* args)
-@@ -3036,7 +3075,6 @@ DB_set_re_pad(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_re_pad(DBObject* self)
- {
-@@ -3050,7 +3088,6 @@ DB_get_re_pad(DBObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(re_pad);
- }
--#endif
- 
- static PyObject*
- DB_set_re_source(DBObject* self, PyObject* args)
-@@ -3069,7 +3106,6 @@ DB_set_re_source(DBObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_re_source(DBObject* self)
- {
-@@ -3084,7 +3120,6 @@ DB_get_re_source(DBObject* self)
-     RETURN_IF_ERR();
-     return PyBytes_FromString(source);
- }
--#endif
- 
- static PyObject*
- DB_stat(DBObject* self, PyObject* args, PyObject* kwargs)
-@@ -3381,7 +3416,6 @@ DB_set_encrypt(DBObject* self, PyObject* args, PyObject* kwargs)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DB_get_encrypt_flags(DBObject* self)
- {
-@@ -3396,7 +3430,6 @@ DB_get_encrypt_flags(DBObject* self)
- 
-     return NUMBER_FromLong(flags);
- }
--#endif
- 
- 
- 
-@@ -4987,7 +5020,6 @@ DBEnv_set_encrypt(DBEnvObject* self, PyObject* args, PyObject* kwargs)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_encrypt_flags(DBEnvObject* self)
- {
-@@ -5025,7 +5057,6 @@ DBEnv_get_timeout(DBEnvObject* self, PyObject* args, PyObject* kwargs)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(timeout);
- }
--#endif
- 
- 
- static PyObject*
-@@ -5064,7 +5095,6 @@ DBEnv_set_shm_key(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_shm_key(DBEnvObject* self)
- {
-@@ -5081,7 +5111,6 @@ DBEnv_get_shm_key(DBEnvObject* self)
- 
-     return NUMBER_FromLong(shm_key);
- }
--#endif
- 
- #if (DBVER >= 46)
- static PyObject*
-@@ -5170,7 +5199,6 @@ DBEnv_set_cachesize(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_cachesize(DBEnvObject* self)
- {
-@@ -5188,7 +5216,6 @@ DBEnv_get_cachesize(DBEnvObject* self)
- 
-     return Py_BuildValue("(iii)", gbytes, bytes, ncache);
- }
--#endif
- 
- 
- static PyObject*
-@@ -5208,7 +5235,6 @@ DBEnv_set_flags(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_flags(DBEnvObject* self)
- {
-@@ -5223,7 +5249,6 @@ DBEnv_get_flags(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(flags);
- }
--#endif
- 
- #if (DBVER >= 47)
- static PyObject*
-@@ -5423,7 +5448,6 @@ DBEnv_set_data_dir(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_data_dirs(DBEnvObject* self)
- {
-@@ -5463,7 +5487,6 @@ DBEnv_get_data_dirs(DBEnvObject* self)
-     }
-     return tuple;
- }
--#endif
- 
- #if (DBVER >= 44)
- static PyObject*
-@@ -5513,7 +5536,6 @@ DBEnv_set_lg_bsize(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_lg_bsize(DBEnvObject* self)
- {
-@@ -5528,7 +5550,6 @@ DBEnv_get_lg_bsize(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(lg_bsize);
- }
--#endif
- 
- static PyObject*
- DBEnv_set_lg_dir(DBEnvObject* self, PyObject* args)
-@@ -5547,7 +5568,6 @@ DBEnv_set_lg_dir(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_lg_dir(DBEnvObject* self)
- {
-@@ -5562,7 +5582,6 @@ DBEnv_get_lg_dir(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return PyBytes_FromString(dirp);
- }
--#endif
- 
- static PyObject*
- DBEnv_set_lg_max(DBEnvObject* self, PyObject* args)
-@@ -5580,7 +5599,6 @@ DBEnv_set_lg_max(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_lg_max(DBEnvObject* self)
- {
-@@ -5595,8 +5613,6 @@ DBEnv_get_lg_max(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(lg_max);
- }
--#endif
--
- 
- static PyObject*
- DBEnv_set_lg_regionmax(DBEnvObject* self, PyObject* args)
-@@ -5614,7 +5630,6 @@ DBEnv_set_lg_regionmax(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_lg_regionmax(DBEnvObject* self)
- {
-@@ -5629,7 +5644,6 @@ DBEnv_get_lg_regionmax(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(lg_regionmax);
- }
--#endif
- 
- #if (DBVER >= 47)
- static PyObject*
-@@ -5680,7 +5694,6 @@ DBEnv_set_lk_detect(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_lk_detect(DBEnvObject* self)
- {
-@@ -5695,8 +5708,6 @@ DBEnv_get_lk_detect(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(lk_detect);
- }
--#endif
--
- 
- #if (DBVER < 45)
- static PyObject*
-@@ -5734,7 +5745,6 @@ DBEnv_set_lk_max_locks(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_lk_max_locks(DBEnvObject* self)
- {
-@@ -5749,7 +5759,6 @@ DBEnv_get_lk_max_locks(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(lk_max);
- }
--#endif
- 
- static PyObject*
- DBEnv_set_lk_max_lockers(DBEnvObject* self, PyObject* args)
-@@ -5767,7 +5776,6 @@ DBEnv_set_lk_max_lockers(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_lk_max_lockers(DBEnvObject* self)
- {
-@@ -5782,7 +5790,6 @@ DBEnv_get_lk_max_lockers(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(lk_max);
- }
--#endif
- 
- static PyObject*
- DBEnv_set_lk_max_objects(DBEnvObject* self, PyObject* args)
-@@ -5800,7 +5807,6 @@ DBEnv_set_lk_max_objects(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_lk_max_objects(DBEnvObject* self)
- {
-@@ -5815,9 +5821,7 @@ DBEnv_get_lk_max_objects(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(lk_max);
- }
--#endif
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_mp_mmapsize(DBEnvObject* self)
- {
-@@ -5832,8 +5836,6 @@ DBEnv_get_mp_mmapsize(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(mmapsize);
- }
--#endif
--
- 
- static PyObject*
- DBEnv_set_mp_mmapsize(DBEnvObject* self, PyObject* args)
-@@ -5869,8 +5871,6 @@ DBEnv_set_tmp_dir(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_tmp_dir(DBEnvObject* self)
- {
-@@ -5887,8 +5887,6 @@ DBEnv_get_tmp_dir(DBEnvObject* self)
- 
-     return PyBytes_FromString(dirpp);
- }
--#endif
--
- 
- static PyObject*
- DBEnv_txn_recover(DBEnvObject* self)
-@@ -5899,7 +5897,7 @@ DBEnv_txn_recover(DBEnvObject* self)
-     DBTxnObject *txn;
- #define PREPLIST_LEN 16
-     DB_PREPLIST preplist[PREPLIST_LEN];
--#if (DBVER < 48)
-+#if (DBVER < 48 || DBVER > 51)
-     long retp;
- #else
-     u_int32_t retp;
-@@ -6003,8 +6001,6 @@ DBEnv_txn_checkpoint(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_tx_max(DBEnvObject* self)
- {
-@@ -6019,8 +6015,6 @@ DBEnv_get_tx_max(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return PyLong_FromUnsignedLong(max);
- }
--#endif
--
- 
- static PyObject*
- DBEnv_set_tx_max(DBEnvObject* self, PyObject* args)
-@@ -6038,8 +6032,6 @@ DBEnv_set_tx_max(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_tx_timestamp(DBEnvObject* self)
- {
-@@ -6054,7 +6046,6 @@ DBEnv_get_tx_timestamp(DBEnvObject* self)
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(timestamp);
- }
--#endif
- 
- static PyObject*
- DBEnv_set_tx_timestamp(DBEnvObject* self, PyObject* args)
-@@ -6756,6 +6747,55 @@ DBEnv_set_private(DBEnvObject* self, PyObject* private_obj)
-     RETURN_NONE();
- }
- 
-+#if (DBVER >= 47)
-+static PyObject*
-+DBEnv_set_intermediate_dir_mode(DBEnvObject* self, PyObject* args)
-+{
-+    int err;
-+    const char *mode;
-+
-+    if (!PyArg_ParseTuple(args,"s:set_intermediate_dir_mode", &mode))
-+        return NULL;
-+
-+    CHECK_ENV_NOT_CLOSED(self);
-+
-+    MYDB_BEGIN_ALLOW_THREADS;
-+    err = self->db_env->set_intermediate_dir_mode(self->db_env, mode);
-+    MYDB_END_ALLOW_THREADS;
-+    RETURN_IF_ERR();
-+    RETURN_NONE();
-+}
-+
-+static PyObject*
-+DBEnv_get_intermediate_dir_mode(DBEnvObject* self)
-+{
-+    int err;
-+    const char *mode;
-+
-+    CHECK_ENV_NOT_CLOSED(self);
-+
-+    MYDB_BEGIN_ALLOW_THREADS;
-+    err = self->db_env->get_intermediate_dir_mode(self->db_env, &mode);
-+    MYDB_END_ALLOW_THREADS;
-+    RETURN_IF_ERR();
-+    return Py_BuildValue("s", mode);
-+}
-+#endif
-+
-+static PyObject*
-+DBEnv_get_open_flags(DBEnvObject* self)
-+{
-+    int err;
-+    unsigned int flags;
-+
-+    CHECK_ENV_NOT_CLOSED(self);
-+
-+    MYDB_BEGIN_ALLOW_THREADS;
-+    err = self->db_env->get_open_flags(self->db_env, &flags);
-+    MYDB_END_ALLOW_THREADS;
-+    RETURN_IF_ERR();
-+    return NUMBER_FromLong(flags);
-+}
- 
- #if (DBVER < 48)
- static PyObject*
-@@ -6875,7 +6915,6 @@ DBEnv_set_verbose(DBEnvObject* self, PyObject* args)
-     RETURN_NONE();
- }
- 
--#if (DBVER >= 42)
- static PyObject*
- DBEnv_get_verbose(DBEnvObject* self, PyObject* args)
- {
-@@ -6893,7 +6932,6 @@ DBEnv_get_verbose(DBEnvObject* self, PyObject* args)
-     RETURN_IF_ERR();
-     return PyBool_FromLong(verbose);
- }
--#endif
- 
- #if (DBVER >= 45)
- static void
-@@ -6975,9 +7013,7 @@ DBEnv_rep_process_message(DBEnvObject* self, PyObject* args)
-     PyObject *control_py, *rec_py;
-     DBT control, rec;
-     int envid;
--#if (DBVER >= 42)
-     DB_LSN lsn;
--#endif
- 
-     if (!PyArg_ParseTuple(args, "OOi:rep_process_message", &control_py,
-                 &rec_py, &envid))
-@@ -6994,13 +7030,8 @@ DBEnv_rep_process_message(DBEnvObject* self, PyObject* args)
-     err = self->db_env->rep_process_message(self->db_env, &control, &rec,
-             envid, &lsn);
- #else
--#if (DBVER >= 42)
-     err = self->db_env->rep_process_message(self->db_env, &control, &rec,
-             &envid, &lsn);
--#else
--    err = self->db_env->rep_process_message(self->db_env, &control, &rec,
--            &envid);
--#endif
- #endif
-     MYDB_END_ALLOW_THREADS;
-     switch (err) {
-@@ -7029,12 +7060,10 @@ DBEnv_rep_process_message(DBEnvObject* self, PyObject* args)
-                 return r;
-                 break;
-             }
--#if (DBVER >= 42)
-         case DB_REP_NOTPERM :
-         case DB_REP_ISPERM :
-             return Py_BuildValue("(i(ll))", err, lsn.file, lsn.offset);
-             break;
--#endif
-     }
-     RETURN_IF_ERR();
-     return Py_BuildValue("(OO)", Py_None, Py_None);
-@@ -7086,20 +7115,6 @@ _DBEnv_rep_transportCallback(DB_ENV* db_env, const DBT* control, const DBT* rec,
-     return ret;
- }
- 
--#if (DBVER <= 41)
--static int
--_DBEnv_rep_transportCallbackOLD(DB_ENV* db_env, const DBT* control, const DBT* rec,
--        int envid, u_int32_t flags)
--{
--    DB_LSN lsn;
--
--    lsn.file = -1;  /* Dummy values */
--    lsn.offset = -1;
--    return _DBEnv_rep_transportCallback(db_env, control, rec, &lsn, envid,
--            flags);
--}
--#endif
--
- static PyObject*
- DBEnv_rep_set_transport(DBEnvObject* self, PyObject* args)
- {
-@@ -7120,13 +7135,8 @@ DBEnv_rep_set_transport(DBEnvObject* self, PyObject* args)
-     err = self->db_env->rep_set_transport(self->db_env, envid,
-             &_DBEnv_rep_transportCallback);
- #else
--#if (DBVER >= 42)
-     err = self->db_env->set_rep_transport(self->db_env, envid,
-             &_DBEnv_rep_transportCallback);
--#else
--    err = self->db_env->set_rep_transport(self->db_env, envid,
--            &_DBEnv_rep_transportCallbackOLD);
--#endif
- #endif
-     MYDB_END_ALLOW_THREADS;
-     RETURN_IF_ERR();
-@@ -7608,6 +7618,7 @@ DBEnv_repmgr_start(DBEnvObject* self, PyObject* args, PyObject*
-     RETURN_NONE();
- }
- 
-+#if (DBVER < 52)
- static PyObject*
- DBEnv_repmgr_set_local_site(DBEnvObject* self, PyObject* args, PyObject*
-         kwargs)
-@@ -7654,6 +7665,7 @@ DBEnv_repmgr_add_remote_site(DBEnvObject* self, PyObject* args, PyObject*
-     RETURN_IF_ERR();
-     return NUMBER_FromLong(eidp);
- }
-+#endif
- 
- static PyObject*
- DBEnv_repmgr_set_ack_policy(DBEnvObject* self, PyObject* args)
-@@ -8482,65 +8494,43 @@ static PyMethodDef DB_methods[] = {
-     {"remove",          (PyCFunction)DB_remove,         METH_VARARGS|METH_KEYWORDS},
-     {"rename",          (PyCFunction)DB_rename,         METH_VARARGS},
-     {"set_bt_minkey",   (PyCFunction)DB_set_bt_minkey,  METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_bt_minkey",   (PyCFunction)DB_get_bt_minkey,  METH_NOARGS},
--#endif
-     {"set_bt_compare",  (PyCFunction)DB_set_bt_compare, METH_O},
-     {"set_cachesize",   (PyCFunction)DB_set_cachesize,  METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_cachesize",   (PyCFunction)DB_get_cachesize,  METH_NOARGS},
--#endif
-     {"set_encrypt",     (PyCFunction)DB_set_encrypt,    METH_VARARGS|METH_KEYWORDS},
--#if (DBVER >= 42)
-     {"get_encrypt_flags", (PyCFunction)DB_get_encrypt_flags, METH_NOARGS},
--#endif
--
-     {"set_flags",       (PyCFunction)DB_set_flags,      METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_flags",       (PyCFunction)DB_get_flags,      METH_NOARGS},
-+#if (DBVER >= 43)
-+    {"get_transactional", (PyCFunction)DB_get_transactional, METH_NOARGS},
- #endif
-     {"set_h_ffactor",   (PyCFunction)DB_set_h_ffactor,  METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_h_ffactor",   (PyCFunction)DB_get_h_ffactor,  METH_NOARGS},
--#endif
-     {"set_h_nelem",     (PyCFunction)DB_set_h_nelem,    METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_h_nelem",     (PyCFunction)DB_get_h_nelem,    METH_NOARGS},
--#endif
-     {"set_lorder",      (PyCFunction)DB_set_lorder,     METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_lorder",      (PyCFunction)DB_get_lorder,     METH_NOARGS},
--#endif
-     {"set_pagesize",    (PyCFunction)DB_set_pagesize,   METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_pagesize",    (PyCFunction)DB_get_pagesize,   METH_NOARGS},
--#endif
-     {"set_re_delim",    (PyCFunction)DB_set_re_delim,   METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_re_delim",    (PyCFunction)DB_get_re_delim,   METH_NOARGS},
--#endif
-     {"set_re_len",      (PyCFunction)DB_set_re_len,     METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_re_len",      (PyCFunction)DB_get_re_len,     METH_NOARGS},
--#endif
-     {"set_re_pad",      (PyCFunction)DB_set_re_pad,     METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_re_pad",      (PyCFunction)DB_get_re_pad,     METH_NOARGS},
--#endif
-     {"set_re_source",   (PyCFunction)DB_set_re_source,  METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_re_source",   (PyCFunction)DB_get_re_source,  METH_NOARGS},
--#endif
-     {"set_q_extentsize",(PyCFunction)DB_set_q_extentsize, METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_q_extentsize",(PyCFunction)DB_get_q_extentsize, METH_NOARGS},
--#endif
-     {"set_private",     (PyCFunction)DB_set_private,    METH_O},
-     {"get_private",     (PyCFunction)DB_get_private,    METH_NOARGS},
- #if (DBVER >= 46)
-     {"set_priority",    (PyCFunction)DB_set_priority,   METH_VARARGS},
-     {"get_priority",    (PyCFunction)DB_get_priority,   METH_NOARGS},
- #endif
-+    {"get_dbname",      (PyCFunction)DB_get_dbname,     METH_NOARGS},
-+    {"get_open_flags",  (PyCFunction)DB_get_open_flags, METH_NOARGS},
-     {"stat",            (PyCFunction)DB_stat,           METH_VARARGS|METH_KEYWORDS},
- #if (DBVER >= 43)
-     {"stat_print",      (PyCFunction)DB_stat_print,
-@@ -8639,24 +8629,18 @@ static PyMethodDef DBEnv_methods[] = {
-     {"get_thread_count", (PyCFunction)DBEnv_get_thread_count, METH_NOARGS},
- #endif
-     {"set_encrypt",     (PyCFunction)DBEnv_set_encrypt,      METH_VARARGS|METH_KEYWORDS},
--#if (DBVER >= 42)
-     {"get_encrypt_flags", (PyCFunction)DBEnv_get_encrypt_flags, METH_NOARGS},
-     {"get_timeout",     (PyCFunction)DBEnv_get_timeout,
-         METH_VARARGS|METH_KEYWORDS},
--#endif
-     {"set_timeout",     (PyCFunction)DBEnv_set_timeout,     METH_VARARGS|METH_KEYWORDS},
-     {"set_shm_key",     (PyCFunction)DBEnv_set_shm_key,     METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_shm_key",     (PyCFunction)DBEnv_get_shm_key,     METH_NOARGS},
--#endif
- #if (DBVER >= 46)
-     {"set_cache_max",   (PyCFunction)DBEnv_set_cache_max,   METH_VARARGS},
-     {"get_cache_max",   (PyCFunction)DBEnv_get_cache_max,   METH_NOARGS},
- #endif
-     {"set_cachesize",   (PyCFunction)DBEnv_set_cachesize,   METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_cachesize",   (PyCFunction)DBEnv_get_cachesize,   METH_NOARGS},
--#endif
-     {"memp_trickle",    (PyCFunction)DBEnv_memp_trickle,    METH_VARARGS},
-     {"memp_sync",       (PyCFunction)DBEnv_memp_sync,       METH_VARARGS},
-     {"memp_stat",       (PyCFunction)DBEnv_memp_stat,
-@@ -8685,33 +8669,21 @@ static PyMethodDef DBEnv_methods[] = {
- #endif
- #endif
-     {"set_data_dir",    (PyCFunction)DBEnv_set_data_dir,    METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_data_dirs",   (PyCFunction)DBEnv_get_data_dirs,   METH_NOARGS},
--#endif
--#if (DBVER >= 42)
-     {"get_flags",       (PyCFunction)DBEnv_get_flags,       METH_NOARGS},
--#endif
-     {"set_flags",       (PyCFunction)DBEnv_set_flags,       METH_VARARGS},
- #if (DBVER >= 47)
-     {"log_set_config",  (PyCFunction)DBEnv_log_set_config,  METH_VARARGS},
-     {"log_get_config",  (PyCFunction)DBEnv_log_get_config,  METH_VARARGS},
- #endif
-     {"set_lg_bsize",    (PyCFunction)DBEnv_set_lg_bsize,    METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_lg_bsize",    (PyCFunction)DBEnv_get_lg_bsize,    METH_NOARGS},
--#endif
-     {"set_lg_dir",      (PyCFunction)DBEnv_set_lg_dir,      METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_lg_dir",      (PyCFunction)DBEnv_get_lg_dir,      METH_NOARGS},
--#endif
-     {"set_lg_max",      (PyCFunction)DBEnv_set_lg_max,      METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_lg_max",      (PyCFunction)DBEnv_get_lg_max,      METH_NOARGS},
--#endif
-     {"set_lg_regionmax",(PyCFunction)DBEnv_set_lg_regionmax, METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_lg_regionmax",(PyCFunction)DBEnv_get_lg_regionmax, METH_NOARGS},
--#endif
- #if (DBVER >= 44)
-     {"set_lg_filemode", (PyCFunction)DBEnv_set_lg_filemode, METH_VARARGS},
-     {"get_lg_filemode", (PyCFunction)DBEnv_get_lg_filemode, METH_NOARGS},
-@@ -8721,36 +8693,24 @@ static PyMethodDef DBEnv_methods[] = {
-     {"get_lk_partitions", (PyCFunction)DBEnv_get_lk_partitions, METH_NOARGS},
- #endif
-     {"set_lk_detect",   (PyCFunction)DBEnv_set_lk_detect,   METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_lk_detect",   (PyCFunction)DBEnv_get_lk_detect,   METH_NOARGS},
--#endif
- #if (DBVER < 45)
-     {"set_lk_max",      (PyCFunction)DBEnv_set_lk_max,      METH_VARARGS},
- #endif
-     {"set_lk_max_locks", (PyCFunction)DBEnv_set_lk_max_locks, METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_lk_max_locks", (PyCFunction)DBEnv_get_lk_max_locks, METH_NOARGS},
--#endif
-     {"set_lk_max_lockers", (PyCFunction)DBEnv_set_lk_max_lockers, METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_lk_max_lockers", (PyCFunction)DBEnv_get_lk_max_lockers, METH_NOARGS},
--#endif
-     {"set_lk_max_objects", (PyCFunction)DBEnv_set_lk_max_objects, METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_lk_max_objects", (PyCFunction)DBEnv_get_lk_max_objects, METH_NOARGS},
--#endif
- #if (DBVER >= 43)
-     {"stat_print",          (PyCFunction)DBEnv_stat_print,
-         METH_VARARGS|METH_KEYWORDS},
- #endif
-     {"set_mp_mmapsize", (PyCFunction)DBEnv_set_mp_mmapsize, METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_mp_mmapsize", (PyCFunction)DBEnv_get_mp_mmapsize, METH_NOARGS},
--#endif
-     {"set_tmp_dir",     (PyCFunction)DBEnv_set_tmp_dir,     METH_VARARGS},
--#if (DBVER >= 42)
-     {"get_tmp_dir",     (PyCFunction)DBEnv_get_tmp_dir,     METH_NOARGS},
--#endif
-     {"txn_begin",       (PyCFunction)DBEnv_txn_begin,       METH_VARARGS|METH_KEYWORDS},
-     {"txn_checkpoint",  (PyCFunction)DBEnv_txn_checkpoint,  METH_VARARGS},
-     {"txn_stat",        (PyCFunction)DBEnv_txn_stat,        METH_VARARGS},
-@@ -8758,10 +8718,8 @@ static PyMethodDef DBEnv_methods[] = {
-     {"txn_stat_print",  (PyCFunction)DBEnv_txn_stat_print,
-         METH_VARARGS|METH_KEYWORDS},
- #endif
--#if (DBVER >= 42)
-     {"get_tx_max",      (PyCFunction)DBEnv_get_tx_max,      METH_NOARGS},
-     {"get_tx_timestamp", (PyCFunction)DBEnv_get_tx_timestamp, METH_NOARGS},
--#endif
-     {"set_tx_max",      (PyCFunction)DBEnv_set_tx_max,      METH_VARARGS},
-     {"set_tx_timestamp", (PyCFunction)DBEnv_set_tx_timestamp, METH_VARARGS},
-     {"lock_detect",     (PyCFunction)DBEnv_lock_detect,     METH_VARARGS},
-@@ -8804,11 +8762,16 @@ static PyMethodDef DBEnv_methods[] = {
-     {"get_mp_max_write", (PyCFunction)DBEnv_get_mp_max_write, METH_NOARGS},
- #endif
-     {"set_verbose",     (PyCFunction)DBEnv_set_verbose,     METH_VARARGS},
--#if (DBVER >= 42)
--    {"get_verbose",     (PyCFunction)DBEnv_get_verbose,       METH_VARARGS},
-+    {"get_verbose",     (PyCFunction)DBEnv_get_verbose,     METH_VARARGS},
-+    {"set_private",     (PyCFunction)DBEnv_set_private,     METH_O},
-+    {"get_private",     (PyCFunction)DBEnv_get_private,     METH_NOARGS},
-+    {"get_open_flags",  (PyCFunction)DBEnv_get_open_flags,  METH_NOARGS},
-+#if (DBVER >= 47)
-+    {"set_intermediate_dir_mode", (PyCFunction)DBEnv_set_intermediate_dir_mode,
-+        METH_VARARGS},
-+    {"get_intermediate_dir_mode", (PyCFunction)DBEnv_get_intermediate_dir_mode,
-+        METH_NOARGS},
- #endif
--    {"set_private",     (PyCFunction)DBEnv_set_private,       METH_O},
--    {"get_private",     (PyCFunction)DBEnv_get_private,       METH_NOARGS},
-     {"rep_start",       (PyCFunction)DBEnv_rep_start,
-         METH_VARARGS|METH_KEYWORDS},
-     {"rep_set_transport", (PyCFunction)DBEnv_rep_set_transport, METH_VARARGS},
-@@ -8855,10 +8818,12 @@ static PyMethodDef DBEnv_methods[] = {
- #if (DBVER >= 45)
-     {"repmgr_start", (PyCFunction)DBEnv_repmgr_start,
-         METH_VARARGS|METH_KEYWORDS},
-+#if (DBVER < 52)
-     {"repmgr_set_local_site", (PyCFunction)DBEnv_repmgr_set_local_site,
-         METH_VARARGS|METH_KEYWORDS},
-     {"repmgr_add_remote_site", (PyCFunction)DBEnv_repmgr_add_remote_site,
-         METH_VARARGS|METH_KEYWORDS},
-+#endif
-     {"repmgr_set_ack_policy", (PyCFunction)DBEnv_repmgr_set_ack_policy,
-         METH_VARARGS},
-     {"repmgr_get_ack_policy", (PyCFunction)DBEnv_repmgr_get_ack_policy,
-@@ -8922,13 +8887,9 @@ DBEnv_db_home_get(DBEnvObject* self)
- 
-     CHECK_ENV_NOT_CLOSED(self);
- 
--#if (DBVER >= 42)
-     MYDB_BEGIN_ALLOW_THREADS;
-     self->db_env->get_home(self->db_env, &home);
-     MYDB_END_ALLOW_THREADS;
--#else
--    home=self->db_env->db_home;
--#endif
- 
-     if (home == NULL) {
-         RETURN_NONE();
-@@ -9298,10 +9259,25 @@ bsddb_version(PyObject* self)
- {
-     int major, minor, patch;
- 
-+    /* This should be instantaneous, no need to release the GIL */
-     db_version(&major, &minor, &patch);
-     return Py_BuildValue("(iii)", major, minor, patch);
- }
- 
-+#if (DBVER >= 50)
-+static PyObject*
-+bsddb_version_full(PyObject* self)
-+{
-+    char *version_string;
-+    int family, release, major, minor, patch;
-+
-+    /* This should be instantaneous, no need to release the GIL */
-+    version_string = db_full_version(&family, &release, &major, &minor, &patch);
-+    return Py_BuildValue("(siiiii)",
-+            version_string, family, release, major, minor, patch);
-+}
-+#endif
-+
- 
- /* List of functions defined in the module */
- static PyMethodDef bsddb_methods[] = {
-@@ -9311,6 +9287,9 @@ static PyMethodDef bsddb_methods[] = {
-     {"DBSequence",  (PyCFunction)DBSequence_construct,  METH_VARARGS | METH_KEYWORDS },
- #endif
-     {"version",     (PyCFunction)bsddb_version,         METH_NOARGS, bsddb_version_doc},
-+#if (DBVER >= 50)
-+    {"full_version", (PyCFunction)bsddb_version_full, METH_NOARGS},
-+#endif
-     {NULL,      NULL}       /* sentinel */
- };
- 
-@@ -9328,6 +9307,11 @@ static BSDDB_api bsddb_api;
-  */
- #define ADD_INT(dict, NAME)         _addIntToDict(dict, #NAME, NAME)
- 
-+/*
-+** We can rename the module at import time, so the string allocated
-+** must be big enough, and any use of the name must use this particular
-+** string.
-+*/
- #define MODULE_NAME_MAX_LEN     11
- static char _bsddbModuleName[MODULE_NAME_MAX_LEN+1] = "_bsddb";
- 
-@@ -9428,16 +9412,10 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_MAX_RECORDS);
- 
- #if (DBVER < 48)
--#if (DBVER >= 42)
-     ADD_INT(d, DB_RPCCLIENT);
--#else
--    ADD_INT(d, DB_CLIENT);
--    /* allow apps to be written using DB_RPCCLIENT on older Berkeley DB */
--    _addIntToDict(d, "DB_RPCCLIENT", DB_CLIENT);
--#endif
- #endif
- 
--#if (DBVER < 48)
-+#if (DBVER < 48 || DBVER > 51)
-     ADD_INT(d, DB_XA_CREATE);
- #endif
- 
-@@ -9477,6 +9455,14 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_TXN_SYNC);
-     ADD_INT(d, DB_TXN_NOWAIT);
- 
-+#if (DBVER >= 51)
-+    ADD_INT(d, DB_TXN_BULK);
-+#endif
-+
-+#if (DBVER >= 48)
-+    ADD_INT(d, DB_CURSOR_BULK);
-+#endif
-+
- #if (DBVER >= 46)
-     ADD_INT(d, DB_TXN_WAIT);
- #endif
-@@ -9561,9 +9547,7 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_ARCH_ABS);
-     ADD_INT(d, DB_ARCH_DATA);
-     ADD_INT(d, DB_ARCH_LOG);
--#if (DBVER >= 42)
-     ADD_INT(d, DB_ARCH_REMOVE);
--#endif
- 
-     ADD_INT(d, DB_BTREE);
-     ADD_INT(d, DB_HASH);
-@@ -9591,9 +9575,6 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_CACHED_COUNTS);
- #endif
- 
--#if (DBVER <= 41)
--    ADD_INT(d, DB_COMMIT);
--#endif
-     ADD_INT(d, DB_CONSUME);
-     ADD_INT(d, DB_CONSUME_WAIT);
-     ADD_INT(d, DB_CURRENT);
-@@ -9651,8 +9632,10 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_LOCK_DEADLOCK);
-     ADD_INT(d, DB_LOCK_NOTGRANTED);
-     ADD_INT(d, DB_NOSERVER);
-+#if (DBVER < 52)
-     ADD_INT(d, DB_NOSERVER_HOME);
-     ADD_INT(d, DB_NOSERVER_ID);
-+#endif
-     ADD_INT(d, DB_NOTFOUND);
-     ADD_INT(d, DB_OLD_VERSION);
-     ADD_INT(d, DB_RUNRECOVERY);
-@@ -9671,6 +9654,10 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
- #if (DBVER >= 43)
-     ADD_INT(d, DB_STAT_SUBSYSTEM);
-     ADD_INT(d, DB_STAT_MEMP_HASH);
-+    ADD_INT(d, DB_STAT_LOCK_CONF);
-+    ADD_INT(d, DB_STAT_LOCK_LOCKERS);
-+    ADD_INT(d, DB_STAT_LOCK_OBJECTS);
-+    ADD_INT(d, DB_STAT_LOCK_PARAMS);
- #endif
- 
- #if (DBVER >= 48)
-@@ -9690,7 +9677,6 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_EID_INVALID);
-     ADD_INT(d, DB_EID_BROADCAST);
- 
--#if (DBVER >= 42)
-     ADD_INT(d, DB_TIME_NOTGRANTED);
-     ADD_INT(d, DB_TXN_NOT_DURABLE);
-     ADD_INT(d, DB_TXN_WRITE_NOSYNC);
-@@ -9698,9 +9684,8 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_INIT_REP);
-     ADD_INT(d, DB_ENCRYPT);
-     ADD_INT(d, DB_CHKSUM);
--#endif
- 
--#if (DBVER >= 42) && (DBVER < 47)
-+#if (DBVER < 47)
-     ADD_INT(d, DB_LOG_AUTOREMOVE);
-     ADD_INT(d, DB_DIRECT_LOG);
- #endif
-@@ -9733,6 +9718,20 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_VERB_REPLICATION);
-     ADD_INT(d, DB_VERB_WAITSFOR);
- 
-+#if (DBVER >= 50)
-+    ADD_INT(d, DB_VERB_REP_SYSTEM);
-+#endif
-+
-+#if (DBVER >= 47)
-+    ADD_INT(d, DB_VERB_REP_ELECT);
-+    ADD_INT(d, DB_VERB_REP_LEASE);
-+    ADD_INT(d, DB_VERB_REP_MISC);
-+    ADD_INT(d, DB_VERB_REP_MSGS);
-+    ADD_INT(d, DB_VERB_REP_SYNC);
-+    ADD_INT(d, DB_VERB_REPMGR_CONNFAIL);
-+    ADD_INT(d, DB_VERB_REPMGR_MISC);
-+#endif
-+
- #if (DBVER >= 45)
-     ADD_INT(d, DB_EVENT_PANIC);
-     ADD_INT(d, DB_EVENT_REP_CLIENT);
-@@ -9748,16 +9747,25 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_EVENT_WRITE_FAILED);
- #endif
- 
-+#if (DBVER >= 50)
-+    ADD_INT(d, DB_REPMGR_CONF_ELECTIONS);
-+    ADD_INT(d, DB_EVENT_REP_MASTER_FAILURE);
-+    ADD_INT(d, DB_EVENT_REP_DUPMASTER);
-+    ADD_INT(d, DB_EVENT_REP_ELECTION_FAILED);
-+#endif
-+#if (DBVER >= 48)
-+    ADD_INT(d, DB_EVENT_REG_ALIVE);
-+    ADD_INT(d, DB_EVENT_REG_PANIC);
-+#endif
-+
-     ADD_INT(d, DB_REP_DUPMASTER);
-     ADD_INT(d, DB_REP_HOLDELECTION);
- #if (DBVER >= 44)
-     ADD_INT(d, DB_REP_IGNORE);
-     ADD_INT(d, DB_REP_JOIN_FAILURE);
- #endif
--#if (DBVER >= 42)
-     ADD_INT(d, DB_REP_ISPERM);
-     ADD_INT(d, DB_REP_NOTPERM);
--#endif
-     ADD_INT(d, DB_REP_NEWSITE);
- 
-     ADD_INT(d, DB_REP_MASTER);
-@@ -9766,7 +9774,13 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_REP_PERMANENT);
- 
- #if (DBVER >= 44)
-+#if (DBVER >= 50)
-+    ADD_INT(d, DB_REP_CONF_AUTOINIT);
-+#else
-     ADD_INT(d, DB_REP_CONF_NOAUTOINIT);
-+#endif /* 5.0 */
-+#endif /* 4.4 */
-+#if (DBVER >= 44)
-     ADD_INT(d, DB_REP_CONF_DELAYCLIENT);
-     ADD_INT(d, DB_REP_CONF_BULK);
-     ADD_INT(d, DB_REP_CONF_NOWAIT);
-@@ -9774,9 +9788,7 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_REP_REREQUEST);
- #endif
- 
--#if (DBVER >= 42)
-     ADD_INT(d, DB_REP_NOBUFFER);
--#endif
- 
- #if (DBVER >= 46)
-     ADD_INT(d, DB_REP_LEASE_EXPIRED);
-@@ -9819,6 +9831,28 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_STAT_ALL);
- #endif
- 
-+#if (DBVER >= 51)
-+    ADD_INT(d, DB_REPMGR_ACKS_ALL_AVAILABLE);
-+#endif
-+
-+#if (DBVER >= 48)
-+    ADD_INT(d, DB_REP_CONF_INMEM);
-+#endif
-+
-+    ADD_INT(d, DB_TIMEOUT);
-+
-+#if (DBVER >= 50)
-+    ADD_INT(d, DB_FORCESYNC);
-+#endif
-+
-+#if (DBVER >= 48)
-+    ADD_INT(d, DB_FAILCHK);
-+#endif
-+
-+#if (DBVER >= 51)
-+    ADD_INT(d, DB_HOTBACKUP_IN_PROGRESS);
-+#endif
-+
- #if (DBVER >= 43)
-     ADD_INT(d, DB_BUFFER_SMALL);
-     ADD_INT(d, DB_SEQ_DEC);
-@@ -9856,6 +9890,10 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     ADD_INT(d, DB_SET_LOCK_TIMEOUT);
-     ADD_INT(d, DB_SET_TXN_TIMEOUT);
- 
-+#if (DBVER >= 48)
-+    ADD_INT(d, DB_SET_REG_TIMEOUT);
-+#endif
-+
-     /* The exception name must be correct for pickled exception *
-      * objects to unpickle properly.                            */
- #ifdef PYBSDDB_STANDALONE  /* different value needed for standalone pybsddb */
-@@ -9912,8 +9950,10 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     MAKE_EX(DBRunRecoveryError);
-     MAKE_EX(DBVerifyBadError);
-     MAKE_EX(DBNoServerError);
-+#if (DBVER >= 44 && DBVER < 52)
-     MAKE_EX(DBNoServerHomeError);
-     MAKE_EX(DBNoServerIDError);
-+#endif
-     MAKE_EX(DBPageNotFoundError);
-     MAKE_EX(DBSecondaryBadError);
- 
-@@ -9927,9 +9967,7 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     MAKE_EX(DBNoSuchFileError);
-     MAKE_EX(DBPermissionsError);
- 
--#if (DBVER >= 42)
-     MAKE_EX(DBRepHandleDeadError);
--#endif
- #if (DBVER >= 44)
-     MAKE_EX(DBRepLockoutError);
- #endif
-@@ -9947,6 +9985,7 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
- #undef MAKE_EX
- 
-     /* Initialise the C API structure and add it to the module */
-+    bsddb_api.api_version      = PYBSDDB_API_VERSION;
-     bsddb_api.db_type          = &DB_Type;
-     bsddb_api.dbcursor_type    = &DBCursor_Type;
-     bsddb_api.dblogcursor_type = &DBLogCursor_Type;
-@@ -9955,19 +9994,25 @@ PyMODINIT_FUNC  PyInit__bsddb(void)    /* Note the two underscores */
-     bsddb_api.dblock_type      = &DBLock_Type;
- #if (DBVER >= 43)
-     bsddb_api.dbsequence_type  = &DBSequence_Type;
-+#else
-+    bsddb_api.dbsequence_type  = NULL;
- #endif
-     bsddb_api.makeDBError      = makeDBError;
- 
-     /*
--    ** Capsules exist from Python 3.1, but I
--    ** don't want to break the API compatibility
--    ** for already published Python versions.
-+    ** Capsules exist from Python 2.7 and 3.1.
-+    ** We don't support Python 3.0 anymore, so...
-+    ** #if (PY_VERSION_HEX < ((PY_MAJOR_VERSION < 3) ? 0x02070000 : 0x03020000))
-     */
--#if (PY_VERSION_HEX < 0x03020000)
-+#if (PY_VERSION_HEX < 0x02070000)
-     py_api = PyCObject_FromVoidPtr((void*)&bsddb_api, NULL);
- #else
-     {
--        char py_api_name[250];
-+        /*
-+        ** The data must outlive the call!!. So, the static definition.
-+        ** The buffer must be big enough...
-+        */
-+        static char py_api_name[MODULE_NAME_MAX_LEN+10];
- 
-         strcpy(py_api_name, _bsddbModuleName);
-         strcat(py_api_name, ".api");
-diff --git a/Modules/bsddb.h b/Modules/bsddb.h
-index a3a687b..c1d862a 100644
---- a/Modules/bsddb.h
-+++ b/Modules/bsddb.h
-@@ -109,7 +109,7 @@
- #error "eek! DBVER can't handle minor versions > 9"
- #endif
- 
--#define PY_BSDDB_VERSION "4.8.4.2"
-+#define PY_BSDDB_VERSION "5.3.15"
- 
- /* Python object definitions */
- 
-@@ -236,7 +236,7 @@ typedef struct DBSequenceObject {
- /* To access the structure from an external module, use code like the
-    following (error checking missed out for clarity):
- 
--     // If you are using Python before 3.2:
-+     // If you are using Python before 2.7:
-      BSDDB_api* bsddb_api;
-      PyObject*  mod;
-      PyObject*  cobj;
-@@ -249,7 +249,7 @@ typedef struct DBSequenceObject {
-      Py_DECREF(mod);
- 
- 
--     // If you are using Python 3.2 or up:
-+     // If you are using Python 2.7 or up: (except Python 3.0, unsupported)
-      BSDDB_api* bsddb_api;
- 
-      // Use "bsddb3._pybsddb.api" if you're using
-@@ -257,10 +257,14 @@ typedef struct DBSequenceObject {
-      bsddb_api = (void **)PyCapsule_Import("bsddb._bsddb.api", 1);
- 
- 
-+   Check "api_version" number before trying to use the API.
-+
-    The structure's members must not be changed.
- */
- 
-+#define PYBSDDB_API_VERSION 1
- typedef struct {
-+    unsigned int api_version;
-     /* Type objects */
-     PyTypeObject* db_type;
-     PyTypeObject* dbcursor_type;
-@@ -268,9 +272,7 @@ typedef struct {
-     PyTypeObject* dbenv_type;
-     PyTypeObject* dbtxn_type;
-     PyTypeObject* dblock_type;
--#if (DBVER >= 43)
--    PyTypeObject* dbsequence_type;
--#endif
-+    PyTypeObject* dbsequence_type;  /* If DBVER < 43 -> NULL */
- 
-     /* Functions */
-     int (*makeDBError)(int err);
-@@ -289,9 +291,9 @@ typedef struct {
- #define DBEnvObject_Check(v)    ((v)->ob_type == bsddb_api->dbenv_type)
- #define DBTxnObject_Check(v)    ((v)->ob_type == bsddb_api->dbtxn_type)
- #define DBLockObject_Check(v)   ((v)->ob_type == bsddb_api->dblock_type)
--#if (DBVER >= 43)
--#define DBSequenceObject_Check(v)  ((v)->ob_type == bsddb_api->dbsequence_type)
--#endif
-+#define DBSequenceObject_Check(v)  \
-+    ((bsddb_api->dbsequence_type) && \
-+        ((v)->ob_type == bsddb_api->dbsequence_type))
- 
- #endif /* COMPILING_BSDDB_C */
- 
-diff --git a/setup.py b/setup.py
-index 6b47451..e8ac96c 100644
---- a/setup.py
-+++ b/setup.py
-@@ -799,7 +799,7 @@ class PyBuildExt(build_ext):
-         # a release.  Most open source OSes come with one or more
-         # versions of BerkeleyDB already installed.
- 
--        max_db_ver = (4, 8)
-+        max_db_ver = (5, 3)
-         min_db_ver = (4, 1)
-         db_setup_debug = False   # verbose debug prints from this script?
- 
-@@ -821,7 +821,11 @@ class PyBuildExt(build_ext):
-             return True
- 
-         def gen_db_minor_ver_nums(major):
--            if major == 4:
-+            if major == 5:
-+                for x in range(max_db_ver[1]+1):
-+                    if allow_db_ver((5, x)):
-+                        yield x
-+            elif major == 4:
-                 for x in range(max_db_ver[1]+1):
-                     if allow_db_ver((4, x)):
-                         yield x
-@@ -835,6 +839,9 @@ class PyBuildExt(build_ext):
-         # construct a list of paths to look for the header file in on
-         # top of the normal inc_dirs.
-         db_inc_paths = [
-+            '/usr/include/db5',
-+            '/usr/local/include/db5',
-+            '/opt/sfw/include/db5',
-             '/usr/include/db4',
-             '/usr/local/include/db4',
-             '/opt/sfw/include/db4',
-@@ -845,6 +852,16 @@ class PyBuildExt(build_ext):
-             '/sw/include/db4',
-             '/sw/include/db3',
-         ]
-+        # 5.x minor number specific paths
-+        for x in gen_db_minor_ver_nums(5):
-+            db_inc_paths.append('/usr/include/db5%d' % x)
-+            db_inc_paths.append('/usr/include/db5.%d' % x)
-+            db_inc_paths.append('/usr/local/BerkeleyDB.5.%d/include' % x)
-+            db_inc_paths.append('/usr/local/include/db5%d' % x)
-+            db_inc_paths.append('/pkg/db-5.%d/include' % x)
-+            db_inc_paths.append('/opt/db-5.%d/include' % x)
-+            # MacPorts default (http://www.macports.org/)
-+            db_inc_paths.append('/opt/local/include/db5%d' % x)
-         # 4.x minor number specific paths
-         for x in gen_db_minor_ver_nums(4):
-             db_inc_paths.append('/usr/include/db4%d' % x)
-@@ -871,6 +888,10 @@ class PyBuildExt(build_ext):
-         for dn in inc_dirs:
-             std_variants.append(os.path.join(dn, 'db3'))
-             std_variants.append(os.path.join(dn, 'db4'))
-+            std_variants.append(os.path.join(dn, 'db5'))
-+            for x in gen_db_minor_ver_nums(5):
-+                std_variants.append(os.path.join(dn, "db5%d"%x))
-+                std_variants.append(os.path.join(dn, "db5.%d"%x))
-             for x in gen_db_minor_ver_nums(4):
-                 std_variants.append(os.path.join(dn, "db4%d"%x))
-                 std_variants.append(os.path.join(dn, "db4.%d"%x))
--- 
-1.7.7
-
diff --git a/meta/recipes-devtools/python/python/python-fix-build-error-with-Readline-6.3.patch b/meta/recipes-devtools/python/python/python-fix-build-error-with-Readline-6.3.patch
deleted file mode 100644
index b84f8c3..0000000
--- a/meta/recipes-devtools/python/python/python-fix-build-error-with-Readline-6.3.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-python: fix build error with Readline 6.3
-
-Backport two patches from upstream:
-
-use new readline function types (closes #20374)
-Issue #20374: Avoid compiler warnings when compiling readline with libedit.
-
-Upstream-Status: Backport
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- Modules/readline.c |   15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/Modules/readline.c b/Modules/readline.c
-index b5e258d..d3f52aa 100644
---- a/Modules/readline.c
-+++ b/Modules/readline.c
-@@ -735,15 +735,24 @@ on_hook(PyObject *func)
-     return result;
- }
- 
-+
- static int
-+#if defined(_RL_FUNCTION_TYPEDEF)
- on_startup_hook(void)
-+#else
-+on_startup_hook()
-+#endif
- {
-     return on_hook(startup_hook);
- }
- 
- #ifdef HAVE_RL_PRE_INPUT_HOOK
- static int
-+#if defined(_RL_FUNCTION_TYPEDEF)
- on_pre_input_hook(void)
-+#else
-+on_pre_input_hook()
-+#endif
- {
-     return on_hook(pre_input_hook);
- }
-@@ -886,12 +895,12 @@ setup_readline(void)
-     rl_bind_key_in_map ('\t', rl_complete, emacs_meta_keymap);
-     rl_bind_key_in_map ('\033', rl_complete, emacs_meta_keymap);
-     /* Set our hook functions */
--    rl_startup_hook = (Function *)on_startup_hook;
-+    rl_startup_hook = (rl_hook_func_t *)on_startup_hook;
- #ifdef HAVE_RL_PRE_INPUT_HOOK
--    rl_pre_input_hook = (Function *)on_pre_input_hook;
-+    rl_pre_input_hook = (rl_hook_func_t *)on_pre_input_hook;
- #endif
-     /* Set our completion function */
--    rl_attempted_completion_function = (CPPFunction *)flex_complete;
-+    rl_attempted_completion_function = (rl_completion_func_t *)flex_complete;
-     /* Set Python word break characters */
-     rl_completer_word_break_characters =
-         strdup(" \t\n`~!@#$%^&*()-=+[{]}\\|;:'\",<>/?");
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/python/python/python2.7.3-nossl3.patch b/meta/recipes-devtools/python/python/python2.7.3-nossl3.patch
deleted file mode 100644
index 2d35520..0000000
--- a/meta/recipes-devtools/python/python/python2.7.3-nossl3.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-python: Building without SSLv3 support
-
-Building without SSLv3 support when openssl is built
-without any support for SSLv3
-
-Upstream-Status: Backport
-
-Reference:
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=76A8611#22
-
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
-diff -ruN a/Modules/_ssl.c b/Modules/_ssl.c
---- a/Modules/_ssl.c	2014-11-26 07:43:58.755679939 +0100
-+++ b/Modules/_ssl.c	2014-11-26 07:49:10.454182400 +0100
-@@ -302,8 +302,10 @@
-     PySSL_BEGIN_ALLOW_THREADS
-     if (proto_version == PY_SSL_VERSION_TLS1)
-         self->ctx = SSL_CTX_new(TLSv1_method()); /* Set up context */
-+#ifndef OPENSSL_NO_SSL3
-     else if (proto_version == PY_SSL_VERSION_SSL3)
-         self->ctx = SSL_CTX_new(SSLv3_method()); /* Set up context */
-+#endif
- #ifndef OPENSSL_NO_SSL2
-     else if (proto_version == PY_SSL_VERSION_SSL2)
-         self->ctx = SSL_CTX_new(SSLv2_method()); /* Set up context */
-@@ -1777,8 +1779,10 @@
-     PyModule_AddIntConstant(m, "PROTOCOL_SSLv2",
-                             PY_SSL_VERSION_SSL2);
- #endif
-+#ifndef OPENSSL_NO_SSL3
-     PyModule_AddIntConstant(m, "PROTOCOL_SSLv3",
-                             PY_SSL_VERSION_SSL3);
-+#endif
-     PyModule_AddIntConstant(m, "PROTOCOL_SSLv23",
-                             PY_SSL_VERSION_SSL23);
-     PyModule_AddIntConstant(m, "PROTOCOL_TLSv1",
diff --git a/meta/recipes-devtools/python/python/remove-BOM-insection-code.patch b/meta/recipes-devtools/python/python/remove-BOM-insection-code.patch
deleted file mode 100644
index 3462620..0000000
--- a/meta/recipes-devtools/python/python/remove-BOM-insection-code.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-# HG changeset patch
-# User Vinay Sajip <vinay_sajip@yahoo.co.uk>
-# Date 1334583503 -3600
-# Node ID af46a001d5eca99a7ff44ed18256c235c5c3f1d0
-# Parent  33bc53e0aa9ea42c6a6bb077d182e62c8c569aa1
-Issue #14452: remove BOM insertion code.
-
-Backport from https://hg.python.org/cpython/rev/af46a001d5ec.
-
-Upstream-Status: Backport
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/Lib/logging/handlers.py b/Lib/logging/handlers.py
---- a/Lib/logging/handlers.py
-+++ b/Lib/logging/handlers.py
-@@ -821,8 +821,6 @@ class SysLogHandler(logging.Handler):
-         # Message is a string. Convert to bytes as required by RFC 5424
-         if type(msg) is unicode:
-             msg = msg.encode('utf-8')
--            if codecs:
--                msg = codecs.BOM_UTF8 + msg
-         msg = prio + msg
-         try:
-             if self.unixsocket:
diff --git a/meta/recipes-devtools/python/python/remove_sqlite_rpath.patch b/meta/recipes-devtools/python/python/remove_sqlite_rpath.patch
deleted file mode 100644
index 4ec627e..0000000
--- a/meta/recipes-devtools/python/python/remove_sqlite_rpath.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-This patch removes the RPATH setting which contains a pointer to
-the target relocated sysroot, which is incorrect.
-
-Upstream-Status: Inappropriate [Embedded Specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: Python-2.6.6/setup.py
-===================================================================
---- Python-2.6.6.orig/setup.py	2011-09-28 14:22:57.000000000 -0700
-+++ Python-2.6.6/setup.py	2011-09-28 16:11:25.147279633 -0700
-@@ -1079,7 +1079,6 @@
-                                   include_dirs=["Modules/_sqlite",
-                                                 sqlite_incdir],
-                                   library_dirs=sqlite_libdir,
--                                  runtime_library_dirs=sqlite_libdir,
-                                   extra_link_args=sqlite_extra_link_args,
-                                   libraries=["sqlite3",]))
-         else:
diff --git a/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch b/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch
index 0c1f174..dacb552 100644
--- a/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch
+++ b/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch
@@ -6,26 +6,21 @@ Upstream-Status: Inappropriate [distribution]
 
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py	2012-04-05 22:27:22.437199989 +0300
-+++ Python-2.7.2/setup.py	2012-04-05 22:26:38.000000000 +0300
-@@ -1141,12 +1141,12 @@
+
+diff --git a/setup.py b/setup.py
+index b887808..ae51607 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1237,6 +1237,8 @@ class PyBuildExt(build_ext):
          # the more recent berkeleydb's db.h file first in the include path
          # when attempting to compile and it will fail.
          f = "/usr/include/db.h"
--
 +        if len(inc_dirs) != 0:
 +            f = os.path.join(inc_dirs[0], "db.h")
-         if sys.platform == 'darwin':
+ 
+         if host_platform == 'darwin':
              if is_macosx_sdk_path(f):
-                 sysroot = macosx_sdk_root()
-                 f = os.path.join(sysroot, f[1:])
--
-         if os.path.exists(f) and not db_incs:
-             data = open(f).read()
-             m = re.search(r"#s*define\s+HASHVERSION\s+2\s*", data)
-@@ -1161,8 +1161,10 @@
+@@ -1257,8 +1259,10 @@ class PyBuildExt(build_ext):
                                            libraries=libraries))
                  else:
                      exts.append(Extension('bsddb185', ['bsddbmodule.c']))
diff --git a/meta/recipes-devtools/python/python/use_sysroot_ncurses_instead_of_host.patch b/meta/recipes-devtools/python/python/use_sysroot_ncurses_instead_of_host.patch
new file mode 100644
index 0000000..2c65786
--- /dev/null
+++ b/meta/recipes-devtools/python/python/use_sysroot_ncurses_instead_of_host.patch
@@ -0,0 +1,20 @@
+Python tries to use ncursesw from the host,
+if it is not found causes an error on configure,
+we should use ncursesw from sysroot instead
+
+
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+
+Index: Python-2.7.9/configure.ac
+===================================================================
+--- Python-2.7.9.orig/configure.ac
++++ Python-2.7.9/configure.ac
+@@ -4311,7 +4311,7 @@ fi
+ 
+ # first curses configure check
+ ac_save_cppflags="$CPPFLAGS"
+-CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
++CPPFLAGS="$CPPFLAGS -I=/usr/include/ncursesw"
+ 
+ AC_CHECK_HEADERS(curses.h ncurses.h)
+ 
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.9.bb
similarity index 89%
rename from meta/recipes-devtools/python/python_2.7.3.bb
rename to meta/recipes-devtools/python/python_2.7.9.bb
index a4c95c1..048ec39 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -1,19 +1,16 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI += "\
   file://01-use-proper-tools-for-cross-build.patch \
   file://03-fix-tkinter-detection.patch \
-  file://05-enable-ctypes-cross-build.patch \
-  file://06-ctypes-libffi-fix-configure.patch \
   file://06-avoid_usr_lib_termcap_path_in_linking.patch \
   ${DISTRO_SRC_URI} \
   file://multilib.patch \
   file://cgi_py.patch \
-  file://remove_sqlite_rpath.patch \
   file://setup_py_skip_cross_import_check.patch \
   file://add-md5module-support.patch \
   file://host_include_contamination.patch \
@@ -23,24 +20,11 @@ SRC_URI += "\
   file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
   file://avoid_warning_about_tkinter.patch \
   file://avoid_warning_for_sunos_specific_module.patch \
-  file://python-2.7.3-berkeley-db-5.3.patch \
   file://python-2.7.3-remove-bsdb-rpath.patch \
-  file://builddir.patch \
-  file://python-2.7.3-CVE-2012-2135.patch \
-  file://gcc-4.8-fix-configure-Wformat.patch \
   file://fix-makefile-for-ptest.patch \
   file://run-ptest \
-  file://CVE-2013-4073_py27.patch \
-  file://pypirc-secure.patch \
   file://parallel-makeinst-create-bindir.patch \
-  file://python-2.7.3-CVE-2013-1752-smtplib-fix.patch \
-  file://python-fix-build-error-with-Readline-6.3.patch \
-  file://python-2.7.3-CVE-2014-1912.patch \
-  file://json-flaw-fix.patch \
-  file://posix_close.patch \
-  file://remove-BOM-insection-code.patch \
-  file://python-2.7.3-CVE-2014-7185.patch \
-  file://python2.7.3-nossl3.patch \
+  file://use_sysroot_ncurses_instead_of_host.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
@@ -53,7 +37,7 @@ TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
 TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
 
 # The following is a hack until we drop ac_cv_sizeof_off_t from site files
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)} ac_cv_file__dev_ptmx=no ac_cv_file__dev_ptc=no"
 
 do_configure_prepend() {
 	rm -f ${S}/Makefile.orig
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 52224fb..99bdca8 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -170,8 +170,8 @@ if __name__ == "__main__":
     "warnings.* site.* stat.* " +
     "UserDict.* UserList.* UserString.* " +
     "lib-dynload/binascii.so lib-dynload/_struct.so lib-dynload/time.so " +
-    "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python* "  + 
-    "_weakrefset.* sysconfig.* config/Makefile " +
+    "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python* "  +
+    "_weakrefset.* sysconfig.* _sysconfigdata.* config/Makefile " +
     "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
 
-- 
1.9.1



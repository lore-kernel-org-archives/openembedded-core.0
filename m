Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 125E2607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 18:52:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2016 11:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,466,1464678000"; d="scan'208";a="150127676"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2016 11:52:42 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 18:49:41 +0000
Message-Id: <94406436e753a3b5c6b85552578f97a704f825be.1470158817.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1470158817.git.alejandro.hernandez@linux.intel.com>
References: <cover.1470158817.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/4] Python2-native: Upgrade from 2.7.11 to 2.7.12
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
X-List-Received-Date: Wed, 03 Aug 2016 18:52:48 -0000

LICENSE did not change, only dates changed.

Rebases:
 - debug.patch
 - multilib.patch

Upstream:
 - avoid_parallel_make_races_on_pgen.patch

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/python-native/debug.patch               | 17 ++--
 .../python/python-native/multilib.patch            | 96 +++++++++++-----------
 ...on-native_2.7.11.bb => python-native_2.7.12.bb} |  2 +-
 meta/recipes-devtools/python/python.inc            |  6 +-
 4 files changed, 62 insertions(+), 59 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.11.bb => python-native_2.7.12.bb} (97%)

diff --git a/meta/recipes-devtools/python/python-native/debug.patch b/meta/recipes-devtools/python/python-native/debug.patch
index 5ec10d6..3617882 100644
--- a/meta/recipes-devtools/python/python-native/debug.patch
+++ b/meta/recipes-devtools/python/python-native/debug.patch
@@ -1,24 +1,27 @@
 Upstream-Status: Pending
 
-Index: Python-2.6.1/Lib/distutils/unixccompiler.py
+Index: Python-2.7.12/Lib/distutils/unixccompiler.py
 ===================================================================
---- Python-2.6.1.orig/Lib/distutils/unixccompiler.py	2009-11-13 16:04:54.000000000 +0000
-+++ Python-2.6.1/Lib/distutils/unixccompiler.py	2009-11-13 16:06:27.000000000 +0000
-@@ -300,6 +300,8 @@
-         dylib_f = self.library_filename(lib, lib_type='dylib')
-         static_f = self.library_filename(lib, lib_type='static')
+--- Python-2.7.12.orig/Lib/distutils/unixccompiler.py
++++ Python-2.7.12/Lib/distutils/unixccompiler.py
+@@ -278,6 +278,8 @@ class UnixCCompiler(CCompiler):
+ 
+ 
  
 +        print "Looking in %s for %s" % (lib, dirs)
 +
          for dir in dirs:
              shared = os.path.join(dir, shared_f)
              dylib = os.path.join(dir, dylib_f)
-@@ -309,10 +311,13 @@
+@@ -298,12 +300,16 @@ class UnixCCompiler(CCompiler):
              # assuming that *all* Unix C compilers do.  And of course I'm
              # ignoring even GCC's "-static" option.  So sue me.
              if os.path.exists(dylib):
 +                print "Found %s" % (dylib)
                  return dylib
+             elif os.path.exists(xcode_stub):
++                print "Found %s" % (xcode_stub)
+                 return xcode_stub
              elif os.path.exists(shared):
 +                print "Found %s" % (shared)
                  return shared
diff --git a/meta/recipes-devtools/python/python-native/multilib.patch b/meta/recipes-devtools/python/python-native/multilib.patch
index 8d475e9..916b40f 100644
--- a/meta/recipes-devtools/python/python-native/multilib.patch
+++ b/meta/recipes-devtools/python/python-native/multilib.patch
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: Python-2.7.9/Include/pythonrun.h
+Index: Python-2.7.12/Include/pythonrun.h
 ===================================================================
---- Python-2.7.9.orig/Include/pythonrun.h
-+++ Python-2.7.9/Include/pythonrun.h
+--- Python-2.7.12.orig/Include/pythonrun.h
++++ Python-2.7.12/Include/pythonrun.h
 @@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
@@ -24,10 +24,10 @@ Index: Python-2.7.9/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-2.7.9/Lib/distutils/command/install.py
+Index: Python-2.7.12/Lib/distutils/command/install.py
 ===================================================================
---- Python-2.7.9.orig/Lib/distutils/command/install.py
-+++ Python-2.7.9/Lib/distutils/command/install.py
+--- Python-2.7.12.orig/Lib/distutils/command/install.py
++++ Python-2.7.12/Lib/distutils/command/install.py
 @@ -22,6 +22,8 @@ from site import USER_BASE
  from site import USER_SITE
  
@@ -46,11 +46,11 @@ Index: Python-2.7.9/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-2.7.9/Lib/pydoc.py
+Index: Python-2.7.12/Lib/pydoc.py
 ===================================================================
---- Python-2.7.9.orig/Lib/pydoc.py
-+++ Python-2.7.9/Lib/pydoc.py
-@@ -383,7 +383,7 @@ class Doc:
+--- Python-2.7.12.orig/Lib/pydoc.py
++++ Python-2.7.12/Lib/pydoc.py
+@@ -384,7 +384,7 @@ class Doc:
  
          docloc = os.environ.get("PYTHONDOCS",
                                  "http://docs.python.org/library")
@@ -59,10 +59,10 @@ Index: Python-2.7.9/Lib/pydoc.py
                                 "python"+sys.version[0:3])
          if (isinstance(object, type(os)) and
              (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-2.7.9/Lib/site.py
+Index: Python-2.7.12/Lib/site.py
 ===================================================================
---- Python-2.7.9.orig/Lib/site.py
-+++ Python-2.7.9/Lib/site.py
+--- Python-2.7.12.orig/Lib/site.py
++++ Python-2.7.12/Lib/site.py
 @@ -288,13 +288,19 @@ def getsitepackages():
          if sys.platform in ('os2emx', 'riscos'):
              sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
@@ -86,10 +86,10 @@ Index: Python-2.7.9/Lib/site.py
          if sys.platform == "darwin":
              # for framework builds *only* we add the standard Apple
              # locations.
-Index: Python-2.7.9/Lib/test/test_dl.py
+Index: Python-2.7.12/Lib/test/test_dl.py
 ===================================================================
---- Python-2.7.9.orig/Lib/test/test_dl.py
-+++ Python-2.7.9/Lib/test/test_dl.py
+--- Python-2.7.12.orig/Lib/test/test_dl.py
++++ Python-2.7.12/Lib/test/test_dl.py
 @@ -4,10 +4,11 @@
  import unittest
  from test.test_support import verbose, import_module
@@ -104,10 +104,10 @@ Index: Python-2.7.9/Lib/test/test_dl.py
      ('/usr/bin/cygwin1.dll', 'getpid'),
      ('/usr/lib/libc.dylib', 'getpid'),
      ]
-Index: Python-2.7.9/Lib/trace.py
+Index: Python-2.7.12/Lib/trace.py
 ===================================================================
---- Python-2.7.9.orig/Lib/trace.py
-+++ Python-2.7.9/Lib/trace.py
+--- Python-2.7.12.orig/Lib/trace.py
++++ Python-2.7.12/Lib/trace.py
 @@ -754,10 +754,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
@@ -121,11 +121,11 @@ Index: Python-2.7.9/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-2.7.9/Makefile.pre.in
+Index: Python-2.7.12/Makefile.pre.in
 ===================================================================
---- Python-2.7.9.orig/Makefile.pre.in
-+++ Python-2.7.9/Makefile.pre.in
-@@ -87,6 +87,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
+--- Python-2.7.12.orig/Makefile.pre.in
++++ Python-2.7.12/Makefile.pre.in
+@@ -92,6 +92,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
@@ -133,7 +133,7 @@ Index: Python-2.7.9/Makefile.pre.in
  
  # Multiarch directory (may be empty)
  MULTIARCH=	@MULTIARCH@
-@@ -106,7 +107,7 @@ LIBDIR=		@libdir@
+@@ -111,7 +112,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -142,7 +142,7 @@ Index: Python-2.7.9/Makefile.pre.in
  
  # Detailed destination directories
  BINLIBDEST=	$(LIBDIR)/python$(VERSION)
-@@ -597,6 +598,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -669,6 +670,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -150,7 +150,7 @@ Index: Python-2.7.9/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -639,7 +641,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
+@@ -720,7 +722,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -159,25 +159,25 @@ Index: Python-2.7.9/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-2.7.9/Modules/getpath.c
+Index: Python-2.7.12/Modules/getpath.c
 ===================================================================
---- Python-2.7.9.orig/Modules/getpath.c
-+++ Python-2.7.9/Modules/getpath.c
-@@ -116,9 +116,11 @@
- #define EXEC_PREFIX PREFIX
+--- Python-2.7.12.orig/Modules/getpath.c
++++ Python-2.7.12/Modules/getpath.c
+@@ -100,6 +100,13 @@
+ #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
  #endif
  
 +#define LIB_PYTHON LIB "/python" VERSION
 +
- #ifndef PYTHONPATH
--#define PYTHONPATH PREFIX "/lib/python" VERSION ":" \
--              EXEC_PREFIX "/lib/python" VERSION "/lib-dynload"
++#ifndef PYTHONPATH
 +#define PYTHONPATH PREFIX "/" LIB_PYTHON ":" \
-+              EXEC_PREFIX "/" LIB_PYTHON "/lib-dynload"
- #endif
- 
++        EXEC_PREFIX "/" LIB_PYTHON "/lib-dynload"
++#endif
++
  #ifndef LANDMARK
-@@ -129,7 +131,7 @@ static char prefix[MAXPATHLEN+1];
+ #define LANDMARK "os.py"
+ #endif
+@@ -108,7 +115,7 @@ static char prefix[MAXPATHLEN+1];
  static char exec_prefix[MAXPATHLEN+1];
  static char progpath[MAXPATHLEN+1];
  static char *module_search_path = NULL;
@@ -186,10 +186,10 @@ Index: Python-2.7.9/Modules/getpath.c
  
  static void
  reduce(char *dir)
-Index: Python-2.7.9/Python/getplatform.c
+Index: Python-2.7.12/Python/getplatform.c
 ===================================================================
---- Python-2.7.9.orig/Python/getplatform.c
-+++ Python-2.7.9/Python/getplatform.c
+--- Python-2.7.12.orig/Python/getplatform.c
++++ Python-2.7.12/Python/getplatform.c
 @@ -10,3 +10,13 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -204,10 +204,10 @@ Index: Python-2.7.9/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-2.7.9/Python/sysmodule.c
+Index: Python-2.7.12/Python/sysmodule.c
 ===================================================================
---- Python-2.7.9.orig/Python/sysmodule.c
-+++ Python-2.7.9/Python/sysmodule.c
+--- Python-2.7.12.orig/Python/sysmodule.c
++++ Python-2.7.12/Python/sysmodule.c
 @@ -1437,6 +1437,8 @@ _PySys_Init(void)
                          PyString_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
@@ -217,11 +217,11 @@ Index: Python-2.7.9/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyString_FromString(Py_GetProgramFullPath()));
      SET_SYS_FROM_STRING("prefix",
-Index: Python-2.7.9/configure.ac
+Index: Python-2.7.12/configure.ac
 ===================================================================
---- Python-2.7.9.orig/configure.ac
-+++ Python-2.7.9/configure.ac
-@@ -736,6 +736,11 @@ SunOS*)
+--- Python-2.7.12.orig/configure.ac
++++ Python-2.7.12/configure.ac
+@@ -756,6 +756,11 @@ SunOS*)
      ;;
  esac
  
diff --git a/meta/recipes-devtools/python/python-native_2.7.11.bb b/meta/recipes-devtools/python/python-native_2.7.12.bb
similarity index 97%
rename from meta/recipes-devtools/python/python-native_2.7.11.bb
rename to meta/recipes-devtools/python/python-native_2.7.12.bb
index 31192ca..de83cbd 100644
--- a/meta/recipes-devtools/python/python-native_2.7.11.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.12.bb
@@ -17,8 +17,8 @@ SRC_URI += "\
             file://builddir.patch \
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
-            file://avoid_parallel_make_races_on_pgen.patch \
            "
+
 S = "${WORKDIR}/Python-${PV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:"
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index f4818c6..79a431c 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -5,12 +5,12 @@ SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6b60258130e4ed10d3101517eb5b9385"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "1dbcc848b4cd8399a8199d000f9f823c"
-SRC_URI[sha256sum] = "962b4c45af50124ea61f11a30deb4342fc0bc21126790fa1d7f6c79809413f46"
+SRC_URI[md5sum] = "57dffcee9cee8bb2ab5f82af1d8e9a69"
+SRC_URI[sha256sum] = "d7837121dd5652a05fef807c361909d255d173280c4e1a4ded94d73d80a1f978"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
-- 
2.6.6



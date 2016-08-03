Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2889073285
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 18:52:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2016 11:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,466,1464678000"; d="scan'208";a="150127680"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2016 11:52:42 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 18:49:42 +0000
Message-Id: <0347c6594064a5f5b0eea70071fba77e3b3657f1.1470158817.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <94406436e753a3b5c6b85552578f97a704f825be.1470158817.git.alejandro.hernandez@linux.intel.com>
References: <94406436e753a3b5c6b85552578f97a704f825be.1470158817.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1470158817.git.alejandro.hernandez@linux.intel.com>
References: <cover.1470158817.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 2/4] Python2: Upgrade from 2.7.11 to 2.7.12
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

LICENSE did not change, only dates were changed

Rebases:
 - multilib.patch
 - 01-use-proper-tools-for-cross-build.patch

Upstream:
 - avoid_parallel_make_races_on_pgen.patch
 - CVE-2016-5636.patch

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../01-use-proper-tools-for-cross-build.patch      |  40 ++++----
 meta/recipes-devtools/python/python/multilib.patch | 114 ++++++++++-----------
 .../python/{python_2.7.11.bb => python_2.7.12.bb}  |   2 -
 3 files changed, 77 insertions(+), 79 deletions(-)
 rename meta/recipes-devtools/python/{python_2.7.11.bb => python_2.7.12.bb} (98%)

diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index 4d1395d..b2a8c3b 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -9,11 +9,11 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Rebased for python-2.7.9
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-2.7.9/Makefile.pre.in
+Index: Python-2.7.12/Makefile.pre.in
 ===================================================================
---- Python-2.7.9.orig/Makefile.pre.in
-+++ Python-2.7.9/Makefile.pre.in
-@@ -234,6 +234,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+--- Python-2.7.12.orig/Makefile.pre.in
++++ Python-2.7.12/Makefile.pre.in
+@@ -246,6 +246,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
  ##########################################################################
  # Parser
  PGEN=		Parser/pgen$(EXE)
@@ -21,7 +21,7 @@ Index: Python-2.7.9/Makefile.pre.in
  
  PSRCS=		\
  		Parser/acceler.c \
-@@ -445,7 +446,7 @@ $(BUILDPYTHON):	Modules/python.o $(LIBRA
+@@ -513,7 +514,7 @@ $(BUILDPYTHON):	Modules/python.o $(LIBRA
  			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
  
  platform: $(BUILDPYTHON) pybuilddir.txt
@@ -30,16 +30,16 @@ Index: Python-2.7.9/Makefile.pre.in
  
  # Create build directory and generate the sysconfig build-time data there.
  # pybuilddir.txt contains the name of the build dir and is used for
-@@ -611,7 +612,7 @@ Modules/pwdmodule.o: $(srcdir)/Modules/p
- $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS)
- 		@$(MKDIR_P) Include
- 		$(MAKE) $(PGEN)
--		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- $(GRAMMAR_C): $(GRAMMAR_H) $(GRAMMAR_INPUT) $(PGENSRCS)
- 		$(MAKE) $(GRAMMAR_H)
- 		touch $(GRAMMAR_C)
-@@ -1043,27 +1044,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+@@ -684,7 +685,7 @@ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
+ 	@$(MKDIR_P) Include
+ 	# Avoid copying the file onto itself for an in-tree build
+ 	if test "$(cross_compiling)" != "yes"; then \
+-		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C); \
++		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C); \
+ 	else \
+ 		cp $(srcdir)/Include/graminit.h $(GRAMMAR_H).tmp; \
+ 		mv $(GRAMMAR_H).tmp $(GRAMMAR_H); \
+@@ -1133,27 +1134,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
  	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
@@ -73,11 +73,11 @@ Index: Python-2.7.9/Makefile.pre.in
  
  # Create the PLATDIR source directory, if one wasn't distributed..
  $(srcdir)/Lib/$(PLATDIR):
-Index: Python-2.7.9/setup.py
+Index: Python-2.7.12/setup.py
 ===================================================================
---- Python-2.7.9.orig/setup.py
-+++ Python-2.7.9/setup.py
-@@ -334,6 +334,7 @@ class PyBuildExt(build_ext):
+--- Python-2.7.12.orig/setup.py
++++ Python-2.7.12/setup.py
+@@ -350,6 +350,7 @@ class PyBuildExt(build_ext):
              self.failed.append(ext.name)
              self.announce('*** WARNING: renaming "%s" since importing it'
                            ' failed: %s' % (ext.name, why), level=3)
@@ -85,7 +85,7 @@ Index: Python-2.7.9/setup.py
              assert not self.inplace
              basename, tail = os.path.splitext(ext_filename)
              newname = basename + "_failed" + tail
-@@ -558,6 +559,9 @@ class PyBuildExt(build_ext):
+@@ -574,6 +575,9 @@ class PyBuildExt(build_ext):
  
          # XXX Omitted modules: gl, pure, dl, SGI-specific modules
  
diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index 47c4bc1..b169133 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -1,11 +1,11 @@
 Rebased for python-2.7.9
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-2.7.9/configure.ac
+Index: Python-2.7.12/configure.ac
 ===================================================================
---- Python-2.7.9.orig/configure.ac
-+++ Python-2.7.9/configure.ac
-@@ -736,6 +736,10 @@ SunOS*)
+--- Python-2.7.12.orig/configure.ac
++++ Python-2.7.12/configure.ac
+@@ -756,6 +756,10 @@ SunOS*)
      ;;
  esac
  
@@ -16,10 +16,10 @@ Index: Python-2.7.9/configure.ac
  
  AC_SUBST(LIBRARY)
  AC_MSG_CHECKING(LIBRARY)
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
@@ -28,10 +28,10 @@ Index: Python-2.7.9/Include/pythonrun.h
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
  
@@ -50,10 +50,10 @@ Index: Python-2.7.9/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-2.7.9/Lib/distutils/sysconfig.py
+Index: Python-2.7.12/Lib/distutils/sysconfig.py
 ===================================================================
---- Python-2.7.9.orig/Lib/distutils/sysconfig.py
-+++ Python-2.7.9/Lib/distutils/sysconfig.py
+--- Python-2.7.12.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.12/Lib/distutils/sysconfig.py
 @@ -119,8 +119,11 @@ def get_python_lib(plat_specific=0, stan
          prefix = plat_specific and EXEC_PREFIX or PREFIX
  
@@ -68,11 +68,11 @@ Index: Python-2.7.9/Lib/distutils/sysconfig.py
          if standard_lib:
              return libpython
          else:
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
@@ -81,10 +81,10 @@ Index: Python-2.7.9/Lib/pydoc.py
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
 @@ -288,13 +288,18 @@ def getsitepackages():
          if sys.platform in ('os2emx', 'riscos'):
              sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
@@ -107,10 +107,10 @@ Index: Python-2.7.9/Lib/site.py
          if sys.platform == "darwin":
              # for framework builds *only* we add the standard Apple
              # locations.
-Index: Python-2.7.9/Lib/sysconfig.py
+Index: Python-2.7.12/Lib/sysconfig.py
 ===================================================================
---- Python-2.7.9.orig/Lib/sysconfig.py
-+++ Python-2.7.9/Lib/sysconfig.py
+--- Python-2.7.12.orig/Lib/sysconfig.py
++++ Python-2.7.12/Lib/sysconfig.py
 @@ -7,10 +7,10 @@ from os.path import pardir, realpath
  
  _INSTALL_SCHEMES = {
@@ -139,10 +139,10 @@ Index: Python-2.7.9/Lib/sysconfig.py
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
          'data'   : '{userbase}',
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
@@ -157,11 +157,11 @@ Index: Python-2.7.9/Lib/test/test_dl.py
      ('/usr/bin/cygwin1.dll', 'getpid'),
      ('/usr/lib/libc.dylib', 'getpid'),
      ]
-Index: Python-2.7.9/Lib/test/test_site.py
+Index: Python-2.7.12/Lib/test/test_site.py
 ===================================================================
---- Python-2.7.9.orig/Lib/test/test_site.py
-+++ Python-2.7.9/Lib/test/test_site.py
-@@ -241,12 +241,16 @@ class HelperFunctionsTests(unittest.Test
+--- Python-2.7.12.orig/Lib/test/test_site.py
++++ Python-2.7.12/Lib/test/test_site.py
+@@ -246,12 +246,16 @@ class HelperFunctionsTests(unittest.Test
              self.assertEqual(dirs[2], wanted)
          elif os.sep == '/':
              # OS X non-framwework builds, Linux, FreeBSD, etc
@@ -181,10 +181,10 @@ Index: Python-2.7.9/Lib/test/test_site.py
          else:
              # other platforms
              self.assertEqual(len(dirs), 2)
-Index: Python-2.7.9/Lib/trace.py
+Index: Python-2.7.12/Lib/trace.py
 ===================================================================
---- Python-2.7.9.orig/Lib/trace.py
-+++ Python-2.7.9/Lib/trace.py
+--- Python-2.7.12.orig/Lib/trace.py
++++ Python-2.7.12/Lib/trace.py
 @@ -754,10 +754,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
@@ -198,11 +198,11 @@ Index: Python-2.7.9/Lib/trace.py
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
@@ -210,7 +210,7 @@ Index: Python-2.7.9/Makefile.pre.in
  
  # Multiarch directory (may be empty)
  MULTIARCH=	@MULTIARCH@
-@@ -106,7 +107,7 @@ LIBDIR=		@libdir@
+@@ -111,7 +112,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -219,7 +219,7 @@ Index: Python-2.7.9/Makefile.pre.in
  
  # Detailed destination directories
  BINLIBDEST=	$(LIBDIR)/python$(VERSION)
-@@ -598,6 +599,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -670,6 +671,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -227,7 +227,7 @@ Index: Python-2.7.9/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -640,7 +642,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
+@@ -721,7 +723,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -236,25 +236,25 @@ Index: Python-2.7.9/Makefile.pre.in
  
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
 +              EXEC_PREFIX "/" LIB_PYTHON "/lib-dynload"
- #endif
- 
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
@@ -263,10 +263,10 @@ Index: Python-2.7.9/Modules/getpath.c
  
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
@@ -281,10 +281,10 @@ Index: Python-2.7.9/Python/getplatform.c
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
diff --git a/meta/recipes-devtools/python/python_2.7.11.bb b/meta/recipes-devtools/python/python_2.7.12.bb
similarity index 98%
rename from meta/recipes-devtools/python/python_2.7.11.bb
rename to meta/recipes-devtools/python/python_2.7.12.bb
index 1e4a30d..3ee1e38 100644
--- a/meta/recipes-devtools/python/python_2.7.11.bb
+++ b/meta/recipes-devtools/python/python_2.7.12.bb
@@ -25,9 +25,7 @@ SRC_URI += "\
   file://run-ptest \
   file://parallel-makeinst-create-bindir.patch \
   file://use_sysroot_ncurses_instead_of_host.patch \
-  file://avoid_parallel_make_races_on_pgen.patch \
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
-  file://CVE-2016-5636.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.6.6



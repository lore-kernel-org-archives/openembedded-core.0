Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E56B7890D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651936"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:09 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:51 +0200
Message-Id: <20180309185614.31113-13-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/36] python: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:11 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../python/python-native/multilib.patch            |  78 ++++++-------
 .../add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  12 +-
 .../python/python/fix-makefile-for-ptest.patch     |  13 ++-
 meta/recipes-devtools/python/python/multilib.patch |  98 ++++++++---------
 .../python/python3/python-3.3-multilib.patch       | 121 ++++++++++-----------
 ...-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  12 +-
 6 files changed, 166 insertions(+), 168 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native/multilib.patch b/meta/recipes-devtools/python/python-native/multilib.patch
index ad460850945..af0f173c6d1 100644
--- a/meta/recipes-devtools/python/python-native/multilib.patch
+++ b/meta/recipes-devtools/python/python-native/multilib.patch
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: Python-2.7.13/Include/pythonrun.h
+Index: Python-2.7.14/Include/pythonrun.h
 ===================================================================
---- Python-2.7.13.orig/Include/pythonrun.h
-+++ Python-2.7.13/Include/pythonrun.h
+--- Python-2.7.14.orig/Include/pythonrun.h
++++ Python-2.7.14/Include/pythonrun.h
 @@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
@@ -24,10 +24,10 @@ Index: Python-2.7.13/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-2.7.13/Lib/distutils/command/install.py
+Index: Python-2.7.14/Lib/distutils/command/install.py
 ===================================================================
---- Python-2.7.13.orig/Lib/distutils/command/install.py
-+++ Python-2.7.13/Lib/distutils/command/install.py
+--- Python-2.7.14.orig/Lib/distutils/command/install.py
++++ Python-2.7.14/Lib/distutils/command/install.py
 @@ -22,6 +22,8 @@ from site import USER_BASE
  from site import USER_SITE
  
@@ -46,10 +46,10 @@ Index: Python-2.7.13/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-2.7.13/Lib/pydoc.py
+Index: Python-2.7.14/Lib/pydoc.py
 ===================================================================
---- Python-2.7.13.orig/Lib/pydoc.py
-+++ Python-2.7.13/Lib/pydoc.py
+--- Python-2.7.14.orig/Lib/pydoc.py
++++ Python-2.7.14/Lib/pydoc.py
 @@ -375,7 +375,7 @@ class Doc:
      docmodule = docclass = docroutine = docother = docproperty = docdata = fail
  
@@ -59,10 +59,10 @@ Index: Python-2.7.13/Lib/pydoc.py
                                         "python"+sys.version[0:3])):
          """Return the location of module docs or None"""
  
-Index: Python-2.7.13/Lib/site.py
+Index: Python-2.7.14/Lib/site.py
 ===================================================================
---- Python-2.7.13.orig/Lib/site.py
-+++ Python-2.7.13/Lib/site.py
+--- Python-2.7.14.orig/Lib/site.py
++++ Python-2.7.14/Lib/site.py
 @@ -288,13 +288,19 @@ def getsitepackages():
          if sys.platform in ('os2emx', 'riscos'):
              sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
@@ -86,10 +86,10 @@ Index: Python-2.7.13/Lib/site.py
      return sitepackages
  
  def addsitepackages(known_paths):
-Index: Python-2.7.13/Lib/test/test_dl.py
+Index: Python-2.7.14/Lib/test/test_dl.py
 ===================================================================
---- Python-2.7.13.orig/Lib/test/test_dl.py
-+++ Python-2.7.13/Lib/test/test_dl.py
+--- Python-2.7.14.orig/Lib/test/test_dl.py
++++ Python-2.7.14/Lib/test/test_dl.py
 @@ -4,10 +4,11 @@
  import unittest
  from test.test_support import verbose, import_module
@@ -104,10 +104,10 @@ Index: Python-2.7.13/Lib/test/test_dl.py
      ('/usr/bin/cygwin1.dll', 'getpid'),
      ('/usr/lib/libc.dylib', 'getpid'),
      ]
-Index: Python-2.7.13/Lib/trace.py
+Index: Python-2.7.14/Lib/trace.py
 ===================================================================
---- Python-2.7.13.orig/Lib/trace.py
-+++ Python-2.7.13/Lib/trace.py
+--- Python-2.7.14.orig/Lib/trace.py
++++ Python-2.7.14/Lib/trace.py
 @@ -754,10 +754,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
@@ -121,11 +121,11 @@ Index: Python-2.7.13/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-2.7.13/Makefile.pre.in
+Index: Python-2.7.14/Makefile.pre.in
 ===================================================================
---- Python-2.7.13.orig/Makefile.pre.in
-+++ Python-2.7.13/Makefile.pre.in
-@@ -92,6 +92,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
+--- Python-2.7.14.orig/Makefile.pre.in
++++ Python-2.7.14/Makefile.pre.in
+@@ -91,6 +91,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
@@ -133,7 +133,7 @@ Index: Python-2.7.13/Makefile.pre.in
  
  # Multiarch directory (may be empty)
  MULTIARCH=	@MULTIARCH@
-@@ -111,7 +112,7 @@ LIBDIR=		@libdir@
+@@ -110,7 +111,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -142,7 +142,7 @@ Index: Python-2.7.13/Makefile.pre.in
  
  # Detailed destination directories
  BINLIBDEST=	$(LIBDIR)/python$(VERSION)
-@@ -668,6 +669,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -644,6 +645,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -150,8 +150,8 @@ Index: Python-2.7.13/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -708,7 +710,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
- Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
+@@ -692,7 +694,7 @@ regen-ast:
+ Python/compile.o Python/symtable.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
 -		$(CC) -c $(PY_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
@@ -159,10 +159,10 @@ Index: Python-2.7.13/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-2.7.13/Modules/getpath.c
+Index: Python-2.7.14/Modules/getpath.c
 ===================================================================
---- Python-2.7.13.orig/Modules/getpath.c
-+++ Python-2.7.13/Modules/getpath.c
+--- Python-2.7.14.orig/Modules/getpath.c
++++ Python-2.7.14/Modules/getpath.c
 @@ -100,6 +100,13 @@
  #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
  #endif
@@ -186,10 +186,10 @@ Index: Python-2.7.13/Modules/getpath.c
  
  static void
  reduce(char *dir)
-Index: Python-2.7.13/Python/getplatform.c
+Index: Python-2.7.14/Python/getplatform.c
 ===================================================================
---- Python-2.7.13.orig/Python/getplatform.c
-+++ Python-2.7.13/Python/getplatform.c
+--- Python-2.7.14.orig/Python/getplatform.c
++++ Python-2.7.14/Python/getplatform.c
 @@ -10,3 +10,13 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -204,10 +204,10 @@ Index: Python-2.7.13/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-2.7.13/Python/sysmodule.c
+Index: Python-2.7.14/Python/sysmodule.c
 ===================================================================
---- Python-2.7.13.orig/Python/sysmodule.c
-+++ Python-2.7.13/Python/sysmodule.c
+--- Python-2.7.14.orig/Python/sysmodule.c
++++ Python-2.7.14/Python/sysmodule.c
 @@ -1437,6 +1437,8 @@ _PySys_Init(void)
                          PyString_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
@@ -217,11 +217,11 @@ Index: Python-2.7.13/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyString_FromString(Py_GetProgramFullPath()));
      SET_SYS_FROM_STRING("prefix",
-Index: Python-2.7.13/configure.ac
+Index: Python-2.7.14/configure.ac
 ===================================================================
---- Python-2.7.13.orig/configure.ac
-+++ Python-2.7.13/configure.ac
-@@ -759,6 +759,11 @@ SunOS*)
+--- Python-2.7.14.orig/configure.ac
++++ Python-2.7.14/configure.ac
+@@ -758,6 +758,11 @@ SunOS*)
      ;;
  esac
  
diff --git a/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
index 506debaf761..329734064bd 100644
--- a/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
+++ b/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
@@ -13,16 +13,16 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: Python-2.7.13/configure.ac
+Index: Python-2.7.14/configure.ac
 ===================================================================
---- Python-2.7.13.orig/configure.ac
-+++ Python-2.7.13/configure.ac
-@@ -33,7 +33,7 @@ if test "$cross_compiling" = yes; then
+--- Python-2.7.14.orig/configure.ac
++++ Python-2.7.14/configure.ac
+@@ -36,7 +36,7 @@ if test "$cross_compiling" = yes; then
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
          AC_MSG_RESULT($interp)
 -	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
 +	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
      fi
-     # Used to comment out stuff for rebuilding generated files
-     GENERATED_COMMENT='#'
+ elif test "$cross_compiling" = maybe; then
+     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
diff --git a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
index 90dcd57c048..60d782cd26b 100644
--- a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
+++ b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
@@ -4,12 +4,13 @@ cross-compiled.
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
 ---
-diff -ruN a/Makefile.pre.in b/Makefile.pre.in
---- a/Makefile.pre.in	2013-06-27 10:44:11.033840532 +0200
-+++ b/Makefile.pre.in	2013-06-27 10:44:39.572635273 +0200
-@@ -709,14 +709,19 @@
- # generated bytecode.  This is sometimes a very shy bug needing a lot of
- # sample data.
+Index: Python-2.7.14/Makefile.pre.in
+===================================================================
+--- Python-2.7.14.orig/Makefile.pre.in
++++ Python-2.7.14/Makefile.pre.in
+@@ -846,14 +846,19 @@ $(LIBRARY_OBJS) $(MODOBJS) Modules/pytho
+ 
+ .PHONY: test testall testuniversal buildbottest pythoninfo
  
 -TESTOPTS=	-l $(EXTRATESTOPTS)
 +TESTOPTS=	-l -v $(EXTRATESTOPTS)
diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index 94fdfeb6302..1116dd518e4 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -1,11 +1,11 @@
 Rebased for python-2.7.9
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 Upstream-Status: Pending
-Index: Python-2.7.13/configure.ac
+Index: Python-2.7.14/configure.ac
 ===================================================================
---- Python-2.7.13.orig/configure.ac
-+++ Python-2.7.13/configure.ac
-@@ -759,6 +759,10 @@ SunOS*)
+--- Python-2.7.14.orig/configure.ac
++++ Python-2.7.14/configure.ac
+@@ -758,6 +758,10 @@ SunOS*)
      ;;
  esac
  
@@ -16,10 +16,10 @@ Index: Python-2.7.13/configure.ac
  
  AC_SUBST(LIBRARY)
  AC_MSG_CHECKING(LIBRARY)
-Index: Python-2.7.13/Include/pythonrun.h
+Index: Python-2.7.14/Include/pythonrun.h
 ===================================================================
---- Python-2.7.13.orig/Include/pythonrun.h
-+++ Python-2.7.13/Include/pythonrun.h
+--- Python-2.7.14.orig/Include/pythonrun.h
++++ Python-2.7.14/Include/pythonrun.h
 @@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
@@ -28,10 +28,10 @@ Index: Python-2.7.13/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-2.7.13/Lib/distutils/command/install.py
+Index: Python-2.7.14/Lib/distutils/command/install.py
 ===================================================================
---- Python-2.7.13.orig/Lib/distutils/command/install.py
-+++ Python-2.7.13/Lib/distutils/command/install.py
+--- Python-2.7.14.orig/Lib/distutils/command/install.py
++++ Python-2.7.14/Lib/distutils/command/install.py
 @@ -22,6 +22,8 @@ from site import USER_BASE
  from site import USER_SITE
  
@@ -52,10 +52,10 @@ Index: Python-2.7.13/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-2.7.13/Lib/distutils/sysconfig.py
+Index: Python-2.7.14/Lib/distutils/sysconfig.py
 ===================================================================
---- Python-2.7.13.orig/Lib/distutils/sysconfig.py
-+++ Python-2.7.13/Lib/distutils/sysconfig.py
+--- Python-2.7.14.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.14/Lib/distutils/sysconfig.py
 @@ -119,8 +119,11 @@ def get_python_lib(plat_specific=0, stan
          prefix = plat_specific and EXEC_PREFIX or PREFIX
  
@@ -70,10 +70,10 @@ Index: Python-2.7.13/Lib/distutils/sysconfig.py
          if standard_lib:
              return libpython
          else:
-Index: Python-2.7.13/Lib/pydoc.py
+Index: Python-2.7.14/Lib/pydoc.py
 ===================================================================
---- Python-2.7.13.orig/Lib/pydoc.py
-+++ Python-2.7.13/Lib/pydoc.py
+--- Python-2.7.14.orig/Lib/pydoc.py
++++ Python-2.7.14/Lib/pydoc.py
 @@ -375,7 +375,7 @@ class Doc:
      docmodule = docclass = docroutine = docother = docproperty = docdata = fail
  
@@ -83,10 +83,10 @@ Index: Python-2.7.13/Lib/pydoc.py
                                         "python"+sys.version[0:3])):
          """Return the location of module docs or None"""
  
-Index: Python-2.7.13/Lib/site.py
+Index: Python-2.7.14/Lib/site.py
 ===================================================================
---- Python-2.7.13.orig/Lib/site.py
-+++ Python-2.7.13/Lib/site.py
+--- Python-2.7.14.orig/Lib/site.py
++++ Python-2.7.14/Lib/site.py
 @@ -288,13 +288,18 @@ def getsitepackages():
          if sys.platform in ('os2emx', 'riscos'):
              sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
@@ -109,10 +109,10 @@ Index: Python-2.7.13/Lib/site.py
      return sitepackages
  
  def addsitepackages(known_paths):
-Index: Python-2.7.13/Lib/sysconfig.py
+Index: Python-2.7.14/Lib/sysconfig.py
 ===================================================================
---- Python-2.7.13.orig/Lib/sysconfig.py
-+++ Python-2.7.13/Lib/sysconfig.py
+--- Python-2.7.14.orig/Lib/sysconfig.py
++++ Python-2.7.14/Lib/sysconfig.py
 @@ -7,10 +7,10 @@ from os.path import pardir, realpath
  
  _INSTALL_SCHEMES = {
@@ -141,10 +141,10 @@ Index: Python-2.7.13/Lib/sysconfig.py
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
          'data'   : '{userbase}',
-Index: Python-2.7.13/Lib/test/test_dl.py
+Index: Python-2.7.14/Lib/test/test_dl.py
 ===================================================================
---- Python-2.7.13.orig/Lib/test/test_dl.py
-+++ Python-2.7.13/Lib/test/test_dl.py
+--- Python-2.7.14.orig/Lib/test/test_dl.py
++++ Python-2.7.14/Lib/test/test_dl.py
 @@ -4,10 +4,11 @@
  import unittest
  from test.test_support import verbose, import_module
@@ -159,11 +159,11 @@ Index: Python-2.7.13/Lib/test/test_dl.py
      ('/usr/bin/cygwin1.dll', 'getpid'),
      ('/usr/lib/libc.dylib', 'getpid'),
      ]
-Index: Python-2.7.13/Lib/test/test_site.py
+Index: Python-2.7.14/Lib/test/test_site.py
 ===================================================================
---- Python-2.7.13.orig/Lib/test/test_site.py
-+++ Python-2.7.13/Lib/test/test_site.py
-@@ -235,12 +235,16 @@ class HelperFunctionsTests(unittest.Test
+--- Python-2.7.14.orig/Lib/test/test_site.py
++++ Python-2.7.14/Lib/test/test_site.py
+@@ -252,12 +252,16 @@ class HelperFunctionsTests(unittest.Test
              self.assertEqual(dirs[0], wanted)
          elif os.sep == '/':
              # OS X, Linux, FreeBSD, etc
@@ -183,10 +183,10 @@ Index: Python-2.7.13/Lib/test/test_site.py
          else:
              # other platforms
              self.assertEqual(len(dirs), 2)
-Index: Python-2.7.13/Lib/trace.py
+Index: Python-2.7.14/Lib/trace.py
 ===================================================================
---- Python-2.7.13.orig/Lib/trace.py
-+++ Python-2.7.13/Lib/trace.py
+--- Python-2.7.14.orig/Lib/trace.py
++++ Python-2.7.14/Lib/trace.py
 @@ -754,10 +754,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
@@ -200,11 +200,11 @@ Index: Python-2.7.13/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-2.7.13/Makefile.pre.in
+Index: Python-2.7.14/Makefile.pre.in
 ===================================================================
---- Python-2.7.13.orig/Makefile.pre.in
-+++ Python-2.7.13/Makefile.pre.in
-@@ -92,6 +92,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
+--- Python-2.7.14.orig/Makefile.pre.in
++++ Python-2.7.14/Makefile.pre.in
+@@ -91,6 +91,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
@@ -212,7 +212,7 @@ Index: Python-2.7.13/Makefile.pre.in
  
  # Multiarch directory (may be empty)
  MULTIARCH=	@MULTIARCH@
-@@ -111,7 +112,7 @@ LIBDIR=		@libdir@
+@@ -110,7 +111,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -221,7 +221,7 @@ Index: Python-2.7.13/Makefile.pre.in
  
  # Detailed destination directories
  BINLIBDEST=	$(LIBDIR)/python$(VERSION)
-@@ -669,6 +670,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -645,6 +646,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -229,8 +229,8 @@ Index: Python-2.7.13/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -709,7 +711,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
- Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
+@@ -693,7 +695,7 @@ regen-ast:
+ Python/compile.o Python/symtable.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
 -		$(CC) -c $(PY_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
@@ -238,10 +238,10 @@ Index: Python-2.7.13/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-2.7.13/Modules/getpath.c
+Index: Python-2.7.14/Modules/getpath.c
 ===================================================================
---- Python-2.7.13.orig/Modules/getpath.c
-+++ Python-2.7.13/Modules/getpath.c
+--- Python-2.7.14.orig/Modules/getpath.c
++++ Python-2.7.14/Modules/getpath.c
 @@ -100,6 +100,13 @@
  #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
  #endif
@@ -265,10 +265,10 @@ Index: Python-2.7.13/Modules/getpath.c
  
  static void
  reduce(char *dir)
-Index: Python-2.7.13/Python/getplatform.c
+Index: Python-2.7.14/Python/getplatform.c
 ===================================================================
---- Python-2.7.13.orig/Python/getplatform.c
-+++ Python-2.7.13/Python/getplatform.c
+--- Python-2.7.14.orig/Python/getplatform.c
++++ Python-2.7.14/Python/getplatform.c
 @@ -10,3 +10,13 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -283,10 +283,10 @@ Index: Python-2.7.13/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-2.7.13/Python/sysmodule.c
+Index: Python-2.7.14/Python/sysmodule.c
 ===================================================================
---- Python-2.7.13.orig/Python/sysmodule.c
-+++ Python-2.7.13/Python/sysmodule.c
+--- Python-2.7.14.orig/Python/sysmodule.c
++++ Python-2.7.14/Python/sysmodule.c
 @@ -1437,6 +1437,8 @@ _PySys_Init(void)
                          PyString_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 08c4403cbfa..77da6159c90 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -25,10 +25,10 @@ Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
  setup.py                         |  9 ++++-----
  12 files changed, 97 insertions(+), 23 deletions(-)
 
-diff --git a/Include/pythonrun.h b/Include/pythonrun.h
-index 9c2e813..2f79cb6 100644
---- a/Include/pythonrun.h
-+++ b/Include/pythonrun.h
+Index: Python-3.5.4/Include/pythonrun.h
+===================================================================
+--- Python-3.5.4.orig/Include/pythonrun.h
++++ Python-3.5.4/Include/pythonrun.h
 @@ -23,6 +23,9 @@ typedef struct {
  } PyCompilerFlags;
  #endif
@@ -39,10 +39,10 @@ index 9c2e813..2f79cb6 100644
  #ifndef Py_LIMITED_API
  PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
  PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerFlags *);
-diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/install.py
-index 67db007..b46b45b 100644
---- a/Lib/distutils/command/install.py
-+++ b/Lib/distutils/command/install.py
+Index: Python-3.5.4/Lib/distutils/command/install.py
+===================================================================
+--- Python-3.5.4.orig/Lib/distutils/command/install.py
++++ Python-3.5.4/Lib/distutils/command/install.py
 @@ -19,6 +19,8 @@ from site import USER_BASE
  from site import USER_SITE
  HAS_USER_SITE = True
@@ -61,11 +61,11 @@ index 67db007..b46b45b 100644
          'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-diff --git a/Lib/pydoc.py b/Lib/pydoc.py
-index 3ca08c9..6528730 100755
---- a/Lib/pydoc.py
-+++ b/Lib/pydoc.py
-@@ -384,7 +384,7 @@ class Doc:
+Index: Python-3.5.4/Lib/pydoc.py
+===================================================================
+--- Python-3.5.4.orig/Lib/pydoc.py
++++ Python-3.5.4/Lib/pydoc.py
+@@ -389,7 +389,7 @@ class Doc:
      docmodule = docclass = docroutine = docother = docproperty = docdata = fail
  
      def getdocloc(self, object,
@@ -74,10 +74,10 @@ index 3ca08c9..6528730 100755
                                         "python%d.%d" %  sys.version_info[:2])):
          """Return the location of module docs or None"""
  
-diff --git a/Lib/site.py b/Lib/site.py
-index 3f78ef5..511931e 100644
---- a/Lib/site.py
-+++ b/Lib/site.py
+Index: Python-3.5.4/Lib/site.py
+===================================================================
+--- Python-3.5.4.orig/Lib/site.py
++++ Python-3.5.4/Lib/site.py
 @@ -303,12 +303,12 @@ def getsitepackages(prefixes=None):
          seen.add(prefix)
  
@@ -93,10 +93,10 @@ index 3f78ef5..511931e 100644
          if sys.platform == "darwin":
              # for framework builds *only* we add the standard Apple
              # locations.
-diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 9c34be0..3d1181a 100644
---- a/Lib/sysconfig.py
-+++ b/Lib/sysconfig.py
+Index: Python-3.5.4/Lib/sysconfig.py
+===================================================================
+--- Python-3.5.4.orig/Lib/sysconfig.py
++++ Python-3.5.4/Lib/sysconfig.py
 @@ -20,10 +20,10 @@ __all__ = [
  
  _INSTALL_SCHEMES = {
@@ -139,10 +139,10 @@ index 9c34be0..3d1181a 100644
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
          'data': '{userbase}',
-diff --git a/Lib/trace.py b/Lib/trace.py
-index f108266..7fd83f2 100755
---- a/Lib/trace.py
-+++ b/Lib/trace.py
+Index: Python-3.5.4/Lib/trace.py
+===================================================================
+--- Python-3.5.4.orig/Lib/trace.py
++++ Python-3.5.4/Lib/trace.py
 @@ -749,10 +749,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
@@ -156,11 +156,11 @@ index f108266..7fd83f2 100755
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 109f402..61a41e2 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -106,6 +106,8 @@ PY_CORE_CFLAGS=	$(PY_CFLAGS) $(PY_CFLAGS_NODIST) $(PY_CPPFLAGS) $(CFLAGSFORSHARE
+Index: Python-3.5.4/Makefile.pre.in
+===================================================================
+--- Python-3.5.4.orig/Makefile.pre.in
++++ Python-3.5.4/Makefile.pre.in
+@@ -109,6 +109,8 @@ CFLAGS_ALIASING=@CFLAGS_ALIASING@
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
@@ -169,7 +169,7 @@ index 109f402..61a41e2 100644
  
  # Multiarch directory (may be empty)
  MULTIARCH=	@MULTIARCH@
-@@ -125,7 +127,7 @@ LIBDIR=		@libdir@
+@@ -128,7 +130,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -178,7 +178,7 @@ index 109f402..61a41e2 100644
  ABIFLAGS=	@ABIFLAGS@
  
  # Detailed destination directories
-@@ -755,6 +757,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
+@@ -731,6 +733,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -186,8 +186,8 @@ index 109f402..61a41e2 100644
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Programs/python.o: $(srcdir)/Programs/python.c
-@@ -835,7 +838,7 @@ $(OPCODE_H): $(srcdir)/Lib/opcode.py $(OPCODE_H_SCRIPT)
- Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
+@@ -813,7 +816,7 @@ regen-opcode:
+ Python/compile.o Python/symtable.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
 -		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
@@ -195,10 +195,10 @@ index 109f402..61a41e2 100644
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-diff --git a/Modules/getpath.c b/Modules/getpath.c
-index 18deb60..a01c3f8 100644
---- a/Modules/getpath.c
-+++ b/Modules/getpath.c
+Index: Python-3.5.4/Modules/getpath.c
+===================================================================
+--- Python-3.5.4.orig/Modules/getpath.c
++++ Python-3.5.4/Modules/getpath.c
 @@ -105,6 +105,13 @@
  #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
  #endif
@@ -230,10 +230,10 @@ index 18deb60..a01c3f8 100644
  
      if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
          Py_FatalError(
-diff --git a/Python/getplatform.c b/Python/getplatform.c
-index 6899140..66a49c6 100644
---- a/Python/getplatform.c
-+++ b/Python/getplatform.c
+Index: Python-3.5.4/Python/getplatform.c
+===================================================================
+--- Python-3.5.4.orig/Python/getplatform.c
++++ Python-3.5.4/Python/getplatform.c
 @@ -10,3 +10,23 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -258,11 +258,11 @@ index 6899140..66a49c6 100644
 +{
 +	return LIB;
 +}
-diff --git a/Python/sysmodule.c b/Python/sysmodule.c
-index 8d7e05a..d9dee0f 100644
---- a/Python/sysmodule.c
-+++ b/Python/sysmodule.c
-@@ -1790,6 +1790,10 @@ _PySys_Init(void)
+Index: Python-3.5.4/Python/sysmodule.c
+===================================================================
+--- Python-3.5.4.orig/Python/sysmodule.c
++++ Python-3.5.4/Python/sysmodule.c
+@@ -1827,6 +1827,10 @@ _PySys_Init(void)
                          PyUnicode_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
                          PyUnicode_FromString(Py_GetPlatform()));
@@ -273,11 +273,11 @@ index 8d7e05a..d9dee0f 100644
      SET_SYS_FROM_STRING("executable",
                          PyUnicode_FromWideChar(
                                 Py_GetProgramFullPath(), -1));
-diff --git a/configure.ac b/configure.ac
-index 707324d..e8d59a3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -883,6 +883,41 @@ PLATDIR=plat-$MACHDEP
+Index: Python-3.5.4/configure.ac
+===================================================================
+--- Python-3.5.4.orig/configure.ac
++++ Python-3.5.4/configure.ac
+@@ -885,6 +885,41 @@ PLATDIR=plat-$MACHDEP
  AC_SUBST(PLATDIR)
  AC_SUBST(PLATFORM_TRIPLET)
  
@@ -319,11 +319,11 @@ index 707324d..e8d59a3 100644
  
  AC_MSG_CHECKING([for -Wl,--no-as-needed])
  save_LDFLAGS="$LDFLAGS"
-diff --git a/setup.py b/setup.py
-index 6d26deb..7b14215 100644
---- a/setup.py
-+++ b/setup.py
-@@ -495,7 +495,7 @@ class PyBuildExt(build_ext):
+Index: Python-3.5.4/setup.py
+===================================================================
+--- Python-3.5.4.orig/setup.py
++++ Python-3.5.4/setup.py
+@@ -494,7 +494,7 @@ class PyBuildExt(build_ext):
          # directories (i.e. '.' and 'Include') must be first.  See issue
          # 10520.
          if not cross_compiling:
@@ -332,7 +332,7 @@ index 6d26deb..7b14215 100644
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
-@@ -553,8 +553,7 @@ class PyBuildExt(build_ext):
+@@ -552,8 +552,7 @@ class PyBuildExt(build_ext):
          # be assumed that no additional -I,-L directives are needed.
          if not cross_compiling:
              lib_dirs = self.compiler.library_dirs + [
@@ -342,7 +342,7 @@ index 6d26deb..7b14215 100644
                  ]
              inc_dirs = self.compiler.include_dirs + ['/usr/include']
          else:
-@@ -746,11 +745,11 @@ class PyBuildExt(build_ext):
+@@ -745,11 +744,11 @@ class PyBuildExt(build_ext):
              elif curses_library:
                  readline_libs.append(curses_library)
              elif self.compiler.find_library_file(lib_dirs +
@@ -356,6 +356,3 @@ index 6d26deb..7b14215 100644
                                     extra_link_args=readline_extra_link_args,
                                     libraries=readline_libs) )
          else:
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
index 211f9e78890..a4f8bd47107 100644
--- a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
+++ b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
@@ -10,16 +10,16 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: Python-3.5.3/configure.ac
+Index: Python-3.5.4/configure.ac
 ===================================================================
---- Python-3.5.3.orig/configure.ac
-+++ Python-3.5.3/configure.ac
-@@ -78,7 +78,7 @@ if test "$cross_compiling" = yes; then
+--- Python-3.5.4.orig/configure.ac
++++ Python-3.5.4/configure.ac
+@@ -73,7 +73,7 @@ if test "$cross_compiling" = yes; then
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
          AC_MSG_RESULT($interp)
 -	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
 +	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH) '$interp
      fi
-     # Used to comment out stuff for rebuilding generated files
-     GENERATED_COMMENT='#'
+ elif test "$cross_compiling" = maybe; then
+     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
-- 
2.16.1



Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5286D60685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:55:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2017 22:55:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,277,1477983600"; d="scan'208";a="51823393"
Received: from marosale-mobl.amr.corp.intel.com (HELO
	aehernan-MOBL1.amr.corp.intel.com) ([10.252.255.235])
	by orsmga004.jf.intel.com with ESMTP; 23 Jan 2017 22:55:09 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 00:55:06 -0600
Message-Id: <20170124065506.9508-1-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH] python: Upgrade both python and python-native to 2.7.13
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
X-List-Received-Date: Tue, 24 Jan 2017 06:55:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rebased:
- python-native/multilib.patch
- python/multilib.patch
- python/01-use-proper-tools-for-cross-build.patch

Upstream:
- CVE-2016-1000110

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/python-native/multilib.patch            |  96 ++++++------
 ...on-native_2.7.12.bb => python-native_2.7.13.bb} |   0
 meta/recipes-devtools/python/python.inc            |   4 +-
 .../01-use-proper-tools-for-cross-build.patch      |  34 ++---
 meta/recipes-devtools/python/python/multilib.patch | 118 +++++++--------
 .../python/python-fix-CVE-2016-1000110.patch       | 162 ---------------------
 .../python/{python_2.7.12.bb => python_2.7.13.bb}  |   1 -
 7 files changed, 126 insertions(+), 289 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.12.bb => python-native_2.7.13.bb} (100%)
 delete mode 100644 meta/recipes-devtools/python/python/python-fix-CVE-2016-1000110.patch
 rename meta/recipes-devtools/python/{python_2.7.12.bb => python_2.7.13.bb} (99%)

diff --git a/meta/recipes-devtools/python/python-native/multilib.patch b/meta/recipes-devtools/python/python-native/multilib.patch
index 916b40f..ad46085 100644
--- a/meta/recipes-devtools/python/python-native/multilib.patch
+++ b/meta/recipes-devtools/python/python-native/multilib.patch
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: Python-2.7.12/Include/pythonrun.h
+Index: Python-2.7.13/Include/pythonrun.h
 ===================================================================
---- Python-2.7.12.orig/Include/pythonrun.h
-+++ Python-2.7.12/Include/pythonrun.h
+--- Python-2.7.13.orig/Include/pythonrun.h
++++ Python-2.7.13/Include/pythonrun.h
 @@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
@@ -24,10 +24,10 @@ Index: Python-2.7.12/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-2.7.12/Lib/distutils/command/install.py
+Index: Python-2.7.13/Lib/distutils/command/install.py
 ===================================================================
---- Python-2.7.12.orig/Lib/distutils/command/install.py
-+++ Python-2.7.12/Lib/distutils/command/install.py
+--- Python-2.7.13.orig/Lib/distutils/command/install.py
++++ Python-2.7.13/Lib/distutils/command/install.py
 @@ -22,6 +22,8 @@ from site import USER_BASE
  from site import USER_SITE
  
@@ -46,23 +46,23 @@ Index: Python-2.7.12/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-2.7.12/Lib/pydoc.py
+Index: Python-2.7.13/Lib/pydoc.py
 ===================================================================
---- Python-2.7.12.orig/Lib/pydoc.py
-+++ Python-2.7.12/Lib/pydoc.py
-@@ -384,7 +384,7 @@ class Doc:
- 
-         docloc = os.environ.get("PYTHONDOCS",
-                                 "http://docs.python.org/library")
--        basedir = os.path.join(sys.exec_prefix, "lib",
-+        basedir = os.path.join(sys.exec_prefix, sys.lib,
-                                "python"+sys.version[0:3])
-         if (isinstance(object, type(os)) and
-             (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-2.7.12/Lib/site.py
+--- Python-2.7.13.orig/Lib/pydoc.py
++++ Python-2.7.13/Lib/pydoc.py
+@@ -375,7 +375,7 @@ class Doc:
+     docmodule = docclass = docroutine = docother = docproperty = docdata = fail
+ 
+     def getdocloc(self, object,
+-                  basedir=os.path.join(sys.exec_prefix, "lib",
++                  basedir=os.path.join(sys.exec_prefix, "sys.lib",
+                                        "python"+sys.version[0:3])):
+         """Return the location of module docs or None"""
+ 
+Index: Python-2.7.13/Lib/site.py
 ===================================================================
---- Python-2.7.12.orig/Lib/site.py
-+++ Python-2.7.12/Lib/site.py
+--- Python-2.7.13.orig/Lib/site.py
++++ Python-2.7.13/Lib/site.py
 @@ -288,13 +288,19 @@ def getsitepackages():
          if sys.platform in ('os2emx', 'riscos'):
              sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
@@ -83,13 +83,13 @@ Index: Python-2.7.12/Lib/site.py
              sitepackages.append(prefix)
 -            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
 +            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
-         if sys.platform == "darwin":
-             # for framework builds *only* we add the standard Apple
-             # locations.
-Index: Python-2.7.12/Lib/test/test_dl.py
+     return sitepackages
+ 
+ def addsitepackages(known_paths):
+Index: Python-2.7.13/Lib/test/test_dl.py
 ===================================================================
---- Python-2.7.12.orig/Lib/test/test_dl.py
-+++ Python-2.7.12/Lib/test/test_dl.py
+--- Python-2.7.13.orig/Lib/test/test_dl.py
++++ Python-2.7.13/Lib/test/test_dl.py
 @@ -4,10 +4,11 @@
  import unittest
  from test.test_support import verbose, import_module
@@ -104,10 +104,10 @@ Index: Python-2.7.12/Lib/test/test_dl.py
      ('/usr/bin/cygwin1.dll', 'getpid'),
      ('/usr/lib/libc.dylib', 'getpid'),
      ]
-Index: Python-2.7.12/Lib/trace.py
+Index: Python-2.7.13/Lib/trace.py
 ===================================================================
---- Python-2.7.12.orig/Lib/trace.py
-+++ Python-2.7.12/Lib/trace.py
+--- Python-2.7.13.orig/Lib/trace.py
++++ Python-2.7.13/Lib/trace.py
 @@ -754,10 +754,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
@@ -121,10 +121,10 @@ Index: Python-2.7.12/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-2.7.12/Makefile.pre.in
+Index: Python-2.7.13/Makefile.pre.in
 ===================================================================
---- Python-2.7.12.orig/Makefile.pre.in
-+++ Python-2.7.12/Makefile.pre.in
+--- Python-2.7.13.orig/Makefile.pre.in
++++ Python-2.7.13/Makefile.pre.in
 @@ -92,6 +92,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
  
  # Machine-dependent subdirectories
@@ -142,7 +142,7 @@ Index: Python-2.7.12/Makefile.pre.in
  
  # Detailed destination directories
  BINLIBDEST=	$(LIBDIR)/python$(VERSION)
-@@ -669,6 +670,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -668,6 +669,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -150,7 +150,7 @@ Index: Python-2.7.12/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -720,7 +722,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
+@@ -708,7 +710,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -159,10 +159,10 @@ Index: Python-2.7.12/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-2.7.12/Modules/getpath.c
+Index: Python-2.7.13/Modules/getpath.c
 ===================================================================
---- Python-2.7.12.orig/Modules/getpath.c
-+++ Python-2.7.12/Modules/getpath.c
+--- Python-2.7.13.orig/Modules/getpath.c
++++ Python-2.7.13/Modules/getpath.c
 @@ -100,6 +100,13 @@
  #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
  #endif
@@ -186,10 +186,10 @@ Index: Python-2.7.12/Modules/getpath.c
  
  static void
  reduce(char *dir)
-Index: Python-2.7.12/Python/getplatform.c
+Index: Python-2.7.13/Python/getplatform.c
 ===================================================================
---- Python-2.7.12.orig/Python/getplatform.c
-+++ Python-2.7.12/Python/getplatform.c
+--- Python-2.7.13.orig/Python/getplatform.c
++++ Python-2.7.13/Python/getplatform.c
 @@ -10,3 +10,13 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -204,10 +204,10 @@ Index: Python-2.7.12/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-2.7.12/Python/sysmodule.c
+Index: Python-2.7.13/Python/sysmodule.c
 ===================================================================
---- Python-2.7.12.orig/Python/sysmodule.c
-+++ Python-2.7.12/Python/sysmodule.c
+--- Python-2.7.13.orig/Python/sysmodule.c
++++ Python-2.7.13/Python/sysmodule.c
 @@ -1437,6 +1437,8 @@ _PySys_Init(void)
                          PyString_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
@@ -217,11 +217,11 @@ Index: Python-2.7.12/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyString_FromString(Py_GetProgramFullPath()));
      SET_SYS_FROM_STRING("prefix",
-Index: Python-2.7.12/configure.ac
+Index: Python-2.7.13/configure.ac
 ===================================================================
---- Python-2.7.12.orig/configure.ac
-+++ Python-2.7.12/configure.ac
-@@ -756,6 +756,11 @@ SunOS*)
+--- Python-2.7.13.orig/configure.ac
++++ Python-2.7.13/configure.ac
+@@ -759,6 +759,11 @@ SunOS*)
      ;;
  esac
  
diff --git a/meta/recipes-devtools/python/python-native_2.7.12.bb b/meta/recipes-devtools/python/python-native_2.7.13.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-native_2.7.12.bb
rename to meta/recipes-devtools/python/python-native_2.7.13.bb
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 79a431c..1cc31a5 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6b60258130e4ed10d3101517eb5b9385"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "57dffcee9cee8bb2ab5f82af1d8e9a69"
-SRC_URI[sha256sum] = "d7837121dd5652a05fef807c361909d255d173280c4e1a4ded94d73d80a1f978"
+SRC_URI[md5sum] = "53b43534153bb2a0363f08bae8b9d990"
+SRC_URI[sha256sum] = "35d543986882f78261f97787fd3e06274bfa6df29fac9b4a94f73930ff98f731"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index b2a8c3b..366ce3e 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -9,11 +9,11 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Rebased for python-2.7.9
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-2.7.12/Makefile.pre.in
+Index: Python-2.7.13/Makefile.pre.in
 ===================================================================
---- Python-2.7.12.orig/Makefile.pre.in
-+++ Python-2.7.12/Makefile.pre.in
-@@ -246,6 +246,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+--- Python-2.7.13.orig/Makefile.pre.in
++++ Python-2.7.13/Makefile.pre.in
+@@ -245,6 +245,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
  ##########################################################################
  # Parser
  PGEN=		Parser/pgen$(EXE)
@@ -21,7 +21,7 @@ Index: Python-2.7.12/Makefile.pre.in
  
  PSRCS=		\
  		Parser/acceler.c \
-@@ -513,7 +514,7 @@ $(BUILDPYTHON):	Modules/python.o $(LIBRA
+@@ -512,7 +513,7 @@ $(BUILDPYTHON):	Modules/python.o $(LIBRA
  			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
  
  platform: $(BUILDPYTHON) pybuilddir.txt
@@ -30,16 +30,16 @@ Index: Python-2.7.12/Makefile.pre.in
  
  # Create build directory and generate the sysconfig build-time data there.
  # pybuilddir.txt contains the name of the build dir and is used for
-@@ -684,7 +685,7 @@ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
+@@ -681,7 +682,7 @@ Modules/pwdmodule.o: $(srcdir)/Modules/p
+ 
+ $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)
  	@$(MKDIR_P) Include
- 	# Avoid copying the file onto itself for an in-tree build
- 	if test "$(cross_compiling)" != "yes"; then \
--		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C); \
-+		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C); \
- 	else \
- 		cp $(srcdir)/Include/graminit.h $(GRAMMAR_H).tmp; \
- 		mv $(GRAMMAR_H).tmp $(GRAMMAR_H); \
-@@ -1133,27 +1134,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+-	$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++	$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)
+ 	touch $(GRAMMAR_C)
+ 
+@@ -1121,27 +1122,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
  	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
@@ -73,10 +73,10 @@ Index: Python-2.7.12/Makefile.pre.in
  
  # Create the PLATDIR source directory, if one wasn't distributed..
  $(srcdir)/Lib/$(PLATDIR):
-Index: Python-2.7.12/setup.py
+Index: Python-2.7.13/setup.py
 ===================================================================
---- Python-2.7.12.orig/setup.py
-+++ Python-2.7.12/setup.py
+--- Python-2.7.13.orig/setup.py
++++ Python-2.7.13/setup.py
 @@ -350,6 +350,7 @@ class PyBuildExt(build_ext):
              self.failed.append(ext.name)
              self.announce('*** WARNING: renaming "%s" since importing it'
diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index b169133..50cc591 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -1,11 +1,11 @@
 Rebased for python-2.7.9
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-2.7.12/configure.ac
+Index: Python-2.7.13/configure.ac
 ===================================================================
---- Python-2.7.12.orig/configure.ac
-+++ Python-2.7.12/configure.ac
-@@ -756,6 +756,10 @@ SunOS*)
+--- Python-2.7.13.orig/configure.ac
++++ Python-2.7.13/configure.ac
+@@ -759,6 +759,10 @@ SunOS*)
      ;;
  esac
  
@@ -16,10 +16,10 @@ Index: Python-2.7.12/configure.ac
  
  AC_SUBST(LIBRARY)
  AC_MSG_CHECKING(LIBRARY)
-Index: Python-2.7.12/Include/pythonrun.h
+Index: Python-2.7.13/Include/pythonrun.h
 ===================================================================
---- Python-2.7.12.orig/Include/pythonrun.h
-+++ Python-2.7.12/Include/pythonrun.h
+--- Python-2.7.13.orig/Include/pythonrun.h
++++ Python-2.7.13/Include/pythonrun.h
 @@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
@@ -28,10 +28,10 @@ Index: Python-2.7.12/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-2.7.12/Lib/distutils/command/install.py
+Index: Python-2.7.13/Lib/distutils/command/install.py
 ===================================================================
---- Python-2.7.12.orig/Lib/distutils/command/install.py
-+++ Python-2.7.12/Lib/distutils/command/install.py
+--- Python-2.7.13.orig/Lib/distutils/command/install.py
++++ Python-2.7.13/Lib/distutils/command/install.py
 @@ -22,6 +22,8 @@ from site import USER_BASE
  from site import USER_SITE
  
@@ -50,10 +50,10 @@ Index: Python-2.7.12/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-2.7.12/Lib/distutils/sysconfig.py
+Index: Python-2.7.13/Lib/distutils/sysconfig.py
 ===================================================================
---- Python-2.7.12.orig/Lib/distutils/sysconfig.py
-+++ Python-2.7.12/Lib/distutils/sysconfig.py
+--- Python-2.7.13.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.13/Lib/distutils/sysconfig.py
 @@ -119,8 +119,11 @@ def get_python_lib(plat_specific=0, stan
          prefix = plat_specific and EXEC_PREFIX or PREFIX
  
@@ -68,23 +68,23 @@ Index: Python-2.7.12/Lib/distutils/sysconfig.py
          if standard_lib:
              return libpython
          else:
-Index: Python-2.7.12/Lib/pydoc.py
+Index: Python-2.7.13/Lib/pydoc.py
 ===================================================================
---- Python-2.7.12.orig/Lib/pydoc.py
-+++ Python-2.7.12/Lib/pydoc.py
-@@ -384,7 +384,7 @@ class Doc:
+--- Python-2.7.13.orig/Lib/pydoc.py
++++ Python-2.7.13/Lib/pydoc.py
+@@ -375,7 +375,7 @@ class Doc:
+     docmodule = docclass = docroutine = docother = docproperty = docdata = fail
  
-         docloc = os.environ.get("PYTHONDOCS",
-                                 "http://docs.python.org/library")
--        basedir = os.path.join(sys.exec_prefix, "lib",
-+        basedir = os.path.join(sys.exec_prefix, sys.lib,
-                                "python"+sys.version[0:3])
-         if (isinstance(object, type(os)) and
-             (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-2.7.12/Lib/site.py
+     def getdocloc(self, object,
+-                  basedir=os.path.join(sys.exec_prefix, "lib",
++                  basedir=os.path.join(sys.exec_prefix, "sys.lib",
+                                        "python"+sys.version[0:3])):
+         """Return the location of module docs or None"""
+ 
+Index: Python-2.7.13/Lib/site.py
 ===================================================================
---- Python-2.7.12.orig/Lib/site.py
-+++ Python-2.7.12/Lib/site.py
+--- Python-2.7.13.orig/Lib/site.py
++++ Python-2.7.13/Lib/site.py
 @@ -288,13 +288,18 @@ def getsitepackages():
          if sys.platform in ('os2emx', 'riscos'):
              sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
@@ -104,13 +104,13 @@ Index: Python-2.7.12/Lib/site.py
              sitepackages.append(prefix)
 -            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
 +            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
-         if sys.platform == "darwin":
-             # for framework builds *only* we add the standard Apple
-             # locations.
-Index: Python-2.7.12/Lib/sysconfig.py
+     return sitepackages
+ 
+ def addsitepackages(known_paths):
+Index: Python-2.7.13/Lib/sysconfig.py
 ===================================================================
---- Python-2.7.12.orig/Lib/sysconfig.py
-+++ Python-2.7.12/Lib/sysconfig.py
+--- Python-2.7.13.orig/Lib/sysconfig.py
++++ Python-2.7.13/Lib/sysconfig.py
 @@ -7,10 +7,10 @@ from os.path import pardir, realpath
  
  _INSTALL_SCHEMES = {
@@ -139,10 +139,10 @@ Index: Python-2.7.12/Lib/sysconfig.py
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
          'data'   : '{userbase}',
-Index: Python-2.7.12/Lib/test/test_dl.py
+Index: Python-2.7.13/Lib/test/test_dl.py
 ===================================================================
---- Python-2.7.12.orig/Lib/test/test_dl.py
-+++ Python-2.7.12/Lib/test/test_dl.py
+--- Python-2.7.13.orig/Lib/test/test_dl.py
++++ Python-2.7.13/Lib/test/test_dl.py
 @@ -4,10 +4,11 @@
  import unittest
  from test.test_support import verbose, import_module
@@ -157,14 +157,14 @@ Index: Python-2.7.12/Lib/test/test_dl.py
      ('/usr/bin/cygwin1.dll', 'getpid'),
      ('/usr/lib/libc.dylib', 'getpid'),
      ]
-Index: Python-2.7.12/Lib/test/test_site.py
+Index: Python-2.7.13/Lib/test/test_site.py
 ===================================================================
---- Python-2.7.12.orig/Lib/test/test_site.py
-+++ Python-2.7.12/Lib/test/test_site.py
-@@ -246,12 +246,16 @@ class HelperFunctionsTests(unittest.Test
-             self.assertEqual(dirs[2], wanted)
+--- Python-2.7.13.orig/Lib/test/test_site.py
++++ Python-2.7.13/Lib/test/test_site.py
+@@ -235,12 +235,16 @@ class HelperFunctionsTests(unittest.Test
+             self.assertEqual(dirs[0], wanted)
          elif os.sep == '/':
-             # OS X non-framwework builds, Linux, FreeBSD, etc
+             # OS X, Linux, FreeBSD, etc
 -            self.assertEqual(len(dirs), 2)
              wanted = os.path.join('xoxo', 'lib', 'python' + sys.version[:3],
                                    'site-packages')
@@ -181,10 +181,10 @@ Index: Python-2.7.12/Lib/test/test_site.py
          else:
              # other platforms
              self.assertEqual(len(dirs), 2)
-Index: Python-2.7.12/Lib/trace.py
+Index: Python-2.7.13/Lib/trace.py
 ===================================================================
---- Python-2.7.12.orig/Lib/trace.py
-+++ Python-2.7.12/Lib/trace.py
+--- Python-2.7.13.orig/Lib/trace.py
++++ Python-2.7.13/Lib/trace.py
 @@ -754,10 +754,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
@@ -198,10 +198,10 @@ Index: Python-2.7.12/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-2.7.12/Makefile.pre.in
+Index: Python-2.7.13/Makefile.pre.in
 ===================================================================
---- Python-2.7.12.orig/Makefile.pre.in
-+++ Python-2.7.12/Makefile.pre.in
+--- Python-2.7.13.orig/Makefile.pre.in
++++ Python-2.7.13/Makefile.pre.in
 @@ -92,6 +92,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
  
  # Machine-dependent subdirectories
@@ -219,7 +219,7 @@ Index: Python-2.7.12/Makefile.pre.in
  
  # Detailed destination directories
  BINLIBDEST=	$(LIBDIR)/python$(VERSION)
-@@ -670,6 +671,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -669,6 +670,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -227,7 +227,7 @@ Index: Python-2.7.12/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -721,7 +723,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
+@@ -709,7 +711,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -236,10 +236,10 @@ Index: Python-2.7.12/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-2.7.12/Modules/getpath.c
+Index: Python-2.7.13/Modules/getpath.c
 ===================================================================
---- Python-2.7.12.orig/Modules/getpath.c
-+++ Python-2.7.12/Modules/getpath.c
+--- Python-2.7.13.orig/Modules/getpath.c
++++ Python-2.7.13/Modules/getpath.c
 @@ -100,6 +100,13 @@
  #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
  #endif
@@ -263,10 +263,10 @@ Index: Python-2.7.12/Modules/getpath.c
  
  static void
  reduce(char *dir)
-Index: Python-2.7.12/Python/getplatform.c
+Index: Python-2.7.13/Python/getplatform.c
 ===================================================================
---- Python-2.7.12.orig/Python/getplatform.c
-+++ Python-2.7.12/Python/getplatform.c
+--- Python-2.7.13.orig/Python/getplatform.c
++++ Python-2.7.13/Python/getplatform.c
 @@ -10,3 +10,13 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -281,10 +281,10 @@ Index: Python-2.7.12/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-2.7.12/Python/sysmodule.c
+Index: Python-2.7.13/Python/sysmodule.c
 ===================================================================
---- Python-2.7.12.orig/Python/sysmodule.c
-+++ Python-2.7.12/Python/sysmodule.c
+--- Python-2.7.13.orig/Python/sysmodule.c
++++ Python-2.7.13/Python/sysmodule.c
 @@ -1437,6 +1437,8 @@ _PySys_Init(void)
                          PyString_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
diff --git a/meta/recipes-devtools/python/python/python-fix-CVE-2016-1000110.patch b/meta/recipes-devtools/python/python/python-fix-CVE-2016-1000110.patch
deleted file mode 100644
index 97888e2..0000000
--- a/meta/recipes-devtools/python/python/python-fix-CVE-2016-1000110.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From cb25fbd5abc0f4eb07dbb8ea819e9c26bda4fc99 Mon Sep 17 00:00:00 2001
-From: Senthil Kumaran <senthil@uthcode.com>
-Date: Sat, 30 Jul 2016 05:49:53 -0700
-Subject: [PATCH] python: fix CVE-2016-1000110
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Prevent HTTPoxy attack (CVE-2016-1000110)
-
-Ignore the HTTP_PROXY variable when REQUEST_METHOD environment is set, which
-indicates that the script is in CGI mode.
-
-Issue reported and patch contributed by Rémi Rampin.
-
-Backport patch from https://hg.python.org/cpython/rev/ba915d561667/
-
-Upstream-Status: Backport
-CVE: CVE-2016-1000110
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- Doc/howto/urllib2.rst   |  5 +++++
- Doc/library/urllib.rst  | 10 ++++++++++
- Doc/library/urllib2.rst |  5 +++++
- Lib/test/test_urllib.py | 12 ++++++++++++
- Lib/urllib.py           |  9 +++++++++
- Misc/ACKS               |  1 +
- Misc/NEWS               |  4 ++++
- 7 files changed, 46 insertions(+)
-
-diff --git a/Doc/howto/urllib2.rst b/Doc/howto/urllib2.rst
-index 6bb06d4..5cf2c0c 100644
---- a/Doc/howto/urllib2.rst
-+++ b/Doc/howto/urllib2.rst
-@@ -525,6 +525,11 @@ setting up a `Basic Authentication`_ handler: ::
-     through a proxy.  However, this can be enabled by extending urllib2 as
-     shown in the recipe [#]_.
- 
-+.. note::
-+
-+    ``HTTP_PROXY`` will be ignored if a variable ``REQUEST_METHOD`` is set; see
-+    the documentation on :func:`~urllib.getproxies`.
-+
- 
- Sockets and Layers
- ==================
-diff --git a/Doc/library/urllib.rst b/Doc/library/urllib.rst
-index 3b5dc16..bddcba9 100644
---- a/Doc/library/urllib.rst
-+++ b/Doc/library/urllib.rst
-@@ -295,6 +295,16 @@ Utility functions
-    If both lowercase and uppercase environment variables exist (and disagree),
-    lowercase is preferred.
- 
-+    .. note::
-+
-+        If the environment variable ``REQUEST_METHOD`` is set, which usually
-+        indicates your script is running in a CGI environment, the environment
-+        variable ``HTTP_PROXY`` (uppercase ``_PROXY``) will be ignored. This is
-+        because that variable can be injected by a client using the "Proxy:"
-+        HTTP header. If you need to use an HTTP proxy in a CGI environment,
-+        either use ``ProxyHandler`` explicitly, or make sure the variable name
-+        is in lowercase (or at least the ``_proxy`` suffix).
-+
- .. note::
-     urllib also exposes certain utility functions like splittype, splithost and
-     others parsing URL into various components. But it is recommended to use
-diff --git a/Doc/library/urllib2.rst b/Doc/library/urllib2.rst
-index 8a4c80e..b808b98 100644
---- a/Doc/library/urllib2.rst
-+++ b/Doc/library/urllib2.rst
-@@ -229,6 +229,11 @@ The following classes are provided:
- 
-    To disable autodetected proxy pass an empty dictionary.
- 
-+    .. note::
-+
-+       ``HTTP_PROXY`` will be ignored if a variable ``REQUEST_METHOD`` is set;
-+       see the documentation on :func:`~urllib.getproxies`.
-+
- 
- .. class:: HTTPPasswordMgr()
- 
-diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
-index 434d533..27a1d38 100644
---- a/Lib/test/test_urllib.py
-+++ b/Lib/test/test_urllib.py
-@@ -170,6 +170,18 @@ class ProxyTests(unittest.TestCase):
-         self.assertTrue(urllib.proxy_bypass_environment('anotherdomain.com:8888'))
-         self.assertTrue(urllib.proxy_bypass_environment('newdomain.com:1234'))
- 
-+    def test_proxy_cgi_ignore(self):
-+        try:
-+            self.env.set('HTTP_PROXY', 'http://somewhere:3128')
-+            proxies = urllib.getproxies_environment()
-+            self.assertEqual('http://somewhere:3128', proxies['http'])
-+            self.env.set('REQUEST_METHOD', 'GET')
-+            proxies = urllib.getproxies_environment()
-+            self.assertNotIn('http', proxies)
-+        finally:
-+            self.env.unset('REQUEST_METHOD')
-+            self.env.unset('HTTP_PROXY')
-+
-     def test_proxy_bypass_environment_host_match(self):
-         bypass = urllib.proxy_bypass_environment
-         self.env.set('NO_PROXY',
-diff --git a/Lib/urllib.py b/Lib/urllib.py
-index 139fab9..c3ba2c9 100644
---- a/Lib/urllib.py
-+++ b/Lib/urllib.py
-@@ -1380,12 +1380,21 @@ def getproxies_environment():
-     If you need a different way, you can pass a proxies dictionary to the
-     [Fancy]URLopener constructor.
-     """
-+    # Get all variables
-     proxies = {}
-     for name, value in os.environ.items():
-         name = name.lower()
-         if value and name[-6:] == '_proxy':
-             proxies[name[:-6]] = value
- 
-+    # CVE-2016-1000110 - If we are running as CGI script, forget HTTP_PROXY
-+    # (non-all-lowercase) as it may be set from the web server by a "Proxy:"
-+    # header from the client
-+    # If "proxy" is lowercase, it will still be used thanks to the next block
-+    if 'REQUEST_METHOD' in os.environ:
-+        proxies.pop('http', None)
-+
-+    # Get lowercase variables
-     for name, value in os.environ.items():
-         if name[-6:] == '_proxy':
-             name = name.lower()
-diff --git a/Misc/ACKS b/Misc/ACKS
-index ee3a465..9c374b7 100644
---- a/Misc/ACKS
-+++ b/Misc/ACKS
-@@ -1121,6 +1121,7 @@ Burton Radons
- Jeff Ramnani
- Varpu Rantala
- Brodie Rao
-+Rémi Rampin
- Senko Rasic
- Antti Rasinen
- Nikolaus Rath
-diff --git a/Misc/NEWS b/Misc/NEWS
-index 4ab3a70..cc2f65b 100644
---- a/Misc/NEWS
-+++ b/Misc/NEWS
-@@ -187,6 +187,10 @@ Library
- - Issue #26644: Raise ValueError rather than SystemError when a negative
-   length is passed to SSLSocket.recv() or read().
- 
-+- Issue #27568: Prevent HTTPoxy attack (CVE-2016-1000110). Ignore the
-+  HTTP_PROXY variable when REQUEST_METHOD environment is set, which indicates
-+  that the script is in CGI mode.
-+
- - Issue #23804: Fix SSL recv(0) and read(0) methods to return zero bytes
-   instead of up to 1024.
- 
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/python/python_2.7.12.bb b/meta/recipes-devtools/python/python_2.7.13.bb
similarity index 99%
rename from meta/recipes-devtools/python/python_2.7.12.bb
rename to meta/recipes-devtools/python/python_2.7.13.bb
index 9fe35db..65b57171 100644
--- a/meta/recipes-devtools/python/python_2.7.12.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -26,7 +26,6 @@ SRC_URI += "\
   file://parallel-makeinst-create-bindir.patch \
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
-  file://python-fix-CVE-2016-1000110.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.10.1



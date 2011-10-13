Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1REURa-00063o-Cq
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 01:12:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Oct 2011 16:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,343,1315206000"; d="scan'208";a="62399765"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 13 Oct 2011 16:06:19 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 16:06:13 -0700
Message-Id: <70807dd62c2c498616cc544869bd710b351b7212.1318547063.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1a00b766c9b8029eaacbb80e0077dfcd556c7c0f.1318547063.git.nitin.a.kamble@intel.com>
References: <1a00b766c9b8029eaacbb80e0077dfcd556c7c0f.1318547063.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1318547063.git.nitin.a.kamble@intel.com>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
Subject: [review/test 3/5] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Thu, 13 Oct 2011 23:12:07 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Rebased these patches to the newer code
	modified:   python-native/nohostlibs.patch
	modified:   python/01-use-proper-tools-for-cross-build.patch
	modified:   python/06-avoid_usr_lib_termcap_path_in_linking.patch
	modified:   python/06-ctypes-libffi-fix-configure.patch
	modified:   python/multilib.patch

Deleted these patches are the are now upstream
	deleted:    python/02-remove-test-for-cross.patch
	deleted:    python/security_issue_2254_fix.patch

Added this patch to python-native
	new file:   python-native/multilib.patch

Updated site config file for python
	modified:   ../../site/common-linux : add ac_cv_have_long_long_format for python
	avoid this error in python:
	Include/pyport.h:243:13: error: #error "This platform's pyconfig.h needs to define PY_FORMAT_LONG_LONG"

Updated default python version
	modified:   ../../conf/distro/include/default-versions.inc

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/distro/include/default-versions.inc      |    6 +-
 ...on-2.6-manifest.inc => python-2.7-manifest.inc} |    0
 .../python/python-native/multilib.patch            |  240 ++++++++++++++++++++
 .../python/python-native/nohostlibs.patch          |   36 ++-
 ...thon-native_2.6.6.bb => python-native_2.7.2.bb} |   13 +-
 meta/recipes-devtools/python/python.inc            |   16 +-
 .../01-use-proper-tools-for-cross-build.patch      |   80 ++++---
 .../python/python/02-remove-test-for-cross.patch   |  108 ---------
 .../06-avoid_usr_lib_termcap_path_in_linking.patch |   12 +-
 .../python/06-ctypes-libffi-fix-configure.patch    |   42 ++---
 meta/recipes-devtools/python/python/multilib.patch |  126 ++++++-----
 .../python/python/security_issue_2254_fix.patch    |  184 ---------------
 .../python/{python_2.6.6.bb => python_2.7.2.bb}    |   11 +-
 meta/site/common-linux                             |    3 +
 14 files changed, 425 insertions(+), 452 deletions(-)
 rename meta/recipes-devtools/python/{python-2.6-manifest.inc => python-2.7-manifest.inc} (100%)
 create mode 100644 meta/recipes-devtools/python/python-native/multilib.patch
 rename meta/recipes-devtools/python/{python-native_2.6.6.bb => python-native_2.7.2.bb} (74%)
 delete mode 100644 meta/recipes-devtools/python/python/02-remove-test-for-cross.patch
 delete mode 100644 meta/recipes-devtools/python/python/security_issue_2254_fix.patch
 rename meta/recipes-devtools/python/{python_2.6.6.bb => python_2.7.2.bb} (92%)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index e3ef1e6..90ff005 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -4,9 +4,9 @@
 PREFERRED_VERSION_pulseaudio ?= "0.9.23"
 
 # Force the python versions in one place
-PYTHON_BASEVERSION ?= "2.6"
-PREFERRED_VERSION_python ?= "2.6.6"
-PREFERRED_VERSION_python-native ?= "2.6.6"
+PYTHON_BASEVERSION ?= "2.7"
+PREFERRED_VERSION_python ?= "2.7.2"
+PREFERRED_VERSION_python-native ?= "2.7.2"
 
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
diff --git a/meta/recipes-devtools/python/python-2.6-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
similarity index 100%
rename from meta/recipes-devtools/python/python-2.6-manifest.inc
rename to meta/recipes-devtools/python/python-2.7-manifest.inc
diff --git a/meta/recipes-devtools/python/python-native/multilib.patch b/meta/recipes-devtools/python/python-native/multilib.patch
new file mode 100644
index 0000000..f8d7aee
--- /dev/null
+++ b/meta/recipes-devtools/python/python-native/multilib.patch
@@ -0,0 +1,240 @@
+commit 248279e54467a8cd5cde98fc124d1d1384703513
+Author: Yu Ke <ke.yu@intel.com>
+Date:   Tue Jun 28 21:21:29 2011 +0800
+
+    SUSE patch for the lib64 issue
+    
+    see detail in http://bugs.python.org/issue1294959
+    
+    also rebased a bit for Yocto python 2.6.6
+    
+    Picked-by: Yu Ke <ke.yu@intel.com>
+
+
+2011/09/29
+The python recipe building was failing because python-native 
+could not handle sys.lib var. sys.lib var is defined in the 
+multilib patch hence added this multilib.patch for python-native 
+recipe.
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+Index: Python-2.7.2/Include/pythonrun.h
+===================================================================
+--- Python-2.7.2.orig/Include/pythonrun.h
++++ Python-2.7.2/Include/pythonrun.h
+@@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
+ /* In their own files */
+ PyAPI_FUNC(const char *) Py_GetVersion(void);
+ PyAPI_FUNC(const char *) Py_GetPlatform(void);
++PyAPI_FUNC(const char *) Py_GetLib(void);
+ PyAPI_FUNC(const char *) Py_GetCopyright(void);
+ PyAPI_FUNC(const char *) Py_GetCompiler(void);
+ PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
+Index: Python-2.7.2/Lib/distutils/command/install.py
+===================================================================
+--- Python-2.7.2.orig/Lib/distutils/command/install.py
++++ Python-2.7.2/Lib/distutils/command/install.py
+@@ -22,6 +22,8 @@ from site import USER_BASE
+ from site import USER_SITE
+ 
+ 
++libname = sys.lib
++
+ if sys.version < "2.2":
+     WINDOWS_SCHEME = {
+         'purelib': '$base',
+@@ -42,7 +44,7 @@ else:
+ INSTALL_SCHEMES = {
+     'unix_prefix': {
+         'purelib': '$base/lib/python$py_version_short/site-packages',
+-        'platlib': '$platbase/lib/python$py_version_short/site-packages',
++        'platlib': '$platbase/'+libname+'/python$py_version_short/site-packages',
+         'headers': '$base/include/python$py_version_short/$dist_name',
+         'scripts': '$base/bin',
+         'data'   : '$base',
+Index: Python-2.7.2/Lib/pydoc.py
+===================================================================
+--- Python-2.7.2.orig/Lib/pydoc.py
++++ Python-2.7.2/Lib/pydoc.py
+@@ -352,7 +352,7 @@ class Doc:
+ 
+         docloc = os.environ.get("PYTHONDOCS",
+                                 "http://docs.python.org/library")
+-        basedir = os.path.join(sys.exec_prefix, "lib",
++        basedir = os.path.join(sys.exec_prefix, sys.lib,
+                                "python"+sys.version[0:3])
+         if (isinstance(object, type(os)) and
+             (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
+Index: Python-2.7.2/Lib/site.py
+===================================================================
+--- Python-2.7.2.orig/Lib/site.py
++++ Python-2.7.2/Lib/site.py
+@@ -300,13 +300,19 @@ def getsitepackages():
+         if sys.platform in ('os2emx', 'riscos'):
+             sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
+         elif os.sep == '/':
+-            sitepackages.append(os.path.join(prefix, "lib",
++            sitepackages.append(os.path.join(prefix, sys.lib,
+                                         "python" + sys.version[:3],
+                                         "site-packages"))
+-            sitepackages.append(os.path.join(prefix, "lib", "site-python"))
++            if sys.lib != "lib":
++                sitepackages.append(os.path.join(prefix, "lib",
++                                        "python" + sys.version[:3],
++                                        "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-python"))
++            if sys.lib != "lib":
++                sitepackages.append(os.path.join(prefix, "lib", "site-python"))
+         else:
+             sitepackages.append(prefix)
+-            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
+         if sys.platform == "darwin":
+             # for framework builds *only* we add the standard Apple
+             # locations.
+Index: Python-2.7.2/Lib/test/test_dl.py
+===================================================================
+--- Python-2.7.2.orig/Lib/test/test_dl.py
++++ Python-2.7.2/Lib/test/test_dl.py
+@@ -5,10 +5,11 @@
+ import unittest
+ from test.test_support import verbose, import_module
+ dl = import_module('dl', deprecated=True)
++import sys
+ 
+ sharedlibs = [
+-    ('/usr/lib/libc.so', 'getpid'),
+-    ('/lib/libc.so.6', 'getpid'),
++    ('/usr/'+sys.lib+'/libc.so', 'getpid'),
++    ('/'+sys.lib+'/libc.so.6', 'getpid'),
+     ('/usr/bin/cygwin1.dll', 'getpid'),
+     ('/usr/lib/libc.dylib', 'getpid'),
+     ]
+Index: Python-2.7.2/Lib/trace.py
+===================================================================
+--- Python-2.7.2.orig/Lib/trace.py
++++ Python-2.7.2/Lib/trace.py
+@@ -762,10 +762,10 @@ def main(argv=None):
+                 # should I also call expanduser? (after all, could use $HOME)
+ 
+                 s = s.replace("$prefix",
+-                              os.path.join(sys.prefix, "lib",
++                              os.path.join(sys.prefix, sys.lib,
+                                            "python" + sys.version[:3]))
+                 s = s.replace("$exec_prefix",
+-                              os.path.join(sys.exec_prefix, "lib",
++                              os.path.join(sys.exec_prefix, sys.lib,
+                                            "python" + sys.version[:3]))
+                 s = os.path.normpath(s)
+                 ignore_dirs.append(s)
+Index: Python-2.7.2/Makefile.pre.in
+===================================================================
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -81,6 +81,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
+ 
+ # Machine-dependent subdirectories
+ MACHDEP=	@MACHDEP@
++LIB=		@LIB@
+ 
+ # Install prefix for architecture-independent files
+ prefix=		@prefix@
+@@ -97,7 +98,7 @@ LIBDIR=		@libdir@
+ MANDIR=		@mandir@
+ INCLUDEDIR=	@includedir@
+ CONFINCLUDEDIR=	$(exec_prefix)/include
+-SCRIPTDIR=	$(prefix)/lib
++SCRIPTDIR=	$(prefix)/@LIB@
+ 
+ # Detailed destination directories
+ BINLIBDEST=	$(LIBDIR)/python$(VERSION)
+@@ -532,6 +533,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+ 		-DEXEC_PREFIX='"$(exec_prefix)"' \
+ 		-DVERSION='"$(VERSION)"' \
+ 		-DVPATH='"$(VPATH)"' \
++		-DLIB='"$(LIB)"' \
+ 		-o $@ $(srcdir)/Modules/getpath.c
+ 
+ Modules/python.o: $(srcdir)/Modules/python.c
+@@ -566,7 +568,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
+ Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
+ 
+ Python/getplatform.o: $(srcdir)/Python/getplatform.c
+-		$(CC) -c $(PY_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
++		$(CC) -c $(PY_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -DLIB='"$(LIB)"' -o $@ $(srcdir)/Python/getplatform.c
+ 
+ Python/importdl.o: $(srcdir)/Python/importdl.c
+ 		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
+Index: Python-2.7.2/Modules/getpath.c
+===================================================================
+--- Python-2.7.2.orig/Modules/getpath.c
++++ Python-2.7.2/Modules/getpath.c
+@@ -116,9 +116,11 @@
+ #define EXEC_PREFIX PREFIX
+ #endif
+ 
++#define LIB_PYTHON LIB "/python" VERSION
++
+ #ifndef PYTHONPATH
+-#define PYTHONPATH PREFIX "/lib/python" VERSION ":" \
+-              EXEC_PREFIX "/lib/python" VERSION "/lib-dynload"
++#define PYTHONPATH PREFIX "/" LIB_PYTHON ":" \
++              EXEC_PREFIX "/" LIB_PYTHON "/lib-dynload"
+ #endif
+ 
+ #ifndef LANDMARK
+@@ -129,7 +131,7 @@ static char prefix[MAXPATHLEN+1];
+ static char exec_prefix[MAXPATHLEN+1];
+ static char progpath[MAXPATHLEN+1];
+ static char *module_search_path = NULL;
+-static char lib_python[] = "lib/python" VERSION;
++static char lib_python[] = LIB_PYTHON;
+ 
+ static void
+ reduce(char *dir)
+Index: Python-2.7.2/Python/getplatform.c
+===================================================================
+--- Python-2.7.2.orig/Python/getplatform.c
++++ Python-2.7.2/Python/getplatform.c
+@@ -10,3 +10,13 @@ Py_GetPlatform(void)
+ {
+ 	return PLATFORM;
+ }
++
++#ifndef LIB
++#define LIB "lib"
++#endif
++
++const char *
++Py_GetLib(void)
++{
++	return LIB;
++}
+Index: Python-2.7.2/Python/sysmodule.c
+===================================================================
+--- Python-2.7.2.orig/Python/sysmodule.c
++++ Python-2.7.2/Python/sysmodule.c
+@@ -1416,6 +1416,8 @@ _PySys_Init(void)
+                         PyString_FromString(Py_GetCopyright()));
+     SET_SYS_FROM_STRING("platform",
+                         PyString_FromString(Py_GetPlatform()));
++    SET_SYS_FROM_STRING("lib",
++                PyString_FromString(Py_GetLib()));
+     SET_SYS_FROM_STRING("executable",
+                         PyString_FromString(Py_GetProgramFullPath()));
+     SET_SYS_FROM_STRING("prefix",
+Index: Python-2.7.2/configure.in
+===================================================================
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -629,6 +629,10 @@ SunOS*)
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
diff --git a/meta/recipes-devtools/python/python-native/nohostlibs.patch b/meta/recipes-devtools/python/python-native/nohostlibs.patch
index aed45c9..09c3fb8 100644
--- a/meta/recipes-devtools/python/python-native/nohostlibs.patch
+++ b/meta/recipes-devtools/python/python-native/nohostlibs.patch
@@ -1,10 +1,14 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: Python-2.6.6/setup.py
+2011/09/29
+rebased for python-2.7.2
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.6.6.orig/setup.py
-+++ Python-2.6.6/setup.py
-@@ -356,8 +356,8 @@ class PyBuildExt(build_ext):
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
+@@ -369,8 +369,8 @@ class PyBuildExt(build_ext):
  
      def detect_modules(self):
          # Ensure that /usr/local is always used
@@ -12,16 +16,22 @@ Index: Python-2.6.6/setup.py
 -        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
 +        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
 +        #add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+         self.add_multiarch_paths()
  
          # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
-@@ -393,10 +393,10 @@ class PyBuildExt(build_ext):
+@@ -407,15 +407,15 @@ class PyBuildExt(build_ext):
                      for directory in reversed(options.dirs):
                          add_dir_to_list(dir_list, directory)
  
--        if os.path.normpath(sys.prefix) != '/usr':
+-        if os.path.normpath(sys.prefix) != '/usr' \
+-                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
++        #if os.path.normpath(sys.prefix) != '/usr' \
++                #and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
+             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
+             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
+             # building a framework with different architectures than
+             # the one that is currently installed (issue #7473)
 -            add_dir_to_list(self.compiler.library_dirs,
-+
 +        add_dir_to_list(self.compiler.library_dirs,
                              sysconfig.get_config_var("LIBDIR"))
 -            add_dir_to_list(self.compiler.include_dirs,
@@ -29,7 +39,7 @@ Index: Python-2.6.6/setup.py
                              sysconfig.get_config_var("INCLUDEDIR"))
  
          try:
-@@ -407,11 +407,8 @@ class PyBuildExt(build_ext):
+@@ -426,11 +426,8 @@ class PyBuildExt(build_ext):
          # lib_dirs and inc_dirs are used to search for files;
          # if a file is found in one of those directories, it can
          # be assumed that no additional -I,-L directives are needed.
@@ -43,13 +53,15 @@ Index: Python-2.6.6/setup.py
          exts = []
          missing = []
  
-@@ -661,8 +658,7 @@ class PyBuildExt(build_ext):
+@@ -676,9 +673,8 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
 -            elif self.compiler.find_library_file(lib_dirs +
--                                               ['/usr/lib/termcap'],
+-                                                     ['/usr/lib/termcap'],
+-                                                     'termcap'):
 +            elif self.compiler.find_library_file(lib_dirs,
-                                                'termcap'):
++                                                     'termcap'):
                  readline_libs.append('termcap')
              exts.append( Extension('readline', ['readline.c'],
+                                    library_dirs=['/usr/lib/termcap'],
diff --git a/meta/recipes-devtools/python/python-native_2.6.6.bb b/meta/recipes-devtools/python/python-native_2.7.2.bb
similarity index 74%
rename from meta/recipes-devtools/python/python-native_2.6.6.bb
rename to meta/recipes-devtools/python/python-native_2.7.2.bb
index e0a4fb3..6b90d5b 100644
--- a/meta/recipes-devtools/python/python-native_2.6.6.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.2.bb
@@ -1,11 +1,8 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.0"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
-
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
-           file://04-default-is-optimized.patch \
+SRC_URI += "file://04-default-is-optimized.patch \
            file://05-enable-ctypes-cross-build.patch \
            file://06-ctypes-libffi-fix-configure.patch \
            file://10-distutils-fix-swig-parameter.patch \
@@ -13,12 +10,10 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://debug.patch \
            file://unixccompiler.patch \
-           file://nohostlibs.patch"
+           file://nohostlibs.patch \
+           file://multilib.patch "
 S = "${WORKDIR}/Python-${PV}"
 
-SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
-SRC_URI[sha256sum] = "134c5e0736bae2e5570d0b915693374f11108ded63c35a23a35d282737d2ce83"
-
 inherit native
 
 EXTRA_OEMAKE = '\
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index a6cc917..e822c12 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -1,13 +1,19 @@
 DESCRIPTION = "The Python Programming Language"
 HOMEPAGE = "http://www.python.org"
-LICENSE = "PSF"
+LICENSE = "PSFv2"
 SECTION = "devel/python"
-# bump this on every change in contrib/python/generate-manifest-2.6.py
-INC_PR = "r2"
+# bump this on every change in contrib/python/generate-manifest-2.7.py
+INC_PR = "r0"
 
-DEFAULT_PREFERENCE = "-26"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2dffb81509b47974467ea23409909b1c"
 
-PYTHON_MAJMIN = "2.6"
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2"
+ 
+SRC_URI[md5sum] = "ba7b2f11ffdbf195ee0d111b9455a5bd"
+SRC_URI[sha256sum] = "5057eb067eb5b5a6040dbd0e889e06550bde9ec041dadaa855ee9490034cbdab"
+DEFAULT_PREFERENCE = "-27"
+
+PYTHON_MAJMIN = "2.7"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index 6c769ac..27afc03 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -4,11 +4,11 @@ Upstream-Status: Inappropriate [embedded specific]
 # built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
 # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
 
-Index: Python-2.6.6/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.6.6.orig/Makefile.pre.in
-+++ Python-2.6.6/Makefile.pre.in
-@@ -175,6 +175,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -182,6 +182,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
  
  PYTHON=		python$(EXE)
  BUILDPYTHON=	python$(BUILDEXE)
@@ -16,7 +16,7 @@ Index: Python-2.6.6/Makefile.pre.in
  
  # The task to run while instrument when building the profile-opt target
  PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
-@@ -205,7 +206,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
+@@ -214,7 +215,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
  ##########################################################################
  # Parser
  PGEN=		Parser/pgen$(EXE)
@@ -25,39 +25,48 @@ Index: Python-2.6.6/Makefile.pre.in
  POBJS=		\
  		Parser/acceler.o \
  		Parser/grammar1.o \
-@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
+@@ -401,14 +402,14 @@ $(BUILDPYTHON):	Modules/python.o $(LIBRA
+ 			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
+ 
+ platform: $(BUILDPYTHON)
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from sysconfig import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
++	$(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from distutils.util import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
+ 
+ 
  # Build the shared modules
  sharedmods: $(BUILDPYTHON)
  	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
  	esac
  
  # Build static library
-@@ -517,7 +518,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
- 
- $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
+@@ -542,7 +543,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
+ $(GRAMMAR_H) $(GRAMMAR_C): Parser/pgen.stamp
+ Parser/pgen.stamp: $(PGEN) $(GRAMMAR_INPUT)
  		-@$(INSTALL) -d Include
--		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+-		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ 		-touch Parser/pgen.stamp
  
  $(PGEN):	$(PGENOBJS)
- 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
-@@ -887,23 +888,23 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+@@ -926,25 +927,25 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
  	done
  	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
  	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
 -		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
 +		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
  	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 -		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
 +		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
 -		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
 +		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
@@ -74,20 +83,20 @@ Index: Python-2.6.6/Makefile.pre.in
  
  # Create the PLATDIR source directory, if one wasn't distributed..
  $(srcdir)/Lib/$(PLATDIR):
-@@ -1001,7 +1002,7 @@ libainstall:	all
+@@ -1049,7 +1050,7 @@ libainstall:	all python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
- sharedinstall:
+ sharedinstall: sharedmods
 -	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
 +	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
  	   	--prefix=$(prefix) \
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
-Index: Python-2.6.6/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.6.6.orig/setup.py
-+++ Python-2.6.6/setup.py
-@@ -322,6 +322,7 @@ class PyBuildExt(build_ext):
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
+@@ -313,6 +313,7 @@ class PyBuildExt(build_ext):
              self.failed.append(ext.name)
              self.announce('*** WARNING: renaming "%s" since importing it'
                            ' failed: %s' % (ext.name, why), level=3)
@@ -95,18 +104,18 @@ Index: Python-2.6.6/setup.py
              assert not self.inplace
              basename, tail = os.path.splitext(ext_filename)
              newname = basename + "_failed" + tail
-@@ -356,8 +357,8 @@ class PyBuildExt(build_ext):
+@@ -369,8 +370,8 @@ class PyBuildExt(build_ext):
  
      def detect_modules(self):
          # Ensure that /usr/local is always used
 -        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
 -        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++        #add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+         self.add_multiarch_paths()
  
          # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
-@@ -456,6 +457,9 @@ class PyBuildExt(build_ext):
+@@ -475,6 +476,9 @@ class PyBuildExt(build_ext):
  
          # XXX Omitted modules: gl, pure, dl, SGI-specific modules
  
@@ -116,3 +125,14 @@ Index: Python-2.6.6/setup.py
          #
          # The following modules are all pretty straightforward, and compile
          # on pretty much any POSIXish platform.
+@@ -677,8 +681,8 @@ class PyBuildExt(build_ext):
+             elif curses_library:
+                 readline_libs.append(curses_library)
+             elif self.compiler.find_library_file(lib_dirs +
+-                                                     ['/usr/lib/termcap'],
+-                                                     'termcap'):
++                                               ['/usr/lib/termcap'],
++                                               'termcap'):
+                 readline_libs.append('termcap')
+             exts.append( Extension('readline', ['readline.c'],
+                                    library_dirs=['/usr/lib/termcap'],
diff --git a/meta/recipes-devtools/python/python/02-remove-test-for-cross.patch b/meta/recipes-devtools/python/python/02-remove-test-for-cross.patch
deleted file mode 100644
index 9b164d5..0000000
--- a/meta/recipes-devtools/python/python/02-remove-test-for-cross.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-# OpenEmbedded prepopulates the autotools site cache, so if this
-# would be using AC_TRY_CACHE, we could patch it in a more sane way
-# Alas, I don't have enough autotalent to do that.
-#
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-Index: Python-2.6.1/configure.in
-===================================================================
---- Python-2.6.5.orig/configure.in	2010-07-06 04:37:09.000000000 -0700
-+++ Python-2.6.5/configure.in	2010-07-06 04:40:18.000000000 -0700
-@@ -2697,50 +2697,6 @@
-   AC_CHECK_LIB(resolv, inet_aton)
- )
- 
--# On Tru64, chflags seems to be present, but calling it will
--# exit Python
--AC_CACHE_CHECK([for chflags], [ac_cv_have_chflags], [dnl
--AC_TRY_RUN([[
--#include <sys/stat.h>
--#include <unistd.h>
--int main(int argc, char*argv[])
--{
--  if(chflags(argv[0], 0) != 0)
--    return 1;
--  return 0;
--}
--]], ac_cv_have_chflags=yes,
--   ac_cv_have_chflags=no,
--   ac_cv_have_chflags=cross)
--])
--if test "$ac_cv_have_chflags" = cross ; then
--  AC_CHECK_FUNC([chflags], [ac_cv_have_chflags="yes"], [ac_cv_have_chflags="no"])
--fi
--if test "$ac_cv_have_chflags" = yes ; then
--  AC_DEFINE(HAVE_CHFLAGS, 1, Define to 1 if you have the `chflags' function.)
--fi
--
--AC_CACHE_CHECK([for lchflags], [ac_cv_have_lchflags], [dnl
--AC_TRY_RUN([[
--#include <sys/stat.h>
--#include <unistd.h>
--int main(int argc, char*argv[])
--{
--  if(lchflags(argv[0], 0) != 0)
--    return 1;
--  return 0;
--}
--]], ac_cv_have_lchflags=yes,
--   ac_cv_have_lchflags=no,
--   ac_cv_have_lchflags=cross)
--])
--if test "$ac_cv_have_lchflags" = cross ; then
--  AC_CHECK_FUNC([lchflags], [ac_cv_have_lchflags="yes"], [ac_cv_have_lchflags="no"])
--fi
--if test "$ac_cv_have_lchflags" = yes ; then
--  AC_DEFINE(HAVE_LCHFLAGS, 1, Define to 1 if you have the `lchflags' function.)
--fi
--
- dnl Check if system zlib has *Copy() functions
- dnl
- dnl On MacOSX the linker will search for dylibs on the entire linker path
-@@ -3844,45 +3800,6 @@
-   AC_MSG_RESULT(no)
- fi
- 
--AC_MSG_CHECKING(for %zd printf() format support)
--AC_TRY_RUN([#include <stdio.h>
--#include <stddef.h>
--#include <string.h>
--
--#ifdef HAVE_SYS_TYPES_H
--#include <sys/types.h>
--#endif
--
--#ifdef HAVE_SSIZE_T
--typedef ssize_t Py_ssize_t;
--#elif SIZEOF_VOID_P == SIZEOF_LONG
--typedef long Py_ssize_t;
--#else
--typedef int Py_ssize_t;
--#endif
--
--int main()
--{
--    char buffer[256];
--
--    if(sprintf(buffer, "%zd", (size_t)123) < 0)
--       	return 1;
--
--    if (strcmp(buffer, "123"))
--	return 1;
--
--    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
--       	return 1;
--
--    if (strcmp(buffer, "-123"))
--	return 1;
--
--    return 0;
--}],
--[AC_MSG_RESULT(yes)
-- AC_DEFINE(PY_FORMAT_SIZE_T, "z", [Define to printf format modifier for Py_ssize_t])],
-- AC_MSG_RESULT(no))
--
- AC_CHECK_TYPE(socklen_t,,
-   AC_DEFINE(socklen_t,int,
-             Define to `int' if <sys/socket.h> does not define.),[
diff --git a/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch b/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch
index b39b22f..f8ab0e7 100644
--- a/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch
+++ b/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_in_linking.patch
@@ -9,11 +9,15 @@ This Patch fixes this issue in the python build environment.
 11 Oct 2010
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: Python-2.6.6/setup.py
+2011/09/29
+Rebased for python 2.7.2
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.6.6.orig/setup.py
-+++ Python-2.6.6/setup.py
-@@ -665,12 +665,10 @@ class PyBuildExt(build_ext):
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
+@@ -680,12 +680,10 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch b/meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch
index 8de5694..abd63d2 100644
--- a/meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch
+++ b/meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch
@@ -14,29 +14,16 @@ Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac Python-2.6.4/Modules/_ctypes/libffi/configure.ac
---- Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac      2009-04-28 22:01:18.000000000 +0200
-+++ Python-2.6.4/Modules/_ctypes/libffi/configure.ac    2010-04-20 22:46:02.000000000 +0200
-@@ -23,6 +23,7 @@ AM_INIT_AUTOMAKE
- m4_rename([_AC_ARG_VAR_PRECIOUS],[real_PRECIOUS])
- m4_define([_AC_ARG_VAR_PRECIOUS],[])
- AC_PROG_CC
-+m4_undefine([_AC_ARG_VAR_PRECIOUS])
- m4_rename([real_PRECIOUS],[_AC_ARG_VAR_PRECIOUS])
- 
- AC_SUBST(CFLAGS)
-@@ -366,7 +367,7 @@ test -d src/$TARGETDIR || mkdir src/$TAR
- 
- AC_CONFIG_LINKS(include/ffitarget.h:src/$TARGETDIR/ffitarget.h)
- 
--AC_CONFIG_FILES(include/ffi.h)
-+AC_CONFIG_FILES(include/ffi.h include/Makefile Makefile)
- 
- AC_CONFIG_LINKS(include/ffi_common.h:include/ffi_common.h)
- 
-diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am Python-2.6.4/Modules/_ctypes/libffi/Makefile.am
---- Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am       2008-03-04 21:09:11.000000000 +0100
-+++ Python-2.6.4/Modules/_ctypes/libffi/Makefile.am     2010-04-20 22:54:03.000000000 +0200
+
+2011/09/29
+Rebased for python 2.7.2
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+
+Index: Python-2.7.2/Modules/_ctypes/libffi/Makefile.am
+===================================================================
+--- Python-2.7.2.orig/Modules/_ctypes/libffi/Makefile.am
++++ Python-2.7.2/Modules/_ctypes/libffi/Makefile.am
 @@ -2,7 +2,7 @@
  
  AUTOMAKE_OPTIONS = foreign subdir-objects
@@ -45,14 +32,13 @@ diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am Python-2.6.4/Mo
 +SUBDIRS = include
  
  EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
-        src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
-@@ -32,8 +32,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
-        src/frv/ffi.c src/frv/eabi.S src/frv/ffitarget.h src/dlmalloc.c \
-        libtool-version ChangeLog.libffi
+ 	src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
+@@ -34,8 +34,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
+ 	libtool-version ChangeLog.libffi m4/libtool.m4 \
+ 	m4/lt~obsolete.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4
  
 -info_TEXINFOS = doc/libffi.texi
 -
  ## ################################################################
  
  ##
-
diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index 33a3341..babff12 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -10,10 +10,14 @@ Date:   Tue Jun 28 21:21:29 2011 +0800
     
     Picked-by: Yu Ke <ke.yu@intel.com>
 
-Index: Python-2.6.6/Include/pythonrun.h
+2011/09/29
+Rebased for python 2.7.2
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+Index: Python-2.7.2/Include/pythonrun.h
 ===================================================================
---- Python-2.6.6.orig/Include/pythonrun.h
-+++ Python-2.6.6/Include/pythonrun.h
+--- Python-2.7.2.orig/Include/pythonrun.h
++++ Python-2.7.2/Include/pythonrun.h
 @@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
@@ -22,10 +26,10 @@ Index: Python-2.6.6/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-2.6.6/Lib/distutils/command/install.py
+Index: Python-2.7.2/Lib/distutils/command/install.py
 ===================================================================
---- Python-2.6.6.orig/Lib/distutils/command/install.py
-+++ Python-2.6.6/Lib/distutils/command/install.py
+--- Python-2.7.2.orig/Lib/distutils/command/install.py
++++ Python-2.7.2/Lib/distutils/command/install.py
 @@ -22,6 +22,8 @@ from site import USER_BASE
  from site import USER_SITE
  
@@ -44,11 +48,11 @@ Index: Python-2.6.6/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-2.6.6/Lib/distutils/sysconfig.py
+Index: Python-2.7.2/Lib/distutils/sysconfig.py
 ===================================================================
---- Python-2.6.6.orig/Lib/distutils/sysconfig.py
-+++ Python-2.6.6/Lib/distutils/sysconfig.py
-@@ -119,8 +119,11 @@ def get_python_lib(plat_specific=0, stan
+--- Python-2.7.2.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.2/Lib/distutils/sysconfig.py
+@@ -114,8 +114,11 @@ def get_python_lib(plat_specific=0, stan
          prefix = plat_specific and EXEC_PREFIX or PREFIX
  
      if os.name == "posix":
@@ -62,11 +66,11 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
          if standard_lib:
              return libpython
          else:
-Index: Python-2.6.6/Lib/pydoc.py
+Index: Python-2.7.2/Lib/pydoc.py
 ===================================================================
---- Python-2.6.6.orig/Lib/pydoc.py
-+++ Python-2.6.6/Lib/pydoc.py
-@@ -349,7 +349,7 @@ class Doc:
+--- Python-2.7.2.orig/Lib/pydoc.py
++++ Python-2.7.2/Lib/pydoc.py
+@@ -352,7 +352,7 @@ class Doc:
  
          docloc = os.environ.get("PYTHONDOCS",
                                  "http://docs.python.org/library")
@@ -75,40 +79,40 @@ Index: Python-2.6.6/Lib/pydoc.py
                                 "python"+sys.version[0:3])
          if (isinstance(object, type(os)) and
              (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-2.6.6/Lib/site.py
+Index: Python-2.7.2/Lib/site.py
 ===================================================================
---- Python-2.6.6.orig/Lib/site.py
-+++ Python-2.6.6/Lib/site.py
-@@ -265,13 +265,19 @@ def addsitepackages(known_paths):
+--- Python-2.7.2.orig/Lib/site.py
++++ Python-2.7.2/Lib/site.py
+@@ -300,13 +300,19 @@ def getsitepackages():
          if sys.platform in ('os2emx', 'riscos'):
-             sitedirs.append(os.path.join(prefix, "Lib", "site-packages"))
+             sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
          elif os.sep == '/':
--            sitedirs.append(os.path.join(prefix, "lib",
-+            sitedirs.append(os.path.join(prefix, sys.lib,
+-            sitepackages.append(os.path.join(prefix, "lib",
++            sitepackages.append(os.path.join(prefix, sys.lib,
                                          "python" + sys.version[:3],
                                          "site-packages"))
--            sitedirs.append(os.path.join(prefix, "lib", "site-python"))
+-            sitepackages.append(os.path.join(prefix, "lib", "site-python"))
 +            if sys.lib != "lib":
-+                sitedirs.append(os.path.join(prefix, "lib",
++                sitepackages.append(os.path.join(prefix, "lib",
 +                                        "python" + sys.version[:3],
 +                                        "site-packages"))
-+            sitedirs.append(os.path.join(prefix, sys.lib, "site-python"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-python"))
 +            if sys.lib != "lib":
-+                sitedirs.append(os.path.join(prefix, "lib", "site-python"))
++                sitepackages.append(os.path.join(prefix, "lib", "site-python"))
          else:
-             sitedirs.append(prefix)
--            sitedirs.append(os.path.join(prefix, "lib", "site-packages"))
-+            sitedirs.append(os.path.join(prefix, sys.lib, "site-packages"))
- 
+             sitepackages.append(prefix)
+-            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
          if sys.platform == "darwin":
              # for framework builds *only* we add the standard Apple
-Index: Python-2.6.6/Lib/test/test_dl.py
+             # locations.
+Index: Python-2.7.2/Lib/test/test_dl.py
 ===================================================================
---- Python-2.6.6.orig/Lib/test/test_dl.py
-+++ Python-2.6.6/Lib/test/test_dl.py
-@@ -4,10 +4,11 @@
- """
- from test.test_support import verbose,TestSkipped, import_module
+--- Python-2.7.2.orig/Lib/test/test_dl.py
++++ Python-2.7.2/Lib/test/test_dl.py
+@@ -5,10 +5,11 @@
+ import unittest
+ from test.test_support import verbose, import_module
  dl = import_module('dl', deprecated=True)
 +import sys
  
@@ -120,11 +124,11 @@ Index: Python-2.6.6/Lib/test/test_dl.py
      ('/usr/bin/cygwin1.dll', 'getpid'),
      ('/usr/lib/libc.dylib', 'getpid'),
      ]
-Index: Python-2.6.6/Lib/trace.py
+Index: Python-2.7.2/Lib/trace.py
 ===================================================================
---- Python-2.6.6.orig/Lib/trace.py
-+++ Python-2.6.6/Lib/trace.py
-@@ -759,10 +759,10 @@ def main(argv=None):
+--- Python-2.7.2.orig/Lib/trace.py
++++ Python-2.7.2/Lib/trace.py
+@@ -762,10 +762,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
                  s = s.replace("$prefix",
@@ -137,11 +141,11 @@ Index: Python-2.6.6/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-2.6.6/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.6.6.orig/Makefile.pre.in
-+++ Python-2.6.6/Makefile.pre.in
-@@ -75,6 +75,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -81,6 +81,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
@@ -149,7 +153,7 @@ Index: Python-2.6.6/Makefile.pre.in
  
  # Install prefix for architecture-independent files
  prefix=		@prefix@
-@@ -91,7 +92,7 @@ LIBDIR=		@libdir@
+@@ -97,7 +98,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -158,7 +162,7 @@ Index: Python-2.6.6/Makefile.pre.in
  
  # Detailed destination directories
  BINLIBDEST=	$(LIBDIR)/python$(VERSION)
-@@ -509,6 +510,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -533,6 +534,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -166,8 +170,8 @@ Index: Python-2.6.6/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -540,7 +542,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
- Python/compile.o Python/symtable.o: $(GRAMMAR_H) $(AST_H)
+@@ -567,7 +569,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
+ Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
 -		$(CC) -c $(PY_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
@@ -175,10 +179,10 @@ Index: Python-2.6.6/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-2.6.6/Modules/getpath.c
+Index: Python-2.7.2/Modules/getpath.c
 ===================================================================
---- Python-2.6.6.orig/Modules/getpath.c
-+++ Python-2.6.6/Modules/getpath.c
+--- Python-2.7.2.orig/Modules/getpath.c
++++ Python-2.7.2/Modules/getpath.c
 @@ -116,9 +116,11 @@
  #define EXEC_PREFIX PREFIX
  #endif
@@ -202,10 +206,10 @@ Index: Python-2.6.6/Modules/getpath.c
  
  static void
  reduce(char *dir)
-Index: Python-2.6.6/Python/getplatform.c
+Index: Python-2.7.2/Python/getplatform.c
 ===================================================================
---- Python-2.6.6.orig/Python/getplatform.c
-+++ Python-2.6.6/Python/getplatform.c
+--- Python-2.7.2.orig/Python/getplatform.c
++++ Python-2.7.2/Python/getplatform.c
 @@ -10,3 +10,13 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -220,11 +224,11 @@ Index: Python-2.6.6/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-2.6.6/Python/sysmodule.c
+Index: Python-2.7.2/Python/sysmodule.c
 ===================================================================
---- Python-2.6.6.orig/Python/sysmodule.c
-+++ Python-2.6.6/Python/sysmodule.c
-@@ -1379,6 +1379,8 @@ _PySys_Init(void)
+--- Python-2.7.2.orig/Python/sysmodule.c
++++ Python-2.7.2/Python/sysmodule.c
+@@ -1416,6 +1416,8 @@ _PySys_Init(void)
                          PyString_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
                          PyString_FromString(Py_GetPlatform()));
@@ -233,11 +237,11 @@ Index: Python-2.6.6/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyString_FromString(Py_GetProgramFullPath()));
      SET_SYS_FROM_STRING("prefix",
-Index: Python-2.6.6/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.6.6.orig/configure.in
-+++ Python-2.6.6/configure.in
-@@ -613,6 +613,10 @@ SunOS*)
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -629,6 +629,10 @@ SunOS*)
      ;;
  esac
  
diff --git a/meta/recipes-devtools/python/python/security_issue_2254_fix.patch b/meta/recipes-devtools/python/python/security_issue_2254_fix.patch
deleted file mode 100644
index f032858..0000000
--- a/meta/recipes-devtools/python/python/security_issue_2254_fix.patch
+++ /dev/null
@@ -1,184 +0,0 @@
-Upstream-Status: Backport
-http://svn.python.org/view?view=revision&revision=71303
-
-Issue #2254: Fix CGIHTTPServer information disclosure.  Relative paths are
-  now collapsed within the url properly before looking in cgi_directories.
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 
-2011/07/19
-
-Index: Python-2.6.6/Lib/CGIHTTPServer.py
-===================================================================
---- Python-2.6.6.orig/Lib/CGIHTTPServer.py
-+++ Python-2.6.6/Lib/CGIHTTPServer.py
-@@ -70,27 +70,20 @@ class CGIHTTPRequestHandler(SimpleHTTPSe
-             return SimpleHTTPServer.SimpleHTTPRequestHandler.send_head(self)
- 
-     def is_cgi(self):
--        """Test whether self.path corresponds to a CGI script,
--        and return a boolean.
-+        """Test whether self.path corresponds to a CGI script.
- 
--        This function sets self.cgi_info to a tuple (dir, rest)
--        when it returns True, where dir is the directory part before
--        the CGI script name.  Note that rest begins with a
--        slash if it is not empty.
--
--        The default implementation tests whether the path
--        begins with one of the strings in the list
--        self.cgi_directories (and the next character is a '/'
--        or the end of the string).
-+        Returns True and updates the cgi_info attribute to the tuple
-+        (dir, rest) if self.path requires running a CGI script.
-+        Returns False otherwise.
-+
-+        The default implementation tests whether the normalized url
-+        path begins with one of the strings in self.cgi_directories
-+        (and the next character is a '/' or the end of the string).
-         """
--
--        path = self.path
--
--        for x in self.cgi_directories:
--            i = len(x)
--            if path[:i] == x and (not path[i:] or path[i] == '/'):
--                self.cgi_info = path[:i], path[i+1:]
--                return True
-+        splitpath = _url_collapse_path_split(self.path)
-+        if splitpath[0] in self.cgi_directories:
-+            self.cgi_info = splitpath
-+            return True
-         return False
- 
-     cgi_directories = ['/cgi-bin', '/htbin']
-@@ -299,6 +292,46 @@ class CGIHTTPRequestHandler(SimpleHTTPSe
-                 self.log_message("CGI script exited OK")
- 
- 
-+# TODO(gregory.p.smith): Move this into an appropriate library.
-+def _url_collapse_path_split(path):
-+    """
-+    Given a URL path, remove extra '/'s and '.' path elements and collapse
-+    any '..' references.
-+
-+    Implements something akin to RFC-2396 5.2 step 6 to parse relative paths.
-+
-+    Returns: A tuple of (head, tail) where tail is everything after the final /
-+    and head is everything before it.  Head will always start with a '/' and,
-+    if it contains anything else, never have a trailing '/'.
-+
-+    Raises: IndexError if too many '..' occur within the path.
-+    """
-+    # Similar to os.path.split(os.path.normpath(path)) but specific to URL
-+    # path semantics rather than local operating system semantics.
-+    path_parts = []
-+    for part in path.split('/'):
-+        if part == '.':
-+            path_parts.append('')
-+        else:
-+            path_parts.append(part)
-+    # Filter out blank non trailing parts before consuming the '..'.
-+    path_parts = [part for part in path_parts[:-1] if part] + path_parts[-1:]
-+    if path_parts:
-+        tail_part = path_parts.pop()
-+    else:
-+        tail_part = ''
-+    head_parts = []
-+    for part in path_parts:
-+        if part == '..':
-+            head_parts.pop()
-+        else:
-+            head_parts.append(part)
-+    if tail_part and tail_part == '..':
-+        head_parts.pop()
-+        tail_part = ''
-+    return ('/' + '/'.join(head_parts), tail_part)
-+
-+
- nobody = None
- 
- def nobody_uid():
-Index: Python-2.6.6/Lib/test/test_httpservers.py
-===================================================================
---- Python-2.6.6.orig/Lib/test/test_httpservers.py
-+++ Python-2.6.6/Lib/test/test_httpservers.py
-@@ -7,6 +7,7 @@ Josip Dzolonga, and Michael Otteneder fo
- from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
- from SimpleHTTPServer import SimpleHTTPRequestHandler
- from CGIHTTPServer import CGIHTTPRequestHandler
-+import CGIHTTPServer
- 
- import os
- import sys
-@@ -324,6 +325,45 @@ class CGIHTTPServerTestCase(BaseTestCase
-         finally:
-             BaseTestCase.tearDown(self)
- 
-+    def test_url_collapse_path_split(self):
-+        test_vectors = {
-+            '': ('/', ''),
-+            '..': IndexError,
-+            '/.//..': IndexError,
-+            '/': ('/', ''),
-+            '//': ('/', ''),
-+            '/\\': ('/', '\\'),
-+            '/.//': ('/', ''),
-+            'cgi-bin/file1.py': ('/cgi-bin', 'file1.py'),
-+            '/cgi-bin/file1.py': ('/cgi-bin', 'file1.py'),
-+            'a': ('/', 'a'),
-+            '/a': ('/', 'a'),
-+            '//a': ('/', 'a'),
-+            './a': ('/', 'a'),
-+            './C:/': ('/C:', ''),
-+            '/a/b': ('/a', 'b'),
-+            '/a/b/': ('/a/b', ''),
-+            '/a/b/c/..': ('/a/b', ''),
-+            '/a/b/c/../d': ('/a/b', 'd'),
-+            '/a/b/c/../d/e/../f': ('/a/b/d', 'f'),
-+            '/a/b/c/../d/e/../../f': ('/a/b', 'f'),
-+            '/a/b/c/../d/e/.././././..//f': ('/a/b', 'f'),
-+            '../a/b/c/../d/e/.././././..//f': IndexError,
-+            '/a/b/c/../d/e/../../../f': ('/a', 'f'),
-+            '/a/b/c/../d/e/../../../../f': ('/', 'f'),
-+            '/a/b/c/../d/e/../../../../../f': IndexError,
-+            '/a/b/c/../d/e/../../../../f/..': ('/', ''),
-+        }
-+        for path, expected in test_vectors.iteritems():
-+            if isinstance(expected, type) and issubclass(expected, Exception):
-+                self.assertRaises(expected,
-+                                  CGIHTTPServer._url_collapse_path_split, path)
-+            else:
-+                actual = CGIHTTPServer._url_collapse_path_split(path)
-+                self.assertEquals(expected, actual,
-+                                  msg='path = %r\nGot:    %r\nWanted: %r' % (
-+                                  path, actual, expected))
-+
-     def test_headers_and_content(self):
-         res = self.request('/cgi-bin/file1.py')
-         self.assertEquals(('Hello World\n', 'text/html', 200), \
-@@ -348,6 +388,12 @@ class CGIHTTPServerTestCase(BaseTestCase
-         self.assertEquals(('Hello World\n', 'text/html', 200), \
-              (res.read(), res.getheader('Content-type'), res.status))
- 
-+    def test_no_leading_slash(self):
-+        # http://bugs.python.org/issue2254
-+        res = self.request('cgi-bin/file1.py')
-+        self.assertEquals(('Hello World\n', 'text/html', 200),
-+             (res.read(), res.getheader('Content-type'), res.status))
-+
- 
- def test_main(verbose=None):
-     cwd = os.getcwd()
-Index: Python-2.6.6/Misc/NEWS
-===================================================================
---- Python-2.6.6.orig/Misc/NEWS
-+++ Python-2.6.6/Misc/NEWS
-@@ -137,6 +137,9 @@ C-API
- Library
- -------
- 
-+- Issue #2254: Fix CGIHTTPServer information disclosure.  Relative paths are
-+  now collapsed within the url properly before looking in cgi_directories.
-+
- - Issue #8447: Make distutils.sysconfig follow symlinks in the path to
-   the interpreter executable.  This fixes a failure of test_httpservers
-   on OS X.
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.7.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python_2.6.6.bb
rename to meta/recipes-devtools/python/python_2.7.2.bb
index aa7ec3c..5a355b1 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,15 +1,13 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.10"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2dffb81509b47974467ea23409909b1c"
+PR = "${INC_PR}.0"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
-SRC_URI = "\
-  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+SRC_URI += "\
   file://01-use-proper-tools-for-cross-build.patch \
-  file://02-remove-test-for-cross.patch \
   file://03-fix-tkinter-detection.patch \
   file://04-default-is-optimized.patch \
   file://05-enable-ctypes-cross-build.patch \
@@ -19,12 +17,9 @@ SRC_URI = "\
   file://99-ignore-optimization-flag.patch \
   ${DISTRO_SRC_URI} \
   file://multilib.patch \
-  file://security_issue_2254_fix.patch \
   file://cgi_py.patch \
 "
 
-SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
-SRC_URI[sha256sum] = "134c5e0736bae2e5570d0b915693374f11108ded63c35a23a35d282737d2ce83"
 S = "${WORKDIR}/Python-${PV}"
 
 inherit autotools
diff --git a/meta/site/common-linux b/meta/site/common-linux
index 00ac717..c0b7dcb 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -40,3 +40,6 @@ ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
 
 # TCL
 tcl_cv_api_serial=${tcl_cv_api_serial=termios}
+
+# python
+ac_cv_have_long_long_format=yes
-- 
1.7.4.4




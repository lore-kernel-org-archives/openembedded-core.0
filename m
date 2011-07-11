Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QgAxg-0001hI-TY
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 09:31:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Jul 2011 00:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,513,1304319600"; d="scan'208";a="25597132"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by azsmga001.ch.intel.com with ESMTP; 11 Jul 2011 00:26:21 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 15:23:17 +0800
Message-Id: <fc6819169df6a49b944fe0c465c817b8bf4b41d7.1310368636.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310368636.git.ke.yu@intel.com>
References: <cover.1310368636.git.ke.yu@intel.com>
In-Reply-To: <cover.1310368636.git.ke.yu@intel.com>
References: <cover.1310368636.git.ke.yu@intel.com>
Subject: [PATCH 04/10] python: fix for libdir=/usr/lib64 case
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
X-List-Received-Date: Mon, 11 Jul 2011 07:31:25 -0000

python has several place hard code "lib" which breaks build
when libdir=/usr/lib64. SUSE has a patch to fix this issue.

So this patch add the SUSE patch to address this issue

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-devtools/python/python/multilib.patch |  250 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
 2 files changed, 252 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/multilib.patch

diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
new file mode 100644
index 0000000..e8689e4
--- /dev/null
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -0,0 +1,250 @@
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
+Index: Python-2.6.6/Include/pythonrun.h
+===================================================================
+--- Python-2.6.6.orig/Include/pythonrun.h
++++ Python-2.6.6/Include/pythonrun.h
+@@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
+ /* In their own files */
+ PyAPI_FUNC(const char *) Py_GetVersion(void);
+ PyAPI_FUNC(const char *) Py_GetPlatform(void);
++PyAPI_FUNC(const char *) Py_GetLib(void);
+ PyAPI_FUNC(const char *) Py_GetCopyright(void);
+ PyAPI_FUNC(const char *) Py_GetCompiler(void);
+ PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
+Index: Python-2.6.6/Lib/distutils/command/install.py
+===================================================================
+--- Python-2.6.6.orig/Lib/distutils/command/install.py
++++ Python-2.6.6/Lib/distutils/command/install.py
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
+Index: Python-2.6.6/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-2.6.6.orig/Lib/distutils/sysconfig.py
++++ Python-2.6.6/Lib/distutils/sysconfig.py
+@@ -119,8 +119,11 @@ def get_python_lib(plat_specific=0, stan
+         prefix = plat_specific and EXEC_PREFIX or PREFIX
+ 
+     if os.name == "posix":
+-        libpython = os.path.join(prefix,
+-                                 "lib", "python" + get_python_version())
++        if plat_specific or standard_lib:
++            lib = sys.lib
++        else:
++            lib = "lib"
++        libpython = os.path.join(prefix, lib, "python" + get_python_version())
+         if standard_lib:
+             return libpython
+         else:
+Index: Python-2.6.6/Lib/pydoc.py
+===================================================================
+--- Python-2.6.6.orig/Lib/pydoc.py
++++ Python-2.6.6/Lib/pydoc.py
+@@ -349,7 +349,7 @@ class Doc:
+ 
+         docloc = os.environ.get("PYTHONDOCS",
+                                 "http://docs.python.org/library")
+-        basedir = os.path.join(sys.exec_prefix, "lib",
++        basedir = os.path.join(sys.exec_prefix, sys.lib,
+                                "python"+sys.version[0:3])
+         if (isinstance(object, type(os)) and
+             (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
+Index: Python-2.6.6/Lib/site.py
+===================================================================
+--- Python-2.6.6.orig/Lib/site.py
++++ Python-2.6.6/Lib/site.py
+@@ -265,13 +265,19 @@ def addsitepackages(known_paths):
+         if sys.platform in ('os2emx', 'riscos'):
+             sitedirs.append(os.path.join(prefix, "Lib", "site-packages"))
+         elif os.sep == '/':
+-            sitedirs.append(os.path.join(prefix, "lib",
++            sitedirs.append(os.path.join(prefix, sys.lib,
+                                         "python" + sys.version[:3],
+                                         "site-packages"))
+-            sitedirs.append(os.path.join(prefix, "lib", "site-python"))
++            if sys.lib != "lib":
++                sitedirs.append(os.path.join(prefix, "lib",
++                                        "python" + sys.version[:3],
++                                        "site-packages"))
++            sitedirs.append(os.path.join(prefix, sys.lib, "site-python"))
++            if sys.lib != "lib":
++                sitedirs.append(os.path.join(prefix, "lib", "site-python"))
+         else:
+             sitedirs.append(prefix)
+-            sitedirs.append(os.path.join(prefix, "lib", "site-packages"))
++            sitedirs.append(os.path.join(prefix, sys.lib, "site-packages"))
+ 
+         if sys.platform == "darwin":
+             # for framework builds *only* we add the standard Apple
+Index: Python-2.6.6/Lib/test/test_dl.py
+===================================================================
+--- Python-2.6.6.orig/Lib/test/test_dl.py
++++ Python-2.6.6/Lib/test/test_dl.py
+@@ -4,10 +4,11 @@
+ """
+ from test.test_support import verbose,TestSkipped, import_module
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
+Index: Python-2.6.6/Lib/trace.py
+===================================================================
+--- Python-2.6.6.orig/Lib/trace.py
++++ Python-2.6.6/Lib/trace.py
+@@ -759,10 +759,10 @@ def main(argv=None):
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
+Index: Python-2.6.6/Makefile.pre.in
+===================================================================
+--- Python-2.6.6.orig/Makefile.pre.in
++++ Python-2.6.6/Makefile.pre.in
+@@ -75,6 +75,7 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAG
+ 
+ # Machine-dependent subdirectories
+ MACHDEP=	@MACHDEP@
++LIB=		@LIB@
+ 
+ # Install prefix for architecture-independent files
+ prefix=		@prefix@
+@@ -91,7 +92,7 @@ LIBDIR=		@libdir@
+ MANDIR=		@mandir@
+ INCLUDEDIR=	@includedir@
+ CONFINCLUDEDIR=	$(exec_prefix)/include
+-SCRIPTDIR=	$(prefix)/lib
++SCRIPTDIR=	$(prefix)/@LIB@
+ 
+ # Detailed destination directories
+ BINLIBDEST=	$(LIBDIR)/python$(VERSION)
+@@ -509,6 +510,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+ 		-DEXEC_PREFIX='"$(exec_prefix)"' \
+ 		-DVERSION='"$(VERSION)"' \
+ 		-DVPATH='"$(VPATH)"' \
++		-DLIB='"$(LIB)"' \
+ 		-o $@ $(srcdir)/Modules/getpath.c
+ 
+ Modules/python.o: $(srcdir)/Modules/python.c
+@@ -540,7 +542,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
+ Python/compile.o Python/symtable.o: $(GRAMMAR_H) $(AST_H)
+ 
+ Python/getplatform.o: $(srcdir)/Python/getplatform.c
+-		$(CC) -c $(PY_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
++		$(CC) -c $(PY_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -DLIB='"$(LIB)"' -o $@ $(srcdir)/Python/getplatform.c
+ 
+ Python/importdl.o: $(srcdir)/Python/importdl.c
+ 		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
+Index: Python-2.6.6/Modules/getpath.c
+===================================================================
+--- Python-2.6.6.orig/Modules/getpath.c
++++ Python-2.6.6/Modules/getpath.c
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
+Index: Python-2.6.6/Python/getplatform.c
+===================================================================
+--- Python-2.6.6.orig/Python/getplatform.c
++++ Python-2.6.6/Python/getplatform.c
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
+Index: Python-2.6.6/Python/sysmodule.c
+===================================================================
+--- Python-2.6.6.orig/Python/sysmodule.c
++++ Python-2.6.6/Python/sysmodule.c
+@@ -1379,6 +1379,8 @@ _PySys_Init(void)
+                         PyString_FromString(Py_GetCopyright()));
+     SET_SYS_FROM_STRING("platform",
+                         PyString_FromString(Py_GetPlatform()));
++    SET_SYS_FROM_STRING("lib",
++                PyString_FromString(Py_GetLib()));
+     SET_SYS_FROM_STRING("executable",
+                         PyString_FromString(Py_GetProgramFullPath()));
+     SET_SYS_FROM_STRING("prefix",
+Index: Python-2.6.6/configure.in
+===================================================================
+--- Python-2.6.6.orig/configure.in
++++ Python-2.6.6/configure.in
+@@ -613,6 +613,10 @@ SunOS*)
+     ;;
+ esac
+ 
++AC_SUBST(LIB)
++AC_MSG_CHECKING(LIB)
++LIB=`basename ${LIBDIR}`
++AC_MSG_RESULT($LIB)
+ 
+ AC_SUBST(LIBRARY)
+ AC_MSG_CHECKING(LIBRARY)
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 24f1d33..8842b3f 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -17,6 +17,7 @@ SRC_URI = "\
   file://06-avoid_usr_lib_termcap_path_in_linking.patch \
   file://99-ignore-optimization-flag.patch \
   ${DISTRO_SRC_URI} \
+  file://multilib.patch \
 "
 
 SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
-- 
1.7.0.4




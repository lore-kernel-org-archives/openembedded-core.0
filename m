Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QepLj-0006n7-ON
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 16:14:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jul 2011 07:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="24941213"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2011 07:10:46 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  7 Jul 2011 22:10:08 +0800
Message-Id: <46e97fb7d91eecd7e874e65a59b88a1e51ca131f.1310047266.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310047266.git.ke.yu@intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
In-Reply-To: <cover.1310047266.git.ke.yu@intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
Subject: [PATCH 4/8] python: fix for libdir=/usr/lib64 case
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
X-List-Received-Date: Thu, 07 Jul 2011 14:14:40 -0000

python has several place hard code "lib" which breaks build
when libdir=/usr/lib64. SUSE has a patch to fix this issue.

So this patch add the SUSE patch to address this issue

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-devtools/python/python/multilib.patch |  295 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
 2 files changed, 297 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/multilib.patch

diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
new file mode 100644
index 0000000..71c890b
--- /dev/null
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -0,0 +1,295 @@
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
+diff --git a/Include/pythonrun.h b/Include/pythonrun.h
+index 039b498..e8ee59a 100644
+--- a/Include/pythonrun.h
++++ b/Include/pythonrun.h
+@@ -108,6 +108,8 @@ PyAPI_FUNC(char *) Py_GetPath(void);
+ /* In their own files */
+ PyAPI_FUNC(const char *) Py_GetVersion(void);
+ PyAPI_FUNC(const char *) Py_GetPlatform(void);
++PyAPI_FUNC(const char *) Py_GetArch(void);
++PyAPI_FUNC(const char *) Py_GetLib(void);
+ PyAPI_FUNC(const char *) Py_GetCopyright(void);
+ PyAPI_FUNC(const char *) Py_GetCompiler(void);
+ PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
+diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/install.py
+index 76efe3b..2a9913f 100644
+--- a/Lib/distutils/command/install.py
++++ b/Lib/distutils/command/install.py
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
+diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
+index 350e48c..13bb5da 100644
+--- a/Lib/distutils/sysconfig.py
++++ b/Lib/distutils/sysconfig.py
+@@ -119,8 +119,11 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
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
+diff --git a/Lib/pydoc.py b/Lib/pydoc.py
+index 20f4952..4ffb644 100755
+--- a/Lib/pydoc.py
++++ b/Lib/pydoc.py
+@@ -349,7 +349,7 @@ class Doc:
+ 
+         docloc = os.environ.get("PYTHONDOCS",
+                                 "http://docs.python.org/library")
+-        basedir = os.path.join(sys.exec_prefix, "lib",
++        basedir = os.path.join(sys.exec_prefix, sys.lib,
+                                "python"+sys.version[0:3])
+         if (isinstance(object, type(os)) and
+             (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
+diff --git a/Lib/site.py b/Lib/site.py
+index 66c56c2..12b1c8e 100644
+--- a/Lib/site.py
++++ b/Lib/site.py
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
+diff --git a/Lib/test/test_dl.py b/Lib/test/test_dl.py
+index c04bc1b..17c0546 100755
+--- a/Lib/test/test_dl.py
++++ b/Lib/test/test_dl.py
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
+diff --git a/Lib/trace.py b/Lib/trace.py
+index 3611f88..9c13aa1 100644
+--- a/Lib/trace.py
++++ b/Lib/trace.py
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
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 943a120..a6f1669 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -75,6 +75,8 @@ PY_CFLAGS=	$(CFLAGS) $(CPPFLAGS) $(CFLAGSFORSHARED) -DPy_BUILD_CORE
+ 
+ # Machine-dependent subdirectories
+ MACHDEP=	@MACHDEP@
++LIB=		@LIB@
++ARCH=		@ARCH@
+ 
+ # Install prefix for architecture-independent files
+ prefix=		@prefix@
+@@ -91,7 +93,7 @@ LIBDIR=		@libdir@
+ MANDIR=		@mandir@
+ INCLUDEDIR=	@includedir@
+ CONFINCLUDEDIR=	$(exec_prefix)/include
+-SCRIPTDIR=	$(prefix)/lib
++SCRIPTDIR=	$(prefix)/@LIB@
+ 
+ # Detailed destination directories
+ BINLIBDEST=	$(LIBDIR)/python$(VERSION)
+@@ -510,6 +512,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
+ 		-DEXEC_PREFIX='"$(exec_prefix)"' \
+ 		-DVERSION='"$(VERSION)"' \
+ 		-DVPATH='"$(VPATH)"' \
++		-DARCH='"$(ARCH)"' -DLIB='"$(LIB)"' \
+ 		-o $@ $(srcdir)/Modules/getpath.c
+ 
+ Modules/python.o: $(srcdir)/Modules/python.c
+@@ -541,7 +544,7 @@ $(AST_C): $(AST_ASDL) $(ASDLGEN_FILES)
+ Python/compile.o Python/symtable.o: $(GRAMMAR_H) $(AST_H)
+ 
+ Python/getplatform.o: $(srcdir)/Python/getplatform.c
+-		$(CC) -c $(PY_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
++		$(CC) -c $(PY_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -DARCH='"$(ARCH)"' -DLIB='"$(LIB)"' -o $@ $(srcdir)/Python/getplatform.c
+ 
+ Python/importdl.o: $(srcdir)/Python/importdl.c
+ 		$(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
+diff --git a/Modules/getpath.c b/Modules/getpath.c
+index f28f4c6..24f8e5e 100644
+--- a/Modules/getpath.c
++++ b/Modules/getpath.c
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
+diff --git a/Python/getplatform.c b/Python/getplatform.c
+index 6899140..66a49c6 100644
+--- a/Python/getplatform.c
++++ b/Python/getplatform.c
+@@ -10,3 +10,23 @@ Py_GetPlatform(void)
+ {
+ 	return PLATFORM;
+ }
++
++#ifndef ARCH
++#define ARCH "unknown"
++#endif
++
++const char *
++Py_GetArch(void)
++{
++	return ARCH;
++}
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
+diff --git a/Python/sysmodule.c b/Python/sysmodule.c
+index 6703ba5..9ef4bd6 100644
+--- a/Python/sysmodule.c
++++ b/Python/sysmodule.c
+@@ -1379,6 +1379,10 @@ _PySys_Init(void)
+                         PyString_FromString(Py_GetCopyright()));
+     SET_SYS_FROM_STRING("platform",
+                         PyString_FromString(Py_GetPlatform()));
++    SET_SYS_FROM_STRING("arch",
++                PyString_FromString(Py_GetArch()));
++    SET_SYS_FROM_STRING("lib",
++                PyString_FromString(Py_GetLib()));
+     SET_SYS_FROM_STRING("executable",
+                         PyString_FromString(Py_GetProgramFullPath()));
+     SET_SYS_FROM_STRING("prefix",
+diff --git a/configure.in b/configure.in
+index 50b8072..8152ef4 100644
+--- a/configure.in
++++ b/configure.in
+@@ -613,6 +613,41 @@ SunOS*)
+     ;;
+ esac
+ 
++AC_SUBST(ARCH)
++AC_MSG_CHECKING(ARCH)
++ARCH=`uname -m`
++case $ARCH in
++i?86) ARCH=i386;;
++esac
++AC_MSG_RESULT($ARCH)
++
++AC_SUBST(LIB)
++AC_MSG_CHECKING(LIB)
++case $ac_sys_system in
++Linux*)
++  # Test if the compiler is 64bit
++  echo 'int i;' > conftest.$ac_ext
++  python_cv_cc_64bit_output=no
++  if AC_TRY_EVAL(ac_compile); then
++    case `/usr/bin/file conftest.$ac_objext` in
++    *"ELF 64"*)
++      python_cv_cc_64bit_output=yes
++      ;;
++    esac
++  fi
++  rm -rf conftest*
++  ;;
++esac
++
++case $ARCH:$python_cv_cc_64bit_output in
++ppc64:yes | powerpc64:yes | s390x:yes | sparc64:yes | x86_64:yes)
++  LIB="lib64"
++  ;;
++*:*)
++  LIB="lib"
++  ;;
++esac
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




Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF416BBD2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:21 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj1so5122862pad.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=K9UgJyRiNzSFPhziX00XIlYsLIELZr+mpY0J3DnFAjI=;
	b=SigVLF+RER1qnaYrYdrY+oHnHLDms3jFk7k63e/wB+8Gao7k8XYpyk6zL1QO8CBMZG
	kE8EI6IM+Svog6ogc8QNSkPJwJYDIT3nslllWhYnN5O8JzI8zQOOwlCbIGoNLnCVmUTD
	iEXPGGuoay/yrJ5ESgqaYJ2yg2i4RtLPmtziWcoQzlebwrgsKmo39KYSTclARLGJqKWU
	d/OMvt2SlYf96PhatQU9GnXjy+RkyUTZf2wG5UxXbnOSG7hRdZYMh1WoOhLVp7yHPZRT
	m73T++pjCEAP3CETNs3lSr0kCixcQVGH8uGCrsEzzIAOUPyPw2+BG6NLzJSBAvS+gsOp
	UsjA==
X-Received: by 10.68.252.33 with SMTP id zp1mr22727093pbc.95.1377623782542;
	Tue, 27 Aug 2013 10:16:22 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:14 -0700
Message-Id: <962c08ba304c2d3612fe0823982c50ededd7e4c6.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 15/20] python3, python3-native: Consider OE staging installation
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:21 -0000

We use native python in disutils bbclass and this needs
to peek into target sysroot when building plugins in cross
environment. Otherwise anything that inherits distutils3.bbclass
will not build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-native_3.3.2.bb                 |   1 +
 ...2-distutils-prefix-is-inside-staging-area.patch |  78 ++++++++++++++
 .../python/python3/python-3.3-multilib.patch       | 120 +++++++++------------
 meta/recipes-devtools/python/python3_3.3.2.bb      |   1 +
 4 files changed, 131 insertions(+), 69 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.3.2.bb b/meta/recipes-devtools/python/python3-native_3.3.2.bb
index f7221ed..012deba 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.2.bb
@@ -5,6 +5,7 @@ PYTHON_MAJMIN = "3.3"
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+file://12-distutils-prefix-is-inside-staging-area.patch \
 file://000-cross-compile.patch \
 file://020-dont-compile-python-files.patch \
 file://030-fixup-include-dirs.patch \
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
new file mode 100644
index 0000000..c5846a5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -0,0 +1,78 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+# The proper prefix is inside our staging area.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+# Signed-off-by: Phil Blundell <philb@gnu.org>
+# Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: Python-3.3.2/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-3.3.2.orig/Lib/distutils/sysconfig.py	2013-07-30 00:00:52.769749805 -0700
++++ Python-3.3.2/Lib/distutils/sysconfig.py	2013-07-30 00:16:22.545767248 -0700
+@@ -16,10 +16,11 @@
+ from .errors import DistutilsPlatformError
+ 
+ # These are needed in a couple of spots, so just compute them once.
+-PREFIX = os.path.normpath(sys.prefix)
+-EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
+-BASE_PREFIX = os.path.normpath(sys.base_prefix)
+-BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
++PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++BASE_PREFIX = os.path.normpath(sys.base_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++BASE_EXEC_PREFIX= os.path.normpath(sys.base_exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++
+ 
+ # Path to the base directory of the project. On Windows the binary may
+ # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
+@@ -93,7 +94,9 @@
+     If 'prefix' is supplied, use it instead of sys.base_prefix or
+     sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
+     """
+-    if prefix is None:
++    if prefix is None and os.environ['STAGING_INCDIR'] != "":
++        prefix = os.environ['STAGING_INCDIR'].rstrip('include')
++    elif prefix is None:
+         prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
+     if os.name == "posix":
+         if python_build:
+@@ -136,6 +139,12 @@
+     If 'prefix' is supplied, use it instead of sys.base_prefix or
+     sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
+     """
++    if prefix is None and os.environ['STAGING_LIBDIR'] != "":
++        lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
++        prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
++    else:
++        lib_basename = sys.lib
++
+     if prefix is None:
+         if standard_lib:
+             prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
+@@ -144,7 +153,7 @@
+ 
+     if os.name == "posix":
+         libpython = os.path.join(prefix,
+-                                 "lib", "python" + get_python_version())
++                                 lib_basename, "python" + get_python_version())
+         if standard_lib:
+             return libpython
+         else:
+@@ -249,7 +258,7 @@
+     else:
+         # The name of the config.h file changed in 2.2
+         config_h = 'pyconfig.h'
+-    return os.path.join(inc_dir, config_h)
++    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ 
+ def get_makefile_filename():
+@@ -258,7 +267,7 @@
+         return os.path.join(_sys_home or project_base, "Makefile")
+     lib_dir = get_python_lib(plat_specific=0, standard_lib=1)
+     config_file = 'config-{}{}'.format(get_python_version(), build_flags)
+-    return os.path.join(lib_dir, config_file, 'Makefile')
++    return os.path.join(lib_dir, config_file, 'Makefile').replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ 
+ def parse_config_h(fp, g=None):
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 426e299..679f49f 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -1,7 +1,7 @@
-Index: Python-3.3.0rc2/Include/pythonrun.h
+Index: Python-3.3.2/Include/pythonrun.h
 ===================================================================
---- Python-3.3.0rc2.orig/Include/pythonrun.h	2012-09-09 02:10:55.000000000 -0700
-+++ Python-3.3.0rc2/Include/pythonrun.h	2012-09-20 22:46:53.273124016 -0700
+--- Python-3.3.2.orig/Include/pythonrun.h	2013-05-15 09:32:54.000000000 -0700
++++ Python-3.3.2/Include/pythonrun.h	2013-07-27 16:19:54.099877246 -0700
 @@ -181,6 +181,8 @@
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
@@ -11,10 +11,10 @@ Index: Python-3.3.0rc2/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-3.3.0rc2/Lib/distutils/command/install.py
+Index: Python-3.3.2/Lib/distutils/command/install.py
 ===================================================================
---- Python-3.3.0rc2.orig/Lib/distutils/command/install.py	2012-09-09 02:10:56.000000000 -0700
-+++ Python-3.3.0rc2/Lib/distutils/command/install.py	2012-09-20 22:46:53.273124016 -0700
+--- Python-3.3.2.orig/Lib/distutils/command/install.py	2013-05-15 09:32:54.000000000 -0700
++++ Python-3.3.2/Lib/distutils/command/install.py	2013-07-27 16:19:54.099877246 -0700
 @@ -25,6 +25,8 @@
      from site import USER_SITE
      HAS_USER_SITE = True
@@ -33,29 +33,11 @@ Index: Python-3.3.0rc2/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-3.3.0rc2/Lib/distutils/sysconfig.py
+Index: Python-3.3.2/Lib/pydoc.py
 ===================================================================
---- Python-3.3.0rc2.orig/Lib/distutils/sysconfig.py	2012-09-09 02:10:56.000000000 -0700
-+++ Python-3.3.0rc2/Lib/distutils/sysconfig.py	2012-09-20 22:46:53.273124016 -0700
-@@ -139,8 +139,11 @@
-             prefix = plat_specific and EXEC_PREFIX or PREFIX
- 
-     if os.name == "posix":
--        libpython = os.path.join(prefix,
--                                 "lib", "python" + get_python_version())
-+        if plat_specific or standard_lib:
-+            lib = sys.lib
-+        else:
-+            lib = "lib"
-+        libpython = os.path.join(prefix, lib, "python" + get_python_version())
-         if standard_lib:
-             return libpython
-         else:
-Index: Python-3.3.0rc2/Lib/pydoc.py
-===================================================================
---- Python-3.3.0rc2.orig/Lib/pydoc.py	2012-09-09 02:10:59.000000000 -0700
-+++ Python-3.3.0rc2/Lib/pydoc.py	2012-09-20 22:46:53.273124016 -0700
-@@ -369,7 +369,7 @@
+--- Python-3.3.2.orig/Lib/pydoc.py	2013-05-15 09:32:55.000000000 -0700
++++ Python-3.3.2/Lib/pydoc.py	2013-07-27 16:19:54.103877246 -0700
+@@ -372,7 +372,7 @@
  
          docloc = os.environ.get("PYTHONDOCS", self.PYTHONDOCS)
  
@@ -64,10 +46,10 @@ Index: Python-3.3.0rc2/Lib/pydoc.py
                                 "python%d.%d" %  sys.version_info[:2])
          if (isinstance(object, type(os)) and
              (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-3.3.0rc2/Lib/site.py
+Index: Python-3.3.2/Lib/site.py
 ===================================================================
---- Python-3.3.0rc2.orig/Lib/site.py	2012-09-09 02:10:59.000000000 -0700
-+++ Python-3.3.0rc2/Lib/site.py	2012-09-20 22:46:53.273124016 -0700
+--- Python-3.3.2.orig/Lib/site.py	2013-05-15 09:32:55.000000000 -0700
++++ Python-3.3.2/Lib/site.py	2013-07-27 16:19:54.103877246 -0700
 @@ -303,13 +303,19 @@
          if sys.platform in ('os2emx', 'riscos'):
              sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
@@ -91,11 +73,11 @@ Index: Python-3.3.0rc2/Lib/site.py
          if sys.platform == "darwin":
              # for framework builds *only* we add the standard Apple
              # locations.
-Index: Python-3.3.0rc2/Lib/trace.py
+Index: Python-3.3.2/Lib/trace.py
 ===================================================================
---- Python-3.3.0rc2.orig/Lib/trace.py	2012-09-09 02:11:04.000000000 -0700
-+++ Python-3.3.0rc2/Lib/trace.py	2012-09-20 22:46:53.273124016 -0700
-@@ -750,10 +750,10 @@
+--- Python-3.3.2.orig/Lib/trace.py	2013-05-15 09:32:56.000000000 -0700
++++ Python-3.3.2/Lib/trace.py	2013-07-27 16:19:54.103877246 -0700
+@@ -751,10 +751,10 @@
                  # should I also call expanduser? (after all, could use $HOME)
  
                  s = s.replace("$prefix",
@@ -108,20 +90,20 @@ Index: Python-3.3.0rc2/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-3.3.0rc2/Makefile.pre.in
+Index: Python-3.3.2/Makefile.pre.in
 ===================================================================
---- Python-3.3.0rc2.orig/Makefile.pre.in	2012-09-20 22:45:52.000000000 -0700
-+++ Python-3.3.0rc2/Makefile.pre.in	2012-09-20 22:46:53.277124015 -0700
-@@ -92,6 +92,8 @@
+--- Python-3.3.2.orig/Makefile.pre.in	2013-07-27 16:19:16.000000000 -0700
++++ Python-3.3.2/Makefile.pre.in	2013-07-27 16:19:54.103877246 -0700
+@@ -96,6 +96,8 @@
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
 +LIB=		@LIB@
 +ARCH=		@ARCH@
  
- # Install prefix for architecture-independent files
- prefix=		@prefix@
-@@ -108,7 +110,7 @@
+ # Multiarch directory (may be empty)
+ MULTIARCH=	@MULTIARCH@
+@@ -115,7 +117,7 @@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -130,7 +112,7 @@ Index: Python-3.3.0rc2/Makefile.pre.in
  ABIFLAGS=	@ABIFLAGS@
  
  # Detailed destination directories
-@@ -618,6 +620,7 @@
+@@ -635,6 +637,7 @@
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -138,7 +120,7 @@ Index: Python-3.3.0rc2/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -669,7 +672,7 @@
+@@ -701,7 +704,7 @@
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -147,10 +129,10 @@ Index: Python-3.3.0rc2/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-3.3.0rc2/Modules/getpath.c
+Index: Python-3.3.2/Modules/getpath.c
 ===================================================================
---- Python-3.3.0rc2.orig/Modules/getpath.c	2012-09-09 02:11:09.000000000 -0700
-+++ Python-3.3.0rc2/Modules/getpath.c	2012-09-20 22:46:53.277124015 -0700
+--- Python-3.3.2.orig/Modules/getpath.c	2013-05-15 09:32:59.000000000 -0700
++++ Python-3.3.2/Modules/getpath.c	2013-07-27 16:19:54.107877246 -0700
 @@ -121,9 +121,11 @@
  #define EXEC_PREFIX PREFIX
  #endif
@@ -174,10 +156,10 @@ Index: Python-3.3.0rc2/Modules/getpath.c
  
  static void
  reduce(wchar_t *dir)
-Index: Python-3.3.0rc2/Python/getplatform.c
+Index: Python-3.3.2/Python/getplatform.c
 ===================================================================
---- Python-3.3.0rc2.orig/Python/getplatform.c	2012-09-09 02:11:12.000000000 -0700
-+++ Python-3.3.0rc2/Python/getplatform.c	2012-09-20 22:46:53.277124015 -0700
+--- Python-3.3.2.orig/Python/getplatform.c	2013-05-15 09:33:00.000000000 -0700
++++ Python-3.3.2/Python/getplatform.c	2013-07-27 16:19:54.107877246 -0700
 @@ -10,3 +10,23 @@
  {
  	return PLATFORM;
@@ -202,10 +184,10 @@ Index: Python-3.3.0rc2/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-3.3.0rc2/Python/sysmodule.c
+Index: Python-3.3.2/Python/sysmodule.c
 ===================================================================
---- Python-3.3.0rc2.orig/Python/sysmodule.c	2012-09-09 02:11:12.000000000 -0700
-+++ Python-3.3.0rc2/Python/sysmodule.c	2012-09-20 22:46:53.277124015 -0700
+--- Python-3.3.2.orig/Python/sysmodule.c	2013-05-15 09:33:00.000000000 -0700
++++ Python-3.3.2/Python/sysmodule.c	2013-07-27 16:19:54.107877246 -0700
 @@ -1612,6 +1612,10 @@
                          PyUnicode_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
@@ -217,11 +199,11 @@ Index: Python-3.3.0rc2/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyUnicode_FromWideChar(
                                 Py_GetProgramFullPath(), -1));
-Index: Python-3.3.0rc2/setup.py
+Index: Python-3.3.2/setup.py
 ===================================================================
---- Python-3.3.0rc2.orig/setup.py	2012-09-20 22:45:53.000000000 -0700
-+++ Python-3.3.0rc2/setup.py	2012-09-20 22:46:53.277124015 -0700
-@@ -462,7 +462,7 @@
+--- Python-3.3.2.orig/setup.py	2013-07-27 16:19:17.000000000 -0700
++++ Python-3.3.2/setup.py	2013-07-27 16:19:54.107877246 -0700
+@@ -439,7 +439,7 @@
          # directories (i.e. '.' and 'Include') must be first.  See issue
          # 10520.
          if not cross_compiling:
@@ -230,7 +212,7 @@ Index: Python-3.3.0rc2/setup.py
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
-@@ -520,8 +520,7 @@
+@@ -497,8 +497,7 @@
          # be assumed that no additional -I,-L directives are needed.
          if not cross_compiling:
              lib_dirs = self.compiler.library_dirs + [
@@ -239,8 +221,8 @@ Index: Python-3.3.0rc2/setup.py
 +                '/' + sys.lib, '/usr/' + sys.lib,
                  ]
              inc_dirs = self.compiler.include_dirs + ['/usr/include']
-         if cross_compiling:
-@@ -699,11 +698,11 @@
+         else:
+@@ -675,11 +674,11 @@
              elif curses_library:
                  readline_libs.append(curses_library)
              elif self.compiler.find_library_file(lib_dirs +
@@ -254,10 +236,10 @@ Index: Python-3.3.0rc2/setup.py
                                     extra_link_args=readline_extra_link_args,
                                     libraries=readline_libs) )
          else:
-Index: Python-3.3.0rc2/Lib/sysconfig.py
+Index: Python-3.3.2/Lib/sysconfig.py
 ===================================================================
---- Python-3.3.0rc2.orig/Lib/sysconfig.py	2012-09-09 02:11:00.000000000 -0700
-+++ Python-3.3.0rc2/Lib/sysconfig.py	2012-09-20 22:46:53.277124015 -0700
+--- Python-3.3.2.orig/Lib/sysconfig.py	2013-05-15 09:32:55.000000000 -0700
++++ Python-3.3.2/Lib/sysconfig.py	2013-07-27 16:19:54.111877246 -0700
 @@ -21,10 +21,10 @@
  
  _INSTALL_SCHEMES = {
@@ -300,13 +282,13 @@ Index: Python-3.3.0rc2/Lib/sysconfig.py
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
          'data': '{userbase}',
-Index: Python-3.3.0b2/configure.ac
+Index: Python-3.3.2/configure.ac
 ===================================================================
---- Python-3.3.0b2.orig/configure.ac	2012-08-11 08:54:25.000000000 +0200
-+++ Python-3.3.0b2/configure.ac	2012-08-23 14:49:29.000000000 +0200
-@@ -746,6 +746,41 @@
-     esac;;
- esac
+--- Python-3.3.2.orig/configure.ac	2013-05-15 09:33:00.000000000 -0700
++++ Python-3.3.2/configure.ac	2013-07-27 16:19:54.111877246 -0700
+@@ -769,6 +769,41 @@
+ MULTIARCH=$($CC --print-multiarch 2>/dev/null)
+ AC_SUBST(MULTIARCH)
  
 +AC_SUBST(ARCH)
 +AC_MSG_CHECKING(ARCH)
diff --git a/meta/recipes-devtools/python/python3_3.3.2.bb b/meta/recipes-devtools/python/python3_3.3.2.bb
index b92824e..768d44b 100644
--- a/meta/recipes-devtools/python/python3_3.3.2.bb
+++ b/meta/recipes-devtools/python/python3_3.3.2.bb
@@ -7,6 +7,7 @@ PYTHON_BINABI= "${PYTHON_MAJMIN}m"
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+file://12-distutils-prefix-is-inside-staging-area.patch \
 file://000-cross-compile.patch \
 file://020-dont-compile-python-files.patch \
 file://030-fixup-include-dirs.patch \
-- 
1.8.3.4



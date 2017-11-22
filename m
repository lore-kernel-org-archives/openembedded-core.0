Return-Path: <limon.anibal@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8798470016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 19:46:38 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id b54so14528598otd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 11:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KZYcFezXYD2KZga2kM6MQ03bGsvGHsQncbX/wZ/phR0=;
	b=sfNssO1vdvCW4SEGl5YE3PTtItYrOToiAXTPU8Fafp2pAIRr8TyZwOsf/eV4wJcb+m
	GVrThiE0/wltrtPAA3LVxr+Yss3IFGsqWGkHgqXsf3pdN86xsYlK/N7SnAOqFFI5jsQP
	4b8sjcDjpqbdXokWIobZntqxFGEt1hcRPQauOYqdgXRnJbJDlLte+cz0VPjTuKt6y9R/
	Ik4AGgkJFPlFBCSZsNo8coRkKsOWjj38WS72TU7i1DEU5tzP01WfdQz+740VVKQmJSME
	gG/+Z2CcPLosm/nczlw3GjrYtoHOk71krFddCI/KF4ckfXOFSFr9zlp36w8NHOMFtpO7
	lmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KZYcFezXYD2KZga2kM6MQ03bGsvGHsQncbX/wZ/phR0=;
	b=te/ddckdah5cew3iAr3WKbtLqRz4l8JFbwhXN457LBFplSUHqIOiJhH41iIV9XZTQR
	ySqIwzK/GMYVdIVFX+SURUzFYSIBj7ergnO9AtkcFfawOWIqwarjfE/IyKzG2o/HDd50
	wORH9lDeyNIv6VQrEy/Zol+0VHcztntPhG0R5MwCEqMExBOHqIEaTYN5sMpayYPPky3T
	Lk7SCu8gXoV92hefVnSCNvTxpznFcXv8zet7UsDRkYT3DoDC+9COlKgFoxi3t23MPR/X
	YG15rYx2UhE8C2iydDOYI9Tf1uKV69oGg7GFTnsM5tFb2gN8VULb8sNMNN2I+qdsvbWM
	Ii2A==
X-Gm-Message-State: AJaThX7an51Dk8mB+esULzzy8dEydtPJdwST9KAbhmebTahMt+VE2Wyp
	ADAc1Jy6PH2+TWnJqOp3mOHkPw2P
X-Google-Smtp-Source: AGs4zMZtMTcDEMzwgGnSUWvXnaw1jrb1mUwJxztGMbBX4J2W1CQunmKmkiNiUh5K1y+UbYiAoFeiZw==
X-Received: by 10.157.87.101 with SMTP id x34mr13883730oti.204.1511379999011; 
	Wed, 22 Nov 2017 11:46:39 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id j9sm3599719oth.31.2017.11.22.11.46.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Nov 2017 11:46:38 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 13:46:19 -0600
Message-Id: <20171122194619.31291-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][morty] python3: do not hardcode "lib" into site-packages search path
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
X-List-Received-Date: Wed, 22 Nov 2017 19:46:38 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

This was not working in multilib or x32 setups and amazingly, was not
noticed until now.

The actual modification is in Lib/site.py, the rest is just devtool moving things around in the patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3/python-3.3-multilib.patch       | 290 ++++++++++++---------
 1 file changed, 165 insertions(+), 125 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 860190340e..08c4403cbf 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -1,16 +1,34 @@
-Upstream-Status: Pending
-
-get the sys.lib from python itself and do not use hardcoded value of 'lib'
+From 51fe6f22d0ba113674fb358bd11d75fe659bd26e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 14 May 2013 15:00:26 -0700
+Subject: [PATCH 01/13] get the sys.lib from python itself and do not use
+ hardcoded value of 'lib'
 
 02/2015 Rebased for 3.4.2
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-3.5.2/Include/pythonrun.h
-===================================================================
---- Python-3.5.2.orig/Include/pythonrun.h
-+++ Python-3.5.2/Include/pythonrun.h
+---
+ Include/pythonrun.h              |  3 +++
+ Lib/distutils/command/install.py |  4 +++-
+ Lib/pydoc.py                     |  2 +-
+ Lib/site.py                      |  4 ++--
+ Lib/sysconfig.py                 | 18 +++++++++---------
+ Lib/trace.py                     |  4 ++--
+ Makefile.pre.in                  |  7 +++++--
+ Modules/getpath.c                | 10 +++++++++-
+ Python/getplatform.c             | 20 ++++++++++++++++++++
+ Python/sysmodule.c               |  4 ++++
+ configure.ac                     | 35 +++++++++++++++++++++++++++++++++++
+ setup.py                         |  9 ++++-----
+ 12 files changed, 97 insertions(+), 23 deletions(-)
+
+diff --git a/Include/pythonrun.h b/Include/pythonrun.h
+index 9c2e813..2f79cb6 100644
+--- a/Include/pythonrun.h
++++ b/Include/pythonrun.h
 @@ -23,6 +23,9 @@ typedef struct {
  } PyCompilerFlags;
  #endif
@@ -21,10 +39,10 @@ Index: Python-3.5.2/Include/pythonrun.h
  #ifndef Py_LIMITED_API
  PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
  PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerFlags *);
-Index: Python-3.5.2/Lib/distutils/command/install.py
-===================================================================
---- Python-3.5.2.orig/Lib/distutils/command/install.py
-+++ Python-3.5.2/Lib/distutils/command/install.py
+diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/install.py
+index 67db007..b46b45b 100644
+--- a/Lib/distutils/command/install.py
++++ b/Lib/distutils/command/install.py
 @@ -19,6 +19,8 @@ from site import USER_BASE
  from site import USER_SITE
  HAS_USER_SITE = True
@@ -43,10 +61,10 @@ Index: Python-3.5.2/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-3.5.2/Lib/pydoc.py
-===================================================================
---- Python-3.5.2.orig/Lib/pydoc.py
-+++ Python-3.5.2/Lib/pydoc.py
+diff --git a/Lib/pydoc.py b/Lib/pydoc.py
+index 3ca08c9..6528730 100755
+--- a/Lib/pydoc.py
++++ b/Lib/pydoc.py
 @@ -384,7 +384,7 @@ class Doc:
      docmodule = docclass = docroutine = docother = docproperty = docdata = fail
  
@@ -56,10 +74,75 @@ Index: Python-3.5.2/Lib/pydoc.py
                                         "python%d.%d" %  sys.version_info[:2])):
          """Return the location of module docs or None"""
  
-Index: Python-3.5.2/Lib/trace.py
-===================================================================
---- Python-3.5.2.orig/Lib/trace.py
-+++ Python-3.5.2/Lib/trace.py
+diff --git a/Lib/site.py b/Lib/site.py
+index 3f78ef5..511931e 100644
+--- a/Lib/site.py
++++ b/Lib/site.py
+@@ -303,12 +303,12 @@ def getsitepackages(prefixes=None):
+         seen.add(prefix)
+ 
+         if os.sep == '/':
+-            sitepackages.append(os.path.join(prefix, "lib",
++            sitepackages.append(os.path.join(prefix, sys.lib,
+                                         "python" + sys.version[:3],
+                                         "site-packages"))
+         else:
+             sitepackages.append(prefix)
+-            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
+         if sys.platform == "darwin":
+             # for framework builds *only* we add the standard Apple
+             # locations.
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index 9c34be0..3d1181a 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -20,10 +20,10 @@ __all__ = [
+ 
+ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+-        'stdlib': '{installed_base}/lib/python{py_version_short}',
+-        'platstdlib': '{platbase}/lib/python{py_version_short}',
++        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{base}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
++        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include':
+             '{installed_base}/include/python{py_version_short}{abiflags}',
+         'platinclude':
+@@ -32,10 +32,10 @@ _INSTALL_SCHEMES = {
+         'data': '{base}',
+         },
+     'posix_home': {
+-        'stdlib': '{installed_base}/lib/python',
+-        'platstdlib': '{base}/lib/python',
++        'stdlib': '{installed_base}/'+sys.lib+'/python',
++        'platstdlib': '{base}/'+sys.lib+'/python',
+         'purelib': '{base}/lib/python',
+-        'platlib': '{base}/lib/python',
++        'platlib': '{base}/'+sys.lib+'/python',
+         'include': '{installed_base}/include/python',
+         'platinclude': '{installed_base}/include/python',
+         'scripts': '{base}/bin',
+@@ -61,10 +61,10 @@ _INSTALL_SCHEMES = {
+         'data': '{userbase}',
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
+         'data': '{userbase}',
+diff --git a/Lib/trace.py b/Lib/trace.py
+index f108266..7fd83f2 100755
+--- a/Lib/trace.py
++++ b/Lib/trace.py
 @@ -749,10 +749,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
@@ -73,11 +156,11 @@ Index: Python-3.5.2/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-3.5.2/Makefile.pre.in
-===================================================================
---- Python-3.5.2.orig/Makefile.pre.in
-+++ Python-3.5.2/Makefile.pre.in
-@@ -106,6 +106,8 @@ PY_CORE_CFLAGS=	$(PY_CFLAGS) $(PY_CFLAGS
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 109f402..61a41e2 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -106,6 +106,8 @@ PY_CORE_CFLAGS=	$(PY_CFLAGS) $(PY_CFLAGS_NODIST) $(PY_CPPFLAGS) $(CFLAGSFORSHARE
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
@@ -95,7 +178,7 @@ Index: Python-3.5.2/Makefile.pre.in
  ABIFLAGS=	@ABIFLAGS@
  
  # Detailed destination directories
-@@ -755,6 +757,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -755,6 +757,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -103,7 +186,7 @@ Index: Python-3.5.2/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Programs/python.o: $(srcdir)/Programs/python.c
-@@ -835,7 +838,7 @@ $(OPCODE_H): $(srcdir)/Lib/opcode.py $(O
+@@ -835,7 +838,7 @@ $(OPCODE_H): $(srcdir)/Lib/opcode.py $(OPCODE_H_SCRIPT)
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -112,10 +195,10 @@ Index: Python-3.5.2/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-3.5.2/Modules/getpath.c
-===================================================================
---- Python-3.5.2.orig/Modules/getpath.c
-+++ Python-3.5.2/Modules/getpath.c
+diff --git a/Modules/getpath.c b/Modules/getpath.c
+index 18deb60..a01c3f8 100644
+--- a/Modules/getpath.c
++++ b/Modules/getpath.c
 @@ -105,6 +105,13 @@
  #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
  #endif
@@ -147,10 +230,10 @@ Index: Python-3.5.2/Modules/getpath.c
  
      if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
          Py_FatalError(
-Index: Python-3.5.2/Python/getplatform.c
-===================================================================
---- Python-3.5.2.orig/Python/getplatform.c
-+++ Python-3.5.2/Python/getplatform.c
+diff --git a/Python/getplatform.c b/Python/getplatform.c
+index 6899140..66a49c6 100644
+--- a/Python/getplatform.c
++++ b/Python/getplatform.c
 @@ -10,3 +10,23 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -175,10 +258,10 @@ Index: Python-3.5.2/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-3.5.2/Python/sysmodule.c
-===================================================================
---- Python-3.5.2.orig/Python/sysmodule.c
-+++ Python-3.5.2/Python/sysmodule.c
+diff --git a/Python/sysmodule.c b/Python/sysmodule.c
+index 8d7e05a..d9dee0f 100644
+--- a/Python/sysmodule.c
++++ b/Python/sysmodule.c
 @@ -1790,6 +1790,10 @@ _PySys_Init(void)
                          PyUnicode_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
@@ -190,93 +273,10 @@ Index: Python-3.5.2/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyUnicode_FromWideChar(
                                 Py_GetProgramFullPath(), -1));
-Index: Python-3.5.2/setup.py
-===================================================================
---- Python-3.5.2.orig/setup.py
-+++ Python-3.5.2/setup.py
-@@ -495,7 +495,7 @@ class PyBuildExt(build_ext):
-         # directories (i.e. '.' and 'Include') must be first.  See issue
-         # 10520.
-         if not cross_compiling:
--            add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+            add_dir_to_list(self.compiler.library_dirs, os.path.join('/usr/local', sys.lib))
-             add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-         # only change this for cross builds for 3.3, issues on Mageia
-         if cross_compiling:
-@@ -553,8 +553,7 @@ class PyBuildExt(build_ext):
-         # be assumed that no additional -I,-L directives are needed.
-         if not cross_compiling:
-             lib_dirs = self.compiler.library_dirs + [
--                '/lib64', '/usr/lib64',
--                '/lib', '/usr/lib',
-+                '/' + sys.lib, '/usr/' + sys.lib,
-                 ]
-             inc_dirs = self.compiler.include_dirs + ['/usr/include']
-         else:
-@@ -746,11 +745,11 @@ class PyBuildExt(build_ext):
-             elif curses_library:
-                 readline_libs.append(curses_library)
-             elif self.compiler.find_library_file(lib_dirs +
--                                                     ['/usr/lib/termcap'],
-+                                                     ['/usr/'+sys.lib+'/termcap'],
-                                                      'termcap'):
-                 readline_libs.append('termcap')
-             exts.append( Extension('readline', ['readline.c'],
--                                   library_dirs=['/usr/lib/termcap'],
-+                                   library_dirs=['/usr/'+sys.lib+'/termcap'],
-                                    extra_link_args=readline_extra_link_args,
-                                    libraries=readline_libs) )
-         else:
-Index: Python-3.5.2/Lib/sysconfig.py
-===================================================================
---- Python-3.5.2.orig/Lib/sysconfig.py
-+++ Python-3.5.2/Lib/sysconfig.py
-@@ -20,10 +20,10 @@ __all__ = [
- 
- _INSTALL_SCHEMES = {
-     'posix_prefix': {
--        'stdlib': '{installed_base}/lib/python{py_version_short}',
--        'platstdlib': '{platbase}/lib/python{py_version_short}',
-+        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}',
-+        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
-         'purelib': '{base}/lib/python{py_version_short}/site-packages',
--        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
-+        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
-         'include':
-             '{installed_base}/include/python{py_version_short}{abiflags}',
-         'platinclude':
-@@ -32,10 +32,10 @@ _INSTALL_SCHEMES = {
-         'data': '{base}',
-         },
-     'posix_home': {
--        'stdlib': '{installed_base}/lib/python',
--        'platstdlib': '{base}/lib/python',
-+        'stdlib': '{installed_base}/'+sys.lib+'/python',
-+        'platstdlib': '{base}/'+sys.lib+'/python',
-         'purelib': '{base}/lib/python',
--        'platlib': '{base}/lib/python',
-+        'platlib': '{base}/'+sys.lib+'/python',
-         'include': '{installed_base}/include/python',
-         'platinclude': '{installed_base}/include/python',
-         'scripts': '{base}/bin',
-@@ -61,10 +61,10 @@ _INSTALL_SCHEMES = {
-         'data': '{userbase}',
-         },
-     'posix_user': {
--        'stdlib': '{userbase}/lib/python{py_version_short}',
--        'platstdlib': '{userbase}/lib/python{py_version_short}',
-+        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
-+        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
-         'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
--        'platlib': '{userbase}/lib/python{py_version_short}/site-packages',
-+        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
-         'include': '{userbase}/include/python{py_version_short}',
-         'scripts': '{userbase}/bin',
-         'data': '{userbase}',
-Index: Python-3.5.2/configure.ac
-===================================================================
---- Python-3.5.2.orig/configure.ac
-+++ Python-3.5.2/configure.ac
+diff --git a/configure.ac b/configure.ac
+index 707324d..e8d59a3 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -883,6 +883,41 @@ PLATDIR=plat-$MACHDEP
  AC_SUBST(PLATDIR)
  AC_SUBST(PLATFORM_TRIPLET)
@@ -319,3 +319,43 @@ Index: Python-3.5.2/configure.ac
  
  AC_MSG_CHECKING([for -Wl,--no-as-needed])
  save_LDFLAGS="$LDFLAGS"
+diff --git a/setup.py b/setup.py
+index 6d26deb..7b14215 100644
+--- a/setup.py
++++ b/setup.py
+@@ -495,7 +495,7 @@ class PyBuildExt(build_ext):
+         # directories (i.e. '.' and 'Include') must be first.  See issue
+         # 10520.
+         if not cross_compiling:
+-            add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++            add_dir_to_list(self.compiler.library_dirs, os.path.join('/usr/local', sys.lib))
+             add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+         # only change this for cross builds for 3.3, issues on Mageia
+         if cross_compiling:
+@@ -553,8 +553,7 @@ class PyBuildExt(build_ext):
+         # be assumed that no additional -I,-L directives are needed.
+         if not cross_compiling:
+             lib_dirs = self.compiler.library_dirs + [
+-                '/lib64', '/usr/lib64',
+-                '/lib', '/usr/lib',
++                '/' + sys.lib, '/usr/' + sys.lib,
+                 ]
+             inc_dirs = self.compiler.include_dirs + ['/usr/include']
+         else:
+@@ -746,11 +745,11 @@ class PyBuildExt(build_ext):
+             elif curses_library:
+                 readline_libs.append(curses_library)
+             elif self.compiler.find_library_file(lib_dirs +
+-                                                     ['/usr/lib/termcap'],
++                                                     ['/usr/'+sys.lib+'/termcap'],
+                                                      'termcap'):
+                 readline_libs.append('termcap')
+             exts.append( Extension('readline', ['readline.c'],
+-                                   library_dirs=['/usr/lib/termcap'],
++                                   library_dirs=['/usr/'+sys.lib+'/termcap'],
+                                    extra_link_args=readline_extra_link_args,
+                                    libraries=readline_libs) )
+         else:
+-- 
+2.11.0
+
-- 
2.11.0



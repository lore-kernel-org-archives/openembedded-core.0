Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2574978A3D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054115"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:43 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:18:02 +0200
Message-Id: <20180308181804.31261-40-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 40/42] python: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:43 -0000

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
 .../add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch | 10 ++++----
 .../python/avoid_warning_about_tkinter.patch       | 30 ++++++++--------------
 .../avoid_warning_for_sunos_specific_module.patch  | 12 ++++-----
 .../python3/070-dont-clean-ipkg-install.patch      | 14 +++++-----
 .../python3/avoid_warning_about_tkinter.patch      | 30 ++++++++--------------
 ...-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch | 17 +++++-------
 .../sysconfig.py-add-_PYTHON_PROJECT_SRC.patch     | 25 ++++++++----------
 7 files changed, 57 insertions(+), 81 deletions(-)

diff --git a/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
index a97ff6b2506..506debaf761 100644
--- a/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
+++ b/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
@@ -13,10 +13,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: Python-2.7.11/configure.ac
+Index: Python-2.7.13/configure.ac
 ===================================================================
---- Python-2.7.11.orig/configure.ac
-+++ Python-2.7.11/configure.ac
+--- Python-2.7.13.orig/configure.ac
++++ Python-2.7.13/configure.ac
 @@ -33,7 +33,7 @@ if test "$cross_compiling" = yes; then
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
@@ -24,5 +24,5 @@ Index: Python-2.7.11/configure.ac
 -	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
 +	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
      fi
- elif test "$cross_compiling" = maybe; then
-     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
+     # Used to comment out stuff for rebuilding generated files
+     GENERATED_COMMENT='#'
diff --git a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
index 3347321fde6..287095f615c 100644
--- a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
+++ b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
@@ -7,13 +7,16 @@ Upstream-Status: Inappropriate [distribution]
 Also simply disable the tk module since its not in DEPENDS.
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: Python-2.7.2/setup.py
+Index: Python-2.7.13/setup.py
 ===================================================================
---- Python-2.7.2.orig/setup.py	2012-04-05 23:18:38.500136647 +0300
-+++ Python-2.7.2/setup.py	2012-04-05 23:19:35.888134969 +0300
-@@ -1634,8 +1634,10 @@
+--- Python-2.7.13.orig/setup.py
++++ Python-2.7.13/setup.py
+@@ -1783,10 +1783,12 @@ class PyBuildExt(build_ext):
+         self.extensions.extend(exts)
+ 
          # Call the method for detecting whether _tkinter can be compiled
-         self.detect_tkinter(inc_dirs, lib_dirs)
+-        self.detect_tkinter(inc_dirs, lib_dirs)
++        # self.detect_tkinter(inc_dirs, lib_dirs)
  
 -        if '_tkinter' not in [e.name for e in self.extensions]:
 -            missing.append('_tkinter')
@@ -22,18 +25,5 @@ Index: Python-2.7.2/setup.py
 +        #if '_tkinter' not in [e.name for e in self.extensions]:
 +        #    missing.append('_tkinter')
  
-         return missing
- 
-diff --git Python-3.5.1.orig/setup.py Python-3.5.1/setup.py
-index b4633b9..d7588c0 100644
---- Python-3.5.1.orig/setup.py
-+++ Python-3.5.1/setup.py
-@@ -1536,7 +1536,7 @@ class PyBuildExt(build_ext):
-         self.extensions.extend(exts)
- 
-         # Call the method for detecting whether _tkinter can be compiled
--        self.detect_tkinter(inc_dirs, lib_dirs)
-+        # self.detect_tkinter(inc_dirs, lib_dirs)
- 
-         # tkinter module will not be avalaible as yocto
-         # doesn't have tk integrated (yet)
+ ##         # Uncomment these lines if you want to play with xxmodule.c
+ ##         ext = Extension('xx', ['xxmodule.c'])
diff --git a/meta/recipes-devtools/python/python/avoid_warning_for_sunos_specific_module.patch b/meta/recipes-devtools/python/python/avoid_warning_for_sunos_specific_module.patch
index 337e0e3e29b..8ba58230144 100644
--- a/meta/recipes-devtools/python/python/avoid_warning_for_sunos_specific_module.patch
+++ b/meta/recipes-devtools/python/python/avoid_warning_for_sunos_specific_module.patch
@@ -5,12 +5,12 @@ Upstream-Status: Inappropriate [distribution]
 
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: Python-2.7.2/setup.py
+Index: Python-2.7.13/setup.py
 ===================================================================
---- Python-2.7.2.orig/setup.py	2012-04-05 22:29:18.049196608 +0300
-+++ Python-2.7.2/setup.py	2012-04-05 22:29:57.505195453 +0300
-@@ -1522,8 +1522,9 @@
-         if platform == 'sunos5':
+--- Python-2.7.13.orig/setup.py
++++ Python-2.7.13/setup.py
+@@ -1671,8 +1671,9 @@ class PyBuildExt(build_ext):
+         if host_platform == 'sunos5':
              # SunOS specific modules
              exts.append( Extension('sunaudiodev', ['sunaudiodev.c']) )
 -        else:
@@ -19,5 +19,5 @@ Index: Python-2.7.2/setup.py
 +        #else:
 +        #    missing.append('sunaudiodev')
  
-         if platform == 'darwin':
+         if host_platform == 'darwin':
              # _scproxy
diff --git a/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch b/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
index 789929b715a..f9971c6bafd 100644
--- a/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
+++ b/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
@@ -8,9 +8,11 @@ Upstream-Status: Inappropriate [OE specific]
  Makefile.pre.in |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1306,8 +1306,8 @@ touch:
+Index: Python-3.5.3/Makefile.pre.in
+===================================================================
+--- Python-3.5.3.orig/Makefile.pre.in
++++ Python-3.5.3/Makefile.pre.in
+@@ -1574,8 +1574,8 @@ touch:
  # Sanitation targets -- clean leaves libraries, executables and tags
  # files, which clobber removes as well
  pycremoval:
@@ -21,7 +23,7 @@ Upstream-Status: Inappropriate [OE specific]
  
  rmtestturds:
  	-rm -f *BAD *GOOD *SKIPPED
-@@ -1321,9 +1321,9 @@ docclean:
+@@ -1589,9 +1589,9 @@ docclean:
  	-rm -rf Doc/tools/sphinx Doc/tools/pygments Doc/tools/docutils
  
  clean: pycremoval
@@ -32,5 +34,5 @@ Upstream-Status: Inappropriate [OE specific]
 +	find . ! -path './ipkg-install/*' -name '*.s[ol]' -exec rm -f {} ';'
 +	find . ! -path './ipkg-install/*' -name '*.so.[0-9]*.[0-9]*' -exec rm -f {} ';'
  	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
- 	find build -name 'fficonfig.py' -exec rm -f {} ';' || true
- 	-rm -f Lib/lib2to3/*Grammar*.pickle
+ 	find build -name '*.py' -exec rm -f {} ';' || true
+ 	find build -name '*.py[co]' -exec rm -f {} ';' || true
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
index 3347321fde6..a3cc48c9a4d 100644
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
@@ -7,13 +7,16 @@ Upstream-Status: Inappropriate [distribution]
 Also simply disable the tk module since its not in DEPENDS.
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: Python-2.7.2/setup.py
+Index: Python-3.5.3/setup.py
 ===================================================================
---- Python-2.7.2.orig/setup.py	2012-04-05 23:18:38.500136647 +0300
-+++ Python-2.7.2/setup.py	2012-04-05 23:19:35.888134969 +0300
-@@ -1634,8 +1634,10 @@
+--- Python-3.5.3.orig/setup.py
++++ Python-3.5.3/setup.py
+@@ -1558,10 +1558,12 @@ class PyBuildExt(build_ext):
+         self.extensions.extend(exts)
+ 
          # Call the method for detecting whether _tkinter can be compiled
-         self.detect_tkinter(inc_dirs, lib_dirs)
+-        self.detect_tkinter(inc_dirs, lib_dirs)
++        # self.detect_tkinter(inc_dirs, lib_dirs)
  
 -        if '_tkinter' not in [e.name for e in self.extensions]:
 -            missing.append('_tkinter')
@@ -22,18 +25,5 @@ Index: Python-2.7.2/setup.py
 +        #if '_tkinter' not in [e.name for e in self.extensions]:
 +        #    missing.append('_tkinter')
  
-         return missing
- 
-diff --git Python-3.5.1.orig/setup.py Python-3.5.1/setup.py
-index b4633b9..d7588c0 100644
---- Python-3.5.1.orig/setup.py
-+++ Python-3.5.1/setup.py
-@@ -1536,7 +1536,7 @@ class PyBuildExt(build_ext):
-         self.extensions.extend(exts)
- 
-         # Call the method for detecting whether _tkinter can be compiled
--        self.detect_tkinter(inc_dirs, lib_dirs)
-+        # self.detect_tkinter(inc_dirs, lib_dirs)
- 
-         # tkinter module will not be avalaible as yocto
-         # doesn't have tk integrated (yet)
+ ##         # Uncomment these lines if you want to play with xxmodule.c
+ ##         ext = Extension('xx', ['xxmodule.c'])
diff --git a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
index 74490d93a5f..211f9e78890 100644
--- a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
+++ b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
@@ -10,19 +10,16 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 989baf9..2890c96 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -67,7 +67,7 @@ if test "$cross_compiling" = yes; then
+Index: Python-3.5.3/configure.ac
+===================================================================
+--- Python-3.5.3.orig/configure.ac
++++ Python-3.5.3/configure.ac
+@@ -78,7 +78,7 @@ if test "$cross_compiling" = yes; then
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
          AC_MSG_RESULT($interp)
 -	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
 +	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH) '$interp
      fi
- elif test "$cross_compiling" = maybe; then
-     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
--- 
-2.0.1
-
+     # Used to comment out stuff for rebuilding generated files
+     GENERATED_COMMENT='#'
diff --git a/meta/recipes-devtools/python/python3/sysconfig.py-add-_PYTHON_PROJECT_SRC.patch b/meta/recipes-devtools/python/python3/sysconfig.py-add-_PYTHON_PROJECT_SRC.patch
index de07643f2bb..c89d9a3d836 100644
--- a/meta/recipes-devtools/python/python3/sysconfig.py-add-_PYTHON_PROJECT_SRC.patch
+++ b/meta/recipes-devtools/python/python3/sysconfig.py-add-_PYTHON_PROJECT_SRC.patch
@@ -17,12 +17,12 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  Lib/sysconfig.py           |    5 ++++-
  2 files changed, 8 insertions(+), 2 deletions(-)
 
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index a545ab9..74317d1 100644
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -554,7 +554,10 @@ def get_config_vars(*args):
-         _config_vars['exec_prefix'] = EXEC_PREFIX
+Index: Python-3.5.3/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-3.5.3.orig/Lib/distutils/sysconfig.py
++++ Python-3.5.3/Lib/distutils/sysconfig.py
+@@ -498,7 +498,10 @@ def get_config_vars(*args):
+             _config_vars['SO'] = SO
  
          # Always convert srcdir to an absolute path
 -        srcdir = _config_vars.get('srcdir', project_base)
@@ -33,11 +33,11 @@ index a545ab9..74317d1 100644
          if os.name == 'posix':
              if python_build:
                  # If srcdir is a relative path (typically '.' or '..')
-diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 7287f11..cc92998 100644
---- a/Lib/sysconfig.py
-+++ b/Lib/sysconfig.py
-@@ -562,7 +562,10 @@ def get_config_vars(*args):
+Index: Python-3.5.3/Lib/sysconfig.py
+===================================================================
+--- Python-3.5.3.orig/Lib/sysconfig.py
++++ Python-3.5.3/Lib/sysconfig.py
+@@ -544,7 +544,10 @@ def get_config_vars(*args):
          _CONFIG_VARS['userbase'] = _getuserbase()
  
          # Always convert srcdir to an absolute path
@@ -49,6 +49,3 @@ index 7287f11..cc92998 100644
          if os.name == 'posix':
              if _PYTHON_BUILD:
                  # If srcdir is a relative path (typically '.' or '..')
--- 
-1.7.9.5
-
-- 
2.16.1



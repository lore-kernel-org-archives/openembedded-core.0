Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DD43B6FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:07:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083598"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:49 +0200
Message-Id: <ff68cc5704fc07b3ca7d2a16f28d725517495712.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/24] python3: fix patching get_python_lib() in distutils/sysconfig.py
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
X-List-Received-Date: Wed, 09 Mar 2016 15:07:01 -0000

Previous, two things were wrong:
1) lib_basename was set from STAGING_LIBDIR only if prefix parameter was empty or missing
2) if prefix was not empty, lib_basename reverted to sys.lib, even if STAGING_LIBDIR
should've overriden it

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...2-distutils-prefix-is-inside-staging-area.patch | 35 +++++++++++++---------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index bf02df2..8b93c1c 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,3 +1,8 @@
+From d4dd67daa1555bf13272cc071706338572539bad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 14 May 2013 15:00:26 -0700
+Subject: [PATCH 01/20] python3: Add target and native recipes
+
 Upstream-Status: Inappropriate [embedded specific]
 
 02/2015 Rebased for Python 3.4.2
@@ -8,11 +13,12 @@ Upstream-Status: Inappropriate [embedded specific]
 # Signed-off-by: Khem Raj <raj.khem@gmail.com>
 # Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-3.4.2/Lib/distutils/sysconfig.py
-===================================================================
---- Python-3.4.2.orig/Lib/distutils/sysconfig.py
-+++ Python-3.4.2/Lib/distutils/sysconfig.py
-@@ -16,10 +16,11 @@ import sys
+---
+diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
+index 573724d..418b478 100644
+--- a/Lib/distutils/sysconfig.py
++++ b/Lib/distutils/sysconfig.py
+@@ -17,10 +17,11 @@ import sys
  from .errors import DistutilsPlatformError
  
  # These are needed in a couple of spots, so just compute them once.
@@ -27,8 +33,8 @@ Index: Python-3.4.2/Lib/distutils/sysconfig.py
 +
  
  # Path to the base directory of the project. On Windows the binary may
- # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
-@@ -93,7 +94,9 @@ def get_python_inc(plat_specific=0, pref
+ # live in project/PCBuild/win32 or project/PCBuild/amd64.
+@@ -84,7 +85,9 @@ def get_python_inc(plat_specific=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -39,20 +45,18 @@ Index: Python-3.4.2/Lib/distutils/sysconfig.py
          prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
      if os.name == "posix":
          if python_build:
-@@ -134,6 +137,12 @@ def get_python_lib(plat_specific=0, stan
+@@ -125,6 +128,10 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
++    lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
 +    if prefix is None and os.environ['STAGING_LIBDIR'] != "":
-+        lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
 +        prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
-+    else:
-+        lib_basename = sys.lib
 +
      if prefix is None:
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
-@@ -142,7 +151,7 @@ def get_python_lib(plat_specific=0, stan
+@@ -133,7 +140,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
  
      if os.name == "posix":
          libpython = os.path.join(prefix,
@@ -61,7 +65,7 @@ Index: Python-3.4.2/Lib/distutils/sysconfig.py
          if standard_lib:
              return libpython
          else:
-@@ -242,7 +251,7 @@ def get_config_h_filename():
+@@ -233,7 +240,7 @@ def get_config_h_filename():
      else:
          inc_dir = get_python_inc(plat_specific=1)
  
@@ -70,7 +74,7 @@ Index: Python-3.4.2/Lib/distutils/sysconfig.py
  
  
  def get_makefile_filename():
-@@ -251,7 +260,7 @@ def get_makefile_filename():
+@@ -242,7 +249,7 @@ def get_makefile_filename():
          return os.path.join(_sys_home or project_base, "Makefile")
      lib_dir = get_python_lib(plat_specific=0, standard_lib=1)
      config_file = 'config-{}{}'.format(get_python_version(), build_flags)
@@ -79,3 +83,6 @@ Index: Python-3.4.2/Lib/distutils/sysconfig.py
  
  
  def parse_config_h(fp, g=None):
+-- 
+2.7.0
+
-- 
2.7.0



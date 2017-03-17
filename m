Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5683E77B20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 22:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489789456; x=1521325456;
	h=from:to:cc:subject:date:message-id;
	bh=LXvdDSVbq/7ainMx/QM1XxyMOv42aAEXP27cAxywgqM=;
	b=aOiWE1pfDLDFJ6XiEZ3QKlWwwKMlHKwPncXN7UMedjU15h5ITtBVYSAh
	u3BafqtlShWgxfwdXvM80JJb5l/YiA==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 15:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,178,1486454400"; d="scan'208";a="61857034"
Received: from yocto-ab04.ostc.intel.com ([10.54.69.51])
	by orsmga002.jf.intel.com with ESMTP; 17 Mar 2017 15:24:15 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 15:23:53 -0700
Message-Id: <1489789433-1447-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] python-3.3-multilib.patch: Fixes getpath on multilib configurations
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
X-List-Received-Date: Fri, 17 Mar 2017 22:24:14 -0000

When using multilib configurations either on arm/arm64 and x86/x86-64
python3 failed to execute due to a failure when looking for its
platform independent and dependent libraries.

This patch fixes this issue by assigning lib_python to the appropriate
macro.

[YOCTO #10812]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 .../python/python3/python-3.3-multilib.patch            | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 056e8e7..8601903 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -138,6 +138,15 @@ Index: Python-3.5.2/Modules/getpath.c
  
  /* Get file status. Encode the path to the locale encoding. */
  
+@@ -494,7 +502,7 @@ calculate_path(void)
+     _pythonpath = Py_DecodeLocale(PYTHONPATH, NULL);
+     _prefix = Py_DecodeLocale(PREFIX, NULL);
+     _exec_prefix = Py_DecodeLocale(EXEC_PREFIX, NULL);
+-    lib_python = Py_DecodeLocale("lib/python" VERSION, NULL);
++    lib_python = Py_DecodeLocale(LIB_PYTHON, NULL);
+ 
+     if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
+         Py_FatalError(
 Index: Python-3.5.2/Python/getplatform.c
 ===================================================================
 --- Python-3.5.2.orig/Python/getplatform.c
@@ -185,7 +194,7 @@ Index: Python-3.5.2/setup.py
 ===================================================================
 --- Python-3.5.2.orig/setup.py
 +++ Python-3.5.2/setup.py
-@@ -492,7 +492,7 @@ class PyBuildExt(build_ext):
+@@ -495,7 +495,7 @@ class PyBuildExt(build_ext):
          # directories (i.e. '.' and 'Include') must be first.  See issue
          # 10520.
          if not cross_compiling:
@@ -194,7 +203,7 @@ Index: Python-3.5.2/setup.py
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
-@@ -550,8 +550,7 @@ class PyBuildExt(build_ext):
+@@ -553,8 +553,7 @@ class PyBuildExt(build_ext):
          # be assumed that no additional -I,-L directives are needed.
          if not cross_compiling:
              lib_dirs = self.compiler.library_dirs + [
@@ -204,7 +213,7 @@ Index: Python-3.5.2/setup.py
                  ]
              inc_dirs = self.compiler.include_dirs + ['/usr/include']
          else:
-@@ -743,11 +742,11 @@ class PyBuildExt(build_ext):
+@@ -746,11 +745,11 @@ class PyBuildExt(build_ext):
              elif curses_library:
                  readline_libs.append(curses_library)
              elif self.compiler.find_library_file(lib_dirs +
@@ -268,7 +277,7 @@ Index: Python-3.5.2/configure.ac
 ===================================================================
 --- Python-3.5.2.orig/configure.ac
 +++ Python-3.5.2/configure.ac
-@@ -876,6 +876,41 @@ PLATDIR=plat-$MACHDEP
+@@ -883,6 +883,41 @@ PLATDIR=plat-$MACHDEP
  AC_SUBST(PLATDIR)
  AC_SUBST(PLATFORM_TRIPLET)
  
-- 
1.8.3.1



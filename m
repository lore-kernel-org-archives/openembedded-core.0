Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QgAwd-0001WD-6G
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 09:30:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 00:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,513,1304319600"; d="scan'208";a="26166128"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 00:26:24 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 15:23:18 +0800
Message-Id: <21666d8bebfb6d6ee78aa5dd76f4491b97f57f69.1310368636.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310368636.git.ke.yu@intel.com>
References: <cover.1310368636.git.ke.yu@intel.com>
In-Reply-To: <cover.1310368636.git.ke.yu@intel.com>
References: <cover.1310368636.git.ke.yu@intel.com>
Subject: [PATCH 05/10] python-native: fix for non /usr/lib libdir case
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
X-List-Received-Date: Mon, 11 Jul 2011 07:30:19 -0000

the get_python_lib() use hard code "lib". when other recipe
building use python-native, the STAGING_LIBDIR is non /usr/lib,
so the hard code "lib" will break the build

This patch replace the hardcoded "lib" with value from libdir
to fix this issue.

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 ...2-distutils-prefix-is-inside-staging-area.patch |   15 +++++++++++----
 .../recipes-devtools/python/python-native_2.6.6.bb |    2 +-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
index 9532eb3..8e721fe 100644
--- a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
@@ -30,19 +30,26 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
  
      if os.name == "posix":
          if python_build:
-@@ -116,7 +119,10 @@ def get_python_lib(plat_specific=0, stan
+@@ -115,12 +118,16 @@ def get_python_lib(plat_specific=0, stan
+     If 'prefix' is supplied, use it instead of sys.prefix or
      sys.exec_prefix -- i.e., ignore 'plat_specific'.
      """
++    lib_basename = os.getenv("libdir").split('/')[-1]
      if prefix is None:
 -        prefix = plat_specific and EXEC_PREFIX or PREFIX
 +        if plat_specific:
-+            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip('lib')
++            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
 +        else:
 +            prefix = plat_specific and EXEC_PREFIX or PREFIX
  
      if os.name == "posix":
          libpython = os.path.join(prefix,
-@@ -216,7 +222,7 @@ def get_config_h_filename():
+-                                 "lib", "python" + get_python_version())
++                                 lib_basename, "python" + get_python_version())
+         if standard_lib:
+             return libpython
+         else:
+@@ -216,7 +223,7 @@ def get_config_h_filename():
      else:
          # The name of the config.h file changed in 2.2
          config_h = 'pyconfig.h'
@@ -51,7 +58,7 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
  
  
  def get_makefile_filename():
-@@ -225,7 +231,7 @@ def get_makefile_filename():
+@@ -225,7 +232,7 @@ def get_makefile_filename():
          return os.path.join(os.path.dirname(os.path.realpath(sys.executable)),
                              "Makefile")
      lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
diff --git a/meta/recipes-devtools/python/python-native_2.6.6.bb b/meta/recipes-devtools/python/python-native_2.6.6.bb
index 0f9ae10..fa943f4 100644
--- a/meta/recipes-devtools/python/python-native_2.6.6.bb
+++ b/meta/recipes-devtools/python/python-native_2.6.6.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
-- 
1.7.0.4




Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigxy-0001EI-CR
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:22 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:30:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663905"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:30:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:36 -0800
Message-Id: <701b2b52c54cc79bd8991f054fe266d403313b90.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/28] python-native: correct prefix handling for oe-core sysroot layout
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
X-List-Received-Date: Thu, 05 Jan 2012 06:38:22 -0000

From: Phil Blundell <philb@gnu.org>

Don't try to guess a path based on ${HOST_SYS} since this is not where the
files in the sysroot are likely to be.  Instead, just use the "plat_specific"
approach of taking STAGING_INCDIR and knocking off the trailing "/include" for
all cases.  This is still evidently suboptimal but does at least seem to give
the correct results.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 ...2-distutils-prefix-is-inside-staging-area.patch |   22 ++++++++-----------
 .../recipes-devtools/python/python-native_2.7.2.bb |    2 +-
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
index 8e721fe..b46caf6 100644
--- a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
@@ -2,12 +2,11 @@ Upstream-Status: Inappropriate [embedded specific]
 
 # The proper prefix is inside our staging area.
 # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+# Signed-off-by: Phil Blundell <philb@gnu.org>
 
-Index: Python-2.6.6/Lib/distutils/sysconfig.py
-===================================================================
---- Python-2.6.6.orig/Lib/distutils/sysconfig.py
-+++ Python-2.6.6/Lib/distutils/sysconfig.py
-@@ -19,8 +19,8 @@ import sys
+--- Python-2.6.6/Lib/distutils/sysconfig.py.orig	2012-01-03 14:02:03.027005296 +0000
++++ Python-2.6.6/Lib/distutils/sysconfig.py	2012-01-03 14:02:31.517601081 +0000
+@@ -19,8 +19,8 @@
  from distutils.errors import DistutilsPlatformError
  
  # These are needed in a couple of spots, so just compute them once.
@@ -18,19 +17,16 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
  
  # Path to the base directory of the project. On Windows the binary may
  # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
-@@ -70,7 +70,10 @@ def get_python_inc(plat_specific=0, pref
+@@ -70,7 +70,7 @@
      sys.exec_prefix -- i.e., ignore 'plat_specific'.
      """
      if prefix is None:
 -        prefix = plat_specific and EXEC_PREFIX or PREFIX
-+        if plat_specific:
-+            prefix = plat_specific and os.environ['STAGING_INCDIR'].rstrip('include')
-+        else:
-+            prefix = plat_specific and EXEC_PREFIX or PREFIX
++        prefix = os.environ['STAGING_INCDIR'].rstrip('include')
  
      if os.name == "posix":
          if python_build:
-@@ -115,12 +118,16 @@ def get_python_lib(plat_specific=0, stan
+@@ -115,12 +115,16 @@
      If 'prefix' is supplied, use it instead of sys.prefix or
      sys.exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -49,7 +45,7 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
          if standard_lib:
              return libpython
          else:
-@@ -216,7 +223,7 @@ def get_config_h_filename():
+@@ -216,7 +220,7 @@
      else:
          # The name of the config.h file changed in 2.2
          config_h = 'pyconfig.h'
@@ -58,7 +54,7 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
  
  
  def get_makefile_filename():
-@@ -225,7 +232,7 @@ def get_makefile_filename():
+@@ -225,7 +229,7 @@
          return os.path.join(os.path.dirname(os.path.realpath(sys.executable)),
                              "Makefile")
      lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
diff --git a/meta/recipes-devtools/python/python-native_2.7.2.bb b/meta/recipes-devtools/python/python-native_2.7.2.bb
index 7d8c597..8bf736d 100644
--- a/meta/recipes-devtools/python/python-native_2.7.2.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI += "file://04-default-is-optimized.patch \
            file://05-enable-ctypes-cross-build.patch \
-- 
1.7.6.4




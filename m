Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E6F5773D40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 17:52:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 16 Apr 2015 10:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,589,1422950400"; d="scan'208";a="681267254"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga001.jf.intel.com with ESMTP; 16 Apr 2015 10:52:39 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Apr 2015 09:45:29 +0000
Message-Id: <1ca6d1e0276189ecb640f08ce5afee34a788c163.1429177203.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1429177203.git.alejandro.hernandez@linux.intel.com>
References: <cover.1429177203.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python3-native: Fix pip install issue due to unclean build directory
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
X-List-Received-Date: Thu, 16 Apr 2015 17:52:39 -0000

When installing python3-native sometimes pips default build
directory (which is on the host and is user dependant) is left unclean,
due to this, when python3-core is being installed it tries to use
the same directory producing an error, this explicitly removes
what the previous installation might have left behind, fixing the issue.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/python3-native_3.4.2.bb                 |  1 +
 .../python3/pip_build_directory_unclean.patch      | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.4.2.bb b/meta/recipes-devtools/python/python3-native_3.4.2.bb
index d98a278..37399be 100644
--- a/meta/recipes-devtools/python/python3-native_3.4.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.4.2.bb
@@ -26,6 +26,7 @@ file://makerace.patch \
 ${DISTRO_SRC_URI} \
 file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
+file://pip_build_directory_unclean.patch \
 "
 SRC_URI[md5sum] = "36fc7327c02c6f12fa24fc9ba78039e3"
 SRC_URI[sha256sum] = "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827e0f970dcf04b2def"
diff --git a/meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch b/meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch
new file mode 100644
index 0000000..c0c4617
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch
@@ -0,0 +1,28 @@
+Index: Python-3.4.2/Lib/ensurepip/__init__.py
+===================================================================
+--- Python-3.4.2.orig/Lib/ensurepip/__init__.py
++++ Python-3.4.2/Lib/ensurepip/__init__.py
+@@ -3,6 +3,7 @@ import os.path
+ import pkgutil
+ import sys
+ import tempfile
++import pwd
+ 
+ 
+ __all__ = ["version", "bootstrap"]
+@@ -36,6 +37,15 @@ def _run_pip(args, additional_paths=None
+     if additional_paths is not None:
+         sys.path = additional_paths + sys.path
+ 
++    # Explicitly make sure pip build directory was left clean
++    user = pwd.getpwuid(os.getuid())[0]
++    if os.path.exists("/tmp/pip_build_" + user + "/pip-delete-this-directory.txt"):
++        os.remove("/tmp/pip_build_" + user + "/pip-delete-this-directory.txt")
++        try:
++            os.rmdir("/tmp/pip_build_" + user + "/")
++        except OSError:
++            print("Error: Pip build directory (%s) was left unclean, make sure it is clean before continuing\n" % ("/tmp/pip_build_" + user + "/"))
++
+     # Install the bundled software
+     import pip
+     pip.main(args)
-- 
1.8.4.5



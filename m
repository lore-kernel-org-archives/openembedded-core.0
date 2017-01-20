Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B9B41771D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567452"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:48 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:58 -0600
Message-Id: <f6a1ea9e0fef3038d9ca8cad18fcb1ec4fb34ff2.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 27/55] oeqa/sdkext: Adds case and context modules.
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The extensible sdk context and case modules extends the sdk ones,
this means that the tests from sdk are run also the sdkext tests.

Enables support in context for use oe-test esdk command for run
the test suites, the same options of sdk are required for run esdk tests.

Removes old related to case and context inside oetest.py.

[YOCTO #10599]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/oetest.py         | 40 ----------------------------------------
 meta/lib/oeqa/sdkext/case.py    | 21 +++++++++++++++++++++
 meta/lib/oeqa/sdkext/context.py | 21 +++++++++++++++++++++
 3 files changed, 42 insertions(+), 40 deletions(-)
 create mode 100644 meta/lib/oeqa/sdkext/case.py
 create mode 100644 meta/lib/oeqa/sdkext/context.py

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index d7c3588..503f6fc 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -27,7 +27,6 @@ try:
 except ImportError:
     pass
 from oeqa.utils.decorators import LogResults, gettag, getResults
-from oeqa.utils import avoid_paths_in_environ
 
 logger = logging.getLogger("BitBake")
 
@@ -145,18 +144,6 @@ class OETestCalledProcessError(subprocess.CalledProcessError):
 
 subprocess.CalledProcessError = OETestCalledProcessError
 
-class oeSDKExtTest(oeSDKTest):
-    def _run(self, cmd):
-        # extensible sdk shows a warning if found bitbake in the path
-        # because can cause contamination, i.e. use devtool from
-        # poky/scripts instead of eSDK one.
-        env = os.environ.copy()
-        paths_to_avoid = ['bitbake/bin', 'poky/scripts']
-        env['PATH'] = avoid_paths_in_environ(paths_to_avoid)
-
-        return subprocess.check_output(". %s > /dev/null;"\
-            " %s;" % (self.tc.sdkenv, cmd), stderr=subprocess.STDOUT, shell=True, env=env).decode("utf-8")
-
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
     # First element of the list the is current frame, caller is 1
@@ -642,30 +629,3 @@ class ExportTestContext(RuntimeTestContext):
         extracted_dir = self.d.getVar("TEST_EXPORT_EXTRACTED_DIR")
         pkg_dir = os.path.join(export_dir, extracted_dir)
         super(ExportTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
-
-class SDKExtTestContext(SDKTestContext):
-    def __init__(self, d, sdktestdir, sdkenv, tcname, *args):
-        self.target_manifest = d.getVar("SDK_EXT_TARGET_MANIFEST")
-        self.host_manifest = d.getVar("SDK_EXT_HOST_MANIFEST")
-        if args:
-            self.cm = args[0] # Compatibility mode for run SDK tests
-        else:
-            self.cm = False
-
-        super(SDKExtTestContext, self).__init__(d, sdktestdir, sdkenv, tcname)
-
-        self.sdkextfilesdir = os.path.join(os.path.dirname(os.path.abspath(
-            oeqa.sdkext.__file__)), "files")
-
-    def _get_test_namespace(self):
-        if self.cm:
-            return "sdk"
-        else:
-            return "sdkext"
-
-    def _get_test_suites(self):
-        return (self.d.getVar("TEST_SUITES_SDK_EXT") or "auto").split()
-
-    def _get_test_suites_required(self):
-        return [t for t in (self.d.getVar("TEST_SUITES_SDK_EXT") or \
-                "auto").split() if t != "auto"]
diff --git a/meta/lib/oeqa/sdkext/case.py b/meta/lib/oeqa/sdkext/case.py
new file mode 100644
index 0000000..6f708aa
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/case.py
@@ -0,0 +1,21 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import subprocess
+
+from oeqa.utils import avoid_paths_in_environ
+from oeqa.sdk.case import OESDKTestCase
+
+class OESDKExtTestCase(OESDKTestCase):
+    def _run(self, cmd):
+        # extensible sdk shows a warning if found bitbake in the path
+        # because can cause contamination, i.e. use devtool from
+        # poky/scripts instead of eSDK one.
+        env = os.environ.copy()
+        paths_to_avoid = ['bitbake/bin', 'poky/scripts']
+        env['PATH'] = avoid_paths_in_environ(paths_to_avoid)
+
+        return subprocess.check_output(". %s > /dev/null;"\
+            " %s;" % (self.tc.sdk_env, cmd), stderr=subprocess.STDOUT,
+            shell=True, env=env).decode("utf-8")
diff --git a/meta/lib/oeqa/sdkext/context.py b/meta/lib/oeqa/sdkext/context.py
new file mode 100644
index 0000000..8dbcd80
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/context.py
@@ -0,0 +1,21 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
+
+class OESDKExtTestContext(OESDKTestContext):
+    esdk_files_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files")
+
+class OESDKExtTestContextExecutor(OESDKTestContextExecutor):
+    _context_class = OESDKExtTestContext
+
+    name = 'esdk'
+    help = 'esdk test component'
+    description = 'executes esdk tests'
+
+    default_cases = [OESDKTestContextExecutor.default_cases[0],
+            os.path.join(os.path.abspath(os.path.dirname(__file__)), 'cases')]
+    default_test_data = None
+
+_executor_class = OESDKExtTestContextExecutor
-- 
2.1.4



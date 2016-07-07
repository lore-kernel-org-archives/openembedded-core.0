Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 274916013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 22:55:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2016 15:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,325,1464678000"; d="scan'208";a="731145135"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2016 15:55:07 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 14:48:56 +0000
Message-Id: <7a66aca2c0d7674033fcb06e09d05f3c4d86af0b.1467902737.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1467902737.git.mariano.lopez@linux.intel.com>
References: <cover.1467902737.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1467902737.git.mariano.lopez@linux.intel.com>
References: <cover.1467902737.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/2] selftest/runtime-test.py: Add test for testexport SDK feature
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
X-List-Received-Date: Thu, 07 Jul 2016 22:55:06 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds test_testexport_sdk() to test the SDK feature
of testexport in the CI in order to avoid breaking it.

[YOCTO #9765]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/selftest/runtime-test.py | 60 +++++++++++++++++++++++++++++++++-
 meta/lib/oeqa/utils/commands.py        | 19 +++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index 1e1d3b0..d2f9334 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -1,5 +1,5 @@
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu, updateEnv, restoreEnv
 from oeqa.utils.decorators import testcase
 import os
 
@@ -43,6 +43,64 @@ class TestExport(oeSelfTest):
             failure = True if 'FAIL' in result.output else False
             self.assertNotEqual(True, failure, 'ping test failed')
 
+    def test_testexport_sdk(self):
+        """
+        Summary: Check sdk functionality for testexport.
+        Expected: 1. testexport directory must be created.
+                  2. SDK tarball must exists.
+                  3. Uncompressing of tarball must succeed.
+                  4. Check if the SDK directory is added to PATH.
+                  5. Run tar from the SDK directory.
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com>
+        """
+
+        features = 'INHERIT += "testexport"\n'
+        # These aren't the actual IP addresses but testexport class needs something defined
+        features += 'TEST_SERVER_IP = "192.168.7.1"\n'
+        features += 'TEST_TARGET_IP = "192.168.7.1"\n'
+        features += 'TEST_SUITES = "ping"\n'
+        features += 'TEST_EXPORT_SDK_ENABLED = "1"\n'
+        features += 'TEST_EXPORT_SDK_PACKAGES = "nativesdk-tar"\n'
+        self.write_config(features)
+
+        # Build tesexport for core-image-minimal
+        bitbake('core-image-minimal')
+        bitbake('-c testexport core-image-minimal')
+
+        # Check for SDK
+        testexport_dir = get_bb_var('TEST_EXPORT_DIR', 'core-image-minimal')
+        sdk_dir = get_bb_var('TEST_EXPORT_SDK_DIR', 'core-image-minimal')
+        tarball_name = "%s.sh" % get_bb_var('TEST_EXPORT_SDK_NAME', 'core-image-minimal')
+        tarball_path = os.path.join(testexport_dir, sdk_dir, tarball_name)
+        self.assertEqual(os.path.isfile(tarball_path), True, "Couldn't find SDK tarball: %s" % tarball_path)
+
+        # Uncompress SDK
+        extract_path = os.path.join(testexport_dir, "sysroot")
+        result = runCmd("%s -y -d %s" % (tarball_path, extract_path))
+
+        # Setting up environment
+        current_env = dict(os.environ)
+        for f in os.listdir(extract_path):
+            if f.startswith("environment-setup"):
+                env_file = os.path.join(extract_path, f)
+                updateEnv(env_file)
+
+        # Check if the SDK directory was added to PATH
+        working_path = False
+        for path in os.environ['PATH'].split(":"):
+            if testexport_dir in path:
+                working_path = True
+                sdk_path = path
+                break
+
+        self.assertEqual(working_path, True, "Couldn't find SDK path in PATH")
+
+        # Execute tar from SDK path
+        cmd_tar = os.path.join(sdk_path, "tar")
+        result = runCmd("%s --version" % cmd_tar)
+
+        restoreEnv(current_env)
 
 class TestImage(oeSelfTest):
 
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 4f79d15..4cfa2e1 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -273,3 +273,22 @@ def updateEnv(env_file):
     for line in result.output.split("\0"):
         (key, _, value) = line.partition("=")
         os.environ[key] = value
+
+def restoreEnv(old_env):
+    """
+    Restore environment with os.environ.
+
+    os.environ.clear() will throw an exception if there is
+    environment variable without any value, this function
+    will deal with such cases.
+    """
+
+    keys = list(os.environ.keys())
+
+    for var in keys:
+        if var:
+            if not os.environ[var]:
+                os.environ[var] = "tmp"
+            del os.environ[var]
+
+    os.environ.update(old_env)
-- 
2.6.6



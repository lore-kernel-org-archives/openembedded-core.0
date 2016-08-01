Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6A862607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 16:24:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2016 09:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,456,1464678000"; d="scan'208";a="1033036847"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2016 09:23:29 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 08:16:33 +0000
Message-Id: <be2d39d1c09081daff3237eb121868a11f4dabe2.1470039240.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1470039240.git.mariano.lopez@linux.intel.com>
References: <cover.1470039240.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1470039240.git.mariano.lopez@linux.intel.com>
References: <cover.1470039240.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/1] selftest/runtime-test.py: Add test for testexport SDK feature
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
X-List-Received-Date: Mon, 01 Aug 2016 16:24:13 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds test_testexport_sdk() to test the SDK feature
of testexport in the CI in order to avoid breaking it.

[YOCTO #9765]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta-selftest/lib/oeqa/runtime/selftest.py | 24 +++++++++++++++++
 meta/lib/oeqa/selftest/runtime-test.py     | 41 ++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/meta-selftest/lib/oeqa/runtime/selftest.py b/meta-selftest/lib/oeqa/runtime/selftest.py
index b9c9b23..a7e58ab3 100644
--- a/meta-selftest/lib/oeqa/runtime/selftest.py
+++ b/meta-selftest/lib/oeqa/runtime/selftest.py
@@ -1,9 +1,13 @@
+import os
+
 from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.commands import runCmd
 from oeqa.utils.decorators import *
 
 class Selftest(oeRuntimeTest):
 
     @skipUnlessPassed("test_ssh")
+    @tag("selftest_package_install")
     def test_install_package(self):
         """
         Summary: Check basic package installation functionality.
@@ -18,6 +22,7 @@ class Selftest(oeRuntimeTest):
         self.assertEqual(status, 0, msg="socat is not installed")
 
     @skipUnlessPassed("test_install_package")
+    @tag("selftest_package_install")
     def test_verify_unistall(self):
         """
         Summary: Check basic package installation functionality.
@@ -29,3 +34,22 @@ class Selftest(oeRuntimeTest):
 
         (status, output) = self.target.run("socat -V")
         self.assertNotEqual(status, 0, msg="socat is still installed")
+
+    @tag("selftest_sdk")
+    def test_sdk(self):
+
+        result = runCmd("env -0")
+        sdk_path = search_sdk_path(result.output)
+        self.assertTrue(sdk_path, msg="Can't find SDK path")
+
+        tar_cmd = os.path.join(sdk_path, "tar")
+        result = runCmd("%s --help" % tar_cmd)
+
+def search_sdk_path(env):
+    for line in env.split("\0"):
+        (key, _, value) = line.partition("=")
+        if key == "PATH":
+            for path in value.split(":"):
+                if "pokysdk" in path:
+                    return path
+    return ""
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index b8e1be1..c2d5b45 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -43,6 +43,46 @@ class TestExport(oeSelfTest):
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
+        features += 'TEST_SUITES_TAGS = "selftest_sdk"\n'
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
+        # Run runexported.py
+        runexported_path = os.path.join(testexport_dir, "runexported.py")
+        testdata_path = os.path.join(testexport_dir, "testdata.json")
+        cmd = "%s %s" % (runexported_path, testdata_path)
+        result = runCmd(cmd)
+        self.assertEqual(0, result.status, 'runexported.py returned a non 0 status')
+
 
 class TestImage(oeSelfTest):
 
@@ -57,6 +97,7 @@ class TestImage(oeSelfTest):
 
         features = 'INHERIT += "testimage"\n'
         features += 'TEST_SUITES = "ping ssh selftest"\n'
+        features += 'TEST_SUITES_TAGS = "selftest_package_install"\n'
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.6.6



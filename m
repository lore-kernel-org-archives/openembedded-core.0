Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 67045771CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:08:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2017 09:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567555"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:08:01 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:26 -0600
Message-Id: <c7ed18f8feb76cda02345011d810c5cb68e88c5d.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 55/55] selftest/runtime-test.py: Adapt test to use new runtime framework
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
X-List-Received-Date: Fri, 20 Jan 2017 17:08:01 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adapt the current runtime selftest to use the new runtime
framework.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 .../lib/oeqa/runtime/{ => cases}/selftest.json     |  0
 .../lib/oeqa/runtime/{ => cases}/selftest.py       | 34 +++---------------
 meta/lib/oeqa/selftest/runtime-test.py             | 42 +++++++++++++---------
 3 files changed, 31 insertions(+), 45 deletions(-)
 rename meta-selftest/lib/oeqa/runtime/{ => cases}/selftest.json (100%)
 rename meta-selftest/lib/oeqa/runtime/{ => cases}/selftest.py (53%)

diff --git a/meta-selftest/lib/oeqa/runtime/selftest.json b/meta-selftest/lib/oeqa/runtime/cases/selftest.json
similarity index 100%
rename from meta-selftest/lib/oeqa/runtime/selftest.json
rename to meta-selftest/lib/oeqa/runtime/cases/selftest.json
diff --git a/meta-selftest/lib/oeqa/runtime/selftest.py b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
similarity index 53%
rename from meta-selftest/lib/oeqa/runtime/selftest.py
rename to meta-selftest/lib/oeqa/runtime/cases/selftest.py
index a7e58ab3..329470f 100644
--- a/meta-selftest/lib/oeqa/runtime/selftest.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
@@ -1,13 +1,9 @@
-import os
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
 
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.commands import runCmd
-from oeqa.utils.decorators import *
+class Selftest(OERuntimeTestCase):
 
-class Selftest(oeRuntimeTest):
-
-    @skipUnlessPassed("test_ssh")
-    @tag("selftest_package_install")
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_install_package(self):
         """
         Summary: Check basic package installation functionality.
@@ -21,8 +17,7 @@ class Selftest(oeRuntimeTest):
         (status, output) = self.target.run("socat -V")
         self.assertEqual(status, 0, msg="socat is not installed")
 
-    @skipUnlessPassed("test_install_package")
-    @tag("selftest_package_install")
+    @OETestDepends(['selftest.Selftest.test_install_package'])
     def test_verify_unistall(self):
         """
         Summary: Check basic package installation functionality.
@@ -34,22 +29,3 @@ class Selftest(oeRuntimeTest):
 
         (status, output) = self.target.run("socat -V")
         self.assertNotEqual(status, 0, msg="socat is still installed")
-
-    @tag("selftest_sdk")
-    def test_sdk(self):
-
-        result = runCmd("env -0")
-        sdk_path = search_sdk_path(result.output)
-        self.assertTrue(sdk_path, msg="Can't find SDK path")
-
-        tar_cmd = os.path.join(sdk_path, "tar")
-        result = runCmd("%s --help" % tar_cmd)
-
-def search_sdk_path(env):
-    for line in env.split("\0"):
-        (key, _, value) = line.partition("=")
-        if key == "PATH":
-            for path in value.split(":"):
-                if "pokysdk" in path:
-                    return path
-    return ""
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index a105f3f..9e2ecc6 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -6,6 +6,10 @@ import re
 
 class TestExport(oeSelfTest):
 
+    @classmethod
+    def tearDownClass(cls):
+        runCmd("rm -rf /tmp/sdk")
+
     def test_testexport_basic(self):
         """
         Summary: Check basic testexport functionality with only ping test enabled.
@@ -34,15 +38,15 @@ class TestExport(oeSelfTest):
 
         with runqemu('core-image-minimal') as qemu:
             # Attempt to run runexported.py to perform ping test
-            runexported_path = os.path.join(testexport_dir, "runexported.py")
-            testdata_path = os.path.join(testexport_dir, "testdata.json")
-            cmd = "%s -t %s -s %s %s" % (runexported_path, qemu.ip, qemu.server_ip, testdata_path)
+            test_path = os.path.join(testexport_dir, "oe-test")
+            data_file = os.path.join(testexport_dir, 'data', 'testdata.json')
+            manifest = os.path.join(testexport_dir, 'data', 'manifest')
+            cmd = ("%s runtime --test-data-file %s --packages-manifest %s "
+                   "--target-ip %s --server-ip %s --quiet"
+                  % (test_path, data_file, manifest, qemu.ip, qemu.server_ip))
             result = runCmd(cmd)
-            self.assertEqual(0, result.status, 'runexported.py returned a non 0 status')
-
             # Verify ping test was succesful
-            failure = True if 'FAIL' in result.output else False
-            self.assertNotEqual(True, failure, 'ping test failed')
+            self.assertEqual(0, result.status, 'oe-test runtime returned a non 0 status')
 
     def test_testexport_sdk(self):
         """
@@ -61,7 +65,6 @@ class TestExport(oeSelfTest):
         features += 'TEST_SERVER_IP = "192.168.7.1"\n'
         features += 'TEST_TARGET_IP = "192.168.7.1"\n'
         features += 'TEST_SUITES = "ping"\n'
-        features += 'TEST_SUITES_TAGS = "selftest_sdk"\n'
         features += 'TEST_EXPORT_SDK_ENABLED = "1"\n'
         features += 'TEST_EXPORT_SDK_PACKAGES = "nativesdk-tar"\n'
         self.write_config(features)
@@ -75,14 +78,22 @@ class TestExport(oeSelfTest):
         sdk_dir = get_bb_var('TEST_EXPORT_SDK_DIR', 'core-image-minimal')
         tarball_name = "%s.sh" % get_bb_var('TEST_EXPORT_SDK_NAME', 'core-image-minimal')
         tarball_path = os.path.join(testexport_dir, sdk_dir, tarball_name)
-        self.assertEqual(os.path.isfile(tarball_path), True, "Couldn't find SDK tarball: %s" % tarball_path)
+        msg = "Couldn't find SDK tarball: %s" % tarball_path
+        self.assertEqual(os.path.isfile(tarball_path), True, msg)
+
+        # Extract SDK and run tar from SDK
+        result = runCmd("%s -y -d /tmp/sdk" % tarball_path)
+        self.assertEqual(0, result.status, "Couldn't extract SDK")
+
+        env_script = result.output.split()[-1]
+        result = runCmd(". %s; which tar" % env_script, shell=True)
+        self.assertEqual(0, result.status, "Couldn't setup SDK environment")
+        is_sdk_tar = True if "/tmp/sdk" in result.output else False
+        self.assertTrue(is_sdk_tar, "Couldn't setup SDK environment")
 
-        # Run runexported.py
-        runexported_path = os.path.join(testexport_dir, "runexported.py")
-        testdata_path = os.path.join(testexport_dir, "testdata.json")
-        cmd = "%s %s" % (runexported_path, testdata_path)
-        result = runCmd(cmd)
-        self.assertEqual(0, result.status, 'runexported.py returned a non 0 status')
+        tar_sdk = result.output
+        result = runCmd("%s --version" % tar_sdk)
+        self.assertEqual(0, result.status, "Couldn't run tar from SDK")
 
 
 class TestImage(oeSelfTest):
@@ -100,7 +111,6 @@ class TestImage(oeSelfTest):
 
         features = 'INHERIT += "testimage"\n'
         features += 'TEST_SUITES = "ping ssh selftest"\n'
-        features += 'TEST_SUITES_TAGS = "selftest_package_install"\n'
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.1.4



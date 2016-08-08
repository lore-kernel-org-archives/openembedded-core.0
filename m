Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 34E7D771BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316033"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:23:04 -0700
Message-Id: <707a1cc20791b6a83a2e15c3b8457ebe3af42192.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 16/20] oeqa.selftest.runtime-test: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:23 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/runtime-test.conf | 13 +++++
 meta/lib/oeqa/selftest/runtime-test.py        | 80 ++++++++-------------------
 2 files changed, 37 insertions(+), 56 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/runtime-test.conf

diff --git a/meta/lib/oeqa/selftest/conf/runtime-test.conf b/meta/lib/oeqa/selftest/conf/runtime-test.conf
new file mode 100644
index 0000000..6c331ba
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/runtime-test.conf
@@ -0,0 +1,13 @@
+[TestExport]
+# These aren't the actual IP addresses but testexport class needs something 
+# defined
+setUpClass_features = INHERIT += "testexport"
+                      TEST_SERVER_IP = "192.168.7.1"
+                      TEST_TARGET_IP = "192.168.7.1"
+                      TEST_SUITES = "ping"
+setUpClass_image = core-image-minimal
+[TestImage]
+setUpClass_features = INHERIT += "testimage"
+                      TEST_SUITES = "ping ssh selftest"
+                      TEST_SUITES_TAGS = "selftest_package_install"
+setUpClass_image = core-image-full-cmdline
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index c2d5b45..627716d 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -2,9 +2,18 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.decorators import testcase
 import os
+from oeqa.utils.readconfig import conffile
+
 
 class TestExport(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+        cls.features = cls.config.get('TestExport', 'setUpClass_features')
+        cls.image = cls.config.get('TestExport', 'setUpClass_image')
+
     def test_testexport_basic(self):
         """
         Summary: Check basic testexport functionality with only ping test enabled.
@@ -15,23 +24,18 @@ class TestExport(oeSelfTest):
         Author: Mariano Lopez <mariano.lopez@intel.com>
         """
 
-        features = 'INHERIT += "testexport"\n'
-        # These aren't the actual IP addresses but testexport class needs something defined
-        features += 'TEST_SERVER_IP = "192.168.7.1"\n'
-        features += 'TEST_TARGET_IP = "192.168.7.1"\n'
-        features += 'TEST_SUITES = "ping"\n'
-        self.write_config(features)
+        self.write_config(self.features)
 
         # Build tesexport for core-image-minimal
-        bitbake('core-image-minimal')
-        bitbake('-c testexport core-image-minimal')
+        bitbake(self.image)
+        bitbake('-c testexport %s' % self.image)
 
         # Verify if TEST_EXPORT_DIR was created
-        testexport_dir = get_bb_var('TEST_EXPORT_DIR', 'core-image-minimal')
+        testexport_dir = get_bb_var('TEST_EXPORT_DIR', self.image)
         isdir = os.path.isdir(testexport_dir)
         self.assertEqual(True, isdir, 'Failed to create testexport dir: %s' % testexport_dir)
 
-        with runqemu('core-image-minimal') as qemu:
+        with runqemu(self.image) as qemu:
             # Attempt to run runexported.py to perform ping test
             runexported_path = os.path.join(testexport_dir, "runexported.py")
             testdata_path = os.path.join(testexport_dir, "testdata.json")
@@ -43,49 +47,16 @@ class TestExport(oeSelfTest):
             failure = True if 'FAIL' in result.output else False
             self.assertNotEqual(True, failure, 'ping test failed')
 
-    def test_testexport_sdk(self):
-        """
-        Summary: Check sdk functionality for testexport.
-        Expected: 1. testexport directory must be created.
-                  2. SDK tarball must exists.
-                  3. Uncompressing of tarball must succeed.
-                  4. Check if the SDK directory is added to PATH.
-                  5. Run tar from the SDK directory.
-        Product: oe-core
-        Author: Mariano Lopez <mariano.lopez@intel.com>
-        """
-
-        features = 'INHERIT += "testexport"\n'
-        # These aren't the actual IP addresses but testexport class needs something defined
-        features += 'TEST_SERVER_IP = "192.168.7.1"\n'
-        features += 'TEST_TARGET_IP = "192.168.7.1"\n'
-        features += 'TEST_SUITES = "ping"\n'
-        features += 'TEST_SUITES_TAGS = "selftest_sdk"\n'
-        features += 'TEST_EXPORT_SDK_ENABLED = "1"\n'
-        features += 'TEST_EXPORT_SDK_PACKAGES = "nativesdk-tar"\n'
-        self.write_config(features)
-
-        # Build tesexport for core-image-minimal
-        bitbake('core-image-minimal')
-        bitbake('-c testexport core-image-minimal')
-
-        # Check for SDK
-        testexport_dir = get_bb_var('TEST_EXPORT_DIR', 'core-image-minimal')
-        sdk_dir = get_bb_var('TEST_EXPORT_SDK_DIR', 'core-image-minimal')
-        tarball_name = "%s.sh" % get_bb_var('TEST_EXPORT_SDK_NAME', 'core-image-minimal')
-        tarball_path = os.path.join(testexport_dir, sdk_dir, tarball_name)
-        self.assertEqual(os.path.isfile(tarball_path), True, "Couldn't find SDK tarball: %s" % tarball_path)
-
-        # Run runexported.py
-        runexported_path = os.path.join(testexport_dir, "runexported.py")
-        testdata_path = os.path.join(testexport_dir, "testdata.json")
-        cmd = "%s %s" % (runexported_path, testdata_path)
-        result = runCmd(cmd)
-        self.assertEqual(0, result.status, 'runexported.py returned a non 0 status')
-
 
 class TestImage(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+        cls.features = cls.config.get('TestImage', 'setUpClass_features')
+        cls.image = cls.config.get('TestImage', 'setUpClass_image')
+
     def test_testimage_install(self):
         """
         Summary: Check install packages functionality for testimage/testexport.
@@ -95,11 +66,8 @@ class TestImage(oeSelfTest):
         Author: Mariano Lopez <mariano.lopez@intel.com>
         """
 
-        features = 'INHERIT += "testimage"\n'
-        features += 'TEST_SUITES = "ping ssh selftest"\n'
-        features += 'TEST_SUITES_TAGS = "selftest_package_install"\n'
-        self.write_config(features)
+        self.write_config(self.features)
 
         # Build core-image-sato and testimage
-        bitbake('core-image-full-cmdline socat')
-        bitbake('-c testimage core-image-full-cmdline')
+        bitbake('%s socat' % self.image)
+        bitbake('-c testimage %s' % self.image)
-- 
1.8.3.1



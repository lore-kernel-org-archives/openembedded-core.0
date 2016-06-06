Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4868875D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 18:33:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jun 2016 11:33:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,428,1459839600"; d="scan'208";a="117022796"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga004.fm.intel.com with ESMTP; 06 Jun 2016 11:33:07 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 10:28:04 +0000
Message-Id: <af942e00f74bd07807a1aab75e8e387816bcd76b.1465206436.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1465206436.git.mariano.lopez@linux.intel.com>
References: <cover.1465206436.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] selftest/testexport.py: Add test test_testexport_basic
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
X-List-Received-Date: Mon, 06 Jun 2016 18:33:09 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Exported tests is not been tested right now and it get
broken very easily with import errors from bitbake.

This adds a new test in order to verify in the CI if
the testexport gets broken.

[YOCTO #8384]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/selftest/testexport.py | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/testexport.py

diff --git a/meta/lib/oeqa/selftest/testexport.py b/meta/lib/oeqa/selftest/testexport.py
new file mode 100644
index 0000000..5823b13
--- /dev/null
+++ b/meta/lib/oeqa/selftest/testexport.py
@@ -0,0 +1,44 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
+from oeqa.utils.decorators import testcase
+import os
+
+class TestExport(oeSelfTest):
+
+    def test_testexport_basic(self):
+        """
+        Summary: Check basic testexport functionality with only ping test enabled.
+        Expected: 1. testexport directory must be created.
+                  2. runexported.py must run without any error/exception.
+                  3. ping test must succeed.
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com>
+        """
+
+        features = 'INHERIT += "testexport"\n'
+        # These aren't the actual IP addresses but testexport class needs something defined
+        features += 'TEST_SERVER_IP = "192.168.7.1"\n'
+        features += 'TEST_TARGET_IP = "192.168.7.1"\n'
+        features += 'TEST_SUITES = "ping"\n'
+        self.write_config(features)
+
+        # Build tesexport for core-image-minimal
+        bitbake('core-image-minimal')
+        bitbake('-c testexport core-image-minimal')
+
+        # Verify if TEST_EXPORT_DIR was created
+        testexport_dir = get_bb_var('TEST_EXPORT_DIR', 'core-image-minimal')
+        isdir = os.path.isdir(testexport_dir)
+        self.assertEqual(True, isdir, 'Failed to create testexport dir: %s' % testexport_dir)
+
+        with runqemu('core-image-minimal') as qemu:
+            # Attempt to run runexported.py to perform ping test
+            runexported_path = os.path.join(testexport_dir, "runexported.py")
+            testdata_path = os.path.join(testexport_dir, "testdata.json")
+            cmd = "%s -t %s -s %s %s" % (runexported_path, qemu.ip, qemu.server_ip, testdata_path)
+            result = runCmd(cmd)
+            self.assertEqual(0, result.status, 'runexported.py returned a non 0 status')
+
+            # Verify ping test was succesful
+            failure = True if 'FAIL' in result.output else False
+            self.assertNotEqual(True, failure, 'ping test failed')
-- 
2.6.6



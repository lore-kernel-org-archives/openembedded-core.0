Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AAA8F60746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:57:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 06:57:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,430,1464678000"; d="scan'208";a="1003519727"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2016 06:57:14 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 05:50:27 +0000
Message-Id: <4fd300f00e824cee55cde988e9a03caa1f7b8a1c.1469598413.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1469598413.git.mariano.lopez@linux.intel.com>
References: <cover.1469598413.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1469598413.git.mariano.lopez@linux.intel.com>
References: <cover.1469598413.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/1] selftest/runtime-test.py: Add test for import test from other layers
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
X-List-Received-Date: Wed, 27 Jul 2016 13:57:14 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

There are some features in testimage/testexport that are not tested;
this might lead to break some of these features without notice.

This adds a new test in order to test two features of testimage:
  - Import test from other layers.
  - Install/Unistall in the DUT without a package manager.

[YOCTO #9764]
[YOCTO #9766]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta-selftest/lib/oeqa/runtime/selftest.json       |  6 +++++
 meta-selftest/lib/oeqa/runtime/selftest.py         | 31 ++++++++++++++++++++++
 .../selftest/{testexport.py => runtime-test.py}    | 20 ++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 meta-selftest/lib/oeqa/runtime/selftest.json
 create mode 100644 meta-selftest/lib/oeqa/runtime/selftest.py
 rename meta/lib/oeqa/selftest/{testexport.py => runtime-test.py} (74%)

diff --git a/meta-selftest/lib/oeqa/runtime/selftest.json b/meta-selftest/lib/oeqa/runtime/selftest.json
new file mode 100644
index 0000000..e5ae46e
--- /dev/null
+++ b/meta-selftest/lib/oeqa/runtime/selftest.json
@@ -0,0 +1,6 @@
+{
+    "test_install_package": {
+        "pkg": "socat",
+        "rm": true
+    }
+}
diff --git a/meta-selftest/lib/oeqa/runtime/selftest.py b/meta-selftest/lib/oeqa/runtime/selftest.py
new file mode 100644
index 0000000..b9c9b23
--- /dev/null
+++ b/meta-selftest/lib/oeqa/runtime/selftest.py
@@ -0,0 +1,31 @@
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+class Selftest(oeRuntimeTest):
+
+    @skipUnlessPassed("test_ssh")
+    def test_install_package(self):
+        """
+        Summary: Check basic package installation functionality.
+        Expected: 1. Before the test socat must be installed using scp.
+                  2. After the test socat must be unistalled using ssh.
+                     This can't be checked in this test.
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com>
+        """
+
+        (status, output) = self.target.run("socat -V")
+        self.assertEqual(status, 0, msg="socat is not installed")
+
+    @skipUnlessPassed("test_install_package")
+    def test_verify_unistall(self):
+        """
+        Summary: Check basic package installation functionality.
+        Expected: 1. test_install_package must unistall socat.
+                     This test is just to verify that.
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com>
+        """
+
+        (status, output) = self.target.run("socat -V")
+        self.assertNotEqual(status, 0, msg="socat is still installed")
diff --git a/meta/lib/oeqa/selftest/testexport.py b/meta/lib/oeqa/selftest/runtime-test.py
similarity index 74%
rename from meta/lib/oeqa/selftest/testexport.py
rename to meta/lib/oeqa/selftest/runtime-test.py
index 5823b13..b8e1be1 100644
--- a/meta/lib/oeqa/selftest/testexport.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -42,3 +42,23 @@ class TestExport(oeSelfTest):
             # Verify ping test was succesful
             failure = True if 'FAIL' in result.output else False
             self.assertNotEqual(True, failure, 'ping test failed')
+
+
+class TestImage(oeSelfTest):
+
+    def test_testimage_install(self):
+        """
+        Summary: Check install packages functionality for testimage/testexport.
+        Expected: 1. Import tests from a directory other than meta.
+                  2. Check install/unistall of socat.
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com>
+        """
+
+        features = 'INHERIT += "testimage"\n'
+        features += 'TEST_SUITES = "ping ssh selftest"\n'
+        self.write_config(features)
+
+        # Build core-image-sato and testimage
+        bitbake('core-image-full-cmdline socat')
+        bitbake('-c testimage core-image-full-cmdline')
-- 
2.6.6



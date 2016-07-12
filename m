Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 82902607F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 21:16:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2016 14:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,353,1464678000"; d="scan'208";a="1020427911"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2016 14:16:03 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 13:09:47 +0000
Message-Id: <54304422afaa3f1b3c8504f9bf2e8e74b9f15837.1468328858.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1468328858.git.mariano.lopez@linux.intel.com>
References: <cover.1468328858.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] selftest/seltest.py: Add test to check imports from other layers
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
X-List-Received-Date: Tue, 12 Jul 2016 21:16:03 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This tests adds a check of selftest itself to verify if can
add test from other layers.

[YOCTO #9770]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta-selftest/lib/oeqa/selftest/imported.py | 14 ++++++++++++++
 meta/lib/oeqa/selftest/seltest.py           | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-selftest/lib/oeqa/selftest/imported.py
 create mode 100644 meta/lib/oeqa/selftest/seltest.py

diff --git a/meta-selftest/lib/oeqa/selftest/imported.py b/meta-selftest/lib/oeqa/selftest/imported.py
new file mode 100644
index 0000000..b80150b
--- /dev/null
+++ b/meta-selftest/lib/oeqa/selftest/imported.py
@@ -0,0 +1,14 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.decorators import testcase
+
+class ImportedTests(oeSelfTest):
+
+    def test_import_dummy(self):
+        """
+        Summary: Doesn't check anything, used to check import test from other layers.
+        Expected: 1. Pass unconditionally
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.comr
+        """
+
+        self.assertEqual(True, True, msg = "Impossible to fail this test")
diff --git a/meta/lib/oeqa/selftest/seltest.py b/meta/lib/oeqa/selftest/seltest.py
new file mode 100644
index 0000000..ea185ec
--- /dev/null
+++ b/meta/lib/oeqa/selftest/seltest.py
@@ -0,0 +1,19 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd
+from oeqa.utils.decorators import testcase
+
+class Selftest(oeSelfTest):
+
+    def test_import_test_from_layer(self):
+        """
+        Summary: Checks functionality to import tests from other layers.
+        Expected: 1. Must show "test_import_dummy" in the test list.
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com>
+        """
+
+        test_name = "imported.ImportedTests.test_import_dummy"
+        error_msg = "Couldn't find test: %s; Not importing tests from other layers" % test_name
+        result = runCmd("oe-selftest --list-tests")
+        success = True if test_name in result.output else False
+        self.assertEqual(success, True, msg = error_msg)
-- 
2.6.6



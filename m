Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 571E96B064
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 10:54:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Sep 2013 03:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,846,1371106800"; d="scan'208";a="397102055"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2013 03:54:34 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 8E2752C8001;
	Thu,  5 Sep 2013 03:54:31 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 13:54:43 +0300
Message-Id: <1378378483-32596-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: add basic scanelf test
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
X-List-Received-Date: Thu, 05 Sep 2013 10:54:32 -0000

This uses scanelf from the pax-utils package and scans the binaries in PATH
for TEXTREL and RPATH information. For a sato image with pax-utils installed
it shows no output (which is good).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/scanelf.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/scanelf.py

diff --git a/meta/lib/oeqa/runtime/scanelf.py b/meta/lib/oeqa/runtime/scanelf.py
new file mode 100644
index 0000000..b9abf24
--- /dev/null
+++ b/meta/lib/oeqa/runtime/scanelf.py
@@ -0,0 +1,26 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasPackage("pax-utils"):
+        skipModule("pax-utils package not installed")
+
+class ScanelfTest(oeRuntimeTest):
+
+    def setUp(self):
+        self.scancmd = 'scanelf --quiet --recursive --mount --ldpath --path'
+
+    @skipUnlessPassed('test_ssh')
+    def test_scanelf_textrel(self):
+        # print TEXTREL information
+        self.scancmd += " --textrel"
+        (status, output) = self.target.run(self.scancmd)
+        self.assertEqual(output.strip(), "", "\n".join([self.scancmd, output]))
+
+    @skipUnlessPassed('test_ssh')
+    def test_scanelf_rpath(self):
+        # print RPATH information
+        self.scancmd += " --rpath"
+        (status, output) = self.target.run(self.scancmd)
+        self.assertEqual(output.strip(), "", "\n".join([self.scancmd, output]))
-- 
1.8.3.1



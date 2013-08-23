Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id DE96C6B9D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:27 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 11:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="285943223"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 11:04:28 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 1A2202C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:25 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:12 +0300
Message-Id: <c3ca1641ffd8c313307c1c065693ef79163cf1bb.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 02/19] lib/oeqa/runtime: add test for perl
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:28 -0000

From: Cornel Stoicescu <corneliux.stoicescu@intel.com>

This test runs a perl script on the target and checks the output.

Signed-off-by: Cornel Stoicescu <corneliux.stoicescu@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/files/test.pl |  2 ++
 meta/lib/oeqa/runtime/perl.py       | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/files/test.pl
 create mode 100644 meta/lib/oeqa/runtime/perl.py

diff --git a/meta/lib/oeqa/runtime/files/test.pl b/meta/lib/oeqa/runtime/files/test.pl
new file mode 100644
index 0000000..689c8f1
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/test.pl
@@ -0,0 +1,2 @@
+$a = 9.01e+21 - 9.01e+21 + 0.01;
+print ("the value of a is ", $a, "\n");
diff --git a/meta/lib/oeqa/runtime/perl.py b/meta/lib/oeqa/runtime/perl.py
new file mode 100644
index 0000000..c9bb684
--- /dev/null
+++ b/meta/lib/oeqa/runtime/perl.py
@@ -0,0 +1,28 @@
+import unittest
+import os
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasPackage("perl"):
+        skipModule("No perl package in the image")
+
+
+class PerlTest(oeRuntimeTest):
+
+    @classmethod
+    def setUpClass(self):
+        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.pl"), "/tmp/test.pl")
+
+    def test_perl_exists(self):
+        (status, output) = self.target.run('which perl')
+        self.assertEqual(status, 0, msg="Perl binary not in PATH or not on target.")
+
+    def test_perl_works(self):
+        (status, output) = self.target.run('perl /tmp/test.pl')
+        self.assertEqual(status, 0, msg="Exit status was not 0. Output: %s" % output)
+        self.assertEqual(output, "the value of a is 0.01", msg="Incorrect output: %s" % output)
+
+    @classmethod
+    def tearDownClass(self):
+        oeRuntimeTest.tc.target.run("rm /tmp/test.pl")
-- 
1.8.3.1



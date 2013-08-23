Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id AF93D6B9D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:28 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 11:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="350776821"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 23 Aug 2013 11:04:29 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 320892C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:26 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:13 +0300
Message-Id: <df8a4b35c4abc3f10a2fddd9a2966f17817bbb81.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 03/19] lib/oeqa/runtime: add a test for ldd
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:29 -0000

From: Cornel Stoicescu <corneliux.stoicescu@intel.com>

This test checks that at least one path in RTLDLIST exists.

Signed-off-by: Cornel Stoicescu <corneliux.stoicescu@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/ldd.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/ldd.py

diff --git a/meta/lib/oeqa/runtime/ldd.py b/meta/lib/oeqa/runtime/ldd.py
new file mode 100644
index 0000000..577c5e2
--- /dev/null
+++ b/meta/lib/oeqa/runtime/ldd.py
@@ -0,0 +1,19 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasFeature("tools-sdk"):
+        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
+
+class LddTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_ssh')
+    def test_ldd_exists(self):
+        (status, output) = self.target.run('which ldd')
+        self.assertEqual(status, 0, msg = "ldd does not exist in PATH !")
+
+    @skipUnlessPassed('test_ldd_exists')
+    def test_ldd(self):
+        (status, output) = self.target.run('for i in $(which ldd | xargs cat | grep "^RTLDLIST"|cut -d\'=\' -f2|tr -d \'"\'); do test -f $i && echo $i && break; done')
+        self.assertEqual(status, 0, msg = "ldd path not correct or RTLDLIST files don't exist. ")
-- 
1.8.3.1



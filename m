Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 15DBC6B9FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2013 08:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="385514891"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 08:32:41 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id D1CAB2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:39 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:30:54 +0300
Message-Id: <fd9d38f9ce1dedeb0823167f8afe12fc9d6a5206.1377269485.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 14/21] lib/oeqa/runtime: add adjust date and time test
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
X-List-Received-Date: Fri, 23 Aug 2013 15:32:41 -0000

From: Mihai Prica <mihai.prica@intel.com>

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/date.py | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/date.py

diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py
new file mode 100644
index 0000000..d6c04cb
--- /dev/null
+++ b/meta/lib/oeqa/runtime/date.py
@@ -0,0 +1,27 @@
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+import re
+
+def setUpModule():
+    skipModuleUnless(oeRuntimeTest.tc.target.run('which date')[0] == 0, "No date in image or no connection")
+
+class DateTest(oeRuntimeTest):
+
+    def setUp(self):
+        (status, output) = self.target.run('date +"%Y-%m-%d %T"')
+        self.assertEqual(status, 0, msg="Failed to get initial date, output: %s" % output)
+        self.oldDate = output
+
+    @skipUnlessPassed("test_ssh")
+    def test_date(self):
+        sampleDate = '"2016-08-09 10:00:00"'
+        (status, output) = self.target.run("date -s %s" % sampleDate)
+        self.assertEqual(status, 0, msg="Date set failed, output: %s" % output)
+
+        (status, output) = self.target.run("date -R")
+        p = re.match('Tue, 09 Aug 2016 10:00:.. \+0000', output)
+        self.assertTrue(p, msg="The date was not set correctly, output: %s" % output)
+
+    def tearDown(self):
+        (status, output) = self.target.run('date -s "%s"' % self.oldDate)
+        self.assertEqual(status, 0, msg="Failed to reset date, output: %s" % output)
-- 
1.8.3.1



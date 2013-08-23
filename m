Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 220D06B9D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:31 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2013 08:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="285884499"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 08:32:31 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id AF6382C8002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:29 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:30:45 +0300
Message-Id: <df323d903c2fc957ebf08d5127ec6a3ae984eaf8.1377269485.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 05/21] lib/oeqa/runtime: add new skeletoninit test
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
X-List-Received-Date: Fri, 23 Aug 2013 15:32:31 -0000

From: Alexandru Palalau <alexandrux.palalau@intel.com>

New test which verifies the usage of skeleton init script available with meta-skeleton layer

Signed-off-by: Alexandru Palalau <alexandrux.palalau@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/skeletoninit.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/lib/oeqa/skeletoninit.py

diff --git a/meta/lib/oeqa/skeletoninit.py b/meta/lib/oeqa/skeletoninit.py
new file mode 100644
index 0000000..557e715
--- /dev/null
+++ b/meta/lib/oeqa/skeletoninit.py
@@ -0,0 +1,28 @@
+# This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=284 testcase
+# Note that the image under test must have meta-skeleton layer in bblayers and IMAGE_INSTALL_append = " service" in local.conf
+
+import unittest
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasPackage("service"):
+        skipModule("No service package in image")
+
+
+class SkeletonBasicTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_ssh')
+    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
+    def test_skeleton_availability(self):
+        (status, output) = self.target.run('ls /etc/init.d/skeleton')
+        self.assertEqual(status, 0, msg = "skeleton init script not found. Output:\n%s " % output)
+        (status, output) =  self.target.run('ls /usr/sbin/skeleton-test')
+        self.assertEqual(status, 0, msg = "skeleton-test not found. Output:\n%s" % output)
+
+    @skipUnlessPassed('test_skeleton_availability')
+    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
+    def test_skeleton_script(self):
+        output1 = self.target.run("/etc/init.d/skeleton start")[1]
+        (status, output2) = self.target.run(oeRuntimeTest.pscmd + ' | grep [s]keleton-test')
+        self.assertEqual(status, 0, msg = "Skeleton script could not be started:\n%s\n%s" % (output1, output2))
-- 
1.8.3.1



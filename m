Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 117686B9C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Aug 2013 08:32:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="390996740"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2013 08:32:33 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id EB11B2C8002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:31 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:30:47 +0300
Message-Id: <7767265747e3b378bc634e43b8248b0ab33ed8bd.1377269485.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 07/21] lib/oeqa/runtime: add new scp test
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
X-List-Received-Date: Fri, 23 Aug 2013 15:32:33 -0000

From: Alexandru Palalau <alexandrux.palalau@intel.com>

Copies a 5MB to target using scp, more of an
network test than a scp one.

Signed-off-by: Alexandru Palalau <alexandrux.palalau@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/scp.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/scp.py

diff --git a/meta/lib/oeqa/runtime/scp.py b/meta/lib/oeqa/runtime/scp.py
new file mode 100644
index 0000000..b914802
--- /dev/null
+++ b/meta/lib/oeqa/runtime/scp.py
@@ -0,0 +1,22 @@
+import subprocess
+import unittest
+import os
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not (oeRuntimeTest.hasPackage("dropbear") or oeRuntimeTest.hasPackage("openssh-sshd")):
+        skipModule("No ssh package in image")
+
+
+class ScpTest(oeRuntimeTest):
+
+    def setUp(self):
+         subprocess.check_call("dd if=/dev/zero of=%s bs=512k count=10" % os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR", True), 'test_scp_file'), shell=True)
+
+    @skipUnlessPassed('test_ssh')
+    def test_scp(self):
+        (status, output) = self.target.copy_to(os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR", True), 'test_scp_file'), '/tmp/test_scp_file')
+        self.assertEqual(status, 0, msg = "File could not be copied. Output: %s" % output)
+        (status, output) = self.target.run("ls -la /tmp/test_scp_file")
+        self.assertEqual(status, 0, msg = "SCP test failed")
-- 
1.8.3.1



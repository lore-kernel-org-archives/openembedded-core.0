Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id BDF056B9D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:29 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 11:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="285943247"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 11:04:30 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 49C8C2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:28 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:14 +0300
Message-Id: <e1aa4e53581bd4fcc8989f3ddd07748fcba3cb0b.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 04/19] lib/oeqa/runtime: add new logrotate test
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:30 -0000

From: Alexandru Palalau <alexandrux.palalau@intel.com>

New logrotate test which verifies the log directory change in logrotate.conf.
Needs an image with logrotate installed.

Signed-off-by: Alexandru Palalau <alexandrux.palalau@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/logrotate.py | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/logrotate.py

diff --git a/meta/lib/oeqa/runtime/logrotate.py b/meta/lib/oeqa/runtime/logrotate.py
new file mode 100644
index 0000000..80489a3
--- /dev/null
+++ b/meta/lib/oeqa/runtime/logrotate.py
@@ -0,0 +1,27 @@
+# This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=289 testcase
+# Note that the image under test must have logrotate installed
+
+import unittest
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasPackage("logrotate"):
+        skipModule("No logrotate package in image")
+
+
+class LogrotateTest(oeRuntimeTest):
+
+    @skipUnlessPassed("test_ssh")
+    def test_1_logrotate_setup(self):
+        (status, output) = self.target.run('mkdir /home/root/logrotate_dir')
+        self.assertEqual(status, 0, msg = "Could not create logrotate_dir. Output: %s" % output)
+        (status, output) = self.target.run("sed -i 's#wtmp {#wtmp {\\n    olddir /home/root/logrotate_dir#' /etc/logrotate.conf")
+        self.assertEqual(status, 0, msg = "Could not write to logrotate.conf file. Status and output: %s and %s)" % (status, output))
+
+    @skipUnlessPassed("test_1_logrotate_setup")
+    def test_2_logrotate(self):
+        (status, output) = self.target.run('logrotate -f /etc/logrotate.conf')
+        self.assertEqual(status, 0, msg = "logrotate service could not be reloaded. Status and output: %s and %s" % (status, output))
+        output = self.target.run('ls -la /home/root/logrotate_dir/ | wc -l')[1]
+        self.assertTrue(int(output)>=3, msg = "new logfile could not be created. List of files within log directory: %s" %(self.target.run('ls -la /home/root/logrotate_dir')[1]))
-- 
1.8.3.1



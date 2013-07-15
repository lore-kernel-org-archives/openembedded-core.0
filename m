Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9743D6AA6F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 14:43:07 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jul 2013 07:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="331579561"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2013 07:42:15 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 08FA96A4091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 07:42:13 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 17:42:27 +0300
Message-Id: <1e624bed4ce5d2355fddf960eba7a7408e6f3496.1373899189.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1373899189.git.stefanx.stanacar@intel.com>
References: <cover.1373899189.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373899189.git.stefanx.stanacar@intel.com>
References: <cover.1373899189.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 6/9] lib/oeqa/runtime: add tests for syslog and df
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
X-List-Received-Date: Mon, 15 Jul 2013 14:43:40 -0000

From: Alexandru Palalau <alexandru.palalau@intel.com>

Add tests for free space and syslog.

Changed in v2:
    - limit df's output to /
    - syslog: fix restart in case of systemd

Signed-off-by: Alexandru Palalau <alexandru.palalau@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage.bbclass  |  4 ++--
 meta/lib/oeqa/runtime/df.py     | 13 +++++++++++++
 meta/lib/oeqa/runtime/syslog.py | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/df.py
 create mode 100644 meta/lib/oeqa/runtime/syslog.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index f66f514..22f0a92 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -2,8 +2,8 @@ TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
 DEFAULT_TEST_SUITES = "ping auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
-DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh connman rpm smart xorg dmesg"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh connman rpm smart gcc xorg dmesg"
+DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh connman df rpm smart xorg syslog dmesg"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh connman df rpm smart gcc xorg syslog dmesg"
 
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
diff --git a/meta/lib/oeqa/runtime/df.py b/meta/lib/oeqa/runtime/df.py
new file mode 100644
index 0000000..c911989
--- /dev/null
+++ b/meta/lib/oeqa/runtime/df.py
@@ -0,0 +1,13 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    skipModuleUnless(oeRuntimeTest.tc.target.run('which df')[0] == 0, "No df in image or no connection")
+
+class DfTest(oeRuntimeTest):
+
+    @skipUnlessPassed("test_ssh")
+    def test_df(self):
+        (status,output) = self.target.run("df / | sed -n '2p' | awk '{print $4}'")
+        self.assertTrue(int(output)>5120, msg="Not enough space on image. Current size is %s" % output)
diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
new file mode 100644
index 0000000..cec4f97
--- /dev/null
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -0,0 +1,37 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasPackage("syslog"):
+        skipModule("No syslog package in image")
+
+class SyslogTest(oeRuntimeTest):
+
+    @skipUnlessPassed("test_ssh")
+    def test_syslog_help(self):
+        (status,output) = self.target.run('/sbin/syslogd --help')
+        self.assertEqual(status, 1, msg="status and output: %s and %s" % (status,output))
+
+    @skipUnlessPassed("test_syslog_help")
+    def test_syslogd_running(self):
+        (status,output) = self.target.run(oeRuntimeTest.pscmd + ' | grep -i [s]yslogd')
+        self.assertEqual(status, 0, msg="no syslogd process, ps output: %s" % self.target.run(oeRuntimeTest.pscmd)[1])
+
+class SyslogTestConfig(oeRuntimeTest):
+
+    def setUp(self):
+        self.target.run('echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf')
+
+    @skipUnlessPassed("test_syslogd_running")
+    def test_syslogd_configurable(self):
+        if "systemd" != oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"):
+            (status,output) = self.target.run('/etc/init.d/syslog restart')
+        else:
+            (status,output) = self.target.run('systemctl restart syslog.service')
+        self.assertEqual(status, 0, msg="Could not restart syslog service. Status and output: %s and %s" % (status,output))
+        (status,output) = self.target.run('logger foobar && grep foobar /var/log/test')
+        self.assertEqual(status, 0, msg="Test log string not found. Output: %s " % output)
+
+    def tearDown(self):
+        self.target.run("sed -i 's#LOGFILE=/var/log/test##' /etc/syslog-startup.conf")
-- 
1.8.3.1



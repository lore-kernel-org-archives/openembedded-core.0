Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A00A86B4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:04:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Aug 2013 08:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,846,1367996400"; d="scan'208";a="378605653"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2013 08:04:37 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 2C6142C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:04:35 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 18:04:31 +0300
Message-Id: <26b1bddb83dc438938ae4cac4c21e63aa07aca34.1376060086.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1376060086.git.stefanx.stanacar@intel.com>
References: <cover.1376060086.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1376060086.git.stefanx.stanacar@intel.com>
References: <cover.1376060086.git.stefanx.stanacar@intel.com>
Subject: [PATCH 3/4] lib/oeqa/runtime: rework syslog test
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
X-List-Received-Date: Fri, 09 Aug 2013 15:04:54 -0000

Add separate tests for restarting syslog and using logger, and
skip the configuration test for systemd images which always fail
because syslog's systemd service doesn't read a config by default
(see YB#4860).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/syslog.py | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index cec4f97..5ff2962 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -14,24 +14,33 @@ class SyslogTest(oeRuntimeTest):
         self.assertEqual(status, 1, msg="status and output: %s and %s" % (status,output))
 
     @skipUnlessPassed("test_syslog_help")
-    def test_syslogd_running(self):
+    def test_syslog_running(self):
         (status,output) = self.target.run(oeRuntimeTest.pscmd + ' | grep -i [s]yslogd')
         self.assertEqual(status, 0, msg="no syslogd process, ps output: %s" % self.target.run(oeRuntimeTest.pscmd)[1])
 
+
 class SyslogTestConfig(oeRuntimeTest):
 
-    def setUp(self):
-        self.target.run('echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf')
+    @skipUnlessPassed("test_syslog_running")
+    def test_syslog_logger(self):
+        (status,output) = self.target.run('logger foobar && grep foobar /var/log/messages')
+        self.assertEqual(status, 0, msg="Test log string not found in /var/log/messages. Output: %s " % output)
 
-    @skipUnlessPassed("test_syslogd_running")
-    def test_syslogd_configurable(self):
+    @skipUnlessPassed("test_syslog_running")
+    def test_syslog_restart(self):
         if "systemd" != oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"):
             (status,output) = self.target.run('/etc/init.d/syslog restart')
         else:
             (status,output) = self.target.run('systemctl restart syslog.service')
+
+    @skipUnlessPassed("test_syslog_restart")
+    @skipUnlessPassed("test_syslog_logger")
+    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
+    def test_syslog_startup_config(self):
+        self.target.run('echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf')
+        (status,output) = self.target.run('/etc/init.d/syslog restart')
         self.assertEqual(status, 0, msg="Could not restart syslog service. Status and output: %s and %s" % (status,output))
         (status,output) = self.target.run('logger foobar && grep foobar /var/log/test')
         self.assertEqual(status, 0, msg="Test log string not found. Output: %s " % output)
-
-    def tearDown(self):
         self.target.run("sed -i 's#LOGFILE=/var/log/test##' /etc/syslog-startup.conf")
+        self.target.run('/etc/init.d/syslog restart')
-- 
1.8.3.1



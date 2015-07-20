Return-Path: <george.l.musat@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCA865CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 14:51:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 20 Jul 2015 07:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,508,1432623600"; d="scan'208";a="527171116"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2015 07:51:06 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 5BDE76A4005;
	Mon, 20 Jul 2015 07:50:23 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 17:51:10 +0300
Message-Id: <1437403870-17814-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/syslog: Removed a pointless testcase and added skip for another.
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
X-List-Received-Date: Mon, 20 Jul 2015 14:51:10 -0000

The testcase syslog --help was rather useless and also causing problems
on images where syslog was non-busybox, like LSB images so I removed it.
Added a skip condition for TC 202 for the same reason. If syslog is
non-busybox then the test skips.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/syslog.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index 31cd6b0..dbaf8c6 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -8,19 +8,12 @@ def setUpModule():
 
 class SyslogTest(oeRuntimeTest):
 
-    @testcase(1148)
-    @skipUnlessPassed("test_ssh")
-    def test_syslog_help(self):
-        (status,output) = self.target.run('/sbin/syslogd --help')
-        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
-
     @testcase(201)
     @skipUnlessPassed("test_syslog_help")
     def test_syslog_running(self):
         (status,output) = self.target.run(oeRuntimeTest.pscmd + ' | grep -i [s]yslogd')
         self.assertEqual(status, 0, msg="no syslogd process, ps output: %s" % self.target.run(oeRuntimeTest.pscmd)[1])
 
-
 class SyslogTestConfig(oeRuntimeTest):
 
     @testcase(1149)
@@ -41,6 +34,7 @@ class SyslogTestConfig(oeRuntimeTest):
     @skipUnlessPassed("test_syslog_restart")
     @skipUnlessPassed("test_syslog_logger")
     @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", False), "Not appropiate for systemd image")
+    @unittest.skipIf(oeRuntimeTest.hasPackage("sysklogd") or not oeRuntimeTest.hasPackage("busybox"), "Non-busybox syslog")
     def test_syslog_startup_config(self):
         self.target.run('echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf')
         (status,output) = self.target.run('/etc/init.d/syslog restart')
-- 
2.1.4



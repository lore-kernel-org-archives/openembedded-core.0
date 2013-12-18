Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 715B560DFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 19:01:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2013 10:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,508,1384329600"; d="scan'208";a="446495559"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2013 11:01:24 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 793036A4007;
	Wed, 18 Dec 2013 11:01:21 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2013 21:02:05 +0200
Message-Id: <1387393325-12705-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: rewrite the systemd test module
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
X-List-Received-Date: Wed, 18 Dec 2013 19:01:59 -0000

They are basically the same tests but:
- they look cleaner, using one single method / assert
- output from unittest will be cleaner (and includes a verbose status when needed)
- they are better grouped and use a real, active, enabled service
  (machineid will be dropped and hostnamed was a static service)

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/systemd.py | 93 +++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 48 deletions(-)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 31007df..eed29d3 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -1,4 +1,5 @@
 import unittest
+import re
 from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 
@@ -9,57 +10,53 @@ def setUpModule():
             skipModule("systemd is not the init manager for this image")
 
 
-class SystemdBasicTest(oeRuntimeTest):
+class SystemdTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_systemd_version(self):
-        (status, output) = self.target.run('systemctl --version')
-        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
-
-class SystemdTests(oeRuntimeTest):
-
-    @skipUnlessPassed('test_systemd_version')
-    def test_systemd_failed(self):
-        (status, output) = self.target.run('systemctl --failed | grep "0 loaded units listed"')
-        if status != 0:
-            print self.target.run('systemctl status --failed -l')[1]
-            self.fail("Some systemd units failed.")
-
-    @skipUnlessPassed('test_systemd_version')
-    def test_systemd_service(self):
-        (status, output) = self.target.run('systemctl list-unit-files | grep "systemd-hostnamed.service"')
-        self.assertEqual(status, 0, msg="systemd-hostnamed.service service is not available.")
+    def systemctl(self, action = '', target = '', expected = 0, verbose = False):
+        command = 'systemctl %s %s' % (action, target)
+        status, output = self.target.run(command)
+        message = '\n'.join([command, output])
+        if status != expected and verbose:
+            message += self.target.run('systemctl status --full %s' % target)[1]
+        self.assertEqual(status, expected, message)
+        return output
 
-    @skipUnlessPassed('test_systemd_service')
-    def test_systemd_stop(self):
-        self.target.run('systemctl stop systemd-hostnamed.service')
-        (status, output) = self.target.run('systemctl show systemd-hostnamed.service | grep "ActiveState" | grep "=inactive"')
-        if status != 0:
-            (status, output) = self.target.run('systemctl status -l systemd-hostnamed.service')
-            self.fail(msg="systemd-hostnamed.service service could not be stopped. Status:\n" + output)
 
-    @skipUnlessPassed('test_systemd_stop')
-    @skipUnlessPassed('test_systemd_version')
-    def test_systemd_start(self):
-        self.target.run('systemctl start systemd-hostnamed.service')
-        (status, output) = self.target.run('systemctl is-active systemd-hostnamed.service')
-        if status != 0:
-            (status, output) = self.target.run('systemctl status -l systemd-hostnamed.service')
-            self.fail(msg="systemd-hostnamed.service service could not be started. Status:\n" + output)
+class SystemdBasicTests(SystemdTest):
 
-    @skipUnlessPassed('test_systemd_version')
-    def test_systemd_enable(self):
-        self.target.run('systemctl enable machineid.service')
-        (status, output) = self.target.run('systemctl is-enabled machineid.service')
-        self.assertEqual(output, 'enabled', msg="machineid.service service could not be enabled. Status and output: %s and %s" % (status, output))
-
-    @skipUnlessPassed('test_systemd_enable')
-    def test_systemd_disable(self):
-        self.target.run('systemctl disable machineid.service')
-        (status, output) = self.target.run('systemctl is-enabled machineid.service')
-        self.assertEqual(output, 'disabled', msg="machineid.service service could not be disabled. Status and output: %s and %s" % (status, output))
+    @skipUnlessPassed('test_ssh')
+    def test_systemd_basic(self):
+        self.systemctl('--version')
 
-    @skipUnlessPassed('test_systemd_version')
+    @skipUnlessPassed('test_system_basic')
     def test_systemd_list(self):
-        (status, output) = self.target.run('systemctl list-unit-files')
-        self.assertEqual(status, 0, msg="systemctl list-unit-files command failed. Status:  %s" % status)
+        self.systemctl('list-unit-files')
+
+    @skipUnlessPassed('test_systemd_basic')
+    def test_systemd_failed(self):
+        output = self.systemctl('list-units', '--failed')
+        match = re.search("0 loaded units listed", output)
+        if not match:
+            output += self.systemctl('status --full --failed')
+        self.assertTrue(match, msg="Some systemd units failed:\n%s" % output)
+
+
+class SystemdServiceTests(SystemdTest):
+
+    @skipUnlessPassed('test_systemd_basic')
+    def test_systemd_status(self):
+        self.systemctl('status --full', 'avahi-daemon.service')
+
+    @skipUnlessPassed('test_systemd_status')
+    def test_systemd_stop_start(self):
+        self.systemctl('stop', 'avahi-daemon.service')
+        self.systemctl('is-active', 'avahi-daemon.service', expected=3, verbose=True)
+        self.systemctl('start','avahi-daemon.service')
+        self.systemctl('is-active', 'avahi-daemon.service', verbose=True)
+
+    @skipUnlessPassed('test_systemd_basic')
+    def test_systemd_disable_enable(self):
+        self.systemctl('disable', 'avahi-daemon.service')
+        self.systemctl('is-enabled', 'avahi-daemon.service', expected=1)
+        self.systemctl('enable', 'avahi-daemon.service')
+        self.systemctl('is-enabled', 'avahi-daemon.service')
-- 
1.8.3.1



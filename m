Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AE0E9605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 22:45:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Oct 2015 15:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,184,1444719600"; d="scan'208";a="817378716"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2015 15:45:55 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 22:45:11 +0000
Message-Id: <1445553911-12721-3-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1445553911-12721-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1445553911-12721-1-git-send-email-benjamin.esquivel@linux.intel.com>
Cc: brian.avery@intel.com, randy.e.witt@intel.com
Subject: [PATCH 2/2] systemd: skip service tests on long boot times
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
X-List-Received-Date: Thu, 22 Oct 2015 22:45:56 -0000

arrange the runtime systemd services testing to depend upon the
checking of the boot time to be less than systemd's unit (services)
start timeout
this will prevent the service tests failing on a condition that is
well known to happen when the virtual target is choked on IO/CPU
resources

[YOCTO#8142]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/lib/oeqa/runtime/systemd.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 251d06e..4e0a556 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -80,7 +80,7 @@ class SystemdBasicTests(SystemdTest):
             time.sleep(10)
 
     @testcase(550)
-    @skipUnlessPassed('test_systemd_basic')
+    @skipUnlessPassed('test_systemd_boot_time')
     def test_systemd_failed(self):
         settled, output = self.settle()
         self.assertTrue(settled, msg="Timed out waiting for systemd to settle:\n" + output)
@@ -98,13 +98,13 @@ class SystemdServiceTests(SystemdTest):
         if not self.hasPackage('avahi-daemon'):
             raise unittest.SkipTest("Testcase dependency not met: need avahi-daemon installed on target")
 
-    @skipUnlessPassed('test_systemd_basic')
+    @skipUnlessPassed('test_systemd_boot_time')
     def test_systemd_status(self):
         self.check_for_avahi()
         self.systemctl('status --full', 'avahi-daemon.service')
 
     @testcase(695)
-    @skipUnlessPassed('test_systemd_status')
+    @skipUnlessPassed('test_systemd_boot_time')
     def test_systemd_stop_start(self):
         self.check_for_avahi()
         self.systemctl('stop', 'avahi-daemon.service')
@@ -113,7 +113,7 @@ class SystemdServiceTests(SystemdTest):
         self.systemctl('is-active', 'avahi-daemon.service', verbose=True)
 
     @testcase(696)
-    @skipUnlessPassed('test_systemd_basic')
+    @skipUnlessPassed('test_systemd_boot_time')
     def test_systemd_disable_enable(self):
         self.check_for_avahi()
         self.systemctl('disable', 'avahi-daemon.service')
@@ -122,12 +122,12 @@ class SystemdServiceTests(SystemdTest):
         self.systemctl('is-enabled', 'avahi-daemon.service')
 
 class SystemdJournalTests(SystemdTest):
-    @skipUnlessPassed('test_ssh')
+    @skipUnlessPassed('test_systemd_basic')
     def test_systemd_journal(self):
         (status, output) = self.target.run('journalctl')
         self.assertEqual(status, 0, output)
 
-    @skipUnlessPassed('test_systemd_basic')
+    @skipUnlessPassed('test_systemd_journal')
     def test_systemd_boot_time(self, systemd_TimeoutStartSec=90):
         """
         Compare the target boot time from journalctl against TimeoutStartSec
-- 
1.8.4.5



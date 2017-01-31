Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7A671E3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 21:02:51 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP; 31 Jan 2017 13:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,316,1477983600"; d="scan'208";a="60333967"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.122])
	by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2017 13:02:51 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 15:05:51 -0600
Message-Id: <1485896754-13589-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 1/4] runtime/cases: Fix case numbers, missing cases and unused classes
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
X-List-Received-Date: Tue, 31 Jan 2017 21:02:53 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

gcc: Removed unneded lines.

multilib: fixed case number.

syslog: added a missing test.

[YOCTO #10964]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/gcc.py      | 3 ---
 meta/lib/oeqa/runtime/cases/multilib.py | 2 +-
 meta/lib/oeqa/runtime/cases/syslog.py   | 9 +++++++++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/gcc.py b/meta/lib/oeqa/runtime/cases/gcc.py
index 064fa49..9110831 100644
--- a/meta/lib/oeqa/runtime/cases/gcc.py
+++ b/meta/lib/oeqa/runtime/cases/gcc.py
@@ -11,15 +11,12 @@ class GccCompileTest(OERuntimeTestCase):
     def setUpClass(cls):
         dst = '/tmp/'
         src = os.path.join(cls.tc.files_dir, 'test.c')
-        #dst = '/tmp/test.c'
         cls.tc.target.copyTo(src, dst)
 
         src = os.path.join(cls.tc.runtime_files_dir, 'testmakefile')
-        #dst = '/tmp/testmakefile'
         cls.tc.target.copyTo(src, dst)
 
         src = os.path.join(cls.tc.files_dir, 'test.cpp')
-        #dst = '/tmp/test.cpp'
         cls.tc.target.copyTo(src, dst)
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
index 8f6d2b2..8c167f1 100644
--- a/meta/lib/oeqa/runtime/cases/multilib.py
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -23,9 +23,9 @@ class MultilibTest(OERuntimeTestCase):
         msg = "%s isn't %s (is %s)" % (binary, arch, theclass)
         self.assertEqual(theclass, arch, msg=msg)
 
+    @OETestID(1593)
     @skipIfNotInDataVar('MULTILIBS', 'multilib:lib32',
                         "This isn't a multilib:lib32 image")
-    @OETestID(201)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_check_multilib_libc(self):
         """
diff --git a/meta/lib/oeqa/runtime/cases/syslog.py b/meta/lib/oeqa/runtime/cases/syslog.py
index 1016e67..537c519 100644
--- a/meta/lib/oeqa/runtime/cases/syslog.py
+++ b/meta/lib/oeqa/runtime/cases/syslog.py
@@ -34,6 +34,15 @@ class SyslogTestConfig(OERuntimeTestCase):
                ' Output: %s ' % output)
         self.assertEqual(status, 0, msg=msg)
 
+    @OETestID(1150)
+    @OETestDepends(['syslog.SyslogTest.test_syslog_running'])
+    def test_syslog_restart(self):
+        if "systemd" != self.tc.td.get("VIRTUAL-RUNTIME_init_manager", ""):
+            (_, _) = self.target.run('/etc/init.d/syslog restart')
+        else:
+            (_, _) = self.target.run('systemctl restart syslog.service')
+
+
     @OETestID(202)
     @OETestDepends(['syslog.SyslogTestConfig.test_syslog_logger'])
     @OEHasPackage(["!sysklogd", "busybox"])
-- 
2.1.4



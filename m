Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id AFF4E755C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 16:12:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 30 Jan 2017 08:12:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="815056921"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2017 08:12:31 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 08:08:19 +0000
Message-Id: <3b07ca33043cde581e206c9a6f7022e4847149c9.1485763510.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1485515180.git.mariano.lopez@linux.intel.com>
References: <cover.1485515180.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1485763510.git.mariano.lopez@linux.intel.com>
References: <cover.1485763510.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv3 1/5] runtime/cases: Fix case numbers, missing cases and unused classes
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
X-List-Received-Date: Mon, 30 Jan 2017 16:12:32 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

connman: oeRuntimeTest class is not used anymore as part of runtime
migration, this particular case was missed, so fix it.

gcc: Removed unneded lines.

multilib: fixed case number.

syslog: added a missing test.

[YOCTO #10964]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/connman.py  | 2 +-
 meta/lib/oeqa/runtime/cases/gcc.py      | 3 ---
 meta/lib/oeqa/runtime/cases/multilib.py | 2 +-
 meta/lib/oeqa/runtime/cases/syslog.py   | 9 +++++++++
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/connman.py b/meta/lib/oeqa/runtime/cases/connman.py
index 8b47108..12456b4 100644
--- a/meta/lib/oeqa/runtime/cases/connman.py
+++ b/meta/lib/oeqa/runtime/cases/connman.py
@@ -6,7 +6,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 class ConnmanTest(OERuntimeTestCase):
 
     def service_status(self, service):
-        if oeRuntimeTest.hasFeature("systemd"):
+        if 'systemd' in self.tc.td['DISTRO_FEATURES']:
             (_, output) = self.target.run('systemctl status -l %s' % service)
             return output
         else:
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
2.6.6



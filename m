Return-Path: <george.l.musat@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C0A5C65CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 09:54:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jul 2015 02:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,495,1432623600"; d="scan'208";a="764426500"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2015 02:54:23 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 50C246A4083;
	Fri, 17 Jul 2015 02:53:41 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 12:54:36 +0300
Message-Id: <1437126876-6454-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runtime: Added decorators for the remaining auto tests.
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
X-List-Received-Date: Fri, 17 Jul 2015 09:54:26 -0000

This helps for the automatic completion of the results in testopia.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/connman.py | 1 +
 meta/lib/oeqa/runtime/gcc.py     | 1 +
 meta/lib/oeqa/runtime/perl.py    | 1 +
 meta/lib/oeqa/runtime/python.py  | 3 ++-
 meta/lib/oeqa/runtime/smart.py   | 2 ++
 meta/lib/oeqa/runtime/syslog.py  | 3 +++
 meta/lib/oeqa/runtime/xorg.py    | 5 ++---
 7 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
index cc537f7..bd9dba3 100644
--- a/meta/lib/oeqa/runtime/connman.py
+++ b/meta/lib/oeqa/runtime/connman.py
@@ -16,6 +16,7 @@ class ConnmanTest(oeRuntimeTest):
         else:
             return "Unable to get status or logs for %s" % service
 
+    @testcase(961)
     @skipUnlessPassed('test_ssh')
     def test_connmand_help(self):
         (status, output) = self.target.run('/usr/sbin/connmand --help')
diff --git a/meta/lib/oeqa/runtime/gcc.py b/meta/lib/oeqa/runtime/gcc.py
index a7f62e1..d90cd17 100644
--- a/meta/lib/oeqa/runtime/gcc.py
+++ b/meta/lib/oeqa/runtime/gcc.py
@@ -30,6 +30,7 @@ class GccCompileTest(oeRuntimeTest):
         (status, output) = self.target.run('/tmp/test')
         self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
 
+    @testcase(1142)
     def test_gpp2_compile(self):
         (status, output) = self.target.run('g++ /tmp/test.cpp -o /tmp/test -lm')
         self.assertEqual(status, 0, msg="g++ compile failed, output: %s" % output)
diff --git a/meta/lib/oeqa/runtime/perl.py b/meta/lib/oeqa/runtime/perl.py
index 65da028..e044d0a 100644
--- a/meta/lib/oeqa/runtime/perl.py
+++ b/meta/lib/oeqa/runtime/perl.py
@@ -14,6 +14,7 @@ class PerlTest(oeRuntimeTest):
     def setUpClass(self):
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.pl"), "/tmp/test.pl")
 
+    @testcase(1141)
     def test_perl_exists(self):
         (status, output) = self.target.run('which perl')
         self.assertEqual(status, 0, msg="Perl binary not in PATH or not on target.")
diff --git a/meta/lib/oeqa/runtime/python.py b/meta/lib/oeqa/runtime/python.py
index 0387b9a..26edb7a 100644
--- a/meta/lib/oeqa/runtime/python.py
+++ b/meta/lib/oeqa/runtime/python.py
@@ -14,6 +14,7 @@ class PythonTest(oeRuntimeTest):
     def setUpClass(self):
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.py"), "/tmp/test.py")
 
+    @testcase(1145)
     def test_python_exists(self):
         (status, output) = self.target.run('which python')
         self.assertEqual(status, 0, msg="Python binary not in PATH or not on target.")
@@ -24,10 +25,10 @@ class PythonTest(oeRuntimeTest):
         self.assertEqual(status, 0, msg="Exit status was not 0. Output: %s" % output)
         self.assertEqual(output, "the value of a is 0.01", msg="Incorrect output: %s" % output)
 
+    @testcase(1146)
     def test_python_testfile(self):
         (status, output) = self.target.run('ls /tmp/testfile.python')
         self.assertEqual(status, 0, msg="Python test file generate failed.")
-        
 
     @classmethod
     def tearDownClass(self):
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index e978227..e41668d 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -64,6 +64,7 @@ class SmartRepoTest(SmartTest):
         for i in self.repolist:
             oeRuntimeTest.tc.target.run('smart channel -y --remove '+str(i))
 
+    @testcase(1143)
     def test_smart_channel(self):
         self.smart('channel', 1)
 
@@ -96,6 +97,7 @@ class SmartRepoTest(SmartTest):
         self.smart('channel --disable rpmsys')
         self.smart('channel --enable rpmsys')
 
+    @testcase(1144)
     @skipUnlessPassed('test_smart_channel_add')
     def test_smart_install(self):
         self.smart('remove -y psplash-default')
diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index 5d0f548..31cd6b0 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -8,6 +8,7 @@ def setUpModule():
 
 class SyslogTest(oeRuntimeTest):
 
+    @testcase(1148)
     @skipUnlessPassed("test_ssh")
     def test_syslog_help(self):
         (status,output) = self.target.run('/sbin/syslogd --help')
@@ -22,11 +23,13 @@ class SyslogTest(oeRuntimeTest):
 
 class SyslogTestConfig(oeRuntimeTest):
 
+    @testcase(1149)
     @skipUnlessPassed("test_syslog_running")
     def test_syslog_logger(self):
         (status,output) = self.target.run('logger foobar && test -e /var/log/messages && grep foobar /var/log/messages || logread | grep foobar')
         self.assertEqual(status, 0, msg="Test log string not found in /var/log/messages. Output: %s " % output)
 
+    @testcase(1150)
     @skipUnlessPassed("test_syslog_running")
     def test_syslog_restart(self):
         if "systemd" != oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", False):
diff --git a/meta/lib/oeqa/runtime/xorg.py b/meta/lib/oeqa/runtime/xorg.py
index a07031e..4ee225e 100644
--- a/meta/lib/oeqa/runtime/xorg.py
+++ b/meta/lib/oeqa/runtime/xorg.py
@@ -9,9 +9,8 @@ def setUpModule():
 
 class XorgTest(oeRuntimeTest):
 
+    @testcase(1151)
     @skipUnlessPassed('test_ssh')
     def test_xorg_running(self):
         (status, output) = self.target.run(oeRuntimeTest.pscmd + ' |  grep -v xinit | grep [X]org')
-        self.assertEqual(status, 0, msg="Xorg does not appear to be running %s" % self.target.run(oeRuntimeTest.pscmd)[1])
-
-
+        self.assertEqual(status, 0, msg="Xorg does not appear to be running %s" % self.target.run(oeRuntimeTest.pscmd)[1])
\ No newline at end of file
-- 
2.1.4



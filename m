Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 724DA610FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:36:09 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Sep 2013 05:36:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,936,1371106800"; d="scan'208";a="362780691"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2013 05:36:10 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 019DC2C8001;
	Thu, 19 Sep 2013 05:36:07 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 15:36:16 +0300
Message-Id: <1379594176-30993-2-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: cleanup and improve output readability for some tests
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
X-List-Received-Date: Thu, 19 Sep 2013 12:36:09 -0000

date:
   - move everything in the same test. setUp/tearDown aren't quite
the right thing here, everything it's part of the same test. (and
it get's confusing when ssh fails)

ldd:
   - change test name and add output to error message

vnc:
   - remove unnecessary check as there is no point in doing
both ps and netstat. Also improve error output a bit.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/date.py | 10 ++++------
 meta/lib/oeqa/runtime/ldd.py  |  4 ++--
 meta/lib/oeqa/runtime/vnc.py  |  9 +++------
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py
index 3b35964..a208e29 100644
--- a/meta/lib/oeqa/runtime/date.py
+++ b/meta/lib/oeqa/runtime/date.py
@@ -4,13 +4,12 @@ import re
 
 class DateTest(oeRuntimeTest):
 
-    def setUp(self):
+    @skipUnlessPassed("test_ssh")
+    def test_date(self):
         (status, output) = self.target.run('date +"%Y-%m-%d %T"')
         self.assertEqual(status, 0, msg="Failed to get initial date, output: %s" % output)
-        self.oldDate = output
+        oldDate = output
 
-    @skipUnlessPassed("test_ssh")
-    def test_date(self):
         sampleDate = '"2016-08-09 10:00:00"'
         (status, output) = self.target.run("date -s %s" % sampleDate)
         self.assertEqual(status, 0, msg="Date set failed, output: %s" % output)
@@ -19,6 +18,5 @@ class DateTest(oeRuntimeTest):
         p = re.match('Tue, 09 Aug 2016 10:00:.. \+0000', output)
         self.assertTrue(p, msg="The date was not set correctly, output: %s" % output)
 
-    def tearDown(self):
-        (status, output) = self.target.run('date -s "%s"' % self.oldDate)
+        (status, output) = self.target.run('date -s "%s"' % oldDate)
         self.assertEqual(status, 0, msg="Failed to reset date, output: %s" % output)
diff --git a/meta/lib/oeqa/runtime/ldd.py b/meta/lib/oeqa/runtime/ldd.py
index 577c5e2..4374530 100644
--- a/meta/lib/oeqa/runtime/ldd.py
+++ b/meta/lib/oeqa/runtime/ldd.py
@@ -11,9 +11,9 @@ class LddTest(oeRuntimeTest):
     @skipUnlessPassed('test_ssh')
     def test_ldd_exists(self):
         (status, output) = self.target.run('which ldd')
-        self.assertEqual(status, 0, msg = "ldd does not exist in PATH !")
+        self.assertEqual(status, 0, msg = "ldd does not exist in PATH: which ldd: %s" % output)
 
     @skipUnlessPassed('test_ldd_exists')
-    def test_ldd(self):
+    def test_ldd_rtldlist_check(self):
         (status, output) = self.target.run('for i in $(which ldd | xargs cat | grep "^RTLDLIST"|cut -d\'=\' -f2|tr -d \'"\'); do test -f $i && echo $i && break; done')
         self.assertEqual(status, 0, msg = "ldd path not correct or RTLDLIST files don't exist. ")
diff --git a/meta/lib/oeqa/runtime/vnc.py b/meta/lib/oeqa/runtime/vnc.py
index ce11179..5ed1072 100644
--- a/meta/lib/oeqa/runtime/vnc.py
+++ b/meta/lib/oeqa/runtime/vnc.py
@@ -9,14 +9,11 @@ class VNCTest(oeRuntimeTest):
 
     @skipUnlessPassed('test_ssh')
     def test_vnc(self):
-        (status, output) = self.target.run('x11vnc -display :0.0 -bg -q')
+        (status, output) = self.target.run('x11vnc -display :0 -bg -o x11vnc.log')
         self.assertEqual(status, 0, msg="x11vnc server failed to start: %s" % output)
         port = re.search('PORT=[0-9]*', output)
         self.assertTrue(port, msg="Listening port not specified in command output: %s" %output)
 
-        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep -i [x]11vnc')
-        self.assertEqual(status, 0, msg="x11vnc process not running")
-
         vncport = port.group(0).split('=')[1]
-        (status, output) = self.target.run('netstat -atun | grep :%s | grep LISTEN' % vncport)
-        self.assertEqual(status, 0, msg="x11vnc server not running on port %s" % vncport)
+        (status, output) = self.target.run('netstat -ntl | grep ":%s"' % vncport)
+        self.assertEqual(status, 0, msg="x11vnc server not running on port %s\n\n%s" % (vncport, self.target.run('netstat -ntl; cat x11vnc.log')[1]))
-- 
1.8.3.1



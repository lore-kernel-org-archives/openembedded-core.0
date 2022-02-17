Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9DEC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 17:14:26 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.2874.1645118064228178918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 09:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OMlc87ot;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645118064;
  x=1676654064;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e8ByJza0a+R4NhvdAyHFHRPtM9jqKgM5rFBMnU9nHok=;
  b=OMlc87ot+Ku1BuHtf58+OstnJOASiwDZ2Pd3r4DMJ+X4V9HFU+Dg4atC
   ng6mlLJXw77JMblrOy+jFqkJMcjd7l53hRM5pnq3xxKvwzgOOUopufd+b
   qsaVHtrtD2VJjCOQb5Z7/0pmwpS8wlKAyA9Vq2n7ltoiCP2SuV//xvi0/
   uEWJFgWVUI49liU3asG407RRRBlDGlDfGJa/DWNWvd9hThnngcu3ai8sL
   cTxFB3BDC6hKCSBnLLfhuaItL1wan5rp7tSX/kW2qimt3umfb3u3az8LG
   +nEMfG3HD3Pw9R9Re6VZkgUZmqCw1PZrzQyCVq92ydIk7bsHR7CUw8kZr
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] selftest: Add logging tests for bb.build.exec_func with
 shell/python code
Date: Thu, 17 Feb 2022 18:14:15 +0100
Message-ID: <20220217171415.25658-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 17:14:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161846

The situation regarding logging is different when a function called by
bb.build.exec_func() fails compared to when the task code fails
directly.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

The second test (with logs but without verbose) in
bblogging.BitBakeLogging.test_python_exec_func_shell_logging will
currently fail since stdout/stderr from the failing shell code is not
included in the output. This can be fixed by reverting commit fc58ad84
in bitbake, but then some of the other tests will fail as there will
be duplicated logs for them.

 .../recipes-test/logging-test/logging-test.bb | 10 +++
 meta/lib/oeqa/selftest/cases/bblogging.py     | 69 ++++++++++++++++++-
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/logging-test/logging-test.bb b/meta-selftest/recipes-test/logging-test/logging-test.bb
index a6100123f9..ac3fb46f45 100644
--- a/meta-selftest/recipes-test/logging-test/logging-test.bb
+++ b/meta-selftest/recipes-test/logging-test/logging-test.bb
@@ -11,12 +11,22 @@ do_shelltest() {
 }
 addtask do_shelltest
 
+python do_pythontest_exec_func_shell() {
+    bb.build.exec_func('do_shelltest', d)
+}
+addtask do_pythontest_exec_func_shell
+
 python do_pythontest_exit () {
     print("This is python stdout")
     sys.exit(1)
 }
 addtask do_pythontest_exit
 
+python do_pythontest_exec_func_python() {
+    bb.build.exec_func('do_pythontest_exit', d)
+}
+addtask do_pythontest_exec_func_python
+
 python do_pythontest_fatal () {
     print("This is python fatal test stdout")
     bb.fatal("This is a fatal error")
diff --git a/meta/lib/oeqa/selftest/cases/bblogging.py b/meta/lib/oeqa/selftest/cases/bblogging.py
index ea6c3c8c77..6b0bbfe1c1 100644
--- a/meta/lib/oeqa/selftest/cases/bblogging.py
+++ b/meta/lib/oeqa/selftest/cases/bblogging.py
@@ -30,7 +30,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c shelltest -f -v", ignore_status = True)
         self.assertIn("ERROR: Logfile of failure stored in:", result.output)
-        # two copies due to set +x        
+        # two copies due to set +x
         self.assertCount(result.output, "This is shell stdout", 2)
         self.assertCount(result.output, "This is shell stderr", 2)
 
@@ -42,6 +42,41 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertCount(result.output, "This is shell stdout", 2)
         self.assertCount(result.output, "This is shell stderr", 2)
 
+    def test_python_exec_func_shell_logging(self):
+        # no logs, no verbose
+        self.write_config('BBINCLUDELOGS = ""')
+        result = bitbake("logging-test -c pythontest_exec_func_shell -f",
+                         ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        self.assertNotIn("This is shell stdout", result.output)
+        self.assertNotIn("This is shell stderr", result.output)
+
+        # logs, no verbose
+        self.write_config('BBINCLUDELOGS = "yes"')
+        result = bitbake("logging-test -c pythontest_exec_func_shell -f",
+                         ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        self.assertCount(result.output, "This is shell stdout", 1)
+        self.assertCount(result.output, "This is shell stderr", 1)
+
+        # no logs, verbose
+        self.write_config('BBINCLUDELOGS = ""')
+        result = bitbake("logging-test -c pythontest_exec_func_shell -f -v",
+                         ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # two copies due to set +x
+        self.assertCount(result.output, "This is shell stdout", 2)
+        self.assertCount(result.output, "This is shell stderr", 2)
+
+        # logs, verbose
+        self.write_config('BBINCLUDELOGS = "yes"')
+        result = bitbake("logging-test -c pythontest_exec_func_shell -f -v",
+                         ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # two copies due to set +x
+        self.assertCount(result.output, "This is shell stdout", 2)
+        self.assertCount(result.output, "This is shell stderr", 2)
+
     def test_python_exit_logging(self):
         # no logs, no verbose
         self.write_config('BBINCLUDELOGS = ""')
@@ -70,6 +105,38 @@ class BitBakeLogging(OESelftestTestCase):
         # python tasks don't log output with -v currently
         #self.assertCount(result.output, "This is python stdout", 1)
 
+    def test_python_exec_func_python_logging(self):
+        # no logs, no verbose
+        self.write_config('BBINCLUDELOGS = ""')
+        result = bitbake("logging-test -c pythontest_exec_func_python -f",
+                         ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        self.assertNotIn("This is python stdout", result.output)
+
+        # logs, no verbose
+        self.write_config('BBINCLUDELOGS = "yes"')
+        result = bitbake("logging-test -c pythontest_exec_func_python -f",
+                         ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # A sys.exit() should include the output
+        self.assertCount(result.output, "This is python stdout", 1)
+
+        # no logs, verbose
+        self.write_config('BBINCLUDELOGS = ""')
+        result = bitbake("logging-test -c pythontest_exec_func_python -f -v",
+                         ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # python tasks don't log output with -v currently
+        #self.assertCount(result.output, "This is python stdout", 1)
+
+        # logs, verbose
+        self.write_config('BBINCLUDELOGS = "yes"')
+        result = bitbake("logging-test -c pythontest_exec_func_python -f -v",
+                         ignore_status = True)
+        self.assertIn("ERROR: Logfile of failure stored in:", result.output)
+        # python tasks don't log output with -v currently
+        #self.assertCount(result.output, "This is python stdout", 1)
+
     def test_python_fatal_logging(self):
         # no logs, no verbose
         self.write_config('BBINCLUDELOGS = ""')


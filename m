Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7069C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 16:03:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.478.1645459434931128920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 08:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TbG4cA7y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d3so12270384wrf.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 08:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dDQ6Wf+TKtPReNF/JhGeZWMNEc7Bqg4+tv9YB9L9lHw=;
        b=TbG4cA7yZbwKnr0JKg+nOFCIPe8H5nN8vOyXP9jfy7aWxG7fZOiO/31WTLzSCUb4h9
         OB1kxfeCHCWjttTBO3CDMjb7kOl1Y7sEIo/1LUpmixEqluc5mPYVc6ustt+ydAMlqfqL
         UGf7AUa5xQRAKXc7FkLqfT9TdpmivkjMdMY7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dDQ6Wf+TKtPReNF/JhGeZWMNEc7Bqg4+tv9YB9L9lHw=;
        b=vcov4hh5VC5smg3gSnduE9VDqMCHgX3QGYiEvQsJmiY5BjDKJPFY/dFy4QIUehE7p6
         gVu9kYtpI7L5uuNUzTM36bjLZywYeI6Q9hgFr5UhwrpubKBPGd2qJuwGdamF839NYCyf
         h2egk8COYqI5cryejEsTG0lpS39hEht1PKyJ/esKaWcrIdnhnunhDK3Mdd/Dxn64dfDZ
         xIzURpbipqWeMsXhoPWq2Jyw3BdM7kgSfn2dPlLDglKMNsY9mZfviv6g6ZucmjKGerDO
         lUyrJrkZB7yAsVDSZKjGeVJBqQmkZlJt+o90QV3ci2DGCieZeSWF8VQlSbIfSiQXHnV5
         i3VQ==
X-Gm-Message-State: AOAM532wZiM2PJzo/FCN152944RWXre6rZTQQGnz0wK32VrLPSYj2X9V
	LaIQxkux62u/eFreQAO0KjAWgdT9h1kJId3q
X-Google-Smtp-Source: 
 ABdhPJx1E264BzODyDFueYcwpl8b/c48TJg+85ORSTvaVOwOL8D3hCJ+4F881giCI3v3pj1HCndr4A==
X-Received: by 2002:adf:fa90:0:b0:1e6:8bb4:3ad6 with SMTP id
 h16-20020adffa90000000b001e68bb43ad6mr16075935wrr.286.1645459432954;
        Mon, 21 Feb 2022 08:03:52 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ae50:3f11:233d:4303])
        by smtp.gmail.com with ESMTPSA id
 j6sm38526065wrt.70.2022.02.21.08.03.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 08:03:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/bblogging: Split the test cases up for ease of
 testing
Date: Mon, 21 Feb 2022 16:03:51 +0000
Message-Id: <20220221160351.3167597-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162058

This makes it easier to see which of the tests are passing/failing for
a given change which aids debugging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bblogging.py | 25 ++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblogging.py b/meta/lib/oeqa/selftest/cases/bblogging.py
index 6b0bbfe1c1b..317e68b82f7 100644
--- a/meta/lib/oeqa/selftest/cases/bblogging.py
+++ b/meta/lib/oeqa/selftest/cases/bblogging.py
@@ -11,7 +11,7 @@ class BitBakeLogging(OESelftestTestCase):
     def assertCount(self, item, entry, count):
         self.assertEqual(item.count(entry), count, msg="Output:\n'''\n%s\n'''\ndoesn't contain %d copies of:\n'''\n%s\n'''\n" % (item, count, entry))
 
-    def test_shell_logging(self):
+    def test_shell_loggingA(self):
         # no logs, no verbose
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c shelltest -f", ignore_status = True)
@@ -19,6 +19,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertNotIn("This is shell stdout", result.output)
         self.assertNotIn("This is shell stderr", result.output)
 
+    def test_shell_loggingB(self):
         # logs, no verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c shelltest -f", ignore_status = True)
@@ -26,6 +27,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertCount(result.output, "This is shell stdout", 1)
         self.assertCount(result.output, "This is shell stderr", 1)
 
+    def test_shell_loggingC(self):
         # no logs, verbose
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c shelltest -f -v", ignore_status = True)
@@ -34,6 +36,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertCount(result.output, "This is shell stdout", 2)
         self.assertCount(result.output, "This is shell stderr", 2)
 
+    def test_shell_loggingD(self):
         # logs, verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c shelltest -f -v", ignore_status = True)
@@ -42,7 +45,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertCount(result.output, "This is shell stdout", 2)
         self.assertCount(result.output, "This is shell stderr", 2)
 
-    def test_python_exec_func_shell_logging(self):
+    def test_python_exec_func_shell_loggingA(self):
         # no logs, no verbose
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c pythontest_exec_func_shell -f",
@@ -51,6 +54,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertNotIn("This is shell stdout", result.output)
         self.assertNotIn("This is shell stderr", result.output)
 
+    def test_python_exec_func_shell_loggingB(self):
         # logs, no verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c pythontest_exec_func_shell -f",
@@ -59,6 +63,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertCount(result.output, "This is shell stdout", 1)
         self.assertCount(result.output, "This is shell stderr", 1)
 
+    def test_python_exec_func_shell_loggingC(self):
         # no logs, verbose
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c pythontest_exec_func_shell -f -v",
@@ -68,6 +73,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertCount(result.output, "This is shell stdout", 2)
         self.assertCount(result.output, "This is shell stderr", 2)
 
+    def test_python_exec_func_shell_loggingD(self):
         # logs, verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c pythontest_exec_func_shell -f -v",
@@ -77,13 +83,14 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertCount(result.output, "This is shell stdout", 2)
         self.assertCount(result.output, "This is shell stderr", 2)
 
-    def test_python_exit_logging(self):
+    def test_python_exit_loggingA(self):
         # no logs, no verbose
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c pythontest_exit -f", ignore_status = True)
         self.assertIn("ERROR: Logfile of failure stored in:", result.output)
         self.assertNotIn("This is python stdout", result.output)
 
+    def test_python_exit_loggingB(self):
         # logs, no verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c pythontest_exit -f", ignore_status = True)
@@ -91,6 +98,7 @@ class BitBakeLogging(OESelftestTestCase):
         # A sys.exit() should include the output
         self.assertCount(result.output, "This is python stdout", 1)
 
+    def test_python_exit_loggingC(self):
         # no logs, verbose
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c pythontest_exit -f -v", ignore_status = True)
@@ -98,6 +106,7 @@ class BitBakeLogging(OESelftestTestCase):
         # python tasks don't log output with -v currently
         #self.assertCount(result.output, "This is python stdout", 1)
 
+    def test_python_exit_loggingD(self):
         # logs, verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c pythontest_exit -f -v", ignore_status = True)
@@ -105,7 +114,7 @@ class BitBakeLogging(OESelftestTestCase):
         # python tasks don't log output with -v currently
         #self.assertCount(result.output, "This is python stdout", 1)
 
-    def test_python_exec_func_python_logging(self):
+    def test_python_exec_func_python_loggingA(self):
         # no logs, no verbose
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c pythontest_exec_func_python -f",
@@ -113,6 +122,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertIn("ERROR: Logfile of failure stored in:", result.output)
         self.assertNotIn("This is python stdout", result.output)
 
+    def test_python_exec_func_python_loggingB(self):
         # logs, no verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c pythontest_exec_func_python -f",
@@ -121,6 +131,7 @@ class BitBakeLogging(OESelftestTestCase):
         # A sys.exit() should include the output
         self.assertCount(result.output, "This is python stdout", 1)
 
+    def test_python_exec_func_python_loggingC(self):
         # no logs, verbose
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c pythontest_exec_func_python -f -v",
@@ -129,6 +140,7 @@ class BitBakeLogging(OESelftestTestCase):
         # python tasks don't log output with -v currently
         #self.assertCount(result.output, "This is python stdout", 1)
 
+    def test_python_exec_func_python_loggingD(self):
         # logs, verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c pythontest_exec_func_python -f -v",
@@ -137,7 +149,7 @@ class BitBakeLogging(OESelftestTestCase):
         # python tasks don't log output with -v currently
         #self.assertCount(result.output, "This is python stdout", 1)
 
-    def test_python_fatal_logging(self):
+    def test_python_fatal_loggingA(self):
         # no logs, no verbose
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c pythontest_fatal -f", ignore_status = True)
@@ -145,6 +157,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertNotIn("This is python fatal test stdout", result.output)
         self.assertCount(result.output, "This is a fatal error", 1)
 
+    def test_python_fatal_loggingB(self):
         # logs, no verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c pythontest_fatal -f", ignore_status = True)
@@ -153,6 +166,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.assertNotIn("This is python fatal test stdout", result.output)
         self.assertCount(result.output, "This is a fatal error", 1)
 
+    def test_python_fatal_loggingC(self):
         # no logs, verbose
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c pythontest_fatal -f -v", ignore_status = True)
@@ -161,6 +175,7 @@ class BitBakeLogging(OESelftestTestCase):
         #self.assertCount(result.output, "This is python fatal test stdout", 1)
         self.assertCount(result.output, "This is a fatal error", 1)
 
+    def test_python_fatal_loggingD(self):
         # logs, verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c pythontest_fatal -f -v", ignore_status = True)
-- 
2.32.0



Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B5DD185E3
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 11:53:41 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4755.1767872955799700441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 03:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=miroslav.cernak@siemens.com header.s=fm1 header.b=GLHKgBlT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1333546-202601081139091dc91c13b900020757-12i9wk@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202601081139091dc91c13b900020757
        for <openembedded-core@lists.openembedded.org>;
        Thu, 08 Jan 2026 12:39:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=miroslav.cernak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=XNMpkOQssCEol6wjd/Wgplg556sPH7soGce/AWSiV7Y=;
 b=GLHKgBlTkXDAuH/zXNIaMbf1eEqTnZ/1x+K9IsgRGBVZMySGkDyS4w5xxV0lwmC2Rfr8zq
 dlMMfT2ZckQkEOeM/FfrB8GMEyOSl9u2WwDo8HVbLqIbWFNo0W5duJ36nbKUfVKfrVdNj2eG
 s1vrMQ3/ogxOzGG2GP9uDEwkJasedj3gUAfKi8eTSHfbWvjG3+5WbVCmZGZx30x8rHnSwXCY
 xheR7+7a6YHF8Bo6KXYzRsrQOInVHoAtvFfzly0s/8PmIAjBhjLpjwed6KkW76zT6X11u5YP
 dxSoopxS+pMv6D1DBwHJMrZ7I/EsVEukPNm5SHKgoe6NuqYEvtm6Y99Q==;
From: Miroslav Cernak <miroslav.cernak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@siemens.com,
	Miroslav Cernak <miroslav.cernak@siemens.com>
Subject: [PATCH 4/4] oe-selftest: improved junit test
Date: Thu,  8 Jan 2026 12:36:47 +0100
Message-Id: <20260108113647.56663-5-miroslav.cernak@siemens.com>
In-Reply-To: <20260108113647.56663-1-miroslav.cernak@siemens.com>
References: <20260108113647.56663-1-miroslav.cernak@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1333546:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 11:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229063

Verify junit with improved image status and error

Signed-off-by: Miroslav Cernak <miroslav.cernak@siemens.com>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 62 +++++++++++--------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index aa90116795..e933fc6390 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -432,6 +432,12 @@ class ResultToolTests(OESelftestTestCase):
                                 "duration": "2",
                                 "log": "FAILED: package-failed.test_failed\nPASS: package-failed.test_passed\n",
                             },
+                            # Test with exitcode without ptestresult
+                            "package-error-noresult": {
+                                "duration": "6",
+                                "exitcode": "123",
+                                "log": "ERROR: -bash: testerror: command not found\nERROR: Exit status is 123\n",
+                            },
                         },
                     },
                 }
@@ -454,11 +460,11 @@ class ResultToolTests(OESelftestTestCase):
             )
 
     def _check_junit_testresults_1(self, testsuites_node):
-        self.assertEqual(testsuites_node.attrib["errors"], "1")
+        self.assertEqual(testsuites_node.attrib["errors"], "2")
         self.assertEqual(testsuites_node.attrib["failures"], "1")
         self.assertEqual(testsuites_node.attrib["skipped"], "2")
-        self.assertEqual(testsuites_node.attrib["tests"], "6")
-        self.assertEqual(testsuites_node.attrib["time"], "16")
+        self.assertEqual(testsuites_node.attrib["tests"], "7")
+        self.assertEqual(testsuites_node.attrib["time"], "22")
 
         testsuites = testsuites_node.findall("testsuite")
         self.assertEqual(testsuites[0].attrib["name"], "runtime_a-image")
@@ -472,10 +478,12 @@ class ResultToolTests(OESelftestTestCase):
         self.assertEqual(testcases[1].attrib["name"], "package-skipped")
         self.assertEqual(testcases[2].attrib["name"], "package-error")
         self.assertEqual(testcases[3].attrib["name"], "package-failed")
+        self.assertEqual(testcases[4].attrib["name"], "package-error-noresult")
         self.assertEqual(testcases[0].attrib["time"], "2")
         self.assertEqual(testcases[1].attrib["time"], "1")
         self.assertEqual(testcases[2].attrib["time"], "4")
         self.assertEqual(testcases[3].attrib["time"], "2")
+        self.assertEqual(testcases[4].attrib["time"], "6")
 
     def test_junit_log_inline(self):
         testresults = self._get_junit_testresults_1
@@ -492,22 +500,22 @@ class ResultToolTests(OESelftestTestCase):
         ptestresult_sections = testresults["a"]["runtime_a-image"]["result"][
             "ptestresult.sections"
         ]
-        self.assertEqual(
-            ptestresult_sections["package-passed"]["log"],
-            testcases[0].find("system-out").text,
-        )
-        self.assertEqual(
-            ptestresult_sections["package-skipped"]["log"],
-            testcases[1].find("system-out").text,
-        )
-        self.assertEqual(
-            ptestresult_sections["package-error"]["log"],
-            testcases[2].find("system-out").text,
-        )
-        self.assertEqual(
-            ptestresult_sections["package-failed"]["log"],
-            testcases[3].find("system-out").text,
-        )
+        # The inline system-out now includes a PtestSummary section followed by the raw section log.
+        # Build expected summaries and verify both parts are present.
+        pkg_error_summary = PtestSummary()
+        pkg_error_summary.add_status("test_error", "ERROR")
+        pkg_error_summary.add_status("test_failed", "FAILED")
+        pkg_error_summary.add_status("test_skipped", "SKIPPED")
+        pkg_failed_summary = PtestSummary()
+        pkg_failed_summary.add_status("test_failed", "FAILED")
+
+        pkg_error_out = testcases[2].find("system-out").text
+        self.assertIn(pkg_error_summary.log_summary, pkg_error_out)
+        self.assertIn(ptestresult_sections["package-error"]["log"], pkg_error_out)
+
+        pkg_failed_out = testcases[3].find("system-out").text
+        self.assertIn(pkg_failed_summary.log_summary, pkg_failed_out)
+        self.assertIn(ptestresult_sections["package-failed"]["log"], pkg_failed_out)
 
         # Check the ptest log messages are inline
         self.assertDictEqual(test_logfiles, {})
@@ -525,14 +533,9 @@ class ResultToolTests(OESelftestTestCase):
         # Verify the attached log files
         ptests_suite = testsuites_node.find(".//testsuite[@name='Package Tests']")
         testcases = ptests_suite.findall("testcase")
-        self.assertIn(
-            "[[ATTACHMENT|test-logs/package-passed.log]]",
-            testcases[0].find("system-out").text,
-        )
-        self.assertIn(
-            "[[ATTACHMENT|test-logs/package-skipped.log]]",
-            testcases[1].find("system-out").text,
-        )
+        # Passed and skipped testcases do not include system-out attachments
+        self.assertIsNone(testcases[0].find("system-out"))
+        self.assertIsNone(testcases[1].find("system-out"))
         self.assertIn(
             "[[ATTACHMENT|test-logs/package-error.log]]",
             testcases[2].find("system-out").text,
@@ -541,6 +544,10 @@ class ResultToolTests(OESelftestTestCase):
             "[[ATTACHMENT|test-logs/package-failed.log]]",
             testcases[3].find("system-out").text,
         )
+        self.assertIn(
+            "[[ATTACHMENT|test-logs/package-error-noresult.log]]",
+            testcases[4].find("system-out").text,
+        )
 
         self.maxDiff = None
         self.assertDictEqual(
@@ -550,5 +557,6 @@ class ResultToolTests(OESelftestTestCase):
                 "test-logs/package-skipped.log": "SKIPPED: package-skipped.test_skipped\n",
                 "test-logs/package-error.log": "ERROR: ERROR: package-error.test_error\nFAILED: package-error.test_failed\nSKIPPED: package-error.test_skipped\nPASSED: package-error.test_passed\n",
                 "test-logs/package-failed.log": "FAILED: package-failed.test_failed\nPASS: package-failed.test_passed\n",
+                "test-logs/package-error-noresult.log": "ERROR: -bash: testerror: command not found\nERROR: Exit status is 123\n",
             },
         )


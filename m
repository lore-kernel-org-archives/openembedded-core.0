Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0245EB105E
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 14:35:48 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39512.1773148097732403467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 06:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=miroslav.cernak@siemens.com header.s=fm1 header.b=CBBiq+3b;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1333546-202603101258139612be7a120002073f-_x576i@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202603101258139612be7a120002073f
        for <openembedded-core@lists.openembedded.org>;
        Tue, 10 Mar 2026 13:58:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=miroslav.cernak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FJOpXyLEKIlwhPebZeFWjjpK19mphNr0cHFN0ayxhOU=;
 b=CBBiq+3b2ZOD4QqNrQAB+Rc/Y50C9FTes3MrS6QwFH6AWX6uAWpzbjlAt/+0YFADIP6duy
 NJrAEwVSHsHSOzudXy3fEhVro86XtBSxYVr9UrBtHmdbqHpC7NYH28a1wJvGD+doEOPnP3pA
 XdgGdgHuwbRor7lbeyfp24pnJMA8u+ee5Ux+MfKTdD/3423Kbo6L2R7Pp9bdX6SAtyuOQJkN
 wqSfBcR+lxtXX4BhBTuwMH7kk1X/9arMIfWyCDIQeoOCjageco81lfekKd1+P++5OANN77EQ
 9xbjQvwcAPTwwXmCzG1XNHuShRKxZ77lfIk1P7SRHPffPeWDvppFfulQ==;
From: Miroslav Cernak <miroslav.cernak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Miroslav Cernak <miroslav.cernak@siemens.com>
Subject: [PATCH 1/1] resulttool: fix UnboundLocalError when missing test results The junit_tree function failed when either ptest or imagetest results were missing from testresults.json due to uninitialized variables. Move variable initialization outside the loop to ensure they always have default values.
Date: Tue, 10 Mar 2026 13:57:53 +0100
Message-Id: <20260310125753.658173-2-miroslav.cernak@siemens.com>
In-Reply-To: <20260310125753.658173-1-miroslav.cernak@siemens.com>
References: <20260310125753.658173-1-miroslav.cernak@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1333546:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 14:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232791

Signed-off-by: Miroslav Cernak <miroslav.cernak@siemens.com>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 109 ++++++++++++++++++
 scripts/lib/resulttool/junit.py               |   5 +-
 2 files changed, 112 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index e933fc6390..2b0e089e95 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -560,3 +560,112 @@ class ResultToolTests(OESelftestTestCase):
                 "test-logs/package-error-noresult.log": "ERROR: -bash: testerror: command not found\nERROR: Exit status is 123\n",
             },
         )
+
+    def test_junit_empty_testresults(self):
+        """Test junit_tree with empty testresults (e.g., missing testresults.json)"""
+        testresults = {}
+        tree, test_logfiles = junit_tree(testresults)
+        self._dump_junit_tree(testresults, tree, "junit_empty")
+        testsuites_node = tree.getroot()
+
+        # Should have zero counts for everything
+        self.assertEqual(testsuites_node.attrib["errors"], "0")
+        self.assertEqual(testsuites_node.attrib["failures"], "0")
+        self.assertEqual(testsuites_node.attrib["skipped"], "0")
+        self.assertEqual(testsuites_node.attrib["tests"], "0")
+        self.assertEqual(testsuites_node.attrib["time"], "0")
+
+        # Should have no testsuites
+        testsuites = testsuites_node.findall("testsuite")
+        self.assertEqual(len(testsuites), 0)
+
+        # No log files
+        self.assertDictEqual(test_logfiles, {})
+
+    def test_junit_missing_image_tests(self):
+        """Test junit_tree with only ptest results, no image tests"""
+        testresults = {
+            "a": {
+                "runtime_a-image": {
+                    "configuration": {"TEST_TYPE": "runtime", "MACHINE": "qemux86"},
+                    "result": {
+                        # Only ptest results, no image tests
+                        "ptestresult.package-test.test_example": {"status": "PASSED"},
+                        "ptestresult.sections": {
+                            "package-test": {
+                                "duration": "3",
+                                "log": "PASS: package-test.test_example\n",
+                            }
+                        },
+                    },
+                }
+            }
+        }
+        tree, test_logfiles = junit_tree(testresults)
+        self._dump_junit_tree(testresults, tree, "junit_no_image")
+        testsuites_node = tree.getroot()
+
+        # Should have 1 test total (only ptest)
+        self.assertEqual(testsuites_node.attrib["errors"], "0")
+        self.assertEqual(testsuites_node.attrib["failures"], "0")
+        self.assertEqual(testsuites_node.attrib["skipped"], "0")
+        self.assertEqual(testsuites_node.attrib["tests"], "1")
+        self.assertEqual(testsuites_node.attrib["time"], "3")
+
+        # Should have one main testsuite with 2 sub-testsuites
+        testsuites = testsuites_node.findall("testsuite")
+        self.assertEqual(len(testsuites), 1)
+        inner_testsuites = testsuites[0].findall("testsuite")
+        self.assertEqual(len(inner_testsuites), 2)
+
+        # Image testsuite should be empty
+        image_suite = testsuites_node.find(".//testsuite[@name='Image Tests']")
+        self.assertEqual(image_suite.attrib["tests"], "0")
+        self.assertEqual(image_suite.attrib["time"], "0")
+
+        # Package testsuite should have 1 test
+        package_suite = testsuites_node.find(".//testsuite[@name='Package Tests']")
+        self.assertEqual(package_suite.attrib["tests"], "1")
+        self.assertEqual(package_suite.attrib["time"], "3")
+
+    def test_junit_missing_ptests(self):
+        """Test junit_tree with only image tests, no ptest results"""
+        testresults = {
+            "a": {
+                "runtime_a-image": {
+                    "configuration": {"TEST_TYPE": "runtime", "MACHINE": "qemux86"},
+                    "result": {
+                        # Only image tests, no ptests
+                        "test.ImageTest.test_example": {
+                            "duration": 5,
+                            "status": "PASSED",
+                        },
+                    },
+                }
+            }
+        }
+        tree, test_logfiles = junit_tree(testresults)
+        self._dump_junit_tree(testresults, tree, "junit_no_ptest")
+        testsuites_node = tree.getroot()
+
+        # Should have 1 test total (only image test)
+        self.assertEqual(testsuites_node.attrib["errors"], "0")
+        self.assertEqual(testsuites_node.attrib["failures"], "0")
+        self.assertEqual(testsuites_node.attrib["skipped"], "0")
+        self.assertEqual(testsuites_node.attrib["tests"], "1")
+        self.assertEqual(testsuites_node.attrib["time"], "5")
+
+        # Should have one main testsuite with 1 sub-testsuite (only Image Tests)
+        testsuites = testsuites_node.findall("testsuite")
+        self.assertEqual(len(testsuites), 1)
+        inner_testsuites = testsuites[0].findall("testsuite")
+        self.assertEqual(len(inner_testsuites), 1)
+
+        # Image testsuite should have 1 test
+        image_suite = testsuites_node.find(".//testsuite[@name='Image Tests']")
+        self.assertEqual(image_suite.attrib["tests"], "1")
+        self.assertEqual(image_suite.attrib["time"], "5")
+
+        # Package testsuite should not exist (no ptestresult.sections)
+        package_suite = testsuites_node.find(".//testsuite[@name='Package Tests']")
+        self.assertIsNone(package_suite)
diff --git a/scripts/lib/resulttool/junit.py b/scripts/lib/resulttool/junit.py
index 0f541dd80b..48f34363be 100644
--- a/scripts/lib/resulttool/junit.py
+++ b/scripts/lib/resulttool/junit.py
@@ -91,6 +91,9 @@ def junit_tree(testresults, test_log_dir=None):
     """
     test_logfiles = {}
     testsuites_node = ET.Element("testsuites")
+
+    image_errors = image_failures = image_skipped = image_tests = image_total_time = 0
+    ptest_errors = ptest_failures = ptest_skipped = ptest_tests = ptest_total_time = 0
     total_errors = total_failures = total_skipped = total_tests = total_time = 0
 
     for _, run_name, _, results in resultutils.test_run_results(testresults):
@@ -98,7 +101,6 @@ def junit_tree(testresults, test_log_dir=None):
 
         # Handle all image tests but skip all ptests related sections
         imagetest_testsuite = ET.SubElement(test_run_testsuite, "testsuite", name="Image Tests")
-        image_errors = image_failures = image_skipped = image_tests = image_total_time = 0
 
         ptest_summarys = {}
 
@@ -141,7 +143,6 @@ def junit_tree(testresults, test_log_dir=None):
         imagetest_testsuite.set("time", str(image_total_time))
 
         # Handle all ptest related sections
-        ptest_errors = ptest_failures = ptest_skipped = ptest_tests = ptest_total_time = 0
         if "ptestresult.sections" in results:
             ptest_testsuite = ET.SubElement(test_run_testsuite, "testsuite", name="Package Tests")
 


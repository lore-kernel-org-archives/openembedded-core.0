Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6B9D185E2
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 11:53:31 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4764.1767872955432736513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 03:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=miroslav.cernak@siemens.com header.s=fm1 header.b=F25qWghS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1333546-20260108113908177a9132a9000207de-rx1_vq@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260108113908177a9132a9000207de
        for <openembedded-core@lists.openembedded.org>;
        Thu, 08 Jan 2026 12:39:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=miroslav.cernak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lF9xvKbDqFTLbQpqjo0NHmTB9huwsPUJcs2cQcevS+o=;
 b=F25qWghS12K2nxvKuHUNVDPC6FE3QPkL4ITl/kEMUMTXGKBmxl9rg/TxhmtPU0oF7gmALt
 NIF/xzxhs8igldlBaoidhN6h/ZQCAmze2mh+ms7hN7JEmWEK1ktwXrkeTfDoR54n91miG6Pk
 2w4Ktn0lxbSWLYptY9C9AigGpWK7ohXRWt9YQIP9iz1ACQ6gsANPfE+vqkRG7IsAaAdLssHc
 oDXwthvxvMukclSACtAnsD/cQB5WiAgsEyphSyLorYNaRB69WGTRz2JT7iA5U7xK0hDNv75i
 JxArcMmtttYmq59ey4cQVHidDdzelqMk8++gPi7Sdh8aZrlft3C6T9lg==;
From: Miroslav Cernak <miroslav.cernak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@siemens.com,
	Miroslav Cernak <miroslav.cernak@siemens.com>
Subject: [PATCH 2/4] oe-selftest: add resulttool junit test
Date: Thu,  8 Jan 2026 12:36:45 +0100
Message-Id: <20260108113647.56663-3-miroslav.cernak@siemens.com>
In-Reply-To: <20260108113647.56663-1-miroslav.cernak@siemens.com>
References: <20260108113647.56663-1-miroslav.cernak@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1333546:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 11:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229062

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Verify imagetests, and ptest with inlined as well as ptests with
attached log files work as expected.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Miroslav Cernak <miroslav.cernak@siemens.com>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 179 ++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index c3303f3fbb..aa90116795 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -14,6 +14,12 @@ from resulttool import regression as regression
 from resulttool import resultutils as resultutils
 from oeqa.selftest.case import OESelftestTestCase
 
+from resulttool.junit import junit_tree, PtestSummary
+import xml.etree.ElementTree as ET
+import logging
+import json
+
+
 class ResultToolTests(OESelftestTestCase):
     base_results_data = {'base_result1': {'configuration': {"TEST_TYPE": "runtime",
                                                             "TESTSERIES": "series1",
@@ -373,3 +379,176 @@ class ResultToolTests(OESelftestTestCase):
             self.logger, "A", "B", base_configuration["a"]["conf_X"], target_configuration["a"]["conf_Y"])
         self.assertDictEqual(
             result, {}, msg=f"ptests should be compared: {resultstring}")
+
+    @property
+    def _get_junit_testresults_1(self):
+        base_testresults = {
+            "a": {
+                "runtime_a-image": {
+                    "configuration": {"TEST_TYPE": "runtime", "MACHINE": "qemux86"},
+                    "result": {
+                        # Image test skipped
+                        "ptest.PtestRunnerTest.test_ptestrunner_expectfail": {
+                            "duration": 0,
+                            "log": "Cannot run ptests with @expectedFailure as ptests are required to pass",
+                            "status": "SKIPPED",
+                        },
+                        # Image test passed
+                        "ptest.PtestRunnerTest.test_ptestrunner_expectsuccess": {
+                            "duration": 7,
+                            "status": "PASSED",
+                        },
+                        # Passed and skipped tests: passed
+                        "ptestresult.package-passed.test_passed": {"status": "PASSED"},
+                        "ptestresult.package-passed.test_skipped": {
+                            "status": "SKIPPED"
+                        },
+                        # All tests are skipped: skipped
+                        "ptestresult.package-skipped.test_skipped": {
+                            "status": "SKIPPED"
+                        },
+                        # One or more errors: error
+                        "ptestresult.package-error.test_error": {"status": "ERROR"},
+                        "ptestresult.package-error.test_failed": {"status": "FAILED"},
+                        "ptestresult.package-error.test_skipped": {"status": "SKIPPED"},
+                        "ptestresult.package-error.test_passed": {"status": "PASSED"},
+                        # No error and one or more failed: failed
+                        "ptestresult.package-failed.test_failed": {"status": "FAILED"},
+                        "ptestresult.package-failed.test_passed": {"status": "PASSED"},
+                        "ptestresult.sections": {
+                            "package-passed": {
+                                "duration": "2",
+                                "log": "PASS: package-passed.test_passed\nPASS: package-passed.test_skipped\n",
+                            },
+                            "package-skipped": {
+                                "duration": "1",
+                                "log": "SKIPPED: package-skipped.test_skipped\n",
+                            },
+                            "package-error": {
+                                "duration": "4",
+                                "log": "ERROR: ERROR: package-error.test_error\nFAILED: package-error.test_failed\nSKIPPED: package-error.test_skipped\nPASSED: package-error.test_passed\n",
+                            },
+                            "package-failed": {
+                                "duration": "2",
+                                "log": "FAILED: package-failed.test_failed\nPASS: package-failed.test_passed\n",
+                            },
+                        },
+                    },
+                }
+            }
+        }
+        return base_testresults
+
+    def _dump_junit_tree(self, testresults, tree, files_name="junit"):
+        if self.logger.level <= logging.DEBUG:
+            junit_json_path = files_name + ".json"
+            with open(junit_json_path, "w") as f:
+                json.dump(testresults, f, indent=4)
+            self.logger.debug(
+                "Saved testresults json %s" % os.path.abspath(junit_json_path)
+            )
+            junit_xml_path = files_name + ".xml"
+            tree.write(junit_xml_path, encoding="UTF-8", xml_declaration=True)
+            self.logger.debug(
+                "Saved JUnit XML report as %s" % os.path.abspath(junit_xml_path)
+            )
+
+    def _check_junit_testresults_1(self, testsuites_node):
+        self.assertEqual(testsuites_node.attrib["errors"], "1")
+        self.assertEqual(testsuites_node.attrib["failures"], "1")
+        self.assertEqual(testsuites_node.attrib["skipped"], "2")
+        self.assertEqual(testsuites_node.attrib["tests"], "6")
+        self.assertEqual(testsuites_node.attrib["time"], "16")
+
+        testsuites = testsuites_node.findall("testsuite")
+        self.assertEqual(testsuites[0].attrib["name"], "runtime_a-image")
+        inner_testsuites = testsuites[0].findall("testsuite")
+        self.assertEqual(inner_testsuites[0].attrib["name"], "Image Tests")
+        self.assertEqual(inner_testsuites[1].attrib["name"], "Package Tests")
+
+        ptests_suite = testsuites_node.find(".//testsuite[@name='Package Tests']")
+        testcases = ptests_suite.findall("testcase")
+        self.assertEqual(testcases[0].attrib["name"], "package-passed")
+        self.assertEqual(testcases[1].attrib["name"], "package-skipped")
+        self.assertEqual(testcases[2].attrib["name"], "package-error")
+        self.assertEqual(testcases[3].attrib["name"], "package-failed")
+        self.assertEqual(testcases[0].attrib["time"], "2")
+        self.assertEqual(testcases[1].attrib["time"], "1")
+        self.assertEqual(testcases[2].attrib["time"], "4")
+        self.assertEqual(testcases[3].attrib["time"], "2")
+
+    def test_junit_log_inline(self):
+        testresults = self._get_junit_testresults_1
+        tree, test_logfiles = junit_tree(testresults)
+        self._dump_junit_tree(testresults, tree)
+        testsuites_node = tree.getroot()
+
+        # Verify the common part
+        self._check_junit_testresults_1(testsuites_node)
+
+        # Verify the inlined log files
+        ptests_suite = testsuites_node.find(".//testsuite[@name='Package Tests']")
+        testcases = ptests_suite.findall("testcase")
+        ptestresult_sections = testresults["a"]["runtime_a-image"]["result"][
+            "ptestresult.sections"
+        ]
+        self.assertEqual(
+            ptestresult_sections["package-passed"]["log"],
+            testcases[0].find("system-out").text,
+        )
+        self.assertEqual(
+            ptestresult_sections["package-skipped"]["log"],
+            testcases[1].find("system-out").text,
+        )
+        self.assertEqual(
+            ptestresult_sections["package-error"]["log"],
+            testcases[2].find("system-out").text,
+        )
+        self.assertEqual(
+            ptestresult_sections["package-failed"]["log"],
+            testcases[3].find("system-out").text,
+        )
+
+        # Check the ptest log messages are inline
+        self.assertDictEqual(test_logfiles, {})
+
+    def test_junit_log_attached(self):
+        testresults_1 = self._get_junit_testresults_1
+        test_logdir = "test-logs"
+        tree, test_logfiles = junit_tree(testresults_1, test_logdir)
+        self._dump_junit_tree(testresults_1, tree, "junit_attached")
+        testsuites_node = tree.getroot()
+
+        # Verify the common part
+        self._check_junit_testresults_1(testsuites_node)
+
+        # Verify the attached log files
+        ptests_suite = testsuites_node.find(".//testsuite[@name='Package Tests']")
+        testcases = ptests_suite.findall("testcase")
+        self.assertIn(
+            "[[ATTACHMENT|test-logs/package-passed.log]]",
+            testcases[0].find("system-out").text,
+        )
+        self.assertIn(
+            "[[ATTACHMENT|test-logs/package-skipped.log]]",
+            testcases[1].find("system-out").text,
+        )
+        self.assertIn(
+            "[[ATTACHMENT|test-logs/package-error.log]]",
+            testcases[2].find("system-out").text,
+        )
+        self.assertIn(
+            "[[ATTACHMENT|test-logs/package-failed.log]]",
+            testcases[3].find("system-out").text,
+        )
+
+        self.maxDiff = None
+        self.assertDictEqual(
+            test_logfiles,
+            {
+                "test-logs/package-passed.log": "PASS: package-passed.test_passed\nPASS: package-passed.test_skipped\n",
+                "test-logs/package-skipped.log": "SKIPPED: package-skipped.test_skipped\n",
+                "test-logs/package-error.log": "ERROR: ERROR: package-error.test_error\nFAILED: package-error.test_failed\nSKIPPED: package-error.test_skipped\nPASSED: package-error.test_passed\n",
+                "test-logs/package-failed.log": "FAILED: package-failed.test_failed\nPASS: package-failed.test_passed\n",
+            },
+        )


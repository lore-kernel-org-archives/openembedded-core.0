Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8597CD185E5
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 11:54:01 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4763.1767872955432320154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 03:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=miroslav.cernak@siemens.com header.s=fm1 header.b=VDjkLiA6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1333546-202601081139096498f2f74500020760-gj6bcf@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202601081139096498f2f74500020760
        for <openembedded-core@lists.openembedded.org>;
        Thu, 08 Jan 2026 12:39:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=miroslav.cernak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xxgKxbnVwPjWi3sXX8pAMFFvTD4nfdEtJ0R4Yi4H1rM=;
 b=VDjkLiA6UFM2EaE0Sl4qaab/IBKoiUJ8Wi4i5WBLxOhkhR9nkkaecUKE7ZPvcIa+XFvt9n
 +z16jjrDrXNh4pciXP6HMpPseGPFaihHuvGMQoJA41akUjfFvG89XsaTdgdpK5aJGVgPpIYv
 d1pQremNkxn7148BfnmX8KS6chNyIbQGBTKHF/JLy45MAjU7yWFAjYWLSGVj4m0LxKYjc8BX
 FmHPnT9wftRd17s58nuOsuueySbUVAqUP2FhNPtwpleFrlOAKPi4acoAvrlU3QUf6yz9WDzH
 I9PinDECuKKgI0FfyZdzFo3vJtsgTq9+SMFkQ67AvNw9xKl9KRNEFJJA==;
From: Miroslav Cernak <miroslav.cernak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@siemens.com,
	Miroslav Cernak <miroslav.cernak@siemens.com>
Subject: [PATCH 3/4] resulttool: junit: improve ptest status handling and log
Date: Thu,  8 Jan 2026 12:36:46 +0100
Message-Id: <20260108113647.56663-4-miroslav.cernak@siemens.com>
In-Reply-To: <20260108113647.56663-1-miroslav.cernak@siemens.com>
References: <20260108113647.56663-1-miroslav.cernak@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1333546:519-21489:flowmailer
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 11:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229065

While using resulttool's JUnit export, several issues surfaced
and are addressed here:
- Avoid KeyError when ptest results are missing by guarding access to
  ptest_summary e.g., KeyError: 'bzip2'
- Report actual failures as FAILED instead of SKIPPED and list the failing
  testcase names (e.g., DataSQLite-testrunner, Foundation-testrunner).
- Include testcase names in failure output rather than only the ptest name,
  improving first-read diagnosability.
- Make multiline failure details readable: put full traces in JUnit output;
  for attribute-only messages that cannot contain newlines, collapse “\n” to
  spaces to avoid “ ” artifacts in GitLab.

This produces a more accurate and readable JUnit report, prevents crashes
when ptestresult.* lacks entries, and makes CI output actionable on first read.

Signed-off-by: Miroslav Cernak <miroslav.cernak@siemens.com>
---
 scripts/lib/resulttool/junit.py | 78 +++++++++++++++++++++++----------
 1 file changed, 54 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/resulttool/junit.py b/scripts/lib/resulttool/junit.py
index c4476f1e59..0f541dd80b 100644
--- a/scripts/lib/resulttool/junit.py
+++ b/scripts/lib/resulttool/junit.py
@@ -26,14 +26,14 @@ class PtestSummary:
         self.FAILED = []
         self.SKIPPED = []
 
-    def add_status(self, ptest_name, status):
+    def add_status(self, ptest_testcase, status):
         self.tests += 1
         if status == "FAILED":
-            self.FAILED.append(ptest_name)
+            self.FAILED.append(ptest_testcase)
         elif status == "ERROR":
-            self.ERROR.append(ptest_name)
+            self.ERROR.append(ptest_testcase)
         elif status == "SKIPPED":
-            self.SKIPPED.append(ptest_name)
+            self.SKIPPED.append(ptest_testcase)
 
     @property
     def status(self):
@@ -49,32 +49,38 @@ class PtestSummary:
     @property
     def log_summary(self):
         """Return a summary of the ptest suite"""
-        summary_str = "ERROR:" + os.linesep
-        summary_str += os.linesep.join([s + "- " for s in self.ERROR]) + os.linesep
-        summary_str = "FAILED:" + os.linesep
-        summary_str += os.linesep.join([s + "- " for s in self.FAILED]) + os.linesep
-        summary_str = "SKIPPED:" + os.linesep
-        summary_str += os.linesep.join([s + "- " for s in self.SKIPPED]) + os.linesep
-        return summary_str
+        summary_parts = []
+
+        if self.ERROR:
+            summary_parts.append("ERROR:" + os.linesep)
+            summary_parts.append(os.linesep.join(["- " + s for s in self.ERROR]) + os.linesep)
+
+        if self.FAILED:
+            summary_parts.append("FAILED:" + os.linesep)
+            summary_parts.append(os.linesep.join(["- " + s for s in self.FAILED]) + os.linesep)
+
+        if self.SKIPPED:
+            summary_parts.append("SKIPPED:" + os.linesep)
+            summary_parts.append(os.linesep.join(["- " + s for s in self.SKIPPED]) + os.linesep)
+
+        return "".join(summary_parts) if summary_parts else "No failures or errors"
 
 
 def create_testcase(testsuite, testcase_dict, status, status_message, status_text=None, system_out=None):
     """Create a junit testcase node"""
     testcase_node = ET.SubElement(testsuite, "testcase", testcase_dict)
 
+    print("%s -> %s status: %s" % (testcase_dict["classname"], testcase_dict["name"], status))
+
     se = None
     if status == "SKIPPED":
-        se = ET.SubElement(testcase_node, "skipped", message=status_message)
+        se = ET.SubElement(testcase_node, "skipped", message = status_message.replace('\n', ' ') if status_message else None)
     elif status == "FAILED":
-        se = ET.SubElement(testcase_node, "failure", message=status_message)
+        se = ET.SubElement(testcase_node, "failure")
+        se = ET.SubElement(testcase_node, "system-out").text = (status_message or "") + os.linesep + (system_out or "")
     elif status == "ERROR":
-        se = ET.SubElement(testcase_node, "error", message=status_message)
-    if se and status_text:
-        se.text = status_text
-
-    if system_out:
-        ET.SubElement(testcase_node, "system-out").text = system_out
-
+        se = ET.SubElement(testcase_node, "error")
+        se = ET.SubElement(testcase_node, "system-out").text = (status_message or "") + os.linesep + (system_out or "")
 
 def junit_tree(testresults, test_log_dir=None):
     """Create a JUnit XML tree from testresults
@@ -102,9 +108,10 @@ def junit_tree(testresults, test_log_dir=None):
 
             if result_id.startswith("ptestresult."):
                 ptest_name = result_id.split(".", 3)[1]
+                test_case = result_id.split(".", 3)[2]
                 if ptest_name not in ptest_summarys:
                     ptest_summarys[ptest_name] = PtestSummary()
-                ptest_summarys[ptest_name].add_status(ptest_name, result["status"])
+                ptest_summarys[ptest_name].add_status(test_case, result["status"])
             else:
                 image_total_time += int(result["duration"])
                 image_tests += 1
@@ -145,6 +152,7 @@ def junit_tree(testresults, test_log_dir=None):
                     "time": str(result["duration"]),
                 }
 
+                exitcode = result.get("exitcode")
                 log = result.get("log")
                 system_out = None
                 if log:
@@ -155,15 +163,24 @@ def junit_tree(testresults, test_log_dir=None):
                     else:
                         system_out = log
 
+                # Determine status and log summary
+                if ptest_name in ptest_summarys:
+                    status = ptest_summarys[ptest_name].status
+                    log_summary = ptest_summarys[ptest_name].log_summary
+                else:
+                    # When there is no detailed result for the ptest, we assume it was skipped or errored
+                    status = "SKIPPED" if exitcode in (None, "0") else "ERROR"
+                    print("Warning: ptest %s has no detailed results, marking as %s" % (ptest_name, status))
+                    log_summary = log if log else "No log available."
+
                 create_testcase(ptest_testsuite,
                                 testcase_dict,
-                                ptest_summarys[ptest_name].status,
-                                ptest_summarys[ptest_name].log_summary,
+                                status,
+                                log_summary,
                                 system_out=system_out)
 
                 ptest_total_time += int(result["duration"])
                 ptest_tests += 1
-                status = ptest_summarys[ptest_name].status
                 if status == "FAILED":
                     ptest_failures += 1
                 elif status == "ERROR":
@@ -188,6 +205,19 @@ def junit_tree(testresults, test_log_dir=None):
     testsuites_node.set("skipped", str(total_skipped))
     testsuites_node.set("tests", str(total_tests))
     testsuites_node.set("time", str(total_time))
+
+    ptest_success = ptest_tests - ptest_errors - ptest_failures - ptest_skipped
+    image_success = image_tests - image_errors - image_failures - image_skipped
+    total_success = total_tests - total_errors - total_failures - total_skipped
+
+    print("ptest     -> tests: %d, success: %d, error: %d, failures: %d, skipped: %d, time: %d" %
+              (ptest_tests, ptest_success, ptest_errors, ptest_failures, ptest_skipped, ptest_total_time))
+
+    print("testimage -> tests: %d, success: %d, error: %d, failures: %d, skipped: %d, time: %d" %
+            (image_tests, image_success, image_errors, image_failures, image_skipped, image_total_time))
+
+    print("total     -> tests: %d, success: %d, error: %d, failures: %d, skipped: %d, time: %d" %
+            (total_tests, total_success, total_errors, total_failures, total_skipped, total_time))
     tree = ET.ElementTree(testsuites_node)
     return tree, test_logfiles
 


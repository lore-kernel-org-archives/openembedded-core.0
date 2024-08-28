Return-Path: <clara.kowalsky@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4EAC5475C
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 09:20:43 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.9370.1724836835228571764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 02:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=clara.kowalsky@siemens.com header.s=fm1 header.b=RqydTxNA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1047747-20240828092031a4f3b29aa4f226d14c-lb_yxj@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240828092031a4f3b29aa4f226d14c
        for <openembedded-core@lists.openembedded.org>;
        Wed, 28 Aug 2024 11:20:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=clara.kowalsky@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=sKC1p88QUzaO/Q+4Y9AmCJZKGOGlJOuGLEyI26L+y2o=;
 b=RqydTxNAoBqYbylv5dFLZKZ6sSdFocHNlOSAafEzU+sS61fVSljUJtmt1hec15RE3lsfPq
 WBg49ynZBihd4D5/nMTuCLSA9k1aCqhyWF6x8dG3RyTqYbKuF7yJl6kRNcKvU14zecKlUdW+
 YEoxXLr/lJTFirYTriJkr5rpYtk/Z5+lDsi60ew6y1wxFjVIUK35PgisZ6J7HyyoeA9rj5Lq
 h38hxFRe3s0VleCPP5Fx7lnj+pqIRzsAuRYSB3zjiSt7tXGr+LlaTmQsO6wnA5lIS+rl9gM+
 XWRqLXE5/tY6S300JUxjpJkp+PBiiQ579O/mMYFtFGE6l0fCFxdX/lDQ==;
From: Clara Kowalsky <clara.kowalsky@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Clara Kowalsky <clara.kowalsky@siemens.com>
Subject: [OE-core] [PATCH v2] resulttool: Add support to create test report in JUnit XML format
Date: Wed, 28 Aug 2024 11:20:27 +0200
Message-Id: <20240828092027.2827279-1-clara.kowalsky@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1047747:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 09:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203877

This adds the functionality to convert the results of the
testresults.json file to a unit test report in JUnit XML format. The
unit test report can be used in the CI/CD pipeline to display the test
results.

To use the resulttool scripts, first source oe environment, then run the
entry point script to look for help.
	$ resulttool

To generate the unit test report, execute the below
	$ resulttool junit <json_file>

By default the unit test report is stored as
<build_dir>/tmp/log/oeqa/junit.xml.

Signed-off-by: Clara Kowalsky <clara.kowalsky@siemens.com>
---
 scripts/lib/resulttool/junit.py | 77 +++++++++++++++++++++++++++++++++
 scripts/resulttool              |  5 +++
 2 files changed, 82 insertions(+)
 create mode 100644 scripts/lib/resulttool/junit.py

diff --git a/scripts/lib/resulttool/junit.py b/scripts/lib/resulttool/junit.py
new file mode 100644
index 0000000000..c7a53dc550
--- /dev/null
+++ b/scripts/lib/resulttool/junit.py
@@ -0,0 +1,77 @@
+# resulttool - report test results in JUnit XML format
+#
+# Copyright (c) 2024, Siemens AG.
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import os
+import re
+import xml.etree.ElementTree as ET
+import resulttool.resultutils as resultutils
+
+def junit(args, logger):
+    testresults = resultutils.load_resultsdata(args.json_file, configmap=resultutils.store_map)
+
+    total_time = 0
+    skipped = 0
+    failures = 0
+    errors = 0
+
+    for tests in testresults.values():
+        results = tests[next(reversed(tests))].get("result", {})
+
+    for result_id, result in results.items():
+        # filter out ptestresult.rawlogs and ptestresult.sections
+        if re.search(r'\.test_', result_id):
+            total_time += result.get("duration", 0)
+
+            if result['status'] == "FAILED":
+                failures += 1
+            elif result['status'] == "ERROR":
+                errors += 1
+            elif result['status'] == "SKIPPED":
+                skipped += 1
+
+    testsuites_node = ET.Element("testsuites")
+    testsuites_node.set("time", "%s" % total_time)
+    testsuite_node = ET.SubElement(testsuites_node, "testsuite")
+    testsuite_node.set("name", "Testimage")
+    testsuite_node.set("time", "%s" % total_time)
+    testsuite_node.set("tests", "%s" % len(results))
+    testsuite_node.set("failures", "%s" % failures)
+    testsuite_node.set("errors", "%s" % errors)
+    testsuite_node.set("skipped", "%s" % skipped)
+
+    for result_id, result in results.items():
+        if re.search(r'\.test_', result_id):
+            testcase_node = ET.SubElement(testsuite_node, "testcase", {
+                "name": result_id,
+                "classname": "Testimage",
+                "time": str(result['duration'])
+            })
+            if result['status'] == "SKIPPED":
+                ET.SubElement(testcase_node, "skipped", message=result['log'])
+            elif result['status'] == "FAILED":
+                ET.SubElement(testcase_node, "failure", message=result['log'])
+            elif result['status'] == "ERROR":
+                ET.SubElement(testcase_node, "error", message=result['log'])
+
+    tree = ET.ElementTree(testsuites_node)
+
+    if args.junit_xml_path is None:
+        args.junit_xml_path = os.environ['BUILDDIR'] + '/tmp/log/oeqa/junit.xml'
+    tree.write(args.junit_xml_path, encoding='UTF-8', xml_declaration=True)
+
+    logger.info('Saved JUnit XML report as %s' % args.junit_xml_path)
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('junit', help='create test report in JUnit XML format',
+                                         description='generate unit test report in JUnit XML format based on the latest test results in the testresults.json.',
+                                         group='analysis')
+    parser_build.set_defaults(func=junit)
+    parser_build.add_argument('json_file',
+                              help='json file should point to the testresults.json')
+    parser_build.add_argument('-j', '--junit_xml_path',
+                              help='junit xml path allows setting the path of the generated test report. The default location is <build_dir>/tmp/log/oeqa/junit.xml')
diff --git a/scripts/resulttool b/scripts/resulttool
index fc282bda6c..66a6af9959 100755
--- a/scripts/resulttool
+++ b/scripts/resulttool
@@ -15,6 +15,9 @@
 # To report test report, execute the below
 #     $ resulttool report <source_dir>
 #
+# To create a unit test report in JUnit XML format, execute the below
+#     $ resulttool junit <json_file>
+#
 # To perform regression file analysis, execute the below
 #     $ resulttool regression-file <base_result_file> <target_result_file>
 #
@@ -43,6 +46,7 @@ import resulttool.regression
 import resulttool.report
 import resulttool.manualexecution
 import resulttool.log
+import resulttool.junit
 logger = scriptutils.logger_create('resulttool')
 
 def main():
@@ -61,6 +65,7 @@ def main():
     resulttool.regression.register_commands(subparsers)
     resulttool.report.register_commands(subparsers)
     resulttool.log.register_commands(subparsers)
+    resulttool.junit.register_commands(subparsers)
 
     args = parser.parse_args()
     if args.debug:
-- 
2.46.0



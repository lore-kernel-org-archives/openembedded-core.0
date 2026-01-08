Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84967D185E4
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 11:53:51 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4765.1767872955432818615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 03:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=miroslav.cernak@siemens.com header.s=fm1 header.b=YjckMTgQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1333546-202601081139089a9aad104f000207e1-jckbtp@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202601081139089a9aad104f000207e1
        for <openembedded-core@lists.openembedded.org>;
        Thu, 08 Jan 2026 12:39:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=miroslav.cernak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yhBW+X0EH3BQTFBJkDXGm1nDstJt3G7UmxgprOCp3VU=;
 b=YjckMTgQ4GG5XXOZbAeQuxEP6KzSOL4cqbCGRqvTbkCilZge3ChzWOmN2vvol9f3l1Mhyf
 VGiWT3H+SHrfERxbmCirF+SSKv3TgMkJltp+vnO72gntbApvqPc0ObHD+zQm15WiHNAEqErJ
 27xxdKPu/ym+w0h/q7DRdrv0fiHc1zoeHInnTjU4VU2SMefG4zfqQQ5tn8GJOG6u7bRVk+nK
 ErFnIVIx2K3JiNTcLUGuQp6sWrboZnhwQ8+tr0KOz1kodt1Wxubq8qJ+WGgB2r541IDKPl2z
 I60b94b22AyXfpGwT1YN3F8YvzHNQLHkwTQ7ituu17RdCNVtoWAT4V5A==;
From: Miroslav Cernak <miroslav.cernak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@siemens.com,
	Miroslav Cernak <miroslav.cernak@siemens.com>
Subject: [PATCH 1/4] resulttool: junit support ptests
Date: Thu,  8 Jan 2026 12:36:44 +0100
Message-Id: <20260108113647.56663-2-miroslav.cernak@siemens.com>
In-Reply-To: <20260108113647.56663-1-miroslav.cernak@siemens.com>
References: <20260108113647.56663-1-miroslav.cernak@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1333546:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 11:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229064

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Support image tests and ptest. Therefore some additional hirarchies get
introduced to the junit.xml file. Ptest log files can be written to a
file per ptest and referred from junit.xml as ATTACHMENT or the log
message can be inline in the system-out element. The following is an
example generated with --attach-log-files parameter.

<testsuites errors="0" failures="0" skipped="0" tests="2" time="298.51">
    <testsuite name="runtime_image_machine_20240919100051">
        <testsuite name="Image Tests" errors="0" failures="0" skipped="0" tests="1"
            time="297.51">
            <testcase name="df.DfTest.test_df" classname="testimage" time="1.35" />
        </testsuite>
        <testsuite name="Package Tests" errors="0" failures="0" skipped="0" tests="1"
            time="2">
            <testcase name="foo" classname="ptest" time="2"
                <system-out>[[ATTACHMENT|ptest-logs/foo.log]]</system-out>
        </testsuite>
    </testsuite>
</testsuites>

This works at least with GitLab's junit parser.
With GitLab inline system-out tags are not (yet?) fully supported by
GitLab. The details are discussed here:
https://gitlab.com/gitlab-org/gitlab/-/issues/440341

Support ptests
- Handle ptestresult.sections
  A log file per ptest is generated.
  This allows to make the detailed ptest log available via file
  attribute of the junit's testcase class.
- Skip ptestresults items.
  - Rendering all ptestresult sections quickly leads to overloaded test
    reports with almost no information (only test status per test).
    Handling the ptestresult.sections instead looks more useful
    especially for larger test pipelines.
  - This fixes a crash because they do not have a duration atribute.

Improve the command line parser. Calling just resulttool junit from a
bitbake environment finds the testresults.json in $BUILDDIR and writes
the corresponding junit.xml into the same directory.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Miroslav Cernak <miroslav.cernak@siemens.com>
---
 scripts/lib/resulttool/junit.py | 280 ++++++++++++++++++++++++++------
 1 file changed, 228 insertions(+), 52 deletions(-)

diff --git a/scripts/lib/resulttool/junit.py b/scripts/lib/resulttool/junit.py
index c7a53dc550..c4476f1e59 100644
--- a/scripts/lib/resulttool/junit.py
+++ b/scripts/lib/resulttool/junit.py
@@ -6,72 +6,248 @@
 #
 
 import os
-import re
 import xml.etree.ElementTree as ET
 import resulttool.resultutils as resultutils
 
-def junit(args, logger):
-    testresults = resultutils.load_resultsdata(args.json_file, configmap=resultutils.store_map)
 
-    total_time = 0
-    skipped = 0
-    failures = 0
-    errors = 0
+DEFAULT_JUNIT_FILE = "junit.xml"
+
+
+class PtestSummary:
+    """Collected infromation of one ptest suite
+
+    Collect the information of many ptests of a ptest suite such as ptestresults.APtest.test_foo1,
+    ptestresults.APtest.test_foo2, ... as one testcase APtest. This can be merged into information
+    from ptestresult.sections.
+    """
+    def __init__(self):
+        self.tests = 0
+        self.ERROR = []
+        self.FAILED = []
+        self.SKIPPED = []
+
+    def add_status(self, ptest_name, status):
+        self.tests += 1
+        if status == "FAILED":
+            self.FAILED.append(ptest_name)
+        elif status == "ERROR":
+            self.ERROR.append(ptest_name)
+        elif status == "SKIPPED":
+            self.SKIPPED.append(ptest_name)
+
+    @property
+    def status(self):
+        """Normalize the status of many ptests to one status of the ptest suite"""
+        if len(self.ERROR) > 0:
+            return "ERROR"
+        if len(self.FAILED) > 0:
+            return "FAILED"
+        if len(self.SKIPPED) == self.tests:
+            return "SKIPPED"
+        return "SUCCESS"
+
+    @property
+    def log_summary(self):
+        """Return a summary of the ptest suite"""
+        summary_str = "ERROR:" + os.linesep
+        summary_str += os.linesep.join([s + "- " for s in self.ERROR]) + os.linesep
+        summary_str = "FAILED:" + os.linesep
+        summary_str += os.linesep.join([s + "- " for s in self.FAILED]) + os.linesep
+        summary_str = "SKIPPED:" + os.linesep
+        summary_str += os.linesep.join([s + "- " for s in self.SKIPPED]) + os.linesep
+        return summary_str
+
 
-    for tests in testresults.values():
-        results = tests[next(reversed(tests))].get("result", {})
+def create_testcase(testsuite, testcase_dict, status, status_message, status_text=None, system_out=None):
+    """Create a junit testcase node"""
+    testcase_node = ET.SubElement(testsuite, "testcase", testcase_dict)
 
-    for result_id, result in results.items():
-        # filter out ptestresult.rawlogs and ptestresult.sections
-        if re.search(r'\.test_', result_id):
-            total_time += result.get("duration", 0)
+    se = None
+    if status == "SKIPPED":
+        se = ET.SubElement(testcase_node, "skipped", message=status_message)
+    elif status == "FAILED":
+        se = ET.SubElement(testcase_node, "failure", message=status_message)
+    elif status == "ERROR":
+        se = ET.SubElement(testcase_node, "error", message=status_message)
+    if se and status_text:
+        se.text = status_text
 
-            if result['status'] == "FAILED":
-                failures += 1
-            elif result['status'] == "ERROR":
-                errors += 1
-            elif result['status'] == "SKIPPED":
-                skipped += 1
+    if system_out:
+        ET.SubElement(testcase_node, "system-out").text = system_out
 
+
+def junit_tree(testresults, test_log_dir=None):
+    """Create a JUnit XML tree from testresults
+
+    Generates a tuple of the XML tree and a dictionary of ptest log files.
+    The dictionary contains the path where the log file is located as key and the log content as value.
+    The log file path is test_log_dir/ptest_name.log.
+    """
+    test_logfiles = {}
     testsuites_node = ET.Element("testsuites")
-    testsuites_node.set("time", "%s" % total_time)
-    testsuite_node = ET.SubElement(testsuites_node, "testsuite")
-    testsuite_node.set("name", "Testimage")
-    testsuite_node.set("time", "%s" % total_time)
-    testsuite_node.set("tests", "%s" % len(results))
-    testsuite_node.set("failures", "%s" % failures)
-    testsuite_node.set("errors", "%s" % errors)
-    testsuite_node.set("skipped", "%s" % skipped)
-
-    for result_id, result in results.items():
-        if re.search(r'\.test_', result_id):
-            testcase_node = ET.SubElement(testsuite_node, "testcase", {
-                "name": result_id,
-                "classname": "Testimage",
-                "time": str(result['duration'])
-            })
-            if result['status'] == "SKIPPED":
-                ET.SubElement(testcase_node, "skipped", message=result['log'])
-            elif result['status'] == "FAILED":
-                ET.SubElement(testcase_node, "failure", message=result['log'])
-            elif result['status'] == "ERROR":
-                ET.SubElement(testcase_node, "error", message=result['log'])
+    total_errors = total_failures = total_skipped = total_tests = total_time = 0
+
+    for _, run_name, _, results in resultutils.test_run_results(testresults):
+        test_run_testsuite = ET.SubElement(testsuites_node, "testsuite", name=run_name)
+
+        # Handle all image tests but skip all ptests related sections
+        imagetest_testsuite = ET.SubElement(test_run_testsuite, "testsuite", name="Image Tests")
+        image_errors = image_failures = image_skipped = image_tests = image_total_time = 0
+
+        ptest_summarys = {}
+
+        for result_id, result in results.items():
+            if result_id.startswith("ptestresult.sections") or result_id.startswith("ptestresult.rawlogs"):
+                continue
+
+            if result_id.startswith("ptestresult."):
+                ptest_name = result_id.split(".", 3)[1]
+                if ptest_name not in ptest_summarys:
+                    ptest_summarys[ptest_name] = PtestSummary()
+                ptest_summarys[ptest_name].add_status(ptest_name, result["status"])
+            else:
+                image_total_time += int(result["duration"])
+                image_tests += 1
+                status = result["status"]
+                if status == "FAILED":
+                    image_failures += 1
+                elif status == "ERROR":
+                    image_errors += 1
+                elif status == "SKIPPED":
+                    image_skipped += 1
+
+                testcase_dict = {
+                    "name": result_id,
+                    "classname": "testimage",
+                    "time": str(result["duration"]),
+                }
+                create_testcase(
+                    imagetest_testsuite,
+                    testcase_dict,
+                    status,
+                    result.get("log", None))
 
+        imagetest_testsuite.set("errors", str(image_errors))
+        imagetest_testsuite.set("failures", str(image_failures))
+        imagetest_testsuite.set("skipped", str(image_skipped))
+        imagetest_testsuite.set("tests", str(image_tests))
+        imagetest_testsuite.set("time", str(image_total_time))
+
+        # Handle all ptest related sections
+        ptest_errors = ptest_failures = ptest_skipped = ptest_tests = ptest_total_time = 0
+        if "ptestresult.sections" in results:
+            ptest_testsuite = ET.SubElement(test_run_testsuite, "testsuite", name="Package Tests")
+
+            for ptest_name, result in results["ptestresult.sections"].items():
+                testcase_dict = {
+                    "name": ptest_name,
+                    "classname": "ptest",
+                    "time": str(result["duration"]),
+                }
+
+                log = result.get("log")
+                system_out = None
+                if log:
+                    if test_log_dir is not None:
+                        test_log_file = os.path.join(test_log_dir, ptest_name + ".log")
+                        system_out = f"[[ATTACHMENT|{test_log_file}]]"
+                        test_logfiles[test_log_file] = log
+                    else:
+                        system_out = log
+
+                create_testcase(ptest_testsuite,
+                                testcase_dict,
+                                ptest_summarys[ptest_name].status,
+                                ptest_summarys[ptest_name].log_summary,
+                                system_out=system_out)
+
+                ptest_total_time += int(result["duration"])
+                ptest_tests += 1
+                status = ptest_summarys[ptest_name].status
+                if status == "FAILED":
+                    ptest_failures += 1
+                elif status == "ERROR":
+                    ptest_errors += 1
+                elif status == "SKIPPED":
+                    ptest_skipped += 1
+
+            ptest_testsuite.set("errors", str(ptest_errors))
+            ptest_testsuite.set("failures", str(ptest_failures))
+            ptest_testsuite.set("skipped", str(ptest_skipped))
+            ptest_testsuite.set("tests", str(ptest_tests))
+            ptest_testsuite.set("time", str(ptest_total_time))
+
+        total_errors += image_errors + ptest_errors
+        total_failures += image_failures + ptest_failures
+        total_skipped += image_skipped + ptest_skipped
+        total_tests += image_tests + ptest_tests
+        total_time += image_total_time + ptest_total_time
+
+    testsuites_node.set("errors", str(total_errors))
+    testsuites_node.set("failures", str(total_failures))
+    testsuites_node.set("skipped", str(total_skipped))
+    testsuites_node.set("tests", str(total_tests))
+    testsuites_node.set("time", str(total_time))
     tree = ET.ElementTree(testsuites_node)
+    return tree, test_logfiles
 
-    if args.junit_xml_path is None:
-        args.junit_xml_path = os.environ['BUILDDIR'] + '/tmp/log/oeqa/junit.xml'
-    tree.write(args.junit_xml_path, encoding='UTF-8', xml_declaration=True)
 
-    logger.info('Saved JUnit XML report as %s' % args.junit_xml_path)
+def junit(args, logger):
+    if args.junit_xml_path is not None:
+        junit_xml_path = args.junit_xml_path
+    else:
+        junit_xml_path = os.path.join(os.path.dirname(args.json_file), DEFAULT_JUNIT_FILE)
+    logger.debug("Generating JUnit XML report from %s" % args.json_file)
+    testresults = resultutils.load_resultsdata(args.json_file, configmap=resultutils.store_map)
+
+    # dump ptest logs to a file in a subdirectory where the junit.xml is located
+    test_log_dir = None
+    if args.attach_log_files:
+        test_log_dir = "test-logs"
+        junit_dir_abs = os.path.dirname(os.path.abspath(junit_xml_path))
+        test_log_dir_abs = os.path.join(junit_dir_abs, test_log_dir)
+        if not os.path.exists(test_log_dir_abs):
+            os.makedirs(test_log_dir_abs)
+
+    tree, test_logfiles = junit_tree(testresults, test_log_dir)
+
+    for test_logfile, log in test_logfiles.items():
+        with open(os.path.join(junit_dir_abs, test_logfile), "w") as f:
+            f.write(log)
+
+    tree.write(junit_xml_path, encoding="UTF-8", xml_declaration=True)
+    logger.info("Saved JUnit XML report as %s" % junit_xml_path)
+
 
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
-    parser_build = subparsers.add_parser('junit', help='create test report in JUnit XML format',
-                                         description='generate unit test report in JUnit XML format based on the latest test results in the testresults.json.',
-                                         group='analysis')
+    parser_build = subparsers.add_parser("junit",
+        help="create test report in JUnit XML format",
+        description="generate unit test report in JUnit XML format based on the latest test results in the testresults.json.",
+        group="analysis"
+    )
     parser_build.set_defaults(func=junit)
-    parser_build.add_argument('json_file',
-                              help='json file should point to the testresults.json')
-    parser_build.add_argument('-j', '--junit_xml_path',
-                              help='junit xml path allows setting the path of the generated test report. The default location is <build_dir>/tmp/log/oeqa/junit.xml')
+
+    # If BUILDDIR is set, use the default path for the testresults.json and junit.xml
+    # Otherwise require the user to provide the path to the testresults.json
+    help_json_file = "json file should point to the testresults.json"
+    help_junit_xml_path = "junit xml path allows setting the path of the generated test report."
+    try:
+        builddir = os.environ["BUILDDIR"]
+    except KeyError:
+        builddir = None
+    if builddir:
+        log_path = os.path.join(builddir, "tmp", "log", "oeqa")
+        parser_build.add_argument("json_file", nargs="?",
+            default=os.path.join(log_path, "testresults.json"),
+            help=help_json_file + " (default: %(default)s)")
+        parser_build.add_argument("-j", "--junit_xml_path",
+            default=os.path.join(log_path, DEFAULT_JUNIT_FILE),
+            help=help_junit_xml_path + " (default: %(default)s)")
+    else:
+        parser_build.add_argument("json_file", help=help_json_file)
+        parser_build.add_argument("-j", "--junit_xml_path", nargs="?",
+            help=help_junit_xml_path + " (default: junit.xml in the same folder as the testresults.json)")
+
+    parser_build.add_argument("-a", "--attach-log-files", action="store_true", default=False,
+        help="Write the log files to subfolder in the same folder as the junit.xml and reference them in the junit.xml")


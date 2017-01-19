Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 81BEF71B13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934243"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:44 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:32 +0200
Message-Id: <20170119111239.22506-5-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
References: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 04/11] oe-build-perf-test: enable xml reporting
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
X-List-Received-Date: Thu, 19 Jan 2017 11:12:44 -0000

Add --xml command line option to oe-build-perf-test script for producing
a test report in JUnit XML format instead of JSON.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 43 ++++++++++++++++++++++++++++++++++++++++-
 scripts/oe-build-perf-test      |  6 ++++++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 668e822..de0ee40 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -21,10 +21,12 @@ import socket
 import time
 import traceback
 import unittest
+import xml.etree.ElementTree as ET
 from datetime import datetime, timedelta
 from functools import partial
 from multiprocessing import Process
 from multiprocessing import SimpleQueue
+from xml.dom import minidom
 
 import oe.path
 from oeqa.utils.commands import CommandError, runCmd, get_bb_vars
@@ -169,7 +171,6 @@ class BuildPerfTestResult(unittest.TextTestResult):
     def stopTestRun(self):
         """Pre-run hook"""
         self.elapsed_time = datetime.utcnow() - self.start_time
-        self.write_results_json()
 
     def all_results(self):
         result_map = {'SUCCESS': self.successes,
@@ -254,6 +255,46 @@ class BuildPerfTestResult(unittest.TextTestResult):
             json.dump(results, fobj, indent=4, sort_keys=True,
                       cls=ResultsJsonEncoder)
 
+    def write_results_xml(self):
+        """Write test results into a JUnit XML file"""
+        top = ET.Element('testsuites')
+        suite = ET.SubElement(top, 'testsuite')
+        suite.set('name', 'oeqa.buildperf')
+        suite.set('timestamp', self.start_time.isoformat())
+        suite.set('time', str(self.elapsed_time.total_seconds()))
+        suite.set('hostname', self.hostname)
+        suite.set('failures', str(len(self.failures) + len(self.expectedFailures)))
+        suite.set('errors', str(len(self.errors)))
+        suite.set('skipped', str(len(self.skipped)))
+
+        test_cnt = 0
+        for status, (test, reason) in self.all_results():
+            testcase = ET.SubElement(suite, 'testcase')
+            testcase.set('classname', test.__module__ + '.' + test.__class__.__name__)
+            testcase.set('name', test.name)
+            testcase.set('timestamp', test.start_time.isoformat())
+            testcase.set('time', str(test.elapsed_time.total_seconds()))
+            if status in ('ERROR', 'FAILURE', 'EXP_FAILURE'):
+                if status in ('FAILURE', 'EXP_FAILURE'):
+                    result = ET.SubElement(testcase, 'failure')
+                else:
+                    result = ET.SubElement(testcase, 'error')
+                result.set('message', str(test.err[1]))
+                result.set('type', test.err[0].__name__)
+                result.text = reason
+            elif status == 'SKIPPED':
+                result = ET.SubElement(testcase, 'skipped')
+                result.text = reason
+            elif status not in ('SUCCESS', 'UNEXPECTED_SUCCESS'):
+                raise TypeError("BUG: invalid test status '%s'" % status)
+            test_cnt += 1
+        suite.set('tests', str(test_cnt))
+
+        # Use minidom for pretty-printing
+        dom_doc = minidom.parseString(ET.tostring(top, 'utf-8'))
+        with open(os.path.join(self.out_dir, 'results.xml'), 'w') as fobj:
+            dom_doc.writexml(fobj, addindent='  ', newl='\n', encoding='utf-8')
+        return
 
     def git_commit_results(self, repo_path, branch=None, tag=None):
         """Commit results into a Git repository"""
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 638e195..4ec9f14 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -131,6 +131,8 @@ def parse_args(argv):
     parser.add_argument('-o', '--out-dir', default='results-{date}',
                         type=os.path.abspath,
                         help="Output directory for test results")
+    parser.add_argument('-x', '--xml', action='store_true',
+                        help='Enable JUnit xml output')
     parser.add_argument('--log-file',
                         default='{out_dir}/oe-build-perf-test.log',
                         help="Log file of this script")
@@ -194,6 +196,10 @@ def main(argv=None):
     # Restore logger output to stderr
     log.handlers[0].setLevel(log.level)
 
+    if args.xml:
+        result.write_results_xml()
+    else:
+        result.write_results_json()
     if args.globalres_file:
         result.update_globalres_file(args.globalres_file)
     if args.commit_results:
-- 
2.10.2



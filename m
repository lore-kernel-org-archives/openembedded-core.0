Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DD35271B27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934240"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:43 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:31 +0200
Message-Id: <20170119111239.22506-4-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
References: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 03/11] oeqa.buildperf: include error details in json report
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

This will typically mean assert message and exception type plus a
traceback. In case of skipped tests the reason (i.e. skip message) is
included.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 71f3382..668e822 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -139,6 +139,21 @@ class BuildPerfTestResult(unittest.TextTestResult):
         super(BuildPerfTestResult, self).addSuccess(test)
         self.successes.append(test)
 
+    def addError(self, test, err):
+        """Record results from crashed test"""
+        test.err = err
+        super(BuildPerfTestResult, self).addError(test, err)
+
+    def addFailure(self, test, err):
+        """Record results from failed test"""
+        test.err = err
+        super(BuildPerfTestResult, self).addFailure(test, err)
+
+    def addExpectedFailure(self, test, err):
+        """Record results from expectedly failed test"""
+        test.err = err
+        super(BuildPerfTestResult, self).addExpectedFailure(test, err)
+
     def startTest(self, test):
         """Pre-test hook"""
         test.base_dir = self.out_dir
@@ -226,6 +241,13 @@ class BuildPerfTestResult(unittest.TextTestResult):
                                 'cmd_log_file': os.path.relpath(test.cmd_log_file,
                                                                 self.out_dir),
                                 'measurements': test.measurements}
+            if status in ('ERROR', 'FAILURE', 'EXPECTED_FAILURE'):
+                tests[test.name]['message'] = str(test.err[1])
+                tests[test.name]['err_type'] = test.err[0].__name__
+                tests[test.name]['err_output'] = reason
+            elif reason:
+                tests[test.name]['message'] = reason
+
         results['tests'] = tests
 
         with open(os.path.join(self.out_dir, 'results.json'), 'w') as fobj:
@@ -307,6 +329,8 @@ class BuildPerfTestCase(unittest.TestCase):
         self.start_time = None
         self.elapsed_time = None
         self.measurements = []
+        # self.err is supposed to be a tuple from sys.exc_info()
+        self.err = None
         self.bb_vars = get_bb_vars()
         # TODO: remove 'times' and 'sizes' arrays when globalres support is
         # removed
-- 
2.10.2



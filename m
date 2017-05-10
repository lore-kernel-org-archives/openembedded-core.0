Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7C96271B87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:47:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735138"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:47:52 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:10 -0500
Message-Id: <bd6f21545d9f8099cfc0fdb7cfa031c2ab50af67.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 10/17] oeqa/core/threaded: Add OETestResultThreaded{, Internal} classes
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
X-List-Received-Date: Wed, 10 May 2017 19:47:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The OETestResultThreadedInternal extends OETestResult to stores
results by Thread.

The OETestResultThreaded is a simple class that provides the
implementation of interfaces needed by outside like wasSuccesful,
stop, logSummary, logDetails.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/threaded.py | 73 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/threaded.py b/meta/lib/oeqa/core/threaded.py
index 73b7f2f..f216685 100644
--- a/meta/lib/oeqa/core/threaded.py
+++ b/meta/lib/oeqa/core/threaded.py
@@ -7,7 +7,7 @@ import multiprocessing
 from unittest.suite import TestSuite
 
 from oeqa.core.loader import OETestLoader
-from oeqa.core.runner import OEStreamLogger
+from oeqa.core.runner import OEStreamLogger, OETestResult
 
 class OETestLoaderThreaded(OETestLoader):
     def __init__(self, tc, module_paths, modules, tests, modules_required,
@@ -114,3 +114,74 @@ class OEStreamLoggerThreaded(OEStreamLogger):
         for line in self.buffers[tid].split('\n'):
             self.logger.info(line)
         self._lock.release()
+
+class OETestResultThreadedInternal(OETestResult):
+    def _tc_map_results(self):
+        tid = threading.get_ident()
+        
+        # PyUnit generates a result for every test module run, test
+        # if the thread already has an entry to avoid lose the previous
+        # test module results.
+        if not tid in self.tc._results:
+            self.tc._results[tid] = {}
+            self.tc._results[tid]['failures'] = self.failures
+            self.tc._results[tid]['errors'] = self.errors
+            self.tc._results[tid]['skipped'] = self.skipped
+            self.tc._results[tid]['expectedFailures'] = self.expectedFailures
+
+class OETestResultThreaded(object):
+    _results = {}
+    _lock = threading.Lock()
+
+    def __init__(self, tc):
+        self.tc = tc
+
+    def _fill_tc_results(self):
+        tids = list(self.tc._results.keys())
+        fields = ['failures', 'errors', 'skipped', 'expectedFailures']
+
+        for tid in tids:
+            result = self.tc._results[tid]
+            for field in fields:
+                if not field in self.tc._results:
+                    self.tc._results[field] = []
+                self.tc._results[field].extend(result[field])
+
+    def addResult(self, result, run_start_time, run_end_time):
+        tid = threading.get_ident()
+
+        self._lock.acquire()
+        self._results[tid] = {}
+        self._results[tid]['result'] = result
+        self._results[tid]['run_start_time'] = run_start_time 
+        self._results[tid]['run_end_time'] = run_end_time 
+        self._results[tid]['result'] = result
+        self._lock.release()
+
+    def wasSuccessful(self):
+        wasSuccessful = True
+        for tid in self._results.keys():
+            wasSuccessful = wasSuccessful and \
+                    self._results[tid]['result'].wasSuccessful()
+        return wasSuccessful
+
+    def stop(self):
+        for tid in self._results.keys():
+            self._results[tid]['result'].stop()
+
+    def logSummary(self, component, context_msg=''):
+        elapsed_time = (self.tc._run_end_time - self.tc._run_start_time)
+
+        self.tc.logger.info("SUMMARY:")
+        self.tc.logger.info("%s (%s) - Ran %d tests in %.3fs" % (component,
+            context_msg, len(self.tc._registry['cases']), elapsed_time))
+        if self.wasSuccessful():
+            msg = "%s - OK - All required tests passed" % component
+        else:
+            msg = "%s - FAIL - Required tests failed" % component
+        self.tc.logger.info(msg)
+
+    def logDetails(self):
+        tid = list(self._results)[0]
+        result = self._results[tid]['result']
+        result.logDetails()
-- 
2.1.4



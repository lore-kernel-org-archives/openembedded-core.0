Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3833360797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:48:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2016 12:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; d="scan'208";a="872304258"
Received: from dthoumin-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.6.138])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 12:48:44 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:48:21 +0300
Message-Id: <1472500111-12358-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 02/12] oeqa.buildperf: enable json-formatted results
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
X-List-Received-Date: Mon, 29 Aug 2016 19:48:47 -0000

Automatically create a json.formatted file (results.json) in the results
directory that contains results from all tests.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index ed8ff4a..eed0266 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -11,6 +11,7 @@
 #
 """Build performance test base classes and functionality"""
 import glob
+import json
 import logging
 import os
 import re
@@ -80,6 +81,20 @@ def time_cmd(cmd, **kwargs):
     return ret, timedata
 
 
+class ResultsJsonEncoder(json.JSONEncoder):
+    """Extended encoder for build perf test results"""
+    unix_epoch = datetime.utcfromtimestamp(0)
+
+    def default(self, obj):
+        """Encoder for our types"""
+        if isinstance(obj, datetime):
+            # NOTE: we assume that all timestamps are in UTC time
+            return (obj - self.unix_epoch).total_seconds()
+        if isinstance(obj, timedelta):
+            return obj.total_seconds()
+        return json.JSONEncoder.default(self, obj)
+
+
 class BuildPerfTestResult(unittest.TextTestResult):
     """Runner class for executing the individual tests"""
     # List of test cases to run
@@ -143,6 +158,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
     def stopTestRun(self):
         """Pre-run hook"""
         self.elapsed_time = datetime.utcnow() - self.start_time
+        self.write_results_json()
 
     def all_results(self):
         result_map = {'SUCCESS': self.successes,
@@ -190,6 +206,30 @@ class BuildPerfTestResult(unittest.TextTestResult):
                                              git_tag_rev))
             fobj.write(','.join(values) + '\n')
 
+    def write_results_json(self):
+        """Write test results into a json-formatted file"""
+        results = {'tester_host': self.hostname,
+                   'git_branch': self.git_branch,
+                   'git_commit': self.git_commit,
+                   'git_commit_count': self.git_commit_count,
+                   'product': self.product,
+                   'start_time': self.start_time,
+                   'elapsed_time': self.elapsed_time}
+
+        tests = {}
+        for status, (test, reason) in self.all_results():
+            tests[test.name] = {'name': test.name,
+                                'description': test.shortDescription(),
+                                'status': status,
+                                'start_time': test.start_time,
+                                'elapsed_time': test.elapsed_time,
+                                'measurements': test.measurements}
+        results['tests'] = tests
+
+        with open(os.path.join(self.out_dir, 'results.json'), 'w') as fobj:
+            json.dump(results, fobj, indent=4, sort_keys=True,
+                      cls=ResultsJsonEncoder)
+
 
     def git_commit_results(self, repo_path, branch=None, tag=None):
         """Commit results into a Git repository"""
-- 
2.6.6



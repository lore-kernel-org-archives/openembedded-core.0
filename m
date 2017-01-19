Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 79CC371B27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934262"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:47 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:35 +0200
Message-Id: <20170119111239.22506-8-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
References: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 07/11] oeqa.buildperf: report results in chronological order
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
X-List-Received-Date: Thu, 19 Jan 2017 11:12:47 -0000

Write results in the report file in chronological order, instead of
random order dependent on test statuses.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index b82476c..92f3e45 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -173,18 +173,13 @@ class BuildPerfTestResult(unittest.TextTestResult):
         self.elapsed_time = datetime.utcnow() - self.start_time
 
     def all_results(self):
-        result_map = {'SUCCESS': self.successes,
-                      'FAILURE': self.failures,
-                      'ERROR': self.errors,
-                      'EXPECTED_FAILURE': self.expectedFailures,
-                      'UNEXPECTED_SUCCESS': self.unexpectedSuccesses,
-                      'SKIPPED': self.skipped}
-        for status, tests in result_map.items():
-            for test in tests:
-                if isinstance(test, tuple):
-                    yield (status, test)
-                else:
-                    yield (status, (test, None))
+        compound = [('SUCCESS', t, None) for t in self.successes] + \
+                   [('FAILURE', t, m) for t, m in self.failures] + \
+                   [('ERROR', t, m) for t, m in self.errors] + \
+                   [('EXPECTED_FAILURE', t, m) for t, m in self.expectedFailures] + \
+                   [('UNEXPECTED_SUCCESS', t, None) for t in self.unexpectedSuccesses] + \
+                   [('SKIPPED', t, m) for t, m in self.skipped]
+        return sorted(compound, key=lambda info: info[1].start_time)
 
 
     def update_globalres_file(self, filename):
@@ -205,7 +200,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
             git_tag_rev = self.git_commit
 
         values = ['0'] * 12
-        for status, (test, msg) in self.all_results():
+        for status, test, _ in self.all_results():
             if status in ['ERROR', 'SKIPPED']:
                 continue
             (t_ind, t_len), (s_ind, s_len) = gr_map[test.name]
@@ -233,7 +228,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
                    'elapsed_time': self.elapsed_time}
 
         tests = {}
-        for status, (test, reason) in self.all_results():
+        for status, test, reason in self.all_results():
             tests[test.name] = {'name': test.name,
                                 'description': test.shortDescription(),
                                 'status': status,
@@ -268,7 +263,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
         suite.set('skipped', str(len(self.skipped)))
 
         test_cnt = 0
-        for status, (test, reason) in self.all_results():
+        for status, test, reason in self.all_results():
             test_cnt += 1
             testcase = ET.SubElement(suite, 'testcase')
             testcase.set('classname', test.__module__ + '.' + test.__class__.__name__)
-- 
2.10.2



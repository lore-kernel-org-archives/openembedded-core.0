Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C54D2731D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410417"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:07 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:30 +0300
Message-Id: <1466764661-24544-18-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 17/28] oeqa.buildperf: add test Test1P3
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:07 -0000

Re-implement "test1_p3" from build-perf-test.sh which measures
'bitbake core-image-sato' with rm_work enabled.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/basic_tests.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/basic_tests.py b/meta/lib/oeqa/buildperf/basic_tests.py
index 80bdb3f..a3c1e82 100644
--- a/meta/lib/oeqa/buildperf/basic_tests.py
+++ b/meta/lib/oeqa/buildperf/basic_tests.py
@@ -10,6 +10,8 @@
 # more details.
 #
 """Basic set of build performance tests"""
+import os
+
 from . import BuildPerfTest, perf_test_case
 
 
@@ -43,3 +45,27 @@ class Test1P2(BuildPerfTest):
         self.sync()
         self.measure_cmd_resources(['bitbake', self.build_target], 'build',
                                    'bitbake ' + self.build_target)
+
+
+@perf_test_case
+class Test1P3(BuildPerfTest):
+    name = "test13"
+    build_target = 'core-image-sato'
+    description = "Build {} with rm_work enabled".format(build_target)
+
+    def _run(self):
+        postfile = os.path.join(self.out_dir, 'postfile.conf')
+        with open(postfile, 'w') as fobj:
+            fobj.write('INHERIT += "rm_work"\n')
+        try:
+            self.rm_tmp()
+            self.rm_sstate()
+            self.rm_cache()
+            self.sync()
+            cmd = ['bitbake', '-R', postfile, self.build_target]
+            self.measure_cmd_resources(cmd, 'build',
+                                       'bitbake' + self.build_target)
+            self.measure_disk_usage(self.bb_vars['TMPDIR'], 'tmpdir', 'tmpdir')
+        finally:
+            os.unlink(postfile)
+        self.save_buildstats()
-- 
2.6.6



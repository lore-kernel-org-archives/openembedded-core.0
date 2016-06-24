Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BDA5473163
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410411"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:05 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:29 +0300
Message-Id: <1466764661-24544-17-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 16/28] oeqa.buildperf: add test Test1P2
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:05 -0000

Re-implement "test1_p2" from build-perf-test.sh which measures
'bitbake virtual/kernel'.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/basic_tests.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/basic_tests.py b/meta/lib/oeqa/buildperf/basic_tests.py
index 95bb8d8..80bdb3f 100644
--- a/meta/lib/oeqa/buildperf/basic_tests.py
+++ b/meta/lib/oeqa/buildperf/basic_tests.py
@@ -29,3 +29,17 @@ class Test1P1(BuildPerfTest):
                                    'bitbake ' + self.build_target)
         self.measure_disk_usage(self.bb_vars['TMPDIR'], 'tmpdir', 'tmpdir')
         self.save_buildstats()
+
+
+@perf_test_case
+class Test1P2(BuildPerfTest):
+    name = "test12"
+    build_target = 'virtual/kernel'
+    description = "Measure bitbake {}".format(build_target)
+
+    def _run(self):
+        self.log_cmd_output("bitbake {} -c cleansstate".format(
+            self.build_target))
+        self.sync()
+        self.measure_cmd_resources(['bitbake', self.build_target], 'build',
+                                   'bitbake ' + self.build_target)
-- 
2.6.6



Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 33566731DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410426"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:09 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:32 +0300
Message-Id: <1466764661-24544-20-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 19/28] oeqa.buildperf: add test Test3
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:09 -0000

Re-implement "test3" from build-perf-test.sh which measures
bitbake parsing time.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/basic_tests.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/basic_tests.py b/meta/lib/oeqa/buildperf/basic_tests.py
index 9012a2d..4ebbb77 100644
--- a/meta/lib/oeqa/buildperf/basic_tests.py
+++ b/meta/lib/oeqa/buildperf/basic_tests.py
@@ -83,3 +83,23 @@ class Test2(BuildPerfTest):
         self.sync()
         cmd = ['bitbake', self.build_target, '-c', 'rootfs']
         self.measure_cmd_resources(cmd, 'do_rootfs', 'bitbake do_rootfs')
+
+
+@perf_test_case
+class Test3(BuildPerfTest):
+    name = "test3"
+    description = "Parsing time metrics (bitbake -p)"
+
+    def _run(self):
+        # Drop all caches and parse
+        self.rm_cache()
+        self.force_rm(os.path.join(self.bb_vars['TMPDIR'], 'cache'))
+        self.measure_cmd_resources(['bitbake', '-p'], 'parse_1',
+                                   'bitbake -p (no caches)')
+        # Drop tmp/cache
+        self.force_rm(os.path.join(self.bb_vars['TMPDIR'], 'cache'))
+        self.measure_cmd_resources(['bitbake', '-p'], 'parse_2',
+                                   'bitbake -p (no tmp/cache)')
+        # Parse with fully cached data
+        self.measure_cmd_resources(['bitbake', '-p'], 'parse_3',
+                                   'bitbake -p (cached)')
-- 
2.6.6



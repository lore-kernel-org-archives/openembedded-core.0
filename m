Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 065E5731D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410434"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:12 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:34 +0300
Message-Id: <1466764661-24544-22-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 21/28] oeqa.buildperf: archive build/conf into test results
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:13 -0000

Have the build/conf directory as part of test results.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 1bfcb71..c0318a1 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -94,6 +94,7 @@ class BuildPerfTestRunner(object):
         self.results['start_time'] = start_time
         self.results['tests'] = {}
 
+        self.archive_build_conf()
         for test_class in self.test_run_queue:
             log.info("Executing test %s: %s", test_class.name,
                      test_class.description)
@@ -112,6 +113,13 @@ class BuildPerfTestRunner(object):
         self.results['elapsed_time'] = datetime.utcnow() - start_time
         return 0
 
+    def archive_build_conf(self):
+        """Archive build/conf to test results"""
+        src_dir = os.path.join(os.environ['BUILDDIR'], 'conf')
+        tgt_dir = os.path.join(self.out_dir, 'build', 'conf')
+        os.makedirs(os.path.dirname(tgt_dir))
+        shutil.copytree(src_dir, tgt_dir)
+
 
 def perf_test_case(obj):
     """Decorator for adding test classes"""
-- 
2.6.6



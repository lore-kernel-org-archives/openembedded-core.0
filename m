Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 45BBD73212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 07:33:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 00:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,580,1464678000"; d="scan'208";a="1020615523"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2016 00:33:17 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 10:33:11 +0300
Message-Id: <1472196791-24336-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472196791-24336-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472196791-24336-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/4] oe-build-perf-test: update globalres and git even if tests failed
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
X-List-Received-Date: Fri, 26 Aug 2016 07:33:16 -0000

Write globalres log file and commit results to Git even if some tests
failed. Now that tests do not depend on each other there should be no
risk of bogus results caused by test failures.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 35a4839..3dab070 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -191,13 +191,13 @@ def main(argv=None):
     # Restore logger output to stderr
     log.handlers[0].setLevel(log.level)
 
+    if args.globalres_file:
+        result.update_globalres_file(args.globalres_file)
+    if args.commit_results:
+        result.git_commit_results(args.commit_results,
+                                  args.commit_results_branch,
+                                  args.commit_results_tag)
     if result.wasSuccessful():
-        if args.globalres_file:
-            result.update_globalres_file(args.globalres_file)
-        if args.commit_results:
-            result.git_commit_results(args.commit_results,
-                                      args.commit_results_branch,
-                                      args.commit_results_tag)
         return 0
 
     return 1
-- 
2.6.6



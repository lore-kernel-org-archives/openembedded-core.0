Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E3E976FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 10:06:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2016 03:06:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,271,1473145200"; d="scan'208";a="1047864474"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 30 Sep 2016 03:06:10 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 13:06:07 +0300
Message-Id: <1475229967-12685-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475229967-12685-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475229967-12685-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] build-perf-test-wrapper.sh: accept test case failures
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
X-List-Received-Date: Fri, 30 Sep 2016 10:06:12 -0000

Utilize the new return value (2) from oe-build-perf-test. Do not exit
with an error in case some individual tests fail. Even if some tests
fail we still want to complete successfully, that is, display and
archive the results and do cleanup. The individual tests do not depend
on each other anymore so test failures shouldn't affect the results of
successful tests.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 97e24d8..e03ea97 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -117,15 +117,20 @@ if [ -f "$base_dir/auto.conf.extra" ]; then
 fi
 
 # Run actual test script
-if ! oe-build-perf-test --out-dir "$results_dir" \
-                        --globalres-file "$globalres_log" \
-                        --lock-file "$base_dir/oe-build-perf.lock" \
-                        "${commit_results[@]}" \
-                        --commit-results-branch "{tester_host}/{git_branch}/$machine" \
-                        --commit-results-tag "{tester_host}/{git_branch}/$machine/{git_commit_count}-g{git_commit}/{tag_num}"; then
-    echo "oe-build-perf-test script failed!"
-    exit 1
-fi
+oe-build-perf-test --out-dir "$results_dir" \
+                   --globalres-file "$globalres_log" \
+                   --lock-file "$base_dir/oe-build-perf.lock" \
+                   "${commit_results[@]}" \
+                   --commit-results-branch "{tester_host}/{git_branch}/$machine" \
+                   --commit-results-tag "{tester_host}/{git_branch}/$machine/{git_commit_count}-g{git_commit}/{tag_num}"
+
+case $? in
+    1)  echo "ERROR: oe-build-perf-test script failed!"
+        exit 1
+        ;;
+    2)  echo "NOTE: some tests failed!"
+        ;;
+esac
 
 echo -ne "\n\n-----------------\n"
 echo "Global results file:"
-- 
2.6.6



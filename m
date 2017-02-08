Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC2171D86
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:15:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2017 06:15:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1092332162"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2017 06:15:48 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:15:41 +0200
Message-Id: <20170208141542.13484-6-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
References: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/6] build-perf-test-wrapper.sh: use oe-git-archive
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
X-List-Received-Date: Wed, 08 Feb 2017 14:15:51 -0000

Start to use the new helper script for archiving results data in Git.

[YOCTO #10582]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index a4c1929..7788bb1 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -48,8 +48,7 @@ while getopts "ha:c:C:w:" opt; do
             ;;
         c)  commitish=$OPTARG
             ;;
-        C)  results_repo=`realpath "$OPTARG"`
-            commit_results=("--commit-results" "$results_repo")
+        C)  results_repo=`realpath -s "$OPTARG"`
             ;;
         w)  base_dir=`realpath "$OPTARG"`
             ;;
@@ -130,10 +129,17 @@ fi
 # Run actual test script
 oe-build-perf-test --out-dir "$results_dir" \
                    --globalres-file "$globalres_log" \
-                   --lock-file "$base_dir/oe-build-perf.lock" \
-                   "${commit_results[@]}" \
-                   --commit-results-branch "{tester_host}/{git_branch}/$machine" \
-                   --commit-results-tag "{tester_host}/{git_branch}/$machine/{git_commit_count}-g{git_commit}/{tag_num}"
+                   --lock-file "$base_dir/oe-build-perf.lock"
+
+# Commit results to git
+if [ -n "$results_repo" ]; then
+    echo -e "\nArchiving results in $results_repo"
+    oe-git-archive \
+        --git-dir "$results_repo" \
+        --branch-name "{hostname}/{branch}/{machine}" \
+        --tag-name "{hostname}/{branch}/{machine}/{commit_count}-g{commit}/{tag_number}" \
+        "$results_dir"
+fi
 
 case $? in
     1)  echo "ERROR: oe-build-perf-test script failed!"
-- 
2.10.2



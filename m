Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5291770FE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 13:37:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 02 Sep 2016 06:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,270,1470726000"; d="scan'208";a="756527901"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2016 06:37:26 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2016 16:37:25 +0300
Message-Id: <1472823445-19323-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] build-perf-test-wrapper.sh: fix handling of -C argument
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
X-List-Received-Date: Fri, 02 Sep 2016 13:37:28 -0000

Not specifying -C caused oe-build-perf-test to try to commit results to
the build directory.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index efc2b79..d61e438 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -37,7 +37,6 @@ EOF
 # Parse command line arguments
 archive_dir=~/perf-results/archives
 commitish=""
-results_repo=""
 while getopts "ha:c:C:w:" opt; do
     case $opt in
         h)  usage
@@ -48,6 +47,7 @@ while getopts "ha:c:C:w:" opt; do
         c)  commitish=$OPTARG
             ;;
         C)  results_repo=`realpath "$OPTARG"`
+            commit_results=("--commit-results" "$results_repo")
             ;;
         w)  base_dir=`realpath "$OPTARG"`
             ;;
@@ -110,7 +110,7 @@ fi
 if ! oe-build-perf-test --out-dir "$results_dir" \
                         --globalres-file "$globalres_log" \
                         --lock-file "$base_dir/oe-build-perf.lock" \
-                        --commit-results "$results_repo" \
+                        "${commit_results[@]}" \
                         --commit-results-branch "{tester_host}/{git_branch}/$machine" \
                         --commit-results-tag "{tester_host}/{git_branch}/$machine/{git_commit_count}-g{git_commit}/{tag_num}"; then
     echo "oe-build-perf-test script failed!"
-- 
2.6.6



Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A578E77C85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:58:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 03 Apr 2017 08:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,271,1486454400"; d="scan'208";a="841292462"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2017 08:58:46 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 18:58:38 +0300
Message-Id: <20170403155839.14067-7-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
References: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 6/7] build-perf-test-wrapper.sh: support pushing to remote Git
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
X-List-Received-Date: Mon, 03 Apr 2017 15:58:45 -0000

Implement new '-P' option for spefifying a Git remote where to push
results after committing to a local Git repository.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index e804ac2..c847197 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -32,6 +32,7 @@ Optional arguments:
   -c COMMITISH      test (checkout) this commit, <branch>:<commit> can be
                     specified to test specific commit of certain branch
   -C GIT_REPO       commit results into Git
+  -P GIT_REMOTE     push results to a remote Git repository
   -w WORK_DIR       work dir for this script
                     (default: GIT_TOP_DIR/build-perf-test)
   -x                create xml report (instead of json)
@@ -42,7 +43,8 @@ EOF
 # Parse command line arguments
 commitish=""
 oe_build_perf_test_extra_opts=()
-while getopts "ha:c:C:w:x" opt; do
+oe_git_archive_extra_opts=()
+while getopts "ha:c:C:P:w:x" opt; do
     case $opt in
         h)  usage
             exit 0
@@ -53,6 +55,8 @@ while getopts "ha:c:C:w:x" opt; do
             ;;
         C)  results_repo=`realpath -s "$OPTARG"`
             ;;
+        P)  oe_git_archive_extra_opts+=("--push" "$OPTARG")
+            ;;
         w)  base_dir=`realpath -s "$OPTARG"`
             ;;
         x)  oe_build_perf_test_extra_opts+=("--xml")
@@ -172,6 +176,7 @@ if [ -n "$results_repo" ]; then
         --tag-name "{hostname}/{branch}/{machine}/{commit_count}-g{commit}/{tag_number}" \
         --exclude "buildstats.json" \
         --notes "buildstats/{branch_name}" "$results_dir/buildstats.json" \
+        "${oe_git_archive_extra_opts[@]}" \
         "$results_dir"
 fi
 
-- 
2.10.2



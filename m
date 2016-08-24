Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 13066766E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2016 00:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620679"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:29 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:13:07 +0300
Message-Id: <1472022789-13028-18-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 17/19] build-perf-test-wrapper.sh: allow saving results in Git
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:36 -0000

Add new command line argument '-C' that allows saving results in a Git
repository.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 8eb4fdb..2fb4b11 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -26,19 +26,23 @@ Usage: $script [-h] [-c COMMITISH] [-C GIT_REPO]
 Optional arguments:
   -h                show this help and exit.
   -c COMMITISH      test (checkout) this commit
+  -C GIT_REPO       commit results into Git
 EOF
 }
 
 
 # Parse command line arguments
 commitish=""
-while getopts "hc:" opt; do
+results_repo=""
+while getopts "hc:C:" opt; do
     case $opt in
         h)  usage
             exit 0
             ;;
         c)  commitish=$OPTARG
             ;;
+        C)  results_repo=`realpath "$OPTARG"`
+            ;;
         *)  usage
             exit 1
             ;;
@@ -73,13 +77,14 @@ base_dir="$git_topdir/build-perf-test"
 build_dir="$base_dir/build-$git_rev-$timestamp"
 results_dir="$base_dir/results-$git_rev-$timestamp"
 globalres_log="$base_dir/globalres.log"
+machine="qemux86"
 
 mkdir -p "$base_dir"
 source ./oe-init-build-env $build_dir >/dev/null || exit 1
 
 # Additional config
 auto_conf="$build_dir/conf/auto.conf"
-echo 'MACHINE = "qemux86"' > "$auto_conf"
+echo "MACHINE = \"$machine\"" > "$auto_conf"
 echo 'BB_NUMBER_THREADS = "8"' >> "$auto_conf"
 echo 'PARALLEL_MAKE = "-j 8"' >> "$auto_conf"
 echo "DL_DIR = \"$base_dir/downloads\"" >> "$auto_conf"
@@ -93,7 +98,10 @@ fi
 # Run actual test script
 if ! oe-build-perf-test --out-dir "$results_dir" \
                         --globalres-file "$globalres_log" \
-                        --lock-file "$base_dir/oe-build-perf.lock"; then
+                        --lock-file "$base_dir/oe-build-perf.lock" \
+                        --commit-results "$results_repo" \
+                        --commit-results-branch "{tester_host}/{git_branch}/$machine" \
+                        --commit-results-tag "{tester_host}/{git_branch}/$machine/{git_commit_count}-g{git_commit}/{tag_num}"; then
     echo "oe-build-perf-test script failed!"
     exit 1
 fi
-- 
2.6.6



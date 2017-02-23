Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A04FE73061
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 13:18:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 23 Feb 2017 05:18:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="827620622"
Received: from mburny-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.22.38])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2017 05:18:35 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 15:18:33 +0200
Message-Id: <1487855913-11222-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] build-perf-test-wrapper.sh: support xml report format
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
X-List-Received-Date: Thu, 23 Feb 2017 13:18:34 -0000

Add new command line option '-x' that enbles xml-formatted reports.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index f192fcf..240d669 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -33,13 +33,15 @@ Optional arguments:
   -C GIT_REPO       commit results into Git
   -w WORK_DIR       work dir for this script
                     (default: GIT_TOP_DIR/build-perf-test)
+  -x                create xml report (instead of json)
 EOF
 }
 
 
 # Parse command line arguments
 commitish=""
-while getopts "ha:c:C:w:" opt; do
+oe_build_perf_test_extra_opts=()
+while getopts "ha:c:C:w:x" opt; do
     case $opt in
         h)  usage
             exit 0
@@ -52,6 +54,8 @@ while getopts "ha:c:C:w:" opt; do
             ;;
         w)  base_dir=`realpath -s "$OPTARG"`
             ;;
+        x)  oe_build_perf_test_extra_opts+=("--xml")
+            ;;
         *)  usage
             exit 1
             ;;
@@ -129,6 +133,7 @@ fi
 # Run actual test script
 oe-build-perf-test --out-dir "$results_dir" \
                    --globalres-file "$globalres_log" \
+                   "${oe_build_perf_test_extra_opts[@]}" \
                    --lock-file "$base_dir/oe-build-perf.lock"
 
 # Commit results to git
-- 
2.6.6



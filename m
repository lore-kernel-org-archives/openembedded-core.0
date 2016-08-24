Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 359327687B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2016 00:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620686"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:31 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:13:09 +0300
Message-Id: <1472022789-13028-20-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 19/19] build-perf-test-wrapper.sh: make workdir configurable
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

New command line argument '-w' may be used to specify work dir other
than the default <GIT_DIR>/build-perf-test.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index ef2a46e..efc2b79 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -29,6 +29,7 @@ Optional arguments:
                     disable tarball archiving
   -c COMMITISH      test (checkout) this commit
   -C GIT_REPO       commit results into Git
+  -w WORK_DIR       work dir for this script
 EOF
 }
 
@@ -37,7 +38,7 @@ EOF
 archive_dir=~/perf-results/archives
 commitish=""
 results_repo=""
-while getopts "ha:c:C:" opt; do
+while getopts "ha:c:C:w:" opt; do
     case $opt in
         h)  usage
             exit 0
@@ -48,13 +49,14 @@ while getopts "ha:c:C:" opt; do
             ;;
         C)  results_repo=`realpath "$OPTARG"`
             ;;
+        w)  base_dir=`realpath "$OPTARG"`
+            ;;
         *)  usage
             exit 1
             ;;
     esac
 done
 
-
 echo "Running on `uname -n`"
 if ! git_topdir=$(git rev-parse --show-toplevel); then
         echo "The current working dir doesn't seem to be a git clone. Please cd there before running `basename $0`"
@@ -76,9 +78,13 @@ if [ -n "$commitish" ]; then
 fi
 
 # Setup build environment
+if [ -z "$base_dir" ]; then
+    base_dir="$git_topdir/build-perf-test"
+fi
+echo "Using working dir $base_dir"
+
 timestamp=`date "+%Y%m%d%H%M%S"`
 git_rev=$(git rev-parse --short HEAD)  || exit 1
-base_dir="$git_topdir/build-perf-test"
 build_dir="$base_dir/build-$git_rev-$timestamp"
 results_dir="$base_dir/results-$git_rev-$timestamp"
 globalres_log="$base_dir/globalres.log"
-- 
2.6.6



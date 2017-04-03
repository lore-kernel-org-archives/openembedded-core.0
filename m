Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A26AB77C85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:58:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 03 Apr 2017 08:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,271,1486454400"; d="scan'208";a="841292454"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2017 08:58:45 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 18:58:37 +0300
Message-Id: <20170403155839.14067-6-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
References: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/7] build-perf-test-wrapper.sh: correctly check test script exit status
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
X-List-Received-Date: Mon, 03 Apr 2017 15:58:44 -0000

Test of the exit code was accidentally moved to wrong place when
oe-git-archive was taken into use.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 7b7e4dd..e804ac2 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -155,6 +155,14 @@ oe-build-perf-test --out-dir "$results_dir" \
                    "${oe_build_perf_test_extra_opts[@]}" \
                    --lock-file "$base_dir/oe-build-perf.lock"
 
+case $? in
+    1)  echo "ERROR: oe-build-perf-test script failed!"
+        exit 1
+        ;;
+    2)  echo "NOTE: some tests failed!"
+        ;;
+esac
+
 # Commit results to git
 if [ -n "$results_repo" ]; then
     echo -e "\nArchiving results in $results_repo"
@@ -167,14 +175,6 @@ if [ -n "$results_repo" ]; then
         "$results_dir"
 fi
 
-case $? in
-    1)  echo "ERROR: oe-build-perf-test script failed!"
-        exit 1
-        ;;
-    2)  echo "NOTE: some tests failed!"
-        ;;
-esac
-
 echo -ne "\n\n-----------------\n"
 echo "Global results file:"
 echo -ne "\n"
-- 
2.10.2



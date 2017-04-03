Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8E36F77C85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:58:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 03 Apr 2017 08:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,271,1486454400"; d="scan'208";a="841292449"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2017 08:58:44 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 18:58:36 +0300
Message-Id: <20170403155839.14067-5-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
References: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/7] build-perf-test-wrapper.sh: make it possible to specify Git branch name
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
X-List-Received-Date: Mon, 03 Apr 2017 15:58:43 -0000

Support <branch>:<commit> format for the -c argument. This makes it
possible to test older commits of a certain branch (not just the tip of
it) so that the branch name will still be correctly recorded in the test
report data.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 31 ++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 234652d..7b7e4dd 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -29,7 +29,8 @@ Optional arguments:
   -h                show this help and exit.
   -a ARCHIVE_DIR    archive results tarball here, give an empty string to
                     disable tarball archiving (default: $archive_dir)
-  -c COMMITISH      test (checkout) this commit
+  -c COMMITISH      test (checkout) this commit, <branch>:<commit> can be
+                    specified to test specific commit of certain branch
   -C GIT_REPO       commit results into Git
   -w WORK_DIR       work dir for this script
                     (default: GIT_TOP_DIR/build-perf-test)
@@ -90,15 +91,33 @@ fi
 cd "$git_topdir"
 
 if [ -n "$commitish" ]; then
-    # Checkout correct revision
-    echo "Checking out $commitish"
+    echo "Running git fetch"
     git fetch &> /dev/null
     git checkout HEAD^0 &> /dev/null
-    git branch -D $commitish &> /dev/null
-    if ! git checkout -f $commitish &> /dev/null; then
-        echo "Git checkout failed"
+
+    # Handle <branch>:<commit> format
+    if echo "$commitish" | grep -q ":"; then
+        commit=`echo "$commitish" | cut -d":" -f2`
+        branch=`echo "$commitish" | cut -d":" -f1`
+    else
+        commit="$commitish"
+        branch="$commitish"
+    fi
+
+    echo "Checking out $commitish"
+    git branch -D $branch &> /dev/null
+    if ! git checkout -f $branch &> /dev/null; then
+        echo "ERROR: Git checkout failed"
+        exit 1
+    fi
+
+    # Check that the specified branch really contains the commit
+    commit_hash=`git rev-parse --revs-only $commit --`
+    if [ -z "$commit_hash" -o "`git merge-base $branch $commit`" != "$commit_hash" ]; then
+        echo "ERROR: branch $branch does not contain commit $commit"
         exit 1
     fi
+    git reset --hard $commit > /dev/null
 fi
 
 # Setup build environment
-- 
2.10.2



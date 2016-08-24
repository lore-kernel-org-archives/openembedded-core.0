Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 07636766A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2016 00:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620682"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:30 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:13:08 +0300
Message-Id: <1472022789-13028-19-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 18/19] build-perf-test-wrapper.sh: make archive dir configurable
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:35 -0000

Add new command line argument '-a' that can be used to define the
directory where results (tarballs) are archived. Giving an empty string
disables archiving which makes sense if you store results in Git.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 2fb4b11..ef2a46e 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -25,6 +25,8 @@ Usage: $script [-h] [-c COMMITISH] [-C GIT_REPO]
 
 Optional arguments:
   -h                show this help and exit.
+  -a ARCHIVE_DIR    archive results tarball here, give an empty string to
+                    disable tarball archiving
   -c COMMITISH      test (checkout) this commit
   -C GIT_REPO       commit results into Git
 EOF
@@ -32,13 +34,16 @@ EOF
 
 
 # Parse command line arguments
+archive_dir=~/perf-results/archives
 commitish=""
 results_repo=""
-while getopts "hc:C:" opt; do
+while getopts "ha:c:C:" opt; do
     case $opt in
         h)  usage
             exit 0
             ;;
+        a)  archive_dir=`realpath "$OPTARG"`
+            ;;
         c)  commitish=$OPTARG
             ;;
         C)  results_repo=`realpath "$OPTARG"`
@@ -112,13 +117,14 @@ echo -ne "\n"
 
 cat "$globalres_log"
 
-echo -ne "\n\n-----------------\n"
-echo "Archiving results dir..."
-archive_dir=~/perf-results/archives
-mkdir -p "$archive_dir"
-results_basename=`basename "$results_dir"`
-results_dirname=`dirname "$results_dir"`
-tar -czf "$archive_dir/`uname -n`-${results_basename}.tar.gz" -C "$results_dirname" "$results_basename"
+if [ -n "$archive_dir" ]; then
+    echo -ne "\n\n-----------------\n"
+    echo "Archiving results in $archive_dir"
+    mkdir -p "$archive_dir"
+    results_basename=`basename "$results_dir"`
+    results_dirname=`dirname "$results_dir"`
+    tar -czf "$archive_dir/`uname -n`-${results_basename}.tar.gz" -C "$results_dirname" "$results_basename"
+fi
 
 rm -rf "$build_dir"
 rm -rf "$results_dir"
-- 
2.6.6



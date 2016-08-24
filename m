Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A2C076809
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2016 00:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620674"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:28 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:13:06 +0300
Message-Id: <1472022789-13028-17-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 16/19] build-perf-test-wrapper.sh: parse args with getopts
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

Use getopts for parsing the command line. This changes the usage so that
if a commit (to-be-tested) is defined it must be given by using '-c',
instead of a positional argument.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index e8e8021..8eb4fdb 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -20,17 +20,33 @@
 
 script=`basename $0`
 usage () {
-    echo "Usage: $script [COMMITISH]"
+cat << EOF
+Usage: $script [-h] [-c COMMITISH] [-C GIT_REPO]
+
+Optional arguments:
+  -h                show this help and exit.
+  -c COMMITISH      test (checkout) this commit
+EOF
 }
 
-if [ $# -gt 1 ]; then
-    usage
-    exit 1
-fi
-commitish=$1
 
-echo "Running on `uname -n`"
+# Parse command line arguments
+commitish=""
+while getopts "hc:" opt; do
+    case $opt in
+        h)  usage
+            exit 0
+            ;;
+        c)  commitish=$OPTARG
+            ;;
+        *)  usage
+            exit 1
+            ;;
+    esac
+done
+
 
+echo "Running on `uname -n`"
 if ! git_topdir=$(git rev-parse --show-toplevel); then
         echo "The current working dir doesn't seem to be a git clone. Please cd there before running `basename $0`"
         exit 1
-- 
2.6.6



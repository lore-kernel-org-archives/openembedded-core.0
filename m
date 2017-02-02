Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3326A71CA5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 10:42:13 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2017 02:42:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="220485635"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2017 02:42:13 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 12:42:12 +0200
Message-Id: <20170202104212.5646-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] build-perf-test-wrapper.sh: implement locking
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
X-List-Received-Date: Thu, 02 Feb 2017 10:42:14 -0000

In order to prevent multiple instances of the script running at the same
time.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index e03ea97..a4c1929 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -67,6 +67,17 @@ if [ $# -ne 0 ]; then
     exit 1
 fi
 
+# Open a file descriptor for flock and acquire lock
+LOCK_FILE="/tmp/oe-build-perf-test-wrapper.lock"
+if ! exec 3> "$LOCK_FILE"; then
+    echo "ERROR: Unable to open lock file"
+    exit 1
+fi
+if ! flock -n 3; then
+    echo "ERROR: Another instance of this script is running"
+    exit 1
+fi
+
 echo "Running on `uname -n`"
 if ! git_topdir=$(git rev-parse --show-toplevel); then
         echo "The current working dir doesn't seem to be a git clone. Please cd there before running `basename $0`"
-- 
2.10.2



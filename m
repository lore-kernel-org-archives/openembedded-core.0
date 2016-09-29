Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C9ABF6AC00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 17:10:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 29 Sep 2016 10:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,415,1473145200"; d="scan'208";a="767258842"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Sep 2016 10:10:12 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 20:10:08 +0300
Message-Id: <1475169009-6003-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475169009-6003-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475169009-6003-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] build-perf-test-wrapper.sh: check for positional arguments
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
X-List-Received-Date: Thu, 29 Sep 2016 17:10:13 -0000

Stricter checking of command line arguments. The script doesn't use any
positional arguments so don't accept any and error out if those are
found.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index d61e438..90dd545 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -57,6 +57,14 @@ while getopts "ha:c:C:w:" opt; do
     esac
 done
 
+# Check positional args
+shift "$((OPTIND - 1))"
+if [ $# -ne 0 ]; then
+    echo "ERROR: No positional args are accepted."
+    usage
+    exit 1
+fi
+
 echo "Running on `uname -n`"
 if ! git_topdir=$(git rev-parse --show-toplevel); then
         echo "The current working dir doesn't seem to be a git clone. Please cd there before running `basename $0`"
-- 
2.6.6



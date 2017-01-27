Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7516B77386
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 13:24:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jan 2017 05:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,295,1477983600"; d="scan'208";a="814018401"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jan 2017 05:24:27 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 15:24:25 +0200
Message-Id: <20170127132425.10729-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] build-perf-test-wrapper.sh: fix issues with non-existing path arguments
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
X-List-Received-Date: Fri, 27 Jan 2017 13:24:28 -0000

Without the '-s' option realpath will error out if the given path does
not exist.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index e03ea97..affd242 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -44,14 +44,14 @@ while getopts "ha:c:C:w:" opt; do
         h)  usage
             exit 0
             ;;
-        a)  archive_dir=`realpath "$OPTARG"`
+        a)  archive_dir=`realpath -s "$OPTARG"`
             ;;
         c)  commitish=$OPTARG
             ;;
-        C)  results_repo=`realpath "$OPTARG"`
+        C)  results_repo=`realpath -s "$OPTARG"`
             commit_results=("--commit-results" "$results_repo")
             ;;
-        w)  base_dir=`realpath "$OPTARG"`
+        w)  base_dir=`realpath -s "$OPTARG"`
             ;;
         *)  usage
             exit 1
-- 
2.10.2



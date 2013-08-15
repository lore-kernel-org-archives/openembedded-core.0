Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0B56C6B7AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 17:05:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2013 10:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,886,1367996400"; d="scan'208";a="381478987"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.206])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2013 10:04:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 18:04:37 +0100
Message-Id: <2883c21f067f90bd23085ddff9ae589714e99e8d.1376585082.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] classes/buildhistory: tag last 3 build revisions
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
X-List-Received-Date: Thu, 15 Aug 2013 17:05:26 -0000

This makes it easier to obtain the difference from the last three
builds particularly where a single build might account for more than one
commit in the buildhistory git repository (e.g. if package and image
changes occurred).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 6fb1ba6..e3f9201 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -518,6 +518,10 @@ END
 		# Initialise the repo if necessary
 		if [ ! -d .git ] ; then
 			git init -q
+		else
+			git tag -f build-minus-3 build-minus-2 > /dev/null 2>&1 || true
+			git tag -f build-minus-2 build-minus-1 > /dev/null 2>&1 || true
+			git tag -f build-minus-1 > /dev/null 2>&1 || true
 		fi
 		# Check if there are new/changed files to commit (other than metadata-revs)
 		repostatus=`git status --porcelain | grep -v " metadata-revs$"`
-- 
1.8.1.2



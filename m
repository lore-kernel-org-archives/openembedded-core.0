Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SQIpX-0007pt-E9
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 15:45:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2012 06:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="137013291"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.64])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2012 06:36:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>
Date: Fri,  4 May 2012 14:36:01 +0100
Message-Id: <372b4f451158c03f0d62bf406db1a16a883faa80.1336138307.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1336138307.git.paul.eggleton@linux.intel.com>
References: <cover.1336138307.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1336138307.git.paul.eggleton@linux.intel.com>
References: <cover.1336138307.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] buildhistory: fix multiple commit of images and packages at the same time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 13:45:56 -0000

The echo line here was merging multiple lines into one, and the result
was that if both image and package changes had to be comitted then only
the image changes were being committed and the package changes could
potentially be merged into the next package change. Quoting the variable
reference fixes this.

Fixes [YOCTO #2411]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8d5b096..d2d19ff 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -402,7 +402,7 @@ buildhistory_commit() {
 			git add ${BUILDHISTORY_DIR}/*
 			HOSTNAME=`hostname 2>/dev/null || echo unknown`
 			# porcelain output looks like "?? packages/foo/bar"
-			for entry in `echo $repostatus | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
+			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
 				git commit ${BUILDHISTORY_DIR}/$entry -m "$entry: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 			done
 			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
-- 
1.7.5.4




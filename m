Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RgckA-0008JB-AZ
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 14:43:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Dec 2011 05:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90847958"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.56])
	by azsmga001.ch.intel.com with ESMTP; 30 Dec 2011 05:36:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 13:36:11 +0000
Message-Id: <aa7620cf200df388cc0ffcdf4ce8f04c652a0f89.1325252095.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325252095.git.paul.eggleton@linux.intel.com>
References: <cover.1325252095.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325252095.git.paul.eggleton@linux.intel.com>
References: <cover.1325252095.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] buildhistory: improve git commit robustness
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
X-List-Received-Date: Fri, 30 Dec 2011 13:43:34 -0000

* Check if BUILDHISTORY_DIR exists before doing anything with it, in
  case no tasks that would have created it have executed
* Ensure the git repo in BUILDHISTORY_DIR is initialised with "git init"
  before attempting to do anything with it
* Check if any files have been added or changed before adding and
  committing, to avoid an error from "git commit"

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   21 +++++++++++++++++----
 1 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 39f5ff6..afd0fb5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -339,11 +339,24 @@ def buildhistory_get_layers(d):
 
 
 buildhistory_commit() {
+	if [ ! -d ${BUILDHISTORY_DIR} ] ; then
+		# Code above that creates this dir never executed, so there can't be anything to commit
+		exit
+	fi
+
 	( cd ${BUILDHISTORY_DIR}/
-		git add ${BUILDHISTORY_DIR}/*
-		git commit ${BUILDHISTORY_DIR}/ -m "Build ${BUILDNAME} for machine ${MACHINE} configured for ${DISTRO} ${DISTRO_VERSION}" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
-		if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
-			git push -q ${BUILDHISTORY_PUSH_REPO}
+		# Initialise the repo if necessary
+		if [ ! -d .git ] ; then
+			git init -q
+		fi
+		# Ensure there are new/changed files to commit
+		repostatus=`git status --porcelain`
+		if [ "$repostatus" != "" ] ; then
+			git add ${BUILDHISTORY_DIR}/*
+			git commit ${BUILDHISTORY_DIR}/ -m "Build ${BUILDNAME} for machine ${MACHINE} configured for ${DISTRO} ${DISTRO_VERSION}" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
+				git push -q ${BUILDHISTORY_PUSH_REPO}
+			fi
 		fi) || true
 }
 
-- 
1.7.5.4




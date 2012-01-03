Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrX-0004lf-34
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752294"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:19 -0800
Message-Id: <5271f9696b5c3a4ca9d7a25833b1f1b37023efe9.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 093/113] buildhistory: improve git commit robustness
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:47 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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
index 6a08db4..06d3510 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -342,11 +342,24 @@ def buildhistory_get_layers(d):
 
 
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
1.7.6.4




Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swro2-0002yQ-Nc
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:34:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 02:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129551560"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 02:23:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:23:09 +0100
Message-Id: <415470e5e3e69e2e9287a71c52da27d7cb9e2f84.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 9/9] classes/buildhistory: save metadata revisions
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
X-List-Received-Date: Thu, 02 Aug 2012 09:34:59 -0000

Always write the metadata revisions for each layer into a machine-
readable "metadata-revs" file so that you can potentially link changes
in the output back to changes in the metadata. (Unlike the existing
similar build-id file, this is not specific to image changes.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 76648c9..e121088 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -354,6 +354,15 @@ def buildhistory_get_layers(d):
     layertext = "Configured metadata layers:\n%s\n" % '\n'.join(get_layers_branch_rev(d))
     return layertext
 
+def buildhistory_get_metadata_revs(d):
+    # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
+    layers = (d.getVar("BBLAYERS", True) or "").split()
+    medadata_revs = ["%-17s = %s:%s" % (os.path.basename(i), \
+        base_get_metadata_git_branch(i, None).strip(), \
+        base_get_metadata_git_revision(i, None)) \
+            for i in layers]
+    return '\n'.join(medadata_revs)
+
 
 def squashspaces(string):
     import re
@@ -382,19 +391,25 @@ buildhistory_commit() {
 		return
 	fi
 
+	# Create a machine-readable list of metadata revisions for each layer
+	cat > ${BUILDHISTORY_DIR}/metadata-revs <<END
+${@buildhistory_get_metadata_revs(d)}
+END
+
 	( cd ${BUILDHISTORY_DIR}/
 		# Initialise the repo if necessary
 		if [ ! -d .git ] ; then
 			git init -q
 		fi
-		# Ensure there are new/changed files to commit
-		repostatus=`git status --porcelain`
+		# Check if there are new/changed files to commit (other than metadata-revs)
+		repostatus=`git status --porcelain | grep -v " metadata-revs$"`
 		if [ "$repostatus" != "" ] ; then
-			git add ${BUILDHISTORY_DIR}/*
+			git add .
 			HOSTNAME=`hostname 2>/dev/null || echo unknown`
 			# porcelain output looks like "?? packages/foo/bar"
+			# Ensure we commit metadata-revs with the first commit
 			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
-				git commit ${BUILDHISTORY_DIR}/$entry -m "$entry: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+				git commit $entry metadata-revs -m "$entry: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 			done
 			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 				git push -q ${BUILDHISTORY_PUSH_REPO}
-- 
1.7.9.5




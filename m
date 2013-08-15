Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0952E6B772
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 17:05:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2013 10:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,886,1367996400"; d="scan'208";a="381478981"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.206])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2013 10:04:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 18:04:36 +0100
Message-Id: <46fde666a605cfae71e0b6f62055c5e0d84112c9.1376585082.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] classes/buildhistory: show command line in commit message
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

Record the bitbake command line in the commit message as a further
context indication.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index b2e5cc5..6fb1ba6 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -495,6 +495,14 @@ def buildhistory_get_sdkvars(d):
     return outputvars(sdkvars, listvars, d)
 
 
+def buildhistory_get_cmdline(d):
+    if sys.argv[0].endswith('bin/bitbake'):
+        bincmd = 'bitbake'
+    else:
+        bincmd = sys.argv[0]
+    return '%s %s' % (bincmd, ' '.join(sys.argv[1:]))
+
+
 buildhistory_commit() {
 	if [ ! -d ${BUILDHISTORY_DIR} ] ; then
 		# Code above that creates this dir never executed, so there can't be anything to commit
@@ -514,18 +522,19 @@ END
 		# Check if there are new/changed files to commit (other than metadata-revs)
 		repostatus=`git status --porcelain | grep -v " metadata-revs$"`
 		HOSTNAME=`hostname 2>/dev/null || echo unknown`
+		CMDLINE="${@buildhistory_get_cmdline(d)}"
 		if [ "$repostatus" != "" ] ; then
 			git add -A .
 			# porcelain output looks like "?? packages/foo/bar"
 			# Ensure we commit metadata-revs with the first commit
 			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
-				git commit $entry metadata-revs -m "$entry: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+				git commit $entry metadata-revs -m "$entry: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" -m "cmd: $CMDLINE" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 			done
 			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 				git push -q ${BUILDHISTORY_PUSH_REPO}
 			fi
 		else
-			git commit ${BUILDHISTORY_DIR}/ --allow-empty -m "No changes: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+			git commit ${BUILDHISTORY_DIR}/ --allow-empty -m "No changes: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" -m "cmd: $CMDLINE" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 		fi) || true
 }
 
-- 
1.8.1.2



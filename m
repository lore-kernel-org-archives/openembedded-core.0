Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D6E5377D42
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 01:42:51 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 18:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,277,1493708400"; d="scan'208";a="107755961"
Received: from ysayabal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.134.117])
	by orsmga005.jf.intel.com with ESMTP; 31 May 2017 18:42:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:42:25 +1200
Message-Id: <df1f9e34c047b18d7097ccedbb6fbfb6c3547039.1496281301.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1496281301.git.paul.eggleton@linux.intel.com>
References: <cover.1496281301.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/buildhistory: make a single commit per build
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
X-List-Received-Date: Thu, 01 Jun 2017 01:42:52 -0000

Way back in OE-Core commit fba198ac7efe476a25c5761878ef2fcee97bf9f1 in
2012 we split committing to the repository, making a commit per
top-level directory. However, as we add more information it becomes
harder to see which commits belong to which build. Switch back to a
single commit per build to keep the history tidier.

To address the original concern, if you do want to see just the changes
for a particular subdirectory, git can filter that for you - just
specify that subdirectory as the last parameter on the git show / git
diff command line and that's all you will see.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f543bb7..3e907fc 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -706,10 +706,10 @@ def buildhistory_get_cmdline(d):
 buildhistory_single_commit() {
 	if [ "$3" = "" ] ; then
 		commitopts="${BUILDHISTORY_DIR}/ --allow-empty"
-		item="No changes"
+		shortlogprefix="No changes: "
 	else
-		commitopts="$3 metadata-revs"
-		item="$3"
+		commitopts=""
+		shortlogprefix=""
 	fi
 	if [ "${BUILDHISTORY_BUILD_FAILURES}" = "0" ] ; then
 		result="succeeded"
@@ -726,7 +726,7 @@ buildhistory_single_commit() {
 	esac
 	commitmsgfile=`mktemp`
 	cat > $commitmsgfile << END
-$item: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $2
+${shortlogprefix}Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $2
 
 cmd: $1
 
@@ -770,9 +770,7 @@ END
 			git add -A .
 			# porcelain output looks like "?? packages/foo/bar"
 			# Ensure we commit metadata-revs with the first commit
-			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
-				buildhistory_single_commit "$CMDLINE" "$HOSTNAME" "$entry"
-			done
+			buildhistory_single_commit "$CMDLINE" "$HOSTNAME" dummy
 			git gc --auto --quiet
 		else
 			buildhistory_single_commit "$CMDLINE" "$HOSTNAME"
-- 
2.9.4



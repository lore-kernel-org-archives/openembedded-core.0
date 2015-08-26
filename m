Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 22B8276DD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:17:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 07:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="776041420"
Received: from tlomotow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.45])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 07:17:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 15:17:19 +0100
Message-Id: <30b38191ad9bf2fd422d3a6454fedca67f561554.1440598330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/8] classes/buildhistory: include metadata revisions in commit message
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
X-List-Received-Date: Wed, 26 Aug 2015 14:17:46 -0000

We do already commit these into the repository itself, but have them in
the commit message as well as a reference. As part of this, refactor out
running "git commit" into a separate function so we don't have to
duplicate the code in the two places we call it.

Implements [YOCTO #7966].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 57dc1e9..135d17a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -585,6 +585,27 @@ def buildhistory_get_cmdline(d):
     return '%s %s' % (bincmd, ' '.join(sys.argv[1:]))
 
 
+buildhistory_single_commit() {
+	if [ "$3" = "" ] ; then
+		commitopts="${BUILDHISTORY_DIR}/ --allow-empty"
+		item="No changes"
+	else
+		commitopts="$3 metadata-revs"
+		item="$3"
+	fi
+	commitmsgfile=`mktemp`
+	cat > $commitmsgfile << END
+$item: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $2
+
+cmd: $1
+
+metadata revisions:
+END
+	cat ${BUILDHISTORY_DIR}/metadata-revs >> $commitmsgfile
+	git commit $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+	rm $commitmsgfile
+}
+
 buildhistory_commit() {
 	if [ ! -d ${BUILDHISTORY_DIR} ] ; then
 		# Code above that creates this dir never executed, so there can't be anything to commit
@@ -623,11 +644,11 @@ END
 			# porcelain output looks like "?? packages/foo/bar"
 			# Ensure we commit metadata-revs with the first commit
 			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
-				git commit $entry metadata-revs -m "$entry: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" -m "cmd: $CMDLINE" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+				buildhistory_single_commit "$CMDLINE" "$HOSTNAME" "$entry"
 			done
 			git gc --auto --quiet
 		else
-			git commit ${BUILDHISTORY_DIR}/ --allow-empty -m "No changes: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" -m "cmd: $CMDLINE" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+			buildhistory_single_commit "$CMDLINE" "$HOSTNAME"
 		fi
 		if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 			git push -q ${BUILDHISTORY_PUSH_REPO}
-- 
2.1.0



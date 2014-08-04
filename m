Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id AF8A860DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:56:17 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74IuInI003313 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:56:18 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413561798-622840 ;
	Mon, 4 Aug 2014 13:56:17 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:55:49 -0500
Message-Id: <1407178549-8464-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:56:18 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:56:18 PM,
	Serialize complete at 08/04/2014 01:56:18 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_03:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Subject: [PATCH] create-pull-request: Fix error on 2.0 versions of git
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
X-List-Received-Date: Mon, 04 Aug 2014 18:56:20 -0000

On 2.0 versions of git, the create-pull-request script exits with the
warning "No match for commit... Are you sure you pushed 'HEAD' there?".

This is due to a change in behavior where git used to guess the branch
you meant, but no longer does.  See the thread at
http://www.spinics.net/lists/git/msg233050.html for more information.

To accommodate the new behavior, if the COMMIT_ID is set to the default
of "HEAD", make it point explicitly to $BRANCH instead.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 scripts/create-pull-request | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 503248b..2bf5eb5 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -125,6 +125,10 @@ if [ -z "$BRANCH" ]; then
 	echo "NOTE: Assuming remote branch '$BRANCH', use -b to override."
 fi
 
+if [ "$COMMIT_ID" == "HEAD" ]; then
+	COMMIT_ID="$BRANCH"
+fi
+
 if [ -z "$REMOTE_URL" ]; then
 	echo "ERROR: Missing parameter -u, no git remote!"
 	usage
-- 
2.0.4



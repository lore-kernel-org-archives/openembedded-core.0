Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 325 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Sep 2016 15:50:16 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 163A675E80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 15:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id ED0772E2D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id eaHqSGramFUs
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 640672E3D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F50D1A0AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44E0F1A0B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 38F3F344
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u8FFinXG014682
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:44:49 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u8FFinL6014681
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2016 17:44:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 17:44:47 +0200
Message-Id: <9069cd64902ee56dbc8f32fb4c78ba9cefd8a21c.1473954220.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473954220.git.pkj@axis.com>
References: <cover.1473954220.git.pkj@axis.com>
In-Reply-To: <cover.1473954220.git.pkj@axis.com>
References: <cover.1473954220.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/1] useradd_base.bbclass: Do not mess with the gshadow file in the sysroot
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
X-List-Received-Date: Thu, 15 Sep 2016 15:50:18 -0000

Previously, if the gshadow file did not exist in the sysroot when
perform_groupmems() was run, it would be temporarily created and
removed again afterwards. This was supposedly due to groupmems failing
if it does not exist.

However, based on empirical testing and examination of the source code
for groupmems, it should not fail if the gshadow file does not exist
when groupmems is started. But it WILL fail if the file is removed
sometime after its existence has been check at the beginning of the
execution, but before it needs to be modified. And this is exactly
what the previous code in perform_groupmems() could cause if multiple
tasks simultaneously modified users or groups. It could cause any of
the useradd, groupadd and groupmems commands to fail as long as at
least one other recipe invoked perform_groupmems().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd_base.bbclass | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index f4dc713..ba87edc 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -51,14 +51,6 @@ perform_groupmems () {
 	local groupname=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-g" || $i == "--group") print $(i+1) }'`
 	local username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
 	bbnote "${PN}: Running groupmems command with group $groupname and user $username"
-	# groupmems fails if /etc/gshadow does not exist
-	local gshadow=""
-	if [ -f $rootdir${sysconfdir}/gshadow ]; then
-		gshadow="yes"
-	else
-		gshadow="no"
-		touch $rootdir${sysconfdir}/gshadow
-	fi
 	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
 	if test "x$mem_exists" = "x"; then
 		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmems \$opts\" || true
@@ -69,10 +61,6 @@ perform_groupmems () {
 	else
 		bbnote "${PN}: group $groupname already contains $username, not re-adding it"
 	fi
-	if test "x$gshadow" = "xno"; then
-		rm -f $rootdir${sysconfdir}/gshadow
-		rm -f $rootdir${sysconfdir}/gshadow-
-	fi
 }
 
 perform_groupdel () {
-- 
2.9.0



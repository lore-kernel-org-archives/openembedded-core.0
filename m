Return-Path: <fabrice.coulon@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0467360124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 10:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 160B518075
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:39:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id IAqNNcJMRhZ8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:39:32 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 590FB180A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:39:32 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 427DD140D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:39:32 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 355624AE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:39:32 +0100 (CET)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by thoth.se.axis.com (Postfix) with ESMTP id 32E5D3419D;
	Mon,  7 Dec 2015 11:39:32 +0100 (CET)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id D47EE800576; Mon,  7 Dec 2015 11:39:08 +0100 (CET)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 11:39:04 +0100
Message-Id: <1449484744-7362-1-git-send-email-fabrice.coulon@axis.com>
X-Mailer: git-send-email 1.9.1
Cc: Fabrice Coulon <fabrice@axis.com>
Subject: [PATCH] useradd_base: Make perform_groupmems work with native
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
X-List-Received-Date: Mon, 07 Dec 2015 10:39:37 -0000

I have a problem when using useradd_base.bbclass together with native.
${sysconfdir} is BUILDDIR/tmp/sysroots/x86_64-linux/etc for native,
and ${sysconfdir} is "/etc" for target.

rootdir is BUILDDIR/tmp/sysroots/x86_64-linux for native, so,
$rootdir${sysconfdir} is not correct for native.

The solution for me was to replace instances of $rootdir${sysconfdir}
with $rootdir/etc under perform_groupmems.

Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
---
 meta/classes/useradd_base.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index ab3cd35..0c5ba67 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -76,11 +76,11 @@ perform_groupmems () {
 	bbnote "${PN}: Running groupmems command with group $groupname and user $username"
 	# groupmems fails if /etc/gshadow does not exist
 	local gshadow=""
-	if [ -f $rootdir${sysconfdir}/gshadow ]; then
+	if [ -f $rootdir/etc/gshadow ]; then
 		gshadow="yes"
 	else
 		gshadow="no"
-		touch $rootdir${sysconfdir}/gshadow
+		touch $rootdir/etc/gshadow
 	fi
 	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
 	if test "x$mem_exists" = "x"; then
@@ -96,8 +96,8 @@ perform_groupmems () {
 			count=`expr $count + 1`
 			if test $count = $retries; then
 				if test "x$gshadow" = "xno"; then
-					rm -f $rootdir${sysconfdir}/gshadow
-					rm -f $rootdir${sysconfdir}/gshadow-
+					rm -f $rootdir/etc/gshadow
+					rm -f $rootdir/etc/gshadow-
 				fi
 				bbfatal "${PN}: Tried running groupmems command $retries times without success, giving up"
 			fi
@@ -107,8 +107,8 @@ perform_groupmems () {
 		bbnote "${PN}: group $groupname already contains $username, not re-adding it"
 	fi
 	if test "x$gshadow" = "xno"; then
-		rm -f $rootdir${sysconfdir}/gshadow
-		rm -f $rootdir${sysconfdir}/gshadow-
+		rm -f $rootdir/etc/gshadow
+		rm -f $rootdir/etc/gshadow-
 	fi
 }
 
-- 
1.9.1



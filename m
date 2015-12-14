Return-Path: <fabrice.coulon@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E432E6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 11:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3AF571808D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:13:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 14tHMveNNdtu
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:13:20 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 77CAD1806B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:13:20 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 57FBF1222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:13:20 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 4CC3A633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:13:20 +0100 (CET)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by thoth.se.axis.com (Postfix) with ESMTP id 4A9A334250;
	Mon, 14 Dec 2015 12:13:20 +0100 (CET)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id DC8D780080E; Mon, 14 Dec 2015 12:12:51 +0100 (CET)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 12:12:50 +0100
Message-Id: <1450091570-22992-1-git-send-email-fabrice.coulon@axis.com>
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
X-List-Received-Date: Mon, 14 Dec 2015 11:13:22 -0000

I have a problem when using useradd_base.bbclass together with native.
${sysconfdir} is BUILDDIR/tmp/sysroots/x86_64-linux/etc for native,
and ${sysconfdir} is "/etc" for target.

rootdir is BUILDDIR/tmp/sysroots/x86_64-linux for native, so,
$rootdir${sysconfdir} is not correct for native since it contains
a duplication of the path to the sysroots.

The solution was to replace instances of $rootdir${sysconfdir}
with one variable that is correctly set depending if we inherit from
native or not.

Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
---
 meta/classes/useradd_base.bbclass | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index ab3cd35..30ae1a8 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -74,20 +74,23 @@ perform_groupmems () {
 	local groupname=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-g" || $i == "--group") print $(i+1) }'`
 	local username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
 	bbnote "${PN}: Running groupmems command with group $groupname and user $username"
+
+	local sysroots_sysconfdir="${@'$sysconfdir' if bb.data.inherits_class('native', d) else '$rootdir$sysconfdir'}"
+
 	# groupmems fails if /etc/gshadow does not exist
 	local gshadow=""
-	if [ -f $rootdir${sysconfdir}/gshadow ]; then
+	if [ -f ${sysroots_sysconfdir}/gshadow ]; then
 		gshadow="yes"
 	else
 		gshadow="no"
-		touch $rootdir${sysconfdir}/gshadow
+		touch ${sysroots_sysconfdir}/gshadow
 	fi
-	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
+	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" ${sysroots_sysconfdir}/group || true`"
 	if test "x$mem_exists" = "x"; then
 		local count=0
 		while true; do
 			eval $PSEUDO groupmems $opts || true
-			mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
+			mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" ${sysroots_sysconfdir}/group || true`"
 			if test "x$mem_exists" = "x"; then
 				bbwarn "${PN}: groupmems command did not succeed. Retrying..."
 			else
@@ -96,8 +99,8 @@ perform_groupmems () {
 			count=`expr $count + 1`
 			if test $count = $retries; then
 				if test "x$gshadow" = "xno"; then
-					rm -f $rootdir${sysconfdir}/gshadow
-					rm -f $rootdir${sysconfdir}/gshadow-
+					rm -f ${sysroots_sysconfdir}/gshadow
+					rm -f ${sysroots_sysconfdir}/gshadow-
 				fi
 				bbfatal "${PN}: Tried running groupmems command $retries times without success, giving up"
 			fi
@@ -107,8 +110,8 @@ perform_groupmems () {
 		bbnote "${PN}: group $groupname already contains $username, not re-adding it"
 	fi
 	if test "x$gshadow" = "xno"; then
-		rm -f $rootdir${sysconfdir}/gshadow
-		rm -f $rootdir${sysconfdir}/gshadow-
+		rm -f ${sysroots_sysconfdir}/gshadow
+		rm -f ${sysroots_sysconfdir}/gshadow-
 	fi
 }
 
-- 
1.9.1



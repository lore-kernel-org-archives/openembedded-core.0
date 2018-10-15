Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD297458D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 20:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 81DD01845B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 22:25:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id MCE6PDHCXWpe
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 22:25:44 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id DC60218405
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 22:25:44 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6C031E07D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 22:25:44 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBA781E07C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 22:25:44 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 22:25:44 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id AFA02175A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 22:25:44 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w9FKPkdL020801
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 22:25:46 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w9FKPkLj020800
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2018 22:25:46 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2018 22:25:44 +0200
Message-Id: <20181015202544.20749-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] useradd_base.bbclass: Make perform_groupmems handle overlapping usernames
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
X-List-Received-Date: Mon, 15 Oct 2018 20:25:45 -0000

If the name of the last user being part of the group had a name that
was a prefix of the user being added, then perform_groupmems() would
treat it as if the user already existed in the list of users and not
add it.

Reported-by: Peter Henricsson <peter.henricsson@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd_base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index 551c82c322..0d0bdb80f5 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -51,10 +51,10 @@ perform_groupmems () {
 	local groupname=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-g" || $i == "--group") print $(i+1) }'`
 	local username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
 	bbnote "${PN}: Running groupmems command with group $groupname and user $username"
-	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
+	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*$" $rootdir/etc/group || true`"
 	if test "x$mem_exists" = "x"; then
 		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmems \$opts\" || true
-		mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
+		mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*$" $rootdir/etc/group || true`"
 		if test "x$mem_exists" = "x"; then
 			bbfatal "${PN}: groupmems command did not succeed."
 		fi
-- 
2.12.0



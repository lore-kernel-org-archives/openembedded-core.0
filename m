Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91218763CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:03:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S93ZeZ008999
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:03:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 02:03:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 02:03:32 -0700
Message-ID: <1a1d64f1ac0838c3b391f9d8730c5166063a4a6c.1438074152.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438074152.git.liezhi.yang@windriver.com>
References: <cover.1438074152.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] useradd_base.bbclass: print PN when bbnote/bbwarn/bbfatal
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
X-List-Received-Date: Tue, 28 Jul 2015 09:03:38 -0000
Content-Type: text/plain

Print PN will help debug:
WARNING: openssh: user sshd already exists, not re-creating it

Which is better than:
WARNING: user sshd already exists, not re-creating it

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/useradd_base.bbclass |   58 ++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index 4398a25..7fe83a7 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -14,7 +14,7 @@ perform_groupadd () {
 	local rootdir="$1"
 	local opts="$2"
 	local retries="$3"
-	bbnote "Performing groupadd with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing groupadd with [$opts] and $retries times of retry"
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" = "x"; then
@@ -23,18 +23,18 @@ perform_groupadd () {
 			eval $PSEUDO groupadd $opts || true
 			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 			if test "x$group_exists" = "x"; then
-				bbwarn "groupadd command did not succeed. Retrying..."
+				bbwarn "${PN}: groupadd command did not succeed. Retrying..."
 			else
 				break
 			fi
 			count=`expr $count + 1`
 			if test $count = $retries; then
-				bbfatal "Tried running groupadd command $retries times without success, giving up"
+				bbfatal "${PN}: Tried running groupadd command $retries times without success, giving up"
 			fi
                         sleep $count
 		done
 	else
-		bbwarn "group $groupname already exists, not re-creating it"
+		bbwarn "${PN}: group $groupname already exists, not re-creating it"
 	fi
 }
 
@@ -42,7 +42,7 @@ perform_useradd () {
 	local rootdir="$1"
 	local opts="$2"
 	local retries="$3"
-	bbnote "Performing useradd with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing useradd with [$opts] and $retries times of retry"
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" = "x"; then
@@ -51,18 +51,18 @@ perform_useradd () {
 		       eval $PSEUDO useradd $opts || true
 		       user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 		       if test "x$user_exists" = "x"; then
-			       bbwarn "useradd command did not succeed. Retrying..."
+			       bbwarn "${PN}: useradd command did not succeed. Retrying..."
 		       else
 			       break
 		       fi
 		       count=`expr $count + 1`
 		       if test $count = $retries; then
-				bbfatal "Tried running useradd command $retries times without success, giving up"
+				bbfatal "${PN}: Tried running useradd command $retries times without success, giving up"
 		       fi
 		       sleep $count
 	       done
 	else
-		bbwarn "user $username already exists, not re-creating it"
+		bbwarn "${PN}: user $username already exists, not re-creating it"
 	fi
 }
 
@@ -70,10 +70,10 @@ perform_groupmems () {
 	local rootdir="$1"
 	local opts="$2"
 	local retries="$3"
-	bbnote "Performing groupmems with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing groupmems with [$opts] and $retries times of retry"
 	local groupname=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-g" || $i == "--group") print $(i+1) }'`
 	local username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
-	bbnote "Running groupmems command with group $groupname and user $username"
+	bbnote "${PN}: Running groupmems command with group $groupname and user $username"
 	# groupmems fails if /etc/gshadow does not exist
 	local gshadow=""
 	if [ -f $rootdir${sysconfdir}/gshadow ]; then
@@ -89,7 +89,7 @@ perform_groupmems () {
 			eval $PSEUDO groupmems $opts || true
 			mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
 			if test "x$mem_exists" = "x"; then
-				bbwarn "groupmems command did not succeed. Retrying..."
+				bbwarn "${PN}: groupmems command did not succeed. Retrying..."
 			else
 				break
 			fi
@@ -99,12 +99,12 @@ perform_groupmems () {
 					rm -f $rootdir${sysconfdir}/gshadow
 					rm -f $rootdir${sysconfdir}/gshadow-
 				fi
-				bbfatal "Tried running groupmems command $retries times without success, giving up"
+				bbfatal "${PN}: Tried running groupmems command $retries times without success, giving up"
 			fi
 			sleep $count
 		done
 	else
-		bbwarn "group $groupname already contains $username, not re-adding it"
+		bbwarn "${PN}: group $groupname already contains $username, not re-adding it"
 	fi
 	if test "x$gshadow" = "xno"; then
 		rm -f $rootdir${sysconfdir}/gshadow
@@ -116,7 +116,7 @@ perform_groupdel () {
 	local rootdir="$1"
 	local opts="$2"
 	local retries="$3"
-	bbnote "Performing groupdel with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing groupdel with [$opts] and $retries times of retry"
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" != "x"; then
@@ -125,18 +125,18 @@ perform_groupdel () {
 			eval $PSEUDO groupdel $opts || true
 			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 			if test "x$group_exists" != "x"; then
-				bbwarn "groupdel command did not succeed. Retrying..."
+				bbwarn "${PN}: groupdel command did not succeed. Retrying..."
 			else
 				break
 			fi
 			count=`expr $count + 1`
 			if test $count = $retries; then
-				bbfatal "Tried running groupdel command $retries times without success, giving up"
+				bbfatal "${PN}: Tried running groupdel command $retries times without success, giving up"
 			fi
 			sleep $count
 		done
 	else
-		bbwarn "group $groupname doesn't exist, not removing it"
+		bbwarn "${PN}: group $groupname doesn't exist, not removing it"
 	fi
 }
 
@@ -144,7 +144,7 @@ perform_userdel () {
 	local rootdir="$1"
 	local opts="$2"
 	local retries="$3"
-	bbnote "Performing userdel with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing userdel with [$opts] and $retries times of retry"
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" != "x"; then
@@ -153,18 +153,18 @@ perform_userdel () {
 		       eval $PSEUDO userdel $opts || true
 		       user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 		       if test "x$user_exists" != "x"; then
-			       bbwarn "userdel command did not succeed. Retrying..."
+			       bbwarn "${PN}: userdel command did not succeed. Retrying..."
 		       else
 			       break
 		       fi
 		       count=`expr $count + 1`
 		       if test $count = $retries; then
-				bbfatal "Tried running userdel command $retries times without success, giving up"
+				bbfatal "${PN}: Tried running userdel command $retries times without success, giving up"
 		       fi
 		       sleep $count
 	       done
 	else
-		bbwarn "user $username doesn't exist, not removing it"
+		bbwarn "${PN}: user $username doesn't exist, not removing it"
 	fi
 }
 
@@ -175,7 +175,7 @@ perform_groupmod () {
 	local rootdir="$1"
 	local opts="$2"
 	local retries="$3"
-	bbnote "Performing groupmod with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing groupmod with [$opts] and $retries times of retry"
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" != "x"; then
@@ -183,18 +183,18 @@ perform_groupmod () {
 		while true; do
 			eval $PSEUDO groupmod $opts
 			if test $? != 0; then
-				bbwarn "groupmod command did not succeed. Retrying..."
+				bbwarn "${PN}: groupmod command did not succeed. Retrying..."
 			else
 				break
 			fi
 			count=`expr $count + 1`
 			if test $count = $retries; then
-				bbfatal "Tried running groupmod command $retries times without success, giving up"
+				bbfatal "${PN}: Tried running groupmod command $retries times without success, giving up"
 			fi
 			sleep $count
 		done
 	else
-		bbwarn "group $groupname doesn't exist, unable to modify it"
+		bbwarn "${PN}: group $groupname doesn't exist, unable to modify it"
 	fi
 	set -e
 }
@@ -205,7 +205,7 @@ perform_usermod () {
 	local rootdir="$1"
 	local opts="$2"
 	local retries="$3"
-	bbnote "Performing usermod with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing usermod with [$opts] and $retries times of retry"
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" != "x"; then
@@ -213,18 +213,18 @@ perform_usermod () {
 	       while true; do
 		       eval $PSEUDO usermod $opts
 		       if test $? != 0; then
-			       bbwarn "usermod command did not succeed. Retrying..."
+			       bbwarn "${PN}: usermod command did not succeed. Retrying..."
 		       else
 			       break
 		       fi
 		       count=`expr $count + 1`
 		       if test $count = $retries; then
-				bbfatal "Tried running usermod command $retries times without success, giving up"
+				bbfatal "${PN}: Tried running usermod command $retries times without success, giving up"
 		       fi
 		       sleep $count
 	       done
 	else
-		bbwarn "user $username doesn't exist, unable to modify it"
+		bbwarn "${PN}: user $username doesn't exist, unable to modify it"
 	fi
 	set -e
 }
-- 
1.7.9.5



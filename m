Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A69AC65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 02:02:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1F228ob004429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Feb 2016 18:02:08 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 14 Feb 2016 18:02:07 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Mon, 15 Feb 2016 09:59:28 +0800
Message-ID: <eea9c9c9b686194c87e06b478b4e3a8e3447d358.1455501148.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1455501148.git.kai.kang@windriver.com>
References: <cover.1455501148.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Mon, 15 Feb 2016 02:02:10 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When perform useradd during populate sysroot, it locks files passwd.lock
and group.lock at same time. And then it meets a dead lock issue.

Use flock to reslove it by using an universal lock file for all the
user and group related operations. The lock file is put in image dir
/tmp. /tmp will be mounted as a tmpfs, so the lock file will not be
visible when boot the target.

[YOCTO #9022]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/useradd.bbclass      |   8 +-
 meta/classes/useradd_base.bbclass | 165 ++++++++++----------------------------
 2 files changed, 48 insertions(+), 125 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index c960656..db74123 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -48,6 +48,8 @@ if test "x$UA_SYSROOT" = "x"; then
 	GROUPMEMS_PARAM="${GROUPMEMS_PARAM}"
 fi
 
+mkdir -p $SYSROOT/tmp
+
 # Perform group additions first, since user additions may depend
 # on these groups existing
 if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
@@ -57,7 +59,7 @@ if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
 	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1`
 	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
 	while test "x$opts" != "x"; do
-		perform_groupadd "$SYSROOT" "$OPT $opts" 10
+		perform_groupadd "$SYSROOT" "$OPT $opts"
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
@@ -73,7 +75,7 @@ if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" != "x"; then
 	opts=`echo "$USERADD_PARAM" | cut -d ';' -f 1`
 	remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2-`
 	while test "x$opts" != "x"; do
-		perform_useradd "$SYSROOT" "$OPT $opts" 10
+		perform_useradd "$SYSROOT" "$OPT $opts"
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
@@ -89,7 +91,7 @@ if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`" != "x"; then
 	opts=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1`
 	remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2-`
 	while test "x$opts" != "x"; do
-		perform_groupmems "$SYSROOT" "$OPT $opts" 10
+		perform_groupmems "$SYSROOT" "$OPT $opts"
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index ab3cd35..a5baceb 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -4,7 +4,7 @@
 
 # The following functions basically have similar logic.
 # *) Perform necessary checks before invoking the actual command
-# *) Invoke the actual command, make retries if necessary
+# *) Invoke the actual command with flock
 # *) Error out if an error occurs.
 
 # Note that before invoking these functions, make sure the global variable
@@ -13,26 +13,16 @@
 perform_groupadd () {
 	local rootdir="$1"
 	local opts="$2"
-	local retries="$3"
-	bbnote "${PN}: Performing groupadd with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing groupadd with [$opts]"
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" = "x"; then
-		local count=0
-		while true; do
-			eval $PSEUDO groupadd $opts || true
-			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
-			if test "x$group_exists" = "x"; then
-				bbwarn "${PN}: groupadd command did not succeed. Retrying..."
-			else
-				break
-			fi
-			count=`expr $count + 1`
-			if test $count = $retries; then
-				bbfatal "${PN}: Tried running groupadd command $retries times without success, giving up"
-			fi
-                        sleep $count
-		done
+		opts=`echo $opts | sed s/\'/\"/g`
+		eval flock -x -w 100 $rootdir/tmp/user-and-group-ops.flock -c \'$PSEUDO groupadd $opts\' || true
+		group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
+		if test "x$group_exists" = "x"; then
+			bbfatal "${PN}: groupadd command did not succeed."
+		fi
 	else
 		bbnote "${PN}: group $groupname already exists, not re-creating it"
 	fi
@@ -41,26 +31,16 @@ perform_groupadd () {
 perform_useradd () {
 	local rootdir="$1"
 	local opts="$2"
-	local retries="$3"
-	bbnote "${PN}: Performing useradd with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing useradd with [$opts]"
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" = "x"; then
-	       local count=0
-	       while true; do
-		       eval $PSEUDO useradd $opts || true
-		       user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
-		       if test "x$user_exists" = "x"; then
-			       bbwarn "${PN}: useradd command did not succeed. Retrying..."
-		       else
-			       break
-		       fi
-		       count=`expr $count + 1`
-		       if test $count = $retries; then
-				bbfatal "${PN}: Tried running useradd command $retries times without success, giving up"
-		       fi
-		       sleep $count
-	       done
+		opts=`echo $opts | sed s/\'/\"/g`
+		eval flock -x -w 100 $rootdir/tmp/user-and-group-ops.flock -c  \'$PSEUDO useradd $opts\' || true
+		user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
+		if test "x$user_exists" = "x"; then
+			bbfatal "${PN}: useradd command did not succeed."
+		fi
 	else
 		bbnote "${PN}: user $username already exists, not re-creating it"
 	fi
@@ -69,8 +49,7 @@ perform_useradd () {
 perform_groupmems () {
 	local rootdir="$1"
 	local opts="$2"
-	local retries="$3"
-	bbnote "${PN}: Performing groupmems with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing groupmems with [$opts]"
 	local groupname=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-g" || $i == "--group") print $(i+1) }'`
 	local username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
 	bbnote "${PN}: Running groupmems command with group $groupname and user $username"
@@ -84,25 +63,11 @@ perform_groupmems () {
 	fi
 	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
 	if test "x$mem_exists" = "x"; then
-		local count=0
-		while true; do
-			eval $PSEUDO groupmems $opts || true
-			mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
-			if test "x$mem_exists" = "x"; then
-				bbwarn "${PN}: groupmems command did not succeed. Retrying..."
-			else
-				break
-			fi
-			count=`expr $count + 1`
-			if test $count = $retries; then
-				if test "x$gshadow" = "xno"; then
-					rm -f $rootdir${sysconfdir}/gshadow
-					rm -f $rootdir${sysconfdir}/gshadow-
-				fi
-				bbfatal "${PN}: Tried running groupmems command $retries times without success, giving up"
-			fi
-			sleep $count
-		done
+		eval flock -x -w 100 $rootdir/tmp/user-and-group-ops.flock -c \'$PSEUDO groupmems $opts\' || true
+		mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
+		if test "x$mem_exists" = "x"; then
+			bbfatal "${PN}: groupmems command did not succeed."
+		fi
 	else
 		bbnote "${PN}: group $groupname already contains $username, not re-adding it"
 	fi
@@ -115,26 +80,15 @@ perform_groupmems () {
 perform_groupdel () {
 	local rootdir="$1"
 	local opts="$2"
-	local retries="$3"
-	bbnote "${PN}: Performing groupdel with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing groupdel with [$opts]"
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" != "x"; then
-		local count=0
-		while true; do
-			eval $PSEUDO groupdel $opts || true
-			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
-			if test "x$group_exists" != "x"; then
-				bbwarn "${PN}: groupdel command did not succeed. Retrying..."
-			else
-				break
-			fi
-			count=`expr $count + 1`
-			if test $count = $retries; then
-				bbfatal "${PN}: Tried running groupdel command $retries times without success, giving up"
-			fi
-			sleep $count
-		done
+		eval flock -x -w 100 $rootdir/tmp/user-and-group-ops.flock -c \'$PSEUDO groupdel $opts\' || true
+		group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
+		if test "x$group_exists" != "x"; then
+			bbfatal "${PN}: groupdel command did not succeed."
+		fi
 	else
 		bbnote "${PN}: group $groupname doesn't exist, not removing it"
 	fi
@@ -143,26 +97,15 @@ perform_groupdel () {
 perform_userdel () {
 	local rootdir="$1"
 	local opts="$2"
-	local retries="$3"
-	bbnote "${PN}: Performing userdel with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing userdel with [$opts]"
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" != "x"; then
-	       local count=0
-	       while true; do
-		       eval $PSEUDO userdel $opts || true
-		       user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
-		       if test "x$user_exists" != "x"; then
-			       bbwarn "${PN}: userdel command did not succeed. Retrying..."
-		       else
-			       break
-		       fi
-		       count=`expr $count + 1`
-		       if test $count = $retries; then
-				bbfatal "${PN}: Tried running userdel command $retries times without success, giving up"
-		       fi
-		       sleep $count
-	       done
+		eval flock -x -w 100 $rootdir/tmp/user-and-group-ops.flock -c \'$PSEUDO userdel $opts\' || true
+		user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
+		if test "x$user_exists" != "x"; then
+			bbfatal "${PN}: userdel command did not succeed."
+		fi
 	else
 		bbnote "${PN}: user $username doesn't exist, not removing it"
 	fi
@@ -174,25 +117,14 @@ perform_groupmod () {
 	set +e
 	local rootdir="$1"
 	local opts="$2"
-	local retries="$3"
-	bbnote "${PN}: Performing groupmod with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing groupmod with [$opts]"
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" != "x"; then
-		local count=0
-		while true; do
-			eval $PSEUDO groupmod $opts
-			if test $? != 0; then
-				bbwarn "${PN}: groupmod command did not succeed. Retrying..."
-			else
-				break
-			fi
-			count=`expr $count + 1`
-			if test $count = $retries; then
-				bbfatal "${PN}: Tried running groupmod command $retries times without success, giving up"
-			fi
-			sleep $count
-		done
+		eval flock -x -w 100 $rootdir/tmp/user-and-group-ops.flock -c \'$PSEUDO groupmod $opts\'
+		if test $? != 0; then
+			bbwarn "${PN}: groupmod command did not succeed."
+		fi
 	else
 		bbwarn "${PN}: group $groupname doesn't exist, unable to modify it"
 	fi
@@ -204,25 +136,14 @@ perform_usermod () {
 	set +e
 	local rootdir="$1"
 	local opts="$2"
-	local retries="$3"
-	bbnote "${PN}: Performing usermod with [$opts] and $retries times of retry"
+	bbnote "${PN}: Performing usermod with [$opts]"
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" != "x"; then
-	       local count=0
-	       while true; do
-		       eval $PSEUDO usermod $opts
-		       if test $? != 0; then
-			       bbwarn "${PN}: usermod command did not succeed. Retrying..."
-		       else
-			       break
-		       fi
-		       count=`expr $count + 1`
-		       if test $count = $retries; then
-				bbfatal "${PN}: Tried running usermod command $retries times without success, giving up"
-		       fi
-		       sleep $count
-	       done
+		eval flock -x -w 100 $rootdir/tmp/user-and-group-ops.flock -c \'$PSEUDO usermod $opts\'
+		if test $? != 0; then
+			bbfatal "${PN}: usermod command did not succeed."
+		fi
 	else
 		bbwarn "${PN}: user $username doesn't exist, unable to modify it"
 	fi
-- 
2.6.1



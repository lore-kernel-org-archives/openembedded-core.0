Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 898B16FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 06:30:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3C6UpoI003324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Apr 2016 23:30:52 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 11 Apr 2016 23:30:51 -0700
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 12 Apr 2016 14:24:03 +0800
Message-ID: <6c2e01c25b0b1bff2405c63ccc1b0e1938a9096a.1460442074.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1460442074.git.kai.kang@windriver.com>
References: <cover.1460442074.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: gary@mlbassoc.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] useradd_base.bbclass: remove flock option '-w'
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
X-List-Received-Date: Tue, 12 Apr 2016 06:30:54 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Option '-w 100' of flock is failsafe to finish if dead lock occurs. It
should be impossible to occur dead lock. And option '-w' is not
supported by busybox, so remove it.

[YOCTO #9371]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/useradd_base.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index e7081d9..0d81acc 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -18,7 +18,7 @@ perform_groupadd () {
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" = "x"; then
 		opts=`echo $opts | sed s/\'/\"/g`
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO groupadd \$opts\" || true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupadd \$opts\" || true
 		group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 		if test "x$group_exists" = "x"; then
 			bbfatal "${PN}: groupadd command did not succeed."
@@ -36,7 +36,7 @@ perform_useradd () {
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" = "x"; then
 		opts=`echo $opts | sed s/\'/\"/g`
-		eval flock -x -w 100 $rootdir${sysconfdir} -c  \"$PSEUDO useradd \$opts\" || true
+		eval flock -x $rootdir${sysconfdir} -c  \"$PSEUDO useradd \$opts\" || true
 		user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 		if test "x$user_exists" = "x"; then
 			bbfatal "${PN}: useradd command did not succeed."
@@ -63,7 +63,7 @@ perform_groupmems () {
 	fi
 	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
 	if test "x$mem_exists" = "x"; then
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO groupmems \$opts\" || true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmems \$opts\" || true
 		mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
 		if test "x$mem_exists" = "x"; then
 			bbfatal "${PN}: groupmems command did not succeed."
@@ -84,7 +84,7 @@ perform_groupdel () {
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" != "x"; then
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO groupdel \$opts\" || true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupdel \$opts\" || true
 		group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 		if test "x$group_exists" != "x"; then
 			bbfatal "${PN}: groupdel command did not succeed."
@@ -101,7 +101,7 @@ perform_userdel () {
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" != "x"; then
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO userdel \$opts\" || true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO userdel \$opts\" || true
 		user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 		if test "x$user_exists" != "x"; then
 			bbfatal "${PN}: userdel command did not succeed."
@@ -121,7 +121,7 @@ perform_groupmod () {
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" != "x"; then
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO groupmod \$opts\"
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmod \$opts\"
 		if test $? != 0; then
 			bbwarn "${PN}: groupmod command did not succeed."
 		fi
@@ -140,7 +140,7 @@ perform_usermod () {
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" != "x"; then
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO usermod \$opts\"
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO usermod \$opts\"
 		if test $? != 0; then
 			bbfatal "${PN}: usermod command did not succeed."
 		fi
-- 
2.6.1



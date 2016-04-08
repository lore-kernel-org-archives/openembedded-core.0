Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C28F770DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 21:46:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u38LkVqa000379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Apr 2016 14:46:31 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Apr 2016 14:46:29 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Apr 2016 17:46:27 -0400
Message-ID: <1460151987-17663-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1460151987-17663-1-git-send-email-mark.asselstine@windriver.com>
References: <1460151987-17663-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] useradd_base.bbclass: prevent variable expansion in $opts
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
X-List-Received-Date: Fri, 08 Apr 2016 21:46:50 -0000
Content-Type: text/plain

Many user/group operations will involve hashes which will include '$'
followed by a number or even possibly an env. variable name. Passing
$opts to flock requires that we take additional precautions to prevent
the unexpected expansion of these instances.

This was found by an image which used usermod operations to set the
password hash for root. The image could not be logged-in to and
examining /etc/shadow clearly showed that $0 and other $* variables
had been expanded unexpectedly. This change returnes the behavior to
what existed prior to commit 2ebf697b46c42cee8bfa6d2e6087397f8cce385c
[useradd_base.bbclass: replace retry logic with flock].

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/classes/useradd_base.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index 9b8f5c2..e7081d9 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -18,7 +18,7 @@ perform_groupadd () {
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" = "x"; then
 		opts=`echo $opts | sed s/\'/\"/g`
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO groupadd $opts\' || true
+		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO groupadd \$opts\" || true
 		group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 		if test "x$group_exists" = "x"; then
 			bbfatal "${PN}: groupadd command did not succeed."
@@ -36,7 +36,7 @@ perform_useradd () {
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" = "x"; then
 		opts=`echo $opts | sed s/\'/\"/g`
-		eval flock -x -w 100 $rootdir${sysconfdir} -c  \'$PSEUDO useradd $opts\' || true
+		eval flock -x -w 100 $rootdir${sysconfdir} -c  \"$PSEUDO useradd \$opts\" || true
 		user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 		if test "x$user_exists" = "x"; then
 			bbfatal "${PN}: useradd command did not succeed."
@@ -63,7 +63,7 @@ perform_groupmems () {
 	fi
 	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
 	if test "x$mem_exists" = "x"; then
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO groupmems $opts\' || true
+		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO groupmems \$opts\" || true
 		mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
 		if test "x$mem_exists" = "x"; then
 			bbfatal "${PN}: groupmems command did not succeed."
@@ -84,7 +84,7 @@ perform_groupdel () {
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" != "x"; then
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO groupdel $opts\' || true
+		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO groupdel \$opts\" || true
 		group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 		if test "x$group_exists" != "x"; then
 			bbfatal "${PN}: groupdel command did not succeed."
@@ -101,7 +101,7 @@ perform_userdel () {
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" != "x"; then
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO userdel $opts\' || true
+		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO userdel \$opts\" || true
 		user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 		if test "x$user_exists" != "x"; then
 			bbfatal "${PN}: userdel command did not succeed."
@@ -121,7 +121,7 @@ perform_groupmod () {
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" != "x"; then
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO groupmod $opts\'
+		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO groupmod \$opts\"
 		if test $? != 0; then
 			bbwarn "${PN}: groupmod command did not succeed."
 		fi
@@ -140,7 +140,7 @@ perform_usermod () {
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" != "x"; then
-		eval flock -x -w 100 $rootdir${sysconfdir} -c \'$PSEUDO usermod $opts\'
+		eval flock -x -w 100 $rootdir${sysconfdir} -c \"$PSEUDO usermod \$opts\"
 		if test $? != 0; then
 			bbfatal "${PN}: usermod command did not succeed."
 		fi
-- 
2.1.4



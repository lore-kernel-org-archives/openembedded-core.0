Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id BDC2777235
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 18:11:11 +0000 (UTC)
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	v0NIBBIl032481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 12:11:11 -0600
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 23 Jan 2017 12:11:11 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 23 Jan 2017 12:11:10 -0600
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 23 Jan 2017 12:11:10 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jan 2017 20:09:23 +0200
Message-ID: <20170123180923.7658-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-23_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701230239
Cc: ken.sharp@ni.com
Subject: [PATCH] useradd_base: keep group if it still has users
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
X-List-Received-Date: Mon, 23 Jan 2017 18:11:12 -0000
Content-Type: text/plain

perform_groupdel() tries to delete a group irrespective if other
users have it as their primary group, thus the call to groupdel will
fail with the following error error:

groupdel: cannot remove the primary group of user '<user>'

Add a check to perform_groupdel() to determine if there are other
users and keep the group, printing a warning. This is called right
after a user is deleted to delete it's group. If the last user is
deleted, only then the group is also deleted.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/useradd_base.bbclass | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index ba87edc57a..551c82c322 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -69,11 +69,21 @@ perform_groupdel () {
 	bbnote "${PN}: Performing groupdel with [$opts]"
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
+
 	if test "x$group_exists" != "x"; then
-		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupdel \$opts\" || true
-		group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
-		if test "x$group_exists" != "x"; then
-			bbfatal "${PN}: groupdel command did not succeed."
+		local awk_input='BEGIN {FS=":"}; $1=="'$groupname'" { print $3 }'
+		local groupid=`echo "$awk_input" | awk -f- $rootdir/etc/group`
+		local awk_check_users='BEGIN {FS=":"}; $4=="'$groupid'" {print $1}'
+		local other_users=`echo "$awk_check_users" | awk -f- $rootdir/etc/passwd`
+
+		if test "x$other_users" = "x"; then
+			eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupdel \$opts\" || true
+			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
+			if test "x$group_exists" != "x"; then
+				bbfatal "${PN}: groupdel command did not succeed."
+			fi
+		else
+			bbnote "${PN}: '$groupname' is primary group for users '$other_users', not removing it"
 		fi
 	else
 		bbnote "${PN}: group $groupname doesn't exist, not removing it"
-- 
2.11.0



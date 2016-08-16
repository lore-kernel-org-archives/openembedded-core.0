Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C8A497318A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 11:10:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 16 Aug 2016 04:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464678000"; d="scan'208";a="1015178479"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2016 04:10:54 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 4548B6A4080;
	Tue, 16 Aug 2016 04:10:37 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 14:12:03 +0300
Message-Id: <1471345923-15247-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] useradd_base: avoid unintended expansion for useradd parameters
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
X-List-Received-Date: Tue, 16 Aug 2016 11:10:53 -0000

Now, useradd dollar sign requires three prepending backslash characters to
avoid unintended expansion. It used to be just one prepending backslash
character before Krogoth. Restore that behaviour.

[YOCTO #10062]

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/useradd_base.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index 0d81acc..f4dc713 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -17,7 +17,6 @@ perform_groupadd () {
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 	if test "x$group_exists" = "x"; then
-		opts=`echo $opts | sed s/\'/\"/g`
 		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupadd \$opts\" || true
 		group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
 		if test "x$group_exists" = "x"; then
@@ -35,7 +34,6 @@ perform_useradd () {
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" = "x"; then
-		opts=`echo $opts | sed s/\'/\"/g`
 		eval flock -x $rootdir${sysconfdir} -c  \"$PSEUDO useradd \$opts\" || true
 		user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 		if test "x$user_exists" = "x"; then
-- 
2.4.0



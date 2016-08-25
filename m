Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0F71873189
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 09:19:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 25 Aug 2016 02:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,575,1464678000"; d="scan'208";a="160723295"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 25 Aug 2016 02:19:08 -0700
Date: Thu, 25 Aug 2016 12:18:37 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Armin Kuster <akuster808@gmail.com>;,
	openembedded-core@lists.openembedded.org
Message-ID: <20160825091837.GA28541@mbabyjoh-desk.ger.corp.intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [krogoth] [PATCH] useradd_base: avoid unintended expansion for useradd parameters
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
X-List-Received-Date: Thu, 25 Aug 2016 09:19:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

>Date: Tue, 16 Aug 2016 14:12:03 +0300
>From: "Maxin B. John" <maxin.john@intel.com>
>To: openembedded-core@lists.openembedded.org
>CC: Niko Mauno <niko.mauno@vaisala.com>
>Subject: [OE-core] [PATCH] useradd_base: avoid unintended expansion for useradd parameters
>X-Mailer: git-send-email 2.4.0
>
>Now, useradd dollar sign requires three prepending backslash characters to
>avoid unintended expansion. It used to be just one prepending backslash
>character before Krogoth. Restore that behaviour.
>
>[YOCTO #10062]
>
>Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>Signed-off-by: Maxin B. John <maxin.john@intel.com>
>---
> meta/classes/useradd_base.bbclass | 2 --
> 1 file changed, 2 deletions(-)
>
>diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
>index 0d81acc..f4dc713 100644
>--- a/meta/classes/useradd_base.bbclass
>+++ b/meta/classes/useradd_base.bbclass
>@@ -17,7 +17,6 @@ perform_groupadd () {
> 	local groupname=`echo "$opts" | awk '{ print $NF }'`
> 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
> 	if test "x$group_exists" = "x"; then
>-		opts=`echo $opts | sed s/\'/\"/g`
> 		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupadd \$opts\" || true
> 		group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
> 		if test "x$group_exists" = "x"; then
>@@ -35,7 +34,6 @@ perform_useradd () {
> 	local username=`echo "$opts" | awk '{ print $NF }'`
> 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
> 	if test "x$user_exists" = "x"; then
>-		opts=`echo $opts | sed s/\'/\"/g`
> 		eval flock -x $rootdir${sysconfdir} -c  \"$PSEUDO useradd \$opts\" || true
> 		user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
> 		if test "x$user_exists" = "x"; then
>-- 
>2.4.0

This is applicable to krogoth as well. Is it possible to cherry-pick this fix from
master branch ?

Best Regards,
Maxin


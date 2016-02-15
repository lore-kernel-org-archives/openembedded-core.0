Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 939F76011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 11:20:04 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1FBK5rZ003124 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 05:20:05 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021505200573-990694 ;
	Mon, 15 Feb 2016 05:20:05 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 13:19:43 +0200
Message-Id: <1455535183-7985-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/15/2016 05:20:05 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/15/2016 05:20:05 AM,
	Serialize complete at 02/15/2016 05:20:05 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-15_06:, , signatures=0
Subject: [PATCH 1/1] Revert "lsbinitscripts: fix the path for mountpoint"
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
X-List-Received-Date: Mon, 15 Feb 2016 11:20:05 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

This reverts commit e1a3c6e218779e2237c494e58209c06b871c47c4.

util-linux upstream, busybox, and sysvinit all install mountpoint by
default to /bin. Arch Linux, Debian, and Ubuntu (at least) all appear to
install mountpount to /bin. AFAIK only Fedora and possibly other Red Hat
derived distributions install it to /usr/bin.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Reviewed-by: Ken Sharp <ken.sharp@ni.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.64.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
index 150f6f2..7273050 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
@@ -30,5 +30,4 @@ do_compile[noexec] = "1"
 do_install(){
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0644 ${S}/rc.d/init.d/functions ${D}${sysconfdir}/init.d/functions
-	sed -i 's,${base_bindir}/mountpoint,${bindir}/mountpoint,g' ${D}${sysconfdir}/init.d/functions
 }
-- 
2.7.0



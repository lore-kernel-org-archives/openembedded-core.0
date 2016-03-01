Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 89A4D731C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 23:16:19 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u21NGK1U000331 for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Mar 2016 17:16:20 -0600
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016030117162037-900507 ;
	Tue, 1 Mar 2016 17:16:20 -0600 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 1 Mar 2016 17:16:17 -0600
Message-Id: <1456874177-8537-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/01/2016 05:16:20 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/01/2016 05:16:20 PM,
	Serialize complete at 03/01/2016 05:16:20 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-01_11:, , signatures=0
Subject: [PATCH] busybox.inc: add tail symlink so busybox can commit suicide cleanly
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
X-List-Received-Date: Tue, 01 Mar 2016 23:16:24 -0000

update-alternatives-opkg uses tail, which requires a temporary symlink
on tmpdir during removal, to avoid errors of the type:

/usr/bin/update-alternatives: line 113: tail: command not found

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-core/busybox/busybox.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0769d92..705463d 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -400,6 +400,7 @@ pkg_prerm_${PN} () {
 	ln -s /bin/busybox $tmpdir/sed
 	ln -s /bin/busybox $tmpdir/sort
 	ln -s /bin/busybox $tmpdir/grep
+	ln -s /bin/busybox $tmpdir/tail
 	export PATH=$PATH:$tmpdir
 }
 
-- 
1.9.1



Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 49014736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:01:49 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7GE1ojp032566; Tue, 16 Aug 2016 09:01:50 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016081609014950-1096034 ;
	Tue, 16 Aug 2016 09:01:49 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 17:00:30 +0300
Message-Id: <20160816140030.18676-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.9.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/16/2016 09:01:49 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/16/2016 09:01:49 AM,
	Serialize complete at 08/16/2016 09:01:49 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-16_09:, , signatures=0
Subject: [PATCH v2] grub: split grub-editenv into it's own package
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
X-List-Received-Date: Tue, 16 Aug 2016 14:01:50 -0000

From: Alejandro del Castillo <alejandro.delcastillo@ni.com>

grub-editenv edits the env block at runtime on a booted system. Other
tools can depend on it to configure a live system, for ex. to set next
boot mode upon reboot. By splitting grub-editenv, tools don't have to
depend on the entire grub package (grub-editenv just edits one file).

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-bsp/grub/grub_2.00.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 778074a..07e1d10 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -1,6 +1,6 @@
 require grub2.inc
 
-RDEPENDS_${PN} = "diffutils freetype"
+RDEPENDS_${PN} = "diffutils freetype grub-editenv"
 PR = "r1"
 
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
@@ -8,6 +8,10 @@ EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
 
+PACKAGES =+ "grub-editenv"
+
+FILES_grub-editenv = "${bindir}/grub-editenv"
+
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
 }
-- 
2.9.2



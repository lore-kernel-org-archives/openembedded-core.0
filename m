Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4496FEE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 11:25:25 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0QBPQjl021619 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 05:25:26 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012605252595-292823 ;
	Tue, 26 Jan 2016 05:25:25 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 13:25:16 +0200
Message-Id: <1453807516-2205-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/26/2016 05:25:26 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/26/2016 05:25:26 AM,
	Serialize complete at 01/26/2016 05:25:26 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-26_04:, , signatures=0
Subject: [PATCH 1/1] gcc: libgcc-common.inc: symlink gthr-posix -> gthr-default.h
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
X-List-Received-Date: Tue, 26 Jan 2016 11:25:26 -0000

libgfortran needs gthr-default.h to exist (included by libgcc/gthr.h),
but for some reason it is not symlinked in configure as defined by
AC_CONFIG_LINKS. This patch creates it at the end of do_configure; thus
allowing libgfortran to build without erros.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index b09ea65..2922219 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -13,6 +13,9 @@ do_configure () {
 	cd ${B}/${BPN}
 	chmod a+x ${S}/${BPN}/configure
 	${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+
+	#fix libgfortran build which expects gthr-default.h -> gthr-posix.h
+	ln -sf ${S}/${BPN}/gthr-posix.h ${S}/${BPN}/gthr-default.h
 }
 
 do_compile () {
-- 
2.7.0



Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 2B07C606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 22:32:39 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u6QMWdi0011521; Tue, 26 Jul 2016 17:32:39 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016072617323900-327456 ;
	Tue, 26 Jul 2016 17:32:39 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 01:31:08 +0300
Message-Id: <20160726223108.4202-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.9.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/26/2016 05:32:39 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/26/2016 05:32:39 PM,
	Serialize complete at 07/26/2016 05:32:39 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-07-26_16:, , signatures=0
Subject: [PATCH] kernel.bbclass: fix emit_depmod_pkgdata() workdir
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
X-List-Received-Date: Tue, 26 Jul 2016 22:32:40 -0000

bitbake commit 67a7b8b02 "build: don't use $B as the default cwd for
functions" breaks the assumption that this function is running under
${B}. This causes build failures because System.map is under ${B}.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c17165a..125ad33 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -356,6 +356,7 @@ do_shared_workdir_setscene () {
 }
 
 emit_depmod_pkgdata() {
+	cd ${B}
 	# Stash data for depmod
 	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
 	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiversion
-- 
2.9.0



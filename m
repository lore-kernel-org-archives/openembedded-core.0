Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id AEDDB771E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 09:40:21 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7B9eL8t013516; Thu, 11 Aug 2016 04:40:21 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016081104402094-926965 ;
	Thu, 11 Aug 2016 04:40:20 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: ross.burton@intel.com, openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 12:39:06 +0300
Message-Id: <20160811093906.353-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.9.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/11/2016 04:40:21 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/11/2016 04:40:21 AM,
	Serialize complete at 08/11/2016 04:40:21 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-11_06:, , signatures=0
Subject: [PATCH v2] kernel.bbclass: fix emit_depmod_pkgdata() workdir
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
X-List-Received-Date: Thu, 11 Aug 2016 09:40:21 -0000

bitbake commit 67a7b8b02 "build: don't use $B as the default cwd for
functions" breaks the assumption that this function is running under
${B}. This causes build failures because System.map is under ${B}.
Fix this by using an absolute path instead of relying on cwd.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 062a0df..f3e1bee 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -359,7 +359,7 @@ emit_depmod_pkgdata() {
 	# Stash data for depmod
 	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
 	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiversion
-	cp System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VERSION}
+	cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VERSION}
 }
 
 PACKAGEFUNCS += "emit_depmod_pkgdata"
-- 
2.9.2



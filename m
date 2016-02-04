Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 41EB3770DE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 12:33:16 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u14CXFKh006033; Thu, 4 Feb 2016 06:33:15 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020406331592-646230 ;
	Thu, 4 Feb 2016 06:33:15 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 4 Feb 2016 14:32:52 +0200
Message-Id: <a46be4b91332be16e33749bccf73901f400575f0.1454589019.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/04/2016 06:33:16 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/04/2016 06:33:16 AM,
	Serialize complete at 02/04/2016 06:33:16 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-04_02:, , signatures=0
Subject: [PATCH v4 1/2] apr-util: fix loadable module packaging
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
X-List-Received-Date: Thu, 04 Feb 2016 12:33:17 -0000

A new QA check was introduced by 47d38d4d86ec6a which catches recipes
which install loadable modules (*.so) inside -dev packages instead of
symlinks. Install apr-util's modules into ${PN} and also skip the QA
check [dev-so] because it is the reverse of the check introduced by
47d38d4d86ec6a (thus if a recipe passes one it fails the other).

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-support/apr/apr-util_1.5.4.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index 6856db9..381daad 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -66,9 +66,12 @@ do_install_append_class-target() {
 	       -e 's,APU_BUILD_DIR=.*,APR_BUILD_DIR=,g' ${D}${bindir}/apu-1-config
 }
 
-FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
-FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.so* ${libdir}/apr-util-1/apr_dbm_gdbm.la"
-FILES_${PN}-staticdev += "${libdir}/apr-util-1/apr_dbm_gdbm.a"
+#files ${libdir}/apr-util-1/*.so are not symlinks but loadable modules thus they are packaged in ${PN}
+FILES_${PN}     += "${libdir}/apr-util-1/apr*${SOLIBS} ${libdir}/apr-util-1/apr*${SOLIBSDEV}"
+FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/*.la"
+FILES_${PN}-staticdev += "${libdir}/apr-util-1/*.a"
+
+INSANE_SKIP_${PN} += "dev-so"
 
 inherit ptest
 
-- 
2.7.0



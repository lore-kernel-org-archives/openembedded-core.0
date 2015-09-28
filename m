Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id BBF0373D17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 11:43:30 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8SBhUtT026996 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 06:43:30 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092806433044-622573 ;
	Mon, 28 Sep 2015 06:43:30 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2015 14:43:29 +0300
Message-Id: <1443440609-4664-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/28/2015 06:43:30 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/28/2015 06:43:30 AM,
	Serialize complete at 09/28/2015 06:43:30 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-28_05:, , signatures=0
Subject: [oe][meta-oe][PATCH] vim: Compile and provide xxd in package vim-xxd
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
X-List-Received-Date: Mon, 28 Sep 2015 11:43:31 -0000

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-support/vim/vim_7.4.481.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
index 2ece53b..fcd036b 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
@@ -59,6 +59,11 @@ EXTRA_OECONF = " \
     STRIP=/bin/true \
 "
 
+do_compile_append() {
+    cd "${S}/xxd"
+    make
+}
+
 do_install() {
     autotools_do_install
 
@@ -70,17 +75,20 @@ do_install() {
     # Install example vimrc from runtime files
     install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 
+    install -m 0755 xxd/xxd ${D}${bindir}/xxd
+
     # we use --with-features=big as default
     mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
 }
 
 PARALLEL_MAKEINST = ""
 
-PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc"
+PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-xxd"
 FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
 FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
 FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
 FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
+FILES_${PN}-xxd = "${bindir}/xxd"
 FILES_${PN}-data = "${datadir}/${BPN}"
 FILES_${PN}-common = " \
     ${datadir}/${BPN}/${VIMDIR}/*.vim \
-- 
2.1.4



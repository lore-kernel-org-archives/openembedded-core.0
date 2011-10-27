Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJGTA-0004T7-TA
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 05:17:29 +0200
Received: from mail138-tx2-R.bigfish.com (10.9.14.250) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.22; Thu, 27 Oct 2011 03:11:21 +0000
Received: from mail138-tx2 (localhost.localdomain [127.0.0.1])	by
	mail138-tx2-R.bigfish.com (Postfix) with ESMTP id AD3681F0250	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 03:11:24 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h66h)
X-Spam-TCS-SCL: 5:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail138-tx2 (localhost.localdomain [127.0.0.1]) by mail138-tx2
	(MessageSwitch) id 1319685002340011_8665;
	Thu, 27 Oct 2011 03:10:02 +0000 (UTC)
Received: from TX2EHSMHS047.bigfish.com (unknown [10.9.14.252])	by
	mail138-tx2.bigfish.com (Postfix) with ESMTP id C05831270094	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 03:07:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS047.bigfish.com
	(10.9.99.147) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 27 Oct 2011 03:07:13 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Wed, 26 Oct 2011 22:07:19 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p9R37Imt014917	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 22:07:18 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2011 22:07:18 -0500
Message-ID: <1319684838-24527-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1312980634.6733.62.camel@phil-desktop>
References: <1312980634.6733.62.camel@phil-desktop>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [RFC] Fix libgcc nativesdk to install libgcc.a in good location for tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2011 03:17:29 -0000
Content-Type: text/plain

This fixes an issue where we cannot find -lgcc when linking. We
update the path to libgcc.a so the library can be installed
correctly

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
I really doubt this is the correct fix and I'm no expert but it's
here for comments. This fixes a real u-boot cross compile build
issue

The previous mv command was failing as the files did not exist
and I also rejiggered the packages since I was not sure if
gdb-cross-canadian-powerpc-dev was included in my tarball of
the toolchain

 meta/recipes-devtools/gcc/libgcc_4.6.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index 63a46ec..7f3ac55 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -8,9 +8,8 @@ PACKAGES = "\
   ${PN}-dev \
   "
 
-FILES_${PN} = "${base_libdir}/libgcc*.so.*"
+FILES_${PN} = "${base_libdir}/libgcc*"
 FILES_${PN}-dev = " \
-  ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
 
@@ -29,9 +28,10 @@ do_install () {
 	if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
 		mv ${D}${libdir}/nof/libgcc* ${D}${base_libdir}
 	else
-		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
+		cp ${D}${libdir}/${TARGET_SYS}/${BINV}/libgcc* ${D}${base_libdir}
 	fi
 
+
 	chown -R root:root ${D}
 	chmod +x ${D}${base_libdir}/libgcc_s.so.*
 }
-- 
1.7.6.1





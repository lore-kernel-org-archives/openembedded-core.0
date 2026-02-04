Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4A2E8B38A
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 02:09:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10169.1770170953917550791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 18:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YXmjPZaN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64953dfaa1=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6141KOFg611707
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Feb 2026 02:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=R8ztszm8AN9V5+/Ut9KD
	f4L+Nkd9mvyAzrC7N3Tmhv4=; b=YXmjPZaNmy1R5Bdvsf3egv1lhNjR7T9aJrzk
	H0BDBP6sGrGPwaHB5f29JYNlL2MNKoarK3LLdI9bpUfey0fUoRA8pG6D2zlNurKJ
	E5JDyOA9ed6iTW4Vw36ltPcn/xVT+wy4rRiB7WBxa902DkLHTcoq6vfegdMGlhGU
	MHDHZQd7hCNt2UQmPU/qR//fglIub5PlCdFQIMt+2BPWvnDWJPninCyVQomSJZ8L
	tYQEY4d3OzCTWyh288TnhfKb5rZL5bV6rnaP81Bsth9hm4+uzc1yQJM+sH245bH1
	nJxexyXYnHSKSIzIYRT3WbkD5ikhgHsT9zMTlDYmIfq9/kB+MA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c3vc2r184-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 02:09:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 3 Feb 2026 18:09:11 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 3 Feb 2026 18:09:10 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] module.bbclass: check whether CONFIG_MODULES set
Date: Wed, 4 Feb 2026 10:09:08 +0800
Message-ID: <20260204020908.864912-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxMyBTYWx0ZWRfXxjW7d45/0i+3
 SxXh67VZ342CkOS4T6JrQt66zaYPrXpR6HulVNfiv2NzGVWZVMoH2kwgZgn5mSJdCRnP0h0+7AP
 GdayNQGCOH+Zbub8QIs2FIR5RPvzu5g5UiW2SZRy699wsZT6JQpO8jikoNFvsNMJR0kCpCqBk7d
 B0UQ5jr4J/T/F0GfZkCVqh6ipAqkpWk2wvu+D1CCM5fzn6HReiJDQNhbWPDMFdjqKq+WjrMEonf
 A6oo81Fjz2ayFMDMCAqjsMWvFL3bsu76gd2vp3fIZRIygR/MCe4D6VGntAeGsFZCPdqfINVHAYg
 CGC9GuQLb9HPuktZ9pIVNOY86F87F2GzQWy1VYx2g5W6X0lh/Q61T+rCCXd3Wwm5KxZjWs/Lwas
 dM0+Ti4J8oCnOGx2OdhdgzF3QSfumua5pgevtXmpVtl0nce1JilEzfSQMQHkPYBEI3Zy8Rk1p/9
 50hHsWQ5CKuX0PW8/fw==
X-Proofpoint-ORIG-GUID: xqxAAzNz5dt5iVypOE7t1nus4-KSQ-pN
X-Proofpoint-GUID: xqxAAzNz5dt5iVypOE7t1nus4-KSQ-pN
X-Authority-Analysis: v=2.4 cv=F8Zat6hN c=1 sm=1 tr=0 ts=6982aa48 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=qG76zQwQG-vXQeid0bUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 02:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230492

From: Kai Kang <kai.kang@windriver.com>

Check whether kernel config CONFIG_MODULES set or not before do_compile
and do_install in module.bbclass. If not set, it cannot build and
install external modules.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes-recipe/module.bbclass | 60 +++++++++++++++++-------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 4948e995c5..d2b90e9c2c 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -47,37 +47,45 @@ python do_devshell:prepend () {
 }
 
 module_do_compile() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
-		   KERNEL_VERSION=${KERNEL_VERSION}    \
-		   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
-		   AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
-		   STRIP="${KERNEL_STRIP}" \
-	           O=${STAGING_KERNEL_BUILDDIR} \
-		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
-		   ${MAKE_TARGETS}
+	if grep -q -i '^CONFIG_MODULES=y$' ${STAGING_KERNEL_BUILDDIR}/.config ; then
+		unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+		oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
+			KERNEL_VERSION=${KERNEL_VERSION}    \
+			CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
+			AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
+			STRIP="${KERNEL_STRIP}" \
+				O=${STAGING_KERNEL_BUILDDIR} \
+			KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
+			${MAKE_TARGETS}
+	else
+		bbnote "The present kernel disabled CONFIG_MODULES that cannot build or install external modules."
+	fi
 }
 
 module_do_install() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake DEPMOD=echo MODLIB="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}" \
-	           INSTALL_FW_PATH="${D}${nonarch_base_libdir}/firmware" \
-	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" \
-	           STRIP="${KERNEL_STRIP}" \
-	           O=${STAGING_KERNEL_BUILDDIR} \
-		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
-	           ${MODULES_INSTALL_TARGET}
+	if grep -q -i '^CONFIG_MODULES=y$' ${STAGING_KERNEL_BUILDDIR}/.config; then
+		unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+		oe_runmake DEPMOD=echo MODLIB="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}" \
+				INSTALL_FW_PATH="${D}${nonarch_base_libdir}/firmware" \
+				CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" \
+				STRIP="${KERNEL_STRIP}" \
+				O=${STAGING_KERNEL_BUILDDIR} \
+			KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
+				${MODULES_INSTALL_TARGET}
 
-	if [ ! -e "${B}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symvers" ] ; then
-		bbwarn "Module.symvers not found in ${B}/${MODULES_MODULE_SYMVERS_LOCATION}"
-		bbwarn "Please consider setting MODULES_MODULE_SYMVERS_LOCATION to a"
-		bbwarn "directory below B to get correct inter-module dependencies"
+		if [ ! -e "${B}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symvers" ] ; then
+			bbwarn "Module.symvers not found in ${B}/${MODULES_MODULE_SYMVERS_LOCATION}"
+			bbwarn "Please consider setting MODULES_MODULE_SYMVERS_LOCATION to a"
+			bbwarn "directory below B to get correct inter-module dependencies"
+		else
+			install -Dm0644 "${B}/${MODULES_MODULE_SYMVERS_LOCATION}"/Module.symvers ${D}${includedir}/${BPN}/Module.symvers
+			# Module.symvers contains absolute path to the build directory.
+			# While it doesn't actually seem to matter which path is specified,
+			# clear them out to avoid confusion
+			sed -e 's:${B}/::g' -i ${D}${includedir}/${BPN}/Module.symvers
+		fi
 	else
-		install -Dm0644 "${B}/${MODULES_MODULE_SYMVERS_LOCATION}"/Module.symvers ${D}${includedir}/${BPN}/Module.symvers
-		# Module.symvers contains absolute path to the build directory.
-		# While it doesn't actually seem to matter which path is specified,
-		# clear them out to avoid confusion
-		sed -e 's:${B}/::g' -i ${D}${includedir}/${BPN}/Module.symvers
+		bbnote "The present kernel disabled CONFIG_MODULES that cannot build or install external modules."
 	fi
 }
 
-- 
2.34.1



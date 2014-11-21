Return-Path: <B40290@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0112.outbound.protection.outlook.com [65.55.169.112])
	by mail.openembedded.org (Postfix) with ESMTP id 61B516A9FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 05:34:21 +0000 (UTC)
Received: from CO2PR03CA0019.namprd03.prod.outlook.com (10.141.194.146) by
	CY1PR0301MB1193.namprd03.prod.outlook.com (25.160.165.24) with
	Microsoft SMTP
	Server (TLS) id 15.1.16.15; Fri, 21 Nov 2014 05:34:20 +0000
Received: from BL2FFO11FD058.protection.gbl (2a01:111:f400:7c09::174) by
	CO2PR03CA0019.outlook.office365.com (2a01:111:e400:1414::18) with
	Microsoft
	SMTP Server (TLS) id 15.1.26.15 via Frontend Transport; Fri, 21 Nov 2014
	05:34:20 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD058.mail.protection.outlook.com (10.173.161.186) with
	Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport; Fri, 21 Nov 2014
	05:34:19 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sAL5YGuA026734; Thu, 20 Nov 2014 22:34:17 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 13:34:10 +0800
Message-ID: <1416548050-18829-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(86362001)(50226001)(36756003)(93916002)(95666004)(50466002)(4396001)(92566001)(92726001)(105606002)(31966008)(48376002)(21056001)(229853001)(64706001)(20776003)(47776003)(104016003)(102836001)(87936001)(84676001)(87286001)(104166001)(450100001)(62966003)(77156002)(89996001)(88136002)(19580395003)(106466001)(107046002)(97736003)(44976005)(110136001)(2351001)(6806004)(46102003)(50986999)(68736004)(19580405001)(120916001)(99396003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1193;
	H:tx30smr01.am.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1193;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1193; 
X-Forefront-PRVS: 0402872DA1
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40290@freescale.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1193; 
X-OriginatorOrg: freescale.com
Subject: [PATCH v1 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Fri, 21 Nov 2014 05:34:24 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 42 ++++++++++++++------------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c695b73..d107a10 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -24,6 +24,7 @@ UBOOT_LOCALVERSION ?= ""
 # Some versions of u-boot use .bin and others use .img.  By default use .bin
 # but enable individual recipes to change this value.
 UBOOT_SUFFIX ??= "bin"
+UBOOT_DEF_IMAGE ?= ""
 UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
@@ -33,9 +34,6 @@ UBOOT_MAKE_TARGET ?= "all"
 # should be packaged along with the u-boot binary as well as placed in the
 # deploy directory.  For those versions they can set the following variables
 # to allow packaging the SPL.
-SPL_BINARY ?= ""
-SPL_IMAGE ?= "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
-SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
 
 # Additional environment variables or a script can be installed alongside
 # u-boot to be used automatically on boot.  This file, typically 'uEnv.txt'
@@ -63,25 +61,25 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
 
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake ${UBOOT_MAKE_TARGET}
+
+        for type in ${UBOOT_MACHINE}; do
+	    oe_runmake O=${type} ${type}
+	    oe_runmake O=${type} ${UBOOT_MAKE_TARGET}
+            cp  ${S}/${type}/${UBOOT_BINARY}  ${S}/${type}/u-boot-${type}.bin
+        done
 }
 
 do_install () {
-    install -d ${D}/boot
-    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 
+    for type in ${UBOOT_MACHINE}; do
+        install -d ${D}/boot
+        install ${S}/${type}/u-boot-${type}.bin ${D}/boot/u-boot-${type}.bin
+    done
     if [ -e ${WORKDIR}/fw_env.config ] ; then
         install -d ${D}${sysconfdir}
         install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
     fi
 
-    if [ "x${SPL_BINARY}" != "x" ]
-    then
-        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
-        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
-    fi
 
     if [ "x${UBOOT_ENV}" != "x" ]
     then
@@ -93,21 +91,11 @@ do_install () {
 FILES_${PN} = "/boot ${sysconfdir}"
 
 do_deploy () {
-    install -d ${DEPLOYDIR}
-    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 
-    cd ${DEPLOYDIR}
-    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
-    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
-    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
-
-    if [ "x${SPL_BINARY}" != "x" ]
-    then
-        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-        rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
-        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
-        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
-    fi
+    for type in ${UBOOT_MACHINE}; do
+        install -d ${DEPLOYDIR}
+        install ${S}/${type}/u-boot-${type}.bin ${DEPLOYDIR}/u-boot-${type}.bin
+    done
 
     if [ "x${UBOOT_ENV}" != "x" ]
     then
-- 
1.9.2



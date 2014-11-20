Return-Path: <B40290@freescale.com>
X-Greylist: delayed 1095 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Nov 2014 10:40:01 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0116.outbound.protection.outlook.com [157.56.110.116])
	by mail.openembedded.org (Postfix) with ESMTP id 1742B65C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 10:40:01 +0000 (UTC)
Received: from DM2PR03CA0030.namprd03.prod.outlook.com (10.141.96.29) by
	BLUPR03MB439.namprd03.prod.outlook.com (10.141.78.151) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Thu, 20 Nov 2014 10:06:48 +0000
Received: from BN1BFFO11FD049.protection.gbl (2a01:111:f400:7c10::1:143) by
	DM2PR03CA0030.outlook.office365.com (2a01:111:e400:2428::29) with
	Microsoft
	SMTP Server (TLS) id 15.1.26.15 via Frontend Transport; Thu, 20 Nov 2014
	10:06:48 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD049.mail.protection.outlook.com (10.58.145.4) with Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Thu, 20 Nov 2014 10:06:47 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sAKA6iDk011172; Thu, 20 Nov 2014 03:06:45 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Nov 2014 18:06:36 +0800
Message-ID: <1416477996-13841-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40290@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(110136001)(99396003)(95666004)(106466001)(104016003)(4396001)(50226001)(120916001)(62966003)(77156002)(36756003)(229853001)(21056001)(450100001)(2351001)(107046002)(97736003)(105606002)(31966008)(104166001)(50986999)(68736004)(89996001)(44976005)(6806004)(87936001)(19580405001)(19580395003)(50466002)(87286001)(48376002)(92726001)(92566001)(64706001)(46102003)(85426001)(102836001)(84676001)(20776003)(86362001)(93916002)(47776003)(88136002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB439;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB439;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB439;
X-Forefront-PRVS: 0401647B7F
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB439;
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Thu, 20 Nov 2014 10:40:07 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 42 ++++++++++++++------------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c695b73..f420061 100644
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
+    for type in ${UBOOT_MACHINE}; do
+	    oe_runmake O=${type} ${type}
+	    oe_runmake O=${type} ${UBOOT_MAKE_TARGET}
+        cp  ${S}/${type}/${UBOOT_BINARY}  ${S}/${type}/u-boot-${type}.bin
+    done
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



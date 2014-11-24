Return-Path: <B40290@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0133.outbound.protection.outlook.com [65.55.169.133])
	by mail.openembedded.org (Postfix) with ESMTP id 2467665DAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 05:24:42 +0000 (UTC)
Received: from CH1PR03CA002.namprd03.prod.outlook.com (10.255.156.147) by
	CY1PR0301MB1196.namprd03.prod.outlook.com (25.160.165.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.26.15; Mon, 24 Nov 2014 05:24:40 +0000
Received: from BN1BFFO11FD057.protection.gbl (10.255.156.132) by
	CH1PR03CA002.outlook.office365.com (10.255.156.147) with Microsoft SMTP
	Server (TLS) id 15.1.26.15 via Frontend Transport;
	Mon, 24 Nov 2014 05:24:40 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD057.mail.protection.outlook.com (10.58.145.12) with
	Microsoft SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Mon, 24 Nov 2014 05:24:40 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sAO5Oa1O026402; Sun, 23 Nov 2014 22:24:37 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Nov 2014 13:24:34 +0800
Message-ID: <1416806674-15725-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(64706001)(44976005)(21056001)(105606002)(104016003)(19580405001)(19580395003)(229853001)(47776003)(20776003)(95666004)(89996001)(87936001)(106466001)(92726001)(2351001)(107046002)(50466002)(50226001)(87286001)(92566001)(104166001)(97736003)(46102003)(450100001)(4396001)(120916001)(110136001)(86362001)(88136002)(6806004)(68736004)(93916002)(31966008)(102836001)(50986999)(84676001)(36756003)(99396003)(77156002)(62966003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1196;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1196;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1196; 
X-Forefront-PRVS: 040513D301
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40290@freescale.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1196; 
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Mon, 24 Nov 2014 05:24:44 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 56 +++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c695b73..bd76241 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -63,25 +63,32 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
 
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake ${UBOOT_MAKE_TARGET}
+    for type in ${UBOOT_MACHINE}; do
+        oe_runmake O=${type} ${type}
+        oe_runmake O=${type} ${UBOOT_MAKE_TARGET}
+        cp  ${S}/${type}/${UBOOT_BINARY}  ${S}/${type}/u-boot-${type}.bin
+    done
+
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
+    for type in ${UBOOT_MACHINE}; do
+        if [ "x${SPL_BINARY}" != "x" ] && [ -d "${S}/${type}/${SPL_BINARY}"]
+        then
+            install ${S}/${type}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
+            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
+        fi
+    done
 
     if [ "x${UBOOT_ENV}" != "x" ]
     then
@@ -93,21 +100,20 @@ do_install () {
 FILES_${PN} = "/boot ${sysconfdir}"
 
 do_deploy () {
-    install -d ${DEPLOYDIR}
-    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-
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
+    
+    for type in ${UBOOT_MACHINE}; do
+        if [ "x${SPL_BINARY}" != "x" ] && [ -d "${S}/${type}/${SPL_BINARY}"]
+        then
+            install ${S}/${type}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+            rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
+            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
+            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
+        fi
+    done
 
     if [ "x${UBOOT_ENV}" != "x" ]
     then
-- 
1.9.2



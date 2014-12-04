Return-Path: <B40290@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0143.outbound.protection.outlook.com [65.55.169.143])
	by mail.openembedded.org (Postfix) with ESMTP id 9A63D722D4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 05:49:33 +0000 (UTC)
Received: from BN3PR0301CA0002.namprd03.prod.outlook.com (25.160.180.140) by
	DM2PR0301MB1200.namprd03.prod.outlook.com (25.160.217.15) with
	Microsoft SMTP
	Server (TLS) id 15.1.31.17; Thu, 4 Dec 2014 05:49:32 +0000
Received: from BL2FFO11FD045.protection.gbl (2a01:111:f400:7c09::157) by
	BN3PR0301CA0002.outlook.office365.com (2a01:111:e400:4000::12) with
	Microsoft
	SMTP Server (TLS) id 15.1.31.17 via Frontend Transport; Thu, 4 Dec 2014
	05:49:31 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD045.mail.protection.outlook.com (10.173.161.207) with
	Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport; Thu, 4 Dec 2014
	05:49:32 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sB45nSXi027278; Wed, 3 Dec 2014 22:49:29 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Dec 2014 13:49:25 +0800
Message-ID: <1417672165-6155-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(46102003)(89996001)(88136002)(44976005)(19580405001)(19580395003)(6806004)(120916001)(87936001)(87286001)(99396003)(4396001)(50226001)(92566001)(92726001)(97736003)(21056001)(50466002)(47776003)(64706001)(86362001)(93916002)(20776003)(77096005)(102836001)(104016003)(48376002)(68736005)(104166001)(50986999)(110136001)(450100001)(62966003)(95666004)(77156002)(106466001)(105606002)(84676001)(229853001)(36756003)(31966008)(2351001)(107046002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1200;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1200;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(602001);
	SRVR:DM2PR0301MB1200; 
X-Forefront-PRVS: 041517DFAB
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40290@freescale.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1200; 
X-OriginatorOrg: freescale.com
Subject: [PATCH v3 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Thu, 04 Dec 2014 05:49:37 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 72 +++++++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c695b73..9b93946 100644
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
+        cp  ${S}/${type}/${UBOOT_BINARY}  ${S}/${type}/u-boot-${type}.${UBOOT_SUFFIX}
+    done
+
 }
 
 do_install () {
-    install -d ${D}/boot
-    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+    for type in ${UBOOT_MACHINE}; do
+        install -d ${D}/boot
+        install ${S}/${type}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
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
@@ -93,21 +100,36 @@ do_install () {
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
+        for imagetype in in ${UBOOT_CONFIG}; do
+            if [ "${imagetype}"x = "in"x ]  
+            then
+                continue
+            fi
+            if [ -d "${DEPLOYDIR}/u-boot-${imagetype}.${UBOOT_SUFFIX}"]
+            then 
+                break
+            else
+                install -d ${DEPLOYDIR}
+                install ${S}/${type}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${imagetype}.${UBOOT_SUFFIX}
+                if [ "${imagetype}"x = "sd"x ] || [ "${imagetype}"x = "mfgtool"x ]
+                then
+                    cp  ${DEPLOYDIR}/u-boot-${imagetype}.${UBOOT_SUFFIX}  ${DEPLOYDIR}/u-boot-${MACHINE}.${UBOOT_SUFFIX}
+                fi
+            fi 
+        done 
+    done
+   
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



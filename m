Return-Path: <B40290@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0132.outbound.protection.outlook.com [65.55.169.132])
	by mail.openembedded.org (Postfix) with ESMTP id 02DFB72518
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 03:33:04 +0000 (UTC)
Received: from CH1PR03CA007.namprd03.prod.outlook.com (10.255.156.152) by
	BY1PR0301MB1189.namprd03.prod.outlook.com (25.160.195.148) with
	Microsoft
	SMTP Server (TLS) id 15.1.31.17; Thu, 11 Dec 2014 03:33:03 +0000
Received: from BL2FFO11FD005.protection.gbl (10.255.156.132) by
	CH1PR03CA007.outlook.office365.com (10.255.156.152) with Microsoft SMTP
	Server (TLS) id 15.1.31.17 via Frontend Transport;
	Thu, 11 Dec 2014 03:33:02 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD005.mail.protection.outlook.com (10.173.161.1) with Microsoft
	SMTP Server (TLS) id 15.1.26.17 via Frontend Transport;
	Thu, 11 Dec 2014 03:33:02 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sBB3Ww64006034; Wed, 10 Dec 2014 20:32:59 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Dec 2014 11:32:55 +0800
Message-ID: <1418268775-20010-1-git-send-email-B40290@freescale.com>
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
	SFS:(10019020)(6009001)(189002)(199003)(4396001)(50226001)(450100001)(97736003)(36756003)(21056001)(86362001)(62966003)(77156002)(68736005)(77096005)(19580405001)(19580395003)(106466001)(87936001)(229853001)(104016003)(48376002)(92566001)(50466002)(85426001)(110136001)(31966008)(50986999)(6806004)(46102003)(84676001)(99396003)(120916001)(2351001)(47776003)(64706001)(107046002)(20776003)(105606002)(89996001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1189;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1189;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601003);
	SRVR:BY1PR0301MB1189; 
X-Forefront-PRVS: 0422860ED4
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1189; 
X-OriginatorOrg: freescale.com
Subject: [PATCH v4 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Thu, 11 Dec 2014 03:33:11 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 150 +++++++++++++++++++++++++++++++------
 1 file changed, 129 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c695b73..58725fa 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -62,15 +62,56 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
+    
+    if [ "x${UBOOT_CONFIG}" != "x" ]
+    then
+        for config in ${UBOOT_MACHINE}; do
+            for type in in ${UBOOT_CONFIG}; do
+                if [ "${type}"x = "in"x ]
+                then
+                    continue
+                fi
+                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}"]
+                then
+                    break
+                else
+                    oe_runmake O=${config} ${config}
+                    oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
+                    cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
+                fi
+            done
+        done
+    else
+        oe_runmake ${UBOOT_MACHINE}
+        oe_runmake ${UBOOT_MAKE_TARGET}
+    fi
 
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake ${UBOOT_MAKE_TARGET}
 }
 
 do_install () {
-    install -d ${D}/boot
-    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+    if [ "x${UBOOT_CONFIG}" != "x" ]
+    then
+        for config in ${UBOOT_MACHINE}; do
+            for type in in ${UBOOT_CONFIG}; do
+                if [ "${type}"x = "in"x ]
+                then
+                    continue
+                fi
+                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}"]
+                then
+                    break
+                else
+                    install -d ${D}/boot
+                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
+                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+                fi
+            done
+        done
+    else
+        install -d ${D}/boot
+        install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+    fi
 
     if [ -e ${WORKDIR}/fw_env.config ] ; then
         install -d ${D}${sysconfdir}
@@ -79,8 +120,28 @@ do_install () {
 
     if [ "x${SPL_BINARY}" != "x" ]
     then
-        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
-        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
+        if [ "x${UBOOT_CONFIG}" != "x" ]   
+        then
+            for config in ${UBOOT_MACHINE}; do
+                for type in in ${UBOOT_CONFIG}; do
+                     if [ "${type}"x = "in"x ]
+                     then
+                         continue
+                     fi
+                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}"]
+                     then
+                         break
+                     else
+                         install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}
+                     fi
+                done
+            done
+        else
+            install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
+            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
+        fi
     fi
 
     if [ "x${UBOOT_ENV}" != "x" ]
@@ -93,21 +154,68 @@ do_install () {
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
+    if [ "x${UBOOT_CONFIG}" != "x" ]
     then
-        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-        rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
-        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
-        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
-    fi
+        for config in ${UBOOT_MACHINE}; do
+            for type in in ${UBOOT_CONFIG}; do
+                if [ "${type}"x = "in"x ]  
+                then
+                    continue
+                fi
+                if [ -d "${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}"]
+                then 
+                    break
+                else
+                    install -d ${DEPLOYDIR}
+                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}
+                    cd ${DEPLOYDIR}
+                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
+                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+                fi 
+            done 
+        done
+    else
+        install -d ${DEPLOYDIR}
+        install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        cd ${DEPLOYDIR}
+        rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
+        ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
+        ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
+   fi
+    
+
+
+     if [ "x${SPL_BINARY}" != "x" ]
+     then
+         if [ "x${UBOOT_CONFIG}" != "x" ]   
+         then
+             for config in ${UBOOT_MACHINE}; do
+                 for type in in ${UBOOT_CONFIG}; do
+                      if [ "${type}"x = "in"x ]
+                      then
+                          continue
+                      fi
+                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}"]
+                      then
+                          break
+                      else
+                          install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}
+                          rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}-${type}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}
+                      fi
+                 done
+             done
+         else
+             install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+             rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
+             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
+             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
+         fi
+     fi
+
 
     if [ "x${UBOOT_ENV}" != "x" ]
     then
-- 
1.9.2



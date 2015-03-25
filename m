Return-Path: <B40290@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0129.outbound.protection.outlook.com [207.46.100.129])
	by mail.openembedded.org (Postfix) with ESMTP id 77D65723B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 09:51:33 +0000 (UTC)
Received: from BY2PR03CA002.namprd03.prod.outlook.com (10.255.93.19) by
	BLUPR03MB437.namprd03.prod.outlook.com (10.141.78.147) with Microsoft
	SMTP Server (TLS) id 15.1.125.14; Wed, 25 Mar 2015 09:51:32 +0000
Received: from BN1BFFO11OLC004.protection.gbl (10.255.93.4) by
	BY2PR03CA002.outlook.office365.com (10.255.93.19) with Microsoft SMTP
	Server (TLS) id 15.1.125.19 via Frontend Transport;
	Wed, 25 Mar 2015 09:51:31 +0000
Received: from tx30smr01.am.freescale.net ([192.88.168.50]) by
	BN1BFFO11OLC004.mail.protection.outlook.com ([10.58.145.15]) with
	Microsoft SMTP Server (TLS) id 15.1.130.10 via Frontend Transport;
	Wed, 25 Mar 2015 09:51:30 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t2P9pQW8029418; Wed, 25 Mar 2015 02:51:28 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2015 17:51:22 +0800
Message-ID: <1427277082-28117-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40290@freescale.com; freescale.mail.onmicrosoft.com;
	dkim=none (message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(85426001)(46102003)(50466002)(87936001)(48376002)(19580405001)(19580395003)(86362001)(229853001)(110136001)(92566002)(2351001)(106466001)(105606002)(50226001)(77096005)(77156002)(450100001)(62966003)(50986999)(47776003)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB437;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB437;
X-Microsoft-Antispam-PRVS: <BLUPR03MB43710956ADAC2E897A8B398840B0@BLUPR03MB437.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BLUPR03MB437; BCL:0;
	PCL:0; RULEID:; SRVR:BLUPR03MB437; 
X-Forefront-PRVS: 052670E5A4
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2015 09:51:30.6623 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB437
Subject: [PATCH v5] u-boot.inc: fix rename image error
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
X-List-Received-Date: Wed, 25 Mar 2015 09:51:37 -0000
Content-Type: text/plain

   Resolve mismatch between U-Boot configs and uboot image name.
   The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
   and repeat compile or install so we need to check if ${type} match ${config}

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 101 ++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 58 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 6bdc86a..7053a56 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -66,20 +66,17 @@ do_compile () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x = "in"x ]
+            i=`expr $i + 1`;
+            for type  in ${UBOOT_CONFIG}; do
+                j=`expr $j + 1`;
+                if [ $j -eq $i ]
                 then
-                    continue
-                fi
-                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}" ]
-                then
-                    break
-                else
                     oe_runmake O=${config} ${config}
                     oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
                     cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
                 fi
             done
+            unset  j
         done
     else
         oe_runmake ${UBOOT_MACHINE}
@@ -92,20 +89,17 @@ do_install () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x = "in"x ]
-                then
-                    continue
-                fi
-                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}" ]
+            i=`expr $i + 1`;
+            for type in ${UBOOT_CONFIG}; do
+                j=`expr $j + 1`;
+                if [ $j -eq $i ]
                 then
-                    break
-                else
                     install -d ${D}/boot
-                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
-                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
                 fi
             done
+            unset  j
         done
     else
         install -d ${D}/boot
@@ -123,20 +117,17 @@ do_install () {
         if [ "x${UBOOT_CONFIG}" != "x" ]   
         then
             for config in ${UBOOT_MACHINE}; do
-                for type in in ${UBOOT_CONFIG}; do
-                     if [ "${type}"x = "in"x ]
-                     then
-                         continue
-                     fi
-                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}" ]
-                     then
-                         break
-                     else
-                         install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}
-                         ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}-${type}
-                         ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}
-                     fi
+                i=`expr $i + 1`;
+                for type in ${UBOOT_CONFIG}; do
+                    j=`expr $j + 1`;
+                    if [ $j -eq $i ]
+                    then
+                         install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
+                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARY}-${type}
+                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARY}
+                    fi
                 done
+                unset  j
             done
         else
             install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
@@ -157,22 +148,19 @@ do_deploy () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x = "in"x ]  
+            i=`expr $i + 1`;
+            for type in ${UBOOT_CONFIG}; do
+                j=`expr $j + 1`;
+                if [ $j -eq $i ]
                 then
-                    continue
-                fi
-                if [ -d "${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}" ]
-                then 
-                    break
-                else
                     install -d ${DEPLOYDIR}
-                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}
+                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
-                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
-                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
+                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
                 fi 
             done 
+            unset  j
         done
     else
         install -d ${DEPLOYDIR}
@@ -190,23 +178,20 @@ do_deploy () {
          if [ "x${UBOOT_CONFIG}" != "x" ]   
          then
              for config in ${UBOOT_MACHINE}; do
-                 for type in in ${UBOOT_CONFIG}; do
-                      if [ "${type}"x = "in"x ]
-                      then
-                          continue
-                      fi
-                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}" ]
-                      then
-                          break
-                      else
-                          install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}
-                          rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
-                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}-${type}
-                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}
-                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
-                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}
-                      fi
+                 i=`expr $i + 1`;
+                 for type in ${UBOOT_CONFIG}; do
+                     j=`expr $j + 1`;
+                     if [ $j -eq $i ]
+                     then
+                         install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
+                         rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARY}-${type}
+                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARY}
+                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_SYMLINK}
+                     fi
                  done
+                 unset  j
              done
          else
              install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-- 
1.9.2



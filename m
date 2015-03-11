Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0143.outbound.protection.outlook.com [157.56.111.143])
	by mail.openembedded.org (Postfix) with ESMTP id 7D99C739DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 09:40:32 +0000 (UTC)
Received: from CH1PR03CA001.namprd03.prod.outlook.com (10.255.156.146) by
	DM2PR03MB448.namprd03.prod.outlook.com (10.141.85.24) with Microsoft
	SMTP Server (TLS) id 15.1.106.11; Wed, 11 Mar 2015 09:40:30 +0000
Received: from BL2FFO11FD036.protection.gbl (10.255.156.132) by
	CH1PR03CA001.outlook.office365.com (10.255.156.146) with Microsoft SMTP
	Server (TLS) id 15.1.112.16 via Frontend Transport;
	Wed, 11 Mar 2015 09:40:29 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD036.mail.protection.outlook.com (10.173.161.132) with
	Microsoft SMTP Server (TLS) id 15.1.112.13 via Frontend Transport;
	Wed, 11 Mar 2015 09:40:29 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t2B9ePaY003802; Wed, 11 Mar 2015 02:40:27 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 17:40:20 +0800
Message-ID: <1426066820-19627-1-git-send-email-B40290@freescale.com>
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
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(50226001)(85426001)(19580405001)(46102003)(87936001)(77156002)(77096005)(36756003)(229853001)(106466001)(19580395003)(105606002)(104016003)(47776003)(2351001)(50986999)(110136001)(450100001)(48376002)(6806004)(50466002)(86362001)(92566002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR03MB448;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR03MB448;
X-Microsoft-Antispam-PRVS: <DM2PR03MB448697FC44C4A66622BC18384190@DM2PR03MB448.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002009)(5005006); SRVR:DM2PR03MB448; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR03MB448; 
X-Forefront-PRVS: 0512CC5201
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2015 09:40:29.1817 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB448
Subject: [PATCH v4] u-boot.inc: fix rename image error
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
X-List-Received-Date: Wed, 11 Mar 2015 09:40:33 -0000
Content-Type: text/plain

  Resolve mismatch between U-Boot configs and uboot image name.
  The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
  and repeat compile or install so we need to check if ${type} match ${config} .

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 85 ++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 50 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 6bdc86a..9b52971 100644
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
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
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
+                i=`expr $i + 1`;
+                for type in ${UBOOT_CONFIG}; do
+                    j=`expr $j + 1`;
+                    if [ $j -eq $i ]
+                    then
                          install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}
                          ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}-${type}
                          ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}
-                     fi
+                    fi
                 done
+                unset  j
             done
         else
             install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
@@ -157,15 +148,11 @@ do_deploy () {
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
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
@@ -173,6 +160,7 @@ do_deploy () {
                     ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
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
+                         install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}
+                         rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}
+                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}
+                     fi
                  done
+                 unset  j
              done
          else
              install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-- 
1.9.2



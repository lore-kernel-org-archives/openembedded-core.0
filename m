Return-Path: <B40290@freescale.com>
X-Greylist: delayed 63939 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Mar 2015 03:57:34 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0138.outbound.protection.outlook.com [65.55.169.138])
	by mail.openembedded.org (Postfix) with ESMTP id 64A566017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 03:57:34 +0000 (UTC)
Received: from BY2PR03CA009.namprd03.prod.outlook.com (10.255.93.26) by
	DM2PR03MB446.namprd03.prod.outlook.com (10.141.85.17) with Microsoft
	SMTP Server (TLS) id 15.1.106.11; Fri, 6 Mar 2015 03:57:33 +0000
Received: from BN1BFFO11FD037.protection.gbl (10.255.93.4) by
	BY2PR03CA009.outlook.office365.com (10.255.93.26) with Microsoft SMTP
	Server (TLS) id 15.1.106.15 via Frontend Transport;
	Fri, 6 Mar 2015 03:57:32 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD037.mail.protection.outlook.com (10.58.144.100) with
	Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport; Fri, 6 Mar 2015
	03:57:32 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t263vTPo009823;
	Thu, 5 Mar 2015 20:57:30 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2015 11:57:27 +0800
Message-ID: <1425614247-20219-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B40290@freescale.com; freescale.mail.onmicrosoft.com;
	dkim=none (message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:1;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(48376002)(19580405001)(87936001)(19580395003)(106466001)(50986999)(105606002)(50466002)(86362001)(50226001)(47776003)(77096005)(2351001)(36756003)(85426001)(46102003)(77156002)(110136001)(104016003)(450100001)(6806004)(62966003)(92566002)(229853001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR03MB446;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR03MB446;
X-Microsoft-Antispam-PRVS: <DM2PR03MB4462AA8593E7DDC86CD4D3E841C0@DM2PR03MB446.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002007)(5005006); SRVR:DM2PR03MB446; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR03MB446; 
X-Forefront-PRVS: 05079D8470
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2015 03:57:32.6947 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB446
Subject: [PATCH v2] u-boot.inc: fix rename image error
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
X-List-Received-Date: Fri, 06 Mar 2015 03:57:35 -0000
Content-Type: text/plain

  Resolve mismatch between U-Boot configs and uboot image name.
  The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
  and repeat compile or install so we need to check if ${type} match ${config} .

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 51 ++++++++------------------------------
 1 file changed, 11 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 6bdc86a..b514893 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -63,18 +63,13 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
     
+
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x = "in"x ]
-                then
-                    continue
-                fi
-                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}" ]
+            for type in ${UBOOT_CONFIG}; do
+                if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                 then
-                    break
-                else
                     oe_runmake O=${config} ${config}
                     oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
                     cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
@@ -92,15 +87,9 @@ do_install () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x = "in"x ]
-                then
-                    continue
-                fi
-                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}" ]
+            for type in ${UBOOT_CONFIG}; do
+                if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                 then
-                    break
-                else
                     install -d ${D}/boot
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
@@ -123,15 +112,9 @@ do_install () {
         if [ "x${UBOOT_CONFIG}" != "x" ]   
         then
             for config in ${UBOOT_MACHINE}; do
-                for type in in ${UBOOT_CONFIG}; do
-                     if [ "${type}"x = "in"x ]
+                for type in ${UBOOT_CONFIG}; do
+                     if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                      then
-                         continue
-                     fi
-                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}" ]
-                     then
-                         break
-                     else
                          install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}
                          ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}-${type}
                          ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}
@@ -157,15 +140,9 @@ do_deploy () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x = "in"x ]  
+            for type in ${UBOOT_CONFIG}; do
+                if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
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
@@ -190,15 +167,9 @@ do_deploy () {
          if [ "x${UBOOT_CONFIG}" != "x" ]   
          then
              for config in ${UBOOT_MACHINE}; do
-                 for type in in ${UBOOT_CONFIG}; do
-                      if [ "${type}"x = "in"x ]
-                      then
-                          continue
-                      fi
-                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}" ]
+                 for type in ${UBOOT_CONFIG}; do
+                      if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                       then
-                          break
-                      else
                           install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}
                           rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
                           ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}-${type}
-- 
1.9.2



Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD65C369CA
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 15:27:31 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.138])
 by mx.groups.io with SMTP id smtpd.web11.14470.1744990049736520657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 08:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=qbR91Vkr;
 spf=pass (domain: phytec.de, ip: 40.107.241.138, mailfrom: w.egorov@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goq+R4bGrPJ+LNfEZAbpUv3TmoAeAiLPAkVNFsD1kevJGt18xlsEz2nYCSYjix17Zc5cT/YuEdUWxT+Yq5M+c0jnY8GW0NSzTCxGQ7o81ANkSWdqWjUBMHMOuk65VCmogtqLbk4L0LLdtzpwH4WJO+LA3ByqkIENtIwFtf/GgzEU7ClYknf0ZXpDqxrqX7zdY5/WygJYdMs4Tt6V/YIKt1CeTwlYqxj7eBjqGc4eAYYs7ROVKW2c4n4HHAnK7SNd+ynyFnbJivNA6FWR+XBPRe/70uYaPpABtf+kJwxu9BCo9OO0KgEeXot9NjvEcJ392mUmIcyKnP9HeN6sGKer7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtUryRdM+UBC1wIw5XqIbsdAQzFBRZpQY7ZujHM//eo=;
 b=lf+LtjXvz2Iplq9EQpDVN6vkSiq90taxnZVN115g4kAsW0+kC6DcgYyHrCZ2npJ+/SipDAOnfyT7s15zLdQYz8Qbm/Sy9dDS9OfAecWkGOsw0n7KzclOx1lFf8PQZjfqNTwsPWs6yy/wnrwp9iMRTbN0XuvhyFimVlkShYTtVBkIuTf6sayhYVpsjfngkvvnadR1A1NZNVCDyjyLFEl7Yt8I4DAiti3OBRFfz7+rJxyDDgUQoGsIRkwExRMMH0Itc3khS3SMAuBX7xFDQ4rwqZLd3WcWeVJ5DYncz1VWL2XNqux4tAcKhc0fWaXWp0e+QcJtET+G50FQ5IGNx4HPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtUryRdM+UBC1wIw5XqIbsdAQzFBRZpQY7ZujHM//eo=;
 b=qbR91Vkr8HkUqCad0+jc2Y/Nx5XQyXxwJQSTT7ertkA0i1sA672rAgpzigyPmy1qG+ioQVNFNK8G5VT1u5iaR8J4ct83h0cYYRZcsN8o14MDXAzkJ/ql5HythajLo+wgA5leHm8Ad2pg7fTHWxOP1BewxbpLMuTAdZ18dS4/7j2MJJPq9NimYW3o3p7xxQJ0H5O+oXUo1v5BcuKYsyKrGcVDx9Phcm8FUDcPj6P2j2re1ZxPhlRfXGzuKbUW0qzsI08+89Nbi0mKOyjIpKoj24rk5JIYrXfOxhWsaOOqRBitzs1yNQwCshH/Dz7mPAfazbwOEUb5Dp4D6keQJda6Dw==
Received: from AS4P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::13)
 by GV2P195MB2162.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 15:27:22 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::dd) by AS4P251CA0012.outlook.office365.com
 (2603:10a6:20b:5d2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Fri,
 18 Apr 2025 15:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 15:27:22 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 18 Apr
 2025 17:27:21 +0200
Received: from phytec.de (172.25.0.51) by Florix.phytec.de (172.25.0.13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 18 Apr
 2025 17:27:21 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <openembedded-core@lists.openembedded.org>, <upstream@lists.phytec.de>
Subject: [PATCH] meta: u-boot: Provide option to install & deploy EFI capsules
Date: Fri, 18 Apr 2025 17:27:06 +0200
Message-ID: <20250418152706.447180-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6C:EE_|GV2P195MB2162:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a8c5fd-2be7-4675-de5d-08dd7e8d83a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0vNhlO0HqwLNuyebK7ek76Qp48NOitQbj2PSjqqBf/rlTAaxjeTsfTa5ffXz?=
 =?us-ascii?Q?DcCi24sCO0B9NmQNn7v/NqXwFZw+DtiKN0wD1on+JIvsHRIgySuhAP4zbLpy?=
 =?us-ascii?Q?Pd0HUtS146q+9BNXzZRiAvlkCtKBDNngOw2YoVYxaqkuyG55xVPAlZyNqdhr?=
 =?us-ascii?Q?R/7HkDXZz3MrUfPEskfZmbzuFNDiqvRiht6T7GjbCFRjRUNfznGUCwU8kbv9?=
 =?us-ascii?Q?ze1R3TSYFHIDeTS9ixJYXg10BdtSWPgPG0xO456A8x7TEZnBVKOfsunZQZs9?=
 =?us-ascii?Q?1JNXnPaUwEoDf3/chlEWXMui4vIPigOQXC+EnA19VG+GY16y4c3VQDN6TLE3?=
 =?us-ascii?Q?nU2BjSblB+zLKP8NzHgBKXclwnChZOM5CMxEMv91PF4FA5S0XnCX9+WRpSZj?=
 =?us-ascii?Q?ESwCr3heaQrG1OHJ481H1EZLH68HYGmNYevbb3YMsYEEObdzzPn0N6390Tan?=
 =?us-ascii?Q?zJblxhscVB8FMCFltE7oJYpkoaZMYinGLX127qyuJmJE/BTFex+nO/Nh5Ok9?=
 =?us-ascii?Q?t7yiPOxnWs+dO5y6TmrNn+Y8/9sEz6DEfp84XJE3mFbtiJ0LGp97wYsjVFrW?=
 =?us-ascii?Q?Ds7bYWyVDyuRP0ynNe+2vOFSpVmKbn0iC+A2Rj9ztd7czgIYVc5sm7skZt7N?=
 =?us-ascii?Q?7k3kth/3+EHfdcaLDkzO8DXO8AeS9tzmUfBDe3uDFB3HsCz1NnjMESzDm01U?=
 =?us-ascii?Q?LdK2DJ+EzfWxxU0J976sk5D92L8gNhekhu1v1LrTjssylKufZC/yHo6eRDBi?=
 =?us-ascii?Q?w2IDd5KKa8A3ZoCdxRagkrzCabYIKJN2KCYTJhHPWVQjkTus9LbDwQfbtoVX?=
 =?us-ascii?Q?umHRQwqBZM4dGk35Jwpm8Yf6SxpfGwujQaEpEGdeE67LQVS911lMZfZRA+ew?=
 =?us-ascii?Q?krEmpJUSnAd9Sl4cGbKAHLOQuR93aXSTm58ffEV4L3AXthyjpcqtlwW8FJff?=
 =?us-ascii?Q?Gio4hoQI3e+MZILccKHwSicRTqW08TX9Q8e3o3mOjvM5IB2t+VCgDZBZKZow?=
 =?us-ascii?Q?VSAWQblx322L7Ad6sWirW2YIDFNvK6JKm0x9rQCgB0b5ogfRTFCi+TJ/N1aC?=
 =?us-ascii?Q?COx9cPzhVa00ycnNPdg5hug+lRKIuIESQEXbfCCDU748gQOV8+xjzL0lZU6h?=
 =?us-ascii?Q?XtRmF53jyStk2hiApVcYNdEqaQt5hauZgA18CAEdHor89NEZrpD7GOGUxYIo?=
 =?us-ascii?Q?UNwVnBpsZFDq37TPntq7ClT2xiXomg87TxfA0M0k3W3Nthy1yTcxjjWxVI+C?=
 =?us-ascii?Q?uiq99OhEcwJiR1soByRe080A2Q4n5NNESSbY+Ij9CirPsD/9vxs8yZxxvKSR?=
 =?us-ascii?Q?RuvENH5KBvpFH9rC7iNLGGgn7awyanXzetQ+0jpJyCUtHYn3Ne5g2s+AP4m1?=
 =?us-ascii?Q?pC2FQaKBr9cWk9WCU3JMvRCbHkgFnLzPK3X7WOE6GmMnjQjv0wrY7wBF7rAj?=
 =?us-ascii?Q?pGBRaCL95YqSYKgMz4uRFSwfc5/gouF+8VUB1v4QhZS8lVTexfvIhEjK50ii?=
 =?us-ascii?Q?VlFQtD9PxXRHHU0VZ0HrTzwbNCOMurAejSZP?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 15:27:22.0274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a8c5fd-2be7-4675-de5d-08dd7e8d83a4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB2162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 15:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215134

Add support for installing and deploying EFI capsule update archives,
which provide a standardized container for firmware update data.

By default, the feature is disabled. To enable it, set UBOOT_CAPSULE or
SPL_CAPSULE to the appropriate capsule file (e.g., uboot-capsule.bin or
tiboot3-capsule.bin).

This option is especially useful when a U-Boot build also generates
capsule binaries alongside the regular U-Boot binaries.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 meta/classes-recipe/uboot-config.bbclass |  16 +++
 meta/recipes-bsp/u-boot/u-boot.inc       | 146 +++++++++++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index f44605cb6a..b435e4d32f 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -52,6 +52,22 @@ SPL_BINARYNAME ?=3D "${@removesuffix(d.getVar("SPL_BINAR=
YFILE"), "." + d.getVar("S
 SPL_IMAGE ?=3D "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}${SPL_DELIMITER}${=
SPL_SUFFIX}"
 SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}${SPL_DELIMITER}${SPL_SUFFIX=
}"
=20
+# Some versions of U-Boot also generate UEFI capsule update archives used =
for
+# updating the bootloader. These archives must be deployed alongside the
+# U-Boot binaries. For versions that support capsule updates, the followin=
g
+# variables can be set to enable packaging of the capsules.
+UBOOT_CAPSULE ?=3D ""
+UBOOT_CAPSULE_SUFFIX ?=3D "bin"
+UBOOT_CAPSULE_BINARYNAME ?=3D "${@os.path.splitext(d.getVar("UBOOT_CAPSULE=
"))[0]}"
+UBOOT_CAPSULE_IMAGE ?=3D "${UBOOT_CAPSULE_BINARYNAME}-${MACHINE}-${PV}-${P=
R}.${UBOOT_CAPSULE_SUFFIX}"
+UBOOT_CAPSULE_SYMLINK ?=3D "${UBOOT_CAPSULE_BINARYNAME}-${MACHINE}.${UBOOT=
_CAPSULE_SUFFIX}"
+
+SPL_CAPSULE ?=3D ""
+SPL_CAPSULE_SUFFIX ?=3D "bin"
+SPL_CAPSULE_BINARYNAME ?=3D "${@os.path.splitext(d.getVar("SPL_CAPSULE"))[=
0]}"
+SPL_CAPSULE_IMAGE ?=3D "${SPL_CAPSULE_BINARYNAME}-${MACHINE}-${PV}-${PR}.$=
{SPL_CAPSULE_SUFFIX}"
+SPL_CAPSULE_SYMLINK ?=3D "${SPL_CAPSULE_BINARYNAME}-${MACHINE}.${SPL_CAPSU=
LE_SUFFIX}"
+
 # Additional environment variables or a script can be installed alongside
 # u-boot to be used automatically on boot.  This file, typically 'uEnv.txt=
'
 # or 'boot.scr', should be packaged along with u-boot as well as placed in=
 the
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 9464736b84..e1ea62e979 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -176,6 +176,48 @@ do_install () {
         fi
     fi
=20
+    if [ -n "${UBOOT_CAPSULE}" ]
+    then
+        if [ -n "${UBOOT_CONFIG}" ]
+        then
+            for config in ${UBOOT_MACHINE}; do
+                i=3D$(expr $i + 1);
+                for type in ${UBOOT_CONFIG}; do
+                    j=3D$(expr $j + 1);
+                    if [ $j -eq $i ]
+                    then
+                        uboot_install_capsule_config $config $type
+                    fi
+                done
+                unset j
+            done
+            unset i
+        else
+            uboot_install_capsule
+        fi
+    fi
+
+    if [ -n "${SPL_CAPSULE}" ]
+    then
+        if [ -n "${UBOOT_CONFIG}" ]
+        then
+            for config in ${UBOOT_MACHINE}; do
+                i=3D$(expr $i + 1);
+                for type in ${UBOOT_CONFIG}; do
+                    j=3D$(expr $j + 1);
+                    if [ $j -eq $i ]
+                    then
+                        uboot_install_spl_capsule_config $config $type
+                    fi
+                done
+                unset j
+            done
+            unset i
+        else
+            uboot_install_spl_capsule
+        fi
+    fi
+
     if [ -n "${UBOOT_ENV}" ]
     then
         install -m 644 ${B}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAG=
E}
@@ -231,6 +273,34 @@ uboot_install_elf () {
     ln -sf ${UBOOT_ELF_IMAGE} ${D}/boot/${UBOOT_ELF_BINARY}
 }
=20
+uboot_install_capsule_config () {
+    config=3D$1
+    type=3D$2
+
+    install -m 644 ${B}/${config}/${UBOOT_CAPSULE} ${D}/boot/${UBOOT_CAPSU=
LE_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_CAPSULE_SUFFIX}
+    ln -sf ${UBOOT_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_CAPSULE=
_SUFFIX} ${D}/boot/${UBOOT_CAPSULE}-${type}
+    ln -sf ${UBOOT_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_CAPSULE=
_SUFFIX} ${D}/boot/${UBOOT_CAPSULE}
+}
+
+uboot_install_capsule () {
+    install -m 644 ${B}/${UBOOT_CAPSULE} ${D}/boot/${UBOOT_CAPSULE_IMAGE}
+    ln -sf ${UBOOT_CAPSULE_IMAGE} ${D}/boot/${UBOOT_CAPSULE}
+}
+
+uboot_install_spl_capsule_config () {
+    config=3D$1
+    type=3D$2
+
+    install -m 644 ${B}/${config}/${SPL_CAPSULE} ${D}/boot/${SPL_CAPSULE_B=
INARYNAME}-${type}-${PV}-${PR}.${SPL_CAPSULE_SUFFIX}
+    ln -sf ${SPL_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${SPL_CAPSULE_SUF=
FIX} ${D}/boot/${SPL_CAPSULE}-${type}
+    ln -sf ${SPL_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${SPL_CAPSULE_SUF=
FIX} ${D}/boot/${SPL_CAPSULE}
+}
+
+uboot_install_spl_capsule () {
+    install -m 644 ${B}/${SPL_CAPSULE} ${D}/boot/${SPL_CAPSULE_IMAGE}
+    ln -sf ${SPL_CAPSULE_IMAGE} ${D}/boot/${SPL_CAPSULE}
+}
+
 uboot_install_spl_config () {
     config=3D$1
     type=3D$2
@@ -309,6 +379,47 @@ do_deploy () {
         fi
     fi
=20
+    if [ -n "${UBOOT_CAPSULE}" ]
+    then
+        if [ -n "${UBOOT_CONFIG}" ]
+        then
+            for config in ${UBOOT_MACHINE}; do
+                i=3D$(expr $i + 1);
+                for type in ${UBOOT_CONFIG}; do
+                    j=3D$(expr $j + 1);
+                    if [ $j -eq $i ]
+                    then
+                        uboot_deploy_capsule_config $config $type
+                    fi
+                done
+                unset j
+            done
+            unset i
+        else
+            uboot_deploy_capsule
+        fi
+    fi
+
+    if [ -n "${SPL_CAPSULE}" ]
+     then
+        if [ -n "${UBOOT_CONFIG}" ]
+        then
+            for config in ${UBOOT_MACHINE}; do
+                i=3D$(expr $i + 1);
+                for type in ${UBOOT_CONFIG}; do
+                    j=3D$(expr $j + 1);
+                    if [ $j -eq $i ]
+                    then
+                        uboot_deploy_spl_capsule_config $config $type
+                    fi
+                done
+                unset j
+            done
+            unset i
+        else
+            uboot_deploy_spl_capsule
+        fi
+    fi
=20
      if [ -n "${SPL_BINARY}" ]
      then
@@ -405,6 +516,23 @@ uboot_deploy_elf () {
     ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
 }
=20
+uboot_deploy_capsule_config () {
+    config=3D$1
+    type=3D$2
+
+    install -m 644 ${B}/${config}/${UBOOT_CAPSULE} ${DEPLOYDIR}/${UBOOT_CA=
PSULE_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_CAPSULE_SUFFIX}
+    ln -sf ${UBOOT_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_CAPSULE=
_SUFFIX} ${DEPLOYDIR}/${UBOOT_CAPSULE}-${type}
+    ln -sf ${UBOOT_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_CAPSULE=
_SUFFIX} ${DEPLOYDIR}/${UBOOT_CAPSULE}
+    ln -sf ${UBOOT_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_CAPSULE=
_SUFFIX} ${DEPLOYDIR}/${UBOOT_CAPSULE_SYMLINK}-${type}
+    ln -sf ${UBOOT_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_CAPSULE=
_SUFFIX} ${DEPLOYDIR}/${UBOOT_CAPSULE_SYMLINK}
+}
+
+uboot_deploy_capsule () {
+    install -m 644 ${B}/${UBOOT_CAPSULE} ${DEPLOYDIR}/${UBOOT_CAPSULE_IMAG=
E}
+    ln -sf ${UBOOT_CAPSULE_IMAGE} ${DEPLOYDIR}/${UBOOT_CAPSULE}
+    ln -sf ${UBOOT_CAPSULE_IMAGE} ${DEPLOYDIR}/${UBOOT_CAPSULE_SYMLINK}
+}
+
 uboot_deploy_spl_config () {
     config=3D$1
     type=3D$2
@@ -423,4 +551,22 @@ uboot_deploy_spl () {
     ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
 }
=20
+uboot_deploy_spl_capsule_config () {
+    config=3D$1
+    type=3D$2
+
+    install -m 644 ${B}/${config}/${SPL_CAPSULE} ${DEPLOYDIR}/${SPL_CAPSUL=
E_BINARYNAME}-${type}-${PV}-${PR}.${SPL_CAPSULE_SUFFIX}
+    rm -f ${DEPLOYDIR}/${SPL_CAPSULE_BINARYFILE} ${DEPLOYDIR}/${SPL_CAPSUL=
E_SYMLINK}
+    ln -sf ${SPL_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${SPL_CAPSULE_SUF=
FIX} ${DEPLOYDIR}/${SPL_CAPSULE_BINARYFILE}-${type}
+    ln -sf ${SPL_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${SPL_CAPSULE_SUF=
FIX} ${DEPLOYDIR}/${SPL_CAPSULE_BINARYFILE}
+    ln -sf ${SPL_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${SPL_CAPSULE_SUF=
FIX} ${DEPLOYDIR}/${SPL_CAPSULE_SYMLINK}-${type}
+    ln -sf ${SPL_CAPSULE_BINARYNAME}-${type}-${PV}-${PR}.${SPL_CAPSULE_SUF=
FIX} ${DEPLOYDIR}/${SPL_CAPSULE_SYMLINK}
+}
+
+uboot_deploy_spl_capsule () {
+    install -m 644 ${B}/${SPL_CAPSULE} ${DEPLOYDIR}/${SPL_CAPSULE_IMAGE}
+    ln -sf ${SPL_CAPSULE_IMAGE} ${DEPLOYDIR}/${SPL_CAPSULE}
+    ln -sf ${SPL_CAPSULE_IMAGE} ${DEPLOYDIR}/${SPL_CAPSULE_SYMLINK}
+}
+
 addtask deploy before do_build after do_compile
--=20
2.25.1



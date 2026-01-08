Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649BBD1D490
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 20:22:54 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16271.1767903767939462598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 12:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BvkwYeLD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.61, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGSkuE7XyLN9nHdum+qXLXA+PSYvhFH7s9w7zdiilQIqDnBe46/pRdtMNR7h8bd+uvS8WlnHzCLFPsYDEwu/BwrNaigPNipsG4YnzQXFxKyBQqeuG/oVvtwT3jTiTJY9uuv4Na8frsAxpCfTnKeFFqRUFtChbocwmuKaKNC+fkP1yvKrjV/mKTx6t6r/9iWh8IndF/K9k+RZVPQCGg7C2yE1AAtlZaZghphyHDozM+a5gX6gupOfJAgttaRSdfTdR8LgbfaidynBiLcR8pW3aIn0ub6crVpDkYtOtCgkdFfQg0FfPCbB0nY4w2LnOxxXbJL/Z4XoTwUBR+R88HEmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDCFzZ+doH0D8Uni3WVTvowcwVXwDnAreW5js+egpQA=;
 b=cseX0xlCETORd8+H77Gc7W1Ev8ghJgj2eop3yD4YWMfSkSjgG8QCBs3xczXQAKucu0UGYkr4us4Db2sqzeJEd/eTr4VHh6kzs3rMp3B/G/EK2U9irsUQW2TNfJV7/X/KiqanO3JxQ40m0m4rhymVXGb6IDRB2Fha40S6ZqDeNnLqsUye0e6OJspt26eIxftr/yImnpLCOkYOaYWHitanyUGrFVzEvtcaQu+R0uUa6KzcQZCEcpeAKVSEPIo9E5Eqdoou4YUTsWPHqsye1cenThkzwGU4sp0cERRxB3saQHCyLOqGcclk+QUG3KWSLpvX5sdED4/H/9mV+Bj50ld6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDCFzZ+doH0D8Uni3WVTvowcwVXwDnAreW5js+egpQA=;
 b=BvkwYeLDS1smtGkA1OWeO72zt2/RqYDA2hCv9ynKpO5mVbUtJS+ahNwwCVHxvZgpzaU9F9zYgYlhvNitNNNRTbhk2qUEey4KItYQQ/2b3jH83F15OcbgjCuX8f1zWuqVwhFBeO75ijJmeNlE9pxDcw9J3OO2CCR/9EJ1SkwEQ90=
Received: from DS7PR06CA0020.namprd06.prod.outlook.com (2603:10b6:8:2a::21) by
 SJ1PR10MB5956.namprd10.prod.outlook.com (2603:10b6:a03:489::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 20:22:41 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::81) by DS7PR06CA0020.outlook.office365.com
 (2603:10b6:8:2a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 20:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 20:22:39 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 14:22:39 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 14:22:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 14:22:39 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 608KMdTE3045867
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Jan 2026 14:22:39 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vdwWl-0000000AASQ-0bCO
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Jan 2026 14:22:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 2/3] u-boot: Add support for UBOOT_CONFIG_FRAGMENTS and UBOOT_FRAGMENTS
Date: Thu, 8 Jan 2026 14:22:38 -0600
Message-ID: <20260108202239.2423335-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108202239.2423335-1-reatmon@ti.com>
References: <20260108202239.2423335-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|SJ1PR10MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f04e165-dae8-4b77-5e47-08de4ef3abd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|34020700016|34070700014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DU5I5xi6Oj6a7GHPhl3zGObHTmY3SbLwyQmKeAaiOPifRAFKq7/KtMeoDz9A?=
 =?us-ascii?Q?EPylx6TgCMeVbH/PwIFd5sglEU+dqib/WsnX60Wej6UfhIgKx3deeuaLDbz1?=
 =?us-ascii?Q?0fGXZ4O5BDVIJZ0zw1fV5xPAer+mADtYisc5Ns/7f5GABZbLzojjgduSbeUN?=
 =?us-ascii?Q?QiYLsuWyyd8PyvFTl6zZyKfwL37yNwt9ng6YqcziCLJPCOJ8yOXGt+pm8BmS?=
 =?us-ascii?Q?nzzJtpKbEdw6yLsFjlh6mwGiRdy1nI82/vpMnS4/Eo2VkV91ScPo7Z8J8oob?=
 =?us-ascii?Q?OZorYp95CSsLbmi4DAMc7ljd7h2LIhaNgGYG3z92BuZA7Pi6rtKttSC+XCA5?=
 =?us-ascii?Q?LZMRjrsvornr5V7yhFnE9uTF6O8BXaisbvBCU4wPyw9OX/TQVALa9+Zwh1/6?=
 =?us-ascii?Q?8XyrnZjfpKx42MIhNUUMhfoR1HyAuoCt1gTILtlf9ozM1D5uX5zyzUSNddaZ?=
 =?us-ascii?Q?TUf3ab6TwwB+iGHa5ibQS+N4H103tWWZaB9srNHOlL2pko5dete8lbo+IR4x?=
 =?us-ascii?Q?E9boP2BAnHg2g+exftNxmyO/PeqB6iabEIkTPlMJrrORkezYeZWrVeCn1uSY?=
 =?us-ascii?Q?9HlBvqTy2DVuoiRL/h006bjJUwz6taQ4HiUyrAQc7tRLNpyg2LJWtLevVV3Z?=
 =?us-ascii?Q?MgZtGcblrS65LcsaO0+DBeZrZERgFhrPrNZR9PztH57CVdXj1+Q06exHq385?=
 =?us-ascii?Q?c64evApCQxUWYjuu2F6sMhZgIN0Gm+wzK4o8KqEG6Jy0iaHokguR74Tv9aWv?=
 =?us-ascii?Q?y8Ru6CCOJFc4Cd6AQzSlCVxvZH0UGSUtw8OhfsTjRUsKSPsprR0E3OOm3Eyn?=
 =?us-ascii?Q?Af1mb4zUOTOeBS3xUHvulmV5AHm0gIk714kWd1FyvPYhZcfPXGb/UIfu6nOm?=
 =?us-ascii?Q?hQsyu18XnU+s/tMvvBTArHQ/SPpiHjrWD77SBIspEEElQGa4tjF92zgUAIB0?=
 =?us-ascii?Q?DH9k1XiHEe8nxl2mud3rMxCEjwaH2SneQPNsozSFxWdma+bn3vTtX7wNalls?=
 =?us-ascii?Q?SWcUoh8SBm1YQ7UElJhUJHdWn2xt/RLGeUNNoUhpGCe8MKQtSkQ5aXcZyFmb?=
 =?us-ascii?Q?g2Zlh6Ry5afcFXmO6XPFTHYpRAkn5EfRHoyNiD+hUAYA2FomPXe3CHETSjLP?=
 =?us-ascii?Q?KLPrDtsrn6fNsvCyzZM8ph78VIGc5p3wn6M6WBZLz4REFwZITV1viGyO/vKW?=
 =?us-ascii?Q?EDxFYzBKKEpUBp/20G4FtAmB2WiICemd35hkUnC6S1jHtYtczpZnKL9FXXeu?=
 =?us-ascii?Q?+hBtNYSra9rOk4XSkHS78J2YpMM/GrWojlSsSQtwd0mUNPmP3u7doBE+2fee?=
 =?us-ascii?Q?Joiz8qM5/BHIN5kdH5YjmpbxWWVKxIeM+ZfcMJCCLAYFip0Xq6gjv5M4eCoY?=
 =?us-ascii?Q?jwdERAP6AB3ruJNC7LvF7cI34P6oUfsHhXhH4zPAy5f8cVh7/Dtv/EmmSuJB?=
 =?us-ascii?Q?FTW25SziKACPcn06yYfuP0B/eI2+qKxYVAXbR/L6PoMYi7muOCikOujxboys?=
 =?us-ascii?Q?076gUXcLI5AhlIqnJUypgpnz/j/4Up+QQXQDZdjgYqcMjGehiz2eDn6OT5ZB?=
 =?us-ascii?Q?potbrPCThQ2JO0bJWwE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(34020700016)(34070700014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 20:22:39.9135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f04e165-dae8-4b77-5e47-08de4ef3abd2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5956
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 20:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229087

There are config fragments that live in the u-boot source tree.
UBOOT_FRAGMENTS will globally add a set of fragments to the configure.
UBOOT_CONFIG_FRAGMENTS makes use of the overhauled config flow to add
support for specifying alternative fragments for each variation build.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-recipe/uboot-config.bbclass     | 19 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-configure.inc |  5 +++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index 715fb5c1d2..823a66157a 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -18,6 +18,8 @@
 # UBOOT_CONFIG_MAKE_OPTS[foo] =3D "FOO=3D1"
 # UBOOT_CONFIG_MAKE_OPTS[bar] =3D "BAR=3D1"
 #
+# UBOOT_CONFIG_FRAGMENTS[foo] =3D "foo.fragment"
+#
 # For more information about this, please see the official documentation.
 #
 # There is a legacy method that is still supported where some of the above
@@ -57,6 +59,7 @@ UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${UBOOT_=
VERSION}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK ?=3D "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
 UBOOT_MAKE_TARGET ?=3D "all"
 UBOOT_MAKE_OPTS ?=3D ""
+UBOOT_FRAGMENTS ?=3D ""
=20
 # Output the ELF generated. Some platforms can use the ELF file and direct=
ly
 # load it (JTAG booting, QEMU) additionally the ELF can be used for debugg=
ing
@@ -141,6 +144,8 @@ python () {
     ubootconfigbinaryflags =3D d.getVarFlags('UBOOT_CONFIG_BINARY')
     ubootconfigmakeopts =3D d.getVar('UBOOT_CONFIG_MAKE_OPTS')
     ubootconfigmakeoptsflags =3D d.getVarFlags('UBOOT_CONFIG_MAKE_OPTS')
+    ubootconfigfragments =3D d.getVar('UBOOT_CONFIG_FRAGMENTS')
+    ubootconfigfragmentsflags =3D d.getVarFlags('UBOOT_CONFIG_FRAGMENTS')
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
     ubootconfig =3D (d.getVar('UBOOT_CONFIG') or "").split()
@@ -164,6 +169,9 @@ python () {
     if ubootconfigmakeopts:
         raise bb.parse.SkipRecipe("You cannot use UBOOT_CONFIG_MAKE_OPTS a=
s a variable, you can only set flags.")
=20
+    if ubootconfigfragments:
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_CONFIG_FRAGMENTS a=
s a variable, you can only set flags.")
+
     if len(ubootconfig) > 0:
         for config in ubootconfig:
             found =3D False
@@ -220,6 +228,17 @@ python () {
             bb.debug(1, "Appending '%s' to UBOOT_CONFIG_MAKE_OPTS." % make=
_opts)
             d.appendVar('UBOOT_CONFIG_MAKE_OPTS', make_opts + " ? ")
=20
+            # Extract out any settings from UBOOT_CONFIG_FRAGMENTS[config]
+            fragments =3D ""
+            if ubootconfigfragmentsflags:
+                for f, v in ubootconfigfragmentsflags.items():
+                    if config =3D=3D f:
+                        bb.debug(1, "Staging '%s' for UBOOT_CONFIG_FRAGMEN=
TS." % v)
+                        fragments =3D v
+
+            bb.debug(1, "Appending '%s' to UBOOT_CONFIG_FRAGMENTS." % frag=
ments)
+            d.appendVar('UBOOT_CONFIG_FRAGMENTS', fragments + " ? ")
+
             # This recipe might be inherited e.g. by the kernel recipe via=
 kernel-fitimage.bbclass
             # Ensure the uboot specific menuconfig settings do not leak in=
to other recipes
             if 'u-boot' in recipename:
diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bs=
p/u-boot/u-boot-configure.inc
index 337b8ed6c3..379637e73e 100644
--- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
@@ -36,8 +36,9 @@ uboot_configure_config () {
     builddir=3D"${config}-${type}"
=20
     config_make_opts=3D$(uboot_config_get_indexed_value "${UBOOT_CONFIG_MA=
KE_OPTS}" $i)
+    config_fragments=3D$(uboot_config_get_indexed_value "${UBOOT_CONFIG_FR=
AGMENTS}" $i)
=20
-    oe_runmake -C ${S} O=3D${B}/${builddir} ${config_make_opts} ${UBOOT_MA=
KE_OPTS} ${config}
+    oe_runmake -C ${S} O=3D${B}/${builddir} ${config_make_opts} ${UBOOT_MA=
KE_OPTS} ${config} ${config_fragments} ${UBOOT_FRAGMENTS}
     if [ -n "${@' '.join(find_cfgs(d))}" ]; then
         merge_config.sh -m -O ${B}/${builddir} ${B}/${builddir}/.config ${=
@" ".join(find_cfgs(d))}
         oe_runmake -C ${S} O=3D${B}/${builddir} oldconfig
@@ -46,7 +47,7 @@ uboot_configure_config () {
=20
 uboot_configure () {
     if [ -n "${UBOOT_MACHINE}" ]; then
-        oe_runmake -C ${S} O=3D${B} ${UBOOT_MAKE_OPTS} ${UBOOT_MACHINE}
+        oe_runmake -C ${S} O=3D${B} ${UBOOT_MAKE_OPTS} ${UBOOT_MACHINE} ${=
UBOOT_FRAGMENTS}
     else
         oe_runmake -C ${S} O=3D${B} ${UBOOT_MAKE_OPTS} oldconfig
     fi
--=20
2.43.0



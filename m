Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787CEC369D3
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:12:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.102.160.18])
 by mx.groups.io with SMTP id smtpd.web11.9779.1744898735099865308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 07:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=aoR7bbho;
 spf=pass (domain: nxp.com, ip: 52.102.160.18, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OylGNjauNK8i+x8B18US6rjm5grlx0qr+LEV8t/IT4rENB5cp30x3e5+bu/XTvHv289mYLDKLcEhh2qOwnO/A/XAjqa4V0/P0ER9pkmTrhToYUUA+BnP5SDmMhAXgjUbV10rDMhnTW0SG//7kD55s/9c0P6TfarYgYV2Qm0ZKOcQbvfe8VR+hk2g0XOAzuhrPpCwSEXecpY3DqQfXb47IDex0sn9zuaw9MTBWKf6+spqjBmOcAtgjfaYNyyjgjPaRqz9gUxmNbTigRBq5BnZ3bj6sQa2kasP/PtIdY0y1e7AEZha472TY1r4MGTEpcyia054+l/z2LWt47K3vvjhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0v0khewHmlpeYl8AN2fdz+bUXCc/b68I/t/na3tlEoI=;
 b=gdcEzBcDzKsvMtGNCM/wjGeQuskPFmJvCw/IZ5NK0rxbNBH4/qNX7Do5bWvCFqw9lXKdOZiZEXyxOSBLBUlSVzxFHUYWj4sy06Ru3MNJI6iG8zCKqbBcWonHisTlztrLe0q9ypQmZBKI6PvBJEeR9XrAmadlv3nZjEMR8EWreSa64MXL70IYGENfydLfDVaryogU/BGqI/qZCt9rIhjccpFtRNYa6WTgk1GlNYazJyr47bBNEeoyUoQkoPShHcRufBhGIpYjLsWta7Qjdq2rFQWzT35XvdXSCnxkVw9FG3LSSEB2S70QvOjdt2lLj6z0kaU60aMX3xs4DNpieoy63Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=none; dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0v0khewHmlpeYl8AN2fdz+bUXCc/b68I/t/na3tlEoI=;
 b=aoR7bbholnFp+qh99QpnrWDoC0+c1/2l7a1XxQ0+YR8mOuGHYZDcfsEGddQaIylENMoRJnJNZHJIprk6okD7ngPG2xA+ZPcj4rJdH98QVnlERoQ3EVnQAk6WgUC2uIECoiF3wOOduygxh2ycxzcZrLHm/NEz6CzwPZccpcHLU7fP7imOTtLD5HdOAdCGrjXVdWSCpS6dfI/Bxj+VaWscTvmZGdpS2kG+MSZd/aXlZGHLEA0U7lQkWF1eYimNo/4gStpxTCUliBt1Wj3T+n+Efu+pnzCsEbdZ0kW8yBIggYTVUQkhuv3DBuiQuPV8EFVkb30hcW85ddYU4ADI7KOqUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 14:05:36 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 14:05:36 +0000
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v8 4/7] meson: Fix host_machine setting for native cross-file
Date: Thu, 17 Apr 2025 09:05:15 -0500
Message-Id: <20250417140518.1720796-4-user@yb20>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417140518.1720796-1-user@yb20>
References: <20250417140518.1720796-1-user@yb20>
From: 
X-ClientProxiedBy: BY5PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:180::35) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: c3cb8f1d-6c81-4c04-541a-08dd7db8ecdf
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|366016|52116014|376014|38350700014|1557600111;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7u6+7iAhQxNOC+1WNeHJWgJ3mFXzio8axSyqAliThHl4eqrmASoLvi+U7ADx?=
 =?us-ascii?Q?9haXzjUbxf4VrctPCI76AhPwX45uXIMP01qF3DyRA5RCXiocAI31KXh6H60R?=
 =?us-ascii?Q?+RSkMbqBpjuV9/xB5QjC+ZnOHm0M8ENziaWcM2lhtvwxjGOO9X9OVyuMwfO7?=
 =?us-ascii?Q?JKkIzN6+z2zMk92ne0Ut2BdLMUuifiCfUAkwPDfFSWfbuCKVHxCS++zkM79F?=
 =?us-ascii?Q?8uEa5TdkC+maF3xwmkhAsOqXAsABesculwpSQmr/+qqgVVH+9TPkQaolK33O?=
 =?us-ascii?Q?N4rzo7HxisxsjtRJBJVhOTr3OLiQqg2/bxhjEuqW827fQtPYgOGDnaZqzPrk?=
 =?us-ascii?Q?5A+SJWndS+Nd+2p4QYHgpGyDDLhBmmJOV3Po0RSeR3fxwPujHkJ9RNzERbV1?=
 =?us-ascii?Q?Aen0JhZWKHB1E/OdMTbEtNn5cIjmymRS6VewZ1xq2y5xSQWbFV2x340FUnYb?=
 =?us-ascii?Q?r3B12Naj7rGoQdIv0rNWuEPVVxs/A+eX5Pi53r6wlFWeuwAEfZAwlMgreRuY?=
 =?us-ascii?Q?L+5gCFM8TOR53J2KEHhSlZC9Z/aS2HANVMicrv2lAxDebgZ0daGCcCNFcwkS?=
 =?us-ascii?Q?B5VbdY7DGLnWuqn8Y2XyydxeW7tMnPXpsEpJ+DeumqnR5KS2HLu6jdn1GgHx?=
 =?us-ascii?Q?xsLBJ5U/G5a4styJ5Na7EO1avqEL5F1gak3Va6WPvYFED1RwuW82XKRv7j+z?=
 =?us-ascii?Q?gGjte+8suAPxRMe3JVg7DGX6CbKQxsZaIPlY07WbnRIClY6L8p/hLcQSbmUS?=
 =?us-ascii?Q?5Sx8yrn6ojZAxwBCJoUgcNpl+NhrHM0tYuqK6pvtcCF2AhdgIWgoPzRHXxN6?=
 =?us-ascii?Q?lyj4HNV12olyjz+lmwQ6VhGUwtxJRW7tFNSuu4syMA14qOkEhsmNNh/Lz7F8?=
 =?us-ascii?Q?yrqEmmSIrlciDkA7cf3AyDEa15r8/XPOQipoYNSzZ8rvfrzs5sgOxXoxWVW4?=
 =?us-ascii?Q?QG7wOjVhvmDOzoKFClhujMCoHu29JcO2LUz1lf5+jTn2hhUCP3OuaYf9y/hS?=
 =?us-ascii?Q?+6MabuqZ2Zyn5f5FmNDa5Emb//ExghRrzI/IgfFw+EeTWCrGHE23MFe/GDBv?=
 =?us-ascii?Q?E5C8pRYfqeNj7t31zeOOzn3sXICzcpa19/2ScW7J4fZJ3yX6Y1XFkhTuMHws?=
 =?us-ascii?Q?3DROogPSvs4Go/OdKHmddUWPTcQ/eN88MIHAqvvLN4zrh60C4hnk7E72nhZA?=
 =?us-ascii?Q?uLcGbahnC68rAYk58mIkyh6l/51RqcwoLYSo761DWfjSqTg2uaZb4DFHV3LP?=
 =?us-ascii?Q?KbK4n/FzBd4QMAqVZriz9/oRJRylD9norLMkYC+FnR2ZCFMD46HJV342bJs4?=
 =?us-ascii?Q?stMQQIbZqnh7KyUG98Epu+pkvaJUCY9Xk/vYMF+SbEtjaCBDmkhxJJpheaDZ?=
 =?us-ascii?Q?/vt0s2Ww5WMkOp48OH/MklqamP/PG0ndFBOinAN7Rbdyn1U/tel+YbgykZkn?=
 =?us-ascii?Q?saSMvcJ012iSEB3iqVDGsOUcWSlr2lI2PPnZxSK8FmTBbg/IYF+tP/mpt/o/?=
 =?us-ascii?Q?/7leZw3igUm0uNkns8ENoZ9NRwIIt0yYJKsNbhwk/9CkwnYCWJfWA2n3tTWx?=
 =?us-ascii?Q?P6m8pMkotQMYr4WjFO3Q7odYaDTMp1wMRyma9aq5BcSXx0T0qFMSqCR0aOGy?=
 =?us-ascii?Q?7LrvjWsS4JsSlma92bDTLFUcQ+AUOFBIXc43t9cjfFDJbgH4r6qkzj3O1UW7?=
 =?us-ascii?Q?94c712M+FXTNJ2P/ipoyyWwIdu+FedGSS4b8koyZoBfonHhAUMAEnA+PzaIE?=
 =?us-ascii?Q?REmYJx3gtqMH1pJgoapJl8nExssh+mqBHAoUhM/Xl7j+mRue9wa994+ULcfe?=
 =?us-ascii?Q?EJOio4yxxan/05Y3JsACSkBP8CPqw4muPMWmy4WdRApFKqDJNfm9gu7KX0rL?=
 =?us-ascii?Q?zvxQHiyKCcE+BBgaZv3vb9LiK4IO71GrkEYDcbErBKaHnlLdGiMoSvR1FBZA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:6;SRV:;IPV:NLI;SFV:SPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(61400799027)(366016)(52116014)(376014)(38350700014)(1557600111);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EeCSa0AXgK3epfJsh1iSFnYohcNmjIr10XF7A9h6Gp12pFxWYoE/kczW0AtE?=
 =?us-ascii?Q?kwkCMEx+L/Dex9S6PLbiEhot9Tw8OHKDMzZvTrURISoVL4KuL0JU1nNierZK?=
 =?us-ascii?Q?1lRUgEO8QZMEHW6nM56Oyg+QpcUnF6JXqp44EQGad/v/C69O/kZ0Vwvbokhe?=
 =?us-ascii?Q?N61AUY1WxsoYbpYmPtVF5vsDZbLWwSCdlj8ijpaVbVDxUl2QYQod9nEcs3u4?=
 =?us-ascii?Q?aw5QP73ltt3JBxjyqHrvlhqbPS0z2y1AMK1QXywc27p+J9kPIUobsCxSt4Rc?=
 =?us-ascii?Q?Xx8K34bJ06ZTj0JcMriMJB4y9bgzDKTT6o7TOFc32ItJ1Y3ChiJWEmQSMQ4P?=
 =?us-ascii?Q?gmYBXik5SxdtTElSdocGPq2Y92pBsRwcVh/p7vxEmvA912vC/LRIUQ1NDyg+?=
 =?us-ascii?Q?jzrbniVW2G4++2oLt17KbMf89CtAHf3++3jA+cCk7MeoMjwdWvY1/mdqo7kX?=
 =?us-ascii?Q?Td6UUvsCCnmSII5XmFJTfnim8BTPN4Cg6ZukrON3lYXQs0tu+hK3xfm+OF5x?=
 =?us-ascii?Q?weJsISh/ftN+bn9mVjl7/2pI+NxMXH65q7qI56uKrGOiaMvVs4Q9Qjo84VC9?=
 =?us-ascii?Q?OOdWn3oBl5Eegzo7UwtXBA4Yg77XEzxmt6Y6KVmocgwQNmyqPZwS8LKX3aUW?=
 =?us-ascii?Q?xWMZKeM8iLJ8rJY/LtE6OW8ZSIic2LVnE4vx3rHYj9u7w8TYDCGH5BosJxmr?=
 =?us-ascii?Q?22DCjce+gQ40GD+nTIp2PdECJIh4RL9htNXZPzF5BY8v36OO9TUQhDZMDTwl?=
 =?us-ascii?Q?iziRYZ4VDWrhfPqoAlCDbj1gcseENd1sonAy0pBmliHlyROQK3rwtr5C3Frk?=
 =?us-ascii?Q?RenYXjMGmgyBkzcI1nJy5Wd4USXoJ4QM/PHPEKq82BzX02x/FHaYUwtMpIgO?=
 =?us-ascii?Q?2twNQEBex+qE4VcDT4qZq0sGk9rjT9rci2X+T1QT1/irvla4Vg+7ppxd01sn?=
 =?us-ascii?Q?4tsPeVRFbicBX5yDX7FvUWT7uA3zIMdFGbifUuQMVwYQ+5e01MZXViuvxVUG?=
 =?us-ascii?Q?6lL0R2qlxKZxCTmPqjLeoPYg8ym3rjh+lGePMuHtCAsT/cd9QR4gve7d+qcA?=
 =?us-ascii?Q?iGjlvcMTFQssHjuqLMCa0xKWcoiuuJrLGs7YeJFAiKilrztRAlm/j+y/bC90?=
 =?us-ascii?Q?ZknA6jZp45Xp2fjNlux2L0z8Igu3J+idL8NbfWfIxh5y/5LuEEeGNoQbEDRI?=
 =?us-ascii?Q?tKgFfDsMtfFXVRLbnq/lNDYQ3ItajAff6KExR7CviJnHwmPkUq1GWUMmlQxf?=
 =?us-ascii?Q?k/hYSdytq413lrnd2tgoMofkSzNkzTnCcKtholmzv7nCbBl5434hNkC9Q7WV?=
 =?us-ascii?Q?pANb34Y6qEBa5EaBNpoko23woU8LnOkeY6bfcW6IoyDVx6bI55wR9vGZf3+q?=
 =?us-ascii?Q?IPex4DAusS9p2dI7kQ7ZPZkEdXdgME0XPc7wjUKkG78D5WoGwBzrLyRZR/iL?=
 =?us-ascii?Q?VweLsSnlm1LptXiWLqHF6Z9RlBnvuY3XNqhQ+QoQyf5QT9Qqm05aWGH+1Bk+?=
 =?us-ascii?Q?ngcNjnEB5pKQsi9QVI0yU3rnqlbBKmSAB0xFPHgNmGO5/wJIgyCyOeL4Klb9?=
 =?us-ascii?Q?bCoAD1auhyn0KmCEdW2L8N0u6ntYQTROZHPETnp5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cb8f1d-6c81-4c04-541a-08dd7db8ecdf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:05:36.0420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKORscD6ll9ruOVOQuJEEC6ksKH147ct72JiomJRgy3UfN1SKPv1oKju1ncGgBPwE1SGl3IYruXGsFEuOcfhDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215094

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


From: Tom Hochstein <tom.hochstein@oss.nxp.com>

For native and nativesdk, the meson cross-file settings for
`host_machine` are incorrectly set for the build machine, not the
"machine on which the compiled binary will run". See
https://mesonbuild.com/Cross-compilation.html.

Fixes: [YOCTO #15485]
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson_1.7.2.bb | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_1.7.2.bb b/meta/recipes-devt=
ools/meson/meson_1.7.2.bb
index 45a74612ce..7e9c661818 100644
--- a/meta/recipes-devtools/meson/meson_1.7.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.7.2.bb
@@ -107,18 +107,14 @@ needs_exe_wrapper =3D true
 sys_root =3D @OECORE_TARGET_SYSROOT

 [host_machine]
-system =3D '$host_system'
-cpu_family =3D '$host_cpu_family'
-cpu =3D '$host_cpu'
-endian =3D '$host_endian'
+system =3D @OECORE_MESON_HOST_SYSTEM
+cpu_family =3D @OECORE_MESON_HOST_CPU_FAMILY
+cpu =3D @OECORE_MESON_HOST_CPU
+endian =3D @OECORE_MESON_HOST_ENDIAN
 EOF
 }

 do_install:append:class-nativesdk() {
-    host_system=3D${SDK_OS}
-    host_cpu_family=3D${@meson_cpu_family("SDK_ARCH", d)}
-    host_cpu=3D${SDK_ARCH}
-    host_endian=3D${@meson_endian("SDK", d)}
     install_templates

     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
@@ -132,10 +128,6 @@ do_install:append:class-nativesdk() {
 FILES:${PN}:append:class-nativesdk =3D "${datadir}/meson ${SDKPATHNATIVE}"

 do_install:append:class-native() {
-    host_system=3D${HOST_OS}
-    host_cpu_family=3D${@meson_cpu_family("HOST_ARCH", d)}
-    host_cpu=3D${HOST_ARCH}
-    host_endian=3D${@meson_endian("HOST", d)}
     install_templates

     install -d ${D}${datadir}/post-relocate-setup.d
--
2.34.1



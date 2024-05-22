Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D647C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 06:53:18 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.93])
 by mx.groups.io with SMTP id smtpd.web10.3732.1716360788012022000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 23:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=b6Vt6PiO;
 spf=pass (domain: topic.nl, ip: 40.107.8.93, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEDmMODcgcRgvmhhqVFxFEnYRWswWrHlGO6RVidFkJZhB2gG3dSJXSDWddrOATPLJL7pxK11D3bLnV0NU0CByLFrEpgWac6Sh57xGEahwDKSgUNGS1H0rHpkJOZuH66l7uzriqDnft9L7g1afn2OYH8r920aizCzXITo43NHi2RDYJOYkekWo1Kr0wji03iB7xeeg3JNTBW00W/GtfD4CEhy9Jvck0z3gV2sxFxmsxlNQJAGHKwGkd+AObAcshS1/VNqZOZDtqyqNSToaQml1nVuMnbvC4eaBaiQq0wuLr+h7m+nEL11Zu9GdEICBnzG+oRHO4M3XrgvR8T8Ixmonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=235mPPQBQw13Ee+INPj8vj2h3zIwr0Q84qvp86btgUU=;
 b=GuJUD3us++kV3lq2ZvO454pITz/VEKmRkai1uXxwOVjr4PykKPwiBb1FYDRjK6vc4C9TScN/5/KjPBizHxGmXKdz7Nr0VcLSqtS5wRuE/2Hyrxt1ScOp9bxHhVPZAVdDe/2kx0sRv4t8nmnp87Q28qVgq/Kp4ryJhQYeYbvRpsNHCbVfB9aOxw5Wm3+MhsJFp4aRi9OshEaTwjrH4h2h3IDV+4CAw7qatINn45m4wkL03lAxqeWQoly9PCp/jhG8qtvifSJWvC7BduCgff+y22EgG70Ezlejn1gP91REYj+z4FPE5YSPs3oGg/Ok9XWssLZAyvTxjmVEmaWJtSJINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=235mPPQBQw13Ee+INPj8vj2h3zIwr0Q84qvp86btgUU=;
 b=b6Vt6PiOh/dWy3mBVdEtxX5QdcCh0QMWjyMZFmLUBrE8Gh5o32LZXUv+sCqyOCof/FD7Qir3WdRYianRjrxdSFszWpSPGBp7hfZ3E6EnkDYeFAXINzkUpeeJ7o3gBgsHfkimGr9pwAX04jiuORXVBJREaA/+dzrNPIpHjDdhXePT+ZqWiow4/dx/+On82hxdHezYti7xZsbUw80urZQ9H2f0R3Jnq+1ivZNNNZnMXAtA4zXPwpBvCx4RUOaiCrow7cFNGg6zdXIiXXS76v/cmfWcFirqtld2Xtjj0OCMDht/nrHv0/N0YWD7cYeoYc2G+lcuTJJjHMWCKM+TGmAcHA==
Received: from AS9PR05CA0211.eurprd05.prod.outlook.com (2603:10a6:20b:494::13)
 by AS8PR04MB9143.eurprd04.prod.outlook.com (2603:10a6:20b:44a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 06:53:03 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:494:cafe::cc) by AS9PR05CA0211.outlook.office365.com
 (2603:10a6:20b:494::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Wed, 22 May 2024 06:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 06:53:02 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (104.47.11.40) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 22 May 2024 06:53:02 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PA2PR04MB10214.eurprd04.prod.outlook.com (2603:10a6:102:404::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 06:52:59 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%4]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 06:52:58 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
CC: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2] meta: uboot-config: Fix broken menuconfig for "fitImage" kernel
Date: Wed, 22 May 2024 08:52:22 +0200
Message-ID: <20240522065222.1479499-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0153.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::22) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|PA2PR04MB10214:EE_|AMS0EPF000001A0:EE_|AS8PR04MB9143:EE_
X-MS-Office365-Filtering-Correlation-Id: cb20a655-bff2-4eb4-ab18-08dc7a2bd384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|376005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?zdf6UGO+RpQlmHufDiljN9zXfuHdwW40KBRNQL3arLclRe1FCF/VdcKakNUN?=
 =?us-ascii?Q?FJgw2GdroFDW8+zPrifDy2en9GY8AqhBtaqlUq79La+/crsje6uBgqhQJmRr?=
 =?us-ascii?Q?ZjVqn7bZ07NeHXRXMIM7b+uZU9AH5GWE8v6e5VmL6liuWLK7oieMNObPxv5l?=
 =?us-ascii?Q?vcVMNGHDCJDuYcRn9GTsd3jIpvxMhMpbipRePLIeTs2lIsGzjhkOnWqh2Pn5?=
 =?us-ascii?Q?4veO2Up61Lw8bsmn4Gmt71f2Vm4qTEqAVQItZfnQI09XYGn6TNu0P7A1ydKm?=
 =?us-ascii?Q?Mc6xNRenE736ZSSmkdpq9plmJ1y3/l8fJGgbc84OqV9cibqXib4bFBjcIDeK?=
 =?us-ascii?Q?4B94wVzX0XlikObwkO6LG0b6pv89C02UnEcSvFIt24lYTSuxtXRl4FfQHTTg?=
 =?us-ascii?Q?Vl7hWcj/cuw9iq1uAkEzMQ0lrwuZEX+H3rMRQfjcYEbx8Hm+ruzPCebn17IE?=
 =?us-ascii?Q?Q3+lFETdMYNaXIi30GfsnUown97Ja7t26NEdZz3fdNJw0IS13EJ9KnF8jRkU?=
 =?us-ascii?Q?vJX9txci6lwK87VO3i92yvjn840+YbCKeuUU2SdfyUK9VqM9OSsYG5WLeayT?=
 =?us-ascii?Q?OTeHkSR8WwZXXTvbKulBrCoA+PkWNJ2cEoWHKQTSMUv1+rscXhcKb7k86Oi5?=
 =?us-ascii?Q?a3P7bduHrljDdVAacfiObJA0zmHnTVDqSJC0ImaRz9kfjJguWeAOmlSIsDAy?=
 =?us-ascii?Q?QV/5tqjTa5OHBzSG001prdZLhCOKCyA3Ddtxdj3Kkm5DpeBIQIRNJeTM4rgy?=
 =?us-ascii?Q?YS35hgwLI64bey9GIWcHIT0EEIkUjgBwVx/G/Z2yl65bPFO5AtZtHZQD8zPs?=
 =?us-ascii?Q?Y/I+PKBTmylir3Dq5ISgA9v1ByW8RrCMWb2WqgHcxS38PZd5FqGLU/gWYseK?=
 =?us-ascii?Q?JColc0BXgpWm5HkGsCl2r26ZhY7S86geNZJk7ExlQkSEN0yt9TokfYQAeBlJ?=
 =?us-ascii?Q?JOrPhyE3rgokViN+gKR8autNreCTaa6cHXHb5/T+SK2swenrF1ELlhbqVxcB?=
 =?us-ascii?Q?E4jBjkd36thT1UyEIRCU3n/xoK+q4T0fS9Ce9DXryJyDDq2ly2KdkquOj8Yf?=
 =?us-ascii?Q?48hGAzzQOZyrsNjeDnImWtqxUJQX11E/YmJzQj/Pz9C8xw3qIK5UVxVKvQuJ?=
 =?us-ascii?Q?krWu2XOUayPXDy2KgCFzUtC+pBINN8LHuMR8TAu6MuQwpmkpOI6dk/jk+Zeo?=
 =?us-ascii?Q?uYonWnH139+xcFrY4ozKU5G2QDkTsGcHUgN8AJnb6zh+c8iWaX+G8CI2KKXD?=
 =?us-ascii?Q?cmMLMPE4B+EPlsm/NQ1IOKhhSImeYANdslPZXgkJMmSwug5vaNhEU3ML+HTk?=
 =?us-ascii?Q?LrKbrnyeUqAo1IrBsg+gxZif0ec9Ben4a8GjAOFaU2j8jg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10214
X-CodeTwo-MessageID: ed567337-9527-4ccd-ab30-25acc538a1d1.20240522065301@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.1a7bc4dc-70e3-4a7f-b2b4-84e6b0130c4c@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	84719e3e-6b52-4e09-99b8-08dc7a2bd100
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vRtDJ6WpC0YsaRwH8n6YejC3LIiWuoWtMBLnmGVPcFaH+60rfADMZ1TbuVYS?=
 =?us-ascii?Q?L00sXhxfGsgq9Mpgd8mGQe7M9ThoA3seEfbkR240arH9RLNeiT9ultcoQZU6?=
 =?us-ascii?Q?spAHBBJORm5YR71VUUX7uajCtZqV/nbNU1q8/h1VeCdRHHbhjslTds4f0V3B?=
 =?us-ascii?Q?B+D4X9vyUFcF5jaeT0hl42INYQXVvRTsgIeZgFVp+myyTKZcyq8r/JHUs5IW?=
 =?us-ascii?Q?JldwH2ZZNwwnteY7ZlsQI3C32pxYD5ZGKBt4oO4T88vsMph491VsYLqTUXQc?=
 =?us-ascii?Q?8DFLu+zRKMJauJ0YfEwTYyw1EruDh0EOy1H/YmKgSyv/XlLP2fPCtAnnbGij?=
 =?us-ascii?Q?ow2rlv+b4nvDnNyj1rK0/q258d9BkvGKgRx69e1KwP9Pp+BJEyDBde9cfZGg?=
 =?us-ascii?Q?MvMjiLIEuNXJle2aLsSad1J6spuDMtb7QCzuKIqXPCQ1ivwdFICKsXc9ccQ1?=
 =?us-ascii?Q?IqfNcs12vxByLS29NA52NVY7niGyqnCGZgYHjr6GyrRAzKSWwo3orDyIwzwD?=
 =?us-ascii?Q?hyMyLzurrXFyYsEQ4DgCRNFaiP9ViKdRw7vNYcutR5S2h5NwaEQwg79IN1Uo?=
 =?us-ascii?Q?0zzA5peL46xQvq0/ETlX1foo7vRUMz96lkrorpJWD6+h6xYDnvkJ7WqQMHGq?=
 =?us-ascii?Q?FANP4FYn5eD64aTIrTxmqFd75ciNNMS2lCZOopiGZxBkCDEh1lhVBE+v1uVJ?=
 =?us-ascii?Q?6Wc2EsW3qLQ5as6QwxTkfNM/GJOJIWDWX8ohNzDfL2yZgllCtj9yW90zpq/T?=
 =?us-ascii?Q?3bVyD/EqMb/IixdFJ7+9jiBLRZUhxbC4ICtatE6wNDtNkHQ0ye+rzohyShUF?=
 =?us-ascii?Q?zKOHGEGX8zjFUrOS/jof3TyhGDyFV8xOsKSe2YiH4ON1sd+iKGJYkFujcBZX?=
 =?us-ascii?Q?jtj7FI2Gatr8j+T9EvP8g+R13c+SwToCVwsvqH4h9X7rMcNH6sptEdXGUmdA?=
 =?us-ascii?Q?0oeVGJVoq9FSsRAlu+sRSHozam17O2RYD9DghDeG+M9lNGLW63DJZaP+vN7e?=
 =?us-ascii?Q?4SJoVAIZtn+OSNmYL3ysaLgi3k/BtYI5FZ0DKG4ung8jh8B7mPcBzFNibEni?=
 =?us-ascii?Q?T0qcv7IkELsdw9dShsHhH01v4hmPpvx5mVAfDyPOJcrZRaRKzzat9XUvhsQ0?=
 =?us-ascii?Q?SkRyFfpqQtJsoA/QBAUw93bUAny8GQ5rWQFAeOlZqa6vfIcXhCAAiewoENp6?=
 =?us-ascii?Q?JY1fF2xgu/uyx4TyJMp8dsxDdGMo8gdXQgagNzcQc+iRgvhdocQUStxsOKdb?=
 =?us-ascii?Q?idLejk+IUNb47UNgJK7suaU1vqU+Ec0GENnSfl33LmMbajQ+YmdkLGWTzj87?=
 =?us-ascii?Q?Kq4xjUW62b2buT/pMc0/s52A?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005)(35042699013);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 06:53:02.9387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb20a655-bff2-4eb4-ab18-08dc7a2bd384
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 06:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199689

kernel-fitimage inherited uboot-config, which resulted in failure to
run "menuconfig" on a system that has both multiple u-boot configs and
wants a fitImage kernel.

Fix the issue by splitting up uboot-config into conf/uboot.conf that
only contains the "harmless" variable settings, and require that in a
new uboot-config class which contains the Python code to do the U-boot
specific settings. Require only conf/uboot.conf in kernel-fitimage so
that it has what it needs but doesn't break.

Fixes: f9e834e31788 "meta: introduce KCONFIG_CONFIG_ENABLE_MENUCONFIG"
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes-recipe/kernel-fitimage.bbclass |  3 +-
 meta/classes-recipe/uboot-config.bbclass    | 80 +------------------
 meta/conf/uboot.conf                        | 88 +++++++++++++++++++++
 3 files changed, 91 insertions(+), 80 deletions(-)
 create mode 100644 meta/conf/uboot.conf

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 4b74ddc201..b941609cc5 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -4,7 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit kernel-uboot kernel-artifact-names uboot-config
+inherit kernel-uboot kernel-artifact-names
+require conf/uboot.conf
=20
 def get_fit_replacement_type(d):
     kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or ""
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index e55fc38b7c..bfa9af7f49 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -13,85 +13,7 @@
 #
 # SPDX-License-Identifier: MIT
=20
-
-def removesuffix(s, suffix):
-    if suffix and s.endswith(suffix):
-        return s[:-len(suffix)]
-    return s
-
-UBOOT_ENTRYPOINT ?=3D "20008000"
-UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
-
-# Some versions of u-boot use .bin and others use .img.  By default use .b=
in
-# but enable individual recipes to change this value.
-UBOOT_SUFFIX ??=3D "bin"
-UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
-UBOOT_BINARYNAME ?=3D "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}"
-UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFI=
X}"
-UBOOT_SYMLINK ?=3D "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
-UBOOT_MAKE_TARGET ?=3D "all"
-
-# Output the ELF generated. Some platforms can use the ELF file and direct=
ly
-# load it (JTAG booting, QEMU) additionally the ELF can be used for debugg=
ing
-# purposes.
-UBOOT_ELF ?=3D ""
-UBOOT_ELF_SUFFIX ?=3D "elf"
-UBOOT_ELF_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
-UBOOT_ELF_BINARY ?=3D "u-boot.${UBOOT_ELF_SUFFIX}"
-UBOOT_ELF_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
-
-# Some versions of u-boot build an SPL (Second Program Loader) image that
-# should be packaged along with the u-boot binary as well as placed in the
-# deploy directory.  For those versions they can set the following variabl=
es
-# to allow packaging the SPL.
-SPL_SUFFIX ?=3D ""
-SPL_BINARY ?=3D ""
-SPL_DELIMITER  ?=3D "${@'.' if d.getVar("SPL_SUFFIX") else ''}"
-SPL_BINARYFILE ?=3D "${@os.path.basename(d.getVar("SPL_BINARY"))}"
-SPL_BINARYNAME ?=3D "${@removesuffix(d.getVar("SPL_BINARYFILE"), "." + d.g=
etVar("SPL_SUFFIX"))}"
-SPL_IMAGE ?=3D "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}${SPL_DELIMITER}${=
SPL_SUFFIX}"
-SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}${SPL_DELIMITER}${SPL_SUFFIX=
}"
-
-# Additional environment variables or a script can be installed alongside
-# u-boot to be used automatically on boot.  This file, typically 'uEnv.txt=
'
-# or 'boot.scr', should be packaged along with u-boot as well as placed in=
 the
-# deploy directory.  Machine configurations needing one of these files sho=
uld
-# include it in the SRC_URI and set the UBOOT_ENV parameter.
-UBOOT_ENV_SUFFIX ?=3D "txt"
-UBOOT_ENV ?=3D ""
-UBOOT_ENV_SRC_SUFFIX ?=3D "cmd"
-UBOOT_ENV_SRC ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
-UBOOT_ENV_BINARY ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
-UBOOT_ENV_IMAGE ?=3D "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFF=
IX}"
-UBOOT_ENV_SYMLINK ?=3D "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
-
-# U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux.c=
onf
-# to find EXTLINUX conf file.
-UBOOT_EXTLINUX_INSTALL_DIR ?=3D "/boot/extlinux"
-UBOOT_EXTLINUX_CONF_NAME ?=3D "extlinux.conf"
-UBOOT_EXTLINUX_SYMLINK ?=3D "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
-
-# Options for the device tree compiler passed to mkimage '-D' feature:
-UBOOT_MKIMAGE_DTCOPTS ??=3D ""
-SPL_MKIMAGE_DTCOPTS ??=3D ""
-
-# mkimage command
-UBOOT_MKIMAGE ?=3D "uboot-mkimage"
-UBOOT_MKIMAGE_SIGN ?=3D "${UBOOT_MKIMAGE}"
-
-# Signature activation - this requires KERNEL_IMAGETYPE =3D "fitImage"
-UBOOT_SIGN_ENABLE ?=3D "0"
-
-# Arguments passed to mkimage for signing
-UBOOT_MKIMAGE_SIGN_ARGS ?=3D ""
-SPL_MKIMAGE_SIGN_ARGS ?=3D ""
-
-# Options to deploy the u-boot device tree
-UBOOT_DTB ?=3D ""
-UBOOT_DTB_BINARY ??=3D ""
-
-# uboot-fit_check_sign command
-UBOOT_FIT_CHECK_SIGN ?=3D "uboot-fit_check_sign"
+require conf/uboot.conf
=20
 python () {
     ubootmachine =3D d.getVar("UBOOT_MACHINE")
diff --git a/meta/conf/uboot.conf b/meta/conf/uboot.conf
new file mode 100644
index 0000000000..7e17d49d20
--- /dev/null
+++ b/meta/conf/uboot.conf
@@ -0,0 +1,88 @@
+# Handle U-Boot config for a machine
+#
+# The format to specify it, in the machine, is:
+#
+# UBOOT_CONFIG ??=3D <default>
+# UBOOT_CONFIG[foo] =3D "config,images,binary"
+#
+# or
+#
+# UBOOT_MACHINE =3D "config"
+#
+# Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
+#
+# SPDX-License-Identifier: MIT
+
+UBOOT_ENTRYPOINT ?=3D "20008000"
+UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
+
+# Some versions of u-boot use .bin and others use .img.  By default use .b=
in
+# but enable individual recipes to change this value.
+UBOOT_SUFFIX ??=3D "bin"
+UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
+UBOOT_BINARYNAME ?=3D "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}"
+UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFI=
X}"
+UBOOT_SYMLINK ?=3D "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
+UBOOT_MAKE_TARGET ?=3D "all"
+
+# Output the ELF generated. Some platforms can use the ELF file and direct=
ly
+# load it (JTAG booting, QEMU) additionally the ELF can be used for debugg=
ing
+# purposes.
+UBOOT_ELF ?=3D ""
+UBOOT_ELF_SUFFIX ?=3D "elf"
+UBOOT_ELF_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
+UBOOT_ELF_BINARY ?=3D "u-boot.${UBOOT_ELF_SUFFIX}"
+UBOOT_ELF_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
+
+# Some versions of u-boot build an SPL (Second Program Loader) image that
+# should be packaged along with the u-boot binary as well as placed in the
+# deploy directory.  For those versions they can set the following variabl=
es
+# to allow packaging the SPL.
+SPL_SUFFIX ?=3D ""
+SPL_BINARY ?=3D ""
+SPL_DELIMITER  ?=3D "${@'.' if d.getVar("SPL_SUFFIX") else ''}"
+SPL_BINARYFILE ?=3D "${@os.path.basename(d.getVar("SPL_BINARY"))}"
+SPL_BINARYNAME ?=3D "${@d.getVar("SPL_BINARYFILE").removesuffix("." + d.ge=
tVar("SPL_SUFFIX"))}"
+SPL_IMAGE ?=3D "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}${SPL_DELIMITER}${=
SPL_SUFFIX}"
+SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}${SPL_DELIMITER}${SPL_SUFFIX=
}"
+
+# Additional environment variables or a script can be installed alongside
+# u-boot to be used automatically on boot.  This file, typically 'uEnv.txt=
'
+# or 'boot.scr', should be packaged along with u-boot as well as placed in=
 the
+# deploy directory.  Machine configurations needing one of these files sho=
uld
+# include it in the SRC_URI and set the UBOOT_ENV parameter.
+UBOOT_ENV_SUFFIX ?=3D "txt"
+UBOOT_ENV ?=3D ""
+UBOOT_ENV_SRC_SUFFIX ?=3D "cmd"
+UBOOT_ENV_SRC ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
+UBOOT_ENV_BINARY ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
+UBOOT_ENV_IMAGE ?=3D "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFF=
IX}"
+UBOOT_ENV_SYMLINK ?=3D "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
+
+# U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux.c=
onf
+# to find EXTLINUX conf file.
+UBOOT_EXTLINUX_INSTALL_DIR ?=3D "/boot/extlinux"
+UBOOT_EXTLINUX_CONF_NAME ?=3D "extlinux.conf"
+UBOOT_EXTLINUX_SYMLINK ?=3D "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
+
+# Options for the device tree compiler passed to mkimage '-D' feature:
+UBOOT_MKIMAGE_DTCOPTS ??=3D ""
+SPL_MKIMAGE_DTCOPTS ??=3D ""
+
+# mkimage command
+UBOOT_MKIMAGE ?=3D "uboot-mkimage"
+UBOOT_MKIMAGE_SIGN ?=3D "${UBOOT_MKIMAGE}"
+
+# Signature activation - this requires KERNEL_IMAGETYPE =3D "fitImage"
+UBOOT_SIGN_ENABLE ?=3D "0"
+
+# Arguments passed to mkimage for signing
+UBOOT_MKIMAGE_SIGN_ARGS ?=3D ""
+SPL_MKIMAGE_SIGN_ARGS ?=3D ""
+
+# Options to deploy the u-boot device tree
+UBOOT_DTB ?=3D ""
+UBOOT_DTB_BINARY ??=3D ""
+
+# uboot-fit_check_sign command
+UBOOT_FIT_CHECK_SIGN ?=3D "uboot-fit_check_sign"
--=20
2.34.1


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=


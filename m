Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A515C36014
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 20:02:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web11.3390.1743192114318143811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 13:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=ooLigbyV;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.61, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iA5tjYx5jqtTdYtxecQhxuzNt7qOF2HE6/wxnyXok00Cf6h2ru+Jknokc7MFiaWVo4NACHsBuAiK6bD2BreCQDxMw6ZiIomjAs/WqO/P76FyX6Py+9V/8K7rP/z2WOxIyM1xegk0U0iTIKTvmHYAs589H5duSf0IP0Uj+lpWF7MGyYdnWRWWkAUC4FlnP7HGLyc1rUEsl+OW9/p7whN3hnnReAK6+Fy+InUi5/wK07x7uol97Z5bdYwlayLeA5ud6YVmM/bYAmoLmoF4w3v+QyUDZhxFuyV+4dS01j0/yPcFaLfQh10eJnlSGugk4ZghP4Sm+CM3vusqYVAogbqY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXXaWQs3x0G4iwLoIDj9LRgAX5yk8i55GFw28Sp3168=;
 b=BCEGgNBkB3GJRuyGM2iuSRMEt9dmOUKgbrO6Md6HCV74rU/g0irsF1sjX93bIsm4Aw76iPMOrDX7LqvrAhmQYI2C6/VNRBf8IgBjRp218hbzsep935ECw4YF02S6ymnVM1lZSCEcQlHVd4KKJm1+MnpBWCaIxskbHm55fU3wRcVRnXXlkrskZWos6UNTRZNgUapIljL6BZ0HuWlNU5FHxYqPgHjQy723vLn7mAMjhkOcFC0knV7RLWOapb5a3uP6MrxEH1UaPpQzj17fnsRjhnfQs5zI1F5SDgPnIdNsXF3Vohu4xE5rYgANANP2w5o4KgNLMCjc10fCIyq0ll2ZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXXaWQs3x0G4iwLoIDj9LRgAX5yk8i55GFw28Sp3168=;
 b=ooLigbyVSXyj9tOEkid8kAF7GClfCrDw1wchhkmkWb9oMzF72H407KBZVlKy6sJ0iX0lsfUJIiTB+gcFskkGxKPogdT4FZpvZIis2in+D0Mpau1QC76GoKmwUFsfLIY8uqyitdW1f1F4LG4OaNcoOzVhsu0Oy7fgh/hmwateAZV3NW2MjQjyyXgCs2e8EVMuHdSCU/qYot9OxoqUwjcIQhE4JtoHbafOLmVtqSjEVi12ViA1U3LiBMSeekCgkmVcoguTbtYcKHvpU0/AhW8Fb1+MmifeKnNOqDwwZgUAnK3zOMBj8Dr4jPm3wHZwIUQBWnuIOdK4Df8nTCbD/rv2Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB8741.eurprd04.prod.outlook.com (2603:10a6:10:2df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 20:01:53 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Fri, 28 Mar 2025
 20:01:53 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v2 3/4] meson: Fix host_machine setting for native cross-file
Date: Fri, 28 Mar 2025 15:01:24 -0500
Message-ID: <20250328200125.1051797-3-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328200125.1051797-1-tom.hochstein@oss.nxp.com>
References: <20250328200125.1051797-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU2PR04MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: edbea10a-4723-44f2-32ba-08dd6e33627c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rAIELwti0u53Y8PEaPtAemtUZNLlpqllKpzfoiftFpK2+o3sugCyC3rjQ4d+?=
 =?us-ascii?Q?IxyH57UwNeJ8OrW9UQvdCYp/IaQ3Yep+ukN3lSz0UC2KnuutRj+rdu7++uFx?=
 =?us-ascii?Q?38bgqYVcPFaxP3Y4NU8x05l2uFGMmT3tm6BukYc2WDuUimU/rqtuWjNWKgib?=
 =?us-ascii?Q?BwW7VYztyyg3p5CvGidrNVPsDhl28IRLVeS1t+XSHTHdczOgF3wYn5c41NVA?=
 =?us-ascii?Q?QY5jpDFO065XazXHhClIDPhgxR8z6zYuMK4T/K6ok5s0PeXCKvwwkCKWCns/?=
 =?us-ascii?Q?UAArV20WydyLQYvcslVzG1A1kg1uJPFIJ6ft3r83zNK/wP15KEWIdjOEQ6su?=
 =?us-ascii?Q?bJP7yuchjawu1ooQPr+9fEoGKNGkNHwAmpVb2Cr9NBbnzvKzhJeMp1HvL3Ot?=
 =?us-ascii?Q?kgFTz1VZaiYIC5lrmvQD2++l0y8hT905pIvIgaYhFo7VKU5eWRUIECFe/6JT?=
 =?us-ascii?Q?Z9itFZ+gTKuthaK0jco+FPM79u4hS8+i5lXQYeeD2xgPUSOm0CFL45Ah7m76?=
 =?us-ascii?Q?QV+4sGlaKA03sFyFj7zESLrisW0eQ6rd91ULG7Cri3+c3kD+jnwDbf7LSF8y?=
 =?us-ascii?Q?D2SmLpcJvq76txPKdmin1RWCG+Lb0fnEZl8JYAviqNdSDEvZ3pYdc8UIHtzm?=
 =?us-ascii?Q?mVGAaoZWYa0K5L4lSCrNCAJjfWIXLLjvU7jgr5HKTwqj7+I2e2FE6QbAReDg?=
 =?us-ascii?Q?XsCdl3W8IeywumXEQfhMpoeOq5ZnmOgEoswCoj6UJPQZjGfoEI3s3QHGSoeB?=
 =?us-ascii?Q?MSZKg2TOQh3lbAJyLRG81CMX816aE3xmsuRZ/8n4zjpCcRD+r6B+C8O02qNZ?=
 =?us-ascii?Q?3GKkmDC/Yi0J0/aG2zPMN01tR0QtCZBSxLXX21nilRSiFl/xnq7ZMB7+QztI?=
 =?us-ascii?Q?zPHnq/sQQkPCvAizhX/soFZlfVpRow1AkxVpoFEouam5mUhEs0ds7M782dWH?=
 =?us-ascii?Q?n3oIr9kU5soSk9qQdBdkWu7szJNsVJLoxW1VR0tuvVWN7XYNXsdhEzP1UbLk?=
 =?us-ascii?Q?H0jYvqiIcdA+QUvGH1qHCulwVAzH7+gvetEl/wYGFcFpjkSlxBQI8ftBNC0z?=
 =?us-ascii?Q?Nfq7yfQtwUxiyi9j12Nt5POgQK+F2VlsVhZ2YS2J4YznpDc+gMnNugBJqSno?=
 =?us-ascii?Q?Kecfs754W3RfF3JfbkwefEJ6+/9q8JziN1wwPEvYR6q826e9XKxKDv7uZRkg?=
 =?us-ascii?Q?4tqCrX6dR/BwTc8UxA5LitgnygGj4RMRfFh5zSgm3tZATxcyMghkIouSxMq2?=
 =?us-ascii?Q?zjiX8xMC51jagOrgbcwtEcBMccMkgyUJIGjt/AbzIALaxhH4m2O34qEiel4U?=
 =?us-ascii?Q?weIf+aMrqmEP+FZe4jUnAjSd94FWs743G7kH4IJgb4lAG0oulOisHkreeqX9?=
 =?us-ascii?Q?pnam3Qv9+/78DUo6pyBPX+KyztH7Od7PS8LbCVB3g7yVpIJLeossjZP3iaN6?=
 =?us-ascii?Q?K6bj2y6RmRU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MPi9tQd7Yd3f3zVJKxmPdLJps4syQwbjL4Dk09NcAdlHpWal2fz6cAJnuigN?=
 =?us-ascii?Q?ZSnCNpy+6UtAVpDecHCVBUi4yVc6VNj6D6TsD6Kc+dNvyIpgbl5zbdWER3VX?=
 =?us-ascii?Q?hr3XYdPkWAmgA+nrE3XQCqO9Vrk/1yjrBDfCoRwY515quA4zVa0pGUaodRk1?=
 =?us-ascii?Q?80RxeI4rkihboLYZacIKMeyK6AsgqdlYJGO3KnkSbWMLTHEMaSsAMdxb2Dxd?=
 =?us-ascii?Q?k+MTnflyETIV2qINhhvUNCVkopjmEqrd9F0soedapDXNdgFwkfgT/kTN9dt2?=
 =?us-ascii?Q?WOpCdd4P4cTtYO2K62cHAOpy8XGRTHO5JxH8wpw+Q2Rq8/l6/QmlqAefRd7A?=
 =?us-ascii?Q?2r343I9NP6a8E/uAaSLWJqkZnsu7HWyOdDjN0uI2YqNbGgIBBYF/OTX/Gh/k?=
 =?us-ascii?Q?epinCdbGKasDOOVu9wq6A6PZ4c2TraSxIcP3Ex+yaK9XhRcYKCGFz5oWMLBF?=
 =?us-ascii?Q?3tTekQPKrK3dHDhmJeiz/1SsfBZLsS/v/oh2zGMsWZJZflTXYurrWqm3cRld?=
 =?us-ascii?Q?+JvaudKNLR6UYH0hJPrgGq4IMz7p8Hj5q3eGGayQwcry+JwxVxl0E2A87TOT?=
 =?us-ascii?Q?jOzJ/NmiW1gaoSyQLRU3wWFW6AnMKuPFYeWh1qxypAGLsIMuqDUzZ1eYRq/S?=
 =?us-ascii?Q?vtLvTHSpoWclxC5cxPlsp7dskaMkY0lMGLJGwlueSsihYAZzszFW1VSB0OYz?=
 =?us-ascii?Q?QMBVcw3guQSmGWIPYGav/PXf4SlNcDLxvkLM9zlA/vL7Dk2MGagTxyh+UDmh?=
 =?us-ascii?Q?sDyMftusrZyGs/hoXjVMHqsmW99OUgtvxLil+je+sCrB4Dedpb2yMiUQzmGR?=
 =?us-ascii?Q?3X7UVvaiLpXHgES1ycxiJtp9cYM6RHbQpwmNAL14vYbmp0Wej8tKQofWdvnC?=
 =?us-ascii?Q?6f316fr/EE29neSh8fqk8npcfkJAOuzZ+m1wrkdJ9s+e0ZNQZ57P3MfnldO/?=
 =?us-ascii?Q?141BYXB3IgKHCbrmvn3k/atWn7gxZ7e3td9y006igz4xP9/mPDJZd+Uov29T?=
 =?us-ascii?Q?Y1eVWbB5cIHXg0Ay4wSLRSfskFjqXq7h2rudZS+HxaH75H2z+NQMfJnpPtny?=
 =?us-ascii?Q?izHQyUYT7zLfPmvxxJTgCsahg1Cl3YZQoLSBzf0CM7aGXtbBmqu29auOe+GR?=
 =?us-ascii?Q?Z3t0sxrrc69qvkJ+d5Zy5O2++gEC31vEh1sDQyEqlUPh1uWASXcuVTbN4QB6?=
 =?us-ascii?Q?Yhu8sUu2CCUfNhXL5cgKMzped0nn/hSqgKJdvGptFvxyWTUe8VYzjlP9nUWK?=
 =?us-ascii?Q?Nka1ENKniGMXTHbRYgRG+eOQOpc/tGUMrxdLAujD1ZqF+r+QdYaTUk64wOaP?=
 =?us-ascii?Q?p7ClagOIA9T9j2uB9/UHILDnrUoON6fN3O5iH1do6VWWxC9vlrDAFVh1UB6K?=
 =?us-ascii?Q?Sl6NReqQLrZD+jbKmdd1bemhm8GAX9uPtRnXRKK3w3hXdv6PqgXkr3yK61ZG?=
 =?us-ascii?Q?EO/BOxPXPl2u0tbUGfgdYDx5ND52FaDyFNBA6x5ccpIxkkMh8ygBNN1TzIG9?=
 =?us-ascii?Q?BdYeMmHwqrMgqIWl/5NSLyZZb88aDh8cqqWWG40SZG1q3Y3sKqDYbwNqZNpN?=
 =?us-ascii?Q?htcGuAyLIv8zMPU04kMER+mjIaZahGIltPOjnILp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbea10a-4723-44f2-32ba-08dd6e33627c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 20:01:53.2530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ke4LqR60CydDHBxQLzwMSx1QSTok6ZPtmeK437sK9o2ujQbawYXNAbsjuCP6/QUw5ZWIIIV5KhnCYXTWvl1FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8741
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213868

For native and nativesdk, the meson cross-file settings for
`host_machine` are incorrectly set for the build machine, not the
"machine on which the compiled binary will run". See
https://mesonbuild.com/Cross-compilation.html.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson_1.7.0.bb | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_1.7.0.bb b/meta/recipes-devt=
ools/meson/meson_1.7.0.bb
index 44872a5f7b..1017298509 100644
--- a/meta/recipes-devtools/meson/meson_1.7.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.7.0.bb
@@ -118,18 +118,14 @@ needs_exe_wrapper =3D true
 sys_root =3D @OECORE_TARGET_SYSROOT
=20
 [host_machine]
-system =3D '$host_system'
-cpu_family =3D '$host_cpu_family'
-cpu =3D '$host_cpu'
-endian =3D '$host_endian'
+system =3D @OECORE_TARGET_MESON_HOST_SYSTEM
+cpu_family =3D @OECORE_TARGET_MESON_HOST_CPU_FAMILY
+cpu =3D @OECORE_TARGET_MESON_HOST_CPU
+endian =3D @OECORE_TARGET_MESON_HOST_ENDIAN
 EOF
 }
=20
 do_install:append:class-nativesdk() {
-    host_system=3D${SDK_OS}
-    host_cpu_family=3D${@meson_cpu_family("SDK_ARCH", d)}
-    host_cpu=3D${SDK_ARCH}
-    host_endian=3D${@meson_endian("SDK", d)}
     install_templates
=20
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
@@ -143,10 +139,6 @@ do_install:append:class-nativesdk() {
 FILES:${PN}:append:class-nativesdk =3D "${datadir}/meson ${SDKPATHNATIVE}"
=20
 do_install:append:class-native() {
-    host_system=3D${HOST_OS}
-    host_cpu_family=3D${@meson_cpu_family("HOST_ARCH", d)}
-    host_cpu=3D${HOST_ARCH}
-    host_endian=3D${@meson_endian("HOST", d)}
     install_templates
=20
     install -d ${D}${datadir}/post-relocate-setup.d
--=20
2.34.1



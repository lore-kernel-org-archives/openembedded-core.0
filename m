Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D963DC36014
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 18:09:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.web10.15946.1743271751020567932
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 11:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=yAoV5iCd;
 spf=pass (domain: oss.nxp.com, ip: 40.107.130.3, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egP8z7Y2tDhUVorvhI78cjukvCHUMRFq55zrWasTHw7ji0gSuPzNld+56I3LdyKOhilsGt9LdzNMoYWeC3gFlNw6HJnbgdVG+rPci42ENxxJ+RD2pdq882oY7yukf1m2mzddqEeoJCFsOd/PuK47uPO36el4Teq2HwqUCe2OCQNzdGyXw5lVa2NNMiZkOFDv08IYUpMnTjs4Rw38I3UyeB6hVoYD0OHwzED+yTDGAESq7wpZ7Gg3Rp6jSiu9hSN5CQlxOu5OQSdyGfSyUjpaYOgFzsX1yww4MvJXqBVVOkDK+TungAoT5+lLCUnFRIMcf0DY3p7KX66oMAzDsPnYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc9rrSXfPpMfcWVDxZpVzzUoF3Tgh0SR1tW89AfE1rE=;
 b=jxlspsJBttkQ8N+dhghT09v/7TtKQITct2iHofew4GS02cKJmWUa2ChGC/bBYEjz5XL/wo9/n/tUsWOAMaFY/p78J6r2Y5Y5Ks2HOEoyDimRsJuLN8/KJ9P/xVGFMt26WerNW759E7yu6t6eptvbEmL4llFjgMtyEvNEQggqckPeg4LJ1ctS0xObB5rZ5KcvW5uyGkN8BKJsgHpqOOfYKdKvKzQkW05XsvjIYkbf4PY1bOtb2a6O9r74IJjN41F0xRm3gWrWX3VVBTcgi76bcpqlfX6qNpbqyHnhqq4lQOvWniieD7Batvt92n8EQbDB6cRiDCAFUFjM/iVL0sDQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mc9rrSXfPpMfcWVDxZpVzzUoF3Tgh0SR1tW89AfE1rE=;
 b=yAoV5iCdqo+MXYSpuRBRzMtzg4wYwD3JAzZjzvqDW4uu3V5zxGVccAwTChSj8F6Eu9sM6Plxd9fEXNsf2Fuhq9YMLHcmN5SridzPShqopOuzuPRWy87HLu7+J1sWaDw23LrlvmPVwBdBin38DMaXrZbZO4f1kjryZbulur17bXA1ZfH9FGZeS/G3PNXAAVmpKn09kHtsOrooMYa2O1DaSDFRd/HcTLU27aiZ0tq0MwHnRtPRCRUyrb4azBJJVB6H4mxAL8M+zGLK4GOjuuRce9zslmvNOHg8z0l7v3Cx5pBHw7u4nSRqR4ZvNjgwlEZEauoC3TaGAGI7weqqJvgpVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU0PR04MB9394.eurprd04.prod.outlook.com (2603:10a6:10:359::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sat, 29 Mar
 2025 18:09:07 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 18:09:07 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v3 1/4] toolchain-scripts: Export meson settings for SDK builds
Date: Sat, 29 Mar 2025 13:08:50 -0500
Message-ID: <20250329180853.1057381-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU0PR04MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f453473-2ea5-4d3a-588e-08dd6eeccbe9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IL36hY70yrcfdif6vk9oI1h5uZECXmnRx1toKtA12jZBYG/dGSLNzEaZw+kC?=
 =?us-ascii?Q?X1C3YMzpq1lTRuZRynDq4jN8QuX/4Q6B2AJWUDhSs5fUOOY5PQ+kInRZyvRN?=
 =?us-ascii?Q?nacBPI7QxGnR1hfK6rdjM/NANzzXfz0wRP5hFeq4d+ehoofbo4TVm7Fm4FF0?=
 =?us-ascii?Q?owwKicYoqxw7lZc4GRv1vYwd4WCia3jlJYl5/Fssj3+Z4EoLJie8qPnNqqTT?=
 =?us-ascii?Q?IrM4cNN66L6aKmBOnx1wHmYkQnPq5Fap+wuQjfOrUhhM6tOaANbs/jNDQ4Rl?=
 =?us-ascii?Q?HJ7qAlElPein4mr0JNjzMiuQ3DqlOl0almBCfgozJjVnx21UTq5gCTFn06nD?=
 =?us-ascii?Q?BGkQWF6w2XW0sy/nwb8boiyyGQX21CGf6Ly3gSXFZOr425gZ0uKPeLjbnuWJ?=
 =?us-ascii?Q?O+YlvKiz3+laMDogKNNd1dJKaSIknPhvxszCOpPvs13Ks66Kh3LFNNyN7gDH?=
 =?us-ascii?Q?Ph9wpzbgmlv5ezumtBR8QEqJg+Kqxzc/iyd19hbe5TDgdIfl6oXZAsoKUcUH?=
 =?us-ascii?Q?9iceLYOSw7WGDXiqSIP3InC1gCx8kj7PwexzjkXV5fYDibrd0ffyOBn+dqU8?=
 =?us-ascii?Q?qu9Zu/Cj4paYnb1hbzyXn27bm1cu5USauxTteTmHsyuzO9nB2dNzhfdxSiOZ?=
 =?us-ascii?Q?ZWXGqQC5EjK9VUs2UFOlt7ySKxw7O+36htzl9EINDYEkgnJ5GjZ7WWDOKhyp?=
 =?us-ascii?Q?fnKfKbLkdPipqKWuTim6sZDZCQGUaOp+ZfhtFpCUcGky2+y+cmTCqn8mJvkn?=
 =?us-ascii?Q?1qffmmejImrcWLmTAIllElClYdtDm0vBc0Ko3kKJ4nrBHEjSjlX3eY6eTtIo?=
 =?us-ascii?Q?IjfPky0klMqnYK43rVBp1u8wcJ0MFrmrbVIjg8jjfBBAjHHRN3mo6MWcjO4y?=
 =?us-ascii?Q?8cN2VLbdCXxstCJJU2xiGtfmmzmutJLyuMFSUhGlNz2ZFjbzWfsYNDjtwpE9?=
 =?us-ascii?Q?kEN50lheb2chbDKBp3Ql8FtPM+IEjtdkQa5qhEeQ6eaRChnlHhPetK5/SfY9?=
 =?us-ascii?Q?OFL/f3e2ilfv3f8q70IY7nTvgVLWGAIVoQQTl7OzCtIjyj0xywFtEBiQuZuS?=
 =?us-ascii?Q?DFtEYswAkENsP+LUMDPgpFQuDklaQtWSJd1N7piaqyTQKoaQsdc86z51hAQ0?=
 =?us-ascii?Q?YjbBuAoC8Z9WfVZBmOKFzpVruot8Yc3utQu7ozn+6xDQa1PjQs9wxTmzNxSo?=
 =?us-ascii?Q?QYu9E4z6lAQYOC7fMa4IL5lND/6ApD0djwlVsMgtTwaNUKCCfUHrYnAre2dX?=
 =?us-ascii?Q?XZLGf+pPaZGNpgaqP7m++qkNIP+I4WJovWVqWjPc1g0Cfmfbfla+Enx3m7AA?=
 =?us-ascii?Q?2MUk4yS8yfp7aXYvtoKk/WimMhQ7dg8vZsIUzG256/rLrKCLPqkCIvfFQLXH?=
 =?us-ascii?Q?fd5W08HeMOL43hiYzuYIixTLT4qjcakyjUe7toWcw6jEpf2s/g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f6QJcoRgZIRne+2vPS8mBy+3ADxdFqPNVNfC6W0lK8NKqLsHqCZUdcifR4Tu?=
 =?us-ascii?Q?QSHbBVxN73HGh7J3XNscQbTabqWXG22BVU6nCnydltok1kPEo1xG6T8WKY7v?=
 =?us-ascii?Q?4G523c/YPbn1fw2QbH8qpp150Hglt6mJD5Ckm5Cf67GbPRFF7f0+H7vZQHu4?=
 =?us-ascii?Q?ZG9xb58QpC07v93gk0r2doikeKW9yqjcLD5Vhi0qPfW30LOznK2iFRiNtt+S?=
 =?us-ascii?Q?VuwQvluuOiO6mR2DlMLf5V0LrhX6WT2JLnauE8m/G6Zfapc+nUysp2GiTGtk?=
 =?us-ascii?Q?A7xihSy8lw65ogBauWOb+8fMFpFQ67l6dVZCsETnelxO4ep4T+5d2Hy00tJF?=
 =?us-ascii?Q?XHw8E/G4EnFjIoBeZtFB5GDRhcATK0DcPupwUreyLyKBFS3un8cpQIV6CchI?=
 =?us-ascii?Q?2DuFuTj7LUivMCYfqiqWaVMG5UJaFOMp50bulsFU34g33b86hnKppU4dwxLF?=
 =?us-ascii?Q?rhZu4k4VJvCJkKXUaP5fCxbuz/uCGoceHRxZzdyAyVDM6YmzeeZ7NXM+WIow?=
 =?us-ascii?Q?X8NqEOOl/R3cr0qCCNsyA2n46d/Xzd3WM16sI9DWE6zoJn9T3Am7xl8PYAfe?=
 =?us-ascii?Q?6fy/areOM7fm5nhA3vmIb0q2i2Mcmb4TeQXGAGR3NRTwplpGDMdBF8F7Pvfm?=
 =?us-ascii?Q?T1OnIRKoviMCx1TQ/rYudPD0KrkTEepakbC8G8HtN7jwgFdm9Dr26O1xcSAT?=
 =?us-ascii?Q?aPmSXUflKeiqGS1ZI0dZeA6eD2m2bqukUNNFRZfvo5xLYHjpxGA8zH02X1Zc?=
 =?us-ascii?Q?MWUkRY6VC5Sx8q4TSYZ4Zh4F2aR7Y15JLuv18hg5BrzeePdV6BrMZC9vul92?=
 =?us-ascii?Q?HkRCPoNJ/LVQJa4xT70o4ig6AZHcCgapsI9dmFBjBCzwNq2Az9vAL19Zxgdd?=
 =?us-ascii?Q?DlNLJfFs/f9OYq1JDd0TAzGb5OOJcYM/nN05SXcZSgEQQvFDJlj9Zwla0BhT?=
 =?us-ascii?Q?ddiAzkoEDcFFPFjsJ2+ubbiHDXm5dZl/u2TQqjtK2O3GHOuZtb5+p27UWlnW?=
 =?us-ascii?Q?JfAnM1ZYK5elDh4OfIEXMrSBlL9orNDNr3fR0wyfBkWMcBMSdK3ENj5+P2qX?=
 =?us-ascii?Q?gQrNTX+413qYWEL+vl18oHXjo6vkQc6FEyR+EuHYDqdbib7ZqW2h1OriaRhT?=
 =?us-ascii?Q?fUjO0Cp1y0mxDVzZ7JNSo4lUNXYdpSsMRp4HZJ3Rx87r+OHklCFmXbLtbgoU?=
 =?us-ascii?Q?9LS5qywsbiSqp4jlh9AZ+T1e9eOPWVibg3zXetVn/4g4enj3Wfx6Icc2vDOA?=
 =?us-ascii?Q?HVYUJ6fHpOQwpC0CPM2BTY8Oej/Osd1OXg3R4Ga5hfWW5xQJz02u51uhft6C?=
 =?us-ascii?Q?/gTb0LK+9xUTflKKf4p0RM5snRJebPidK8S1oRE2A6+fKwKpnFWX8JSCzPIq?=
 =?us-ascii?Q?ScxyN/zsxCzRHwTTP4HTCrbmeCkks1b4fPekaLNVUGKbf22/S7iHrKsV5yV4?=
 =?us-ascii?Q?sxrKZ6+jWODjc+bBsjf94u7jojUrs+9YhQFrGPcUTwiAoZebw9EwvWSMmjYM?=
 =?us-ascii?Q?LJu4mHhUZLY/9btnqhmjS5duxUd4FcTxSvzrdOMNiTWIZzH3otxIp7oeStr3?=
 =?us-ascii?Q?9br8sLGzQNgPH39WrvjRzALJWIpFuyaevDmeA00K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f453473-2ea5-4d3a-588e-08dd6eeccbe9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 18:09:07.0750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcNXVglatowrBY0JsZ/W28KtIzQyK3jTw43C+dX6m0+RgVG3xYgurv6u6NbtOIq/lslGj6J/eoqQTeKyddp4sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 18:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213889

Create a new set of exports for the Meson `host_machine` cross settings.
This allows the target cross file to be created correctly from
meson.cross.template and aligns with meson.bbclass.

Note, one might think that HOST_OS and HOST_ARCH would be appropriate as
inputs here, aligning nicely with the Meson naming. That turns out to be
incorrect since the script is generated in a nativesdk build with
HOST_OS and HOST_ARCH set for the "build machine", not the "host
machine", using the Meson terminology. See
https://mesonbuild.com/Cross-compilation.html.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index b59a295abc..e54685e965 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit toolchain-scripts-base siteinfo kernel-arch
+inherit toolchain-scripts-base siteinfo kernel-arch meson-routines
=20
 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because =
it
 # doesn't always match our expectations... but we default to the stock val=
ue
@@ -72,6 +72,10 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
 	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
 	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
+	echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system('TARGE=
T_OS', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('TARGET_=
ARCH', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', d)}"' =
>>$script
=20
 	echo 'unset command_not_found_handle' >> $script
=20
--=20
2.34.1



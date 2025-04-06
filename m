Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BC3C369A2
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 16:49:42 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.40])
 by mx.groups.io with SMTP id smtpd.web11.28094.1743958180083281429
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 09:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Ax3XVIEN;
 spf=pass (domain: oss.nxp.com, ip: 40.107.103.40, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axKt4IMxtySKozP0ORjut+yHWEtISL+UBJ3fKxcqXbKWdcxR+hLzB5+RiktQ/s9vedAKLfcCAE/QaTS3DWAnKerjOdDDF+OgOF89JbXa6MDUm/9tWndr3bB+T6TPIVZ4vEqxJ93LS7uUVK6l+UF+psMA97zKeztYgpxoi3Fh/VkNIFOWOieRpHaM03x3vy6/0MK/Kt0yDECl2sSx7cF3YRCuSlYv2x6Rb7vOW2RTSlkoiM+VDOE1HebCQBoxbwSAjo8G1rhIKwjYnV9jewF01IhEbtzabzL27Z90ppnd+nw5TaDPJ07ZZLT3/yp3DslYy7EwiPzvRcyOCU3PLKexaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN2bkbn0SV6FjesfBQ3SCHkxhA34PhUiX9xw2V3bCSA=;
 b=eYp1nqeZoHdBcr+NBQwuEmK/ZYrvYNWwjJGc6dMM1VzhrGfg+/ZftGeiFyLhIP/G6H7K9925Myc4NVD/qEY2eTyGSEcYMZTxenuFQohrCJ4KVVsdOFphX6Iba3VOnHCKdomZZTp97i/Pvl9NsZLbkhh8suS3iyqaKqN9rRUBbl60/RO0zLfqZKfrmOVeeFTPujYe968maw9Wm34oOlzkAJa4jYNzL0LxTpDU3AWylb1V728IGX2nfPb/gAcvgQ1WaBrnuKMKTnAcos5fO9tC8Dd4RbxkUXCOBRYDieDrzVBKGAG61Fr1wYAD9QK39JhfMT9kasdIK8qbFkvyJdyumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN2bkbn0SV6FjesfBQ3SCHkxhA34PhUiX9xw2V3bCSA=;
 b=Ax3XVIENp3tF6ImOsSMWuwPKqBv7nnJ6xaNK/0gdFL+fOS6fp0PC8HHkF0nu68nSadAfuGRPEqpqcbfc9aOFg7v9j6ST4BCWTh4Ms9kZY7kMrlBY1bion13VW4fT4v5KSfXCmCEAbE9j5PXJ4gD0PQ/pUtFJhuaPxZggxashlk7ca2RCPQsDluO12T2nAfxt+1UtJPHpg4IgepLY+bPo2sT11xJTRAI9NLqtUayH0Zv3H+1zMZOLl6Bk49Iv2tjuiZzsUiRTNunkD3miW+QYx2HYzVw4QJJEVBHTrd5/vC8yVeQp+M3nkNXCahxlVPKGMyl9mhAeeMZk/mXsrcrIMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PA4PR04MB8030.eurprd04.prod.outlook.com (2603:10a6:102:cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 6 Apr
 2025 16:49:35 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.029; Sun, 6 Apr 2025
 16:49:35 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v4 2/5] toolchain-scripts: Export meson settings for SDK builds
Date: Sun,  6 Apr 2025 11:49:06 -0500
Message-ID: <20250406164909.270945-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250406164909.270945-1-tom.hochstein@oss.nxp.com>
References: <20250406164909.270945-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PA4PR04MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: 0469fd28-9d34-45db-4093-08dd752b0322
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JAE8mnpXjIMxjqZRuko+VSn7p4pgWlSSjR2WR4XghAb9nKlVtEwVOrWKb0/w?=
 =?us-ascii?Q?CKPh5Tx7x/U13IaNhIh2NfTpZUlbvbMAnyZQSdKVlXwnKCLt+f2If2jJbEeG?=
 =?us-ascii?Q?8PWp+YJRjcrd1zDD6ghCMxslbKpRZmNWtwsiqLoYkY0hIa645qrvswcnl9+K?=
 =?us-ascii?Q?wUrA9gjmESl1PWS+mMXJNDAzRTbVD8GjA5E4hWt438GxVbMUwm3r0OnXpmkA?=
 =?us-ascii?Q?YbgOegHz4rBcpCDUxCDmQ5YAuIIYUgy2ddcBWeHwwlbPWfma/h/htmpIkmUS?=
 =?us-ascii?Q?hmNG8clPAWj4acMxQrmibWoPOXVfjLnQZp7aiZqtbvushovm7a0+FAq7AzJV?=
 =?us-ascii?Q?VoSkHV6EHpSVHwmWuD63uAcCP9IOKtIkpO6OBfXH+QvQml7Rfe6bnu31S2J/?=
 =?us-ascii?Q?E9yNfT5e3Gh+iVyXT2t0a6S1sVrxCZw6jMTD4cNwknx5vA6BrwvDXOMIsqtT?=
 =?us-ascii?Q?MJQNdJYT0hwzXaGB0LIfNnjZc6kU1eGCVr4hulGVfre/jveQPMQcoFA0k6D7?=
 =?us-ascii?Q?XNk+WUKxHSNIYm5AVO0B+EPDl9DClMvgHTVQSBrPsKBtsF9OdV3MefTqHI9A?=
 =?us-ascii?Q?iUpPYdT+Lsldmmw4SMZ9aujzIWQoUIo9oS0ZRcGgi9fl86TlCaxVnQLJ9+fg?=
 =?us-ascii?Q?5MJmEqGdT+OTpj9EofCttK7Nffgp60MR9kz0vdC1xZLKBWyn0XusRg+7dAv1?=
 =?us-ascii?Q?c9aYRnV7D4sscIOuVW4vTXs3j2RHTEDF3G0mVr6PCrsrU4PfTGD0SUgPhMkD?=
 =?us-ascii?Q?RrU4FS9YvXhbQE9GSsV2L/8UEcZnm65Mbvx8bud0EXW8dPmV5olgikjhpU7b?=
 =?us-ascii?Q?/+Me5SIr25sOAUFhngzOmjQue+6hEbUYG3lFv03MXtmpaS0bM6sTxaEm1zoP?=
 =?us-ascii?Q?jAcbMEVfsS0Xghvcgy5tPu4rHKe42u4UhpJ0vZOazM9wVa8ZGcjlxyMn7kDi?=
 =?us-ascii?Q?SlrlPjHp5EvYq/ztPbI7ADZx2so+MZ1Gv5F/Q1Koxjn7L0mjBG9I5uXZM6x+?=
 =?us-ascii?Q?HfvQrSkYWKQG7ZUoviTdk9e8wcPDXBZ59sB/gKVnPoI7iKF+JEhbEBrj6jGZ?=
 =?us-ascii?Q?9kC0MYmsTqvPqRo4aeCt4qxd2BMZ56n1OWFEM+LC2l4qi7mHfE1KsCS4TcDS?=
 =?us-ascii?Q?epvfikJyewMBej39gTQNnTqrP/auFbMHooo7ivGjKa4OsfDnzG9ObZQBVjHF?=
 =?us-ascii?Q?xaOl+/i8o3yhJ23MMx1NbnxVQ2cS4OyXTO9d2JsItd9T0Sqx8FV3vg5YFMvq?=
 =?us-ascii?Q?4znp8NvFdlaFeqtBZk0IIp2RI1eisfnWc+i8VdwYeL0ZKU02IdhZBJHN7c+z?=
 =?us-ascii?Q?WB3LxErF6S5uUaGJ8m6PdffnwzxW1R5yXT+ARtxJ7BarQ5m3IQX/IdN+M5hK?=
 =?us-ascii?Q?pnA1sNF1/t8GZhNeeadj4VkbVR0h?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oZq8ImGHhy2oIT01N5hNtzNh6QLWwRznQW6Gq2iE+gjTtp8U1AI5bMknesJB?=
 =?us-ascii?Q?Ib503YZ/gUdS/Pqr/iG4CdHuVOS6FCSHuD7C/iNByzgEHPu0/MIzZzNBpdiJ?=
 =?us-ascii?Q?bYaqInbKSATMa/F6aClNW59aDC5VJHIBONUDbHCns0wn1P2Q4DGKV48KgXdV?=
 =?us-ascii?Q?IgPDjoyPcK9NhyDrfWMM84R1uj/oXewFJ5znPd8HI9RZHYDLby5byL+ZX8om?=
 =?us-ascii?Q?kpM37Mi/suQMssdNRiHvIBIeucydAgATFRL/eckEHWjaRiTPHtJhmHdSyYBf?=
 =?us-ascii?Q?/QziNOV+n+hiRSFS81+S3/sF9Aznp7VkAOflP/pg5ec33TmzN1oJNKi7WH5v?=
 =?us-ascii?Q?KNuHRIym0NNqJfrbrf7Ws6vx7j6icftLmpL/MIymGu71mhYuqDJXdHRi3HER?=
 =?us-ascii?Q?FH6GBQc1gjUBzCqJKW12MMb+Qnafkx/SXnIlHUE5T3MELuezQx9mGGfnLT62?=
 =?us-ascii?Q?cEHGH1xpGF6+AtEGwloUCIkg40ZJ9xFJf/KIO3vswaLoyaEOu6M3w/Scsjb6?=
 =?us-ascii?Q?UCc+Hw2Qa+ogCmRjGU8yMw7hH6J8XekNYhcTtKLBRo7u88TtZ05lvrKptj7w?=
 =?us-ascii?Q?/JMXWQzdL5BXrU/eugTATat7G5My+9l2CuGurT19QYKzgAvNKpc+ZGIlRxFJ?=
 =?us-ascii?Q?/R+NPMLaGegMd7F5LaUJystS55N3/j4V6Mtrv/jzrU/WxeF34uBx6BS9hAPe?=
 =?us-ascii?Q?wHViPRC71+tXDvhbpa6sfL/K9vCyoqdFnvTZfrZrNxaawkVCQ/tDfS1iX5vz?=
 =?us-ascii?Q?4Zh6c4+3nzd3CS4gVW5wi1lcC/bsMbSx6HVHyWXOXJmkYj/injgSsBbxWVqU?=
 =?us-ascii?Q?4owsylVLPgxnGf0HfEvPXUgGpn6WJg8w4//7rHjW/ir9gCugYLZZs46ra0ku?=
 =?us-ascii?Q?caNhRK1kJTjZwerjZSd/Q+6I8YB8eSWK2cASZP5hEcKHnxmQ1Kb2d/iSAlpR?=
 =?us-ascii?Q?/cabHfsakpqT0q08oWQv++YNvLyyIDGtDTnaKDSkosByxl7slD6ZouMxOsyh?=
 =?us-ascii?Q?8LUYYRADpUaaZAoO5vxuhVPoiTiiyiyJ21V5fyUuUmnFkLj3hosyL/I2k1qf?=
 =?us-ascii?Q?2u/wAdvNHVulMzzNv+HMVea+XSFi0waIsCZhntLLO4XIxNbvACbqZ0qe4XdU?=
 =?us-ascii?Q?N5OjFpQaW6kdorE2T6m24+rcPKKDg3SCsIglr2taFlrfrS8T35Umj0u28xVJ?=
 =?us-ascii?Q?pA3Ar5FqqSxEw4lm343lHOXHNCTOnSEe0tUjnL/Y3MLRPXYnM/xgnLq+egPN?=
 =?us-ascii?Q?9hKiOmVB1DUqiikKdpdvePWlTDo0eyj7nk7SIabLXfzQs5XBF9M12LBkwzVl?=
 =?us-ascii?Q?IB87mP7SU5CI+RIqv/PW0qzQilQoLV/9EhGCz0QqiRzw3YwQqA03aVe4ffdo?=
 =?us-ascii?Q?X603sZ4DFwR7ct/Nm7zL1lzxUloNI3HOiCcR1bEXg9hkmTehpapc4IPh8L63?=
 =?us-ascii?Q?RYbdjR54Jth8K3HBsd/9rkNIJsM+SlYPKbiVIGv7FSzpmvRb+pFJpTSNaxYg?=
 =?us-ascii?Q?pP3JNowdyM1/4nAV5VlxtDRnG/P85gbS+EbaD+cduFDfNgj0NK31K6d4q8gy?=
 =?us-ascii?Q?IPq1WkdqRSqtp1YfaqEtI8GOJvypAI45vdpf8xdn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0469fd28-9d34-45db-4093-08dd752b0322
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 16:49:35.4665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65HiLDXIRpjCfo1gtxd0PAlcrEMkaMvbRXzwg3MHyT2wiaR1PNwpfEFJgCQ3dXXzmK48ZmQ4sow2263d1qyEpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 16:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214383

Create a new set of exports for the Meson `host_machine` cross settings.
This allows the target cross file to be created correctly from
meson.cross.template and aligns with meson.bbclass.

Note, one might think that HOST_OS and HOST_ARCH would be appropriate as
inputs here, aligning nicely with the Meson naming. That turns out to be
incorrect since the script is generated in a native/nativesdk build with
HOST_OS and HOST_ARCH set for the "build machine", not the "host
machine", using the Meson terminology. See
https://mesonbuild.com/Cross-compilation.html.

Fixes: [YOCTO #15485]
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index 9e4320f876..3053cd0f1f 100644
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
@@ -101,6 +105,10 @@ toolchain_create_tree_env_script () {
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
 	toolchain_shared_env_script
=20
--=20
2.34.1



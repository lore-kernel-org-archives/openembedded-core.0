Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9FBC369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:12:58 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [52.102.179.63])
 by mx.groups.io with SMTP id smtpd.web11.9448.1744898022627447438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 06:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=vg/VB7x+;
 spf=pass (domain: nxp.com, ip: 52.102.179.63, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pElRwUpn/qYu8ZvDTaLvM20ygQMU9GV3fSVcGWdaUIhnQpcSro24bpj9elaGhPg5xQ5S29NUsGOCWgvC+YDYO+rfr19JxtZs8eLTIS4TRTvR+QnssLMqAYb4NcBVK4rGu11l5uQywVWPQaBcN8kXsFZs1xDVeld0hg8P8usPo6kYbG0npgPlBZj5A/vcMJTayeaAbnN6seTrsn1eTcDc19GwBw9BCQacIFc3iLVQRAPNLbFH8a2OUPfOPZJ6BtW4MdeMXDlNiOLlt9QmAD4gD00SV17WRp8pti93h5Jpz8qWatRM7x5xAVEWLPbw2cGQV6IDTJaAmWy/Z0drbXW0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAmSflRw1m65cJV1LziKtxY4qyjZvS4rJ3Mw+adQTFU=;
 b=jfiKmkdbR5jg16lHvrcXEDqYDkjuv93LbXyX7NT5+id0EcmyHGgGzhFHjXfMmB9rN4B2HWgk1tNzCSs5PzS7sb0qPQSjTucKH6B6f4wLph4oz6HHZ86BKnfJhg7X1tCCFK3F5B3EcquLSIo8guDbgu2P2W7EpCp3JaCRMQpIhIVMrHGsHTu0x8cBRS6M9STG2tgGKGG93RyrfGxnp2w7anIFEoqybvFH/BWmBys2qCgdBTIjZroiGfjOrLtFweKhm6msFqJ8ZW+VzUGGnngysGUoob0zt6c4JYqvBfs+e9sSPMcTFyjKW7M6acWmd5ut1ZnapPcVTwGyYqz1zBvlVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=none; dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAmSflRw1m65cJV1LziKtxY4qyjZvS4rJ3Mw+adQTFU=;
 b=vg/VB7x+L7/ASyMe0Zg1pKh1S6up7o2+zZU6vpWMnRlClN3/KNiSjdpuReR1tyw0Lvlor/1bw0CQPj2RCF2o9zYkU344Nnc1+tFcxYHd9hW36Wrz4F32GfTOVrFheBEZQjdS4xn3pqRGJkJTqVwnwyu5SLTLbJLeT1YQNKOurpIDj22C8rgmcpIFNTnT53lFqr1wvsFlg2MSZGaEgddCpDfTRPhxEMMMqhjyGQ1Dw66KieAnsDiAf1OSgsjk3TfLOdED8BxSvjMxGyowui1HxLu2OwKuiCdFE0MOsp6OJo4SDXLReseQ4/ntqupH8XwbGqWbmMfLQXDHxlCt+5/F+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10319.eurprd04.prod.outlook.com (2603:10a6:800:231::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.37; Thu, 17 Apr
 2025 13:53:40 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 13:53:40 +0000
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 2/7] toolchain-scripts: Add Meson settings for Yocto build SDK
Date: Thu, 17 Apr 2025 08:52:44 -0500
Message-Id: <20250417135249.1720715-2-user@yb20>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417135249.1720715-1-user@yb20>
References: <20250417135249.1720715-1-user@yb20>
From: 
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10319:EE_
X-MS-Office365-Filtering-Correlation-Id: b5216129-0c7f-4eb1-9e9e-08dd7db74232
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|52116014|366016|38350700014|1557600111;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?96//Xz5IfILp0Zhpyue2c9E+kpdKTYHUL79P6OE7/2N6wsuVzDnGhaE7AkeT?=
 =?us-ascii?Q?qk++2jTo++tZmckD08klthk2cUsVg692bDpFFWG2TWPI73RWQ2d2/ZsJYQ6i?=
 =?us-ascii?Q?Ui/5DmXhQUuPawPkWKb5BtCCc+Qd/jSZ8EYuZwbcBQITIZuujxQoi2VJ8qZC?=
 =?us-ascii?Q?rLaA8JACALNKYoGnMrMki1KRbev1Oy0oqVnV5mr8mblr6NHYfqSdzQfs9mj2?=
 =?us-ascii?Q?pJ7EcG2lFihLFD7lLAOSN11YE+dX2cyjIJS0kTraTlJEylXglbCPpEvKHudA?=
 =?us-ascii?Q?QLbIuYrXc1bkYZtC9Z7hXHOeBWPC8KWyPLuO2YGLdSz1Sz3C4tud71PkMVcB?=
 =?us-ascii?Q?uIWxRsZse5lAA+RhP81xED1F72f0ZjTVmGZYA2ePJy98d3f03xHSfQVIpYE8?=
 =?us-ascii?Q?/2i4ShUSAszxIda//rFP07wmjsDiqM/8+5E2Irw+kyzPeAptCDavGZvlKFfe?=
 =?us-ascii?Q?k9j6k1+Xmgq3mPNqjknyVhVP28lP9Wkd6KMJdwifJy+ESzZy7qv/L+RDsPlY?=
 =?us-ascii?Q?gzpcBD5bHaI/JWVKiaxn/ydcF5ajmm0YbHbONLIR1APETL1FfjPdlP+AnGBc?=
 =?us-ascii?Q?RNuB2xkb1fvhhwyMIz6PYcL9X+vnXczCSr9wbLJD0pgIUlp8FtA2UQpz6T2i?=
 =?us-ascii?Q?9Jn7m4R8+1pi5bgpPOwkrNh+6gRv5g4IiAu/ADQ7yjQUubEjEhor+aqXajz/?=
 =?us-ascii?Q?tL60k56GWdJyNsvYeO+yUtq7MYkVyELlos2hXrNAQZ2lU6g9krPVVQBDh8DW?=
 =?us-ascii?Q?6AwCgCmC5B6JGyT79fMxxRNZMFqhz7BIVJRERRhqIYwvVX8rerY0pvcyu9Om?=
 =?us-ascii?Q?/c4OZ4OLxBI/AbS2rKXhylejlooc/iDdrsP+hazOAEvoWPJRcHwEtEbbxvew?=
 =?us-ascii?Q?TO+F89otLHlmQuiepi3XlirnVx9/d0RZsn5ShWCmevuc+Nh5b3zDCX1CVX2b?=
 =?us-ascii?Q?2M9usDAgLBfwx2hNOgzz4+hXvJM7XVCG+ggyKTsA8sPjjCfaD+QxlNeon6gK?=
 =?us-ascii?Q?t1gH3dX1zKAVBl6LCtUbcWn3KHAEV9t3x3jjaCtlc8hIUJTj7HVz3qNvzUvT?=
 =?us-ascii?Q?qt/ld6hDyZRiAS2KozWY7sdsTQgEAaXgc+zQbIz5tYVhILT7/f4zB88DS89h?=
 =?us-ascii?Q?ih3LLYCAUpOfScqhdeOxyZLx5wsbB6UlJF4sdElu1ATdScAvp3ue+CxqAtOt?=
 =?us-ascii?Q?VbcbbX9aprrdssiGDL0PqUznE3GuR+Ti2rI+pR12qq0ECEyOULrvnQVZAKpR?=
 =?us-ascii?Q?l/suG95vtXl4EP+vcb/LHYyh3syuZl5jI1/b253DRZvTpOn5IUyyMK8N4Dim?=
 =?us-ascii?Q?ZdK3tJjZiQFo4p0sP0kOIg6MY7RfycBqnY63El0cSdp2knRGuSHIDfVCybca?=
 =?us-ascii?Q?HFimHJ/tdG2JjGIju2eQXO+Xk/96FL/VvkDIFjdMs0B6cmfDfDM0E66Jz4OK?=
 =?us-ascii?Q?KBwo4fONpkLYk8Nwy3dJCNgXNUIS8w8AEzwi0qeh8yFuZGdDoKeCNQx+brED?=
 =?us-ascii?Q?Y+fIV55cWLQYppc2y/Z3djCBozsdJjVKwRk7mC7ln6fDeisj6XB6O3OvDIMY?=
 =?us-ascii?Q?yqojVzu6BGQ+gnyuFRVX0aThNEjiC1tZwl+TXznVXQOYiCMQaRxo2HhAx75A?=
 =?us-ascii?Q?dUBKeHkVBIlCAqTLAA37F3Bny66oxg25qCJh974vKKtuthUMRpSlzKXsV5p9?=
 =?us-ascii?Q?+ZgkixfPNDxUOP1fElKXFkROWxHaZXUs6YyEDSUGFaUc6XPFi1NT5AaJyP6v?=
 =?us-ascii?Q?4ut0X2NvtIvsKKrmGFcx6Mbs9ZYwkQLWpa6rXCuuyb5yznFFIPT6HtkX/T4J?=
 =?us-ascii?Q?aoTEBGV/2nM/SDX/nZgyg4IWxRZt4QOxg6LGqoizduzSNNNB33+0OK2G+V4G?=
 =?us-ascii?Q?sjMYGE9NE4cuSfrTYNfe2KBv0gTd636nTrgKxu5dq3wKL3lHxpsK0IC/OSuG?=
 =?us-ascii?Q?/Hnb5wPcS4ogwbyWgdpT/v/KzyIc3GQSqEA3A9DzAkYNv6sUbdX3nN9h7KGq?=
 =?us-ascii?Q?Z4mG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:6;SRV:;IPV:NLI;SFV:SPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(376014)(61400799027)(52116014)(366016)(38350700014)(1557600111);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?prewMu1VyVpsxUJHzeN4z+5eqnOv1WZA5ivxdv5n4K1RiyLl1lK9rRywKooe?=
 =?us-ascii?Q?ysZjsNTle2nRoW2lsaKxttoEfGhoqcjpV8Oh6BZs2+bGFgD8zlW3lUH63Fd4?=
 =?us-ascii?Q?mXyU2NKkLZHeQ87nDx3Cdwe/l8n7BEWoydktD4+rxyj3v3K7L1yrUMvZenW9?=
 =?us-ascii?Q?EU2HRKnuEzRJWCU+gzOf1FAiZNoHCx3Bgrm3UZRwQtJOk4wLx38FCmr7s3wB?=
 =?us-ascii?Q?Cw3uI2kUnQkvkZaQtXJo/2S3DkZ3oU0lSiqiOsr68CRBe5fzja2FTyF+6ujm?=
 =?us-ascii?Q?257NQzLPbk8/iQV18aKHt27A6Eg7DDYsrqYQIS08QGRbf/k+0N1X/PdHOiw8?=
 =?us-ascii?Q?a0zlRwi129ujupFp/bXly8iB9BLG8iyuRMCRCXMuQr4flMPHslI2atr0cQQu?=
 =?us-ascii?Q?ZpGt1YWZUVCPrbfv3jWTWoAyU4YRMt9hK95QHjUJ3/wx1H3G+rCKr27UnTOm?=
 =?us-ascii?Q?hJb8AH+ZIXkl8IYs2MZADg2dMPzbVghZcII42A3z+K2dw5Q8n8A+V5oFN0o4?=
 =?us-ascii?Q?UOKG+8Sr2MFHED84pBj4o9lBEKcpaOCxdQz5u9QYXUSX8tnVJgbm+M3g8UpY?=
 =?us-ascii?Q?w4anvnZ2+OpToHri6WvJrx4uVD/MkTyIPfs7Yb1CyXZUA5abRkpRdt28J86D?=
 =?us-ascii?Q?9i8AiUBRV7++pZEejt8ipjQ+qyeZd52YO+bilGIB1r7s1ZHknh+f0B+sgMwJ?=
 =?us-ascii?Q?LGkFkc4PYtL01m4QdR8XXztH/Q09exCv3wiaogq2sI3qPEE0+ZGWb+5Cdxek?=
 =?us-ascii?Q?Sd4736KXLzewa5hH/9vfAn9h5EKBCHAdCiAD8kZR6nu0ZuKC1/Va/YucvtbJ?=
 =?us-ascii?Q?B3aGUmp15DzjTWiQZq+HdjvHp2CGKyctM7I81YZGENKxauFXlREjAi+2IXJX?=
 =?us-ascii?Q?qHSOL5ZkD5U1VNu2doz8ZI0+SPerTztx1xoL0NwG68CyPNp16aWgmrCHTiSr?=
 =?us-ascii?Q?acgImaGk16i4t9sdMhEqh6g8Imc8F6ZkXHWbreSR/3Itq0AgesiEdq+T6r81?=
 =?us-ascii?Q?VnCCWoPTFbhpG7Ji/S6op74ITD2DV6DYNJL6TwFtPxGznHhtbJIkzumVH1Fu?=
 =?us-ascii?Q?wTzYTpzMP6xvtkrn1l4T9YUaqK6nMmN9BaQfEfC27BUrvkvyrEolOKj+bixj?=
 =?us-ascii?Q?nMwaHzf6LHf+G4v8vFJhL+Vm91I5Fio0oClDnI0/3JfqwqETP9+A8CAC2qYW?=
 =?us-ascii?Q?iHpfkXnoYTvYLQpcVIzIGDlKisEvA6BIQEDyAtjiWCnW42djjw5ND/Cw1u+i?=
 =?us-ascii?Q?OSRN3mqtiIGNrrvnPV6qhY1XEPuTBt7OLhbktbsDQEEcewOFXxjU5M8CbLFc?=
 =?us-ascii?Q?dkKsOhcuAWj7ZmeEI6t5lJ1aWBAhClR7kUd9N2zu0yGg1ZUpAPZV1+vZQIzy?=
 =?us-ascii?Q?1dYo5KmEhUPGgIyP+Le7UltnAkUN8z5CgVavHZ5GaoSunXG1ms/94cLYCQNp?=
 =?us-ascii?Q?k8YxSSbxijC5bdVI0pklOaHxzDxVMkUbwVBzpNdz7tQlZSh+gFWxVrFW3OkU?=
 =?us-ascii?Q?dAtlNH9w2rXixQe79tFhjjnzI4iuYrXFflD+NOodRntrML/dKq5hAZFh05X6?=
 =?us-ascii?Q?gugFq7uaYA0uZPTEK99FDgMkodH4MwRIQ6roVbdk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5216129-0c7f-4eb1-9e9e-08dd7db74232
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:53:40.2982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faStTS1VZBLmxGC7pKVR2wcevJbeaOQXc3/UL8pqrtBzWcy3JKCwqTdkkAm58+Hcmc2HYUWAKMEPAPnAFvXVHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10319
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215085

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


From: Tom Hochstein <tom.hochstein@oss.nxp.com>

The Meson settings for the standalone SDK also need to be available for
the Yocto build SDK, a.k.a. meta-ide-support.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index b59a295abc..9e4320f876 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -99,6 +99,8 @@ toolchain_create_tree_env_script () {
        echo 'export OECORE_BASELIB=3D"${baselib}"' >> $script
        echo 'export OECORE_TARGET_ARCH=3D"${TARGET_ARCH}"' >>$script
        echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
+       echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-=
')}"' >>$script
+       echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'en=
dian-')}"' >>$script

        toolchain_shared_env_script

--
2.34.1



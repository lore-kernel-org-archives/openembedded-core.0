Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5540AC5B572
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 12:06:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6484.1786536369995223880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 05:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=epwZhv8K;
 spf=pass (domain: est.tech, ip: 52.101.84.48, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6YBK8cgDCRUyZcXZlcd8SRaZlXbqnPwKlP7g7j2Wcv5F92l+UocIV01ojknHpgaIPOAsVbXq39MG+Qx0WBsXgkK+gzlpGT1twN1C9tmzvfiN+5YUUPeJL9WXtPOvnAdlwTgN3ziC0G4he5/quC3bi8QEXG1Llv/N3Dfezovyb2RAI8igd2uMyzbE6h2rmgGs2H97i/rNBVbCoT1ArjRuMFXfSvehVc3Tn2/wWHM6gOxgIzv3/ZO8D2KINM/JtJ1ZIw87eVhir+u/F2VDlAlSQekcX8m5eGNQvpyYHTsq4+RIPBBzN2PqwSoHmZmWgYLXiVyGUQSN+0RYCQ7RN5P1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAHIQ49dROcOkma5zcUZhFlwWc/NEU4NInW/NQuxJsY=;
 b=aTg8uQCGK7aKMMnkeZYpBuosRIBL4wWmp1Dnw/vBgJ5nGP9707Zx0VfIH+cERLr/+a0lwjWP1HdlLqrmDB1hYPZFUdeK6mVZQ7DQ3PSNyh9PMEV7AZq5zvljEH87HqTzH376qtYrpvE8EuhScTJccmHyrX906rUA/ll5jTnotbNw4q9LIQ+3lX4451IBcsB6yMra8UdDLsquiZIz6dI7gY07FoN2+1JyRj1FzYKvxS4ZREGNXKqRYCfeuxf3UAPLiE8OI6rFpEspQV/S9GH46RG70r6UEX/P3E0nzh+vaKnsr+c+QAO/UciwWHbaTYOcAU+og0cD36wcpOxt57Omiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAHIQ49dROcOkma5zcUZhFlwWc/NEU4NInW/NQuxJsY=;
 b=epwZhv8K2+FPcBId3KRsQJEEsbxZ+CGpjmbOwTO7HZUSKpsc9ouDIArtbHQ/hk9m1d1CGdsns11fKUuFhwGaD0/fzeg0GYmYPiKZe70UjCC2WE1fTYs5q6s8IO1523eX3W4pfrwTFHekzBtA+J0QuaUtsc/qXkAjcZs5AcGmojn1tokVVSqmzi1SiamBfhZmVTY4L58bflZNEtF6aDvkSQayAHrWXORVU1Ye4GD6qnTxkEDpEdo7jOE3IZKA5TUBNB/lp/NwuJuMUd6TYqRUPTe2JXE7hCBfTtAyS8XteBVi0AQye8dziv1q7G/hAye2pM14n43sXShm3a1oRSyFJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB3354.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:59a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 12:06:05 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 12:06:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v5 0/4] swig: upgrade 4.4.1 -> 4.5.0
Date: Wed, 12 Aug 2026 14:05:54 +0200
Message-ID: <20260812120558.24897-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB3354:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7a7439-0ed5-4358-523b-08def86a15ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	WIDQENxODWFsBawlpIWflrB6SpzhOiFlR7+30g5zILg29djK9nbPYWeuuoXZWApeA/AB1+fVU9IMP3n8ZOZAyLGqMJjZ5pNivh1uWfkmI8Pyw6eriNPB7zrvcLcenutaPZ2zRUbG5whkogCvfIVNFmlJ6fnLuepF3vgci2zeJJQ+QCTTuEsoeCFzWmdL45vJRCPgBTIVQHJGJJOrvmJ8tIYubMShnDOe2ykIUgc5vvCQFgis4uTUhf7+BitgxX6mPmdAEOYzx6nTD5HzrClnuacaEH7OtuPUbryvBMffJi6U7NZP+9DCueqIQMKn6V0pUZEWfaooBYpFwyz+u6fy/4Msq9vwhBs6qGWMEwke0kLHssXqBcSjxxbMi4Xy9/flX2VavDvXOyXWsuuX2PI+bXixe3KxOd+aBMBef4kSilOkxeIkfCsnAhLuidYDax91uqnrhC6RfNOA0ZFWyxdSf+jwuD0uhYN3d36QIgJjVJzUj7MzhmE3JonNkvnUnQ5NnIT400ciEchJ4LB3mtayi3EeaXWtuJGdeguRqecP6ol3MJBwSnbgdzECPlUxErzisHI+6FaDqiB6LcOUhB5MGSSwUHRlNVnUTstIXQ6G3/07F9+F2q3ARwEzgVN6AgEgF4+KMVEYRH9EZ2S/BWoOXKcZ/2c2E4o6uJ9U8Qs+70g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vnkjq/bmlfL7+swWfZqKTA6ViLfXKsj/6u/OKrCTFVdwTiLgSdis3ecc551O?=
 =?us-ascii?Q?FMckHChr0aMwyhgC170fBcFCo1PpyGTRYtq6oyPMrozHhNWC4uR9x7to0BIC?=
 =?us-ascii?Q?JW+LWIDCFxP0Db2a2Z94N+ktgJG+kqXHXUUSTKAxv5xrQXTatrND0RDVr/YR?=
 =?us-ascii?Q?FnoUE9TieqY7tzMSMmJwClNi9QohGCBS0EUwlmnUSTCmybyKI7UJJhdPI25k?=
 =?us-ascii?Q?aFlTUIUbyLlekkBlPQ3HNgC+bkFh0UE5MKHQfsTZh7L97fxLhmixCJGyMzJ8?=
 =?us-ascii?Q?L2ZFdDiFmSqDLXpm9oIDyH6DMG7Y7fSMkvb6fnPnhAlny7qqtq9ZTfHAipWk?=
 =?us-ascii?Q?4VpIn+lBnwy30bGj7U+hIboaIRN88H15NP6HXu6X2qY+92GfIQX3gQeTN2kW?=
 =?us-ascii?Q?rVCwoYgwL0QOsvS4P+CggSZpk7UBLDDfamK3gSG+XlR2R4zu4Pdzp+7Ps/Sw?=
 =?us-ascii?Q?Jmn0TyQ9syO1K6uKF81cuNHNigoJ2A3JE/ITzqvQiyMHLLCgbNPE594nQF6R?=
 =?us-ascii?Q?rTb0Vp1igPGRRo6zcNVg2PlQBGekz+ZBo+h/kEfZ/M7lsr8SsPvqRL2H2WFq?=
 =?us-ascii?Q?mozueZrQ6jqKuc2n3Fr09+C/V2NdsORx4dEu2fEJogS1e6UTDyZG0e814LNk?=
 =?us-ascii?Q?0qf08G+EiB4zao8SzTEgWSphCjyAxq9CbWhZLsT6GwKciTFHVstmCHcV4/Yo?=
 =?us-ascii?Q?dmi1fuVKJoy+Rkd1/Um5XYBOP5kmU52kUgKX585OWRULA61SWVtUJoQnSgmv?=
 =?us-ascii?Q?Dk+XwHVI611iQJRbvorRvfGDwCzoD/7Q/4q9ixUCf38oesdHwLIQYQZzLFRI?=
 =?us-ascii?Q?YkZlUdhB1B6XH0enG7YgzS8VtsC1DL6OIZOQiR8z2hVTwp+8s9wSQqFi75uY?=
 =?us-ascii?Q?JjG584uNV9vGH75eD0AXiK9XDoCNEPmbVZT8pBcn+9H/DrDdt95EPzSb/opN?=
 =?us-ascii?Q?NHauOOsq0ptSH1rGBWY2bdW0L+1dv2bWnObKWR59/5QCxLADz5yvzMSzhiYs?=
 =?us-ascii?Q?huOQ+QUdIZjayxBjZ28vKP1cOVzW2ChjOwcgvPHjcuwqa818m0mLQC8Foe2+?=
 =?us-ascii?Q?3lyXvJnP3nDP5CK7ROgegLW15yqenba7EqdbsjJlfWM6p09emWcem5Myu7P2?=
 =?us-ascii?Q?Vv5jiq1oNpvwww5ern9uukYLWzwgN3WQE9d83F7fvkJ5dRzpwtM1UK2yY/z7?=
 =?us-ascii?Q?MagEDTu8mAjJXqCvrvd9f32xTJkImnkr2338+lbf45XMSSm4kOD42l1Lisv6?=
 =?us-ascii?Q?24gfHYtsaGdDVaSR6aaZ4HseLNWXEfv84xgT1+Y1iBAIdga6yufuYttq33xl?=
 =?us-ascii?Q?uFFICDaB8oIQTbiXLg1tzfd8GjL9hXf0b5flu+fGeR4IeuJyB9U+5aSCBG1G?=
 =?us-ascii?Q?M4zMXIG+Te1oIbAnyVXZBBbEQNig60HM/bz+iSqGOdf4NrV2FpJ1woIcws5T?=
 =?us-ascii?Q?enPTANMJ5iqjlfVEzo7OED70QuF3DAbLHuc+1LazInE0nB6cHbqjm6m9udM+?=
 =?us-ascii?Q?Tj7W1TnSh3QWZYooHwJTUk1WGtaLPyMSFQSelF383CPmZODGrHAwGuVMVjzD?=
 =?us-ascii?Q?9Qs36lfNqLElSCCYQ/LqsmjII6me4TXBwvkAAgp+N836s6Hk/Z28X1hhIf2I?=
 =?us-ascii?Q?LNjNuirnlcTRbaJ8BI1pCYaCSRYUtLwceOyTINpM+dlFlutONwIzSEp+Y1bM?=
 =?us-ascii?Q?F6zhi2l2DFT4qHOyn/W4KthtbW835YcZFxEV2HB+XkFiYl5HedZWFQAQEKSV?=
 =?us-ascii?Q?Qs0GQBGinkt3ywGBLvLXaHIIIRNm3BI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7a7439-0ed5-4358-523b-08def86a15ed
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:06:05.2708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6DW/YHLJb6ckGmgbs7DAPWaipHqdtS2eldC64O9Y953ZJ6ZoAPmQZGh2f2FsiYc6e9VWv4QHHjAMokISPw+OcZVFMhz8RjCRCHT5E/VKnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3354
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 12:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243278

Upgrade swig to 4.5.0 and fix build breakage in recipes that used
Python 2 C API macros removed in swig 4.5.0.

Note: The following recipes in meta-openembedded may also be affected
if python/swig bindings are enabled:
- gensio (meta-oe): fix available upstream [1]
- unbound (meta-networking): fix available upstream [2]
- ldns (meta-oe): fix pending upstream [3]

[1] https://github.com/cminyard/gensio/commit/e024df7fc3d21896bd9d2e26964a0=
b59b7c2a91b
[2] https://github.com/NLnetLabs/unbound/commit/93a56205cfa6b9a6d34db7245aa=
71e5ca67d1fd7
[3] https://github.com/NLnetLabs/ldns/issues/314

Changes in v5:
- Moved pylibfdt patch to u-boot-common.inc so it applies to both
  u-boot and u-boot-tools recipes

Changes in v4:
- Fixed u-boot-tools patch path (libfdt.i_shipped, not libfdt.i)
- Submitted fix to u-boot upstream [4]

[4] https://patchwork.ozlabs.org/patch/2283713/

Changes in v3:
- Added u-boot-tools and python3-dtc patches to fix pylibfdt build

Changes in v2:
- Added babeltrace2 patch to fix SWIG 4.5.0 compatibility

Jaipaul Cheernam (4):
  swig: upgrade 4.4.1 -> 4.5.0
  babeltrace2: fix build with swig 4.5.0
  u-boot: fix pylibfdt build with swig 4.5.0
  python3-dtc: fix build with swig 4.5.0

 ...-removed-SWIG-Python-2-compatibility.patch | 55 +++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 ...-removed-SWIG-Python-2-compatibility.patch | 57 +++++++++++++++
 .../python/python3-dtc_1.8.1.bb               |  1 +
 .../swig/swig/determinism.patch               | 20 +++---
 .../swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb}     |  4 +-
 ...Python-2-C-API-macros-for-SWIG-4.5.0.patch | 70 +++++++++++++++++++
 .../recipes-kernel/lttng/babeltrace2_2.1.2.bb |  1 +
 8 files changed, 199 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-rem=
oved-SWIG-Python-2-compatibility.patch
 create mode 100644 meta/recipes-devtools/python/python3-dtc/0001-pylibfdt-=
Replace-removed-SWIG-Python-2-compatibility.patch
 rename meta/recipes-devtools/swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb} (92%)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-bt2-replace-=
removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch



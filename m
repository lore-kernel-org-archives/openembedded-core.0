Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE28BC5B547
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 09:30:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.139])
 by mx.groups.io with SMTP id smtpd.web10.25216.1748251795008364936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 02:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=IjJHVA5K;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.21.139, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eq7nv/tIvxaMSrkqfoX8KLMzhhNC4ucOL3dy0y0q3bm3qU1c6a7jhGmbz1gFpdrIRGcql88CL9DFGceGf24x8nkPBlMI/AY2qNDaX15v8Rm1ozXDkQH42Vc9tKSiJ3/ma38li7ji2vSHPXPUIUR/se67WpjkNn/cwHT89gnPp6eJ2S4gXthzr49MrQghWQ5u+qEQn8q9NYDAmIDSM2pAi2h/EMc38CS/otzSbafYadSLsIj0NbEvm3wAYpcTks40ZW0JAC8oWNcjGpg1BH3Ji9bVF9ERihd+1kLNCQWfQzBmLCdOo//B5isjELfoMFvLog+eqrHwcSsP9bK3JuDF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9ztb8t43M+PTCxx+/ONjvFb0fgJ6cDaqq/tPYn44OQ=;
 b=m96SXyGNAfcoUg/gF7/Y2p4uO7G7KOlxFPjWhs79fbYSVrFwz+VvScJ8le4kjzyRzgY4lbr7Wir3s21963rZVXag34qfVxD5u5oJ/tOlnMU0MUXgQDY31TGddzgeVOs4aSZoJ13ZIXKV7hmJg+PKma6xGTuFWfJ4Md7StXHGvwCpeD9aCDm8cD5FVVHWitPf4QFD00ldEOTICbKQUfJAC7wkRGF1eOK4Y+WCpTLxhvBRh6MDi/i2SGfptu66Mbfqpt+nD6iaNy/ghQZAjyC2jOiK0FIs+Dq8kE1V2IwdnAD9/c1buuRuaBKYfoqM9slaa8Rc4g81LtO6AwXeyz1EvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9ztb8t43M+PTCxx+/ONjvFb0fgJ6cDaqq/tPYn44OQ=;
 b=IjJHVA5Ktl1kdMuHAS/nUqtooZxyxwPaiAQbRjhPK7xpkxSLId0Fk76nuSzG47SkNbYKd3LPAOiE6vnKIiybBPCC9QeHEtYLUu5s/JMA6/lYie1qMDzM6fD4OrT3KyCVjwNSeJL8t0cdFpk17Em4zSeKktlqRYDIi/w98brrpc/ixdvfhLLh98u3a+s6I0KXrRugBNEhpjeADXa9tj3qKld+7yAFEqzqJ2RA2rAWymb94+7a5iVbAqaFLVSiNVd3XDXn/qVJ3QSAO8nIxpXtEVLLt9/SM17FlzDjpHjAAhoiJQdIVDpYIzl3pRNxUhks7M1bB5/96d9VVK1gGRHzFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB8638.eurprd06.prod.outlook.com (2603:10a6:800:1da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 26 May
 2025 09:29:50 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 09:29:50 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/3] cve-exclusion_6.12.inc: Update using current cvelistV5
Date: Mon, 26 May 2025 09:29:25 +0000
Message-ID: <20250526092927.2588577-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BA5.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1c) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB8638:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2a9415-649a-4943-91be-08dd9c37dce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uLyS5l5D0BgEUxEVuMk06pyVgua+XzqdrHWIrM5BS3697xMJNrSZKZsj3hzw?=
 =?us-ascii?Q?zaA1gJK+XWEvRF95+pXDQzh6f5L1j7KWmW3yZ0yyCxagePx7HkoqiZAWTlL1?=
 =?us-ascii?Q?zPFuvvMKN7PfBjdm1w+2h1oDx9fdUnn0dKSOTqRklfCeL7b8RIzTkkz9rb58?=
 =?us-ascii?Q?Q0HTUiEow4hoprahIxTSKYyzCbbm1KxvEj/qE1RLFV+Nsz+z/ZPHS3VwgGN9?=
 =?us-ascii?Q?xhwLzaGYkGeBMu4K9C+UucI7aLvc8z4anFDUk1nSVb0os5obyRdtCSzSVGfo?=
 =?us-ascii?Q?hTpSoythqcKuZ80lRzm9pT/SmTDxNJRlS+Ql/XMJF/783aZV5E++wES8RPTe?=
 =?us-ascii?Q?Aq5JIjwj7le9/O8SvpakrFoszMWLOxDJIFIFdnVhWxJnzURPL6SLsM/YLz25?=
 =?us-ascii?Q?sdNCNePBN4oz6MOX3uERQiEp1bZRwvElGFhz2ojScmyEAyTsj00VJGL1yX16?=
 =?us-ascii?Q?Lh+wP6lx7AwDk7ptQQnZSdZqDMn9bOHQnF9cAKQQq7rhOiwBC6dAHPJHEo6A?=
 =?us-ascii?Q?ks18b+S53KC/VZONvoMktcTRLaM/tqLmeykuy2rabJOKx2yKAA5kFHbzTaZ+?=
 =?us-ascii?Q?+4Bvm6+BLXlr68nvNNHNBj9LPPIXQllKR2TXzdOrOFxgeRVHdhrDg1e4imQG?=
 =?us-ascii?Q?r8JicxNR4RDZ8DQ3XMxPHiLtLuEgj2upYFPMMBHa/4Jg63dWc6BcY5rhCY+r?=
 =?us-ascii?Q?vooUe2QSbkKJ6BSTGiKpHDuWXCO8wp5xZrboCH4a1SGDq04fh9q4SrdqC3lF?=
 =?us-ascii?Q?cvqDXnkoMYiphd8I5SL1EZZkXBlKRjenyFnJZCqkh/WjLLWo62so3FQHzqNh?=
 =?us-ascii?Q?Lz8vJl/KHslt9+G/aLGZPpJuTqa9YSH8ZJSLlUudGLCqgP5MNi9VxK1R8YTa?=
 =?us-ascii?Q?iTaYF0ZMdYwmyBWETDl37paa5C7T3aeYUGOMeRj3dUYbpgFixpwbCo8M9N1/?=
 =?us-ascii?Q?QIOxShCAGz1oF0RMYztXFBdiVOF9sXy04uLLj/N6f6RvZpbrEGPj1/ttjPra?=
 =?us-ascii?Q?ffTCGo6NLUR4tjnLJrvP7Dqogipw6qdNYXN9i05sWGmcQSlkezs2LkDMtBMQ?=
 =?us-ascii?Q?IMRkwtQNYphEsMdV5nYcm1ubZcX1ejp6pslqOsp+XkaPlgK3VTRya7ZnwssQ?=
 =?us-ascii?Q?w5AvjDhN6zYy9lpfBEKB0tjUJO1hKEQEy/BABtRvU3oEesQ1uLQJ5RYBqpBn?=
 =?us-ascii?Q?Wwx0Uyp7EHDBtDwAw4+Ki9H7Z66cztVpwlGey/3A3rBxPHS2LO44hpuCXsHA?=
 =?us-ascii?Q?M4L6RCo7OjVpbwz7Wvy5AxL+MB3dSsTaZfJpQppOdgvWEUpuYrjJHf6Q4h3h?=
 =?us-ascii?Q?BjYDzxKSk14hzCoQWP/5KH7+s0umi0jsfCz5ey+GMg9oakD89nrJFINO2G2z?=
 =?us-ascii?Q?jK7cm0cjHpgSl+fGGnsh1uB0BtF+iAV+ab0twBIfNl6YObnnLk34p2p+2UO7?=
 =?us-ascii?Q?n7DXJkzda9rhtI1hgQj4xyqm0PD9278Z6ojwYGqucehYEC9nRwg8lAJpRkst?=
 =?us-ascii?Q?I/HCiOhrrMEHDiU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/Y9CSRBbEf0oZxKD5YRGeXr9SAzeYuYdUbLyDWKgk/CG4J/8NHlwTYVG7F8u?=
 =?us-ascii?Q?FUou3Y96RT+E8RpFua9vKFNHmIFmLmpHxo4Kf77zfxaz+GTf8J887dsRFgRU?=
 =?us-ascii?Q?x46CLx12oVnpuo8Q2eiXdjUurLDnVb3Hr1cDPghq9+YGnO0Pd3xzrE+Wlx7H?=
 =?us-ascii?Q?Jhi3TBth7wnQRCalpxmCHdlOxVsAKknL/z4Ew24hHQymIexYd5YE8iPnlkfu?=
 =?us-ascii?Q?LEOZlhNY7AdMglYm5iknznHtPlJCiJayMUhAAr2L9sX5G8MmqBpRlvCv+bwj?=
 =?us-ascii?Q?ZFQtkKUxM1/IzPKpb8LwsQiTYMaXE4pNS5DsvxcZw8Kd5gOxHurQwVg9adqk?=
 =?us-ascii?Q?efw4kKGa92KqTlt5nEM3quNCth9JRkPy6lN8BGaROA4qopgPJNyHpQx0w+/F?=
 =?us-ascii?Q?Jw7BRId2jWHLkCI1icRn6KIT97YDTRrYsMnu63/b6KjwlzJFruRO1QRHXK/B?=
 =?us-ascii?Q?tWN9g64OXinEXdBBR5muSDteCY9nqlbb9ElHezrDGY2KQnqCzYkmZioV58bx?=
 =?us-ascii?Q?yx+vOzQzil3sDa97mRiMXI2SM12ZZBida0JsIVSi6HrWkMq76XKd3utAoWXM?=
 =?us-ascii?Q?EgzlzJNFXJfCxoVz6p3GqW8yLd4IibIXHBl5AwVcWqQp/UReDNuanCwKJBfa?=
 =?us-ascii?Q?M0OEWC9YyLHyMcs8uWdhiCW8AVGxEwdCw5zokVrxT29eKvZ2ERnwYwonYSi8?=
 =?us-ascii?Q?/Daa/E0KjA03YxgMtw4HyrCxGCSTakagQIGZH2DuqMM3L1AIbD0O0/FdSBb2?=
 =?us-ascii?Q?0CvXL/Uw7tW1ngkJ4WEpMp30sfhMWBwYzc07jIJ5F7vk5gUYIZNdNlVN7sxX?=
 =?us-ascii?Q?tr5mwsHyRN61iofmKz87BOGcw/Nao198hnM9NnhCkt9gxPbyD0aq/bsqsiJn?=
 =?us-ascii?Q?8M3uCGH0u3Ajx2mLgWyokQIr+lhqZmHlryFWL5myxUP0i449OakjVLCi/MAM?=
 =?us-ascii?Q?W/JZAG+0yct6cTp6UHjJjjhXgSChIhwkLyzQeNjSo025Knts2e+DEd86BHQ0?=
 =?us-ascii?Q?kY9cBlDjeghj6q+qhQYcywuq94OeaXq7mviF3/xr2nr0nBkvDybW6PYKUPUW?=
 =?us-ascii?Q?MUlJTzFU656UjCeH4puLteaT/oYkmElTBZjNBSiIcVikdl+N/ZAAKr65cPCN?=
 =?us-ascii?Q?SEUiInuiXwAwgOhoxOUkk4FgU3yZbD8WuScna6Nf0MEN+dHvKuZ8P7/vwMh0?=
 =?us-ascii?Q?Nzm557+CdPrKkyKJ2lwSIVatiSvjc66QIANCUfhUCvV/uazhxNYdZZdkDWJo?=
 =?us-ascii?Q?pyHsJIsKIh97+qpYMIC4Bcoqat9+pItOzciilR5qCCnYd0KFAJ9D5aNU7PM3?=
 =?us-ascii?Q?Ptz7oF8uj5WOJuaZz+mP8eRSDQ9cX+5d+ForoN1QFhVWeRyHg9jlYCUcyBE7?=
 =?us-ascii?Q?0FG+MxWH151T+jNJ95IXKgfLyXSvfOMVNEhaZtPa6Maf9XYQjmvyNkQA1V37?=
 =?us-ascii?Q?Snwmd9vWWyPa15SFXF6v2UUUi3vGXUatBibNRX0sVF/n108bQziRp+iarSB/?=
 =?us-ascii?Q?SdqC8bDeIC8X+nB469FGlPB28dJtllK1TEC951DsKoyEvDa9F2jtr6lfGzk+?=
 =?us-ascii?Q?vmpAZSMCCiOwExiUB//3kHgqcIyhEHQcu9Nh1Gygg8uGlmwENa7gWF0N1tnT?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2a9415-649a-4943-91be-08dd9c37dce7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:29:50.1617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OM6ynSE+QB49vWxo/GhoB75WbYrXBE/f2+Jann34pwfEFvOEkQ5MK99JUzYVc0hSW1XrHGoQoJ16hqxOTapPgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8638
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 09:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217264

Regenerated with

 ./generate-cve-exclusions.py ~/cvelistV5/ 6.12.27 > cve-exclusion_6.12.inc

With ~/cvelistV5/ containing clone from
https://github.com/CVEProject/cvelistV5.git repository main branch at
git hash b20d0043711588b6409ae3118bc0510ab888c316.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../linux/cve-exclusion_6.12.inc              | 226 ++++++++++++++++--
 1 file changed, 208 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipe=
s-kernel/linux/cve-exclusion_6.12.inc
index 656d1f6898..49d8bfcf0c 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-05-12 13:07:15.166162+00:00 for version 6.12.27
+# Generated at 2025-05-24 07:35:37.850677+00:00 for version 6.12.27
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.12.27"
@@ -1956,7 +1956,7 @@ CVE_STATUS[CVE-2022-48840] =3D "fixed-version: Fixed =
from version 5.16.17"
=20
 CVE_STATUS[CVE-2022-48841] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2022-48842] =3D "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2022-48842] =3D "fixed-version: Fixed from version 5.16.16"
=20
 CVE_STATUS[CVE-2022-48843] =3D "fixed-version: Fixed from version 5.17"
=20
@@ -2358,8 +2358,6 @@ CVE_STATUS[CVE-2022-49054] =3D "fixed-version: Fixed =
from version 5.18"
=20
 CVE_STATUS[CVE-2022-49055] =3D "fixed-version: Fixed from version 5.18"
=20
-CVE_STATUS[CVE-2022-49056] =3D "fixed-version: Fixed from version 5.17.4"
-
 CVE_STATUS[CVE-2022-49057] =3D "fixed-version: Fixed from version 5.18"
=20
 CVE_STATUS[CVE-2022-49058] =3D "fixed-version: Fixed from version 5.18"
@@ -4078,8 +4076,6 @@ CVE_STATUS[CVE-2022-49931] =3D "fixed-version: Fixed =
from version 6.1"
=20
 CVE_STATUS[CVE-2022-49932] =3D "fixed-version: Fixed from version 6.3"
=20
-CVE_STATUS[CVE-2022-49933] =3D "fixed-version: Fixed from version 6.3"
-
 # CVE-2023-34319 has no known resolution
=20
 # CVE-2023-34324 has no known resolution
@@ -4564,7 +4560,7 @@ CVE_STATUS[CVE-2023-52731] =3D "fixed-version: Fixed =
from version 6.2"
=20
 CVE_STATUS[CVE-2023-52732] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2023-52733] =3D "fixed-version: Fixed from version 6.2"
+# CVE-2023-52733 has no known resolution
=20
 CVE_STATUS[CVE-2023-52735] =3D "fixed-version: Fixed from version 6.2"
=20
@@ -5284,6 +5280,8 @@ CVE_STATUS[CVE-2023-53144] =3D "fixed-version: Fixed =
from version 6.3"
=20
 CVE_STATUS[CVE-2023-53145] =3D "fixed-version: Fixed from version 6.3"
=20
+CVE_STATUS[CVE-2023-53146] =3D "fixed-version: Fixed from version 6.6"
+
 CVE_STATUS[CVE-2024-26581] =3D "fixed-version: Fixed from version 6.8"
=20
 CVE_STATUS[CVE-2024-26582] =3D "fixed-version: Fixed from version 6.8"
@@ -11438,8 +11436,6 @@ CVE_STATUS[CVE-2025-21631] =3D "cpe-stable-backport=
: Backported in 6.12.10"
=20
 CVE_STATUS[CVE-2025-21632] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2025-21633] =3D "cpe-stable-backport: Backported in 6.12.10=
"
-
 CVE_STATUS[CVE-2025-21634] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
 CVE_STATUS[CVE-2025-21635] =3D "cpe-stable-backport: Backported in 6.12.10=
"
@@ -11544,8 +11540,6 @@ CVE_STATUS[CVE-2025-21684] =3D "cpe-stable-backport=
: Backported in 6.12.11"
=20
 CVE_STATUS[CVE-2025-21685] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2025-21686] =3D "cpe-stable-backport: Backported in 6.12.12=
"
-
 CVE_STATUS[CVE-2025-21687] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
 CVE_STATUS[CVE-2025-21688] =3D "fixed-version: only affects 6.13 onwards"
@@ -11836,8 +11830,6 @@ CVE_STATUS[CVE-2025-21835] =3D "cpe-stable-backport=
: Backported in 6.12.16"
=20
 CVE_STATUS[CVE-2025-21836] =3D "cpe-stable-backport: Backported in 6.12.16=
"
=20
-# CVE-2025-21837 needs backporting (fixed from 6.14)
-
 CVE_STATUS[CVE-2025-21838] =3D "cpe-stable-backport: Backported in 6.12.16=
"
=20
 CVE_STATUS[CVE-2025-21839] =3D "cpe-stable-backport: Backported in 6.12.16=
"
@@ -12364,7 +12356,7 @@ CVE_STATUS[CVE-2025-22100] =3D "fixed-version: only=
 affects 6.13 onwards"
=20
 # CVE-2025-22101 needs backporting (fixed from 6.15rc1)
=20
-# CVE-2025-22102 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22102 needs backporting (fixed from 6.12.30)
=20
 # CVE-2025-22103 needs backporting (fixed from 6.15rc1)
=20
@@ -12616,8 +12608,6 @@ CVE_STATUS[CVE-2025-37802] =3D "cpe-stable-backport=
: Backported in 6.12.26"
=20
 # CVE-2025-37803 needs backporting (fixed from 6.15rc2)
=20
-CVE_STATUS[CVE-2025-37804] =3D "cpe-stable-backport: Backported in 6.12.26=
"
-
 CVE_STATUS[CVE-2025-37805] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
 CVE_STATUS[CVE-2025-37806] =3D "cpe-stable-backport: Backported in 6.12.26=
"
@@ -12650,7 +12640,7 @@ CVE_STATUS[CVE-2025-37819] =3D "cpe-stable-backport=
: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37820] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
-# CVE-2025-37821 needs backporting (fixed from 6.15rc4)
+# CVE-2025-37821 needs backporting (fixed from 6.12.29)
=20
 CVE_STATUS[CVE-2025-37822] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
@@ -12766,7 +12756,7 @@ CVE_STATUS[CVE-2025-37878] =3D "cpe-stable-backport=
: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37879] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
-CVE_STATUS[CVE-2025-37880] =3D "cpe-stable-backport: Backported in 6.12.26=
"
+# CVE-2025-37880 needs backporting (fixed from 6.15rc1)
=20
 CVE_STATUS[CVE-2025-37881] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
@@ -12786,10 +12776,210 @@ CVE_STATUS[CVE-2025-37888] =3D "cpe-stable-backp=
ort: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37889] =3D "cpe-stable-backport: Backported in 6.12.20=
"
=20
+# CVE-2025-37890 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37891 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37892] =3D "cpe-stable-backport: Backported in 6.12.24=
"
+
 CVE_STATUS[CVE-2025-37893] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
+# CVE-2025-37894 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37895] =3D "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-37896] =3D "fixed-version: only affects 6.14 onwards"
+
+# CVE-2025-37897 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37898] =3D "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-37899 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37900 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37901 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37902] =3D "fixed-version: only affects 6.15rc5 onward=
s"
+
+# CVE-2025-37903 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37904] =3D "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-37905 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37906 needs backporting (fixed from 6.15rc4)
+
+# CVE-2025-37907 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37908 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37909 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37910 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37911 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37912 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37913 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37914 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37915 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37916 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37917 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37918 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37919 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37920 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37921 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37922 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37923 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37924 needs backporting (fixed from 6.12.28)
+
 # CVE-2025-37925 needs backporting (fixed from 6.15rc1)
=20
+# CVE-2025-37926 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37927 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37928 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37929] =3D "fixed-version: only affects 6.15rc1 onward=
s"
+
+# CVE-2025-37930 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37931 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37932 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37933 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37934 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37935 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37936 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37937] =3D "cpe-stable-backport: Backported in 6.12.23=
"
+
+CVE_STATUS[CVE-2025-37938] =3D "cpe-stable-backport: Backported in 6.12.26=
"
+
+CVE_STATUS[CVE-2025-37939] =3D "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-37940] =3D "cpe-stable-backport: Backported in 6.12.24=
"
+
+CVE_STATUS[CVE-2025-37941] =3D "cpe-stable-backport: Backported in 6.12.24=
"
+
+CVE_STATUS[CVE-2025-37942] =3D "cpe-stable-backport: Backported in 6.12.24=
"
+
+CVE_STATUS[CVE-2025-37943] =3D "cpe-stable-backport: Backported in 6.12.24=
"
+
+CVE_STATUS[CVE-2025-37944] =3D "cpe-stable-backport: Backported in 6.12.25=
"
+
+CVE_STATUS[CVE-2025-37945] =3D "cpe-stable-backport: Backported in 6.12.24=
"
+
+# CVE-2025-37946 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37947 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37948 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37949 needs backporting (fixed from 6.12.29)
+
+CVE_STATUS[CVE-2025-37950] =3D "fixed-version: only affects 6.14 onwards"
+
+# CVE-2025-37951 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37952 needs backporting (fixed from 6.12.29)
+
+CVE_STATUS[CVE-2025-37953] =3D "fixed-version: only affects 6.15rc2 onward=
s"
+
+# CVE-2025-37954 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37955 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37956 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37957 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37958 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37959 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37960 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37961 needs backporting (fixed from 6.12.29)
+
+CVE_STATUS[CVE-2025-37962] =3D "fixed-version: only affects 6.15rc1 onward=
s"
+
+# CVE-2025-37963 needs backporting (fixed from 6.12.29)
+
+CVE_STATUS[CVE-2025-37964] =3D "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37965] =3D "fixed-version: only affects 6.15rc2 onward=
s"
+
+CVE_STATUS[CVE-2025-37966] =3D "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-37967 needs backporting (fixed from 6.12.30)
+
+# CVE-2025-37968 needs backporting (fixed from 6.12.30)
+
+# CVE-2025-37969 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37970 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37971 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37972 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37973 needs backporting (fixed from 6.12.29)
+
+CVE_STATUS[CVE-2025-37974] =3D "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-37975] =3D "cpe-stable-backport: Backported in 6.12.25=
"
+
+# CVE-2025-37976 has no known resolution
+
+CVE_STATUS[CVE-2025-37977] =3D "cpe-stable-backport: Backported in 6.12.26=
"
+
+CVE_STATUS[CVE-2025-37978] =3D "cpe-stable-backport: Backported in 6.12.25=
"
+
+CVE_STATUS[CVE-2025-37979] =3D "cpe-stable-backport: Backported in 6.12.25=
"
+
+CVE_STATUS[CVE-2025-37980] =3D "cpe-stable-backport: Backported in 6.12.25=
"
+
+CVE_STATUS[CVE-2025-37981] =3D "cpe-stable-backport: Backported in 6.12.25=
"
+
+CVE_STATUS[CVE-2025-37982] =3D "cpe-stable-backport: Backported in 6.12.25=
"
+
+CVE_STATUS[CVE-2025-37983] =3D "cpe-stable-backport: Backported in 6.12.26=
"
+
+# CVE-2025-37984 needs backporting (fixed from 6.15rc1)
+
+CVE_STATUS[CVE-2025-37985] =3D "cpe-stable-backport: Backported in 6.12.26=
"
+
+CVE_STATUS[CVE-2025-37986] =3D "cpe-stable-backport: Backported in 6.12.26=
"
+
+CVE_STATUS[CVE-2025-37987] =3D "cpe-stable-backport: Backported in 6.12.26=
"
+
+CVE_STATUS[CVE-2025-37988] =3D "cpe-stable-backport: Backported in 6.12.26=
"
+
+CVE_STATUS[CVE-2025-37989] =3D "cpe-stable-backport: Backported in 6.12.26=
"
+
+# CVE-2025-37990 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37991 needs backporting (fixed from 6.12.28)
+
 CVE_STATUS[CVE-2025-38049] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
 # CVE-2025-38104 needs backporting (fixed from 6.15rc1)
--=20
2.39.5



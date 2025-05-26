Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE024C5B542
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 09:30:00 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.121])
 by mx.groups.io with SMTP id smtpd.web11.25323.1748251794650781148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 02:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Q92R0TOn;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.103.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFsCrnHJRK/4jhYgmt9i/C3eZsF+YpyinQsz4ck7sSKLS5AqA48eBieWz/S5yY49dK48cVNVPqJ6YzSOeXZAt0NL2HyQxYBGQZ6BWQX9kDTPKj8KNV1WhK4mW7kLkadU/QEssrEkNSvweq7+K0kMoCYL2IRe2rK1KL5BPJkwHG4zpP1CCnZSH8+KD1ged5Myus9LGTN1cf6l6w8IBP/kM73tn8073tX7tGbzHB+hYwgbmKpDkDdq2dgW+RSGtv5SbjdtrzvHl0Wkmudc2O2M4PeFmcuysd/H1oOoe1cAf8YQy9J6ARqmjTokvVCUlNp1sqe/bi2viCS8WETTla0aog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAD9w+H4EVoJ3X67uV3EWvlnE2yqXKx0uVc/q9ZahvI=;
 b=n9HlC/UsjYAWcccPKO45J4uf/+3WNthJJCNkoi9N5hVb0YEslLcEBQaMHSbd4ZmO3060IrZZ+633pu63zP9mpRaP8nI5niuclRdL1zqI2WodoxJmgef+gAN5WLHUrS/p1rXY51dKo3KOA+yeCK/J8+aa5KoH8UW9hNiuBdx4/NvMeo7tLpQlu1T3aEDJhCVC778UcMoHcbHIGC4M8KAXA3tpSUIbEcWfwLAAdCeIJHjZ4lWUwTvoU+0z+Rv6DmSUY4J1D2Y75Eo3qTn/DjPnB4aAMe+kESM7mU8KMHVUY/TZ+QWhn/8aHpQhUFyZX0l054ONqmjNamMEB7B006zIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAD9w+H4EVoJ3X67uV3EWvlnE2yqXKx0uVc/q9ZahvI=;
 b=Q92R0TOnQ9cnZ8/J4+6RLdCbjpD9S8YyBwVRxo3f8VwZRY7KmEDEJZUaNSeERkmzWXG3j+QDw//MClGSqBY97xQAfczhLzhgd1ZQnpJZv7E/KQX3aiVcuSBpzAeEVPBnn73c+9hQ6ejlXlLgXCzUe0u9Sxk8kCN5qPqR6HCMpOMaN/XljZomwDAU88mx+kPiA9mg7IGpqbAibecHdwKL9jFDwkP4whQWc1bx6SpIawSDprHBT/h16Tp6QxebeomCdFOkmGJmGD5WnACzfjHU/p12v09HtIImpmBTPqNxKSIv/K/J3z+R+ibEE+bcy0GkGj0TM4e+GS/1/KRh7g8oKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM8PR06MB6836.eurprd06.prod.outlook.com (2603:10a6:20b:1c7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 09:29:50 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 09:29:50 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/3] linux: cve-exclusions: Fix false negatives
Date: Mon, 26 May 2025 09:29:26 +0000
Message-ID: <20250526092927.2588577-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250526092927.2588577-1-niko.mauno@vaisala.com>
References: <20250526092927.2588577-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BA5.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1c) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM8PR06MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 137e926f-82ee-4d9e-be03-08dd9c37dd2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gSGyIOY7BeLxCv6OvaO2v93ip4wpisb/ZMuf1J9nLuFiHbtQ7OUihA3Vmop7?=
 =?us-ascii?Q?g9FVBNxDvr4qQ1IfR/6Rwqs+7MA77IAhzDrKKc5b/0QYqLUdIbQ4w75dT8DL?=
 =?us-ascii?Q?/SN5VPOJSGXVVe5YqUXOrcKv05l+ynUtys/Tt5izjISHE/gRXfmCieSFvSJ6?=
 =?us-ascii?Q?48YwiKtXjPFjREuQRwgJ+Fch8Kplb+VZrPb0ucD46LMpq9DnTRP8xd7t5nZ/?=
 =?us-ascii?Q?LP4czXEFWRuLPxcax7d1WHzVqmNAtCNFa9LR12TMXhh/maT+BDGKpbeRiLKl?=
 =?us-ascii?Q?8Zr1NEnwpGa8lv7pBWkTRXmUR2/Ad+OzN+c5Lva1c/b941x5vUyetip4csAk?=
 =?us-ascii?Q?m9/DW4Zt2ihfPrGXBusC3pJAjL6EsHZU0eAV3c1MD9PmaS+rZosnxXD5NaY9?=
 =?us-ascii?Q?NjXhQKHreRsNyrhAqQwC2ojElvP4HjLxRswGs2jMgtHHak2QCAUwFns2wdvy?=
 =?us-ascii?Q?2l5AGm3s+xo422WEn1BEpAbtxfIUggwDxXi+5Hf9E6+vZfx2yEIQLNfZU/nm?=
 =?us-ascii?Q?PXFNiGKB0MFaKykpWikFW6EFwXOCtG1nds/qDU2TuUp6HG96zCRG61nFwqs9?=
 =?us-ascii?Q?wjlqRPHvLO0S0PqqDnL82mNPF9sqUKZxn877VLq2PnpfwIE8hSYLUxXYTxo+?=
 =?us-ascii?Q?/V6i6ZsU1542zU+RhHiFQVRZBr43xvDdmngVcm9a013canv5qg6P70PJ5FdA?=
 =?us-ascii?Q?4VHTZDZhbN09xQBrpJv+NO+w++Ov5pKMY0mzYPQ40maM6WOPApen8RrLKq9j?=
 =?us-ascii?Q?oj6rHW+flWQTcNmoa3hS9LoBMHzTDa6riF+IX+/3xkbI1eiRiMs1P/xzO6B9?=
 =?us-ascii?Q?jAXxE81McwtmJsSQIBcGVN26F+lmB6C3tL7Uig/wueLtQms51WP5aWgKDtkN?=
 =?us-ascii?Q?pD3CU4+3GjaLbvkMHYCfleT7vK6lub/A3yUk+vqL5G1eAUc2HQL3S9/9Lge5?=
 =?us-ascii?Q?svQCWGTUT4wJGLibAEiNoMyAwiFLg8QMoIM6camXs5njdbz0CQH5+8HTP1GP?=
 =?us-ascii?Q?2Sxpps+aUTzc4EJ5YgnUmiJELQaqA4EGcSHDq9kEiMCgPEhewued5WxdiuwR?=
 =?us-ascii?Q?SQZwWz0uPFonwyL27ny/rlORScY5G6iyDGzVh8Eh7kAiTm7nXotokTw72l1L?=
 =?us-ascii?Q?6l5MLAAzypjIfnra8PCjP8hjht/0O/Y10mZ7An8v7pVOVnIAvTPdIPOPtP+8?=
 =?us-ascii?Q?ducQt1w2OO6Tf/6SoWZsvBrv5g8UvU50jVzjjfm1ez6wtZoCJi0KWz2DcXqM?=
 =?us-ascii?Q?/6pZrYTXkARDa5RoKhdqHLTpvvllMc7Lhlf4f1YkVDSDROgk5eutLL4SINTv?=
 =?us-ascii?Q?7MW5B69aX4s5O4OeCvSUn/GjSPqIGfILZL4RZe4LG1bgAT65iaiUyZIiOOm/?=
 =?us-ascii?Q?TrpCxRoAdapNZ7n1TR8Xe5e4cNMJCNxha1LsW+Bm/b6iZBCrwR56OwDDF4nw?=
 =?us-ascii?Q?J6kqxwWkscDb8+cgXav3IpIlsoJzR9r6Ls+9vm77Ys4YHu9kU0QPsEe1ptO9?=
 =?us-ascii?Q?Nh+g6HmzVNQHdaI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J45pA+Nk5DAXClBc/FCg9cQRmWp+ESDcXv05LYY2lxBUHiE9whs43dTpc6KB?=
 =?us-ascii?Q?Hy5ICUY6Mpif9PytkQh7bVzdhKSJ+ART+opwfamlZTP5up/fzLgdTUXZxdso?=
 =?us-ascii?Q?JBfRnbtPwdFyXENGaFeFdWQ8fqYvFvEiuQpAs7MAVlMjmUBiT1fp2TE4MYH4?=
 =?us-ascii?Q?Gh6qD0FGuEVE4B0X6CdgFIS6Gs6M9Zyvv1H0OXJ76fr/NN7YMhMDb554NREW?=
 =?us-ascii?Q?OeGMmvnYdHp3NqpT2Lpb2rv6J3mGnLXdMfo0qwGWOxZQQwiCvahvuUo0Kt/3?=
 =?us-ascii?Q?tU/caZvX8V/86f1FSRZC9eHNfYW90y6q5Enr6QjJSDa58TqgdbMRxSoOGXUz?=
 =?us-ascii?Q?OLu+auUmdPxuOyIeHj0Vsl4cD29MnRgAcVNCxgUqjgsyEsRUJZYaZiaokmYf?=
 =?us-ascii?Q?ZgzM9MQ81UESaMuEx7Kr420rRtHJiziL5xL8/j6CJp6orY5LWvWyrRnGFG8/?=
 =?us-ascii?Q?UBTElHSn0ZpHO3X+Zmwyo2z9X6BDoyU4kzdadywTl5yEfr9TVmwPeg6jfSzH?=
 =?us-ascii?Q?L+6XEiyCveMBEgiZdANnqm92321bqH3si69Q6PGcA3eDCpqjb1nQfSBHiCGX?=
 =?us-ascii?Q?ZcPwLsh0JDx7w64aRKXmqop2sr+HSGXpKnt86R/Mm1Gs+lXCSc7mcMEongkC?=
 =?us-ascii?Q?yoApA/AvkUf59IB+RKo+57e30/+TDuSK8Nd9Lf4X86imbiYFfG6uKZHpi/Wv?=
 =?us-ascii?Q?pKh3fo+wCPZzIFE/hrPW4VUungjq+7a1atSDmGtleJY/bHAxlMCcNWiTSR/D?=
 =?us-ascii?Q?6gl1Q+VPMgmG39U78F5xrPsjSS5Z35/OsRRS6hWcuxMKDlGrxMEqxUpXeR/X?=
 =?us-ascii?Q?dQtEkTMIl1hQKdTuGmCPEukhsMuFZCVk6BVnFUecL7Eyqa16GQxKS8iObpya?=
 =?us-ascii?Q?KACEwrz66Nm7O5T6j2Wkf59McYHhBERBvx6dU87rDxAEcsIdnEBEspPaoFl4?=
 =?us-ascii?Q?RUvnKHdVQ5mqgQ3F93BE5cAECDyfERqJnvj08lMvoB8mUo5TmU7GsmjpcndN?=
 =?us-ascii?Q?mcm1pkl7iQ/YBoWqmFSi9vJgr3w5G/vdasu/HhjY9YgCQsJl8WGarHr3s5sg?=
 =?us-ascii?Q?8rbClf+W3U6CMx6uhPGUojfNl0KhqsLBolQSv+X4VACLMNCOaY4moiWIt33d?=
 =?us-ascii?Q?EN927gIjWIRDZOFpnmVexxYryD7vi6yqiDJVs8APWDMEI0AaZjIyci3dWp+D?=
 =?us-ascii?Q?kY3MlI4farhdchbRIsYka54CLrLCXFcs7BWw8wHMUDFanw4xJH1tpeun6gBD?=
 =?us-ascii?Q?6O417Z16Z7ZWd/bijqvCQtKxItgSrlOGwyhx1BKIyTfK7WDkFUafiyqaWd8v?=
 =?us-ascii?Q?E3bwl5KHboQWb38y65gXwklJ6EbvJvIpq+JUkJEavBVRjmlDwtz0tYgmHNlz?=
 =?us-ascii?Q?3qGiXYtZpCYbsPZLKEi5MkL52YuJep8SwEwAhWOObrfA0bG2YmTNcc42VGrx?=
 =?us-ascii?Q?b68C1Z1jquAQIL6rTXiIpDm3Fn+TTYi3CpIOUVylueE2rCRdAce4RHow4Y1r?=
 =?us-ascii?Q?zvH144EJgdENOLf76hdDuLgblQlCC3Yug6wVCT+yOfFG24nMMoF2khsjZpc2?=
 =?us-ascii?Q?las/8kmwRTzIo3xKoiIf+Qju60shdXPeG4odbhLfk0VOeQ6armYM+2WEEayF?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 137e926f-82ee-4d9e-be03-08dd9c37dd2e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:29:50.6371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhFBQmVezzaAciU7o266nNCeLtvKDXZ4bTkDdaAPM0fPa+pVLwVnyDLjxzyK+zY7AOCH7yOvya8lj4T73qnPhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6836
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 09:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217265

Amend the generate-cve-exclusions.py checking logic in part of the code
responsible for iterating the "affected" defaultStatus part of the JSON
structure in order to mitigate occurrences of false negatives in the
generated output, as well as occurrences of wrong reason for negative
result in case where the reason is actually that the checked kernel
version is in backport fix scope.

In tandem we regenerate the content of cve-exclusion_6.12.inc using
https://github.com/CVEProject/cvelistV5.git repository main branch at
git hash b20d0043711588b6409ae3118bc0510ab888c316 to keep the content
in sync with the script.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../linux/cve-exclusion_6.12.inc              | 70 +++++++++----------
 .../linux/generate-cve-exclusions.py          |  4 +-
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipe=
s-kernel/linux/cve-exclusion_6.12.inc
index 49d8bfcf0c..c03ad19a3d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-05-24 07:35:37.850677+00:00 for version 6.12.27
+# Generated at 2025-05-24 12:02:58.590640+00:00 for version 6.12.27
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.12.27"
@@ -11234,7 +11234,7 @@ CVE_STATUS[CVE-2024-57975] =3D "cpe-stable-backport=
: Backported in 6.12.13"
=20
 CVE_STATUS[CVE-2024-57977] =3D "cpe-stable-backport: Backported in 6.12.13=
"
=20
-CVE_STATUS[CVE-2024-57978] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2024-57978] =3D "cpe-stable-backport: Backported in 6.12.13=
"
=20
 CVE_STATUS[CVE-2024-57979] =3D "cpe-stable-backport: Backported in 6.12.13=
"
=20
@@ -11296,7 +11296,7 @@ CVE_STATUS[CVE-2024-58007] =3D "cpe-stable-backport=
: Backported in 6.12.14"
=20
 CVE_STATUS[CVE-2024-58008] =3D "cpe-stable-backport: Backported in 6.12.14=
"
=20
-CVE_STATUS[CVE-2024-58009] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2024-58009] =3D "cpe-stable-backport: Backported in 6.12.14=
"
=20
 CVE_STATUS[CVE-2024-58010] =3D "cpe-stable-backport: Backported in 6.12.14=
"
=20
@@ -11542,7 +11542,7 @@ CVE_STATUS[CVE-2025-21685] =3D "cpe-stable-backport=
: Backported in 6.12.11"
=20
 CVE_STATUS[CVE-2025-21687] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
-CVE_STATUS[CVE-2025-21688] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21688] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
 CVE_STATUS[CVE-2025-21689] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
@@ -11570,7 +11570,7 @@ CVE_STATUS[CVE-2025-21701] =3D "cpe-stable-backport=
: Backported in 6.12.13"
=20
 CVE_STATUS[CVE-2025-21702] =3D "cpe-stable-backport: Backported in 6.12.14=
"
=20
-CVE_STATUS[CVE-2025-21703] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21703] =3D "cpe-stable-backport: Backported in 6.12.14=
"
=20
 CVE_STATUS[CVE-2025-21704] =3D "cpe-stable-backport: Backported in 6.12.16=
"
=20
@@ -11784,7 +11784,7 @@ CVE_STATUS[CVE-2025-21811] =3D "cpe-stable-backport=
: Backported in 6.12.13"
=20
 CVE_STATUS[CVE-2025-21812] =3D "cpe-stable-backport: Backported in 6.12.13=
"
=20
-CVE_STATUS[CVE-2025-21813] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21813] =3D "cpe-stable-backport: Backported in 6.12.14=
"
=20
 CVE_STATUS[CVE-2025-21814] =3D "cpe-stable-backport: Backported in 6.12.14=
"
=20
@@ -11794,7 +11794,7 @@ CVE_STATUS[CVE-2025-21816] =3D "cpe-stable-backport=
: Backported in 6.12.14"
=20
 # CVE-2025-21817 needs backporting (fixed from 6.14)
=20
-CVE_STATUS[CVE-2025-21819] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21819] =3D "cpe-stable-backport: Backported in 6.12.14=
"
=20
 CVE_STATUS[CVE-2025-21820] =3D "cpe-stable-backport: Backported in 6.12.14=
"
=20
@@ -11884,7 +11884,7 @@ CVE_STATUS[CVE-2025-21863] =3D "cpe-stable-backport=
: Backported in 6.12.17"
=20
 CVE_STATUS[CVE-2025-21864] =3D "cpe-stable-backport: Backported in 6.12.17=
"
=20
-CVE_STATUS[CVE-2025-21865] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21865] =3D "cpe-stable-backport: Backported in 6.12.17=
"
=20
 CVE_STATUS[CVE-2025-21866] =3D "cpe-stable-backport: Backported in 6.12.17=
"
=20
@@ -11958,7 +11958,7 @@ CVE_STATUS[CVE-2025-21900] =3D "cpe-stable-backport=
: Backported in 6.12.18"
=20
 CVE_STATUS[CVE-2025-21901] =3D "cpe-stable-backport: Backported in 6.12.18=
"
=20
-CVE_STATUS[CVE-2025-21902] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21902] =3D "cpe-stable-backport: Backported in 6.12.19=
"
=20
 CVE_STATUS[CVE-2025-21903] =3D "cpe-stable-backport: Backported in 6.12.19=
"
=20
@@ -12212,11 +12212,11 @@ CVE_STATUS[CVE-2025-22027] =3D "cpe-stable-backpo=
rt: Backported in 6.12.23"
=20
 CVE_STATUS[CVE-2025-22028] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
-CVE_STATUS[CVE-2025-22030] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-22030] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
 CVE_STATUS[CVE-2025-22031] =3D "fixed-version: only affects 6.13 onwards"
=20
-CVE_STATUS[CVE-2025-22032] =3D "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-22032] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
 CVE_STATUS[CVE-2025-22033] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
@@ -12246,9 +12246,9 @@ CVE_STATUS[CVE-2025-22045] =3D "cpe-stable-backport=
: Backported in 6.12.23"
=20
 CVE_STATUS[CVE-2025-22046] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
-CVE_STATUS[CVE-2025-22047] =3D "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-22047] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
-CVE_STATUS[CVE-2025-22048] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-22048] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
 CVE_STATUS[CVE-2025-22049] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
@@ -12300,13 +12300,13 @@ CVE_STATUS[CVE-2025-22072] =3D "cpe-stable-backpo=
rt: Backported in 6.12.23"
=20
 CVE_STATUS[CVE-2025-22073] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
-CVE_STATUS[CVE-2025-22074] =3D "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-22074] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
 CVE_STATUS[CVE-2025-22075] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
 CVE_STATUS[CVE-2025-22076] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
-CVE_STATUS[CVE-2025-22077] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-22077] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
 CVE_STATUS[CVE-2025-22078] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
@@ -12338,7 +12338,7 @@ CVE_STATUS[CVE-2025-22091] =3D "cpe-stable-backport=
: Backported in 6.12.23"
=20
 CVE_STATUS[CVE-2025-22092] =3D "fixed-version: only affects 6.13 onwards"
=20
-CVE_STATUS[CVE-2025-22093] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-22093] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
 CVE_STATUS[CVE-2025-22094] =3D "fixed-version: only affects 6.13 onwards"
=20
@@ -12392,7 +12392,7 @@ CVE_STATUS[CVE-2025-22118] =3D "fixed-version: only=
 affects 6.13 onwards"
=20
 CVE_STATUS[CVE-2025-22119] =3D "fixed-version: only affects 6.14 onwards"
=20
-CVE_STATUS[CVE-2025-22120] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-22120] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
 # CVE-2025-22121 needs backporting (fixed from 6.15rc1)
=20
@@ -12506,7 +12506,7 @@ CVE_STATUS[CVE-2025-37750] =3D "cpe-stable-backport=
: Backported in 6.12.24"
=20
 CVE_STATUS[CVE-2025-37751] =3D "fixed-version: only affects 6.14 onwards"
=20
-CVE_STATUS[CVE-2025-37752] =3D "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-37752] =3D "cpe-stable-backport: Backported in 6.12.24=
"
=20
 CVE_STATUS[CVE-2025-37753] =3D "fixed-version: only affects 6.15rc1 onward=
s"
=20
@@ -12522,7 +12522,7 @@ CVE_STATUS[CVE-2025-37758] =3D "cpe-stable-backport=
: Backported in 6.12.24"
=20
 CVE_STATUS[CVE-2025-37759] =3D "cpe-stable-backport: Backported in 6.12.24=
"
=20
-CVE_STATUS[CVE-2025-37760] =3D "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-37760] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
 CVE_STATUS[CVE-2025-37761] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
@@ -12570,7 +12570,7 @@ CVE_STATUS[CVE-2025-37782] =3D "cpe-stable-backport=
: Backported in 6.12.25"
=20
 CVE_STATUS[CVE-2025-37783] =3D "fixed-version: only affects 6.14 onwards"
=20
-CVE_STATUS[CVE-2025-37784] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-37784] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
 CVE_STATUS[CVE-2025-37785] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
@@ -12620,15 +12620,15 @@ CVE_STATUS[CVE-2025-37809] =3D "cpe-stable-backpo=
rt: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37810] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
-CVE_STATUS[CVE-2025-37811] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-37811] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
 CVE_STATUS[CVE-2025-37812] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
-CVE_STATUS[CVE-2025-37813] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-37813] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
-CVE_STATUS[CVE-2025-37814] =3D "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-37814] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
-CVE_STATUS[CVE-2025-37815] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-37815] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
 CVE_STATUS[CVE-2025-37816] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
@@ -12686,7 +12686,7 @@ CVE_STATUS[CVE-2025-37843] =3D "cpe-stable-backport=
: Backported in 6.12.24"
=20
 CVE_STATUS[CVE-2025-37844] =3D "cpe-stable-backport: Backported in 6.12.24=
"
=20
-CVE_STATUS[CVE-2025-37845] =3D "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-37845] =3D "cpe-stable-backport: Backported in 6.12.24=
"
=20
 CVE_STATUS[CVE-2025-37846] =3D "cpe-stable-backport: Backported in 6.12.24=
"
=20
@@ -12732,13 +12732,13 @@ CVE_STATUS[CVE-2025-37866] =3D "fixed-version: on=
ly affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2025-37867] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
-CVE_STATUS[CVE-2025-37868] =3D "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-37868] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
 CVE_STATUS[CVE-2025-37869] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
 CVE_STATUS[CVE-2025-37870] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
-CVE_STATUS[CVE-2025-37871] =3D "fixed-version: only affects 6.15rc1 onward=
s"
+CVE_STATUS[CVE-2025-37871] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
 CVE_STATUS[CVE-2025-37872] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
@@ -12786,7 +12786,7 @@ CVE_STATUS[CVE-2025-37893] =3D "cpe-stable-backport=
: Backported in 6.12.23"
=20
 # CVE-2025-37894 needs backporting (fixed from 6.12.28)
=20
-CVE_STATUS[CVE-2025-37895] =3D "fixed-version: only affects 6.13 onwards"
+# CVE-2025-37895 needs backporting (fixed from 6.12.28)
=20
 CVE_STATUS[CVE-2025-37896] =3D "fixed-version: only affects 6.14 onwards"
=20
@@ -12854,7 +12854,7 @@ CVE_STATUS[CVE-2025-37904] =3D "fixed-version: only=
 affects 6.13 onwards"
=20
 # CVE-2025-37928 needs backporting (fixed from 6.12.28)
=20
-CVE_STATUS[CVE-2025-37929] =3D "fixed-version: only affects 6.15rc1 onward=
s"
+# CVE-2025-37929 needs backporting (fixed from 6.12.28)
=20
 # CVE-2025-37930 needs backporting (fixed from 6.12.28)
=20
@@ -12902,7 +12902,7 @@ CVE_STATUS[CVE-2025-37950] =3D "fixed-version: only=
 affects 6.14 onwards"
=20
 # CVE-2025-37952 needs backporting (fixed from 6.12.29)
=20
-CVE_STATUS[CVE-2025-37953] =3D "fixed-version: only affects 6.15rc2 onward=
s"
+# CVE-2025-37953 needs backporting (fixed from 6.12.29)
=20
 # CVE-2025-37954 needs backporting (fixed from 6.12.29)
=20
@@ -12920,13 +12920,13 @@ CVE_STATUS[CVE-2025-37953] =3D "fixed-version: on=
ly affects 6.15rc2 onwards"
=20
 # CVE-2025-37961 needs backporting (fixed from 6.12.29)
=20
-CVE_STATUS[CVE-2025-37962] =3D "fixed-version: only affects 6.15rc1 onward=
s"
+# CVE-2025-37962 needs backporting (fixed from 6.12.29)
=20
 # CVE-2025-37963 needs backporting (fixed from 6.12.29)
=20
-CVE_STATUS[CVE-2025-37964] =3D "fixed-version: only affects 6.14 onwards"
+# CVE-2025-37964 needs backporting (fixed from 6.12.29)
=20
-CVE_STATUS[CVE-2025-37965] =3D "fixed-version: only affects 6.15rc2 onward=
s"
+# CVE-2025-37965 needs backporting (fixed from 6.12.29)
=20
 CVE_STATUS[CVE-2025-37966] =3D "fixed-version: only affects 6.13 onwards"
=20
@@ -12944,7 +12944,7 @@ CVE_STATUS[CVE-2025-37966] =3D "fixed-version: only=
 affects 6.13 onwards"
=20
 # CVE-2025-37973 needs backporting (fixed from 6.12.29)
=20
-CVE_STATUS[CVE-2025-37974] =3D "fixed-version: only affects 6.13 onwards"
+# CVE-2025-37974 needs backporting (fixed from 6.12.29)
=20
 CVE_STATUS[CVE-2025-37975] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
@@ -12998,7 +12998,7 @@ CVE_STATUS[CVE-2025-39688] =3D "cpe-stable-backport=
: Backported in 6.12.23"
=20
 CVE_STATUS[CVE-2025-39728] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
-CVE_STATUS[CVE-2025-39735] =3D "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-39735] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
 CVE_STATUS[CVE-2025-39755] =3D "fixed-version: only affects 6.13 onwards"
=20
diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/re=
cipes-kernel/linux/generate-cve-exclusions.py
index 302ec8ebc9..ea59c15a01 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -42,9 +42,11 @@ def get_fixed_versions(cve_info, base_version):
         if affected["defaultStatus"] =3D=3D "affected":
             for version in affected["versions"]:
                 v =3D Version(version["version"])
-                if v =3D=3D 0:
+                if v =3D=3D Version('0'):
                     #Skiping non-affected
                     continue
+                if version["status"] =3D=3D "unaffected" and first_affecte=
d and v < first_affected:
+                    first_affected =3D Version(f"{v.major}.{v.minor}")
                 if version["status"] =3D=3D "affected" and not first_affec=
ted:
                     first_affected =3D v
                 elif (version["status"] =3D=3D "unaffected" and
--=20
2.39.5



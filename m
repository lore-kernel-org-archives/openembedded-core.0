Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8023C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:51:15 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6421.1783511469073216824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=A9jpllvk;
 spf=pass (domain: est.tech, ip: 52.101.66.58, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHYLt4q+9nFZkT5SNu4DsaQwoIT/jmmbsrDAIQPMbFU49y7eayHcRdbNx6Yx6jJuua1oQ8i2TjXJH41SYN3MUvNF/soEPa5DCh5ZDXTbc8S6WfGUxIyFfLrtwuCxHSQ4p9X+KOEucGcR8tQ3n9ATbZzf1ER0JrrCYCFbpnjc38Maxh/vzvjWla35KoGiOkOsTaCvOFJgY6rkeR6hw6SIgXQNIPohlkK5BrBaluhDpzkzhnhg7d9/6SxtIriIycsiju3mmcT52SXV5/fpvkWxsIPZfFH9wiIQFdjsHqjvzdejFCjQSFtxpgVlrwOC6KT1+Dise6sKJZrUq96432MmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DGnWPHxx+g7env2yvcweeIE4T4IPY10j808MQWa4JQ=;
 b=JrRFqcVaBPJCFWHxi6GXS71LmA+6OhlUaoO44Yvz7E4JVhbDFh/8lCYSKAGGPFgfcxSFEFvdBs1V8N9AOG1Rw3uxnN9lbEaAXVsfZg4LwlhTr2j6iQhAs3bhtCLo3ZwUcxypNfECUShxqzQyEdyvTZAY1XGk6PhfGr/azpc3fjai55gGvZs/uXSAzOh6U1JE7cJ8j+fAV+bpDPLh8tGrJL9sozoGPLheyTLvjTXPewCZHOsLMiTe8jHUkNNa7VwTdE8bp4r6LYY4//BG1O6/nw+uI9bnsVnT/LujXvgGNDSfbHk1uRWTQqLYc10MCypH/7TUzx2Ku7FC2vCTwkD/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DGnWPHxx+g7env2yvcweeIE4T4IPY10j808MQWa4JQ=;
 b=A9jpllvkPr/F4gjLi/q7OyhqfHZS4dkDR/DOgyvOF2sKImaaUD9WpoMx4F4cJ1RtxP/z/svjTeWBmzO2jVi5umVqU8fOrmpvH9n7p6eNfXh2Lbr71ZGBcwyz9pOElPL1cp48tSsJJ+84INn3f69lVLcNXDKeCGuIvQP/0vcVyWmeDyDAt52YMd8MqAoTfSHXrTlEYBpOOiZzAOtTWPDKHEiv6kQsiOuAGalTVHIXC6AbMq1JjW0Mzn2H2qdYcSRmBgkWQaiaiap1kMYQnLkwAy5jvvf70L0k4gwbPDfSEUY+kBYaHH1OMSVJU5kNCHIri/5MsLuMdVSVJj3R8WRpcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB3473.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 11:51:01 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%8]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 11:51:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH] glibc-testsuite: inherit nospdx to fix do_create_spdx failure
Date: Wed,  8 Jul 2026 13:50:52 +0200
Message-ID: <20260708115052.71740-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB3473:EE_
X-MS-Office365-Filtering-Correlation-Id: b8582b79-693d-475a-cec1-08dedce72e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qBc5aRp3H2UuRDJaGHZeareERmBINt19YtJFfUhhcLsVth29DiyDpWD7yMrESNGVF0I+NpRAM/qUuNz1iKqxxCqpP1LpT75e8jEkXn360DVOSVEa1c03mSqfYNRhMPrwvUvDNty7rKQfnSSqZmkhjDioI0L+FAIijVIGBJGqCAFjB0iT43/Zd27+6aPiVsPyDgH/hINnxgRWtrTLLVFlCCpo5eiRGalVetlXbEOAHLk1WQf+rfApKiDyNMXHKZ6c8vHSj4vMEncLDZyEwmCypEP0kESeOffsWB/7rRWbNXgub61w7NJXHqkYapFdhjV2BHTvpwUVIvKn2eYFerjUi+eMo9HjBo257qOBpzwAFp/vbM5jeaccS/u+Z5EpI9M9q3NY4lyXCWKKpMlxtgo555RmvJKwyPE59w+Zf0DBPP7xt28UlMoDwTfXPCCjnva1qxM8nCKff+i1LNcmq/NtZnJLZj8X9F6IpGB7LPOsqpobCS8dtNlDTNSP7i3XxdSE5ojPZnN1vbNW6uFXpNYv3OcwfwUcKSlxgnIbCiTsp+1S0JlqKOaOUa7mjDMHzgcOOWALK899/PeYNBfC804edRf2zcgVbu/fYD101rxyYPYKv1ZM3+w1wBm8FF1WEkERaWutR/W1wAFpJlH3HRIA7AUeuEfWqjTZ4+gKwQV0++4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Drv6LYgzbbsKxzhwlC98a6HJJoj5k3/nQHjO1pjtEoEnkaZVUjwezgCbvlu?=
 =?us-ascii?Q?V1NU69YPaRDd3VyLu4Jdl5R6mK+isuyhvwyjwh75H8qxLRWMK49cX6A8SmkG?=
 =?us-ascii?Q?oY9hmk4DAAWzWPaGLoM3RaQeTy3h6vuw3no5M1t5DrzQHk7nhIwNBushLm6N?=
 =?us-ascii?Q?w71RHdLYDhYGh8YtFI1FKR7DPUiYCRB/Og0/GAv2rT17gWxLJPkH9Us9v00T?=
 =?us-ascii?Q?YwIDwZ8ewsDkOcFlug4WbGLlwE3p0Hu5V5gRCG68yLG2kWrd3o/mOOzZNdte?=
 =?us-ascii?Q?1Rfk+IDtUO4vwpR21ZzY7CvnFkV7SWAkEL2gMQ1R8UrzCUvNhi6mwMIqjbp4?=
 =?us-ascii?Q?csDW5W64BsdPxmHQFBRkoWLFgaZWIiB4nZQOA2FjEZveyTmXhj5vvNkSGDQQ?=
 =?us-ascii?Q?Xz9tnlU+YkZe4MlolXi8dYcQxxliebVJQi6+k8f+m87KSmNqDWO6ChYfEAc1?=
 =?us-ascii?Q?oITh9R4BJeViPqnnp9/m7JD9na7wqRiDeiipr4W7RZ0pDpxntiZ+U0p+jKlh?=
 =?us-ascii?Q?a1m30nSoOmk5QhHXM7Hp8p1KAdwGj3Gn/6wTFaOwiHNGT8C5MYNdepoR2MPW?=
 =?us-ascii?Q?By0lKE9/AKMAhGpMlDQdB869xm/E0dLmP7TLONV1m6gcOgC/he80jMRV1UQT?=
 =?us-ascii?Q?iKaKxgIJPAuvSfLS1897JX4Lv6FkV537AHiZhnXvX7ueX73NCD/uAYRWge6N?=
 =?us-ascii?Q?028ObKENKnWQkPsCZW94ttveXcmL2i56OQ8K9j80r6Yf2neRTsNm3HgnDatW?=
 =?us-ascii?Q?CLUy3nh8juNSWCJmYOtFkDuDNdTOgSPn6p7e3GyE4I8qm7grnv5EfdXapFb7?=
 =?us-ascii?Q?JFHi8wjn6vdIexPptTfiiogMxx8KmdD3+RT3aEGOfVVVGCtkagv+2aCe7ViC?=
 =?us-ascii?Q?PxRiqg2jdjQCS3uJCdeC/oTWRlXKqane0667f3Av9GnbzOJM4YcSXyabEwPT?=
 =?us-ascii?Q?4MRp0kdxb+tQG/fnuOltkvau5yCdkfIPAuQ8B3JBbaPgC9CrA6IX91uQbP9S?=
 =?us-ascii?Q?FMRqaWd0ANrAcDj9LaBGK5yI5m0Z4fSmwpf9zShyShHLgaxpzOxUGcGvTzrz?=
 =?us-ascii?Q?IEMvONWogHJanlpcKCVLYykzbRaiqYrxW3A4s55YUKqacOIu4yuSgtUWpSTy?=
 =?us-ascii?Q?bfv2tKmOkvHIhx6G3+kprxieBCG1ZC4NbXCKkgj72zR/3SfzhgrT92DJ7jwS?=
 =?us-ascii?Q?tQRnM6MRxdNfiCaF7cOq4yWa7o54YLi9f0PB8RygPvOvcYWAMdcjVF02s1Z/?=
 =?us-ascii?Q?KXMDssMb1KxqImXmnjR1I7BD1iWbtsCwNoMq2COXfYU5kN3/YLyrLT/aCKh0?=
 =?us-ascii?Q?ysEPlDHBPlzfsMawq9kmSDwFVihH27iRqO0joHxniabmL6DjrT1dziN/bU0Y?=
 =?us-ascii?Q?cyP8LTte7bpQtqvzVMGJ0PcQpLOdFgf2xlozvNgLdvXvGz/hQben/dwDxgCK?=
 =?us-ascii?Q?vxtk9hlPYZDBnQ6re4zzf+Mpl+r1v6aZXP1cPit7NeJANMKSeOwB/56k/dRv?=
 =?us-ascii?Q?8m9gh5ofp4Qc81DwvDfeMwtwXLWx1MGUL0wx5n3Q44Rz8YqpgHDbil62f0SN?=
 =?us-ascii?Q?2Z5urq6N0M9ee13SJ3yQqu4Cv/daQGMSTRU1/sVyUWAZY6HiTaK4qcjZ3SOe?=
 =?us-ascii?Q?rPx/0CLvnMK9byu4GWtMYvb3z6BnL6HYszzIIOV/TfH/psnIjnXlC07jRUL6?=
 =?us-ascii?Q?UTdSedT6nT3xjXmuF635U8YYsgV93U9FkJIbNf5rGmHH6dRJ4vTK6B2zao4y?=
 =?us-ascii?Q?Yigy97LHggv8sXPmI0OaYo3TsiL9nkU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b8582b79-693d-475a-cec1-08dedce72e91
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:51:01.1169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPMKjJ5y4OsgAlsNvP1sPnvGnFScIVCryQ02G5ts8n7GvSLJ0OTIjLMAehnJftB8e4VGtJ7i8YZNxuAdK/z3iLDHXjbs0/TmFcseZMt7w/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3473
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240476

The glibc-testsuite recipe fails during do_create_spdx with:

  ERROR: glibc-testsuite-2.39+git-r1 do_create_spdx: Recipe glibc-testsuite
  is trying to create package sln which was already written by recipe glibc=
.
  This will cause corruption, please resolve this and only provide the
  package from one recipe or the other or only build one of the recipes.

This happens because glibc-testsuite includes glibc_2.39.bb via 'require'
to reuse its source and build configuration for running 'make check'. As a
result, it inherits all of glibc's PACKAGES definitions (including sln).
While the recipe already inherits 'nopackages' to suppress packaging, the
nopackages class does not disable SPDX tasks. The do_create_spdx task then
attempts to generate SPDX data for packages like 'sln', conflicting with
the real glibc recipe that owns that package.

This issue was exposed by the SPDX 3.0 backport (commit 9c9b954504,
Nov 2025) which introduced stricter package-level SPDX generation.

Fix this by adding 'inherit nospdx'. glibc-testsuite does not run on
target or factor into the build supply chain, since its purpose is to
run tests in QEMU at build time.

(cherry picked from commit 32801348ca231978498612f3ebee121ca27459c1)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/glibc/glibc-testsuite_2.39.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb b/meta/recipes=
-core/glibc/glibc-testsuite_2.39.bb
index 2e076f4b0f..e0e3e8ba84 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
@@ -31,6 +31,7 @@ do_check:append () {
 }
=20
 inherit nopackages
+inherit nospdx
 deltask do_stash_locale
 deltask do_install
 deltask do_populate_sysroot
--=20
2.34.1



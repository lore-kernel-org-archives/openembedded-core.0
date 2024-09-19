Return-Path: <quent_55@hotmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC729CF396C
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:33:24 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.92.49.74])
 by mx.groups.io with SMTP id smtpd.web10.3394.1726777998028084912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 13:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@hotmail.com header.s=selector1 header.b=trq0l2jG;
 spf=pass (domain: hotmail.com, ip: 40.92.49.74, mailfrom: quent_55@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQFCPx1AWSrUCumxp5qjCm5AK+xtFs0ohvWJ4P7gf0NL5/PYQ9OWBXFcEF8FRrafXCwpITIGsES6HnsAEQEB/lmua8QHuI6YSbgAHf0ieUFq5QcajNbeTSvCXbiriTV43aywQixScDav89Nx9JhqWA0QStgigvobo/3vQuLBEV6mYeK1Ir5qZfEj+6USzfihoouOmrsoGGKJZYEr8lhap4KIfO71rYmncSlT0uti5wVxBadox227VRTqRcbVXJuDlt15dYQgJmmfVS0Zdv/HQfh9iA1c4N9AGoDw0YS7a+eKEilZA6mTUKymC2Z6uHIb0cCLxf3VAtBunwhZ6zCOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tpGxJW1gTiB/ujaAV51jQg1p4uJ57dQShoMj+dFjso=;
 b=xJzmd32T7DC8rpsMB7/4CyAXBcdh0vDguVHlZ2my3fnANJmTbBdrKN26h9YvntiMn0/oqUKAYQYKN/znNRkIicr12BU5Zj19p++JsSKLzPM4DHpYUTsDKFt12pch1jtX5uSWVcGVZtXG2u/nzqMY/t5Gh/S2Ae8lrXRXoeMOE9ve0nCfyokzdx+5zl/a9DuRt/diLoRwGWkcTdvEGFgD2o0s3z9fFwXMbOfMuDqrZvpUKmc9cV06n/+QaVxh8zIi0EQKd+gvHu6dueSg8wXJwDLu7ObBCW2cpTKC0g/Y/izikcNz1xz7hrBeNxjwc9kTRra6A/NMZdtgNtQYSiHhzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tpGxJW1gTiB/ujaAV51jQg1p4uJ57dQShoMj+dFjso=;
 b=trq0l2jGk7UangoNhgt8GwJvMaq627iQi1rjUjerneMY8hPQ1qQxrhKvnBjoDk99FHUSVIABjXwDThdXYeShN7wZ03rGP8LafSvZTB8pFN0GBTycLlBsly4qjBFBIdFwLpB5KQVApFA+z4FZt9V0otlZc1cB+X+Y4PqJIJWLo3TTeGYjl/nQ4nA+hfOrYbfonQt3USN++yv6KQo/EtJxLGRAk0OYPs5QPuHbYlWVfMeNVZUCrQRaaDG9ilKq55CTVTcj5ueAZM844V/e6LrKI1ew8COsxXiAmGSlYUnlVK6NW2kHyk8d8FezC0x7x0P+VXhbVMV73ZpDS52IxI+tsA==
Received: from AS4P195MB1645.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:505::17)
 by PR3P195MB0944.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.18; Thu, 19 Sep
 2024 20:33:14 +0000
Received: from AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 ([fe80::1055:1602:12e4:49c0]) by AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 ([fe80::1055:1602:12e4:49c0%3]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 20:33:14 +0000
From: Katawann <quent_55@hotmail.com>
To: openembedded-core@lists.openembedded.org
CC: Katawann <quent_55@hotmail.com>
Subject: [PATCH 0/1] cve-check: add field "modified" to JSON report
Date: Thu, 19 Sep 2024 22:33:04 +0200
Message-ID: <AS4P195MB1645F323BD68AF2D542A7E3BEB632@AS4P195MB1645.EURP195.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0019.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::6) To AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:505::17)
X-Microsoft-Original-Message-ID: <20240919203305.64841-1-quent_55@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1645:EE_|PR3P195MB0944:EE_
X-MS-Office365-Filtering-Correlation-Id: f197fe27-dc8b-4bd2-eae4-08dcd8ea48df
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|5062599005|8060799006|5072599009|19110799003|461199028|7092599003|15080799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	zrhr+UqntII/12/XoQDIy8iaiV98AU0KNf0jbSKWGNXlTQpW0MH1cBiw4y+D/kaOq0AMOb6yugXq2+iyBYookvEe1vOK6z3wu3CdRULSi11eHuyuZh2cWIAzxhf2Ady0/HEMLiOGLmVsAfTVLA/ZYRQQB4bH3JeV+0nfcgUmD2FviS7ArcXBzyPZnejha30wDlXdp011RdZPRnstcsi31PzC/1WTp5iLouM4b6CIMT1IatN7hcTR5SsyzqZNdV53zFto8+auKNr+iogkzneUmnZ7iws97ckcC7GGfc6P9ykG+r09pM5zrt7rQy0whIsqt9nJYCpj88fk1Nf7e/8yW2JbCdcXla5lgZV0ytfg/Z5upbXyaRVVcsth1EXMdgf/DnXm6I4q73hItjDLJWP4pszsTDPVX2BfQBKxBBBfB6J5XR10pATHJLD2wT8wZSGk/EYc/AoaXbTLfEswWgLOwJyHy1RVki0uAV63rXXLgd+ddRwdyv19/w6eFjFBO31rjrZ8Y03wmuTvRXvB6Z8whizGKosrSuSOHWJ2XB0OLEmxiCUORivlFg97ZSjnatt4WRCaptLjkgnUwHvAVXCA4i+jfIx7zp83a3t2T0zPhgw8PiESWTlXIRnviMor+p6vhJ4MbgPYQhGGMuuIq/4E2fdOH2cZk5CDuopygABtbeKNgei+QaG0ekC5afVwChmDGtqcpiATHTZi5mVM94Tw7TG6jTrjFp1/x7br1YrGlqxFxF/jC3S6n0UfCnN4pKXyDmUNygmI9SBcx0eBJffiNFP5ymcHntaDlmsr9RKn/UA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vra1tbkN6AGhsEHt5QOZF6X4gOXcWpo+11TSig3c5lsZvTBDZMu1CGpzuEpQ?=
 =?us-ascii?Q?txrd/c1Utb98p1VbsiDLtJeHvQIOV2JtVGHPnhBjMaYw1PuOZp21xve34ZgP?=
 =?us-ascii?Q?3qvjC9aekGLS4rEyv7cIE1KY04ADF2kwF+C3BvJB98XrROgMuUdgHoC1+oxx?=
 =?us-ascii?Q?y40/QBxQe7dCSzse8VYNwdoSiFA1NF12iZ3zPFWNx5U9NYxwaY7mDNCtppbg?=
 =?us-ascii?Q?tvfPtWt+T4k/6XgSJhm0RfaZGhxHbqdB3O35oBqN5dKJc7UBpfQPW4NFFPv/?=
 =?us-ascii?Q?T9zZuX//1ZHZrafqbQ6hmFSka9Sn9do46JBtA60C1Rny3f6UkdO75g0RCK7a?=
 =?us-ascii?Q?732Z32JWZzXiGju9e1MAbBBWUGVwfFYvsjoa9IaVI9+I6akl98v3n++jQ5v7?=
 =?us-ascii?Q?xUBpR4sjiSilEhGwTcjLfjstpOz5T54i1ZUgiqpJ6tH7066pFjPjhhlc0pzd?=
 =?us-ascii?Q?3ORJuRzBlbm85p7QF7urbDRFWNc2Za60uAzXQIjrTegIFhx2fdfiLkJwiU9Z?=
 =?us-ascii?Q?EQIMU/0KEzpxip+fZucHmyOHxKc6yyZa8xes6P0HuHU6Hhu8PU8MeKiwfYYY?=
 =?us-ascii?Q?DqXoJsuMT34h+lSvU0hoRUzFvprwI/M/6AWNyAVXBKSw1rXKtImeVJoiR5xO?=
 =?us-ascii?Q?YSofoYYHf94tZnR7PwZlYqTs0OtSoZzqe/3EGe2a2x8Gr+VjcHe4ofA7aodh?=
 =?us-ascii?Q?NEJkD8t3+Nppx7StmcG78+674EwjEaiimIKRHXArya103L8ecab4bKVmO8gq?=
 =?us-ascii?Q?k50kkD1/LnVc6rlbj9wNvwad+6O38aGX9W9Pgoj6jdNYA1KcO57wOv3YlQ/W?=
 =?us-ascii?Q?Z9lwiMzHjK3I+XYcXpxMj5PRvNLG7679/Qjsh8YZifskFeHWRuEpUpJmuGLb?=
 =?us-ascii?Q?J7GlF1njwcfQ0Psaz/5vP6h4PxlnqpxL72/gEgNAKIZguDkTwd/3ft7Jv4p2?=
 =?us-ascii?Q?XVVjZ5x4YbsWWFrGE7ycgEoWZ4cFJYtzlgmV1TpS4flPWyueVR+dWRQwD+oz?=
 =?us-ascii?Q?BqhIUFAj4Wbj466gRgxMBM5d2iUNb/TZxsOwQLYnwLTCOmK1D+5GFDx8ObPA?=
 =?us-ascii?Q?lxIThi29djosdatIagg9wKoGTepo7AaNZeq4Ns6g3JXz3LX5ImOfSzGg7Osc?=
 =?us-ascii?Q?0E7s8Q/I/4igZSlw6BH2Q95nEzbPrsy+JD9JWKg2kw1kZb/SGwFgBgN2EMbz?=
 =?us-ascii?Q?nfNU2LqE5iLlkZXB9XMUL0p54tXP7J3au5gGifwX5Ye7Oacry5Ms1s2UAzM?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-1ed92.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f197fe27-dc8b-4bd2-eae4-08dcd8ea48df
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 20:33:14.3111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0944
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 20:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204711

Added the "modified" field to the JSON export in the cve-check.class. This =
field captures the last modification date of each CVE, providing more detai=
led information on changes and updates within the exported data.

Signed-off-by: Katawann <quent_55@hotmail.com>

Katawann (1):
  cve-check: add field "modified" to JSON report

 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

--=20
2.46.0



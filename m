Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEBACAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 12:29:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.10])
 by mx.groups.io with SMTP id smtpd.web11.15645.1758630555312777434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 05:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Ysy4EFqU;
 spf=pass (domain: cherry.de, ip: 40.107.130.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CF9bTzoMZ5oYK6rG7i+bVdJaFCPvvGIsuWKbetRmghAY5c3n1QrXPVb8aQZgTFph2ypkjc1YlQSgNs8/SUe53DhENfWB4GIqMPp+7zZGNDQuVJZnDCbpIlBr0IFC39bUAwfPWwxwhoOfBgl8kei6DOpXlplhXpffTHJ/NXEMSRAbAJ5paVlsuuEZaH+fUclcG9m1MfsYCedhzmNa3kIeC33/j5rZhCbPWFtazq/TmDOxpT0GteMDD9vJb/acUJ/u7ZDYx2MOu1P9g36iZtYviWuhPFKC3cR+8b6mULGu3a0lFI/E6pnQZIrTkLQLmvtwO3lOvfMkA5SL/hdGMfvoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHCOVKL+wSiCTqnKjBX9ccMA3BqXccp0KZZBfy/bFOg=;
 b=TAUPsBm6uZR+tYiXVfC+KrFYfqT+6m0AbobpbRHl7sgikmor2FA5wj2B/g/IiXVx68jZIyXvAwpXzWH5Mz+SlVHkc8DH/oc8Po7GkWG1RGTMqPuWGzcJhrKUv9irIVYZ9/QEHv82ccmSCEykXZ3mhUHQ2gRfngEDZbObz5UGbdrq1kgYjcF7UqE6zYwE9r4s/sT7V+tYrGVp1znEk6kJUais3sxUvBklc6MAe0YZM/hDrSHog9e/fMMhHwZw1oiakMLasrzDgMQT8pNus6QGERopKyFeGE0jczEVBo80fHTbnpEJYFfeD+hRgkkghMzqcT76RescmGpCiAj44jsx6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHCOVKL+wSiCTqnKjBX9ccMA3BqXccp0KZZBfy/bFOg=;
 b=Ysy4EFqUECTvOXqJiwshdDDBKjPpCpKDLkQPjovpyvdW7KlmWS4b4oZvxumhDlnXkZ/oY3f65ftFP0AeZbDxOXYq5OErEQ2aPtL9BXdW+2T4WBaQrAKZi506w4WRjyGXDGR98B6sJboZCEiP26bUZ+/Sk3uSXFmfB1/xikGffNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10133.eurprd04.prod.outlook.com (2603:10a6:150:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 12:29:09 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 12:29:08 +0000
Message-ID: <2bcb17c0-d527-478b-9692-00a043a4608f@cherry.de>
Date: Tue, 23 Sep 2025 14:29:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] kernel.bbclass: add lz4-native dependency for
 Image.lz4
To: tudor.ambarus@linaro.org, richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
CC: peter.griffin@linaro.org, willmcvicker@google.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20250918-kernel-lz4-v1-1-b40ccf21bbe3@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250918-kernel-lz4-v1-1-b40ccf21bbe3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10133:EE_
X-MS-Office365-Filtering-Correlation-Id: 2461dc46-4995-4641-74a8-08ddfa9ccb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1NCB49vXKInKj/vEqKBf3txonJyoJNk3HXxtviQL1LtCdGCaB7S7i9P0rPoy?=
 =?us-ascii?Q?h3X7qXCTEruWOQWyqBebuCkMWGnjWGAB1vY7sgvAaXxSlt3YFP1skXqlKUic?=
 =?us-ascii?Q?H3B95nWV92lCLPOPasbS3bwhu1xLC/06w3T0Pij6etSs9yiEUAKE+LpByq7v?=
 =?us-ascii?Q?5NxwYgKstpUS4LLFe35At2VGvPqiSynmlDIWupv1O73DLJ/YzMgAym+OU5NR?=
 =?us-ascii?Q?zlzE3eSNaCcD5recOPHBZ4JZIdu/NBKmkPWVatetqUz2JJj+oHSKSAnFihK1?=
 =?us-ascii?Q?Yh6pFaO7fTvAcpbRyKc+fYtK1OZ9kwAKe45o5JqZJLZO0N99Wh+Fpub0CHZT?=
 =?us-ascii?Q?B2TO9Upu0gN64yPlmuO/F/e4dJUxq34kCuSJ4SNWMAFinxPqopTLC+VMf+uu?=
 =?us-ascii?Q?CnF0j2II7bY1Zg8bol4eSgTgLG+vO6M2RJR1vZT64FDwed7YpeGIDySInju6?=
 =?us-ascii?Q?0pDLzWZrNZTHI3SInjIk7+XDHzEHQoumLmmmU053VoQD9JkRk0DoRA6Rqk8e?=
 =?us-ascii?Q?mHrDjezAXCeNL2kPlaBAH6Xq5p4rSo5vE9BaI84623a0HHCPV6YFkJLhsxDr?=
 =?us-ascii?Q?ThSE/RsTlcUwaNtD1nRTewZEvpxhJrteO/hjdq2MJ/v7dNuvzsHYp25sagLA?=
 =?us-ascii?Q?+p+bRouqatX82Z4/0PZYtYeLE3hVrnSCJax5PTiYUr0WeuYOgjubnRY1lN1G?=
 =?us-ascii?Q?cTvghir4oMV7cR2d3NM+Bd+5aeT4aCvMRas3zHchXyimHXJYq+fkOYNQhrkq?=
 =?us-ascii?Q?JJ9a+4yJTnPSeeIv0AzZu6DcLc2bOEjcxt4AEnIowi0HD8JihycFbv5/Rk4w?=
 =?us-ascii?Q?eNCJy49y2yk3mKBVyf9iE4zp6VpjqykhajyDEiOds14d/4z1Rcb4NQhlXf83?=
 =?us-ascii?Q?y6DRBT8RqDLGIHcltZsEbEKKomLmY6vD1HcjqOLK2seeNaokn02wEQ0TCPJl?=
 =?us-ascii?Q?/8goA2KRJK2ivPXO2GThFHeSoaVZvvL2GCLqe563RI5ZdtuaSZA562mp4xmK?=
 =?us-ascii?Q?C7gthU0V9WtK2q3u6In9IyCKUDOD8fBOO32NOXDoJO2nQ0I62wzToRv9OsWr?=
 =?us-ascii?Q?p4tQajBkUKOYmCD7mYKAZ7kcXTAwTKjld+gza4EBbCynbCxVax48jT0ervv6?=
 =?us-ascii?Q?Bz60NLbY3TK2nCZZaMSxdqCpf+7EBJvwTyQ1qA3jY1+oZWVhCWmLu912BY+g?=
 =?us-ascii?Q?aBmD9xRl/85hDOZkCWONtTj3ds+TC07EAIck8Wkh6RQybu4tNZr0b57FaHL7?=
 =?us-ascii?Q?EA3kgX9kvp2mXKbyT8IZkUD3tHvzcDQrzQtqt6b7yqIQl67wpSwoF8vtcmUb?=
 =?us-ascii?Q?gx8Iy7AjqAEUNmgeXFyoTMrPa7tzgwlhQIocNpyXacSUsH+jBI1qnE5m6cUV?=
 =?us-ascii?Q?i0lbHIRBLbYsHr4Y436uSQ30o7JhRPLW/sAVot1DehqQmOFtAA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qfQhW+pYPVmbkm3luYXEtESkgGSonJUNXmB9FjqQeknv73e8sawTViMC6To/?=
 =?us-ascii?Q?jQu8FnWYm/glWkdTC6J4WriOVgtCBrzXLD3vW5NumaFnXunUH2pwDN2wrSXy?=
 =?us-ascii?Q?m92aCikl7jApTDDMZTPCbwoJh+DmhtyE4mStiGfkmy61BMkULvPQ44/g0K2Q?=
 =?us-ascii?Q?tvyJdNIdiHN/l/vVQqgAlwJdYvN0ijs9m6IWBvbYiQA2cdJ9QI2RsTep6meL?=
 =?us-ascii?Q?LFUn3dHMTRQdgWzsj7Ja3uBIEGuDL51SuP6cZxY10KGS1ABv1kMvOq9HxopS?=
 =?us-ascii?Q?441pOMiHO5m0BezvBDrtaLpu7RCbwky7oi0pfV/BuE5R+YWrNFg0zUGJcZ6h?=
 =?us-ascii?Q?AawJfMqCorAq7Cp71qzmhv5O8H+q9EimNmNtnIumzjzwImYhJoeILRcyxZvf?=
 =?us-ascii?Q?gp+5nO6gGDKUSeUtdj0dkl48xYJSIn+KuFkPtdignI/UPNpi06tkIfy309CK?=
 =?us-ascii?Q?2JVr/ZSqlL7LRT+z2LZyTdBX3IpopnRYBBcES3c2M+mlJ0eZPIYDRRpHJ47b?=
 =?us-ascii?Q?7GUq9uzxeZtXcxt7m6k2yGvAxJtyQrbH4rSi7P2NanCZ7Sk5dPdpLlXLQRuT?=
 =?us-ascii?Q?+ght9iPf8m26bI6aYBt9U5mT2CSJ5KRB0ezMiwHm7MFxjeOkZiI7C92VtbPV?=
 =?us-ascii?Q?OTgmb79wS0ih7mkF9gxa85UDRVpYcCvsTq2GNc2QeNTII2UB29BvS3Pl3A4d?=
 =?us-ascii?Q?XpVFxx3B3/w/lz8HnwAIgstoHlZk6IEboJHE0wUcdA+m5T6iuO3i/XvtIyFC?=
 =?us-ascii?Q?bb4qkncBFnRcMisqI63W7Ni+wn7NZsu73WE25FEHZpgBPjqJZ1/1JhgOgE+9?=
 =?us-ascii?Q?u6gyC9sJHn42S+20qlom4tsmulKBzsUEmE94LNs//vlo5XCYcHPjfbAcVRZJ?=
 =?us-ascii?Q?5IXKsPDC1AFvoCWMRyMpomn7X3pcdoJSAyW4E+Aih1K1qw0mBjyKCZorPV0A?=
 =?us-ascii?Q?jRs3R8RkiQJVFDab4fM1IV6DsiE7KbkA7i3fU0ySCrp77Xt/JKu1/ISEbsOG?=
 =?us-ascii?Q?gwoz2I+1KLHsoH014bNPoulyEglzte7em2NSW5XyccOadkJ2GoBU4uia4Ok2?=
 =?us-ascii?Q?5QwywKU8VbzByp1a2Icp08glVpo+SFHEbfpM0+npkcOAyHD1/ahLvdq/a/a8?=
 =?us-ascii?Q?kLWcmkbk/6D6rDPUVpqMVrd1pzUFCPAWhWcHJM0zJ0yiZoIr4qnhWofFYOKC?=
 =?us-ascii?Q?vs5VxR/nyEDgY9O/TV9t0mRDnawPOWO2y5z2tnxNiHek4gXmm2qC6mQsEgR6?=
 =?us-ascii?Q?iBt1PW7HvYzYSZmDSPISupUUhmdjp/8B1LCdhF6EkSJBGtmS0ILsiRQwDgnT?=
 =?us-ascii?Q?7aghklWJTDu2hnN0ABLtFI++S8KByvccY/uN7tewo2v1eguVkq11f/9Jk469?=
 =?us-ascii?Q?iXhftY40y6qcP70fYz5dZ5Ls0IBkUQkkAHEM6PBxbTJYa0mxlXt8mjwjQXx0?=
 =?us-ascii?Q?jceFalnIos3IRqE3sXbPIp3siTOtFmgo6bGp9E7KsPAC/QIk45GVAbOAD/FO?=
 =?us-ascii?Q?XJkN5ZK2664j8mLHp5Vv564EOJ5NFCQf2rFuO0Rv0RYZSQVxjZZJnBv29bVl?=
 =?us-ascii?Q?1EBP4HzkT49lCj2ZTLM/on/AniOJRcA9RisOpfYOw4ReL3Mec3c0kgF5JaRp?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2461dc46-4995-4641-74a8-08ddfa9ccb2a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 12:29:08.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOEJimsjwvN/4YjpH7BZTmSGEgCkY9G+HKgrSvz8pQuxwLCpEK3h1YMO5fLZ9LZaZuTxpHHNkPYzVVUhnxmWgH49cKLRebQgnAk4vVD+yG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223872

Hi Tudor,

On 9/18/25 3:01 PM, Tudor Ambarus via lists.openembedded.org wrote:
> [You don't often get email from tudor.ambarus=3Dlinaro.org@lists.openembe=
dded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIde=
ntification ]
>=20
> The pixel6 kernel build fails with "lz4: command not found"
> when KERNEL_IMAGETYPE is set to `Image.lz4`.
>=20
> Upstream commit 0c7dc5bae1 ("bitbake.conf: Drop lz4 from HOSTTOOLS")
> dropped lz4 from the global `HOSTTOOLS` variable. This meant that
> the lz4 binary was no longer automatically provided to build tasks,
> causing the compilation to fail.
>=20
> Add a conditional dependency on `lz4-native` directly to
> `kernel.bbclass`. It ties the dependency directly to the image type
> that requires it, making the build more robust.
>=20
> Suggested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>   meta/classes-recipe/kernel.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index eb03424dfc3e023842f7b67ef47468210af72cd1..003a155e794388efd3fa29c2c=
946b18542f4cef8 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -20,6 +20,7 @@ DEPENDS +=3D "virtual/cross-binutils virtual/cross-cc k=
mod-native bc-native bison-
>   DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lz=
op-native", "", d)}"
>   DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz=
4-native", "", d)}"
>   DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zs=
td-native", "", d)}"
> +DEPENDS +=3D "${@bb.utils.contains("KERNEL_IMAGETYPES", "Image.lz4", "lz=
4-native", "", d)}"

There's also gzip, lzo, lzma and xz support for aarch32 per=20
arch/arm/boot/compressed/Makefile.

Additionally also bz2, zst and fit for Aarch64 per arch/arm64/boot/Makefile=
.

What about adding those as well so we cover everything?

Cheers,
Quentin


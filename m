Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6558EC021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 12:39:12 +0000 (UTC)
Received: from ZR1P278CU001.outbound.protection.outlook.com (ZR1P278CU001.outbound.protection.outlook.com [40.107.168.72])
 by mx.groups.io with SMTP id smtpd.web11.44138.1740034804163854923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 23:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=Pf9r7l63;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=Pf9r7l63;
 spf=pass (domain: duagon.com, ip: 40.107.168.72, mailfrom: jorge.sanjuangarcia@duagon.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LbRZ7x+7cI4GFNDrYTvtVsxbt++AuspKX8fVXGtY9ue9cBb7srq9ZNe9cjrMK8t2u64Q8ogRDSCjO+LAN+ZgzRa3TssUbEtmi7zWUkoJIIutix4jcGwU7adqu6ZfIOEws1/BqN++Q/wCmpZNh7FtpRcwk8BodBgmzqwHQlmY27YijHHzzKsH8PURtjP2KXTXbEc/wR8X0smfUFPFfHjzYfh7tRDJTD7jJWRMcR959NGCxByyJ73EkMCUqu3BXPhqEsalpIveNGYrS695K7dSmWKoOpYTdPpx9VlvWjESYm82rxcu8l4ygJ9ImhUgRvrYUb0AdsuKImoGCLQmj1BfxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xc6LMO1BjLSZIsK+25DD5aEnlAOuXuTnWXQwPE2K2i8=;
 b=PqtqfcTctLopxFtcaR9Y38lVZfxh1OVFiQz8efp0iS+4B37rqgZENuQbxe5sQAIGFqAek+e0Iujf6YodfZaUXO56hd3DDUeli4lLvdj/HNd5WnOGUhh894hzkMS9nDfNISMWP1MR4KpSCpKA8N9Dk+xtU0l62KwSUC29926kcNqTbkFWtIiqTRRvcyn9YTdmJimNgu6URz6GTF0xEDCEEsfo059zZOgOBvOM6u7EUYRXwi9f/3DGmjnbOmEIl1OirxngbY2s2nO/rWycoKXYyrlOUKHUQxc8mtxxkju9063+Cemo1g4oaPlZzJA7lU66kAYlkrg7VKpzRnmSqlSr1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=pass (signature was verified) header.d=duagon.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=duagon.com] dkim=[1,1,header.d=duagon.com]
 dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xc6LMO1BjLSZIsK+25DD5aEnlAOuXuTnWXQwPE2K2i8=;
 b=Pf9r7l63tFYP6yVtuWZUEvzVfMhKNvzvRYRWZ2jbN/UfhLk6HcRFsoQOLS17BTjw2PRe2eafz1TvXgG+R5OixZahr8gZVpAtjAIY6cAyiJhXsFsjhrKlr9jB9EHKS9fdQnz1PT4o3Va8ETIWHCStCB1YFNJ04CIYBPz6XFi4VcI=
Received: from DU2PR04CA0236.eurprd04.prod.outlook.com (2603:10a6:10:2b1::31)
 by ZR1P278MB1325.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:6b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 06:59:58 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::5b) by DU2PR04CA0236.outlook.office365.com
 (2603:10a6:10:2b1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.15 via Frontend Transport; Thu,
 20 Feb 2025 06:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Thu, 20 Feb 2025 06:59:57 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4Yz3zb6WRszxpC;
	Thu, 20 Feb 2025 07:59:55 +0100 (CET)
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012053.outbound.protection.outlook.com [40.93.85.53])
	(using TLSv1.3 with cipher AEAD-AES256-GCM-SHA384 (256/256 bits)
	 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Thu, 20 Feb 2025 07:59:55 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4isJCXNIF2KE4LjoDdBfy9d7R4dmKoMisCk8XOE2ICXf6JjA+BhW8li+Bc+oVXDAwvMYPUFr7Pug/tCHFeTsv102VpoxsKdt4kacaIT3XdvlT7SAszjcfChN+ojEhgZEgOMnwMukC6NcDg1Wp8zjZaXVOGG1ZK+Faz6/YtKzZNT2qG6ON8Usdo33SKXi6fYLKEcSmWP0hottQJ2P2Z9pKH/QxGeibn1j60skgJC4Ch/36+wjBoPA8klpWclTXpjNXAPb5NsPIUZCQ90l21W1KyElwYYnEyoUvd67VQ00pmMnUnqV4tBqfc2Pz3d988TtKjxjFFhmcTAJMbsS/VnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xc6LMO1BjLSZIsK+25DD5aEnlAOuXuTnWXQwPE2K2i8=;
 b=SqvyZKZKkGfFocgXez5ZMST1pe9jRSBfsSRTXZ9HkAwMBkf3IVjn6O0lO30g7lgOVup9VbH7anFmqyMULEWPiswkOh9kPWfzYxbyb+80p3YZd4AzWQ8um+YX0Mx07m42n+CGRi9hRDaIPiBrEC+j2CuY8xi5L5DRrMKT+bdW4eiht2O6mBVWaRBTrR5/S11jvJq0YX+7Jx3MSve67CKA91+WnFP8OWfBCKvdPK/tyXSNR9kevWFeuCZWZOkf2jdsv4Y3w+t5hjW6XIHEMt0uasvUfd+WYpmkX3U96EjV1NKLHfwK0maMP4QFw5c7hV7URrHdmYpIKt/U1LZO3MT6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=duagon.com; dmarc=pass action=none header.from=duagon.com;
 dkim=pass header.d=duagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xc6LMO1BjLSZIsK+25DD5aEnlAOuXuTnWXQwPE2K2i8=;
 b=Pf9r7l63tFYP6yVtuWZUEvzVfMhKNvzvRYRWZ2jbN/UfhLk6HcRFsoQOLS17BTjw2PRe2eafz1TvXgG+R5OixZahr8gZVpAtjAIY6cAyiJhXsFsjhrKlr9jB9EHKS9fdQnz1PT4o3Va8ETIWHCStCB1YFNJ04CIYBPz6XFi4VcI=
Received: from GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2e::11)
 by ZR0P278MB1124.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:51::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 06:59:54 +0000
Received: from GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ae7a:9620:b675:152e]) by GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ae7a:9620:b675:152e%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 06:59:54 +0000
From: =?iso-8859-1?Q?Sanju=E1n_Garc=EDa=2C_Jorge?=
	<Jorge.SanjuanGarcia@duagon.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3: Remove DEBUG_PREFIX_MAP from sysconfigdata
Thread-Topic: [OE-core] [PATCH] python3: Remove DEBUG_PREFIX_MAP from
 sysconfigdata
Thread-Index: AQHbgqeJiOnsKcgZp0ChitLdHnpWrbNOnyOAgAAmYSKAAAQugIAA+occ
Date: Thu, 20 Feb 2025 06:59:54 +0000
Message-ID: 
 <GV0P278MB05161B8DDF7850DFAE8CDBEC8BC42@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
References: 
 <GV0P278MB0516B168ACC6F3595C48BFE88BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
 <CANNYZj-CjpPU5=4Gcc2S1-CLwn2MJ8qHn1Pdu5zP_Rza=rjBbg@mail.gmail.com>
 <GV0P278MB0516B25A5B62DFB34E4F53D78BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
 <CANNYZj8CN3kEtxsMkm+DgMYmBgD-o94HYbk1QNWfQyVRmaDFyg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8CN3kEtxsMkm+DgMYmBgD-o94HYbk1QNWfQyVRmaDFyg@mail.gmail.com>
Accept-Language: es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
x-ms-traffictypediagnostic: 
	GV0P278MB0516:EE_|ZR0P278MB1124:EE_|DB1PEPF000509F7:EE_|ZR1P278MB1325:EE_
X-MS-Office365-Filtering-Correlation-Id: cc6debab-c143-48dc-0c17-08dd517c2fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?iso-8859-1?Q?D8TgEgOdUMISKDwHfu12bSgFzSUjeL5rFZVHw+ugHqcTWbEVL3CQSbuhK2?=
 =?iso-8859-1?Q?EA2yGIb+9F3YixvDaiBE9MV3y2WsGBAXoIaOdVP7+qDsdm+YlDNvXi9/aO?=
 =?iso-8859-1?Q?nIvHvVgD2oFhogsPbmkzWKX/SbhDfucZMSvi6+ESPb+l+et2/nI8WWq/qT?=
 =?iso-8859-1?Q?JBNObRxqda+O7MEJlrTQs6CfhZYZBDm+Ws5cnmWeI8wBYjo7KhPhOB8Rxd?=
 =?iso-8859-1?Q?QY8lT1DE5akkXuTgu6tJeRc4fVYo3j44znlnGeVjMuIl5PuriiA7RnPjxj?=
 =?iso-8859-1?Q?85+1ktLYiMFhGJHfq4vAiowQOsAhu2bdsSL2wDKQ+LxSEtAN7Fwj8ZyP+k?=
 =?iso-8859-1?Q?UH1ng9BJzL8YMGqiLBG11lm9y7ZJ1D7nwCdfHdSCHl73cQvSQSDhWDUyRx?=
 =?iso-8859-1?Q?D2KL1YZB380JDhAaKj9PIHg1W+jUDI+i7US7Z/oHFdgQED8Ss4Xe31ZUcG?=
 =?iso-8859-1?Q?pp4y6AfytfVMZWy6ZWjfo7xfR8dWlZ0Bv8IwuCAcm5ckljXxyfxd0Y8u1y?=
 =?iso-8859-1?Q?dgeifHTH2xaepCrmhi3sUgk2jN8TU7lNohV3tvytPpNyHxatnLLijnhUNi?=
 =?iso-8859-1?Q?rHbCYZXS1oHIRjcLLFzLSj1jF4Kf0KvZikjqzENDsTlgkJpQO2PvDB0y+1?=
 =?iso-8859-1?Q?SqC8qh35l45ZGpmIQ09xC/q3ZUYOtII1to4+Va8DEi6n102YW4+KFAcJmT?=
 =?iso-8859-1?Q?5gmWPLD6VZMHP2pBdhQyStcN2rk3BhvjJd1TQwlYl/gz2GKbQqN/G9hO7+?=
 =?iso-8859-1?Q?vTKTStbFheit6lGsMl9BYbvYFoKfwVE+uJp0QNaqDwM3/FkH07/D5ON9rn?=
 =?iso-8859-1?Q?xhNYpFFYQk8Wzc477ImHkCo5dNZ2qVziiwG3KZRn251reJfwGlZ5MiGHKH?=
 =?iso-8859-1?Q?SCyxuzF79B4Bl8gLTatxYn4hDzbah+d37zZyDBgk1wfMqA/MXZaa1UOTYR?=
 =?iso-8859-1?Q?+Uz35AjDk92szIfq4VbA3NnW6J1VhlsUWkjObynWzl0ipGNSR2FSWn4U7r?=
 =?iso-8859-1?Q?HX79pOYDNZ19MCd6ot03Z+/FEie1DLoHJnReWS5wHZw83cg0Ryahvr//sL?=
 =?iso-8859-1?Q?E5/fWG47abl0nEBnj2H1IQOmBoKUE8U4x6mACESNxHRbUGeFAS/ErmJaQY?=
 =?iso-8859-1?Q?P9ECjP7gOiCn6GCNoU6sXcsJ+/pIbafsaYXlV4/UIWIzpPgeJFSGs4CJcY?=
 =?iso-8859-1?Q?y8MIj5rSP7vkGPDlwDJDV5HjK2cp15nXvY18fhnGqKR0wIoFGauVFCu+17?=
 =?iso-8859-1?Q?6Kl5LU/C/jecfEaMmIUtgeug00zBOOpus/YHCJKXEWFcxfWm2g8Y/T22NV?=
 =?iso-8859-1?Q?PvDZ21w1uUBZf3wPHaU8rr9b0UyNTVFkHmj5gnnxiWUqAOD6LHYXahuPXu?=
 =?iso-8859-1?Q?Gdr2XGC4pnHYe0pR8MYvOWR81FKW3TXH/cOxbfypDJD8QPCJdcx5/VKwq2?=
 =?iso-8859-1?Q?gJS5RFaRysxH/vcxbYKsisF4nulr4CSBQMZXTj5E+Vm1zXzcIq2ZtR2VWE?=
 =?iso-8859-1?Q?E5Af4VgXPc4a5RVhmhL9/4?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1124
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	80e46620-f9f2-4a2d-869c-08dd517c2dbb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|82310400026|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?bTdi6thlLWBZfg9CNALd+DolKzKaObcGhkjnUhOGqMozhHdExuI1v4GQ23?=
 =?iso-8859-1?Q?XZ4MdG/er9jCrridxBRRKOOw/4WgwQLnfrMr/d88W8NglcKWSzySnFpdUP?=
 =?iso-8859-1?Q?D7YaXzWZMMEvo+PcfFG0hwy1w59hFqmfEbOeLeZvqiuoanXo11OjUJDG1g?=
 =?iso-8859-1?Q?A3OoBDHaM4YnPxS8qhbU7E4jIvfZcgiSkVTbo0Rvdkucvbznq6Geu3l6Yz?=
 =?iso-8859-1?Q?PcptRmjTk9l9O8rwElqj7q06UdhvjWoXVgoC00iLxseSlKUp7TAIoc6sq5?=
 =?iso-8859-1?Q?0twrd5ixQv6vdAPX17q4/YztUoidwL/wIIdnuAAwBcau/+wX+3Q9xKxuVQ?=
 =?iso-8859-1?Q?TFVeQkqglvwFlFvk+hHv1V7wFbwtuONkVUl3fnAeaie6Txkk/CzhfVI4Fg?=
 =?iso-8859-1?Q?LVRDhPKs8FVKZMRpHB6YPnFq1FhqpOSyM4neYaG3kJ4lz1HkhifD+5Bjj+?=
 =?iso-8859-1?Q?oTv/LY9swtb1M4j4ji9S4uZZ+knWDOzaofJOpRyysiDYfOOgDimjbqXOFY?=
 =?iso-8859-1?Q?/7odOuHoHUQNMnjIBL4NgG8S+4hu1CQwlAWyTd+OZQNASOAmzgDvrd0WGF?=
 =?iso-8859-1?Q?KaCiiwXkpbmMYLbIazcwcyOBaqfubDxEosRLjADfX/GukN1ZvMKwMbQReH?=
 =?iso-8859-1?Q?CwRMxxHKSuoC138X6CaLcD95Rj6JssBAexmU+KERJv3D6u3vJExfaYoFFh?=
 =?iso-8859-1?Q?pfGjnQeJApT+wNhNZsdBXaxXjllHgDym9VDSBe1HFlWVqc+gEurRNbHfYx?=
 =?iso-8859-1?Q?s4cBADB8NVvavtFVsE88OJJiiqTSPar436Da0U6BeGmKgBncz3vUNTK96Z?=
 =?iso-8859-1?Q?yUudsDDNiYFNjM6obJ2jafaYb6tmALKlfrmpSw0Bv8ZmIrEo6awskCqDp0?=
 =?iso-8859-1?Q?7bOnh8WpZW6LffmzbebXUp+VaqqIGZZRu4rhtl++pu6f0QzTrqLpbkTJNj?=
 =?iso-8859-1?Q?ebLL6L+WJwgCHfCI5Yzskz8oPBRhVvMCd+2sS/G1+bTHZMIi1dqvpecM6r?=
 =?iso-8859-1?Q?7ULXY3pZ5LAkElG9DAh1A9Q/R4Zv9RcpaHYPju4TbhPq6WXbAlcpYCL/YJ?=
 =?iso-8859-1?Q?h779vx40l6vVfcUUnPJx0qVbHJR14Glu/iYa6ANq1KJ5yMIZCblf0H537B?=
 =?iso-8859-1?Q?R4EHz7asV4lTxcbBFMtO4uun3O8grrEOOF4br7NtqNwjNUZmUBxM1VSWkk?=
 =?iso-8859-1?Q?IZGgbScdeh56IcJNOFvmtHw3vxj3GIwI56kOWQERLWOfTLhORBBSyhDqKj?=
 =?iso-8859-1?Q?UDPwQEIgS/5kUSKpe1KB4e/fbo/i2Y6Uxz1QkV8wr+TRbcfFUJuokxe4X1?=
 =?iso-8859-1?Q?D/VxnRADuxwoo+ZUe55S5wEuSLB8aAtKsW1RErhOox5OwXdj085JEtGPqg?=
 =?iso-8859-1?Q?3n+qh3lSlZ/isn4ifNX5rbU5csuXxFUh2ZHREiQO6raFhqP5OJueqj9vv/?=
 =?iso-8859-1?Q?DhIBbzedqaXh9Maz45A0jaItUkOrqG3Q0mWJLtiS+19/CqPtT/BbNzR2+g?=
 =?iso-8859-1?Q?jCqZdZakgcnT+qn73FCJz+/Odbpe/0PSdzR/gQv+HwjyMFiISyKIObidT3?=
 =?iso-8859-1?Q?JAHyq04=3D?=
X-Forefront-Antispam-Report: 
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 06:59:57.3871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6debab-c143-48dc-0c17-08dd517c2fcf
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1325
Content-Language: es-ES
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 12:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211755

So with this patch applied we would get this CFLAGS on sysconfigdata on the=
 build directory:

 'CFLAGS': '-fno-strict-overflow '
           '-Wsign-compare '
           '-DNDEBUG '
           '-g '
           '-O3 '
           '-Wall '
           '-O2 '
           '-g '
           '-fcanon-prefix-map  '
           '-fmacro-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/Python-3.13.2=3D/usr/src/debug/python3/3.13.2  '
           '-fdebug-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/Python-3.13.2=3D/usr/src/debug/python3/3.13.2  '
           '-fmacro-prefix-map=3D/build/path/unavailable/=3D/usr/src/debug/=
python3/3.13.2  '
           '-fdebug-prefix-map=3D/build/path/unavailable/=3D/usr/src/debug/=
python3/3.13.2  '
           '-fdebug-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/recipe-sysroot=3D  '
           '-fmacro-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/recipe-sysroot=3D  '
           '-fdebug-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/recipe-sysroot-native=3D  '
           '-fmacro-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/recipe-sysroot-native=3D  '
           '-pipe  '
           '-O2 '
           '-g '
           '-fcanon-prefix-map  '
           '-fmacro-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/Python-3.13.2=3D/usr/src/debug/python3/3.13.2  '
           '-fdebug-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/Python-3.13.2=3D/usr/src/debug/python3/3.13.2  '
           '-fmacro-prefix-map=3D/build/path/unavailable/=3D/usr/src/debug/=
python3/3.13.2  '
           '-fdebug-prefix-map=3D/build/path/unavailable/=3D/usr/src/debug/=
python3/3.13.2  '
           '-fdebug-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/recipe-sysroot=3D  '
           '-fmacro-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/recipe-sysroot=3D  '
           '-fdebug-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/recipe-sysroot-native=3D  '
           '-fmacro-prefix-map=3D/build/tmp/work/core2-64-oe-linux/python3/=
3.13.2/recipe-sysroot-native=3D  '
           '-pipe',

After replacing buildpaths and DEBUG_PREFIX_MAP on the package directory wi=
th `py_package_preprocess()`:

'CFLAGS': '-fno-strict-overflow '
           '-Wsign-compare '
           '-DNDEBUG '
           '-g '
           '-O3 '
           '-Wall '
           '-O2 '
           '-g       '
           '-fmacro-prefix-map=3D/build/path/unavailable/=3D/usr/src/debug/=
python3/3.13.2  '
           '-fdebug-prefix-map=3D/build/path/unavailable/=3D/usr/src/debug/=
python3/3.13.2          '
           '-pipe  '
           '-O2 '
           '-g       '
           '-fmacro-prefix-map=3D/build/path/unavailable/=3D/usr/src/debug/=
python3/3.13.2  '
           '-fdebug-prefix-map=3D/build/path/unavailable/=3D/usr/src/debug/=
python3/3.13.2          '
           '-pipe',

There are still some 'prefix-map' stuff that is not properly being replaced=
 because the do_install() task is
doing this sed expression `-e "s,${B},/build/path/unavailable/,g"`. We coul=
d probably move that to
`py_package_preprocess()` and remove DEBUG_PREFIX_MAP entries altogether. I=
 can put a v2 doing
that if you agree with that.

________________________________________
De: Alexander Kanavin <alex.kanavin@gmail.com>
Enviado: mi=E9rcoles, 19 de febrero de 2025 17:01
Para: Sanju=E1n Garc=EDa, Jorge
Cc: openembedded-core@lists.openembedded.org
Asunto: Re: [OE-core] [PATCH] python3: Remove DEBUG_PREFIX_MAP from sysconf=
igdata

[No suele recibir correo electr=F3nico de alex.kanavin@gmail.com. Descubra =
por qu=E9 esto es importante en https://aka.ms/LearnAboutSenderIdentificati=
on ]

On Wed, 19 Feb 2025 at 16:47, Sanju=E1n Garc=EDa, Jorge
<Jorge.SanjuanGarcia@duagon.com> wrote:
> The reason I found this is beacause I was trying to do something that req=
uired building python extensions on a host were the compilation flag `-fcan=
on-prefix-map` was invalid as that was introduced with gcc13. However, look=
ing a bit deeper I realized that the sed expression is actually not doing w=
hat it is meant to when removing DEBUG_PREFIX_MAP.
>

Apologies, but I don't fully understand what you say. You show how the
entry in sysconfigdata looks before and after without your patch, but
I am not seeing how it looks before and after *with* the patch.
Without it, it's really hard to understand what the problem is, and
how it is being fixed.

Alex


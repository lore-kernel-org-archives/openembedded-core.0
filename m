Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E333C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 19:41:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.54])
 by mx.groups.io with SMTP id smtpd.web10.1824.1751053301609788156
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 12:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=DdIECeho;
 spf=pass (domain: axis.com, ip: 52.101.65.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbdhAoEJ1Nj9nuehoci+r2d5enTNus6zrOU6nJtsXJbsAp7heqTklAr63tAtoPNFaVXqlI/ik1NW9kjstMcboveRvSMDtkDJZP7YmWbk+rgiaUPjfLWDEBYQWU901gjdh2s0OiEV/VHsLzZ03mm1Zu7ptu/V5HoUoX/u8J+B5EllcrWlinsAhyTdnAh7ZdbJMnhZYQ1iTqjKvqqfTuFrgRbyGKV1i3ixSdBsh+BXOs/CSbUnAQ9rdKHZqnD/UO2c1Ib+ootWmAt22p6So8wprDA26NWEqoA3+liN3A2UtVZoYpp4gDw10MAKnQ/ST9z34qxdEka4S+JbkZKAjC/tgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnhixA9NGZoCUfd4v7P4BjoIXOuOJMGhiWZYg4u1RR0=;
 b=xVFi7/lNJXmm4YzWZNFI2neWLvcDkINh73xxYnoY7k18lrLg+XzS7yLsxX2pSOjn/jnBypnjUQ90RoDllQSxyGtS7guOPaAlGzBklYVypQWwVvAvyEO6M5F3wpkS1JWFFT4CWL0rjBilLACKUf9i9QV4C4y7RCyT8fxN473tSbicC6iShbmzHE64pLyBbXy/qIAG6AQpdkxFMUhR5WMRDc/ohI3FuNpKCevyqmswSB4FpVZxAKU9fNQx9SA7f76v+6hRhwtfKYF3ThiT8eS4IPJZVaowDackBXJ2OQjNSS5T3UtB8ceYMhLh2wwrI9IGkM4UfREhzBN34/IQzkqjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnhixA9NGZoCUfd4v7P4BjoIXOuOJMGhiWZYg4u1RR0=;
 b=DdIECeho2PxvdOgaS0d9sMZLVk/CaR0ulyB3rcak4SZruOaQPT0ZH8ckuJEkRFnhohUtD1WMmw70cIDqa5K00XMWAHzaBuVPKwf9ZHiOffPjxSnoFUVVDTO+6GwdHU/CG3Jr7dGV5TFEcHu2Linvz2GJstRHwdBd/0O3h2hrPZA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB7989.eurprd02.prod.outlook.com (2603:10a6:10:350::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Fri, 27 Jun
 2025 19:41:38 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 19:41:38 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] local.conf.sample: drop MIPS, PPC entries;
 add 64-bit RISC-V
Thread-Topic: [OE-core] [PATCH v2] local.conf.sample: drop MIPS, PPC entries;
 add 64-bit RISC-V
Thread-Index: AQHb54A/cZpiOmL91EaTZer+AkfU9bQXZ2Ig
Date: Fri, 27 Jun 2025 19:41:38 +0000
Message-ID: 
 <DB5PR02MB10213DFEDE677C227F416E951EF45A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <2f67f7e4-f163-b9a8-3879-ed6ad25f3b4c@crashcourse.ca>
In-Reply-To: <2f67f7e4-f163-b9a8-3879-ed6ad25f3b4c@crashcourse.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB7989:EE_
x-ms-office365-filtering-correlation-id: 6f30a176-7a17-4e9c-5bed-08ddb5b2a20c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?eixeM44cxuux31iOBzuQLS1efdco/Licu/WshgF2OGQwgUBvo9INQbp0Zzl0?=
 =?us-ascii?Q?rTRNAGcaqZ7daCuPRvchRZ7Y+ErUXN1mRd25BCG0OsD8/ncnWGyi2/9eVB62?=
 =?us-ascii?Q?k3WdIPJI6cXlT0vWlMvdT+J8pqpvwo8so+JuBjDJ+nWh9XajWicgfQGoLd5G?=
 =?us-ascii?Q?21ECznzcMMxWFCdnZ+q6YR6x5sd4b6akn6dwl8TySRqC3bD8+mvLSpfr1ZCk?=
 =?us-ascii?Q?mtJVKeZA+rgyKMkBdGklvBDFW2UKGO0tT2uvs1gXerURvBAzyj2P1bNs1ZZW?=
 =?us-ascii?Q?XtLfOfISk1wHRfuKYT1cF3G9L/R9aGuJj5Tvxnro+7mWnoHn3GmS9eDLrhEf?=
 =?us-ascii?Q?xrmY9v4FVIEw9rPSIyicvnm4bUkoVi3Ta7YI8pp5nRltUTM4bSlwYZNNWmdf?=
 =?us-ascii?Q?bkiqlLz1dCNyPWJbN02oUZjTJ+gt0BYKF3JCJE9Hw0mqfBu1o5Ynb359d8J+?=
 =?us-ascii?Q?RiPzKeR4kHmoox97wcvDlT44pmSoYzuKOyh6UtSsMI5VIy1Ku5vAg2xcndDJ?=
 =?us-ascii?Q?HcFqySjjUqQmu1+uy8uTQqyHot3ZvQ2Gmhamzr1WPley4oVAZs9GcpvQL+CW?=
 =?us-ascii?Q?sSfG3h9/5kPbTrGSlB8hQ1ks5FZgp8sHDhpbL5zGySjtqCt4JBhYegpKAn0n?=
 =?us-ascii?Q?Ysnr0taL2oh87juXOL+gKtoCmLTlJne8G+A7iqcSMcqYtXC/YgskjmJB0b+Z?=
 =?us-ascii?Q?v6UPCoknSyu9jg2XgE0Per0Jfc9LefJBNhh1dOpHfQP3cxFvODE5rXcmb5Az?=
 =?us-ascii?Q?TmnHT2+6ikBTc1LJJp9Rvg0/gzXHi4DLRN0fl3Y7N3idi6IAqmq78Yl271ks?=
 =?us-ascii?Q?IKpFwvyV2jkQ7uIWmAlNkYLEvVXyOn7+OJtgIiGKKIPwbfPPDOMbijOV/5VS?=
 =?us-ascii?Q?Y0v+WYMAhQiwwnc7O8vmIVhUDT9sG8+Z/rMiXHlzRvaih9L8nXHLDj0ECT3e?=
 =?us-ascii?Q?juC1hTkNuJZ22JSTrYFQhCkaalXTpTyqabQMupHjvlEQU5zOWhIqcJF+nThn?=
 =?us-ascii?Q?UhwrtLbadFYatjGL1zVsaaFldvLcH8hJBteVN1JgMnDYw9DpXn7FS0nfhSn5?=
 =?us-ascii?Q?rjYGwrVJgu5b/hCjlWvylT5dT2aGRTFtcPfpzuSmLCjtBu5Y/O3J3ubBfNCw?=
 =?us-ascii?Q?dvVAzK0mOu1KuF4GHOwZ89tZ3wh7c+3B1qggXRAX7St79u4V11v0+leJU+KI?=
 =?us-ascii?Q?NPIbfzv756+865edRWonKnKoBt3SruqM22UewC2KwoONFd0Wxu74XWduKk3X?=
 =?us-ascii?Q?q8q1L3UfysVyxvWvDdZ1sPYN1kUf85uf2WtW7vUgufTyj0DOGC/hJK4bKJFJ?=
 =?us-ascii?Q?0W+HAb5CDNabT0oKZbQ4z6tcb2MJJ2lEQY1hG59iQsLPmCmcxDu5jAY1B16T?=
 =?us-ascii?Q?D4N4g2b7V64lX6N9EI7oSNwK31gcB9M6OnDyC1guI4VdM0EYYgPA+5Yet7A+?=
 =?us-ascii?Q?mrROQcxuDfJ2xdjWHdJlx5B0xqtikHPKKHe+9msuyY1djmx971L+GA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xz46y7bp4RZGo0kBfcu2qrprvA2P3J8yiJx606NJqoyvpPZbzSd9Fk6QX2a9?=
 =?us-ascii?Q?cYRlx1zvIwhBj2AKS8JPtj3Bib1ZZ2YwDNdu5hk5K78sVRIq1Jc0h07uyjGd?=
 =?us-ascii?Q?PoG+M2mHA0j+XpX1gi4DATqiOZR7GguuDQqhXm2QqKCIaRqurAZGUqaMga+k?=
 =?us-ascii?Q?Ty+uFnLKgHfFohCTdvpeAFHeQN2a2ivVlKIiNOvNiyE8RRZQPWNM2fXHWNmo?=
 =?us-ascii?Q?x+p5Sbmx70MIX9Ujybcpi8uXKF2+XjNoADr1bdDRwpUD3ltqWkL6ypRaIRsd?=
 =?us-ascii?Q?rto8PHgKRBGIPFYUx2KEBrsxtI/JWdam3mLv8wvtaPQelHdWLClLC20ZiI6p?=
 =?us-ascii?Q?TmHkusLNfxc0RDTSLwpqONqGkDVTETdErbYStdeYzYreWBwwCffYNyDSjsiY?=
 =?us-ascii?Q?kNmE7zuXnMujzHBSw2a/IsfT6PAHEOQ+kQV5VlvM8F0SyVa+9+itHozTyPXf?=
 =?us-ascii?Q?+92T6KBG4BwOq1CKlH+eHUFikVkArl2Ml3lZw/3aR1UzRslzaOWsKkjasl56?=
 =?us-ascii?Q?hAdIaeib4S2XzhEXHOlkelnE9o1hOKh1W06OpAdtAZfks9YBK6AvRvxRDCl+?=
 =?us-ascii?Q?AggvGSBpsk9QQ580WY5xdDEp0Ys9U6NHGBiVOgTFTjYFOdzJxN3lru3a2mha?=
 =?us-ascii?Q?Q0Blkac0KAFf7cQNG1OqrUwBt1PWBJO+ksZ4TAb7ddupyDpGYhSGOFSSUM+F?=
 =?us-ascii?Q?0rCL3shmsgaa6m1bTs8NvcSXIb4/r9Zoov03NRFGLp86StvQ0D13Mr81ZcAI?=
 =?us-ascii?Q?uETwOKSffLXTTLx0QaO5HjFpSqVvjpK4jMDGHBSwEKZkFfEJh8xfwDVWUFlO?=
 =?us-ascii?Q?cs39LOh3BNlOZG94lSQx2BIwibIol3Hi7NXeK8iMgRbjZZiPSPNlJIbMx1T0?=
 =?us-ascii?Q?pQHA7ZftEVFtpalgD3lDp2HGPyFZ+RnpIHIeRU6lKpHkfvQMRuXJAh/aoc0R?=
 =?us-ascii?Q?L+xMKgvhnA/L0WUN8pAeI+pPYq/OQdk4VyR3Z60uUEf1biW1Pu4I19/Mji/j?=
 =?us-ascii?Q?ojcgFHr/myR7G09L6PPgcaYtQnIBxq5IZxTZVcxU4ftZg4WDkl9IUbahto1v?=
 =?us-ascii?Q?fHzJtAMXuasMJSRqm9+s3RB51kAFNFlHhkBssBE02E1YffJHqdDr9GTGO1OM?=
 =?us-ascii?Q?ITo7Yum7B+IdRPYOk5egEMEujP3QWo/38w44lv2G7XRQ2pGkIdcfb0WBPKKl?=
 =?us-ascii?Q?J6i2mYIbu/22UINUhVutbA7ZoLuMjLHmKRsq7TARtampEHelRsZQyQdRvm7K?=
 =?us-ascii?Q?DHKkJaworIxWVeBQ2TjUJdSEQz8fdo2TMwXO2Hgh8xi0+oAvaBTRLnU4VlTk?=
 =?us-ascii?Q?/NU/ko0/gYCsgFZd5kGheqKXToEiWZUY5BodROIyH3IFHLO/OwbcLLGuw/Qn?=
 =?us-ascii?Q?CXuOUiOj6EYwBV5KeYNAN+dSGSgUb5XNTdt6dQPyxr/7ww4qb1OL7csONOyZ?=
 =?us-ascii?Q?8/Eu6gt8krKUHBsxStiQKplMijasb9YJ7HwQmivCF32rZp+5aiN8WyjM8DfY?=
 =?us-ascii?Q?1ThKJLhbgyzc+5/i1qc1j6lu1w2kh+vjqxsuxLTun2FG27oXJz9YKdctmYnT?=
 =?us-ascii?Q?OJNIRi9WR6ON/yZ/gsE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f30a176-7a17-4e9c-5bed-08ddb5b2a20c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 19:41:38.3575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KxwI4fJ39f2Ki0TIUwo0wGOQj1wOPDjvz5vMRoDsD6GhsGHRvkSQQbYzqp9sBDHC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB7989
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 19:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219432

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Robert P. J. Day
> Sent: den 27 juni 2025 18:26
> To: OE Core mailing list <openembedded-core@lists.openembedded.org>
> Subject: [OE-core] [PATCH v2] local.conf.sample: drop MIPS, PPC entries; =
add 64-bit RISC-V
>=20
>=20
> 1) Drop MIPS and PPC lines since we should refer to only those arches
>    tested by the autobuilder.
> 2) Add entry for 64-bit RISC-V.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/te=
mplates/default/local.conf.sample
> index 3a9706c1d5..6032dbba67 100644
> --- a/meta/conf/templates/default/local.conf.sample
> +++ b/meta/conf/templates/default/local.conf.sample
> @@ -21,11 +21,9 @@
>  #
>  #MACHINE ?=3D "qemuarm"
>  #MACHINE ?=3D "qemuarm64"
> -#MACHINE ?=3D "qemumips"
> -#MACHINE ?=3D "qemumips64"
> -#MACHINE ?=3D "qemuppc"
>  #MACHINE ?=3D "qemux86"
>  #MACHINE ?=3D "qemux86-64"
> +#MACHINE ?=3D "qemuriscv64"

Nitpick: keep them sorted.

>  #
>  # This sets the default machine to be qemux86-64 if no other machine is =
selected:
>  MACHINE ??=3D "qemux86-64"

//Peter



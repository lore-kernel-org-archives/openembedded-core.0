Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FACBD59F7A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 22:07:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.68])
 by mx.groups.io with SMTP id smtpd.web11.58375.1730930836895812163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 14:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=PWV2x6YU;
 spf=pass (domain: axis.com, ip: 52.101.65.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6fTZTz/e+pGNmK2OJZob0ypepYBHbLZNZwJD6VyF08DdE+RXxTTpZStvp/Ybvy4y1y9IwV/CmQ2ChJkyLnmmCA+REsOek2OcE1EzE/+KnTpkF1Lbt19KGn/bBHqr++p/UZGwogvla2hLw3E2UEkJ20tqSxu8D9BIYd1spozpnpDPnDPUm1y9z99v4+NHGbhZTHIZeu7eP/CKWwClXekpCBssqkqnvwmbybdbAZ8x0pmsUDxoIbuuYFKILCgZlskT1cN8QLZ2RRLSQqaVk0fBwqv5zEIhWUOV4NlnVhvySoQVVyHCeiieTEOH3zbdO9LXC8MdKPiL6mHEg50Gs13dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgNCdYd/OsS3jpmw1F1oTdht9R39rGiBrW5uLtgOym4=;
 b=RJ+j0nlpSpvEiZF+08AH5fe5sOBF6rgnHB1nqyRcK334r4EmefWjwbxllzJauWjRYDONltczONgzZAl2lWO9CIehOooCqgj0QbZJiMZDCw2mPVkVlPS7DgG8eY8XbNtHAK+F5d0gJUplr3gEU0QjBJyk3/IsfWo8nmeY0sex76m228/47EylNDIrOQ+OZMF7y0iQOL0yPgtFj3azvHiG1Zde5Z6gPMDlXo8T53vxxpeCDuydrBbZvjC9uBWYNppKzbD+VvkCzma7oOc+qGmQ6fbV0j/twbLxUlgEgg9k02AJp2IHHV9RUcn+fy0GxbxZSRS90nevoWL7aPknfmj17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgNCdYd/OsS3jpmw1F1oTdht9R39rGiBrW5uLtgOym4=;
 b=PWV2x6YUdNhLH3Yf728Jfl5GkOigAlJZ1BxRehwhcJPla9La6bTVKoEbtR5SwgwtJaGdVhudBca35m+2bOYq0MqL/RizrWlk+VFYnITSeyttO8YuQE8IxOr8NCx+NIkUHfeon0cqwrLj3gZL1OVaIBLbrUR+4RU+rqiWoSXmTNU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB9255.eurprd02.prod.outlook.com (2603:10a6:102:325::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 22:07:13 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 22:07:07 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 4/4] local.conf.sample: use explicit
 IMAGE_FEATURES instead of debug-tweaks
Thread-Topic: [OE-core] [PATCH 4/4] local.conf.sample: use explicit
 IMAGE_FEATURES instead of debug-tweaks
Thread-Index: AQHbL7vYz8H1DmLLAUacRKPLPCKTbbKqzmAg
Date: Wed, 6 Nov 2024 22:07:07 +0000
Message-ID: 
 <DB5PR02MB10213018F3E6CE17160BFED11EF532@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241105194857.3351281-1-ross.burton@arm.com>
 <20241105194857.3351281-4-ross.burton@arm.com>
In-Reply-To: <20241105194857.3351281-4-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB9255:EE_
x-ms-office365-filtering-correlation-id: 4b64d8a9-3af5-480b-3428-08dcfeaf5aaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?dmep0syrZF1Ezc4rSSuhxDAWBvRO7Aeipz90ByyjmGy7Nwc119uAwCv3sXYu?=
 =?us-ascii?Q?15ugqzbglrpNyuavpaRtAYgMpV13LwbnA6d3QtfuHh2fhoInZbBFvBFLdQHB?=
 =?us-ascii?Q?fDzpK2DKzV288SNpiOohF7f5mGLI54QZjAoESUH56rWKQxVZeEDDBj8KMCBo?=
 =?us-ascii?Q?ENLs1n8jMX7/muZlWXIq3o61hvywpPmQGQ4c8krUaZwnXB1GKPxAioHA6di2?=
 =?us-ascii?Q?xRA+o2MB8YyyVxLAAFeq2lnRNtKskYYD1zSsHMOIwJGAYmbTRjCqpHlDxLud?=
 =?us-ascii?Q?U3txLFLsoF1cXMiAPjayQHYDOzvcv5CFywdgHtg2gzFaYP9LChkAlbW21DUT?=
 =?us-ascii?Q?h1qBvsDYpKZO9xTON7x3TaxR+w5HEhgxmIu4s8CuadaNhtrEE5KL/DYsZowG?=
 =?us-ascii?Q?NEkYLQHXZVXVIAPYbF2BX2bmuc2pVcZoIWkZ5I/4gwK1t+KmRQekgOle6ixo?=
 =?us-ascii?Q?7Us99QWn2hMdyModmscHnQscK1hIvoEi3878MZXxjDarB8QfF2uYKoKsTdYV?=
 =?us-ascii?Q?nA+CvK4m2qZtxLaU/qitO4JJUbst5G0yIVXwR+Ycrsk4SImXt+Mu9yYU5T3k?=
 =?us-ascii?Q?gW41dlKIfA8GQOcQvctuFmJ+55Lbld+meP9vHh06cDTEuspVF/TjAB/4Mikz?=
 =?us-ascii?Q?uVlbMcXA+r1hvWxxrlX5k0f3FLxhnWRsDfrlFoXvhuqEjEZuAx0n325rsd+o?=
 =?us-ascii?Q?nXKrDA1h+FerU6WGKLFd6+wU4nxQYrykTKM2pdLuJUysfJVKxcbLuc4C/mq0?=
 =?us-ascii?Q?JlIEGMGSKTYRFMGVGe8BLXOqYI/GGNdx3lLcyu42GUds83whgMSlxAQT8y3I?=
 =?us-ascii?Q?jPybjBGqsCw8zXlDkbFWmr07TJ3C/B8TLvuJlkUmj/CqxIhe3cn/ghPRqhKS?=
 =?us-ascii?Q?f4ZBCofmb7fR+jl+KJ0Yz6GxB5Can8UqnEgn6atZ/ZgirdZoSecotU+AfcQB?=
 =?us-ascii?Q?7rb21mWzQY07hbnEAtutEgR0NHs+IYl6DYohtpWeDSS95BsOQ/MIpfCPKVAC?=
 =?us-ascii?Q?0Smz2rWiUupSTwProNByydFEUaXeIqzTP1BAnfmXP09XcsX+AtVBM8HiLni9?=
 =?us-ascii?Q?WWcBEwSMc7XH1mAsuvWyTk3KnJ3aatSIgiI8/0NF5ouYY8e4z5Kj2wzE42pe?=
 =?us-ascii?Q?BKQeHzi7XiTU28f1lNhzmt1DCGq2LaE7tM9fw3AHbd65bgAqvegWTzmQYnpi?=
 =?us-ascii?Q?rQySfj9PxPMHulHyKabPYbu5e++eSbfGvi+lickpKwTWLlK4N9wdHt/IQ0+3?=
 =?us-ascii?Q?qMdV+GaALODl4oURvlaeDx2MkyMVkXAckYrB0RB/8QTmmDBDi5JTKMEXScad?=
 =?us-ascii?Q?tMo859JWJ2psW2uc4sqTDcB1yBNFwgpV6wn9+dEx2eH11L2sII25GmU7xK8Z?=
 =?us-ascii?Q?nADIX+Y=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?b39zlA6Mn/YxKEw1F2TI50SPKCNkCeIxnliD81yoQ1NHPu5u0D0d+kzE77KJ?=
 =?us-ascii?Q?KxTugzKAOh0wRyD0XZHYHOBhzjBVadDGA89Bb2pxdXbDuVSiUcShGBtBnoHd?=
 =?us-ascii?Q?goddLRoiME7UUxEF17mU57bfQTOzICphwmsRy5WLCoLH1DKPLDvE4HsoMVnP?=
 =?us-ascii?Q?2qbTYrOjIKEhe8hufOBW22PeG0/JlaviknNJFOPLgt6nQ8fM9SUoZVS4WMGN?=
 =?us-ascii?Q?qNyS0QQWV1yWD5vr2w++XNxAcCIcyzKzvwZhlmkReUr9NIildVzCuKiUzNjn?=
 =?us-ascii?Q?NgfuBVxPRxpuereV9hXx51tpcN52UCZSJr8BlBBG8TyonRXUCfOqqEVuYEh0?=
 =?us-ascii?Q?t+pb+7HdSGE8RPk3P29CK4qMyYM6nxMZ348sn/HwxSNxEzgxm9tqnNkuleJz?=
 =?us-ascii?Q?KYqIJ78To2BwAShSWltgt53SV2vJBrQ0eovb5DP8DaDd0SqwrOuOWhpnjmng?=
 =?us-ascii?Q?JYu4DxSOALAQF19f1F6Ya0WGXP/WFwIZAyerbQrwYs4i7/ZIRTkvzZ8iT8fZ?=
 =?us-ascii?Q?ZIaZ9wriLC/+gW8evx7O7KOew3j/YRrH8nrxEheoa9FazYvAy/gQNxPRD+OR?=
 =?us-ascii?Q?BtGzptkBhmLlYTzF3jtGtUbSIZFUv1t8axITmxQYLwnht2uQLQw6v5uD64zs?=
 =?us-ascii?Q?GwOLaSLu1Wij6mN54SVH3uFskLIHiR7PIRCXExgpU4YkXbxWmioxtSYfyVyu?=
 =?us-ascii?Q?KsOKd4b3mQr1yqNqAaaXs72ID1I9N/HjDmbfAvsfzaEG2TXWPNwGLqL6qVHC?=
 =?us-ascii?Q?/cuz5IKkJipFbzehaWsnt/S88koNqGqnZx8zoJ40Q8tzaZ2aXo/ChPPOGaii?=
 =?us-ascii?Q?zc3Bfouj8E/t+zXMi7/DrrhtyaCJlCHBi9tMRTGn+UyMbWG7QVqIvvxfcwTF?=
 =?us-ascii?Q?moIQBOOCKYoeOAQKCFdNa6vGY7P4N+eF1v691efjwbr0+Bltj32+K1ncLSk3?=
 =?us-ascii?Q?DB+P5vPmg9GodK92MhIC1WQ0xEnk6ZDcxuq6YqJ+nv2SDQZh0NNQku3pWIEy?=
 =?us-ascii?Q?lyeGvAp2n5kKeu3nA8I94qNR4EQOWcFXwIAVVRP6KpOcFbkVnaTqisNMkcqw?=
 =?us-ascii?Q?vhtv1cH1Ulnh+M+OU6DO8hw60cIYw4Rwduo4uk60wPKo141NQ+HLibyBki6I?=
 =?us-ascii?Q?lpiODCp9n8CAmFte3Y2awv3NsBxWp7C3bd1PnL9SJumozVpMDqzv3WweoQiY?=
 =?us-ascii?Q?yuE0CIu1+JhlUjhJiJwZneTyHvprS8+HnIbGPMtB3hNLgF584m29nukUZ6RU?=
 =?us-ascii?Q?KwxN8w3R52h7eXRMhker9YWJPR6ps0PvA2L9Q2fvkMC7UDy9POI4v/J0zylS?=
 =?us-ascii?Q?OHz47SrBNle5SLHRqTtyCDLTpswFUb+93kN7xL6gVA7yglO6u1SqEqBsjJc4?=
 =?us-ascii?Q?RSZwJxgMpfQE8V2N7CXeM+B3hpve3Rvwl3UY0BdZXBtRyR7lOQRysymUEy6F?=
 =?us-ascii?Q?VgbWR2fM7HVx06jmI5mY8QJVJzeYbl2NjjGw2lKvGd6gyHK4erp/n2rqywFL?=
 =?us-ascii?Q?QpXb2SaxWcTys5a6hf8DZrkhrnRsSpGtggyBz/9gl+vhFsolBzO1CbMd2M+C?=
 =?us-ascii?Q?m7BgLnPDuJoFYYQZR4w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b64d8a9-3af5-480b-3428-08dcfeaf5aaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 22:07:07.3136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BWFhfYLXKjd1YaABDQULHgqbLfW649vKSiax7uLd2fQeExpQkgBF3G/pRjO6b2z4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9255
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 22:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206802

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton
> Sent: den 5 november 2024 20:49
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 4/4] local.conf.sample: use explicit IMAGE_FEAT=
URES instead of debug-tweaks
>=20
> debug-tweaks is vague and doesn't give any indication that the root user
> can login over SSH without a password.  This behaviour is incredibly
> dangerous if used unwittingly, so discourage it by using the underlying
> features explicitly to spell out exactly what is being done.
>=20
> This is not the complete set of features that debug-tweaks enables,
> but I don't think we need to enable serial-autologin-root or
> post-install-logging by default.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-poky/conf/templates/default/local.conf.sample | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-poky/conf/templates/default/local.conf.sample b/meta-po=
ky/conf/templates/default/local.conf.sample
> index 72d35662940..cfa77106ab3 100644
> --- a/meta-poky/conf/templates/default/local.conf.sample
> +++ b/meta-poky/conf/templates/default/local.conf.sample
> @@ -145,8 +145,8 @@ DISTRO ?=3D "poky"

A few lines above, suitable features to use in EXTRA_IMAGE_FEATURES are=20
listed. This list includes debug-tweaks, but none of the features that=20
you now set as default below...

>  # There are other application targets that can be used here too, see
>  # meta/classes-recipe/image.bbclass and
>  # meta/classes-recipe/core-image.bbclass for more details.
> -# We default to enabling the debugging tweaks.
> -EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
> +# We default to allowing root login without a password for convenience.
> +EXTRA_IMAGE_FEATURES ?=3D "allow-empty-password empty-root-password allo=
w-root-login"
>=20
>  #
>  # Additional image features
> --
> 2.34.1

//Peter


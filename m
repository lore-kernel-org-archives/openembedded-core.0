Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA094E6918F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 19:02:07 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.55])
 by mx.groups.io with SMTP id smtpd.web11.32558.1732302125225329106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 11:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=olK5AV2w;
 spf=pass (domain: axis.com, ip: 40.107.241.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZ+ts7k1YMNyFHBfk9RGynD4lkSNgZzlJ+4L7yH9GMooSEDaFcz5vKBgdTNBr82opGPpnoeX4QkiFRbSL0OAxiooAuVv2syoSgeFbK2PQixDq0DKQlFCLgwSII+QhQc7GzPe22Ar06p/mT2qb4LniD91y1Rv5wRcsAxZFj8w1/etwSZpJZUzUKvoF5ty3Wejgo8i97jMSnkbPu49BA48oBsmcwBgI0iXh0LdrZRLjykj5+athGq48+wRpJGu7C45qXzt8CU9PZc864espByEMVo+O1QvQIKHi1JpFwtf9O1sD9a6zLsUpiHMMva7klfE97KRGml58TRB+eyk4JiYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrReeV4mkuNEKLcfMgUv3qFKIs2k2WORN9VIisNpPGo=;
 b=oz4ZNoQ7/mDBmC9BR2IgQlZayVZzEaIn8Hhml7s+3/77Uqt8cM59kb5u5Y+H4d0qAsNCY/dZjN13kMIDBYdEFm1eEGCXlJXrIG6rpeLY6qdBRtgH8d9uyPzptJWpKJqyrRMd8XJZoCOHWDIj/nXdYgsAf4DSKuYGXYl8MeGalDpUpk8BM7kLLlmy4SIFqYBmhr9/nlwYzaA9YOwJ3BFO+soKBkthaGUTTjD3FBhFweMB5jxZWm5IODhovr2NbAvhkvoglf3AWalyvzLS/6mneRmxykEXxmEoFXNa7OMaMmyPXIYlSnWwHIISdeE2zl+h1ORdaXzgWzGW4nEcWjVdAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrReeV4mkuNEKLcfMgUv3qFKIs2k2WORN9VIisNpPGo=;
 b=olK5AV2wR8HHRr//utfCT/oroR7DHrYMC5Bu0yq+3tk8hd10yu6FHnCvLPdgkhcFJVxYu4fHxLerEOo++mRqWmBoT0sRLnTPZHL4O7bRfS15V0s4SkD9gWoLj1hzH+NnQ+17GViwfO5RIBPoZa5Bo50P8KqA2Edpf4aJ3OoXR8g=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB10489.eurprd02.prod.outlook.com (2603:10a6:150:166::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 19:01:59 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8182.018; Fri, 22 Nov 2024
 19:01:59 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Changqing Li
	<changqing.li@windriver.com>, "emkan@prevas.dk" <emkan@prevas.dk>, Rasmus
 Villemoes <ravi@prevas.dk>
Subject: RE: [OE-core] [PATCH] bitbake.conf: set FILESYSTEM_PERMS_TABLES using
 ??=
Thread-Topic: [OE-core] [PATCH] bitbake.conf: set FILESYSTEM_PERMS_TABLES
 using ??=
Thread-Index: AQHbO/UEgJI+Ylh620+78ff9SEtWDbLBwAMw
Date: Fri, 22 Nov 2024 19:01:59 +0000
Message-ID: 
 <DB5PR02MB10213FC6844484ED59B5806EDEF232@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241121090847.608522-1-ravi@prevas.dk>
In-Reply-To: <20241121090847.608522-1-ravi@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB10489:EE_
x-ms-office365-filtering-correlation-id: 879428f3-6f54-47af-3175-08dd0b282456
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?x75YIyrmIC7kjugV/tx3pSbVAeqT8MYpLHTVlpCDRnoBrvZmFUhYZsYfZv6o?=
 =?us-ascii?Q?hZMqH5MVXZhbTX2/1ssizoGJLUuXrAgeIKCmNvUV2YrxUcZ0+hiJ63NgMST3?=
 =?us-ascii?Q?SzJVFuvP1lK/k1qsTbUK9zBnU5f/mAI0y6ut79CIHT1OXOntY5CZor9FUS2S?=
 =?us-ascii?Q?vPoZdtpfp14HJftJwVL9g/h2LKlzoJw3weL2FGigLSKi8Ll4290pBIKLF2M5?=
 =?us-ascii?Q?CbFI/fK/E6jgrd7C9a+Z8H5tqhGqn0xGSRYpDYXbdLo8ScNwxbr0420w+lwg?=
 =?us-ascii?Q?WarXFklgRBdN3HUrCl+jTEeerelDvTmwv5ukb/TmRp77sWnMkrGF6LDC8ePm?=
 =?us-ascii?Q?X3itkGAJVdReF7C0FBVbUIm/WlDs1E1lS+b83UJyQevt3xGyTKB0yhJflEiG?=
 =?us-ascii?Q?4NNQnKgVKLVinnl//zTXoU3xZrBHFZ9qUF5jjYxYeKVRhJeeEL7RkWQjHbNC?=
 =?us-ascii?Q?0Mk0A0GATEYfGCbMHYDqo7l13Zh8lKl/gnsi6W59z22UtrF1LyBNq9JXkgkh?=
 =?us-ascii?Q?qB7GNXfCsaPF290l8EednFmx75jaxz1ERvxUoPaNhv5rvhP+RRzgXuNGoFDs?=
 =?us-ascii?Q?jmJakRSJz9N9Ml1y8AfApyHU3QddZBiHX6C66X+IApKi+T/tLQxXpJeSF4D+?=
 =?us-ascii?Q?cb+vWZY8VXgKcUwWeTmwjmZLxM4DEptQbaQY0nXUaLlmC5DJnWF0xQcB9aDb?=
 =?us-ascii?Q?Jv5k31Kad1YOit4MS7sMwaKK+zk5th3VaiXOBRTS7Pw7Uo7UOkbyLJ6ks5U6?=
 =?us-ascii?Q?Mz7JLJNPxzRyrXaSkV6XBJSmp5IyDfsq0wKZGTpl1P3pKSk//+YS0Idp7sPF?=
 =?us-ascii?Q?f5GHInQet57vb+vSmD1PDn6Vjywzhbj6sm5uYHtpwzb/GAQIqYTyId2lvweX?=
 =?us-ascii?Q?v1q6xXR7Oz+aJNy1FCczUa2R9nO0TohY4AOqiIWTPO72DvUfqCugst7n/20p?=
 =?us-ascii?Q?68e7FRjtc0zSnaQeNuGWLIA2+pNUI4gjiNmDeVL3aaCPuGWmLWw3TKW4kfQF?=
 =?us-ascii?Q?MV/5KaDSgLyXEPbUGhg88TJakl7i9ekUwAy3p4wT4za/43MnBvOf21RQKIdO?=
 =?us-ascii?Q?weYohFyceDLbyW/XHrQPu2eHnWCdS+IbRJiSVK1VIAwPPA7WZ6cN5csBeVHW?=
 =?us-ascii?Q?hTXC8Wb6krjUp5YeRk3fRkeYmPFP6hNHUsp2ngqLkUtThEY7NdxTEykQIy+d?=
 =?us-ascii?Q?DmpPVx8MQXvczZ3uM9aHa7DeACJ36C1tPw4/6D93uUFlq72OeFTntHU4JzRf?=
 =?us-ascii?Q?BWwNtCC84Msfs/yVE/xtaujvc9YsxInjPikrL43ceIzdRzKHQbSF3hr2dVnj?=
 =?us-ascii?Q?4IXqZERWzuPrIkmvoGSq1WfT38CqokC/p/5OUbS+w0hs3YNz/wY3QYsoi5DG?=
 =?us-ascii?Q?8LbOJdciVheJT1DKZS2em8jpO9QlKKqBOZp6kp1PAfY+vzq19A=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hOkg+vC8JgyaI+8yXIQNgVTYzgTr0wWAxqDc2APrsC3DQUK3REwyzfFEhsKz?=
 =?us-ascii?Q?cfpKqcsiBXfxlSbE6F8FI+gSDAoxatWADoA8C8BvFgDpe0pyhgt6lD91PiO+?=
 =?us-ascii?Q?O8BgtSzpOXA39RA0AY8bqyE9PRCFW0hvEQ6o7I/0WRs8ohpwxmyAgIzmVWoi?=
 =?us-ascii?Q?mcDUbMZODpBBiPJLdClOKOlPxnWbgP5hPfvbiwIrJfFxMjtxei88I35SXO61?=
 =?us-ascii?Q?h+k120lqawDyt2ugvZ2MYcnApq070ZTFiSJK8AycX6+WqDscH51Q3QJ2K+Um?=
 =?us-ascii?Q?rfSA7E976P6vzKd5Bpz3Kllq7QLg4r2qv57h/miXHPK2StRGWh015RwaotcT?=
 =?us-ascii?Q?FchN/ThNvkRFz//mdt6lb3w/twF/vMJ4NAyDg8eT4Uo11QjQn4gSo8XLQsHQ?=
 =?us-ascii?Q?uU3P815nbKs+/hlmSxHgyMffJV8fIBlKMXA+6msz3MMNP4LCznqrKLJkicaO?=
 =?us-ascii?Q?6AnJ72aJuEfqUwJMNZ6VUt8qmTUPG60LSO0hUuv1vUHYPmsVS/DkZ8uLmjMm?=
 =?us-ascii?Q?UBOh5kE8kjpYarrMQCznhw6jvNputMUswLxp9Q9s8UckaPftYGihDfTU0pQe?=
 =?us-ascii?Q?r/xoWBmpW3NurQwpC5VUrbCr/mz5HxcWghpqqJI6KPXAuELAI2A0dwFon/Tv?=
 =?us-ascii?Q?SVylHSWupwHMxxSZFhFZr6xOClCdaCvnb26BLfun6dp8IpN8LER6OM6Jey8T?=
 =?us-ascii?Q?XYI/91Dxz3OnwpjY49v5aZIvsAJHy1WDfVNAyrt+9OzFNbLlXhJvlf0E/Qiy?=
 =?us-ascii?Q?0qyGLIvfwIWobiwacbovXsTA2NuTw3JnGPUtL4yA8oBp5HoFH8uPgUHBEMF7?=
 =?us-ascii?Q?CWicNBF+Wv66bSXCmB1VdZ7szCthn278Suxc5WkftUDM4aLnOlp/dPWdiV3K?=
 =?us-ascii?Q?eDhkDEVgNYBfHd4jTB4wJXfWTOB0+l2hqSFms3o/eQweHrWA8jXrdTDQxjpl?=
 =?us-ascii?Q?KLkt91ChbueJnkyaSy9rDuHyjjkg8nPJeO6krod2zP4LKoww4lzSxICJYfLt?=
 =?us-ascii?Q?SBH91pnNwwUjdbROhYVFGjK12BEc+3rLKfpD+m/5GFx/v8RkVDXQR1GoUBr6?=
 =?us-ascii?Q?M/2nXj3S3L0uZulJsd8m3AQLMOuB4XwzJ8qBcvQ8zqjpn0rs+h084ESjxa6/?=
 =?us-ascii?Q?7LeuZrOSBgVIBbgUVZhzAsFYGVbPRpMmBB642punlxc+y6Vr2G/2SXBKiRrJ?=
 =?us-ascii?Q?fqbIeFC+ELyRWcmaopu4vsZqbMsS9H+l9xb5DjYOc2huFEZ2DR7hjg6BpaQt?=
 =?us-ascii?Q?il30Z+tET47AjNkZkG+OjMw+LdyPFVK2N3oY/twTtXLYNc2P/JV84qbseASb?=
 =?us-ascii?Q?iwCpNOn0z40kxw25x/K6k6+qq5bwcysJH1yuMc9B7F+Q5lULiwmc9W3rG3db?=
 =?us-ascii?Q?6yMoKl0kvTjAGJG9Sjnd8BFR+TkewFmwNP5kb91lZdyuGcmQWVnvoXX+J3Em?=
 =?us-ascii?Q?iDdm8swkW6rEZqYIATv72Scfz/VqdByBe1DFf4WO7WXYq2R+l0Hgu+TjJR3r?=
 =?us-ascii?Q?WuastwAqaII0f0JSM2gBe78mpkxxAwvXnNiPyoRd+yFjHyJzis+xwn+0uBGw?=
 =?us-ascii?Q?n611rPSyNN7vRLQmdbI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879428f3-6f54-47af-3175-08dd0b282456
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 19:01:59.2647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qr7JoyeMaAoTeXD4LVVCWWmnicDVgHFzNTGlREwAbpkQaBeLnDVcoVihlGEHYS3R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10489
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 19:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207645

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Rasmus Villemoes via lists.openembedded.org
> Sent: den 21 november 2024 10:09
> To: openembedded-core@lists.openembedded.org
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; Changqing Li <ch=
angqing.li@windriver.com>; emkan@prevas.dk; Rasmus Villemoes <ravi@prevas.d=
k>
> Subject: [OE-core] [PATCH] bitbake.conf: set FILESYSTEM_PERMS_TABLES usin=
g ??=3D
>=20
> From: Rasmus Villemoes <ravi@prevas.dk>
>=20
> This default value of FILESYSTEM_PERMS_TABLES is set before
> local.conf, ${DISTRO}.conf etc. are parsed. So in order for
> ${DISTRO}.conf to define the value, it has to use =3D. But that then
> precludes the ${MACHINE}.conf from having final say, unless one there
> resorts to some override hack.
>=20
> Demote this default setting to a weak default. Then local.conf,
> ${DISTRO}.conf, ${MACHINE}.conf etc. can each use ?=3D with the expected
> precedence.
>=20
> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 02bbf0e7a5..daf2d952e4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -381,7 +381,7 @@ FILESEXTRAPATHS ?=3D "__default:"
>  #  base_prefix, prefix, exec_prefix, base_bindir, base_sbindir, base_lib=
dir,
>  #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infod=
ir,
>  #  mandir, docdir, bindir, sbindir, libexecdir, libdir and includedir
> -FILESYSTEM_PERMS_TABLES ?=3D  "files/fs-perms.txt \
> +FILESYSTEM_PERMS_TABLES ??=3D "files/fs-perms.txt \
>                               files/fs-perms-volatile-log.txt \
>                               files/fs-perms-volatile-tmp.txt"
>=20
> --
> 2.47.0

Careful now. Changing ?=3D to ??=3D means that it is no longer possible to =
use=20
FILESYSTEM_PERMS_TABLES +=3D "..." in, e.g., a ${DISTRO}.conf (something we=
 do in=20
our layers). Instead it requires that FILESYSTEM_PERMS_TABLES:append is use=
d.

I guess there are pros and cons to both choices, but if it is changed then=
=20
there needs to be a note about in the migration guide.

//Peter



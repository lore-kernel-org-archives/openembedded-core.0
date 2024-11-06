Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C13D59F7E
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 22:39:59 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.28])
 by mx.groups.io with SMTP id smtpd.web11.58982.1730932789956334875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 14:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=DYW7wAmt;
 spf=pass (domain: axis.com, ip: 52.101.65.28, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIYhpFE/MvRiudy5oJNEP8ynOt5P4wJG8RT6VC2GR4VNCxc9y0mEdwZRASulf1z1dduecCHwYaNhu0rvpoPR8k4EI/Ejbul2ml07bZ1u8YHWDs2hT+FTQXu+r6NhLAkuL+C1WaeoEZmtQMUlOs3NtmdpjtvFkLkeM2c3mKNutZjoCj/k7mTo1tOZgkYZ/cVY0TUpumnQOqLN6JKXIuHnipba+srb1f8mYvZvIutcOWs7NB4hEcpWM3gd1uboe/nS5EZX5mr1D59sDXU4QFFqBQMjqiu3coGCC8GKTKathW96LY8m/UhjcS1bsY4PTgDysGNm1JjFtNrqGIyV10SSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzetQMlAZCKZueyYMCIk0t4uJ6WPj83u5bldkKl7bEY=;
 b=ak0+yelPN4iADazV/SGFpPSduNN0cwBt86StmFYT2L0h+XqVkbGyYxUGGjmVxlE6nmgACv7RtMZ0Ojdoic4z48qubd2rmX0FAhKZPik4uhylazsQ5mwM8WqV6ZP257Z8+nI2s67Egi0vrcWUvMtL+ZhiP49CZsgVGPH9Al+djo4o10jrwVWmtjZoQscexyGyx2IPZgvfn3txH1Ap7o677RbZgCf8q/9muCRd08SbPZ0ZFtO98oOi6r2z+POHNtG3gFiLYbJAeIsliDit1m8l71xiJKY35YbFRDh5Yod4ESy0Qw9bDgZ9Akp7i3zuAmEiEGyllTbVb/YIguaI6WGp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzetQMlAZCKZueyYMCIk0t4uJ6WPj83u5bldkKl7bEY=;
 b=DYW7wAmt982rKdpVpII+Wn167nS//V5dSCZNvZdG7J+Xw+ecTHmOPRiT8YAzUBnf9VG+c7gA4a3XrozvW7lj1Q/UbCZ6hphop7U2niYXTKupMUJlkf8Vp1S0ln24v70HYcrn0KyQrvuFW23fLuFw5X+DqTTIlCbWuR6PwAArygE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB4PR02MB9647.eurprd02.prod.outlook.com (2603:10a6:10:3f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 22:39:46 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 22:39:46 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] bitbake.conf: Enable ipv6/acl/xattr for
 nativesdk
Thread-Topic: [OE-core] [PATCH v2] bitbake.conf: Enable ipv6/acl/xattr for
 nativesdk
Thread-Index: AQHbMDQTL33IsSXYjU24CH/DB5EnCbKq0UFA
Date: Wed, 6 Nov 2024 22:39:46 +0000
Message-ID: 
 <DB5PR02MB10213CD43DB2665982DF6E1F6EF532@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241106100957.2905277-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20241106100957.2905277-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB4PR02MB9647:EE_
x-ms-office365-filtering-correlation-id: e583c2e6-b8b5-41b6-b06d-08dcfeb3ea54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?eqNqVWolY7g6yxFiii3jWWHfmBB89QVAtAUT3nDdqpDnvIgUCPn/UbT/m6k4?=
 =?us-ascii?Q?fpdxfV6YOF09TKJdzmIhQMOGcWZHDZ9f6RiuhqJy2qIycPmTVb2RULnjBfwn?=
 =?us-ascii?Q?dsWoHAH6MTYEuom0MB5SWtBXroJ9rI5e+iFayQkMOS7twP3S5oNaiaVdFEwq?=
 =?us-ascii?Q?NguEaL3JCYI30hXO6VZNnJQwvlQbRsFvl5n6Kryxr5oURVa3nbv2Y5MYrg4t?=
 =?us-ascii?Q?hloeb1YizcJ/PUkudCBH2dx3YA9fcNZw18nzw32pI8bR97mWB4tUzhEA0FNz?=
 =?us-ascii?Q?kugfhyXMXFwcx4Fe4PGcu2fH2TWZiLmUsby8bIdCun+fxgwXvMQ/axMjvs5q?=
 =?us-ascii?Q?Bi6JCeZLKDsGRM9411moZ+TN2V5/MjDFdqs1Rw1FswAIIgLnW20kK1orRtrR?=
 =?us-ascii?Q?FXGDdPqeYdkPKbQ22J3aet/2n+vpawuVXIfwQuMcAb2e4Eg9E8pSJ4Lu6b1C?=
 =?us-ascii?Q?ZriY4xbkzjNlslPFgIQI9sdbqHXuXvcr0EQC2aclBkqvPVpOzrQu3Ia/LAa6?=
 =?us-ascii?Q?EwL+UVIEu5IZ4dcJF9B81411X6lu3qYAbm+RO5YLRKW3riF11JlSZWAyQDtf?=
 =?us-ascii?Q?iOEWJtucq30n3qf/C5aTjUIGiZc4YhF9z0dUKjW/g/2QgRhF7mdBR1PIQbu8?=
 =?us-ascii?Q?yeBeePo/iT1Bf++5RkzE6KAIoyXOmQ6O4trLrf8Tb3hZA4yRhmD8Tr4sNQsw?=
 =?us-ascii?Q?gRuoe6AmKsBiWUVxOi3EAorisC3Xwk7dy65eC20oVdnYlL1iFtJpxYECnQvo?=
 =?us-ascii?Q?AjCmbKGR2y2gVV+qFyvUQStU7MIL33xOvNf86945Xn6Z8T0H+UUcDcCYrVoq?=
 =?us-ascii?Q?SX1g1lVLX/oMXKr1cROTOih5iBqOT6c5A0FIxKYLwKSxQEVKqaa+Yyka7OaM?=
 =?us-ascii?Q?udmeHGzqAQ5I5CZCPUS3GYcXJGUzQfjhNripG0YoeEy57hc4y+pBTdNeSwnB?=
 =?us-ascii?Q?zdRH884t2HDuEZb3JYUo2Mss1Z7UI6p2KpMMXiqv1zeGI4ANdW06MlRJapCL?=
 =?us-ascii?Q?/hVxGgE3x+/fPFJO7UnsWkKo8YwjZLphSxKmwQpHWmIN3qub9lgdHNf/J4KU?=
 =?us-ascii?Q?rZmtBiXS2FnNGoMEs9zHD5jKUDTYDXNMNZUj4Az6hjdtusieTKzrh3NcwRY3?=
 =?us-ascii?Q?64uyHRQ70i/029pGkAI1gTAy4fg817y03cOdlFrUxP6q5AS3yyAF8OeCyrZ6?=
 =?us-ascii?Q?wkpzFt93sZ/PWEpvnzeRzQZfBjdLzqgN0GPKBl7sq5+Z6HlrutgwdMcaGNnB?=
 =?us-ascii?Q?HD6/a+speVf/yuEaKGQYkbXfF0Y5IYyDqlXm+KDjLc6IjlopnVpR73CO17X8?=
 =?us-ascii?Q?0t17APwhPZuKzDveovNqReIIo7cNDrSRUBqZtjPzOTtQKgsfHAfoWdj43g0D?=
 =?us-ascii?Q?lvY3KyQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?F7ICCCmpl7eaU1UAnhCypB0tcOp/ubvPx322Qz5jY4uVP7Dk1JKJdeKHAgeZ?=
 =?us-ascii?Q?+Betj1KH+yeKG2Jv04dGT4N4DpDz8YBNpxaMU+EhEm9zHAZyML1Xt/OvFg8E?=
 =?us-ascii?Q?y0bA/4WypUJPWNIRHq04ndLGkqZrXdzqpOIL+DcHKZ7JgCMGjNlUIR9iJxQL?=
 =?us-ascii?Q?gK+1JUOSPHuZswrKWDf69prVIXIou+jfe4d3AF1KQc3cQfw4EUS5LCLDJfhh?=
 =?us-ascii?Q?MwACVv3JjMukl77ZwEgzDsRR47YyrDozgmw6S4ZDEYZ3o5bWyUQ9KmqnuG5a?=
 =?us-ascii?Q?mSFKvR0/lKMMSYglLzPpY4uswxqcQ09Qq7aAm78YYuMUhkNEjx07pdo0xaUL?=
 =?us-ascii?Q?Uk1PzsjdXNMCRbsPv/GzLRR3A8QejwtlEPqD49zks8pmDqrqNwq7jDyzAQER?=
 =?us-ascii?Q?Yinu/dDLXuA9kaRcOcbHfOKdOcPwO5nMyQ8JcSvjjsX8ufYUJpbvsrLkr+sm?=
 =?us-ascii?Q?9qvto/5Ao2nMf6zlenyXGI3ftPfnp22MGjIDd3lyQlpJPZCRzBzVMuH9cPFs?=
 =?us-ascii?Q?vgAD8FWF7y/vpCsgl3PpyoA44i0mvHAhqrgjtN4SIzHCL7YlTQCMbwqYIdT1?=
 =?us-ascii?Q?U7Kaa4AsXz3TtRPa/xc/ZVd9oy69aLhqRbEXupSG+/ufYHtSa81Yu2K6W/kL?=
 =?us-ascii?Q?UGGe08a4uzniB0cS/Ad9cxQGt9tZomssi4sz/8FTldeex0/zpysiSdpaUDZT?=
 =?us-ascii?Q?qgmezoxUkmHQK77yqKAzxpHTMrO5hOZFsxhSstm6/pJLR6EL0U8tCIpXeuPw?=
 =?us-ascii?Q?SYtLiwk9tXZvdjEMWYYi7v1SKF9rYG5RQSiLILUIx5p8iLCRM415Fw3RNnTk?=
 =?us-ascii?Q?FguZAcy2SjGCfyW67N+8mLpzaYBiQustBkTqDjAboIJvJA9DBdgtraXL8DO3?=
 =?us-ascii?Q?qbVv1BPJwFUdOI5YdDIh7anavGsuYS+PgGERdGyssPVbpWZy26n9e77vDC8x?=
 =?us-ascii?Q?nTFByIGhqqsUW7uBzZ65aqKANBasfSlKGpcOlE7ZpzLpUInmwHJ7zR4SlnID?=
 =?us-ascii?Q?OKc0yS3wG5oglTV3IJ3VenVx4GDyPPnZ/+PpchQnpvC/by7bSMzSr/ckCywI?=
 =?us-ascii?Q?1W29yYBBZF5XXUuf0/2O2XP9GvugpNLLZ/jKFoZ120tYGHW2WwjqkdXNT7NC?=
 =?us-ascii?Q?fLmuhWD9s0NJWGd/DZxGvM5XOdF/y4pEifoai6w8V2Yq2rsPbPrjgtZU68vi?=
 =?us-ascii?Q?keLkYi5nLu4Jed+UkwWuaunx0ilG2/W0lJ2mXbUl30Pn44zWSD3Hpdq/w3xp?=
 =?us-ascii?Q?l3H/KMxy38bfdT66r+dAV/q7cHEIccn3XwC9VndX8gArkQe4CA55ikR8XUhk?=
 =?us-ascii?Q?uMM5tAjhFWsIwuYvF66Kz/I8HrZwkCR0xTPkqJpvge6hKrluxQS3rCXg1N02?=
 =?us-ascii?Q?LWhPDHcfJnOUzkUmw1yhCRJqyd1o43nLJarPaEWMqO4xCOr09Zw9SJnq5mXC?=
 =?us-ascii?Q?3jhTP/BQllm9CmzfbMiiJkadFs7YNZcaO3fevPkKbDMEIVRosuPGGyRZUsdC?=
 =?us-ascii?Q?sDyTodEQgGipv6nuETx6Y5jHKZw13AUP0igaPf7cd/EJBDJZOy4CeBKddLp7?=
 =?us-ascii?Q?+BtCAgORrS7spKGVyfI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e583c2e6-b8b5-41b6-b06d-08dcfeb3ea54
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 22:39:46.3344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CIGmxBWusveI+FjQgFoOYRlAxt8vGv5nG7zWRX74HuyLiCTsN+YUtr41YrBrDPxx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9647
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 22:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206803

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 6 november 2024 11:10
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] bitbake.conf: Enable ipv6/acl/xattr for nat=
ivesdk
>=20
> I was surprised to realise our buildtools doesn't support IPv6 which brea=
ks
> usage in our own autobuilder, let alone anywhere else.
>=20
> Enable ipv6 in our SDKs and enable acl/xattr as well before we have the s=
ame
> kind of issues with those, these features are now common on most linux sy=
stems
> and we should be defaulting to including them.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> v2 - Handle mingw which doesn't support acl/attr
>=20
>  meta/conf/bitbake.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 14e761e2e7e..02bbf0e7a52 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -916,7 +916,8 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
>  DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
> -DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> +DISTRO_FEATURES_NATIVESDK ?=3D "acl x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVESDK:mingw32 =3D "x11 ipv6"

While I know you do not like :remove in OE-Core, isn't this a case where it=
=20
should be used? I.e.:

DISTRO_FEATURES_NATIVESDK:remove:mingw32 =3D "acl xattr"

Otherwise someone doing DISTRO_FEATURES_NATIVESDK +=3D "foobar" in their=20
configuration will get a very unexpected result if they are building for=20
mingw32 after the above is integrated.

An alternative would be:

DISTRO_FEATURES_NATIVE_DEFAULT =3D "acl x11 ipv6 xattr"
DISTRO_FEATURES_NATIVE_DEFAULT:mingw32 =3D "x11 ipv6"
DISTRO_FEATURES_NATIVE ?=3D "${DISTRO_FEATURES_NATIVE_DEFAULT}"
DISTRO_FEATURES_NATIVESDK ?=3D "${DISTRO_FEATURES_NATIVE_DEFAULT}"

> =20
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value

//Peter



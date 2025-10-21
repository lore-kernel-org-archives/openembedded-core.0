Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8B3CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 14:15:25 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.12])
 by mx.groups.io with SMTP id smtpd.web10.13097.1761056121480424502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 07:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ZgO6sbB7;
 spf=pass (domain: siemens.com, ip: 52.101.72.12, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgrV/AbXjO46jTNNt8oCRLAXpKFwMlhzrfRyo3OU5Vl7K/HJd0/eurOTYxNtQtczJ/ZBf02m/Qa26c3ujI9RwvompsXMoLeoJar9VNPBW3mn/AANKZ4fr4eBHNl3OtLb2NGOzu4Bez/XIig8DqYEyAbUKcQNcHoZ9dBpfAufKf6gjZSq4uftgQE9XcAk5ZCNg9B8tZc9qxf5OZWz8vaOIIAAEZp92YVY79s8L2BeADIreOJBLNGyBz6Iz+EwCt5WaAK8LO4fj/ph8OUejw5dZoD1c2CcssUC+2KEj52VbxE+AyIHX1aI9mp2l6XJjnUpc9o3CcAk0W0eUj1GfQ9YcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCr/P4VlpZ49q9GNaAvdJZM7rHuGAM2weO3+c0bkgm0=;
 b=tRq/0IbKVdbUWPG9TUibVcZ+g20BhrbLVTL/upGrTXYs1M2cOK20t/+4/PqGvWz0lR9YftpkI3iwVnVKvQcG49KZY9T+rMYTlT2YypH85BbHpIP+RnExVUtG5d6c1ocsY2k1f49GnG89ibM0ynEVguTELz1U+X4t7TyTy/A9yx47dwLVZ59TuQ0SL/H+ffbCZ/1YXl9/MHwazpSklzV8wGPlQRp0kHBuKxjH2Lu8z3ylz4IRoiD+kCPqBhge+wp5fGibTny01QvFEafX9IYqVJ8rtFxa2qoYqT4U2fgO6+pzaeVlzBcYKfPyPlM++2vhO2GzJ8cch+E7HPSwErkkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCr/P4VlpZ49q9GNaAvdJZM7rHuGAM2weO3+c0bkgm0=;
 b=ZgO6sbB7OxDfOLeUhjLCnMA0LadFc6y9BK5lQeVyVBf9Fy5Kxb3XoOaoBudtjREBU+No0i2UBWbF9rPRn6jT18gftVD+7wK0Av0zl9JSwT5tOJ4w4ttc8paw9H8JMu8utQ8xtTuawF6SHFPQdiy/CeOQN09yRVOgDJvB1cJgbFfGmmPXYavnQBDUWE/mSzLO97CZ70DtUCc+tWaCVPWGVp19pEvlvl6hUbgvxjJjDXw1r76iMH0GYFhyGJAXRq/2FCDs0mgpABluAPBzd3RXtrFtC3gDvIIY+w/joMf5Wz+Tyjng49zdZo4Q8kizZ3NvQdrnhf6knEZTsc7x0CdK3w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PR3PR10MB3998.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 14:15:18 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9228.014; Tue, 21 Oct 2025
 14:15:18 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Anders Heimer <anders.heimer@est.tech>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] libpam: mark CVE-2025-6018 as not applicable
Thread-Topic: [OE-core][PATCH] libpam: mark CVE-2025-6018 as not applicable
Thread-Index: AQHcQpLurqrzj7ocM0K8qCCc5Lu0XLTMotuQ
Date: Tue, 21 Oct 2025 14:15:17 +0000
Message-ID: 
 <AS1PR10MB56975C5F92A56C6F1B7BF094FDF2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251021135907.17684-1-anders.heimer@est.tech>
In-Reply-To: <20251021135907.17684-1-anders.heimer@est.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=cc7e530c-67f9-458f-a6ae-0fb4c66559ce;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-21T14:07:15Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PR3PR10MB3998:EE_
x-ms-office365-filtering-correlation-id: aab981b5-b754-4ccd-e39b-08de10ac432c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?WfGiEjO0RuXP/vrl2PLclRoOJVyqW3V56gsgVa4EvjplCCXfaTL85KWqEgPD?=
 =?us-ascii?Q?xmJuCM2WW83pQOtnqHDbfq5uvjOwb941deoyiNWNzCAqvp2XYWTHVv8SSETj?=
 =?us-ascii?Q?7T7w+1jE/s2kAeBrLfLNyep1BG294IKga11nOxpfK4uwGeZFGepoNXmPsByj?=
 =?us-ascii?Q?52z1JskZBQqGHxw5R7QLe7Q+ibksHw/W+jtCu4cEJUz9/URtjiKI/BeqG51T?=
 =?us-ascii?Q?0jnpuOBhzK7eKxdyObT4XLLR56II+HBYtimSrJDQ5HFxXsdy+9QlKzp6ZTJ9?=
 =?us-ascii?Q?3YbQZ0id1aznGvbWmFZ11wiLV+GFc3tdZoAHYy6bsTfOJ8ObxiEDnCNR/7wB?=
 =?us-ascii?Q?uGluUJmzDTYU1II+hr7bYwIrd1F9n+V2YtROIkBsi1vHrAY060jFnyxEun7s?=
 =?us-ascii?Q?gUTsFH9F6EjZNoJUHUmAn57HZQQF21Z9hsdniU8lekf5yfvpz1eHRvy31rm8?=
 =?us-ascii?Q?svrcIGTHncDJKhITVc8rWvlXePFv7lHp1tpZ+uWeY1eLybAAD3TjLHuSTYma?=
 =?us-ascii?Q?aFtW/7ZY5kpnsgK6ZCKezt4iw4W5vLjrjTcuo9hOXspxTqAXaHZZLo1yz5Rx?=
 =?us-ascii?Q?P+kKXMT0tCsYLxx0aj/xpzZ3RrSfJBfylxqhPOjbljHPrhXDXWc22whxkd+Z?=
 =?us-ascii?Q?DyxEXFJnm79mWovNvTuWA6LVq0UMtiHys23SVXuV1SFHh/wcxjwGaZz3Htms?=
 =?us-ascii?Q?srNQR4qWlALinyTCj3PVyNPPCoo6U9Ph2UI4TP6GiTJjr0oCBSJ8tdShpFDF?=
 =?us-ascii?Q?uyCrQYRaq/p6Ziiu+e9dJ0wZOvBnYHGRFbILPVcaR2kOIZyPy2DXru8NcyWu?=
 =?us-ascii?Q?HBdcnF4SEnhxSAMna8d3lVlUn4oaGyklAv6eXzdbGkR0AGQ7pt9+Cjcy6gj4?=
 =?us-ascii?Q?vj/JVU1dCdpACs0YP2gM+8sVoC8VC1Jbo4GxSyiwY0WU82vWMbt7n7iNOsgK?=
 =?us-ascii?Q?hG/9e87VB3K+zaOBCZYuFvOqaMFn3klFeVS814g2nCtWguHNb2VMegOZcPds?=
 =?us-ascii?Q?0uA1yuusif5xWToZQr5Kbnh/trGXqtQ5Z3trX8wIgjPleNSjg3ORBLArqwCw?=
 =?us-ascii?Q?+cC4exD7qoMO30VAVDNEFlKl/1RNFe9WyHvVROA5LUrVgl5cdsGjYuQpRWOY?=
 =?us-ascii?Q?MNUhDWAmdfUEMbOp4G43Q18ITp5V+vwI7aTCHStM+k173HD6XVpIUBU30JoF?=
 =?us-ascii?Q?T4t1iQdq79CqNTZ4KMqEBK/fNSajZ79iqBm0aledh8FlkFZZ8AgNezxpTf5W?=
 =?us-ascii?Q?EyEnEug0ZJoVgtjVWVWcjWthNjfjYC1mMlNwl6gkZK76qo6ZjpaOCA5OYhob?=
 =?us-ascii?Q?lVVY4jzw04qbM3aH1/Ysl6ywWvWtVXv1ONV1zIvH6T2YZF3vKwTcT9pJIXN6?=
 =?us-ascii?Q?qoHE7lhHsowtmq4Q3AqLiKUQqeZkYqlci3ZaSHahl4ROjJMzWcKpzgfLnFJ2?=
 =?us-ascii?Q?d9X4kwUjLvSUdIHflWY46jIMW9Y+mwlYEtEwpCH74FtweuOoVO+x3e4DUyFf?=
 =?us-ascii?Q?8+77+qgXJ2EEs9FoFRrQc1HFkhYGmNhoaQAh?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?a6inmg4J2op/a4mDxvidzD2vrytA5eltzCv3bRogwzGwY99CIAPw+hN1Xern?=
 =?us-ascii?Q?gr9qdjuiUJHH1bUMd+moFBFoOL5AQSf/E42zYhqoK8RKAtszyFTNel8qqDKf?=
 =?us-ascii?Q?ogpBfe6rJC/Ka7J2nvmJunNO6jOUczQTzquJbZQBFlIlSmoXd1EmygWYcP1k?=
 =?us-ascii?Q?FUZPf9R9vPmjcdeJaDUQge4yvxQbm2ZOGMLCQAqvB4BRP8rSRDT/HOuZhEQy?=
 =?us-ascii?Q?q9jxIQcuRR4N+PzAIKbKasY6tSBgEzf5xbW7MkqdJP7rojWyhT+RPLm9SZc7?=
 =?us-ascii?Q?KDOdKfm+QKsLJF+LqFiEXVpdVaMeGRo4P9YkpuEQSYvKD9ISxk/M2n60uIxr?=
 =?us-ascii?Q?mkeYxyPmgQWR06RKSvsgWb4HFO9Etg3jsxQ/RgQknaI9w8osXdRxu54h9ow0?=
 =?us-ascii?Q?rHll0q+tayIVTxpiHilTuXz5tstxup1BdBArApwEikMZQ07S/BJCS38oOrUI?=
 =?us-ascii?Q?0BYZX41gYZEu3ldu7Ay+AGmDt30XvK438EQ9Q2EIuugsoLSiqOFnkfC2Btb6?=
 =?us-ascii?Q?oMBUF9tvakpY73wpdTiNX8I6wg7aOqDtYO+fBzOKkMm6rKAgTupewNaoRx5P?=
 =?us-ascii?Q?pzkovvKYhmCo+n2UtdFhqJs3yoDGmnLHTha8gauYKhmp0++EkY+5i6cjwxzR?=
 =?us-ascii?Q?lGtDwfcvoCx2lG76xj5BvFvpnD1gqTdDJGsVKjU/3tMIcIKuYvLL0TOBdGeZ?=
 =?us-ascii?Q?K89Sl9L9J+/6+7Uj5jZbz400BDh5o/C+pC6X5heV76HbgSrF4JR8g4vOX9UM?=
 =?us-ascii?Q?ZRlcxzVTXpwFnNjQH6N05fOFO23W9HBkU6Od3FGzd1/vC7LI+8jjO+35gTDT?=
 =?us-ascii?Q?z0QrVw7AbJ7tVHKW+EA8gd6jelVMoRqwPt1Ckhxyv0ASF22GKjAMHl/YvsMc?=
 =?us-ascii?Q?pJB8PwRNsCDuv8tlqCpZ8YBBd141aWMWM4x8Thx8CbElML9jjHLrSWuwVtHK?=
 =?us-ascii?Q?S4xMkYlsbiljfPsyfotTwxc8yQrNiB4onbpYIqI4bo6olA+mEt4tOYKjS1tk?=
 =?us-ascii?Q?xOidIw/aSp9U09NZMh1XycjFkhHdx2VVI7NZ9Boyslu70N8oVFvxf64Ph4g0?=
 =?us-ascii?Q?ITlVQzLSxuwkYcXLOMwak+yM+7Rmb0RBzYjdKhyxn2maFNslaYMsl1lGyGYA?=
 =?us-ascii?Q?ROyFkriZExm0F7wpUtslMYOuveLRuGkg/fNlPuyNpU4zc+Hzk10eHvsHEUIc?=
 =?us-ascii?Q?KcHqk1bHslXCxVeL+KpdhywKoYmfYjW2MKjJj7vJjsZf2hBL3UYy/HjvpMqM?=
 =?us-ascii?Q?4VBbn3TAXbNpepNLMJXhr9oiRsVJuwQIber/0sPQIojsPTJ7gUcCnaTrAYr0?=
 =?us-ascii?Q?Yy7zLnKQe4Hn7RxAckmT2yy7Cl7z0T7irUd6TBYEWMBrWzP6KrehN011wd16?=
 =?us-ascii?Q?dVRLnNTuq9x5QUD2RleEELxh8YMlt9wJQkdZ6QCIkn2ZcOq8+vSIPlN0MvBh?=
 =?us-ascii?Q?hNEoTM/xfG/AcDCbv1hbmphPk9jAYvPKESNcCEEzZqV7jKftcXrVy2C1uC3v?=
 =?us-ascii?Q?XMP6YBB38LERr6hfWz25iqPgennYsdxNsm2ILflRY0UPms8MUw7+83qxVlyM?=
 =?us-ascii?Q?IMSfTILvHxJ5P3wmnd0XGEkNKJYGJsR8FxOVPG/x?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aab981b5-b754-4ccd-e39b-08de10ac432c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 14:15:18.0042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZvSmJ7ag0VuhQDyJWyXVht4d7e4NHGktkipWTS1guhwYXS9Ta9QJ130sBysEkw6u5LkcV2btk0l63G0dPr95Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3998
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 14:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225151

NVD shows following CPE for this CVE:
cpe:2.3:a:suse:pam-config:1.1.8-24.71.1:*:*:*:*:*:*:*

So we don't need to ignore it as it won't show up in Yocto CVE reports.
Next time I'd search for obsolete CVE_STATUS entries I'd erase this commit.
What's the reason for this patch?

What would be worth investigating is CVE-2024-10041 which is reported for l=
ibpam recipe.
Unfortunately not reported on autobuilder as it's not using systemd+pam dis=
tro config.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Anders Heimer
> Sent: Tuesday, October 21, 2025 15:59
> To: openembedded-core@lists.openembedded.org
> Cc: Anders Heimer <anders.heimer@est.tech>
> Subject: [OE-core][PATCH] libpam: mark CVE-2025-6018 as not applicable
>=20
> CVE-2025-6018 is a local privilege escalation in PAM that requires
> `user_readenv=3D1` to be enabled in the PAM configuration. The default
> configuration does not enable reading user environment files (user_readen=
v
> is 0 by default). Hence this vulnerability cannot be exploited using the
> default configuration.
>=20
> Signed-off-by: Anders Heimer <anders.heimer@est.tech>
> ---
>  meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-
> extended/pam/libpam_1.7.1.bb
> index 8d9ea27028..42b50a8c22 100644
> --- a/meta/recipes-extended/pam/libpam_1.7.1.bb
> +++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
> @@ -26,6 +26,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/Linux-
> PAM-${PV}.tar.xz \
>=20
>  SRC_URI[sha256sum] =3D
> "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
>=20
> +CVE_STATUS[CVE-2025-6018] =3D "not-applicable-config: Default PAM config
> does not use user_readenv=3D1"
> +
>  DEPENDS =3D "bison-native flex-native libxml2-native virtual/crypt"
>=20
>  EXTRA_OEMESON =3D "-Ddocs=3Ddisabled -Dsecuredir=3D${base_libdir}/securi=
ty"
>=20
> base-commit: 416731b8756cd2689055ada2deaff48c7751d3b9
> --
> 2.34.1



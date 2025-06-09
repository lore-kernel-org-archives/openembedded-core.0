Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA56FC5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:28:34 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.26])
 by mx.groups.io with SMTP id smtpd.web10.55716.1749461307694263318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=eASNw87H;
 spf=pass (domain: axis.com, ip: 52.101.84.26, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h479SUBU2B3q1NTD0nw7aeiBbtp5ZIt9DHnTBFg72DH/2/z/T86Xz2QmZzv/Ybn4QXeEMGta1ZsAIhoAGREOzcFVnl1j8SdcWtnJU3b9PXKQpDFKeO47pPlEVQgjoxyug67ZrNUfGACWf1XyDCxZsFlklxzs3Og15bA5nDjLG29OXZ6puKOSSDuSuCQTPYKX92c3YdBa3MxB/neoXmIKk4+H1grlzWJuCJbYP3HPpOwHmiQXIFgwQhodpshFdF2OdhvQ31WtTs8lNO37PDcKYsXuCsmblNKywb0Ij5nBskasp9DNtGSivOmww495MPVQWJc/cOhqJ2CqSpSic7xVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL1n1cDNtA6KLWGxMbhjo8i+ab4liaH+i/joipdhMXU=;
 b=pMxYneW5HZbdEXW4hH86bIcG0l9xrlUvkwX8QL1W6a8zC5jGWsFQiRrzPG5OV8CWX4k7DKX6OGCcsWNPQFDOjDHJCXGWbsdUsQrOi3SueyM99aVhl+nAZaND2Mh5uZ4V4F5dCxPGupkUd6wKVEIdCmO3rtDtOGsJ66tbe+AUUSR2QuJJwndJ7xJHfTN4xtBSEN6/bzry/bRo9+gLJoDOT5iNLNd2dYPn2tKYra2VUJneEbZ3885cFWn5jKjCUgIa1RMwHY0oDtmmeU+ehgYELzp/PN4FZ1Rjbw8BoC8A+iS+LxXQX+l+JIAY51kBGk62B4/nqXuhH7uIQL6rQKBGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL1n1cDNtA6KLWGxMbhjo8i+ab4liaH+i/joipdhMXU=;
 b=eASNw87H5pzgPOXj3TDNvnDsu07shiC/ecxxt1TdJOSAvTdtqRJga/jc44Lm2k2KIxD07RU/4GReTe+CivtvYQ5rxbZn29oZa8T/0Zq5q2uPymWGDiTyyZba4NQ8X5ArsU5tneUly/2vvOHtr9NhLIZ+79t2H0es0j1grwzTymg=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAWPR02MB9031.eurprd02.prod.outlook.com (2603:10a6:102:337::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 09:28:23 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8813.018; Mon, 9 Jun 2025
 09:28:23 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v3 09/11] mesa: sort out PROVIDES for the glvnd
 case
Thread-Topic: [OE-core] [PATCH v3 09/11] mesa: sort out PROVIDES for the glvnd
 case
Thread-Index: AQHbyz0FmbYvC3WJfEy7hePLrhLnWbP5yeFA
Date: Mon, 9 Jun 2025 09:28:22 +0000
Message-ID: 
 <DB5PR02MB10213DB92F7EB71D578B4A8C4EF6BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250522171334.3040820-9-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250522171334.3040820-9-dmitry.baryshkov@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAWPR02MB9031:EE_
x-ms-office365-filtering-correlation-id: fcb0e3fd-eb86-44f4-81d7-08dda737fadf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Lp+mfavlVQivLHaqCIUGBsL9pLrO9w/2BWEG4KXz+XQ/v3a2P5IGqpmdD1lW?=
 =?us-ascii?Q?LNKLeuAcGUn2cbYJw+HydHmtHte8/nasa9H1hRcgw/+LEbfmQqZkCTaLTJ6H?=
 =?us-ascii?Q?tAZEHrVsXFxNoIGsARPIqpoemcD7+2XOFpSoTE4wYPLcYBP/gzS11wxbGIWm?=
 =?us-ascii?Q?e48B8Y9byIDu6Oen4l0Ooa4mBKOMOS9vUcHk7jIiaJuawtkFaKvbYpNhCtpX?=
 =?us-ascii?Q?Cn8WbDTA+ZvVzh980g3gVdrkTVD7MYvh2Uyuzu7xWOQkeVYtYAjm6r66olYz?=
 =?us-ascii?Q?RTm76u7p8mIwwrRUTY6saNMo81ESRjVWgr3TNKpNYMDhGWwxZierBSZeQmL9?=
 =?us-ascii?Q?LKsW1zWLSm3MXGLbIypZU6k6pTnRq9+ZIreMbJT7K5uUjkHjTnI82gpseN5Q?=
 =?us-ascii?Q?AWP/D5EaSIxUxF1yd1Utitovi1mGRIvNlBP3qPGkZCM5rTP9aSklG2MqpIT5?=
 =?us-ascii?Q?1fYOCMS/gLpJitknxypeKUu6risa3VyIH8QndD+UYokWnd/tZFDShg/6JcQP?=
 =?us-ascii?Q?p9i+obKRxLnCu/JFGDRvU2GwNtbGZM8Qqiagsbmytut4npfnZ0edLgvEBsIU?=
 =?us-ascii?Q?6/TN8uwBbUSqQzh99XoUbcpsnYg/weUwi5F1dEGltFP0BHiTF17D8oxI8tSG?=
 =?us-ascii?Q?UP/uLcEwN4UndaxK8GGZJonkP/oWHTGI0UdcXcoHFKL0sqXxgguSDPGoUpb+?=
 =?us-ascii?Q?wWZcEd3yn3e+/6Jkm8FGTZG98yHO23E6Yteuhrfq4aGbFkYY+3j6XI1N3uIA?=
 =?us-ascii?Q?0mbgrp0LpQftwXAFHKCscz4sG98SC1TXTRKxQ4hTSBrJlHsigs/y012OKgQg?=
 =?us-ascii?Q?D5JAZR5yWKYMuELp+BR7uS8+szO1h8R1XJUSI3rGJbWmno/6rzxahBgbJ5Re?=
 =?us-ascii?Q?eYWoMaRUUhb8Nezfaz64bgujKfIfjJV09MwqlEoAaJ0D0zr14YvKAhysNXRv?=
 =?us-ascii?Q?ym4SBsYlGeWuOTGsxHMEZCzQwFq+7EHRyRj4c6P9PETc6tGNgupTEAERFjRp?=
 =?us-ascii?Q?lNPJx9ehYTKbbdGExhLvvOt2Ro/KKyhXCnVQpQgX4tQwW48bCdF8mKrVsyxk?=
 =?us-ascii?Q?Ab1uW+WD0Va1D1DGPb04Ne16A0jNmpCCxGtmxREczwxiWEbzAr1VsxBCBeLd?=
 =?us-ascii?Q?W6C7dpQjXDM8sdJcU2WfwOQw1n7/siYW5uZj83FPV1EcB1F+ZstiW3049BQd?=
 =?us-ascii?Q?sgyd4QMm8Fxr6q3Qn9nqr9pwyRrDhq21vNioTBCX3Iz6i5OmCH6MZYsob3v1?=
 =?us-ascii?Q?qZDvGrjeK/RK//vCXa93tQ+g+LUg+NxCClX0sMQPhvugYP4L4MNnM43p2zuF?=
 =?us-ascii?Q?sncoyWxgSpOZS+1hL2zl0CnNdSALLwInYN1WxesLqQpbPx/tLmEmc3Nfz7uo?=
 =?us-ascii?Q?leV5mYM1LXdjNcIZpGq9UL45nhDcgjvN2gSkCRoYWij91T2FslZuEn100K/0?=
 =?us-ascii?Q?rnbikWzH1LguXMB2bbNdRCwOFxmeesYEYNvwPnE5Uc4EompV8nScuQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iSUl5/yKzXvG+XpWNCFLZdR8vnjIPxiofM0ByiiFwJXW7RrjbJ7KTS397YsQ?=
 =?us-ascii?Q?46v5idXTuIMHt6NTUOeNVRlDwKEx9dj40stF5cwODaVaZxZQRSZt037sUdsz?=
 =?us-ascii?Q?EG0V6fgo1+cYTeN7MGQH+PvwWGSFTOczrRy91Q5fzQamK2tqI0i8iu4/VdEA?=
 =?us-ascii?Q?dZsmuGjvaLiaziaX3G+7Wttf0mP7UHymSChAl5U07p+sejgWy8ThO6miZVex?=
 =?us-ascii?Q?z0xsZJITpF4jbE+Tivc88NC13lvPcMZKP7Qm2RzuXAQ49B+5MWwQWoT4JjYK?=
 =?us-ascii?Q?tgIZe40wk3mstvPJi5YrCqeFIancJ07D3D9dNrI+TOvMA4a87kPhHIV5GtHV?=
 =?us-ascii?Q?Ge2kwG3E9xQY53Cc4Qn1pB/x7mcPeUXNFjvs6R67wB3z2hYtM93T2MHA2fJb?=
 =?us-ascii?Q?vb3McZD5Dk3qVZK2TgLlBqOgIdBXM9LRkF+6l7+TAQU4RgqD+ZzGOB8rSykX?=
 =?us-ascii?Q?LFlR8pRclDAECEGIqINy75x1maZEHWTU9tOyjg6xnAEO29QCX3MTRbsyn6BH?=
 =?us-ascii?Q?FXhb7K4eu2RZRrqIFeI8qK2/8fyDsJMgQI/VXmC6lxSzHTFqKuGExTjTkRoV?=
 =?us-ascii?Q?v7m5z6odLX5tOzIM7o8REeZc6VTyJgGUB9qgkru8ciwOP8Iz4KF7hraBGJhe?=
 =?us-ascii?Q?Z7ZSOqBqqyAcTQgid0eaRlq11N6xC2jzR916LUo4FMkeqxhouRKTY9/4fvdS?=
 =?us-ascii?Q?B1pSroA9wHcsJAjyEXjG/Ax28diD+V3SPK/1cqOmq++d6/4XNlk4IWPVidH9?=
 =?us-ascii?Q?2O3MgGBP3MZSapgfPAnet1ELvvUDGchBggvDSYqM9pWVQc9b03vHCJSwGtk8?=
 =?us-ascii?Q?Ssq3TUBlRNTKldH/0NvSyxW1dIv4AgVq/UjpOQ3COeL9aw8tdsk5XiybT2JC?=
 =?us-ascii?Q?svHC2wrjak2PFeQjSvA3cKeA7WTy/M07VXeDcTmLlYa917oXDsnwldckbwfs?=
 =?us-ascii?Q?DxE+k7cQ7pjC0bcAYmT3IMVHSa4npV0nK9EOLYHwPJ6aWgnSYubMAV5P7uDO?=
 =?us-ascii?Q?gfKbkBp0xB605gDLvU7Myok1/YRKO8BHHksA8q9cWGAIZFqD75Ah8HhGGBbO?=
 =?us-ascii?Q?4aoFhxAhD5rYd6AiMIipw1o4J/TeJIoa9GY496pV0i2/5LszF/0Fi6PQDIPX?=
 =?us-ascii?Q?7H9qQs6F763fpdKV5lvqtm4Y6tG3XUir3EDvkQy7LfEDNyIm9Dw3iEwBwVjj?=
 =?us-ascii?Q?Z40rCJxR8iY6AQm1q/BunAfYCUmdG2UAdRpuwAZ3t4eJcTtK12B0pNK1CrCq?=
 =?us-ascii?Q?275x7rTnDI+pp/81e6MpUs+R86q1CCR+qVSVrAJ5oipnGxuOMrU88ljLDQOZ?=
 =?us-ascii?Q?/wtmMvK8JqFbYO9RpxP/7RIewNKQGODfcKkcP1J83YcWx4Mkk/Uoo27VS+he?=
 =?us-ascii?Q?TzMnKKCRPY+tSnFl7/RhAvXs9qVa/JoAPnsOiguOl6aSH/aluFGBUkDGamhc?=
 =?us-ascii?Q?wZbWv2jxzlv091P4hTC3cKsfhxHzCD66XCtfR2gzLPLLJvloy70kio6G0pmO?=
 =?us-ascii?Q?YnY55blAk/n08FjEgNNsFQb2BSGwUxTj9uZtUNLinDYixQV6a3rIhYIuIHnZ?=
 =?us-ascii?Q?0D1LbhKnb46n+Fm7B2o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb0e3fd-eb86-44f4-81d7-08dda737fadf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 09:28:23.0001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+XJFnJHK3VOs73eIDY6wYnwLXXMZC+zJTH8jz07m1IT0v0o+zBgIGL83kxi7w1r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218247

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Dmitry Baryshkov via lists.openembedded.org
> Sent: den 22 maj 2025 19:14
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3 09/11] mesa: sort out PROVIDES for the glvnd=
 case
>=20
> If mesa is built with GLVND enabled, it doesn't provide GL / GL ES / EGL
> libraries directly. Instead it provides two ICD libraries: libEGL_mesa.0
> and libGLX_mesa.so.0. Remove virtual provides from the glvnd case
> (dropping incorrect virtual/libglx provider while we are at it) and
> replace those with runtime providers (to be used by libglvnd in order to
> pull corresponding ICDs).
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/conf/distro/include/default-providers.inc |  3 ++-
>  meta/recipes-graphics/mesa/mesa.inc            | 12 +++++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
> index ee91af87968f..4f094163546c 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -7,8 +7,9 @@ PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xor=
g"
>  PREFERRED_PROVIDER_virtual/libsdl2 ?=3D "libsdl2"
>  PREFERRED_PROVIDER_virtual/libsdl2-native ?=3D "libsdl2-native"
>  PREFERRED_PROVIDER_virtual/egl ?=3D "mesa"
> +PREFERRED_PROVIDER_virtual/libegl-icd ?=3D "mesa"
>  PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
> -PREFERRED_PROVIDER_virtual/libglx ?=3D "mesa"
> +PREFERRED_PROVIDER_virtual/libglx-icd ?=3D "mesa"
>  PREFERRED_PROVIDER_virtual/libgl-native ?=3D "mesa-native"
>  PREFERRED_PROVIDER_virtual/nativesdk-libgl ?=3D "nativesdk-mesa"
>  PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"

What was the point of adding preferred providers for virtual/libegl-icd and=
=20
virtual/libglx-icd? AFAICT, there are no providers for them and no recipes=
=20
that depend on them, neither in OE-Core nor in meta-openembedded.

There _are_ runtime dependencies on libegl-icd and libglx-icd in libglvnd,=
=20
which are provided by mesa. Should they have been virtual-libegl-icd and=20
virtual-libglx-icd instead? Comparing to opencl-icd, I would have expected=
=20
mesa to RPROVIDES virtual-libegl-icd and virtual-libglx-icd, and for=20
default-providers.inc to set PREFERRED_RPROVIDERs for them.

> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> graphics/mesa/mesa.inc
> index 4c61447031e3..ab8c22681fe8 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -37,11 +37,13 @@ do_install:append() {
>=20
>  DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native pyt=
hon3-pyyaml-native"
>  EXTRANATIVEPATH +=3D "chrpath-native"
> -PROVIDES =3D " \
> +GLPROVIDES =3D " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '',=
 d)} \
> -    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '',=
 d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virt=
ual/libgles2 virtual/libgles3', '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} =
\
> +"
> +PROVIDES =3D " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', '', d.getVar('GLPROVI=
DES'), d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d=
)} \
>      virtual/mesa \
>      "
> @@ -275,7 +277,11 @@ python __anonymous() {
>=20
>      d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suffix)=
, "1")
>=20
> -    if 'glvnd' not in pkgconfig:
> +    if 'glvnd' in pkgconfig:
> +        for p in ("libegl", "libglx"):
> +            fullp =3D mlprefix + p + "-mesa" + suffix
> +            d.appendVar("RPROVIDES:" + fullp, '%s-icd' % p)
> +    else:
>          for p in (("egl", "libegl", "libegl1"),
>                    ("opengl", "libgl", "libgl1"),
>                    ("gles", "libgles1", "libglesv1-cm1"),
> --
> 2.39.5

//Peter



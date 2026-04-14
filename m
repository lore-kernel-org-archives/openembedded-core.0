Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DB5ED7B9B
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:27:19 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15681.1776162436272955938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=UAHfd7WM;
 spf=pass (domain: axis.com, ip: 52.101.83.40, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nH7t9RLSsuMGvXPFuE+0igsyHxxPfvO7Vu8K0h25Gz4rv35zu8gcMm8LD7z7FssAO/7Qh/oVAveOtBj37sH/ByhlIPJDgvO/VPnG/0DlDmsmdJV8b2Vy7RFqpmweFLw8aYgGvuw61vb0vavGScg6cftqX/4byzE5xmJgSPiA3c12ZCUtxmrxhh6Ys85riV717fy91SDHMgHDytesuX22NX/HrYWagM+a7te/dDZXkNtjRZOwbkwD0d73mMvs65+igmrtM+lxi4PbYFaGN6mbk25f6P0rPZmX6uWf/KbAbjLcedpDdVG4LGA0ZmsjJAP+hvliLm0qvzplZFt7Du3ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRVe1n04Lp3r6hOlpdiCJHOB4qk7zvxj0oxLWyiS23s=;
 b=aCwp/Be4MC91kCtnnT9B8iUeKCtVzrPjxWTpq3ZjlHesQABqgKnglstXq1AJSKmp0oDF1BlDAaMIGeMf1dkHlgceL3yxpQFTH+ViCRfZ9/Rues84xjHVIfIUCbG/HqsQy+NtVM3Itg0/RRmXKlrWznbKsvJdBXOva0oLH3D3khC5Ge3a+ReZaj7LZpd+8sHO321A8p/qoQo/WnWsBInffseUpUdnWQ7iQJDW4vviSfvgK4hp8r6h1txKH6PPKbbYD+H/rzGd8U2RqZWmNMj/+sYZGh3valo3Zs3n6l+i+0f6KOZPm7IKT1KkGQ+rbNIRZSFIlMj0NTWJMe7XAKcb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRVe1n04Lp3r6hOlpdiCJHOB4qk7zvxj0oxLWyiS23s=;
 b=UAHfd7WMWbNPrO9l0svPj5MGNS/ajGHit1GvCdzaWOAA0xci14Jmo3BUpzpM3RAIOYiQAH9Z0zSmvTElGGiTimi75CfSLfeRObu1YoDBiq0iLkmStrXVN3STzIw5uL85Weu3QM57toKrfKwzOM4amj+bnFxvlULoCImLP6UKoD0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV2PR02MB11836.eurprd02.prod.outlook.com (2603:10a6:150:31e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 10:27:11 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 10:27:11 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V2] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
Thread-Topic: [OE-core] [PATCH V2] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
Thread-Index: AQHcy77YASdeHkYYMkm+RjWptPqfx7XeWqSw
Date: Tue, 14 Apr 2026 10:27:11 +0000
Message-ID: 
 <DB5PR02MB1021391A80E4D9F14D29DEA84EF252@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com>
 <20260414032831.1323996-1-changqing.li@windriver.com>
In-Reply-To: <20260414032831.1323996-1-changqing.li@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV2PR02MB11836:EE_
x-ms-office365-filtering-correlation-id: 44669be3-eb8b-4409-aa9f-08de9a10638b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 k6SiJcD6M1qRdnY411YI9/C9gO6YbKM+oSq725RTdYUHlVgf1QL9T1xUh4pTCoaOI89eM01uXVLA6LV9VbLMKAOZ6oDZaNQrNyC5S+sqy0TpMmWpugQtw0Zv4fFhrh1zrZA/pmGwIixQ6tieiraYBiwR4TOvQWhq9XD8Jj8m8r6ECTeuwG+MhcoDYiJRJf+Iu0k47eT8PlU9s1YsE7SGh0TaDY42kbkON+rXHbN/nbs8xIRBXa3iEicX6PQZrr4girQNScz0uiiePwDG51yytA03rMIBxS8NaXZaRn9eYtMaXMEY5w7jFM8tQV+nKJrAB4fqPxbVa3Hv4YPRx8vUFw/Es/KlXpBofvT7rZ6yB8PvoMW6bBwG6TCjPdCW6hpw9ixlk4vViTf7gVlkU08lIozMMC9cKG/scMXN0gWf86iXyW7iGowNBEjQ5Kaq1ydWVg1XPstbtIshNRgvPU13gXDiilN5ZEEbp4yKUP92EK+kH2V3+m5xElotuZcLQGX1QhbPi96RDtMKhPUn1qdswMfIe/qGqFjqqhRFmYLUIpPMOSk5anG5pU0FhQupwa7qoa+KcTUsWQaSlW/QvSidDGUIKNBRsJAegf2RI/ExdqZGppZEYPn81c4gSU7jAgYYuQwsB0tpVQofrhJIn1FgxDNFdfkCJQeAfTq9tEmm/gIdDqeQISKuy6aMJ3M8TRf8a022DVUqTwtIq8lnNnSAlGhrXH3ATovkl8G51bysAm8PsQzXTq70pz2Bk46Y2cegL7ry24h2oSugwsa0Mz0uVMn7H0GVyCab+GnTDly51wY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OA8F0h2sR4TFHzhGX3grqgG+Wuyb+WBlS4FHuB32uikYGjiTgovaz/Sc9nhX?=
 =?us-ascii?Q?yfM824uudVdEDSCO6jh7ehG0TqNgNQGxJ4TcFJMxgj2UP7wQdo5SOOoCq51G?=
 =?us-ascii?Q?IliDAZkHV1jkWTOpua2HxugNALu0clrAQCM1v/7NquRq9FPvKaA375YnWZeR?=
 =?us-ascii?Q?wxmsiGwNcR1mR90D1zKH9SlJZLGIcAO9eRAtwcJIisfBjFer7Xm7J7uDGNH1?=
 =?us-ascii?Q?UVZNy4g70Lt01uCj7DzFVRTh2dpPnB+ZH1Gp5baeAn+ba2NaQVRt+lsL+WMj?=
 =?us-ascii?Q?a9ny3bLyB2yq/6k4l+Be8bh9V6KBQPzKyZn4D/HNpnvhgZJH0Bklr2eOTFIV?=
 =?us-ascii?Q?6rK9nIzkJnN81k3LS/TNwLio8e0S3IvHw2tm10jg97PmH3TX/qVUAabY0V7p?=
 =?us-ascii?Q?/a5UUa69jo8NKuT+GQXc3Tpq1LXQG6betwJsCO4d319I8nfy+MEHBnG5tQPX?=
 =?us-ascii?Q?DKYqeNOQ7/rSy9V/cVx4ClX1hljfEes2wgfw9+N/DjRq1rJ/azMUqf3lbtrl?=
 =?us-ascii?Q?S40ihyxYogYDuqIGAoyw/t+2YmHavu0/oLFSmWi2wTqGtft0EJQ8lqHO0LuA?=
 =?us-ascii?Q?x84SsS12zEwfGIIQ6sraZ4y3Ine/u2B8imJkpOFe9OlRQgTsRNLW/zdIvIJi?=
 =?us-ascii?Q?TSt+brSajgDNCzzYfmTJwxEFnd5jstjmQquxirEdzLph3nyJRz3BI8wROmTn?=
 =?us-ascii?Q?ajU0frnrrzvhGymXqX/TqbA19nStDffR6ZiDNTEvnEIqLdGlZe71nLOtPM2N?=
 =?us-ascii?Q?T3ZG45aHyWRutY/pQPJTfoAPrRHVWSfU/39myGKnaAsZ4lFn7Tcq4MMOkHvQ?=
 =?us-ascii?Q?GQWwG6c9aE1ahUXlCxkOpQieIqprFfJgnuuX1Q5RDocfx6po++54UuHGmW0O?=
 =?us-ascii?Q?DkcxjB8GQzYaVinS/4kFfZHJ17yvEnRoAB2Iml5OKU6bNsFQCNDQZPt2ZNfZ?=
 =?us-ascii?Q?bAm0qR34JC4nuld1N09tZLC13olsn0jYTZwDOdHonRjIWV4oVdLVzvfKRL8G?=
 =?us-ascii?Q?BjuLeRZgatXSBeXzRKtyzTcxRlc0KsYTQ8VlkQ/VDGNkJp6RhKEG9SfvYMe7?=
 =?us-ascii?Q?RPhlKfNb9QeXM7BxeI22FTv21ZH7pNEesOLp2DkX0paz9azYrs7Ta31eI9Ra?=
 =?us-ascii?Q?NkLGnhGEskCyY9+sfW8cRluuvFh597znOMHCKhYErQNL+TLxp6fesORcpSel?=
 =?us-ascii?Q?IBULqaZ3jJz9xAkjt2rEZ/ObiP2soGjJUiCkdSCIyRJtGvVuhaKT3x4UJ/ze?=
 =?us-ascii?Q?VFbTc+KlC97XiolPp2RwD9GP69c95FzUwkPp6cwYdxwEUgrwEFgoWwML0+eI?=
 =?us-ascii?Q?C0viiaYFqChuCQTixpZ57/ibWZoORfaXLJUfmVsN+m4dfU2Wo69ZHLkACfh0?=
 =?us-ascii?Q?16Moovn+D5tyckuD2f2tyBSxEgRvOq02eOxif57JlEYu/s5ZJis26hmikUyo?=
 =?us-ascii?Q?Re8K+a76TzYGsOBsiQ3JoCtrUQlTNnS033Sz5BdmvcDpeAlkSr/Ya5hX0O1Q?=
 =?us-ascii?Q?j2nh+E6Jbw8MAH33PuGdRTmIAO7zJBrcluoPGxeFCUR17wA2SP0vCKqJDIQs?=
 =?us-ascii?Q?6GhDSs1wCDU2bEgXE5RYn7GILQ3rfQldcz7MpqOxcZuYapjnQE8q5SNwRvuI?=
 =?us-ascii?Q?3JWNcyxoy2NaXKiMu3fqm8Ydk7GPyBkXzISDi5XBPacbSL2TqSo0Q+Wii8OX?=
 =?us-ascii?Q?CljpQTzS241JIO90aSVSyUOkkI0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44669be3-eb8b-4409-aa9f-08de9a10638b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 10:27:11.3204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GndNIr+W5XhaPSmnOLsFD5FWjND7IVcZgGbQLbrK4jK8IL1VQLED5gmIBcQJTekz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11836
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 10:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235150

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Changqing Li via lists.openembedded.org
> Sent: den 14 april 2026 05:29
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH V2] gstreamer1.0-plugins-bad: add ANY_OF_DISTRO=
_FEATURES
>=20
> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
> do_configure will failed with error:
> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Win=
dowing system found. vulkansink will not work
>=20
> when vulkan is enabled in DISTRO_FEATURES, set ANY_OF_DISTRO_FEATURES to
> x11 or wayland to skip building of gstreamer1.0-plugins-bad
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb             | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.=
2.bb
> index cdf3a20dff..61a6d3dd2f 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.b=
b
> @@ -19,7 +19,10 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c"
>=20
>  DEPENDS +=3D "gstreamer1.0-plugins-base"
>=20
> -inherit gobject-introspection
> +inherit gobject-introspection features_check
> +
> +# When vulkan is enabled, at lease one of x11 or wayland is needed

lease -> least

> +ANY_OF_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'vul=
kan', 'x11 wayland', '', d)}"
>=20
>  PACKAGECONFIG ??=3D " \
>      ${GSTREAMER_ORC} \
> --
> 2.34.1

//Peter



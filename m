Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0CAC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 15:11:55 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.333.1787238706778952121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 08:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=T2FOvtMh;
 spf=pass (domain: axis.com, ip: 40.107.162.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msYUmk+K0Ng7bMzgnB2nOXiQ1ZtHyhwC317DuAes0COAv9pV+l6zdDvjXZBSTZUu877ShJ8ERcWgOdJSSuS7SH+ml9oVW7n3UuFx4G6lvuhC1SICnRUedhrM6xxzJFqOhroXbZUypU8bHwy0J7ZWK2MyTR3JPjsSjHpUP+P7ktJpbOtDeSBJpt7n7MaoxvirIebJEvCpsVBDJvyEWeosklkTOcS1IiMTNV7CeNDCZBJOIkmgf4oVMf6r0KMd0k43BcVrxIbNgcswuvTlfbjnwWAQjBSYw+Uob8d8OsiEyB5x7FysgDYrjN0HMhjqWUcZr7eux80a1Rfvpv/xEeJM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wT0FNjcDaHBJ8PJ2P0ZHtaqHI0/fzv0/lePvB0z3flQ=;
 b=MM8fisKS+0P1auR9uVUG2px1flA//qsjdXnapTYCl20hocL2WcquG7cGQ8KlH9WxJakwju5S54LooH4rY28QmfOTxhOvuJXHdWmiUSRTOVH8UNkylqvJ70r6XXk5x53WjRn+8ZyEf7M4VImQf0vxr/wFndcbw1BrF+X+9Hfe/gWGQUCBhzmYQeCwesdV9cdWWkhWraNczsFJomje5PQvvN8u5j8sJZDqmr0CMlZHrCjbVRe77dJ64+Et/cTYyHuqVF3BOCHoXA6GTOrRwoyZEl9xn4OxoQ/ycdzZfXMCW4qqmXpAAMowqiKSH3en7yYnHBrpJDIY2ApI77RGDuWBdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT0FNjcDaHBJ8PJ2P0ZHtaqHI0/fzv0/lePvB0z3flQ=;
 b=T2FOvtMhTI1qTPtar1MW8HURsieIqToYf+w7EEz5MAIwxFCtEB1uzJg/huD89qjWtDciw/pN1HSxMklHpsME+OejF4rAsjJJCt+oxkHul5TM05kxYeUnsu4zj7SZX+VdAt7vYCGAxWBgouo6mmE97sCzQnw6X0qE2LP+jK7ksOA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DUYPR02MB12519.eurprd02.prod.outlook.com (2603:10a6:10:65e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:11:42 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 15:11:42 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/2] libjpeg-turbo: use system zlib instead of
 bundled copy
Thread-Topic: [OE-core] [PATCH 2/2] libjpeg-turbo: use system zlib instead of
 bundled copy
Thread-Index: AQHdJChMizFwHDfK+0OH+FJpe8xZ87anIfYg
Date: Thu, 20 Aug 2026 15:11:42 +0000
Message-ID: 
 <DB5PR02MB1021341229922FE37EE715F01EFA42@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260804154451.2506951-1-ross.burton@arm.com>
 <20260804154451.2506951-2-ross.burton@arm.com>
In-Reply-To: <20260804154451.2506951-2-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DUYPR02MB12519:EE_
x-ms-office365-filtering-correlation-id: 35e1b3b8-af4a-40cc-3a98-08defecd57c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|18002099003|22082099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: 
 lrVyrLOmWg9QkYV6QQbYKNQzKMEfVKCEQeYmmUUFeTQ3ANTJP6bhXzGSIGAi9QhqD818OeCboSsHPWEkYZa3Nhn+oOcgvbFNBtDvd2qrEj9wKB/0HGGTFA4xkMmtZnNlqKZyM8a04EOoPLDkybaYGirZW5vRa14iIuOMgRN0qnOI7cYnI2Ieqad1echcBWg12SBNYsj0iSVc/Jz2D3t9whxUMySm3kHxu7FdotB7GnAoRhq6ENoadnv/Uir/IJ0UL07JTqHXX1LyDWv+jisNsKifDLUJIwSI/TOAveXF44a/G+IoA7flZo0Et3nP0VuuJ0F12xesLG8H/Zis1S3xVsVJi+wHtcHhSrpA9e6SLPAkCDhjCht7k5Un/VDgKKENCRWDjO6yBD3OAPscF9kRrgAcJRyIkX7mNYPtNX6ZoOHFxBwfasX/nfu0+LQcmJiSTVQoFTs1rIn1DMfgC7w7qJTvqaT2n6uIzEEIyluE/AFNJ8/vRX6D59OY7nzJ1LVN4jsqKKt2NqW2Vn9XLmMMbum6ojiqCCrhINsYOufzeV1oSwdutn2V9ymoTuCXPmP0sIUY2YsqVJTHkMAGkDWBB2OWysAlGvoPBMzWvX3De8gg9nqp3PtLzKRxxGUxGzSO/MfdJG5ykIu1Sie9barCYykcBN72Q8O7yQzqY6Y5CeM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+Fhk0cn9AQx9mp3Jb+xtn9FB4pvi6gD5j88Lsb48c+4nr9tyEav5ILJ6xM4R?=
 =?us-ascii?Q?NBVLeTevGOD2JmDwShYUvhm6BMDMqenVsYGbjmE9P2M9N985C4vuyuvHfa5e?=
 =?us-ascii?Q?lfMXBstxq4qu6gyJ5pxMRmphMCRT8bYUo8bs4ZX/nTAcQ0/hHNDbUenRV3so?=
 =?us-ascii?Q?7KJOehB/o3YIJ0EUjMG/G2qSVFvcpGZeGMSvObPWX4LGBOLZLcHkTiE/iGMs?=
 =?us-ascii?Q?yZFc3Bk0fCoxuzBkvI/AqjrOxGdkcT5b+Db7k6bvO5FMzzTRRkq10BR8vNpo?=
 =?us-ascii?Q?p/Mi3zLn3FoSjaPlDG11fRX7mOvzF7wFJy+pdj1wIs65W5GW7ancyOEd2uwj?=
 =?us-ascii?Q?/A7DxsNwQYAEfeumvZnY+rGZ3wFlJiPrXnnAwNBD7R/2Fdklfod0XkImIK3z?=
 =?us-ascii?Q?tnlVgPJ6yScBN226X44FrB6KrXo54U/nY1tdkR98TTGPns+y91UvZub4NF5W?=
 =?us-ascii?Q?k/IYyA5SCduHx001QnU7RNGaEfk4lTBm/edb0j8jkBL7zNoOL6s5ng3wuFDL?=
 =?us-ascii?Q?jezehVsiRfdOsHsgIu09l2pLiPUhOlvqL7aKHdvZm7p1/zD499ygTVM8XJiK?=
 =?us-ascii?Q?Z53TBlKbNxhXxZBmc1lQVcpJcPyH3Hvh+0P0eAUeHZk7j/n2+S6WjtIdRMtl?=
 =?us-ascii?Q?fUvTwPHyEHbkmym4e5a2zSkedwPZd4pNPbLcoc0HBbxLVEVEriibkCbcZpRT?=
 =?us-ascii?Q?AN75kNECBju0rSpewI0XRdltt28reg95RHrXTKVDJD7UomnmIAm+T4N8uKqg?=
 =?us-ascii?Q?ELNQbAIopGKUxQIMlD3UwIHoDzalEN/lxPstu3fmm8QLIqZNtvVHTQZ+y5Xo?=
 =?us-ascii?Q?UY0EeKP7DoIsuW6if83xOJ4V3b/dOjzS0sNGgFVZFdID+oySZ8ohQUNzBeOn?=
 =?us-ascii?Q?ixz3gEcMKm+yePPAh7YQIuYXjnXQUzzKZYmNlVOLav0KiLZNn/EIIYpqnUwQ?=
 =?us-ascii?Q?YHujWNMgfurCZ1+a3XlRwLGzaFN/pbet/OLfwfDwbBNkW1KDbIMxyWjfnVm8?=
 =?us-ascii?Q?Ei5UQWcbedIK8sB4l4BzAfNFOKpyvTS+rCgk33VKyOoeujdTKTXZGanAIvD9?=
 =?us-ascii?Q?K0vD0ChU28GF5LrTDJmCmydnj8Mf29UgOqrAzbIEuzNuGmxiHT0exm4rf4DJ?=
 =?us-ascii?Q?aUoDUE8dvlrYk6mU5LaeE/aKZ0H3dUw673/YxJmYiRolVkzQt7gpeuwFUlQj?=
 =?us-ascii?Q?FWHcA7tnL1tGJ55T/NnSX98esW2GmvQ+aMaDM8rge80SNPgR67aEveXRsCdh?=
 =?us-ascii?Q?0QK+jiGho/mEqRTwSEwo4urq0Sq6qKzKNvqOkA1djv4cGDeIYRcrDF81XDAv?=
 =?us-ascii?Q?xEEKEc8QKqAz6dzZDja5oK3QQyv+C3sypFKdmiftst7u05f7wRHGimld/CIl?=
 =?us-ascii?Q?Z+Ut1F9cfffUm2+4Y6HNtf2qX4MmIpw7f67wi/G2XDVfdIFn+OgCXirT8A8J?=
 =?us-ascii?Q?2NlLEdJQ1VxogG083f/MPoU5BNrUfnZ6U6vZWegzRdZHVpEn1ko+dfblaBTn?=
 =?us-ascii?Q?rKKoXZWp2u8q3nAFJNv6BFzQUIoEU5FiMzdVqinWkKvVBixB7Z70c7+FpSUd?=
 =?us-ascii?Q?8lEwYGJZ70J27flpcAx04kFKHogzxakiLczuhS8pvuqjEprHQtZj3RxNoZEd?=
 =?us-ascii?Q?aSEU4Jvl6U+aOycH2tvogNwplnFwA4ULnLRJrwk0YVXZcHpXAHj19wjEW3Yl?=
 =?us-ascii?Q?y8Vary5fZHeKVcAYMI7Mnara318=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e1b3b8-af4a-40cc-3a98-08defecd57c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 15:11:42.7153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cU5a8LR1wNm7gul+Rl4JV1BP97GKMkP4yeBiuJXk8MSsTzThnUJ1wzpQJD06zuo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR02MB12519
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 15:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243870

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton via lists.openembedded.org
> Sent: den 4 augusti 2026 17:45
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/2] libjpeg-turbo: use system zlib instead of =
bundled copy
>=20
> The libjpegturbo library bundles a copy of libspng which in turn bundles
> a copy of zlib.  We don't currently have a libspng recipe but we can
> stop it bundling zlib.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
> index 89504419762..7a548d4e9c6 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
> @@ -5,6 +5,7 @@ HOMEPAGE =3D "http://libjpeg-turbo.org/"
>  LICENSE =3D "BSD-3-Clause AND IJG AND Zlib"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dd21daef3b4b318f77062055059=
c72934"
>=20
> +DEPENDS =3D "zlib"
>  DEPENDS:append:x86-64:class-target =3D " nasm-native"
>  DEPENDS:append:x86:class-target =3D " nasm-native"
>=20
> @@ -28,6 +29,8 @@ export NASMENV =3D "--reproducible --debug-prefix-map=
=3D${WORKDIR}=3D${TARGET_DBGSRC_D
>  EXTRA_OECMAKE +=3D "-DCMAKE_SKIP_INSTALL_RPATH=3DON"
>  # Ensure the -fPIC options are used to avoid -native compile failures, e=
.g. on opensuse160
>  EXTRA_OECMAKE +=3D "-DCMAKE_POSITION_INDEPENDENT_CODE=3DON"
> +# Use system zlib instead of the bundled copy
> +EXTRA_OECMAKE +=3D "-DWITH_SYSTEM_ZLIB=3DON"
>=20
>  # Add nasm-native dependency consistently for all build arches is hard
>  EXTRA_OECMAKE:append:class-native =3D " -DWITH_SIMD=3DFalse"
> --
> 2.43.0

After the above change, one of our applications that uses libjpeg-turbo=20
fails to build. It fails with:

| CMake Error at .../recipe-sysroot/usr/lib/cmake/libjpeg-turbo/libjpeg-tur=
boTargets.cmake:77 (set_target_properties):
|   The link interface of target "libjpeg-turbo::turbojpeg" contains:
|
|     ZLIB::ZLIB
|
|   but the target was not found.  Possible reasons include:
|
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
|
| Call Stack (most recent call first):
|   .../recipe-sysroot/usr/lib/cmake/libjpeg-turbo/libjpeg-turboConfig.cmak=
e:37 (include)
|   code/CMakeLists.txt:20 (find_package)

I can solve it by adding find_package(ZLIB REQUIRED) to the=20
code/CMakeLists.txt file, but is that really expected? I would have=20
assumed that whatever CMake files libjpeg-turbo installs should take=20
care of that automatically.

//Peter



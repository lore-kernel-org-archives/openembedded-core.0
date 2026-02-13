Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2B0EF99C4
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 18:24:04 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78713.1771007039852036785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 10:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=A/R7M9pe;
 spf=pass (domain: axis.com, ip: 52.101.66.8, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLV0pOuR8RVAt1wTfLZ0/c87qUdMbbHQAO/Y5ZrQDt6bhbjFTpww8ndKdrAieB/xEMePgDhlxlaD9PjCFg4o3O2ZRoGY5vR757o4vhPXNjqsNr9EapljPzwyLcjV3JOu6r+UlzNnkabZruLtqnjaNBxx0PCIFNLf+Neh8mHC5P85XED+/05RC7JriARr0rFKEDrWNu0aVGLZ7/jTGy6mrqUT6L3gLTlZNdFO0aYkliBwbP0ZooMwxhOkwsmQokUMLNGzfqYqdnZVwfrQwL05uywEeIforXYogqmPOEekGeb95SJIW5b8VYMA8/gLHX+K3WtV+lHm4GAK1tOx285DVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIuf/Du54XF0jbqlsaznlTNeTVMPb8D/FjhWTvtdBtg=;
 b=DTtCk6B5cWSSxpunPgo88MrXmSlyU9cjmJhiwU+ucyANtGG0QSL4TufbqSBo+oe6eXAHnmRw0OPyu7XvddxWSrQ8nNPLVbG8f5cGWkPA8FSD7qnOXmtnojDviy6K0Oq9O/uw+3TpgSNbsUUc5P02PoTA8tPUcJUleh2BGnV6TYq8QTC8AC4FLL4kIzOPf1vttPt3ECkllnB41zb0Ss2/PNbWHQ0bhRhCYoNzHV1APjzcrRbQDd0U5404WopFEhUBRSu2Gngjb7CpWTUeCajKSHArXU+TiH51EuUCm9mQvzgBhd0bOVQuSrxftKyhb6l7gZ/L99hzEuUKt//jhWlBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIuf/Du54XF0jbqlsaznlTNeTVMPb8D/FjhWTvtdBtg=;
 b=A/R7M9pe8a6Q7OWnlMJy5we9PXsepPy5pHxuG0wIxzCJttdO3hMefPqzxtWPSzYEn+rw0HmRbwDGzS84jSC9y4fqh9QTyGNAF7AKl2djlQRys1CSGBd1qkIoYnZ/4v7yBb75atnFcrKUnwQbXpDhov1HWohvjobRqC1I6fkmNLc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV2PR02MB11754.eurprd02.prod.outlook.com (2603:10a6:150:2d2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 18:23:54 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 18:23:54 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "colinmca242@gmail.com" <colinmca242@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/3] openssl: Add legacy packageconfig option
Thread-Topic: [OE-core] [PATCH 2/3] openssl: Add legacy packageconfig option
Thread-Index: AQHcm4eQ21AGGc+PwEmeZqQSILeZ77WA8rhA
Date: Fri, 13 Feb 2026 18:23:54 +0000
Message-ID: 
 <DB5PR02MB102138F00B4422374048DFDACEF61A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260211184917.1045939-1-colinmca242@gmail.com>
 <20260211184917.1045939-3-colinmca242@gmail.com>
In-Reply-To: <20260211184917.1045939-3-colinmca242@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV2PR02MB11754:EE_
x-ms-office365-filtering-correlation-id: f2844109-a8e9-4cfe-d990-08de6b2d0ba7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?NQewGJEjomELEZ9Uh9BFjVLmXO8LkkYy8L6pBLubd3kipZ59K/vs2s1Kunf1?=
 =?us-ascii?Q?5VurPVQ5bWwvJjZlZn3x4zvO+qus2wl6SL2N2OAhYhXCr4eoNbcv+myuxst4?=
 =?us-ascii?Q?BY5XODceTzDKHVKJ18Vcy0ijvVWnbcNwKsmiZv8ELGE3AYfK6jRpoUxIF5ZO?=
 =?us-ascii?Q?fkbA/OnhWgFyNVR/nWpGvzR9NcBySn431xL7WE6k9R/jvQHZXjRN00wfVG7r?=
 =?us-ascii?Q?3YzJdEAG4d20cVahL+e3n7xvyAC8FQh5p35A+V1dFbn8dN7r4w0RcXQp1R6K?=
 =?us-ascii?Q?karOeDo82gqKnu4mzBWRk+QQDOdm7G8DmHBZ3D2neRbxvD4RHNxFZ3egxIcv?=
 =?us-ascii?Q?meF/ntkY0bxryF+XeitQW5DKC1QPc+K4ujSNvURGXRzqA+UNtBuViumNKYJe?=
 =?us-ascii?Q?rcW2ucWvFWkx0yvwZbv3GsCPiQFQD5B72k+0pCJiWMREE9nKK9VUHf9aIkXX?=
 =?us-ascii?Q?bsoWpsvq14ilLAkrEfaVTnPdGoqf0pM+Xr3NRWq0RZkpejISJayiVz/rYSPO?=
 =?us-ascii?Q?eNYJ3WMZ5a5+GXP6g0ZZ10gLYFKzXfHef1pWEISqokWyqlmNqc366Xst5c8L?=
 =?us-ascii?Q?krLycpBHDnXgKJqtL7DqMjG0hchk9Qx4XsmjhSuc+GhpSsVzuuoHLP619+4P?=
 =?us-ascii?Q?PnEwobVNta4X0MIrlgXlhII9kxnZjfAilBZHDYax1/Lu1X6Wb9yWrfx4ivbG?=
 =?us-ascii?Q?5lk8ribab/DqYe89uNXMlxMysrsFhocHa8fLNhICe49IXL/EHBVhoTnNgJDi?=
 =?us-ascii?Q?+7PJoYp6lYl2iTFCchuMnR7RgEFKpyU8C30nGVAXNKtn8s55pOu2s09+Mgny?=
 =?us-ascii?Q?rsvOmNxmSk/jN1Lp0DQKluQU9ji0QJQcgBwXLAvbHfyHkU8C6kPLYcttF+Lt?=
 =?us-ascii?Q?mvJ5E4IRNaxXg3DEFwFwGQ+XsYok6uHosdkiIHavyOkWYIT5hpWOOHbit9M2?=
 =?us-ascii?Q?t5R1EVKJc5P1eXBuSe/i9I0zXxD1mGcdVG1DeD7TM2Sske61daZFcD2t8Q/2?=
 =?us-ascii?Q?c2wGq4SyQ/acBpptBBjYptiq130BZ8WyrYs+4dEKGjYF+i7CVUwRJAZCn/f7?=
 =?us-ascii?Q?cX/ZCUAOZNSO661Aft0k363z638mI3nepVbHWtk8rl35diB473BLwiHPj1PX?=
 =?us-ascii?Q?CoRYQWXU7uvj/i22yWvoqnndjpeKk/fLZeZdvhbHlSOy3bQYA3PhgdfT7Rwe?=
 =?us-ascii?Q?OXemh8/6hNIxCxdzBd4BJLo4IhU0HS0KzLUOBvZM0+Qu6mDpWE0oDhXTtibs?=
 =?us-ascii?Q?mkcDxYAirih+5ieOMtlWgZ+WBMoQlOfaNxEcVP0VAxyRXZIFlKbIyn/m7q8H?=
 =?us-ascii?Q?UBFwJXJxI6ikH0vow1gpTvzDdLmBGf6hLA4WWFZVgXgSC5Xyuz0uLCuJoE0Q?=
 =?us-ascii?Q?buT2H2beLfhkQ0aRDfskuwWsQt17PZwi3rH4eNcVe4j/5nT7e/WUi8xXXm9y?=
 =?us-ascii?Q?jkSWcUMWdUCSe+l7UYj+n9pWO5lgXS45a+pH7l9pBfMpra86ICbem8llAiED?=
 =?us-ascii?Q?17tacTcINTclAfb+bqMgEuDCa7vqDaMNUTNTwBdRCIlHKRFdZh7CJXywxeLF?=
 =?us-ascii?Q?yR715K12HL++b+8jnakWwAuiSrhoK5SFVvVNxlHKbJ2f9lsU/vp4G+cP3NBX?=
 =?us-ascii?Q?MQKXB/QKFu0CPVH9VhM6IJ0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SNpdnqFeaiPAyP9MUmYwWqzWuEwz0P89oiGskZSYh64s5IftVFicwMs9DIau?=
 =?us-ascii?Q?DZ3N9YnDJtRcvP2QE7ggcKQL912hwsQVQ4TghM4mKR+VF2w5daMynlQdtmQ0?=
 =?us-ascii?Q?63+9crCEciWt47gWMEKt8ViAiz/ZPcNPHeKD/w2Hw69p2kmxU3fSY2uWU7nM?=
 =?us-ascii?Q?YZ23w5ezPjvfu9E7IPHutwjXfIIAxJpsxnw5O13Sb0FivESe8Yx+TyvhTXT2?=
 =?us-ascii?Q?AcPMfncyH+mm3KBIgdnY5n6nEwEvwmEJ+nAccGJselixoKZBO/4Qvi9N9M6j?=
 =?us-ascii?Q?SWHr7v4eOYhbhX32TP5dafmVLMe4E6LrNhEjDQlMiweSjFXLYcRJWMzmdlA9?=
 =?us-ascii?Q?EROzEqmeBxZomcI3FNxDrhaZ/MZpqG0NYp/OJSCeIzjOK7nJyw9dApyVNIaJ?=
 =?us-ascii?Q?YXyc2VFAaRjse+TkmpsQ58P3U6qS+w0/9B1YRmlv4DU9ugk1LcO0Zo0Ku8gr?=
 =?us-ascii?Q?+hoR8FLCbGuHXVwWkmsOSvgPILWhlYvxEaZ+W74fck+CMQUwt9SqVBfr5ofd?=
 =?us-ascii?Q?m6LiTUQIEmQsdnaTNI9F3Ws/735oaeSUAnbImbK+bZhNFqaOU/wBeh6uz4K0?=
 =?us-ascii?Q?K4PpxdlFtuPbWN8WW1EwjdQ0+ILHIdsPOwIHYevcGL63K8nVWXnyIGp73dbr?=
 =?us-ascii?Q?jfgXak+n9fuf4mePyVx35N8g6HPbGm/qAqCH19Voh9jScOlC4shjaGJh+v04?=
 =?us-ascii?Q?eHQk7j5Uyk4rbQ2OtV/R9WJZqWIliiiXnV5Kp/5YZd5Z1apuK1YLOwtsoouh?=
 =?us-ascii?Q?cKZZjeA6IvBJ85ajnZQXdDMmO3JjpogtP6W2ljbdGdku8g1cUCrfkshi1nAb?=
 =?us-ascii?Q?ed7P1bIT2IOXSwRrN2gu/u/o9jAidMgpum4nrkzv3QB8djxBCgt6G1jCT0gV?=
 =?us-ascii?Q?RGBVvEhOYNISN0a9EhSXyNybpUq3WUFR4cHpIEU+pykiv5uRk6uNPXXH7QZm?=
 =?us-ascii?Q?ZmMQjsPm6xGiwm9RThVfEwEXDhPeBKs8mLL2yZXcRdn3HEeLuzEq+szAZONj?=
 =?us-ascii?Q?8n1GbzWPptfF5bztMARV91NzHJTOyH3V6DHIZpqV/Wl+wV44xNggV1eZEFm9?=
 =?us-ascii?Q?171TR8jTk0Ejf8PxAigaHtOhsBppD0/Z3LeGtUyJ8fHVutKMaLo1uslkdzGr?=
 =?us-ascii?Q?L+mkp9CtzSr9JIgP1bO2pKZfMJwr3znD91fIuhx6S2x7MeaAUoZ0MFKflfCR?=
 =?us-ascii?Q?JU7EMbZdNj/XSK0RF+HYrbgcMGX/Ju2T5QytC0WUjJKGEPwRPOnd0EcvUNzQ?=
 =?us-ascii?Q?zAafMaz4CK4VJEpaTGlEJ63ir7fPrzcM7XJJ9CoE9aLH2SHUrCBy1a+zq2SH?=
 =?us-ascii?Q?clUysD1UP2lnjmynt0rMm8LAa6e4Uhgscb8xYGFJ+3nKnKuae6rCn5wnhq2W?=
 =?us-ascii?Q?zSCmgTU10h9P3a2Q8eyVNKYE/SNNGQ0W8QSjQYc+QUfDB9rIl3Mb3ENLS0nK?=
 =?us-ascii?Q?uKbGRxcG7LFfDgIgXNSyWAmzTjrm7g0ao7/96ekDauDpyOwszkBgm+5uqbPA?=
 =?us-ascii?Q?5rFGaKEW0cCm35I4nIl2om58Pqwgt4cfXG2d2DJggvbdCosB5MBl7xD+12su?=
 =?us-ascii?Q?YjRiXlHapIT7NzT0axB3ORTR7kWCKrYqmLjcXw0WeB1DEo6GvmGsL6T8fhWP?=
 =?us-ascii?Q?CjdyUsvWum+P4SkZD0NtGP/5wzkNZ8k9z4kdV7ZS+BMjEtt38Fd/DI/w6rzB?=
 =?us-ascii?Q?CUSE5+3iqlzjXCNNFBCOirPMOdo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2844109-a8e9-4cfe-d990-08de6b2d0ba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 18:23:54.6251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IA1dHj1U3BxGILmbjMFotsJldyPQFsm+UAvhBY67p52LMr99wEsAJLtYajY1+6Lw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11754
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 18:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231136

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Colin McAllister via lists.openembedded.org
> Sent: den 11 februari 2026 19:49
> To: openembedded-core@lists.openembedded.org
> Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
> Subject: [OE-core] [PATCH 2/3] openssl: Add legacy packageconfig option
>=20
> Add packageconfig option to enable legacy support (disabled by default).
> The legacy module includes deprecated and unmaintained OpenSSL
> components. The openssl-ossl-module-legacy package that includes the
> module is now conditional on the packageconfig option being enabled.
> Packages that depend on this package are also now conditional on the
> packageconfig option.
>=20
> Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> index 6b9ccef0b5..c9d74002a7 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> @@ -29,6 +29,7 @@ PACKAGECONFIG:class-native =3D ""
>  PACKAGECONFIG:class-nativesdk =3D ""
>=20
>  PACKAGECONFIG[cryptodev-linux] =3D "enable-devcryptoeng,disable-devcrypt=
oeng,cryptodev-linux,,cryptodev-module"
> +PACKAGECONFIG[legacy] =3D ",no-legacy"
>  PACKAGECONFIG[tls1] =3D ",no-tls1"
>  PACKAGECONFIG[tls1_1] =3D ",no-tls1_1"
>  PACKAGECONFIG[manpages] =3D ""
> @@ -257,7 +258,8 @@ pkg_postinst_ontarget:${PN}-ossl-module-fips () {
>  # file to be installed for both the openssl-bin package and the libcrypt=
o
>  # package since the openssl-bin package depends on the libcrypto package=
.
>=20
> -PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${=
PN}-ossl-module-legacy ${PN}-ossl-module-fips"
> +PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${=
PN}-ossl-module-fips"
> +PACKAGES =3D+ "${@bb.utils.contains("PAKCAGECONFIG", "legacy", "${PN}-os=
sl-module-legacy", "", d)}"

There should be no reason to conditionally add the=20
${PN}-ossl-module-legacy package here. If the legacy PACKAGECONFIG=20
is not enabled, then I assume that no files that go in this package=20
are created and thus the package will not be created even if it is=20
listed in PACKAGES.

>=20
>  FILES:libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
>  FILES:libssl =3D "${libdir}/libssl${SOLIBS}"
> @@ -275,9 +277,11 @@ FILES:${PN}:append:class-nativesdk =3D "
> ${SDKPATHNATIVE}/environment-setup.d/open
>=20
>  CONFFILES:openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf"
>=20
> -RRECOMMENDS:libcrypto +=3D "openssl-conf ${PN}-ossl-module-legacy"
> +RRECOMMENDS:libcrypto +=3D "openssl-conf"
> +RRECOMMENDS:libcrypto +=3D "${@bb.utils.contains("PAKCAGECONFIG", "legac=
y", "${PN}-ossl-module-legacy", "", d)}"

Since this is a recommendation, there is no reason to make it=20
conditional as long as the package is listed in PACKAGES. If there=20
are no files in the package and it thus is not created, then the=20
recommendation will just be ignored.

>  RDEPENDS:${PN}-misc =3D "perl"
> -RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed openss=
l-engines openssl-ossl-module-legacy"
> +RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed openss=
l-engines"
> +RDEPENDS:${PN}-ptest +=3D "${@bb.utils.contains("PAKCAGECONFIG", "legacy=
", "${PN}-ossl-module-legacy", "", d)}"

Turn this into a recommendation instead and then there=20
is no longer any need for it to be conditionally added.

>=20
>  RDEPENDS:${PN}-bin +=3D "openssl-conf"
>=20
> --
> 2.53.0

//Peter



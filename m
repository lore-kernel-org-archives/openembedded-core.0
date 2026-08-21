Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2492AC5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 07:58:55 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11850.1787558329093332254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 00:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Lpb/DyRB;
 spf=pass (domain: cherry.de, ip: 52.101.72.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShUN61RbenOCxRB+8MY1ZB729ZLgffoQk8sJZPGFk0AZwTkwFgl45UbnU7VOvaFDArjC+NSJBrUWoschTEPxohUm0HvFa/tO018Mmt++RMRBiNGyHYrau3CcWPdkMPizCedXmbjvNDL+Y6I0N+6HC0tNpCtFLTrHHInZDpswN6/73x1R6Vq8rRqLWsuPGlYORHDxmV5dSCwDilBvdoGJZ9zrucml086F/iFAR+G7sSfz0n6a/1hLxd8ziRPXw7LjBpYG9FwByj2TEdiPT5ZvZ5oMxZqlRVkQPsrewfaVS+ZaLOgyCKcjnpyggleQmmhRQdzG5Ho5BgWdxQcVLlTjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPGmZGEb8TUrCthMSvVAfLmOGVPImiFWDPwB8b+r3Nc=;
 b=Pd2GpbAO5Pbx85WmmIKTs3bYa19fDRG9n4sbg8dmxGnl22mEre8JXW+chBTyYa2ziaxxJEhcOCHCPQcZtzPfFFDWQ+I82HL4+nl9rcSDDI/F1R8VfwtyZTuYIdM7DnsilYD4kvCefvwC1pJZfya1zKkAygWxFoHBnXMMfzmU/rxFTtCvb9+xTJQJfWyTt3piThI1Kn0VsmpWhpTkzOhS7mxNRyU7INlgUKM+Nx5VrPZBngwY9bxpJgFi3oGDZt36shF/0VG+xLw2f3HM0uaVlDeFuZFWn5t+xTrGcbrSAUzVBi4iWpSXbboiFyyDPRBoS+XmriCjldsK32uXiI/gAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPGmZGEb8TUrCthMSvVAfLmOGVPImiFWDPwB8b+r3Nc=;
 b=Lpb/DyRBPb+wdSq1ESTV1kdKA9sHTv4hbrjg0GzQ/Ji5HSh44WrpJQrmGmaG5hbUTqx4NqiKhlNg0xPFcFCE3BlMYNR0UaRlUaQWQnXimNYGsR/7R7idmS+PpNSRmUmV8N5NZSqNqmmQH4S0EORcRqrYyej/VVoxJeWZoLM8Too=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 07:58:41 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 07:58:41 +0000
Message-ID: <45dbe3e7-2ae2-44bd-b39f-014ab79fc001@cherry.de>
Date: Fri, 21 Aug 2026 20:05:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] mesa-libclc: New recipe for forking libclc for
 Rusticl purposes in Mesa
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>,
 openembedded-core@lists.openembedded.org
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jose Quaresma <jose.quaresma@oss.qualcomm.com>
References: <20260807054448.1301957-1-zboszor@gmail.com>
 <20260807054448.1301957-2-zboszor@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260807054448.1301957-2-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI4PEPF0000015B.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::87a) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fcd9f96-b476-45ba-dc1b-08df01b582d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|3023799007|4133799003;
X-Microsoft-Antispam-Message-Info: 
	R6/W8HaVmPPaRa4GlQ1WD9MN1SkQ3ZI8RlNKskoCsxMmwJTGWKAvbLnXzCATBWC32vMvISkXDktsWWdnBLVPZx76vjbYoqA2C1oxSlnmoqv9daV1DrtrvyilEubEuunRadxI8p5KDUkFLM1mfc8AjncbQWfYo02N5QcG6P3TPMQ5/fR+bjODDAzDPgZqkKOjjE0PjJUwlnQgo1RFiaWAWPoRylboTywS4CeroJc6Z6BAhB5l2x7l14d4GGWRxUfO8wXfwYd1Cy6YFODbyi6Hf9qlPZDEVH/W1v5LjXQ3lCu5GSnsoPW6bikPBEwMzjXBTKMSIwHwJrCCwxzdtV8HxOSAUkDluTR6qucCeZsLcAPI91jOS2v1TqQxF3vOO+a6ImlUglwTVPaeRWwH67uTxs5yFX4V6PT7XdIuFDElqGOV8Cr00Fdf7KeNve7LIlIx7APrCC3bxhUC7dKbkiPATiOiesnRH1upMm9Zwl9IUZhR+XOBaE6tsdP0JWgVbP4lhCnFdGrfmbEGwIH4QEl8Z747zUeHa3Wz1a0pR6dwF6BF+vEgCA4U2hIYIPh3iWxxRVt3+AQB9XRD/xLw5K2ldFkqbfaY4+w1L9C9aptqv4A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(3023799007)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DJhCXVwAWcfK8AXukqpmbRTjSDGd0bdMGnyzIIy41XkqbBXqsW5trQBu1ScN?=
 =?us-ascii?Q?kLw7bnOCH2hizRXxqYCyUoz2Ya4kGtRCwDqklfiC6ERJXZrSzi4m1IEYqUGS?=
 =?us-ascii?Q?Zwhky/IjugxobGm4OMKEalz9B7RKy5ZGTe0m+pcOkf6Vrwkwoq2hshsavGlw?=
 =?us-ascii?Q?szo6HnYmqlQpFuMhXR3GEQMjMo5ycYMt0KAJ1+Yh/kzDtMiAWcRBYHOcwiWf?=
 =?us-ascii?Q?AvGY8JihWzcMv8mH/ThpqOPvZ4RE4X6UJG61Tqfl1Si427VHfZN1mw0pRlQP?=
 =?us-ascii?Q?jfIa2WTZ6ZA/bY/zto2daf9Iyp5sxPPlkPh9wfuG5Tep30L0AnWzECy52YCM?=
 =?us-ascii?Q?a9DjSNAZQAy92TTGmMlgC6/VXwxrkF4EQislvXPq/yB8/9rsRK76tttBAQHx?=
 =?us-ascii?Q?MVrJzGwX3vQ39eJsFeC0ZppyL9Js2jg+nR7l5QdVfvElmPA0JW7ui3gFzfVb?=
 =?us-ascii?Q?025TVMvX+DDQYHv4YtLywXK4F55Jq1HooPrAqHQut936MWSV0MlwLJjxqGQ5?=
 =?us-ascii?Q?uHWTf0Z/ek6GnNzoxU0owtQmU4NQZGkDi8N6N/aIaGZet5EzOg5AFM9HOYjo?=
 =?us-ascii?Q?6YpvtkX4/J3f/bPW1Xj6APArIsCe8+FeUMxWmtmHazmuIJhT1WmGPsNqUMzH?=
 =?us-ascii?Q?EoxWSjA4Mutm1vReaoStw/yC8yIwZrGxQZj6tSCwg9dMGkjvefHXKEC5BVcf?=
 =?us-ascii?Q?uCE9cD7BtLiXf3Jph6eqfrydeNHbc/YKeSIC/Mmx3K/MnullmQ6nhUsvirl1?=
 =?us-ascii?Q?f3043nCd3MdFW1GDlmDNfJ7c6JuexuCun7lXOobxtWAXDL6QpskCblxtcC1X?=
 =?us-ascii?Q?9ywTZ4pnrDiEUBUiEMt89UBjrX3TpMcpQ7BSyIaFKfDXsD/vjSttVj7IXRA/?=
 =?us-ascii?Q?JVYejIoDk3hDfm0158m8UIf2gx66FQ8nd8N4uF+7wxs+lo1e+jeYgwjVLo6s?=
 =?us-ascii?Q?hVuyc4V25JpvB/5xuFlCxX+5ImESfdeblJchp7fdPsxDDWIf+fgzRkv6XVRc?=
 =?us-ascii?Q?W/0F8gbYZdBc4hYcIGaZRJbxKdVEvcbUeWI5xDBdrC9lYSlrG2ilpLa9Tlt1?=
 =?us-ascii?Q?++6baXi2y2uXCwfTJryXkd0cBhMuS8c3NWPt1T1ffynf8TcQWf3s46MWvW/f?=
 =?us-ascii?Q?Ac/uLtFKl5eQf+2a/rXL8O0tGCt7Up3uCA9kquu/4545AY5RiVLO3W3pFM/2?=
 =?us-ascii?Q?evlZP4oPTafs7ppOfp1kBZ30Coy3nVsnC+g0ck7lvXM7gsEj3W/PR5dCkZAN?=
 =?us-ascii?Q?U7+4lxL8wnqw/Hpo067SHHwFC/a0/5cf3ikJuAXtaPEVF9qgKgH4HX0bR95s?=
 =?us-ascii?Q?ghptnPb1LgSiOk3aXMtp4E7lOVRHzfVwMp3I1XLXS3ZclSwJ9uUDzbA5rBgZ?=
 =?us-ascii?Q?dyC2GE0wCLFOBo9KnlTgpqQCT9B2cLP7nfJwMm4n7HxLTvy9Gxt1GtTy5Dy7?=
 =?us-ascii?Q?nUVvf6qXJnBH5PEuWR5F5kr9J9ZUROBcOn5PtvH9BrxxC66x+Kjrnuddx6YL?=
 =?us-ascii?Q?kNptXntP2xGYFBJJtBtNkdgj+/j3/8J/wGk/vl/I4gpU6RP9pzAiO5NQfMPs?=
 =?us-ascii?Q?IXFzdx2O4gOyAq0aHClYOchp1hUMQ/xWtgtpbIW96lL6LOawgsR6MpN/k7mA?=
 =?us-ascii?Q?Pu8SruuXaHYEUox+2T8RPkmnhMZIBAYcQKkyA1axtHEig2sPLvjEfTGT+HrV?=
 =?us-ascii?Q?Du9de6wm/3+4aSpFi/bIJJ7xJJaxoLIZ+q3ATB5oldzTg6OxTu9oAPrhTEjM?=
 =?us-ascii?Q?LmjC2E++e479LhnlLr/WlSnWP2HLY1LF3DSvuBSp/93pzZlBQl3WrMmD7ZzI?=
X-MS-Exchange-AntiSpam-MessageData-1: +o28v3ori888fFOsJ6hxWXPB6tUUy8WaKCg=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcd9f96-b476-45ba-dc1b-08df01b582d8
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 07:58:41.1431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ/oh3coM6aKZjj4KtVKByATwUgY2U/GIRfkwVE74g0nn5svVNjlQ+PE6dZ+ay6QzwB/S9ndimdljpNGz+Eq9XgVrKZAbHMPCaRrVP9sNSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 07:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244071

Hi Zolt=C3=A1n,

On 8/7/26 7:44 AM, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi wrote:
> See the reasoning and discussion at
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020
> which was merged and backported to 26.2.0.
>=20
> TL;DR: LLVM constantly introduces breaking changes that cause
> regressions for running OpenCL CTS with Rusticl and finally
> Karol Herbst had enough.
>=20
> This fork is from the LLVM 22 version of libclc and contains the
> necessary fixes to make Rusticl pass OpenCL CTS.
>=20
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>   meta/conf/distro/include/maintainers.inc      |  1 +
>   .../mesa/mesa-libclc_22.1.8.3.bb              | 26 +++++++++++++++++++
>   2 files changed, 27 insertions(+)
>   create mode 100644 meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index c5b701c244..feccf29ce4 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -524,6 +524,7 @@ RECIPE_MAINTAINER:pn-menu-cache =3D "Ross Burton <ros=
s.burton@arm.com>"
>   RECIPE_MAINTAINER:pn-mesa =3D "Unassigned <unassigned@yoctoproject.org>=
"
>   RECIPE_MAINTAINER:pn-mesa-demos =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>   RECIPE_MAINTAINER:pn-mesa-gl =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> +RECIPE_MAINTAINER:pn-mesa-libclc =3D "Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi <zboszor@gmail.com>"
>   RECIPE_MAINTAINER:pn-mesa-tools-native =3D "Unassigned <unassigned@yoct=
oproject.org>"
>   RECIPE_MAINTAINER:pn-meson =3D "Trevor Gamblin <tgamblin@baylibre.com>"
>   RECIPE_MAINTAINER:pn-meta-environment-${MACHINE} =3D "Richard Purdie <r=
ichard.purdie@linuxfoundation.org>"
> diff --git a/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb b/meta/re=
cipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
> new file mode 100644
> index 0000000000..c93b5b9d9d
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "Mesa fork of libclc: Implementation of the library requirem=
ents of the OpenCL C programming language."
> +HOMEPAGE =3D "https://gitlab.freedesktop.org/karolherbst/mesa-libclc/"

Sorry for the mangled link. Sad that they still keep this in Karol's=20
namespace. It however matches what they use in their CI (via the GitLab=20
Project ID), see .gitlab-ci/container/build-libclc.sh.

> +SECTION =3D "devel"
> +LICENSE =3D "Apache-2.0-with-LLVM-exception"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D7cc795f6cbb2d801d84336b83=
c8017db"
> +
> +SRC_URI =3D "git://gitlab.freedesktop.org/karolherbst/mesa-libclc.git;pr=
otocol=3Dhttps;branch=3Dllvm_22"
> +
> +SRCREV =3D "87f66007242ff10e9e84bf32be84f9057f6abc75"

How do we make sure we use the mesa-libclc blessed by mesa for a given=20
release?

It seems like we should use the tag as specified in=20
MESA_LIBCLC_VERSION=3D22.1.8.3 in .gitlab-ci/container/build-libclc.sh.=20
Can you add a comment in mesa-libclc and mesa.inc that mesa-libclc=20
should only be bumped with mesa.inc, and that a bump in mesa.inc should=20
REEEEEEALLLLLLY check we use the expected mesa-libclc version (put it=20
next to SRCREV so it appears in the git context when someone sends a patch)=
.

I've only barely looked at the changes made between 26.1.0 and 26.2.0=20
but we should be able to drastically relax the libclc requirement for=20
anything but opencl (rusticl). c.f. 20b40644b7ae ("clc: make libclc=20
optional for configs not needing it")

Someone will need to start looking into what they're doing with=20
panfrost, c.f. the new panfrost-rust option. There's a bunch of=20
additional dependencies in src/panfrost/compiler/kraid/meson.build we'll=20
need. Oh well, something for later (but probably very soon, like next=20
release).

Cheers,
Quentin


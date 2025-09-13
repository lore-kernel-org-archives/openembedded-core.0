Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AD7CAC58E
	for <webhook@archiver.kernel.org>; Sat, 13 Sep 2025 10:06:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.16])
 by mx.groups.io with SMTP id smtpd.web11.2346.1757757967764094710
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Sep 2025 03:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=DsmcqpWN;
 spf=pass (domain: axis.com, ip: 40.107.130.16, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EN343mwgaBtUSea7tTzxSFLxn1XcCtei3y3fZrpdyFDIBClNkq7YfKvPa75byfSDbtEuF0hL+es0HovWSeykkk5eVWOBG67wJJxyuJ0qA0W2GutCN1lTYdlCaqW6S+jiBkssvq+ISuSRQFuFAv/BdE8wvcGDhqwxIbGa3mrUgygK71jVT6mRr/sC+1xlsvGRk1owlLvPebHeL5Nl5qI4mAKEx41YlMvCI0nLhIB6zkRUnsVbReBMeqFnw2GoXAheW4AviGmWhH20wMLSD+I3o61tyXAoxjPWk458Ot4J3oqDxHJNhjEnHrSngzK8aTH1ZXBz/CPb36dtwXuVXLlUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uzfeFdJLavznwtJVGepwCeY9LikpJmEe7bYjWLdKQE=;
 b=KejDedp4mAeybdtwRlx5ObCw0tlcwrtmXRMT8DkMKwjSCsHLnKy0Sia6r7zJKXlp7tUC2UsT0w7GzWdgh0yNS+XGnD5pXZuvJvEM4ApbPQNl48bFrGGuPUzcVmmxvFmWKxnbtEbkC3mlf9AtA44Rdo5Vjq5KGBQsBqe8t7VrnsnSwJhMQviu0sbSoKyT6dxqiB+9+jTnA3WmEgyUDXuGfveDYU9sD3KTaU6P3orSmnQhlKXpSlZc/A2ZE9obrCnvrNYZUHgttEBs9uKy4AnfLYP3kpSW/zuuaS6Ansu/7NpUKUSSwFUiSvLkUsuInAkLSDMDbUi5zUQl0Otu3cADjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uzfeFdJLavznwtJVGepwCeY9LikpJmEe7bYjWLdKQE=;
 b=DsmcqpWNeJ2O8JOyminDOXC1M3KfSdZbF7cibAZW7sPCv0W4n1sLOsVVQTHm53d1X5zhw8wD6XPhDoq2smMU6EZn4m1zcFRwdeO0MDYV1dft2+Tq9mc/mTCA97sHn24zbwCS6GX450KOAMJK2YLu6T0vc2jMawt06JxD9oAOGBw=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GVXPR02MB10941.eurprd02.prod.outlook.com (2603:10a6:150:21f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 10:06:00 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 10:06:00 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: RE: [OE-core] [PATCH 2/5] distro/include: Add debug_build_tune.inc,
 collect debug tuning configuration
Thread-Topic: [OE-core] [PATCH 2/5] distro/include: Add debug_build_tune.inc,
 collect debug tuning configuration
Thread-Index: AQHcI/9u1KEaAP6PVUmjnB4ZS8jHLbSQyAcA
Date: Sat, 13 Sep 2025 10:06:00 +0000
Message-ID: 
 <DB5PR02MB1021376671BF618279846C78DEF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250912160741.346809-1-hongxu.jia@windriver.com>
 <20250912160741.346809-2-hongxu.jia@windriver.com>
In-Reply-To: <20250912160741.346809-2-hongxu.jia@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GVXPR02MB10941:EE_
x-ms-office365-filtering-correlation-id: 3555f8d6-02f9-4dec-412d-08ddf2ad242c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?hxcOvA7N/FMm7WVQ3EbKsjiMx8g1N8ScrxVNk9O20oYwh9nUa7B+OQBXK8p2?=
 =?us-ascii?Q?/7/fWeNqtQAJ/kaYpIOo/gsVxKBlV39Os1BOJvTFF2OEUjYKk3J+F0sPaG+F?=
 =?us-ascii?Q?jzDXvKDaSskNw8O/cRZIt2TXO5KlXOZLqzSudnTH/Ek9ZSP73f/+MYzRpTpl?=
 =?us-ascii?Q?QcuxwfKSRdAKZa5cpbgN2A1TlVf6bHrhXcG/0NusWncLNwHlfk8Ze/I/NZXW?=
 =?us-ascii?Q?JpHLHve3HYQhZFRmW2DPSZ3PEhxkqOR3PAKA7zPp/5Uvx78o57wZJO1eO2e5?=
 =?us-ascii?Q?4tucXTRA1zV6ErVHMGx+BGMsLTN31ulB4sDwx3xXOtCUpwkUdjA+Z74RawP/?=
 =?us-ascii?Q?aP7M7E5gCdpWxqnV0he/rn9swE/UJlMTU4JGVrKis8J1SjQcVplr3c3dnaGy?=
 =?us-ascii?Q?b58ELhO8cG0LRBp/R6LPZBy4UJwfS/Zt7CbiFVOAhyAyNfzDXoitlYox1Z5R?=
 =?us-ascii?Q?piwOSFdpGoJMpP+eWlaDlPyh+S2eT6Za51PkOLcIj3B0G82t6+vx48gtjVp1?=
 =?us-ascii?Q?JEn9lkt3FloyPq2LSDKkSiz742qL71KFHAn2/5HoXEkl65FIhP9wkVclIZVB?=
 =?us-ascii?Q?nKOdcwB05O3oixwAu/X5hBappdZgOjfTyJXJqgXV6hVyjLs8iwYh2GJozcWt?=
 =?us-ascii?Q?8cTRqrrJcPNSS6uRS1z2WDue8PecZTxxs3EwJ2mKG1jU1G/xyUDq21gmrILb?=
 =?us-ascii?Q?VfjFF1pZC8A/opjNsWYMM9iOPb2RI5q57+QoKXJnNQtVahqRwaTFF/I6Sc1t?=
 =?us-ascii?Q?hKgnh64uLAM536orj/lUgR4drjeXA0d+cX7/MIx5jQK5bF7yQCNNL4JsU1WW?=
 =?us-ascii?Q?KwqUhh38CAfl23YlXUs7Tlsf/IFFaMEVEpnoFWWs0TW7xGgRqGHrPtvdtqSq?=
 =?us-ascii?Q?u+2fg9j6Mkmr4dVHGms18Ex1Jkqrdm7ObgKx3yR9/r2rg3FrrT9yZhLY4SKG?=
 =?us-ascii?Q?nB4Q5mOHgMSE/9GCpj4iIXeZPz+zyuMXP1Num4NYXIuP4/LvDAg2CR9xwtzj?=
 =?us-ascii?Q?6Mbl/XTLmWdZ42XjuSE+eM8Ap5QeKVkIfOeYQQz69hhge6uuk9ZqmlkO9+Uh?=
 =?us-ascii?Q?DPbQgC57puR59wP9fDHI07okTX4wMFDd3KUQNudkGubpK9cp1PQIGFGxklzV?=
 =?us-ascii?Q?j5iPUvjdYlYr3ntrhAB42KVy+f+jQFD8lpVYZ9YsKp2vm3TuKT4wsOmb/E8r?=
 =?us-ascii?Q?cbb0nrHXgo05i2a9BuZkeYFeepoWb6dkukAM8RNWILBley5FUszi6tKorSmu?=
 =?us-ascii?Q?KmywYGj+q9pkt9GNbuYlifJ2tQmWm+9Op5nPf+Cyv356ROr3SlhCxLSzj4Rn?=
 =?us-ascii?Q?jVh8/rsfCenlruvFUWdiSCM2/5JUIL2c/E5en3azASzf75HCcnwI+QDNBb8I?=
 =?us-ascii?Q?GpiMb6nduWwK5QGuHy7AExlNFHzoxcYA1Wdabpl1DIvTfwa7s1sMYTV7Yn27?=
 =?us-ascii?Q?OLCdjgTDZW4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qYq1dslfyDOqlSlpmi53MLyIzBDR8/Rn/+0ze9odGKOLdv6V/NUWxd/cchYi?=
 =?us-ascii?Q?46QdxjjKOoIF8zk7tDwT4xLptn/FZDQP5+1l4ekWHyUikPL/9fXqut4J2rs7?=
 =?us-ascii?Q?BWM098fhRvlkIpzx8NTKNmWHvh3fX3lykKpN0wC+KnqkRbbKP6e78WmOPcZe?=
 =?us-ascii?Q?uEEth/qDrAwRz6nQzQs7MgVm92iEDrP846fEUQKNgebtfj2XLfS4SSX225rx?=
 =?us-ascii?Q?VvGHX4m46vcwOQlHOs900zIjeFGLbiZPdfV+M5IwS7MB3WEBNkWmuvrPyAIn?=
 =?us-ascii?Q?X6MxMRwIhit+c8p17Fsy8Mrkoa/lnTtXBUb+Jb6jFzEltHCfF664wJ7D7LgY?=
 =?us-ascii?Q?gkcNLWEh1g2SmViC+CJCTIXw+Daf4imvRTWPycI7Z+O+1U6RLsb1I9j2Z3IT?=
 =?us-ascii?Q?p5koV1rnWiKFfYLas/dxsfvYVEzs/ltNd5zmtjDMFEXkHn9okxUw53nrcvMg?=
 =?us-ascii?Q?iBnPMlWc6wbwebNfK1uwO83i97t5nhpiwJanSer+mbQlHjGZEgiJ/j0Vp/Uy?=
 =?us-ascii?Q?twNEnoYiMhW6hrzsZoS0Hik+OeCVXREzl/M71V2RuAmg+zy68hXV/qT7cVuv?=
 =?us-ascii?Q?XjwtNJheKjH92skSVGNrlAwDG2DlJVB48cvZzdPMVtTf3JdZmP840Vo1I6xk?=
 =?us-ascii?Q?1qy1IsjxJvAOqqg9DIm4aBwySYeI+5k743Ehdb2J2TobSSk/6tOgUsl92tbb?=
 =?us-ascii?Q?b26oq3IfVAkVihM926MFwo/RblPIlKmW9BM6adJfW7mRAeiIlF3k8JZa7jiK?=
 =?us-ascii?Q?oPBaHIu1gugdGCSKLP31WrLKozLLzxQLEe9yyFRkt1MLwv6E9Dr1GiMfIpoN?=
 =?us-ascii?Q?vZU+QkVRHLIUbyr2rthXudog1+kb9tzR+2+Nrh0fPauD+NH9t9CeOKThoTp9?=
 =?us-ascii?Q?hZjoBRMRu4CmwoSBEsGiQ7WPznzLBlUFxeaKD7zTnPJ+lcQKQ+d7AWtQqes7?=
 =?us-ascii?Q?enUNYJeS2el/sjQjsG+EHXm/hQ8xqypvHoX+VfY4oNik54PKfzp/4RgZXXvB?=
 =?us-ascii?Q?lZ2sGY6vaTwFmjIOxKjceOLeE+ufNkuGEM8fKha5t4iEyaNJZtq8yqvZp++I?=
 =?us-ascii?Q?Fq4y3YJNk77GGwX55BtearnqxOei2ZGIPVsij3mst5hYT8YtbV1skWr1PEu+?=
 =?us-ascii?Q?0wjFoIZkjyRHYdso3CcFdyT3fyWixfG+2znwHItI3OwJdqC0z6kVlQmNfoZY?=
 =?us-ascii?Q?ikPfP6b205IKZbHaq9ktQU/V+793+GmAS4+1ikENZ0L1y7qdIW3idrw5snA5?=
 =?us-ascii?Q?5sNHG6/AaeSO8xFTl6PL3TuXDgiBnhzP0wkz6zodHy6REhvx2ySiygzxlnat?=
 =?us-ascii?Q?GhaAlJGko9Ib8EB7nW5NmHJZJPVpzcjhDMSvlwyk0Gh/WQW6ar5wEAc9iicP?=
 =?us-ascii?Q?xC1OphvxI4mL1kZXJ9OmtCnbqu10wh8U1aJbAXMc1GAKpBs5ECKhVNheEBRx?=
 =?us-ascii?Q?7Nnh3epSlyh388waK2d+UBKax09qHKd4s5g1W2y9WxynxgC7ncP7rBHexPga?=
 =?us-ascii?Q?65WA+PzGzfxdLCYGAPIgFIL+j5rldLQjSOaPA5G8aK0Hh7zeRcNYfZIaIw?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3555f8d6-02f9-4dec-412d-08ddf2ad242c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2025 10:06:00.6533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ckhb/Qewg8Gl8Jh899S7Ayrw+chagznApOMvB+toixO1S0BW7LsU3nojM8UgnKcQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10941
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Sep 2025 10:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223341

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of hongxu via lists.openembedded.org
> Sent: den 12 september 2025 18:08
> To: openembedded-core@lists.openembedded.org
> Cc: randy.macleod@windriver.com
> Subject: [OE-core] [PATCH 2/5] distro/include: Add debug_build_tune.inc, =
collect debug tuning configuration
>=20
> The modern compilers and code seem to require extra steps to avoid DEBUG =
errors,
> Move debug tuning configuration from recipes, add an include file to coll=
ect them
> to address these errors. Require the include file when DEBUG_BUILD is ena=
bled.
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/bitbake.conf                        |  2 +
>  meta/conf/distro/include/debug_build_tune.inc | 45 +++++++++++++++++++
>  meta/recipes-connectivity/kea/kea_3.0.1.bb    | 10 -----
>  .../debugedit/debugedit_5.2.bb                |  2 -
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 --
>  .../python/python3-lxml_6.0.1.bb              | 12 -----
>  meta/recipes-extended/bash/bash_5.3.bb        |  3 --
>  meta/recipes-extended/mdadm/mdadm_4.4.bb      |  2 -
>  .../jpeg/libjpeg-turbo_3.1.2.bb               |  3 --
>  .../vulkan-validation-layers_1.4.321.0.bb     |  2 -
>  meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb |  1 -
>  meta/recipes-kernel/perf/perf.bb              |  2 -
>  meta/recipes-sato/webkit/webkitgtk_2.48.5.bb  |  2 +-
>  meta/recipes-support/vim/vim_9.1.bb           |  2 +-
>  14 files changed, 49 insertions(+), 42 deletions(-)
>  create mode 100644 meta/conf/distro/include/debug_build_tune.inc
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8e90c7bbc85..193a8377cf2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -831,6 +831,8 @@ include conf/licenses.conf
>  require conf/sanity.conf
>  include conf/bblock.conf
>=20
> +require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_bu=
ild_tune.inc', '', d)}

Why debug_build_tune.inc, why not just debug_build.inc?

I suggest using include_all instead of require to allow other layers=20
to add their own debug configurations in a similar way.

Further, to avoid the :remove operations below, I suggest=20
introducing separate variables for the optimization level. And,
since you are moving everything else related to DEBUG_BUILD =3D=3D 1=20
to debug_build_tune.inc, why not move parts of the definitions=20
of the *_OPTIMIZATION variables there as well? That would simplify=20
their definitions.

You would then get this in bitbake.conf:

FULL_OPTLEVEL =3D "-O2"
FULL_OPTIMIZATION =3D "${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}"
SELECTED_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
# compiler flags for native/nativesdk
BUILD_OPTLEVEL =3D "-O2"
BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL}"

And this in debug_build_tune.inc:

DEBUG_OPTLEVEL =3D "-Og"
DEBUG_OPTIMIZATION =3D "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
SELECTED_OPTIMIZATION =3D "${DEBUG_OPTIMIZATION}"
# compiler flags for native/nativesdk
BUILD_OPTLEVEL =3D "-Og"
BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL} -g"

*_OPTLEVEL need to be documented, and the documentation for=20
FULL_OPTIMIZATION and DEBUG_OPTIMIZATION probably needs to be=20
updated.

And poky-tiny.conf and harfbuzz need to set FULL_OPTLEVEL instead of=20
FULL_OPTIMIZATION.

> +
>  ##################################################################
>  # Weak variables (usually to retain backwards compatibility)
>  ##################################################################
> diff --git a/meta/conf/distro/include/debug_build_tune.inc b/meta/conf/di=
stro/include/debug_build_tune.inc
> new file mode 100644
> index 00000000000..ca43d2b955c
> --- /dev/null
> +++ b/meta/conf/distro/include/debug_build_tune.inc
> @@ -0,0 +1,45 @@
> +# The modern compilers and code seem to require extra steps to avoid DEB=
UG errors,
> +# this file collects debug tuning configuration to address DEBUG errors.
> +
> +DEBUG_OPTIMIZATION:append:pn-perf =3D " -Wno-error=3Dmaybe-uninitialized=
"
> +DEBUG_OPTIMIZATION:append:armv4:pn-libjpeg-turbo =3D " ${@bb.utils.conta=
ins('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
> +DEBUG_OPTIMIZATION:append:armv5:pn-libjpeg-turbo =3D " ${@bb.utils.conta=
ins('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
> +DEBUG_OPTIMIZATION:append:armv4:pn-bash =3D " ${@bb.utils.contains('TUNE=
_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
> +DEBUG_OPTIMIZATION:append:armv5:pn-bash =3D " ${@bb.utils.contains('TUNE=
_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
> +DEBUG_OPTIMIZATION:append:pn-mdadm =3D " -Wno-error"
> +DEBUG_OPTIMIZATION:remove:mips:pn-kea =3D " -Og"
> +DEBUG_OPTIMIZATION:append:mips:pn-kea =3D " -O"
> +DEBUG_OPTIMIZATION:remove:mipsel:pn-kea =3D " -Og"
> +DEBUG_OPTIMIZATION:append:mipsel:pn-kea =3D " -O"
> +# {standard input}: Assembler messages:
> +# {standard input}:1488805: Error: branch out of range
> +DEBUG_OPTIMIZATION:remove:mips:pn-python3-lxml =3D " -Og"
> +DEBUG_OPTIMIZATION:append:mips:pn-python3-lxml =3D " -O"
> +DEBUG_OPTIMIZATION:remove:mipsel:pn-python3-lxml =3D " -Og"
> +DEBUG_OPTIMIZATION:append:mipsel:pn-python3-lxml =3D " -O"
> +# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.=
3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.s=
t_mode' may be used uninitialized in this function [-Werror=3Dmaybe-uniniti=
alized]
> +DEBUG_OPTIMIZATION:append:pn-gcc-sanitizers =3D " -Wno-error"
> +
> +BUILD_OPTIMIZATION:remove:mips:pn-kea =3D " -Og"
> +BUILD_OPTIMIZATION:append:mips:pn-kea =3D " -O"
> +BUILD_OPTIMIZATION:remove:mipsel:pn-kea =3D " -Og"
> +BUILD_OPTIMIZATION:append:mipsel:pn-kea =3D " -O"
> +# {standard input}: Assembler messages:
> +# {standard input}:1488805: Error: branch out of range
> +BUILD_OPTIMIZATION:remove:mips:pn-python3-lxml =3D " -Og"
> +BUILD_OPTIMIZATION:append:mips:pn-python3-lxml =3D " -O"
> +BUILD_OPTIMIZATION:remove:mipsel:pn-python3-lxml =3D " -Og"
> +BUILD_OPTIMIZATION:append:mipsel:pn-python3-lxml =3D " -O"
> +
> +CPPFLAGS:append:arm::pn-lttng-ust =3D " -DUATOMIC_NO_LINK_ERROR"

Change :: to :

> +
> +EXTRA_OECMAKE:remove:pn-webkitgtk =3D "-DWEBKIT_NO_INLINE_HINTS=3DOFF"
> +EXTRA_OECMAKE:append:pn-webkitgtk =3D " -DWEBKIT_NO_INLINE_HINTS=3DON"
> +
> +EXTRA_OECONF:pn-debugedit =3D "--disable-inlined-xxhash"
> +EXTRA_OECONF:pn-debugedit-native =3D "--disable-inlined-xxhash"
> +EXTRA_OECONF:pn-nativesdk-debugedit =3D "--disable-inlined-xxhash"

These need to use :append.

> +
> +lcl_maybe_fortify:pn-vim =3D ""
> +
> +CXXFLAGS:append:pn-vulkan-validation-layers =3D " -DXXH_NO_INLINE_HINTS=
=3D1"
> diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-co=
nnectivity/kea/kea_3.0.1.bb
> index cc34c05093a..ead4e98e708 100644
> --- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
> @@ -34,16 +34,6 @@ INITSCRIPT_PARAMS =3D "defaults 30"
>  SYSTEMD_SERVICE:${PN} =3D "kea-dhcp4.service kea-dhcp6.service kea-dhcp-=
ddns.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
>=20
> -DEBUG_OPTIMIZATION:remove:mips =3D " -Og"
> -DEBUG_OPTIMIZATION:append:mips =3D " -O"
> -BUILD_OPTIMIZATION:remove:mips =3D " -Og"
> -BUILD_OPTIMIZATION:append:mips =3D " -O"
> -
> -DEBUG_OPTIMIZATION:remove:mipsel =3D " -Og"
> -DEBUG_OPTIMIZATION:append:mipsel =3D " -O"
> -BUILD_OPTIMIZATION:remove:mipsel =3D " -Og"
> -BUILD_OPTIMIZATION:append:mipsel =3D " -O"
> -
>  CXXFLAGS:remove =3D "-fvisibility-inlines-hidden"
>=20
>  do_configure:prepend() {
> diff --git a/meta/recipes-devtools/debugedit/debugedit_5.2.bb b/meta/reci=
pes-devtools/debugedit/debugedit_5.2.bb
> index 76c54ba63d4..4ac6cab559e 100644
> --- a/meta/recipes-devtools/debugedit/debugedit_5.2.bb
> +++ b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
> @@ -22,8 +22,6 @@ inherit pkgconfig autotools multilib_script
>=20
>  RDEPENDS:${PN} +=3D "bash elfutils-binutils"
>=20
> -EXTRA_OECONF =3D "${@oe.utils.vartrue('DEBUG_BUILD', '--disable-inlined-=
xxhash', '', d)}"
> -
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
>  MULTILIB_SCRIPTS =3D "${PN}:${bindir}/find-debuginfo"
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-=
devtools/gcc/gcc-sanitizers.inc
> index 6c81d302438..f4727ee6dba 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -54,9 +54,6 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>  ALLOW_EMPTY:${PN} =3D "1"
>  DEPENDS =3D "virtual/crypt gcc-runtime virtual/cross-cc"
>=20
> -# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.=
3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.s=
t_mode' may be used uninitialized in this function [-Werror=3Dmaybe-uniniti=
alized]
> -DEBUG_OPTIMIZATION:append =3D " -Wno-error"
> -
>  BBCLASSEXTEND =3D "nativesdk"
>=20
>  PACKAGES =3D "${PN} ${PN}-dbg"
> diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb b/meta/re=
cipes-devtools/python/python3-lxml_6.0.1.bb
> index 5d76641675c..6bcd399da54 100644
> --- a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
> +++ b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
> @@ -23,18 +23,6 @@ SRC_URI[sha256sum] =3D "2b3a882ebf27dd026df3801a87cf49=
ff791336e0f94b0fad195db77e01
>  SRC_URI +=3D "${PYPI_SRC_URI}"
>  inherit pkgconfig pypi setuptools3
>=20
> -# {standard input}: Assembler messages:
> -# {standard input}:1488805: Error: branch out of range
> -DEBUG_OPTIMIZATION:remove:mips =3D " -Og"
> -DEBUG_OPTIMIZATION:append:mips =3D " -O"
> -BUILD_OPTIMIZATION:remove:mips =3D " -Og"
> -BUILD_OPTIMIZATION:append:mips =3D " -O"
> -
> -DEBUG_OPTIMIZATION:remove:mipsel =3D " -Og"
> -DEBUG_OPTIMIZATION:append:mipsel =3D " -O"
> -BUILD_OPTIMIZATION:remove:mipsel =3D " -Og"
> -BUILD_OPTIMIZATION:append:mipsel =3D " -O"
> -
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
>  RDEPENDS:${PN} +=3D "libxml2 libxslt python3-compression"
> diff --git a/meta/recipes-extended/bash/bash_5.3.bb b/meta/recipes-extend=
ed/bash/bash_5.3.bb
> index b50a48d28c9..74671f5a563 100644
> --- a/meta/recipes-extended/bash/bash_5.3.bb
> +++ b/meta/recipes-extended/bash/bash_5.3.bb
> @@ -15,9 +15,6 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtar=
ball \
>=20
>  SRC_URI[tarball.sha256sum] =3D "0d5cd86965f869a26cf64f4b71be7b96f90a3ba8=
b3d74e27e8e9d9d5550f31ba"
>=20
> -DEBUG_OPTIMIZATION:append:armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
> -DEBUG_OPTIMIZATION:append:armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
> -
>  CFLAGS +=3D "-std=3Dgnu17"
>  # mkbuiltins.c is built with native toolchain and needs gnu17 as well:
>  # http://errors.yoctoproject.org/Errors/Details/853016/
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-exte=
nded/mdadm/mdadm_4.4.bb
> index 26a60e4c1a3..e81b8fdf3cb 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.4.bb
> @@ -39,8 +39,6 @@ EXTRA_OEMAKE =3D 'CHECK_RUN_DIR=3D0 CWFLAGS=3D"" CXFLAG=
S=3D"${CFLAGS}" SYSTEMD_DIR=3D${sys
>                  BINDIR=3D"${base_sbindir}" UDEVDIR=3D"${nonarch_base_lib=
dir}/udev" LDFLAGS=3D"${LDFLAGS}" \
>                  SYSROOT=3D"${STAGING_DIR_TARGET}" STRIP=3D'
>=20
> -DEBUG_OPTIMIZATION:append =3D " -Wno-error"
> -
>  do_install() {
>          oe_runmake 'DESTDIR=3D${D}' install install-systemd
>          install -d ${D}/${sysconfdir}/
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
> index d4877bb92b5..bc9d803f6b9 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
> @@ -44,9 +44,6 @@ EXTRA_OECMAKE:append:class-target:powerpc =3D " ${@bb.u=
tils.contains("TUNE_FEATURE
>  EXTRA_OECMAKE:append:class-target:powerpc64 =3D " ${@bb.utils.contains("=
TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=3DFalse", d)}"
>  EXTRA_OECMAKE:append:class-target:powerpc64le =3D " ${@bb.utils.contains=
("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=3DFalse", d)}"
>=20
> -DEBUG_OPTIMIZATION:append:armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
> -DEBUG_OPTIMIZATION:append:armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
> -
>  # libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
>  # <instantiation>:13:5: error: invalid token in expression
>  # .if $17 !=3D 0
> diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.32=
1.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
> index 466e757a908..fa7873b62d3 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
> @@ -26,8 +26,6 @@ EXTRA_OECMAKE =3D "\
>      -DSPIRV_HEADERS_INSTALL_DIR=3D${STAGING_EXECPREFIXDIR} \
>      "
>=20
> -CXXFLAGS:append =3D " ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INLIN=
E_HINTS=3D1', '', d)}"
> -
>  PACKAGECONFIG[x11] =3D "-DBUILD_WSI_XLIB_SUPPORT=3DON -DBUILD_WSI_XCB_SU=
PPORT=3DON, -DBUILD_WSI_XLIB_SUPPORT=3DOFF -DBUILD_WSI_XCB_SUPPORT=3DOFF, l=
ibxcb libx11 libxrandr"
>  PACKAGECONFIG[wayland] =3D "-DBUILD_WSI_WAYLAND_SUPPORT=3DON, -DBUILD_WS=
I_WAYLAND_SUPPORT=3DOFF, wayland"
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes=
-kernel/lttng/lttng-ust_2.14.0.bb
> index 1a15c5b4201..0d4c67f0fa7 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
> @@ -16,7 +16,6 @@ inherit autotools lib_package manpages python3native pk=
gconfig
>  include lttng-platforms.inc
>=20
>  EXTRA_OECONF =3D "--disable-numa"
> -CPPFLAGS:append:arm =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-DUATOMIC_N=
O_LINK_ERROR', '', d)}"
>=20
>  DEPENDS =3D "liburcu util-linux"
>  RDEPENDS:${PN}-bin =3D "python3-core"
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index e1915207eed..98dffd1cc99 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -415,8 +415,6 @@ FILES:${PN}-python =3D " \
>                         "
>  FILES:${PN}-perl =3D "${libexecdir}/perf-core/scripts/perl"
>=20
> -DEBUG_OPTIMIZATION:append =3D " -Wno-error=3Dmaybe-uninitialized"
> -
>  PACKAGESPLITFUNCS =3D+ "perf_fix_sources"
>=20
>  perf_fix_sources () {
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-
> sato/webkit/webkitgtk_2.48.5.bb
> index 46031322b92..616cd353337 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> @@ -90,7 +90,7 @@ EXTRA_OECMAKE =3D " \
>                   -DPORT=3DGTK \
>                   ${@oe.utils.vartrue('GI_DATA_ENABLED', '-DENABLE_INTROS=
PECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
>                   ${@oe.utils.vartrue('GIDOCGEN_ENABLED', '-DENABLE_DOCUM=
ENTATION=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
> -                 ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_=
HINTS=3DON', '-DWEBKIT_NO_INLINE_HINTS=3DOFF', d)} \
> +                 -DWEBKIT_NO_INLINE_HINTS=3DOFF \
>                   -DENABLE_MINIBROWSER=3DON \
>                   -DENABLE_BUBBLEWRAP_SANDBOX=3DOFF \
>                   -DUSE_GTK4=3DON \
> diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/v=
im/vim_9.1.bb
> index fee9f055e9a..a24a863ba5c 100644
> --- a/meta/recipes-support/vim/vim_9.1.bb
> +++ b/meta/recipes-support/vim/vim_9.1.bb
> @@ -20,4 +20,4 @@ ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
>  # We override the default in security_flags.inc because vim (not vim-tin=
y!) will abort
>  # in many places for _FORTIFY_SOURCE=3D2.  Security flags become part of=
 CC.
>  #
> -lcl_maybe_fortify =3D "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_=
FORTIFY_SOURCE=3D1',d)}"
> +lcl_maybe_fortify =3D "-D_FORTIFY_SOURCE=3D1"
> --
> 2.34.1

//Peter


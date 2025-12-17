Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017D2D66B9D
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 19:07:09 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23013.1765998421813979364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 11:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=dhWlXSur;
 spf=pass (domain: axis.com, ip: 52.101.72.1, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRqnwfm42ZImYxFV9GE0tjAFWcPbd0m+AjzcNKY8OO7r98A7heHUeuk9SbsFQ2yTCQKrrjcMCP31fj199gQp7ouabyXKk0iIKntS4OpXixNYc+BQ22TEsY0LEGDahoIZIQ8IimIa3RTncy+JgCLXaV0PXs077IFv0P20JEicG7wMoIzFq3IBq6Z/XI/EGDFen3JIpkp0TRpSFHo0BPI1srXM9WO6FT4aDngMDlqzbLoxmzicZ48c7SgoseNpjb6P2Jg90A25rc7TTSGQEkdpY6r23H5FPz9qLaiW3/zWf9C3bXPgwM40OxzktJM8X0+kAfvzvZYwWv5Osw08VIakWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0eG8ZcGXSRXrABT/UZjpdeGTW0LyzWUGhlNzXLY9n0=;
 b=p60HOVttIUEIaAnM8FiFDC97pUT7dgglggF3MolB6Fy5k+pdJCwCR1Ejl53EzbBuQc6uXImAdUdhQDlzNLJjxXghNhS3IA2Kw0MtOmry/j9UdSQg/7UlWgWTdmWiRGEos+yBx8xdp6O9X/UF55W/ZFL21K3UhgRsKHm78Qz4sOFdorUWf4wRMOQ8GVSt1+CelAZ02bruasncB+wy5Xaw3RDBkFSDLhlJNDmzKeSfswasE1AoB2zt4h6xPGNy0qRp3AOOOBsMPiRdvFpupoO3eQ0Gkw+/S6IC1Iw0k+Q/Wcw+i8T+k+hV2TWB/Ao32FraeazCAS/vmLWRkE4Ck0MHwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0eG8ZcGXSRXrABT/UZjpdeGTW0LyzWUGhlNzXLY9n0=;
 b=dhWlXSurV21WAdQ1vzzUyrmVA7ax3MvMdXFAinUcfF97Juo1/JkX0kdXF6kU+laq466G7kTlNAwWXB/g8v7yvBqjBFP7UjUiAcPmfNQzkYuh6u2sEbXIfWccqm7nW5H6csfWbsZLoo2WEayoG5WUU+WiiqWXQnPOg0QR/2a2MoQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB8972.eurprd02.prod.outlook.com (2603:10a6:20b:5be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 19:06:57 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 19:06:57 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "adam.duskett@amarulasolutions.com" <adam.duskett@amarulasolutions.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v4 2/7] libtoml: new recipe
Thread-Topic: [OE-core] [PATCH v4 2/7] libtoml: new recipe
Thread-Index: AQHcbayHFrep2SlM7kK6uoO8YCxVerUmNBcQ
Date: Wed, 17 Dec 2025 19:06:57 +0000
Message-ID: 
 <DB5PR02MB10213A49530B49F16276E1623EFABA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
 <20251215102041.1630567-2-adam.duskett@amarulasolutions.com>
In-Reply-To: <20251215102041.1630567-2-adam.duskett@amarulasolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB8972:EE_
x-ms-office365-filtering-correlation-id: 4c2b23ae-fe7d-4f99-beec-08de3d9f733c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?u9TIWQZaAZ5pt8ww3E+B8V4hInvbI7dOdvSLwCdb7TDRyc2xUgDKDgqp+sKr?=
 =?us-ascii?Q?RkvATcMOh0aDCT8aaA7vOTsOk2+0vN5L2i0KgL2n3ZIoInmh/1U9xRLlc9C6?=
 =?us-ascii?Q?jfehFVcR1D6ZrO7QuyorPsJ6HT61k1/faGlOWK399GPzNESyKIfANwEBLs36?=
 =?us-ascii?Q?UKy3QHziY5Vy/2deRngVFR43CoX3eoYT200Tiv2WuGSUAaVgxNK74zEuCeLg?=
 =?us-ascii?Q?4B1EaiunEqZIrRl0s/9059IvVjX2u903ASEQ6sU9lroYUKDK3fzSW9YV9G73?=
 =?us-ascii?Q?JtTDegWir3BcxsPhoX1xmYZEfl1lwgI0xLstfDThs8mfQItw7yjfnhNLc1le?=
 =?us-ascii?Q?3fnimDygsQuR4jwIIX2l5TN4z6rfB1/rRZUCYW8k89J+RjzReUWvhNKemfYu?=
 =?us-ascii?Q?lqc4k3YSLvEOu46jBEEPsFTXp1cGHP/gua+N8+poA8j42XkJnuuX9iKvw8iv?=
 =?us-ascii?Q?COSeGg2OtsMaSnZd2f3oP50mDlO74fLK5jll31FdrkAceXc4Ck1dKdEMJcfn?=
 =?us-ascii?Q?Bclw9H7u6q9agtd6S3l2w9vgY8U+kx7hG3HMJ6jypgHhErg+dRZZB44BVJIi?=
 =?us-ascii?Q?MAcvw+320geQi2zChFluGzjHTgThDOBRMy6zK1DzBFmf/6qVmkhUCeC5h3oE?=
 =?us-ascii?Q?S3IB5DV0/bURkoZYS00t8JxEKfMfwtdWPOHimxthCW+JJph7bzlP6bcoCZaV?=
 =?us-ascii?Q?KZlxEynCdnIJAvwu67uydszu3V9srDfS4XN9H62QG2mOZNNaNvFD+A2pXcmG?=
 =?us-ascii?Q?LfijO3KOeJFgRNVApaMOstjpBtprm7pM0AiQIJRZkO5yCBtqQnwC6UjmwB8H?=
 =?us-ascii?Q?ACur1ef5aFn4Z/tEcTAfzHEG9hE44Gahc03Hu7y7Ik1ICy/WCnHqFDpL1Fhf?=
 =?us-ascii?Q?66ZhEDR8TDpecsF+/9J6GqeYANNBqZ9EgS+Z/VSsT5zHPM/Sx8rjliOUSPmh?=
 =?us-ascii?Q?L/ooXNgV0KD0I6Cm8DZ40unKjgsTBzsP3gKX6xiXY8BDG+gmzliUtq+GTbEQ?=
 =?us-ascii?Q?NNFH91OnWeOKknnGczxv6YGMfHR44I36R9iMhL7cAwS+WxFYd8pJiKVYxduu?=
 =?us-ascii?Q?M1LsXJArSevCS3Hni6XIOLHRhBz5fQmdFgpUXyYkWQDA2JA6VCttKybw/3zy?=
 =?us-ascii?Q?H88eDCZEilTY53FHtEJ8h5gSogo/eYMKJp9UpGNzphZU5A3Xo218esNY10gx?=
 =?us-ascii?Q?Y5n50dM2KrDvpFBvjg0YB+3DsMZrNFmYcdWSfIWSmPSAHaCuYM0nf0MSTOP4?=
 =?us-ascii?Q?6UYZkeCC7dC7wIvH4L1OsdLyZskxL9MUb3RkXdyi5HKwQiDqm0X2z20BZXAg?=
 =?us-ascii?Q?VV9ONzc6kdSSaMQ4+JOZUNSmdj4BfmW3tO0pr51PcM5E9Ukztzontfnhn2yU?=
 =?us-ascii?Q?BPPLNpudoUK/QYttp2rv52KtfzQEUcSW9YoezNPoqIcS20gukEVlsJaAHDDu?=
 =?us-ascii?Q?FDSC1w5vembSIGs4YgCLeor/OfZ6g30VdozPGlDltXFzO2hFgRrJkq0jSW0o?=
 =?us-ascii?Q?sO1fbb7rAIDKbF3D70v8P/HwRfbqhEEBOyav?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NhjUWwmvQSuJWVS/7anyGalISFH7T52spDSrecmlTzCXjQyrCdzU+XvrOh4n?=
 =?us-ascii?Q?FrvxRmpLbhQ81nSPwdcpkZt9fizhEieyqgMTHfSWl/tRWKJqEsMaY+JuXRz/?=
 =?us-ascii?Q?Nu7HK1nZTNafh1rEozHaVn/9tCJ9u0qV/gb5rbl+UfpCpMndHxFnFQ5pocbO?=
 =?us-ascii?Q?ZtjjSun0VHc86zDoxrEF9q2cvMTsrD9Tny2J33PSMXVLgiUjODmCsDTqTfwg?=
 =?us-ascii?Q?VOiAYYThCTPlG+di5WHP8kMQp7uKh672xdvTciakA3y2h0xKjukV2q/Yu/9f?=
 =?us-ascii?Q?f2GtFaaRe77BKtxinu4aPxhGFusZNSEMq+tcacTY1DicdU1jfR3PWkPeO9ZL?=
 =?us-ascii?Q?rBRPSFoY+YYfD5dvUovRDl/ZCQ3zTmb5oKT10cH9ZcPbWgbSBErPPplMREkN?=
 =?us-ascii?Q?QS91FGT7bDPKOdcV5NZDrihmGRggDwymqfvhKfR+XjIc9ytdPtzP2AZHJEH3?=
 =?us-ascii?Q?NeAqEJvhysHFPHLJGzy/e8j7Xfzfxf7XwPXWV4rhRI/MrjUViI6lQ61raQOh?=
 =?us-ascii?Q?fTnrsajNhB8ZK3wc3h6YDHMNMGvszCgXIm7l2EOSti63s/0oVgk7bVfyLcBk?=
 =?us-ascii?Q?CqeplQG2KEbkIX+EE1/GSoqcPvn7hsCW2AOs5eJezHbdq12cIArrjFw5JCdS?=
 =?us-ascii?Q?8mepXdW4zQYVBP2QAuuzXlfrRFow+00YTrPbbBRXS/4yLkuua22FK3fJzN2b?=
 =?us-ascii?Q?Xv7I2aih/U+jTpRVtWs066fx28jwXta/I9rwKpUCkuu1TdR9jpN54V3av1Uy?=
 =?us-ascii?Q?OFWJX4k3tf8ewWKIT4YqaIom9LFHknO2hypEXAyQ4Ve5oDWhHqsfH9Qj8JTG?=
 =?us-ascii?Q?K8lSHsQJEVyEoJJLEBOuY0NuxI+mAt1rgBO3glr3gJ4xTIwbK2PGGWp39GM+?=
 =?us-ascii?Q?oF35K7QQ8GHFMTDyZExTLe7E0JoreBBOHMh0V8oB0G8OJCxt0EjxpCDbsGwj?=
 =?us-ascii?Q?JNju8RMzNag2/FfNmCcBFBLrcZisZUvAJbkMbHiAgf8DYTY5f8Ig1twYr7O+?=
 =?us-ascii?Q?5orPjg/t2xWwXxrelO0LkAjkUyQ/2uovb1knqQcY3GeqZRTGjr99FI7ZCnRW?=
 =?us-ascii?Q?cYzp+8coR1QXYvCjYMktKr1pmcgBUIWx4ZwjIfL+zosE3d+eqdM/bwu/fUZv?=
 =?us-ascii?Q?eIazXD041DKxRMIG3GEC1rfEOqa9L3ZJyI4812j16qtTwWmsgNqaM70q34oc?=
 =?us-ascii?Q?1+T4fVFUq/k3h3HWEcF/VXL00pL8zHxylAmqIvJoN8H0lqDzmAn8opBeqng/?=
 =?us-ascii?Q?7lCS1yB7NDVbVEUCKr++hZmS0MMffai1MTE0a0AR2RdlaNTQ8DRxL2ifU4fV?=
 =?us-ascii?Q?R7PH2vbLe4Mt7AKl2BewFRg2I/N/7VVcwCZfTwQZwc+Q1i8aMQgzY0zjlmsF?=
 =?us-ascii?Q?aX74HRUIelIk/IdMAdA83JyeFA0gAwHbdEayjRi9QfCtCVMa3Q7kT7817IHB?=
 =?us-ascii?Q?sgoo02VpCAGQcePyS7cJaex5BFy/cOhKFQqptFieIvYPGBa6DB2ZiggCw6XX?=
 =?us-ascii?Q?tp2IkPi/nD5GxLJuHybUIT9R7FpJWP/0DtQb7wYQryRKVx8l/sptK7g5PA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2b23ae-fe7d-4f99-beec-08de3d9f733c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 19:06:57.5272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQEtUbECNa4HbSFNHc7dMOlUKphyXioxzp9wt5P00+GFUZaa5/LqZE0RdvDntkpC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228073

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Adam Duskett via lists.openembedded.org
> Sent: den 15 december 2025 11:21
> To: openembedded-core@lists.openembedded.org
> Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
> Subject: [OE-core] [PATCH v4 2/7] libtoml: new recipe

The name of the recipe is "libtoml11", not "libtoml".

//Peter

>=20
> DNF5 requires libtoml. As such, copy libtoml verbatim from
> meta-openembedded to openembedded-core.
>=20
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../0001-Remove-whitespace-in-operator.patch  | 46 +++++++++++++++++++
>  .../libtoml11/files/run-ptest                 | 12 +++++
>  .../libtoml11/libtoml11_4.4.0.bb              | 38 +++++++++++++++
>  5 files changed, 98 insertions(+)
>  create mode 100644 meta/recipes-devtools/libtoml11/files/0001-Remove-whi=
tespace-in-operator.patch
>  create mode 100755 meta/recipes-devtools/libtoml11/files/run-ptest
>  create mode 100644 meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 8971b9b552..da642ac3c5 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -405,6 +405,7 @@ RECIPE_MAINTAINER:pn-libsoup =3D "Unassigned <unassig=
ned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libssh2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libssp-nonshared =3D "Khem Raj <raj.khem@gmail.com>=
"
>  RECIPE_MAINTAINER:pn-libtasn1 =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> +RECIPE_MAINTAINER:pn-libtoml11 =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-libtest-fatal-perl =3D "Tim Orling <tim.orling@kons=
ulko.com>"
>  RECIPE_MAINTAINER:pn-libtest-needs-perl =3D "Tim Orling <tim.orling@kons=
ulko.com>"
>  RECIPE_MAINTAINER:pn-libtest-warnings-perl =3D "Tim Orling <tim.orling@k=
onsulko.com>"
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 09613294d6..ec0e2d1637 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -40,6 +40,7 @@ PTESTS_FAST =3D "\
>      libtest-needs-perl \
>      libtest-warnings-perl \
>      libtimedate-perl \
> +    libtoml11 \
>      libtry-tiny-perl \
>      libusb1 \
>      libxml-namespacesupport-perl \
> diff --git a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace=
-in-operator.patch b/meta/recipes-devtools/libtoml11/files/0001-Remove-whit=
espace-in-operator.patch
> new file mode 100644
> index 0000000000..c8c9922d55
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-ope=
rator.patch
> @@ -0,0 +1,46 @@
> +From dee78f822d8a5b985e565e5c1ef42a59557aa8fc Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 7 Mar 2025 11:35:46 -0800
> +Subject: [PATCH] Remove whitespace in operator""
> +
> +Clang 20+ errors about this whitespace.
> +
> +Fixes
> +include/toml11/impl/../fwd/literal_fwd.hpp:22:26: error: identifier '_to=
ml' preceded by whitespace in a literal operator declaration is deprecated =
[-Werror,-Wdeprecated-literal-operator]
> +|    22 | ::toml::value operator"" _toml(const char* str, std::size_t le=
n);
> +|       |               ~~~~~~~~~~~^~~~~
> +|       |               operator""_toml
> +
> +Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/285=
]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + include/toml11/fwd/literal_fwd.hpp   | 2 +-
> + include/toml11/impl/literal_impl.hpp | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/toml11/fwd/literal_fwd.hpp b/include/toml11/fwd/lit=
eral_fwd.hpp
> +index e46612c..82f62b7 100644
> +--- a/include/toml11/fwd/literal_fwd.hpp
> ++++ b/include/toml11/fwd/literal_fwd.hpp
> +@@ -19,7 +19,7 @@ inline namespace literals
> + inline namespace toml_literals
> + {
> +
> +-::toml::value operator"" _toml(const char* str, std::size_t len);
> ++::toml::value operator""_toml(const char* str, std::size_t len);
> +
> + #if defined(TOML11_HAS_CHAR8_T)
> + // value of u8"" literal has been changed from char to char8_t and char=
8_t is
> +diff --git a/include/toml11/impl/literal_impl.hpp b/include/toml11/impl/=
literal_impl.hpp
> +index e8298c2..067d4ed 100644
> +--- a/include/toml11/impl/literal_impl.hpp
> ++++ b/include/toml11/impl/literal_impl.hpp
> +@@ -115,7 +115,7 @@ inline namespace toml_literals
> + {
> +
> + TOML11_INLINE ::toml::value
> +-operator"" _toml(const char* str, std::size_t len)
> ++operator""_toml(const char* str, std::size_t len)
> + {
> +     if(len =3D=3D 0)
> +     {
> diff --git a/meta/recipes-devtools/libtoml11/files/run-ptest b/meta/recip=
es-devtools/libtoml11/files/run-ptest
> new file mode 100755
> index 0000000000..9bc480aa7f
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/files/run-ptest
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +cd tests
> +for atest in test_* ; do
> +    rm -rf tests.log
> +    ./${atest} > tests.log 2>&1
> +    if [ $? =3D 0 ] ; then
> +        echo "PASS: ${atest}"
> +    else
> +        echo "FAIL: ${atest}"
> +    fi
> +done
> diff --git a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta/re=
cipes-devtools/libtoml11/libtoml11_4.4.0.bb
> new file mode 100644
> index 0000000000..38786b79ed
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "TOML for Modern C++"
> +DESCRIPTION =3D "toml11 is a feature-rich TOML language library for \
> +               C++11/14/17/20."
> +
> +HOMEPAGE =3D "https://github.com/ToruNiina/toml11"
> +
> +SECTION =3D "libs"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D44d1fcf70c7aa6991533c38daf7be=
fa3"
> +
> +PE =3D "1"
> +
> +SRCREV =3D "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
> +SRCREV_json =3D "8c391e04fe4195d8be862c97f38cfe10e2a3472e"
> +SRCREV_doctest =3D "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
> +
> +SRC_URI =3D "git://github.com/ToruNiina/toml11;branch=3Dmain;protocol=3D=
https \
> +           git://github.com/nlohmann/json;destsuffix=3D${BB_GIT_DEFAULT_=
DESTSUFFIX}/tests/extlib/json;name=3Djson;branch=3Ddevelop;protocol=3Dhttps=
 \
> +           git://github.com/doctest/doctest;destsuffix=3D${BB_GIT_DEFAUL=
T_DESTSUFFIX}/tests/extlib/doctest;name=3Ddoctest;branch=3Dmaster;protocol=
=3Dhttps \
> +           file://0001-Remove-whitespace-in-operator.patch \
> +           file://run-ptest \
> +"
> +SRCREV_FORMAT =3D "json_doctest"
> +
> +
> +inherit cmake ptest
> +
> +EXTRA_OECMAKE +=3D "-DTOML11_PRECOMPILE=3DON \
> +                  -DTOML11_BUILD_TESTS=3D${@bb.utils.contains("DISTRO_FE=
ATURES", "ptest", "ON", "OFF", d)} \
> +"
> +
> +ALLOW_EMPTY:${PN} =3D "1"
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
> +}
> --
> 2.52.0



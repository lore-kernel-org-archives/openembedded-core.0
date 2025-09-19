Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D323FCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 22:49:26 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.45])
 by mx.groups.io with SMTP id smtpd.web11.2967.1758322163229349504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 15:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=O3YM/18V;
 spf=pass (domain: axis.com, ip: 52.101.66.45, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgJJuHUz22t0N/ZjHh468r8ZGCirUb+M1s9RA50fuozFz+3FNWt+LRoLevjE34TvT/3OHqmQ0EFX+Re6Ak9qsirUReTHFjTsxQfVWRwBDUjzH9joH8jjbn1e1TCYOGmlCme30NsOGIMFrRVS15LQX6g1TxCOxX6128l1NVj/thi1oe5PTPYQlJT27NHGhIeY6m407JvolIpw+/dytGQkt6vSQJI0UM4H7sp+S57WM3sM58FqV0Zwok5qAyMDrT/2qSAV+kIYfoDougL2oN0HWJ8ZZqBwmkarlVmuuA2NQl7QWD27DQYEEllVu1dNzIL5rmGw+1te+Wj0u/iV33XXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N/UgJ1pfiStSbR13j5natGDAzachsI15RAWkA1oe2M=;
 b=jgt5Jd6AB5rW9BLJH48pOZzPDrRUOipBqrEkw+jCxJ0Py2JLAyweIroTDab0psEFnLvFfvJdf0u+f8i53XltRDZGs4WrZL28jobH32ApHH4A93e7Og3QuRvs+mZ1X8D8V2y9ncKzFTWf1mSrY84MlTcKRzL4Qg9l/R6YZ2c5K+qdDNL6wG0arCTRbWqAI00wflGKmnQNnITSoPRohWX8XcuDanwNg+fWuttnNEMG4Rns9edRmG4O3YIhExyy6AUgPVkPgsYAWJN698YwaLLECpUE3NEFopMgaNBvs0IH97Ku7mV+aDHhqxU1z8uuBoxOp48wJ+kmCeKIr1EsW6tWfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N/UgJ1pfiStSbR13j5natGDAzachsI15RAWkA1oe2M=;
 b=O3YM/18Vfy3pMe+ukgx5F/LCkoS7RkPgKhILM4oWKDsM5Ef92r8r/Kx9yVyX/xyWwwTTcApuPD3VPmQcczE0i5vK+ZoVzioXZqZyyxjaQTmOXC2yyOReAJfScMvfmWUBpekhbknzGTSdNJOIB8z9YoTqJ7ZbeTHAr/+4qXtBPe4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA4PR02MB6941.eurprd02.prod.outlook.com (2603:10a6:102:107::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 22:49:19 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9137.016; Fri, 19 Sep 2025
 22:49:19 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 9/9] debug_build.inc: support disable debug build for
 specific recipe when DEBUG_BUILD is enabled globally
Thread-Topic: [PATCH 9/9] debug_build.inc: support disable debug build for
 specific recipe when DEBUG_BUILD is enabled globally
Thread-Index: AQHcKTrONaM83ib1b0yNI92h+cPFnrSbDIUg
Date: Fri, 19 Sep 2025 22:49:19 +0000
Message-ID: 
 <DB5PR02MB1021356EDD3D66E0803B0A4C6EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <1865A7D84B34509F.11775@lists.openembedded.org>
 <20250919075536.1744673-1-hongxu.jia@windriver.com>
In-Reply-To: <20250919075536.1744673-1-hongxu.jia@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB6941:EE_
x-ms-office365-filtering-correlation-id: 2c86856d-ea34-4713-f354-08ddf7cec4e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?heRm/2G6GNEkvLac4/2mY6dKMfMeoCeh541IqBJWAjoUVt4lqOxhyHPrZtvO?=
 =?us-ascii?Q?PhFrKvpiW7GWe7d7aWKNCYegdKyTO0d69SjgxCSUXKkWUIrcVIxqCrx4xnpo?=
 =?us-ascii?Q?9W/5BsWpFifse6D5tHrOS1E0GnZmBHh4kl867iNp+hNJzoPF3uFVlZurK5o8?=
 =?us-ascii?Q?5nQwXFR2ptP7OefHWJFL4xPofBJdeL+qKs1ntGRC7GC31rfMufRp4vXfktgb?=
 =?us-ascii?Q?+TzsTArBdLmb3vm7om1gYojqvfpJK/pKn7ZDgwOe3Hqxc3aqAXN+fs52JZQM?=
 =?us-ascii?Q?acKBAsVTgST3exdi58pk7c0mLtADvgIh0smNUOyvhi/QubMVEM8yhRj0ngyw?=
 =?us-ascii?Q?zf+o88ChBZxo+9QxAaLZPuqfh14DXowzWmp9MlgKkPAgAcza4P7XmfkCI/hj?=
 =?us-ascii?Q?vsXRC3Xn2gDkKgrfGqo8C6GPs2ZJIfB3AVXj5cXrnnRA6TBcgPOqj58kU/20?=
 =?us-ascii?Q?MOrpnMEn1EQ8RGZsqy1kcjq/5n6iNS5i5pSisYANXL6RfGgKfkD7U9+Wkx8E?=
 =?us-ascii?Q?HeUyU1YCLwt27EswnDCOtEZgycrfvi8V+hIwR94Zx6pK8HSCltEuaOBt8umN?=
 =?us-ascii?Q?3vwi5OMnW3afs9FZkeZPgeEUegIvKePfevMRfihYsjMnN8ysVScX8D8NIQ9s?=
 =?us-ascii?Q?455NK/hT2FcvQoTaeQG+CmsoqUPkOjMIDcsifW/QcQFPNe3fU1opzfb9j/TG?=
 =?us-ascii?Q?DOQDixzdeohFdHyHWxzCUrcHCbOUZ6LnZUDXb47aYvonMYELwBMp0pZ9HZMz?=
 =?us-ascii?Q?roVOLPC/hKNJA8BTmHsUFqAdG0h/hA5GVyga7mT1QFfRpP/s+evaNf0hfuWS?=
 =?us-ascii?Q?26FI1ydRo60Pp4/9ucv5c4+i63DIAQ34btvezbc5H25DiIcp77QLGQVcYkl3?=
 =?us-ascii?Q?B8Gyewq/sKbMNF2j8YOg7I9tv68vm+dz+Sw7NeLYUK2KojnEa+BuhFlClg4n?=
 =?us-ascii?Q?FO2wKjT53/YjEpDcFaxWZX5u5kgEH6oGfLvV5a8b6QqcfZq7JECwPjenLJJc?=
 =?us-ascii?Q?J0GCm3+2/LClBIkCwi95k+Y4CvMwmGji4HixOWOfUeuW7m7nNRfkV1M+tKms?=
 =?us-ascii?Q?y1kR8KN/A3ckqIHXAHTwGKhgYwOZuo7JpcHnVmzcDwtkcdXUq8JMuzihD9ta?=
 =?us-ascii?Q?6OnVSlL50KG/+cqvUXnx/uua1vxIqZ32GhZstIkXEtQ+z2yCIcTdrRemy3K2?=
 =?us-ascii?Q?9B+RDDfrSzQ6XUASTxjihxKQvwdtiFt1blkpy0UbT0HGbHf6XR81X5TsVmSw?=
 =?us-ascii?Q?WWPiGbfXRXdke/f62G8Ru/qzylkJ7f8bFpvuA82Kq6TAFqjx/5sSoLeuZNYe?=
 =?us-ascii?Q?/JXPR0zmIcmf2P2Om4scUdZS5MzLtxrCeLdxlKZ/8JYmEwLrafEtpjR5U3Do?=
 =?us-ascii?Q?oIUgO9mfB6LVn/sWGZaRS7GkStxFfMW9aNdpgIhcKxnqq212c5rabNGI8Rjy?=
 =?us-ascii?Q?zFFmFp9KOdY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?by+IPE/WsrN6JLTLbnDM6ypzErngOydYuP7ur92h3stqZziZqVRBYzSQfS/O?=
 =?us-ascii?Q?abKxTZeBr2/JxKSG0ER4plgErN/WlZax+P072zcuQNwioWxhqIiJ/BvPbPbP?=
 =?us-ascii?Q?vLp5Pt5QvbAyl5BcHvfhnTq7O02WA+upro1k9oEbOc99W6McGVAShTsLp5AZ?=
 =?us-ascii?Q?hFIBYt/sTSFmd1AYovJO7fQ4YzNrPP1ghRpnz29XNIlc7/7sKHKpmpofqdvt?=
 =?us-ascii?Q?KegkFEE7X0VnvLrJxdexi5grvGf7PPnha40l3aWB8sEQUGICe7xTPdNaTxJb?=
 =?us-ascii?Q?RyOC8/JPZmiyioTVjtn5sIiUnp4aRtKu2MK1LyaVzmPeKHYv3JxfehCuDwa9?=
 =?us-ascii?Q?nOlI8j3wKRmIe2yJ8SGdZJ2tQXfCt25Iysi/dKfB8i3cqDGTbVgG1Z6SbRxi?=
 =?us-ascii?Q?4HZYi2+QXToDsvaex5ZuTQBXBW1mdMejPkxnFxjjhjBO//whoo1D83vMZFW4?=
 =?us-ascii?Q?Aaw5iJQXlFtiBH6F8M/cqloqy7171V+NKsOfgdGcoZbJ/c/YnnVUrn2ymkaW?=
 =?us-ascii?Q?Sl7shLcWf/eWwJxIomqFT46ahbumTF9JSB6Rx8ORvvCcozsQOf9pLMGJ/V1A?=
 =?us-ascii?Q?n1KrbQHSZXuzwJRCTVwJlkidUQ0xinE3ztT8Nn1PBRAMn5EKCvFVlk4Xz8tB?=
 =?us-ascii?Q?2r764q+oNT6MRLt868A/0dm4YkRlvEfeBg3Z2qECRuFvIHwSwRTwtlHdYImC?=
 =?us-ascii?Q?WskhYEbR8pBmjmLyOj1M64s0WOwkLi4QoditBAZWU6gJF5peOfaf1EQoOGip?=
 =?us-ascii?Q?NE3vxayjBpwzmiapK1RdHzsJ/TN7BMKHrDexPtruTvQwwkxo3RHO8RreqAVO?=
 =?us-ascii?Q?0V6HlX+ScpDreRTFyIMAYcm6HxaOqqVSrYu5dDMCWn+sbieP8BRFxHgSYT9f?=
 =?us-ascii?Q?2rFU6ZlXu0UYyWkRooECxdIKP2WdnKC0sgo4t4dg3KHDO9Y6JhknVkL26WhQ?=
 =?us-ascii?Q?/TiiD4R4Fzm1Ih11O28GoaKtpwA2g/FAQAarSeylcS9+X4HYoXFEeQPhtYHD?=
 =?us-ascii?Q?qz2mESJkpRN5yDCK4xEWoBZg16xnKDGzu3vjJGtl/rsYsMnbX3q8iCTOF7kK?=
 =?us-ascii?Q?s9BlVXbOMGxJp8OXEzVZ+lRCbIk4USmqulPcHsx/3O+PCFfN+EqcqAF2wMUi?=
 =?us-ascii?Q?qAFx72qiYyhgArtEICZCTU0cwDjrR/oOGSq9t8b2mXhsA3GMoYMz6S9fN/ze?=
 =?us-ascii?Q?5VtpHMEBxEPIkj8WSIZXBUP75lSzluI04q1d9xKLFlFdpZRwf/4YGo6jJDaF?=
 =?us-ascii?Q?0kKZwRTwAqml1hUpIT5bUKBWpI4mnueZeaktES3VZuzf2BCNqrKR5z5afWxa?=
 =?us-ascii?Q?+cNXqyK0qIZXFReZgOxDvtqUDGTtJ5Tn3Xw/nwXbCcg7KEOWRoAR3L5PNi1e?=
 =?us-ascii?Q?DM4jCEhJc3kJW8i3oFyv7dJ7JC/1v+pI+/LYPryFqxcETld0QkRSS2o3RQt1?=
 =?us-ascii?Q?06lnN0sF9qbQXfmPHcDOKqU/+K3quajKJlFWmMwiGODfcOCPqhpbmBEDLIVj?=
 =?us-ascii?Q?ZPpDAzEyX3t259g5/wyIR/LVCASm29VUsVADp6wrzPf5If9DsK4Wp1Ygww?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c86856d-ea34-4713-f354-08ddf7cec4e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 22:49:19.4571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qnGJuNztszbcDUaMbNW2CEcU3zKM98+1Pr2famEtJvytx0Smwzu9jXebULbl1pH8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6941
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 22:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223775

> -----Original Message-----
> From: Hongxu Jia <hongxu.jia@windriver.com>
> Sent: den 19 september 2025 09:56
> To: openembedded-core@lists.openembedded.org; Peter Kjellerstedt <peter.k=
jellerstedt@axis.com>
> Subject: [PATCH 9/9] debug_build.inc: support disable debug build for spe=
cific recipe when DEBUG_BUILD is enabled globally
>=20
> While setting DEBUG_BUILD =3D "1" in local.conf, the debug build is
> enabled globally. For the recipe (such as qemu) which doesn't work
> without optimization, we have to set DEBUG_BUILD =3D "0" in the recipe.
> In this situation, conf/distro/include/debug_build.inc is included,
> although set DEBUG_BUILD =3D "0" in qemu recipe, the debug build is still
> enabled for qemu and break qemu build.
>=20
> This commit sets SELECTED_OPTIMIZATION, BUILD_OPTLEVE and
> BUILD_OPTIMIZATION conditionally according to the value of
> DEBUG_BUILD, then disable debug build for specific recipe
> could work
>=20
> Also move DEBUG_BUILD setting from qemu.inc to debug_build.inc
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Unfortunately, I think this defeats the purpose of this whole=20
change. :( I.e., when parsing debug_build.inc you should know=20
that DEBUG_BUILD is set to 1. If that is not the case, then=20
what's the point of moving everything to that file? You would=20
still have to check DEBUG_BUILD for every variable you modify.

Here is a solution I came up with that would maintain the=20
property that debug_build.inc is only included if DEBUG_BUILD=20
is set to 1 for a given recipe. Add this to bitbake.conf:

INHERIT +=3D "debug_build"

Then create meta/classes-global/debug_build.bbclass with=20
this line:

inherit_defer debug_build_deferred

and create meta/classes-recipe/debug_build_deferred.bbclass=20
with this line:

include_all ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_b=
uild.inc', '', d)}

Having to have the two bbclasses to defer the include_all=20
so that debug_build.inc is only included if DEBUG_BUILD is=20
actually set for a given recipe is a bit awkward, but it=20
seems to work. At least with my quick test I could modify=20
DEBUG_BUILD in a recipe and debug_build.inc would only be=20
included when it was set to 1.

//Peter

> ---
>  meta/conf/distro/include/debug_build.inc | 18 +++++++++++++++---
>  meta/recipes-devtools/qemu/qemu.inc      |  4 ----
>  2 files changed, 15 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/=
include/debug_build.inc
> index 81b6a5f234..c3f19666e6 100644
> --- a/meta/conf/distro/include/debug_build.inc
> +++ b/meta/conf/distro/include/debug_build.inc
> @@ -1,10 +1,14 @@
>  # Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD=
 is enabled.
>  DEBUG_OPTLEVEL ?=3D "-Og"
>  DEBUG_OPTIMIZATION =3D "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
> -SELECTED_OPTIMIZATION =3D "${DEBUG_OPTIMIZATION}"
> +SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', '=
DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
> +SELECTED_OPTIMIZATION[vardeps] +=3D "DEBUG_BUILD"
> +
>  # compiler flags for native/nativesdk
> -BUILD_OPTLEVEL =3D "-Og"
> -BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL} -g"
> +BUILD_OPTLEVEL =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og', '-O2', d)}=
"
> +BUILD_OPTLEVEL[vardeps] +=3D "DEBUG_BUILD"
> +BUILD_OPTIMIZATION +=3D "${@oe.utils.vartrue('DEBUG_BUILD', '-g', '', d)=
}"
> +BUILD_OPTIMIZATION[vardeps] +=3D "DEBUG_BUILD"
>=20
>  # The modern compilers and code seem to require extra steps to avoid DEB=
UG errors,
>  # this file collects debug tuning configuration to address DEBUG errors.
> @@ -53,3 +57,11 @@ MESON_BUILDTYPE ?=3D "debug"
>  # For cargo.bbclass
>  BUILD_MODE ?=3D ""
>  BUILD_DIR ?=3D "debug"
> +
> +# Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.=
html
> +# upstream states qemu doesn't work without optimization
> +DEBUG_BUILD:pn-qemu =3D "0"
> +DEBUG_BUILD:pn-qemu-native =3D "0"
> +DEBUG_BUILD:pn-qemu-system-native =3D "0"
> +DEBUG_BUILD:pn-nativesdk-qemu =3D "0"
> +
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> devtools/qemu/qemu.inc
> index 2ee76e9a7c..7bd28dbbb5 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -58,10 +58,6 @@ COMPATIBLE_HOST:mipsarchn32 =3D "null"
>  COMPATIBLE_HOST:mipsarchn64 =3D "null"
>  COMPATIBLE_HOST:riscv32 =3D "null"
>=20
> -# Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.=
html
> -# upstream states qemu doesn't work without optimization
> -DEBUG_BUILD =3D "0"
> -
>  do_install:append() {
>      # Prevent QA warnings about installed ${localstatedir}/run
>      if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/=
run; fi
> --
> 2.34.1



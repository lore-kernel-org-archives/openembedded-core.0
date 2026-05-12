Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374D6CD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 19:28:49 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83797.1778614122273347432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 12:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=nVlma1iw;
 spf=pass (domain: axis.com, ip: 40.107.130.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A150exmrbXjfpneTwgclBDXm2IbD/bNaXGECzcl+1gTXShYtdUr/R0fBRq6zZlwa1H7rV2u2v5/ekAi7dLxZ3I0Ii8jAWugX7LODAI6j2i2o2Rfh21pntvQ+S4eRH1zVwDbgagdaBlhYMqSYWT7cf0haEYz9e4VLhkySOkROLhOVnHdHv0cco7s75eQtEN2ZqSFzQOesyPie+umTJjHAegUcG74QfXuPnX9qvYEiUiglDDcMdjKTTPtPJjNZR6Y8zEl1ZiQODr2amRFTz0SvXbLIWJK/8hzD7LQjY7T7Orwh++AcfbUOLaG8VqtvO8GcX9mNSZCQl4IaXiIlnc2btQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ytVMtJNv1xES8cos7Q+DL3dFnqY1tIgrT4/WNx3jGM=;
 b=oTSYhGnBOiKIXCJaM2h5ry/WnDmNGaysk3zUZLgri6wQOpBpNOMG/5BAfG28HTvUEjktq6onVyguOwGrckDmJC5qcn4U4YGyNyDDWdcLrVsroS2WqQwH/DQN88VWSTLffVDFHhHQ91dlabaXzLx1V+2lKHUVG9PYmH6xUbT3orLHb4W05JFZkjUSbp7FkN2idSnl1DiYyOG9kPiRVVwAJeVxVdTC7jM0woUvFLQe1+nXWMdXptyX4S+PCPyyShKYtqU8+r2V7sj6zdg4aNwrnqzjr1cSd+TewY7XseB7lk7NtqbWS97rTqm6sNcB6DDkE15gw5UKFQs2gO3viSzcKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ytVMtJNv1xES8cos7Q+DL3dFnqY1tIgrT4/WNx3jGM=;
 b=nVlma1iwhAdOtqBa2gukiArRJgttcbIj2v8euR4gJPuPYewL+BPHdQpO5Xd09JSBZdtQy2l/G9PImiP1ftp/IDjJ3FxmLAbM9fgSpBkT7vyc7XzgVhaeWcqE89qEcDB1kbSZCKKiMmjv/X+UUUyoMnrNYpnAXqgryGbP0n/bq1Y=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB10018.eurprd02.prod.outlook.com (2603:10a6:10:462::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 19:28:36 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 19:28:36 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "tarun@centricular.com" <tarun@centricular.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "sebastian@centricular.com" <sebastian@centricular.com>,
	"nirbheek@centricular.com" <nirbheek@centricular.com>
Subject: RE: [OE-core] [PATCH] gstreamer1.0-plugins-rs: add new package
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-plugins-rs: add new package
Thread-Index: AQHc4U5J4oTVJia71kmMCvdVkusZOLYKimaw
Date: Tue, 12 May 2026 19:28:36 +0000
Message-ID: 
 <DB5PR02MB10213B7E2D21553836D68AAE2EF392@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260511133450.50595-1-tarun@centricular.com>
In-Reply-To: <20260511133450.50595-1-tarun@centricular.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB10018:EE_
x-ms-office365-filtering-correlation-id: 18728548-6127-4042-77c0-08deb05ca9e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|13003099007|38070700021|3023799003|11063799003;
x-microsoft-antispam-message-info: 
 DKdUNT6fs1WfBdd7BLlVHrCXEURTl53tIGBzCbNrc64IUaF0Fu/G9eQCOGyfnE5NR74qGOF5a2udDVM8DIIWdS0A0Irhzjov6qbCVkjlDFKYX5wxEH7bFDLMed/41ysh89kdYzgiiANt5GO8HFIgdg1qHbSVPzHZtAln2q57Dx6Zg8i3R/UqfOUkM5ZQzERzbargp/Y6KX/C8LDuCoY4OXFvBMrN01Ff02JYm7u3oJnGicSth/7AgPhJiawU+KRBA99iZ9j7Zo7A+CyS+HtExz99J7MrdHzVuPSphDdg3U3yLdCYEVuaJsueOp2nrZBtA9KedM7/EUKwAZBYACUgDhiRrlBH5h5wKaoQkrXfukOD03moEAIqPlTfrAhEgfxWoC0Cxlyt8HnMNaNAr/5/eP/TGxhybzqNK5GP2kiZV4ESzEele5g8lvGlJnLg82Hue7dEKepk61mUZIsyORSsVM3QU3VePB3yPV1RbeKHXqYmYAd//W8Rcevxmv8ehGD/zNo7Wm65/0sL9W8wCptVWwDElCiZrlIsOSRY5Wal9RR6Drf6T7KbgqKWpSuQA5Uzp86YeWMPmcwpzrRNVc5E5/Gr/J3yHRW2XNIiONZLDT6KmpTX6OFbAACWJUdBZaZZpshtmX1UQKuplZ35w8HkgnwodEoWOl9GOFQkt+moBcVr6CvIxKCW7wsaq1WkIaFWdkI1tsfJdshXYS4fL/lJhA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(13003099007)(38070700021)(3023799003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?29A1zZCv8AuvDaAxuhb7/BwJRx/mFmCrWr6We5CN4jJyMyNFuFTkBafYKPM9?=
 =?us-ascii?Q?npQcr/dTPoSGV6xVOi7ED8D3XZUt5ATGAnJ+RelDMnVP3D6S7DluzsOruh5w?=
 =?us-ascii?Q?LLCjLN6AEyc1kmuBoQZy7PpIrXTTZIJnMO821uk9AV1ZMOJelUm0t9fAN5SY?=
 =?us-ascii?Q?subUnWd/b6UsODbBun/l8+NRkmATxLgh/laZF2o6h1YRVX589WH24EElWfta?=
 =?us-ascii?Q?rmuDGt9LCsJ0ePXv29EKZtvxuN6vkleVvfU7fU1lGlfLCyi5c0xSc3ZW6G+z?=
 =?us-ascii?Q?Nuh7cTRIbPhUCtxRXNcXsvFNeKsBUEWo8m45sDrWVFdXad6Ud+i6w5CA7/S4?=
 =?us-ascii?Q?VfCch2ldL0U2SX9bDAl8UKeQl5M+/+NtQCyWSYXuvEZj+VOGlXVSILlfZ07i?=
 =?us-ascii?Q?LonP5mCYDug8zmPTxiJjksFeIbC62oydBJZ18iI0Q2Xyjmv1YHnk8s9j1M1z?=
 =?us-ascii?Q?MJfYtC4QsimGNtnD51+e8vaX4BA3ajLGs+q/stBxBuGvz7R5FkKYVO6vHF1a?=
 =?us-ascii?Q?yqSBT8gTniWsZFFqDl0EfWvk5vKc46HAinRsGZGjXKE7T3J8HYWTa1uSADxW?=
 =?us-ascii?Q?BAG3tymfzJCXqGOkXTUaFcRO4wGqxbr4tEgqbdP5+G9+DXfGGOSKuPuo8CTI?=
 =?us-ascii?Q?fIni4Dtb3831tZTOFuuCsmhrA+pTmdXQYfEP/HsKxuIscc2kHUihc/PtinHF?=
 =?us-ascii?Q?PhCNMxHUoNRqczqw1lzhn4ezDMIDUPw4zweMUAOUGBpIsqLpz8lw+NrLBZkn?=
 =?us-ascii?Q?YNMQY865aLxJ4HtDHUjvDMdDf22vwuqL32sTtbM3bbnTgBIoq/vzifKAfAEE?=
 =?us-ascii?Q?Hl3K/zJ6opXKnIaPCaZtKwzH8/CVmYIu2ZVD5+4iwvfgPr9Km19vBHXHsQyd?=
 =?us-ascii?Q?Pw2C9t/6G8imv7H2yNbcDB2FpgYUsPwGWei8HtrYLDAU8/EeGDdh4AgB+aJy?=
 =?us-ascii?Q?qNiPtBuwtCarP03IvmYFGGRpeqGq/UtJyRL8uk9hp4MyuedLl7uRNJhWOzX6?=
 =?us-ascii?Q?hLDawmn/4uRuUwC3Oj33/NdTlmb5m8+rkR/nfC/rFyS33W6LAYCk6M9rlrZm?=
 =?us-ascii?Q?7Q0N2tX9kXUxYE2lE/FEy3KkhuD7lDFG5z8ZO9lqDt723ui3jptcriSd75q4?=
 =?us-ascii?Q?HokAe37UqDRIzvWwdzJNETg0yFIn6PTTrsEeiUvTCuerjGZM6tU4+fDNie+D?=
 =?us-ascii?Q?VaLoLFf9wAf0MuKHllCJUoXOXR4FfMPo5OINvYFoMDt0SscWjsYqjFk+4APx?=
 =?us-ascii?Q?Bu6GUcc949YnXehSgAdMMFHv35qbAkJSsz/T05DxxQ2oVw641b0OlWCZ3yaY?=
 =?us-ascii?Q?Hhbj89fOiklt579iLD33YLy4BIejgFhF0mtbZWXTbiRaMESs3zmpY8w5ynl3?=
 =?us-ascii?Q?6KHLyL/7mD7llCbpPYh1a3w4jhBafydkcdi0/nrO5cdtWP7Qu2S1Y3rAEJFk?=
 =?us-ascii?Q?/C5ZJ0VKNAj7nvzo9xL5D71K1mDWmggT0o3qifhA2H4GUQMvi1fo1HthEko6?=
 =?us-ascii?Q?V5jtD5w2e9lP4T8qvMRcfq5xJHmyZSCfBMae/BuCeNpthVVnFul5aTKxYMaD?=
 =?us-ascii?Q?GWsj4WFeNrM03cjVwhYdw6ihKtzciPJNClIuH9KL8u794lWx674jlUNkKtcR?=
 =?us-ascii?Q?L55bKdphTfl0f+Wm9CclVKDkK9+C8e7tC8IsycmbXaa+FpUhvT5M4gK+cU72?=
 =?us-ascii?Q?bgy8nktiI7T1hGUkNSCiUwgZkro=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18728548-6127-4042-77c0-08deb05ca9e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 19:28:36.6760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GubTkl37VkshuKrXIEgfxH1jRIiYE5PhRRKtm8yZVPyxgFmpggeOolGlSOlbh5Jn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB10018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 19:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236911

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Taruntej Kanakamalla via lists.openembedded.o=
rg
> Sent: den 11 maj 2026 15:35
> To: openembedded-core@lists.openembedded.org
> Cc: sebastian@centricular.com; nirbheek@centricular.com; Taruntej Kanakam=
alla <tarun@centricular.com>
> Subject: [OE-core] [PATCH] gstreamer1.0-plugins-rs: add new package
>=20
> Adapted from an existing patch:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.6=
0232-5-brgl@bgdev.pl
>=20
> Update the recipe to track the latest upstream release of the official
> GStreamer Rust plugins.
>=20
> Extend do_configure to handle the virtual manifest, as this is a
> Cargo workspace project.
>=20
> Unlike the other GStreamer submodules, the Rust plugins follow a
> separate release cycle and versioning scheme. These plugins are fully
> stable and required for a fully-featured GStreamer installation, as most
> new features and plugins are being written in Rust. They are also shipped
> by multiple Linux distributions such as Fedora.
>=20
> Based on patch by: Bartosz Golaszewski <brgl@bgdev.pl>
>=20
> Signed-off-by: Taruntej Kanakamalla <tarun@centricular.com>
> ---
>  .../gstreamer1.0-plugins-rs-crates.inc        | 1940 +++++++++++++++++
>  .../gstreamer1.0-plugins-rs_0.15.2.bb         |  339 +++
>  2 files changed, 2279 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-rs-crates.inc
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-rs_0.15.2.bb
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs-cr=
ates.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs-crates=
.inc
> new file mode 100644
> index 0000000000..6440360a5d
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs-crates.in=
c
> @@ -0,0 +1,1940 @@
> +# Autogenerated with 'bitbake -c update_crates gstreamer1.0-plugins-rs'
> +
> +# from Cargo.lock
> +SRC_URI +=3D " \

[cut]

> +"
> +
> +SRC_URI[addr2line-0.25.1.sha256sum] =3D "1b5d307320b3181d6d7954e663bd7c7=
74a838b8220fe0593c86d9fb09f498b4b"

[cut]

> +SRC_URI[zstd-sys-2.0.16+zstd.1.5.7.sha256sum] =3D "91e19ebc2adc8f83e4303=
9e79776e3fda8ca919132d68a1fed6a5faca2683748"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.=
15.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.2.=
bb
> new file mode 100644
> index 0000000000..f3bdb51e4e
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.2.bb
> @@ -0,0 +1,339 @@
> +SUMMARY =3D "GStreamer Rust Plugins"
> +HOMEPAGE =3D "https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
> +LICENSE =3D "MIT & MPL-2.0 & Apache-2.0"
> +
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE-MIT;md5=3Db377b220f43d747efdec40d69fcaa69d \
> +    file://LICENSE-MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123dad \
> +    file://LICENSE-APACHE;md5=3D1836efb2eb779966696f473ee8540542 \
> +"
> +
> +SRC_URI =3D " \
> +    git://gitlab.freedesktop.org/gstreamer/gst-plugins-rs;protocol=3Dhtt=
ps;branch=3D0.15;name=3Ddefault \
> +    git://github.com/gtk-rs/gtk4-rs;protocol=3Dhttps;branch=3D0.11;name=
=3Dgtk4-rs;destsuffix=3Dgtk4-rs \
> +    git://github.com/gtk-rs/gtk-rs-core;protocol=3Dhttps;branch=3D0.22;n=
ame=3Dgtk-rs-core;destsuffix=3Dgtk-rs-core \
> +    git://github.com/rust-av/ffv1.git;protocol=3Dhttps;nobranch=3D1;name=
=3Dffv1;destsuffix=3Dffv1 \
> +    git://github.com/rust-av/flavors;protocol=3Dhttps;nobranch=3D1;name=
=3Dflavors;destsuffix=3Dflavors \
> +    git://gitlab.freedesktop.org/gstreamer/gstreamer-rs;protocol=3Dhttps=
;branch=3D0.25;name=3Dgstreamer-rs;destsuffix=3Dgstreamer-rs \
> +"
> +
> +SRCREV_default =3D "1d5931d5f28d4f7bc9dc53e53f2852c3d716044c"
> +SRCREV_gtk4-rs =3D "12259c689cf3278ace2b82452cbcaba8c4942020"
> +SRCREV_gtk-rs-core =3D "484fbe01e74fc880cf9d5ed10c33a38747044a42"
> +SRCREV_ffv1 =3D "bd9eabfc14c9ad53c37b32279e276619f4390ab8"
> +SRCREV_flavors =3D "833508af656d298c269f2397c8541a084264d992"
> +SRCREV_gstreamer-rs =3D "3d56963cfca15dffd2a34d2be91ceefa6ad3fc40"
> +
> +SRCREV_FORMAT =3D "default_gtk4-rs_gtk-rs-core_ffv1_flavors_gstreamer-rs=
"
> +
> +inherit cargo cargo-update-recipe-crates pkgconfig
> +
> +require ${BPN}-crates.inc
> +
> +DEPENDS =3D " \
> +    glib-2.0 \
> +    gstreamer1.0 \
> +    gstreamer1.0-plugins-good \
> +    gstreamer1.0-plugins-bad \
> +    gstreamer1.0-plugins-base \
> +    gst-devtools \
> +    gtk4 \
> +"
> +
> +# This fix appends to the cargo_common_do_patch_paths to correctly handl=
e
> +# workspace git dependencies (repos with virtual manifests).
> +#
> +# The default cargo_common.bbclass generates [patch] entries that point
> +# to the workspace root, which causes:
> +#   "found a virtual manifest at ... instead of a package manifest"
> +#
> +# TODO: this logic could be added in the original cargo_common_do_patch_=
paths
> +# function of cargo_common.bbclass file in a generic way. Some care need=
s to
> +# be taken to make it traverse through all the subdirectories (like
> +# gstreamer-rs/gstreamer-gl/x11, gstreamer-rs/gstreamer-gl/wayland etc) =
and fetch the
> +# package names and their paths correctly
> +#
> +python cargo_common_do_patch_paths:append() {
> +    import re
> +
> +    cargo_config =3D os.path.join(d.getVar("CARGO_HOME"), "config.toml")
> +    workdir =3D d.getVar("UNPACKDIR")
> +
> +    with open(cargo_config, 'r') as f:
> +        content =3D f.read()
> +
> +    # Remove auto-generated [patch] sections for workspace repos
> +    content =3D re.sub(r'\[patch\."https://gitlab\.freedesktop\.org/gstr=
eamer/gstreamer-rs"\][^\[]*', '', content)
> +    content =3D re.sub(r'\[patch\."https://github\.com/gtk-rs/gtk-rs-cor=
e"\][^\[]*', '', content)
> +    content =3D re.sub(r'\[patch\."https://github\.com/gtk-rs/gtk4-rs"\]=
[^\[]*', '', content)
> +    content =3D re.sub(r'\[patch\."https://github\.com/rust-av/ffv1\.git=
"\][^\[]*', '', content)
> +    content =3D re.sub(r'\[patch\."https://github\.com/rust-av/flavors"\=
][^\[]*', '', content)
> +
> +    with open(cargo_config, 'w') as f:
> +        f.write(content)
> +
> +    gst =3D workdir + "/gstreamer-rs"
> +    gtk_core =3D workdir + "/gtk-rs-core"
> +    gtk4 =3D workdir + "/gtk4-rs"
> +
> +    with open(cargo_config, 'a') as f:
> +        print(f'[patch."https://gitlab.freedesktop.org/gstreamer/gstream=
er-rs"]', file=3Df)
> +        print(f'gstreamer =3D {{ path =3D "{gst}/gstreamer" }}', file=3D=
f)
> +        print(f'gstreamer-allocators =3D {{ path =3D "{gst}/gstreamer-al=
locators" }}', file=3Df)
> +        print(f'gstreamer-analytics =3D {{ path =3D "{gst}/gstreamer-ana=
lytics" }}', file=3Df)
> +        print(f'gstreamer-app =3D {{ path =3D "{gst}/gstreamer-app" }}',=
 file=3Df)
> +        print(f'gstreamer-audio =3D {{ path =3D "{gst}/gstreamer-audio" =
}}', file=3Df)
> +        print(f'gstreamer-base =3D {{ path =3D "{gst}/gstreamer-base" }}=
', file=3Df)
> +        print(f'gstreamer-check =3D {{ path =3D "{gst}/gstreamer-check" =
}}', file=3Df)
> +        print(f'gstreamer-gl =3D {{ path =3D "{gst}/gstreamer-gl" }}', f=
ile=3Df)
> +        print(f'gstreamer-gl-egl =3D {{ path =3D "{gst}/gstreamer-gl/egl=
" }}', file=3Df)
> +        print(f'gstreamer-gl-wayland =3D {{ path =3D "{gst}/gstreamer-gl=
/wayland" }}', file=3Df)
> +        print(f'gstreamer-gl-x11 =3D {{ path =3D "{gst}/gstreamer-gl/x11=
" }}', file=3Df)
> +        print(f'gstreamer-net =3D {{ path =3D "{gst}/gstreamer-net" }}',=
 file=3Df)
> +        print(f'gstreamer-pbutils =3D {{ path =3D "{gst}/gstreamer-pbuti=
ls" }}', file=3Df)
> +        print(f'gstreamer-rtp =3D {{ path =3D "{gst}/gstreamer-rtp" }}',=
 file=3Df)
> +        print(f'gstreamer-sdp =3D {{ path =3D "{gst}/gstreamer-sdp" }}',=
 file=3Df)
> +        print(f'gstreamer-tag =3D {{ path =3D "{gst}/gstreamer-tag" }}',=
 file=3Df)
> +        print(f'gstreamer-utils =3D {{ path =3D "{gst}/gstreamer-utils" =
}}', file=3Df)
> +        print(f'gstreamer-validate =3D {{ path =3D "{gst}/gstreamer-vali=
date" }}', file=3Df)
> +        print(f'gstreamer-video =3D {{ path =3D "{gst}/gstreamer-video" =
}}', file=3Df)
> +        print(f'gstreamer-webrtc =3D {{ path =3D "{gst}/gstreamer-webrtc=
" }}', file=3Df)
> +
> +        print(f'[patch."https://github.com/gtk-rs/gtk-rs-core"]', file=
=3Df)
> +        print(f'cairo-rs =3D {{ path =3D "{gtk_core}/cairo" }}', file=3D=
f)
> +        print(f'cairo-sys-rs =3D {{ path =3D "{gtk_core}/cairo/sys" }}',=
 file=3Df)
> +        print(f'gdk-pixbuf =3D {{ path =3D "{gtk_core}/gdk-pixbuf" }}', =
file=3Df)
> +        print(f'gdk-pixbuf-sys =3D {{ path =3D "{gtk_core}/gdk-pixbuf/sy=
s" }}', file=3Df)
> +        print(f'gio =3D {{ path =3D "{gtk_core}/gio" }}', file=3Df)
> +        print(f'gio-sys =3D {{ path =3D "{gtk_core}/gio/sys" }}', file=
=3Df)
> +        print(f'glib =3D {{ path =3D "{gtk_core}/glib" }}', file=3Df)
> +        print(f'glib-macros =3D {{ path =3D "{gtk_core}/glib-macros" }}'=
, file=3Df)
> +        print(f'glib-sys =3D {{ path =3D "{gtk_core}/glib/sys" }}', file=
=3Df)
> +        print(f'gobject-sys =3D {{ path =3D "{gtk_core}/glib/gobject-sys=
" }}', file=3Df)
> +        print(f'graphene-rs =3D {{ path =3D "{gtk_core}/graphene" }}', f=
ile=3Df)
> +        print(f'graphene-sys =3D {{ path =3D "{gtk_core}/graphene/sys" }=
}', file=3Df)
> +        print(f'pango =3D {{ path =3D "{gtk_core}/pango" }}', file=3Df)
> +        print(f'pango-sys =3D {{ path =3D "{gtk_core}/pango/sys" }}', fi=
le=3Df)
> +        print(f'pangocairo =3D {{ path =3D "{gtk_core}/pangocairo" }}', =
file=3Df)
> +        print(f'pangocairo-sys =3D {{ path =3D "{gtk_core}/pangocairo/sy=
s" }}', file=3Df)
> +
> +        print(f'[patch."https://github.com/gtk-rs/gtk4-rs"]', file=3Df)
> +        print(f'gdk4 =3D {{ path =3D "{gtk4}/gdk4" }}', file=3Df)
> +        print(f'gdk4-wayland =3D {{ path =3D "{gtk4}/gdk4-wayland" }}', =
file=3Df)
> +        print(f'gdk4-x11 =3D {{ path =3D "{gtk4}/gdk4-x11" }}', file=3Df=
)
> +        print(f'gdk4-win32 =3D {{ path =3D "{gtk4}/gdk4-win32" }}', file=
=3Df)
> +        print(f'gsk4 =3D {{ path =3D "{gtk4}/gsk4" }}', file=3Df)
> +        print(f'gtk4 =3D {{ path =3D "{gtk4}/gtk4" }}', file=3Df)
> +        print(f'gtk4-macros =3D {{ path =3D "{gtk4}/gtk4-macros" }}', fi=
le=3Df)
> +
> +        print(f'[patch."https://github.com/rust-av/flavors"]', file=3Df)
> +        print(f'flavors =3D {{ path =3D "{workdir}/flavors" }}', file=3D=
f)
> +
> +        print(f'[patch."https://github.com/rust-av/ffv1.git"]', file=3Df=
)
> +        print(f'ffv1 =3D {{ path =3D "{workdir}/ffv1" }}', file=3Df)
> +}
> +
> +do_configure:append() {
> +
> +    # Remove any existing patch sections of gtk-rs-core
> +         sed -i '/\[patch\."https:\/\/github\.com\/gtk-rs\/gtk-rs-core"\=
]/,/^$/d' ${UNPACKDIR}/gstreamer-rs/Cargo.toml
> +         sed -i '/\[patch\."https:\/\/github\.com\/gtk-rs\/gtk-rs-core"\=
]/,/^$/d' ${UNPACKDIR}/gtk4-rs/Cargo.toml
> +
> +    GTK_CORE_PATCH=3D"
> +[patch.\"https://github.com/gtk-rs/gtk-rs-core\"]
> +cairo-rs =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/cairo\" }
> +cairo-sys-rs =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/cairo/sys\" }
> +gdk-pixbuf =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/gdk-pixbuf\" }
> +gdk-pixbuf-sys =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/gdk-pixbuf/sys\=
" }
> +gio =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/gio\" }
> +gio-sys =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/gio/sys\" }
> +glib =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/glib\" }
> +glib-macros =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/glib-macros\" }
> +glib-sys =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/glib/sys\" }
> +gobject-sys =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/glib/gobject-sys\"=
 }
> +graphene-rs =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/graphene\" }
> +graphene-sys =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/graphene/sys\" }
> +pango =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/pango\" }
> +pango-sys =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/pango/sys\" }
> +pangocairo =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/pangocairo\" }
> +pangocairo-sys =3D { path =3D \"${UNPACKDIR}/gtk-rs-core/pangocairo/sys\=
" }"
> +
> +    echo "$GTK_CORE_PATCH" >> ${UNPACKDIR}/gstreamer-rs/Cargo.toml
> +    echo "$GTK_CORE_PATCH" >> ${UNPACKDIR}/gtk4-rs/Cargo.toml
> +}
> +
> +# Tutorial
> +PACKAGECONFIG[tutorial] =3D "-p gst-plugin-tutorial"
> +
> +# Version helper
> +PACKAGECONFIG[version-helper] =3D "-p gst-plugin-version-helper"
> +
> +# Analytics
> +PACKAGECONFIG[analytics] =3D "-p gst-plugin-analytics"
> +PACKAGECONFIG[burn] =3D "-p gst-plugin-burn"
> +
> +# Audio
> +PACKAGECONFIG[audioparsers] =3D "-p gst-plugin-audioparsers"
> +PACKAGECONFIG[audiofx] =3D "-p gst-plugin-audiofx"
> +PACKAGECONFIG[claxon] =3D "-p gst-plugin-claxon"
> +PACKAGECONFIG[csound] =3D "-p gst-plugin-csound"
> +PACKAGECONFIG[demucs] =3D "-p gst-plugin-demucs"
> +PACKAGECONFIG[elevenlabs] =3D "-p gst-plugin-elevenlabs"
> +PACKAGECONFIG[lewton] =3D "-p gst-plugin-lewton"
> +PACKAGECONFIG[spotify] =3D "-p gst-plugin-spotify"
> +PACKAGECONFIG[speechmatics] =3D "-p gst-plugin-speechmatics"
> +PACKAGECONFIG[whisper] =3D "-p gst-plugin-whisper"
> +
> +# Generic
> +PACKAGECONFIG[file] =3D "-p gst-plugin-file"
> +PACKAGECONFIG[originalbuffer] =3D "-p gst-plugin-originalbuffer"
> +PACKAGECONFIG[gopbuffer] =3D "-p gst-plugin-gopbuffer"
> +PACKAGECONFIG[sodium] =3D "-p gst-plugin-sodium"
> +PACKAGECONFIG[threadshare] =3D "-p gst-plugin-threadshare"
> +PACKAGECONFIG[inter] =3D "-p gst-plugin-inter"
> +PACKAGECONFIG[streamgrouper] =3D "-p gst-plugin-streamgrouper"
> +
> +# Mux
> +PACKAGECONFIG[flavors] =3D "-p gst-plugin-flavors"
> +PACKAGECONFIG[isobmff] =3D "-p gst-plugin-isobmff"
> +
> +# Net
> +PACKAGECONFIG[aws] =3D "-p gst-plugin-aws"
> +PACKAGECONFIG[deepgram] =3D "-p gst-plugin-deepgram"
> +PACKAGECONFIG[hlsmultivariantsink] =3D "-p gst-plugin-hlsmultivariantsin=
k"
> +PACKAGECONFIG[hlssink3] =3D "-p gst-plugin-hlssink3"
> +PACKAGECONFIG[icecast] =3D "-p gst-plugin-icecast"
> +PACKAGECONFIG[mpegtslive] =3D "-p gst-plugin-mpegtslive"
> +PACKAGECONFIG[ndi] =3D "-p gst-plugin-ndi"
> +PACKAGECONFIG[onvif] =3D "-p gst-plugin-onvif"
> +PACKAGECONFIG[raptorq] =3D "-p gst-plugin-raptorq"
> +PACKAGECONFIG[reqwest] =3D "-p gst-plugin-reqwest"
> +PACKAGECONFIG[rtsp] =3D "-p gst-plugin-rtsp"
> +PACKAGECONFIG[rtp] =3D "-p gst-plugin-rtp"
> +PACKAGECONFIG[webrtc] =3D "-p gst-plugin-webrtc"
> +PACKAGECONFIG[webrtc-signalling] =3D "-p gst-plugin-webrtc-signalling"
> +PACKAGECONFIG[webrtc-signalling-protocol] =3D "-p gst-plugin-webrtc-sign=
alling-protocol"
> +PACKAGECONFIG[webrtchttp] =3D "-p gst-plugin-webrtchttp"
> +PACKAGECONFIG[quinn] =3D "-p gst-plugin-quinn"
> +
> +# Text
> +PACKAGECONFIG[textaccumulate] =3D "-p gst-plugin-textaccumulate"
> +PACKAGECONFIG[textahead] =3D "-p gst-plugin-textahead"
> +PACKAGECONFIG[json] =3D "-p gst-plugin-json"
> +PACKAGECONFIG[regex] =3D "-p gst-plugin-regex"
> +PACKAGECONFIG[textwrap] =3D "-p gst-plugin-textwrap"
> +
> +# Utils
> +PACKAGECONFIG[fallbackswitch] =3D "-p gst-plugin-fallbackswitch"
> +PACKAGECONFIG[livesync] =3D "-p gst-plugin-livesync"
> +PACKAGECONFIG[debugseimetainserter] =3D "-p gst-plugin-debugseimetainser=
ter"
> +PACKAGECONFIG[togglerecord] =3D "-p gst-plugin-togglerecord"
> +PACKAGECONFIG[tracers] =3D "-p gst-plugin-tracers"
> +PACKAGECONFIG[uriplaylistbin] =3D "-p gst-plugin-uriplaylistbin"
> +PACKAGECONFIG[validate] =3D "-p gst-plugin-validate"
> +
> +# Video
> +PACKAGECONFIG[cdg] =3D "-p gst-plugin-cdg"
> +PACKAGECONFIG[closedcaption] =3D "-p gst-plugin-closedcaption"
> +# need dav1d recipe meta-openembedded/meta-multimedia
> +PACKAGECONFIG[dav1d] =3D "-p gst-plugin-dav1d,,dav1d, dav1d"
> +PACKAGECONFIG[ffv1] =3D "-p gst-plugin-ffv1"
> +PACKAGECONFIG[gif] =3D "-p gst-plugin-gif"
> +PACKAGECONFIG[gtk4] =3D "-p gst-plugin-gtk4"
> +PACKAGECONFIG[hsv] =3D "-p gst-plugin-hsv"
> +PACKAGECONFIG[png] =3D "-p gst-plugin-png"
> +PACKAGECONFIG[rav1e] =3D "-p gst-plugin-rav1e"
> +PACKAGECONFIG[skia] =3D "-p gst-plugin-skia"
> +PACKAGECONFIG[videofx] =3D "-p gst-plugin-videofx"
> +PACKAGECONFIG[vvdec] =3D "-p gst-plugin-vvdec"
> +PACKAGECONFIG[webp] =3D "-p gst-plugin-webp"
> +
> +
> +# Default members
> +PACKAGECONFIG ??=3D " \
> +    tutorial \
> +    version-helper \
> +    analytics \
> +    burn \
> +    audiofx \
> +    audioparsers \
> +    claxon \
> +    demucs \
> +    elevenlabs \
> +    lewton \
> +    speechmatics \
> +    spotify \
> +    file \
> +    originalbuffer \
> +    sodium \
> +    threadshare \
> +    rtp \
> +    inter \
> +    streamgrouper \
> +    gopbuffer \
> +    flavors \
> +    isobmff \
> +    aws \
> +    deepgram \
> +    hlsmultivariantsink \
> +    hlssink3 \
> +    icecast \
> +    mpegtslive \
> +    ndi \
> +    onvif \
> +    raptorq \
> +    reqwest \
> +    rtsp \
> +    webrtchttp \
> +    webrtc \
> +    webrtc-signalling-protocol \
> +    webrtc-signalling \
> +    quinn \
> +    textaccumulate \
> +    textahead \
> +    json \
> +    regex \
> +    textwrap \
> +    fallbackswitch \
> +    gtk4 \
> +    livesync \
> +    debugseimetainserter \
> +    togglerecord \
> +    tracers \
> +    uriplaylistbin \
> +    validate \
> +    cdg \
> +    closedcaption \
> +    dav1d \
> +    ffv1 \
> +    gif \
> +    hsv \
> +    png \
> +    rav1e \
> +    videofx \
> +    webp \
> +"
> +
> +# FIXME build errors
> +# PACKAGECONFIG +=3D " whisper csound"
> +
> +# FIXME failing to download skia from
> +# https://codeload.github.com/rust-skia/skia/tar.gz/m145-0.92.0
> +# PACKAGECONFIG +=3D " skia"
> +
> +# TODO no vvdec recipe
> +# PACKAGECONFIG +=3D " vvdec"
> +
> +do_install:append() {
> +     install -d ${D}${libdir}/gstreamer-1.0/
> +     install -m 0755 ${B}/target/${CARGO_TARGET_SUBDIR}/*.so ${D}${libdi=
r}/gstreamer-1.0/
> +}
> +
> +FILES:${PN} +=3D "${libdir}/gstreamer-1.0/*"
> +
> +# Silence package QA errors like:
> +# ERROR: gstreamer1.0-plugins-rs-0.15.1-r0 do_package_qa:
> +# QA Issue: File /usr/lib/gstreamer-1.0/.debug/libgstrswebrtc.so in
> +# package gstreamer1.0-plugins-rs-dbg contains reference to TMPDIR [buil=
dpaths]
> +# TODO: look for proper fix
> +INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
> --
> 2.54.0

AFAICT, there is no splitting of the individual plugins into separate=20
packages as is done for the other GStreamer plugin recipes.
Is this intentional?

//Peter



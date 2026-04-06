Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114BAE64016
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 13:09:27 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54550.1775480957516104530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 06:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=BPhmvP65;
 spf=pass (domain: axis.com, ip: 40.107.162.69, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9pH5yQ8V0tUNHa/1gXdL/VW6bdiIwVGoSpZa9GB2BoBXxBvWXFri/xF69FTRCLvaEt+BQ0YVdlcnBi5JmoGR4sr+brx+vYlSVmLKraQZWwd/asYyMY6Nt/bh6aJbdZWyyNgkkKEN7da7AFrClQD1pxcqoWa5XoTT0j4uKvkJXN0lYWIKP+3wBAUjnJBx+pnBdLdryglMLpCuDd6A6crgjl1m5rbPhY5pLW4aGVfB1XKg09AYz5szdXUTe7NI77BaesCLFSaXrF2295ozOT/pKhnPOyCrLMe0XQqnxzmVVIAzpPUrlhfr7rnQPYcZsDYJMSkFJrDrMLArR/TssI/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwcWd3DXWa7IQGkDYw4EfwiLd98ubFAzz7y6ChibSao=;
 b=h3CucqtTZ6vj6Yc5xFkFGg//kDu5IwXud5aNd0P71AlGbJL4Z10a20tG3AjmkuP5NTVwBxvBW7Y3Ral3H2jP6hFmWEk3mHgRg/nLeLW5LN9wxR3+7p7M3U52KgVARxBNeHSr8heXxbzHQcRg62ycNj7TAnLRehFW2c4TmVyQEpyUAi2Bp9ZkSnLRa+j41PtHw9OyuoPmLHZPo07/titrQjdKTYzYYnIcu0/kDxpYe0lbKIKV20Z144qJL91wwDLeVtP0UCifRo647MtuVpmW8yLzefefD5xbVk/GuddATthEyDSvSvupTMx7Dz3yNrdgf/a7ouMmqwSucgrLui1pMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwcWd3DXWa7IQGkDYw4EfwiLd98ubFAzz7y6ChibSao=;
 b=BPhmvP658UWilXj8ss5VvGGF0oy5z/m6ALZRX2BY/1gxAlDirKf5BF1DWVu6tPRWwEZjouDJfBEAqr+zmQsBpPVSZwgrlrx+bx5I4pWeUVHkEpxnlmxgvfztnf26PFBtznI0S1g7x9f063FTXQCBb5U5MXzuxopz+rUkfOD6Qss=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA4PR02MB7985.eurprd02.prod.outlook.com (2603:10a6:102:2a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 13:09:13 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 13:09:12 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
Thread-Topic: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
Thread-Index: AQHcq8JrmSM+ut1aa0usJT8b8JwZN7XHabnQgArLDNA=
Date: Mon, 6 Apr 2026 13:09:12 +0000
Message-ID: 
 <DB5PR02MB102138C0C905B135CABFD77B5EF5DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
 <20260304103203.1649-10-wangmy@fujitsu.com>
 <18A1AB06FB4E2AAD.263554@lists.openembedded.org>
In-Reply-To: <18A1AB06FB4E2AAD.263554@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB7985:EE_
x-ms-office365-filtering-correlation-id: 86bd02e1-54ab-43e1-b789-08de93ddb28a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 IubVx+3D3/E/PucBKDkW13CPR8ys8lsukXOr3sYHzZkzPHCWNjH86PX7Ic7le7zDMdaw1hOCTY6jxxadjDQO9SxcZWkAzbrWAa5nXuSugwHuTlYdxsLZq2OsjS/xfnhOexOSeuxYBLghyovO54ssnArgtgGiOrlyHd1OmHuGFneZTD4kSU1skw7usLmoan4Ba9u5WXAwDNO0Whieg7+nppz7mW8w6WxfI8EKEnwr6LVl1wEjCUSpEl5gfqWNMS6rAHnCjm0C+CftsV2Wx4mtHJ0TvUOdrfhBgTiyulsJGkflcUAgL9KCu+a5VeZjb31cACbyFgNE4EC3I2HGUtqRiN1PCPSawjyv77gWiDd15qfHSBcUhmCYPLh7wEUAT6JGlmsyVPJ6HBvcn73v33JalrLCX9XySzALH5uiYiRC+3877hT/O4fYoP/BK/C8fxxNCpc5tFcvQwGtaEVZG1YJyZdi4jqEL4HKvISpPz2wG0fUpo1vdTAp0MT0DMdFVcRfndMJ+WQb1yGttDaUtIZr5y+PUN+Ey3Hv/Jwg1YTj+FKtHApR9jWs0xf29YRiDppIGlbsNdXAk8NsPaAPOwXyCdftbZ6hssLoBv5UrOzZfJrp3p8jtsynxPylE9ptnh1BB24x9GjET2tcvJqkfXvSbSssEK5p2VrxCnZq0YvC4l4pCyIF8COPdCYOg3AjDgEHFBLSfJLnD8BhZJXMySHlt4ETPj3e7wGVl4pLmUjSmAU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GP/uLz2DITMmo60YCjliWaYGya1G6XuJMKVgVsDZT2gz6d0Eo1sYV9ajwN/2?=
 =?us-ascii?Q?bLV5yFz/QdRz/pWPPgjfehsz6rDePHD41a2W0enAmOLtij6k/nAg4DUt/nTL?=
 =?us-ascii?Q?JBx2QgfgYZU/NFtoRR2nR6W4+oDqIAcd3vQzIrq1ZjKQc+IR4BknbNKhT1IN?=
 =?us-ascii?Q?EzvYM60ZsmCc4NNJhOd2hbgR9q+pQ1rwNiK+t0nU0QRQClTcPVIc2p1MAkrC?=
 =?us-ascii?Q?yQOrfIgBL2RduuishYMNRI/TfNqzcsDGzCau3RM8AMuBt9WDowcA28rNdPeh?=
 =?us-ascii?Q?2YQG8CzF7Od8fdvGhQmazPkw6Rmbq0GPIbGRTQGynXZJPy3Y81bPUtjQDL7U?=
 =?us-ascii?Q?g1ubGackST68vnr42npyQa+/ZFQ/yQo68SKzDjxKMPOT894i6BwKsS3VSrnx?=
 =?us-ascii?Q?+5ZjC5cD1Thr78tm6FpJc12LIw0rbZ+YFX8LSOZflYCL5pny3ZYk6sY2nvpT?=
 =?us-ascii?Q?Q8FVzuCB1KWJE1lmFUljb6gtmDN7eOz6NJMPyL+JznPKUAWI1zm0+0+B1CiV?=
 =?us-ascii?Q?4qr858GDRw+R/FWXsi5Pqnk3RbdF5fFVWSUqMX46IKSQSPLK84qZK1/gdoFl?=
 =?us-ascii?Q?dkerNGvMqCbbHYC3UWVPstXv2Up+WXRD16qsB6Gc6ucbb995juhTvC2H4R30?=
 =?us-ascii?Q?FHx92+SLDst0rv6lZQXjBVx6in8hudELwCvzaYCwig8580DZS/5fLpqre4rs?=
 =?us-ascii?Q?Wvhbs5rP0gc/urdzh4IqMTdIzcTTRtYfIpYGSCMhZZ8FoEaW7Kn9KwJjoJHr?=
 =?us-ascii?Q?vK7d6mxJFB7GGDi7Po4mcaEJJz4x/pnK3mM9rL9Ec51HxmHD6lrHUZ9dUF42?=
 =?us-ascii?Q?j8/d+HZqgzaFk9G7LcQqhLUB6BCHplB6b4ah+VGL3YWD6MdvrV2sMA/Pt0AU?=
 =?us-ascii?Q?E81kBRU2nTbPRnaq7rNEf14MnqCuWgTHBpkZpkDgxHYHQYaONFzvBnPim3t3?=
 =?us-ascii?Q?Njma2kBPwVghbAiSoaJYniLvAPWLZXgF8g2fm7l4vI1Wa80nc/9rIvhnMNkK?=
 =?us-ascii?Q?ncbGrMXUMBfMH6suCFJQD+r7c4HxsBD4HMpxLr+1e1Nq8F0sNomdpaTX93YH?=
 =?us-ascii?Q?KRw63KEiCnkowEu5tVi1RGv8WZGMaRxQaMAE+kOtJfRT5392jU0vXz7dxlxd?=
 =?us-ascii?Q?1Wyx+deLAZuXwi8bS5aur/lTIWTa25SWopjMosJFLDQ2yYjuwQZc19o8Ca0E?=
 =?us-ascii?Q?hecYwZw88MzdUsiMwk1ooXz8A0YEKQy3fp9rFxoRxCTIDg93dz+LmXAZkoVJ?=
 =?us-ascii?Q?W/ul0DtXVFcHjIVmvB7oZdrfHhzFw6CyFsVM8w1al1jgEhEP2fy5F9rGN1D3?=
 =?us-ascii?Q?vfHHn0ZD3D8R/ZFP5kTyOtwmOzJDyQDPmndR4+7zxR8bMwizSAKBOhnHGZZf?=
 =?us-ascii?Q?cN8rbvbi0YaAP0zwkzrSMI/vmoxbhh9+q2X7CDaMgs20C4vgx1Md15u64R6W?=
 =?us-ascii?Q?v6j4W9ay1D+vQyn5lv/cbA5jpDOGxt4yTRcgVPWT8cm54RqO/n/Eq/mYwXvK?=
 =?us-ascii?Q?5Hp+sSp/Nn0myXDWF8A86J3pk93Q4UUp2fIow3LNRvMaRVOxfsBEjKz7Nq9m?=
 =?us-ascii?Q?rOnJ7VZLfovBdI2nfzQJogSk1cD6UDjeGBrkLtyT4UVWwgsNOMKQonontwIC?=
 =?us-ascii?Q?zdED8Yjcw7o3XkekRVHNVpmUiIxTpY4KxyqvgIKUzYceRTEuGTgBJnUDJZ9S?=
 =?us-ascii?Q?1EdhIAjNof2N9dDMz9Q7NwUIB68=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bd02e1-54ab-43e1-b789-08de93ddb28a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 13:09:12.5181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6nl8waS16gWpucySEW8tVSS3oG+Lh0+6Bua1ZZRiah36xuxE9WN69rQJ9hCd/g8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7985
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 13:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234678

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt via
> lists.openembedded.org
> Sent: den 30 mars 2026 18:23
> To: wangmy@fujitsu.com; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 ->
> 1.28.0
>=20
> What is the status of these patches, which upgrade the GStreamer recipes
> to version 1.28.0?
>=20
> I do not see them on neither master-next nor mathieu/master-next in
> the openembedded-core-contrib repository.
>=20
> //Peter
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of wangmy via lists.openembedded.org
> > Sent: den 4 mars 2026 11:32
> > To: openembedded-core@lists.openembedded.org
> > Cc: Wang Mingyu <wangmy@fujitsu.com>
> > Subject: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > 0002-tests-add-support-for-install-the-tests.patch
> > refreshed for 1.28.0
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  ...2-tests-add-support-for-install-the-tests.patch | 14 +++++++-------
> >  ...treamer1.0_1.26.9.bb =3D> gstreamer1.0_1.28.0.bb} |  2 +-
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.9.bb =3D> =
gstreamer1.0_1.28.0.bb} (97%)
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-=
add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer=
/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
> > index ccfc869813..720a6f0c97 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-sup=
port-for-install-the-tests.patch
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-sup=
port-for-install-the-tests.patch
> > @@ -1,4 +1,4 @@
> > -From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:00 2001
> > +From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:00 2001
> >  From: Jose Quaresma <quaresma.jose@gmail.com>
> >  Date: Sun, 11 Apr 2021 19:48:13 +0100
> >  Subject: [PATCH] tests: add support for install the tests
> > @@ -12,17 +12,17 @@ Upstream-Status: Submitted [https://gitlab.freedesk=
top.org/gstreamer/gstreamer/-
> >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >  ---
> >   meson.build                  |  4 ++++
> > - meson_options.txt            |  1 +
> > + meson.options                |  1 +
> >   tests/check/meson.build      | 22 +++++++++++++++++++++-
> >   tests/check/template.test.in |  3 +++
> >   4 files changed, 29 insertions(+), 1 deletion(-)
> >   create mode 100644 tests/check/template.test.in
> >
> >  diff --git a/meson.build b/meson.build
> > -index 0a77e90..cadfaeb 100644
> > +index 8adc055..b5c9e5b 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -664,6 +664,10 @@ if bashcomp_dep.found()
> > +@@ -667,6 +667,10 @@ if bashcomp_dep.found()
> >     endif
> >   endif
> >
> > @@ -33,10 +33,10 @@ index 0a77e90..cadfaeb 100644
> >   plugins_install_dir =3D join_paths(get_option('libdir'), 'gstreamer-1=
.0')
> >
> >   pkgconfig =3D import('pkgconfig')
> > -diff --git a/meson_options.txt b/meson_options.txt
> > +diff --git a/meson.options b/meson.options
> >  index 39255cf..78af552 100644
> > ---- a/meson_options.txt
> > -+++ b/meson_options.txt
> > +--- a/meson.options
> > ++++ b/meson.options
> >  @@ -16,6 +16,7 @@ option('poisoning', type : 'boolean', value : false,=
 description : 'Enable poiso
> >   option('memory-alignment', type: 'combo',
> >          choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256',=
 '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb b=
/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
> > similarity index 97%
> > rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
> > rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
> > index c66f614629..63633fea05 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
> > @@ -22,7 +22,7 @@ SRC_URI =3D
> > "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
> >             file://0003-tests-use-a-dictionaries-for-environment.patch =
\
> >             file://0004-tests-add-helper-script-to-run-the-installed_te=
sts.patch \
> >             "
> > -SRC_URI[sha256sum] =3D "8ee8772e468102ebe86d414d8c4c7440dd91d9f3e93969=
52ff23aecde80670c8"
> > +SRC_URI[sha256sum] =3D "6c8676bc39a2b41084fd4b21d2c37985c69ac979c03ce5=
9575db945a3a623afd"
> >
> >  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests=
', '', d)} \
> >                     check \
> > --
> > 2.43.0



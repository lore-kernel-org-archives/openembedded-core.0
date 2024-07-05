Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B6CC30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 10:36:07 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.125])
 by mx.groups.io with SMTP id smtpd.web11.14666.1720175761593249682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 03:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=xhkHiHOm;
 spf=pass (domain: navimatix.de, ip: 40.107.249.125, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esiZGOeZREBmIrSAKJDRcBPvZNZrjtgZr2yohG4EljKovuGDVZgvLNhS848zGTDrjV1Rc47UCJSIh8TVdnp2Ni3xSQKD9OhZ1TltfsPtMF5t9BvpuJTPHTwUh1EZ3EZyW/CUdtPhZOVrnnheA2rm4o3BW+ASQuNFhpJp0daH8Dp8U3KLaw3yeiavqym7pSsHYv7gfoBXcqZ30ZUOWXD22Fca7yViRNo5y2rQWM8nXHvvxD5SA5U2JXSwpxBYf7VLzo7Uksf8dt2Tq2BoC9J04BkZnI9h/LKl9bCeFhP3i3AaJMH7i5FTjh6kSVPe7KUjL354571ZpuT3QqXfOl8cXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izyVaqAdlGEqpxhPBgFpbWBqBEhcFv6dLy9BjuMiu4A=;
 b=M0Cfjgo9ZDxbplTxkyNbP8Yx0sPD+besqXOl0NHZ9n7PvVDW8coskAeueazlJ4OnCpXHABxbmjJBTjTai5DCH7CxJrQmzFJ0NYYjKEEfK/tWCL+/oveq2ua0OjOJHxlcZy80cK2blRWdGC1EkGHpRI5vPAt3Nz28HkVkFOCpZxkzNeMDZbbroPzC4lOZnKFGxOb6DDQrA0C3ftazATpwwI3AYzbE5/PNRzM2fpi7rxvNhS4GSV9TfnFUPAl7cNn0iJ0mvdicc5/lCQaF2ojEZ0gB3Fkiif+RpDZycW6gKon5p9KNO094zE+6/55YMfBxBMowa1MaIiBwp5fYhvyEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izyVaqAdlGEqpxhPBgFpbWBqBEhcFv6dLy9BjuMiu4A=;
 b=xhkHiHOm5gT8Vg4M3wx6srjQpC36XU2va/BxqbB+C+VY5NQ+suUg2yL03YN5QY05qB2Cus6gNgPSEsboqWW5+MTnya2UA0n5ciO8h/hcT+HahWtJCp7iTM2XODyYDQzfmrvX1vD7E/x/BnVDuY81AZgYC0+XajaqoaRQ5GV1xBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by PR3PR01MB6859.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:5c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 5 Jul
 2024 10:35:58 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 10:35:57 +0000
Date: Fri, 5 Jul 2024 12:35:55 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] u-boot: set B = WORKDIR/build
Message-ID: <m324bppzigcdxci6tg6hzl5vc74sgjjx6qkgtvg4bsvedob6as@ux4tt3s6uts3>
References: <8ebaf41b89622ecc6b27b140cb8264bf50d15f68.camel@linuxfoundation.org>
 <4641ec5ba60aa447167bbee07fac87a3f6da3aea.1720172390.git.joerg.sommer@navimatix.de>
 <b62c397649ef55f847345288c10db34a372b6f8c.camel@linuxfoundation.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="c4gv2nlwjzzim7ex"
Content-Disposition: inline
In-Reply-To: <b62c397649ef55f847345288c10db34a372b6f8c.camel@linuxfoundation.org>
X-ClientProxiedBy: BE1P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::15) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|PR3PR01MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6e62d0-6332-453f-ae9f-08dc9cde4195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?K0TP23ResOq1tvXy3jOZpLjRBYD50Uyhsv5uZewYdCpuRyw8FN2XhS2kgl?=
 =?iso-8859-1?Q?0uWlgvNr5C9zM/pjSGLF/m/0rH4bnQgTxa5fnMH5RTB6PONrfYfN6SV3FV?=
 =?iso-8859-1?Q?VDYlBG0wHfYu7EVzpmWNzUrx6W9jNXUSE4xGhaTUDcJ34NpaNpV8yoCgxi?=
 =?iso-8859-1?Q?9el0xyHdFVXLJhvW7mtGP6xJpA/SGCrDX0WeeK/Bx5KMKcDlOsQE8DMFxN?=
 =?iso-8859-1?Q?34OnUple+rAT9GDMhmZfDSorqR9tfA2QwLmwYSQ2psOg7gskEqk8g1jTAS?=
 =?iso-8859-1?Q?irqJsTnoOfy7blzB3JhxCH4TsRLNM7/VTPeCycM8W/iJT8hIfiwL7mwck5?=
 =?iso-8859-1?Q?LinkGguG0A2S32ULN4pbBjvG2DFPwy8Bf5hunlknsI9455V7wdfH3wAfn0?=
 =?iso-8859-1?Q?07B5QlUiAFLDe3GFP2mbKHzMKsZAfv1AFlkItabfQjc21cG0wDP+zIWj8M?=
 =?iso-8859-1?Q?XArudAEbY0iB2ZYZDj+2Z8izNi/vP00gMSjF7SCCgZmzyzlJ8ejjLm94yv?=
 =?iso-8859-1?Q?8pwAXpuWygQvZ2WAr4WsTaAKPdqPN5Htcrl99tiy07etqP2FaDUydmdXck?=
 =?iso-8859-1?Q?6NqLxZgiHkl06WFXek874k4jk7V7hszG0Kbbpl6+cYPyQMZrJggBvHNueL?=
 =?iso-8859-1?Q?gFFl7GQ19doTTbwOHTf/BgOTmx5Q9kkvu9xJLdmd0xrSrvM8CgKkk1NwfJ?=
 =?iso-8859-1?Q?R3i8sjYptn/BHJB8TNCnYTCXme8RT6Aa6RDN3wl+CsKTQvNHCR7D6ZFlg6?=
 =?iso-8859-1?Q?84s3JxVzV9gcRFW4Ch2sDF/QCRGo42UTL8Y0G6pYHXLcR25TsBmmX6IDVO?=
 =?iso-8859-1?Q?wMaWMalMjelXjU1dJLFHb60fhlflHdPXW9LnyaYz6UnQ6KsnkTQx47w6cK?=
 =?iso-8859-1?Q?kHLkgu5IVdEXG7IX5xhIyZwIb6gFylsP7Gc6yvZS5tHMZIQzFVHEXolIKX?=
 =?iso-8859-1?Q?sQLR6LLcwpPg3vSaQTvsue28B4FJLedS1NN3/ihYmmQIiOGXRUx8AcifJD?=
 =?iso-8859-1?Q?T0AQyP8cxs+0CcBQ/5oXD2tSFFAhsl/iLBrFClmSIh9inGbAuzAjs5S+sP?=
 =?iso-8859-1?Q?tQzT4W3qihDnSyggzs2JTmnblIli2jyzVkbY4CRp4i8SlCVGOUSBmRR3wy?=
 =?iso-8859-1?Q?P5yUPC9J2rEhCLm4oYvb6WC+G8q145CrBbsp//PrdCxpU8jVRA6bML2d0J?=
 =?iso-8859-1?Q?R2Zu1i8mc2YPLo6kUpmNljPZErZRhuBffr59b4sPFBDJTSsylpCTPyJRtd?=
 =?iso-8859-1?Q?ZurA9TyG0Yb0Q5SUo8C1fgkKvu4r7eps6JLaRZc5QYEA2hLI5aSAWnQFMp?=
 =?iso-8859-1?Q?hQAE7ISCu3kU/g/Nibe1mmbVdFTBhKQKDo750j9u2YKQpVY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?+EJMVOxJKK1evU+1DlF0IWrUCNetl6cJfjMkHLTVd0pEm6sY4QRavDSOpX?=
 =?iso-8859-1?Q?c2i7BBl2w/ONDg9iIhaibWWt3MCnCsKhbSJW202XlZ6/aVgLZbqo7hggN9?=
 =?iso-8859-1?Q?w9fzPXV9ntC6aJW2AvmNW3NXbrBnh6b8B166kHf9aqfBlYk76Tq7S9Jkkr?=
 =?iso-8859-1?Q?kgrPGAI70EwZymas/oU5reimqaSkkQVDcb2DtSVsLmMLWdWZNQrzowkDxD?=
 =?iso-8859-1?Q?GDtY0uGPRuJrKlsuY9gpfkOPGOIqY1kMAv1E3XchyTBR+EqDD/TaYcKsWY?=
 =?iso-8859-1?Q?461KF/go8j0C+yyPTHtbhU4mtYKmDCzg2SZmYcupT0Q1kNCyUA83TzVNO0?=
 =?iso-8859-1?Q?/o59hQjsrqorcnXCeqHp9UfP9JdQ7DXbDBaleI7v0O8hqlgMU5MLlebFkJ?=
 =?iso-8859-1?Q?U7dokQatUdlYMA6DUll40LkN5Y3DTx0o1IZg4HyrVyzbSM/KsOdBMzmEYR?=
 =?iso-8859-1?Q?Nw3wWgWBgcXp1LJr9J2yyqNCZyT6g4r7+BQTOJ4IjT+n8tnq1h2jdKVWlX?=
 =?iso-8859-1?Q?/ZTq1gMN6uFyIUXozphE42hA1tDKiZOsvl2SYBH2Srac6Io8kzt3EktMt+?=
 =?iso-8859-1?Q?Fsp3vkMZInj4qJ6ewgx45GWAPktt+BbpkaIESWB9IuJPZS2Gxous9YItAb?=
 =?iso-8859-1?Q?Leom/zhalR745l3Hs2nfariByqM5B4/r1d4rqEgCnH2SvwlbDO7fM7fPU9?=
 =?iso-8859-1?Q?2k+21HuSU57SPqAJA7KjXS79YMSRUto/Y4O3UnO7ArZ7MH9sYbaoJ5i+M2?=
 =?iso-8859-1?Q?NYiMnbFAUX99/FaGD4sZhml3YRXwleSnUTl+gCFGS1eQPVyIxHYt/58ujo?=
 =?iso-8859-1?Q?e1/gyI6JFnP25dgJ02GBsJyAzuXB4bUB+Tq58mCMYjeu6dqNM7ERbQhQvI?=
 =?iso-8859-1?Q?3ZamlFTfCt0M8bBAyD+n1YPLNel79I+eK/K/teNzESZ7UWyIttDfsdORGC?=
 =?iso-8859-1?Q?smFtbqO8P7SlorVxGePUDO3HGeB44sGcRha8WIuLO+9GB7J58OPtUcnHsi?=
 =?iso-8859-1?Q?71oXeSEeOrIP4aKwjgvG/dEvVkIAeuRAXsh5kTSQmVlgcKQ16v+NCO+npj?=
 =?iso-8859-1?Q?8X6HKFPNeaywCaYpYq0KzHPwTapahtHpluBuzT/Fd2pvypWLxb5wDEkFO1?=
 =?iso-8859-1?Q?zih0AXjTIg56Sd7/aq365+y8S8acEy5QZKrt9ER5z2dgvEBsfPWDyfqBIU?=
 =?iso-8859-1?Q?7bNJDUzgOGDShlmvxd9DBDUNNGKyZpALuGE/wrglrm7xd8+YST4ivRvnGr?=
 =?iso-8859-1?Q?x20B24uUtCnNfS+oGN2zHooIqfXYF7kdZgdmN8ejdXWn/Iquq4C2EQmp+Q?=
 =?iso-8859-1?Q?7gMJkVS/Dw5BKYtY690NvkxzDHFiCerjp1c+mGXIEtbjd1rCtNBiJHAG5W?=
 =?iso-8859-1?Q?s7HhIgZMAkM7xHTOLLi83PpXbrY8ReP32qz6UsYroZgADtnDdNcblMeFuD?=
 =?iso-8859-1?Q?tNV7nU/qg8k51MujH+CZN8FxIETBNkzf5qqbXnEfrlFFPGx9cHnIu3kioW?=
 =?iso-8859-1?Q?bs5aVz2ufiP745g6nwosllgDg2WR2JrRVUKDjhB8sRO5NHq9nO6xdgdVYe?=
 =?iso-8859-1?Q?C4nmA0dSzpJZZZ+fDXOERpSuPeRgJ/8HqV00gx4St1acGZnum3RE3nqdon?=
 =?iso-8859-1?Q?jbOVisiIQi7oy34gihcieZzbzJCM+rztSWnce361Te1NjPBVW4COWjcw?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6e62d0-6332-453f-ae9f-08dc9cde4195
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 10:35:57.7903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jDpZyBn8iIEIIQf1QkfJxEMaIhLEvDmSV2B7nv9KpJwgjMg63do7w8IQGF5GJLiM8SWXj87y1p3H8f/HB6+Avz1XSyZS0Du9Uu3lnaqqw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 10:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201600

--c4gv2nlwjzzim7ex
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH v2] u-boot: set B = WORKDIR/build
MIME-Version: 1.0

Richard Purdie schrieb am Fr 05. Jul, 11:03 (GMT):
> On Fri, 2024-07-05 at 11:39 +0200, J=F6rg Sommer via lists.openembedded.o=
rg wrote:
> > From: J=F6rg Sommer <joerg.sommer@navimatix.de>
> >=20
> > The build of u-boot fails, if `UBOOT_MACHINE` (instead of `UBOOT_CONFIG=
`) is
> > used. U-boot doe not like the setting of `O=3D$S` in the make call, whi=
ch
> > happen when `UBOOT_MACHINE` is used. Therefore, use a dedicated build
> > directory to circumvent the conflict `$B =3D=3D $S`.
> >=20
> > Yocto build message:
> >=20
> > ```
> > > if [ -f /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gnu=
eabi/u-boot-variscite/1.0-r0.fwkos.6/git/.config -o -d /build/tmp/work/da85=
0_funkwerk_rp1_eval_board-fwkos-linux-gnueabi/u-boot-variscite/1.0-r0.fwkos=
=2E6/git/include/config ]; then \
> > > 	echo >&2 "=A0 /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-li=
nux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git is not clean, please run 'm=
ake mrproper'"; \
> > > 	echo >&2 "=A0 in the '/build/tmp/work/da850_funkwerk_rp1_eval_board-=
fwkos-linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git' directory.";\
> > > 	/bin/false; \
> > > fi;
> > > =A0 /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gnueabi=
/u-boot-variscite/1.0-r0.fwkos.6/git is not clean, please run 'make mrprope=
r'
> > > =A0 in the '/build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux=
-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git' directory.
> > > make[1]: Leaving directory '/build/tmp/work/da850_funkwerk_rp1_eval_b=
oard-fwkos-linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git'
> > > make[1]: *** [/build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-lin=
ux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git/Makefile:1928: prepare3] Err=
or 1
> > > ERROR: oe_runmake failed
> > ```
> >=20
> > U-Boot test:
> >=20
> > ```
> > % make O=3D$PWD all
> > make[1]: Entering directory '/home/joerg/git/u-boot'
> > =A0 UPD=A0=A0=A0=A0 include/generated/timestamp_autogenerated.h
> > =A0 Using /home/joerg/git/u-boot as source for U-Boot
> > =A0 /home/joerg/git/u-boot is not clean, please run 'make mrproper'
> > =A0 in the '/home/joerg/git/u-boot' directory.
> > make[1]: *** [/home/joerg/git/u-boot/Makefile:1928: prepare3] Error 1
> > make[1]: Leaving directory '/home/joerg/git/u-boot'
> > make: *** [Makefile:177: sub-make] Error 2
> > ```
> >=20
> > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> > =A0meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
> > =A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-bo=
ot/u-boot.inc
> > index fc36c21ec2..bdc4b60e43 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -9,6 +9,8 @@ inherit uboot-config uboot-extlinux-config uboot-sign d=
eploy python3native kerne
> > =A0
> > =A0DEPENDS +=3D "swig-native"
> > =A0
> > +B =3D "${WORKDIR}/build"
> > +
> > =A0EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PR=
EFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}" V=3D1'
> > =A0EXTRA_OEMAKE +=3D 'HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDF=
LAGS}"'
> > =A0EXTRA_OEMAKE +=3D 'STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} STAGING=
_LIBDIR=3D${STAGING_LIBDIR_NATIVE}'
> >=20
>=20
> I did a little digging as I wondered why this wasn't already the case.
> That variable is set in u-boot-common.inc along with a cleandirs for B.
> Are you able to use that common inc file? I didn't check the situation
> on older releases.

Interesting. So this is a bug in the variscite layer. They supersede the
u-boot-common.inc with there own which does not set B:
https://github.com/varigit/meta-variscite-bsp-imx/blob/kirkstone/recipes-bs=
p/u-boot/u-boot-common.inc

So, we can drop the patch and I ask variscite to fix the issue.

Many thanks for your help!

Kind regards, J=F6rg

--c4gv2nlwjzzim7ex
Content-Type: application/pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIITyAYJKoZIhvcNAQcCoIITuTCCE7UCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBD
aXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVz
dCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMx
MjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVT
ZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoa
vIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgy
miqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43
zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC0x7C7aYivTox
uIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHn
Kav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh
2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMC
AYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRy
dXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEF
BQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0
LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9
FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TE
oGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav
2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tP
bDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3
ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuI
n8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdeb
rMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVn
LernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggWB
MIIEaaADAgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYT
AkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAY
BgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2Vy
dmljZXMwHhcNMTkwMzEyMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMx
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
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggK/MIICuwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjQwNzA1MTAzNTU1WjAvBgkqhkiG9w0BCQQxIgQgguNz/xiY
xFfFvMs3qYwMWAEG/Nqy2YErFaZ6KQfSDUwweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAJWlowgtthUvuaLXXz5uE+pa563wGLuRYZHIFkxdMwzy0Wq4qDygtz3O7WY0lj4to
EVfbqkk9FSlst9Ec1XVMo/KI9ymFlk15FRgEuDYsePlV7oFNyweN2PctScPkE6UFFxT8VX4e
eKFhTpobbsJt89Upzrlh8+QNIQaneY9joXxaDhUp+LWPWenYqpmNoHKI4m3hDbxa1Q+vTm92
WoRV6PJq4R3PJYaQ+nGgiJEW7vdINP9gU3IdzqzO1cse/Hzdv6WhIGPeSDiGTQrZ4af4QyL6
V4GM0Qnvg7IChyJqTKNQ01QOI6Iq75ZmqFO2lWR2ownZTrtSKZsb9JbLhon4vg==

--c4gv2nlwjzzim7ex--


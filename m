Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B82CAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 14:02:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.38])
 by mx.groups.io with SMTP id smtpd.web11.29781.1758463367343228784
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 07:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=rLdLHZZq;
 spf=pass (domain: axis.com, ip: 52.101.70.38, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdVAw9dDJEcuiUJ9+r7KcmnqQsaZMnoC2EwSYsY1ejyZ87Sb/qGfboFkc+fZfrVDubE1bOianz7y9LbpPmAYr3nBFwj7lwPoumilmzNjdgwbcyDlT5eH1ejv7E6VGVtA1uaj2p5Li0XlbQOow/Q9PzRNgGgWYqxIwvCOiVef9op74N97eITzAkftRnjIGvYO7Ju15ThYju3ohQCnvf50uHh/pZI3VBtl+Fr9TWEOW7hfL0HP0ERGjdXq8XKphElZcXS62NBUf5R11qbpk5H1ZpMkTJ1wQy/xLN4g8pZfO1+xWEM/Mp6+zlJwQllAW3TSYyXMt0xeeFiS47oMxD9nAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIcmn+9Mk9UTTZRah5DNLCeBiwjTQFJUzZlxJM/LGpE=;
 b=zQiqx4LIT3sU+lS/OSRWclwn13t9fpCxQW6Mbqgzxfr58hehONlrqcR4WW3yGeIQHOBSK/B84l0RpR9nrJnl2fadcEZRC0/wFFI5oC9zpcrbMXVLEXnzx62S3815Xxpw3F66swNS//U1fS7yT+g3DJFVb+a453905Uyx82QVOt9Sj5dqfXl1WhnSJi7bun61PvMKtS6eZcNceVK8oxl7kgxg88pqVZ69eyXBkIp7t6YFLLmSvAPgwAKFxCiHhwGEuuXD7ysNYxSG4Ler4UEB3tBJoz9DyOgxSGss0Ve+lQiUGs2xbYp373lxMqC8ZvMJisPQi7GFY/o9/omqhezEow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIcmn+9Mk9UTTZRah5DNLCeBiwjTQFJUzZlxJM/LGpE=;
 b=rLdLHZZq724Y0lFgo90nurNTLXuzLCv6BDD7rX8fgueGyp2JgX8otsaMEdTMxZl8kXdB0Q3aulz5VY66+MrszCaqECcfJ8tcSMn313sWTDoxyFJaXC69V16YPfMjc3LLz/UhMpW3uREkGXNyvkpceVa2fnlAFFiJFICnV93FouU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB6647.eurprd02.prod.outlook.com (2603:10a6:20b:25e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Sun, 21 Sep
 2025 14:02:43 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9137.018; Sun, 21 Sep 2025
 14:02:43 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Quentin Schulz
	<foss@0leil.net>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Markus Volk <f_l_k@t-online.de>,
	Trevor Woerner <twoerner@gmail.com>, Ross Burton <ross.burton@arm.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>, Khem Raj
	<raj.khem@gmail.com>
Subject: RE: [OE-core] [PATCH v6 00/14] mesa: lighten up target's libclc
 dependencies and fix panfrost support
Thread-Topic: [OE-core] [PATCH v6 00/14] mesa: lighten up target's libclc
 dependencies and fix panfrost support
Thread-Index: AQHcE2PPW/SDSunr9ke9BftTbscsp7RwiS+AgA3v7YCAHpP1AIAAyxuA
Date: Sun, 21 Sep 2025 14:02:43 +0000
Message-ID: 
 <DB5PR02MB102130537CDDDEAA4535BB826EF13A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
 <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
 <07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de>
 <njiio3x6gcmkr2l66ik2bdcdo5lp65zwc4tdknnredmbtgd6uv@566hczdxilc6>
In-Reply-To: <njiio3x6gcmkr2l66ik2bdcdo5lp65zwc4tdknnredmbtgd6uv@566hczdxilc6>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB6647:EE_
x-ms-office365-filtering-correlation-id: 02d97d06-e99e-4ab0-a604-08ddf91788fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?8ojz9B0KqRZG3hP9ZNqXB5VdEg3sfVBuDve0znH0UgDaueFsGdVZ4VPItsMU?=
 =?us-ascii?Q?mv2WriLdSMhUCZTJI7sVhO+GcVCsSrZtng1E8DKLKvL4/SeI2ZcSir0WfEmU?=
 =?us-ascii?Q?wJjKVY20xEq0UO+DFXg2//UEHNSJWTcYhvglSj1bdUCGfGOt8MYGa3YWhiaC?=
 =?us-ascii?Q?Iwab/UpOSVLOaGhjfNxFvvPLQ4qVrGQy+fxvAds2ML4pP253XYXvZ673201I?=
 =?us-ascii?Q?twdbnRzWwSBO70z5p4liLZ+U+KnUc4bvnPpn4F4Mc6CTItEvbLeLG4X9qXlo?=
 =?us-ascii?Q?X1JgYQy7xzYzgTcY/VAYVvacTm3ObaeOdUNy79AqnS75bchfsqBTHlZDFtUc?=
 =?us-ascii?Q?E53Y09wG+unQvSPRUWwc+4axnxoXk9XsjNMk9gwTgFD8SL2DrRW4IX9qXJax?=
 =?us-ascii?Q?BSmPxVbHQFjaUnwfzRdPVVeuy1OCJ9ziv1GIaPXClUm2tFgdUV8o4/Ad8Ezc?=
 =?us-ascii?Q?QtCIMaLeZmQT+CKUV6buUFfbMFFcAsWbyW9UNuNCP/Fij320I4xJdp8Iu+z3?=
 =?us-ascii?Q?2FDhCuIyG1XmdkXkTZDjItrdkMKc1Y+QC5mDbiCsopMrveQYrwrEN7RS650Q?=
 =?us-ascii?Q?GPVa416eBwbwmbaC7p1UjZGPHhcGQKhsOM8wyhwB2sUOCE90kmc5iHviCMSo?=
 =?us-ascii?Q?KbBt+1WQdLEaOldZiKD4JtuSTanxYFX5OfVnt9nWA2eAYkAygmpTkODYemH2?=
 =?us-ascii?Q?8ZeLP9cqrG6UcvqmCks2jASVb/m3DEgV6sLnCqLFDAzftmFVLS7/4BsNM4NO?=
 =?us-ascii?Q?n7cZ0XG83O+disrhnkinkFEwQJbj1xZTZFN5+kHFke+qheEE0gBs2qep00m8?=
 =?us-ascii?Q?wNyzvHNkEQ0tWctg/lx4zkcO0SdOmxCnIaydbRzXYCaWtUWxwwdaWu3yFx/w?=
 =?us-ascii?Q?DpE8k0Af62o1okQ9dFGxazGJm1LbioXvM8yQlIqFiqc6j7bb9MhQIJCZSwnU?=
 =?us-ascii?Q?Qpp4seIaZQQeXggLQEnkxwA2foZ/NoYWe9GxAq1gQqyl31mqup/KjTd276lh?=
 =?us-ascii?Q?1p8WBpgMVEH58h+q3PY6VFD3GWW3Ua1GP91mJjyjA3M3D2P6fq6W9DKsCHJI?=
 =?us-ascii?Q?1n/IppPug0iZf+O+DnOCmxPizFFRVb8GupZyQ/1cRTT54jwL3SG/1TvbqzYk?=
 =?us-ascii?Q?Yb+bG5FQlDZ4g7R07yCyPbKuGbcXHhkC4g2BXbht9xQ2BCO8cnuPknpbrfJM?=
 =?us-ascii?Q?kYdj7yinBpS8O6rUM6u3rp4VkzH/AxUXWQ1EF2bzZg1cVAuz0/loJ2aDDuXA?=
 =?us-ascii?Q?sfB+TXmcjLhPiBbZKjcmDZY1QCCmmL3SuJusXc07zX0EnKKeylBQuTNEKH/G?=
 =?us-ascii?Q?8BPNV6sL+pWsj8OfhZSiotJq/DU7T5T88/NkJLzOENFb0KptR5HpZgRWkQCY?=
 =?us-ascii?Q?CaaH2FCZm8UGkGjdVqpCd3Kr1pS/0NbY30tbWg9mY6TqK1PZ54UZ34/h/w4S?=
 =?us-ascii?Q?qIfAOzbft4M=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4mAOUAhgoLIgdohRTfOMyvmCWH4plKzuBFsYC/+GmvdWyRPvjxz/KrJ/vrHe?=
 =?us-ascii?Q?Ps801dYujMb1c75No40S/EIVFYWfV2idqZWezfqUgVFbPrFWynJ7tO9lZzvK?=
 =?us-ascii?Q?OIDgqW3n/Oe2Pxe9/AIFTYuLg+C3st4Jq58Hk5wrUD5M7HbWtUOOYC/fkCS+?=
 =?us-ascii?Q?ohOURlWCGixf5rg4zS1kYy+BsMYikmq4yqsTqt1A3DT1aaHsm0f52GXS5SJO?=
 =?us-ascii?Q?QGPdNJi129ikyZbPlClUB+6DyIlzUEpVsQabebKwhFKO0oz1/2H0PY8NJWDB?=
 =?us-ascii?Q?hkehM6xPkRc8iuXEJ17OJtcMWS67w35jVbUFncc+ty0pAaI4wXFlHWqZOqtT?=
 =?us-ascii?Q?oAXCoDCjDwWneKlji7cAaGMxQn679IbRXfwJXHYmy6ye2eEaycKokl2iGF5k?=
 =?us-ascii?Q?j1t8qzYRRbZhDl14d8kIfvWU2MglmI4Q1akEduoVg9m8wrxRQYvnmwOdn+X2?=
 =?us-ascii?Q?qofIyQwOsjTcBNy3ntAHEvsxaJqLa1wgu5O3ktZsbVWdtKyGJs1sSc7tzE10?=
 =?us-ascii?Q?MxI0De0uuoAnUlzxq1wFSuWTHfSdzbEQpIbu71t40AlgTq4mHJKHaH+an4ke?=
 =?us-ascii?Q?IQM39ed/c05/Or8rWZc2k+zWT7nAIJEA3k2InC1I/zy6+riMudqZ8sdtr+h5?=
 =?us-ascii?Q?KlXTz3gyjESLWHiTTPLR0SBDMmQkSzyVW/M+3/m8uMPhdkWMewfq2Bmz817M?=
 =?us-ascii?Q?9DNZcFQenw0Z/YUiBwfZB6bNgS/HqaXI5RNt1AHwmw5RFlOu4OhANuqYjGse?=
 =?us-ascii?Q?dC4qFoEGURZY4iMaFKIlCIyJqCw7t9YTh4pTwTCQw3pfNg4oVWk86KVLufC9?=
 =?us-ascii?Q?b1q9DLmElO6zR/8oGmVgtQc1IGOe5/gFK3CGguG4vnGMCYNaXnUjefOTsmPK?=
 =?us-ascii?Q?Hcyixa/3exo3GtupQnDRI9WbM/7qPqUd2viIetBrZHDYVGcAb6xth6e+gCoa?=
 =?us-ascii?Q?yUplPHxBmITZOP/bM79X4Qz8OlW3IxsPHrBlrc70WsN9YjKfcvbGk8gYemY0?=
 =?us-ascii?Q?L1XCJo4pXFSAkkGowvEIazY8mCwq/YL/8AeNDFqKD8XTaFtYrCRNunp1Zy88?=
 =?us-ascii?Q?lA3vbi54CkIocyzxvWCrjGUmDDjxDAt7p98ECUvffgX3Kme8opLaAumymbA5?=
 =?us-ascii?Q?XKbyVdWR51gRLA1LMwNs4VNS8zgv5kHa2rO6ON2I2CLNKhc0aZWQW96efQJ1?=
 =?us-ascii?Q?fsl8y1MTgMtdc18OdFk68LZNaYXVGgVMor39BSy2T//WRb1T2y7YFHRWBNUY?=
 =?us-ascii?Q?2nq1j47+56YOOA8jn4zT+LeWvyEBVzsrWdjGDEo4FX+sZJHaDrRmokCLG4LG?=
 =?us-ascii?Q?zjQSHSZjpvkjTAtr7r4amBFVAzTfA+2U9toOlm8XHq5M2UUBikXTAfT+WS8l?=
 =?us-ascii?Q?E83QocuBR1AAVC8912QfyCr/MoZ0g3ZmZau13J6pC/F0Ho+FjAZgv0xmKcWH?=
 =?us-ascii?Q?nCyrl9HoCkzrHf6zW1jo5bF5+UXaUhkDRk8APiJgVrMTROd0+bTz6fFoa6Ss?=
 =?us-ascii?Q?B65AoulNlSWPQUZld+BG9jIpj007lMWy/u6xy/2AHc7HyFti5c4af8jdow?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d97d06-e99e-4ab0-a604-08ddf91788fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2025 14:02:43.4192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4w0RHVOMxIg6SagDzn9isGP/iRL8fKUYgrjdtHHuOgW8PFukqNvEjrcyTYt7zvPa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6647
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 14:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223796

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Dmitry Baryshkov via lists.openembedded.org
> Sent: den 21 september 2025 03:49
> To: Quentin Schulz <quentin.schulz@cherry.de>
> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; Quentin Sc=
hulz <foss@0leil.net>; openembedded-core@lists.openembedded.org; Markus Vol=
k <f_l_k@t-online.de>; Trevor Woerner <twoerner@gmail.com>; Ross Burton <ro=
ss.burton@arm.com>; Otavio Salvador <otavio.salvador@ossystems.com.br>; Khe=
m Raj <raj.khem@gmail.com>
> Subject: Re: [OE-core] [PATCH v6 00/14] mesa: lighten up target's libclc =
dependencies and fix panfrost support
>=20
> On Mon, Sep 01, 2025 at 04:51:49PM +0200, Quentin Schulz wrote:
> > Hi Mathieu, all,
> >
> > On 8/23/25 8:01 PM, Mathieu Dubois-Briand wrote:
> > > On Fri Aug 22, 2025 at 2:53 PM CEST, Quentin Schulz wrote:
> > > > @Otavio, can I add the new mesa-tools-native recipe under your
> > > > maintainership in meta/conf/distro/include/maintainers.inc, it is a=
fter
> > > > all still mesa?
> > > >
> > > > Panfrost support has been broken for a while already because it now
> > > > requires libclc which isn't enforced by default. This fixes this
> > > > oversight.
> > > >
> > > > While re-adding support for panfrost, the build time for libclc wer=
e a
> > > > bit too much to my taste and I tried to figure out if we could ligh=
ten
> > > > up the dependencies for the target recipe and it seems to be the ca=
se.
> > > >
> > > > libclc brings very expensive dependencies such as llvm and clang.
> > > > Building clang and llvm for each target architecture is very expens=
ive,
> > > > but mesa allows to depend on prebuilt host binaries (mesa-clc and
> > > > precomp-compiler). Those are built by mesa as well, but can be comp=
iled
> > > > in mesa-native instead of mesa, making the dependency expensive but=
 only
> > > > once regardless of the number of target architectures to build for.
> > > > Ideally the mesa-clc and precomp-compiler would only be compiled in
> > > > mesa-native if target mesa requires libclc support, however this is=
 not
> > > > possible as a target recipe cannot impact or depend on a native rec=
ipe's
> > > > configuration. We thus have two choices, always build libclc in
> > > > mesa-native with its heavy dependencies and impact every build or f=
orce
> > > > the user to modify the mesa-native recipe in a custom layer (as a n=
ative
> > > > recipe cannot use target's OVERRIDES). The latter is unacceptable s=
o the
> > > > former seems to be the only option. Another big downside is that
> > > > mesa-native currently builds drivers (amd, nouveau, svga) which we =
may
> > > > have absolutely no interest in building, increasing the build time =
and
> > > > possibly dependencies list).
> > > >
> > > > A third choice is to spin-off the native mesa recipe with libclc su=
pport
> > > > into a new recipe without drivers and only what's necessary to buil=
d
> > > > mesa-clc and precomp-compiler binaries.
> > > > This allows to keep a "clean" mesa-native recipe for whoever needs =
those
> > > > drivers built-in (e.g. for testing, for qemu-native, or whatever el=
se)
> > > > and only bring the libclc dependency when required by the target re=
cipe.
> > > >
> > > > Because libclc is now only built for the host, opencl support now n=
eeds
> > > > to explicitly bring libclc and others to build as libclc won't brin=
g it
> > > > in the build environment anymore.
> > > >
> > > > Note that this was essentially only build tested (run tested on RK3=
588
> > > > with panfrost though).
> > > >
> > > > Note that building gallium-llvm support on big.LITTLE architecture =
with
> > > > TOOLCHAIN =3D "gcc" (the default) currently doesn't work as llvm do=
esn't
> > > > support big.LITTLE architecture in -mcpu/-march which is passed to =
the
> > > > CFLAGS/CXXFLAGS/LDFLAGS via the TUNE_CCARGS. I haven't investigated
> > > > further than that but that prevents us from building opencl support=
 for
> > > > Rockchip most popular and powerful SoCs right now. One option could=
 be
> > > > to force this recipe to be built with clang toolchain only whenever
> > > > gallium-llvm is specified in PACKAGECONFIG (not tested). Though tha=
t may
> > > > be not straightforward seeing the comment in libclc recipe related =
to
> > > > forcing the toolchain to clang.
> > > > I'm also not sure mesa has a way to specify different args to LLVM-=
only
> > > > drivers but that could be another option.
> > > >
> > > > Runtime tested on RK3588 and PX30 with kmscube.
> > > > Partially runtime tested on PX30 with opencl-cts (and rusticl; it f=
ails
> > > > after some time but could be kernel related as it starts failing af=
ter
> > > > [  968.625506] panfrost ff400000.gpu: gpu sched timeout, js=3D1, co=
nfig=3D0x7b00, status=3D0x8, head=3D0xa68d200, tail=3D0xa68d200, sched_job=
=3D0000000019e6f20d
> > > >
> > > > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > > > ---
> > >
> > > Hi Quentin,
> > >
> > > Thanks for the new version.
> > >
> > > It looks like we have a build issue for riscv platforms:
> > >
> > > ERROR: mesa-tools-native-2_25.2.1-r0 do_prepare_recipe_sysroot: The s=
state manifest for task 'expat:populate_sysroot' (multilib variant '') coul=
d not be found.
> > > The pkgarchs considered were: qemuriscv64, allarch, x86_64_x86_64-nat=
ivesdk.
> > > But none of these manifests exists:
> > >      /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-c=
ontrol/manifest-qemuriscv64-expat.populate_sysroot
> > >      /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-c=
ontrol/manifest-allarch-expat.populate_sysroot
> > >      /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-c=
ontrol/manifest-x86_64_x86_64-nativesdk-expat.populate_sysroot
> > >
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/37=
9
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/39=
6
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/36=
2
> > >
> > > Can you have a look at these, please?
> > >
> >
> > Ok so I believe this is because mesa-tools-native uses a different mech=
anism
> > from other mesa recipes to be a native recipe.
> >
> > mesa-tools-native inherits native + -native in the recipe filename.
> > mesa-gl/mesa simply adds native to BBCLASSEXTEND.
> >
> > The issue I believe is that mesa.inc has a DEPENDS with expat (and zlib=
) in
> > it. In the case of BBCLASSEXTEND, non-native dependencies are suffixed =
with
> > -native to be native when building the native recipe. But in the case o=
f
> > inherit native + -native in filename, it doesn't.
> >
> > To validate this, I did a simple
> >
> > DEPENDS:remove =3D "expat zlib"
> > DEPENDS +=3D "expat-native zlib-native"
>=20
> I took a glance. I think it would be more idiomatic to write something
> like:
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> graphics/mesa/mesa.inc
> index ddcf3b774a37..5a303538d7be 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -41,7 +41,10 @@ do_install:append() {
>    fi
>  }
>=20
> -DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native pyt=
hon3-pyyaml-native"
> +DEPENDS =3D "makedepend-native flex-native bison-native libxml2-native c=
hrpath-replacement-native python3-mako-native gettext-native python3-pyyaml=
-native"

Make sure to add a comment here or someone is bound to come along=20
thinking that these can be added to DEPENDS instead because they will=20
automatically be converted for native etc. E.g.:

# Specify these explicitly since this file is included by the mesa-native r=
ecipe

> +DEPENDS:append:class-target =3D " expat zlib"
> +DEPENDS:append:class-native =3D " expat-native zlib-native"
> +DEPENDS:append:class-nativesdk =3D " nativesdk-expat nativesdk-zlib"
>  EXTRANATIVEPATH +=3D "chrpath-native"
>=20
>  inherit meson pkgconfig python3native gettext features_check rust
>=20
>=20
> >
> > and compiling mesa-tools-native on qemurisc64 then worked just fine.
> >
>=20
> --
> With best wishes
> Dmitry

//Peter


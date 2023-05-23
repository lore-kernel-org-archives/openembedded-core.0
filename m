Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA74C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 01:25:06 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.9919.1684805100536134943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 18:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=AE+ib8hN;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1684805100;
  x=1716341100;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7xm4r1z+1N20De3CZT9XHhuAxWOg5zDdRw9Bix4qXTc=;
  b=AE+ib8hNklylOjM5gUpj7DRGdpSzDYca2J+sLdjag97K8RCgaK9/oGba
   8En3L1IcFLkhV4kgiymy/uV22fLfInmoVmDPFzHexV/a+5cw8ABD+fvE3
   sxjpiz67tFPYqfGZdBASOcGf1tHWaX5Ui/VTOsPLaT51m46DFfQteo6hJ
   pVB2QhR0JWKKjIDkthxJFVxsoq+bIH8s+XowAACqo1UWbYnEfak3v2LeF
   CoFcaIrI9owMqUSpbm0ZBq30tyfKW8/55A/ahhecXMREOM0+0Vrnzu5jz
   BmjCCqeIVLA7KRvSIL0keXxBoTuglbjC8iD1j2MmN6nnF0DFeWwjd9AH4
   w==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apNsVG/fwybmPRorwth9w1isZk2zyfcjlnoEViawfLyHCf1eZM2C/kxve7VOSiX0T/dtTf2X2wmHu5r2u2h2w4p/nbrPgUvAMGsNzVSQCAKzm8rCChEByuGFKnGDwQjP/sRuZIGsGIV9hGi5eTWNCxd41451nah4Ch/6p0zGn1yFBGKuCKiLDMM+UthMoQmZZdHBUe1IAm2UFmvJRVbAmEGM/4aXsaq5xNm2zImbeuWIwatpvL/Vz5NJ0vQ6edpE8TA/N4dI/0YW2t2e3TO8FxOZ/KfLmo/MfME/KqvfE0o6gZ5uEW9Uk16VJLN07jZK/0xM4AS1wbaJhKZIkTM4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xm4r1z+1N20De3CZT9XHhuAxWOg5zDdRw9Bix4qXTc=;
 b=EQOH8uHHg/9ITsrgg9FdprafoLUaJshfJ4v3PRKwBA5qQZKgO394oYPqxPG8/H2JR5rpweC5fUMsyBV/ADr3IM8zFB/kLY4QETNZxO3RbR4J72S1gxPbsJxEBQzeQB/kKy3I8wAXWhysQnA2885qQu7plbBtsuVft6BNr0KBaq/y93YvRyx3a3lPBmIiysKLZtoS4bfMDe6JWDARK9EX9d75GeCGt7ZpYsmQpBudkpXW2pi+v9m6DVQqWcGjufkKDAjux31KYPUW0LvEU0GgVFVXltGCOxOZLk/otEenHY7b+4NvEE3GxnteQ3Hsj6FzV7R0+qm2bXwnxqxh6NFgkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xm4r1z+1N20De3CZT9XHhuAxWOg5zDdRw9Bix4qXTc=;
 b=xOvBntv3agmAk9LylbYAOvc8NiA1BfKd5q8iTAP3ooyUj4aHkmQvpK2MEob1qQDOzM+LXcQOGFEL+FLHr3s9wg6TDn+8GoAlTdJ1FDw6Q80zbDH5VsGEG/SdHrU4QsQyDiUo8CQgvO4CQKe4GIkMLWm7vfdHbBaHeo222qW6cmI=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv2 1/2] musl: Correct SRC_URI
Thread-Topic: [OE-core] [PATCHv2 1/2] musl: Correct SRC_URI
Thread-Index: AQHZjRTxdRPPIlcPrEmvvUgKns5dgK9nEAHw
Date: Tue, 23 May 2023 01:24:56 +0000
Message-ID: <AS8PR02MB10201BAFFFFD9FF98C57D3122EF409@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <1761A120CB388357.31708@lists.openembedded.org>
In-Reply-To: <1761A120CB388357.31708@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|DB9PR02MB9826:EE_
x-ms-office365-filtering-correlation-id: 88a6c4a8-b3bd-4394-385d-08db5b2c8474
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RQNFo2xSlg6NRq2jcibNCPCRz8f2SG0Lqe7HTfNIxA4H/Twmrwl/EltDf+THn5vCCGIy4ejnNBg2fftBlXHAYn+ScsY1QNScCc4s+il1/A+hzpKdXTdocYBHyW+9Kn3LHzDQFRaKSuvmoV7Lrar2/iQ7Pf2pXB92Ca2LZDKzGzAGazsf3PxWHIDVJTct9q2+c+YO8h27NQSRZeA6KTGRAeqiRSJK1z0eSMXAxjLRKXtatX0oRDmfPq3nuTfE+QumFLRRf2IrD58Isv3jzbNM5oaNPlReH4x1BTI+3/HsE/0GqhB8QnscYUdNZk7JchoFHF2zlUUTtHwsRQ0BV3HXIdd/QesXD/oJ+5CbcoG3x2YKeJqq7qXhS/D2bAvDRGY1prb4nNq0iEI01S1lFhDXgAmqo6WMJb+5mMrzy6GBg6rqe3ilm0Q0Go5Kmj57fA+69Yr/brtc0WfLkaY2ArpHGS1ecvCu86fpB1ABpRQfRpB0DrXixVvqDdIQuOH6wF3oCBNGTCMXBVBFfSWMZn5Wu/slNvw1IvskmtckZAUjK0mJAu19B63e7Dm1h5wGLlMnc9kEW1WSH9peRXlZFlyFX9tYGHAO99wGytKGlcHJfCjSO7Dv93yhFVxoVzv9bGWT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(8936002)(5660300002)(52536014)(8676002)(83380400001)(33656002)(2906002)(186003)(122000001)(38070700005)(38100700002)(86362001)(55016003)(44832011)(6506007)(26005)(9686003)(53546011)(316002)(71200400001)(66476007)(64756008)(6916009)(66446008)(66556008)(478600001)(76116006)(66946007)(7696005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1hN+uYv5DKhKfW4SfJFvdnnm1sLhZYujWfxXboDYOKvhxcUUGOaSkzfh5Z4e?=
 =?us-ascii?Q?RKXsfoWFRhLldSpCyeXex7IrTZNGNx8/ZXuZ/l9aK4dpn5LN8XzqvYM4n53E?=
 =?us-ascii?Q?uKeb8e4/SCXFRG9Zwa4mZidJT/ZkWj3oLIzH34nYvnTBJSxXh3lyIMbGkgff?=
 =?us-ascii?Q?hRBynQn3dQs0PYJ0Sz9AZCIruCN1Nq5gm6GflAhUYlH3n44GSqsBO01d/awq?=
 =?us-ascii?Q?usSJReVVnNFFx9iMJHDjKQJvIHfNOTy47VkSSUovZIJdTKxgLg9Gul/As9z9?=
 =?us-ascii?Q?77oHTOfWReB01vWuU2AP+2ASsiWsaROCrIpAFz2OOVdNsZJAPgW2D2Z9P+r8?=
 =?us-ascii?Q?N6J9jQIrPY4lks0nosV9HF8ScYJuztnkuhR0wj1pbzZTWXs0mvcrK7pDjUEh?=
 =?us-ascii?Q?Yy4irG4h8Eq/hYkaNIgD/ZOFrm1YyfCtBuEMNLz7DlG1XxgDXwUqZiXDLpUv?=
 =?us-ascii?Q?IkuMgZjUhBWx3oeL6bjFgcXtW0mVpWK/+wyYa+zRkjedZogP5Sx0Wckq2/Nb?=
 =?us-ascii?Q?eaOn4OsF0nQvbkY71o+4gTqcloUnww9M63ZcIaDqjzEx5Kf/SuvnXyq6zzDD?=
 =?us-ascii?Q?QyQ+lPh+WQAKT+QocAFeXeh4Uxn7Ydh69VIDtVJ/ASocXfFtqII2nxkET/q9?=
 =?us-ascii?Q?Fr06kEKPPQqZtfoHNb1Ngbnk/9hrOBrAl2H5AtUClvy89iovOP0s34J7yQ9/?=
 =?us-ascii?Q?KzM6EMjyvf10/MZOX4w0N0LTsO3b253R3oOw3a0itoMF530fcEfy1Lji708W?=
 =?us-ascii?Q?5SsQIXBeEtO4JZ7sXlYHJ2LWzoUv1GbvgPuXTCjDk6ANKtE3R3t6xSlCOQ/k?=
 =?us-ascii?Q?qAJVwF62nFlaPujafD/DqCI34v50AimWzxIONfIHhysLuVQzn08RAflgorHk?=
 =?us-ascii?Q?3E0P53tqkAtBr1VxIyoAH3IdWIunReyOeGWbYIFE8ussRyCe4Y8YxUWs13ow?=
 =?us-ascii?Q?Xd6XWfGduFPgl5+wFMyStb7ldhcLT4kRnEklCk2zoNZDWU1J4HCAwVIJA70f?=
 =?us-ascii?Q?3XTPkXBNCNYCzbemoDtGpf26HfG5YSyhRajF1E8Z+/33Kgkxokw4cP2TsJRF?=
 =?us-ascii?Q?WHahnxaD5jXqNEnvbUQSwBS2W9TOxa+t4+RcMgz8iE3dzi1KROukYr+vrHdH?=
 =?us-ascii?Q?QXlwe5OCPiDWXMe/sUzCwIutbE815zZGU32pwBqpaAWnXelC3vkbZp0b+L+k?=
 =?us-ascii?Q?u3J/B/dW2fgsGM3yusVN/QNMj141FpIB+wid9V16ftr563Xs5mFaETkpFjy2?=
 =?us-ascii?Q?JNYFF9L9qTRz45QNHL8596sn+633D1FT4GHgBMGZK+NqBp1ZJoL9NxowcZGr?=
 =?us-ascii?Q?rGTVD8i2rb2FxmlrlzmzTxW3UNTRooN14JJUncwCAHxMBFfYlrO0c9eWdUVX?=
 =?us-ascii?Q?y/kCurGDUgl9br/XST/coDc6ComyZ7Zt2YCnu65pK68zoXFizj+WqDkDWlaA?=
 =?us-ascii?Q?TKf6fcXfMMtHzZQrDJClhNQhPmWE8eg9WLPD3NI0kIamDMtpkop244w/dP56?=
 =?us-ascii?Q?FY8jRFqOwLibfEltAtnw3bcrf+stycHejeN+MkSotb9C0R48VtMIuuR3fokj?=
 =?us-ascii?Q?rTqdcbKHdOeg1RByVhE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a6c4a8-b3bd-4394-385d-08db5b2c8474
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 01:24:56.1571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1EDHGWP/zvUjD8HniyjPG9RJfCuEeC40pJF1X2ZszS1X+/eyerD/ma2kD+kdif9B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 01:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181623

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 23 maj 2023 03:22
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCHv2 1/2] musl: Correct SRC_URI

Meh. This is actually patch version 1. I just forgot to remove the=20
--subject-prefix option I used when sending the previous patch.

//Peter

>=20
> When the protocol used to fetch the Git repository was changed from
> "git" to "https" in commit 139102a73d (recipes: Default to https git
> protocol where possible), the URI was not updated to match.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
> core/musl/musl_git.bb
> index 19b07d6be9..7c8434f23f 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -12,7 +12,7 @@ PV =3D "${BASEVER}+git${SRCPV}"
>=20
>  # mirror is at git://github.com/kraj/musl.git
>=20
> -SRC_URI =3D "git://git.musl-libc.org/musl;branch=3Dmaster;protocol=3Dhtt=
ps \
> +SRC_URI =3D "git://git.musl-libc.org/git/musl;branch=3Dmaster;protocol=
=3Dhttps
> \
>             file://0001-Make-dynamic-linker-a-relative-symlink-to-
> libc.patch \
>             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-
> to-l.patch \
>            "


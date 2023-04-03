Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C29AC76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 11:35:14 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.67])
 by mx.groups.io with SMTP id smtpd.web10.67632.1680521705020847425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 04:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.241.67, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC0XAG1xn1fTBi/EPfT2TpDglQHgx/Xi40mI/8A85hx9RdebcC97ltYU27MP5aHRQ5cpkKEGWEWPzH/ADkWoyRnHAXAw47FPjXDkiAjA9nqr72/1TbKKCHB8QuSQBu5d4cDjsF3tur8+8eHmY+4NtIT/QXsOloHrSUgdZl/Czwj4bTqJCS1s6w75VY8N0PmBmQHDkhH26eQj8e+G+42+CHGytX/DV1bAcHcIn809pT0dc7MgXO+mcbfYiVlyfy6cwRaWHXfJjpouZwGLtvhXGKS/x3mChxqvUgWIu1HN+DV8K4SS2FJw5El3f4xExLWENVvYFThqrIGiwP4A+kv5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrpVSmiLP/ZFYJC7qUYmou6U2z2+cDjTLsAi/aMBcNw=;
 b=LyhsbNOqpHV+r4vaYMK16ylvGp5WOkDppZoy8G72s2J87/yxB2GWX8kh6Q68qqxg9ED4OBaBfYIHu4yQ3cCnppdbgsjVFRuse3agitWrOlroD2r9Zs19IV3HepvqEweaoG2galbahTlg00ccsRP0WpdyTvlbV3GTktectj48wCEDivN8EiRtrm70IprnC1Obch0uk/jD37EDI0A7zj/TTSt48bZPnJmEs4gsvfeLZtncJaxKsXaI69pR2TLgp/OmizILB2H4sB91e4qh9L/oOygYIMMFAJAZZ4rC0knseAiUQhWEoWNNeyPn2Qraquy000bmhjzSTbIuW6CPQDBrzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrpVSmiLP/ZFYJC7qUYmou6U2z2+cDjTLsAi/aMBcNw=;
 b=EkG6y43zV7TCDUC1SFcd2nixLsYcRolyP0xJy1l2GJ17K5vwtOM6xUUpA7cm8IW50p1SMiY/2YivScX6boGKDZpvqEv8wrtfBz/UXasnJXuUcHPmFHVOEfK06474UMdOmxuBppGx9pHTN9b16IYgYeg7ZPgpi0Ww4IqBhmWdwDo=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB8PR04MB6860.eurprd04.prod.outlook.com (2603:10a6:10:112::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 11:35:00 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 11:35:00 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, =?iso-8859-2?Q?Piotr_=A3obacz?=
	<p.lobacz@welotec.com>
Subject: ODP: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs to
 perform_packagecopy
Thread-Topic: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs to
 perform_packagecopy
Thread-Index: AQHZZhj+U4uZGLi9+E6SON8BfQHKTq8ZaY2AgAADXLOAAAeBrg==
Date: Mon, 3 Apr 2023 11:35:00 +0000
Message-ID: 
 <VI1PR04MB53736528759F3D0B1EE6E88691929@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230403104216.3058652-1-p.lobacz@welotec.com>
 <c7232464074cb0c09b290262955b88b52578c5aa.camel@linuxfoundation.org>
 <1752689AEDC44A58.3977@lists.openembedded.org>
In-Reply-To: <1752689AEDC44A58.3977@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DB8PR04MB6860:EE_
x-ms-office365-filtering-correlation-id: 3a234817-62d2-405d-ffc4-08db343775ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Dr2/1Qczd4V1pTSVhdAFXzOe6028G9YWt5VDVI2TLqyn9kognCv6z7MyMtcgCuc49BPwaZUoEdc7e/9Q1I+rffSZxp08vRiV3fMWgwZ/v0iQgLhNIzrhMSuMBMo5HsPOMYL2ORcPFgWInDjY9u/QeV86jSKfVBZ+c0gPEP7XadhBuaapoC6un0UByZieOqEO1PVWdEG2vS6I49vXUfuwPGD6VNDatNy9rxv+3o4d6txUKVaobJr5220k7bcQqTCXUzVKRuhGVJWrhvK8DAbeAfvP9OheBKL+Fr896IQFb7WJI+Z/XkWp6dIJ9oI9qd1ariB5chIkE3pvHOby8sZri3s+WWMY56J7eSEkXa9+km2VAGiSRiRxWcx7RoZcmyDtxDu+Pqkuo0LOA6EbVX7F0aXwyb55PMlOGlf1lOdgo+GbfFcumkcye/GwOD1tFYSmGc20JxsKf+keiN5aMaQGGDIOZSYVbq0RTlRPCMsucpWve4oB6k15cN6VP4DRed0qN1SMFRIbYMLb7lRWdiV4UdP86jGioFZJ7Xg2wAfyWMlIrZnvEVmFZqQz9bbzHuMUGnSv2m4ETEmOWwrtZsJS3LS1LBQhUUHHc8YJ2C3TRrr5BJaHj4Yx0xDMacUW498K
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39840400004)(136003)(396003)(451199021)(55016003)(91956017)(8676002)(66476007)(66556008)(64756008)(66446008)(66946007)(76116006)(478600001)(316002)(110136005)(8936002)(52536014)(41300700001)(38100700002)(122000001)(5660300002)(66574015)(186003)(83380400001)(71200400001)(26005)(6506007)(9686003)(7696005)(86362001)(33656002)(2906002)(38070700005)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?aAefwJmbFEaVYbZWnjlTEVmoOheuuNXvyG+PMXMXyJwnHafdS5ykxe+2p4?=
 =?iso-8859-2?Q?b6caM+5aFFyKznug2F2e+i0CWT8u0CZKr5mCDQKOJeCX11hgwx2O9Ex2ba?=
 =?iso-8859-2?Q?RmCjKYM/UWDpn6Kqa5vN/r2RH0WsMAF6twpoh06y76K3AkjyszosHu5GUB?=
 =?iso-8859-2?Q?4yX+eujsLPG3NR4CYz2whinnyPGNnhdd2y1sHaaaWGwex42LIF7uK2HDvD?=
 =?iso-8859-2?Q?LFOXTxkhVeuEmR+stsankZcX2V1c7+EJzQh+xQ0JtIssvJmrQPGalQ6khT?=
 =?iso-8859-2?Q?koV+aqGcSvO1ScqXB0nG8X4cIYmNLCfb5NjQ0sC8tQIE/zhSMvWFK3R2Ck?=
 =?iso-8859-2?Q?LubSLsrAN6tc3qA7JcBDdB0hQnURgIXBGTDZRklVYXIfsmCfMKxEHXptIA?=
 =?iso-8859-2?Q?v15NVwpsMmUuxvsF0Oi1VYO3wpyQQ/8w7jXycU/wFjMTgCaLwOe0fEazma?=
 =?iso-8859-2?Q?8fLxkyUHyOs4rk7RAYd7or1LRzvxIMhvzqynn9fQB4ACOw51WoGH1ve/Ch?=
 =?iso-8859-2?Q?JIqijNfE0sh70vp+0hgt2ByWC+qUUDHxOuAFV32CTbB9V/N3s+RaVlmLTv?=
 =?iso-8859-2?Q?6NpwbebUkyI8xTm2ahLW34UlAqLLn8s3j9LaYoL4Iw7i1XR1pQbba4q2S4?=
 =?iso-8859-2?Q?gJoO23z2aGbkQsmFndR1MLzI0HdKbcNzU3NQI3XO3MqiX4R6rUUOCpphSF?=
 =?iso-8859-2?Q?8zXVkOSsqaPQaaQBbw5/Vy1yG5BHMmiWCjKhgccE4GogEu0AbAOaN7AU4s?=
 =?iso-8859-2?Q?f4f7QSMBkHYqiHj5kogh3GPrduREweXhA6mL8C0u5MkpEurTtCm41WnWHJ?=
 =?iso-8859-2?Q?OfW022VGtBux+a+MjnmReuuqtzYFVSz60EDcnrqZqfEQnPPXzGED0d9AvQ?=
 =?iso-8859-2?Q?6g8KoB9fX2R2Dkn+eCaMy24oWxmrez2Mq1+W0+4JqYkWljx/e5Iqs1QhGM?=
 =?iso-8859-2?Q?eXIZ7MXN7o3t5xiZmWpowf1FJ3vZUfry+iLko8ojdiBQcFznyRY1RWjPoC?=
 =?iso-8859-2?Q?Dg8p1fkRlB6zTLGat1jKz/faqQAhSWUNL8C/RuAhlJeoffZ08WslJjkgtO?=
 =?iso-8859-2?Q?bC5i2fCnkchtmYDNhis7L9gBGm1yxQW7du/ZwBWDASRa3sJm2AR4BAKzxY?=
 =?iso-8859-2?Q?GW6J5dvjEEg8EdYRfb/rPz0hQrDQazvxzAAL3avKZFyTX8Kr7DypnPcHrf?=
 =?iso-8859-2?Q?3rVmjTgSkMbdnaX9+wpBMDS5sdj7mBtsLKzKBTKD6vmrbq87CYxK7+r6Cf?=
 =?iso-8859-2?Q?JLMDJEuCZuVMM7mWrrcxVmeMxXooEaizcFtmyl5euoZxYRSp/8ivBlHwMW?=
 =?iso-8859-2?Q?De8chIeS3CAhObDhhtLWiZ2Cep29c598I3mtBw/yFRiDDuy8rX/izqe2WY?=
 =?iso-8859-2?Q?UYrgf63yCC0KCkPn8rTwZUm15tsAXl/bRYEjaJvT6nlBzoxEsNQ8mHGJ4c?=
 =?iso-8859-2?Q?QJ7j4yltxK5lLpiR+tgpPRTSoiEbYa+kHhSqrj+MxZuVyPPeeTZLiPwu/O?=
 =?iso-8859-2?Q?aV+cqEdNdG52ffMhOTIyP0v954CacYVvpnjMB2BAdEKPBQeDaM8QrHKHk/?=
 =?iso-8859-2?Q?t+Kh285KWzwOkXaHSJJLrZY9QheBrvm1D2KDbFEsgIyBFGOBYQbCrhg+qT?=
 =?iso-8859-2?Q?pyowJsioWtuiA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53736528759F3D0B1EE6E88691929VI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a234817-62d2-405d-ffc4-08db343775ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 11:35:00.5160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQqpCWtUF+HEJgiAet/o6rMBvIAopJbBjLJSdV3XU15McM1L1bEJu52lsWylunnahRDkHB9DCaiGeLc+BUnDGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6860
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 11:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179624

--_000_VI1PR04MB53736528759F3D0B1EE6E88691929VI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Richard I will send these patches in one message instead separate.

BR
Piotr
________________________________
Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: poniedzia=B3ek, 3 kwietnia 2023 13:16
Do: Richard Purdie <richard.purdie@linuxfoundation.org>; openembedded-core@=
lists.openembedded.org <openembedded-core@lists.openembedded.org>
Temat: ODP: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs to perfo=
rm_packagecopy

This is for the kikrstone release only as I'm currently working on it.

I have switched from debs to ipks as from what I have read they have the ab=
bility to support this ACLs and xattrs.
There was already a commented part of the code in libopkg for supporting th=
em.

Regarding seeing some xattrs I do not know.

Hmmm it fixes 9858 as the ACLs are preserved in package and packages-split =
directories. The additional issue
is with packages itself.

I think that we could add here some verification what packages we are creat=
ing but I haven't investigated it.
Maybe somebody of you have any ideas?

BR,
Piotr
________________________________
Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: poniedzia=B3ek, 3 kwietnia 2023 12:55
Do: Piotr =A3obacz <p.lobacz@welotec.com>; openembedded-core@lists.openembe=
dded.org <openembedded-core@lists.openembedded.org>
Temat: Re: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs to perfor=
m_packagecopy

On Mon, 2023-04-03 at 12:42 +0200, Piotr =A3obacz wrote:
> This is necessary in order to preserve all the extended attributes
> set in do_install also in PKGD directory, otherwise they are
> dropped and not stored in created package(s).
>
> For the momemnt it is only supported by OPKG package manager
> as it has support for libarchive and tar implementations, which
> supports ACLs and xattrs.
>
> Fixes: [YOCTO #9858]
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/classes/package.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 2950218145..b0334d9190 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -863,8 +863,8 @@ python perform_packagecopy () {
>
>      # Start by package population by taking a copy of the installed
>      # files to operate on
> -    # Preserve sparse files and hard links
> -    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -x=
f - -C %s' % (dest, dvar)
> +    # Preserve sparse files, hard links, ACLs and extended attributes
> +    cmd =3D 'tar --acls --xattrs --exclude=3D./sysroot-only -cf - -C %s =
-p -S . | tar --acls --xattrs -xf - -C %s' % (dest, dvar)
>      subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOU=
T)
>
>      # replace RPATHs for the nativesdk binaries, to make them relocatabl=
e

This patch looks to be against an older release as much of the
package.bbclass code is now in package.py. I'd definitely be interested
in this incremental improvement to the support of xattrs.

I also wondered if it causes any issues with existing recipes? I'm not
sure if any set xattrs which we'd now suddenly "see"?

I'm not sure we can claim it entirely fixes #9858 since it sounds like
it works for opkg but not deb or rpm packages? It is still great to
see the progress though!

The final question I had was around testing - should we add some
automated tests for this to ensure it doesn't regress again?

Cheers,

Richard

--_000_VI1PR04MB53736528759F3D0B1EE6E88691929VI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"font-size: 12pt; background-color: rgb(255, 255, 255);" clas=
s=3D"ContentPasted0">Richard I will send these patches in one message inste=
ad separate.</span>
<div style=3D"font-size: 12pt; background-color: rgb(255, 255, 255);"><br c=
lass=3D"ContentPasted0">
</div>
<div style=3D"font-size: 12pt; background-color: rgb(255, 255, 255);" class=
=3D"ContentPasted0">
BR</div>
<span style=3D"font-size: 12pt; background-color: rgb(255, 255, 255);" clas=
s=3D"ContentPasted0">Piotr</span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> openembedded-core@lists=
.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; w imieni=
u u=BFytkownika Piotr =A3obacz via lists.openembedded.org
 &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
<b>Wys=B3ane:</b> poniedzia=B3ek, 3 kwietnia 2023 13:16<br>
<b>Do:</b> Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; opene=
mbedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedde=
d.org&gt;<br>
<b>Temat:</b> ODP: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs t=
o perform_packagecopy</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
This is for the kikrstone release only as I'm currently working on it.</div=
>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
I have switched from debs to ipks as from what I have read they have the ab=
bility to support this ACLs and xattrs.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
There was already a commented part of the code in libopkg for supporting th=
em.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
Regarding seeing some xattrs I do not know.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
Hmmm it fixes 9858 as the ACLs are preserved in package and packages-split =
directories. The additional issue</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
is with packages itself.<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
I think that we could add here some verification what packages we are creat=
ing but I haven't investigated it.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
Maybe somebody of you have any ideas?</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
BR,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,25=
5,255)">
Piotr<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>Od:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Wys=B3ane:</b> poniedzia=B3ek, 3 kwietnia 2023 12:55<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs to=
 perform_packagecopy</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">On Mon, 2023-04-03 at 12:42 +0200, Piotr =A3obac=
z wrote:<br>
&gt; This is necessary in order to preserve all the extended attributes<br>
&gt; set in do_install also in PKGD directory, otherwise they are<br>
&gt; dropped and not stored in created package(s).<br>
&gt; <br>
&gt; For the momemnt it is only supported by OPKG package manager<br>
&gt; as it has support for libarchive and tar implementations, which<br>
&gt; supports ACLs and xattrs.<br>
&gt; <br>
&gt; Fixes: [YOCTO #9858]<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes/package.bbclass | 4 ++--<br>
&gt;&nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcla=
ss<br>
&gt; index 2950218145..b0334d9190 100644<br>
&gt; --- a/meta/classes/package.bbclass<br>
&gt; +++ b/meta/classes/package.bbclass<br>
&gt; @@ -863,8 +863,8 @@ python perform_packagecopy () {<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Start by package population by taking =
a copy of the installed<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # files to operate on<br>
&gt; -&nbsp;&nbsp;&nbsp; # Preserve sparse files and hard links<br>
&gt; -&nbsp;&nbsp;&nbsp; cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %=
s -p -S . | tar -xf - -C %s' % (dest, dvar)<br>
&gt; +&nbsp;&nbsp;&nbsp; # Preserve sparse files, hard links, ACLs and exte=
nded attributes<br>
&gt; +&nbsp;&nbsp;&nbsp; cmd =3D 'tar --acls --xattrs --exclude=3D./sysroot=
-only -cf - -C %s -p -S . | tar --acls --xattrs -xf - -C %s' % (dest, dvar)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subprocess.check_output(cmd, shell=3DTru=
e, stderr=3Dsubprocess.STDOUT)<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # replace RPATHs for the nativesdk binar=
ies, to make them relocatable<br>
<br>
This patch looks to be against an older release as much of the<br>
package.bbclass code is now in package.py. I'd definitely be interested<br>
in this incremental improvement to the support of xattrs.&nbsp;<br>
<br>
I also wondered if it causes any issues with existing recipes? I'm not<br>
sure if any set xattrs which we'd now suddenly &quot;see&quot;?<br>
<br>
I'm not sure we can claim it entirely fixes #9858 since it sounds like<br>
it works for opkg but not deb or rpm packages? It is still great to<br>
see&nbsp;the progress though!<br>
<br>
The final question I had was around testing - should we add some<br>
automated tests for this to ensure it doesn't regress again?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_VI1PR04MB53736528759F3D0B1EE6E88691929VI1PR04MB5373eurp_--


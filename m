Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706E4EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:38:52 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.69])
 by mx.groups.io with SMTP id smtpd.web10.6201.1689165524765679172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.247.69, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwtxqivGsJOVmPnvz/FD9e48KOaug6RT91bWfdBlSLKEENT/qFMe0SDh4hZTj7Tbb7cAh6+ZX7cUgT9SaTMB1BEAiX2Idd/yOubP/6+EXGMC1QIyUPOI8NUw9hIhnXe5S7X4Ji0eXvUW2e+scNRUtwlOciATgHLIWC5KtH+QQrvqH5lvlMt3uf/jEkG6cvc7Si1XpGilbD9+83L0Lg7PwLhgh0YAXEfgJM+qz9c0qzdQ2ECCeHXwksrYh7vfESlefR6sbitRrVv7OswMZAzMeIiJTj+6etq3BTZRN1EYGkwx29tpu6ARuqrdOvVf839oKFqLZT16MoFdF3KtRP+Suw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87Mu4qthQSqIrvVdG8E/V7epVwX5YFkzdWqAHCM2eTc=;
 b=XcIotz1ubO4j47LBdIIZ+UWPq2UkemgcQyOlfjh2UWEhvPs6Uf3I/muNG0pGljVytZUQyLAdzrzjuHZ76qx5AE4bY5YDSUFgFtDom0hxNj8fJ6YqSo1UPTDHtY2xV3anK9fkzToRsgG7jawxZPtQ1NqG1rGToKfen/ULdwjSCTxaGJZZg90tS7MM13N3DSf3FtWuI2/CpBigTaMZQYIGVzwjulEbp3NdKY8tinqRVHoVHrPp1ZUdnPZmIMs9zoG3SuYj0q5e8cF1d8WGCygoxOcbC5oGQeoWa8KPShJtHk8sOn8nGpKa8b0n39SgHTI/sbSBXudKEIyqVzawqKNzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87Mu4qthQSqIrvVdG8E/V7epVwX5YFkzdWqAHCM2eTc=;
 b=EFj8WnOk28H03SqWtPt708L/LQ9D4nNaVCdEUaCPuK3dlL4eh3nFhchvx3PSgHlncz600VbuOrZvCPxLcI/CCKzU0iAsy/1336fHRTxeTiglAq3cGKFtBDPmG1BcBUcd+uBCI2EUkcxCV/Th8Gg/9y3/9loRNUEukT83PhwqXD4=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8148.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 12:38:41 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 12:38:41 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr
 distro native features support
Thread-Topic: ODP: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr
 distro native features support
Thread-Index: 
 AQHZsxUxLTW0Sb4E3Uu/U3gcvSoAYK+2DvMAgAAAK2aAAAO7gIAAACCZgAABaACAAABAvg==
Date: Wed, 12 Jul 2023 12:38:41 +0000
Message-ID: 
 <VI1PR04MB5373A55313F357CB40C72B0A9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
	 <956c0e383088df5f8568961f57741452a2cb1920.camel@linuxfoundation.org>
	 <VI1PR04MB53739BCEE43D11E08D0202E79136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <25f435cb5536206f10a339ed0a20cd9c990a1a9e.camel@linuxfoundation.org>
	 <VI1PR04MB5373801F47C0AB61E6DC0EFB9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <57f1d335c7b34bfae272ce2bdd0d141c7e7d72b6.camel@linuxfoundation.org>
In-Reply-To: 
 <57f1d335c7b34bfae272ce2bdd0d141c7e7d72b6.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AM9PR04MB8148:EE_
x-ms-office365-filtering-correlation-id: ec393b19-8715-4084-c8e2-08db82d4ec35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RsiMmZdSDLQGXJchPUn+gbQbP+cPUks9IteDebmYEmpWiQYUg2IaocT9PYF3SswTygc41UzmWeKMXcN7tfu3UqJqPsggMpiETc8lcFyIn8g56AsZ0u/v5jgUGjt5S5dv+6V9Lai32ifeWuGyiZ6khlPtFdaHgFLQ315f7cBW+G9w7IxdJJyLf1NbJmnrpBEM3YT+XIpMnz37mix98RaUVyhhIb89lOKbeOcyMRSpLqncE6PL/kdK94vY0TZI2rfR6Pq6KpEYtjEgKOgJ0EA7nyLaaHrG++9IXH3xgIAW11/aKTIPa3PAJmV5imJv97CeIUACtAZkwt9a33NwjdbCQg+E/fynET8wnnNZumw8xg0GjJi6Fq6RHawWXJpnTh28PtxBBJr9JN4qfPdYDDAaYDscbNlEhhfFqvasAn1NXSGqLRQFqPMZm1/7o99A1CCH8wTZ2b7jY4KhXnt2sJOgvWnfK8FyIByDXt1QGLXaYKFWtzSTVw4DAc/5NKhPyHE2r2I2cy4b3S97VL+ylS6UrYzna6LsoWBtABAhwEhmobNlxT2t/9SgGKnEadcOB2K+adUOFx+0u4rN5JLLnhhJmd4qO8EOmesJ2hkBsVf5Gcxi7eo8exlejs0WnHulyC4P
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39840400004)(396003)(366004)(451199021)(41300700001)(26005)(6506007)(9686003)(186003)(66574015)(19627405001)(7696005)(478600001)(110136005)(122000001)(71200400001)(55016003)(38100700002)(76116006)(66946007)(91956017)(64756008)(66476007)(66556008)(316002)(66446008)(52536014)(86362001)(38070700005)(33656002)(8676002)(5660300002)(8936002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?UOh5kz+V64UiQyqN18+7GFwcHUdDfGrS5AgikbCsfO6NFhX6tHu6j48jtv?=
 =?iso-8859-2?Q?yXpjSNfQokYF5jItt05vWEfaGs7rQZagbA4ZYXu+LF0CaOB8+yNfEmLTN6?=
 =?iso-8859-2?Q?XG9iX0CiLpVzpkcXRi9YWRnU6PLx+N3q10cDmZ6ze//x6TCGOBt6s81oVO?=
 =?iso-8859-2?Q?J3tc+DkRSjevOI5OKs1VxdVIWt8aBDce6/w1znYq43XB7m75H5UxRkJqOa?=
 =?iso-8859-2?Q?ijQSGgiTZcNXcvRKOr2eq6E/ZNXjQXYUpjQesq+BWTu00w0gxffASssbt8?=
 =?iso-8859-2?Q?MLIIb3lAsdpJ9YIAhelwW7338X3YVIFof64UO1hkEP+jov03Hv2agTj9EA?=
 =?iso-8859-2?Q?5BsdmRv3+7OvIXnLgqhYzYWzuzdgjef4ha3fzqSxf4XC30SNFoQl2e6Trz?=
 =?iso-8859-2?Q?d1rSCNZ19LaGLHD6jvMINHJEbyLgdNdcYvbtdceWawpLBaSd73r6dAVf6l?=
 =?iso-8859-2?Q?ASFHdg8WLWfCeYxf3wGUujrrmsc1rzqjxu8DvsrFxW3dEavwkr+TdE5hJA?=
 =?iso-8859-2?Q?HEW+rA+M6LR5ZaHYHtqZj35zfNgEfmhWGplFBr1mDWXHrZjpy2axSopbS6?=
 =?iso-8859-2?Q?Utrm2LdYUb8gAdf5/E4kmMOaHKPVqRLJsDuxdNUeT0MzZWhl0FCXA+nbsm?=
 =?iso-8859-2?Q?5kofwOvEXrWk51kcnx5/qbi7xM5DlBIxqRK2uIMI5bV8lXXnrWq/FXHonV?=
 =?iso-8859-2?Q?2oi3PtcY/cgR7wb7FcsJmsDwsSQle81R/b2S4bLZZ3iQT9sbCLjd6MuMPn?=
 =?iso-8859-2?Q?3xHzqtXR6iS/CVYnh47c4FkobQEjqWOfXBmWmIAqc9gdSmNuaa0Q6rU1Vm?=
 =?iso-8859-2?Q?kA/gTqp33ygLVAxF1P7dZT+1oJ+w1gPArxPT8jEO1JYQBpkZPvwMrC1M85?=
 =?iso-8859-2?Q?HwIwMsDvb0t8lslASsSaY1xo+XDSCVeQHSGVbVbTJqh7OLie1rhI3pYLzX?=
 =?iso-8859-2?Q?4hUw4zboFKczg26zOshg3B/krT0o782tjRGJ9bb6fm9Ad8h1q/sXIqn8oe?=
 =?iso-8859-2?Q?/9957cX3qj+eDJ0GErX7+BNcIpPkz+jEAiGonItZaiJqrZbAT80J7Z8aYD?=
 =?iso-8859-2?Q?elqKwJxgMQXpJvGaRsvYNtUrPHYiYdX54ksqOUZw2Gus0VCl5gbRKicM62?=
 =?iso-8859-2?Q?dxyJ7K4UeFK1EhDmfjb1KL31erMaBoCOHJPFwvfiIBNWnAfk21/MdXWy7C?=
 =?iso-8859-2?Q?p1ZTHmddjxfrdAuqiRwEM8Y785eVu4jxkV3JxAkLAcc4cVduRVkQ/mJwT7?=
 =?iso-8859-2?Q?IljBOW2QMslH6Rw/OuXETHyqAaEXWgNfI18D5WdYekaUSEfwqNc/ldykOG?=
 =?iso-8859-2?Q?rfs7QvzCNDoi81xpvsk0FbsHY1bKaLb+DPl1yssOkqKA4xcDQcLH+m+45K?=
 =?iso-8859-2?Q?uUkRxzn/MV4fRT+lb70fcBAIyV1YI/itZIGMXu98W87I06MLlryJSLAzYB?=
 =?iso-8859-2?Q?DDDLE6I/h8DSHzb85JXWlbDy6E3vvF89iQqFiSCIlb/fulv/ZY4jeBm/aR?=
 =?iso-8859-2?Q?Zm5zZ3ianMCq2bITDLi8ZfMVni/CaUqhLUpfZfKh0KwSxvpdSRG0QwObdI?=
 =?iso-8859-2?Q?zWkA1gt7tsTOGm1WxuT7IQjEbOBWGPVGzgPG0pXDmZ78xM928oLfP4X3B7?=
 =?iso-8859-2?Q?Voe9NCZZ1rpCunRbjp2Kn5E40Ki8Nq6BKJ?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373A55313F357CB40C72B0A9136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec393b19-8715-4084-c8e2-08db82d4ec35
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 12:38:41.0685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GRoklpKFgyoqzmahTm6j0BQPfea7uVAHQ0SsrAKDj21vqwXjkUGko6o7Nb3m0Zg7ofSHyjp1LzKCWSdGlnZHnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184197

--_000_VI1PR04MB5373A55313F357CB40C72B0A9136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Guys, the decision is up to you. My first decision was to use it directly i=
n DISTRO_FEATURES_FILTER with this, but also conditionally.

Probably this is why Alex has written to move it to DISTRO_FEATURES_FILTER_=
NATIVE instead of using it with this bb.utils.contains

BR
Piotr
________________________________
Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: =B6roda, 12 lipca 2023 14:35
Do: Piotr =A3obacz <p.lobacz@welotec.com>; openembedded-core@lists.openembe=
dded.org <openembedded-core@lists.openembedded.org>
Temat: Re: ODP: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr d=
istro native features support

On Wed, 2023-07-12 at 12:32 +0000, Piotr =A3obacz wrote:
>
> It was before, but Alexander has written something like this:
>
>
>
>
> > ... and the next lines after that are:
> > # Native distro features on this list will use the target feature
> > value
> > DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod
> > opengl wayland"
> >
> > So you can simply add acl/xattr to DISTRO_FEATURES_FILTER_NATIVE
> > instead, which is purpose-made for the use case.
> >
> >
> > Alex

If we want to make it inherit from the target settings, then yes, this
is the way to do it. I'm wondering if we should just enable it
unconditionally which is simpler.

Cheers,

Richard

--_000_VI1PR04MB5373A55313F357CB40C72B0A9136AVI1PR04MB5373eurp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Guys, the decision is up to you. My first decision was to use it directly i=
n <font size=3D"2">
<span style=3D"font-size:11pt" class=3D"ContentPasted0">DISTRO_FEATURES_FIL=
TER</span></font> with this, but also conditionally.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Probably this is why Alex has written to move it to <font size=3D"2"><span =
style=3D"font-size:11pt" class=3D"ContentPasted1">DISTRO_FEATURES_FILTER_NA=
TIVE</span></font> instead of using it with this bb.utils.contains<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
BR</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Richard Purdie &lt;rich=
ard.purdie@linuxfoundation.org&gt;<br>
<b>Wys=B3ane:</b> =B6roda, 12 lipca 2023 14:35<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: ODP: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and =
xattr distro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 2023-07-12 at 12:32 +0000, Piotr =A3obacz =
wrote:<br>
&gt; <br>
&gt; It was before, but Alexander has written something like this:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; ... and the next lines after that are:<br>
&gt; &gt; # Native distro features on this list will use the target feature=
<br>
&gt; &gt; value<br>
&gt; &gt; DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation debugi=
nfod<br>
&gt; &gt; opengl wayland&quot;<br>
&gt; &gt; <br>
&gt; &gt; So you can simply add acl/xattr to DISTRO_FEATURES_FILTER_NATIVE<=
br>
&gt; &gt; instead, which is purpose-made for the use case.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Alex<br>
<br>
If we want to make it inherit from the target settings, then yes, this<br>
is the way to do it. I'm wondering if we should just enable it<br>
unconditionally which is simpler.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373A55313F357CB40C72B0A9136AVI1PR04MB5373eurp_--


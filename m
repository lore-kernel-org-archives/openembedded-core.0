Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E13EEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:32:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.84])
 by mx.groups.io with SMTP id smtpd.web10.6084.1689165169912943543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.8.84, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSOZe9na5dLLvt590pY6RKfH8UPVsET2AlW9KQALfWqoqgV9XBYlslPiVlzR9Ps1SKi+D+/XAY20lowSk3nLMExAXhOWHi0vXA0H/1A0G4k4C4TMakp+aNJBI98wdnuPjLR7tbiK7Z3epSEmeHH54mHDOAF5KtsbCcClsa2ylOB1v6gp4ppjw25c/O1F/SkW6CrtQifgQRvIUeiLVcawed/Fj71goPYS4DRd/TUF2YTPFtpBSxTVSVaBNUm+fR0Ad1au+cqOiJ68La5kKmiqVYDmJCSuq3uYLbGXLoKrta8taLjcP1vD9r1v92futNSGps/vwGdE1iSg2C+KZJ1eww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYoIQZa7YsaR1j0FC4RFMuboIUt/4KSVXdXc54L0+tE=;
 b=cU/adNpBIcVCuQG+Vg2AYW1Et0eOx/22qdpCBe7T3CQ1JkfOYaZsXquit2tL4PE8z9AN4LiHMx+Ih7IV5xW/eFMksZgkDGNydZlZ6DuDGhNz6HQ2rmMp39dmd6eU+P3R21/gY46v0YqnfhBUl8LOm9+uzAELh01XYc346dUFET5cNb3D3c++I4eWf7gk7j3LwfcMsKvWxvRFlEQkXy07gWDNbifGn8F6ZJgUeMQhBeBpmxIgrIpVgEcxQuBd6Grqmf9EVVxJMeR2j06NlUgPdY9NsEnMjvcSMy7GKzjRQHSDFTuwkZu50GrPE3wdoOG9KFcXZURFhgpbLDNSZU6keQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYoIQZa7YsaR1j0FC4RFMuboIUt/4KSVXdXc54L0+tE=;
 b=k1OuvJdbK36rILnY8SevsBx9O3FNdac3KESA9OghnGVnHsgURtZX4if98Hu01YERrYTgCEQTzmSGnf5XsHxFAUcMoR+6jleJU1AfgnyhGNF/fz01lwiRbWuwzkQ/+ltcwfQ5EOnyD1rC1pjcXs42IOF5kbNAXhn4zzxsoDZPn6o=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8164.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 12:32:46 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 12:32:46 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZsxUxLTW0Sb4E3Uu/U3gcvSoAYK+2DvMAgAAAK2aAAAO7gIAAACCZ
Date: Wed, 12 Jul 2023 12:32:45 +0000
Message-ID: 
 <VI1PR04MB5373801F47C0AB61E6DC0EFB9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
	 <956c0e383088df5f8568961f57741452a2cb1920.camel@linuxfoundation.org>
	 <VI1PR04MB53739BCEE43D11E08D0202E79136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <25f435cb5536206f10a339ed0a20cd9c990a1a9e.camel@linuxfoundation.org>
In-Reply-To: 
 <25f435cb5536206f10a339ed0a20cd9c990a1a9e.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AM9PR04MB8164:EE_
x-ms-office365-filtering-correlation-id: c7fb6e4d-53af-471f-2952-08db82d4189c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 A2Myn/jtWPkhc1HpMsWZ3vMy8wzjtlo6SnkIQ+vWzdFp/EMk3AiGqLRYGcjQm5qcDaPtVR/aZYLZioUk7kwHjNxpcCTZ0DUMTm1tY5RK2b/5JbbJ8CBxNEmfpv/x0Ka5TQTTbVuprDWhZwh/9YGoGUKBRk/LCB1Vcfnq/xsyDwfBpEwa9yQYq60dxaE3NN3Ba75DbMqbYgn5c6E29dgpupd5dUe8Ns3kM5QQWUVfrqVNAfs4f1xhtLNhTw0pzxQNXXDSoTcgha9JVCCPDJGUIcuonyw34HY4+wBnfU3f4NtYQL8FlaU8EP4DSpATXk+2F9LRHMzAi4KktM8y84l/vthYn1QXF01QhMn/DtsEvRCTCfoNnzPb306CBFmJb7alJMrK4WZXdlW/aF08DiDApoZHn1uQu70RhOObAkKZh9Y2EhYV3jaKReaTpTf8n8iWGlpZoYD1R9oWsypumsyMSVXl1mO24tYBldO4DliIqH9QYBMLtCjGDW8MJ3qSZms0bos5oX5+qWeLUlOJ0l6Lto2e9DEmp+Y7hzbWQ+9ZPj9Cfaier3N5P0guELT5avXhtCSiwL1MSfWFVSAtm/l3lB3gpVvHN2sRWdp3qbKo23rCQX569vJrUyRvEUNGgcvJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39840400004)(346002)(396003)(376002)(451199021)(52536014)(64756008)(66946007)(66476007)(66446008)(66556008)(76116006)(91956017)(316002)(41300700001)(2906002)(8676002)(8936002)(5660300002)(19627405001)(110136005)(478600001)(71200400001)(7696005)(55016003)(26005)(9686003)(186003)(6506007)(33656002)(38100700002)(122000001)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?c+ts+TmFbxiiD0LjJlpDizEzCRyfpgwHAipxZUs1vPHnnkwJ+vcLsRbjPi?=
 =?iso-8859-2?Q?HoNZjJhwspLsF2YqQ9vMFlsFBs1idFDmSrglMgjtW8UoWEH5TRzhgwaOjs?=
 =?iso-8859-2?Q?s3QMDVsJx1M2wRq7G2EDFQCZ/vPR0n+L0npDebvnNua+RSCbPttNkVP/D3?=
 =?iso-8859-2?Q?rk0D1OJe/EDtS6GFN7qCM6ix2eHhA/gUQNHDlLDZHufKMpJqHAq6/la4CH?=
 =?iso-8859-2?Q?58XCyX55rjoye1BNPBBbVoOR1lcZIFWtV4MIC5hmhDPCVzgJLHMI4AREO9?=
 =?iso-8859-2?Q?lR9KlIMqniz40J8JIi9+2hu6tpJ30LsMqrhJnLigFihlTMlPJ+2DjAL0j9?=
 =?iso-8859-2?Q?/q+ysqCsffvFi/a4QE+n33vsVeHUqvlMs08SDYT4ao5udPLyv/vsNcZ2k8?=
 =?iso-8859-2?Q?DJqeWtF7c/UW90N95csKYN+7GMWd5pF7ompXWWLzlt199VvSboSk1IUTE6?=
 =?iso-8859-2?Q?P6WC7maquyPSNZ3zoiRDPY64jLazatGGscnjwCngczKSZdKNFERuJdhJbB?=
 =?iso-8859-2?Q?37cx6s7Q3Qsg6UoCW7uNiFMcawJfBBlgW/j8L+itQhS+ETvRY3od8emaii?=
 =?iso-8859-2?Q?cTNpwV28Q9b3AEf90pIbj24BQvFtEvq9dXj6Dk2ngRJCeOv4ANj74fHnVG?=
 =?iso-8859-2?Q?2x5Fyh8V4QsSRMdZc2KKCIqP4FoM/fcXo7xT7PdbTYTNH0vVTJ4cVAhded?=
 =?iso-8859-2?Q?j0nWlwu0Q+PHRyzToONPUKdcGPEjcW4Hfzb59kR3uwoMPwFb3mg2nXbGr/?=
 =?iso-8859-2?Q?+kXViFQYw9dI26DnLaotViFadJRozPSDTrHlc3wtzNZWBgBpaqyC4VnNmM?=
 =?iso-8859-2?Q?ZNm/knNhJ2vaD1q9Z5Nmn2ZxVdlXwkHjPofqKwVAb5LTKQ46KbpHZYnC6d?=
 =?iso-8859-2?Q?p29kTSLRC6/VuIaBS6ZuA2S0R0+iLa/MHjVGmjpDeymxFggAD4MM+BVznu?=
 =?iso-8859-2?Q?TwY6aAM7iHh0PAnJ9ppjNwNaTK89hYJbejfw+Z6JlFm0Kt8Cd1AyLp6b3C?=
 =?iso-8859-2?Q?OjWbgIOvuai9cvLTyEhe5n0n1MH0mtdIdO6TYqnhOD/keG1qeIFkvfvX8n?=
 =?iso-8859-2?Q?/VRZhW7Ttnl7z/dEh0xSWgy6BhLnYBan8Pc2bkEMXmEGjs0OSVBm46cxh3?=
 =?iso-8859-2?Q?mD+i14lMowNWGBMiMqy3N3XcZqYtXK/CN7rn+zxCUR28ryfLypw2+Kt5Yr?=
 =?iso-8859-2?Q?S15i6D6MqGd/3Q9roQqvfQP2SYAlpgvvViBuS92wjcShO5Pmn2G1XuaxVT?=
 =?iso-8859-2?Q?z7dkHy9qgjRtpZQWi4g0q2eJw+qUjcpeJLp0xqZiRATdP8mAvuKaleAnqH?=
 =?iso-8859-2?Q?SjXLiI2kafjDdUwScgiskmZQ6C0ZsJgV1IpBUMqgCTtksbEUf6ClNWjVFo?=
 =?iso-8859-2?Q?DRTHVDFZqEFO3wvtqpu2GR0gtSJq4pJQnmn0kPpAOixAtv+HSB92Zcwsx+?=
 =?iso-8859-2?Q?IyNeAqZmQ/5rorNAF++sSigsSFru4wY/UfVWIHdFxpLN+ewN6T6hO0L+hQ?=
 =?iso-8859-2?Q?1zhVR8jRiYw0EBbcQNndlHxMg1WXVvYBduD4ainpdCBsDakW8ZYMVyOUk7?=
 =?iso-8859-2?Q?9nFl7xxO/PUWaZxWOp1rNLjGcER6dSv56OQVRfeD0fbKVySQ6PmbaVoTQd?=
 =?iso-8859-2?Q?jyOma8pGBwjBTDpFM14AaywCg6x3vqz+l8?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373801F47C0AB61E6DC0EFB9136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fb6e4d-53af-471f-2952-08db82d4189c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 12:32:46.0040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4bMG4fLrBNPB/rg61u/OYjG82s3yNzCEqNflk2vU3YyNDTiGBrbacdt7LBhcvCaph9UnU/YYBX2f7243EEAOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184195

--_000_VI1PR04MB5373801F47C0AB61E6DC0EFB9136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

It was before, but Alexander has written something like this:

... and the next lines after that are:
# Native distro features on this list will use the target feature value
DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl way=
land"

So you can simply add acl/xattr to DISTRO_FEATURES_FILTER_NATIVE
instead, which is purpose-made for the use case.

Alex

BR
Piotr

________________________________
Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: =B6roda, 12 lipca 2023 14:29
Do: Piotr =A3obacz <p.lobacz@welotec.com>; openembedded-core@lists.openembe=
dded.org <openembedded-core@lists.openembedded.org>
Temat: Re: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro=
 native features support

On Wed, 2023-07-12 at 12:18 +0000, Piotr =A3obacz wrote:
>
> Generally we need these in native, otherwise ACLs and xattrs are not
> being preserved as packages are being built on native with usage of
> native tools which actually need the support for these
> functionalities as well...

Agreed, so should be not just set:

DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr acl"

?

Cheers,

Richard

--_000_VI1PR04MB5373801F47C0AB61E6DC0EFB9136AVI1PR04MB5373eurp_
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
It was before, but Alexander has written something like this:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<blockquote style=3D"margin-top:0;margin-bottom:0"><font size=3D"2"><span s=
tyle=3D"font-size:11pt" class=3D"ContentPasted0">... and the next lines aft=
er that are:<br class=3D"ContentPasted0">
# Native distro features on this list will use the target feature value<br =
class=3D"ContentPasted0">
DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation debuginfod openg=
l wayland&quot;<br class=3D"ContentPasted0">
<br class=3D"ContentPasted0">
So you can simply add acl/xattr to DISTRO_FEATURES_FILTER_NATIVE<br class=
=3D"ContentPasted0">
instead, which is purpose-made for the use case.<br class=3D"ContentPasted0=
">
<br class=3D"ContentPasted0">
</span></font>
<div><font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted=
0">Alex</span></font><br>
</div>
</blockquote>
<div><br>
</div>
<div>BR</div>
<div>Piotr<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt; color=
: rgb(0, 0, 0);" face=3D"Calibri, sans-serif"><b>Od:</b> Richard Purdie &lt=
;richard.purdie@linuxfoundation.org&gt;<br>
<b>Wys=B3ane:</b> =B6roda, 12 lipca 2023 14:29<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr=
 distro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Wed, 2023-07-12 at 12:18 +0000, Piotr =A3obacz =
wrote:<br>
&gt; <br>
&gt; Generally we need these in native, otherwise ACLs and xattrs are not<b=
r>
&gt; being preserved as packages are being built on native with usage of<br=
>
&gt; native tools which actually need the support for these<br>
&gt; functionalities as well...<br>
<br>
Agreed, so should be not just set:<br>
<br>
DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr acl&quot;<br>
<br>
?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373801F47C0AB61E6DC0EFB9136AVI1PR04MB5373eurp_--


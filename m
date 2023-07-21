Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4C9EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 11:23:19 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.54])
 by mx.groups.io with SMTP id smtpd.web11.5057.1689938596324481693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 04:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=s690uM5o;
 spf=pass (domain: welotec.com, ip: 40.107.7.54, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/JT5leCzkAabaiqBnCnrBacTn/3dVcmzFzAD1Cg7D4ejBaz2n4YmS3cqPrqiLix/M9eLt/BFRKxg2KmUrEpgbD6arSXQxtC5klgJtV1SqtZ1xcOnbaD4ZX+Ms+CsK2ndYgaJLKkJG2e/1/HBXI6WNF1+b83wrVNghbKlNpuA+SoYhDw0kay/I76vm326vDOojVvo8loEATdbvYTSaO2+XZlrjhNoTXTQSjawslt4N2/o9yeVz5l+9NDQTS/nffFAsqNt+mX5uXbOUHkE/nKh3sgxR1D6HCQSBB7OUAp7+rM/lFteyX5YATPEG7nsLwOx1dZVK96xo0uIOP25iRcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iImbdQHRK2KOLVxO1yPwE0J+NqKixgRr7jTfOYOvA3w=;
 b=OOBEoktXhN1BwMChAYxCgCis0AJLnCVjDtYME1QkRcRJem9fpU5Yn8f/vKvVaskbb5H0r/Mfh97Hm4X+SnDUPeW8wQ8NTwqcltCaFKbIdRAzyx8HmnjlVaGsqYZQNgPNDSvfLlOG+fSLYLmE7EjHisZux4v5LxrTsLNMy5A5LzWUltA/58Ih7eag9LvTh3tTh17pkf1NlfeCrV9F7OruKUlFORnGQHvw7DOHnWmueyBL87oGG7IRV/d1mTpdFQJLVR37ButnJ1kj+I5U+vbdDlpJrq1JYD3TVshgLkKfUP7afdx28ZlCL29LBpgREV+LTs3b0a8AWDAoCnMh7Y706A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iImbdQHRK2KOLVxO1yPwE0J+NqKixgRr7jTfOYOvA3w=;
 b=s690uM5ouLGwo93jgk/FPHBd2J1CnqrOCFStkd8kk3AOIWkbbrnx5A2nx085iw4NcMfnaNBHz+ZmR6u5sNu8Ku+ak9j2xP43zETK7RlwlJETRYjf3CSC0k9rwngf8n6VWHfV44PGtfovSJ/eyXfM0ADiZoymVSuEyHBeWr35NAo=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB8592.eurprd04.prod.outlook.com (2603:10a6:102:21b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 11:23:11 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 11:23:11 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZunoNTkOY0WCPRUi2xV/KPhZ5b6/D9yMAgAAAId6AAB7p+g==
Date: Fri, 21 Jul 2023 11:23:10 +0000
Message-ID: 
 <VI1PR04MB5373508095825FE89990A5AC913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230719194843.330741-1-p.lobacz@welotec.com>
 <202307210930548e9d76ad@mail.local>
 <1773D81D0EEA3783.27973@lists.openembedded.org>
In-Reply-To: <1773D81D0EEA3783.27973@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|PAXPR04MB8592:EE_
x-ms-office365-filtering-correlation-id: c35a86a5-f49a-45bf-fb96-08db89dcddce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gPv5i3IsJKS2I7OME5Ysi+nFC1PxoSK7YZ0ljVF+/Ns0vPJPhcQiYRzC5UfRghWrXgCdEkAnb6gwnWGq9yESHeXIVv0PDZAAk4tYutnkpRizEzR8C0vHb50/g3WhWQkMBLXaCYTX9wtForFmbm3X9pGVEYYvNy5E1sH0hhrpprZvCga3VS2l1V4pfgnFvgaS56NcFMuQN4O/yu9EGsTU14/IW18Tc8gY4QywbdMO06U1JKhTrOAqkw2knnrE4qh1gm0M2daLXTQ6MDa3kyltmCI+UAGL9ACRyTkxpI4ruWsrpKYRmICj3JCAv9qNTIh4gfX7nN3oKsN7o3NyoVPpitUYbHVsEqUQMMhBlf9IaUehe0KpqwaEoETvNwjuFhPLm9l1gzWaP8iJpowa/KYAaw0jSjIgLb5BjOFIK36wTj2vY851gxncd59R+ZIYGV8OqG+65+R33QL8xfzteVZxaQrctd6bZ+5n/fbgPAebnoImtLWAdsf2WvGZ9KpO+7dYZ5IqRl3ZTe8ywFGIHNmxb6UDBVAAuGIaqE0SpiT0WkxKvhDaAwptkrSx86vYiKjQjw1/Mb+4vSgz/rUoO2kDgjYNBnm7kL3P0wLXa5Qo4QA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39840400004)(366004)(451199021)(110136005)(966005)(71200400001)(45080400002)(478600001)(7696005)(91956017)(186003)(6506007)(9686003)(66574015)(26005)(2906002)(316002)(41300700001)(66556008)(4326008)(66476007)(76116006)(5660300002)(52536014)(8936002)(8676002)(64756008)(66446008)(166002)(38100700002)(122000001)(33656002)(66946007)(86362001)(38070700005)(83380400001)(55016003)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?EQRZqSHsFtUNDmCfD1s0aTz3p5sGPnUqo4OgvZFSGikRk8HTwGzwKYfg08?=
 =?iso-8859-2?Q?+eaTVGJvDOjdJKKxJnC1qJIjKJv2YVQJ3VbWIdVP0gVrHPI7hUr3gUxNQH?=
 =?iso-8859-2?Q?cDDtynJYQb11KGTFx5ceM4tfesd9NIT1GTnF9JE9O45d4xfO/gcB52wEPv?=
 =?iso-8859-2?Q?/QGdvmapyyYgQZB6XKa+/vNC9NQry8WzBG/r0CfqdKageBD/nSv+1oH+Wu?=
 =?iso-8859-2?Q?WOTM//5O/I5IurZd7B4XQIuckcFLZtp+pRHYJ62UiJFni7HUhkGE32qadl?=
 =?iso-8859-2?Q?3FhU8uJ/ARIUltDqnkJHpdxvqAWHYYzQZ/pJyEXrGHfgifwtIuuqUE24ho?=
 =?iso-8859-2?Q?vqNgGkCku2yGHQ4gwvkQSaiZc9pzx0sh5kEUeGPAHMSd/jmal4pVVvJplI?=
 =?iso-8859-2?Q?xKs0QrlL1V9b7Tp9sXMuuNe1/3zYqAjoPT++XRI0DPznFiiaHO3s2g1OS3?=
 =?iso-8859-2?Q?Kdi+JzCpSIPidnnYnoYPxYtL6vKWDNAUr7xPMazuQ41ig7m985CrdDqR+y?=
 =?iso-8859-2?Q?CmrgUPFj6MAc2DfGwP3J/EzcPhyEzOWELMkEWXpODOVuB2bgGLtDt5oV1P?=
 =?iso-8859-2?Q?dgXj0I1eXy/fn1WGwTrM3p2zMPf84xl/nFJzmBu5u8nbNjoi8UguEgeNSn?=
 =?iso-8859-2?Q?6vekFn8I45ppOf72LBLTlnuSAXC8YQZGeyxYFqpQyqhNjEK+q8qrhNYCgl?=
 =?iso-8859-2?Q?IS7Nne+NxupddBbTvNpxXLeahqW1YIhRI1WXOSH1o0y/7+RrZHq2lsaS+l?=
 =?iso-8859-2?Q?6KRxib5vRmEQqSyesqXoKZ6jI5BeeHelAvKDcL2bd/0hjfY4fbvHtQnxeZ?=
 =?iso-8859-2?Q?MQ+kWx9lv6GrnqS02+Zmtsbd5WQSufyUzzlt1tAplSlT7jyyiMMJhdeXEU?=
 =?iso-8859-2?Q?S8m7i1PsIEmxl0OlGfp0M//tUQw30OltSBE+O7He639CQRzCkyK8pz3VsD?=
 =?iso-8859-2?Q?AD5pr9BT0fe2arGZ1f2auh/pgpKcWCmM6A7VNzqV9Ma1P014zSg3fEgURz?=
 =?iso-8859-2?Q?8VXEwTVwr1ZR6dLqjDVqtTzCfHnOFZaaWVYQrF3/g4K3pYfR3j5ePB9GKN?=
 =?iso-8859-2?Q?aeKHYghPYZDBMVaJjVduajcGq5ZL4xDdgQOnnypW7CNkq+mlrOvHzO6x6m?=
 =?iso-8859-2?Q?WA9lNEfBaLQdy209hwtyNGl3bmxUtzUcF/qNXThdgcHsBKgy6Hx0q9fm3D?=
 =?iso-8859-2?Q?hRRWtPjF2qlIwfDNVoCircnPTgbgBhsR6FUbejBw0TNEGJiLqjL/rhyY1L?=
 =?iso-8859-2?Q?u+jD3gjZzolRwr0GBUPQp5MUfMfxmWrmYVv02XyTYXDj9PzZEXaSi1WwTS?=
 =?iso-8859-2?Q?DDfZtfspSFq9ZIxfyEjGB9rtJOTzMZeC7hmMDBnmZsJvpxWQtBC8se/Xgi?=
 =?iso-8859-2?Q?3Nw3ZI9t6bIBtBJbUqs2AA+zJGKp5x1+OqiCb4bMYEXwgDEWIuWG2Otq1d?=
 =?iso-8859-2?Q?s9wTix7AqvWevPWW/cuLTprQSoqX9FEfxjvMUtiV7uT2Ij0N2iHcdmcTvQ?=
 =?iso-8859-2?Q?u0yxgfrsq/ijYefDXxZnNYrxz8lcHjc2mDkDa++fATwHwK/z4k3ZGv4lO9?=
 =?iso-8859-2?Q?h9+bjotfw2tsRJngZ8oL1lPONnnSt9r+JrFIzt9oPssN8uvKpITYeOXgl9?=
 =?iso-8859-2?Q?G8+oFxFmbTN2g=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373508095825FE89990A5AC913FAVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35a86a5-f49a-45bf-fb96-08db89dcddce
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 11:23:10.9861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mzANlPBaN32a7AIRMyexlCGE7TIIkGGV4wyuyxta2BEmMn2NprZeKsb8yBZK2tD4iedE/EPFdpucO/oI327JQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8592
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 11:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184685

--_000_VI1PR04MB5373508095825FE89990A5AC913FAVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

OK do you want it to be on top of openembedded-core-contrib/origin/abelloni=
/master-next or just openembedded-core/master-next?
________________________________
Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: pi=B1tek, 21 lipca 2023 11:31
Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro n=
ative features support

Yes but within an hour?

Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: Friday, July 21, 2023 11:30:54 AM
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro n=
ative features support

Hello,

I want to give this a shot again, can you rebase on top of my
master-next branch ?

On 19/07/2023 21:48:38+0200, Piotr =A3obacz wrote:
> Include support for ACLs and extended file attributes for native
> builds, by default.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9625a6fef4..8daaaad615 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
>  DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>
>  # Normally target distro features will not be applied to native builds:
> --
> 2.34.1
>

>
>
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C2fcf33853c84429feb0708db8=
9cd2f44%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255286582480321%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DVzoZv0Pjtc0D2%2FwMEi32VYkRde7xvWr4b5hH=
MopFJN0%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB5373508095825FE89990A5AC913FAVI1PR04MB5373eurp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3">
OK do you want it to be on top of openembedded-core-contrib/origin/abelloni=
/master-next or just openembedded-core/master-next?<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> openembedded-core@lists=
.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; w imieni=
u u=BFytkownika Piotr =A3obacz via lists.openembedded.org
 &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
<b>Wys=B3ane:</b> pi=B1tek, 21 lipca 2023 11:31<br>
<b>Do:</b> Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr d=
istro native features support</font>
<div>&nbsp;</div>
</div>
<div>
<div>
<div>
<div dir=3D"ltr">Yes but within an hour?</div>
</div>
<div id=3D"x_ms-outlook-mobile-signature">
<div><br>
</div>
Wysy=B3ane z aplikacji <a href=3D"https://aka.ms/o0ukef" originalsrc=3D"htt=
ps://aka.ms/o0ukef" shash=3D"qKSo2geqh4sQQ7uBGwScZwQpeCn4xXzS4q+LD99wezdgnJ=
FBsCwss9i4tBYg84Ah9O/1EnE9fKQIJmOYKYOzcLkPngsCoaGtXi1UUR8Aeq0sqFufcXEoZk3x7=
MJcH5ls3bhMM4yB6kji3aicz+yhRumZaRbAUYtt6hjDDqIPVHc=3D">
Outlook dla systemu iOS</a></div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>Od:</b> Alexandre Belloni &lt=
;alexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> Friday, July 21, 2023 11:30:54 AM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr d=
istro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Hello,<br>
<br>
I want to give this a shot again, can you rebase on top of my<br>
master-next branch ?<br>
<br>
On 19/07/2023 21:48:38+0200, Piotr =A3obacz wrote:<br>
&gt; Include support for ACLs and extended file attributes for native<br>
&gt; builds, by default.<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/conf/bitbake.conf | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 9625a6fef4..8daaaad615 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATURES}&=
quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Native distro features (will always be used for -native, even =
if they<br>
&gt;&nbsp; # are not enabled for target)<br>
&gt; -DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
&gt; +DISTRO_FEATURES_NATIVE ?=3D &quot;acl x11 ipv6 xattr&quot;<br>
&gt;&nbsp; DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Normally target distro features will not be applied to native =
builds:<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/" originalsrc=3D"https://bootlin.com/" shash=
=3D"X9zCn+oe/h+jLuelBdSxjQ1Cqxk6hnEmfakGbqNO/D9ICf+ClvvmIB3rs4GAm9zvs0cCkUc=
bo8o8talaiHl3yu1JmN/7OxBm8ig6GpTih8z4O1F4x+SI8n4Br5Rop8qdU/+OyXCa96BWWZCiC+=
Q5VmgB7OY5HsIfceU0B9mBwag=3D">https://eur04.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40welot=
ec.com%7C2fcf33853c84429feb0708db89cd2f44%7C25111a7f1d5a4c51a4ca7f8e44011b3=
9%7C0%7C0%7C638255286582480321%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D=
VzoZv0Pjtc0D2%2FwMEi32VYkRde7xvWr4b5hHMopFJN0%3D&amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_VI1PR04MB5373508095825FE89990A5AC913FAVI1PR04MB5373eurp_--


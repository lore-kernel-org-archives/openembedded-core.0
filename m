Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDA4EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:18:42 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.58])
 by mx.groups.io with SMTP id smtpd.web10.5835.1689164314867651285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.15.58, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LE4J5T3P2+5jeXjH/6J1y65DT9yoC6WfFPkm5JuX98kd4COsBDwBQ6wV6ni9qCiUuS5oc2JGxl7Y7+/IVdW9VgPrxP0LVrco2EUkDyE6WCQTG72F/3Gvt29zLKtN9/AiIAe9J+4EPM5ccXzN4lNf7H+UY2iM4J6qmOfulpOv7A9im04rxety4Ofhd7ce6uZOmm9YiMW9zy4dm6FOChH5RR+ra6ietyW+YGcZieffgaSH19hmkcVdNWfBf+SvV0gd0xZcQRrjRl8/XASV8TQYQZULe0d1Z6AgD8PFLrzl1QkCcm6UavHxxvPchI78ZDm1U6+IqgnS+fUSsccF4XqVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecW8fwLePboJ043ReGfjRi92YOIrxZo857wGH9cUPSY=;
 b=VqWW/NHBcO9/jamCTGMqkZhO/AFrsjZSimfqhpq/1XJKA/qLS2fc80AUs4U7GyRMPQ/wdkDLtLdxONYfRWwzpQypF3mOm/MDl/D/9QZ8+Rr6PlgOLY/kpm2i0LLmDy/WnN6Q/3XeYX2SwJa+p5xwjDagEDJkgUU/21eCUW142U5jCcefF7+m/oNLk+EGO0TbQOP2xCbR0e2sdAdWJYeJ97mnQv7fOKg0/hzL2m6pkEaqUQRwBj086nPVff4DwClPuaCYDaQ1ubCbzaOyFepLD6gfdhCVrqYN0CTJny51qV3Gqk3KmqMuls3brETfObvhxY/aFPYcvNIwddfLYFDlZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecW8fwLePboJ043ReGfjRi92YOIrxZo857wGH9cUPSY=;
 b=CSJFOD1fx2aG6zD7pHfWjHm9Oxrr7xagMfG3dly8x1FCfd1l5WtpXPIuXH9OYJZQYO4tFvebyvkROTOW4eiqqGNs9xVUMFqX+L+VRs4uvkXBkFTk8JomkaFkEvNO2C/0LZM8cFVUEYXgfCJYu0hRSkJbC10VHkwwppLEaGPGyU0=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB9060.eurprd04.prod.outlook.com (2603:10a6:102:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 12:18:30 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 12:18:30 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZsxUxLTW0Sb4E3Uu/U3gcvSoAYK+2DvMAgAAAK2Y=
Date: Wed, 12 Jul 2023 12:18:30 +0000
Message-ID: 
 <VI1PR04MB53739BCEE43D11E08D0202E79136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
 <956c0e383088df5f8568961f57741452a2cb1920.camel@linuxfoundation.org>
In-Reply-To: 
 <956c0e383088df5f8568961f57741452a2cb1920.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|PAXPR04MB9060:EE_
x-ms-office365-filtering-correlation-id: e112cc64-61f8-434d-a7f7-08db82d21a83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pfF1nAEEsHYoqTIJYAnUR6qyYeFKIGwEcTCehLpv519W/UPSNTG2CRLEdj+fHCPspYuwvSxCgxUMsPNv5+j8eXaizrQXcNyGwKuE0m/txF25ihojiq6fsEKaSAeojmIwdem/z1P0NU+t+LIzkUeeYoKrCB2sc/FMJdk2pQRt8djLbb/zkufUm5IE+y8lvOrPJrpvWsGaXluzERWfbhxlP3AiPddPb3Nn6oro4YQT1isQ11ViQ2kDMyaEMFsh5O66GgYX/fdbHe3veXlPTorDciakt4GMxtkMAyr1TYTTLYkoVvRvLy46wCNzFU9erxM58o+jle6ldnD+j7LCnrdOrV0I2kXP3wTdUd3qApyL9w3xzZTHhrGUIiDf2GuOyBgp5sCtTjjRKCbOAbFC1kuaU0PHvrUtChq46pa2UXeXF/fD3rO2Y8hn2INX+8uRXJJ/jSJng9jw6WG6pRq+XrBVveg+RQNeZDc3EE7rBqIewrVDZh5+nQv/tbfbcyAIRVH6SebuD4s0Ih2lvEvi7d3Ql7G4rN93K4OwaP2/qQ3K03FgjJKMXRIb0vWNS1kOH2KaKYAKO2E7bIeAzhghGitrtipahvhQ+VFrHpE13+hsPhHwy1VecKSxwettENL0Df5p
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39840400004)(346002)(396003)(376002)(451199021)(52536014)(64756008)(66946007)(66476007)(66446008)(66556008)(76116006)(91956017)(316002)(41300700001)(2906002)(8676002)(8936002)(5660300002)(19627405001)(110136005)(478600001)(71200400001)(7696005)(55016003)(26005)(9686003)(186003)(66574015)(83380400001)(6506007)(33656002)(38100700002)(122000001)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?SkpAPq4Q7hf+gZIhEEu2NHaCQKymjHrFrtJspWcGQne1k3oRpevzSDN557?=
 =?iso-8859-2?Q?GKZ3NTyEAiI7rBnZ5kwhrAeOQFJ1FtlmzMhCocWAFfNFaRDha8uoj4V7NE?=
 =?iso-8859-2?Q?26mSb5mSyxiNdkDjjY02SeRyg48DPJ2ljxFDo15Z1B9EwQhp5NAS1Qe+W2?=
 =?iso-8859-2?Q?fV65xKsyKBRphL4FJb67qEPPnQZKp/i8vsR7hTf2s/gMBj3u351Mo7vZa6?=
 =?iso-8859-2?Q?0zJBLlYhnMWT5eghIzLvFctGA8cWtzw9VWea378et6Lrmtyk6SqQdoMuwO?=
 =?iso-8859-2?Q?51pldPW0kjjG1OrRVsVxDH+7BKzp0rlPLW2DhXh7RW8DWnrIxIa72AJTta?=
 =?iso-8859-2?Q?YAtqMGjX3mMOAZGXrpvyfg1kH3GaezBB0nY5i/kVKnP9FKYsPb6rAKeOjU?=
 =?iso-8859-2?Q?nAWAqRZkpE4kxV+vI9gMaGBh7oUWIGHXmMni7W6ZsFbNdBnh0uykMf60Hm?=
 =?iso-8859-2?Q?fPlyX/dNfgbepQuD1mc9+1aSv91ExxrpIjN94n/6SoE8qrR8V3aM7lh0xi?=
 =?iso-8859-2?Q?NHqH6TQ20V60s9L+IM+i0cqNlCRSIWLGNk2MWDlsJWnMJyLeedd4xzXdNB?=
 =?iso-8859-2?Q?5i9XTSVWB1+1OVi7hGki9blW7ayIHyDNYosLfIrWebiW2dvyrUeHYKvDCZ?=
 =?iso-8859-2?Q?UFlewNg3hyJE8b0ZggWDj3aThUR4zEltBUlU6EoqTTXuk70O7E2Wja8qFH?=
 =?iso-8859-2?Q?dTyVP5ggWVP2bZnz7oBNbbwl2KwG18Uu8BO6ifWLjrtUM7ZIQUCSLRsu70?=
 =?iso-8859-2?Q?giKhf9y0Y1S9IVrjVZryUD/chaQs0f0BguCkLvuVL+cueFWmf27iQ4MFgO?=
 =?iso-8859-2?Q?syljYXD0pAdsns21OKhHe08QDkliMJfjuF7qKSicEzFKQSA1BRHIzdLegz?=
 =?iso-8859-2?Q?zjT1CUoRK9IrOXTsPdr00IlIKfgWBTeCm8gXkAQU082BchYNhHqKoUHAUk?=
 =?iso-8859-2?Q?RSxWEuJkYjWW38/LjeJd7AXRcn78Cg9VKhglWG32qS1s/kKSWCoRKT6ERh?=
 =?iso-8859-2?Q?kCLS9RZXumMdBb7Yr/i6q8FvVV/tnEx3Ny5IaDkWPcvwy/oC0P3SF9ZIUG?=
 =?iso-8859-2?Q?W8XuaRCCOaN/AOxyMy8qaNLJcCbezx/3KVxBB6dupRlLkrn9rBNo2eEc4S?=
 =?iso-8859-2?Q?1M/TIYhWBSCa9rj9vJo5xuLEXuarTqOQGJxwucbdtHBD3vWRqXfD4JocS6?=
 =?iso-8859-2?Q?1Jjw8f4pAFXC2CU0Yv67umONi/oXJR2OtX+GMuuw7VSH4lkqedjA5sOvCC?=
 =?iso-8859-2?Q?LwIzii1TukB9WawWjJrqKn4oH3bPQHt545nI3Mk9Ady/C7D/tJOK45UxOi?=
 =?iso-8859-2?Q?FbfAVNq2dwcaHFNZ3QXI5G2Eh0X+/ISsnuVLdz9S8c66PamQo8J7wSJGmo?=
 =?iso-8859-2?Q?FeDM84fmTqg2yvWYa+aq/febwk2oB4Lx6iL0HkgXcfQvoXM596Ow2rnvvz?=
 =?iso-8859-2?Q?spRGqcRI69Px3oqLUSvoAcwloTopT244JI1zEdSdc0gGHCT9KK0gzMLElk?=
 =?iso-8859-2?Q?UtQchEczkRSMY7EpzXZe/2zqs0sFoGngX5xreQ5JDg4QELvaJXUu1Km28O?=
 =?iso-8859-2?Q?4/gFOqws/+pHiaCol/fU5Ynew0EZVVa+0XgRRsJE5f4M5HyeHae9qaYCy/?=
 =?iso-8859-2?Q?6RdYmV3toQ0OsZOPIw9nw/0TjbYaTSyuvV?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53739BCEE43D11E08D0202E79136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e112cc64-61f8-434d-a7f7-08db82d21a83
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 12:18:30.2148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cxCIDT1pkmpEbHktrwQNqs7HrcxNULHzg3SuqAKgM5gbGE6MbkgM16ldLzvzgS36LvPyCY6fKGoxNXBmHOjAMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184188

--_000_VI1PR04MB53739BCEE43D11E08D0202E79136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Generally we need these in native, otherwise ACLs and xattrs are not being =
preserved as packages are being built on native with usage of native tools =
which actually need the support for these functionalities as well...

BR
Piotr
________________________________
Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: =B6roda, 12 lipca 2023 14:15
Do: Piotr =A3obacz <p.lobacz@welotec.com>; openembedded-core@lists.openembe=
dded.org <openembedded-core@lists.openembedded.org>
Temat: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro nati=
ve features support

On Mon, 2023-07-10 at 11:57 +0200, Piotr =A3obacz wrote:
> Include support for ACLs and extended file attributes for native
> builds, depending on which distro target features has been turned
> on.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9625a6fef4..da01e9b66f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 ${@bb.utils.filter('DISTRO_FEATURE=
S', 'acl xattr', d)}"
>  DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>
>  # Normally target distro features will not be applied to native builds:

Is there much benefit to making it depend on the target config?

I'm wondering if we should enable acl support in native distro tooling
unconditionally in the same way we already do for xattr? That should
just cause some minor build dependencies if I understand correctly?

Cheers,

Richard


--_000_VI1PR04MB53739BCEE43D11E08D0202E79136AVI1PR04MB5373eurp_
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
Generally we need these in native, otherwise ACLs and xattrs are not being =
preserved as packages are being built on native with usage of native tools =
which actually need the support for these functionalities as well...</div>
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
<b>Wys=B3ane:</b> =B6roda, 12 lipca 2023 14:15<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr dist=
ro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, 2023-07-10 at 11:57 +0200, Piotr =A3obacz =
wrote:<br>
&gt; Include support for ACLs and extended file attributes for native<br>
&gt; builds, depending on which distro target features has been turned<br>
&gt; on.<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/conf/bitbake.conf | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 9625a6fef4..da01e9b66f 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATURES}&=
quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Native distro features (will always be used for -native, even =
if they<br>
&gt;&nbsp; # are not enabled for target)<br>
&gt; -DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
&gt; +DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 ${@bb.utils.filter('DISTRO=
_FEATURES', 'acl xattr', d)}&quot;<br>
&gt;&nbsp; DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Normally target distro features will not be applied to native =
builds:<br>
<br>
Is there much benefit to making it depend on the target config?<br>
<br>
I'm wondering if we should enable acl support in native distro tooling<br>
unconditionally in the same way we already do for xattr? That should<br>
just cause some minor build dependencies if I understand correctly?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB53739BCEE43D11E08D0202E79136AVI1PR04MB5373eurp_--


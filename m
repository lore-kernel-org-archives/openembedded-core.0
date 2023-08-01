Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFB9C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:00:41 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.73])
 by mx.groups.io with SMTP id smtpd.web10.16800.1690905639829059847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=UOANah/L;
 spf=pass (domain: welotec.com, ip: 40.107.104.73, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MP7/erU1etogm/q0RDd/klor9ckuHbDVzU6hp1vGYQfVy52Z0yqhRGBhGTJREG1N/QKN+WjYVBguIzU6wwK43IJ5l7Iww5hTc3EoZ3/TlDqKxgIiWE1FjzyuMf4ZOKOh1XDZMuVvDITeQPIn+q5QLMfNiKsK0F3i0fzuZvd8NnYwfS+/X7nikFllk29lx/lJRykPlwJFol3HA/xfyar7if0umKarwKtOkI9p7QMiHEQLOhMeNdTKFXbPa2M6k4svp1vRzQ6Xu55EqD8fgdX760K6ajrMv3WIYQJyY8x+/cHvnDvZZUl4Lp7VYBhrjuME9ZIN98mLP/ekmITAxql8Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxNhZsplQoCYGm042PpuDaHhkbEs732YbGlwUJNS5Ts=;
 b=bVVwDNshws+ZYcTy4BPXa24gMwywNFiUeB/UGA7p68AY7ZEnD20b2n4FWZNx5CNf8rMc3V0MLyYnSMn8FhRlHON6h5VG1kQtN/0MAWkuO536ZKxMqVy4z8LtUx+LmRqc6nTHjWbdbauuCJbdSV/y7SQ9w3FDv6jkSKxYSLYN+awYjrKc8ouY1bvKRCq9rOxTrKMsfH6H1ut1T5B4HZ8QqmvmtgJAQYMcyNe1S6EkLh6U3SXwhYxw732jSyUVhWiwej4wUy0K0B6hUNFFhMuE8iwnRbkyLLtkbYI9y59k4/Ly/j055VdPyUxiEnZFvKs1691/Eszsq4DB+LCS9h0F4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxNhZsplQoCYGm042PpuDaHhkbEs732YbGlwUJNS5Ts=;
 b=UOANah/L/cNr8foc2f4muIhjLiE6HQtlQnsv24RYQtKxdpOlnpI74f8V5jLfArt1jjl+BHvzdGRJKWVWnFPXN0M+6W173GsHSXAoUmFyXxJj8tejGxbsd1FEaIHlYV5mophaWmYHM+uCnwMsgMMlyOSfERHI9VIjgmx1N3t2A1I=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 16:00:34 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 16:00:34 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
CC: Joshua Watt <JPEWhacker@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alex Stewart
	<alex.stewart@ni.com>
Subject: ODP: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: 
 AQHZw+GoIkE0W6fK8k+8nz7vZaP5pK/UO6gAgAAW+ACAAA8KgIAAASbogAAAXL+AAQZxAIAAA5o+gAARULGAABcLAIAAAz64
Date: Tue, 1 Aug 2023 16:00:34 +0000
Message-ID: 
 <VI1PR04MB5373E5689BA7DE3CD6F6201C910AA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
	 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <20230727141809d2150cbd@mail.local>
	 <17762A3A069807A3.31298@lists.openembedded.org>
	 <VI1PR04MB537349F74CD4C3E13B272B879105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <VI1PR04MB5373AB9F0C887CF659E739439105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <CAJdd5GYifrOT_9-fct6TT95sw6tDe0L7etLxOcaEgTTGvWFPJg@mail.gmail.com>
	 <972083f47f3513fada3dc64c233f2c229f952aca.camel@linuxfoundation.org>
	 <177710C9CE043B33.12785@lists.openembedded.org>
	 <AM6PR04MB5368B2FF63E716221B740A029105A@AM6PR04MB5368.eurprd04.prod.outlook.com>
	 <CA+chaQfRM855mvJwnxvUKk_JpXq51AS7uXuqM0qv=Uayj4OQNg@mail.gmail.com>
	 <1777455C95C57250.15736@lists.openembedded.org>
	 <VI1PR04MB5373E8E3C680850A6293BC9D910AA@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <2fa1c6d32bae5fad13dba22c328d41063a519eeb.camel@linuxfoundation.org>
In-Reply-To: 
 <2fa1c6d32bae5fad13dba22c328d41063a519eeb.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|VI1PR04MB6861:EE_
x-ms-office365-filtering-correlation-id: b691afc8-d7eb-4ce5-6b64-08db92a87092
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RL77exQRPwUhmh+Ud79zlLn+VmlPKe7fmfWLvg/9Y4u5a2OISDPxw0qKD+YxRGG5xIHFqaHbQEleI67ygJa45l3k8dlimwfBFwR9hH4nT18omPjF+tWYPK4CgqE3B+af3WcJGMBpHcPFWTu95gmLafhwT8CTXGgfCfsN5zJMeI++EGwdxwDjVGq4DK0/+wyjWZ+T1NkevfJ+7bJNB2NNAuGsw4HK7vPNcE/CZPxV3d6ifKTS+joCwbB5W75bEgpw3GjgA6mO+2V2PxIn01qyefCnF59VpsZCBWsaVEA29B5YFdtCRnN0du+Xc40WTLZMmK8D2DEsGFg0BfSpvLkRK0/KopyCas03bs5zyjS7PL1HAG0rRwRe7Xj9Rt9wze7ym43xrfgqAA4w/hjYeJZoVU1grLtDDTi5TR9MhzMISts6oDY4pkyHImisVhIdMU1Wa1vEIeWL4xf8kSdgFHgBbk/8QfiDqguXtODy/4xZwi26Ahfp/HOG0MTDdMQHyo46or/pDNqdnaKwAq9DeqwGBxwcE/ZRxYdyqA5zHwAXRiaUZuDjxP9J+IBv9+hKi3U+vBH3KOwBvrA5AEulF3Lhplj4yPe5Y23L/rc2NfGdNIc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39830400003)(136003)(366004)(376002)(346002)(451199021)(5660300002)(52536014)(6506007)(8936002)(8676002)(186003)(76116006)(41300700001)(316002)(26005)(4326008)(45080400002)(478600001)(91956017)(110136005)(66446008)(66556008)(66946007)(54906003)(66476007)(64756008)(7696005)(86362001)(9686003)(966005)(71200400001)(55016003)(38070700005)(33656002)(2906002)(166002)(38100700002)(122000001)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?jw8R3iC4aMokTTdTwJM4O+VZq/nKaE0vNvZ+QeRkqynfIBeynSNEo+wfTD?=
 =?iso-8859-2?Q?xkYW+5Vrs9nTmNzNapDZ5ydsonWaFjMIkqHJzwagQW1LxORsRY45vrsKop?=
 =?iso-8859-2?Q?ocWFWSH5YIX/VmQ10SC75TIjQZAL0/labMNNSzQShPeNUlz8Rrt8ypwKab?=
 =?iso-8859-2?Q?75GyemgUEXjhoG1/AABGS0wrp7a8SQ+uBpPHwJ9Tr6OXQwctIcmZFI5JDf?=
 =?iso-8859-2?Q?mZ8V/MvCDPx2/7YKNhVWwGAwFos8jYZYmbjOH7gl0eW0DWa04Bl9aSy1Ma?=
 =?iso-8859-2?Q?5ltgotEHHCPdfGBdvKHuaFCwEvZESM6RPtmvBl/UiL8/2YFB/bOMl+5prM?=
 =?iso-8859-2?Q?Mbd/YJXMdJMLgekHIaqwmhmtL/c+ds+8e4v8rQVo+rbchetDyw29oBzWxi?=
 =?iso-8859-2?Q?XHk0e/4Um+j54A5vXtNXAqW8VzNBqpSQW3q/JqNE6ur/9ybtGSb/EnnsGv?=
 =?iso-8859-2?Q?LA+2MfsIgqAqx4zfQkK8X3XNGSHXPG+NKO25F0UPPy54cYSk30X2zZ7WSB?=
 =?iso-8859-2?Q?kKMw18E7vi8qn991m6pZ4tY+9VjPKJd5eu/nYz9tDf50vGwPNdQC38OhiL?=
 =?iso-8859-2?Q?TNQSHDqNibq0GKW0xgZ9Ljix79ExboDM3EnqentgJ0vIR+o2R5iY6HXLkM?=
 =?iso-8859-2?Q?ilGeT39zkH0w0B/irdy8mJCmpf17t9L/pMoBCr+c+yDPOvGu1vebJkCyYF?=
 =?iso-8859-2?Q?KORzuUQQ0oOwzYPi7kRNAIVNkvzwdYN7A72yjJtxSWe1Gc5WPydIJBzYY5?=
 =?iso-8859-2?Q?SfIPawNVNdRI6Hd3zjM3PDUobSWVu8xr9HM07KNV1b9zrdKMlvycgqh85h?=
 =?iso-8859-2?Q?CvaIU5MCv9hFKGKKdCyqidzYWmC67KD3DAatA95bzdKKyukX+16XaY13jF?=
 =?iso-8859-2?Q?pkd9lt5iE9xJ8V+3reH+lJ4X88ASbtOSp2C89MaW9ro0UjupqNqzdBQ7ux?=
 =?iso-8859-2?Q?OGq2T/kq9F+pzvVj4rwncnjONPfTqOC3RLAHTWR/9bSFjmGCLxX2vpVj8T?=
 =?iso-8859-2?Q?Z817/FBRWpu4mZCcQwG7SuVbmurG6t7dsEn5KWqTOxbifcuBbo5MoTIUve?=
 =?iso-8859-2?Q?94hPaWNApSJh9JkRY01k2lcC22bcBFk8rbE8NYZn1h5aH8DiKmyd1Syky2?=
 =?iso-8859-2?Q?4yy22ATDyV2oF0ZoGlmsvSBE9nLgzBGinwvlBTgyJ+K7r4vjzGjVDErgcD?=
 =?iso-8859-2?Q?uwmZfO8zjyVdr8U6OpUeEPZ9zIUC1KDfNfk6S2g6RLvrlP+QT0DbgILyJS?=
 =?iso-8859-2?Q?jmETF7BFLB1/al17XUOFc+MaSDqf2SE/324oZqBLkEmEkQxVvhZW8/BQvT?=
 =?iso-8859-2?Q?lqIQA8iFvKVgSuWps+qi4OoJBcZj1iC7kMH9Wxa0C77KLAbyxW6FwYQ/Yd?=
 =?iso-8859-2?Q?mM+Ke3fRGoRQsshQkqlgfBhPmrCSgRWRAbBugW8IfZJiVjhqY2fHJKJhsX?=
 =?iso-8859-2?Q?RwxZYNFBJntK1LETrtfCV78P/Par1I5KVsXW7g4fNWyd4XFUQoODeeuA5u?=
 =?iso-8859-2?Q?oJ0cwf2SDVawOVvIoj20kppCMfmAQ0KgI95G6izTejkHpeXulliUklJ3dV?=
 =?iso-8859-2?Q?hBliSDHgmWEw/ORPBoiP1K8T63HBH/kOZ1TN4ciC+BddLJuYkaqv8w3eIg?=
 =?iso-8859-2?Q?flRbqk4E2mIrumsDd+Qy9AAfOHVO4E5r+l?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373E5689BA7DE3CD6F6201C910AAVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b691afc8-d7eb-4ce5-6b64-08db92a87092
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 16:00:34.3579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rFESPMZuE1vUYAn6baBlBafONQ9ENZ8LVjq9fI6GsWzQhsVzQ9HAUE7MKF84/aJs/wCkllwq4waGt28N2WrJ1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185253

--_000_VI1PR04MB5373E5689BA7DE3CD6F6201C910AAVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

That is what I was thinking for the first time, but by default tar is being=
 run with posix,
so, it is not possible that these commands are responsible for this...

My guess is about do_package from package.bbclass and it calls this createC=
opy function which calls copyhardlinktree.
And to my supprise there is also tar command, but it is written there:

        # Need to copy directories only with tar first since cp will error =
if two
        # writers try and create a directory at the same time

and afterwards is this cp command with --preserve=3Dxattrs and according to=
 cp manual we can also preserve timestamps.

Correct me if my thinking is wrong.

I'm giving it a shot and will inform you about progress.

BR
Piotr
________________________________
Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: wtorek, 1 sierpnia 2023 17:41
Do: Piotr =A3obacz <p.lobacz@welotec.com>; Martin Jansa <martin.jansa@gmail=
.com>
DW: Joshua Watt <JPEWhacker@gmail.com>; Alexandre Belloni <alexandre.bellon=
i@bootlin.com>; openembedded-core@lists.openembedded.org <openembedded-core=
@lists.openembedded.org>; Alex Stewart <alex.stewart@ni.com>
Temat: Re: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: =
add support for ACLs and xattr

On Tue, 2023-08-01 at 15:16 +0000, Piotr =A3obacz wrote:
> Hi Richard,
> you were right. I have made another test with wiping out whole sstate-cac=
he for acpid and rerunning the whole reproducible test.
> It occurs that the package /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c=
87c13/poky-contrib/build/sstate-cache/a7/41/sstate:acpid:core2-64-poky-linu=
x:2.0.34:r0:core2-64:11:a741afe7c0bfc218a844a546735ddc4dcaf578bff5d6a3762b1=
bdedf0819fc9b_package.tar.zst was already containing wrong timestamps.
>
> > I'd guess you need to make the sstate archives of do_package store the
> > acl and extended attribute data and when that is done, the millisecond
> > timestamp data will probably be saved too?
>
> So I'm guessing that commands which are producing this package_name_packa=
ge.tar.zst are producing it in gnu format. Question is where can I find it?
> Is it being produced in this sstate.bbclass or elsewhere?

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.yoc=
toproject.org%2Fpoky%2Ftree%2Fmeta%2Fclasses-global%2Fsstate.bbclass%23n859=
&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C6ede1a2d1d444ff526c208db92a5cf36=
%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638265013099817702%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C3000%7C%7C%7C&sdata=3D1JiMQn00kK9Kddz6%2FMhPVKThB3crvKNTz9%2FrTOt14=
hM%3D&reserved=3D0<https://git.yoctoproject.org/poky/tree/meta/classes-glob=
al/sstate.bbclass#n859>

tar -I "$ZSTD" $OPT -f $TFILE *

or

tar -I "$ZSTD" $OPT --file=3D$TFILE --files-from=3D/dev/null

Cheers,

Richard


--_000_VI1PR04MB5373E5689BA7DE3CD6F6201C910AAVI1PR04MB5373eurp_
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
That is what I was thinking for the first time, but by default tar is being=
 run with posix,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
so, it is not possible that these commands are responsible for this...</div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
My guess is about do_package from package.bbclass and it calls this createC=
opy function which calls copyhardlinktree.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
And to my supprise there is also tar command, but it is written there:</div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3">
&nbsp; &nbsp; &nbsp; &nbsp; # Need to copy directories only with tar first =
since cp will error if two
<br class=3D"ContentPasted3">
&nbsp; &nbsp; &nbsp; &nbsp; # writers try and create a directory at the sam=
e time</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4">
and afterwards is this cp command with --preserve=3Dxattrs and according to=
 cp manual we can also preserve timestamps.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4">
Correct me if my thinking is wrong.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4">
I'm giving it a shot and will inform you about progress.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4">
BR</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Richard Purdie &lt;rich=
ard.purdie@linuxfoundation.org&gt;<br>
<b>Wys=B3ane:</b> wtorek, 1 sierpnia 2023 17:41<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; Martin Jansa &lt;ma=
rtin.jansa@gmail.com&gt;<br>
<b>DW:</b> Joshua Watt &lt;JPEWhacker@gmail.com&gt;; Alexandre Belloni &lt;=
alexandre.belloni@bootlin.com&gt;; openembedded-core@lists.openembedded.org=
 &lt;openembedded-core@lists.openembedded.org&gt;; Alex Stewart &lt;alex.st=
ewart@ni.com&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bb=
class: add support for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, 2023-08-01 at 15:16 +0000, Piotr =A3obacz =
wrote:<br>
&gt; Hi Richard,<br>
&gt; you were right. I have made another test with wiping out whole sstate-=
cache for acpid and rerunning the whole reproducible test.<br>
&gt; It occurs that the package /media/plobacz/9582beb9-8774-4d4d-976f-63a6=
f1c87c13/poky-contrib/build/sstate-cache/a7/41/sstate:acpid:core2-64-poky-l=
inux:2.0.34:r0:core2-64:11:a741afe7c0bfc218a844a546735ddc4dcaf578bff5d6a376=
2b1bdedf0819fc9b_package.tar.zst was
 already containing wrong timestamps.<br>
&gt; <br>
&gt; &gt; I'd guess you need to make the sstate archives of do_package stor=
e the<br>
&gt; &gt; acl and extended attribute data and when that is done, the millis=
econd<br>
&gt; &gt; timestamp data will probably be saved too?<br>
&gt; <br>
&gt; So I'm guessing that commands which are producing this package_name_pa=
ckage.tar.zst are producing it in gnu format. Question is where can I find =
it?<br>
&gt; Is it being produced in this sstate.bbclass or elsewhere?<br>
<br>
<a href=3D"https://git.yoctoproject.org/poky/tree/meta/classes-global/sstat=
e.bbclass#n859">https://eur04.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgit.yoctoproject.org%2Fpoky%2Ftree%2Fmeta%2Fclasses-global%2Fsstat=
e.bbclass%23n859&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C6ede1a2d1d44=
4ff526c208db92a5cf36%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638265013=
099817702%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D1JiMQn00kK9Kddz6%2FMh=
PVKThB3crvKNTz9%2FrTOt14hM%3D&amp;reserved=3D0</a><br>
<br>
tar -I &quot;$ZSTD&quot; $OPT -f $TFILE *<br>
<br>
or<br>
<br>
tar -I &quot;$ZSTD&quot; $OPT --file=3D$TFILE --files-from=3D/dev/null<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373E5689BA7DE3CD6F6201C910AAVI1PR04MB5373eurp_--


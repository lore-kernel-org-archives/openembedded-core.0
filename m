Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FD0EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 12:12:19 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.49])
 by mx.groups.io with SMTP id smtpd.web11.5803.1689941531146798244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 05:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=pSFNj9I/;
 spf=pass (domain: welotec.com, ip: 40.107.7.49, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpcNMzYJhtHb8EN6sxZnUJHrt2db+GV+WoliGkvOEiD8opZmL0hqaJpHxtPUw/2NkhNZWfrlS6c+Ngvrj55ntAA8F3dJLlirnlec9p+LhFQQzsLz0Bj1VVaz3x/XPSOcBcRhd3wH2cxUQ/mQacAsWV8YQTHFwN+0NyndkWfRz1JkZSxzZGB0Foqnv4GPxeL3QPJt7+xPZY1LyAl3i/py11I3B7tI2L8F5xSLE85dfcqVrhk0AiHbSLvxExkIWDomiWdyl9I0FiegPAhkuSCI19nJBlKlNrRxuh7CW625Io+KWGlcJjdhwTi3xCy4tl94Nr2kuWorKoweClaZWoUrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNDL+l8eRhv9o/IrJ6dRuiQqwpeccTr4Wx5/dEcJmw0=;
 b=O2Iv7eNGHYnm4HeoO6Dy0F+oWIinEzEKI/n7phjueaHA/zE0RcaO71GbtUFL+N33Ixf7qaiG28/6J6BKidtEEP0pXSsems0PGYXICVh3PHy9jh5dzwcPeNF3hH5/90b74TpxCngBpjYFjpOVfdOvegPVrF6M7fjzvbl5EbjVGpGeMioeyo4e8Y3PaJfGy+HCIPrkNIAuFm6Zb6gNIHMlybVVXj/uQEutCgbtsz7MfwS6TwPneEfEVw3GwLAVQNL8SvOaKC/llJPo1xRKW2DNW2vQOJ/T6hZR/LP9xNx66O3dHhBTkjgO+g0RlodmoLyHP9i2KRx5XNpqWxcXNyWsng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNDL+l8eRhv9o/IrJ6dRuiQqwpeccTr4Wx5/dEcJmw0=;
 b=pSFNj9I/3JWIkhJOzWkoho9HT8vV44lvCZH8iBVV4tAdR32rTARvwAkTslVaoYdP3U2badkJk/mDU3Vzos+epYXbsH2ELzmJWAGgYV3JbYgt8SHptatSobHmm8Maa9Cdf3HxHyZwRkokAvGLSwew94DEnjk02ZFrKCaz1VL5AAo=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 12:12:06 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 12:12:06 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr
 distro native features support
Thread-Topic: ODP: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr
 distro native features support
Thread-Index: AQHZunoNTkOY0WCPRUi2xV/KPhZ5b6/D9yMAgAAAId6AAB7p+oAACq8AgAACNIg=
Date: Fri, 21 Jul 2023 12:12:06 +0000
Message-ID: 
 <VI1PR04MB53733B7E0FB53A3043D6D26D913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230719194843.330741-1-p.lobacz@welotec.com>
 <202307210930548e9d76ad@mail.local>
 <1773D81D0EEA3783.27973@lists.openembedded.org>
 <VI1PR04MB5373508095825FE89990A5AC913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <202307211200147e423198@mail.local>
In-Reply-To: <202307211200147e423198@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AS8PR04MB9176:EE_
x-ms-office365-filtering-correlation-id: 8b244d80-e6f4-4e40-5b8a-08db89e3b34b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4pSs3Zn94i3HA8cTm+3QmNVI9nrxvuVF+1VqImC+vnCL71jgS6NGuu+P/NHsiUtC5zWPfcAm21Ch3ak9M6r7Hmo1x1FY1Md5F2ExeX5f0sYKceYcM9S3RlOuY16i2L1ZGj6GZl9bjgt5NcGkAaE0laZ31viMLFovdvSxrkPSNxN3QGNsaDn55nF2TzRSvevTLatTJfBBCq80dI6x2nXstPSpF0SywDYohgzCsoqyuft3lFb/pX4z8Tsa5dd3brqe1W0jPIXBBWKSWkHvT7bV0uGxGNt7AZIg6O9Z2403gm0hDcXCIviIsmWc7Zn0vx9uxsPofpfTmbrFuVEYpx77TfC/TTE3Z4QZv2hRVytcYAiqWgFb5jjPrOjPb8DPyBy48fTeG6KRQXRt+vk7eSNUdKBSAEhmPCbbdhRJ7h7RcFwUX+T5yxJ9NTGag1BcU6DwLiPpjbN9drb5EiT7QlDYkH/fU7WD1fqNxDtOpKZvusiNtapVTd4BRycTDBPLeYtxWpA93sRBIiVThm9/O6KHr7zOf7ZilLNBrqySnKHlY32S1sN2oB5YOO9tYGiVA8TZyP2JsWZwslBvE+UYfo/cx+RkEpaYWe0YDqM3uZOmdFY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39840400004)(376002)(396003)(136003)(366004)(451199021)(55016003)(26005)(186003)(6506007)(41300700001)(5660300002)(316002)(6916009)(4326008)(76116006)(38070700005)(66556008)(64756008)(66446008)(66476007)(91956017)(66946007)(33656002)(45080400002)(478600001)(52536014)(8936002)(8676002)(71200400001)(38100700002)(9686003)(7696005)(966005)(19627405001)(86362001)(83380400001)(2906002)(122000001)(66574015)(166002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?Bg2iOpUd/bUwrCZQBGfmZ3h3LO9tAOdfPZs+4FqIceTv8rYzMs953KUSB1?=
 =?iso-8859-2?Q?xDkmdf5ZscJBVk7WC6EFgvYZRXIRUc0tM7egx3bP4rWEBnhonAkOiiqr+n?=
 =?iso-8859-2?Q?F3i0LINlpmr57aLtxtovf5oAgiBAyhb/izFfUlQOrOI2Xnvxlczl/jYRxh?=
 =?iso-8859-2?Q?tYzENyYzuh1MS7Su9+ULbNzXOcZGTCyxIXkT/9X92ZjoyzaBYwIW5ncNMe?=
 =?iso-8859-2?Q?ip2Kd9ucU4BqSBjlwvsGKo9jQc1NkdCPl7O/Om0ubOfx+6oQB6ZCmOuFH+?=
 =?iso-8859-2?Q?gfXZjG0Eg2wPZA4XfC4X2v/ua5V0HBJhPzk5BtL0FC/wVniDwOXzYmwCVW?=
 =?iso-8859-2?Q?VFfFhYyrmfHkrLoEau8VbXpaOOvA4CoQliIijA8jVFWjG2Njx9seryOccZ?=
 =?iso-8859-2?Q?I1PqcqCfp7urXIegA1YYAxHzLmIPWLssni0LshoWZSjP4CWhQ+AFlX77Xj?=
 =?iso-8859-2?Q?mfaPZuuRwO2SpkkrHoeA0nuIAtUnB4h2LNSLamaiVbzDqQ8WYGdDldIeJw?=
 =?iso-8859-2?Q?9wNAADU0WMQ/mVKpVTsMhgPO43tPzkDBJ26hXnSV8GcxvSpW7aEFL8QUia?=
 =?iso-8859-2?Q?RqD/4HlB51LReHyXJKc7fE+IE0zy2BECcq4Ir4y+E3pFBR3Z3goDZFTYN9?=
 =?iso-8859-2?Q?wS9VC6tUJ70Dosp6odW15uiRQ8Z6755t5nya+4j2U88rof5MzNowAEpj3m?=
 =?iso-8859-2?Q?Qf3w/oYQRbr6F0eZAhzyYJfaKbGZ/p9qLb4o380XurVitNr7qL7hjDddv3?=
 =?iso-8859-2?Q?oKZOar9EriB/R9uPqINENqa3I1s9QNdl7ydn3k2Qthwhij/zFphs37RtPC?=
 =?iso-8859-2?Q?HyTnCqwn/OImGhXWgt6Gg0gdK1n2BGNAUnMUgKFc3o0mRfAmTgpPE2wL7A?=
 =?iso-8859-2?Q?chsZJZaWIkoovFBJSs1YyyoGy/uMYhzEEiRBAHnBEtoftuThWFU5u8Wc29?=
 =?iso-8859-2?Q?XUaqtR+NBKQesvlVNaV7+XMkFmI1w0IsjyZDiGs7BchjyJPJGiCwfJLjCi?=
 =?iso-8859-2?Q?qyiGJfqgM5dNTN/CI/HxvRVbfo6yD2tvvuxvebf+aUqmz9UeodXjmOZoJV?=
 =?iso-8859-2?Q?IPZjWfJbEYyyhsQyUmq4Shm9M8qA5OSb8o7qmUPMR72CIG85gHMJP1OmD3?=
 =?iso-8859-2?Q?L8f1w6m2OsOkGWgAu/8I5sciTTMqHfRs4n3TzQlw4iZidYP/ETsupFep6A?=
 =?iso-8859-2?Q?wDFw7Xfod1e5fTOlKTFc+4gwGAfCx3TIHDQF0KvlN5+XXJd91QRKb1B+1R?=
 =?iso-8859-2?Q?CsqRhCt3lodBT2NSW0JmkCj728VevaX8Ga3YOFGUAI+m/mSLoQsr0U8x4r?=
 =?iso-8859-2?Q?CMLj2lGhEYJ2/2zNMOnachGjEJ7RsVHV2uxVk4I+Mrn2/F8FOXYamxmq/C?=
 =?iso-8859-2?Q?CLDNS0qvSptXDxlTsLbvW0HxCtanvz4bOEAbRnbbACbAqklogcbSg6Q8cW?=
 =?iso-8859-2?Q?S8mKMjeB2LSFfzckEv9DzPsZiRrmgzg6gjMwIALKNs8yQc0xlCLWxhbE8V?=
 =?iso-8859-2?Q?2nDNOtqvgJVxd0nAnyj9CL3qAULRc3FW95LAKh9qZ7TytxnvbTzzj1R4UU?=
 =?iso-8859-2?Q?oVKoug/hUPlVfbKKWfBVOGk7zGOalkWf+fhNUiFuxRS7ViWUWEk8oppVUA?=
 =?iso-8859-2?Q?C19RvKOrt2aEE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53733B7E0FB53A3043D6D26D913FAVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b244d80-e6f4-4e40-5b8a-08db89e3b34b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 12:12:06.1145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmRMiPzFkkoe0XK+FXRFt3VQk1K+8+yFuCpdYtCSEaGIpBL+ODkq4jXiV6Fi2RjKTORw4PZj63L9yAfO3fJX5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 12:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184693

--_000_VI1PR04MB53733B7E0FB53A3043D6D26D913FAVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

I haven't noticed due to rebasing:P nevertheless I have done it on top of m=
aster-next from openembedded-core and verified
if patches apply on openembedded-core-contrib/abelloni/master-next and it w=
orks.

Please check the latest v7 patchset release.


Cheers,
Piotr
________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: pi=B1tek, 21 lipca 2023 14:00
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: ODP: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr dis=
tro native features support

On 21/07/2023 11:23:10+0000, Piotr =A3obacz wrote:
> OK do you want it to be on top of openembedded-core-contrib/origin/abello=
ni/master-next or just openembedded-core/master-next?

Now that the opkg upgrade had been merged in master, you can rebase on
top of master.

> ________________________________
> Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedde=
d.org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
> Wys=B3ane: pi=B1tek, 21 lipca 2023 11:31
> Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Temat: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro=
 native features support
>
> Yes but within an hour?
>
> Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://eur04.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Faka.ms%2Fo0ukef&data=3D05%7C01%7C=
p.lobacz%40welotec.com%7Cbcc6e73fc3ae4ba1373f08db89e20bfe%7C25111a7f1d5a4c5=
1a4ca7f8e44011b39%7C0%7C0%7C638255376186578362%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&sdata=3DsOp%2BVPmjSU08gxwFnZ5kxY4RptzC8id5d6dIiN96zEY%3D&reserved=3D0<h=
ttps://aka.ms/o0ukef>>
> ________________________________
> Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Wys=B3ane: Friday, July 21, 2023 11:30:54 AM
> Do: Piotr =A3obacz <p.lobacz@welotec.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Temat: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro=
 native features support
>
> Hello,
>
> I want to give this a shot again, can you rebase on top of my
> master-next branch ?
>
> On 19/07/2023 21:48:38+0200, Piotr =A3obacz wrote:
> > Include support for ACLs and extended file attributes for native
> > builds, by default.
> >
> > Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 9625a6fef4..8daaaad615 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
> >
> >  # Native distro features (will always be used for -native, even if the=
y
> >  # are not enabled for target)
> > -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> > +DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
> >  DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> >
> >  # Normally target distro features will not be applied to native builds=
:
> > --
> > 2.34.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cbcc6e73fc3ae4ba1373f08d=
b89e20bfe%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255376186578362%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D3RBLK%2BVcr81hdPmPfGMJ4%2BFCq8UOr6sC=
uyOG5hYdd3I%3D&reserved=3D0<https://eur04.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fbootlin.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com=
%7Cbcc6e73fc3ae4ba1373f08db89e20bfe%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%=
7C0%7C638255376186578362%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D3RBLK%2BVc=
r81hdPmPfGMJ4%2BFCq8UOr6sCuyOG5hYdd3I%3D&reserved=3D0><https://bootlin.com/=
>

--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cbcc6e73fc3ae4ba1373f08db8=
9e20bfe%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255376186578362%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D3RBLK%2BVcr81hdPmPfGMJ4%2BFCq8UOr6sCuy=
OG5hYdd3I%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB53733B7E0FB53A3043D6D26D913FAVI1PR04MB5373eurp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
I haven't noticed due to rebasing:P nevertheless I have done it on top of m=
aster-next from openembedded-core and verified</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
if patches apply on openembedded-core-contrib/abelloni/master-next and it w=
orks.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Please check the latest v7 patchset release.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Cheers,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alexandre Belloni &lt;a=
lexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> pi=B1tek, 21 lipca 2023 14:00<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xa=
ttr distro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 21/07/2023 11:23:10+0000, Piotr =A3obacz wrote:=
<br>
&gt; OK do you want it to be on top of openembedded-core-contrib/origin/abe=
lloni/master-next or just openembedded-core/master-next?<br>
<br>
Now that the opkg upgrade had been merged in master, you can rebase on<br>
top of master.<br>
<br>
&gt; ________________________________<br>
&gt; Od: openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt; w imieniu u=BFytkownika Piotr =A3obacz via lists.op=
enembedded.org &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
&gt; Wys=B3ane: pi=B1tek, 21 lipca 2023 11:31<br>
&gt; Do: Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
&gt; DW: openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt;<br>
&gt; Temat: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr dis=
tro native features support<br>
&gt; <br>
&gt; Yes but within an hour?<br>
&gt; <br>
&gt; Wysy=B3ane z aplikacji Outlook dla systemu iOS&lt;<a href=3D"https://a=
ka.ms/o0ukef">https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Faka.ms%2Fo0ukef&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cbcc6e7=
3fc3ae4ba1373f08db89e20bfe%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638=
255376186578362%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DsOp%2BVPmjSU08g=
xwFnZ5kxY4RptzC8id5d6dIiN96zEY%3D&amp;reserved=3D0</a>&gt;<br>
&gt; ________________________________<br>
&gt; Od: Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
&gt; Wys=B3ane: Friday, July 21, 2023 11:30:54 AM<br>
&gt; Do: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; DW: openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt;<br>
&gt; Temat: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr dis=
tro native features support<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; I want to give this a shot again, can you rebase on top of my<br>
&gt; master-next branch ?<br>
&gt; <br>
&gt; On 19/07/2023 21:48:38+0200, Piotr =A3obacz wrote:<br>
&gt; &gt; Include support for ACLs and extended file attributes for native<=
br>
&gt; &gt; builds, by default.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta/conf/bitbake.conf | 2 +-<br>
&gt; &gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; &gt; index 9625a6fef4..8daaaad615 100644<br>
&gt; &gt; --- a/meta/conf/bitbake.conf<br>
&gt; &gt; +++ b/meta/conf/bitbake.conf<br>
&gt; &gt; @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATU=
RES}&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; # Native distro features (will always be used for -native, =
even if they<br>
&gt; &gt;&nbsp; # are not enabled for target)<br>
&gt; &gt; -DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
&gt; &gt; +DISTRO_FEATURES_NATIVE ?=3D &quot;acl x11 ipv6 xattr&quot;<br>
&gt; &gt;&nbsp; DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; # Normally target distro features will not be applied to na=
tive builds:<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz=
%40welotec.com%7Cbcc6e73fc3ae4ba1373f08db89e20bfe%7C25111a7f1d5a4c51a4ca7f8=
e44011b39%7C0%7C0%7C638255376186578362%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
sdata=3D3RBLK%2BVcr81hdPmPfGMJ4%2BFCq8UOr6sCuyOG5hYdd3I%3D&amp;reserved=3D0=
&lt;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fboo=
tlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cbcc6e73fc3ae4ba13=
73f08db89e20bfe%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C63825537618657=
8362%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D3RBLK%2BVcr81hdPmPfGMJ4%2B=
FCq8UOr6sCuyOG5hYdd3I%3D&amp;reserved=3D0&gt;</a><br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7Cbcc6e73fc3ae4ba1373f08db89e20bfe%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638255376186578362%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D3RBLK%2BVcr81hdPmPfGMJ4%2BFCq8UOr6sCuyOG5hYdd3I%3D&amp;reserved=3D0</a><=
br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB53733B7E0FB53A3043D6D26D913FAVI1PR04MB5373eurp_--


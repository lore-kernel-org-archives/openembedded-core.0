Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D81EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 19:08:45 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.53])
 by mx.groups.io with SMTP id smtpd.web10.4549.1689188920318148764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 12:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.6.53, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrmR4+AxPS0OXwimZAYFpP3uem4RYZf5UBnm3u/tQbC9E6k0Gu5MB7ukIZwkgr89Se5Bd8e5JOZG1bdaveJjnwqvdCQzTtlXiO2J5yrH6Z8ufuiwpb8/QrxQPvrypHXb2XpaEF8m34uDtraSRA2L6Ff+z58AyjPt/AllqUeIPPZCXQ86/1Gwc4iKTKCoLsfqBNgE3IDy1zwco8gX3cjsf0y7X1G6fb0xPndHtV7SSdjkaBlBNexT5vPBbe3mJvEWexIxPgPHfyDXRSqOsDLiHhY27KWUu00iuqRH/GPrYfT6VQ3HYXwe/b5TbtSvLxvZxvO+vM8h6sIRmzbS++9wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F61eLT22IlCaKAEBTTa5pIq+qXcuCzCX+1iS46X3DdA=;
 b=NtAPJu2Vtpg/ecrTF0/f2BeoXsDhKvJkXM303ESw6kgUMbKDN6Sfshxv0jcnSsc2KxXhK37NJVHQ8rRfd4shmBJIdEj0bEvims/VqYUhlaUXgWeUANPHtDxfNsOp/LsaLtElcqyPWUJsfVCbp217MN8YNjy4D4pY2KztAju1ZCDUP9D3GwpvXuqv2uzvVqdTgKZLNMumhZSfvkPkcqyuw2CLJKSfn09NqG8Fkh8Oxr+OohIR0YI2CEbJOgYpMvq7C/tsPs+MMJcXk4p2+6/3vJRKao2fjm1qkhKFYhbf59vO+SW3/X5hj3Fasb0CVlnAfwCUT3iLA0GrGomcDNoquw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F61eLT22IlCaKAEBTTa5pIq+qXcuCzCX+1iS46X3DdA=;
 b=db0MiXIKZs0eChSfQ62nUEno7R5XaXpqxaTJNp6mfG6jhIfvjWb4VqtwR+R8KB2CUZ1crkiCtv9DrrYAUsrSuMoZSiprvEpLz5sii6yNgNqfOvYP8FPq7oHMl+IBIF+RABJE9vJ3T0IZnMRkpeV1V7KGhAQCzke7H6g8hSQJcIA=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 19:08:37 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 19:08:36 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZtLwH/aY9Bn0psUawLUZ3DYG146+2XGqAgAAC+ACAAB6/CA==
Date: Wed, 12 Jul 2023 19:08:36 +0000
Message-ID: 
 <VI1PR04MB53731CE4B03808CBFFB5B33B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
 <2f5daca6267d0a7dd9655527ce862fd4ca1b265c.camel@linuxfoundation.org>
 <CANNYZj9LiFaL8syxNrv5Sc5OfP6xeZJfgRn_LH+ExjuK7XbLzQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9LiFaL8syxNrv5Sc5OfP6xeZJfgRn_LH+ExjuK7XbLzQ@mail.gmail.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DB8PR04MB6972:EE_
x-ms-office365-filtering-correlation-id: 4e1457a9-db84-4506-0bbc-08db830b652b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 e8HiJaq3Gxqunt6UZ1Afiaw7sbf/r8XrczkKuqFHgavC6ZS50vsrTc7hoPYPqRQ/KkWtMp2A8pnguy60hSUwH+yD6Hhc5WOE42Rg1UXjC6qGRPGbhJ1rR4wla+Zf/E4H4FAjw84ibSQ8sAq8aAyk5OCd8Xu6pce1uHg5QjyEAqHs+yYHfDu/Lf05whYf50NpXCRc4ARotaBwMkkFE8vU4+Qy1xEmkZyTy/3rJn898iElN0I0kIbcct2P1lKq/gtFYw2wWsMlJ+lwITOdorkweanNMPeRYSflfPy0wpev2oEOcldkCcTWhcuW5XUfK6eKTYJvWtM6WWeTVds9OGATBQ8S6tk/nzfM8lekvzZHeUxXEXBGyt+l9gUWg+z9uedB+jsTf4enI7+ziqTPrXWC5eJeKJCBrPDBprfAOJ7i7eZj93GajaAmCMK4i4baHeRrqkgfFWcdin1jlj8uaHEf//AQH3io77wDABl9m5ScSYpIKp25zujUXVaYZ/XODuiIYWJGDve85ipLl6R1XAgmg6c8LJBoXUsfIQ1Su6YAUq5EUZ8smiy34s9qyrLT/Ods4JcXihA1exYwHmZAwdMboiH0k06jaXYHwm4kMFhMTGjt6ISIGe34NJlUNjhHO7iE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39830400003)(366004)(376002)(346002)(451199021)(41300700001)(4326008)(64756008)(8936002)(66446008)(8676002)(55016003)(66476007)(66556008)(6506007)(316002)(52536014)(38100700002)(33656002)(122000001)(5660300002)(26005)(478600001)(38070700005)(86362001)(71200400001)(7696005)(9686003)(66946007)(76116006)(110136005)(91956017)(186003)(2906002)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?l+KMiQCi5TICv6wqe+OQ7CNpQ/qNx8bwSLFXDJpJBompj4jYbJ2etZQva2?=
 =?iso-8859-2?Q?YIZ+Uu+6dV8NvtH34ooPEzXaJ/DFFy0aVA4SgSxW/Fl2J64ZAWT7Rx87aB?=
 =?iso-8859-2?Q?tJQj2se4dgmRPuud3gHuCEOyTyNlL7j6Sy+hpwu1pp3ZFRRYLGEp6A4+Cc?=
 =?iso-8859-2?Q?qsCNP/m60CuIOcglJTc0FOzmDWLYvOzexRCUJKlWbW/ObKhhpXQ9k76uzT?=
 =?iso-8859-2?Q?dVAq+/Ofth/DbrTIOpt15nE/P8mR2ULtcVoOklHKdsjW3n8yiWOQMYXZw4?=
 =?iso-8859-2?Q?Ym0D8jwlcJuNAYOpLM83o9MmmV2gbXnu10szJxqU9woM25+xmZY7a3+e6B?=
 =?iso-8859-2?Q?Gx2OZq04WQX2+Q+Uvmj7aD5WkDmv6/6YthoDMnA1yZAys2Wr34ByBg4EjP?=
 =?iso-8859-2?Q?ND9GIIlFPeoHDttnq3o/gGrVGevuhPtklcUIkIiaNyB1E0/BKSkpyAokJ1?=
 =?iso-8859-2?Q?iqdMR75Dv3qNZEgoJD27TzDWsvqpxELaGCBsCell7WqntS6YqOSU4KMd2E?=
 =?iso-8859-2?Q?pFVGpgLvGBEyR7KIyWP6pwoQfyIipL0j6kkQuTfDzITP4T6hUQwNCmI7u0?=
 =?iso-8859-2?Q?O7RUHqvXkjhbGob+Jq1mdlLVOn+dAhhxB/k2ILphVdqWDJdYrMeGzars6o?=
 =?iso-8859-2?Q?M2TH/aHOgef3TjKY4z9tJbf/H3wn309lGHTwYBjNJkVY8xiyYl5/feJcyC?=
 =?iso-8859-2?Q?HWTgg9FIEJkSWhedfU+pqhOrOxv28dF98Z1zd8ocevFyOPMnWazJBU0Ts7?=
 =?iso-8859-2?Q?H92zM/pXkK6ZsrJ/podQ4rWkGHmIKBhzIt5w98pzOO4K842kuS8MLAbFXZ?=
 =?iso-8859-2?Q?JKWmN8IA6us1fiMVa8EACJfvLzqJtIMBBQ2L+qc6Ve1NwRIWxPdVZ7c0ws?=
 =?iso-8859-2?Q?9i9QqyfkeRiJ7tFlIO3yR353zIfUnMIvSqfmPFZLFCyfFft9+Ie01TEPzN?=
 =?iso-8859-2?Q?lCwUJwXJoumHCv75DFctUvvMhX2s7/oMcRBXijKDXtPNTon7/TTjofWgLe?=
 =?iso-8859-2?Q?aoMWA+lRb4ReSZNTt78FqU/tnb/pt1Q6pgPvgsUxG4HZogPmVPueM3j6eL?=
 =?iso-8859-2?Q?Ap8EWjcPMOjOukMSpL8XhVlUVznAMHBFK4wZ3f+kTUxvny49xzpPtrr0Ph?=
 =?iso-8859-2?Q?ijLkz7Mkdrms4tTGOVfS0MtPWjdcN8KErZ0R8ZK9er+Kfs64rbD8RPt8jq?=
 =?iso-8859-2?Q?/T/S/rAwXNlltz04sDlPAZr0XXZAQRhBF3H5PrHqz3qrNFhXfIIxjQkvu1?=
 =?iso-8859-2?Q?4NrjuxTE4S+Az9hCNAqNl2I9TALp9VTFgmhdNKTTMvfKWFng3RC6nc4vj7?=
 =?iso-8859-2?Q?ZfHWK3AxiI6NLP9eIiBF3yENdFp3u6MHRGEVYCmBI4kVQEM9QXzIm66fY5?=
 =?iso-8859-2?Q?p+kKB45N6owTjRm+GUkxFOSTFvYpZkyTKZM8ZZHyH3a2RJ3letEscNTrpX?=
 =?iso-8859-2?Q?XHdW+DEGKkFeygX+0pFbPPhuHHUUOC9O5HNd9hXOEPqXASmopenBiRjLfm?=
 =?iso-8859-2?Q?xOkL58Fdd3lZ1lg3qowy4Zgi1nUPTiOUziBJhmauh8xP9WF4uxSH0zAljn?=
 =?iso-8859-2?Q?9W98GVhvz+M1VXCiLijOGsp5WheWxNzV7SijhdAVdkiLvczQsftoVITP5F?=
 =?iso-8859-2?Q?uMEb9TfZ7bfk2kP8OkubNA/uYc7F54Sju2?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53731CE4B03808CBFFB5B33B9136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1457a9-db84-4506-0bbc-08db830b652b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 19:08:36.7683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82o5jE+hzuG975igGu6UW3mBRqvH2N5horW0hIV+T6gU7Z+YQmFiV/hHovY/ttlOsrWsNDLNVijxm9GBhCepIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 19:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184219

--_000_VI1PR04MB53731CE4B03808CBFFB5B33B9136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

OK, I have set in v5 patches set, these acl and xattr attributes by default=
 in DISTRO_FEATURES_NATIVE, without any checks, if it exists in DISTRO_FEAT=
URES. Is that ok for all of you?

BR
Piotr
________________________________
Od: Alexander Kanavin <alex.kanavin@gmail.com>
Wys=B3ane: =B6roda, 12 lipca 2023 19:15
Do: Richard Purdie <richard.purdie@linuxfoundation.org>
DW: Piotr =A3obacz <p.lobacz@welotec.com>; openembedded-core@lists.openembe=
dded.org <openembedded-core@lists.openembedded.org>
Temat: Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro n=
ative features support

On Wed, 12 Jul 2023 at 19:04, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Just to be clear, I know what Alex said but after further thought, acl
> needs to move into DISTRO_FEATURES_NATIVE in my opinion (and Ross'
> too).
>
> I suspect Alex will agree with that too after thinking about the
> arguments I put forward about simplifying sstate reuse.

My comment was strictly about using the best syntactic sugar, and not
about the merits of conditional (or not) enabling of these features.
I'm fine if they're always enabled.

Alex

--_000_VI1PR04MB53731CE4B03808CBFFB5B33B9136AVI1PR04MB5373eurp_
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
tPasted1">
OK, I have set in v5 patches set, these acl and xattr attributes by default=
 in DISTRO_FEATURES_NATIVE, without any checks, if it exists in DISTRO_FEAT=
URES. Is that ok for all of you?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
BR</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alexander Kanavin &lt;a=
lex.kanavin@gmail.com&gt;<br>
<b>Wys=B3ane:</b> =B6roda, 12 lipca 2023 19:15<br>
<b>Do:</b> Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>DW:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr d=
istro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 12 Jul 2023 at 19:04, Richard Purdie<br>
&lt;richard.purdie@linuxfoundation.org&gt; wrote:<br>
&gt; Just to be clear, I know what Alex said but after further thought, acl=
<br>
&gt; needs to move into DISTRO_FEATURES_NATIVE in my opinion (and Ross'<br>
&gt; too).<br>
&gt;<br>
&gt; I suspect Alex will agree with that too after thinking about the<br>
&gt; arguments I put forward about simplifying sstate reuse.<br>
<br>
My comment was strictly about using the best syntactic sugar, and not<br>
about the merits of conditional (or not) enabling of these features.<br>
I'm fine if they're always enabled.<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB53731CE4B03808CBFFB5B33B9136AVI1PR04MB5373eurp_--


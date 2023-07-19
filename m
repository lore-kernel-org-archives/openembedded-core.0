Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331C2EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 07:53:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.74])
 by mx.groups.io with SMTP id smtpd.web11.8909.1689753214179673200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 00:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.21.74, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PafPKZ8w8ZlcZDg887Ieengjjpia5I9aKZYrMNCarqF2qXjzdGB81jC3QS8LZpTSAc4QqZ6GF7vHv5AUcIjHuy/VniiRz/mvMlA2FOx1m5OrVGTEsrtz1dnAsDAJNhgOKQO2PVT8chRKgQEQ9CdTD8khvhchJPhtflfHGZBTUEOlSCxFBSYEMdEnINVReUZfZmADEyRyoSSSChDDbTEgiPvQah22aIyup09dmHeKBIqqV+l7Eyy0DqWg7V2v6WM7ct0x1sMNyBQJVFJFvOUMF72Obc1t0jPX9m1VluVMGK8lWrYznQfMP2p5bK4mZHsNKc2BC8A7sgsY8JFkmJ7CWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fX/XqmVP9fgV0uAunvOgJcH93zqa+vu1NIORs0aHBAg=;
 b=QBA8f6ddhnGilDzJD1yO7nAzO75TTOxE1jRqkRPhHs0f2lji3U/UBSEnA3lIAO0HR5xJP/Aqy0AwXUyXb74jkBNW7AYjQUYY6tcyv3gYf6t7u0lQYpoYSZYWytlz3EodwKLI8KH2NIsPIFocY5fAeJ0thhwJD22upmXdjVH5WSfkSmpJ17dSpamQOz4PpOVqa0Q4Znqi+RWp+LvMWacEnBY8/OfKGkRzXvH5DWmANBL9RO5rkuWUJ5T3OHFLVLKNXqtVB7S9R0tZ+r1tA3GnVMkszMBTcvFnT8LJtBUFq0wp+a+XwjGwJNBnEvDTlIiig7/upE4J39OhKYVhsMqOwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fX/XqmVP9fgV0uAunvOgJcH93zqa+vu1NIORs0aHBAg=;
 b=s1TbCwAXdhV2+FwmQL0+MNwaxItyB3U6L5r3b9MCKseqBlcEr1YuHFigw/hv3NrCoyCi+OC6tO58kV4yi1/3+hmqq5a0N2qiEb8FcVtL9p5D6KYLTmw02dsCAXla0np3KIr8I2pPHqRr+3yBQEXNZGFRJqo9UUfEQM3G44wx9zc=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS1PR04MB9501.eurprd04.prod.outlook.com (2603:10a6:20b:4d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 07:53:29 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 07:53:29 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Alex Stewart <alex.stewart@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZuhYbulVWq1EszUGWkGRpKDQmew==
Date: Wed, 19 Jul 2023 07:53:28 +0000
Message-ID: 
 <VI1PR04MB53735A682AA5C026FC6EFC3B9138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
 <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
 <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230716213857fea03b3e@mail.local>
 <17728F63D7D8F798.22245@lists.openembedded.org>
 <177297AC200D092D.22245@lists.openembedded.org>
 <VI1PR04MB53737C43B2CDDBFB197010359138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <202307182105150310803d@mail.local>
In-Reply-To: <202307182105150310803d@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AS1PR04MB9501:EE_
x-ms-office365-filtering-correlation-id: 592d00c3-ba3d-41ad-a3f9-08db882d3d90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 h+uJXi7xUo6WMp4y/rxYpGF/O3KtkcaV1sc7bqhZSM8d5v2ySim9bhBaqAjm6ql7zko4ZJ+94ZN4Gc/3yopGe2SvqCXlI17nUFp4Ouln6F18qBBZK6JkUCl0VF6Nbcqmg40ooidMEuEnzfhzC9JVWkOooYsjebR392MwrkYszBdXnl8IpzXn8knhrS7dZByavGxrSZMD9oDoXGzA4pRH02z+6aqeJItqgseo+otcj+VL2OWaPE45kpw4xrwJ3J6PTrfktuatE65UU3eZT/Wz4Dn167mxXUgCcHoidRJ9vwlqI4tsOhHmT9ygFWrKF1rkoIkCw8GiDHYSKVxn4sqNdcXKO9ermeZ47/aCSJtGvWPPkgnqEdzVazcuWqTosnEPXjPai5vlcn5M7isTcs3lOcJMBfkpPR40mWQMg45LW0UuWrvjL1WRlXzOp97Xz6NEk03msrm0oo1qSFalayOSDtqp9WHbZhXjzlFFvsZWtZl0ZXpUwHlbY81VyofGlRpDcwv5rdUr9jMlMjD1X2vnJEBlFiBTgZV9XpeCqT93d9qBAlrKrirM02r2J+HSp8+SOG4VaUBEaUTWDSMPTEUTxttnrxsCrgT9reaW95BfqZ8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(39840400004)(376002)(346002)(451199021)(41300700001)(45080400002)(7696005)(91956017)(478600001)(71200400001)(54906003)(19627405001)(83380400001)(66574015)(38070700005)(86362001)(33656002)(76116006)(2906002)(6506007)(186003)(26005)(966005)(9686003)(55016003)(38100700002)(166002)(66446008)(4326008)(122000001)(6916009)(66556008)(66476007)(64756008)(316002)(5660300002)(66946007)(8676002)(52536014)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?4ONfUfHTsuPuii5qRhZzFzbdvJDz9lJiHaxMO/GRpVbJ7lbJ+MzehK+4g6?=
 =?iso-8859-2?Q?xtatzX44d5lu/SqBrip9slUT3ssEVz9PjUBypmMSYM/At195CkdUpZPKJ/?=
 =?iso-8859-2?Q?BSlHj3L8Yy53q7jnQrebOvDMW8dB1DHwrun3/x2mroF5irrJH0lm6v6ghr?=
 =?iso-8859-2?Q?ruL0kQW2BRDiZkJum4vSTFFVjXTQGXe1lFse3nhnmnFACx9I0RO9hiqA7t?=
 =?iso-8859-2?Q?r9IPhtNZWTk/hP/3tkNRAI55ihaTxR2ZJ1rgW5OtgtkfkhpW1jNt/+2V6v?=
 =?iso-8859-2?Q?JiURUbrCLIVQJYUBu8SBYbO+HOeMQEi7lNPyqdxcFJEb9eRkSOoTz9rVqm?=
 =?iso-8859-2?Q?RLN7whUT5SgAnP8pwa/kbJwsNpOk6dbWN5sSUfWSxxU/Ia6xiHHdTkhNhV?=
 =?iso-8859-2?Q?XE7WjmyHDFICEtTmloqpPk/qz4TGX3ymAFbLB6ahtlXOUIMPSXZcnPx6/d?=
 =?iso-8859-2?Q?v4dYd+hwxUi+s9xEBi1mEprnTjPjR1eANhqULl9ABb6rjtH+wQOi7lzrUr?=
 =?iso-8859-2?Q?JyZ1P0mHUVdJ3G3JKP1axRELyl6PeuzLCt5FVeAIvUrdOCn4U4RjZIg3HX?=
 =?iso-8859-2?Q?Esfs83uBhsGcs9CBrUBh6opl/knWpyot65M300iQqcvgWYQOS/aYjohDUd?=
 =?iso-8859-2?Q?H25j1y1ni3qvNXaeybaLW6Zm/wJebI5LoZL2Tww1tFUUzemUrXd+g0T5+1?=
 =?iso-8859-2?Q?qWRiY+K4Tl+hyQq/sYTXedeBSatgGYrlZTvhh+1lLvHQ7bc2MHA8QAHZq/?=
 =?iso-8859-2?Q?x7Z5CSGCwRUjss/Rrk2nYm23PSwpnOFE/H2Qv+iHVX9+rIirOI6jdbYYRk?=
 =?iso-8859-2?Q?9fF0NoT+Sc/tw6BFXzu1CT1camoU1CIw/PzS5eKvK6HdxgaJiKl+Brvs16?=
 =?iso-8859-2?Q?OHWC5Zkifka5F8untkEcmYyCMiy0DRVFUYVdnf7RbgK5vh3MH+4mOiYfYI?=
 =?iso-8859-2?Q?bcJrOj1ZacVv0U5qOYZ4KN+N0/5sOj+QSwa3HT8e5fj/nZ8oi8uikUb/ZV?=
 =?iso-8859-2?Q?NJwBC/Y0o8yQLpoI1D6NJD5W+KIUeDKSkwdpJzbB131xKsMjjio2uPBKgc?=
 =?iso-8859-2?Q?+EPI/pg58gco6Sf/AepjdP37qxXVQ1QAEJyIFBXt2kaPzpIyaTXBH5g89u?=
 =?iso-8859-2?Q?YHwOGYNK68LiHa2eQE1t4UDG0IKGBUJrBXgeQ3ULBJtFBRlSa98c41qZ0R?=
 =?iso-8859-2?Q?wwf0R3hRrsc7CyfLUzhj6uLEpOg94WMYfXTUjBJDYbfHH7RBUitTUUUta1?=
 =?iso-8859-2?Q?4YJCfADk27r9dZdaWYTjhOPzEcouphxdCvQMrkMEYcz00IOgaTqGbX+el5?=
 =?iso-8859-2?Q?W/jQbNd85zeqlFaw/JjKeNq3jPp7WhXmIW1T/HsdgLDAeVz0pY7NyT2wcT?=
 =?iso-8859-2?Q?WWSdRB+7n35tn9kvJjbX8UMEA1bFHStwZhXno8BMptj2qlJkLaKO3yWLWm?=
 =?iso-8859-2?Q?dm0kWBo2GhrOotSr+KGyjUZjsXp/yifBDlQBPLy3WOcyzvQZ0eguxzG/bC?=
 =?iso-8859-2?Q?CXxkJdD0Qe55b/vNUnTfrr1ggax/6KX434XUb92JCjMfgSYFcjQLjqjECX?=
 =?iso-8859-2?Q?S6MwPpH7KCtKT+R/LmtQm0C75I5OGRvCxFlj13E2SHByMCRkI9tsHAo6iR?=
 =?iso-8859-2?Q?y3M0hsC+QPQ4c=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53735A682AA5C026FC6EFC3B9138AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592d00c3-ba3d-41ad-a3f9-08db882d3d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 07:53:29.0291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kuLYog50LhkegaulXSoOJ6aXmn6JpGhYkMBnBC+9Co0bfTz7ZdxvHMHMxSPwN7a0Z8QHCL+UeEbVJMYJVz5fbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 07:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184568

--_000_VI1PR04MB53735A682AA5C026FC6EFC3B9138AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable


Hi Alexandre,
I'm running this on docker with ubuntu 22.04 LTS and I have patched tar 1.3=
4 with the patch I have given to you. I know that it contains these paramet=
ers, but they are faulty - meaning the ACLs do not preserve uid/gid in tar =
archive.

Nevertheless this concerns me that opkg-build command should not fail. Addi=
tionally I have tested yesterday running my build without acl and xattr in =
DISTRO_FEATURES and it also worked for me - without applaying acls and xatt=
rs to tar archive.
Generally I need to reproduce your error and it seems to me that there is n=
o other option as to re-create exactly the same environment on my machine l=
ocally, so I could investigate it.

My question is how can we achive it in the simplest way? Does autobuilder u=
se a docker for building? Because if so, I could take these docker scripts,=
 run them and check what's happening.

BR
Piotr

________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: Tuesday, July 18, 2023 11:05:15 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: Alex Stewart <alex.stewart@ni.com>; openembedded-core@lists.openembedde=
d.org <openembedded-core@lists.openembedded.org>
Temat: Re: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr dis=
tro native features support

On 18/07/2023 08:05:12+0000, Piotr =A3obacz wrote:
> Alexander, this message:
>
> > Alex,
> > from what I'm seeing the issue touches opkg-build command:
> >
> > opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-xcb=
-proto-dbg /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686=
-nativesdk' returned non-zero exit status 1.
> >
> > which causes you an error. This may happen with bad tar hosttools comma=
nd. Can you please post me which version is on yocto autobuilder?
>
> > BR
> > Piotr
>
> was meant for you, sorry for the confusion. Can you please verify/check w=
hat version of `tar` is being used on the autobuilder? This is really impor=
tant for me, if we're going to move forward with it, because I have suspici=
ons that it may not support posix or it may not be patched with --acls and =
--xattrs attributes https://eur04.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fwww.mail-archive.com%2Fbug-tar%40gnu.org%2Fmsg06198.html&data=
=3D05%7C01%7Cp.lobacz%40welotec.com%7Cc1ceda9eea4c4969c45408db87d2b6a1%7C25=
111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638253111303120469%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&sdata=3Da2OBzWVj%2B2hsqeRdq3s2S9F59GX002Swf%2FyYlO%2B7bZg%=
3D&reserved=3D0<https://www.mail-archive.com/bug-tar@gnu.org/msg06198.html>
>

This fails at least on:

fedora38-ty-4: tar (GNU tar) 1.34, has --acls and --xattrs
stream8-ty-1: tar (GNU tar) 1.30, has --acls and --xattrs
rocky9-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs
debian12-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs
ubuntu2204-ty-3: tar (GNU tar) 1.34, has --acls and --xattrs
ubuntu2004-arm-1: tar (GNU tar) 1.30, has --acls and --xattrs
opensuse154-ty-3: tar (GNU tar) 1.34, has --acls and --xattrs
alma9-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs
ubuntu2210-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs
ubuntu2004-ty-1: tar (GNU tar) 1.30, has --acls and --xattrs

Really, the question is more on which host this is working.


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cc1ceda9eea4c4969c45408db8=
7d2b6a1%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638253111303120469%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DyO%2BFc0BrkTVuC4MNNDuNVErK81guyI0J%2FN=
xkFT6P1so%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB53735A682AA5C026FC6EFC3B9138AVI1PR04MB5373eurp_
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
<div dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"">
<div dir=3D"ltr">Hi Alexandre,</div>
<div dir=3D"ltr" class=3D"elementToProof">I'm running this on docker with u=
buntu 22.04 LTS and I have patched tar 1.34 with the patch I have given to =
you. I know that it contains these parameters, but they are faulty - meanin=
g the ACLs do not preserve uid/gid in
 tar archive.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr" class=3D"elementToProof">Nevertheless this concerns me tha=
t opkg-build command should not fail. Additionally I have tested yesterday =
running my build without acl and xattr in DISTRO_FEATURES and it also worke=
d for me - without applaying acls and
 xattrs to tar archive.</div>
<div dir=3D"ltr" class=3D"elementToProof">Generally I need to reproduce you=
r error and it seems to me that there is no other option as to re-create ex=
actly the same environment on my machine locally, so I could investigate it=
.</div>
<div dir=3D"ltr" class=3D"elementToProof"><br>
</div>
<div dir=3D"ltr" class=3D"elementToProof">My question is how can we achive =
it in the simplest way? Does autobuilder use a docker for building?
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0">Because if so, I could take these docker scripts=
, run them and check what's happening.</span></span></span></div>
<div dir=3D"ltr" class=3D"elementToProof"><span class=3D"HwtZe" lang=3D"en"=
><span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb ContentPasted0"><br>
</span></span></span></div>
<div dir=3D"ltr" class=3D"elementToProof"><span class=3D"HwtZe" lang=3D"en"=
><span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb ContentPasted0">BR</spa=
n></span></span></div>
<div dir=3D"ltr" class=3D"elementToProof"><span class=3D"HwtZe" lang=3D"en"=
><span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb ContentPasted0">Piotr<b=
r>
</span></span></span></div>
<div id=3D"ms-outlook-mobile-signature" class=3D"elementToProof">
<div><br>
</div>
</div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt; color=
: rgb(0, 0, 0);" face=3D"Calibri, sans-serif"><b>Od:</b> Alexandre Belloni =
&lt;alexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> Tuesday, July 18, 2023 11:05:15 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> Alex Stewart &lt;alex.stewart@ni.com&gt;; openembedded-core@list=
s.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xa=
ttr distro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On 18/07/2023 08:05:12+0000, Piotr =A3obacz wrote:=
<br>
&gt; Alexander, this message:<br>
&gt; <br>
&gt; &gt; Alex,<br>
&gt; &gt; from what I'm seeing the issue touches opkg-build command:<br>
&gt; &gt;<br>
&gt; &gt; opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &qu=
ot;&quot; &quot;&quot; nativesdk-xcb-proto-dbg /home/pokybuild/yocto-worker=
/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-=
xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk' returned non-zero exit stat=
us
 1.<br>
&gt; &gt;<br>
&gt; &gt; which causes you an error. This may happen with bad tar hosttools=
 command. Can you please post me which version is on yocto autobuilder?<br>
&gt; <br>
&gt; &gt; BR<br>
&gt; &gt; Piotr<br>
&gt; <br>
&gt; was meant for you, sorry for the confusion. Can you please verify/chec=
k what version of `tar` is being used on the autobuilder? This is really im=
portant for me, if we're going to move forward with it, because I have susp=
icions that it may not support posix
 or it may not be patched with --acls and --xattrs attributes <a href=3D"ht=
tps://www.mail-archive.com/bug-tar@gnu.org/msg06198.html" data-auth=3D"NotA=
pplicable">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.mai=
l-archive.com%2Fbug-tar%40gnu.org%2Fmsg06198.html&amp;data=3D05%7C01%7Cp.lo=
bacz%40welotec.com%7Cc1ceda9eea4c4969c45408db87d2b6a1%7C25111a7f1d5a4c51a4c=
a7f8e44011b39%7C0%7C0%7C638253111303120469%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&=
amp;sdata=3Da2OBzWVj%2B2hsqeRdq3s2S9F59GX002Swf%2FyYlO%2B7bZg%3D&amp;reserv=
ed=3D0</a><br>
&gt; <br>
<br>
This fails at least on:<br>
<br>
fedora38-ty-4: tar (GNU tar) 1.34, has --acls and --xattrs<br>
stream8-ty-1: tar (GNU tar) 1.30, has --acls and --xattrs<br>
rocky9-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs<br>
debian12-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs<br>
ubuntu2204-ty-3: tar (GNU tar) 1.34, has --acls and --xattrs<br>
ubuntu2004-arm-1: tar (GNU tar) 1.30, has --acls and --xattrs<br>
opensuse154-ty-3: tar (GNU tar) 1.34, has --acls and --xattrs<br>
alma9-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs<br>
ubuntu2210-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs<br>
ubuntu2004-ty-1: tar (GNU tar) 1.30, has --acls and --xattrs<br>
<br>
Really, the question is more on which host this is working.<br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/" data-auth=3D"NotApplicable">https://eur04.=
safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;da=
ta=3D05%7C01%7Cp.lobacz%40welotec.com%7Cc1ceda9eea4c4969c45408db87d2b6a1%7C=
25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638253111303120469%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C3000%7C%7C%7C&amp;sdata=3DyO%2BFc0BrkTVuC4MNNDuNVErK81guyI0J%2FNxkFT6P=
1so%3D&amp;reserved=3D0</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB53735A682AA5C026FC6EFC3B9138AVI1PR04MB5373eurp_--


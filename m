Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.123])
 by mx.groups.io with SMTP id smtpd.web11.5082.1610732119403548142
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 09:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=fW2/j071;
 spf=pass (domain: microsoft.com, ip: 40.107.5.123, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hk7w1KHSB8+Mt1HdJdk6Pu70OcWD2TB3YEINyTwhKMgykaqiFxrIsWjXvMc/icxsdUt+/rTF3ojsCOD56Oly9kv6cx3YOnXhLHqiV3QXH9GralbUr0CruF253va8z/Y1h154HWghfFOgk1hKdIPIf5NF5ONh1tjpyU6K92HhE+drK/tOfuFWynTQJU7D1DyMjfzOAX91ZQ7QzGZVB/gxsHHpP3z3IaVl4K54poj4bHZlrsP1HCeBoLA95COsuzm/UAvGq6k2atJilG1SVeynNe3c72CjGIr/J7pDtcrLG0D0p8bj+HEHzl/tZoYkNrwQdG5OKXPvOCN7uB5i2Wsj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4lAEBMecbO+E2OGTqNOtpv9YtZiJRdnkmo7AC40WxE=;
 b=Tk4AH/lQ+hWtZaSrobtpDVt5KL17J3eXNm8fZFwupvXA/c7591LZPqWtkmkZJUAtbv7+5BrvukwQfSpki9/YTjhoKlYoJVBvAOUwx14n0ESdKr+ijcVJ42/j43xrYX4TxQZlRm+Y8pZHgdTM2B/GfFlSEuNh0f1kDNGcu7u9kvTox2fJNwNM+K9MYN9dEcY6IirnrN1JOVwxFV8cDdTz8sP5cgf+fTWglBuuL3y/ZxrEFsdrwN4ZbHOxrre2f2XoJ/FiS7vY+QbJRQjqTF/SouaQaxnZMDbFSZbqx94EzqkMZHM12UO/SDWd+gl76iaQv0+5/7Xhb1dw+m8DRo0Igw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4lAEBMecbO+E2OGTqNOtpv9YtZiJRdnkmo7AC40WxE=;
 b=fW2/j071uw02RgunW+vAKQD+GF5jBG1860XKILhpIVAF33TX8OwPUbSEDi3X7lWbTWxcjAAcgASGRhK7BjX2mjocGRzfepVTpch7GSpVpMixZuv+0kH32YU4juv/a4kebw72A71lmof79zhWsOrSLcUM+8+nD8qVJTe5vLNXIXM=
Received: from (2603:10a6:821:7::20) by
 VI1PR83MB0320.EURPRD83.prod.outlook.com (2603:10a6:802:7e::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.2; Fri, 15 Jan 2021 17:35:15 +0000
Received: from VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62]) by VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62%3]) with mapi id 15.20.3784.003; Fri, 15 Jan 2021
 17:35:15 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "paul.gortmaker@windriver.com"
	<paul.gortmaker@windriver.com>
Subject: Re: [OE-core] [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
Thread-Topic: [OE-core] [PATCH] systemd: dont spew hidepid mount errors for
 kernels < v5.8
Thread-Index: 
 AQHW6v8fqMq71K27ak2LTnjm7Qp9qKooXVEAgAAWQYCAAFEcgIAADf4AgAAIgoCAAAZ+gIAAB/0AgAAJ54A=
Date: Fri, 15 Jan 2021 17:35:15 +0000
Message-ID: <9fa544389d040b0fbacd14a1861cac0721d7d2c0.camel@microsoft.com>
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
	 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
	 <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
	 <20210115144724.GM16838@windriver.com>
	 <96b7ff9f43b96d80021b3f797a6295de210711ea.camel@microsoft.com>
	 <CADkTA4MHjfrAf01PDVY8hyR9r_f5mqheLomuWKuUZY-+Rgi0=g@mail.gmail.com>
	 <6b4797ffe82f0ddd48352363ad85b3e5a52c3f7e.camel@microsoft.com>
	 <CADkTA4PrQefBMme_z6JAquZCv=7CYMsq8OA4+Y7xVHwL=VjseA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PrQefBMme_z6JAquZCv=7CYMsq8OA4+Y7xVHwL=VjseA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3875b04d-a37b-45f3-168e-08d8b97beb8f
x-ms-traffictypediagnostic: VI1PR83MB0320:
x-microsoft-antispam-prvs: 
 <VI1PR83MB0320A093161C80F8C5887108F1A79@VI1PR83MB0320.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MsxtDsZDSkhew/siP/NCAsHZWoK9qhWKEkEDce2DyzA8tvDx+X425lb4JaG2vhCr9XhtyI4VbYVP42foDvinqyY0cqLcg6QA/jI0mQHx6Q8JykkoMpFU7ZmmAoFowqhwTb56WuOV6wR9K1sMfohjP6/P5Xt4HC4AXSASJyd/LMf+jr/IUu2K/fRYxbDdmalE8xt8g+KpRoWPhbE4nox4dQoLcrO8PC9alVVWON91vZ7TzwwCqIJ5Jn5K/HfSeOWwX2Bpi11e8rPxeF9TW9POKcdS8UxjBniLXpmUqSF3dWVn8uf5rdXOlEdg6n0MBt1PasTP0YVUs3qVAcEppMtwGnIhIrJkM+lH+/Q7FLs8jCccp2rY6pZupOBIFH3G2GKsoTkZSqVvEGAls+Rs1BoQOyfrNP/oxRTKyJ9A/0l7vHcLqLKr4QtSMPS6Uim2rt2ezuDvGOJeiXTAIokzKG0LMNkVYDr+J7tU31UR//mVBDFW4bxWERPYoNlY+HTtjWGEOoecNcDgyyYzwbHkmo+VNTsguQZl2LoDbM/0i3pWaXm8dHwz/ILxmEfrjr4cRbXlXBxDMYwVHOgaJ09oj7iZPw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR83MB0205.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(6916009)(6486002)(99936003)(26005)(6512007)(8936002)(2906002)(71200400001)(53546011)(2616005)(10290500003)(86362001)(186003)(54906003)(478600001)(66946007)(66616009)(82950400001)(5660300002)(8676002)(316002)(4326008)(76116006)(66476007)(64756008)(66556008)(36756003)(82960400001)(6506007)(83380400001)(66446008)(192303002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?Yk5VSEJxQUw1bFIwdHpmZStnazVuSE1sTHlKYXdicVJMdUdhVW9jTndhaGhO?=
 =?utf-8?B?L2pnNEFWNGlMcEJTQzZxbUdKU1djN1daNjBsTmhQUGI4OGw5UUhNcldYS2VR?=
 =?utf-8?B?T0txbXFxbzl0blpMYnpaQVE4OFN3MnJqMFlCcmR3MUlvL0l4U0FkTUNlZVFP?=
 =?utf-8?B?K0NCUHNWNm9mMURTR1dTT2NaRDMxbjJXSW5IZWdMUHRvQzBMcGJRa3hlL0hU?=
 =?utf-8?B?VW1aQjJ3RjFnSzRKZXVEaC9UdHpxbWtaNDJvdGk2V01DTXJJTER2VUl3MFUy?=
 =?utf-8?B?dkVtQUtrU1crd3Bvc1dDbHlFNUtqeXZRbW05aWxrL1c1V2JCWUF1KzQvazdz?=
 =?utf-8?B?L1ZwZkJJeStVdzBkNmxsWWV5VnFtUGNzUzQvb0VWZzFxeE4za2pMVGlJcFB6?=
 =?utf-8?B?bjVjaXlMWmQwOE1zNHB0c3l6aXlxKzhpT1JvaVlDTWwzSEh6bW9QZjM5Tklv?=
 =?utf-8?B?c0RNSGpxdWJpZi9wZ2Vmalhkd09nK0hNRjZML1E2ZkdSYjdwVGs2cGJ6Vy9Q?=
 =?utf-8?B?eWgxSEg2KzNuVWZTdUR3QXlvclpmdGhnN0ZiYW9wSTNqQUwyakNUSGd6QXV0?=
 =?utf-8?B?Vk1lbm9ZdGlwRzdSK0YrWlVpb0dGa0p6aHNNdGt3MUpSMDJ4ZHluZUFrbVdD?=
 =?utf-8?B?MXJRelV0eWRScThsR2JpUm43VExQWFJaSlV4OFNvYjVYdjdRZGtDeEdPK1Za?=
 =?utf-8?B?OHdva1Y5MFJlRmtLVkk0Rm0wV0dpRmJMSXNVMVpUQU9WRkdWZVF4NXg5aDFp?=
 =?utf-8?B?TFR0L0QraVBob3lMK2o2aXNZTy82RlozaHZpQUU3WFc5bHV4ZkZXOGFhN3BB?=
 =?utf-8?B?MG9LSWZDdHo5enFJQXBKaVU0azJjTzB3VUhtVkk1M2ZNVHJTSVBUMVZwZDJU?=
 =?utf-8?B?Z0ZOWVpHUDk2Z2pLT2VETFFFZG9RenRSem5hSzl4Q3R6dkxRdUFwNXJFd2x3?=
 =?utf-8?B?SUExZHpyd1E2UGwzcnEvZ2htTXd5RE51V2NnKysrMEpncVRSYm13ME11UzZW?=
 =?utf-8?B?OTIwb0VSN2ZOcEdXWEIyOE9JaFV5VVVhNlpsNkorcXc3UmVGN2dZL1dOTnhu?=
 =?utf-8?B?bFZxMEpNazFlVlNmbTR5OGprN2xEMGdMUmhyZ09YNkJXaWZKSG9IRTloUU5u?=
 =?utf-8?B?bUVPdzNNd29KZnpvWFRxUjArcC9zOWQ3NHlVNFBLOUpWdUJnazdYaXdlalpp?=
 =?utf-8?B?UEM4SkdyV3ZPd3B2YjVLWEtWVXJWSXVaMmhFeFBUWEV6Ulc3TkxaWUxER0VI?=
 =?utf-8?B?ejIxVU9QOHVzczFib3NmMGlEQVVrN1RLQlZhWlFxWi9FbnJpNVB6WEpOK2dO?=
 =?utf-8?B?S3VROE9JQXJmYy9qZ0pvaFZsSjA4SzFPbVo1ektMNC90OGVkNzlmVloxZWha?=
 =?utf-8?B?dHd5VW5YbXdMOXVoa3RWQ1VrSEx4bXk2N1FsVFZpY0t4a3ZWYnR5SERWNVJD?=
 =?utf-8?B?U21hY0VlakROSzF0b2Mya0NjaGhjQW5iRTNJdVRnPT0=?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR83MB0205.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3875b04d-a37b-45f3-168e-08d8b97beb8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 17:35:15.5385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: seAxmO8ZqItnJ5ey4OGY0rScWyMhNaTY1AG80NrgWMTRE2Cx8S0GSjH4TJVOg4U0MerX43ULc8T+NC4k27xWHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR83MB0320
X-Groupsio-MsgNum: 146846
Content-Language: en-US
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lAih69eqAX896M+PDlYt"

--=-lAih69eqAX896M+PDlYt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-15 at 11:59 -0500, Bruce Ashfield wrote:
> On Fri, Jan 15, 2021 at 11:31 AM Luca Boccassi
> <Luca.Boccassi@microsoft.com> wrote:
> > On Fri, 2021-01-15 at 11:07 -0500, Bruce Ashfield wrote:
> > > On Fri, Jan 15, 2021 at 10:37 AM Luca Boccassi via
> > > lists.openembedded.org
> > > <luca.boccassi=3Dmicrosoft.com@lists.openembedded.org> wrote:
> > > > On Fri, 2021-01-15 at 09:47 -0500, Paul Gortmaker wrote:
> > > > > [Re: [PATCH] systemd: dont spew hidepid mount errors for kernels =
< v5.8] On 15/01/2021 (Fri 09:57) Luca Boccassi wrote:
> > > > >=20
> > > > > > On Fri, 2021-01-15 at 08:37 +0000, Richard Purdie wrote:
> > > > > > > On Fri, 2021-01-15 at 00:26 -0500, Paul Gortmaker wrote:
> > > > > > > > Recent systemd started using ascii args to "hidepid=3D" mou=
nt options
> > > > > > > > for proc fs - unconditionally -- even though kernels older =
than v5.8
> > > > > > > > emit an error message on each attempt:
> > > > > > > >=20
> > > > > > > > root@qemux86-64:~# cat /proc/version
> > > > > > > > Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc =
version 10.2.0 (GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
> > > > > > > > root@qemux86-64:~# dmesg|grep proc:
> > > > > > > > [   29.487995] proc: Bad value for 'hidepid'
> > > > > > > > [   43.170571] proc: Bad value for 'hidepid'
> > > > > > > > [   44.175615] proc: Bad value for 'hidepid'
> > > > > > > > [   46.213300] proc: Bad value for 'hidepid'
> > > > > > > > root@qemux86-64:~#
> > > > > >=20
> > > > > > Wouldn't it be better to patch the kernel to downgrade that mes=
sage to
> > > > > > debug level?
> > > > >=20
> > > > > The problem is that the breakage is forced upon older kernels, so=
 you'd
> > > > > have to effectively mainline that kind of "fix" to v5.12 (where t=
here is
> > > > > no problem) and then you could in theory request it for v5.4 linu=
x-stable
> > > > > according to "stable rules".
> > > >=20
> > > > The patch could be downstream for older kernels, just like this one=
 is.
> > > > With the difference that it would be temporary.
> > >=20
> > > But the coverage is impossible, since there are so many
> > > different kernel trees. So a kernel solution is a non-starter.
> >=20
> > IMHO a long term solution can only go through the kernel. There will be
> > more instances like this in the future, given the fundamental issue is
> > the lack of a clear EOPNOTSUPP-like interface. I realise the mount
> > interface is ancient at this point, and difficult to change. We are
> > keeping an eye on the evolution of the new interface, but it's not
> > there yet (eg: no read-only bind mounts).
>=20
> I don't disagree .. but I'm only commenting on this one older kernel
> issue, so there's nothing to see in the new kernels where I spend
> 99% of my time. The interfaces in the kernel will absolutely evolve
> in the newer kernels, and that's a good thing.
>=20
> > > > > Besides, if something with root/mount priv. is consistently tryin=
g to
> > > > > drive a square peg into a round hole - by trying to mount somethi=
ng and
> > > > > failing -- it should be something that a sysadmin would want to
> > > > > investigate.  Which is precisely why I am here now.  I think bury=
ing it
> > > > > at debug level is counterproductive to that.
> > > >=20
> > > > Well the real issue is that there's no way to get a clean "we don't
> > > > support this option" out of certain kernel APIs, so one has to gues=
s
> > > > and see what happens. Sometimes it's even worse, and flags like
> > > > NOSYMFOLLOW get silently ignored if they are not supported, which i=
s
> > > > not great for security-related settings...
> > > >=20
> > > > Anyway, these warnings only appear if ProtectProc and/or ProcSubset=
 are
> > > > set to something other than the default value. Why not simply add a
> > > > top-level drop-in in /etc that forces them to be disabled in all
> > > > services if you have an older kernel? Something like this:
> > > >=20
> > > > /etc/systemd/system/service.d/10-override-protect-proc.conf
> > > > [Service]
> > > > ProtectProc=3Ddefault
> > > > ProcSubset=3Dall
> > > >=20
> > > > And then you can drop it when you upgrade your kernel. Isn't this a
> > > > better option than taking on permanent technical debt?
> > >=20
> > > That's even more fiddly than Paul's patch. It relies on much more
> > > of someone's distro configuration.
> >=20
> > But what is the combination of a kernel version + systemd version if
> > not someone's distro configuration?
> > I mean, it could even be added dynamically by the poky recipe at build
> > time, given the kernel version is known at that point.
>=20
> The kernel isn't currently a dependency of systemd and you'd be going
> outside of the recipe namespace (but maybe I'm missing something, I
> spent about a minute refreshing my memory on the recipes) .
> Something at the image/rootfs level, gets brittle and doesn't scale
> (but again, maybe I'm overlooking some technique).

There's the get_kernelversion* functions available to recipes,
reasonably widely used already - so something that checks it and
conditionally installs the drop-in should work fine, in theory?

> > Surely a three lines piece of configuration is better to handle than a
> > downstream patch?
> >=20
>=20
> Not in my opinion. I have no interest in extra moving parts and having
> something injected into my userspace/init config.

There's half a million things "injected in your userspace/init
config"... I mean, that's what a distro does? This is exactly why this
config knobs were added, so that distro builders can customize the
behaviour to their liking.

> > > But it is true that you can throw it away eventually, assuming
> > > someone actually knows that it is there.
> > >=20
> > > I wouldn't call this patch much of a technical debt, but if it starts
> > > gumming up systemd upgrades, it's easy to revisit.
> >=20
> > It's in a security-critical area that we are constantly improving and
> > expanding.
>=20
> That code block isn't particularly complex and it is self contained,
> so really, there's not much to see there. But I'm not in the business
> of predicting anything, I'm in the wait and see camp (AUH will be the
> first to pick it up if it causes patch problems, etc).
>=20
> Richard can either take the change or not, I'm just supporting how
> it has currently been submitted as chances are that no further
> revisions are coming from Paul, so it can live or die as-is.

Even if a patch was preferred to a config, the current patch changes
too much and should really be reduced in scope, as commented in the
other email.

--=20
Kind regards,
Luca Boccassi

--=-lAih69eqAX896M+PDlYt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmAB0lEACgkQSylmgFB4
UWL1iggAm5uw2yLcVzPH9LwkRj0raXMNojjSyelOJoxadCHoEeshSyxBxVB0mXNm
yqMF3lsClsQvOp+VUHdxuS7W2RPXR034Sz9BL1i3voVJcsI7BL1Xlb2aaT4xMpea
sX8fjRzrPBE0E20eJScsKD4T36BmdTMYFh3eXy8/nP0qoU9y4iivUkViZv+auanz
8kbuuJwRwUrPQea4OGqNK52kATEocnOXOFP15bkFoVEsnRExL5pYhIwpeDo31CZ/
RTui1G15oQlRXkXA5a49qdO218dNE5MUzCLuQnOFG7jMk7aWxJISnB8wgSP89Lmm
2zl7CHzSsRERb1b8Kf07e6eoAh9gbA==
=A4VO
-----END PGP SIGNATURE-----

--=-lAih69eqAX896M+PDlYt--

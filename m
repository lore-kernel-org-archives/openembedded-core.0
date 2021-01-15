Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.128])
 by mx.groups.io with SMTP id smtpd.web10.4071.1610728281764933319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 08:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=hm7QcCtL;
 spf=pass (domain: microsoft.com, ip: 40.107.21.128, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mL/A6IaZRo3eJkvXH8XxO5CjmXrAgwKIICsrynG8N1EdjjOVAwqlr6+I2Pd09Tad3aOj2G7F41oHa0obuhePcVX7ZWO6vqIme0bvRmFdU0tLM3q+Gx+186DcMeRv4DHyiVDp0ZtRZLbNQn4zszWxt5GY2ZybazfieosNlhMgW63S9cphfWPY+nU77ewVuy8c3Cl+/XO0sCHu2hPIB9n4ufnlmkOfgZEtnM+jODrbw2asTYswQsjiOdo4m9oQtmemdImaDGJ+HczTzP9mnNzDntTkkxoHd/S+1wQtfYPg7WGdQh9enSICeyOe2wswU6Am0TyTDzibl7eXI0itnDRpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+ffYKoxPaeutIB64JVPln5dpev1qxDC5mahcXhpHuQ=;
 b=IsBhiKQ+2De0ANLujc6oo0wVv51rnafApnhRDekCuPQmVNMszECYs+vhUm0kej6E5zgd8nzIJ4X7g5zLHt3pQIVSH7Io9xXxRltc9pRiCKRyoROxWrKJ1EFHKP10qaRSoCBdfoY9kJM5lXmF4Ffn2oJI1sR1BURkEffwC4hKCjYi7u6YiXr/G3Brt9m8+7O2IZn5jkql1G+j8t+Ln/bieuuNqwqQE6Xg16HXkguKTbbnQzKwyNYSbjh+zcdlwjzbV4zcLYAXNZwj6jO4gsTqcFD4/vWjY3debusG1yarWHoCKDTMIyGQp8nGjs3NNzl0E5DGLS0N6P4hi5dIbmo9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+ffYKoxPaeutIB64JVPln5dpev1qxDC5mahcXhpHuQ=;
 b=hm7QcCtL/zYvyOFxnf92lCyY/FSXJpp8ulbs4VoPWKxell1OqvF9e9mzJ2Bn3gaDtnjaHznmnVgQxgSjfSFnu3e8SJCqwq/iHKdTsnDTSBSnL2uYKkySuIBSfcLZNrh+etUMmY0pA67gesVvacgCork5Gy+Uu3ekKJky+0b2eXM=
Received: from (2603:10a6:821:7::20) by
 VI1PR83MB0301.EURPRD83.prod.outlook.com (2603:10a6:802:7e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.3; Fri, 15 Jan 2021 16:31:13 +0000
Received: from VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62]) by VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62%3]) with mapi id 15.20.3784.003; Fri, 15 Jan 2021
 16:31:13 +0000
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
 AQHW6v8fqMq71K27ak2LTnjm7Qp9qKooXVEAgAAWQYCAAFEcgIAADf4AgAAIgoCAAAZ+gA==
Date: Fri, 15 Jan 2021 16:31:13 +0000
Message-ID: <6b4797ffe82f0ddd48352363ad85b3e5a52c3f7e.camel@microsoft.com>
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
	 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
	 <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
	 <20210115144724.GM16838@windriver.com>
	 <96b7ff9f43b96d80021b3f797a6295de210711ea.camel@microsoft.com>
	 <CADkTA4MHjfrAf01PDVY8hyR9r_f5mqheLomuWKuUZY-+Rgi0=g@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MHjfrAf01PDVY8hyR9r_f5mqheLomuWKuUZY-+Rgi0=g@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 81dfae88-1beb-4269-f558-08d8b972f99b
x-ms-traffictypediagnostic: VI1PR83MB0301:
x-microsoft-antispam-prvs: 
 <VI1PR83MB0301A2F1FF013F8B40C5515DF1A79@VI1PR83MB0301.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MjjLDtzQoae9ext7TqfqlG/e8RDlH1ms5ZA9TFGy9APirGuFosU1oqA6yboaN6wGj4yOc1hKsSFHjNaRAJz7XVkdS/1mEc/Z1F3qI5j8cUW/DenTHW1jRjy0h4RH3Vb1dAvmj9Z+GxA/sjiV3rlsG76I/PwlKH4vlFVHngn3PM+EDjzqpivKrd+dH3+955t3z8IcE9i617/mXzki2YqM1bO/ZNspfzuUgOtKEmPvJmybjf2mnjZm/culu6HSl/BFBecqz5k5Oql17siggdVHkt0J7WUwTfojf/vpvfTMLfzBYwfYcy574FkF7EdoyxLqbWhR0zH0rfOw9fAqhhozqekzC4c0PHxm0yMqQT9ifdFsUoTaHkoaY9RZCLGEyAOa1ocNY7OJ7y2dUoCVf9OJf9vUH2rIw7/GuEjyxvMJkMxy1qbz4kFCz+oCoVq8ROsnuxxhXksNYLhX2x+iDbLTJAsI42AUkpmG0mmPobJWKsZfS+DWEiFETKtbCvOXREXFBBGC9J39GRPPV4oUY5lGKBxinC+A56GV1BLW6leBWAQMPnAjpUjrnMUukJWDfCZt
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR83MB0205.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(53546011)(2906002)(8676002)(8936002)(6512007)(186003)(86362001)(26005)(2616005)(82960400001)(10290500003)(6486002)(4326008)(83380400001)(71200400001)(76116006)(66616009)(36756003)(316002)(64756008)(66946007)(54906003)(66476007)(66556008)(66446008)(5660300002)(99936003)(6506007)(478600001)(82950400001)(6916009)(192303002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?amVLYk1HZFpmekd1Uk1vZnVPdUhHYjRTeExHakFJTVJjR1Z1Q0hDUGZFcDJ1?=
 =?utf-8?B?Yy96RExDYUhZWWNFdE1FbG9WRUxSVi82NlZKQ295ejllSEFEWGs5cGIvaVlZ?=
 =?utf-8?B?VXM4RkFNZXpkNUI4OFNZNlRnSjk5a2g5LzBGMWFpUzZsTElVOG1oRnMyZ0la?=
 =?utf-8?B?ZEdod0k5M1RoRnhpUDd5V2RBOENPY1RzYXpQR3F6NUNKb1ZBNmtWV3IraVFh?=
 =?utf-8?B?Sm1sd3d0U0tqY2RtdjFKREs1SENYbUprSlkrVkZhbmRqak5vODhlMVcyZE5E?=
 =?utf-8?B?MXRacHc3WFo3d2tXdjVQeHVRT0xDUWNmSTUzQmU5a0N4ZkdhR3EyQnpQUE9j?=
 =?utf-8?B?eGxSd1VVUUg5NDRBMTU5aDNNSjhnL2tUMnhLOHBNUytwSldkL1BRQnEzZTg0?=
 =?utf-8?B?L0NObGx3ak5BdWJTeTBqZXVNMkFOZlRZNXN5ZTZTOWR0RFVCVXRHaVpxeFdW?=
 =?utf-8?B?YmNGN0NMcVp4QmV2Z3VrZlk4eGt1QmIzYWZHaEhQK2tZd1dwTWxENlZvWUdU?=
 =?utf-8?B?VEl3YTZxYjZUTnV4R1BCdWtKaUdwblNaT3Z6cVNpZm9YZ0o1MTlxQklhNDN4?=
 =?utf-8?B?K2RsQWh5S1lrQXpNb2RxWlM1bEF6T1hKb3pIZUZ5Q0dlRlFKUHZmaGpaOEZn?=
 =?utf-8?B?dmRmb1MxOU80VE9oL2VuSTN1NjhwYXZ6NHJBdEZXNllNWUczS0NobXpCOTJO?=
 =?utf-8?B?QUViNUppamdFTDZFdW1vQTRUSytnSmdvQy9sTG5HaFRFK3JkK0hGYmtlazVz?=
 =?utf-8?B?dFh6UU9wYUVJWjZsZ2dxbjFQVjRiM2Q5dWtCbDdJdlhBNzdsaUlTamxEN3Ns?=
 =?utf-8?B?TGhyWXZpSnZ0VjlWWDVJcDBiZ0h0NEdhWkU0b1hpMnY3d0tiN1c0a2lJY05O?=
 =?utf-8?B?ODI5aUlQTTZzSDlSWmozSzF0N2JpUndySTJPWDFrbFhiL2RtY2xDTUtQSU1W?=
 =?utf-8?B?cnpVWUl2Wng5UTNNTmRvUVFmRUxxRm5DOXc0ZzAyQ2QxWDF1NHNiRklScmdB?=
 =?utf-8?B?OGhXVml5WjNoejNrcWx5ZGVGZ1BBbjB2MDE5SnpoUFpCSXVKaWRRUEpNNVFL?=
 =?utf-8?B?YVpjUWxkQ0NnSWg5dlJXQmFVTWhOd2k3ZWpRZzY2QkErejFDR0RRNTgyLzIx?=
 =?utf-8?B?S2tCUmJmdzdkS2NzMUxLUzlMMGRtNU4wdW53VmNZT2hhZ1ArN1NmZUlZMzJy?=
 =?utf-8?B?eGtRZ1B0VlUvc0RNazB1V2RWSkVadUNLNWNNcjNYWmVmajhLVjdVSyt3YTdO?=
 =?utf-8?B?cFFHRmtRMkJSSUtlNXBoRGZTeU52MFZtT2VGNU5LZTBBNkpLeUdjYlpIMzFR?=
 =?utf-8?B?V3dkblVUQlFmVE45VjZ2L2RaN1ZPRDF5RmtOUkp5RzZXVkZscGFidUJabEVD?=
 =?utf-8?B?a2x6ZHRpbXVCTzNjT2J3VzJjWENDOFl3cGZlaGI4enVGdkd5eGI5SjlVeWV0?=
 =?utf-8?B?NWJGTC93djdNbThDOEpZVE5iOCtwdEdGOW8xK3dRPT0=?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR83MB0205.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81dfae88-1beb-4269-f558-08d8b972f99b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 16:31:13.6723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jci+MbziaqKPLw039voCEtQU9Pnt4mxmoX9HsD2gIN/CkQQfWg9NWiRlIV8TFlcQ+j5DwJucxAJApHOl81+y6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR83MB0301
X-Groupsio-MsgNum: 146834
Content-Language: en-US
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qwWDTnxDvJk3y5WHCF5p"

--=-qwWDTnxDvJk3y5WHCF5p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-15 at 11:07 -0500, Bruce Ashfield wrote:
> On Fri, Jan 15, 2021 at 10:37 AM Luca Boccassi via
> lists.openembedded.org
> <luca.boccassi=3Dmicrosoft.com@lists.openembedded.org> wrote:
> > On Fri, 2021-01-15 at 09:47 -0500, Paul Gortmaker wrote:
> > > [Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5=
.8] On 15/01/2021 (Fri 09:57) Luca Boccassi wrote:
> > >=20
> > > > On Fri, 2021-01-15 at 08:37 +0000, Richard Purdie wrote:
> > > > > On Fri, 2021-01-15 at 00:26 -0500, Paul Gortmaker wrote:
> > > > > > Recent systemd started using ascii args to "hidepid=3D" mount o=
ptions
> > > > > > for proc fs - unconditionally -- even though kernels older than=
 v5.8
> > > > > > emit an error message on each attempt:
> > > > > >=20
> > > > > > root@qemux86-64:~# cat /proc/version
> > > > > > Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc vers=
ion 10.2.0 (GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
> > > > > > root@qemux86-64:~# dmesg|grep proc:
> > > > > > [   29.487995] proc: Bad value for 'hidepid'
> > > > > > [   43.170571] proc: Bad value for 'hidepid'
> > > > > > [   44.175615] proc: Bad value for 'hidepid'
> > > > > > [   46.213300] proc: Bad value for 'hidepid'
> > > > > > root@qemux86-64:~#
> > > >=20
> > > > Wouldn't it be better to patch the kernel to downgrade that message=
 to
> > > > debug level?
> > >=20
> > > The problem is that the breakage is forced upon older kernels, so you=
'd
> > > have to effectively mainline that kind of "fix" to v5.12 (where there=
 is
> > > no problem) and then you could in theory request it for v5.4 linux-st=
able
> > > according to "stable rules".
> >=20
> > The patch could be downstream for older kernels, just like this one is.
> > With the difference that it would be temporary.
>=20
> But the coverage is impossible, since there are so many
> different kernel trees. So a kernel solution is a non-starter.

IMHO a long term solution can only go through the kernel. There will be
more instances like this in the future, given the fundamental issue is
the lack of a clear EOPNOTSUPP-like interface. I realise the mount
interface is ancient at this point, and difficult to change. We are
keeping an eye on the evolution of the new interface, but it's not
there yet (eg: no read-only bind mounts).

> > > Besides, if something with root/mount priv. is consistently trying to
> > > drive a square peg into a round hole - by trying to mount something a=
nd
> > > failing -- it should be something that a sysadmin would want to
> > > investigate.  Which is precisely why I am here now.  I think burying =
it
> > > at debug level is counterproductive to that.
> >=20
> > Well the real issue is that there's no way to get a clean "we don't
> > support this option" out of certain kernel APIs, so one has to guess
> > and see what happens. Sometimes it's even worse, and flags like
> > NOSYMFOLLOW get silently ignored if they are not supported, which is
> > not great for security-related settings...
> >=20
> > Anyway, these warnings only appear if ProtectProc and/or ProcSubset are
> > set to something other than the default value. Why not simply add a
> > top-level drop-in in /etc that forces them to be disabled in all
> > services if you have an older kernel? Something like this:
> >=20
> > /etc/systemd/system/service.d/10-override-protect-proc.conf
> > [Service]
> > ProtectProc=3Ddefault
> > ProcSubset=3Dall
> >=20
> > And then you can drop it when you upgrade your kernel. Isn't this a
> > better option than taking on permanent technical debt?
>=20
> That's even more fiddly than Paul's patch. It relies on much more
> of someone's distro configuration.

But what is the combination of a kernel version + systemd version if
not someone's distro configuration?
I mean, it could even be added dynamically by the poky recipe at build
time, given the kernel version is known at that point.

Surely a three lines piece of configuration is better to handle than a
downstream patch?

> But it is true that you can throw it away eventually, assuming
> someone actually knows that it is there.
>=20
> I wouldn't call this patch much of a technical debt, but if it starts
> gumming up systemd upgrades, it's easy to revisit.

It's in a security-critical area that we are constantly improving and
expanding.

--=20
Kind regards,
Luca Boccassi

--=-qwWDTnxDvJk3y5WHCF5p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmABw08ACgkQSylmgFB4
UWK7gAf/T8YG5C0jB9UXTTTIi8hQr11SheP1AnX6ttmrrXu0qp/Y/lPlge8KZ3ZQ
aY8COZJlSZgw1k5+HUtertj572MPp2b5P6pSO0Z7WhrhSS0x+bsHjUH8lnkisL0P
QSP01Mm19VM//9H97HQ5txXC3Fuqc4P5wQTPqGsEJIv0GrqPNS9Jt5MGE2UaVZw/
06RJCmd9aJa57E4ii0KVfH+W/Wkv0IY3v42FXllTQy6Cij1hGnQ6PwR08UjpDhea
0/ytz/BQKvHGvk27xyDuqLMqUk5rwsv6/phFas3l2B4oGDKsdRK4pO9RiU8DE9+W
8MqQONGSqR/lTGaWh/fwpWma5eNMYg==
=YLa6
-----END PGP SIGNATURE-----

--=-qwWDTnxDvJk3y5WHCF5p--

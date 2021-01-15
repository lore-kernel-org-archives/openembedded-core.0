Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.112])
 by mx.groups.io with SMTP id smtpd.web11.3100.1610725055718729578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 07:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=RFg91U8d;
 spf=pass (domain: microsoft.com, ip: 40.107.8.112, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVgYkqDcwAZhvCU6U8TeNOe6tN8fHJ/Al9erLqW7DiljHHaPFEVwhwRLFMJ/BarKNL4RAvNuFwnAtKcBYV+9mm9oBLvHtv+ZmlxQyfrUmPlmXXtcf44snFuKb9D2QsxASLVgKyWTOATNPQCgJn0Y7rYaIqlrirCoNpapoc2zFzKUzigOmZLNPIFNGBOCaAKJyo3FLP3iOeKlcUsCQeS3SuZyzrNAB3qzgNegw4q7f6G84OMDluPexC+NXozS1xHk/PFU61vYnnx356bD5rfiMD9P0sPJokuQkVRuagwIfgeLIF07H1t9Qo0dpe+s280jKI0sucZXxXJUHkqIGv3p8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8SOREZm1otcGadW65EmhrsT8c8yeFgRbYMCuZ8NTJ0=;
 b=OCjHAnnfwsAO9RL80GniQd9IUEyfKxfpuDLy2SxyGuIBgY5tM1MrDelbV+Oc7SXeNnbkvQ7cslUV3MAOW+42wlx9t30dpNcRE3IzQXSj1Y/TZLGsdu/xLUHXkek/ENuy0UQ4+NAr6W2+QO0IBZ2TzXMpmywrZU1HpuMZNMiWwGdqqrDXUOn5/beh/BvpU5tXmKy5eBeRmFELHF3KJWAeXf/N3yQuqzHMsJPq7m6tqgEoAbVOlZqDyQmjqkFcnCzYDQedK96JaNiSZVdrTYfdW1xaleQjZ6LPIIfTssiPGdnI6pww1JNmZG3q7xmT2+jXkuM2om/TkviU4tZvvwTfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8SOREZm1otcGadW65EmhrsT8c8yeFgRbYMCuZ8NTJ0=;
 b=RFg91U8ds2wyc0sQsqe29qPrJIHGEcRLrwx/92k949a/sZBYgO/Q6RzB7jgOYDhPP3Eo2bJDiKNJyvVmT5Xfl7XU4QDKqWsqELFfZXzXXjsT6wtEc8G+Ba8ngfXjrimgvx9r163MIg+DqGa00KFU7fPRtq3NFRS+wtZ7fA1NgWQ=
Received: from (2603:10a6:821:7::20) by
 VI1PR8303MB0094.EURPRD83.prod.outlook.com (2603:10a6:820:1b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.2; Fri, 15 Jan
 2021 15:37:32 +0000
Received: from VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62]) by VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62%3]) with mapi id 15.20.3784.003; Fri, 15 Jan 2021
 15:37:32 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
Thread-Topic: [PATCH] systemd: dont spew hidepid mount errors for kernels <
 v5.8
Thread-Index: AQHW6v8fqMq71K27ak2LTnjm7Qp9qKooXVEAgAAWQYCAAFEcgIAADf4A
Date: Fri, 15 Jan 2021 15:37:32 +0000
Message-ID: <96b7ff9f43b96d80021b3f797a6295de210711ea.camel@microsoft.com>
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
	 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
	 <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
	 <20210115144724.GM16838@windriver.com>
In-Reply-To: <20210115144724.GM16838@windriver.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.2 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7c3033d8-2fec-463f-135d-08d8b96b796e
x-ms-traffictypediagnostic: VI1PR8303MB0094:
x-microsoft-antispam-prvs: 
 <VI1PR8303MB0094455E2F0215ED8F770FFBF1A79@VI1PR8303MB0094.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PxioCz2CbahB9tmy8JtHB9btiuDb6foB7VJzhYge20KofCPgVWuYhsa9QBf+zkXUufR1IhAOnving3cH5ZN1bZGLcRsBQ+NaC8L/rAmJriqLlu16dREgF9onBr+mYgQj3TURmA/kqh4dDtewEgQi65RdbDzUMQZmHybOvSidkwwuMuTPpsTCQPyoBWkmGhNetcMo5/ePhZDV97bJKVN9fIiZdplG07MvpTWeZDAHnTegZ+pr+nta9OoTNqS6o2CPggVr+sdFDYqxbf1LjNot9CQqlnqQGp7AQeQErdptqeJxSp5ssi2svN32Jzh8mlY427ih1C96I0zdDa36OJxnvZN5Yun6Cu9b97zqACGW4hI2H3oqzFr3JkwR/1H/6oQze2Bngmi0HLm9nRv1Z0ezHRUSRrpV3zKhOBMiz5whBFVoCyOIdDgLFAvVXTlNK3lROT4J7fBdP4n8LbX/qTD992w7cUbJytpr8uyxfMgdqJwbokfLpWvBpnR7viQB0ePGyeog7jsXtSDrPw/81C+FmYF4AhXN7StDFqQjwB50Y1wRMj3rjwl4CMkq54Dn7EOqq/k3GRAJKouxAelsreqpsqZIWfbRSZmmdhLCeeAab04690XL9spw+DwSnMyNj84isz4Ahkil9rGzjcxqs172Sw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR83MB0205.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(2906002)(6486002)(83380400001)(186003)(86362001)(6506007)(99936003)(82960400001)(82950400001)(6512007)(26005)(10290500003)(71200400001)(4326008)(316002)(66476007)(36756003)(8936002)(966005)(54906003)(478600001)(2616005)(5660300002)(8676002)(76116006)(66946007)(6916009)(66556008)(66616009)(66446008)(64756008)(192303002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?RmZ2cFl4dUhKL0dsdkZjSzZFcEJJVkFNNGpIQ3QrQi9OUmRlbWZQays2ZXRD?=
 =?utf-8?B?bEt5V2V2bjFWMmd6bEVqSmdPSFJoVUhCeUdXWTJjKzZLbXlsdDc0cmt2T01G?=
 =?utf-8?B?anpQRlU4OU41OTgyM3dMRURDY0hnTTJka0RiSG81VGlZZHlROWJqZWZ0bHhH?=
 =?utf-8?B?Z0psNjRFT2tpaG5keEhMTCt0SFYyaDVtbW0zUTYyOWljakdQWEpGc25ZbVZO?=
 =?utf-8?B?MjZoT2FhQ2huSWdSUU5qVUlORkxwYmtpTEhML0FkRC9nMzgrbXlxZExWOWti?=
 =?utf-8?B?SW1OSHQ4UEtiVEZhcnlMd29heHJxdXBrcFY2RG1TVzZ0SXNlSlg4TmVlQkhi?=
 =?utf-8?B?ZmZpRDcxNDhpWUVnRFNBd3RwYzVIcFhhdU9BZEFnQ0dCR0tvc2R5M3BWeGxl?=
 =?utf-8?B?aklsYzAxb3NJVHh0QXM1YmdnTEVsTHZsT3RjdU54SCtLcjdTRG55Z0NGNHNh?=
 =?utf-8?B?QzNuQnNFcmhmSlVRSzQwSXVVNWRQS2RpSU9NM29iUjlRSUtNczNUQko5U0lF?=
 =?utf-8?B?ZVUzbndCMHpCNG0wbzZFUjVMQTlmVEc4UWpabzRIUXA1K2dqRXRUUWdJMllT?=
 =?utf-8?B?WFowRDdscHFzVjFqdnY5R1pHeEpWa2RBSWNxenB3SWpiZmtaUVc2T1Ewa2dR?=
 =?utf-8?B?R3hYVUZPVEZ4U210OFNLVHBkNkpIK1J1Y0VpTEMxem5XcFZ4N2R3a0lMRS9V?=
 =?utf-8?B?bU92R2J1S2c5d3dYaGJER1B0R1lGZ3JDbjlGM1BBQStraDB4ek84MjdIcVln?=
 =?utf-8?B?QmUrenJJMDhNMnh5TWE2Z0ZkMmE5QkxVeVlGY2NJY3FzUWY2aWJ2dUZOeVM2?=
 =?utf-8?B?SG1sYVdGc1lKeCtxMXZ4am0wdEhpS2U3Qmw3OWJmYnpQd3ZZUlVkN01HeGc1?=
 =?utf-8?B?VDZaQTMxSXRWQmJHRlJnQnJ0Rjd3MXB3bzVPeVREUDJSWmhmeGRaOXhlb3Nj?=
 =?utf-8?B?TFVaTDMzdVVna2xERDhOUzJKQm9RMTY0cGpJODQ1cGZ6S0hYU21uWTRhREwz?=
 =?utf-8?B?SXZ1TkpTWFNnVzhHRUpGbFhVT3ZaVjhOY0F0SG52dzZmOFZ3b3d1R1JoM21w?=
 =?utf-8?B?TTZnTUQ3ZGg4N3hWYnhXZXFNWFpFWFNmYjhYbTUxbDBKNnk3a1hpem1QKy9u?=
 =?utf-8?B?anhNN1U1a0l1TnhaZTA4SytuQTlXM2ZZeUNRbDFUdGMxamRrY2JINjhjWTBJ?=
 =?utf-8?B?UEpLY1ZNb0ZZYWlYQXNzclRDUEc4NzYxSHhLZ0JNYk5QWmQ5RlVtbnBKTkFB?=
 =?utf-8?B?T1JHRzUzSzFFU3NIMjRxcXJoSU5jdmNSeGFyTE5PclBuRG10VEtXTmFwTU1U?=
 =?utf-8?B?UEJaajh0b2FUMURXbEJiS0kwMmlQRTNQVWlyQ1RpUXVLUVRpNlZ0ZUluSnZ6?=
 =?utf-8?B?eUJoNXFGZEh5ci9vc1I4OHNKSUhSRmYvZ2V5OVNrWUhnakVRZFVGWDF1dmQw?=
 =?utf-8?B?N2k4T2lRMVN3SGpzVHVJei8yQXoweHI2Tk9IaFBBPT0=?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR83MB0205.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3033d8-2fec-463f-135d-08d8b96b796e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 15:37:32.0482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tATAv1wJp0pfda8w3jVFsNr+ILu9ULYhZEaATWxHqdqaROLiq4vaMBpyKJ1OOXIhJOzmWditiTu+wNhonA7O2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR8303MB0094
X-Groupsio-MsgNum: 146829
Content-Language: en-US
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ewr0Igp0Pe3eqOF+OJhd"

--=-ewr0Igp0Pe3eqOF+OJhd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-15 at 09:47 -0500, Paul Gortmaker wrote:
> [Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8] =
On 15/01/2021 (Fri 09:57) Luca Boccassi wrote:
>=20
> > On Fri, 2021-01-15 at 08:37 +0000, Richard Purdie wrote:
> > > On Fri, 2021-01-15 at 00:26 -0500, Paul Gortmaker wrote:
> > > > Recent systemd started using ascii args to "hidepid=3D" mount optio=
ns
> > > > for proc fs - unconditionally -- even though kernels older than v5.=
8
> > > > emit an error message on each attempt:
> > > >=20
> > > > root@qemux86-64:~# cat /proc/version
> > > > Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc version =
10.2.0 (GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
> > > > root@qemux86-64:~# dmesg|grep proc:
> > > > [   29.487995] proc: Bad value for 'hidepid'
> > > > [   43.170571] proc: Bad value for 'hidepid'
> > > > [   44.175615] proc: Bad value for 'hidepid'
> > > > [   46.213300] proc: Bad value for 'hidepid'
> > > > root@qemux86-64:~#
> >=20
> > Wouldn't it be better to patch the kernel to downgrade that message to
> > debug level?
>=20
> The problem is that the breakage is forced upon older kernels, so you'd
> have to effectively mainline that kind of "fix" to v5.12 (where there is
> no problem) and then you could in theory request it for v5.4 linux-stable
> according to "stable rules".

The patch could be downstream for older kernels, just like this one is.
With the difference that it would be temporary.

> Besides, if something with root/mount priv. is consistently trying to
> drive a square peg into a round hole - by trying to mount something and
> failing -- it should be something that a sysadmin would want to
> investigate.  Which is precisely why I am here now.  I think burying it
> at debug level is counterproductive to that.

Well the real issue is that there's no way to get a clean "we don't
support this option" out of certain kernel APIs, so one has to guess
and see what happens. Sometimes it's even worse, and flags like
NOSYMFOLLOW get silently ignored if they are not supported, which is
not great for security-related settings...

Anyway, these warnings only appear if ProtectProc and/or ProcSubset are
set to something other than the default value. Why not simply add a
top-level drop-in in /etc that forces them to be disabled in all
services if you have an older kernel? Something like this:

/etc/systemd/system/service.d/10-override-protect-proc.conf
[Service]
ProtectProc=3Ddefault
ProcSubset=3Dall

And then you can drop it when you upgrade your kernel. Isn't this a
better option than taking on permanent technical debt?

> > > > +The systemd maintainer has dismissed this as something people shou=
ld
> > > > +simply ignore[1] and has no interest in trying to avoid it by
> > > > +proactively checking the kernel version, so people can safely assu=
me
> > > > +that they will never see this version check commit upstream.
> > > > +
> > > > +However, as can be seen above, telling people to just ignore it is=
 not
> > > > +an option, as we'll end up answering the same question and dealing=
 with
> > > > +the same bug over and over again.
> > > > +
> > > > +The commit that triggers this is systemd v247-rc1~378^2~3 -- so an=
y
> > > > +systemd 247 and above plus kernel v5.7 or older will need this.
> > > > +
> > > > +[1] https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fgithub.com%2Fsystemd%2Fsystemd%2Fissues%2F16896&amp;data=3D04%7C01%7C=
Luca.Boccassi%40microsoft.com%7Ce972c325854743b67f0b08d8b9647bf1%7C72f988bf=
86f141af91ab2d7cd011db47%7C1%7C0%7C637463188548752517%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3Dr%2FCh5m3ZLautkN1PLg99HqGdfl4VXqiNjJUsJhDPmCI%3D&amp;reserved=
=3D0
> > > > +
> > > > +Upstream-Status: Actively hostile
> > >=20
> > > The status needs to be
> > >=20
> > > Upstream-Status: Denied [Actively hostile=20
> > > https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2Fsystemd%2Fsystemd%2Fissues%2F16896&amp;data=3D04%7C01%7CLuca.Bo=
ccassi%40microsoft.com%7Ce972c325854743b67f0b08d8b9647bf1%7C72f988bf86f141a=
f91ab2d7cd011db47%7C1%7C0%7C637463188548752517%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dr%2FCh5m3ZLautkN1PLg99HqGdfl4VXqiNjJUsJhDPmCI%3D&amp;reserved=3D0]
> > >=20
> > > (so our tools have an idea of what status patches are in)
> >=20
> > Paul, please, let's avoid loaded language - Denied is fine by itself
> > and conveys what it needs to. I understand it can be frustrating when
> > upstream maintainers do not agree with user assessments, but the linked
> > discussion was polite and professional and there's no need to call it
> > "hostile".
>=20
> Normally I'd agree with you, but it isn't just this one thread/instance,
> but instead *years* of continued "my way or the highway" behaviour
> demonstrated by systemd on various lists like LKML, for all to see.  In
> any case, in the interest of not breaking existing tooling, and getting
> the fix to our users, I am fine with it being changed to simply be:
>=20
> Upstream-Status: Denied [https://nam06.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fgithub.com%2Fsystemd%2Fsystemd%2Fissues%2F16896&amp;dat=
a=3D04%7C01%7CLuca.Boccassi%40microsoft.com%7Ce972c325854743b67f0b08d8b9647=
bf1%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637463188548752517%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;sdata=3Dr%2FCh5m3ZLautkN1PLg99HqGdfl4VXqiNjJUsJhDPmCI%3=
D&amp;reserved=3D0]

That's not entirely accurate, but let's leave it at that.

--=20
Kind regards,
Luca Boccassi

--=-ewr0Igp0Pe3eqOF+OJhd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmABtroACgkQSylmgFB4
UWKTAQf/RJOciJQGYvoHMGI6+xI8kHfcrULOLqTuotMqSxlfxuFDwARZ8mj3xGde
Aeh0HUcGPsDZ9gBZLKoqdGDvK0Sj8BllguWako6Kf7gkoYf3Dds8Bt49qWmFbyIQ
ltoYHL/KX86TY1/ua1s/d9a0QohOtjf4Ya7qnErI6M3nxc3qNAXe3h8nJ28NMn7s
hDMt6ZajPSDh+wqD4EurwgPUW4iEbYaFxSsgQoFo1+Z3g4tmik546APQbAPgvTc3
beuAEf0f6WDMVIepfMxhAbHPB6LgluhHvLsC/ZuoNcm+06XxlKaOGwiQR9vJhro7
GrORLv1dy6/Gexb+Q/S0c+a3AjnuUw==
=s8aD
-----END PGP SIGNATURE-----

--=-ewr0Igp0Pe3eqOF+OJhd--

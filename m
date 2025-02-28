Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9F9C282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 05:43:16 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.84])
 by mx.groups.io with SMTP id smtpd.web10.9607.1740721387894468323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 21:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=QbXs4Yvl;
 spf=pass (domain: navimatix.de, ip: 52.101.67.84, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkwe1CkLmcbNjgurXhBCKfWkW7LtebXsxP4v0VY7Q1LOW8u1ik4LgOUHT92aMwIHXlvTcNzBHJ7g83kt05tEZ1HBoVE4dARAXpp5IKymDOs58IlmR6HjCV78o48Y3NX0eIMS68/U6zYayzsOaT3dg93ZOf8BdInIFyFVBzDmLi5KgEdalvrHN/HQ/3AYzD1MXcuGvDNXTWBg4bzBxI7noWfsyPpZVKkZBE2WL/I7Wx2OLS9sARfIrU5GLhMJBXiBEkhGxYX/KsTYUAYd754U4D8hnRkEnLN3W4paTIPFciMsJoVjf5+bsjN6+HCM07pvWZTL9RyJbJo46fHfAPXqqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGeDjQHeFqCYq77gaHEyARbNSCw9A4u+7l9HsCS/xAI=;
 b=pVPcUcFUs7QOAOffIaHt4He46AFg4CLMXwu3AOPGkU1dc0B4X/ch4sTRErr7DXCn0AIqJgWYiFiHZiXUW7aF9yQVUz6pQIEIvKK8OdiJdYzzKH8afdmVQ66OzjLXnZS1BggHi2vibIvnD+A6k08JTT66UdRpHhhiSIyw0ksDu5LBGk+AxgY9WZ8u0898fwhFEzV6c8ZdGnhtrMZlajTIv5tYhU++vnKyRT/GSn26Hvw58adgBkXud2cnvMS1pt6e6wGv8Hv/49ZHkBaJPqQw3MEma737Z7PvzFGQZtAZoaUdo9o5e+ouwZo0vkVQd6oIurmvq7K94BzaTI+EeOxVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGeDjQHeFqCYq77gaHEyARbNSCw9A4u+7l9HsCS/xAI=;
 b=QbXs4YvlZNS2HM+ZUVM1YqUNlv7XliVmjPfKCGX/A9CqQrgvHbe6Am8CjJ7Y+Q4NiLrY8OvlV/5F4lFh+X7OQ0RL+BMeT5LtU4HPsA1ytk+6XR9E2zCE9ZAYIeve3bx0d6VDtUOy4Wo6jkVVY1HcSOv+bA1fpujJnWwYPdK5maY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by VI0PR01MB10656.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:210::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 05:43:02 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%7]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 05:43:02 +0000
Date: Fri, 28 Feb 2025 06:42:58 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Changqing Li <changqing.li@windriver.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig
 only if distro-feature set"
Message-ID: <vzy63llcnvkkp3tdkfj3eowkphcww7bi6ha4jfljw7pfskezw7@r27s535jwhl7>
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
 <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
 <sozxs6figgef2mhn3bkcr2z7vy3u3idrrq4gkgzmxbibiiih4t@aoqiqffittgi>
 <d20d233c-08c0-490b-927a-fbfc6d4d2383@windriver.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d20d233c-08c0-490b-927a-fbfc6d4d2383@windriver.com>
X-ClientProxiedBy: BE1P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::12) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|VI0PR01MB10656:EE_
X-MS-Office365-Filtering-Correlation-Id: 68fa54c1-0fd1-4df9-a1a3-08dd57bac318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Kh54n35xuUk5RDOz2A++Z2XC+1Ximhz8Mc6FACfOqDPKhQltp+zC40gRWyTM?=
 =?us-ascii?Q?LjS5QrFqrrPotS2P++oNpcem88o9NjykiygEl3KgH46YYMHyPP0PwAlNaG3z?=
 =?us-ascii?Q?kojafIDV/bqG3KB/8b8gfGuNi8vRqVr0STRyYNfGV9tu1b0fmuG5oVqRGtzC?=
 =?us-ascii?Q?O1awifRmV3QsorDeOk+lwaDDfTPKBHO0JeT+co6LCUwdA3KH5ocymfYX8R/g?=
 =?us-ascii?Q?voN0TuiByKRBQZSik17WjCnk86LY3XEXftKe5M2pfAgoptjpoL1Nr7uQ0Bnf?=
 =?us-ascii?Q?ftIUzVmz3hzid/07th8giH09FU+jkrRttNcMxqhpzuYt5033eQQNsn6y6XO4?=
 =?us-ascii?Q?4aWkXf7nAyY5fMCObQgRSq5gYWJdf9TTqOcE4+N1vYOXWTDELVQr9XBOf0QU?=
 =?us-ascii?Q?tVuoMxARyVXpNyn/SKjvOZdBTwiMPEJKUAk9ir5+mjHdU9Q8TWdlzqQr0r84?=
 =?us-ascii?Q?VhsXw/ZD2sooUwDXbs3mwhJ0mPYXLLGYDOUIYhZVYXNBWMuDf30T+RpAuADM?=
 =?us-ascii?Q?lT+z+J4X0serQvT+MstaVO+VJjDtN4avvMHnA4Qc7ZBtTW3hIj6Wt6AsQedh?=
 =?us-ascii?Q?jNrcFXdd5AqKX7yIzJbSJS3SDBZnIBxpHaSDbmlPftm+aRPs1Q9L4eJUdTTv?=
 =?us-ascii?Q?WtOb455WVBF7DcTx0slBOSov8qBSZcvnsCJWgLWCrlgpdTQHYmWctigLewj1?=
 =?us-ascii?Q?2gcm8yqWn/QsyrvnecvzMioSBAPMrON9oLgxhKm4muTV4CWjOncOrEOVYWT1?=
 =?us-ascii?Q?vV3g4rCLgzc1+6RaK/leTVJu8VaKlo2vj6/BtvTS/lCkej2M/67oUYK9R9uL?=
 =?us-ascii?Q?vthaSIfMYVwqfStSxF82ueAjaPCau1nAWWduetvPggEhMP8LxeAdMVm5tqAM?=
 =?us-ascii?Q?4IAtTsSuUw3AxQtIDn7VNvx1jNW8aO8rrvhjHUGga8DSnBvICiQF103sPv6e?=
 =?us-ascii?Q?0bCtLhXgYfB1QBVTQcO2lF+E9S6OZ+ym4UHMymk20ICbsXEK3AOhgKkSQC/2?=
 =?us-ascii?Q?aTt8QdCXMDqPnB2o0z8i+mPj7mRnCTG7OthLs2+i8i2Z+Btr9CGRW22/0DLQ?=
 =?us-ascii?Q?VoITlWnPlQKgPYTNoElLsIjZGkEpqRpdurhYE/Cix0CSat3LoCFpJpQLbxrl?=
 =?us-ascii?Q?ZdyT7tNK9p55DDuygsOM4Yt81aj9317sZCKejh6J1u0YofBkb0u4qIjK3N+6?=
 =?us-ascii?Q?qc+B3ooH1K+CMH6yrgRKp4aw7hEKFOKHITeZOsCaONgNDKwFEJTYx9oy7TNr?=
 =?us-ascii?Q?eXi0S+4ThTNJU7nqODyc7/XNOTi0cLg7aTAr9JUAXxtIYGnZ+HsbcZO23kZm?=
 =?us-ascii?Q?sxUTR/c0//5e+0HiZqeJ0WZ4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AwyoloOZ1nCf8W7FAU1COyFuZKxa1EGiR2SOE0y4hqB5z34PAO/8tgXWm85I?=
 =?us-ascii?Q?zuIB3RL9Hdp75NRNBjAUkSk0qcPO7QtVzatPAEhMwr6bPhq/oDCrU5SOqJHJ?=
 =?us-ascii?Q?UTyll7eoQ8tavhivDKNLYM8tl+8aTklolVPSeQpqYUJaGuVqOc8Dih0ZPwlK?=
 =?us-ascii?Q?cWFrhkjXQ7X5Env8s6HGH/4MfKe2nlZz1YaENwPXpYtYVDWNn/YDba51a76k?=
 =?us-ascii?Q?W6+gyieR5fUKCuDpGX1fD6unyhjMt8L2A3+r1+gtQgvpuPlG4OoXtUUZUoWJ?=
 =?us-ascii?Q?/rEOVZ0O9771EkMyWxeibKJyJnX5eew5M0YNG5wiuU2vBKz9Fylr2jG7/arb?=
 =?us-ascii?Q?8cgztXa70fKUVh+0aDB6E+8lCSk3Li2p8mFD6BlT/kjrVHnIwWWbQKJtNwNF?=
 =?us-ascii?Q?9mbNxC9cBbEJDBO7eCSllR4CeffQSy0bR8hkSc7VYTvjwEl1RLBtEmwXBdFb?=
 =?us-ascii?Q?udgBGZsWsV8VfpV3sTpYaKbWs8w6gvFqOLOHMB6Y4WXkV5n38NVb9fHt+X4E?=
 =?us-ascii?Q?wM1+aleBSi81dmMWT4W1loqZqyB9XnSp+TnM1dvEjPgt+5EYtyP+OFxrxQXY?=
 =?us-ascii?Q?vume/cw5YV5W6YiJNzbHM3IQZXhrw/9LQbW0T7CuM0Uw+9EnIR0HO/27LyZw?=
 =?us-ascii?Q?ZgqQ25G8XLgd2fipGDv3ggg6rfz0LgZ51DcQeihBI6R9BUddvnADIja3KlkS?=
 =?us-ascii?Q?jwk3oHZxzLI5cFm+KhxsdxFJZaico+TIADd6s202kjcR6aqFpJ4xbTDkgfZO?=
 =?us-ascii?Q?eX+MYNwJjNcyVgrH69oegfM79NH4eI2Vsc2ZPe19YmupBavJFljhGCFF91ac?=
 =?us-ascii?Q?D9N7gSimWFzt00NFUz1pBiLcsCKaWQ9rCPUOrbVCsFT9pklyQ6zfnMclNzyF?=
 =?us-ascii?Q?v67g6EtZ9lmL4WSMGiVZNTmLcd7AnTLXWuyjegmyxv0XPh6y0pg+zcD3naKo?=
 =?us-ascii?Q?8gcYZlZCkeHzfIYVJm2qcSCtjHySqeU8ohBAhyPXgcWrz5qG6ZaYPwWdM7cG?=
 =?us-ascii?Q?YVN1gNA3wqPbPtldFVIXg1UU+SNWhDaJY9BrpNt27HnqHL4fL1g6uVwBKM03?=
 =?us-ascii?Q?H1KYx7+cXyWxsMGt0YGORybcyhmlbBFXcZeTggaK2SgUqAPRJPNJ7P5gpkbR?=
 =?us-ascii?Q?o1Fob0o2A0ayrI7sBz1r1/iKBQGhfUMhTe8gEaDlMx8u6pBLR2ZJKrjawda+?=
 =?us-ascii?Q?wS65+x8bm+dyDglHMkpFUitTRJN1cHizjlIvZAssGgBBPWLsMy36EfyFxAcz?=
 =?us-ascii?Q?Jo697jOh64PHB9XvVJXox5l6fmNClSxI44fyajvRZMAjHIT4N81LkY1w83is?=
 =?us-ascii?Q?1Njp0cdeC5NJdGNUlqgbRnBnPEVAqVzY3sU/MN+JYAaphT7QkPGLfUsWgx7e?=
 =?us-ascii?Q?ktCib3dNUxdp+0ZnptObihKsk0hFa74gH24R/1sBgdwAy26v1LLZOWc1e0tZ?=
 =?us-ascii?Q?W3w3p1D4gi606r6aO7TkEMJh04G3D1stDdoMcRjrCXE7WmHKwRcKSY22SLHu?=
 =?us-ascii?Q?7svoYVFRwFH9TfZ6YTOGu2YuvjDg4S8iiIb5XIarS29oTuPMgw9nbHVs1Liz?=
 =?us-ascii?Q?E64UtTJ7tFqMqrJ+9YdTCGAoH95lOIJGlr1jf3SJmJr/4k2A5Y++5z+46uNE?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fa54c1-0fd1-4df9-a1a3-08dd57bac318
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 05:43:02.3621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qx/nEnWWQPBdxSPkqRYJRW66RYj6BDD1xztG+Ymays5smLOohZpkBVh7Muur/8ZCGRBfdikzqArq4Ulc3E60sMzdFcoJz4dp9cg+dM61Ar8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR01MB10656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 05:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212049

Changqing Li schrieb am Fr 28. Feb, 10:56 (+0800):
> On 2/28/25 06:32, J=F6rg Sommer wrote:
> > ```
> > root@qemux86-64:~# python3 -c 'from ctypes.util import find_library; pr=
int(find_library("m"))'
> > libm.so.6
> > root@qemux86-64:~# python3 -c 'from ctypes.util import find_library; pr=
int(find_library("gtk-3"))'
> > libgtk-3.so.0
> >=20
> > root@qemux86-64:~# ldconfig --version
> > ldconfig (GNU libc) 2.41
> > Copyright (C) 2024 Free Software Foundation, Inc.
> > This is free software; see the source for copying conditions.  There is=
 NO
> > warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE.
> > Written by Andreas Jaeger.
> > ```
> >=20
> > Here are my settings from local.conf:
> >=20
> > ```
> > EXTRA_IMAGE_FEATURES +=3D "\
> >      allow-empty-password allow-root-login empty-root-password \
> >      ssh-server-openssh tools-debug \
> > "
> >=20
> > INIT_MANAGER =3D "systemd"
> > DISTRO_FEATURES:append =3D " usrmerge"
> > IMAGE_INSTALL:append =3D " conserver-ptest"
> > PACKAGECONFIG:append:pn-systemd =3D " coredump"
> >=20
> > IMAGE_INSTALL:append =3D " python3-ctypes gtk+3"
> >=20
> > MACHINE ??=3D "qemux86-64"
> > DISTRO ??=3D "poky"
> > ```
> >=20
> > I have used poky with 40b5f61a8f and the revert and meta-openembedded w=
ith
> > 0b83551ff2.
>=20
> This works because poky have ldconfig in DISTRO_FEATURES by default,
> https://git.yoctoproject.org/poky/tree/meta/conf/bitbake.conf#n933
>=20
> if remove ldconfig from DISTRO_FEATURES in local.conf, it will not work.

But you can't remove ldconfig if you need it. Why do you remove it?

If you want the ldconfig feature of python3-ctype, you have to enable
ldconfig. Or at least install the package.

Or should we downgrade the dependency to a recommendation?

> ctypes.util.find_library need ldconfig or ld or gcc to work. No matter wh=
at
> the DISTRO_FEATURES is, we should make a package at least work once it is
> installed.

In our image python3-ctype works without ldconfig.

> > Quotinghttps://docs.yoctoproject.org/ref-manual/features.html:
> >=20
> > | ldconfig: Include support for ldconfig and ld.so.conf on the target.
> >=20
> >=20
> > @Mathieu: I think you should revert the commit 0df1318e5c, because it p=
ulls
> > in ldconfig even it is unselected in DISTRO_FEATURES. It leaves no way =
to
> > build without ldconfig (what was the intend of my commit).
>=20
> when ldconfig is disabled in DISTRO_FEATURES, if we don't want ldconfig b=
e
> pulled in, how about just not install the package that depend on ldconfig=
,
> eg: python3-ctypes.

In our case python3-ctypes is a dependency of django.

> if revert my commit, and ldconfig is disabled in DISTRO_FEATURES, and
> python3-ctype is installed, ctypes.util.find_library will not work.

But then you need ldconfig. Either install it with IMAGE_INSTALL or include
it in DISTRO_FEATURES. I see this the same way like other DISTRO_FEATURES
for example pam: if you want to use pam with e.g. systemd you have to
include it in DISTRO_FEATURES.


Regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEA8C282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 10:35:48 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.98])
 by mx.groups.io with SMTP id smtpd.web11.12797.1740738938926927745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 02:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=VbSOl2Ua;
 spf=pass (domain: navimatix.de, ip: 52.101.65.98, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FK+a5BAlQWrsnKx5GDnMtP+Aa5w/vzkcR4VoX/B327Tk7VakJ7xT9fW/Zv/crVdGtr6tDlhISa7S3UTDxQogJ3d8+eOdywjyIa3JZYysb54ikgvrmFnc1GJraSU4NombR85o8rXXu9sy/E1PSp92x9gqBBnNdOsZEJHnnRm9C/RIwevxgwRWHHg1UlwP1n3kz93tF0S8PJsrjvB88g/H50+FX3I7PmbP+q005e2pF4IE5K0Eo82ISyatw+sXdY5+BL4/MaUqzLvxynDqjoAy6/Un1C+kN34ckWOoeGZiNTe49mi98FdAhmKFkUJfUOzADlPEWzXv0/o2voJF0lyx0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pghsxctoAInEBBF6ZRlLw2V2OUT8eJ9aAwAs0X4oMyo=;
 b=eKg7oc+/1Wz6Lc9De2zDILTDT8XItkr82iRF0RnIwQQOngkwIfSbFwdZb/AUqz7nwGy/ZhLJjT8juwCIVJ64fxsgqgQcmtKfhwga7YH4tH1XANiJhtyosXiRYXiY9f2FibSSghivK4D+fSr0kpEmiekn5htf1icpUHNek1jZXs4MumN7b6Hi9Pe84qOKRoseOCLYNN1deF/eWl+k7WwjRVr6tPsBCQt8lYbM8LH5or5nhCCK68cMMnn+C2qF7nkA1dB+kUYaXnNFwd+7TzEcqdQHmN1NvJ1R7h1z+Hl6B7wnWRapfTPMQ4tZhd5LpHgUTRFldxLLFordwy2KqO0e3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pghsxctoAInEBBF6ZRlLw2V2OUT8eJ9aAwAs0X4oMyo=;
 b=VbSOl2UaLu2X59PetA4ZdHfq6eJMfe9JZKeOXTQ4LL/ZXwT5KRWaqq3REn9FEGw1rm0WtFFrcriSV4aBlz+SPwChfZ534nUPdL4ItEixXcHa0vbgGDCDPVoK4WCSwpLKQzEwHoQcKFjJ7mH62BuHbzh8hgEBPQZ0+ylRKS+4wOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB8355.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:426::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 10:35:33 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%7]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 10:35:33 +0000
Date: Fri, 28 Feb 2025 11:35:31 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Changqing Li <changqing.li@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig
 only if distro-feature set"
Message-ID: <m4tm2mjs6iachotge62hejkid5f3s3lrent32i4gwhruzpahqr@42nnjjo6ag2k>
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
 <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
 <sozxs6figgef2mhn3bkcr2z7vy3u3idrrq4gkgzmxbibiiih4t@aoqiqffittgi>
 <d20d233c-08c0-490b-927a-fbfc6d4d2383@windriver.com>
 <vzy63llcnvkkp3tdkfj3eowkphcww7bi6ha4jfljw7pfskezw7@r27s535jwhl7>
 <48f11c6288db844ec985daf20f34e92974519e82.camel@linuxfoundation.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <48f11c6288db844ec985daf20f34e92974519e82.camel@linuxfoundation.org>
X-ClientProxiedBy: BE1P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::6) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: a7653ab6-d3bb-44a1-33d9-08dd57e3a168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q//R6cA9pwCUOsZc63q6jeX9fcVOUQgiiLzsNuW/ysKYyXEoeHlsDYiUaIPU?=
 =?us-ascii?Q?KIOxbZYC9JdkimEeBCOAwcidtj/aU0sYcyUkxhdkOZGcTTNYpEnUZ2AEdVrR?=
 =?us-ascii?Q?GVAbVSKO5n/uUei7qr+FAkvraHmB4CitsCVQ1BXOJ5eyD0qcvL5ApSOkws3H?=
 =?us-ascii?Q?/eAKoaTELRMGLKp5jphlZY2mfBTKGWpQe0tk3xxTgjcAuEjcM/xAqsGLVur9?=
 =?us-ascii?Q?iKEiTd5L0nzuh2MZ+4zSNmdbrlleCa8raBWP/4eFTKH3OxX2hMesoA65JX81?=
 =?us-ascii?Q?/O/kndlHGw/uaCdfmmLG2lutiq+9eEMQqZUeaP/Yrono6/Jp21KW89CFIul2?=
 =?us-ascii?Q?7ntggyXd4nRWNbts6mYriqwlRKuR5OSfhCYozc34/h0ls0hqeanW8XlIpGGi?=
 =?us-ascii?Q?7awUn4inePuz5gS4aEB5Mbz+BQwxAw7rCAi44sZsfUUJwEMMMdni0H0yLvwP?=
 =?us-ascii?Q?ttMJUIEV9+NSoKk/M+VEwOTmgLfxMEPTWxAjanPkBuAcRPAHNNRnF3SVbY+W?=
 =?us-ascii?Q?WYf3wszh/W95sPgbNwiy+Frmx9kQpYCbTsGQYDBrTcN9yH1Y2d2wJbGvYIIt?=
 =?us-ascii?Q?nU66xTfOK6TQbCbqX9jj/NJ1RE8nriclqTDiEXQ2WcMEOcrjk7froae3YTQV?=
 =?us-ascii?Q?J0LxQ0e4H3DGLRFoPa3ngckKHHVryzQOcJmMZBlsGUDZStgSsNBQVIzzetE9?=
 =?us-ascii?Q?QxTlqAuyYTYprcxhb5t/DhEngqtL6GwaYz3m7qekXQs5rxTE1gxffXHb8EUF?=
 =?us-ascii?Q?snujL7kgwtXnYp1G0wHq5iZ9gGbGBup/6ybVAK9jn1TwMgLJ/cnaV0gwvKxz?=
 =?us-ascii?Q?FVpUOSz/F6rQ6PObUr357dGbFmQCGdUN8BFLzgcbdnwl6vzR3iYlmkj5Dlr7?=
 =?us-ascii?Q?DRBmdX/IqpFbGfVSLR+2AIW4hjiTecGgWRbRByE1Q62KolgPC0gP22Difa7q?=
 =?us-ascii?Q?0KEDtSxLpv7PYG1QHQ9woMKTD4OO+YecvMcLPbdL6AY6QFvcDLzzlkY09CK3?=
 =?us-ascii?Q?qEQvYwuRa6Vsh1SnSwCh5eelsO6ziYyW0CibTf0bC9fp1GcMfRVdtAXi38sK?=
 =?us-ascii?Q?WAEtcQb8Z4Pk431ecCsNVQ2zlTpfrVaIwf1FDMcR3xnB/R95MGS10qIrBP2O?=
 =?us-ascii?Q?wRWeTjCJgqxCllfMtYUo7bojeDyTjCb1XDZ/wKKeGqcDfMJ7jKTKETaZN7zY?=
 =?us-ascii?Q?gc41y0/CuS7FUxScVm69V9seASu37Lt/bokoaHun0d6DgIreCBrSl4UkezkE?=
 =?us-ascii?Q?KzT362jCDXa1T8vgT4T3y3dGx/6qjLemjRV4oZKAVU9KXagWYGm0h7YV0isX?=
 =?us-ascii?Q?eLgSMXsCd/mqqKDG7LShNKzz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9J0l2bMRyGPjvyj0DjZxVzxrB7aDLfSJLpMCmz5CaVSzeBQBKz07uieuIKGA?=
 =?us-ascii?Q?BOGwOya+V/VhqVRgAZUtb/nykpe7Nd9KF8UIHiMV+Gp2uSYD6H8yUy5mfJgq?=
 =?us-ascii?Q?fd1XBD0ais6I6HUdlOMLaaHpKa5R6/5Af/LuUVScLm/ZmkydXwegccn6gh32?=
 =?us-ascii?Q?MSTUT4p11NPbk62fYiyoSNmn2tm762e758MljtdRHkTbA0W1mfKKP4CWDzkR?=
 =?us-ascii?Q?YObX+ismaZeY2Ceo174nF4TcDpYJkdj+G9q5XGjcsjD/8bYgvEmULeQgfcUk?=
 =?us-ascii?Q?CYA/d/g70+ybs1YIP8U/oeGhXrmKpJ7+9nnpOXUySsQ5lG7YM1d+vQsFOl8l?=
 =?us-ascii?Q?c9zQfoCfSmMlqEu4xlFAfsik5FEh+WpU60IcucmXkxiKSS3JtV0TDLUXyPpH?=
 =?us-ascii?Q?viVOG1iTkt1mvSgKrQQn0uCGvXLgcxN2aGZY4DdohqNIblo1MbvqnKk5nXP8?=
 =?us-ascii?Q?vqq7T6sGchQOvqpALwdoEqXNv7VO2J30ay9hqhVU3J3hYUZ2DTiaNUQYdF6L?=
 =?us-ascii?Q?k/eyzTQg4BglHP7mvhEL0dty5SOgboiMxn8VEnd4rB0PPaNarjbmY10PZz1I?=
 =?us-ascii?Q?VVVg6hq0EZkHWy2DJ0LVwY9fMCnML21dfNckjarTNCM+kWb85Vd7KrCD/zM/?=
 =?us-ascii?Q?+3E7I6Up5GqrH1jv3nqk+iIDEMCvJjlyls3hbpoxTnmi2EsgaqCwI9ecqzYn?=
 =?us-ascii?Q?j6nKOxiIHNHVCbZrBI1eBjxtLmme7btvgA/xpLpp/pD/BIz9yEe6melt4xSu?=
 =?us-ascii?Q?s7r3BrIwFDL9ExqjUuvC2i+5Z5a5qsNgS3oRWM6df+nknhYU+qqSgAkDDOEU?=
 =?us-ascii?Q?wydgGgbaLyXySK2nK8xksQYYBjqfL243LK1YmZwJK0GWg8VmzM7iIZZP/zUV?=
 =?us-ascii?Q?5TQZbo4xYDykqiqtncpRp2g4QOEhKkjrMtCpJ2U0tFL6CXykJRNG5fuTAdg9?=
 =?us-ascii?Q?UAwaR7/HL8zHbA6PuuUWQKbQGsuQ65IyExSImO7TopdV+fPN1MiaCcIddzrC?=
 =?us-ascii?Q?QWIXHQ8MnaT22ufrze0FJNRX3vk26clekupvuq3c7ODF5046qA0BOqGTZesM?=
 =?us-ascii?Q?3r75NF4Og34PfPtc4PTBWbhX3NOf8RmpuWQF8An7nd53fqyUruZ2u2xsbwj2?=
 =?us-ascii?Q?cz/986UWfpLFVdfhOTkQIVrzTFcyfKJmQ6Caz+m4W3WOjATAYsRWHGmQgb1B?=
 =?us-ascii?Q?sDd4Qx+cwlVz9UeKnnIu7ExmzyoWtLkkQTcAXPaeg0f8MrEIhbct45AcDS3N?=
 =?us-ascii?Q?u0dV5RizgxjQ7KHV+51ImG/ZSSwDDf+MXlzBlqNOtI7Lh2gg5OmONO+5RKmH?=
 =?us-ascii?Q?UlAepZmpKKSrjcjo4TOZ9tZdenI1yc/MZGpeOG6/CnO8n8jF+KbVxakBvo36?=
 =?us-ascii?Q?PjKsMY3cPrM1vG14Et8rxcV3DluZH2R+aKhPAzpp8afRJAy6we/7bvK2i4KE?=
 =?us-ascii?Q?dTDj2LlnzFDkYsXVS+tPh2fNY10qTLVh4jFXYiKXmzu7N0KxZzMVvc/VDu4d?=
 =?us-ascii?Q?5FDVa6OOSNgjXA2BYz+NbDCmqt3f+KlYsEmZUaYX5CL7Mx3N9TVHBMKONhu1?=
 =?us-ascii?Q?VvWnR3+eExywE9e2A52FCdFZvfXh8INSQHMLvaRswp1zpsGHvyBd/AFRDKmj?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a7653ab6-d3bb-44a1-33d9-08dd57e3a168
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 10:35:33.5717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yZzcdZMRyERqzCBn5WamwtcmnvOc5RM05PRCoz07HgotRsFF6nDWjH+KLaMyXtIq+lbzG3Js/bNnMMmHgSbGrZP4mM0Xh3fxff0baaiNrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8355
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 10:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212056

Richard Purdie schrieb am Fr 28. Feb, 10:20 (+0000):
> On Fri, 2025-02-28 at 06:42 +0100, J=F6rg Sommer wrote:
> > Changqing Li schrieb am Fr 28. Feb, 10:56 (+0800):
> >=20
> > But you can't remove ldconfig if you need it. Why do you remove it?
> >=20
> > If you want the ldconfig feature of python3-ctype, you have to enable
> > ldconfig. Or at least install the package.
> >=20
> > Or should we downgrade the dependency to a recommendation?
> >=20
> > > ctypes.util.find_library need ldconfig or ld or gcc to work. No matte=
r what
> > > the DISTRO_FEATURES is, we should make a package at least work once i=
t is
> > > installed.
> >=20
> > In our image python3-ctype works without ldconfig.
> >=20
> > > > Quotinghttps://docs.yoctoproject.org/ref-manual/features.html:
> > > >=20
> > > > > ldconfig: Include support for ldconfig and ld.so.conf on the targ=
et.
> > > >=20
> > > >=20
> > > > @Mathieu: I think you should revert the commit 0df1318e5c, because =
it pulls
> > > > in ldconfig even it is unselected in DISTRO_FEATURES. It leaves no =
way to
> > > > build without ldconfig (what was the intend of my commit).
> > >=20
> > > when ldconfig is disabled in DISTRO_FEATURES, if we don't want ldconf=
ig be
> > > pulled in, how about just not install the package that depend on ldco=
nfig,
> > > eg: python3-ctypes.
> >=20
> > In our case python3-ctypes is a dependency of django.
> >=20
> > > if revert my commit, and ldconfig is disabled in DISTRO_FEATURES, and
> > > python3-ctype is installed, ctypes.util.find_library will not work.
> >=20
> > But then you need ldconfig. Either install it with IMAGE_INSTALL or inc=
lude
> > it in DISTRO_FEATURES. I see this the same way like other DISTRO_FEATUR=
ES
> > for example pam: if you want to use pam with e.g. systemd you have to
> > include it in DISTRO_FEATURES.
>=20
> DISTRO_FEATURES are high level policy controls, not "this should be
> included or excluded" controls. For example "pam" controls whether the
> access control modules are configured/used, not whether libpam is or is
> not included.

But it controls if other packages (e.g. systemd) enable pam support or not.
The same goes with ldconfig: Should ldconfig support in the packages be
enabled (which would pull-in ldconfig as dependency).

> For ldconfig, as I remember, the distro config was about whether to
> include "ldconfig" calls after installing libraries and whether to use th=
e
> ld cache.

If the feature is only about enabling code in the postinst script, than we
should find a better description of the feature

| ldconfig: Include support for ldconfig and ld.so.conf on the target.

https://docs.yoctoproject.org/ref-manual/features.html

> Packages being installed or not is an image level decision, not distro
> level.

Yes, that's also my understanding. But enabling some features (e.g. x11
support) leads to recipes set DEPENDS on libs and this leads to the
installation of some packages. So DISTRO_FEATURES influence indirectly what
gets into the image.

> In this case, perhaps we should drop the RDEPENDS to a RRECOMMENDS?

This would be helpful to remove ldconfig, if django is installed.

But the main question is still open: Why should I want ldconfig and remove
it from DISTRO_FEATURES? What is this use case?


Regards J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7D7C197BF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 22:32:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.99])
 by mx.groups.io with SMTP id smtpd.web11.2885.1740695561516935223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 14:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=ZjCL9TQd;
 spf=pass (domain: navimatix.de, ip: 40.107.21.99, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+eHLi7jKzsKwdd6clGIp2gfFkhufjVE+cRGhEYDdWwcX0WZ4dOFVG3GQkiaORY3VQrK58SoZm64HE+ZiXZsXuNo1cbzXNMtPg68h6BvlzsXS2YahXkt/VT09SQnwQSCOdWC2iBA9LSNNuwAvWMjTuR61Ugs/fz6S0vVGt6O2KKCltnYSuqqYjFp9aCV5c77AzeDDSGXXjfUBloq3aq6o8nzcMfKadnXgHliLbEePmQTcwU/sFxwtfGExZWSDZu+HUEiaawPqE3678P+DXayq/s7T4YewE4dmQIC+ow1E8tVDGEnt2AUOrUYzAWNwjZ9QZUf5qx61rsgxAaVVDdsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2Ber14IhSEBkkP3x7pIUj5+0mdCctPyQbm2dLNtqW4=;
 b=knqfAm/rEZzA8/CU79HQCBM2QxMsieiUFHVULqy4J3U6BgGr1lYBQEpQhzM/ZWHOnoSesuJ8lXo4PDz2PX2pr45vkV42x9SfZErQKypOS4/Xcep3O0C9LwdMki8XIQB7zNvPlityBhwFpqDZJFWasrUEbQXmLOTNp8zVTLs3asSpZr93sfAzXg/fuxtTO6m64WnvesqFaK/Z8TV7OUWSUSaXb6LzFbjtX+ww76l8iPeffBjNO+yKKQFXD4IhZ0xHdSiMd5/BByE1QLcq3U0C65Mi534orQ20hoVaMQ16QlaNrEMKaq7iXv08zsh5QI877MLAXgaj207X/2U7hIivXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2Ber14IhSEBkkP3x7pIUj5+0mdCctPyQbm2dLNtqW4=;
 b=ZjCL9TQdIeSzSffEd5laPcLAhvBgCGNuQnLFkSjGLx4CDQIvqGJzxvR9ExtXCnPS2kHhAAXzyuTy8oEH2D5lCnAtJsxWirJ+4JcroVrNgkerBOApMR45ClVGK6iJ3E9Rf6r5bHikvjbn+vEB6F6R7URkB9uDD0y3fkOinB78+ak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AM0PR01MB6417.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:148::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 22:32:37 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%7]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 22:32:35 +0000
Date: Thu, 27 Feb 2025 23:32:32 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Changqing Li <changqing.li@windriver.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig
 only if distro-feature set"
Message-ID: <sozxs6figgef2mhn3bkcr2z7vy3u3idrrq4gkgzmxbibiiih4t@aoqiqffittgi>
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
 <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
X-ClientProxiedBy: BE1P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::15) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AM0PR01MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: f16ccbc9-4e67-48b5-0374-08dd577ea247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VwTPn2BXyZBjqx0W3feIDg0aUYHV1T8O633Foe1WTBkGPOEua7tmnxmi1as2?=
 =?us-ascii?Q?sR16rhk6HIxACA22bf5X7fTwYfkJugvQhz1xtSEessGIfVD/O059NhCq8Pqz?=
 =?us-ascii?Q?05fG2yv7W91x0rzVyvlwzQ489DixgDe0uwMQT7bxMmM03gyDiH/CVQLaHCil?=
 =?us-ascii?Q?lN1egJ00MjmW1rOvsPHl62KtFVv5bdSj6wKUeEst+vV6ATQZUh72vBSnbwLe?=
 =?us-ascii?Q?N0ijXVqqPyx5GrXKUQNN2LGGnOlm0rLD8dnpG4PMJVuLgiya4rdmLe1RcJMQ?=
 =?us-ascii?Q?thXSwdXP+cbUVY+ORgDReiBQ+jMglFW6/8yhQS/N8kZnFSjadXXiILgUcdtP?=
 =?us-ascii?Q?ZZ69mrjnggdfATf0UV4f5GjUwdTcUvOesKtbpJE2cw79dzzFIBGLwcgWcrrA?=
 =?us-ascii?Q?SJMP7XXC3a+V3E2f53KqE3b+dfz0tRiJ8NXFkyzlsvtQwXDxuQITP1XA6aFX?=
 =?us-ascii?Q?SfUNvbNte3KXTMqi1bg8OzQiikWyLQBI1KrqqvovtK7hCgrN36ATUROblpfE?=
 =?us-ascii?Q?ZT+D7wq9+GaphRPFfqfu+2AFV9F8gs/dr69ZpJxToJtGlxcXsNV/43zNrS/O?=
 =?us-ascii?Q?pI2Rz/FTxO2DbPtiAe7fZpr0rntV8ouBB5q6wb5HXFcPgLYNwYpxQdEE/EWo?=
 =?us-ascii?Q?7OB/YUOBJap655DW8SZdl9kUln+ZY2X78olPOYfU6b/vEda2GCcwYCxhrYNQ?=
 =?us-ascii?Q?AEbZ73Gwn++dcho5eZbmS463x7o0lM24rPm7oxtFndb289U+rXFAq92Oi7pc?=
 =?us-ascii?Q?RJmbWxWym1Ae8kWozhpZiC7qO+X6QJ69oS/QLIIEoUe64K3j5McS2/f97bL+?=
 =?us-ascii?Q?jSt2ZVBhrk74mXWXPg24b6/EDQVixSQYeu984xZO5Xe4xBhO+kiLLgxMeceo?=
 =?us-ascii?Q?ie8m4DwBzartb5uqsFdIj9NWuQzjm/KeUURRoDw7zFHmph0hJZ70RZEgk0S2?=
 =?us-ascii?Q?IXERMJWOTU9o+NKOQKpwUbi0uwUuo0DNB4yvN/qmbyo0XBTGtCA26yE87TyZ?=
 =?us-ascii?Q?NpvGJV/vvplaSN6JHR7AtMi+JqGjcXuuMon3Boe7vhupw3DRR7fdx+Lo/q36?=
 =?us-ascii?Q?yf8TaNCMwEBe510SWiBQtyf2AYCLuxJdRbEors/FnBqCg4WQ7vT/F7u/ZgJt?=
 =?us-ascii?Q?57QPLg1AwhRp4kEXxMMGooUZ6DMRjN3MjTC2XaSsnE1ZHVsRP5x5URkzHop/?=
 =?us-ascii?Q?ZI4801OUiokSyQT71d0nbSJ7s9FafqSgk9lavhG3A2mBHIHQ+5zLFAyfEeoa?=
 =?us-ascii?Q?05Sol/zq5Un8Mr9hyts2w23T9BJARWTuV8h5K7MNZPVazn5KWfu/Bwu7wK/r?=
 =?us-ascii?Q?SBay0z+UOsHCJmQibEMfpexadOZChABTbjBOnAzNBgfU3myozJqvwMr3F4sr?=
 =?us-ascii?Q?kBZa7FUKvjwmuduoVu56A2TsS/7D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vqf8nIjJYQ29cVkxNfzyA2I1snyx8ARbb2DEvSIONmZb5kjmsKusM6J34UnG?=
 =?us-ascii?Q?+SSU+OCbfVxIWoRhEgZWNEa0/JuwaA+Ui8+s5Xgaeb4CUAvOWlxtUqQxLvtQ?=
 =?us-ascii?Q?Ctvq1oUeiAHOX9nnXFYPS4BAgbhtYAyCtALpxQXkYh7P86fboVxsX5S6m20W?=
 =?us-ascii?Q?Xx9ajPXdmGwon/fgd3IoJFui82x3KiMHIBhhsJJwJFsDx0X51bVgXmuOupMZ?=
 =?us-ascii?Q?YuwMgOxtpsw3ExiOfq/5rLPvGHU+pDy39oqosindIWumTfxo8Rg6fokbWwU0?=
 =?us-ascii?Q?USJaPmzwF8VOIlGOFQnK1LFdqGN3wxyNndHgS81N8IL0URkOF0opmxucpOTV?=
 =?us-ascii?Q?L7gXcw+LOCoPCi6cMLqp1driMTOgUfJunDSNaeu6CpcwRCKEVQA0+84APO5C?=
 =?us-ascii?Q?5hsl0k8fl9JSXaxatrTRN7uqkvcVMZ0+nX4tLmmqq8cDyZns7L6qwkVjf/EL?=
 =?us-ascii?Q?CujDI6qurVluvvMdOIzVL27os+LVyMTGjaN1AwyvTcFo/jfB/IlWNu5044fJ?=
 =?us-ascii?Q?SS23qmXWMLajaExbt8OWfHNrYDjKMyAStlLSwYTfJJJlnHnDtbG1/VB1any5?=
 =?us-ascii?Q?HkmjCKRf3iA95VsNDvSpFol9jcvpnI02TMEzHlcc28+9IJdACDBoDM57XUlr?=
 =?us-ascii?Q?xvXGh/bTG7dmGKJYA0KLm6lRDYSD+Rm4uPP46KemcNfrekfKD104/Fg/8nsj?=
 =?us-ascii?Q?77MDp7mT8rD75W4lZZS8k+OHPdOJ9DlFZCwZr3/RJdFJM9k1Cv7oIZzI0cuR?=
 =?us-ascii?Q?SRyiaet7LHPnJ6aICw1nqnhOo3Qg5AnGwDR0hOz4GRiJWF6I2zfv2DhfOs0L?=
 =?us-ascii?Q?qer17ppGPYEKHd29apNN4b9L8zGscFQfLFTAdUYlY6m/kJkNrJ508p2x2IZt?=
 =?us-ascii?Q?fAop3bv5LACiR9KyaYc3gPNcgxuqsciOjEVl3wKfao1GBriq6yY9nzD+RSL+?=
 =?us-ascii?Q?EtqvHUeqMh4J+jhz/dAixM2zfsXU7zBWD5p/BSjUg/ZPfGpKZMG3tRCF5tOI?=
 =?us-ascii?Q?21ka0E8hMrsPGDUjahfslqodo/BIk0359hYrAiLkYyYYzeeNo1Ky8b6kMT8Y?=
 =?us-ascii?Q?IvKTioxzFmplBIETxg/7Qi+ONApfCIpOmBrlL+8+D+vyLVbWpc6bgZPyavd/?=
 =?us-ascii?Q?hWizmhpSE9iJQM0iVLY6bozVk85dkLhe2IUDIHrGs3T8YWEuEfG7cQpVaeAn?=
 =?us-ascii?Q?WPtpBKMUnDDO8K1WN1UT0l3UBXmRVtwGt1Nyq9ePtKRdizooeGoDoGK4fb4R?=
 =?us-ascii?Q?S+nqX/XEmH/C2V0eKChkgoBXRD/xjGBmLDtX0WMuGQgAZbeP6SUGtEqipD+G?=
 =?us-ascii?Q?j2b1tav3OaPKhc3185HZ+39PIUPBbx2fUBtGwauBQ0pHepX4F1mW05jcSTUq?=
 =?us-ascii?Q?xKdBh2+aBT/S2dMJ/8/pkC8fzJlCcstoBgIjoymr50Y0t2umJju/8BXsOLzb?=
 =?us-ascii?Q?kvSsr2OgE+zBUtYWNJtvbmekbdF/g3HQZo6MSUQs/8bixtW8qhElCZulLhef?=
 =?us-ascii?Q?Dt2CJIM4Zw48x4RCV3HUR0aq3bhgyjqbvaVNl6N5Pjn5ycptf4vpRi//ivKw?=
 =?us-ascii?Q?nc0EUdenW5qYIesVVyee2TUtQGCrquZTiikoxZSLp9onjK02X449bYYWwJLD?=
 =?us-ascii?Q?xA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f16ccbc9-4e67-48b5-0374-08dd577ea247
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 22:32:35.8955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzS3D5wpN+oOuJoKjlzdzlOD0GcfiStWP30a1GINKla5Gw4K3o/qOBFkqvWBhte3RKdcRxNrE9qIW8EzaLPOe2M7DZiwWaFogzm6hRcVE4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB6417
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 22:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212042

Changqing Li schrieb am Di 25. Feb, 10:02 (+0800):
> On 2/25/25 07:36, J=F6rg Sommer wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >=20
> > Changqing Li via lists.openembedded.org schrieb am Do 20. Feb, 11:57 (+=
0800):
> > > The reverted commit causes regression when ldconfig not in
> > > DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
> > > ctypes.util.find_library(name) can find the lib if it is installed,
> > Hello Changqing Li,
> >=20
> > Did I understand correctly that gtk+3 was found before, indent of ldcon=
fig
> > was in der DISTRO_FEATURES? But after the change, if fails.
> >=20
> > Where is libgdk installed? In /usr/lib or somewhere else?
>=20
> Hi,
>=20
> libgtk is under /usr/lib. See:
>=20
> root@qemux86-64:~# ldconfig -p | grep gtk-3
>=20
> libgtk-3.so.0 (libc6,x86-64) =3D> /usr/lib/libgtk-3.so.0
>=20
> root@qemux86-64:~# python3
>=20
> Python 3.13.2 (main, Feb 4 2025, 14:51:09) [GCC 14.2.0] on linux Type
> "help", "copyright", "credits" or "license" for more information.
>=20
> >>> from ctypes.util import find_library
>=20
> >>> find_library('gtk-3')
>=20
> =A0'libgtk-3.so.0'

I have reverted your patch and this works:

```
root@qemux86-64:~# python3 -c 'from ctypes.util import find_library; print(=
find_library("m"))'
libm.so.6
root@qemux86-64:~# python3 -c 'from ctypes.util import find_library; print(=
find_library("gtk-3"))'
libgtk-3.so.0

root@qemux86-64:~# ldconfig --version
ldconfig (GNU libc) 2.41
Copyright (C) 2024 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
Written by Andreas Jaeger.
```

Here are my settings from local.conf:

```
EXTRA_IMAGE_FEATURES +=3D "\
    allow-empty-password allow-root-login empty-root-password \
    ssh-server-openssh tools-debug \
"

INIT_MANAGER =3D "systemd"
DISTRO_FEATURES:append =3D " usrmerge"
IMAGE_INSTALL:append =3D " conserver-ptest"
PACKAGECONFIG:append:pn-systemd =3D " coredump"

IMAGE_INSTALL:append =3D " python3-ctypes gtk+3"

MACHINE ??=3D "qemux86-64"
DISTRO ??=3D "poky"
```

I have used poky with 40b5f61a8f and the revert and meta-openembedded with
0b83551ff2.

> For the case that ldconfig is NOT in DISTRO_FEATURES, gtk+3 can be found.
> After commit "python3-ctypes: depend on ldconfig only if distro-feature s=
et"
> is merged,
>=20
> ldconfig is not installed, so ctypes.util.find_library cannot found gtk+3=
.

You can also install ld or gcc. But if you prefer ldconfig, you should set
this DISTRO_FEATURES. It's like x11 support, if you want it you have to set
the feature.

Quoting https://docs.yoctoproject.org/ref-manual/features.html:

| ldconfig: Include support for ldconfig and ld.so.conf on the target.


@Mathieu: I think you should revert the commit 0df1318e5c, because it pulls
in ldconfig even it is unselected in DISTRO_FEATURES. It leaves no way to
build without ldconfig (what was the intend of my commit).


Kind regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


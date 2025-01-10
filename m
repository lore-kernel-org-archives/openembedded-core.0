Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F151E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:04:09 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.57])
 by mx.groups.io with SMTP id smtpd.web11.17985.1736514247483818941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=js5uDyA+;
 spf=pass (domain: arm.com, ip: 40.107.249.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tfota9mAF3W4Fc+HJnhtvnilLuQGVJnU2ToUMOQpiII5H9WH8kb3dar7GtcAfvx4g+u6iEirplvpmKN6eHtw0iYbiqHw2iifG+rkKNh7O9EwDNcdgzxvsbmz5PMBB3mTmOVBeKJHkzQBj5cT5N1o2TV+tZUjCtFbp0TlDOpireGVo7LwamtVqCGrGL8C4CXkOL7ZMnY8QZCEJZ4dkVJdL/0eaD2fB9GQUOthYj8o1j/70CNyT1TD2cnVIuZ+8BEGOxV9smuKcq73IQNTCVrlAhM04wspNGR7PbdW5Txb80RzfuF/XPD+an73OyDwQ5PQp3Xmh+n6lrDu6h8LqBftcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRSiunVdMvJfBOt6N05m64Dwb6riiAi2h7m0gSjeY0k=;
 b=iYOZfOSdSreuEgJN66QmcpLOpGabLuZ2UuvvirHmVsebRgBhgaNsC0V+7+niebgWXJhy9Mn5HPbmHUI9GVcNdaXXUUQ92A5hKRR1qJyGg/JNpg/dGEmeAbt8sqDESnS0OJDVPZGBKJzccrSge/W7Q/HDMo3NlV2jUaptzTu28aGO2gNwcaNQp6epSUO7U8nnwrXUt4dcztq6fTg+/eo0E9TbcMuq1Ko6FDPKMDSavlAQjvAn/oMKY5upG7Ot7NNcCHk1RqAIeyX/3C0wqzm9X2XtM11ypW83704hnWXBRzsMwEUB+iqhE0E9crO81Uxn/Lx2xLf1fr8xZ5xt0N8HwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRSiunVdMvJfBOt6N05m64Dwb6riiAi2h7m0gSjeY0k=;
 b=js5uDyA+wP6VQacIIEIhMCPXZK9IKx7bgNpR55WZK10/1/vXTKQEHKlF/E2Ze9DPfyu3jPkyJZPrIDNCKxsScziuZt5zuQsfFrb2Yqnc/JWyMJb/nH8H6u6yXdPB2zMCtloU8oryL17N5P9PES1pYSGk2DtzXjx7h/wFv/y0AyQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB10368.eurprd08.prod.outlook.com (2603:10a6:10:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 13:04:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 13:04:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes/qemu: move QEMU_EXTRAOPTIONS for PPC to
 the relevant tunes
Thread-Topic: [OE-core] [PATCH] classes/qemu: move QEMU_EXTRAOPTIONS for PPC
 to the relevant tunes
Thread-Index: AQHbYsH6gpsKpt4C6E2hPO8DFBfmZbMP+q6A
Date: Fri, 10 Jan 2025 13:04:03 +0000
Message-ID: <90081D6A-E059-46A1-AAB5-B0DAD81A8247@arm.com>
References: <20250109181145.2057509-1-ross.burton@arm.com>
In-Reply-To: <20250109181145.2057509-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|DU0PR08MB10368:EE_
x-ms-office365-filtering-correlation-id: df834061-d6b8-4dcb-1191-08dd31774254
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?kKO1qaHXk0H2CeOpvMvdmZidEW/52va61TDpu5oTJ5QoDRAK4vhMXAi+mir2?=
 =?us-ascii?Q?qLCelJePsEo4LxVLmsLLSdmT3Xgx3Dlay4qXHnTEozVD5DTiFUOhBMTRnI1d?=
 =?us-ascii?Q?hF1VuDRy3CuSWwKviI2sHsBT3GobSCM8oexFfdfalLgyREx2lwYbabEYeyn9?=
 =?us-ascii?Q?XJk4yvXQJatjr27jGplnVh8HE7s9MrpVAsweWmgOljTvfNh9sZWCKhqRMWlr?=
 =?us-ascii?Q?mrKjOUVPNqLaHHn7t+KnM3vbqzivQ3h2yTDF2SH/4b8KSt2DJVXpcOltXcdt?=
 =?us-ascii?Q?U3MSUE4gW6wefrzusC1D0pYvlwXwdojTGneDKamfL/3C+gh9qxiIg2CKMXyL?=
 =?us-ascii?Q?RsV37k3pmtw7wLnpqthk7E2tnpGocnkdGPMGz3dj8XTfKhP7lKkyIcrXFhyL?=
 =?us-ascii?Q?JRYADlCtLqVG2KGTez5R5ir7xuKwEuShxWw/svI5NnEvx14AgzDSTVZjN7Mi?=
 =?us-ascii?Q?I3Ij5ve1b/9HBBwEWTRZymMQJjaYv6xR8RWyOAyB0GwsHAtZte/EJon8lmzb?=
 =?us-ascii?Q?a4MateKedsL5VPgfq4p11AyPzT7G8dWoxb6fd/HVS7DO1ynMmhpFhpmjUgvN?=
 =?us-ascii?Q?gh63QC4IlRnCmslduCJNR7CIH8QLbxbxDmDxfsvXYzxA1RSPQI6BT9ZzGunR?=
 =?us-ascii?Q?AggVhlP+kC8lZj3v0vdgILHnK5thNgOu9D5NMXR2zBvKj6yqGUxIDK5ToGxc?=
 =?us-ascii?Q?+TfyvKnZQM7OF3elgM8QP6IM4WXx7Ke52vNuli1z0b6R8e1mHrjnx3cxK8Rw?=
 =?us-ascii?Q?84CEM78qVjoE+uznSs1OzkWcru3/yQw1dDV4wm+wkQbBDdjjBLHlMLl8baFl?=
 =?us-ascii?Q?F2laezfy+USlcGfcXEPgygNvJ8X6OppYP7tXYOp9f8KWcMfB5v7yib4m2Pfy?=
 =?us-ascii?Q?oap2yJcnGPKLw1kWiwd/ETcUJrVuibLx1yUFhWcG7z2HcX3SlYsqM4doZlUm?=
 =?us-ascii?Q?2nC9cRX0vS7+VxqX1jTVfmKqYJnJ6KNbPL7XvVcq1r6n2bxMG8mzohPnwZSN?=
 =?us-ascii?Q?0g5KOBjjTd8Zerfy8XT0oN/AzWQYQwhtKCQo6PSJd/pC3G2UbkA/Eod6lG/p?=
 =?us-ascii?Q?IsGOZavgLd/HcK3mdmylkkwEAGzfiFIf96/p1AUATQ2A9wkrrQi6ceLU5Lyb?=
 =?us-ascii?Q?UwkDONdHvKzP946cc4Ay7RPQZVevE0cqXRiR9nBX19WUb0zCG8sddfYF4KSR?=
 =?us-ascii?Q?nQeU4N9J+8ivzeOYdgfKcYZ0PAvvr1gdmIo+is2xYskCGblA3Jv6nxOkRcWz?=
 =?us-ascii?Q?hEpVSYO4GxO+MGNz+gWmiMmtiseW2GN74fkubi6XmX9vdbUTc1xyVUD+zMhs?=
 =?us-ascii?Q?44aFmlu5hEp6BZigeyCweJFSRvQBqHh6VvVnN4Y1CDcbP+cXaWeTOZqI28rB?=
 =?us-ascii?Q?+wOGiFt+ySqS2CkrRJwAsIgUiVMU?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+s3nHdPoF6oK+HAixz8ekl9eTlU8OYqQHxbnI/IzhW4qk6lGM3qaRczQGZNi?=
 =?us-ascii?Q?GZBBSvRoNtnbK/Ro1TaKjnkpF9e5OHTtRtnXlFvECptz32YqYVl6mdafwpJb?=
 =?us-ascii?Q?KHrVNdcvt19kDQZ3G0EY2rNwa9G3Q5rUZf26nLDb4KymyCvUPdsTHJLt38aH?=
 =?us-ascii?Q?EfIqAI43HxVfQi9zC+pupG4La8DWO2BrAokByVFvwY0sX8fwUTBTohK8LHsy?=
 =?us-ascii?Q?PavEnEPRty6wG+tG6LL+n1qQ9JeOKf2vShYXZGNCuEpDqbR+rsoFE+MF3NMf?=
 =?us-ascii?Q?JzCphqVaXl9w4D96YC3jyjylFNefePYxUBRm0UpurTKyYf1iB7MKoIqEeNHP?=
 =?us-ascii?Q?XXSeBWn8lUroWrChXBP/BeWjrxrti7bHnR7v3GWo3qKxSvssqjAcljThTX1i?=
 =?us-ascii?Q?etEuf12fJ8OCOHGBL2Gk0L5VqUVA4MP/DGcWmxBPZpVjLoAkP/pc5yvCOLp4?=
 =?us-ascii?Q?8KuDjcaIaauPS99zVNikJZ4zf2HADiTNDxwX4Y/mDLbj9+BkNLCcX+AeInUV?=
 =?us-ascii?Q?kEy7WEhrbC27her/GsFs/zaEGe4IzxC0UAEffEPgJHiabf4ZtlRM7Kr1ckJx?=
 =?us-ascii?Q?YeYLu+ZY6QAWBGNkM55k55Dr9CzvVS5wBt36gCojDLLlGB3VhKvGWaJhUVJl?=
 =?us-ascii?Q?3tr/w/8/QH8d3gktrPEpzebuzd8caXT6Nz2jPZcwh1K0KkeiBq0ePkRphD3r?=
 =?us-ascii?Q?Yp53ZdQyVZoivjFR9MxD0giX77+Lgcm2tt1UjZMbgAtQvnkTwDSVEd/PEqZj?=
 =?us-ascii?Q?auTKqawRbHVVmkZxzE6XTb7Ujr17Brt6wOSW7YiTUeKXxncfy/E95GWUSxxy?=
 =?us-ascii?Q?IO1/5eVJWPFIlfOQ8l0AuPvzq63nJ+xyOu1MmMtfmruk/mdqdP+dyORIVqTH?=
 =?us-ascii?Q?BoUs0kE4fHFTkqYU57UdmUY6L+ITWK2hkBK7eUPVJO4QppA13dE7bnjauKDW?=
 =?us-ascii?Q?FbMNKh7AN4tU5sHDDHJnIUGvhZ5JqGHGYF9c0VjT7WnlG9k3IKnUmtB4i5RO?=
 =?us-ascii?Q?+dD9O+u71aOO/U6UlWvFucYrepOThB8Zsv/phN2xSkTGX5rF8JDNw0sYcV7+?=
 =?us-ascii?Q?GDJaA5TQxaUrbRSFyZPtOgUS4It6W9JXn+dwTNvuR4/9jCMWkBcf+R6ix3bA?=
 =?us-ascii?Q?4RVa1J5YYBIVkJ+qQpniIOgiV65UUnIkQZoqb17Y5WMy1cHoJmRow+S55cYp?=
 =?us-ascii?Q?Ar9jLAoEQQD58brNqs/kBzHUTbeHsb6n94hDZnINeH9vdmZzL87ZFZ2tU3yM?=
 =?us-ascii?Q?z9AjrOsbd4oU9TyI1/+xNpRn0y26eRgi/dVyHe2cEs3majupDfz7oT0GulHW?=
 =?us-ascii?Q?LXPnFl5dQA+vooNVxue86mj2sUbCCarIx2KsrZvjIEIYt0CmGj3Px0lucH+U?=
 =?us-ascii?Q?KXFhYuV/BFbngq/i0peVNQNzoZ1jDPhYZv6LJmI7i/s+juIvD3eibsw+m1Uz?=
 =?us-ascii?Q?cHN23oTqA5gqsMVTM2RxUoFesdtvshHc6PDpGRIvh5aum9oyQ6tV3MYTWmFJ?=
 =?us-ascii?Q?WBtBGDjiID7plq7Z0WLwfhvacuSzslf8Igr2yyhSQ43/PqP+GRARrIDt8urb?=
 =?us-ascii?Q?poHYWTrChtbSV8rS+arw2Ko++IUgN1e7IzzRDm/a?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <85DCFF3409F4B649840B4E99BF88C194@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df834061-d6b8-4dcb-1191-08dd31774254
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 13:04:03.9904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CamYhplzawht3e2za9z4vy+BuM74mEr47PbniVuo2AecknlHNHyduEbimTgWGovKFnSsMQuzYakYX+EWY0Tiow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10368
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 13:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209650

Note this has been superseded by the series I just sent.

Ross

> On 9 Jan 2025, at 18:11, Ross Burton via lists.openembedded.org <ross.bur=
ton=3Darm.com@lists.openembedded.org> wrote:
>=20
> Every other architecture has the QEMU_EXTRAOPTIONS assignments in the
> tune files, so move the PPC ones too.
>=20
> Leave the MACHINE_ARCH workarounds present for now as these are masking
> a genuine bug (#15647) that needs to be resolved properly.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> meta/classes-recipe/qemu.bbclass                     | 8 --------
> meta/conf/machine/include/powerpc/arch-powerpc64.inc | 1 +
> meta/conf/machine/include/powerpc/tune-ppc7400.inc   | 1 +
> meta/conf/machine/include/powerpc/tune-ppce500mc.inc | 1 +
> meta/conf/machine/include/powerpc/tune-ppce500v2.inc | 1 +
> meta/conf/machine/include/powerpc/tune-ppce5500.inc  | 2 ++
> meta/conf/machine/include/powerpc/tune-ppce6500.inc  | 2 ++
> 7 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.=
bbclass
> index dbb5ee0b666..a375bde8985 100644
> --- a/meta/classes-recipe/qemu.bbclass
> +++ b/meta/classes-recipe/qemu.bbclass
> @@ -63,14 +63,6 @@ def qemu_run_binary(data, rootfs_path, binary):
> QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" =
% d.getVar('PACKAGE_ARCH')) or ""}"
> QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
>=20
> -QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
> -QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
> -QEMU_EXTRAOPTIONS_ppce5500 =3D " -cpu e500mc"
> -QEMU_EXTRAOPTIONS_ppc64e5500 =3D " -cpu e500mc"
> -QEMU_EXTRAOPTIONS_ppce6500 =3D " -cpu e500mc"
> -QEMU_EXTRAOPTIONS_ppc64e6500 =3D " -cpu e500mc"
> -QEMU_EXTRAOPTIONS_ppc7400 =3D " -cpu 7400"
> -QEMU_EXTRAOPTIONS_powerpc64le =3D " -cpu POWER9"
> # Some packages e.g. fwupd sets PACKAGE_ARCH =3D MACHINE_ARCH and uses me=
son which
> # needs right options to usermode qemu
> QEMU_EXTRAOPTIONS_qemuppc =3D " -cpu 7400"
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/=
conf/machine/include/powerpc/arch-powerpc64.inc
> index 2533151869b..af0635a641f 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> @@ -21,3 +21,4 @@ TUNE_FEATURES:tune-powerpc64le =3D "m64 fpu-hard"
> BASE_LIB:tune-powerpc64le =3D "lib64"
> TUNE_PKGARCH:tune-powerpc64le =3D "powerpc64le"
> PACKAGE_EXTRA_ARCHS:tune-powerpc64le =3D "powerpc64le"
> +QEMU_EXTRAOPTIONS_powerpc64le =3D " -cpu POWER9"
> diff --git a/meta/conf/machine/include/powerpc/tune-ppc7400.inc b/meta/co=
nf/machine/include/powerpc/tune-ppc7400.inc
> index 49b94f5ee1c..6d3c158bbb5 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppc7400.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppc7400.inc
> @@ -9,3 +9,4 @@ AVAILTUNES +=3D "ppc7400"
> TUNE_FEATURES:tune-ppc7400 =3D "m32 fpu-hard ppc7400 altivec bigendian"
> TUNE_PKGARCH:tune-ppc7400 =3D "ppc7400"
> PACKAGE_EXTRA_ARCHS:tune-ppc7400 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerpc}=
 ppc7400"
> +QEMU_EXTRAOPTIONS_ppc7400 =3D " -cpu 7400"
> diff --git a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc b/meta/=
conf/machine/include/powerpc/tune-ppce500mc.inc
> index 036f8b26315..8c4630b368c 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
> @@ -9,6 +9,7 @@ AVAILTUNES +=3D "ppce500mc"
> TUNE_FEATURES:tune-ppce500mc =3D "m32 fpu-hard ppce500mc bigendian"
> TUNE_PKGARCH:tune-ppce500mc =3D "ppce500mc"
> PACKAGE_EXTRA_ARCHS:tune-ppce500mc =3D "${PACKAGE_EXTRA_ARCHS:tune-powerp=
c} ppce500mc"
> +QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
>=20
> # pass -mcpu=3De500mc for ppce500mc kernel cross compile
> TARGET_CC_KERNEL_ARCH =3D "-mcpu=3De500mc"
> diff --git a/meta/conf/machine/include/powerpc/tune-ppce500v2.inc b/meta/=
conf/machine/include/powerpc/tune-ppce500v2.inc
> index 461164d818f..204580ee15a 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppce500v2.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppce500v2.inc
> @@ -18,3 +18,4 @@ AVAILTUNES +=3D "ppce500v2"
> TUNE_FEATURES:tune-ppce500v2 =3D "m32 ppce500v2 bigendian"
> TUNE_PKGARCH:tune-ppce500v2 =3D "ppce500v2"
> PACKAGE_EXTRA_ARCHS:tune-ppce500v2 =3D "ppce500v2"
> +QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
> diff --git a/meta/conf/machine/include/powerpc/tune-ppce5500.inc b/meta/c=
onf/machine/include/powerpc/tune-ppce5500.inc
> index 4915b81ee4d..8976c1612fd 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppce5500.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
> @@ -10,11 +10,13 @@ TUNE_FEATURES:tune-ppce5500 =3D "m32 fpu-hard e5500 b=
igendian"
> BASE_LIB:tune-ppce5500 =3D "lib"
> TUNE_PKGARCH:tune-ppce5500 =3D "ppce5500"
> PACKAGE_EXTRA_ARCHS:tune-ppce5500 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerpc=
} ppce5500"
> +QEMU_EXTRAOPTIONS_ppce5500 =3D " -cpu e500mc"
>=20
> TUNE_FEATURES:tune-ppc64e5500 =3D "m64 fpu-hard e5500 bigendian"
> BASE_LIB:tune-ppc64e5500 =3D "lib64"
> TUNE_PKGARCH:tune-ppc64e5500 =3D "ppc64e5500"
> PACKAGE_EXTRA_ARCHS:tune-ppc64e5500 =3D "${PACKAGE_EXTRA_ARCHS:tune-power=
pc64} ppc64e5500"
> +QEMU_EXTRAOPTIONS_ppc64e5500 =3D " -cpu e500mc"
>=20
> # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
> MACHINE_FEATURES_BACKFILL_CONSIDERED:append =3D "${@bb.utils.contains('TU=
NE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
> diff --git a/meta/conf/machine/include/powerpc/tune-ppce6500.inc b/meta/c=
onf/machine/include/powerpc/tune-ppce6500.inc
> index f6310ab4c44..b0efe1924c5 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppce6500.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
> @@ -10,11 +10,13 @@ TUNE_FEATURES:tune-ppce6500 =3D "m32 fpu-hard e6500 a=
ltivec bigendian"
> BASE_LIB:tune-ppce6500 =3D "lib"
> TUNE_PKGARCH:tune-ppce6500 =3D "ppce6500"
> PACKAGE_EXTRA_ARCHS:tune-ppce6500 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerpc=
} ppce6500"
> +QEMU_EXTRAOPTIONS_ppce6500 =3D " -cpu e500mc"
>=20
> TUNE_FEATURES:tune-ppc64e6500 =3D "m64 fpu-hard e6500 altivec bigendian"
> BASE_LIB:tune-ppc64e6500 =3D "lib64"
> TUNE_PKGARCH:tune-ppc64e6500 =3D "ppc64e6500"
> PACKAGE_EXTRA_ARCHS:tune-ppc64e6500 =3D "${PACKAGE_EXTRA_ARCHS:tune-power=
pc64} ppc64e6500"
> +QEMU_EXTRAOPTIONS_ppc64e6500 =3D " -cpu e500mc"
>=20
> # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
> MACHINE_FEATURES_BACKFILL_CONSIDERED:append =3D "${@bb.utils.contains('TU=
NE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
> --=20
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209631): https://lists.openembedded.org/g/openembedde=
d-core/message/209631
> Mute This Topic: https://lists.openembedded.org/mt/110520943/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



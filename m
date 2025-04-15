Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF545C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 16:20:59 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.5])
 by mx.groups.io with SMTP id smtpd.web10.24507.1744734054612397825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 09:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Q1OhjtMt;
 spf=pass (domain: axis.com, ip: 52.101.67.5, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGGY3fogTpL9402jEF/DD7GqXiuuAqQZinltniVxr1tSywZbc2HTkJxiiZ9uZ3MKGUUuwEdC0L/owg0MjRvHVg4DUKhvk1XT8NNRCIlJPto3ioRkfCTS5ax+15cw/u6qmwOao33mFKkiUFkFMhAEtaHKcxS69e7f1xZTpcYdCHxOeBk0H0HsXAGE9IKhM9qSL8rVO9E5tV1XDQbTfHz7dgp+d/3VvBfnpG9C3YdO++tTopSjF3rqJNUJ3UdEVwdxdfLkep1Is9mJOcbd158CD7rohLzY6gyCfyshJTZZuIQgfgzTb78mPl8iGXBtjV/JFj2i9EiMSsuY04WrbCnxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bhta9edxoyBXss4UOeF+WuRDaLFHU3Tvtm0FdEQzEs8=;
 b=X6J9DuxKnsZyBVM2lPK2FmttcIUhAiP6H633hwld4LMu1jB5cNOV7nwMcs23p+iijKIgGjy3VfPvK4Sujca0kp/XodRqzjq33F9gVJ0bAY4MDYkS5U2twcJacpTbcTp5kXSORurHh0AhKHSjau5VicBVMtVOsnlm7b8ByQdEyZ04dsCZ0nxjVu+eUViZqnBdVRdA+6FqdvLkh95CB5jyryhR7+d4yLrxsQM2oVWuzojf97leFabtQkVgBf3TeyKD/huFcJPqFT7/ePbzVpxgGelEgamYIFfqj+WwvLryEOg6eLUQLpgCt3GDZxR41+pQ5uoDs02HqVJThqsNYj91UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bhta9edxoyBXss4UOeF+WuRDaLFHU3Tvtm0FdEQzEs8=;
 b=Q1OhjtMtDSlJlNzsWcn5Fw/JBoPJ2Bi+lIlbD9Sun6UDVao6jwC3ZkuzBj90H8L1WyRybB3j+fMaYBpVZ8sWF6pA12QNa8iWsnq2neQ2Tqnkw/x3eStkJdmWIpXWgKNNTHxhnKAgsydxy7322WKLGtLFUlwZbK/J82HhE8lapqc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB10145.eurprd02.prod.outlook.com (2603:10a6:20b:63e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 16:20:51 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 16:20:50 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>, Adrian Freihofer
	<adrian.freihofer@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "mike.looijmans@topic.nl"
	<mike.looijmans@topic.nl>
Subject: RE: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
Thread-Topic: [OE-core] [PATCH v3 01/11] systemd: enable efi support by
 default
Thread-Index: 
 AQHbpX7YGulwISLUv0i76npDDFmijbOeL7+AgAAi/YCAAAZsAIAFEEmAgAEjj4CAAGbn4A==
Date: Tue, 15 Apr 2025 16:20:50 +0000
Message-ID: 
 <DB5PR02MB102130E10617CF99E82F6A94FEFB22@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org>
 <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl> <Z_jy0-3v8qVSyll8@nuoska>
 <960572ae-f816-4d55-b935-8e11e2dad89f@topic.nl>
 <CAB3asfhjnUAm-sB=Q4mk9whXUMdgaBZk0kwiwYKKyPJ0ydnU2w@mail.gmail.com>
 <Z_4sMeEiHjZ8ydfs@nuoska>
In-Reply-To: <Z_4sMeEiHjZ8ydfs@nuoska>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB10145:EE_
x-ms-office365-filtering-correlation-id: 677379eb-6591-48b0-dd5d-08dd7c397ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?OKs1VE82DYO6eNPZFZqqiVtZsdsxCWidP4yZKoPUhsF19MC5tk3mb1MQApRG?=
 =?us-ascii?Q?Z1p3Cgj6RaIXe/jk0IN2KPcQG3aSYbWg5a06YZO0L7Uk0GDDUqMdiq/ieX2S?=
 =?us-ascii?Q?awNgIABJf+fjvf0QtsQAtl35XhMY/nwibFa22Uy/uE7RHNKSnJSbUGsr07km?=
 =?us-ascii?Q?T3Q5TTCBOYIKtcItQtLHaxJNUq3kSa5GZnX921RToJ8Eln+MNkYb5agVT9tA?=
 =?us-ascii?Q?AUg4wIuii4fO9lw5gKhHaGruPWl2DG64KFkIkB90nkkFIUDyTC03t8XEtbg8?=
 =?us-ascii?Q?4HFijxod9sdcIn5sFj0aFYBGYJaza+y33K4NZdiL9gJzlvPXJevxLwRAJ4U0?=
 =?us-ascii?Q?WvitgCEQgEqcct2FjcuavrJgFWoL9YE+Gge2+9SIjskqvc7SiphoyqZCUjP1?=
 =?us-ascii?Q?e9rbvLfJzhanjBMf1Lo/1yJvk7HA4UFNAJPzIwgGW7ZhlG/IlMpdR/X+MpE6?=
 =?us-ascii?Q?ekLm/7IEgqc+3PwinG7np/crhfXZlqq8TARSah2Hgr3OHEF4uPvUnjopt4Mv?=
 =?us-ascii?Q?IFyqK5WbtIm7i88c4pZhUMZGY/97+MZPFoNCbis0bPKgVjYTRCDZyBguSPtM?=
 =?us-ascii?Q?ceAzED0I2pBcrdkbikjwdtG+m9M5srroy6cnkYfbhxzPM1s18ITyKkrArpir?=
 =?us-ascii?Q?SqA/Dn2NsdvCjQc1Lg6GThbR+pj3ugjDFoBtaAlw4+CUgNZ8QXwI/YLAb6RU?=
 =?us-ascii?Q?c/hNzvDm3m7LrR2H93R0C4TKKBSX85FVE31kgJZ/GuyWEReGuyU4DzjBIr0I?=
 =?us-ascii?Q?Q8mQ0cZJ2fAEDDfQfmdfTekhVu2cX6m7b+D3ZJdxrFvYjfz9KC8E8/IWfar4?=
 =?us-ascii?Q?NvEsBnvK3b65TmRmJnj9kagolcaVKTQR+e9ztL5I4PM5TDJTiSeIVqdle3rR?=
 =?us-ascii?Q?Mf7m09tKjDSDGQ33LTU6Dm6oCgRtFEtu9H6C5TzacndXo7zHPGGuA6sE5aQ5?=
 =?us-ascii?Q?/6HlQb6skAtQKU8wVkCI6COrOCCkP6Xx2OmsbyP7DsdBu3u7znGepugxctBH?=
 =?us-ascii?Q?OqBKo358fUKSoPgL+Gs7AD7UjziVHdESe/57drj/X97aNg4cPnJVq2GetCps?=
 =?us-ascii?Q?ethjCCWtv2F2UTw4eSidt7/AIsgK90s8ckYL2Kaf6J/v2JVXCYP+/6vIe2aP?=
 =?us-ascii?Q?PVCqP3k3AALouroAKhUMdEz/DA6ItqfnwRwufnFghZrNDsYF50pK+LBM70T+?=
 =?us-ascii?Q?aXWaPPD4UbeSUXP87dJU4bhBxLt/CI1y1FI1ejZdlH7cxuOd4Hc29vWdeZzH?=
 =?us-ascii?Q?zbG4d7J0o1lIv0aOq5zc0GMMitYvrJINFXN4SoUcNnN+0WRhQE+VDFa4R0d6?=
 =?us-ascii?Q?hpE7435hQkCzFwphITcqsLbrwa3ODnvMBf9D/SufrSmkerERodlH29avRjNU?=
 =?us-ascii?Q?1dSHFs+69Lhg0PHYF9CONTZDWYmBlkwscHUnU9v/HaBblbRuA5EOl4tUBkaF?=
 =?us-ascii?Q?Adjx+RktXGg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Txh1EdnQOj0dvjwRLJKsX2Xj5Zp7KF74sTinHt4iONBIlA7PtR89lLIfW/y4?=
 =?us-ascii?Q?k4zsWtf29jw7MUUyUFf6o/5+HhYhiARmtyc6wB5H7LJJ75QY8pm3YaNo1FXI?=
 =?us-ascii?Q?s87XAtd0/CgD3JOCt5Oyv+ICkOIm4sxdhUQZVOMV1QoZPIv0Jb1RvPKM7HoJ?=
 =?us-ascii?Q?g+5WCUSkacXHB7liiOZIjvHbzp1rlH23CwivQyyV0kveiSybCazF78ORWIe8?=
 =?us-ascii?Q?0yBLAGa0c/IgTkFnDvnUM3EPzJR9wGoRNWnTuQKiywU1EOlca9ZkHdLgyzf4?=
 =?us-ascii?Q?n2So3+QT+CAAEFpSVN3NW/aab+MfSLuOVOw7+Igq8fpQsGnasIwKWf3ZyZQB?=
 =?us-ascii?Q?OWQs2Flcz8HsQc5bpmsH0pIFlYZUwTAfbsCF87GBD+kUBKMSav9+tfIWmNt1?=
 =?us-ascii?Q?4i6nwae+Da7bMRzWI8qjwzukYmY0UeTGCiv+5bD/lfYoooSi6pc6744j0Cd4?=
 =?us-ascii?Q?Y4EoZycW+qPwa6DuFHccG78OgJqr7md8+CqcUWECticcrVHY5yTc+XcQafgQ?=
 =?us-ascii?Q?O2WHPMvPNLfpMod4/nCzs5PyR6ArD3iqa3Hwq2SMsFEceX7xQ7vEUYxkRWaZ?=
 =?us-ascii?Q?nuWlGssYkglV7GnVqjrbPy5FdXWwJggEnK2nv952Fm3SlKjh5AgZn92K8Az8?=
 =?us-ascii?Q?F1wJv36DVsI7AJPooovpDroR4lLT5zZnNmYsUkONC3injyuGGQtgdUbUgXic?=
 =?us-ascii?Q?sc46XHM0Hp+THMczBzxp80VdXiDMUuP3Ozez8cgl7aF0TctHHxFutiJi034F?=
 =?us-ascii?Q?1V/jrZGcSKXD2RT3Cpdc8ErvHMIkzLNckb1y/iCZaqeSPM1bYhwipK6Be6ql?=
 =?us-ascii?Q?iyq24hdnNGyWEjt0oGqYt7fXU1wQmpZSUxL7jKqqjzX5buPWZBUk68S4/qkH?=
 =?us-ascii?Q?bgATPs8t0SDg1+tWtCaqyXFHSlTYIRSaaKMiU/US70ktH28fCm/bTbQtrRv4?=
 =?us-ascii?Q?p8p6JAi37YE5kdreyc07k0s/fcQgDewe2u0XYi2qlE10skOCqjAFEeTEbvQJ?=
 =?us-ascii?Q?S68pTDvmDRvuPCQ5AB6ed98jDaZG0jhQqhfiNTi9q8guzoCg8lyEyDf+FPRY?=
 =?us-ascii?Q?yMcgLacdnZ4VO8byZRHGwJWJ3m5Wmvn5VhG564VqErWjkBZ8cmZ/oVR7Lnr8?=
 =?us-ascii?Q?iUNQRw7sbeIzlnjI5i9NvI5/K5L6pkCWxLKqqPGTFBNpRjWPqEAYzHoEJK3D?=
 =?us-ascii?Q?YILlVp+d4f68muMopqR7ZNLJUQqJLxcEZg5QE4ubQklp5cQ4su23q1Qx+LLz?=
 =?us-ascii?Q?d5DeqmBQBW9lDz1BP3oIrYsJDX9KE45xI39XCu0jKVKDE5E8TaMi5CdxZn/4?=
 =?us-ascii?Q?213caWGzZMlqzQGkBAMlRtPSVS89cziyKaR+msNYhK2r6cs9BVtJkj+GOuV3?=
 =?us-ascii?Q?itX2twQ3sLBCm+Rk+1vMvGmNw0xc3L8qoYhlAcX6q9nuyWfhbwxZ14dcNMkB?=
 =?us-ascii?Q?/3IVWa++LYdyWHsR6HMPytHzU5mQhIBro4MeznLNKXk1XtdR35ZL8pUsOFsD?=
 =?us-ascii?Q?TlKQ4rqcraumaq4C0eQIL4O6ABKHyRrsKknNFpLEBF9r/IEN9L3qoA4PLFHK?=
 =?us-ascii?Q?OMlJ6/7z3Xx0so66sM0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677379eb-6591-48b0-dd5d-08dd7c397ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 16:20:50.6329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ySyJdyI0rKlRr++jSvRRIw8FBlvmShR221JhjN5lF1A9kdEGwLFmsf9QXNVcFdgf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 16:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214956

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Mikko Rapeli via lists.openembedded.org
> Sent: den 15 april 2025 11:52
> To: Adrian Freihofer <adrian.freihofer@gmail.com>
> Cc: openembedded-core@lists.openembedded.org; mike.looijmans@topic.nl
> Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by de=
fault
>=20
> Hi,
>=20
> On Mon, Apr 14, 2025 at 06:28:13PM +0200, Adrian Freihofer wrote:
> > Hi Mikko
> >
> > Would it be possible to provide some numbers on the impact on the size =
of
> > the binaries and the additional dependencies that could be added to the
> > image with or without efi enabled?
> > I think the patch would be a very good compromise if the impact is
> > negligible, but otherwise the question is probably still valid.

I have probably missed something in this very long thread, but what is the=
=20
reason to force EFI support on us rather than relying on the efi distro=20
feature? We do not use EFI in any of our products and thus do not have it=20
set in DISTRO_FEATURES. If it is suddenly expected that EFI support should=
=20
be enabled all over the place it just means I will have to go hunting for=20
it to turn it off rather than just relying on the existing distro feature.

>=20
> The impact is small:
>=20
>  * python3-pyelftools-native is added to build dependencies
>=20
>  * At runtime the efivars partition is now automatically mounted read-onl=
y by
>    systemd to /sys/firmware/efi/efivars and can be used to query various =
firmware
>    and EFI bootloader (grub, systemd-boot) details
>=20
>  * Since "efi" is now default, other layers can stop enabling it:
>=20
>    https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-core/syste=
md/systemd-efi.inc
>    https://git.yoctoproject.org/meta-security/tree/meta-tpm/recipes-core/=
systemd/systemd_%25.bbappend#n5
>    https://github.com/Wind-River/meta-secure-core/blob/master/meta-efi-se=
cure-boot/recipes-core/systemd/systemd-efi-secure-boot.inc

But isn't the problem here rather that these layers want to force EFI=20
support instead of using, e.g., REQUIRED_DISTRO_FEATURES =3D "efi"?

>=20
>  * /usr/lib/systemd/libsystemd-shared-257.so size increases 32 bytes from
>    4012152 to 4012184 bytes, 0.0008%
>=20
>  * systemd package size increase from 9857529 to 10226508, 3.7%, with
>    added files:
>=20
> +drwxr-xr-x root       root             4096 ./usr/lib/systemd/boot
> +drwxr-xr-x root       root             4096 ./usr/lib/systemd/boot/efi
> +-rw-r--r-- root       root             6144 ./usr/lib/systemd/boot/efi/a=
ddonaa64.efi.stub
> +-rw-r--r-- root       root           101376 ./usr/lib/systemd/boot/efi/l=
inuxaa64.efi.stub
> +-rw-r--r-- root       root           120832 ./usr/lib/systemd/boot/efi/s=
ystemd-bootaa64.efi
> +-rwxr-xr-x -          -               67656 ./usr/lib/systemd/systemd-bl=
ess-boot
> +-rwxr-xr-x -          -               67456 ./usr/lib/systemd/system-gen=
erators/systemd-bless-boot-generator
> +lrwxrwxrwx -          -                  25 ./usr/lib/systemd/system/soc=
kets.target.wants/systemd-bootctl.socket -> ../systemd-bootctl.socket
> +lrwxrwxrwx -          -                  35 ./usr/lib/systemd/system/sys=
init.target.wants/systemd-boot-random-seed.service -> ../systemd-boot-rando=
m-seed.service
> +lrwxrwxrwx -          -                  34 ./usr/lib/systemd/system/sys=
init.target.wants/systemd-hibernate-clear.service -> ../systemd-hibernate-c=
lear.service
> +-rw-r--r-- -          -                 690 ./usr/lib/systemd/system/sys=
temd-bless-boot.service
> +-rw-r--r-- -          -                 532 ./usr/lib/systemd/system/sys=
temd-bootctl@.service
> +-rw-r--r-- -          -                 596 ./usr/lib/systemd/system/sys=
temd-bootctl.socket
> +-rw-r--r-- -          -                1029 ./usr/lib/systemd/system/sys=
temd-boot-random-seed.service
> +-rw-r--r-- -          -                 733 ./usr/lib/systemd/system/sys=
temd-boot-update.service
> +-rw-r--r-- -          -                 782 ./usr/lib/systemd/system/sys=
temd-hibernate-clear.service
> +-rw-r--r-- -          -                 779 ./usr/lib/tmpfiles.d/20-syst=
emd-stub.conf
>=20
>   This shows a bug in the config between systemd and systemd-boot, the EF=
I binaries are
>   provided by both. Sadly systemd-boot doesn't work so well and doesn't i=
nstall all
>   the services etc which systemd does with "efi" and bootloader enabled. =
Not sure
>   if the overlap should be fixed or ignored. Using meson to install syste=
md-boot
>   binaries does fix deployment of the EFI binaries but does not install t=
he
>   random-seed etc services. With this workaround to avoid the EFI file du=
plication
>   in systemd recipe:
>=20
> --- a/meta/recipes-core/systemd/systemd_257.5.bb
> +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> @@ -149,7 +149,7 @@ PACKAGECONFIG[default-compression-lz4] =3D "-Dlz4=3Dt=
rue -Ddefault-compression=3Dlz4,,
>  PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue -Ddefault-compres=
sion=3Dxz,,xz"
>  PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue -Ddefault-com=
pression=3Dzstd,,zstd"
>  PACKAGECONFIG[dbus] =3D "-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbus"
> -PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Denabled,-Defi=3Dfals=
e -Dbootloader=3Ddisabled,python3-pyelftools-native"
> +PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Ddisabled,-Defi=3Dfal=
se -Dbootloader=3Ddisabled,python3-pyelftools-native systemd-boot"
>=20
>   size without "efi" is 9857529 bytes and with "efi" 9859196, or size inc=
rease
>   of 0.016% which is tiny. To stay closer to systemd upstream, I don't th=
ink
>   removing the duplication is worth the effort for now. systemd-boot
>   recipe could maybe be replaced by systemd recipe and a systemd-boot bin=
ary
>   package. Otherwise the configurations don't match. FWIW, it tried follo=
wing
>   changes to systemd-boot:
>=20
> --- a/meta/recipes-core/systemd/systemd-boot_257.5.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_257.5.bb
> @@ -24,6 +24,7 @@ EOF
>  MESON_CROSS_FILE:append =3D " --cross-file ${WORKDIR}/meson-${PN}.cross"
>=20
>  MESON_TARGET =3D "systemd-boot"
> +MESON_INSTALL_TAGS =3D "systemd-boot"
>=20
>  EXTRA_OEMESON +=3D "-Defi=3Dtrue \
>                    -Dbootloader=3Dtrue \
> @@ -43,7 +44,7 @@ python __anonymous () {
>      d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
>  }
>=20
> -FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
> +FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE} ${libdir}"
>=20
>  RDEPENDS:${PN} +=3D "virtual-systemd-bootconf"
>=20
> @@ -53,6 +54,7 @@ COMPATIBLE_HOST =3D "(aarch64.*|arm.*|x86_64.*|i.86.*|r=
iscv.*)-linux"
>  COMPATIBLE_HOST:x86-x32 =3D "null"
>=20
>  do_install() {
> +       meson_do_install
>         install -d ${D}${EFI_FILES_PATH}
>         install ${B}/src/boot/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${S=
YSTEMD_BOOT_IMAGE}
>  }
>=20
> Cheers,
>=20
> -Mikko

//Peter



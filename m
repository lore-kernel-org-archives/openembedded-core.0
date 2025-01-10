Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292E2E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 17:36:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.89])
 by mx.groups.io with SMTP id smtpd.web10.25286.1736530607666522715
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 09:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EuhXq73l;
 spf=pass (domain: arm.com, ip: 40.107.22.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHcD1hFncA4SYch9IpklIf0TXt+t8pUG4a6rQM3XtCqP9IKhKqgjM1FAv9BsFHsxWBvNUynHYeBhgdxWQWAAmOPe07Yd2yOqHYocLuuHLY5ZXLYYjTtuqHG7c/h3yietfEz4vpT5AaTxObs86CBScPGjS5KN4rwHjEjE44+ztISwI8h/MLf2pS42W+DDBMn0kVLJpTDG9lCnjotunssCRk3O2UwCHwisBPWhFTSCGfjx2EbUitMrY3aSzK+eEsQiw0pO6LGDaWrdYYoUqUHjmReO3h/MpySJ8cIFzQwSKRSWM19cYbijs8Vo2pewj61f18DAuvYQb6qGBNii+rSQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0RDF1l1OY+szCCatr8W1/z+0d0gRltoUSaZvRlogSI=;
 b=gNPT+wXUPjoiXS3Mi2QVjil4kZ91NvOCDRysbIYvXYIZEpx32gfRr/cvJsZ3xWuWwWTkJRZH/r8HtlGMaLrYiOsxXMQXcFl6F9yfWTHAmqS4McCZgdDYHG3FbakRp5V5/mjyvWxOr/KttCwiE54sOczISEGENb7lKASSpHpPaPXD03mJtJ/1bXwY7FprOehKeP34Ag5xUNzAQh76XLxFRnwf4hqrCvV/mQTdVtDo2dF9N2y3soCE077jy+KWZUbM14UipwxqKHtHT6AXiuF49bskpa7WmXn+0MvlRdFCmA7yWp7n06Q9+KizJZ6BgH5oc+BKmdMQRymiESHlOaXmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0RDF1l1OY+szCCatr8W1/z+0d0gRltoUSaZvRlogSI=;
 b=EuhXq73liWMohknAa0JQ7GNj/Z3b4lB2J1HCX8h6zLI0ASLvgh2ybJrGhGFgw4SkGXCpNaKEHqreMcC+Q5gZl44f+8DA5de633dlKJ9ddLYkHppLkvolMILtDl18SfFJUPnVCpIziizQ/bA04LCHkrl4zCnMasaAR7G60oNp5f4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7399.eurprd08.prod.outlook.com (2603:10a6:10:371::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 17:36:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 17:36:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] classes/qemu: use tune to select
 QEMU_EXTRAOPTIONS, not package architecture
Thread-Topic: [OE-core] [PATCH 1/3] classes/qemu: use tune to select
 QEMU_EXTRAOPTIONS, not package architecture
Thread-Index: AQHbY1/6faVkiZOy20qKIOHyVu9MlLMQRa2A
Date: Fri, 10 Jan 2025 17:36:44 +0000
Message-ID: <29D20DF1-96A7-4A24-B3EA-8252C23D15AC@arm.com>
References: <20250110130116.894607-1-ross.burton@arm.com>
In-Reply-To: <20250110130116.894607-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|DB9PR08MB7399:EE_
x-ms-office365-filtering-correlation-id: 5c5f64e5-9e46-46a8-dc00-08dd319d59e1
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?A95t40RFWXFdXI+ghjW7f59Ze5NdywOMKxgT64b//cCraTByJhOx69kaLFhM?=
 =?us-ascii?Q?6M22x4sLHKjUh/Dp1OH6cPiSTa4GgUWenAPnsCBOyrIbsjs1nt7p6vUH1qwC?=
 =?us-ascii?Q?Bm88ZPOyvRD/iD4Us3EV7lx75E/Z0CfPJWq4py/+p2U1WRB7OCp/u3NW3kck?=
 =?us-ascii?Q?JA2B+8WYPBjBCHoIBhM86Udj1kLRmsar+B4ebW8dQfheXgUZag/L67L4ahUu?=
 =?us-ascii?Q?4eFA7bkoZDg3zPaxoVeIEPyUzvh+AYl7YXFDoVhQvbpV9rJkLiUNkv6eSEMp?=
 =?us-ascii?Q?p3hTHAzZxP7+lw+apRT/ccCenA7ZavYGiQzETUN/ZJyGGXWAcspyHLZw38HW?=
 =?us-ascii?Q?pIYtUHrt062TbIN96RbZfYVxTlTS32qFVuy8ZQXwzniyQYatVyiOdj/XkOB7?=
 =?us-ascii?Q?FWZDfvs4kggoKErIsG0R85QjBXtFtO29pt7B/SSz5IqSxqOoTHzpvzTrlPd2?=
 =?us-ascii?Q?f7siqxmPre1G99onHNqAkOqu/4iLDSBw07Muu7H0NcyQ3KEW3E5Gv59Onxyr?=
 =?us-ascii?Q?GmCinKZTWi5uuaJTiTmA5dyFJHsEKzO0o8Ocgzn7Vdkqwws9PsGYyC/tAhI7?=
 =?us-ascii?Q?hr3yYNIUnG6nt3vJV4rRAfxoG/bmdb2yA2HUcQZH0aDSNNAjOGqFpc2Bvyrc?=
 =?us-ascii?Q?5JdO2hcH7cdcUgtuyFQqfotdi31eqwyC45eXKvSw9WawJ1AUq7AOYXJccFcY?=
 =?us-ascii?Q?vzIz+neOttgkVjxfbErSBH34RcbRCJeER+Xg1ZIu7GvknDqPBbS9eBXhZsyT?=
 =?us-ascii?Q?aulfGD5MY8JkzjYwWTPEE45fcFIcrMM69XEr1YaIqiMgFmmJPjqrlC0nZOec?=
 =?us-ascii?Q?3LgZziheTC9dDGmwarqKzSSvDdu2xXeoFgYk/2bQVbYpfcNc0Upp7haPkRp/?=
 =?us-ascii?Q?Bh/FPwsuBASYaMSIYqvf+CRQIMw/2peJpVfIdZ6UjuyL2MnryFTbiGkdDvbJ?=
 =?us-ascii?Q?CYWZ/YHcirHiUP6sk3fF4vGfpDd2dbSuNkBMq/h2Uru7mZiZrupj23sQlZwC?=
 =?us-ascii?Q?Yfba2CCDjeS0enwRfcbFStkw/3cdZ44m6RRMpuFa9SW49nc5IElXvS7B5wjd?=
 =?us-ascii?Q?jO5VU72ECn3ECqfZgRjJTlpXmMNNgWChzLeoMlvK54zPwJ0T7tW0fRxCqkEP?=
 =?us-ascii?Q?auxX1+KyzXVJKByiSbyEYxgLGLvs3DQjSsH1YNLBMXr9VsQKYaktU6ARcmri?=
 =?us-ascii?Q?EFYwzzG8k5Ee9M3MshIvLL44xjyUwHwiJYjradY2r54Kig06mpALX2Qr3BGA?=
 =?us-ascii?Q?xLWYsMGyzdkF5xedPIIumvZJ/166BACCUYCMN0aT+l4FbDjVcAajkkofn1RX?=
 =?us-ascii?Q?0SKO6EqRw9rOYbBgVyB56R8qjGAI74tnF/FRk9b1ATJXkAVRzQtMaTN9VHW5?=
 =?us-ascii?Q?HK/rWnRaWORpwuNmIbEHkLgGF23f?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?z0xcomPln2tGOh1yYwY9GGFclmn4+QB85v4n4Rw4iJ+LvKgdsqY43O38FekG?=
 =?us-ascii?Q?AyqWNfQ03mb4NHF/cuLhqkQndlXCEprNOnTProhEIhI61XajWq7ZvE1kQqFa?=
 =?us-ascii?Q?1BYFd+8BypQzWEIjx1x7gqeKWAAWWlrjdN7WTa6Cye+gYlpc4gjlQCZR2xbt?=
 =?us-ascii?Q?eRvwAS1ZbP0IwG4tcHu9z/S1xacCHU94maUZzM0zcguBxGTYJBg1TgVlZm3L?=
 =?us-ascii?Q?OCoVJjxutgs+56GfXUnpcpDzorVTQv/QC8ZThlKX5/DLYLsOSBeBCdVrVuR1?=
 =?us-ascii?Q?gnVtPhdkDKDaXZEGu24hbZH7p0BdLKnAevqaqa8sBJiAt/ie5ZVDmRMwP2w8?=
 =?us-ascii?Q?uy36tP8OY86/FpMpbQ+n2Fds2jtgnTs5JAi2braqk4blRPCpaHttZosnxinO?=
 =?us-ascii?Q?CEsfxomhSSHoYfrOgznSIxUEsvQKcbVId+ggRWw+HbLVLx2IQlTeaN7AeYUI?=
 =?us-ascii?Q?/5SnQYPR31MH0Amqq3wUdiecU0RYesR2L5A2JVmRzKa9TIJlA6h3m0UUx/0V?=
 =?us-ascii?Q?X8kqfRKkWbj9BW41LuYITdLc/scKMOkjRTi0rcZjsecv1OWLo+WvlSRrECL6?=
 =?us-ascii?Q?sYmiuBQq8IccgZoASimpwWWaGuDWB1yCXLT56EU292HOD909uiMQGSVGqrr6?=
 =?us-ascii?Q?/eADhh3X9AZCSdkT1eOqZ/r7PEpsIGSP+Nx87PmsvhsNIiavec5bv17o0eYg?=
 =?us-ascii?Q?UH02gXFBO/d5vVcoA3GC5l7nsD9cIMcfdXjWB7jCSFU/xN0lt7sU8QrGKeyl?=
 =?us-ascii?Q?dbHq3bxPUUmhxOdLxyy+rASmrxBCRpYM/AOocexe2gd+oM1XL3bWrqYd/b47?=
 =?us-ascii?Q?ItSFhq51miC4GM53sm21mX6/A/UNWv+fftiwnatPGwZvHwvAtZfyjJdYRLuA?=
 =?us-ascii?Q?qanoIjEvqhC39dEqF7+K3sTzS3hMct+QpizP1+uBdWBGYsX3HZvMsIqbfMJn?=
 =?us-ascii?Q?KkRFhYziTisSsH+Z7gQmjAboI+EqN9z6gOrI/RmJk7d+1xkC7cxTHlzz0aD/?=
 =?us-ascii?Q?geYPXHE9Hn0kNbC1ITfsU9JRfsZnrIMAsFSUb7MGEPnF2WVKeJ9yZsvM0p+m?=
 =?us-ascii?Q?e0lD1STCbCZAQR0PcVdmcK4Fbgg7VM1qfN8bkJug7xtAy1/HapYBHbtWi5VM?=
 =?us-ascii?Q?xB2hqhkgi1oegDRGl7h/6o7SlkVkzPzDVWk4aBmXyl6L1KTsqqN6APTGpvbS?=
 =?us-ascii?Q?HJGXlLHbgHuJ41wjtqIcGJQwCiL1CPT95npVCCfoDmyNCfubagyjCLNhgRp9?=
 =?us-ascii?Q?1Rj3RAu8WH3zE7Y40iDb/Rzra1VMomBjgeiPycUtdd9GBpXDib7MZ39lcL2c?=
 =?us-ascii?Q?bcLV75H8ZyP3Uv8qlok5M+M/YOJwzqfmHgqfzqOy1H6tP4PZWQtiYGmLOJYX?=
 =?us-ascii?Q?71Amzsh9VS4i9XLj1LnXI+JVXL1gFtoeRlEDmtvYe1VhBiEQkg7CqY4yoj+F?=
 =?us-ascii?Q?/Fq+oIpO3oi7jn27YzFDMH2tHU0xEpIpF4xH0ftF2CL39uuU8vhacOVRjgv7?=
 =?us-ascii?Q?Fd1AvCPFz4bX+9xkT3KFFdiUsw/XsPriZfJG/CROmhte9BPW2XWSuSo3bV9a?=
 =?us-ascii?Q?q6j/pmngnxukq1gvAyiWlwasZA1+xUai7uSDwU6G?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <099B144592E26E478FD96B794C8B0452@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5f64e5-9e46-46a8-dc00-08dd319d59e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 17:36:44.3865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uOHtRh8iRY1an1/uAVAD4WUgKdJelKsjzImwNyzAmpckdLs2YV7DAlYxaQ2DMfUpwVxNZiKs5qZiCtqM0DPg/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 17:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209658

This series breaks under nativesdk, please ignore for now.

Ross

> On 10 Jan 2025, at 13:01, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
>=20
> Using the package architecture to select the right qemu options to pass
> to qemu-user is incorrect, and fails for recipes that set PACKAGE_ARCH
> to MACHINE_ARCH (as the qemuppc workarounds suggest) because there are
> not typically any options set for the machine name.
>=20
> Solve this by using TUNE_PKGARCH instead: for the majority of recipes
> this is the same value, but for machine-specific recipes it remains the
> same instead of changing to the machine name.
>=20
> This means we can remove the qemuppc workarounds, as they're obsolete.
>=20
> Also update the gcc-testsuite recipe which uses the same pattern to use
> TUNE_PKGARCH, and generalise the else codepath to avoid needing to
> update the list of architectures.
>=20
> [ YOCTO #15647 ]
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> meta/classes-recipe/qemu.bbclass            | 8 ++------
> meta/recipes-devtools/gcc/gcc-testsuite.inc | 4 ++--
> 2 files changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.=
bbclass
> index dbb5ee0b666..8d7c82668b4 100644
> --- a/meta/classes-recipe/qemu.bbclass
> +++ b/meta/classes-recipe/qemu.bbclass
> @@ -60,8 +60,8 @@ def qemu_run_binary(data, rootfs_path, binary):
> # this dance). For others (e.g. arm) a -cpu option is not necessary, sinc=
e the
> # qemu-arm default CPU supports all required architecture levels.
>=20
> -QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s"=
 % d.getVar('PACKAGE_ARCH')) or ""}"
> -QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> +QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s"=
 % d.getVar('TUNE_PKGARCH')) or ""}"
> +QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${TUNE_PKGARCH}"
>=20
> QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
> QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
> @@ -71,7 +71,3 @@ QEMU_EXTRAOPTIONS_ppce6500 =3D " -cpu e500mc"
> QEMU_EXTRAOPTIONS_ppc64e6500 =3D " -cpu e500mc"
> QEMU_EXTRAOPTIONS_ppc7400 =3D " -cpu 7400"
> QEMU_EXTRAOPTIONS_powerpc64le =3D " -cpu POWER9"
> -# Some packages e.g. fwupd sets PACKAGE_ARCH =3D MACHINE_ARCH and uses m=
eson which
> -# needs right options to usermode qemu
> -QEMU_EXTRAOPTIONS_qemuppc =3D " -cpu 7400"
> -QEMU_EXTRAOPTIONS_qemuppc64 =3D " -cpu POWER9"
> diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-d=
evtools/gcc/gcc-testsuite.inc
> index 0a950b6c9e6..af6c7ad5a98 100644
> --- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
> +++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
> @@ -53,8 +53,8 @@ python check_prepare() {
>         #   - valid for x86*, powerpc, arm, arm64
>         if qemu_binary.endswith(("x86_64", "i386", "arm", "aarch64")):
>             args +=3D ["-cpu", "max"]
> -        elif qemu_binary.endswith(("ppc", "mips", "mips64")):
> -            extra =3D d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAG=
E_ARCH'))
> +        else:
> +            extra =3D d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('TUNE_P=
KGARCH'))
>             if extra:
>                 args +=3D extra.split()
>         # For mips64 we could set a maximal CPU (e.g. Loongson-3A4000) ho=
wever they either have MSA
> --=20
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209647): https://lists.openembedded.org/g/openembedde=
d-core/message/209647
> Mute This Topic: https://lists.openembedded.org/mt/110533939/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



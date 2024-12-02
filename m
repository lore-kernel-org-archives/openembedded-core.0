Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31175E69E8D
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 19:50:08 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.81])
 by mx.groups.io with SMTP id smtpd.web10.2194.1733169001081846748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 11:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=FTs+pWY5;
 spf=pass (domain: axis.com, ip: 40.107.241.81, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cA9cPocFvW/Vyu1n48QvkP1az8YxwfsyoKxrwq2c/DNoq5dahhzKOlFG6S4de6+9Xt3GenvK8TJB7Qxgct9I/wGdV4Jceu+1/qJZVtLmLg8N7MOQJRLZLVBegYyqt7nCdk2HVkgFx/Yr5gLmZjbPLyhNgejX6FsJU3K4HT2OTjQaqt/WLD8rPyEQtAt8+5I7nUdzrqb+hQPXtk7X2ilBxnfHasTXhJ7mFbYfjF/Ygt1VSiNbncmkYSynglxOQhHK0tX8p+Vu195qkgZPpYySwQyhTPR4MpsYh9spKBv0HUriBjYt80NJY3rxk1hKYqHNhFQUwoKHGPQei7xf1AdoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWDZk5pgfwzZOSPfsZqFV7s7pEYantQ2eVASUcO+UN4=;
 b=Treq/um+XAjJcvSqkrufS4fsa6CkBySA0bQ0aYskI4Zy++RKUo/6/UfOE33X/TDUhQ4LdY81jtiMKhOFo6Qb2LLZi+nNff+Kt8aEAHhuVYedLBZLkH63lUDD1BUYROfAOHfyvwwU+2Gqe+F/rHor8uQsb8XCb4Wqtpc3yzgHBJMvFhBVKRHtaxQayNBOldAo6ciIH1BqboVPgWddkvlpMRYMIUMdjVCk6OUhcroKFkAByaRcSSW1eSv2N+KSFrO7BdPaG2wF4Qd6yGMh2XbMSsPNXnagZ3FTvr79OyumunLWwBmd2ra3ejoUj0TzsXHAC5VtFcg1EUQB8EfAQCwFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWDZk5pgfwzZOSPfsZqFV7s7pEYantQ2eVASUcO+UN4=;
 b=FTs+pWY5/3yTjxME2B3lmIb9tJhxuXwPlFYUixNxtEY4flN8bvbwYbhnM275TJj5Njml8aJoMmLcxMKve1BhYXA9AcrE2prUQk9nqGerh39fsuGobCrCaApIq9+2d6A2gAXSzA4qXGBElBfy07gCvBlrdW961jyLJk2tHkUaPHo=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB9810.eurprd02.prod.outlook.com (2603:10a6:20b:60d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Mon, 2 Dec
 2024 19:49:56 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 19:49:56 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ricardo.salveti@oss.qualcomm.com" <ricardo.salveti@oss.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] systemd: drop deprecated rootlibdir,
 rootprefix and split-usr options
Thread-Topic: [OE-core] [PATCH 1/2] systemd: drop deprecated rootlibdir,
 rootprefix and split-usr options
Thread-Index: AQHbQg/9RCAO4Dbcrk2RqXxvMaTO3LLTWsgg
Date: Mon, 2 Dec 2024 19:49:56 +0000
Message-ID: 
 <DB5PR02MB102136B5A51F5964FFE6DC3ADEF352@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241129033654.1275825-1-ricardo.salveti@oss.qualcomm.com>
In-Reply-To: <20241129033654.1275825-1-ricardo.salveti@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB9810:EE_
x-ms-office365-filtering-correlation-id: c68fb205-662b-4882-7273-08dd130a7f80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?N8iuiDWYxfG/NIX24EpYGgNROBv56GtLSpC7GfJzl893kSy23HPwOICkS69r?=
 =?us-ascii?Q?xlNqOxufFFyaV661T+zG8a4EfTmn1UnO6eti2y9atzFzGjAl3ZKwNXoWgkpD?=
 =?us-ascii?Q?+DK1ULFm26UJk+eJbAIPte5TfKAUhPOq3IpTdKYfGMqvu0qnHMB9EJzrcGpe?=
 =?us-ascii?Q?Eth+I9jrcMJud9ccH83/GQOmGbSFl/xQ5B7/dCXVE23ILoh1216TRW9m1Fqe?=
 =?us-ascii?Q?cWTlWQPWXepQHAFAyw1XouK5c84cmpamf71gVvyEsJULdPaX8Gt1rmw44NGs?=
 =?us-ascii?Q?Ql5PItkBqM4XQQ58HQOaqtzhy0BHW3xhwNNsB2IXn2OPvSIsVOw834XIBgRj?=
 =?us-ascii?Q?iWE6zzxOQi2EboGK3efCiEzRqz23u85P83Mpi0k9C5bMQtfCX/4urs336CB6?=
 =?us-ascii?Q?k4VK3+nFg/zUcedNNrXPAKmquGw/CeLTnlQPQ3/4ECEbf3UVGw/8pOyS7h6B?=
 =?us-ascii?Q?NlIgFwAR/yaDZUSMdyLy4wnBUDwfHzLmOusQEOrf/HEw8uHbptrbQ/r49mi+?=
 =?us-ascii?Q?CTJ4ZbHeLLu2j399ubOsr0N033/06j6iTeHZyakCOe+6G7UWnKyADOgJdRhH?=
 =?us-ascii?Q?Kqr1jg26rlOTDGE3leP7MxjnVA+1y/yVZ5GNLFkS8O9ZcYKb/RTc+o5hoN4Z?=
 =?us-ascii?Q?a0GXGSW3zDTX/aCOQueAtUF0poctb2tVeuJ4yDNDAhEPqBNAOB/6Weabnbxc?=
 =?us-ascii?Q?LT99Q9BK1AjnQ75w05rshGQxNAvfTvz9vKvQXO3sQADBPgDMUKQPaKt0FKmb?=
 =?us-ascii?Q?E7lh5kENm+rAnWLdK74D5AV4CqgoyKDQLDxvjqJ/tnfiod9VLhKfl/aTGJHD?=
 =?us-ascii?Q?Xl7u9TwPxDVkGItNgHYIRVQsG0afib1e0IFhRCdmd9GxKFfPU5wySgVHwZOS?=
 =?us-ascii?Q?UjcFNK6SJTepTzSCIcESM2GPRGnl9W5m3kNlkEmehvbQvtU3gpmqQJuU6RrB?=
 =?us-ascii?Q?byQsCHVxu5Dcvz+bEIlAHzaGV+nWnbu1iJpW95PNikfpVmayuEAOIQYEyvf2?=
 =?us-ascii?Q?KrbJBtJEX4TN3geESPwHLP5R+Mt6j3er35IRtM/mq7KumXhTc1RjxHC5gRoS?=
 =?us-ascii?Q?M5EyQ86/UeizlxsJNaTL/ZHYHNat5ldQzDIhRxLDXAHXhl05UdDh4INplCS0?=
 =?us-ascii?Q?UDO7swCSMLZpko+qUx1TOf2mWbop72XRQnoZgkYDnppvwKLk9q481tJfJnaw?=
 =?us-ascii?Q?oq9TTfh/uzaj5863Jy8ynjJnZarbLaD4zde6e2SgO8lqtHfRThxulSeXsukr?=
 =?us-ascii?Q?Td5VAoqMqVbvXBk78ScTzCmBv70aD1z7PH7CQiErxsqScl78Zt7L9RxNb3SE?=
 =?us-ascii?Q?Kz2QWWdZfmpjfAZfAlXOQClE4XbexHR+EF/5YbggGXTEkIRqZ9KeHby5+7BR?=
 =?us-ascii?Q?MkfS+dVhPQiIPkDBBC+iUqgfd6xWLO81DpIO9FvR9eyumYeKpA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LxHUfymj3wX6N4lJMrr60rTL6KIS0xyCLgFhEAuJ61GD1/lhbsjbEEeLe2oy?=
 =?us-ascii?Q?NMw5CODywgbQWkkEUscYkkvsWcXJP0s07ipfp3hxLWBJNPwpVN7g3gIuSk4z?=
 =?us-ascii?Q?NuZ8ANPFFuO2yhYFlp9E2spsDRwJyNzyd4iRhJ1nTYWFf7Ag2E+TzxpPvIdC?=
 =?us-ascii?Q?XR4hpmU0dMgKagAJBTXWq8eKjJuPbMaWe2u+aevGs8I0fUDZqtyBG/EFDvmR?=
 =?us-ascii?Q?trVDKQa0ZCI7UAKfFIaq63hbzANgcCnYdS6AMzDHpbwYgDxe+jDykAW/KVNz?=
 =?us-ascii?Q?HDi72TVMFIMk4npep1vW9sfenVVOmV+ju0qK/kVJPxfkzAQz7Zl0Pi49Rm3q?=
 =?us-ascii?Q?juUs1BF+IlleqDRPjlaOnBvXx6ApyrX68auW/8oTHmr03h/ycYqalY6/k9ze?=
 =?us-ascii?Q?xQv8UQmh5n2nNbkU9zU1OkWi9qcimSfTEoggKtnXnCR/NbuL2hbJyNupJfVD?=
 =?us-ascii?Q?bsl2MVYikV49XBBL/8yufavL6yKSYplveBhtcxyLCEl6FHIX23ga34sNh8qL?=
 =?us-ascii?Q?BtBQTsIZYh7ivZn2tVbb0bwl6ep0xuZr629NV0h5jQtdw52kBuitGhZ8cLOI?=
 =?us-ascii?Q?OH1CCJaiIx4vyMDNwh4QGbYG2LU1fa5o8zo9jE3Wt2TIWbfvCf8ReADq//nB?=
 =?us-ascii?Q?BbQIuVXVkjkS7ZhodeOHcra4r4xt0IMM7cF4F1GDRI02rHrRVvKVx7W1D6V2?=
 =?us-ascii?Q?Ak8S58upj7GL2XOuwGy8PeBNezJxj86iVDFw+DlbUxOHUhmp1rfRM7zhVmxS?=
 =?us-ascii?Q?Xs/7Vd9bclz5s6RNZfWiJ6MLE47QwinDhHOY1epD1jQ61elLjmdohHZftorW?=
 =?us-ascii?Q?DaK+iT1D9HCxUkXQQ5t09McWu4WTgk9ZfggFvM0B6Xw6Lm2EuasmVLB76GKH?=
 =?us-ascii?Q?klgXedUELQ/QL7djsljw/fej7BNqEtK4u4ulpxo0E5bPO81Aagizu4kEUaYO?=
 =?us-ascii?Q?ybgrC+JoqoIq7KZk3gcjiVtXv0vq0L9fMHv+GLuDRjZvD0LzHqsuihcmoGxl?=
 =?us-ascii?Q?nq6UgBg9PsoB+VOMwcPDVRP4NOGi8zSiGuTjU2E+mcJLBf6Z2STZpn87RoDL?=
 =?us-ascii?Q?g3vcElSQJ8Hat8tjpvz/XOejKT/ydkNY5a/NAfBipEm/qJ7pxtwbpUng1GgL?=
 =?us-ascii?Q?MZxs8FzZNWEMCEibg0GCrw4UoL7c3ALzFdgnLhwceC6n3oZCiZv5cuRnSa1w?=
 =?us-ascii?Q?esx8ap+JVZlKnqAID5uibZpR3zC1R54+G3NhzNuq+bZMil5a1EIR2UIKOiej?=
 =?us-ascii?Q?4OwPy95jrhbaqRkMjTubpYZ6vQmtJCdrn4MNmmDHBUri0jc5SRZL+xYucVhG?=
 =?us-ascii?Q?2mD8p6fRMl9bLZ3SxtgLHQ5BFL50mNO8LPbSlSsI6575Fp+9MeCM5WC2ydpE?=
 =?us-ascii?Q?NMHj6pLAvFylRNCKcaLqexMtf4/iygxRHbRQcLlThGqGFNZkRQtFNdkdoCxB?=
 =?us-ascii?Q?reSLBsqCbRCcjNZQV9or/j8e+rW7eJY+tVSGhymOWTNgZjmKPLXgzfWXn2vW?=
 =?us-ascii?Q?ubQgIkfAAHQ3CcGxLvvQf8JBrCIqJC2nAx1k/otyMWUwxOlUJ9WTtTp5shZ7?=
 =?us-ascii?Q?1HQgRU1l5sDwWlntST4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68fb205-662b-4882-7273-08dd130a7f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 19:49:56.5837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eGka/9QgeJa59rh9HisSzsXLVdrLZ5vr+zHH0xzUH91ZeUNqB5pZB0Rs00erjLHl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9810
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 19:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208156

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ricardo Salveti via lists.openembedded.org
> Sent: den 29 november 2024 04:37
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] systemd: drop deprecated rootlibdir, rootp=
refix and split-usr options
>=20
> Support for split-usr and unmerged-usr were both removed as part of the
> systemd 255 release, so remove the current deprecated rootlibdir,
> rootprefix and split-usr options from the recipe.
>=20
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
>  meta/recipes-core/systemd/systemd_256.8.bb | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-co=
re/systemd/systemd_256.8.bb
> index c17100a636a..26d2237ce3a 100644
> --- a/meta/recipes-core/systemd/systemd_256.8.bb
> +++ b/meta/recipes-core/systemd/systemd_256.8.bb
> @@ -69,7 +69,7 @@ PAM_PLUGINS =3D " \
>  "
>=20
>  PACKAGECONFIG ??=3D " \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam pn=
i-names selinux smack usrmerge polkit seccomp', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam pn=
i-names selinux smack polkit seccomp', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump e=
lfutils', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} =
\
> @@ -218,7 +218,6 @@ def build_epoch(d):
>  PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0"
>  PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
>  PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
> -PACKAGECONFIG[usrmerge] =3D "-Dsplit-usr=3Dfalse,-Dsplit-usr=3Dtrue"
>  PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Dsplit-bin=3Dtrue"
>  PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
>  PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
> @@ -240,14 +239,10 @@ CFLAGS:append =3D " --sysroot=3D${STAGING_DIR_TARGE=
T}"
>=20
>  # Helper variables to clarify locations.  This mirrors the logic in syst=
emd's
>  # build system.
> -rootprefix ?=3D "${root_prefix}"
> -rootlibdir ?=3D "${base_libdir}"
> -rootlibexecdir =3D "${rootprefix}/lib"
> +rootlibexecdir =3D "${nonarch_base_libdir}"

Why use ${nonarch_base_libdir} here? ${nonarch_libdir} should be=20
more appropriate now that usrmerge is removed.

>=20
>  EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>                    -Dnobody-group=3Dnogroup \
> -                  -Drootlibdir=3D${rootlibdir} \
> -                  -Drootprefix=3D${rootprefix} \
>                    -Ddefault-locale=3DC \
>                    -Dmode=3Drelease \
>                    -Dsystem-alloc-uid-min=3D101 \
> @@ -403,7 +398,7 @@ do_install() {
>  }
>=20
>  python populate_packages:prepend (){
> -    systemdlibdir =3D d.getVar("rootlibdir")
> +    systemdlibdir =3D d.getVar("nonarch_base_libdir")

This should be using base_libdir (or libdir as suggested above).

>      do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Sy=
stemd %s library', extra_depends=3D'', allow_links=3DTrue)
>  }
>  PACKAGES_DYNAMIC +=3D "^lib(udev|systemd|nss).*"
> @@ -678,7 +673,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
>                  ${sysconfdir}/ssh/ssh_config.d/20-systemd-ssh-proxy.conf=
 \
>                  ${sysconfdir}/ssh/sshd_config.d/20-systemd-userdb.conf \
>                  ${rootlibexecdir}/systemd/* \
> -                ${rootlibdir}/systemd/libsystemd-core* \
> +                ${nonarch_base_libdir}/systemd/libsystemd-core* \

This should be using ${base_libdir} (or ${libdir} as suggested above).

>                  ${libdir}/pam.d \
>                  ${nonarch_libdir}/pam.d \
>                  ${systemd_unitdir}/* \
> @@ -739,7 +734,7 @@ INSANE_SKIP:${PN}-dbg +=3D "libdir"
>  INSANE_SKIP:${PN}-doc +=3D " libdir"
>  INSANE_SKIP:libsystemd-shared +=3D "libdir"
>=20
> -FILES:libsystemd-shared =3D "${rootlibdir}/systemd/libsystemd-shared*.so=
"
> +FILES:libsystemd-shared =3D "${nonarch_base_libdir}/systemd/libsystemd-s=
hared*.so"

This should be using ${base_libdir} (or ${libdir} as suggested above).

>=20
>  RPROVIDES:udev =3D "hotplug"
>=20
> --
> 2.34.1

//Peter



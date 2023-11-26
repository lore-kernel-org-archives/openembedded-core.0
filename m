Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227E5C4167B
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 21:25:23 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.66])
 by mx.groups.io with SMTP id smtpd.web11.66294.1701033921654834843
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 13:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=PsBXQX1k;
 spf=pass (domain: axis.com, ip: 40.107.241.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vqu7ki7JNccmorKYcKxmred0G5XQR2G4+FYVh0SD1lFYb7l21mlwr19GuhF/2BhVTWdygMCipvcrMdgePJL+2LPFIySFLfdDH1Hlf56pCJxvPevHugmjFQcrZMYIrSJhHsvbRRQDmDjCG6Tv4uXc/vKpp4NDHdqMheNr50jeKDeboD8dXAhLGwbIxbhma5+Y98Oy2RfGIEKLoy1ULOC4VvQc+as6395G/yXC6IvbtciThliAbuMMHH7ECjt4EY87d5Yj1/uB2JCwx/dhTU9lirjlVqU2SrZkAc095q3YHU9dfUmR1xCWASVy3Z3WSu8eLhQxrYpMQCPTZQFBQngo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUKhvIo5NWRwzy94/gBPtXjKiKCyKFVxb0JNM7hs0h0=;
 b=WmPE0gYIEbqomBHroFPBQoRnzZr4gDOmypItpMAkeCvUw1ilmcZBsTplJWaJoteBFAUN0cx+x8YNvNWb3YnSq4pdaRld7VmvScYAajTlcBW9xH0Y8G1P5yQMGCpVUxHNJTWO/43/59ClFSpzXnJX9oKf14x4TKjM3nOAJk+OB05IOXKCjsLiBK4Fb+JoO92b+XquegKJHRmXp5XlbAdAiRQjczEehOxCAgaBh2zdvf/zIxf3uCcSSzZprqBhKwTKjVv33Fd1i8IYVSC5OPZoJbELYv2dSCvhT9yYr2ZmP3PD+aC2vGowpR7yYZmemPGlhMiXRXhkj77JpQ6VoLcuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUKhvIo5NWRwzy94/gBPtXjKiKCyKFVxb0JNM7hs0h0=;
 b=PsBXQX1kSbrF7TvOzgcsTvnLpZiqHBWILpSljOmm4JkwOFm5YvdLgbC6dBAqos60978WzIBeRhOPu7WWeQ6qLv+EYdDv5aEIlwKRrzkOsygXissEt5BaChkE3+5tiBbulPzliNWqkxCZzAgFGO/X+1PqVw11lccB+6XSC3AdGpM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB8347.eurprd02.prod.outlook.com (2603:10a6:10:396::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Sun, 26 Nov
 2023 21:25:19 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e%5]) with mapi id 15.20.7025.022; Sun, 26 Nov 2023
 21:25:19 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Joakim.Tjernlund@infinera.com" <Joakim.Tjernlund@infinera.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [kirkstone][PATCH 4/4] shadow: Add PW_SUBDIR
Thread-Topic: [OE-core] [kirkstone][PATCH 4/4] shadow: Add PW_SUBDIR
Thread-Index: AQHaHuAyvvSeMiRFQUmP/5N0Wlwb4LCNGuJw
Date: Sun, 26 Nov 2023 21:25:19 +0000
Message-ID: 
 <DB5PR02MB10213E7017DEF13C0613A551AEFBEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
 <20231124141108.1397342-5-joakim.tjernlund@infinera.com>
In-Reply-To: <20231124141108.1397342-5-joakim.tjernlund@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB8347:EE_
x-ms-office365-filtering-correlation-id: 0a325b3d-ae04-4e5b-8e1c-08dbeec630d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jKBHflnKfnz1frW3sQZRnUtw+V7hWNKs7zGRC1ikLYWuobK/rag7uK4J5JlUZbX8tk9lGbNmRBs1CIiJO17ZQAxyBCWO2bVxq5TmUkADifvE2eDpnFIT9TvFdCdnB0okCFsZcnfhDW9R+/9tMEbJR8D+LDaNdonoku0tu+jsbMDppJylc11NQID37tvZh3qrnDC8Ig56QWBENzhW5FE3+sifo/iB+HHd+I6CQEgzdsXLuibRmcRX6Sh3jarZZsNlvhkqSvd4jqs2fWH8UNayVhKONbT1NatMLobG+CANcF/MOQhSo7iYgZd5mfZmgwZPsv+00nb3EyxO/kS7l3rrwMe7Rn8SJXx2JOOucHKWcTaZVRWPkWbtt+ZHjpuuLpxmRp+AdwjU9kb+5ftxZbKo+Gw2ryz5I7ATRw3A/mqURbnaMKp3/lijb0oSBmteALxc2wsQ4aJLe0ee8AlaqtyAG5IKtsGUmsU9nww6WndVEu0a6ufp+jkouCyiCeh9kAFYBDocOBkCJV80UISqqZrVEQ9MayD4Yd9DtQkSQ3WSTmRnloSz6BRY1qSG3VHk84JIu8DucdbRdFvSoKN2j1TU323zlpOI2RPAy3cVK9FCD3Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(366004)(376002)(396003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(38100700002)(122000001)(55016003)(52536014)(9686003)(53546011)(7696005)(6506007)(71200400001)(8936002)(76116006)(66556008)(66946007)(110136005)(966005)(316002)(66446008)(64756008)(66476007)(5660300002)(44832011)(8676002)(478600001)(86362001)(41300700001)(2906002)(33656002)(38070700009)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?d2PRrkAu07v5kdIsjBsTNFurA5ka5yHtYuvrEwq+CCtb1LWi4yK9yq830yUB?=
 =?us-ascii?Q?ibI7QcyZXzrAeoA5V2SxRl4DmikxC6Gho707XC5HMloH6KYaeryKnb1MAXRC?=
 =?us-ascii?Q?RHkz0uabQw39P96qOaLSyqsBue/bZGBLR+lMXFAdVPnAZzGLz25SLoZKWlaC?=
 =?us-ascii?Q?YwaPNBkjO69fbtse88kIeVZ+Hmk9LMQCwMLj+RjBG2hwtXSeHtIn2UEUm3dQ?=
 =?us-ascii?Q?5KnAh+XQwWbeMHY62V8uEOEBlr/8Ad9/3eZhqjp3zDmlcdfZxJb8V5FfL+il?=
 =?us-ascii?Q?hTNT3/FF93b/+mkdQrbwvvICP8x0CKHKEnwxuJDRfi94PXAE4nNp56QXz+PF?=
 =?us-ascii?Q?EC/qVq4vQH3N1kofZ856j9OAntrNzONfXG1AvcZBNQPNitBjZf87mLBoj6F6?=
 =?us-ascii?Q?C5kF27Fqn3gQODvNAd90zp+M0brq00SSgaMLikHvYuToIMHTjnj4NUw4N/9+?=
 =?us-ascii?Q?f3af+BbCVIvbz1MFYFVD6mrTw69xQXCd907Oho7BgRC3NCaIwmZL+7cB0IOj?=
 =?us-ascii?Q?M5cT6hHPWPYTYiWGo1SgCbmERB21WG3KoX4PcBrcqVCHHrXFviulwmOF9y1q?=
 =?us-ascii?Q?H7uNIbKQZiHLLOGrmiLtUjM6BnuG4O8JZw7pSFjz0AbzHMD+6CYf9M0ssDNG?=
 =?us-ascii?Q?DTv2e1IbNXu64jm2xul1jeky067pnJbXRoUFU98pGmQ74W/FkDqNJ2UTKoS0?=
 =?us-ascii?Q?7xzkhY8Cxg8DduR+8d0ug4+wkaE0NHIepaB3Cq8GnCh2jUUdL4/56B1PGUPJ?=
 =?us-ascii?Q?Ago9XIe8zT1iUwXgj0EB1uu+fycs2tiVuI3QecDBLrbQJCV5TCNXoCRkGMyX?=
 =?us-ascii?Q?b/AJrV5AgZSCLr30TO1DnnY4hd3DyjToneZERvC+uwgYnT5URlXJPMP+jKIX?=
 =?us-ascii?Q?k5rN004IH+6aEPjjixtD0xjo+C3eTWGYQij+AS9XsaPaMJTkLZFlBNZzoPqJ?=
 =?us-ascii?Q?RfptncRZ1ABnR6OF7MGQKsZFbF+87wmV3ylMm1MI4FlcliNaORD49Ih4g40a?=
 =?us-ascii?Q?nX9Yc3YCec17RPhCDRg8W1jOKJSpCKfVwOfssNimsVkf0EDwBx5hFgakPIDB?=
 =?us-ascii?Q?jTrvL7z70i0KBNRJ9cisyPZiRLcxVWaqI0z5mLD3LoVsKOEOWT+UgVQPlzcQ?=
 =?us-ascii?Q?sM9/ZShj4VlsjChWa5ZFeinPax7LvVqH+dv8JPNlWg5nOQOGhH+Pw5Y2t0uz?=
 =?us-ascii?Q?GW30Ugbx5LQ6EnG8wxiMyyrN//t+2kexfkhr/gAHzUkp8DhWkb4QXeAfwlY5?=
 =?us-ascii?Q?p00Z3LK2cokSR6usz3GqvLi3PmK+/vkSPySh3ZwcBjO+TjONvbbODfkSeNVB?=
 =?us-ascii?Q?YtaiOpk1rLd93GhfUMLwY36sJ7yS/pPX0yB4qy4A481TotyWEOWdw+/JiJqO?=
 =?us-ascii?Q?8hJn1CssE7ISOIi8+3xtjn+tYYOf7tU/6xkexJ+Pht+M0S4DAP80rymx8v62?=
 =?us-ascii?Q?JiMe8/ZsIh/7Q/z3RyhD73l1kStvxys7RJnOHCFTyse1AGdtR5EjAaljpM5T?=
 =?us-ascii?Q?SkFWYJt68NHzPW4m1kePhMwaPK8TZ2WTZ91W1JqkN7uSWihHuwRk5pfN+vuz?=
 =?us-ascii?Q?JCRThctENOKhX+8Htnc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a325b3d-ae04-4e5b-8e1c-08dbeec630d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2023 21:25:19.2727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uLKx6MKT3SB1VY32bqJU2ZvGEACoq812PCprCgFDzPVdWbGlioN4zhOn21oDc1eK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8347
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 21:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191240

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Joakim Tjernlund via lists.openembedded.org
> Sent: den 24 november 2023 15:11
> To: openembedded-core@lists.openembedded.org
> Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> Subject: [OE-core] [kirkstone][PATCH 4/4] shadow: Add PW_SUBDIR
>=20
> Add support for creating passwd files in a /etc subdir
> Set PW_SUBIR to pwdb to get passwd files in /etc/pwdb
>=20
> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---
>  .../0001-Define-SUBUID_FILE-SUBGID_FILE.patch | 92 +++++++++++++++++++
>  meta/recipes-extended/shadow/shadow.inc       | 30 +++++-
>  2 files changed, 118 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-extended/shadow/files/0001-Define-SUBUID=
_FILE-SUBGID_FILE.patch
>=20
> diff --git a/meta/recipes-extended/shadow/files/0001-Define-SUBUID_FILE-S=
UBGID_FILE.patch b/meta/recipes-extended/shadow/files/0001-Define-SUBUID_FI=
LE-SUBGID_FILE.patch
> new file mode 100644
> index 0000000000..9f85159e97
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-Define-SUBUID_FILE-SUBGID_F=
ILE.patch
> @@ -0,0 +1,92 @@
> +From f605fb315faef7ddcad70d638f3b3aa16ea98fc0 Mon Sep 17 00:00:00 2001
> +From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> +Date: Thu, 2 Nov 2023 00:27:10 +0100
> +Subject: [PATCH] Define SUBUID_FILE/SUBGID_FILE
> +
> +Upstream-Status: Backport, https://github.com/shadow-maint/shadow/commit=
/ee3a79c6952f8ca649c286c7f76639d9d1dedaad

Follow the recommended syntax:

Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/ee=
3a79c6952f8ca649c286c7f76639d9d1dedaad]

> +
> +These where hard coded, make them definable like SHADOW_FILE
> +
> +Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> +---

[cut]

> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
> index 3c1dd2f98e..bcb9b09a49 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -18,6 +18,7 @@ SRC_URI =3D "https://github.com/shadow-maint/shadow/rel=
eases/download/v${PV}/${BP}
>             file://useradd \
>             file://CVE-2023-29383.patch \
>             file://0001-Overhaul-valid_field.patch \
> +           file://0001-Define-SUBUID_FILE-SUBGID_FILE.patch \
>             "
>=20
>  SRC_URI:append:class-target =3D " \
> @@ -46,6 +47,21 @@ PAM_SRC_URI =3D "file://pam.d/chfn \
>                 file://pam.d/passwd \
>                 file://pam.d/su"
>=20
> +#Set PW_SUBDIR to pwdb to get passwd files in /etc/pwdb
> +PW_SUBDIR ?=3D ""
> +PWPRE =3D "/etc/${PW_SUBDIR}"

Use ${sysconfdir} instead of /etc.

> +CFLAGS:append =3D ' -DPASSWD_FILE=3D\\"${PWPRE}/passwd\\"'
> +CFLAGS:append =3D ' -DSHADOW_FILE=3D\\"${PWPRE}/shadow\\"'
> +CFLAGS:append =3D ' -DGROUP_FILE=3D\\"${PWPRE}/group\\"'
> +CFLAGS:append =3D ' -DSGROUP_FILE=3D\\"${PWPRE}/gshadow\\"'
> +CFLAGS:append =3D ' -DSUBUID_FILE=3D\\"${PWPRE}/subuid\\"'
> +CFLAGS:append =3D ' -DSUBGID_FILE=3D\\"${PWPRE}/subgid\\"'

Use `CFLAGS +=3D ...` instead of `CFLAGS:append =3D ...`:

CFLAGS +=3D ' \
    -DPASSWD_FILE=3D\\"${PWPRE}/passwd\\" \
    -DSHADOW_FILE=3D\\"${PWPRE}/shadow\\" \
    -DGROUP_FILE=3D\\"${PWPRE}/group\\" \
    -DSGROUP_FILE=3D\\"${PWPRE}/gshadow\\" \
    -DSUBUID_FILE=3D\\"${PWPRE}/subuid\\" \
    -DSUBGID_FILE=3D\\"${PWPRE}/subgid\\" \
'

> +
> +#shadow has it own impl. that uses whatever dir passwd files are in
> +do_configure:prepend () {
> +    sed -i -e 's/lckpwdf//' ${S}/configure.ac

Use tabs to indent shell code. However, this should really be a patch...

> +}
> +
>  inherit autotools gettext
>=20
>  export CONFIG_SHELL=3D"/bin/sh"
> @@ -157,9 +173,9 @@ do_install:append() {
>  	# usermod requires the subuid/subgid files to be in place before being
>  	# able to use the -v/-V flags otherwise it fails:
>  	# usermod: /etc/subuid does not exist, you cannot use the flags -v or -=
V
> -	install -d ${D}${sysconfdir}
> -	touch ${D}${sysconfdir}/subuid
> -	touch ${D}${sysconfdir}/subgid
> +	install -d ${D}${sysconfdir}/${PW_SUBDIR}
> +	touch ${D}${sysconfdir}/${PW_SUBDIR}/subuid
> +	touch ${D}${sysconfdir}/${PW_SUBDIR}/subgid
>  }
>=20
>  PACKAGES =3D+ "${PN}-base"
> @@ -193,12 +209,18 @@ ALTERNATIVE_LINK_NAME[su] =3D "${base_bindir}/su"
>=20
>  PACKAGE_WRITE_DEPS +=3D "shadow-native"
>  pkg_postinst:${PN}:class-target () {
> +	install -d $D${sysconfdir}/${PW_SUBDIR}
>  	if [ "x$D" !=3D "x" ]; then
>  	  rootarg=3D"--root $D"
>  	else
>  	  rootarg=3D""
>  	fi
> -
> +	if [ -n "${PW_SUBDIR}" ]; then
> +	    ln -fs ${PW_SUBDIR}/subuid $D${sysconfdir}/subuid
> +	    ln -fs ${PW_SUBDIR}/subgid $D${sysconfdir}/subgid
> +	    ln -fs ${PW_SUBDIR}/shadow $D${sysconfdir}/shadow
> +	    ln -fs ${PW_SUBDIR}/gshadow $D${sysconfdir}/gshadow

Inconsistent indentation (mix of tabs and spaces). This also applies to=20
the old code above, but with a different number of spaces...

> +	fi
>  	pwconv $rootarg || exit 1
>  	grpconv $rootarg || exit 1
>  }
> --
> 2.41.0

//Peter



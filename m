Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4636DC5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 12:39:56 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.24])
 by mx.groups.io with SMTP id smtpd.web10.58692.1749472785972563539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 05:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=c6GRiaU3;
 spf=pass (domain: axis.com, ip: 40.107.130.24, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cowxq1qlMOekDzH01PV21fDUqaWlbruUSwVWCNmWkJJdDqalAvR7mJ4TE3aaHntaJvUkd19uzuv9fMFd7YLvxR11wqgc0lJ0Mjx+Zrv1VRHTVEg3EBBKE0XTpUlFsHaAThc+SU0yLAfU1NljPEmSpe2w6AqvO0I7FWGENS9T07TtZjRgnEKVuGW78arDaM1YimoFZj1yH2dtRMDKqjhFMF+8zRmHisllkQmESx6vrj6BuQPNOUE5T+H1urOBHm/jaUY38/4uhL4MpqdTXF7fxCKIaYwYX07c3ZA5N0BDIPkkkzhfXsUESXjPnnwokfR3n+ws1aQ/rJJWAxEPvz0GgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njncISADTwG9uyuBBRdWs+H9WL7QDW8jQFIJBnPMRWU=;
 b=M4rOw3vw748cWA806OiqVUiffINjSaR2Ps1KqOlJKjyfS4nHXHEkYzGWV9Jvjdeat5VUGCwgbYK7SA/a8Od5v95Co35vDenI6jrfLXLkOMCfIC4XQEzHFY2WhKJmuCxjnINT40GNL6JnPrL23qWAVHDg9No/g+OBPCE3Z9fcAM8sjDducp87vepYpI+ZYewL2C7KQFl4rvVg4NAk02xZybqoo51e7sxRKEP9hO8uLLjXgPd/F63vsCLJuWO3OYX2+wVVVsZ6jYtQM/fvw4NWUHnF6ZkKU1b2ZhNKcRe8VtsVfRPYdfV5jumar0V3zc95WpAmwBkoF5FkQ/XPhXT4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njncISADTwG9uyuBBRdWs+H9WL7QDW8jQFIJBnPMRWU=;
 b=c6GRiaU3sqCYSigd8GcZ8A06icqCPkbe3pJ6VH8lX50iqrn56GBow3nvTZjNJflRqbqYVLGZ/nsIEoASYaND6oKW9FQcI8Cvhnlcul/25mb8WGRWodLUQpYN0hBc1g82rQN/kSHT1w3vTW4goOoxMojoOYl3ILAh+n+n/bXTb9w=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB9946.eurprd02.prod.outlook.com (2603:10a6:10:461::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Mon, 9 Jun
 2025 12:39:41 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8813.018; Mon, 9 Jun 2025
 12:39:41 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] libglvnd: migrate from meta-oe
Thread-Topic: [OE-core] [PATCH] libglvnd: migrate from meta-oe
Thread-Index: AQHb2Toc+jyYaFYE1UWORa3HVgAlBLP6wy6g
Date: Mon, 9 Jun 2025 12:39:41 +0000
Message-ID: 
 <DB5PR02MB1021325B33F6D8951F75CEA95EF6BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250609122826.2775354-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250609122826.2775354-1-dmitry.baryshkov@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB9946:EE_
x-ms-office365-filtering-correlation-id: 9c31d761-5d44-48a2-e505-08dda752b45f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?7mKz6CrOkd7di9/oSxDKW0VZQYIisdONXRJfVtYtrUl76U/Z98i09qmG9SXe?=
 =?us-ascii?Q?iX0jRx21XDinO52QeU2vTcTh9erLC6K0pH5Ecw1wFiTABgyS3r56A4OTREO8?=
 =?us-ascii?Q?91TD/yVa1ekeSPL+KMqBp0CsX5grSCoGniubVqU0pCDk2whSFeYSv0SA0xS7?=
 =?us-ascii?Q?Bu5XQBpiSTSDv5j+FurojjMtnO+HMT05PXa2C1gY0mT9lxTReodf+MsqRTS2?=
 =?us-ascii?Q?N+AUUJoLw7cJkDjjBBnomfapt0YwMiWkgZ9WnUqHybp/ZnWxF5lNUf1V25hi?=
 =?us-ascii?Q?qd4vAXPP9ZUCyb7Zaly+ixQwRYkbRzFw3Ak+/k5JcB/89zIrRfKuaYaFTKAS?=
 =?us-ascii?Q?uEyy+aeSNWbOlRmcNMhRSywX6Y+R8ulC1eZ4SCNenHw8uAPhgmsAlwSD8zU5?=
 =?us-ascii?Q?lqu4KqthN+jDAOeg26dXLvQGeChAfeIEOMtcKDDUFoEXakIoFX3NVm1RiYXj?=
 =?us-ascii?Q?nR31hkABpxFUyU6Ft0J3N85SfsmKMhSwrpOVnVS6GSd3oj9jKWTk/fpOXKR7?=
 =?us-ascii?Q?5YpXVc9jZ63F7rmJsVrl1nhk0Zrrb3UOlWH+qVRlaqq3Tl9ojf7WPj102Dhf?=
 =?us-ascii?Q?vYf5s5i2TWwzZwwMUhvsGt1WXq/YLUEWn4haeDTlDTedy6vH2MQJvrW2yK7E?=
 =?us-ascii?Q?LRmfacgtiyVefvNm2k2xTg83tDWx3yTO94AR4amgcBRAqZBQJ9sul5NJKB7N?=
 =?us-ascii?Q?uO50spPf48PTFNnHbdteVoVcfhtLKnF6geDakcNO7E/HqegB2NfRNJzlSjwQ?=
 =?us-ascii?Q?uk/on2pmyDE7Z0BPoLlmOQhUpxA08wyCBv4AA2TQd+wZ2CKUW6nuAlc+sgbe?=
 =?us-ascii?Q?GaxiHls5TCR+H9BDijufmy37JgSjOPFYTRvs9tvwz0AggIXbIt9RHwZAB1BU?=
 =?us-ascii?Q?4PRJt7TOlDI0DrQPEl7JkIe+RB9DmFIyr+/5uHmvgHCSPhyQ7cnDYgOolkFD?=
 =?us-ascii?Q?YgRsKvLBod/XFweVaXf/2eHPlthRG1xq0pNRw5Ig5a++/RNOmdOi6nvRVX22?=
 =?us-ascii?Q?4eJcQ/zES+MRCojTKVE1xkTsTPmpOkirFRipZPcIR9OAqbyEXYn8by1FiTsP?=
 =?us-ascii?Q?7lXRyQ58QGsuX9fbpkUuZRzBXouElUe/IBRplDKNSM5pAGMcGl9HNbYkTCP9?=
 =?us-ascii?Q?+UrGnOLP5Qqn3W1Gap2uAPuYTFU9HCwCTokSt0OS+63lw3CNxFydP2NpXl0E?=
 =?us-ascii?Q?bf3toWtRRGU8GMhbc5L804w7rf6dEXpLAC672qivWg028ayVLciXCcKYPr3x?=
 =?us-ascii?Q?qPg09z0DUYml0N0CN5UuGUAJZ3/d1jfXmxveZq1zZ/tK3euiEZ3+a1bxcJNt?=
 =?us-ascii?Q?T9j2NyLb+E38g4N8R/qIBvSWQkwqRYL1hfBG8aLr4dgAhst5F2D7okTOkFet?=
 =?us-ascii?Q?NzXY8lsh4qcaFOnk77imn6JKlY3QeJqxQfqqd45Rt3kgcEgVKy7vf95mn73Z?=
 =?us-ascii?Q?aEF0EgQCbb4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wLq5Eq3AsrLm/5Mce53TJ4B1WUYbXALuYNOi5Quq/9btQbmOmkyrrv/ihh+F?=
 =?us-ascii?Q?D8ZFLjZx3rTpBAyLfCMe31rHv4hvi09Y5mEamMtXhJrSx5hjjDcfyqd/Gl73?=
 =?us-ascii?Q?rmkltcETpXs5c4hHxJFeh7jbbKvoeclFCBC8xplQwuEJ0X9brwYODkP0QnQh?=
 =?us-ascii?Q?0jIajUhzR1FeojMkIDPDFW5Icq32v28+GV3ZOrceR0kMSMNuaAEqH4keOpnX?=
 =?us-ascii?Q?2kZmdoq/aoiqMdZZgvRxEa+qwbo2HwAu/DnVLaWHlFafhkML4em1lvVsET5B?=
 =?us-ascii?Q?BHdwWDlHNGZU4FmMW1LD9w8l1OWrXrIJMuGPgS51iCb7z41eYopoz19Znv9I?=
 =?us-ascii?Q?z6Ikza488x1tOwQEynSrPQNPllOucvgj26waw5tvWsWyMqYeuOD3GoeocpVJ?=
 =?us-ascii?Q?niMVIvuvbVhf2PuX6CRnXrHf9FHnmXN+WLoo1ttYbCc1+yA6awsFPqbXavAl?=
 =?us-ascii?Q?S9H/WwNDKUzBnn3irlhx5tC50kkvKzwFZh8yvP9vDNBrEIlWFy6c0vBcPY25?=
 =?us-ascii?Q?dSihyNN+zVug5ZuhyURWgjVjNzBryi0jsBGQxy0ZQuTTLcqq+Grfahg4DEyP?=
 =?us-ascii?Q?/uWaN0Cc18Gc8CaZidEpJe2/P6jK1bXlziYvV8xUbxkFA7ffptTOSsLawDiI?=
 =?us-ascii?Q?TvGAONicNc7Kv1NzhmzUzsCzytI6qrzjLGqr5apaIHZsYU3PG0dNn5QHFpl+?=
 =?us-ascii?Q?WR1K6FaXpy2Qc0M869YTZVtPcA4kd2agVFQmiEqWcuuKoYoZJUj8KMkIasCy?=
 =?us-ascii?Q?7iCHaH0RO2NuMca3vQ5LdBJEd7FJEYL/iTUGuxARkRi4IqxckxS0adt2XpUh?=
 =?us-ascii?Q?BuS5umUhMMc61ej8THcIOfqrRAlMVIn7RJZ3vaXtfQM/5ytaI1pYSuStdwUj?=
 =?us-ascii?Q?xD6pm/1HMBBVEoOaKL2hrCp9mw93KO9g6gOkfb0hPlUhJ34XoULZQgjzF7sO?=
 =?us-ascii?Q?i0ahvraV6Yzlbn9lhykLOmSUQ9/UyeZhIGhKAghJ0Bw0pzbXMRNENMeZGaUc?=
 =?us-ascii?Q?qhmVC2cVZGHj+Tn7yzvt5Uper6NOvDC0sKddmiiecJCK321QudVFoqmOtV84?=
 =?us-ascii?Q?Sw0mfRiIActKg5esL4cR3OIw+gfktGNy4u5ZdtS7rK7DpdD4B8c7CwLMEmkm?=
 =?us-ascii?Q?LJHHZiGUnoyAy9zL6KFHb9u6xLSNpiAUSkxxEiXBMemWuk6VyMjIbb0vj3R1?=
 =?us-ascii?Q?/G4FYk1m8yVJJC6Elf+8gfWshGlrxHPu2UDx/4oyEMp+Ziv7wS46JFXJj+Gf?=
 =?us-ascii?Q?Wp/RBL/hq4d5RCDbzv6kFZlqd00XMH+jqGnvi3I2xDkF0VFDFnnEY6bKPOcF?=
 =?us-ascii?Q?45XK9q7vKs7VwlrOh5NfH+IUTk7887smSrmK8eCe4EeqO/zFOepMWjdnYgro?=
 =?us-ascii?Q?amxgIj3OphALy2BHuZbbX1QjHvj9aLeyKWOOvm/F1w+35xdNL6cjdePE6w1I?=
 =?us-ascii?Q?n3QG2FmQcjb78k10BZMMAsS4+s+9zpN7FcvazPvLArszNGgXl4ovicqkzcQY?=
 =?us-ascii?Q?YOJO89ndlMVyTGf2LCzWgwX6K9jX0lUzX9TZ7iy5HPytw8yDkhM/UcnXw5Yp?=
 =?us-ascii?Q?Eo42xhc0nVEFXZsxyLs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c31d761-5d44-48a2-e505-08dda752b45f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 12:39:41.1529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Q+9HJgf3yq3FY/HlBhtF2teKpffd4zWV3AGKarDHWEC7lYgMO7M9W7XNg7sU+4q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9946
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 12:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218287

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Dmitry Baryshkov via lists.openembedded.org
> Sent: den 9 juni 2025 14:28
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] libglvnd: migrate from meta-oe
>=20
> libglvnd is a vendor-neutral approach to handling OpenGL / OpenGL ES /
> EGL / GLX libraries. It has been proposed and initially implemented by
> NVIDIA in order to simplify coinstallation of GL drivers provided by
> different vendors. Major Linux distributions (Debian, Ubuntu, Fedora,
> etc.) have already switched to libglvnd.
>=20
> Having libglvnd in OE-Core simplifies integration of this ABI into
> distro and BSP layers (e.g. it will help meta-tegra, which currently
> provides its own version of the recipe).
>=20
> Import recipe for libglvnd from the meta-oe layer (the only change was
> to add the SUMMARY data).
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../libglvnd/libglvnd_1.7.0.bb                | 40 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 6c19e306cfae..d608a9b21271 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -353,6 +353,7 @@ RECIPE_MAINTAINER:pn-libgcrypt =3D "Hongxu Jia <hongx=
u.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-libgfortran =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-libgit2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libgloss =3D "Alejandro Hernandez <alejandro@enedin=
o.org>"
> +RECIPE_MAINTAINER:pn-libglvnd =3D "Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com>"
>  RECIPE_MAINTAINER:pn-libglu =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-libgpg-error =3D "Hongxu Jia <hongxu.jia@windriver.=
com>"
>  RECIPE_MAINTAINER:pn-libgudev =3D "Ross Burton <ross.burton@arm.com>"
> diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta/reci=
pes-graphics/libglvnd/libglvnd_1.7.0.bb
> new file mode 100644
> index 000000000000..962719158f5a
> --- /dev/null
> +++ b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "the GL Vendor-Neutral Dispatch library"
> +DESCRIPTION =3D "libglvnd is a vendor-neutral dispatch layer for arbitra=
ting \
> +OpenGL API calls between multiple vendors."
> +HOMEPAGE =3D "https://gitlab.freedesktop.org/glvnd/libglvnd"
> +LICENSE =3D "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-e=
xception"
> +LIC_FILES_CHKSUM =3D "file://README.md;beginline=3D323;md5=3D7ac5f0111f6=
48b92fe5427efeb08e8c4"
> +
> +SRC_URI =3D "git://git@gitlab.freedesktop.org/glvnd/libglvnd.git;protoco=
l=3Dhttps;branch=3Dmaster"
> +
> +# v1.5.0 tag

Remove the comment since it is (hopefully) incorrect. Instead add a=20
tag=3Dv${PV} to the SRC_URI.

> +SRCREV =3D "faa23f21fc677af5792825dc30cb1ccef4bf33a6"
> +
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> +
> +inherit meson pkgconfig features_check
> +
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG ?=3D "\
> +  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '=
', d)} \
> +  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)} \
> +  "
> +
> +PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,libx11 libxext =
xorgproto"
> +PACKAGECONFIG[glx] =3D "-Dglx=3Denabled,-Dglx=3Ddisabled,libx11 libxext =
xorgproto,,libglx-icd"
> +PACKAGECONFIG[egl] =3D "-Degl=3Dtrue,-Degl=3Dfalse,,libegl-icd"

Wouldn't it make more sense for these to depend on virtual-libglx-icd and=20
virtual-libegl-icd? (See my mail from earlier today in response to "[PATCH=
=20
v3 09/11] mesa: sort out PROVIDES for the glvnd case".)

> +PACKAGECONFIG[gles1] =3D "-Dgles1=3Dtrue,-Dgles1=3Dfalse,"
> +PACKAGECONFIG[gles2] =3D "-Dgles2=3Dtrue,-Dgles2=3Dfalse,"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +PROVIDES =3D " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'glx', 'virtual/libgl', '', d)=
} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'gles1', 'virtual/libgles1', '=
', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'gles2', 'virtual/libgles2 vir=
tual/libgles3', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} =
\
> +"
> +
> +RPROVIDES:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'egl', 'libe=
gl', '', d)}"
> --
> 2.39.5

//Peter



Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD684C5DF9B
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 07:56:31 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.108])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2804.1787385380712623121
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 00:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=07Nw/tb1;
 spf=pass (domain: navimatix.de, ip: 52.101.66.108, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LymtEZEnhCmLKwCEN7pmTU37yMuc6ITZdABVaRv6TB/erqrqlbEm75o1omL9K5BjT8+vRLdZ6/PGtC3V8nJDS5LM1H1NGozFQtU+B7l8E16+sT6lnn9OGXpLEO1p8UKycWa7w9WqBlg+eWGCQ0C2pOU0SADn5jEo4GlCJS5mYGbE5c+YhtXyL1hpyFKvjBekCbchWkjbfvUYXY5qFt1aKGFVXGq0+jlqhRqWeQKlWjZxzG/kqmHAlltAWVilmKN3PJktURgY5xlEK1gPd+x1UYzrwWWNw8KJD54Vh0gPOjZ6GbHWG4kA2l8+GPEYdlnhjdnIbjoTR18UehZiVzuS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DHPtXZ8yVzX/cDud9zyhJmbKBVtpMHCaURFY7vBVac=;
 b=PyU3MEH/uIlWyJwtcYl0QOnzQ+MLDJI8mupT9ln9vxFshNfkoWeZ2RZ0KpCZiU9o2GwNJFSmj63csVR9xeW0Y7BwcC2k2yrGdevziBiSP5Xluq5nJTvQlckYA0p2+7YTQqQtz+QZva7FBML+WMSK0KDigA1RHx+E9ED4lft4LryUuxFnPVuldDuqMPZ1M16sChpg58u9VkWwnCrqE4XJDHklouwvwubVbBIXpE4qbWJjV9N2QuGEeoRBXG33hJ6FjAuo8T4yIju7eDjMclc2Re138qmcPdYbU73aD562Ct+H6u5ZcX/rUa31dmbdCgi/2d/GLpw75dMel10V1zqEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DHPtXZ8yVzX/cDud9zyhJmbKBVtpMHCaURFY7vBVac=;
 b=07Nw/tb1nKqKSbrjZ7A4/QUHG1zij4vipR1FYpGU+emecQ5GfOVvwhP8R4sNF+gZ0jVTGsZxtfcjlRO/74szD58HXDvxsSTG5fIi36Am082UqVJb78w6W0PvKoALGCNWIcTqb8kZ61Ff9lZZsHbHpvO4QYjLqEA2LDHCCH+Chmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA1PR01MB11221.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:490::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 07:56:14 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%6])
 with mapi id 15.21.0339.008; Sat, 22 Aug 2026 07:56:14 +0000
Date: Sat, 22 Aug 2026 09:56:11 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, mathieu.dubois-briand@bootlin.com, 
	rs@ti.com
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to merge
 bin+sbin
Message-ID: <aolV39x9UzHwcTrZ@navimatix.de>
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="zjfx2pwa6zvhh3qg"
Content-Disposition: inline
In-Reply-To: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA1PR01MB11221:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b653c6-684a-41fc-b133-08df0022d681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	HUVABPxNSbmxW5GElcGem8ijyCamzJZtqxe2S9lY+IoRn1jM65so2jAmpRj/ZkldLm4IrwiCYZVJiS2DV+0if7x87IJWWwlN9hMDtkGcYK3K538M4UNvqPzxVlDGQW0FknCWv4Olp/U1gEMGHl/c/BVCvYZDzpfdE1nWsmeqg5F3vhxl1jLXMb3kQSOHBG5emz7xhvjlucmrkcZQncRxDeZdPZT9dEWsiAdNZHr6v7SBTemzw/2T7jxEBfZ7/PHgglV0/F5UmiUgBN3dEWyNnhojriv5rKus9KSUCgcqipQXpA9PJE/V6vtMAtlBBZU4llJPPV38MJvMbMxLP5KBeASttPPAGWpTw5k04tHRNpjfUw04jKswBG/HGG9A2CjhpeTGO95Zm649fpr9GlbCAaLVmuRpGCtSzF+Frz4PpxGliOlJ71K4b2zOPwHOXztA2kCFvQTFQwkeE7MzQ3OPKsWlfbT1+AnbmirEBFXi372n+jjv+Zw0Jg+BTK+ZWqJn2h/3Sf7xjo39jYpvw9a83Hzu+VRZBS/tmPMYq6As3bAanbk9AZ88tF/+HS+QYc0/pTluavZZo5WUG1aqQlbG0efNnTn+HItD79X2LSOmkog=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?v4WtUL6L58vTwwnEVjfMHKOBkvACEH8Xm1O+hBePxL7fkMJqiO7mGadtva?=
 =?iso-8859-1?Q?nAYyBGdpSHPGDC7apEvY1fBYBa0+ij+EinppVatYMUZaRKuSC+wQKEVSFq?=
 =?iso-8859-1?Q?P4znBEl4dCNIvoRg/pinnhI/Fp5N+IRo59VQw1XXlSaw5aL9MBm+KqCvnv?=
 =?iso-8859-1?Q?GQcQTz9sHWF48ogEsWHGXrMtzpxjeJdHsOigVhK34xpomubmaFDdXfGT78?=
 =?iso-8859-1?Q?qeOcDKtObF/z58ymOKOqOD1r/RSmE3jADV4WyPYFOGVNn4qKrlbj3XFRBj?=
 =?iso-8859-1?Q?hylIDzE4MSW2KrYETP9ZNHBAueuQNsJO9SP51+zzeY9+ZZgwTJcU6CnJ9b?=
 =?iso-8859-1?Q?GPD+W4CXiRJR31m2eOdnsNpaPfj+Q2m/IHO1USp+Zt1AkH6QyHBoygZJnI?=
 =?iso-8859-1?Q?xMWMZhDPwZJSFWPVO0dwGLn+L8p84CDnJiEzbhjA5b7pgqEcS+ZqohQ5Tt?=
 =?iso-8859-1?Q?uwUyH0/U9CwKFJ8xFGcVFr+ke1l4ZV9KsdiMF6U38IObzq+mvqGrPi+GjQ?=
 =?iso-8859-1?Q?ey/XxgMCk4mMBk17oL07fN3UGyQAbm1vFOJDQc6HYOjVPhi6cAy/st5PLv?=
 =?iso-8859-1?Q?M3+GLHKwnZleazG1WPzX5HxwRGv+8Xkrpqrdg3iM0gwYOJvoajf8mzWnNi?=
 =?iso-8859-1?Q?uoajgddjKzauhu5oxYWiKm9ix6hbiAv+4S29AxuKna2fdaSQ5p5mVB2nVR?=
 =?iso-8859-1?Q?ZDsSMfExhN7HE685n1It1qquOHYkuDZzeovV1fX86EEe8CZ3CVWRjJaX4f?=
 =?iso-8859-1?Q?qkv8sJj7V3PxZ3DEeTgi9r6Sw9SliYeWkgPpKBgL4qp8KqqU6SWHsZUm5c?=
 =?iso-8859-1?Q?MRzYwRF52VoBHfChActlb1jrRJHK+e4aw3mu2pgVROf3b4csRu2Hm/1OTR?=
 =?iso-8859-1?Q?HJ396noCihBwHjfZy3z0iGT7iJ/cMjtaf3+q19fxq5bd/PMNPPj83e7mRO?=
 =?iso-8859-1?Q?JIkCN+evxpEDTllDVWHBJBR0HvO4yj5kldwe+sqVjww/RnatMzdPWuEDJc?=
 =?iso-8859-1?Q?9KogWTFV9nK1nvby0maqstC27GM+fPdoVUvEXU2DpoU9eDeuviLR4t5hHi?=
 =?iso-8859-1?Q?QfsNCgmQQe9nxwmn4x4HgKVQfQgWROfbieX0fBO0cMJ6Dy6Nck+g2qK3tl?=
 =?iso-8859-1?Q?P3Vh6WoN0QovVwrvl9+2hJqwj4K/FKFER1GSFFdYJN61TwE9Iny5XdRFSs?=
 =?iso-8859-1?Q?03H4xGvkKfJg5HNpVQ1pMrq1g6oCNbUwBFHt5d4nX3vnQ15CB1w5V1iD22?=
 =?iso-8859-1?Q?bPmykJtvq3dOWiAVw9eQib4r+FlohwEzg82okdKL4sz4EyENa2GzGIAcYq?=
 =?iso-8859-1?Q?oqQyNq+zCwgaA9Ax/802KjvUjFAiqXc7i5X+7IOuk3lpSo+KefzHwuZHd5?=
 =?iso-8859-1?Q?Ya1bee/Pb3dP6c5Q8yCYQSHaGvkCurd92/J6dCpdgkwnRb4LzjaR994sMx?=
 =?iso-8859-1?Q?/bHwuQxlHFTWXGqfhY8e9xN7/0U1vXfGZ2C+EC0rpHp3QgxOrmkCiNOgHB?=
 =?iso-8859-1?Q?s4TL8iEgWuedzPAaGsLjurjeZlqbAk+ZFNDOyeLZZ7ipWP2K+ZapiDFo5m?=
 =?iso-8859-1?Q?w4uzZpm7zRdudCbz2QIh8epsuyeLK9H7MuAknZBiBGOgvVXoKWt0jmkQwp?=
 =?iso-8859-1?Q?E6ksPo7Unm0fncVme3UH7f/TAgWm7033G65zh7zqXbPWtqJEVVY+OEodHC?=
 =?iso-8859-1?Q?1HjyFNQUBohnR2dZHm6xG2XYb0PShHk4gGjt7bfQKtpefWp1NIKk9QmOwl?=
 =?iso-8859-1?Q?+yNqdF9Otx5nbXRNR8bdLjFYYmYC8d1wOocf5V6WCT7ZOYXnkHQfYwpjEQ?=
 =?iso-8859-1?Q?vXPtjFCW9gTdX1Jntq3eVvrykHz0CUU=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b653c6-684a-41fc-b133-08df0022d681
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 07:56:13.9087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8lJiwpEWnRBDQWx/GFricSl4GIYx2X3Ko2ysnJ6nwnSfoKqw90gr3kmLRaTUX0+Gn8cnM+QGNHImOkRc2vOoWAa1tCg+9o0M9jj7/RT8JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR01MB11221
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 07:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243969

--zjfx2pwa6zvhh3qg
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to merge
 bin+sbin
MIME-Version: 1.0

J=F6rg Sommer schrieb am Fr 24. Jul, 11:00 (+0200):
> From: Randolph Sapp <rs@ti.com>
>=20
> The split of bin and sbin became more artificial over time, and it is no
> longer clear why programmes goes into the one or the other directory; e.g.
> forever normal users have used sendmail in /usr/sbin, and fdisk and mkfs
> learned to operate on files to create images long ago.

Gentle ping. What's the state of this?


> Because systemd drives this movement to have only /usr/bin and symlink /b=
in,
> /sbin and /usr/sbin to there, the usrmerge feature (started by systemd to=
o)
> should be extended to include the binmerge. For a system with split bin/s=
bin
> `systemctl status` reports the system as tainted for *unmerged-bin.*
>=20
> Override most sbin variables to point to their bin equivalent when
> usermerge is enabled, with the exception being base_sbindir_native and
> sbindir_native. There is no guarantee the host machine is using this
> filesystem scheme.
>=20
> This check was added to systemd back in 2024 [2].
>=20
> [1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesystem/=
-/blob/main/PKGBUILD
> [2] https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d=
1e4a6aa6d9f0d
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> ---
>=20
> I took Randolph's version and reworked it a bit. But the idea stays the s=
ame.
>=20
>  meta/classes-recipe/populate_sdk_base.bbclass | 2 ++
>  meta/conf/bitbake.conf                        | 8 ++++----
>  meta/recipes-core/systemd/systemd_261.1.bb    | 6 +++---
>  3 files changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
> index b427ff2761..c63601b1da 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -189,6 +189,8 @@ create_merged_usr_symlinks() {
>      install -d $root${base_bindir} $root${base_sbindir} $root${base_libd=
ir}
>      ln -rs $root${base_bindir} $root/bin
>      ln -rs $root${base_sbindir} $root/sbin
> +    # if base_sbindir =3D=3D base_bindir, aka binmerge
> +    test -e $root/usr/sbin || ln -rs $root${base_bindir} $root/usr/sbin
>      ln -rs $root${base_libdir} $root/${baselib}
> =20
>      if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bdf37d0da2..18aa1441e6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES'=
, 'usrmerge', '${exec_prefi
> =20
>  # Base paths
>  export base_bindir =3D "${root_prefix}/bin"
> -export base_sbindir =3D "${root_prefix}/sbin"
> +export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmer=
ge', '${base_bindir}', '${root_prefix}/sbin', d)}"
>  export base_libdir =3D "${root_prefix}/${baselib}"
>  export nonarch_base_libdir =3D "${root_prefix}/lib"
> =20
> @@ -44,7 +44,7 @@ firmwaredir =3D "${nonarch_base_libdir}/firmware"
> =20
>  # Architecture dependent paths
>  export bindir =3D "${exec_prefix}/bin"
> -export sbindir =3D "${exec_prefix}/sbin"
> +export sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', =
'${bindir}', '${exec_prefix}/sbin', d)}"
>  export libdir =3D "${exec_prefix}/${baselib}"
>  export libexecdir =3D "${exec_prefix}/libexec"
>  export includedir =3D "${exec_prefix}/include"
> @@ -66,9 +66,9 @@ bindir_cross =3D "/bin"
>  bindir_crossscripts =3D "${bindir}/crossscripts"
>  prefix_nativesdk =3D "/usr"
>  bindir_nativesdk =3D "${prefix_nativesdk}/bin"
> -sbindir_nativesdk =3D "${prefix_nativesdk}/sbin"
> +sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge=
', '${bindir_nativesdk}', '${prefix_nativesdk}/sbin', d)}"
>  base_bindir_nativesdk =3D "/bin"
> -base_sbindir_nativesdk =3D "/sbin"
> +base_sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usr=
merge', '${base_bindir_nativesdk}', '/sbin', d)}"
>  includedir_nativesdk =3D "${prefix_nativesdk}/include"
>  libdir_nativesdk =3D "${prefix_nativesdk}/lib"
>  base_libdir_nativesdk =3D "/lib"
> diff --git a/meta/recipes-core/systemd/systemd_261.1.bb b/meta/recipes-co=
re/systemd/systemd_261.1.bb
> index 0a1d4870bf..97a91ff5e2 100644
> --- a/meta/recipes-core/systemd/systemd_261.1.bb
> +++ b/meta/recipes-core/systemd/systemd_261.1.bb
> @@ -195,7 +195,6 @@ def build_epoch(d):
>  PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0"
>  PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
>  PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
> -PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Dsplit-bin=3Dtrue"
>  PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
>  PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
>  PACKAGECONFIG[valgrind] =3D "-DVALGRIND=3D1,,valgrind"
> @@ -226,6 +225,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>                    -Dtranslations=3D${@'false' if d.getVar('USE_NLS') =3D=
=3D 'no' else 'true'} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-=
Ddefault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
>                    -Ddbus=3Ddisabled \
> +                  -Dsplit-bin=3D${@'false' if '${bindir}' =3D=3D '${sbin=
dir}' else 'true'} \
>                    -Dtests=3Dfalse \
>                    -Dlibc=3D${TCLIBC} \
>                    "
> @@ -342,8 +342,8 @@ do_install() {
>  		install -m 0644 ${UNPACKDIR}/org.freedesktop.hostname1_no_polkit.conf =
${D}${datadir}/dbus-1/system.d/
>  	fi
> =20
> -	# create link for existing udev rules
> -	ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
> +	# create link for old udev rules
> +	test -e ${D}${base_sbindir}/udevadm || ln -s ${base_bindir}/udevadm ${D=
}${base_sbindir}/udevadm
> =20
>  	# install default policy for presets
>  	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
> --=20
> 2.53.0
>=20
--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--zjfx2pwa6zvhh3qg
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIaGAYJKoZIhvcNAQcCoIIaCTCCGgUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghehMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGkDCCBHigAwIBAgIRAJNhG7GFaX1Mm3w/sd+ASzYwDQYJKoZI
hvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQH
EwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTIxMDMyMjAwMDAw
MFoXDTM4MDExODIzNTk1OVowWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJHlG/qqbTcrdccuXxSl2yyXtixG
j2nZ7JYt8x1avtMdI+ZoCf9KEXMarmefdprS5+y42V8r+SZWUa92nan8F+8yCtAjPLosT0eD
7J0FaEJeBuDV6CtoSJey+vOkcTV9NJsXi39NDdvcTwVMlGK/NfovyKccZtlxX+XmWlXKq/S4
dxlFUEVOSqvbnmbBGbc3QshWpUAS+TPoOEU6xoSjAo4vJLDDQYUHSZzP3NHyJm/tMxwzZypF
N9mFZSIasbUQUglrA8YfcD2RxH2QPe1m+JD/JeDtkqKLMSmtnBJmeGOdV+z7C96O3IvLOql3
9Lrl7DiMi+YTZqdpWMOCGhrN8Z/YU5JOSX2pRefxQyFatz5AzWOJz9m/x1AL4bzniJatntQX
2l3P4JH9phDUuQOBm2ms+4SogTXrG+tobHxgPsPfybSudB1Ird1uEYbhKmo2Fq7IzrzbWPxA
k0DYjlOXwqwiOOWIMbMuoe/s4EIN6v+TVkoGpJtMAmhkj1ZQwYEF/cvbxdcV8mu1dsOj+TLO
yrVKqRt9Gdx/x2p+ley2uI39lUqcoytti/Fw5UcrAFzkuZ7U+NlYKdDL4ChibK6cYuLMvDaT
QfXv/kZilbBXSnQsR1Ipnd2ioU9CwpLOLVBSXowKoffYncX4/TaHTlf9aKFfmYMc8LXd6JLT
ZUBVypaFAgMBAAGjggEgMIIBHDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3ysgNmyzAd
BgNVHQ4EFgQUp9eVd+tKwyfNk743TCaEIRR9XZgwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMBEGA1UdIAQKMAgwBgYE
VR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwNQYIKwYBBQUHAQEEKTAnMCUGCCsG
AQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBw
pquT4ow8LyRHG6NgR4oUsFncHl+eWLMtEBwv90EpGCGGDDDjoO23j4Zw6tS+THzwgz4SyP0M
FQaMzHj40enm+z1Y29QIQCnJTeDOHWHKMRxeiFD8MBso+XgVM6z6MMDbbJ95btM/4eE3LyaB
uBbheiINaAVieIdxLq6+dVkm00kmvMdlARsTkEvr5a9nYhGAs8T5RBD1DozAv9r89WJcn+QY
X1M2l5vv0ws3Me1ziVSjC2cRhcae4seOFFjkRdJItzfk6H/Wm2FNv2XG8nE1nbgN8UCdhORO
lQGGQ9DN152RmSJ1A6KAJIldo3YrJNiO8J4JLAE5/Tl9CNUHtbdYTOZLCAZ95G1g2GELQ2DQ
1Xxo55iNojqUA4w1feORe86Dq2P08xzolHKepP1LGEw1gDGCkUYR0gVXLJExGd3dfEZDm0mm
U7vWb6vRyLso/GUawFD2MZS4kK8/igkPO2Pkjfd5HD7hknpPVhcuBaWxWj8Q7bjwVlxGwts6
sNZ+UJ5HC4c+11vVoV9cdbb93qpbWn/d+azhit6kRYdUmAUl8Bt5VRBMKCUnSaAAspxb9kFK
+cvm/MjErxN63YNEcMs2QKs3N862V8MQaoKqD+KsKnaLxF6pxRpOotenpfUTNE9GqxP9nI6i
9rSHf16VFwW4NnJ6yUgzHUMdIqtTge98VjCCBiowggQSoAMCAQICEHb3t/4teUvaYKSSf0s+
XMIwDQYJKoZIhvcNAQEMBQAwWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjAeFw0yMTAzMjIwMDAwMDBaFw0zNjAzMjEyMzU5NTlaMFgxCzAJBgNVBAYTAkdCMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxLzAtBgNVBAMTJlNlY3RpZ28gUHVibGljIEVtYWlsIFBy
b3RlY3Rpb24gQ0EgUjM2MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAk7qaEDRX
E35PMot8PAmiNaWYblItPHGyt1+H+DUs2GAYHofsdeURmjngaB0C3GcUcrVav1HsGjJuoh77
nRif3O0gxUJGnIzj4ppKxxTsMNau8qvL+FnEkK6VrnqqnKIL3myjhJRdghUlK8Lgetl/3Pdz
KQ7JO2xPZFklrLRm8EQSuUdyccvb+auvRdSnwrxsOvV+9n18ZdeahL/RBxM7R31DhVkMPO19
EiQMj4PBl99wuWzXWL7yLgYh2/TJvIpSOf7waFcHkVYvfAPivV/ulUVaN2ncpSvlE4/TjA8d
5NXKOY+C7RcyD3UZIi6XVg7T81gOfnvE/eEGsyHmgjzLFDYpgBwVOd7jLQ9jhLX4hdRbm959
FrXQQrozzfTbyxRIwMwDqgUoPxIQVU9A7qXKu3yRXsn7OvnjYkYve6X0ZifTbjZaf4Hi/KXW
fNn67zqCt0eNONM2QB5bNqg14qLooRQcgRpSNAEB4UsSyhwsJqEhXz4QwPFWn/wwvEJ0FgYD
AgMBAAGjggFsMIIBaDAfBgNVHSMEGDAWgBSn15V360rDJ82TvjdMJoQhFH1dmDAdBgNVHQ4E
FgQUHwSkfkz2MrEJ4pF84WzfUr/PLv0wDgYDVR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGA1UdIAQKMAgwBgYEVR0g
ADBPBgNVHR8ESDBGMESgQqBAhj5odHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
aWNFbWFpbFByb3RlY3Rpb25Sb290UjQ2LmNybDB/BggrBgEFBQcBAQRzMHEwSgYIKwYBBQUH
MAKGPmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY0VtYWlsUHJvdGVjdGlv
blJvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTANBgkq
hkiG9w0BAQwFAAOCAgEAWooWgE/1j6esLJfOKB48VUcFaafH6wZcbEln7ls6BP7IvAP2GDRF
33LtQhuVpt7qIqm/RXxWQLaC0yA14LE/pZZdm6CkkoWlTRgzZln6rM9dm2JvqyX2TLS0Z7P1
E6o9EmPx53bRNrnauUu2lYYfpODYq/5LzDPWBjGNK5QW4+oKCykPzzfSveoF5KTuW1xxy+da
EmtXm3hgYwYvTrB/7jHZU2hVbj/8DUAf/JCa/+AdQCtUE5XzKl6o5gGtWahY1yh9smQ3b48/
cto1QW+ZwGCHk5CLr5bDhe2uh2ifn8BXxBOf33D6YHjnrOUyNxi43QD2wZRwyL8arpu/Ljl4
H9zwIM0Q4vfbZuDghYLDnRVC1fGYBArWxw+uvoEMvO7lcc9MTezGkonPmanHYAcGffaIXpIQ
rQWtWS9Pb22jEy6YZCUiqH4YcqkelJHqJD1HBLVMOPaCn2wXgBbv9jvZQsP9yFrD6tKX//ue
D1V12I+L8qjUj17/ZRuxLcPDCF6vb/Svnu38Ejni16jHUO9G/YWFBZOuRbutUEgEp8hMXEzJ
XO43NzBthf80VV86GaC83nNy3TETFF2yav+ioLIK7Qd5NRnI4DXNQYPq6j8qkEnODayXA1bR
7V/qy4BrdrLHJf9NHMiANvCNiDn02MuniTPmb+rp4syaXK409MSG4PYwggVWMIIDvqADAgEC
AhEAsFHj29zvfVPWA2FcnDeJlzANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJHQjEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMS8wLQYDVQQDEyZTZWN0aWdvIFB1YmxpYyBFbWFpbCBQ
cm90ZWN0aW9uIENBIFIzNjAeFw0yNjA3MDIwMDAwMDBaFw0yODA3MDEyMzU5NTlaMCoxKDAm
BgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUpuQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wb
v4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AHQAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH
+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63whIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9
xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4NEMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK
6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPhvLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQd
xilvAgMBAAGjggHHMIIBwzAfBgNVHSMEGDAWgBQfBKR+TPYysQnikXzhbN9Sv88u/TAdBgNV
HQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQC
MAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGy
MQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYH
Z4EMAQUBAjBNBgNVHR8ERjBEMEKgQKA+hjxodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29QdWJsaWNFbWFpbFByb3RlY3Rpb25DQVIzNi5jcmwwfQYIKwYBBQUHAQEEcTBvMEgGCCsG
AQUFBzAChjxodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNFbWFpbFByb3Rl
Y3Rpb25DQVIzNi5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggGB
AD6hnou447615g2A0y87bR6mtVI+C+wAFCqRqfrCgHu0dB29VPiVXIVYbPN7H6meSMNr2lFo
e81aZfbE7LMQj98hVKA/ljqWKJe6R5W1Tssv1568G9GJ0fvL1iGT74LuqcuYPt0LVH99Q1rH
MfCBKpsyFo7P3JwoqEkuIpbAhaQMYdTcOgeHMYOLrIdx/9wQ1BXjTa/Cajvc3QxJEb308wgJ
PBxhl8FWWm5MNOynBmRZPKeOeMF5113u6b03KTmXhBqSVeN2nZXEZ+B+wNcJv1dr4Sa0/k6p
tbjZcr9ZkK7QtCarYgLDbsSbcLRJMuXUSHf1yaLwihZWJ1asynbFEmv1SrRSQ+3Hv4megEeY
kYmW9Jiu9qh5z6S98F7JhsP4n6tGs24Xz7l2I/T+BmJMRglTeQnzBihH0kFPUanlApSKC99A
clKs/tfOX8HKHs79Bw3PjRjJDog4D4Pbkom8UwQ/m5sCuOf7v632pjK2jm3OErS3XZxIjnFV
4Gl+5jZ1zzGCAjswggI3AgEBMG0wWDELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDEvMC0GA1UEAxMmU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBDQSBS
MzYCEQCwUePb3O99U9YDYVycN4mXMA0GCWCGSAFlAwQCAQUAoIGgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDgyMjA3NTYxMFowLwYJKoZIhvcNAQkE
MSIEIFNG38Wol3L9y/v72Yhc6yBywNAbtDR+yS25P5ZKIovLMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQCyx+DNb5WgjaMaHQt4hFGjH0rCR8RAegI9qdnTdAgVPtklarqR4wTFzzNgsIpP385PvVCX
Wab2O4hKtxUGJSNiTVbEJ/Svb0WGTUK91UZzWMdC86l2sZvrVLUQhk27rvB9/mOMz+CYbXiz
2/eArRLq8ZoOryoiR68RQTD4v7xugxfcObcrt1q9btvmSr4/GQ85GntS6aM8H0rDp35RBzwm
qYdQ311N6MgcrbeNcO0eaeZhFQ0jIA+QkztVlteOnEWLEDNeu+Y/NAU1dMwIe7IGB2p7V9t6
m9cdTJZgRtJyGwEx9KrOz6zGia31uarRJMiROwbu25YYIy7M8R34jLYq

--zjfx2pwa6zvhh3qg--


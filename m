Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33FBC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:12:06 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16163.1787577118382582066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qZpfvKg7;
 spf=pass (domain: siemens.com, ip: 52.101.65.55, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnyNvKW6O1KuUIrg9Ue4FZEK+BZ6eph5cLveD1XOhCjvOS5dRSCG2qesUhQ5V0fmIlBO2oFpY8d0DrOOKCsyU1otTNKx++FtFWYkXNdnL/nQB4qKK9TZw4oTk2THwyBShGecdf5aRiePPUDIbKQEYcHRxzfS7T9wvmCgIid1UMh1aE89J8r9iTs5ok7aQT1+ZlKXI+ECXSSt9YKEBWfRPp4sNitMvFKF7GQSjOD6z9Z9JGsVJS3JsuRH42LrPHnKuH/FWJYSrVf7etr4aqW1KZXINDIWxJFSWnElwzbPNrN+auD16sHDv5zZs1/7Ilw2oYsZhEwD/hzXrwTGCDbslg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEaL/awUJOkPs02jVrsU76ogtbPd/kWXKsTpIBr1UWk=;
 b=uq7K3OthIVOlfVy4ZoPnoj2PhH8fwW7v0MU23fqS3qvSQsBZ0KQoBhCOajKOiI4EYfbW6AfcMF8vvAYYAoRFELw88mMhlwvowGU03CZPaSLXnTq2+iaNx4pzre8WMWSIbzwAfIUUQZvk4+vNXdZN5FwxDu1ak3xOSnfSWjDXmDkxQzOPek8FT0mTNJPLY16HaQyafSJwPTwz68w0hfS10eW/6IVoC7kqtrIVG+AF1yKAc6hl0Ss4qIySCbW41xZGu6BLVSYqJSl5qPBUr/+Kh9fFkJBh/4NOJRhp4DtF48H/wr4qnDFdlUNee30HnUar72092Tx61V7JSWvqO/e+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEaL/awUJOkPs02jVrsU76ogtbPd/kWXKsTpIBr1UWk=;
 b=qZpfvKg7kmJg4nj8fQBvUZkIvI3lC95X0YM2rF6O7UlVEykuTFeLPWNZsRLQ6v9XAU0HKd4QGmVVYBTFAh8krZqyb7rrPdioe1IwaDT4EU+l+A2avSz2P7i5VOp3Fqi8B3v/SJbTaM9kSuJv/x6LYd/Ui0T/yAA7xpbPoxraC22IpGbjcIDYEm18vX7qjQd44AtkJqEF91KD18ajoQi4TAlXaFzkoQq4ObHXpAZEAmWRgYdM5E6ljouv9gUfuooODEHmkipHqROmZ4pLSMKZgsIfQZ+PcfexScP4SFCXPdYtys974XFQ/s+cVMWl20uLXHNkI/gr0GDsRAho9iH2nQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU0PR10MB7973.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:407::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 13:11:54 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 13:11:54 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"rs@ti.com" <rs@ti.com>
Subject: RE: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature usrmerge
 to merge bin+sbin
Thread-Topic: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature
 usrmerge to merge bin+sbin
Thread-Index: AQHdM8bjDhLQ0pu5WkKZw70h40FOzratKW2g
Date: Mon, 24 Aug 2026 13:11:54 +0000
Message-ID: 
 <AS8PR10MB50735EBE95086FAA8CE99FEBFDA02@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
 <5fff22004037096d27276023cf29c473c8c8ce85.1787575546.git.joerg.sommer@navimatix.de>
In-Reply-To: 
 <5fff22004037096d27276023cf29c473c8c8ce85.1787575546.git.joerg.sommer@navimatix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f7c2b852-beb1-4aaf-8850-c1ea05b8b03f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-08-24T13:00:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU0PR10MB7973:EE_
x-ms-office365-filtering-correlation-id: 9c675445-3e62-4a85-0f23-08df01e144b7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|55112099003|3023799007;
x-microsoft-antispam-message-info: 
 cnbD1vQTzkTY+53n2mNKJYHJ8pq8igb+ZOmy5oMWF7Lh/rERkCOT9P/bNwgHJL6k+kE/cF9zU54W2sHnLzc1v3XDpgvDRjNaU/SQFTyfkj4JHDhsPZ/eW4MGvNqcvzSlUYJVVR+keNpqYi9uiEmuUeVGH1Plpx0CD3RvLCphA2uqyX6KiTXD02ndoLu0Ef/dxJLS6N6oEkdZfShjeZIpGXCkPs7uH67OZvDnuYjyM6hKCl7KweYD0YCA80bQr3x6E0lUKZVSSBuXcymnX/Qs1XmjWM2Mjp/2rEXVIxjH/TMh2mVWpPiitsDYUrJwNhDQUe5EEMNyS2vtZ7Qe9EEFbh8inuUHFncLKFVgUiihfRN9e69TcTIl+9Tk9Qkb3wMjnfif9Qc5OcYQCqO+HL3oFSbq/+rnZ/ZfAelHZaFDVwNH/vtVrT3baVox4m4Rp23132W5/TgRZDHc2eeS2JasmpqTnfCcDj8H808pHQPxXb4+HOhXiyQ4qP7LNnCha5w1sJiHu6kNLPTjv1pK3t7oOUKiRBVQOvyQ+ezk5rDaXM61MEPjK2pDLbrL/OKWiDNWEh+9Z7jhH+ixORb5cFh3PsjBE/OA9zfSwekmUwzt2OEOi+5GRgaGetrKbT/T69sYGk28Qujnbe0ybmhXAfqUpn+ctDyrASqbwMp5yhI8Qlk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(55112099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?eIMByf2KLiLXJNldPIEy+WNFOkzCguYx6VaM9KPrbzoi2h0/rjzhERPK3M?=
 =?iso-8859-1?Q?kfHxFGLz6jKMgp/XBcJFHq4gZ8yVXuzDRA6ZeC68IGgxYWbzcEsHtNxUni?=
 =?iso-8859-1?Q?U02rKOR/V4hcOTxZTRAUanIxt2jM1NL72uHctY77Yg6cNBNrZuy88PNe9W?=
 =?iso-8859-1?Q?BJ69wiuNvwAD2i2eVgp76z3N3Yk00JuiRXFgoEc6joSMgRLFns9wsFCuYk?=
 =?iso-8859-1?Q?7m0TVextGVVtCU+fNJSOqodpcJ1umbN4gvrYfvwYcizEZVZ+7oisZHc/Jp?=
 =?iso-8859-1?Q?47A+TcBvmlK3W0KfTOjclnRBoPzhYUfaaxs5AFoWUH3iMZDUlfa06WYH23?=
 =?iso-8859-1?Q?COc6qQmtzsVnyIhXfkwUXgiDZ2wv+JoWve6UYCTnb8WnXWF8x+v+iOrcES?=
 =?iso-8859-1?Q?BrBXTQ2kw0D0HOACcn6zA/tg0tri1XQtoXRnzYqEAh1o7RmfAxnOGAvVBV?=
 =?iso-8859-1?Q?VJlgJhHKHMZ22W8UDTHD1/UnUdJ6zNRH3TwP6P2tKYzoQtLPBwhckIie/j?=
 =?iso-8859-1?Q?/x6Ju7XnCoIKbSgBXnNoTCN/ujFteY+qew0SZGhwbBm/yFlxiczeqAOf+x?=
 =?iso-8859-1?Q?6rD9wlpszPkQAhQuElWb0RBlndHJo5t7M16q4OX95fLXtG9szWB/3J9kqh?=
 =?iso-8859-1?Q?lDUZIxYatwPWJcMotKxwhaANYpoCu7HeqkEpEZ0NDWoIUwzvrMedPCqxKt?=
 =?iso-8859-1?Q?3uylec7RQfIN+SLunFyfZbKOTv1ZqVhA604e14paXDXd830vG0kYbp4sNv?=
 =?iso-8859-1?Q?mxx42Za3S7Dsye72RvSDOGgAl1jI0PliH9rDGBmnJIDXCmMk9muBwCIxxS?=
 =?iso-8859-1?Q?eR1JH6Cmeg7wJ5yS8IZw1+dOCoaUcqeWvMNfcMH3pJrUr2+moSG5Y4LcVH?=
 =?iso-8859-1?Q?hMXNdqWc8ENfr2kywzJT4ZWyYsdrxKVYqvcRQT2yFWtkpXOOS/qUvYrjo0?=
 =?iso-8859-1?Q?nIKRVLP74n0zHPEgqCfMtCK6i4RZz1wb+W4punSAVE0sbO29UFYYSnw7He?=
 =?iso-8859-1?Q?+fY6SlZcdzMraengKCDlmpYOwAwO7uzqs4TvVWhrSdEl3fkYtoXvRgXXKD?=
 =?iso-8859-1?Q?ilpr0QiP2Mta2LMMze1NF7o+UIrHQwsm4WdBuoq/TaVnS1cr4wNSJuV4R8?=
 =?iso-8859-1?Q?SoIgpm4/BHziqCyVlgEuRqndzXnlN7YVggj5fDzHb0UjOoHGDT6jp5QW3c?=
 =?iso-8859-1?Q?+Tk1k25a1rL0zjqIEb3/g9vc1FSRpeTUivYJ66hqE7CMI91uzjPr1GanpI?=
 =?iso-8859-1?Q?GP8z+LRwzhme0QXBK0zV+TKApeezaVpdMR4HXwjSg0FiT/RI1KGUAroCbg?=
 =?iso-8859-1?Q?9mnvoZETjPviDxy7rec/rKISu4ZTZelETqr1ce0lndWaadjjXFWBuZPOVf?=
 =?iso-8859-1?Q?t0UrOzzFE3Q1GB0T/nXfbCEWRvs3VfOCDY45ttwCu8KeLeHhhVDY6/r/iV?=
 =?iso-8859-1?Q?9+Rn1dXeMmFw5tBHRlqg2rj6WznXLg9Y2kV/wqHnAYIErYorMjITC4Sksz?=
 =?iso-8859-1?Q?/T8opGScIxppiJMxbylV0lI8xZO3RCVGCPjco1ozecDMT7Dq1LHbyNnzE1?=
 =?iso-8859-1?Q?uZ0G1bFkQpt1Nfkj2zRU9lfg6CCQ6C4+eB0C72NX/3BANb3icoRRLDtUkE?=
 =?iso-8859-1?Q?TQ3bl3+uqRSkcsl+qdEvxN9QF6JQjv4JSe/JQDNbBEjOfEVhVV/pnoXQWJ?=
 =?iso-8859-1?Q?xuaCslLmCSWfvJHZ7w++rZ/Y5Fz72uZ1SOTF6huXnsvwlaF9/PEPROpAIC?=
 =?iso-8859-1?Q?cXY+LmyXEzhWexxbtAJohAJNUS1OAoSqyjtZ5baFSQk9+6fmgkr1FM0A4s?=
 =?iso-8859-1?Q?0Tcwy+GGAA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c675445-3e62-4a85-0f23-08df01e144b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 13:11:54.1888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0G69wCGrQLNJsYovd95fYH2Xiw5BKcCu7L3mJ3x0mMxIvLZYmyJuSuduyV09VbBxNbOwPqyFHFd0CW5w1fiBxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7973
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244120

systemd recipe has:
REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
So the changes in systemd recipe can be made unconditional.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of J=F6rg Sommer via
> lists.openembedded.org
> Sent: Monday, August 24, 2026 2:48 PM
> To: openembedded-core@lists.openembedded.org; mathieu.dubois-
> briand@bootlin.com; rs@ti.com; joerg.sommer@navimatix.de
> Cc: mathieu.dubois-briand@bootlin.com; Randolph Sapp <rs@ti.com>; J=F6rg
> Sommer <joerg.sommer@navimatix.de>
> Subject: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature usrmerg=
e to
> merge bin+sbin
>=20
> From: Randolph Sapp <rs@ti.com>
>=20
> The split of bin and sbin became more artificial over time, and it is no
> longer clear why programmes goes into the one or the other directory; e.g=
.
> forever normal users have used sendmail in /usr/sbin, and fdisk and mkfs
> learned to operate on files to create images long ago.
>=20
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
-
> /blob/main/PKGBUILD
> [2]
> https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d1e
> 4a6aa6d9f0d
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> ---
> Changes in v3:
>=20
> * rebase on systemd 261.2
>=20
> Changes in v2:
>=20
> * I took Randolph's version and reworked it a bit. But the idea stays the=
 same.
>=20
> Reference to v1:
>=20
> * https://lists.openembedded.org/g/openembedded-core/message/234858
>=20
>  meta/classes-recipe/populate_sdk_base.bbclass | 2 ++
>  meta/conf/bitbake.conf                        | 8 ++++----
>  meta/recipes-core/systemd/systemd_261.2.bb    | 6 +++---
>  3 files changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-
> recipe/populate_sdk_base.bbclass
> index f32e9add01..f9367d0d17 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -188,6 +188,8 @@ create_merged_usr_symlinks() {
>      install -d $root${base_bindir} $root${base_sbindir} $root${base_libd=
ir}
>      ln -rs $root${base_bindir} $root/bin
>      ln -rs $root${base_sbindir} $root/sbin
> +    # if base_sbindir =3D=3D base_bindir, aka binmerge
> +    test -e $root/usr/sbin || ln -rs $root${base_bindir} $root/usr/sbin
>      ln -rs $root${base_libdir} $root/${baselib}
>=20
>      if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 41e98ce629..a6833f98de 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES'=
,
> 'usrmerge', '${exec_prefi
>=20
>  # Base paths
>  export base_bindir =3D "${root_prefix}/bin"
> -export base_sbindir =3D "${root_prefix}/sbin"
> +export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmer=
ge',
> '${base_bindir}', '${root_prefix}/sbin', d)}"
>  export base_libdir =3D "${root_prefix}/${baselib}"
>  export nonarch_base_libdir =3D "${root_prefix}/lib"
>=20
> @@ -44,7 +44,7 @@ firmwaredir =3D "${nonarch_base_libdir}/firmware"
>=20
>  # Architecture dependent paths
>  export bindir =3D "${exec_prefix}/bin"
> -export sbindir =3D "${exec_prefix}/sbin"
> +export sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',
> '${bindir}', '${exec_prefix}/sbin', d)}"
>  export libdir =3D "${exec_prefix}/${baselib}"
>  export libexecdir =3D "${exec_prefix}/libexec"
>  export includedir =3D "${exec_prefix}/include"
> @@ -66,9 +66,9 @@ bindir_cross =3D "/bin"
>  bindir_crossscripts =3D "${bindir}/crossscripts"
>  prefix_nativesdk =3D "/usr"
>  bindir_nativesdk =3D "${prefix_nativesdk}/bin"
> -sbindir_nativesdk =3D "${prefix_nativesdk}/sbin"
> +sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge=
',
> '${bindir_nativesdk}', '${prefix_nativesdk}/sbin', d)}"
>  base_bindir_nativesdk =3D "/bin"
> -base_sbindir_nativesdk =3D "/sbin"
> +base_sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'usrmerge', '${base_bindir_nativesdk}', '/sbin', d)}"
>  includedir_nativesdk =3D "${prefix_nativesdk}/include"
>  libdir_nativesdk =3D "${prefix_nativesdk}/lib"
>  base_libdir_nativesdk =3D "/lib"
> diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-
> core/systemd/systemd_261.2.bb
> index 8237b040a5..4475fb2514 100644
> --- a/meta/recipes-core/systemd/systemd_261.2.bb
> +++ b/meta/recipes-core/systemd/systemd_261.2.bb
> @@ -196,7 +196,6 @@ def build_epoch(d):
>  PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0"
>  PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
>  PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
> -PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Dsplit-bin=3Dtrue"
>  PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
>  PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
>  PACKAGECONFIG[valgrind] =3D "-DVALGRIND=3D1,,valgrind"
> @@ -227,6 +226,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>                    -Dtranslations=3D${@'false' if d.getVar('USE_NLS') =3D=
=3D 'no' else 'true'} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-=
Ddefault-
> mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
>                    -Ddbus=3Ddisabled \
> +                  -Dsplit-bin=3D${@'false' if '${bindir}' =3D=3D '${sbin=
dir}' else 'true'} \
>                    -Dtests=3Dfalse \
>                    -Dlibc=3D${TCLIBC} \
>                    "
> @@ -343,8 +343,8 @@ do_install() {
>  		install -m 0644
> ${UNPACKDIR}/org.freedesktop.hostname1_no_polkit.conf ${D}${datadir}/dbus=
-
> 1/system.d/
>  	fi
>=20
> -	# create link for existing udev rules
> -	ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
> +	# create link for old udev rules
> +	test -e ${D}${base_sbindir}/udevadm || ln -s ${base_bindir}/udevadm
> ${D}${base_sbindir}/udevadm
>=20
>  	# install default policy for presets
>  	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
> --
> 2.53.0



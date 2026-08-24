Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED04C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 15:32:34 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.101])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.337.1787585544427934087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 08:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=yc/1iBi2;
 spf=pass (domain: navimatix.de, ip: 52.101.84.101, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwJP8hCg8rHach7SUgP1s4ol3+ZTew4zI+rNoo4zO6Uow3q5zRACiZXDo2Ymt2fEvENJPA0C/Qzlzwfm/SIrjAonODrJCkibkvieNSXsrpXsyKujcmwr/tR0f0zCaZoJnUVFw99Gp1nYkzBcoXyPAqKZRwL7d4q9elWG1W02uVfWb/KeiUWXV4DqpXy01Q2/Jm7Db95vYwPA5Vfrrpo5vOXbUbwSakLl76y1ADHBefBzIDPealZ1OqSxVt3BecqhC+9vYMgo4Hr7LYQdy2uNkzB5kbfmWfrmJWsA7Kl9N/qJ7xPq5fjV6MlqrNj0khLwT+dQ6W2QFR2A6Jhe+JRG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAgdtiEZ9aJ7vjCOTWoL4ZmQTmSny4cyUM6ZaVoagV0=;
 b=swprT9suHwM6mRsGDner127gyps2APWsQWJ6sEXzwIMN3P7ClNV7TnN52X5PHRPMqqPubZvw7DZS4CpzKJGbD/GgN91YW+VrgfB7s5BRazC7NJU0d5jYc/JkSWCVuatQE1WW1xySCbbQYr9WWUu3D9B/MeX3RjT3ZEQUVfCSCfEHHWhqLZulxl3Torg2yzGkaiiOi5ErrEkmCD8MAA2W/pXAR7LgY8ED6G6VU/czcfMYk76FdX7W/bcHE3Yzdw68RAPyKRn9K2S6Wiok8tZsNWxxNLA4whEF2xQqRI9RoAYdqOvI3/CWrad86mEmXAb0uhn7eHjQL3owMwtS39vMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAgdtiEZ9aJ7vjCOTWoL4ZmQTmSny4cyUM6ZaVoagV0=;
 b=yc/1iBi2CQvFqO4Ky6tnkZhM3khB8Hmn7KgWKBRqTsh0kuNT3KB2KWm8xbIVrUHSjPNyqGsPfM7gyP4kxYVm5wXCQQfaQz8nL3LqiypgXddxa9T5ULPwcjoOZ78KeQ1t66mtx14sp/Zz76HmKbyiz+zVpUOxaWrzehPaGT0FyQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DBAPR01MB6997.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:191::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 15:17:39 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%6])
 with mapi id 15.21.0339.012; Mon, 24 Aug 2026 15:17:38 +0000
Date: Mon, 24 Aug 2026 17:17:36 +0200
From: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, "rs@ti.com" <rs@ti.com>
Subject: Re: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature
 usrmerge to merge bin+sbin
Message-ID: <aoxfc-dRzSygEkAb@navimatix.de>
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
 <5fff22004037096d27276023cf29c473c8c8ce85.1787575546.git.joerg.sommer@navimatix.de>
 <AS8PR10MB50735EBE95086FAA8CE99FEBFDA02@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="wdcca3unbjiwzova"
Content-Disposition: inline
In-Reply-To: <AS8PR10MB50735EBE95086FAA8CE99FEBFDA02@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
X-ClientProxiedBy: BE1P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::10) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DBAPR01MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: ce94a1fb-bd72-4bc1-1680-08df01f2d564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	vIaYyBhTqLdnitbEXxewAh+5ym3zzD3GR9c8q0vtsGfg/LLrPoOlPonyov3wWsM8PB76+1r74NI3lfLLpUS42n2YOS48paNy8+RSG2bfA8WmjUAk+95JAha87eY+zFl338I90KIJ+zOA1E2Tzwht8pWhRa8O2cvCCX1ty2DGl7fG56D1GQ6UsJ+qlz9fsJK4TDqtK7yLePgg7QOT7UA8P+e6zI1ljm5N7sQfPXgSSYKEFWF9z6HnwYH8YRbhxvWpQ1Df+T/VsSpOMxDpnCj39ePZbJv28EQ9aB1YCYFHxhcqQA7xGEiaqlFh8dgFZRtglAGOnsUhHGNYbMLbQsTqXCP0ZHXZE8mEhjXEB0Jo8SJx8mucJUDts12puJiKCn7T0Y+WsYkrNI9SgZQpy4FLRiQZrWK/GICUFumPY4CYuBtSTe7VByh/22ROXdwSeiZsGfhbX6VA7K/JbCYVYKglKVQxdx2niHuOYdwNlVUkPS0q1zAxGQ8lucjKyskta7rUeViX8PbFldflOUQK8x64VCYX7vpzvGUHdpD1SGp+fFQcA3YVayfa3kbCqt9b9eW6h248XVxIa1Ax/Pttkzh7PIjngWGwKh06WDk9CQ9mjDA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?o3gZf2Zygc+s0hL87otj0QAtYBQO4tklUOodoL/hsMna++hHhbQPy3anml?=
 =?iso-8859-1?Q?VT7L2XnANuxAoucCYDxJdOovNBvUXmzuMiKslggp6JqZdsMOl2YIta1FOG?=
 =?iso-8859-1?Q?wO9NQ+Vexfo2VXPFazxGxH++094ItDGwJjftK7OTEAoM8th/8GRyhuaeWB?=
 =?iso-8859-1?Q?Wtv/S8whNORwO6lP+I4D0fk5QoPORGL4U4poS9Er2KAiylkJZz19V3olpl?=
 =?iso-8859-1?Q?40hj+3h6Hiczu1JKl7/O6R1ELZ4YxE27vCncuVGK6G8WBI4kWdcvRTOk5c?=
 =?iso-8859-1?Q?jEo1pp14q0sNUhdSVQeXIcWXa6hzEPCh5iNdH+2+ZOlQQt3pnhO9JkLoBD?=
 =?iso-8859-1?Q?nqjK1tRfVJMcvBXJQh+UITg6pNrJnHHEmbQL495t0sLk9FAAxNsODNaeen?=
 =?iso-8859-1?Q?gqLbOPDSvunI5ldoaayuBGVcTEh/SN6VWyiiZLrCw1TVIytNRe+aSNqAC/?=
 =?iso-8859-1?Q?Yy9BhkuSr1Lh/hw62pm+GEVF/A8w4a/U/GJ+rShGvUHu/pRXeFwIlcC4bF?=
 =?iso-8859-1?Q?QbC9NCBfUEj848omQJROuxwRTTYTrwkUeSo04BLoTCAfM3SSup814zJuCp?=
 =?iso-8859-1?Q?vgyoy7R8TtrbVRvKQMF45/4khK2wYWXKgZaKtMMDaDiDBaos9J0yyhVcCU?=
 =?iso-8859-1?Q?mcfwseGpRrNOdYqhv6+30feJxZO5TxTwx8fLKsV5irCrFeZUeKJT5x6E6q?=
 =?iso-8859-1?Q?3Gq5aG/3aAzKUNAwuwzK8k9w3Yg0Lsd+UciL0ciwR4W0jux0CwPUR58KUP?=
 =?iso-8859-1?Q?5gPS7Swy1qBRKHH+gFNF2KGPHoReMAQgdJM9OsfZTvNi7ufEfA7ySjGgDs?=
 =?iso-8859-1?Q?+w0folw6EAaRD5xw653JYTLbPKqcPBnA/0ahZe88hmQhuqhz2u90qsHUM9?=
 =?iso-8859-1?Q?JBUkbsoe72DIQJU31WlzrzvH2ExC9rZ+CwrfwRBh16PtVoExV7RY3QdQYY?=
 =?iso-8859-1?Q?569DJaIgQwWpWpgHnErNGJZSN+aKBI07LXftRpaD6JK9eXXOPchYIFxvwo?=
 =?iso-8859-1?Q?VuVaWFRXhEYDGNAWeP0G5oxZ603ql+ijizTLOwpbxHT/6lWYQZ/gLEms//?=
 =?iso-8859-1?Q?E2e5XpaoTgHf/6JPFbJnAiCyeq7/Zovzx2/qX8Nxvo5Ke0zDpYoALEQst3?=
 =?iso-8859-1?Q?UyHABKcOACnRYwPvCCXqa96rS2W53ArkbK2ge1ILHM8ei8xX0vyDtOrZSR?=
 =?iso-8859-1?Q?/w+pFjpsxAbKv7Pvh91ay+pp5JnXCDsAPFsjcyiYwegqQUDBvuDS6TE42o?=
 =?iso-8859-1?Q?kczTbHn7lP+UWIhj5BQMbWZJUqFf+p11Shlv1L5YQ+d1gPL6+RWIUfDvEl?=
 =?iso-8859-1?Q?l4HKINF0UmYS7xrwrwO1gYDypF3d2LVjkLoqYmDG/El4htENhUc8x8atxP?=
 =?iso-8859-1?Q?fqwgm+jNokp1i7TsLCabEb3NCsTo/9D9ClJIhMx8kpxetunvzJQjQ2cWvC?=
 =?iso-8859-1?Q?8I6gwGJ6OOe5+Va6SfzALV0sdPTvC6sHJnx7oWWLfvEMB417XPcyiw7oZa?=
 =?iso-8859-1?Q?HoBSrj8RUMwzHx4W/+WC1h+ANw/jV0ify7UgWQ3wf/FsBFui7MjLfvVqH8?=
 =?iso-8859-1?Q?QZPvorQk3u0To3akjnsKzzYIp/sh934z/H06PTIrjX/7k385g2JqaBG74s?=
 =?iso-8859-1?Q?nDQ8jlbv3HFIW2xb/4NqbhAQTZ7CXM0oLScQwJmxPpxiv629C/3dx7aIgb?=
 =?iso-8859-1?Q?dYnSvrnUpOwD8xYmZA77MlooeBtEfCwl5tXvj/rwhOcXdjtu9exEtZOAfp?=
 =?iso-8859-1?Q?LYWqrKqc+ySxNB2t9kHYTPDts7gnNNNzJAmmMIuLcUjbO3W5T/9xS0+f6k?=
 =?iso-8859-1?Q?CdV0mYwiDOaAuX4z73qRNf6c8XWwtAY=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ce94a1fb-bd72-4bc1-1680-08df01f2d564
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 15:17:38.5756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1DoQ1sSl+R60Franr3lJe/ItXm35wcgEbfTPE7wm0wg49uwi+YkJU/4/ZZx9IdmLtzWbukBLuFBB9/zSiveu7kNDYCwCzkn3HcBNNoXgUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6997
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244134

--wdcca3unbjiwzova
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature
 usrmerge to merge bin+sbin
MIME-Version: 1.0

Marko, Peter schrieb am Mo 24. Aug, 13:11 (+0000):
> [You don't often get email from peter.marko@siemens.com. Learn why this i=
s important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> systemd recipe has:
> REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
> So the changes in systemd recipe can be made unconditional.

I can update the commit, but with the current version, if someone doesn't
like the bin-merge he can revert it and stay with usr-merge only.

But does really someone want this? Maybe somewhen systemd will require the
bin-merge, too.

Any votes for or against hard-coding bin-merge?

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of J=F6rg Sommer via
> > lists.openembedded.org
> > Sent: Monday, August 24, 2026 2:48 PM
> > To: openembedded-core@lists.openembedded.org; mathieu.dubois-
> > briand@bootlin.com; rs@ti.com; joerg.sommer@navimatix.de
> > Cc: mathieu.dubois-briand@bootlin.com; Randolph Sapp <rs@ti.com>; J=F6rg
> > Sommer <joerg.sommer@navimatix.de>
> > Subject: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature usrme=
rge to
> > merge bin+sbin
> >
> > From: Randolph Sapp <rs@ti.com>
> >
> > The split of bin and sbin became more artificial over time, and it is no
> > longer clear why programmes goes into the one or the other directory; e=
=2Eg.
> > forever normal users have used sendmail in /usr/sbin, and fdisk and mkfs
> > learned to operate on files to create images long ago.
> >
> > Because systemd drives this movement to have only /usr/bin and symlink =
/bin,
> > /sbin and /usr/sbin to there, the usrmerge feature (started by systemd =
too)
> > should be extended to include the binmerge. For a system with split bin=
/sbin
> > `systemctl status` reports the system as tainted for *unmerged-bin.*
> >
> > Override most sbin variables to point to their bin equivalent when
> > usermerge is enabled, with the exception being base_sbindir_native and
> > sbindir_native. There is no guarantee the host machine is using this
> > filesystem scheme.
> >
> > This check was added to systemd back in 2024 [2].
> >
> > [1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesyste=
m/-
> > /blob/main/PKGBUILD
> > [2]
> > https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d1e
> > 4a6aa6d9f0d
> >
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> > Changes in v3:
> >
> > * rebase on systemd 261.2
> >
> > Changes in v2:
> >
> > * I took Randolph's version and reworked it a bit. But the idea stays t=
he same.
> >
> > Reference to v1:
> >
> > * https://lists.openembedded.org/g/openembedded-core/message/234858
> >
> >  meta/classes-recipe/populate_sdk_base.bbclass | 2 ++
> >  meta/conf/bitbake.conf                        | 8 ++++----
> >  meta/recipes-core/systemd/systemd_261.2.bb    | 6 +++---
> >  3 files changed, 9 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/class=
es-
> > recipe/populate_sdk_base.bbclass
> > index f32e9add01..f9367d0d17 100644
> > --- a/meta/classes-recipe/populate_sdk_base.bbclass
> > +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> > @@ -188,6 +188,8 @@ create_merged_usr_symlinks() {
> >      install -d $root${base_bindir} $root${base_sbindir} $root${base_li=
bdir}
> >      ln -rs $root${base_bindir} $root/bin
> >      ln -rs $root${base_sbindir} $root/sbin
> > +    # if base_sbindir =3D=3D base_bindir, aka binmerge
> > +    test -e $root/usr/sbin || ln -rs $root${base_bindir} $root/usr/sbin
> >      ln -rs $root${base_libdir} $root/${baselib}
> >
> >      if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 41e98ce629..a6833f98de 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURE=
S',
> > 'usrmerge', '${exec_prefi
> >
> >  # Base paths
> >  export base_bindir =3D "${root_prefix}/bin"
> > -export base_sbindir =3D "${root_prefix}/sbin"
> > +export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrm=
erge',
> > '${base_bindir}', '${root_prefix}/sbin', d)}"
> >  export base_libdir =3D "${root_prefix}/${baselib}"
> >  export nonarch_base_libdir =3D "${root_prefix}/lib"
> >
> > @@ -44,7 +44,7 @@ firmwaredir =3D "${nonarch_base_libdir}/firmware"
> >
> >  # Architecture dependent paths
> >  export bindir =3D "${exec_prefix}/bin"
> > -export sbindir =3D "${exec_prefix}/sbin"
> > +export sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',
> > '${bindir}', '${exec_prefix}/sbin', d)}"
> >  export libdir =3D "${exec_prefix}/${baselib}"
> >  export libexecdir =3D "${exec_prefix}/libexec"
> >  export includedir =3D "${exec_prefix}/include"
> > @@ -66,9 +66,9 @@ bindir_cross =3D "/bin"
> >  bindir_crossscripts =3D "${bindir}/crossscripts"
> >  prefix_nativesdk =3D "/usr"
> >  bindir_nativesdk =3D "${prefix_nativesdk}/bin"
> > -sbindir_nativesdk =3D "${prefix_nativesdk}/sbin"
> > +sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmer=
ge',
> > '${bindir_nativesdk}', '${prefix_nativesdk}/sbin', d)}"
> >  base_bindir_nativesdk =3D "/bin"
> > -base_sbindir_nativesdk =3D "/sbin"
> > +base_sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES',
> > 'usrmerge', '${base_bindir_nativesdk}', '/sbin', d)}"
> >  includedir_nativesdk =3D "${prefix_nativesdk}/include"
> >  libdir_nativesdk =3D "${prefix_nativesdk}/lib"
> >  base_libdir_nativesdk =3D "/lib"
> > diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-
> > core/systemd/systemd_261.2.bb
> > index 8237b040a5..4475fb2514 100644
> > --- a/meta/recipes-core/systemd/systemd_261.2.bb
> > +++ b/meta/recipes-core/systemd/systemd_261.2.bb
> > @@ -196,7 +196,6 @@ def build_epoch(d):
> >  PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0"
> >  PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
> >  PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
> > -PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Dsplit-bin=3Dtrue"
> >  PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
> >  PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
> >  PACKAGECONFIG[valgrind] =3D "-DVALGRIND=3D1,,valgrind"
> > @@ -227,6 +226,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
> >                    -Dtranslations=3D${@'false' if d.getVar('USE_NLS') =
=3D=3D 'no' else 'true'} \
> >                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', =
'-Ddefault-
> > mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
> >                    -Ddbus=3Ddisabled \
> > +                  -Dsplit-bin=3D${@'false' if '${bindir}' =3D=3D '${sb=
indir}' else 'true'} \
> >                    -Dtests=3Dfalse \
> >                    -Dlibc=3D${TCLIBC} \
> >                    "
> > @@ -343,8 +343,8 @@ do_install() {
> >               install -m 0644
> > ${UNPACKDIR}/org.freedesktop.hostname1_no_polkit.conf ${D}${datadir}/db=
us-
> > 1/system.d/
> >       fi
> >
> > -     # create link for existing udev rules
> > -     ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
> > +     # create link for old udev rules
> > +     test -e ${D}${base_sbindir}/udevadm || ln -s ${base_bindir}/udeva=
dm
> > ${D}${base_sbindir}/udevadm
> >
> >       # install default policy for presets
> >       # https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
> > --
> > 2.53.0
>=20
--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--wdcca3unbjiwzova
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
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDgyNDE1MTczNVowLwYJKoZIhvcNAQkE
MSIEICiGRL6LG0MhfehX6pcFuxQphKPp5JIRm8cylqcGE+rUMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQChlQKTWQBrfPS50EzPFChcwk2cKOXrSJi6WxYvosEUThiiL7aeIFE72FY/iVUlusZD5bsE
oGqhw0n0s+lAFoa7XCRAFFEbsVxYSwk/Dp1V/ydbDGKqV7r2QkXpXdgK1NbGp7HFv6N2yUkw
K+dwlCBHKDJW81fyM0ZJ+4S4YOt52Hs7r9vrJlIRfLym+F0Rojs0X7SS3pDrrthidcTYH4l5
2/CEWdAG5lJK+Efobx9ENBIQp0Opye+uogeyQsq9A3v+bxWc+FdF8IrTPiaO0JH5PS1hqklu
sK1KHgsV5ysslRQerR2O7Gw7u9Q0waTAWsVhsxbSW2wlaNZVTpGvup5f

--wdcca3unbjiwzova--


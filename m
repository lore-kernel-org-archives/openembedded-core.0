Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F052CD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 11:27:38 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5947.1780658850331587545
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 04:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=5LzGPZc1;
 spf=pass (domain: navimatix.de, ip: 52.101.66.75, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOw21toB87fYioZh009f7JC048f549hMy1SOmjG1v/e9uzxzIM5tx6L8ieErPmK/TCzDizVamS8EZqHbltLMYH4WAjiQ7CrmscaXJK4NVVhsI39paU8zIibi4q1ZggMclGjmBjGQA8q+70GI/sgnD/9Qg/UWyxwZ13ArXjGFFNPUjis+hA/ImalILY3nOwwmLc00/1xX2CEB7+WSSbeGA9V/kibanzzd3h11zdYWzCPWQGCxj6ZDtRA/YdcLzqpfGeAsUjd05grZOgilM1MO6CcYGgvmyeKTOSO2nhohd3YAJkh0+o17GiobxsOm1Pme2sRmAUjarqJm6MAg8vnltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j66mZJuZDHp4aQEQaAzoyT4U7PWOkRjml30ld9Gz8c4=;
 b=QEcTunB+zhlmceyZpdPgSoVjKg8k2trnDvOwyNbEZqBFgFam1Z+sX84VUizSmO/qorNaPslYN+7hr1ncdMWpt7j/hdQ+OQ2Tr5wNhRXb9DbbllNHkDVtSJDcE7ntBGKtittCdCW4lGVUoycV/J93NyFYwJe5WlLwn4qtw0eGBRr67G+hjoRxhHXUilatlYisipJ+S1r7Z9gNvqmmw7Iead/xH2yS4fixRXcHftrtYxzuDMBdUNeFaq7VW/q1bJMJgDELNWF7A4nx+8G/Yc8UyWF4Uzvi/E3zg9iYgK+RV8a+RqUqeKnfsc5KhCX3F/AR7oNqi9cvWFfSJbJYiBX1Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j66mZJuZDHp4aQEQaAzoyT4U7PWOkRjml30ld9Gz8c4=;
 b=5LzGPZc1quH+N84ZyeK18sasJQ+ouhdO6ZVRKaE1c/TvwUeylzMmTrJ7K5o6kB6qRBO3f14px6IR1wNxikvJ3nMDIrqvbekto4Y3rSEGz5lFM98V/f+5ZkeoXsnz3LUGbp+ukZWHLpPZ9pzjqEZVx8tHQBw8w7ML7MDONSA9DCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU4PR01MB10809.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:584::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 11:27:26 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0092.007; Fri, 5 Jun 2026 11:27:25 +0000
Date: Fri, 5 Jun 2026 13:27:22 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: richard.purdie@linuxfoundation.org, rs@ti.com
Cc: ross.burton@arm.com, mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
Message-ID: <aiKiIgla771PZzHl@navimatix.de>
References: <20260408195024.1874335-2-rs@ti.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="zhavfzosrn3ct3jc"
Content-Disposition: inline
In-Reply-To: <20260408195024.1874335-2-rs@ti.com>
X-ClientProxiedBy: BE1P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::16) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU4PR01MB10809:EE_
X-MS-Office365-Filtering-Correlation-Id: 671aefca-4d5d-41aa-acbb-08dec2f56ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	A/WbgcPwsbSrmQqBGNETQWV23UNlMQw0SHtmxuSE75yzoNVvW4h8LK6pt7U18gefvLrGcfeN6S+6UTeWTFNEqzktUk0aknY8euT5o7GoIhmUQAc590bf55uRYAtJatwR6YN4Avbx1Pe/Bt2+0yaMd9ggZDre1ve/aD2ArNYtADjQL7FCBJONoc7lqW018I2izCi2N9cN4zpC4WgD/CHrYpBHhryKQ2WNM8XRaEseYAHedxJVTAymXekv1/LpZz499oaLaddsy7B3FD7oPtYlwJt6iG0c91Rx5VHu+bxLNUwbYV3IeJFX327yYi+zItz3OeOsO+DM2Y7xw+5pVWBdXfBLHRxe06WHQ2qUSRus5VOsBRhIT26hDpn5Qm0W+iuhvaPolBiylHdsOnzuBNiueXV1RYV5Av+5VGgJajWzuYYB8rgYkCxdFv03by+UkzYcw6SaXbYBN5W0cdKLgesK2aX/zUfkiJC/71aDHUYYqPMj+7eoHv0mxo92dIjkEwc9xEx8v8h4wdZr598M5W2BVMppgcQKJgWGR6XH8Aqh29ri4IPE+eKOfvds3Wr2d+EmRYG44EO7dV0XzXiLbU8vw8jncHi15NTOlA3aDQMCYmY9Rp8diKcDjK+gIzEs0Kmd8+0xT6PDHoaRLi7cr0RZCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?tlMgYpYwMZ9LypeAts6F+NIVFIlXGhyDe4ErxLdMhfiTPpDM7A62QKRjAm?=
 =?iso-8859-1?Q?mwN/k8P1eq0I/vagdvhNuqq2qMHkPHZBdwyUy9XufnnWX5/kyQTbczjneP?=
 =?iso-8859-1?Q?hdfUwLhlAoGdttJmgxo4eSwAy0QdqTonc+x+EF+zEj+ensPX0bun2Yyrjf?=
 =?iso-8859-1?Q?O8pUY4s6BQuxLd6nKVJQQCZoJac332nO/4bmEc6ZsHAgRAjOPsnEiORqoN?=
 =?iso-8859-1?Q?Sl9TnFipFZY7i1jw4nW+hCcO5J8FE31XCAiaO47IWpKD4Y26se7bDcbsBo?=
 =?iso-8859-1?Q?ehqBQ+7os1qqI6AITDYy/4LwouDOOTEPCVVld58qe13DG+Zgbd84vBCv9X?=
 =?iso-8859-1?Q?kloOq503lYoTwnYngw9ZVBod4+zlEocQljgyrR6Wxmdbk+3RvuQAzzEzwN?=
 =?iso-8859-1?Q?BVFF/SB0ua3m9uI9RCdEI4IrB6zDgO2pBn8aW+p6sYML/Pwt6fIV4gDxs5?=
 =?iso-8859-1?Q?FTHkSmZ9VcddI/ID2WwZ5/d9JOvdJhiIGJ1AsC1nftaMmxM/tNubRpe29/?=
 =?iso-8859-1?Q?fN+kyKNNJGn/U98uo7jKZZpQIh7DAG0MPtZ259i1AU9uG6cv8G0ZOpbH67?=
 =?iso-8859-1?Q?NEA1TwYYKn3NqC4+L+equO2v3LL9Qhy9Vwi2/Agmuk/9bpI2zyxpgg1NR/?=
 =?iso-8859-1?Q?b4NDMQ8t6R/k5nlhbvV+i8h0WGggDw+ZzIMzr3hD6KYJq6VvsQlLUtUsTG?=
 =?iso-8859-1?Q?sM24X+ybvTownnI3UIXPRznNKG6/4dlMwIdbhCTRmOj2f8u1LWSZVY9bgc?=
 =?iso-8859-1?Q?JmApn/wxPD7vJWwuik925eank+UTNsyP+Tp5qxW7DEWR+Cr8M20CZQMvNV?=
 =?iso-8859-1?Q?niRWlKKAE9GiCIhkv9CgXW3H7ZMfa4rJCz7Z+gdSmrlCENbb1qIjK05eiE?=
 =?iso-8859-1?Q?j9D48I4ohmx1VBgJ+aLjbOo3vIN7NrXz5ZZWZV3L1MfcN3hD4iY4t/usz2?=
 =?iso-8859-1?Q?TYPbXzn/W2QNr6LC6Lkc1xowg15WXBj7TZozVk3OQn/Kdy6M/2qAXZYwFW?=
 =?iso-8859-1?Q?4/dG3fsoVf4w1li6bdWaLJScTLl001nSSOsPcXk5Q7fxPgme2ruM38cE05?=
 =?iso-8859-1?Q?5RZgr9a/+7wy6Wk+hQWiZsiSHX67JTPTOBCx6fgARhiwB4hjNl6h+wJ/x8?=
 =?iso-8859-1?Q?+120jm2++rDYu0XQTLlnZ6X0KnMfLc8PkXw7P96j3AGUg5cxQiX3pUVMl9?=
 =?iso-8859-1?Q?nGbDL59WR5tulXhHSkXByPMaGV6lNz7u9olQiseVxwZIWNtdjc77CZJM3n?=
 =?iso-8859-1?Q?BRYz5JPWA/p0M7jjBlzFifeuMX01+LsIdpMCL+OoVFgtYLEmJrOD3wTmOe?=
 =?iso-8859-1?Q?47ZJ+upEn5CVuvvQ0WbaDJ17idKQ6+S/hcf3h8R30ytuRIo2hgZAqAfd2i?=
 =?iso-8859-1?Q?o1CAiapDLnpzUjI6bMbtF7meJmH/trQg2o+J00VBimNZWstm7pMty0VcyJ?=
 =?iso-8859-1?Q?GrlLbplAGdkx9iV/AYtHjDNskbsl8PpT/ttK3kmxAILn+qKbwvdH2tGWOS?=
 =?iso-8859-1?Q?yk97TUjLhVnwJF/Owgc+eqowU4JY7EOsMes6DmhG7GEVwxDbn8NOy7IF25?=
 =?iso-8859-1?Q?C0UDu1CVhT+bPsGN02A54UDc9J41niQhlfsBfyYY/myGMUCOhzvwRmUdOF?=
 =?iso-8859-1?Q?gvbcYkHnTUeUt5ojEyYErxfhI9JYlh5+0sEWXTYsyDvOvOY7toluK/cKoJ?=
 =?iso-8859-1?Q?J4MdPtLYYBvKapzI4R/u/NMqqGvJfT7idfWrPQ8W6gMsewT562zthd3/s2?=
 =?iso-8859-1?Q?KTdCu6UiyMdQ0EabUsIHzef5AAVjOYzDKy9CSe5dXovF/Mc5WXQHchD3r4?=
 =?iso-8859-1?Q?91ZqtKYwi9/4RL2sX2YjkTa+AaYsb5c=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 671aefca-4d5d-41aa-acbb-08dec2f56ad3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 11:27:25.0427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGX6iMzqtzyurcbWrotgr/ID0LmJ90jB13KGR2mvDw1reQAu5kVmhPbIEFHa6efcxMdAx0yUK9cmt0yeHK6j86X919z888DMZwYNArxDwWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR01MB10809
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 11:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238162

--zhavfzosrn3ct3jc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
MIME-Version: 1.0

Randolph Sapp via lists.openembedded.org schrieb am Mi 08. Apr, 14:50 (-050=
0):
> From: Randolph Sapp <rs@ti.com>
>=20
> Systemd prefers both /bin and /sbin to link to /usr/bin. If this is not
> the case it reports that the system is tainted in systemctl status.
>=20
> Add a link from /usr/sbin to /usr/bin to prevent anything from being
> excluded from the merged bin directory. This mimics the current merged
> bin directory structure of Arch Linux [1].
>=20
> Update the systemd recipe to prevent creating a duplicate link when
> sbinmerge is enabled.
>=20
> This check was added to systemd back in 2024 [2].
>=20
> [1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesystem/=
-/blob/main/PKGBUILD
> [2] https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d=
1e4a6aa6d9f0d
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>

How about including this commit in a updated form, now?

I'm using it since April, I found and fixed some issues, but in the end it
works (with binmerge enabled). So I would give my

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>

About the question if binmerge/usrmerge should be part of the systemd
feature or be a stand-alone feature, I'm undecided. But I think bin+usrmerge
have their use case without systemd.

> ---
>=20
> I feel like this is overloading the "usrmerge" distro feature somewhat. O=
n the
> other hand, this parameter was added for systemd support, and systemd con=
siders
> all of this to result in an unmerged-bin warning. I figure it's kind of f=
ine.
>=20
> Open to opinions here, as we could also just add a "sbinmerge" distro fea=
ture.
> Then again, what would be the expected behavior when usrmerge is disabled=
? Would
> /usr/sbin just point to /usr/bin and /sbin to /bin then?
>=20
>  meta/classes-recipe/populate_sdk_base.bbclass | 5 +++--
>  meta/conf/bitbake.conf                        | 2 +-
>  meta/recipes-core/systemd/systemd_259.5.bb    | 8 ++++++--
>  3 files changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
> index b427ff2761..15f393a3bb 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -186,9 +186,10 @@ POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-=
sdk =3D " write_host_sdk_manif
>  # Prepare the root links to point to the /usr counterparts.
>  create_merged_usr_symlinks() {
>      root=3D"$1"
> -    install -d $root${base_bindir} $root${base_sbindir} $root${base_libd=
ir}
> +    install -d $root${base_bindir} $root${base_libdir}

Is this right in case of !binmerge? Install is not picky about creating the
same directory two times:

% install -d /tmp/foo /tmp/foo; echo $?
0

>      ln -rs $root${base_bindir} $root/bin
> -    ln -rs $root${base_sbindir} $root/sbin
> +    ln -rs $root${base_bindir} $root/sbin

In case of binmerge both lines are equivalent. But in case of !binmerge,
this should be wrong.

> +    ln -rs $root${base_bindir} $root/usr/sbin

This also.

>      ln -rs $root${base_libdir} $root/${baselib}
> =20
>      if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 84450386d9..29301534d2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES'=
, 'usrmerge', '${exec_prefi
> =20
>  # Base paths
>  export base_bindir =3D "${root_prefix}/bin"
> -export base_sbindir =3D "${root_prefix}/sbin"
> +export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmer=
ge', '${root_prefix}/bin', '${root_prefix}/sbin', d)}"
>  export base_libdir =3D "${root_prefix}/${baselib}"
>  export nonarch_base_libdir =3D "${root_prefix}/lib"
> =20
> diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-co=
re/systemd/systemd_259.5.bb
> index c3cb605b4d..d84e38d7cd 100644
> --- a/meta/recipes-core/systemd/systemd_259.5.bb
> +++ b/meta/recipes-core/systemd/systemd_259.5.bb
> @@ -69,6 +69,7 @@ PACKAGECONFIG ??=3D " \
>      quotacheck \
>      randomseed \
>      resolved \
> +    sbinmerge \

I think upstream names it binmerge after the target, as with usrmerge.

>      serial-getty-generator \
>      set-time-epoch \
>      sysusers \
> @@ -339,8 +340,11 @@ do_install() {
>  		install -m 0644 ${UNPACKDIR}/org.freedesktop.hostname1_no_polkit.conf =
${D}${datadir}/dbus-1/system.d/
>  	fi
> =20
> -	# create link for existing udev rules
> -	ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
> +	# create link for existing udev rules if sbinmerge is not enabled
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'sbinmerge', 'false', 'true', =
d)}
> +	then
> +		ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
> +	fi
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

--zhavfzosrn3ct3jc
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
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
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNjA1MTEyNzIyWjAvBgkqhkiG9w0BCQQxIgQgdSMO3wTr
MwYnObeEg7c5wIevWDYQruEX3Hi1lyR92GowNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAIHmcqtvGFj3
QJBxLtiSo4Ncd0mJ0tM+1odUzdNCMPYn9x1EaMTkoSyR7G4NrJT4hxstXBoj8+PiTddok+6g
YraQVNKe/2dmMJK0mX48eYnHYk2RUYcpgAOr1xQTPbNDTLVXxDtRZdUfGSvOSktoYHFRjUm0
yVTxtsmredPlXLZkOzn0aHmefTSHUxv0f5zn8cFr9LGtx58Fub9Mv7ytFabYLxqPsQfk4+Q1
m6U/1qSiVKzP4amOPKko9H+rExka+1NecWwT1w3W/vksGvL0PgWL7TxxAz9hgnUO3WwU8YjZ
fN5entjc3XAbhchTFXKIzoB3WtDvVvNL40cbinCo0OA=

--zhavfzosrn3ct3jc--


Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0B3C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:42:14 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.52])
 by mx.groups.io with SMTP id smtpd.web10.94.1715794927966288311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=R9thqM7p;
 spf=pass (domain: axis.com, ip: 40.107.247.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ey0WgT9oNedLlHJw0NegZXgfsfRm2rxyjvfaVL49OPFuCSvaab6IEQB0FFIlB1ESSthk5WPpRx7vCRM70idMMBO1++w+V0PKy7dPbRSNnovHgcYNYeBQou0LjI50ME9j86Jwvi9lP4C9PQvfRHyp0C0b06EUKApHAPz+NwUWVmqv75tjkTyc2IN6P9ck8KAE67C2n+BOkMo8sE5dHRCH+4Dw2qUGXpn/qyCB/fae+Dt0JM5bJEUrndQv7+X0EdpvB6aiLc2ErJgRtSFG0/4SAZ2/NthmnI9UNtCcHD0gR83WNX/7hk7if/ZeuZ4tvADeh0ZmopImx+WvasfTMfA+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVrpOHVgKHVgHmSROkVV3dChcbX12adov/EfETPHzJ0=;
 b=Iv/T+ztX9cia0lmZmQNBH0UcTtHbn4x+H5VEYSLdpb2LDolpxP9UFGILNy19BSPrBj7rVMQMc/3dXohhSNJ7jzAFlgx1hr5OlKE5Qi/3QofKtor4ZYfkEEUUs5nV4z8sMBbDoduFgEoObltbBTWBAtHlI7ElcQyZZckbjJULEUHW1r2JESkuOxKVCPwgvPuKe2uMqeSEjrYR+L75rcufNQmRGZi3ErwW0NO2G1/g0dZI5OUv9pECTist/sw98am7vLZrGbACY0SjtnuU/cB3VNCihfurVL6k8gVfHMqL9NfWuieyr2z+KzXE1KSqMsuoGQQ3tNyL/00/oPhnWUAFjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVrpOHVgKHVgHmSROkVV3dChcbX12adov/EfETPHzJ0=;
 b=R9thqM7pMt3QPVbd4dcs+eVT1KthLf3zJrV27afzuB4jZUOfDJ/hHTpw6YLWPs+fALIZZ/T+gJvInZHxWGaHbpv6C3k4EIVKwkUYLdR0uAbfUdX9aVgzJOTLM8lokFRkPJc2P0CqLrXglqgLtDAMQ6HvvSv9El+LXy1XsEyWrA4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB4PR02MB8535.eurprd02.prod.outlook.com (2603:10a6:10:389::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Wed, 15 May
 2024 17:42:04 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996%3]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 17:42:02 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 05/10] base: Switch UNPACKDIR to a subdir of
 WORKDIR
Thread-Topic: [OE-core] [PATCH 05/10] base: Switch UNPACKDIR to a subdir of
 WORKDIR
Thread-Index: AQHapr7/rIDlw8w8v0WcXcIb8vZp7rGYc8Zw
Date: Wed, 15 May 2024 17:42:02 +0000
Message-ID: 
 <DB5PR02MB10213711E57BF5F07C4259761EFEC2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
 <20240515115620.420558-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240515115620.420558-5-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB4PR02MB8535:EE_
x-ms-office365-filtering-correlation-id: b0d76bdd-4488-47c5-bd95-08dc75065418
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?mdcRy1Js0e/ElSNWELV89VBiE90eLJeBwfSlxtjkgkQrrcOl+5N0RW7iXDQf?=
 =?us-ascii?Q?1CsFRgE+uGMn8y5FNxTUKQPVK/bvSFiEbCET3APLSji8nIUSzVFYWnoFHzZZ?=
 =?us-ascii?Q?aWKWkfgGakGTa0PI/TGqyh1fmHADMUw//5smPH0l1C5ex6tB0x/43A0r4cVw?=
 =?us-ascii?Q?ve/4k1GwZdAK/86u8MN5ToHMC45NAbvTcgXpLz/dxCDoZd52fat3zacrm84F?=
 =?us-ascii?Q?DA51FvMuvAZwEBheRNYVv1KttWUY98lh1rOYAsvM2NpxQzMr7+9Ze0S51Mvt?=
 =?us-ascii?Q?cHAfNqgDDxf2jtc4aEcjfuM+4Tq4nGVimnv+Ue/japwSfTg5TVBbvqxFpqKt?=
 =?us-ascii?Q?SvhmOMrnHp1AekwMQoD+1e8RrhxPqcyjX4Ug+CbKLNYrXyTqMGTJZ6IebDPK?=
 =?us-ascii?Q?ycSY6HJdU07ksVH/j7O7VdCEWxqyIiZHOhsD/ZwoydQ1Pn4P3hTckaqxWWtD?=
 =?us-ascii?Q?IpZ5qQMcwdxPltPaE9nEvlO4c95cjE0q1h4P+jNmpqJKVH2PL9pH5qvrwadA?=
 =?us-ascii?Q?/3PqTCV6jnf5/c2uth/zsWtuDxAbwozNJOZmCjRTgUr01MSredsoueowM43R?=
 =?us-ascii?Q?n7E+tJry7gYuJ0lmcR6V72PeZj8ZodSl75RVyTWziv4klyfEOscXzzTLCAPW?=
 =?us-ascii?Q?9BJPgH9HSqXhIx1GAXm83FU4clPEMrxfSaH/nyuwbML8vpD0mBnUL4FlQNpE?=
 =?us-ascii?Q?/U4ALZZROMnbzGzZR3pJlyT669RI+0MWnr0TiBPDco4hM5p5DaGEy+wqFBG+?=
 =?us-ascii?Q?Z/t7+4VIcz9FkJTCNpbdfeLbIiER9HqDzwrnwF4WgwLQp+hShsbfAU+q9+2K?=
 =?us-ascii?Q?5M3WsBG6+zcCsv8v5iDl9cirASNk1MHAm0mUfIOhpDvST/ZiUj0ECems1fan?=
 =?us-ascii?Q?Fi/v2XUirmYIN9S8PPRpCpFP2bUuO3lpv3W8v1a7FauGzNi85IZgSapnLG7N?=
 =?us-ascii?Q?KHksPr/+586cqS/b0BpAtU+Bc7oVbPxqOGuQhiXa26JHNFczncqjTpZV/o4i?=
 =?us-ascii?Q?58x6od9L42/IBZNHTBQyyf+mbxgTA3S5OF15r/Jqo7jbBb/FGyKZl+3W2JWS?=
 =?us-ascii?Q?zSUsBlrloFFn2JDzyQLP9wW8U9ZY+JTALJGddfQt79XJr5Sg+NPZMMzSctM1?=
 =?us-ascii?Q?sRuvrPuK1a9klEKTuHmHaC63NVCFRmBFkxwV1eFwdQ+pljDVWxl46fbimUL2?=
 =?us-ascii?Q?2LE9MOokw73MXtDdbTltWglRw6XHScjTSKXQizaYfxEjR7aAFiXeFbTHx4Xt?=
 =?us-ascii?Q?Jb5GxtDOpBzzrOEn7ghJuEScgMFecBQWgONK7tl9mmDEQQVPPoXnZ6HBxV6/?=
 =?us-ascii?Q?NF+gcUWiJnuuWYFIz1AzpEPdZYYx+AKZFJdLz5A48hJ/AA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1BB57SPOCA71o7t8or+yQ2jNEzqtNigXWxaZd7LxfLU9iKDiJFA5coNrvpef?=
 =?us-ascii?Q?5vMFEKqctZ9Xfexny/D94AXE8uQSqVVlyYSaXjFo7T8HpKdW0uBD2wMsecEq?=
 =?us-ascii?Q?qK2i5PgrBwtfAhWfd5r1z5FYH18nDwDGxN2O+qnautnLlPdXnzPhUn1SZdq9?=
 =?us-ascii?Q?UnboqN/ZSlHzynjh5Xg22D+AFN1PfsD3wl8z71sGc4+6cx96WaQevdl4v2Kd?=
 =?us-ascii?Q?6LfohPwJ24IdFLWmh6Vd0KVYAmCcuhYOpEbtX9fUso+YOh341gcM8VlHY7A5?=
 =?us-ascii?Q?lMoKZBlPnIVjl+z1WP+WJWmjvD7xszafK2XWaVqVU4ZecW/UTJWbcW6aweEH?=
 =?us-ascii?Q?z2QSM6T10pWG/PUSstM2GlGi3yUGu79P4+/mVvHDC2LAawSxiGmB4ZOR/1tz?=
 =?us-ascii?Q?1GV9FzNoKqFzuPD8JtWvw6toU9TkId+g83l/QSbv0w+q7tUNcuYCcRGP4kdN?=
 =?us-ascii?Q?abBNY3TW2415tDXHyyjWh6QMO1ITZdOhna4gNnaxI9kJ6oWTJXIB/+bYIkmx?=
 =?us-ascii?Q?Zo15O1h+1sELhljHc0IcddR+sYppP6w20J3MF679SygED0iqs3GQ+A+MYhu2?=
 =?us-ascii?Q?TSGb/05xZ5gsJI5k+/67ztKbHa5/Qwr/CHk+euaMAjpGj8hMaKinLDEV3cyD?=
 =?us-ascii?Q?X6d1oHa5O7N49VP7V0UAcOr7AxxW0RtbyYgKRVBnvYgCZxtroYxW4cUI2yJ8?=
 =?us-ascii?Q?F5G8P5E1mxCAbHNq35xfD27+dfs9NkwSFQWsOM4xpdqRZh0+02w02fgJ58gN?=
 =?us-ascii?Q?56co9KsSA4qPoWMEnlKC9GfV25EBcn7FQ5hEfwLN4NBsF2vdxQ9IP0xcLnVd?=
 =?us-ascii?Q?xAMOT5pnMDQp5yzNAJbaCl3T5qbvu+vp71mCUWhYxoJnKXrmpZMHPhvQkqOg?=
 =?us-ascii?Q?skSbSndntDJWkoYBuZbP91/8UXz1lIS4BUcOrcEj3AAItpxXZAJfnrzVqFYO?=
 =?us-ascii?Q?yjKXuXE2jqgquOMTfvSh0f0/8D6nUhxU59+BPOnb1WadbjJ4VCO/4y7L1ldW?=
 =?us-ascii?Q?dDsHYwhaszSeLTQtmsVv9lfG8ChlObMghLe83V+41N1NmWYo0VPMvtpe272F?=
 =?us-ascii?Q?RjgFzQrfMFI+lAQeGLyVVq47IAo8CURjDcgJxuQqneuOiCojQEAKM5WxtHim?=
 =?us-ascii?Q?cUBSq8DllSvFJAQDRET/VHnsbdEBiGZJYHT7L1DeFNwUW6frMD4eBGpOyQSw?=
 =?us-ascii?Q?mvSWNNpM5EVzaj0VIRnMd+z5HAakqdNZlnutqhngvDMU77+AMqgn7EKjzm5o?=
 =?us-ascii?Q?r0D4JqHmsUh+kti42M22+MXMQKAiNmbiCvOp6XwrRZsJZmfHxMwlpvBRpv+h?=
 =?us-ascii?Q?TB9YJjbX4Lmo/36lOdnrLcGriGVZNR2uSufP3MIoMP72xACOCYhW9WIxkQ5z?=
 =?us-ascii?Q?F9y9bfHPtQtYBQ1Daz2LmKdwK4cObI5aYFl9W6QIcsgUdKtoqKXWIhi2Z7t9?=
 =?us-ascii?Q?8MQsIcdby9p6esjBDVtypvh8Fm6Zk8y0zaHu8E/TaKpXXAkrcbrSTgXmtl2Z?=
 =?us-ascii?Q?N0p+CVLiPUZEwYZOaXJH84xD1CPoXbm+6GONKnUZWMTGy9MPJVpQh/jBYhxm?=
 =?us-ascii?Q?UR2CSvZ0e3k3xLxokOs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d76bdd-4488-47c5-bd95-08dc75065418
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 17:42:02.0425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HW4I5d03AcKMZY9kjt1kwTJF5c04FqyW7Cc2cwAMB8B9tw2USybzsqDsUvqsA1GU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199422

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 15 maj 2024 13:56
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 05/10] base: Switch UNPACKDIR to a subdir of WO=
RKDIR
>=20
> Change do_unpack to unpack files to a subdirectory of WORKDIR instead of =
WORKDIR
> itself. There are several good reasons for this but it is mainly about be=
ing able
> to isolate the output of the unpack task and tell the files apart from ot=
her things
> which are created in workdir (logs, sysroots, temp dirs and more).
>=20
> This means that when the do_unpack task reruns, we can clean UNPACKDIR an=
d know
> we have a standard point to start builds from.
>=20
> It also makes code in tools like devtool and recipetool easier.
>=20
> To reduce the impact to users, if a subdirectory under UNPACKDIR matches
> the first subdirectory under WORKDIR of S, that directory is moved into p=
osition
> inside WORKDIR. This preserves the behaviour of S =3D "${WORKDIR}/git",
> S =3D "${WORKDIR}/${BPN}" and other commonly used source directory setups=
.
>=20
> The directory is moved since sadly many autotools based projects can't co=
pe with
> symlinks in their paths.

Would it be an option to create a symbolic link by default, and instead=20
let the autotools bbclass replace it with a moved directory? If it is=20
in fact only autotools based projects that have this problem.

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/base.bbclass | 21 ++++++++++++++++++---
>  meta/conf/bitbake.conf           |  2 +-
>  2 files changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-
> global/base.bbclass
> index 066f3848f7c..cdce0538273 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -153,20 +153,35 @@ python base_do_fetch() {
>  }
>=20
>  addtask unpack after do_fetch
> -do_unpack[dirs] =3D "${UNPACKDIR}"
> -
> -do_unpack[cleandirs] =3D "${@d.getVar('S') if os.path.normpath(d.getVar(=
'S')) !=3D os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}', =
'patches')}"
> +do_unpack[cleandirs] =3D "${UNPACKDIR}"
>=20
>  python base_do_unpack() {
> +    import shutil
> +
>      src_uri =3D (d.getVar('SRC_URI') or "").split()
>      if not src_uri:
>          return
>=20
> +    sourcedir =3D d.getVar('S')
> +    basedir =3D None
> +    workdir =3D d.getVar('WORKDIR')
> +    unpackdir =3D d.getVar('UNPACKDIR')
> +    if sourcedir.startswith(workdir) and not sourcedir.startswith(unpack=
dir):
> +        basedir =3D sourcedir.replace(workdir, '').strip("/").split('/')=
[0]
> +        bb.utils.remove(sourcedir, True)

This remove() seems wrong and should not be needed. There are two=20
cases here:

1) either ${S} =3D=3D ${WORKDIR}, in which case the above will remove=20
   ${WORKDIR}, which is sure to lead to problems, or
2) ${S} =3D=3D ${WORKDIR}/foo[/...], in which case the removal of=20
   workdir + '/' + basedir below will also remove ${S} as=20
   basedir =3D=3D "foo".

> +        if basedir:
> +            bb.utils.remove(workdir + '/' + basedir, True)
> +
>      try:
>          fetcher =3D bb.fetch2.Fetch(src_uri, d)
>          fetcher.unpack(d.getVar('UNPACKDIR'))
>      except bb.fetch2.BBFetchException as e:
>          bb.fatal("Bitbake Fetcher Error: " + repr(e))
> +
> +    if basedir and os.path.exists(unpackdir + '/' + basedir):
> +        # Compatibility magic to ensure ${WORKDIR}/git and ${WORKDIR}/${=
BP}
> +        # as often used in S work as expected.
> +        shutil.move(unpackdir + '/' + basedir, workdir + '/' + basedir)
>  }
>=20
>  SSTATETASKS +=3D "do_deploy_source_date_epoch"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b2c500d8739..75c850760f6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -405,7 +405,7 @@ STAMP =3D
> "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
>  STAMPCLEAN =3D "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
>  BASE_WORKDIR ?=3D "${TMPDIR}/work"
>  WORKDIR =3D "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
> -UNPACKDIR ??=3D "${WORKDIR}"
> +UNPACKDIR ??=3D "${WORKDIR}/sources-unpack"

"sources-unpack" does not exactly fall off the tongue.
Would "unpack" or "unpacked" be alternatives?

>  T =3D "${WORKDIR}/temp"
>  D =3D "${WORKDIR}/image"
>  S =3D "${WORKDIR}/${BP}"
> --
> 2.40.1

//Peter



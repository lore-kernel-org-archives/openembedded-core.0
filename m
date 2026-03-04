Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54D7EFCE4D
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 22:26:06 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30903.1772663165411372356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 14:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Nk4snC1u;
 spf=pass (domain: axis.com, ip: 52.101.72.38, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lh469oTdEYjiMYRjUzJGQWAQ3geGsVyZq8CVO/girvTJwt+gQyRfbyYLesU8RBGbJeWqiVP/u1pAIJ+NzUA420i2WTnoqUUw6IeheZ5t6Td/0DSnGou4R4angUJm6aMK3cTHZo1oU6VWWZg59JxGp/kC8ehl4vWM2RJEn5Qj8ZT52zZUi37ZpUzn3/8dU/AhwuZxxqgFYyfOIqnQVBGG8xJPl2BuViLoKbHCSJTyaSqa8FNT1DpvCUTdAcf6G+JmmQFYsF6pg8z5zegdb9lbFkyAamqGHVwVdfOV2Qz6ixtalxyUha1ITP2eN4ozeG96PcaCVladyOe7RCoEPqcTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1obKahR8wcW8xKBl0lfJhJoNmz3t+ZO43sfRiyrmJ28=;
 b=Pqx2Br9cWZx999uZ+qA8nD2Hn2ygWA//C8e2UMzBbxU1SBOyetVMpItZW65FKMz2K5OkBjKho41SvYlVJEQApKrr8RMX/TQu2dfGFrQ7XyDduLMOdzGAlbdXRQ73r3WmPbjBpanW75t6CWQRPH9ATC9IerEtt3tcTWRPu5kyU1oGZRE99ILTrGsoyt1ZLBHlR8eJyqGdd4SsjR5VCD0cHM+4f809nt8eYexSKjy+G+rvj5ZLSzXNhbwiHYggU/AWUQTXDWLOde1Kt719UiIEMYqSc7kB89QxuYRe+eamwfKaW0cvuAwXqhpCvVN8fwh6DGtPzwgvvBXm03hLoiKXaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1obKahR8wcW8xKBl0lfJhJoNmz3t+ZO43sfRiyrmJ28=;
 b=Nk4snC1uWvKOVS9b5xUzNYZKEB4grZlGooLcXvF2MVqClnmqzgpkn/YwtVP3mBSFyFjeoHWSuKil1VpXDwmHf5GdB7ikSjnGdT9ZCXzBF/ZJJY0P2zqydii6NRhKZ8N241Pw0fKZ0Zh+wGuPQCr80EVQVgi7FVPzx38bLZ2Hkg0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB10195.eurprd02.prod.outlook.com (2603:10a6:20b:62e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 22:26:01 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9678.017; Wed, 4 Mar 2026
 22:26:01 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "martin.jansa@gmail.com" <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] license_image.bbclass: report all packages with
 incompatible license
Thread-Topic: [OE-core] [PATCH] license_image.bbclass: report all packages
 with incompatible license
Thread-Index: AQHcq2eADqnkSAmhPkur+lcAx/IlXbWe8n4Q
Date: Wed, 4 Mar 2026 22:26:01 +0000
Message-ID: 
 <DB5PR02MB1021312EEFBBA6D4E70FB8184EF7CA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260303234247.8034-1-martin.jansa@gmail.com>
In-Reply-To: <20260303234247.8034-1-martin.jansa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB10195:EE_
x-ms-office365-filtering-correlation-id: a16514e1-775a-4e9e-ff4e-08de7a3d03ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 PfdhUGgr2toiw82AQIzAyk+jQGScoP3iQjFNU/zBYlhfM6jvpOnIB4DrxrI3L+DghKcqqG7UGuIOz9vW7I6Rs0RDhlH+PK6TVN3JH3CMxBducK8wREJXynlYb51DQRRO+EQGy/zES4WSKxcnfkqzgAdwNpw6LMdfeU2dcvBMs4e+aUFGpbzPcO/B6B8Ui95j90HDMx8aloype+u2tZMoELwXtXRzakIDQqRW6mU5c59vQLXiRpPB/GG5QeisMUvn8YotAIntIrziTZ3RjL29sWMHK81FLjy6qViL6o5P9VYyL4SrTIMu+PNVXEvmakzho11Q9Tn/7fF1h4h+TKnM3ppxvprzsTVh1CjSI32v5DhgDA0j55koiT8kRo/u4QUtpLVWEogQWk6F6SzPdtZ4zyE3V0uFqTJ3gPfhEOseedzah/c9g6MAFKwN/pguetcBSFNVIYRBgdUKLy1rgFGuhcBlbVtTXZrxLUgWcFxB8pX/NNV4T5Z3Y7+mJ0JUojkfH8fAwgOsLrM/Opwsk9NGu6Yk2f6dvrydx9t9j4Gilhx2HK5bmOyR/eE8D/aOnUunBj6ZDDWYfscymbXeimr4OO4OKQdP/yMTy5di4GAjEXasJ+YefGKVOJSqqrHDfPdcWFwhGNYrogFTqJNVOFa8FdtIQmNWnWUfOdPCtRQzUr3TvDJEuOjppc6I/ga8c+7g65TTGYwz/tY2hQnJ5lz7jkC0Ak0WENJEqpFupg/Waih1Jt/t68h8yUcNzDYv7eZY5gy9m3IJW1NwY5aEUcZt1CkzTLbMZzdAbSLwKr3zxkk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?cwan1t3aTWwF1G73kDTEJje4pTG7+nsX1o+AO9LJJ/gFsQWHn+NBB+uDXVzf?=
 =?us-ascii?Q?uxTykA7sEUZjHLDPw2knNE4dUD6Cd4DcDhOK5CzYU30wyH5gWeEJnL+7TfM+?=
 =?us-ascii?Q?DN3cAltLO4VitadvT9xhwhnFVivoqtxecmvbqb9/w6vnukMBWn+IY5jX12p0?=
 =?us-ascii?Q?pb8Zwpg+Zpzs09U0QjxY5i27t8TmVORHF+O8JTs/nT/FGxnRNyoO0qGnrnet?=
 =?us-ascii?Q?tfqxoCm+t2FyV/VBn4wJNUUMOlIO1MktI/u9lJX2ALHuMAACZqr+7wrFMOMn?=
 =?us-ascii?Q?P/n9vbzTmFN7cUveL0MQgCIwo9TGfrGJAl7y9xmluC6/4BCa/84Sb2nX6C2A?=
 =?us-ascii?Q?ZcaYO4KPmYBTmDposUYW0+jSS0rVk5385EtihLKDeTWJUOhybYLqjihb+nQs?=
 =?us-ascii?Q?wkN7y99DY+oiUzP+MOqL7KVuc5pzOE2wj8/ujYKHccfkx8l4VqKhfgxe/DxY?=
 =?us-ascii?Q?S63hPM6pKHPpL7kuum/Uh5LDEs15NqDkFhPQ8dVdoj9aPmxM4bXnPCnKR1Yj?=
 =?us-ascii?Q?rOC1b0I3PSIFsZOtzVKG2+wBiEj/sXMkV5IvZawCpN3Gawfqb+/2xOIPHn6t?=
 =?us-ascii?Q?DVlHV+NzCtiNtbTR+4c3EJPyiYSPOW6ZcWgzSdBjTe8p7Eu3Eop/Z2rD9HMb?=
 =?us-ascii?Q?NAka4q1I0rlhB68a6uhGW30WRZvp9JfzrKzqosB8rPsUClyRj1NIvn57X9cu?=
 =?us-ascii?Q?1ye5Ovw4DK//HjIzMzpleToWWj25OlodJLQOof+eOTcbLuA1EpkC+Yhc5M1U?=
 =?us-ascii?Q?ZFBSSG+FGAG0A017VIaoIlqX9GKjilt9cVU2Hx5aMF60mBBt6C36met4L0AM?=
 =?us-ascii?Q?7wDRxpavplO/yLLX5qox/RhjGxBkLS09sswWe68YEHmNTHw2bxnC9hoQa5Xu?=
 =?us-ascii?Q?KiNt/95Z4eiHKxAZ61NzpgIw1hyuhF8rt+IITHsF0A+/9R7wBcFG2NTLH3gR?=
 =?us-ascii?Q?Cv932/rvd7/B02HGtw0fWZ8Tpa14j4ov45Di6ZBCPOkJ2cHXB1H+vwNvudt1?=
 =?us-ascii?Q?7FhaZFuELm2UwFerNbsn+47MU4saLHbavKFvwxNztcnt8ueRrbxdcf45+Xct?=
 =?us-ascii?Q?c/M1aGxSXptESfqLFMAddRRbkM4L9tN7TjC0Ge6G4XXNRZabgGvtXT1lGyaR?=
 =?us-ascii?Q?j3dGhNB62bCQqy92fBFSdFiX587H2iNg8ElGaGRLywAhsRCWCBHH8bUmav/3?=
 =?us-ascii?Q?sD9sddStEUIT20qbTB1ZFXpAlVzZCZHteIaqmGi49KTXtBHyEV9g6tGQ7Zss?=
 =?us-ascii?Q?bTvm88RPwGxsMOmQUPjnmA34My7CbM8pWeLq9Rd7K6+2Wbg+4MgyFxEOQUmH?=
 =?us-ascii?Q?23zcBzgQcvn1VQzqdcKc4DmNEZeqGZsq5DbJ/77m/JQSjOe9kUPEOvBJP3n3?=
 =?us-ascii?Q?53c31EZBUuGTMefqsTJ6FXXFjh6jjXYANuN+6Yd205IRDTdo9PPozPmoJP5i?=
 =?us-ascii?Q?sUR+b+HHcw4OKtDOLAj1BqboWrVI1zhbSh3/fkN6IeqJO74mKvS6Y8NGaKi9?=
 =?us-ascii?Q?YnIjHSINCxyfNeMz5WCaWGfFWHbpuy2HV5IsmXN7RBs18aGv6y00k0zRF2gZ?=
 =?us-ascii?Q?yleGCAUpnx3S6lB1zs1B8iqJPkboMIQD2IaStboHULE+wHk/rct3C4ByCsoa?=
 =?us-ascii?Q?7gbfjT2BDnFUxFXAfoCNyr2Pc9yuII4KvhfyWhHLkOG8zyC2C9jwGYASAIkP?=
 =?us-ascii?Q?WViAa84DjaFA5l7U6S3FBFAlk/g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16514e1-775a-4e9e-ff4e-08de7a3d03ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 22:26:01.0402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UEK5cfOcUUl31E75uOTaoWUtRKgo2NoxBEmxEQMreNiSPt9++CfUYkZg3O3gSvd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10195
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 22:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232439

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Martin Jansa via lists.openembedded.org
> Sent: den 4 mars 2026 00:43
> To: openembedded-core@lists.openembedded.org
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Subject: [OE-core] [PATCH] license_image.bbclass: report all packages wit=
h incompatible license
>=20
> From: Martin Jansa <martin.jansa@gmail.com>
>=20
> When multiple packages cannot be installed it shows only first one it
> finds, because of bb.fatal use. It might require many iterations to find
> all packages to avoid.
>=20
> e.g. with ptest enabled and GPL-3.0-or-later, GPL-3.0-only set as
> incompatible licenses you might get list like this for relatively small
> image:
>=20
> Some packages cannot be installed into the image because they have incomp=
atible licenses: bzip2-ptest (GPL-3.0-or-later), coreutils (GPL-3.0-or-late=
r), coreutils-stdbuf (GPL-3.0-or-later), diffutils (GPL-3.0-or-later), find=
utils (GPL-3.0-or-later), gawk (GPL-3.0-or-later), gnutls-openssl (GPL-3.0-=
or-later), gnutls-ptest (GPL-3.0-or-later), grep (GPL-3.0-only), make (GPL-=
3.0-only), mpfr (LGPL-3.0-or-later), python3-dbusmock (GPL-3.0-only), readl=
ine (GPL-3.0-or-later), sed (GPL-3.0-or-later)
>=20
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/classes-recipe/license_image.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-rec=
ipe/license_image.bbclass
> index 8332905da5..252754727b 100644
> --- a/meta/classes-recipe/license_image.bbclass
> +++ b/meta/classes-recipe/license_image.bbclass
> @@ -116,6 +116,7 @@ def write_license_files(d, license_manifest, pkg_dic,
> rootfs):
>      bad_licenses =3D oe.license.expand_wildcard_licenses(d, bad_licenses=
)
>      pkgarchs =3D d.getVar("SSTATE_ARCHS").split()
>      pkgarchs.reverse()
> +    incompatible_packages =3D []
>=20
>      exceptions =3D (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").s=
plit()
>      with open(license_manifest, "w") as license_file:
> @@ -123,7 +124,7 @@ def write_license_files(d, license_manifest, pkg_dic,=
 rootfs):
>              remaining_bad_licenses =3D oe.license.apply_pkg_license_exce=
ption(pkg, bad_licenses, exceptions)
>              incompatible_licenses =3D oe.license.incompatible_pkg_licens=
e(d, remaining_bad_licenses, pkg_dic[pkg]["LICENSE"])
>              if incompatible_licenses:
> -                bb.fatal("Package %s cannot be installed into the image =
because it has incompatible license(s): %s" %(pkg, ' '.join(incompatible_li=
censes)))
> +                incompatible_packages.append("%s (%s)" % (pkg, ' '.join(=
incompatible_licenses)))
>              else:
>                  incompatible_licenses =3D oe.license.incompatible_pkg_li=
cense(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
>                  if incompatible_licenses:
> @@ -171,6 +172,9 @@ def write_license_files(d, license_manifest, pkg_dic,=
 rootfs):
>                                         "The license listed %s was not in=
 the "\
>                                         "licenses collected for recipe %s=
"
>                                         % (lic, pkg_dic[pkg]["PN"]), d)
> +    if incompatible_packages:
> +        bb.fatal("Some packages cannot be installed into the image becau=
se they have incompatible licenses: %s" % (', '.join(incompatible_packages)=
))

May I suggest to use "\n\t" as separator instead. Especially if you expect=
=20
a lot of packages to be shown, having them all on one line becomes messy=20
very quickly. E.g.:

        bb.fatal("Some packages cannot be installed into the image because =
they have incompatible licenses:\n\t%s" % ("\n\t".join(incompatible_package=
s)))

> +
>      oe.qa.exit_if_errors(d)
>=20
>      # Two options here:

//Peter



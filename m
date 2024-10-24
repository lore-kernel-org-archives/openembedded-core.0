Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FC0CFA456
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 10:03:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.43])
 by mx.groups.io with SMTP id smtpd.web10.10940.1729764182488984226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 03:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=hcWh9Y5t;
 spf=pass (domain: axis.com, ip: 40.107.21.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUulfTkFr7bfs7pXSAUNNo75YKs6JD63C4KSTJgx1jN3r7e9u3DiY/jHoWDel7OJ1S65hok8H7wpVwizof3Hdt3+ii++IpG7PJ+BPmaU9dRz620qFEmc6PsJSuhzpo1dj7Um3OOHApW/+4LUfPr70RKU60q7TUv/YEEd02/AgOlXqr6zTbP8u1cAe/Tj3UZ2cwRvYVQ8wII4QN8YwIBGVqmXj56WbELgWRu4DY790oebxVKkTB9QF0Qr6ory5sb49AWV3Fj1gk0/0OiA8t5vNEOiKl/bfHeTrTNFM8Sq2VavPxKu1TsqxIP5uCZ7gYuj4xHh+AAPVkgST73frOPLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kplmnr5uLHCvBetIs4YeHgEBgKw2bg5XL2baUeHgAb4=;
 b=f8TX2OpKDyuVPv8/JG/v9NppXlhXb3DOIfNjqkAdzklM9jMjOZEMEXE8NLZDmZ8MoDccxaBRadJ+YbTs3nJVslCkaW2ibMIM9xgHkzKonW4JKY3Bc9ULmmzDLzMZHzhB1jv+IyhbrVsV9sO7AoA9gpziRCDRPCSkr2uFiUWl9ITUGWyqkv3CFlUFP6bjuIPRwvAYUrvzRqxlRhmJiJTDTJjrvfc/pYEZKhH6gBt+ZwU7XKAdmJi7zpzitDc/VSz83Kks44O2/3+MqdJoDSkyZUB4NKb5xk9/lzUztzYCp9BPqGNsMOg4rhbYsb/0R0yseEFya/d5qgKCEfzS3LBy3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kplmnr5uLHCvBetIs4YeHgEBgKw2bg5XL2baUeHgAb4=;
 b=hcWh9Y5tm4qUiMkox/lMBmwTS1BD7lobX0HTQOTT+uYtRnKP6lH7yzgaw75IHqwBqgt4cEn8Ixp5zrs2+nrs/6eCN6/klQRVQ5R8hRCmNc57BWpcKA51cKH6yjcwCSFoKWcKCorDjPRV3EZSXzwFnbR6hTy/pMXZCgN+xy2ZPdk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA6PR02MB10562.eurprd02.prod.outlook.com (2603:10a6:102:3d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 10:02:59 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 10:02:58 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Joshua Watt <JPEWhacker@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2 3/4] lib: package: Check incompatible licenses
 at packaging time
Thread-Topic: [OE-core][PATCH v2 3/4] lib: package: Check incompatible
 licenses at packaging time
Thread-Index: AQHbJZFxd8+q+ZAvWUGjUBA3kg+SmLKVrBDg
Date: Thu, 24 Oct 2024 10:02:58 +0000
Message-ID: 
 <DB5PR02MB10213AD0C60A058071E19B031EF4E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
 <20241023212013.995247-1-JPEWhacker@gmail.com>
 <20241023212013.995247-4-JPEWhacker@gmail.com>
In-Reply-To: <20241023212013.995247-4-JPEWhacker@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA6PR02MB10562:EE_
x-ms-office365-filtering-correlation-id: b90d748a-5f97-4333-b1ee-08dcf41309e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?IPtNwQPMKsj0zmK1uz9n8Z9zggZq1vfpHJ2LnPD9wB+oC1WVcBKj519SWoOn?=
 =?us-ascii?Q?SVjfZkVDBkPgDCNYkqhNujibemX+tIahCksup/OpeVrpc/2RaGSbC8M2IPvG?=
 =?us-ascii?Q?C0fC5Kkq8FT5W455fTLKta8gDZzGP1IJoPHV8RPPDyItrx0vBqm5rEOc5j0T?=
 =?us-ascii?Q?7X0BW4lruy0P0eR+4HqROYSndndOwTJ5zOF1+c4tGPMqTjTkYEwPMBEcTgHy?=
 =?us-ascii?Q?8utmqsuwv8EzQVuXXPvudHcZgryJGc+K/lvvj/pRZQRFPSGTGTmZplDXuLCg?=
 =?us-ascii?Q?pn9BB0gCgEjk4tMC9fOrQvtMr8Zs8+AAaVslh9P2Pn6qSCrH2jUxAEvw0JIR?=
 =?us-ascii?Q?6XXNgfbdWVa91EJZBJfEcyJwf++2FnYsJWRLJOq6Tj5lwjc4CTGNFnwckxBt?=
 =?us-ascii?Q?+UbjudAd5XLPbM75TGFKEg0QyzAvZLYjhFjvd0tAHcQHr9ErNiarJtBrWXvj?=
 =?us-ascii?Q?pZFaKfS8c+2IlHeoN/dP2JkzVcQN19ipr2wKe/O4tY23C7aEngPVCkVD1gvL?=
 =?us-ascii?Q?V2mDBvVhTLocahlNYfAhUL5MgiVqqFH7ISo0hbTUrG8Wf+7FAdZj4+9bxeTX?=
 =?us-ascii?Q?DaqIFe+XuC7W/mCf8sTzRQlXgJq+U6rRZBhbT2UHkZjdmR5PPatFOTlLqpiW?=
 =?us-ascii?Q?/0ySlFSvoko9MtLNhFRTF9ySibgc7yvcP1A90fm6VcZ+gmE6fPmxmxfDy1w1?=
 =?us-ascii?Q?m+/OxZtVpGVVyaooZJDzgezw3bSxOFpixAXQ+9yN8h1ddHgrEcrfgluOFOsX?=
 =?us-ascii?Q?B3OcuoNgfiBNJRxq4wF0cLNPHKyzo8lL7f0SC8fV/oAGxxdAVmwClRrumzjT?=
 =?us-ascii?Q?mUi7WvszBqlycxhcUAIvkK7thV/udf3XDWIZXwr4NbrK/BIul3u2KGaWcm1O?=
 =?us-ascii?Q?8I81GIwh6zxyR4RHi6Oqx11gYpm3N0q0Byu0e/4IZtdVcyO6vo0HQGxnPf+R?=
 =?us-ascii?Q?fMRa3nK/KufV/d1HCr7osD+CaERr0euOG5ivAJATEueFVbFwHLWAUTw4HDMa?=
 =?us-ascii?Q?T/QH483haHmFWqMfB3eVKy03Rja/biZKInalzmWl8yPGthUPR8ZdI19T7/du?=
 =?us-ascii?Q?t6F1/qcyeG8uCug1pbC4WGilcVb8xccj/qLHXmMAJMIxvR2hqh5Psoh5JQpm?=
 =?us-ascii?Q?OsAOJfpFY1moe/ErnY9ycTEX4lcWuEiHsWQzgVHVcmb+Busrdtf14+Y5Vn5s?=
 =?us-ascii?Q?snW1sOT1chI7nttDucu4UTWgbipo7e+3COWY891XS3tYVOxW03kAElbbfI0L?=
 =?us-ascii?Q?/IbQziR7pmvkoiSF0dII2SUC4WAX/pLnmMrhaDOXD9E3y0r5E0n1N8MOpQRY?=
 =?us-ascii?Q?URnzKQZun9myI4lchj8cAK64IKGRhM79ASjftKkqlUbJuLHmU9FuBzwTVmuW?=
 =?us-ascii?Q?+8NL7qs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GdXA7+2VAVyfS/b3oelFI1WFV9rR+6XY0tuaIKCtKVJzIA+H7KOfK4MhD3gQ?=
 =?us-ascii?Q?vMl2eGoOie1hy07kK1jAa++tDuTqvDW1xGFSbp67Qz0ezIe/0tK3xNCvIIBg?=
 =?us-ascii?Q?fnuZ4MxkedBne1yfmpsiBEzdYQL4XbtrV2D8kaXWgT3B6YyCRvHcyeOOrUzI?=
 =?us-ascii?Q?YUAueE5Kp5X8QYZeunTXSh4MItobh/8Nj5vDo/YLSPju95YDPyxEngr8ChQ0?=
 =?us-ascii?Q?3ssBrBkdLgEa2rcQ7aLKRZNIFeU2h+G3EX0g6HAR6v0FwXOKA1fCKxWvR5zp?=
 =?us-ascii?Q?kxCxz48iRYJPMJKXc60Ck4f/6GSWYWu29EoFnNXUEbo3zTFDZZdtrT2wNCZA?=
 =?us-ascii?Q?reKoSg2I58bFl3LgBV/nVrqYznVfrrIQsP4hoOXtZd21AuSCyrUJDE3Jdppm?=
 =?us-ascii?Q?p8w6kvuXOD2xpj0BGlLsBNi6Z0cmd+sgsmuv6d3cDqnBNJ1Xh+iLn7QjwTgp?=
 =?us-ascii?Q?RlC+/8TLCklP0wVAEpixSliBm5NPYmQgvvsHdjPaEsSGdOdpYXK9X1IVfWnm?=
 =?us-ascii?Q?1eU5+7Ft/71/tmenqHlLmJGnLrLQAucPM8d9AjITZ1A5Xi2A9HOAYJl90gVz?=
 =?us-ascii?Q?ONdID2sl8kMWg1g1uJd7zVKduANPF7FRK7o6YuDyarlpW2cXvFwP0esbQR7O?=
 =?us-ascii?Q?UEYTk3SOlv6KHpW52rqUWg3hA1GYeCNUcAIreUgxaxao0RTweIVYaHYGwozh?=
 =?us-ascii?Q?ap5GAQ3M9fuj/yLwViOOCNh5d2hTi+GHCNq9gQXYS3U1clxw1BVmYmKiLVe0?=
 =?us-ascii?Q?xBlRU6NEqK9p3scuJBYENvNfnqjXLXkqo3ZRra9V8l6BneMlRUAdbPTyWGQp?=
 =?us-ascii?Q?ClpydDJNM9qObTTQVHWNkDZPH+nDJHY5C3SS5PvibfpcT86nRdnRkzIDvvbm?=
 =?us-ascii?Q?tycvg3TPnXU1LKDiV+/YIPvUjPiwfBxHRzsReMNYQL3WReQ6gUCu5rgbH14g?=
 =?us-ascii?Q?gOJqd+7MgXDXYnATWG9ofSQJawLOjoJ9xpXgjUc6NquHa6yeVV0t6nbBSGEX?=
 =?us-ascii?Q?hQ471DPVoAPGdyZ/wkPDo6fT/iG/rfms9yw/pcGvkltfWEY5316tL42mIIFz?=
 =?us-ascii?Q?1GEGtdRe2lhYo0LfemMqiLg/z2F+CwHSnolF2SN55HieZJhFPxizOiE0UR3o?=
 =?us-ascii?Q?fe9krWimmkLtiocrPLPwyqDUCJoc7fJVi/K74ej1TBu7brD59TLm6zx77k91?=
 =?us-ascii?Q?BEM7Q+SY+JajR30vHsVC2vnSjlDZasteZ1Qg1Wb8EwslFFZHaNa7g7ZjNalz?=
 =?us-ascii?Q?K+4qQiBMgNms41bAKLE98JcRDrsqhRTPAikq2CPXpANoEu/Rpd0JOyR3ABiC?=
 =?us-ascii?Q?p3OiR8z/HwGWLuCu5IFzCdItfS3bpIfRgQ3bfg6sd45IcgDP0jCvtIbJa6Uz?=
 =?us-ascii?Q?BuOVOBeqm7ZnZ/SuBgTu/kiCpiinlrHY+H/6TkhpnYaVhA4/uOvoaFkL+GDf?=
 =?us-ascii?Q?od08XCABU/8kdDgTpDwI0rIItjC80dF0XyiCmW6FD7xaKV+4I87uHFKRL2fq?=
 =?us-ascii?Q?wMsJl6tybYQjkk63izKP8SJdQZ59tifN35rPFIHHgG49IMNy0H4KSWitfN39?=
 =?us-ascii?Q?hqRdBQBPIQTIA4xwDxA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90d748a-5f97-4333-b1ee-08dcf41309e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 10:02:58.6853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ueXz7jgjv5uzroA2n+hqL3qvtaQPAaLnwp8NG41MRtvLXtC7aDa5U/g04avcnMMI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10562
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 10:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206283

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Joshua Watt
> Sent: den 23 oktober 2024 23:15
> To: openembedded-core@lists.openembedded.org
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> Subject: [OE-core][PATCH v2 3/4] lib: package: Check incompatible license=
s at packaging time
>=20
> Instead of checking for incompatible licenses in the anonymous python
> and setting '_exclude_incompatible-', (re)check all the packages in
> populate_packages(). This ensures that all packages are processed, even
> dynamically generated ones.
>=20
> The use of the '_exclude-incompatible-' variable set in base.bbclass has
> been the mechanism used for per-packages licenses since its it was added
> as a feature (although with different names for the variable throughout
> history). However, since this misses dynamic packages, calling
> oe.license.skip_incompatible_package_licenses() a second time on the
> actual final package set is a better solution.
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-global/base.bbclass | 1 -
>  meta/lib/oe/package.py           | 6 +++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 5b8663f454d..b81e61fdb72 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -581,7 +581,6 @@ python () {
>              if unskipped_pkgs:
>                  for pkg in skipped_pkgs:
>                      bb.debug(1, "Skipping the package %s at do_rootfs be=
cause of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
> -                    d.setVar('_exclude_incompatible-' + pkg, ' '.join(sk=
ipped_pkgs[pkg]))
>                  for pkg in unskipped_pkgs:
>                      bb.debug(1, "Including the package %s" % pkg)
>              else:
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index c213a9a3ca6..480408e41e3 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1447,10 +1447,10 @@ def populate_packages(d):
>=20
>      # Handle excluding packages with incompatible licenses
>      package_list =3D []
> +    skipped_pkgs =3D oe.license.skip_incompatible_package_licenses(d, pk=
gs):

Umm, how well did you test this? ;)
The Python interpreter is not too happy about the trailing colon on the lin=
e above...

>      for pkg in packages:
> -        licenses =3D d.getVar('_exclude_incompatible-' + pkg)
> -        if licenses:
> -            msg =3D "Excluding %s from packaging as it has incompatible =
license(s): %s" % (pkg, licenses)
> +        if pkg in skipped_pkgs:
> +            msg =3D "Excluding %s from packaging as it has incompatible =
license(s): %s" % (pkg, skipped_pkgs[pkg])
>              oe.qa.handle_error("incompatible-license", msg, d)
>          else:
>              package_list.append(pkg)
> --
> 2.46.2

//Peter



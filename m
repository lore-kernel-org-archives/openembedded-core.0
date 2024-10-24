Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA13D0BB50
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 02:24:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web11.5509.1729736681804774372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 19:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=mdyQueaz;
 spf=pass (domain: axis.com, ip: 40.107.22.88, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXk0a9Osx5dKWwYcmE9ZtiFTvyEfPWwwAGWq6AFNgP1znHV4wJBe9U5gKyv4PiRt3ERB3E1Z5inmaSlWurIQf081ZZk3m0c9EbuCl+gxM4gwUwJTHND+JZH/HqGCQK0t+cBA0yBpCiK89MbxvadjXCEwGFsoFUX5031l7vw5tr2CfRSXH9SWTV+QgxbnOz4/82E9W6gNLrO/iOKGd9Cl9Xk8WN7VDr34KyPYZwjwY3NVsPyp3yPdwx5YV1OLEvBKcYkXGPK6BnQkLrnttl1WHWzcrm4a+3NTd/WXhLV7va19A4FJ6qFV9IBM2zZ1XLQkzcXtqUA3sU6c5Q91F9NSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+boLjd2556UF7vdqVQn7L/+rsUmJMRMzkDMJnGKdjSQ=;
 b=MKc8VUG8v5vnXxXOHJCyJegsAyX+AkcHj+HAAIeVK/NXmuoxOMuai6bONtSQat/A5TnfWjqjpCkN4eDbsVOk7v5l3++oxN1a6eQS3QJ6V/9WK7SiN+Ov7XIOIaTqO7z7cXhlO9B3oYHLbxk7Ktb0tIj7skJnCG+MFXbbo40t29/pa3Pp4DbJNvvwOgNZd4BpIeV14JwJxdKeEfuVQDYTYr+15bXSGi3SSBwI2TLknN0XzchzyxyryU1SyrIYxOjGOXz8+guFrrJpodvFgQ+s12M5LzZxeEX4u14h7CSWw98kZskXZ9y3QhsQt83qJSWmK94BGmtO60SW1iIz8ojOBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+boLjd2556UF7vdqVQn7L/+rsUmJMRMzkDMJnGKdjSQ=;
 b=mdyQueazaylXMR0Fk6bttYdcEoXTmlTUW2zpjGxObN2jJgRIQ29+zSG827OW6YyjM6CqspAKWRUM0BiWuOeA20ul5r2PYbMhWNkjPEKItO01xza8+mG30Ik25AZ0762BFXJnwJeis+wvqKnc5Da6kTYVPHE5CSgDXlWhZtY6At0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB8612.eurprd02.prod.outlook.com (2603:10a6:150:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:24:36 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 02:24:36 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Joshua Watt <JPEWhacker@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2 3/4] lib: package: Check incompatible licenses
 at packaging time
Thread-Topic: [OE-core][PATCH v2 3/4] lib: package: Check incompatible
 licenses at packaging time
Thread-Index: AQHbJZFxd8+q+ZAvWUGjUBA3kg+SmLKU/qcQ
Date: Thu, 24 Oct 2024 02:24:35 +0000
Message-ID: 
 <DB5PR02MB10213735AFD58D978AA4A6BCDEF4E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
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
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8612:EE_
x-ms-office365-filtering-correlation-id: 5bbf15a2-31ac-405c-db99-08dcf3d300ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?j9SMw2nmJutvR1aOXuIGfhcskROJ4f2jlz9AxBeiDDxjAdoTwf4vmN0XsYcM?=
 =?us-ascii?Q?eUCIioh9tfDbFrXHUuBMY6BHujh8FwsF3Q5dnj+TLdClmCgPXpzmtAZH/rrl?=
 =?us-ascii?Q?whrMdMexgxU4Xm+ENSxcEq/mtvjSPhgJM3CVxSB2ry6Ui0UVookS6YzGlmbj?=
 =?us-ascii?Q?MeFN+C3l1AeoHzdfuKxiseEi/nli7oAyZIwXil8DEXk8kFZ2RIkL6ptKYTMu?=
 =?us-ascii?Q?VmRz+SyV3zlFksr91oTXpWJiApvCJWJLKfplBHcw8n6+PUxJxEvMboLSiVUw?=
 =?us-ascii?Q?xwgtQwC8cssENX4SGS9fVCb6OfQ5Ai74aclqvBzFy1u+cctJhajAYnAFCLcN?=
 =?us-ascii?Q?xRkUJwEPExlFQvxYJkLXjvS+EagnFWmfuAJkenVgbRQ1uLOvdZKO3IBXxn3M?=
 =?us-ascii?Q?oxuudnrDW20JvCfutv14r1DCZjhQR8mABRXD5B38J7hWpKZ7EleOaq6EiDOz?=
 =?us-ascii?Q?o1nWxjrKPV6L/lyMN0T5zt4QOEY5UITf/ymMtMio8jESFT9c6nzKFcvd7vhD?=
 =?us-ascii?Q?7AF1SA3472UR8bSZp0aLSJUlXFBW3E3KUNbt+ND1kGyoNap1Ni/R2Rvk9xV0?=
 =?us-ascii?Q?Ihr+/cDTF/0JFdIk6V0mc1GBK2RbqPtqTWGjaqIPh+JknMtSAZI4uB+b4qC3?=
 =?us-ascii?Q?a73k+Fc7LISmwQqIDzq37hV7reD96autR627QdzySNqIsSFwZW9aB0CEoCcF?=
 =?us-ascii?Q?5FlCdvrGlEFUvbHu5k3PqU1PvBeToqihCtJbthTW+wriERVqul5w/0c6Xn8M?=
 =?us-ascii?Q?AMMfAcL4wt44BnyJlbGslOOfvn3OwlA+u6zxPhRmTPHTmcnCMR1L8fSXHQOm?=
 =?us-ascii?Q?uHPycSN7dMwphBz0DhQmOUJQ4s3FOWKC+qUIntPQnM3tadb2vVS/G+SA3uY+?=
 =?us-ascii?Q?mq1+rPeA/UqQNUZYOSLWLEh+naC6hJCb+h8kX7Jy0gR6P9rcuvA5E+50w8Dy?=
 =?us-ascii?Q?0wpBw+2HCzNqzfB6gnjfeWf6UXY4xqQLmxFB4tbiRATqnuWietvwD6vQHJ4Y?=
 =?us-ascii?Q?8oc61+brQ5Jdrnb2VIKzFemF3wkPWF8Xa4pxsDDNUmZlGDwvp0Y9kJQ9XLsX?=
 =?us-ascii?Q?OJezg1x7c3yM7XesNwQJj3xd4Z5/1h/yU1/v3BLmOVzdUuBEXIzNb2z4WdK+?=
 =?us-ascii?Q?TbSaTjZNAUGz2x5FZaVgk1qJD3fe64t9WrUlffDPRaQj8iVkDSY/GNbI5A5V?=
 =?us-ascii?Q?/hqf0BbXyqd+906IyjVPJ1iJHFOwmEXgOT6mgTASXLgAx4QdLHhiF5U8qRsw?=
 =?us-ascii?Q?XyUGEjVzbs/OtUgr0vCEJB9YJCHAERO4KnFttxtbRePtJJOSJJ0RUmAfq+ag?=
 =?us-ascii?Q?VFjWWLfYR67M7mqUrgnVb/qC8zHl3NuyDTAhPeLde+/PcUySo1MGmUJAsC/m?=
 =?us-ascii?Q?q6WI2sk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fEsOHJIgilrWZw/atimdV718OKPvQj2asPtbohgEYxWcnqDhle25rPPVZKYI?=
 =?us-ascii?Q?9my7ZlJiC6df/9pqxYhozJkdZw/mHAQ/gIYUXp5V22Py0lnR6PyPVAie+MXN?=
 =?us-ascii?Q?5FxX7exOXYo9g/GdTTYKJ8cwGus71J1GLAs3maOV7nbhtwL9uWdWm8OFDZmm?=
 =?us-ascii?Q?u1aGl+K9YfhGkD8BS4PcI2uKukUCnh2cPcaO7YQanyPdPIpm0f9b5rTpjBPB?=
 =?us-ascii?Q?CszRbTuI9oM0DcfA4VqsMtsghaGYrU2HmgecaUPOK1ev8IUzC2F6NQQkJjEZ?=
 =?us-ascii?Q?P3rTCIHoLdn/1Q3WrtATlaWGqMCiaDXZEFAghUCJsk38G/Gy7nLo4uUiQukL?=
 =?us-ascii?Q?ohz/Bi0e/IsH2CMeonnNvBNlKTvScQQ4C3sgCSmglIx8L/pPrasSGiZeZwQ1?=
 =?us-ascii?Q?/r9z49jj0+T1o533MGaNC3TrVVJFJ9nqb3nd+lbtN50BkSBBz4nKHWUAuXbe?=
 =?us-ascii?Q?ltYct1aOEGMFupCBnEM6DtJVq/hANTr0wYq7WLGm3M15SgPXojaC/V7CbgSo?=
 =?us-ascii?Q?IsNZmOfiPOxdP0UiUv/Fh8sV652x5s8FbWa0dOluogkmRc4qx1os1meSZMU5?=
 =?us-ascii?Q?TH+6gR2RDHANTB/3OXqX9DCrtnzkv9bKYTjzCr/LtLTl1xgyDu27GqFNIN7V?=
 =?us-ascii?Q?essDxOhJHv4vWWu/Eu4KifvRHVxILVJAsk+hO4uXg0XVpDpLt1pkUqyJx76h?=
 =?us-ascii?Q?wgjhe0X5e+v0A956p4hYePwyhpO8BHeyMmECVscr/oap4nAfd4nwMxOwlMsx?=
 =?us-ascii?Q?B2lTHFkoTXXtZtkYW7uFlXQjaj/W87LNHHX2rcmBdh2MuJ8AxCfqz4Om/KOo?=
 =?us-ascii?Q?z9om4LlmbnXRuz+KvmIW5uSFx5znIknsbKOphJSdG21pLScahD/QtpH+00NB?=
 =?us-ascii?Q?efVSdXEmEhHou93aeZFEuvsTvJP8D8rCbKe3tG6GEdFMbJ0OU6HHh8CQnciF?=
 =?us-ascii?Q?Eq6KEtIwoCzKpu2atQDnifzja6rQflEjLYoPDditAK/+GF9ySoJyk2MiTHLG?=
 =?us-ascii?Q?ldNP/Ooggkz17RcUt2+HKFnlHPSK59nZwveWYnonwa8x8DX1ZMBoUNh25pb5?=
 =?us-ascii?Q?47Z+2EL0j99rQGsj+ON+OvLFOb9fPdAzqebCZ3t5qgRpZ0Ra2tXxGNAWQQGI?=
 =?us-ascii?Q?kaLMREJoUwPg8aotnSBUmXNKY4Db0mfjm9aBtIAhnsd/cpd2qBK+4Arj6aAJ?=
 =?us-ascii?Q?ylE3AqixElJoQd026QA5Uf+4fPyA6bW8Qck/QAYE+FcIAdjx4pikTVAIjhaG?=
 =?us-ascii?Q?M1RlrixKCTtM1wlcA2+ozocma/cGctsh9BuMI5jkYwmsi/kbW5eZ0oJef3SJ?=
 =?us-ascii?Q?tkthEHqpRKUGFV+WesWYkkimney+qvbVsl7iJf+eb1SzXkuTsuHFqyQ2x7Mu?=
 =?us-ascii?Q?uS5A6PI8MlcHT42Zbm3JRW3wmvC7Lqs/PyrBQqXkwzTkVXHBFTnkbVZMOi6d?=
 =?us-ascii?Q?XsHsQOQhewY7Ki1opWcBB5xYvFrujW4hIFFJM9METwsgo0R8xISUrAn/Mtf5?=
 =?us-ascii?Q?3x4bfJoLzrPqr8lH5abNyf3bIQnpSYiVQRPNf2f1pLN8OI34sxrifwpF0r4f?=
 =?us-ascii?Q?mPMhmteVTIvsnqVH9lA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbf15a2-31ac-405c-db99-08dcf3d300ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 02:24:36.0077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: epYOX2vIYJduPf6SFx97yJ4PKUFvKku0KBDRUoqDC9Cg1GiYqOtG4L/LoTVW2xIn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8612
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 02:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206275

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

Typo: its it -> it

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

There is still a reference to _exclude_incompatible in package.bbclass.=20
Not sure what to do about it (it has to do with variable dependencies=20
to trigger do_package to re-run for recipes that are affected by changes=20
to INCOMPATIBLE_LICENSE).=20

//Peter



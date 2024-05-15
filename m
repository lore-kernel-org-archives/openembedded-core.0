Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15E5C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:55:24 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.70])
 by mx.groups.io with SMTP id smtpd.web11.532.1715795720558504443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=WUKJaD2q;
 spf=pass (domain: axis.com, ip: 40.107.105.70, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/nMmPqg4Wlrndx1U4sffhHmxVvlciYCyXwmuD9/zG4tQ2PgOh2Rp3WjB3NZW54MAvqlAiVWOxV7KxFpSHCDJlQKaztKfSQ4vWgkr10S3LAWnKlQxkZ76kSfb9qWlsivhsiAkvQnnvTsL59v42L9Zs+PQAeXJ17iCuo5f1+OWjH4CRGS0o7CEI90xedDTWAbcSt30Nda8D+UlrRmbIlM2zEYqfNpvluZeRBTFra4Xej8VSIQ1ayunKJFisRj7plsuYp246Khi2xunjWJ7ymf3ZUbPEZO3gMy5QUgpyCWYd9pojKTwVu699W0DxQ263SaaT2OJjW8Ixp8ddLYR2MCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Qzsg9RjtkBUN+7aQUZXTfcKsQUOLErpfU/1KhI0uHE=;
 b=C4tRh7NkJtCdPMHzkTkQNyeIPLE0fTXsbaRJiJjLosQMUujQzHuYmr151Hv566FvV+wK+sKhD9tRWWmzSP1ZxFlnUDbZEfjkzGzbA312C2Xb7f5s3lDy/ZC4o1cHSA24WHTgCjF3c0zkV6fQvJEFOtMY0gSsXTLem+qREoiIyusHJe3+fFJS42ivzCwlYvQQq/l3yi7v1e9ipF2OAFWXyMHvAmwkOB5Lxd3aKhka9bDEv6d6poBD2vjaUcPrz5O1KaSu4Y2wekTIGjnMDeneAq671aoDQLmVEYgFd78d8VGuxAie1J5bvUHtF2CGvCUCoS8OvhOeBjk5KGShtsjiJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qzsg9RjtkBUN+7aQUZXTfcKsQUOLErpfU/1KhI0uHE=;
 b=WUKJaD2q/K/g1D2EoSFuAhHkHVH33sfF/HeJKBBKsHpCq9L5refp8IwUHmKMf810rma2FvUzAzGS+FTCDiFyaNH3OIizOUajcJnov4EIAnLukp0Z9LMl/1ide6qaL4uXB7Fkbb7/NI3hpNGdkEK8PTJY4zZ5uvwbBJ1AMiA3NDM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB9780.eurprd02.prod.outlook.com (2603:10a6:10:451::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Wed, 15 May
 2024 17:55:17 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996%3]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 17:55:17 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ola x Nilsson
	<Ola.x.Nilsson@axis.com>
Subject: RE: [OE-core] [PATCH] devtool: modify: Catch git submodule error for
 go code
Thread-Topic: [OE-core] [PATCH] devtool: modify: Catch git submodule error for
 go code
Thread-Index: AQHapeT0Vh+M0VqAsE+kc04qn5ig3bGYlXew
Date: Wed, 15 May 2024 17:55:17 +0000
Message-ID: 
 <DB5PR02MB1021322BDD00EAF753CAE684DEFEC2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240514095623.3951836-1-olani@axis.com>
In-Reply-To: <20240514095623.3951836-1-olani@axis.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB9780:EE_
x-ms-office365-filtering-correlation-id: fe8bfaee-c2e0-4ed3-a633-08dc75082dfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?y0tSCCXIzrl6kEAxqd013gfBhnpsc+tmA2aOAoBm2KTXdxKm6OqqQQ7/+Ylt?=
 =?us-ascii?Q?BbmmY902fci4Lxwv77T54yXiraKYwQJUoZk6RaE3Yb7OfOXimyJF+TjCFjDx?=
 =?us-ascii?Q?bQH8lfjS+hwsa5E3sK+sRhyFhRlaBBbCW76BMKtWNXZz1xBftkFry1JCyTQr?=
 =?us-ascii?Q?9mUrbx/YhQaSNSRRReXbhZW4JRPscUQUYUAbpgnSAgWK3lQHMLhuG9EFH0Tw?=
 =?us-ascii?Q?YWQ9zcnQjFiJW0P+k02vBAj/rTJ5Jsj/gsHFWsiM3fz5R1jjW5o+6IWxTrtX?=
 =?us-ascii?Q?ytp+WO7KLNaqS4fwaR1J7rPApk8f3tPhSGNOENKn79F6oq+d1OWpTfMlBaa5?=
 =?us-ascii?Q?XX5nIYxuVeX+VJthu9Y5cDo3RLyYoR8ZgNmeLtG94C0UmPLuIu4C6V+f0XS3?=
 =?us-ascii?Q?RFezlIxQ+GfP06+jK7kC9n3/IB29VN+evu0H63IFqijYoKzFz+KOBz5lYw6Q?=
 =?us-ascii?Q?HGvb7kUalVtp7jra0boCKODFW4bcmlxGbfnOXqGGoCia5fQ4gpRdMau4j2YC?=
 =?us-ascii?Q?RnnvLyizxIQZH3iHFMqpugbyCdMIntc5rpsXvbVzGcw29Vcoj4Ek6wCsoE3r?=
 =?us-ascii?Q?EnfJcLD0p3cy2DU3tHyhCOoXR8ZCmX1t8c4EWPb6OfZgpVVvBudvNPLo9q6h?=
 =?us-ascii?Q?vxfsU/i6jw5gTw9fzwBg78vh38A6DZIHzySkngMMUJBtzI2UYfE8b0lSNBzN?=
 =?us-ascii?Q?TldmO9lO6XXUxOyUCxh1XRvMEZHP8GZdhj/XXhF1XfhOCu77tuQG5EjOmtyA?=
 =?us-ascii?Q?M/9zxvQNqXKy5eTiEPahLV6evaxx1XNQFDHYQeOT90mdCzxDDSSVKZENlBBh?=
 =?us-ascii?Q?PUr2TbQfXRqZW1MZJXPIc/caYJfd9ANGW754JnQjEH4jeH7taCk0YVcdmlPP?=
 =?us-ascii?Q?SaQBvqisgOVS9qlbofZIB7x4uVR98AVN5S9+AjnjqzuA5bSqcin5LA0rAZAj?=
 =?us-ascii?Q?baQYQXhKrGZdF725FP+3m/nMWDyqajQ1AAmjXo36q+1M1PhgQ+AkfJwfj2Bx?=
 =?us-ascii?Q?9ehkyO1rEd4A9u1xCSeEoi0SZFi867zvpis0Z4Ie9i93knQub9+vPgMveqec?=
 =?us-ascii?Q?Kids8hjS/him8mwtEypyvOVPaeNNN9FJcZP8wLDZ6vWg22HpMLONjGLXPqcm?=
 =?us-ascii?Q?XzCQmF0VkwXzFXMDbPOUyJAVwcNp0zfxPJdtlW3/7ev6enEU9VdYnJhU7a/K?=
 =?us-ascii?Q?BTmdbsWSZy+DIVDgOxbUeuaF+IY5TK8a/eVjimuDyAUBDdVSpvqcxrZ40bp/?=
 =?us-ascii?Q?UU2UkA7OvtbmyMuYPvAWOc8641eR5NZ+cMksZFCWc2lmucp5D13NcAQSQF9U?=
 =?us-ascii?Q?2HdeXUb+4vQ9VrZud0kUBrg3RnXsAggJ7uRrGdDhiz2zxA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8N64DpVJ9aZ82nCdAKpFmb/U6n/vs5YtNa+s/FDsKlhGNoeV1Ou+ZqVg9fB0?=
 =?us-ascii?Q?23lEU4c63pgNaPAkKEeeqAT1O6XKfj4XFxc/UQBaamB1EERYiOJi8TawOD7j?=
 =?us-ascii?Q?PED1psi3VwDSIJA3yRsuPkI6LXOQ5hnnqL9AjAvMflSzx6Tx4WfNjjyhYZC2?=
 =?us-ascii?Q?sWNxLjYGZCKFhC5sLPM8Ebf2EpWBXuD5R0km8JY3R+l+IRm9QYpwpXJCoqBS?=
 =?us-ascii?Q?jYtC4nerXRX9DjD4ieWC03uB3ytlz8n0BhERbX2LKcqO8+Y84wVBxmFsH8kO?=
 =?us-ascii?Q?eRuJsgLDLqMfQGmvVOKz2rW2i9DkEfr/MJ9gpV3eAPZadlBeGxqwcvT9Y5I8?=
 =?us-ascii?Q?17g3IcGTrtOij7XTWN89EbXyx+g/6CnJOhRHBtE84kbp5dplJH1qw5N6howY?=
 =?us-ascii?Q?AfWyyfvRuaV6bYq22nQvBiqJfb3tBTELJ/gy3aM8lSJ3E5EIyD3O2aswgpNE?=
 =?us-ascii?Q?YeKgDpFwZtnPykdw4nuKUapVsf8Bh/leEAvMJ+djY82gr6PtaBTusCvZCW27?=
 =?us-ascii?Q?E75/civsFWPYpzgH/eyR4bgMMB1BBoXaCToXnb13MO4plczPF4LShXC0Nc85?=
 =?us-ascii?Q?wpDOzhJLLpg3+xWI9Px9dX8XGrBYGnm+80k1sNZ8RMKH2nzqTlpPfx+nMatc?=
 =?us-ascii?Q?fg+3ctDkTRzXqdONTPMu9YD7cSYf3aQIWO2vKgJ61uqd85Lf2ZK7gfzQ2lA/?=
 =?us-ascii?Q?TI35dIbCBwY10qNKrFooGcrfrLCnW328Q4eH8TiKs/KHv3GziBrLx5VIpW24?=
 =?us-ascii?Q?Hu725Oqn14XwrRRAvmxM7s4dBoZ9dUQR6vkhBM3W6cMcdvcI7lv/rMeOatXJ?=
 =?us-ascii?Q?uP6cj0KeUwxz24QBg3oKb2Z0hdGNC20zTUM/GUQdRm2drM1eV6053bkg/5+L?=
 =?us-ascii?Q?5GldsQN5VM0pcaVmF3M2LB9BdkWmHk88vXLXik3TrTvLg0sV3dfi+3nhfZkL?=
 =?us-ascii?Q?V5oWYnBaxSGq5U7cu0+koKYJuWrQxRV4JPqZuNP/7lDUZ6js2ZVpZrzx/HeM?=
 =?us-ascii?Q?TAeM3c6ZlLK0RNNTEbDvwhuK4IVfel8I7/q06UhDEW1eC4AzCjU8J/Rqqu/1?=
 =?us-ascii?Q?dY1BpRdvFxS3fv2PM2cd9ZQVnW4M9pwo25UTpCCiiuySQ4xks1hit0DUpm+9?=
 =?us-ascii?Q?ReWWSCYhjJJVAmPRAxSENexGxwTlkpdsyCOrSOLAnRl0pm/FrEhmktlYa6rE?=
 =?us-ascii?Q?+HfHy2USspBkzApuH5e+OHfSLDtH+q7usFG3NVD6+qAFmnefB76uyEyUBqiQ?=
 =?us-ascii?Q?pLflN6eR+HLx+Y0PKGUWXcousRyOpb0jFMIpyVK7wYSa8S9AmfpZqcxJrLI4?=
 =?us-ascii?Q?IQCbm/h2AuS0zrDM6RnKUXlDyigl62dBfxWxh5KH+QUCVG8hXB34imEfjCU5?=
 =?us-ascii?Q?sHt8O1bryHUK22Z9VO4hRF5QtwPCI+UoZHfONcv8RdWPTMl1cnpdm3dCVYRU?=
 =?us-ascii?Q?ZOm6VOMVHIlo+iErbgrrq8Z20TVUGGttdqIEy0Hvo6uAY/M59LHGx798BxQe?=
 =?us-ascii?Q?0gtwXiaO1TC5Gg2iDlqouzjP//pwWEPxdt97OX1U4qiJdY2NRv8+pPWCyRHY?=
 =?us-ascii?Q?VWq8wKC6h1Nm+3ailUE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8bfaee-c2e0-4ed3-a633-08dc75082dfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 17:55:17.1232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7CLylZY3/ouJEjWo9b1cPaxf6F1gu7xwsThG3FVsOSmzaEWU0iaFdlVLHkQAURAw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199423

Steve, please cherry-pick this to Scarthgap.

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ola x Nilsson
> Sent: den 14 maj 2024 11:56
> To: openembedded-core@lists.openembedded.org
> Cc: Ola x Nilsson <Ola.x.Nilsson@axis.com>
> Subject: [OE-core] [PATCH] devtool: modify: Catch git submodule error for=
 go code
>=20
> From: Anton Almqvist <antonal@axis.com>
>=20
> One of the git submodule commands failed for source extracted for
> recipes using go.bbclass.  The root cause is probably the path set up
> by go_do_unpack which makes S and gitroot not match.
>=20
> This patch does not fix the root problem, but at least it is no worse
> than before the git submodule support.
>=20
> The extracted source will still have two .git folders, one in S
> created by devtool and one in the go path which will contain the tru
> git history.
>=20
> [ YOCTO #15483 ]
>=20
> Signed-off-by: Anton Almqvist <antonal@axis.com>
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  scripts/lib/devtool/standard.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
> index bd009f44b1..05161942b7 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -904,7 +904,10 @@ def modify(args, config, basepath, workspace):
>                  (stdout, _) =3D bb.process.run('git rev-list --reverse %=
s..HEAD' % initial_revs["."], cwd=3Dsrctree)
>                  commits["."] =3D stdout.split()
>                  check_commits =3D True
> -                (stdout, _) =3D bb.process.run('git submodule --quiet fo=
reach --recursive  \'echo `git rev-parse devtool-base` $PWD\'', cwd=3Dsrctr=
ee)
> +                try:
> +                    (stdout, _) =3D bb.process.run('git submodule --quie=
t foreach --recursive  \'echo `git rev-parse devtool-base` $PWD\'', cwd=3Ds=
rctree)
> +                except bb.process.ExecutionError:
> +                    stdout =3D ""
>                  for line in stdout.splitlines():
>                      (rev, submodule_path) =3D line.split()
>                      submodule =3D os.path.relpath(submodule_path, srctre=
e)
> --
> 2.39.2



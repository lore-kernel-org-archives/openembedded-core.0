Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5EFE82CBB
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 17:33:16 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.53])
 by mx.groups.io with SMTP id smtpd.web11.23749.1695835988370668534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 10:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=pYPI0+mh;
 spf=pass (domain: axis.com, ip: 40.107.14.53, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDssYpn8WMsKRK1uD5MTi/WhcZEHUWifobYuQYAZhxx6lWkvCNILfqJ+o3RL8C6AJJPJ/ucpMlt0RijdqiMEnrdiZLVwAoIFZdoKhHLLN9qIRoiDUAEQCLj8mH3Ou2B/c3IgcK5MhtZr3dWRhp3yyiye5s98N42aMiCrmCMpEyjguI3NVzgJEtbMq7yAm+wPYpDT6Lb6qmF5lC+s/Kvrdu6XuwprBuANk6g9rR0vTEfmJGnXDOdOKVeokzEzDlTuCVCS7IzoSHsZyrZ0ohlvuvkUHmw0T1d3n0Dflgn6RA5HWGQfVUyVGPskfaNb7s/dRmX0Q611PDldZ4NC/D28og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctkmsPgaM8TSLew71TPPaW2gCQw9RVvlsvPuTnh6m5A=;
 b=V5hJXU7s9zx30V/dd1nLO8JQObSWrkPaX56OoJeCSy0kzTREqjngW/Cmj24AlLGm72w7fZfXEoijgpDkIHoptsPCjodff2fkXiNd/+GcKoz+lHDF8SVz2ZiNfwLc61ANNfhJp3sEkHHCKJFeLYypJC1uyHmcIE3fQEVE/9v0UCr3f04uI2WrWo+hTanZkMgLsa9Dcu746uRdpqCr/5ZI4QXJIu2mJ0ZcA80TRFfZ8jwm9TcXBYXOWECxLoSNsRCJGTDRSeN2GAaZ43ilyzjuqREyJdjnZ/KYECux6lIb7mAqjtVS5lyprEx9aM6X3DS5l4kVpsqvw9aEKpw5QcbfHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctkmsPgaM8TSLew71TPPaW2gCQw9RVvlsvPuTnh6m5A=;
 b=pYPI0+mhkmDZNwj9CdTjUGz8X4ZINM7CjG39CMujuFbu/vt4NVZo9uWLoj/54Md4YPIZAKf6clZGE4f3tBAkq4wkU33BQpRjWvONEUDClTTxwFU1/TixYhkBMBMbiLS9KOSwO6375XG4EKH2ZWkrXECrH0Yu8vzwx8X61WD+uDQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB10027.eurprd02.prod.outlook.com (2603:10a6:102:300::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 17:33:04 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::46e8:4a9e:ea9a:7861]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::46e8:4a9e:ea9a:7861%4]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 17:33:04 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Sean Nyekjaer <sean@geanix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "kasper@krinvent.dk" <kasper@krinvent.dk>
Subject: RE: [OE-core][PATCH v2] gcc: depend on zstd
Thread-Topic: [OE-core][PATCH v2] gcc: depend on zstd
Thread-Index: AQHZ8UJOYNlFrS4KbE20/XYAVzO1r7Au7S9Q
Date: Wed, 27 Sep 2023 17:33:03 +0000
Message-ID: 
 <DB5PR02MB102131F70E8DB3BCE3E8E6D54EFC2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230927125801.3962397-1-sean@geanix.com>
In-Reply-To: <20230927125801.3962397-1-sean@geanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB10027:EE_
x-ms-office365-filtering-correlation-id: 811a4166-555a-4db4-acef-08dbbf7fcdde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /QTfAe5Wwudvtw4DalRCiApLI22SgqsW5+qv5a3ex3pTVhtO3LLLwENLh81klbRtKEd79q211+S2VbBRW3qkYeUPgY29r9h+2RXCtqlz63SoewaNlz+jOJC5Yc7Kri30fKLu1D59Vwe4es1J9GRAwh7CfV/gY82CRzL0FLWY1h/BlFWcXeBTMEUyyoIvzqDjr4TLi1loWjxfGlhkEjcgWpB/G0JtZjLzR8aV1Cd9o+NIAZpxKgbuGu0c6W2cAeUwePMkQjT4hfzI4Bq1YNFOsWiINz2opF2RjGzCRumT8oGkbhkGowao3P2LX/0DR1938UtUhb2cC/WKc/SzCL54uR0nZfn+KOgo0x9IyMUyNtoMwEwsSVBrNvGrTH5xFgloz3dnZ47KfDFQXBl+Pn/s6er6JWZ2QS82MlyM2nR9bUyvXD0MuGhWhfL+Zd77Ro3lMTDBRPsScus4GKS/4RjIxoXmSuEsA/TnexuR0gN4A4axu2Bp5ceQkpZKCHnlkBQxUmndGiTZ0PSShbZWVX96LwSScE+Ali7UEGMZtXChfCt2lIhOmg+sgTiJr9Qgfe1Y5h+dA8EltLfe8wELxIATiWK2oqzHqkG3DosGHYxn4+rYSDae1mPxXKkI7jjN6BVd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64756008)(66446008)(66556008)(110136005)(52536014)(66476007)(66946007)(5660300002)(76116006)(41300700001)(8936002)(4326008)(44832011)(316002)(8676002)(2906002)(55016003)(33656002)(122000001)(478600001)(38070700005)(38100700002)(86362001)(26005)(53546011)(71200400001)(83380400001)(6506007)(9686003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OihlUbayMsmxE9tMHO45ZOLbQ6dCHw/w+gq9S6uRKAPQPbYG9aXjYwu/5xxw?=
 =?us-ascii?Q?cD7Tz7+rvW0V3wGEoZFQBmiGgMwiJOqLlqMIW2wPt1Q2eO+8FNj2EYWMyguG?=
 =?us-ascii?Q?HoM4eQz0PyxlLbHIxYVsn7SGFhWWqjUfRB0dP3D1Ojlhijv+ZwOAEHVSM2Mq?=
 =?us-ascii?Q?RGAWy9Nri7ZREYM4B2quCi9b78jwfH01ik7zQhONR+Fak3Y9yLEMk8eH8QSC?=
 =?us-ascii?Q?cMHhbbQ6D3MMJgsC4zQu3eV0BTbUWJGZTq9caQ+ILujLCNKhWnsGqrsMHSHf?=
 =?us-ascii?Q?LLphznRvUVi0PYFxu8Xckt9LyNuFDmmelVyCeiiR3jDGkBd2F6tOvuLIajMr?=
 =?us-ascii?Q?oPXfJPSLZM9Ls6vTbp5PLxdEeR/qDy1WwwMKG81VZRyfXgbzvwfBq6X6jJbU?=
 =?us-ascii?Q?50gKEigbHNuelkYP9Si2Awk9zAl7jfG1k9vsocg1wMmSxZcOIofgtcNpIx1f?=
 =?us-ascii?Q?hqYFkaOLjcOw7SsZ02gfL/2wD7yMKE8PJ949hVMQ5jL26IrvqEN4E/64QxpM?=
 =?us-ascii?Q?aIHg95ievbW4ZKGVI19/BQeB9HHIhSWXwOk+j6tVpu9K/amQz14LN1FJnsy5?=
 =?us-ascii?Q?YvZEWP1ZV1JvwQpX3uPUwYFIH39CLiZTdO5AevR/4/b/9Zodoj1iWbRXq0sM?=
 =?us-ascii?Q?3f3mC+A9o2bgNkTqyZUAsCyXpfP/fTrSB3HaWQL/1FIlQjf/BYbNJfwACplH?=
 =?us-ascii?Q?rdrMKm14BMb6QCQTzQqq1NvDkWelNHnJGagdLObcJP7ptNDnpmWY+mtDvtwX?=
 =?us-ascii?Q?5xGYPrTQkA+FdRaY8adXjAJNy/aUJWSZBtrmwdPlsDStwIx8eh5e3NcjuFeo?=
 =?us-ascii?Q?aUH8+Jih5HsFdkzkHisNYrTNWnJIeKCDOk0ubPpNDtw4of7nF0rOeGyb5w3/?=
 =?us-ascii?Q?Zk1RROZV0RyddWm38Eo7ZWm1KkiRjloagnZnSVr+yNhyxzoN0WZRwg6GLQzc?=
 =?us-ascii?Q?XSyI6/yMVZ4h1K1zXh/NkCgIxOIuJVwRZgpOHlOeafgFrxYhuQtxZsCKpZel?=
 =?us-ascii?Q?jke90NkIxCqYCC2Qx9WmgiHZLer2Qwkau76WdJ+2ALwNcxIUY0RQhsXOLixd?=
 =?us-ascii?Q?dk1BKR3piJZBxQkwlxlWdias0hXxUWd479CufWpu7sb2Gc3MXw7BPKaczQQ/?=
 =?us-ascii?Q?8y8OzXCNt1XljvjfzaSNUoZiK88bHeIM3wtuAtpU7dz+c4dHofi35pvmhdQE?=
 =?us-ascii?Q?7yhQWvM5fP1AwUpTR9p9c2nmxanSbzgkqflnOB2MV3qv8cBE4MfhtNK5SBqY?=
 =?us-ascii?Q?L298MQ8pZSPMds5jefvoyOJW4j6bZXmP5Bgi1jCaaneNrH1GtUxNeahiST+m?=
 =?us-ascii?Q?ZQ4uWSx3Zd4cmbEvHMw6uPQOBoPPZnVRQYAO2Q9MtjrBZ9BuFZ3zexqfFCAd?=
 =?us-ascii?Q?MpZO8ipKgJ3V4RrkrtFy4FHjrRNZTlffBzBRzSrn0sqLu6V+nePpfOjt659Q?=
 =?us-ascii?Q?Tsa6d0x3hCTivdPhkKFQsZkyl70DWfYzx7Jhinc2rrBF74ESNN1kca58q1l4?=
 =?us-ascii?Q?SfasAq5z+/BaF5jnt02UMh+EETq+Hkeda+udBMy/t2CEu3Hgm88KyuKJMEtV?=
 =?us-ascii?Q?eW5jGhzgmOQsmlw2K44=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811a4166-555a-4db4-acef-08dbbf7fcdde
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 17:33:03.8655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7DA5ZrKLwCle2XUYVh7X+lQ9J64l756DObJM4GjLYodxhnp1uqOVmpCXq+li68uV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB10027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 17:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188337

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Sean Nyekjaer
> Sent: den 27 september 2023 14:58
> To: openembedded-core@lists.openembedded.org
> Cc: Sean Nyekjaer <sean@geanix.com>; kasper@krinvent.dk
> Subject: [OE-core][PATCH v2] gcc: depend on zstd
>=20
> Add zstd LTO support for target and nativesdk compiler.
> This also brings gcc into sync with gcc-cross.
>=20
> ---

You do not want to use a line like the above in your commit=20
message since Git will cut the commit message at the first=20
occurrence of three dashes at the start of a line. I.e.,=20
everything below until the actual diff is ignored when=20
applying this patch.

> % x86_64-oe-linux-gcc -v
> [...]
>  Supported LTO compression algorithms: zlib zstd
>  gcc version 12.2.0 (GCC)
> % x86_64-oesdk-linux-gcc -v
> [...]
>  Supported LTO compression algorithms: zlib
>  gcc version 12.2.0 (GCC)
> ---
>=20
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta/recipes-devtools/gcc/gcc-13.2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-13.2.inc
> index d96f3171e4..359db1e278 100644
> --- a/meta/recipes-devtools/gcc/gcc-13.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
> @@ -10,7 +10,7 @@ BINV =3D "13.2.0"
>=20
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
>=20
> -DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
> +DEPENDS =3D+ "mpfr gmp libmpc zlib zstd flex-native"
>  NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native flex-na=
tive zstd-native"
>=20
>  LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> --
> 2.42.0

//Peter



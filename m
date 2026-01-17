Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518ECC9832A
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 13:38:40 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8082.1768657118712179307
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jan 2026 05:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Fkp/GG7f;
 spf=pass (domain: axis.com, ip: 52.101.69.8, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9NTFei49iz3whPrvBDRxQ4j4WX7s3Rp1catCqOPcX+zxXCulJbWVd7awyyeLU8gFhoxah65I5KYWuoOt/leb/1On+bQOjdeqDGsSyP5dXsAzpjtXIvO98ilTu0SpDGsuiOmSvx5clOW6ctxf1Nso7ZruFJAoiBuZr6sBpUxdDs/DTODXFMfEz6IL0lbl5wtFcAJXk6Hlv2Xh5LXpGY5J9eH2iOc3PNlNpUEgSqUaktjw+MW8kAeeN9EcMBncpJVfp7O6XOXXfgcdRTkJuGaV3RfEG1YvHsPmjTnZ6SH0/mNO5n9B4ygRUR5iYqS8EjbB39HSb4S3zPiOIvN0GQGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6hFKpCgxM6F9IIMurmWkLFPBlHQT1xkZXiqLkTituQ=;
 b=nXF1Jss0Z/nyxosgPQzD3dTbvRxCj2DVvf5h7W91ux9aB/K9G/GOYxbs7pzZkG3hpZzrOsHkda+d7RF3pc0wdWaMrNJPI0aDw7tcn3qDjKrsuiM81uyi5G5ZHnVF+cXufPw637UdlvyHuE4DpVSVKAhs5EJE73NAana37ME3l8aoyfRzMZKiipO9TuGK7Tk6gkxkMaLUzg4JG9OpgnCTnhaxRj2qv9/gH/IzS8fUO22ifcSQghdWmBHr4Sb4E1huPwHX30/LFWH6IoOvoNSRmi8wwRf00k0365mHHLr8ZSDMdDNRgdFuo66394y1elCvCV77adKrCw6xnoZmjaXR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6hFKpCgxM6F9IIMurmWkLFPBlHQT1xkZXiqLkTituQ=;
 b=Fkp/GG7fvE7yc9duTGI/hwubTqchKGhL6Jf97NnO+EYJm+mJux+AEGKlc10gPZjwZIhaZZvzRHd1ZRyokgTZ4w1RdoTiPCm0PoSSQBG8AyNAJ2QF1ltEBe4XPalzU2gQRkPAqAaS5WMaqDjSwL2yloH85A2EXhZJy6i0/8KtOww=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB8PR02MB5868.eurprd02.prod.outlook.com (2603:10a6:10:116::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Sat, 17 Jan
 2026 13:38:35 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9520.003; Sat, 17 Jan 2026
 13:38:35 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "valentin.boudevin@gmail.com" <valentin.boudevin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>,
	"jerome.oufella@savoirfairelinux.com" <jerome.oufella@savoirfairelinux.com>,
	"antonin.godard@bootlin.com" <antonin.godard@bootlin.com>
Subject: RE: [OE-core] [PATCH v5 4/4] linux: Add inherit on
 generate-cve-exclusions
Thread-Topic: [OE-core] [PATCH v5 4/4] linux: Add inherit on
 generate-cve-exclusions
Thread-Index: AQHchxxFoHIYAg+J+kKiJYR++vtJFrVWXlLw
Date: Sat, 17 Jan 2026 13:38:34 +0000
Message-ID: 
 <DB5PR02MB10213469B91CF5E5AE6C84ABFEF8AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260116190520.118714-1-valentin.boudevin@gmail.com>
 <20260116190520.118714-6-valentin.boudevin@gmail.com>
In-Reply-To: <20260116190520.118714-6-valentin.boudevin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB8PR02MB5868:EE_
x-ms-office365-filtering-correlation-id: e28168f7-acca-4cac-7dcd-08de55cdb667
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?JjQhZxvuOyMKMGOyWqnr9Lwium99S8JxMUGBaxFQJaklmThdw4qxkX2eqpPm?=
 =?us-ascii?Q?sjED1xt9S+xTsYOBdb/TixDaWlABh7ugXgTofh7uigyW28BNb9nW7jhUkIWe?=
 =?us-ascii?Q?k/sEdZWnOpaE5hh73rdIDFN+3qcct7Cg3SzVOJ41eBErp5oVq9mQnf/3W78J?=
 =?us-ascii?Q?DHDbiiVh5hbQKScTEOSJi8Bkue4xLTOpFPqrCslaMBwqtEBK1QTninh8VyoY?=
 =?us-ascii?Q?xpYv/zMptzSfXnRTaYiLA/kc8UX11GnayCwEImjBiTkBi2DFtTQM5xBVOCrX?=
 =?us-ascii?Q?8wL1tDAe6IB9eu48HzxcCMfbqlaDebr9S9UUQW2vdpjgRNB15KFyM2ZuxFWM?=
 =?us-ascii?Q?ZSUvGOlp3SjB58FEOTScCIQNJcZplj5ET4PXob5kVgHEuQ+26QkpWVlUeGm8?=
 =?us-ascii?Q?Qywv8fTvIMgLIPOwj87Ichv3kbue/7TFEwZcbe0HENlegWnZGU4RrxaOqowZ?=
 =?us-ascii?Q?4H1XXI3cFlCqISlrwYqBWJSPHW9S06sVN/iew35LGzs5d91ByWcTkS3zHodM?=
 =?us-ascii?Q?veaSntSVHRIPZ7VBVlRNVQtAhIdUFTP8/EojcwfTi/q1g+xdx0i9kT0u4k/f?=
 =?us-ascii?Q?+zM1fx68dFW1bOK+uSdGCujoE4kkdCf1E2+zXEziES0h1u4yPSjNKIPG3hUT?=
 =?us-ascii?Q?vqCePGypWPJoA/POaZJ9vJYqx9Ln/lH7+RP/yyVuQW0sVZ8NaKrH6oSas1RB?=
 =?us-ascii?Q?p5TZbUmkH5VDWyV9DpOqIHnXX8+nGP06Q3232xn4o3yooQozjZTZLbIEX7FJ?=
 =?us-ascii?Q?erN3jb0VFO7+DrJZdPSfoVjugt1nTkAGeT8AhS64tgpu9BQWen36AVlue/NF?=
 =?us-ascii?Q?ZwCfRjh5Q3bSDHL3t6VuDBMOAc1TI1KgpLcrkv3MaEVdZKDdPmMwvzFsg+Ca?=
 =?us-ascii?Q?2GvhInyp9neLnt+3j7Ji3YPmmwelat48T7cf5Yli/Fb/nLVtulFIiNpgIeWs?=
 =?us-ascii?Q?hD+s2s5o0GWeCEDRDzulAq5FCvAD9pkG7xfbZJlsiygcn8wHQpUD40cP+Xlh?=
 =?us-ascii?Q?cBNtoZbpEcC6umXhX01fuwDzsecLvC1HR4Tn2VfJlYTPwM4ZtJaIkuvFriq+?=
 =?us-ascii?Q?Jok46g8W5wzSN4jcLEwTu+pM3cL24w5tFQd9YoABcz6VfGim930UYbvfhhyU?=
 =?us-ascii?Q?v0tB2Ltt3UqF7khLO1RMiSGh++nkvy7y54EqP5OULeCIOuu+3nZ9j/a2j80T?=
 =?us-ascii?Q?PaXLL+rbBYUIP1SGJJQnt8ZnfOnkShOTWkfebwOpNQKXlC6XBEVe+Q+uJcA2?=
 =?us-ascii?Q?a5GhHUexq+3r5GZKnm8x6VoEDRbSqpV8YwxXpwDGx0zTcMAOy5CwPK7SZ8RE?=
 =?us-ascii?Q?RHNkOwuZ50o5tdi58K46fDoUKDnFbjtUx3JzcD7ca20H41WDT/JcL9lVgKJc?=
 =?us-ascii?Q?1MIfR0ycgth9dfcntHN5YXmvwwbtbxIRyPRAAaGdal/LX9GynIssa3cfxkSj?=
 =?us-ascii?Q?7PazzkWwXjXjfoMuWxzlfkXrc8l1PEu41qcok9ORT/u+xE2JCoIfVUsC0B9c?=
 =?us-ascii?Q?3y5R0OAJzZG8AdGl3/GuG1pepYhOygpAIIE4nZosOcXsx6kNlKCU7xwDkDmt?=
 =?us-ascii?Q?g14nQHbSUnqsUmnIHQE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vkXkUNYaiSQsirEWQs2Mx0dNsxDx24byiCrj1b8Hzdq+wlkDjmEF0rPQoItS?=
 =?us-ascii?Q?kl+iNZiocG8aG2GkR+bx2zjVoJqMKeWYlSOZDvI6C4PMnngp6P7L9s5ICS/T?=
 =?us-ascii?Q?xjrU4aWu2SarkM48rZROCpEI+eBdpnKwkv0TFk4W3j9YPfO/bCH6BpfOHXrn?=
 =?us-ascii?Q?VdLWLfBuUZa8+ZW/EiRYTuE5m9Yf6WGDrwRnz08skHnkOXQPSO02nxECsHbM?=
 =?us-ascii?Q?xxSu8bp4/G6cdbf38GWUGo/gezAj/ZrZFoK/NrORtcBnXVVxbgpS2o9f1czy?=
 =?us-ascii?Q?LTKauwRYDAIhKy6sR6X0gG87MglJ+zUhjUs7HeMej7YWNJBVkJMpRiYYU+4o?=
 =?us-ascii?Q?VGshib9r57sFCYG5kfVsazsl3+zYeixp2/tHdAKhDaQRvGsjPJi3J0z2bYuE?=
 =?us-ascii?Q?BuwhIcOe/o7MatRtA3DkTOLogakDXsL1vv2qcke1NILjzpuPUWJTxQkA9N+X?=
 =?us-ascii?Q?pDmHFrLm+jOfGMd9ItXt02cM99p0r1uXEGch7mmZVO6fPOR6aUrbm9CgYa7B?=
 =?us-ascii?Q?AqSqcocRmuxBWH4DGL6KFp9o9xi3n3yllcjaauuEfEIZ8mTVrgok3i9PcEgg?=
 =?us-ascii?Q?P38fcqKwpr0RoUPCJq4iMTSLbxpr3ceS5+DeCVuCZNVYtHdpehAsOp3R9xSG?=
 =?us-ascii?Q?957xdV2UH78VmXIQPNBV30R6WlLKLl+9LNaoghNfb8tYb1sJ/iOMkr6wd9Ze?=
 =?us-ascii?Q?SYEYeevIzXqh+XZyLhGh6Mjl+p25141k+Kj3sqKW9JvBQIwbb9+M87uyv76B?=
 =?us-ascii?Q?nNx81l2NNY8LvSRO2ASFciPnxg7q+SWIiyLOzfBdAVUfkaNtTtzudUEr62is?=
 =?us-ascii?Q?slkzPnoUJ4LskRaHOuwpB3QJV4xQWd97AqqTnEyk4oqwBD4neYZVHqAHhz6a?=
 =?us-ascii?Q?ce8JjuUEG34pHtZdNjJUhFYSOkMC3yLslf1yNb/lblLyrn9XOQ1/JpS5UXBo?=
 =?us-ascii?Q?CVHqlU3fRkHfLPXQvtxAYagP4KZk+JSZfeciNfPqs95rps1wl6Fy+k6XFXcf?=
 =?us-ascii?Q?wGHHwioJgMf9rmib8WBO/7fjofY6UI3ADMdPqcF3Bk/XhAgzpARuzBcRQOqe?=
 =?us-ascii?Q?dcnbRSMhxtVOWy8YQDYrCuBc+z24mFYwuziJhBjfzaeQlK0IpVrnPwuOVZRF?=
 =?us-ascii?Q?4aPzx7KwJuqObRWmrIcSk4SxQoMH29iQCggq68hcZONYws2Ctr8MQaEA6jQ2?=
 =?us-ascii?Q?JJRKc1/cizdtiGl48/eAK7VFI2Vd+UsSd4kCjnHg1AHIaEdfVsEGDvhixJFS?=
 =?us-ascii?Q?izUiVgeYxnTNL/W+nZbIjHFBCxoSadBegjUPOGznnZDQkAb6tXhiCWSDb6VM?=
 =?us-ascii?Q?98leI2Ob1yiCT3K1CAPws4rOfI7rYYj1lChN4xEm9y5LbEpjDmtagwjFP4Zz?=
 =?us-ascii?Q?KF6bT4BIUyocgCuvB1bWQ95bc+dRa/cOAKdTuEVAASOyvz6+EApOC0HmhIDW?=
 =?us-ascii?Q?VXw2cm062nGD4mnGxy32G93mbXdu8DEG7FuhF7pYrDp/1WGbWQjPl4HiKNBB?=
 =?us-ascii?Q?WYwsxZ5l7aTXXLA9QbZCHmOyImTjxFKETjhpZTrhq4bb9TseNwhAcaq/Gs83?=
 =?us-ascii?Q?5Iyqa/LI6AOYul4MnVcXrIiqRwRevf82a6s5Mw+RWvt5GFRnyi+7bKTWRXjN?=
 =?us-ascii?Q?0t02iRu/vPiVhb6paknpihE9HLFa3Lfs2aTyRwtEZ6kDkp3huwqWeBLO7Lns?=
 =?us-ascii?Q?JPTCzhMD9IetKMP0nEY8Ook+7sA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28168f7-acca-4cac-7dcd-08de55cdb667
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2026 13:38:34.9821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pBJBXyO5x3Jc+IxD8+plsTTmcohm2tslZk2cVc9Wdlqz8pkDXmTBW7g8LWoqFIx8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5868
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Jan 2026 13:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229574

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of vboudevin via lists.openembedded.org
> Sent: den 16 januari 2026 20:05
> To: openembedded-core@lists.openembedded.org
> Cc: daniel.turull@ericsson.com; jerome.oufella@savoirfairelinux.com; anto=
nin.godard@bootlin.com; ValentinBoudevin <valentin.boudevin@gmail.com>
> Subject: [OE-core] [PATCH v5 4/4] linux: Add inherit on generate-cve-excl=
usions

on generate-cve-exclusions -> of kernel-generate-cve-exclusions

>=20
> Update linux-yocto.inc to inherit the new kernel-generate-cve-exclusions
> class.
>=20
> Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-
> kernel/linux/linux-yocto.inc
> index 4d0a726bb6..d627afa3a5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -5,6 +5,9 @@ HOMEPAGE =3D "https://www.yoctoproject.org/"
>=20
>  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be=
7cd7"
>=20
> +# Generate Dynamic CVE Exclusions
> +inherit kernel-generate-cve-exclusions
> +
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+(\.\d+)*)"
>=20
>  RECIPE_NO_UPDATE_REASON =3D "Recipe is updated through a separate proces=
s"

//Peter



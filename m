Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0431D462A7
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:10:01 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.51])
 by mx.groups.io with SMTP id smtpd.web10.12542.1731506991144084352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=JYUrd7sH;
 spf=pass (domain: axis.com, ip: 40.107.249.51, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7pXJ96Vs1eqHnA2lKVfSg2YVrd/hxUmH6/WMMCKgrJFGVZ4id+Osb2dgp6eZR/fOqiFtancH+u9P3uA9S4phmbYJCEDKV9Fq3al1OPXWj3HLxCjiS7z+e821IL8hEiOkVd8rsoqwMesO0QgSn+nuNS82ForT3RSF/OeOBqmRAjNyeCpklbFlFs8NTNg6iAxl3mCwBznrT0k6eOOfFoUIelJWtUJZJmBSWs56l0my0t4yJJ5s8f3gFJke0Wxgx6Ul5IKrrktpC/MWkBnkbVc4y57uZqWEj/TSYW96wSvDIWtZaqSNjwObqLAbGEOdh5+j55qBQa4Y1+dLlOP8a6R3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NX5biBhjWRbuB+AJdDJjAiuUBTGSWUnXNLn8I1Yvhzg=;
 b=oKlgC3TGKk1/79+HEWgb4wHGqDqxzpc0H3EmgLkouDRx4JuvaudHXKCvF6Is3X81psjuilcmoBxJLU5H9WOXuMPvCK6y9T+4zFmXeM7m5yoOCcaAfEDUBUpKCZCEkgRUqdwPKjT3f2yJDDvMRISvpSEfP/6uVmnURYj9rcesxWUZDHzRmXaZrnOPozOH2l0/4sMHjXNFyhEdMc8lm5rxIDsFqeToQRRGV/ochWnsgno1m3pwrEFusbzoVOWzaeWaF83xIpnETX9lbx9TThnIOmlcrU6NVkk2tRCuibe/LjK7h+EQCApuqp6o8xXG4pITCk1oKCzNFx7iADRQc7D7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NX5biBhjWRbuB+AJdDJjAiuUBTGSWUnXNLn8I1Yvhzg=;
 b=JYUrd7sHfIiNVepa8xPU2nV9wYEYqea7g4mJ+Mmyo7HiNoGxanjWPvqoym82toN+dx0a5CaAd4s0kB4bvUpyme4FyswBwMR5nMeDJmm96BhkaQKmCQ8mc3tfTamdEsp0a49LhNJ2YTEZFLf0gMJPMaUQmE14cmMnv//3fwtWlnM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB8267.eurprd02.prod.outlook.com (2603:10a6:10:3a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Wed, 13 Nov
 2024 14:09:47 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 14:09:47 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "libo.chen.cn@windriver.com" <libo.chen.cn@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] rt_bmark.py: fix TypeError
Thread-Topic: [OE-core] [PATCH] rt_bmark.py: fix TypeError
Thread-Index: AQHbNEBPaKoNxWs/LEaMNE+g+K8ZUrK1PuXw
Date: Wed, 13 Nov 2024 14:09:47 +0000
Message-ID: 
 <DB5PR02MB10213D827EAD9FC41D6F9670FEF5A2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241111035215.1633406-1-libo.chen.cn@windriver.com>
In-Reply-To: <20241111035215.1633406-1-libo.chen.cn@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8267:EE_
x-ms-office365-filtering-correlation-id: ecef6387-d068-46b9-c189-08dd03ecd4b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?8j0JYFcFuDdhMLv7eQy7RFL1RQqRsgLw+VcTIC6woq5bULVrJK1BCFbwNo1p?=
 =?us-ascii?Q?gb3h2vE22JfeXeuCICPgvzhNjfDxRaEDpBHyzqcrPyNQbbqkicSPqIfggMRc?=
 =?us-ascii?Q?kH4K8CZBg7ErRevdP4O3mnWnGIaG6dgBJmitC9S+ZAD2+Kvrf7zvMm78SgQ+?=
 =?us-ascii?Q?ytWxMES1UXrSz2fdtTXdgl2QWBMFVBeDjZQqcG0qSA3s6JYEsX+jI7l83Wq/?=
 =?us-ascii?Q?v5YIgIxKF6+zt+rSYx9kmRmQAhiAIdmPXX4+RSxi8m4dLSC4PfMVej6SymJ1?=
 =?us-ascii?Q?BNpYdaubAwi5XZUe38ZMIs4s2XlLSMJMs+XR7EHMyFJRgPOJHj8iV+979pcC?=
 =?us-ascii?Q?hAf4xXdIO9AiTbr3zyDwBFIh6Pn8Js4tMSkWlGRG46zIoX9BfWoOZdmCU5Ub?=
 =?us-ascii?Q?WZRfowcz3xYsGXRyPz18uqbS6oh+zMi0l2wtf3vFIxX8vqDQF0zheQXPoXP1?=
 =?us-ascii?Q?cxf1bP0yGP5+0Kj74+BzH6rtuZLwWq8MtYdDM7L1vEn3ukrr1Nyjk2q4Vbil?=
 =?us-ascii?Q?qbFNjhKLIvwZFv6E/3zQsg5rmA7V9N36NesK+qoryxQ+fzF/KOlidofRkObX?=
 =?us-ascii?Q?zBF3ijaIkICm5i+4IwduhNYYTolx9vU/IuhxIbU+AlpuDQmvTVh6naNtJLKs?=
 =?us-ascii?Q?TPdxPWi3bJY2NU05nb5KhMbA47eVdAWXUqFJZ6BgChY0tIYoiVujlQj9MRby?=
 =?us-ascii?Q?VdrR5vgEBVeqeqWZxVz1HsMpzYGQnfuSnjCDdtlOCeJecFxhsGI1urNGkfS/?=
 =?us-ascii?Q?fB0FH8eoGZTowCpjFKvZHh2rsYy0mI0QOXl0OkBwium6upxmrFVJIRKcWjwv?=
 =?us-ascii?Q?JHKPNFNGsRjTBijK1pmHp3sAv1uu9qp7opnKuYrq2ZJF4EXdigrEzxNAgWI9?=
 =?us-ascii?Q?uksrZY2lADF99qFzLNZx0pLDWL1ZBumZDs7NAQg//Vqx4kN8FUFL7KFza4Cj?=
 =?us-ascii?Q?LtJgKCTNWLJs5wI9P5g1p6qsvzDe0cq1bZsbiCoxkBvQ7/eRVAFGAjAdy1kE?=
 =?us-ascii?Q?j3ViM6rJ3ptWYUuRdMt2JabWnPE018HxszachseeZF/1cKFp8rdEaCst+8Rs?=
 =?us-ascii?Q?3wOU2HxMR2h9VIGK2Cu0iyRFAC+LEGs8oSVYVOtBL9UOpKuyITKCNzBuPVLI?=
 =?us-ascii?Q?x36zYTbljEiMJ63yi+8MJyJ8dGQ+QTMoo4K8jhni7GUS2Pvb55FBx8TxPm7I?=
 =?us-ascii?Q?s6iqmJOCE5VpRGSwBgjDaJebZVHCU+N2mNxHwWfDg07Q3uKYloBQbuYS+bp9?=
 =?us-ascii?Q?HxHE3jPii0F46vn52sGOagrIgw6CWp1SBBQeIAVRGgOO51qS+iQhCtD1RxWr?=
 =?us-ascii?Q?M6lxxIW+l5YVMXpEU+SnkP8kaV2KkXRaFI3CyWWAOCEtuX1EUekEs1eh1wIh?=
 =?us-ascii?Q?g+UdH6k=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1XmBO/Lf2S90ARQcw5sly3ZGTSf+hSp6Vuiy+4PH1MzxOZcjuAEuLgpCQ20Z?=
 =?us-ascii?Q?X+7epQnNeuP9O/HVgpj36cbT0BIffGuPZ+6i2yRKunHXJvmVXc82HGmAyJPY?=
 =?us-ascii?Q?UHApxHgizaPCfqF+VYRI8aQ9YRz9M4L5ZKxJ0DpE6X4ERDFlYkqywVAAKVnc?=
 =?us-ascii?Q?i1ge0x+TI2Dke0bE4CIgEjRDIKvMrnlwrWeIxegAY307tkPxdYgD3Y/RFSkO?=
 =?us-ascii?Q?KxR4bSq9Y+KD7GvsyVEYD33nXlCUOxEUWO+412vl7EgwCXzuPapELxTVTr5s?=
 =?us-ascii?Q?MhgV+8KQwS5L6n4JLF7iXjqXprcOU9kTUWxfullHuvRgOxQbsHLj9SskyMAq?=
 =?us-ascii?Q?hcyRnXyDTgjBQVM9BiMsFI7KWLRcx/QIJ53d0q1cbYJ9f09xd4w4JeJwoV92?=
 =?us-ascii?Q?rfAPTojbak/+enXTIA/WjWqH8aK+RB0vYFP6Trxf9KUi6o84/xQE5gkAu6cg?=
 =?us-ascii?Q?KsoHL8l1IxEweJ2jxylZR5/PQtEZHzovB0RolqDoBBr50qvAMe3pu9lkgqDJ?=
 =?us-ascii?Q?izFiJvtV6eH+h3Mb2H3BUScAPoYEZNWFvdre6J7Umkde04DPXJ1xpZ94qmDe?=
 =?us-ascii?Q?Iecee14koCMvRtVmKmCOArKH+g+6bOSRHH7H/QjLXJ19Jv3a/hrL58/hT4xF?=
 =?us-ascii?Q?r6gG8atiOCCJlKrO/mcG6Z6cRoSDQlA0u13doUv1rnE6igyK1ddr7Z9SIQRa?=
 =?us-ascii?Q?DKHTzH7a4eYz5PuPezqQwpQI4wmfF7VnHq+d3FC3Ka22Uwnb9gWwM0f2O1dH?=
 =?us-ascii?Q?Ls16F1EY/CCZmHbpnmWnGpdDAAvQpY0hFV5y6JazJhZdHB/mfoF13x16kIvp?=
 =?us-ascii?Q?etfMJApxAnPlHg+ADZJe3ht7C4NTwvHpQlHg0gwdkW7CON/u9mnGrBbFcCSC?=
 =?us-ascii?Q?ZxNBG7rfJ3NBM9KW7oNPtWkxRVNcUtIiuiTHFCvqd7hrbM1Zoau4Vu+r8u5a?=
 =?us-ascii?Q?XIX07PnxXDelOSB/97yTusCm2zRHG909Ia7k6uGaRrKHMEKrbrT0QEcsD3Us?=
 =?us-ascii?Q?G5bjPCat6RRuvy/wL4HU+cXBzrJrMM4cAF+pKCz/PNq+DpFRH/WZNL1zg6ay?=
 =?us-ascii?Q?KLYEIn/A7D8ywjm/LxmtVer4w2XPQPsHdoi2d25i15Rv/SaAYz9tp7ClEvS4?=
 =?us-ascii?Q?+9SHPFMytJJflzz6oJsTeGrKju0KCKqf+siMCwmFWGtMUrjEp2bHNPz8Fq+M?=
 =?us-ascii?Q?gBduwdmIumZZ8ci93Uu74dPhq3SOW9RRqzSl/EjMklNFe72fEO9CtXwzUcdF?=
 =?us-ascii?Q?aTwPWzWdBI5E+L7OCcBjtLbhE+m+JInPlLwnVw2cN7ZkB4VsSdaomBkn0lST?=
 =?us-ascii?Q?AKxB8+U5gdWp3Z6twc7W45HzzVXoA2hOHAwLpX/VTR0n+SVD5P483bjmvj9R?=
 =?us-ascii?Q?krfLrAhmlXDyuyJULQHR2RuO1u+J2d5l7wJSwVS2p301Lx3n0zl3Xyleh5tw?=
 =?us-ascii?Q?q4GmmaHORSvBoS4Vp77yLsDhuo/e1pLkZGlTpfyGE116MQszMtqXEZq+Odft?=
 =?us-ascii?Q?RoZfsQXgKRIv6iIjdIIhkpUQtgZPt7o51b+n+zfnHAJM9nwK5JkGUBOP/rzq?=
 =?us-ascii?Q?mkhi/Bjv+Cvh3rgOlno=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecef6387-d068-46b9-c189-08dd03ecd4b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 14:09:47.1690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQqJYcfD98wKEqfqJekzGQb3DdLG/IvkZeuBL8Vwn7EmGcXoKckKwFsM4fX6TWzf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8267
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 14:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207104

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Chen, Libo (CN) via
> lists.openembedded.org
> Sent: den 11 november 2024 04:52
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] rt_bmark.py: fix TypeError
>=20
> From: Libo Chen <libo.chen.cn@windriver.com>
>=20
> Upstream-Status: Inappropriate [oe-core specific]

Upstream-Status is used in patch files that are part of the layer.

Here you would typically include some motivation for the change,=20
such as an error message and the conditions for the error to occur.

>=20
> Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> ---
>  rt_bmark.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/rt_bmark.py b/rt_bmark.py
> index 2a4eed4..19a617f 100755
> --- a/rt_bmark.py
> +++ b/rt_bmark.py

There is no rt_bmark.py at the top of the openembedded-core repository.
Some searching revealed that the actual path for rt_bmark.py is
"meta/recipes-rt/rt-tests/files/rt_bmark.py". This is the path that=20
the patch should use or it is not possible to apply it. It is also the=20
path that git format-patch would generate unless you give it some extra=20
option like --relative, which you should not do.

> @@ -268,7 +268,7 @@ cmd =3D ("cyclictest",
>  rex =3D re.compile(r"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+=
)")
>=20
>  def run_cyclictest_once():
> -        res =3D subprocess.check_output(cmd)
> +        res =3D subprocess.check_output(cmd, encoding=3D'utf-8')
>=20
>          # minlist and maxlist are lists with the extremes for each core
>          # avg_cnt is the sum of cycles for all cores
> --
> 2.25.1

//Peter



Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B70C0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 19:07:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.48])
 by mx.groups.io with SMTP id smtpd.web11.1482.1739300816927335102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 11:06:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=f929n6u0;
 spf=pass (domain: axis.com, ip: 40.107.20.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6dXQEPKqZ8M+fgFMWeMdkHNjDmTMvO2krlVTENSs7uBIuEXJr6R78Zv486uFJEtSL3nYO6dAhRa9Pr6772/4h3nBt5SneABNo/bJPXOHzGKRnFuRGAQBznrE4J/j6+7WlQCZcuQdzIacj45SNtV93OAFw7TufQxUuL/K75SCWAgSyUX5j0m4jsjyFH6rS3wwaYorxcTnPDAss/LRCnLH5kZiWACsHWlnYJpI/S433bBbBDZa8AdJpgj9/hD+GBEkqkn9vH1+HcjLLRRp0imvnmQ7/gAvZdS6kJ56QMVTJH4ch5ByPhwG9nBEkU/bayGR2+S00iU2XqyycJjysG+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEys/xir5aVmmdrrZVTqlE+HCVg6rG0q8pPy3wUsX+c=;
 b=JUZPup+3h6EQZHtszhapHwyxetfdHqe//pIg2PM8eIpV4vduoCXH2h1FVsTgetOPD5zqOT2St3CmgfQu/CagkSXgfnDiOPT79DnjBisvQur0EnKcVMx+zOMl9t7fHfZOPscrzOSUWgdisMJWaaGiST9iPxsXc43XySJiWC6xHntR+URX+264v+VxPH5qmNi2fbDAQKcyJtmwZXS+I6pT1dh055ZfMZmSsA0MHdgWqeNZA4klMdowx98nlpa4hfp0hFovvcAlupgQUOi6ykrDj8sboNH2TfXAOrwgNvU7a/5+E7esQ+66gjV8kRsHYtElYrta91SmROB5oshAiCMZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEys/xir5aVmmdrrZVTqlE+HCVg6rG0q8pPy3wUsX+c=;
 b=f929n6u0YwB+VVGIS3g2RKA6SECdpzFEGSxe0lWJ71DU7A8hAvirz6xsQS5mutN4OunUnFncO7saTbYWTbphpgWaEl+mTj+Ua0o2K5/qLHL/HxZrKPp9WjUs2Nix3wrtFnteVYmizCo6px4z/0CIgxX/D+YWAb1l2BURYm9xnkY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB3PR02MB10403.eurprd02.prod.outlook.com (2603:10a6:10:43e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 19:06:53 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 19:06:48 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "stefan.herbrechtsmeier-oss@weidmueller.com"
	<stefan.herbrechtsmeier-oss@weidmueller.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: RE: [bitbake-devel] [RFC PATCH 10/30] conf: bitbake: add
 SRC_URI_FILES variable
Thread-Topic: [bitbake-devel] [RFC PATCH 10/30] conf: bitbake: add
 SRC_URI_FILES variable
Thread-Index: AQHbfJX+IYJ6OQ0qukCyKxHklPFNXbNCdYlg
Date: Tue, 11 Feb 2025 19:06:48 +0000
Message-ID: 
 <DB5PR02MB102139C4720F2BC190D40DE53EFFD2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-11-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20250211150034.18696-11-stefan.herbrechtsmeier-oss@weidmueller.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB3PR02MB10403:EE_
x-ms-office365-filtering-correlation-id: d26cad15-34ff-4c40-283c-08dd4acf3c08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?M56AmXRfYy5suzZOcItw84lnixwnZPfBLthH4OT2eg9KCulgCVdANNcCEpe/?=
 =?us-ascii?Q?MYMQ3EAoBAG3osj0ouOevgQT/UJDHyo0XQnxUgwXlzCP2lJKgb2e9ZdZZQBY?=
 =?us-ascii?Q?Qkuj4RiPv+oWfZQszr9tdwx+jo0KQ08VVvwD+9IOzVckd/NjocPgWKcfiiyi?=
 =?us-ascii?Q?1my/oZGdM7p6IJddqHdhS773hW6bSy3Mu7k3cIxWVlZyNK5RP0dS4ffIpNSI?=
 =?us-ascii?Q?ONfRbKv9OZMfCJbQw95rvS2CLShg5LWMdV20y/Q8vaEudyhs8solGpUrYnu0?=
 =?us-ascii?Q?vYjxTJzRSlIK7lyOYTQSKNcbbhy00qDsp0NdDMsJVseDxAknBPcLtnlgyXsb?=
 =?us-ascii?Q?WLnYW6ClJUCGEHz+lbieJllY3hFSo2eZvO3+K8MUm6ySEFA4skP4SacV6JlK?=
 =?us-ascii?Q?UqQmRtiRRJhJh8K0+pb2LZzeXXGiXapxgQfI1pNIAjiA0ZMkJHyk3bQnn28i?=
 =?us-ascii?Q?Ogcvmm8nBxDyVBojYMyQeoxvNdsv3zens0kPQe4B1OE9VIUN13zc4xJAqs+5?=
 =?us-ascii?Q?xFyxDAnZZLGa8rOxnhkEKpK3bSiwugssx2yN4qGq1uIL9adWQ2SPfEVDXy5D?=
 =?us-ascii?Q?jucZivrXFVzjKfk3IILacPUn9cAtQ/kFVDAT121vErtQMUWRh6XWrsxkICrn?=
 =?us-ascii?Q?ysgPEIZ3cG75CGVgHuop1GnK/v2WEIBL2D0MUGP6xuy2V/B5ExvolvAvAW7f?=
 =?us-ascii?Q?X+m18YUGKrvp1eLoDaBEgHIB2c+dulfVB/rtM+Ohy4Pty8G28c2v8dsMEgIN?=
 =?us-ascii?Q?UpQW0fgDhLvHzKuiaAO7vNF10blQ7Ei7GFaH4zTFqDGWYX37mi5BTkVKd/YM?=
 =?us-ascii?Q?XAPEGAPsQyzaF84TiCznHqZE7iUNgWpuRf0wFrN1S9ERLxq4/X9MuZSwIyiM?=
 =?us-ascii?Q?oTZex3oMSqFL2b0Tvep8rvMhAHqRaWhk3+MDV4yxGbagCnxLG71wbO/MvF8J?=
 =?us-ascii?Q?CG4vBoauc8wp15KfOSfTSIc4rsKmHXrAdDUfKaJTxACjLH235cOfpAlwEOtB?=
 =?us-ascii?Q?bO6jXvN5jXDIKsIricpYatzuHXzfJB8rv1W6o/ywcJeOVBr0vwhNoQd6vi8k?=
 =?us-ascii?Q?pGIIK3/T2mIaOyRp6PZRDfRT6077BgM9fuJtEf6zVYHSnle9aRVqY4bH3TUg?=
 =?us-ascii?Q?xW+jXAkLloikC46nd6OoKQICoqZ1j0gFJEQ4/M+BeKx87oa/5qRBGRTNtz+l?=
 =?us-ascii?Q?3R4+jTfV23dPUnkxbpW/1nu+h1kgFViEleBPshj9uXuiQxDAACiz0JTySDGI?=
 =?us-ascii?Q?1FICdVa0wKcFskG+KS51xrKGk9AowGBf0Ecc9apwcM12MgvBIS7BI4vFxPeh?=
 =?us-ascii?Q?lw3DkCkNrh9NHh6Rq1H+/iELCiwN8LC3HarXlcpnO5I41LiGW3IBVJY2ls3l?=
 =?us-ascii?Q?1A+m1Xo1rgHYKv5T+6u0jDZn7pz6hwQZMlSQZ8TLbbXyLkMA1e1iuNwxAtCa?=
 =?us-ascii?Q?vbOGbovsHGM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SNYksk/2tfGVFTQ+FrI6I4tDeoq1thzOqitKBh0K9Se+5PN9AqrF7Dt04Ee6?=
 =?us-ascii?Q?/dWL9WTRqTIE4GywM6cDulm+Ff2BLPCGgER13cIwpVnRmlARqJnHbkgx3KdO?=
 =?us-ascii?Q?NuJlP5UnBmyI0cIDy1H2zWId3sJrlib0nxrzXVcRKOQCshKFAVRAZQSDfSTD?=
 =?us-ascii?Q?EHMMDs/sea1ZVklxPCLd6W9EulGqP3A8tryDnvSP6Jg59nYseH7Uc7H66ubT?=
 =?us-ascii?Q?d/J80HjY1UjXXeH9x4YnoOZsvRncMUB9mZfokq+ITRnQUofNO81Aqg35Emvc?=
 =?us-ascii?Q?l2WYvm9U+XBhzZaW/SbiQd1s2JW1t9nBu4ZrZ+OAey82ajSFOU17DmTP+UrB?=
 =?us-ascii?Q?43HYq52SEQfCRW3lMix+qsME3Pgqh3Bfslg6yAPSOwkZY1E8QbN3T4CoduaD?=
 =?us-ascii?Q?1EfaAEBZVfAJjzLP3btxZVJU3BZ+PScbqPisKdu0OW2e5G3arDkWT0z5gVlM?=
 =?us-ascii?Q?XCcXB50TFECZlNwNlKTa6BKt9BP6pIva6WBg2X9SCs/I75ZkwubH42QentWy?=
 =?us-ascii?Q?0YvTBVwB+tRmzjZc3uS5t0+llWWWE+dqHn9bDvJO3ovTBlkdsTD6+VzvfZdA?=
 =?us-ascii?Q?36qNeXo98LtD8haph6G96alr5bTRqxcT2yUzWEIaBWR3sMOcXbmu5w6G7yTI?=
 =?us-ascii?Q?EmxS5Sacpxt0JIa1dgpt6yCcOUudgVeK25Es/xIbBdf2jkM/JZugfMXBxMwN?=
 =?us-ascii?Q?aOL8cs67vt/VBWdDsq1S08c4npDoZFuh05Vi2kYneiza24XeD+jcTtLm9A2m?=
 =?us-ascii?Q?OJ2526D+oTuDwPVVveJppydyvKjrejjsv4gPYQFukSTF3clD6y7OYYITOkw6?=
 =?us-ascii?Q?ZJiQVSpYBmZYxSsuDzywop5UvpOxCrUY+HX+1B2AY6PC1lFcvT1UfmofUFFA?=
 =?us-ascii?Q?hwOFlJtRtiXKnewbOg275vsT3hCkvuc/cL2pSo4sLgP45LjE7ux9FrU/r4sw?=
 =?us-ascii?Q?8kaK1AMtkFnjY50yc+zZxJ0D92WRmypZP4gIhYevl2CGXeEL42pf8Llt6O1U?=
 =?us-ascii?Q?I5IeC75BJ0Uko0p9flloGlgxtr3GqSt8K6y9GkUYGiZG+r3Tv99YAwWIRHAo?=
 =?us-ascii?Q?lY57KUI0fqOHuM6wW5/OdrPEv/QbFghLjpnHw0IOep46naK3mKEXuoFZc4Ba?=
 =?us-ascii?Q?QFANoUED1Qd/QOzuWoiZjANOJvVLVcTBWS4Kpb9K865MTiWrha1pGkaPhWl9?=
 =?us-ascii?Q?MnvVYWjcKq/6l/vouQMyNJYH6oiIfdcGhtXYo8fhpFs47/kPtWJsBqbT7eX6?=
 =?us-ascii?Q?h6LxBEHUI1mqmMrhtMuaZDjBVoxQbbYOMjV4705SKuVe/sd57rzDDD3D2ucf?=
 =?us-ascii?Q?5YEg73KOeij/1KGgLcsoE+NmlKju2qIAAiRyAXbL7QPsJg+JJuOfanW/LX3C?=
 =?us-ascii?Q?ZPcFeIyUej1V3ijezHEuDFNpxj+vIWEjUOY3kC019r5BfyJhlFo4CNYx1tXS?=
 =?us-ascii?Q?2b870QthpBZZy9jVsP07cENz7kzr2MQ9V8vjW0GufLtE5CQPqRGfD9vk0RcI?=
 =?us-ascii?Q?awbCFcsnJ038knB1CBbF0mmxDEYy/NLbKEwjKMhbZ9rxG4jqMlOpA3Mh8WVR?=
 =?us-ascii?Q?ZEgMz7d76Qi6ZMXJEdc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26cad15-34ff-4c40-283c-08dd4acf3c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 19:06:48.1912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zx6kxZt/szzBLoXn2FyugACbqFsVOHhvlwnK86rxMsEP9zJxhoDqFSwf9+lVJbxP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR02MB10403
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 19:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211167

> -----Original Message-----
> From: bitbake-devel@lists.openembedded.org <bitbake-devel@lists.openembed=
ded.org> On Behalf Of Stefan Herbrechtsmeier via lists.openembedded.org
> Sent: den 11 februari 2025 16:00
> To: openembedded-core@lists.openembedded.org
> Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>; bitb=
ake-devel@lists.openembedded.org
> Subject: [bitbake-devel] [RFC PATCH 10/30] conf: bitbake: add SRC_URI_FIL=
ES variable

Using "bitbake.conf:" as prefix would be more fitting.

//Peter

>=20
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>=20
> Add the variable SRC_URI_FILES to collect files whichs contains
> additional SRC_URI lines.
>=20
> Signed-off-by: Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier@weidmueller.com>
> ---
>=20
>  meta/conf/bitbake.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8b607088c6..ed67500ba7 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -745,6 +745,7 @@ AUTOREV =3D "${@bb.fetch2.get_autorev(d)}"
>  SRCPV =3D ""
>=20
>  SRC_URI =3D ""
> +SRC_URI_FILES =3D ""
>=20
>  # Use pseudo as the fakeroot implementation
>  PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
> --
> 2.39.5



Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F345FCA101E
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 10:37:00 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.14])
 by mx.groups.io with SMTP id smtpd.web11.13807.1725187012404152710
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 03:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=FKFprFTh;
 spf=pass (domain: axis.com, ip: 52.101.70.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQ/nJ0l7yVxAQ0pP97fOaU/3Q4SSEm3Xc8eVPFunkKLGA8PBL04bNp+5G3tGxa6MdGxOLyAqrSqFAHlBtRjICK/h0WdG0HbI8lt22WBOoXDpmk1P+lYUtgWPIrzI/yxWvWavwgxFplV/bM3P2iUnx6yHFV+X7cBFI2Hl81Ula5t6qsN3m3y9y1dDvnkkMa0ZdzLZpzgpaubsFV7GgAUv8lbNzhd4Fi7u64EwpovR0LcnO6pi6jGMYqTPbSj64T7ly6EYURMKJpCrOZOdG9tAxuACtD+8WoPVMdNNJtAOhIe28fFz8YFefRMfzz5jwylEFupIG1CYfdtNc7QULfeQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFNjSHOM7vPNeXYX3963b26VC7/PLyW7Q4N/2smvqaQ=;
 b=G5curhwDgny7xvHVs1FqUFC+lBK0wS59A0iDntqZBw9lXCEnysCfzAnXtPIdipDiUtqi3uRFDXKKVkOwefLtxthHq6miwCVC67NeH2zufI7pjPDyau61pvbBc7lRjyfeYjKpGzSIFyEjtzSBpNEE7Qt7+HYV1O2xav4JhUedXUzPQ+uG393agi2+/GdajRS3us4gvUy1WtmHKFIj6TNQq5DIzyOoqWW/XCHpXmudlC5u+AcV1VyOuSMgJhaqiw4r5Lz13+3ayeOxhOcx/rwTtofjmBoE0qkQ/7gf4BrbxlqWp1TQNtO1NWqUPgJr1oXdjqTqxkG5dg0R3oVaHn3gdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFNjSHOM7vPNeXYX3963b26VC7/PLyW7Q4N/2smvqaQ=;
 b=FKFprFThG329IDjkjy7uSQwoURQoVZWSktOdiIhN2CUxgOGtPZA/64hcES4iRHh/r3ubFSOJVDwfJkDg7tSaBtMJIca/SFrTVTqCkht8+nooHu9e6epmVqkgcjfngbCo5iZf5EATO7PPOczMPTlefwgw10ip7Ewi8QkvqqIfBVY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB9306.eurprd02.prod.outlook.com (2603:10a6:102:30d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.21; Sun, 1 Sep
 2024 10:36:48 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7918.020; Sun, 1 Sep 2024
 10:36:48 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] abi-version/ssate: Bump to avoid systemd hash
 corruption issue
Thread-Topic: [OE-core] [PATCH] abi-version/ssate: Bump to avoid systemd hash
 corruption issue
Thread-Index: AQHa/D84hxuf3ixr9kq63AN1i16bSbJCvL4g
Date: Sun, 1 Sep 2024 10:36:48 +0000
Message-ID: 
 <DB5PR02MB102133BE7944D89C00AD695FFEF912@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240901071848.96558-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240901071848.96558-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB9306:EE_
x-ms-office365-filtering-correlation-id: 5278785a-6b8f-4c0e-a132-08dcca71fbbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?l0SWth9iJvuLB2NMSl34+6/8fATqH/7HB1Jjjj9yDN4AZGKWpNK5M+sgQPpR?=
 =?us-ascii?Q?yu3h+FPmCuurkUW7rIjVn3FCKGzhCy/r3/2JjjeRt3AqT1t0R8J21jnYM0PB?=
 =?us-ascii?Q?+Ckglw22HeaemMi807AVwb12DWf4Ny90MCYFtUYog6CG+zIXc4ujTYakeY2p?=
 =?us-ascii?Q?TGp9iabuTgFKgSBHcwrtfDEv3XT7u6lXkfuQXOYXv+e3nPGb2HGQkRsLkq52?=
 =?us-ascii?Q?5xXcPstvbAqCR4R1lhlvsXd+45e5PebNCQJiiQJmAyfU3xampyFz3rOiGDE5?=
 =?us-ascii?Q?0rc3fJ0lZkkZMMz0FOKu1MapfJYNs0TtpaHZIE+S77J96obZFHo1/PeF/ZCL?=
 =?us-ascii?Q?l1v+v3mwJQrZ1W2byzz53yrxDCc0dMLyTX3iz36UpYkCDSU4PWiqryr1q0Tq?=
 =?us-ascii?Q?wM43FoGs3xonY2tTR4DUZOLLj/fu2izEx64v4S9SaAlXBbiPr0RJWKfXFvGZ?=
 =?us-ascii?Q?YgOgNlqeYxqapo6N5L7gy7Z1N36c+ZEv6DFnXTH3cmQ655Zn7AekBEp9daqb?=
 =?us-ascii?Q?Ht+xkf/lIXJlNqL61ctvtZF6bc2zVnvotvs6G3gGlFkygh+uGoj4W3iRXV2Q?=
 =?us-ascii?Q?pV7seSX8xAn6jzP1HFpSX9sFzLusmEoy6Fn0Y7DLnfGD00fhO8PPSMfOFRjn?=
 =?us-ascii?Q?iYS4M9RIh+l/zPSUtccyZu0ss2OXhhNdUxIhYlqfhn6Z4e4P2xWl7CEtszWy?=
 =?us-ascii?Q?EGzvwDmnggtfMcUQ8tHREZsA+/RIpvVyAV8gS070gwLxX8q0377BiEW4rVAx?=
 =?us-ascii?Q?SsS9pTgK/MQRe0F58V8yK1cIQXpzgCpdK+vxLn/wXGUIdV2TUnrbv2dGKSjA?=
 =?us-ascii?Q?07rExBtAQhjy2d63OtC1a+oUrutlgtsYDnqKvRd0MqK6qnAfjKU7bUEvqChc?=
 =?us-ascii?Q?M8d9w6PSkh2/FFaSTfM91PA0TlJRqQ3i5p49IWsUMzIPvpDOPN1HrG5wKoyx?=
 =?us-ascii?Q?3ymXeYD6ErWy5KWWRrYYm4CS9F1hpdNnfjXAPygF9b+ifPBXZlFR3YdWCbo0?=
 =?us-ascii?Q?8Rybt3j1IEEdNubAYzJFo0AO2yfGZ+lHEu0ucdIidosM8nnw5EllxUZbchlA?=
 =?us-ascii?Q?SBwpAtMy8G5gTWDCIIGhMQGkStgG05nhLiiSpaIjBlp0JyzlEcQVyjsxshTP?=
 =?us-ascii?Q?A+AikJVNm7x31noOjsATmALlSddoNcX2pDUcyc8RgtYqwOYhnLwbRZb6qNol?=
 =?us-ascii?Q?8JbOspVw/+c+7OY5c9vzASIdnYaHi4XALuL1sdPHSJrXcru+UA9v1vSq7kc8?=
 =?us-ascii?Q?VF4uYcobNysneo9AZmobt5rv46K61MeuRMp8cIfUrGS0I7A4HAXuw5aLuan2?=
 =?us-ascii?Q?96SBw+dU/RZLtXQJQJt6BuTLkXeqk3tLRcfzeYDSQhQYDH69xFj/nsIsWGCf?=
 =?us-ascii?Q?yIF9Wv6O8GixXEEY5hNKxmRNDRpE8eX1AkYcMZbq7CmJTKW2ew=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QkSAxNrZy+h8ToG0z514hyXKbzwqYIvq281J+nArG+rdQ5dPUVFEbynYFFNc?=
 =?us-ascii?Q?otMD4VZgi4Hz+I/dsF/CUOpbq0863u7f+5laQxbZqIwQw8E/ij63F4upjxwK?=
 =?us-ascii?Q?I+JrpEY+Hb4mT8bCSie1A6xawq5QVdMVgHw277eJ2jzvUjrqef/Wdwgd8xlq?=
 =?us-ascii?Q?7A00pf2K8ZQB4hY1cZ4oK+HaQm7nPkL2U2dl01VD0uW5JX9H+xv2L79xkteL?=
 =?us-ascii?Q?Fsi+x92wFN89snJg/3beQMCBniOnge5qSBoMD0l1r02LubBHHx9kZpRerVaL?=
 =?us-ascii?Q?/1oISsmcjZKL8ThlTW9RqTNPHoZ2dmTMGvZurLIO2exDy1NHDelpH8vKjulp?=
 =?us-ascii?Q?tQZZxXCJO9FIf0qKOLbi/5xvT2U5kzP3kdhS+pj6DG6KmllWOUSU98IxWeC/?=
 =?us-ascii?Q?EoTwZ2hRlVKNO5gAy2aSM2jBjF5tCZqt0pLfu603kqQKS7PplK1T5ic7nY6r?=
 =?us-ascii?Q?ZA4wbgO0Tk7jDOv6GkxFXpAGUuAwIwOp9CJw7vrFwv6uqEqZU0aIUPgZ7QRe?=
 =?us-ascii?Q?ZC/wNXLgTBrDsAaPF2u/YzkiR9cGw2O8GuwEUHsCOx5LSerzVPhckMNTgOGy?=
 =?us-ascii?Q?nfwoaeuqTEBPa6MpFP4VrDEImPPD5ePAS/lLsMm+MjCUXxa6BeS+BGiA3qXY?=
 =?us-ascii?Q?1tnNkL1rrrE5XDyfgx+rEgAvSUscQksBfksKR8mQqby+l5LjeVeYMZ34O1Ob?=
 =?us-ascii?Q?vmZywvIxZ5mvnOMPZRj2ZXhUvTO9imIzkmACP62JRWug4KFmRuTGkrKQBSAj?=
 =?us-ascii?Q?RCgf9BjzMc/fIDlUYrz4k4WvdysdzVJr68o4C35EreTt++N/IrbpN8SDM04b?=
 =?us-ascii?Q?SJ5/SABbjTWcMHB0V2nY4RNo3nfU4Qp35nNgNhNmz4JxA4GvAvwwv/n0F1DS?=
 =?us-ascii?Q?r+wr2wJ/Rr8m0YqlbCQBwCu/CG/JZrvuZe3PPj3RQI1oUh/khIQUP05hCqjd?=
 =?us-ascii?Q?lNMZjCDJAFqVtZn7yxDi7/HnEpuut9zxJ3hBI5+Kw6zKNWNaTR1jOnhGPoqV?=
 =?us-ascii?Q?vSP43kadTKTH8X7fboG8Wkdlpbmy8sMBBO7eWc+iCiUBHZsZ6SEXDAo78xG7?=
 =?us-ascii?Q?opSyDPpHcVtuK6rWnagKMy3CVecC+etmXuD3vo6TWpNIrxGTTBGqqJ02NGas?=
 =?us-ascii?Q?HLqklrBnbH4DsMPt/dbSGACMzCddJ9aJacdSRR5ejS24BLl7n6vlirLImQXI?=
 =?us-ascii?Q?o922v9OXgrHqURhoiZFKskkd/YcERT/BGDUtMuMbGNHtBIQrXUXR5NJBVfu/?=
 =?us-ascii?Q?WUyFpbFIFNW+RU4baCA4vqCsWJGjGSfvfOFaYpAFlyYsJJrSy40QtQ80sekh?=
 =?us-ascii?Q?QH5gmdGjCBILePZ3AjgKQd1nfSBEK63cqWJgcdsiNKcMoRGeNRze8jKDJV2b?=
 =?us-ascii?Q?/I2ncawlliXzX223Ze/+Xx4Uw6TbPVXpqGqMF317LePZQQiyig6J4lE1M4cB?=
 =?us-ascii?Q?OBdTHVixy++QnuDcYZILFxoPEKrLmj2PyHKbzLfe6bP/rHUxr2pbFeOGpC+G?=
 =?us-ascii?Q?RBkfF1UgDJeATPH0cy1lSJvuB/ozInZ9E/++dcxwLWljle8DfnbuJ4Aa27sk?=
 =?us-ascii?Q?B3ATCWw5xODZ0d5oJMQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5278785a-6b8f-4c0e-a132-08dcca71fbbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2024 10:36:48.3151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rLci7PAJ+TNa2CbNCKBjZ7fa+kQscrcwX8VuSDxypjCx041YpbklGvqWqSLIIAVl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9306
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 10:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204041

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 1 september 2024 09:19
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] abi-version/ssate: Bump to avoid systemd hash =
corruption issue
>=20
> Unfortunately some recent patches caused non-deterministic output.
> One input hash lead to both good and bad output and whilst that patch
> has been fixed, the problematic hash 'cross' linkage remains. Bump to
> a new sstate and hash equivalence version to avoid this and work from
> a clean slate.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/sstate.bbclass | 2 +-
>  meta/conf/abi_version.conf         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
> index beb22f424e8..fdd529ee4e8 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -4,7 +4,7 @@
>  # SPDX-License-Identifier: MIT
>  #
>=20
> -SSTATE_VERSION =3D "12"
> +SSTATE_VERSION =3D "14"
>=20
>  SSTATE_ZSTD_CLEVEL ??=3D "8"
>=20
> diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
> index 0fe91b5ddf3..ac97752c976 100644
> --- a/meta/conf/abi_version.conf
> +++ b/meta/conf/abi_version.conf
> @@ -12,4 +12,4 @@ OELAYOUT_ABI =3D "15"
>  # a reset of the equivalence, for example when reproducibility issues br=
eak the
>  # existing match data. Distros can also append to this value for the sam=
e effect.
>  #
> -HASHEQUIV_HASH_VERSION  =3D "17"
> +HASHEQUIV_HASH_VERSION  =3D "18"

Is this actually needed now after the changes to insane.bbclass? Won't thos=
e=20
changes effectively invalidate the whole sstate anyway?

//Peter



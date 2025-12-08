Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58E0D3B7EA
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 19:14:57 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.960.1765221291598618296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 11:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=r5A5b8LZ;
 spf=pass (domain: axis.com, ip: 52.101.66.23, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQpFF61B8QucEJ/Rze7BvLZpH3EkF27b7RuyA8T7wt1fMftfsXv82B6vJzmMEihZwEqxkqqePYaR8c6U+10m0QmQNRWBXCrkd6eI/If6QfEGqza8QIG5anDu0H+AOjPBYe62Ah1A9G4q7AU5BAKrHtHyOHaYVEHzd/Z1LqUu3PECG2sGpIMxCKLnkgCqWS7z4Ac4xlA81Cxd83G3ikdlS36TCZ5tryr6bEH/FvkaF/8NLvlk9HvYvLIgMeBNejdm429Kbzfypn7X5ABYPRHQnnKWrcgEwZRXcyYa/wCD9vqqj+s5wc0WP91yJ+eFQaDpeoSfngah5Z0cuBqra29l2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBw1EIdEr2QuHLn11lKKpXgWLsEwWSen1uGTbxWsfAI=;
 b=DXfSgZdNSIYhuO1EXZLtAuhRCwz0aMkLr0kYlLmlzVYEjgXAZCqBQVxJ5y2cPEgV1RvhuXgAS7WOxWhukQgbzP4S1Q2e6B2DYcA7vZhsdJJCmC3wP0xgJY0gcfGroN5NuKYBGrRw4EyuC9Zi4RErw0JHItdNdZMDgS9gb+OZtL5Y00PO1KwUIlmW4aHMYG1g+RTHc6PJKkZgehrOsTWPvMY7P5CxGH0LyAPrJtbtwXbSNIyzkWOdzNLALT8d1GQdYHcLkwhcb4NnDQ5tKKh4fQA2ZymoOHeQvG6Rs0/BiIpNqSABTivzI/mdt3Zvjtgry9WsXIYRN7N0QUS0jDJ91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBw1EIdEr2QuHLn11lKKpXgWLsEwWSen1uGTbxWsfAI=;
 b=r5A5b8LZWzVcp4EGBt2oKJ0u86j9UVyj/XWuRsl6amjHIzo2NuI6u2wl1ri+FHJFXZ2SCdObQhy9E6gUOfiKcx0d7nwisMrkGRw7d03dQn7HbprB9ao5PJoZ5HjL0FMJqBmxJqgIWpW8VuNUjvErnlBK+AJ8gUczcOllONLbPGE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB11499.eurprd02.prod.outlook.com (2603:10a6:10:5e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 19:14:48 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 19:14:47 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/2] go.bbclass: set buildid to empty string to
 improve reproducibility
Thread-Topic: [OE-core] [PATCH 2/2] go.bbclass: set buildid to empty string to
 improve reproducibility
Thread-Index: AQHcaCK/tyS4Mu1Nak+orPXP0g5xcrUYG8JQ
Date: Mon, 8 Dec 2025 19:14:47 +0000
Message-ID: 
 <DB5PR02MB10213CFA39B1989410B8D5AFFEFA2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251208091148.368769-1-changqing.li@windriver.com>
 <20251208091148.368769-2-changqing.li@windriver.com>
In-Reply-To: <20251208091148.368769-2-changqing.li@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB11499:EE_
x-ms-office365-filtering-correlation-id: f1563a4e-7268-4e1e-d203-08de368e0dd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Vw0v/VkgzXq/lGAAzsGUMQfhV1Ews8tTpvLOTBS41ZhPsR/mCeAWyeHpBZxM?=
 =?us-ascii?Q?Yb62T7/aGFrXq8UeIuqygEpm+3GptX/TutVXi4irqUV8g4/+pXVPer4nrf0s?=
 =?us-ascii?Q?6TW1MJoWtYRrvEHCS0L/VybQpB0N4/ZXiAGP1TLB+FKFv68R5P/aoEeZEYsZ?=
 =?us-ascii?Q?ojl9Jtg5/CAAyjzJIqt7Vocu9nngs+3qsq147lfyJn3J2VTs0dtuH9vENsuF?=
 =?us-ascii?Q?CNFVhRKeJTAiO8t0cqwEHxBng4MnAyOTLVrUb9Vbh9rNYI/tfz9M9Jkjr3zK?=
 =?us-ascii?Q?XaCino/hFi92Fr5m/YkBrZL47BMQ8xL6XwaCTxoAE8iAV7biQDAmXbFHMK0F?=
 =?us-ascii?Q?NuR8s5kdl7P9M8/3K4fMeSAik9HT7tHiTCG5eL2/NMByOfL3bS12kpCCNQap?=
 =?us-ascii?Q?HQAVBmKZDi5rBpPSZ6CD5shzZBXaVAM8zPYfkjGqs7MqIYxe7VZ1YaDYst2K?=
 =?us-ascii?Q?ZvsIeE3bwnR2cUQ6giZ6SMc4eScwAjRa+EsGAS8XMRVfgaR58zC/13FmpicD?=
 =?us-ascii?Q?1uTCgDj4IRKpX5L9INuSOXuiosTQcW39aHtPR4DVVAPw+ZfYFHUR6IJUcLgB?=
 =?us-ascii?Q?+J+yROdJIoCTuhAIAPK/zpq7P4RVIUt/9ptU/dKBvzUM8EHGm2saI6awLM2n?=
 =?us-ascii?Q?427c7+WwlrOon3IdfwXVctjoPD5evD83IhDfuNkQDQI7ldujAiWF1DI9xcqZ?=
 =?us-ascii?Q?94l/2/HcbvFjdycb+yAnN0stgD9jsLVBgXBfUJ/5lSVg9YSgDPr+461LV+7N?=
 =?us-ascii?Q?iBGA40wBbHnhZ0d7uVcQDrsH59+OgZ+DV/bh9aZUw/XQj/yR8SfailJ5SZYS?=
 =?us-ascii?Q?tILD9Qu8Ns+n3hK7WcIDslELIVlq2+MRpl3gq/K7e38LXVtRtu2pmq7FKGWV?=
 =?us-ascii?Q?+KbDh2ld2jgXeMsOsCjx5I3cw5Hqul0wKIjT9Ch2mCB/kG3RvdmS4kdH88/Z?=
 =?us-ascii?Q?erp3+xioOSOykRutHUUonAKz4rMtHjldLteo9fCgLur/x0Og/z/8vEHeAL31?=
 =?us-ascii?Q?TqPcIWo4zDKRkqtlAigQnHVrJrF9Uh2PLKMaNgsW2o4mjBEgaq37IqGzn9gw?=
 =?us-ascii?Q?B1jiG+T2MrdQHiOvsXxYxVN3W4GX0N/0yp4By5IIudtcYO1Vg2yqNcGdL2h8?=
 =?us-ascii?Q?StMfUkjoHDqkHdTyGGZrY7l2vGqOiwA6zEvz4hrSYhrQJY4rlnl72WXZKLCH?=
 =?us-ascii?Q?3GAmol35YLJSA5jdAAuj6MqZrDelbo0Lea3csz7c5qD7iNhsNr9VzFIjG+N1?=
 =?us-ascii?Q?xGTVYtYWw4KRKhfW/xZfC8++8Tl5/ixWqC46Rt6jqHy3b/JIPa3yTGO1s0RM?=
 =?us-ascii?Q?8UmXzXaerApP/s36bl8pjjNeIw3lgJTTDnx1jay5tR5vcdCrf1RK9y239CQ1?=
 =?us-ascii?Q?BcSe9UIvkAI09h354jYNFzRtg/9FDld12JJxNkCebhExiF8iAoEJo4WW+p4S?=
 =?us-ascii?Q?aj4DUk8HiLic99Y0XEscHUKCxhGS40H0rmu/mBJFh1o3Osm6WOhL/T3Wc8j3?=
 =?us-ascii?Q?OPnB44tmTCafDf++65vPSmWdAWNHXNhgR+sm?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4nF4P8LQizYj22UCWZ+YZ1VoXJ2K7HHnVuHAYoShnzo3eP/vfX7nCA08uNnF?=
 =?us-ascii?Q?k8c9X0NwnaCvYmoOKiFlKcQmPXmY64VPJV4ir8TPt782sMY9DjhNxmVtfiWA?=
 =?us-ascii?Q?tqiBcH/txrPPQVmpOAnEPQRt8VjQV1b4IuyrybPTY6pBtqA3IR30YPdHLQ3+?=
 =?us-ascii?Q?VEAB9wRFreIa7YghMDZCUW3Oo0naie4UeFEk7iOo3RPaZN8RFtfl0N8zCih9?=
 =?us-ascii?Q?sBz9UqNjFeD+0gwUhvoJPTOT/mxQBsvTmtTQOsGqiPQAlPmrf0YqwvzxyHu2?=
 =?us-ascii?Q?Fkoa8GkFlnQR9dUHO6TeF0qnX1QCeixWZsglX3BLom+sSVYIvlX7SI45rYc/?=
 =?us-ascii?Q?wE37k8K/ud1bBk3rUZnRL9G8GFHzm1Kc73oa4/V4NCZiEwBKHwl7wV+Ihcrg?=
 =?us-ascii?Q?Q+ETJU0mgXCbNnw9ekJoh184OyTb6fz4dcOen9nzDI71hwRXo3wMqNqsSBBC?=
 =?us-ascii?Q?54ZsBwHFgky3KpdpkJ3MO1cECPpOSpvccUerlykkByucsoXbyzCvhmPS9hgt?=
 =?us-ascii?Q?5IkKutZY9IlbGFyxwplVVMjpgfn9OOHa1Z9zVydv1K26ZYCpP3WOh04LSc+b?=
 =?us-ascii?Q?EFzYIml7HRycokCxFRX7w2Mh9oM1SGGq0T5pyRp4HQwZIzLpeGx3Ju6jCtu+?=
 =?us-ascii?Q?nH1U1vNnJ/rMp5N27ELqqe0ObwClHrjXDsmGWCWN52aqvZay1qEsv+etfHjh?=
 =?us-ascii?Q?VDSj6vxuyPwcJxS0CYl3txhGmFL4Yn13wEuWKjG6tIln+hr8bdGk+AAytjmu?=
 =?us-ascii?Q?ZWjVJfi7GiJcrLtQEZY147KeS69lDMo51wziwhx0IpInsUVnD+yVu81qdlR3?=
 =?us-ascii?Q?HRhNjBkccP66WZ/tn0t+zUMRa5qnrWjSQc0VVdUNJtzLFe1hPVayIPmnCiuy?=
 =?us-ascii?Q?IJfmGOow90Ypd6F510M2YmVeDHJcm6CuBCX/gkURGB41zm9Zn/bmwMW4JFRK?=
 =?us-ascii?Q?5urQU7FtgkSFLUQjYscYVb/icmnRTRfsGXTCbg7ZZtab/9oVWLEuEvpGCQX+?=
 =?us-ascii?Q?khH/9kqO+ERdoQjV99PADyt0Conwbi63X8yHNqMrvQhnST96jBmYrBhsKroo?=
 =?us-ascii?Q?2BatSy7LUU9K3fp3ejwonmbzvMZJghsBzziStK5Ifqx6bNY65PcYlwLTDgNb?=
 =?us-ascii?Q?FPX2HE+RuZ8EWJBAMBYxT0kMKHpYttq7wn8qlyGAuqnCs8lwUEzRsUd1Ar9T?=
 =?us-ascii?Q?oc7yjMUj4jg6qPKBMnyEwXY3arjbhA7OtJYtRoK68M5LDeBoLkhNxp/T2gjY?=
 =?us-ascii?Q?N8UZJIrTX7FysO1phHORsIDoxG0hWm6qhYBaJslDsvl4ZaylehfRvGJW0WLS?=
 =?us-ascii?Q?H1dYBeJDC++M204YBS4+yYwOCZI20nU/7qZ9VbmFTTKvFf2ZgJQ41wCa+ksJ?=
 =?us-ascii?Q?M+4+RONUqzk8xdqAVsfpBVWMxIO+BZn6oIC9K+6QVviWIIvlrjG+DhXDZcqG?=
 =?us-ascii?Q?59NkDN2UFBm0/V3nMo1gENiVptkV3YIDfQrHOq9Wj3p14stX/2DOltFLB15a?=
 =?us-ascii?Q?bq+hBbw4a6SQKe4uFlAGGQ6io8PUfnQxtSHNA6ItIhd0eGkJMhYQbl7yLw?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1563a4e-7268-4e1e-d203-08de368e0dd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 19:14:47.7948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fVVabByY4VPiv1FwA4pm22u7/5IeeoXt5dA/7/Q1Z7sf6vikdwtakEiOtkfK3USi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB11499
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 19:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227403

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Changqing Li via lists.openembedded.org
> Sent: den 8 december 2025 10:12
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/2] go.bbclass: set buildid to empty string to=
 improve reproducibility
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Seems there are other things making Go BuildID not reproducible, set
> buildid to empty string to improve reproducibility, open a new issue
> [1], and refer an old issue [2].
>=20
> Refer:
> [1] https://github.com/golang/go/issues/76743
> [2] https://github.com/golang/go/issues/34186
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes-recipe/go.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbcl=
ass
> index ed986ff5d4..2593368af7 100644
> --- a/meta/classes-recipe/go.bbclass
> +++ b/meta/classes-recipe/go.bbclass
> @@ -50,7 +50,7 @@ GO_RPATH:class-native =3D "${@'-r
> ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
>  GO_RPATH_LINK:class-native =3D "${@'-Wl,-rpath-link=3D${STAGING_LIBDIR_N=
ATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}=
"
>  GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK}=
 ${LDFLAGS}"
>  GO_LINKMODE ?=3D ""
> -GO_EXTRA_LDFLAGS ?=3D ""
> +GO_EXTRA_LDFLAGS ?=3D "-buildid=3D"

Adding it to GO_EXTRA_LDFLAGS will probably not have the intended effect=20
as some recipes already set that variable and thus will not receive this=20
option. You should probably add a new variable for it instead, like the=20
other options that are set in GO_LDFLAGS.

>  GO_LINUXLOADER ?=3D "-I ${@get_linuxloader(d)}"
>  # Use system loader. If uninative is used, the uninative loader will be =
patched automatically
>  GO_LINUXLOADER:class-native =3D ""
> --
> 2.34.1

//Peter



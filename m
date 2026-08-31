Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34913C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:11:47 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25680.1788167506264483150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ADcC6DkB;
 spf=pass (domain: est.tech, ip: 52.101.65.65, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKvmMzn8ARBaYvY98Y2DyLJXg8473fqJehLlEODpifGUN+sJMPTy6fS2mkNUX0lLnyKIk590WPeys5WDEQbFklbDEadhymP8tswo9njDtPfzy1XEoPGk/T/bW8BcyAZScSkZT/rfIONz8eu5r2ff6MnW0i8QXWgQKflW9Hr+O3Ig2hy8uT1nOm9R5p+aVX3wz/D44557EOatO+1ChDpzxmfWTwHJ9CZyMIItYcaLw2FvRmuiR9KdlRPcWZEWhM3ohpgqmHzKc1jLmYIctApMtoV41I0PZ5Bk3SPewe1+arHyV/wo91W4gcBXf0Y9njH4L0VDL60f/a9rtkiaIrcQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRELOCHARLqFdmGufYtj/e0b5K51S8ta8atOZHWWwwg=;
 b=ADDn4JX1iWmw6zaSg89fhWC8FjkCR1DkrJxCsv70QTclFKV6LsXTUsofu1fe32vH5kY7QjsiKY+SkcNdx/lXPGT29Q0Gbks4gVgtHDy5FPR2AhHm/rtpkqwplWu1F4b11st0dSSGYcp5IQU4fkH/kxhMqKM5PGh8Ifzpgz9hQorU9D0/24YKy0p/o43b/IG8keZadkOQgPHyYLOOJxVrCBZJXr6WN4FVUPtbdcxdvzMLRAl83h5xdMpXuVkHd6S24mg2/XjsHU1MmGV6lXAuvir1mLZtmxYHd6tWypM0hLg0Nx+d0tIoauGKAYgS+lUj08JtAu0FEFbSgioltQoEDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRELOCHARLqFdmGufYtj/e0b5K51S8ta8atOZHWWwwg=;
 b=ADcC6DkB0InUvMIo0UtxksNLexbtO0Cc9jVngF9HYWYl36A1bnLgMn1ChE5yaKHcasHa4VzC0C70PSZJ1+rzuaHJYT8eB8TWTOrjmDttXZkNpmHBJ5QIKvuIMP93dzoWwLh9NyPs5Ma/D1SOGzhWsytpmjWfdQHzh8nNTCYgw0NRL/1m7VONWFn+LZFuwFxNEXJ2GqkiLdQPRo+d5YC6eo+pQcHA290c9hkvvjHs8dNCWkAiifrs3EWdCLD0PNtnyXpOg2rKM8BprDfnXSIj5lnOy8c5eSjz5kdQv5UyTgu14GCHWR1czAEvD9pygxXMw8cKMODepQ0mzaJTWMh7Bw==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by MRVP189MB3122.EURP189.PROD.OUTLOOK.COM (2603:10a6:501:5a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:11:42 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:11:42 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: "Yoann Congal via lists.openembedded.org"
	<yoann.congal=smile.fr@lists.openembedded.org>,
	"Hemanth.KumarMD@windriver.com" <Hemanth.KumarMD@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
CC: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: fix CVE-2026-5435
Thread-Topic: [OE-core] [scarthgap][PATCH] glibc: fix CVE-2026-5435
Thread-Index: AQHdL7z4dX03ouu59EOZXrMMF429cra38KEAgAAA7Ts=
Date: Mon, 31 Aug 2026 09:11:41 +0000
Message-ID: 
 <DU7PPF66507B2D7A2088EC452661D307C49F3A92@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260819092634.570557-1-Hemanth.KumarMD@windriver.com>
 <DL30DF8R6J3Y.2XMP2OA0BFNV0@smile.fr>
In-Reply-To: <DL30DF8R6J3Y.2XMP2OA0BFNV0@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|MRVP189MB3122:EE_
x-ms-office365-filtering-correlation-id: d827b742-cd63-4f54-6713-08df073fdf3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|13003099007|38070700021|10067099003|56012099006|4143699003|11063799006|22082099003|8096899003|18002099003;
x-microsoft-antispam-message-info: 
 Pqig5xoHAwg/6mmAP8yr8ZhY/Sb1WtO2CfT5IKjCC5uvv8Oxpwp4e2n0KaZtuYOgvsraUFeV3tlqRRp5x6hZyAKRDSWIxnqAcsPUQqy3Lwtl/aR8110XwdC6F/qYJz32XWfigrVX96y2wJtR+1hVnmJq9WZmnYc9iHDD6zLtv+HpkQ3K3zQYLk0Y4qdzC2PgWqenZyRDNinBkKorgaoyCA4S8CoZX0/ny1c3KrrfCTPzfv8cjUfNcShhip6VXGTtIAXeN+eIXw0W3GHV8jaNqvqQeUfz52pcLFgQEH9IXVEarVC78PCOaVe4sWnlwWw+xyOvuJrL28kMkz1Gjoewx25FGTdzFL83PK8xuKjZeh8TxAMxFq3kbLzczaX6Y8nWD1lbt2CGQqQK6eVfnztmKNvt62eNcGzXpMXPuwqHXJk2ocr/3nANPNefV74hT8eND27eOjgTMPkoOzmqSTuQ+2XaGZjsXKhBkzSWBIvE94MVpfFLbqAPLULkoUAyTYRkQ6hXzCe06kflEFPH+Z1T7YVgHCoQPgmudpP9+ernj/I5Hdp7QYsRkKdHY4/ygusF3kuZ1SikjmXfAglIxqjwAbNcJK8kGY5v66hPPqGV2Fi5Vw91vVzKqSU5VGDQOeEQlLmUIbBGKMyxAELTVKvot6pqEWZORE2ga8USRNncB6I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(13003099007)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(8096899003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HYVqLefE95EFG1/EPZsMN/X0sWUbjG2JX+mNipYUPDidqey1RPpl17Z9gS?=
 =?iso-8859-1?Q?AE8zLDBKVnjghjSf/58gwVsdGweRbaHP4YfE5LgRd8UVOMRI+l1KMCBU4h?=
 =?iso-8859-1?Q?3FcFW2teTkVOcnJ39H6fFCJRhZFWA2ukmuOCF4ikuL3jnSMITNtfiQgazq?=
 =?iso-8859-1?Q?o+fbmvTYn1qLQvqFycyrpx3w3tv+4iB4LXV9OG/6Q1BCbg/yfkC69Q3jZe?=
 =?iso-8859-1?Q?CL/hbVs4FT0KY9p7C1Py//Oj9x2sYiW5RFEB+c1lGyzKLgjTyD9wp2nUN2?=
 =?iso-8859-1?Q?AY4n1vakSi1poZCIV3Is8Fu1e6PN8IM+fZeQrGQizsfBLFzddi1zMMxR1J?=
 =?iso-8859-1?Q?4DClqI1IrewjzsaqTpEKhrC6JUhEaW+8IfT2elVnMoek4bfyOGcvo5TAZd?=
 =?iso-8859-1?Q?134ONfShR7XVUZwmCWYnA+AGSjsxBsQSmHnMcsJrHb+vlTryD9vGFVb/hD?=
 =?iso-8859-1?Q?NWwKCnxtbqKoYnpQ0Qa3WtlVDVhvrp0YAG8h0qPyKyh+mGDT2ihxP5hwyq?=
 =?iso-8859-1?Q?Mzfs1MqIQMkrzHJs8o5OXvw51h2UeeGf44xjKQgEjN8U+Qp8lqjWSm7JrZ?=
 =?iso-8859-1?Q?1SP8NUxhpGzIVMHqb8elDhCkaxO0R+J9qQHgA1SQoUlfautT6YnD9U3GST?=
 =?iso-8859-1?Q?ExdDlTM17WcwWq+axa/dDr9ZgfQJ+Y4tS78P7KukBeW2XZuxyhrM15vDgn?=
 =?iso-8859-1?Q?1iObsy7j8gMaVHtkt14buKg2lsxuRSQbQHekY1d+F3HfKZtj/xhLuprgNc?=
 =?iso-8859-1?Q?93zbkKVwWZ1/4H0UGF2h+ozG8BnH+klMgU9LBk+pclgJbyfn1w6KlffGAm?=
 =?iso-8859-1?Q?PfBmO6Mtm3nLX59UPVKdPE9ly10pW3/w8ExUjJRalKljlTMFPYGuyf9nHy?=
 =?iso-8859-1?Q?BinF8xhwtLwwR5wCVG/DP6ZrrQ6Hwt4B4/nvlGb2fVL5wLy3Te8zoU4m1V?=
 =?iso-8859-1?Q?5TsYkDpsajcPym2zThvOvkF/EyykcZTvP5G7JAK7oSHgJYxr1udvXl0IIf?=
 =?iso-8859-1?Q?i6pMbXx74Dg9z5jSJ3mxNX1MDxc7NJ4ho9OXZ/17LfrVJIYpQnyWfNrxq4?=
 =?iso-8859-1?Q?JB9SOFuccL2MujAXMrYV78Np5hDtm6QgBkiptCBzQudi5AmVJHwwQ9rg5Q?=
 =?iso-8859-1?Q?8Ecaqc3AYRuG5OCTJMIoEQAQDhVtMAO/hwAnvkK9AMarLyr4BuXToapa0H?=
 =?iso-8859-1?Q?bvgcUVtSFvCQUCU6WoLAJBO57NJj4LLFDoual59KOiN9/PMchYV4rJw1t2?=
 =?iso-8859-1?Q?VfX3VS7mCCpSCgM1vvrZONFsrgXaZAq3wyeeeGuY7gYQYux9AxAd8IMdA2?=
 =?iso-8859-1?Q?1UvbVeBxDZW2VJEHL1d6E20qxWJxfi7h03czorPT+MNPIBiWJO5/3ob+kz?=
 =?iso-8859-1?Q?Tu+H6a8482Noh36j+woUlW8iIdggfRz1RkgCxohyxGhiOayECjllLrqj0m?=
 =?iso-8859-1?Q?GAAEg/5VilJE64bNiAgpv2nMVr+EiPtUR3zBs2bmtiGZj5AVELkocpUh/J?=
 =?iso-8859-1?Q?1uSqRxNsX5IfMGmlUGwJewGSEYO/Heav/Vwbg+rPhvtzTVOgiWQ6AJ2wiM?=
 =?iso-8859-1?Q?L/29qUZAyqpBfWk6VF48JLeM/q0vQ3ZDQw3YT/E7/v+rJFuMKt1hVoYY4h?=
 =?iso-8859-1?Q?Ptt3S87S5CJobFL01tyfG1vWMAKPo2pHey7CmcP0OGZZswvFQQ2nlrkYzl?=
 =?iso-8859-1?Q?xl9x1mICl3Z2rX5e8Dnb2wtKrZL8i+UN+B4QaFw2s78H1DL0yo0v03LVku?=
 =?iso-8859-1?Q?Jihnj6sKGcl88k4ymiARPfHmr4kM0wIz7abBbkxl0wQkZwiyw5QEulc3sg?=
 =?iso-8859-1?Q?HUPMDfmOJg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D7A2088EC452661D307C49F3A92DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d827b742-cd63-4f54-6713-08df073fdf3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 09:11:41.9132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V9lbni1Lbk3XmTdslY4cxn6YDZrnF95PdJmtq5g3FhIeSrbxw/+4+nrTwSStUF0GT9b/z17/j6hxugwOT5w9PYsTC7EGdmD/CULBuEOUe4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRVP189MB3122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244753

--_000_DU7PPF66507B2D7A2088EC452661D307C49F3A92DU7PPF66507B2D7_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

My patch in wrynose  glibc stable branch uplift will address this CVE.


https://patchwork.yoctoproject.org/project/oe-core/patch/20260816170737.421=
98-1-jaipaul.cheernam@est.tech/


Regards,
Jaipaul


--_000_DU7PPF66507B2D7A2088EC452661D307C49F3A92DU7PPF66507B2D7_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Yoann,</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">My patch in wrynose &nbsp;glibc stable branch upli=
ft will address this CVE.&nbsp;</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><a href=3D"https://patchwork.yoctoproject.org/proj=
ect/oe-core/patch/20260816170737.42198-1-jaipaul.cheernam@est.tech/">https:=
//patchwork.yoctoproject.org/project/oe-core/patch/20260816170737.42198-1-j=
aipaul.cheernam@est.tech/</a><br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText" style=3D"font-family: inherit; font-size: inherit;=
 color: rgb(0, 0, 0); background-color: transparent;">
<br>
</div>
<div class=3D"PlainText">Regards,</div>
<div class=3D"PlainText">Jaipaul&nbsp;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DU7PPF66507B2D7A2088EC452661D307C49F3A92DU7PPF66507B2D7_--


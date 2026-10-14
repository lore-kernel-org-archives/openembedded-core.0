Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4E2CC6B2C
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:43:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15547.1791988993229200373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=cMEVi3zW;
 spf=pass (domain: est.tech, ip: 52.101.66.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqYAUorre8UXXtNmfHDIO1Fk2U8ksAM4wvhhEBauHH2xaKJ+Qjx9m7ZM+0hPpp8ck8kyBUw0ShxlvbkHJtYFnE4rPbkKaoqNcPnrkG6cB0m6lAGjauEoRDuiXXDmc5NbeLFEpAlukDxvHExlCK2Gf3CbSPC/vDUU5wnd1dib2XoKcgAcGBY8hOpN0bR7M+6XasRcKMjZvTFUZJuzX25Nvb9ZsOwASmKnOOpFVT1ZjQc8HDckmvqv67XKmcea69JJtcmFpfAGdE1XgPvnx9DNcJEsq/iwSFibsi6ubxMu5vTToatdqXQSscJFcqvUBvCEhFEA7S8i+LQT8Icj19/rHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqIOjlNeWLGekjaFtq5m5wtxLhNpugpeQ7c3WXnw3Bo=;
 b=o/lPFR17tM3gSmr+wI4i5b79jJ8JC6jbglxlqCAZKAQtXp1Lzg6A1N983xODaPJNoTp7wZeFv8LUGZcxg5P5bDwl9lsxi2yIlldW0n5OVq/506auI6OlRZ7LVaoYGZKIF7MmDFApwDl0MRlYxbuJekqPIqQ5zzGOTOdquWoeVMZfWsiSYGEbwMZZojbWq558zlT2O11K5rqRQoN1UanXPHwNVnk6aVt4Da7LudnqYS1Ax8NFYk8wD91CFosmdPoSGoR45sahU1nCcBXGfGZ4Qw5oKfGZaAPhQBjuXD1k5PV+FucnG9CjNN7vW6pQ9TEiyknRGwtk6wSiNS10EBpGvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqIOjlNeWLGekjaFtq5m5wtxLhNpugpeQ7c3WXnw3Bo=;
 b=cMEVi3zW+KkOQwRWXK7eZEt2DbBWKIfHAf/0QXDsUVqPzXglEBVePA/rRP9mOejS+a6nclCmjAIPM3LQzd2KkRbl+K+qpPVDuAaVESPIZFXaN0EKjIDQuYP4tYyPVG7c4jGPpkY9QCi/unCRqh2uheMlWNWAIdnpP1RfIDb2HLb+t3iieidP0NslMF+r+CyGT41AoxLOD4MW/zU3t6iupCdhfusOfEkQll+Y2LZX+TJEOPaC2FHrWObwUGFuBcfny07aApummaePo0e1bYceGJutlrD36/TvzsVtpXJIlF5cTvn955ZALC6V4aBPkm8MiwyWF5n6SPb74UT8zDSRtg==
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAWP189MB2570.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:43:09 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:43:09 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Yoann Congal
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [PATCH v3 1/7] libpcap: Fix CVE-2026-0799
Thread-Topic: [OE-core] [PATCH v3 1/7] libpcap: Fix CVE-2026-0799
Thread-Index: AQHdW+kOd69gZVPmiEeNK3zO3ZdelLb9HCfg
Date: Wed, 14 Oct 2026 14:43:09 +0000
Message-ID: 
 <AM6P189MB310729BC843D70E67840C3D6F39D2@AM6P189MB3107.EURP189.PROD.OUTLOOK.COM>
References: <18DE6BFB2412AF27.3595867@lists.openembedded.org>
In-Reply-To: <18DE6BFB2412AF27.3595867@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6P189MB3107:EE_|PAWP189MB2570:EE_
x-ms-office365-filtering-correlation-id: b99d0e7d-3ce3-4202-09a4-08df2a01771c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|56012099006|11063799006|22082099003|18002099003|10067099003|8096899003;
x-microsoft-antispam-message-info: 
 SLcZiYiQqDdjSmdsTjnq5hsikMCzwppIqgqMUF7wa1UuvhKM4LaW4zsMdFS9AQiDxYO1n7ErSUwtUFK5VjP/4r8jktIyny06CK8IqwYBebI6If/ilNj/e6N5/i+HGjs6AA9usnIXuDjnftEwmgw6ot1Aqu8zrLFOjuslDDCtOa9DqgrmU6Imqzku5OvsVyp4YvP84jTovPGK4MprsrRPaML/ntKRohC6I7j4nt3ILu/W+Vl6/hQEB2CrVoOZ6KU2xS0mW8H3ePOLLFhCF0P4u0aOhRrx20b9zey5ViD3ZVI4AYCiYr0RMaNt+xjImyhv6sv5NcGyFsISuc+w2ZWxd9X7qcYgjjA4WzIJT83FdKEn6wLyWzdwgFR7wCfrPt4XrcwsZeX2u8kjRzK3yhd1vT1MZ0AsqNK/Xu2ayQ6sOAokUIibDi8XudtgbBU+XIMZnatvz2H24y/G3eCymY8x+9ogZdX53kt0h7yPnqZWIIoVPFbYCczPBI0HqRJAhaDXat8vap7mVP0Ds0VjHZaGgXS7fTyUlMNxMlTjXWrLkzk0pJtQjWLYWLDqKvvC1lxZYcaTPUGunncEWFkKaYjYYaanbiTU2UGHa0RK4xFDanCdSZC/PkmyOaKW/TczlQevwGIsNSuU3MmFb+g5FYumc6bhXdyhiBZ2Fl6iI2MCWm+dzluE37RrtF1/kMooE44hJaLzoUu4bxSTekJ1ZOavt4y3MiGE6pVgIXx/dia3Z+4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FaM4gJc+JaEgMIaCo4jWUsUURsWFA838t0Hsykl6+rlnl3w5Gngf6duMiWR6?=
 =?us-ascii?Q?nPn6UXdPOkrmzrtdO3N9pR6KG0EHm1is+Q6LhRmO4f8cQvWJtlnIFnsz3R4c?=
 =?us-ascii?Q?v2X7jXl0RjF7eoqyfkMMasy2sCGqdE9PM3XSTV5RAV3AS52xYkPQsgX+ov1z?=
 =?us-ascii?Q?Bi4XRYdEeR3jqpww8wBQ2//ZdCL5QLZBEUW4Y58koI+fpWsAwvijYbnMRyX8?=
 =?us-ascii?Q?QVKgt6Y1JOzY7LFmJFn5p4rxBCYkCdFjD94qzp6movcaZs0re0UPDJoVl0ZH?=
 =?us-ascii?Q?mr42ao36jLoY7hpaGVjKHhfTG+0GwS5iTU+8est2B6OBFNqJs9xvFdVfZaQU?=
 =?us-ascii?Q?gamdj1oODpqVFMpduSy5yVXsYUnVi8vTvOm65wnazHejt2NvLRPRfItoebSc?=
 =?us-ascii?Q?/M1a4LubRofNQGSWI3/XreR0eq1IefwVtMOrswykDNBjXOmjJL/juSjp3zWm?=
 =?us-ascii?Q?73y8wYKJ8TI+8Ywdrv0qpe8ajn99KzBIWZCxC6f4y+C/ZqcCCT+5ipm8j8w2?=
 =?us-ascii?Q?zjJlIHMR3/QGEpPzaoGBx1cHdmNghbyJoZA2eTlpomHQ+W20jljOYCwbYm7Q?=
 =?us-ascii?Q?UdvZu2VM2P7nkugoJMWJOCKpj1SKUfoOjzscKPuWUZ9+tu4YiQ3Pe4IJJvY0?=
 =?us-ascii?Q?XqmgPIc90B698bMqIMECKPZ+ItA7OMNnNKjS6acKYWi96QvyCqBaZMx7RLdS?=
 =?us-ascii?Q?sLOmlEoL0JCVnuV+cfsZkk+rj23sPXnqWu/VXi6ouE6FxOZ7ZrzRnA9gJvl7?=
 =?us-ascii?Q?h2XXG84lyDZPw1Nk/rlEr/3c5JELltVeMms0d7E8+MjxlE3i7LYY1y6E2Fcd?=
 =?us-ascii?Q?0+kuSa8DlCqDgx+OVimS0P41mgS3Cxl2D4Y758vY2AJ/UBZhjnfOkToEuedJ?=
 =?us-ascii?Q?9zfKQgxw0QFLbXAmOf/N5DvD691mUWxBqHGMaF1z7tL7TNbasRn028adeSVA?=
 =?us-ascii?Q?dvp4b2J0QCZG29EnqOBcQZsGseKAbkX7VsmgqK6arJIO4RqO8d3XTe3KnAb4?=
 =?us-ascii?Q?mRqUQA49kMa4GWGN/p5hiJMnCP/5ISuEfmIxD+5GrF/9o7mE7W3eA2fwo+S8?=
 =?us-ascii?Q?SaRfmhTJj8gNdpFL2MKV0divD8vanESKSocy2oWWaHyeE1srPCMkMcmgxlv3?=
 =?us-ascii?Q?yrVsexmxdZpWtlVvHoCQE4Q9dG3ixND/WEzCdCvY1fC+2hrmvrwESssoz1oh?=
 =?us-ascii?Q?1dW8oAj0hdec+vgZYPpVFqeCDZLXM2TZek457LjsqwB5HiZXZE6FYkmTWwse?=
 =?us-ascii?Q?MEceuJSCZNXZcH/TeyjZiVjDnbpClRSdVFCV7C++t19A9Lg6+NnPL2uQlmt+?=
 =?us-ascii?Q?WBneAwns32RgzOzsoHA/fQ9o2GhA0pnjgdLaLymf6CYT742wjn92sRYuN4l4?=
 =?us-ascii?Q?bg0tt6xJa8wqz9nhDUashi6CBnz7/pVD58gwg0bPkKUSyjp4kndBRhrUsK6z?=
 =?us-ascii?Q?e1bY9eyiyxWknZPPhPpAarCTwHXi2QWGjav/7zYUhRipt7jXAWKSCbnAmhmi?=
 =?us-ascii?Q?figAFgp2U5KPW5p578UKeuwuRdz/WAUlJ03Q0rP6Dd8m/fbuUleLcHOXEbly?=
 =?us-ascii?Q?9zN8bXKOK5tXF56L5tg8W0lwU2qOislkdbf2sjG3ZEuOrqAyH1k7xpB5uZ1M?=
 =?us-ascii?Q?KRUBJp7W0MAXVwHsGWa44MMqEt3xx6jeT60yKT/DOT3ySlLttVes8C3cxtjJ?=
 =?us-ascii?Q?I2ZHJVSYQNwTos++HZN4Qp7vlXQf2tn3wQva3ViPZVRfyN/LmGUPwoKYwL0C?=
 =?us-ascii?Q?0otmD+5Wv+e/5iMm41H+ZiW+0ErXph8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM6P189MB310729BC843D70E67840C3D6F39D2AM6P189MB3107EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b99d0e7d-3ce3-4202-09a4-08df2a01771c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 14:43:09.1378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGahW51freomHp/0BW2GW1AZtH79PoZltR/uivDzKoBk0SmnZDjqGTFuku5Or7c7CtAQW1tu2IpCJpA/6NC7chIrxPA4fNxDWw//ATi3TEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2570
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247774

--_000_AM6P189MB310729BC843D70E67840C3D6F39D2AM6P189MB3107EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Please ignore OE-core] [PATCH v3** for libpcap , I forgot to prefix with sc=
arthap.

[OE-core] [PATCH v3,1/7] libpcap: Fix CVE-2026-0799
[OE-core] [PATCH v3,2/7] libpcap: Fix CVE-2026-31912
[OE-core] [PATCH v3,3/7] libpcap: Fix CVE-2026-31911


I will resend same patches with scarthap prefix.


Regards,
Jaipaul

--_000_AM6P189MB310729BC843D70E67840C3D6F39D2AM6P189MB3107EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann, </div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 11pt; color: rgb(0, 0, 0);">
Please ignore OE-core] [PATCH v3** for libpcap , I forgot to prefix with sc=
arthap.&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
[OE-core] [PATCH v3,1/7] libpcap: Fix CVE-2026-0799</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
[OE-core] [PATCH v3,2/7] libpcap: Fix CVE-2026-31912</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
[OE-core] [PATCH v3,3/7] libpcap: Fix CVE-2026-31911</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 11pt; color: rgb(0, 0, 0);">
I will resend same patches with scarthap prefix.&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 11pt; color: rgb(0, 0, 0);">
Jaipaul</div>
</body>
</html>

--_000_AM6P189MB310729BC843D70E67840C3D6F39D2AM6P189MB3107EURP_--


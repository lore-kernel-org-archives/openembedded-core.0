Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3031CA5FAE
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:06:56 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7357.1790687207044132166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=Q+Re/b7Z;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.72.1, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiaGRBjE+jS9+s6Ygtq7w6meo19KFMnVlJgl9uhZGoySDIxmMk3ig4GSy0OU5vku9R+e+ILcd6WCKJ2n7dMZl0Ss/PTTR2NHwGo5wQq1KqqI9vaIqmp+/dRnPYGX49um8P9InY1h+fiWRGPX0j45fZWis5qUNnfkAiz+RipTNMd17+wcy6WB0GAqbbkr2aKd6WDw50mNWzEaxVkpDPmC/oUD9bfGIV5Aze49uLGIKymbjdozYWZROrpmsUBX4bMtVVKtNmgr7znBZIA3EDan2lSTWaI+actEl+linMUIibLSBvc46Gjw9yHSFqlu6OqHsYoCWjfWO2JdnrEsusOWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x8Ky4ZhnLgG3/8KIKQwEKg/04ToRNomMiusFu2uXtw=;
 b=AbrlaNRlGm4lV/x+P4ju0ecuUaAYvRzZR37ywRRAAkzvtIzsB9WU3uAshTjxyEgDtW1MIENmV2MLUv7qPtUp1WrCw+iXeDu8U0cTx8UZ+Hs4j27Dif5r3Od2IYAnOZyk0nXwGoqxNpDpwYVGqCH0FJjpCseUqzm5DewQgWoDQ5uCtqmooBwYwhYe11QUJg35Qd2JscAYRLZ/Fsh3v6ZF52WYJXnZnb6DF1yLn9Y5R+DEVuyuJKjjyPcaA6oY+4+wJtyx2Cxbp37T44XUQ2fJqfusPs8auDKMRQPfF7B4Lpr4ce4TYLY63oo22ZQi7XuDtIygk8jlqEXJplfAe5gT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8x8Ky4ZhnLgG3/8KIKQwEKg/04ToRNomMiusFu2uXtw=;
 b=Q+Re/b7ZhnK9dJclfqYdoCr7Z3Gx6AOtxkgvI83/LUImazk8oxe7g0sjFYhbGkfyo9REZcaGFp9bANmBiu0KAK3Jkfl+dVTWKwcRzV+Pgf2QOEDb97mFjB15pmIW9DVdwjX3RtydMDiJT6BbqaIF6BndSLSE49qmln6sBrVJ7a+0itVjcakM1x6H5FKxy9XMVUZdVY/f31600molSFzgTZ3AOP8y2kFBxQb/wnIZVEFlNJ1Xg00PYxMZQgIQb64dNXBa44kIEzOpb2gm76fKWcJpON2Ne5NuvflalTLTsVSPl35YS7ZY0H1bRlvRwr4gUDjDoXp3bFT47oSrJLoB+g==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by PAXPR07MB7855.eurprd07.prod.outlook.com
 (2603:10a6:102:133::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:06:42 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 13:06:39 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH v2 4/5] gnutls: fix CVE-2026-42015
Thread-Topic: [wrynose][PATCH v2 4/5] gnutls: fix CVE-2026-42015
Thread-Index: AQHdUBNdaffaZWRm+EOn2uHOZATWXA==
Date: Tue, 29 Sep 2026 13:06:39 +0000
Message-ID: <20260929130622.246144-4-jakub.szczudlo@nokia.com>
References: <20260929130622.246144-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260929130622.246144-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|PAXPR07MB7855:EE_
x-ms-office365-filtering-correlation-id: 34239177-1cae-44ea-df2e-08df1e2a7fe6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|12006099003|18002099003|22082099003|13003099007|38070700021|10067099003|260925022911599003|260925021311599003|260925021911599003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 lXylZXe5rYFu0fXrFA3LvqvZtVdA9E2IO190yFIjkOJFlcfYu+cwjKzK8ICXqUBa8sA8KzZ4qJEmz1B0uO1OKT67EpUmDLyi6NqQBHSyxUxhP5tN6dnl1r2CLyDqE74ycVEQBuDEx567zV/YovXCCwnGiwC7oWj0ZrzeOFfv/70BMa0ayg0GYr/9HgP+SeJGPh19srNBPCuKJQHPHqtJjq9GhiIqiXYO9MGTSHlERJ6faR9JYekMrk80aawwiJWuqTtWsKBh7m59MdaYJK1WHp/45bq9buRxmNRNHTPmrSOQoLr20Go2sT5oxCxNoXJtpZyyZ4bys7Dd3r9xT2GmiihqvIISEaMuNKwo6WeHqAxJWuKyzi+gk0F1YrdC0xVR6w6GEwGOU8DGm+t6RQfa7zcquI5LNM6/X6fa6F6ZYOeyNkzxyOyBQZ6y5l13xhDnTdVYPJ5I8i00fSaS7+VRtNyLjcQGjZXFEklXc88+9CfYKPg4SfoDN1HLfYKNNoN15m2lXKWPX1Dzg0ZSpKBz2AnpACuTekL/XIjR2bMJ89AgvUhlIapLYbEI38GgQe8AHzQBtib21f5QLa5gcFQjpgLYH7MulHW89gRiYPkNowh3mmvqIZQ9/ZWQqA6IbCI0L+NTjTOvQY0mkVFwpHAfzFFPoqI9/baDihIJ1T07sb4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(12006099003)(18002099003)(22082099003)(13003099007)(38070700021)(10067099003)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c3BSQk82UkkwcDRaMmNtWTN4dE9sdGdWVWYvQW1kSE5BdzhEekdSaHRzTHo5?=
 =?utf-8?B?aG4vOHVLWDlvMTJuWStydlBxSnltZkNZTTFxS0pUMm9zeXp2MDFwQVJuUmda?=
 =?utf-8?B?M1huYi8xU21UbSttRHhvWG4rT1M2SGZaYTdjUEVWYkxMNURWZjYvWUpTWFR3?=
 =?utf-8?B?Wmlxelh4L0N1SUVISk1xOXBIMGluR3l4OU9aRlg2WnVZeUlhUHBLQjZvSk9G?=
 =?utf-8?B?RDVJV1JzOC9OM1ZhWEtvRDI0WUVUdDhvQlhOc3lURkJPQURhc21ELzVWRk8y?=
 =?utf-8?B?SmRxVzRCWVZrQW5mcVJid3lINnhQaFM5U005dFZKSXFmRnAwaWFyQTdjeEt5?=
 =?utf-8?B?YTBacVZxRWR0eGU5Q3JWOFVOOGh6SHl5elVaVWV6SnQ3R3kvUGN2SitYc2Vl?=
 =?utf-8?B?eVh2d2hUYjlEZTlIbEdncHBmM1UrNlhOVHdvVUs4dVh0aTJWR0hYSDBJbHFr?=
 =?utf-8?B?c01lbVFWSlYxZzJyQmhocXhUbCtMMFJoeHpNZlB3YUtoQXVJZTFyNldtWSti?=
 =?utf-8?B?T0pSTkpmVnM3bDRhSEJkcDRiRWtjWDZ2MENvMjVtVWhZTWVpYkJTNTI2ZE9a?=
 =?utf-8?B?ZDlUYzA4MytmSUx3ZGF6OFhXb0JQTEZxeUhKbkZHMGY1dUtqYk5GMVY4M3hl?=
 =?utf-8?B?M1dsS0w0SERlekpCd1ZHdFQ2WnhNMGxDT244dWtxa0hYZDM5WHo4emdGMkc3?=
 =?utf-8?B?ZFR0SU1XUFh4c3JFRkJmL2k4TmVZaUlXU3dVSTlLVGpDOWhnZ0xXWjRZeUhD?=
 =?utf-8?B?YnVxYVBIbjBCd0VUa1NkL0JleXp1REZMdC9SNzF0ellTeEZ3dnI3eCtPY1VN?=
 =?utf-8?B?c0hrdVlQYTR4Um5MbnNjVExYR296S0ROejhaSVdKV0lXY1VZRXJHM1BoOFEr?=
 =?utf-8?B?N2M2K3hZKzBiYnowdmdvc2orcjUyR29aVHc1emtoM2FOMWNlUnMxWjBSU2Zi?=
 =?utf-8?B?R3RtUGN5WXB2TkZXbmJxY1BkZk5VZ1RRMW45VUU1WS9La3dKMzJWWXZXS3pt?=
 =?utf-8?B?UXBXeUlQcGRlbW1iM29QQTFyK1RKcGs0dGVRcTZ1bklFWDFsVll5a2RUUU5F?=
 =?utf-8?B?TjNxZTNvckxVbi9jNWZ1V3ovUW5MQm1RNk1oalhkOHBCcnFoa1p1RE5jYW1z?=
 =?utf-8?B?akV3bVkrZ1BKVGxMZzdGZDV2cDlPZUZzVjFXZVdrRENCUHFZZWpvWC94UXhu?=
 =?utf-8?B?c2JuRzBoQ3RqWU5PSGtYaGtaNDhycjVhbnVGdXJBSWJCbGRTQ3RXL2t0RXM5?=
 =?utf-8?B?YWpscUZjcTlreWhQRFA1dnI3ajZyLzk3WEhhQUVmbUtiUFdJZjZ6Tk5rZWN5?=
 =?utf-8?B?ZlRQQ05ZTkF1R2FiNEI4WFFOUWE1Mkw0L0ZIblExV0Jyd3BmOHNqbmVVR2xP?=
 =?utf-8?B?Vm9UQkpGUWd5RWFQNktuS0RVK2ZRNEhwNjlkNDlzWXdXTjRpOXp2V3NaaGJL?=
 =?utf-8?B?YWdINXZMc0ZZSEl2dDB5Wk5mQW9ocXFKdUNRSjlIWE9PMXUyTDZMVkxPRzNM?=
 =?utf-8?B?c01lZEZ1cm12eWJ4MUxXOVdNWlBzd1VRVUJIMlh3bmZNNGFyTTZKb3NLRDJT?=
 =?utf-8?B?SXhCeHlxTUlzS01Rd1czSnRrdGtna1NHNU44Vlg1OHNNUTdaOEZvMFlOaU1J?=
 =?utf-8?B?bU5lcWgxTGpzaG95RjZDQ3JkV1NOV1U3aTRqYVpPZGFBRDdGS2lzcEViRk9B?=
 =?utf-8?B?bTNCMEJSWDcvWW9BWWZkOUhHV3NNbnd6R0JwNUltZWQ1MXluemhMUmdiT1Na?=
 =?utf-8?B?OTU0TmlNODRxbzFQTVFuR1N4a1ZqNVRhZk16WjJ5bElaRlFUNkdIUW1jQ0tz?=
 =?utf-8?B?cGwwdmhWQVRxc1psaXU3NXhtY2w2a0tLaVZVTElYTWRmZHJXWWJydCttTXpF?=
 =?utf-8?B?SWlUYWhmV1h1ZlhuSWFwb050RXIyQVNPYXFNTVZ0N2tjSE1sYmxvYzk4eXNP?=
 =?utf-8?B?Mk0yVkw0N1RuYkc0M1hEdWhTV09DQVNkdG1vZGhxTUkwMVVnMTMrelVzbDBK?=
 =?utf-8?B?M1pCc1M3OFcxQ3BxdUkxRWpIdE02LzQ3SzBmWUVEMkdMNmE1d1lLdThpMXBY?=
 =?utf-8?B?TkpjbTFueER4Y3kyRWluWmFadHFWOWtLM0d5ZENUV2JnSmJBemFucGZHdTM5?=
 =?utf-8?B?bEpZNWFkMkM3OHkrN2Z5T2x3UHNKeVVuQ0R2eHBJZEdKZjNOTTRRc2VmTFhj?=
 =?utf-8?B?NEhxT2dGekNIRkNQcFd2NFdSbDBSOG80aU94R3lvV0VaQWw0TFBwb1VhTTQ3?=
 =?utf-8?B?KzlvVDZZSGkzbHZ4eHBnUGg1VVN1YkkwamtxL25nKzlGaDZwNk5EbnBGMHpy?=
 =?utf-8?B?M3Q0ZGd1UVhvS2tlQzBLZWFOdzR0K3dEUVlPMXRwL3JpVk1qMFhTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34239177-1cae-44ea-df2e-08df1e2a7fe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 13:06:39.3140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pr+YoCagpur2166iDgDo976wYquELCBeURHytw3PNSIL7oIX7lCEytca8LxOesMg8bBtplrtteGWWywAy7Bq7iahCJHCzFjRE7GqpcczagA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB7855
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246861

QmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0yMDI2LTQyMDE1LgoKUmVmZXJlbmNlczoKICBodHRw
czovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNi00MjAxNQoKVXBzdHJlYW0gZml4
OgogIGh0dHBzOi8vZ2l0bGFiLmNvbS9nbnV0bHMvZ251dGxzLy0vY29tbWl0L2EzZTdjNTBkM2Ux
NzYxZTVlZjFkNGIyMjU1MDdjYWI4ZjJiMmMzY2EKClRlc3RlZCB3aXRoIHB0ZXN0CgpTaWduZWQt
b2ZmLWJ5OiBKYWt1YiBTemN6dWRsbyA8amFrdWIuc3pjenVkbG9Abm9raWEuY29tPgotLS0KIC4u
Li9nbnV0bHMvZ251dGxzL0NWRS0yMDI2LTQyMDE1LnBhdGNoICAgICAgICB8IDQzICsrKysrKysr
KysrKysrKysrKysKIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjEyLmJi
ICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvQ1ZFLTIwMjYtNDIwMTUu
cGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzL0NW
RS0yMDI2LTQyMDE1LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy9D
VkUtMjAyNi00MjAxNS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li4xYTIwNjUzNzFkCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
dGxzL2dudXRscy9DVkUtMjAyNi00MjAxNS5wYXRjaApAQCAtMCwwICsxLDQzIEBACitGcm9tIGEz
ZTdjNTBkM2UxNzYxZTVlZjFkNGIyMjU1MDdjYWI4ZjJiMmMzY2EgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBBbGV4YW5kZXIgU29zZWRraW4gPGFzb3NlZGtpbkByZWRoYXQuY29tPgor
RGF0ZTogTW9uLCAyMCBBcHIgMjAyNiAyMjo0MjoyMCArMDIwMAorU3ViamVjdDogW1BBVENIXSB4
NTA5L3BrY3MxMl9iYWc6IGZpeCBvZmYtYnktb25lIGluIGJhZyBlbGVtZW50IGJvdW5kcyBjaGVj
aworCitBcHBlbmRpbmcgZWxlbWVudHMgdG8gYSBQS0NTIzEyIGJhZyBoYWQgYSBib3VuZHMgY2hl
Y2sgdGhhdAorcHJldmVudGVkIGFkZGluZyB0aGUgMzJuZCBlbGVtZW50LgorT24gdGhlIG90aGVy
IGhhbmQsIGl0IGlzIHBvc3NpYmxlIHRvIGltcG9ydCBvbmUgdGhhdCBhbHJlYWR5IGhhcyAzMi4K
K1N1YnNlcXVlbnQgYXBwZW5kaW5nIHRoZW4gbGVkIHRvIHdyaXRpbmcgcGFzdCB0aGUgMzItZWxl
bWVudCBhcnJheSwKK3NtYXNoaW5nIGl0cyBsZW5ndGguCisKK1RpZ2h0ZW4gdGhlIGNoZWNrIHRv
IHJlamVjdCBhbnkgYmFnIHdpdGggMzIgb3IgbW9yZSBlbGVtZW50cy4KKworV2UnbGwgdHJlYXQg
dGhpcyB2dWxuZXJhYmlsaXR5IGFzIGEgTG93IGR1ZSB0byBob3cgY29udHJpdmVkCit0aGUgcmVx
dWlyZW1lbnRzIGFyZTogZm9yIHRoZSBjb2RlIHRvIGJlIHZ1bG5lcmFibGUsCitpdCBuZWVkcyB0
byBhcHBlbmQgdG8gYW4gaW1wb3J0ZWQgdW50cnVzdGVkIHVuZW5jcnlwdGVkIFBLQ1MjMTIgc3Ry
dWN0dXJlLgorCitSZXBvcnRlZC1ieTogWm91IERpa2FpCitGaXhlczogIzE4NDAKK0ZpeGVzOiBD
VkUtMjAyNi00MjAxNQorRml4ZXM6IEdOVVRMUy1TQS0yMDI2LTA0LTI5LTExCitDVlNTOiA2LjEg
TWVkaXVtIENWU1M6My4xL0FWOkwvQUM6TC9QUjpOL1VJOlIvUzpVL0M6Ti9JOkwvQTpICitTZXZl
cml0eTogTG93CitTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgU29zZWRraW4gPGFzb3NlZGtpbkBy
ZWRoYXQuY29tPgorCitDVkU6IENWRS0yMDI2LTQyMDE1CitVcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0IFtodHRwczovL2dpdGxhYi5jb20vZ251dGxzL2dudXRscy8tL2NvbW1pdC9hM2U3YzUwZDNl
MTc2MWU1ZWYxZDRiMjI1NTA3Y2FiOGYyYjJjM2NhXQorCitTaWduZWQtb2ZmLWJ5OiBKYWt1YiBT
emN6dWRsbyA8amFrdWIuc3pjenVkbG9Abm9raWEuY29tPgorLS0tCitkaWZmIC0tZ2l0IGEvbGli
L3g1MDkvcGtjczEyX2JhZy5jIGIvbGliL3g1MDkvcGtjczEyX2JhZy5jCitpbmRleCA5MTFhZWZm
Li4zODIyODYxIDEwMDY0NAorLS0tIGEvbGliL3g1MDkvcGtjczEyX2JhZy5jCisrKysgYi9saWIv
eDUwOS9wa2NzMTJfYmFnLmMKK0BAIC0zNzUsNyArMzc1LDcgQEAgaW50IGdudXRsc19wa2NzMTJf
YmFnX3NldF9kYXRhKGdudXRsc19wa2NzMTJfYmFnX3QgYmFnLAorIAkJcmV0dXJuIEdOVVRMU19F
X0lOVkFMSURfUkVRVUVTVDsKKyAJfQorIAorLQlpZiAoYmFnLT5iYWdfZWxlbWVudHMgPT0gTUFY
X0JBR19FTEVNRU5UUyAtIDEpIHsKKysJaWYgKGJhZy0+YmFnX2VsZW1lbnRzID49IE1BWF9CQUdf
RUxFTUVOVFMgLSAxKSB7CisgCQlnbnV0bHNfYXNzZXJ0KCk7CisgCQkvKiBiYWcgaXMgZnVsbCAq
LworIAkJcmV0dXJuIEdOVVRMU19FX01FTU9SWV9FUlJPUjsKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjEyLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ251dGxzL2dudXRsc18zLjguMTIuYmIKaW5kZXggZjA2OTZlNTAwYi4uODFmYjg4MGM0NSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjguMTIuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjguMTIuYmIKQEAgLTQ4
LDYgKzQ4LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL3d3dy5nbnVwZy5vcmcvZnRwL2djcnlwdC9n
bnV0bHMvdiR7U0hSVF9WRVJ9L2dudXRscy0ke1BWfS50YXIKICAgICAgICAgICAgZmlsZTovL0NW
RS0yMDI2LTQyMDEzLXByZTEucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjYtNDIw
MTMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjYtNDIwMTQucGF0Y2ggXAorICAg
ICAgICAgICBmaWxlOi8vQ1ZFLTIwMjYtNDIwMTUucGF0Y2ggXAogICAgICAgICAgICAiCiAKIFNS
Q19VUklbc2hhMjU2c3VtXSA9ICJhN2IzNDE0MjFiZmQ0NTlhY2Y3YTM3NGNhNGFmM2I5ZTA2NjA4
ZGNkN2JkNzkyYjJiZjQ3MGJlYTAxMmI4ZTUxIgotLSAKMi4zNC4xCgo=


Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B09C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 14:03:25 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69911.1783000994851597709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 07:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=Cx8UtwA7;
 spf=pass (domain: ericsson.com, ip: 52.101.84.70, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEWTMGq3DdHbQqWIMIBmzRPZ1Mjyz0s7hpt8G1lOnl87b/jS4Y4KfDEuzR4F3BPBE8/bmUYWAYpX7wfxvVH96wHgEXZDCpEzgiPgRvX8NY0Jza/ksSZATu02qwP3CrFhrq12iuW3wKi5/g1f04V5BsbE72Y6Trttri76VSWLnd9fV3IezJqtMEz0E7baE8EGruRK0/hAbOukx5BI1kP2YBP+jSVVPbvdM0aAIQsIm0PlVhJCAAiripEESjyyxFuQh48Wn1Uz/nfS6EdLK6cTf/xli4Kh5krv4TCUHk+lZbj759jQUVT64YSJqD/L+y9hQhEAQ71AaMxfaFHUpibiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4ysIIGNmFzPc8+Y2AwC1lQGCKTmQFJOokRqgL//h/0=;
 b=gpYGYhzFBvBPVLCHT6N4AzatxFpk66M+bm33RdTjdR7/pi7SOL4RU++qID/Ofs2yXruUOzerEOdLqu3eeygWBR+kelOTV7GuWFgJAB7YI/SZvlPgNBFEDLIhDg3v02+x/eZY3s6hcAfBcsPprOyhNiDI87wyp9bwPrXkv1Ci9s8m6uNt1cfE/Z3Ni375rTR1hY6g3eOqltLPdnVVSThw0Sn5MxIlasuoKB0xq6BcaqXMsTh/k2O3af0ifeqvb8a/aUde3t92MuyntbEELMagjuIA0Hp0hOGcleN2HJdjrVxPTPzRyJSdkIYJKp/TYEaePUOafbIVPWAN7jnKvy8G7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4ysIIGNmFzPc8+Y2AwC1lQGCKTmQFJOokRqgL//h/0=;
 b=Cx8UtwA7YhbJU9jrspXV+NvaRJjPtJDqR/XuayCbIRvtRQRoiw4gdW785X03QhxXfRzZNwQVncigMhUcL41JWmrKnmc1N8WjQ2lJ8INm2qLjtnUfY4N7OEw8z8ECy/JglNfx1q3nWysAHPf5WYn+i6HeKlcqTq+K6S4OuLBBHA/7T9m3IQ37S9E3aOcvR7/Lu1I5jV/09Z33oip+8qyV4OeBC83wRNAWNULSq04O4YUgttFCTygpFV79zGjDHuqNZfArUnC3Ka13x8Svt6tivA9uNT0LDZyUAtiz3/x1UTxOWsc9toQkT1k2f5dcHFMBEbcnMY35bt9gzqtug2N2AA==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DUZPR07MB9999.eurprd07.prod.outlook.com (2603:10a6:10:4b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 14:03:10 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 14:03:10 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "qi.chen@windriver.com" <qi.chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ross.Burton@arm.com"
	<Ross.Burton@arm.com>
Subject: Re: [PATCH v3 0/3] systemd: update to 261 and be compatible with
 rhel8
Thread-Topic: [PATCH v3 0/3] systemd: update to 261 and be compatible with
 rhel8
Thread-Index: 
 AQHdCIa1vskK4SNBwEGlQJdUOSKzmbZZ6sUAgAAF+ACAAA/hAIAAEzGAgAAl5ACAAARUgIAAB/IA
Date: Thu, 2 Jul 2026 14:03:10 +0000
Message-ID: <ccba20fef83c8e19465f716354ac1c100c6a1659.camel@ericsson.com>
References: <20260630115028.4001775-1-daniel.turull@ericsson.com>
	 <DJNY5PFZT70X.2O5P68RPD0PJU@bootlin.com>
	 <afbb3cf90ff55c3b4e693b8a28a6903b7f34f946.camel@ericsson.com>
	 <DJNZTL96C89O.1S6YFZXO1KCJI@bootlin.com>
	 <CANNYZj-duZWDtw2XP8SYg8gqhEbVDhnATLByJw+kAN2EjY0ZNg@mail.gmail.com>
	 <7ad0d4852da4b1f13d6637f1e6e7dc6c674e2731.camel@ericsson.com>
	 <abbb21f83c63fecd56c11da7ba4442094e96ccda.camel@linuxfoundation.org>
In-Reply-To: 
 <abbb21f83c63fecd56c11da7ba4442094e96ccda.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DUZPR07MB9999:EE_
x-ms-office365-filtering-correlation-id: 66b90de7-a883-418a-8942-08ded842a684
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|4143699003|38070700021|18002099003|22082099003|6133799003|56012099006;
x-microsoft-antispam-message-info: 
 MZg931VRcn4MvSAp8Zy1YwjA7KtRWl4tLtJI2z9xnq4ahoPBh4oKI9/l9FcU41g1S7LT0IrPd7p97C5CPIcX8Tk3ul+1NpfLBqEkb4nl6mzKPwIBQTUXgSwDQ9lyoAjKNuwUXS+NvScSzOh2P0ekb8JqHzHb9rrw6YRhZr8ZL5l9gIWlDta4V+Do78eLe/gwwYBNQmcsqyPQJQvZRsDn4o0G968jmY5lcljyCFdn8lh5+P9Q6J5alcLozKmhvYDDRPI75y+BtASEKT+Xki0044WOA+tuCpyUQOE0KjS4KwJG6CkIwiGuA849qiwA4hKiI9FZhuc5u1Qjm6sW33NcGhqYndZbOIZbVJuRlliGVDIWey8cdqYzFh1fwbE1hCtYqfaIyylUYgBCSzWnU4xVBgZVZhQ3QuXwgw/4j6sh3hkI8B+Y502r++H0IJrqlVYLZZJU1eRT04is76B6T3LHNfKjPojvVaX1XOCbnKlSEghNv/RGB4q3ilE662Xk2OhcPjKx9G2+PTK4FIoCjpWIBTxFQUGfb9ASnpZrx+TLZqc+ySXP5fBkfKxa8R6bDZom6UgGUJ1kU3sraZmM/0couB3r/gObFkeMnASg87xFWrqWNriyWaBivPGFKj2Bian2ktmRdb/x7g811Hkl9wEzkDSWGPTsZEjDq12oLQs+KssuIFg33IFK3NgOKrV96PwrIQwBaXBCF7hECMjzC5p4wbcUpldIcLDduahmjyr9HUw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(4143699003)(38070700021)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R3VYbU80V1p2YUx0YjdDNGpJOGgzYUVyU3Y0V2JYZ1MvK3QxNFVLT1VXWmNK?=
 =?utf-8?B?WnlueE5sRmJycG9UTFN1K3FzRlJ1WkZxRUJDbFYrRnoyUEQxWXVscEtHMjdo?=
 =?utf-8?B?c0Y0N1NKeVBTcU91dyt4Q2F4SHJVUlMzK0Y0ZzRtd3hWMWxQVVFlYjRNVzVx?=
 =?utf-8?B?MnZicGVkR3g0V2lHLzFyQS9ZdXRESWx1azdkVmYvZmFJd2dxbFRvb2srUWVH?=
 =?utf-8?B?Vk44c3psaDZ3MTMyVVM3WmF1eC92amhDZG1QclIxTWxtRTh0d2FaZjBVWlJx?=
 =?utf-8?B?bDlTS2pxR2tBNnFybVc1d3QvWnpOTWQ1ZjAyNVE0eUMwSy9pLzRYeEpORTRN?=
 =?utf-8?B?MWRTRG5nNUJnaXdGL29KakJBRk5YZk9aNDd2RmVSNklwbGRtVHRyNmI3ZDB2?=
 =?utf-8?B?aEpxUWZPR0ZzYXg5ci9GSFFteDFCTUdCVzY3TVludTBhbGRZZkVJYkd6TWc1?=
 =?utf-8?B?amdZVVd1QnJJSlNWbGxPVEhqK1RTRWNWZVVjNmxVdzJlbWxBQUk4NDNiN3Q3?=
 =?utf-8?B?ZGdJS29wQmltZXhDVi9DRGpXdmtQdFlOaFZaV1ZUdVgrSnJTSG1Da2lvVzEz?=
 =?utf-8?B?dm1icDI2UGJqTmhFTVowQmJxcndpdWo3R0tJUzI3N1liUGZuMHBSQzdXeC90?=
 =?utf-8?B?ZXZnZzZQd2NYS3M1TFo4Rk9acUZ1NEY5aTlxMUZ1NmxBZSsrNW44UFlndzhk?=
 =?utf-8?B?NEN3RkRHNnRGMDRFbEMxWFNNckxqdDF1cnUvTmFtL3pjbEE4T3QvaEJMbmlE?=
 =?utf-8?B?MWZTb1BiU0NWWTU3c2hxTnc3VHJyajNLZFNrcVIvZTZKSW8xOUF6Sk9NeHFU?=
 =?utf-8?B?bENpTGFhdmoxU01WdGtPaVFNdkpmRlo4UW1UNStqU2Zqb1hVUEJwUFhPU1JX?=
 =?utf-8?B?a1VNelFNT0VKYVgvRmlSRXhyaUlWSllFODJZTGNQell5VDBTaHhEVE5waDlP?=
 =?utf-8?B?cTZWSHJJT2Z6WkNuUVJ1UHRQbFVDNHVmTzFRaml5UDhIa0p3N002aSt1M0Vu?=
 =?utf-8?B?U0dlN0JvQ1o4bWo0NVI1MjVkM2NNNVkyc2pYQ2xyNVk4dFpiL3BVMzlzMkRx?=
 =?utf-8?B?bUphTW02WjdWRXFnRTRFVUR2QS9JRzZ4a0k3TkUzV0tJeVIzdEw3eEl3Ym5h?=
 =?utf-8?B?Z29VNWRHMkorc3lMb1pWc1RpV0x1Zy9RMDZRa0lrdy9EM2hQOGEraGtQaVFk?=
 =?utf-8?B?VWdPbU85VXdPYTRGZy94cGdrV2pkUlc3TkVoSHhGQkpmbGNsUG83RzdtelpB?=
 =?utf-8?B?a1c5dGszYkpreUNqdFpzNE51dFFVcGdhdFJQdWZtQVdzallBVzNKbllHUjBG?=
 =?utf-8?B?a0lzclhXTWl3bzRZeVJrbktXaVp4NlFnOWZreDh0VlM4eGZEZmJVbVNxaW9T?=
 =?utf-8?B?ZytyMGNoSENzOFpFUEEwRm15aUF0TGQyUzYxRWdtME93Rm4vMlBPTVNNY295?=
 =?utf-8?B?aGx4VzBtTko0OFMwSmFwbWltb3lXaHVnZWdXSDZKYnEwYk5JNXpObzk1ekZt?=
 =?utf-8?B?cm5naGxiMEdvWHVHc0NyWENYY2ZxbDZUd3AzanUyRFVhcklDZWZ6V0lvT21i?=
 =?utf-8?B?Q1VRU0h3NUhVdWZqb2RsczBKdERWRURsaEEwcWt3d0NNanFEK21YK2VzeDdm?=
 =?utf-8?B?SjErSGtMN2dzbWhxT21oOTFKUmFWUnZxVldhR3llQXdETFh5U0F5Wmp4YnBG?=
 =?utf-8?B?OHJHUFkwK2pxdjNJbWgzeTRZODFTcUpDWDZ5d2hNaDZ6UUt2clNFSDNqR0lX?=
 =?utf-8?B?bEdmZXVjRjRwZlZBOWE1RkE4aEJiNTBQV0ZxYzZXYnVydmVFKytkZGVEUnJk?=
 =?utf-8?B?QnhEeFpGUTV6VVN1TXYrZDhiNTR3b3pYYkJGb0FDejNzclhXVCtoTnFpL1pQ?=
 =?utf-8?B?aWtLNlluVXNrN1NMd2NYMlMxb29ZQmsxZ3JlSGtZTjZRYjJQQjk5bEpERHpU?=
 =?utf-8?B?aUs4ck5EeW9Fa0VHdTlxVEh3aXJ5ZVYzUkdVR0J3WTE0Wi82K1YwT3dpSWFr?=
 =?utf-8?B?VTh0Rncza1V2VDVkb21QQXpZYWVpN29jWFpycWx6cmxxcXNtd3RXbENzT2xm?=
 =?utf-8?B?QUE0S0VqcFlvaHlxS3JxRTVsYVhhcmhlb25VY0hlZ2NFUVU0QnVGRFZKK3BT?=
 =?utf-8?B?Y0pWemtOVmlna2YwRzU3ZTJqSUZ5VnBuR2ZrM3c1dnRWakNlUzNIeTRFbW9Z?=
 =?utf-8?B?anpnQTJzSUhZSGI3cU1DS2QxcWVqeVZsM1BkU052RlJ0N3lIaE5SZGw1S1h6?=
 =?utf-8?B?SnlxL3ZMYXVhQ1p4WHc2NVY5TzlaVFBPRitDQ3ozOVo0WmI4OFVybW5YNzFk?=
 =?utf-8?B?NExmenM1bE0rWlZFWnorWXgwZEY0UXprWlJvTWVvLytKMFpVMG40bWlETG9O?=
 =?utf-8?Q?E8CZmCb85vKcpwkQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1E669D54B2B0F41B97D5B975277758C@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b90de7-a883-418a-8942-08ded842a684
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 14:03:10.5798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WiULpMDNWmPBdQDPj/M6gH74NATQ5jBkTT/hhZcvEfBYrx4lLD4zirlWClhxRRGH9l3ncQ1sZr4O9wWHB7GWcehWQbAPtyW2gNIokkIE2KY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB9999
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 14:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240053

T24gVGh1LCAyMDI2LTA3LTAyIGF0IDE0OjM0ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gVGh1LCAyMDI2LTA3LTAyIGF0IDEzOjE5ICswMDAwLCBEYW5pZWwgVHVydWxsIHdyb3Rl
Og0KPiA+IE9uIFRodSwgMjAyNi0wNy0wMiBhdCAxMzowMyArMDIwMCwgQWxleGFuZGVyIEthbmF2
aW4gd3JvdGU6DQo+ID4gPiBPbiBUaHUsIDIgSnVsIDIwMjYgYXQgMTE6NTUsIE1hdGhpZXUgRHVi
b2lzLUJyaWFuZA0KPiA+ID4gPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gd3Jv
dGU6DQo+ID4gPiANCj4gPiA+ID4gSSBzdXNwZWN0IHdlIGhhZCB0aGUgc2FtZSBpc3N1ZSB3aXRo
IHYyLCB3ZSBqdXN0IGhhdmUgYmVlbiBhDQo+ID4gPiA+IGJpdA0KPiA+ID4gPiAodW4pbHVja3kg
YXMgaXQgbmV2ZXIgcmFuIG9uIGEgRGViaWFuIDExIHdvcmtlci4NCj4gPiA+IA0KPiA+ID4gRGVi
aWFuIDExIGhhcyBob3N0IGdsaWJjIHRoYXQgaXMgdG9vIG9sZCBmb3Igc3lzdGVtZC4gVGhlcmUg
YXJlDQo+ID4gPiBvdGhlcg0KPiA+ID4gZGlzdHJvcyB0aGF0IHVzZSBhbiBldmVuIG9sZGVyIGds
aWJjLCBhbmQgdGhleSBkbyBub3QgZmFpbA0KPiA+ID4gYmVjYXVzZQ0KPiA+ID4gdGhleSB1c2Ug
YnVpbGR0b29scy4gU28gd2UgbmVlZCB0byBhZGp1c3QgdGhlIGF1dG9idWlsZGVyIHRvDQo+ID4g
PiBzdGFydA0KPiA+ID4gdXNpbmcgYnVpbGR0b29scyBvbiBkZWJpYW4gMTEgYXMgd2VsbC4NCj4g
PiA+IA0KPiA+ID4gQWxleA0KPiA+IA0KPiA+IFllcywgSSBjYW4gcmVwcm9kdWNlIHRoIHByb2Js
ZW1zIHdpdGggZ2xpYmMgb24gZGViaWFuIDExLg0KPiA+IA0KPiA+IEkgaGF2ZSB0ZXN0ZWQgaW5z
aWRlIGEgZGViaWFuIDExIGNvbnRhaW5lciBhbmQgdXNpbmcgYnVpbGR0b29scy0NCj4gPiBleHRl
bmRlbmQtdGFyYmFsbCBzaG91bGQgZml4IHRoZSBpc3N1ZS4NCj4gDQo+IElmIHdlIHN0YXJ0IHB1
dHRpbmcgYnVpbGR0b29scyBldmVyeXdoZXJlLCB3ZSBtYXkgYXMgd2VsbCBqdXN0IHN0b3ANCj4g
dGVzdGluZyBvbiBtb3N0IG9mIHRoZSBkaXN0cm9zIDooLg0KPiANCj4gSSdtIGFscmVhZHkgd29y
cmllZCBhYm91dCB0aGUgaW1wbGljYXRpb25zIG9mIGJ1aWxkdG9vbHMgb24gUkhFTDkNCj4gZGVy
aXZhdGl2ZXMgOiguDQo+IA0KDQpJbiB0aGUgY2FzZSBvZiBEZWJpYW4gMTEsIEVPTCBpcyBBdWd1
c3QgMjAyNi4NCmh0dHBzOi8vd3d3LmRlYmlhbi5vcmcvcmVsZWFzZXMvDQoNCkFuZCB3aXRob3V0
IGJ1aWxkdG9vbHMgSSB3YXMgZ2V0dGluZyBhIGRpZmZlcmVudCBlcnJvciB0aGFuIHRoZQ0KYXV0
b2J1aWxkZXIsIHNvIHByb2JhYmx5IGEgZmV3IHRoaW5ncyBicm9rZS4NCg0KSXMgaXQgd29ydGgg
dGhlIGVmZm9ydCB0byBwdXQgaW50byBtYWtlIGl0IGNvbXBpbGUgd2l0aCBEZWJpYW4gMTEgZm9y
IDINCm1vbnRocywgd2hpbGUgdGhlcmUgaXMgdGhlIG9wdGlvbiB0byB1c2UgYnVpbGR0b29scy1l
eHRlbmRlZCBhbmQgd29ya3MNCm9rPw0KDQpDb3VsZCB3ZSBtYXJrIGluIHRoZSBzdXBwb3J0ZWQg
ZGlzdHJvLCB3aGljaCBvbmVzIHJlcXVpcmVkIGJ1aWxkdG9vbHM/DQp0aGVuIG1heWJlIGlzIHJl
ZHVjZXMgdGhlIGxvYWQgb24gdGhlIHRlc3Rpbmc/DQoNCldlIHJ1biBidWlsZHRvb2xzLWV4dGVu
ZGVuZCBvbiBvdXIgcmhlbDguIEl0IGlzb2xhdGUgcHJvYmxlbXMgYW5kIG1heWJlDQppdCBzaG91
bGQgYmUgYSBndWlkZWxpbmUgaWYgeW91IHVzZSBvbGQgZGlzdHJvcyB0byBidWlsZCBpdCB3aXRo
DQpidWlsZHRvb2xzLWV4dGVuZGVkLg0KDQpDaGVlcnMsDQoNCkRhbmllbA0KDQo+IENoZWVycywN
Cj4gDQo+IFJpY2hhcmQNCg0K


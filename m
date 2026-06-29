Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43416C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:13:03 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34514.1782727972549805215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=KwZTmnGs;
 spf=pass (domain: ericsson.com, ip: 40.107.162.35, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERikB+GlVekISkRYctHU0Z5wtU7iMYhImUcpjs29bX2R40DOmeJxzXLuCZt6YsFl7mRO0TWa0ZkhoYaG1V3mTDThT0XSxZXEeGbbBcdeASjlDqqAA+4b1kdMOcZaRlr2XGTuoo5fLUNp6mYz7Ld6W1NGSWI5HKMxh1VlOH1U9AaC0mK9lSIyzNcV+ZmPmDNtzgq6Wl77tLIQIgD2WB6gv8OBsq4m0cQ/DDuaFj3XQF964h9EWN3S4f2mYdajyvKtpOM/yT7WDbEiFmwSzWjEin3IDucDQNBerwjr0vzfS1JErr/s8pKDpy7PuwQn3XbdWpRuPR35y8nqTSrSxPS32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh+3u0ovaXi3ZNcIlVh/EExw2MtJPxW3LY0weII63J8=;
 b=tgdQCQ6PWnp+axOMdyIRsy/iffAtBFmIHtxNpjf/zLA+f2vdA6FC8SNWg2HBLA55gVUZt0TbVUj/P3unojNJWT9Xcfwll1XvVMDHuK/ZR3PN0ZDHfZ1Mb17uhU0zfeBJhjy49TpGVny24hYt3wfb4wRvU+/pgI3gSy3yaTsJBSd4Gu41AvTzlsoGGTHvlOyOzr9TDMIboR30ZGzyN9rXTcwz6aRDgoQYAUU/HnhsToyzJX34IdPiWRODF/CcGSq+WqXpcIAkkvKA6lDjHkndWgKWrxJSWJ4/2G1B/mbgiLQlgeS6m6uHl3Sp1B5KNFfmS7tksXCKYMkTzPDel54mtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh+3u0ovaXi3ZNcIlVh/EExw2MtJPxW3LY0weII63J8=;
 b=KwZTmnGsvuTjG3SaEE7XOWwnnqCfvvyd6TYW7HtFWZWxO5KRmCTY5JVIVBpLMuAyD5rLltwclIpY8q5AEJwzxzZbBCU0tBUXBtZBTxz2vTDzIiDyhg2591yG1e0WN7VvylQ4YSTd4iQDPprxKpcMYe8lCHSWA0hzj5KSN3X3EBUUKgLBps5s0YwpBqOSCMHIDqJYcHlqF8hHt0q1HAry20H2kog/+8Y2/HW51bN1txs0It5rmJvKuSkZSxKFVAxTMBJwdfvJF0ychPRzNoM70oPVzhSA4ljq6BWJjDa9XkNMM0IvvM1pF8hsPDRpnMG7wNTkYxD5cUbWimjGzpz9JA==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AS4PR07MB8460.eurprd07.prod.outlook.com (2603:10a6:20b:4e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:12:48 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 10:12:48 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH] systemd-systemctl-native: disable
 libpam meson option
Thread-Topic: [OE-core] [wrynose][PATCH] systemd-systemctl-native: disable
 libpam meson option
Thread-Index: AQHdB6MzxlYI9ej90kmz6P/ac70Sq7ZVSoQAgAAF4IA=
Date: Mon, 29 Jun 2026 10:12:48 +0000
Message-ID: <6aeae8a4c115d6a60c82fad10b4832ec809b4a80.camel@ericsson.com>
References: <20260629084157.299017-1-daniel.turull@ericsson.com>
	 <CAMSfU+5ipfW1CCFQ7=7ndWW1nQAsbaJcj9ditV9gwkPr=2sgfw@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+5ipfW1CCFQ7=7ndWW1nQAsbaJcj9ditV9gwkPr=2sgfw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AS4PR07MB8460:EE_
x-ms-office365-filtering-correlation-id: f42b1c7b-2b19-43d4-20ff-08ded5c6f899
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|10070799003|23010399003|376014|1800799024|18002099003|22082099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: 
 QKXgruOD3pZHUT0HcxKuL6wIB7WiqxcZWE7Ng1wpULvax7uv6V1Cx6I6ERRHRS8QYz3wsyam73EnDcSV/fsBsUz9j+6zJmiWtgb/xrp3j72NJtc0oLr0NCkYdFJ1zcJ/4ENtg6pTY8uTN87JP8JS1x3FE2kXMIqv3wuthJFh2BRfR2XpzXHePxPDxpwZ59Dddck02EqoK2F++SpFDpbUD+hNFFUroNhIGtAConq9GkrkePlOX1W+q007qPc8LGYHTU/UmxxPyytKFJj9xU+8epuPMnsoOIMqYNDVjym2dVwP+YzbCkcSfG5ZoTvkgt9mLUI0ooAPskUxTSkj45qOLrDE1LhY9ewVAaxtyWABe8+Ga3aq3vsTZtoDUGsQ6Tv2R8lgWzMHq6oVWKDtrTryr2ZBdXfBOtEPJPotuurO/WybjRDY5XnIc2WCQ9bBWRMwndHVo1XGdhjgOdaIBJTTkpMQbXhLh3rRCzEyezdWwphs8mD6Lz31cquxWyxJSknaZw0snyn/V+cjamYurzIY0dIIf3CObj8j8y4fW/cKUMM28+XHw768Dg0jXLpPWN7vun8vsrZI+IKt79b07YYxQjXwWDnlqFRSzZFFWCYG3At6cFxCYpoNk3xuqV6SKWxaD5sD5kSxlj6ocD3M6cqo8yiMTxMUMNa1Qt45yDtACsriWgPwA17YmFnCzjL/mh4HJ/Yf4wIwaHpxLeMCovGVCpaabRk9rLn/NeqIlwTskVs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dHVBZGZ5amlGbDlGR2ZZekl3R25ia0lUQlNWL2dnenlXTVRMYkJlbXF6MWNu?=
 =?utf-8?B?em9nQkNhWVJ3Q2grZEl3cVVER1NyakF6TS9RRmUvR20xRWJ3QWN1K3dORlRo?=
 =?utf-8?B?c2c5ODB6c2xBSHN4eUt2TXc4cUFraFQycDRncE5tV2pQU29RQWN4WDFUbWln?=
 =?utf-8?B?enhRU0hLVmtsOW5RSGh2ci9TcTI5M1dhUDlFMGxLVXEra3lBN1kxcGl0MGdm?=
 =?utf-8?B?a0ZwQjVFdXFNMGtEend1d254YjBLTjBGVlJtaVZMbTByZy83LzFGTVlBMXc1?=
 =?utf-8?B?MkhaYitmVlppVFlmdkpQS1FwVmxHNTNMNm43MlJwclQyM0JhSS82TUdMdUk5?=
 =?utf-8?B?TXYrczF3YnpjUnFLbUtOU3ZveWhpQXFWbnYvcnltNXd2cEZRU0pFMVhBY2ZO?=
 =?utf-8?B?OFpPY1hnV2phaVlmSkI3bkFQSVlLQld0bG5rUWV2OG1CUEFCa0VSV0txa2lv?=
 =?utf-8?B?ankrc0NnUFVVa0UrMkxMUHpqQ3c5b1dscEI3b1dydVplRDZSNzBTSEpUamNI?=
 =?utf-8?B?V1NRMmtEVEdCaytmbnl5WEs1b3JEU2lYclI5TlFRSEpINUhidUVTTnVQUElB?=
 =?utf-8?B?V0Y2c3lZMi9LWEV1ZFcwaUVGdDcxdTA0TnBscWZYQ01qTWo1cGhqTjFxcHN2?=
 =?utf-8?B?Zkh0d0swRGNwdXpDY0d1cktDMWZUbDREbEVNRUdUb0Z3akZUV1k3T3Y3OXNR?=
 =?utf-8?B?NDBiM2QzUG1SanZvNkpHdU5oRHUwTm9jZ3dPKzJ1aVRsN202a281QnlBdWJC?=
 =?utf-8?B?NEU5cGJsNVAvZ3BOamZ6VTRxRkdNMGtNSzF5T2xjVGlPbXcyNzNER0o1d0x4?=
 =?utf-8?B?YnNJcTJBa2hpMmU3YzYwZ3ord3JCNzIrY0dBdjNRTTRFaGszSHJEREd4UjNq?=
 =?utf-8?B?dWFkbGVzNDVoazAzZ285ZlBqUmM0bmVCbmkvcER3TkEzK2I3TUhYWWpjZEVW?=
 =?utf-8?B?ZldkUjcwWDRxZDZOMlYrRkh6ZWxiZ1dpSXYreHdnRkNydjg2bjNqVmpPdVJr?=
 =?utf-8?B?U0Y0Z2VGUnVMWEhkY3JYYkZXalVPTjNCbEw3Tk9nOTRrV2pVcjFHN0RvYlVG?=
 =?utf-8?B?SVVLbVl5ZjcxeGtCL2orZE9EOHVsRm5vT3B1cXJWTExYdEZQeFltTEdrMWZr?=
 =?utf-8?B?SGt6cnRmMFU4NWZLR2Foa0FpVTRSNlhXTGhwb20zSStueU0wWWtKMEtBa0py?=
 =?utf-8?B?dGo5LzFtMXl3ZytPV0hiNVVhUkRGK3FRZDA2TVhkUlVYdmtlMjc4SnZRWXIx?=
 =?utf-8?B?RXBZS25XTm82RHhnd0RXV0NGanZ2SlVBcjF4dGl6L2YyMEZTSTUyU2x5OGtG?=
 =?utf-8?B?dnFYNjJrbWJwbEUzUnFmeE0rcWhkMk5sc2NJbU9oN0dFNXI5cHcvbkM0TTU1?=
 =?utf-8?B?bE1OZUtLbldSUk01UTFVc3doS1JZcVdMbkRvMUNoS0JrczFEcXIweXBOTUtV?=
 =?utf-8?B?M3Z4NW9IcTVQeGk0TGNhWVVvaHZ4VEovNWZEd0UzRThqNTBzRERJbit4TTFN?=
 =?utf-8?B?Z3pKRkpkZ1duK2RjWnczU1M1SENXK3FJWGs2OXdJeE9TZW83L25DN1czc2hn?=
 =?utf-8?B?S0xsUDREaW40c2h1MUZYaFBGRVcvOEk3SXdOZUt3WHc5YzFKVVFPenUwK2ZC?=
 =?utf-8?B?amM1MVpiWm9tYjZVazBXVHFCajN0RWRnaWJSTmE3OGEvbWdJUVRjTkI5S0Q0?=
 =?utf-8?B?QjBVeFlVNEgvbWdqQlI4MzhiV2lLM1JsWnpvVGFTV2IxQ3E5SEVubHJkQnJJ?=
 =?utf-8?B?Y0F3SHRMVko5Qm9uVUszL0ZvNjVxbndxMkoxSitSK1IvSDVSRlpVd29wMi9B?=
 =?utf-8?B?YnQyL2pZTStqMWlUQ0doMVBROVZsSjQvak1aeXovRnZJelh6c0lCc04wdnQv?=
 =?utf-8?B?QW94NkIxVkRTSGRlTUVtclVVbk5OYXBOQjREU2ZrUDI5MkFMSUdodDJ2M0x2?=
 =?utf-8?B?ei9WY3E3cndlMEc1MDB2SUxjUU1DMHN5QjcrUVg2YXBpRU1kdTVZMlUrZUlz?=
 =?utf-8?B?WGgwcmlTQVhvRUl0b0FESGlhZ1E3MnFUMEpWTkxVemc4NXZEUlltNjlvUlNL?=
 =?utf-8?B?WS91czJEYkxjRmJCY05xY2l1NnpmS2o5NENFVm12Ri9CaDRYUGdBUFhSQi9u?=
 =?utf-8?B?dVAyN3c5Q0xxUWNiR1dtQ1cyRFY4MWlkbkNDT1k1bGM1TzRZTUdZTFI4ZUZ1?=
 =?utf-8?B?OERRQ2o1clJac2FHdUpFNXlOVmllQjY5aXRxVSszQ211T0xUYy8va1FWTnpT?=
 =?utf-8?B?YllQRlBSN09leU1wSGpoZFRRMENHM0ZRTkN2RWtGOUZSSjFPVHdPU1VncGxQ?=
 =?utf-8?B?cEoxNURCQUIvMXRjR1JuRnhKWFBXNDMrV0o3UU9YTlkwcnJGOVpsdXlpcHgv?=
 =?utf-8?Q?ii7bHF8rMIX0hZoqVkWY7HhzKxLJ8zSDSK+valFxcLF/x?=
x-ms-exchange-antispam-messagedata-1: mNHMmn3V+qTjS7VRz408K9QCja7ZHnm65JA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3BB55F188F13E4CAC5F3B24F4261E98@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42b1c7b-2b19-43d4-20ff-08ded5c6f899
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 10:12:48.4077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EXcMkrsM/YmVLpnhZMsRass/8TQ0j5U/zSjbXrhTPtTiqLEC/IxVJQTo0x7ea0vyFoIgwu31CV4QQXNn3czciCs12MxMiIstNTa4k8JuM8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR07MB8460
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239745

T24gTW9uLCAyMDI2LTA2LTI5IGF0IDExOjUxICswMjAwLCBZb2FubiBDb25nYWwgdmlhDQpsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiANCj4gDQo+IExlwqBsdW4uIDI5IGp1aW4gMjAy
NiDDoMKgMTA6NDIsIERhbmllbCBUdXJ1bGwgdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gPGRhbmllbC50dXJ1bGw9ZXJpY3Nzb24uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IGEg
w6ljcml0wqA6DQo+ID4gRnJvbTogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nv
bi5jb20+DQo+ID4gDQo+ID4gV2hlbiBidWlsZGluZyBvbiByaGVsOC4xMCB3ZSBnb3QgdGhlIGZv
bGxvd2luZyBjcmFzaCBkdXJpbmcNCj4gPiBkb19jb21waWxlDQo+ID4gDQo+ID4gc3lzdGVtY3Rs
LTI1OS41L3NyYy9zaGFyZWQvcGFtLXV0aWwuYw0KPiA+IHwgLi4vc291cmNlcy9zeXN0ZW1kLXN5
c3RlbWN0bC0yNTkuNS9zcmMvc2hhcmVkL3BhbS11dGlsLmM6MzoxMDoNCj4gPiBmYXRhbCBlcnJv
cjogc2VjdXJpdHkvcGFtX2V4dC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+ID4gfMKg
IMKgIMKgMyB8ICNpbmNsdWRlIDxzZWN1cml0eS9wYW1fZXh0Lmg+DQo+ID4gfMKgIMKgIMKgIMKg
fMKgIMKgIMKgIMKgIMKgIF5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4gfCBjb21waWxhdGlvbiB0
ZXJtaW5hdGVkLg0KPiA+IHwgbmluamE6IGJ1aWxkIHN0b3BwZWQ6IHN1YmNvbW1hbmQgZmFpbGVk
Lg0KPiA+IHwgSU5GTzogYXV0b2RldGVjdGluZyBiYWNrZW5kIGFzIG5pbmphDQo+ID4gDQo+ID4g
bGlicGFtIGlzIG5vdCBuZWVkZWQgZm9yIHN5c3RlbWN0bCB0YXNrIGRvbmUgYnkgYml0YmFrZSwg
dGhlcmZvcmUNCj4gPiBkaXNhYmxlIE1FU09OIG9wdGlvbi4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gDQo+IA0K
PiBIZWxsbywNCj4gDQo+IFdoYXQgd291bGQgYmUgdGhlIGNvcnJlc3BvbmRpbmcgbWFzdGVyIGNv
bW1pdD8gInN5c3RlbWQ6IHVwZ3JhZGUgdG8NCj4gMjYxIj8NCj4gDQoNClllcy7CoA0KDQpJIGhh
dmUgdGVzdGVkIHRoZSBDVkUgZml4IGluIHRoZSByaGVsOCBtYWNoaW5lIGFuZCBJIGZvdW5kIHRo
ZSBzYW1lDQppc3N1ZSB0aGF0IHdoZW4gSSBkaWQgdGhlIHN5c3RlbWQgdXBncmFkZQ0KDQoNClJl
Z2FyZHMsDQoNCkRhbmllbCANCj4gwqANCj4gPiANCg0K


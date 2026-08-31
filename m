Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72950C624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 16:00:59 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.442.1788192058300499829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 09:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=rTKP6mGS;
 spf=pass (domain: est.tech, ip: 52.101.72.51, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dD88tW5ug+CtS1R7DHwU3Rw75skQ53WEL659bTpr/hwCrvtsUepu6J3+ofwqunqvr97C1pGFI8EGJrivimytU3cr1n/o4xlXuygFP1V2HsqP9IfLtiRh0rf6GLy6pEzpzvbdrjXI+XtNczu26Tk949qqMFuB8GgquhUjBloOE8cflJfIkF5cTUSW3x+erPQwBEnU9W385DnhplxJIwDJaPIv4V2qKkrzMFOgOWeDf22A6wOwJ4cg5Q580JePAgEE+1TeQNzHjVSe2T6Vx59zkChC+qZ1GeRrirOsNq5INYawGJjhz9Cigx7glcqE9UVcRZNOiTuHzuh+m9JdtHhh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQdWY4JmyFruLrX+1fHrCZksVhhzUdFxH0iknP9NBsg=;
 b=AqP8heVxpQd2DU1bpdDW8MfZnBQlZReVXVOSoY08ugDHTZMwwwLu7HLbqLsrc9baSCKzFlc2T7LWelH0xbuaV55afMun/f1PURBnjKRzZyzi9Cwc17MpnVv3PjANWXbzBxHpL18YL58WcSRT99xNXc9T71lkvuSVE1fspZg28wOqOEJEm3oML/ses2C0RdsycGl1xjNP+Rqa5jGnVQbKcRll0VzyUudVNDGqkAVQvw9IAW37cL/Pe+Zuk+Hop6BaeB51ws90LDijqH9ZcXsDUNNYOxKs5aOtjP1NNxSK3L+sHEfklM+7gMXrR77FouoyD78tVwp8TsI08mx8G6N/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQdWY4JmyFruLrX+1fHrCZksVhhzUdFxH0iknP9NBsg=;
 b=rTKP6mGSGuwdZpqG3ppL4WZtoumzXFtXAxlsF5mX0QfgYpf1FqW91VXvbRhabCshJC6jVLBFOtj8d36+fxXcIdjNdApf/l46ln5N3490zKoO4ZorlmJWJm6aH7Ie658GUrJzqIANcAc1LaqfehbbpAXnEbUP4vn9SmHDHPN02bME+dY7qHj9EqW+GIXWUSX2y1cXdm4hodLinGaszyXSmygFekWK/fdeQg0qkgfFX8s6wX5zlxLK8ANfoq4BjnaTb8sP6RAi8JpHN7SPJ2jSRMcTm42mes4jrJxign1OqHbKXmUzEL3sgP+4mVtR5TEifPAlB7ns1sIF7X5FiG51pA==
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AS4P189MB2037.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:510::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 16:00:52 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 16:00:52 +0000
From: =?utf-8?B?Um9sYW5kIEtvdsOhY3M=?= <roland.kovacs@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2] gnupg: Mark CVE-2025-68972 as
 upstream-wontfix
Thread-Topic: [OE-core] [scarthgap][PATCH v2] gnupg: Mark CVE-2025-68972 as
 upstream-wontfix
Thread-Index: AQHdMU/DeOdZCV8BDUCm1PN/LBn4Vba4RUQAgAAb5oA=
Date: Mon, 31 Aug 2026 16:00:52 +0000
Message-ID: <0e1dee06745f0473fdd9fa2ee444332c2cd97ea0.camel@est.tech>
References: <20260821093052.1174778-1-roland.kovacs@est.tech>
	 <DL371ZPMRYMX.3Q2T6B000L34F@smile.fr>
In-Reply-To: <DL371ZPMRYMX.3Q2T6B000L34F@smile.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB0725:EE_|AS4P189MB2037:EE_
x-ms-office365-filtering-correlation-id: 49a8bd7b-c088-4215-6f5d-08df07790875
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|38070700021|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 ZIstnCdaCETwqY6ju03iCYoMrwu5c1SAngApC9qivj0PnUJlcZWOqOXMu8ft97qK99RAlwloACkT+apC+wlkq/pqOzAWz9iwp9NNU0q7EAs/66BlMqa4R64q2cOFx6LcGHg6+VAl3ErPJgmkLoBJL0uqKKiM/lTQdhJ4tLF9C5cWv/jY3AzRcvYs5drQwvhXToFfKmN3IUwPDRYFdK5xC5VQYKUDaFcl19KhKT9GwmlNTH1IJXAQ+sko9EUNmspT8J2DlDpCReuxZfHX6yp8NFgB6/VRfdM+KGc4q9XBBbKOHXgNSD7xmTOxx8j/6w4OzTg3Qsk3P0NPFRLjvCtbs0hhowJBIYVJJ7dnYcZum/rWFKRjHT/y52g49HVzYb74xwMV+S+K4CxqnV2kLo1pYhlpvKYKkaRIhcsPCKMYeR7ySAnh8Dpy7+b7SInPckxD1WNno3D/jtKQmgli4i2cKXliy3atOwMeGx3BHPKTteSmagvk+h+bDwpaVeGkkx4gAuLYa/wN663EiXQR9G3oXw7GqaycJDRZdtKTXh6fRmoEQ/Ia5MjwuoMNkfeghBOvz1LCwQr0bhtkoI4gj/IV6ycJUW4VYt1rvZAyeZOnrTnCa1JfkLcARVQ8Dg9//sE2wkZesDs1sZdMzezuA25hVFDOq46I5ZsJAATm8VjBKOI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0JGQ0RaMEJEckJlbjFpU1lrK3pEM2NZYTVXVEVVdi9UbUJydkNId1dqZm9Z?=
 =?utf-8?B?TWJ0U1loSFNOdGpKa3NGSmhRYVZjTEdsRkpwaDdKTG93OWtMZWNkMENUU0FL?=
 =?utf-8?B?WkxMenBZNlZxNXg0OWt1b3FMMWlVMC9rbEkzcGUvTEZNVkp5eHBzTDJYSFJQ?=
 =?utf-8?B?S2l6Z2FpQU9jaXkxQnBlWFNWNWtTREl1d2Z0VVM2R2d2dm04RXdiN2kydjBX?=
 =?utf-8?B?c0I1cUcxWWpwVktBMm1UYjNLdU8xd2ZZNjVvMzhvREl2NHBoWU84SjFMNTgx?=
 =?utf-8?B?T0lXUVJLMDFtRFkyRG1zTXVrZ3gyWm14eFJYRTM3aGY0M2dVRUNVR1FkUWlu?=
 =?utf-8?B?dVNJY1RGcGRpcXNmWjFtbm1rVWVmTlFyQmxTVXNnanU4MW04TElqemlsSnY1?=
 =?utf-8?B?ckpCR2Ruc0JsSkRDam12QmN3a3dYVDA1cXEySHFNZnM4N1FXWVdWOVl6YWp4?=
 =?utf-8?B?ajZIRzloRzIvS2ZCbHRpMzNJc0hma3VreDJBdUphaWlkV3RMUCtPVFFiUC9r?=
 =?utf-8?B?S1Z5NHh5ZlY1UjY0T20rdGV2anpTQlZyK3BGZFRZQU4vSWdIMDg0OXp6MEU0?=
 =?utf-8?B?elQrRXIxUWdtbVhiSjFDb1doOEZwQnJ0aXhmMUFoUHBEY2dROUpCTGV6V3RB?=
 =?utf-8?B?Y2lmai9vZFNhem8yQUh5MURkZ2k0aFNmaDhtNmRybVRoblRqaXRBemxRR0gy?=
 =?utf-8?B?T2NKZmcyYVBqaTBOeDRzYkdaR1U1NUV3SFJUVXNtcHNpTE1hL1RGN1NaQXg0?=
 =?utf-8?B?NnNvbTlMLzRFQ3Y3M0s5MmZUL0tZN21iU2FWMEFnbXlGVWJyYVRranlENk1i?=
 =?utf-8?B?QTAxTGJEUGtQQnp0MDA2eHhValJUbEx1Tit4YmlySjRKU283VzExMzRaNXRD?=
 =?utf-8?B?QUVYVkhlM3pacC9JTlBuM2VoSXVPZkpHZ04zU3EvYTQ1R0lEVFROZ2VyMk55?=
 =?utf-8?B?RWdaNk9OWWV1RlJ2RkRoUmRzT1ZMeVZHSXBiU2l3UHQ3TzhiWDAvUHFIbDBk?=
 =?utf-8?B?S1VudHRFa0ZlU2lBM2RwdkRqb1MzRlYwQmdBdDF2cnpzcm1qYVk2UjVwWGlR?=
 =?utf-8?B?MmNDK0Y0Y1JmZkhFejk5ZHpqV1dVakZHSU9DNktjMVJlNG1WazFLNTZsL3FR?=
 =?utf-8?B?SkxpbG41UFNpbThqL2tIeDVWaFkvTHhOV3o0ZU9LY3gxZmhVNmsvY2UrWVdH?=
 =?utf-8?B?VnUvT2MxNmVselp1eHdrVVF4bytTMCtIRnVHMjJTRjZSK0YwWm9UMFZ4b3RF?=
 =?utf-8?B?Mm1lWlpvM0FqVlNMblZmdWxhZUVmQnF6ZklmTjB4SHp5WXFkaTRNZFI0MklE?=
 =?utf-8?B?UkRPdlROYlpmQmtrOGNmcnZLUVIxK20xMC9ncTNEUWFjZzc2UXk5ek53dzFx?=
 =?utf-8?B?WFZ4VDQ5eUE0NXU0UVZUbll6SWs2Wjh5aHBXUGxsSGorRy9aMHF4V3hHb0VT?=
 =?utf-8?B?VjFFa2FiU3plc1RlUHRaNkVEcDM5cm5ERDllWXBFT0ZESW1SQTZWNUxCZjRl?=
 =?utf-8?B?TmhIQndaQ2ZSUlM4MEU1YURtKzNQaUMrSElocTRaMTFZT3kvbDErVjk4b3li?=
 =?utf-8?B?ZllHNHhZd0ZEY1M3MzJyMW1nL0lhVGVmN1kzWWlLWHd1RmlYV0tZU3NyWUtl?=
 =?utf-8?B?L1A4WGpaUytZbThXTHhTV2NJZEI0bGRxQjZ5UEJqQmxQUjRHWVJXUm1WVVow?=
 =?utf-8?B?c3lBOGZReVBrRnJEUjc0NExaczRHemxjLzlZR0V6OVdmamRhc1puRnZUUXZW?=
 =?utf-8?B?c3poVTR6ZkJMMVRCUGNBL3MvOERqWVNVZXNDRS8vYU5sNWwxZWJ3UldpNEwz?=
 =?utf-8?B?NzAvendjYlk4NkFDbFVNWVhyeSs1Tlp1SU0wTy90amJULy9XSXA1SjhWVVNi?=
 =?utf-8?B?bkZ0b3JVZ2txS1B2OE9RWmZpTFg0VHVjeVNrSWpPSEIwLzhqSUVwdHBYQlM2?=
 =?utf-8?B?cFQwUkxKb0dWTEoxOFphbERLdlQ0OE5ucStMYTI4SUJ6WFRKdXBHNy9sWHpK?=
 =?utf-8?B?b2EwZFI5QkxRWHhxaTl1WEdib29Ma25JOTQwVy9uODR0ejhabmF4eTJyZWM0?=
 =?utf-8?B?NmZoNEtKcTJYTFdHZGkxYnU5SHY1VkdadWJhWlFvRkFxRTFWa2ttSGxldWVQ?=
 =?utf-8?B?OGVRU2RFZWJXTVliSXBDWWlPMElnaTNYdXBZdTlIbUZtdTZJWU9zdURycFNT?=
 =?utf-8?B?UVVIeFVXdG9KUFpDZUZlZFRWTmZ6VEFSZ0RaclFleXhOU2dnWVJGRXFsYVRw?=
 =?utf-8?B?SVBxL3dGejUwTkQrNm90aWpEeUtXUFNDOGd0RkY0dGY1T3FRMlYyeXBodVNi?=
 =?utf-8?B?V3BNeFdVNlBlMW1jV2M1VGdydmdWemN0cmNQZFFqVGYzQWViVTVMQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F1682ECAE39A3419667A84C8E1B9170@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a8bd7b-c088-4215-6f5d-08df07790875
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 16:00:52.3984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /iPvxF7SMdPWIa9rPQuReWFR/BU5kJLSHCo62OXRNHKh+0x5/xwR5W/T/zxPz+OTwG24X2/uJnw0MvwlxxA/3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 16:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244772

T24gTW9uLCAyMDI2LTA4LTMxIGF0IDE2OjIxICswMjAwLCBZb2FubiBDb25nYWwgd3JvdGU6DQo+
IE9uIEZyaSBBdWcgMjEsIDIwMjYgYXQgMTE6MzAgQU0gQ0VTVCwgUm9sYW5kIEtvdsOhY3Mgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gTWFyayBDVkUtMjAyNS02ODk3MiBh
cyB1cHN0cmVhbS13b250Zml4IGJhc2VkIG9uIG1haWxpbmcgbGlzdCBkaXNjdXNzaW9uLA0KPiA+
IHdoZXJlIHRoZSBtYWludGFpbmVyIHN0YXRlcyB0aGF0ICJbLi4uXSB0aGlzIGlzIHdyb25nIHVz
YWdlIG9mIGEgdG9vbCBvciBzb2NpYWwNCj4gPiBlbmdpbmVlcmluZyIuDQo+ID4gDQo+ID4gTGlu
azogaHR0cHM6Ly9saXN0cy5nbnVwZy5vcmcvcGlwZXJtYWlsL2dudXBnLWRldmVsLzIwMjYtSmFu
dWFyeS8wMzYxNTQuaHRtbA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvbGFuZCBLb3ZhY3Mg
PHJvbGFuZC5rb3ZhY3NAZXN0LnRlY2g+DQo+ID4gLS0tDQo+ID4gdjE6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjQzODk3DQo+ID4g
djEgLT4gdjI6DQo+ID4gCS0gRml4IHBhdGNodGVzdCBjb21wbGFpbnQgYWJvdXQgZW1wdHkgY29t
bWl0IG1lc3NhZ2UuDQo+ID4gwqBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQu
OS5iYiB8IDEgKw0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNC45LmJi
IGIvbWV0YS9yZWNpcGVzLQ0KPiA+IHN1cHBvcnQvZ251cGcvZ251cGdfMi40LjkuYmINCj4gPiBp
bmRleCBjODVkZTYwNDdmLi4zZWJlYTM5OWQ3IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNC45LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251cGcvZ251cGdfMi40LjkuYmINCj4gPiBAQCAtODUsMyArODUsNCBAQCBsY2xfbWF5
YmVfZm9ydGlmeTptaXBzYXJjaCA9ICIiDQo+ID4gwqANCj4gPiDCoENWRV9TVEFUVVNbQ1ZFLTIw
MjItMzIxOV0gPSAidXBzdHJlYW0td29udGZpeDogVXBzdHJlYW0gZG9lc24ndCBzZWVtIHRvIGJl
IGtlZW4gb24gbWVyZ2luZyB0aGUNCj4gPiBwcm9wb3NlZCBjb21taXQgLSBodHRwczovL2Rldi5n
bnVwZy5vcmcvVDU5OTMiDQo+ID4gwqBDVkVfU1RBVFVTW0NWRS0yMDI1LTMwMjU4XSA9ICJjcGUt
c3RhYmxlLWJhY2twb3J0OiBmaXIgZm9yIHRoaXMgQ1ZFIHdhcyBiYWNrcG9ydGVkIHRvIHZlcnNp
b24NCj4gPiAyLjQuOCINCj4gPiArQ1ZFX1NUQVRVU1tDVkUtMjAyNS02ODk3Ml0gPSAidXBzdHJl
YW0td29udGZpeDogVXBzdHJlYW0gY29uc2lkZXJzIHRoaXMgQ1ZFIGludmFsaWQgLQ0KPiA+IGh0
dHBzOi8vbGlzdHMuZ251cGcub3JnL3BpcGVybWFpbC9nbnVwZy1kZXZlbC8yMDI2LUphbnVhcnkv
MDM2MTU0Lmh0bWwiDQo+IA0KPiBIZWxsbywNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0
aGlzIGZpeCBzaW5jZSBNSVRSRSBkYXRhIHNob3dzIENWRS0yMDI1LTY4OTcyIG9ubHkNCj4gYWZm
ZWN0IDw9IDIuNC44IGFuZCB3ZSBhcmUgYXQgMi40LjkuDQo+IA0KPiBSZWdhcmRzLA0KSGkgWW9h
bm4sDQoNClNvcnJ5IGFib3V0IGl0LCBmZWVsIGZyZWUgdG8gZHJvcCENCg0KSXQgcHJvYmFibHkg
Z290IGluIG15IHF1ZXVlIGJlZm9yZSB0aGUgcmVjaXBlIHVwZGF0ZSwgYW5kIEkgd2FzIGp1c3Qg
c2xvdyB0byByZWFjdC4gOikNCkl0J3MgYWxzbyBwb3NzaWJsZSB0aGF0IGl0IGlzIHNob3dpbmcg
dXAgb24gbXkgc2lkZSBiZWNhdXNlIGRlYmlhbiB0cmFja2VyIHN0aWxsIG1hcmtzIHRoaXMgdmVy
c2lvbg0KdnVsbmVyYWJsZSAoYW5kIHdlIGFnZ3JlZ2F0ZSB0aGUgc291cmNlcykuDQoNCmh0dHBz
Oi8vc2VjdXJpdHktdHJhY2tlci5kZWJpYW4ub3JnL3RyYWNrZXIvQ1ZFLTIwMjUtNjg5NzINCg0K
Q2hlZXJzLA0KCVJvbGFuZA0K


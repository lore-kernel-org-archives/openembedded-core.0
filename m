Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C84CCD4F21
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 21:01:02 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86690.1778619658287361005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 14:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=X6CTbyBJ;
 spf=pass (domain: axis.com, ip: 52.101.72.5, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZ4bL3gBrYKxqLX0cyYOrPio/YAxgYWid+ab100WDXLE/4JqgMjoC/pB4Y8yZbo8wPDykDCIKUkGc32QOiOutJCT+/grln69fKDLONjInkiA4QAnLAyihGllAxG/jpISv2VDmOF2UR43s0d4WcBkvHJQdubk3MlE+jg+1JTc/0iFfhaY4atVBVrzlWFwHL0XHQbQuc7q11/YKQvO02BrIC4Iv48OjJqXMM3hlgl2hbmdSZg1l6mlIueRfpT3GqAhmA6ileXTbpItdBBe3WrQ+84GaI3oVGXfjtUzuhGOQa0xDlSIqyEsb1e5y+O382bkHxdzJs5rE44oMVtiExn/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YRqxG1s37iaEeapc7A6as+M7BNgaM2wtwo1ktzbyRg=;
 b=gYCXx1lUYZgOunEgNO+nfKIwdD/QYjGy8GuDJuV6Q+RFGnrKBfSMAVZru1VdPX90RdAN121uEM5kB032dIVoAW9lk9j5RSGYkNr0MT/bQAUFSF770XUtO9+uuhGXYBf9GSLLexRvXNSsTOFcSVQD85Mm7eEqAjck5SorQtr5JXFMeFOZ65tZsg25wfa+wBrQAUtO81jPW26oUyZZUBqtKudB8vuovfp9aGQJ9iIVBPsT+qRYafJqtfsYYsjYKw2053Jrzrlq769Gfv7tDMwYzbl0ycamm1rkDZzHQJRouuAFxLQ4xY3xhh8CLXmyfaL/XtZmFOcdXOmSiv705lJLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YRqxG1s37iaEeapc7A6as+M7BNgaM2wtwo1ktzbyRg=;
 b=X6CTbyBJG+/1UemSmjrjaCnWqqrQ7ujYBJ8dJU2XfvPaxHrnOtvGgszVXxb90hHKfxRe6EwTgZ87MQevzv6RQqXUQfJ0YMgvrBKsiuuJ0x6pcZLl+bL35BqbY8K1UNNNyP+U9ulk/lXzrmAkTOH8t5zco6UOmu6qYwEaJ41/ohQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI0PR02MB10535.eurprd02.prod.outlook.com (2603:10a6:800:1b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 21:00:53 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 21:00:53 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 0/5] Add support for USERMOD_PARAM in
 useradd.bbclass
Thread-Topic: [OE-core] [PATCH 0/5] Add support for USERMOD_PARAM in
 useradd.bbclass
Thread-Index: AQHc4khvXgsyCrsfF02OgKFgBxJaYLYK0Saw
Date: Tue, 12 May 2026 21:00:53 +0000
Message-ID: 
 <DB5PR02MB10213126762F3E1B53CD51C8FEF392@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260512190415.948535-1-pkj@axis.com>
 <2fc29d67622c753049478f8d1a399120310f281f.camel@linuxfoundation.org>
In-Reply-To: 
 <2fc29d67622c753049478f8d1a399120310f281f.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI0PR02MB10535:EE_
x-ms-office365-filtering-correlation-id: 8092edcb-c787-428e-2338-08deb0698e1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|38070700021|56012099003|11063799003;
x-microsoft-antispam-message-info: 
 7mP70X3LS8WeAPu98vHcnX24KunIKzi+IEKvtD7lvzjKr0KRkIk3D7DG1K/m/wCTY+vhHhyC11k8MZ1I+La8vjof0qHe+bLSOtwOljOdlvA8X4eBjwzKohk49/0oAvhkLJo7Hkn0Xznyx8rELbLpSd3TW77ZeIWBAljFAmtTfCx32w0i/+DhSHIvxT1w+SASIzksxHgTjayq2Ln7jAYFN+OPQ8SQtEKlnCcUM3u5gP64z7EtkdMCqntSQErFI9VyFKq0q6kYX6y04lXJWYV09XxTP28zTLvCkx44MhZErwQg8NOZ9jYknyYpwUUSB1Qu90wxhhv53nTU9g6RYoJgFHdA/6chvTJpn/ry0kvzagESqQyFIBOz4ZfP1tdrn/jOLkWLMd2qBKob2vO0khEqTTjdrnRLxXZuSDjVPjkfhZb7IB3f/muj7R7TvXeWz9gu2+quE0a0bZYP0S6knFudnIysWc0As5AdX8sph4jNQFuivC2ST2CcMHnWSzLVmmNwokwL1kaMAKM6xwSHgYWtmUL9xVhE6hq3VVt/3E9tZUkdO7KBXDx7qlSPQCv8fkmdpna8hiOslRXQFSILrh0kEToT9bWPq3ITTnNjMUIoP5FyutCKmYL0YjV1TnLVHcSTgdQBHBS63OEHo775QgJHAtoClvxy73vuRto8YyE7Aq6P/xi2GenARuzEI3f9qJAxA2034wFbdq6WMmgAh+9V1g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(38070700021)(56012099003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R0F1c2lWekx5MUJ2clEwWHZTejkxSlpTbDBSTjBpd09mbk5WQjFialpoQ2NX?=
 =?utf-8?B?bldLWm1MaDRRNkRodjFqWWFlM2FyVWJTOE15WEFJbEh4ZVNBTyt4MU5xTGlr?=
 =?utf-8?B?emxqSW44V3pLSi9TZVE3VTlyVzBWTWRsSE9NWDhWelRRM0lVUzFOdVhHb3Vw?=
 =?utf-8?B?SzgvVlNaUEhxbGhZQXNvVUttME80K0tTVG1qM3ZVN05MUCtsNXlXY0xyWnBa?=
 =?utf-8?B?aVBiQklqRHBEblRmWFJXLzNTZEgxRU5QUFF2NlRPNm0yZCttZUpXSURLeUlj?=
 =?utf-8?B?dS9ENkUyOWZEMjNmNEU1Qm0xTUhON0tCVUVNZFRqZmNONkpJMUVoeWtwSEJM?=
 =?utf-8?B?N1NraWF4YWZsZUk3VElzaStVeFloNlJmODc3eFR5ZlVvRkh5bHRrMFI1NDRI?=
 =?utf-8?B?QkdzOVg4cHhUMlpEUXptUlZ1VXZSZmpYQVBqZFNYU3ByWHN4ZVp1OHNCQUV4?=
 =?utf-8?B?dnpCWXFEb3dFL3MwNko1cUZoaG0zTFIybVFVcHdNWnVvQlp6ZUtFeVUwb3Ay?=
 =?utf-8?B?TFJNbVlhTU5FNW1OS1ZxOXZWWkRIQWgxOExTbjlCSWd5MnB5ZTdxOTRJbHhv?=
 =?utf-8?B?U2hzZWNXbVBtcmVrMkVPOUdzVlNJK05mRVhkd1RzMURLVS9wUFRLUWsydWtZ?=
 =?utf-8?B?WFhucll6SGVUUFBqZ0NTc1AxTWhacFkvdEp1UGcvZlovTjFWTm82eW5hL0Zl?=
 =?utf-8?B?ZnRJMjFyNzFwSUpydVJuNG9XdzRZZ3cxYm5TVVhHdTA1KzhpbGpQSm1YYXZq?=
 =?utf-8?B?U1B1UUQ3eFVGTTR0clFkbVVyWmtqRFhOK1Z3SStHV1lzekVobjd1dVRDelVo?=
 =?utf-8?B?VFMwU3Y2MHRGY2JvL3JpYVhTVGpwY21DQXdQVURXa29ibDU4ZFppZi85Qk5I?=
 =?utf-8?B?eVo2aXlucExmVm9mV2hkRlVESWtNVmNrb0wveWNqOEhnNndKaGkzQ2hhN3ZL?=
 =?utf-8?B?elhxbG5wVnhYdU1FdFNUeGVVUW1hSnhFbnJlZkU1ellBNUMrMnA5NmJEQW1C?=
 =?utf-8?B?elZ2SGhYcC9SOWxHb2JrVW9acmxsTkVtY3FpYnBXZ1U2aXpMVWdkcURIcWlL?=
 =?utf-8?B?QU4wSUtZYmt4WU9YNFFLaVY1eldyTzYzVUx6cjVHL0VuQzhBZ1BiSmNIaDdE?=
 =?utf-8?B?UWliMzFZdG94MERWdnR0Y2UwUXBXN0RZRnV6L0Vzc0xGTkpURUdwK3BmRFZD?=
 =?utf-8?B?SHJvTXl5YW1ERWczRy83aDkyT1pONjNmTXF6bzBPTGlGbW9nU0NMQzRJQnZ2?=
 =?utf-8?B?cFVmbXllbHFCc2pteTdqdldqSmluWGRLM3JzSGx0RWwyZkVRSnVYMlNkWjZ1?=
 =?utf-8?B?enVMZzR6bllFajdXa2ZHcHl4NHBKK0YwVEpNdy9EVE5EYVBLc3pDeVB4bEF3?=
 =?utf-8?B?bFEzMHEwMXhHcGFPRnFBVng5MXV0NEhIRXlGWi9JQUNIMk4rTnNrdXM2UlA0?=
 =?utf-8?B?bGZYMVFPbWRNZG11MGVUbnNBRmgyRGo0VHlwcFFGN3FWSm0xcDZRTVZRZTV2?=
 =?utf-8?B?YUpuRWRYc1dLZUlBMHRDS0wxZ0oxc3pLcEZpTE02bEtqcE5hT1EvSEVmRUln?=
 =?utf-8?B?SVoxWHhmVGtEakUrNUNQVUkydWRERk10ZEZpdHEra1duNWVhL3pOLzVmT0Vs?=
 =?utf-8?B?ZHROc3hFTkY3enB2WWRuLzFhQko3U3JlYVdFYzlKRWV6U0VkajA0Y1B5T3o4?=
 =?utf-8?B?b01RTk5uNVV2SE45MmZjZjl3NURmc2kyNUZHWHRCU3M0aEZwMlZaOE1CQXU2?=
 =?utf-8?B?NTNYWWxoanpNa2FsTktRcHRWSlFXOWV4Qzc0L2krckhKTElpTDZjVGhkMU9R?=
 =?utf-8?B?Qkw3TEZ1YWYyVExPY0NGUXYxSGo1Mi9aSlFIckNzcUE3WEpiWlQxemlrS2xo?=
 =?utf-8?B?cktRRWhwOUVQU3hrTzlqZ2NNQzZJM1JkK1BQV0ZORW8rTThyc0FobDlqazBN?=
 =?utf-8?B?bUJXWEpGYUovR3VzcW9HWFlwcmtWcWVUOGJSZnVTOVFtd1RvRVZTMmdLT2JC?=
 =?utf-8?B?QmFSVkpjdUZMWGNtK0U0Vk8yaDAycTRFckpmSmV0L21UTzVVdmFkWjIwbXZn?=
 =?utf-8?B?a2RyMEI3UWljc3FZNlk3c005d1FCUE5CRlY4VmZURC9YT1gyRTBEQUE2SDdN?=
 =?utf-8?B?cUtDZm1xOHJSVEt3VkVMc0FDd2VZcmZYZUJWdHRyeHprRlNYUVBRaHYvOUNX?=
 =?utf-8?B?N3BMZElndThkTisxRGI4dWovbVBBWnJjVDN6ZTlBa2lOTXNjQ0FyQkhxTkxB?=
 =?utf-8?Q?kCQi1xKiJMaX3bPwtCBkGiFqcmzTw9Pn6qZ8jWi4uo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8092edcb-c787-428e-2338-08deb0698e1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 21:00:53.5427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fwB/JC38fsqF0DT8tYWHfi4UKMHwV5xuBb0Ul2dQFqJRDU5o1CBoec4jmcOAfTIm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 21:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236914

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDEyIG1haiAyMDI2
IDIxOjQ5DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlz
LmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDAvNV0gQWRkIHN1cHBvcnQgZm9yIFVTRVJNT0Rf
UEFSQU0gaW4NCj4gdXNlcmFkZC5iYmNsYXNzDQo+IA0KPiBPbiBUdWUsIDIwMjYtMDUtMTIgYXQg
MjE6MDQgKzAyMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyB3cm90ZToNCj4gPiBUaGlzIGlzIG15IHByb3Bvc2VkIHNvbHV0aW9uIGZvciBncm91cG1lbXMn
IGxhY2sgb2Ygc3VwcG9ydCBmb3IgdGhlDQo+ID4gLS1wcmVmaXggb3B0aW9uDQo+ID4gKGh0dHBz
Oi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTYyNzcpLCBhbmQg
dGhlIGZhY3QNCj4gPiB0aGF0IGdyb3VwbWVtcyB3aWxsIGJlIHJlbW92ZWQgaW4gdGhlIG5leHQg
dmVyc2lvbiBvZiBzaGFkb3cuDQo+ID4NCj4gPiBUaGUgZmlyc3QgdGhyZWUgY29tbWl0cyBtYWtl
IGEgbGl0dGxlIGJpdCBvZiBjbGVhbi11cCB0bw0KPiA+IHVzZXJhZGQuYmJjbGFzcyBhbmQgdGhl
biBhZGQgdGhlIHN1cHBvcnQgZm9yIFVTRVJNT0RfUEFSQU0uIFRoZXNlIEkNCj4gPiB3b3VsZCBs
aWtlIHRvIHNlZSBiYWNrcG9ydGVkIHRvIFdyeW5vc2UuIFdoaWxlIHRlY2huaWNhbGx5IGl0IGlz
IGEgbmV3DQo+ID4gZmVhdHVyZSwgSSBob3BlIHRoaXMgY2FuIGJlIGFjY2VwdGVkIChpdCBzaG91
bGQgbm90IGFmZmVjdCBhbnlvbmUgd2hvDQo+ID4gZG9lcyBub3QgYWN0aXZlbHkgc3RhcnQgdXNp
bmcgaXQpLiBJdCB3b3VsZCBtYWtlIGl0IGEgbG90IGVhc2llciBmb3IgdXMNCj4gPiBhbmQgb3Ro
ZXJzIHdobyBhcmUgdXNpbmcgR1JPVVBNRU1TX1BBUkFNIHRvZGF5ICh3ZSBoYXZlIG1vcmUgdGhh
biAzMDANCj4gPiByZWNpcGVzIHRoYXQgd2lsbCBuZWVkIHRvIGJlIHVwZGF0ZWQpIGFzIGl0IHdv
dWxkIHRoZW4gYmUgcG9zc2libGUgdG8NCj4gPiBtaWdyYXRlIHRoZSByZWNpcGVzIG92ZXIgc29t
ZSB0aW1lIHJhdGhlciB0aGFuIGhhdmluZyB0byBkbyBhIGZsYWcgZGF5DQo+ID4gcmV3cml0ZS4N
Cj4gDQo+IEkgYXBwcmVjaWF0ZSB0aGUgcGF0Y2ggc2VyaWVzLCB0aGFua3MgZm9yIGRvaW5nIHRo
YXQuIEknbSBtdWNoIGxlc3MNCj4gaGFwcHkgdGhhdCB0aGlzIGlzIG1hcmtlZCBhcyAic29tZXRo
aW5nIHdlIG11c3QgYmFja3BvcnQiIGFuZCB0aGVuIHRoZQ0KDQpJIGRpZCB3cml0ZSAidGhhdCBJ
IHdvdWxkIGxpa2UiIGFuZCAiSSBob3BlIiBzbyBkZWZpbml0ZWx5IG5vdCAibXVzdCIuIA0KDQo+
IHNlcmllcyBzdGFydHMgd2l0aCBhIHBhdGNoIG1peGluZyB3aGl0ZXNwYWNlIGFuZCAic2ltcGxp
ZmljYXRpb25zIi4NCg0KSSBjYW4gc3BsaXQgdGhpcyBpZiB0aGF0IGlzIHRoZSBvbmx5IGJsb2Nr
ZXIgZm9yIGEgYmFja3BvcnQgc28gdGhhdCANCndoYXQgaXMgbmVlZGVkIGZvciB0aGUgdHdvIGZv
bGxvd2luZyBjb21taXRzIHJlbWFpbiwgYW5kIHRoZSBjbGVhbnVwIA0KaXMgbGVmdCBhcyBhIHNl
cGFyYXRlIGNvbW1pdCBmb3IgbWFzdGVyLiBIb3dldmVyLCAuLi4NCg0KPiBXaGlsc3QgSSBhcHBy
ZWNpYXRlIGl0IHdvdWxkIG1ha2UgaXQgZWFzaWVyIGZvciB5b3UsIHlvdSdyZSBicmVha2luZw0K
PiBzZXZlcmFsIGRpZmZlcmVudCBlbGVtZW50cyBvZiB0aGUgc3RhYmxlIGJhY2twb3J0IHBvbGlj
aWVzIGFuZCBoZW5jZQ0KPiBhY3R1YWxseSBhY3RpdmVseSBtYWtlIGl0IGhhcmRlciB0byBtYWtl
IGNhc2UgdG8gYmFja3BvcnQgaXQuIEl0DQo+IGNlcnRhaW5seSBkb2Vzbid0IG1ha2UgaXQgZWFz
aWVyIGZvciBtZSwgcXVpdGUgdGhlIG9wcG9zaXRlLg0KDQpJIGFtIGF3YXJlIG9mIHRoYXQgdGhp
cyBpcyBhIG5ldyBmZWF0dXJlLCBhbGJlaXQgb25lIHRoYXQgc2hvdWxkIG5vdCANCmFmZmVjdCBh
bnlvbmUgd2hvIGFyZSBub3QgYWN0aXZlbHkgdHJ5aW5nIHRvIHNvbHZlIHRoZSBwcm9ibGVtIHdp
dGggDQpncm91cG1lbXMuIEl0IHdvdWxkIGNlcnRhaW5seSBiZSBlYXNpZXIgZm9yIG1lIGlmIHN1
cHBvcnQgZm9yIA0KVVNFUk1PRF9QQVJBTSBpcyBiYWNrcG9ydGVkLCBidXQgd2UgY2FuIG1ha2Ug
ZG8gd2l0aG91dCBpdCBhcyB3ZSBjYW4gDQpiYWNrcG9ydCBhIHZlcnNpb24gb2YgdXNlcmFkZC5i
YmNsYXNzIGludG8gb25lIG9mIG91ciBvd24gbGF5ZXJzLiANCkhhdmluZyBpdCBpbiBPRS1Db3Jl
IGlzIG1haW5seSBhIHdheSB0byBoZWxwIG90aGVycyB3aG8gYXJlIGluIHRoZSANCnNhbWUgc2l0
dWF0aW9uIGFzIHVzLiANCg0KV2hhdCBJIHdvdWxkIHJlYWxseSBhcHByZWNpYXRlIHRob3VnaCBp
cyB0byBhbGxvdyBzdXBwb3J0IGZvciANCkdST1VQTUVNU19QQVJBTSAoZW11bGF0ZWQgdXNpbmcg
dXNlcm1vZCkgdG8gcmVtYWluIG9uIG1hc3RlciB1bnRpbCANCmNsb3NlciB0byBmZWF0dXJlIGZy
ZWV6ZSBhcyBvdGhlcndpc2Ugd2Ugd2lsbCBoYXZlIHRvIHJlc29ydCB0byANCmEgZmxhZyBkYXkg
dXBkYXRlIG9mIGFsbCBvdXIgcmVjaXBlcyB0aGF0IHVzZSBHUk9VUE1FTVNfUEFSQU0uIA0KSSBw
cm9taXNlIHRoYXQgSSB3aWxsIHNlbmQgYSBwYXRjaCB0aGF0IHJlbW92ZXMgc3VwcG9ydCBmb3Ig
DQpHUk9VUE1FTVNfUEFSQU0gaW4gZ29vZCB0aW1lIGJlZm9yZSB0aGUgZmVhdHVyZSBmcmVlemUu
DQoNClRoZSBzYWQgcGFydCAoYXMgSSByZWFsaXplZCB3aGlsZSBtYWtpbmcgdGhlc2UgY2hhbmdl
cyksIGlzIHRoYXQgDQpncm91cG1lbXMgKGFuZCB0aGVyZWZvcmUgR1JPVVBNRU1TX1BBUkFNKSBh
Y3R1YWxseSBoYXMgYSBiZXR0ZXIgQVBJIA0KZm9yIHdoYXQgT0UgaXMgZG9pbmcsIGFuZCBhbGxv
d3MgZm9yIG11Y2ggYmV0dGVyIHZhbGlkYXRpb24gaW4gDQpwZXJmb3JtX2dyb3VwbWVtcygpIHRo
YW4gaW4gcGVyZm9ybV91c2VybW9kKCkuIEFuZCBubywgSSBhbSBub3QgDQphcmd1aW5nIGZvciBr
ZWVwaW5nIHN1cHBvcnQgZm9yIEdST1VQTUVNU19QQVJBTSwgYXMgdGhhdCBkb2VzIG5vdCANCm1h
a2UgYW55IHNlbnNlIGluIHRoZSBsb25nIHJ1biBpZiB1cHN0cmVhbSBpcyByZW1vdmluZyB0aGUg
Y29tbWFuZC4gDQpJIGp1c3QgdGhvdWdodCBJJ2QgbWVudGlvbiBpdC4NCg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0KDQovL1BldGVyDQoNCg==


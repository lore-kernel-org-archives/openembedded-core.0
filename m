Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D1AC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:21:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16161.1782807668144844787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 01:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=I4Y93vVx;
 spf=pass (domain: ericsson.com, ip: 52.101.66.52, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmFdUHuHJ74+2crdyXdwIYF/NkdIgC6+66N4jez77CzHUp96GRywlmzRnnisa1W/j+MR1zMP1Ie0qqBwc2GuW/q51YrBL6h1iBOJ6DGXTKPalJbi9g3SCnSmhGdEjpyleYqIyOxeePYbcIjmI7jlOODFNd+ngpGaxfeZCLPt0arlpalB0yRrbKH/OSN/o0TU7pTGGjuPtz4Mk78MSjwVhM5nd6BnUZvxjAI/Kkl8IqgutQ1WOtQC9J1x0svgGNkr91mIX7BafFH3zoCGLOw6GIFPCCfASIlMu7B0A6uOxoCpzo3R9LiQAw8PWXWUoXxdVKsImvbxwzB4lSSRC+KDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLGqo9FB2Im3+2/kmjL4qUilQGES/gnGjKQOKdGdt0Y=;
 b=KjkHThqoEAjr/8bshXpweUevtvJwasb4B8ebZKLQMVLhdzJM3Offen0/qgW9F3LbBpu1yYS8IzyeeV8MPPvWliFNu9uzuh5ezVbKe+dg+aQ9WJmQmcQQZ65ApEu68jZ9fQQ18H2UdunwVxTwf6y2uNyaTInd+uLDO1shOmoPEELQEx4OInzoM7wbgPkiOKNryLzNxQZqLRlQLAOU3eM+A4RPIZeAb4Hkn+ly31mMBuJkBufvGSdRsT8Nj09Qk1WMrR6UytXOupApSQs8HGZyph7Bmfey/gxSJ/6QQ0pIeXYisc7TTPdtrfGoSuRg+AoiyJYsjxC29jpwkKD31/gHEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLGqo9FB2Im3+2/kmjL4qUilQGES/gnGjKQOKdGdt0Y=;
 b=I4Y93vVxaXpwLuN/CWFivx+ePKGnxwRA5D/koiYCDoHAmOqzpYWdcFA/pGWEf6Mg2FLyZF+LYtVPYE/TegGZCFQ9Pi6Ssdx5QsZY5ZvWIkjZNT+YSRbxl4n4QUpxdGPDkGTfpF8/koOqNnW6rG7bPo4S0OX327vPBjsXVFLuefk78RTGH5DnvGESnUvWdnrVUMEYO6tmdig9zEt4yM6P/sc/FMG6TS9OEdk7BJPIMt+rxHX4btYkzaBpmiCxKkNorPm092bXt8vfqaPpslod0Eor3O8+Lc1+NNAnKkeHIt1RLDTR0F8ThYD/J1XLtew76lnea1C/7DC37YePM5Soig==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by GV4PR07MB10552.eurprd07.prod.outlook.com (2603:10a6:150:29b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:20:54 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 08:20:53 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Thread-Topic: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Thread-Index: AQHdB9HVAsrWb8/jtkWXSF19iC+Um7ZWwRYAgAAB/YA=
Date: Tue, 30 Jun 2026 08:20:52 +0000
Message-ID: <ed70423e6ae6dfa9da7e739fd3c59a8f041a8773.camel@ericsson.com>
References: <20260629141559.1305873-1-ross.burton@arm.com>
	 <DJM8EZJFQZCJ.2860UZRX5PB0Q@bootlin.com>
In-Reply-To: <DJM8EZJFQZCJ.2860UZRX5PB0Q@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|GV4PR07MB10552:EE_
x-ms-office365-filtering-correlation-id: 4df44acf-f9e6-46b3-6edc-08ded6808050
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: 
 ZU9P1utb7YCPy/fyul1jna0uRjhFy2BLlmtuDpKdIEGjkjPuRyva9i8QV8OEnNiIvP1dllLxQwLEaMgFnyY6WqaVXehdRGZ17lZZ4PKoWfIg22Ur8MCLnRksjdicL8fgf+UsQja/aF9oW9oj56RTx6Gkq0Wl/S7LxVhyx8h7O8r59ftBA/8AtHKADQFIqNvbxSsDDmxiof0A4EazW8/a61yIiqxShOLnQarW1ttz1HAet+qAoKCSGJFlKLfCJtWXQ1/4fTuVbQ4wyPKi9EF5dznDb4aezc/CFC2yTMUaCvmG7bS12L+75Tuom07XCrcUB7dFbP4Q4rrF179KW2UdGYw+n1eJqXmfj5HtudMVStfMaB3xq5DHQo1AhiVllNUteu8jqsWynS+dsmEmPI8hTrDKvkmzFQpn+61f/7r4H8dH/MaL7iCuHe9mEVffEXqLYDNVS5+rO89QELawmgkY3n+glk6Ne8Hhshz+M+emyigF6rxX8WJklIiMGJ3M76G7u+clZLoK9U3NGakIdBmlgY659ssmfnezVFixxvGvXR6aqNuifpjHw6OZ85fcFxJPrVIVUbf5sDgTZ97HQyy66omfNABvseOU4fganus8FBcpu0yL4sLl1YGhIqipL8MpJScVdQWUUPBoaKz4pB/qtRvPCENVY+Sr5dTaw/IwEp7o5ORX6jAki+cjsrc2HvSTuvi8NAsIdrp6+TDT6JNyB0s/559SiGc8w/tj1LsQ68I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RkNrRkh6OWF6NUdRL3ZYVFlaSFFsQmlKOGVqaGF4YTFwZFlGblBzTGcvT0R5?=
 =?utf-8?B?NGZhSHNaZFhQTzdaVU5iT21qOXVCS2wwMTFYeWNOcWlPTFJaV0QxLzV6a1NE?=
 =?utf-8?B?SE1pV3pUYlY3aUxMdGg1VUg3SmFWNDBEcXBJTk8zODYxM2xuaWc1SUkzWVUr?=
 =?utf-8?B?S2VrNysxNjZCblpGRW84QjJCM3plcWcwdERlc1hPdWNucEZxZmQ4M1RDT3pN?=
 =?utf-8?B?bnZTbFdqM2pYQk54b0VlalNWdVpDamtCUDZhbHhTdmNGV05rcXVoSk5ZSHpp?=
 =?utf-8?B?aXhSeFU4bTFOYmxkbG5HbG5hMG9Na2lPVVkzZkVLK1dMWGZ1eDlJbjZUNmQw?=
 =?utf-8?B?UmI4dzM0OVczSUhGd0krU3cwWE5XVGRnUG9RUVliZTExRVNkWms0ZktHTEl5?=
 =?utf-8?B?eWw0VXFvRWJGcjllZVlvODZlVHg2UnVzRElzR2ZxSXY4UkNzUTJhU0pLNkxZ?=
 =?utf-8?B?TFNka2JFTkgxZ01mUFA1T2VSM0RNajk2YVB2aGFtVTJmeERjMHdNcjJaWmht?=
 =?utf-8?B?aU5YcDd2TDhSTlUwWFdvclQ2R01zamhUdkVmY1B4MExsT0VReVhlWXgzUGsr?=
 =?utf-8?B?aUxEdDIrVFNuT1JURUE2S3UvU2lVS0lURFB1aW1TZWxYc0IrajVtaldRVW1a?=
 =?utf-8?B?a0E0RGU5VWZnZUhkb2swbWZTb0orYkluZ0JNdzl2TWtWenMvcTZ1cnhDZThs?=
 =?utf-8?B?OHdHQnc1OEhrNzlPUXdNQXo1NnduMHM2dW14d1haVm9hYzBVZ0N0YVV2Um1a?=
 =?utf-8?B?NHFueFVYOTIrVldPTS9tWmlKV0hQOUJsbzd6RzZGci9ISVQ5Yk1xUzRRVVhD?=
 =?utf-8?B?N0ppdTZEd1hYR0hCN1EzMWFKVkh6eVBVd2V3T2pCR05pZ3hET1NXYVRBRDgx?=
 =?utf-8?B?VXZuMi9HUThTVVE1RWRzVkFWcHVVaXNkbzYyTzRtK2UzRzFZV3ZxWTNKaTly?=
 =?utf-8?B?NmVNdzdpSXdaT0MxK3owdGU2UUVkMHAvUm1wdTgzSTBDS0IvVXZkd0tpTnUr?=
 =?utf-8?B?d3J0M2ZsNUpUR1dic2pWWVAwRFlKNFZzNGdrMXAwUmIyWEFtSmdWUFFBRHBR?=
 =?utf-8?B?Sk5KUW5jVWxkZ205NDBkVUJIYUFJOHRqV2c4UTlKd2xzUTF0d3dvS0hLY0Nl?=
 =?utf-8?B?M1VDQVJUTHdUYmc4T1ZPVlYzdkVEUVBUL0JjRG5UbGpyYit6SFFwcjhjMUVl?=
 =?utf-8?B?RlhVR25FaWNPZHR2RGU0bk5vWWFCenBubDl2aG1VTEpwNVF1amZuZVVHTk1r?=
 =?utf-8?B?RncvTExCNVhhSldrNzBlc3RSWXJCdFNkanpnb3J6bUdzdXZOa3M5bjRCdWJW?=
 =?utf-8?B?cUhrdW5naDNPL1N4K3ZkUjlmMWwxNW8zQmRqUUVab3VZZHRHZzBMZ0NqdWhW?=
 =?utf-8?B?cUNiQlhhVGVVK3Y5QjZGZ3RNYks2andkZjg3MmtPcS9ORVQ4VHFISjhHeXRE?=
 =?utf-8?B?L0xsTHhIWVVHU1Mxb3V2amFPQzd4ZkdYWkl4eU1qc2kyeFFWNkVrYXM0R2xj?=
 =?utf-8?B?NjluLzNxVU8vYlNpbmUyMHJaV0daalJlTGMrOGVTQS9UNXJseFFTblZrSXh3?=
 =?utf-8?B?clJvbWFPdG9scjQvS1NYV2d1NGhyZjBpanlOVlExT2o3SmVNM0VtaklmWVFI?=
 =?utf-8?B?eVFHbkpxeXA1NmNXZUpVVk9veGpscXd1WFhWQkRPekhSbzQ1NU5ybzhHbWMy?=
 =?utf-8?B?M3NGK1l5c1hHMzBaenhGemlrcTUxdkxKOVZTUlNEV243d1YwWHNBTTVEcHA2?=
 =?utf-8?B?ZC9wTFRzQlA1YSt1ajB0a2lWcnduc0NDekFYRC9ENTRBTDlCWjA1bDVlRUh4?=
 =?utf-8?B?d0NWTGY1djRpYzdkQ20vVWFSUzZ6eEV3RVozbkNXYytuWm5lWWthcGhwaUNp?=
 =?utf-8?B?aThTQ1l5OGtQV2E3U3BvNDRVRTB0TC95emt6cW5BQUR4cnc0NEM2ZDc5MDhz?=
 =?utf-8?B?ZDV1YkVjOUxoamMyRXk3dnRWakpLQllML01zR3RiK3BQSUc3Zmdyb0FheG5D?=
 =?utf-8?B?V1ozWU1VVzJDNng2Z3NvV3puUW1iTkNqK3Q1RDIwcFJFdDV2OGFZM2dUaDhG?=
 =?utf-8?B?YTBtTzFheDQwZ0pzNm54cTJTVWVpT1p4SlQ2MTB1MTl0Q3ROc0REV2ZTajRw?=
 =?utf-8?B?enR6VWFIUC9KTVZyR3pMMGNhMFpEYXlIRDRhd0VJRFo3Uk5aemlCYnF5dEJa?=
 =?utf-8?B?YWNFRDFWZzlxMzU3YzFDUEk1NEtvUkN2dFhSQ0pBZHpBN1JoTVZwUklDcXAr?=
 =?utf-8?B?ZkhkYU1Zb1pJNlBQcU5vK0xPNk9LbU4wMDRQR2x3WEdjNHhlUStSd253MFA0?=
 =?utf-8?B?Y1BXMVFpem1IcEFiVSsyZUwzekFLODV0YjNjK3ErTk1JNFRtQll4MjN1ampy?=
 =?utf-8?Q?1gSVYLF1bOEwzu+oe28P8qUO8p8UYmoWjO619YOHg12pu?=
x-ms-exchange-antispam-messagedata-1: rVweCs3OndB6nd38gXqse9jSOsuvsmEh3mQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B052B09E0B18443A447ADB892B9E4F8@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df44acf-f9e6-46b3-6edc-08ded6808050
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 08:20:52.9833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dF6qtmrkX+QriyraC9LygJjMgRNK6++FI293riIzRkV6wGCWEMrwrnxrnsdsn/gJpA4NhhHR6lxqP90JsqtlRs4Lsf7LBZ/WhATwsOPIIWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR07MB10552
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 08:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239867

T24gVHVlLCAyMDI2LTA2LTMwIGF0IDEwOjEzICswMjAwLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQg
d3JvdGU6DQo+IE9uIE1vbiBKdW4gMjksIDIwMjYgYXQgNDoxNSBQTSBDRVNULCBSb3NzIEJ1cnRv
biB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiAibWVzb24gY29tcGls
ZSIgaXMgZXNzZW50aWFsbHkgYSBnbG9yaWZpZWQgd3JhcHBlciBhcm91bmQgY2FsbGluZw0KPiA+
IG5pbmphDQo+ID4gdGhhdCBkb2Vzbid0IHN1cHBvcnQgYWxsIG9mIHRoZSBvcHRpb25zIHRoYXQg
bmluamEgZG9lcywgc28gY2FsbGluZw0KPiA+IGl0DQo+ID4gZGlyZWN0bHkgbWVhbnMgYnVpbGRz
IGFyZSBmcmFjdGlvbmFsbHkgZmFzdGVyIGFuZCB3ZSBnZXQgZGlyZWN0DQo+ID4gY29udHJvbA0K
PiA+IG92ZXIgdGhlIGZsYWdzIHRoYXQgbmluamEgaXMgcGFzc2VkLg0KPiA+IA0KPiA+IEEgbG9u
Z2VyIHJhdGlvbmFsZSBjYW4gYmUgZm91bmQgaW4gdGhlIEdlbnRvbyBjaGFuZ2UgYnkgRWxpDQo+
ID4gU2Nod2FydHoNCj4gPiB0aGF0IGNhdXNlZCB0aGlzIHBhdGNoLCB3aG8gaXMgYm90aCBhIEdl
bnRvbyBhbmQgTWVzb24gZGV2ZWxvcGVyOg0KPiA+IA0KPiA+IA0KPiA+IFRoZSBvbmx5IGNoYW5n
ZSBpcyB0aGF0IHRoZSBjb21waWxlIHRhcmdldCBkb2Vzbid0IHN1cHBvcnQgdGhlDQo+ID4gb3B0
aW9uYWwNCj4gPiBjb252ZW5pZW5jZSB0YXJnZXQgdHlwZSwgYnV0IHRoaXMgaXMgcmFyZWx5IHVz
ZWQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFy
bS5jb20+DQo+ID4gLS0tDQo+ID4gwqAgbWV0YS9jbGFzc2VzLXJlY2lwZS9tZXNvbi5iYmNsYXNz
IHwgMiArLQ0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtcmVjaXBlL21lc29uLmJi
Y2xhc3MgYi9tZXRhL2NsYXNzZXMtDQo+ID4gcmVjaXBlL21lc29uLmJiY2xhc3MNCj4gPiBpbmRl
eCA5YmVkMjkzNjAzYy4uYTQ2NDM1OTExMDMgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2Vz
LXJlY2lwZS9tZXNvbi5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9tZXNv
bi5iYmNsYXNzDQo+ID4gQEAgLTE4MCw3ICsxODAsNyBAQCBtZXNvbl9kb19jb25maWd1cmUoKSB7
DQo+ID4gwqAgDQo+ID4gwqAgZG9fY29tcGlsZVtwcm9ncmVzc10gPSAib3V0b2Y6XlxbKFxkKykv
KFxkKylcXVxzKyINCj4gPiDCoCBtZXNvbl9kb19jb21waWxlKCkgew0KPiA+IC3CoMKgwqAgbWVz
b24gY29tcGlsZSAtdiAke1BBUkFMTEVMX01BS0V9ICR7TUVTT05fVEFSR0VUfQ0KPiA+ICvCoMKg
wqAgbmluamEgLS12ZXJib3NlICR7UEFSQUxMRUxfTUFLRX0gJHtNRVNPTl9UQVJHRVR9DQo+ID4g
wqAgfQ0KPiA+IMKgIA0KPiA+IMKgIG1lc29uX2RvX2luc3RhbGwoKSB7DQo+IA0KPiBIaSBSb3Nz
LCBIaSBEYW5pZWwsDQo+IA0KPiBJIGp1c3Qgbm90ZSB0aGlzIHRoaXMgcGF0Y2ggaXMgY29uZmxp
Y3Rpbmcgd2l0aCB0aGUgb25lIGZyb20gRGFuaWVsDQo+IFsxXSwNCj4gYXMgaXQgZG9lcyB1c2Ug
J01FU09OX1RBUkdFVCA9ICJzeXN0ZW1kLWh3ZGI6ZXhlY3V0YWJsZSInLiBEZXBlbmRpbmcNCj4g
b24NCj4gd2hpY2ggcGF0Y2ggaXMgbWVyZ2VkIGZpcnN0LCB0aGUgb3RoZXIgbWlnaHQgaGF2ZSB0
byBiZSByZWJhc2VkIGFuZA0KPiBmaXhlZC4NCj4gDQoNCkRvIHlvdSBrbm93IHdoeSBpcyBjb25m
bGljdGluZz8gdGhlIHN5c3RlbWQgcGF0Y2ggZG9lc24ndCB0b3VjaA0KbWVzb24uYmJjbGFzcw0K
DQpJcyBpcyBhIGRpZmZlcmVudCBmb3JtYXQgZXhwZWN0ZWQgZm9yIE1FU09OX1RBUkdFVCBjb250
ZW50Pw0KDQpEYW5pZWwNCj4gWzFdOiANCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0KPiANCj4g
LS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcNCg0K


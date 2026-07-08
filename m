Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694AAC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 07:18:10 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3361.1783495088608639949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 00:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=zDu9Cx6y;
 spf=pass (domain: est.tech, ip: 52.101.65.47, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StfHOtVau29g1F2JRFS+Y1ZkIR5U+GzIB/nzsd+OBHSsxVOHLYH51Z9/colAe6CT6mQvHxnVJ71BZDnTcrsedZLIRyVBFNAnZB/FaQ/5paI43KfWKtRAYbS+Io+J3zvfDQ+cHc3aZDJmMPdK4SqD1bREtAdGOdHotVaj6sVSiDkT+c3KSzfm9k/6VuPMl78+FZ8diuulqONOxHSmdvpXBmvn1QnRm3te7Nnq4sIHep21JqRlz/xiQWH2Z8DwELULHRHbWFstVQi1aWMetR5aYPHOb8Y8uE4F/R7t5heBqqY6M8OrMZAgZX2DNSDhomIIyECyexKF3tv33WeDZqLDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HvIHpEYyDJJ/Hy3IseitvDlYXPkiaUtbm15dYfe8eo=;
 b=gjeXGgpAWhJjsn6vWdkJYchK4D0ahniyF/g93gkF+eUbMLX0bFAgwS8zENsdBOlDOmTpurKUqtyDKi5fkj5ktSRTd5I6val/xgFzDoBIxUp1BomTk23a87285RTwH0FgjndulefSDLNKua7eBuhXTJIhFYJtKbFqVLzjhbWennBAuFiAOuIu/58HTKNz/06YDY9yAeWXktM/BDV5/jAE2EsrSlX5tgB42MIOSRdL5cgkCK3GCsVYOHvSktIqHCXPR4HXqWl1i0JCm69AaEuaZ3CYprerBy9h5DCvM87CRBJA4MZaPWBwuorxhqlTsKWVEY/HCftU/cn5XOibxI86gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HvIHpEYyDJJ/Hy3IseitvDlYXPkiaUtbm15dYfe8eo=;
 b=zDu9Cx6yrnqLTeBIaTk6s0GU2YeYPtinZJEHOCBfHary8u54YNO1YhkxwfBAwbie+v9bEVBvnM+XaLVOhLrycT/fv4yY2pfJANZ+UNMwdp2ugSR/pRsQMUZy7vMgPLCHwh2ocd5A1wbsA1cJD0PraEdnL4m4BzKUVQsOgDg6O5sTBnVPHFdWrisGuE0jkwRHBoPt1lGcIweSu0i0UfsY6ZqStGUDUj/l19WYHxcHekZas1F8SQFYkjSR7Bs4sbLnJWynr1rAg+L3jhVf6D2uh1b3dt0Qgb8rINkprikChSdGP4mnXgENVh7DfO+dSjLhFDhdgoUkchOuOhJARilWUA==
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by GV4P189MB3536.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 8 Jul
 2026 07:18:01 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 07:18:01 +0000
From: =?utf-8?B?Um9sYW5kIEtvdsOhY3M=?= <roland.kovacs@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: fix CVE-2025-69649, and
 CVE-2025-69652
Thread-Topic: [OE-core] [scarthgap][PATCH] binutils: fix CVE-2025-69649, and
 CVE-2025-69652
Thread-Index: AQHdCGn4ojpW/YTOnEievguPTvsFSrZiHOOAgAEmGQA=
Date: Wed, 8 Jul 2026 07:18:00 +0000
Message-ID: <04e933b9ca2b95105e6fbbae44d2649f9c174c7b.camel@est.tech>
References: <20260630082509.34865-1-roland.kovacs@est.tech>
	 <DJSDUQYWTQ41.S7H4ENLDNW1R@smile.fr>
In-Reply-To: <DJSDUQYWTQ41.S7H4ENLDNW1R@smile.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB0725:EE_|GV4P189MB3536:EE_
x-ms-office365-filtering-correlation-id: f4d96cf5-5653-4895-e042-08dedcc10b52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|3023799007|56012099006|4143699003|11063799006|38070700021|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 xdn0NXHQkPizLetRsl7pJBHymMqMtDP3U28xqLmd1BNcsDsk0+ee/XAvlqbPOH6ScPsbDUPi2fnb7Fn/f3h2aDHY7hJ13E+7X0rz14ey/0wDC93MFHkX9y9JwNW5cdBoXEE78RPdUtdpqNJpJW4e405wBwY7mLbJ2j4bc83IjygJEJWwyznwZgQLTE+O3u7CidbH96FG75Ne++LlndDr9f2u/S9445g45El1oH34euZCyZTtkv4fts2wj77XBbOEwklpXNv7GdzYqIo1Hz7RgHo80Mvb7MwVhQ8CXheMHzby/gQGr1Z+1RD0En3MESA96TSNZ/12q0oRozVnfGtn41aZjjkQ2Rw+mHbg5A2s6JPKgcILN5Tl9iCD0ZcYhBuo15O5gdgnrNO7FH0q87wV1CC78kR9EM9EBcHHQ8uRRXc3oFQdeCm93EdEEHNEjy2FitQNHUD9mRGK3CRN5cm3OWk7S6CnXSVouYX2kjv5Gc4hWZehJjiIQs7oJQVgBJqYKb0otrcztUKthjS1/TChOX4rp+OvDXOiGUDb9KFzim5aQWZ4VUemai12mVrrEOIVAWiWsy+n8AAsCGaiNqYh5Hqd12qKpFJfub46/iwt6iJkgdOTDPD2KYjLfndUaKuq1xoimteo0ZVNHwDbgZxLHK9oNyX3d3Hn1YV4CUzxZp8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(3023799007)(56012099006)(4143699003)(11063799006)(38070700021)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c3JkYWMwOGFDTWhpNW81WUVmVkdsNnU2MDl3aWllQk43cmxqcmRkWnAzejlo?=
 =?utf-8?B?WmdlN0UyZlhMZ1d4bjNHcytZMUZVTHpMWklnTlN2d3BxaUt2emJad1k2MEJ6?=
 =?utf-8?B?TDRDL3RXNVhqQkJTcjY2Q0QybTFrSlViVXRVeVlxR0trelJyelJ4aXgzb1hL?=
 =?utf-8?B?RUt3YWNmZG9KakMxOWhjRFRJd0ZVNEIxdjd5RDhlVmxqUlQrNUlmU1QvSHkz?=
 =?utf-8?B?OVhxUjlDc3Z3OXdVSUI2QzJkQWxmZHlmS2xmZE1idjluZEw2K3pWbWxvQStU?=
 =?utf-8?B?SzNTbW5OQmVubHpMTUovVTJja2JjeWxEaTBwSTFaTWx4bGk4NVVmVm9uRzUr?=
 =?utf-8?B?K21FOVhYUUJPKzdISnRNMnpIT05tWitZUW5PNFNIQm5uZjkycGRlUE9kbVk5?=
 =?utf-8?B?ZlRscHU3MEVSTDNJYW04MXQrWnpWdGFsTGNabUI0amUzNUlmeHR6aTh5dmUw?=
 =?utf-8?B?ZzNIZ0hZa1J5UzMxRHBINk9wOCtEZGM4QU96UVMzNDBmU0JreHBBcDJSNy9J?=
 =?utf-8?B?WnlIK1pyVTdZWHJvaHNUSktNdG5keUVEOFN5M245NDZ2UURnN0o2eU1UUS9i?=
 =?utf-8?B?K05BVVVsbmJWWmxjQkJIWXhXWWUzZFNPRU5NUUZGZmN0a0J1dUxCVnZKSCsv?=
 =?utf-8?B?QWprUVNFODY5NStKemlGMjR0K2dralYrTVd1eEpvZmhTdGRhRTlKM0tlc2J2?=
 =?utf-8?B?UWFwVHVVQTR2eEFibTR4eUNyVDJuNnRzQ216emIrQytmeXpkNFlsVXVIaXdR?=
 =?utf-8?B?eDBLRVR5dGZHUzl5RUh1bm1ldFdOVHB0cGMvNUpZbktTa1lLRTIySXdGb1dO?=
 =?utf-8?B?L2VDRm03WUVjWDE5S3Bzelo2T0FZMFUyRFgwd2VocllGV0c0NktWRXh3Y1NC?=
 =?utf-8?B?WEhoSXNXc0o3OFZsQlA1VDkvNU9TLzhEZ2pXTDBRTmZKWStCTExkYldUV3Na?=
 =?utf-8?B?REJvZzFkV3NaWUthSEc3YzZwTTg0dGJhODQxdGIzQjY4MXQwanVqbXdMZlhn?=
 =?utf-8?B?Qk1iOXNCRlFvTnJVRGZQKzdUUlVDQi9zSW13RHlzMStlb0pvVmxnVzdaUjdx?=
 =?utf-8?B?Y0dKN0c3bVhOMUpPRU4wb0lmZEdkUFY2aGduaS9EQ1g0Q1BpUWZkN1k4ZkpQ?=
 =?utf-8?B?YlB1Sm1iUzdMMks4Mk84OSttb2JvQjNCcTlNcHNzeDQ2U3dwREQ4d1lLSVJ3?=
 =?utf-8?B?RWUxWWRHd2hYRmU2VGpOTWJYZTdHdFBPK05EZEMvQ0dpcEtVYjJDSjlBc3BH?=
 =?utf-8?B?WFR4RThQVldVd1hZeWxBV205bklRMk1DQnV4alBqOEpzdXZEY3dOeGdrc3dT?=
 =?utf-8?B?V21PTWtHMk4wZ3ZMemovMVloRjhFeDZ4bXd6MnJJdGJMY09XSk1mbldQK1FK?=
 =?utf-8?B?R2x5WnhrWmJrKzQxWTVHTDFKR1ZlSmhoSG8vbFpocnNMajQ0SDdrcWVCUVpC?=
 =?utf-8?B?SVA4UEhSZDhlRk1FRk5iaVY0aVRFU2JxVDZPL1V1WnNINUFVSGlyYXlTK2do?=
 =?utf-8?B?NEJLcTVCL2luNldIZDRCT0xzTEhrV1JFdmNqUVA2RDhtSUVFUmI2ZXM4WEdO?=
 =?utf-8?B?KzNXNUppM2pvZmgxbFdPK1V3TjBmQ2R0UkovbER2VVJqRDEyMEQvdHhmTlNE?=
 =?utf-8?B?MjUrdURGaEUyTVhYKzZQanRxVktPWWJGVklKc3ZrcUhnSlljckxQV3NRWUlG?=
 =?utf-8?B?Wkx0aTI1OUhRalVVdXVvV1FQeXNwMXBwY3NHYTFvaEdIelR4ZHZiNTFGUVNY?=
 =?utf-8?B?dDVQRUIrWW43SnB1a0h1R3ZBT0JMNERjUXFTRmw3WUdabmJKRWpGTWJSN2Fx?=
 =?utf-8?B?dm5YRFhIZWFVcC8xaGI1VEJhd1pVb0FibmVLcHllU29BZkVETUtTU0E5emRB?=
 =?utf-8?B?U3hDUis1SldKWkF5UXJvbW5NKzdoYjE2UUhJMkozbFVmWmJaWjVmVzRCaUtY?=
 =?utf-8?B?OGpWZHZDam1ZTFdEVDBmcW1ZVHgyL0tPV0FCTHhMRXcrQ3BidTNNeTJSa2xl?=
 =?utf-8?B?RGNIVUJyU1lOb2ZwemlpUFg1MTBMVEhMMGtLeFYyNFVIVGZmbmd3cG5hMEtJ?=
 =?utf-8?B?dEk0OUZ4M05mN3RmM2pzOGZzeVdDOW5idnZialVHZ1VqYUtlTFg1enRoUFkw?=
 =?utf-8?B?Z3pETlBRdUZGQkFFRUpUZjNqcEdoV3I1VS9FQmJGeHA4dXNORXVsNjJoSWw4?=
 =?utf-8?B?ZHBWTlVBZk1LQlVzclNqaVl0SG9GU0dIUXF3WS9DTDd0Z1pmanBtSVovc0do?=
 =?utf-8?B?ZW5QbEFlblJIYnptaGtsL25ndGtYMnZLMStrbXkweWM0aHJFemd0Sm9uczBO?=
 =?utf-8?B?YTkrWkh5NnFidWpzbWo2SzZ4akU1UGtld2ozYktPY0R4aW1BSEFHUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21C214EC9DF98047B892E5F5A9E25520@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d96cf5-5653-4895-e042-08dedcc10b52
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 07:18:00.9749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgimAnrAIhYmYK3SRMNKG7f612bFlLiICC9xS8FHSuSGumlZTphYbwjQyR8pSqVFInkDR4iQxm9zDeCF1osQOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3536
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 07:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240441

T24gVHVlLCAyMDI2LTA3LTA3IGF0IDE1OjQ1ICswMjAwLCBZb2FubiBDb25nYWwgd3JvdGU6DQo+
IEhlbGxvLA0KPiANCj4gT24gVHVlIEp1biAzMCwgMjAyNiBhdCAxMDoyNSBBTSBDRVNULCBSb2xh
bmQgS292w6FjcyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBDVkUtMjAy
NS02OTY0OToNCj4gPiDCoCBOdWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gcmVhZGVsZiBiZWZv
cmUgMi40NiByZXN1bHRzIGluIHNlZ2ZhdWx0IHdoZW4NCj4gPiDCoCBwcm9jZXNzaW5nIGEgY3Jh
ZnRlZCBFTEYgYmluYXJ5IHdpdGggbWFsZm9ybWVkIGhlYWRlciBmaWVsZHMuDQo+ID4gwqAgTm8g
ZXZpZGVuY2Ugb2YgbWVtb3J5IGNvcnJ1cHRpb24gYmV5b25kIHRoZSBudWxsIHBvaW50ZXIgZGVy
ZWZlcmVuY2UsIG5vcg0KPiA+IMKgIGFueSBwb3NzaWJpbGl0eSBvZiBjb2RlIGV4ZWN1dGlvbiwg
d2FzIG9ic2VydmVkLg0KPiA+IA0KPiA+IENWRS0yMDI1LTY5NjUyOg0KPiA+IMKgIE51bGwgcG9p
bnRlciBkZXJlZmVyZW5jZSBpbiByZWFkZWxmIHdoZW4gcHJvY2Vzc2luZyBhIGNyYWZ0ZWQgRUxG
IGJpbmFyeQ0KPiA+IMKgIHdpdGggbWFsZm9ybWVkIERXQVJGIGFiYnJldiBvciBkZWJ1ZyBpbmZv
cm1hdGlvbiB3aGljaCBsZWFkcyB0byBTSUdBQk9SVC4NCj4gPiDCoCBObyBldmlkZW5jZSBvZiBt
ZW1vcnkgY29ycnVwdGlvbiBvciBjb2RlIGV4ZWN1dGlvbiB3YXMgb2JzZXJ2ZWQ7IHRoZSBpbXBh
Y3QNCj4gPiDCoCBpcyBsaW1pdGVkIHRvIGRlbmlhbCBvZiBzZXJ2aWNlLg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IFJvbGFuZCBLb3ZhY3MgPHJvbGFuZC5rb3ZhY3NAZXN0LnRlY2g+DQo+ID4g
LS0tDQo+ID4gwqAuLi4vYmludXRpbHMvYmludXRpbHMtMi40Mi5pbmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDIgKw0KPiA+IMKgLi4uL2JpbnV0aWxzL2JpbnV0aWxzL0NWRS0y
MDI1LTY5NjQ5LnBhdGNowqDCoMKgIHwgMzYgKysrKysrKysrKysrKysrKysNCj4gPiDCoC4uLi9i
aW51dGlscy9iaW51dGlscy9DVkUtMjAyNS02OTY1Mi5wYXRjaMKgwqDCoCB8IDM5ICsrKysrKysr
KysrKysrKysrKysNCj4gPiDCoDMgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKQ0KPiA+
IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51
dGlscy9DVkUtMjAyNS02OTY0OS5wYXRjaA0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy9DVkUtMjAyNS02OTY1Mi5wYXRjaA0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmlu
dXRpbHMtMi40Mi5pbmMgYi9tZXRhL3JlY2lwZXMtDQo+ID4gZGV2dG9vbHMvYmludXRpbHMvYmlu
dXRpbHMtMi40Mi5pbmMNCj4gPiBpbmRleCAxYTg2NWM0NWY0Li5kYTk1NGZjMTM4IDEwMDY0NA0K
PiA+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy0yLjQyLmlu
Yw0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy0yLjQy
LmluYw0KPiA+IEBAIC03NCw1ICs3NCw3IEBAIFNSQ19VUkkgPSAiXA0KPiA+IMKgwqDCoMKgwqAg
ZmlsZTovLzAwMzAtQ1ZFLTIwMjUtMTE4NDAucGF0Y2jCoFwNCj4gPiDCoMKgwqDCoMKgIGZpbGU6
Ly9DVkUtMjAyNS02OTY0Ny5wYXRjaMKgXA0KPiA+IMKgwqDCoMKgwqAgZmlsZTovL0NWRS0yMDI1
LTY5NjQ4LnBhdGNowqBcDQo+ID4gK8KgwqDCoMKgIGZpbGU6Ly9DVkUtMjAyNS02OTY0OS5wYXRj
aMKgXA0KPiA+ICvCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjUtNjk2NTIucGF0Y2jCoFwNCj4gPiDC
oCINCj4gPiDCoFPCoCA9ICIke1dPUktESVJ9L2dpdCINCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzL0NWRS0yMDI1LTY5NjQ5LnBhdGNoIGIv
bWV0YS9yZWNpcGVzLQ0KPiA+IGRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzL0NWRS0yMDI1LTY5
NjQ5LnBhdGNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAw
Li40ODY1YWQ2NTM1DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9iaW51dGlscy9iaW51dGlscy9DVkUtMjAyNS02OTY0OS5wYXRjaA0KPiA+IEBAIC0w
LDAgKzEsMzYgQEANCj4gPiArRnJvbSA5ZDI2YWYzODcxZDViOGY4ZGQ5YzZiMTc5ODc4NDVlMWY3
NzRlYWM0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiA+ICtGcm9tOiBBbGFuIE1vZHJhIDxh
bW9kcmFAZ21haWwuY29tPg0KPiA+ICtEYXRlOiBNb24sIDggRGVjIDIwMjUgMTU6NTg6MzMgKzEw
MzANCj4gPiArU3ViamVjdDogW1BBVENIXSBQUiAzMzY5NywgZnV6emVyIHNlZ2ZhdWx0DQo+ID4g
Kw0KPiA+ICsJUFIgMzM2OTcNCj4gPiArCSogcmVhZGVsZi5jIChwcm9jZXNzX3JlbG9jcyk6IERv
bid0IHNlZ2ZhdWx0IG9uIG5vIHNlY3Rpb25zLg0KPiA+ICsNCj4gPiArQ1ZFOiBDVkUtMjAyNS02
OTY0OQ0KPiA+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0DQo+ID4gW2h0dHBzOi8vc291cmNl
d2FyZS5vcmcvZ2l0L2dpdHdlYi5jZ2k/cD1iaW51dGlscy1nZGIuZ2l0O2g9NjZhMzQ5MmNlNjhl
MWFlNDViMjQ4OWJkOWE4MTVjMzllYTVkDQo+ID4gN2Y2Nl0NCj4gPiArDQo+ID4gK1NpZ25lZC1v
ZmYtYnk6IFJvbGFuZCBLb3ZhY3MgPHJvbGFuZC5rb3ZhY3NAZXN0LnRlY2g+DQo+ID4gKy0tLQ0K
PiA+ICsgYmludXRpbHMvcmVhZGVsZi5jIHwgNiArKystLS0NCj4gPiArIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gKw0KPiA+ICtkaWZmIC0tZ2l0
IGEvYmludXRpbHMvcmVhZGVsZi5jIGIvYmludXRpbHMvcmVhZGVsZi5jDQo+ID4gK2luZGV4IDVl
NGFkNmVhNmFkLi44YzE5ODdmZmFlYyAxMDA2NDQNCj4gPiArLS0tIGEvYmludXRpbHMvcmVhZGVs
Zi5jDQo+ID4gKysrKyBiL2JpbnV0aWxzL3JlYWRlbGYuYw0KPiA+ICtAQCAtODk2MSw5ICs4OTYx
LDkgQEAgcHJvY2Vzc19yZWxvY3MgKEZpbGVkYXRhICogZmlsZWRhdGEpDQo+ID4gK8KgwqDCoMKg
wqDCoCBzaXplX3QgaTsNCj4gPiArwqDCoMKgwqDCoMKgIGJvb2wgZm91bmQgPSBmYWxzZTsNCj4g
PiArIA0KPiA+ICstwqDCoMKgwqDCoCBmb3IgKGkgPSAwLCBzZWN0aW9uID0gZmlsZWRhdGEtPnNl
Y3Rpb25faGVhZGVyczsNCj4gPiArLQnCoMKgIGkgPCBmaWxlZGF0YS0+ZmlsZV9oZWFkZXIuZV9z
aG51bTsNCj4gPiArLQnCoMKgIGkrKywgc2VjdGlvbisrKQ0KPiA+ICsrwqDCoMKgwqDCoCBzZWN0
aW9uID0gZmlsZWRhdGEtPnNlY3Rpb25faGVhZGVyczsNCj4gPiArK8KgwqDCoMKgwqAgaWYgKHNl
Y3Rpb24gIT0gTlVMTCkNCj4gPiArKwlmb3IgKGkgPSAwOyBpIDwgZmlsZWRhdGEtPmZpbGVfaGVh
ZGVyLmVfc2hudW07IGkrKywgc2VjdGlvbisrKQ0KPiA+ICvCoAl7DQo+ID4gK8KgCcKgIGlmICjC
oMKgIHNlY3Rpb24tPnNoX3R5cGUgIT0gU0hUX1JFTEENCj4gPiArwqAJwqDCoMKgwqDCoCAmJiBz
ZWN0aW9uLT5zaF90eXBlICE9IFNIVF9SRUwNCj4gDQo+IFRoaXMgYmFja3BvcnQgaXMgc2Vuc2li
bHkgZGlmZmVyZW50IGZyb20gdGhlIHVwc3RyZWFtIGNvbW1pdC4gVXBzdHJlYW0NCj4gaGFzIGEg
c2hvcnQgZm9yIGxvb3AgYnV0IHlvdXIgcGF0Y2ggaXMgYXQgdGhlIHN0YXJ0IG9mIGEgcmVhbGx5
IGxvbmcNCj4gb25lIQ0KPiANCj4gQ2FuIHlvdSBqdXN0aWZ5IHdoeSB5b3VyIGJhY2twb3J0IGlz
IHNhZmUgJiBjb3JyZWN0Pw0KPiANCj4gVGhhbmtzIQ0KDQpZZXMsIG9uIDIuNDIgdGhlIGZvcm1h
dHRlZCBwcmludGluZyBvZiByZWxvY2F0aW9ucyBpcyBpbi1saW5lLCB3aGlsZSBvbiAyLjQ2IHRo
YXQgY29kZSBtb3N0bHkgaGFzDQpiZWVuIG1vdmVkIGludG8gJ2Rpc3BsYXlfcmVsb2NhdGlvbnMo
KScgYXMgcGFydCBvZiA4ZThkMGI2M2ZmMTU4OTZjYzJjMjI4YzAxZjE4ZGZjZjJhNGE5MzA1Lg0K
U2VlOg0KaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9YmludXRpbHMtZ2RiLmdpdDthPWJs
b2JkaWZmO2Y9YmludXRpbHMvcmVhZGVsZi5jO2g9ZmEwZGUzYTdlMGQ5YzJhY2MxOGZlMDQ3YTcw
MTllMDlmMWNlMzg5NDtocD1jMTAwNjQ4MGI3YmMzZTgzZGQ4N2ZiMjBkMjE1MzQyMzc1NjE0YWY5
O2hiPThlOGQwYjYzZmYxNTg5NmNjMmMyMjhjMDFmMThkZmNmMmE0YTkzMDU7aHBiPTMxYzIxZTJj
MTNkODU3OTNiNTI1Zjc0YWE5MTFlYjI4NzAwZWQ4OWMNCg0KQ2hlZXJzLA0KCVJvbGFuZA0K


Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C82C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 10:02:14 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.85])
 by mx.groups.io with SMTP id smtpd.web11.5420.1646388133558616562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 02:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nTZJlD8p;
 spf=pass (domain: siemens.com, ip: 40.107.2.85,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmvaiwvC3IjUV4NX15o4CfjTa9efmNzXEZFyFBRcuRRtarJS6DWm8tb1n5Ai2KUcA36QGpAANftjtnwwDOs5N+f9G/EYbUREqXU/+PXIt4BgRMbxXDx1h/mjx2/L+LVz1EQw9ftINyJ7qYMkQrYeyFSFcsKWSEvZrdJm3QmuHxBnLUk36nfQTAjvIKYdkCzTgEUeYRlagsEKyj9Dv+jdUElm3kH70evH56t2FUJYbdmK9w2SgwbhRM/5WOnkVBQ5/23yrebNF3m+gmhMr5NrOUonfBWL1242kPqiS1hkoiDRfl6nAoRq19e2Twc3pQLX+SvW9kfAiB7WLJYLrzAwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4GTmQlyU2eSUrG4Zb6bhFKiG0CKnkTZk10H6q9HPiA=;
 b=h/ge5YosqkuVjylFJpGxVDFzC4zlFBzPDFJ5g8lGxHYdQBSmF4RknwwbI6zcUuNpPvbuvZ1yvOCAbKptPjh3nHVQEW0bk7j+ZUu1b8W+T7uxvRUbdikTNbTH/nE5cJRt0je5i36bbOD7nh6ed991Ezv0x0rAJZ2ux9aI9Cj+rUR4TK2uGuC0tGDnxFyNSudSeGwfLWy72bnbPcxGs/krpr5rosUXl5ygpiLjsEH8UgvN32z7DH94zihO+GQWKHTbI3ZRWGxqjp1KSKHCzmKTi37xBS3gCLPsATnaYCOWfVow4G99DPUiCbjF99vmiCl4x4XQVIbe3GjamWcr45jBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4GTmQlyU2eSUrG4Zb6bhFKiG0CKnkTZk10H6q9HPiA=;
 b=nTZJlD8pmRX5Q+Je4JaJB6dbScMXpYPYM/fUc7uaL/6wXCl2L7DtfTVTMpQOFzDhUSWavBwkcmLfnRGtdx+6ClM0H2pmUMWCU0BpvUFRkTBywzKOhWn4ItF4g5VQfFefUYJvjGnZGT1rVWugccWjHB1ydo/v4CjPX2awZkZBG9unTgZhFy8Fow+eYgDFQJrysjDPMF/ypy1zdVTBREkLNVA4NwGW7EJ8uNbyI4M5ZAoIuDjMB0vx51+Zvm4CYy1epcDfA/NoflMtJPPaKEB/YhgYt/GYEnP7kgacReBHp3ycEQHlp+3jrtJQU8VN8UdcyAPNqpDIXMuD3CvxOWU+Ow==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by VI1PR10MB2272.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:79::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 10:02:07 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c9d9:d51f:3d47:9bee]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c9d9:d51f:3d47:9bee%9]) with mapi id 15.20.5038.014; Fri, 4 Mar 2022
 10:02:07 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "dwagenknecht@emlix.com" <dwagenknecht@emlix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] copy_buildsystem: allow more layer paths
Thread-Topic: [OE-core][PATCH] copy_buildsystem: allow more layer paths
Thread-Index: AQHYLmil0dofjl7G7EG733p89knoqqytNOSAgAHCO4CAAAneAA==
Date: Fri, 4 Mar 2022 10:02:07 +0000
Message-ID: <e7cee4d81b813d5dce6e0cf3961d1fe7e13ea421.camel@siemens.com>
References: <20220302190554.1953968-1-dwagenknecht@emlix.com>
	 <a6865397ca95fbe80336054fdc8486165a5e35f1.camel@siemens.com>
	 <07ec7ffbeea3b92bb84a71024bdccddc327b247f.camel@emlix.com>
In-Reply-To: <07ec7ffbeea3b92bb84a71024bdccddc327b247f.camel@emlix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-3.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82a3cd7d-6f73-4c08-b777-08d9fdc60ad6
x-ms-traffictypediagnostic: VI1PR10MB2272:EE_
x-microsoft-antispam-prvs: 
 <VI1PR10MB2272F01633AE33DDBFCB21A592059@VI1PR10MB2272.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PK7n9UDKS9xZh7GcvUrOYTv6CfVnfA6Ef+IClTN/t/WESYFoik2FlYf913lIqdISfbugPpd/G00xZ3Rdc44hMG2dc/y1su57D4/pYZFyKjkUrEMkQmlJdFwzKrMFtqJFMJWzyDCa2DQ41TOMnXzvb1UV1WC9KviVobRc0VYksx2vBfcH5ucynGzra5xGPP6uYdMO2VVF48du1rHlbYWwk9vpqYBJv3oyNjGOJwCOO7iiNKp3c43NXgaQ12+VbdFdIJLrtFMVPvvz4iwrHI/LTqP/r5s1dJK6UPUXNt327CYbk/gJHQIjjCraWkLP++jP6UlYbt2fTyeNfP8tRidSAh7Sj3SVOL0ect3eWoUBC5fQ5hwQJKOhSvrkF85eh7EHqebo7AxVh4k50TQVgo/cwk5qeqaA/+ZsqrKOyi0Vb+lc5wwpC4OmyGsct+VHQPZp0rhi8r2auF/bdMXNLOLShBEetPOojlOHtFWKomcVqIbgaKglDIt5nbZTuAzDrlp4aJCGZvs61LSlNiyc5Nsn98kFz2aPk/O450OybJPYTXdisL/E316UceAIdN9HKdkc3xOgeabqxvfBnjrpGeQnqMDWNeZPByN8zf6+Y+tB987W4fzDd0JlaAugfCUKFellKetkD6kxJS26sTdP2FGXhV55GrLPUzbMsTE4WkWOlkD/ybIL8ainZWze3scCltnWc7qFSxszwkR9evczMBlgxg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(36756003)(38100700002)(186003)(8676002)(82960400001)(4326008)(122000001)(2906002)(91956017)(66476007)(76116006)(66946007)(66556008)(66446008)(64756008)(26005)(6486002)(6506007)(83380400001)(86362001)(38070700005)(316002)(71200400001)(110136005)(6512007)(2616005)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TmtSSDg0ZEZVdENoVHcvT0w5S0FCUjdoRTNaR3Izalc3ZTJyTGhqVWFWK0FW?=
 =?utf-8?B?emxuR0pkMHZUZTJJaVZoZTdKZHRHMEF2K0RBZVVPVmZsWFRLMFpmN1JVV3Fp?=
 =?utf-8?B?ZnBHQ045djZXUUgwVkozRW5LYitrbHVjaXQvTWxKWk52MHJHbDFZYStmc1Vt?=
 =?utf-8?B?dktpbnM1RkZoSjJybzBQNXkvZGVoNXQ5SnozWWVhbGpNeTJQTXhodlR5QzFW?=
 =?utf-8?B?UllQNVd3aUZYYXYwQ2JuNGR0RUl4eTlUeUxCby8zbkpkZ21JMnF6bHd3WlV0?=
 =?utf-8?B?YUVvaERmUHRtVXFqejlXVGxDRzZKQjh5azhVemdmLzNDbGJid0JuSFZQcFJH?=
 =?utf-8?B?ODF6NnFabkVINWppWnlVY3R0SmJmRmpaa01lTmFvNlVaVnptVVgzZnpPM296?=
 =?utf-8?B?VzBFbFpuMWx5Z0JjRlpYZHJkYlY2K0VHbHNzQzBzcmN6S0p0eHBrODlKREY2?=
 =?utf-8?B?UUlweXJ0VjdqY3dveGdVN1NScG05L21tSmNyUTVPM3RpbytKVzNKZDhsN2tB?=
 =?utf-8?B?RDRON0VvUHlYbjdGTFBMRktNTzQ4U09WK0xZa01lK3d0UitwdWZHZkc5K0JD?=
 =?utf-8?B?TFVyYUhCOTUrUExrUTlUeWZlaFl5MWpMbURRdUs0bFVCbjRqcjg0cktFQUEv?=
 =?utf-8?B?K29mSzl0VTVrVlpsNnpxaml2QXJHaWcvT2JsRU51M28xaUo5R3dEVG5DZGhO?=
 =?utf-8?B?TUhaS1hpTUtMQy9WOUxNREkxd09sZXgraStNTCtvczJxMEdmeUVlN25kaDV2?=
 =?utf-8?B?aUlMK0hOWklrTU9QOCtQUFZsNUZMajlaK0lrSFBrNnFhbFFFYVUzbHFFMWxk?=
 =?utf-8?B?a2JYck1uY0ZVYSswdkJmSjhtTXBNZlFGT0IwQ3hiaTVlelAxMXVYaHFsa2ky?=
 =?utf-8?B?L3RwYzBvc0NlQ1IyMFZoTHJrR1hONTJjNWMwVzlwdDBzY2JwU3laUHFFdEph?=
 =?utf-8?B?c2gzVFhxUVpCaHE4eWNKUHRBYmE3TnVIV0dZYUFaNTFqWHJRU2NiK2NZeUxv?=
 =?utf-8?B?ZzNPSjJMdjNBUnZ5cTZTVkRha0xwWnRMaDc1TzR5NEFaVFkzZUpad1NZQmJ5?=
 =?utf-8?B?NmhyRk16Z0habGtXLzVqNUVNU0xpaTFMbFdhT2hpOHNzSkZIR0R5UURJQUlX?=
 =?utf-8?B?MnVBS1lPZTRhRFB4a2hMQ1R6b2tqa2JxRWd4RzBDUkp6cDhld0EvMHNxNkh6?=
 =?utf-8?B?ejJJRXVQZGI5Y0gxRXErR0gyUFgxeWF5eS9OcmliM2VVQVhRYXRZeGVqNzFN?=
 =?utf-8?B?MHBXM1lZVVQxd1duelN6ckx3ZUtyZHk0bWRHdGFsQVFuRyt1WjBLMVJibkdH?=
 =?utf-8?B?NnZMc1ZiRWp5SnVnODBJZUU1NjEvck12WnFMaVNiVFRVK1pLZngyeU9DMytZ?=
 =?utf-8?B?QUlFZkg0YmZNZUFRTDdpTEpEN013OTlXeFFROHMxeGZvYzBnTTU2dStzdXgx?=
 =?utf-8?B?NUx1UHlKVmppa2xYVWhIc2ZObHBQMnp3bGR0Vm5zL3NpREVZakhqNlhKcWZs?=
 =?utf-8?B?WFZXOUZUVXg5ZTVKRHFmK0p1WHFKSFo2RFVlN2ZhWWhXcXJPT3lrK1J0Ri9P?=
 =?utf-8?B?T3Fray94V1I3WjRCZjBKbTAyNXhkWk1lV21Fa1EzaTZtQmJNc3E5VVVZWFBK?=
 =?utf-8?B?NHR2ZnFneEQ3NjJtczdHcDl1SU81d0FuckZEUGRWTHFCVWlYbFlKZ3BjSm5n?=
 =?utf-8?B?U21mam5lR09JQTAyd0NQVTI2YmtaSWFHVFRHT3c4aThzUWNRN3g1ZEJOdUlW?=
 =?utf-8?B?Q1RZVCtRZjUyRGdZbU4zUmNLbTlWaldCSWM5Nm5Lai9Wa3FVZUh2VGRSN1k0?=
 =?utf-8?B?cVBQZm90N2psZUNvcFZiOExWQ1o2eFNCWDBqL25CQW4vcjJUL0JhQmFjRDZu?=
 =?utf-8?B?c3J0Y21HSS94bkhxNUptL2JmWDNxS2xSQVVKVWZERFJObkZ0S1NZUEVzWHo2?=
 =?utf-8?B?aldKY2tXWWYyak9lcDNMVUsxQXd4akZqeXY3TE95YVRGT2dMZ2RWN0U4MktI?=
 =?utf-8?B?K01BV0NHcWRIaDRMemtwOEJhSFVWTjZzUUZUT0pPanFVR1BvdGhEeDA0WkJq?=
 =?utf-8?B?RTZYMGV1RS9mUTlSVytIb3FmRHpBQ3QyQ2Q3NjNwN3JMdDNUWnRnd3E5NzdQ?=
 =?utf-8?B?STFHMitYZ2s5bzdvazNzMTZTamVpSXl2L3dqWCtHM1ZhZlZYUUdncDd1cWFh?=
 =?utf-8?B?bGVWSVc5dlE1MzB3RXU4aVVEYzlRVVVXMGRuUmwyYWkrNnRVSzVlV2Zybm5n?=
 =?utf-8?Q?DkboNszFBaOP3wAxDRBqiUJiWzCsixkYaa0ukS5ouk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B92187EC01054479B3AAE6236B5245A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 82a3cd7d-6f73-4c08-b777-08d9fdc60ad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 10:02:07.5581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 6sHKdmdyX5oH/qYK9rjtwzlbKnk0Md/TwvATtiQ5D0y5zOh3WZsXCAej4vuKlYFuIFL32c4sAlK8arRktZOt7i6xycOYefpsu76AB6R1ouY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2272
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 10:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162713

SGkgRGFuaWVsLA0KDQp0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4gVG8gYmUgaG9uZXN0LCB3
aGVuIEkgd2FzIGRlYWxpbmcgd2l0aCB0aGUNCmxheWVyIHN0cnVjdHVyZSwgSSBkaWRuJ3QgdGFr
ZSBhIGNhc2UgYWJvdXQgdGhlIGxheWVyIG91dHNpZGUgb2YgIndvcmsiDQpkaXJlY3RvcnkuDQoN
CkJhc2ljYWxseSBpdCdzIHRoZSBzYW1lIGFzIG1pbmUsIGJ1dCByZXNwZWN0IHRoZSBleHRlcm5h
bCBsYXllcnMNCm91dHNpZGUgb2Ygd29yaywgcmlnaHQ/IFNvLCB5b3VyIHByb3Bvc2FsIG1ha2Vz
IHNlbnNlIHRvIG1lLg0KDQpsYXllcnMNCuKUnOKUgOKUgCBtZXRhLW15LWxheWVyDQrilJzilIDi
lIAgbWV0YS1vcGVuZW1iZWRkZWQNCuKUgiAgIOKUnOKUgOKUgCBtZXRhLW5ldHdvcmtpbmcNCuKU
giAgIOKUlOKUgOKUgCBtZXRhLW9lDQrilJTilIDilIAgcG9reQ0KICAgIOKUlOKUgOKUgCBtZXRh
DQoNCkZvcmdldCBhYm91dCB0aGUgbGFzdCB2YXJpYW50LiBXZSBkb24ndCB3YW50IHRvIHJlbW92
ZSB0aGUgbGF5ZXINCnN0cnVjdHVyZS4NCg0KUmVnYXJkcywNCkFuZHJlag0KDQpPbiBGcmksIDIw
MjItMDMtMDQgYXQgMTA6MjYgKzAxMDAsIERhbmllbCBXYWdlbmtuZWNodCB3cm90ZToNCj4gSGVs
bG8gQW5kcmVqLA0KPiANCj4gT24gVGh1LCAyMDIyLTAzLTAzIGF0IDA2OjM1ICswMDAwLCBBbmRy
ZWogVmFsZWsgd3JvdGU6DQo+ID4gSGkgRGFuaWVsLA0KPiA+IA0KPiA+IENvdWxkIHlvdSBwbGVh
c2UgZ2l2ZSBoZXJlIHRoZSBleGFtcGxlcyBob3cgdGhlIGxheWVyIHN0cnVjdHVyZSBsb29rcw0K
PiA+IGJlZm9yZSBhbmQgYWZ0ZXIgY2hhbmdlPyBJIHdhbnQgdG8gc2VlIGhvdyB0cmFuc2Zvcm1h
dGlvbiBsb29rcyBsaWtlLg0KPiANCj4gV2l0aCBhIGRpcmVjdG9yeS1zdHJ1Y3R1cmUgbGlrZQ0K
PiANCj4gLw0KPiDilJzilIDilIAgcmVwbw0KPiDilILCoMKgIOKUlOKUgOKUgCBsYXllcnMNCj4g
4pSCwqDCoMKgwqDCoMKgIOKUlOKUgOKUgCBtZXRhLW15LWxheWVyDQo+IOKUlOKUgOKUgCB3b3Jr
DQo+IMKgwqDCoCDilJzilIDilIAgYnVpbGQNCj4gwqDCoMKgIOKUlOKUgOKUgCBsYXllcnMNCj4g
wqDCoMKgwqDCoMKgwqAg4pSU4pSA4pSAIGV4dGVybmFsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAg4pSc4pSA4pSAIG1ldGEtb3BlbmVtYmVkZGVkDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
4pSCwqDCoCDilJzilIDilIAgbWV0YS1uZXR3b3JraW5nDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAg4pSCwqDCoCDilJTilIDilIAgbWV0YS1vZQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKU
lOKUgOKUgCBwb2t5DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilJTilIDilIAg
bWV0YQ0KPiANCj4gYW5kDQo+IA0KPiAjIFNldCB0aHJvdWdoIGJpdGJha2UgaXRzZWxmDQo+IENP
UkVCQVNFID0gIi93b3JrL2xheWVycy9leHRlcm5hbC9wb2t5Ig0KPiBUT1BESVIgPSAiL3dvcmsv
YnVpbGQiDQo+ICMgU2V0IGluIGJibGF5ZXJzLmNvbmYNCj4gQkJMQVlFUlMgPSAiIFwNCj4gwqDC
oMKgIC9yZXBvL2xheWVycy9tZXRhLW15LWxheWVyIFwNCj4gwqDCoMKgIC93b3JrL2xheWVycy9l
eHRlcm5hbC9tZXRhLW9wZW5lbWJlZGRlZC9tZXRhLW5ldHdvcmtpbmcgXA0KPiDCoMKgwqAgL3dv
cmsvbGF5ZXJzL2V4dGVybmFsL21ldGEtb3BlbmVtYmVkZGVkL21ldGEtb2UgXA0KPiDCoMKgwqAg
L3dvcmsvbGF5ZXJzL2V4dGVybmFsL3Bva3kvbWV0YSINCj4gDQo+IFRoZSByZXN1bHRpbmcgZVNE
SyBsYXllcnMgZGlyZWN0b3J5IHdpbGwgbG9vayBsaWtlIHRoaXM6DQo+IA0KPiAuDQo+IOKUnOKU
gOKUgCBtZXRhLW15LWxheWVyDQo+IOKUnOKUgOKUgCBtZXRhLW9wZW5lbWJlZGRlZA0KPiDilILC
oMKgIOKUnOKUgOKUgCBtZXRhLW5ldHdvcmtpbmcNCj4g4pSCwqDCoCDilJTilIDilIAgbWV0YS1v
ZQ0KPiDilJTilIDilIAgcG9reQ0KPiDCoMKgwqAg4pSU4pSA4pSAIG1ldGENCj4gDQo+IFdpdGhv
dXQgdGhpcyBwYXRjaCB0aGUgL3JlcG8vbWV0YS1teS1sYXllciBsYXllciBicm9rZSB0aGUgYnVp
bGQ6DQo+ID4gPiBUaGlzIHBhdGNoIHJlc29sdmVzIGlzc3VlcyBsaWtlDQo+ID4gPiDCoCBFUlJP
UjogbXktaW1hZ2UtMS4wLXIwIGRvX3BvcHVsYXRlX3Nka19leHQ6IEZhaWxlZCB0byBnZW5lcmF0
ZQ0KPiA+ID4gZmlsdGVyZWQgdGFzayBsaXN0IGZvciBleHRlbnNpYmxlIFNESzoNCj4gPiA+IA0K
PiA+ID4gwqAgIyMjIFNoZWxsIGVudmlyb25tZW50IHNldCB1cCBmb3IgYnVpbGRzLiAjIyMNCj4g
PiA+IMKgIFsuLi5dDQo+ID4gPiANCj4gPiA+IMKgIEVSUk9SOiBiaXRiYWtlIGZhaWxlZDoNCj4g
PiA+IMKgIEVSUk9SOiBUaGUgZm9sbG93aW5nIGxheWVyIGRpcmVjdG9yaWVzIGRvIG5vdCBleGlz
dDoNCj4gPiA+IMKgIEVSUk9SOsKgwqDCoCAvYnVpbGQvdG1wL3dvcmsvbXktYm9hcmQtbGludXgv
bXktaW1hZ2UvMS4wLXIwL3Nkay0NCj4gPiA+IGV4dC9pbWFnZS90bXAtcmVuYW1lZC1zZGsvbGF5
ZXJzLy4uLy4uLy4uL3JlcG8vbGF5ZXJzL21ldGEtbXktbGF5ZXINCj4gPiA+IMKgIEVSUk9SOiBQ
bGVhc2UgY2hlY2sgQkJMQVlFUlMgaW4gL2J1aWxkL3RtcC93b3JrL215LWJvYXJkLQ0KPiA+ID4g
bGludXgvbXktDQo+ID4gPiBpbWFnZS8xLjAtcjAvc2RrLWV4dC9pbWFnZS90bXAtcmVuYW1lZC1z
ZGsvY29uZi9iYmxheWVycy5jb25mDQo+ID4gPiDCoCBFUlJPUjogTG9nZmlsZSBvZiBmYWlsdXJl
IHN0b3JlZCBpbjogL2J1aWxkL3RtcC93b3JrL215LWJvYXJkLQ0KPiA+ID4gbGludXgvbXktaW1h
Z2UvMS4wLXIwL3RlbXAvbG9nLmRvX3BvcHVsYXRlX3Nka19leHQuNjg4NDQNCj4gPiA+IA0KPiAN
Cj4gV2l0aG91dCBtZXRhLW15LWxheWVyIHRoaXMgcGF0Y2ggc2hvdWxkIG5vdCBjYXVzZSBhbnkg
Y2hhbmdlLg0KPiANCj4gVGhlIGFsdGVybmF0aXZlDQo+ID4gPiBBbHRlcm5hdGl2ZSB0byB0aGlz
IHBhdGNoOg0KPiA+ID4gRGVsZXRlIHRoZSB3aG9sZSBlbHNlIC8gZWxzZWlmIGJsb2NrLiBUaGlz
IHdvdWxkIGxlYWQgdG8gYSBsYXllcg0KPiA+ID4gc3RydWN0dXJlIGluDQo+ID4gPiB0aGUgZVNE
SyBsaWtlDQo+ID4gPiDCoCBsYXllcnMvcG9reS9tZXRhDQo+ID4gPiDCoCBsYXllcnMvbWV0YS1u
ZXR3b3JraW5nDQo+ID4gPiDCoCBsYXllcnMvbWV0YS1vZQ0KPiA+ID4gdGh1cyBmbGF0dGVuaW5n
IHRoZSBsYXllciB0cmVlLg0KPiB3b3VsZCByZW1vdmUgdGhlIHNwZWNpYWwgY2FzaW5nIGluIHRo
ZSBpbXBsZW1lbnRhdGlvbiAoZXhjZXB0IGZvcg0KPiBDT1JFQkFTRQ0KPiBzdWJsYXllcnMpLCB0
aHVzIHJlc3VsdGluZyBpbiB0aGUgZm9sbG93aW5nIGxheWVyIHN0cnVjdHVyZSBpbiB0aGUNCj4g
ZVNES3MgbGF5ZXJzDQo+IGRpcmVjdG9yeToNCj4gDQo+IC4NCj4g4pSc4pSA4pSAIG1ldGEtbXkt
bGF5ZXINCj4g4pSc4pSA4pSAIG1ldGEtbmV0d29ya2luZw0KPiDilJzilIDilIAgbWV0YS1vZQ0K
PiDilJTilIDilIAgcG9reQ0KPiDCoMKgwqAg4pSU4pSA4pSAIG1ldGENCj4gDQo+IC0tDQo+IFNp
bmNlcmVseQ0KPiBEYW5pZWwgV2FnZW5rbmVjaHQNCj4gDQoNCg==


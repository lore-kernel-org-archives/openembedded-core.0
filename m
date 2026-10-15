Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FE7CC6B30
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 10:46:48 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36577.1792061204636071559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 03:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=HtmyMRp5;
 spf=pass (domain: ericsson.com, ip: 52.101.83.71, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKrdUDVgH+W1xhBN1fnMXCg5pOFxcthApDMeM0OEc1pFsc3I94IohirEJzhMm1irytkmIi2mco5r9Ci43/vmCp8B/lSJ+QFkUvkdo/KBQf52cbrgCle4wdIJNNe1/5xIFnElvCBG/wscd6J02TW8IK/HBRO2iL5LWLQiYBxvAHQOPXfT1Oxoej9VI90V574L5uDi8DJWhcauRkeDQSj7f0nEEx4PHUzhF3yFzg34q4ZLuqT0g9mKY9n6wh6rHU7Nm2XJLLLt9lEMHw+gQ02ZKPzVn+MBxiSOvDECS/w79iHG8kE5UTIsGoC1UE/4k54do/NW4N+mXeN2Whp4WxZ1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gu5mDxK95yU6+oa1CW8xkRwyxA4GWN+RpTfgwbqf39E=;
 b=jMd4gudlG+y3vAGnNNTOyX7tgcvJAnyqumn5e0SJWpPRh8HFpimyAulpAp55da0KiVqA0Y2V5KVSacs3W6hYlmllZa1TLwoAPCLKhRrkl/i1Q8ESggQT1yHRL9UXz+CPbwpVlrzD9TQDDVNIShQnRA6nhXpnPtJqb2JePG2iF0RX9caYIx8+VCI12aR9fC+cUdRlTcmRsOOxc4d409GZ7VtC9m4a47jQGli5saLqsb4BHdsw+i+5X/qEB3IJZseRDndSoYg4Yp76OtFxghkaHN0x86h1D20nu3l553KCbxVi5PuvS4v+R/tvHub8MKT07nMFRKLUdzF7BY6/ubnLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gu5mDxK95yU6+oa1CW8xkRwyxA4GWN+RpTfgwbqf39E=;
 b=HtmyMRp55HFldXHxySs4pG4uRLdnsg63XeI3FICtxPJ10NNEaz9BaFLODRnFp+zzPcVps7oUTswrrV0zMdaIzXC9xyeJ0KLrjL39OmGaTlSTKz2Day6+L76fD7h3tyBiS8mOzese+DLELecPkAYHTGwIJvk1fNAU4ViIpa4AdNIx/UA/TicBrH30o7SolSXb7R+5SO/qI0ypnj7R+0h2Td4/RlrDGS0HkcbCioyL4WGisC5s2+RAY9JqiAWz86HuwUIe08t+US8FGUUQNcuU0QYc4rsbkVfKktEsmRgovVnVQ3Rgk9uvH85XNyb53jEy6BXGgxwQnjUKj79GFTQ8wQ==
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com (2603:10a6:20b:140::11)
 by VI2PR07MB10260.eurprd07.prod.outlook.com (2603:10a6:800:296::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 10:46:39 +0000
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0]) by AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0%5]) with mapi id 15.21.0496.019; Thu, 15 Oct 2026
 10:46:39 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 1/3] classes/base: exclude
 __CACHED_SOURCE_DATE_EPOCH from task hash
Thread-Topic: [OE-core] [PATCH v5 1/3] classes/base: exclude
 __CACHED_SOURCE_DATE_EPOCH from task hash
Thread-Index: AQHdWkBeP3LmgTqEiUOLQ7foK4t5k7b+Z+wAgAAIfAA=
Date: Thu, 15 Oct 2026 10:46:39 +0000
Message-ID: <c94c04e26107cd68c66e7f5678dad7f176307678.camel@ericsson.com>
References: <20261012115319.1704048-1-daniel.turull@ericsson.com>
	 <20261012115319.1704048-2-daniel.turull@ericsson.com>
	 <f864589a2efc32e1b80429eb59016badac9ba25b.camel@linuxfoundation.org>
In-Reply-To: 
 <f864589a2efc32e1b80429eb59016badac9ba25b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR07MB6437:EE_|VI2PR07MB10260:EE_
x-ms-office365-filtering-correlation-id: efdbc76f-386e-4942-6c32-08df2aa997ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|10067099003|18002099003|11063799006|4143699003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: 
 44+eWmJei10Lu2cHGDEhtm0SqIKH99+ySJxnLJYuik9uGgF+0ptGey7DikeaeaNw5MOTRqZGJprCuGHQM9J7wrugjZTWUfbdMGOkT0GyCyd2FHg/+Mfp3LNcuMIOIG19fx1RzbjO+BxD4YVHIW2B8Mre472vz4HPn876CbD3qGwGF9pM4CvMCPES8M/gYREULz5EkQ4cKaSKLuhh9pR8JP+/LkctsgvAVWSZswzm2Evids1S4zRHNuQkAGaDTAGZlRGIn2oKwezG+sDiVhZa+kWQB1nTp9tVsyKZERa/sLabFMVpQNg9WCzdNsMu7b4WfGfU6nO2K2BDaspGUyhLtGKxjDGNuPQO5PETzq/5YZFCeeyJtsNNPD6LjwKxxqLtGAbqjTCz/JfwCKI4RMnH6S+3jE/52GHnKXzva6uxgS/g4wI1qmRL4xhCNYSzx7yv0x/dUY+wk1NClgxh3sv4gHBpQdfXZhaVua5vgSGEzatjENZAloNj2434OX2/4uZqM/3ipqG3gjU5mkaXXAn+BNbtDNQ9TkFtKPok7Pen+9b638wXLGMAA80b7Ok9PXny5Hu2/12pCCreyxte60ZDz8cQRGRdIyMs7lQ1gJ2luFNcWB92yJu7SCHfkWluBa0Bgj37uNE3xneU6RI1VhxKePUKKU92zKuOvivVWzLTKThddV5iJpVeCLR9VIHUGMs17JbpIuvMYSOENG9slk9f/5T4M0uuyj8mPc0eX0E2rKc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6437.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(10067099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y1BPTnFKOEErRTNPTXdKVnpjUHo3ZkhGUktBdjVORUtaa3doNlovclJ2RUR1?=
 =?utf-8?B?M3VqSktLb2xmQzgxTmdxYzVpK1pvUlhZWEtWMUxSdm1seDQyWno4WGtEYlJQ?=
 =?utf-8?B?S1hNdFdNbk1sbGdkTHAxUno5b280WDFPM2VHLy9hUWo5L0xjMGx1UkVSMDBI?=
 =?utf-8?B?Ujh0ZkJWZU5XK0dPYWpqKzhQcDNKcEIzNHRwSFZXazBZOS9ZajdzNm93T1I3?=
 =?utf-8?B?WUlqZUljM3B2T3FPSUltdkEvaXdDQ1RIRTNUZVYyS0x4b29EeVV5MWliOVdE?=
 =?utf-8?B?aU1xTlVybTIvK05lOGJ1c0tDeHIzMlFyNlo3cGxRVExITGczcXU5VUFJZkRo?=
 =?utf-8?B?eTZoNGZLU1ZBQnRWL1FuQWYycmp6dUVHcEJqYTRORi96UURsOEwzZXNXMUZS?=
 =?utf-8?B?SkdPVGZXUTBXU2M4aDUxQXJ4WWw1K3dPVzFyZE0xVkNuRVZqYWNZd0hubkh4?=
 =?utf-8?B?Y2VKcEFJcnhndStraS9SbzVBcVhwQklCSlo4cGRFOGdCcE9CTEl4UkFqazE5?=
 =?utf-8?B?L2JqbFRvUjFqdnVEMURuOE1UNDVldnhsL1FFSWVnVmd5VnhRZjZlZHVFam5Z?=
 =?utf-8?B?L2x4U1lIR0JFdU1QUktFckhFWG1SZ1hjT0lDWVFYbzZmMXRIZGRVNGoycjMy?=
 =?utf-8?B?SVgvdW5seEpWM2lmYXM2UUN2UjBFZ040Wk12RUdwYUtYdVAxdjQ5UzI1cXk1?=
 =?utf-8?B?cGl1MzM3N3hPQmNuMkFzcXlocFhvVlZ1dUJodzI2U25BTEowQ3dBTTBXU0FO?=
 =?utf-8?B?ZjFZalA3bThvVnNRZ2txY3pqMzZFTTJ6cnp5Z1RZSDJWZ0YxY3p4Y2lzNFRV?=
 =?utf-8?B?Q3EwNUNNQ1pYdEh4ODlGKzJnZEVpL0VWaEdYRHhKcGI1ZTA0YVpGTW83VytO?=
 =?utf-8?B?UlN1Y2o0b3RLQUVleW92TTR1Zm5NRkVQY0JwNHkwTUNveXpTWXNhN3FrL1dN?=
 =?utf-8?B?RFJhZlRkT1F4aGlHWlc3ZVcweWlkekJrY3c5YnRFK1BtNGFFNnJxUElPbXlQ?=
 =?utf-8?B?YjV0VTVGdG1RSVdzV3h4WFN3MnJxclkya2NwY0NKS056eVh0S0FjajlRbHJK?=
 =?utf-8?B?TEVzN2ZpNFkxbEQzaUJKUENHcVYyTkk2UklnK050NkpqRXBpUWFtdDBVZnJ6?=
 =?utf-8?B?RGcyb1RTRFpFODBQKzhOREVYazlNeWN6Uk5oUjNCajNKQzNka1FuS2IxS1hG?=
 =?utf-8?B?bjl0YWIwUnozZmJ0MjhrSFFWalR3bjFhd1BhUUQzQ1RGcG9rY3JRdUdnaU1y?=
 =?utf-8?B?L3hobzFlMXJzdzY1YjZkUHNEdDdkclZmYW0zZ1pwTTRIM2NVNW5oOWg1bmhZ?=
 =?utf-8?B?eGg4QzBGTlN4QittS3R1WXNnK3RRc0liWDU1emlJVnBHa3Jxc1dRN1FoK3JB?=
 =?utf-8?B?ZkZSSTkwbnRteGVvWnNiN0s1WnU1VVdCRDlDcWJqVGgvRldzd3RBeHhPV1o1?=
 =?utf-8?B?RlZmYmNMWWFGZmVkMXd2ekFvMXRvbDFoeWxUMVA4LzF5YWk1VjdVNHJtams1?=
 =?utf-8?B?SHJ2OXhkbUt0bHhFNTJkeTRzSEN3YWVZR25QTStDSUthVXJ1cm4wUFBQRHU2?=
 =?utf-8?B?RjBlTlM2VVJPL01sUFI1c3prdXExUVpMb01mQUQvZVYzeXlwZlVCem1teWRI?=
 =?utf-8?B?ZDE3cjZsQkloTHcyV0s1Wk8wOXlUWlhJK1J3VGM3eVhLU0UrMEZyK2h0UXYw?=
 =?utf-8?B?dU9iS2w5ZzdJTjh1SXFUbUM0cXVic2ltOHNKb2RxWHl5SGdPYk5jQjUxNkpY?=
 =?utf-8?B?eFdpTHpodzVSUU9pT0lxNTBQanZ6MnExcnNZN0lNTGNkRlN6VWtScVVTR2Vm?=
 =?utf-8?B?eUp5NU94c0RobTQ3RUpSWEh6b2diOW94blpERzlEK0k1YmJsbUpBZzBoaEJn?=
 =?utf-8?B?UitUWkFFNS9NY0cxcWlmZHpyNGVwUmZxTFRKS1ZJVDRPUTVUS2ZiSTM4WFJX?=
 =?utf-8?B?bXpWa0pja0p0Y1RKZmNVZVlueXRzUC8vdnIvU29sWmZwVFZRZWpMRW5JUVU1?=
 =?utf-8?B?bTd1Ly8xczJCNzlHOFJCTVNLeE9pTG9tclB2a0FOSXBGekduZk9lUXBEREFE?=
 =?utf-8?B?MmpSZlpqUGQ0SGp6VHQ4ZGllNEluUlI3dXRuWFk3bW9tVFFWMjAzYlZseFgv?=
 =?utf-8?B?dFRKT2x4UDZ5dWFST0ZIWVh5eS9PM2sxZDFkSDBrSzFYNVVZVG04V0pOYk9O?=
 =?utf-8?B?MDZiYTBqWWJZemI0bnZJZ3NuVEdNOXZBQmg4NjcySE5ZQ0JtcUFjemZocnRO?=
 =?utf-8?B?UDFQUy90bUtOWVU0MEtFazlORUsyVUpWV1J4Q1BsZGVvUG5NL2J4cWNKaDBR?=
 =?utf-8?B?b0hjcnJKTisvUmErcE5TUjVLdkdOOWpzWnFoL3NsZU1pMzZTUm9lSVIvU3RT?=
 =?utf-8?Q?wJgeps9jbyztCvCc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0C728544B9A5748B08009723B49D380@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6437.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efdbc76f-386e-4942-6c32-08df2aa997ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 10:46:39.3056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1CePplrNlIsL3eudE3vZbdPUWz9++cK2JAc5h0d2U4SSRq//e9YEya6xtlZ78kiuR54tC7wyjRUJIanbuAVLLuXA9Q6DYZU67xhEgB+igI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR07MB10260
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 10:46:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247873

T24gVGh1LCAyMDI2LTEwLTE1IGF0IDExOjE2ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gTW9uLCAyMDI2LTEwLTEyIGF0IDEzOjUzICswMjAwLCBEYW5pZWwgVHVydWxsIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEZyb206IERhbmllbCBUdXJ1bGwgPGRh
bmllbC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiA+IA0KPiA+IGVwb2NoZmlsZV9yZWFkKCkgbWVt
b2l6ZXMgaXRzIHJlc3VsdCBpbnRvIF9fQ0FDSEVEX1NPVVJDRV9EQVRFX0VQT0NIDQo+ID4gdmlh
IGQuc2V0VmFyKCksIHNvIGl0cyBydW50aW1lIHZhbHVlIGxlYWtzIGludG8gdGhlIGJhc2VoYXNo
IG9mIGFueQ0KPiA+IHRhc2sgdGhhdCBjYWxscyBpdCwgY2F1c2luZyBhICJtZXRhZGF0YSBpcyBu
b3QgZGV0ZXJtaW5pc3RpYyIgZXJyb3INCj4gPiBvbmNlIFNERV9GSUxFIGlzIHBvcHVsYXRlZC4N
Cj4gPiANCj4gPiBFeGNsdWRlIGl0LCBzaW5jZSBpdCBpcyBub3QgbWVhbmluZ2Z1bCBidWlsZCBt
ZXRhZGF0YS4NCj4gPiANCj4gPiBBSS1HZW5lcmF0ZWQ6IFVzZXMgS2lybyB3aXRoIENsYXVkZSBT
b25uZXQgNQ0KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxA
ZXJpY3Nzb24uY29tPg0KPiA+IC0tLQ0KPiA+IFRoaXMgc2hvdWxkIGZpeCB0aGUgc2VsZnRlc3Qg
ZXJyb3JzIHJlcG9ydGVkIGJ5IE1hdGhpZXUNCj4gPiAtLS0NCj4gPiDCoG1ldGEvY2xhc3Nlcy1n
bG9iYWwvYmFzZS5iYmNsYXNzIHwgNCArKysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1nbG9iYWwvYmFz
ZS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzLWdsb2JhbC9iYXNlLmJiY2xhc3MNCj4gPiBpbmRleCA5
NTUzZjAwNDMyLi4wMWEwMzAzOTllIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy1nbG9i
YWwvYmFzZS5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzLWdsb2JhbC9iYXNlLmJiY2xh
c3MNCj4gPiBAQCAtMjQ5LDYgKzI0OSwxMCBAQCBkb191bnBhY2tbcG9zdGZ1bmNzXSArPSAiY3Jl
YXRlX3NvdXJjZV9kYXRlX2Vwb2NoX3N0YW1wIg0KPiA+IMKgZGVmIGdldF9zb3VyY2VfZGF0ZV9l
cG9jaF92YWx1ZShkKToNCj4gPiDCoMKgwqDCoCByZXR1cm4gb2UucmVwcm9kdWNpYmxlLmVwb2No
ZmlsZV9yZWFkKGQuZ2V0VmFyKCdTREVfRklMRScpLCBkKQ0KPiA+IMKgDQo+ID4gKyMgZXBvY2hm
aWxlX3JlYWQoKSBtZW1vaXplcyBpbnRvIHRoaXMgdmFyaWFibGUgdmlhIGQuc2V0VmFyKCksIHNv
IGl0cw0KPiA+ICsjIHJ1bnRpbWUgdmFsdWUgbXVzdCBub3QgbGVhayBpbnRvIGFueSB0YXNrJ3Mg
aGFzaC4NCj4gPiArb2UucmVwcm9kdWNpYmxlLmVwb2NoZmlsZV9yZWFkW3ZhcmRlcHNleGNsdWRl
XSA9ICJfX0NBQ0hFRF9TT1VSQ0VfREFURV9FUE9DSCINCj4gPiArDQo+ID4gwqBkZWYgZ2V0X2xh
eWVyc19icmFuY2hfcmV2KGQpOg0KPiA+IMKgwqDCoMKgIHJldmlzaW9ucyA9IG9lLmJ1aWxkY2Zn
LmdldF9sYXllcl9yZXZpc2lvbnMoZCkNCj4gPiDCoMKgwqDCoCBsYXllcnNfYnJhbmNoX3JldiA9
IFsiJS0yMHMgPSBcIiVzOiVzXCIiICUgKHJbMV0sIHJbMl0sIHJbM10pIGZvciByIGluIHJldmlz
aW9uc10NCj4gDQo+IFRoaXMgaXMgdGhlIG9sZCBzeW50YXggYW5kIGlzIGxlc3MgbWFpbnRhaW5h
YmxlLiBJdCBjYW4gYmUgZG9uZQ0KPiBhbG9uZ3NpZGUgdGhlIGFjdHVhbCBmdW5jdGlvbiBub3cs
IGZvciBleGFtcGxlOg0KPiANCj4gbWV0YS9saWIvb2UvcGFja2FnZWRhdGEucHk6QGJiLnBhcnNl
LnZhcmRlcHNleGNsdWRlKCJCQl9OVU1CRVJfVEhSRUFEUyIpDQo+IA0KPiBDb3VsZCB5b3UgdHdl
YWsgYW5kIHJlc2VuZCBwbGVhc2U/DQoNClN1cmUuIEknbGwgc2VuZCBhIHY2IG9uIHRoZSBzZXJp
ZXMuIEJlc2lkZSB0aGlzLCBpcyB0aGUgYXV0b2J1aWxkZXIgdGVzdA0KcGFzc2luZz8NCj4gDQoN
CkNoZWVycywNCkRhbmllbA0KDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0K


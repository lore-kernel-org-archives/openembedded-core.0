Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D69C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 11:57:51 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web11.39950.1707911866493154762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 03:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=pb/GfUOE;
 spf=pass (domain: siemens.com, ip: 40.107.8.40, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kkcf5D6cjaZqzu+xrdtwZzrnzn38GasoamNAO0zPLmxC7JR4sNmPpUwv5oILWZXtnR6pg8Rv/EsIkKOjTtn2Q0ufDaIDOBN98a5R9ID/Jo0xp0ScsY/kMPWmy431g3rKmfU6OhWZTLZUKpiGoSU7Z8YBOf9iAc/5hZzevWIAhOh7g8/U/QUN4I/gAsCwQxzmp6ghwPkajuZiKsZR6Zklt5hfdYPYShjEypXZGesP3krNkCOWQp/KNcknB/lNfimCwTyIdZcrkTNjepSBciDwc632epOWX+8Ifm44Vn9EdgQwv1Wdzv2LrM83vS4jUxvbqmyk/ZyBqI+MslFUyHN96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gmgoKR0KxQvQGkev4ent9TqdihzwNoL3/NyEbw2e1Q=;
 b=CmWHtWxnyqrZK1ZN9WNC2f4i3Cce+6TctCkPWuukZgTtax7KNNtlvakLrIo1S/SLEoAHhyRIHuILlZdfixfxV6ImdILthMCeWTmuWfK6h1Mv85E3deFfqObOZy/eOsSnv1TNKU7ap7cr2MnF6HYCzYPaC0YHMfsAxYu8NBVhbiaR3fU+eCsUfITj3QiO5qRkCFREnX/ghBi5bSUDYvzEeKow4CVQy4v8NepyZKPMEqo6+krdCBoiGgYaizuo7mmExfW5yGgfMgFx+TIZWkcxwCXcI+kW3xYClC6l55JZ0ZbxMVj0kPbYs5XgKKQAY4mB3Td1Wnr4A0I0h+1anPrIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gmgoKR0KxQvQGkev4ent9TqdihzwNoL3/NyEbw2e1Q=;
 b=pb/GfUOEda5ZiJA76tnedneLZiCzteGuT7sJd6Pj0KkTW02BUg8YVaNS98Zj6dAjHLg9lVQ991+SQAw/SbufYmfyj7TFlzocE8Y44LHGQawP/Bs00Wh0HN6TJWzLHdjvzdSVEa4gDEDq1JzRWbjoAUoBnMbDRvmb8EL0lWmSE70eFATdYJxZAZfqhf+gP0CvyZ7Zj2oCFOk7mwkBKHWPkhiBmWzGor93Kp31o22q7ryvuPMLlm/VbDQkJTBrFtxMrL8oG5DuoCOgXRGNafx7Km8jmYc4hWTNZ+Sx1ydXAYqiSb4GUumsLciqFeJPDKwmmjLg2mg/A2s0CRuEY5jHZg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PR3PR10MB3804.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 11:57:43 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::89d3:24a6:587e:51f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::89d3:24a6:587e:51f%4]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 11:57:43 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jamin_lin@aspeedtech.com"
	<jamin_lin@aspeedtech.com>
Subject: Re: [OE-core] [PATCH] uboot-sign: support to load optee-os and TFA
 images
Thread-Topic: [OE-core] [PATCH] uboot-sign: support to load optee-os and TFA
 images
Thread-Index: AQHaSD6d4zRiFb9ZQkqtV4y7H/Si3rDcEewAgC3VyYA=
Date: Wed, 14 Feb 2024 11:57:43 +0000
Message-ID: <dff1bbe651fa6733fb6034c9505aa200e7377df8.camel@siemens.com>
References: <20240115075416.393025-1-jamin_lin@aspeedtech.com>
	 <8f804eb9fff6b055a4d53198fa4553242e1204af.camel@siemens.com>
In-Reply-To: <8f804eb9fff6b055a4d53198fa4553242e1204af.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PR3PR10MB3804:EE_
x-ms-office365-filtering-correlation-id: e1a806a3-8051-4b3f-3235-08dc2d5426cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cyhkrzFBAgOSPOgxmpqBIT/QkkU4EFMWUrK/oZpxSq2yqh1C9TWgR+EjTE+1eBFbbypzfkt+lC6I9Ik3HnmGIo3r+krf5HI75nJJW4nZ98d9MWPuhYaFsY7XljkzGOBhZDRtTEsr1XYbYuHjxdBm2Di1n0Br4B9yL2GONW+zWbUghBICQG4UCZ3D0Pinv0aNaoAUQV56iwHF7q4fFKRxEwAzsEflBijDux3tB3CM07IMLvf55i6S9Fyt5Tbxg6Hmvp2AB7pQY/9sho6vhcq2/qQ3nE1Z4/amvQJgfeOWeZd6Nti7UptjvB1Uz4qCp0tTjxCFG3y9b6cQ88Mj4AoAGApevj2YoIqVELowCN8pGuXAomRHhwSKODmNAtIruGFI1/OYX1EVNZ0+BBT6ibMGepA7WD7ZR/kb0kV94PxWBFyiYWPjShjgTxqJ86jHiVSznKBX9EL50oBGc71FFmF0478IJV1Ln44SwVDGgESLKecbGip7GBWS0aE9NL3RMYuyr0/Iow7gV6UgTLiWCWtSBUtW94HTcf+1mFkkkm0Q1CN26GPoL96qJN0e9rl4wjyYUO1KQtqE4FVP7BrxnLjiqkZiG6Q37Db+T57yvAT36Y0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(316002)(66476007)(66446008)(76116006)(110136005)(66946007)(64756008)(41300700001)(66556008)(8936002)(2906002)(5660300002)(8676002)(2616005)(36756003)(86362001)(71200400001)(6506007)(38070700009)(6486002)(6512007)(966005)(15974865002)(83380400001)(82960400001)(478600001)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?STJYYVdDVi9IcDliUDl0MzU1NnhVbVVvTENnTVRVNWhtSjh4M3VkSDdsZXZW?=
 =?utf-8?B?QU94bklXZjB5Wk5rRGV0QytaSlN4bkxqS0ZOVWMwNi9nVTlxRS80UHZhMjE5?=
 =?utf-8?B?c1A4ZEdZSzB0VjBwYnVsa0FXVS9BWWxWYlBxNENNdjNtc1hwZmNuVGF3Ujh5?=
 =?utf-8?B?N2hnOFZwOVVSbnVOd0pIdWRyeGYrNTczVXA5MGFBYjRUbkcrOXlMbVM1VWhI?=
 =?utf-8?B?QTN0bFQ1RkRVTnVTamhmOHgrNEdKM1pieURHN0JleTdlWTRnd3E4UExVTGsx?=
 =?utf-8?B?M0d5d0FoKzB6U2tZN3hPMzNSaWZPSGQwd1BhRS9WQVlpV280SFo0aXpFTmg4?=
 =?utf-8?B?bisyZWsydDF2L2tkQm1EcXRDbW9zWVBJR2NKd000K3hDRkQ4dm5GTU5DVFBm?=
 =?utf-8?B?YnY2SkNaQzNNQ2ZNVjRmT241UFM1dHAvYWozbUdpMnBLaGZEY2FMK0NKNkl1?=
 =?utf-8?B?b2pIWW1nODhweG1tOXlYSWpodndzNzdDajdYcDVpOXVOWm5wVVpFS0IxcURI?=
 =?utf-8?B?WktLeWpObTQ0NUs1L0xadEMxUWUwdFdUbm55UUVObjd6Tno4ejVvUGt6dlJt?=
 =?utf-8?B?NlF5Qmc2ZG94T3EzeGk1cWJpc2MzZEM4THpzZUhoOTQ1MnVKLzJqSDRtRUZm?=
 =?utf-8?B?YnVEaHQ2UzFxZkt4T1VvMHhSTTNFRUEzTDB0RUdaWkVGSFlkb0pCOXZEZTVs?=
 =?utf-8?B?aHJiaW1wcjBrQW1RSHRkcHQ5ckQxSml1Z1kzeHVzTGl6d3FsZjNaT1NwSkJ1?=
 =?utf-8?B?c2htNjZIbTAxVjBBYWZXRThiWWtRWGdmRStKVTVhYTVCc3JPcEZCb01IQ1JH?=
 =?utf-8?B?ZnY1ay9RTGloUkFJZkJpWXVKNnRuTUdETk0xL1R3TjR1UkRhNTRjTERBaHIr?=
 =?utf-8?B?bnlkcmd1UVk4UkZDYm1DbFRnZnJVZjNib1ZydXRMYjhUN1BlWE11V0lDL3k5?=
 =?utf-8?B?V2hHQm00ai9Nc1JZV1gyTldZcFFKRi9hR2Jjd0NHYTBkeHBsek04eWIrTUJG?=
 =?utf-8?B?azlDQmRwalR3Y0ZLck1IeVlwWDB5NSs4MHhMK0cvclJnbUJ1QjM1cFRvMEI4?=
 =?utf-8?B?VE83ZUZFcUhkNnBFa3kxVEhoekJvMEJjNFUvU2l1eDJ2YmQrM3JpbUxEMTk5?=
 =?utf-8?B?VmpWT0ZyalhrcFM5N2JPR0UrM1JuZHNzT1lhNzBTek9JOEtkQU8ydWtHeFFG?=
 =?utf-8?B?ZzY4a1QrYnNDeHllYUJtN0N4RDZndnB0ZFFLZzlWVFhscWVEYVl4RCtPZHdL?=
 =?utf-8?B?SjEzV0taODU0VG5YVjJrVWY1cEh6emJQcUFzV3V6ODVDNjA0bWpDQ2s4ZnVB?=
 =?utf-8?B?QWtFMU9kRGZvTkJ0bGV3Z21EQUhleisvSlhyWTl0NkFoc1NueE9EcjB5Tmpq?=
 =?utf-8?B?OTUwL081czJ1MmNqdzNRam8rclRDWDhLSjR4NGtPRXVLdDdKazdoRkhLeHhR?=
 =?utf-8?B?dXZZaDFQMXNMRHFjOHVYb2ljdmlpNFpOZ3BFbVpJTThlUWQ4QXRBQ0lwWmRo?=
 =?utf-8?B?ZGFDZkNjSjN0YmsxOGVqWVg2UHdZKzJoT1lraTRFZFJFM1VwYkJYdHJzbUxa?=
 =?utf-8?B?MGtzRU1zOFlrWGw4NWxtTjBwOVdxS3RNSk85dzVybUlWUzlZL1JWay9jOHFS?=
 =?utf-8?B?UkVwQ2JpV0IxUmNWL0VGOEhIWUp2a2poYStsZDBuNVY1WTR4eWhBWVJVL0pX?=
 =?utf-8?B?cmRZd3lqamZnVVVpM2xLc1dSRjdSVnhmaVNSZFBGbEgya0xRQmZRSWY5ZXgx?=
 =?utf-8?B?MFgzNHJZV1R3MjVTK2xSVDF0N3pZS1JySi9HeVpPZzJLbEs2aGZRTHF1WVIr?=
 =?utf-8?B?MHdQdjBxc0IyWFU3RlpYQnVNbm0yQXpkVEZocUUvWjFGVVViS09UN1loQ00x?=
 =?utf-8?B?SnpIREo4LzgzdUp0VGJyQlQ2WlhCSktPUTFIM2lFUWYvVHlCNlRua2R4QkU3?=
 =?utf-8?B?STI1SzJUdU96cmpvWko5WU5zc0E0WDVRWWVuMElQUDJWaFUyZDNMMW50bGUr?=
 =?utf-8?B?YlZZR0xPalA0TE5qdDZKY0I5RGFKN2Q5VEQzMDZVK0JWYlZHM0hxeE1EUkpF?=
 =?utf-8?B?bzRjYUJnNitWK1pRd1YxOG5wenN0VWQ0VVhkb0JwekdRTUJEcUlKMk8zVzN2?=
 =?utf-8?B?NVFLb0Q2cEkxOVlEdWxONUdIM3NMamlMMFFaRlhhMDlmV0o4UXFuOGZuOVVZ?=
 =?utf-8?B?TXlRQkxyNVlSdW5hS0E5VDFmN3k5VzZ5Zlg3b2psWVFrSHRtbDdjV3grS0Zn?=
 =?utf-8?Q?Tc6oRqlp/TBROIrHkE1o3YemF6UsJK2X0YkVUAZv7w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <170BA4A0D90E8248AD0B2DEC9B7ED9F4@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a806a3-8051-4b3f-3235-08dc2d5426cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 11:57:43.0981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NCpu5whZxhSicMd6IhVGwDT4SEHObt68qXYYrRkMn9RxXgWxYHD/ZYbKsX0SePOzMeMIjOjxEOaPYZO4ezP0PAwwK9JgakKcK2QRzhDHrx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3804
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 11:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195472

SGVsbG8gSmFtaW4sDQoNCk9uIFR1ZSwgMjAyNC0wMS0xNiBhdCAwODo1NCArMDEwMCwgQWxleGFu
ZGVyIFN2ZXJkbGluIHdyb3RlOg0KPiBPbiBNb24sIDIwMjQtMDEtMTUgYXQgMTU6NTQgKzA4MDAs
IEphbWluIExpbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBDdXJyZW50
bHksIHUtYm9vdCBGSVQgaW1hZ2Ugb25seSBzdXBwb3J0IHRvIGxvYWQgdS1ib290IGltYWdlLg0K
PiA+IFRvIHN1cHBvcnQgb3B0ZWUtb3MgYW5kIHRydXN0ZWQtZmlybXdhcmUtYSwgdXBkYXRlIElU
UyBmaWxlIGdlbmVyYXRpb24NCj4gPiBzY3JpcHRzLCBzbyB1c2VycyBhcmUgYWJsZSB0byB1c2Ug
dS1ib290IEZJVCBpbWFnZSB0byBsb2FkDQo+ID4gdS1ib290LCBvcHRlZS1vcyBhbmQgdHJldXN0
cmVkLWZpcm13YXJlLWEgaW1hZ2VzDQo+ID4gDQo+ID4gQWRkIGEgdmFyaWFibGUgIlVCT09UX0ZJ
VF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9BIiB0bw0KPiA+IGVuYWJsZSB0cnVzdGVkLWZpcm13YXJl
LWEgaW1hZ2UgYW5kIGl0IGlzIGRpc2FibGUgYnkgZGVmYXVsdC4NCj4gPiANCj4gPiBBZGQgYSB2
YXJpYWJsZSAiVUJPT1RfRklUX09QVEVFX09TIiB0byBlbmFibGUgb3B0ZWUtb3MgaW1hZ2UNCj4g
PiBhbmQgaXQgaXMgZGlzYWJsZSBieSBkZWZhdWx0Lg0KPiANCj4gSGF2ZSB5b3UgY29uc2lkZXJl
ZCBsZXZlcmFnaW5nIHRoZSBleGlzdGluZyBiaW5tYW4gaW5mcmFzdHJ1Y3R1cmUgaW4gdGhlIHJl
Y2VudA0KPiBVLUJvb3QgZm9yIFRGLUEgYW5kIE9QVEVFPw0KDQpCVFcsIHRoZXJlIGhhcyBiZWVu
IGEgcmVjZW50IEZPU0RFTSB0YWxrIG9uDQoiU3RhbmRhcmRpemluZyB0aGUgZ2VuZXJhdGlvbiBh
bmQgc2lnbmluZyBvZiBib290IGltYWdlcyI6DQoNCmh0dHBzOi8vZm9zZGVtLm9yZy8yMDI0L3Nj
aGVkdWxlL2V2ZW50L2Zvc2RlbS0yMDI0LTMwNjctc3RhbmRhcmRpemluZy10aGUtZ2VuZXJhdGlv
bi1hbmQtc2lnbmluZy1vZi1ib290LWltYWdlcy8NCg0KPiBXaGljaCBwbGF0Zm9ybSBhcmUgeW91
IHRlc3Rpbmcgb24/DQo+IA0KPiBUaGVyZSBpcyBUSSBLMyBkb2N1bWVudGF0aW9uIGFscmVhZHkg
WzFdLCBidXQgbWFueSBwYXJ0cyBvZiB0aGUgbmV3IGluZnJhc3RydWN0dXJlDQo+IGFyZSBub3Qg
VEkgc3BlY2lmaWMgYXMgSSB1bmRlcnN0YW5kLi4uDQo+IA0KPiA+IFRoZSBJVFMgZmlsZSBjcmVh
dGlvbiBsb29zIGxpa2UgYXMgZm9sbG93aW5nLg0KPiANCj4gW10NCj4gDQo+IFsxXSBMaW5rOiBo
dHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9ibG9iL21hc3Rlci9kb2MvYm9h
cmQvdGkvazMucnN0P3JlZl90eXBlPWhlYWRzJnBsYWluPTENCg0KLS0gDQpBbGV4YW5kZXIgU3Zl
cmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K


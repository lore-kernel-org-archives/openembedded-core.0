Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017B8C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 06:51:23 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.43])
 by mx.groups.io with SMTP id smtpd.web11.61100.1643784681553241668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 22:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dg1fGv2Q;
 spf=pass (domain: siemens.com, ip: 40.107.3.43,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeLKrXEkoosJqkMKrqk1YijbiUIHz3zUHTaL0rIwv2GlbW/+tlXW7o/1sKR5I9UnM0P+SZGyPHLTE40bt0edQNAxdEP8VcOad96etNua4wwDmYeXbB/QopsaSLi0Y2w1d/6i0WN2QsKY1tp2cDf/fCWGHtYogLYOvCq3AMkrGj48qPqRN3J5Gbod+8Qc74hB+0hdqqQfNwJALJ4YLAP1EpLXUcmss2fvsmNZvY8csKA94NYoSkLhAXFW/0RzxKIIng9x49gjXOuw9dwWylaeZgsbpZEodFZFfTN4cg4xtIcvy7DwXN4YQKg/8dJw0PjxzXlOzNuSWWLF/nYbRk1ewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrOYIwZhk/nM75iTBR8VdIPsg0TWx7kCySu34pSHWG8=;
 b=Q9htgp6NSG+DJoeQyKWIwofldg0Jr2X4jxDcd+qJTWgL9pCyxKtTZwcXeXE3UtrwxNZtulzbV+qwKv3m7Q4UUZliwu8v9+mCthj3EFNCQvcczhmt0y2o2MB7uywppFIizibpsItYRTYHjEUJMoxgeaJ7bNU6D4/qJrZqZ8cXGXOgUaeZc58+BvYPLnbbd2y20V4N7FPhdDsndEwCcW+NZOidkAdPcR6+/vdV2R6XD/bsjbQOzHeikdcTLrCYOa58ClCdhOTpJLGm2FFBSqjV6PXyO44fitToUx+pWr9C76GpmeVhNuSxDykTp39qpYjrvdJfW0N5aC5SD9fPX8xqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrOYIwZhk/nM75iTBR8VdIPsg0TWx7kCySu34pSHWG8=;
 b=dg1fGv2Quhol5J8XIIUesnHcKpZQAcB5X7jum6dkRJaOmKn7M/uMOIe5RZ3x0D0bIu9/4cVY5DftWTp/VGEmfrJFImDaUboEZqFOYf7OpmaqeJJhK8Tl3W7hTn+XaJZmA3d6e9Jk2BXijRDorseJpZqx70go1fIME4pYcCtUAHYI5vlmQFdhRhBoVkU9jolsdfaNdbhHf9ycxtn38dbDYrzUNVZ9CeDPHPsWYgEDpDFvNbbzTM4z9k2i1sYb0evgrfS95GcmvK9cagoSDS38GX428AfnlxlKQDW5oO+j9mXeyclWIS0Ui8UzmdQzMOdkVJgrG9yxjqDbOYsxNW0+aQ==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by AS1PR10MB5368.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Wed, 2 Feb
 2022 06:51:18 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a891:c3c5:9b77:c2da]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a891:c3c5:9b77:c2da%3]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 06:51:18 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "marex@denx.de" <marex@denx.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "featimage: refactor style"
Thread-Topic: [OE-core] [PATCH] Revert "featimage: refactor style"
Thread-Index: 
 AQHYFKdFKazkG8IFIU+R02wKcIxavqx5L5cAgAAJAoCAAAZAgIAACdGAgANu4YCAACwJgIAC9awA
Date: Wed, 2 Feb 2022 06:51:18 +0000
Message-ID: <613436ece6c481bbd5efda1774bb45be2960988e.camel@siemens.com>
References: <20220129002907.84534-1-marex@denx.de>
	 <93bb78f01d7c44c1b5918e1576f2a804@axis.com>
	 <315161c5-6b68-2b4c-37fc-3d10459fdbf8@denx.de>
	 <53514b34002e424584e20150b6b725a7@axis.com>
	 <cd82c692-f11c-0e1d-4b53-950121e0b3bc@denx.de>
	 <c864b18a0e354116059c25ddf03096c90cf8bbca.camel@siemens.com>
	 <251fe11a-7348-086f-364b-b9940fff3d68@denx.de>
In-Reply-To: <251fe11a-7348-086f-364b-b9940fff3d68@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 629763e4-1c8d-4f71-3483-08d9e6186a6a
x-ms-traffictypediagnostic: AS1PR10MB5368:EE_
x-microsoft-antispam-prvs: 
 <AS1PR10MB53680CE29531D26F65494C1492279@AS1PR10MB5368.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zdAHX91ujbULig2zjBt9Mpzx5JhrkNWk2GOWnjyjExFyvIjhTUhsco6GqAKGhCbU58taqCIxUJFKpPUY4TxJ2q9zm7a+ltEV5VjKxvC1hF2l5TvBDSPCWm2c/lq1zPLvDK7lGAAzEtrluvVh1EIAy7JgG8Kkq3ldPjjc1dkBXJjp37/mM6HYlbkPJnLpXwXnde2no6o29EQHN8bJ+WXLq0P3x+TFze2xOLlhYHEDMuylCNYSwQ03IZmpl4iYJ1YEtUuyXDyWwm84JQXKFryRdzbHbPC/1nU685rdl7Dd9mqvGsDZbMLirHestJ4HrfCpnLWbmxGTqWAWFoSZCqtOH9BQyQS8rH2FhTW2CC7VVubZCotHI3Ia58R8Uivk4r2jF6CZURP5AMs7xMWUH6acoqUqo5v/SempkYCiXHp3tiJYwyK63WJWif4bAhTnAL7tpxKNcBhGozdLF58jVjAJtdOevHrVq5ZFSd55KWJ0MPy6QWeRKtDmnYTx9qJhai2avDLZ2G73QCckQ/CIeNqHFz6KiwAdx3U7qr4KWcgDxffwpkIJ8OX7hZBTg0aB1n34fYC92VTJavuJ30P5L3G2jW0aKjhut4uVnfFIIrhpwZ81yw2zj1rO0+DcrVYTR9ORbIUsRjFngJ24E++lSRTseVenqRyL8vVM/ljqz4rfxdZUYRZ/ZnhL0jHK8sZwWu6mbIniWYvOSC869kZWhlAvNg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(8936002)(64756008)(66446008)(66476007)(66556008)(4326008)(86362001)(76116006)(6486002)(66946007)(36756003)(316002)(110136005)(91956017)(71200400001)(6512007)(38070700005)(53546011)(122000001)(82960400001)(508600001)(6506007)(38100700002)(2906002)(2616005)(5660300002)(26005)(186003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?STZJWWxBNUNWVUFlaWdvbzJBRThaWDRNSVc1YjdmSHhjQ2hqRkkvakE3QU5q?=
 =?utf-8?B?ckd6WGJjME9CV0pMaDNNdTMyOFhNR3BXNWUxMDhSRVBlSi8yWHJtRXhUdFZ4?=
 =?utf-8?B?c20zUGdvZHFjL1lzVXZyMmtBRmtNVkJLMTFKR2dBS2RPeU9rL1ZseSt2ZnYw?=
 =?utf-8?B?VXUyNXFNeGJVZ0cwTGN2c090QjZWZEZ4d29QKzJFYzFTQzcxU3pNWkFVMHMx?=
 =?utf-8?B?MTZjM3lqWnJOQTlsNUdRYnVwYWwxeTdlVERXY3M1NGJPZ3dwQ2ZTVk81VFhu?=
 =?utf-8?B?cnpnckh1eUV0QmNjSEJpaUxJVUJ2K2FtQXM4d2ZNOStTRlhaU0JCUkVxVk04?=
 =?utf-8?B?VFFQbkt1MGNKTWJTRGc5Q3diYnZYQ3RQTUkxYTluS1FIRFl0YXdmVWpwclp6?=
 =?utf-8?B?M1lURG1ENzlmLzdUYnFHMElzMmVWN2YzNldjZ3JUTkZDS2FIVHA0MTFoeUV3?=
 =?utf-8?B?Y2VoT1ZqTzNHMElQbUVPNDVHWklRV2NMVldxRWdaV05kTUlpS0VXOHY4Mndy?=
 =?utf-8?B?TDJGcnlWcjgvQWNMaFBNN3BHZmN2dGhuK1ByYS9Kam83NHI1TlgxcXVzdUo2?=
 =?utf-8?B?RjRYdXMvZWVDcmdVZzV2ZE4waVlLb1JXcThXdGt1REkxS0RGbWJ5M3VCemdZ?=
 =?utf-8?B?VjVTMkl0cCtlVktUWTQ2aXJtbTIyY2JiN0cxRlY3Z3A5amJZVCtBMzFOVXNV?=
 =?utf-8?B?M0RsV05CRzloNlNKNENIK2VxdWJJaVBCT3krNTJWOWZWZTdJYVpTa1RuaWdS?=
 =?utf-8?B?TUMzdW9Mam8vUlZjKzlEY1hrOE1tNjl1K1ZuVnUzazBNMU50Vm1rbkdXOGtI?=
 =?utf-8?B?N2U1U2I0ZEVGckFNNUEwR3BIZmswcGRBWUdMRTY0dDJ6OWF3UnNMcjVsaWk1?=
 =?utf-8?B?UGpuK05EKy9RTStUR2RGZlQ2TjdLT01qT082RHNPTUw1OGplWkVMaXN3NmVs?=
 =?utf-8?B?OE1MbHd5SkxER3lONG9uTkFrMUttTDhVbzhJZThyR2duVGw0YTR3YURIRlV0?=
 =?utf-8?B?aCsvZGYxbFVPV2x4R0c0RDQ4NUVJalZ3dkhBcjdmTGxqdUNnaDJRRzlWRlFq?=
 =?utf-8?B?aXFtOVFLUzlmZHQ2Z3Q0cG5sc3VnWHB5ZWhQUVRmcE5DQzJoL0dxdklqQ0pW?=
 =?utf-8?B?MmVuTXJUcWlCeU9lR00wTHNQbU8yam1iSkEyb1lxWHF5b1V6a0Z2VTNDVFc5?=
 =?utf-8?B?eGppNFdwRUZFTW82eGE5QXh5ZGhEamxFbXRQam9CV1gwSGNtTFJvWDNSMjVD?=
 =?utf-8?B?MlFxUTZmaXRnZGtuT2g2L1U2SlFyUXYzNzVreXBQR1pyZWsrQTkwS0l4Umd0?=
 =?utf-8?B?eWFtM3lOa2FEU0JjYnZTdFhRb0ZJZEJiMERoZTR0eG1KRHFGcHdqUXVwcjZC?=
 =?utf-8?B?ZTh4Nlp6aXlkNTFqSjdXODJkQVJJdWF1YTB3K1lXWW9kNE5ZcW1EUFBtRmhR?=
 =?utf-8?B?OEhyZHdqTzNvSnlFNXF0NUduMnVwY2NrVWg0VmlCZG9WckRpR2ZhZGxMZ2Nl?=
 =?utf-8?B?NlI1eFF6eVVJbWtSUGwvLzRTTHpFR3dtSm03bGk2L0hxdm44Rlc5dE1Pa3Jx?=
 =?utf-8?B?UUdzR0tJYkhLTWl4ZUJ5YmtVWlppQTdWZERoaFdCODVqMFBva2tvaTNNN2ti?=
 =?utf-8?B?LzBQQWhoVUkwMHVzTXRteXRWaytrazRiZ3B5QkNWeFpZckxlRFRKYlZsNXRL?=
 =?utf-8?B?OXp6d3ZaMlh0TGdUNkhxZ25kZnJQUm1nZEE0TTZsWjROQzBsdVFENHNsN29N?=
 =?utf-8?B?VmE4SE1ZQklHRDhBN29odDVVS0pFbHpVdFZsNjhKOFhpR0pxVGF3MU1EaVEy?=
 =?utf-8?B?djJWTFlaM0xHeUp3Z0ZKaGJ5eDM0WWgrbVRpaHAySisrci9MMStCU2x3Y29O?=
 =?utf-8?B?U0EvcisrOHo3V0QzN0RGQlB6VGlNcUFXRWZuVEVneEUra2J1UGlOV2IxOWYv?=
 =?utf-8?B?TjZIOU5vc1RNenhaWmVyNlRFbXhSQjg2NU5xb2tQSkxacWxUeW5la0UrL0RE?=
 =?utf-8?B?RjczamlRQXBtTnRyYmRsREFhUkp5cDJlNGZaYVEzK1ArV3hQSUFtRENGMWQ3?=
 =?utf-8?B?T0lJY1l0SXVlbFlsdW9DcXMrdVV5VE9lRWIva1RMNVZ5cW5KUE5XV3V0UW8r?=
 =?utf-8?B?SXRuMHBBaHZ3U3F1dmgrN3JRQ2JnNXJCODcrV2JjTmZPajR4NWhlcUNjSFAr?=
 =?utf-8?B?M0J1K0ZHWFprMEhZeUM1OGJUOEJtaWdDVklXYmZHbE1DSmE3TUhIRDU5WWZi?=
 =?utf-8?Q?TVtPuLjurIvib2JOcjFu/xeLZHZFNL+y9qmCoNwBw4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA3093018037CC42BBEAAF95346F5BB6@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 629763e4-1c8d-4f71-3483-08d9e6186a6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 06:51:18.7959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 WvkGU2mW1znFs8NtZZhCFzIQSjrYYa2qzR82kPaaIHS4pg3dNmlSsa9+wZaWiT7Sb46NdJ84AgKk1zHWSLdfttnJre4WM4ovGDqBNA/2sqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5368
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 06:51:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161178

TWFyZWssDQoNClNvcnJ5LCBidXQgdGhlc2UgYXJlIHN0aWxsIG5vdCBhbiBhcmd1bWVudHMsIHdo
eSB0byBkbyB0aGF0Lg0KDQpPbiBNb24sIDIwMjItMDEtMzEgYXQgMTA6MzkgKzAxMDAsIE1hcmVr
IFZhc3V0IHdyb3RlOg0KPiBPbiAxLzMxLzIyIDA4OjAxLCBWYWxlaywgQW5kcmVqIHdyb3RlOg0K
PiA+IEhpLA0KPiANCj4gSGVsbG8gQW5kcmVqLA0KPiANCj4gKHBsZWFzZSBhdm9pZCB0b3AtcG9z
dGluZykNCj4gDQo+ID4gU29ycnksIGJ1dCBwZXJzb25hbGx5IEkgZG9uJ3QgbGlrZSB5b3VyIGlk
ZWEuIFdoYXQncyB0aGUgYmVuZWZpdCBvZg0KPiA+IHJldmVydGluZyB0aGlzPyBJIHdvdWxkIGtl
ZXAgdGhlICR7fSBmb3IgYml0YmFrZSBhbmQgJCBmb3Igc2hlbGwuIFRoZQ0KPiA+IHt9IGhhcyB0
byBiZSBwbGFjZWQgb25seSBmb3IgdmFyaWFibGVzIGxpa2UgJGEke2J9Yy4NCj4gDQo+IFRoYXQn
cyBleGFjdGx5IHRoZSBiZW5lZml0IG9mIHVzaW5nICR7fSBpbiBzaGVsbCBzY3JpcHRzIGNvbnNp
c3RlbnRseSAtDQo+IC0gDQo+IHlvdSBkb24ndCBoYXZlIHRvIHdvcnJ5IGFib3V0IHZhcmlhYmxl
IG5hbWVzIGJlaW5nIGFjY2lkZW50YWxseSANCj4gY29uZmxhdGVkIHdpdGggc3Vycm91bmRpbmcg
c3RyaW5ncywgZWl0aGVyIGR1ZSB0byB5b3VyIG93biBtaXN0YWtlLCBvciANCj4gc29tZSBhdXRv
bWF0ZWQgdHJhbnNmb3JtYXRpb24gdGhhdCB3YXMgYXBwbGllZCBpbmNvcnJlY3RseSAuDQo+IA0K
PiA+IFdlIHNob3VsZCByZXNwZWN0IHRoZSB3b3JrZmxvdyBvbiBhbGwgcmVjaXBlcyBvdGhlcndp
c2Ugd2UncmUgYnJha2luZw0KPiA+IHRoZSAidW53cml0dGVuIiBydWxlcy4NCj4gDQo+IFRoZSB3
b3JrZmxvdyBvbiBhbGwgcmVjaXBlcyA/IFdoYXQgZG9lcyB0aGlzIG1lYW4gPw0KPiANCj4gYnJv
a2VuIGJ5IHBlb3BsZS4gQmV0dGVyIHVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbi4NCj4gDQo+IFRo
ZXJlIGlzIG9uZSB0ZWNobmljYWwgY291bnRlci1hcmd1bWVudCB0byB0aGlzIHJldmVydCBmcm9t
IFBldGVyLA0KPiBxdW90ZToNCj4gIg0KPiBUaGVyZSBpcyBhY3R1YWxseSBhIHRlY2huaWNhbCBy
ZWFzb24gdG8gbm90IHVzZSAke2Zvb30gZm9yIHNoZWxsDQo+IHZhcmlhYmxlcyB1bmxlc3MgbmVj
ZXNzYXJ5IGluIGJpdGJha2UgZmlsZXMgYW5kIGl0IGlzIGJlY2F1c2UNCj4gYml0YmFrZSB3aWxs
IHRyZWF0IHRoZW0gYWxsIGFzIHBvdGVudGlhbCBiaXRiYWtlIHZhcmlhYmxlcy4gVGhpcw0KPiBt
ZWFucyB0aGV5IGFyZSB1bm5lY2Vzc2FyaWx5IGluY2x1ZGVkIGluIHRoZSB0YXNraGFzaGVzIHRo
YXQNCj4gYml0YmFrZSBjYWxjdWxhdGVzLg0KPiAiDQo+IA0KPiBCdXQgdGhlIHBhdGNoIGJlaW5n
IHJldmVydGVkIGhlcmUgYWRkcmVzc2VzIHRoZSBwcm9ibGVtIG9ubHkgcGFydGx5LCANCj4gYmVj
YXVzZSBpdCBzdGlsbCBjb250YWlucyByZW1uYW50cyBsaWtlIHRoaXM6DQo+ICINCj4gY29uZl9k
ZXNjPSIkY29uZl9kZXNjJHtzZXB9c2V0dXAiDQo+ICINCkp1c3QgZm9yIHlvdXIgaW5mb3JtYXRp
b24sIHRoaXMgaXMgbm90IHJlbW5hbnRzLCB0aGlzIGlzIGV4YWN0bHkgdGhlDQpyaWdodCB7fSB1
c2FnZS4gSWYgeW91IGRpZG4ndCBwbGFjZSB0aGUge30sIGl0IHdpbGwgYmUNCmNvbmZfZGVzYz0i
JGNvbmZfZGVzYyRzZXBzZXR1cCIsIHdoaWNoIGRvZXNuJ3QgIG1ha2UgYW55IHNlbnNlLg0KPiAN
Cj4gWy4uLl0NCj4gDQo+ID4gPiA+ID4gdGhpcmQgYWx0ZXJuYXRpdmUgPyBJIG1lYW4sIGJlc2lk
ZXMgcmV3cml0aW5nIHRoZSBmaXRpbWFnZQ0KPiA+ID4gPiA+IGdlbmVyYXRpb24gaW50byBweXRo
b24sIHdoaWNoIG1pZ2h0IG1ha2UgaXQgbW9yZSBmbGV4aWJsZSB0b28uDQo+ID4gPiA+IA0KPiA+
ID4gPiBSZXBsYWNpbmcgc2hlbGwgY29kZSB0aGF0IGhhcyBncm93biBiZXlvbmQgYSBjb3VwbGUg
b2YgaHVuZHJlZA0KPiA+ID4gPiAodGVucz8pIGxpbmVzIHdpdGggc29tZXRoaW5nIHdyaXR0ZW4g
aW4gYSBiZXR0ZXIgbGFuZ3VhZ2UgaXMNCj4gPiA+ID4gYWxtb3N0IGFsd2F5cyBhIGdvb2QgaWRl
YS4NCj4gPiA+IA0KPiA+ID4gSXQncyBncm93biB0byBhbG1vc3QgODAwIExvQywgc28gbWF5YmUg
aXQgaXMgdGltZSB0byByZWV2YWx1YXRlIHRoZQ0KPiA+ID4gcHl0aG9uIGNvbnZlcnNpb24gdGhl
bi4NCj4gDQo+IFNvIGEgcmV3cml0ZSBpbnRvIHNvbWV0aGluZyBtb3JlIHN1aXRhYmxlIG1pZ2h0
IGJlIGEgZ29vZCBpZGVhIF4gLCANCj4gcHJvYmFibHkgcHl0aG9uIGluIHRoaXMgY2FzZS4NCg0K
QnV0IGFueXdheSwgaWYgeW91IHdhbnQgdG8gZG8gdGhhdCwgdGhlbiBkbyBub3QgZm9yZ2V0IGZv
ciBvdGhlciBrZXJuZWwNCmNsYXNzZXMsIHdoZXJlIHRoZSBzYW1lIGNvbW1pdHMgaGF2ZSBiZWVu
IGFwcGxpZWQgYnkgc29tZW9uZSBlbHNlLg0KDQpTbyBmcm9tIG15IHBvaW50IG9mIHZpZXcsIGl0
IGhhcyB0byBzdGF5IGxpa2UgaXQgaXMuDQoNCkNoZWVycywNCkFuZHJlag0KDQo=


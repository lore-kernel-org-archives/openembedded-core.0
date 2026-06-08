Return-Path: <zuzana.valekova-spitalova@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07931CD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 17:00:26 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59765.1780938020367402820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 10:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=0DKKxZkQ;
 spf=pass (domain: siemens.com, ip: 52.101.65.25, mailfrom: zuzana.valekova-spitalova@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxndrOlJPfjR0KS2sFKymSdpVv2TMM/NKCPBjWF4jo7MpqtpFBq2Zbsk78gS7c6DRDSZd50uPHvR2ZAozUNArneuMfuNG8XlarBmzZvkCS5aamNG7BueTdNp+P0mfqYFJzLM9ma/52THnUmGOvPv6c8c6MTyURp+PSHuaYV/TJf3tLAYnFwoTpWvYxUJvSuyLW8aGF2dEMLySf5nnx6M64YqIYkOA3nF5WOh1EC/Lr+eDKMcVOIfXwnTKdyA4SMPpM+GvvP0s1vQmiy4Mk0yYs70L1g6xJeppEWtMJsMX+4ZTnV8ayQEaqbxbEOLYBOdgnV/OqPtFFKsaR0f38/ESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCOj2bjexCA9ihl/+Dq8WrkHLSZpzeefXOXb0Nn/ZZw=;
 b=XP/WotiC2tgsXiV8DHvkCYjJVL7vBCLm4NNOYrBHI7Tj/v6GGqiKRSgUKayFJGKYtWvbbU3qwy8EtrWI+RVZQAmBgONGcvSNPDCX7L5lT/XT8glPPdzmTA/cd7rsTNiAedvYduUp+HBn0TwlgaqGVM9wJXrps1S1Qr9CcPsDKhayZ9nuR3UOj6H2GC9IW8Dx4R/2gjUkCB/6/6suH4jxZPYA3A784/oZwTAnwtZiiDCbvgKItEiUkq0dT2gOhs6dExLYq9G6KebhMPgCw9AtVPv9TKkRedSjozWJI8J9bqMCLXVMV0fBYmAW/kExUbMwBGt6F0EB87l7wh8RqpQYMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCOj2bjexCA9ihl/+Dq8WrkHLSZpzeefXOXb0Nn/ZZw=;
 b=0DKKxZkQmOvK1FdX7QMG+dAe6LIxrvwN9DspPxXIjGa9YF1Ui7czNJFOK3MNJZFe33j5rgOrt0AyeWUDn7K6yBdpSfYtbk4TYLlRIt2qgZ4MUexDGzkMWnf8kGQhrS8bEjBJU0/PldOXLzqzGRang8n5eceH9I4EuWPg2S7P0E3aeY+bS+C0I1W14nji91+Iqs3RFAe3rKxnGfTrr1P5kBLuwApqEr2TkXmas7pwU4puguG/jQEBnyawS8bh8DT39AOv+Phyo4DwOb4CKRBtppygInKyYY54OSyp/LIsK4kNvNBkMYBPz+hv2IFOsmkbyRalBt/LO8xMMpPUJenGAA==
Received: from PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:150::22)
 by PAVPR10MB7089.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:319::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 17:00:16 +0000
Received: from PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e3e5:29f6:b55:b0b]) by PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e3e5:29f6:b55:b0b%3]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:00:16 +0000
From: "Valekova Spitalova, Zuzana" <zuzana.valekova-spitalova@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH][oe][meta] runqemu: introduce unique instance ID
Thread-Topic: [OE-core] [PATCH][oe][meta] runqemu: introduce unique instance
 ID
Thread-Index: AQHc9qSzblZ9HtZlL0i/jFAisbTiWLY0hBiAgABfLIA=
Date: Mon, 8 Jun 2026 17:00:16 +0000
Message-ID: <89157e4191c5694f1bd13b821c172b1a691db7e2.camel@siemens.com>
References: <20260607174013.36552-1-zuzana.valekova-spitalova@siemens.com>
	 <87166f2237c2327bfaf7b3d8aefe7ebb11de3246.camel@linuxfoundation.org>
In-Reply-To: 
 <87166f2237c2327bfaf7b3d8aefe7ebb11de3246.camel@linuxfoundation.org>
Accept-Language: sk-SK, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB4701:EE_|PAVPR10MB7089:EE_
x-ms-office365-filtering-correlation-id: 10662b0a-0bcc-47ba-b710-08dec57f69e0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|55112099003|18002099003|22082099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: 
 SBk7FlWbeU89iTbvll0YNTjqeHg2sUEAxfBSO8NbvPUkbltS2fpvV5E8G0ZisTbJtDgSDivkk2ZMTqjvu/ivyt7StDwzEDTyIwtyp1ZmOFYLKEzcIVZkOFE4zFQE/DPL7V+WjuoTE7LLx4IMqiYrTmEMVostjGJQd9X97ntgaiqVNRz7cN8deI8cB8RcerjCquRuseXfOUUmwRNkZSQlsCLKwmOzhpV5qWr65GT2tpLsZXPihkj+dAfCh+lwPgoxPBMydTesNttlwlowiVwzEqLsb2XeSul/Dr22WIoQHNoO/oGlRatAo/LtAnBj98USCtKQ6V3FuX7yg9amQp2WCnCKyXcciHgJzfMRalpSeM2xXW63jfC8+t7pr9uerVbNdBUG9gTa2mGwOymWtwinSwdxrKEqomuiXWhLBtCVV55I49B4XquT3RinixfBWA+uA5Q2578i9HUNyNJSX42Br+SVZfoFR9YDiILVQheDA99TGysHgdn3yPaZbs5HifoAJ/ywTlJmO/dxuQE/UIDnsPiCBk7pPpm+aM15O0/09f6k+7lrNudO85rDrIJHIxduOUgq6nEhMuUDb582cs0n/zTc1k1+aHFA41D/udGT0CfyJ1wwmkLR8GEDfvboAb6V/NHTaJH/VO+af9XaXkVKa6lMgd37tVOyE3rJ0yDfj44xXYRYlgNuYtgsNptmy0g/d8WUuCsMaL7sEBcuEyPSHP4Sl8UHsaRojPEc8qHzwlxTvbuzfUYKGTyg5EbKOyIo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(55112099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dWtEdWNqdW9yUXRQc3JOMmtyTFlHaGZZOFNVaDdFUjJ6MnlpdXQ1ZXdxelJi?=
 =?utf-8?B?Q0JEWWNGZnJQbkNyVkxhSUlwb3hsQ0FiL3dydm1YSzN0eENjbEk4ajMvZFc5?=
 =?utf-8?B?ejBZVEN0SHc4SGdCNlV1ZWJOcnl5VElKQnM3VkxUY0x2VnlibzdCaWdkZTI2?=
 =?utf-8?B?K050ZGxpcTNXL1BocXgyem54U1VrdkFzbEJ2MSt2d0FoWkFXUCtodVgzcEg2?=
 =?utf-8?B?elRPd3J6dDlFWlNTVGkzOGFpWi8rd2gwNktoSzBwOFJIdjJRallVcmNQVWdY?=
 =?utf-8?B?TnROSi8xSWd6UStKZm51NHdITDR2YnV3eUwvamZUeW1PcGRvcXR6QVdnT0JV?=
 =?utf-8?B?Y3lzK0dDRzhxR3Fld1d4aEVSbUNOSGFER2NqYmVPVXd1ZDB0c3k0TG5hTHBB?=
 =?utf-8?B?andlaTR2eVROQW1HbWdoc1FhWWNLUW5KaTVSbnNPampsUi9tSDRJVWNJZGJ1?=
 =?utf-8?B?Z3VjWTkvdVRLQ1dWZzc0Z2FkbE5WZElocW9sTGhPZ2xPTW9Ta1BJNS8wUGJE?=
 =?utf-8?B?SUFBdGNWbS95UXU4QWFOVHpRQm9ZdE1LTDE4WXY3L0pFZFpZYkFORnFVb1R1?=
 =?utf-8?B?ajBXOWM3WDNYRVl5cUpTY0dmaVpoY1ZhWXBxb3h5RFNwSkhxUmtEOFhGejBv?=
 =?utf-8?B?M1JBS3l6NnFSd3E1MmdUM1lZL3lIRU9GNDEyS1hTRU9PZGhiMXVlY0c2Nzhl?=
 =?utf-8?B?dXN3NC9sZEVvdTRoUmNJWVUyaXZLVEsvVDZMYzZGUWFaM0tKUXMrM0ZUYnds?=
 =?utf-8?B?T1hrRURSSFV3ZVZiR1hadEF3VW9qVVUxaG5lbXEycnZHTEw3cm1PWXRBR1FM?=
 =?utf-8?B?T2tFTkQxSnpRYjRVb2QxNGd6SU11ZlVGTTZmQlFlSm41bko4S041VExUTW0x?=
 =?utf-8?B?RS9KcUs3bjd5dFQ2akwzVzdsM2J6MEJ1c2J0b1g5cEVDRzhramtjaVJ2dWlh?=
 =?utf-8?B?ZzBHK0t2T3Z4dmM4S3lsdjh3Z0s2ZWhXNlFaOGt3SWlRb3AzQlc0VlJwdFA5?=
 =?utf-8?B?SXZMMmhJak5scklPUzJGSTNOeUpQTklkWXEycXRTVnUrNTFYamxaMnB6My96?=
 =?utf-8?B?VCtVTmxhakRzRS84R2xWbnZlU0hkM3ZsbjhlaW9MQTBHQ2lucUk3Z3B0dFNL?=
 =?utf-8?B?dFFvdzhIR2krWFBRQmtLWnBzR2puc09GNEFnUUx3bzJkM0ZlbHJGeXJXaVlX?=
 =?utf-8?B?VHdkdHEyUElFTkl2dHBXTmJmVk51bVYzMW5vS3RKM21BSjZHWllTMGVkbEdB?=
 =?utf-8?B?UHA2SlVLaDhYOU04SnNBNmNpaGZpUU9PTlR4ZTdZUlRaeXVVOXpRNjltOWU1?=
 =?utf-8?B?L0Rkb0YzTDg4QnpSZHdqTHc4bnh3ZE1EVmZJNUpIUDJZMVplVzBxK2hDMU4z?=
 =?utf-8?B?VE5PWUwrT2xFWkNRVmJReGJxc0lqS3h0aVhHWWJ3UVFtQjhnRzkrSU42aUVR?=
 =?utf-8?B?WFo5L3QzKzFLbXdidkNaS0V1czJjcldTWnVCWVR3K0ViVHkrdUdSUVIvK0tF?=
 =?utf-8?B?R3hLdmN6VlFiUDI0dlhtQ053ZkhVYlovQjBsOUVXaGRzVGw2ZGU3Y2p2OHlm?=
 =?utf-8?B?NEs0Z3A0bzVibFNnTy9jOEJTQ2VKS2REWFViU3JGZUZwRWdrMXlvcUpKUFRa?=
 =?utf-8?B?L0JXYXpCRmN4U0w1NVVDUnJUQ1FYUTR6Zld5UE5GVlhtQ2lmR3JDVnFhRHlV?=
 =?utf-8?B?MW54SGp2WmEwN0FjNEU0NjAvSUdLWGVBRHBoYXVBeWRlOC9udnZVL1JoU1d0?=
 =?utf-8?B?STVkRU5iUGJHYTdYeGRKcUVzSFpCZzV6NGt2QjZzSk9McHlEQ1BrR1JTY1Vt?=
 =?utf-8?B?RUVnVTdwUG9zZllFUmJNRGQvWVVuTGpVdjUyWEpuOWJNbUxzS2tlazl6anBF?=
 =?utf-8?B?My9xa2Rqck5GTGVWaThUaEJvbHljbVFoblFMbTZCa2FoclYvYVBhMVpDY29H?=
 =?utf-8?B?a0x1aXZpcXUyQnh0cXpVSnZOQW5PMGJicWp5Y0ZMd0VWTytobERFZk1rMkhP?=
 =?utf-8?B?QUlzb1Y2dG1JQWJCcmk5K2JqTjl3L3g2RWdqR1U5czFIQVlwa20rd0Exa0g0?=
 =?utf-8?B?a0trcUxXUWQ3VGpSTmhMV1JRWHJBUFBhdTczQWlHcXZYZW4vUFpPemd1cDVh?=
 =?utf-8?B?MlVhNEtwVWg5VkpEZDFSSmdqMS82dlcrVmhLZ090U201ZkxjM0pZSFZMV3ZQ?=
 =?utf-8?B?SGF3eHN1Ryt2TktvS01SZEVZTjhlUGlQWDhidTJuVU41LzRUNjJZWW0zbXNO?=
 =?utf-8?B?WERDdWplbURzTlFQejJVcWk0cmt2MHJkVzBDTUFtT1g3U0RLbkFYeW1HbTd0?=
 =?utf-8?B?bFpxM3VMY2ZSTncvU1JWWnJBejlkOGdsQlJkbUcreUE2SFZTemxJeTZyUmhU?=
 =?utf-8?Q?qgWPqGXo5NGOZlu7Ge5z71c067a2MumgvZ7bq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFA3DE78BF57424F816A5211B8C94353@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 10662b0a-0bcc-47ba-b710-08dec57f69e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 17:00:16.0664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jXEGRJAnZW/lhbEZAi6yotvewaKLR+EbChIUa2gJQq7xn5gP+DthM5K5YVy0IXmqBvKTcPWptnD4Rufl0m/japo2LwemFlStrWTfi1hZ1Cducqqzi1+Fq0R2xwqdAapJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 17:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238253

SGkgUmljaGFyZCwNCg0KRG8geW91IG1lYW4gdGhlIGAvdG1wL3FlbXUtdGFwLWxvY2tzL3RhcFgu
bG9ja2AgZmlsZSB3aGljaCBpcyBnZW5lcmF0ZWQNCmJ5Og0KPiBwb3NzaWJsZXMgPSByZS5maW5k
YWxsKHRhcF9yZSwgaXBfbGluaywgcmUuTSkNCj4gdGFwID0gIiINCj4gZm9yIHAgaW4gcG9zc2li
bGVzOg0KPiAgICAgbG9ja2ZpbGUgPSBvcy5wYXRoLmpvaW4obG9ja2RpciwgcCkNCj4gICAgIGlm
IG9zLnBhdGguZXhpc3RzKCclcy5za2lwJyAlIGxvY2tmaWxlKToNCj4gICAgICAgICBsb2dnZXIu
aW5mbygnRm91bmQgJXMuc2tpcCwgc2tpcHBpbmcgJXMnICUgKGxvY2tmaWxlLCBwKSkNCj4gICAg
ICAgICBjb250aW51ZQ0KPiAgICAgc2VsZi50YXBsb2NrID0gbG9ja2ZpbGUgKyAnLmxvY2snDQo/
DQoNCkhvdyBzaG91bGQgSSB1c2UgaXQgdGhlbj8gOikgU29tZXRoaW5nIGxpa2UgYGJhc2VuYW1l
IC90bXAvcWVtdS10YXAtDQpsb2Nrcy90YXAwLmxvY2sgfCBzZWQgInMvW14wLTldLy9nImAgYW5k
IHBhc3MgaXQgaW50byB2YXJpYWJsZT8gSXQncw0Kbm90IHZlcnkgdW5pcXVlIG9yIHN0cmFpZ2h0
IGZvcndhcmQsIGlzIGl0Pw0KDQpMb29raW5nIGludG8gcWVtdWJvb3QuY29uZiwgbWF5YmUgQENM
SUVOVEAgY291bGQgYmUgZmVhc2libGUuIEJ1dCB0aGUNCm1haW4gcHJvYmxlbSBpcywgdGhhdCBJ
IG5lZWQgYSBAdmFyaWFibGVAIGluc2lkZSAiY21kIiB3aGlsZSBpdCdzDQpldmFsdWF0ZWQgdGhl
cmUuIFRoZSBAQ0xJRU5UQCBub3IgQFRBUEAgYXJlIHVzZWQgaW4gc2V0dXBfdGFwIG5vcg0Kc2V0
dXBfY21kLiANCg0KV2hhdCBkbyB5b3UgbWVhbiBieSBQSUQ/IERvIHlvdSBtZWFuIHRvIHVzZSBg
cHNgIHRvIGdldCB0aGUgcGlkIG9yDQpzb21laG93IGNhbGwgYG9zLmdldHBpZCgpYD8NCg0KV291
bGQgaXQgYmUgcG9zc2libGUgdG8gcHJvdmlkZSBtZSBhbiBleGFtcGxlKHMpIGhvdyB0byBhY2hp
ZXZlIGl0ID8gOikNCg0KTWFueSB0aGFua3MgZm9yIHN1cHBvcnQsDQpadXphbmENCg0KT24gTW9u
LCAyMDI2LTA2LTA4IGF0IDEyOjE5ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gT24g
U3VuLCAyMDI2LTA2LTA3IGF0IDE5OjQwICswMjAwLCBadXphbmEgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gd3JvdGU6DQo+ID4gSW4gc29tZSBjYXNlcyBsaWtlIHJ1bm5pbmcgbXVsdGlw
bGUgUUVNVXMsIHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhbg0KPiA+IG9wdGlvbg0KPiA+IHRvIGRp
c3Rpbmd1aXNoIGJldHdlZW4gdGhlbS4gRm9yIHRoaXMgcmVhc29uIEkgaW50cm9kdWNlIGFuIHVu
aXF1ZQ0KPiA+IGluc3RhbmNlDQo+ID4gSUQgYmFzZWQgb24gdGltZS4gTGF0ZXIgaW4gY21kLCB0
aGUgJ0BJTlNUQU5DRV9JREAnIGNvdWxkIGJlIHVzZWQNCj4gPiBmb3IgUUVNVQ0KPiA+IGlkZW50
aWZpY2F0aW9uLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFp1emFuYSBWYWxla292YSBTcGl0
YWxvdmENCj4gPiA8enV6YW5hLnZhbGVrb3ZhLXNwaXRhbG92YUBzaWVtZW5zLmNvbT4NCj4gPiAt
LS0NCj4gPiDCoHNjcmlwdHMvcnVucWVtdSB8IDcgKysrKysrKw0KPiA+IMKgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gTm90ZSB0aGF0IHdlIGFscmVhZHkgaGF2ZSB0aGUg
dGFwbG9ja3MgYW5kIElQIGFkZHJlc3NlcyBmb3IgdGhlDQo+IGd1ZXN0cywNCj4gdGhlcmUgaXMg
YWxzbyB0aGUgUElEIG9mIHFlbXUgYXMgYSB1bmlxdWUgSUQuIFdoeSB3b3VsZCB3ZSBuZWVkDQo+
IHNvbWV0aGluZyBlbHNlIGFzIHdlbGw/IENhbiB5b3Ugbm90IHVzZSB0aGUgUElEPw0KPiANCj4g
Q2hlZXJzLA0KPiANCj4gUmljaGFyZA0K


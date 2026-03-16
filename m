Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707BAF506CB
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 13:03:53 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50036.1773666226390009092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 06:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=KrCAfDSs;
 spf=pass (domain: axis.com, ip: 52.101.70.3, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCwz2EEcScmMsADJ8fuE6zviMq8gWgBmHOZolmb8BKNwpQrR7pGvF9C8wuXbxpf+UEj+biNpRjb77Nlx2kQClCuZa6QVhpy0kezlMCbpjJvjjvz5askiK/zezhXGiLmFEOuckm2tnGHgvHAA+3ZeXTAfx3puzV+22KvYsdScSyY9g9sv5scMSDnuQAc9uAfLNg2NcKhQ/m+MON0VoLtgJfxbFq40Ohr6x3tDw+kEWM9yWhKLNNw8Y/wodCCBuBPSkXYojoybyTb4WZkXtLQ9+ioB4+1xtBhs3atW/n6TrErHk4AyimBc/VqNltnILuaAldLBTovv55BJJ3Mll/8X4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHc2HeLkFfrepcVbyeGZg5OCbw32HlczQ96fC+js8RU=;
 b=okV0XJtCtANUR7i/gEIEYwbKX6GK9awbmbyn+WggqyxzbFEoShaMdrpqwIc0o6xhWR07jVG8HKXkaot2Tf3ENac2EImMJJoKR+wORDOinR6wckdweDYxVqngy7izqr3RzvxkbxpS4dS5OKh622DPz9VvhYbYqoujLnaWhYjcMNEoEo3N9BM4QqOCulGGaUF0fLHyFxx5ebGL9E5rgqVXRcgoohI8eh0xn6aqbBpst6SZU4RBtvSXir+2F/w1CTBomGiD9rvURYMNga3YAtskqbbR5JChbfWCAAxfshJI5F/01+xMu9oDDVRgIIWPenHD9H0kbU93RfkzcgR/wJAGMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHc2HeLkFfrepcVbyeGZg5OCbw32HlczQ96fC+js8RU=;
 b=KrCAfDSsJMW3S63K0vIRPTAVxs4cZEhxoWhXpmzwWrNvkftMQquN9kGca5kYB1+8dQY2FcCws0s5UGFs31AF9hd0cCkyMe99w8+QRUshy0l2LZd5/xhog3EA/td6fat2utImDq4Hn5/YGiGBOwZvS+0BF39haROOV7zInVqsNvY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PR3PR02MB6108.eurprd02.prod.outlook.com (2603:10a6:102:62::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Mon, 16 Mar
 2026 13:03:41 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 13:03:40 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] sstate/sstatesig: Abstract dummy package
 architectures into layer.conf settings
Thread-Topic: [OE-core] [PATCH] sstate/sstatesig: Abstract dummy package
 architectures into layer.conf settings
Thread-Index: AQHcs50kBh1WHvRh9EeNNO1NUSlroLWxBQYAgAAD4wCAABa7oA==
Date: Mon, 16 Mar 2026 13:03:40 +0000
Message-ID: 
 <DB5PR02MB102139B16A3C8B755F94EFCD8EF40A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260314102702.3942139-1-richard.purdie@linuxfoundation.org>
	 <DB5PR02MB10213C75B95E2CBE99D91221DEF40A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3f73b46c12aff52292d488f48d11572c66991b70.camel@linuxfoundation.org>
In-Reply-To: 
 <3f73b46c12aff52292d488f48d11572c66991b70.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PR3PR02MB6108:EE_
x-ms-office365-filtering-correlation-id: 7e053b94-07f3-4ff7-3074-08de835c7221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 ZLP7pT9Xmqcuv4BHMmdzVvyZtKSsM5lAX99cuKzMHNdkP4Njf8yMszzS0Ued4NZuG1oav3OmacvHomDMPrZf29/OcxkqhB7ZnCYSQfScr1LEqn9ddNibITVI04ijkmdIaiIR5fyNvD1XOmrugoCHAGzstlj1w0D020ubc9FP+nQZqpAMC423I0pVGuMEjHFGviBCfDGyV7PJiEKRCnSfjSPVg0gQ3sXu/6TvOZXxiSm75Juul4BkJIeEwQVWW7ntlsSr8MWNlm3KKbeRtRV/I+s+guXq1eUIVH64zppd98H91Wa0HRVmS8PrZMEmbLNQ2C5BHFdta8CwnPJWDRIEpPpZRWkBWNzAeoDLXoZ4Lja/bZHZJhlktoaYnwRODEKIyOpFEGnlEC8oV8xG347ORsjR9pVlTOSc73LnGt8l8gjhiTEMfL8pI8EH86iYwh36SbFQO9BJ9nI7VVwdHIjzzPsLP2/lGX9BKkXEAcxP3DCRbkCpmN+5zgb47M5tppzyRfi4by/2diHeBPJG1U/vX7DnAI4WLMZhGDFcWWfOPMwny2T6hdlYtF2u4UHc4Eb9X47f2g4jeX9VR4cuoMSgVj6H4w7f8nQLjzOAyxTRjXJjDFLxNbWbdeyW0/S7F2sm45jYjb+FETXAnFQT+4vJS+5lxSKoIkXOmTtGGttO53YJkocH5exswyc0hBEq43sCF8YdEVaLT1ePNBOCZX0xdh2D/pXVVQK+/Cg97oAQwc9xtoqMujlm3i/ihDnzb2FZjo7HzM9zuLGGuAbJ3IESlTeJ52xAilBp37pQB0mBFzM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cFBld2VPbDFrZDhOTmxlWERKRnNuU2h2MDl5b0R3YUNoVFp2UlFqYjEyM0o2?=
 =?utf-8?B?bjY1dGhBRFEwY2EyL3Q3M1lmMVNUSm5TWVZkb29RNjdKQWJXTnk0YmthNTFh?=
 =?utf-8?B?UTl2UzVpK0dVSmYvaUZpejYzbXU2dCtYREx6ZmQ1VHprUGtSYVoxN3FmaTh2?=
 =?utf-8?B?R2pOeE9hNFdkQmZ0c2ZRTFdQMWtxZFZaZjhGVlp4RU94N0FZdDFUMDcrc21H?=
 =?utf-8?B?enZnWXV5TlZKcFRxUkdoc0hLdkVQNFRaTWtza3hwWjFHUjBzcytaWFp4SXV6?=
 =?utf-8?B?ZWJTVExHWkhXdDlIeWxoT0FPVnV0dHNkWmZ1THk5NW52cW93YWpjbzQvT2Iw?=
 =?utf-8?B?VzlhWjJjSTl2UzRWRzBxZmJ0bjJ5NG5Zb0ZNZW9XSFVXVG55b250azEwTWhR?=
 =?utf-8?B?NjdzTSt4dTJNVW1jakxrMmtKRmhrR1hwa0NmOE8yTzhzSEZsQUE4aVZ1a040?=
 =?utf-8?B?MEVaN2pERkRIcWRhV25NSThSejN5bS8rUVptUkZwMlJLajd0Y3NNbGYzTzZj?=
 =?utf-8?B?NWx1NmJHZTMxWDlHYXBYN2V2TFRVT2dqS1NhOEo2alRiYW9YVGRmc2ZaQ0ht?=
 =?utf-8?B?RHFtdjgwSWhtYWpvYW1iMjEzaU5ZUURzekdpNDgyYWE1UUJPa0pNZUh4VkNu?=
 =?utf-8?B?emNlM1hYK2wwNEdaaWlUVXJkZ295dmhOd3MvOGpyUmhFZGVpaGVqa1lxNjEr?=
 =?utf-8?B?L0hDTUdWSXJQa1BCZ2tXd012bHdtWjJTOStOMkNUaFc2T2lpQ1BEd04vWDdk?=
 =?utf-8?B?Rzh1TFFQV3hPVENVSVA2NkcvWnpDQUlXbTZicEU3YWVUMkZBN3J3ZHMrLzBS?=
 =?utf-8?B?ZmZxbklyVUVDK1Vwb3hLV05tbnhmSkZuUTFsWUFWL2cxYi9OM05pclI4cWF1?=
 =?utf-8?B?YnF1OUkvdEZJeityQmRtQlpqZmlkWTF5WkhhVWFOL2VXRWE1RHFvYTZ4QlFP?=
 =?utf-8?B?SnMwZHNKUVMvQ2srK2hvQXdVbU1kSFlYR0hWekVZSlJyb1Rvekl0UGdJYXl5?=
 =?utf-8?B?T0VtM2JLWVE4WFE5ajZVQnZORThXZFBJdGtTT3NVRmkwZ3ZmdFE1UzZHdC9O?=
 =?utf-8?B?ZzJpYTRvY3NYWU95R3FPSzlrcXBQNE5rVVdOZzMvU3RlR3lDTDJFK2tWZ05u?=
 =?utf-8?B?eWZoUjhlc3VMNExKRUI0S1FQMHRWQ29wK0VzYjc0dzBVNk1UY1UzRDNZcklr?=
 =?utf-8?B?WFdpT2dwTEo2aTIxbjBoWWhFYVR2a1RQNU9kZTA2ODZvVnIvWUpNaTZ6bFRv?=
 =?utf-8?B?dHhEWjhaKzBSM1VhLytxZWo0Q3dMOXBEaVpzcmVFVzduNDgvUjFPMnN6VTZD?=
 =?utf-8?B?SjAzbXJKUHhIRFF2Uml3bHBSYkZpai9rWTRQNkJHdVNVMU9vUnkza3k4ZEpZ?=
 =?utf-8?B?VW80aFN5SnZDRkdwSlNBc1lWd2dvZkhrOW5ETUdvY1lWRGp4WG5aNWR2RmNH?=
 =?utf-8?B?M2x3Wmp3a21tVTM2RmFDUk9qK0hmUCtQZVdScDU1SyttcXdlaEp3SU9iSlFq?=
 =?utf-8?B?RklxeHFmNHFoQmhEOTUwWWFDUFlPY2FkaFRrbDNsUzNBdDRvSWVKaUljais4?=
 =?utf-8?B?U2V6bnZQR0J5dW56VERrd1NVaGRibDZMWDNacWJaUy9kYkhrcGgzajdSc0Ew?=
 =?utf-8?B?eFRPR3pVUmdZajRyeHdYTHowWWRrTTN3YXFSaGNtMVV6aWtKaGgrTkJ3R3B2?=
 =?utf-8?B?R2lUQnd3MVllT2ZUQlpwWUZrVmZMdEJhTklDYU5lTHg5bUJOL21ENTcwSDZV?=
 =?utf-8?B?WmFRY0dXQkszK2liTzlocVJxRkgzK3BYZmUvamttTm1YMW1VQ2VKK3BENzdQ?=
 =?utf-8?B?Sis0aW55OE9MeUIyVXdwSDhpV3oxbzhBMDhYcmc1VXlGcFdabTlNRkJEWEZI?=
 =?utf-8?B?WUNEZElsK0R5UEg3YnF1RjZpSU9EaVphbnRDaDhORVc4d3VHVzAzeWZhcjZE?=
 =?utf-8?B?RXhRQVVzNStGc2FHcEx0MnhTVWIrYWNCM1NyWEc4U1pqTElpS01CMElrMmQy?=
 =?utf-8?B?RHBMcFJEZC9JT2F4dXUrb1RSVzYyc2xZeTU1UFF0MXNjcFpkYitEQXdON3h6?=
 =?utf-8?B?ajlCK0EyMGk3RkFrUnhsNjFZeVFvQkE4MmFUU1NVZWpaRHB1NS9CQUlJZE93?=
 =?utf-8?B?ckNHTm5ETXQ5U0tsQ1VWc0M2YS9ybzhNNnhVWTZxNFg4TWdVRVMraDdSMjgr?=
 =?utf-8?B?MTRiZUR6MXBEMHdyM21rbUtyUk0rUmx5eU5HdkdtbEFlb1dCMjdOTzZpazhX?=
 =?utf-8?Q?oxSXJGqf5XRZe6CnyySZZBVIkPjZuO1jjGypgmbMUw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e053b94-07f3-4ff7-3074-08de835c7221
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 13:03:40.7947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1MDE0J1dgnVtDuKpgCWIr7ebIbskR9ht+2Fjc+Td4oi+P3F8O8/3nrJig3xesDSu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 13:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233251

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDE2IG1hcnMgMjAy
NiAxMjoyOQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhp
cy5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBzc3RhdGUvc3N0YXRlc2lnOiBBYnN0cmFjdCBkdW1t
eSBwYWNrYWdlIGFyY2hpdGVjdHVyZXMgaW50byBsYXllci5jb25mIHNldHRpbmdzDQo+IA0KPiBP
biBNb24sIDIwMjYtMDMtMTYgYXQgMTE6MjEgKzAwMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90
ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnwqA8b3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFNlbnQ6IGRlbiAxNCBtYXJzIDIwMjYgMTE6MjcNCj4g
PiA+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBT
dWJqZWN0OiBbT0UtY29yZV0gW1BBVENIXSBzc3RhdGUvc3N0YXRlc2lnOiBBYnN0cmFjdCBkdW1t
eSBwYWNrYWdlDQo+ID4gPiBhcmNoaXRlY3R1cmVzIGludG8gbGF5ZXIuY29uZiBzZXR0aW5ncw0K
PiA+ID4NCj4gPiA+IE90aGVyIGxheWVycyBuZWVkIHRvIGJlIGFibGUgdG8gYWRkIGR1bW15IHJl
Y2lwZXMuIFRvIGRvIHRoaXMgYWRkDQo+ID4gPiBEVU1NWV9QQUNLQUdFX0FSQ0hTX1NESyBhbmQg
RFVNTVlfUEFDS0FHRV9BUkNIU19UQVJHRVQgaW4gbGF5ZXIuY29uZg0KPiA+ID4gd2hpY2ggY2Fu
IGJlIHVzZWQgdG8gYWRkIHRoZXNlIHRvIHRoZSByaWdodCBwbGFjZXMgaW4gdGhlIGNvZGUuDQo+
ID4gPg0KPiA+ID4gRG9uJ3QgYWRkIHRoZSB2YXJpYWJsZXMgdG8gdGFzayBzaWduYXR1cmVzIGFz
IHRoZXNlIG9ubHkgbWF0dGVyIGluIHRoZQ0KPiA+ID4gY29udGV4dCBvZiBjb25zdHJ1Y3RlZCBp
bWFnZXMgYW5kIG5vdCB0aGUgcmVjaXBlcy4NCj4gPiA+DQo+ID4gPiBkLW9mZi1ieTogUmljaGFy
ZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4gPiAtLS0N
Cj4gPiA+IMKgbWV0YS9jbGFzc2VzLWdsb2JhbC9zc3RhdGUuYmJjbGFzcyB8IDcgKysrLS0tLQ0K
PiA+ID4gwqBtZXRhL2NvbmYvbGF5ZXIuY29uZsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAzICsrKw0KPiA+ID4gwqBtZXRhL2xpYi9vZS9zc3RhdGVzaWcucHnCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDkgKysrLS0tLS0tDQo+ID4gPiDCoDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFz
c2VzLWdsb2JhbC9zc3RhdGUuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvc3N0YXRlLmJi
Y2xhc3MNCj4gPiA+IGluZGV4IGE3YzNmNTMzMmEyLi5mZTcwYTk3Njg2OSAxMDA2NDQNCj4gPiA+
IC0tLSBhL21ldGEvY2xhc3Nlcy1nbG9iYWwvc3N0YXRlLmJiY2xhc3MNCj4gPiA+ICsrKyBiL21l
dGEvY2xhc3Nlcy1nbG9iYWwvc3N0YXRlLmJiY2xhc3MNCj4gPiA+IEBAIC04NiwxNCArODYsMTMg
QEAgU1NUQVRFX0FSQ0hTID0gIiBcDQo+ID4gPiDCoMKgwqDCoCAke0JVSUxEX0FSQ0h9XyR7T1JJ
R05BVElWRUxTQlNUUklOR30gXA0KPiA+ID4gwqDCoMKgwqAgJHtCVUlMRF9BUkNIfV8ke1NES19B
UkNIfV8ke1NES19PU30gXA0KPiA+ID4gwqDCoMKgwqAgJHtTREtfQVJDSH0tJHtTREtQS0dTVUZG
SVh9IFwNCj4gPiA+IC3CoMKgwqAgYnVpbGR0b29scy1kdW1teS0ke1NES1BLR1NVRkZJWH0gXA0K
PiA+ID4gLcKgwqDCoCBzZGstcHJvdmlkZXMtZHVtbXktdGFyZ2V0IFwNCj4gPiA+IC3CoMKgwqAg
c2RrLXByb3ZpZGVzLWR1bW15LSR7U0RLUEtHU1VGRklYfSBcDQo+ID4gPiArwqDCoMKgICR7RFVN
TVlfUEFDS0FHRV9BUkNIU19TREt9IFwNCj4gPiA+ICvCoMKgwqAgJHtEVU1NWV9QQUNLQUdFX0FS
Q0hTX1RBUkdFVH0gXA0KPiA+ID4gwqDCoMKgwqAgYWxsYXJjaCBcDQo+ID4gPiDCoMKgwqDCoCAk
e1NTVEFURV9BUkNIU19UVU5FUEtHfSBcDQo+ID4gPiDCoMKgwqDCoCAke1BBQ0tBR0VfRVhUUkFf
QVJDSFN9IFwNCj4gPiA+IMKgwqDCoMKgICR7TUFDSElORV9BUkNIfSINCj4gPiA+IC1TU1RBVEVf
QVJDSFNbdmFyZGVwc2V4Y2x1ZGVdID0gIk9SSUdOQVRJVkVMU0JTVFJJTkciDQo+ID4gPiArU1NU
QVRFX0FSQ0hTW3ZhcmRlcHNleGNsdWRlXSA9ICJPUklHTkFUSVZFTFNCU1RSSU5HIERVTU1ZX1BB
Q0tBR0VfQVJDSFNfU0RLIERVTU1ZX1BBQ0tBR0VfQVJDSFNfVEFSR0VUIg0KPiA+ID4NCj4gPiA+
IMKgU1NUQVRFQ1JFQVRFRlVOQ1MgKz0gInNzdGF0ZV9oYXJkY29kZV9wYXRoIg0KPiA+ID4gwqBT
U1RBVEVDUkVBVEVGVU5DU1t2YXJkZXBzXSA9ICJTU1RBVEVfU0NBTl9GSUxFUyINCj4gPiA+IGRp
ZmYgLS1naXQgYS9tZXRhL2NvbmYvbGF5ZXIuY29uZiBiL21ldGEvY29uZi9sYXllci5jb25mDQo+
ID4gPiBpbmRleCBiYTI1Y2EzMDI5Ni4uNDc5NGU2NjBhZWQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9t
ZXRhL2NvbmYvbGF5ZXIuY29uZg0KPiA+ID4gKysrIGIvbWV0YS9jb25mL2xheWVyLmNvbmYNCj4g
PiA+IEBAIC0xMzMsNiArMTMzLDkgQEAgU1NUQVRFX0VYQ0xVREVERVBTX1NZU1JPT1QgKz0gIlwN
Cj4gPiA+IMKgIyBkZXBlbmRlbmN5IGluIHRoZSByZWNpcGUuDQo+ID4gPiDCoFNTVEFURV9FWENM
VURFREVQU19TWVNST09UICs9ICIuKi0+YXV0b2NvbmYtYXJjaGl2ZS1uYXRpdmUiDQo+ID4gPg0K
PiA+ID4gK0RVTU1ZX1BBQ0tBR0VfQVJDSFNfU0RLID0gImJ1aWxkdG9vbHMtZHVtbXktJHtTREtQ
S0dTVUZGSVh9IHNkay1wcm92aWRlcy1kdW1teS0ke1NES1BLR1NVRkZJWH0iDQo+ID4gPiArRFVN
TVlfUEFDS0FHRV9BUkNIU19UQVJHRVQgPSAic2RrLXByb3ZpZGVzLWR1bW15LXRhcmdldCINCj4g
Pg0KPiA+IFdvdWxkbid0IGl0IGJlIG1vcmUgYXBwcm9wcmlhdGUgdG8gdXNlICs9IGZvciB0aGVz
ZSB0d28/DQo+ID4gT3RoZXJ3aXNlIG9uZSB3aWxsIGhhdmUgdG8gdXNlIDphcHBlbmQgdG8gYWRk
IHRvIHRoZW0gaW4gb3RoZXINCj4gPiBsYXllcnMuDQo+IA0KPiBUaGF0IGRlcGVuZHMgb24gd2hl
dGhlciB5b3VyIGxheWVyIGlzIGluY2x1ZGVkIGFmdGVyIGNvcmUgb3Igbm90LiBJJ2QNCj4gaGF2
ZSB0aG91Z2h0IGluY2x1ZGluZyBiZWZvcmUgY29yZSB3b3VsZCBiZSBwb3RlbnRpYWxseSBwcm9i
bGVtYXRpYw0KPiBhbnl3YXkuLi4NCg0KU3VyZSwgYnV0IHdpdGggKz0gdGhlIG9yZGVyIGRvZXMg
bm90IG1hdHRlci4NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQpXZSBoYXZlICJt
ZXRhIiBhcyB0aGUgbGFzdCBsYXllciBpbiBCQkxBWUVSUyBpbiBvdXIgc2V0dXAuIEUuZy4sIA0K
dGhlc2UgYXJlIHRoZSBleHRlcm5hbCBsYXllcnMgSSBoYXZlIGluIG9uZSBvZiBvdXIgY29uZmln
dXJhdGlvbnM6DQoNCkJCTEFZRVJTID89ICIgXA0KICAuLi4NCiAgLi4uL21ldGEtdmlydHVhbGl6
YXRpb24gXA0KICAuLi4vbWV0YS13ZWJzZXJ2ZXIgXA0KICAuLi4vbWV0YS1tdWx0aW1lZGlhIFwN
CiAgLi4uL21ldGEtZmlsZXN5c3RlbXMgXA0KICAuLi4vbWV0YS1uZXR3b3JraW5nIFwNCiAgLi4u
L21ldGEtcHl0aG9uIFwNCiAgLi4uL21ldGEtb2UgXA0KICAuLi4vbWV0YS1wb2t5IFwNCiAgLi4u
L21ldGEgXA0KIg0KDQpXZSBoYXZlIHRoZW0gY29uZmlndXJlZCBsaWtlIHRoaXMgdG8gYXMgYmVz
dCBhcyBwb3NzaWJsZSBtYXRjaCB0aGUgDQpsYXllciBwcmlvcml0aWVzLiBJdCBpcyBub3QgcGVy
ZmVjdCAoZS5nLiwgbWV0YS1wb2t5IHByZXBlbmRzIHRvIA0KQkJQQVRIIGluc3RlYWQgb2YgYXBw
ZW5kaW5nIGxpa2UgYWxsIHRoZSBvdGhlciBsYXllcnMgZG8pLCBidXQgaXQgDQpoYXMgcmVzdWx0
ZWQgaW4gdGhlIGxlYXN0IHN1cnByaXNlcyByZWdhcmRpbmcgdGhpbmdzIHRoYXQgYXJlIGJhc2Vk
IA0Kb24gQkJQQVRIIGFuZCB0aGluZ3MgdGhhdCBhcmUgYmFzZWQgb24gbGF5ZXIgcHJpb3JpdGll
cy4NCg0KLy9QZXRlcg0KDQo=


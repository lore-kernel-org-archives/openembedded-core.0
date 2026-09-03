Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA79CC624D7
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 10:58:05 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5038.1788433081534811054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 03:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=Qv5GSasn;
 spf=pass (domain: ericsson.com, ip: 52.101.70.63, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxA+u42ipd0eOUKYxlGSfB6mn5wuBuVj5v24tQgNlBHC2i7wB7kBy0uEPKbhuaWCd7xrzBDCP4Las7jvOKjJe50RtPCXKWR8THz/qKzPWYwpNv2LLT/5eCG02h87qWle9Z6m63KIhbvZnP2jqd9DF5qTsC9mfKZjrFmF53YW1CG9diWYR0SDCn3cw1mYyLyDtVzckAstGLmpqEDrCzIcTtBYanZNM87hcM6xqBPZPkfRbFdJ0sf54hvtpFJ3zawcEE0byGnrbmcrzklXiAA1Y2/IO/p/Y2ZuwuCVJGI6BOrJxkRRFsjyBG5DTgICbJjPhMH0D7yQZlX+kIXKQ7hofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aK3GTexh9qxJY1bwBVDNwwv/DAo+i5KapM4py1YDjT4=;
 b=tC4GolT/Pbw1M6qgLirjQxUgDb2+KJMlxcesNTST6aejY6jOSlBsDtmnPHDN4gVtNLXceIgeWFCu7ZV31MPL/Af7ZMqd3C1JqZaq6Oy9GzK+pGSybYEjyQImFOgsIBaAzXtVpKumStKs4wAqASUmsDqC06kxzTj0BHYJbxopb9tOPZcGOf1KgbNhME4AMnCwKqL1HoLMw5a8nuRuQH1HdL7ZgziK0Atz3rKYLz5Qj69vEynsHHEF3GiB3hIeATS3p/ERkT5TV7+BRHGMgIURsWejoO/cnBeAb3MwP5gemTOBSw8KOV5zG6HIlNcxYdBIH6aHTa99mg98xh+dmVNfXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK3GTexh9qxJY1bwBVDNwwv/DAo+i5KapM4py1YDjT4=;
 b=Qv5GSasnIor1SJbXpuM+ghFGDgnOZ/8d29riipIm9z45ZLkIwj0z4pUtXCBp0a6Z14LXBm/DZfNcu6DCtaLUaj/XgDA6nIhCSHDsA8dOwBqYcTO4ePrNNUB6KQi96IBmJPMV420ChSR5u6CeK8lRkukZIdQe77VqDXNeOLt9XORP9klAWBtHEQoRVd5+zjFFI6jJTkswMHtqn07Y/91f5dKv3oRsl0r5nyhcDXFPM7LFdHVC/AN83MgPAGEvFzp+6I0xYaLvxieow07cxYYUK/N7Y7LsQ7W9lOUE9Zvt5VgOsFzF3sGW/t/ea5mlFMRpx5vdK/02EGduE+32UyBfUA==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AS8PR07MB8071.eurprd07.prod.outlook.com (2603:10a6:20b:35a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 10:57:57 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%2]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 10:57:56 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] mesa-tools-native,mesa: upgrading to
 26.2.2,26.2.2 SUCCEEDED
Thread-Topic: [OE-core] [AUH] mesa-tools-native,mesa: upgrading to
 26.2.2,26.2.2 SUCCEEDED
Thread-Index: AQHdO2ctJXtJ72IJUEepGHCmfUtaF7a8aSsAgAAXQoCAAC7KgA==
Date: Thu, 3 Sep 2026 10:57:56 +0000
Message-ID: <33bd5f2a0700a451a472a20c48027824789cad47.camel@ericsson.com>
References: 
 <010101a065cacddf-8c4c8571-518d-437d-988e-c3642ad3b435-000000@us-west-2.amazonses.com>
	 <24c12b9706da066e59f1581c91a8f238f5fe83b8.camel@linuxfoundation.org>
	 <CANNYZj94sKa-ziuwUpmfZSN+xjdgnM7ir_U8-RHiPjphjO5+dQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj94sKa-ziuwUpmfZSN+xjdgnM7ir_U8-RHiPjphjO5+dQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AS8PR07MB8071:EE_
x-ms-office365-filtering-correlation-id: ae19fecf-e045-42e5-15b7-08df09aa3647
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|38070700021|4143699003|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info: 
 2rsav+0ThinvHBpWBCAc737MmXYzinCWoMNDHX1fk2bxyCGoHm9I00/4HEVQF1G/XKM4pbMKL5a1pJk3Vy5ClNmeRi5kDpezuGdW21u//Ii0VmpKP970D9K8KCm6ux7a0QpXv90/xpRz++wb4eWcpgKhsw/C0nQ75zOymVRFtGTs7Yr2GhdacnOAxULror5tIr4dRcTBCDAhzxPZiS/omKQfiF1AVsOJ2DdyLf8DVXTgQX2HaRZy5vj1Eb7Axdr1AzGlNX9H4USSkoT0v/nOu9yFzJXCbqpmgEQX18i6lGiI13u7ZsdpdF48pZyJtINbaYX1/DnbFX85Graj2FrHMo5HJNM09LKHHT9GZI7flm9w2jHyW6jTUmgX47MkAQIlJvFTrjc5kPfeFsugYy+bn29VX7KHzwhQJO5bAePkEkuCB4lvSiKin20+E+RZKCBPjK8/l1no2g+LVrE9voWJFflCuJvB0OTQTaLX4wbtYz6FzpjyTq/XtaBp9ZiVXCQ35dicppqQ7J/FOBwSDHXopzycY9DIeDCyGN3BqTIdaL08dQE+KcuySE72g01cA7+9kzCfrfWW4xFxJ7w+u8/x1Ypa4TO3bZg7kgjQbfLd1tZYsdozVBBXd7MpLVT2F+GF3grZntySL4JwYKlOvAw0JU5b7wYXvgLfp6FR44ITnglEai4ci18U5k7Qsq04lfHmo4rlIZEeUwAAaI1nfPogOg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TFlEYzYrcVozbjJwSVlqT085WjJZQ0FuS0lWdEhVQTlycGxCYXRZbktFZnNY?=
 =?utf-8?B?L1FpTUNXcXpzbjFIQnl5Z1hSU3ppV2FNLzZ5Ym13a2F6UllHMW1hVkRNNXFV?=
 =?utf-8?B?WFRIcXl2dDZaZWxPN3N4cnZCT1BVck5QOEdQc3ZJQ2FOTEJHOWEwcHhrNVI0?=
 =?utf-8?B?MDNCOGxaTmk4cWJTV1JlQ1VYUGpmMFdUWFNWeERWcExEemVZeHJHSlhSeWIw?=
 =?utf-8?B?L1MwbFExeDJaeUZLR2xzdjZOazNnd25MMlRuWWhXNXAvTXRTSmtGa1RyMlJq?=
 =?utf-8?B?TDlmV2hMc3ZsV2Z2WE5HVmQ0bzU5dTdoZlRoOXhIMVk0KzEyL29ONTNOeS8r?=
 =?utf-8?B?T2k5U3JObTZhY0tJWVV3UXpEOGZXN1oyekFnOG1xS0w1Qk5ibU51djAzNXV3?=
 =?utf-8?B?OVVsZWhGQXBvMTlDbEFaeTB1cFNHL1dqTWZyUTZlTzdianpQZXgvN0pBdHFl?=
 =?utf-8?B?SmF1Lzl4eXV0SzhpaWFUYlFyVGpORnQzM1UwMElkUzNCSXI1SURTQUJxVmgw?=
 =?utf-8?B?eHNISVRDV2RZMmg4bHJjUGhxQkxRb1JLb2dGVDhGYk44cExIZzAwTlRWNXIr?=
 =?utf-8?B?TXcvRWptSm5WbFFMa1VIY0FJNFNlOVNKS0UzMG1jdUZKcjJFeGNQQVRDT2NC?=
 =?utf-8?B?SDRzSk54NFhkOFJodHptSlgxZXZ4VUpabitqc2EydDE4cGtPeXNaT21TYVR0?=
 =?utf-8?B?V2dlMjUyYktyL0xObE56WERGWENpTHBmcjRQcSthU2N5WnYvY2pwVGhicWlB?=
 =?utf-8?B?L2tVQVNmWHAzOE01d1djNHRRejdWakRGNUphWWlFcEJyT0pST1BPTzJHNFVJ?=
 =?utf-8?B?ODFRcFpXb3dDbEZHaE5uT0FRWmlMam9FbkhDVnZKem5tTzB6YUhxUmtZN0Vu?=
 =?utf-8?B?M1hKU1pQRDlvNzBSTG9rNVZGZEJ3ZjRXYUV3aDNpVXZ3a2R1MSsxRUZIc25a?=
 =?utf-8?B?a29UbGFkVWVoZlNVREd1WW1uLzdlNW1odHUvbXZSUHE4RVNNVXRtRXl4ZVJs?=
 =?utf-8?B?QnpSK0NxQXZuZllvdVhubzEzdHkydGt1MWhtZllsZXZ0VVlxcEE4eUdlZmxu?=
 =?utf-8?B?UTFlZlliMHlzYzN6N3h6eWVtNTg3VGd6b3dueG1IeFpDVmM0OEhPUzdzbkJQ?=
 =?utf-8?B?Q2k5R3g3eFkxQ1dEVXJWNk4yVFdaU0laRWJxTTZjTHRtTk1Ta1c0ZHBLRFBR?=
 =?utf-8?B?U1drZ3Nub3B4TTA4c0tFMzZqWEhLWncvT3ljdDJKWmx2TlE0SmVhZVN0VG15?=
 =?utf-8?B?YXd3OWh6WldiNHFEMjgxMHorT3kzVGFLVmwybTFhSkt4MmtnTTlQMHdpaE82?=
 =?utf-8?B?Zk1HcVJPaG1OTHdPUmlhcmtOcUEzQWc5TXFHRTBkUnpKWW1wbi9CdDZSTmdh?=
 =?utf-8?B?aDBiOVU3MDJPOHFpUGp2V3UxSGtUOGNZc1B4cjJ1WWUxbndxZnJkazdYUHFx?=
 =?utf-8?B?TVZHSCtSSTBmSE96Z0RKRlNkdithQldpaGJFY3NCc01yYzZBRU1LRDQvZzVr?=
 =?utf-8?B?Y1A5NGNQYTRHbkp6dTBJcHRiQ1lQckpnOCtWZE5ITnZMTzhrMDNWWS9IUi9W?=
 =?utf-8?B?TnBhTm11QUhtTkRrN0lCRTVTRks2enM2RFJLN09YOXU5OFZ5cktLVkR1Mmgw?=
 =?utf-8?B?VnhmSGZtYS9oZGt0ZG5JVEs4Q1ZCQWhhYld0dGd3RmMzUjlVUDIwYTBNMjNP?=
 =?utf-8?B?RU9xaW1jSVF1YVFTejJEZUZXQUVHd0VFYVh5NEdJcDZ6QUg0Sko4MG04cGVz?=
 =?utf-8?B?T1BQaDdNM283MUVIanQ1YlBvd1RSL3N3NkptcWJPY0FKQzRibk5tQm9qeDNu?=
 =?utf-8?B?OUlYM3R3V21lMWtDc3RMOVFXNndrbjV5aFozZHYyVWJseXVCWGc5UUdjV29k?=
 =?utf-8?B?MEh2aTBBVHRBdnFlNVJmWmtOSTVuNWJBYzhhOHFDR2ljbnRDTi8xYjJjc0p6?=
 =?utf-8?B?Wkg3a0Zibmc1dnFYSVg2ekIyeGM4bVBFQXZhdlo0bkpBNUpYR0xscUFkV2Iy?=
 =?utf-8?B?em9YdXgybkxkaVlXVmJVZWVrdHF6ZkFSd1MwR3lpdUkxRXd4b3lXUExEV2cz?=
 =?utf-8?B?UjFVb3VVTnpFaG1VUHVnUVJhaGRWanRxR1RwZlBIcmo3OFU2MG50SzIzUlBw?=
 =?utf-8?B?RjZyYklNSWlqRXo0YWdTZVpQWnVrb1FvTnZkTGcxTERPUmorbkhucmQ5ZFF4?=
 =?utf-8?B?MVNXc3ZRemoxUVdRbDFQaUwrcTB3UTMzNDJ2ME5XcXhQK3dtYWp2amxOUlQ4?=
 =?utf-8?B?Vlo2YTFCVHpPMHhkVzJrYlp5enZlcGhPWnQrU2k4cVl3Y25ZNUs3SzJuSkYv?=
 =?utf-8?B?bkQ3dHBMS0RyeGNjRjd5Y09wZ08yZ3VPWFhvQ3NBNnRudHVMRFJrdnRybDVR?=
 =?utf-8?Q?1yN2DkHVf/qBCkek=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1CB35992A354D41A4141A8886A128A5@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae19fecf-e045-42e5-15b7-08df09aa3647
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 10:57:56.8782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: glu8Mr2j9HBuAtrJ1ezpSGx4RpWf0Q7B/v90YMw9POM75sjPF4MPLphb0H8uCV2kXGvL5G3Bq07reJjI+l67QQb1kjes8cLs6wtUg3GFztU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 10:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245027

T24gVGh1LCAyMDI2LTA5LTAzIGF0IDEwOjEwICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gVGh1LCAzIFNlcHQgMjAyNiBhdCAwODo0NiwgUmljaGFyZCBQdXJkaWUNCj4gPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiANCj4gPiBUaGUgY2hh
bmdlbG9nIGlzIGEgYml0IHdlaXJkIG9uIG1lc2EsIGl0IGFsd2F5cyBzZWVtcyB0byBmaW5kIHRo
ZSBOLTENCj4gPiB2ZXJzaW9uIHJhdGhlciB0aGFuIHRoZSBvbmUgaXQgaXMgdXBncmFkaW5nIHRv
by4NCj4gPiANCj4gPiBJJ20gYWxzbyB0aGlua2luZyB0aGUgQVVIIHNob3VsZG4ndCBpbmNsdWRl
IHRoZSBzYW1lIGluZm8gdHdpY2UgZm9yIHRoZQ0KPiA+IGNoYW5nZWxvZywgb3IgdGhlIHZlcnNp
b24gaW4gdGhlIHN1YmplY3QgbGluZS4gSWYgaXQgaXMgdGhlIHNhbWUsIHdlDQo+ID4gZG9uJ3Qg
bmVlZCBpdCB0d2ljZT8NCj4gDQo+IFllcywgZGVmaW5pdGVseS4gQVVIIHNob3VsZCBiZSB0d2Vh
a2VkIHRvIG5vdCByZXBlYXQgJ29sZC52ZXJzaW9uIC0+DQo+IG5ldy52ZXJzaW9uJyBpZiBpdCdz
IHRoZSBzYW1lIGZvciBhbGwgcmVjaXBlcyBpbiBhIGdyb3VwLCBhbmQgYWxzbw0KPiBkcm9wIGNv
bnNlY3V0aXZlIGNoYW5nZWxvZ3MgaWYgdGhleSdyZSB0aGUgc2FtZS4gRGFuaWVsLCBjYW4geW91
IGFkZA0KPiB0aGlzIHRvIHRoZSBsaXN0IG9mIHR3ZWFrcyB5b3UncmUgcGxhbm5pbmcgdG8gZG8g
cGxlYXNlPw0KPiANCg0KU3VyZS4gSSdsbCBhZGQgaXQgdG8gdGhlIGxpc3QNCg0KRGFuaWVsDQoN
Cg0K


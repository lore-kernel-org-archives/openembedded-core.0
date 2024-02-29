Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DC3C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 11:56:42 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web10.22928.1709207796269125223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 03:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=kPityekI;
 spf=pass (domain: axis.com, ip: 40.107.20.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAYX19NhKNBk1Zn/yxXKRu9y6tsCHc+o8h0hVYqLJ4v295HGNLWI5v/hLGXq/rMUj6O+Nh3IMAHjhUSylAUJqq5IDIQUB2Tk5u3Ci70DQKsMDopQBqCvEyOERUML4v3eHlspRKIMZuCyBzVgsMfvv7MqDEs4c8xc8IVkiA7fA2D5lQ8e135RN0QHBF5ZsYDp+NXYG4M1d4/UeXsXu26LmhMN5fvQGt18NB8/P7EIWMVvteBnBpNvaqcFxiyDc35fY7OdPnQQT2bJrQZGPvODTnQyquZcHYuFuuHGTrAhFBvUaOuchrfCvGW4MTILkjQ6dbdhdNhz2ACk9wXj/C2PNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOucacgYxr0TcIUeEr/EWM3oq2CrTAx2OYZP1Ww04wY=;
 b=QaNcjtblnmTIeF3rI1sULBfqgA4SGdNFaLjYX359R6B8gahxMMp575FrdOgl9N6XHjhq5UKdu1LU90vLtC3OCbGUaPKZW8/QwHT7qV9LV/xxSp8UPkYdXF1EPU0TaNdr1whYF5CbF3Fd4rRotIrdMDJmimTN/j04YICeyBo+XHgkyat8y6iXKu/sLXOwRgrm5ubIK8HXoaj+b1xWdxX9fyyD7nnnvWYChBK9GYUR1yRT+L08QGB8nnJX8vEmeIAobwPThvLPmMYWYdY7X0LaeZvsDo+8EvlL0HkwkV9m2sWkEYxlx7Yro1myH+JEpoY3mWKmy9f7yMciw0UhgYU9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOucacgYxr0TcIUeEr/EWM3oq2CrTAx2OYZP1Ww04wY=;
 b=kPityekIZy4TbGkHeeCYyfI1xt1Jm92wXQPfiQDNM5rHXiC8Upz7KO6rD9VXRtNO78j+Y0LP8QwRaTFHomUB1KYsLthc5zB0/Zmvz50A4/15RIQPbbf57g8ddu+0ZMEGQo/XQqsqiE40mUZzB809uzYKHuSgxlDfyx7LoBZK6DU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB4PR02MB9310.eurprd02.prod.outlook.com (2603:10a6:10:3fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 11:56:33 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7316.034; Thu, 29 Feb 2024
 11:56:32 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Changqing Li
	<changqing.li@windriver.com>
CC: Changqing Li <changqing.li@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
Thread-Topic: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
Thread-Index: 
 AQHaaTuCLiBd9ACgUkO7d/HlVhlEdLEd7C6AgAErNgCAAGvJgIABUleAgAAzhACAAC/wQA==
Date: Thu, 29 Feb 2024 11:56:32 +0000
Message-ID: 
 <DB5PR02MB1021305D36FC512A6EE3AC1CAEF5F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240227051155.2166683-1-changqing.li@windriver.com>
 <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com>
 <73e51c29-1405-4722-8feb-45536c5648f2@windriver.com>
 <CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com>
 <f7653561-00d7-48cb-83d6-1dfb8cd6d4b2@windriver.com>
 <CANNYZj91UZ944b4a7vEC0bUyEPoYdvD5fE4w=-xUHd-wVdXaoQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj91UZ944b4a7vEC0bUyEPoYdvD5fE4w=-xUHd-wVdXaoQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB4PR02MB9310:EE_
x-ms-office365-filtering-correlation-id: 32e78d92-5327-4f88-ae91-08dc391d792a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a3Mc/7HVwbcCBCRLDBJAkV0n19s8JWx711vlbUFjak2/KyZbpIMUSeOmp8kZrMiqYQ0cDM/boEF0NWrW7ibEFJtH49SlhXxSbhJk+D/J5sTJYlTYIba2hWBA9FmdmIjWY94Ir9kJ9MNuHKldrz6IU0JTL7SqI/LuqvpFSQRKI3sIgpMQ4xXr9AcY6urB2AJi320pkKmuI1zjWSco2pRrt/nofW+Zg3PuVcWIJ2QpiFUYnCtP31iyAuLFkMOX3lcPLLORn83kFcJ0by+OWD/RY2h9nktj4SujCHCUppAXJDKLSxYPlQ323KpajgtaKO+l0YkG2gVZ4qTQKoV6b7u8vxtlvqx1J+gcC5R4d1bpu97NA3H/8eTon/mMu4uff0ZeOslzEOKUorBVPByCwo1axy14Yb1l7+rYcvQRwHiy9FeeoDwG8g6FAhn+uVZPQlWRRtbpq/3ip621wJjM7sxNQ38fkmQt9IdHJF4p+lwdKFXP8rBwf5OwCoI1M+yx0+Oj6WCB79eZDMVLTsmZUNs1iKGwmEbaQMTMhaWCUVhD3vcQOVBi0xYZNpVQ2wVddjrg/LcWJz/APaqLdm1+QFtf9j28LOcZ1HzmrtEoVXIDjW37r1Ghq2Yv9QrAIdRCo+g9ZDAkLMCaJ7eePUPlD3scplYifFAJBmcal/Qs0vjzP4fk0ZherIVY1INxctgCg2zm0b332Qhi72NkNXtpBfBGcXw9ZouuLIfyAfK+mXKqiBQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZFR3a01LZjhxeG52ZzYzQTFCS3lZbndsVXFNVGtzMG9wc2s1emZ6Wk9UcXlP?=
 =?utf-8?B?U3pPclNpMU5ZWElRVjRmaUZiSDk2N2ZVVm5hV1VNY25OemdlVEpGNDYwT3dE?=
 =?utf-8?B?NXJnaVNCalphazI0bnNseWVOWUNNSzRlRUNRV2JWUWlzY1h6YXBzTGdVSGVB?=
 =?utf-8?B?N3NBUGRwTDdWazNtREJRamdtZ2xIRFJoVzBzZFY0NjMyVjNmT2UwQUFTL2tT?=
 =?utf-8?B?ZVVpV09wdUFnU1Boa2RNRU9TekdGcEloSHpzRnVkS0JoMnVVWG15MThER01V?=
 =?utf-8?B?NmZZSDA2dU5YUlVMaVJSK0xKNWpWZHM1NGxBc0pTd3R3UngzSzhNd2JrWVBa?=
 =?utf-8?B?OEV0VDRCdlJLOWx3aXlDVXQ5U0JYK1owaUNWemxIYnpkWHUxVkMyL1BzMG1u?=
 =?utf-8?B?VXB5UHdpc3NmaDgzaVZ0NWNoSDAzeGdVNDA3aWdlUnl5MUVYcmQ0YzdTYjhL?=
 =?utf-8?B?eCtLb05BMnMyT0orNU5ERXh6eHhHZzBLNU43N3FObE8xcVU0cWpMTGxodXVO?=
 =?utf-8?B?ZjMxVmROaXpmZ0g0KzdSTW1salFXUG4vV3VDQXdOWE10U3RIdFFSSFZINk9O?=
 =?utf-8?B?VkpoS1lkdzlTVWZFV3B3bGhtenp6d1JKYStPVEtpazhPY2pRdWhQQjljVVRK?=
 =?utf-8?B?NFNrckVMK2c2WERTbVA1Q1p1Unl0dmREUHp1TmVnMXN5VitiOG5xL3dyb0Fw?=
 =?utf-8?B?Sk5qbFA3NlZ4OTdjTlEyMVluR09lVHB5c1F4bDJCV3FYWDJJSnVIRzUwbTUv?=
 =?utf-8?B?cWJtRDhwZUF4Z0R0Lzh1OVFYNXk0T2VLQkhGUTl0UHUwaXZrWUNLekpmOUs0?=
 =?utf-8?B?YnB0VTdNQUZQdnFBb0dRZklFd3h3UmJ4VXFIVXNnVjBKRXR2OGZjWEYzekxk?=
 =?utf-8?B?UVJsQ2lrcFVqb3p5OFF0bDNnck1JNEpyS1RaalczanBBRmMrNTIyNDNrcjNN?=
 =?utf-8?B?MHNQa0pyRXFtYno0bHdpNzFPbHVhT0pZS3FrTC9WNzkvVGE3QW1EVnNJTGZa?=
 =?utf-8?B?Y3hQOWR0VmZ5MEgxaVN0eDBPTUJpeDR4V1pMemVEaG5sQkpLUDFhMjFKVGhw?=
 =?utf-8?B?Nkp1eDRCb0c1OWNDUkp6eUljRkViSUNuU3VXR1VBZlpuK0puK2o1Y3BBand4?=
 =?utf-8?B?Mi9pWkM5OHEzU0hVVnlJQkFCVzlISXQ0NHVPQVg1ekUvU2doUDF5QU5nY0VP?=
 =?utf-8?B?VXE0OGRCSjJONVdmNldNWTVYUGE2QWI4NGRQWXRvOWNjM09pSmhzcGgvU05T?=
 =?utf-8?B?UzBxTXlsTXdEVkhIcDlUOGhMOUR2QWQ3YXRRZXFFeksvRWJOTDhwVkQyVWQy?=
 =?utf-8?B?RnE2RTBETEdTNHYzMEdlUGZVMGVEaksyY1I1WVd4cTBKY05CYThCUjBIbDRo?=
 =?utf-8?B?VzZNSTlQdlVURHdSZEpBRjExcWlvbitScmxQSlp6aldzMC9WbHhtTzBKT1dT?=
 =?utf-8?B?czV3MC81ck82OWtiUG1FK3lkTDFPZ2ZmQ21WaHlLdXFzQkl6RE5wSWFmMDRm?=
 =?utf-8?B?aUJDekRMd1Z4VDM0UTkyVnlmR1ZYeUh1dHVvVS96QnAxN1ptbGJHL1h0azU0?=
 =?utf-8?B?SFloaWRNbWtlcEV4Nlk3dnp0dVNBc1IyTHU2T3ZUM1h3ZmRWTnJwLzVZSnFq?=
 =?utf-8?B?UEFjV1I1UnBQN3ExOThnNUJNbElDd01ZS0YyMFVIYUgrZ1lKTFc3M1BJdUNH?=
 =?utf-8?B?b0JYMGxiTDFGVzRSaE94REp5QXNiZ1ZFN01vK1YrelpFQkxLYTFXMFB1NVN4?=
 =?utf-8?B?Y2N4Q0s0TGxjRW1nK01Zb09HaUs4WWl2MjkwVElJSnZjazdkdXlQVzhGWkow?=
 =?utf-8?B?SURDV3o5bjVvUDZsZnhReWl3bEtSa3VBVEo2U2M4Qk8zQ2oxQk4yVkxQUEJB?=
 =?utf-8?B?a2d0VmZLS0g2SzQwNEg2M2cxL3VncVBIY1RuVUJ2RloyMnBTZDdFdXpKc3c4?=
 =?utf-8?B?bVFkNytzbjBFeUNnalJ2UmthRVJDMUxxNkl3VkxiUWVUMDQ3Uk9nbTAzT3Z6?=
 =?utf-8?B?YjIrdjE0K0kwY1htKzlPMkV1aXFXdmg2bFNEcHI3Z3cyQ0dBUjF6T0xUaTA3?=
 =?utf-8?B?ODFDNkllMVR1YW9KOGpuSjRHOGlNTWZEMEx3MENSSnFsS0hRMmdJQTdKOFU1?=
 =?utf-8?Q?OJqM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e78d92-5327-4f88-ae91-08dc391d792a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 11:56:32.9395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arq3MfmZHvEIDw8FgtbSsdQnnx6pbZJ+9skfIGhrS4CUjeSH9c4QS3yCXbJTS/Ro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9310
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 11:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196429

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgQWxleGFuZGVyIEthbmF2aW4NCj4gU2VudDogZGVuIDI5IGZl
YnJ1YXJpIDIwMjQgMTA6MDENCj4gVG86IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRy
aXZlci5jb20+DQo+IENjOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUBlbmcud2luZHJpdmVy
LmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggVjVdIHN5c3RlbWQ6IGZpeCBhIGRlYWQgbGluayB1bmRl
ciAvdmFyL2xvZw0KPiANCj4gT24gVGh1LCAyOSBGZWIgMjAyNCBhdCAwNjo1NiwgQ2hhbmdxaW5n
IExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4gVGhlIHNvbHV0aW9u
IGlzIGFsc28gZ29vZC4gQnV0IHBhY2thZ2UgIiR7ZG9jZGlyfS9zeXN0ZW1kL1JFQURNRS5sb2dz
Ig0KPiA+IGluIHBhY2thZ2Ugc3lzdGVtZCBtYXkgbWFrZSB0aGluZ3MgbW9yZSBjb21wbGljYXRl
ZC4NCj4gPg0KPiA+IHNpbmNlIGluIGJpdGFia2UgLmNvbmYsICR7UE59LWRvYyBpcyBiZWZvcmUg
JHtQTn0gaW4gUEFDS0FHRVMsIGFuZA0KPiA+IEZJTEVTOiR7UE59LWRvYyA9ICIke2RvY2Rpcn0g
IC4uLiIuIHdlIG5lZWQgdG8gYWRqdXN0IHRoZSBzZXF1ZW5jZSwNCj4gPg0KPiA+IGFuZCBtYXkg
aGF2ZSBpbmZsdWVuY2VzIHRvIGN1cnJlbnQgbGlzdCBvZiBmaWxlcyBhbmQgZGlyZWN0b3JpZXMg
dGhhdA0KPiA+IGFyZSBwbGFjZWQgaW4gYSBwYWNrYWdlLg0KPiA+DQo+ID4gU28gbWF5YmUgdGhp
cyBwYXRjaCBpcyBtb3JlIHNpbXBsZSBhbmQgcmVhc29uYWJsZSwgYW5kIHdpbGwgbm90IGhhdmUN
Cj4gPiBvdGhlciBpbXBhY3QuDQo+IA0KPiBUaGF0J3MgcmlnaHQuIEl0J3MgcG9zc2libGUgYnV0
IG5vdCBvYnZpb3VzIGhvdyB0byBvdmVycmlkZSB0aGF0IChJDQo+IGRvbid0IHJlbWVtYmVyIHRo
YXQgZnJvbSBtZW1vcnkpLg0KPiANCj4gPiBUaGF0J3Mgb2ssIGJ1dCBjYW4geW91IG1ha2UgZml4
aW5nIHRoZSBwYXRoIHRvIGFuIGFic29sdXRlIG9uZSBhDQo+ID4gc2VwYXJhdGUsIHNlY29uZCBj
b21taXQgdGhlbj8NCj4gPg0KPiA+IGlmICB1c2Ugc29sdXRpb24gaW4gdGhpcyBwYXRjaCwgIGl0
IGlzIGJldHRlciB0aGV5IGFyZSBpbiBvbmUgY29tbWl0LiAgSQ0KPiA+IGNhbiB1cGRhdGUgZGVz
Y3JpcHRpb24gbW9yZSBkZXRhaWwuDQo+IA0KPiBQbGVhc2Ugbm8uIFRoZXNlIGFyZSB0d28gc2Vw
YXJhdGUgaXNzdWVzLCBsZXQncyBkZWFsIHdpdGggdGhlbSBhcw0KPiBzZXBhcmF0ZSBjaGFuZ2Vz
Lg0KPiANCj4gQWxleA0KDQpHaXZlbiBob3cgbXVjaCBjaHVybiB0aGlzIHBhdGNoIGhhcyBnZW5l
cmF0ZWQgZm9yIGEgZmlsZSB0aGF0IHByb2JhYmx5IA0Kbm8gb25lIHdpbGwgcmVhZCwgaG93IGFi
b3V0IGp1c3Qgbm90IGNyZWF0aW5nIGl0IGluIHRoZSBmaXJzdCBwbGFjZT8gDQpUaGF0IGlzIHdo
YXQgd2UgZG8gd2l0aCB0aGUgZm9sbG93aW5nIHBhdGNoOg0KDQpGcm9tIDQ5NDgzZWZmYmNiOTIw
ZDA5NzQ4N2M1ODIxNDUxOGYyZjNhOWQ0NzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQpGcm9t
OiBZYW5nIEx5dSA8eWFuZ2xAYXhpcy5jb20+DQpEYXRlOiBNb24sIDIwIEp1biAyMDIyIDA5OjA3
OjE5ICswMjAwDQpTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBjcmVhdGUgUkVBRE1FIGluIGxvZyBk
aXJlY3RvcnkNCg0KLS0tDQogdG1wZmlsZXMuZC9sZWdhY3kuY29uZi5pbiB8IDMgLS0tDQogMSBm
aWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90bXBmaWxlcy5kL2xl
Z2FjeS5jb25mLmluIGIvdG1wZmlsZXMuZC9sZWdhY3kuY29uZi5pbg0KaW5kZXggNGYyYzBkN2M0
My4uNjJlMmFlMDk4NiAxMDA2NDQNCi0tLSBhL3RtcGZpbGVzLmQvbGVnYWN5LmNvbmYuaW4NCisr
KyBiL3RtcGZpbGVzLmQvbGVnYWN5LmNvbmYuaW4NCkBAIC0xMiw5ICsxMiw2IEBADQoNCiBkIC9y
dW4vbG9jayAwNzU1IHJvb3Qgcm9vdCAtDQogTCAvdmFyL2xvY2sgLSAtIC0gLSAuLi9ydW4vbG9j
aw0KLXslIGlmIENSRUFURV9MT0dfRElSUyAlfQ0KLUwgL3Zhci9sb2cvUkVBRE1FIC0gLSAtIC0g
Li4vLi57e0RPQ19ESVJ9fS9SRUFETUUubG9ncw0KLXslIGVuZGlmICV9DQoNCiAjIC9ydW4vbG9j
ay9zdWJzeXMgaXMgdXNlZCBmb3Igc2VyaWFsaXppbmcgU3lzViBzZXJ2aWNlIGV4ZWN1dGlvbiwg
YW5kDQogIyBoZW5jZSB3aXRob3V0IHVzZSBvbiBTeXNWLWxlc3Mgc3lzdGVtcy4NCg0KLy9QZXRl
cg0KDQo=


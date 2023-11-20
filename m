Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6486BC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 22:54:15 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web10.19469.1700520844746531794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 14:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=b/jnQkCv;
 spf=pass (domain: axis.com, ip: 40.107.7.88, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbELrlwUvHWQuVdiHY59rwXdQlcKvchOp0dLTjvvQwx0eSKUD4yawsdY+ifQHLLacuRwx6jHPQQpbJH13IYwpgPr5tiE9NBBfvtlVqzGTkcMcBvGxYa4GhUuiKdncQpRCYm7cOQ0Vw2fMqBxLqCO6djTCnQ53XAonU7psb11UqRg02vhTd4OtRGWdbpSSKVRyI3RTUTFHNQFT9TV5O3459O/8I96t6Pg8a473THiHAmaHyNpdEDLn9CHdkDjQBUonzL1s37xXasqqkyCNOTzWqLuNLpM2cBiLrIJ6JFKv0xH3pPKAzPsuzaMCW25ye/tkUzyqyyski84XGqXhLzQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Br5pQCTGlEiMgBt18UmUgTVdpasi6dLpcU4Bz9fDrqw=;
 b=C4Vp/ExUzVhEE8/gd1Rn9tD8hwx0atplNp7YQVOK9zYUCNI1Bh0+y596YlJ4pTuSF8VtbE7gcLmrFVc+wcHvaLPh8y6rDIYtNtTQ8uo1YUUkbdhD8vb6tckqnxM2B39+x8QkVgwmIEuQZYHalHXESBB7layE3BuxSTsXLr9umH6HaXlH6Jz4Jh0kx7W3mp05uyCHn9ycAmxz2LLP5YMrC1jLq3LVPL7lCNaCcPIxbXwwxTMyyl2rDQp8vjTe8uvo2ZWSqSW7B3CglLh575WFrSz4vm3SCAiFlMRRvl21QdXgLFJJbpAKgQHLzD82ucQmrpJPVU/vCgCmZBuO629PSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br5pQCTGlEiMgBt18UmUgTVdpasi6dLpcU4Bz9fDrqw=;
 b=b/jnQkCvRFmnjPPdCLQP89vtJ/t1vikM9UiJe1TT3RuSfETbuDBk7ONOw+qvFSvIBiYrySkrbaB9rRgrTIxc9ibzGGuk71hpCZca7hZrIgnWjZIRe4r36dsYHo6ZCvqhbz4Uqqo/3yStPV22Agq/eLcDEJHWyUsd0Fh47bsUeXE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS4PR02MB8742.eurprd02.prod.outlook.com (2603:10a6:20b:58e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 22:54:00 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e%5]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 22:54:00 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, Christopher Larson
	<kergoth@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v8 3/8] image-combined-dbg: make this the
 default
Thread-Topic: [OE-core] [PATCH v8 3/8] image-combined-dbg: make this the
 default
Thread-Index: AQHaDLLnWYDFEaWgxUS0boZxBJssxbBtVwAAgA4ttICAACLbAIAAZmWAgAfZ2rA=
Date: Mon, 20 Nov 2023 22:53:59 +0000
Message-ID: 
 <DB5PR02MB10213E5FE440BEAB46DA58849EFB4A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-4-adrian.freihofer@siemens.com>
	 <41e4a23f7b8fcbc1da06d9414646aed6d9a33f1a.camel@linuxfoundation.org>
	 <1952881b121248aaae11df8b884caba82d567bec.camel@gmail.com>
	 <b98adc29-7e18-4c68-b94c-4b9b5b2a38db@Spark>
 <b38107c74191ff9a5fa6fb0a9cf8a42cfed32225.camel@gmail.com>
In-Reply-To: <b38107c74191ff9a5fa6fb0a9cf8a42cfed32225.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS4PR02MB8742:EE_
x-ms-office365-filtering-correlation-id: aa0f5ae9-76f0-43ba-a222-08dbea1b9597
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hPMCgzgAk/2Pjnvq1yZbnrJhLXUxFITu4tjBfDIkeOrikwlzPLzmWYAmvXPgu43PGEBepXQODf1Gyn1YGmpEXviNDFKXuS5eubhD4hTistjFFCwrR0GahGNkQLwmi370k9jP+2s8HHrjU5vN6/t/TwXIwwHYei8eLhHi38NsfXk/8MDdzYnWV71zKFZgbnN6SSxs5OVuOht6WhpyxaJne0kbcrKTmS9FuMUCKvlAvEmoc13BDwdaOiQGAJ2zIAwiBmxK+54/b3DEWvg5Qw+0s65sipEYBsMPdiMBi8Zm4tZ2iSrCy4Jmumo+Cm+6of/XwhGDay8srlkKqBikj/853mdjkd6PYuTwUXi9TEawQgvWEX6e54AI4Kmk2tHA1iKkHMaWH/zU1c/u3eKPOKKr1hyTCQN+QwwuaczsQQ0O6/edRHqwWv5m98jfV9KwDA3XcoJBEomR4rhEahqprwQx397v5VOZYWuolEgxbZgeF81pieN1DkDy2WURttSHU5vGERuupN0FlHlbPZxyPC3sy7yHsrG+F2nQjArHu2jJK9WUZOzfOEyganCZAFE7OX7dZ0tE1js6ttlp+0oIY2xbrP69T4WmbnH/6t3t4aBVVq4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(4001150100001)(5660300002)(44832011)(2906002)(8936002)(52536014)(8676002)(316002)(4326008)(41300700001)(66446008)(66476007)(66556008)(64756008)(76116006)(110136005)(66946007)(55016003)(71200400001)(966005)(6506007)(7696005)(478600001)(53546011)(26005)(9686003)(83380400001)(38100700002)(66899024)(38070700009)(122000001)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?enpQMjRRY3c0MTRXaCtGN2xWQmdvb1hWV1ZzeUdBWEtRVGZ2WlhPK2NVckRQ?=
 =?utf-8?B?VDJDbjRCRk9OYnFnYitpUlFHdFFlNThmUS9TS2huT1YrTGYzN2wzU2xGMkRr?=
 =?utf-8?B?M3F2OGQ1OVNMOStEa2lYaThvUGN6bzN0TjJ1dUh4V2xRV2VNWlY1WDNkeDZp?=
 =?utf-8?B?S0RZTWQ3dk80WTBBaUJKdVRuVVFpODFCRHpic29wdmRyWlU2TlFQZThPc01T?=
 =?utf-8?B?RDk2QVNhdm1SQTJDNGVsVFgzOTZzMGFZM0xoZHVqanprbmNUOGRNM2tqTFRj?=
 =?utf-8?B?eEEvRHYyR28wOVgweFdleWZydERFK1VYNldBT2QvMmNpSFJrYnZ1L1ZwNXBJ?=
 =?utf-8?B?Z0g4QWxkVTFHMDJWTi9DNC93VzBjaEYvWCtzYmVoQW1pbDVYYmg0NlVsTTcz?=
 =?utf-8?B?YlhiUGNLY1RCR2RRbWpZZ09XZHV6SnBJcmdhb1VHbFJ6cnVrZHNldE1GMkVn?=
 =?utf-8?B?WUVNb1hKYlNnMHJmcXhuemJ2V3Bvd0YwZlQvc3EzMDFIbUxrL1F3YnpXMDNy?=
 =?utf-8?B?T2pBbVI1cHJZVWVIZ3o0K0Rxbks1RkFkVlJTTkJEQ2xIdHdURU5tWUxHdzZz?=
 =?utf-8?B?bXZIRjNxbXFrS2tFcEhCamE4U3VDQktQZ2FPR0hmZ29WUnphK3VzUG40MG1w?=
 =?utf-8?B?eHlpdHFxTTRzV1RMZEx4RWRDZU1idGt3Uk9TTS9nYXdHTUhTODY0bnFuejFt?=
 =?utf-8?B?ZWtIczY1dDJnYVNXTVN2VElNb29NSlhQVEwwMUZVZVFVSkVPNjRSaHl3TUtz?=
 =?utf-8?B?U2VFTGlXbEl0eFlFUE5DeDFjdTF0QWVENFZ3M3piSmVKL1VVRmVVcGhtdm8y?=
 =?utf-8?B?NXQxaVhzK0U4QWJOWDZvYlhTbWxuSUZ0bDZUbExPODdnODhPRWcrWU9rWW5K?=
 =?utf-8?B?Z203cENxbHNndElxZFMzR0R0TFN5QlF3OXMveGY2bW96T0JuS1NPNk9adjI4?=
 =?utf-8?B?aWRnNXFQSjBWV21RWFJodFgxaElwUDFZV3NKekpQbE4vMEhGV3lFdThXR0hX?=
 =?utf-8?B?Y1Zlc2VSOFptMzFHREFlSERTbklLU3hBdHp0SFAyeVVGNSt5UFl1bDBtb3ZQ?=
 =?utf-8?B?c3B4Wm1VTEhZbmM4OXdMYjQrYTZwS05QR2ZmQ2twK09hTC9DbEpmaUNMOHFR?=
 =?utf-8?B?NG92WTBWRW53U3NpUjMxaWpOazdVNTM1L3NKdUdTZXlVYTVDNVhZMFV6NjJL?=
 =?utf-8?B?VDBXdFpXUy8wdXgyU3MrMjdJOVdVNjFFcnFUOTlxWkdhZTVLY1pHc29WL0FI?=
 =?utf-8?B?Tk1GZDhJR3p0Yzk1TXkvOUFlOFRJOUxiV1QzTXdRblRlT0VvSEYwdnF2Nmpv?=
 =?utf-8?B?U2ZRUXFTUXc4YUUrak01SnYveVZHYzQ2c04vRmdWVjNWcE1BMnZsdGhxMGFy?=
 =?utf-8?B?YTgxTlpEOURzbi9TdWtpK3YrTzR6ZFNwWVRPZkprY2Jaa2FuNUpyNEthUUtC?=
 =?utf-8?B?ckt1bmRDQW9RczJ3T3hpZTZrMmcxZ29iYlNpOVJZWHRkMXJVLzRaMHpGbmZC?=
 =?utf-8?B?ZHpLSmZYUDhLNEh6T0puNWkxVEkrMDhCbk9xbmtubFM4RzhQcTNIeU5wQm9q?=
 =?utf-8?B?RVRsSnVPR2NpM2pLbzFod0phSy9NSzdMekhXTmZrdTJvMDVzd2cycTdjQWtn?=
 =?utf-8?B?UmMxSXI4QTZ6S1JYamNWTmZNUFhpMUg4a2xKaGgxVXpBUmtCSlFhRUV2NVVB?=
 =?utf-8?B?OW0vNmpkaDl0QWhPMk5Uakl4R0JrcjBybWlZTEdCRzNOai9ldG9ZNWRXdlFn?=
 =?utf-8?B?NHo2cWx5NldSNGNvNmdOZEtOSUNTOWh6THcyYVM4VHFkcE5LblNJajdYZ1dI?=
 =?utf-8?B?ZjVNZ1JqZ3lrbEhOMWdqTGEzSWUvNTRPdHBFNjRzWUNWZWlLeExKbVoxU0t6?=
 =?utf-8?B?ZDV0cnE4cThYV1hvS21BaFAwWVU0aWx5QVlNZUxnWDFpdDlCK01keHpPVXFm?=
 =?utf-8?B?c3hzWVlMYWZJMW90ZndKeFUyNWlpMGVsWVpyYzNSYUw3Mm02MXdwOUxsN3FD?=
 =?utf-8?B?a2Q2OUdQcTJ6VGJOTTA3OTlCN2IrejJZdVpHenYrbnJ1Q0V6bnZVd2lvYXho?=
 =?utf-8?B?RWxZZkp6ZHpJZDRORjdOSjJwbXhRTHhNOWJTa3JaTVh6aGF6bTMxYnVqMEZy?=
 =?utf-8?Q?L47c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0f5ae9-76f0-43ba-a222-08dbea1b9597
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 22:53:59.7686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4V9xlJHauQs1JWCjemZ17uf20BQ1hyNilxSPedxIO4DZnsohP47RBrAR0J8aHiO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 22:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190939

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFkcmlhbiBGcmVpaG9mZXINCj4gU2VudDogZGVuIDE1
IG5vdmVtYmVyIDIwMjMgMjM6MzMNCj4gVG86IENocmlzdG9waGVyIExhcnNvbiA8a2VyZ290aEBn
bWFpbC5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHY4IDMvOF0gaW1hZ2UtY29tYmluZWQt
ZGJnOiBtYWtlIHRoaXMgdGhlDQo+IGRlZmF1bHQNCj4gDQo+IE9uIFdlZCwgMjAyMy0xMS0xNSBh
dCAwOToyNiAtMDcwMCwgQ2hyaXN0b3BoZXIgTGFyc29uIHdyb3RlOg0KPiA+DQo+ID4gQ2FuIHlv
dSBleHBsYWluIHlvdXIgaXNzdWVzIHdpdGggZ2RiIHdpdGggdXNpbmcgYSByb290ZnMtZGJnLCBi
ZWNhdXNlDQo+ID4gSSBkb27igJl0IHNlZSBhbnkgcHJvYmxlbSB3aXRoIGEgZmlsZXN5c3RlbSB0
aGF0IG9ubHkgY29udGFpbnMgZGVidWcNCj4gPiBzeW1ib2xzLCBnaXZlbiBob3cgZWFzaWx5IGdk
YiBjYW4gYmUgY29uZmlndXJlZCB0byBsb29rIGludG8NCj4gPiBhbHRlcm5hdGUgcGF0aHMuIEni
gJlsbCBhZG1pdCBJIGFsc28gZG9u4oCZdCBrbm93IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4NCj4g
PiB0aGVzZSBtb2RlcywgYW5kIGFsc28gd29uZGVyIGhvdyBJTUFHRV9HRU5fREVCVUdGUyByZWxh
dGVzLg0KPiA+DQo+ID4NCj4gSXQgc2ltcGx5IGRvZXMgbm90IGZpbmQgdGhlIHN5bWJvbHMgaWYg
b25seSB0aGUgcm9vdGZzLWRiZyBpcw0KPiBhdmFpbGFibGUuIElmIHRoaXMgY2xhc3MNCj4gaHR0
cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5L3RyZWUvbWV0YS9jbGFzc2VzLXJlY2lwZS9p
bWFnZS1jb21iaW5lZC1kYmcuYmJjbGFzcw0KPiBpcyBhZGRlZCB0byB0aGUgYnVpbGQgaXQganVz
dCB3b3Jrcy4NCj4gDQo+IFNpbmNlIHRoaXMgaXMgbm90IHRvbyBvYnZpb3VzLCBJIHdvbmRlcmVk
IGlmIGl0IHdvdWxkbid0IGJlIGJldHRlciBpZg0KPiB0aGUgY29tYmluZWQgZGVidWdmcyB3ZXJl
IHRoZSBkZWZhdWx0IGJlaGF2aW9yLiBUaGVuIFJvc3MgYXNrZWQgdGhlDQo+IHNhbWUgcXVlc3Rp
b24gYW5kIEkgZGV2ZWxvcGVkIGEgcGF0Y2ggdG8gc2ltcGxpZnkgdGhpcy4NCj4gDQo+IEJ1dCBl
aXRoZXIgd2F5LCB0aGVyZSBhcmUgdG9vIG1hbnkgdW5hbnN3ZXJlZCBxdWVzdGlvbnMgdG8gY2hh
bmdlIGENCj4gd2VsbC1lc3RhYmxpc2hlZCBkZWZhdWx0IGJlaGF2aW9yLiBBbmQgdGhlcmUgYXJl
IG90aGVyIHdheXMgdG8gZGVhbCB3aXRoIGl0Lg0KPiBUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRo
aXMgb3V0Lg0KDQpGb3Igd2hhdCBpdCdzIHdvcnRoLCB3ZSBoYXZlIGxvY2FsIGNoYW5nZXMgdGhh
dCBtb3JlIG9yIGxlc3MgZG8gdGhpcyANCihwcmVkYXRpbmcgaW1hZ2UtY29tYmluZWQtZGJnLmJi
Y2xhc3MpLCBhcyB3ZSBoYXZlIG9ubHkgc2VlbiBhIHVzZSANCmNhc2UgZm9yIHRoZSBjb21iaW5l
ZCBkZWJ1Z2ZzIHRhciBiYWxsLiBTbyBJIHdhcyByYXRoZXIgaG9waW5nIHRoaXMgDQp3b3VsZCBi
ZSBhY2NlcHRlZCwgc28gdGhhdCB3ZSBjYW4gZHJvcCBvdXIgbG9jYWwgY2hhbmdlcy4uLg0KDQov
L1BldGVyDQoNCg==


Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD636C55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 13:16:36 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42832.1785762986245753329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 06:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=cNIqe0qF;
 spf=pass (domain: ericsson.com, ip: 52.101.70.27, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhPDjECEToqcGml/9K9Bs63f1r+Ft2N7ASkwJviiY+H3VQVq2xlWkgwSa0qEP3GHs5FHu3pSxsxPl87p3ogw4bVraGnjb0QqsRgwbVoxemkGCk2YRNEl1OpcGwEWzZ65mIN8J8hpbdv1cxt/b6uSGL8xkjJQvwSGVZrY3+Quu3Ar6v3AVP412D9uOkwqqsPw3VMo0wz7Z9i76k5oC1uHlTSbv6VxRiA01Hj/K+i1cg/n5LoUXlBTGNNSNM7HqTvh7I6PeS7ZUG9zd9DgXxsQtt9CEvpfzh+dqC7AwPvS74ZZ5GSsE+twDniEHaoFAVXbZEMWFNiAwGRkaA6Zdv46oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TARm6mGjt7qPsuNMvVek8Cq8hYb0m4oBXQZI3pUxzdc=;
 b=wozPvYkO6ikIWYMNu6hKQNq44TFFxbxG1/NNtgtBdqFt4n5MrzbFXrOngw8dumTseS4wc/A2PakU6Okbu/JvB6Ox5XykmmsKJDsq2tCLD5CwA3ZYkDIqLvw1nhQ1beBgyxmn/RZPIY8SHX5TTj1U+XACodWnC/s0b1EAQmlNq94clR2X7pCRuEI2vEFtoh5jFHeURNAAFl9Yspq6Iqz6iPWPRbQdhPX0Kj/AVeZQtGVPnUDCpMXHOxvx48tKijOG8X37xPWfBLWlN/mBLiQ07ctmJhmXygNRUlVsoceEZBpYqNOUHIkHsPv7rL7OagxYjPfv1S1FYq78trwN8djRRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TARm6mGjt7qPsuNMvVek8Cq8hYb0m4oBXQZI3pUxzdc=;
 b=cNIqe0qFcPbQMRKXDxihJWFrXfuMYUPBBlBqymsCA/6MH8s2WBXGdU7qPTaQPV0+jre8/z4K+fC5rPp4uw45UkVCQKLLSnCxfeKEmQTIx4PW9Zap1Igf5Idg+a0BAecG5S1uezVD4CtTkC4jkO/QJFneC+/ynKwWjIMnNFk6cefugb6YBhdctti4Hvpx0QvbuQi6WOXR07K5DCRBupuPTWbp/9cTuo5jkqtd62V+aQn8/7ZhksvDpFPq1vny5ykuJ09883DYrvWFktnuK+iC3um7WDSHY58cQNA/8akTwp2OaIDPQYvpfKCEzxWelUhv9Zug6O+sVNk7/1J+8O06mg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by GV2PR07MB9155.eurprd07.prod.outlook.com (2603:10a6:150:ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 13:16:21 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0292.013; Mon, 3 Aug 2026
 13:16:21 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] devtool: upgrade: ignore changelogs from
 3rd party
Thread-Topic: [OE-core] [PATCH 1/2] devtool: upgrade: ignore changelogs from
 3rd party
Thread-Index: AQHdIy9miU0C2TbwvkKSeE1gA8z7FraMTTAAgAAA/QA=
Date: Mon, 3 Aug 2026 13:16:21 +0000
Message-ID: <5f9d63e90b850b125a571718793b1e8ba4181086.camel@ericsson.com>
References: <20260803100231.3752129-1-daniel.turull@ericsson.com>
	 <358db0c094083c05a67c0d989bc6390e33659949.camel@linuxfoundation.org>
In-Reply-To: 
 <358db0c094083c05a67c0d989bc6390e33659949.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|GV2PR07MB9155:EE_
x-ms-office365-filtering-correlation-id: 8565b2c7-0331-4c63-4cb1-08def161695e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|23010399003|22082099003|18002099003|38070700021|10067099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: 
 oTbAcO1AwWhFDbB8+/VfdR94+9NUpeK3QoNXLZ4XFi2hElr1cxw8emEecI1Js1zceYYma2C3MAiiVTq99VhEVhJe4TgNegMCW8MG4J88dCQ3sr9TLwh2e9EP4YW1/UNNWdxOh9ipyT/mJpz+pmmwlqdK6GI5F5lihtzsAzfPg5tJ8xD3S3G+UVQg5UtsAAZrai5p1YiJet9nL7WjWRJf6vDR3uVj6FreDPaAJbtitrIb74iqpIe+AWf7QiQi0qV3FAnfqqtBIz9iWXaEQd0G9Yy/7IveSTOHg8jjzAVoWQgyJEW8zbrY8JXr6Lo8SIZbun39QqKldWOISSHmhb8VUpc4jHtItyaQCW9m3cAVlZZv6at8d1JWr8e/uyh2601jK8OKY1kfWPDCYjztG6KVJ4lAuA9XdKOy2Oogx8G1RqJrfyCAzjSiHWuBE1WAEerfrJpRVmUoTxEIMmh+i+Pbs+Uzop3s/Pq8HHzlmt48ipyTJhNRFI/eXXhwBgSjuJrGKI+EBLYqNGd9gP5QX2iVqE7SNOEUn/BOI4qvfR3Ho2MEZtU+g2XLVfml70dxsR6rOlMt0QaawkRbpkapIRyFiEo9yml5NPQiC1n+ZmioEaqgYachFOQjI3cAPMtN1wxcn57sOS/PH9H9cy3nHddH+HxhwYesqigbVAMKLiQRVEw4kjZ3fvNZUnweKalz4L33Yn9ZgxnDOffk1oX/yVByxfk1LGhA4YkiUhhEh6HoI3g=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(23010399003)(22082099003)(18002099003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RG1pWHNEL1k5MjZCVHNvVkIyQjU4UHRWZW5nZ0NZUnMxV2Y1d0JJdEQ1OXBQ?=
 =?utf-8?B?NjlZektsVmd0RWUwbTBJTWZQUWpWL2pGZlF2MC9BSHk5S1c0UjBoMjZVbWM0?=
 =?utf-8?B?Q0poeEFUZWFSaVAxY2tlUXJLZEp0eHNjYnB3UzRtd3NWT0g2WWx4NjNOVVlP?=
 =?utf-8?B?NTFhbjdaamU3Wnd6QjlpRFc2QWhaS0J0ZHJVZk5mZys0cEU0c0RiS2NkamI4?=
 =?utf-8?B?MWthRkZNR2xTZUNqZVNFWjEzUkp6QnhnSEtDbU5Sakd1UVVvdnNTUUs4dWZK?=
 =?utf-8?B?NmF4eDNhSFk4TTRVMGhyZE9DT1IzckpEQkRrdHdQajJ1dlh2eURmcDZObytj?=
 =?utf-8?B?bUV4SytReXhOUGhra1lmckpLZEtqTWRqSE1xQnYyQXB2cDYrZUFSRjBYQVJV?=
 =?utf-8?B?eWlrMkJ5VGo2YlZWMWhnOGVVdFZVdW1RZGRHalk2UHVOSVBES1pBNk54THcx?=
 =?utf-8?B?dUI3UGFxY3lkS3FwLzBkL3ZFdXRkdm12VEswbXM0SS96bGxWNnhCU1FpaGo4?=
 =?utf-8?B?YnNUMG5sZTRYSjBGS0xsRmVNdjBDc3dvekVyT2Q0R1M2MENLM283MzhOdHJy?=
 =?utf-8?B?YUVWL3RqTENpamxDUStzYTAvL2w0NGl5UTllbjNXWVhaeDNwSXlZM1VzdUw4?=
 =?utf-8?B?cVJDSjA3Yjg5ZEtueXUwZ0V0M2NlR3ljb243TGFsc3Njby93Vi9QYTlmQ3E0?=
 =?utf-8?B?NFNxQ2NCTHVTV1J0dVc5OHRqQWNOeUhSVFBDNzdsSGl3WlI3SUVETEI0aFZv?=
 =?utf-8?B?UnlhTlhJSVRGeHNGbzFXWW1WM2pHMi8rUm5vcVBxVGh2L0ZoN1FPSEpleDdP?=
 =?utf-8?B?SXI2WlZwWTVZd05EWmZqWUZNdlBEMEZDa1h0cG1yNGxIdS9PckZaaGZFRzZ5?=
 =?utf-8?B?b2h2eVpjNmE3bkVMQUlSOTREa3NQdzNzb3NEdGJIdGg5M0Fvdmp6VHdSU1B3?=
 =?utf-8?B?dWZtMHdXOFVKSng5YmhzR2ovVGlRSmVvb1RKenNuRHpzKzBvMkNtb0FucUpI?=
 =?utf-8?B?ZCtoUjJPY3Vjb2ZjU3ZxNUVGdE5mdUs0clk4YWVTQTlvOVlRMGRUenBuQ0lT?=
 =?utf-8?B?M1RwTld2eGVsamFPSlk4amladk5BbnBIT1ZFRnI2NkFIcDB0TWdhVWw3TDBD?=
 =?utf-8?B?SEtiTGV1WTZOQnJnSzc4UTh5b3JVYldZeU82VHk4amZsZ1FFZ3RGOE9Qcmpt?=
 =?utf-8?B?SzdhdHhjd3drVnQvUFNjdDNZZUVNS1N4Q1ZXZjZPN0h0K2JncnNRTjNHejJl?=
 =?utf-8?B?di9veWpIeTJPaVJMeGJIUXlHamVrdVhwVVo3WjlCZkh1N0NxMURKTlV5cmxk?=
 =?utf-8?B?OGRvZG8yUzJyakNsNnppSkM1VHAxVWlpVlRrQXlobjhkcEhlRUViNHM2ODE4?=
 =?utf-8?B?VGNRK1U3UDRTVlVqRkMvMnl3TnE5bElXcVhpbndxdXUxTFVLOTZVZHVNVUc5?=
 =?utf-8?B?TEJYdGlDMzNOMXhTNTBqL1hUWTdoaWR2RlBqUnF3NzczU3VnWUdKaXRqYkNN?=
 =?utf-8?B?czVONEFtV3JqbStPQnQyZExNcUxhU0lncTlsSktreFhURzJ4Q09mcjlHQUl5?=
 =?utf-8?B?NlFtRUxrL2g3c1p1M2FXcXQ1TVFKRDJDeTBqdDg1WHBNek9tdzljQzc5ZlZD?=
 =?utf-8?B?MkV4ZFcrR2NaZTBFS2F2ZEE2TjlWWmViSFVsT0NUblAzZFNYM2Ftbmd6b3J0?=
 =?utf-8?B?YTR3bmNWcUhtTmhJNytYblZITmZsbW5EaVJZaDYrRFdxdHJLNHFnUTRHODZm?=
 =?utf-8?B?V1FsRnp3NmczOVo3K0JjUEdMN1R6VHFRenQ4c0dyeDNYUHFKaitMMHJPRnh0?=
 =?utf-8?B?OGUrc2FYN1J6VUF1R2x5WmsxUUVGTTBhaERDdGNpWmgxWnhhNkdVZmFLNmk0?=
 =?utf-8?B?N1BYSXRORmtyWGV2aENHdlgvN1JUeCtzSFMxcEVhMWxMS0lCaXNUaXB1a1JX?=
 =?utf-8?B?SmZVWEVZbXZRWEdlRHRyaTdjVEVZcGcra1JMcFVsK1JhMnlmakdsOGpieFpz?=
 =?utf-8?B?SDJrS25ObWZOWXVXR1JaaEFQYU5RSmRwQ1dsVkhzTmxwWE1PQStwenQwME9n?=
 =?utf-8?B?WXJlYkpsYW01Zk5HSlQ2eFlzcElMZzNZSlRCL1A2aGpna0tlaVAzMzdOaDhr?=
 =?utf-8?B?YUtEN0FZa0xlamVycUp4TnJ2SXQ4aXFNUDRuTjUxYWdNL3JOdEd6UmFxWVBK?=
 =?utf-8?B?ai9QTzUwRGNDM2p0RS96ZEg4bzdOZlJDOCtqTUlNZG41UlU3RlNlSG1Rcjg5?=
 =?utf-8?B?OS8rUzk1RUZiYU9nNnRNUkkwbmpsQ2hwZEo4V0NYalQ4b1hEdk84dG92dUs2?=
 =?utf-8?B?N1pRTkxZYUlva0RqVGI2eHZMR2RBSElWZ2JHbGs2Y1NuVWh6QTlyRUdUazlX?=
 =?utf-8?Q?fnTCjK9RLm/kXXjprSx9p/w0eFz2KDOfkR8CJem7T2NR4?=
x-ms-exchange-antispam-messagedata-1: YKwb+uXokmGbbj90XuMt1eqYPVakxDyRiws=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A94D5D73DA07E4695BE8C5E2D8D1DD5@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8565b2c7-0331-4c63-4cb1-08def161695e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 13:16:21.3140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoLk8ntPQG9VUSxAqfzHB+ipUACgHHENQAia+iOYojtQIRT1U5yPcCd59Vi3IwU5RXrjg8gHzuvlD8eMfi26f+TFbeLh/68dcSrrATLffR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 13:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242653

T24gTW9uLCAyMDI2LTA4LTAzIGF0IDE0OjEyICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gTW9uLCAyMDI2LTA4LTAzIGF0IDEyOjAyICswMjAwLCBEYW5pZWwgVHVydWxsIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEZyb206IERhbmllbCBUdXJ1bGwgPGRh
bmllbC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiA+IA0KPiA+IFNvbWUgdXBzdHJlYW0gcHJvamVj
dHMgYnVuZGxlIHZlbmRvcmVkIGRlcGVuZGVuY2llcyBpbiB0aGVpciBzb3VyY2UNCj4gPiB0cmVl
IChlLmcuIG5naHR0cDIgc2hpcHMgdGhpcmQtcGFydHkvbXJ1YnksIHdoaWNoIGhhcyBpdHMgb3du
DQo+ID4gTkVXUy5tZCkuIFRoZSBjaGFuZ2Vsb2cgZXh0cmFjdG9yIGNvdWxkIG1pc3Rha2Ugb25l
IG9mIHRoZXNlDQo+ID4gdmVuZG9yZWQgY2hhbmdlbG9ncyBmb3IgdGhlIHJlY2lwZSdzIG93biwg
bWlzYXR0cmlidXRpbmcgdW5yZWxhdGVkDQo+ID4gdXBzdHJlYW0gY2hhbmdlcyB0byB0aGUgcGFj
a2FnZSBiZWluZyB1cGdyYWRlZC4NCj4gPiANCj4gPiBFeGNsdWRlIHBhdGhzIHVuZGVyIGNvbW1v
biB2ZW5kb3JpbmcgZGlyZWN0b3J5IG5hbWVzICh0aGlyZC1wYXJ0eSwNCj4gPiB2ZW5kb3IsIGV4
dGVybmFsLCBkZXBzLCBldGMuKSBmcm9tIGNoYW5nZWxvZyBjYW5kaWRhdGVzLg0KPiA+IA0KPiA+
IEFJLUdlbmVyYXRlZDogS2lybyB3aXRoIENsYXVkZSBTb25uZXQgNQ0KPiA+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiA+IC0tLQ0K
PiA+IMKgc2NyaXB0cy9saWIvZGV2dG9vbC91cGdyYWRlLnB5IHwgMTAgKysrKysrKysrKw0KPiA+
IMKgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gDQo+IFRoYW5rcyBmb3IgdGhl
c2UuIFVuZm9ydHVuYXRlbHkgc29tZXRoaW5nIGluIGhlcmUgY2F1c2VkIHRoZSBkZXZ0b29sIHRl
c3RzIHRvIGZhaWw6DQo+IA0KDQpPay4gSSdsbCB0YWtlIGEgbG9vayBhbmQgcnVuIHRoZSB0ZXN0
IGxvY2FsbHkuIEkganVzdCBkaWQgaGFwcHkgdGVzdGluZyB3aXRoIGEgY291cGxlIG9mIHBhY2th
Z2VzDQphbmQgbWlzcyB0byBydW4gdGhlIGRldnRvb2wgc2VsZnRlc3RzLg0KDQpCZXN0IHJlZ2Fy
ZHMsDQoNCkRhbmllbA0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQo=


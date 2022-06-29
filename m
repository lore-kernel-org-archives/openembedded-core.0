Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D69C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 08:40:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.9115.1656492039475695464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 01:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=xUY+RAMJ;
 spf=pass (domain: siemens.com, ip: 40.107.20.50,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwMhov2451BYhHHzwL+bvPxZCJy32FUZM7/ybrFuH9CgHc1ykb+18//8hHOxa2VQuyb5DXn8gMVh+ewNmPwWqi0lTyCYb+Mb4oWNc8Lr6+YESDN85hJkCknu2b/wFh9QJn4vMnZUKxKcPesQSUW9cHQm83kJX4qioVpeTYtPLa0qKC5uX3MWpQFfZgu+nP435Ud8zEHomuRcpEgLEzzVJHVHg0S9QAhEC8EkVI5Qs3PGrginD2tPqyOteC4eHAHJjgCV4z2lCbdRczi3YdvpTcRYpQMI11cJXjWQsQtqIgh/5dEEFxygNzhqlWNRD9j0v9Rx9uQKxb/lxWnRVootDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ev+XAYpLk6hHb56dgJ3VXqnF5tl6vONogy/PuqnTijQ=;
 b=Ffdms6lhquYEaKJ5yYYYPh406hko2ASedT1OymAu0LcBoIMXde+la0iOEckv/qaNWE9h8OL9zA5P2167AcibT3R9HlHRct3iVeei6PMV4Lss0kA9JgetylSWmEybmGvaTQVNf6YwLF3SM5oT04V2rRmRqrrDesQCnE1dJt6IG9l+7QXtCaqN3dQ0uYNv6HlHowQ/Z8n2/rluNf/YluIUdsGEoSPnXGG+ofNEdMCK60fPMkZzKguXGo2v+vzRllwsvyPfubzupDoeH1vUkvn/oINU9iNO2E+I6f7rggN4Cf9gXfrcSHjLjRDRpImV/N4jReD4RWnqbeDmhQEmR4peqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ev+XAYpLk6hHb56dgJ3VXqnF5tl6vONogy/PuqnTijQ=;
 b=xUY+RAMJJc5L0E3W+BjbRJ7J8CE9R/ydB8pfEEczNvmmCqWf7R62PfY5pqv6FgVHHPOnoYomEkfXpSQMTzjF3crUI/zrTv/NdNo8ZHmOqYRXYdnsF2s3WyTVc9hN5wC+/0Jounof5dVhuYgwmXeLFZqm79229UvGrvqunFTQ6ewkIgAGptQlorb8GcdJ/FJNXF0/x/eHRvjk67NegmL/esy6EHB0YACfvgXXUvOhdxpTsRHEKtrdSCzebrNSjwQoiYHV9L2bKyd0S0NV9aAh4Kw6p4sHN31MY+Wr7kkKaxPdP5SyQKaS0n5PstpRV03NhVry3l6Ga8CJqcn1s2Whlw==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by AM8PR10MB4785.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:315::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 08:40:36 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e5c4:b2fc:cecd:ee75]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e5c4:b2fc:cecd:ee75%4]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 08:40:36 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>, "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: Re: eSDK dependencies
Thread-Topic: eSDK dependencies
Thread-Index: AQHYiiIHc1CLXz+3xkuTnJctNcNK1q1jQWYAgAEzEQCAACdrgIABd6aA
Date: Wed, 29 Jun 2022 08:40:36 +0000
Message-ID: <510530e1f76a3e55ae370f21b519130eceff90d6.camel@siemens.com>
References: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
	 <cc2e9dad3bcab4cd3e0d11c65241476142324c8b.camel@linuxfoundation.org>
	 <717c8fd06b6f256edfe95b31d378f3ae544a7f50.camel@siemens.com>
	 <8afeea0dbf57ab08aade7ab3da3d66603b003bd9.camel@linuxfoundation.org>
In-Reply-To: 
 <8afeea0dbf57ab08aade7ab3da3d66603b003bd9.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3138385-208b-4e5b-73b8-08da59ab09ca
x-ms-traffictypediagnostic: AM8PR10MB4785:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kVQFzih9GEs/7T4WJ3DLZlcHSRhSxvsh3qcqWbgGoJmPCR0bZYn3WPW1dj900v+cxc7ZQ1MSLF966xi6rTdQ/HAE6WJIfyNPXAfYvYpAVHD5Nam6Ot3XmxOsILB8ckhcSexmHXg8xLvm9Owge9hKtmBQNIdtbJevwa+ECThv0WWyzR4qkkvLZjwMHIDRkRBbh93I8EsU5DB6sTmnNyL0oDItKE5GBe5jadfzYJ1WtxtY9FmRG1PtRx2h2DmKRKtnjBGQIcSc4a6mPb0mDUtYwfb1Z1UVYcEXLJN8/q5exU1Z4TsIiJXUmvSjD2l0wZ/h7cJlOcf7Uer/JUglz/j9O4hyL77UO0M92bvYs6QoCNmINY40gAfkse1PYTyHsq7sNdskODvYUome/2wJo2l/GvwMhjDVmu9P55xO71/PCF2ok/WhB/KuogHc79rnurBBHWMyC6cpW9iT1m31coR9rTFoyVGVlXiOc1I05QF4gZStrSAhDmT0prXIQB48w0ZfZ8E4HhiCSofdPl5/ZsM+FtlrXFUWx1O2Ot5BEDkQkfW2K4cPgHM6C4jsKDUNMfljYpPRIh4/sQ/iwK9heLCr9mbjYhN+3l2ubbCWsnI8u2MvUiqZEpOzJ8saSAFbD6ah0B0lUgK1FdbVPoklPL3Qhw+dakUGzNJ92VVcyWUPQeSK4OiAyji6yITzc4owqqt/fZak7wsgDEtU/aKx1VLcW0YZxOLBxqmG9X5pEb1PyTVVV1PI4AJgOXYw0df3+n6TXQLuidWcIQffttRXaaLhjaylzrgXN3GjClx0Sz+B2TA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(66476007)(3480700007)(26005)(8676002)(186003)(110136005)(38100700002)(41300700001)(6486002)(54906003)(5660300002)(2616005)(6512007)(76116006)(478600001)(4326008)(82960400001)(38070700005)(66446008)(66556008)(6506007)(66946007)(7116003)(122000001)(8936002)(36756003)(91956017)(2906002)(71200400001)(64756008)(83380400001)(107886003)(316002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cXVHcW52dS9sVTFRZjlibHI3RUdxL3JvOVgzUWEzL3NadkZHU0c4SDdmcGRB?=
 =?utf-8?B?R1FETHhOY1JybVE3ZWNFOGlnTnNkM1hyemtrMzRlL1NiSmdGdmsvbkk4SzdO?=
 =?utf-8?B?dkVkakhWSGZSS3NWd2U3aUhvS29ibnhjTUo3NFd2OHY3NndBUkM1bTNxbG1y?=
 =?utf-8?B?dGlJbndudkpGMmxlR2dmVG11dDR2bjNHVWhPb0Fhck1GN3lWVlQ5SitWZlpw?=
 =?utf-8?B?dUdseS96YmdkMGVzVnhOZytPelhmSEVIY01ZNUtCaWhkNG0xK1RuTGIraUNK?=
 =?utf-8?B?am83b2YvZ1hUaEp5bUVlY1ZHNzFWWmw4cVBiWURjMXp5SE5qRTZVQmdpZVlo?=
 =?utf-8?B?QmF6K2l1MnFTSnY4N0VPSDRkaGllaVZ1ZnhNYVNqR3cwUEEwNXBaVTNRbXNy?=
 =?utf-8?B?WmtDUmR3ZUx0K01SN2Q2emZ2QnF5ckdvT05BRjNWZi9xYXFCWUVyWGRsSzRW?=
 =?utf-8?B?alFvTjVMTlZBY0Z5RUlkN2kzN1NoOFV3UGY5NXdUczB4YWJTOW9hRXdTNkdQ?=
 =?utf-8?B?bm5OZzBCaUR1WVdIL2oxTEQ5N2llZVdGbU43Mk5ocWdlQ05WSWJPbDNtUjBh?=
 =?utf-8?B?ZGVNVm5mdXprdGxJY3lId1RyZUhZbzYvV2haOWtpRkE0Z29xcThQbDhOb1BO?=
 =?utf-8?B?Sjh5Nm9CSWFPZ3MvS0lDcC9NdjNadjRUWC83cmc0Wkp0TlVsZjJ0TzNPYWJ5?=
 =?utf-8?B?WWFGRCt1RzAyZEZ2MTVyVW0yNjRIQUR0akhMa1NreFhROEVvaEYwc0lJRE1X?=
 =?utf-8?B?KytsbDBheVgvVHVFYlR3Q2FuYTc2TGR2QXZyQksybXhqWi8xamJSTHhEMldV?=
 =?utf-8?B?aXY5T1hsdVIrYmJwZXdOb2lrd3FJTnNBSEc1SVVkNDBCbTlvWVM0YWVGKzA5?=
 =?utf-8?B?TFV6U1pQQXozek5mQVMzSWNzaE1yWjA1b2lxZ216VnJQS2ZUVURDNUdQcFJu?=
 =?utf-8?B?RDkrQkFpZVRhMit4RGRJM29mQS9rYmhJdE9wZDlpQ1dUS2phRUoyMzN3a1p4?=
 =?utf-8?B?K0dVMm43TmFZVFFBRVoyT1V3eGNrb3ZsNzlIVGZGVHdrOWJ6bUM3SjV6ZkVK?=
 =?utf-8?B?RFVQYWtjcStwWUNQSGRKNE9wTlBESHhGY0lWL2E4a2xEWmE0WTRWa0dlT2xH?=
 =?utf-8?B?OVBEQ0xqRXQ3dGtmejFYcTcvQ2wwcnloQ25rd1l6b1lvN1ZxNWZNNmRXVTkz?=
 =?utf-8?B?VnZ1WTczMUNjaEd2UWl1Yk5QeE5ZMXBxMk96VjQ0SmpWbmJpdUhXcGNvWmRV?=
 =?utf-8?B?bW9QQUNYb3ZGSHNiNWlOZ2NNNVZ2RjJGSEg4NjdxblFYY0tKS3NEOHpWd2gv?=
 =?utf-8?B?ZEV0Ynd4b0U2dzJqVGViSTUvVFR5U3hhT1lCd3kxR1Y5dUxmZmU3Nmt6TStn?=
 =?utf-8?B?ditESUd4MmM5QWhhL3FxOHI4eENkbDc0aGhjbXM1Q05adHQxNVFsK0swVmpR?=
 =?utf-8?B?dmk5ajlYOGEwbDhrcUErVFlnS3NSMkFkaHVuN0F5WFZsSDc0MVNJVGd4ZkIw?=
 =?utf-8?B?Ylhrak5oTkFJWkE5KzB5UzVlNlBNbWd2NUwxQ09YVHdoTGFuTzI2WHF6Skk4?=
 =?utf-8?B?NC9vTmp5aDdPWG0rejBkcUFsRTR0ZE4wLzFCOWRjYkJlUW5JcDV2NWRJOXJY?=
 =?utf-8?B?WVpRamlXM3FUeWlaZ3BRUStLYTVmTWNzb0U4UTlMcm5ZcEVpWWhNS2xZckhG?=
 =?utf-8?B?SEF2K05QbkJtQjFzSDNqSGY4ZmF4aCtvL0dTcElvd1N4ODNuWU92RFk0UlJn?=
 =?utf-8?B?azVyMHU0MWdlS25BaHlRLzM5OHk2TmgvRk0vdW9tWkVQa1dZSEJIdmJSUnk0?=
 =?utf-8?B?ekk2ZXpTNnFNOURyR09HditUZzNzL1M2ZDMyU0FFd2V0emJUSG1LY2hPeHll?=
 =?utf-8?B?enBnVzhvY01Qb3NEL3RJVGZEOU03b2xRU1A0YlRTcEFIZzFvdEo3WUovMzMz?=
 =?utf-8?B?SU9rL0VjV2lqSEk3RDNDQ1hnZFVGTExrUm5lRW42TXg1WWVMaDlsUXY4QkNE?=
 =?utf-8?B?aWZKLzhFelZweUptd0JVeG1JeklEYVNSM2d2S05ZYzhvL3BhaWZ4aTg1ek82?=
 =?utf-8?B?V3hkVzQ5K0NEL1hPaW5YckR1YWhQcm9pd09wcXo0OEt1eEtPWk5UWVUrcVJk?=
 =?utf-8?B?cjJ4TTJ5eWhNVjVnQlhsN0Z0aHl4RHZQOGJqdzArc0JrY1ZoRGlPUDFNTnVo?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C604604F90CFD347A99DDE67C6E50D49@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b3138385-208b-4e5b-73b8-08da59ab09ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 08:40:36.4264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 4577o7DRTwybXSGdTPcdjFaZYKzyR/0ital6hYEwnMAUPqSCQPhq5OVyHYzq/eHJ0eeN6pt8PZbLxUZpsrL4HgQswMbccAdDiX8aZpZ2NYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 08:40:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167370

SGVsbG8gUmljaGFyZCwNCg0KWWVzLCBidXQgdmFyaWFudHMgaGF2ZSBzZXQgU0RLX0VYVF9UWVBF
PWZ1bGwuIENhbid0IHNheSBhYm91dCB0aGUgcHVyZQ0KcG9reSBlU0RLLCBidXQgd2l0aCBvdXIg
bGF5ZXJzLCBzaXplIGlzIGRpZmZlcmVudC4gTGV0J3Mgc2F5IDIvMyBvZiB0aGUNCiJ3b3JraW5n
IiBvbmUuDQoNCkRvIHlvdSByZWFsbHkgbmVlZCBsb2NrZWQtc2lncy5pbmMgZnJvbSBib3RoIHZh
cmlhbnQ/IEkgZ3Vlc3MsIHlvdSBvbmx5DQpuZWVkIHRvIGtub3cgaWYgc29tZSBlbnRyaWVzIGFy
ZSBtaXNzaW5nIGFuZCBub3QgdGhlIHZhbHVlcy4gSWYgeWVzLA0KdGhlbiBJIGhhdmUgdG8gYnVp
bGQgdGhlIG9sZCAid29ya2luZyIgb24gYmFzZWQgb24gZHVuZmVsbC4NCg0KDQpSZWdhcmRzLA0K
QW5kcmVqDQoNCk9uIFR1ZSwgMjAyMi0wNi0yOCBhdCAxMToxNiArMDEwMCwgUmljaGFyZCBQdXJk
aWUgd3JvdGU6DQo+IE9uIFR1ZSwgMjAyMi0wNi0yOCBhdCAwNzo1NSArMDAwMCwgVmFsZWssIEFu
ZHJlaiB3cm90ZToNCj4gPiBIZWxsbyBSaWNoYXJkIGFuZCBBbGV4LA0KPiA+IA0KPiA+IFJpY2hh
cmQ6DQo+ID4gV2UgdHJpZWQgdG8gcmV2ZXJ0IHRoZSBjb21taXRzIHdoaWNoIHlvdSBtZW50aW9u
ZWQgYW5kIGl0IGRpZG4ndA0KPiA+IHdvcmsuDQo+ID4gDQo+ID4gQWxleDoNCj4gPiBZZXMsIGlz
IGZ1bGx5IHJlcHJvZHVjaWJsZSBvbiBsYXRlc3QgbWFzdGVyLg0KPiA+IA0KPiA+IGJpdGJha2Ug
Y29yZS1pbWFnZS1taW5pbWFsIC1jIHBvcHVsYXRlX3Nka19leHQNCj4gPiANCj4gPiBlU0RLIGlu
c3RhbGxlZCB2aWE6IHBva3ktZ2xpYmMteDg2XzY0LWNvcmUtaW1hZ2UtbWluaW1hbC0NCj4gPiBj
b3J0ZXhhMTV0MmhmLQ0KPiA+IG5lb24tcWVtdWFybS10b29sY2hhaW4tZXh0LTQuMStzbmFwc2hv
dC5zaA0KPiA+IA0KPiA+IC4gZW52aXJvbm1lbnQtc2V0dXAtY29ydGV4YTE1dDJoZi1uZW9uLXBv
a3ktbGludXgtZ251ZWFiaQ0KPiA+IGRldnRvb2wgbW9kaWZ5IGJ1c3lib3gNCj4gPiANCj4gPiBT
c3RhdGUgc3VtbWFyeTogV2FudGVkIDE0IExvY2FsIDAgTWlycm9ycyAwIE1pc3NlZCAxNCBDdXJy
ZW50IDYgKDAlDQo+ID4gbWF0Y2gsIDMwJSBjb21wbGV0ZSkNCj4gPiANCj4gPiBTbyBpdCBzdGFy
dGVkIGEgY29tcGlsYXRpb24gb2YgbWlzc2luZyBjb21wb25lbnRzLiBXZSBhcmUgYXNzdW1pbmcs
DQo+ID4gdGhhdCBlU0RLIHdpbGwgaW5jbHVkZSBhbGwgYnVpbGQgZGVwcyBmb3IgYWxsIGNvbXBv
bmVudHMgaW4gdGhlDQo+ID4gaW1hZ2UNCj4gPiBhbmQgbm90IGp1c3QgYSBkZXBzIGZvciBpbWFn
ZSBpdHNlbGYuDQo+IA0KPiBPay4gVG8gY29uZmlybSwgU0RLX0VYVF9UWVBFIGlzIHNldCB0byBm
dWxsIGluIGJvdGggY2FzZXM/IENvdWxkIHlvdQ0KPiBzaGFyZSB0aGUgbG9ja2VkLXNpZ3MuaW5j
IGZpbGUgZnJvbSBib3RoPyBJJ2QgbGlrZSB0byB1bmRlcnN0YW5kIGlmDQo+IHRoZQ0KPiB0b29s
cyBhcmUgdGhlcmUgYnV0IG5vdCBiZWluZyB1c2VkIG9yIHdoZXRoZXIgdGhleSdyZSByZWFsbHkg
bm90DQo+IHRoZXJlDQo+IGF0IGFsbC4gSXMgdGhlcmUgbXVjaCBvZiBhIHNpemUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSB0d28gZVNES3M/DQo+IA0KPiBJIHN1c3BlY3Qgc29tZSBraW5kIG9mIGJp
c2VjdGlvbiB0byB0cmFjayBkb3duIHRoZSBjaGFuZ2UgY2F1c2luZyB0aGUNCj4gaXNzdWUgd2ls
bCBiZSBuZWNlc3NhcnkgdW5mb3J0dW5hdGVseSBidXQgYXQgbGVhc3QgdGhhdCB0ZXN0IGNhc2Ug
aXMNCj4gcmVsYXRpdmVseSBzdHJhaWdodGZvcndhcmQuLi4NCj4gDQo+IENoZWVycywNCj4gDQo+
IFJpY2hhcmQNCj4gDQoNCg==


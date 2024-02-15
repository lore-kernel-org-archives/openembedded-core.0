Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CBCC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:38:45 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.80])
 by mx.groups.io with SMTP id smtpd.web11.5431.1708036724720184971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=KlDhs+1r;
 spf=pass (domain: axis.com, ip: 40.107.15.80, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIeQGQykUEGcd7mKNwEhpFbDa0Bl89HBom1K+h9ugZN3/ag/XIwg2dFFkB5yVZW7uM7EsbFEgLcHbxSDUha8eFh6vOong11w/6NWldCccNjMqkjgAVY+Upye8TCltcLmEFtg6J4TFJUX0uynX022TJDee/0hennUnY9ng6wNc3s38MjxhtwfWm4rWRk29ES9dj6kuOFc8wVsygJCFpNdnxkuGrJSdF0VJsjdtbLePqF2cwi+8Xs59yYD3HToMxZAv5YuyryUbdeC62UY8fjXRW+h+F00y16A/pufKKwRpXdZTzci3Hfp5rKR0I/RbU6We3EjnjdiusBBnrVRUFyzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSWs7usK18k3qDDB3CcZ2amz3585e/4WkICyj/fqFAc=;
 b=m5osaJ0ytNLmYW7t0mv1V984tTmtf8k0lVKQ5hKfEpJVMaguFskHiMVKS05WljjNQDUseteagO9087mIpKmCStkYJEt4VFjNiFRMsOwCJs1vjfEMfSoUT8aLX3aiaL87ozdiOGbfO1wvEH+sJX/XWRWkYy72wz+rQd8tXTxvttIQnkXNIfCwRivugQ0wwPbC/npYc3Ahq7vPum1Qf858986fCXKbzjUFby5LFss+Uemdw6DdUeWCKi6K7AKLpT3InRzcj0+E9oL5QAeOuiBcqFhspW7YaAPnSaNkg2zatvAQHdUOWpXauo1lwymeW8Bm6oCtvA5pMA8raXPlg5714A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSWs7usK18k3qDDB3CcZ2amz3585e/4WkICyj/fqFAc=;
 b=KlDhs+1rzjCiMwTCB7LxwnVTJcX1/RO053v1L6zQ1KzkyaR/SDc8+Yg+3PEEaEn8FivGMrs1oo/jF7Zp+oE1LIY+HrOPRVTc7NiPr5LGUidMAXPKQGp/iG1yEWFILfOfYxiDFW9LnqVFoiLrlMejserszoWxQRROiN/iDqV91mo=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB4PR02MB8509.eurprd02.prod.outlook.com (2603:10a6:10:38f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.44; Thu, 15 Feb
 2024 22:38:41 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 22:38:41 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Trevor Gamblin
	<tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 0/6] devtool: ide: Improve VSCode support
Thread-Topic: [OE-core] [PATCH 0/6] devtool: ide: Improve VSCode support
Thread-Index: AQHaYDEPGxqWBrepBESao6wPpbIyRLELo5eAgABalKA=
Date: Thu, 15 Feb 2024 22:38:41 +0000
Message-ID: 
 <DB5PR02MB10213665A16E557F6C5C6EFF2EF4D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <a23568b22a49469e65a2ad94dd6a4db3d54fb265.camel@linuxfoundation.org>
In-Reply-To: 
 <a23568b22a49469e65a2ad94dd6a4db3d54fb265.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB4PR02MB8509:EE_
x-ms-office365-filtering-correlation-id: cb9e47d1-bc5c-4cdc-d51d-08dc2e76dc24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yDpzuOCJ2VnYwWqa5n8arpMjOM4l9kpF0AVvN7GJjylQbmRl6rVQcd88o0sIA1kqzvf7sORym3PpxnODdlZqCpB/caHQOQGt3/e77EltkBWStkv2wdQO5TfQb8ljxRFHmtW4wsq4ybjwjpUWybaq9TSrsuDY7ik1eQNsGUknN3i9HhkrL6v3DWlNhms7NNgIteJUCmpRnhbTteWvve3hG1eE2r/MmPgP+ooedJNe9oF6WL/svEJhW6ash1g8/ajEAiDyJc0yqTYtJWLZZvMKp5aU/sxh1n9Prg5U105fpZj7AW9MVT/tq4d/yo4MCdt/PCXgd70rkfpzdE0EoquJwBUMQMSimsYZI8s1GHQyB9vuutLIhoczyveQr8UMVSmrLL+24JsIWpwfU3/gz2/etjHmBh01Z/+nRcqrwUyLuZIu4pJWxst2VQ/p9a/ALN530Z3+Rglh9I2CGyo/Ksvip/g6tNn0h90XvziNbbN2Bb7xeCv9SAxPIQWu9RRNuvw6AN46+OOhwvjXvt/E8ZSH0ZVut2JVDJLX/hvLIN7nzRMxtKy6uz5kA6rKow4laXV43+Tx6rXVn1kE7FIT5kAceafx4aNpT0VR+9nG8nFnDJp4Lo280vS0UX3KX1c+ZODu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(122000001)(2906002)(33656002)(110136005)(44832011)(316002)(52536014)(38100700002)(41300700001)(5660300002)(8936002)(26005)(478600001)(38070700009)(8676002)(76116006)(66946007)(66476007)(66446008)(66556008)(64756008)(83380400001)(4326008)(7696005)(53546011)(6506007)(9686003)(71200400001)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UFhXcFJWZytCNndOYlZodXdCcmdqR083SVRlUzhIUXdsWnY0MHNlQSs2Z1Ir?=
 =?utf-8?B?T1l3cVp0MEFpL0Z2TTY0TXlnVTFuTHV4d21uV29Vb0FVUzhvb21vNC83Ukds?=
 =?utf-8?B?dGk4VFlmMW83QXZ0UmFaQVV5RWtsZGZJazV6Yy8zYXN2VS8yemVLd1RwU3NN?=
 =?utf-8?B?em82dlM3TlN5Q2xpYktYOUdESlR3a1NIQmV0SjM4Q2Y4aFBsWFJpeDl3Mk95?=
 =?utf-8?B?cTVSZUgxSFZyRE0rTW51V281U092ZU56R2ZUSFFwbnFzUyt6REJMeTVVY0Rp?=
 =?utf-8?B?UVNVSlFWOGhkZXp0SXpXMXVMWDVSaTUzMTgyMjNhemZETENMSzJDamZ1OGJS?=
 =?utf-8?B?M2JqS1BMenBiZUNxUHFVbFpRSi9HcnIxN05XN1B2YVBwcjVHeDdOWE55d0JC?=
 =?utf-8?B?U3NUZXA5WGx0K1JoSDlmd0VybjQvK2lSRlg0SzltNVNIQkJ6Tnltcm5QUDdO?=
 =?utf-8?B?KzRBS25tNFY5aEVraDVoOE5MeXB2WStDb2hOTTNkdTg0NmM3RnFteDhoTG5G?=
 =?utf-8?B?QWFOM2JOL0JBTTZxcjJXTmtNNWNBN1c3WEoweWVPYjZnVm85UGFzZnUzS3RW?=
 =?utf-8?B?V1hacGxFQ2RIUGd3RU5sVjdpYXRrbGtMVEpKbldwd2dvZnAvS1hpNHRBRXAr?=
 =?utf-8?B?dmxOci9lYTFZcGxhZU1KTnBEYWs1SVZrdzBkZmpaVGlSN3VCaW4rTWJJWkJR?=
 =?utf-8?B?ZjQyR2NJQkZaYzFkNEtqWkloQTVMRDl3aVRzTC9sS3FZQmNRNmVSMGVLalRB?=
 =?utf-8?B?dG9JUmpUa3hyMm9uSXorMy85UnBJZDlNZHNUWXlBMG9EbC9YekRRcVJDaGNB?=
 =?utf-8?B?eGd4bHJ4b0FKdW1oWjhtaG1RZGpyb3dkWkYzMTdZT1Z6Z0JvWXFFeGltenJl?=
 =?utf-8?B?VFVDai9OUmFSWWQzSmFRQVNlYm83RklTek5lMWtyd29SZ2NYSlh4VFRVaE1B?=
 =?utf-8?B?ZnA1SkNjcXZrUlpEejlaL2VVVmtFVnFmcll1WHBDQzBCNXRSSE92UDhLTUFQ?=
 =?utf-8?B?MVpNUVNJQWpxalBuVlhxZUQwNEVJZ1VuUTN1MVpUcCtYd1cyRU5SM3Y4OG41?=
 =?utf-8?B?ejlkM3ZFSDhqM1pmUFo3akcvV0krOTBwd0VEb1R4c0JiSE9ia0JJTHpVVGRm?=
 =?utf-8?B?Y3FGY29YUlptalJpZlhtdmV0dVc1anFLazl4aXBxM2R5eE8vWlRCTDNWVm9l?=
 =?utf-8?B?djNsaEt3dWVGZFMrOTRsR2Y1SndsTWVXNkJjdEV2QjBiSnZrcHJraGQybUF6?=
 =?utf-8?B?UTI5ZXgrUHBmSUdYbHF4dldtRUZIY2FiczgyZTRxdkZUVjVhNmdTRHVTd0VP?=
 =?utf-8?B?dnJzZWtHdGI0U0dMT0NHdkFtaGNITm16d202TTJUS0tXanFIU3dTdkFHdmg5?=
 =?utf-8?B?UlFBZG5PUE8vUVo4UGF1RzZSSGIxckpBU0E0MW1xZmhRU0V0MStBaEpBVWRB?=
 =?utf-8?B?V3oxNVY2SDFpaGMzekg1RzNBSUloNTZ1dk5zYmxsbjI2KzZJNjQydFNDbVoy?=
 =?utf-8?B?SGFPbExSMlhwdW9xYmlZZ0NSdnh3bnd1dGQzdTZ4QTFoYTU5RjMzTG00K3dO?=
 =?utf-8?B?L2xoUENXek9rdkFaWmxiVkNsVkFBeEp1S3lyQndtMXZlUnJaei9EZzBFcmdi?=
 =?utf-8?B?V0xVOE5ibXNOQXU5ZFZXSDY1eStodGhab1hOMVNkZ3c3amJzM3pydG9BWTA1?=
 =?utf-8?B?dWtzYUdpS0JTaExZZjc3emdWL0NPOTVhWFJ3OEgvb0p1amtHT3NLaldCYzlV?=
 =?utf-8?B?emt6VlJISG5sSmhaMzZjaWZMbTI5elhWZ3dGMlNtUVg2eTNzb21rYnFkWmRu?=
 =?utf-8?B?NjF6NHRMYlJOOTByV2Z6bmh1aVhKbGRXN0dkMTVyOXhYL3hNZ0o3NFg4NGhB?=
 =?utf-8?B?SXJxSW9KcHhSckx6ZGJ1QWt1K1VqYWFFVXE3RFhwbmhiTUg0RUorbTg1U0ZX?=
 =?utf-8?B?dkNkQWRmTUNXbDBOQmthcjJiL0V0em9sV0V0UGc1NCtlZlNOdk53dWlNakFJ?=
 =?utf-8?B?M3pQalg5OGw3VU9aeERZYTBrc0hIOWRLVmh6MmczN3FlUzcxalpnZjBpYTBx?=
 =?utf-8?B?cEUxeE13TVFleUI1elBBWDA1QnJ5OWlMbVN1MGg3QW5hT29rZHYrTVBXano3?=
 =?utf-8?Q?zoJU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9e47d1-bc5c-4cdc-d51d-08dc2e76dc24
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 22:38:41.3665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wePNd+e5efvHScrZQI2IkiDiBd52sRd7BbYJ+mdjLMKrcxpaDhZnmJdY1sXGf3oP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8509
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195724

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogZGVuIDE1IGZlYnJ1
YXJpIDIwMjQgMTg6MTENCj4gVG86IEVuZ3VlcnJhbmQgZGUgUmliYXVjb3VydCA8ZW5ndWVycmFu
ZC5kZS1yaWJhdWNvdXJ0QHNhdm9pcmZhaXJlbGludXguY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogYWRyaWFuLmZyZWlob2ZlckBnbWFpbC5jb207
IFJvc3MuQnVydG9uQGFybS5jb207IG1vaGFtbWVkLnJhemFAc2F2b2lyZmFpcmVsaW51eC5jb20N
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMC82XSBkZXZ0b29sOiBpZGU6IEltcHJv
dmUgVlNDb2RlIHN1cHBvcnQNCj4gDQo+IE9uIFRodSwgMjAyNC0wMi0xNSBhdCAxODowNCArMDEw
MCwgRW5ndWVycmFuZCBkZSBSaWJhdWNvdXJ0IHdyb3RlOg0KPiA+IFRoZXNlIHBhdGNoZXMgaW1w
cm92ZSB0aGUgVlNDb2RlIHN1cHBvcnQgaW4gZGV2dG9vbCBpZGUtc2RrIGZyb20NCj4gPiBBZHJp
YW4gRnJlaWhvZmVyLg0KPiA+DQo+ID4gSSBhZGRlZCBhIGdlbmVyaWMgQysrIGNvbmZpZ3VyYXRp
b24gZm9yIHRoZSBWU2NvZGUNCj4gPiBleHRlbnNpb24gd2hpbGUgYXdhaXRpbmcgZm9yIGF1dG90
b29scyBzdXBwb3J0Lg0KPiA+DQo+ID4gQSByZWZhY3RvcmluZyBpcyBwcm9wb3NlZCBmb3IgdGhl
IG1lc29uIGNsYXNzLiBXaXRob3V0IGFic29sdXRlIGNvbXBpbGVyDQo+ID4gcGF0aHMsIHRoZSBs
aW50ZXIgaW5zaWRlIFZTQ29kZSB3aWxsIG5vdCBiZSBhYmxlIHRvIGZpbmQgdGhlDQo+ID4gY3Jv
c3MtY29tcGlsZXIuIExldCBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSBjb25jZXJucyBhYm91dCB0
aGlzDQo+ID4gcmVmYWN0b3JpbmcuDQo+ID4NCj4gPiBUaGUgb3RoZXIgYnVnIGZpeGVzIGFyZSBy
ZWxhdGl2ZWx5IG1pbm9yIGFuZCBtYWtlIHRoZSB0b29sIHdvcmsgZm9yIHNvbWUgZWRnZQ0KPiA+
IGNhc2VzLg0KPiANCj4gSSBub3RpY2VkIG5vbmUgb2YgdGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJp
ZXMgaGF2ZSBTaWduZWQtb2ZmLWJ5IGxpbmVzDQo+IHdoaWNoIG5lZWRzIHRvIGJlIGZpeGVkIGJl
Zm9yZSB3ZSBjYW4gbWVyZ2UgdGhlbS4gUGF0Y2h0ZXN0IHNob3VsZCBiZQ0KPiBhbG9uZyBzaG9y
dGx5IHRvIHNheSB0aGF0IHRvbyENCg0KQWN0dWFsbHksIHRoZXJlIGRvZXMgbm90IHNlZW0gdG8g
YmUgYW55IG1lc3NhZ2VzIGFib3V0IHRoaXMgZnJvbSBwYXRjaHRlc3QuIA0KVGhlcmUgaGF2ZSBi
ZWVuIG90aGVyIGluY29uc2lzdGVuY2llcyByZXBvcnRlZCBieSBpdCBzaW5jZSwgYnV0IG5vdCB0
aGVzZS4uLg0KDQo+IA0KPiBJIG5lZWQgdG8gdGhpbmsgYWJvdXQgYW5kIHRlc3QgdGhlIG1lc29u
IG9uZSBhIGJpdCBtb3JlIGFzIGFic29sdXRlDQo+IHBhdGhzIGNhbiBiZSBhIHNvdXJjZSBvZiBw
cm9ibGVtcy4gSSd2ZSBub3QgbG9va2VkIGludG8gdGhlIG90aGVycyBpbg0KPiBkZXRhaWwgeWV0
Lg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQovL1BldGVyDQoNCg==


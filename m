Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52338CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 12:35:31 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6490.1778675723307748265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 05:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=ECpoCN1r;
 spf=pass (domain: ericsson.com, ip: 40.107.162.23, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJMNnTnSlr/bMlMurgJpTlmUI/1twnGrbGwaZibEDOdgUxBD7yDFiBI+woMM2kWdCAenjvTtWuJo58fPgOGjCRAP4ZrlqkiKD4LWUrFi7sKNkLwIqZqASt1Nme5D+eXSwcKGmi1k+EcOqUrRatx7gdzO8MeLYcnkttt9iMbDmDeHfCZw0XdSZaD2xWIo5m/5H3XiNXGo1anbEJv3pMrCRcFaAENdMIGCgZ53KrYNyxBES0dFEE9eHvIxmm7mOpOzpqc61Y2RmCk7kx/1hSLCobp7RynCXeG0kpFTuQbW9VTWSjrbltAAb/EflsJ9ifRFqesdnaOoipHJ9RAxPGeRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q66PuC0QiBV9ZRNY+24M56hHCGg+iWT6tl47J0mwsMA=;
 b=D+ErXabEq/Kcp8/Vf+uBF4/euieHXBb5w2cfk7d4kHNHQ0Ty1kzsMxjwFrZ7MVS6t/Ir3WQjtk4daZaTUtSbrcJHddUvsJzULTZwHckOLKf+b0gZUePM+No8vimq+JJFT/zdRi38LaCbm2+OTvVZDjAO8NS0RW+hDAxgfZewsjFG68apw9lJPXUHbJaaWyrFvYl3RMcgNrlEpSCBoEnXxLy99/Pl1yiCaC6dpoox7hy2sgHbZChV3bZX26mXriDElbhDhIIdKphJ8GuuDb9VM4gmI0NHwzFSPFDpZgPZR2DxRNq2tN+pMhPqghhKtx069rP2vYknytCU8stD6sHUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q66PuC0QiBV9ZRNY+24M56hHCGg+iWT6tl47J0mwsMA=;
 b=ECpoCN1rFOS/z9Rfi4act6Kklp3qsiiod4a0FPLVNjUwA877FCURQnu/utu45r8dfGsvmhde0puaIxpm/yzyvtPZns4teeuY1n1lqnhLyT3gg0Yj1qH9JnqC7dwiHsHYoNYu0TSukLJeGxMfT88dXRoHwLvyP6/PxdwSkB2P+kzu4zEDnvotkhknQBm28X2uUy2186IfQBobThvnLpUPlSr/O74LAbXB3UtWa2dAPy5+taY+sdAgRqst3XiLaC4B8SYfPv3HzPf+Ctv1YHKDO3qNvtheoe2ZdUCj8epe06TClTLbkgktGyrmQKsYe8IUxZrjx+r1jKxWvMqBdnDaUg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AMBPR07MB11950.eurprd07.prod.outlook.com (2603:10a6:20b:76c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 12:35:19 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 12:35:19 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] devtool: upgrade: extract changelog between
 versions
Thread-Topic: [OE-core] [PATCH v2] devtool: upgrade: extract changelog between
 versions
Thread-Index: AQHc4tLgwXnWaGdo6USZGvOnxirbYLYL42SAgAAAszA=
Date: Wed, 13 May 2026 12:35:19 +0000
Message-ID: 
 <PA3PR07MB1072110F842BA663BBB725D5A8A062@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260513121953.3157310-1-daniel.turull@ericsson.com>
 <CANNYZj-UhfEb18RMfDqqg=88GZ1nAtbzEZMp6+AKxBRe6Oxceg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-UhfEb18RMfDqqg=88GZ1nAtbzEZMp6+AKxBRe6Oxceg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AMBPR07MB11950:EE_
x-ms-office365-filtering-correlation-id: cdc0a8c5-c093-444d-92c8-08deb0ec17e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003|11063799003|38070700021;
x-microsoft-antispam-message-info: 
 mNisWC/0VFP3d/GkiinIvNx262mNqUdifwTkFFqy6kPs03hG4pRsHgrYl4CP6cFnU8bXbmTge/P2xYjNIsTUzLKmUNcterZObD+JWUK9ZgsgGJPxPMy513O4i94yzJXrKhRLEPvo2SI3FNSgKtVzRAZ9zYCe2ANSjBcqG6SCh4uqbyYVQKjSGlLMQO/F4a+DLF10Ppe9UBBGCsbt3W3VTZO9Hue0SdqMwMTCR+oV5PbecAL9rHVnNG00AKAkHQEpKGmNSXRHb4NrQ7z3m3/ZxS1shNRl3AH4aBYNQsT7epAwEbkyGv25X4V8ffzEz9G75Eigg2sAlVDjnbVf6HVzsBfGYMy1zx100JmaA0uMif7f5sP1qHtFn5vxddh/lyCHERJAxpKigt3eicBzrhH9Y3/l2WzLHSf84LmF2C+Ie1udcsZN2sbuh6TYJZKwMu8X8sJQcOkWAzuAeSiPGWelcH8TuonZ+Nl20KsEvLXNWX5wmpSzBEpqt2WaSYpFZr0hmljCiYIN8DGnBOK/A0GZXaQW2w/d1CiN9XRRvRPnV4hntQwzkwAa9W6c7IDfpw6fBUMFKoJ4sxghVTH5gpLiLFak5iKr7SC0Uyef4vY7ZeEh/KHpoVAmnE3xHnI/qq1WokLi3Fz3RjDiBlqiOKR2vsw3XPK4dubYVO08zMH957ExX3segXWLGJjqnvSwJDVEUhSzZ9PtNHLm31f5IVZhQ6YBSj2FsV5CiF1Y9EbRQ3QkJaG2LjZtHKU1n1/7Xh1j
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(11063799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q252MjZ6ditVTDY3a2pLYWRJN2Y1WUZYb3pnQ1BUY0NrS0w0Z0RvQU5hSUZq?=
 =?utf-8?B?M0wvdTJvZm9YK1NGbUpIUmhQWmZCYXV6WEdjY1hSS1FNVEdEaXlnSk1IN1dE?=
 =?utf-8?B?VnplU1BrbWZCTmJqTzkySy9pQkRPUEk0S3V3aDFQT1EzSU9UclJJNTQwOWc0?=
 =?utf-8?B?bnhEKzRxakdnbU9yRE9KeThkRWRYc29jK1UvTk9kdTBTMkV3RmZDVWdzU0pY?=
 =?utf-8?B?ajNwd2gyZEMyazB4TUFDMTRhbDFoRU1PZkJMZ2xLT2hnSU8yMVVUTmpzUk1F?=
 =?utf-8?B?NExHbGROREhMSkJRL21WaERBWm4ydXhPVEZWbHM4UmtRd2p6NEtGQWN6REM4?=
 =?utf-8?B?cmZ2UDRWMkwwTWFmeGFqMEwwMkRHR09KR01YOEdTZVVnbmpyc1lRUlJnRFlR?=
 =?utf-8?B?bzFqRWt0bGJnMFZoM3ZGamVnd005UWZubjUyeXpkWjhLSmNxK21hQ09CbFdE?=
 =?utf-8?B?aU5DQXhkaGRnQjlVRDljYnd3azhXL0RQZXk4bXBZRnd4TnlibFVGRkw2cWh5?=
 =?utf-8?B?K0FTV1IvZUpBNFJTSXd3VVZFUkJURzZpNzJJWkxLa1ZoT3U2QWl4K3pIeEJK?=
 =?utf-8?B?blhTSGJya3BMY2FOakpZRXpRbE5LZFRHWmVHcUYyN1liWm1QZUJVVUViWXJp?=
 =?utf-8?B?UDRLT2Qrc2JrSmdrb3RPOWJ5NVJJWFowQ0dKdzZmSUU3MmIyT2s0M2hXbzY0?=
 =?utf-8?B?ckdDUW9KaUJZTVN6WjBnNFE4RU5HZDczZG1jSDFRUXl0ME1maDNDWHZPSXZj?=
 =?utf-8?B?ZXVtL094TVdUWFJIQ3ErVkljM1NWLzFnRUVaTytNelROQzZrR1h6UkdJaHlT?=
 =?utf-8?B?REVmRWtOckV3ZGFrbURnNW5YbjNHSGlTbVF1d3I5SnBjRmFUTzBQNVBOc1lH?=
 =?utf-8?B?d2p2SC82bm9NOU4wNmxMMHAyYndmRmJVTWJsaWhLMHJNL2kxa29XTjlHeVMy?=
 =?utf-8?B?SG83cnV4QzVpbTVhOEpUbDJKdXlNcEh1WmFPaTAvdFdZbWphNldCWmxCL200?=
 =?utf-8?B?YzBXYWlXaWNNODVNOWRybFNlRnNoTlRjRkgwU0RVV2NWZ1ZoclZCa0gvNTNE?=
 =?utf-8?B?Yjhabm03K3g3LzZidDBPeXYrbmV3NnduaEVRME9LZWJja0wyWjkzQTZuRk9h?=
 =?utf-8?B?REJaR1hoMW4rMmlIYUdUWHBwbk9PYk1WRk5ibk9EMUtQcGMzUVZaYTRCQVli?=
 =?utf-8?B?aDZ6UFFrUk5lYm9KWlA5Ukkvc0pNSFFjYXR0YVJ6WGlYS2RCVHhPWjZHK2Fj?=
 =?utf-8?B?OXArVjc5QVhoWi84QlV3V0Y3Tkc4MG1xdkNwdkc1Z2k1eEltYkpoejJHQ3BO?=
 =?utf-8?B?Rmhnajcyd1I4NG1hV3VMNm5vV05kaGxKS0pjVDhzWkhOZW1YSjJ5TlBOWnhU?=
 =?utf-8?B?UGhQL28zZy9tMVlXRnVkOVdaVkZ0REJYM3BBSG1qeldGRVNVZmxXcWV1L2pE?=
 =?utf-8?B?Rk5SZnp5U1hyMllwT0hEQk8xTUF3dnkwd3JLR2tmb0RFK2haaDZkRFh3c0hM?=
 =?utf-8?B?V3ZxUGg3dFNKT2xkckFHZk9RQkY1VUdmaFdyQXRwTGs2ZWdWLzFpbVlveUw0?=
 =?utf-8?B?SjA2aVp0T2lrR0l3TWxHSFZrcUpjaWxmQjlnU1FYdXAxWkM4ZUxTWWRHSE9P?=
 =?utf-8?B?TDJjN3BDVmM1bUVmN3FaY1hTbWpiZGpCVWtxT1d0NmNEaXBTQlhidkZ4WnZw?=
 =?utf-8?B?UCtKcDlYOW50QzRrL2R5SURqbyszdThhYWcxUkpLazErdG1UUHZuY0pPTGox?=
 =?utf-8?B?TEpsK0VnbHgyRHNwNTNqQzJXN0hINHI4L1VLOHVvTUhIazR3MjMzdFE5U1BQ?=
 =?utf-8?B?a0ljakhkTHpIVThlbis5KytGM1lkaXgrOXNtNTQzclNvZWwybkRkbkJVUTVn?=
 =?utf-8?B?U2pFT21kMEdtUk1UbFRvWTNVRFIyTWVvTytSQmkwYlV2eEZwY3VzWE5ROUwv?=
 =?utf-8?B?ems4dnZyaHRUNFZYSy9md0hHeGMvN3c1eldNZVJhOElmSGVUQkF3ZGJNOXVZ?=
 =?utf-8?B?U2NlWXJ1Y2lIVDgwc1BGc2Q3UEtkQmFROTUzcHlnQkhRb1dKUEY2MkpZcmk0?=
 =?utf-8?B?RDFwYWZyZFhNU0tXbm9QQzh2clV4Q3pIUWpvcHZ3VDAyTGpNVDNDWEcvZXNj?=
 =?utf-8?B?R0xBWUw3R1VrZzlVaFlUNUJiRlpqME9uZG5pOW1RakZ6Wk13dmRmamVoUXpL?=
 =?utf-8?B?Z2JkQUJhVzV5VWxxcTFBRDl6bWZHQ2laT0UvNEUrb0g1Z1hhRG92M3oxa0sv?=
 =?utf-8?B?T01sUjhBZG9hTWNzVFZQck90V1FMd3JPYlZTbUdIQ1hPVUVrRlFLS1pBbTdY?=
 =?utf-8?B?SVlaYy91MnNvcjY3Rys4NzJwVnRTOVFSUW1MZVZoVEdUbjJUa1FQdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc0a8c5-c093-444d-92c8-08deb0ec17e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 12:35:19.2270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zwiifZ9DmLpOvePC7nnAwpumuizvF5aHYTTieGHl8ujZaUmVOjCLmwfBYydZZ1KSjFCXbTf7uXYpq8S7Zwcfc/n9tvNIairFe3pQwP1B5oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB11950
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 12:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236969

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4YW5kZXIgS2FuYXZpbiB2aWENCj4gbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTZW50OiBXZWRuZXNkYXksIDEzIE1heSAyMDI2IDE0OjMy
DQo+IFRvOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gQ2M6
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBbUEFUQ0ggdjJdIGRldnRvb2w6IHVwZ3JhZGU6IGV4dHJhY3QgY2hhbmdlbG9n
IGJldHdlZW4NCj4gdmVyc2lvbnMNCj4gDQo+IE9uIFdlZCwgMTMgTWF5IDIwMjYgYXQgMTQ6MjAs
IDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4gd3JvdGU6DQo+ID4gKyAgICBkZWYgX2NoZWNr
X2NoYW5nZWxvZyhzZWxmLCByZWNpcGUsIG9sZHJlY2lwZWZpbGUpOg0KPiA+ICsgICAgICAgICIi
IkNvbXBhcmUgZXh0cmFjdGVkIGNoYW5nZWxvZyBhZ2FpbnN0IHJlZmVyZW5jZSBkYXRhIGlmIGF2
YWlsYWJsZS4iIiINCj4gPiArICAgICAgICBjaGFuZ2Vsb2dfcmVmID0gb2xkcmVjaXBlZmlsZSAr
ICcuY2hhbmdlbG9nJw0KPiA+ICsgICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhjaGFuZ2Vs
b2dfcmVmKToNCj4gPiArICAgICAgICAgICAgcmV0dXJuDQo+IA0KPiBJIHRoaW5rIHRoZXNlIGxh
c3QgdHdvIGxpbmVzIHNob3VsZCBiZSByZW1vdmVkLCBzbyB0aGF0IHRoZSBjaGFuZ2Vsb2cgY2hl
Y2sgaXMNCj4gZW5mb3JjZWQuIE90aGVyd2lzZSBpdCdzIHdheSB0b28gZWFzeSB0byByZWdyZXNz
IHRoZSB0ZXN0LCBlLmcuIGJ5IHJlcGxhY2luZyB0aGUNCj4gdGVzdCByZWNpcGVzLCBvciBhZGRp
bmcgbmV3IHJlY2lwZXMgd2l0aG91dCBhc3NvY2lhdGVkIGNoYW5nZWxvZ3MsIG9yIHdpdGgNCj4g
Y2hhbmdlbG9nIGZpbGVzIHRoYXQgYXJlIHNsaWdodGx5IG1pc25hbWVkLg0KPiANCg0KT2suIEkn
bGwgZHJvcCB0aGVtIGFuZCBzZW5kIGEgdjMgd2l0aCBpdC4gVGhhbmtzIGZvciB0aGUgcXVpY2sg
ZmVlZGJhY2sgQWxleC4NCg0KDQo+IE90aGVyIHRoYW4gdGhpcywgbGd0bSwgdGhhbmtzIQ0KPiAN
Cj4gQWxleA0K


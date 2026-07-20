Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C07C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:12:15 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2631.1784567528632775815
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=FKammSi/;
 spf=pass (domain: siemens.com, ip: 52.101.65.46, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNaa7ZncTNDNhMAyLGMNxP51mDaR5tCyTwcQSq+rwvyAwutMDf4UMc3bMGMmLcMJFJb3Y2kzIsTpdkxz527LyxAGEhaSFe4ZhvbwzWHTbtyCKMA/U+ltwiTu8zAwl0b3Ms5XYYQk81YenJhdPhkkN/uju33jiMv6bg+QpxNVxMqIDZTojC+gQYdN0AXeGmwYD0azSJJJJN5roCs9CbStIO6KUuFG3XuHjKQaPeAfQ3HQaZmiQsnlJwGpvTrBpxSDljdS19uQjHwFOx2fTvzHftyG4RkI3kV7v4cSE07vn2gimj2ySmv0wcbhCgbzCkcmHpyELHJ/nsDHUBUkVlxKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e//aAMtSbJi1T+yN7v/BqibCM01rpz+1P2UM5I9XTwU=;
 b=t55dv7b8gFC0t/VDLEIFg5FKN2NgDhbIQoxFdJkx9Np9Zf+XiHCgtMiSZIRLTiJ0aoey10lLS+Pt1tGRz4k+GH0mzkLx7AWry4nIA5MUJjmcHygZsumOTzjWDwWhhT3kR40tvxPA4bC6DDyvB28yAjS5SWwItOWrhpwRU75g3WEYaGlTIynNsqLs8eT5b/f5lnKmIyxDYAzkKcdvkIUtI2CqVVkjg41779uSffOLLTDeWVWXqM7QdYfbY3N/UuMsufBT4is46vOyWfHec8R0OoxUoQIE5llv7zu6KAGbk5kL0+u7jsbvlOlcV1NkSvv2GBgia3WVo+LbFl2NzfV2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e//aAMtSbJi1T+yN7v/BqibCM01rpz+1P2UM5I9XTwU=;
 b=FKammSi/5Bnm013XTCfQ3I82n0qDe/q66Erivp7BdotTgqrMEYA7DmqcQ4JrJv7e1MbOmL1wA3qMLF6sHVbcoVRJ6qHJRAi0cr/sygg+J5kIdyd4CpojGoMDxk5Mfm7sU6O9kck71kyCptzGJOjGzcnr2opwHMXuHSoNlsMwVGFmH30KmfZZwK9d+ifdplz94L+eT4FWuc25RhjuTMNhbTTiZGl/aVdKvs7Y/zIwAa2oHw9oLvI2Lc1TVLW3kF7RwioqKLBR+f3K3rSKeXunOjgKysGJLSLunrc8JicKPOR+Dn/xlk+NGUw1QngDkp3EnulgQRAHHOnaKD4/h8wQYg==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by PAVPR10MB7379.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 20 Jul
 2026 17:12:04 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:12:04 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, Paul Barker
	<paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Ryan Eatmon <reatmon@ti.com>
Subject: Re: [OE-core][wrynose 05/17] kernel-fit-image: Add KERNEL_DTBVENDORED
 support for FIT_CONF_DEFAULT_DTB
Thread-Topic: [OE-core][wrynose 05/17] kernel-fit-image: Add
 KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
Thread-Index: AQHdFpMIn4L+Bk3djkW8bp/LFE0fvLZ2CMiAgAB/I4CAAARzgIAAHBYA
Date: Mon, 20 Jul 2026 17:12:04 +0000
Message-ID: <9458056a790af0040471655b15cfbc6dc19bbef6.camel@siemens.com>
References: <cover.1784364567.git.yoann.congal@smile.fr>
	 <1b6dd4f66b2f4c1a12791a1db3a53729ce043fd0.1784364567.git.yoann.congal@smile.fr>
	 <c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev>
	 <DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr> <DK3I8NXUCRHK.C3U8MB8K4NZV@smile.fr>
In-Reply-To: <DK3I8NXUCRHK.C3U8MB8K4NZV@smile.fr>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|PAVPR10MB7379:EE_
x-ms-office365-filtering-correlation-id: 4e95c42e-8464-445e-06f4-08dee6820581
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|23010399003|4143699003|10067099003|11063799006|56012099006|18002099003|55112099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 uQ+8LUjmUFoVUYRv+yI1Zsbn8ojpNFQYwiG0i1ouTFsyh9VluwWlSgjoN01zuUCSKVGzhBMujj1//f1rYaxWE0UqyE5jhI42DY0YCIQHNa3VsGUsRHMlWG2X/i/dubocshIOOz3n1HrkTETRzcLoXoCcEZ/cJgW6gBHvPihi+r6PE1sfRl7mJ6/+RR0K3kXWDVKxz6ocOnzgaTxxN5AEEDaQj3EUCSrlgXpbmrjFCHIn2Ti0uqtdbuqcA1TvoWJUG5lW+4qU7mCYvQD2bZTKIngf0avzec9hBnjVLd0Zwx1B/i1Yv2Fhkv677mS+oqXRihXflqx5vbJWXSbZBxK88X7qYptLwsCE4fxrhVQEIY3vEmsq3S6N6R8FSbKhBaAgbjE6xXT5/lMDi3RPZl9BCprnA2vFMxi/exDJrpGGSK/g4Q/C4IrDL9A8uCy66Qgh6yk3yAaInpCP0CC4oDqRe4wJb7rJxrBmHhHOk7TCBV5Gb7HMZ8Z26GvVJaOZIGzIi5ek9Rp7F3TamCDlN12duK9+QEbufoAOnfpy2uN1qFO0VjlwslKPB6LEfw0SvEbhyE0dQ/PKc+PZqEFTp2aRgDaHIj7D3xJaUmm8qebWvphvjq+O7lLLXfSFrM0sDa1jhQjGki9ZyVzWMRWStesgQdruMxlbctRsviwwTOsK+OU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(55112099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eTkycDdzd2Z1R1ZscWV4RVorWEx5OUpSazJGKzdmQi9ZQU83dmE1U1Z1YXU3?=
 =?utf-8?B?bjUxdjEyenM5aHpXY0lCTDlmc09EN05Ba21wSWRlTDJSVm51OUJaa0dlU1pO?=
 =?utf-8?B?WlRyWkJGUUl3dzJtQjlGQkdHNVBHTTJnVHpMbDZYMzZjVVM2dzVmS0hpTEFR?=
 =?utf-8?B?QXdDaGJkYzczTXVWVTZ5Z2hmV0xpU0E0c0hidWcrZlhrU3NLNitVb0VWaFpU?=
 =?utf-8?B?N1RLMkpnVXZPSmRMVjZDMnFuZ2tXMXRaaGF5aE1yZTVJblRxVENRa1V0eFJ5?=
 =?utf-8?B?L3FrT29zdUVIL1JiT1ZPWk1sZ1JVOGdCUm1PWlJUaUI1MXJtalFQMVI0bGFH?=
 =?utf-8?B?RG5la1RTZzFJL3FrQ05yaWhIdjZ2TDJkbEU1OE9NRXRsYVFtczMyYnNZYWNQ?=
 =?utf-8?B?S2ZhTnBZNkRyMFdsd0V0ODMwMVMyY3ZnYmFwV1lQaUFvK1c4eSttVXlCK3B0?=
 =?utf-8?B?OHFYYjdjQWIwbitxVEpDajduUXh6bnphOVdUSVk0TnhDcHVmdnJjeHRieVdV?=
 =?utf-8?B?b1pQNVlkNnlUS2dtRUdkaUZDYk5SbTkrb3QyUk5HN09YYy9tcXZJb0FiU21o?=
 =?utf-8?B?NnNMa0xuQXhGMlg2WEVXSjVsQXg2UUE0YmNManpSRXdEM1ovUFpBZHk2S0dt?=
 =?utf-8?B?aThRZzk4UzFuVkdQY2hCVzJZWmNaOU9BWXFHeXFJTm1yNWJVUE5WME9HNjZC?=
 =?utf-8?B?VmZpWDJIaDc4dU1Ma2VjM2pGYi8zV0VZTXduRVVhZUZ3dHJKampPNEk0S1Js?=
 =?utf-8?B?eWIvNENEdzZlTFQ4QmExaUc5c3JpeFNub3lwWHlUSVJkcGI1K25UYzJ3Q2xM?=
 =?utf-8?B?YUZMRHFMNEZLT0J0VWdDcEpSU1Z2TkxIOSt6WUF4dzBMSzM2blk2dDZYTklq?=
 =?utf-8?B?WGgwak1ZVEo0aVlSYWswRHRjUS9rY296b2k0Tk1RdmJlcTE0Z3REUEhZV2hW?=
 =?utf-8?B?d2Ixc05LYS9wV1A4bmF5VnQwektVYTFZeFhDdTlxbmhXRkxHZ3lwUXczQStR?=
 =?utf-8?B?TXFvT2ZRK2xONDNJR0phYWpGZDlueGYzQ2FxbU1vR0FJZ1E3K0sva3hPYktm?=
 =?utf-8?B?MkhNbDRwczVJdEkrNVZkdUlRdnRsbFNQaEJKdzdxU3g4NHZOYWRFWndYU29s?=
 =?utf-8?B?QXVrdWRoUHFxOGJYY2EveTV6a3Vic2NpM1lPbmVCZkk5NGowa094UGhjRXdS?=
 =?utf-8?B?dCtXWWxPTWs1YTE3ZWRSb3NLaXVpU1c5Q2F4TXI4OFMwM2lHRmltWTRYOXl2?=
 =?utf-8?B?dlQzUEpLMGs1UTR0SUh6UHdtc3VrZEdrRHBWZzl6UnZBTWdhOW0ycythRUVT?=
 =?utf-8?B?bm1mckducm0rNGVjRTROamM4bWFTaWdwT2VMOWhSeld1amFGRGZjemZscytS?=
 =?utf-8?B?ckw5MEhXM3c2aUxEZHMxdXJkUUR6bTE0eG5JQ0pSeE95bEQ5dEE0WFZRdmVX?=
 =?utf-8?B?SitjL2VONnhSRERLZ1l1SStNc3BkYkd4aWpxSHRuZnFLU2pXUG9PcDJrbEZu?=
 =?utf-8?B?S0pyaEhaT1pNOWd1blYxcHBNUXVDanMwQ3FQdjlsS2lPd0dONU5DMTUwTVU0?=
 =?utf-8?B?ZWRtbUV5NFg0OW9QYkFOS3VNc3orSHJ5S3BvM0IxUmRqTnVNNEpOaW9ucTNE?=
 =?utf-8?B?SGJydkdObDBuVlMzRHg3MWQxZVE0NEJHb3ZITFVaaDhNM2huOVVmbGtpU3Fv?=
 =?utf-8?B?YTRTUjRyZEd3MUloUHlIYTBXOHhzWC8wNjI2VUpTbklvRFJOaVlVRVVxMFBn?=
 =?utf-8?B?cWE0VUFsWndBeGtobTVXNHZzYUdYSzVJcWFqRGhKQ0xseW9LT0NTM2hwSUtX?=
 =?utf-8?B?Y1dOY3ZyMWlQdklzdGkyUERDMENpQ0JCVWxuc2pzYTFsTEt0NFo4aUlXVWkv?=
 =?utf-8?B?dDcwMXR2SWJyb2VpR204STYrTThWWUVNMTQ4VjdQdENsTUxqc21JZFplTmZh?=
 =?utf-8?B?SW15VUI2dWF6ZUpaWUJsT3VpNy9oT3RsN2QvNzVVWUJpRFNEdEh4dDFkSVdX?=
 =?utf-8?B?Z2kxQ0loVnFzdnNPbHlFZkVZMGRHajBUdkJCTHVCaHloRzNlY3UrU3A0bGNm?=
 =?utf-8?B?NDZ5WU9EK0lyNUhYRDdtSnhaazZkSm9HZC9FQ3lTOTBnemtEUkQ0c1piVmpM?=
 =?utf-8?B?Y3lCMWNTY2pNMTYwdzdqQlA0TVM0UlE2bFcvWEZlck0xaTZ3RWkybkZKSUZB?=
 =?utf-8?B?RHlEZGdCbTNiWFdGREg1dVpjeWp5M3dBcGgzTkRFZ2pNcHFlTlNFOVEyRnU1?=
 =?utf-8?B?UXlLVnZQeUsyRjBFcGVlMFFJWFJ0cTFQTEw0cStldzd6bG0wUWVYeFRrREJ3?=
 =?utf-8?B?WHB0aEhjL1AwNStzaFVwbkU0ZzNLaFFkb3owaWZRVi9ZaDZoM21QUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B065D9FE03AB04F9927F411DD3D51D9@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e95c42e-8464-445e-06f4-08dee6820581
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 17:12:04.5261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0H0VHdvSfHxAeulTt7dJoOjjQr7vafO/QhWzeONEXrv3K6R26Rw1vz5gz6rMI5QtXpJS/RMwL31T8itKC4ZO/0yuQQDU2b4jHffsi5iIzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241432

CkhpIFlvYW5uCgpKdXN0IGEgY29uZmlybWF0aW9uIGZyb20gbXkgc2lkZTogVGFraW5nIHRoZSA0
IHBhdGNoZXMgaXMgdGhlIGJlc3Qgd2UKY2FuIGRvLiBDb25zaWRlcmluZyB0aGVtIGFzIGEgc2Vy
aWVzIG9mIGJ1ZyBmaXhlcyBpcyByaWdodC4gR2V0dGluZyB0aGUKdGVzdCBiYWNrLXBvcnRlZCBp
cyBvZiBjb3Vyc2UgbmljZSB0byBoYXZlLgoKUmVnYXJkcwpBZHJpYW4KCj4gCj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzI0MTQxMyk6Cj4gaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yNDE0MTMKPiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMjAzMjkx
OTkvMzYxNjg1OAo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnCj4gVW5zdWJzY3JpYmU6Cj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWLCoFsKPiBhZHJpYW4uZnJlaWhvZmVyQHNp
ZW1lbnMuY29tXQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tCg==


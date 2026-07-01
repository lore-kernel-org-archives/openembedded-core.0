Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3C4C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:48:41 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39274.1782888517974635321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=HzBx6StM;
 spf=pass (domain: est.tech, ip: 52.101.66.40, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=te1Rn0b7Pc44AzdB7SUc05gcNKFCKlRgPrOLnmNwbaClzEvBIZ51ljpCmy1/DZAYsW0JPTVGh1tLW7BmXRLa5WXdxUZ+M44mAD+KjrYo6+w1jqETj4lMDsbwUaaAYcGJyiqwm/fXrFgYJ76StH6JyCIxc6vgqnbXnMPULQ1H7qkwQxN2pxw4Iq+KhFYLmOaZDQ8lK/x+FOSOHpTPNQiBwJl3sut6pSQrByzoCBlGW0Nnlz6c0Ns8Iwbr3r0ec93QBPWmTuIuMnsW9BOaO5lMjeWZzG1MfHr7esXCTihvm/P5QnO7cZOH65yHZaXdc6CMyol4dwziV/jMM0Soo/jcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TE9W/l76xdjppFuEkxBoyagedyxl/jiTuEOl3XpKjI4=;
 b=GrwgjcwcebuHbHbXn5cJAJcrRfqIr8rd4VJ99ry3YKI8nO3dICzsqivtNN4I+ZVWbjecjJaAny8ysckvvTl2y+RhRrSeEnkCJZpVjkLjLKC6fS9KUSlJSHJH9bBt4KPW2DMC8JBbe8p9LJCeFaL4y0P66MokWk7FQjTnV8cbIuQr0rFK7mAdOROgN1cx4/5aF7c1nZI5m1XjWt8BTYys9N4Grky/pobQq4+6mKrgj6Ani5zt+9/jYHqz80GiJVROBxbdZ7+jrFLt2S9VpG+dVkYeK3LA19oqVh+MVoa542ZG8/6wNJWkW7NW2SIcmVOpKh+soYbfCX+xveHAK9XTcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TE9W/l76xdjppFuEkxBoyagedyxl/jiTuEOl3XpKjI4=;
 b=HzBx6StMZDV77BLXWbfJs88hOLPFas61JoW2bYrpqQN4+4hoA2KfTK6NkVv3jpp6l6Izfkou5BKemChIU8N3RtQqGtABhqRRz1w3+264lD7blPOv+Cf18d/6Bqz0EOeLNRHbvKBWDVT3Xi3yR1eyUpFAteMwO4gUrz3DHaP4hyQTZHbRUkaTwzElTAyy1GihY071v7GCxTgt9sCcCS7ujUyxY+f8ajswpb+wLy1sRrmcV6V7I98NsPwu86Cx+0S3PyOrMwgjp+MPwdIX8/N+D25PM8JJhYudU8Sp8q+KPWGw4KaBLXQ1LC8co335UNg8kZBkHK38X12ex8S9+1lr+g==
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by DB8P189MB0681.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:128::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 06:48:33 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 06:48:33 +0000
From: =?utf-8?B?Um9sYW5kIEtvdsOhY3M=?= <roland.kovacs@est.tech>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][PATCH 1/2] gnupg: Upgrade 2.5.17 -> 2.5.20
Thread-Topic: [OE-core] [master][PATCH 1/2] gnupg: Upgrade 2.5.17 -> 2.5.20
Thread-Index: AQHdCJDiobPJHlytJUmtfOOpcfgMh7ZXFDWAgAEl7AA=
Date: Wed, 1 Jul 2026 06:48:33 +0000
Message-ID: <e13ca9c7a8c77fa156a901aee65e42b62d83c93b.camel@est.tech>
References: <20260630130341.71014-1-roland.kovacs@est.tech>
		 <20260630130341.71014-2-roland.kovacs@est.tech>
	 <CANNYZj8LEYXW_NF-p=Beko9__kL4u_1=ngAuP1KFO6wUidUG-g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8LEYXW_NF-p=Beko9__kL4u_1=ngAuP1KFO6wUidUG-g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB0725:EE_|DB8P189MB0681:EE_
x-ms-office365-filtering-correlation-id: 3bc2d31d-3ae6-43c5-4891-08ded73cc50f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: 
 bFo9OBLzRElMiF4032f8SfGIYqnjHXFuXaMU3ahnnLbL9pKN+5/oeLf9SON2tRrZ+JFMql+NZVLenXexU4fcANyrA1pJ+PTVjfac4iDLukgHVIHgEFZcmiPLN49SHRAhkfBFUa9LXnoYFA/rPmOYi4211SC7b9a/gD4ZUZoLPqPgDTRCRcQ3mKg0cVp3mxuelNnu1kCaMjh6KLqAh5MLRNrMzciYbrmGGeOCytJyZIXycHW6HlDi4oI2DysH9v7sg07By53M3aSJULDovtfU0Os5Hs+4WkSFaOumentgpMvbcc5I5wTvNfo/i8EDq/AexxlRarg0fZrIN9auZzKxcZfxqH5NypeeFIwoGje4R/BFjWz5kTy2TWOJgeNegZ8rED+Cl8W5arWefB7RI4DTmxAk7Wnf0rncUclCVCVmYo6kJcAZLxOWyTRS1iUUQpN5tPEoHwp+xfecwMJe0To5kTo3J+hCleDRsvgtSeZ6Md6cwSXAdUedfEleqJNwt1twoHroiGrY4WI1hoV2BW8MwMHPo7M9RlviCX1JqCGSNa3WSmTUD79SJboH4BMseukabIQBkSJqJxrPt38V6yVdetRoRBx2PBFt6pJGCh/RNJdI22KAC+rZx4SYDQEaLGufe8AEUdy8AYx1MCk/zW9r87i4uoLNkyK29vp8GavwzNSAvahCFbFsm/PQ9MWyxgzBNcQ8vo0jmyY8RT8p589hxQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y2ZLUU5iR0tTMUxHbWNLOVdNaXUybVVSVFBwMVJZc0JSNXVKNitxWkVzNlJw?=
 =?utf-8?B?M3Q2akhUSmdadloySEEwTWtzZzN6QStLZGQyZ0RETDUxQk45RlA5Y1RJMlp0?=
 =?utf-8?B?RnpaT3pWdXlOTm4yZjBRWVBtczlnSEZFR2xGVGc3cGFrSktyYk1RVmlTNXpB?=
 =?utf-8?B?OGVLSHdWUDRReWxhdlczNjcraTFicG5CL1NWVnBpWTVTWWNkSi80b1grUnhE?=
 =?utf-8?B?c2hZS2lqbldqWnIwQXQ3MENvMzFmTzBrT1RmT0pyNG1oSkRBZmZEWmxQR0Vi?=
 =?utf-8?B?SHU5cm9La1U3WVNEUlNDYUI5OS9HTUxDWEtacTdSNk9BdkVwUWFxQ2syVjZ3?=
 =?utf-8?B?YjAvbno4V0xvcDlYWU1KaVhUUlR3dkxrS0VGbk1CK1FvbEEwL2hzWkFQRGg3?=
 =?utf-8?B?RXl0NTUzekt6ODVqSk9YYm5hR0M3cmtBajdyQTNBWEVPaDRjWnFkRWxUK29w?=
 =?utf-8?B?ODRES0V4ajRqd3ZUUnVpNDhiSW00alVwS2ZPN21scFdIUy82TFUvSHRUUUxT?=
 =?utf-8?B?NVB3MHN1U2FGL1NIMkRvVndvbGRuWkJKMmhXUUREQjhwYlp4R0dxYUlMNnhk?=
 =?utf-8?B?OUlwN3NrU3JBTlovZWIwTm1rVU0yVGJDSEhUZ2xsa3cwdG5WdlZXU1daUjJG?=
 =?utf-8?B?QlpvSnlRem11UW4rZUJCTk9ONWpqNjJiNVRzak9BcFA2NFI1dmdQcnBmMnRa?=
 =?utf-8?B?Q2tBbys5elpIM2VVMkF5THFDQi9HVDhuUlNuMHgwUFRtNCsvVmp6Yk5EZjQ0?=
 =?utf-8?B?dFpTUTVPS05SbXAzMVQ1OXJKYk9hTk9EbjJOQXQ0enVMdFI0bWdqV1JoYnRD?=
 =?utf-8?B?ajlDWVovdEtDR0c0eU5ZQnRVT25sOUJ6UCtwNTA4UUYyQTFueXFpeUdyNFZR?=
 =?utf-8?B?QmZObWpHKy9wK0RwbytjYjJEcDRKNXRXRHFDc09QbjloaEpzR214bGV1dUh0?=
 =?utf-8?B?VjF1clRFK2IxK2hHV2c1M2grNXNhVno5ZS8yNklDcHFsN2lJSWd0azFpSXF2?=
 =?utf-8?B?L0RzUDJlRnE3NnpvczhjVE9NSEk2T01LMCtSSUJkQ1hJMFM3a2NkbXRUWnFH?=
 =?utf-8?B?czBjUTNoMTlSbEllNFlVYlBLNFNrSTFUT2xKS0RRMldlNmZ2SGJ6R2JUQXgr?=
 =?utf-8?B?VE13cVg3Ky9Kc2x5RlFoeWk4SlNtNi9xOE00N2M5eWltUFhLYXQvU1FMSXNp?=
 =?utf-8?B?TnFGYzY2QVdLcTBKTmQ4azJsdkdBSFBiR0grZVpqS01Ncm1XUXV0ZFkwTERu?=
 =?utf-8?B?TDZxZEY0SVFaUHR5M2J4OTgyS1ljTGNZSktOQnpCWlZneVhwWVFvUkJSbkl5?=
 =?utf-8?B?QmNuRG5aYjZpME1XeFliMndIS3VCWElScG45bERENm1qL3V1Nm1KeVE5RGkx?=
 =?utf-8?B?T0RFR25JbGd2dlljMllSdnZySDQ5L2hYVUh1SDc2MUxpV0pDS3BDNVM5OGRy?=
 =?utf-8?B?eGlENWxXZ1dVeUNSeFliRmRzSzc2UUlMekpWQk1tM0VqOGpzMVJjVXFuY3Nz?=
 =?utf-8?B?aU51ZEZPRTNnUUJFekJMNlNoYnFkMTBPcVpDZmV4ajJWeUw2S1ZkRVQwajVl?=
 =?utf-8?B?d3VJMWcxc2JVeTNqdGtueVFjZnFDei9RSlE4RGxEMjA3ZXVVSFZ3VnZDaW1W?=
 =?utf-8?B?Q1orUWZXOFNNRTRQbitpeGhzTEM0YVhPdW9kSVJsRE13dzByY3o0cjZTK0FY?=
 =?utf-8?B?dVVmdXdHMWRmUlk2VU5mZkYyYUJQTHNEQ3VhUWtTdVFqVFRSdEI0RzNvblBC?=
 =?utf-8?B?aWNBN3JBQ3JRUVg5QXk2Y1pUTWFXSFZTa2c3UnE0UmVwRTBodk1Tdzg3U2Rm?=
 =?utf-8?B?dmZnUVNXRVdvQ0p5d0VpYW11OGVzQUMrczYwaGQ5NVBVcHlHQzFKcjIvQ1JQ?=
 =?utf-8?B?VWFGZFdybjB3TTBzbHk2QjBkU3czaEdMdzZteWQvTWlKbS9iN3BpeFlQbktW?=
 =?utf-8?B?ZlNTT3R0MlpKT3NJN1UvelV4eFY0aUwzUVRYYVNHK0dMeGNHT2U0ZHpSTVlu?=
 =?utf-8?B?VkxncWpIZTJpL0ZzTGFZNURkVGoxamJPMWdSY2xnWndINnhpMDdZK1FiU3pu?=
 =?utf-8?B?OCtEVkNNY2d4MXF1cWdxSWc4V1pZckNXUnVpaXcrMFFiU0QwUjdhVjUxUFFt?=
 =?utf-8?B?clpzNkNLYjExR0pOdzRmdlNFRmVyN2ovSlAwT0RtWVdyWEdRbjVxSy9vWFZi?=
 =?utf-8?B?NjRZSHVlSVRUMW1tOGhzVFpUUVVRYUFMNjJqNm91TUJIakVpSXM2VUxiZUVS?=
 =?utf-8?B?R0JoUzlrSWwxcjBlN0diNXRGcmhSWjMvQjFRSDRSaExvNkZWNjdzdEpLNDhn?=
 =?utf-8?B?UVIrSERVQXp3YXpPaDNvV3JUOGd3NjJ6MUR0SlM0Ti95V2x6NWw3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <711D49D6C685234790D31469915CCA06@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc2d31d-3ae6-43c5-4891-08ded73cc50f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 06:48:33.7277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOSbgUpNP2eSqsvnxT20Aqv0cncYJGGq66GbCH6XZKeVd9ZEsKorrAYvaQwSnZalXGmVUF7lgrZRV0YuU2gPQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0681
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239944

T24gVHVlLCAyMDI2LTA2LTMwIGF0IDE1OjE2ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gVHVlLCAzMCBKdW4gMjAyNiBhdCAxNTowMywgUm9sYW5kIEtvdsOhY3MgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHJvbGFuZC5rb3ZhY3M9ZXN0LnRlY2hAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gwqBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6
Ly9nbnVwZy5vcmcvZnRwL2djcnlwdC9nbnVwZy8iDQo+ID4gK1NSQ1JFViA9ICIzNDNkMGNiODkx
MDQ0MWFhNDRjNTZjZTg2NzNhNzhlMTM3MDQwYzg3Ig0KPiA+IMKgU1JDX1VSSSA9ICIke0dOVVBH
X01JUlJPUn0vJHtCUE59LyR7QlBOfS0ke1BWfS50YXIuYnoyIFwNCj4gDQo+IFRoZXJlJ3MgYSBz
dHJheSBTUkNSRVYgaGVyZS4NCj4gDQo+IEFsZXgNClNvcnJ5IGFib3V0IHRoYXQsIEknbGwgZml4
IGFuZCBzZW5kIFYyIHNlcmllcy4NCg0KQ2hlZXJzLA0KCVJvbGFuZA0K


Return-Path: <diego.santacruz@spinetix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5493CFA763
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 10:59:53 +0000 (UTC)
Received: from ZR1P278CU001.outbound.protection.outlook.com (ZR1P278CU001.outbound.protection.outlook.com [40.107.168.122])
 by mx.groups.io with SMTP id smtpd.web11.19396.1728039590742804810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 03:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=PuoI0LOk;
 spf=pass (domain: spinetix.com, ip: 40.107.168.122, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vzd4eZRpMjbRUUNzMZ69N+20ZtzSHTUYqUSf26fyiRmIlhQJF0iO4Mjz5aUaBMMhLwnwnHGiEWY/3iva5XRhyp/M25DEqVn6MS7Ku23mldQDW/e+NScHWfhryQ6uLuFJzJwY+tuDFLKfGYKizOljRXj3K0lM4yWDwXAuE8Dkmkp//gbOeoqDv3SUhUbKlSUfZDp+RHu11/9x1zJ7BtP5Dbag4XRi6Z8jNZC+saYlsofiMoKZcaQ/q1NU1bAc7e04hjoR9NWEhZh/INVh/FMaPCjyBBak36SaQ0+OkAKFon7JBBAxds7/nQnUu9BP4VtIKq+40MwNZsJPFen5SfLQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PynbZ92AxIXEA51sUzT4agucv6JGLHkc7/F2f3BD3V0=;
 b=X4bZLT8BkJPTb5610mdycnwDA62/c7P1p2cGVKsZ5cix0tgwIC8cNFBYobe2KqQlCkblNyK+zrmQc8iwUNTXQPaNYq6iwfPFzfcIM1Ey2vYwSQpTP84IJDkxo96HQxLQZdv7hGTBbGN25B2hzjPfsT0r3jzDOHV61+fHBSdcBQKHCPlhHCaTwTacPaBCmpxHZbJxmEx2ne05dYkVsdhZW5e5kFqrvix0IUaVmCxHaQLrntifiSmEelNGoOcZ31Cq39fGxGX2SUu16fsDDe5DB4cMbHq1swz2NMLqROwYYyhzqeJlJGAGRfUVQ+kVGANnwjIY1OYOgVzhrBksMU90sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PynbZ92AxIXEA51sUzT4agucv6JGLHkc7/F2f3BD3V0=;
 b=PuoI0LOkjAT4IHEbwtXaqhhFdDiDVL14YDb4+OzkC3FnzMIZBCRgNvPCEQ0vU3rZNPproFdE2diErpllK3O/ge4rnm2rOXl/MANkMxHAIL54spu9fPIAm5gsvr4Rshoy1R1eF3Q+LSpr/GEE42X2cVHNwEVE4m6golSXs9AwFNI=
Received: from GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:33::13)
 by GV0P278MB0003.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:27::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 10:59:47 +0000
Received: from GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b32f:8f10:6660:4c30]) by GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b32f:8f10:6660:4c30%2]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 10:59:47 +0000
From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] pseudo: add man user and group to fallback
Thread-Topic: [OE-core] [PATCH] pseudo: add man user and group to fallback
Thread-Index: AQHbFkaGzTNDV4cs4kiCw3yosgAsXrJ2Y66AgAAB0rA=
Date: Fri, 4 Oct 2024 10:59:47 +0000
Message-ID: 
 <GV0P278MB0241E4086F65AC9938075ACB88722@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
References: <1728037005-31667-1-git-send-email-diego.santacruz@spinetix.com>
 <5cb8922b31b537468a104e48c3f21a88af41514b.camel@linuxfoundation.org>
In-Reply-To: 
 <5cb8922b31b537468a104e48c3f21a88af41514b.camel@linuxfoundation.org>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV0P278MB0241:EE_|GV0P278MB0003:EE_
x-ms-office365-filtering-correlation-id: 2e4aac93-da73-46b2-dfd4-08dce463a932
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SEZnd0NmeVNYdWpQQXpzMFM5cWZqZTJBZ0ZPZUpEeWV2NCtqcDFWdFdVeWhN?=
 =?utf-8?B?OEF1K1pJT0dXcmd5TEVpaEIyNXRBdXhYSC9vRnUwQ2xlcFUyS09aZEJzWkJv?=
 =?utf-8?B?ZTN5d3FKS09CNWtRWUlsOFlpU3pJa0RUbkIweFYwN2VqUm9Wa0UvajV6ajN1?=
 =?utf-8?B?N1N2dThKVDgrK2FxY3pYcU5uY0JjK2o4Ulh1Rlk2ZENmUWJQWlVMSTBVK2kz?=
 =?utf-8?B?WHhScEg5eDVUdFByL2ljUnUrZVIvdDVPRXZLVFhvdmZEZEN1eGJKOGlRblAr?=
 =?utf-8?B?ZWVXYmo2TWdnSGhDbkd6VTdTSTgrUWdCWm8xdXVjbnFjUWl3VnlQdDV6UDJj?=
 =?utf-8?B?aXgwY2FYL3A1YzNNY1RjYjQ4K0tsM3NXTUowQzNmMVRTcVV5TUszaEZmS0dy?=
 =?utf-8?B?MGV3ZTJLRW5JaHpISXhIZHE2N1B1c2tYRERaM0puVEx1NHJaT1hLa2Z0UWtG?=
 =?utf-8?B?VVVrbjVBM1Y0TWRhSjY0VjdFekduQ0NhZUdyc3laK3djUTM3aUY0dUpUellO?=
 =?utf-8?B?N01US3pvbGNWbmVWV0txNW9DT2xES1ZrL2lrNTl0aVA4Z0NTSlRIdTM0M2VL?=
 =?utf-8?B?WVEwZUJudEladXl1cFoxL1FDTDU5SnAzUG1INXN2M0FKWVFZOW1JeG5OT0tW?=
 =?utf-8?B?ZHl6RWo5YnJtanZGR1BQZityRjBhZndoblpBYjlPdFhrN0dUTm5OMnBFZGdO?=
 =?utf-8?B?cklkVG9oKzMwZXlSamJ2NzdONkE2S04zejNhTGFUNXUrZEQ0blN5VGhvTUxh?=
 =?utf-8?B?Q2tyNGovYjNRZXNPckloWG13YjVDY2prbGpOSzRJMmxBc3NwT2NhdS9mV2lq?=
 =?utf-8?B?S1ArY0EzZk56TUJ5QmQ1YlJoUi9wSlpWRVpDOGJFWmdLK2xJaHdlcUFrOGlZ?=
 =?utf-8?B?NllTTmZQUGFlL0M0cFNIS2U5MFA3a3FMV2d6ak5nWDV2UmNhNDhWM1JMN09P?=
 =?utf-8?B?RDR6Znk1aWk5RjdmUHpWUFBtQk9hMkM3SlZ5cURrSVdmM3gxOGlxUkJadFVj?=
 =?utf-8?B?dEE0U1NDYlVDWEJYK3FKV1VzbzVtQUpGN0RaRkR3V0RXZjRWNUNSamZza1gr?=
 =?utf-8?B?ekVGWE5FemxRWVVhbkkxQ0ZWNEVTSjZEWjR0N1JTeW9lYStybDRIWXhJeWdZ?=
 =?utf-8?B?UGprenNseTFYdS9KMnlPQ1VzUE1ZUGx5UFFYR3k5bGN5ckk4TGxXcHI4SDBj?=
 =?utf-8?B?MFBEc3dCYVhmQTh6ZFkzNzgzTnZxQ0MvemxuVFFGMkxHMWZNRUp1NUwwalZF?=
 =?utf-8?B?YkowN0FvVHRNVFFZeEFzQktITklxREJkSWVWd1F1TTJQR3pMWW0rRlRUQnVM?=
 =?utf-8?B?dkdzUVlmcUhvc0F1MWZEb2dwUGFHeW5jRloyd0J6ZWw3c0dBd0p3QmFhYnVE?=
 =?utf-8?B?S0oyTjZDU0pVTUo2TnVKL3RFUDJnS1RlNURYTDVoSG5Nd2dGclRDM251V2xy?=
 =?utf-8?B?UUtkUmpjRG5UbURBa2swYnNVY1VndzZ3VFNFQXJWZFpZQzNlQ2RXeTVaMkxY?=
 =?utf-8?B?U2JDRno2VFF2elc5WFZML1Z5aWZuUTJjQUpGWUlwRS94STVJWDV0Z0FhckJE?=
 =?utf-8?B?OHA1VWh5SlFJU0lKbDVNL1ZvMWVVZ1VYVmxGUFZ2UGdIWUFKL1VCY09aNm1P?=
 =?utf-8?B?czVFVUFQSXhwRkFHZzBDc0htOEFNNVQyUDQ1SEhxcUNhc2kybnAxL2RMOTNR?=
 =?utf-8?B?cC9yajhuVGFaUUVhY1llbjk0YVg2dWJyOHRISmZoaE5RdVJ5SHRsZ1RRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V2dsKzBzcGxpaC9KMFVXSEdrY2pER3V2U0ROdnFLQllScWxSVFlyUXkxeDJm?=
 =?utf-8?B?cVR5TG0xbEtvNHlzWHU5a0ZObXMxNEZiN0IzbTgwSWRlVjlWV3hIOFBNTUp6?=
 =?utf-8?B?aGIwNVI4b1BhcndKblNGWFhYOGY2VDl4SnVtY1Jla2ZGQ0dkVy91MHRWeGdO?=
 =?utf-8?B?YXF2YnIyNU9iN3BSS1dSNlhDUFg3N2tkTFJza0NtZ0ZqYmpaOGpZc0ZzNHBE?=
 =?utf-8?B?ZVd6V25Yek9CTFl6akpldXdreVlaNSs1YVhtSkVIeHdQblVTVi8vb0xleUxL?=
 =?utf-8?B?MGlHbzN0UGluTFp6d2dRb2tNaW9idHFPcFcxaFFheGlqL01Tb2QrWkhnRWhP?=
 =?utf-8?B?SXluMW5SY1JCVDl5TTN4dTJ3VVRsT01TVTArOStxVEgvZjk2aHg4MVhPc2ll?=
 =?utf-8?B?Ulk3WDNEMStXNVBTNEUvaG9HeTFvdzNUZFFyd0l0U2NvcGdJcVhIRy9adzRW?=
 =?utf-8?B?a3RZL1pPYW56dHZSUVJFOVluUUdnR05qVE1LNlhUakYycGlXZG9ZSDFhMWtJ?=
 =?utf-8?B?RWFsaG1hN3psVnh1YkZ6SHYyNU04U0NUdk5kTWVjZytsYWtiSnpKZE84Z1d5?=
 =?utf-8?B?aGFPdGpka2tOa3U2bnc2UkZCN2tMN1pGQk5wb3lURkw1MGdmR2NHRlh0bjZX?=
 =?utf-8?B?WkcwQytxMTdvdS9wTEJOMlo3RThHaUllRTFWYVkrRmZYclY4NXdIVnl6ZmdB?=
 =?utf-8?B?MUFubWxKRjF3b2R2aThndXB3R052NW5WNFVsbHVrbzlEdG15QjY3UXJFT0F0?=
 =?utf-8?B?amVweVFNeTNGQldhNDlvcUZYUnBtMTl5NkExcmh4R0tNRk9idlZGcXNCRXhQ?=
 =?utf-8?B?dFU2azVOT2ZZMkFWVUZKV0xGUHFvWU9Wb2kzOThxVkt0djNwUDhkd00ydzAy?=
 =?utf-8?B?bXdJVUpnRXdnOHVvWnNYQWNwUnRQUXZQL0J5SnVjREIzQXRCb29kRHkwRnZJ?=
 =?utf-8?B?Zmd2ZEc3b29qSnNka1dPc2RwOVgxNy80aHdHVjhFWm80TmpZeDVqWnhRdGh0?=
 =?utf-8?B?N3czUzc0dmdZcFNReGNPVHhObU8xNVVmUEkxdTVSa253d0FQLzV3QlhabUVH?=
 =?utf-8?B?dSt1QTRuVW85N0ZQanJpZ21oa2hPbmhoeitxYi9ZV3BuOVFxdHRYOEVSL0Y2?=
 =?utf-8?B?dFFRcHNJMUpnTEhQNjc0cSs2UTdoZEZYS3dNd3MxdDFsZ1RLRlBvVE1BSDZu?=
 =?utf-8?B?SDVJQ2hqMkNmcDArOUJkczQ5QTJNUFJ4ZzA4RDYycmxpamxDWnB6TmxNbHdZ?=
 =?utf-8?B?RzlNb2JPYlRKbS83d3NqUjh3ZldqNlBZa0Jtd2ZOWENlQ1FhS0prc0FpM3hs?=
 =?utf-8?B?aUtHWi9DTzVnbnNCeXFuL0s1RFQ0TGtxb3NmeVZtZkoxdDQ2NXk5NUo4T2Uy?=
 =?utf-8?B?Zi9uMzJ5cCtWS1Q0dnkrUXZIWDJxclVpVUcwelBEWFd0OVkwekZrK1BPcTJL?=
 =?utf-8?B?MkRTMzFPSk5QZDRpVWQvOTFSUVdQZkt4eVUwNUlkam95ZDBMMElVc1VsckdV?=
 =?utf-8?B?NENxbzZJbmxBNHZMSUFuZHFSOEdHVWdqVHBqL1hNSVA4bkJLc2hJSVQrbEdm?=
 =?utf-8?B?RnY3bHhHdFIxTXFYUjJhb205blhidmxJTkxEWUNqL0IydHgweUp4djc4WFJt?=
 =?utf-8?B?dG95SkdKNm95cUxPVzFidEJIVjVsZWlFek0vTklDejlmamNSQ1NFeHNkSTdN?=
 =?utf-8?B?NElpZWxsTm1FVW9ETWtYaGpSeUJhSHVJdzhlMmd2NktVbXFtOGVWZi94SDdp?=
 =?utf-8?B?WlJmME56aWJTYnpMb1ZwMTZNOTI3Q1VaTnFTd1FxWlZncmVrMllra0llZUJj?=
 =?utf-8?B?NXAzVmxZUS9KeDVzcnFDcktOcXhCcG04d2lrbkZNNytDZDNpWGZDWXVXbllz?=
 =?utf-8?B?ZXRucFc3aktjWjdRbFVaeHFBYXc1djg5SktUT25RRWU0Vjdsb2NQNy9kU0VH?=
 =?utf-8?B?VWZlUU9TeHI4Mm5nU2pXOVNZeTZhT0x6dmpwbjQ2Z1phQVhhQW44MGp5bnB5?=
 =?utf-8?B?SSt4WnhpWFd1emI4L1dHd09qaUVTKzRVWHJFT1dLck9kdlBvUDBPVmlITm5y?=
 =?utf-8?B?U2lvRFJtVXA3NzNiVm4zdUxiU3BsUXQ5NS90dG1qeXZWR1pvK1N2bGdpMUhW?=
 =?utf-8?B?cno0SGZubE12TktabHVXK2hpNVpneEhsdVhQMUY0ZnFCbXpzZ3ZCMG11aEhj?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4aac93-da73-46b2-dfd4-08dce463a932
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 10:59:47.0745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gIDPNvzNvqrN/nbfWHZZ3Bbp+bZ3Z0MzgC6X9KdoSrInI2EiWzvel0z67njQgO3m9U/ln5Fd+F96rqX9Vmv/jyvP1/mehCYpeQYn8kcXIW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 10:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205229

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogMDQgT2N0b2JlciAyMDI0
IDEyOjI4DQo+IFRvOiBEaWVnbyBTYW50YSBDcnV6IDxEaWVnby5TYW50YUNydXpAc3BpbmV0aXgu
Y29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHBzZXVkbzogYWRkIG1hbiB1c2VyIGFuZCBncm91
cCB0byBmYWxsYmFjaw0KPg0KPiBPbiBGcmksIDIwMjQtMTAtMDQgYXQgMTI6MTYgKzAyMDAsIERp
ZWdvIFNhbnRhIENydXogdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gd3JvdGU6DQo+ID4g
V2hlbiBpbnN0YWxsaW5nIHBhY2thZ2VzIHdpdGggbWFuIHBhZ2VzIHRoZSBtYW4gdXNlciBhbmQg
Z3JvdXAgYXJlDQo+ID4gZXhwZWN0ZWQgdG8gZXhpc3QuIFRoZXNlIGFyZSBpbmNsdWRlZCBpbiBi
YXNlLXBhc3N3ZCBhbmQgaW5zdGFsbGVkIGFzDQo+ID4gcGFydCBvZiB0aGUgcm9vdGZzLiBIb3dl
dmVyLCB3aGVuIHBvcHVsYXRpbmcgdGhlIFNESyB0aGUgcm9vdGZzIG1heSBub3QNCj4gPiBoYXZl
IGJlZW4gYnVpbHQgYW5kIHRodXMgdGhlIHVzZXIgYW5kIGdyb3VwIGNhbm5vdCBiZSByZXNvbHZl
ZCBhbmQgdGhlDQo+ID4gaW5zdGFsbGF0aW9uIGZhaWxzIHdpdGggdGhlIGZvbGxvd2luZyBlcnJv
ci4NCj4gPg0KPiA+ICAgY2hvd246IGludmFsaWQgdXNlcjog4oCYbWFuOm1hbuKAmQ0KPiA+DQo+
ID4gQWRkaW5nIHRoZSBtYW4gdXNlciBhbmQgZ3JvdXAgdG8gdGhlIHBzZXVkbyBmYWxsYmFjayBw
YXNzd2QgREIgc29sdmVzDQo+ID4gdGhlIHByb2JsZW0uDQo+ID4NCj4gPiBOb3RlIHRoYXQgUFNF
VURPX1BBU1NXRCBjYW5ub3QgYmUgbWFkZSB0YXNrIHNwZWNpZmljIGFzIHRvIGluY2x1ZGUgdGhl
DQo+ID4gU0RLIHN5c3Jvb3QgcGF0aCBpbiB0aGUgcG9wdWxhdGVfc2RrIGFuZCBwb3B1bGF0ZV9z
ZGtfZXh0IHRhc2tzLCBhcw0KPiA+IFBTRVVET19QQVNTV0QgaXMgZW1iZWRkZWQgaW4gRkFLRVJP
T1RFTlYsIGFuZCBGQUtFUk9PVEVOViBpcyBjYWNoZWQNCj4gPiBnbG9iYWxseSBmb3IgYWxsIHRo
ZSB0YXNrcyBvZiBhIHJlY2lwZS4gQWRkaW5nIHRoZSBwYXRoIG9mIHRoZSBTREsNCj4gPiBzeXNy
b290IHRvIGFsbCB0YXNrcyBvZiBpbWFnZSByZWNpcGVzIHdvdWxkIGJlIGEgYml0IHJpc2t5LCBz
byBpdCBpcw0KPiA+IGJlc3QgYXZvaWRlZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERpZWdv
IFNhbnRhIENydXogPGRpZWdvLnNhbnRhY3J1ekBzcGluZXRpeC5jb20+DQo+ID4gLS0tDQo+ID4g
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vZmlsZXMvZmFsbGJhY2stZ3JvdXAgIHwgMSAr
DQo+ID4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vZmlsZXMvZmFsbGJhY2stcGFzc3dk
IHwgMSArDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+DQo+IFdlIGRv
bid0IHByZXNlcnZlIHVzZXIvZ3JvdXAgb3duZXJzaGlwIGluIHRoZSBTREsgc28gc2V0dGluZyB0
aGlzDQo+IG93bmVyc2hpcCBkb2Vzbid0IG1ha2Ugc2Vuc2UgaW4gdGhlIGZpcnN0IHBsYWNlLg0K
Pg0KPiBXaGljaCByZWxlYXNlIGlzIHRoaXMgd2l0aD8NCg0KVGhpcyBpcyB3aXRoIGtpcmtzdG9u
ZSwgbm90IG1hc3RlciwgSSB3YXMgbWF5YmUgdG9vIGVhZ2VyIHRvIGFzc3VtZSB0aGUgcHJvYmxl
bSBzdGlsbCBleGlzdGVkIGluIG1hc3RlciwgYnV0IGFmdGVyIGxvb2tpbmcgdGhpbmdzIHVwIEkg
dGhpbmsgaXQgZG9lcy4NCg0KVGhlIHByb2JsZW0gaXMgdGhhdCwgYmVmb3JlIG1pY2tsZWRvcmUs
IG1hbnBhZ2VzLmJiY2xhc3MgaGFzIGEgcG9zdGluc3Qgc2NyaXB0IHdoaWNoIGRvZXMgYSAiY2hv
d24gbWFuOm1hbiIsIHdoaWxlIHJ1bm5pbmcgdW5kZXIgcHNldWRvLiBTbyBwc2V1ZG8gYXR0ZW1w
dHMgdG8gcmVzb2x2ZSB0aGUgbWFuIHVzZXIgYW5kIGdyb3VwLCBidXQgdGhlIHBhdGggdGhhdCBp
dCB1c2VzIHRvIGxvb2sgdXAgdGhlIHBhc3N3ZCBhbmQgZ3JvdXAgZmlsZXMgcG9pbnRzIHRvIHRo
ZSB0YXJnZXQgaW1hZ2UsIG5vdCB0aGUgU0RLIGltYWdlLiBJbiBvdXIgYnVpbGRzIHdlIGJ1aWxk
IGJvdGggdGhlIHRhcmdldCBpbWFnZSBhbmQgU0RLIGluIHRoZSBzYW1lIGJpdGJha2UgaW52b2Nh
dGlvbiBzbyB0aGUgZG9fcm9vdGZzIGFuZCBkb19wb3B1bGF0ZV9zZGsgdGFza3MgcmFjZSBhZ2Fp
bnN0IGVhY2ggb3RoZXIgYW5kIHdlIGhhdmUgcmFuZG9tIGZhaWx1cmVzLCB3aGljaCBvY2N1ciB3
aGVuIHRoZSBwb3N0aW5zdCBzY3JpcHQgcnVucyBiZWZvcmUgdGhlIGRvX3Jvb3RmcyBoYXMgcG9w
dWxhdGVkIHRoZSBwYXNzd2QgYW5kIGdyb3VwIGZpbGVzIG9mIHRoZSB0YXJnZXQgaW1hZ2UuDQoN
CkdyYW50ZWQgdGhlIGNob3duIGlzIG5vdCB1c2VmdWwgZm9yIHRoZSBTREsgaW4gdGhlIGVuZCwg
YnV0IHRoZSBwb3N0aW5zdCBpcyBjb21tb24gYmV0d2VlbiB0aGUgdGFyZ2V0IGltYWdlIGFuZCB0
aGUgU0RLLCBJIGRvIG5vdCBrbm93IGlmIGl0IGNhbiBlYXNpbHkgYmUgbWFkZSBjb25kaXRpb25h
bCBvbiB0YXJnZXQgb25seS4NCg0KQnV0IEkgbm93IHNlZSB0aGF0IHRoaXMgd2FzIGNoYW5nZWQg
aW4gbWlja2xlZG9yZSBpbiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3kvY29tbWl0
Lz9pZD1kNDI5MDRiYTBjZjBlYWMyOGVmNzliMGU2MDE1MTUwZDM3NmQxMzRkDQpUaGlzICJjaG93
biBtYW46bWFuIiBpcyBzdGlsbCBydW4gYnV0IGluIGFuIGludGVyY2VwdCBzY3JpcHQgKHNjcmlw
dHMvcG9zdGluc3QtaW50ZXJjZXB0cy91cGRhdGVfbWFuZGIpLCBidXQgYXMgSSB1bmRlcnN0YW5k
IHRoaXMgc3RpbGwgcnVucyB1bmRlciBwc2V1ZG8sIHNvIHByZXN1bWFibGUgdGhlIHByb2JsZW0g
aXMgc3RpbGwgcHJlc2VudCBpbiBtYXN0ZXIuDQoNCkkgZG91YnQgdGhlIGZpeCB5b3UgbWVudGlv
biBhZmZlY3RzIHRoaXMgYmVjYXVzZSB0aGF0IGFmZmVjdHMgUEFUSCwgbm90IHRoZSBwYXRoIHVz
ZWQgYnkgcHNldWRvIHRvIGxvb2sgdXAgdGhlIHBhc3N3ZCBhbmQgZ3JvdXAgZmlsZXMuIFRoYXQg
aXMgUFNFVURPX1BBU1NXRCwgd2hpY2ggaXMgc3RpbGwgc2V0IHRvICIke0lNQUdFX1JPT1RGU306
JHtTVEFHSU5HX0RJUl9OQVRJVkV9IiBpbiBpbWFnZS5iYmNsYXNzLg0KDQpJZiB5b3UgdGhpbmsg
aXQgbmVjZXNzYXJ5IEkgY2FuIG1heWJlIGRvIGEgYnVpbGQgd2l0aCBtYXN0ZXIgdG8gc2VlIGlm
IEkgY2FuIHJlcHJvZHVjZSB0aGUgcHJvYmxlbS4NCg0KPg0KPiBJdCBzb3VuZHMgdmVyeSBzaW1p
bGFyIHRvIHdoYXQgdGhpcyB3YXMgZml4aW5nOg0KPg0KPiBodHRwczovL2dpdC55b2N0b3ByLw0K
PiBvamVjdC5vcmclMkZwb2t5JTJGY29tbWl0JTJGJTNGaWQlM0Q5Y2NkZTU5YzUzMDNhYmIwNGU5
YmI4ZTJjOTg3ZmY0DQo+IGI4ZjQ0YmI0MyZkYXRhPTA1JTdDMDIlN0NkaWVnby5zYW50YWNydXol
NDBzcGluZXRpeC5jb20lN0M5NzI0MjdiMjU1DQo+IDQwNDFlNDUwNTkwOGRjZTQ1ZjQxZTAlN0M1
ZjQwMzRmYWVkMmQ0ODQwYTkzZmFjYjFlOTYzM2I5MyU3QzAlN0MwDQo+ICU3QzYzODYzNjM0NDk5
NDQ2Mzg5NiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3DQo+IE1EQWlM
Q0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMCU3QyU3QyU3
QyZzDQo+IGRhdGE9QnclMkJQd3dZaXUwR29FaHZISGRhUVhHSTh1ckVBNlVqJTJGR0dRcjMlMkJD
Z0x1RSUzRCZyZXNlDQo+IHJ2ZWQ9MA0KPg0KPiBDaGVlcnMsDQo+DQo+IFJpY2hhcmQNCg0KQmVz
dCwNCg0KRGllZ28NCg0K


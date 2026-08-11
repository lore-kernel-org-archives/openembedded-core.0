Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB042C5CFDB
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 10:17:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51407.1786443472798681351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 03:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=DJt9Y2Xz;
 spf=pass (domain: ericsson.com, ip: 40.107.159.7, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjrbnBakSO0YpjD1UM7Bx00J2+v/n6iwhAmHLehdQPWXdqoQEYvG751c2o0jA2y2FiAC/5tR2TpNbD2RQ6zCeBEKOulPNDGRYhck8Gcfp+QwokylNnygM1EbeictEBbaruZn500N+r98Me2pO6hLIKwPSLotL9vJrL9Hs29OMb3y6XEJ4vmJXI+suHwba8QGpuD1J3WCTOidfwJnzJP4vnVyNjseoukAOkapJGWKmdLGtc3nEsI6CIOJzagwpg0alxDUZJVtSVPfo/YnsrgbYaYsUGDbGOu5fA4TQDWDgvcKurZDvlv+HNo0saN2JKjzHmLc5V4ZBOqkhdYXKXzItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhlYs7L8oRMoJU4TRWrs2X9cu6ASIp+f/n3Nmh9eyFc=;
 b=Rz8HdWVmoOncgUJyF7MWkhyiumwvNEoyiWLLKmvyl80MPQ1+W24apC7+KwzjhGqN1Q0xv+qKWYR6wDbNysu8oGDIKy5DAgg+g0T+Qu/59m40qFnesdgkasfz30ETh69L06hLPxrtvQnIiBw0azm2QVnETiEez9a5qnXXni2SwxUSvEfVpiDPz5JZE4J2U3SRzTCtcz5Q0IlkRFCb/0OKMbh/hI55fEfj/vaeSA6bs+3AReIpvRP7FK+MzwibaRDGQ49/n3SRYHOts1NCj9AHtJqgJLVto1ajz2IeS37Biagwu443n3WG3oPIDoIHeb7yvgqNqBpB4gebJtNzhmijYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhlYs7L8oRMoJU4TRWrs2X9cu6ASIp+f/n3Nmh9eyFc=;
 b=DJt9Y2XzU6/B7j+TatzhmYImMXUr6r48qd0PVw9PPy2MuMD68dd2pUjs90mpijSDUmNLufbg5invbnuwqIQKtICCP6WgAMBEJVXmknPD9rJCAvl9KateFR6hNB0mMbYqLRvRe8at3VMhnE2hXoFS4kNvpdu4kPrZvS85yPZzkiZqdLwjUiHcX+nAj6a7nBqwMGHU2qJ1spRZfdP0EbkqVapyaHtK78IW4EmYjXMIrbuAZJLwhP3OJYN6vKnZjiKeb7LUZWGCB2emHpxieYBckWYi3nUfW84IuShF8Obm1rwhUSoBC+6PFic3c6+eBzLKpIXkVrtfmHHbtS8nJMmb/Q==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by VI1PR0701MB6829.eurprd07.prod.outlook.com (2603:10a6:800:194::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 10:17:47 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 10:17:46 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"paul@pbarker.dev" <paul@pbarker.dev>, "Randy.MacLeod@windriver.com"
	<Randy.MacLeod@windriver.com>
Subject: Re: [PATCH 1/2] lttng-ust: inherit upstream-stable-release-point
Thread-Topic: [PATCH 1/2] lttng-ust: inherit upstream-stable-release-point
Thread-Index: AQHdKXJ+fR8tr9rUl0CulsmQxz5IcLaYnu+AgAADeYA=
Date: Tue, 11 Aug 2026 10:17:46 +0000
Message-ID: <e0be9e542eb179a7f9962279ff14c7d2da7e00cf.camel@ericsson.com>
References: <20260811091843.3420858-1-daniel.turull@ericsson.com>
	 <20260811091843.3420858-2-daniel.turull@ericsson.com>
	 <CANNYZj90jvkMf40urEk6W1+70MAzTT=jT=0vwdP03Y6Qci5Y3A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj90jvkMf40urEk6W1+70MAzTT=jT=0vwdP03Y6Qci5Y3A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|VI1PR0701MB6829:EE_
x-ms-office365-filtering-correlation-id: a2680f1b-2c7b-4c52-76c2-08def791ca47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|10070799003|23010399003|366016|38070700021|6133799003|4133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 wWiX8CvW6gPhfjPIxsyp2mPSNGIuF14EOEsnttGwxkIndamppX1B3gu/yFHI3//Ot97K8qEGT+qWo0fwAqWDeASGndQEVZ/34CRuOWVmb+rinqWdtaaS15jq74piguT28BVmaG71C4/cZtbsuBB7wYMultUZLEC9YZoI/Fg/eQWPzzR0H/9bSvlsaP5YJRM0PfWKyIzf32JhItyVbtqPvieSOVEE58IFgprkDM4bPxzrJdbexL7VtnSEBK8jd3RqNceLkjqcGGtKXdQO7/tcVeN5mBZQj3EAHHD8tm76Wc0RGplw/0EO35MVN7ykVh7zrDH9UUwpZhhffdZSc/lfadqgNNlIyZUTX03AajLr3bXvfz5Y9awLE8T8nTxD2Mun8f0irxwHGFDNHcDLm8xNxH6OO0f+OdrH79ECHZ4oj6lo7otnohedjXVpGL3OwnE6rWFRBfS9bTx1xtKM9oQps2udQ4wWnk5ojuojKyvlszuHErX8mTC9M6+q4CaRbOqvuL2NK/YgQVn0Wp9CwULGZ57q2l3lphqTI1AIPZfesdnih+VienV5srqkZ8ORZe1VS2aG9GOJNppodH0Ff//Q9zU5m9/ogIz3iP7yOKKhcxoPePl5NEqkXdUYpTPurPHuZ8tR2Ly/Rk5SPn0QDtr9lkadCpSWZMM9fwM7eeViqSxYU7EYYe+0DH6pxWa717SbM9k8ntJthg6BpMyUU0bytAWVey0q31zmwl0NK4f1Fjc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(38070700021)(6133799003)(4133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aS9YSHlYa2xZQ0RpMDNmRmlOREgyV0M4d1JEUTlqMzdjMUpFY3R0dFNTWUhW?=
 =?utf-8?B?bWw3bmR4KytHbWM1VXJ2RWM1Z0VsZW9hYTMwWXVuNW9GVnczaUZmSkUvWmVP?=
 =?utf-8?B?d3p2SFFQV3pxb3NlS0xPVmhsMjVvbDBrME80bk1MR0c5L3U3S1lHY2xEOWZC?=
 =?utf-8?B?RWJ0N255aWYrY0FXWXJSNEJyeUxaVEw1SDEzTWxkeDhDeWxtS3pha1pkNHUr?=
 =?utf-8?B?NWJxZk5JUnlyOEhMenVhcXpVYk1ISU1GTzhoVVpuaFdtYngwYjFFMHRrejhM?=
 =?utf-8?B?cmNhbFRFSWthSGlsbXBmaGxBdUZqSGp0RmVKaUVoV0RreC9aNFNOdjEzNzN5?=
 =?utf-8?B?cUE2NWR2YSszT3E3SmhnNWhpQThOMElMUHdEaGphZmp2TU82VFBwaVRtVWcw?=
 =?utf-8?B?UGpqWXE0TUpiaHdhSldmamdibC8rMWNmbVdINzNybm1IV09rQWdwVFV0Y0E2?=
 =?utf-8?B?RXEwOVU0SGdiZkxWTERhOFVGYXFsM3FVRm1DYVN6U012RjFDckVEYlpRSXlo?=
 =?utf-8?B?WjVhVnNjMGYxMGRhVi91Tmp0emI2MFowRll3blpHUUNPbWprWXNJODNiRnV2?=
 =?utf-8?B?M0NLNXdYalJINktuT3NXZGhTaHJJM01XK2hvdXdTV0dtOHRFRzZKZmp0QVJx?=
 =?utf-8?B?QkNtUkhRV3QzcGtvZEYrOHVBSHNzRlN5MXRnWFp3TkFjQjZCMkhGVWFvT3RS?=
 =?utf-8?B?MXpkR3VEN3hZdHllQjZxZk5HSlU5OEU0cll4NHJBaDFheG1TMGJ6VW5IVnV1?=
 =?utf-8?B?T1RyU1F4M3l4aEZkOFJRazZIY0cwUktCczV6ZlFiQTV0dHNTVkZuM3MyMXht?=
 =?utf-8?B?U3ZjNmtURTJUOVFEQ3BOS1l3OFpWaG9uRlpRSzdscWlMMWFsSGNrS29pbXF2?=
 =?utf-8?B?Ymw0aVM0YUF2R082TlBCOEhUM2ZEWmovbndWZUZzY3RBanpqUDdtMGo3L0h5?=
 =?utf-8?B?bTJaMXErNkpqS2h4cDNOd0prbnA3SWFrbUJENjlnam4rRXpzTGFYTVdObGFh?=
 =?utf-8?B?bmo4YnZidGx5cis4UFZPeVFTNWFpdVpmWUdkajk5eVN2bTUzWnJPbkFLb0Y0?=
 =?utf-8?B?UG5TUmtlQU5BTnF1eS9jZitDVjRxNkxkS1VKMVI5eThSUWRVQTZudjk3dkxS?=
 =?utf-8?B?VGFFaDhETWZjZzRMVjc2YVJsZCsrTjB3THBKbjZPeDZYVlh3RjlpSjFQMUJk?=
 =?utf-8?B?SXRFSisvUWN4YnI3eTY4b0gvSG1oaXFsMndXMHVmblVNTW8rRFFFUlp3M1Nz?=
 =?utf-8?B?blV3Q1pRbWdsK1BPSHhkMEhjTWpKYlpXdk9nUDk0cldIT0tDV3pqOTIzQmxW?=
 =?utf-8?B?bTdIMHZxMG9iSFpsc01lMTEveEorTTRQQTl0RHJURWpUMmNGeUtwUk5WY3BJ?=
 =?utf-8?B?cGJTSlh1Sng5WGlLR3lSNXV1L2tQUVVUcFpxSFMwd05XNFpKSUQ0TlAwVHRD?=
 =?utf-8?B?MEdjU1lPL0VmS1d4dm5nMCtWOXFJb2l5aGYxZkhVZldITERyTEF1ZEZ2YzlW?=
 =?utf-8?B?R2pkZUFvWG1WUi9oSDNUeHp6S0ZKT3FoZUg5ZUtPenFHbjIwSkR1eVdEdXgy?=
 =?utf-8?B?RWFGSjBOOGNGcmpsR1hydkIrd2FIOXFzMWZGbWp0M3Z2VEZXazkxc3puV2o4?=
 =?utf-8?B?dHY5YzFEK25kV1BObWNKUWJDWVg2R3BBK05Ta1lsbU4yaUYyQ216TGtmOWNK?=
 =?utf-8?B?bkJ2YkNJTExRVnBLTEhmZE5XRElVRGFBc1U0a2NtMGhOemQzN3RaZS9HY2tt?=
 =?utf-8?B?VGpQeit0NXhObVZxa0JISnNnR09JSmpNczVoYVZQdFVWTUFiUjR4UHJ1MVdF?=
 =?utf-8?B?NHhaOWZQYjBaK1R4djhzMlBoQlREQmpackxmcXIzYXR4VUVXVzE2RG1xYy9v?=
 =?utf-8?B?U1VwcEova3pKUHNVTzZBSUgzV09KT2tKRWdqbDNFSldpSlRUV0hjZGJRYU1B?=
 =?utf-8?B?YWl1MCtUcHdVcUxQSzllVVVQV2UyTU5ib21BeFEwbmhCTjZraFlKN09Gckds?=
 =?utf-8?B?SmZVN0VieDYrR3o2V1V5RDdEL0tUMWo3eUNCNGozbXE2WXZEam5iRXVQNXZQ?=
 =?utf-8?B?eDB2VkZ6SFBscVJWdTluenNNRkdNY3NkaEFUOTE1TG8xbm11QUVod2U5Q0hV?=
 =?utf-8?B?S3BwWEY4bmgxK3g2L3I5b0pVVGFUcndYSDBycTdrYjNuWlMzQlROZEVRNE1k?=
 =?utf-8?B?UWxBZWNMSVhReWg5TFFTUmFlRndwcXZQWHdSTkRZRzljTXdxUGdrNkNEdC9x?=
 =?utf-8?B?Y21rdW1vTThnS2VkaU83MzlaNzZWUlZHODE1bE1aYmNJcHlXRHB3UGZDZVJD?=
 =?utf-8?B?cittVkV4Y2VxUU9tM3VYbWV6c2FqVzVuc2pOaUpRSnF5cXY3YTMycXA2Z3Ax?=
 =?utf-8?Q?XzUofBtrWo+f9Iq4K7vJZiDZVphRePuO4t6J5qcP2th6Y?=
x-ms-exchange-antispam-messagedata-1: 4FPrD40VbOpCAQK3ktGXV4yt7MKsY5awu+o=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A41C97FDC3D48A40893A392005E79542@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2680f1b-2c7b-4c52-76c2-08def791ca47
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 10:17:46.8805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cdp/G7R1dIxGY9J2TgrtHBIFuTuHGKS0guW+y04v5/E7ZRUkcSKgc6H73UayulUxz6ZSwMAviSH5ecFhqeL1i9itcjX3+TFQpE+w08oDu0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6829
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 10:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243182

T24gVHVlLCAyMDI2LTA4LTExIGF0IDEyOjA1ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gVGhpcyBwcm9iYWJseSBuZWVkcyB0byBiZSB1cGRhdGVkIGluIGxvY2tzdGVwIHdpdGgg
b3RoZXIgbHR0bmcqDQo+IHJlY2lwZXMgKG1vZHVsZXMsIHRvb2xzKSwgYW5kIHNvIHRoZXkgYWxs
IG11c3QgZml0IHRoZSBjcml0ZXJpYSwgb3INCj4geW91IG5lZWQgdG8gZmluZCBvdXQgaWYgb25l
IGNhbiBiZSB1cGRhdGVkIHdpdGhvdXQgdGhlIG90aGVycy4NCj4NCkkgdGhpbmsgdGhleSBjYW4g
YmUgdXBkYXRlZCBpbmRlcGVuZGVudGx5Lg0KDQpDdXJyZW50bHkgaW4gZWFjaCB2ZXJzaW9uLCB0
aGV5IGRvIG5vdCBtYXRjaCB0aGVpciB2ZXJzaW9uczoNClNjYXJ0aGdhcDoNCi4vbWV0YS9yZWNp
cGVzLWtlcm5lbC9sdHRuZy9sdHRuZy11c3RfMi4xMy4xMC5iYg0KLi9tZXRhL3JlY2lwZXMta2Vy
bmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy4xMi5iYg0KLi9tZXRhL3JlY2lwZXMta2VybmVs
L2x0dG5nL2x0dG5nLXRvb2xzXzIuMTMuMTMuYmINCg0KV3J5bm9zZToNCg0KLi9tZXRhL3JlY2lw
ZXMta2VybmVsL2x0dG5nL2x0dG5nLXVzdF8yLjE0LjAuYmINCi4vbWV0YS9yZWNpcGVzLWtlcm5l
bC9sdHRuZy9sdHRuZy1tb2R1bGVzXzIuMTQuNC5iYg0KLi9tZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2x0dG5nLXRvb2xzXzIuMTQuMS5iYg0KDQptYXN0ZXI6DQouL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbHR0bmcvbHR0bmctdXN0XzIuMTUuMS5iYg0KLi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5n
L2x0dG5nLXRvb2xzXzIuMTUuMS5iYg0KLi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5n
LW1vZHVsZXNfMi4xNS4yLmJiDQoNCkkgaGF2ZSBhZGRlZCBhbHJlYWR5IGEgcGF0Y2ggZm9yIGx0
dG5nLXRvb2xzIGluIHRoZSBwcmV2aW91cyBiYXRjaC4NCkknbGwgY2hlY2sgbHR0bmctbW9kdWxl
cw0KDQpDaGVlcnMsDQpEYW5pZWwNCg0KPiBBbGV4DQo+DQo+IE9uIFR1ZSwgMTEgQXVnIDIwMjYg
YXQgMTE6MTksIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBG
cm9tOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gPg0KPiA+
IGx0dG5nLXVzdCBtYWludGFpbnMgYSBicmFuY2ggcGVyIG1pbm9yIHNlcmllcyAoc3RhYmxlLTIu
MTMgdGhyb3VnaA0KPiA+IHN0YWJsZS0yLjE2KSBhbmQgcmVsZWFzZXMgZnJvbSBzZXZlcmFsIGF0
IG9uY2U6IDIuMTQuMiBhbmQgMi4xNS4xIHdlbnQgb3V0DQo+ID4gdGhlIHNhbWUgZGF5IGluIE1h
eSAyMDI2LCBhbmQgdGhyZWUgc2VyaWVzIHRvZ2V0aGVyIGluIEZlYnJ1YXJ5LCAyLjEzLjEwLA0K
PiA+IDIuMTQuMSBhbmQgMi4xNS4wLiBTbyB1cGdyYWRlcyB3aXRoaW4gYSBtYWpvci5taW5vciBh
cmUgc3RhYmxlIHBvaW50DQo+ID4gdXBncmFkZXMgcGVyIHRoZSBPRS1Db3JlIHN0YWJsZSByZWxl
YXNlIHBvbGljeSAocmVmLW1hbnVhbCwgIlN0YWJsZSBQb2ludA0KPiA+IFJlbGVhc2UgVXBncmFk
ZXMiKS4gVGhlcmUgaXMgbm8gd3JpdHRlbiBwb2xpY3kgZG9jdW1lbnQsIHNvIHF1YWxpZmljYXRp
b24NCj4gPiByZXN0cyBvbiB0aGF0IGJyYW5jaCBzdHJ1Y3R1cmUgYW5kIHRoZSByZWxlYXNlIGNv
bnRlbnRzIGJlbG93Lg0KPiA+DQo+ID4NCj4gPiBodHRwczovL2RvY3MueW9jdG9wcm9qZWN0Lm9y
Zy9kZXYvcmVmLW1hbnVhbC9yZWxlYXNlLXByb2Nlc3MuaHRtbCNzdGFibGUtcG9pbnQtcmVsZWFz
ZS11cGdyYWRlcw0KPiA+DQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2x0dG5nL2x0dG5nLXVzdC90
cmVlL3N0YWJsZS0yLjE1DQo+ID4NCj4gPiBVcHN0cmVhbSBrZWVwcyBhIENoYW5nZUxvZyB3aXRo
IGEgcGVyLXJlbGVhc2UgZW50cnkgbGlzdCwgYW5kIGV2ZXJ5IGVudHJ5DQo+ID4gZm9yIHRoZSBv
bmUgcG9pbnQgcmVsZWFzZSBpbiB0aGUgY3VycmVudCBzZXJpZXMgaXMgbGFiZWxsZWQgYSBmaXgu
IDIuMTUuMQ0KPiA+IChNYXkgMjIgMjAyNikgY292ZXJzIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBv
biBpbmNvcnJlY3QgbWVzc2FnZSBzaXplLCBhDQo+ID4gc2htcCgpIHJldHVybiB2YWx1ZSBjaGVj
a2VkIGJlZm9yZSBkZXJlZmVyZW5jZSwgYW4gdW5kZXJmbG93IHdhcm5pbmcgaW4NCj4gPiB6ZXJv
X2ZpbGUsIHVuaW5pdGlhbGlzZWQgTFRUTkdfVVNUX0xGSUxFIGFuZCBzaWdldmVudCBzdHJ1Y3Rz
LCBjbG9zZV9yYW5nZQ0KPiA+IGluZWZmaWNpZW5jeSBhbmQgZXhjZXNzaXZlIGZkLXRyYWNrZXIg
bWVtb3J5IHVzZSwgYW5kIGEgTlVMTCBjaGVjayBpbg0KPiA+IHVzdGN0bC4gVGhlIG9uZSBub24t
Zml4IGVudHJ5IGNoYW5nZXMgYSBsaWtlbHkgdG8gdW5saWtlbHkgYnJhbmNoIGhpbnQuDQo+ID4N
Cj4gPiBPbmx5IG9uZSBwb2ludCByZWxlYXNlIGV4aXN0cyBpbiB0aGUgMi4xNSBzZXJpZXMgc28g
ZmFyLCBzbyB0aGlzIGFsc28NCj4gPiByZXN0cyBvbiB0aGUgMi4xMyBzZXJpZXMnIHJlY29yZCwg
d2hpY2ggcmFuIHRvIHRlbi4NCj4gPg0KPiA+IEFscmVhZHkgdHJhY2tlZCB0aGlzIHdheSBvbiB0
aGUgT0Ugc3RhYmxlIGJyYW5jaGVzLCBjb3VudGluZyBvbmx5IGJ1bXBzDQo+ID4gc2luY2UgZWFj
aCBicmFuY2ggZm9ya2VkOiBraXJrc3RvbmUgdG9vayAyLjEzLjUgLT4gMi4xMy42IGFuZCBzY2Fy
dGhnYXANCj4gPiAyLjEzLjcgLT4gMi4xMy44IC0+IDIuMTMuMTAuIHdyeW5vc2UgaGFzIHRha2Vu
IG5vbmUgYW5kIHNpdHMgYXQgMi4xNC4wLg0KPiA+DQo+ID4gQUktR2VuZXJhdGVkOiBLaXJvIHdp
dGggQ2xhdWRlIE9wdXMgNQ0KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBUdXJ1bGwgPGRhbmll
bC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMta2VybmVs
L2x0dG5nL2x0dG5nLXVzdF8yLjE1LjEuYmIgfCA0ICsrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctdXN0XzIuMTUuMS5iYiBiL21ldGEvcmVjaXBl
cy1rZXJuZWwvbHR0bmcvbHR0bmctDQo+ID4gdXN0XzIuMTUuMS5iYg0KPiA+IGluZGV4IDlmMWQw
OTYxYTEuLjVkMmNlM2QwYjQgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9sdHRuZy11c3RfMi4xNS4xLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9sdHRuZy11c3RfMi4xNS4xLmJiDQo+ID4gQEAgLTExLDcgKzExLDkgQEAgUFlUSE9OX09Q
VElPTiA9ICJhbV9jdl9weXRob25fcHlleGVjZGlyPScke1BZVEhPTl9TSVRFUEFDS0FHRVNfRElS
fScgXA0KPiA+ICAgICAgICAgICAgICAgICAgIFBZVEhPTl9JTkNMVURFPSctSSR7U1RBR0lOR19J
TkNESVJ9L3B5dGhvbiR7UFlUSE9OX0JBU0VWRVJTSU9OfSR7UFlUSE9OX0FCSX0nDQo+ID4gXA0K
PiA+ICAiDQo+ID4NCj4gPiAtaW5oZXJpdCBhdXRvdG9vbHMgbGliX3BhY2thZ2UgbWFucGFnZXMg
cHl0aG9uM25hdGl2ZSBwa2djb25maWcNCj4gPiArIyBsdHRuZy11c3QgcHVibGlzaGVzIGJ1Z2Zp
eC9zZWN1cml0eS1vbmx5IHJlbGVhc2VzIG9uIGl0cyBwZXItbWlub3INCj4gPiArIyBzdGFibGUt
WC5ZIGJyYW5jaGVzLCB0aGUgc2FtZSB1cHN0cmVhbSBhbmQgcmVsZWFzZSBtb2RlbCBhcyBsdHRu
Zy10b29scy4NCj4gPiAraW5oZXJpdCBhdXRvdG9vbHMgbGliX3BhY2thZ2UgbWFucGFnZXMgcHl0
aG9uM25hdGl2ZSBwa2djb25maWcgdXBzdHJlYW0tc3RhYmxlLXJlbGVhc2UtcG9pbnQNCj4gPg0K
PiA+ICBpbmNsdWRlIGx0dG5nLXBsYXRmb3Jtcy5pbmMNCj4gPg0KDQo=


Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1062FC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:09:48 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20216.1786025386998246454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 07:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=P7Jv+mQu;
 spf=pass (domain: ericsson.com, ip: 52.101.65.4, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Atp7re0jZ50SmASMV2F8YeNHiZMV7Fnmb2sCohJcW0cfVoq3OSn+tvvLjyx52G9SL+i0OEwFHjPbhfQKB8hVwhfRVR/ONMRnHssu2/rn9RkGifrJNMKEAmp38X7RLCSXcPtj6nM6zvSsSEgYcPTfxvt4nhzHptxE46UXpnoSwI9+Lkok0y2dA0ElCTxvbPSh1uY9bMutZYuZcbl2+khD7bFKQ/PNPfRkZq3MtcIl4T+pZJLIq5nKQlCMePiC/9th7wNbdN1dYxefU+ZmA5XAHiI8RRtKvsSdBe41CmsAvrzIrspDf/7omLvCdjKx5jmjglzsfhUbmQg3K6cuANt1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R20Rz3k9lKQjU2FnBvN5y/behdVg85k/zqC8+dmw4pU=;
 b=Bwq6PGBY+l0OK6ZvDf5tYyFr8/p8g03dqbGYg0m78wEEZOeJw9L6AL26lgykw4qRn4fM9mS6jl1RUgr9WQu+XyjSfDl1HEEb2svKXLZB//gjvREAX+33U8DWRIL1fFy/xKutngHtFKxqVXEgqtDdD32zZrfQpalw7TJY7VKNRZay5WRQOlMqKACZkHRGjWOq/Awm3LU7h4SK/wuPG0PbImNwpmCZ/Kla0VwSpCDMtP367wCKf31qQ9vuOqi3JE6Ul86BKf717Tn5YJSj0qfS3cVWc7xvzLYgEW672XEcQQC261LPUsf5m3olOutMl0FyckPemxJtjMaCKxB6BKKuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R20Rz3k9lKQjU2FnBvN5y/behdVg85k/zqC8+dmw4pU=;
 b=P7Jv+mQuJ8ggczOf9NFVDrWd2b4uxU4RBvWnlY+AmEqA0bw/uYj9mWWPtwbs8W8EB1ndWP3GQkbN7WFniA/AA5oMo0Dr7vDhW13i2yp4IB3/o4CmjCeE4+29Ckz4bGPcFuA9vBShUBChRHeh75XTr809FmP4RGUNP0O3rs7AlvUa2ORbgf5FdiorDn8EpMpOeUW2YD9rAkeMHMb9ooKKbfSgUDQgfCoyBfmg+lEfItgOPzfWZ0zFveHow0pU01xYRfILgxB2rfOXR72rdkMYcH1WlNUFzIwDizmsARuORBoEUyG4UMD/MRAPE9tFf2qtCToNUaYbHXz1yfR/HHhSrA==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DU2PR07MB9553.eurprd07.prod.outlook.com (2603:10a6:10:49e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.4; Thu, 6 Aug 2026
 14:09:43 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0315.006; Thu, 6 Aug 2026
 14:09:42 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] devtool: upgrade: read changelog blobs
 via a temp file
Thread-Topic: [OE-core] [PATCH v2 2/3] devtool: upgrade: read changelog blobs
 via a temp file
Thread-Index: AQHdI9bWAX7lR7cdmECTrdZ3iJpcrraNZwmAgAOqkgCAAAEqAA==
Date: Thu, 6 Aug 2026 14:09:42 +0000
Message-ID: <441b84ff90768959e5ff1375d00e18969f53d6b9.camel@ericsson.com>
References: <20260804060205.179715-1-daniel.turull@ericsson.com>
	 <18C884DEFF3686EE.1990914@lists.openembedded.org>
	 <a231432b23b9d9feabb09eca97380c7e93bee8df.camel@ericsson.com>
	 <11EBBEC5-8521-40C3-81E6-A9E86B2A4A1C@arm.com>
In-Reply-To: <11EBBEC5-8521-40C3-81E6-A9E86B2A4A1C@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DU2PR07MB9553:EE_
x-ms-office365-filtering-correlation-id: 3bb101f6-64fc-4f25-5e76-08def3c45cca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|22082099003|18002099003|56012099006|4143699003|11063799006|38070700021|10067099003;
x-microsoft-antispam-message-info: 
 7awmuKUbljg3qrLX3Jor8cG6dIzSvKGgyMAeLd7WiPVAsZvLMuTlHbHXqdnXFGE8URJAuG+oRqJ5/Nvk45gc+7huTdmX7hskUjyunZKGLqa6rFElqAN72cvgnDSYGGqIQRqyjY7LpUz31WKBPrMUYMKmi89l68+5e9laRPZ/mtp9qcmejuvWHBR8aIh6jrd8/c3RrpCMJRFsmCysUEYbmgBJu8UPpIEqfpVtrcmTBOW+rntY5nfgSa/2/FEUrImCCKe1U6ozJzM0RXHgiwR4JBzw9KfjN05mb3yUCrKyrahIIk/euntZv1gk4OEwn2WM9KgpWT23gKpspmDj0Whit746hwHXuyqZfDpfz50bZUUtIjC6D8ZqukO27iJB357JiQLh0d6iyoHx+JCLxQYvOlYpbOHlOCArxYQZ02qwmQAeUmCQhbUpedXx+x25gtj1b1SOfNMWpwovX7ppKnu1tPqopqq7qKz+yWRXoszsODfZzexfVCizoEniEWnbaVkyQqVuLmVpYYNVLvoVaz/FPaN+VvE2Y7GLSppXDPDUevthYmeKvvWGS1d4YDeW+2oyl6EVAP+nJdBxFnHrkUB6tVTa/hP7Yeqz75Ff2YOEShbP+3pAulq0h4UHDNZ+9oxfBb+0vmwOwiEGrkERK4wnq/UA/xJe+15MihxGevdqbnOkmWBJBl0N8uA3TsmD5gRlpOF8/IiiYpqwvYsQCLvRVQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SktrN3VYRjFUaU50ZE1GMUpBaXdzZ2gwdmgzc2hlTEVhTUI2VmI4SStOUHpu?=
 =?utf-8?B?Z1FxenhZTkxmQ0ZJeFRJb1N2YUxHbFhtbXc2MkExT3J4U0ZKZmYySG9EVHVt?=
 =?utf-8?B?d3lCcUpCU05zRndvM0ZmbjB6REJyWkpYTC82K3hKN20wNkFDenhQaHZERDZV?=
 =?utf-8?B?ajZvMUVwdUFFUnZnN3hrV1E4bU5uUVVib0RCUTZpaVp6YldNUkw1OFlRSlJO?=
 =?utf-8?B?azV2bHZWS1R0UU5RWjBaTmNDYkJrWjltdEVITS9XUHZOWDN4TkhoV3UrenN4?=
 =?utf-8?B?eFF0dnZINHhPUmVCZU1OREJCL1BvRDdVNWZqVjZEbDFDRTFZRXl5ZTFuS0x4?=
 =?utf-8?B?M1FTKzBmOXJxeHdXTy9YcGxSaWl4cURyc2tPT1did1VVQ0tXdVBKMmdpdHZi?=
 =?utf-8?B?alo5WDQ1SEYvMjdlZ0VMM2VvRmYzY2RxOUhYTnFmSXlxb1B2UWFxZURzYyt4?=
 =?utf-8?B?eTR5bm9QdU5sZWpVeDdPS0ViSFJRZGpSM1E0ZEFxYURrdEdOanhuZUcwQTgw?=
 =?utf-8?B?eVRJVWwra2h0YTRWZlpCQVJpN2p3aytPZTZRQ0lNaGhiVmZ3R3MxSHU2N1ky?=
 =?utf-8?B?WC9yb0RVTFllTTRqSmdnbC9LY0xYYVJOSktGcWZRcThuRjJjbWV0dlJsWWpk?=
 =?utf-8?B?L2R6RDBWRzJDSkNMTG0vMllNWnphYUtPU1ZYVjg5WERaMTQwQkJsSUhxUE1L?=
 =?utf-8?B?N3lZS3FUL0VvcGtJMGxqeTQ3UVlCZ2gxREk2NzVqd0JDY3JDalNsOUVkR09z?=
 =?utf-8?B?dS9ya09XZElaSlRLc2pzTE5tU1dCRWI4MU1rSTRPc0tsQ2JQTzZjc3pFQTVX?=
 =?utf-8?B?TW9BVENIeHVMMEgwRFBtTXJ2cnpoQ0E2bGZMLzUvVENvNXkzT3VSc2lCNith?=
 =?utf-8?B?bEttOXMrRk5WMjFjaHJubXYxblJ4QnhpajN0TmpQR3M3ejFxYS9Jb0Z4MjB3?=
 =?utf-8?B?WkZNaXdydkprVWZyR2g5V200Y1ZieUFwSGR4R0xIbnlha1dMUXJaZFNWSXky?=
 =?utf-8?B?eC9NdVRjZFlNWnN5RjV2di9yM0hvczhPYW5NVk9EdEtZTnd2THJUdW5NeWhD?=
 =?utf-8?B?NnZsUCtrUS94RGpINncwNWpRc3haV2hNbUFVOS9SSlFjbXNzRllNMGtsSEU3?=
 =?utf-8?B?aUQyK1V6ZjRkd3g3SWtJakV0SFRabTBYK0xVeFh1Vm85dUN4NVJWWGJFekpO?=
 =?utf-8?B?SUpsM3I4L0cxVldUdzJZZ2VBZk4rVnZQR1ZEdStPdHNTek9iNm53UjBaVWEr?=
 =?utf-8?B?bFowUmRZRTUzNFpUTnAvem1Pd01QTy8zd0szNVlsaHpWWWdYN1JIQytEczVK?=
 =?utf-8?B?VVM0M3dzY0ZORDNwWnFBaXJQdG1QWjhZb1RSbW5mN0tvSjExTFFCWXdkM2Fq?=
 =?utf-8?B?R2p1dGFXaVZmbHU1bVFjVGRBUXVwbUhVa1J4Z0tQRTNQNmx6VWFqbUN5QjVh?=
 =?utf-8?B?cUtuWjFSdno4YXhPVUtwY2FoNHNKOEFaanVvck5TbFV2WkZDaS9IdSs4eGJR?=
 =?utf-8?B?S1Z6eSttYWF3YWpKVnNIT252dkFtNElKcU5DSUxFaTdVOTNvWnFGUHJ3NkpT?=
 =?utf-8?B?bUwwTm5CNUJwaldxc3orcy9rWkFoWGg1a0s5cWk1ZEUvMGVScXZ0VU82dzFp?=
 =?utf-8?B?OGZ1Sk1DSEc0QU1nRXV0TWYrNURSdTJFY3pxTkNoUDVobWJlZERrdzZ6OE43?=
 =?utf-8?B?aDludThKU1IwN3liYWNINTdEZEhEcU8xNUlJcXgzNFY1M01VRWhHMjErTTlT?=
 =?utf-8?B?YUlSUkVyMWVVR3JMdlduOXBBaVRpS2Z1NTE2dCsycmd2bHh0dHB5VjJLOCtw?=
 =?utf-8?B?cjk4WDlVYUlrMnlqeHZOUFRXWUJOWWdlRmR4RFUyUmtYQldraEhnR3d1WDdt?=
 =?utf-8?B?aUMwZ1JKMjQ0NVdvL1dFM0ExTnVxTzhqNzNiR2ZKZXU4azZkZzllanlFV3h6?=
 =?utf-8?B?MWhCMkE0dXJSR3RoMmlMSG0yWmgyTUFFWUJSYXZReUdrMDl4UE5NNUVUV21F?=
 =?utf-8?B?MjNsS25GZFVJMXhZelFCZEFrR3NhS1h0UTM5K2UzenFxMkt1dks1ZnI1dWVQ?=
 =?utf-8?B?bmx2NlB1UGkwNk5RVW42bzQ5cVZrbEpMeUhJZ1VCN28wYTJ3VUdDUkN6RHJS?=
 =?utf-8?B?eE9JQVhIcEJMZWM2b0wzc2lrLzhuaFZQcXRXb0YwdVovekZKa2ZsMWR2TkRM?=
 =?utf-8?B?VGE5bDh5alFMejJORmVCWWtKdGNyRFVBblRMS1ZHOWFtNTlHOUIxelhhY3FG?=
 =?utf-8?B?QkNMbnJoNWFkMFFNOEk4RXRpbFZZNDBodFRLU1pGeTU4TE9WUVF0L0tEZkpS?=
 =?utf-8?B?NFRPS0tLMGFLVUVla3RuUXFzb1oyMVp5M2pYNXR0WW1ycHExajB0Um4zV0ly?=
 =?utf-8?Q?zdejmJoXGwp+RZwFSq6Mo0LZcQf/EcM2mUuk5ERT6TfvD?=
x-ms-exchange-antispam-messagedata-1: FZG5Nn1IZnrdxyS6lRjzTbMuOJPbSm51LjE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <126B4C472AEEF446AA4B3DAB377316DC@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb101f6-64fc-4f25-5e76-08def3c45cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 14:09:42.8708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gmW5sSMOFt1ASnmse9jAbjmA23WPmpwFibI7rGI58yRhM7eEtx19liKBNRCjjSEbnNF3rneK7AmL/Wk91+o947nI2cTS3GUO6ZxcZyM/09A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB9553
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 14:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242947

T24gVGh1LCAyMDI2LTA4LTA2IGF0IDE0OjA1ICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
T24gNCBBdWcgMjAyNiwgYXQgMDc6MDYsIERhbmllbCBUdXJ1bGwgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gPGRhbmllbC50dXJ1bGw9ZXJpY3Nzb24uY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiA+IFRoZSBhbHRlcm5hdGl2ZSB0byB1c2UgYSB0bXAgZmlsZSB3YXMg
dG8gbW9kaWZ5IF9ydW4gdG8gYWxsb3cgb3RoZXIgZW5jb2RpbmdzIHRoYW4gdXRmLTgsIGJ1dCBp
dA0KPiA+IHdpbGwgYmUgYSBiaWdnZXIgcmVmYWN0b3IuIE9yIG5vdCB1c2UgX3J1biBhbmQgY2Fs
bCBkaXJlY3RseSB0aGUgcmF3IHN1YnByb2Nlc3MgY2FsbHMuDQo+ID4gDQo+ID4gSSBjYW4gY2hh
bmdlIGl0IHRvIGVpdGhlciBvcHRpb24gb3Iga2VlcCB0aGUgY3VycmVudCBwYXRjaC4NCj4gDQo+
IGJiLnByb2Nlc3MucnVuKCkgaXMgbWVhbnQgZm9yIHVzZSBieSBiaXRiYWtlIGl0c2VsZiwgaXTi
gJlzIGEgZ2xvcmlmaWVkL2JhZCB3cmFwcGVyIGFyb3VuZA0KPiBzdWJwcm9jZXNzLnJ1bigpIHRo
YXQganVzdCBkb2VzIHNvbWUgbG9nZ2luZyBtYWdpYyB3aGlsc3QgYWxzbyBnZXR0aW5nIGluIHRo
ZSB3YXkgYW5kIGRvaW5nIHRoaW5ncw0KPiBsaWtlIGZvcmNpbmcgdXRmLTguLi7CoCBUaGF0IG1h
Z2ljIGlzbuKAmXQgdXNlZnVsIGluIGRldnRvb2wsIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIGJlIGNh
bGxpbmcNCj4gc3VicHJvY2Vzcy5ydW4oKSBkaXJlY3RseS4NCj4gDQo+IFJvc3MNCm9rLiBJJ2xs
IGNoYW5nZSBpdCB0byB0aGF0LiBJdCB3YXMgb25lIG9uZSBvZiB0aGUgb3B0aW9ucyB0aGF0IEkg
aGFkIGluIG1pbmQgYnV0IEkgd2FzIG5vdCBzdXJlIGlmDQp3ZSB3YW50ZWQgdG8gaGF2ZSBhbGwg
Z29pbmcgdG8gcnVuKCkNCg0KVGhhbmtzIFJvc3MuDQoNCkRhbmllbA0K


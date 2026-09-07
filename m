Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647D2C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:04:31 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34519.1788786265440518582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=QrxmlbQP;
 spf=pass (domain: ericsson.com, ip: 52.101.72.15, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grh3YW61hl6O9KRWwxgZYJtkX7Qj8GmErfn6zQNO/0zghoU0Cz8s0Cqmk21G4g9fwc/dGdI8gOhv3kzImKDCaoUc7uwOLWi3ixL0Cc9Y01vqWSpDtFDMpVUdBmDkuXLnWH50ach+DNvyYbqAUTdjM45Y0v6D8Mdfh4S6e2vPG06DW6uqJfahLVlwjgU6ipa2X3eYHAsAX3sstydukzb0Pr4Va5jz84lXaDo20T1sm5VFRzM8AEQvbOOCIDfNv/qKrEs+1+nHrHIAJ6oixaPU512boQveSGiUXRIKGxhf+hOGOFfO3B1VQ+KBeocoIr0jZAnOAvTV/6hqxFVIBI12+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uv1ozQyW0daAfnyPJCs0tt8aOVvJ74hlPPONh00HZ1M=;
 b=eE4jXCwkaOBdrwxFqBIFq2IQqiJIbmvsf+/LgAvo36uBZwUvEOjgirgG6neRHDDu0XLflLmtdbotdZoffjaAuZ3O7NzYaopCXOa4T8dmP8JFi3ItcqWmmdDHLuqfrblKIXal+99WvTbve6IcG0nDJrFHdqEVkf8+yf4S9+td/ruJ8Ewg1EYiOSNCXzFs/F8r2bnyG1CsLJ72Elk1UogWXhHJf4A9XjId9Xd/p/5GRRD74JHlR6OYe9Bn7TEijRLguhWue97lhLM61hgftK/odxEI/DEuxC2mNYnlqiB51oAXDsTdjwa0JF+8r86CPkJRU4UTy881wWI7oUauAXeegQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uv1ozQyW0daAfnyPJCs0tt8aOVvJ74hlPPONh00HZ1M=;
 b=QrxmlbQP+LlytAOqKPU6xFpOnSkQRWnT6pzwNqm/Ol9AFCLhBIDwEg/VfpyM7/QGR7OogMwqYcUv4+l2POQeW7bHfoSbOSo4Jz8hN5yjtqyPY4PZWYns9z+K2AFzQf64vQqLR/25HDZhz6HIWorfCDWMlejWG2ip8o0xkaohex4W/vQbU/VySNXRiXQITq4DxVDEQoG25APlyzQYHoTKM6OLmdRXSd+Ksz2PT0r6ePOPK+cvh14ecHmxmUD/Adp8UBcT6rBdtcHSi+9MTchkIO/6QKUvr0MQIlit5ZFZjBYL8tTut0RIJUBqYA0bNtre57/29rnslNLmedCOYvVJIw==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DU4PR07MB11739.eurprd07.prod.outlook.com (2603:10a6:10:640::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 13:04:21 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%2]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 13:04:21 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "ross.burton@arm.com" <ross.burton@arm.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: A walkthrough of some of the challenges with auto generated
 changelogs
Thread-Topic: A walkthrough of some of the challenges with auto generated
 changelogs
Thread-Index: AQHdOtDZX08hEwAdqkOY5wYM/E7ZO7a8fVGPgAIszACABHMLAA==
Date: Mon, 7 Sep 2026 13:04:20 +0000
Message-ID: <67f2d11a4b024b10670005248f48e3e94a879f92.camel@ericsson.com>
References: 
 <e13a77790d4c9bb55bd61aa59ff433c703b6f3d8.camel@linuxfoundation.org>
	 <PA3PR07MB107211B0D283D9025D46DDED68AB62@PA3PR07MB10721.eurprd07.prod.outlook.com>
	 <122ee46d60d45c5a014a8cd40158a008ecd29744.camel@linuxfoundation.org>
In-Reply-To: 
 <122ee46d60d45c5a014a8cd40158a008ecd29744.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DU4PR07MB11739:EE_
x-ms-office365-filtering-correlation-id: 259100dc-136d-4df1-330b-08df0ce08866
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|38070700021|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 EzdEYBWK7JU3qY0Qbv/pdSjw2eViuRxsVh3z1H5wYCgXLZDYjumHgbEPjnEKbWQToKAhiY6LwtwvIBkM6FN2Ou7Y/Ik3hknYJ87G2g8G9BphTeQDfnZH+aYI8qWz3yRhClflyu14ziNEc09YqCT0+ISyEZus6Xa/xIpduXYP8UnztV6uCQryT/BrP/9j5pQFy0kW54uyX1ErsamNati//lg6ZRoZCwoIP4eV/rkO/yYnVL1RfBGHOToxREDPGB+khosuknxw7paflT/MfyYBcpUA7Cwrkr3L8tLGZ49Lbf1HhsFvdP7cdXMLxDpsOeSdf6BezvB7J8l8ZbzLN9GfisEOFkrBOcofUgtc9vUugzT0KvyUb6rSKQitWkHZyIM3c2GbE7/vHvY3/hJXMMzwvC6L51Xly4UWfuY2fge+7kELN5cK6IEv5bd7NhL432LumnXHATM09XcyoQEWaLblJ39j/L+yRXhalYnBE7MYNSdjMLNTo9YDNOGwx55xSz395RVVg4GY7r+Q621w0H5KFoOVGYTY4A28Eq6VwnKY1XfhZd4C+LpR8KIo/EFf/lYoN7kLvk1vXe+wrLoA1/qQF+JtDXAu4beB7jAqFbVLdL8KMEsS1j0Hgr8HPnZQrOIir9Qy8ILWDmomQ0m58+mePgsOgsLR4XR22fNSzLz24jVeMI5fV7ypA9Z6GO/vpA3/QMNk7jPVeaMIpDbQ+Y8kUmQd6Z+Xbw+YISZkvR0Emo4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(38070700021)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QzVmMUVqZy9NMk45Tkg4ZDRnN2ZsL1lEWkh0UVBHNWxxQXJnUXU3WG9aVUI3?=
 =?utf-8?B?ZWJGOG45SWplMEc4SmlNUXNOZTQ1QkJORmFyN3dNaHBGbWxuM2p6QjI0QlFQ?=
 =?utf-8?B?WXEwd1ZoZW5tV1R6dW1zeWFrRVRsR0pwNkdzYVd5ZlhFVFNZME92YitiWGsv?=
 =?utf-8?B?VGkyaWs2U3V0cmxwcldwODRUTDQzK1pOMXI1bDloNjc1b1ZyWTNhMjVxNWl2?=
 =?utf-8?B?dzFLYjNnV1hhaFBESExqd0xORC9WVnBTOFNWYy9yQ3lVQWhqTGorb3ZXYTFx?=
 =?utf-8?B?OU5FT3JyM0lLV2dieGZxK2R4TDV3Zm1Jd0paejdGaFVOVVZFSGVoUUlhUUZw?=
 =?utf-8?B?b0htZDJseU8yZHlGejhUN0VpNExGWHZXalBTVkwxOG1YS2pqa0RjRi9pdjhj?=
 =?utf-8?B?OWNyK2Fub0xNZXVQRnlVK1Zpb1k5d1NXdVRPT1YwbHJab1ZaY3RLM21QTThP?=
 =?utf-8?B?cmV6TUVWRlJuQUxkUGppUFY4eGhVVGFGUytMWlJSeVFRU2plZzRjVlJrZERE?=
 =?utf-8?B?RU1VVldoc2NycE9iem5Xb2tIMUJEZ3JFOE5qcFh2VGdCdkFzeEl4QnE5ZFlo?=
 =?utf-8?B?Smg3UnVOVkRnUENOd0cydzYxaEU0ZVFtKy8rY0Q3RnRadStaeEQ5QnNwOWhj?=
 =?utf-8?B?aTlUdHRYSE12cGRQaTFrL3MyOVZwWkwrbDRwUGhZK1d6K0V3bithd2tvTkRE?=
 =?utf-8?B?TUxnb3ZSaG1Nb0p0N2pKMkNwUEswV01GZWYwaXhmR1ArazA3eEM1dUZHTnVU?=
 =?utf-8?B?QXhvRmx6T1Q1aitaZ3FrT0E1MmJmZTFVdFp5cUZjcm1rYkRRUThCTW1WRVhz?=
 =?utf-8?B?aDlxY1V5VkNDdjEyUXlxM3VRVmo5WXZIeFFUVklzTlJmQVU0b3BNOW1zWE5p?=
 =?utf-8?B?Vmhob3hZU3NBbzBxQlRieG9OUk16T2l1VTh6OGtWSUY2ckNuZFA1aGNxWEJV?=
 =?utf-8?B?aTQ5cFlFZGRDVjJlK2MySXRIZUdBdHMwUVlrNklKRGpBLy9yL1cwZ2N1bUl1?=
 =?utf-8?B?aHMyUHdRQTBqdENJaDBkSUtzR1BNbGZWMWlvN3lha04zOEIxV2t1VGY2YU44?=
 =?utf-8?B?bFE1TVRPaUQwTlVEWFNRWXNxR3VwbVJmQ3k3ZzN0RlNEcm1oWnJZZkMva0tX?=
 =?utf-8?B?MmpDMSsyQWRtY1FSUGxMSlNOZWlmRE1rcWNxUDRKYlFSTjNnZGJQcVh5akVh?=
 =?utf-8?B?RzlEYVgwSDRpZFoxUlR2ZDF4RnBPcFdpcGZ4K0s4UWtER2NjS3NBTS8xNm9T?=
 =?utf-8?B?MVFmYmhiVytqK2I4SVFxMDR5ZnJFWE1QZ0MvTmc0S29DaUJPQzBwNVNqdUE5?=
 =?utf-8?B?M1NkbFdzNWc4dUVEMXJuWXN2Q2I0QnA3TjQvZElKbWphd0dCTks4YWRmNEh0?=
 =?utf-8?B?YUdnazM2V1BaRWdGU1Q1dHRZWlF1Z0h1VVdjTFF2VTZTNXJQRjFZdkFGM0p6?=
 =?utf-8?B?dU1Jc0M1blFSSW5sZUJid0NVZWhhSk9pcFRHWFFIMmcyZ0kwUnprSTBFekNI?=
 =?utf-8?B?cHhYR0RjU0lEemE5YlVGYWxGVHFiOUc0TWNVaHlLaHBqTkdMUzJ4SVRqbVZn?=
 =?utf-8?B?dGpNS0RIbndvWDc1VlZxNVF5MzZVeTFSWjdJaHdMSVRhVFZHUUF2YzR0UGVu?=
 =?utf-8?B?RkZJQWF4cVJpUS9KbVBvMWFmMlplMHdzQnJva3ZJY3pZTlZlbHpsbzdsSGpk?=
 =?utf-8?B?WkV3NGF2c1pVcU82Z2RleDNwd3ZBUEdoNVlLQUhCU1FVRXVXamx6bGtYay9Y?=
 =?utf-8?B?VE1Fd3gwMjlXclBkVkFVTjBZR2pLcTdoSGFFMWJMT1V6TmdUTTNGQS9GSUFs?=
 =?utf-8?B?MGQ5NHhLMkRxVGNaUVNsVWlRdU5TcXFyTHdqaE9rZi9ucm44dHAybVFkV3ds?=
 =?utf-8?B?UlNTRHB2aEFCZndTSE43bHZmZTZMcSthaGU3QVpvMVpUK2FISjBkTE5KN3Rl?=
 =?utf-8?B?MlVPQlBSRDNXSjhJUTk0cHpUNVRUMDVZc3hLOWI3NS80TWdFTVdlQ0lZMVRi?=
 =?utf-8?B?d2dGVTRobW1oUzlTZk42S0U5eVBiVitVaTRYa3lZVnhMd0VkZmk2K0w2Y0Fm?=
 =?utf-8?B?a3hTcUVSZ1pFN3NzUlQ2bFlWenVCbTVDR0krYUJJZWZvNG91dUE3V3hvRldh?=
 =?utf-8?B?Vkp6OER1djUxZXM3eFk3a0dHeTd2dGZ0WkpyMzBEdTVyanhsYTFwRHlhSFBM?=
 =?utf-8?B?alo2Q3dzQW5KT2NKRktrZUl3eWdCekwxY1dlN012ZXlqTXlRZXVkb3h1bUtJ?=
 =?utf-8?B?MHJxQ0J4TnJhbUIzeDcrR0xOSS9qcFdPQWwvM2tKS3d4K05uQmpSY2czZEpF?=
 =?utf-8?B?TmRNWGZWL3g3WU5VbkRGUkJqYlBuTmpVVXlKbjJkYUYrblJhU2lZYXF3cjFo?=
 =?utf-8?Q?pXBhwHuFl76Dyyl9S2XBNjNy+u4YnzCww/8EB/inLfX6B?=
x-ms-exchange-antispam-messagedata-1: pXTlXUNMMw6DncwXN/VQF8V9W/NBFgUaefk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <289C37DB746BA1478D10163704392DF3@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259100dc-136d-4df1-330b-08df0ce08866
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 13:04:20.9399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t9EncS8dvf3GWd/bbtHyHY/LtlKiP0fK4BRab0Qd8JxabTY4pGJF4eM9GkEllOJOyWci6+KNk2gvUMlygCPgEt7vafncuR4Zm0cLJf3xyrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR07MB11739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245255

T24gRnJpLCAyMDI2LTA5LTA0IGF0IDE4OjA3ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gVGh1LCAyMDI2LTA5LTAzIGF0IDA3OjU1ICswMDAwLCBEYW5pZWwgVHVydWxsIHdyb3Rl
Og0KPiA+IFRoYW5rcyBmb3IgdGhlIGlucHV0Lg0KPiA+IA0KPiA+IE9uIFdlZCwgMjAyNi0wOS0w
MiBhdCAxMjo0NyArMDEwMCwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4gPiBFdmVyeW9uZSBr
ZWVwcyB0ZWxsaW5nIG1lIGhvdyBncmVhdCB0aGVzZSBhdXRvIGdlbmVyYXRlZCBjaGFuZ2UgbG9n
cw0KPiA+ID4gYXJlIGFuZCB5ZXMsIHRoZXkgY2FuIGJlIGhlbHBmdWwgYnV0IHRoZXkgYXJlIGFs
c28gcGlsaW5nIHByZXNzdXJlIG9uDQo+ID4gPiBtZSBhcyBldmVyeW9uZSBoYXMgdGhlaXIgb3du
IHByZWZlcmVuY2VzIGFuZCBwZXJzb25hbCAidHJpZ2dlcnMiIGZvcg0KPiA+ID4gaXNzdWVzLiBJ
IGtlZXAgZ2V0dGluZyB0b2xkIGhvdyBYWFggc2hvdWxkbid0IGhhdmUgbWVyZ2VkIHdpdGhvdXQg
WVlZDQo+ID4gPiBiZWluZyB0d2Vha2VkIGJ1dCB0aGUgdHdlYWtzL3RyaWdnZXJzIHZhcnkgcGVy
IHBlcnNvbi4gSSBhbHNvIGdldCB0b2xkDQo+ID4gPiBhIGNoYW5nZWxvZyBpcyBiZXR0ZXIgdGhh
biBub25lIGFuZCB0aGF0IHdlIHNob3VsZG4ndCBiZSBzcGVuZGluZyB0aW1lDQo+ID4gPiBvbiBp
dC4gSSBjYW4ndCB3aW4uDQo+ID4gDQo+ID4gTWF5YmUgSSBzaG91bGQgd3JpdGUgYSBwcm9wb3Nh
bCBvbiB3aGF0IHRvIGluY2x1ZGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlcw0KPiA+IHJlZ2FyZGlu
ZyB0aGUgY2hhbmdlbG9nIGNoYW5nZXM/DQo+ID4gDQo+ID4gTXkgb3BpbmlvbiBpcyBhbHNvIHRo
ZSBsYXR0ZXIuIEEgY2hhbmdlbG9nIGlzIGJldHRlciB0aGFuIG5vbmUgYW5kIHRoYXQgd2UNCj4g
PiBzaG91bGRuJ3QgYmUgc3BlbmRpbmcgdGltZSBvbiBpdC4gVGhlcmUgaXMgYWx3YXlzIHRoZSBv
cmlnaW5hbCBjaGFuZ2Vsb2cgaWYNCj4gPiBwZW9wbGUgaXMgaW50ZXJlc3RlZCBpbiBhbGwgY2hh
bmdlcy4NCj4gPiANCj4gPiBUaGUgb3JpZ2luYWwgaW50ZW50IHdhcyBmb3IgdGhlIHN0YWJsZSBy
ZWxlYXNlcywgd2hlcmUgaXMgbW9yZSBpbXBvcnRhbnQgdG8NCj4gPiBrbm93DQo+ID4gd2hhdCBo
YXMgY2hhbmdlZC4NCj4gDQo+IEFncmVlZCwgaXQgZGVmaW5pdGVseSBpcyB1c2VmdWwgYnV0IEkg
ZGlkIHdhbnQgdG8gbWFrZSBzdXJlIHBlb3BsZQ0KPiBjb3VsZCBzZWUgdGhlIG90aGVyIHNpZGUg
b2YgdGhpcyB0b28uIE5vbmUgb2YgdGhpcyB3YXMgbWVhbnQgYXMNCj4gY3JpdGlzaXNtLCBtb3Jl
IGp1c3Qgb3BlbiBmZWVkYmFjayBvbiBob3cgaXQgJ2ZlZWxzJyBoYXZpbmcgdXNlZCBpdCBmb3IN
Cj4gYSB3aGlsZS4gU29tZSBvZiB0aGUgaW1wbGljYXRpb25zIGFyZSBub3QgcXVpdGUgd2hhdCBJ
J2QgZm9yZXNlZW4uDQo+IA0KDQpObyB3b3JyaWVzLiBJIHRvb2sgaXQgYXQgYXMgb3BlbiBmZWVk
YmFjaywgbm90IGNyaXRpY2lzbS4NCg0KQ2hlZXJzLA0KRGFuaWVsDQo+ID4gDQoNCg==


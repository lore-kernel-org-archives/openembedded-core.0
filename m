Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A738C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:06:26 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10563.1785823580929307817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=dJAqCGVi;
 spf=pass (domain: ericsson.com, ip: 52.101.66.32, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOwxzEN08RWdIOuc9V6o95aBFxhiljfw9WE14M5FpHFsQoEcznvenTSFX54g6FTUYTQrUQUJptgiatyS1oMpZZ1EEV8Onyl8+UQepwD8FZSQfRT85M9xgloiXB5SW/kItd1lMNjS4m07Mwm0Z0+4BxSJVrgSjEQkszlbignYNyQV7nTp03SQr87j5BwiNSRKX7pMfOdnrs3HPVSi0IEO6pZIRq/P83/ACzJhbjJx0wk+nUg4ZDJgjzvvFZ2KkTjxbv2XofFLmyeEYx/39AiLM0Fgqyl+YAp4cgmKkZqLO2j/hIYGIHkikk9Ba1DRPLwy1Ii5b5AftGWQ5gqkbFa5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkq3cl2kGx4P9kdda4daxF9m9nYhTQXB7nVMQKkorQ8=;
 b=gbG6F2pw7r61VSmpeYiy9vzRv9788hw6Set7ruQzwvVOb9oBFj6vs1srqdyX3YrtKC+JPsgG03Nm46DSW9/AME1p0EqxCWdFI7tQfaFaQrrsjmCmb9d2GHzUF2kTF62TK/MfPPLsAvO5wW1pjPCY6Lyxr/0ZAvvXdfvm9Vz4C46w3mqOYt1OMhaXcp3Ukyr58f62F1FwJlPCoc2oNMVIY6xtMmQgEKjtabunp0TtVPxApcrHDC9XAKVrFLUHkL+x1/mbarVOhcZDkSp1VX0mkpbKUPh4s1PjifBaakoBwJKZxc6bU1b0fksaMLTJGU5eVdp4mp8xa+Na9ooZLlVwmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkq3cl2kGx4P9kdda4daxF9m9nYhTQXB7nVMQKkorQ8=;
 b=dJAqCGVi39p7boNu6RbGLx4ghjgtFN+bVCcby6b8+h7MudjBNRbYBD6Uq8MVVaQ1F/B1bAb5zS6Ud3Da3GfjFvLnYfRdmzgdfaOUwSxZ0yTqc7kZAP8jMU9HkaYZrUqnR87DELiwcfTjRUKhyto1HlsP3R0oRibCIKduPk/13T4dgrDYEPIF4HZ7lNwTyBZODxqpXdb5BiwswKB/hkVXI9OjwQeIuFb2z11guuTioyyMGeNwNhj4HCV6H/d0+Bas4dHXvnhS2hZWyrfISeBBuBNts+S8dBwE8AsFQGG3SA2kdnZwoyd6SLLU5VSdFrtn7kPwbAt53emoBbCjeYFYLg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AS5PR07MB9694.eurprd07.prod.outlook.com (2603:10a6:20b:654::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 06:06:16 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 06:06:16 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] devtool: upgrade: read changelog blobs
 via a temp file
Thread-Topic: [OE-core] [PATCH v2 2/3] devtool: upgrade: read changelog blobs
 via a temp file
Thread-Index: AQHdI9bWAX7lR7cdmECTrdZ3iJpcrraNZwmA
Date: Tue, 4 Aug 2026 06:06:15 +0000
Message-ID: <a231432b23b9d9feabb09eca97380c7e93bee8df.camel@ericsson.com>
References: <20260804060205.179715-1-daniel.turull@ericsson.com>
	 <18C884DEFF3686EE.1990914@lists.openembedded.org>
In-Reply-To: <18C884DEFF3686EE.1990914@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AS5PR07MB9694:EE_
x-ms-office365-filtering-correlation-id: 64c8c7e5-44a5-4e48-b6b0-08def1ee7e85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|10070799003|366016|1800799024|38070700021|10067099003|56012099006|22082099003|18002099003|3023799007|11063799006|4143699003;
x-microsoft-antispam-message-info: 
 7kkLm33n2hH9zOJyCyeKhysHOw/NzPIawZD0EHiQktz/dlVq+Twa3s3iat0DHWLjLajByqNE06S4xScQmAK6PznA0rdpeI0nDRe0c9qdTjouUzee5M9hCeMwDT4MVEAPAtdsTc7ow0fTeWjzrwU/CJUbLIy5gXWCUHHl/0RQdRbZVqa+JMGNR6w9DZOlwQXiePGq0+pQylmc+FpIoqG2JY1InSp5Jz32jgd4j1iFlXqlAaNfSW0pXkZ9aebKA3ImdMTLrapdE6IhrGa8givTpGs++bJFyEqouo6xR0gdnOeD3E4Lu+/ZdYZHdoZltT8LVt7FDAhHVSHKhdjZZ7KtuVGnCg+dj8vYl1rJbwJqWoAFd9bAzSv2xjVxHCc/xcSU5zCbfa16sPtm6OE1RrIp2Us4kNyxp2JZjXgW2hc8PNU3Jdyk7WPbwRWnQ4XFwHruVP33cFvDZRHgSIZI54XVsUtDqFYAZHGK1u55/zNnFLUiPyR6utuYZUxRFin2rmdA5mTzZ72va7kEr9nO88iKwl4TggSssmWJT0RuGvVTsCNpGiVRrCANMqZCgeAEUjwx5fZl7gf3UEwpaRsi8EIY0wVGgEVA+jrcmAi5VuB4ok7flpUxcK3eP0sIOHmxzSnh6h2Rme8zSsNJt+y9ecq9XBebmQuqBraaVchHw96sl3bQUMStFFQTjAaEuMPlsCmYR5LhKMEwJoKUWNn7tPVquvd7jxSt3xaJwVSuR91O53Y=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(366016)(1800799024)(38070700021)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a2ppS3lrZ0phMDZxRnNrNW1Md1pTZlh6eHZoRzkzTDNLWTF5NCtVNGF3Nmhx?=
 =?utf-8?B?eVBoY2t5eWdZWnVvNEZmcUNFWnZLOE55ZWQyM0ViclBBM3pSUnA1WUduRzJ2?=
 =?utf-8?B?aDZiVzBnajg2bDU5L1EyaVg0TTZZK1N5OFQyVURtYUF4MG8rdUJ0TGsvcmpS?=
 =?utf-8?B?RGVNT2xNWTY4YSt6REd5T0RxTmZQWEVpUVFZcnFRdkdpdWhFTDc2N3AwYkdM?=
 =?utf-8?B?NTU5aE9QdmJmQWo1M3ZxeldyUjh0VDZUYTdQeUtVK3lNekZuUGpkVjIvM3hT?=
 =?utf-8?B?K0hvdXdYbFhONUdSK0lMdUxDS3I4YkgyaDh5SXM0MzIrcFJPS0twcWF4blgw?=
 =?utf-8?B?dVBWNGFYajNqSkk1Y0N1U3V0cjRqZ1FPQmloQkJOVmJFYzFCWEVJSldVMlZh?=
 =?utf-8?B?aW0wSzhYNW55ODltZzhEZDFHaVZxTjlLcHhQRW9SL080WHJwS0RkZGhNOEdK?=
 =?utf-8?B?cGxEL3RSODJLcmRaZ1BTdXk3L1dIQWRIU0hRekdhUjdVSmpacFZGeDhxOVN6?=
 =?utf-8?B?NDRHb3Y2TlUzYzBSWGhzSDBKb09KT3dMZjYveHR3aWM5akcyOEhMODNWUTBq?=
 =?utf-8?B?NnlCNmw3U252NTdJekJibXRETGpRVWxScDkreXg5eExHVlpoTmttOHg2YlVF?=
 =?utf-8?B?QnVUREFnTm5LWmJPSWtaek5TVlo4NEtScHJUbDJXYXFTai9ZODl4V21aL251?=
 =?utf-8?B?V1JlcmpVOVpkVktxV1lqRzNuUklkcVA2Z2pSWkpLMDI5bWVQeWx3d0dyWnA1?=
 =?utf-8?B?bnlST3ZsNHV6RTlRZFFpY0duZW1FcVJEajhOQzRjcHhhczNIZmVKd0dKeHBn?=
 =?utf-8?B?REhjYnpmd2NtcEF6TERWSGxkWFpwVHZJMHFkTHNLM1R1L1ROdndUL0JteWFk?=
 =?utf-8?B?YjhqcnhlNFd6d1d4amF5QTExM29iUThlTnFOTC9adFFyOFFKWkNkdW95K2Fk?=
 =?utf-8?B?WEZMYXdob0U3WnNRSVB4cDVUc21sMEZlbHBpWkh4WEJGODJvRU1PSGF4TXE3?=
 =?utf-8?B?ODZCbUkxUEE1NUNqdkhqWitZb0NsOEN5bFhDN2lnb21kMXRRNHBnMGdFWWdS?=
 =?utf-8?B?NE1rdVhyaXVVSS9WYzJqamUvUVpxOVp4a2NlZ2tyU0tFSFYwYURXOS9pUHBK?=
 =?utf-8?B?cllzbmlBZFlqbjYwVG9VR0ZrdmFOeHQ4djRGT3h6bVByaDBuMkxSSDNxYy93?=
 =?utf-8?B?ZTI2U3BCdEVoZWFYVnFqMGVPQUx4YzdDN2pzSk1DTUkvMnlQVjdVZ1hxbXd6?=
 =?utf-8?B?WGdZWHZNdXdiVHlBcEJ1N3lwWVNZSUM5ZnhwRWM5dDN4OWZTbHlYdGwrWkJn?=
 =?utf-8?B?QUcxVFhHQVNmSlpWamdVamlqdjRSQUJlSjIyR0p4eUNmbWs1Vk5TRm4vU0FS?=
 =?utf-8?B?OHV5SWg3a1ViQTA1Qmt2RENBdjhxSHJoMW5aZS9SMEhWWS9oQS9OSDdjdXI5?=
 =?utf-8?B?UDJkQldkb1JtUVJzSzEwcnl6dWUvamNjcTVqY0F2Tm10UnpCMWx5S0UydDlV?=
 =?utf-8?B?Y2pNYnB2ZGE2UkhybkEyYnpqK3I3RkF2STROSGlKK0NuallsZkoyZ2dBNU0x?=
 =?utf-8?B?dFVaZ1V4NElWNGpmMkw3VTF4am0rMkgxYVplVFlOZDhzN3RtcStyVHd5MUF6?=
 =?utf-8?B?VUdzeXhpbTNIdVRnVTJpUS9YMFhYclVPWG8xbklUMmVyMlFocnhkKzBDckRr?=
 =?utf-8?B?WER0cGMxcThyaUhqUDZIVkVnUnR5enJNYXdMUU9JZVJ0Z3M4elJtRE4xU0ZH?=
 =?utf-8?B?RGFaeWNzVWw1OU1JOWJHeU5rR3dsTG83bHNEZWNRQktPcDlsWURCb3FmMllC?=
 =?utf-8?B?UkU4NjIxUktETHZlSDJXSzhabnZVZ1FmZDQxNmtqaWI2Sk54R1hTeFFiVk5E?=
 =?utf-8?B?M1ZtbzRtbG93bmRUUEtveldobFZZRE9sMmxJK1ZmRFNidi9YbXpOQlUvc1lz?=
 =?utf-8?B?d282dTBZYThVZVdHaUFXajF6N3VRU3R5Sm91M21hN01nUDdLVjZSeFJ2N1Rl?=
 =?utf-8?B?VXRvazFqK3U1WWhOTlUwNjF0UVFyQTRlc0REc3ltbCs4bHdmV2prK1FuRUZ2?=
 =?utf-8?B?Qnh5NEhaazdmSU82R1hmVUNOOWptNWVJTS8yTkp2RnNXcE9JenlDTWtMM1Yr?=
 =?utf-8?B?VjJJV2NMajBiRGNkSjc5Q3ZnYW9pbHpXZkFRVUk5WERaVTNYdjQ3eUk4dEpV?=
 =?utf-8?B?UjdPanZqbThxWGRwVVJhQm1vNHRqbzZzVmpjWElybXQwUEpWNCtoTnZITVZT?=
 =?utf-8?B?OFNvTWVnMmZlRHZmYW5CY1Q4WVhPcDZsZnBhanU4dTNMWGxWSTh5bDF6bzVL?=
 =?utf-8?B?YzdDLzhQaE1Md0ZEbnlnbDZvZnAzYVZPV252cWhwY0NCK2NHWlFhZ0txNXJo?=
 =?utf-8?Q?gKtyZtgPT5ORE4rRyKzWsHF2fPUWth8vR8XZrn39410ho?=
x-ms-exchange-antispam-messagedata-1: JhvBmRs9eDZxnuwtFAM6aVYs//0WkQ8gdNw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93EE0F392E0F7647BD1BDC94605D1016@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c8c7e5-44a5-4e48-b6b0-08def1ee7e85
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 06:06:15.9793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fmaq4RyserYF33yKfJRjKE/0/MIh+m7IoJZzUhXQctdUlOPArdn8lAl5+rEHWJJfZUGJwGeV3nCwLqYWT9w+RWKAVdZoByJOifYYirhg9QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR07MB9694
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242700

T24gVHVlLCAyMDI2LTA4LTA0IGF0IDA4OjAyICswMjAwLCBEYW5pZWwgVHVydWxsIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBGcm9tOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwu
dHVydWxsQGVyaWNzc29uLmNvbT4NCj4gDQo+IGJiLnByb2Nlc3MucnVuKCkgYWx3YXlzIGRlY29k
ZXMgY29tbWFuZCBvdXRwdXQgYXMgVVRGLTgsIHdoaWNoIHJhaXNlcw0KPiBVbmljb2RlRGVjb2Rl
RXJyb3IgZm9yIGNoYW5nZWxvZ3MgY29udGFpbmluZyBub24tVVRGLTggYnl0ZXMgKGUuZy4NCj4g
TGF0aW4tMSBhdXRob3IgbmFtZXMpLiBBZGQgX2dpdF9zaG93X2ZpbGUoKSwgd2hpY2ggcmVkaXJl
Y3RzDQo+IGBnaXQgc2hvd2AgdG8gYSB0ZW1wIGZpbGUgYW5kIHJlYWRzIGl0IGJhY2sgd2l0aCBl
cnJvcnM9J3JlcGxhY2UnIHRvDQo+IHRvbGVyYXRlIHRoYXQsIGFuZCB1c2UgaXQgZm9yIHRoZSBl
eGlzdGluZyBwZXItdmVyc2lvbiByZWxlYXNlIG5vdGVzDQo+IGxvb2t1cCBpbiBfZXh0cmFjdF9j
aGFuZ2Vsb2coKSwgd2hpY2ggaGFkIHRoZSBzYW1lIGNyYXNoIGV4cG9zdXJlLg0KPiANCj4gQUkt
R2VuZXJhdGVkOiBLaXJvIHdpdGggQ2xhdWRlIFNvbm5ldCA1DQo+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiAtLS0NCj4gwqBzY3Jp
cHRzL2xpYi9kZXZ0b29sL3VwZ3JhZGUucHkgfCAxNiArKysrKysrKysrKysrKy0tDQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvc2NyaXB0cy9saWIvZGV2dG9vbC91cGdyYWRlLnB5IGIvc2NyaXB0cy9saWIvZGV2
dG9vbC91cGdyYWRlLnB5DQo+IGluZGV4IDQ5NWE1YjgyMTcuLjY4ODNjOTljY2UgMTAwNjQ0DQo+
IC0tLSBhL3NjcmlwdHMvbGliL2RldnRvb2wvdXBncmFkZS5weQ0KPiArKysgYi9zY3JpcHRzL2xp
Yi9kZXZ0b29sL3VwZ3JhZGUucHkNCj4gQEAgLTU4OSw2ICs1ODksMTggQEAgZGVmIF9yZXNvbHZl
X3JzdF9pbmNsdWRlcyhjb250ZW50LCBzcmN0cmVlKToNCj4gwqDCoMKgwqAgcmV0dXJuICcnLmpv
aW4ocmVzdWx0KQ0KPiDCoA0KPiDCoA0KPiArZGVmIF9naXRfc2hvd19maWxlKHNyY3RyZWUsIHJl
ZiwgZm5hbWUpOg0KPiArwqDCoMKgICIiIlJldHVybiB0aGUgY29udGVudCBvZiBmbmFtZSBhdCBy
ZWYuIENoYW5nZWxvZ3Mgb2NjYXNpb25hbGx5IGNvbnRhaW4NCj4gK8KgwqDCoCBub24tVVRGLTgg
Ynl0ZXMgKGUuZy4gTGF0aW4tMSBhdXRob3IgbmFtZXMpLCB3aGljaCBiYi5wcm9jZXNzLnJ1bigp
DQo+ICvCoMKgwqAgY2FuJ3QgaGFuZGxlIHNpbmNlIGl0IGFsd2F5cyBkZWNvZGVzIGNvbW1hbmQg
b3V0cHV0IGFzIFVURi04Ow0KPiArwqDCoMKgIHJlZGlyZWN0aW5nIHRvIGEgdGVtcCBmaWxlIGFu
ZCByZWFkaW5nIGl0IGJhY2sgbGVuaWVudGx5IGF2b2lkcyB0aGF0DQo+ICvCoMKgwqAgcmVzdHJp
Y3Rpb24uIiIiDQo+ICvCoMKgwqAgd2l0aCB0ZW1wZmlsZS5OYW1lZFRlbXBvcmFyeUZpbGUocHJl
Zml4PSdkZXZ0b29sLWNoYW5nZWxvZycpIGFzIHRtcGY6DQo+ICvCoMKgwqDCoMKgwqDCoCBfcnVu
KCdnaXQgc2hvdyAlcyA+ICVzJyAlIChzaGxleC5xdW90ZSgnJXM6JXMnICUgKHJlZiwgZm5hbWUp
KSwgc2hsZXgucXVvdGUodG1wZi5uYW1lKSksDQo+IHNyY3RyZWUpDQoNClRoZSBhbHRlcm5hdGl2
ZSB0byB1c2UgYSB0bXAgZmlsZSB3YXMgdG8gbW9kaWZ5IF9ydW4gdG8gYWxsb3cgb3RoZXIgZW5j
b2RpbmdzIHRoYW4gdXRmLTgsIGJ1dCBpdA0Kd2lsbCBiZSBhIGJpZ2dlciByZWZhY3Rvci4gT3Ig
bm90IHVzZSBfcnVuIGFuZCBjYWxsIGRpcmVjdGx5IHRoZSByYXcgc3VicHJvY2VzcyBjYWxscy4N
Cg0KSSBjYW4gY2hhbmdlIGl0IHRvIGVpdGhlciBvcHRpb24gb3Iga2VlcCB0aGUgY3VycmVudCBw
YXRjaC4NCg0KPiArwqDCoMKgwqDCoMKgwqAgd2l0aCBvcGVuKHRtcGYubmFtZSwgJ3InLCBlcnJv
cnM9J3JlcGxhY2UnKSBhcyBmOg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZi5y
ZWFkKCkNCj4gKw0KPiArDQo+IA0KDQpEYW5pZWwNCg0K


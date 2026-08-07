Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4258C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 10:05:13 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39373.1786097108987064201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 03:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=MwbZxcZb;
 spf=pass (domain: ericsson.com, ip: 40.107.162.64, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cnazh4rck/nYm+a9t3TKpHhcw7lAVd650rSk1iqoMMt+f4Kokqz2Lx5yaOiHUgJSMmorfgm8EfxnrmbBbeJprs/OwnZuw278yFd5hWZl0TqlUlJznVPfs/xS4Uye44ToYbV2B9HLBmOtGra3xhe9mLqS6McPvzoVBo0mC/XN09rBDh8/XQ2ffLHkJNADEI4IezwHmlsMyPKi5nxxqRSW9vjtuy/LBefADHfDKmKt0ma+evL0lhBiDZ9DMJsWRjgPi2DWlCAmUS6qlTNFXV3BDWCD/ZPNKaqEhS5wQlyFn2XC+IAbzl8Zv1Ts+QwiGELxffUtxBDLKUlwSvYULKuuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbytOoY0Piq1Tqfr9NWd2+aI6AK7wf7uUcbEuPRmD64=;
 b=WaH5Y9WKwn+MH3yXH0P2WmTtZPSvV40c70NxmPAI+qZpbrMY+f9RR3218d+6j3lEnrfH6rJUlq+Mn9M1FO9VFmpetUW5djjGjfUIlgmPAd3wHHS4wapoOBxEUbpHPL0AE8MKwQWnCwEXb1WhvR7t+2vV6UnOLfjx/tPGY+HaUuzZy+aOHJLam30rguuh288QSmgeAAwwa7YDppCq9D5Z5g2q/T9xU2KtKDI2oyfWl58PFdiYcPAWVDI8ePDjYShFSqjwlZm5TSXH93PPONJmwsbwzYH+WxauSsN4ZeESZLoPxUtM/2duwnig2o/x3zshRJyHotTUlTb9tGbwwbKg6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbytOoY0Piq1Tqfr9NWd2+aI6AK7wf7uUcbEuPRmD64=;
 b=MwbZxcZbHWmmg2Foipqna4Au+/3Kpel6A5ZQhd1HogFPB9CJKOyJY/9xdaPEOp8I9suKGecaw1q5JWkSepcz7yRFq+oQI7bBsp3yJHptYoPT56M/o70ufHXQvgHwXgbV5lHC5i61elc/a6hd3cq4dgrmmjdUsS1qpilECESRMGhbnJGtyzWrsnuGmYebyUFrUBxAgoc27DnEiM1XzVg+6il+AHwuJJgvVDfDK/6joBfX9GqUWrxL8X+yTPxCLAPebH+Aw/QfKlEe3q8MhVzTP9HrXnSS5rrjVCDYBtmLqnlQPIpVBegw075pEZ/v7ZUUbiD/Oj0cieuURbRx2sJKbQ==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by GV2PR07MB11525.eurprd07.prod.outlook.com (2603:10a6:150:2f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.9; Fri, 7 Aug 2026
 10:05:04 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0315.006; Fri, 7 Aug 2026
 10:05:04 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "paul@pbarker.dev"
	<paul@pbarker.dev>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>
Subject: Re: [PATCH 1/7] util-linux: inherit upstream-stable-release-point
Thread-Topic: [PATCH 1/7] util-linux: inherit upstream-stable-release-point
Thread-Index: AQHdIOe1IwnxQv5Y4U+o7A0IjOAv37aSYTCAgAAFboA=
Date: Fri, 7 Aug 2026 10:05:04 +0000
Message-ID: <5a6951f6ee5c4abd9a031a81b87ed31792df1449.camel@ericsson.com>
References: <20260731122522.1647968-1-daniel.turull@ericsson.com>
	 <20260731122522.1647968-2-daniel.turull@ericsson.com>
	 <72c5184f8c87333de0b988aa9df125abf1da1393.camel@pbarker.dev>
In-Reply-To: <72c5184f8c87333de0b988aa9df125abf1da1393.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|GV2PR07MB11525:EE_
x-ms-office365-filtering-correlation-id: 9847bd67-4e22-4d8f-ede6-08def46b5a2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|38070700021|6133799003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 ffNhh6WdhW3DyezVwYZ/Sfe1BO4R0ajSM1TfrtOq2xIAYdsMj/NQMfjfIk0WKulEfuKuMPximeQzeUhJT7WeeLPgQcDUJMI502I7IRWkdkCl6T+VJ6x8mL8byyrpDhRUN7pp8M1zDjKuB5NOp2eYSVfoDEP/bo9Knyi+5GXzsjyY2hR/klUO+b10Xvxf7PdeznEpTHRRrAXcZM2wWrrRMnqWCdl1aTjqZDRbN88zUpa3qEct5W2BBTLyUZXPQ4iyf6tijN0iini/ZFrtMEcrXi21B6erl3jlD2UhvJixUhgrEiwbBEzwB+Y4+Q7PLYYfAhgj0yh7FJe7aczAHZzVHTweEjCwn64rW4wED8oWSFVyr/1NmX4JWXiFV+IROMfn+DAPoI3Czo4CBAbLSog61GDZyhxMQmLkomiDyaqp7SYkzSTA/9FsV9McBcJwUOT/DSfymbD7kuPB+1tv84O5VLnFdkrr9fHriErbwl0ZRVsp+55UnCcwfLJNTKls8RNS/BsJ1d2A2AvCk4hfDPxaaiJIOn3RDoizkihfKgrf/Gv92+o8fVbxtygHbAxH0TrtFi/USVeIlmRjYzZlv7NmB3VgWa/ljXx3KaeQONC/LAmOqInbiSP9DoOg8atOAzyzTiWHCZAR+G3mAJktfOMIGbLrgstLYudFDqgxghSk+eX9dQzvCBgtfYDEM+A2vg5iAob4NT0u03czquOFDQy1ex85sGZGK7ooBP0Q6H3QbFM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(38070700021)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OWNTNlZJYWk2NUZFUzEzRjNSTFEvaCtVYmVpWVZDdWdQZWNiNXdOaUhsQ1ZY?=
 =?utf-8?B?WGxjSzFyTFJHcHp4QmFybUdLTEh0SXVjRndyeW9SaExBSFdJVnpyYnBKWWcx?=
 =?utf-8?B?MUNRZ0lWeFgra090aysycUxUa2tpMUFxTEhkWDhFeEZ2UUZmNkxONHFzRHZp?=
 =?utf-8?B?NlQwRlkzaXlVbFRtc3IzK3FoMXZMZWtiQ3hMR2Y5QjF1M2N0Qm4wRUdxRlBX?=
 =?utf-8?B?TU85emNyTDgwaSttcEY5YzRuRE9QcmpzVTQ1SkVDTGFzYnpZM295Q1Q1RFlM?=
 =?utf-8?B?bWlJNkEySWVvampycU5sQUNBekxZSTlRbjE4eURKdmk1ZWF1Y0ovcjYveWcr?=
 =?utf-8?B?SGZ3RUFUMnh1SXVpWGNsWUVtc1NTS1MyT050dFRHQUxkRGZkemdLd2xXNElt?=
 =?utf-8?B?WlZzNzJhLzRnRThEY1haZDBJZ2dLdzI0QnNrQUgxV05TQlo0cWhkY1doUjlz?=
 =?utf-8?B?eFdXbUx5d215U0orUVlmTm1oUktNL1FaVllPTnVOTkFlcitJSURtZUhFRk4w?=
 =?utf-8?B?c3pDUFBQTVRxdjRNSlNLczZ4SkluVFVjKzFhRmczc0QxeVh5QUxQNlFmcFVy?=
 =?utf-8?B?Z3A4NFI2cHJLdE4rMFBZdytIUkVHd2RRVE9kTEhqRENvYzNMRkNKTFpUQ0M2?=
 =?utf-8?B?ZGJEOXp6UTVqRVFwYU9hbzlhNHdjZ2x2NHk0MnFPZVYwRDh4SFJvN1N5dFpX?=
 =?utf-8?B?UkZaTW96WThJUTNTQVA0UE1RNk9tOUVRem9mUjN5VTdMakMxbW8zajVtNmJj?=
 =?utf-8?B?YzA4c2RuakFJZEtpdTFiWkVuRGtqaTRmMUM4bmhZcFlZSGl3VCtKNVNSTUdn?=
 =?utf-8?B?QkQycjl0ZUhTQkVxYnhzZStqc0pjOXhyOXhqV1VxUUZvZWpzeG8ycWZUbDk4?=
 =?utf-8?B?N3R1NEFJTVFUdSt6THN2WE5ORnNSZ243QVgydjlVZ3VIS2IyWkFVQzNSZGFa?=
 =?utf-8?B?WERvM0t3bW1MZmZiREhrR25PR2UzNHVQU2ZlYm42Ukw3NURGdUVWcm5tRmZJ?=
 =?utf-8?B?ZFN3TmtYY2FiRk5uSGdjbmpCaVZkUjkwN2xPNTlwOGNIT3VjM01CVWcydkxv?=
 =?utf-8?B?bkxjajRzMXdOZVZuR215YlZMSVhwbStZUnVwV01EVFRXMFVra2c2NUlwdXA2?=
 =?utf-8?B?RmoyUTArNHNLaHhyeW1LTHFML2daWEdKQ0ljUlpWRmY2eWY3VmJkcEVXT2w4?=
 =?utf-8?B?T0VtYUl6RW9CdFdNdmVSR2NXdDdEbzNyaVUzUmtJTTAvaFM4RHlPbDlqY0ZU?=
 =?utf-8?B?bEExNTFVRURHVmlTZzA3MWQ3ejJTeWIxa1hnaDRFbFBpWGNHSW5udXMyekRt?=
 =?utf-8?B?d3lmVUxKSDVsdWxML1pxcCtFbEQ1cWZ6bDQ1WVhTN1VjZE0yS214VGlka0hj?=
 =?utf-8?B?cTdvbFZxb2pGMVVvY280cm9rSVlLSUNKRFlDTnYzbGVycUNJakRic2VEb1ZL?=
 =?utf-8?B?ejlGWHdPUGFqenpZSkM1TmhVZWNsZXpxMG9aMEJBNkM0MnNyVDFEeUgydFY1?=
 =?utf-8?B?NlFFRTF1OUl4WkUwODdZVFhXQjcvcjVkbTNEWEpkR3kxQTZrQ0Mwd3hxTExY?=
 =?utf-8?B?QUcrclNhZVBoaitoR1hRMUY0eURmOHNyb21Dd29TWFpOOFZoaDRDOFNUcjIy?=
 =?utf-8?B?eTRTMHd3VndGS09MMHI3bUd2Nk9RdUh1amVZbjI0OGs4KzRNYThvdHM1S1or?=
 =?utf-8?B?eG1hQVpETHNTQnhvYjNSdGdsMVN5K2VuSHQvc212WlNJUnUwSXloVVk0NlNv?=
 =?utf-8?B?T2hZK3ZFS2svWGsrNlp1dXA2b0QyakFmNmRERGRFRGk4aVp4TVZkR0ljbXht?=
 =?utf-8?B?eXkvR2ZGdHdPNlFPempubEoyZ095YWdHaWNod3NRZW82cmxIamh2d1g5RWox?=
 =?utf-8?B?RUxWR1pXNmRBVW51QU9yZ3Vrd3NMc3MzeTZLOU54OS9CUDdzNk4zTTcvejFK?=
 =?utf-8?B?bUpWaDF2bXh4d3JZbTFGTWNiaU1RZ2pLNktYWE9rNVJaUHFsdkZwTDdKbk5D?=
 =?utf-8?B?VG80YnFxcFFuOEdiNmJmTFptendYckxLZGIxbVdTazN2QnpNTk9zckdlRjVm?=
 =?utf-8?B?NFRaTk9kVUZ3UllDWDJPSnZYSHltY1RKRHM4Zm5IZHIxMHl6d1Y1TjhhVWJl?=
 =?utf-8?B?VjRkYXBIeGVETmVqSk0vZVZzbEc5UXYvNm9Qa0dLYmxtMDFMYSs1U1VSWnIx?=
 =?utf-8?B?aEIrWUxNODgyMm9TMEJtRWFoVEoxdHZUOGR4Y2ZPRUd3V0FGWjNOdWZyNzZm?=
 =?utf-8?B?UkF6S0w4bTB0eUlGbjJuSVUvR0FOb21uVHovejlDbWdaeENyc2l4V3h4OVhO?=
 =?utf-8?B?a1RHNEpqZ3EwbzZGTVJZOGZXYnhsRGlXTmdpMzVOUm5ROVM3SnJNaWZNeU41?=
 =?utf-8?Q?JGxp71wBKijmqkKIUmCMcZc4WLYK7zqNUq75rdagKJ8Pa?=
x-ms-exchange-antispam-messagedata-1: 6tAPfyZT0nV4VK5dqaN0ygLG256lhANak88=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B568DB858C4F949885D49C6DD3A24A3@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9847bd67-4e22-4d8f-ede6-08def46b5a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 10:05:04.4375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1UVs5TJXvEqxjmdkZURQGwtHw3/GCYmcWhsCfzibkYz3jxbcfe6cAa+K7yB5FAICgjkCZIlZeacFO7fCOi3FpjZEtpPMAgpr8w7jWWZjY/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB11525
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242999

T24gRnJpLCAyMDI2LTA4LTA3IGF0IDEwOjQ1ICswMTAwLCBQYXVsIEJhcmtlciB3cm90ZToNCj4g
T24gRnJpLCAyMDI2LTA3LTMxIGF0IDE0OjI1ICswMjAwLCBkYW5pZWwudHVydWxsQGVyaWNzc29u
LmNvbcKgd3JvdGU6DQo+ID4gRnJvbTogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmlj
c3Nvbi5jb20+DQo+ID4gDQo+ID4gdXRpbC1saW51eCdzIFJFQURNRSAoIlN0YWJsZSBCcmFuY2hl
cyIpIGRvY3VtZW50cyBzdGFibGUvdjxtYWpvcj4uPG1pbm9yPg0KPiA+IGJyYW5jaGVzIHdob3Nl
IG1haW50ZW5hbmNlIHJlbGVhc2VzIGFyZSBidWcgZml4ZXMgb25seSwgc28gdXBncmFkZXMNCj4g
PiB3aXRoaW4gYSBtYWpvci5taW5vciBhcmUgc3RhYmxlIHBvaW50IHVwZ3JhZGVzIHBlciB0aGUg
T0UtQ29yZSBzdGFibGUNCj4gPiByZWxlYXNlIHBvbGljeSAocmVmLW1hbnVhbCwgIlN0YWJsZSBQ
b2ludCBSZWxlYXNlIFVwZ3JhZGVzIikuDQo+ID4gDQo+ID4gwqANCj4gPiBodHRwczovL2RvY3Mu
eW9jdG9wcm9qZWN0Lm9yZy9kZXYvcmVmLW1hbnVhbC9yZWxlYXNlLXByb2Nlc3MuaHRtbCNzdGFi
bGUtcG9pbnQtcmVsZWFzZS11cGdyYWRlcw0KPiA+IMKgIGh0dHBzOi8vZ2l0aHViLmNvbS91dGls
LWxpbnV4L3V0aWwtbGludXgvYmxvYi92Mi40Mi4yL1JFQURNRSNMOTUNCj4gPiANCj4gPiBDaGVj
a2VkIHRoZSBsYXN0IHBvaW50IHJlbGVhc2UgZm9yIGZlYXR1cmUgY3JlZXA6DQo+ID4gDQo+ID4g
wqAgMi40Mi4yIChKdW4gMTYgMjAyNiksIGFnYWluc3QgMi40Mi4xIChNYXkgMTggMjAyNik6IDMy
IGNvbW1pdHMsIGFsbA0KPiA+IMKgIGZpeGVzIG9yIGhhcmRlbmluZyAtLSBtZW1vcnkgc2FmZXR5
IChhIGxpYmJsa2lkIHVzZS1hZnRlci1mcmVlLCB0d28NCj4gPiDCoCBidWZmZXIgb3ZlcmZsb3dz
LCBhIGxpYmZkaXNrIEdQVCBmaXgpLCBwcml2aWxlZ2UgdGlnaHRlbmluZw0KPiA+IMKgIChYLW1v
dW50LnN1YmRpciByZXN0cmljdGVkIGZvciBub24tcm9vdCksIGRpYWdub3N0aWNzIChmYW5vdGlm
eSBxdWV1ZQ0KPiA+IMKgIG92ZXJmbG93IGRldGVjdGlvbikgYW5kIGRvY3VtZW50YXRpb24uIE5v
IG5ldyBvcHRpb25zIG9yIGJlaGF2aW91ci4NCj4gPiANCj4gPiBUaGVzZSByZWxlYXNlcyBhcmUg
bm90IHBpY2tlZCB1cCBvbiB0aGUgT0Ugc3RhYmxlIGJyYW5jaGVzOiB1dGlsLWxpbnV4IGhhcw0K
PiA+IGhhZCB6ZXJvIHBvaW50LXJlbGVhc2UgYnVtcHMgb24ga2lya3N0b25lLCBzY2FydGhnYXAg
b3Igd3J5bm9zZSBzaW5jZSBlYWNoDQo+ID4gYnJhbmNoIGZvcmtlZCBmcm9tIG1hc3RlciwgbGVh
dmluZyB0aGVtIGF0IDIuMzcuNCwgMi4zOS4zIGFuZCAyLjQxLjMNCj4gPiByZXNwZWN0aXZlbHku
IFRoaXMgYWRkcmVzc2VzIHRoYXQgZ2FwIGdvaW5nIGZvcndhcmQuDQo+ID4gDQo+ID4gVGhpcyBh
ZGRyZXNzZXMgdGhlIGdlbmVyYWwgY2FzZSBvbiBtYXN0ZXIsIHdoZXJlIFBWIGlzIDIuNDIueC4g
U2luY2UgdGhlDQo+ID4gcmVnZXggaXMgZGVyaXZlZCBmcm9tIFBWLCBhbiBvbGRlciBicmFuY2gg
c2NvcGVzIGl0IHRvIHRoYXQgYnJhbmNoJ3Mgc2VyaWVzLA0KPiA+IGFuZCB0aGUgMi4zOSBzZXJp
ZXMgc2NhcnRoZ2FwIHNoaXBzIGRvZXMgbm90IHF1YWxpZnkuIDIuMzkgYWRvcHRlZCB0aGUgbmV3
DQo+ID4ga2VybmVsIG1vdW50IEFQSSwgc28gMi4zOS4xIGludHJvZHVjZWQNCj4gPiBMSUJNT1VO
VF9GT1JDRV9NT1VOVDI9e2Fsd2F5cyxuZXZlcixhdXRvfSBhcywgaW4gaXRzIG93biB3b3Jkcywg
ImEgc3RhYmxlDQo+ID4gd29ya2Fyb3VuZCBmb3IgdXNlIGNhc2VzIHdoZXJlIG5ldyBrZXJuZWwg
QVBJIGlzIG5vdCByZWFkeSB0byB1c2UiOyB0aGUNCj4gPiBzZXJpZXMgYWxzbyB0b29rIG5ldyBD
UFUgbW9kZWwgc3VwcG9ydCBhbmQgbGliYmxraWQgYmNhY2hlZnMgc3ViLWRldmljZQ0KPiA+IGxh
YmVsIHByb2JpbmcuIFRoYXQgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgMi4zOSBzZXJpZXMgcmF0aGVy
IHRoYW4gb2YgdGhlDQo+ID4gcHJvamVjdCAtLSAyLjQyLjIgaXMgMzIgY29tbWl0cyBvZiBwdXJl
IGZpeGVzIC0tIGJ1dCBpdCBtZWFucyB0aGlzIG11c3Qgbm90DQo+ID4gYmUgYmFja3BvcnRlZCB1
bmNoYW5nZWQsIGFuZCBlYWNoIGJyYW5jaCdzIHNlcmllcyBuZWVkcyBjaGVja2luZyBvbiBpdHMg
b3duLg0KPiA+IEZvciB0aGUgYXZvaWRhbmNlIG9mIGRvdWJ0IGl0IGlzIG5vdCBhIGRldmVsb3Bt
ZW50LXNlcmllcyBlZmZlY3QgZWl0aGVyOg0KPiA+IHV0aWwtbGludXggaGFzIG5vIGRldmVsb3Bt
ZW50L3N0YWJsZSB2ZXJzaW9uIHNwbGl0LCBhbmQgcHJlLXJlbGVhc2Ugd29yaw0KPiA+IGdvZXMg
dG8gLXJjIHRhZ3MuDQo+ID4gDQo+ID4gQUktR2VuZXJhdGVkOiBLaXJvIHdpdGggQ2xhdWRlIE9w
dXMgNQ0KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJp
Y3Nzb24uY29tPg0KPiANCj4gSGkgRGFuaWVsLA0KPiANCj4gV2UgbWVyZ2VkIHRoZSByZXN0IG9m
IHRoaXMgc2VyaWVzIGJ1dCBza2lwcGVkIHRoaXMgcGF0Y2ggYXMgSSB3YW50ZWQgdG8NCj4gdGFr
ZSBhIGNsb3NlciBsb29rIGF0IHRoYXQgbGFzdCBwYXJhZ3JhcGggYWJvdmUuDQo+IA0KPiBTY2Fy
dGhnYXAgYWxyZWFkeSBoYXMgdjIuMzkuMywgc28gQVBJIGZpeGVzIGluIDIuMzkuMSBhcmVuJ3Qg
cmVhbGx5IGFuDQo+IGlzc3VlLiBIb3dldmVyLCByZWFkaW5nIHRoZSAyLjM5LjEgcmVsZWFzZSBu
b3RlcyBpdCBhaW1lZCB0byAicmVzb2x2ZQ0KPiB0aGUgcmVncmVzc2lvbiB0aGF0IG9jY3VycmVk
IGR1ZSB0byB0aGUgdjIuMzkgcmV3cml0ZSBmb3IgdGhlIG5ldyBrZXJuZWwNCj4gbW91bnQgaW50
ZXJmYWNlIiB3aGljaCBzb3VuZHMgbGlrZSBhIHZhbGlkIGZpeCBmb3IgbWUuIFN1cHBvcnRpbmcg
bmV3DQo+IENQVSBtb2RlbHMgaXMgbG93IHJpc2sgYW5kIGxpa2VseSB3YW50ZWQgYnkgbWFueSB1
c2VycyBvZiBvdXIgc3RhYmxlDQo+IGJyYW5jaGVzIGFueXdheS4gQW5kIGFsbG93aW5nIGxpYmJs
a2lkIHRvIGhhbmRsZSBiY2FjaGVmcycgdmVyc2lvbg0KPiBzY2hlbWUgYW5kIHN1Yi1kZXZpY2Ug
bGFiZWxzIGlzIGxvdyByaXNrIGFuZCBhIHNlbnNpYmxlIHdheSB0byBoYW5kbGUNCj4gd2hhdCB3
YXMgc3RpbGwgYSBtb3ZpbmcgdGFyZ2V0Lg0KPiANCj4gU28gSSdkIHNheSB1dGlsLWxpbnV4IGhh
dmUgc2hvd24gZ29vZCBqdWRnZW1lbnQgaW4gbWFuYWdpbmcgYSBzdGFibGUNCj4gYnJhbmNoIGFu
ZCB3ZSBzaG91bGQgYmUgYWJsZSB0byB0cmFjayBhbnkgb2YgdGhlaXIgc3RhYmxlIGJyYW5jaGVz
Lg0KPiANCj4gUGxlYXNlIHNlbmQgYSB2MiB3aXRoIGFuIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2Ug
aWYgeW91IGFncmVlIHdpdGggbXkNCj4gY29uY2x1c2lvbnMuDQoNCkkgYWdyZWUgd2l0aCB5b3Vy
IGNvbmNsdXNpb25zLiBJJ2xsIHNlbmQgYSB2MiBmb3Igb25seSB0aGlzIG9uZS4NCg0KSSdtIHdh
aXRpbmcgdG8gc2VuZCBzZXJpZXMgMyB1bnRpbCBhbGwgd2hhdCBJIHNlbnQgaXMgbWVyZ2VkIChm
b3Igc2VyaWVzIDEgYW5kIDIpLiBJIHdhcyBob3BwaW5nIHRvDQpoYXZlIG1vcmUgY29tcG9uZW50
cyB0aGF0ICB3aWxsIGhhdmUgc3RhYmxlIGJyYW5jaGVzLCBidXQgbW9zdCBhcmUgc2luZ2xlIHRy
YWNrLg0KDQpCZXN0IHJlZ2FyZHMsDQoNCkRhbmllbA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAN
Cg0K


Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8248DC4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 07:08:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42481.1784704093020030040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 00:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=nZldam+Z;
 spf=pass (domain: ericsson.com, ip: 52.101.70.10, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3waPjzgcVvsRCckR8a5UWUc7gmYlQ6LhLlyw3+nNsHkluGyOW/Mx/PFir0yhRfhXguzBT2PBKlUY8BrdSY2OGvc3wm5hdp4j1u2o5j0F2NsBargba4mOGSnPpQ06K3qkCPGILTSoEkHpmc2+8hvT6w+pxkSwHZBPI8tiR0rNWZ4irivtA63iAYx2BsrenvWRxd/HR8C/LTWfF3nTCQ04JKtVXWHfzVAVjJF3HZ26FXPGdGHTZ2NOsS4CJ4e4bXJV5w1Z0iEoKJ1vGLd2ntWhtrC/W18hoXVJ6mO19XUWRlGD9YkMg1hqfhtPRhhOloFky0btZqNn/zVAb2jovUgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vECSqU3G6K4LSMVLTZmmrIkZ81H3VSyDQPi1UHveO9Y=;
 b=DSeMUGRJxMtLyoUuRlTP7ouNmcn1xFewf/jxsgBrkoylXAuDqb9IUbT2XqJZfYUdVVofnaxiqACA7RCDqX1H4bnUalpxCiWhUWQIWRB4PsSBZPB9vzH5jPYZQ4qY8gn7VGWVoyNPAw59I48MLHEuhgsOd6mdxv2d947I/bdSpwoVZU5k9M6fbEORbVWQ39wpb6nGHPKGYXddLt/ZLSlCcVCM7Y7DdmJblClQOcULWsUS1qz85xGTadwW518IgvL7OIz/NKgtbYfnFC3B1MysFEW0ygz1h/I5VgyZBQR/S+AL1U0O8p6JznwGDFnLm3kDgHXdMwEuQZEgpLO1gU5mjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vECSqU3G6K4LSMVLTZmmrIkZ81H3VSyDQPi1UHveO9Y=;
 b=nZldam+Z8Q6YKIgwhQMeXkE5BpUvv2gp16YVvBRIblbZ2/3d8+bB03Vpmwdp7mCmK375YnNIuKZmdulNhStkVjccKqOf7vnPPRH1fcXA9SygU39F5FLvjW2zDo2N+l4bqz7TebTTxXZc34jM3l61lM/FTtw0iaVO9qDduyR1Y6Oqd2ykit8ayLrWZ7lfMjiHPJUIH97P3JntX9Nw0F1OSl4/LaaDjAlXNknufuX6vlfYb4JPnaUR2IajkNp5U4IUhUjIn37iJBsDuRX9Oj45ElZEk0fcT+qiumfmcejChoVsO0TShjRYUjs9wfzwliK5AywzjZslvBANnIYaCoulVQ==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by PAXPR07MB8448.eurprd07.prod.outlook.com (2603:10a6:102:2b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 07:08:08 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 07:08:08 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Patchtest results for [PATCH 2/4] Add tag in SRC_URI in
 multiple recipes
Thread-Topic: [OE-core] Patchtest results for [PATCH 2/4] Add tag in SRC_URI
 in multiple recipes
Thread-Index: AQHdGSAUqI6j/dgSgUinleBko0kAi7Z4EaYAgAENy4A=
Date: Wed, 22 Jul 2026 07:08:07 +0000
Message-ID: <0d61576c6efee1814a1faabf68d32c6ccdcfcb4e.camel@ericsson.com>
References: <20260721144811.323786-3-daniel.turull@ericsson.com>
	 <0101019f85332a41-715bc4eb-5531-4e75-b229-00eb43db757b-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019f85332a41-715bc4eb-5531-4e75-b229-00eb43db757b-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|PAXPR07MB8448:EE_
x-ms-office365-filtering-correlation-id: 96fc5651-61a4-46f3-1672-08dee7bffbaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|4022899009|366016|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 qa+RUz3AAxh5QiLcCUnzLpPJdwvgOXe14NqcKga9JTzqUXgtJcAZpUIK8w9WxQi+mNSjD71/BXhhGBfL3ix5xteHGQnrIlFAPfdyG0Nj2j5PZvZUz0jCIa5zLAbnCJ2svJzyPBZHkSy6NZIn09TW3CTedgc9Y37SWAGSIEj61nQTg/d6cPWjrp3PfHoCSz60GUp5eZvZPMgIPYNp6/VUPfJLOcnYiXicMM171YbQqn6qpEZD+abkPad8ZoNJ46BJNSUUBRBKmeDTpG17NmBbj+U8EBte38fCzZ3WoIIbKqn6rMVubZQv2Wv1H5pizg8ZB4jbYV4JTfeOOW4ZccnOFsTGXRgW5NKWf3dE4P4qLwX8dBvmX5+NwgBsjYsAAO3sRqWu7/292jl5UPAj4UmiY6PbBq5P/qk48owosIjvvvKBH1oU3Kj0t4OLJSQxmV899n33qMitcVb2HYuF4nWEcV7CILsGcUyWFatmJjVvAyQ6VHPMrlbpp538O5mjhA9VrOr0sRP+RvplqsOxD4ODx0rYaquTAav80DtiFOCzuG/awhZ0zlifaHV4RRqYjAwyjYS35ZYpcshCo+FFDEpsVAUFgeyv5U8fRxMNKw2mi0knYEr3WZhZWuHigE2CTQQEsVQW88iWrNZTl3XjMwbh+GmxwA0I5+nPnqxxXjykRDs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(4022899009)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WThabFdQMlc1aFcvUEhoWGJId3RwYURYLzQxeGkxcytISVNkbldHb1drUk00?=
 =?utf-8?B?SHBOdEdCWTB6WCtXZi9rQ2hiYkJNQkk2Zm5oZ0FYZ3JzQUNNTHFOck5zNVo0?=
 =?utf-8?B?RU1ueEhnWTk3T1kxU0l4a3dEcTBib0x4SHdSZldyZkJEUnVMRTJZeTE1ZkZ5?=
 =?utf-8?B?aGsyS3NCdVJaU2VkakdIa3pWbVRScDJnQU5ScWg5ZDRHT1Z0elZxZ2MwNXMv?=
 =?utf-8?B?emxIT09CV1ZMN2kxRXRsQi84NTZPY0VxOGtycnBsYTB6K1FhV1psLzJGOGxw?=
 =?utf-8?B?clRDNVN6dEt2YkNiVmg5eWlxK3RMWWZudG9hNFN4ZFRYSkEzS3ZFU05vOUdN?=
 =?utf-8?B?a0RqL1hiZDdpUnFuUGN2T1pGMUFOSDRQYlo1by9FV0IzWjdjQitJclFXYXZw?=
 =?utf-8?B?WFY5S1pManhFenRZOTVCSDgyVTFMcmVtZzNndC9oOWRJclFOS3JjZ2JmczBj?=
 =?utf-8?B?MGYxUzF1MEhYQTNGU0wxcHlpSmczeDF1YkJQOHJsNjZQV04xdTgzVHI5aWlt?=
 =?utf-8?B?Y3I1S0d5V2ozdU9iQUJ6UkN1Nzh3eXEraFUvYzVsS3owUmU1VEd1Wk0rb3ln?=
 =?utf-8?B?eFFpVmJndXlOOUplQVRqdXdRNXNDMTZ6M2Y2ckRwTlE5QW9LaThaVStkKzRk?=
 =?utf-8?B?dWNyb1Q4WnE3RTBIWUhpMTdRUmZ6VjFRSjczT2JPUHp0NitPRDZtVGlwNmR2?=
 =?utf-8?B?blBuL01hME8wYWJld05IdDhyZm51VGZBZXByZ1VveGd0dmRsZUh0QTlHRkhu?=
 =?utf-8?B?R1lXZTh5a1p2bWsxbFFsaFBCbWV3SU4yaHBxQ2VQc3RZeWpLZVBIQ1k1cVRn?=
 =?utf-8?B?RFZZWjdpL2tJWTlwTTBNKzBNcXMrb21tWHJiTlRpK280SXZRYUVQZk1qVlgw?=
 =?utf-8?B?Qm1EYThkUllQb1hqZGZjV3pidkdweFlnQTdHclNHaURuU2RoQWV3b0Y1dGV2?=
 =?utf-8?B?cHBjRnhVbFRPcmVFSHdxQk9kcHdoZk85RDROOTMrNmRHdUZBVGRVWWdnUEV3?=
 =?utf-8?B?dFArOGZCL3pQcXlWeGhpaXEwZ2hDMnM1MUkrL251MnBGV3ZpaXk2d2lESkNy?=
 =?utf-8?B?WWJzcCtUU1NJYmRsWEZNREVMb2ZhVkJWdlpwVHBNMFJuMmRVUk5Sd2EwNWhL?=
 =?utf-8?B?elZObFBFY2JHQ2JOLzgvRGdaT3pwZ0N1b1VVM0hrK25PL09nb2FSeVFzM2hk?=
 =?utf-8?B?M0JDd2dNcndselVXRTdQRng3UVBtYWxVYi9ocE5VZ293enp1d2NZbjZBbUZD?=
 =?utf-8?B?dTNpd282MkZ2clRNUnJCenV2NUVEUGNMZHlYRXVXT0pQWnVuMHptcFA0ZFRu?=
 =?utf-8?B?ZC96QkV6VWN6R3o5N2ozZW9KOXdaN1lSOGh2QSs5UnBnM3hWek82MkdnQ1lp?=
 =?utf-8?B?SFRXV2F2cHNNZlBqWi9VVWx3VnQ2YnNHNnBDbXRic3Rtb0VmcWtBTWRqMzM4?=
 =?utf-8?B?VGg5b3BTV3dtNWVOVjd5VFBwOVpLN0ZnWFIwbzhFTnZBS1c1MVFQZVVQZlY5?=
 =?utf-8?B?ZFdvOTRwaEx5TGhRR0JzK1V4VTlES3ovcVVvMlRZcjNjanpGSGFIMFhjN0Y3?=
 =?utf-8?B?LzAwNDBoSTdyT2ZNdEErZjNPTitaVGxnTGZKeHFCUWxaQ3FXVDE0SlUydUZa?=
 =?utf-8?B?Q3ZTZmRaaW95L0JQOU9EMm8xSFdnSUloSmpIeVcxQXZQUmNocWlZSnRrU2ZW?=
 =?utf-8?B?Q3pyWUEwaGpMZ0pUOEY0VGE5VmlmUjB2Rk8wRWpHendOaUk2cHp5dktwTEhq?=
 =?utf-8?B?SkQ4cDdQVVdFZDlmaDNyeHp5RUNHQUhBdXNpS3NQc2g1ejVQWjJmQ3hZN1ZR?=
 =?utf-8?B?TmRXTXRNNHV2ellPdWtYYnJLeC9XTTRtUThPVjlJeC9JMVdIU1dDSzhJay8v?=
 =?utf-8?B?a1NVa0htVGFveDBYVy9WbnFNWW9iSVZOMVpQcXBvZ1Q3YVVqSTdLYU5hTXAy?=
 =?utf-8?B?aVE5L1ZzdTlBZ013QjBtTHRGNGMyM0hXeXM5WEdPeitmcFBOcmI4WG1WYXNO?=
 =?utf-8?B?U0o4MmVKQ1R3bzVSQTVEdC9nWlZGQWpXcmU1UnR0SmkxL2tGZWVCVUxmbENC?=
 =?utf-8?B?ckhwNVczYXBmWCtDanFXaVJReWViU2lncHdKVmtCTXhkcWR2c1VWd0pPbDA0?=
 =?utf-8?B?aXFwam41R29tQUJUaTZhU2Y1VEF1YVE0UTdxVVRia21WZWdaK0NTMTRDZzV6?=
 =?utf-8?B?dGQ0eXFuSzR3SEYwOHd3aFFhLzY0L0Zqdkk5cUlSOWgzdGs2VUV2SXY2MVZI?=
 =?utf-8?B?c1V4RjZneUhOYzlQb3lWbSs1emVEd1IvVWVHYzF1R1pESExNTVJJUDZMdWxq?=
 =?utf-8?B?MkNqMTZCVHdKVElGV3I1U014WEFTcnFuOXc0WXQ4NG1jcWJVYlN1a0hzajEy?=
 =?utf-8?Q?XQJdMApa1Gg8lA2k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA6EEFA4A6E4654A9F92BB3B3F12630B@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fc5651-61a4-46f3-1672-08dee7bffbaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 07:08:07.9965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cxjl2GquMVXWR6FwGJ+wlarHulfskA19KYz0xjQPpJjfne79Ag5Un71ei3Bvp/G917+xus6x8UBAfzmLKG5aPeI1vnICzEx7BD3CwamFHD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8448
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 07:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241604

T24gVHVlLCAyMDI2LTA3LTIxIGF0IDE1OjAyICswMDAwLCBQYXRjaHRlc3QgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCndyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgc3VibWlzc2lvbi4g
UGF0Y2h0ZXN0IGlkZW50aWZpZWQgb25lDQo+IG9yIG1vcmUgaXNzdWVzIHdpdGggdGhlIHBhdGNo
LiBQbGVhc2Ugc2VlIHRoZSBsb2cgYmVsb3cgZm9yDQo+IG1vcmUgaW5mb3JtYXRpb246DQo+IA0K
PiAtLS0NCj4gVGVzdGluZyBwYXRjaCAvaG9tZS9wYXRjaHRlc3Qvc2hhcmUvbWJveGVzLzItNC1B
ZGQtdGFnLWluLVNSQ19VUkktaW4tDQo+IG11bHRpcGxlLXJlY2lwZXMucGF0Y2gNCj4gDQo+IEZB
SUw6IHRlc3Qgc2hvcnRsb2cgZm9ybWF0OiBDb21taXQgc2hvcnRsb2cgKGZpcnN0IGxpbmUgb2Yg
Y29tbWl0DQo+IG1lc3NhZ2UpIHNob3VsZCBmb2xsb3cgdGhlIGZvcm1hdCAiPHRhcmdldD46IDxz
dW1tYXJ5PiINCj4gKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X3Nob3J0bG9nX2Zvcm1hdCkNCj4g
DQo+IFBBU1M6IHByZXRlc3Qgc3JjIHVyaSBsZWZ0IGZpbGVzDQo+ICh0ZXN0X21ldGFkYXRhLlRl
c3RNZXRhZGF0YS5wcmV0ZXN0X3NyY191cmlfbGVmdF9maWxlcykNCj4gUEFTUzogdGVzdCBDVkUg
Y2hlY2sgaWdub3JlDQo+ICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS50ZXN0X2N2ZV9jaGVj
a19pZ25vcmUpDQo+IFBBU1M6IHRlc3QgU2lnbmVkLW9mZi1ieSBwcmVzZW5jZQ0KPiAodGVzdF9t
Ym94LlRlc3RNYm94LnRlc3Rfc2lnbmVkX29mZl9ieV9wcmVzZW5jZSkNCj4gUEFTUzogdGVzdCBh
dXRob3IgdmFsaWQgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X2F1dGhvcl92YWxpZCkNCj4gUEFT
UzogdGVzdCBjb21taXQgbWVzc2FnZSBwcmVzZW5jZQ0KPiAodGVzdF9tYm94LlRlc3RNYm94LnRl
c3RfY29tbWl0X21lc3NhZ2VfcHJlc2VuY2UpDQo+IFBBU1M6IHRlc3QgY29tbWl0IG1lc3NhZ2Ug
dXNlciB0YWdzDQo+ICh0ZXN0X21ib3guVGVzdE1ib3gudGVzdF9jb21taXRfbWVzc2FnZV91c2Vy
X3RhZ3MpDQo+IFBBU1M6IHRlc3QgbGljIGZpbGVzIGNoa3N1bSBtb2RpZmllZCBub3QgbWVudGlv
bmVkDQo+ICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS50ZXN0X2xpY19maWxlc19jaGtzdW1f
bW9kaWZpZWRfbm90X21lbnRpbw0KPiBuZWQpDQo+IFBBU1M6IHRlc3QgbWF4IGxpbmUgbGVuZ3Ro
DQo+ICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS50ZXN0X21heF9saW5lX2xlbmd0aCkNCj4g
UEFTUzogdGVzdCBtYm94IGZvcm1hdCAodGVzdF9tYm94LlRlc3RNYm94LnRlc3RfbWJveF9mb3Jt
YXQpDQo+IFBBU1M6IHRlc3Qgbm9uLUFVSCB1cGdyYWRlICh0ZXN0X21ib3guVGVzdE1ib3gudGVz
dF9ub25fYXVoX3VwZ3JhZGUpDQo+IFBBU1M6IHRlc3Qgc2hvcnRsb2cgbGVuZ3RoICh0ZXN0X21i
b3guVGVzdE1ib3gudGVzdF9zaG9ydGxvZ19sZW5ndGgpDQo+IFBBU1M6IHRlc3Qgc3JjIHVyaSBs
ZWZ0IGZpbGVzDQo+ICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS50ZXN0X3NyY191cmlfbGVm
dF9maWxlcykNCj4gUEFTUzogdGVzdCB0YXJnZXQgbWFpbGluZyBsaXN0DQo+ICh0ZXN0X21ib3gu
VGVzdE1ib3gudGVzdF90YXJnZXRfbWFpbGluZ19saXN0KQ0KPiANCj4gU0tJUDogcHJldGVzdCBw
eWxpbnQ6IE5vIHB5dGhvbiByZWxhdGVkIHBhdGNoZXMsIHNraXBwaW5nIHRlc3QNCj4gKHRlc3Rf
cHl0aG9uX3B5bGludC5QeUxpbnQucHJldGVzdF9weWxpbnQpDQo+IFNLSVA6IHRlc3QgQ1ZFIHRh
ZyBmb3JtYXQ6IE5vIG5ldyBzb3VyY2UgcGF0Y2hlcyBpbnRyb2R1Y2VkDQo+ICh0ZXN0X3BhdGNo
LlRlc3RQYXRjaC50ZXN0X2N2ZV90YWdfZm9ybWF0KQ0KPiBTS0lQOiB0ZXN0IFNpZ25lZC1vZmYt
YnkgcHJlc2VuY2U6IE5vIG5ldyBzb3VyY2UgcGF0Y2hlcyBpbnRyb2R1Y2VkDQo+ICh0ZXN0X3Bh
dGNoLlRlc3RQYXRjaC50ZXN0X3NpZ25lZF9vZmZfYnlfcHJlc2VuY2UpDQo+IFNLSVA6IHRlc3Qg
VXBzdHJlYW0tU3RhdHVzIHByZXNlbmNlOiBObyBuZXcgc291cmNlIHBhdGNoZXMgaW50cm9kdWNl
ZA0KPiAodGVzdF9wYXRjaC5UZXN0UGF0Y2gudGVzdF91cHN0cmVhbV9zdGF0dXNfcHJlc2VuY2Vf
Zm9ybWF0KQ0KPiBTS0lQOiB0ZXN0IGJ1Z3ppbGxhIGVudHJ5IGZvcm1hdDogTm8gYnVnIElEIGZv
dW5kDQo+ICh0ZXN0X21ib3guVGVzdE1ib3gudGVzdF9idWd6aWxsYV9lbnRyeV9mb3JtYXQpDQo+
IFNLSVA6IHRlc3QgbGljIGZpbGVzIGNoa3N1bSBwcmVzZW5jZTogTm8gYWRkZWQgcmVjaXBlcywg
c2tpcHBpbmcgdGVzdA0KPiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRhdGEudGVzdF9saWNfZmls
ZXNfY2hrc3VtX3ByZXNlbmNlKQ0KPiBTS0lQOiB0ZXN0IGxpY2Vuc2UgcHJlc2VuY2U6IE5vIGFk
ZGVkIHJlY2lwZXMsIHNraXBwaW5nIHRlc3QNCj4gKHRlc3RfbWV0YWRhdGEuVGVzdE1ldGFkYXRh
LnRlc3RfbGljZW5zZV9wcmVzZW5jZSkNCj4gU0tJUDogdGVzdCBweWxpbnQ6IE5vIHB5dGhvbiBy
ZWxhdGVkIHBhdGNoZXMsIHNraXBwaW5nIHRlc3QNCj4gKHRlc3RfcHl0aG9uX3B5bGludC5QeUxp
bnQudGVzdF9weWxpbnQpDQo+IFNLSVA6IHRlc3Qgc2VyaWVzIG1lcmdlIG9uIGhlYWQ6IE1lcmdl
IHRlc3QgaXMgZGlzYWJsZWQgZm9yIG5vdw0KPiAodGVzdF9tYm94LlRlc3RNYm94LnRlc3Rfc2Vy
aWVzX21lcmdlX29uX2hlYWQpDQo+IFNLSVA6IHRlc3Qgc3VtbWFyeSBwcmVzZW5jZTogTm8gYWRk
ZWQgcmVjaXBlcywgc2tpcHBpbmcgdGVzdA0KPiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRhdGEu
dGVzdF9zdW1tYXJ5X3ByZXNlbmNlKQ0KPiANCj4gLS0tDQo+IA0KPiBQbGVhc2UgYWRkcmVzcyB0
aGUgaXNzdWVzIGlkZW50aWZpZWQgYW5kDQo+IHN1Ym1pdCBhIG5ldyByZXZpc2lvbiBvZiB0aGUg
cGF0Y2gsIG9yIGFsdGVybmF0aXZlbHksIHJlcGx5IHRvIHRoaXMNCj4gZW1haWwgd2l0aCBhbiBl
eHBsYW5hdGlvbiBvZiB3aHkgdGhlIHBhdGNoIHNob3VsZCBiZSBhY2NlcHRlZC7CoA0KDQpUaGUg
cGF0Y2ggYWZmZWN0cyBtdWx0aXBsZSByZWNpcGVzLCBzbyBJIGRvbid0IGtub3cgd2hpY2ggdGFy
Z2V0IGl0DQpzaG91bGQgYmUuDQoNCj4gSWYgeW91DQo+IGJlbGlldmUgdGhlc2UgcmVzdWx0cyBh
cmUgZHVlIHRvIGFuIGVycm9yIGluIHBhdGNodGVzdCwgcGxlYXNlIHN1Ym1pdA0KPiBhDQo+IGJ1
ZyBhdCBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvwqAodXNlIHRoZSAnUGF0Y2h0
ZXN0Jw0KPiBjYXRlZ29yeQ0KPiB1bmRlciAnWW9jdG8gUHJvamVjdCBTdWJwcm9qZWN0cycpLiBG
b3IgbW9yZSBpbmZvcm1hdGlvbiBvbiBzcGVjaWZpYw0KPiBmYWlsdXJlcywgc2VlOiBodHRwczov
L3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL1BhdGNodGVzdC4gVGhhbmsNCj4geW91IQ0KPiAN
Cj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNz
YWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMjQxNTUwKToN
Cj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVz
c2FnZS8yNDE1NTANCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvbXQvMTIwMzc4MTg2LzYzMzA1MjYNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1j
b3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6DQo+IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBbDQo+
IGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
PiANCg0K


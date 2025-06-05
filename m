Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D818BC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:12:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.71])
 by mx.groups.io with SMTP id smtpd.web11.7385.1749129120922327570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=Djl46qMM;
 spf=pass (domain: ericsson.com, ip: 40.107.162.71, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzJDP/Okt3tRZAJnft3CG6+Xw1mWQIjIbiRtgfQYvfplgFntkwMAExh0BOdDy0qRrFBT+jBoKu6bghcI1tYEUXe1eKJKuuVSUZ1ZP/rQUo+589laVe3/w+/oqN4o9jDXR/0WaDzFi8emI4LUExjlUDmzPBPrf4CL3BJ+jgU2IiQw3KxhqYvySoVTnI6TnL2eJhdgftwrRtsS9AwscutyWObHe6NgrIlaWVa8Z4Gxod6NallV6FHBPp3XZxH2hSbh3KXE0LNgyV6NCoyiJJalareZcjVj/3DyrfsJcwXngD6QaL8QW+rpCHPmf4uIFd1qHWyiRQzQiJ71AxVNEBwzvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJP5G7brrkWMYzP/OBYMIWGTBXwVH5H4qPpk1NHHqcc=;
 b=x4CMscOA7gOSYgYooz5If13oJSr6he6GKOzRotQ3zKqECvgUzxTs3HQ/7cPzHYNQQgwLr3XmcJwnB3Nd8eKzcAz1uaeFE5cZ9r3ykQKynpsTOYt9ATmvunwdjjjWvPoB7QwbOy5A4pbcr7kb0n9XT4x75e7lcUmg5YCMqLQZxyP2XkneQjNQVqEewGzHa3rhv4Qvf7Ri6zDl64WEwjf7Q0B39bcYQ2dlijsq8LllTrqN/JKXi5aAOHlxMfStyPqv0X70d4Z3MYLoHf7e2+gMwh/2rmoN7cCEO/BeUHrqW5Lb1NKu7akDX9SP1GAo2MSsg7uvSXZFQZlo4g1ygPecWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJP5G7brrkWMYzP/OBYMIWGTBXwVH5H4qPpk1NHHqcc=;
 b=Djl46qMMZ8ivlSP1nz/j2dbpACDrd1jHL0rYhmYpRvNQbzJbffivL9qiLPjtWYT7d0wDcs4F4rng47d+HSRXFGriuhmElp39g/XxTkX10zFevFQi2io88Ue/5rPo02P1rd/NzvZUduLotLNDcjYeS6Di18pm3tYBH85PFQVhuJhCdWhL7CQi4uLSbDi20T8meVV+d7zudMwC37AAwuRhbbuBFw+Pw6n578XASG1+i4v6j/6m6IC7ryxRHf//tvm4LZQTN/ZFbMGGgjp9TtYDYxxtZs0qrF0738oeEwNMBc26l3/Dp5VbQfoge77FnOaQ/1QtlAjCTtPMMUS03SwtVQ==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by AS8PR07MB9134.eurprd07.prod.outlook.com (2603:10a6:20b:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 13:11:56 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%7]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 13:11:55 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH v7] package: export debugsources in PKGDESTWORK
 as json
Thread-Topic: [OE-core] [PATCH v7] package: export debugsources in PKGDESTWORK
 as json
Thread-Index: AQHb1hHX/x/uJ7cqeEmASUSjYaVuv7P0iRiAgAAAumA=
Date: Thu, 5 Jun 2025 13:11:55 +0000
Message-ID: 
 <PR3PR07MB666677B4A7CD5EC0D5550F528A6FA@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250605120306.3692449-1-daniel.turull@ericsson.com>
 <F45D78A4-1E20-47BE-9A54-DAB7B86CCABD@arm.com>
In-Reply-To: <F45D78A4-1E20-47BE-9A54-DAB7B86CCABD@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|AS8PR07MB9134:EE_
x-ms-office365-filtering-correlation-id: 49057f4a-caa2-439a-a653-08dda4328beb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZmljbkxBemRmNmgyVTcvSFZFVmpqK0RSdW43bXdUdnk3VWd0VlorTlpaS2xh?=
 =?utf-8?B?QjYvZ0hBalgzeHd5cmJIVFNkSDVwRCtRdGpJSjltU1lHMVlESlZzVnFxVCtz?=
 =?utf-8?B?OVRWTkxnS081N2V6THZVTXhIL0MvTy9VTHhWQjVWaUhJQ1RJRlhndkFtUkVC?=
 =?utf-8?B?WnZTd2dlMnRxZGYwYkh1cVEyRkJBMnJybndiQTJUNDhtLzQ2YWp0SDBCT2ZZ?=
 =?utf-8?B?cC9zdnk5WVBPNzByRjlJUy8zWWxRNjhpR2RuellkbzErWnZRdCtjRDhDTG4x?=
 =?utf-8?B?TStXMUxmWHZTaXZrZVBoTUZTSjh1NVQzYm1HVEVJQk1XUHp5dFQ0azI4RVFv?=
 =?utf-8?B?YnBnNStUM05URjdCTUxta2JjSmp5dW5lclVLMHd4QmRBTVRmUlNUU2xqeUpI?=
 =?utf-8?B?Y0VReDJob2tsNEpNanlSUnpNblJ1TnN2aXNtR0UwZ2g4MWhwTTBuenlQNzR2?=
 =?utf-8?B?Vkw0ay95YkZBdDUxSm56UFZta0lBMGJWcnpjWTR0ejVLVWFYUm1rbHFzb1F2?=
 =?utf-8?B?c1IvRkN4K2h2ZkF1MWEvR3Fja2F6UFpWaHpObmtDTHlYZDlCSW9tRVhJdzVl?=
 =?utf-8?B?NXlBMUJYMm5PYlJZdEtrLzVvakdpRVFqTStxanB1bGRUT3l0dGRyeTU1SG1q?=
 =?utf-8?B?clFCWnRCR05yOXUyOG1DcFNtMVVKQW0rQWdnaFhuRXhqZjBrOUY2c3R5d1Zn?=
 =?utf-8?B?eGZuVWEwemgzQXpDd0hVSUxEUUNwY2lDTkl4SmU0aHQ2YjBUT0ZjT25mSmVs?=
 =?utf-8?B?NGJ3MXEya1FaY29BZ1BuVWhFLzZPZG5RZjZBbkJ1eUhma2FYZzVPNTlCYTE3?=
 =?utf-8?B?aklSS2NhMEhBTlpJZnNmUGVhcmZoeHdDeC9mY2JCSzJVRWE4b0JlRWlPb3NU?=
 =?utf-8?B?M3lTaWhwU2NMNlFCdGZpbUZNQUxXdklBNjdLa1l0MWpIWE13dldiR0phUTdq?=
 =?utf-8?B?SlpFdjZWVkVkejlNNWdiZ0JtdHE5VHMwTjdBT2poRW1hb2NjRHlndmg1ZVFl?=
 =?utf-8?B?UDNzV1J2NWtidjV0cS9ZeFhuVVA2OTdtUWpVWlpFTGRhMFNvcEwyN0RheDJR?=
 =?utf-8?B?aVBJVkFkTi9zUWtsNnRNZXUxMGkvK2h3dm9zenJ6ZHRuSjlTYmNLR1I2anFB?=
 =?utf-8?B?d29pcVJNY0p6R21QU2JuL1RpZmVQTXpDT0N4eXM3RGZudnNId2dEcGMwLzEx?=
 =?utf-8?B?Y2k1cjlkUUZybUNFeVBOZThZb1NjRkQ4SUJybElhZ0picTVzSWtJZHZoUGhO?=
 =?utf-8?B?SStwOWFFWnI4Wm5jUnE5TUVVaXM3dmJkWVRydE56TW9hdGs2ZUpGS29uWmFh?=
 =?utf-8?B?SUprR3ZhdmhHTEN4Z3NlQjl4aTMva1pnQWtaTGNEQkpxenpBTFpDV1luY0lK?=
 =?utf-8?B?aUFjbDI2Z1o5SjNCeW5rellVMG0xbWpSMjNBNENtRXplL3V6dE1ZV0FCQk5D?=
 =?utf-8?B?N0JMd3VscVdXS2FHRi8vYThvb0htbExEQ2VhbEgwcDkwVCtHRW4zd1oxa2tn?=
 =?utf-8?B?Vlk4NThEbzY4dlZrMEVpRlVtb2VnVFY4N1pOdmpPNEJXMnFCdDBPUlVHY0VB?=
 =?utf-8?B?N2xBdkpycDF3OW94cE0rc2x3N2ZhMWM1SCtIMXlxTnlqWmpDdmpuOHY4OURV?=
 =?utf-8?B?b1o3akkyQ0g3eUY0ZENvVDlpUEluNGN4S0RSbXZqMkFCQ0pXRE10U0gwWU1M?=
 =?utf-8?B?UWUvVnpLUlQrRTE0YjFkRzhRQk1UcUpNRVozWFROa0ZsTVg0dzJ0aFlCQUM1?=
 =?utf-8?B?N2dKVU94cmU3L2ZqblNHelYzc0RDNXZhdnY2TCtQYkpxMVlSaHBuVk9iR2lG?=
 =?utf-8?B?dGJpTDZldlh3bmpuQm1tTmhnYWZ2RGRsTkk3ZHFaSHlTTk0xVzhCc21aaWh0?=
 =?utf-8?B?anVQZHUwZlBOdGxUTm5pb0xYWktWT2pxc2htd2tIcU1MVkN4LzI4WjMxYTds?=
 =?utf-8?B?MFZLeDQyVEdnbGFyblhPOG5wZ1lnemhmZ0h0eVFHT3JVQWNHUXZoWEdqNmFk?=
 =?utf-8?Q?K3IBOyMxIlXNYnhguTHyFcHW5Ebnwc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?LzhRaGk3NGlUdXN6aURBTVhxQk1nZDZSZzhkQUFQRjZsblJrbzZtOE9Ub21E?=
 =?utf-8?B?V2lBODJiT1E1azhMZndieXVVczB1RVNKOFB2bWJTSHVtQm1hU0lXYVdSelRy?=
 =?utf-8?B?MDRWUVdtV0tmbFVrRDhUMnRyTng4MjZrci9OVVM4dW5UOTVFMU50UUJDaEgv?=
 =?utf-8?B?cmQwZDlqZ0kwdTNQeGdJdmtKSWVpNGpsS3crWlVibFNKc0pmenJOcVlZOGdx?=
 =?utf-8?B?djJIVUhrOXBlOHUvN0VOY3lVeTdXQkxuTWVVck05dWxuNUZPcFdiYk55Qkg4?=
 =?utf-8?B?Z0ttOFVNRHlUUitackxyd3VTR0hla3BXZ2xXOTYreVEzV25rL2JjbUhEaWlj?=
 =?utf-8?B?Ty9CeFRkaWNOaW1uRnU1N2QyOWJBWENNaTQwZ25BQ2xUMWdpYWZScXNoSVZO?=
 =?utf-8?B?SkRkbXlRYnk4WTNmd0xmdmt1cUo4Z2V4bFYzZ3FZcVJIbmhNdmh2MDE0b0dI?=
 =?utf-8?B?dzdIcUNJZzdvKzVaekNLdllETll2WDhNWmljVjBlY29YWlBmR1B6dnB4OC9w?=
 =?utf-8?B?Wk1ueHpvYWNzVENSMmZwK0hkZ0JMZTBTSis1eGRLRUt0bUUwV0NEWDM5YVZD?=
 =?utf-8?B?NWNOZ0tRRCsyWDZnUys5c0p2ZzRNQUNGNkFqZFRpejU0NTUrbUVsRS9WQTUv?=
 =?utf-8?B?dTRzM1ZoNGFRc0hhSHU4WngrMlFPVUdPRUdLQ01JcW9DL3d3TkJsMjFSb25Q?=
 =?utf-8?B?Z2Q2TDN1THRvUnQ0S3RDTC90UXBEZXZ6bHpvaUJVMjhWdWlPRlFVSjhvZEVX?=
 =?utf-8?B?elRhQkE5VFBydHZhSERleVBDeG0xWEpqQTN6OUQ5Y2l3TGlPa0djanBLTlUz?=
 =?utf-8?B?cjJ0cUlId3VZYnYrSUNpTXorN21DK29lWWQwUjVCbUlZMWovK1JBa0JUSFJE?=
 =?utf-8?B?OE9iM0sxYlpNa3djQWQwSGJnMnZEMmpjZ3NZdFlUdEpGZzZqMW9DbUJZWEw0?=
 =?utf-8?B?RHRSTFNuajZzMnVMdkJzNUlBT0ZGUFpDT0o3eG9LbWdreE94bEM4WlNWMERV?=
 =?utf-8?B?TjliMXJGdHhabHVrZ3U1M0YvQW5MV1puMXdzVGFJSjduVUlUSTRnME1hRnhh?=
 =?utf-8?B?NlpBUzhSZ2JhOW45QjM3U1Z3K1p6WlNPSXJHanlvaXgvRTZOUTY1ckxYaFc2?=
 =?utf-8?B?WXhzZEwxcDEvRE1IWHNhcjZET29JZTYwVXArTTBLekt6akdyQklKSnlYeTJE?=
 =?utf-8?B?aHRxeEp2ejIxaExGT3JxWnFTcHZHYjNsYmJhcUxVQkZMTXlzTXNrRWR6UTR2?=
 =?utf-8?B?OEJWbnhaZGJjWmhpNlZaM0NobzJ0Rkp3Q09kamhlM1NYaHc3SGxnMzdteEN4?=
 =?utf-8?B?dFdSazZvWHpuWHI5dDZlYWs5VUtYRzdZdFNvQlNWVEs2Q2dKMUNpVERqRHVK?=
 =?utf-8?B?UzVMclZGZkw2VWZoZzRWR1RmSXk4aE83c2JvSDNxM3A2NHVJa1kxL1lHWC9R?=
 =?utf-8?B?WEVlQTErUmR2Z2w0MnBzV3pseW5Sdk1oYkNaaHh4QVBKa1paN2F4QS9RbUtC?=
 =?utf-8?B?NmcrdktteXR2dXZjZWsxV2crTnJaRDkvb0tPcjRkcGNxaFFmd2pIVlVhdUxJ?=
 =?utf-8?B?eklaZThmd0FOSklUcmlTWFg1MkRnMHJqaW1SMmdiMTdjdkhWMUhOU3k0U1pn?=
 =?utf-8?B?a1lvRU1kbEZkY2E5OWw4b09UQU9PMEZlc0Rkam9WbTBBaTVCd0xzY1pVL1FD?=
 =?utf-8?B?Q3ZGbW5VRnRkS0ExOEEzTjIycDQ5M2VyeEZ5ejF5SGNVK3hjM3MrVTh0RW14?=
 =?utf-8?B?bldWVmZBZjZnZ0lXZ0FhZy9ReGFNM3hUcVl6R1VDN3YvQ0h6OTZjMFJKQkhk?=
 =?utf-8?B?RFVZZFZObVQwNXJvYUxmVFBaWXBSQ29PMWlGOXZISEw0b2NNdEtXWUdYaktM?=
 =?utf-8?B?NWk5M1pBQ24xYzhLc1B4S0phU1dLb0phZ2FncCtydVRRVWNRUklhQmdBK1Zv?=
 =?utf-8?B?eEp3TFJpSGRVV1FLSFBDanYxUFpWOSs0OXFydEtXTkxYN2NYT2I0LzVObHMr?=
 =?utf-8?B?djc0SUVaT3VTOVIxejRUbGY0eW96SFJCZWRUOC9OTHhqWm9EaXBJZzVVR0tO?=
 =?utf-8?B?ZHFncXpmekI4SXUzMHlLb3g5RFliUm8xMmk4V2tmZ2l1dm5VaWZURTU4dmZS?=
 =?utf-8?Q?j9pLj2YuZnmrt4tbLkfFWtcPm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49057f4a-caa2-439a-a653-08dda4328beb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 13:11:55.8774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MzKirqYBrdzmzOtjAdsCo2PbD2Wiih9XJc9HTLVue/4FnszoXKmIMO5vmOd3iD/A3W5AIHYgHtptL1NwiW0olDREvhnlj8qBBmkPBcsmI2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218015

SGksIG5vdyBJIG5vdGljZWQgdGhhdCBJIHB1dCB0aGUgd3JvbmcgdW5pdCB3aGVuIHJlYWRpbmcg
ZHUgLXMuDQpJdCBpcyBLYnl0ZXMuIFNvIHRoZSBpbmNyZWFzZSBpcyAxOTc2IEtCLCBub3QgMTk3
NiBCeXRlcw0KDQpCZXN0IHJlZ2FyZHMsDQpEYW5pZWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4NCj4gU2Vu
dDogVGh1cnNkYXksIDUgSnVuZSAyMDI1IDE1OjA2DQo+IFRvOiBEYW5pZWwgVHVydWxsIDxkYW5p
ZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc7IFJpY2hhcmQgUHVyZGllDQo+IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB2N10gcGFja2Fn
ZTogZXhwb3J0IGRlYnVnc291cmNlcyBpbg0KPiBQS0dERVNUV09SSyBhcyBqc29uDQo+IA0KPiBP
biA1IEp1biAyMDI1LCBhdCAxMzowMywgRGFuaWVsIFR1cnVsbCB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiA8ZGFuaWVsLnR1cnVsbD1lcmljc3Nvbi5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBJIGNoZWNrZWQgdGhlIHNzdGF0ZSBzaXplLCBhbmQgaXQg
c2xpZ2h0bHkgaW5jcmVhc2UgdXNpbmcgY29yZS1pbWFnZS1mdWxsLWNtZGxpbmU6DQo+ID4gQmVm
b3JlOiAyNDU0ODg0IEINCj4gPiBBZnRlcjogMjQ1Njg2MCBCICgrMTk3NiBCIG9yIDAsMDglKQ0K
PiANCj4gMjAwMCBfYnl0ZXNfIGZvciBhZGRpbmcgYWxsIG9mIHRoZSBzb3VyY2UgaW5mb3JtYXRp
b24gdG8gdGhlIGNvcmUtaW1hZ2UtZnVsbC0NCj4gY21kbGluZSBzc3RhdGU/ICBJIGtub3cgenN0
ZCBpcyBnb29kIGJ1dCB0aGF0IHNlZW1zIGEgbGl0dGxlIGxvdz8NCj4gDQo+IFJvc3MNCg==


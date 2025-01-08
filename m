Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41585E77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:09:52 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.62])
 by mx.groups.io with SMTP id smtpd.web11.21866.1736348987714141261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=luv99Xql;
 spf=pass (domain: arm.com, ip: 40.107.104.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFyA683vCmuWXttwbWYK2o5SJyGiGW+a4L3J7up+vqBsiUE3dZ8pD62xfo/9OxtWQC1IeUQnNFm3uMX0aswduESNvFeI4vlpoWqwMCe46f/+T40BPVdnNhsscSfFYUWrYmeDHqpr11JjHtse0HsLxzOAtPgf0urDsrdGsyy/ed6I/HXMjuynRdv6R4OkON6MyWvF4A96LDMjkTXdSGeNArmO8hyvRIFws8m11bn5AFzRz0MBTIFyirpo/aCCbbb72+qMAzLEnemx9GCHlHpQ3xupSHyLFUHgxEfSuhmOG5fkQ6APjewZ6zmcdMcRzzO8t9xNmGkQ2KSrVo1zZqEXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqYNKq9heK+yRa37urMsuecIf2sLl4D0qrZGotVI5jY=;
 b=gyaIvt+FAb6sLmwakACC1iA0/d+ZsBnVpwUD5VuFz2Hz3qa1A4utJhrHvl84riyaZhPxbmIhvDVCk6lIAjBZyqDjergLc+ZAEhUaz1YfJ0wf7poV1/GTIX+C2aYFcZWnGrmcR3gizFj2mMeGjZpi47t25xEWx6XdPrNV2RSQkp2DyEg5v9VMfWXi356gmYJezQ1mZiAqw+iwtnOFPjN+uyMU/QfhP7gJJUURnW0wVJqiFis46tsMc9qiNVNTjUiKugQW+JQXLMJlSxbaLajiFfkn0gl/wpaJx9gnVXg6XXzFezON2oTCHbMzJnigHnBDoL1liWZvqY6WELFaJEXGzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqYNKq9heK+yRa37urMsuecIf2sLl4D0qrZGotVI5jY=;
 b=luv99XqlIMtJmobO0FqJzIBGM1qhJQxCRye04G7GmyAsWydT2Wy/e+7Lp9Z8/uAwL6yvq17dqhHAZApv6bJe1An0SySDE4nJPK3hOaJ2KEEH5woH261d+FmTW3g99D/F5VXYvbGsoaXg1H1+RYDIXzCmtt9wd4lZYQY01BNmEUQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB10422.eurprd08.prod.outlook.com (2603:10a6:150:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 15:09:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 15:09:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] icu: fix buildpaths QA error occasionally
Thread-Topic: [OE-core] [PATCH] icu: fix buildpaths QA error occasionally
Thread-Index: AQHbWrWi7OU7L/77xUGR5Gu0SmfZlLMNCTqA
Date: Wed, 8 Jan 2025 15:09:44 +0000
Message-ID: <BFE843A5-EDCD-4582-9D74-102B011E5753@arm.com>
References: <20241230122314.1835719-1-hongxu.jia@windriver.com>
In-Reply-To: <20241230122314.1835719-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|GV1PR08MB10422:EE_
x-ms-office365-filtering-correlation-id: 7dece543-0b5f-4aa1-71e0-08dd2ff67bc6
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Q3IwQzdORW1HeEdLaUtJaW9HcXIxZFBTMDdxY2s1Ti93Rlo5a1RUbzh0U3BZ?=
 =?utf-8?B?NnBHanZOYTYxcTV2dTQ2TUoxOTRWckpvMWVaVjU4THE5akZpOS9PMzhPZEdB?=
 =?utf-8?B?WGt1YUQ0dG54eVE0TThMZ2VQY2tMUVZqNGVoZGJ6SzJFMDBIdWZUTy8wUmlt?=
 =?utf-8?B?Syt2dndZSDBsRnBrMXRlVHBGNndCOUpmOE1CcSt6MFZheE8weWZaWFZLWUhZ?=
 =?utf-8?B?RGtLZHZMMlE3VEZUZldHYnB1M2VZTXArUGx3dzFwS3ljYmYyLzJjc2tqbzc2?=
 =?utf-8?B?YWxBY2REWlBicjZNYnUxQWhvZ3I3ZkczeUY5SDJUeHRjSTVJdGNJVjdJM1pS?=
 =?utf-8?B?ZkU5ajRhM2kwVko0dzJOKzlwcjAvOEFKNlVucHFadm9Kb2NJb1ZETXBoSUVE?=
 =?utf-8?B?TzBXZU1qdmZhYThUTm1sVDBYK2ROSHBiTkJFVHNIWjlVT3h1S3JXUzQxZWVt?=
 =?utf-8?B?T25yeldxYm5SOEFUNWtKS2RIRExiaE1iU0MrOVcvNGlkbFBlNHN3VlpUOVBV?=
 =?utf-8?B?aTlHRFdqS3ZwUlgwUzV3Mzllem5KaURNdSt4anFLMEp1Z1BQWmljYWdHYU1v?=
 =?utf-8?B?cjAwWngydUJYNmpYOHB6ZTU5QmFjRThzRnRwUE5xRVpwK2ZoWTJ2SUpPNWRN?=
 =?utf-8?B?SkRJcDlmZDFYUUVoZThEa2dtOFNGQmwwbkN1ZVJ4ZkxkS3JhS2ZlUStlVFhO?=
 =?utf-8?B?OGdhMjV6c3h1YkVFUmhHSlFsa1dIblpYNjZOaFBJNm1XUnRKMFgxa2d3U1Rx?=
 =?utf-8?B?SGlNamdYcXlhQWlMb2hvWTZTNkNTWElaQzF1NHJKQ25YOThRMFJHNWFZUDQ3?=
 =?utf-8?B?QUttWEJId3FLUS9aNUI2eTRkdmZNbFFhUkliamNQei9XRmNaeWpLRXk5bk90?=
 =?utf-8?B?OW0ra0tqVlo3c2hzbEpBN21IMkg2SnR2dHlXVThFckd1S0wvNXU2M2RVY1kz?=
 =?utf-8?B?TGtCZEpOdTFncFZmNHNYRWVLbmlBTjJ1OEJMTEZ0Zm8wMEd3bGl1OGxvVHB3?=
 =?utf-8?B?MXN2eHlIMjRQRXVqNjdYdi9McFNIcit6MHhsMTN3Qm5PS3FyRlJ0QmdtYXl1?=
 =?utf-8?B?Q09TZitOa2hhelcyMVRoUDIyM0lzdXRmYkYrU2pxM0hUOGZmUElyL0NKSmE2?=
 =?utf-8?B?SFo5Nit4SVFxVkpSM1piNW1KNS9DT1ErVWJJaDIwUTBVbHpGZHRWemErblRS?=
 =?utf-8?B?d2V5bFhCVXZZZ1Q3TkgzRnRxVWg3SW8ydU1STXk1SGZ2SkViUUFEYllqSWQ0?=
 =?utf-8?B?MG90cDB0RXRkQm9kcjUrU3R2MDhsZlBOeEtFdkVHRE5kTW9TdFp2S28rTDNL?=
 =?utf-8?B?bEFLQ1RHcEdaMWdJRUVLMEVrNHVxZ0t1aHMxSDgwV0pGNktreEEwTms0QVEy?=
 =?utf-8?B?Z29vWFhtY1Jtb2c2ckUyUUZpb2t1MEU2M2FobmpwT3lodGdQUmt6Yzg0ZXFV?=
 =?utf-8?B?SFE5bmJURy9vaFo5Wk1GbFhqQkdvL1FJNXRPbjFwZVMyV0dMSTl1RkpZTEVr?=
 =?utf-8?B?Z094SnU5TTErdzJvQmJOVXdsSWI1UEtkZUZ6cFllMzZzOTEyMnF3MmNodEJD?=
 =?utf-8?B?b0hWMEVRZ1FLK3Rsck1Kc0J0aktSZnJWSjVqeDNORVg1S2dnUDMybUVtTkpK?=
 =?utf-8?B?eGtmMG1CRU05MWJ1NHgrYUFqUmowVS80THFqSWYzdktSbzQ1THovZG9jaXZ4?=
 =?utf-8?B?V095cFJKVjBaNmhCWW9uUHVQelI2TlozdHJVZm9DTkNTaldyVGZFYzNWR3Q0?=
 =?utf-8?B?WkZJMjlsR0ExV2l0WHAzMWEva1Z4VUEvOVhMZFdCaHQ4c2N4dmtJTzV5MWxT?=
 =?utf-8?B?THdCUC9keDFZOUtGQ2VpVlZ3UEp2Z2NSWFg3bkhZQmdUejRXVlJFamJmazNQ?=
 =?utf-8?B?UXR6NFVMN2Rxc0tMZGsvZ0JDNzFtZHVFUSswYUJhVzJCOExmT1pBQXBuQlFj?=
 =?utf-8?Q?4nvC/etH0r90AOB7qXxhPx5U3MA5/wGq?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aGJpb01aKzVCNVhiWlRMczR2STUxVU9QY3dBdlZweUxpOTRHTUxjU1JwcXV3?=
 =?utf-8?B?Z2V4WVAwN3JsTUE0N3drcS94QVlCa1JvK0ZOcTVwRVNOSnRGZWFTUWc5SmZ1?=
 =?utf-8?B?RFRNT0VIVnZnc3c2RHhNb3ZmeDdIcmozVytKTzFLREdLa0RPam5uR2g2ci9B?=
 =?utf-8?B?Z3pHS0dqWCtuWnV4dyt6ajZvSUhrbUVoWlY2ZjRkd2MyN1h1U3JubDJHU1ZW?=
 =?utf-8?B?UFRnamQ2Q2lYbmxwcEFzb1JlbGxZNlduT2NSZFJtOHo5NGNzTWxoWkFWVzZM?=
 =?utf-8?B?Ritnc2tzUWtkMGpIbFYvZGYrcXg0M1NwR2RRYVJlSTBSWWN4QTlwZUM2OTB2?=
 =?utf-8?B?OWNjV2lucUFreDNPT291M0FOQyszaGVCa2V2b096bzV2VXYvTEwvK1pRNEMr?=
 =?utf-8?B?N0VxdERrNGd0UDQySkpiNXV2blFWdXVsNzJxSjRKakpsRzh3SEREaER2QnFN?=
 =?utf-8?B?Y2FwQXZQRXpZSnhoWllxYnQ3SWJtL25VRHA1TGc4SnlzNjVUT0thdUErWFFx?=
 =?utf-8?B?SDNrT1pIS2tTSVZlU2FLa25yM1N4Mmo1WFZCTHVGMFdtRmVXQVlhcmRaN3E3?=
 =?utf-8?B?VmFpZDRFVnBraVhlRHcySG56eHRRNWtoWnZaNEN1cDlrcSthSEYwUmxiV2U2?=
 =?utf-8?B?ZFYwU00wUEh0amFpR3hhK0RSbXFVS3pKNFA1ZTJBSEdybTVyVS80dWMyTUpI?=
 =?utf-8?B?MUwvbEdOVWQwNVNLRERmVVBNcGFpeWI0Wkh6YURKeXpLc3BicWRNanZWNytD?=
 =?utf-8?B?QVdZcmlmaGNocmRJTFZJcjBxRnNrOUhYTGduNVY4c3k3ZDN5WHVTV3VFYk1T?=
 =?utf-8?B?bXdhOHY1UXQ1M2xoZ053eFZJTDhxVVREUmxhUmMySTBKNHpidXB2QTRtTkth?=
 =?utf-8?B?RGQ4ZUE3M2V5ZkNVemFjeDN6VklkZmZIcW9raHFISVUxc1N3TW5vTlB2R0xh?=
 =?utf-8?B?ZkMzcThnbnR0M2NvSU41b25ETm55cWl4OUppSWNjRFlYVFpYdDJIWGJlQ3JF?=
 =?utf-8?B?L3R5RHlZUTcxMSt2NXpBZkU1UXdMVGF0K3kzU2hNREdvVkV0clBaV3R6Szhs?=
 =?utf-8?B?emJ6VE5IdUx3WDB5U1hSeTV0WkplcCtzWXJRZ2cxWUJ0T3JzcU5Sbko1dERL?=
 =?utf-8?B?RlAzWndueGlSTzFpbTBYV3FsNmRDQk1nNlArRG9aNWF4eVZhSVJmUnJXVjdM?=
 =?utf-8?B?bEV3ZHFZZUxxMnl2U3Q3bVR4cGhjSytTN3ZrTGo0WkhHakw4cG9FWEJkc2th?=
 =?utf-8?B?T2JZQVlYSVVHRTl0QlF4OEZYQVZtTG1RSjRDbVpHMTlNeis0YWZ0VVpQQm94?=
 =?utf-8?B?VHIvL3AzZnl1bVpaQVFMa3ZjdzI3NENDbHNyYldPV01LQ0dRSk5pRGR1REhG?=
 =?utf-8?B?TVlpZkI0RVFWaE5ZOW5Cdkd4b1NJTjl3VkwwZ2t6N2dvQTJHZ2ZVL3QvLzFm?=
 =?utf-8?B?NHNmckJLYU1xZXFBa0U5eWtRRDhHVzdNbnEwVklzZlU3WUpWd3dWYU5LRlBs?=
 =?utf-8?B?Q0lIMkg5Ymdyd0IwYlJoazRhZjJmSDBSbHk4ajZVSEVLOXVPYjNZUjVWejQ2?=
 =?utf-8?B?U1A0ckdndDdOWHBpZVRTT0Y0R2U1Mi83MHUzaWQ1S3lkd0U5aWZkU01aR1d4?=
 =?utf-8?B?TnRLM1huNG5JMkhMMW9xU2tnM3hVZXBnRXNQdFVWUUJxWFhNZVAyb0FLSWs5?=
 =?utf-8?B?dUQ0TU00dm5ydFY3bjFBT3FlQXpMSjFGblRNVG9zYW1xRnV4Zys4c2tDSjR1?=
 =?utf-8?B?RUd1dXl6Y2NqR25SR1BhemEyV3hCUXhvZ3BwdHZMVE1qZnc2K3ErZ1ptdkxI?=
 =?utf-8?B?S1RSSmF6N1IrTzRZYmVuT0lmajhYbjdiM2ttVTg5enFnTWMvemRxY2U2Z1Zq?=
 =?utf-8?B?QmlZVlJ2MXJPRkdVRFJOaEdaOHZOeFJBcExoM2gyU3Uxc3oycjBXWmxLWGt2?=
 =?utf-8?B?TW9JMW9yQzBRUzVnei9TbEt3bUphOCtJSDVVMWpwcXk2aHRZSWZhNGFWK2o1?=
 =?utf-8?B?SGRtVEFHWWNHMkdndlVoYk1IM08rRCtNQVBKQzMzOWsvcDVJcW1BNEdVaElY?=
 =?utf-8?B?alpoWkw2bjVRYkh6djdYejlMVHBCQ1BxSUxqRjFzaTIvck10OW94elhZOTJP?=
 =?utf-8?Q?sNvlzEjLF4UUcBVOcuXGIvQlE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DD325361B3F5342852B6F71A30FA809@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dece543-0b5f-4aa1-71e0-08dd2ff67bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 15:09:44.1279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4fDfS1um19kYuXVO0RqDjrJuHBfuTIR3O3gEGBbsB+FvfIMWGi/4bTk7CVABtf+Qd3wTU1Af5YSuqAYdvhQnFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10422
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209563

T24gMzAgRGVjIDIwMjQsIGF0IDEyOjIzLCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiAkIGJpdGJha2UgaWN1DQo+IC4uLg0KPiBFUlJPUjogUUEgSXNzdWU6IEZp
bGUgL3Vzci9saWI2NC9pY3UvNzYuMS9wa2dkYXRhLmluYyBpbiBwYWNrYWdlIGljdS1kZXYgY29u
dGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUiBbYnVpbGRwYXRoc10NCg0KVGhlIGF1dG9idWlsZGVy
IChvciBhbnlvbmUgZWxzZSB0aGF0IEnigJltIGF3YXJlIG9mKSBuZXZlciBzZWVuIHRoaXMsIHNv
IHdoYXQgaXMgdGhlIHRyaWdnZXIgdG8gY2F1c2UgaXQgdG8gaGFwcGVuPyAgSWYgaXQgd2FzIGEg
bm9uLWRldGVybWluaXN0aWMgaXNzdWUgDQoNCllvdSBzYXkgdGhlIGluc3RhbGxlZCBmaWxlIGNv
bnRhaW5zIHRoaXM6DQoNCklOU1RBTExfQ01EPXBhdGgtdG8tYnVpbGQvdG1wL3dvcmsvY29yZWk3
LTY0LXdycy1saW51eC9pY3UvNzYtMS9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9pbnN0
YWxsIC1jDQoNClRoaXMgd291bGQgYWxzbyBjYXVzZSByZXByb2R1Y2libGUgZmFpbHVyZXMgaW4g
dGhlIHRlc3RpbmcsIHdoaWNoIHdl4oCZdmUgYWxzbyBuZXZlciBzZWVuIG9uIHRoZSBBQi4NCg0K
U28gZWl0aGVyIHlvdeKAmXJlIGV4ZXJjaXNpbmcgYSBjb2RlcGF0aCB0aGF0IHRoZSBBQiAob3Ig
bW9zdCBvdGhlcnMpIG5ldmVyIHRvdWNoLCBvciBzb21ldGhpbmcgdmVyeSBvZGQgaXMgaGFwcGVu
aW5nLg0KDQo+ICtFWFRSQV9PRUNPTkY6YXBwZW5kID0gIiBhY19jdl9wYXRoX2luc3RhbGw9JyR7
SE9TVFRPT0xTX0RJUn0vaW5zdGFsbCAtYyciDQoNCkp1c3Qg4oCcaW5zdGFsbCAtY+KAnSB3b3Vs
ZCBsaWtlbHkgd29yayBhbmQgbm90IG5lZWQgYW55IGZ1cnRoZXIgbWFuZ2xpbmcsIGJ1dCB3ZeKA
mWQgd2FudCB0byB1bmRlcnN0YW5kIHdoeSB0aGlzIGlzIG5lZWRlZCBpbiB0aGUgZmlyc3QgcGxh
Y2UuDQoNClJvc3MNCg0K


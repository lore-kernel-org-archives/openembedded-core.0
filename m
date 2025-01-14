Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BE7E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 17:54:52 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.62])
 by mx.groups.io with SMTP id smtpd.web11.462.1736877290017691881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 09:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FIUi5iGQ;
 spf=pass (domain: arm.com, ip: 40.107.241.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kH2XsQN00dF3+QJ8y0WRltEYIqw68alE3TQd8xkxYZKnpDToHe03TSLCvxMrcr10o0EZY54FnKq/gi3mer2xDCw9j7muw2cB7lVUD9rksxAQ6i36Mc/G8x44dEvfYn8hLjPSq5zSZNR1/4C7+3Q4nO8zCuiVDtDzDiXUVwzb+3BuUJaz7ETwMb54H2SKZFTUfso1aS6bg0Pr08AJFwg9rsOR8kQ3KHdLi0ebiVOJ2N2mwMHdlkSTiHop1Q70IbgqHPQzHerSZgZoX97VwmXBIFTtvELzlNSAkzwEWRhNw3DuaiBbJOPrPkDfXvqZ1369mR/jGeajbr0qAg8eFNCOTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPvPud2NIVsdD5Itc5O00IaAkxM0kWIIKvAYg4eUjFg=;
 b=vjstu5jXx/7to79SIVyTwg6JQlDHCOIEW3MjlVm6P5CJC/U9IVgUcNKBd70FpKMqxKhX2mb/VovRa6y3qehxp9DvktfUNqbRKNxjTvuor8Y+XdzM9ZmCWbH7iO54iXxvCxgJDzCYY6ZyIq7iZj1ATzI1e+GPYJmYKBvUluq9InhOfjMRyItSLUu8X7bYOjLJmwSvefF1Rem5XfoAUC/WeR+kxOhGWibU+daHhQZkNVbWyzTM034cCcxZeRy2h6SKlr0FvsFoZYLWYaNu5Y0MCkKzMnCiIJPeLsv5S3ZAd/GcI2XV86bhL7H+o9uUeItDXzqjcfyElcnWY5E3ejJ4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPvPud2NIVsdD5Itc5O00IaAkxM0kWIIKvAYg4eUjFg=;
 b=FIUi5iGQch1gEa6ynNnUsEc0ye7lZAWwjVOPLpdMwiqh4BQd1WtBxH8pj76WV67pu1EA5KYkn6gXIIVjhZhh1gqALoMXHtSLHxlJBW6fTR9Pn4mIOVGqep6YTvO7TK0HpxBuGzPk7fZxlRjJSmX0qG6vVlPG03JeJVSHC/tLFqQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB10354.eurprd08.prod.outlook.com (2603:10a6:150:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 17:54:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 17:54:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@ygreky.com>
Subject: Re: [OE-core] [PATCH v2][OE-core 4/4] cve-check: allow feed choice
Thread-Topic: [OE-core] [PATCH v2][OE-core 4/4] cve-check: allow feed choice
Thread-Index: AQHbVe5ivAlAKG+0XUiDDI/MZdIYTrMWrt4A
Date: Tue, 14 Jan 2025 17:54:42 +0000
Message-ID: <6703A7E3-30BD-44E9-875C-058BD2EAF58C@arm.com>
References: <20241224102557.9300-1-marta.rybczynska@ygreky.com>
 <20241224102557.9300-5-marta.rybczynska@ygreky.com>
In-Reply-To: <20241224102557.9300-5-marta.rybczynska@ygreky.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|GV2PR08MB10354:EE_
x-ms-office365-filtering-correlation-id: fb80702e-a2c2-48f5-2eac-08dd34c48662
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YzVTZVBYRTBOVyticWRHaE1aWDhrdEZYMnNGcTNaVmw5V0EyWjlPREhBNWNH?=
 =?utf-8?B?UTc1R3dPL3JYQk0remtwWTh6WkJPbFRMemozb1dzcjZyelJzSUpNUS8vS0ZC?=
 =?utf-8?B?OGZRNFRjME14R1FPbWdJYXF6eDkyM3oweXJscnMwc0ZuclVSYk1pdnNYM0h4?=
 =?utf-8?B?Z3E5ak14eVNIZVFlUmVwYXRPcG5Fbjl0Qlo3ZFhXcTVSdFhMakE4OERialhG?=
 =?utf-8?B?L3JVb1pTQjErTjc2bXpBeWxHbXczTEZnRTNIRTV2NVQycHVwSUNlNnhIUHFD?=
 =?utf-8?B?YThJZVo4QkxWR1F3cjJlREw5MDVBQmRmWDJGSnNoNHdoS0w4eFZyZTZUbEx2?=
 =?utf-8?B?Z2NxQko0NXNCL2h5dXUxZ3d5SU41eEpoUmhYRSs2U04zbjIwWThqZ0dsS0xs?=
 =?utf-8?B?c25BNXkzaWhZQ0JFNXdHYzFrbkYvRk5PaVVITnVEUEFPcTZZbnlmSjlzM1k5?=
 =?utf-8?B?dWU1bDRTN29FKzNwYU5XMVkzbmNvUWNoR2s4blgySXorcVFNcDNqb0NETUEz?=
 =?utf-8?B?VUkrckFlOUpIVHk3TTliQTF5WXpXeDRncncwOVlGQVBlbHRIT1NtN2J1aEo1?=
 =?utf-8?B?RGIvMUR3U2ZpdWxId2RBWkY4MkhwNUh6emxmUnp4Snhaa3NiUnlxSDBiTHg5?=
 =?utf-8?B?ajJLSTlkWG1TZnZjdVpxa3RITk5MRFVkc05ZaFZiem5PSW1YYjgveDBrMVBS?=
 =?utf-8?B?RzEva2ZVZnczcVk5Ry9GS1d2bTNRUEp0RE5lbi91TU9XeURpTnRzR3lYQ3BM?=
 =?utf-8?B?YThYdE9yNWN3RjBKUWJ0U0VGK1dMK1VWVXJVWCtUZDYzQTZhVmIxLy9oSHFv?=
 =?utf-8?B?cmhRRVdYMitaME1sa1hVM2s1V1JzL2M1Ui9md2xTcGF0MEs4YStqYkhxRXZC?=
 =?utf-8?B?SElRZ0JCUVVmVG9hSkJZSWRvS000QjdEcmk2dkZoVTVuamdqRGVmQzltaWcr?=
 =?utf-8?B?Zmx4QzZOU1dqdUJsS3Q3MEpXSDJKZ3ZmcXRKRVd4cFhNSVUvRHJyY2lVSjg1?=
 =?utf-8?B?VS9vVSszdXFwRlM3aUpqWno0QWpKSi9lQzdkK3ZOME9XaUtObUxaaW5UQmdt?=
 =?utf-8?B?UkpCWkdEcCtJTVRwbmJhVnNqazRXdVZtUy95cFVieWwzTWZpWWQ3dHh4dFZk?=
 =?utf-8?B?Yyt1aER4RHZQWnZ5b3BsOW4vTk5HakxzNXdEVmhlQm1nNFBDUU1EWnFUbzFI?=
 =?utf-8?B?cHEwTjg0ZGRzNEhaOG9MbXZhV3ZpSjBQRzUvUnlaQzJRRUQzRFZKOTliSG9y?=
 =?utf-8?B?bmdOSi8wYW5Da2l0eThZTDQ3OGlPZ04vZnJ0NDFMMXp6dVU3THNLVCtlbVg3?=
 =?utf-8?B?eFVobXg1TEpwT1B5MkpQaExUcW1oVU5Xd3EwTThhbm1sUlpKdUtsbVFRZGU4?=
 =?utf-8?B?N1lLWXlNdUJ4TXc3bTBrSkZLWDRLU3JBbHBwV1lsSG5UYUMxSmZqU05SRE1n?=
 =?utf-8?B?Y2gzRjV3bTNqZytBUTJrYnFDQ2szNVJtYXZlSTRSQjVHQTBhZlVsbUN2NS9P?=
 =?utf-8?B?cndJcVo5a3I1ek5uRjd1SDVuRnlkdE1wV3JWd3VobmZEb21UNEk2OUhDZTdx?=
 =?utf-8?B?bXJGTG8yZFRiQTl4d3BvUzd5U0FhMVVGakRxZlhDcmRYZkw3N2hrRHlhcGlr?=
 =?utf-8?B?a2twMFAyRU02cDhaMWkrRW03dnRFbko3TGs3SmNoc0o3WU9NdDVxdEJ1TXEx?=
 =?utf-8?B?d3dnaWl6S3VrMExuTUlpa1RIYmJ0eWpkakQxSUNlOEwxRHExTjJqTkRlVXB2?=
 =?utf-8?B?Wjc1QVZtU3pjMDlXY3hMekdwVkhQOUZJbVdNdkNSN1R3R01pMkZsYkZmRVhy?=
 =?utf-8?B?NE1nY2wwOVJSckJXcmZNUTN3RjJaWm5wUE5GazRmU1NrQWN5VUZCbDNmYmlm?=
 =?utf-8?B?dE5jMlIyTXhBeUdYWFJ2amREd3E1M2p2Z2FoblRLdkhwMGJacnRiK3V1czVj?=
 =?utf-8?Q?lyEHWWkT5J+8dt39bSnzee4MwTZP0XYG?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V2xOKzlKa1R0WWVCcjlnT2swYWRJMXJHL1dtVEhIUlltSHJWdkp6Vk9pUE85?=
 =?utf-8?B?ZTc0REVBcFpHbURTVkdiUG5UYVhVcnZGTE8vZVZzZnRkdjgzYWZ6MWM1bFFG?=
 =?utf-8?B?WVRGRXdyQVRpVXFVeng2NGZsMXV3ajFhdnN2Q3IvMXZvSkEzWE9ZVDRRWEtO?=
 =?utf-8?B?M0pzYTNkUHIzUWNFQzZuWDlsSS93dVp4NmdQRkxNMmw1YTZzOGw1ZUxWUlRi?=
 =?utf-8?B?djlnUG8zUjk1c3k1Z2pFRzVtc1UvdUpWVGllbFJWdkxoUnpsbU5CRFowQkhN?=
 =?utf-8?B?Z3p1d2hsdG5YVkt6UXNjTGUyTTZsbytyT2JZSSsyUDJEenIyOHZnYldRWjlx?=
 =?utf-8?B?QUxzalRLTXBjUDhOamUvUUlWWW5rWnVyOVV2TlpPSjZWZmxNVmxSekNIZTRD?=
 =?utf-8?B?SXB2Sk14NUx6OTRSak5uZnhZYzByRTJuR0ZGR0VqWExGWGJ3OThIVlhGV2RX?=
 =?utf-8?B?V1d1WGVKbVNodmxUYmNwMUNVc1ExT1pBYzY1Y3RGTTZHemNMV0xCZnpSMEVG?=
 =?utf-8?B?SCswU28zQ3B0NUgyb1FVVWF0UW9qazAzM3FFRTlUTEdDTDV1TFdtTDlLS1A5?=
 =?utf-8?B?NTQrMkVlS0JNZXNFY2piaWdVSjlVRmo0VG43WGh3cjRQcTRMWElCbFdDYnh3?=
 =?utf-8?B?Y0kwK1o1U3lMMzY1ZFB2T3NhOHR3Y0Z0SUk2a2QyOHRXdUtTVUpRS0ZuRnZi?=
 =?utf-8?B?Y2ZmWGpOaFh2ZkJLbk56b0ppRkp1MmErRlZlWVZVZkhnQlEzRjBpNWk1RmpL?=
 =?utf-8?B?b3BHZHVHa2plOExYOVhZUHZFZm1wK2hKcXVhVG9iMEt3elhlTElyVU5BRHEx?=
 =?utf-8?B?Sm9oTmp1dEcwVC96OElYVXZBUnJQQjZPbDQyYzl5cU1Vd0xqMm1IWTJLcVBw?=
 =?utf-8?B?ZVpzUm5CbkR6blJFUEJKdDdnWFZZTStJYlZOTitZelBkOUUwQko2Um03cW14?=
 =?utf-8?B?YktCcHdGY2RQcDB5ZHhZd0sxYkJSUWxaOHNjSkVoUkMrYnNsVFhDcFRYejhh?=
 =?utf-8?B?ajRVdEE4eXBNTDJyckJyd1NLVzN2d1FTL01NN0ZRMHpLNzhoWjVZUVFWdmQw?=
 =?utf-8?B?OXZrTUZ5WVZvWWpPeGJPbjBPdnpSVC9iSlJVZ1Z2Q213b3BPUHFSVmNldUNL?=
 =?utf-8?B?YjFBSFpSNEhEdk90T21MQXNtS2NrOFluOE5NNnNiVlZRYVZMRnhENkhud3ho?=
 =?utf-8?B?ODFuR1UzN2ZvdWlzby9ydFBKdFJuZ2pwSHpwZ3Z3b2JtN3hTVmVFaHdIcFdx?=
 =?utf-8?B?bk1IZHNDeXdqbSt3aURuN1JRYkszQW80cW1IMFlBbFpLN2M2YnlxU3dnMmVv?=
 =?utf-8?B?L0JWNkt6NEFveHc0MXFabkh4cnZEazYyTUZzOG9NYkU2WWI5S2l5dTNsejFS?=
 =?utf-8?B?NjZEcURrNFVUZ1dXTjZGQU94a281VWNDYVFPc1Q2TUN4SlluTWNQcHBjcjlY?=
 =?utf-8?B?VE9wUnJLZWNXTXVXaE5DQ2lZWWFtKzBvVTBmSTBjNnNrc3dFODhxZHRuZUtV?=
 =?utf-8?B?QmNSY1FLOVFuSDV1Y1JZY3RCUHFzMDRPZmNRU1dDUnVIVWNBYXRpTzdjd3pF?=
 =?utf-8?B?YXFqQUJ1RktkeGo1RWtlaEg4dXlKdjl5TUxuaGgweE5NM251ZTlMaEFXeExy?=
 =?utf-8?B?Yi9xRjRNOEljSFRrbnJDU011U3BUR2JXaDhEL0dUMGZ2NnlHcHdSaFBsMWhJ?=
 =?utf-8?B?WmJ4RldaY1Y5RlJoOTFqd2NRL1RMdkJTOElmdllWQndMdGtLOVppUnZZNkZu?=
 =?utf-8?B?My9uRXF0bkhKOHFnbHlPNVZrb1YwcVVmRVo1K1MwSHZwWUw3QThQanJyS3ZF?=
 =?utf-8?B?RFZNcWxVTGlUajBsUW9TMW1mdEh6YzNqMmZnbzhLdk9RR29iUDQ0Nll6MVo5?=
 =?utf-8?B?NlBuTnArTC9DN2tHdUhpamhZUjNUUXBjdWp1dThBRzFCWmp5OGd5c1RlMUZO?=
 =?utf-8?B?U2QydWVGVUtBTjhhWUtTdnQzTmN5OTc0TUxaVXdjR0tuMjJvd0M5RXQwOVVy?=
 =?utf-8?B?eDRuV21UcjRxSkJsZkRWTC9PRG4xVnZ6d2w1Y3RVRElFb1hHSS8xNk1uUlhW?=
 =?utf-8?B?VUU5ZmZtOFNHMVNSdkdYczhZakxWUVhYbmxRQWJsd0tlNmIySXBkK2Urd0NE?=
 =?utf-8?Q?fNbVHyvkI+0hEDFdjAg18E6Ae?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF5955C0CA08744B9DEB40245672868D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb80702e-a2c2-48f5-2eac-08dd34c48662
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 17:54:42.8781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JG2ltxEc5uoeQq5u52lLr6jMATfI6Isv9UzOCQpay9tN/ZUre/uWNMiDhn2bZpKPb4lvCFsndFKd7aSBtjbq7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10354
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 17:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209811

T24gMjQgRGVjIDIwMjQsIGF0IDEwOjI1LCBNYXJ0YSBSeWJjenluc2thIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxyeWJjenluc2thPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCg0KVGhlcmXigJlzIGFuIGluY29uc2lzdGVuY3k6DQoNCj4gU2V0IHRoZSBOVkRf
REJfVkVSU0lPTiB2YXJpYWJsZSB0byBjaG9vc2UgZmVlZDoNCj4gTlZEMiAoZGVmYXVsdCkgLSB0
aGUgTlZEIGZlZWQgd2l0aCBBUEkgdmVyc2lvbiAyDQo+IE5WRDEgLSB0aGUgTlZEIEpTT04gZmVl
ZCAoZGVwcmVjYXRlZCkNCj4gRktJRSAtIHRoZSBGS0lFLUNBRCBmZWVkIHJlY29uc3RydWN0aW9u
DQoNCuKAnE5WRDHigJ0NCg0KPiArIyBQb3NzaWJsZSBkYXRhYmFzZSBzb3VyY2VzOiBOVkQxLCBO
VkQyLCBGS0lFDQo+ICtOVkRfREJfVkVSU0lPTiA/PSAiTlZEMiINCg0K4oCcTlZEMeKAnQ0KDQo+
ICsgICAgaWYgbnZkX2RhdGFiYXNlX3R5cGUgbm90IGluICgiTlZEIiwgIk5WRDIiLCAiRktJReKA
nSk6DQoNCuKAnE5WROKAnQ0KDQpJ4oCZbSB0aGlua2luZyDigJxOVkQx4oCdIHNob3VsZCBiZSB1
c2VkIGV2ZXJ5d2hlcmUuDQoNCklmIHlvdSBzZXQgaXQgYXMgdGhlIGRvY3VtZW50YXRpb24gc2F5
cyB0aGVuIGV2ZXJ5IHJlY2lwZSB0aHJvd3MgYSB3YXJuaW5nLCB3aGljaCBpcyBxdWl0ZSB0aGUg
cGFzdGVib21iLiAgTWlnaHQgYmUgYmV0dGVyIHRvIG1ha2UgaXQgYmIuZmF0YWwoKSBhbmQgdGVs
bCB0aGUgdXNlciB0byBmaXggdGhlaXIgdHlwbz8NCg0KUm9zcw==


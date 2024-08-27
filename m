Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E9CC54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 12:50:12 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.82])
 by mx.groups.io with SMTP id smtpd.web10.77621.1724763011775181944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 05:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=rsYy4FI1;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.104.82, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGEfJY4EDlDaqB3xfWDeRkwiOn0gNIEEn8N3ilHotQaq2nvYRimXKKGvHoHgMaOazrDl2n4+EDXczHt1Z1PHmuPad6F1z8ol2SoDnNyY4K+EcM2MMxGPVSVjsUpuPWbCBvWP5/ca2ZSW2VwTn9lRW5AWYmL85wTTQiywZvo6uDiCLB3Rieh7BpZj+r6IVFfHGzp6BBv4yctxGDG+FzgZS9XsrLvXAGgswQaPQWLN1OSVd5usOnBCX2mzxD39TwLuI/rG8PbWZMRroLQoU8r1OHyo7BgfGQkL2KSNGvEkTRlR/EHMTbUbp7HnTqBy04OSWVqFkje4sj8rKOHOMagzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gQYz8+JRv3rG/rk+pmvEohhCgQvK+cFz+zLhc4KYoQ=;
 b=WgVRASFXMxYFc0XDnV3Fg018+KrHqhnFVl8vfeXJXuJ3GattxpejyFIoOZPE76YeDpNYeNv4LDbuBQaYGBvSiMi2KcC3qIOOzJvFsx565Sp5aX1ovg/GjikN90haHkZ33RQnR3SGoREvj51rTdcE9FEm+YGplYj7dVl139oyeFluli7USB5l4JlkouX8bkiJ6Pex1BDEFrJzu3w3remiPQaSPdDuw2mIm0wiYGHjnWYdZi2mTiuwfBia2Hv4KUBn+QSHjlsts4/ZaEn6gAZvzrID5FNIx9lUWrk0+2kUYTMLzQ65BNfEB0BAI+5eQL2d4EmPGhPkzWpRZv5gOLeNgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gQYz8+JRv3rG/rk+pmvEohhCgQvK+cFz+zLhc4KYoQ=;
 b=rsYy4FI1FKNj8u8lGQwroE0g0dL6trQYW7SKUpHxD/e3DpVyDNuGHXlwlsCOELVLQZSodHK6DQzr27oqoWwo5YJrThBIKYT6FrWF6EL/ap9Wh9aljiw3FinSV0O0kuZNCfEt0/iguWxLdvJOM9Llt4Dw9HRflXCfsFA7aCtIggfS4kQ53ybNKf56lnn6nnHFjE8d/lZLpAUsynL+iuDZf+fm8BNnPm3zbFfNdQ+rZj59FHloFC1mjE+QopH1sOx+wMKQoxQrLpLR2A4rFKsA1otpBDzUGBBD1qR1SXpqwEbFYafNfnXlBToz5LSTCtmz+aXzg43SGisKoimFRLDuKw==
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AS8P193MB1207.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:33b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 12:50:07 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 12:50:07 +0000
From: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
To: Steve Sakoman <steve@sakoman.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 1/2] buildhistory: fix package output folder
 creation
Thread-Topic: [OE-core] [PATCH v2 1/2] buildhistory: fix package output folder
 creation
Thread-Index: AQHa6ACN8leefanhmE6uJqea3DXRkrIb9HuAgAANigCACN0PgIAARCWAgBYDyqA=
Date: Tue, 27 Aug 2024 12:50:07 +0000
Message-ID: 
 <AM8P193MB09007D00E8018039DD5FC6A1C7942@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
References: 
 <ebbbb5b1cfa0dc87360a1d72db7bf009c7264dfb.camel@linuxfoundation.org>
 <864.1723536321789931548@lists.openembedded.org>
 <CAOSpxdaqBx5GMDe2-YJc2z_KA0VuBpv-aqP+Zt=XFa6p-XE9qQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdaqBx5GMDe2-YJc2z_KA0VuBpv-aqP+Zt=XFa6p-XE9qQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8P193MB0900:EE_|AS8P193MB1207:EE_
x-ms-office365-filtering-correlation-id: 5da6e86c-35cf-4078-c148-08dcc696c7c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Mzk5SkxuUUd3Vk15T1hPVDJZZG9zQUJyam1KYzRyb2tiWFg1ajZTblBRNlZw?=
 =?utf-8?B?WGFmd25wdGhwdTJKK1lJdFJXMzdaUHM4UUpxYUkyaU9VSXhMV1VZNTIvYkw2?=
 =?utf-8?B?NEpxMlZnTE03RDgrbzVMdjBvaFBLcFlqUGxPTWVkcTBKM3FlejZTZWdZODd3?=
 =?utf-8?B?NVBnYU0zejN5TU1WMkplNW8xaHVQQ09oeGQ4T3MrTFU1aTRDWmtQN1RCRHZw?=
 =?utf-8?B?SkJBZnlmOHA4bnhOZnBFNno0eFExYmlQU1BzeG5DUHZNWFk0ZnRSSXN4ZnFU?=
 =?utf-8?B?UlRmeHI5ME95Y3FVVUE4NHN2WnI5R0FpMnh2WnhCQ2NUS3cyUnlSUjdORnl2?=
 =?utf-8?B?OVNDOFVyTWtOREpQeWNDZjQvUXhrdnR0VHk2SFRZRWpxZXFVT3M3ZjlGc1hw?=
 =?utf-8?B?YnlVTUJoOUoyWVZROWJVcDZOTW5Iem9saUZrK1M4VGpnUE9VME84Zk8ydk16?=
 =?utf-8?B?Q0VSNFg0QUg5cUt3UkdyZEdEbFF4YStZT2JpZ0htYjVoQjk0YW5YYXEzTWZ6?=
 =?utf-8?B?WWdaYnJOejhTZEpFdmdjeFdiZi83aU9YS3NaUXVDb2tnYVU1WWRkMGJFSU9Q?=
 =?utf-8?B?NkRiNk55ZGFpUXhHMGQ3NjZyMkhZSEttckJ2TzA5d2xiNFVJMGg0UWFPYTNn?=
 =?utf-8?B?M0dEbjMzK2JMUWtwbjAvM09YeVRMbWdUTkNtZXUvZzg2OGtRTHlHOXBPZDhI?=
 =?utf-8?B?S2NvckhSaHpUZGgxT1pxUTZ1VWdRemJmZXZEbGpURm8vL3hkaHhNN2JtTGQ5?=
 =?utf-8?B?TUI3L2ZRUFpwa3BvWExjMEZueWd4WEY2TW1MMm1IQUJsMCs2bkllKzZzVXlk?=
 =?utf-8?B?YlUrMnlIRGs1M3VNTk5IdlVNc3RLalFoeWxWbEpPQ25GemxZWWZRZ3pXT3c1?=
 =?utf-8?B?bmlDVjJlUnlBbUNhb1M3RXVhRUlIZ0J5WDNsOHJIQjVrWklBVzFnTHlUazFQ?=
 =?utf-8?B?M3I0c0Fhd1hSRDVlWE43ZlNNa255eGpXUnpTZHhwK3o4bUhrMnVmVjYrN1FE?=
 =?utf-8?B?QUsrWDhuT2ZiZDgxRGJWVXpxckluc2RoYTZEVHNEMFJ2ZWszN1EyT1RjY0dO?=
 =?utf-8?B?UW8yNlFoUFZ3Z0NNMTErMW1LeUNjbzdrc3dyRVYxRTJRS0UvR3NWM0pNYk1s?=
 =?utf-8?B?blJ1RFN0NlRvL1owbGpteVJ1azJ0dHlZbzk5SHVabXNMbDBhRFZSd3ZMZWdZ?=
 =?utf-8?B?WXJCaW5wVFo4cDQ1Sk5UYTA4d2tpNzdlTzJsOXduOU9hSG1iNWt6aS9RU0N1?=
 =?utf-8?B?QWtkaWhaeHdSNm1XY1V6NmtlNVF1RUFuK0NNNzdmdHZWb1NRWGNvRVU2K3ph?=
 =?utf-8?B?MFQrOU1saTRPYW9ORGc1VlFyU0syVXEvR21ndVpoMzBSb1Vvd0JMMk5vajJ5?=
 =?utf-8?B?Qzlrc0trQWlhVnorRUVhUy9sRmw2UXZ3YTZXbkd1QjQ1SUZjdmZmWTBrbUlp?=
 =?utf-8?B?ZUlObHdPZE0rRzN3QUNPck5UaE5RdlB5YjNZcHdwVVErbGk4N05sa2NpSW5R?=
 =?utf-8?B?a1lUeXlTZlBzUmh4M3JIQ2lKdlpQN2NmT3lSSm42N0JJYnYxa1Z6QVlsTWRt?=
 =?utf-8?B?WVdudjY4Tm5sdkE1dWtuNHRHaDE0OGQ5Zjc0cmlJYkNCT1Z1cWdmTElJT0lM?=
 =?utf-8?B?ckFNWVZnMkdiNjVnS2FDcUtDYzllajB2VUdJdzhuLytBM0llTk9VOXhnTlhT?=
 =?utf-8?B?YWJndmF0VEVJeTJUbEE5UG1PU3R1YlVyS2JGc0hTQjkrMUhxcjNEYlNxOFZT?=
 =?utf-8?B?MmZIZEdDVmpvNlJneWhacWl3WTN4OXVzSGFmWFpCUWw3VnhzRjhuZmlNMmpM?=
 =?utf-8?Q?JxuALEhv2tUwfL2uRGIJ+RldM5Vx6VXbUXUqE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K2Fsak1RQytGajNsbWxHd2puL004TlFKdmpXTHdPWFM5cUtzZERNL1lLVHky?=
 =?utf-8?B?bWhyaVFRQUJST0gxaFhXU0UyK0N2ajVDbmcyVjZUdjJIQjB1N1NHL2FPTUdV?=
 =?utf-8?B?N0x1M0pMQVdxV1ZKYjF1bmJ6R3FOSUZjRWlCNlNuMmJUcGRUbWhYaTJjWjdi?=
 =?utf-8?B?cDBTVjd6dk5nenA3UXZYaFFsTkd4WThtSkIyd0NQeWRKVEFPRFRUUUJhWWo1?=
 =?utf-8?B?dHRlcXNEZ3h0NVo0and1UkRJZXQ1S2h4RGFEaGxuekdPazdyWnVrUkdvdit6?=
 =?utf-8?B?aHZTbjh6ZVp0aFMrRVRGbEpRVThqU2s4MEJBOTUzSm5JN1RtOUViUXFlUUVi?=
 =?utf-8?B?akJmNFhqQlhzL28zSDQ3bzN2K214MU1PVWtucS9NSFZoZ3FqQUxhT2JoMk16?=
 =?utf-8?B?Q2hGT1JTUFgvaHcvUHhNdnpzdmNDeFJjd2djdmZDSUhXNWdLU0RoWCtDZzBM?=
 =?utf-8?B?Z3F2c3JjM3hNOFEycUUxLzhaTHkxZG1KbkZLTGwyZjEwMDJ2MFM3Y0YrVzc1?=
 =?utf-8?B?VndVYTVsYm45MWJkcDl0TUp0WnNjNlU2bXdCMkhleEIxcnVkU3B1R01qelg1?=
 =?utf-8?B?eEpBOE9QaUZPSUtPT0J3NEhTbmtyTmZyZG9jelNEekFDeUt0THB4OVV4V2Qv?=
 =?utf-8?B?a0VUV2NyYlBFNVpDaTFycy9TeGpvLzR0M2FyNmpMenpMMUVBUFdjV2ozYm1N?=
 =?utf-8?B?Mmc3d1JqclNuTjV1VE5ybDc0c0svNFlMRmpNM0dFckJFa3dpZU9DRlRSQzBY?=
 =?utf-8?B?Y3MvN2FlaEdsdzZLL1pkZGhIWnlwZVhicU1MRG5oZGRnQmNQQjhkVUhSaEZH?=
 =?utf-8?B?TG53SS9JNG1nSmoraEwzSEZvK2U1V1JEUFBzdFI5TUZGOGxjVTBkNHNKcTFy?=
 =?utf-8?B?REJ6YVp0QUR3SUQ3eVF2a2hWRXF2WlpqUXZvL3FUVS9uZTlkNUtCMlk3ZUJv?=
 =?utf-8?B?dzJCZEo0WlBHaVVQbzc4QVV5TjMrcUtZMG83cC9MTVM4WndPYlpMaGdBaG5y?=
 =?utf-8?B?YVRvTUV3VGEzUzlHY0VuNzhZdGlxSjV3N2ZqMEVqZEk1aW1URExNRnZPakN1?=
 =?utf-8?B?TG1Fd1BWN05pTEpBeFFHbndndU5hSXBJMjI4WStHaHBDeHk2M2ZiR1NuSXlW?=
 =?utf-8?B?MldyNWJrM3J3b3VoUUpRcUJSc2ZrSmtGL1hoVXNIdExZaWxGSGVBcnlranNs?=
 =?utf-8?B?UjJST0dLaFJmMjVKaER6U3JFaVZENkRBcDdDaWMxU20xNitiOTB6dEdBNnRz?=
 =?utf-8?B?Z0txQUlBaDdOSkd2OE1xYnpmaGRCU0hrOFg3Q1Z4azVxOERQaW9CYm1xTEYx?=
 =?utf-8?B?SlBQY01MbGJSMVB4NkNCSllWUkZPOGNRdHdYTTJmdXg5NzF2YkZHVVBLemNx?=
 =?utf-8?B?ejNxQXBYMTg0REI1ejh1OGI0dCtyNFNsS3MzaFdCRFBSYS9TdVNsVHVtSUhz?=
 =?utf-8?B?YUt4Tk1CcHBIcjUrVzlvTDJVV05ieGphQ0M1eVd0WSsyZ1VwYjZCbUV2alFB?=
 =?utf-8?B?SVZScXJIQlM0QllQZjlUSnJpM0xwQ01OYmhNSjJTVVBxV3JkRTAxVE1rSTA1?=
 =?utf-8?B?SUJsN2xna0JEY0Ztb0hKQ0pONE5aOHlGcC9CUml3QWR1Nkd3WmxJdlRmSmRt?=
 =?utf-8?B?WUpWbUpTWThBcHFBenovZVZPb3AwTS84Mi9QWEFGOUhJcmNudCtNaUcrWTU1?=
 =?utf-8?B?NGFWWGF5UnRydmJjZzI4ZDJISkgyaFJQZ0xHNThBSThEZ2RKVlhId2hXTnF6?=
 =?utf-8?B?NUpEK1E2ZVpuUVcvdWtqUVN0T1lqVkZSUjRuVU5CQzgwSW9IRzZ6R3Q5UDI4?=
 =?utf-8?B?S0t4aytycHkvUzFVdnVPTTRqemo4RGgxY3ZIVVV0SVkvREl6dG5pT1N4eGtG?=
 =?utf-8?B?M1BTS0l3dEx2dVRhdkVudnFSLzFjV05UM0Z0T0JaUEtQQnZxUkRwa0NscWRO?=
 =?utf-8?B?Mm9TTEJsUTFCZlltYTVTdW9NcllydnY5NTVKaUorUFJobDlHZVpsKzNJMHB6?=
 =?utf-8?B?WFBIYmUxZHMwNjZjQ01zR0J3TU1sN1hkVzIxdnlURmFoY3JwZXBzWVRESjNJ?=
 =?utf-8?B?TGZmR2wyVk9MZFNrVjJzeSsyTUV3OWlPSWNkQnNXSW5vOEc5TEJ0MFphWnFE?=
 =?utf-8?B?Wm1MOW1wS3NtNUZ6YnRRa2pJWDZsUjErN2tSUElvOE9rZDlrcjFXRlFaZjhC?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da6e86c-35cf-4078-c148-08dcc696c7c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 12:50:07.8339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WO9oBH21YhNJhi9R0cEjgSCgaTSj8TiqHBNrF4EIlapg/l9bNxuk385GjcV0GJ30YZIWxZvmJghqqs0MW6jBgEtsss53/xNc2V1RewWvgiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB1207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 12:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203840

SGkgU3RldmUgYW5kIFJpY2hhcmQsDQoNCkkgdHJpZWQgdG8gYmFja3BvcnQgbG9jYWxseSBwYXRj
aGVzIFs0XSBhbmQgWzVdIHRvIGtpcmtzdG9uZSBhbmQgc2NhcnRoZ2FwIGJ1dCBpIHJhbiBpbnRv
IHNvbWUgaXNzdWVzIHJlbGF0ZWQgdG8gc3N0YXRlLmJiY2xhc3MuIEFmdGVyIHNvbWUgaW52ZXN0
aWdhdGlvbiBpIHNhdyB0aGF0IGkgd2FzIG1pc3NpbmcgYSBwYXRjaCBkb25lIGJ5IFJpY2hhcmQg
WzNdIGluIHRoZSBjb250ZXh0IG9mIHRoaXMgYnVpbGRoaXN0b3J5IGNoYW5nZSBidXQgYWZ0ZXIg
YXBwbHlpbmcgdGhlIHBhdGNoIFszXSwgZHVlIHRvIHRoZSBgaW50ZXJjZXB0ZnVuY3NgIGxvZ2lj
IGkgcmFuIGludG8gYW4gdW5kZWZpbmVkIHZhcmlhYmxlIChTU1RBVEVfSU5TVERJUikgd2hpbGUg
ZXhlY3V0aW5nIGBiYi51dGlscy5yZW5hbWVgIGhlbHBlciBmdW5jdGlvbi4gQXBwbHlpbmcgcGF0
Y2ggWzFdIGFuZCBbMl0gaW4gY29tYmluYXRpb24gd2l0aCBbM10gLCBbNF0gYW5kIFs1XSBzZWVt
cyB0byBkbyB0aGUgam9iIGJ1dCBpbSBub3QgcmVhbGx5IHN1cmUgaWYgcGF0Y2ggWzFdIGFuZCBb
Ml0gY2FuIGJlIGJhY2twb3J0ZWQgdG8gbHRzIGJyYW5jaGVzIHNpbmNlIHRoZXkgcmVtb3ZlIHNv
bWUgZmVhdHVyZXMvY2xhc3MgdGhhdCBtaWdodCBiZSB1c2VkIGJ5IG90aGVyIGNvbXBvbmVudHMg
dGhhdCBJIGFtIG5vdCBhd2FyZSBvZi4gSSB0ZXN0ZWQgdGhpcyB3aXRoIG5jdXJzZXMgcmVjaXBl
IGFuZCB3aXRoIGNvcmUtaW1hZ2UtbWluaW1hbC4NCg0KMTogc2l0ZWNvbmZpZzogRHJvcCBzaXRl
Y29uZmlnIGNsYXNzL2NvZGUvc3VwcG9ydA0KZjM3NjZkYzAzOGY3YmE5NzgwZGRhZjVlYjhkMjcz
ODVlYTMxZDdkMA0KMjogc3N0YXRlOiBEcm9wIGludGVyY2VwdCBmdW5jdGlvbnMgc3VwcG9ydA0K
Y2ZiZmQwYjJlODllYjcxNzgzYzU1YTFiZTRhN2U2M2U2Y2Q4MmMyZg0KMzogc3N0YXRlL2J1aWxk
aGlzdG9yeTogRml4IHBsYWluZGlycyBoYW5kbGluZyB0byBvY2N1ciBiZWZvcmUgU1NUQVRFUE9T
VElOU1RGVU5DUw0KNjJlZTM0OWNmMTg1MzJkYWM4NzM2NDg4NzUyYzAwZTg5ZGU3OGZjZA0KNDog
YnVpbGRoaXN0b3J5OiBSZXN0b3JpbmcgZmlsZXMgZnJvbSBwcmVzZXJ2ZSBsaXN0DQo5ZjY4YTQ1
YWEyMzhhZTVmY2RmYWNhNzFiYTBlNzAxNWU5Y2I3MjBlDQo1OiBidWlsZGhpc3Rvcnk6IEZpeCBp
bnRlcm1pdHRlbnQgcGFja2FnZSBmaWxlIGxpc3QgY3JlYXRpb24NCjhkZTliOGMxZTE5OTg5NmI5
YTdiYzVlZDY0OTY3YzZiZmJmODRiZWENCg0KTXkgYmVzdCByZWdhcmRzLA0KDQpQZWRybw0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogU3RldmUgU2Frb21hbiA8c3RldmVAc2Fr
b21hbi5jb20+DQpTZW50OiBUdWVzZGF5LCBBdWd1c3QgMTMsIDIwMjQgMTowOSBQTQ0KVG86IFBl
ZHJvIFNpbHZhIEZlcnJlaXJhIDxQZWRyby5TaWx2YS5GZXJyZWlyYUBjcml0aWNhbHRlY2h3b3Jr
cy5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjIgMS8yXSBidWlsZGhpc3Rvcnk6IGZpeCBwYWNr
YWdlIG91dHB1dCBmb2xkZXIgY3JlYXRpb24NCg0KTm90aWNlOiBUaGlzIGUtbWFpbCBoYXMgb3Jp
Z2luYXRlZCBmcm9tIGFuIGV4dGVybmFsIGVtYWlsIHNlcnZpY2UsIHNvIGRvIG5vdCBjbGljayBv
biBhbnkgbGlua3MsIG5vciBvcGVuIGFueSBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgd2hv
IHRoZSBzZW5kZXIgaXMgYW5kIGFyZSBzdXJlIHRoZSBjb250ZW50IGlzIHNlY3VyZS4NCg0KDQoN
Ck9uIFR1ZSwgQXVnIDEzLCAyMDI0IGF0IDE6MDXigK9BTSBQZWRybyBGZXJyZWlyYSB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8cGVkcm8uc2lsdmEuZmVycmVpcmE9Y3JpdGljYWx0ZWNod29y
a3MuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQp3cm90ZToNCj4NCj4gSXMgaXQgcG9zc2li
bGUvZmVhc2libGUgdG8gYmFja3BvcnQgdGhpcyBjaGFuZ2UgdG8gTFRTIGJyYW5jaGVzDQoNClBs
ZWFzZSBzZW5kIHBhdGNoZXMgZm9yIGtpcmtzdG9uZSBhbmQgc2NhcnRoZ2FwIGFuZCBJIHdpbGwg
YWRkIHRoZW0gdG8gbXkgdGVzdCBxdWV1ZS4NCg0KSSBzZWUgdGhhdCB0aGlzIHJlc3VsdGVkIGlu
IHNvbWUgYnJlYWthZ2UgaW4gdGhlIG1hc3RlciBicmFuY2gsIHNvIHlvdSBzaG91bGQgYWxzbyBp
bmNsdWRlIHBhdGNoZXMgZm9yIGFueSBvZS1jb3JlIGJyZWFrYWdlLg0KDQpUaGFua3MhDQoNClN0
ZXZlDQoNCj4gVGhhbmsgeW91LA0KPg0KPiBQZWRybyBGZXJyZWlyYQ0KPg0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMDMyNTgpOg0KPiBodHRwczovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIwMzI1OA0K
PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDc3
NTAwOTEvMzYyMDYwMQ0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gW3N0ZXZlQHNha29tYW4uY29t
XQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPg0KVGhlIGluZm9ybWF0aW9uIGluIHRoaXMg
Y29tbXVuaWNhdGlvbiBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgbGVnYWxseSBwcml2aWxl
Z2VkIGluZm9ybWF0aW9uLiBJdCBpcyBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhl
IGluZGl2aWR1YWwgb3IgZW50aXR5IGl0IGFkZHJlc3NlcyBhbmQgb3RoZXJzIGF1dGhvcml6ZWQg
dG8gcmVjZWl2ZSBpdC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50LCB5b3Ug
YXJlIGhlcmVieSBub3RpZmllZCB0aGF0IGFueSBkaXNjbG9zdXJlLCBjb3B5aW5nLCBkaXN0cmli
dXRpb24gb3IgYWN0aW9uIGluIHJlbGlhbmNlIG9uIHRoZSBjb250ZW50cyBvZiB0aGlzIGluZm9y
bWF0aW9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSBiZSB1bmxhd2Z1bC4gSWYgeW91
IGhhdmUgcmVjZWl2ZWQgdGhpcyBjb21tdW5pY2F0aW9uIGJ5IGVycm9yLCBwbGVhc2Ugbm90aWZ5
IHVzIGltbWVkaWF0ZWx5IGJ5IHJlc3BvbmRpbmcgdG8gdGhpcyBlLW1haWwgYW5kIHRoZW4gZGVs
ZXRlIGl0IGZyb20geW91ciBzeXN0ZW0uIENyaXRpY2FsIFRlY2hXb3JrcyBpcyBub3QgbGlhYmxl
IGZvciB0aGUgcHJvcGVyIGFuZCBjb21wbGV0ZSB0cmFuc21pc3Npb24gb2YgdGhlIGluZm9ybWF0
aW9uIGluIHRoaXMgY29tbXVuaWNhdGlvbiBub3IgZm9yIGFueSBkZWxheSBpbiBpdHMgcmVjZWlw
dA0KDQpUaGlzIGUtbWFpbCBpcyBlbnZpcm9ubWVudGFsbHkgZnJpZW5kbHksIGp1c3QgbGlrZSBD
cml0aWNhbCBUZWNoV29ya3MsIHdoaWNoIGxpdmVzIGluIGEgcGFwZXItZnJlZSBhdG1vc3BoZXJl
LiBUaGVyZWZvcmUsIHBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHByaW50
aW5nIGl0IQ0K


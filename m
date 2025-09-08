Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B884CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 16:06:23 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.55])
 by mx.groups.io with SMTP id smtpd.web10.1642.1757347578051317119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 09:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=o4lxs4c4;
 spf=pass (domain: axis.com, ip: 52.101.83.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1aTOsCo/hLZYAEKn1Jp34w17zee6BpCjI8Gc7TX0xb2RKzzzyNkNZCrPHrpwQsO1PutaOt4sWAqWkvYleJhKUXGRsnZwouQp6zlmA4PYi/VCL1KePfgRAsS7Qdd5iEB/aX1iMOCbbFj5YkQOClYJ1+d+wr4M0C7t2yxrp8U3XbvKoE1S/Nv9ysJAToYl3/AFdcwhslCzGVFGh+mZJTGBaYgDRhBrLwMOs7B+GU+gGzUkH8foOT41EaoV4fgpPYN2UgEnOFOMcGz3NdPCPh6k4Akg5nwvmayht2VICAaJzjI0I0r+Lcxkz6LYmLv+t4G2r9A1kjIGTkfBduCJcaQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrU8WxFWHu/W09FopBhUSJ4ZPzJZ5X6YsTojxCiNTbc=;
 b=MxXAtDe9YOKltuqGL6i7RRf0vwyytggxe+rQjGEuqSZHzKcbnxGX4cyvQcq7pa9ybOBDOX4Q5Le9kconDxlpyjOdpFsfVAoi3ksraQqLHeLMu5TAoopGct1OOZWiIsPn/Ad4hm7Treo/OblhyMhlA/vSC2cQcqyH7afMJigNHdBCTkXDS2up+DGKzpV4H9MPVho/aaCH7sSH2GIbC1+MXFvfdn028TZgVec5bMDGhO86rLA2TTUs15/ZwYSQHmfIPPMQQDVexOFaG2XY3zpDQYgTbKXPn+P7/FW9WOG96dlaG86mTmBZb0rwwZkv5FSOCNiAWqOyJwH4d6W5rEMmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrU8WxFWHu/W09FopBhUSJ4ZPzJZ5X6YsTojxCiNTbc=;
 b=o4lxs4c4y3HhjD65jJEHfOl8xJWa1sm8Lj/8l1bA9e8m8GW+5Su1wgSsPoIOBXTZSDSaIuJN/YeRLSH6xUdVKdKs7RXP4RmjW6Zd2kPSCtqNW2mbpZJB9TY9Ox/27obZ9Dxo+1f8GeaKMWYwjgSgC4xAaBV0a1NDQ5Z8aM2ufH0=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by DU0PR02MB9025.eurprd02.prod.outlook.com (2603:10a6:10:477::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 16:06:11 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb%4]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 16:06:11 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv6 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Topic: [OE-core] [PATCHv6 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Index: AQHcE5Gu3hub3ENj5USgeCDFH/b1ebR+nqIAgAru8hA=
Date: Mon, 8 Sep 2025 16:06:11 +0000
Message-ID: 
 <AS8PR02MB10201C12325685911790E39A3EF0CA@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20250822182038.1295769-1-pkj@axis.com>
 <6E431FAE-B310-4817-981D-9A1DB4963736@arm.com>
In-Reply-To: <6E431FAE-B310-4817-981D-9A1DB4963736@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|DU0PR02MB9025:EE_
x-ms-office365-filtering-correlation-id: 76456bc0-5089-4212-5a05-08ddeef1a108
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NHVYb2hDZmxaNGlzM2VLUU5BaVZ4bmFBZ2pqOVNGMURyL1k4QUUvOUQ1cHNK?=
 =?utf-8?B?Rzd6Mk8reDI0TGsvR3lLQXlNK1N4alNUVzQ2Z2NRaytmcmJrQVUyRDlxVXk5?=
 =?utf-8?B?Zkt0UlJXOWVyd3NhTlFGQmJiT2I1em55eU50WkZQMGw5ZkJlMnJxR2ZyQk1u?=
 =?utf-8?B?aEk2VDllc2xLUndoNGNRS21Bd01kWHBEQnRYbG5wMUo1Y25vcGhzeHc4dGJj?=
 =?utf-8?B?Y21QWGdxZ0grOTVaRklmYldMMEtmaDZiVy9iS1BiTWVmSDYrUVRhYWZMTnFH?=
 =?utf-8?B?THRQRFlWVzNuRmkrQmt5T1lBdU9hbkdSR0owbTUyWnRYRjlaZmN6bzZYKzJS?=
 =?utf-8?B?dTkzNHoydEVwMllISXcvUmZzbDlON2NYTnJva1lmMmp1MFEwRWNIZzRqZlhZ?=
 =?utf-8?B?ejVaQ01jT1pkY0FUWEdMTHZONnhmVUswZ1hoM2VlTWsxbzRwOXNHRUF4RFkz?=
 =?utf-8?B?REI3bDZtemdQRHFmbTRyRjVNS1VIazFVWlc3RUNibnU1ZWZUbXh3RkFzWU5N?=
 =?utf-8?B?Vnp1S1RvMkU3Z1g4dnh6TUtxR01aWjRBeG00WnEwc2w2cHpQc2FGc3JJeCsy?=
 =?utf-8?B?cCtNU2p6QW81VU9DK3lmNHU2S0pSdXlRWTR5anllRU1ONE1YYjJqZ3R4K1FP?=
 =?utf-8?B?LzlpZjFON2lUMElXOTdreDh0RlNTVEtaNGhxdmkydFhPWnVwODRtUURWeWN5?=
 =?utf-8?B?TkViMHRsMTFQc0M3OGRFRGljakJ4aEJtcnJMUCs3N1o2UDc4M3dYTy9KTjAw?=
 =?utf-8?B?V0E0TjdzTW1RM1MvSkpqamlBWjZmaUVZRDk3RlZwL2c1NmN1ZXhGTXovZ1Ri?=
 =?utf-8?B?M2ZtVXpCaG9qQVRGZmxlMzIzQWlreksyQTd6RVlNWmN0QWt3cTJCUEZwMHYy?=
 =?utf-8?B?c21XZ2R5RHUycW1GcEwwcDVHZ2NjbTg3V29SUU4ybjBrbm5tZ2w1TElWU1hl?=
 =?utf-8?B?R2d2Y1VKUS8wNS9qVDhvdGtjQU9oMWdhQ3AwaDFOaG1CdU1SSCs1M3M1czJa?=
 =?utf-8?B?OFlZVWhSNkhyK1lIaUVkZ2x1Zm9iSlZlTkovWnc4N2Qrczh0dG8xQ2tvd1NX?=
 =?utf-8?B?Mm51RzBaRysvRXp6WkovT3p1VUNGVXIzeGY5TkxsV2JGOERTY1RST2dSaWpP?=
 =?utf-8?B?Y2piazRyUDF6WFR5bDQ0UHFoSFlHYVh6UHl2ZXFaRDA5MFVxYkNhY21VcjBz?=
 =?utf-8?B?ZVVQOUZ4MDd1UkpNZnZ5VisxTCtnV0xBbUtqNWN5bytiT1lIQkFhT0MvZDl4?=
 =?utf-8?B?V0tLc1hOeVVaamd1YVdlYXMvVEwwbm1DMjl1ejR5eTNyR1Q4Qi9iR1FNemJM?=
 =?utf-8?B?ZUNEeGVzeDFmZXA4eVAzSXdqVVRwSDgvSUhLVSt4NkVZb0JxSHp3T2RUTVI2?=
 =?utf-8?B?elFYMTNXbmtUTTIvSUFnamx6SytlOVdiZ1FyMzExZlQ0Vk55eVlXYTZnTW15?=
 =?utf-8?B?eWs5dkJIc1ZvcC9SaVo5bDNZV2oxdWNWWnJuNDFWZ2dUV0lWOWZaWmNhNGd0?=
 =?utf-8?B?REtYVURhOUtHcTc2WDB2UndpUXMxcnJHQjZSdUNCeXY1NXBCbE9yRU51QlNU?=
 =?utf-8?B?NTB6QncvREQvZEt1MVFtMUEyazBndVJXSDN0QTdZY0VuNk0xY05sd2psTkh1?=
 =?utf-8?B?cWZoWHFYWXA0MTJsako4R1gwdXRHTFVoc3hNaFhSMWJ0RWJza2x1bWJRdEor?=
 =?utf-8?B?V29BUVMxeEUrQWlISHVNWTl1eFI1R000cUJIa0dXZ2xWMnc5VFBSYTFQdjVS?=
 =?utf-8?B?TUQzbC9Ha2ZuMkxBZ1NVRm9ORjZNY1I1OEhIam8rMlFVb2hhZmtaMzZ4TDBx?=
 =?utf-8?B?eVdWVnJqSFdlMHhvWERORnRWaXhxWjdxZ1ZXZC95NzhIeWtwSWszeTJsNWly?=
 =?utf-8?B?cUJ4OXdlYlFqWUE2NVRZcmxjcENieDVTY0ZDQUlEekh1RENWOHlaZXV0WmV4?=
 =?utf-8?B?dkpSeWlBWTdtNFZ3ZkFJMkdiU3RiaWdzek9rZjcvWDdua25vMXZUdUVlOVQw?=
 =?utf-8?B?M2FEbmpIWWpRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RTNad1pQUVFJdm5GRnFLV043SGZiMkxSNHBnWmlGcTFRYS9KcjdlVjcwdGhQ?=
 =?utf-8?B?cGpITVFYV1dUV2hjcEtIUzlPeFhTMVFuZVQxUWNoSmFod3FXMDVDSUpRVnFt?=
 =?utf-8?B?bTRwSkwvQ25yMzdmZzJua0F3dXZrckpzQjY0YTl3SGQvNEkzVndEN2ZkT3p2?=
 =?utf-8?B?anpYaE9sQlBnWm1DRkxwY2g5UjVybXMwWkVaOWZ1KzlmRURUekpuTkRjV1R0?=
 =?utf-8?B?aGVSR254RFVjc1ZhbEFiUjIyYnkzdGhobzFObGY1WnNVSEd1d1M0WW9wMThy?=
 =?utf-8?B?UGQyK0UxTFpmQWIxN2txL0NGN2hLS2JybnhwRC83M3hJWlZXM2hJZFdyeDFJ?=
 =?utf-8?B?TXRzdCt4QTc0cjNjS1loNjVzbW00UEt2QkUrUjltU1huRTFwdFFOZ0NTaXZm?=
 =?utf-8?B?QjE2dVNEd2UrMXc4dkpwL1NLbnVYdTlmNk5HZmdrbzY4SXp2QlZDUlIvVWVZ?=
 =?utf-8?B?cCsxV21IZllTUkNzQjU5bHpNeExkWUdRdUhtSW02d2ora2F6ZEJ5K3B2NE42?=
 =?utf-8?B?SFozbHhGeUtaK0VsZndMTUQrMlNRS1pNYXpPR3dmNmFoZEpSaDk0ck1aWGpK?=
 =?utf-8?B?WTJTN3AxZzZmbnpjeEpDWnJoeEljNEs5SDRyYmVKYUptU2dzd1RZQTAyd3pN?=
 =?utf-8?B?VFAxTlJKck9Cci9VdjFScUd5R2FUNlhKSWkyOFJBaWQrTHVZZU9wV1lRTUxY?=
 =?utf-8?B?RUtPNTAwNWVQMkx4SkR3RlNXTVpEcU1xYjlFU2FYNldCMmMxcWlGdWhPUjZh?=
 =?utf-8?B?aHY3bnMxSVZtZWhWV2p2dVBJTWRrbjdVSmhWd2lkdjl4QUIrbEgvNGRuYjc5?=
 =?utf-8?B?QmkzR3pqcTJHRHRYYkJZMExId21KMHBKYjN2dkEzTW5LNCs5bHp1SHg3L0dm?=
 =?utf-8?B?VkFYNkwybXJXQnYwc0pVUG5vVUl0TUE5eVd6TUsrTE5XSzBkQW5acDFiQUxY?=
 =?utf-8?B?YVZzdHZiTzhJNDN6RGtvT2oyVTc3dkNCZUtvRVBkZjVLTTBkdVhWaXVFMVVV?=
 =?utf-8?B?ditOUTNISTM4UnpVTTd2Nm9hQUpCYjdZSjRPWHNtN2pjRVBvRlU2anAwUENE?=
 =?utf-8?B?Z1k4YjV2QXJLekNRSklrSkVYWUxWNW9ESWhscmRBdmtBVC9keGx3OGdUbnRJ?=
 =?utf-8?B?S2RzZ1lxOFVPVjlpYWN4UWlIelU2d2dVNVQxNGdORXBBcHdNYzVwd2FxVGgz?=
 =?utf-8?B?clZscXN4Z2JZeEhsMzRoVWoyU0FIc1I3K0JsdHBKL1hLNWwwYTUvMG8vZWxx?=
 =?utf-8?B?UmVicmcrWFo2QTdjR3NtK3g2MVQ4WXdNZkpPQ3NDajRsai84aVNCUWF4aE5G?=
 =?utf-8?B?eHJjOXZ2WnhLUERkTE0xQlY4cXdtVnJTSUZyN0VuTGNtaURUVFJyaE5LMFRz?=
 =?utf-8?B?RFVrcUhuay9ycytjNXJDUThWM0Zobk5GQUxLMWF6Yk9WbVByMjlEOUpTZ3kv?=
 =?utf-8?B?cGZYeFdXdTBDclJPa3EvTEMvVml6WFFnQTVReWl0WEdjYmhZOEpzaGtlelJD?=
 =?utf-8?B?SEczRzdEaENYdTZzS05mNk1CbG9OQVJFNngxVm91QXRHeVVLR0pZMC9HYUJm?=
 =?utf-8?B?a0tiVHhsWDYwRjVoQ1pXcjhqVHUraTQ2V1JZdWxIKzBKSGRlNnFFdDc5WmFW?=
 =?utf-8?B?TUNDb2g5SHM0dElsd3krQmZxems5ZE5JUDRlOU9QK1ZCVDFURDdsd1dqTDht?=
 =?utf-8?B?RmNHMC9pU0d2eG45cStlVFQrYW04enRtQlgwMkh0VmtWcDdwUUMxZ2hhZWhW?=
 =?utf-8?B?WExuMmRZdnNQWWRhL3dvMjJNQWh3c3pTVjJ5Q0RiQm9kM2V6bFRIQWlEQ1pD?=
 =?utf-8?B?V09nUVk2YVRka2czTjJSMXNqV3duT0MyemdWdDBreDdsZ2NtNzl6eFZwMkFj?=
 =?utf-8?B?NFBUQjBLbGZ2Vmk4S3NJZDVRZ1k0bGtNeC9INmYvZjhBQ0Z0SllrcXlIc3hG?=
 =?utf-8?B?Yk9aRE9XTDlqcG01OWpKdmlLVW5PRFcvbktUVnZyMUtKRTV0elVQYjc4MFN5?=
 =?utf-8?B?b242R203Y21HSC8wc3U0YWhlRDZpUzBSQlpUdHFqbFlWTjNtNk8yU0x0MXZu?=
 =?utf-8?B?VVdPY3FWeWZ6MGF3bS8vV3YzQ3F4WTMyT2hRdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76456bc0-5089-4212-5a05-08ddeef1a108
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 16:06:11.2266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLe1xISm96OSzsaoI1ErmRxk67POQ8/f02I0h6qO5Jd+bUNwxMwhXQxUoG04pbCy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 16:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223076

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJvc3MgQnVydG9uIHZpYQ0KPiBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFNlbnQ6IGRlbiAxIHNlcHRlbWJlciAyMDI1IDE5OjA4DQo+IFRvOiBQZXRl
ciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gQ2M6IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0h2NiAxLzJdIHN5c3RlbWQtc3lzdGVtY3RsLW5hdGl2ZTogSW5zdGFsbA0KPiBz
eXN0ZW1kLXN5c3YtaW5zdGFsbA0KPiANCj4gT24gMjIgQXVnIDIwMjUsIGF0IDE5OjIwLCBQZXRl
ciBLamVsbGVyc3RlZHQgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHBldGVyLmtqZWxs
ZXJzdGVkdD1heGlzLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiArZG9f
aW5zdGFsbDphcHBlbmQoKSB7DQo+ID4gKyAjIEluc3RhbGwgc3lzdGVtZC1zeXN2LWluc3RhbGwg
aW4gL3Vzci9iaW4gcmF0aGVyIHRoYW4NCj4gL3Vzci9saWIvc3lzdGVtZA0KPiA+ICsgIyAod2hl
cmUgaXQgaXMgbm9ybWFsbHkgaW5zdGFsbGVkKSBzbyBzeXN0ZW1jdGwgY2FuIGZpbmQgaXQgaW4g
JFBBVEguDQo+ID4gKyBpbnN0YWxsIC1EbSAwNzU1ICR7U30vc3JjL3N5c3RlbWN0bC9zeXN0ZW1k
LXN5c3YtaW5zdGFsbC5TS0VMRVRPTg0KPiAke0R9JHtiaW5kaXJ9L3N5c3RlbWQtc3lzdi1pbnN0
YWxsDQo+ID4gK30NCj4gDQo+IFRvIHNhdmUgZnV0dXJlIG1haW50YWluZXJzLCBJIGZlZWwgbGlr
ZSB0aGlzIHNob3VsZCBoYXZlIGEgY29tbWVudCBzYXlpbmcNCj4gdGhhdCBpdOKAmXMgZXhwZWN0
ZWQgdGhhdCB0aGlzIHBhdGNoIHdpbGwgbmVlZCB0byBiZSByZXZlcnRlZCB3aGVuIHN5c3RlbWQN
Cj4gaXMgdXBncmFkZWQgdG8gdjI1OSwgYXMgdGhhdCB3aWxsIHJlbW92ZSB0aGlzIGZ1bmN0aW9u
YWxpdHkuDQo+IA0KPiBSb3NzDQoNCk9rLCBJIGhhdmUgc2VudCBhbiB1cGRhdGVkIHZlcnNpb24g
d2l0aCBhbiBhZGRlZCBjb21tZW50Lg0KDQovL1BldGVyDQoNCg==


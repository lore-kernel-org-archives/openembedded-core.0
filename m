Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BDBE7717F
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 02:46:22 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.134])
 by mx.groups.io with SMTP id smtpd.web10.2078.1733885180836974673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 18:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=FxDG+HqS;
 spf=pass (domain: aspeedtech.com, ip: 40.107.255.134, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzRDxa+XhLQ9O74NCRyG2MRvK9cuSPuVnxMHiO/hCjCH/BNMhrGRtEiz5CHzNiGN4GOgnddKV04j2pmu/uxi65YEChbSESnG7s/kSJZjIFxQ7uqcpOgE1kBUDlHz46kNMDKVjYBnluR05ehSb8wYus/XKX2Tk5tA1UKZhm5nw6bc0rH7g9XwVVofaMTH9j2RIZ5QM47uBXMvTQ521Ge3sYI+sK5R19VJMVllsVRemEjWtRzSUBtaQq5i24+n8/7x4FcKW22zJnUU8BeDCAmAL8nr8TYDU2A6gjznoe9o2xSWZVUcyGn19fGbsST8UioQewpU06kU6kilX9k/Ng6/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9yCxVTG5INPJkYp1ddqnuY+fOmFbe2J0VaLah3/P2s=;
 b=yFXWjT2xOjmFGE/XTiEGbvcJpb0T7mnHUAmklWS7Gg10ELaCuZBGLCZSdXKoAOr/dTDLv1Unj4iuMLkYO9DUYWBv1bEMVKV1SFg5BukwY/jXF9giBTLO1s1lxQ0pUzEw6yxm2wgAlCDZs0PKyHEqhv2aZ/8mYxIrH2zoKxbQ3oL/aeANyNawEGU3+8EQKP7/CA6kYVGzto5Qyb9eKT8bW8Oefkgmk4WVj/JM7Q+aX1wAhPdogdY9nV5m4JkyO7ZVejXRl8QVf/HbDaUcHMDG7dmaB9UnGWT3gpfcwaDt/iGCdpzkwSpmiWIglLnVJx6Vx9/QM+LP9u2Au3PtgKTw2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9yCxVTG5INPJkYp1ddqnuY+fOmFbe2J0VaLah3/P2s=;
 b=FxDG+HqSIFd2B0a56LgqU1hJbkl37xCvomgdHZguh2SQvxICUAdclYPmHZQfET1hOhQdovGc4m2A4BReXfYH4x2pss4BqFyJI+zeuh33gQw/JA99XHjPnpycHxH79pJ+WQb8Itk3DwTNCjBccxJFSHrpuKuNWK63mrId7VkJ2mXDGKq86Hu8IJ5zVdu8tAKZt64BXP1co0PED+4x5kH3bQv6w2yjZ2U+qkNwVWoX4mHNnNnwLodDEwa/FaTce/3NEL4nqURqkp6A/gpbtJofbf/jFvYLuAf+D3Z7bVeKJ6xuD6XjyKxYX8FyoxVqeLFv1E/YKYz8C3PFada9YSCbaw==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SEZPR06MB5072.apcprd06.prod.outlook.com (2603:1096:101:38::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.9; Wed, 11 Dec 2024 02:46:14 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%7]) with mapi id 15.20.8251.011; Wed, 11 Dec 2024
 02:46:13 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, "ross.burton@arm.com"
	<ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Troy Lee
	<troy_lee@aspeedtech.com>
Subject: RE: [OE-core] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
Thread-Topic: [OE-core] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
Thread-Index: AQHbOYOscRgtxl75AkC5qc3dm++B17LMxhgAgAun+ICAABPwIIAGu9ZwgAE8ExA=
Date: Wed, 11 Dec 2024 02:46:13 +0000
Message-ID: 
 <SI2PR06MB5041EF10BC086B3776F6F11CFC3E2@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20241118063233.698679-1-jamin_lin@aspeedtech.com>
	 <1762D5D7-817A-4852-920F-C6B57DAFD599@arm.com>
 <2cf9f5fe20b351481ef08b9e13eca31c5ee02a85.camel@gmail.com>
 <180E7161025130F9.8554@lists.openembedded.org>
 <SI2PR06MB5041F08E8F60CC3B5E31E9A4FC3D2@SI2PR06MB5041.apcprd06.prod.outlook.com>
In-Reply-To: 
 <SI2PR06MB5041F08E8F60CC3B5E31E9A4FC3D2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SEZPR06MB5072:EE_
x-ms-office365-filtering-correlation-id: 6cc12bb0-1b45-4221-b05f-08dd198dfa68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?L0NBRkd6eUNGQVlqZmZvY1NnS1hjR2hnNkQ0ZzEweFJGYlBHUjNvZmxzMkhx?=
 =?utf-8?B?RndhOWZ3YzBMdFpLT3hUYU9PVDlHQUJWdjBRejhEellRWmlIZVdRK1VGclRn?=
 =?utf-8?B?K2YrMmUrVXlMTGZWNGY5WVhvWWQ3cVcxcVZ2SlJ3cXpiTUhJazJKR1dRRitm?=
 =?utf-8?B?WEhmOXlaNk1rcDZOSlNHTWh3Mm5TWnloRGdEdkNudUNOaG5aSEgrbmovR0ZP?=
 =?utf-8?B?cHU0UjhBVUQyU0czVVJSRzRCVHhxTnNiM0Fla2NyRjJ5NjdWOVd5SnFjQUlx?=
 =?utf-8?B?ZmRrak1TcGZ3aHI4QVNLdDJJQVNNVkZQZEF6QWM4TXdqZDl0VWI2aTdQVTV1?=
 =?utf-8?B?SC9JU1kvTWl0Q1ZpYVR4TXQrc2hIaDN0ZHd6T1VSRW8zSXNWZk11L20xVE0x?=
 =?utf-8?B?SDNPaTBhUlVXTlZWbTRuZTZMNlZhM08zYndib1dRM0RJVXZFVTA3SHZvNjZ6?=
 =?utf-8?B?MUNCS2FCYk9oSitBRk15cU50ZVhvQVJkODY3aGgxdkk3emw2R010NmVnbEFS?=
 =?utf-8?B?VE9xMTFTZ3VPaElRUEhybE9ranJ0cFdlMFR2d1BLSVVxYlVHamxJT21OZ2Vu?=
 =?utf-8?B?bE1KREVweVBpM3hDbUk3WjJmUlkvR1lkNC9qTTlldUVmWHc2MjBnVXg4TmUz?=
 =?utf-8?B?VXA2MWpRVEE3SW5lc1VqRGdqa3UyU1V1SGJSWmdZR09zbmQrNHVsSm5nNGtG?=
 =?utf-8?B?TUhUbkpWYnpDbld5QnJIcWhVN0MweFh3QjBVdGg1NHArREd1eDNqc0RjR0kz?=
 =?utf-8?B?YTlsNm1sbWxzSDhacEhBaXpQd0xkaURHdE04K1NhWmU2N1hPNnAwM2hwRVJ5?=
 =?utf-8?B?aElteGQ3d1d6NjIzYXo0UDBhMytoYUJMODV0UEcwSFRCQnEwSTY3cHhWR1c0?=
 =?utf-8?B?YjhORWVpSytiQ3RKYUx2WWFEazRPNERWZ3dONkFnTTRaNFBSaEMyN1laYldL?=
 =?utf-8?B?bUdPaGhQN2FKVnZtci9UVHhodENnK2lpS3BTc0F5Qy95TllQWW45akVoT3Mw?=
 =?utf-8?B?Yk5kZjVGS3hDWFJqeUNuaUcwT3hSdm8wTnlSNFB5RnZCRmJjdXNCeXBhRUdj?=
 =?utf-8?B?eStPQlBwZWh4RUlndTlERkY1THNETUZJc2Z6cDNib3hEVkZTc0VrNkxoeU0z?=
 =?utf-8?B?WnV0UXVQZkYxWGxGQVdKSlZtNDhJYXQ4c3NKdDdKa0ZQN3VjVVF1aXVJNmU1?=
 =?utf-8?B?WnJZK0JDb1BVUHRBTU9ESjk3eG8rMllrOGhjcDNLak85YVdMMGJaS0lqSnU1?=
 =?utf-8?B?a2ZxZmNxWmtERDRpS1VKQU1mbG9rcU9PeVFyNzUyNDFWL1FoUW5oNFJxdGRh?=
 =?utf-8?B?MlVDVDBBS0swZEsrS3ZWWXBORVVCSFhLdGFobnFSaUEwbEVLeHVab082M1c2?=
 =?utf-8?B?Z2gxamx0WXM1MndNYzZiVGk2dnRHLzI2aHRxQ0hRNEFEN3haM2VvMFZVYTFn?=
 =?utf-8?B?WW5Nbm5STzFxUVczclhKZGRia0ZlQUdhbFVmL3IxV2NSV1hqamRJRzZxN0ZB?=
 =?utf-8?B?Q3lCYSt4QUFSTlJkMGNiTnljYmFPY1htR292ck1EdDByZHFTR0tZSk40UFRC?=
 =?utf-8?B?SmEzTEk3SFRqNW8yaE9icFBNNFJWK0p2T3QvR1BsVWxlMnU3YVlSNWFXYk8v?=
 =?utf-8?B?clVEazAyclVpdXRNRU9oVm5XNzhXRlpaRFdES0hlSXVZTnRYVzB0U1Q3OHdU?=
 =?utf-8?B?NENhVnhvNFk4djY3QThWcGN4SFEvMURQNkNGeHpWbloyd1A1SG5FT0NNUEhZ?=
 =?utf-8?B?OGhYOU9WR0R1eEFQUkU1SVhyUDNNTmpEcVVmTTQyd1VDb2VXclI5dHYrUmhr?=
 =?utf-8?Q?Lxfs9N7d0jshb3iyU7crIcf6FKGNiALKtuf/4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YkRsQlpVdU1zR2pTVFFEclRhakpKMi9MVEFlMWRxMjJuWlJoM29iZWsra2Ex?=
 =?utf-8?B?UzNBa1BSeWZOWjBYK3pxbUY4VURDN1hqSnMyY3VobDhzMkV2Q0pSRlZ6cW9t?=
 =?utf-8?B?NG1lL2FjeW11UkhYempRcnF0WUp3Nm9JWkVwbU5JNzVpaVdrdWdXWEoyaHBC?=
 =?utf-8?B?U2pVTk03bENWZUx1cERlUTNKRkhnUEd5Q0N0ei9KR2c0cmdRY1FteWZHdC9I?=
 =?utf-8?B?UUdKSmVNL3ZqVFlzcEZwc2cyV0JFbjZyWk5NaTY5VDF5Si9ubHd1ajB5ZHhD?=
 =?utf-8?B?RXg4MExUaHFVV1BOU3l0OHNNWUxYZXNTWkticC90RnpnTDlZVmRTYW56Yk5G?=
 =?utf-8?B?ZHFUZ2M2czFka1pTVkNoOEQ0d0oyY3NhZGI4ZU03cTdUMm1Cd2piTGgydXlI?=
 =?utf-8?B?VmFDTWZVVUswK2RMWmRpUmE0ZEppNHBUWWg5QlduL2RRSnZPNUQ1ZVU0dERz?=
 =?utf-8?B?UXFQdXZGU3hrL0RzMnkwUDB4NnlrelhNZ3RFR2p3ZzhBbGVtdDhzSUFhMmJT?=
 =?utf-8?B?VlpReGJnd29pYzhEYjQxTW5RRWVRT1I2YzFYNDBrMjlZem9JMWhmcDBQNys4?=
 =?utf-8?B?ejYwSW1HZmRiaXR1ekFJZE90dExKVGRuTEwwY1NPUlVaTE55aTVOeU9vQUpn?=
 =?utf-8?B?VDNoaDY4YmhLaE5RRHMwV2R5NjZSUkR2V2NhMFRacU5hVXh1NVpMaytGbGFv?=
 =?utf-8?B?NzVGL1o3TzUxbkFJSi9TRzMrOGxkb216dDluQzZKNmtXOE5LZ3E5WTQ3dTlH?=
 =?utf-8?B?LzhNYVRKcFBUakpvWTRKZDcyWVVkU25vZ0JqSS9Yd1R1RTc3VlZqRGFITWVn?=
 =?utf-8?B?NUs1NjA3N3RXNHpaSFJqa3hkckVIS25keFROWXBpOStrQ2lpM0IrNTNnWGRs?=
 =?utf-8?B?Y1NjaTNUQVhnU1J2TW1kV2x4MmZZcERycjdzQy9qR3RRQjlPUmp4Mzc1bWVM?=
 =?utf-8?B?YTJBUG1oQncvVnVRbkFORGZQdllDdThYbUk3UTNlbHpJcXNobHZaVmpTeDhN?=
 =?utf-8?B?WUxLN2RSM1lCMldzb0FUc0dLOU5NL21mN0pKcnpFUXZUY3RYNWRlV3FhS0Vw?=
 =?utf-8?B?NSthd1JIdklEUUJUYUM3dWJ6VTN4OGRmMnhuVWM0NGlyVEZieUlBR3FzYWl0?=
 =?utf-8?B?d2NxOUhVTnBTRmJvd2Q4ejhETTVmVi90NXp3Zk9qZFVWd3M1YzlQQmtrWVJI?=
 =?utf-8?B?bXJNbVc3NUd5K01mTmVZbTRWVzFHblpNNThKdWR6RUtnZVFFT0VvQU5DeWZP?=
 =?utf-8?B?UUE4Yi9GUnNIMFMyelVOYkdrbE1td1ZyYmdtZ0VoWVBRWVByWW9URG9LTGhU?=
 =?utf-8?B?ZVRMdkhsK3JxQmVHZnhnb1Y5NFNCdnlhTmdURHgzbi83a2JHMzh5ckdoVFh2?=
 =?utf-8?B?YVhyamFXYjVmc2dxUEJGclFLRXNGL0ZZRExBR2pmRTdua3kxbTJOYlZHeG1o?=
 =?utf-8?B?cGNUZTZPTUpoZTk2dVJJL2N0cmFRcmFZeWF3Q2p5VFV1RVNDVWZNRTdKWVIv?=
 =?utf-8?B?QkxUSVJSZFJuVktCaWM0aTQ4aDlVM3RoRFkweVNqNThlM1JWV2VVcVZxRk9s?=
 =?utf-8?B?RlN2MWI5dXhSYW8xclBNd3lHWWJVZm9oNmJtRnNhK1A5ZjhSeDhOM1BOYVlG?=
 =?utf-8?B?K0QrVkRNVVF1NksyYUlrbE1yb25UbWF0UTBXbVVYNHBvcVhSanR1ckVlT0pi?=
 =?utf-8?B?N2VqUVpnemxxV2VmU1VqYzBhMmYyMWEydzFKYmNMb2s4OUV1ejE3eUxYUXUx?=
 =?utf-8?B?NDhHNCswelJ6K2NReEJDVjlKay9hTkdGYkIwWDNiQXRkVlRlS1dxUFVvVGl1?=
 =?utf-8?B?WElKaWdsdEJqc3pwTjZ4djBzKzYvWkQrMlpJQzg1a2ovWVBFU1FYWUJ4M1J2?=
 =?utf-8?B?UDZDN0dwK2N4b2NOSTZld2p1RmZYUk1BOWhYcm1oUXcvbXhhRm1sSk5ERXE3?=
 =?utf-8?B?ZVJpczNiOUVYekFBaHpNcGZXWk9JdXU3RTlhNlVEQm0vQXpHcFZoTFlOZVNO?=
 =?utf-8?B?SXhTNy9peFdOVndBUitiR2xOOHpEVVUwWWtoS0JDcGNQVC9tTmNUd2xHMlRn?=
 =?utf-8?B?S1NhcGo3Wm9TS29nSEE1akRSWnNZeEtzcUV1TDd4S1I4ZVFUK3lrRmN1eFIv?=
 =?utf-8?Q?brCRE+YF/u6H6aVQB6x+O8qJm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc12bb0-1b45-4221-b05f-08dd198dfa68
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 02:46:13.8121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wkSuSnzQsMn3M/SqYCyBV60VGNZOqYU1tiIYkk0ViiTxm7X9TfacNyWMCPD8eJkt5TerV+vyVMf4awKK+n85SP3LvpMGbmLqn0wDJ23EMZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 02:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208572

SGkgQWRyaWFuLCBSb3NzDQoNCkkgcmVzZW5kIHY1IHBhdGNoIHNlcmllcyBoZXJlLCBodHRwczov
L3BhdGNod29yay55b2N0b3Byb2plY3Qub3JnL3Byb2plY3Qvb2UtY29yZS9jb3Zlci8yMDI0MTIx
MTAyMzUxNS4yMTA4NDE1LTEtamFtaW5fbGluQGFzcGVlZHRlY2guY29tLw0KDQpUaGFua3MtSmFt
aW4NCg0KPiBTdWJqZWN0OiBSRTogW09FLWNvcmVdIFtQQVRDSCB2NCAwLzNdIHVib290LXNpZ246
IHN1cHBvcnQgQVRGIGFuZCBURkUgSVRTDQo+IGdlbmVyYXRpb24NCj4gDQoNCg==


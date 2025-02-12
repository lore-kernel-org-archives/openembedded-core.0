Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D9EC021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 20:32:49 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.60])
 by mx.groups.io with SMTP id smtpd.web10.26800.1739392359269933494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 12:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=H5ak90py;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=H5ak90py;
 spf=pass (domain: arm.com, ip: 40.107.159.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rDc3VelnxjQgdjeglEou7I9/9zDTeZhSKIGwrPJFJXx+QwSCsGRD5RWKxtEpk3VbyY0XuQJ7FmTRAXQIbtJgGK+f4iBH/7p8659GoUSece7mp1KK5R6JzPY1EyaF+QAJaUr5yjf/9Dbv9svTdEh9nAnUpZLLBFIbN7M+1uz8/kypCMpquZdrLj2cmGqCfydwsTEulOojjfH1Rotgi4GiLfiNt8p0XbsNQa1vJlRAk59ry/1JFL46wV34497c2fY9OFdicWOSLcNj/TSsMF9Fj08P3RSsLc7GfcWIlC/iHHSN++JTy5Yn0QLs1N854B4qJGtELeyqZIsqPDI5igFvzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of7Pb3enw9BSa+NU7bIZTRetDoRvxfqszyS2mxUS8aQ=;
 b=ZNP4yDG1RsqJP8mR1fvl+WvHZjEOVs96hvoMQmqgepYcGIC8JYFapx9hD4u1hAgoX5X4hY5WGBszEySVZNup5EmL66HrE63a4rnX+cVNHzrW83dT9ZD0fUb82ujVv9ssNFPVOOURDiPfyFxg2fmJqIw0yBUw397AdEQ7EyyjR1YX9feHFxlXOTXkgP+wBCmF46zbSUk2BnEdFjApB05V7lRzFtCskBk5r2EvUOzTkBCKdTh0vgUT6gkheJNqOVoo7S2ozZ4gNcDU0IpZa1skDn1TAjSkPKeDf4dV7uGat5hFwrUJqRcfnpi9GquasF0RMfYgxH3RhTn+x7POmUXKPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of7Pb3enw9BSa+NU7bIZTRetDoRvxfqszyS2mxUS8aQ=;
 b=H5ak90pyOEgpCrEkI5yj4IhacAZnsQ+2zZM3qX9OJLW7O/xxJOYB6Wvd90++RZT0eiCOS7hXGtfj0xzs4me5Kdic8HL0rePYSlnL8hYucnUpaWEgjI0PLlxlEwL5VCm9VFQ9xdpjxsZeDSIOErCCW4rKgW/rI83s62aNngXuic0=
Received: from DB9PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:10:1d9::27)
 by VE1PR08MB5837.eurprd08.prod.outlook.com (2603:10a6:800:1a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 20:32:31 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::3d) by DB9PR02CA0022.outlook.office365.com
 (2603:10a6:10:1d9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Wed,
 12 Feb 2025 20:32:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Wed, 12 Feb 2025 20:32:30 +0000
Received: ("Tessian outbound e4b26383420a:v567"); Wed, 12 Feb 2025 20:32:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac94a73827cd9aaa
X-TessianGatewayMetadata: Djd1ldR5cE6kc9YolM3LhHhtjL7dwmTnm7iXp/SzP4i9c+Aq6UTLa1cDOJ+CQ8aCiy75da7tXq3C5FO+qbtdMyJKynXWh2dCWsiUlc0d9dZG5EZMIiW7yLX/7E9hS704BmoGDNmO2XayJyD+eS/7JbUQrz2ZxVdaT0TMDi9PFME=
X-CR-MTA-TID: 64aa7808
Received: from L053ebc7c1e13.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 49F2D4F2-716B-4D63-9476-23F8F68E5AF3.1;
	Wed, 12 Feb 2025 20:32:24 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L053ebc7c1e13.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 12 Feb 2025 20:32:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WADTfOXxP6jHzd3CfoUzfVueWsrTTSlGrfUf4KYSWWg1eYDvVWsJ4bzfQxUz3X0uSpFGY3rS8nqwcIJdaMeMgBFbCofzWsjRxli3mO6aQXuOc2RMt6EVyBdAg/J5mPlSW4SgBdKA7bn7KdAbR7iVn7BNp9JDQGaCWeEKP9AX2l6nlXQQTpCQnWnQnlsVBjm9YL8cALrfUAXdlOLCn9U0KfX29pF8P1o3tE3gqfSL9USh8YTSTQm6VD60tjPfONhOubOJkSOhTsGP3Gfqi54FXW9UVMhEVBiBRtE69h+8k9FjDTgZBmdZzjmalVzGMvMWTtdgbS84LBE/hch6WzPVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of7Pb3enw9BSa+NU7bIZTRetDoRvxfqszyS2mxUS8aQ=;
 b=t4uQuyPLqHsAGyLmU6/HnpgxymC8D+li9wN8eW23vtpFNfqaNCjKhkbyQABZ9bc9p67nVWRikUBclolQTpNwnW4KRu/DTc+rhp1vfjEGfBFV7Va6UgdhrdYNaRq5BbkFvWrKK6jg1L1vr5IDKTYAKneze+TZjWOlalOjAwwNuxhrNIKGZS95RxOKYs/bNx+SIHPuAb9TneXUG/Ecf0TP6Md43l/jlijzVPsY1LjgmxxfdQY++Bqe0AalWc+7Yqi7e3+QWoVw2Roy7ByaW5HKaigW/D+eA5yc9tdDqmWjWxd3ORZsfQnDqefVnq0orYWioeO3CGmJJ5QeaNRXGXJZGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of7Pb3enw9BSa+NU7bIZTRetDoRvxfqszyS2mxUS8aQ=;
 b=H5ak90pyOEgpCrEkI5yj4IhacAZnsQ+2zZM3qX9OJLW7O/xxJOYB6Wvd90++RZT0eiCOS7hXGtfj0xzs4me5Kdic8HL0rePYSlnL8hYucnUpaWEgjI0PLlxlEwL5VCm9VFQ9xdpjxsZeDSIOErCCW4rKgW/rI83s62aNngXuic0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6031.eurprd08.prod.outlook.com (2603:10a6:102:f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 20:32:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 20:32:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-license-expression: Make the ptest work
 as expected
Thread-Topic: [OE-core] [PATCH] python3-license-expression: Make the ptest
 work as expected
Thread-Index: AQHbe589TMizURrmjUGdQlLrHPxvsbNEIyUA
Date: Wed, 12 Feb 2025 20:32:23 +0000
Message-ID: <7465AD6F-E074-4191-9931-FB8A95E1917E@arm.com>
References: <20250210093609.3899881-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20250210093609.3899881-1-mingli.yu@eng.windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6031:EE_|DB1PEPF000509EB:EE_|VE1PR08MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 0544827b-a7a9-46f5-cf65-08dd4ba45fbf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SEVDTVpKUzhaQUFYdnpBS2dEaTNJcnRpSXBXaDdKMmwyczlmbzkvUHoyTE9l?=
 =?utf-8?B?NFpUR0hJeGhRZW1FYkJaZU55V3lrb0dRaHJGU3ZSZUR0NXI2Z1lFc0FnU3ln?=
 =?utf-8?B?cXBlQll5bXZiSnlRenpGMmFDUVRaSWdXaU5FRHhFbTh6YzlEeFl4Skp0VjZN?=
 =?utf-8?B?T1pUVXljQ3l6eHdHS3FRQnVtcU92OFRjNUJRblZlTm05TVBKTzlLUDFiUGRa?=
 =?utf-8?B?K1pRUzliRnZVZzFleDFsSGhldXlhampzWENrS1lQZnVoaDFEdm5pMHBCNHcw?=
 =?utf-8?B?VjBjanR1cjlZYzRKNUFsTnRyQjgzdHJ4YzUvY0xLcnZrNHhYY3dodzB2NUxO?=
 =?utf-8?B?VFNYdjQrN0F0dzVkKzJRT3ViUDc2RTFSKzV2aEg3KytadXpROVZ1SVdkcGd2?=
 =?utf-8?B?NkVjVlRGN2xreDRuMEUvUG04dDBFSkl2SGhHQ05ndllsSmdOODJNK1lUT2l3?=
 =?utf-8?B?U3EzSFZ5eVVGcGQ1MWczMzNTS1RzTjZDVlpkRjNNaGVZaXJqVlNKWWlocFNx?=
 =?utf-8?B?Q1NHeFFiY1BZZEVBNzZNV3JITUhpczgraWRPTHcwb0w3YmNDWTdzTlFDaG9J?=
 =?utf-8?B?aEhqdEZ5TzdVNkxvQS9KZzdITzNkR1ZjTDF0NFVjTVcydmtwaUZBMWR6UVpz?=
 =?utf-8?B?dTAwZllFZWFUZUw0K1RWN1RXbHo3UDlHMzk5Rmh1UDd4M29Oa0J0bnFLTUFZ?=
 =?utf-8?B?ZVBwM2dQd2xjMGFNU1R3alVJbURPVDBKMVVtc0xHZU8rbXlja2tvb1UvNUpM?=
 =?utf-8?B?T2lKbXMwQjVWcjdLU3I1dDJtQlE5aHR6b0trT210UUwycE1PcEdadjJna0Fw?=
 =?utf-8?B?T211N0RhVkFObGVRdG9EM25xQWR2WUVxN2RucnNSeGNtTGo2ZFMzTGc3SE5i?=
 =?utf-8?B?TEJhRHVxeUk0dUR5RlRqdGVGZnFRSi9IeFFvdU4rYTZWc0RqZXg1SjVtOXBD?=
 =?utf-8?B?OHdMRURlNmlJYWdpYmJCMXhlWkVwWHhBcXUwSTRlQkRTaU96L3FwRGZERWQy?=
 =?utf-8?B?WmtyTGVmZHN6SnU5NUNObEdNMXFOaGR5ZHJ0b0ZWbXFQSzQvZkd2eWt0Nm1S?=
 =?utf-8?B?NGVVT3FKWGpQSW1wNElaVUo5WUJOOGV1SXdTeFpuTHNGSWZvMmVoZ0REeHdP?=
 =?utf-8?B?bmNlQk5WM0VHMDcxdXdSZ1FoVW9mUG82L0dhMmV0K1NzMSt0SDd5b0k1RFNN?=
 =?utf-8?B?UjI0eHlPR3loNGhPRmtGVk82WWRDUFdCL2NlMlJPTmlYajRsSlJxc0RBdUov?=
 =?utf-8?B?eHdMOUV2MzNiK0NLQ2ptMDJWc3cxcEJZeE90bUZYbkV5ci9EbERsekhja2lN?=
 =?utf-8?B?dWtPZlVQbld5bk5xWkFIallIVjRTY0NTaTFQWXJLWkxnVHgwWGJCb2ZnQmxC?=
 =?utf-8?B?QTRUTWs2dDVUc1V2b2gzMTl6dzE1RE85VDYrcWR5UGdZekFMM2JaNWl4SW5I?=
 =?utf-8?B?Um5UeXFETHIzYkN4U29ibW91ZGdkd0Z1OG5GblF5RkdPNHNid3JuRlE3b2lI?=
 =?utf-8?B?aHNlWm5hMXgzMEYvQ0J0alNUSk54TzdqZjUva1VXUzNjNG8rMVc1b1R4K28y?=
 =?utf-8?B?S2ZIQzhuTkxCd2pCaXZVWkRjUW52dzYvdytUYWc2eHFucHgvYW9FbnNocFVv?=
 =?utf-8?B?ZitIYUNKN3NkdG9hbHMxa3JFMjAzMU5WS0s4SXRQc0N0c01WUzFNUmwzeTlr?=
 =?utf-8?B?VFB2aEdLczM2QXA5R0RhZzlkMG5DeTdDQmpNa1ZXVXpkU25EUEdTRWZmZzZn?=
 =?utf-8?B?eFhwcDZCdEkzNEQ4Z2sxSmEvTFJBM0RPakJKWmQ3VW15ckRRbUdiSFpZVkRi?=
 =?utf-8?B?Vk1BZnQwRHhvL2NrUTFaalMvd3krNS96VWl1YXFUbnpyWFlXaFludmJkSWtW?=
 =?utf-8?B?VnIxamtobnoxNWJwNzZ4RU1Rb0h2bUkyb3VhV1dqVkIzVHdETS9VTWlsengz?=
 =?utf-8?Q?aKVvIwXDV1uFvLHVDvyXTLbJXxG+iElz?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB8B58B62310974E9D7D4E068DF74E01@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6031
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	63340e6c-4e33-4209-2f4c-08dd4ba45b07
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YUlHeGNuVklGUk1VbE9MZDIzV3QxQmhzSCs1NXB0K2prdnozQVo2eXQ0V0sz?=
 =?utf-8?B?dU5zQVRpWTRxWFZHUmhsV1pvd2lQRkFrMEpDdVZMQ0hOQkE0YzlPTG5HdTJu?=
 =?utf-8?B?cGI3WmxaS3pOM2dodEFjdW90Tzk0anFWbENIMUduUnQ3MFFHOTBLOUJSd3hX?=
 =?utf-8?B?UGVHMzlwNVl0eXNTZlM3dHJra3dGci9WQmluNkRlUmFMZ1I1dlpZeXRZeEk1?=
 =?utf-8?B?U3g0clVLMHZGOHRTMnBkMXlwTjNJNmpIdUd5YmF0WVRsc3ErS28rV2Rwd28w?=
 =?utf-8?B?RUVsazZuaHAyQ0FsQlh6VVRhRGZ6UEh1NVdLZkZSNjY0MUorVmw3czJ5ZUFY?=
 =?utf-8?B?OU5TczZwQ01OMWNnZlh0cXkvYmNhWXB3cEtlSzdtcVhydy9IdkVXbHFXamVB?=
 =?utf-8?B?cDE0bUFya29PMWN6UHVRK0tRcFB0US92VHd1VDI4Q1h6T0NnSkJ6QkRVbkxO?=
 =?utf-8?B?T1ozMGFPK05HVnA0TDBFVTZ0dklLRlgxOXlFZW9hd2hBOGs2VUpwU1g2dDdj?=
 =?utf-8?B?elFyd3daVnh4VWNuR1FpKzBtNEtDbkd0eVJwZ2NwMFRaOE5qZFZZQmh4a09M?=
 =?utf-8?B?TDFROS9SNS9rckVuZ3lmZWwwZmZjVUNXbHA0Wk1GOVJmQk9vbHB0N2RWbFM0?=
 =?utf-8?B?aXFRaW1tV3V1Z0dJdnVkbHVKRVRkbUR6anVoUnc1V1NaTjF5Q0xMdUE1Z21u?=
 =?utf-8?B?aXhwZHV5azVVSlQwT1plMjNBYys3WEg3YklVMHkrQy9QSTByYUQvMTdzQzhz?=
 =?utf-8?B?ZFRiUFJnSXFCMEFJYzRlNVRVQjd0bUNpckFPN0x1TVhjMW1mMzJWU2ZBbG90?=
 =?utf-8?B?ZHFPWW0rVjRvcFZ5Vm5MYnJwM1Q1TTN1UnkwVktZZ0xsUHJIMGl2ZjJMWEtV?=
 =?utf-8?B?UEU5Mm91WUJsYzlKMFBKNnhYRXo3M1BablVPalZvQlZJdWRjcG5waGVZbGtq?=
 =?utf-8?B?L2pEL0NnVDZhbk4rNFkxTHo0ViswY0pMUkhId3Zza05nbzRLeXpBNWpTb2RL?=
 =?utf-8?B?amxFeStDdldqT25BSGFqcVJUQTd3WFRLY1FFWDl5ekx3Qnp6WG1zTTl6UXll?=
 =?utf-8?B?bzdGb0hzQkJVc2VWa2tZQkk4ZVZiQS9ydElhb1RRVzJ6WEVRNk5zNkNYYWdo?=
 =?utf-8?B?aGcwL2NITGlDbXBHV1dLaXM2SXJWZXRsL3l2YllnNHRGUHcvVXRXaU82b204?=
 =?utf-8?B?VmdIbWxNeWVMeXMvM1ZvcHhqYjNQYWJQOVNlM0c3NGk1VTJmZWwxcE4ycGVK?=
 =?utf-8?B?Y1VlNm5HRXdWd041djFBUHBVTW9oMllWVzdJS2JhZE93UGg2SlNIeHpUZTcw?=
 =?utf-8?B?aFZWMXFPcDk2TzhkeWMrNXEvZzJqRWlQVDlyMktsZlV5Y3ZXYzFxb0RLK29s?=
 =?utf-8?B?KytNS1RMTldJbHFKaFRZMU5ZZFNTdzVhYllHdVZ2dC9tMXRCd0tON1Jkc0pC?=
 =?utf-8?B?eGsvMGN4ZmJNRUsxajJSMFcrSGxXSlFmdzFZZmlJUVljYVdtWmpZMmFFcmJQ?=
 =?utf-8?B?TkFGSUlBK0F3ZFh3OVh3V3ZGM0VYQmhaMmwrRng3YXJ5SDhLUXhxRVUrU1Mw?=
 =?utf-8?B?MnFiS2hCZURLQmhDcE1lYW5CS0tvaE5Xa1lacEtrcTVCaU5zblRtbE1lZTVu?=
 =?utf-8?B?ZUY4ZW15V3ZvMHpmMGoxSGFxUm56NWpvYUFlRHVRci8vOEVIKzdWK250RTBJ?=
 =?utf-8?B?T2FqYTZkWnJEU0dkYzI0aWxiQTNtdjZRUEs0OTU5Qmxja2ZjRXlkOHZybGli?=
 =?utf-8?B?L0lOVUNXbktZdDFWZVptSC9hWS9hT1JLSlZEWThvendQREpnRHVwWUFDa3FZ?=
 =?utf-8?B?QmpkZ01TZ25ObnRpODhXNldMeklqc0dNQ0R0YURnOGtoa3VSaFp4U0JUMkNX?=
 =?utf-8?B?aUJHQVFFTDlJOU0vTE5MSjhqOGtNakM3TFNSdTZxcUJZUHI3OFdPSXVPdjFY?=
 =?utf-8?B?QkNuNzBuSmZYeHhMdEwxbmd0RmpUTmJwVjFHcjdoVnEwcnVNYVJsdHFvYXZU?=
 =?utf-8?Q?jw3nawYTzHgyJCw5QaPS6s5ugs5AUo=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 20:32:30.9604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0544827b-a7a9-46f5-cf65-08dd4ba45fbf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5837
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 20:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211279

T24gMTAgRmViIDIwMjUsIGF0IDA5OjM2LCBZdSwgTWluZ2xpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxtaW5nbGkueXU9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IC1kb19pbnN0YWxsX3B0ZXN0KCkgew0KPiArZG9faW5zdGFsbF9wdGVzdDph
cHBlbmQoKSB7DQo+ICAgICBpbnN0YWxsIC1kICR7RH0ke1BURVNUX1BBVEh9L3NyYw0KPiAgICAg
Y3AgLXJmICR7U30vc3JjLyogJHtEfSR7UFRFU1RfUEFUSH0vc3JjLw0KPiAgICAgY3AgLXJmICR7
U30vc2V0dXAuY2ZnICR7RH0ke1BURVNUX1BBVEh9Lw0KDQpJIGRpZG7igJl0IGxpa2UgaG93IHRo
aXMgdGVzdCB3YXMgaW5zdGFsbGluZyB0aGUgZW50aXJlIHNvdXJjZSB0cmVlIGFnYWluLCBzbyBJ
IGp1c3Qgc2VudCBhIHBhdGNoIHRvIHN1cmdpY2FsbHkgaW5zdGFsbCBqdXN0IHdoYXQgdGhlIHRl
c3RzIG5lZWQuDQoNClJvc3MNCg0K


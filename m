Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CD8D0BB5C
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 11:01:07 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.58])
 by mx.groups.io with SMTP id smtpd.web11.11999.1729767660188664577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 04:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Rtw6f+jH;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Rtw6f+jH;
 spf=pass (domain: arm.com, ip: 40.107.241.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=krdLhji55OQHg8SiGW0nxhB8zeocpalT5axsmo4UWXADV2erSyBYaOgnlSZyed3Yah9CfxdLLGudO8tGc37iskan0icVu6rN+adMgM9YEJBMQdk/ivDrKhnPMkVY2cV1tHBzhMiC4gQTHfDvKE4qQggoDJlRJTzxFaGBSrSCjkG70LbcBfFc9/kW9l1nzWLoZgljZsuMCAGwjUZ81uAkHYmpDxVVakIw3g8lplPu4Lz/rPHGww74LqwprmRv8N0cmoF79MnlCctjZE+IVb3EXpsydeio2/VmUO9M40yib0WCBJbL24iM3ko/zlIg9Pzgpc3r+hnO+Rmvud7W5YxmvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9DEKD3aiS1Ym6FV6gi9pSuMBaxPg7JN9DaY7RBgHXM=;
 b=BPE2gNSB7oTlC52BWXczcfSF709k3TOSd8FgLzPgZn83Q5+4DfT+tKVTMB2e5AM8mGvPhMLrawtHy7lWKgnwOFDaNR6GB4tMcsL61O0VNt0h8eIZPBrZo6vjVM70jq+VxwLKe4io6Q3QaWX75eKA9hC/ofMhtXwIEP5ixlOR8RVWnymrHJ2x2+kvwAPiJs7lrsrs+bgVa0hdJsQkZ2NS4Nao/+YQ+AcHkIDVr31j/Dj77GdK8yd82zXaMM8XO7JwsU6bylr7v7qHX4++u3OqITpmXL42QQ06zCu6pwMCBnU217cyQ6gg1jeOI4Alr6N4MvFsbWNtoTOFSn/zJ/SaXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9DEKD3aiS1Ym6FV6gi9pSuMBaxPg7JN9DaY7RBgHXM=;
 b=Rtw6f+jH6mT+0qqRfoo1GpLKjaHpwBe0iqFv8nrZIyl+Y69ui3gnIxapQtLcY+2pMQtC3kmviNX6vwUftFroCgO1I4AqEuJp8f7/8tr056o0l8G4mqbylo3uqpnJAR0Z/KUluAgxBkTSmgF1FWsVoJG6NR5tdkyztIDcgxzwIu4=
Received: from DB7PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:10:36::38)
 by AM8PR08MB6514.eurprd08.prod.outlook.com (2603:10a6:20b:36b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Thu, 24 Oct
 2024 11:00:51 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::ab) by DB7PR05CA0025.outlook.office365.com
 (2603:10a6:10:36::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Thu, 24 Oct 2024 11:00:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14 via
 Frontend Transport; Thu, 24 Oct 2024 11:00:51 +0000
Received: ("Tessian outbound 4f9bb016c0c5:v490"); Thu, 24 Oct 2024 11:00:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 943e5b9cce675ffd
X-TessianGatewayMetadata: oacpz6KrBKzwZ906e5/8/jIDrRp0oebGIYU6U3+y8Sf4rsUL2DhaEg5uC6f+Lc2SSNmsDAfG4hKS0zX5VbaIytBhYsyabkoSvd+45PKatagLswi/+RCGgTMRiOK3LpbBI8Vaj1FizqUuhLaEOpkJgIJacMyqr9lYz19QfjOknIg=
X-CR-MTA-TID: 64aa7808
Received: from L93713ec06616.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 12E65EA9-D04E-4BA3-AC82-D440621726E8.1;
	Thu, 24 Oct 2024 11:00:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L93713ec06616.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Oct 2024 11:00:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHSmKZsN87LU8yp5IWmOdWm3kbSU2SIwFGeQRkFxKxCuBC4y8ZwsI6C4B8O25igp4ozlNP4rGwNDQiBTx3rtOwDTX6WWYj+ZLqU9S7KUdz4+v64Mm/S6ocaEOFVfPBuZQ1I8mbaguo2jaH6mefgiPBrZh46LoT1JThhdoz3Jo5vWPjkvLwRaDlyWxBxg18h1s46VWFapVHrTENjOVAGj0zf/lIvS14ityWsSOeqDbUVtFYhs6ck8rM0oNjoDyJt/bK1JoXxxrGqJ86VchL0Rn3+oWwwXSHYbeMUZac/MBpcgnqDjYlwR32LzlvIVgSDmtAZ1J6xstNudv2eWbmCgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9DEKD3aiS1Ym6FV6gi9pSuMBaxPg7JN9DaY7RBgHXM=;
 b=NiYreFJfh32hVIhBZonsizKBz5l8Iafqo9Zcwi+Egcg+HXYYuCLEHujkpz9kr290/1Ul4vh5P01vpWg1TfQDzhh2PoJSFANnN5flTmifdYNdT/PRhcZ7alVNU7OPKaLkBsptUghrCALRWfd8lDvEOi7LA3Twko9Pvjsw9kmTdVFXQdwmg1dpRMwVHeNKhWVBenYAspe/StkSrX+xhUHWpJ2ZmZqKKPle4mnW4ut4ctrcL5G7OZ6szrkqbTMtytKc2eoQhL0X4yFlszxipN+8k5Cc481sbkDWjQWiSLeBO7vDLLhrXRSTxgsj+YjvB2xYW3h27EcjCtyJ517ZvEbeOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9DEKD3aiS1Ym6FV6gi9pSuMBaxPg7JN9DaY7RBgHXM=;
 b=Rtw6f+jH6mT+0qqRfoo1GpLKjaHpwBe0iqFv8nrZIyl+Y69ui3gnIxapQtLcY+2pMQtC3kmviNX6vwUftFroCgO1I4AqEuJp8f7/8tr056o0l8G4mqbylo3uqpnJAR0Z/KUluAgxBkTSmgF1FWsVoJG6NR5tdkyztIDcgxzwIu4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6372.eurprd08.prod.outlook.com (2603:10a6:20b:369::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 11:00:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:00:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "danismostlikely@gmail.com" <danismostlikely@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Dan McGregor
	<dan.mcgregor@usask.ca>
Subject: Re: [OE-core] [PATCH] ppp: make pam optional to avoid host
 contamination
Thread-Topic: [OE-core] [PATCH] ppp: make pam optional to avoid host
 contamination
Thread-Index: AQHbJXKEJr5bCCZEbEmTRcdnbOeeD7KVvPkA
Date: Thu, 24 Oct 2024 11:00:39 +0000
Message-ID: <2E288CC5-EDBF-4AA6-9F48-9DC45C171188@arm.com>
References: <20241023173911.1411724-1-danismostlikely@gmail.com>
In-Reply-To: <20241023173911.1411724-1-danismostlikely@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6372:EE_|DU6PEPF0000A7DD:EE_|AM8PR08MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c04825-1d0a-4f7c-9c1d-08dcf41b1fd7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZlF2SDBKa2toQ3hwUEIwR3V2VUpMWitmejkrRlpPY1FNL2FoTU14NVMxMkdl?=
 =?utf-8?B?VjEvK1RYR3hTVUJ0VGxtTnYxcHBnRW5pcGEwa0hYVko5eXBKU0FSRE9sdFBD?=
 =?utf-8?B?TjFLMjYxL2tSUE8xcUV1aDNsQVVUbmRPcDF3SnZZcTFlVFZTKzFGWVVvVHJv?=
 =?utf-8?B?VDRKdTAzN05wWmY2c2lBTEdhWTc5eWNmWThqaDlXUDF5RHM4M3VqdTI1SXhU?=
 =?utf-8?B?S01Oa2FhbDU3R255LzJuNGhkdVBOTVJiQjVQWmFLZmU0TkFlbHpZR0QwTEly?=
 =?utf-8?B?VWR1TGYxRnNOR1Q2NUpNKzFIK3FWVjFDLzU5RXpBa3NMOWVqdWFRR1pNT1lU?=
 =?utf-8?B?TXBkVk51ZGEySkgyY2N6VndJcWRXQi9qaDREaG05SzFiTmdZc3FtV3pJV25l?=
 =?utf-8?B?WE1aRHBaVHhEem4rSXRTa29zR1JUSHB6TXNnWWVpRlJWNzdYaUEzZmZ0anZa?=
 =?utf-8?B?TFR1Y040aVAwWXBKcjh4NEtwYzFxcXBHY0tqaXpTWDRIc3hveGM0MUt4Q3BL?=
 =?utf-8?B?NlNQaFVsa3hzdDRSalcvbG9UYjVyTnJvZE5WVU94ZzV1anRjUm5kOGY4enNj?=
 =?utf-8?B?ZVRuMjQ1anhrNmlMd0NwR0ZJVytWbWd4YisxcHJ1TXptcSsrZmoyTlBtYXVP?=
 =?utf-8?B?WkRDN2hGWUFmNHJ5bGZZenZRUFFJMnpDN3RoRVJCWHQxem5HNkxLVFlFTk9u?=
 =?utf-8?B?WVYweURCWFF1WXZDelZXK1RON3dtR2tUT2ZZTWxSdURKVUNEZFJ6VElKVURI?=
 =?utf-8?B?MnJiT25jT0U5SzEyWTl1V28yTHJOYUNqZEppczJzMkppaGVrWUhUZ0tqQkds?=
 =?utf-8?B?NTFRbnNDWi9Ra29yNjFuN29UemI0U284cjZ0L2NYRVg4VE4yYklJWnJSZFRT?=
 =?utf-8?B?OWMvNjVvcjFwb2E0c1pBcDV4cUZmWjBSa3VzZnZLaTNKUmZFblVUR0pZT1Mx?=
 =?utf-8?B?NTN5bGY4b09KYnVDQTRKay9LRGxhT3lGZXdUWFJqZWNvR1hSUy9KRmVaWFVD?=
 =?utf-8?B?QzdmL0NnVkFlZ0k2YndBOUxtd3ZPMTVGbkp3bE5TYXEwcE1ZUTFHMTkzMnBa?=
 =?utf-8?B?QmhOR1h0WW5jQXo3eElVdit4dWVqc1pia1N2QjhVQVc5dWtFWEFIS3gyZndq?=
 =?utf-8?B?OEx0MXZOcy9xRXBsWXpNUFR4OXJQb0hGRWhKbjZSUWdSTHB1bTJKRWJqWVBr?=
 =?utf-8?B?d1c4TFFzUkh3RjB0T3JWMlpTSVgvUzZFeVNHM0xrcUVMZFpIb253bXdZNGlD?=
 =?utf-8?B?VE1sWi9QZUNhclhRYW5jMVlXUzlubGJaUFNLN0xCMy81c3RNZzg4SUg3aHd0?=
 =?utf-8?B?TzBPMkQ4TlU2b1UyOEtpcVlRWWorSnIvSnQ1ZTBHL0tVNlEzWlJCZDJGS3lr?=
 =?utf-8?B?Vm94M3lHSnpqQmxSNFloMWNyN29QYU00K2FCVWpOYmpuTm10M0VwNXRaOGtY?=
 =?utf-8?B?aGUwUjExKy9UOFF2UXZ1U215aTZkUVp3L2dBbmZCOTltZGhaOCtBcFZ3TTVk?=
 =?utf-8?B?R2tMQy9PRnRpNlFlWVZycjFXNmRJbmxZU1o3UWsra1hGRjNKd1BtZUlLN3BD?=
 =?utf-8?B?QU9LenIrQWw1dzlKK3ZUU3FvWlNHMkptVG5ENnhTb3owUGJXbWJYclZDbjdt?=
 =?utf-8?B?Rkp2MHFzb0doUnlJRC9OVGhDNXFUS2Z1bmlZQW11d25BOWpRZFlDTzV1OEF4?=
 =?utf-8?B?blFqZENUWXZpNy9VYXNNRzMyMjR6bm5nNCt2VmVuTEdrbDFnZUFubktFQUMy?=
 =?utf-8?B?N09uRlR3MWVjVFFKMEV0MFJPVlRaNm51MmR0NnlRdXdSQzVoaDJkcXdhWEpF?=
 =?utf-8?Q?FXaQCJRmQHfqUEgw/3rfXwdAPFKb96LkbFwRY=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0939493185B49240829AC4EDEB0F19E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6372
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	99822635-6bf3-4c60-8f9f-08dcf41b1871
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bEU3STd5blFpY0Uzak1sYnlKdXpuS2tQOEI0QnJUVGJ0ZUN2ZkNQRE9CRkZ1?=
 =?utf-8?B?NllKWXFTZnpGcTFQNWRzTGI1OHBGVjg3emI3bG1VSHNaUkh6TVRyODNsemxZ?=
 =?utf-8?B?eVZmODB3ejhuU2ZXUTY0THVSamk5WXJubm1NSlN4Nk4waDFEV1ZVdEo5OWR6?=
 =?utf-8?B?MnhQWmFsWkNSMFdubjNxNkhyOTVXUHF5bjA1bFpDMWd4d1ZhVWpJcXN1VHdJ?=
 =?utf-8?B?Vysxakd5aDR0dklhRVBlWHExT0JoN3ROWEN1aXJ2UnlPb2NNazF1RFgxc3o0?=
 =?utf-8?B?RHdGWGRKMFh4bVQ2bmNkN2xySTJocDJOeUJDU3EyZHJIR2RVbEhTSjJOWHRY?=
 =?utf-8?B?WVNld1lxVVBqdXFJU045aVUzS0xuTE5UOVRCOGhRVEdnaERiTi96QkVkaHdD?=
 =?utf-8?B?emp5THl1bzRBZlpGZmlmNGp1d1JPWWZZSDdzSHhFemNFaWFtY0pieVkzZStj?=
 =?utf-8?B?QXpVZmN6T01PM05BQm5rKzVPalpQVE5SUDBzbDJGaTRuQ2VjMWQvd0pmVlZD?=
 =?utf-8?B?OXBTWEFDOFFhaVBFS2NTNEVEbVM0SWNwK1h0aUFERFNNUCs5MDZmSG9JSmk5?=
 =?utf-8?B?TTd2TDJEMFVJUzZKOFZ5OUR2Tyt5aHBFY1VIQW5hMVovVUNjZjNjWCtVaFph?=
 =?utf-8?B?UjFwZjQ4VUxSdDZ1QjFzNmpTZUNQcEN1Ly9mbHY3ekRiSHM5cU94ZFRDUzlr?=
 =?utf-8?B?bmMwaVRaVXIxVUpMQk9mc1NPQUZUai9jSjhicUQxbHhmR1hoWS9JZWsyNjBV?=
 =?utf-8?B?cWs1dzg5VElZZk9MRlRjakFOVWZsck9idHA5RklWNmlqRXp6K2czdTd1Y2U2?=
 =?utf-8?B?dk95NU9sN3pSQWUzOWVhZldFdzdMMlhyYVp5U3I1TGhOOXd6Q0FlUlFpendD?=
 =?utf-8?B?VEZ3bGg5dXdJWVFSbzZERDdJRXNocmR6ZTE3bDBvbDR5RGJJZkVBaldWUlRq?=
 =?utf-8?B?S3ROanpJbHdiWUYyM1J2SFl4TUlrZXBuYWhyU2hUR25GMi84N3FEU2Z3ZlZO?=
 =?utf-8?B?TVJwaFE0VHFXWmZESkxpdFBlL0tyTjZwWUMwYlhGYzlJa1BsemEzNTFhMDRu?=
 =?utf-8?B?UDdTcEgvYWh4bHN2K2Jlb3lNOVJCWEthaVFFK2JhUkJtK1BpSVU1Y1FUWGRQ?=
 =?utf-8?B?M2ZnQ05HMEpxTEYrR3lvMnlFMFVTOXRjcjlSUjhhcnFTTnN6RFQzODluSnpW?=
 =?utf-8?B?c2NjWmlxWkg5QmZWQzRkTnY3NzlSNi9qRHJBM3B0YmdhbGhhZHdNSS9GV1Uz?=
 =?utf-8?B?VDFNZ2h2TDh5OUZOTWVMNG1SWmY0dmZIRWlhVHZweTBRWURBalhtV2hsckwv?=
 =?utf-8?B?T0k1QVJMcjdVZGoxekowY1EvcFY3aGpQSXM3VGNMQklMM3VBeENDVzl4NGpU?=
 =?utf-8?B?VDRXbHNOcXpPSnNSSllrSktGbUU3VjB3V0o0VmpqRU9sUFMzVkdmQ245Uzkx?=
 =?utf-8?B?MmRjT2IyUWRCMWZIdG9STEhYeDVIR2FpUlA5TklyaUhuZHEyTHFIOXI3MDl4?=
 =?utf-8?B?NldaU1UySklXdlZIQWdyK2syNm1nWHNrMnV0WjF1UDcvdTZDZmMrWGFhOEkv?=
 =?utf-8?B?UzhYeU5IdTBJaXNFem5MZTZacDJKclR4RG1idVlKbXZyVStZZlZPdzFsSTYz?=
 =?utf-8?B?eGhsc050UnduMy9lNnZmRitlZUxmVzdmNW9wSTRkU1UzWXgrR3RkclNQODhN?=
 =?utf-8?B?b0g0cTJxRnBYOC9JVFpHR0NsRW5oeDc4T1NzbmtQM0p5aW9vRHpUS09IQVZE?=
 =?utf-8?B?TjVxSElDMkx2S3RTck5BS1ZNT01sUnA5YUxUcEFKSnpONUI3aGpobVE1d2Fa?=
 =?utf-8?B?S3hBNC9XMTlOOHVneGxuNW9aNjhFWnF1WUlueWphajRXSFB1R25OZVFVSVNQ?=
 =?utf-8?B?ZlUyNmI4ZWFiUlJWVHJQSGxqeWFvaUlxUXBsVTNDbS9PQ3c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:00:51.5286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c04825-1d0a-4f7c-9c1d-08dcf41b1fd7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6514
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 11:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206288

T24gMjMgT2N0IDIwMjQsIGF0IDE4OjM5LCBEYW4gTWNHcmVnb3IgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGRhbmlzbW9zdGxpa2VseT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IFRoaXMgaXMgYSBzb21ld2hhdCBkaWZmaWN1bHQgdG8gaGl0LCBvbmx5IG15
IHRlc3QgbWFjaGluZXMgdGhhdCBoYXZlDQo+IHRoZSBwYW0gZGV2IHBhY2thZ2UgaW5zdGFsbGVk
IHNob3cgaXQuDQoNClRoYXTigJlzIGV4YWN0bHkgdGhlIHJlcHJvZHVjZXIgd2l0aCBob3N0IGNv
bnRhaW1pbmF0aW9uIHByb2JsZW1zLg0KDQo+ICtQQUNLQUdFQ09ORklHID8/PSAiIg0KPiArUEFD
S0FHRUNPTkZJR1twYW1dID0gIi0td2l0aC1wYW09eWVzLC0td2l0aC1wYW09bm8sbGlicGFt4oCd
DQoNCldlIGhhdmUgYSDigJhwYW3igJkgRElTVFJPX0ZFQVRVUkUsIHNob3VsZCB3ZSBqdXN0IHJl
c3BlY3QgdGhhdCBhcyB0aGUgZGVmYXVsdCBQQUNLQUdFQ09ORklHIHVzaW5nIGJiLnV0aWxzLmZp
bHRlcj8NCg0KUm9zcw0KDQo=


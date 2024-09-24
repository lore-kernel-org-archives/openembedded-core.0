Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6C1CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:37:43 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.83])
 by mx.groups.io with SMTP id smtpd.web11.11622.1727177856052532096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kEZdRNj0;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kEZdRNj0;
 spf=pass (domain: arm.com, ip: 40.107.249.83, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dmE0fTY4IgLi9lE3bkElWWEs+BEABg4C+6iKKBsqPL9tGATJRZTt2T0Rnhd+p/hb1fPoO+/PMSq7KjCwgD0+ZwlhHhJguYUECVLrdv46a1qia+Af6rcRUDqBqNenKgsqB4DwTEm+WWZPF16btbM+jcMC1HX0iYM9NbT3mVazY+juqzJ0uPPtrJbU9vqUWHH9oX2FbEx4YiSuNLhpD/+Igbxz0rk842hbejmbExEcx7n4FItf0JCbo31TcJkIbA4TeNxqpU6FarEdxk0HHCA9zP0YrjffwTsihEXhaSuBPGZz5R39qEsXaUgcyP478gc0iPLhWHtC47dekmuo0DbnnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhyH1LXY2rXp3Z4+X6rWXKi5eBgQe4JE/roIA7CWAM0=;
 b=ohAIrVaNPtRvYbLaLd8pFyEWcsrVyf3UpCTvLrvSW1lBdc3EeAzs03UtCXhV81rA1QVlEPPDGCVFIL4blYYtwl7MMk9O60NKa4wVduMcRznMl7mbyeu16QygN15xQvO/fCiywml4Xn2WfJXIMVdfjhQctEwIysGjs0rMBgOY7bfyT9gFBIj3B28APBcdfcAkHwoM/BOtx/i5nRZf/DmK6zWDlKdJlz3xy8+jCIHfF0eE/Vlt2wrT6JB1ZnL7NqRsOtTYkY4wCrOUm4q/Y4SyOWYPfeOu9Uupj1B6k6fDouR3mFbzFJcgafUuXh8MtCpd58A8GFVVuMXtQS4kZn9bFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhyH1LXY2rXp3Z4+X6rWXKi5eBgQe4JE/roIA7CWAM0=;
 b=kEZdRNj097oa7IKxDV+kMevO89xhO6RN0x5q6/w3tRiPgzrOYAiPtTlI3y7QI8c1JjtslrvDJMy0duzqnYTmBB/MPnZ33erxLlL/7poDVFEmQTTWxa+WQZjZ+d5J/hpk5CbHKA9iM+fu/CcvHHIC4gnf2NXPeNpn3QYvFJ9/z0E=
Received: from AS4P195CA0040.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::28)
 by AS8PR08MB8395.eurprd08.prod.outlook.com (2603:10a6:20b:567::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 11:37:28 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:65a:cafe::c0) by AS4P195CA0040.outlook.office365.com
 (2603:10a6:20b:65a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Tue, 24 Sep 2024 11:37:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8026.0 via
 Frontend Transport; Tue, 24 Sep 2024 11:37:27 +0000
Received: ("Tessian outbound e9f81699740c:v465"); Tue, 24 Sep 2024 11:37:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06ba39a91cd97c52
X-TessianGatewayMetadata: t1D1UXULlBTqvQUDC0iYA7GrqSJ+1Pqa/zHX+w+wH7iUa+2XqP9tNS++WDQaiUPc4jSdZHx7E4jW7jzMbqq4HHugbBny46uwBXdNMusktT74xHLtZRetc9k16yY6IHoDVBCfU8YRfvObOPZLJGALZA4aF/0nqUFYhCq5orWj32M=
X-CR-MTA-TID: 64aa7808
Received: from L863d9a23b08f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 92058BC2-B0FB-416B-B3A3-F5B3BC7BE04F.1;
	Tue, 24 Sep 2024 11:37:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L863d9a23b08f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Sep 2024 11:37:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akawF15Vb/UDRR3o5RnjIl05B12pRO/4KkhnCwUbrkSRQdgjTNvO24Qp0268kW8mbX9oJUIqGqHDihI9h1huurMtq1LecGI5Fc6onaCmQg7ehPjjcQ5SgOwIZhSiOuJE9hPAD5w6RBJnAEoabH9W5aqvZc9H6qe9X3pyD+W2CPDXw/75p1zkkwPh+BWQPlnZoAcjYcnOC3OQdH92PbiHzyyDzpvI84R0WBPnva3yDRqVVq7OCCDkDB0cDGbDF36ThQJ+P5AExTX/LQ4TM8oAsWhJ//EDlNx85k+CjjiuKVa6KnNyR9PRNL82lk8mOSLi+8WUS9/kxkOfO82zEkVlAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhyH1LXY2rXp3Z4+X6rWXKi5eBgQe4JE/roIA7CWAM0=;
 b=SmfEgvKKg1WPEmd8Y4qvPa3/E9iF/H8heuxMYhluGX7cPl60Gg/HLdyaOq97EwHBPdZ/keT2J32V+NXjqX/25IKhk/2w1o92DJVsRvdvLn7SRJBXJu92i0cWQmzzTi0xnMfX0eETzGlWyB8hO2dx7ADqbZGrYIuu9IHSqDEBDC3hPmPH7zzQnZ/YLcWV9wC8rh8tH1mazBRlqS9p1xZGKEbEbNq+E9J6x0yip3Qlvqq/o82OGtwjjc7tmPH54ry+GL1xGg3BLs4XSIyrioBkh0gJHsZSm8D7DVBD6qXBpwpktVMDc69KdMkCeU5Cf0n45rOqcwAE6fvQ++1PvPz3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhyH1LXY2rXp3Z4+X6rWXKi5eBgQe4JE/roIA7CWAM0=;
 b=kEZdRNj097oa7IKxDV+kMevO89xhO6RN0x5q6/w3tRiPgzrOYAiPtTlI3y7QI8c1JjtslrvDJMy0duzqnYTmBB/MPnZ33erxLlL/7poDVFEmQTTWxa+WQZjZ+d5J/hpk5CbHKA9iM+fu/CcvHHIC4gnf2NXPeNpn3QYvFJ9/z0E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7798.eurprd08.prod.outlook.com (2603:10a6:150:4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 11:37:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 11:37:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 1/3] gtk4: rename tracker dependencies
Thread-Topic: [oe-core][PATCH 1/3] gtk4: rename tracker dependencies
Thread-Index: AQHbC3MBAZ3o8n2OIUO+E7mGcb1XXrJm1UEA
Date: Tue, 24 Sep 2024 11:37:14 +0000
Message-ID: <48A56FC3-A306-4DF0-930D-E55E9298F0B3@arm.com>
References: <20240920153708.1774041-1-f_l_k@t-online.de>
In-Reply-To: <20240920153708.1774041-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7798:EE_|AM4PEPF00025F97:EE_|AS8PR08MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 91aa5393-b406-472d-69b0-08dcdc8d44a6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YmhLVmlURVVVYkxTbkJRdjRuWEpzZE9GN29xeVhtQTRTcktBZUZxM2RTNEZF?=
 =?utf-8?B?UFViWFdISys1NWx5NVp4a2pSYlVDbWFuWStUQnNMV3JiUW5zWmY1UDhwNXRO?=
 =?utf-8?B?ZUE0VERCejNDdFdnZEIzZXY0dWV2Q2taWUFNQWJWMWZSakdBSFdrMDFoR29C?=
 =?utf-8?B?N2FDV0RNaGUvamRsakFXVkhoRVZLcnVXZnpCMjlXTWRGcWxsR3YwWHdNYnZn?=
 =?utf-8?B?QWU2MElTK1U5ZU5ZZ3ZaZkNSZjNyM2tqdmcvOWZRUzdkYjFHZ2Rib2c4b05q?=
 =?utf-8?B?RE5nSURFMHU2N0FQMDlpZTcxR1RBUW9QWlRFeFNYcDh1QTQyZ21pNmhJZVJu?=
 =?utf-8?B?OVh1M0FtR2c4SHhYQStoYm83ejlzSDhqWXJyUzlqUE5UWm9tZ3RNN0ZrQU01?=
 =?utf-8?B?V2IzWWptYW5UaHcvQjFxQkxSeENHNkFkdkdFbnVSWldRcHluUDlINm5nTkx3?=
 =?utf-8?B?UGFkc3J1anNXb0hmVm5sdEhBQ0E0QWd5T1dqbzBSZEVVUkhwQUxTdzc5amtF?=
 =?utf-8?B?SFZvYWFSbmZaWHMzQnoxZ1dwek9pb0cva2xPNklkVnoxK1d3SlhGenkvNWdU?=
 =?utf-8?B?Ryt5dEFpRVlISTFuckUyWnV4ZzJNTUlvb0hrNi9PTEw4R1BpM0wyY3VPelBH?=
 =?utf-8?B?NDlLK3NCR0RFT2hmL3Rna1NsUzlPM0ZMSWtDeGExemxSaG5JclpFMmMybWk3?=
 =?utf-8?B?ZXlPNFV5R29IQTNUU0w3VFNLZzFHUTYwNzVzRC9icEo1eU0yWHh3anUzSnNZ?=
 =?utf-8?B?SVhOa2RpSjVPWFFXVHZOWVM1czFONlpPb05saE9TTUtSTzYyWXREcTF4Sk1G?=
 =?utf-8?B?N0wwQUNIZ0xxUURTb0M3eExuVWF0eE5yUUs2a3o5M3l3Sy9DZExocm1sZTll?=
 =?utf-8?B?K3ZvNzdOdTBaTlVvOFlnaE9RcFI4b0M5NWZPa0NwQkgrRjlrOFhNdHZFV3hY?=
 =?utf-8?B?WnNwVXU5OHdMQ3R0MXpVb1A2dDFXNGk1dkFHRXFLMWFHWGVPc2V0VUV4S0ZP?=
 =?utf-8?B?bjFDaGx4Z2IxZ3daQXlNZTI4KzU0aTMzU1hHT0k2dEhkcHJMR0dKV3VVQ1k4?=
 =?utf-8?B?NFVzbGhmUW92R2lmODhNVkJTQW1iaDRNZCs5SkY1akw5dzl4QkdaRUxGYXcv?=
 =?utf-8?B?NlVlT1d3VWZFRWpnWUg2OE5hZzFCV0xDSUxleDhwZDBlRm9kaURTcnhER2w3?=
 =?utf-8?B?S2dBVkN0R1Npa0hmd1VReXpiS2l2ZlM0MldmV1NWcVczVlZYRXV5bUl5Vlpx?=
 =?utf-8?B?M2t1QVJDbmwwMFY1UkFxbjI0NENLNUlQd0JlaXFrK1IvSUcxdU5hTjNLUE5N?=
 =?utf-8?B?VGo4YWNqdWM0K1pZWjloYUZSeHZnY1BjLzRwTlNZN2lTRVhmQWZ1eDlLYXZL?=
 =?utf-8?B?eDhQNm9sNGFMQmViRE8vQXVmWjQyb0M2MHdSWXhrdG1RVEpvZGxNNU1JcVNn?=
 =?utf-8?B?cUR3RUQ3Y1dMcjlCMzlkQjBRZnd1bUxuNVhmTS9pY2lVdGM5TS85VmloYU5a?=
 =?utf-8?B?dmhiYU5NVXZkNWVIbjl6ZDU4RzdOYmFPdUF4Z2o3OFU2Ymp4VGNRL2huTjQr?=
 =?utf-8?B?MWRSanh2TXNWdkVBdGlsNWFXRFJhNHZmTDlxYzRsemVnTmxrN3NSUWVoYW5H?=
 =?utf-8?B?RmZYUi9kc1FRejloWEhWUDlPVUxYRFREWFpRcnlWUGQ1bXBFZ1ZOSTVwRGxO?=
 =?utf-8?B?N1RwNXRRbUpWNFlWOGZFTEJNVG14aHhEQ3gvOUpFZEEwa3BQOXJFQmdla1F0?=
 =?utf-8?B?Vmx2RVBVc21tRlV1ZUhpaGlIcTRCOUVWY0ErTWErMlRONWNUY1BTc2phYUo3?=
 =?utf-8?B?cGhldGV5ZDduUkgvVG5tZz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C21602E6932E174FAB166026B34B0F26@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7798
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	491db12a-751c-4364-6667-08dcdc8d3cdb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUZVbzFidzdzYUYvWEI1aFY3Q2xpRnNFZVM1VHp6dGZ2WHppMWZJQXpBSWUw?=
 =?utf-8?B?M0NjaVVSbE9yU1ZEZTVRcnBobjJzWTQvNEdQOGQ1YW9VSUpSWWpyWVVRNzNt?=
 =?utf-8?B?SjlRc0ViT1lIY2d0Ly9QNkRBMjlWK1NuNWdxWXJEU203U3JtVStDSGI1RFJn?=
 =?utf-8?B?VnhaZUlLL2lxY3I3QlRxSEtDSTY1QVVmNEJ4NzQ1cjJ4Z2toSS9IRytqbGIx?=
 =?utf-8?B?YkdCQUFCQzFVM1VkbENxR0NsRmVvbmN6QXVsUGloVE4yQkRqWUF4cEd3RW9l?=
 =?utf-8?B?YnJkeEVXc3htSkVDdHlZZ1hUM0xPcUpsTHJlOE1mOHl0MlRaNEFRZ0NhWE8z?=
 =?utf-8?B?Nk1GZlg5U3hrWmRtRytMOXptS2NoUXdDU3EzMjZTU2ViYUNJQ3VrSDhLZzJa?=
 =?utf-8?B?azlCQTBGbzZKOVI1UnVSVkN5dDZqRGhTdS9uVmJzdDlaYlZmYy92M3R1L1Vy?=
 =?utf-8?B?eHY0Yk1VeE5Pai85b3lTeVFyZm1qazZUUW9ORDRydmFpRzRuMFlaeHQyK3NP?=
 =?utf-8?B?dWFpcWFBdmprcGdqRGJ4OWZqVUdsLytNTmlTV3RSZzR1Q0dRR1VWMXowdG45?=
 =?utf-8?B?VmlTQkJyc29iRWt3NndhTDFWUnpTMnpINTVHWGg4UnVxU3M1S3lLb0JMd1Br?=
 =?utf-8?B?VW9iWU96bFljRWxjMkhzQ0pDc2xIUlpOUHNCd2lvSnJFam0rOHFpRE9WRzFR?=
 =?utf-8?B?QXBIWWRvdnpPdkZpUE5HeGNwMVBQQ2RNY1hEcUk5ZUx2TkdFOC82WDZQNHVs?=
 =?utf-8?B?VVc1SFp6djNtMWl0MXpwSloxVTJGRThRVnlPSzloUXhnRW5VcUVGbGw1dU55?=
 =?utf-8?B?ckpOa1RlM1VTYnRSV05Bem8wcDZrNlljL1Y5b242UnB6T2NlVzVvTnVrWnl1?=
 =?utf-8?B?WDRoNTUvbWIvOTQ2czVIeG12ZCs1TUxWaXVLeVoxR1cvVU1ZSEZqWUY3REwv?=
 =?utf-8?B?NnVxZjdFWkJLc3MzRW5SbE0zbUlLSnBSOEZzaXpMVU83eXh3RnI0WnJVK2Er?=
 =?utf-8?B?cGhKV2JWaUNqeHNkOWZRUGxueWNlTlJocklFS0R5R1ZvRmVMbE5QTzJDeCsw?=
 =?utf-8?B?aDJ2YjhRR3I2aTJPZU1PZjIwODF0UDJJNzU4Sko4SmJrTlFYbHRDcU4xci8r?=
 =?utf-8?B?OFlQcWYyVjU4SFRuN0RUeUNFYlNmYUtvaTF2UVE0akE5S29CaUpiRnp6YlVF?=
 =?utf-8?B?RW83eWtxSkh3Q2l4eCszZ3k5NFEvRDdsNDExcHJEYjhFNVNoNkJuQzQveG1M?=
 =?utf-8?B?OU5sNjk5ajJlczh3bHA0U2FQaEdVMG5HYUtJOHJuYmo1bjR6ZXo4ck9BejFR?=
 =?utf-8?B?c3lGa0FhVys0Yy81VlREY1h1a0tZbENHeGNQRDlON3NveE1ZV1lRcXBuYXdI?=
 =?utf-8?B?YWpDWURKam5tdEpISytVRU5FSmVILzlDOTZDelZ1Ry9MYi9RbVA3aVVOVG9i?=
 =?utf-8?B?cUdIbGUvVmFHSDZXcHRsMTkzOHlpQWRuSUROdEJkYkhOSnlSemZ6WnM0UEdq?=
 =?utf-8?B?TXNjNWp4b0NCYk5Qd2VyUGVrdllPZW5CK1RETUJZYU1STVFwam9qOG9oSko0?=
 =?utf-8?B?eFFiZUdPTnQ2K1Q1VVp1MER0RUJDZzFBaHFkL2lUSUIxaEF6eVNmajRDMzdT?=
 =?utf-8?B?UFhpc3paLzhQWTFvOHh0QWszV0ZXQzBDMlcwZ0RSWEhLcyt6aGl2R0ttbkRL?=
 =?utf-8?B?WWRXRmtGamk3ZnJkdm1GRUlGbEZtWmF5dUpJdW5pdlM0dGVtUGxmTG82eFRi?=
 =?utf-8?B?MzJFVzlqd3kyZjR2MDVCcFFLZ2dxeXUxdXNsTnB3eldqNkZhMjZJbEZoblZT?=
 =?utf-8?B?cFRRLytFSXRYbDdPcmlUZmNzOHpybXN6aURvMFZqQ2hzRWw2ZVJkWkxDWnB0?=
 =?utf-8?B?NEw4UlJtUlhpWnlxWGlONXlqeDduYmt3d05CYUFMaFBvVWFZTVF4YTZaQzIx?=
 =?utf-8?Q?lk5t7VU6QCsTmYx9AhrL76bKe1t93J1g?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 11:37:27.9555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91aa5393-b406-472d-69b0-08dcdc8d44a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8395
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204849

T24gMjAgU2VwIDIwMjQsIGF0IDE2OjM3LCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IC1QQUNLQUdFQ09ORklHW3RyYWNrZXJdID0gIi1EdHJhY2tlcj1lbmFibGVkLC1EdHJhY2tl
cj1kaXNhYmxlZCx0cmFja2VyLHRyYWNrZXItbWluZXJzIg0KPiArUEFDS0FHRUNPTkZJR1t0cmFj
a2VyXSA9ICItRHRyYWNrZXI9ZW5hYmxlZCwtRHRyYWNrZXI9ZGlzYWJsZWQsdGlueXNwYXJxbCxs
b2NhbHNlYXJjaOKAnQ0KDQpUbyBhdm9pZCB0aGUgc3luY2hyb25pc2VkIGNodXJuLCB0aGUgdXBn
cmFkZSBjb3VsZCBQUk9WSURFPXRyYWNrZXIgYW5kIFJQUk9WSURFPXRyYWNrZXItbWluZXJzLg0K
DQpSb3Nz


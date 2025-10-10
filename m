Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071DECAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 10:38:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.139])
 by mx.groups.io with SMTP id smtpd.web11.6262.1760092704183665131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 03:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=BBakZUYD;
 spf=pass (domain: weidmueller.com, ip: 52.101.84.139, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBq+ftvhWW0FJ4DqcBVBXcQ6Lp8LmTfNB6yPaM67sPiCJwl8VLRgFaBi6bhyJdBHtFX9jx+3/JkurQHJg7ULM7iQ7s6vshaCoIoQorumWcuyH0zwlnv4cJe32aizI1PUMnMdYeGLP8pOUkhJusKjoIRosjuSkL9CgK3wKQLPPmJQhIFhod8AXh/RAoYi0AdxQoer/VSJdsI0pKU0voZFUjpI/12fE3C1EjDGdrcLYsi2cNnRRnFbWJnaOEr0Vr964Wu6yXJAkwg/IWmdk4q/+R3Lkhn4b1IBrv5PQKLSIuPSyEHg0NxGdA7gQy5eMt+ccdIUYW7hSQghmV1KW9nnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uvOIoKe8Ajhw4t77ZVnboJZ2lnVfIlW8MSVqIVl54A=;
 b=W9xpVpRUL4HWy2zYeNKLC2unlXxuuB9WznFKdXgmVgPGPnhlBMwMOfRoIRnF85clGXtKsdXp3ERN4jgYr9+6Hz8kumqncQYjwAtzuOp5ZlPRTOS258WHNt+6AgjT2od2lgsaN+iN5vgm6awhOiTn5ZXxFeFrXvS8MJX7p+m0Dd20SFMGFPpIDGmXrfocUxzu6wmflhTDI9sGrPUV0esQKrAB+0Ndv7DKC6nKD5UifrzPXnrxOvMXENJswZEAiYqu3WSvE6yDeJ+cuU65kkeRxfbdWAovq+l/pp5GxOwAGCONe7HHn+pLAzHXiK8Amz4UPoZcX9a05GwrdAj78Lhixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uvOIoKe8Ajhw4t77ZVnboJZ2lnVfIlW8MSVqIVl54A=;
 b=BBakZUYDNuZctyKAKWnjaNYO7G6iXCvtX2vJG/etweMuUsejktIcuZCGENA9zA2J6mri/1ICEEf+Gu48C1rX1oyqusnYdxNcaGxY8uRlHBO0WrHXd03iSCR6v4e9rWAWF1hiVLNrMRYAXCUHyLeBPjyul3FMbIZz9HiZUi1KUK/Na9Ih9yd1yUmDm4C/E0iJYQlCUFcrAiQAfg6XT0rS4bMXPp938g8YLCsUjSZEqFMjUvJkAzk0aMVrpCpS+osQY6AceGxhknPdVzpcGFo6Zd7LXHd84+Bg68Yb12IRxDH+JZmhAZE/e/1MXbnWJHfS0LWYHeBN+QvMngkeDXDYjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU5PR08MB10400.eurprd08.prod.outlook.com (2603:10a6:10:521::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 10:38:20 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 10:38:20 +0000
Message-ID: <f918694b-93e8-46de-bd3b-d9556563aec3@weidmueller.com>
Date: Fri, 10 Oct 2025 12:38:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
References: <20251003213000.2256939-1-skandigraun@gmail.com>
 <211549e4-c4c2-464d-9b63-88c27d5bdf18@weidmueller.com>
 <049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com>
 <54596a81-b725-4d78-9c35-ff851e4b1113@weidmueller.com>
 <239994b8-47de-4394-bcf0-16dc91ca654e@gmail.com>
 <6f3eedff-44c0-48ca-86dc-c1ea8aecc9e0@weidmueller.com>
 <2e82bf39-47c4-416f-a7f4-783be8bd32d5@gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <2e82bf39-47c4-416f-a7f4-783be8bd32d5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU5PR08MB10400:EE_
X-MS-Office365-Filtering-Correlation-Id: b2468f28-bbde-41c0-378d-08de07e920da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SFhXT3pTUVB4Q3l1NDdYTlhrRGtuazRGTzcvMUN3M01OQVVFL2tRWnJ6ckIy?=
 =?utf-8?B?NU5tTnBwSWl6NFAyNEo2Ym05RjRtV3BDcmU2TDk4VjJBZDRmWjk1ckxvVFN3?=
 =?utf-8?B?Ry9mNlBxU1V3RXY5ME1vbDd3RVlCMGZFOHZmRkUrMmNGUGJQQmQwMzdmRzlx?=
 =?utf-8?B?NFUrZ0hjUm1tekU2VFkwWVNSOXNleG92cnk4QjAwU21PSitZd1BEeC9PTnJY?=
 =?utf-8?B?M1M2S0c5dFdGdFkyOEJxOTZUVTBGMGRPSWxVVEp6OWY4Q2c1T3A5c3BNdVh5?=
 =?utf-8?B?WTJqRnYyY2RTVXd0RUF4dGs0bVBBMW13Z2xGS2locU9VSWdTVWNwQk9nOWRr?=
 =?utf-8?B?ZVdkQVMyeHZENXNscVo4bU4veUZOSnpqanYzR2JORm5iL1h0L2twb2wzRk9J?=
 =?utf-8?B?dnZrNk1NNXBnYm1iU2JOUG9CcVpiU3o1dVB2cHN2ZDI4VFN3S3FIb0ltYTN1?=
 =?utf-8?B?UjdReGpHb2pQVWQrUCtjRGNNRmpKaUI4SVFUMUV6K2EwOXU3Z08xblZubFdy?=
 =?utf-8?B?azVtZ0JyejhhbjR1ZWtrdVlmN3V3YlUrV2N4c2F1MG1iWjVCTEhpZXN0eXoz?=
 =?utf-8?B?SmJra3hYN2p3SVVNeEhXN0FWWExSWFFMZHFkQnRwWUxKdlR0SUNIbzNsOG4w?=
 =?utf-8?B?ck9WdlRpa29OTzdzLzRmRWZWVWZPNTFiYjQzOUdTcUMwb1FVcDJZWXRZdG80?=
 =?utf-8?B?bnVRekdqUnZ2ZUFqYUM1YVpqaGg5cUU5SUU0UGhIbjI0ZDg1cFlLMi9qMHcv?=
 =?utf-8?B?V1A0MWhxcVdtY25tTk5JbklzWkVCc1VXTDRoRWhWOGNjY3dMY3Y3a2dsSDhG?=
 =?utf-8?B?enMzL1NidG8zZFNqNGxLZEhGd2dlRTViVXZoaVMyMmx3YnVIQ0V5b1hNTG0v?=
 =?utf-8?B?b2MxaUk3dCtHSVBtb2ZQQUF1OVRZZS8rNVlVRk1YK2NLYTEvMVUxd3RMK2JB?=
 =?utf-8?B?dm1KZ21CN0tBREU1cDloYWJaN1hjVC92YTJkbTZxTk1mRSsyYjg4RkhmTk1t?=
 =?utf-8?B?QVphdDI3RlRIckJpYXBaSmVHRXRvZWgxbGpNc2xuOTFSN3ZVQ2crSzhHdWZY?=
 =?utf-8?B?ZXRTUGFjK1F2UFAyWUlaY1hzMENvRG96MTMyRjJkb05GQ0RISjNETjgxTTRJ?=
 =?utf-8?B?UGU0c3I3b1R2TlRYT29UVlJUYURXTkpQKzBBbVlOY09wV3JjWU50eGttMmZH?=
 =?utf-8?B?RFJGS090M1U2U1R5Z0JaSnVWVm9PcWMyVHNVSlY4S3RBc2ZFRnVoKzVZS2pm?=
 =?utf-8?B?Uk10OS9Ua2ZqbFNtVXJJbmJobGZkVXZnM3dCOEtTaytEODl6UGl6VnR4VCsv?=
 =?utf-8?B?TnVwU1lVc0FQVUdEdE54R3lrYTMrQUI1ZGZBdmFUaWIvZEpqWXpoSmxMRStq?=
 =?utf-8?B?OUpveWduZm1wQllqekEzQ2piRkozRmo0QzN5N3BUMVljeTBLZ0gwOFNPVm13?=
 =?utf-8?B?djFycUYycHduSVk0V2JVVjJ1akp1R0JUcW03emZzS0IwTFdQK2RaMG51Qmxx?=
 =?utf-8?B?K0xVazlPeGluOWt2aU8vbkdtV0FqWjhiRS9oMjZaeTlEb3lPSWpGVGUzTVc0?=
 =?utf-8?B?Z0pyd3Q3Y1FNTlo0d3lPcnZwV3NSNk9SVzBaUUtaSmNHcVRUNVdEUlJSU0t3?=
 =?utf-8?B?bzBJQkhoK0hsY1lzWXRVazNESkMzZHdyTTdDem0zT0xNeHRyRVJzRjZsTjNz?=
 =?utf-8?B?MVpJWU9XMEpIWFJ1Zk84b3NUWXdod3FnY1YwQzZOcjhiTjQzNUV3eVB4MHlM?=
 =?utf-8?B?MGlMbEZkUCtXLzk1dEU0ZGU0RW1zdy9mczNzWWtQVUR3U0s0ejNoTVVIOU1o?=
 =?utf-8?B?cXJZR2I5Y2dPTmlNN25ramdYc21PZE5SdmtCNmw2bkVGM2N6OUZTVVF4a3ZN?=
 =?utf-8?B?Y3g5cGFEMXM0VUZmb1g0Mk9OZnBSV0cvWGRxSkE5THpqZ3c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aldZaW1hM2lGNmc2aUVDaXhyZU94UHJXSUx4ci9QSmpEWU9BNEZPS3JqMmdH?=
 =?utf-8?B?cU5QQW1BOCtOZ1l3WWQrMUtaZUJqY0VMUnErak9XUSsrVURaeFBXTWRFVnFR?=
 =?utf-8?B?ZDgxSnU2bDhrVUdXYUpxOTRCQVVpWkFJOVZPZ1RzWmZJR1hXK0xSSEpuS2tU?=
 =?utf-8?B?SnVuOEViTENsYjBJTXFLRlNEbVl2Q3UreFRJUTBXL2pGM1JscDQ0RTVNNkQ5?=
 =?utf-8?B?QzZQZ1Q1aWM4ZEp5SHFiWGJ3OHVvTVUybkk2dmcrSldJcjRDTGFWallwOFZO?=
 =?utf-8?B?UmhDYjY4QnJPYWl3MEpseTdrb0l0a01VUEIxWXFlTHF4Z3VJVnc2MCtwVnhh?=
 =?utf-8?B?Y28yaTBxUWwvOWhremE1VkFtOHJHVDV1UnJnVUFGRUZpRXZBZDkyb1RtdW1r?=
 =?utf-8?B?bnpadlpTRjhhUUVBYnFtL0c1RUpxM2lVcUhWdFBNY05vaE0zRUJ3ZXFWbjA5?=
 =?utf-8?B?TFRVSGhpQ096MGF2VVVmK05BZzlNdjFFK3B1RVVMZVR4bDM1WTNiV1l4N3dN?=
 =?utf-8?B?dElNeGtqcXV5TkI1TGFITHpXVWRhU09rS1kzeDM1TElmQkZuY2Q5K3JBYnFm?=
 =?utf-8?B?QTN2ZGh0Qkt3N1g1OU1QaExwRzBhNzlaMDhsT29wYTVtK0t5dDVCcWhYYWVN?=
 =?utf-8?B?WmV4RzdtU290NVdBYnZpaXp4WE1XYy9vMU9KNHNZQjQxTWJWQ2N1NUpnTHJ6?=
 =?utf-8?B?TUtiMGU2QTcvV05EaXU4NnhManJqNC9tY1J2YVFYd09kdExTVFRNRm9TWnpi?=
 =?utf-8?B?UjkzcmtCTFNnOUEyekZoK3ZSdTgrYTdiREhTejhnMllwOXNlRDlBYWEvYnQ5?=
 =?utf-8?B?ZUhiaG5RcTlOWWMxR1VpdE05MWdTSDMvUjdWdVA3cWM0ZVp4OTQ0a1gwOEgr?=
 =?utf-8?B?RGthUWxUNmxqN2M3L2YxNGV2VTMyQXNOa0k1Z2YvaUN4Y1BrVHdnQmtoeVdr?=
 =?utf-8?B?S2FvNGNLeU94MktkMmViS1RiUTRGalN3dFNTYU50anl1VDVWaXp6ZThGT0Yr?=
 =?utf-8?B?d1o2RXhmVkdyUXNQQXV6WitPWDYrZm9pWEltREdyQ3haQU1haVRYVkVDd3Br?=
 =?utf-8?B?SGFlL0FDZG1YNDNndGlUVjdVSVJIenhlc0pQUlhSL2lUL0g5STVpN2xjdjlX?=
 =?utf-8?B?U095NVZueGE4cWoySDJMOEJYcmxXWkZLcFVzWHZ2QVUvUlBxZSt0NmtRUDdq?=
 =?utf-8?B?SHFvVmRuRVg1U2M2bGprcnVoL3lOTzhlQ1V4ajdlTWYvZC91V08wQ1NIY3JL?=
 =?utf-8?B?QlVqZTZkeTdIS2RzWGV1dG1NeTZKdmZZZjNsQkhlbkpmRnZJdFZPeVRhUXpS?=
 =?utf-8?B?Nms4d2pSVEF4aEo1UU9HQ1JXcXgyS0ZDNVZZQllxdVd5Smg2UjRqMnJvMm1r?=
 =?utf-8?B?NmZFREFOMUZqNzJqNnBBeTlOcWNQaWxXdnNhL2xKZkRaNVNibUlMYTFPMHVR?=
 =?utf-8?B?OUp6azVwK1hSL0p6M2Vzend2OTZzOUFGY2JsV0ZMTVk4MVZCb2VEcnNBQ3lU?=
 =?utf-8?B?dTJObXJhSXp0SlpMZXYzV3lXcGVPRW8rVmQ5YVI2U2x2d3cvMm1hUXQvbXdr?=
 =?utf-8?B?cTVacnhoN1NIcGtRK3d1Vno2U3l4b0haOGlobjZicnJsTHN6ZFM0NzlKV2V1?=
 =?utf-8?B?alY3TXNvV2ZVRGQrTytzWEE2YngxZEk5Sy84NCtGYmRidE1uUmhWZ0RLaXhv?=
 =?utf-8?B?MjJLWnF2U0xqZDl6WTl4bGhJeitta3dqcVdCVFVFbjVKRWJIelM1UjUrM3pU?=
 =?utf-8?B?bUhwUCtsQVlZSGU4My9md0hKQlAyczd3b0pnSHR4QVVwSDNnV0NXMkdqaDF4?=
 =?utf-8?B?VytxWnJhckllcUVkNlVMU1dKWWFPSTZjVkZzVEcvVHo4OFdVdnFjSGJ4S3U3?=
 =?utf-8?B?L0hvTGFvVENvRC9yTFV5NXcrUFljQzZFb2tOSUt2eWF4L2NDNXh2NFNaeUUz?=
 =?utf-8?B?OWJCMkZRdzAzUGVJY05GcmhLRkRzRVNoNFE1Y3IzdnpPNWV4bjc4OTlTb0N1?=
 =?utf-8?B?cldqTjk2ZFY5Y0o0RklpUHRqaWN4ajl6SjBEQXkybitsQzVWc0M1ZTV2d3NF?=
 =?utf-8?B?RWt3dWF3eVpUb05WQU5qYmpUb3M4OVVOeExoaFg1bHJJU3RmakFGdGMxQUF1?=
 =?utf-8?B?TDRsWEMwSmFhUzVqeTI2WjFHME9tZ1QyeGZMdlh6bUJFVU5neVBtUDdHU3gx?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2468f28-bbde-41c0-378d-08de07e920da
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:38:19.5547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JCFwmlx4GdvBVLnGo3I4yV6WuOxsTLrrA3ZSntFOOKOG/pBJSHo4k5MTzlmCh5nOgJSUwy68PFCMqR/oiIpJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10400
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 10:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224677

Am 10.10.2025 um 10:04 schrieb Gyorgy Sarvari:
> On 10/10/25 08:27, Stefan Herbrechtsmeier wrote:
>> Am 09.10.2025 um 16:30 schrieb Gyorgy Sarvari:
>>> On 10/9/25 11:31, Stefan Herbrechtsmeier wrote:
>>>> Am 08.10.2025 um 13:01 schrieb Gyorgy Sarvari:
>>>>> On 10/7/25 16:59, Stefan Herbrechtsmeier wrote:
>>>>>> Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
>>>>>>> Cargo.toml files usually contain a list of dependencies in one of two forms:
>>>>>>> either a crate name that can be fetched from some registry (like crates.io), or
>>>>>>> as a source crate, which is most often fetched from a git repository.
>>>>>>>
>>>>>>> Normally cargo handles fetching the crates from both the registry and from git,
>>>>>>> however with Yocto this task is taken over by Bitbake.
>>>>>>>
>>>>>>> After fetching these crates, they are made available to cargo by adding the location
>>>>>>> to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
>>>>>>> that can be found in the SRC_URI is added as one source crate.
>>>>>>>
>>>>>>> This works most of the time, as long as the repository really contains one crate only.
>>>>>>>
>>>>>>> However in case the repository is a cargo workspace, it contains multiple crates in
>>>>>>> different subfolders, and in order to allow cargo to process them, they need to be
>>>>>>> listed separately. This is not happening with the current implementation of cargo_common.
>>>>>>>
>>>>>>> This change introduces the following:
>>>>>>> - instead of patching the dependencies, use source replacement (the primary motivation for
>>>>>>>     this was that maturin seems to ignore source crate patches from config.toml)
>>>>>>> - the above also allows to keep the original Cargo.lock untouched (the original implementation
>>>>>>>     deleted git repository lines from it)
>>>>>>> - it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
>>>>>>>     the separate crate folders are copied into this folder, and it is used as the central
>>>>>>>     vendoring folder. This is needed for source replacements: the folder that is used for
>>>>>>>     vendoring needs to contain the crates separately, one crate in one folder. Each folder
>>>>>>>     has the name of the crate that it contains. Workspaces are not included here (unless the
>>>>>>>     given manifest is a workspace AND a package at once)
>>>>>>> - previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
>>>>>>>     to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
>>>>>>>     Having destsuffix is still mandatory though.
>>>>>>>
>>>>>>> The change does not handle nested workspaces, only the top level Cargo.toml is processed.
>>>>>> I use a similar approach for my Cargo.lock fetcher. In my case the code
>>>>>> finds the crate on the fly inside the a git repository because the
>>>>>> Cargo.lock doesn't contain the subpath.
>>>>> By any chance, did you manage to solve the workspace problem? If you
>>>>> have a working solution, feel free to submit it, I wouldn't mind if I
>>>>> wouldn't have to debug mine :D
>>>> I haven't test a workspace project. Do you have an example project?
>>>>
>>> I have attached a sample recipe (that is very much based on Tom Geelen's
>>> initial work). It depends on at least 2 workspaces.
>> Thanks for the sample. After switching to my cargolock fecher and
>> cargo_vendor class the project build without problems. Your git URLs
>> need a parameter to inform the config generate that the source
>> contains a rev query parameter. Additionally you need to add the
>> revision to the name and destsuffix/subdir because it is possible to
>> use crates with different revisions from the same repository.
>>
> Yes, but the name and destsuffix already need to be always unique by
> definition for each SRC_URI component. If name isn't unique, then you
> can't specify different revisions. And git fetcher (and I suspect others
> too) starts fetching with deleting the target folder, so if destsuffix
> isn't unique, then only the last code prevails.
It was only a comment, that the solution inside your example doesn't 
work in any case.

In your example the Cargo.lock reference two crates inside the same 
repository:

[[package]]
name = "reqwest-middleware"
version = "0.4.2"
source = 
"git+https://github.com/astral-sh/reqwest-middleware?rev=7650ed76215a962a96d94a79be71c27bffde7ab2#7650ed76215a962a96d94a79be71c27bffde7ab2"

[[package]]
name = "reqwest-retry"
version = "0.7.0"
source = 
"git+https://github.com/astral-sh/reqwest-middleware?rev=7650ed76215a962a96d94a79be71c27bffde7ab2#7650ed76215a962a96d94a79be71c27bffde7ab2"

(https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L3431)

Luckily both use the same revision of the repository and you can use a 
single SRC_URI:

SRC_URI += 
"git://github.com/astral-sh/reqwest-middleware;protocol=https;name=reqwest-middleware;destsuffix=reqwest-middleware;branch=main"

If they use different revisions you have to add two SRC_URIs with 
different name and destsuffix. Furthermore you need to add the crates 
from the correct destsuffix to the vendor folder because both checkouts 
can contain the same crates.

I follow the cargo vendor approach and use a part of the revision inside 
the subdir (destsuffix).

SRC_URI += 
"git://github.com/astral-sh/reqwest-middleware;protocol=https;nobranch=1;name=reqwest-middleware#7650ed7;destsuffix=cargo/git/checkouts/reqwest-middleware/7650ed7"
SRC_URI += 
"git://github.com/astral-sh/reqwest-middleware;protocol=https;nobranch=1;name=reqwest-middleware#591ab44;destsuffix=cargo/git/checkouts/reqwest-middleware/591ab44"

> If this should be
> enforced, I would rather put that logic into a new QA check, or maybe
> into the fetcher directly.
>
> (A bit more touched on your note below)
>
>>>>>>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>>>> Cc: Tom Geelen <t.f.g.geelen@gmail.com>
>>>>>>>
>>>>>>> ---
>>>>>>>    meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
>>>>>>>    1 file changed, 108 insertions(+), 50 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
>>>>>>> index c9eb2d09a5..79c1351298 100644
>>>>>>> --- a/meta/classes-recipe/cargo_common.bbclass
>>>>>>> +++ b/meta/classes-recipe/cargo_common.bbclass
>>>>>>> @@ -129,6 +129,44 @@ cargo_common_do_configure () {
>>>>>>>    python cargo_common_do_patch_paths() {
>>>>>>>        import shutil
>>>>>>>    
>>>>>>> +    def is_rust_crate_folder(path):
>>>>>>> +        cargo_toml_path = os.path.join(path, 'Cargo.toml')
>>>>>>> +        return os.path.exists(cargo_toml_path)
>>>>>>> +
>>>>>>> +    def load_toml_file(toml_path):
>>>>>>> +        import tomllib
>>>>>>> +        with open(toml_path, 'rb') as f:
>>>>>>> +            toml = tomllib.load(f)
>>>>>>> +        return toml
>>>>>>> +
>>>>>>> +    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
>>>>>>> +        for lf_repo in lockfile_repos.keys():
>>>>>>> +            if repo in lf_repo and lf_repo.endswith(revision):
>>>>>> Does this works if the URL contains a "rev" query parameter? This
>>>>>> happens if the same git repository is used with different revisions.
>>>>> I *think* yes, since I query the revision from the fetcher, instead of
>>>>> parsing it myself (and I use both the repo and revision for matching the
>>>>> cargo.lock repos). But will test it specifically, and make it work if it
>>>>> wouldn't work out of the box. Thanks for calling my attention on this.
>>>> The problem is that the source replacement key contains a query
>>>> parameter. The query isn't supported by the git fetcher. That means
>>>> you have to remove the query from the SRC_URI but add it back in the
>>>> source entry in the config.toml.
>>> You mean for dynamic fetching, from Cargo.lock? This patch still relies
>>> on the user adding these dependencies to the SRC_URI.
>>> Otherwise I might be misunderstanding your question...
>> Please check the source inside the Cargo.lock:
>> https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L302
>>
>> It contains a rev query parameter. This query parameter must be part
>> of the source key inside the config.toml:
>>
>> [source."git+https://github.com/astral-sh/rs-async-zip?rev=285e48742b74ab109887d62e1ae79e7c15fd4878"]
>>
>>
> Yes, it supposed to work like that already. The
> extract_git_repos_from_lockfile() collects the repos starting with
> "git+" from Cargo.lock - this value contains the rev parameter already.
> These values are only used as keys in the config.toml file, just like
> your example. Before adding it to config.toml, only the last optional
> part, the revision after the "#" is cut off. (E.g.
> "git+https://github.com/foo?rev=123#123" becomes only
> "git+https://github.com/foo?rev=123")
Okay, I use the SRC_URIs as source and therefore have the problem to 
reconstruct the source key. The reason therefore where that I populate 
the vendor folder during do_unpack. But the config.toml could be created 
after do_patch and the Cargo.lock should be the better source.

> I do not use SRC_URI components in this file - currently there is some
> loose connection between SRC_URI and Cargo.lock repos: at the end I try
> to match each SRC_URI to a Cargo.lock repo, and see if the user has
> fetched every required repo (by trying to match the repo URL and
> revision), but in general the values are used differently.
>
>>>>>>> +                lockfile_repos[lf_repo] = True
>>>>>>> +                return lf_repo.split("#")[0]
>>>>>>> +        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
>>>>>>> +
>>>>>>> +    def create_cargo_checksum(folder_path):
>>>>>>> +        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
>>>>>>> +        if os.path.exists(checksum_path):
>>>>>>> +            return
>>>>>>> +
>>>>>>> +        import hashlib, json
>>>>>>> +
>>>>>>> +        checksum = {'files': {}}
>>>>>>> +        for root, _, files in os.walk(folder_path):
>>>>>>> +            for f in files:
>>>>>>> +                full_path = os.path.join(root, f)
>>>>>>> +                relative_path = os.path.relpath(full_path, folder_path)
>>>>>>> +                if relative_path.startswith(".git/"):
>>>>>>> +                    continue
>>>>>>> +                with open(full_path, 'rb') as f2:
>>>>>>> +                    file_sha = hashlib.sha256(f2.read()).hexdigest()
>>>>>>> +                checksum["files"][relative_path] = file_sha
>>>>>> Do we really need the calculation of the checksum?
>>>>> For source replacement AFAIK it is mandatory, otherwise cargo complains.
>>>>> (But I'd be happy to stand corrected)
>>>> Have you test an empty dictionary for "files" and NULL for "package"?
>>>>
>>> Are these valid states? Currently the checksum calculation happens for
>>> crate folders that have been actually copied to the vendor folder. And
>>> that happens only, in case there is at least a Cargo.toml manifest in
>>> that folder, so the files dict shouldn't be empty. Otherwise the
>>> checksum sub iterates through all the files it can find, it doesn't try
>>> to validate it against any manifests.
>> Do we need the validation by cargo? The crate fetcher skip the
>> validation with an empty dict and the same works for git sources.
>>
> Oh, you mean if there are no sources found that should be vendored? That
> was definitely a bug in this version, and v2 should have a check for
> that - if there is nothing to vendor than it stops and returns silently.

I mean that we already ensure the integrity of our sources. Why should 
we invest time to populate the files checksum if we could simple skip 
the check inside cargo by an empty files dictionary.

metadata['files'] = {}
metadata['package'] = tarhash

(https://github.com/openembedded/bitbake/blob/master/lib/bb/fetch2/crate.py#L120)

Maybe we should even remove the .cargo-checksum.json creation from the 
fetcher and move it into your function. We can speed up the process if 
we use the checksum from the Cargo.lock instead of the on-the-fly 
calculation inside the fetcher:

tarhash = hashlib.sha256(f.read()).hexdigest()

(https://github.com/openembedded/bitbake/blob/master/lib/bb/fetch2/crate.py#L118)

>>>>>>> +
>>>>>>> +        with open(checksum_path, 'w') as f:
>>>>>>> +            json.dump(checksum, f)
>>>>>>> +
>>>>>>>        cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
>>>>>>>        if not os.path.exists(cargo_config):
>>>>>>>            return
>>>>>>> @@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
>>>>>>>        if len(src_uri) == 0:
>>>>>>>            return
>>>>>>>    
>>>>>>> -    patches = dict()
>>>>>>> +    lockfile = d.getVar("CARGO_LOCK_PATH")
>>>>>>> +    if not os.path.exists(lockfile):
>>>>>>> +        bb.fatal(f"{lockfile} file doesn't exist")
>>>>>>> +
>>>>>>> +    lockfile = load_toml_file(lockfile)
>>>>>>> +
>>>>>>> +    # key is the repo url, value is a boolean, which is used later
>>>>>>> +    # to indicate if there is a matching repository in SRC_URI also
>>>>>>> +    lockfile_git_repos = {}
>>>>>>> +    for p in lockfile['package']:
>>>>>>> +        if 'source' in p and p['source'].startswith('git+'):
>>>>>>> +            lockfile_git_repos[p['source']] = False
>>>>>>> +
>>>>>>> +    sources = dict()
>>>>>>>        workdir = d.getVar('UNPACKDIR')
>>>>>>>        fetcher = bb.fetch2.Fetch(src_uri, d)
>>>>>>> +
>>>>>>> +    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
>>>>>>> +
>>>>>>> +    os.makedirs(vendor_folder)
>>>>>>> +
>>>>>>>        for url in fetcher.urls:
>>>>>>>            ud = fetcher.ud[url]
>>>>>>> -        if ud.type == 'git' or ud.type == 'gitsm':
>>>>>>> -            name = ud.parm.get('name')
>>>>>>> -            destsuffix = ud.parm.get('destsuffix')
>>>>>>> -            if name is not None and destsuffix is not None:
>>>>>>> -                if ud.user:
>>>>>>> -                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>>>>>> -                else:
>>>>>>> -                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>>>>> -                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
>>>>>>> -                patches.setdefault(repo, []).append(path)
>>>>>>> +        if ud.type != 'git' and ud.type != 'gitsm':
>>>>>>> +            continue
>>>>>>>    
>>>>>>> -    with open(cargo_config, "a+") as config:
>>>>>>> -        for k, v in patches.items():
>>>>>>> -            print('\n[patch."%s"]' % k, file=config)
>>>>>>> -            for name in v:
>>>>>>> -                print(name, file=config)
>>>>>>> +        destsuffix = ud.parm.get('destsuffix')
>>>>>>> +        crate_folder = os.path.join(workdir, destsuffix)
>>>>>>>    
>>>>>>> -    if not patches:
>>>>>>> -        return
>>>>>>> +        if destsuffix is None or not is_rust_crate_folder(crate_folder):
>>>>>>> +            continue
>>>>>>>    
>>>>>>> -    # Cargo.lock file is needed for to be sure that artifacts
>>>>>>> -    # downloaded by the fetch steps are those expected by the
>>>>>>> -    # project and that the possible patches are correctly applied.
>>>>>>> -    # Moreover since we do not want any modification
>>>>>>> -    # of this file (for reproducibility purpose), we prevent it by
>>>>>>> -    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
>>>>>>> -    # here is better than letting cargo tell (in case the file is missing)
>>>>>>> -    # "Cargo.lock should be modified but --frozen was given"
>>>>>>> +        if ud.user:
>>>>>>> +            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>>>>>> +        else:
>>>>>>> +            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>>>>>    
>>>>>>> -    lockfile = d.getVar("CARGO_LOCK_PATH")
>>>>>>> -    if not os.path.exists(lockfile):
>>>>>>> -        bb.fatal(f"{lockfile} file doesn't exist")
>>>>>>> +        sources[destsuffix] = (repo, ud.revision, crate_folder)
>>>>>>> +
>>>>>>> +        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
>>>>>>> +        cargo_toml = load_toml_file(cargo_toml_path)
>>>>>>> +
>>>>>>> +        if 'workspace' in cargo_toml:
>>>>>>> +            members = cargo_toml['workspace']['members']
>>>>>>> +            for member in members:
>>>>>>> +                member_crate_folder = os.path.join(workdir, destsuffix, member)
>>>>>>> +                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
>>>>>>> +                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
>>>>>>> +                member_crate_name = member_cargo_toml['package']['name']
>>>>>>> +                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
>>>>>>> +
>>>>>>> +        if 'package' in cargo_toml:
>>>>>>> +            crate_folder = os.path.join(workdir, destsuffix)
>>>>>>> +            crate_name = cargo_toml['package']['name']
>>>>>>> +            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
>>>>>>> +
>>>>>>> +    for d in os.scandir(vendor_folder):
>>>>>>> +        if d.is_dir():
>>>>>>> +            create_cargo_checksum(d.path)
>>>>>>> +
>>>>>>> +
>>>>>>> +    with open(cargo_config, "a+") as config:
>>>>>>> +        print('\n[source."yocto-vendored-sources"]', file=config)
>>>>>>> +        print('directory = "%s"' % vendor_folder, file=config)
>>>>>>> +
>>>>>>> +        for destsuffix, (repo, revision, repo_path) in sources.items():
>>>>>>> +            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
>>>>>>> +            print('\n[source."%s"]' % lockfile_repo, file=config)
>>>>>>> +            print('git = "%s"' % repo, file=config)
>>>>>>> +            print('rev = "%s"' % revision, file=config)
>>>>>>> +            print('replace-with = "yocto-vendored-sources"', file=config)
>>>>>>> +
>>>>>>> +    # check if there are any git repos in the lock file that were not visited
>>>>>>> +    # in the previous loop, when the source replacement was created, and warn about it
>>>>>>> +    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
>>>>>>> +        if not found_in_src_uri:
>>>>>>> +            bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
>>>>>>>    
>>>>>>> -    # There are patched files and so Cargo.lock should be modified but we use
>>>>>>> -    # --frozen so let's handle that modifications here.
>>>>>>> -    #
>>>>>>> -    # Note that a "better" (more elegant ?) would have been to use cargo update for
>>>>>>> -    # patched packages:
>>>>>>> -    #  cargo update --offline -p package_1 -p package_2
>>>>>>> -    # But this is not possible since it requires that cargo local git db
>>>>>>> -    # to be populated and this is not the case as we fetch git repo ourself.
>>>>>>> -
>>>>>>> -    lockfile_orig = lockfile + ".orig"
>>>>>>> -    if not os.path.exists(lockfile_orig):
>>>>>>> -        shutil.copy(lockfile, lockfile_orig)
>>>>>>> -
>>>>>>> -    newlines = []
>>>>>>> -    with open(lockfile_orig, "r") as f:
>>>>>>> -        for line in f.readlines():
>>>>>>> -            if not line.startswith("source = \"git"):
>>>>>>> -                newlines.append(line)
>>>>>>> -
>>>>>>> -    with open(lockfile, "w") as f:
>>>>>>> -        f.writelines(newlines)
>>>>>>>    }
>>>>>>> +
>>>>>>>    do_configure[postfuncs] += "cargo_common_do_patch_paths"
>>>>>>>    
>>>>>>>    do_compile:prepend () {
>>>>>>>
>>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>> Links: You receive all messages sent to this group.
>>>>>>> View/Reply Online (#224426): https://lists.openembedded.org/g/openembedded-core/message/224426
>>>>>>> Mute This Topic: https://lists.openembedded.org/mt/115578466/6374899
>>>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [stefan.herbrechtsmeier-oss@weidmueller.com]
>>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>>


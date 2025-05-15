Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA9CC3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:59:15 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.58])
 by mx.groups.io with SMTP id smtpd.web11.13250.1747317544725754528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WaZQJqlv;
 spf=pass (domain: cherry.de, ip: 40.107.159.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLlNRzbvZRaDj47vtZyX5AqOaXE2P3LArjAdBd9+zEaDJEXnP5A3AcAAxoZTALaoo82BwWM0RvxkAruxC0DvQZhYtKX9yHwSiu4Z+n1FWWxujznJ7KFX4np9ToDglsfWif4ZjDP4svEk/i8K+3D4xyABJNqyxHWB/UrtdxelOD1NSVd9h9sNSql/Sz2Qk9NIJl8RbaxYzQ20Y8t76naox/UMl1QywKGDBzRvjD6GUOHh1thGHkkYi/LBOzx6qIQDEJ6mAdwRliqwjJzzTvQF6d70Ij3GUeDWxDBz67GBc2CRYg9TtGpIir9Nd8JOX9Z8/lB2lsIOLmpY0mNimEyrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFkfNRy1E5nqcszyNrdrlo0955chmqR3CJ2F1unjhr4=;
 b=EA2lTjrQoxk4rOQvcZdGdIEKVJ43B+Zcaw7oogFFyaJdl+huaHeB4Sfp1M2NMYgU70fM/RfhPrFtgrCjcJqpTHYMAxSPVQOu9sBlcX6DUrSr/sGJFIfaFZgsRtCtMC/WR0EuEHzXhQgp8iYTLtR+DlULrKXUFcae414dV0Cc4x4TJxnAOlJKqmr1/Wip/PNmJVDlx7fED7RGZN3CYm7eaNvM5J8ppeWHGkr5KgzuAEP84kJBT/o9uQbdJn5dltbHbffFjDKOje3o2QyHFTsdI/CVOGHfghcdFxM+LDzuGSJ6SFYGqlTae5IhwdoAjh/w6JehH45iL5pnSY384nnYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFkfNRy1E5nqcszyNrdrlo0955chmqR3CJ2F1unjhr4=;
 b=WaZQJqlv0R1HUrbOpsvkw9MycbYSaQJAmb38YpD7EVBvABLgTij29PqZZdyM+t+692tDcisu1pvp2QvJum62jTjwNQg+qKSVeDLcmIbWELOdyxaV+73O76+PhvY4aEu601okfWS6xODUI7Ml/8IMJLgl1um6kpgiGYITkCeQqHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 13:58:58 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 13:58:58 +0000
Message-ID: <11ac48b4-6831-4cf6-a071-9567fbfff2e6@cherry.de>
Date: Thu, 15 May 2025 15:58:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
To: Daniel Turull <daniel.turull@ericsson.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
 <20250514125706.495571-2-daniel.turull@ericsson.com>
 <07ef3a4c-265a-40d2-939b-d3843662df38@cherry.de>
 <PR3PR07MB666678F2C4E5BA67075D490D8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
 <50889349-4a1c-4978-a4e2-b7bf1964b881@cherry.de>
 <PR3PR07MB66662659710253B1ED4F50E08A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <PR3PR07MB66662659710253B1ED4F50E08A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::11) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: cf28b8da-790c-450e-8daa-08dd93b8a391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RnFlZEtYMXlIZnZBS1NHWGNuVjF5V3MzQUVtTDJLZ3Bab3VZTm5KMHE2MWxH?=
 =?utf-8?B?VDlyamVwcy9xbzMyTnRmb2U4eFVvcXE1alh2OWU3LzNDRDhWYzlHaVdhOW8y?=
 =?utf-8?B?YTNsWk53YVBVUUF4RHRVcWQxODFmTkFpdnQ3NzVEZHptKzVWcGhTQS9SbUg0?=
 =?utf-8?B?ZVlPVTFOd0FMajZkQlRieTRoUXRqU3BUblJzalJlSzJYTUFiejAvVDh2dG9i?=
 =?utf-8?B?WDYrN2tReFEyL3VsdUtWbG1PNGswWkh6NW9XZzZ3SlBiL0pLSVI0ZXgrcDBE?=
 =?utf-8?B?eHJjTjhRa0RYUlVscktTWE15SDNhMWxFeDh2djNsNk9maFphUVV1MytCYzNV?=
 =?utf-8?B?REc5SERjOERBUVRNd253M0tMQmlxRW5NNFQwOVVvR3JqOTdOSlIrRzd6WUhS?=
 =?utf-8?B?N3JJNzM2NzRmTzByTTRKOWU2M0hZNDFwNHFhMnRqOFVLSnZITkQrbmxrcUJ0?=
 =?utf-8?B?YUxHTWVjV0IxZkdVVnBwZVQ0SWRaOFBXenJsdmZESS93cGFndWJQdldDNTA4?=
 =?utf-8?B?Ulg5MWxWdVViOVowUTdDQXlvNEhCdld6T1MzUzlVckVDOGtGUFZKNnBCS1Vj?=
 =?utf-8?B?dkJMRlc5Wk9ZMXZNRVBra0pkR0h6TlpHVkVKdjNaNmw0Sk9hc3Y5Vkxid0d3?=
 =?utf-8?B?Yk5jd3MrV2pIZmV0NlQxZkxLQkpMeWJwYU9rS29jaU5ON0FNbVc4b3VXU1FN?=
 =?utf-8?B?MS9GRXgrNlRRMUwzUm93K2pTOEpuZktHTE1JSVExc0k3WTdjMS9sMk0vOTVa?=
 =?utf-8?B?RVpsbnZZYkpVQkdjUnlNRmxkRU0yNEJaM3NOcDFzSnc5SUhrRTFISWp4V0NN?=
 =?utf-8?B?N1lnbjB5Sk9Tb3VMZXAxR1ljaGxwY3hDb1FrdGJ1TnpPRzB6YnM2ckVZOEYx?=
 =?utf-8?B?VDRlQUVSM2pNUy9VMTNMU2VqbDdwZ0VEZ1lvS0ZNUDIyTFdvZXVoNEV0TTlG?=
 =?utf-8?B?Y0tSVE0xckpXaTRuQzNMTFR3K1NDVzFvWmw0WVdaWk1WOE4xblZ5VkMwQ1lZ?=
 =?utf-8?B?S2JrdHpXVVpvTlFwQVRPdVFNcnliUGxtNjdyTmxLb0E5eXpZVmluT3JtMTFN?=
 =?utf-8?B?d29iam5OMU45dnJQWDB6VzVKMzBud205RHIxaXQ4a29wdEYzUjNKOElLQkpM?=
 =?utf-8?B?UmhrQWg3d0JnemNBUkJOT205SkJzVHorZFlSMnRVZ1FLT2w3U1M2VjhPb3o2?=
 =?utf-8?B?a28veFNUWGZVS21TRzR6S3pDVWJBV2htemV6WUJhMnpLM21CQU45UEJXTi9h?=
 =?utf-8?B?Z1lDZnZHVUErMDRCU1loTjlxVXZ3eWswWDJJUi9qVFovYVFoeTQwWnk0ajFl?=
 =?utf-8?B?LzN2ZHExdDVwc3BWZGZCN3BYWTRDV3dudVBUNlR4UHNNOGF0dmlvQnNPSFdK?=
 =?utf-8?B?RGZGM29JaU9uUE1YMkpSc2hZeUpPcmJ6UHlXZWY5K1U4bEN5R2hHSW0xMzIv?=
 =?utf-8?B?ZjMyZGViQUJ3WmxmcmVrNUk3SEJsV1c0bzEwSE5yZyt1cFAvR0hEaDBKSXZz?=
 =?utf-8?B?QkY4OFNBME02ZThpUG1IN2pTdHl2d2hwWmxUcllRd0tFU2NkM3BTRmJKcXRF?=
 =?utf-8?B?cDU3UVcyY1RzMXdYY2s2UkhpckZWQkNSM3UvL0c5b0E2QUl3RElLMFIwaHIx?=
 =?utf-8?B?VXlUOEFXNXg4L21MN0VzZjVjcVdZWEttMHlOenlpNlJkVGFpRVFud2JNd05O?=
 =?utf-8?B?OURDc0lVd0VYMmp2Zk5naC9PYWw3RERNdzVqQVRXYWpCR3puNlV6ekZFTk5Y?=
 =?utf-8?B?bFNva1hzZDZqYURyK0E0TnJta0UybExxNHVFTnJ2WWJWdnY0WitSdEkrZytT?=
 =?utf-8?B?eS9LNDdENnpzZE1pRXg5UWdYUndIUXlDRkdhV0JoeXNRY2ZXaDUvcVdNcHZi?=
 =?utf-8?B?bkdSdVJiellsRmVvWS9Ic1BIMXRPNzBRSjBoV1dpZVFpZ3hlVEYrbC9Cb01p?=
 =?utf-8?Q?7IuV1a7XafY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWd3RXd5K2xEMVhpa0FQNmY2RkR4cEJtcWlZMS9aaFV2RzlSbGh2dUhXRndX?=
 =?utf-8?B?Y25sNG1mYnNENWVtNU8xcnBxbzJJcmpLakFnOTAwMnNzQk15dTBoampHMjFU?=
 =?utf-8?B?T0JVb3IrZFN3dlJ2c1l3Wjd0OUFncDNMdUdSSnlPQjA5WnhrQ3RjTjZrNW53?=
 =?utf-8?B?OURUam5TZ3BzcFBwTmNnR0lOYjFndnJ4c3hQWmtzSGc5bW9xSnllMHJjc3hB?=
 =?utf-8?B?NDRZY01EeTJ5aERPdjFEZzhhdnBuK29Jb1Z5QWJvbXkyd2kxSGlIRUN1Y3dw?=
 =?utf-8?B?SnU0L2Vzd2RrZTY3cllWUTFsNFZLOWtsbHJRWHJHaFdWZlZUbnZXaXpVa1Qy?=
 =?utf-8?B?TktqMlYzMHB6UHlVbDZidktoNTBSYVJoemREVWtIQ2dETENtbnE5N1NFVURM?=
 =?utf-8?B?RjVEK0VjOGtCa1NuczhXZUJnRzROL1pyQmNKRGZ0dkdnWHhMM2xEWHBPd0h4?=
 =?utf-8?B?WEJybVVOb0h4YmJUU1pabkR0N1hJOHR1YmppS0d2N2FuVTZ2d01uWmlXYU51?=
 =?utf-8?B?NnhuQm9uVnhEdHZVdFA2bTRIbEVvZlJOWmRhMHdrWUVBMEEzcU00dEJOQXQw?=
 =?utf-8?B?ckx3YUd1N295TVZzVHR1MGM5algzR0FSdG8rYkhZcG0zSk9Cc2Zockl4akNx?=
 =?utf-8?B?Y3Bxak5Ga1BjS0QxdkZaWU1KYzNYYWNjMURHRHJmK3lVOStvL0QvSzNWaWhl?=
 =?utf-8?B?MFpQdDlveUp1MUJPdllXQXBJVG5MYjVraFJ2TEhxOFdpdGsyNG1rR2pqTFVh?=
 =?utf-8?B?bTVaQTBadXJuN1hUa2txSFlmSUJQd3hod3crbVNkaUdvN2l6M0pteFp2cy9h?=
 =?utf-8?B?am5Yc0hQU3V3L0xpSkZpdnhzaCtxeTRNc3JJZm90QVg1ZjRIVlpVUXNENEh3?=
 =?utf-8?B?aUVlUlNENkJzT0lYWUhSZFpudldFMmlHazk0ejMzb2xKMlJoTk9RcVZDa1FP?=
 =?utf-8?B?V0tvcTRLQnRsL0pUeTV2WlVURzR1SWtTZ0VpckM2QkxtcnBTY201aUVsWnlU?=
 =?utf-8?B?c2lkYkN3dDNLdUtjUVVkcWw3UFU3WXVsenhLZUVQM2dHKzhLZ2J1TXM0SWVW?=
 =?utf-8?B?bzlrOThRWjU2aU8rYlZORVg3eEs3MjZpY0s1dnVacUxsT0t1QmVPR3RRQ1lq?=
 =?utf-8?B?SGMzMTNVMHl5YktzeE5CUDE3bzlsZlhITkZDYnVVR1ltTFNNc0ZUbm9rM1B2?=
 =?utf-8?B?TEs4RHZlK1RyZmw0bmRkb0FLNEZJd2NqQmdOei8wZndQM3VVVnFHYTliMitE?=
 =?utf-8?B?Nk9Qb2d3RnIzc2JlU0JFNjJoL2tGM1RuYUU5OWh6V1VBN1pyK0xvd0p3dWtJ?=
 =?utf-8?B?U1B3L2pnbUorUEZKajNXZEdTVGJERE94bjhIRC9TRWs2RzVNcjhTWWpnc3pn?=
 =?utf-8?B?cHhBaURBbWp4anNhcklzemdVbmpXVitIQmJTVElOY3NIOCtMTUhGdmUwRXhh?=
 =?utf-8?B?azZCTllHUitPaUxWMFFuTWhodFJPSWpCV3l0Mkt6TXNYZ3pQaEd4M2NMdWJO?=
 =?utf-8?B?aVVIVGxDd0NzTCtKWjhsWjhjZWdsR2UvUUpmMjZua3RCNmlPRksxZVlnQjZN?=
 =?utf-8?B?aXF3Q2pGNEQvNnNWQWQxYlp1SUpmRFRLay9JUGhuenpUSi9nWEszTEtId29k?=
 =?utf-8?B?WmpGcWdGSjBKS3hpeCtyMlpzL1U4VDdzNlFwbGJTVUF2eFNyK2Z0UmFPNTN2?=
 =?utf-8?B?ZlFXQ1NNT3lDRk5iMzl6aU9LbEhTQWR4bnV4OFo2a2Jwc0FJNDhSdnNjTUJU?=
 =?utf-8?B?MmJGSUdtTFQzeVF3c2FOQ1UrSDlzdUM1S3JYM09xVkJYZTUzTzVRbThrTXgr?=
 =?utf-8?B?S2xpOStpeVZQcG5IZ1FZdUZPcGZ0SFNZb3dNaUtVczl1V281VjlvTW13Ujlz?=
 =?utf-8?B?czFJTlNyaUtJalNNMWhwaGFrNWhId29BUEpiTVY0ajdpK3FEc2FWTDdjTjRU?=
 =?utf-8?B?NEpYSEdxVXJ2NlhveWRjSHhHb2p2SWhUZHAvY2JCUW5ieWMyUW9mbzNzMkpE?=
 =?utf-8?B?WTkySUI3Tys5YU5icHNHcWY1MElKVElIVUpOK25SaU4xejNwRm96MFIyOHZl?=
 =?utf-8?B?cHByVkQvUGp4TnVmaC95VTFnRjVxYncrZ2loZzdHYzRENzhaUHhudkQ0VlZx?=
 =?utf-8?B?bGN3Zy9BZjNveC96V2c4UG9iQ2xyeDJCWG1kUHZJQzFHN2VxQmFFV0kxRWZI?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cf28b8da-790c-450e-8daa-08dd93b8a391
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:58:58.5211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AHwCQIVD6YA1q5//rKy4BbWQyn+0EFyYRKRjhP0fiyQC3iU/vkSFuAQ+BlKTcN/breawimd0m8u0hJhntPFFFWI6Ao0mnIIWeh5QXQK300=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216682

Hi Daniel,

On 5/15/25 3:44 PM, Daniel Turull wrote:
> Hi Quentin,
> Thanks. I'll dig a bit more for the header files if I can modify the 2nd patch in the series. [PATCH v4 2/3] kernel: add support to extract compiled files
> 
> About only excluding the c files, this is what the current code in spdx is doing (unless I made a mistake), anything other than c file, it returns always true in the is_compiled_source, so it is included in the spdx.
> 

My apologies, I clearly misread the code.

Please make the comment a bit clearer, like saying that we currently 
only support filtering C files, so we need to assume non-C files are 
compiled.

Re-reading the code, I'm wondering what you're actually trying to filter 
out with

if filename.rfind(".mod.c") > 0

? I see there are hidden files in my local build dir matching *.mod.cmd. 
Were you trying to catch those as well as *.mod.c?

Otherwise, You could simply check whether the file ends with .c with:

filename.endswith(".c")

If you want to check for mod.cmd as well:

filename.endswith((".c", "mod.cmd"))

You could also simply replace

     if filename in compiled_sources:
         return True
     return False

with

     return filename in compiled_sources

Cheers,
Quentin


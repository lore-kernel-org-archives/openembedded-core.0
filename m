Return-Path: <adarsh.jagadish.kamini@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C792C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 17:36:51 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13524.1788457003680539520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 10:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=f6dc4Z3l;
 spf=pass (domain: est.tech, ip: 52.101.65.13, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVr1LKEhzu0JTO0/Vdi6n/qyuUl19F94SQQ8Di0LBFx+x0fC9R35f6t9BWZHUzvyvd1dyn3lDyyCzBbY40ICWyb9hQ/1rvRFHQ8TzgJO3fWWWRF+EjntWQJ48gRz0D1O6NrztCUcN/Q/70UH/HYCfg1L/c1hRymbh0Jc+5QRp2/kyWB4yRDOcu8tQd7rdWfUFhTEqsB48zYDkKejBKoSXIs+h0yFqLuey4xb192WsLtK/Ro2PGShNhriKzGH4cNciw8Kl/pq9ea0Aro6rhUkDxcygqgjfjsRZ9xd+WR0rAMjkzm39pqbahzeJbSXgVts8ROOSNVu7J2K9m2TEyDl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxDv7ltMFRZbOdFQF4q6c5i6LlbH6/g4JNK0kpOXJ7M=;
 b=V4qVr4N1Gbs6WVA2NUnzvkz4PIgz4089zkdkOtSvieyqX805YsAGGj+wXBy4i3TdkSD3zyXsTvn7wb7q8VI45axKmif3dBSpexQgYp3zSPQTP9Qtj3iFw8eumVSZBm8mQD+TFXFKLuZXxOkslmsOw5XBcvo3T689+v3r2oQSLvshlJbtt1C0kZrRJfifV9Cew7PF+R9zN7R4UwZuhGYdzv6W2Ahs4W//mIWBtO4RFikVuTIjObcS48IvOGJtbAX0xwaqbZ0lY2nqnOdkpY5GZTX30W2JRIphAdf2T5pLAfQwB4ZgyjyNZkWzXQHDoMYcoxLYRipZXB8XYj+A8xLTVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxDv7ltMFRZbOdFQF4q6c5i6LlbH6/g4JNK0kpOXJ7M=;
 b=f6dc4Z3lt7UNCQfbFGNM5HWXFiT1km6LUfOCIOlkrumIJHGbgwiFn/+YJGcX0hx7OxOOS5tHYx2QlUKHjwLBtcf+4Bq46azFIR6vDItlSkF1VyYWST2ynA7+m0KwUIgsa0tFyyGNL2ko3g+ZK34RYlHL9YIwk3E9XJip+q/PJ1SdW5CkTCy9LgpugHv/NTk9TLlpxF9iUMkAFgMFTo8qOcO7LLCRc2yoMqRnfLm4UDPRD0MlSthD4NfZj8LMIpfeoKyqmOGB9kdgAT4vc2ZjiLsHRFJ6hspVoHRjcdc3H8lgzBHbCvFncUxQ+mRc8lKc2Xo62tfcuaxmd2LzlWRRpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS4P189MB1992.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:507::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 17:36:39 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 17:36:39 +0000
Message-ID: <9505ed3c-51c3-4edb-b3ec-fa42cbb6774a@est.tech>
Date: Thu, 3 Sep 2026 19:36:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH] glibc: fix CVE-2026-19542
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260903170311.3316373-1-Harish.Sadineni@windriver.com>
Content-Language: en-US
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260903170311.3316373-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::11) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS4P189MB1992:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fcfea3-7c8d-4911-237e-08df09e1e8de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|4022899009|366016|1800799024|23010399003|22082099003|18002099003|13003099007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	epNqBpYlylanSjnBS9NXV0yIw0quhX/j3LH18FWOTzQdveTHxevQPDriAZF2MorcNagfAVS87dUCg4N+KN95qcxH7iqIxpQe1orY7piXIWWyJBFK263ZQ1iPu5/BW3QVSusfPjNSz1G+9XqXjRGTc2KH1qh/dba9rBgPVYMiKLnmhHyv6DewmOVDMQa2xB7UtJLIwii0voqZk+d62i0tr7zW6bBhs0kSGyulL5ad9SDqQCqrVc6T9ZRJBcNEQpY+Xd4pzbxiYk5L0MamECNHS+l7Kk3tTdZ29xzhUJJPSjRknTMn8Wmyiu1O8DK5WPPQpk93fjzGMD5FQH37WWFpQOwT/gQU3FQEMS85NsUG+fT4C31OSBb//HSb6gSQZQSq06bsbHyFLOtgd0xioAS3eY9G9gIfvdumMEV4aosK52XR2zfrIzzxayO2OyaQCnPVktQXiQjT4I8MGWJdXixKCfb3oOrFKHaIigAE5AOb4V1Y9ZN15IaFmJj1TwEjDAOF/26SsBcI+/UZNY8k2icdhFPKDor6nDFyfQqqbgYzY5p8R7lpI5i85UpzuX901vMXW/XuJkTWe07n50e76LBbbNrh1csHJ5cCS9uTLaTiCoD+ECZyfnYbgGjtRgxmGfmB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(4022899009)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(13003099007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDdJWWhaOGhxcWZBa2ErSnhuM2hZcEZwVHA4OUoxa2dsR2dzN0hzUm9Jak8y?=
 =?utf-8?B?UTNINzh2NlJpTkFQSkZkaHA1NTg3VW8zTW02SGhVYTJrZCtlRmc3QmErR2NY?=
 =?utf-8?B?eDhYUlVuaU9QWlpEK0UzeVJhYmJMZmpFSTM1cFU3UzVLTFc2YnRmckxRUzJW?=
 =?utf-8?B?WDhTV3kySG94N1BBNDVPTVI2c01RbHVGZDFmVnl6NExpdW9hN1ZLbUhEbTRa?=
 =?utf-8?B?K2swZzBndlhveEdOVjU4MVB2RVppc2lyRFptaW50RG9GMU5mMUFaQW5BNGlY?=
 =?utf-8?B?QXNTNWt4anNodk1hQVNQcUZvdmJMNkdpd3BEdGtFY0hhSjdBOEI0WDFHOVVx?=
 =?utf-8?B?Mk4zSXNvTWprTHd6cGZXUi91ejQ3emw2Wmk5VG91YUMzOVVRcEkwQmJleCtE?=
 =?utf-8?B?VGtEOFRqeUZFc2lyZWxCTVN0SlRENkZqZ1V6dEZNY0xOSlY0YTlaQkYzYjl2?=
 =?utf-8?B?SGdiQ1g5bFA4N0J1YmtKL08zNXVmSGZXMU5UdHBPU2MrMngyNVpjMlhsN2ZK?=
 =?utf-8?B?K21oL3ZRWkZESXJaNStsbDZoc3YvM1RQSmxad2hDekVIeU55aHpyVXlFZ25S?=
 =?utf-8?B?bmtLR3hFNEJ5eHFDSjFneDF0NjJZcGtjM21JUCtVOXhJalpJUzhSRkVYck9a?=
 =?utf-8?B?OExWOVp3ODRzWXVraGhKQ2hObHBsVVJtWE1pMmh1ZW9YZUpsQkRVa3pPdzll?=
 =?utf-8?B?SkxtM2JJY2pER2xQOCtvYzVkL095aUZpQVAwcFNiRHlOUHUwQ25rbkxjYzlY?=
 =?utf-8?B?czNuT052Zk1Rd3lmK0Zpc0JmbVM4dFNlTG9GY2JKNEhxSnlGRXVNay9qbHE4?=
 =?utf-8?B?bS9Ua1RZbUQ2bStMSExzdTlHeFVuN01lL2c1Rzc1YzNsanJXMUFBWENYRXh2?=
 =?utf-8?B?UllRSHhKMFZnN0RkUm80UHlBWVlZQ1hTenUrbytCemo5clhHVWZXVVBjUklD?=
 =?utf-8?B?YWhJTEZQZUxVUXo3d1pHSk0yZWR3VjFXRUk2SmFvcllWMDhyQ3FDZ3FhbDFO?=
 =?utf-8?B?amkvN0J3cEhxV0hmbHhCWUNPZDhodnVmaEZwSzgyeUtCR3Z4aUR0bmVRakto?=
 =?utf-8?B?TUswNURSYkdZR3ZFZnRaQXJEc1BRdlpIRnNpc0d0Y0ROcHhiQ0hXOWdwdTUw?=
 =?utf-8?B?dDEzZFNhd05YYTlyanB4VElwdDIwSEJGNnQzVzBIZFpIOEQ0YlRZbUxadXpm?=
 =?utf-8?B?b2tkc1loN1FvRURWbFk1c2VSUUhxWkY3TlVxanVjOGVLUTlYNm4zQStxMWU3?=
 =?utf-8?B?RWVubzZYcDNJc2pEdkE0T0txWXdjZHd4NUE2NzZWUTZIQWMvQUpMOGk2c2tq?=
 =?utf-8?B?SEIrNWRDN0p1Rkl1empsbjJhank2c0Y0Q0o4RHJpZkRMdUFyT2xZRU9ZWWRp?=
 =?utf-8?B?c0ZmSGxEdTkvTzBSTHhieTRlcDZQZjFaa21JL1JJNXlja0NzeFVCc2Q3MUE2?=
 =?utf-8?B?UDVmdFVxc1c5ZHlJQkt6NStnLzVORUZEQWVzOW5mQ3pSSFM0RnZmMW4xeVRq?=
 =?utf-8?B?MWxXRFNyK2FvR3hNOExhSFNMVmt4dXZORndxdGkxS09rWkdabFY4ZVFjOEJR?=
 =?utf-8?B?YmFIQ2JwTGxsbjNkZ1pPeU5TQ0pSanBSdXVDa2pyRFNiV0tmZ1UwQXNtZnls?=
 =?utf-8?B?aXlYOTBON1JjckdKTHJQdnhwYTFxZWhjdFVXVEwzd0lMUTB6U25Pb0MrRHNN?=
 =?utf-8?B?dGhhOUR2OWhiZ2tNcTFaQ3dRMks4SDFza3FWOGQ4TXZxVFhoQWhMVUlZbXlN?=
 =?utf-8?B?Y1oweEZCek1VSGxNWTFLbjBvUkNQRis5bFRwMTc3ZjlVdkRNV1dGdmFXNnJD?=
 =?utf-8?B?K1pRNFlHVWNhb0FoZVZwSUpLSkhOTmw4bXNNbENaSDRmQkFSaEk5TzNCYURo?=
 =?utf-8?B?ejhiMC9Ob3Q0bjAwa1hNcEVQMDRqNSs0aERVL29MTmdFdW43L2NqRG9JVmdI?=
 =?utf-8?B?TGNUK24rRm9rOVU2T21CMzN4WDRIdkhFOE9ucG9OelBYU0ZydkJMTmFneHI3?=
 =?utf-8?B?ODZTQ1YvZFQrZFhFZFZFQ1lVcTR2aXJzdE4xcktEN2VTWHoyV1ZGcVdKNDZh?=
 =?utf-8?B?UHBYMnBVUjZINCtiZzVLMGtUYzlnMVZIZFNLeEN6S2RTUHhmZTVPOTdNb3N6?=
 =?utf-8?B?U0xOODMyUHYyUnBWUVhxN2wwamg1VTlKc2JObGUveC9HcHZDODRtY2tLRDE5?=
 =?utf-8?B?ck1lOGlISGZkZzhWdjFOdWhla1g5RlpuNGVDUjFONmxlTGI5VmxvK042QTc2?=
 =?utf-8?B?ZFBmYmNlR1NHRzVjT0tCTVpVOGRTSDVidHFqUk5XSndHdEZHdy9LYVRMTkoz?=
 =?utf-8?B?QnZYM1FzS0FxMjVtK005L0NrYk5VZVhjcVVRaUhFbjkxNmtIbE9NaDEwWmdD?=
 =?utf-8?Q?eum+JCrnYHIZkLWRjU3X40RfDPjgh6MNfLGS0/1dBsJRo?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	9ixiyzrEFL6N7bizOkma6K9BPW6xeN9fZ2pe6KMivlu5LGJ//ZYvUkpB
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fcfea3-7c8d-4911-237e-08df09e1e8de
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 17:36:39.2628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tmaegtiRz1DtzA7BWZvDUceLMn1GZBr7l8cZ5wLy0Hw2wSeMhTE1v057FCnggXyv+1I5UyW0ZhG0KY9R1akMVbHc8nMRnS46oKusosB6aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1992
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 17:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245037

On 9/3/26 19:03, Sadineni, Harish via lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> 
> Allocate the maximum array sizes directly, instead of resizing
> the arrays as needed.  This eliminates alloca usage from the
> function, and fixes the out-of-bounds accesses.  The asserts
> guard against the bug coming back if the balancing of the tree
> turns out not to work correctly.
> 
> Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3]
> CVE: CVE-2026-19542
> 
> Reference:
> [1]https://security-tracker.debian.org/tracker/CVE-2026-19542
> [2]https://sourceware.org/bugzilla/show_bug.cgi?id=34506
> [3]https://sourceware.org/git/?p=glibc.git;a=commit;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3
> 
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>   .../glibc/glibc/0023-CVE-2026-19542.patch     | 98 +++++++++++++++++++
>   meta/recipes-core/glibc/glibc_2.43.bb         |  1 +
>   2 files changed, 99 insertions(+)
>   create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
> 
> diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
> new file mode 100644
> index 0000000000..d4b42c6ea4
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
> @@ -0,0 +1,98 @@
> +From e2789c46e3bfdcd67a82bea9946b315c179e83d3 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Fri, 14 Aug 2026 13:41:16 +0200
> +Subject: [PATCH] misc: Fix out-of-bounds array write in tdelete (bug 34506)
> +
> +Allocate the maximum array sizes directly, instead of resizing
> +the arrays as needed.  This eliminates alloca usage from the
> +function, and fixes the out-of-bounds accesses.  The asserts
> +guard against the bug coming back if the balancing of the tree
> +turns out not to work correctly.
> +
> +CVE: CVE-2025-19542
> +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3]
> +
> +Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> +Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> +---
> + misc/tsearch.c | 31 +++++++++++--------------------
> + 1 file changed, 11 insertions(+), 20 deletions(-)
> +
> +diff --git a/misc/tsearch.c b/misc/tsearch.c
> +index 9b2eb34b25..e517dfa712 100644
> +--- a/misc/tsearch.c
> ++++ b/misc/tsearch.c
> +@@ -85,6 +85,7 @@
> + #include <assert.h>
> + #include <stdalign.h>
> + #include <stddef.h>
> ++#include <stdint.h>
> + #include <stdlib.h>
> + #include <string.h>
> + #include <search.h>
> +@@ -406,12 +407,13 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
> +   int cmp;
> +   node *rootp = (node *) vrootp;
> +   node root, unchained;
> +-  /* Stack of nodes so we remember the parents without recursion.  It's
> +-     _very_ unlikely that there are paths longer than 40 nodes.  The tree
> +-     would need to have around 250.000 nodes.  */
> +-  int stacksize = 40;
> ++  /* Stack of nodes so we remember the parents without recursion.  The
> ++     stack size is a conservative approximation of the maximum height
> ++     of a red-black tree, based on size of the address space.
> ++     Actual numbers are closer to 57 (32 bit) and 117 (63 bit).  */
> ++  enum { stacksize = 2 * UINTPTR_WIDTH };
> +   int sp = 0;
> +-  node **nodestack = alloca (sizeof (node *) * stacksize);
> ++  node *nodestack[stacksize];
> +
> +   if (rootp == NULL)
> +     return NULL;
> +@@ -424,14 +426,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
> +   root = DEREFNODEPTR(rootp);
> +   while ((cmp = (*compar) (key, root->key)) != 0)
> +     {
> +-      if (sp == stacksize)
> +-	{
> +-	  node **newstack;
> +-	  stacksize += 20;
> +-	  newstack = alloca (sizeof (node *) * stacksize);
> +-	  nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
> +-	}
> +-
> ++      assert (sp < stacksize);
> +       nodestack[sp++] = rootp;
> +       p = DEREFNODEPTR(rootp);
> +       if (cmp < 0)
> +@@ -470,13 +465,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
> +       node upn;
> +       for (;;)
> + 	{
> +-	  if (sp == stacksize)
> +-	    {
> +-	      node **newstack;
> +-	      stacksize += 20;
> +-	      newstack = alloca (sizeof (node *) * stacksize);
> +-	      nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
> +-	    }
> ++	  assert (sp < stacksize);
> + 	  nodestack[sp++] = parentp;
> + 	  parentp = up;
> + 	  upn = DEREFNODEPTR(up);
> +@@ -541,6 +530,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
> + 		  SETNODEPTR(pp,q);
> + 		  /* Make sure pp is right if the case below tries to use
> + 		     it.  */
> ++		  assert (sp < stacksize);
> + 		  nodestack[sp++] = pp = LEFTPTR(q);
> + 		  q = RIGHT(p);
> + 		}
> +@@ -625,6 +615,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
> + 		  SETLEFT(p,RIGHT(q));
> + 		  SETRIGHT(q,p);
> + 		  SETNODEPTR(pp,q);
> ++		  assert (sp < stacksize);
> + 		  nodestack[sp++] = pp = RIGHTPTR(q);
> + 		  q = LEFT(p);
> + 		}
> diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
> index 9f3a3814d0..3ef2301191 100644
> --- a/meta/recipes-core/glibc/glibc_2.43.bb
> +++ b/meta/recipes-core/glibc/glibc_2.43.bb
> @@ -55,6 +55,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>              file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
>              file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
> +           file://0023-CVE-2026-19542.patch \
>   "
>   B = "${WORKDIR}/build-${TARGET_SYS}"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245036): https://lists.openembedded.org/g/openembedded-core/message/245036
> Mute This Topic: https://lists.openembedded.org/mt/121072674/10182374
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [adarsh.jagadish.kamini@est.tech]
> -=-=-=-=-=-=-=-=-=-=-=-
Hi,
AS far as I know, we don't fix glibc through a patch to 
Openembedded-core. Please send a patch to original glibc project's 2.43 
branch (or check their bug tracker to see if this is backported 
already). Once merged, we maybe be able to update the recipe to point to 
the latest 2.43 release.

I would like someone to verify the above, but as I see there are no CVE 
backport patches in the recipe.

Thanks!
Adarsh Jagadish Kamini


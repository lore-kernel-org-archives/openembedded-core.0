Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED46C369BA
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 15:46:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23576.1744731966937127694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 08:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6200f38ec5=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F4vZtO031514
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:46:06 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3kfaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:46:06 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53FFd3Vi018556
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:46:05 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3kfav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 08:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXlWVMWP9QUHpRHhPEcgFjmfft8im3zwzwrqXcK30u9qogM6gUf1FzHUqMjvqrw2hUBEuJoAiAE1cpu4l9VXuuCp1cLAJj8OOvI0gudek0/7hnTZQi6/mt7f+15F7t40zy5Kxr8c2BTzIMYck+AoFilaquvjhYLE6frLRv0lw33YGC5YCWlZKuIgCAsmw1mkEp/KZSAKtaxD8qTlQiA4CdQgbZV+67ncsysXS0jZ8NLxhtSU3BtXtdiraJt9DMKJCBOuezT72BxZK3PborsSsDwt/2V3QB1KqoO1ElE5DIlz9FLdGE9gDyyLO6pzwqYifPli2JJp71kv1wFFxN1IyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihRtJN5Ra49L59lyHlEeqlxhwRwhL8XGLE9lEFZzMGE=;
 b=f9GkuDDOjuWD3gy7BFOI881YQa3qdFI1sdYuqFc6njcfDCoNn4Q3dIlTJNzoqw/GeNhDDYz1MYxXdGluWKSd9NB1JxE7aR4zphPKbJxJvzRyj/nA4fu3CLmDZaiyxU/wMDwL8jGl/BhoXoYnJ+Hg7Bn59oyolOPNLvDdWEaL1obVpS/m8W1N7iRy1MKVrr1lMZdVK3KC8OYQygoR5TVD+AZnonZfEOzJatKaHg81izMVFUacKQNvzpgjncGUOhTRIGe9hE4RGeobKoUzcVZ5KynWB+n+F6HqxK/B6fK+9FWzcvaZqgIljM8xqKp/oKJ31E9k+BaT9FqUbg6RkDcz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA1PR11MB8838.namprd11.prod.outlook.com (2603:10b6:806:46b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 15:46:00 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:46:00 +0000
Content-Type: multipart/alternative;
 boundary="------------0mxOwFtGkCW57RdYibauHF0i"
Message-ID: <16187529-d92e-4cac-b900-bafe8d603c73@windriver.com>
Date: Tue, 15 Apr 2025 21:15:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] rust: Upgrade 1.84.1->1.85.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org,
        Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
 <20250331055424.1978243-2-Yash.Shinde@windriver.com>
 <CAMKF1sowYqhv29_Him+th4PkxvGG2FkEzeWmM3fgYzUeKpHqSQ@mail.gmail.com>
 <CA+chaQcn9EfvFMSEmBPnCu3duzwY=cNXzwXVGPBNSP7n-9SduQ@mail.gmail.com>
 <1d01500d-39e2-4578-9fc0-b8c7c231e6d9@windriver.com>
 <CA+chaQf_eWJgp9QVKQQ9iGviZU54Zc_1h-LyWW2yurWf06zCLA@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CA+chaQf_eWJgp9QVKQQ9iGviZU54Zc_1h-LyWW2yurWf06zCLA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA1PR11MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c1cfc0-f47a-4373-31c6-08dd7c349ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmZ5YzdxYXFRUk13L0ZCS0ZiQmJYVmttWit2VGcyaGVlYjJqTGFSSm44WnQv?=
 =?utf-8?B?KzUxWjR0WWMyYlZFZy92RDl5enNuNi90L3JSTjNhMDFBMVFiYWhMS0JKSUJq?=
 =?utf-8?B?OUJ3VUZoTXdLVFZsVHU5K3RoeWpFT28yWUdud1pXdVRwZHhkWUN4UXI0S3hw?=
 =?utf-8?B?NzhQZFkxbHVRdjdZb21ZMWhRcll2ZTNXOU9SZTBpbnVzK0t5c1preitVUzJz?=
 =?utf-8?B?R0x4NWt4N1NoTVkxVWZHK3dOUytIdTVoMTU2WjRiWnE5a2czcC82Y1pSVllO?=
 =?utf-8?B?dHpkaFUzU1FLMm04RlhTMXhuTWw0T244ck56WFBHYTlUVUYyQXN5VHZKZ2tT?=
 =?utf-8?B?Y1F4Um51QjYyYmIwbXVseGZKa1NYelo2SklST25nYTdQOXNxVzRpeFBWNHlF?=
 =?utf-8?B?T3BqVWFJd3BFZXFhNVVyNXkvZFdnMXp2TExSQWYzUSs3N1U4VU9hNGpBSXJv?=
 =?utf-8?B?aDJNdkhFRVlBbkJxWWFVNVdHOUpnbHFMeEd6eE9XM1B2NFBIVTVTY05Iekkv?=
 =?utf-8?B?UlVFRVpUNFVBc1BkWjBwdm5kOUhublFKL1E2UnQ4bkU4eHpiaVpKT1F2Yng1?=
 =?utf-8?B?RnZoaHllUlNnVUVReERraVlockJXbEd4VEkyNjVlbGx2aldaZUx6dUdndCs1?=
 =?utf-8?B?ZGtQRXhCYU9tQkMrUlFPUmNPUTVFWHV5V1dIVGk2amM2aW1yMXc0SEZDZFRD?=
 =?utf-8?B?NlJyazQrOWJicis0dWsyS3lLbHVWeTRCSTllMDFlNGp3VHVXR1B4TmdtalZJ?=
 =?utf-8?B?RldLM2cyUG1ZbUx3RmM3UFVnbGhxNHE2eHdxVmJTSDFYOHdBZTk5NHdla1Ur?=
 =?utf-8?B?dmVSWnV1RTF1WWw3alNXY1ZLdTNmR0dZMnJ0MC9DdG5meXh6ZDl5ZVlqTjdW?=
 =?utf-8?B?WndHak8xc3prSFJxbkorN2EwY2M4eGpycjgvYWpiRlhUTmJvSm9WWGNXdEdD?=
 =?utf-8?B?dDlNaktBSlBJR0thN2VuV0MyY0ZUYU1UaVJGSUM1MzNVV3RTdVZJVDNmdXFv?=
 =?utf-8?B?ZUp6UkdScmtnbVBoT2Y5T0dVK0tlUWJ0eUVkdHI0NGM4NGlkVzVXYmtCR0ti?=
 =?utf-8?B?cDBNSG1xNmoxQlV6NmFmWU1yY1BMeEZFNFhsSGZxR1ZKZDVZYTcxV3hGbjFR?=
 =?utf-8?B?TTVPSUVuNERBbk1EY0Vtb0JIRWZFR2lVYVZrdkRrTTlhVXM3aU1zcmRyTzFx?=
 =?utf-8?B?SFhkeEdTOVFKT2ZWSFpXOTB0SWN2dFFNcmJxMDVpemVBdGkwbUtCQ1p4M1Jn?=
 =?utf-8?B?czVPNzc2WVZEYXpCL3pPZ3VWWDJaYlY1Q0w3S2hDdWs4QnRpR0I0cVhVSjQ0?=
 =?utf-8?B?UHZFQlNCS2RuU1dLRTRyRS9CYTVjWW92c1hWN3BMMWVhVG9VN3I2RVhDYkRq?=
 =?utf-8?B?WE1jSXZnY0pEcHFEd3R2ejU4RDZyaTdFbW5QeWJGaGZqQUVBZHVSb1ViOHBD?=
 =?utf-8?B?QU5seVNacTZPQlJVL3RxVkU0STJDMUxFcjdzWHVtSTFkS2ZaWkNObVpSKzRj?=
 =?utf-8?B?K29FaFc4anZXZHFYOGxoOXlrT1o5UHd1cG8ydVZlWnZ0WnZPTUJmOVFPNlN1?=
 =?utf-8?B?YjJhT0dLbG9ReU9UQjhQTnJxRHg2U2tsRnAwS0czeDYvMlN1QVlFOFRBOGNs?=
 =?utf-8?B?cUNnQWhQQTFqSS9BZExyWkJ3WU9zWHkvZUlXOUFVUmlUUTZkTFp5SEtIMTFG?=
 =?utf-8?B?SmhYTG41bFFLMzY2NjlxUGdrVU5WR0FzSTRxQkx3ZGxtVTQ1dFNtanlDRjJv?=
 =?utf-8?B?SUJqYTFJQ3VMaEtCN2Z2NTZEeVV2eEpERC91TUlzcGFpZUtDeiswcExnL3Bq?=
 =?utf-8?B?UVNEMDNYeHl0dHBBd25ZWVFSMkdaZjhHeUVNRlhPSWhRenIwL2FUNzhhWDVC?=
 =?utf-8?B?c0ZjbGNvTlRYQXQxelgrY1FGcjFDL2NqaFNzdGJtdklEMmdqQlZpS1g1eXVE?=
 =?utf-8?Q?OUfxn6Plsv0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RW1ZVDJDWG90NXdQV3JsZm83c1JoRVBUeTFIbTBuTjZldXNKQ1ovTGxxZDZr?=
 =?utf-8?B?bXBlZnB6Ui81bnR2dEpUdkNSdFRnWmkzcVhvZzM5anc1R2pZclZXK1kyZUJT?=
 =?utf-8?B?ZXp0ZHZFNjByV3VLdFFzdkE4Z2NPc0ljYytmcmU2K2hURWlwM3RTdnNrMVps?=
 =?utf-8?B?elJpNG9CUit6eFRDSjlUZUZMZzM5djR0aE5iTXR1ejV5YU9BQWt1eDhZVG1Y?=
 =?utf-8?B?S2w5WlQwb0pFM0NsOVl4QVF0Vzdjb3hCcFFEUGJTRXdyREU3NDROZ3FrckxB?=
 =?utf-8?B?YTlxbVdzalVaWkhzaG5zZEtjc2swc3NieWgySEZ6c2dIbnhjMjk1ckVDTlhz?=
 =?utf-8?B?bnNpMVl1NTAzS1F1RU4yazBLS0NXR2J4OWF2R09DMDdxMjNQL0xUcFZRQTl3?=
 =?utf-8?B?YTFrRTdxRUQ2YVJVV1M0NDVtWEJhb2FEU3ZoUldBelkyUTNzbW4wUGE0NWtV?=
 =?utf-8?B?bDNzcFVBY3BxaDc0YkpIcVJxZTZ1R1BwTVAxMitkMEREYnlDQUx0Si9jeXVs?=
 =?utf-8?B?MDNMVHdNZWp0WlJDRURoaFB0YW56dkN2THpSd3dRTGlFSVJvVG0wUzgwUTRK?=
 =?utf-8?B?cFdGa0t0L1R5Q2xnMWovZkdCMW1hN3dOUkVHbmh5QTR6dERteFlJbHY3U1J6?=
 =?utf-8?B?N1FQQ2dOR1FrYUZvM0dPMm1TSUo1d0F0aWVMMGV6Zm1SUzhBK2xMd0tKWmVB?=
 =?utf-8?B?VjdEN09memhTazhwSFI4NTJHTGw2NUJxN21jM0xhc2dvSkM4UHhEb1BvUHZE?=
 =?utf-8?B?Y0pUY1l2NnA0Vmc3S3E4T21ITkVDQk1VKy9ySjhHR2VYMVBaemVjdW5FMlk1?=
 =?utf-8?B?OUVkN0syL0hoQkdCeFJWdWdRQnZNQjM4cEdjVkVNT2prQm1RYzlZdXUwRU5l?=
 =?utf-8?B?bU1jUUd0M3dzWUNjTU1tZWJ2T3FScFN2T0tSM05HeVdkSFY4RG1sVzJEMksv?=
 =?utf-8?B?bUNwajNheURrSVlodnFxZEtoWjlvcCtJNGtHZ2ZhaWZOdjFCem1DWHE3YWdi?=
 =?utf-8?B?WnZTYVJOcHJKUFNRdCtsNnROdFZTM1BiVEFXK0ZhMVBlV2FBbmVJdHR1SnBa?=
 =?utf-8?B?QjFpdkkrL01mVlpGUmo4bXVnMVdBdUFmaWJJTndzNmlVamxQR3NseHE2b3FS?=
 =?utf-8?B?cFkxQVhJbHdMQmRiVVUzNzZiV3hBWTF0ZERIRmk4SE1LVlNaZkg1TmhzUEFn?=
 =?utf-8?B?U25vQ0tUWVdrQi84UE1KNmRlNy9PTFd5N0FtdWhQWlJhb200cnNFdkNvaXh0?=
 =?utf-8?B?ZDZOeTAvaVRXdnRLY0JUR3Q3OEYxQmR5U0dKZDlOVWVmNXNSYU04WU5sYmo4?=
 =?utf-8?B?ZmYzV3UzMzkvK1IvR09Sb2RhSks3NTdYMlZmaktwTmZ3L21MSUNvMmFtS21w?=
 =?utf-8?B?end6TmdzdXFmWGc1WWZWckJKT25ROEpKNEhOR1BDOTJXU1p5MEZnQnBzYXVx?=
 =?utf-8?B?YUhmempjV3I2cUlhMWp2UEIxWjcwRjhHQVlPOGt6bHlENWpHV2JCSlJtWFAr?=
 =?utf-8?B?aWtBMzZDRHN2cEJMYlhvWmFURFBsOUZXNFB1b1R0a3lIN2JudGVrME56YWJE?=
 =?utf-8?B?QU9RMzM4YmNXYmI5U2cwTkgxYi9nekswNkRSR0dyMzMzaWE4R1JOcm50Z0h3?=
 =?utf-8?B?Y0ROVk5YMmJlRUtzMm5vSkxERmJJLyt2YlE3Ymt1Q1d3UnAxcmZsSUxHKzMv?=
 =?utf-8?B?N3RWUFpWeHM2K3RJSXJ2RitDbGJGYzhkYlpmdHMzMDVxaFdGQ0dQcjNTTW05?=
 =?utf-8?B?V3U4WlJCKzg1OXVmRDNEb3dOQzZTVmptOTRGNnYrY0lrRVU2SDB4Wi83dWw5?=
 =?utf-8?B?OStCV0VMTUUrcDNicjRRL1R1L0RqS3hYKzFjOGRlbVdrRFFiY0ZtZVVCejZ6?=
 =?utf-8?B?VDdXeXFHbkRoQVJJSUJLM0F5WWEySTVHemdmeklVQkd3VXJVTUpXMmZUTGpV?=
 =?utf-8?B?SG5EQ0tLcUQ3aitqaTRKeS9YL0ZERy9kN1QzaVdPS0JoZXo3TzVhZkRhdEx2?=
 =?utf-8?B?QmtmL0dvb20yd3IyK3ZDSUxEaytpQ0M2bGpGUTJ6dXZBbkcvbERPb3J1VWVq?=
 =?utf-8?B?ZnlWTTdwZjAxSmlzclJVZnhNakxpOHZ0Q0I4aEhZdnFaTUFMS2UxMkV4NE42?=
 =?utf-8?B?UXl2WEI1aFdJSDdHTG8wTDFtL1Yxc1RSSFRIVDBtVVpaNlQvQ3ZEVHBDZW1l?=
 =?utf-8?B?Znc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c1cfc0-f47a-4373-31c6-08dd7c349ea9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:46:00.1910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbBTs4NfWFsdSwsdCNujjFr/vSud2/5U6Q+oPLbKPCszPF1GL7o3beqpLH6wBQc1rrd8FZQzXJBnmj2FRRBAKV24+hJbwSReVAcVLTnwpPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8838
X-Proofpoint-ORIG-GUID: EHdhjBGDeLR8ZfZmGg0nBS7tFdeHAE39
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=67fe7f3e cx=c_pps a=6eDru+6t2m7UgPRwoW7UVQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=vtaqWw_jxbRBShuf9dEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=A1y6HG481qebyefiKswA:9 a=yb2LJIb2pTKtTzr8:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: OR1fsv7ne8CfECV_oERS5jpresSb8kcx
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504150110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 15:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214949

--------------0mxOwFtGkCW57RdYibauHF0i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53F4vZtO031514


On 15-04-2025 17:08, Martin Jansa wrote:
> qemuarmv5 uses tune-arm926ejs which uses armv5te, I think you would
> need to use armv5te-vfp to reproduce this, or use qemuarm with
> tune-cortexa15 but switch from default cortexa15thf-neon to
> cortexa15t-neon
>
> I was seeing it in multilib builds e.g. with
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djans=
a/master&id=3D40e9c4744a7f1eb2d91af9539d69555d36dfba30
> which uses DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7at-neon"
>
> unfortunately just treating softfp as soft ends with segfaults in rust
> as shown nere:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djans=
a/master&id=3Dc65eda95e5dd3ad0be0565477236d7902d5d625c
>
> Regards,
>
> On Tue, Apr 15, 2025 at 11:05=E2=80=AFAM Yash Shinde<Yash.Shinde@windri=
ver.com> wrote:
I checked for softfp tuning using (which gave TARGET_FPU =3D softfp):

TUNE_FEATURES =3D "vfp armv5te"
DEFAULTTUNE =3D "armv5te-vfp"
TUNE_PKGARCH =3D "armv5te-vfp"

But, it seems that softfp is not a valid value for llvm-floatabi in rust.
It gives error as follows:

| --- stderr
| error: Error loading target specification: 'softfp' is not a valid=20
value for llvm-floatabi. Use 'soft' or 'hard'.. Run `rustc --print=20
target-list` for a list of built-in targets As you mentioned, using soft=20
instead of softfp also doesn't work either. It seems that unless=20
upstream Rust provides support for this, we won't be able to build Rust=20
with softfp on ARM targets. Regards, Yash.



--------------0mxOwFtGkCW57RdYibauHF0i
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53F4vZtO031514

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 15-04-2025 17:08, Martin Jansa
      wrote:<span style=3D"white-space: pre-wrap">
</span></div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQf_eWJgp9QVKQQ9iGviZU54Zc=
_1h-LyWW2yurWf06zCLA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
qemuarmv5 uses tune-arm926ejs which uses armv5te, I think you would
need to use armv5te-vfp to reproduce this, or use qemuarm with
tune-cortexa15 but switch from default cortexa15thf-neon to
cortexa15t-neon

I was seeing it in multilib builds e.g. with
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core-contrib/commit/?h=3Djansa/master&amp;id=3D40e9c4744a7f1e=
b2d91af9539d69555d36dfba30">https://git.openembedded.org/openembedded-cor=
e-contrib/commit/?h=3Djansa/master&amp;id=3D40e9c4744a7f1eb2d91af9539d695=
55d36dfba30</a>
which uses DEFAULTTUNE:virtclass-multilib-lib32 =3D &quot;armv7at-neon&qu=
ot;

unfortunately just treating softfp as soft ends with segfaults in rust
as shown nere:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core-contrib/commit/?h=3Djansa/master&amp;id=3Dc65eda95e5dd3a=
d0be0565477236d7902d5d625c">https://git.openembedded.org/openembedded-cor=
e-contrib/commit/?h=3Djansa/master&amp;id=3Dc65eda95e5dd3ad0be0565477236d=
7902d5d625c</a>

Regards,

On Tue, Apr 15, 2025 at 11:05=E2=80=AFAM Yash Shinde <a class=3D"moz-txt-=
link-rfc2396E" href=3D"mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@=
windriver.com&gt;</a> wrote:
</pre>
    </blockquote>
    I checked for softfp tuning using (which gave TARGET_FPU =3D softfp):=
<br>
    <br>
    TUNE_FEATURES =3D &quot;vfp armv5te&quot;<br>
    DEFAULTTUNE =3D &quot;armv5te-vfp&quot;<br>
    TUNE_PKGARCH =3D &quot;armv5te-vfp&quot;<br>
    <br>
    But, it seems that softfp is not a valid value for llvm-floatabi in
    rust.<br>
    It gives error as follows:<br>
    <pre><div style=3D"color: #fffaf4; background-color: #00000000; font-=
family: &quot;con&quot;, &quot;monospace-fallback&quot;, &quot;monospace&=
quot;; font-size: 15px;"><div><span>|   --- stderr                       =
                                                                         =
                                 </span></div><div><span>|   error: Error=
 loading target specification: 'softfp' is not a valid value for llvm-flo=
atabi. Use 'soft' or 'hard'.. Run `rustc --print target-list` for a list =
of built-in targets =20

As you mentioned, using soft instead of softfp also doesn't work either.
It seems that unless upstream Rust provides support for this, we won't be=
 able to build Rust with softfp on ARM targets.

Regards,
Yash.<font face=3D"monospace">
</font></span></div></div></pre>
    <br>
    <br>
  </body>
</html>

--------------0mxOwFtGkCW57RdYibauHF0i--


Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F04AEC1EA1
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 11:20:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18399.1770290433979756236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 03:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ekqBuhGI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64960e8607=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615AnpQF2630122
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Feb 2026 03:20:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=FZVflsIfk+Qf+D/yLljeqPFiet3TdvMjxXQ0zJ59Mh8=; b=ekqBuhGIgQ5h
	5JjQOxCOq3GXwEDJuCRhUs0gKfKETJK+jXgRdCvPug3Y9Itu2Gl3QvIodwUxr09k
	VFF9PjANQfu2yk9E6REZ9ZA8BemLQDKefYMf3tjnny+VKFHfRIFB7dnOZO9fIwUH
	jDl7pjNnN1NsnlpIr2+w31y7VGeQQ3/gBYAp+JLBGdAtXjnr95yXX/cjQpJDh36u
	urAxecKzFZ2b5DZ0s/we+/CPqy/nNU+izj8+yWYqCHAOj/PU4DtvyMEorugXBzjo
	mD/vpjBFA+tj6xgFvovctsg+wTNELU741ZLO7cKhDBnaN1DmHKcS9ZpCoBuqceuz
	geB3xQFaEg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c4jbhgdys-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 03:20:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRlZnNUQD8LuwhZG+u58EUHNQXq8TTm+di6QXVStLJhgVVHaPecKJ0d6I64Xa09rYzj7JWFqhP8ubzl2p3JZ+cCMu0AhTvT6+A6lKDqj09EbOd5WIJOtahF0BpUAIE5O4JxgXbBrOVnHNa0GO9/yD30AIjrgdE1SEInQB/pt+BoAfjHr7b8HngX4YDgTbd2uzJMYt7LBuDbEY2qGNG8I/7vH1wIShxQph303D055bM4oYk8mtvHY7COBMhtgbp0VBrerob0xqpIdZp1cm6wK/l04C7gAfqFN8ejX4l0VbujxDWQLSg+ABF31lrf3DD7OdrWjBKwiCMps9lucP/0+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZVflsIfk+Qf+D/yLljeqPFiet3TdvMjxXQ0zJ59Mh8=;
 b=AVRbxvpW7ZMAqJJIhqTk7tM6JbqW+4l8ei6A3RiYlNwFG6PEsHS0x9Jc7XCq58qJOQhCedqxgGs0qWOlmxCWRYQ84/BbJCsunB4EuKhoID4vcSzgnz+9/5jBNrvuK7bNeQB5yLLIO3yzT9AUKSBIfTWz1cJuwZUC9il9MuxsLIPKJk2zh2GaDjkClyj3nbMNG6WiWuJBJ3LgovDsS8U38hzU7ubZoPrVYvIXuvIKQExbJqSM2ODeta3y9ceeYkG1TGgde8/dHXhHD7nUwtm7OgORwPFbrsbK9cmhTgpeoq+JeZV/W8beNdoKgqf1RciwEjhUNeeUHhUSffWQuZeUeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7028.namprd11.prod.outlook.com (2603:10b6:510:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 11:20:30 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 11:20:30 +0000
Message-ID: <38d8d8cc-1259-4401-818b-adf8a65b94cf@windriver.com>
Date: Thu, 5 Feb 2026 19:20:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] libpam: upgrade 1.7.1 -> 1.7.2
To: liuyd.fnst@fujitsu.com, openembedded-core@lists.openembedded.org
References: <20260126081409.4554-1-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <20260126081409.4554-1-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 3400c858-2f77-4c7e-4657-08de64a891ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?anBvajFMOXJyYkMzV1R2eXg4N0h6UmVwcWQxT3JnNzlmazFrY29KbGJPRzM4?=
 =?utf-8?B?TlBhQzNlTHhqOUFOQWJKOUh1SXNBS1dYTkhjZlNBaCtyc0h2K3BtSy90ZXNQ?=
 =?utf-8?B?THBRMWNzdUJPUTJVcGFZMjE4bUprbnVId1JEbDA3WlFJNVpaZnA4U2t0bmVR?=
 =?utf-8?B?UWY2NTB2OS9kemtCRnBXQlJQNDZOMGlvdk05bnQ4cklZaUU1Q0N4bzhIVWZE?=
 =?utf-8?B?MTA1N1lyeGNsTXpkVSsyQVR2K1VHeU1nYzFLbll1TDBOU0c2a3kxUTVFOTA2?=
 =?utf-8?B?c3FXdExCUkNNTGdNZDZpS2lCT29MUG1YakhRbHMwalVjRXJCNWt6VkpmZlor?=
 =?utf-8?B?a3J2TjM3Z3JKS1VJandQaUZIVGRzOE1MSUtmcVVubEdSTlRuNW92ZWtOQWdY?=
 =?utf-8?B?R2xGdkFTTld6VHJkaHNjM2pKZGZsOFN2OEpsbzRtTVRzaUNPTHdFTzVGN1Br?=
 =?utf-8?B?S25LS1VkU0xMSnhGWWJLSHV5QW5oa3NqU1gvd3dTS3hUaUhFTzZ3SjdzNW1t?=
 =?utf-8?B?RGcxTEo4dVA3U2s1VStGRkRKaW5JTFF1bWJadDl4MkJHOCsvQmplc1ppcVBT?=
 =?utf-8?B?THZ5OG8wNG4vMDZFdFNKamF3QmNaL0VBWEo3MDl0T3FCbzdlTGZBUFVKMEU5?=
 =?utf-8?B?SzloQjFDTWF5bEZnUkkzaXA2VEpQTlNFTnVmU3lLbTNsNmF3YlFrUjBXdTZN?=
 =?utf-8?B?MXlNcFpRaGx2WW9sRkRDMGg5S0h0R2dTbkRhMWpLVTEyMUhBQU00MUQwT2hz?=
 =?utf-8?B?VjFoN3VZcE9DWVpYRWZVMjlnbnRBKzFST3pIUEt1YlRJUXhKenJ1SmJ2Znp5?=
 =?utf-8?B?SzAyT1pxS3hsL1ZCNDdPUGJHVHNGbjZ6WGlGR2RRQXg3eVF1Vml4Ym5RazB4?=
 =?utf-8?B?RHVQWGlBUlFUT3J3SWpHaTA4dGZGZXdkT3ppZ1VsckUyUHNOWTdabVRvNGEy?=
 =?utf-8?B?enp5M2hZdFhadmxoWEFHSFNPcDJMREU4NXJvMVhsUXI4TzFmZFgzV284czR3?=
 =?utf-8?B?UFZRdkJ0ZS9TZ2haUzBERnowMGYvb1hRYzROUGQ0OHFRYzBsMG9xa0laU1hT?=
 =?utf-8?B?V2M5d25jTFBDK01XTk1XQWt3ZEUrSDFjanI3MEJvK0J3ZVpXdDFQQzVXWnp1?=
 =?utf-8?B?dG9vVk5PUFhyYmJSbkdRWW16OEhCU2p1MVpFVCtiQ2VxREZmSU5CTVhyOGk4?=
 =?utf-8?B?dENyOFAyUHh2Y2MyQ2hQaHRWM1pVWXVJVk9TcWtaMkc1Vy9qVmFDQUYwMVJa?=
 =?utf-8?B?aW9YYUo3U2JPeEVDZW9YYzFMTk10OEpESC9XYU5wN3BtUm9TTDU0SkRGU3BL?=
 =?utf-8?B?M1ByTS94QU5EL3BDdC9DS2tEWHJVcTI3cTY3c01QclZ6V3dVRDBuWWU2b3Ex?=
 =?utf-8?B?djEzMUd5Q2JMNmVFZ3YwM205U3ZVRk96OTBkUndwR242VGJySkkwVHlwOVJ4?=
 =?utf-8?B?eWZqUVBoZU52ZWpDSWI5aWNGUEF1TXRIaUpXZW5OaXFjYUk0cUNxR0Zidmg3?=
 =?utf-8?B?SWZIbk5RTUF0UitscGdnMFFabUIzdjhyR3hxQXVmYzJramZtVEd6Z3Jvam0w?=
 =?utf-8?B?TUpucnFnZmJlSHZYeHJrenlFbDMrUkZNWEdNSkR6Vk5oYU54TG90VEpYbVd6?=
 =?utf-8?B?N0dpQ0hZOTRrRFo1UlpIeTV6YXluTW5NNS94c2NzQ20yZVo3UU8vOUl2U0FW?=
 =?utf-8?B?Z3BQM2F3WjREczZQZ1lSNTdtTWFZcFJTZFI1R0krQjNuY0J5UDFOUzhQMDgz?=
 =?utf-8?B?Vk9QbXBtSktKa1hBaUxuUXBydzZ0SHZ1ckhHQlFleFFONHNYamRrcHIvMG9D?=
 =?utf-8?B?b1J2WVh2cE1HVG8rKy8vODFxM1dqQ0M3VVh2QTdLZzRpdWh6TWV5dkZBdjJT?=
 =?utf-8?B?cHhURnk5RThad0xNRlhqbEhLeEpqOXkwSE43RXQ2M0pBQ3c2VWQvQ0twMnBX?=
 =?utf-8?B?WTJreFZrOWdYRFUzd3cyNmNidVVyTER6M1lMbDJIOUgyYjVLSytiT2k0Vlp0?=
 =?utf-8?B?T1FVVGtLbmh6TmZybDNtV2l5elQxVXh6MU1GMml4Mkp0cElvOGZwRzBWQlNU?=
 =?utf-8?B?NDhHanMyTDlseVNqZGhQMWVhdEZRZnh4blpDdDNzVzNIaHNVMmFsN3NRRVZW?=
 =?utf-8?Q?v+wPS983ZmJ1ZV3RUFkKI9ZDL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(7053199007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RDVMZXhnbVBxNnRzc1hXZE5heldrR1BFMmVZM04zRTN4ZzltVWRUWU5lRzJJ?=
 =?utf-8?B?Q0VwcjNyd1JQVE5pNkQ0cmZGZSsxZFBqd0hIUlcrQ2tNU0ozajZZMjNhc0tB?=
 =?utf-8?B?YktwNUZDNFZMOTRZbTU0SUVPQTZVMHZVc3pqbXV5V1JWbTVQMDQ4b1ZrS2Zh?=
 =?utf-8?B?L3BmamhRTEFmNkZVMTI4QlZiMG0xbFc4U3lZWGxVMExLYnJJdjIyUExyWDRm?=
 =?utf-8?B?YzFYR3NFSVBPNEwvRllkNXNCYWNVQktsamljM3VXVEVueWhpcjZuR21KZ2lk?=
 =?utf-8?B?czFNWENaRHJLaU5EdWRkaThmZFh6cWR6S1NBTkd2Y2tHald3d3lnOVJLQlYr?=
 =?utf-8?B?dmRCeXZkeUpXQzB0dEZMdm5Nem5VZnE5Uk5uUG81cVNzTnlUdGJRQzlFckpX?=
 =?utf-8?B?UGJ4NlV6VGNHcXVtSE9IekExNm5tNkc5dU9HeHhzNUQxOWdKT0c3UWZuVitP?=
 =?utf-8?B?N0VnTndvcjRTSzIzUmxxZHl1Wk5mSSs2bk9KdXBXdWZwSHpYWkU4T2JYVElL?=
 =?utf-8?B?V1NUUWRrTjlsdVJMam42dkg4SzNBYjJscDRoTi9GVTZhVTFweUJWMXJSSWNV?=
 =?utf-8?B?clExWlM3aUlJemloeDMvcVZCeGxYV1F2MEhlOC82WGRRN3BFL0NEMGJ3RWhM?=
 =?utf-8?B?eVNUaEVvVDh6V09vTzJ2dm1rKzB0RHFLZ201TWd2b1FoMzZOWldiRkhHRGgv?=
 =?utf-8?B?L0dxZUJyQi9ld1o0TTBLSzBKTFdMRm9kdkpwNlBJQUxHS0dNUFpZVVBXTDNs?=
 =?utf-8?B?ZGRRdGdIT2NCQVcxdEtEY2FvMmNnUU4rWjgyNllZVTlOMEo2b1pQVFRxRnFv?=
 =?utf-8?B?emd6WGR6NG05R2VtRFNiaEFtcDBsUlhBeVp6U1VYSmE1eVEvalBtYXZRNTNp?=
 =?utf-8?B?NmlVdHhyc2pQU3F6UmZVRW04S2NxbC9IMjdHdWxRandsWEdFYU40NjRLVEll?=
 =?utf-8?B?S3B0cVhXRzd2aHZyQXF4dTRiZ1BUcXd5dU0zYUpmT0ozTytDYUQwZmRNV0RM?=
 =?utf-8?B?WFAvUElISEduZHMrSmZIaHZyeFBmWHptSGlqSGV5MmFVVWtGS0VaV3E4bWpk?=
 =?utf-8?B?TU41YkJjOXNtZitod2hTTkZacDd1dm5pbWY1d3greHdMR0VMRVFJKzZ3anZs?=
 =?utf-8?B?Y0pDdzVkZzRJUnUrSFBqZS9iMVRNMjZ0Skk0V0NYZ2VTSkhqeGNZT01PckZ1?=
 =?utf-8?B?YUVJVnh4SVZEdHJiMU9OMnFMWDJmOGh3dGk2d29wT1ZvOWI4S09zZTNJdDlE?=
 =?utf-8?B?UC9NWnBQZ3FoWjZRRld5N2l2VUV3YlVJcTZkcFppUldTU1NQWisyaTBhYjBq?=
 =?utf-8?B?VkxJZ3Q1c3EvOGUwQVkrQkVzdDFIZjBGa2lyeVlQT3NtazBsdTNCcDNyTzBn?=
 =?utf-8?B?RTA4OHFTdjNTd04vZTlzWXphbGxaY1FSck5OdHpVNTZ5MkZSdGREdExFOEpj?=
 =?utf-8?B?VWJ0NEdsWXNBTkhFV0swaTRtbmJZL3FEMjVNbU9OdjhvMm51NUl2bDZZM1pS?=
 =?utf-8?B?UFAzQlBicDRYd2dDVW42ejVrdktjMUsxNEVIRXBmYWxoR0F0Q2xVUmNsaHJU?=
 =?utf-8?B?U0REK2N0dmsxODl4eUFwVGw2akd6NkxPUDFPbW9PandTcjJadk9zcXpmTjIv?=
 =?utf-8?B?WTZDbm5HWlF1Rit2VzhaUDI0bmh6V1lYUmZJcE5wNXJJYjRFejhETXE4Y3Fq?=
 =?utf-8?B?Zk95b1V1KzBTcHVVbDJoekg5dGIzc0plTUhhRG1mYTcyNko3MW5LWWI5blVP?=
 =?utf-8?B?MXRpdTJXSkgydnRGeHM1YWJ5TXgzL3NmeXlUd1NYZUt4NFh2WklhYkNZc29i?=
 =?utf-8?B?cVRxb3d4UzQ4cEgrbXNBbzJ0VXJqVGwrNzU1NENWU2xPN1oxSE1OYStTSlZR?=
 =?utf-8?B?ZEhiTVROelVvMjdac2lEd1hTMGwwOFIyRmtoRE83VnA4SGFrTXdwS0ZMaDJ3?=
 =?utf-8?B?VVgzSTBvQWtueVNtTHFCQmNlbVNuQmNIQmUzMFRXaVpJVmdEL3dkSHZWMUFS?=
 =?utf-8?B?blB4L0ZtbnY4aFEyVXdlTmtXV2JLL3dXZUVBaHMvUmxlVm9RbDJ4TklhR0h0?=
 =?utf-8?B?eVFjVVVvSEFpTUFUOVBNdTlNMHZWQ2laQnlmZnUvT2d3aFcwTDY3d1lnU2Nx?=
 =?utf-8?B?Yng0R0N0MVBhNGNrVWNMNnZ3L0RNWnYxSGRLKy9pYzdMdzJ4VklvMWdHRTNK?=
 =?utf-8?B?QWRZWmpianBiVkZGT3BqYWVIaWFFVWg0eUROMzFlOTQrcm1ka3RIUEV3allH?=
 =?utf-8?B?VzZRRTFmSjJZZjRMa1RvVThvbXdVUlo5T2hWVXc5aVlYQTFqKzV1S0E4Y2tN?=
 =?utf-8?B?c1JPRzYrTDNhWWFyc3BkdmhKMUdvNW9MQTNuMSs5U2d3bUVXZ210Zz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3400c858-2f77-4c7e-4657-08de64a891ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 11:20:30.2334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOTYzOtiMc2F8wmyNXc4NbTw3zXM0BLr6Wr3ewyySlStSCye8xOgimopRI2AbG/zyIjEwBMjFCLYkUaBFGKFOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=KtlAGGWN c=1 sm=1 tr=0 ts=69847d01 cx=c_pps
 a=9TxNVFKjsEmGPsTOmRxrqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8
 a=t7CeM3EgAAAA:8 a=Va8F7Iz0mm32IFfhW5cA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kAg6GNuAoI2OIHYlRrngXorQ99w2Qonk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA4MyBTYWx0ZWRfX4T9pDaae2Wyu
 J+vM+A1FhJ7JqcU/YqcwDPqJTTsbHmmQNznzEou9W5pbFBcDwrpsB40wtmWCCvRMhWYqNPTkGxI
 AG0zJx7V0bhUdkfmiPAFIk7+WNZdaExMdJom9BiPJgnbWIGSGv486Efn1t0wxmFvDey1ffwQd1h
 JPwFfcWdMsGVdEpz79xjdLvZfmcndSsceUYkrnlj2R8aKhlJMUCfSR6uASOqmTUvDZ8Dpif3cdq
 uao/ESVJEQMSHbPl1sFhVgKPOYVhm/rCa1VJbTP6neDcKEbssP/x7vjNc17/xkCVSZgXFGYdC74
 3RQKVtWm4K/J3GEI3Emjdaji1xpYkU+6QqVq/aLo+PwCVuvcK2xtAmaS2fV4xjLn49kLii3dDaU
 4Jns382VEHys3wj4YGKkSObn71TDxdIjauYXh4ndY1I25pWaCbwSB5oP+XPheYWdykANSxi4Mpv
 pNJZi2p3+o/VNHyaACg==
X-Proofpoint-ORIG-GUID: B0CcTx6034RwZrkbSKMJ7TVjdADV5IRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 11:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230576


On 1/26/26 16:14, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> 1.Changelog:
>    https://github.com/linux-pam/linux-pam/releases/tag/v1.7.2
>
> 2.Fix do_package QA Issue as default vendordir has been changed
>    Refer to this commit https://github.com/linux-pam/linux-pam/commit/aea30822e2fa6f87faf2541da140f69dfdfee728
>
>    ERROR: libpam-1.7.2-r0 do_package: QA Issue: libpam: Files/directories were installed but not shipped in any package:
>    /usr/share/pam
>    /usr/share/pam/environment
>    /usr/share/pam/security
>    /usr/share/pam/security/namespace.conf
>    /usr/share/pam/security/group.conf
>    /usr/share/pam/security/namespace.init
>    /usr/share/pam/security/faillock.conf
>    /usr/share/pam/security/access.conf
>    /usr/share/pam/security/pam_env.conf
>    /usr/share/pam/security/pwhistory.conf
>    /usr/share/pam/security/time.conf
>    /usr/share/pam/security/limits.conf

Can we override vendordir so that these files are still installed to the 
/etc/security for backward compatibility?
Also, installing these files to the /usr/share/pam/security is a bit 
strange, as users might need to modify these PAM configurations.


//Yi

>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>   .../pam/{libpam_1.7.1.bb => libpam_1.7.2.bb}                | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-extended/pam/{libpam_1.7.1.bb => libpam_1.7.2.bb} (97%)
>
> diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.2.bb
> similarity index 97%
> rename from meta/recipes-extended/pam/libpam_1.7.1.bb
> rename to meta/recipes-extended/pam/libpam_1.7.2.bb
> index 8fb67983ee..0bd9f5d844 100644
> --- a/meta/recipes-extended/pam/libpam_1.7.1.bb
> +++ b/meta/recipes-extended/pam/libpam_1.7.2.bb
> @@ -24,7 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
>              file://pam-volatiles.conf \
>              "
>   
> -SRC_URI[sha256sum] = "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
> +SRC_URI[sha256sum] = "3d86b6383fb5fd9eb9578d2cd47d92801191f4bf3f9bc61419bfefc8aa1e531a"
>   
>   DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
>   
> @@ -47,7 +47,7 @@ FILES:${PN} = " \
>       ${nonarch_libdir}/tmpfiles.d/*.conf \
>   "
>   FILES:${PN}-dev += "${base_libdir}/security/*.la ${libdir}/*.la ${libdir}/lib*${SOLIBSDEV}"
> -FILES:${PN}-runtime = "${sysconfdir} ${sbindir} ${nonarch_libdir}/systemd/system"
> +FILES:${PN}-runtime = "${sysconfdir} ${sbindir} ${nonarch_libdir}/systemd/system  ${datadir}/pam"
>   FILES:${PN}-xtests = "${datadir}/Linux-PAM/xtests"
>   
>   # libpam installs /etc/environment for use with the pam_env plugin. Make sure it is
> @@ -165,7 +165,7 @@ CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-auth"
>   CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-password"
>   CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
>   CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-account"
> -CONFFILES:${PN}-runtime += "${sysconfdir}/security/limits.conf"
> +CONFFILES:${PN}-runtime += "${datadir}/pam/security/limits.conf"
>   
>   GITHUB_BASE_URI = "https://github.com/linux-pam/linux-pam/releases"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229971): https://lists.openembedded.org/g/openembedded-core/message/229971
> Mute This Topic: https://lists.openembedded.org/mt/117465167/7283133
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


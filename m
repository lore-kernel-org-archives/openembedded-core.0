Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF56C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 06:09:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31086.1741586991373982356
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Mar 2025 23:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5164982c3b=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A5K83Q007830
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 06:09:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458cv8sp5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 06:09:50 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52A69nH9013767;
	Mon, 10 Mar 2025 06:09:49 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458cv8sp5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 06:09:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ji2Dh0u74XfZUJe7tCSkKCcc+bo5MpchR9vKJfUot9TukLZ9usyv0ntMg1Jjw5/vKD6CLRognzYSD8kqsxVOobK3611d6s9esX5HTSrMFazc5nxYmMl6M47V5/McnHDB13eWbrcrg9o4ok0UorHYju3WiK7AjnMkNJaFduv+si9quDXKJQSB+qSnoXcR7gBSK0DROJJTNBkxOucVuBlMb2r1STZ1oUEOOMCXMLfaVGCUgvx92Ff7d05Tg/ZPxKdERNt+uOugFg1VLZu6qIzln2FhT7W3iVPDX4k57DotkX99ekq0n5+7YW25iymR/p0nALnonpSgiNlxlwxoaBfZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxN9Hu9F78zMU2Qlm12TmssjV8eWoeEm8J7NQ7cPjZw=;
 b=Rw1gsP7GEw6moyaJ9pha3p1GGxzXRfcVVXOkZWrmuZpQ3EsQgNQF3/e9M66LCSZXons0koLICnsWZAi5IDFexuRCQkSyiAzkZmZpUgYfB0LjC7Lik6vMZIiFAKtHs65oNx2+xgTzTPmtcpnL/efnTY60yprLuggE3qYsXkjasnxxHDWt5TCh5JpaF0yxvV+ALY+PY/qoKexRsm1mu1q4oNsvyig8zpdiN38IUhkVaSYdmvctnG6Io5dGjmbw7Y1MAdzL6S2puh9JfRimJlGhKGIXLm+hxB/QNa9PKDf3Mkk3j603fYLbkwsyxDuZboDITVqcsVncKcrHDnxFx3ubQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 06:09:47 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 06:09:46 +0000
Message-ID: <7a0675b2-3393-44b2-9eea-f64a08e97ec0@windriver.com>
Date: Mon, 10 Mar 2025 14:10:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v3] babeltrace2: upgrade 2.0.6 -> 2.1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
References: <20250306085625.2864894-1-bin.lan.cn@windriver.com>
 <d398e9868bddf35019775837e9d7296b574cba50.camel@linuxfoundation.org>
Content-Language: en-US
From: Bin Lan <Bin.Lan.CN@windriver.com>
In-Reply-To: <d398e9868bddf35019775837e9d7296b574cba50.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::35) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5e4cb0-93d2-4c44-adb1-08dd5f9a2886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZCtjdmdpdDNqb0lQeEJ3QnFIRHBEM2RNV3MybENYZUc0VlQwWlpPWElkMzdB?=
 =?utf-8?B?ZFJjVDNxbEtMVXBGeFRqc05WWGNnYjlVZ1NsT2hMV3V4VGxqekhETldoZEky?=
 =?utf-8?B?U3FjRk9XTHZUVFRCQWwyVllHNTJOemdaV1kvbE01bTdTOVVad1FuaXdzMFEx?=
 =?utf-8?B?cWZsZjQyZTZVaUloQ0dDUE91b3lmUldsUzhFbHFiTHVmV1BxTTJZS1dwYzM0?=
 =?utf-8?B?aVVCeTVKVDhuVldKSkhISzUrZUlhNG81T2toTUt6Q0UvcWhoWHpUVE0yeHBG?=
 =?utf-8?B?ZTkycjFhUGtOMDh3ZnltVmwxM1NrdnBIZzdXcUJ2S3pVclE3QjRqSW5xVlJH?=
 =?utf-8?B?VjhjMUFQL3VWVW9QUzR3bmpjTFZSYmFtZEx2MENrMDlyZ2lsa3p3MlNLejlY?=
 =?utf-8?B?cXd6UDdNMDJqQ2tOSTlqb3l1S2xKODIwNW42Si9DanFQVTNIVnlIbWNGNW1Y?=
 =?utf-8?B?Y0RlaTF1WG9BZmwxdWdlYTVyUXNheklHS0dNUklFU1BGVThzWDdKTk42Zis3?=
 =?utf-8?B?NnZ3TUFVb1YwSFYrRk40V3UyWUR1bmNmM1h0VVBQVFBuSzdnTUVFUWFzdW5h?=
 =?utf-8?B?WEhIb0FnME8rZW1iazcyOHI3c0ZIWm5FNUVlTVRjR2puNjJab2JnbWNDKzl2?=
 =?utf-8?B?cmhqbk9mem16SmZwM1ZBNWp0Qi9VTUQ0eDI3bkRiT2REdkx2UTFtNUhKcSs2?=
 =?utf-8?B?OStET1FuazVYZnU2Ym10dVlXemRQT3FOZ05OQ0VrYXlqM0N1TEhMTnlUNE43?=
 =?utf-8?B?N3I0NGpmRFJUd2xGNmtrbjk2cDNJOWp6V0dlenY4WGYrUS9lVnVGS2R3VGxU?=
 =?utf-8?B?U0EvYlJEVEZpWEkyMXNYTjZqalNBcUNZN2ZXb0FZK2MzRFVmMVI5TmM0Tm16?=
 =?utf-8?B?dGVNTERPUVNZdkpxZUxHNDZ4dklUMlF4Nm0zWjFXcWladXBKR0dGbGVYUGRl?=
 =?utf-8?B?dGljczVRVERidUdKaEhiOHBEa0dHdVgvSmNmR0JxL2FrVllmMnNSazQ0blVh?=
 =?utf-8?B?NkRBV0QyYmh0WnJQZTRlZ1dTSERTV3JnT21xNVR5VFJsOWRGQ2ZnY0lkek9H?=
 =?utf-8?B?ZWI5dDdsa0t0eTJ6a0pGcU5LblUrR2hYeG1yNmpReDlleldaVGdkSSt4RnNO?=
 =?utf-8?B?TTZYYWk3STFtSDBsdzlheWZhTFFXSkEwZzRQenpWNVpQU1JxaG1pUmdaeDVS?=
 =?utf-8?B?QXZWZlk2UzZEUFJzUXN4ck9ydUFGZmx6ZXU0NmZjWk1SWXpDUUN1VkVVMm5Q?=
 =?utf-8?B?alA5OG5VUUs5NDJGRm5aTVVRcTQyYWQxMU9FeGcydkFWaStJZzBTUjFBYVRP?=
 =?utf-8?B?ek0yYlBkdklCWjM4amhvd1VMbUVpU3FRTFVtYjVCYUxMOGV6a3dKOExpMkdD?=
 =?utf-8?B?cW81elpZU243Z0c3bktuMG9oNnVQMXVjeEZCSHAxZ2tTNlFLN1pSWVhOTFJa?=
 =?utf-8?B?eXpuN1RGSmsxUURuUEhjRVZRRTNRVU5NbnkwdVFBbUxsbU1YVW80NjA3QWdo?=
 =?utf-8?B?em0zMHpaS3dhZ0VMRTUzSTVraHRCTGxjaVcrQlYzcGh2UUVvNlprVnRmTVFi?=
 =?utf-8?B?RXIyU2J2Q0FIKzAzeS9HVkZqZW4zSWpJZWNZVHZFYUxxbWYrUXZIMXJWTFdM?=
 =?utf-8?B?dU5NNDM3ZVFwNnRFTDhVMHUvYWd6MzR5dEc2c2p4dzh3YzdIeXg1Sm9Rb1A1?=
 =?utf-8?B?Z00wa2hBdmlYYUZ5Yk91ajBFbmNZNjlpejNhS1BibnNqdVltQkVSWUd4RjB6?=
 =?utf-8?B?T2JVK1M5bk8xemoxT1RJS2hYaml0N2RiY1RpSmhveEVaZ3B2T0VYZjdoNURN?=
 =?utf-8?B?bDB3cWY1K0RHbFJVZ0RGQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OXFsSzErOWVkUmg4ZVJneW5vZnl6dHpaUmF0L2gzYy9Yb3BpTnhCazNNbkJO?=
 =?utf-8?B?TzRadWVSYkhoWHBaU2U2b2tac05HbDdpUEFEREJ3Lzk1YkY4enlYRzloVjl3?=
 =?utf-8?B?MkFjTGdxQ0xDY2U3S2lzTEM0RHFIdU1idU5pa2NiMkhweUFZUFpPQXFhT1o4?=
 =?utf-8?B?aVpWaFZCamplZWxpMUdaQmFGYlV4dm4wUHlQYmlaMzE0M2NMbVVLNTc1Zytm?=
 =?utf-8?B?S0xwOVdEUkcyaU92M0RPYVJub1hJdGNjUXdyMUlFdWg3WWRBTnlDcUZTWEFD?=
 =?utf-8?B?QTlDNGpGUEJQTVFSNUhEL0hKWlRPdk5DUFZBRkpYVFhiRlc3R05yQVJOTnJu?=
 =?utf-8?B?RFo1V1FvMVFvTFpmbnNhck9vbzhJV1o4blpXVHdiWmxkSWEva1h5ZXBxazFy?=
 =?utf-8?B?NFlQdUR2OHRYRVE3bmNVQU92US9zdWFpMU93clFTWFVYQnNrakNHTENwZFA3?=
 =?utf-8?B?NitsVGRkMGo4cWVTUlp2SUJTVkQzeVNRb0F6U0RmUkdHcnZBVUg3ZEttQWZV?=
 =?utf-8?B?T09vWVV0d3pxMzdHMEpuMXNuNTlqZDRhWjJhcXJ3R2E1a1d3Vi8rNVBLVWxl?=
 =?utf-8?B?Z20rNEJRem1tSVM0ejVaSEpIYzB4RXpBUTBmdVM2NENqdytjdTZYcVFoenZZ?=
 =?utf-8?B?WVFCN2R2MGt1bWViU0Q4RW43MUxuOTJMakpLVkgzQWJDSWpWVmZtTVo3Z1dx?=
 =?utf-8?B?Q3hzNlBqRkt6QjZNeFJEcGs0V2dzVkpHc0lMeHFMY0dxUVluZjBxYlE0Wk5h?=
 =?utf-8?B?WFAzQllscE1BSzJRTHNDN2JaMWxJbHAvUFNLZHZaSTBORm9wdFNQSWg3ODdT?=
 =?utf-8?B?ZUhtTmlvbUEzYitOZklhTzMzdXFKY3lLb3dPSTNNRkJ0c3RVZHl3dVRsTE13?=
 =?utf-8?B?dEVGRjNlYmhqRWl0TGpjT1ZsRW9YeVVZMGc2dUl2Mkl6R0pLa2hZa3E5amU1?=
 =?utf-8?B?SjRyVkhpUFVKc0cwUmpGb2V0dXpiem9NSGVSak94bUp1SzE3LzkwTjBmMXRE?=
 =?utf-8?B?UmFZdlZFMnVrV1BCT1VLcXBhckVkRjR1eHdyTXY1MklFNC9yV2FiamJ5WFNl?=
 =?utf-8?B?V01VaXZUVUJIcWN3dFZyc2ZIYkpZMGFyVHkxQUJHVUNScFB1QTUvTFRDZDBH?=
 =?utf-8?B?RzFjdW5hL2Ziam9SV2lKdkJwQU9nTlZVeUhhem11ekdMR2xma20rU0lkbDcy?=
 =?utf-8?B?N0p2NFd2SnNZeUdPV0w5ZVdBTXNRV2I5eXhqaEtmUVdMRk42UFlvbTlDOEh1?=
 =?utf-8?B?REFPS1ZCMjBCdERBTms1UytJVFFWaDZ1SVY0TjZNSk1zRVpwWHVwUmIxYnhi?=
 =?utf-8?B?Y1NwbGFiOGI0dG5jVkFOcHlZSzVBV0FNQzd6WTVHOGR6NnNwQ3VidlA3cFc5?=
 =?utf-8?B?ckFXOFZPbXlJcDdFdlRuVTYvNndHMThuTVp2TXEremVWZ1lZTXQ0VUs3VzJs?=
 =?utf-8?B?N3pQVitCK1dlcWVrbkJ3Q0VZcnNDU1JQcTF2K3JqOElxdHJnQVE5RWYwUFVY?=
 =?utf-8?B?WDRXTFR2S0h0SmNDc3crYThGNTNYRnJQcEQwZFRwYVBvNzhGaGM0T0Q3VmxB?=
 =?utf-8?B?Z0Z4QTYyOUd3WFJJS2M2ajRyc2dLcTAraUlNQTI5bTdDbTkrckx6OWQzWitI?=
 =?utf-8?B?MmhUMERHb3QzdWtwR3VjSTNhLzI4ZEZ2eUhZaGtLam5BV2g4c1NGazI5SE9l?=
 =?utf-8?B?ajI0eEZ1RmRxMDJBUmlRRE1QL0ZLR3c0Nkt4NjA3d0ZFU0dzZUFxWjlXTWNO?=
 =?utf-8?B?R1VXYTBDMk5XNjFuUUlFT3hkY1RYQW9VeE13MGVsZUNPbGRkM0Q5aUFGazdm?=
 =?utf-8?B?dlFtN1BnMnVIN21jcVBoQnlEUEdmUVZqK1F3STg5cUlHL3BObmhPS1E1TEVu?=
 =?utf-8?B?aHRyd3VPQVJSS1NKa21WdWZJYlY5djR4cnl3NjRQQ0xrREE2OERsL25iRTVs?=
 =?utf-8?B?LytJNlpLTXB1ZXRDcEVFT3pTT0FVT2ZMY2dSRVpmWnl5aS92Z0JOTVlmcEFB?=
 =?utf-8?B?OGozekVZTGxLbDdyNU5UMHhQV3dWdEpxNGVnTmdtbldlMGhtL0hDWnMyRE5R?=
 =?utf-8?B?NW50OVdWY2lqZ242cmZKZ1dJTDdibzVldzlwdjNhd2EvVDFhODFuVnBpcEh1?=
 =?utf-8?B?WjB0RXRtVXUrN1h4aHRDVExHdnFoN2RBYld6TGxaQktKc3Z3cTRIYjFSSTBR?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5e4cb0-93d2-4c44-adb1-08dd5f9a2886
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 06:09:46.7190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zOegWXIQT0i8zs0BUUxqAN+dNeAq+etDdDFwZtqMQCZl2wV8/KISaOs05mP5qSaC9HjZnQTEFZjSFFdJlC1Y2aA7Gx0CImw8wSN4EDocow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
X-Proofpoint-ORIG-GUID: FMr7BqrO6ngdy0ytL7xgrATYBG-SShA-
X-Authority-Analysis: v=2.4 cv=QbKcvtbv c=1 sm=1 tr=0 ts=67ce822e cx=c_pps a=n5+7iF7l5R/EKaY7dbRUPA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=U40Yx87jAAAA:8 a=a5LkSv8FAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=pGLkceISAAAA:8 a=7d_E57ReAAAA:8 a=KocJl8kXMzdC8HVpAeUA:9 a=_PE9Q_0Z8bzuyU0-:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=BBahhS0D0WQA:10
 a=yv_D6YSC6K1Ih23S2Yuy:22 a=E2cWBXyb0kjxxB1PlMdk:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-GUID: 09rEFd-xdI8dFn8MgyLdHivHNBIU6Dw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503100046
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52A5K83Q007830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 06:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212487


On 3/6/25 22:20, Richard Purdie wrote:
> On Thu, 2025-03-06 at 16:56 +0800, Bin Lan via lists.openembedded.org w=
rote:
>> From: Bin Lan <bin.lan.cn@windriver.com>
>>
>> 0001-tests-do-not-run-test-applications-from-.libs.patch is deleted
>> for tests/lib/test_plugin is removed.
>> 0001-tests-do-not-run-some-tests.patch is used to disable
>> some new test cases.
>>
>> License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-SA=
-4.0 PSF-2.0
> It would be helpful to note that 2.1 is a major change and 5 years of
> development compared to 2.0. This means the licenses did change
> significantly.
I will add a note in the commit log to explain the license change=20
significantly.
>
>> Changelog:
>> Babeltrace 2.1, MIP 1 is available and adds many functions
>> to support CTF 2 features.
>> The Python bindings wrap all the library changes in the same
>> systematic way as in Babeltrace 2.0. Add type hints to the
>> public API to assist with static analysis of your applications.
>>
>> Details about the 2.1.0 release:
>> https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-not=
es.html
>>
>> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>> ---
>> Some failed test cases are disabled for I have not time to fix it
>> before the feature freeze to investigate.
>> All test cases are passed when running in intel-x86-64 board, please s=
ee
>> the following summary:
>>
>> Testsuite summary for babeltrace2 2.1.0
>> # TOTAL: 1962
>> # PASS:  1962
>> # SKIP:  0
>> # XFAIL: 0
>> # FAIL:  0
>> # XPASS: 0
>> # ERROR: 0
>>
>> ---
>>   ...001-Make-manpages-multilib-identical.patch |=C2=A0 9 +--
>>   .../0001-tests-do-not-run-some-tests.patch    | 58 +++++++++++++++++=
++
>>   ...not-run-test-applications-from-.libs.patch | 28 ---------
>>   ...o-not-run-test-applications-in-.libs.patch | 27 +++++++++
>>   .../lttng/babeltrace2/run-ptest               |=C2=A0 7 ++-
>>   ...eltrace2_2.0.6.bb =3D> babeltrace2_2.1.0.bb} | 25 ++++++--
>>   6 files changed, 115 insertions(+), 39 deletions(-)
>>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-=
do-not-run-some-tests.patch
>>   delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-=
do-not-run-test-applications-from-.libs.patch
>>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-=
do-not-run-test-applications-in-.libs.patch
>>   rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb =3D> babeltra=
ce2_2.1.0.bb} (77%)
>>
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-=
multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Mak=
e-manpages-multilib-identical.patch
>> index 2401b176e6..76bef9c3b8 100644
>> --- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multili=
b-identical.patch
>> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multili=
b-identical.patch
>> @@ -5,15 +5,17 @@ Subject: [PATCH] Make manpages multilib identical
>>
>>   Upstream-Status: Pending
>>   Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>>   ---
>>    doc/man/asciidoc-attrs.conf.in | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>   diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attrs=
.conf.in
>> -index ad1183f1..e11c7031 100644
>> +index 88fb13ce2..27858b720 100644
>>   --- a/doc/man/asciidoc-attrs.conf.in
>>   +++ b/doc/man/asciidoc-attrs.conf.in
>> -@@ -1,7 +1,7 @@
>> +@@ -4,8 +4,8 @@
>> +
>>    [attributes]
>>    # default values
>>   -system_plugin_path=3D"@LIBDIR@/babeltrace2/plugins"
>> @@ -24,5 +26,4 @@ index ad1183f1..e11c7031 100644
>>    enable_debug_info=3D"@ENABLE_DEBUG_INFO_VAL@"
>>    defrdport=3D5344
>>   --
>> -2.24.1
>> -
>> +2.34.1
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-r=
un-some-tests.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do=
-not-run-some-tests.patch
>> new file mode 100644
>> index 0000000000..a488662e67
>> --- /dev/null
>> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some=
-tests.patch
>> @@ -0,0 +1,58 @@
>> +From da489a5476249dbf087cef7f5da57e61aedd443b Mon Sep 17 00:00:00 200=
1
>> +From: Bin Lan <bin.lan.cn@windriver.com>
>> +Date: Thu, 6 Mar 2025 16:14:45 +0800
>> +Subject: [PATCH] tests: do not run cpp test applications and
>> + src.ctf.lttng-live/test-live.sh
>> +
>> +These cpp common test applications are needed to re-build
>> +in the target. The test cases src.ctf.lttng-live/test-live.sh
>> +need a local or remote LTTng relay daemon.
>> +
>> +Upstream-Status: Inappropriate [oe-core specific]
>> +
>> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>> +---
>> + tests/Makefile.am | 13 +++++++------
>> + 1 file changed, 7 insertions(+), 6 deletions(-)
>>
> Has this issue been discussed with upstream? It sounds like a generic
> problem they might be interested to fix?
I will discuss with Babeltrace2 project by sending a fix patch.
>
>> +diff --git a/tests/Makefile.am b/tests/Makefile.am
>> +index 2a4022bc4..df990218d 100644
>> +--- a/tests/Makefile.am
>> ++++ b/tests/Makefile.am
>> +@@ -128,10 +128,11 @@ cpp_common_test_unicode_conv_LDADD =3D \
>> +     $(top_builddir)/src/lib/libbabeltrace2.la \
>> +     $(COMMON_TEST_LDADD)
>> +
>> +-TESTS_CPP_COMMON =3D \
>> +-    cpp-common/test-c-string-view \
>> +-    cpp-common/test-uuid \
>> +-    cpp-common/test-unicode-conv
>> ++TESTS_CPP_COMMON =3D
>> ++#TESTS_CPP_COMMON =3D \
>> ++#   cpp-common/test-c-string-view \
>> ++#   cpp-common/test-uuid \
>> ++#   cpp-common/test-unicode-conv
>> +
>> + TESTS_LIB =3D \
>> +     lib/test-bt-uuid \
>> +@@ -225,7 +226,7 @@ endif
>> + endif
>> +
>> + if HAVE_PYTHON
>> +-TESTS_PLUGINS +=3D plugins/src.ctf.lttng-live/test-live.sh
>> ++#TESTS_PLUGINS +=3D plugins/src.ctf.lttng-live/test-live.sh
>> +
>> + if DEV_MODE
>> + TESTS_LIB +=3D lib/conds/test-conds.sh
>> +@@ -272,7 +273,7 @@ endef
>> + $(eval $(call check_target,bindings,$(TESTS_BINDINGS)))
>> + $(eval $(call check_target,bitfield,$(TESTS_BITFIELD)))
>> + $(eval $(call check_target,cli,$(TESTS_CLI)))
>> +-$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
>> ++#$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
>> + $(eval $(call check_target,ctf-writer,$(TESTS_CTF_WRITER)))
>> + $(eval $(call check_target,lib,$(TESTS_LIB)))
>> + $(eval $(call check_target,plugins,$(TESTS_PLUGINS)))
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-r=
un-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltr=
ace2/0001-tests-do-not-run-test-applications-from-.libs.patch
>> deleted file mode 100644
>> index 805dde8064..0000000000
>> --- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test=
-applications-from-.libs.patch
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 200=
1
>> -Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.=
wallinux@gmail.com>
>> -From: Anders Wallin <wallinux@gmail.com>
>> -Date: Thu, 5 Mar 2020 11:20:04 +0100
>> -Subject: [PATCH] tests: do not run test applications from .libs
>> -
>> -Cross compile specific change
>> -
>> -Upstream-Status: Inappropriate [oe-core specific]
>> -
>> -Signed-off-by: Anders Wallin <wallinux@gmail.com>
>> ----
>> - tests/lib/test_plugin | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
>> -index 652c90cc..1f817c50 100755
>> ---- a/tests/lib/test_plugin
>> -+++ b/tests/lib/test_plugin
>> -@@ -26,4 +26,4 @@ fi
>> - # shellcheck source=3D../utils/utils.sh
>> - source "$UTILSSH"
>> -
>> --"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plu=
gin-plugins/.libs"
>> -+"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plu=
gin-plugins"
>> ---
>> -2.25.1
> I suspect this is incorrect upstream and should be fixed there. .libs
> in an internal libtool thing and shouldn't be referenced.

This is the shared libraries of=C2=A0 plugin test cases are put in=20
lib/test-plugin-plugins when cross build, is not put in=20
lib/test-plugin-plugins/.libs when build in host.

I will discuss with Babeltrace2 project by sending a fix patch.

>
>
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-r=
un-test-applications-in-.libs.patch b/meta/recipes-kernel/lttng/babeltrac=
e2/0001-tests-do-not-run-test-applications-in-.libs.patch
>> new file mode 100644
>> index 0000000000..36d7184e97
>> --- /dev/null
>> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test=
-applications-in-.libs.patch
>> @@ -0,0 +1,27 @@
>> +From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 200=
1
>> +From: Bin Lan <bin.lan.cn@windriver.com>
>> +Date: Wed, 5 Mar 2025 10:51:11 +0800
>> +Subject: [PATCH] tests: do not run test applications in .libs
>> +
>> +.libs is not exist when cross build.
>> +
>> +Upstream-Status: Inappropriate [oe-core specific]
>> +
>> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>> +---
>> + tests/lib/test-plugins.sh | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/tests/lib/test-plugins.sh b/tests/lib/test-plugins.sh
>> +index f83e42baa..939236393 100755
>> +--- a/tests/lib/test-plugins.sh
>> ++++ b/tests/lib/test-plugins.sh
>> +@@ -14,4 +14,4 @@ fi
>> + # shellcheck source=3D../utils/utils.sh
>> + source "$UTILSSH"
>> +
>> +-"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/te=
st-plugins-plugins/.libs"
>> ++"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/te=
st-plugins-plugins"
>> +--
>> +2.34.1
>>
> Same as above.
>
>
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/re=
cipes-kernel/lttng/babeltrace2/run-ptest
>> index 71a9c81bfb..7620161838 100755
>> --- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
>> +++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
>> @@ -4,7 +4,9 @@
>>
>>   # Without --ignore-exit, the tap harness causes any FAILs within a
>>   # test plan to raise ERRORs; this is just noise.
>> -makeargs=3D"LOG_DRIVER_FLAGS=3D--ignore-exit abs_top_srcdir=3D$PWD ab=
s_top_builddir=3D$PWD GREP=3Dgrep SED=3Dsed PYTHON=3Dpython3"
>> +makeargs=3D"LOG_DRIVER_FLAGS=3D--ignore-exit abs_top_srcdir=3D$PWD ab=
s_top_builddir=3D$PWD \
>> +          BT_TESTS_SED_BIN=3Dsed BT_TESTS_PYTHON_BIN=3Dpython3 BT_TES=
TS_GREP_BIN=3Dgrep \
>> +          BT_TESTS_AWK_BIN=3Dawk"
>>
>>   exec 2> error.log
>>   make -C tests -k -s $makeargs $target
>> @@ -16,4 +18,5 @@ if [ -e tests/test-suite.log ]; then
>>       cat tests/test-suite.log
>>   fi
>>
>> -exit $exitcode
>> \ No newline at end of file
>> +exit $exitcode
>> +
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/rec=
ipes-kernel/lttng/babeltrace2_2.1.0.bb
>> similarity index 77%
>> rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
>> rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
>> index a50ba8fcdf..322aaf8201 100644
>> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
>> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
>> @@ -2,17 +2,18 @@ SUMMARY =3D "Babeltrace2 - Trace Format Babel Tower"
>>   DESCRIPTION =3D "Babeltrace provides trace read and write libraries =
in host side, as well as a trace converter, which used to convert LTTng 2=
.0 traces into human-readable log."
>>   HOMEPAGE =3D "http://babeltrace.org/"
>>   BUGTRACKER =3D "https://bugs.lttng.org/projects/babeltrace"
>> -LICENSE =3D "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da6a458c13f18385b7bc5069a6d=
7b176e"
>> +LICENSE =3D "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-=
4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6b015e4f388d6e78adb1b1f9a=
887d06"
>>
>>   DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-native"
>>
>> -SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=3Dstable-2.=
0;protocol=3Dhttps \
>> +SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=3Dstable-2.=
1;protocol=3Dhttps \
>>              file://run-ptest \
>> -           file://0001-tests-do-not-run-test-applications-from-.libs.=
patch \
>>              file://0001-Make-manpages-multilib-identical.patch \
>> +           file://0001-tests-do-not-run-some-tests.patch \
>> +           file://0001-tests-do-not-run-test-applications-in-.libs.pa=
tch \
>>              "
>> -SRCREV =3D "0a6632f77801f3218a288604c646f8a39cb0d2c4"
>> +SRCREV =3D "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
>>   UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>2(\.\d+)+)$"
>>
>>   S =3D "${WORKDIR}/git"
>> @@ -33,6 +34,14 @@ LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES=
', 'ld-is-lld ptest', '-fuse-ld
>>   # coreutils since we need full mktemp
>>   RDEPENDS:${PN}-ptest +=3D "bash gawk python3 make grep coreutils fin=
dutils"
>>
>> +do_configure:append() {
>> +    # when doing cross compile, the path ${B}/src/plugins/ctf/common/=
src/metadata/tsdl
>> +    # is not created by the babeltrace2 build system. It is need when=
 generating
>> +    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
>> +    # So make this directory after configuration.
>> +    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
>> +}
>> +
>>   do_compile_ptest () {
>>       make -C tests all
>>   }
>> @@ -51,6 +60,10 @@ do_install_ptest () {
>>             -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>>        find "${S}/tests/$d" -maxdepth 1 -name *.expect \
>>             -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>> +     find "${S}/tests/$d" -maxdepth 1 -name *.ref \
>> +          -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>> +     find "${S}/tests/$d" -maxdepth 1 -name *.mctf \
>> +          -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>>       done
> This needs explaining in the commit message.
I will explain in the commit message.
>
>>       install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
>>       cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/data/=
ctf-traces/
>> @@ -93,3 +106,5 @@ do_install_ptest () {
>>       # Remove architechture specific testfiles
>>       rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debu=
g-info/*
>>   }
>> +
>> +INSANE_SKIP:${PN}-ptest +=3D "buildpaths"
> If this is required, this will break reproducibility. I'm not merging
> any patch which sets this, the data in the package needs fixing.
>
> Cheers,
>
> Richard

I will fix this in the next patch. Thanks for your review.

--

Bin Lan

>
>


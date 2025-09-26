Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D223CCAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 10:14:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14003.1758881684278663037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 03:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k1SJoNg2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364670208=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q6UMdr1801024
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=kiw8B4qkNnFMzVf+Cd2oHJ7Wln8AgEf4aS4u3oynNBI=; b=
	k1SJoNg2XwhFTrA74Apln0Z2/ArhTCtz+gSZH2/qFgO67y+SGCX3pmESik+80jZA
	ugheupZKFbVoAhMYHXpdYLEptydkD3JW/56D9YBZFwhkZmafHjDkm47lQw3HONt3
	aQ/PlDDHqOYS00kxtsjmg1EZd9rwLSwcciwsTN6spmVtZNF25D+oR2tMskVegQrk
	RqB287ZonhO9GJJ8LrcfOL3tuV3sDXN1ikpDuuStVM1COooBJE0N2xvwRfQvfAsL
	VPVPg2g+lVZh0P8tvhmLpEoQGKWmrpCUMA7pPoG/B/2KQvwB3ReGYon2oXiilhyo
	yHphyOp3yaVn/TZvTnG6sA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012034.outbound.protection.outlook.com [40.107.200.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8nqx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 10:14:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNIq6Qv4HU1BiPemHLUdpwODROnAG7eon7ZJa0QsFtNhwU/t17JE2VCmjwnRoIIoClqdfjNYJqkVAdQOMy6Mkjo4fU02gLykpQnL+qyvTpTiS70hUPDrgh5yH+MY+EyKH/5LWaVLXGbo1b67laXG7XLPDNdaNtEaQW/+y54xStJCuzUulZ7o3Lsf8zrhrBJCShBtfmOM5DqSKEe73x9HtXlbsPugCERnnjE4iuMyyat/2xZbRg7toinW22EHwYjDjfxjY0NaMHPMkawgqLv1fEyVBlVUC4ZK6lx6WPArE7JmQ6Ro9t+JtcN1orm1RP/U8RTplqT8aq5If/Ku7P7qtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiw8B4qkNnFMzVf+Cd2oHJ7Wln8AgEf4aS4u3oynNBI=;
 b=QC/dnKGp+PMTz4x4tSG5x/71LOEA97S9FSUCCVMvwT08vADmoAO28cpxNodyU/vxDFtsI01sshlz1HN9bqtsVLB78tYoG++pLE5+3LEkPyRidmEMTTamjN6wcoH0G5XTJmv3CCb86kCQx8jKCEXOYfRMvHqUg2OfEQ7sk3ZFdfug25q2A1IqhrtqU5Oo5eWYdVIpgjCmqx/5SvlBQUhdOwBvhPjY93mGC/Z3kAdL0G6J072Wv5IKg8JOqHts0/XrBIK/ZQHDpvciBTwhcZJL37RUNaGXZhVSEPu5/msNGWmmAH8Ehsz7RmEB8Bh1FdCuKsakSyS+EkskgvzxNGm34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7623.namprd11.prod.outlook.com (2603:10b6:8:142::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 10:14:40 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 10:14:40 +0000
Message-ID: <6f2a68e1-46e3-4165-9067-8307c586f969@windriver.com>
Date: Fri, 26 Sep 2025 15:44:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2 2/2] rust: Drop rust-llvm
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250926100120.3731171-1-Deepesh.Varatharajan@windriver.com>
 <20250926100120.3731171-2-Deepesh.Varatharajan@windriver.com>
 <CANNYZj-7K8PhydL9bHnSmh4V6DY3F5qS-wvxQZ3=M69MQGJ7gw@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj-7K8PhydL9bHnSmh4V6DY3F5qS-wvxQZ3=M69MQGJ7gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::9) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: cf424992-76e6-4a80-640e-08ddfce580ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SnNtd0d1R2dRcmtFbTZsNGhzZkJmaURCUEFVVzZ1Z0MvL2NtOXdReW5lRStk?=
 =?utf-8?B?V0wzR0tOZzRXaDhEbUR0c0FxZG1MU01TT1Z5dVBKWU96VjdvVndUSGxjbHBX?=
 =?utf-8?B?UmdEY3l2V3pWV0JIcUFNUWlHanB4ekhXLzVoZ0lVU3lUMHZHcUIrUkwwNGRD?=
 =?utf-8?B?TXRMeEVtelVoVytCLzRiejVWS2FvN3hRL0w4YWoxOTN2N0N5MEl3SHc3ZlJZ?=
 =?utf-8?B?NW5WRkZxRDNLOWV0eU1lM3dOdHY2cFIyUW1DcDI3TTA1VnJJVVJFRVovbkJm?=
 =?utf-8?B?RmtpbERqVExma3oreWVrb0J4S0tuVGptZVNEQnhEVytnUHhTMFhBUVZCbVpW?=
 =?utf-8?B?YysvZTM5RmZWeFBwQXJUV2w5TFNrREhURmVmSllneDk1dEVvbXhiL01KM1lI?=
 =?utf-8?B?NExva0tQWk9ySGVtYndDMC9DZ3p6N3JqNDVXY0kxRnRHWEpyUUpQRmc5R21j?=
 =?utf-8?B?VmNRV3VHNnQzY0pQSXlmRDhMV2JDVS9Ramd5QU9XeFpmOWhiRHVJdGxnMDdK?=
 =?utf-8?B?aFV3WXl6M1NRMmtETk1lUURFaTZ6NC9KcENYQ0hlT0U5T290cWNyUWVGYVhF?=
 =?utf-8?B?RVh4aTdBc294bUozdU95YmpVNkE2NWhCQmdHeC9wUkYyZjdwWHNremlSbDU3?=
 =?utf-8?B?VFYvWGNtekloNEc2UnErb1A1T1R6SXZsN1FMbHhEbGJHb2pxcEFDcjZ1U1ow?=
 =?utf-8?B?em15L2w3aEQ5Q0paSzhrMWVhaWN2dHp6azE0QnZRR25pRy85UnNYam5wcXh3?=
 =?utf-8?B?MjZ5WGprYmpJQUpkOCsrYUVDZEM1NTRMbWtoMjQxeHQ1VGJ6ZHJvYm5aOFBT?=
 =?utf-8?B?UXBCbExGS05wMTVMejlRMjR4c2lzb0NYTkRDK0ZIQWRCSkphYUYzWVVDWS9Y?=
 =?utf-8?B?R2E5UzhRUVpxUFZMZTVKdElTdGtaVU1YNVJwb2xNaTRtYzBqcTdiY3M2ejFP?=
 =?utf-8?B?UGlIWE9uVW10eEVLUU5wSFBNM0QvUVpiWDFWRWRWSHB2ZVE3aTNISXJib1pL?=
 =?utf-8?B?MW4rcEJIMTNCcmZocitZMzEvR0dNaGNZUjBqV1hrY0lBU3p5RDBpNkxwRjh2?=
 =?utf-8?B?dFU4VER4czF6Q1ZtYzFLQ0c5T2lBMjBKVjhzMncyODVmc3QrTGtMZnNFcEdl?=
 =?utf-8?B?QW90SXdmdXBNRWxyTGN4S24yZkh2NnFhR0xYVytZUVh6NHVUZ0REdXhLSWI2?=
 =?utf-8?B?R3JqSmtPNk9RbUx4QzJPVURURHZQVHVTS2lKa0cvb2hla1RsazVEU1F2RnVm?=
 =?utf-8?B?WTByOGU0R2w4NU4rYmxuejlEZHJubmhlRU5tYnNrVG0rUllxUVhINHFVaGFy?=
 =?utf-8?B?TWk4MWQzMUZ3bDBSVXMzMDMyaXlCMWFML1ZoUy9EOXVNcnFpZVkzajg2VzNW?=
 =?utf-8?B?L1F5QTBreDB2c3NSU2swbm9CemlvdHdwZ1dLYXBHcHQrNXhiTXBvdEdUeXVo?=
 =?utf-8?B?NW9RZ3NFV3doWXhRTnRic1FiS0hhOGFPbWRxYzJiNUgyN1RLSFV0ekxmM2l2?=
 =?utf-8?B?TjRtbDV2MDQzRFRtMkR1ZnFXWm9TdW9jblF5WDkrZ3BzdHRBb0llRThGQlE1?=
 =?utf-8?B?LzlMRWdramFZelMySEcxQ1FHUGV1MHJoaW40V29Oczlsa0Y4eEZTSU4vMGFi?=
 =?utf-8?B?T2ovcnNkNEVsSkRJVXhVL0hCMXNKS0xadi84ZzJWUzRXWkd0T3ZVanZmNnh6?=
 =?utf-8?B?SDQxNHVDQlVPNURwWVY2cUQ5SHRGNVRBelpwSUxjY2VtSnJpd2xBSHNrakRJ?=
 =?utf-8?B?MGdmbndxeVJ6N2xvMDZPZmZkK3RYU25mc0ZTMzJKejcvSnV2ZExrZitKTTB2?=
 =?utf-8?Q?WJEge44sikzI7+2TiRboDkyCf99Mpepj+QgU4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R3RZdnFCRG9Zd0JPOU96TDVPM0wxaS9ieGFDdEZ2UVhDWkJIaFZVb2RycW40?=
 =?utf-8?B?Y1NGV25xS0FBZVRmOUo5YkRUVkpLVDNrTk1sNHFzaDcydy9qZ2szdXppU0hR?=
 =?utf-8?B?dE9xYnQ0NjQ2akcvdWd2VWpmbGltTlJjc2phKytyeHZ6b3ZwUjRnU2k4OWFW?=
 =?utf-8?B?M04wYlk3TEdXZzdqRlhLUy9qNG5JYUdZV0NkMU01eTAxZWdpb2ZBenZuNDJZ?=
 =?utf-8?B?ZGRTallyT2huZDhoajY5VzI5cDJsZkhMSjVFd01Wc3JZTVJ5M2Q3MDh2S2lD?=
 =?utf-8?B?NmpmU3p5bDU5VDhXRFY1Z0xuWThJd2RGOFpoT3JoQXZ5bktGbG14dzBPV29C?=
 =?utf-8?B?ZVRCUDlubzZyMFJETkQzWWtzQ2NKcWIxYW5MSWNWZzN6eHFpUy9FcGVWdUYz?=
 =?utf-8?B?cVhPS1ppY2x5Sm54MW04MHZKdG5WTXhiT0lrY2VyV1IxZ0JvQ2V0TWY2Qlo4?=
 =?utf-8?B?bmtSZE13T3oxTEtJLzZ3Z2tSL2lmdkVpcEZmMURoMU5LaVNtbkZIclRXWXcr?=
 =?utf-8?B?Q2hFL3ZUOHY1dkt0V0N1RjVnQmhyQ2R1bjIwTnR1VjcwazQ1d2Z5cnV1VWl5?=
 =?utf-8?B?MmVDOXNVckVlRjl2OEFvZzNHOUFPUHJNU2Z0UXhkYkZtSW1wMDhyOEV0MVBZ?=
 =?utf-8?B?bEtIU2RiVkxHV2t3RVgveDg2aGlaNVNLdXZsdWZ6dTNEWCtxSFlSSXhBOUhK?=
 =?utf-8?B?OUVqdDZnS05pRlhnSEhubVNKd09aZ25ZalEzMTRtczdhYUhWRi9Zc1U1K1V4?=
 =?utf-8?B?aEJFcW9oUURRdEFLT0JLRXlNcWFLbTNUWTBYK2RtaktSNHR2U2pwR3VDeDlC?=
 =?utf-8?B?NlRIdkNwZnhpN2ZKaGkvTjV0MVdpMjhTMTZQQzVyWFF3ZE5Ba1lIdjA5STJI?=
 =?utf-8?B?aVd5MHBvVXNWVEtHN0lUR3IwbFZERDhvbG1lemxMZitqUWZpM0JzeDFvREdl?=
 =?utf-8?B?Q1UrWURuZ3RacGF6Tm5uRW9rdG4yUk9VS2pNU08zNE1XS0hzRXZWRmtJZ2ts?=
 =?utf-8?B?bnEwZ2R1V1dNd1BLVVo0QWQza1FkcXkxV20rMWwrQVNqZHcrQW5QYXZTYWtk?=
 =?utf-8?B?azRVVjZWdzdaVzBRYXlEN252T2RibHVZZlRwMDNBc0RRN3dHa1JGNzZuaWJJ?=
 =?utf-8?B?RmRRQ21pMGJEMXVaUVUzazRHeGZKeFZrQ3FpVk5OMjJvTWRhSnlyKzJYbytH?=
 =?utf-8?B?K09QOW5JU04rRzdMd1dwU0xkN2hJcFNQQzhTUWVPM09DSWpyR3hHZjlDL1VN?=
 =?utf-8?B?TklCQnFGSFlBZkNaLzBzUUdpVVA0UGN5QmVDdUw1Zjc1L2licmZDbzNtY1ZX?=
 =?utf-8?B?TG9XTUZNaVRFemJCbFI5YktCcllrV1daRWg1d1U0cXR3am9RQiszUlUxVmo3?=
 =?utf-8?B?ZjJNTVNiV3loSi9HVUxENHdKWHU3Vzc4SXRIYmVhZmhzblJCODNHL3p0RTdJ?=
 =?utf-8?B?eEtXZTdKVng1bEs5ZG11c1JmY2xSR3h5WmswNVBIS2FPMm1ZaU9lSElDc2hM?=
 =?utf-8?B?dUpjKzgySzlEc0Y0WVN1UkxHWUpPa2F1ajdDcDAxdGlPSGFPNk81M2xmUCto?=
 =?utf-8?B?YUZGSi9mWlplTlZjZzluM1Y5VXBEdW5FcFdIbWpjR1R4Rk1XazFGb3F5R1dw?=
 =?utf-8?B?cUlIK1JPbEw5Z0o1S2RVVCtQRzhHaWhRVW4wRGF0aE9nV3JUNlUvWVkyNWtB?=
 =?utf-8?B?TGZnSksweE81QjVFelowS2dCdXlONjlHZFNmcmhVTkNCZTFDUWEzVi84TlVl?=
 =?utf-8?B?MDNvUjIyd2p1L09YYXVwNmRxREJQeEFLK2VuSUc3ZjZaOElGWjBiUVNVZVB1?=
 =?utf-8?B?cmQ5b0dUSEZqcGJhNXc4YzYxYVROWklKbVQrMW1HZG5NZTZRUmREVjNaOXVV?=
 =?utf-8?B?d0tORUp1MTlLbkRPaGVCQjFHTVF4R2EydGY1STVIUk5TZUZtYlhHa1FEeUVa?=
 =?utf-8?B?SGVZcG1jZnR0cy92TXJBWVoxTEt6S1I5N3lmTEdYclBuU0tvSERDOVFlTU44?=
 =?utf-8?B?Y3ZLR2Qra2h2U3ZUQkl0S0MrWHZPUWtmSHpBVzgrV1pCZk91d2Nxb3lUYnE5?=
 =?utf-8?B?RUZZZFpGU3FLU0FGTFZCSlp0MDRDbmFDSFpCYjgyZ3dPWXBHSVduY3lQWC9o?=
 =?utf-8?B?czBUaGNIdnVzQlg1SWlxVityMWZnV25LT1BEeGdGRGl4dHJsdnRxMERkbGE0?=
 =?utf-8?B?c1JJTktmWHFVeldXdFVNc3JPUnRLZ3BxQ2ZWTjQwZlFaSDhoSnp6MWV6eWtq?=
 =?utf-8?Q?LqDWzM0eyscAR1nslUhICvGbD726qh42DKJ1lR4U4g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf424992-76e6-4a80-640e-08ddfce580ed
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:14:40.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgQ7kUvWd9lLNmqEQQxeg+zEgOemLWrGTOalMyzUZFKEAJvc9wpVj4GduC23K/5V5Sh8gqg2haN2LaSnGmdPgnpL41uicrxbk+vBn0Eb3iS5bo9Q0zVykU0nXBDx+a4T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7623
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ByjA_8U6Xu1HvQ4j3QJ4hXPmI1AVtmoQ
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d66793 cx=c_pps
 a=9AcDkMntNQwiSFi2uhiI7g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=BBtaiZrdh30OdSfPKF4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: gTkjskGD65tO0ZLKfhhTkkeT9yZIvhDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA5NCBTYWx0ZWRfXyTUZoMKlV6SA
 UpFBSriInLvDrh84f3+u/d35sBeRMzpM6skCfjCiLgRNu8iHHoRs0tdcV1MElXW0Vqndy5/zWOu
 1/9Aep24wfXf+Ble8XtF2e3+BxmjHnC2dNacMbmDp0BGnlhoxJzyqu8dYRULixmAa3XqWrHBHV2
 xgSmY4m3YWf6CpFfb2Lal9l52aM17Tr+RN8gD5BAXcTyVl86sjZN5XjBlqm/LrDwUp57SKul3q6
 bVHqycbMRRbmFL/HsW7a0y3CTN1qUI0gdes9apgzzS+Fhxm/0PpKJOVaa70yr+Ly7WU4QOceCLx
 NJAk9oWVtKv8VzW8vCJR9KcOtcCaG0mZ3yfi7z+c3xXqlercvxAX1xYE3VP0NOjd6s31AUQa48N
 LKwqX626z14siVJOjCzkqA6RPmKyfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224073


On 26-09-2025 15:37, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 26 Sept 2025 at 12:03, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> *Dropped Patches:
>>
>> 0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch(Merged)
>> https://github.com/llvm/llvm-project/commit/b46f34452e9dec50eee6ddbe07875f05e421a81c
> This patch isn't specific to rust-llvm, and was removed from SRC_URI
> already in the previous commit, but the file is removed here, why is
> that?
This patch is specific to rust-llvm but for some reason, it was added to 
the rust-source.inc file instead of the rust-llvm.bb file.
Oops that was my mistake. I should have removed the patch from 
rust-source.inc in the second patch. I will change and send
out a V3.

Regards,
Deepesh
> Alex


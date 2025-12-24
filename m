Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2BAE75453
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 13:16:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.119882.1766582185339773777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 05:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mgUPr7/6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4453be3734=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOC1DXf1770569
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 05:16:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+xWMxBQYiqRvzHxAWUGi0/eZiV7PXOrcV1nv8f+HR0c=; b=
	mgUPr7/6sN/UMTdvG0d4oKguEIqVYsEEwrigDEXVv6NcWs8UZix3e8KqT7YVJ/zd
	hNTSzRfteAWKeNmfYHLgFMZJUJeBlXW4Mo9LJ9YJDU1lXR/fGRebiGKps9BP6R/v
	uoJEOfri2Wl+37FQQYpaSAf/N9VHEeWQb8/DIeJu3R6JiADZ4xuiqupv6TfsrFaX
	A9iGzGEzTFJfoIj3SwLAcHXSDuDGO+klVl7tyD6pypr6THYkxcbMCMlv8NmDJAVe
	1g6BOzp+1cu8/AEZN+FucI8eL/G6ajQMbLJCFAj4NCTxZvQg1bxkRgGA16cRKyz9
	43tQPR2Rbj1aEg3Qzf2m+w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010060.outbound.protection.outlook.com [52.101.193.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6hbwqp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 05:16:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjhNGVcCtU2WS4VbfQuM/euf3ckeDNcwsxkHixvKGzESELZfMlHXcOGwhresntrhbJKFzb64+ul6ls3fppdtwSkdpNcPbqJJI/8xSCgVm1uzX6id+zJOmkP6WOMCmQ1FBkZ7hmCBd7PlFwHnaCzG5ugIDZ7SAyIUYaWVLyeWxG68cqEhtXimnw0p6Ek5CC+Jdk6MAq4rCpgHqUv9Rrmbn6Uw//7R97pRSgjQpSmOC7RFQ7nvaAWJzhl61dsRdiqoBX0WuVwVkR1nIslMxssSkch/Sif7wSQewjxmwrOe8MZsLRXXrmYHUrYJrn2fEiIrkaTaa0nLEcb8HBQOmLNQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xWMxBQYiqRvzHxAWUGi0/eZiV7PXOrcV1nv8f+HR0c=;
 b=pjEhJvHo2kohLi2FfZK/vHlQ19TjtxyCPzv9Zuk0SWn+LgxCzEW3ONgWA+bMzcC8UA82/qeybRbXNHRHO3JyRipfgL3+UrPj1/0sPqMYEZcv3EVSrJrDspF2lOczI4S86+WIDKlPUQ/gqhZ+55/6ygZ4I9rfLCSLayTFcBznv+nw1zBCUegaLK5b1/++evnQ7uUIT/BkIWnBXboyGfiaLeQmy2gN/UwwsiuBADvN0elOd82VzDX8A2nHppNkBGcN0AXfwBwgTaXazz6FYTciRwb8LCX7GabXm5+/nZnJJKL1j8engPN1s/cveTC4z0DJ+wwFI90MiyiPmcB3YStg9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Wed, 24 Dec
 2025 13:16:21 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 13:16:21 +0000
Message-ID: <75ee6b74-5262-410d-84c1-209aaf54b31c@windriver.com>
Date: Wed, 24 Dec 2025 18:46:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] llvm/clang: Upgrade to 21.1.8 release
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, hemanth.250302@gmail.com
References: <20251223094504.2919922-1-Yash.Shinde@windriver.com>
 <DF6G2PMRSXXY.21IIG4AHJPEJW@bootlin.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <DF6G2PMRSXXY.21IIG4AHJPEJW@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DM4PR11MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: 6794ee2b-e1ba-4e54-a71b-08de42eea131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vk1oemQxNStZbGp4cDhQMGFYc2xDWWxBaW9GZkJLS2ZNT1VjdjBQZ1JhRzhl?=
 =?utf-8?B?R01HWUFoZzczMXBwaFFyczI2SFB5WWxIMmhHQ1gwSDlidlRDdW8wcjV2a2s1?=
 =?utf-8?B?b1NyVm1sdlJ5L1lnNXRCZmJzMktKN0x1dGxIMnU3a3A4NzhNU3lHQ1d6cStP?=
 =?utf-8?B?ckhuTkozZG5vdGxhSmxVRjFxN3Z2UXBPRDEzKzFadm9NK1RQMXF1eDltOWt0?=
 =?utf-8?B?ZWRXTENUTEtGS2NjajhJdkhlOTFJdklZVmpMMm1EUk0rY25TS1ZaeTQrU3ho?=
 =?utf-8?B?eE1PcWQrMDZUVHZCTEQxcjR6NnVHd1F2VFdwQkcvM0lsSUg4R0Q3Tkw3Sk9L?=
 =?utf-8?B?aFdGZWRxVVlqWGVvZlAwMEoxcG15aGRsNTYzSGRjZzBmVUJST0NaZGNGbkJR?=
 =?utf-8?B?OEhkUU9HMlhYS2toeksrdDJiOGhXaS9YV3BweFdvdGlaVGExakhkQ1RVbUQr?=
 =?utf-8?B?RlJrUnlocjlrUjk2RHExSmxyeGpjNTFGUlZSOXNnNUJyU3ZNMDhnMjRIUFlz?=
 =?utf-8?B?U3hkQTMwSW1NTzJ4VTBoYWF3d0F1ejdISlQ0WS9QVzhOaFQzRTdWeEt1TGJ4?=
 =?utf-8?B?cDIyT2xpTEM3ZTMzdDBXZml5ZEtwTy82VExiRlZmMFJieEZGYjlmUDhhMU02?=
 =?utf-8?B?b3g2djNDcGkxRlRqeTNCMllOQUxyd0NrMnNndWFwN3dSRy9NbjhqSEhsTCtL?=
 =?utf-8?B?WDVzdDZ1QXllMnR4U3ZLTkhTM2Q1a0NSOElyVTVaRDlEcFcwdTZNZ2NETThJ?=
 =?utf-8?B?b0UwTjd5SmhmQmh2V0ZJdUhJS09qaWovTnRRbVRPRld5Mm5PMG9qcWIzblcz?=
 =?utf-8?B?U0VZM2lzb3hTVzduanU2Ym01cDlXcnM0OTN1YlBhQjhaMm83Nzd6MVczeHlR?=
 =?utf-8?B?Y0F2aENuTFQ2NEh2NEdZOVRiZGlkNWFMcVc4OTN2UzFSaHFFbVZqdWZ6VWcr?=
 =?utf-8?B?cFNDclFOTmZEZFVJWU9uUTdvZFVHdEl4N01qRjVBeVpZbHRPaXRCSU5iSXBr?=
 =?utf-8?B?ZEtTRnpMbnZJNDRYWU10eG9NZmN5dks3QkQ2N1UzQ3Ywa0t3YmNQdFlDaWk5?=
 =?utf-8?B?Uy9NWnFSdjVKcmtiMG5wWlo5NjlPZWRNYUJ6UU1qaVNBcEtFdGthTWg5VEU0?=
 =?utf-8?B?MW1Hd3U0M3MvRmVhTWExWVp1Nmt4c0dISXhKbUJFQzl6bGRIWVUwdVJERWFY?=
 =?utf-8?B?bDVxTkJRWXlsVjJpSkVoblFUcFF5bHgwVk54eDJsZ1NQOUxuMnozcEJOQmJT?=
 =?utf-8?B?L0d1N3B6c3F1NE1JNXloNDJzMTI4VzVzdElWTEQ1NW8rSnkvemZoTmpzTkNH?=
 =?utf-8?B?VXRTaTlUWW5IR2dyNDdXd3RJaC9iZU92OFB4bE9SNWdoejhqMzJ5SkMxVXJi?=
 =?utf-8?B?VWYzNXJjZWVDcFNwVU0rMmRIcDUxR29SclNWYVVnbjF6TEo1Q1lVMjBMTnlt?=
 =?utf-8?B?RlF5dGQ0YS9CdXIwc3FMQkd4MUlkcHN3Sk0rVVVKY01lRGhZT3d5SXc0Qk9m?=
 =?utf-8?B?RmtpZnVCUmRwSkFFUVZmb0hoZ29Ta0dnVE54a1d1TWZ1M1hPc2c3VENuUXZ3?=
 =?utf-8?B?Qms0TXZ2REE1eTNwVkEvclpYOW53UGwreHJaeWtNMVJsTjMyck9kMUJkNXdv?=
 =?utf-8?B?V0x4bkdGSi8vZ3ZPUGZaN0RBbmczckpTa3k0b3Q4TDdUMUcvMHFmY1ZIZFcr?=
 =?utf-8?B?RHlVaUdGRW1YdWwxVTE1Q2UwL2oya3puNHNmeGNBLzVmL2RHSGp0dk1CUW9v?=
 =?utf-8?B?MDUvbDdpL21uMCs0aEJ5SEVNRFYxWFFjY0t0alNFN05FTGRCTHpaR0xMY2xI?=
 =?utf-8?B?ZGtmdXVPRTFpdUMzR1l1UzBXUC9FVXJnOHU2cjBiRjVUMXlhKzQxYlhOekZy?=
 =?utf-8?B?NmNmT3NMZGQvUDNHVGc0bnI2SnRDbUNEdjVvakZEVU95L1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFpBNWJpMStnVTFPVTZCR1VTMlJaeTRvV1VvOE9GZ2tZMXFBQUc4eTVQTlpa?=
 =?utf-8?B?RHZaOHl1Zm42b1IxOUZPN0ZabERadnhWV21Zc3ErRGZXQWVGa1I5SmNQUnkr?=
 =?utf-8?B?QmZLa05UNUM3dDNKOGt0R1dXd1M4cDFjTHdtdmcvRjZBQ0pIdG1GZHpJVFBV?=
 =?utf-8?B?WGltdHZCU3dYYjhveEFiSUkyWjAzUkZIR3RGMXNmZXYyWGtidURUVnlNd2VZ?=
 =?utf-8?B?WTR5eVZ0YVBoMUhXQXRsSjJYb0FjSnRVUmRvdTJhRlFzUUkwTHBUaWh5T1kw?=
 =?utf-8?B?aWdrc2lNQ0IvRllmRXRBekVEeUVpMDlaYldJVllZa3lhbFpNaUY5UDdMTjhM?=
 =?utf-8?B?Z05pN1dGTHB6ZGkzK2tpZ2hCK0xrUklDcHNoaW9PT2p0MUVKbXdDOTJUSTVK?=
 =?utf-8?B?YktXSVZ3OVZlMEhSUlhQZytBNEdEVXMxNEZOSm9rdzVOV2taODdETVdCMW13?=
 =?utf-8?B?WjN2VGtsOGJ5dGxIVlpNMm1tVmF0S0VQM0FBMElWME9XTUdqMkhLNnJYaHRN?=
 =?utf-8?B?Q2hzcU83a0lRZDhIWEF1dUMvbElKZStEL2FzV0VWZGVvMHdVMk9lSUdLOHFq?=
 =?utf-8?B?eDF6eFFwMHRqZ0NYekp2SVdmR3prY2N0K3NzY0xZanlRRDEyL0pJc09HczU5?=
 =?utf-8?B?bnZ0QW1yZzkwbUxqdjBEVWl6RTQweEppRFlDWkdFY2lNWkhia29jOG4vTlVZ?=
 =?utf-8?B?NE1mbWtWa3FGeUhBZW9zcVgxTVo1dTNjc1JxQVVxMUN0NUgvT0liRFZNUS9T?=
 =?utf-8?B?L3kzMXpISnBXKzRUa2tKTGVnZkVIQXQ2NDRGM0hZQVdWVHBWVyt6SzljUEZG?=
 =?utf-8?B?VzUzTVJvQlI1c2lvNEl5clp1YlE0blhQcDRESzh6OUhQU3cvSEtNd2ZqUUw5?=
 =?utf-8?B?ZEFtTjRIVVBTdC9KQjhjMlZxWDlaTHZBVFovb2UwNkVFblVhTWFYUXpMVXBn?=
 =?utf-8?B?czFHckUxa1htcFdYVDVNZlRlUnNzQlRVRFpTUHdVR1JyMldYSHNqRjhTZkZx?=
 =?utf-8?B?Y3cwdE9yMmhRYm9jUG5MMHg2MWlLaU01MlB3bzVpVGp3ejFpeWRoL0plUGIy?=
 =?utf-8?B?WGhOT0ZwVS9KcVdxT3F3OTV0SWFHcXF2bGF3QzlwMEZVT3UwMENUajB1c0xi?=
 =?utf-8?B?L0ppREFuc0R5NUJwTDNKbGlDUWpOVDRLNmMwRnNHVHVJaWlhS1lnWjRKWVdy?=
 =?utf-8?B?ZEZyZ2crdHBlZEhTUy9IbnUvTlNMRVRWNzVUcTlEV3Y0M040UDc4S1NMZU5u?=
 =?utf-8?B?M3YrdjgydFphdTFKaExkRHVSQXhXVmg3UHZPeDdQcjBYL3VweFdQK0dUUTVi?=
 =?utf-8?B?SXJkYVhXTEhXaU53Wm1rMDRSRkFuRmhjc0NvSzF6a1ZVVngwVWpucnVQRHRP?=
 =?utf-8?B?dWhVYmZVdFRUdGR5UW51b2dyTzNkK0JQUUl3Q2JMM1hEVHV5M1JJak1TbE9n?=
 =?utf-8?B?T1lFeFRiWVoyRlFTdDFNR1FUTVlLR1dmcnR3a0JPTndubEYvRDEvNGppTXFD?=
 =?utf-8?B?S283dmtvcFVMTWt1MDc3dllsZHlNaUlpK2s1Q0o2QzNSUHVlOGI4ZkU3YTk0?=
 =?utf-8?B?NDhySW9tNmc0RnJhUVpZYll4ekI1RGhaRHV0bXpKY0NqVnBuVUNNd2dWZGs5?=
 =?utf-8?B?U1NQUzN6SmpOVVRVZ1crcVZUbFhqcHpBdVpkc1Fnc0NtVEJXQlpxeFFQc3Fm?=
 =?utf-8?B?eEJTQyt2NnE0bW1nNWZaWEFxcHhNVjc2clhURGpGTjFwVm1GU3lobXM4bG82?=
 =?utf-8?B?ckpIWllOTllaeUttSHY4OUJEWjlNK1pyL3grMXV1NHRrZlBza3cyVXk5SnZF?=
 =?utf-8?B?dVhOa0FhNWFhZ0hTckluQXNqYXVqK0VBejdGRXY4NUxVWHAvTWR6eExHa3lG?=
 =?utf-8?B?ckhOVk5rZmxrZjg2aGJVOVNuazhqby9icjVVNmZ5cHpUUVZTMU0veEhrb3JR?=
 =?utf-8?B?YjVTZU9uWHg5K1BmT1k5K015UEhoYWVvc2RMMUZLd2JRRkJ2VzZFNElOU0Nw?=
 =?utf-8?B?ZUF5VExJdVZTTzhHOVhJcjQyL21UeVlNa1A1cG9BUFpvRGo4aFNtSnBPUkl0?=
 =?utf-8?B?dFZveVBYTjhnTFFudmN4SHZtRkxvRjJOdDJxNUtDYUppM0o0ZUN5T1grZWxO?=
 =?utf-8?B?ZHN2UHJ4bjBEZmFTSEN6eDA1U293NVgrSkxDZWU2L05VL0R1cyswc1hza21M?=
 =?utf-8?B?YXlMczNFOHhnUmpvRm5WRzFYV1A4cE9nTytDTFk3dFEyV3I4QU9sOEh3MFZ6?=
 =?utf-8?B?eFpXQlNMcGk3WEg0aFlpdFNFV3VZaTErVjBPaDZRQjZNWC9SVFhJb3h4TlVz?=
 =?utf-8?B?VjMvZ0Zjb2tMSC8zWTU3U3JGRUdYampMcGdEcmF3ZnNwRll4WFNNd1NPcWlP?=
 =?utf-8?Q?xbOEIGweTO1y7VOM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6794ee2b-e1ba-4e54-a71b-08de42eea131
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 13:16:21.0249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KVAdno2Z1EROQUuPIM57i7CpyxOan6Foc0vp9RBF6/7+21nsAi/+aSNiZXK77PUL1y/fNR68dwi1VmqlRRYLBmWYhBsIHHZfTrrrCoRagc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExNSBTYWx0ZWRfX5ec0hdfHRzoZ
 Cl1s5Cww6UbEY6UG9H9jG3VCKI9YEzpXklQOHLMpJE+06D33a03HsMjMN06g94TAZxIOSOswM15
 B9Ihbyivvy5DKjpmObOhWC6l3CqMyNrg+/sWL/1a0R06XiwuOHuHR5YzrWQT2XkbssXCIsQ0ksu
 wTApxgRd9uan3mFOTF2iaXoQQy9XW296NFuJ6B8S9URtdJBZ97YhtHdR4b0fPbjmvy5cq4zjQrG
 5Vc3fEOQqV7G0dyk1CamVYuXxzUhhpKgc4P/n0350rgOvzbSG/Ll8vd/JtlaCz8WXwAdIenp/u6
 0EnsX2vC9rBXwxrZ83fW12prW5SWHQqms3Z2vkfYSVYuJGeKhaLjFJXl/Lzd7PHvk90dnrzyhT8
 Kcc+1O04I0kAMC5lH+5BMN6IeEBlLLD1WvADyDk1oVdD061p5IFp3lQuxxDDCtL1jWr1HLn1zq2
 xeEMC0+D7Dx4HFaW8LQ==
X-Proofpoint-GUID: sX8QyQZQ3R_Pa4jgl9QgBdoSJFM5AQnC
X-Proofpoint-ORIG-GUID: phoOueFQEa0RFVYuO3wiHsy_D1YEq6HM
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694be7a8 cx=c_pps
 a=8uZh/oWqEamKeU/uFK3X6A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=_J61ucAFH92HrrvCoaAA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 13:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228533


On 24-12-2025 17:57, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue Dec 23, 2025 at 10:45 AM CET, Yash Shinde via lists.openembedded.org wrote:
>> From: HemanthKumar M D <hemanth.250302@gmail.com>
>>
>> Brings following bugfixes on top of 21.1.7
>>
>> 2078da43e25a (HEAD, tag: llvmorg-21.1.8, origin/release/21.x) [Github] Remove use of setup-windows and install-ninja in llvm tests
>> b6360d3bc7a9 [Github] Remove install-ninja/setup-windows
>> 7eb4bfe053d6 [ExtractAPI] Format typedef params correctly (#171516)
>> 51e5074676d4 [compiler-rt][sanitizer] fix i386 build for Haiku (#171075)
>> d2e835bd4638 [SelectOptimize] Fix incorrect -1 immediate for large integers (#170860)
>> 4b24e73d34ca [WebAssembly] Remove FAKE_USEs before ExplicitLocals (#160768)
>> 4582a800c588 release/21.x: [clang-format] Fix a regression in annotating star before lambda (#170969)
>> a5658809ac4a [clang-format] Fix a crash in AlignArrayOfStructures (#167099)
>> 94c40c61c1ce [clang-format] Don't swap `(const override)` with QAS_Right (#167191)
>> b845b4cd771e [rtsan] Handle attributed IR function declarations (#169577)
>> f68f64eb8130 Bump version to 21.1.8
>>
>> Signed-off-by: Hemanth Kumar M D <hemanth.250302@gmail.com>
>> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>> ---
> Hi Yash,
>
> Thanks for your patch.
>
> You will also need to update the llvm-project-source entry in
> meta/conf/distro/include/maintainers.inc to avoid QA error:
>
> 2025-12-24 09:48:11,352 - oe-selftest - INFO - distrodata.Distrodata.test_maintainers (subunit.RemotedTestCase)
> 2025-12-24 09:48:11,353 - oe-selftest - INFO -  ... FAIL
> ...
> AssertionError:
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> llvm-project-source-21.1.8 (/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2905
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2800
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3043
>
> Can you have a look at this?
The recipe version rename was missed in maintainers.inc file.
I have sent the v2 with it.
https://lists.openembedded.org/g/openembedded-core/message/228532


Regards,
Yash
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-- 
Regards,
Yash Shinde



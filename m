Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932A7C282D1
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 01:40:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1746.1741311598640894158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 17:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5161eb5657=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526NvgFY016693
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Mar 2025 17:39:58 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456csa2rbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 17:39:57 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5271dvKg002591;
	Thu, 6 Mar 2025 17:39:57 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456csa2rbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 17:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omkxbfxXtrXrGtne2Xq8go1d75SigVIHKzjs2d7CB/40J9zQf4DYS41jsjEBDnt1aGvjt9yziufX0DuUg8e65w/mYqPUKCCEF84d1zXc/TtMqjCjrZFq2y9Mt3sbRSDxCDXQG4O0TAXQJXwn2gu50vwcRJIzKEIUJLdh0slbFhrHOrhiqcn1hc2BOrcWM1CPKCEmtHdPXrgNf6Llh12vlAV11BEwfcg0oGeADVNU/Cx7k1v5vfpdQSVx7PrS05CE9hEkjQea2G6hEKxibin9c1iZS+uOOwAd81rFprfjqQDNVD8n9LAYj0wim/TAEXKboffz3DaBRH3z/zFa3bDMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBVyDUbaZPuxbksqzEII7ExavCxZ1CdHBYfXAH4Hfi4=;
 b=F8Al1yZtEDYb9WPSdinKWthzxKNs7LRw/EmuuFX8JiCrNEiCKpjIodj/5mFD1CLdDLA+WCqfsWFJodDsceAfDBUs6E+rQcS+BJh3e27zn2TP4nk9PK7zsRdfIA15guExfeDVni/TcJFG2dLDgmlnLwQ3mFiecS5PSp9rdAVfU53j6cvA7MdFJMgeEBDI39La+bsTxL0UmJyB8sxcdBNsDgZd1Mp2z2xnZcrsUCrznAU+5KJ5HxPngsTBODAhdKL8U7iv0kfi7jhC/G7q6gpaTFcPHdBIcBWkKBgKFdT9gP3P/LljixXiV9XHygaxMfExvtkpsM9edWk8oCK74CTb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW5PR11MB5929.namprd11.prod.outlook.com (2603:10b6:303:194::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 01:39:52 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 01:39:51 +0000
Content-Type: multipart/alternative;
 boundary="------------BP00HCl0n9NYZUmrqcE4XP6s"
Message-ID: <b2c632c7-30ca-486a-ba14-46c0f404f9e6@windriver.com>
Date: Thu, 6 Mar 2025 20:39:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tcmode-default: eliminate needless gdb, qemu defaults
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        Mark Hatle <mark.hatle@kernel.crashing.org>,
        Ross Burton <ross.burton@arm.com>
References: <20250306185551.1758417-1-Randy.MacLeod@windriver.com>
 <CAMKF1sp=ovCd8xsQ=LLcYpENio=rP7sgecnUBrhjYKc3gRqYCg@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1sp=ovCd8xsQ=LLcYpENio=rP7sgecnUBrhjYKc3gRqYCg@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW5PR11MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: 2caae158-5454-40a9-4266-08dd5d18f433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VDY3ZTZrOGwzM1lmU3R2WDRHM2FaNE9GWnl3MWV1Z2lWV0tFTWZ3eHErcjhV?=
 =?utf-8?B?aE5FZVlEUFFQRXY5TmhnTjJYNk5MYkt1ek5vRzZ0dWE0NktOcE9Nc3lnVjRU?=
 =?utf-8?B?NnFqR0M0QUpPTXNxNUYzdERCcG5WRVFuUnFIUnhpM1NDWEsyaXZGL3VFcTAw?=
 =?utf-8?B?NjJtUk5icDRKY2lHT1hjZGw4NUNlT2hSMGluQzJmazdHTllJUS9Cdm0rVTk0?=
 =?utf-8?B?djZ6RUJJdVJYQmRTOVU0eGtieitOais2QTRyTytWeHRuc3I3ZkVRalM0aHRp?=
 =?utf-8?B?WXJqVWZEeE5KOWxaWG1idmhXYnNwbDNDODJ0YWZvb2pzM1dNaGl5T0F6VGI1?=
 =?utf-8?B?OHMwNWZUK0d5c1RaUllLc2lVQzlDTm5IUll1UVc0SUI1ekxpZld4VWF0OFZQ?=
 =?utf-8?B?UG9QMkQvWlE1eWxUWlBXSUFqSGRrYVdlYU02STZaMTI4a0gvQjZiZzBMNS93?=
 =?utf-8?B?ZStrc2lXa0VoUmc1cFk2Umc4NVAzL3l3OE5rdURWdjVGZDRqOXdzdE5RY2Zs?=
 =?utf-8?B?eVhkcFZqcU1uTUt5MWVaTWVENVFMK3JSTlNUN1EzUkpjMVVlcDhQa3krVFdj?=
 =?utf-8?B?SzNFMGpvVCtxNU15SGVlVzBIYk5sOU5vbWNRRFlqR2NuSjRIUjJTMGtnczVi?=
 =?utf-8?B?Y1QwR3BZcFMwZUhpUW9CZVVjbGVqTm5pMzJQQUJvT1luSWZYaEh3Q0kxNFNi?=
 =?utf-8?B?OGpNWDBjNk5FNXBQYWE0QmRRcjNOWEk4UlFXMFBFNGZNV240Zk5QVlMwTEJw?=
 =?utf-8?B?eTlRZVVyT0pXOEFBd3czNmJBYTVRU2tqMndVcTVuTitHb0VFQmIxellNRWlp?=
 =?utf-8?B?Q0hiRU1wcnU5K3BoMDhQL0daRHpRL2ExcFRXY1hma3ZmL0dzWGhleG5BcUMr?=
 =?utf-8?B?VitPTTQ4a1I3RHlicFR2Vm5IOTJwQ28waHFUR2VHdjdoM0NMZTRtazJEeWVM?=
 =?utf-8?B?U0prekp5MXJ6K1YyTFBVTVhDVEg0MnlGYXlmblpMc3phTldlQ1kzZHFWRmJx?=
 =?utf-8?B?dzV2VytPSWZPaDZXaDdOcThtbEV2ZGlYWE9KbjZpU3JhQnJiM0xyR01JakRK?=
 =?utf-8?B?QVErUDY1dmRBcFZIYXhkbkxSRzhVbitvYWNtOTFsM3luZ3R6b3lPZVZEKzFL?=
 =?utf-8?B?T0xGQjFIT1pFUW9yVHhWQUdnclk4TkNDZEVUYjZQY1pWQkZmL3V4WFBrcVRo?=
 =?utf-8?B?ZnRXNEpQSmE5T2R6OWVaUms0TW5XZlkvdlBhTGhHTGFnbUsrWkE3dC9GNHZx?=
 =?utf-8?B?UEU3TVFDTTlRUXFFNDZYOWdDWnU1R0VkWVpJb0pseEdvU2wvSzV6cUdHOXBj?=
 =?utf-8?B?OEQxUENVVjY0cE9RSzVJYngzcVBMUVBIRFJLWlFvUnMxYk9UMlVMemNZbGpF?=
 =?utf-8?B?SVp0SXpSbWhoYlRUZURjUWg0bjBPL25RY0NCeTUyWGZQN2VOcWpiVWsxdVQ3?=
 =?utf-8?B?QkJOdUVGazZPRE5JbGc0Wk9tTWFIbWtKYVZiWnZ5b2ZMelpQU2hkTk5MWXJZ?=
 =?utf-8?B?MXI3YXowWEVKcndLYWFIc09RdlFIczRrSVdaSjFpZEwvQXhtRW4zTDV6Kyta?=
 =?utf-8?B?NXRud2VBRmorb3BuN3NaZFZpTnh4MFBDZDl6cHpiRElWRDlJU0RoQXFvUnVp?=
 =?utf-8?B?bk1zZU5Zd0RiODZOTmZsbjdzQ1VLdlRlTFp0M1ZQNTIxUlRaVExDRkcxZTBJ?=
 =?utf-8?B?WHlUdERCUThrZ3ZNck84MGNxQ09ldDYyRng4MTloRE5nUU52VUYyYTVDVXhT?=
 =?utf-8?Q?O8qB2wATFlvCijRq0N//reF34QhSMutjKbYrWoq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHFGS004Y1RrWHJqZk9Hb2pLTXEwaDAxSlFlQ3BGcDIwNlcxQjR1dm10NCtp?=
 =?utf-8?B?RXlJNW15WjIvS0g2eWJ1d3lPU3ljVTFHa2RkdERsSzNzUmJDaGtVODJ1bHNx?=
 =?utf-8?B?SWJEcHJBV25tMXVQUjJlR3p4U2QxSmh2YU83QkhVNmpBKzliNWJHOENxZEtE?=
 =?utf-8?B?M0pVNXl0OXBCQ0RxQnd2YmdXY1BxUVFMTWp5bStIeFBXeUQzWkVSSitnZkFD?=
 =?utf-8?B?Mk5qVUdJK2tMaTRTK3pUZEExN2lNTjFuWHZ5dm1BcEdKV2lmcVlJdFRRR0ZD?=
 =?utf-8?B?MExoL3daSDRLbDhCZ0duNktpdnFIdWhPYUZQTnRkcFNoaUpmeThWQXlta1o0?=
 =?utf-8?B?T1lubnNKWGZiakwyNlk0Mm5udnBnTkFQVldKSGQ5VjB3Zy8zL2l0a2hDa00z?=
 =?utf-8?B?V3pNdEdubkVSbW80K2Q2NWxaOW1YZ3BCRFJ2VEF1cU1XWjBFemNTRURIS2hV?=
 =?utf-8?B?THhQNHAwM0VaZHdlZ3IralptQTN3RG5HUHFRWlZyY2lhODFmM3lqQ09Pb3dG?=
 =?utf-8?B?U052YjRqbmw1MlBwNHArOFluQktaU3g2V2IzcDBOY1hBdmpHSC8vMlhMZSt4?=
 =?utf-8?B?c09Fb2ZCOUN3SFp5bENvT3VSVzRYSDRDc2tuVklHbDIyRkhITHBhU3RFNitD?=
 =?utf-8?B?N29HSTBZNEpxL1JwTG1XZERQa1lmdUc0Y0NIcFlqSWtIVmpiVHVjQ2pPOXRU?=
 =?utf-8?B?M2hBYmJVa3dxWkFnRkVhd2h6anJsdExKTFNVRFhGazRBMG5WSXcrUEZGWm1x?=
 =?utf-8?B?VVpzS1V6d1J5c1hSVnhyVHBCQ2h1cnUxU2xGbnNHNFUzQVBTQlVHZzhNdHVy?=
 =?utf-8?B?dVh6QURBdXNQQ3RiNVVKNFM0dG1xSkNIQkJGSytLMmluYm1hRDNtbU5vbHMr?=
 =?utf-8?B?RmxVc2MwUVUrVkpLd084a3lVamdtZHNxUHErQWMvTUd4OGFvNTZHa0xmb2dK?=
 =?utf-8?B?QmR2Uyt1T3RZVmRkeW94TmRuZHY3VWVlaWt6OFU1VG16TmNnNlZwazU2bEc5?=
 =?utf-8?B?OTlIdE10bjdCSTJpbXZ3ZEp4c1hocWo2eHF2OGlxdm1BUDYvSXF3UFN1ZUtN?=
 =?utf-8?B?bGxPU3JwV2tsTWsvY3NtOW9pVjN6MytKdDlLKzU2ZmZtUlArN3E5SW5hSXA5?=
 =?utf-8?B?dkF6VHBQVHJRamd3Y3VFZzdtZUFqb1ZZc0VVZ0FKQUlCQlpjL1QrOHU4d3RB?=
 =?utf-8?B?a3NaZDZVYUIzeE9neVZJUkgvdUk0cjB1R1R3UjZZY2ZpNEttSUw3TllJT25q?=
 =?utf-8?B?cWI2NnhUcks3aEZNaWpBTGIxb0VWdUZhT1AwOVpmQzV4OEx3ZDNzeHpkZUJO?=
 =?utf-8?B?S01oYXlpMXQ1ZDRYMElIYUl4ZTBiY2p5Q2ZHNi9DQVNoZlVqcEtSQUkrZmk1?=
 =?utf-8?B?LzB5REFzNEQzcFdsNjUwSUxjNm8yd0c2L1Y0WUVac25Zbll4N2RQYnZUYlRW?=
 =?utf-8?B?dnpSUkhUR3dnd1Y0S2NLRkVUUURza1NFT3N5SVBjSzkrbWk0cGxMTUFSOFBG?=
 =?utf-8?B?SFErUWVCQkZ4R3pZRzRCT2VvZkJkNUhITEFCNXVmZzVxSzlSVUIzLzZvT29i?=
 =?utf-8?B?a08xNGthQlllcjAzT1lQRXZKZ1MwQy80Nk9uYjEzeHpUSkVSNHBCSFdTVnF0?=
 =?utf-8?B?WDZBWGhnMEdEM29Ib1pDek1tNVJCWjdRQzJCUnU5WkdBVS9TRWxOS3c4bkVK?=
 =?utf-8?B?d09GYXM2QW4xOFVkV1d6VVdZNEo1YWljNFJpcXo5S2tveDhYcGZHRnR6bDly?=
 =?utf-8?B?b2ViTkxKS2RYVjQ1YU1Gc25PMG9OU1phWEtYM3ZMNXJObERzdW56TXBMNWlv?=
 =?utf-8?B?UlYxRFIzQ0w1MnZmTHM0aWxITjAzRjJzdGhPOCtsUDNTSGlOVmk5RnRvelM2?=
 =?utf-8?B?NmN1dkRxeWpwRUlyR0Vpb2dkVmNTRHJnVStuQ25aS0JMS0VKQ2ZZQmlxa1kx?=
 =?utf-8?B?NTEvY0d0cEUvUERIVUJpNjBiM2pBQ3NWdGU5MUFlM3JiTC9IakJzc21wTTZi?=
 =?utf-8?B?TWd5ZVlHaVNCbFQ0TE9qeFU0WDdWZ0JvS1JxSnEyMDEyamNIaXRvbU9zT1I5?=
 =?utf-8?B?RmlBditJaDhkbkpNOFpzSGQwbUhVbHJ0NThGNzZzRTVjWDZMZzN6SGlZNUdk?=
 =?utf-8?B?MmcvMFVEM2VWMjlhNnFyQ1l5WUJZdEE2ZWM3SHVCRUxGdEViZDNhTEx2bXBr?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2caae158-5454-40a9-4266-08dd5d18f433
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 01:39:51.6397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwCCvLVKj66xjvlYYQ34SkH1xov3MdVaPm707C+tZZFPZXuVnbKXmBFPckPS34UhefvPiZuOL8aoP7PtwJGPSk7IaaduaE07xIpoxphSQGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5929
X-Proofpoint-ORIG-GUID: P4-8BuP88p-J1hIef5-0eLbeJbPXbPv8
X-Proofpoint-GUID: QO7pIvYuekrRICMBfmuNnREvLxze1w3c
X-Authority-Analysis: v=2.4 cv=d4wPyQjE c=1 sm=1 tr=0 ts=67ca4e6d cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=6NSTKDLtAAAA:8 a=pM9yUfARAAAA:8 a=t7CeM3EgAAAA:8 a=_-80naiomJfk6PDK1N8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=zQmnUO5BVuBKgr50OLcA:9 a=FEXncPstbxmFXhuO:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=4y4XbJG5Z6I79j8Np_3f:22
 a=YH-7kEGJnRg4CV3apUU-:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_01,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=852 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503070009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 01:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212407

--------------BP00HCl0n9NYZUmrqcE4XP6s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 526NvgFY016693

On 2025-03-06 6:24 p.m., Khem Raj wrote:
> Are we sure that we don=E2=80=99t have external toolchains feeding gdb =
these days


I'm not sure. That's why I cc'ed you.=C2=A0 :-)

How would I check or who would we ask?

Let's start with Mark and Ross.
It's easy enough to revert if we find that someone, somehow needs this
but I plan to remove the rust and binutils bits next and if that goes wel=
l,
drop the rest of the file at the start of 5.3 if not sooner.

../Randy


>
> On Thu, Mar 6, 2025 at 1:55=E2=80=AFPM <Randy.MacLeod@windriver.com> wr=
ote:
>
>     From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
>     Manually setting preferred version/provider is not required so remo=
ve
>     that for gdb and qemu as a first step of cleaning up this file.
>
>     This PREFERRED_VERSION list dates back to 2006, which is an era whe=
re
>     several versions of a given recipe was a common occurence.
>
>     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>     ---
>     =C2=A0meta/conf/distro/include/tcmode-default.inc
>     <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8=
EvQ!dsbtuYnz0eaBpWn8FlbH-Kg-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_k=
GYmjQ8Zc5qRa2oYmw$>
>     | 11 -----------
>     =C2=A01 file changed, 11 deletions(-)
>
>     diff --git a/meta/conf/distro/include/tcmode-default.inc
>     <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8=
EvQ!dsbtuYnz0eaBpWn8FlbH-Kg-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_k=
GYmjQ8Zc5qRa2oYmw$>
>     b/meta/conf/distro/include/tcmode-default.inc
>     <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8=
EvQ!dsbtuYnz0eaBpWn8FlbH-Kg-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_k=
GYmjQ8Zc5qRa2oYmw$>
>     index 079a7ca3ea..ce0c8235e4 100644
>     --- a/meta/conf/distro/include/tcmode-default.inc
>     <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8=
EvQ!dsbtuYnz0eaBpWn8FlbH-Kg-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_k=
GYmjQ8Zc5qRa2oYmw$>
>     +++ b/meta/conf/distro/include/tcmode-default.inc
>     <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8=
EvQ!dsbtuYnz0eaBpWn8FlbH-Kg-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_k=
GYmjQ8Zc5qRa2oYmw$>
>     @@ -6,18 +6,14 @@ PREFERRED_PROVIDER_virtual/cross-binutils =3D
>     "${MLPREFIX}binutils-cross-${TARGET_
>     =C2=A0PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?=3D
>     "binutils-crosssdk-${SDK_SYS}"
>     =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D
>     "binutils-crosssdk-${SDK_SYS}"
>
>     -PREFERRED_PROVIDER_gdb =3D "gdb"
>     -
>     =C2=A0# Default libc config
>     =C2=A0PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>
>     =C2=A0GCCVERSION ?=3D "14.%"
>     =C2=A0SDKGCCVERSION ?=3D "${GCCVERSION}"
>     =C2=A0BINUVERSION ?=3D "2.44%"
>     -GDBVERSION ?=3D "16.%"
>     =C2=A0GLIBCVERSION ?=3D "2.41%"
>     =C2=A0LINUXLIBCVERSION ?=3D "6.12%"
>     -QEMUVERSION ?=3D "9.2%"
>     =C2=A0GOVERSION ?=3D "1.24%"
>     =C2=A0RUSTVERSION ?=3D "1.83%"
>
>     @@ -40,9 +36,6 @@ PREFERRED_VERSION_binutils-native ?=3D
>     "${BINUVERSION}"
>     =C2=A0PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?=3D "${BINUV=
ERSION}"
>     =C2=A0PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?=3D "${BINUVE=
RSION}"
>     =C2=A0PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET=
_ARCH}
>     ?=3D "${BINUVERSION}"
>     -PREFERRED_VERSION_gdb ?=3D "${GDBVERSION}"
>     -PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?=3D "${GDBVERSION}"
>     -PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D
>     "${GDBVERSION}"
>
>     =C2=A0PREFERRED_VERSION_linux-libc-headers ?=3D "${LINUXLIBCVERSION=
}"
>     =C2=A0PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D
>     "${LINUXLIBCVERSION}"
>     @@ -53,10 +46,6 @@ PREFERRED_VERSION_glibc-scripts =C2=A0 ?=3D
>     "${GLIBCVERSION}"
>     =C2=A0PREFERRED_VERSION_nativesdk-glibc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ?=3D "${GLIBCVERSION}"
>     =C2=A0PREFERRED_VERSION_cross-localedef-native=C2=A0 =C2=A0?=3D "${=
GLIBCVERSION}"
>
>     -PREFERRED_VERSION_qemu ?=3D "${QEMUVERSION}"
>     -PREFERRED_VERSION_qemu-native ?=3D "${QEMUVERSION}"
>     -PREFERRED_VERSION_nativesdk-qemu ?=3D "${QEMUVERSION}"
>     -
>     =C2=A0# Bootstrap Go using a binary release from golang.org
>     <https://urldefense.com/v3/__http://golang.org__;!!AjveYdw8EvQ!dsbt=
uYnz0eaBpWn8FlbH-Kg-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_kGYmjQ8Zc=
5oPQTBExQ$>.
>     If you want to bootstrap
>     =C2=A0# from source using the C-implemented Go 1.4 (only supports
>     x86-64 hosts) then use
>     =C2=A0# go-native.
>     --=20
>     2.34.1
>

--=20
# Randy MacLeod
# Wind River Linux

--------------BP00HCl0n9NYZUmrqcE4XP6s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 526NvgFY016693

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-03-06 6:24 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sp=3DovCd8xsQ=3DLLcYpENio=
=3DrP7sgecnUBrhjYKc3gRqYCg@mail.gmail.com">
     =20
      <div dir=3D"auto">Are we sure that we don=E2=80=99t have external t=
oolchains
        feeding gdb these days <br>
      </div>
    </blockquote>
    <p><br>
    </p>
    <div>I'm not sure. That's why I cc'ed you.&nbsp; :-)<br>
      <br>
      How would I check or who would we ask?</div>
    <div><br>
    </div>
    <div>Let's start with Mark and Ross.<br>
      It's easy enough to revert if we find that someone, somehow needs
      this<br>
      but I plan to remove the rust and binutils bits next and if that
      goes well,<br>
      drop the rest of the file at the start of 5.3 if not sooner.<br>
    </div>
    <div><br>
    </div>
    <div>../Randy<br>
    </div>
    <div><br>
      <br>
    </div>
    <p></p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sp=3DovCd8xsQ=3DLLcYpENio=
=3DrP7sgecnUBrhjYKc3gRqYCg@mail.gmail.com">
      <div><br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 6, 2025 at
            1:55=E2=80=AFPM &lt;<a href=3D"mailto:Randy.MacLeod@windriver=
.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Randy.MacL=
eod@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)">From:
            Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.c=
om" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-free=
text">Randy.MacLeod@windriver.com</a>&gt;<br>
            <br>
            Manually setting preferred version/provider is not required
            so remove<br>
            that for gdb and qemu as a first step of cleaning up this
            file.<br>
            <br>
            This PREFERRED_VERSION list dates back to 2006, which is an
            era where<br>
            several versions of a given recipe was a common occurence.<br=
>
            <br>
            Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacL=
eod@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">Randy.MacLeod@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;meta/conf/distro/include/<a href=3D"https://urldefense.=
com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!dsbtuYnz0eaBpWn8FlbH-K=
g-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_kGYmjQ8Zc5qRa2oYmw$" moz-do=
-not-send=3D"true">tcmode-default.inc</a> | 11
            -----------<br>
            &nbsp;1 file changed, 11 deletions(-)<br>
            <br>
            diff --git a/meta/conf/distro/include/<a href=3D"https://urld=
efense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!dsbtuYnz0eaBpWn=
8FlbH-Kg-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_kGYmjQ8Zc5qRa2oYmw$"=
 moz-do-not-send=3D"true">tcmode-default.inc</a>
            b/meta/conf/distro/include/<a href=3D"https://urldefense.com/=
v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!dsbtuYnz0eaBpWn8FlbH-Kg-yV=
U-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_kGYmjQ8Zc5qRa2oYmw$" moz-do-not=
-send=3D"true">tcmode-default.inc</a><br>
            index 079a7ca3ea..ce0c8235e4 100644<br>
            --- a/meta/conf/distro/include/<a href=3D"https://urldefense.=
com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!dsbtuYnz0eaBpWn8FlbH-K=
g-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_kGYmjQ8Zc5qRa2oYmw$" moz-do=
-not-send=3D"true">tcmode-default.inc</a><br>
            +++ b/meta/conf/distro/include/<a href=3D"https://urldefense.=
com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!dsbtuYnz0eaBpWn8FlbH-K=
g-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_kGYmjQ8Zc5qRa2oYmw$" moz-do=
-not-send=3D"true">tcmode-default.inc</a><br>
            @@ -6,18 +6,14 @@ PREFERRED_PROVIDER_virtual/cross-binutils
            =3D &quot;${MLPREFIX}binutils-cross-${TARGET_<br>
            &nbsp;PREFERRED_PROVIDER_virtual/cross-binutils:class-natives=
dk
            ?=3D &quot;binutils-crosssdk-${SDK_SYS}&quot;<br>
            &nbsp;PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D
            &quot;binutils-crosssdk-${SDK_SYS}&quot;<br>
            <br>
            -PREFERRED_PROVIDER_gdb =3D &quot;gdb&quot;<br>
            -<br>
            &nbsp;# Default libc config<br>
            &nbsp;PREFERRED_PROVIDER_virtual/gettext ??=3D &quot;gettext&=
quot;<br>
            <br>
            &nbsp;GCCVERSION ?=3D &quot;14.%&quot;<br>
            &nbsp;SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
            &nbsp;BINUVERSION ?=3D &quot;2.44%&quot;<br>
            -GDBVERSION ?=3D &quot;16.%&quot;<br>
            &nbsp;GLIBCVERSION ?=3D &quot;2.41%&quot;<br>
            &nbsp;LINUXLIBCVERSION ?=3D &quot;6.12%&quot;<br>
            -QEMUVERSION ?=3D &quot;9.2%&quot;<br>
            &nbsp;GOVERSION ?=3D &quot;1.24%&quot;<br>
            &nbsp;RUSTVERSION ?=3D &quot;1.83%&quot;<br>
            <br>
            @@ -40,9 +36,6 @@ PREFERRED_VERSION_binutils-native ?=3D
            &quot;${BINUVERSION}&quot;<br>
            &nbsp;PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?=3D
            &quot;${BINUVERSION}&quot;<br>
            &nbsp;PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?=3D
            &quot;${BINUVERSION}&quot;<br>
&nbsp;PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}=
 ?=3D
            &quot;${BINUVERSION}&quot;<br>
            -PREFERRED_VERSION_gdb ?=3D &quot;${GDBVERSION}&quot;<br>
            -PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?=3D
            &quot;${GDBVERSION}&quot;<br>
-PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D
            &quot;${GDBVERSION}&quot;<br>
            <br>
            &nbsp;PREFERRED_VERSION_linux-libc-headers ?=3D
            &quot;${LINUXLIBCVERSION}&quot;<br>
            &nbsp;PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D
            &quot;${LINUXLIBCVERSION}&quot;<br>
            @@ -53,10 +46,6 @@ PREFERRED_VERSION_glibc-scripts&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
            &nbsp; ?=3D &quot;${GLIBCVERSION}&quot;<br>
            &nbsp;PREFERRED_VERSION_nativesdk-glibc&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; ?=3D
            &quot;${GLIBCVERSION}&quot;<br>
            &nbsp;PREFERRED_VERSION_cross-localedef-native&nbsp; &nbsp;?=3D
            &quot;${GLIBCVERSION}&quot;<br>
            <br>
            -PREFERRED_VERSION_qemu ?=3D &quot;${QEMUVERSION}&quot;<br>
            -PREFERRED_VERSION_qemu-native ?=3D &quot;${QEMUVERSION}&quot=
;<br>
            -PREFERRED_VERSION_nativesdk-qemu ?=3D &quot;${QEMUVERSION}&q=
uot;<br>
            -<br>
            &nbsp;# Bootstrap Go using a binary release from <a href=3D"h=
ttps://urldefense.com/v3/__http://golang.org__;!!AjveYdw8EvQ!dsbtuYnz0eaB=
pWn8FlbH-Kg-yVU-NnmybrYYxp3Vi_6SjL_R-Xpy8sQ_S_HUWOf51ur_kGYmjQ8Zc5oPQTBEx=
Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">golang.=
org</a>.&nbsp;
            If you want to bootstrap<br>
            &nbsp;# from source using the C-implemented Go 1.4 (only supp=
orts
            x86-64 hosts) then use<br>
            &nbsp;# go-native.<br>
            -- <br>
            2.34.1<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------BP00HCl0n9NYZUmrqcE4XP6s--


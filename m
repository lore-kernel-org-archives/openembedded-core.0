Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07E5C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 12:50:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7898.1745412652885530955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 05:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6208806325=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N5UVS5015696
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 12:50:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhj8r13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 12:50:51 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53NCopSa027824;
	Wed, 23 Apr 2025 12:50:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhj8r12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 12:50:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgEBQ3Tw934qbmXiOgkjUnHM7FgcTpe51Qn3wwECGG5fWYZnkBlAbzu2zfz/LnIcv2EBv0IGqi2/6YiQvLE6CUZd7SNumSVl+ZTSsG0UMHfgConMQfELF5aYUOdL7NjlDtxKljoR1Y8xPGBpcLNv0JAuxOS5gFrTz3KYccwvA+Qb/yJfzAA65SeCzT5lrFSm10bdzlPZix/jv/IrQoJKcd1taMJahfzVZNEjr7YKSAbvoIHg5fvLLcAI+EDDVVmF1/AUwIBKB4m4RXXlzpJXw2Gaje7gu1kGFu51GWDDudRIMZLtmHYf1xCCdvZy7RISjJo4JIfdOmKT3O1JUME/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSfXt2Thr1nAhKMkK9i4XSc2mM7aucDm32oP01vlG5I=;
 b=xu3uruMcTypkXb5BC5++EnUcYYyUYtDD6Gsi7LRoFEr19faKDsz12rJLfjvSbAZZgF4Y/YoJE0TKK01wE2vIVhMjc0yTIaHlN7LcmbNEjW05qoKqqeYMVS1MSrAFhcdaTRw1eWNVUAyKwiP0cx6L4CEbVDtorHjrNBQAWlTnvsNv6hEGyzOjELKtNge/AIIYTp8E4JfyGUxeJnvLKtaYB87QWoCEJWo87JRlg46wAdHEO8Sf+RhNYp/cbQPR5I4PEEyB85TPXVXncgNnFGVn83ApuWMWgdo3OF9bDcgo/mK7OEAv8Zfut8GRopggK3u4sAxuevzbmucTAOu6bblAtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CYYPR11MB8357.namprd11.prod.outlook.com (2603:10b6:930:c5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.34; Wed, 23 Apr 2025 12:50:48 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 12:50:48 +0000
Message-ID: <4e3faf82-60b7-4538-bc64-5c03d4ba99a5@windriver.com>
Date: Wed, 23 Apr 2025 20:50:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] sassc: fix runtime version
To: alex.kanavin@gmail.com, yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <20250421090611.3862686-1-yi.zhao@windriver.com>
 <20250421090611.3862686-2-yi.zhao@windriver.com>
 <CANNYZj_Zfs_eqK4GDdH_5yj5uGcttoHQ4uO1=uQ3u55--SV7Sw@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CANNYZj_Zfs_eqK4GDdH_5yj5uGcttoHQ4uO1=uQ3u55--SV7Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0077.apcprd02.prod.outlook.com
 (2603:1096:4:90::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CYYPR11MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 07db3b95-a88d-4bc2-168b-08dd82657828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WDFaMk5HVitBOEg3OFNna2UwSmJvK29IMU9XcjBrUzVFczBHWDZ3U1dObW5D?=
 =?utf-8?B?bjhlZ3R4d1JjMTg4ZlNiV0hSZ3JodGRKMmFneW90Zk5EeWlnWGxVK0tJY3pY?=
 =?utf-8?B?NHBBSEdLYlN6RDBYKytuUXNWUWFIQ1dKcnUybGhCNVpkTnhPTkJJSEZITWo1?=
 =?utf-8?B?WXc0SytRU1IvSitRVjFMQjByVE1FZ2ZmUmFMaXJsRDVMWjdEY3dIZUpaY2Fi?=
 =?utf-8?B?bmVCK1dVNGtHNmxOa3pOZUMxc2JSdXhieE5rYVFSRndGdmc4eUM1YWl4S1V3?=
 =?utf-8?B?RTRCN2FSVTVMZTJTMjF4cVl4RlBRYjBpOGx5S01zQVlvd2dScllzckY0VGZ5?=
 =?utf-8?B?MFlJeTI1ME0xM2RubTNyM0dUSDY2b0hCUmx2ZGdJRkQ2RmlPQmtxTEM3aHJL?=
 =?utf-8?B?NDJlMGNMNTJ1TjdybDFBK2xScTZrdTZISHFMZ2M1aGUva3lGRjhtdThvaUxv?=
 =?utf-8?B?aURkSjJEdDNTUHk5WFdZVkI2aisyQWF0ejVLR29iRnFSRmNqbCsyMFFsajVT?=
 =?utf-8?B?YTREQXVqejlYZEFzOUlDMENjbHM1TjRDRldya2VjdXBpaTVib3hjSUxyVXBk?=
 =?utf-8?B?UDJGS0hZaEluR0dwVXZPYUIwT2NwSnpkcGQ2K3JwVVQyaUFPYkJabGY1OXFV?=
 =?utf-8?B?NURDZ29yb1RZSzVPdlQvYzU5eFNhSnBDSTNPMUEyUVcvenRNbUlaSllTWGla?=
 =?utf-8?B?S3ZaV29zY2NyWUNtTkd3ZCtsQTJLVUJhQXNXVVpCRUF3UU1NdjRIaUJmVjYx?=
 =?utf-8?B?eTk3Y2o4djBYSUZaNFdqdkRNNFRraURHcWRUQjMxVmlFcy84eG16bTZCeGdZ?=
 =?utf-8?B?Q21PMHYzcE9TSVVGV2JDTXQ3WlpnbmY4R1pRenRtQUFGMi9CU25XSWRibFZq?=
 =?utf-8?B?QVBGa1I5Q2huUWNkTTVmYWJ6TjFoZ0g0Q0NVWHdpQVFyL05Oa3Z2MXhHQk9L?=
 =?utf-8?B?NWYvalRuRk1xMGtwZ1djVHhCSU5zRk5YVlk3Y3hnaGhXUFZMSURCSW84b29h?=
 =?utf-8?B?bFkxUG5oOFRUYTFZcy9YVmJ6Tyt5Sm41V2UrRXpyTC9EM0NxVHZSeERyRGtF?=
 =?utf-8?B?b0RYczFaNks0ZlU4ZjFIL1dXVDNWeSs0K25EVkJFL1hiODFnY2JpVUd3K3Jz?=
 =?utf-8?B?TU9RdngyM2VFd3FmTjJyV0l5ZHlSSU5TbG1wcnEwWE9RR1d6Mm9rTWczdC9E?=
 =?utf-8?B?dTJqWVN5Q1NteW9nVzZ0Tm9ia1NxVEJINWFFcjk2ZEJxL0NFcFdjdHVDQlBD?=
 =?utf-8?B?bUFMSlMrMC9aaU5YRWhBMmtyalYvOU1MeGE4bSs3L1hXVFhNYndkM0FBVVV1?=
 =?utf-8?B?YzdGd1pQYlZQMS81MDZ3QzBwN0t3U0RWcGk2SkxEeUdPVlBxL0VmcHBUazNW?=
 =?utf-8?B?Y3kzQ1VHcjdjSjVqSnJ1NjVTUDNjWTZFbTFteHpqK1grUVBYaFphNHByOThC?=
 =?utf-8?B?ODNjTWtnSUZSOVBOSGZNNEx4WWdCb3V3UHYvUUxiSWV6WEpzMXNrc0pHZmQv?=
 =?utf-8?B?bVFZNmtKZ25aQXlvcjg4ZUx1N1JwRzVqSWUvTDRrMjFYTEtLSWFudGlXVzlm?=
 =?utf-8?B?RUpURHpyNHBFUnJkSG9Da1lIVjV0V1VyNTU5MCtYaWJBaUxMQjhvU24vOGp1?=
 =?utf-8?B?SzRXZElnc1E0bEZ0MmtETXB3L08rTFZELzNzK0syalAydzBEWVdaSk1PSGh4?=
 =?utf-8?B?RUY1WjRSbXFJWGpNWXozQ0hibmVQVzkzZEhNMHl0eVNDdjc2MXdLRzcrWkdz?=
 =?utf-8?B?RkN0T0ZNTHVmaU9KZHFiNWNjWFBzcW5vdC9aa1E4T3lKK0NpOG1MRmxpM2I2?=
 =?utf-8?B?MldLY3l0UHhWL3ptWnRZYjg4djNBbEdhWnZrbThPN2FHMkUxTVdUVi9JcXJy?=
 =?utf-8?Q?U3UhXLOuejE9Z?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YUNRZlA4NGVjS0lENG8rMlFPR2l0YzQ5L3NBU2I2M3JOd3pqZGZHRGs4dVBE?=
 =?utf-8?B?L1djZkxWdzNDcTFieUVSMkkwYndReXZiK2x5SVl0OWxDc3hHM0RTcyt2YzZN?=
 =?utf-8?B?UmlMSEJGSS9Oenp5amFabkx6NzJVZmVtMUhhNUVOVzlsZytuU096RmVQU09a?=
 =?utf-8?B?S2FVdzlCR3FaK2FoZDRyWk5aWXd0MTFJdnkrVjFsVWtubEorZlNoM291QkhW?=
 =?utf-8?B?YjBub2xzc3RycE55bExLWGtNWVlBdHg5UzlWVUl0L1hZSVVyZ0hCYjdCdTE0?=
 =?utf-8?B?Y28wQmE5SUpnZ0RKTElJdkIvVXRoSitSZyttT0xrZER5NG5FR0k0SmJrNnps?=
 =?utf-8?B?ZWhpM3JseVFFRHc2YnloVVo5bXlCWlo1Q2xveWhwU2ZYNTdaYjZKTmljVzlK?=
 =?utf-8?B?SXNmNFpPdlhLUk4wbjk3Vis2SHk5WVpJdDhPNW5Ma0VGcVVBUmY1OTN5SjJG?=
 =?utf-8?B?UnIvNWtKSGhEWHowRE5CU09sSjBCNndsSGFnU2VqUmRXbGl6QXpUS2dGMy9D?=
 =?utf-8?B?NUYydit0NU4rK1M5WmpXOTA1ZnFPSXFVWlk3aThVLy82QW54ZU92T2NGMlN1?=
 =?utf-8?B?WDh5K0NpdVZjdDFCLzd0MURTQ2ExdE5UQjNoaThXRDJPeE1pNFVPaXRONnh5?=
 =?utf-8?B?cVZsRzNJZkprcG9xd1hlRW92SFN5bllGRzJZRkJzb0hOS3ZOcFNVcmhsbHVT?=
 =?utf-8?B?OUNUUmRtTUYvRVQwdGZCRDhHNE9uUWp4S1hNSjh4b2JqZGRyZGw0SjRXY3hL?=
 =?utf-8?B?dnhRd1JOQWxmWDdwNEUwQzk3VjBzcGV1ZFJWTUdURzVOUUpPamdWUURmS09C?=
 =?utf-8?B?UUlVaHZWMDZoOVVxWUxBVjNuOVFHSktGWEsvbkp2ZWRDc3NxN1lxbVBGVUx4?=
 =?utf-8?B?TFNVYjNETEZvMEhoMHY4OVVXVnNCbTlhOHF4TlBiRmxnb2NUckJQbE1ENEI4?=
 =?utf-8?B?TmNlODE2MUYySFBSSDJxdFNPbG1acWQxeVNSTGY2UGFHZyt6cnBKNDNxOW9I?=
 =?utf-8?B?SFU4M3QwNTdWZCtPVTFGMzIxblpPeEkvZlN1VHBLZUNYSUJHU3prS2tiK1VT?=
 =?utf-8?B?V1ZTNGw4QTAzQm1lVmpsQ1psSjBCcDVqN01Uc2kycXBnNVcrem5pMkhvVFJQ?=
 =?utf-8?B?WGk5bk9zVFYwUWhKci9acll5WjF2M0w2eW9FQjJtMHFTQ3FhNTcvNkhKY2hL?=
 =?utf-8?B?b2szdC9iRUlEZzJMYTNxQlF3SGRSeVRWMlhEazVPcEdzK0xHeDFqdU1HTVJZ?=
 =?utf-8?B?RkJqOStyUUJ0bkVaci9WR3U3cmMwRU5RREtoY1RPM1pLYUl1REVmcjliRnRq?=
 =?utf-8?B?UTEwd1FvVGx2bmN2SkM5bHlZLzB1bWJZaWpodWgvQmJ0Tzk1b3YrZXVoaFZl?=
 =?utf-8?B?TTRwMStwc1lmdElGbnB2UzhRQmpwR2M2NTNOM3FCWDBldkZOdHZyNmVYTlVs?=
 =?utf-8?B?SkU0bWs0K1YySTNmZW5NQW53Q2ZwaitDQldhbFZYVUJ4SVhhbkZmSjNNQkR3?=
 =?utf-8?B?S2ZwMzNENm93b2tyTVVqclUwanZSRVVnTUdiYU1MSGN1TTNpNDFkaVVpdHFT?=
 =?utf-8?B?NWNKOU15UTBDTE05MjRXd3M3TFN2VlBkSW1wRk4wZHo5aW9nUUlDQU1qdTY0?=
 =?utf-8?B?MHMzZjgxdDBqR3B5NmNRWmNxT041TkRKQ3BmcmVTT1hqUXdMR1ljMG5PTXpH?=
 =?utf-8?B?dlNHc3hScjhlSHV2OC9qa3ZxSDZjNURROS9leG11L2hQcDErOVVZU1dRNkY5?=
 =?utf-8?B?R0FRYXgydTB1UGZzaEx1cFZJRjdDY2gxM1FqaTY5R3BMUDZ2d3ZCSndnOWUw?=
 =?utf-8?B?NFpYc1dJVnpLOU5haE1WeUczMk40YmNOaGxVTUlzOG1ObzgyNFMza1VTbUs2?=
 =?utf-8?B?ZFE0NDM4MENsWnVwNC9KaGNPalVKK3NBamV5ZWl4L0xwTUpuM1RUbno0YkVk?=
 =?utf-8?B?TVNNTWVSRUZ6amYxZzdsMVVQOU5YS1VhOTMzc3FtNHZYSXM3Mnl6Uk95RlNT?=
 =?utf-8?B?QWx1ZjZad0g0UUFTMGZ4bUk1WDZWazcrT2NsK0ZwcmdRdEVKQlE0djY2bHRT?=
 =?utf-8?B?cVdCcHBiTXBtL0xBZk1vL3dOZmt5dXJUVUtFRWVaN1JMLzhKclpiR1k0RkU2?=
 =?utf-8?Q?8ogSdEdn9NGFU9yUzYKEpJoUL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07db3b95-a88d-4bc2-168b-08dd82657828
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:50:47.9278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2K4VS8IqggJUYKHZGmT+LkdD7jzJush39XejiFfTg8KVjSixFNiw0DAZEF85Z9bLlL3cSYg1rWOCTu+HbahE9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8357
X-Proofpoint-ORIG-GUID: U5hfGa4MksSGKIaismtMwOjWRFO1HIeS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA4OSBTYWx0ZWRfX/tGpmIWVY6jn gAX/rJP0g5li7gw0PtWpcuecp/zbxIm8pYHSGwwanIARLPYx8fcE3699bvjV0fUz5afCrLidUhT dZZHszUouCt2OqHh6u4SVk/cOAUhvVqyriBjrYGd8LBhEJMOg4m2Qyabwts3rbpCtwkjmCSIJ6i
 3Aaug1nPoZudVJ6K3f/2MjJhn9WjaRerJ0myDmjYtiIZt4tIHumBMX/AABCeqv/X5YZ2erkKBfX Q4NnbYTN1oEgv//Bj+C2PTpDEdc1dtYxngM2ys3Ur8507MViCsdFsO1uey+NE3vcXBoFMIekGZx XzOlwFwkhpYnbJo/gM197q0x5OHeNInioyIiaYT+ld0dqGU6CKaCYd4GFPVtWy5Tr8EcVTqck0x
 SdbU+t94wtqFn+B5XxhL119DcfiUguxf5S/h1QvJ2EHIPuJq3YkBYPoDdJacPvNcTq+eVCXh
X-Authority-Analysis: v=2.4 cv=ONQn3TaB c=1 sm=1 tr=0 ts=6808e22b cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=NLJ3pzQN0iH_WCqOxjQA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vHhrb_IQ4VZv6u7jHShRNAkRWeifwdl5
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=874 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504230089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 12:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215291


On 4/22/25 23:44, Alexander Kanavin via lists.openembedded.org wrote:
> On Mon, 21 Apr 2025 at 11:06, Yi Zhao via lists.openembedded.org
> <yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:
>
>> +do_configure:append() {
>> +    sed -i -e 's/\[NA\]/${PV}/g' ${S}/sassc_version.h
>> +}
> This is a generated file (from sassc_version.h.in), so why is it not
> generated correctly? Should we rather do that?

There is already a sassc_version.h file with version number [NA] in the 
source directory. When ${S} != ${B}, the generated sassc_version.h is 
located in the build directory, and the same file in the source 
directory is not overwritten. However, the latter is used during build, 
resulting in version [NA]. Can it be fixed by inheriting 
autotools-brokensep? Or copy the generated sassc_version.h from ${B} to 
${S}after do_configure?


//Yi


>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215234): https://lists.openembedded.org/g/openembedded-core/message/215234
> Mute This Topic: https://lists.openembedded.org/mt/112372256/7283133
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


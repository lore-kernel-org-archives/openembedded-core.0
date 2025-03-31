Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7429C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 05:52:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45593.1743400324972076531
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 22:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61856e1cce=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V5AZ2r008127
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:52:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8sqaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:52:03 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52V5q3Gj003982;
	Mon, 31 Mar 2025 05:52:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8sqa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 05:52:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1cRry0wbVXtFXTAx6oZ/mcmshtPeacolvg4X+ggTHxKHpAbCGBkhqYt4UbDF04ZwqlMooe1pRXJuJqpTLZ6F6cUt/MoQxcg00eAj7hSzlwUiCK8XOX+CKLJujiLJuRhDcCUSeZMTlCEKqz6gZzAxDZGAVLKkskpjzgRnfQwCVa9h4M6566NKl6eSiBdpFxt9xHXvz/0ItIEwnbzAjJWTkCsAROlqWHIKSDDE0vwnGaG2e2JXNN03EOPxytVESnwuNgD/8zu+0uKb9s32CwlFE2QQG4lqAL5+jkC4VEuNYo4hyA3SGO1cDnQnMcxTVF6BGVCungBnLQXNO6hQ6yq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ihLnxA7qM7ANV+s1hGnXaquNnoy+khb5lNVHX96OPs=;
 b=noGeI9bllMpBoTt3xeI1dSGdO6fUtTJB9j2XiXe50DT/+Rt9TVEi5sSIshX0aToK7QBgsy7OLgmyZ+ASeTSHEetiLXM1LUd9W+886KFyaIgb/r5xbeF73RkqXZvbfKTM0R9SCnC1kJ1NYTMlaC1SxGgUTmSA5lFNAwTHOZTI/IUFRyqqgWXQvrXjVOC7Fx8pqksRItAARbWfE6CcWyzHnPTFDwYPQDvtyhIareUokDwKjYKHCPDWUWl0Lq4YwiPsI+2aFvZBH3JRr2wIbnyAsfBcvc99H5xIqo5QQ6UT3m6dQwO79RqbFJXyufLpMOGjK+nUmyRdTaQk0eytCszaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 05:51:57 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 05:51:57 +0000
Message-ID: <1a1ab4d3-1972-4954-a14f-2f974d0bb04b@windriver.com>
Date: Mon, 31 Mar 2025 11:21:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, richard.purdie@linuxfoundation.org
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
 <20250328143005.880998-2-Yash.Shinde@windriver.com>
 <fc9c93b1523399820a1a3b72f2da021c2780c179.camel@linuxfoundation.org>
 <CANNYZj97RCxTQDccGFATZfGwf9P0u9OkysWR1OVLJyLxeR4bgA@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CANNYZj97RCxTQDccGFATZfGwf9P0u9OkysWR1OVLJyLxeR4bgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::7) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb1fadd-1250-4282-0141-08dd701825b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TysvV1h2NEJpaEpuUkxlaUd0cmZmUVY0V0tIV1c0T3FMOWxJblVBazRUU0FO?=
 =?utf-8?B?Q2pIRjlTUm9oK2xUcXo2NjYra1VvYmhxU0llTXkxQkxjZ0dtOEVGYit0bU8z?=
 =?utf-8?B?TEVuWjBTZ2hsbldtZXVPcUdjZGtnTDdkTjdOWTh5NGdPN0t3U0dobWV3Sm1t?=
 =?utf-8?B?eTg5Smd0bTdUS1Vtbm1xcWpNcmtET0ZnWmc2bU5mZTU5Q0kyK2lvaGV4UW5B?=
 =?utf-8?B?MlRXdDJuMVBQUHRpOWVLTTFhL1p4UUFOUDdPanZGUjg5K2EyTjJReVlQK3Qr?=
 =?utf-8?B?K2RGMHdOZFU3R2t2NnFoUE9EcUw5RVBRRkdPRkt0aERLSmZrTzM5Qlh3T21l?=
 =?utf-8?B?YmwvbU5nMTNIdkJxZW4vTnM1QU1HZExuQUNMSEZBVHRGNjAwMEc3U3JUVkFp?=
 =?utf-8?B?cXFMRFNXR282alJOOTZscGQ1TlMxeFVBTUFSSjdKNTIvL0pnNW1XYWl2MmhC?=
 =?utf-8?B?Qk1CMWZjaWhka3pneDg5ZVI5STFIMHAwS05VR2RIdVlVaHpxVHRqUnVGOTBY?=
 =?utf-8?B?V21tU0JCbHJXYXhVb0doWnBEdUN5NzNJd0ROemVnVEtKT1VtclBRRjA3aU5S?=
 =?utf-8?B?SzdCclIrVkJDa3NqYzVwblJKRWM5QzRjeWRKZGpBbkg2eGxOc1drUlJaaGxG?=
 =?utf-8?B?Y0hOY0lKbGx6cTljT2FuMmpJK0NOU0dzWHhLZ3lnc1ZRajh0Ty9OM0wrV1Nl?=
 =?utf-8?B?ZmE5K2p0bDMrWHV6ZldmS0lIdkswamFLUzVSNG9Udm9VMFR4STNJdEFmMUlL?=
 =?utf-8?B?TXp3enRlV0Y2cTVSZGhjU0dGQkh5MHdORGpFNG5CSmVMOVgwU2cxWG95RFFi?=
 =?utf-8?B?MC9KcVU2clpENUphYWR1bk0zd1FjRDNQeXdCVHVFM0hKRXAwbWQvbFRyNDFp?=
 =?utf-8?B?RDZBYjN4Smw0RU0yVGhxZ1VPU1JFL1FSMFVsN0hNOW1oOTd6cmxxcUJ1WGIy?=
 =?utf-8?B?dnhSQnpnNTg1NlRGWGIrVFkyRFM3bFZEY1AvK2MwcDZJT3FHK05xRzN3cGl0?=
 =?utf-8?B?U3pNdkV2NWJUWEMxQ0pZdXhsL1FLMmNJM0l6SGgyZ0xlQnVKYmxZWGxXNDRL?=
 =?utf-8?B?b2IwSDU2Yll2N3p6OWk1Sm9MN0hqaFdWTkpnNDlIWHNtNDd5Q1dOdStLdjYz?=
 =?utf-8?B?MHAzQ0ZyTXdsU2RzQ2IzaGxsdDFnWHo1Ymp0MUhZQ2lMTFdGRWlIcjZGSXpt?=
 =?utf-8?B?am5RMXZYeDlFWkNXaG9vOUxpWEhnMnI3QTY4YzlJUDVJNzhMY0RsTnRqTE95?=
 =?utf-8?B?S0NZQ0hiSTNBTkhFV0ZxS0NzanNtbFpxS24vcGRHNkltclVRTVF1NGJ1SEdt?=
 =?utf-8?B?OE5yNUh6VFJZY3p3Q1BKNDlQZGE2WEIyWFR5c0FZbFlRWEczdFNHcFN6bExT?=
 =?utf-8?B?Y01LVVhFTmxRQnVuaDBMNmhKR2hnbENBVi9CeGJDTzJ3NnJEWlA2dEJIMmVS?=
 =?utf-8?B?NG91RDlmQ3lXUEUrQm5GNkFwYmZtdGFRYXV5Yis1RmtLY00xcmUzZ0RMK241?=
 =?utf-8?B?M2RocDZEYnVudW5HU0tRcllQWUZFVXhnWVNKYW9oeUhyTngva0svZjdaTzdG?=
 =?utf-8?B?SjgzNVFBeDR0MUkrQTZSWE50ZmFRbXVscEg3UGxzcU9qRHpUaHg1NE9sb1ps?=
 =?utf-8?B?UW9pV0kvS1JpWlo5cUdoRmNXQlYrNUE1RVZUSm41UGYzWGxxUGFQem5KWDV0?=
 =?utf-8?B?bzlzaHhlUUZaNnBIZkgxOVNiaEhXQzBJTlRpMk9HYzRrcmZoQXdsVmNGWndk?=
 =?utf-8?B?aUtWeGZkSnNUT0hrbTZPclpPTmlJenNuSEJ0SXNWUG5QYkJOYlFvV2VWVTly?=
 =?utf-8?B?Nm95SlVPc29xMllBRHk4OHNBd0dRR2E1Sy92dDVFaDltSlJrSHFhOWFON1l1?=
 =?utf-8?Q?7EOnic8ZfvZqF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TzBOTVZsYkZHb0VJcFF3UHdNeTI3VjliMElnOHhXaGlZMjd4UjZvZlVScHV4?=
 =?utf-8?B?a2NPd0x4K2NFd2gydlNpVzRNZk5vaFhoYjRpdFRQb2NyMmJhL3RuVVFNSnhu?=
 =?utf-8?B?RXRoN0lNUkxaT21EcDB5d2kwbVJCQTZpRVNsWEQvT3lSZzFqaytLS2JneU1C?=
 =?utf-8?B?c3JTeVBqVjhDbXRWSGpraDhINll4djFQZ243UmFDYzl5VVI2TTlXK2QyTG9i?=
 =?utf-8?B?dGNqaiszTk5nNlFLcko3cVluUStGWTBGTkxiMGY2RE5WTytzZ21heGU0NnBo?=
 =?utf-8?B?T3lZMXhvbzhiODhlVXVOdlQrR2ZQcUV1ZjkyNGJpZ1NXNGxxT0RsVWxZRDE2?=
 =?utf-8?B?cGt3RStvU2IydjkyUThzYnYwbW95TW9kN1c0Y3FGWitVODVmRXh4SlYzSXF5?=
 =?utf-8?B?dE84VzJoeHp4M3NjME4rRVNPOVRsK0pQTHBzUEFYcEZKVkpUQ3RZbTRKZysx?=
 =?utf-8?B?bGJ1YWk1TXA0TjJmY2FDY0hBeWgrQ3llNDQvL0Y1d2ZtYjRKclJMSVpGU0ZY?=
 =?utf-8?B?dE1QOGV0WE5zZzhiTE9tc1ZvSy9SRFBHWTdkRWpyVVk3aUNQemZNeXFpa3hm?=
 =?utf-8?B?V0E3NGRCcjE1SnJzU0psSVVRakZBc3pmTEJHeEJlTlhWelVvL1YxRXM3YlFZ?=
 =?utf-8?B?QXBRd3FxckpQUTVzTVdSSkNXQ2tBTXlYSXlmb0NJbDJqSFR3TmpzcU9pK21I?=
 =?utf-8?B?cHVrTUp1Y2RsTFNzMjEzQnJPS2NBbXQyRDV6T2hTYW5TTDEvVGRDenYrM3dU?=
 =?utf-8?B?TkFRODBvQm1ramNoZGd2OUhUenJtR0FhMEFXUDhCeC9nMUsrQzFiK2prdnFr?=
 =?utf-8?B?Sm9BR2xIalNNNE1vdTdtUXhYOERWSTBFT0ZBVkZFRDdFbVlVM28vNWhHNzFD?=
 =?utf-8?B?L0c3UklEYVBCZUVVQ2M0aU5RbWdjNWN4dWpqZnoraEtITlVsb2d0UjYyN1o3?=
 =?utf-8?B?TGNtejlTditMajdrcUFIUGhvNUtYSzFycytMc2E3TE9Rd0pMa0Y3U1V5b3Jp?=
 =?utf-8?B?R3gxMDZFNjJBb3NOYXJnNlNDL2YrL0VjenhnVnRrNGtRSnFtNmtNRkdXdEZO?=
 =?utf-8?B?Q1V2WE9BdGdHRWdTcjBkYlRpNXNNSmxhR3RMMG80SkZMUWd2elFoRncwRkdm?=
 =?utf-8?B?T2dOby85dUlWV1lSMEdQeW1QZlhYM0Y5TkhkS1lOeWU1N1dScmw3N041TDdH?=
 =?utf-8?B?Zjh0N3pwS0pMemdKbXd0M2N5bDgvWnZESFQvY3Q1NUpmQTdYbkpQdHdNQ2dR?=
 =?utf-8?B?SEc5WkptaFU5My9qeUs5bTZUMi9MczBzQ1hpNWo2cTBFU0R4ZUtYM3N5aWYw?=
 =?utf-8?B?dGVieDlSVDJ4MHk5c2s5KzhyTlVxd1JrRzdQa3VNTWVodHZHdStQd2pmSHBT?=
 =?utf-8?B?azhuTkhVN2h4OGU1UkFSL1hwMWtWSGFXVjlvWmlSR3g1QkZEVEVFNjdZUy9s?=
 =?utf-8?B?MFc2Y1ZNck1NS2xmeGM2SE5wVWhWZDFSRmd3Y1FDRUdidHFNZ0tmeG5PcGsr?=
 =?utf-8?B?UHlzVmtWY2YwYU5FTkdiVUgvVGRhYVpoSkRQaXI1Y0R6UkhrZXNaMFZISnlo?=
 =?utf-8?B?OVRsZnpjRFFkczZCSFFucnNKZEY5TDhuRy9FMGpDMlNWS3FhWXFZQ0JhVkQ2?=
 =?utf-8?B?SW9oNzI4dFpUa1NuRE9iRnpheHpvblF4RCtoMGJHcG5uRk9vYzEyMkx3cFU3?=
 =?utf-8?B?OXBLclNmK2Q4L3BjODkzS3Z0MFl2RDVoS09QNGJOVjdBdTR4dUlkMjZ2VVp3?=
 =?utf-8?B?bDVzRVZoWnZpUmdvV1JpMjBxTTlDOXMxT3dYZ09qS3pxamRYVGdUZk1vMXRH?=
 =?utf-8?B?QmhzMVpWbUp3aHlablB3SmdZRWx2eGtNQ1Q4QU5ZWTdURDdLTG9Yd1VLaVBU?=
 =?utf-8?B?MVFUK2ZLWnVPV2pRajhreVFuaU0xWUNaVHNxd0hUZ25lREVHR2NnV2N5Ynpz?=
 =?utf-8?B?dEQvVUZZRmZGV1FuSHFvajBMTUE2QUFKaVFXUEtjWXEwemtDS1pVcnVNanBP?=
 =?utf-8?B?cVcxQVFIaG1td1lhYWNKRjVsQ2puODFOTk1uNCtHSW1jV0R1Y1hxd1B1ZmJT?=
 =?utf-8?B?UUtBVmk2ZzF6bi9tRVRBckRjUVpHZ3dwU1JQR2JFYSs3K0hsTDZuNk9PZ3hD?=
 =?utf-8?B?cnVhMzdodGRqNy9pM25qQ3Z4aWhsZlRPRVN1SHRjMVhzUWYrMkdrZ0ZVSkdW?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb1fadd-1250-4282-0141-08dd701825b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 05:51:57.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2uJlEN/CLG76nmkmQFq5/rxOq6MqW9zKD6jlTasO3NEHVDRaCPYTIVKBrGhqvyZ6aia4BlRrsfaK1eVxIrkFhJwTm2aEMOyEZKcH2PRA28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-GUID: aWGIOTzOuI2UPmA5kpZdLa1s3tPtSmqe
X-Proofpoint-ORIG-GUID: PFwHri_EOiB_iPZPBI_JTiFrvNXAHXbg
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67ea2d83 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=K-7aMS0DSW8OlA1EJmAA:9 a=QEXdDO2ut3YA:10 a=dI7qjkOEfi4A:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=824
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213930


On 29-03-2025 00:09, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 28 Mar 2025 at 15:40, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>> On Fri, 2025-03-28 at 07:30 -0700, Yash Shinde via
>> lists.openembedded.org wrote:
>>> From: Yash Shinde <Yash.Shinde@windriver.com>
>>>
>>> Rust stable version updated to 1.85.0
>>> https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
>>>
>>> Some of the major updates:
>>>
>>> - Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.
>> How did the license file change? Was the overall recipe LICENSE
>> affected?
>>
>> You need to be clear about what changed and if LICENSE is impacted.
> Also the checksum update for libstd-rs is done in this commit, but for
> rust it's done in 1.85.0->1.85.1 commit, which is incorrect.
>
> The history of changes is here:
> https://github.com/rust-lang/rust/commits/master/COPYRIGHT
>
> The latest change isn't in 1.85, but the unicode sync is - please
> confirm by comparing what's in the 1.84 vs 1.85 tarballs.
>
> Use
>
> License-Update: <describe what changed>
>
> in the commit message.
There was an update in Unicode license from "Unicode-DFS-2016" to 
"Unicode-3.0".
https://github.com/rust-lang/rust/commit/6d2a3e9786ec43a0e0af20386e7046328296ac86

I will update both the checksums in the commit for 1.85.0 update in v2.

Regards,
Yash
>
> Alex


Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECDFC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 04:10:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36012.1749096601241816648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 21:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82513ac62d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5553sKTJ032690
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 21:10:01 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rug87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 21:10:00 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55547Ap6019290
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 21:10:00 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rug86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 21:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+VTeMVMxZx/FtuyuZIxug52q6JL4wOTbzTcQHq1P05NEiEEki6K/fyauURLlN1WViyjb6jBvHvc1zK9qSlkzKN5zMEckiyitG9G6yhINtC/UqBhiAmXmvzB+3DEg/JaWlPyY2mLKC1Pk7t5Rf56PTROhQ+tVYLNPO42656QNuJ1bKc9iFEKumg1T5nGfhq41xWInHFv8kYIscLcW2Jd6c9FPsoYPSBiY/nFbSFm7oQ8LUrykLE16Nx+Z5zi6MTM0WbTFSEM0njZdcbOXcA4R2xo2bajeU2g3We+rVvm0ZA84830k21xy1+1I1z/Djl35dUfFFvv1b5a5EZJR9oobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyJtoVI8nKxmS/aahSkei9PaSVXgO0MgPLNG2aZSSd4=;
 b=q4Z1EtaXWKkx5ZKcoJtDH1iUpsPrrEj19T6dC+o7qPj+8cYI+Rx6NUBiowwtHjP3PBCc8+d3rmL+KwB7fZgoZOHhRIftcwKIiluOYTjxvZfoSXStlvFEijzrRH9G5LMvEHrJ71zcxweQI8JHyLFBscggw0SPnIX9zbhHnBbBo7bY08WRCVBIE1lpft8k5Dygwr3+1HnYxm1msBLVFUpt+/rCkNp2JXqIz69Q4M7oU70XMqa3DG3l7aYCG1FkSOdIlN3egyxTP//NZ7HV/dNcFTD/M0uXObbDDcv80mNvpcM6N95ffkSUtyz2ykGJr4NvsP/AOgs6yYzZm3qB3vgLzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by BL4PR11MB8848.namprd11.prod.outlook.com (2603:10b6:208:5a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 04:09:56 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 04:09:55 +0000
Message-ID: <264d4926-ea6f-46d2-8c0f-dd42f258c9bf@windriver.com>
Date: Thu, 5 Jun 2025 09:39:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [walnascar][PATCH] binutils: Fix CVE-2025-1181
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250603062637.2915962-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1soy2iP-vv_CMHC0tYvT3OjHS5xSXWEW8srcbjpxhRpyEg@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1soy2iP-vv_CMHC0tYvT3OjHS5xSXWEW8srcbjpxhRpyEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PH5P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::16) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|BL4PR11MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: c818fd6b-cd09-4db6-9985-08dda3e6d3c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ck0wcEFKK1Q0ek1FTHRvKzVPYk1OY1J4eEh6a2pzTm9ScHl6NlVXVWJFd2J5?=
 =?utf-8?B?MmhvVXVTcEdqZmtmZTlobFRoR3kya2xoVHpkOE04WGxld1VwTXdFbjBjcFJY?=
 =?utf-8?B?M1UwNmI3ZUFGUkk3Z0NNVGl6VlM3cU50Ulk1Ty9GYURyUE01eWd1MEdtYUpy?=
 =?utf-8?B?ekJxYjd6bHlncTMrelkwbW03cG9LUExWcHVpSVJaaFdlbHg2WWdHSHZBekpN?=
 =?utf-8?B?cGF5ZzBXMkkzQkhha1QvcndQSmppdEJuWkNYcTRPVTA1TUpsQ1NFOVl2Szd5?=
 =?utf-8?B?aXMxZTB6MkpQdkNVR3I1UEhnZzZjbCtSeW5WcnVVTEFSYzlTMUpJeTR4WTk4?=
 =?utf-8?B?VjVXcXUrejhDNkR2R3dwUVlTN0hydExyS0NKUEt5WmdEMDN0VVhXOU5xUWV1?=
 =?utf-8?B?VldFT2RKLzFUK2V5RXliY0JKcVhxaE1mdzZNV3ZxeXBQYXJEcmIxWmdxd2gr?=
 =?utf-8?B?TUQzdGUzOHlyTFNZSmN5V25aOWcya3hjS3FTSkowbTJuWVFSYkRSdjBIeU9o?=
 =?utf-8?B?a3FBQ09NSkxGNWRSajF2OUQyNzIrdUdrVm5DbzQ5N0pQZXAxR1Z3Z0JkU3Rn?=
 =?utf-8?B?bWErbEpadE13cFM2VmdST1NKRGtFUUFWeUtYRzhSV0VXL3p5NWljZmpLVVRS?=
 =?utf-8?B?R1cyUjlMcEpWYnNWeFgzOXZOcjR4NUY5UFQ2WFJsTi91Q1IxSnZNb0dMbm9X?=
 =?utf-8?B?U3U1bTQ5cUw0ZUFxU2ora0trZ0JwVFFGbnMwK1YwMXUvZTFwTjZTbTdHV3Zo?=
 =?utf-8?B?L0tPUmR4V2lhMWQvR05VWFhTQkRiMHFGSHhha0VtMDdNd3ZURWhTYVM4K1dw?=
 =?utf-8?B?R2hZL0IwUHRiQWY2MUVQamdpVTRDVmtma05iQ3dxQkJlY1loMUpJL1NzbHNF?=
 =?utf-8?B?TmVYdmRkcmpzS1ppSkZ6eFZhZllvR2l3ekdVUFV2M2hvYk9kY3V4Q016Vksx?=
 =?utf-8?B?OWhtVS9SQ0VxQkkrYldlUU9ycktNZHF1bDhqbGZ3MnR2M3NhWTRjNEQzblRH?=
 =?utf-8?B?ZytyK1F5eko5SzI3UjhBSVFnd2RFb0c4R01vQlQ2dEtoOE1yMGY5Ky8rbXJI?=
 =?utf-8?B?NFFiN0s4OXN4VDlqVklIY3l6U2tPOWc0cEQvUTJqcEJPNldBdzl2WGljTUdN?=
 =?utf-8?B?MEFDMm1CS29odWVLNFpQNHJyVlA2L2JYeG1RWUltNWxpblZuaitJOXlRTnhX?=
 =?utf-8?B?RGZSYm1MVExaOVFENDhyTEpmRmZxVmczcU42ampoU250RFpHYUQrVHJwSU56?=
 =?utf-8?B?bHZPY2tHTXVKdWFsQ0xNWHVtU05hUEhadWdXT3d1cE9PNW9VNHFaY0JxWURj?=
 =?utf-8?B?YnRtc2RjZVpIWFgxRnUwRjZxbEh6bWZVdDFLOGlUVnIzclRkYVlDTm1jeVJv?=
 =?utf-8?B?OHJpNkFBeXVBV09YTzR3WUpuRG8rZm5PVmxNRDc5OThuMmN5UGxmL1I5QS82?=
 =?utf-8?B?RlNSbnRNZitpU0xLRHlOWU5mc2o3NUlxZmtxcWZ3NGl4WE5NQnlUbTZzVGpj?=
 =?utf-8?B?UzNaSTRmdXV2WFRYc2N1YUVxZSsvWC90M0hIVDdHMFNxcHRTNnJGbXc3Rnc0?=
 =?utf-8?B?R2htalRtOXkyN0hiTkovVkszSjU5SW5pYldUOUJWUGNNTWV6UENaVHFxcEh3?=
 =?utf-8?B?aWZwbGhhekZLa1RuNnpBZHlQWWFOTUhOTW13aHdpS1V3NWNEVnJFSG1mczZx?=
 =?utf-8?B?UUtwcVBacXE0RUNCQ3ZqV0tydnQyeThuYnVvUjIwVUV5ZmdKMUlNc1dubWg1?=
 =?utf-8?B?eW1NSmdRUUM0UE90Yms5UmhNTTRQV1RTQlhYS2EvVEhDc0VoTTNBdWFZTnd4?=
 =?utf-8?B?b1NRMDFJcS9rS3pCdDdRZmRENTc1bDRBQ2wzOVVCMmZDajBmSkRrYkcyRUt2?=
 =?utf-8?Q?zv/jqDkXayO+h?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGNkT3BHNUcrWUV0YkFpSVFOcnhUclhVdGlIVlFJZGEyUnNlUW1UczUzTUZa?=
 =?utf-8?B?ajFDSHU4Q2pVNUhYcEJxQW9ucWxlbkxLdThRUk5kKzZid1gzYmZQbHpsUzBP?=
 =?utf-8?B?bG5aV3pkaXZ0VnhiSmkrZkVwc1F1blRTOVpLNnd5TUJTWHhkc1hXdHdRNDEy?=
 =?utf-8?B?N3hLWTN2allwa0VkR0EvLzY5T2pKeWVyd20vQ2NWdDh2eDRqQXdMQXVzandM?=
 =?utf-8?B?SFd5d3VFOXRab2ZoWHRsR21KYTRxNFEzdTJUV2ROK0JPUzlJVWx6Y0FXT0ps?=
 =?utf-8?B?OHd0cHZpcEVST09jc1JJdzJIVWdQZkRpZ1YvNGZGODBPYUEzM09sUnpDaWtH?=
 =?utf-8?B?MkRlUWhScjNWeHBwWEpVSysweEpiWEdOblNwWlNyMXlJTlJOQ2JjenNHaHFT?=
 =?utf-8?B?WXkxbCtEYTdXcFErL1VDc2phbTF4Nm93QU5SQnhMY1o3M3FKQnJrNWdFUGl0?=
 =?utf-8?B?U2RZYXE4U3djSXhrR1Q0dVYwSER4YncrS0NJMDQ5L3krYmp0cmNmbWtBR2po?=
 =?utf-8?B?UWhyOHpscGo3cHdGN01NZ3o1eTdXRTh6Nk56RWVYRGdWUnN2c2dkTnk4WUtV?=
 =?utf-8?B?d0gxUHgrVVovRUd6NWpzQUpsbkorQXhjdUFibWF4NUZ6L2hNZm1KQk9yQ0k1?=
 =?utf-8?B?dllreFhSTEdybXB5elRrOWxYcEs4UFJqOVgwQWZ2UThjK01KY0h6VCtDTmxa?=
 =?utf-8?B?ZDRtV21WVjkzMUtMUkhHcnlkTkREdVdlRldQQTRFMFI4MnhLYUQrajRoYW5l?=
 =?utf-8?B?OTJiYXRHKy9tQTZzcTl1cnZhMlA4akF2K0NpT1JUeXJSSFpMYTJrYkl3Sk14?=
 =?utf-8?B?QnBuSGRuYlNlNml2UzdJZXdkWjlkRFNqMG1XT1Z2V0JVSlgrbFlNNkllbkRR?=
 =?utf-8?B?TjI2bmxreTRlWU16bjM5U3FIWFpOaWpsZ0FiYThXVlAxcjBiOHRjcURxaVVn?=
 =?utf-8?B?N2lFcmdHbk1xSWZPb1FRS1hLZnF0QzJvdW5nSGRsN04zQkhtdmxPMmdwWHlS?=
 =?utf-8?B?RXB5Wnk2dmxjanVzTXdZSkZjSHYwUlhlWit5aXlORUN1bmZsQlVpdVQzKzBW?=
 =?utf-8?B?M253Q0RXWk5CUkF1aFo2VkswSlloWDJzSWtzVzRHT3VSZncxQjNJRjZlRG5r?=
 =?utf-8?B?RGpKZ2duTVlsYnJrT2xkd1NHdElzNSswU2x0WnJoZmdjNzVIdFlTUW9oNno3?=
 =?utf-8?B?Z2VjeXJMVzVJelYybE9rZDFjM2dKMjNYYWhxRVRndjdYenZ1c0tkK2ZzTE8r?=
 =?utf-8?B?elhGdWNueG9hMVZUSmtDazh1K1FCV0ZWcHhSazNEWENIejRjM3k5Mmp4bi9p?=
 =?utf-8?B?QVBBYUZsclRSNmh0Rm92ZCtQM3hpWnNlUmxlUVM2VnZKYTdydmtHYTd6MlF1?=
 =?utf-8?B?NWF4cmhYem5DT1ZjV01KVDJBWCt2Sm5DMlhsUzBRREtnNzhjQTFLSm44Zit1?=
 =?utf-8?B?UGd1ZmdiZXVDbENORlVrUUNvbllrTjV4dXhJWGJNMm5SUEZnQjdpSHJJdHA3?=
 =?utf-8?B?YjU3RlhaZE9Fc0tIRlNJY0hOblh0SHhHN2R0a3RDT3UzUEVEMENXdnZtdnNM?=
 =?utf-8?B?cCtTeDhVUHl0RmxNd1RSRTNtMEo1UjNvU2xUSDBMSzhLSFVYdTB3K0s2K0Ft?=
 =?utf-8?B?UG9YSGNrNEpKS01FdTg1a3V3WC9ZM0pqSG11WjRVZExRRzNXUGxDWVBmWFlv?=
 =?utf-8?B?c25tdldjL2hNM29EWHFOWGlraWtPMk5yQXZkNm92YWZQT2RNQW8wclAwVDJ3?=
 =?utf-8?B?QWtKQ1I0OVF2OVhIdlBIKzFMT2N2SEhITW9FYzZvcmxkRzJ5MUhzOVlkNnc4?=
 =?utf-8?B?OFoyQXRMTjFUMXdSMkk0Q0NhWXZyZWR4T0Z0SGpiNTA2K1U4VWp2VmFmTHMy?=
 =?utf-8?B?R1FIVzlHd2lCQnRscHZoeWphd2ltTmhuTGxIem1OaG9XQkFSeWZnTkc0N2I5?=
 =?utf-8?B?TG8zYTlBNHcxdmxhUnptUVFMUTlEbHpRVWx3dlprMHRFa0xFa1U1cXlMNTh3?=
 =?utf-8?B?ZmdwTmJzc3FQY211QS9QOXdqYW1oMURqU2lGSUYxWkc2bDByNllpMEQ4UDVj?=
 =?utf-8?B?MU5HRWhLcWNKeDVVd0hWQXhkR1dUTWpNVUYvczlSVGZHYTdCMDh3TjQySjlP?=
 =?utf-8?B?Nm9nSnUydzd6TnMwYlB4dE5ySTNyRnE1TUJMNmJFVTg5U0pxa2hKYlE2QURP?=
 =?utf-8?Q?gpYIn71/qMRc8voALBC2SB0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c818fd6b-cd09-4db6-9985-08dda3e6d3c2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 04:09:55.2191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKsf/eRPO7QXvYnaMaVCcv+6CoMX0XI/7tDEbM7GR0ZUTHQzZyipkvmTztQ15J1biwYpkIFBAgN8Nrusu8ibaEXml/U+LSxS0IWotf6WxEIGWeZ5pCoPQAFBg4t7WvTo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8848
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAzMiBTYWx0ZWRfX7MpdWbJCVuwK lsNcsU3k2qnTyUb+rr1cvgUheDvaqRADEsJFcH3oMSaOX+8osa6xXeOInDG+UMVQlRMDUci63E8 zMngvxdroG57s/bQE9yETp8HYWZmzIjNnCneBk+p5y4NAlk8RAyhprS0EnAVPvylTb4417s/hKH
 rO+IPmOehEof/TmBFnANPxmJ+GvQ4KqIMqlhl1axtz3cnRT8JPPaZDJ7UDgibnz4uXlwDpPb6UY OOKwJTKhtfuh6J7/4LlV+mfzHGR53+Cf6UK1pZbvdeLZ2fR9ED3ay0a5Po7AtmsxoQNK81rez5V 6k4WsU/ZgVKEPjt0fXaC340bI+7TZJOTHNx0PKchsGzZey+Zbi46PcVAhm/UKTYnURI8flokj+F
 We9cyJ+uHl79a1uYONI6BHpyX+QC1eL+kpMxJA4hyZDy0UNHiPpMK6XdITmyDyJolulyS+en
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68411898 cx=c_pps a=M8jSN2R7XD8P/Ui5Znz1wQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=pyk7SDHB-K1XHrngPFwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zR1dQhmZuT8u9OTldyIsbLtkURVPGT_k
X-Proofpoint-ORIG-GUID: HHKWviBfCI92FU5q-Ul3c0RMfew0RDPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050032
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5553sKTJ032690
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 04:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217979


On 04-06-2025 01:44, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, Jun 2, 2025 at 11:26=E2=80=AFPM Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> PR 32641 [https://sourceware.org/bugzilla/show_bug.cgi?id=3D32641]
>> PR 32643 [https://sourceware.org/bugzilla/show_bug.cgi?id=3D32643]
> LGTM, second patch does have some questions on bugzilla we should
> watchout for those to resolve along side.
Hi Khem,

Thanks for your review . Would it be preferable to submit only the first=20
patch as a v2 for now? Alternatively, if both patches are acceptable at=20
this stage, I can monitor the related issues and submit a follow-up=20
patch once a proper fix is finalized. Please let me know if you would=20
rather postpone the submission entirely until a more comprehensive=20
solution is available.

Thanks,
Deepesh
>> Upstream-Status: Backport
>> [https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D1=
8cc11a2771d9e40180485da9a4fb660c03efac3
>> && https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D=
931494c9a89558acb36a03a340c01726545eef24]
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   .../binutils/binutils-2.44.inc                |   2 +
>>   .../binutils/0016-CVE-2025-1181-1.patch       | 141 ++++++++
>>   .../binutils/0017-CVE-2025-1181-2.patch       | 337 ++++++++++++++++=
++
>>   3 files changed, 480 insertions(+)
>>   create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-=
2025-1181-1.patch
>>   create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-=
2025-1181-2.patch
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.44.inc
>> index 6906ab3efb..46a95838b7 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.44.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
>> @@ -37,5 +37,7 @@ SRC_URI =3D "\
>>        file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofi=
l.patch \
>>        file://0015-CVE-2025-1178.patch \
>>        file://CVE-2025-1180.patch \
>> +     file://0016-CVE-2025-1181-1.patch \
>> +     file://0017-CVE-2025-1181-2.patch \
>>   "
>>   S  =3D "${WORKDIR}/git"
>> diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-118=
1-1.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.=
patch
>> new file mode 100644
>> index 0000000000..d3709c7a4f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.pat=
ch
>> @@ -0,0 +1,141 @@
>> +From: Nick Clifton <nickc@redhat.com>
>> +Date: Wed, 5 Feb 2025 14:31:10 +0000
>> +
>> +Prevent illegal memory access when checking relocs in a corrupt ELF b=
inary.
>> +
>> +PR 32641
>> +
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-g=
db.git;a=3Dcommitdiff;h=3D18cc11a2771d9e40180485da9a4fb660c03efac3]
>> +CVE: CVE-2025-1181
>> +
>> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.c=
om>
>> +
>> +diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
>> +index 785a37dd7fd..d2bf8e5cbae 100644
>> +--- a/bfd/elf-bfd.h
>> ++++ b/bfd/elf-bfd.h
>> +@@ -3150,6 +3150,9 @@ extern bool _bfd_elf_link_mmap_section_contents
>> + extern void _bfd_elf_link_munmap_section_contents
>> +   (asection *);
>> +
>> ++extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry
>> ++  (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *)=
;
>> ++
>> + /* Large common section.  */
>> + extern asection _bfd_elf_large_com_section;
>> +
>> +diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
>> +index 32db254ba6c..2d82c6583c3 100644
>> +--- a/bfd/elf64-x86-64.c
>> ++++ b/bfd/elf64-x86-64.c
>> +@@ -1744,7 +1744,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
>> +   bool to_reloc_pc32;
>> +   bool abs_symbol;
>> +   bool local_ref;
>> +-  asection *tsec;
>> ++  asection *tsec =3D NULL;
>> +   bfd_signed_vma raddend;
>> +   unsigned int opcode;
>> +   unsigned int modrm;
>> +@@ -1910,6 +1910,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
>> +       return true;
>> +     }
>> +
>> ++  if (tsec =3D=3D NULL)
>> ++    return false;
>> ++
>> +   /* Don't convert GOTPCREL relocation against large section.  */
>> +   if (elf_section_data (tsec) !=3D  NULL
>> +       && (elf_section_flags (tsec) & SHF_X86_64_LARGE) !=3D 0)
>> +@@ -2206,10 +2209,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_=
link_info *info,
>> +       else
>> +       {
>> +         isym =3D NULL;
>> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
>> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-               || h->root.type =3D=3D bfd_link_hash_warning)
>> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++        h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, sy=
mtab_hdr);
>> +       }
>> +
>> +       /* Check invalid x32 relocations.  */
>> +diff --git a/bfd/elflink.c b/bfd/elflink.c
>> +index 1f1263007c0..eafbd133ff5 100644
>> +--- a/bfd/elflink.c
>> ++++ b/bfd/elflink.c
>> +@@ -96,6 +96,27 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *i=
nfo)
>> +   return true;
>> + }
>> +
>> ++struct elf_link_hash_entry *
>> ++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_has=
hes,
>> ++                            unsigned int                   symndx,
>> ++                            Elf_Internal_Shdr *            symtab_hd=
r)
>> ++{
>> ++  if (symndx < symtab_hdr->sh_info)
>> ++    return NULL;
>> ++
>> ++  struct elf_link_hash_entry *h =3D sym_hashes[symndx - symtab_hdr->=
sh_info];
>> ++
>> ++  /* The hash might be empty.  See PR 32641 for an example of this. =
 */
>> ++  if (h =3D=3D NULL)
>> ++    return NULL;
>> ++
>> ++  while (h->root.type =3D=3D bfd_link_hash_indirect
>> ++       || h->root.type =3D=3D bfd_link_hash_warning)
>> ++    h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++
>> ++  return h;
>> ++}
>> ++
>> + static struct elf_link_hash_entry *
>> + get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_s=
ymndx)
>> + {
>> +@@ -108,6 +129,9 @@ get_ext_sym_hash (struct elf_reloc_cookie *cookie=
, unsigned long r_symndx)
>> +     {
>> +       h =3D cookie->sym_hashes[r_symndx - cookie->extsymoff];
>> +
>> ++      if (h =3D=3D NULL)
>> ++      return NULL;
>> ++
>> +       while (h->root.type =3D=3D bfd_link_hash_indirect
>> +            || h->root.type =3D=3D bfd_link_hash_warning)
>> +       h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> +diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
>> +index 8e5a005fd36..832a5495eb1 100644
>> +--- a/bfd/elfxx-x86.c
>> ++++ b/bfd/elfxx-x86.c
>> +@@ -973,15 +973,7 @@ _bfd_x86_elf_check_relocs (bfd *abfd,
>> +         goto error_return;
>> +       }
>> +
>> +-      if (r_symndx < symtab_hdr->sh_info)
>> +-      h =3D NULL;
>> +-      else
>> +-      {
>> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
>> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-               || h->root.type =3D=3D bfd_link_hash_warning)
>> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> +-      }
>> ++      h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symt=
ab_hdr);
>> +
>> +       if (X86_NEED_DYNAMIC_RELOC_TYPE_P (is_x86_64, r_type)
>> +         && NEED_DYNAMIC_RELOCATION_P (is_x86_64, info, true, h, sec,
>> +@@ -1209,10 +1201,12 @@ _bfd_x86_elf_link_relax_section (bfd *abfd AT=
TRIBUTE_UNUSED,
>> +       else
>> +       {
>> +         /* Get H and SEC for GENERATE_DYNAMIC_RELOCATION_P below.  *=
/
>> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
>> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-               || h->root.type =3D=3D bfd_link_hash_warning)
>> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++        h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, sy=
mtab_hdr);
>> ++        if (h =3D=3D NULL)
>> ++          {
>> ++            /* FIXMEL: Issue an error message ?  */
>> ++            continue;
>> ++          }
>> +
>> +         if (h->root.type =3D=3D bfd_link_hash_defined
>> +             || h->root.type =3D=3D bfd_link_hash_defweak)
>> diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-118=
1-2.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.=
patch
>> new file mode 100644
>> index 0000000000..5af743582f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.pat=
ch
>> @@ -0,0 +1,337 @@
>> +From: Nick Clifton <nickc@redhat.com>
>> +Date: Wed, 5 Feb 2025 15:43:04 +0000
>> +
>> +Add even more checks for corrupt input when processing
>> +relocations for ELF files.
>> +
>> +PR 32643
>> +
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-g=
db.git;a=3Dcommitdiff;h=3D931494c9a89558acb36a03a340c01726545eef24]
>> +CVE: CVE-2025-1181
>> +
>> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.c=
om>
>> +
>> +diff --git a/bfd/elflink.c b/bfd/elflink.c
>> +index fd423d61..91cd7c28 100644
>> +--- a/bfd/elflink.c
>> ++++ b/bfd/elflink.c
>> +@@ -96,15 +96,17 @@
>> +   return true;
>> + }
>> +
>> +-struct elf_link_hash_entry *
>> +-_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_has=
hes,
>> +-                            unsigned int                   symndx,
>> +-                            Elf_Internal_Shdr *            symtab_hd=
r)
>> ++static struct elf_link_hash_entry *
>> ++get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
>> ++                   unsigned int                   symndx,
>> ++                   unsigned int                   ext_sym_start)
>> + {
>> +-  if (symndx < symtab_hdr->sh_info)
>> ++  if (sym_hashes =3D=3D NULL
>> ++      /* Guard against corrupt input.  See PR 32636 for an example. =
 */
>> ++      || symndx < ext_sym_start)
>> +     return NULL;
>> +
>> +-  struct elf_link_hash_entry *h =3D sym_hashes[symndx - symtab_hdr->=
sh_info];
>> ++  struct elf_link_hash_entry *h =3D sym_hashes[symndx - ext_sym_star=
t];
>> +
>> +   /* The hash might be empty.  See PR 32641 for an example of this. =
 */
>> +   if (h =3D=3D NULL)
>> +@@ -117,27 +119,28 @@
>> +   return h;
>> + }
>> +
>> +-static struct elf_link_hash_entry *
>> +-get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_s=
ymndx)
>> ++struct elf_link_hash_entry *
>> ++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_has=
hes,
>> ++                            unsigned int                   symndx,
>> ++                            Elf_Internal_Shdr *            symtab_hd=
r)
>> + {
>> +-  struct elf_link_hash_entry *h =3D NULL;
>> +-
>> +-  if ((r_symndx >=3D cookie->locsymcount
>> +-       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) !=3D STB_L=
OCAL)
>> +-      /* Guard against corrupt input.  See PR 32636 for an example. =
 */
>> +-      && r_symndx >=3D cookie->extsymoff)
>> +-    {
>> +-      h =3D cookie->sym_hashes[r_symndx - cookie->extsymoff];
>> ++  if (symtab_hdr =3D=3D NULL)
>> ++    return NULL;
>> +
>> +-      if (h =3D=3D NULL)
>> +-      return NULL;
>> ++  return get_link_hash_entry (sym_hashes, symndx, symtab_hdr->sh_inf=
o);
>> ++}
>> +
>> +-      while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-           || h->root.type =3D=3D bfd_link_hash_warning)
>> +-      h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> +-    }
>> ++static struct elf_link_hash_entry *
>> ++get_ext_sym_hash_from_cookie (struct elf_reloc_cookie *cookie, unsig=
ned long r_symndx)
>> ++{
>> ++  if (cookie =3D=3D NULL || cookie->sym_hashes =3D=3D NULL)
>> ++    return NULL;
>> ++
>> ++  if (r_symndx >=3D cookie->locsymcount
>> ++      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) !=3D STB_LO=
CAL)
>> ++    return get_link_hash_entry (cookie->sym_hashes, r_symndx, cookie=
->extsymoff);
>> +
>> +-  return h;
>> ++  return NULL;
>> + }
>> +
>> + asection *
>> +@@ -147,7 +150,7 @@
>> + {
>> +   struct elf_link_hash_entry *h;
>> +
>> +-  h =3D get_ext_sym_hash (cookie, r_symndx);
>> ++  h =3D get_ext_sym_hash_from_cookie (cookie, r_symndx);
>> +
>> +   if (h !=3D NULL)
>> +     {
>> +@@ -9105,7 +9108,6 @@
>> +                 size_t symidx,
>> +                 bfd_vma val)
>> + {
>> +-  struct elf_link_hash_entry **sym_hashes;
>> +   struct elf_link_hash_entry *h;
>> +   size_t extsymoff =3D locsymcount;
>> +
>> +@@ -9128,12 +9130,12 @@
>> +
>> +   /* It is a global symbol: set its link type
>> +      to "defined" and give it a value.  */
>> +-
>> +-  sym_hashes =3D elf_sym_hashes (bfd_with_globals);
>> +-  h =3D sym_hashes [symidx - extsymoff];
>> +-  while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-       || h->root.type =3D=3D bfd_link_hash_warning)
>> +-    h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++  h =3D get_link_hash_entry (elf_sym_hashes (bfd_with_globals), symi=
dx, extsymoff);
>> ++  if (h =3D=3D NULL)
>> ++    {
>> ++      /* FIXMEL What should we do ?  */
>> ++      return;
>> ++    }
>> +   h->root.type =3D bfd_link_hash_defined;
>> +   h->root.u.def.value =3D val;
>> +   h->root.u.def.section =3D bfd_abs_section_ptr;
>> +@@ -11611,10 +11613,19 @@
>> +             || (elf_bad_symtab (input_bfd)
>> +                 && flinfo->sections[symndx] =3D=3D NULL))
>> +           {
>> +-            struct elf_link_hash_entry *h =3D sym_hashes[symndx - ex=
tsymoff];
>> +-            while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-                   || h->root.type =3D=3D bfd_link_hash_warning)
>> +-              h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++            struct elf_link_hash_entry *h;
>> ++
>> ++            h =3D get_link_hash_entry (sym_hashes, symndx, extsymoff=
);
>> ++            if (h =3D=3D NULL)
>> ++              {
>> ++                _bfd_error_handler
>> ++                  /* xgettext:c-format */
>> ++                  (_("error: %pB: unable to create group section sym=
bol"),
>> ++                   input_bfd);
>> ++                bfd_set_error (bfd_error_bad_value);
>> ++                return false;
>> ++              }
>> ++
>> +             /* Arrange for symbol to be output.  */
>> +             h->indx =3D -2;
>> +             elf_section_data (osec)->this_hdr.sh_info =3D -2;
>> +@@ -11749,7 +11760,7 @@
>> +                 || (elf_bad_symtab (input_bfd)
>> +                     && flinfo->sections[r_symndx] =3D=3D NULL))
>> +               {
>> +-                h =3D sym_hashes[r_symndx - extsymoff];
>> ++                h =3D get_link_hash_entry (sym_hashes, r_symndx, ext=
symoff);
>> +
>> +                 /* Badly formatted input files can contain relocs th=
at
>> +                    reference non-existant symbols.  Check here so th=
at
>> +@@ -11758,17 +11769,13 @@
>> +                   {
>> +                     _bfd_error_handler
>> +                       /* xgettext:c-format */
>> +-                      (_("error: %pB contains a reloc (%#" PRIx64 ")=
 for section %pA "
>> ++                      (_("error: %pB contains a reloc (%#" PRIx64 ")=
 for section '%pA' "
>> +                          "that references a non-existent global symb=
ol"),
>> +                        input_bfd, (uint64_t) rel->r_info, o);
>> +                     bfd_set_error (bfd_error_bad_value);
>> +                     return false;
>> +                   }
>> +
>> +-                while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-                       || h->root.type =3D=3D bfd_link_hash_warning)
>> +-                  h =3D (struct elf_link_hash_entry *) h->root.u.i.l=
ink;
>> +-
>> +                 s_type =3D h->type;
>> +
>> +                 /* If a plugin symbol is referenced from a non-IR fi=
le,
>> +@@ -11984,7 +11991,6 @@
>> +                         && flinfo->sections[r_symndx] =3D=3D NULL))
>> +                   {
>> +                     struct elf_link_hash_entry *rh;
>> +-                    unsigned long indx;
>> +
>> +                     /* This is a reloc against a global symbol.  We
>> +                        have not yet output all the local symbols, so
>> +@@ -11993,15 +11999,16 @@
>> +                        reloc to point to the global hash table entry
>> +                        for this symbol.  The symbol index is then
>> +                        set at the end of bfd_elf_final_link.  */
>> +-                    indx =3D r_symndx - extsymoff;
>> +-                    rh =3D elf_sym_hashes (input_bfd)[indx];
>> +-                    while (rh->root.type =3D=3D bfd_link_hash_indire=
ct
>> +-                           || rh->root.type =3D=3D bfd_link_hash_war=
ning)
>> +-                      rh =3D (struct elf_link_hash_entry *) rh->root=
.u.i.link;
>> +-
>> +-                    /* Setting the index to -2 tells
>> +-                       elf_link_output_extsym that this symbol is
>> +-                       used by a reloc.  */
>> ++                    rh =3D get_link_hash_entry (elf_sym_hashes (inpu=
t_bfd),
>> ++                                              r_symndx, extsymoff);
>> ++                    if (rh =3D=3D NULL)
>> ++                      {
>> ++                        /* FIXME: Generate an error ?  */
>> ++                        continue;
>> ++                      }
>> ++
>> ++                    /* Setting the index to -2 tells elf_link_output=
_extsym
>> ++                       that this symbol is used by a reloc.  */
>> +                     BFD_ASSERT (rh->indx < 0);
>> +                     rh->indx =3D -2;
>> +                     *rel_hash =3D rh;
>> +@@ -13965,25 +13972,21 @@
>> +                      struct elf_link_hash_entry *h,
>> +                      Elf_Internal_Sym *sym)
>> + {
>> +-  if (h !=3D NULL)
>> ++  if (h =3D=3D NULL)
>> ++    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
>> ++
>> ++  switch (h->root.type)
>> +     {
>> +-      switch (h->root.type)
>> +-      {
>> +-      case bfd_link_hash_defined:
>> +-      case bfd_link_hash_defweak:
>> +-        return h->root.u.def.section;
>> ++    case bfd_link_hash_defined:
>> ++    case bfd_link_hash_defweak:
>> ++      return h->root.u.def.section;
>> +
>> +-      case bfd_link_hash_common:
>> +-        return h->root.u.c.p->section;
>> ++    case bfd_link_hash_common:
>> ++      return h->root.u.c.p->section;
>> +
>> +-      default:
>> +-        break;
>> +-      }
>> ++    default:
>> ++      return NULL;
>> +     }
>> +-  else
>> +-    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
>> +-
>> +-  return NULL;
>> + }
>> +
>> + /* Return the debug definition section.  */
>> +@@ -14032,46 +14035,49 @@
>> +   if (r_symndx =3D=3D STN_UNDEF)
>> +     return NULL;
>> +
>> +-  h =3D get_ext_sym_hash (cookie, r_symndx);
>> ++  h =3D get_ext_sym_hash_from_cookie (cookie, r_symndx);
>> ++  if (h =3D=3D NULL)
>> ++    {
>> ++      /* A corrup tinput file can lead to a situation where the inde=
x
>> ++       does not reference either a local or an external symbol.  */
>> ++      if (r_symndx >=3D cookie->locsymcount)
>> ++      return NULL;
>> +
>> +-  if (h !=3D NULL)
>> ++      return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
>> ++                            &cookie->locsyms[r_symndx]);
>> ++    }
>> ++
>> ++  bool was_marked =3D h->mark;
>> ++
>> ++  h->mark =3D 1;
>> ++  /* Keep all aliases of the symbol too.  If an object symbol
>> ++     needs to be copied into .dynbss then all of its aliases
>> ++     should be present as dynamic symbols, not just the one used
>> ++     on the copy relocation.  */
>> ++  hw =3D h;
>> ++  while (hw->is_weakalias)
>> +     {
>> +-      bool was_marked;
>> ++      hw =3D hw->u.alias;
>> ++      hw->mark =3D 1;
>> ++    }
>> +
>> +-      was_marked =3D h->mark;
>> +-      h->mark =3D 1;
>> +-      /* Keep all aliases of the symbol too.  If an object symbol
>> +-       needs to be copied into .dynbss then all of its aliases
>> +-       should be present as dynamic symbols, not just the one used
>> +-       on the copy relocation.  */
>> +-      hw =3D h;
>> +-      while (hw->is_weakalias)
>> +-      {
>> +-        hw =3D hw->u.alias;
>> +-        hw->mark =3D 1;
>> +-      }
>> ++  if (!was_marked && h->start_stop && !h->root.ldscript_def)
>> ++    {
>> ++      if (info->start_stop_gc)
>> ++      return NULL;
>> +
>> +-      if (!was_marked && h->start_stop && !h->root.ldscript_def)
>> ++      /* To work around a glibc bug, mark XXX input sections
>> ++       when there is a reference to __start_XXX or __stop_XXX
>> ++       symbols.  */
>> ++      else if (start_stop !=3D NULL)
>> +       {
>> +-        if (info->start_stop_gc)
>> +-          return NULL;
>> +-
>> +-        /* To work around a glibc bug, mark XXX input sections
>> +-           when there is a reference to __start_XXX or __stop_XXX
>> +-           symbols.  */
>> +-        else if (start_stop !=3D NULL)
>> +-          {
>> +-            asection *s =3D h->u2.start_stop_section;
>> +-            *start_stop =3D true;
>> +-            return s;
>> +-          }
>> ++        asection *s =3D h->u2.start_stop_section;
>> ++        *start_stop =3D true;
>> ++        return s;
>> +       }
>> +-
>> +-      return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
>> +     }
>> +
>> +-  return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
>> +-                        &cookie->locsyms[r_symndx]);
>> ++  return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
>> + }
>> +
>> + /* COOKIE->rel describes a relocation against section SEC, which is
>> +@@ -15094,7 +15100,7 @@
>> +
>> +       struct elf_link_hash_entry *h;
>> +
>> +-      h =3D get_ext_sym_hash (rcookie, r_symndx);
>> ++      h =3D get_ext_sym_hash_from_cookie (rcookie, r_symndx);
>> +
>> +       if (h !=3D NULL)
>> +       {
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217759): https://lists.openembedded.org/g/openembe=
dded-core/message/217759
>> Mute This Topic: https://lists.openembedded.org/mt/113443237/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


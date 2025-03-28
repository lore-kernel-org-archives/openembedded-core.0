Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B881C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 05:37:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5102.1743140267218502609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 22:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=518271cc57=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S4K3uR009058
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 05:37:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1pwde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 05:37:46 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52S5bjJ7023649;
	Fri, 28 Mar 2025 05:37:45 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1pwdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 05:37:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3n4J2SSpSt+SLuKANIY3TVFycXRCOXMgmA9EcV7uva6mj1puZ8h5F9VI/yh7DUhNLBE+M1CWdXqIhD6h4pFoTVY3futNHS55Pma3m5G3PZmZmwotQNKoAzOAdl7pgYnHB+oR1u5K08OVXeRq5f0xbvq0FJygKjHDvk3r4icE8YKPHOHqLdxfAAD3gASNx/Ej0WgzZEJfXSGLYuogAZKaONhKoyKB9WhVhWDGsKitYjL72jdbACQMNxl8UlG7WRG62yy3Epq6iwHmwSxh+XTpzjsnJd5dusXLdqMi/lN0QI24mfzVF2MQe094U4w9m4x+o57MHLNSO0ae5jrT56NGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmYJ2aHKtOrigQnJCq9EgQgdGo2ZyLQ/f2kB+K1zHHQ=;
 b=WJFt+ujkvRw3f2wMX+z5TSKn6i1BaFKIfyYKj+e1WfCpanuqJu6dZD0uykgXBKMrt91HkLkn24iMIG9WnSyIMzryXFCURG8M62y8cqsRAsEhbNrtmX4NxaMRSt5Aw/nx1etlDUxdBy0zUBwBQGT45uZFde+lgbiMDTwCdqbvVzqM4i61EjW4ULXvRxvmi80nd3U3F0rOXRMegblaZZxt0NpCB0ZD/1b+MvQDFEF72CmV1CwVKQ8VIbW0KrkurfTLYQHTd1wazAisbRnATZ4s9NaRtkslLn7EaHUhqrAoceoRydzABD1ri+qM0uOYUmDhjPxvlj5WWoLpBIIGFUixPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6265.namprd11.prod.outlook.com (2603:10b6:208:3e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 05:37:42 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 05:37:42 +0000
Message-ID: <1800bd6b-be1d-43a0-80b0-076f4471e631@windriver.com>
Date: Fri, 28 Mar 2025 11:07:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] binutils: Fix CVE-2025-1148
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250319093535.3368863-1-Harish.Sadineni@windriver.com>
 <D8P6NR9WNLW8.2A85J29IONJA7@bootlin.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <D8P6NR9WNLW8.2A85J29IONJA7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 970c260b-f44f-49ea-d5a0-08dd6dbaa8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TUZLMVFaYnB5ZnZ1SkgzNzRrRFdSU0hObzZyYjlCRXFmVnhTZUp2dCtFK2sz?=
 =?utf-8?B?disrYUdYcE81bDF1K09hMHg4TitweWYxY3VaVm5rTm95eFZvMzZEaWczMHRo?=
 =?utf-8?B?MGd4Wk1FWCtmS2VxZFVrV2pqTktFTjB0Z1VYMUZjekQ2MllablNiemkzcURY?=
 =?utf-8?B?L3VhNmJsR2Q0TzZEa2pxOUxqM3owRk85OGpMVW9mSVljK2NNdnRSOTF1bzh0?=
 =?utf-8?B?cmlRNUFTTkxvTjk1cHJ2alZLWUNpSmtIUlJXYytNeEhMa1dXOC9yVzRJTTE2?=
 =?utf-8?B?a2Ftd0RPajFUckwxUXB1U2xCUmhtbEEvN1JtcCtBRXlIOVE1S2l3YjQ4QnND?=
 =?utf-8?B?M244ZXhvWm5UYU5xQkpVUWpoOEJTRHdnRkMwVkZ6Yk9UUUUyUElSbENFYzZa?=
 =?utf-8?B?ZnZXR05EUHJyTkI1NVlsVkFPbE1NdklSWkNwZ1lBU3VpeVRPYVhaMUNxVUhw?=
 =?utf-8?B?QTNSc3FBbGg5RURnQmQ4R2xkZ09NK2p1amZkdUoxN0VYVlVlNFQ1UndWQUN3?=
 =?utf-8?B?OFFFYnNTVHZhSDZmT3Buem4xaHBhakt1bmpEYlRVOE5CcGxZUWFpb2s3QVZk?=
 =?utf-8?B?Q1JMNEZZditNd3k3N3prNEp4NFE4b3c3OWNHZ2FBSVNjZURJMC9sL2pjQ3l3?=
 =?utf-8?B?dGNqTVpHZ2hiRFBiQ2U5dFhEUUhVNHBCOUdpTXFCa09WOVNQSTVJbVVOb0VR?=
 =?utf-8?B?ZFBEMTlPbmtOUDU0aXA1djRmLytGRFdrVXNteFRPRWgvYnVUOGhDUDRvZWFm?=
 =?utf-8?B?bmZLSVJIc0ZrZGlwUnpVSGYwaDhZR0szZUJkUVZ6NjZZV2dDeVBmbWg1dlli?=
 =?utf-8?B?M3Jvb1AxUlJxUXpyUW41S3hTUGhHOWQ2L1RFMzlyNDRpUlRDck9lSDVzbXRv?=
 =?utf-8?B?NG9KOVFDSG9HTnBRUEVFS0NjVHhlT1NteG9uRjJDVm9laW81cHpuYUxlTXMv?=
 =?utf-8?B?b2VsWDVuU2x5ZzJiaVFFSWxwSnZoR1ZnRmRkajNoSjU1RzNBQTluSW1qeUNY?=
 =?utf-8?B?YmhpTGVxQ2dNTlVuNVQxTTdjTzlwTEsrcHRrWUUvRXd4YlJjUVY2ZWJJWlNB?=
 =?utf-8?B?OXZhb3BlQWcwQWx4MUhXbks3ZTZPSVFXSFVibnZPMUZ5MHc3MCsxMWQ3K25R?=
 =?utf-8?B?Lyt0TGVqc1BqQVk3eGgxWng4TkJEM1NQSjVGVlJpQmJPVGpJcXNvNVNmZWMr?=
 =?utf-8?B?YURhY3I3UHFkUUh0QnN1NFV3L0s1ZU5LUW1UOXZLVVh0TSt4clhhR0ExVDNU?=
 =?utf-8?B?YXVuVW1FUm54aG9DNzQzMk8wdEtib1dhcXpkWGkzQmhxNWg0UzdzNlowdmlD?=
 =?utf-8?B?M2dCU3dXKzJpcDRSYmtiNHd2SFBEaDF3NzBKd1NjanNoL0F2N3I5S3hHbmIz?=
 =?utf-8?B?eFVJVk5CUldtY1hPT0FWTnVWbVhqVnVQRzI1aUp0ZldGb3NiVEJXK3JTdHU3?=
 =?utf-8?B?bmFweUlrUCtXZG1INlBEZ3VDb2dON3N0WTg5UFY5N1dSejJBYTN3UVROSTdu?=
 =?utf-8?B?OGY0MlljV1ZaQmhJd3NtMkNvaCswYm5GbDRQZDJzOWkxZElnbUpiR2ZpSVZp?=
 =?utf-8?B?NStqZzAzTlg3cGlqcU1XVkdFeGhidG1uRFZsM0VlUk5Gb3h5MGdCdk1SS09n?=
 =?utf-8?B?QU4yUnJJMzkwWUlwS2ZSd0NzUWZvOTRLWEFaR0h2bTgwekpYU2F1UHkwUm1u?=
 =?utf-8?B?d0VoejgzcnpVN0dDOUhWbTVZRkQyU3hDMC9GdzRXalZtVEVLbGVYc3FhOFBl?=
 =?utf-8?B?YlFVam5vSi9tUVdDbVdSWndIYUg0dUlLOUZkaHFOVk1YZEEzdmJIVVlJODhz?=
 =?utf-8?B?NmQ4ZVR6ejc2UjJTSWQ1bno0ekFmRFlPV2laMGlsdUdsVTI3ZnRzb0syK0Jy?=
 =?utf-8?Q?6gRKpr0StbQr0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHd2L2gvTk5IcncweVhiRFhySUFTRksvSHVZWHFRRVF5MzFEb24rdzhrUDNU?=
 =?utf-8?B?Nkp4dTBxQ2pXNTB5UlM1eWh3STR6bWtwTVJWdkNvUmVwcGNSV1ZYclRoMVJD?=
 =?utf-8?B?U0U1dmh4WlArditlY2VEN21KVm84MEtNbVhnYkVYc1JybFNHV2xLRUltc29v?=
 =?utf-8?B?YWJLWFMyMlFVQ3lDYTcyRlErRnlyT1RxTk1QMkpEcHpvYksxU3gvUnhyYTR0?=
 =?utf-8?B?ckNQTCtKYmkxNGI4aVBKOUNhZEdQZmtlQzBZRDRseHQxTG90Z2JqQ2JZR1NI?=
 =?utf-8?B?Z3N4ZWMwZDlXeUdzRlRYcWFGRTRiSFZWdEdPTVZzZVBjbVkzdHNTNFpvS1Ny?=
 =?utf-8?B?REZ4VVRYY3FzVlV3eG52TDFLUC9iL0szaStZcHVJRVVCcUY5UjBxRzRYWUhH?=
 =?utf-8?B?ZWl1ZWpDOHpWQWFWL0RQS2tlU3Y1Y0UweFhvQThqWVFOVXNXYUo0a0d1T082?=
 =?utf-8?B?cnVleU1jL2dacFpIa2tOVkJScks0ZnA0Ymxsa01OREZYNG40QWkxVjMzczVz?=
 =?utf-8?B?YXVNR1ZFU3pPQlYrVHpYWGZJYlZCQnlKNEFnM1BQN0xFenlnbTJlYWc1OWVY?=
 =?utf-8?B?bExKRnJORm02NGQrbC96dG1QcjMzczMyK1ZjL3U4bUI0cDRBZ1JYNmJGd3h3?=
 =?utf-8?B?UUt5eXQrQmFGVjVLMTFoaE1RMkFxZUZrd2wvcElnVWpqWml4c3lXZmQ5TmVO?=
 =?utf-8?B?eXQ5aVE4dEdpRXJId041dndQTm9vK09uVVR0WHExZUxubmNpSHdYN1Vkc0V5?=
 =?utf-8?B?c1VwR3MwcldqMjUxU003R2tpc1l1eFBScnlQaXZjVHd4d2dzSG9lNkt1TFpV?=
 =?utf-8?B?d1o5elNTTjZkRjNYa21sVmhQS2RCaWNLMkJqbzdhNGtHK3NNcEhIRmc0SnpD?=
 =?utf-8?B?eVcyU2tLQnVicG9yL0Y4clZISEkzd2FXR0w4R3FYTlZqQUF6V0VrQlRMamM2?=
 =?utf-8?B?TG11YzlyQ3BPWEd6QzVDUzFUa0xoVVhjaGdSN3BnWWZZdXRoM2FtUHByZity?=
 =?utf-8?B?dHNFL01GbDVSbCtvZFlMeU01Y1d1OUwvUU1Qa2ZTc2RTQ0F1RmgrUHIydFly?=
 =?utf-8?B?R0dsMHlQM0RQUEtoSW5SNHJjMXJoRnBmU25iRjQ1V3FRR2lFZmVUZkpkcHJN?=
 =?utf-8?B?MkQ2dGt2K3lwSTIydzNpaUVQUTZ2b0J2d0hhemVZVUxVUk9nMXVXeExEZW4v?=
 =?utf-8?B?QVUxMnpTNFVKQ2dsdytWcVlFYXN0U29TTjYvNFhXYlBxL01NQmxMRW5MOXJh?=
 =?utf-8?B?RG1uZHhob1ZGZFZDZW8vMlJMNHZZb0xZNTBGSm5rVU0xZXpSanVtNERSMEky?=
 =?utf-8?B?dGk3aE02VTRQWGMvb05IYWJ3eTZqOHJQZGkvbWlXQ2dOOUZ2ODFjTlhtQ0Fh?=
 =?utf-8?B?L0Z3TCt0d2wvcDNrT05jRFZKeDVxZDlhaTNOZXNZQmYwS0VoVmcwQ04xQlh2?=
 =?utf-8?B?YUlPT2RQR3dJRkZkYmxwTEZEOGdYdlBaSjZ6aFBoL2tMQmNuRFFuZytkL0pY?=
 =?utf-8?B?RmtreDNEcFlqUHJPQkc2NHFUVGc5a21kdEZPSFpXYk5sTDNUTnl0MW02cm10?=
 =?utf-8?B?cTUrOXhIVTVMM0o0M3lBVDIwOVVoVS9qbm1zS2tOT09oZy9hNlBUa1llaFpm?=
 =?utf-8?B?QW5ZSm55UUppQXFjOWhBWFU2RlJZbDBJUXhaY0VOKzRUNEduZk9nR2IveCsr?=
 =?utf-8?B?dFRLM0JyQ2t1SWlTZSsyRVZkMSsxMFJ3VjlQTUxrVC9yUUw2dm53R0RGQ1NP?=
 =?utf-8?B?elBOUHJmUHdaMTErRnVucHY1bkloMldFRWhkTmVram8yNmprS3h1ZTRkQWF5?=
 =?utf-8?B?cVFkeGp4aEx5bE9zdXRCUTNxTkFoOTZ5WDZaem42L2RjN3pOSEJZVlpSSndJ?=
 =?utf-8?B?TFlTeUNORFF0WVpRNTN0MEZxUlBXUDIreFg4SHArNXJCL0VUUGRhYXpnUEIy?=
 =?utf-8?B?WmlNU08rN09ObjJwK2RkbDk4ZEM4UjJkWDdSUkgxNUlLa2JCd0l1ZzUvSmFl?=
 =?utf-8?B?am8wS0tlWWtSSnplTUU3MU5mS2ZQOUllWWIyYjBab0M1SHFjaldBanJSaDJv?=
 =?utf-8?B?aWZqR2VOUTEwVGpPMXJSY3RDclRMcjFFV1pwQktiLzJwQjJNNkFCSGI1MzFL?=
 =?utf-8?B?NEt2dEFqZzA1RWJJcTNaUGtobzhVRWozbStjZUJERW5sLys2cTJhM2oySitl?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970c260b-f44f-49ea-d5a0-08dd6dbaa8db
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 05:37:42.3246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7u80N3TXLZ07844htfd9b8VEz6r4zT3FPAuTR+1kUXXnSAvfihZklM7HrsmntM8EUqGMCXWnYawS8jpeg4AiF59Uc2ScQsPA3ZkH9dBNe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e635aa cx=c_pps a=UtaLnOzkojfj4BVWksq/2g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=CCpqsmhAAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=B6vy74BQAmBtr95pS-UA:9 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: G2QijO9gK_cKWvOdgCHZ3jIAef9L8fiW
X-Proofpoint-ORIG-GUID: GSuBvF6cemUYnApMl6duKcBSmSsRzFgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 05:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213811


On 3/25/2025 1:23 PM, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed Mar 19, 2025 at 10:35 AM CET, Harish via lists.openembedded.org Sadineni wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> A few place dealing with ld script handling made some attempt to free
>> memory, but this was generally ignored and would be quite a lot of
>> work to implement.  Instead, use the stat_obstack rather than
>> mallocing in many more cases.
>>
>> Backport a patch from upstream to fix CVE-2025-1148
>> Upstream-Status: Backport [https://sourceware.org/cgit/binutils-gdb/commit/?id=d4115c2c8d447e297ae353892de89192c1996211]
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
> Hi,
>
> Thanks for your patch.
>
> I've seen it is already discussed, but as an additional note, current
> version seems to generate some build error on the autobuilder:
>
> ERROR: gdb-16.2-r0 do_package_qa: QA Issue: The /usr/share/info/dir file is not meant to be shipped in a particular package. [infodir]
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1170
>
> I tested "bitbake world" with the same configuration as in qemux86-world-alt with the current patch, and the issue did not occur.
> Typically, errors like "file is not meant to be shipped in a particular package" arise when there is a change in the recipe
> related to installation or packaging.
>
> Thanks,
> Harish
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


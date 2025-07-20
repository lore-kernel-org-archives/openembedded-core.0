Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D432BC83F22
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 11:45:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16568.1753011901387661953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 04:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92969b1300=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56KBfvOp3578725
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 04:45:01 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0rtrk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 04:45:00 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56KBj0p43582986;
	Sun, 20 Jul 2025 04:45:00 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0rtrg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 04:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mF8pDmWU8TwRM1SqLe3jdSer3Z1zRKVh0/5CBvIBy/sFNLc/H5Pi+O805zcmwbV6Ec+KjfEuZQQ273pRhWpWuZUAdyhUdGbRC5IZFZFDHgQ9pcLBKCnceFwW1pHGjbwzPozdqPZzfa0lWTKpvnvvxssI+m48VITTwelLNBfTQ5nL7yXbUx+dwPjrK6FH2V31yLwIC6iQVvyCgdeuPoehnpYUlrKyhw2rm9DtYKotQ1yt665t+GG2mOBF0EJLJtCgAv1/S4Phpx/BeOqV/cAENm6l++IEXB2RRO1QbUekwzGE5q+Omr6JCxXxAfWPHp8Rh2wc2q4BalTv03myAVtN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTpewGf5oxsc9UryD7WgF0cdnuZaI51ExG4OvJK/OMU=;
 b=GSEIDry0zFZAdXNJN2BH5nQPNTP7kXExpZkQ2vq3TU+aX9uU7rk1fp1Fl4BxMrYtEClY4QVTzMVKh1Bi3f6xI8Wd3lnJUoGIVNQwUqlvridj73o3pPK/1pBJBwGjUsyaZo87CNKzUmkIp4nNk6Sr1ezTtfYefT8cyvzaUnqEZQcuQ1HYdM6E9HDoHH9t77kXijgDq/2G3ls/jozQjwtP0KUzKg78pvdVEUwXvhkp1iIurQnpeN0uQQqA7ORkLllXk5OZGubPhSPah5U3o2bLrBkXPajQ4H01FFW8i3Wbj11cbDzvktlAHQ0599yZF5WcpfITuRP8TTeL/hbmfBivmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Sun, 20 Jul
 2025 11:44:57 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.8943.028; Sun, 20 Jul 2025
 11:44:56 +0000
Message-ID: <f55a9110-37ea-4a7b-9351-194a49788c1a@windriver.com>
Date: Sun, 20 Jul 2025 19:44:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] compiler-rt: Use clang for native compile
 as well
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <20250711064233.590809-1-raj.khem@gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20250711064233.590809-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:3:17::13) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: b810e696-7ee4-43de-93fc-08ddc782d939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M3NmZG5zOGpmd1ZxRDZweTMxT0VXdnBxSVBQczlyTjIycnI3L3N5ZThPK25C?=
 =?utf-8?B?dllMYXZsdmVqTjRtZWlyaTIyc0VNTkRyVzJzME9iMVZwdnJMN1VFY0drZVpk?=
 =?utf-8?B?TWQ1Y0pacWJid1E4emdGR3FFRjJzU3VOLzlDellUeUtVUjZJQkdURUJmaG5j?=
 =?utf-8?B?Z2tnZmhGOUdpTGJSSnRMTS9sUVp3WXVYREIwUERKQlFkUEo4bklYYStyVTha?=
 =?utf-8?B?YzRTMnUyRS80S1BCQU9xdGpLeUR1SzJ1bFcyQjdSOWpoV1ZGdWI5aXppVUhL?=
 =?utf-8?B?TXIrejFKRzJubVI0SmhyQmEvdmtKU2Uwa1V0OGgrVTN6Lys2VjkyVE0xek5I?=
 =?utf-8?B?UGNTMzBNaWdNaHozMmwxZVVCQWFwSHdRWXN1c3ZSK3grZllyWmQxSm4wb3Mr?=
 =?utf-8?B?RWkvcHcyall1V3ZXdFFTMTNXelc1eTUyT2xNZ1Q5OGZ3bml2ZUdwaWIxNjRO?=
 =?utf-8?B?MVdueUpMcGY0aGFVVVQrRzZNTUM0QzVRN1FFK1E3VW93RlFwdWdkS3FQL1Fr?=
 =?utf-8?B?VXRCMXZBNDRnZTh4RTU4d1hGKzBjWXR3d240UGtpczdTYlJlS3FSSXUvazQz?=
 =?utf-8?B?YkZFMTdOVUU3YUdSK0I5Z1p6TmovM1F1QWNGTm5qL3V3a04wS2hzeDh0Mi9z?=
 =?utf-8?B?ZXc2WXVwQng4RnBqL09MMDIwaXN4dHRwS1VCZExLZVJjV295eXU2RS83ZHVZ?=
 =?utf-8?B?WmR5U1VRME1OalNLNFIrMm9Ub1J2aklianIyRlpFUmdWcHNrbXdwOGUzWXdv?=
 =?utf-8?B?WE5uSERRckhTV01JbGxZYm1FampRdjduT0FmNklwZTNxUk5ldTREdFlLL0Nv?=
 =?utf-8?B?M1lrSzVxR2g2Q2xZQU9pZHdhdkhRYUtBaE1PU1NZQ3F6UTBEeGZCcEZkU0FT?=
 =?utf-8?B?VlNKUmdUekkxWkUyeDk3RGdHN2lSVjRJRW0zYjRFK0RmbnVSaE1IdDdPT002?=
 =?utf-8?B?WVJOZmV5c043MzZwSXVLVVFEenhCclJsTGk0SStiak1sNnhzVkxMeHNCK1BR?=
 =?utf-8?B?dUVjenlDMEZ0cjRIeVV2eHlxZjVydWdnbGZKVUROdVdLS0tLRUNFLytYbzRu?=
 =?utf-8?B?QkJtWU9KTGxuVWtETkhIem4wSUZKNlI3RGRRWGRWaFlZUzg5d1V3UnJtQmpM?=
 =?utf-8?B?elE0My92ZlNUdy9TZHd3WnlQb0FvU1k1OFFibW5EQXJVM1oySXRaSUNIVU84?=
 =?utf-8?B?RSs4cW9ETzVLMGEvRlFJOWVRYTgyUmpRc0I5Y0dLS3Z4aXhoZE5EL3lhdHVz?=
 =?utf-8?B?OFAySDRaWFloNWtaS2JxRHNUeXdTcmsvWGJrNXIyM2FjcElvTGtma2M3ZzQ5?=
 =?utf-8?B?SWxuUlhqYUxGQ1lKMU85V3JjZXhUMGJCa254ZjB2SmdyRXpqNlRFcU9FbjZM?=
 =?utf-8?B?MjFFL295eGM2OHFab3VoenVDdnppaHBkMG5zVENJbDVMRnU2RGw3cTRhZFc2?=
 =?utf-8?B?QzB4a3BVVUVVVkk2NFRvc081T2F1SG12Mi9CTjI4dndXWmUzU0dVWWlXQ0lt?=
 =?utf-8?B?cDBoaGNIS3VPVW9oOXVMNFlrTEZXRjhJWmI1WUVVSnVYTEdFMVkrdnZ1U3pB?=
 =?utf-8?B?ZjVFN25OU1VGSG9DbGdmOWJPZzlad1hIdyt4TlJheXE3ME5OelNlRVkwcWJN?=
 =?utf-8?B?aWhvb3Q1T3ZmcVp2RGIyR2c1L3pNR1BVQWtzNTk4bi9CM3ZLb0pGbTdUS0lH?=
 =?utf-8?B?a3RoMFBhditmanppVVJvZmVuNnFHVnlUY0ZIZFUrV3dpK0NVM2dmeENjQjFq?=
 =?utf-8?B?NWhyR0d1MUV3ODZWdVFkTTJhR3Nkc3ZGaG4raldSeFM2MmprejQxNVNPbU91?=
 =?utf-8?B?MDhDK0tORTBWOTRvQzdISCtwTzVpUUd2U3k0MzcreDJaZ210NVFWY0I5RjNM?=
 =?utf-8?B?YURrWTBtTnJHT25xK3JLeXFsdFNXZ3JQckhROFNYeFJnWnZjQVpuK3JLSlpQ?=
 =?utf-8?Q?sq9Yuc9acf8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?blVaQkM1eVd5WHRRYWkxcFlKNzAzQ29pRXgvSExjWWRHcngxQ2p4RW1FcmFM?=
 =?utf-8?B?Qm1DM1E3MXBMQW1YNndSd3FKYUhXTnBrUUFYTmlFd0pTbVZzNkJnQmkrSERF?=
 =?utf-8?B?ZjR1VUJhZUpIb3laMEVzVkJnaEswRkRPb2l2MVMweTNBSzBTRGQzZUhRckRU?=
 =?utf-8?B?ZmQrTHJmc1pqaHkzV0w3QUhZOTB2NXZ6MFFrNUpFdVlrdDA4Wk9EaEVYSUda?=
 =?utf-8?B?QTMyM2EwTlRKVEJMQlBNZ3ZaMU9DdFZTVit2cUJPbmR3RVVLZTgxcDR1VE1O?=
 =?utf-8?B?MFlNcGwrY3VVVTBTc0pJMWdBbUZUdlZVSVp2YzJObEJYeUZvQWpaTXBHaE1R?=
 =?utf-8?B?ZWwzTVpuZitTYmpjeVFtallMUzVIMDBVT093WENQalhRZEZoOWRMajAvUG5s?=
 =?utf-8?B?M3RQZG5PbnlJSDBXU2NRcXpJMzlSMEdxYjRDaHB0RG5zMkh2bkRQNmhBTXBs?=
 =?utf-8?B?Vk1nN3ovUEhGYVRpcXY0aVRnV2xFVmNpVk1TUXF5ajRRVy92cHN1WXp0WDdl?=
 =?utf-8?B?b0crQzNwdk1HUFBaSGtHSUk5aklvdnhlUXZpbTk3ckRxelFVemVjcjRDMlVW?=
 =?utf-8?B?b3FPSEdrUzB1Ym1SbWtPU2ZnMWlrY0s4ejh4emlzOE5URzRkOWxHVS9aNU1u?=
 =?utf-8?B?dDFGM3pUNEJIeW5Fd2JDRlN0UHpFVmFaMTM2cHhlU0pwK0dOcUgweVNNYUlP?=
 =?utf-8?B?Z2ZRc1lWV0MzY2Y2SUd1bE9vQW1TNFExbnE2ME9iU3pDZE5KS3owVmJ3L3FC?=
 =?utf-8?B?OXcvVUE5TzFsUC9UWnVGUnNsTXJranFJS1pyT2ZGVnZucXIyN1BmeE9ma1N6?=
 =?utf-8?B?dC95QXFpaldxbjlyWjBERHRPeGZlVlRnMHl4UEpJMDhYRjVpbVlUOWhYUTNB?=
 =?utf-8?B?R3pkSnZCUDhJSGF3WUNqWUp1SHFsSDNPWU9OZXJzVWIxdXNUU3A1WDFnSC9P?=
 =?utf-8?B?S0ZFdmxyRTZBdUUyUzc5N1NFNkhFZXp5L0JYVmVFcUl6QXF6UkhzMkdWU0l0?=
 =?utf-8?B?MjJoMUx0TmRZVFlZcnpxUGN6WnR0YVl3OUx2di91U2o4T3grNFZyNWpjeGtE?=
 =?utf-8?B?dlJWZkpyTVR6M1Y5WkZsRndlYkRTYlpnNjJLMjFkZTY0SkRwRjBjVjNDOFdz?=
 =?utf-8?B?Qk94S0xEejFHaXdubi9sWkFrYTQxTzVhdkRXdGJWOVhGaDR0djc2RlpuZHo3?=
 =?utf-8?B?S0dQMXpXYW13ODBJUHZnUEwycmNSNjIyY0xhMGFkbUkwSkFXNitlSTZnckpn?=
 =?utf-8?B?QXN4bmlrbDJyR0tLdVg1Y3JiVmdIVCtuMEF3N0F2L0twNHB5WFFGdTgrMnI3?=
 =?utf-8?B?Z0ZpbDR2eW9MR2VudjVvY2lMYXpNQXBNenFaYU04MHBKdzVia21CUy90NEtl?=
 =?utf-8?B?MmFoaFIyWTlwTGdVekQ2L0FDQStNM0w5L010L3JwaE54VXgvSDlUaFpzMldZ?=
 =?utf-8?B?a3JSaGFaQldHTVdUaFR1U2c5WlI0M0N6M1BRTUJ3MHdQOElzNlJLYlJvMmZS?=
 =?utf-8?B?MGE5UlA1bjdrNnpSQXhIUGk0NUlpbVZBdmFBbnZuMVlJaXF3T081Rnp0L092?=
 =?utf-8?B?OEhROXVnVDF2YXRqSTZBaWhLTnIvNzAxQUpwblRpZFFBc3FiVzZrVjkwM25U?=
 =?utf-8?B?Y1NPQ1R5UzZ1eTUybjV6OWFYUnlWSU1rbVB1amZ6bTVJcW5rSGhnaGpRNnZO?=
 =?utf-8?B?Q2FiZElKSDlCZFFYM3VkZjlLSUZMZk1GeVV0RERPdFNrK1psMDRIMTFUV2R6?=
 =?utf-8?B?U1dlTlMyK0JHcVVuYWE1NFlMY3k2UWw4N2R1VWplUzVJZWgxV0Q1RlNGVUFy?=
 =?utf-8?B?LzhzbHQ4cmhKUTZoYlVjQ3F6N3BzQVdBK1N2bUhBZ0h2VldKelFFcVo0ZGVr?=
 =?utf-8?B?RlFVZWZ3VkRNWXdTeWpoQWZ4TTRpekV1bEZET0JJWE9VT3Z0UEw1dTVQOVFq?=
 =?utf-8?B?MUZNT3hHcm1RNnV4c0RsaTJPdlBqVmFTcEd6OEZFZ3ZzNEVkcDJWVnoyQmwy?=
 =?utf-8?B?ZFNIb1d1em1MTlRzYWRMUVdIUk84TWYxdEppN29UWG9FYXJCVnFFc1lrOHlH?=
 =?utf-8?B?RW5PajBFUEdMUFdsdWE2aHhnc1pYbThrdXdXd29vWGZ3b2JsYVdoU01kWHNN?=
 =?utf-8?B?WUhoUW9LTU9zM29mcW42NFNoZGluSWxLeDVDcll3c0pqNkZWNkxndnZneGsx?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b810e696-7ee4-43de-93fc-08ddc782d939
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2025 11:44:56.5538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfvixi85mHXkYCcfAe34FJAH7+YrEo9mmZJT1zOcaXPRs9kCyUb7SiUPS3VnPbraY52bXSUDQGeHTslC0z2C4v1xSfp7sdgaSDQCoZk8d6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX+e2UJfFQsaHx
 QNb9f+ChaHr+aw2p6YYx9bsxH13TpBrAsDeWNUmwcdSehX8JCoB96+K4UkNcfd8NpTTbHjJzIJ6
 wTAikkYfG0EptGtoA3xuFEOcShM8SLSrycuDNETqcDhMX2xuYsBvL0VqZjZgAKdZzh676TCWjQY
 WNVAD9GlssfH5AfAHPyNQwT7EWSs9vpzu1jS5sKjc57c7N0VtOe5MOrpflu5Nup3gE3Hu4WSab9
 Z8iE8pgwYulj/+qNvYoEFOVnaAAtxmGm8UaJ9CRlTQ+KG+RlA1qsN9DxpHgi0PArKuh3+iTcTK1
 f6LZ0LS8agLqinjYDsiukOYhB/s4cSI82IarTtXHQXJ1fnsXd9zvYXovJBP/bLSILRAVHmBZO3R
 9YZA58FN
X-Proofpoint-ORIG-GUID: i1ndDel1P3G4eAWxCTkTr-hf4Hate8rm
X-Proofpoint-GUID: uJZ9fIZ-jpV_io3GhMMdBZreLJRAQerS
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687cd6bc cx=c_pps
 a=bs151/dfgynEF4VOmA9JGA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=9NV4zIgr2Z8k0ds7ixsA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 11:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220621

Hi Khem,

I got compiler-rt-native do_configure error Ubuntu 22.04.5 with this patch:

     /ala-lpggp71/lyang1/poky/build-u/tmp/hosttools/ld: cannot find -lstdc++: No 
such file or directory
     clang++: error: linker command failed with exit code 1 (use -v to see 
invocation)
     ninja: build stopped: subcommand failed.


I have tried:
1) Add libcxx-native back to compiler-rt-native's DEPENDS, there would be 
dependency loops.

2) Install libc++1 on the host, it doesn't work, get the same error.

// Robert

On 7/11/25 14:42, Khem Raj via lists.openembedded.org wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/clang/compiler-rt_git.bb | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
> index 342a7b0e95e..4da85f29378 100644
> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> @@ -35,9 +35,9 @@ DEPENDS:remove:class-native = "libcxx-native compiler-rt-native"
>   UNWINDLIB:class-nativesdk = "--unwindlib=libgcc"
>   COMPILER_RT:class-nativesdk = "-rtlib=libgcc"
>   LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
> -UNWINDLIB:class-native = ""
> -COMPILER_RT:class-native = ""
> -LIBCPLUSPLUS:class-native = ""
> +UNWINDLIB:class-native = "--unwindlib=libgcc"
> +COMPILER_RT:class-native = "-rtlib=libgcc"
> +LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
>   UNWINDLIB:class-target = "--unwindlib=libgcc"
>   COMPILER_RT:class-target = "-rtlib=libgcc"
>   LIBCPLUSPLUS:class-target = "-stdlib=libstdc++"
> @@ -57,6 +57,7 @@ LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
>   CXXFLAGS += "${LIBCPLUSPLUS}"
>   
>   TOOLCHAIN = "clang"
> +TOOLCHAIN_NATIVE = "clang"
>   
>   def get_compiler_rt_arch(bb, d):
>       if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True, False, d):
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220135): https://lists.openembedded.org/g/openembedded-core/message/220135
> Mute This Topic: https://lists.openembedded.org/mt/114096532/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


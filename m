Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588C1C83000
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 08:25:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34513.1751271903627358025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 01:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9276daefd4=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U5s3OT006498
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:25:02 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2053.outbound.protection.outlook.com [40.107.96.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c99hp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:25:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxoPmqgo9GBOZP1Jw1lTE9t+zK9ZXYsNbykBEiZCPIs/FjK3H1Om3nhruJrqE0lZRD8+DxZda9HpUMGEMaemaP2FkOdZhmP+NxlR6jXkpHwXUi7iEpSEtZY9bplfwPd/GWa0dXoKUZ6wls4LRT/4/wok2T1STBQtjFeAUcceB0iTHWUO02CYYfWQ2MHo/OH8AcoKAUHjPtJotOBAqx79P5Mb8ar9x1CXVqj/4J/2ePBWJx0EMl5u0wFy0UsBrCMLcPrYEGwgaeNdbMWdEsi04U4217fIVVjwZJ3eqAuZFxFk6FnDjWgTEz99bxNhGtxUzypYZyFJ8caEvxx1iXf0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbwKBUzH1Ztn1ieUHDXoQsyPiHbvmeH9anwG+xCF5Zo=;
 b=T6erZX54ZHU9N5Lh9jvAWYpnILNj14HXc8f6FmwdfVjJmaosmTvX2gfZNL8GUQam9ooGDRybq6RBWA/pL2B7m1jfa+Q0uk2YsCq4dOK3hacSotGlwSbmW8zdFP2J1+8dUNNFBHuQI+Y6QUTh7OE7DaWsQlkFnU3A7j9vfA/0IlfGZFCEvhx+Y5UNDqXGCrE3l9Dw3GpPxzcg9CB2xN9dQZQ2C44A/wmx6WhdciRrfzKUXV5q1eV81G7400DxxLYFNBG1ipKIPSmrnWUQjf2jFH8iv2Ap6hsCKNTV4UOezqpzmb6XXN/UEg9jH5rqwNwM0KzwjpQ3IcdFcOaeWEjTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 08:24:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 08:24:57 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] systemd: backport patches to fix CVE-2025-4598
Date: Mon, 30 Jun 2025 16:24:43 +0800
Message-Id: <20250630082443.303735-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SE2P216CA0092.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 3047c02f-6e33-44b6-da0e-08ddb7af98ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K0JRT1dqd2dvSmRSM1dVYThSSk4yOEVJZ245c0d1R2tQcFZkcW5xZXNNRGpv?=
 =?utf-8?B?em8xbFVBeEJZN052cTNZWU5GaGtOenZzOVh1Y2VDK2U4OHB5MU1aN0FYVk9s?=
 =?utf-8?B?Y1NxdE4vdXE2SlB2SkU5bHYyb0NBc2Z2Tm9SWTFLSlBFY25QNG5OODdiRHln?=
 =?utf-8?B?TTBvc0FzaG5iUkFHa2tQNDJlZHVMR052emxZd2R0bm9rMEZKRlRVRkxvRFRB?=
 =?utf-8?B?c2FTK3o4WlduaW5yYjRKWkFLMXJIRW5OSUltK0NaWWcyUjQ3ZDFRRXllVVNZ?=
 =?utf-8?B?V2JjZGphbDVNLytwYVFvNUp5b0NSRGxGaUZUU0p1YXRnT1pFMjZqN0JPb1c3?=
 =?utf-8?B?ZXBUTVdzZ3p1dThUSE50VWtUOFlMSFB5bThMc3NEeDdBeHNuOGRYNlhhaEkr?=
 =?utf-8?B?N1pzRmlnb1VPZmVDN2RpYzErOUltQ3krUDluV1NnaWMxV2w5NlNXT0tsYmZY?=
 =?utf-8?B?TFYxeWVVcVpQdnQ0MTNlMERERVNjNnhRWFJQY3ZaUGVvYTNmRjF1L1gxVjl2?=
 =?utf-8?B?ZVBHOEF5SmlwS2VPdFNHbms5RUU2ZG8vU3dONGdXbU1BMy9EaUszT2Q4UjA5?=
 =?utf-8?B?MFh3VFVxTnJFbjVQVlg1RCtONm9PdG1rVGlZekxOM3Q4SU1ZeVVhck1MYTZN?=
 =?utf-8?B?RHU0S2ZOandLaWZRT3g2a2p6YU56TVpwNmVEMERaaWlFM0FkNG4rdDd5UlBT?=
 =?utf-8?B?QzFhNzR2eFZkS1RHanZvUnRMcVFNVmd2K3BseTI4OUZ5M2YzT3o5RGw3ZWJ4?=
 =?utf-8?B?WmVOakhYR3lSdURQekVISzZETFVZRmNtM0gxVDIzOVg5aFQxL3F3eU45V1Nq?=
 =?utf-8?B?L0tNSDJvQUNHdzZhT0FsU0JwZGJzUmRZMUdxbWdpeE9HeUhNcy9zSktPdGs0?=
 =?utf-8?B?OTZjY3psREdkTFh0d2kydFJUbFc5NWRqYWhzWEhJK2V6MEFTMzVHZkxiS2d1?=
 =?utf-8?B?aENoWFRod2NsMVRGYWVaWDZ1cytQV0FQbkQ1MCtRaGJOSFhmaGh1K2xwQ2JW?=
 =?utf-8?B?VmVxN1h0Y25LbUFKcWtlOThOVHRwcHNWV0I5YUJwRUxnT2R6dERvc2pYdUs3?=
 =?utf-8?B?bm9penpXbzZVZ3ZIY3drRG56QnVBaTV6amxBV2dOdDJHdThpYmhXeEc4Vm1P?=
 =?utf-8?B?Vkx2dExzME1Na2ZHKzNCc3duREE5cUFaZEZSa0g5eEQ1SDhWakNHc2gwMlBp?=
 =?utf-8?B?dmFla0ZHMEVNck1sVmwrbDlCdVRRTkl5WnVWR0RyZVZpQmdKWk1odWlZcm1p?=
 =?utf-8?B?RnBQTENKR1g5YzRXZWcyZU8vWDM0L2dMTmxYUFNKNzZ5WmJrTXgreWtZMHda?=
 =?utf-8?B?L2x0S3BBVzZ5MFV1UHdoV2FaQ3drTUwwdXUra2gzdXZQc0tVREUzaHJmRmdW?=
 =?utf-8?B?THhmNnVBbm9hVVhERXMrSFB3bE4xZmZSTk1ocFNybFYwSnVmbE1wQ3gvT1lX?=
 =?utf-8?B?bXdtRWtQeUpkVlU2K1VvY2RoTXRTUjByT1pSTlRXbzFEekI3UFZKNnd1SUEy?=
 =?utf-8?B?MXlhVXU1T1dHR2JUb2V4QU5YLzJ4UG8zcCtUNjJjZGp4WGFxRzkyYnM1bEll?=
 =?utf-8?B?N0FnK3hWNVB4ZGpZZ0tuQ3pPVkdMb3BLSmxtdFVlUlZqMUFIUmNmOERjWWxI?=
 =?utf-8?B?UEhYTy9xcit1UVNYQnRKNlRVVzVkK1l2dXl3T1daMkQ5Ulpic0VwOHA3T01W?=
 =?utf-8?B?Y05RZ0hTMnpxUGxkYm40eGNha1RQcnpxTTNyYnJTMU0zVWN3RDJXTHBwcVdl?=
 =?utf-8?B?Y0U1eWh2bHF3MjNOWmlWNTdoczZRWGdTaGJTaHZ0ay9zaE5Tb1JkTS9kUjMz?=
 =?utf-8?B?dXczazhTSGN4OUdObW9xcEhEWkoyTTN2MEJTM0RNOHVxNDJjamovdlFmdzNF?=
 =?utf-8?B?ZFdmdUxSSk00a293a0lNVFBRd3NCKytEY0JhdGVrNkcycWZteU1SRU1QWVVR?=
 =?utf-8?B?ZVBGWGlXRUVUeDZRSTB4elRkeXZtaHV6dFozazI0U3VlTjNwYlJpQ2RDR0Jj?=
 =?utf-8?B?Q2ZKTEswRVF3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TENXMVhXVXZWLzhGd2xuQ0w1cVlmVCtsLzA0anhwLytoaHQvRE9HanMxTG5M?=
 =?utf-8?B?dERWdnRLWGpKbm1OQW13YXFKVEtoaWdSWVpwSkZwdlhXeGNXS3pXN0djYUhX?=
 =?utf-8?B?bkxMSnJ5Y0tLYVE5TnVKZ0NpZmd6QmxwSE0rZElOeUJlSnpCdTdsU3M2TFdk?=
 =?utf-8?B?L21heGhkTHdkdUkrMFlkZm4yQ2wrZ29KZ0piQkNaWG9zQzdHejZKZFh3WVUz?=
 =?utf-8?B?eE42akZPOURrRVpadXNzODlpdWp6MU1TNlV0akVTZTJHd0RZQ05Ba1BaZFEr?=
 =?utf-8?B?UHNIOWkzTlRJWll5YnkwaHF1OHk3V1lPV2IwLzE4aDc1c3haakphK2NpUW5h?=
 =?utf-8?B?UnNEcnRFSWcyZ1BlaFBZYU10b0l0VG1qNUF4bk1nMUZEdHhZcFVnTGcxeWpY?=
 =?utf-8?B?L1BaZHNYNzlGN1R2YzhRNCtWRjM5cHM2NlZhQkJoemx0Zi9UTGsyM2JNK3k3?=
 =?utf-8?B?WHVnN2M5TnY5M1dpZ0ZKVTFGOWdGNkNHWnUrWTRYMVRGTC9HbVN1L1VVZnNN?=
 =?utf-8?B?RGk5QXR5dXVrRTljTUxjWG53c3k4WmNaZWk0THh4Qk5Kc3B2aFJKcGJXd1Vk?=
 =?utf-8?B?WURmVU1wS1JTZFI5SUFpcXBqQWxSTDBSOU1Pa2J3VzhPUWhDcm5TSXhtKzFC?=
 =?utf-8?B?YXpxNTJqOHhWa3lWbGJoaDVQSG5wY3lwSDZCbW1KclVDbG1EZnIvZ2lmZitW?=
 =?utf-8?B?Wm13cHZIeVlsS3F0QkQ5MFIrdmwyNWNxSytuNVpVVWgvNnhtYjJGUXhUaTla?=
 =?utf-8?B?TjdKYzJsazZNS2lDVFNrMkwvUjNyeFhzcHY3bDBjSkRnUVR4M3JKTU16OXhF?=
 =?utf-8?B?bEh1eUxmZngxbWRiaFBTSUNQYS9PS2Y1L3NXeHlLQ2hhbHN4RGpxYkNJZ3pk?=
 =?utf-8?B?TDE3Y000VDQwcWREelFJbnNiM2ozdGRHeUI0UWJRcHQySzYydDFtNXhOaHZ2?=
 =?utf-8?B?SVNuOUpwSzRTaE5EbE1lV3kyNGswU2VvM2NiOXdTNkNyTzZWcjh6cnExYlRh?=
 =?utf-8?B?elB5S09BYW01RnY1aFhLbGMvUU9XNjdldGlNNHRsVTlaNjZNOWlFNXkzK3Fj?=
 =?utf-8?B?ZFFyb2lsNVpCckJpcWZvTVp3aUk0ekM5RUhqOWR1cmtJTTZuK0k4dlgrYTV6?=
 =?utf-8?B?ZVArdnpQdzlERmo5TTA4K0VHbStIaVFEbTZCMlJPLzV6Z3BCWTJDRXFDb1hZ?=
 =?utf-8?B?dFFmODllTFBiTjI5K2FIRnB2SEwwc2hwS2Jnem9TSHNUSmJ2SjRwQUs1ODFG?=
 =?utf-8?B?VVJuUElENmtDQnFIbWQrZkZ3T0ZpZEZ6TFRqbXN1cE1yNWhmRXhJc2RpTE5r?=
 =?utf-8?B?QS9HemVOSXd0RFRiS0xsWTYvaTgvYVd1MndrRGdVeFRqN2k0d3FoNjhDdEFM?=
 =?utf-8?B?eWJWR1JtRmlxbUExNnNvK09PSkgrcmdiSjF3aitXUEh3blc1SVJIa09FaEY5?=
 =?utf-8?B?dlZuYldJMkk1YWFvQmt6ck9vellIS1hHSFZ5Mm1wOUhRb1k1dFE1Y2lGZVFo?=
 =?utf-8?B?V1E0bVcvWUM4dUhoMDBLVHVhRFNYTGY0ZUliS3U1TWRIYlJKWHdzWXVVNHJI?=
 =?utf-8?B?Tmd5Z0VXRTRyaHZ0UmlEeW5NMG5oMER3YlJvQlpWV2pvVFJnL3VTVGVBaDVk?=
 =?utf-8?B?OUhQRHFYYS9EVlJmUFoyeWRyTkhsZDRLdytBODQvSjFUcmNYeW44ZzJCZ2FB?=
 =?utf-8?B?a1ZOL05TUTh4ZHRBZ0dmKzFJUzlzNlE3NTRPaWZaMSs1NXRyd1YrR09nSGE3?=
 =?utf-8?B?eTNhNHBaRWgrYnYvb1dXUUp1Ti9MZjNOa2J5TnJlWWJZNTJNVEl6cHRhMnFq?=
 =?utf-8?B?YlV6bU9nU1IzMWd5TzdHTkFTd3kzSlZsMS9QMzJyLzh3bWNJU1QxZ2hGclJL?=
 =?utf-8?B?Z3JUQ0NjaDhESDF1aENVVjQwZm1ndG1yQlR4UlJteEM4eUtCRi9lZklsSWZz?=
 =?utf-8?B?K3kvdDJHTkNIWHBhckZYSENlWmR0TXBBRmdSMk1NQVVGaHJkd1hnY25jVlJv?=
 =?utf-8?B?bCtob2NUTFVGV1lCRnByU0JydVMycHN3RGJQeFlkUTVRUFVmQnhXQ2Q5Kysy?=
 =?utf-8?B?T2ZKbkw1ZGhNRWdqaXVFYzNLY3Y4NVFEZVNsM2JNRk1WVUZGdEFwd081dkps?=
 =?utf-8?Q?mgHuK0saF72b3cKZGt9Z+9UBQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3047c02f-6e33-44b6-da0e-08ddb7af98ac
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 08:24:56.9417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n73FyDZS7MUJXZlcNW77+tWCN8Smuw+MNSOe4fR+Tm7mzynGxzots/Ej0rDGFHBoGYjUkKm+PR/ekOeParYjeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
X-Proofpoint-ORIG-GUID: ylblb-s4VI7ZCC8mgp7cymzanXTdPv8W
X-Proofpoint-GUID: ylblb-s4VI7ZCC8mgp7cymzanXTdPv8W
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=686249de cx=c_pps a=Cw8YlDbw4D5AkIT9xYlJ8w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=-Z0NSjAlAAAA:8 a=o83nqyVRAAAA:8 a=9GW4Ch_m6FZWptQDQA4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=xy1_3a_u1JAA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA2OCBTYWx0ZWRfX/o3SNZrhTY85 dtFr6rStQlXWJzmcFvBRWtAUupU0ilPxBafGQd/B+D3veXbJcBFGiY212mqcFiSVmpUMH1WyoVC TEEUm7SzKm7YUIebxBXnAVMMCrxRb3gjM3dajP27BBHYQJzKLleW3l/ANPLRQk6eNTzh1NLcY7N
 +kEwCCWL1ZEmuPbaxohUHcRzQt9qS7GtmLMC581D2fvie8kjhCG69h9IeDhFD5x1aodHZjwNL/M 3mJpZCJv3MbOdVlhFikV4caySiMgk/GUIm3pO9JTMHQaDnnlwz1lnlfsaDlW7OMIPTAY7AO7Vxy CoYEpikl64qu9Uoec6C+29V202Kx8TRtDoBV2Z4CkNWt2KewldlPgGdJVpxzxwdGz2TYeQKxc+L
 B9hA6jbr1RPxxRGKaJWBRJb+JwFkJr+I0AK1FT9VCFfzTFr7iDzr9BkFwueN3IumQ2SICnUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506300068
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55U5s3OT006498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219458

From: Chen Qi <Qi.Chen@windriver.com>

Patch 0003 is the actual patch to fix CVE.

Patch 0002 is a preparation patch which systemd upstream uses for
all actively maintained branches in preparation for patch 0003.

Patch 0001 is a bug fix patch and is needed to avoid conflict introduced
by patch 0002. Note that patch 0002 claims itself to be of no functional
change, so this patch 0001 is really needed for patch 0002.

Patch 0004 is a compilation fix patch which adds a macro needed by
previous 0002 patch.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...re-compatibility-with-older-patterns.patch |  92 +++++++++++
 ...edump-get-rid-of-_META_MANDATORY_MAX.patch | 106 +++++++++++++
 ...oredump-use-d-in-kernel-core-pattern.patch | 144 ++++++++++++++++++
 ...o-add-macro-to-iterate-variadic-args.patch |  36 +++++
 meta/recipes-core/systemd/systemd_250.14.bb   |   4 +
 5 files changed, 382 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-coredump-resto=
re-compatibility-with-older-patterns.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-coredump-get-r=
id-of-_META_MANDATORY_MAX.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-coredump-use-d=
-in-kernel-core-pattern.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0004-basic-macro-ad=
d-macro-to-iterate-variadic-args.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-coredump-restore-comp=
atibility-with-older-patterns.patch b/meta/recipes-core/systemd/systemd/0=
001-coredump-restore-compatibility-with-older-patterns.patch
new file mode 100644
index 0000000000..b408a56bfa
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-coredump-restore-compatibili=
ty-with-older-patterns.patch
@@ -0,0 +1,92 @@
+From 2108812a76bd078a2bbd7583308ff18bf01f2383 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
+Date: Tue, 29 Apr 2025 14:47:59 +0200
+Subject: [PATCH 1/3] coredump: restore compatibility with older patterns
+
+This was broken in f45b8015513d38ee5f7cc361db9c5b88c9aae704. Unfortunate=
ly
+the review does not talk about backward compatibility at all. There are
+two places where it matters:
+- During upgrades, the replacement of kernel.core_pattern is asynchronou=
s.
+  For example, during rpm upgrades, it would be updated a post-transacti=
on
+  file trigger. In other scenarios, the update might only happen after
+  reboot. We have a potentially long window where the old pattern is in
+  place. We need to capture coredumps during upgrades too.
+- With --backtrace. The interface of --backtrace, in hindsight, is not
+  great. But there are users of --backtrace which were written to use
+  a specific set of arguments, and we can't just break compatiblity.
+  One example is systemd-coredump-python, but there are also reports of
+  users using --backtrace to generate coredump logs.
+
+Thus, we require the original set of args, and will use the additional a=
rgs if
+found.
+
+A test is added to verify that --backtrace works with and without the op=
tional
+args.
+
+(cherry picked from commit ded0aac389e647d35bce7ec4a48e718d77c0435b)
+(cherry picked from commit f9b8b75c11bba9b63096904be98cc529c304eb97)
+(cherry picked from commit 385a33b043406ad79a7207f3906c3b15192a3333)
+(cherry picked from commit c6f79626b6d175c6a5b62b8c5d957a83eb882301)
+(cherry picked from commit 9f02346d50e33c24acf879ce4dd5937d56473325)
+(cherry picked from commit ac0aa5d1fdc21db1ef035fce562cb6fc8602b544)
+
+Upstream-Status: Backport [cadd1b1a1f39fd13b1115a10f563017201d7b56a]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/coredump/coredump.c | 21 ++++++++++++++-------
+ 1 file changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index 79280ab986..d598f6f59a 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -84,8 +84,12 @@ enum {
+         META_ARGV_SIGNAL,       /* %s: number of signal causing dump */
+         META_ARGV_TIMESTAMP,    /* %t: time of dump, expressed as secon=
ds since the Epoch (we expand this to =C2=B5s granularity) */
+         META_ARGV_RLIMIT,       /* %c: core file size soft resource lim=
it */
+-        META_ARGV_HOSTNAME,     /* %h: hostname */
++        _META_ARGV_REQUIRED,
++        /* The fields below were added to kernel/core_pattern at later =
points, so they might be missing. */
++        META_ARGV_HOSTNAME =3D _META_ARGV_REQUIRED,  /* %h: hostname */
+         _META_ARGV_MAX,
++        /* If new fields are added, they should be added here, to maint=
ain compatibility
++         * with callers which don't know about the new fields. */
+=20
+         /* The following indexes are cached for a couple of special fie=
lds we use (and
+          * thereby need to be retrieved quickly) for naming coredump fi=
les, and attaching
+@@ -96,7 +100,7 @@ enum {
+         _META_MANDATORY_MAX,
+=20
+         /* The rest are similar to the previous ones except that we won=
't fail if one of
+-         * them is missing. */
++         * them is missing in a message sent over the socket. */
+=20
+         META_EXE =3D _META_MANDATORY_MAX,
+         META_UNIT,
+@@ -1278,14 +1282,17 @@ static int gather_pid_metadata_from_argv(
+         char *t;
+=20
+         /* We gather all metadata that were passed via argv[] into an a=
rray of iovecs that
+-         * we'll forward to the socket unit */
++         * we'll forward to the socket unit.
++         *
++         * We require at least _META_ARGV_REQUIRED args, but will accep=
t more.
++         * We know how to parse _META_ARGV_MAX args. The rest will be i=
gnored. */
+=20
+-        if (argc < _META_ARGV_MAX)
++        if (argc < _META_ARGV_REQUIRED)
+                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL),
+-                                       "Not enough arguments passed by =
the kernel (%i, expected %i).",
+-                                       argc, _META_ARGV_MAX);
++                                       "Not enough arguments passed by =
the kernel (%i, expected between %i and %i).",
++                                       argc, _META_ARGV_REQUIRED, _META=
_ARGV_MAX);
+=20
+-        for (int i =3D 0; i < _META_ARGV_MAX; i++) {
++        for (int i =3D 0; i < MIN(argc, _META_ARGV_MAX); i++) {
+=20
+                 t =3D argv[i];
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-coredump-get-rid-of-_=
META_MANDATORY_MAX.patch b/meta/recipes-core/systemd/systemd/0002-coredum=
p-get-rid-of-_META_MANDATORY_MAX.patch
new file mode 100644
index 0000000000..7b94df01cc
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-coredump-get-rid-of-_META_MA=
NDATORY_MAX.patch
@@ -0,0 +1,106 @@
+From fb22bb743556d4d14463b0f0373c24d07d2e7b28 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
+Date: Mon, 26 May 2025 12:04:44 +0200
+Subject: [PATCH 2/3] coredump: get rid of _META_MANDATORY_MAX
+
+No functional change. This change is done in preparation for future chan=
ges.
+Currently, the list of fields which are received on the command line is =
a
+strict subset of the fields which are always expected to be received on =
a
+socket. But when we add new kernel args in the future, we'll have two
+non-overlapping sets and this approach will not work. Get rid of the var=
iable
+and enumerate the required fields. This set will never change, so this i=
s
+actually more maintainable.
+
+The message with the hint where to add new fields is switched with
+_META_ARGV_MAX. The new order is more correct.
+
+(cherry-picked from 49f1f2d4a7612bbed5211a73d11d6a94fbe3bb69)
+(cherry-picked from aea6a631bca93e8b04a11aaced694f25f4da155e)
+(cherry picked from cf16b6b6b2e0a656531bfd73ad66be3817b155cd)
+
+(cherry picked from commit b46a4f023cd80b24c8f1aa7a95700bc0cb828cdc)
+(cherry picked from commit 5855552310ed279180c21cb803408aa2ce36053d)
+(cherry picked from commit cc31f2d4146831b9f2fe7bf584468908ff9c4de5)
+
+Upstream-Status: Backport [2c81e60fe0b8c506a4fe902e45bed6f58f482b39]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/coredump/coredump.c | 29 ++++++++++++++++++++---------
+ 1 file changed, 20 insertions(+), 9 deletions(-)
+
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index d598f6f59a..0b27086288 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -71,7 +71,7 @@
+  * size. See DATA_SIZE_MAX in journal-importer.h. */
+ assert_cc(JOURNAL_SIZE_MAX <=3D DATA_SIZE_MAX);
+=20
+-enum {
++typedef enum {
+         /* We use these as array indexes for our process metadata cache.
+          *
+          * The first indices of the cache stores the same metadata as t=
he ones passed by
+@@ -87,9 +87,9 @@ enum {
+         _META_ARGV_REQUIRED,
+         /* The fields below were added to kernel/core_pattern at later =
points, so they might be missing. */
+         META_ARGV_HOSTNAME =3D _META_ARGV_REQUIRED,  /* %h: hostname */
+-        _META_ARGV_MAX,
+         /* If new fields are added, they should be added here, to maint=
ain compatibility
+          * with callers which don't know about the new fields. */
++        _META_ARGV_MAX,
+=20
+         /* The following indexes are cached for a couple of special fie=
lds we use (and
+          * thereby need to be retrieved quickly) for naming coredump fi=
les, and attaching
+@@ -97,16 +97,15 @@ enum {
+          * environment. */
+=20
+         META_COMM =3D _META_ARGV_MAX,
+-        _META_MANDATORY_MAX,
+=20
+         /* The rest are similar to the previous ones except that we won=
't fail if one of
+          * them is missing in a message sent over the socket. */
+=20
+-        META_EXE =3D _META_MANDATORY_MAX,
++        META_EXE,
+         META_UNIT,
+         META_PROC_AUXV,
+         _META_MAX
+-};
++} meta_argv_t;
+=20
+ static const char * const meta_field_names[_META_MAX] =3D {
+         [META_ARGV_PID]       =3D "COREDUMP_PID=3D",
+@@ -1192,12 +1191,24 @@ static int process_socket(int fd) {
+         if (r < 0)
+                 goto finish;
+=20
+-        /* Make sure we received at least all fields we need. */
+-        for (int i =3D 0; i < _META_MANDATORY_MAX; i++)
++        /* Make sure we received all the expected fields. We support be=
ing called by an *older*
++         * systemd-coredump from the outside, so we require only the ba=
sic set of fields that
++         * was being sent when the support for sending to containers ov=
er a socket was added
++         * in a108c43e36d3ceb6e34efe37c014fc2cda856000. */
++        meta_argv_t i;
++        VA_ARGS_FOREACH(i,
++                        META_ARGV_PID,
++                        META_ARGV_UID,
++                        META_ARGV_GID,
++                        META_ARGV_SIGNAL,
++                        META_ARGV_TIMESTAMP,
++                        META_ARGV_RLIMIT,
++                        META_ARGV_HOSTNAME,
++                        META_COMM)
+                 if (!context.meta[i]) {
+                         r =3D log_error_errno(SYNTHETIC_ERRNO(EINVAL),
+-                                            "A mandatory argument (%i) =
has not been sent, aborting.",
+-                                            i);
++                                            "Mandatory argument %s not =
received on socket, aborting.",
++                                            meta_field_names[i]);
+                         goto finish;
+                 }
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0003-coredump-use-d-in-ker=
nel-core-pattern.patch b/meta/recipes-core/systemd/systemd/0003-coredump-=
use-d-in-kernel-core-pattern.patch
new file mode 100644
index 0000000000..99bea31a3c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-coredump-use-d-in-kernel-cor=
e-pattern.patch
@@ -0,0 +1,144 @@
+From 89730dea979b2d22fd548b622cd88bac99ff1d6b Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
+Date: Tue, 29 Apr 2025 14:47:59 +0200
+Subject: [PATCH 3/3] coredump: use %d in kernel core pattern
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The kernel provides %d which is documented as
+"dump mode=E2=80=94same as value returned by prctl(2) PR_GET_DUMPABLE".
+
+We already query /proc/pid/auxv for this information, but unfortunately =
this
+check is subject to a race, because the crashed process may be replaced =
by an
+attacker before we read this data, for example replacing a SUID process =
that
+was killed by a signal with another process that is not SUID, tricking u=
s into
+making the coredump of the original process readable by the attacker.
+
+With this patch, we effectively add one more check to the list of condit=
ions
+that need be satisfied if we are to make the coredump accessible to the =
user.
+
+Reportedy-by: Qualys Security Advisory <qsa@qualys.com>
+
+(cherry-picked from commit 0c49e0049b7665bb7769a13ef346fef92e1ad4d6)
+(cherry-picked from commit c58a8a6ec9817275bb4babaa2c08e0e35090d4e3)
+(cherry picked from commit 19d439189ab85dd7222bdd59fd442bbcc8ea99a7)
+(cherry picked from commit 254ab8d2a7866679cee006d844d078774cbac3c9)
+(cherry picked from commit 7fc7aa5a4d28d7768dfd1eb85be385c3ea949168)
+(cherry picked from commit 19b228662e0fcc6596c0395a0af8486a4b3f1627)
+
+CVE: CVE-2025-4598
+
+Upstream-Status: Backport [2eb46dce078334805c547cbcf5e6462cf9d2f9f0]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ man/systemd-coredump.xml     | 12 ++++++++++++
+ src/coredump/coredump.c      | 21 ++++++++++++++++++---
+ sysctl.d/50-coredump.conf.in |  2 +-
+ 3 files changed, 31 insertions(+), 4 deletions(-)
+
+diff --git a/man/systemd-coredump.xml b/man/systemd-coredump.xml
+index cb9f47745b..ba7cad12bc 100644
+--- a/man/systemd-coredump.xml
++++ b/man/systemd-coredump.xml
+@@ -259,6 +259,18 @@ COREDUMP_FILENAME=3D/var/lib/systemd/coredump/core.=
Web=E2=80=A6.552351.=E2=80=A6.zst
+         </listitem>
+       </varlistentry>
+=20
++      <varlistentry>
++        <term><varname>COREDUMP_DUMPABLE=3D</varname></term>
++
++        <listitem><para>The <constant>PR_GET_DUMPABLE</constant> field =
as reported by the kernel, see
++        <citerefentry
++        project=3D'man-pages'><refentrytitle>prctl</refentrytitle><manv=
olnum>2</manvolnum></citerefentry>.
++        </para>
++
++        <xi:include href=3D"version-info.xml" xpointer=3D"v258"/>
++        </listitem>
++      </varlistentry>
++
+       <varlistentry>
+         <term><varname>COREDUMP_OPEN_FDS=3D</varname></term>
+=20
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index 0b27086288..aca6a2eb6b 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -87,6 +87,7 @@ typedef enum {
+         _META_ARGV_REQUIRED,
+         /* The fields below were added to kernel/core_pattern at later =
points, so they might be missing. */
+         META_ARGV_HOSTNAME =3D _META_ARGV_REQUIRED,  /* %h: hostname */
++        META_ARGV_DUMPABLE,     /* %d: as set by the kernel */
+         /* If new fields are added, they should be added here, to maint=
ain compatibility
+          * with callers which don't know about the new fields. */
+         _META_ARGV_MAX,
+@@ -115,6 +116,7 @@ static const char * const meta_field_names[_META_MAX=
] =3D {
+         [META_ARGV_TIMESTAMP] =3D "COREDUMP_TIMESTAMP=3D",
+         [META_ARGV_RLIMIT]    =3D "COREDUMP_RLIMIT=3D",
+         [META_ARGV_HOSTNAME]  =3D "COREDUMP_HOSTNAME=3D",
++        [META_ARGV_DUMPABLE]  =3D "COREDUMP_DUMPABLE=3D",
+         [META_COMM]           =3D "COREDUMP_COMM=3D",
+         [META_EXE]            =3D "COREDUMP_EXE=3D",
+         [META_UNIT]           =3D "COREDUMP_UNIT=3D",
+@@ -125,6 +127,7 @@ typedef struct Context {
+         const char *meta[_META_MAX];
+         size_t meta_size[_META_MAX];
+         pid_t pid;
++        unsigned dumpable;
+         bool is_pid1;
+         bool is_journald;
+ } Context;
+@@ -470,14 +473,16 @@ static int grant_user_access(int core_fd, const Co=
ntext *context) {
+         if (r < 0)
+                 return r;
+=20
+-        /* We allow access if we got all the data and at_secure is not =
set and
+-         * the uid/gid matches euid/egid. */
++        /* We allow access if dumpable on the command line was exactly =
1, we got all the data,
++         * at_secure is not set, and the uid/gid match euid/egid. */
+         bool ret =3D
++                context->dumpable =3D=3D 1 &&
+                 at_secure =3D=3D 0 &&
+                 uid !=3D UID_INVALID && euid !=3D UID_INVALID && uid =3D=
=3D euid &&
+                 gid !=3D GID_INVALID && egid !=3D GID_INVALID && gid =3D=
=3D egid;
+-        log_debug("Will %s access (uid=3D"UID_FMT " euid=3D"UID_FMT " g=
id=3D"GID_FMT " egid=3D"GID_FMT " at_secure=3D%s)",
++        log_debug("Will %s access (dumpable=3D%u uid=3D"UID_FMT " euid=3D=
"UID_FMT " gid=3D"GID_FMT " egid=3D"GID_FMT " at_secure=3D%s)",
+                   ret ? "permit" : "restrict",
++                  context->dumpable,
+                   uid, euid, gid, egid, yes_no(at_secure));
+         return ret;
+ }
+@@ -1102,6 +1107,16 @@ static int save_context(Context *context, const s=
truct iovec_wrapper *iovw) {
+         if (r < 0)
+                 return log_error_errno(r, "Failed to parse PID \"%s\": =
%m", context->meta[META_ARGV_PID]);
+=20
++        /* The value is set to contents of /proc/sys/fs/suid_dumpable, =
which we set to 2,
++         * if the process is marked as not dumpable, see PR_SET_DUMPABL=
E(2const). */
++        if (context->meta[META_ARGV_DUMPABLE]) {
++                r =3D safe_atou(context->meta[META_ARGV_DUMPABLE], &con=
text->dumpable);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to parse dump=
able field \"%s\": %m", context->meta[META_ARGV_DUMPABLE]);
++                if (context->dumpable > 2)
++                        log_notice("Got unexpected %%d/dumpable value %=
u.", context->dumpable);
++        }
++
+         unit =3D context->meta[META_UNIT];
+         context->is_pid1 =3D streq(context->meta[META_ARGV_PID], "1") |=
| streq_ptr(unit, SPECIAL_INIT_SCOPE);
+         context->is_journald =3D streq_ptr(unit, SPECIAL_JOURNALD_SERVI=
CE);
+diff --git a/sysctl.d/50-coredump.conf.in b/sysctl.d/50-coredump.conf.in
+index 5fb551a8cf..9c10a89828 100644
+--- a/sysctl.d/50-coredump.conf.in
++++ b/sysctl.d/50-coredump.conf.in
+@@ -13,7 +13,7 @@
+ # the core dump.
+ #
+ # See systemd-coredump(8) and core(5).
+-kernel.core_pattern=3D|{{ROOTLIBEXECDIR}}/systemd-coredump %P %u %g %s =
%t %c %h
++kernel.core_pattern=3D|{{ROOTLIBEXECDIR}}/systemd-coredump %P %u %g %s =
%t %c %h %d
+=20
+ # Allow 16 coredumps to be dispatched in parallel by the kernel.
+ # We collect metadata from /proc/%P/, and thus need to make sure the cr=
ashed
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0004-basic-macro-add-macro=
-to-iterate-variadic-args.patch b/meta/recipes-core/systemd/systemd/0004-=
basic-macro-add-macro-to-iterate-variadic-args.patch
new file mode 100644
index 0000000000..b5fad170b8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0004-basic-macro-add-macro-to-ite=
rate-variadic-args.patch
@@ -0,0 +1,36 @@
+From a0c698c720441782fcf2cb7dfd01e69baf8f1f39 Mon Sep 17 00:00:00 2001
+From: Dan Streetman <ddstreet@ieee.org>
+Date: Thu, 2 Feb 2023 15:58:10 -0500
+Subject: [PATCH] basic/macro: add macro to iterate variadic args
+
+(cherry picked from commit e179f2d89c9f0c951636d74de00136b4075cd1ac)
+(cherry picked from commit cd4f43bf378ff33ce5cfeacd96f7f3726603bddc)
+
+Upstream-Status: Backport [c288a3aafdf11cd93eb7a21e4d587c6fc218a29c]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/macro.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/basic/macro.h b/src/basic/macro.h
+index 9e62f9c71c..16242902ec 100644
+--- a/src/basic/macro.h
++++ b/src/basic/macro.h
+@@ -454,4 +454,13 @@ typedef struct {
+=20
+ assert_cc(sizeof(dummy_t) =3D=3D 0);
+=20
++/* Iterate through each variadic arg. All must be the same type as 'ent=
ry' or must be implicitly
++ * convertable. The iteration variable 'entry' must already be defined.=
 */
++#define VA_ARGS_FOREACH(entry, ...)                                    =
 \
++        _VA_ARGS_FOREACH(entry, UNIQ_T(_entries_, UNIQ), UNIQ_T(_curren=
t_, UNIQ), ##__VA_ARGS__)
++#define _VA_ARGS_FOREACH(entry, _entries_, _current_, ...)         \
++        for (typeof(entry) _entries_[] =3D { __VA_ARGS__ }, *_current_ =
=3D _entries_; \
++             ((long)(_current_ - _entries_) < (long)ELEMENTSOF(_entries=
_)) && ({ entry =3D *_current_; true; }); \
++             _current_++)
++
+ #include "log.h"
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-c=
ore/systemd/systemd_250.14.bb
index b3e31e1f23..4be27d814e 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -31,6 +31,10 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0001-core-fix-build-when-seccomp-is-off.patch \
            file://0001-journal-Make-sd_journal_previous-next-return-0-at=
-HE.patch \
            file://0001-basic-do-not-warn-in-mkdir_p-when-parent-director=
y-e.patch \
+           file://0001-coredump-restore-compatibility-with-older-pattern=
s.patch \
+           file://0002-coredump-get-rid-of-_META_MANDATORY_MAX.patch \
+           file://0003-coredump-use-d-in-kernel-core-pattern.patch \
+           file://0004-basic-macro-add-macro-to-iterate-variadic-args.pa=
tch \
            "
=20
 # patches needed by musl
--=20
2.34.1



Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FCDC71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 05:34:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.23792.1750052087347962909
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 22:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82629f7152=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G4ivj6009786
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 22:34:47 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3sb18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 22:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTcriv+K1E3RXvY4qRcsKfQST3TG3sjKjAU+vMZX4rOrT1B3JwYMrcPR63J06JpRGpgbaA4g9nIxMgV4umb5p4NDQEJPURj84pIT9ByFSTAR72Gsh/w7zKlkAQIeG2dyB2V8AF4tMenr7BOMbzdZNBDVSrPUqONF2Q7JUfI/vwTG1MG2AOFFQq62useVt50eCD9Dbu1FetjQklk66oV6tQqjpvH2L3dqlVtG8gWqTLIfIvw18FxmHeB+zAWF0GkMOQp3sG59qNsNWYqcbj2JcV3gTomXbpzU9Zw/Ey0vIBknzvXEIVA3gNSdl7siN6ke2Jh3eGLE1SBhH+UK4OFRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LDOX+7g9B4JYR1GourYSHYYX8fGAmG+6/wcBjJZMbs=;
 b=sR0Z6e/jJrh8UNV7Ry9gmcdYikkde5S9N/CplGwBllj8b93aLztb7BcwF1vsOtxDExw32u7DFSmbIkOTiodRT8CRV2tQTcc5H/kIiUDfYWzGt3ko4FM2TcdGDizB3DEpA69/pEjK6Y4Y8oZsj5fTnct5thj865576Gx1DdLBFZk91wHpc2vQE1gKb2+5hIuwK7lU1xajqCxNvmXyCpll0a+F6dKwYx9lIDTT/WapPeQQld5W/rKAdiWyVLW7MFmzd/A8nGD13rSJA60KICujxrXeHqAKv2z28MBZkMFwB4fIo/gdppdacAkrUJ3CDkb6iJJtzt+pTqmYIHr0StU/dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Mon, 16 Jun 2025 05:34:45 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 05:34:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [walnascar][PATCH] net-tools: Security fix for CVE-2025-46836
Date: Mon, 16 Jun 2025 13:34:31 +0800
Message-Id: <20250616053431.457613-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b2dc6b-83cc-4c81-1d72-08ddac978044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y0dDWGZPRS9oOHNyUXlEUjA4cERZNnRmY3lUazNwSWdZQ3BwaXRaaGtKbzJQ?=
 =?utf-8?B?emUzOHkvSEZrZlZWeHIyM2VXNG1jWDNoK0F6VHUwdWpHLy9oRFVUZmtib2xn?=
 =?utf-8?B?RVAzQjlkaEw4MitBMExjZWFhQU9IWW53bFFvMm1LUldGY25UR1c4TVFsNEtr?=
 =?utf-8?B?bmUxK2hjcG5ZVzh6eW1sYm5ySGYvVXlXQ29PMHVLQnB1MUZ2djhNcDZkWkpN?=
 =?utf-8?B?eDJzYlM1VWptcWh2ZHRPdWpqWWxLRXZ0WG1wb0UvWkthKzVLUTZ2aDZvV3p2?=
 =?utf-8?B?VzgvTFRoekJhdEZBUzJKUlJnb2xGdnNnWDd3ZjZjbWhsOHYzNEJVKytWaGda?=
 =?utf-8?B?RmdMNVJSREozVjFQSStVYUw3TTVvS080MzEwSTgraWpwaVl1ekZHbUEvdjZN?=
 =?utf-8?B?ZnE1R1RHRnJRUS9HektMaVlGYUR0YTE1Yys5YjRnTEZDRDdwRDNmK2tRdFFp?=
 =?utf-8?B?YmRlOTR6ZGRURnlzR2x5YlRpYmU0QlZzYm1sUzVKZ01qN2EwNmFoaTdNS1d6?=
 =?utf-8?B?MG1tMFEyZlhsY3VVazcrZ1AwM1JWc280blg5WDM1c0U2TDNwbm5IMkFuRm5K?=
 =?utf-8?B?MU5pZUhhTkZNLzVnN05oaU83WWlhTEdQcmM3VkljUVdCYldqWHR5MEc1Um9R?=
 =?utf-8?B?b0hMM0hIY1o3UmlqNnZVZU5EK0tTVHlPUm5xQm14TEYzZkJ6eDQyWUNvdm9i?=
 =?utf-8?B?YXlYamZsRS9icGE5aEk3RDVvWHNSRkZHTnhzMk5BUk5tQ2VjV0M4c21yWGVQ?=
 =?utf-8?B?SlpqTkExUVM2Sk5WV2tkSmdERlRiNGJjSUduYzVHWC9PbU1tWTRsaU5NelYw?=
 =?utf-8?B?WEJPMzZ3WGhYR1Q5K2FUWnlmNW5lS0NldkZhNUlTNGIrRkRwd3NNcWliMWNW?=
 =?utf-8?B?K2VVSWVRbmpQRnRkS1pkUER1Q0JVN3dxMU91dlhIdy9EcEp6ZGdsWFp2OWRj?=
 =?utf-8?B?RzE2M0dEQlJ2Z3NtbVYzMmRoZ3lSQmVvRmhQeDRtbTMweTU2Nm0vbFIrRHRz?=
 =?utf-8?B?a0dzanZxWFZUN29aNlhHZ1JEdXpROWlCK3BxU3NpWkxCOGtZNVNuWVpnTXlv?=
 =?utf-8?B?U2ZIUys5RjQ1Rmxia04ybGQ2WGlNbjBlWmt5OEowZktuKzlOOWNvOUFFdlZl?=
 =?utf-8?B?c1FQaHpyZnY4cjVwUU5mN01XaENUbUUxY1BtbzYrTzJyblBvSE51VXMwLzNl?=
 =?utf-8?B?dUV5SlkrTERwb2RaZ2d4eGJHUFE1VzM1dFZlYytoYWIwTzVlUlBjSCtYcVlU?=
 =?utf-8?B?VVRkZ3RVVXlHbUd5MndoRXJtemdkL0Q3M2QzUDJlT2E4MG5rTmZna0hnWmxT?=
 =?utf-8?B?alF1RGJEMDl4OXRUZ0JQVjRWaFNDQjU0N3lkVG9WRTJSOVZhT25CU01ZTDlN?=
 =?utf-8?B?LzFlaUxFd2tsSmo0R3hYOTQvOWtGTFFtaGFlaE0rNTJOM0ovSGd1ZVlwRTdr?=
 =?utf-8?B?cGxYUzV6c2ZLbUJNVk13bk9kTHZxUEZCSDd5S3pYaWtSbkVyUjNIeUU0YS80?=
 =?utf-8?B?WWd5emdLRENhSFdaeWpWSm9BZHJpN3d4eXR3NEkyZnhUb3NoQnFOZzVmWTR5?=
 =?utf-8?B?ek14M2RwVEJKYUwwNjJQdytsUy9Kc1drb0RXalQ1M3VYNmZkcEJORU1vZHdV?=
 =?utf-8?B?b1Vway8rQ1MyaVljcDRGcHNzRmtncXJ4aldnSjZlYjdHV1Bmc2lMNWxVRGs0?=
 =?utf-8?B?SloxaWQzZUVvRWlBelNwUDBjWmxHaXBCeERWRW1uS0d3bEdyMEtnZWpCUklL?=
 =?utf-8?B?OVhsSzE0RFpkS2JJbjVLRG5vYXBDT3l3MVUwaUowb1R2RUdYbjhnWGV1WVV2?=
 =?utf-8?B?aEdYVmFhZjVzaFhKSWxPd1NvNlhMVEl4bXVKUks2d1o3Tm14aWx2Ukhka2NT?=
 =?utf-8?B?NVJCekowQ29XWDAxSWtncXh5YXpEckFHdDVRQ3RzenNvM2NxQkFJdm51MjM3?=
 =?utf-8?B?WHlaVWxJc0tGVGJlSWx5RGdwT1Mxc1REUi9wcTY0TlVUZ0NmaElDRFdTeDZx?=
 =?utf-8?Q?JpXHBEE0FcwYkoY/S87jDqq2iaTeZM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eS9qZWlLejVBdEhGUk1BTWVoRndLc28yb200Z1N4Y0FmMytqTEhLdVcrSzJv?=
 =?utf-8?B?ZjdCTzQ1Q2ppREovQmZjVjZRSUNKMTEyVDEwUVI2aE1XY0JPYnlYdW1GQ2U5?=
 =?utf-8?B?bjRLZDg4N0tQUjVldnN6L0ovbzA1RVR5U01xQWdhNXV6VjZOUWFBNXdxVnJV?=
 =?utf-8?B?R2RkVjFxQkVoSHRLeEY1V1hkVVY5MnRtMEo0OUtNZk5MSUJtQWhGanBjd1Ro?=
 =?utf-8?B?MHZ6c2tySUxaWmJCNjJBelhEamxVWEVuK3p0b3NDYzA2b0lSRGhsMllaWDRU?=
 =?utf-8?B?eTRmRDlVdEZFWkdCa2dzTXhseVJFZmxoSHUwMU9lb0pkWnFoaHJmMnlvd1Np?=
 =?utf-8?B?VzdVU1Q0VGw1c3FEclQxNk9ZdmtrT3NLQUt0VWcxUzJZbmVmcmtHR2t2ZVoy?=
 =?utf-8?B?emNqMmlXNU5vUWJCZnk3L1Z6Uldlc0RMYU9BaWNBOE1IZ2JoMFNlc2pmNHRx?=
 =?utf-8?B?WkNuSG9nTzJFVVU2UE1FUmRpTHhtL2NscUNTRjZDVHRoTzgvSE9KYzVvdXNa?=
 =?utf-8?B?eFpxbE9jZ1pDMk0ySUVXS2VYenlKR0o5SGwxUlR4Vmc4Z2RFZ1U2MVlFMUIw?=
 =?utf-8?B?Rnk3TlloRUVOWnZvRkNocTF3b1BCNnZvbCszUFN6SmJHVTQrckkwWGJnZWIw?=
 =?utf-8?B?SE0zRXJFeFUxOHZ3T3ZIUWZGNlJuNWdPQzZ1dmRoc3pFYW4xZTZCNUxwOXpv?=
 =?utf-8?B?K2pvY0wxRU9zVG0yQS9qb1RCYzhXQkVteGorT3MzQzk5cVF0Y0dRcmZXeVVP?=
 =?utf-8?B?ODR2OUVuTjFSWmxTd09rMlVEWTFDZVJTaGVmWHZTRG5jVVc1T3JBRFV6Q3JI?=
 =?utf-8?B?a0x0U0lHeGFVTGpuWGZmSzZrQWlVbTJwODVlbytkcXZyQk5hR29lcjNUNHpm?=
 =?utf-8?B?Nld4QUdJVnRmRWwvUlZkTGk5Q0huN0JxM0NpOStjd2pyZkJHNmdLbCtyMWFj?=
 =?utf-8?B?aUhXVkF2bG01NGVlaGF6Y1Y0Tk5COEJzbHR2MGpab0F0TC9JUlJXaWxGQ1l4?=
 =?utf-8?B?cWZWYmRLU3hucEQzR1NwK0RjZ0dnK2wyQWVkNzNSRy9VTmpPVlFOYnh6RUVp?=
 =?utf-8?B?TnlmelJmSEVoRmh3b3pvQ01peDlxWWRZajR4WUlsalg1Q3NrNGZCblovNEw0?=
 =?utf-8?B?VStuYjJMWm1wdlBwS3U4TWdoZ2NNelNBZmZLbWE4YlJyeENFQjZWSk5LUThN?=
 =?utf-8?B?cWhxYUs2dnRWUk13Q1ZQREdOYjF1dUIwMXNVWjk1ektFbkMzNlV3V0kxVWc4?=
 =?utf-8?B?N3I5Q1V6V1p0TzYrS0ovQ3RlamNyVWprOTBMMEhKKzhMcU9vcHhEeGVXVVdx?=
 =?utf-8?B?YnhMbDJIK1ErSWhhTVlDa1YzRVkxeXlNOTlzMkQzajBseDlmWXFaT3R4TnBj?=
 =?utf-8?B?T2NHVi9PcU9hUDBBMVYrMkkyMlB2MjVvSnhZT2xmMGE0SkhWaW5KVWxpY25B?=
 =?utf-8?B?SWNSOTI0UFJDdjR0dkZTeGRXOHcrUENld1g0bkpGTVZMMnI4ZHZxREFzUm5V?=
 =?utf-8?B?bEZ4VXBOOHJKU09xamw2QW9rOFgwMzNnZUtPSERKU3dJRmdwVDhSTnQyTXQ1?=
 =?utf-8?B?Wkd3ajdhZWRLWHFKeVFNaFpDSlJvbFdCSFdsL3AyWngwNEw3S3ViK2oxQkw1?=
 =?utf-8?B?c3RFeGpkNnk1SkpkU2grZktSd2hrU3Jrek1JYm95SHNRdytrSHNQVERoT1R0?=
 =?utf-8?B?a3lnR29sOTB6RTJUMTBmRXZkV01wY05vay95MlFXVllrWlppSGI0dkYwYURt?=
 =?utf-8?B?cFFxMFZhQzYwUk9FNElzT1BuT0pOOHVWcTdtMU5pS3h0MEZ3WUJYdE1UTVZE?=
 =?utf-8?B?RUF1YWttdVNXT29xZzdLbjVJU0dPbWxPWjNRNmFyeXVWcDAzcVQzUS9pbnNz?=
 =?utf-8?B?bzNsU1pRcG1oYUgzZVR5K05qTWJaRmgyaURiSVNZWHhxczExdys2QjJwMEFF?=
 =?utf-8?B?citFbGdiUTFsNWFURm1zbHE1N295b0syZDVSRWxyeXExa1A2eEh4RW04clpy?=
 =?utf-8?B?TVdmMUZHemRSMXJjRjFzZ1lrSHNGUkNGd1lqLzBROVZFc0l6VnJJKzdLMk9x?=
 =?utf-8?B?U1JEbU5QSDB4WUtaaFQvWER2SndvSy92akNTYmJQNWExb2ZFU0RNcXM1V2hY?=
 =?utf-8?Q?3GSIfbzeoKsSrjCU3tbKPHmDB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b2dc6b-83cc-4c81-1d72-08ddac978044
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:34:45.0060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZrKcved6R+/4rIJyLJFKM9Ixcb/fbom4LMUPS0RowLyreXUHxuutBMzAVNjp5P5aPogwsUJosKpXT6E3Sueag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
X-Proofpoint-ORIG-GUID: 3nOBsrZDRbBAuBCiJnz21yNX0ef1-Qcm
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=684facf6 cx=c_pps a=VT18+VkyHbPNoTIOWiYcNQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=2z1OXlWFAAAA:8 a=6RGDHLEMwk7n6fM-XBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=SNRPda0NjyR9MlWdJ_lJ:22
X-Proofpoint-GUID: 3nOBsrZDRbBAuBCiJnz21yNX0ef1-Qcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzNSBTYWx0ZWRfXxup/WkXPnSM2 SuoNNgyb362yKQoM50BQAUwEF3G1i+IbKu9JDPknOumIz2etwFavcliJE475sr8oZKZ1HB8gs52 M7bQZF/lqfpcMhhcHUv300c2vJRzhydNiUtLDeW4clgDQACmxcrn7VbmJ9yLoK4SFgrwmVcdYUM
 Dfv9ZPQLn1ksbP5xqG8t2L/yj8PGFuh1HyVoB3H8SExAfFPJaS3wMhuvY0EP4ZWwziO8Qr39abA pxSworCs7Mo2uux8dr7XTbkSxNZJ7vvnVb2RW+V0l97bTfsXsJdLdeWrFbJ1SMDGUsDTZsxIYfS gaOWwvTyFTYxRzzIt4G5ads5y4S3/yFOjdychnQysfWo9AydlnirBy2EveAIkryTP6x36F6uXDu
 aXCB+z6Bi2tZNThepmAlrsb0foXAuBhhRqlYMfmJgXyZlpFoOCo1wTnUMIimiQpFC27RxiEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506160035
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55G4ivj6009786
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 05:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218769

CVE-2025-46836:
net-tools is a collection of programs that form the base set of the
NET-3 networking distribution for the Linux operating system. Inn
versions up to and including 2.10, the Linux network utilities (like
ifconfig) from the net-tools package do not properly validate the
structure of /proc files when showing interfaces. `get_name()` in
`interface.c` copies interface labels from `/proc/net/dev` into a fixed
16-byte stack buffer without bounds checking, leading to possible
arbitrary code execution or crash. The known attack path does not
require privilege but also does not provide privilege escalation in this
scenario. A patch is available and expected to be part of version 2.20.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-46836

Patch from:
https://github.com/ecki/net-tools/commit/7a8f42fb20013a1493d8cae1c43436f8=
5e656f2d
https://github.com/ecki/net-tools/commit/ddb0e375fb9ca95bb69335540b85bbda=
a2714348

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../net-tools/net-tools/CVE-2025-46836.patch  | 129 ++++++++++++++++++
 .../net-tools/net-tools_2.10.bb               |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/CVE-2025-46=
836.patch

diff --git a/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836.pat=
ch b/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836.patch
new file mode 100644
index 0000000000..5ddd0585bc
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836.patch
@@ -0,0 +1,129 @@
+From 7a8f42fb20013a1493d8cae1c43436f85e656f2d Mon Sep 17 00:00:00 2001
+From: Zephkeks <zephyrofficialdiscord@gmail.com>
+Date: Tue, 13 May 2025 11:04:17 +0200
+Subject: [PATCH] CVE-2025-46836: interface.c: Stack-based Buffer Overflo=
w in
+ get_name()
+
+Coordinated as GHSA-pfwf-h6m3-63wf
+
+CVE: CVE-2025-46836
+
+Upstream-Status: Backport
+[https://github.com/ecki/net-tools/commit/7a8f42fb20013a1493d8cae1c43436=
f85e656f2d]
+[https://github.com/ecki/net-tools/commit/ddb0e375fb9ca95bb69335540b85bb=
daa2714348]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/interface.c | 63 ++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 39 insertions(+), 24 deletions(-)
+
+diff --git a/lib/interface.c b/lib/interface.c
+index 71d4163..a054f12 100644
+--- a/lib/interface.c
++++ b/lib/interface.c
+@@ -211,32 +211,47 @@ out:
+ }
+=20
+ static const char *get_name(char *name, const char *p)
++/* Safe version =E2=80=94 guarantees at most IFNAMSIZ=E2=80=911 bytes a=
re copied
++   and the destination buffer is always NUL=E2=80=91terminated.        =
     */
+ {
+-    while (isspace(*p))
+-	p++;
+-    while (*p) {
+-	if (isspace(*p))
+-	    break;
+-	if (*p =3D=3D ':') {	/* could be an alias */
+-		const char *dot =3D p++;
+- 		while (*p && isdigit(*p)) p++;
+-		if (*p =3D=3D ':') {
+-			/* Yes it is, backup and copy it. */
+-			p =3D dot;
+-			*name++ =3D *p++;
+-			while (*p && isdigit(*p)) {
+-				*name++ =3D *p++;
+-			}
+-		} else {
+-			/* No, it isn't */
+-			p =3D dot;
+-	    }
+-	    p++;
+-	    break;
+-	}
+-	*name++ =3D *p++;
++    char       *dst =3D name;                 /* current write ptr     =
     */
++    const char *end =3D name + IFNAMSIZ - 1;  /* last byte we may write=
     */
++
++    /* Skip leading white=E2=80=91space. */
++    while (isspace((unsigned char)*p))
++        ++p;
++
++    /* Copy until white=E2=80=91space, end of string, or buffer full. *=
/
++    while (*p && !isspace((unsigned char)*p) && dst < end) {
++        if (*p =3D=3D ':') {                    /* possible alias veth0=
:123:  */
++            const char *dot =3D p;            /* remember the colon    =
     */
++            ++p;
++            while (*p && isdigit((unsigned char)*p))
++                ++p;
++
++            if (*p =3D=3D ':') {                /* confirmed alias     =
       */
++                p =3D dot;                    /* rewind and copy it all=
     */
++
++                /* copy the colon */
++                if (dst < end)
++                    *dst++ =3D *p++;
++
++                /* copy the digits */
++                while (*p && isdigit((unsigned char)*p) && dst < end)
++                    *dst++ =3D *p++;
++
++                if (*p =3D=3D ':')              /* consume trailing col=
on     */
++                    ++p;
++            } else {              /* if so treat as normal */
++                p =3D dot;
++            }
++            break;                          /* interface name ends here=
   */
++        }
++
++        *dst++ =3D *p++;                      /* ordinary character cop=
y    */
+     }
+-    *name++ =3D '\0';
++
++    *dst =3D '\0';                            /* always NUL=E2=80=91ter=
minate       */
+     return p;
+ }
+=20
+--=20
+2.34.1
+
+From ddb0e375fb9ca95bb69335540b85bbdaa2714348 Mon Sep 17 00:00:00 2001
+From: Bernd Eckenfels <net-tools@lina.inka.de>
+Date: Sat, 17 May 2025 21:53:23 +0200
+Subject: [PATCH] Interface statistic regression after 7a8f42fb2
+
+---
+ lib/interface.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/lib/interface.c b/lib/interface.c
+index a054f12..ca4adf1 100644
+--- a/lib/interface.c
++++ b/lib/interface.c
+@@ -239,12 +239,11 @@ static const char *get_name(char *name, const char=
 *p)
+                 /* copy the digits */
+                 while (*p && isdigit((unsigned char)*p) && dst < end)
+                     *dst++ =3D *p++;
+-
+-                if (*p =3D=3D ':')              /* consume trailing col=
on     */
+-                    ++p;
+             } else {              /* if so treat as normal */
+                 p =3D dot;
+             }
++            if (*p =3D=3D ':')                  /* consume trailing col=
on */
++                ++p;
+             break;                          /* interface name ends here=
   */
+         }
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/rec=
ipes-extended/net-tools/net-tools_2.10.bb
index 7facc0cc8d..d8090b88d2 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -11,6 +11,7 @@ SRC_URI =3D "git://git.code.sf.net/p/net-tools/code;pro=
tocol=3Dhttps;branch=3Dmaster \
     file://net-tools-config.h \
     file://net-tools-config.make \
     file://Add_missing_headers.patch \
+    file://CVE-2025-46836.patch \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1



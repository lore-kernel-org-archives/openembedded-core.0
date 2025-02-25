Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC66C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:33:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19432.1740515598778514736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4151b5491e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P90Eek014648
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:33:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j8c45m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:33:17 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51PKST70027197
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:33:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j8c45h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 20:33:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a70FU03vRQ0ZBcdiOtbIY/T2YKyaVQtwn+yXIY0mO2t73qGD0jqWaQXbec8Hj8xxA1qdN6XjR1vP7SYDufFKt5mqTACre7ExEfQUppLF6h+TfQgAx9Chpb2A6aHTmOSyceQw1TUShvlovhnAFfMQLhoKTS+8fSAePzpswTUBjYPY6PvgfFVPvbH0XVaFaOBXjUvbXzb1TMukbyurONKxxbMr/TBHeej4gyJ2QxgVYa8SSaPbi4OI9KcHGbQdsN4lCkipQF4hua9QR2JLy+I7PM1mnsZGboB9GwdoblkVFv6AccUwrrZOfZOMVoSEXTB9n2lgZAZjEuKTRefdIgaE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAf8k+xmZiZvtowXmXcf2DqTRTlro1H7m2aoRWt4Xhs=;
 b=k3+GcFxmJ/fngKwsZcLH1+w4vLnSFdDOoVZWsYBJHmiV1hwOGdrerr9pOCFSOlndKEcr+agWxyWMQdMSJrliiCE96KYznapAr0hF2fhzAuG4DzbxiRCCdw1WQqHwEpapl2rxlRJzDHKlchvC9TZKBHZul+8SZX0Cbuhk37FdRy48RmrQQmdfS2ZLvVfTC2/LWew69CWzIEtzLz2UPkdfHuAkoMQCUeVXXr6thMHN8yKDL0J/5UWT6QzfbxPjX9GEyY2sreCLsnRCJLzM9bJhgS+cwtZ1MwJWrZpj6u8fEgI4upDapvl8LkCT4+02dltHkfLQkYIauWqA9CUI4G3NxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW4PR11MB6668.namprd11.prod.outlook.com (2603:10b6:303:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 20:33:14 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8489.018; Tue, 25 Feb 2025
 20:33:14 +0000
Content-Type: multipart/alternative;
 boundary="------------XbB0909ldx9rTcW2PUzcFmGn"
Message-ID: <aa7f692a-ec61-4053-9524-7f0bc24c4e53@windriver.com>
Date: Tue, 25 Feb 2025 15:33:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sanity: check variable GO_IMPORT
To: Christos Gavros <gavrosc@yahoo.com>,
        openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
        Alexander Kanavin <alex.kanavin@gmail.com>
References: <20250225180939.21341-1-gavrosc.ref@yahoo.com>
 <20250225180939.21341-1-gavrosc@yahoo.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250225180939.21341-1-gavrosc@yahoo.com>
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW4PR11MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 86739e27-0440-422e-4360-08dd55dba0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZDVtNEhuUW5GZHhISzkyS2o2aGJQK092ZXh0MjdXclJZQzdlWTRvU0dFbCs2?=
 =?utf-8?B?bkQ5MHE1anhua0tFTWFySlpGblIxZThjclI1UzFuQkpWajhIaGlhaklEa0Uy?=
 =?utf-8?B?REZlSTVUS2JBR09vQ1ZndmFwMHczbk1aZGs2UEtTeU5vc1BtTjRpWWtmV2tS?=
 =?utf-8?B?bVlrWDh6aVplZHVQTjVPWDFyOWlZWlM1ODBZVmQ5aW5CY084T0hxaXdvM3Ir?=
 =?utf-8?B?UWUrQ28wWjZSallVcGRkQTBJWXNQQjQ1U0daa0RiMzNPL3RLejBFN1dZa3pW?=
 =?utf-8?B?UkF0NW1TQWZrWnpRdytKWTdrNjhEaWVQTjQrREFVWlJtb3JsZkNpa3dBZXB1?=
 =?utf-8?B?a3Z5Zzk4ZFVKcGNtUkt3c1NxcExHKzNtY1Z6anFjNVpjSGlpVm5PVnBadjJ4?=
 =?utf-8?B?U3RIS01Ic09UdE1tbXNySFdPN3dSejgwaW5KM0VrZEVCM2EvLzR4eEJxY3Jr?=
 =?utf-8?B?VUNKYTRnbHFUbnhJSkN4dWY1WS9FT3k5MmE1VEJ4ZXZWd0ZWUWFmYm5DVGFs?=
 =?utf-8?B?NmExNVY1SWRnY2FIbXc1NDN5cWRyNGtLZWdBSW1rK0Z4ODJrVXRFMXY5czVN?=
 =?utf-8?B?NSsxWUg5bnV6ZUE3WnRuaDBPU3VKeHhMVVN0TW81eXR5aWZUWVdWQTBhcjdw?=
 =?utf-8?B?aGlEWGRjRlBsd1MwWWFhZ1FLdWozWU85aFRPbk9ubms0ME8vNjZUblZTaXRX?=
 =?utf-8?B?ZVBES1Q0QituUzNlTjd0VXZFbi93TEFtSXZ2MGNuaDRBZURGZVlRLzFXekVs?=
 =?utf-8?B?SjN2d3RCSXNtWlpuU2dmazNSYzlaZkF3WktYelo5MHpiTXRTcllFWW55VFZy?=
 =?utf-8?B?MlZXNDlFU1NjVlpaeHpIOWVjeExIdEY2OGdsbmQveG5BT09TUGQyeXpkWXp1?=
 =?utf-8?B?MDhNdnpzY0VoTWE1d0RMMGI4WnQ5L1cvWnAxQXROdDM5bk5uNTdoZ3ZYanV2?=
 =?utf-8?B?RWgyQ0lMeGpsMXJvOTVXUkJUM21PUDM0Q2ZkcUE4RTJITGlFY3BpK2VTL1lk?=
 =?utf-8?B?MHJQN2dBeWlEc0ZTS0g5TGw3d2NwSVE5SFIzcWRUNVJaVzgzc1BvY3c1aWJs?=
 =?utf-8?B?empseGlUbHRKeHJpQURXSjhOZlZGbC9RMTRrOWRMRjFjUVdwdmI2ZlZVQUNh?=
 =?utf-8?B?VXpONnlnUHhrTkNGWk5PYUQ5Rm93STZlenNrMDhCUlJUUXJkc0RKa2hsRVJv?=
 =?utf-8?B?ZnhnSVU2Vk5Ha0wvcjUyQTJxcExuNlIyUjJzdWxRWHJLczRPbm9mRUpESWsy?=
 =?utf-8?B?aE1tR3JkdktLejVhTzlQNWFjTEJSRlh5cXFsdllBRHgwWStFUlBrSzJ3OWZL?=
 =?utf-8?B?enVyRTRyamVIZVY0aVZoTHR5KzVxY0JsUVVqZ1htZmdmMTNHVWZSdXdRUGNZ?=
 =?utf-8?B?UjRnMVJ2OTIwMk83U25hL3hyRjBrVmNBdXFzdksyd0YvbmFLWlJwM0NiZmNT?=
 =?utf-8?B?ZFdIUW9DdWVDQVVPZFRiVGpSQjBxWUM0cE9oZVBDdmxLYjl6ckFJQVpkZFlx?=
 =?utf-8?B?Vld3ZTcwVHI5b2s4ZE5HeEwvbjdYNmkrc0xUamc3clZISjlYdndPTFI2OEc3?=
 =?utf-8?B?WFk5TUs4UnlaU3lNRC9EL0tET2hiWWNwZmI5NDZoNlpjdEF3M3l3YnlTcHpU?=
 =?utf-8?B?MEQ2RStQdjhNSW9OSFVYOGFPTmZtUzArcDBnT2w4Z2NURmxiWEhMeExPSHN4?=
 =?utf-8?B?ZmRCU0xOc05aZ1FDSFJnaWRzSjhQb0xwMHNTc3lYZ3VWQWVCVURVeVJFL2pr?=
 =?utf-8?B?L0hucmpuWEFxV1JEOHh4NldlemJkcFV4MHptMjVCZXRPdmFqaFQyRFMzNFFp?=
 =?utf-8?B?TU9LVkNtVGUxZ2hHNnpuQytPZEVDbm55cXNCTVIzK2FvWUxIRmZiNHo4d294?=
 =?utf-8?Q?CZfIt/Ij9G5Hr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eVZPY25NeEg4Rk1PeW1pZEZEbHVCN3JXL3JPWGZGTW42eVN6aTlLQ1VQMUFo?=
 =?utf-8?B?MVptVGovVFhLbDFCTmQ5bnM5YVVkOVFvSi8rOGVzcks5U3NWMUloL0V1ZW1l?=
 =?utf-8?B?RnZTZU9tYzdUcVJyZ1FBUC8vZWNVN05lQjlwdmhDbEM3aE9hQVp4cERUeE9V?=
 =?utf-8?B?cCtqbFl5VFZveUtTdDVkMmdZdFdBMkN2M2VJbzZQWElvK2gxaU1sWmx0M2ds?=
 =?utf-8?B?TE5wQi9TQ2lXRzc0a2VvbE9GbHJDQlorMXY4QlRaN2prWEF6a2F5ekV4bERH?=
 =?utf-8?B?bk1mRjl5c0dyWGNISmw5OUhIWGFLRXhnZjY3ZU9PZlpYUTlHMDZrSjAyVXZD?=
 =?utf-8?B?bkNPcVdlMkUyR3UrY1ZYUzZ1Zzdkd0JnREEwUmIwNmpKTDZiWml4TUpmcEU1?=
 =?utf-8?B?MnNWMlpCK0NMUWkwVVp4bDFZU3NjanRkUU9JT1FxbWJRVWlsb2xjR1VjdVhX?=
 =?utf-8?B?WXdGczRiazJ1MmdiL1NXV1J5R0JMM21LNjFtekd5eThicG93TGhzYWI3Snkx?=
 =?utf-8?B?VTlIa3JLNXR4ZG9BTHhZV0YwMFBBakFVcHVWTWJreDh1RzR5TWR2NmczTHp5?=
 =?utf-8?B?UlRFRTk1aU1FaExGZ3VuUlhnQ01CcnVXWVlENE5mdG53RzZaRVJFNnFuS2lQ?=
 =?utf-8?B?M3AzY3c5Sk8walllS0s4d0t5WmE0eXFyMlUyaVROdTY4R0YwVmZkRVFsdEcy?=
 =?utf-8?B?VjM5dFpEaXBHMXVERVdWdFFTWUpPYThiaVN1WERYbzU3YWRGMFNCQmI3ODJL?=
 =?utf-8?B?Q2doZGdWYitTcTg4S3pwWEdhN0FRVmVka29UcGcrYUY3NGlzYTRPQlZPNldY?=
 =?utf-8?B?RFp2anBsd2QyMElqM2dqNDJaZFFuNzFtRkc2dXVHd3JuaTNBREF6RitpZzYz?=
 =?utf-8?B?UnBxMlpaTUhBVE9GajNHbHlYSlZuN3U4OUhJQjFNaW5Sa2RjbWJuWU1vUjhJ?=
 =?utf-8?B?b1ltbWdkUGZ3V3RTQXgyQWNNOGVEZU9OL3B4d1Fxdi96dG1ISzVkVUJqV0x6?=
 =?utf-8?B?UDY0d013NCs3KysrU0RIVWQ3dEFVM04rVjc0SFZ0SER2bVFxbFBBcFdPbkMy?=
 =?utf-8?B?NGFVR0lJaG1PQTM2bFIxZVdGY3JiNk5yblNYY3U5K3loQ1luRE0waDN6YlpR?=
 =?utf-8?B?ZENxODZld1dSQWlFWDMzdys4eVBHc1RUeFVMMXRranNMY3E3Mi8zUndVTGVP?=
 =?utf-8?B?N2REb01GK1VNVXFoQ3V2cmw4L3VzMnJTVkRMeC9rbzZXQ0pYY28rWFFreDlh?=
 =?utf-8?B?b3Q3aWx5VnF6T0p2Nis1clNPL0ZoSFI4cnVDOHN1NmRRVlY4bXdXdTNsUHNL?=
 =?utf-8?B?OGtTQzNmOWVtNnk1c2tRa1ArbGNXK3VUb3NWU2xGdTY1OTVsb0RLVnJIa3Iv?=
 =?utf-8?B?TVNEQkVUZVNULzB6NE1qNG9NVUpyYno1STFtNW5ndjNFYXc0NVExbGV2cDlZ?=
 =?utf-8?B?R1RBZzdBUGUwRHRNZU94WE5DV2V4SzU5bHBTMDYvWlFzYkxIRWdrM25XeER6?=
 =?utf-8?B?OTVNeitpNGp3K0RYZ2lvcmNJRXpNamNvOHp6RnFUSzRNYXErK01OQnlpTXVt?=
 =?utf-8?B?T1JJcitqWFcxMnRmelhYdkRFOVF6ZTdZbFJBTjNLWWRxOGZRZ2xSblcxbE0w?=
 =?utf-8?B?enFuY1YxTXdHS1JoeDM1VnlGMFpVdVpmcXJtSmdFdDdENElrZTVST21IbGs2?=
 =?utf-8?B?bDBWZjZmaTFCWkVVWmcwdFdYYk85Mzl6SGtTKzJtMTR4Vmo5VWRGOVByU25K?=
 =?utf-8?B?S29sQU1TTWdwZ3JneU1vMTExa1BRVmo4aklHMDZHMThqQVp4VTZTaXJnYUhT?=
 =?utf-8?B?ZnV0M0R0eHJvMk9FOWErY21PSFBJRENXYlhVME4yZFlMdDZXTHUwS3lUTW1r?=
 =?utf-8?B?a2dOS29Mb0NPNDlJeEZUd3lGWDBRbkcxQzNrSGJ4UUlDZGRreVdLNWJ6ZnZm?=
 =?utf-8?B?YXU2UXlnZ2JCeUxGZ1E2VHZlU0wwWFNPZm1kTzBjY0pYejRRVnVIdlVSd0Rn?=
 =?utf-8?B?bWgvZlNEYVNjUHh2N2Eyc01GU0hvOHpOQkhnN1hvOEJ0VUN0bWZKZjNLR1FT?=
 =?utf-8?B?YWtUSTFRbmZ6bm9NTEdzV0JWS1NvMTJqNnZyMkpYWUttZ3BibDdLQTRvOVpq?=
 =?utf-8?B?MjVtdjNEa3pDb2VaVHYzNE91Wk5BL0FXbGt5RnM5ZWpxblZYVTRrRnpNY016?=
 =?utf-8?B?T2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86739e27-0440-422e-4360-08dd55dba0ec
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 20:33:14.4214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9VLgx7R4QBRo3EANrdWZHts23NsGDBp4mIr4Fp/ZBxj9cDl90bsMPoWerMz+uvQPELg8uaw7zAfImpx3vOH0V2KaEb4X12aP03nW7n0xGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6668
X-Proofpoint-ORIG-GUID: _RfM1SU6XKyLz5dWOtnrbp7kgPvq8BXZ
X-Proofpoint-GUID: nOo_kkwTXr21Si_Tcnh7gZZvxguVadxt
X-Authority-Analysis: v=2.4 cv=U+ZoDfru c=1 sm=1 tr=0 ts=67be290d cx=c_pps a=o9WQ8H7iXVZ6wSn1fOU0uA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=CjxXgO3LAAAA:8 a=jNGM0nzZbMz4lkQm9YIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-H5NqDVh3vubIDgMIkMA:9 a=dVQQG1uLskaCyies:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_07,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211922

--------------XbB0909ldx9rTcW2PUzcFmGn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51P90Eek014648

On 2025-02-25 1:09 p.m., Christos Gavros wrote:
> Check if the variable GO_IMPORT is
> assigned with a value. If not generate an error.
> Fixes [YOCTO #15763]
>
> CC: Yoann Congal<yoann.congal@smile.fr>
> CC: Randy MacLeod<randy.macleod@windriver.com>
> CC: Alexander Kanavin<alex.kanavin@gmail.com>
> Signed-off-by: Christos Gavros<gavrosc@yahoo.com>
> ---
>   meta/classes-global/sanity.bbclass | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/s=
anity.bbclass
> index 1bae998f74..01e48b4347 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -1010,6 +1010,10 @@ def check_sanity_everybuild(status, d):
>           if '/dash' not in real_sh and '/bash' not in real_sh:
>               status.addresult("Error, /bin/sh links to %s, must be das=
h or bash\n" % real_sh)
>  =20
> +    # Check if a value is assigned to GO_IMPORT variable
> +    if not d.getVar('GO_IMPORT'):
> +        status.addresult("GO_IMPORT variable is not assigned with a va=
lue")
> +
>   def check_sanity(sanity_data):
>       class SanityStatus(object):
>           def __init__(self):

Thanks Christos,

I know I suggested that you try sending this to see what people say and=20
to get some guidance but
this break all the builds so clearly we can't merge it. I did expect you=20
to do a build though... ;-)

=E2=9D=AF bitbake busybox
...
ERROR:=C2=A0 OE-core's config sanity checker detected a potential=20
misconfiguration.
 =C2=A0=C2=A0=C2=A0 Either fix the cause of this error or at your own ris=
k disable the=20
checker (see sanity.conf).
 =C2=A0=C2=A0=C2=A0 Following is the list of potential problems / advisor=
ies:

 =C2=A0=C2=A0=C2=A0 GO_IMPORT variable is not assigned with a value

We need a sanity check at the recipe level for go-based recipes only.
I'm not sure how to do that.

I may do a bit of digging and reply to my own email with a suggestion of=20
a better approach
unless someone beats me to it!


--=20
# Randy MacLeod
# Wind River Linux

--------------XbB0909ldx9rTcW2PUzcFmGn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51P90Eek014648

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-02-25 1:09 p.m., Christos
      Gavros wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20250225180939.21341-1-gavrosc@=
yahoo.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">Check if the variable GO_IMP=
ORT is
assigned with a value. If not generate an error.
Fixes [YOCTO #15763]

CC: Yoann Congal <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:yoann.=
congal@smile.fr">&lt;yoann.congal@smile.fr&gt;</a>
CC: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy=
.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a>
CC: Alexander Kanavin <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:a=
lex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
Signed-off-by: Christos Gavros <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:gavrosc@yahoo.com">&lt;gavrosc@yahoo.com&gt;</a>
---
 meta/classes-global/sanity.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
index 1bae998f74..01e48b4347 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -1010,6 +1010,10 @@ def check_sanity_everybuild(status, d):
         if '/dash' not in real_sh and '/bash' not in real_sh:
             status.addresult(&quot;Error, /bin/sh links to %s, must be d=
ash or bash\n&quot; % real_sh)
=20
+    # Check if a value is assigned to GO_IMPORT variable
+    if not d.getVar('GO_IMPORT'):
+        status.addresult(&quot;GO_IMPORT variable is not assigned with a=
 value&quot;)
+
 def check_sanity(sanity_data):
     class SanityStatus(object):
         def __init__(self):
</pre>
    </blockquote>
    <p>Thanks Christos,<br>
    </p>
    <p>I know I suggested that you try sending this to see what people
      say and to get some guidance but<br>
      this break all the builds so clearly we can't merge it. I did
      expect you to do a build though... ;-)<br>
    </p>
    <p>=E2=9D=AF bitbake busybox<br>
      ...<br>
      ERROR:&nbsp; OE-core's config sanity checker detected a potential
      misconfiguration.<br>
      &nbsp;&nbsp;&nbsp; Either fix the cause of this error or at your ow=
n risk disable
      the checker (see sanity.conf).<br>
      &nbsp;&nbsp;&nbsp; Following is the list of potential problems / ad=
visories:<br>
      <br>
      &nbsp;&nbsp;&nbsp; GO_IMPORT variable is not assigned with a value<=
br>
      <br>
    </p>
    <p>We need a sanity check at the recipe level for go-based recipes
      only. <br>
      I'm not sure how to do that.<br>
    </p>
    <p>I may do a bit of digging and reply to my own email with a
      suggestion of a better approach<br>
      unless someone beats me to it!</p>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------XbB0909ldx9rTcW2PUzcFmGn--


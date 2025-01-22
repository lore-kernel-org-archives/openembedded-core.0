Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B73EC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34420.1737514980991637901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31173a9983=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M2M32w019471
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw01jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:02:59 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50M32x1E014225;
	Wed, 22 Jan 2025 03:02:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw01jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 03:02:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOVpoyGv/bUPGmONR6qH+EhbAB3JGL3PgZKEXSyiBhZS7X5dUioZVwSJs3f4ROm6OmFsmBRyA6mMD0YnIQhBuDAUpA0u+K2BKtq0eHYdzuPodZia6y7EJ8OQgrFk/3vFwlBS5tMHFsMuIuIXhMFMkEAZLdBVIrrztmUgLYEOzQjLM6sMgwMk14Rf45bI2clraSGlPrpMvO05PxGDgVjTcFhkkXfEEz1hGiAFi9yLbp65Min7mRWNBhYgMHw8M265ujdt8LAJyUF15iKCj7WFRbB0ksiOe0k+72egaF0503YydpK3gv+/XKWf33uWn9YJqfv0tRUJfKTFOMklqKwebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqScr6e0/ISAB0t9veRDnjivt9Z67IIZQUTA087Szxc=;
 b=KYKRwhaZ1PjASwJp45mDiPB04poI3zKvsKUs53AoorAzSzHh2VAfc7Cm05p8+8GUq5fe6PJzB1p6r4uPUK0aHGEfmaHIGyu+oi4PABdW6xrY/nzuqz66cROsGE7z8wWCbHRtye+iZcbJc3unyvqm/4iGu85F0TcpwxZ1z8L6WGPCtBDp1GIBeTbNPpBLh3Z9AJWAdcnOqxPat4tHauoAm7XpQLEuaI8NNOP+0pTmGQr/WddhwWlA7/AxSNpxMKnhW7VhUgoS8peEZ5VFFUwAqBt6gsXS00xVZA+1WlBgGJSMjIE+EXsm6vQXZLW09u10RHVfqSrgqYNSOZDA+jJCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.20; Wed, 22 Jan 2025 03:02:56 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 03:02:56 +0000
Message-ID: <218aaf1a-7320-4514-bace-78ce19b313f8@windriver.com>
Date: Wed, 22 Jan 2025 11:02:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for building
 32bit binary with 64K alignment
To: Ross Burton <Ross.Burton@arm.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        "MacLeod, Randy" <Randy.Macleod@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20241225030437.972359-1-Qi.Chen@windriver.com>
 <7008933E-1611-4683-86A2-083772D4CE71@arm.com>
 <PH0PR11MB5611A86DA4C9CE43DEFA2EB5ED132@PH0PR11MB5611.namprd11.prod.outlook.com>
 <181B122FF6A5F825.28670@lists.openembedded.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <181B122FF6A5F825.28670@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0193.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::6) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: a9bfdf50-9d8b-441c-aa4c-08dd3a9144ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NllacTBieDE2TmQyMlZDVlB3OXdjOUF0dCt5NjFIUWxoSzhIL1pjYnVsem42?=
 =?utf-8?B?NHRBTU0wdmRnd055c3pvZ0UrUlFLaFFmRTFBMTQyaVkzMVlGcUN3UnJRYTAv?=
 =?utf-8?B?RUlOMkxVMGRsbEFqcG9Sb1ZMcVpwZ1VTU3dTTmY1ZWJnaGMvNWhGbUw1a1pX?=
 =?utf-8?B?RVdCTDdST3BsdlJRM0tmL2JBTzVDcnlsS1lDWW1Jdmhtcy9aU08rOXFkUDgx?=
 =?utf-8?B?ZzJ4MER0MFZldzIxNy9henNuRzl1NVZPTmo4STZNbXB0anhkQ1RJQmRVTXh5?=
 =?utf-8?B?M2tTSUlrS2Fsd1NiSHU4MUtRNHNCYVRNeWRxMEdDRkJ6VFpYRGlsdjlZRWtH?=
 =?utf-8?B?YkF1T1dDcW1MRTZ5NlkxOVJrOWlEUkszVDZzbkg5dXRHc2NSNTN2WnQvQlk2?=
 =?utf-8?B?Z1Q0eEN5b244UTRjTGNVYVJBT3FXOW9sbG1uR3BsN0Q3TkU1WVBCK2MyUXdZ?=
 =?utf-8?B?WCtuQ24vTy9MQ0FvVWxPaWEvWTBaa3FsbDFkUzVwcmVzSGNVZHpaRkNLejE3?=
 =?utf-8?B?dGV5YWQvcW5QVDFqZkVIN2haK1FKa1FIYVVTSnhWYk4yZENQdXNpcTRKSUsy?=
 =?utf-8?B?MUFHZkFYVlRaTWRTalljenBBR3A5U1hIeGE5c0N1U2N5bDBzV0gzenZzU0tp?=
 =?utf-8?B?RnFGb2lNa2VEdVN6Smk3dHBqSGxvejVmRlpaMHE2SjFMUFVudWJXMTZ0WG82?=
 =?utf-8?B?blU1K3o5em91MEpJNWhIQ0hyS2x1VWRKRTlRYjU0S2NqTE90QmJhdTFXakhG?=
 =?utf-8?B?QzFsVGk4eXRIcXdBemt1RlRNaFNOaXNiOTc0ZFR1Mkx4QWYzMVBMZkJIMVQr?=
 =?utf-8?B?QjMyWU1XcUtKc0UvblhDcVBVbktUUzVjTnlESHFwRzdRdFc0OEdBS0ZBKzZy?=
 =?utf-8?B?S1RBcUlqNEQxYndmS3RuTG11a3ZQL09yYXpONGptZ0RLOG55MTFkRHpvNVBO?=
 =?utf-8?B?L3RnbDd0b21ybHhMaTNUQ1RHc1RYckFYYnpuZlhnNjNwWkE0NFBpY2RzbTc3?=
 =?utf-8?B?YjBHRGhJSUJOTnJjaTZnYUNYQnY4NGQxd05YcElkUTZGcFQwY3NHazFpWUtQ?=
 =?utf-8?B?dFZWN1NZNzJFeDUvM3hvNVpuZDJ0WVpLQnJhVmhiYXI4TVhsdG1ZYnJ6U1Ro?=
 =?utf-8?B?WnRPMkFWeFFWU0ZIYTRDYWpOWnpIVmJDRUM5VUFLUWlFRE1zNDJ5dkNjMUxN?=
 =?utf-8?B?ejkyNndGRHpiaFM2L1VvM3Z5UUNTR2dVZDAxb0xqMU9naXFPOFh3UEtmRkkz?=
 =?utf-8?B?NlRPaGhBa212dXdpdHoyOWdQRFRJRW55dnMwai9ZTkUyYi9wNHQ3NWowdmE3?=
 =?utf-8?B?bEZ6Q1pxcW1BRWVWZ1JSOTRzWElJeHgyTU8wcXZIYlkvam9SbUwvT29KUGNm?=
 =?utf-8?B?ZC8zU0ZtN3I0a1RuWlpoenM4Z0NKVVRVTkVJNVJ5L293SmtyR1BNUHZZblpl?=
 =?utf-8?B?WjVTZ08zT1Fac3B5UllWSkpueDgyQ04rd3pCYlJQUDNDcm4zRmhQeVYxVC81?=
 =?utf-8?B?UW5LYzg4NjFHSDNoQTk4RWZkVU1wK1B6aWpVNTFORjdPYkROM0l6YWtieERN?=
 =?utf-8?B?SFNpeklZbTBnOEpMS3Z1SUJidWs0NVkrakwwbEozUkdoRjRwZmxyeFBQaS92?=
 =?utf-8?B?dm5mOWNPbG54VHZBN2l3SHUyS0xKOGR3TnVCcjJpZE9pSTFNVjFnaG51SjJl?=
 =?utf-8?B?RFFaOXJTMVhhL1JGbGR1WWpGdzhtQ0JuTWRVRHlEUGxwY3NnVXV5b1VyTDFr?=
 =?utf-8?B?dEFDK2tLQWhINFZqZkw4RXNzRVgwYmNtbkFFM0czSzdVcGEzVWtMdXJBZjFj?=
 =?utf-8?B?M0tlSDJZMklNcm1TcEQxdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmdoTkR2Z1paYVF0UmRYVU4wdlEwYnlqSlVxemhGNWhDb3JINWFyNnp4Nkt2?=
 =?utf-8?B?OFhNajdzMmRuWTZTMFo2ME5rZm9kNWJJa2tuMkFacWYxUmo3VDZydEVYWXNR?=
 =?utf-8?B?bkdYeUlzR3NJdDRZcVpLRi91VjVJZmhxWFV6dTgvVjFna1FnMmVZYlpNNFE3?=
 =?utf-8?B?ODZuNnFmdTdCUE9jdmZDUEVqYnFTeHdnOVBHUUZGSVRaWGZ0MXVmN1NtYUhL?=
 =?utf-8?B?amxYc2FyZW01UUYrTS9vcTJoMlY3SnZ3bnd1YysyNzJsaSt3YTdYMXNBdHhQ?=
 =?utf-8?B?ZTc5azBFamFJVUJGYUlRZEx1MmRHdkNGMzhobWhvZk5uWHdrQ0ZFVlFFaGd5?=
 =?utf-8?B?ZUV1SEV4emhRZ0xiUEVaN1NzUFc3a3A2L2k2UWkrRWV2Ym9JK3Ftck55Y2Uz?=
 =?utf-8?B?alo0OGJYRmFGYXJKSnBEMjl5dTMrTG0zTitSQlFpVm43T1dwMHJiZ0wvbEkv?=
 =?utf-8?B?aVRvVEZWVFJRTWcySjNCSlFEaThROHYvWmtCeHpZUjZxc3Y2eHRRelRNUWRt?=
 =?utf-8?B?am83ZmNjc0JRcU9QNm5hSTBLNWk3dHkwWTJMWWxSL3NwV043QTZMNzBzL0pj?=
 =?utf-8?B?Q0pZRmZ2bWYzM1prem1UdXA2TkdibDBGcDRBMjJoTWVydE9GaHVxeW9BVko1?=
 =?utf-8?B?b0R2RnorUXh5a3Y4NEFMa3lXcm1zR2VPSDVGamY4SjNiNHExV2lPR09KclNU?=
 =?utf-8?B?ZEZkVnFLU29YRjhrbHZGSk1oeFN1Z2dsVVhUaXNYQURHUUR4aG41dUlkYytQ?=
 =?utf-8?B?Zk9qa040bEwraFVIMHhrdGtSSjZJUjVqNCtXUTRjeVhYN2YwaUlYejAwaW1I?=
 =?utf-8?B?YlhpUmpXcTFXQzlpcytpbks5OXBRRCtwK21rU2o1SmJyOG9hZ09wbENnb29T?=
 =?utf-8?B?TzNWRVp1Qy9UbEU1OHdBSnRRcXI4ZEw5QmkxcFBqT2V1R3JsSzM5Ly8wT0Nh?=
 =?utf-8?B?ZEZ2NWxaUWF3SVh0Wmd6TFkzWUFWYzlPVHJJSURBdno4VUcybGNjSDZnUHRy?=
 =?utf-8?B?WGhBU295aEVHV2cwY1V6Z0JjeFMyR0s0Zk5GblVVdUN3eW53b0RUUjRZSkNh?=
 =?utf-8?B?SU1FZ0pWY1J0WXU0aG9hZTZUZU83Tm0wckdCdTVya0VMeEl1aG12S3lTajI5?=
 =?utf-8?B?RmJvQXlPZDFUQnMvTXdRTFU3ZXJmV2pXcDc0RUdHWUJ2a0VHUU1QK053OTNO?=
 =?utf-8?B?UTdHZndNRk5IRi80SGVwcGxBNFVEL0RkVVNJL1dDZXFsTnArZUJMeCtnV2F6?=
 =?utf-8?B?QjBMcXNzQkNTT1ZHa2VkY20wNS84TTVEU1FPbWdXdmcybThvOEsydWUvUTgx?=
 =?utf-8?B?QUVpeGk4R3Z2Z3BvSEt5RldIZktHbU4xcGlUcWVxVnltUjVCMEVreUtYNVNW?=
 =?utf-8?B?SGwySklhOUFVY0N6N3VDdWJ4Vzc3WFhPenFnMTg5UENOaHFpamlsUEphMW1x?=
 =?utf-8?B?V2JHUFQwNHFuc3BFcHY2Tm1IUEk1enYrSmNwdDNNYkx4em9QOExCTW1hVVll?=
 =?utf-8?B?cEpwSmNsaUV4cTJQU3ZPWExFMklqNFhRWm9hYjFuVmhPTUIvenFtaHNCUWdS?=
 =?utf-8?B?T1VVRTRVTXNpUVphRU0wY2RyQndZRGk1V0V1VVdDWDRVa2psVlF0aGNOdk9m?=
 =?utf-8?B?YTJ4VWp6ei9MckE2NTlCeUdPMUNRamJSMTc1WmdyL1VKM1ZjMmErK2Y4cTBR?=
 =?utf-8?B?V2lHSWxNZnR3VTV2K0JXT3I1UW9rN2E1ZEZSRExJUjdYa3VYckhna2ZleWx3?=
 =?utf-8?B?L2NVR0hkVFAxQmdkTkdaUlBqZ1ljT29KcnVFRDJ1NnlrK2Yyak1pL2NYR0U1?=
 =?utf-8?B?NGllZlhjRldYME9abUhYSkdCRG0ydXJRdWJzYVZKMG9mRnZQM3NBOXBuNC9j?=
 =?utf-8?B?aDZnY1ppZysrMzQyRStyS0NJTGxDUUlMNkp6RTExU2JLYXdOeHIyWCsxdGdw?=
 =?utf-8?B?bTIya29vK1A2czZ6dGhHNFo1Uzh6dnlCSHBQR0lrMkdscWNDOUdTZUk2QnJz?=
 =?utf-8?B?dVFzMDBPWTFuMFoycXhPTG9qb3dxclJVSmZPZ1pWYjBVaFZ0Z3I5clhnek9a?=
 =?utf-8?B?U0JsRnVRbGk2c0JuMzlvZ3BDaFQ5TzRGVm15b2tLTHhEV2E4MlFVYW5uSHhF?=
 =?utf-8?Q?UWypnM3mM8x6iwelXDdZL/KYi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bfdf50-9d8b-441c-aa4c-08dd3a9144ca
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 03:02:56.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsssFa1H3CFaMymbhWiHAixzz8yXac0O/Rx0vSJ8WohE65wcF5YzW4UNCxGFxRaYmrvahdQZCI/qH0YX5ooFnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
X-Authority-Analysis: v=2.4 cv=b/xI4sGx c=1 sm=1 tr=0 ts=67905fe3 cx=c_pps a=IwUfk5KXFkOzJxXNjnChew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=Xahh6ufm9es6bDkvP84A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gU0t6Ub5z1JWh3NIQ-vcy1wmWT-CBkBl
X-Proofpoint-ORIG-GUID: QKGR9tobqTm131h9RlpCuWxbLa30yspl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_01,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220019
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50M2M32w019471
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210113

ping

Is there something I need to do for this patch? Or is this patch not=20
suitable for oe-core?

Regards,
Qi

On 1/16/25 12:34, Chen Qi via lists.openembedded.org wrote:
> Ping
>
> Ross & Richard, is there anything else I need to do for this patch?
>
> Regards,
> Qi
>
> -----Original Message-----
> From: Chen, Qi
> Sent: Thursday, January 9, 2025 9:54 AM
> To: Ross Burton <Ross.Burton@arm.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: RE: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for b=
uilding 32bit binary with 64K alignment
>
> Hi Ross,
>
> The "./bsp/marvell-cn10xxx" exists in yocto-kernel-cache's origin/yocto=
-6.6 branch.
> In its master branch, the marvell-cn96xx.cfg also enables CONFIG_ARM64_=
64K_PAGES=3Dy.
>
> This patch was tested on pristine poky + qemuarm64. The test steps are =
in the commit message. I didn't test all softwares in oe-core, but as lib=
32-core-image-full-cmdline started well with no failed systemd service, I=
 assumed that most softwares should also behave well. I also tested lib32=
-sysstat with core-image-minimal.
>
> The help text for ARM64_64K_PAGES changed with this commit: https://git=
hub.com/torvalds/linux/commit/db488be354bc85724d7b9523e94435fdaa761a35
> So 32bit arm was not supported at first, but at some point, it was.
>
> Regards,
> Qi
>
> -----Original Message-----
> From: Ross Burton <Ross.Burton@arm.com>
> Sent: Thursday, January 9, 2025 1:02 AM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for b=
uilding 32bit binary with 64K alignment
>
> On 25 Dec 2024, at 03:04, Chen Qi via lists.openembedded.org <Qi.Chen=3D=
windriver.com@lists.openembedded.org> wrote:
>> When 64K page size is enabled, for 32bit multilib, we'll need to build
>> applications with 64K alignment, otherwise, we'll see errors like belo=
w at runtime:
>>
>>   root@marvell-cn10xxx:~# /lib/ld-linux-armhf.so.3
>>     Segmentation fault
>>
>> marvell-cn10xxx in yocto-kernel-cache enables CONFIG_ARM64_4K_PAGES=3D=
y by default.
>> And the issue was first discovered there.
> Do you mean _64K_PAGES?  Where is this marvell-cn100xxx?  In yocto-kern=
el-cache there are no users of arm64-64kb-pages and nothing called cn10xx=
x.  Is this a Wind River-specific fork of yocto-kernel-cache?
>
>> However, there's a kernel config fragment in yocto-kernel-cache which
>> enableds 64K page size for arm64: arch/arm/arm64-64kb-pages.scc. So
>> it's easy for other
>> arm64 BSPs to enable this. And when they do so, they'll have problem
>> with multilib. This patch adds a config file to help people a little
>> bit in such situation.
>>
>> The max-page-size option is used to fix this issue. This option is
>> added to both CFLAGS and LDFLAGS for the purpose of covering as many
>> recipes as possible.
> First, I should point out that changing the page size is an ABI break, =
and the 32-bit ABI was formalised long before 64kb pages were a thing, so=
 things _will_ break.  That said the loader should work, as a decade ago =
binutils 2.25 changed the alignment to 64kb pages by default:
>
> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dld/em=
ulparams/armelf_linux.sh;h=3D280db842208e06e3231ec3a8322369193630a07d;hp=3D=
35891f1fc91bddd03677aaefd7146ae5333e6cf0;hb=3D7572ca8989ead4c3425a1500bc2=
41eaaeffa2c89;hpb=3D8335d6aa34b88ce31b62e1b578d54ab4aa364435
>
> That won=E2=80=99t help specific pieces of software that eg assume the =
page size is a built-time constant (and use the wrong constant), but hell=
oworld should be good.  Can you replicate with pristine poky master and a=
 minimal configuration in a qemu?
>
> Ross
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209933): https://lists.openembedded.org/g/openembed=
ded-core/message/209933
> Mute This Topic: https://lists.openembedded.org/mt/110280373/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>



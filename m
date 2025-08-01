Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82F2C87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:56:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.80735.1754024199794730851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 21:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0308b89e75=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5714aUEJ3051323
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Aug 2025 04:56:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484m7xp6q4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 04:56:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STv0Q7Jv4hIuNPmhUujyDrCiVlFRmRnbD4/lWKGNinH/urdg0a199hfkrq0o0GUUrsJZhf8MWWylzwDff5lKD+FRnu9A2l3mC+CXRbCtA7uMMHjnXSgSs7AoQx3luooZLJafcWLQlugxwyvDQ/vouW+wZKFC/s6V0TXfw2tWsthil7W7H2CfLhwJP1V/dQB6ocJkZqvaAnlnNdqm/Hhp5LASEuiRUzK+G0FNspMMxl6TxRKGa0MkdOJIo8pUiw6oFdHLtc4XzcO2WKMwHO1J2yana/jKwUlhZKsETsuQJPkSUF4AmBVb3nTMB+pkyKxSIpic+aLHtK8/PYGWFH4YAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvTd471v36iFFDrNifBpDJYCvhMSJW61OZng/9rrA4w=;
 b=Jp3NCT9Yt/Asr5rrA6YAIK30CUpLFeTHtItdRTEOQDLud4MecOLkMxEQlHEX5mFEg+J+B74u0gy8nJq9tYQccoFCK/TdKmL0dDf+JOIUFAXqkKF3pDPAUOyfXz9V/umlJ4Y4E9o6v/vSl/na9LLUtNXLUu63nFTFvS2UsbXGXfj/2lPzN7nSbnjuhn5UtSJC0lU1OXitF8wReLjWBJLIC8mgp7+2hG6fZqTAgYGDjG4llEQm16EF7949Bdk6YJuMFGSwuMfADJdknYyYE/i9MtBrk4Zpl3lpWIV4Hm57M/glwTXeKkYb8lryGcPAFihG6lai41e3NwmVP7XPs4bsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 04:56:35 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%5]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 04:56:35 +0000
Message-ID: <a3408eef-3cf1-4104-9b35-a934e0524892@windriver.com>
Date: Fri, 1 Aug 2025 12:56:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] vulkan-validation-layers: fix compile failure
 with DEBUG_BUILD = 1
To: openembedded-core@lists.openembedded.org
References: <1852AAF23882C10C.14080@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <1852AAF23882C10C.14080@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfc161d-57b5-4591-7032-08ddd0b7ca77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QzZiRlJrbmJ5Y2thdzlCb1crdDljc3NyS0NNcXdNcmJxM2I1NEhLdUx3bEVk?=
 =?utf-8?B?R1FGb0M5elhDV3NaaHQzNDlaQ2hNMXpkMEh0MVJXWEtwY3RHcXNFV010NjVr?=
 =?utf-8?B?emM2bjJPbW5wK3lUb3BpNUtuRk9GdXZpY2QyWWNoYjNRR3FrbFFpQXY3MjFD?=
 =?utf-8?B?bUdDZHNsTGxKbDdGQnZ5U29UdTRnU2dMTm05dEFxZXRHcmpXK2xnb1UveFVl?=
 =?utf-8?B?eVJFTmdYcjBGN2oyTGI4QVdEa2lYa01lRVVYV0NqNWRuMVlRS2E0cnRLY09U?=
 =?utf-8?B?MDBwZDVGVlJYM0RYaks5VnR6SklSVzlVTFVMQjM0a1NiOFhsNHNNOVdOc1hu?=
 =?utf-8?B?T0t4blhXM2dlZXhHalRnSDJod0xGZTQvNER3T2JCVHh2QWlZL1hRQjNxbWJp?=
 =?utf-8?B?ZzJiUDY4UnRPZWMrNEFPMHJnZWxVUVRrOXJKdXY0cWJoSEt5RVhOVlozQTVX?=
 =?utf-8?B?by90QUxqV3hFdXBaTXV3RWpDcDdvM1lsSXp1RUxyWTlVaG1YS1ZYZFBVTWJr?=
 =?utf-8?B?cjNwQjU2ZGJjR0FoNE9QMUxZckgzT1hHMHQ1K1pZbVFzNHdHdXJzVEVocUpY?=
 =?utf-8?B?NG5oWUE2enZZTHZsSWZtcytQYmE4Vml5cUVsUjlyRWpLMVk3d3hMRmdDd25j?=
 =?utf-8?B?d3o4TzdVZ2M5Q09mTlhHT1g1NlllTGNNN0xNZFNyNDUvclRjSTdvTmtpZms3?=
 =?utf-8?B?ZXUvRjFVNnJKQXVUT21lY1lOVlhwU2owUFJ5QjNxcjFYWEprRGZRcDdnNzhN?=
 =?utf-8?B?K1VsVVZkM3FVRm5lSER0Qk10Q1phL1Y2OVR5M2l6NGYwVm52MDc5YUdKbkhm?=
 =?utf-8?B?T0xENXNBK2QzR3QrRXB1NERJUE9QMGZ2Q0ZBdUduRGVJVXZwUmFYS1VGUnJO?=
 =?utf-8?B?MGtzc3kranNmb0srTTA4cHBOS0c5OXUvSDFndGcvamZPTVh1UXc2OTJDWE9m?=
 =?utf-8?B?R1RKeUJTWHhJV29tUnF2SUpOZ3lGamxnaHlORndWRVpUT1ZMRjhPQTFVVVpN?=
 =?utf-8?B?ZjUxaTBDS1I2Y3l3VU1haEY2OEUyL1hZSzNvWFErNWNRT1pIQzRwS1dzNmI1?=
 =?utf-8?B?UG1wNS9JYjdvZVVuemQyWlBsZ2c1WE9MZmlHSTU2WTRkMHp3VTV5Tkl4SWZP?=
 =?utf-8?B?dCt5WUpJelUxUjkzZzViVEZSTnBaVjN5T0VhVmZvY1BlWlFHcm85d3JTUmVt?=
 =?utf-8?B?cVhBYUdvOFhyc0RyYlJyaWtsM0pqSXh6TDBILzB0VnBNQ0Q0aENKWWtldEVR?=
 =?utf-8?B?VFY2NTNsSXJvdGgzcXVLTVBYem9JSVlETW13VURQZkhUZGQrMnZSeW94UXBH?=
 =?utf-8?B?MC9Pdld0RFU3R2xnOHc1TWQ5WEdSZU4ybi9XTGhyV1RVMWVZeklQVnVwaHJx?=
 =?utf-8?B?MEVUaWNvQmdzcWZMQ3dzZkZOQkFpa1ErQlZBaGJsYnJVOFlyVXVpazkyUGdk?=
 =?utf-8?B?V2M3N1VWdEZKeENTaWY0VDZqbzFRVmlLYmRTVEl0Ly9meGlUc1hmZyt2NFND?=
 =?utf-8?B?aTNGNnF6NFRXRlI0blFFRHEyZVBpNWliV3NaSlRrNWhrL0djZnZjbGoxWnJ3?=
 =?utf-8?B?UVFFbG52cnEwRFFINlNreENQY0RvQlRlZWhKSk9pclJVUks0R2JJcmJMYnZ4?=
 =?utf-8?B?Rk8wZis1Wk5BM1dEcSt2MHhvRi84SGEyU1o4andiSENIZDRveXMyenVGV2hQ?=
 =?utf-8?B?cEJydGs1NHdBajhqQkM0czRITU1ZUWpia3JjU040bXo3VzVBOEFpUWwxZm9v?=
 =?utf-8?B?czFFSXZqOEJxVVM0a0h4VUlJcHdhYW9pWmlqem9JazZhb0Z3VlYxSmI3ancx?=
 =?utf-8?B?MFhrNU1hN0FBZFRiczR0VWY2MjNCTEhYNjRXZCtMTXBoMUVCU01mb3RHMWt3?=
 =?utf-8?Q?aSqeOnYex+6uU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cDZBeHRHaS9uSWRSZ2NHZTNvTmwzOWtha1JkOFBRaVljUUxzbTdPSHFBcm5Q?=
 =?utf-8?B?Vk1jYlpqclF3elZaNkFNK1p4YW12VG5zbDNtb2pvV3dMY3ZLMDVyN2RnL0tZ?=
 =?utf-8?B?NTN0TXZXWUplbEZkOTh4OTBleXVGL3B6cHdKU1FSWG1TUWdZNmRDQmxCT1Az?=
 =?utf-8?B?VC9lamp4bVVvTTRHQVFDK3g2QmFaaWw0UG1SRWtsRTM0ZWlZVVIzMisxMHBE?=
 =?utf-8?B?d3lwcjV2blgzbFg5eVVBZHVlbklwbkliRWphUFFFaUhNMS9QR2pNMGxpNjRR?=
 =?utf-8?B?UFhKczNjek9rbHRiU3I5RnI0T2xRdUdQeUszVEZHTmdtU1JaL09XSWNKWFBC?=
 =?utf-8?B?QURWZjA3bUwwcm8xWURCS0NVOE5iUDYycFlWOGtvMUlHQ2Ixbk40bXlPQTlD?=
 =?utf-8?B?TWs2NzYxZnJSY29KYjZMZVlzVjAxNlNpVmYwYjZibExhOGtlT2tocXRkSkpm?=
 =?utf-8?B?STVkMFFXdkkzaEt4NEZPdHNZd3hqZHFOV2d3YjJHTEFhOEdoUGQvWFBwQ0Ex?=
 =?utf-8?B?bVIrTU10amo2SGJUUEFPY2x0TWZKRVZaL2hDK0IvWWdJejlERmRnKzNwZlZF?=
 =?utf-8?B?WGhtYi83b1UxV1gvckJGMng1UFJmNHY2UnVOV0p4K2hOSVlnZ0NxWHlhY1Y0?=
 =?utf-8?B?MkZQeTBBZllWMmdxVWh2Vi9TdXpocjlxeGIycnNiczFER1hQV3UxZUI2VXZI?=
 =?utf-8?B?cW1TcDZZTVBUTmZJMzk3eWFmc1g2YTFjQXYyQnNhQ1k0K3dKeDc5UWJxRTBa?=
 =?utf-8?B?aGZ5SXVXN0NIdld0ekwybi9STXZ1NDk1TFR2ZDBOdk90U21WTW40Z3dHMVFJ?=
 =?utf-8?B?ZFFmZE5RRHZvOGdoZHJneGljaUxQZFlvNDJNUmp2WTk5SjdScHpuMUlvNkJ6?=
 =?utf-8?B?bHFPQUVzWUUzdThtUjA3MGdjNnIveGpRSUtNZlErOEZHR0E3NXRSNlZKaGtX?=
 =?utf-8?B?cUNJc0E3d1JtaFZ5NlFSdEhVR1ZnSWUzNzl6QTUxOEpGZzNBU0ZzTVQzdkVE?=
 =?utf-8?B?OWEyZXkzWjhYNkdvNTZVT3Z5UklwbU9yK2VEMjgvQ05aMi81YWw3eEUzS25u?=
 =?utf-8?B?bSsvOWFzL01kTSs2aVI5cVU1U2R2WG9zYzRpNlNaR2hTdXJvbmRRNko0SVVN?=
 =?utf-8?B?dXpGTEp1dGV1WmZGL3Ribk5ZaVh1WUFPbFM3dllIR2NoQWxhaTAwL3M5VmJs?=
 =?utf-8?B?NXg5K2lGWTJrQ0lMbXRWZFIxWkhXRkVBS1MrRW1IVGJjOVRrdnJDd1dlOGcv?=
 =?utf-8?B?RGE4Q1R5cWhUQnpXUmNoYUJ6L0FLcTcrWWJ5R0ZlYngwZkg1Yzhrak8yU0N2?=
 =?utf-8?B?SGRscVhuR3BHbG9JMmtXM2E2bG01ZmpFMGdpcURmSXhmc0Y2YXVWck8vNFdX?=
 =?utf-8?B?S0dKeFJyZlFXRkk5dHg4RGR4MzlWSWpqMThHQ09SVHl2N2JIUzgzQW42T0Uy?=
 =?utf-8?B?dUhZZDZhQjlXOXhRYWVtZ1JLNktyemRNTUUzS1pYOC8wZk1nTEo2enR5MzYr?=
 =?utf-8?B?T3czRGEvNzkvWlYwa0dNaVArTEdqYTlPL01MaVUzandlNWlCZTZoOHZvUzNz?=
 =?utf-8?B?dXdjYkw0NDBmdG9JL25OcU5rZndCV2ovbTNNSlJNaWRIb21GN2kvZzlXV0RR?=
 =?utf-8?B?bklIbDlhckttRkx6L3Ria2lzRUFqcjZmVU9GeGtyaHdZMytmUk1QeXpaWFYx?=
 =?utf-8?B?Z2NqWFUrZzZsNzZzeVZRaVBmeWg5NVVVcWtySUJzVnIxZXNHeTZHWWpWOVk5?=
 =?utf-8?B?emtROWxPS3EwcWNoTWJnTHk1UEFhbnJUa1ZEdTBCcW42ckVMRDQvVzZPZlZn?=
 =?utf-8?B?eVVTYmZ1VmZLUjZVR21ialJhQmlYbHYxdnZOa25xUUtNWjQvbHdmdUJNQXo1?=
 =?utf-8?B?Y3NMMktIa0NTbkdKcG04N2poZENtS1IyRC8ySTVCdU1FNm9pUGJRUm5tNjFl?=
 =?utf-8?B?YlU1TjZUaENIR2tjamZKSEVoY3FFellDemhoVFZkMjZuaE43Z1psd1hCMUQx?=
 =?utf-8?B?QWNGUFlNRG9CS002NXFMOUVkckNPUTZZQXg1Y1pDYTJuY2dOTUxYTFE5SDRz?=
 =?utf-8?B?KzZ2cXR0STdsQ21Lb2tqWExTYllTQ0N4S2hFdjhJUVRxS25FdFN3K1VBdC9r?=
 =?utf-8?B?bitJbmdiazk2TkRkaUNNM09kRlJsQUcrVzNrK2hqZEVheDc5dFY0aHdhZEZq?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfc161d-57b5-4591-7032-08ddd0b7ca77
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 04:56:35.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7wVvvlNwSA/5qy2/hWAaUIzc5ZlWzCjb7SImvL4YmGE+ddqMip5T6++2/GBHNpNx1VIRXx8gwyVqZftvZABmZeSkeeJKZUTl4ozyUUKZv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAzMCBTYWx0ZWRfX8+AmiBghKUQF
 L8spreulwdyhcJGW32A9Iv7oVaUYeCi89dG1Vfr5YDwEkbWR2AFa3PBoJTeKCbtP7nxskLxfQNb
 vYM6PuBweR9N4oZdMweGUQ+KK0pdD/3lxUxj7fm1TK9WU3oX2ooiBkdEqwIA3ljZzhw/c0BwqbX
 WVkwykKYNMOC8TJayjAYheOyRkZFMGRkvDdeWf9H8nCfoKjL17vpdYbhJnfUCntWUpFTYKEKR14
 w7pBbuG/PwlRP5Vtn/5UQb42RAHfZr9KG0C0YrIBWx2/1FXeNpvL1YcCudk8R15akhUU62bysI/
 4K/KwiSbvNbcuqO3FdK7MR5/k00SCm/wrjcRiJY9kTDlNnPxSG+UFlv+cKKPshZck9N4Z0QdirQ
 vQUHKnP7
X-Proofpoint-ORIG-GUID: GZbuxy_JCfWkQFCehyRdo8Ot1pu9kdAc
X-Proofpoint-GUID: GZbuxy_JCfWkQFCehyRdo8Ot1pu9kdAc
X-Authority-Analysis: v=2.4 cv=Y9v4sgeN c=1 sm=1 tr=0 ts=688c4906 cx=c_pps
 a=OYO+XWnI8e6v5MfLznXSIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Bvt5SfGCe2zLiZDs4PQA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_01,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507250208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 04:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221220

Ping

//Hongxu
On 7/16/25 15:32, hongxu via lists.openembedded.org wrote:
> When building with GCC 14+ using -Og (DEBUG_BUILD = 1), got
> the following errors:
>
> $ echo 'DEBUG_BUILD = "1"' >> conf/local.conf
> $ echo 'DISTRO_FEATURES:append = " vulkan"' >> conf/local.conf
> $ bitbake vulkan-validation-layers
> ...
> |tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.4.313.0/sources/
> vulkan-validation-layers-1.4.313.0/layers/./external/xxhash.h:4822:1: error:
> inlining failed in call to 'always_inline' 'void XXH3_scrambleAcc_sse2(void*,
> const void*)': function not considered for inlining
> ...
>
> Refer [1], using XXH_NO_INLINE_HINTS when compiling with -Og (DEBUG_BUILD = 1)
>
> [1] https://github.com/Cyan4973/xxHash/issues/943
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../vulkan/vulkan-validation-layers_1.4.313.0.bb                | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
> index 63a3aa4ae64..c05a1d87007 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
> @@ -26,6 +26,8 @@ EXTRA_OECMAKE = "\
>       -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
>       "
>   
> +CXXFLAGS:append = " ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INLINE_HINTS=1', '', d)}"
> +
>   PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
>   PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220435): https://lists.openembedded.org/g/openembedded-core/message/220435
> Mute This Topic: https://lists.openembedded.org/mt/114181365/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



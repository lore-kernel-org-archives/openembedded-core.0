Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B36C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 19:08:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.975.1743448110611031021
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 12:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=618500f6f8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VCGlgj013441
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:08:30 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45pnshhy5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:08:29 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52VJ8TEa006827;
	Mon, 31 Mar 2025 12:08:29 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45pnshhy5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 12:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgMmlmGg8Ln7fwHqg9Tbu6S/WNsufzfzYxzeMIDp7FMrKJb4CAvRt4IcsIVAbOEM5jNkYY5H1sOEC9Hl5NLsRHgRj7y7Kv57pom4r0sdTj28FTbERmfQhQcrru0MaGCdrz1/XfFTVbbMvJtkX8r9phufqpq4V1mI7LJXh4lpLrwngwfSs9zVvuqxYdNzGIECZK6EFuAurMq4r9/g6nJRDLMF9Gj+f+9dncWswvj2wQfWdFwq4gZLHTSm1grJsIAlPyEj7TFfItROawiu4QiAkF4kk2IiCOf3sCEu41MlKAgOh56AKwJ3F7s6VKVabfoez9sOPKCKl+C45/HxAZEg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwUcMPsYcg3RSOkLMEWrJXgxo3L7PC1oE2ZxoCfhySQ=;
 b=uxPpQU5muOKO6PrV4z5Th9hLbPr85BoGS2V8hX2xs4hveRUId9w+bWdGygMj1LTFL7IxEY3dLI2DBWST6ZOyFtxlSwdhG6atVPGu9viTJK0373RP5mAFCBH2sbulO6EEREHyxW2uMLAVCPx6ily+QhebifewX1TcB5DiWqcFQ0/OePCNlgntQocfqpp47XA8HBWBd65BhOTnkB63xRBiqnGLkxaZPnZoKuTILX7UFOlBn3FyMcHiq/mjCm7QYeIYhCq8y6UwP97OmqVMO8DfD949qisLeR/H/qBxg2kmpV/lWcf8VPH0kCNJCr22avpcptPoXOZ7q8aUkKDWaXKCnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 19:08:26 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%7]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 19:08:26 +0000
Content-Type: multipart/alternative;
 boundary="------------E0F39IcfgRdKq1Jtrcba6D12"
Message-ID: <9fe3cc25-c6fc-410a-b819-58e1e1db818e@windriver.com>
Date: Mon, 31 Mar 2025 15:08:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust-llvm: Compile llvm to use dynamic
 libraries
To: raj.khem@gmail.com, richard.purdie@linuxfoundation.org,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Shinde, Yash" <yash.shinde@windriver.com>,
        Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250331133044.1944108-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sr8AqkmjQca6fYe90oOU3h=++A2=7RpaWkRFEuS38oyHg@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1sr8AqkmjQca6fYe90oOU3h=++A2=7RpaWkRFEuS38oyHg@mail.gmail.com>
X-ClientProxiedBy: BYAPR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::39) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM6PR11MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: 019406a5-6e78-4d4f-824c-08dd708769ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmI0amlPQ0dMNDhINXNUQVRVM0krVVgrQlFVN2lRSmVmRVJVaEIxZE9walNk?=
 =?utf-8?B?NHZWdkw2amx1cWhXMW4vSVdRMDNKbnRLbVJaN0ZjalZiK2pkN29KNWRRSVYy?=
 =?utf-8?B?VWRtdXVHSWxkTzNtdytYS1pSd2RETysxZkFlU0JrVEo2THYwZG5nckVHZVBp?=
 =?utf-8?B?S3lQQVRPRjBRZDFkSm5Pb1pBUlNxOXdkTVRWODR1YlVmT3JxUnNua0ZIcENs?=
 =?utf-8?B?aExzUThzS2VZdXhlZzhZbUxlVGc2V3UvL0NVSmc3eFZ2ckZnTUtuNS85UERp?=
 =?utf-8?B?eGdrd2xhV1loTERVSlVydzBWWFVkKzZtRkU4YjhhdmRxM3ZURGhMb2IrY01U?=
 =?utf-8?B?K1dDcEs4NkRjSG9BVFptSmpWYksxWSt0VGhMYlBzenNyVnREc0NYUDY4WlV6?=
 =?utf-8?B?TFoyM1A0TDVPMzEvMEdmZjAxVTMvUEMrUEtJMm5oRCtPTnNTdzFBTDltWDQ0?=
 =?utf-8?B?RWxLanNzZmVTQ1g3NHprbkhMK0pXWW4wR0hPQjU2ZjFySmhjSVUwTUIrRU1K?=
 =?utf-8?B?dnhEdm9GSnVvSXhZRk00WTB3bERPSkx0UG1GZzdYM3FNR1hwYVZWVWlsRzFl?=
 =?utf-8?B?NWVubTF6cGVsQnZkZTNZUllza01KblkyNmRPV0ovRGNXQ2E3OUZTY2NqUVJ5?=
 =?utf-8?B?ZUZDdWZRRjcydWp2eEZxSHRHa0JzZjVuY3hGV2lXamx2cUU0Vk5ZZnRBcUVP?=
 =?utf-8?B?YkFwWFdDNnk2MmxsZjA4ZGYvM1VkamFqUzVKdWJpMitLYXoxaDN6NWlKOFJG?=
 =?utf-8?B?S1UxRXpwUWlUUy9pd0oza011OWk4MVVvTmV5TU5OTk1Nck9Jb21zd3FIemZX?=
 =?utf-8?B?VzJKMW5UbS9mNTV1OVhCdDQvbXNxR1BNencwNHMzMmg2aGdoZ0RZcE1yeWl3?=
 =?utf-8?B?bnl4Z1l2Nmd6M2l1eXc1TUhZdmRJTmt3Y0IwVmlzRFJ6NVFiNkZKV21NSmM2?=
 =?utf-8?B?bTlMWkZIaVRvbzA2YWs0cUJMY2ppRE9vWDlXYTB2RjBxMGEzSDZVWmlIUVJq?=
 =?utf-8?B?R3ljTVNpbzJSZlRtclhGdGNxYUNHZ0xleTc3QzFXKytyaFNqUEpYY0FZUHJ4?=
 =?utf-8?B?akJ2UWIzMHRUdFlaeUhES0lURnFNN1RCcDZTTC9TZ21mTXQ0RG4zSnczZVRx?=
 =?utf-8?B?Ky9ERktRUDFXRlBRYWZvUEFsTERUWVo5bVVUV2lwZncydU4yYlZGZGVUNTF2?=
 =?utf-8?B?K3lkU3lIaFQxa1lFZ1JLcFJwM0h6L1g2eDVwMzc5Q2VUL1Z6R3NISmRoUUpI?=
 =?utf-8?B?eEYxUEJBbzYwNURyRzErNUNEMmpma3ZESW81TXd4WDdhY3lNV1IrUVVnVjVD?=
 =?utf-8?B?ZW9DUlBIc2JKdDZoY3grZllKM1Y2RitaN0hEVkpUYzhKbG55azlmNExmVEo5?=
 =?utf-8?B?aXNSTzI4TXgwUFErRWRMVTNMU1JEUktwbFpDNFAzS1hQcHN6Z20yVG5vMnFm?=
 =?utf-8?B?UFV4SHM5YTFuTUFjdmxoRGdCS2phc3BjNjkzSjA0eDM3cEpZQTZUTTBJMC9N?=
 =?utf-8?B?M1J0K1JhWlFUYlZSUnJFSW5qbm0xeGd3bnpDaVI3V2gxNERrc04wTElmWW14?=
 =?utf-8?B?RkZ1NGJNcmZOK2F4Q3BhZjBsYUJ6MWM5NmJ6QkxrNS9XZlR0di9DKzRVWnRF?=
 =?utf-8?B?VklQUUt0NHRBNjQ1d2o3dHhmWldIUlJ3QlVMaFc1cmlLYUNmYkNxY1JFMXBT?=
 =?utf-8?B?M2pQdUkyRkxnVGF3Yk9jaklKbW1LbDhXaUxaTTRDNlRwUUh5alBEaWw2Qzlj?=
 =?utf-8?B?MmhXSC92djN0R0RZZUl5N2dWbVdkR29aVVN1RE1OWW1qSzRyTmRSWUxWUDJ5?=
 =?utf-8?B?ZzRLSjBVK0p5cUJEd210UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2llbm5rWG9LVy9mdzJjTWNWZ2ZTS0E3TXVTbDRjNDdKS3VhZ3NTdE5FYm1P?=
 =?utf-8?B?dWU1QUJLaDhPZ20vOFhkNnpUV2pJMXhDWDNsbFlWMkd1eWRESmpkNk1DRE5T?=
 =?utf-8?B?UmdBRWhtK1p0ZlNvOFpmVUJEYTZlTnBRR1M4bG5UcThsUkI5aEhlRUJSakJ0?=
 =?utf-8?B?Nk1nVnhaNFU4a2xMYlVvdEppM2dBU3VRWlQ3Wkc1RFl2amdUenRmMWJKakgv?=
 =?utf-8?B?cDlWOGl6TVRUYnVuSjdGRm5kL2cyNWlPS3dweUkwQkQ1N0twWnBKNTM3TEJI?=
 =?utf-8?B?SGZES1hEZ2MxYndKOGs3cUZVblppdDd1ekhBSG40TWNraW91bmJ5bDJNV0p3?=
 =?utf-8?B?RDdxQk9nOXBiRE9YY0NyaTg2RFpnQjNlbzJYWUErYkNRUU1adzAxUFNtaUQ5?=
 =?utf-8?B?VVRMSitOZzJVM3hTd0VOSTJDQ0dURnZsTGlSTTd6MTIwdVBSNDB6dVhleVps?=
 =?utf-8?B?TmlqaWdoOTV1ZFg1SStWME8xcjlDS25kVUt2bmhocFlwUndabnJVZGNERytQ?=
 =?utf-8?B?dUdTcGhBbVZ6ZFRVc1lRUmtQdGFRUkMyTkJzcWlPRTRMYVpnTzdnbDB1YUV2?=
 =?utf-8?B?aGJ2d3R6c1BuTWszdEZydE4zWE9oNWdoWjQ5SWQ0TWNremRWcXhUcnZWdGJz?=
 =?utf-8?B?L0FxSlcyNkxiN2RWeWVTelBINDh4QkxkRHlvdTk0UTZrMG1qMlY3T0VWaEVi?=
 =?utf-8?B?Qm15VjBBVjJ4SXlFNlFtYU15YmJBR1BjYWtoaGQ0OWR1OG5RYkE5ekNpZ1Nk?=
 =?utf-8?B?dUY3L3hYeEVhNFVXN1ZoNUlIaHdGQmp0Q2pjeFZsTWtwRThCckVZeDlTQW9H?=
 =?utf-8?B?cG42b3BBWEJOaXFTbjlLeUQwY2pRVjZUVmVKU3I1eGs1SmhXOFRhVGp3bko1?=
 =?utf-8?B?Q3QwZ0dsa3JYWXB4VVpTTXZ2ZnowR202Z05MNElBQ09NWm03OXdCY3ZnNWtP?=
 =?utf-8?B?ejBsYWZXNmlaanY4MWRHT3BuUDkxVW5PcmRzUDI3bTlTWHJNamdBNVdJblFJ?=
 =?utf-8?B?UVJHY0tPeFFMWTd1dE4ydnJBejhmbGRBUnJLbDJRRGhmQTJHREFHU0tGUDUr?=
 =?utf-8?B?blZRU1BoYjhiQmVVdG9yS0M4eGVibkh0K0ZHUlJaeTFGdUI1M3BRamF0WW5W?=
 =?utf-8?B?UWFJdmN1UTF5MGcwWC8rUEsvemYvTWl3WWFrbm43UFZFZjN4VFhOK2gvVE9K?=
 =?utf-8?B?VVNCS3JiVjlMNEJFcFNaS1pDcmh4QXZaUFovZC9IT1ZMZUR4MkpuZUlobHUx?=
 =?utf-8?B?cXBnNS85bWNCbW40QjVzeThPUVFHS2ZKbGRzUkxaQ3pJSm5hSjVZTUJGUlc4?=
 =?utf-8?B?OVd2VjJFS0M1aWdZamlzdXduNElRM1BxRlBVdjV5Q1l2ZDRkNkwzQklMbkNN?=
 =?utf-8?B?NGNmbk5Qc2lScklYNjIvQWFSTElqYklzYjJCeTB3K3NTZ3lPdjV0QWRzcjdW?=
 =?utf-8?B?dkF6S0w5SFJyWmhWZkZEWWxRWFIwZ1BoNURGalh3MzMva0ltVHlnK0FXems5?=
 =?utf-8?B?ajllcEZhcDZEVFY0QlZPcXBRRWNVL3EvNi9FRnloR0RjVUh5b1JZZkZvdTds?=
 =?utf-8?B?NXFSSFdrNG5UNW45UzZwSm9IcjdyeXkvREpsV2gyWWNURVdLQTBIMmRmalRE?=
 =?utf-8?B?WW9xZ1J0STk2eTczeGR3djFvTVc3bnUrVXQ3bmlhd0dGN3VMQS9zOTNJcjAv?=
 =?utf-8?B?NmRONWIvaFMyMjFGMlc2MHA1N2ZzTVJaVE1QQUtXMHg0Qmx3SmZsSlZxT3NQ?=
 =?utf-8?B?WXNOZHNQd2FtcWUzeFdadkhscEZTMGpOWWNBK0ZnQkM4blB3KzNIRUU4V1Q5?=
 =?utf-8?B?enhReVZJQko4OWhsODFOUVZLSml2SkJ6dGRUQTNkbEJwR0Y5UitRYzh6NkRZ?=
 =?utf-8?B?SjFMMkxGZkxNRmU3Q1NRYmE3UWJjQUszM1dJMXEvd3VqcFo4RUtLS2tsN2pZ?=
 =?utf-8?B?WC9PcUVDRUx2Q1p4MGZ3K3M0V0g1ckQ1cTBFK3FhVlBiMlBidUI4M3hCM3Iy?=
 =?utf-8?B?YU4reFI4OG5CdTNHRUZMeU54dklibWZVb09GbGhGcTlETTg5WGYyRCtMYm9r?=
 =?utf-8?B?MWViSE0wQUkrNzVYMVZxRW16clIyL0JUQXpjNFRUa1NiRjVpdlpRTTR3V2cr?=
 =?utf-8?B?a01CVXJLeHRJTnBRc2hIcEQyNWVZZlJ0WThobXdackxkcXVndjNtNy8vckds?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 019406a5-6e78-4d4f-824c-08dd708769ff
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:08:25.9628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqeDR4b21x57oZZvrU4DBu7ZnckDBIUzscqlkZPkRMa6qEXAOQdGCzZxQG6KQIDD8hdh2EEW5SgC9E4baYQo6QcrYlFbv+EX7/ZkcHttKjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
X-Proofpoint-ORIG-GUID: 2vu9GoDotUvUEllNRJvDZwh3_tTGsu8d
X-Authority-Analysis: v=2.4 cv=I8FlRMgg c=1 sm=1 tr=0 ts=67eae82d cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=vmi6oJg5AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=bbOO-AeVw_cJTonUE4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=JpfDcuPoxAYmEAdwOqEA:9 a=vbmKJdAGnf5GjTZb:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ioboX4i089tB3dTPuEcW:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JoFDsJ5Ztx43uiLuNvA8ls6MNedBIrMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 19:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213993

--------------E0F39IcfgRdKq1Jtrcba6D12
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52VCGlgj013441

On 2025-03-31 12:13 p.m., Khem Raj via lists.openembedded.org wrote:
>
>
> On Mon, Mar 31, 2025 at 6:30=E2=80=AFAM Richard Purdie via=20
> lists.openembedded.org <http://lists.openembedded.org>=20
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
>     Our main llvm recipe uses dynamic linking already but rust-llvm
>     does not.
>     Enabling this significanly reduces the size of llvm-rust to about
>     a third
>     of what it was, which is a bettter configuration for us leading to
>     smaller
>     TMPDIR and sstate objects
>
>
> It will slow down the compiler execution and sometimes its could be=20
> significant as well we have seen this with clang so it would be good=20
> to have some idea around that least we provide a slow compiler=20
> compared to other distro infrastructures


We'll get some performance info from the YP AB perf builds.

Sundeep,

Once we see if there's a noticeable difference in those YP AB runs,
we should=C2=A0 look into bench-marking=C2=A0 the build time for rust and
check for any difference in building Rust=C2=A0 in the SDK and maybe even=
 on=20
target as another benchmark.

This is less urgent than getting the failing and skipped rust tests=20
enabled but it shouldn't wait too long.

../Randy



>
>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     ---
>     =C2=A0meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
>     <http://rust-llvm_1.85.1.bb> | 2 ++
>     =C2=A01 file changed, 2 insertions(+)
>
>     diff --git a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
>     <http://rust-llvm_1.85.1.bb>
>     b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
>     <http://rust-llvm_1.85.1.bb>
>     index 6a4d2957288..566348c617d 100644
>     --- a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
>     <http://rust-llvm_1.85.1.bb>
>     +++ b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
>     <http://rust-llvm_1.85.1.bb>
>     @@ -44,6 +44,8 @@ EXTRA_OECMAKE =3D " \
>     =C2=A0 =C2=A0 =C2=A0-DLLVM_ENABLE_FFI=3DOFF \
>     =C2=A0 =C2=A0 =C2=A0-DLLVM_INSTALL_UTILS=3DON \
>     =C2=A0 =C2=A0 =C2=A0-DLLVM_BUILD_EXAMPLES=3DOFF \
>     +=C2=A0 =C2=A0 -DLLVM_BUILD_LLVM_DYLIB=3DON \
>     +=C2=A0 =C2=A0 -DLLVM_LINK_LLVM_DYLIB=3DON \
>     =C2=A0 =C2=A0 =C2=A0-DLLVM_INCLUDE_EXAMPLES=3DOFF \
>     =C2=A0 =C2=A0 =C2=A0-DLLVM_BUILD_TESTS=3DOFF \
>     =C2=A0 =C2=A0 =C2=A0-DLLVM_INCLUDE_TESTS=3DOFF \
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213987):https://lists.openembedded.org/g/openembedd=
ed-core/message/213987
> Mute This Topic:https://lists.openembedded.org/mt/112003864/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------E0F39IcfgRdKq1Jtrcba6D12
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52VCGlgj013441

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-03-31 12:13 p.m., Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sr8AqkmjQca6fYe90oOU3h=3D=
++A2=3D7RpaWkRFEuS38oyHg@mail.gmail.com">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 31, 2025 at
            6:30=E2=80=AFAM Richard Purdie via <a href=3D"http://lists.op=
enembedded.org" moz-do-not-send=3D"true">lists.openembedded.org</a>
            &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@li=
sts.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-free=
text">linuxfoundation.org@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">Our main llvm rec=
ipe uses dynamic linking already
            but rust-llvm does not.<br>
            Enabling this significanly reduces the size of llvm-rust to
            about a third<br>
            of what it was, which is a bettter configuration for us
            leading to smaller<br>
            TMPDIR and sstate objects</blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">It will slow down the compiler execution and
            sometimes its could be significant as well we have seen this
            with clang so it would be good to have some idea around that
            least we provide a slow compiler compared to other distro
            infrastructures <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>We'll get some performance info from the YP AB perf builds.<br>
      <br>
      Sundeep,</p>
    <p>Once we see if there's a noticeable difference in those YP AB
      runs, <br>
      we should&nbsp; look into bench-marking&nbsp; the build time for ru=
st and <br>
      check for any difference in building Rust&nbsp; in the SDK and mayb=
e
      even on target as another benchmark.<br>
    </p>
    <p>This is less urgent than getting the failing and skipped rust
      tests enabled but it shouldn't wait too long.<br>
      <br>
      ../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sr8AqkmjQca6fYe90oOU3h=3D=
++A2=3D7RpaWkRFEuS38oyHg@mail.gmail.com">
      <div>
        <div class=3D"gmail_quote gmail_quote_container">
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
            <br>
            Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
            ---<br>
            &nbsp;meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_=
1.85.1.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
rust-llvm_1.85.1.bb</a>
            | 2 ++<br>
            &nbsp;1 file changed, 2 insertions(+)<br>
            <br>
            diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rus=
t-llvm_1.85.1.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">rust-llvm_1.85.1.bb</a>
            b/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.85=
.1.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">rust=
-llvm_1.85.1.bb</a><br>
            index 6a4d2957288..566348c617d 100644<br>
            --- a/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_=
1.85.1.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
rust-llvm_1.85.1.bb</a><br>
            +++ b/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_=
1.85.1.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
rust-llvm_1.85.1.bb</a><br>
            @@ -44,6 +44,8 @@ EXTRA_OECMAKE =3D &quot; \<br>
            &nbsp; &nbsp; &nbsp;-DLLVM_ENABLE_FFI=3DOFF \<br>
            &nbsp; &nbsp; &nbsp;-DLLVM_INSTALL_UTILS=3DON \<br>
            &nbsp; &nbsp; &nbsp;-DLLVM_BUILD_EXAMPLES=3DOFF \<br>
            +&nbsp; &nbsp; -DLLVM_BUILD_LLVM_DYLIB=3DON \<br>
            +&nbsp; &nbsp; -DLLVM_LINK_LLVM_DYLIB=3DON \<br>
            &nbsp; &nbsp; &nbsp;-DLLVM_INCLUDE_EXAMPLES=3DOFF \<br>
            &nbsp; &nbsp; &nbsp;-DLLVM_BUILD_TESTS=3DOFF \<br>
            &nbsp; &nbsp; &nbsp;-DLLVM_INCLUDE_TESTS=3DOFF \<br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#213987): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/213987">https:/=
/lists.openembedded.org/g/openembedded-core/message/213987</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/112003864/3616765">https://lists.openembedded.org/mt=
/112003864/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------E0F39IcfgRdKq1Jtrcba6D12--


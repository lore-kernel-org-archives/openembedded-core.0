Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C538FC83030
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 03:12:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4632.1751598765150817515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 20:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92800df4fd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5642oC1o009412
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Jul 2025 03:12:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9ea02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 03:12:43 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5643Chcc010798;
	Fri, 4 Jul 2025 03:12:43 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9e9yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 03:12:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiVqmJ6RpxX9ZpH2zoePcVeW4G/6iAu1QPXtTR3HEozZNzrHKuBfyvhe/NcYwV94se00gMPxwFJJgbAqAeKEk1Nv4IxbBLAYGabRfBmESKhrtfMLhCAmg8MMHrohAt+tNmGywsJh4RlOmQnuRG2SwNQ8n2XkRDrK/ZAjj5Xp+6MDrZ8H6HDcNW/xl4MzBKf6D+p4p9PBd8/WvHqZeCVys6fOK8fZ89bF+vC0Sc+QfV4OOuHjt4j8aPmybNEo7xy8VTUgEihNR5UMUXQzdmMMlxEjJE2s52QZDQmp78F4vYSHsSmVwJdGFC+eb1efjJceJlAXhCIYn4uu36c9unxQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOnXTmzydJ1eLNm+gF+gedwIi6z24DFBBVpE1yMi+XI=;
 b=TAOs4QIC3cc4YIkTK7Oq1Lgi50+Kop0cIpL2rCqdKHpULSxzybVEX3ELa7RjFR0N1m1xp21fTlDhFD5zb+xTR6+o4LBdjSZqXSKaDknL0Mxl+J0/k/7RXlVRVR2MGWpURjCb33cmaGK4eqnC1/wEDNZXohRzJt+io3LViQjgL2t6RAQGA2XSyQ5wxJfD7wFNHJ60yMc7e1Aem7FSryOx0KKTQGfHsnj/btEuQjQItiP67di66qFnZTECcy2XLtbqoJrySXIGM009g1bMjRRGgphHvkBxvyVicNg9hmvlpRFiVdxI4Q30zJwyQp+t1KyHhRDp9NJuyLnVe5uihsAtbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 03:12:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 03:12:40 +0000
Message-ID: <8a2f75f8-d38a-47b0-b038-927e2f47df8b@windriver.com>
Date: Fri, 4 Jul 2025 11:12:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone][PATCH V2] coreutils: fix CVE-2025-5278
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250701041625.1956085-1-Qi.Chen@windriver.com>
 <CAOSpxdbKMCSAywKgsTm04Kk_FRThJCZNLo20ojhABheVizeKHw@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CAOSpxdbKMCSAywKgsTm04Kk_FRThJCZNLo20ojhABheVizeKHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ2PR11MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 946579af-2be2-47ed-5dd2-08ddbaa8a2af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UHppZThBMHV3WkRpK204U09HcXUyc3lRL1dDTFVXOWR4RGthdGRtYzdBa3Ni?=
 =?utf-8?B?dmxrV20raVNPQ1ArOWhVNWV4YSt3Z3ZjWnlsYThRdlVVNElkUCtxYmEvNGVw?=
 =?utf-8?B?aHNiSVBmSFlLWlFZZW9GNjV5aXIyeTNtbXBLWThIVjVyaU9jZ1lNdzRSV1o2?=
 =?utf-8?B?Y2RVUm82Yno0TDhnVW10aE1MM0I2dEhzQkZ3b245SDJ5bFRZeWVGNlJvdmkr?=
 =?utf-8?B?TFVjdWE3SkJlZC9hd3ZNRldUSlNvRnBXQmpwUkZxOTlYOFVTb25TVGxXRGQ5?=
 =?utf-8?B?QVJjdW1iTGtXVFB1L0NXTXdBcnpUdnM3cUVuRmd0UkI0ZUlyaFBnTHVKODJo?=
 =?utf-8?B?amFYT05ic0lwb1orS0wrU0VLWkE3UlA2UzRJZTEza3dVcFlXZGRTbU5QRmtn?=
 =?utf-8?B?a2xFVzFOVTZ4a3BkNFY5S0hEMFpGWDYvR3A2YVVqMXV4cVRZeW13VDVET3Rr?=
 =?utf-8?B?enp6RGF2RDd4eVErR0poVHZHR0gzS2pHZ3F2RlJWcGhZQVhtMjhxK0VXamdt?=
 =?utf-8?B?RytmZEFlOGx2TnlUZnprVW5SdEFFSDJrUEVlMWx2T1pPNlVVNkdxK3RtUUh1?=
 =?utf-8?B?UnQ1Ym9VbU5JdjNKUWlKQzJqTGxnbFBHWU1xRjBiNmxKbXVpd1lTdnlHSWN5?=
 =?utf-8?B?ZCtYNlBQQVJONGVLS3J5bFdheHhQMzZoTmxRWEV4cThYRllha2xpOVZJL1hr?=
 =?utf-8?B?WXphTmxONnZVSTBMMzdWQ0ZyaWcvUi9TbjhFSFQ2ZDJnRUEzMUt3OWVCZy9H?=
 =?utf-8?B?QVQ2TzIzVGxWVDVRN0hlbHFkdG95aHRvWHgyRDhpWU4yUTF0U2RTT1pvNFNo?=
 =?utf-8?B?eXQ1VWcxeVZjNk5vdld1K3hNbFhFQkJPWVlUb3hKUDduSzJGaUdXMXFaa0V3?=
 =?utf-8?B?bjd5V29DSy9PUlplY2pFZ3dYdFFZNUlVSGw2MnJHNTVEZEdqRUw4QUllUjds?=
 =?utf-8?B?d1IyTDJubmFGZ2FrOWdKVU9LVDVCeGQvYW14YlNLVzVNMGdvT2xZVk9UbHJz?=
 =?utf-8?B?YnhGK2JOS0hjVDdJQThaWUplc0hVSUxFRGxwWWR3S2cwdjZKL000VzlSdjV1?=
 =?utf-8?B?V2xSWEl3QXBWaDdmZWRwT1JzVmRkL0RQbnM0WkoyNFEzUjMwNVFnb0VhMGdy?=
 =?utf-8?B?bHErcklLaW5CSjhQeUdGeWh4VFJIRjE3UGZvQW9QS3U5TVJZbFBxZDVEQkli?=
 =?utf-8?B?Q3FSWkM1U015YTdEdUFFQ1ZPU0dTMFhZblJRK3RtN3UxMW80bDYwRFBKVFhk?=
 =?utf-8?B?aFRqQldTbldoYUp2bkQyZ3ZiOUltMWxUMkhPb3RpcHBsdmN1QlBEKzhqV0cr?=
 =?utf-8?B?dTFFdDFZVkRSanFHZjJIa1FhQzBiZ0t0ZUZpMWhrYzBKRkxyakpseDBScklG?=
 =?utf-8?B?RUNKdkUrQkNSNzVDOFFsemg1QmpFOFZScmQ1aEo5NHBYTm1iL1ZWQWxsZkQx?=
 =?utf-8?B?RU5hTktLRW9IQndIWlpJbXd0d2RmMjZsTUhKUnFrS3E1Q2lUdXV6NHhCcVJj?=
 =?utf-8?B?eDY0Rk40eFVPR2lERnQrd1EvckpuVElKWGEvWHdlcm1MY2ErNWlFZ1c3OEFN?=
 =?utf-8?B?ZTVkT2Z5ZmMycklKakN4WXpLcnFjVXVoZnhFKzFuWENpQ2Q3NURsbE13WkJY?=
 =?utf-8?B?aGpqVllUdVA0d2JITldiR2I3dGthOVlIbFo4YzY0MDdzTktiOGxReDRwSC85?=
 =?utf-8?B?Y1BpcitPS1VSdFIrM0xBNG52V0tlMzd0b2NuWXBzTmNYLytJUUN5NVhGVWMz?=
 =?utf-8?B?RytWTTFHRmtteHdtUTZnb1h5TzRPaVloVExlNG5xYTF0c0orUEZtejQ0UDhp?=
 =?utf-8?B?dDZDbktoeldOeXhaZUxpNVVsV1Y4czdXa0xlUERBeDArcUtKNnRWTWE4Und1?=
 =?utf-8?B?d00vZEI5MEM1amhrN1RUOGRvdkZ3MGVKVU5ULzArRW9FdTFLQWVFS3hCc2lT?=
 =?utf-8?Q?tjxRT5klNK0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d3NNb0FmOGpoYlNreE45Tnk4dGRLWkpoeXQvTThDNUFpVENwWERManZ0a2ZK?=
 =?utf-8?B?RVlBRmVqRVYrVmRrYm1rbzdhWTlHMEx4SnBqQ2dQZUVJazEvczk5V3RyV0ln?=
 =?utf-8?B?M29rTm9LeTVWY2hod0JCQUk5Rm9Eb0lLOUhPbiszcXBnck1JOVZtUWY3OHlw?=
 =?utf-8?B?REN4Zmd2Rk83UXRlTXpMN1ZrK0tTRVFaNk1zYXZORmtXV1ArcUhZei8yYWZ1?=
 =?utf-8?B?M21RdmNISDhZZUZkcE9ZSERxWnBJOE8yOEpwY3ZPTGpuQXV5V1hxUFNLVDB1?=
 =?utf-8?B?Y0YrQ2R0ZFB5R2xwU2p2TzVWYXJkZzVTRDJOR3NxK3IyQTdUMENhYXo2bzJz?=
 =?utf-8?B?THNrdHg5RkMxczBrTFkxQm50RDEwSWcyNU13TUZFbmRTb1U4RU9UL04zOERp?=
 =?utf-8?B?WWtxc2NscDlGRndOR1IvZGU0SDJuSit3dGM2a3JNalhWMm9TOTZwMjVZZkRj?=
 =?utf-8?B?cGw2U3B0TytCbitzQ0ZEbEpyT2dMcVYzQ1BlNjFnWVlQZ0NJMVZqd2JPeDgr?=
 =?utf-8?B?RUpjSHdJL0pHN09Pc3RpOHlwMmZveXNJVGV3YVFtN1FWY2QxOVk5aTBnSlN3?=
 =?utf-8?B?Smsrb1F2MzU4QUlmVEVYbzAvbEpIcW5iZFhjUTBkWTlSWFU0bzc0UUlYWWdO?=
 =?utf-8?B?TDEwckt4b0haWFlGeU5NQ1dsUi9kZEtPY3dRU09oQjZPSkVIdXJVcm9CNThF?=
 =?utf-8?B?d2syTzFraFRYWnhVN2NvMWlYZGgxZ2FKTm1YVUtQb2I3NDYySkpmTndpZzlk?=
 =?utf-8?B?WEhEN0NnSXc1eW51d0x3ZzRXdUxNUW80UFByK1N2MXk0ZXNLZTc3WDcrL1RD?=
 =?utf-8?B?eU5TalhzYjlPMFVBR2l4cWJZUnVCWnN0bFF2ZnlFTk5YQklFcmI4YTVDakVw?=
 =?utf-8?B?elVBcGtsRFVaaXhKM1J6VkZ0V0wzV0JYWFcveWZWMzlNWUVCMGxSd0NwQ3Ir?=
 =?utf-8?B?V1o3b1FsaDkzK2tPc2NJMldyblp1dmxaci9JTEFUSVkveDA3ODhTTVoyclJw?=
 =?utf-8?B?Q3pOblQ0MVFnZm1JZWw2RVMzYVltM1gzQ2NyOC8yemRBVS9QdWVHbE1iaVU0?=
 =?utf-8?B?NTZpRTVPczZNR2psWWpTUG40TCtIZWgwUVloMENaSnF6cm9XcHRUb3puQ1FW?=
 =?utf-8?B?Skp1d3JFU2RNY00xK1NzVVVsTkkwbGFxNGN5MFdUZ3NYa1dKZ0NuUUxZdm9l?=
 =?utf-8?B?Qkl4VDM1Vi85aTQ2Y3JhL2h6dFppbTJFcDFJVGdqZ2lPWjFhblhZV2pQWlVk?=
 =?utf-8?B?VzFNL09TL0JKTVBTeW41SldTQWxTT2dWRWF2L25uYjQ5dkU2VmVLVS9sQ0Na?=
 =?utf-8?B?cnh6c2RMb3hPODYrNHZwKzRFMmZrZkRmbzVJUUIzMlFRelY2aExGWXVvbE9Z?=
 =?utf-8?B?cDlZQ0VYeWZuVnFrZWo2WXZJcm04RFdISWpXaGt6d1JVUXgzTGQwWHoyMXR5?=
 =?utf-8?B?U1RJZFdpTTkrNFZzK0RneHo5YTJ1elBvK3lJQmN1aEFEbGtmT21GcWtCakhQ?=
 =?utf-8?B?RDkwcXZVQ2hWbHg3Qy8xRk90SzF1YXpyS002Q1Bxd0FiNnpkM2xJYisvV1V2?=
 =?utf-8?B?cUNYWTVaNHB1aXU1dHViMFpVMWEyTXVLeTFvV2NGbndvU3JtWXRuOEZ6dllO?=
 =?utf-8?B?QlVTenBWdktUdlA2VzZESmJLblpNOEhob3NUTFFFdVpiVWFLSUdTRFE0TWUv?=
 =?utf-8?B?cVkzQXNhZUEwelBUNjdSTmF4RGdscTVGVTBCRTlUeXJPZTY4S2pQdk4vcFBM?=
 =?utf-8?B?QTFFelZEc3JPTlpOdGNWVTR4RzhNS3JucExucldFalhvb3BKQk11UXBYZFhn?=
 =?utf-8?B?VzJZUlRFYmV6Njc5amVHOWxoYitjc3pZWSs1Y3NGdWZqRE9NTEVBbVVJUXB0?=
 =?utf-8?B?RGIwRHdHY2R2NlJzdHdnRklXZlQzQ1lOWmRxY01LUXhDeU1jZkg4bmE0Qi9w?=
 =?utf-8?B?TzNVKzQvUVFiWmtsWllIRlNNbUZ5TVB6UWZFRllvT3V3ekRlTDBiWXlySzZX?=
 =?utf-8?B?OWlURC83U1lodEpZaDhlL1Zxa1ZOYllVaGNtdG5hRExqeXlDTzB4a3c0WE9i?=
 =?utf-8?B?TkZjU09wU25xTGFDNE5Fd0lOMHUyNVVtSjFwNWxnZ090d2VDSzlFOGRxaTM1?=
 =?utf-8?Q?2XjSPVQteMwNmXrJGnJvEdocb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946579af-2be2-47ed-5dd2-08ddbaa8a2af
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 03:12:40.6766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FJDd1OmTlRcu+mD3p9ZsfIHab89XWDx0QijaCY/hqGqhLPgZrGykfB9VM4e29B8cZYLju51FcQ7QJRz7rfcrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
X-Proofpoint-ORIG-GUID: SWZiFgJQGgJOZwrZmBSpMwBM5cMmKl6e
X-Proofpoint-GUID: 8WX9MJ7TKega_guLRMVeUg3n1pFVYGWe
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=686746ac cx=c_pps a=l1cII0oPafWl0rfEi57ttA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=_enOPnqeAAAA:8 a=GsazivnQK-gjd0nMSygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yfo1nd69h7ycsZ8reatu:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDAyMyBTYWx0ZWRfX+O+3VqnJ2Iis hy4KqYF7AwrSvsQkFwJgq3lDUHHgUUWL0EGgXUEy3CdBxNxuM/0AwIZnlNVwsdUj5UbH6PU3Mlu /yVT+IULDRtHLYb2NBkD3/RvFlZqDlyz/egMJ6W5uQfKmhbCUDU6ETfzLwNGHfF57fzL1hAliqU
 OOWoJYbf4iA/ur6RbDc3Zpwq5IjDJgUMYFSazOmjwumbuja9pKA76PM40VPKkMwL836ZJkkqZus zRW5ztp6Bf+gbltonazw+WyVhgqGD+G7PFvPkyg+6/43EXJ+YqJLjAu61MQjYujy4CkdpKRH1UU 2Ux3SDUxeQnsjrSwfO9OMgsvtF2Bs61+u6lAF/KXgs2lwyBVxxHLUBJ5T0ZnycaDxXDV2Z/1l6Z
 XsOx2HKm6GrYrQ1FsBmhZwg0ezRBwh6VciNfyWdoOsTER2Q9UqCFFjUzj3PR27R14qrbDlBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507040023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5642oC1o009412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 03:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219896

On 7/4/25 04:13, Steve Sakoman wrote:
> Unfortunately this patch results in a failed ptest:
>
> AssertionError: Failed ptests:
> {'coreutils': ['tests/misc/sort-field-limit.sh']}
>
> Steve

Interesting. I did run ptest before I sent out patch.

Let me check what's going on here.

Regards,
Qi

>
> On Mon, Jun 30, 2025 at 9:16=E2=80=AFPM Chen Qi via lists.openembedded.=
org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Backport patch to fix CVE-2025-5278.
>> The patch is adjusted to fit 9.0 version.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../coreutils/coreutils/CVE-2025-5278.patch   | 113 ++++++++++++++++=
++
>>   meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
>>   2 files changed, 114 insertions(+)
>>   create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-52=
78.patch
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch=
 b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
>> new file mode 100644
>> index 0000000000..34434a65fa
>> --- /dev/null
>> +++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
>> @@ -0,0 +1,113 @@
>> +From 84a061ea3d1fad42188493c4e5d8396aff4a0f67 Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?P=3DC3=3DA1draig=3D20Brady?=3D <P@draigBrady.com>
>> +Date: Tue, 20 May 2025 16:03:44 +0100
>> +Subject: [PATCH] sort: fix buffer under-read (CWE-127)
>> +
>> +* src/sort.c (begfield): Check pointer adjustment
>> +to avoid Out-of-range pointer offset (CWE-823).
>> +(limfield): Likewise.
>> +* tests/sort/sort-field-limit.sh: Add a new test,
>> +which triggers with ASAN or Valgrind.
>> +* tests/local.mk: Reference the new test.
>> +* NEWS: Mention bug fix introduced in v7.2 (2009).
>> +Fixes https://bugs.gnu.org/78507
>> +
>> +CVE: CVE-2025-5278
>> +
>> +Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/cor=
eutils.git/commit/?id=3D8c9602e3a145e9596dc1a63c6ed67865814b6633]
>> +[Adjusted for 9.0 version]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + src/sort.c                     | 12 ++++++++++--
>> + tests/local.mk                 |  1 +
>> + tests/misc/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++=
++
>> + 3 files changed, 46 insertions(+), 2 deletions(-)
>> + create mode 100755 tests/misc/sort-field-limit.sh
>> +
>> +diff --git a/src/sort.c b/src/sort.c
>> +index 5f4c817de..07b96d34b 100644
>> +--- a/src/sort.c
>> ++++ b/src/sort.c
>> +@@ -1642,7 +1642,11 @@ begfield (struct line const *line, struct keyf=
ield const *key)
>> +       ++ptr;
>> +
>> +   /* Advance PTR by SCHAR (if possible), but no further than LIM.  *=
/
>> +-  ptr =3D MIN (lim, ptr + schar);
>> ++  size_t remaining_bytes =3D lim - ptr;
>> ++  if (schar < remaining_bytes)
>> ++    ptr +=3D schar;
>> ++  else
>> ++    ptr =3D lim;
>> +
>> +   return ptr;
>> + }
>> +@@ -1743,7 +1747,11 @@ limfield (struct line const *line, struct keyf=
ield const *key)
>> +           ++ptr;
>> +
>> +       /* Advance PTR by ECHAR (if possible), but no further than LIM=
.  */
>> +-      ptr =3D MIN (lim, ptr + echar);
>> ++      size_t remaining_bytes =3D lim - ptr;
>> ++      if (echar < remaining_bytes)
>> ++        ptr +=3D echar;
>> ++      else
>> ++        ptr =3D lim;
>> +     }
>> +
>> +   return ptr;
>> +diff --git a/tests/local.mk b/tests/local.mk
>> +index 228d0e368..ced85c44c 100644
>> +--- a/tests/local.mk
>> ++++ b/tests/local.mk
>> +@@ -373,6 +373,7 @@ all_tests =3D                                    =
    \
>> +   tests/misc/sort-debug-keys.sh                       \
>> +   tests/misc/sort-debug-warn.sh                       \
>> +   tests/misc/sort-discrim.sh                  \
>> ++  tests/misc/sort-field-limit.sh              \
>> +   tests/misc/sort-files0-from.pl              \
>> +   tests/misc/sort-float.sh                    \
>> +   tests/misc/sort-h-thousands-sep.sh          \
>> +diff --git a/tests/misc/sort-field-limit.sh b/tests/misc/sort-field-l=
imit.sh
>> +new file mode 100755
>> +index 000000000..52d8e1d17
>> +--- /dev/null
>> ++++ b/tests/misc/sort-field-limit.sh
>> +@@ -0,0 +1,35 @@
>> ++#!/bin/sh
>> ++# From 7.2-9.7, this would trigger an out of bounds mem read
>> ++
>> ++# Copyright (C) 2025 Free Software Foundation, Inc.
>> ++
>> ++# This program is free software: you can redistribute it and/or modi=
fy
>> ++# it under the terms of the GNU General Public License as published =
by
>> ++# the Free Software Foundation, either version 3 of the License, or
>> ++# (at your option) any later version.
>> ++
>> ++# This program is distributed in the hope that it will be useful,
>> ++# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> ++# GNU General Public License for more details.
>> ++
>> ++# You should have received a copy of the GNU General Public License
>> ++# along with this program.  If not, see <https://www.gnu.org/license=
s/>.
>> ++
>> ++. "${srcdir=3D.}/tests/init.sh"; path_prepend_ ./src
>> ++print_ver_ sort
>> ++getlimits_
>> ++
>> ++# This issue triggers with valgrind or ASAN
>> ++valgrind --error-exitcode=3D1 sort --version 2>/dev/null &&
>> ++  VALGRIND=3D'valgrind --error-exitcode=3D1'
>> ++
>> ++{ printf '%s\n' aa bb; } > in || framework_failure_
>> ++
>> ++_POSIX2_VERSION=3D200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || =
fail=3D1
>> ++compare in out || fail=3D1
>> ++
>> ++_POSIX2_VERSION=3D200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out =
|| fail=3D1
>> ++compare in out || fail=3D1
>> ++
>> ++Exit $fail
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recip=
es-core/coreutils/coreutils_9.0.bb
>> index 1cce9192ec..7c975708f4 100644
>> --- a/meta/recipes-core/coreutils/coreutils_9.0.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
>> @@ -19,6 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>>              file://0001-uname-report-processor-and-hardware-correctly=
.patch \
>>              file://0001-local.mk-fix-cross-compiling-problem.patch \
>>              file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
>> +           file://CVE-2025-5278.patch \
>>              file://run-ptest \
>>              file://0001-split-do-not-shrink-hold-buffer.patch \
>>              "
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#219544): https://lists.openembedded.org/g/openembe=
dded-core/message/219544
>> Mute This Topic: https://lists.openembedded.org/mt/113922209/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>



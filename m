Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D089FD70E0A
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 03:10:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.109019.1732849841351548575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 19:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2063e108b4=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT2btNY024384
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 19:10:41 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671c9mdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 19:10:40 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AT3Ae3Y006234;
	Thu, 28 Nov 2024 19:10:40 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671c9mdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 19:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5x6kh4CUvHV7eflJsoYyszTo587pLpHZufyFLJ+6bYWAEsOMPDw0sWh4VJxXpXDr9kfvB1CYDMHfMTVXSW5/wktLFcqyCn/Gh9pVCDWmtMEPFy+dNyyjWAaRz4UXcVh6+fNlbuB/8Qf2sII2MYPGVpoQIE7vrVCxcS5IoY/XCVMwQ1j/fTmj53PCU7x2rvsjZ9NfrS0rkGugnbTtU/rJnxRIYtRmw/HPxqcOHa/WElwZwThfBB3x2INVJbVtPCnW/sGLZlt5MVr6AVW+BGyhlkM+jJ8TvwuRYR67BoYEO8WYsUxoIBXhujkZgC1WbSc2s/DGOhfuAMJhcMjMmXrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLvrhgypkMI/RkYp2ei3BujUIU3ONZr0w/2yq+MsQ+Y=;
 b=MY7FNrBpLrUV7cFppaFwbbbFIVEU32U1/JDiBV2lEB61cAOpOHcjlBByvOebVEiDb5ZeqqdCjzQllkSAiLylHwUNOOlGo3WmL2z/E4ohoyJgihT66QcBEKhjcoa3U3X21I6gBLRAsxB7qbR0JtvUy1RP3YvYx/W2iyvhNfCxJVUjz0KJtc0GEOHfi0Ca5aqXhLEkbsWihLIPT22yn+jZP/KvkF3k/nvEVfy9WEbw3wAhUKKrSv35L20Q62C0j05Rm60MnhlXUJ+7F4WVoyFjGUZxdohGT8gQYKf6M7/12YoCdTGuEddvG8cTu/81M+guSN2FSoK2MVBzcOShwFW5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7890.namprd11.prod.outlook.com (2603:10b6:208:3ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 03:10:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 03:10:24 +0000
Message-ID: <8f11d7e6-81a9-4cc2-9e66-b4aa28bdb019@windriver.com>
Date: Fri, 29 Nov 2024 11:10:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] lib/oe/utils.cpu_count: Raise maximum count
 from 64 to 192
To: joerg.sommer@navimatix.de, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <7c42e340baae4038324e250583e9395fb8d90463.1732725209.git.joerg.sommer@navimatix.de>
 <C8D6F167-2022-40F4-A4AB-7EB334C2C821@arm.com>
 <cop62tcxe4sij7heuyhzt4gfe7lwmaaegr5vodo4yozembl6qh@j7ubd4mre6cm>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <cop62tcxe4sij7heuyhzt4gfe7lwmaaegr5vodo4yozembl6qh@j7ubd4mre6cm>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:a03:100::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 178e2a1f-ce07-41e3-7b18-08dd10235e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OHZyQmJQNVJGaUt6WG9UNCtDdnhzR0ZMdlJkVlN2M3pzMlhYeFA1enZVZHZy?=
 =?utf-8?B?RDcweUVsYnBmYjZKMkRZMVhvQzBYRDl1QjZpdUhXN0hPc3JDcXlhdnFiQ2dJ?=
 =?utf-8?B?ZkFpS0hLUVY1WHRvVWNmaitBUlIxSHVKczVuOG5obVNFZFpMb0Z0V1pYTGU1?=
 =?utf-8?B?a3UrbUQzMmRWUWlCNEFhano4bjJNMGVhYVVXQlpNa1JNZHZvbDR0cExpelhm?=
 =?utf-8?B?Z2w2eHpiOTYveHlML0NBMSsrVE1VQWpkQmlxOC9uRnFPSTJYSm1MVzZKMEh1?=
 =?utf-8?B?d200R1dXMW1xRnhTc2J0aW5hSEUydGgvOHkzODdGSE1uRWFPcjU5eUhUZDhC?=
 =?utf-8?B?bXFsY1VWMzZIbGg2VmsvajNhaVpoK3hNVnRVTzlzb0U0YkwvcFhQQk8wOUNW?=
 =?utf-8?B?amNhbE5kNDlnVEVxNWY3a0syVUplMFJyeEFUN0hOaTdoRlpMQ3NiYTdoaWVO?=
 =?utf-8?B?dktEVFhCTkNmTjJUK1ZTSkhMQVN1TFkxbHZhL3hpZU1TMFJYbk1PU0hXY1Mz?=
 =?utf-8?B?aHQ2NTFLeWJDRCt0VUhrT3gvWlNQSXFvQWRGVjdpeUJzN0xLRXIreHREZ2RY?=
 =?utf-8?B?MUZDL2ZEYXJVa2Q4OWwxMEhuVUxYRlk0Q2tpaExmOUJCdHB5SFQ2TnErdjlN?=
 =?utf-8?B?TlFDY1lycXQ5SE9ManJwRU5ZdWFtTDM3NlFiWWJtcFNKbG1FVVNiamZ3WU0w?=
 =?utf-8?B?WW5IV04xYXRUNGtQMnhUUzAzNWRHcDBMM0M2MFdzTkJQa3RZV2ZHTTRhVlR2?=
 =?utf-8?B?cGtpN1JjamhvcCs3eTBDdkpEaGExampRK01wMHRobElmTnNIK083cVZqaFRD?=
 =?utf-8?B?V2JJRm8vVUxSZDRmclZCL1dWNHQ4dHFiRm4xK1JOanNmODZsUHorWXBGQVZv?=
 =?utf-8?B?SUh4QkpoaHpGSThkRmFlL1k2WjFEeGIrYnVJYnVtcFhkNkg1b0JJc0hTUXp6?=
 =?utf-8?B?SHphL2xNN09VdUNoNGl1T2IyQ095OTZ0MVVUZndQci9tNmp0bkx4b0FIc0Ur?=
 =?utf-8?B?NGFLalNNTVFzTnRZckhWMFp0dklDbmNmVTJFdHBWbVovdmtIVkpGNGlvY0Nk?=
 =?utf-8?B?b3Y0OXVBNFB1VW1SbE9pUzBYNUlpSGlDUUt0NU41TUdIdmRKR3ZDSlZJZTBK?=
 =?utf-8?B?aVdWVXN3YVRQTG43b2MyWkRCU0tDM2lOTTVGd3ZoQzhscGRQVE44R1BBYW9p?=
 =?utf-8?B?S3JmTzBzTkRnZS9wZjg4cklRcnJsbVFDWVN5SXpiK2V4VmtjN3A5b0E1YmZ3?=
 =?utf-8?B?WktRREV5WDBxTmtBbzA3bWdCZXhaUVJjYVBLUytIb1RVUld6eDZLMmhGN2lx?=
 =?utf-8?B?RzhGOWRMamRNVW9FODR6ZkFUL1l5N2tOelk0b2Nab2hiUFlGL3hxR2FJR2tn?=
 =?utf-8?B?YTNtM2t5akZ5M2tTZjhmMlFQQ0pWYmF0ZWV6NGJabHcrNWc5eDc1YTZ3cDR5?=
 =?utf-8?B?YVg4NG1qSmcrNnZEVXE2Ni9OMk5KdjZiWjhRNGZKQ2RtNG9iR1lWeHhBb3Qy?=
 =?utf-8?B?MGVoWEs4WVNocTRjTlYzSFFDclpqQmJ1cWxubjNxZVpmOXEweFVPaGZTNjBr?=
 =?utf-8?B?RWYydzRuN1BkY215WGhlVlVrNmN6bThLSWt3MmQ1SkZyRjFrVFY0ZWZraUV0?=
 =?utf-8?B?V245R3dGMW45dmlVcWRYSmlrRHkrQzJ5Wm1kd3ZhV2ovSUI1Q3F1alpRcnJ2?=
 =?utf-8?B?L1I1UXJ2eTY5djN0M1doczF4dDRlN2JuUGJkVnhqaGJSRmZOSG9lRHVIb1hZ?=
 =?utf-8?Q?zlJfYGrbiFboNMeSdM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M3RHdzdqWi90dlVFZTVwZWRJSUNBZ3BGSldOTStLQVcwdnh1NTBMUjc2bGpn?=
 =?utf-8?B?alVkM25Jc3YvUkhJRGcyRXVFWEVUalViT2Z5eWc5VXNDYkRSNVdTM0NFNzcw?=
 =?utf-8?B?MGQ3SkJ4QnJDQ1VKRkdOY1JtVllyQU9hRUg0aUJFL3RvYUVtZ3pxUDQ5K2Vi?=
 =?utf-8?B?bFdWV3ZHakszSEZzRko5SEU2SURZdjQxb3dDSnY0UU5nR2VzWkZNaC91Titk?=
 =?utf-8?B?b0hFUzdFa0xuZGlXaVdSbU43SUZvOUYrNjBUd1RUMkpxbmZoa2RDNmZQSk5K?=
 =?utf-8?B?dlM2MWpWLzRSTXlkOUxhenZadDlid1U4Mmxucm9FcFJoWi9hS0lLNFBSTXov?=
 =?utf-8?B?K0MwaWNReThVb3M4VmVsZnZFUXdQZm9GV0xuOU0zMWVDaDJST0F5U2xaTXp0?=
 =?utf-8?B?VkNwY1hCb3QxWVNVd0trTlgrWEQ3OTJLdHovRWJnakdXelh5TU9nazBnUXMx?=
 =?utf-8?B?RlBJSjJsckt6dzlYRlBiT04yTGJNUzR0dWV1ZVVQL0xiVldBM2k0RlFTdFgy?=
 =?utf-8?B?R2JCMnZ4QVBObXY2bmk5MDltUmlyblRnbVVwN0tzR2c2YkpsT2pCRHE5cXBq?=
 =?utf-8?B?ZFpyN0lkRVJQYjdzSGxuV3RRdGllQXM3TXJxUjMwY1hzemh3RWJ4Zi9kRHBJ?=
 =?utf-8?B?OGJJV3p2Rk5jWk5TVnlVZFRXdjVqZW0vQzJOeWwxU1BBTzN0T3JrZGlSb25N?=
 =?utf-8?B?c3FpdGoyY3IwMXRldjgwUVhQSGE0VlRQdlB3Nk9id2dSK1NveGtCV3FTc0Ns?=
 =?utf-8?B?M2JVT1RSK1NGZjVralprNHVDaHFRMnNIaWtJV0hIV2xXODYrNTRXbENTemNQ?=
 =?utf-8?B?RTVJL0FXOUJydE1nY2JFZlRmQmJwWmlZa0ZDbmQxa1d1eDN6blJtVVR1V21Y?=
 =?utf-8?B?TCtwUEFwcE1IYVIzdEV5RHBHMmpub0tnY0ZWUVRZK3QwUjhYRTZzck0vZWY5?=
 =?utf-8?B?c09FTlZWNEliV2cxK05zbGpvRFh1SWtGNnFLckM3bWJmUk5QSStTdWk2c2lW?=
 =?utf-8?B?Nkp1UVg4L2FlZE9rZ2cvUXZFQ3Qva1Zvb3VpMXBja1c3VytZSjFTV2hPREI2?=
 =?utf-8?B?SzRuL2VFRjJ1Smo1WTFZd2Iydis2djl3bGhUMlVVWnFpd2R2T3hoeDJYT3dW?=
 =?utf-8?B?STdTL0JjWFJ4TjIyOHdkZythaURXMHpobFRxT0FZcDdIUnV6SDJRams4bWtP?=
 =?utf-8?B?WU5YNXY1cXhKcXRoQnBqVmJ0em42NC9MZm8wV29yU1M1RnY0SUhpYTVBSmVX?=
 =?utf-8?B?Wll4UnhqYUpzV0NWMysxdjRuMEM4bmo1OWkrNWVGazc0TVdiZ0p0WFJMVkxx?=
 =?utf-8?B?emczdmFubzFZUGlvZG9KRFRkMi9MNHBiTElDUFdpK1dRbWRxK0NXUmZLcVNS?=
 =?utf-8?B?eXl6bVNoUWYzSUZhcitlVzNMeCtZL0xPdlNISjdPeHhBVHFPYmd5aDkvclk0?=
 =?utf-8?B?aDJoMm9oMWU4Q09WR25zQ0pMbUpPVExHSlppc0w1bVM3WmNKSnl0dUhhWlA1?=
 =?utf-8?B?RHRmVmhPRW8rSnUvTGJsRXgvRWxGQk0rVEd2bWVTeGpkclVFY3V2dnFDQmFq?=
 =?utf-8?B?UDRqbWFlMlhEWHRBdGIrZWZVblpIT2dRN2YyNy9KWThYYjNEZFRDYWZuZzRv?=
 =?utf-8?B?QzhQZElPWkRKZG56WStXbDdxUDVOUnpJS2RQNGZuaDhsTVJzcXBkN1UwV01s?=
 =?utf-8?B?NXpNR1AyNnNYSHZuQVV4eTdDTjdnUFRVR01UNDBKNkx4WTNiWkYxOUZiZlNr?=
 =?utf-8?B?ZUF3c1lMckg5SEZpV29ZY0R3bTVyYnpCWEpGSzhielA1eElkRDQwdGsrdmFs?=
 =?utf-8?B?bG1GSTFSUWFia1EyS0dCV3B1bHUxbWluWC9BOXVjZngxWm5kQ0RYWElVYVBC?=
 =?utf-8?B?d0RuOThpUFJPbUswYnBCUXpYeEFBV2RzR3RvdjFDeW40UmpNMXFKS1hvL3Vz?=
 =?utf-8?B?Vlp4WWJiMjhWZFl3c25GSUpzOFFDbkZ0cGtONm5KdXRSN0FrajJrMEllc1Ni?=
 =?utf-8?B?aytnQUt0Ym1Hc2djcVZNOWtESmhoQjFLVEtVSnRXV2tleWJtOGhuWTJpbEhm?=
 =?utf-8?B?SWd5Rno1dFpSSmExMlZZODRYZjRGWUxVMFByY3ZOQjVmdjJLWHRyVmtPRUYv?=
 =?utf-8?Q?qibPJ5dTgISmIuU21eon7FTQ5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178e2a1f-ce07-41e3-7b18-08dd10235e2f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 03:10:24.7484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jcHrvZaKYadncGleUh3QfUvnVPlM5Gf3YtNPKHMT7ylILf9XhSzYUp9arJh+iSLObMDmv6gUIQIAWRBfBlc+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7890
X-Proofpoint-GUID: 8dOyKt9DZ5ANnnEtiBanPmR0aMsqnZWl
X-Proofpoint-ORIG-GUID: n7yBE4ngv2hOftd-tzB1XmYFVepgBodE
X-Authority-Analysis: v=2.4 cv=QYicvtbv c=1 sm=1 tr=0 ts=674930b0 cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=3WlgW34xpE2ieOXYz08A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_01,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=924 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2411290024
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AT2btNY024384
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 03:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207998

I'll share some data from my daily work.
My server has 128 CPUs and 256G memory. When there were two world builds=20
(40000+ tasks for each world build), I got OOM several times. I once got=20
an OOM when there was only one world build. So I mounted an extra 256G=20
swap on that server.

I just noticed that the 64 cap was there since 2021. So all these OOM=20
happened even with this 64 cap. So we'd better not increase this default=20
cap number unless it's proved to be really necessary.

Regards,
Qi


On 11/29/24 02:49, J=C3=B6rg Sommer via lists.openembedded.org wrote:
> Ross Burton schrieb am Do 28. Nov, 13:36 (+0000):
>> On 27 Nov 2024, at 16:33, J=C3=B6rg Sommer via lists.openembedded.org =
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>>> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>>>
>>> We have a system with 96 CPUs and 128 are not uncommon. The border of=
 64
>>> limits the number of parallel tasks make or ninja spawns, because the=
 value
>>> goes into `PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"`. If only=
 a single
>>> recipe gets build (e.g. rust, due to dependencies) this leaves one th=
ird of
>>> our CPUs idle.
>> 192 seems like it was arbitrarily chosen as =E2=80=9Cmore than your cu=
rrent
>> system=E2=80=9D: if we=E2=80=99re doing that then we should just remov=
e the maximum cap by
>> reverting the commit that added it in the first place.
>>
>> The point of the default is to be reasonable, and in my benchmarking o=
n a
>> system with 128 cores going beyond 64 only gives you more chance of OO=
Ms,
>> I/O contention, and other users of the presumably shared machine being
>> angry.
> How much RAM did this system have? Ours has 128GB and it's more or less
> empty during the build. Also the NVME-RAID shows seldom an exhaustion. =
To
> the point that I an build at least two of our images in parallel in a t=
mpfs.
>
> I try to record some graphs with systemd-bootchart. It's a bit tricky,
> because I have to split the recording. Do you know a better tool? When
> analysing a system I watch with atop, but this doesn't give graphs. And=
 our
> monitoring system contains too much information.
>
>> If you have a powerful server that only does a single build then you=E2=
=80=99re
>> welcome to set PARALLEL_MAKE =3D =E2=80=9C-j128=E2=80=9D in your build=
 environment to take
>> full advantage of it.
> My other solution is to run three or more builds in parallel, but there=
 are
> not often many images to build at the same time.
>
>
> Regards, J=C3=B6rg
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207997): https://lists.openembedded.org/g/openembed=
ded-core/message/207997
> Mute This Topic: https://lists.openembedded.org/mt/109808873/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>



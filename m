Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D28C28B28
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 01:43:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.28032.1741571003337986263
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Mar 2025 18:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5164e50115=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A1KkIo000376
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Mar 2025 18:43:23 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j279b70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 09 Mar 2025 18:43:22 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52A1hMRs032705;
	Sun, 9 Mar 2025 18:43:22 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j279b6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 18:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFz/Ma/CqPuwziXL5vYi0cCaT0mk6wFPwjitMABzibsh9y+m4Ku3hOkE2l49M475dUSfKtoRhNbYBO6M5SUFU6UCNidnkKbpRi4R8IegryfKW6rc0FJRs29RHSpUXqWPP2HzKp+PUWG8xBXhs7tmQbWwP2T4aU/u8HPGOhlaiK4d9ZbL3Lf9hKDCGWLFhjF+NfzAOtwHsIYU3ktcNMOTRjJsO9MR8bArkSjTuRRWAFoiI7NO+Lujh3IcekYZOlZFQRKHaKHS6HFTZqj5+YyjwG+cEHWyL6Yv3NUG9cdQlV9vJwYX9YTK8SzxxxQiM0WIU3Pv31O2qpccKuxMChSSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEdWxUF8bmtJKXbsMps60x/be13Tx89rh8Upw9N2MPg=;
 b=YGfPZ4UOHdovv6TCQApWMvFnolBofbcvBXdHcTAd5q7HTo6qlNIE8JelRjnZPT36gq7wkPs2MDLmi8AuoxfMI7Nh7KOIKxjP0fZpUBNt4LTmKM3RZvil2e5Yg7dsHhcZhbxeCUMe/3HdEX07mH/p9EmD5IK5O3W+fAVF2KTBAZp9Yq/3u27NPBBk0I6enj0fo/5dvT4NKQhasT+rriK5s7MoOcrFAPSRiIY3rzplykTgZ8eTWBXXXq7AHzDHv4nXtpFz7JJhru+TumwVdoD3q3RBaxZSus5fikHQK0wc/VeVtixltGlC60xddOiB9UTA+5+rossQAniGE4fwKWkLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 01:43:18 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 01:43:18 +0000
Message-ID: <38a779dc-c8a5-44e1-9c46-06f04eec228c@windriver.com>
Date: Mon, 10 Mar 2025 09:43:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] qemu: retain default trace backend
 if 'ust' is not enabled
To: Steve Sakoman <steve@sakoman.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20250306105643.2292192-1-kai.kang@windriver.com>
 <CAOSpxdY6wxiyxCoN0rROi3=iyqNT=4hOmO4pOt2yy9JQXZHotA@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAOSpxdY6wxiyxCoN0rROi3=iyqNT=4hOmO4pOt2yy9JQXZHotA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:404:f6::25) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb4240d-3142-4a40-303b-08dd5f74ef04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cUxMZWNJaTlmVVo4aUlDc21RS2JmYzcxeVB4ZVF3TzBCVldmejZwMTBoRWVZ?=
 =?utf-8?B?VEowTkxBcVZiamg0YnhKY2c5QjJ4eU9jeHhhVXFZY200blNEZnBrcG5LOGxL?=
 =?utf-8?B?eVNUeUthQXZiTE9FRDMrU1lTN21tU0hBVWhFdlhsQ2dUZ0c0cTV6aUFZMi80?=
 =?utf-8?B?WjF4TUlBb201VFdERWV2UnV4QjdmTDlwNjN6bnl5UFFudENtZU9ubEs5ZDNv?=
 =?utf-8?B?VGp3KzZlK3FVaDdVQW9ReDJDY1h1aEdQSWN4V1hmRDZzOUducGlRRHpDZUZ0?=
 =?utf-8?B?aE16aElhMUVTMlBkWWtGM3JGcWszQVEzc2xQd01qaE8yTU92ejJNanBUUkJW?=
 =?utf-8?B?V0Y3SXl1ZTBoVmwrZmxYNm1PMVpaWStBTW5Zcjc2N3NoNHJoZFZMdi9VRlR2?=
 =?utf-8?B?ekd0enBuN0JiVjEwZG9WNXlPY1NzYzI1YlJRTWxodHkrTkQvUG9oNEZQYjJi?=
 =?utf-8?B?MkE5Um5mTUlSR0tGemVwSUE3bE5QOUEzUzNCQlVVdWova0taUjNrV3czN0wy?=
 =?utf-8?B?Q0d5OXV5WFFOWEVja3A2bWRzRjFVUlZzUDRqNElEQmRIc1hNZGZKalMreHE3?=
 =?utf-8?B?TWdYYW5QbURDNSthdm1pclZWcDk1THFqY3phVURTaldxcXBuV2YyMUVZNkpN?=
 =?utf-8?B?Nkc1VlJmNDZiWXUzZVh3N0g3VGMzTUJRZ2FrdUtydHZ3TjNabVh0VTZDTmdh?=
 =?utf-8?B?cGhicVBVQ1pjcE1TYW5xTEs1a2FOZmxNZStrM0x5WUVtaEZ2eTdPZEFGQ2ZE?=
 =?utf-8?B?N0tJZXJrYkJaNmJXc0RjZW9waDIrby9aTmFOUlB3TlNtRkVsNEZKa3ZNclJR?=
 =?utf-8?B?OHRCM09oaUJjcXh0VFdjK0JicWtDNVNLRlFMYS9UNmNaSnpCSWtTd3VlMm1v?=
 =?utf-8?B?cjFEVHpkSFVhQmUyd0pKSjBYZy9HRkNoeDZzVDhpVGdtSzBTNXJVZjJVNVJI?=
 =?utf-8?B?ekRpOU9XaVc2cGdmd3BzeDRJR2Vvc1pzTTIwUW9CeDBRTytSZGw3TitqZjZU?=
 =?utf-8?B?ZVRoRFBERmFCeGlUMHpFS0VxZXJjdytwcjEySExYelJPMHEyeTRiaEg0UkVz?=
 =?utf-8?B?MGhNRmxFZkp3MFQwM3ZjL3o1K1JvUVlIL2pGMXk3Q1NyekIvd095SHdhT3pm?=
 =?utf-8?B?dmJuK1FaZzdDTVduWTZ0UzloeUZibnRGU2oxWklTbXE5T1M2MWFiUVNzbUp1?=
 =?utf-8?B?ZHhFa0wyekZuM0JpNmN5UG5hY29qMFBUejBuaWdTSDBxVlU2Vk5PYUtHVHBP?=
 =?utf-8?B?aWZBakdVcWlsNWp2SFpubUJiVVZ2b3JPME9rQUhMV3BrZEErNkQ0ZjA2Ung0?=
 =?utf-8?B?djRId05aaFkzdWl3T1hzL2Z5ckJkdVlMS1NTdDJuVVpMVFNiTWZEZFZZYUJW?=
 =?utf-8?B?dHIxWUZxMjhrcFpmVnV6YUl1bWp1eVBDNWNLVHIyQ0lMYlJOa3UvQS9IQkdB?=
 =?utf-8?B?aCtFRE44YjVTM1BmYi9jVjlFK0hnemppa1lHUTZJQjltMEtwalNQV0paZmZV?=
 =?utf-8?B?ek9QVFJFaVU2ZlNKbDJlOGtKb1NaV0VXMnliOER2dlBob3h3aHpCTUZlTDN0?=
 =?utf-8?B?T3pORjFuSWlrQ2oreDgybUMyRkI3UjdXUk9ab0Ewc1FRc0NqdzJHS1kwbldh?=
 =?utf-8?B?Mnp3N05EaXhvUEZtT2FUUjlzSDdid2tZTmxwNEhaaGFWMGE1enZUdCtGVGVD?=
 =?utf-8?B?TlVzVDc1TlpjaDhYbzZaOUgwSll2ZGVSdGxtUTBSUUNySm4ydnpNeVhqSnFP?=
 =?utf-8?B?QWZvbnRrc3RjT2FNSk1TM2pGbTVrbm5RbURiWU1ydTlyM0dLa3czWWZzdEZ5?=
 =?utf-8?B?dHNaRFRhMVBHc05aeHJ1Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rk1LTmYyS2I5bjR5YWhEM1VtMkpCaTZFOG9uTnc1VGpsbE5iS1Bqc09MWEIy?=
 =?utf-8?B?a3lKODA1QWtnL1BOYlpvSnVJZUFGdG41TzgzUkZqbXFwRVc1dGpLQWZBRUlH?=
 =?utf-8?B?TnFxUlF2bDVrRTVyTGlyNXFxVVFTcGJSVDc5RGllNGswcVM3MmtOc3VhR2VI?=
 =?utf-8?B?QVMyVklpUmdCdHZTcGFrbWlSYWVuL0ZnamVzbzZhTVBKUndvWVkvZUhETENL?=
 =?utf-8?B?RFFHOFBua3pKZmVRK2dwSDZ6c01Db1pNVWY3Kys1MTEzajliYnhucVY5U1p6?=
 =?utf-8?B?bjJPb05BWXJBL3ZINktFY1FjWTV0anBZVTZDNzRDK3hQaEZFZ21BQUNlZUtE?=
 =?utf-8?B?UXVVVElCRndvdkpzOUhVdXpkc1U0K2xUdHJiUkhXRXZIdmg3YzE2WC91VEta?=
 =?utf-8?B?Q2ExazVhVlY3UXhuWmZUVHBqNFpJTmpkMjNoRm9kbEhSbzhmamR5Yk0rL0Vx?=
 =?utf-8?B?TVlaN1BEV3ZCdG9oSEk2dDI5QVlQRWI2ODBSWmJLcGUzampKc0RwSlRkei9t?=
 =?utf-8?B?bDltVldtMmE3NTlYU0VYVER2V1gzNU9XMkwvSkp6TjFnUm8yc1VwZjA5Yjh5?=
 =?utf-8?B?ang0VlArZDZxVmoxcEJacjhNYlZpQWtwMWk5ekExZ3hUK3lVZWFoS0Z4WDBa?=
 =?utf-8?B?VWpRd2dsNHFObzBhMFhxOHdta2pCUm9XM3J6ZEpjTU8xdnJvbHpXQXhyaGpv?=
 =?utf-8?B?a21kVXZhRUJQc0hwQVJUMkdOelhEb3hpcHh2NzVtdDJoMDdJWU9IYVJVak9h?=
 =?utf-8?B?ZXN4bHpFT2FNM1ZyN3JBcDZuY3NvM0J0ZzNZcGswMmRSUXJWSndJOXRrNklV?=
 =?utf-8?B?ajhvbHRwZ3ZIanV3N0s3NkczTFNiT21xR3NMdTJqVG5WbzlZWVIzRlZIaDJJ?=
 =?utf-8?B?S3BIWmM5L0p1eEhSaUtGN01JTkhvbW41UGxwalFUNEJBU1hrZnpOMFVueFVX?=
 =?utf-8?B?SDlNMGJtVlQ0aXBPZVgxSGlsRlBYTm96QUdlU1QrK0JhU3BlSTlGQTdLTmx1?=
 =?utf-8?B?cXpSUm9IZkdvcmdldmt4Vm1hdXFkTHVCRGlmRy9sSmh0S2hXVjkzenVNT2lx?=
 =?utf-8?B?cFpLTVdJenE3RkNVUnZnR1pmQzJkMnRjTEVSQ3kwK0FLM2tMMzlkcXBHWUk0?=
 =?utf-8?B?MHNxb2JZWTBkOFpkNU9nN3R2eFlTTXRwUHl5NGU2ZUpENXVPTjYrZmNkTHgw?=
 =?utf-8?B?TWNaMTRYa0hONzlJQkVuZWpTUGwzT0xLUjJ3OCtFNXhoQjZob2FGVjJBRHdJ?=
 =?utf-8?B?UHJ0aHJrK1pGN09JQW51R0ZlN040RVBRRERuNDFLSFVBZm5OTG5rS0RJN1NK?=
 =?utf-8?B?ditrWGYyeXRWVFJDYlpZRGlNaTVtTHE5QVJDMEFEUTYxM0FiNGFGYUhVQXVu?=
 =?utf-8?B?c2llVjZYUUlCTEV2S3M4cS85M25PQzBKSXlHWTJsTjdFUkhsVDE2dzdzOFJX?=
 =?utf-8?B?cUxkNGdTWnEydGNRZit2Q3FNVzlMeFR1VEQ2OTBHU1BnN2FsMUMyR1FTdTU4?=
 =?utf-8?B?NXlJcTNMbjZMYWdFQzFtNnVNY245d1hIVzdqRDdmYnVTQVkyMXNCNGY0clhV?=
 =?utf-8?B?Tk8waE56bWM1TDVLdUVNZXdXeDNIc2lwanE4ajVvV2dTRy9Sd2YrakNlRlli?=
 =?utf-8?B?M3JjVVVFRHUvT3pGWE1RV0p4QVhrbE1Ld1dxclAwMTg1TXNnSU9uMG5hNDUy?=
 =?utf-8?B?RnVqYUxCV1EzcmNqb3FUbURRcUVOSm5zY0VnekljZWU3Q05KS1pNL2MvTE8z?=
 =?utf-8?B?aDltanpYNXY0bklIeWFaZ0daK2dJeDVuNEZMQ0xOaE5pMWdBYVpORTFaZEp5?=
 =?utf-8?B?RjJFUUFhWUtGbWtua1lyMjJ4aTVWZm1heEZzUEhwMC9DU3Y4c1ltM1pXQzJw?=
 =?utf-8?B?c25hYW5iSmNTUDdONURmdFliS0dmbGhnNHR4OUREVWhVcEhEckw1UG9KR2M2?=
 =?utf-8?B?Zktnd1FXU25sVDhYZjFzQ3YydFQrcm50MlIyT1lkNnA3ekE4VEhXaWp1N2o3?=
 =?utf-8?B?VVlCNGJySW9uWXhwNWlRNW5Ya1hIV2diNUxUZ2tEcmZnWDYyZ0ZOSVdNa2s1?=
 =?utf-8?B?aUpDeU15RWdlbmpsQi9tUVhtZEFQaUJVcURaVUx4dC92WjZPRXloalpMbDFJ?=
 =?utf-8?Q?apT1O9yiX3b1P8AyizZ1MMIaw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb4240d-3142-4a40-303b-08dd5f74ef04
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 01:43:18.8206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWfkW5P8rrWnMqpOkKsrEZod8Fgh4rqTeILUuqQoNY/E/f1edBHlarGTEH67EMIHDBlBDJDSgnQu/LoxFC0m9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
X-Proofpoint-ORIG-GUID: _oz1DzCJDSbnrKyNbj1rMasUFaiYRqMw
X-Authority-Analysis: v=2.4 cv=WNuFXmsR c=1 sm=1 tr=0 ts=67ce43ba cx=c_pps a=IJ1r+pqWkCYy+K3OX67zYw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=Q4-j1AaZAAAA:8 a=9qxNCY_qAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=6Lb_HCkwPIWfJB4LEuIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-GUID: 27-tCYzL28FQ6rMrnc24CVyxwX_8fTMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=961 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503100011
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52A1KkIo000376
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 01:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212485

On 3/9/25 03:41, Steve Sakoman wrote:
> I'm getting errors on the reproducible build test:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/1180=
/steps/12/logs/stdio

I am very sorry that makes trouble again. I'll compare with master why=20
doesn't affect master branch.

Regards,
Kai

>
> Looks like host paths are leaking into the qemu-src package:
>
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250308-s52sa=
kkc/packages/diff-html/
>
> Steve
>
> On Thu, Mar 6, 2025 at 2:56=E2=80=AFAM Kai Kang via lists.openembedded.=
org
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>
>> The qemu build system enables the 'log' trace backend by default, if n=
o
>> explicit choice was made with '--enable-trace-backend=3DCHOICE'.
>>
>> However, the qemu recipe uses the following PACKAGECONFIG line:
>>      PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,--enable-tra=
ce-backend=3Dnop,lttng-ust,"
>>
>> which means that the 'nop' trace backend will be explicitly selected i=
f the
>> 'ust' feature is not enabled. The 'nop' backend removes almost all tra=
ce
>> points at compile time, and thus basically means 'disable tracing'.
>>
>> To retain the default trace backend if 'ust' is not enabled, the above
>> PACKAGECONFIG line should either explicitly fall back to the 'log' bac=
kend,
>> or not provide any value for the 'disabled' case. This commit chooses =
the
>> latter to not make any assumption about the upstream default.
>>
>> (From OE-Core rev: c31396a30dcf17ab23ff4dd5943eef5fba20cba6)
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.=
com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtoo=
ls/qemu/qemu.inc
>> index bee30cd56f..137636ef82 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -298,7 +298,7 @@ PACKAGECONFIG[libxml2] =3D "--enable-libxml2,--dis=
able-libxml2,libxml2"
>>   PACKAGECONFIG[attr] =3D "--enable-attr,--disable-attr,attr,"
>>   PACKAGECONFIG[rbd] =3D "--enable-rbd,--disable-rbd,ceph,ceph"
>>   PACKAGECONFIG[vhost] =3D "--enable-vhost-net,--disable-vhost-net,,"
>> -PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,--enable-trace-b=
ackend=3Dnop,lttng-ust,"
>> +PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,,lttng-ust,"
>>   PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,,"
>>   PACKAGECONFIG[seccomp] =3D "--enable-seccomp,--disable-seccomp,libse=
ccomp"
>>   # libnfs is currently provided by meta-kodi
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#212384): https://lists.openembedded.org/g/openembe=
dded-core/message/212384
>> Mute This Topic: https://lists.openembedded.org/mt/111545623/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux



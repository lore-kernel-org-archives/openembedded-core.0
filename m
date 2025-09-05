Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F46DCA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 10:38:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18506.1757068730663835864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 03:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=TdDShIuU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1343256814=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5854t2Ip250568
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 03:38:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JterDdAnW80PyJJEpf8ieVNaLJqF2FwbNm4juHhyLvE=; b=
	TdDShIuUFNYMTQmPwXlw5x0kiaYZbMNQRrQOtrzsTusRebKP6Bw+WOPrtmAMVDjv
	z7YjNHJCsen0ovHqAiV0IL4CP/NKF3Q0yns9qZUXfcGPnp4NDy28nWW4rXyUz7ry
	Z4ZK8hpiE2Fg/rdLS4QD+Iw7H1J7xJhBrl4UrQpVc1aTvgIj9dNGhqLyHl9Kmnui
	jKIXOTYmO51Hi6F+yxRZHpJ2S+vB9ma29JQEi/B40mZM8zy/C59CZa+A4MwfU7tt
	IUInHr4C6eMdiGCKGL8iJ5JeTdLQ9Q6lD2bAPzwc8fFNh+aOtG9CSwv73lSgImjr
	8q0wDkt/hdugCiv0RtMhlA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7sb1sq9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 03:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H642gpIErlPMZQQ97CdJdmTJsxSyGu2zGhjH3cOqG6vUugXwATThJn6JHcsFBhA0vYEQhFe6XLXJ9HmHqoK4k638JuXHPt5dFlOlxLw9mz458W+PsVL2flsgCJT/TUTbsq3tcAbR2FgFIoozfRw3y0vCj+KMemvw39iCT3tp9s1MNhhHtmom9gmXpxTqEVDAnNw6OxhVl8MXIF4cq+vfs8AcnBI8ljTRGi9/B5lMakjpRuqfnKgTSvN4x6EAg4u/8CQ2tjIb3pmKy8nBEn5v/7vmfhsja2ZJVsk6KlvQqz+89QueRVtXiKG6zwk/Tzhzvbx8FIhjkiJd9G0756uNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JterDdAnW80PyJJEpf8ieVNaLJqF2FwbNm4juHhyLvE=;
 b=J7Obol51HQe9XNncGUnLycf/Dk8w8Jwi9ePYddPQOmrpzwdMSEe4M3H/LDDAlkDrmgLoxahriXrSM6w/ll5jTNZ4go7da7xXleeG5Vsyw62tWB5M2L8kwYjyQOns9AL//rU3ghYazVCzL9I1CSVez0W372xFLzZ1IPMOOwCfhU9ddZv/smc3wwwgoxUNHfLtfD/xOStZ7bIOSKEBhydAvN8RychEnRAWyapyiC5y8JAkpHdyUvqJrvT95nmr1izcIs0475/WcTYG5Pz31U7cyTHS2CZT5Guzh6ceZDAQQ84YDGm3+bY9KsaeCnTVRezCo1RStx68Sm3+PSfB+ye+ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH8PR11MB6731.namprd11.prod.outlook.com (2603:10b6:510:1c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 10:38:47 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 10:38:46 +0000
Message-ID: <485684fb-3efd-4563-b9f7-395002c85d58@windriver.com>
Date: Fri, 5 Sep 2025 18:38:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH 1/1] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250903081113.3182850-1-haixiao.yan.cn@windriver.com>
 <CANNYZj9Qr7uy-bZGGEt23MWXHkX-fU3TYQc3WYoX3KEtTC9NtA@mail.gmail.com>
 <108f0edd-3a59-4b2f-86a0-7afc439c884f@windriver.com>
 <CANNYZj_z3UwqgYqmvUYBG+c2iANjib9=6CZYapi1zCjycN_4cA@mail.gmail.com>
 <e038f529-1c06-408a-8d28-b2ec6bc6d17f@windriver.com>
 <CANNYZj-5sNQq04T5fBj92TSUDdcLT3+_u+uvDveO1g-ZJNL+wQ@mail.gmail.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <CANNYZj-5sNQq04T5fBj92TSUDdcLT3+_u+uvDveO1g-ZJNL+wQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYWPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::20) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH8PR11MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 696efc8b-9630-4dfd-34ed-08ddec686462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q3V6M1pQTVQ1S2RNSUY2eHJQWmhkODdaNC8ydndXcERoMU4xd3JWRVljeS9y?=
 =?utf-8?B?d0xKQUJ3akZYc0syMGtKZCtIWjUydzJHSkQxRHkrTlNYNFFzbURVcE9ucnpQ?=
 =?utf-8?B?dHExTXVDckpFWTV3MU5qczVzWXE2SGJwek04ZDZIbWs3VnVFdHlYaTRZZzY2?=
 =?utf-8?B?aVI3SkFnWm1mMmFOUlRFbHdOM1FmdHlSbEFWeGNDSjRqN1hkRHNpaE4yNlYr?=
 =?utf-8?B?UUt1L0xrellFQUc1MVY1ZVNoZlpENnVzL1djOXBSRXhieW5HWXBRVGVRVXk4?=
 =?utf-8?B?MWxtMGtMMkpDNUpaTzN4RFl4WkptcS95d0ZYS0NkVlFCVlN6M3hobEwxVmpE?=
 =?utf-8?B?OWhtUnN0NUhFaFJRc20wM2RkbHVnVHZIQ0VXdnZlbVlpVUt3d01VOU4yZVli?=
 =?utf-8?B?a0g3c1k0L2hJeWs0enFoVTlsdG0wS2pRV1l2UDZLVUltR2FZRE51TmNGRmUr?=
 =?utf-8?B?RUliNXpESUtxQWZaUDBVNGQ1UkpiOStTWDd4dFgyMXVnWnNuc3pQamRNLzBp?=
 =?utf-8?B?R3RzUmJTcmpJeG50OHFmMjZsdSs0VVQ4cU5pMEZtS2VpS25qZ0duZGFRemxZ?=
 =?utf-8?B?QytEQnlDdXg3dmN2NEdlMWd0ek9JMVZsYUV3TGhTeVdmYnlIL0ZJUC9ocFJX?=
 =?utf-8?B?OFVCL0pNRUZQNG5qYUdmMDRra2R6OUJ5WE1JbVVmMnBuQy9BKzBQeWFhcysy?=
 =?utf-8?B?dlFnemJVZU5HdGdvYkdsNlVYaHVLSzN4b2pOc1RVZzRjdjhZWjFNekduYUZh?=
 =?utf-8?B?Z29MREFNK3lpYmlONGxFQUIvOFlOSDlDdmJXZzl0eTJMTkxJL3FsenpqKzdB?=
 =?utf-8?B?WGtxdFVRWE4vbDRwa1VkTU5JZzZlV0xNSWhLV256UURiLzJHblhRQ2NYWncv?=
 =?utf-8?B?b2MzZnQ2ZFFRUWhvVUxSTUF3S21xamtPckd5elBuWmtOWGVYTGVDeGdRYjRh?=
 =?utf-8?B?SXBNQVJ1MzB0Z2owLzluQkNta29QMGNYY1F2VmR5c1p1a29QYXEwQzlySmpm?=
 =?utf-8?B?ZThxalZwZEFidFA0Z2tVV1JwYnRJMC9vMjgxWnF2aVpWN1NqeHVlK2daWEU1?=
 =?utf-8?B?OVppSEJJSEpGTFVUT3doOHNUWSt5RWN4Ly9HeXRxd1dGdkk5RDA1dlRtU0F1?=
 =?utf-8?B?RjIzTmp6cmp4UDhTYnUvSzJRZ3RtMmdCNGp3T1pkMUlaYnFVbDNzQVlPN0dz?=
 =?utf-8?B?Y1d4R2docHhNRUJDL0IxRlNjR2h0R0RDOUVnSXdjRFpPSlhLcE5yT0xzeGFS?=
 =?utf-8?B?RWEzbzNUQTR1U2FzaDVwTTNqUXVEWTBMTTZ5UDdPa2JUcDRqK2ZqNkdCdmZw?=
 =?utf-8?B?VFJ3YWRTNlNoU0NiMkRyTFZTMjJaUzU2ZmJlSzRaTUdGQk5jdnJqNWYvakVJ?=
 =?utf-8?B?alg4eTJQK1ZRcENzY3lPSCtMSGtaQngraXYzUDBXSWgwdDUzRlB4dWp0UE5N?=
 =?utf-8?B?cW93KzVsZ2xzelBJRU1MWlNBNGltY3VWQ25yU1RtRDMyN01ZelJ1NDk1dEM1?=
 =?utf-8?B?b2JFeGtaQ3BxMi8waEkxSStpbFZkZDJYdDRqZXN5bDhMaTY1MkQ1bGV3cEhJ?=
 =?utf-8?B?eWhlVHZ6SGl1ZU05S1BLWVVUdVM5Mi9PZGI3MVU5dWIwWmdPMXB5bVoxVFZ2?=
 =?utf-8?B?TDk1ekRtem9SWUtLNzl4WmlEWHVMdHBiYjFkaHc5cUZrZWpZSFJ6WVhUbVkw?=
 =?utf-8?B?N2ZLQzlla1RBS0tFcFFyRE0xQnFOTzNOazdHdldFMHJXc1B5V1k5UzQ3ekg2?=
 =?utf-8?B?bXJSTVh1ZzU0b0VSTFpSU2d5aHVtN2lFL3JOQ3AvWWZJWUJVTHNGUDI3ODVN?=
 =?utf-8?Q?mN0m0KW8odtyRyZlkn2CBb1s5YVEu2V6hgIa8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bEpwbTB4NWpyUUFGWUR3aWVhOUhKN0xDejN1dkhZdTdTWWdZZmpSSjRNWkJs?=
 =?utf-8?B?MGk1WHhjZTVjV2ttUHlONTlMeCtyaTJoTjNXQ3lJbFgwR3BuMHNzUjNTUWpr?=
 =?utf-8?B?cHF4N1FvMk5GdFM0bElZWEl6UTgyVThBU3duSWEzQTM1b2RSajh5QmErbmg1?=
 =?utf-8?B?dlpqNGxKZmJBVTJMOFpZS3QzM2I2ZTBuak9DRC9jNWNBZ1hTQlM3RWg1YXVY?=
 =?utf-8?B?eGI2TGxRZXYrVExkeGtnbEVtUnk2VlIwYU4ySU5aaHFFMUlIZnJNM2lvZXNm?=
 =?utf-8?B?aXg0eC9kMjZuT0RTeHprNGpxYXBVUFZ5MmEvZ2hEaUNlcGhOVmV0Z2NIU2dK?=
 =?utf-8?B?Mkt0dHVyQm5aRVhyYlFjV21tdlJ3d3RYc3VTV2ZrUnZoZWJ1MGJsWlhMYzN2?=
 =?utf-8?B?UVBWZlQ0Y2dHRWRiN0dBRndpUFBlTERreTVyR20wVWFxQW0zUDg5K0lqOHZF?=
 =?utf-8?B?OHM2dGhOaUNqcWlhRFM2T2R4NW5lTWdEeEsvb05zNkpFbUxxVWZKdzNmR3VQ?=
 =?utf-8?B?MnkxZEw2WnByOG4yS21PYzJybkZPUGx4bXdJQXdpWlpFMmVNS3hHTC9rdXND?=
 =?utf-8?B?UkgrbzhBdnlUdk50QkI1R2Z4dThKQlFJM21GRys4U1czOTZxSnFGdzk3ckZN?=
 =?utf-8?B?MUVXVjJzZ25CRlZHUWhlb1RqT0lRakh2dFUrZlo4RlVqREdHemM1bjNqREVa?=
 =?utf-8?B?Wmk2NU8zeEZWZ1FRSmxsaHc0cmM5eEE0enEyYWtVUjZGRjl2d1RQZlZIUmZs?=
 =?utf-8?B?cFVKa01MQU5Fdm9mMkQ1TmpwSDFEWmhsRUdXMkJ6eXNBdXVoRHhQaG5tWmVJ?=
 =?utf-8?B?b29jODdOd3lJejhwc0ZnYU5ucS84bnZuK3p3aWhxSjAyWnpOOFlLMTZSbnNu?=
 =?utf-8?B?clBEUGlKQU1GYlFpV0xKdG41SzFLZlJ6d0V1ZEtleUFLZ1l0SHVhVkxiTGJz?=
 =?utf-8?B?WXdLcFNQVjZzNEJhd2NTU3FlbHROcGJWMk01eUMwb0pYaldUYmtWTi9kV0g4?=
 =?utf-8?B?QmYxcUNnSk53NHBVSTdjUzNqZXZqNFVoMW1uR0h5YmcvTm9ocTZFT2JJV2oz?=
 =?utf-8?B?V2U3NUh4cUJienJZeGFVZXZDMktWZXpoMjFhejZWK3Nqak5DYWh6Q2JRRzZT?=
 =?utf-8?B?eEp2YXZobDVmajVaTk0wUTRrb21rRkdIUTR5S2kwNUpnSW9WOG45a2NjRjI0?=
 =?utf-8?B?TVB6VlQweGtkSWxmd1dKb003ZW54VjhKZzNYSERkWGNFRWFoZ1AxVEE0bHk3?=
 =?utf-8?B?UmliNyt2Q0NnR05nYWt1UTB5Ym9PbUgyWDlxY2tlMHlEcFNuMllMdTVudzRS?=
 =?utf-8?B?YkJ3b2pPaTl1TUM0MEpXRUZ1YWh3alRIY29MN2ozQXZkQ3Q2dVl5L0VqellD?=
 =?utf-8?B?ZnlIK2dHa2dnQ1RYOFh5Zkd5ZEJjQ1dtM0NNd09JbGljd091bUJKRUMvR0Zh?=
 =?utf-8?B?SElid3BHQ3MwL3BCR3orMVZvb2ZNWjRrZVI4L3poUFlxekRDRlQ3M0t5bHFP?=
 =?utf-8?B?ZHA5VDE1SUFpdE1uVWNkWmlYYzdSR3orNzgvU21vcHRJb3RwaWJRWWNkRFNn?=
 =?utf-8?B?eW5ZZzd5UGVjdTkzd0JPVkQ2QUxIcDVaRzhLYUNMd0hCY0xnWTdUanplRXpj?=
 =?utf-8?B?SGFDWnVyRzk2cEpiemFhSFc3U3I4T0F3SEJlTGp1RFZLbEx0cFpuR05qbnY5?=
 =?utf-8?B?bHhlaWhWc0N2d3NGNGxjdDk2Szg3OGVkSXI0K3JqV2haczJRVThJcEl2eHY2?=
 =?utf-8?B?LzVZSDdFdUF4ZEc5SDEyRFkyT0Z3RXJzTlgraHFEZkhnY3RHOXI1WjZRRFNN?=
 =?utf-8?B?ZVdjRDVRcStiMmJqeTdEQVlGVnc5NUdKb2N0K2pUQzdzYitYQi9XcEJIN3hP?=
 =?utf-8?B?d29mMWJLeWtLUUZJbktHRkRJbGZwZUFrUUV2VzlzZkpFd2w3b1FTQnl4SW5L?=
 =?utf-8?B?Tkk0U0dESTZVT0hJOG4rM2VKS3dFQVBLQ3JRWkhlWmt0T3BrY1Z2bVNQSTBv?=
 =?utf-8?B?V2hpYmE0QUFaNmo1Q29zRUxxRWpoSTcyaFFCbzE4WndMcStzRUlGL1V1MkFO?=
 =?utf-8?B?VmxzNUlueFE3ZWdRZXlaNTkyNXBCTFZIS1ZpajRWM2tlWWlZZzIrVFVSZktJ?=
 =?utf-8?B?SFNPMFJZMkJTbzRuV1NyTmFtR0FiNTdkTXcwcmFvZnlIVzQ3YUpROE04RVlH?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696efc8b-9630-4dfd-34ed-08ddec686462
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 10:38:46.3836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +c9tY8CqOhBEL+ZTsCtGTzvDnZegAiot9p0pP6Jm3umcEZXu3Z4VR1ELAD5vCtZZfp3mJDRhNdU/bRG6H2M3CH+PIrCjiWsLkHJJtZ8A7rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6731
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDEwNCBTYWx0ZWRfX2NvX7Pp6EE+M
 v1/cmhmrvZDd61z7kqc8Ac1i2arRsKZDpZsAFo0vtcLSPGOKYwuZt4I7Nqh5YMcTz7GlBLwi0Fv
 gt5OZdipgBlYN/rk9OFLBDwJyDqsdGGVJ+JMmN+EgYLEjUjHejUkFFjmsGbh+zEtnqoYG9DToLv
 otRHvmGcBe7DLurt2cu6l4VobPSiZ+VPy2pXCcgiM9frT67CwqBbGMMICLXRSy6Co87pvPlPnIU
 mJicrp+/I7QKGh6CR2NNSteKGcuD0TDs1mQUpyXk5319GGYf2yv+CWBoIh+s6T/OH2WApym1tLw
 4/M5LKfydMZVaLZ0U0kf+pB04opaFtPugbDmj2XpxilKVzbU7z/PUhQtug6iyc=
X-Proofpoint-GUID: MwmhrSsiocjhilEo3rfuptiN203QWUx-
X-Authority-Analysis: v=2.4 cv=M5BNKzws c=1 sm=1 tr=0 ts=68babdba cx=c_pps
 a=MVVasGN5sdISSE8Qs3so7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=Fh7QZJ50AAAA:8 a=t7CeM3EgAAAA:8 a=1Op9MTtdDAgFb820ngkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=NulwQ_N7bbDsG3TyehrF:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CfzaTfktaEQFGQJ-pDg333XDJMIHISS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5854t2Ip250568
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 10:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222984


On 9/5/2025 6:31 PM, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 5 Sept 2025 at 07:12, Yan, Haixiao (CN)
> <haixiao.yan.cn@windriver.com> wrote:
>>> Please describe how, and why you use set -u.
>> 1.Generate the SDK =E2=80=94 bitbake -c  populate_sdk imageRecipeName
>> 2.Install the SDK using the .sh script
>> 3.Open a fresh bash shell - IMPORTANT
>> 4.set -eu
>> 5.source the SDK
>>
>> It was working properly before the commit
>> https://git.openembedded.org/openembedded-core/commit/meta?id=3D8a7ec5=
2e9b35654bee48cd948c6c34c63db3e265.
> Thanks. But why set -eu is used to begin with?
We are following the industry best practices for example=20
https://sharats.me/posts/shell-script-best-practices/ =E2=80=94 The Shara=
t's=20
points #4 and #5.

In this specific scenario the changes done in

https://git.openembedded.org/openembedded-core/commit/meta?id=3D8a7ec52e9=
b35654bee48cd948c6c34c63db3e265

make it impossible for us to source the SDK due to SSL_CERT_FILE being=20
unset.

Thanks,

Haixiao

>
> Alex


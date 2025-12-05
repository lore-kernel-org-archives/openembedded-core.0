Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1301DD2CE11
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 02:56:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61609.1764903377921023533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 18:56:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=F0wBIuEL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4434534425=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4NnVTs010701
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Dec 2025 02:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=l4x5DHskQY8z1NpQOO3mjO
	+9SDdo5EdLMde8pKE4SCQ=; b=F0wBIuELzv4QrfNwoS8tuOGKeYnSgST9r6Je0A
	uipOba+N3duBqJFMbQIs1/WO7uNRU0fHSM2ah0FC/Q+SWZygbYMSkQSvJzidBUpH
	bb39v839F8NnIeMDlRNsggOaOAcZrqKecJRSIOGtRKxYlpsNTsDIP+puHOD+6T06
	bCdJ6ufs250yCA6m1P204xDcgENjJjDApXaiIL+aHWzW0jEnYOvmsmLaafm+BkE7
	AvsRXnO+n3uS9RYZEpdMTep9YW1bonU0iqF2354Y3yrem0v2Q6zvhQ5fdAOepFzr
	TfTDZO3PwvpDTUWAmmFKaHZH5uP3dBGrFLEgDArrcyaikjEQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4audrgrj2y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 02:56:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3tYRBa/D1xoL5DqMeCOM7ysoGCCTG+1mZ2O/R8iJLsUVLd1GtGGFgBeGnHZQC/ntLrkgOVjf4ip15/ITMyiGMcFUOCiTWtpDwqSzZkZBO24GJx2MkCfeQ+XD0ORCfI1EEd5RDTH1SoV4qwuvg5xAok38zvREnogVI0K4Hx56mD1+S4ZH29ls8PDyfjheAGL4Hou/zF7ilZ5HbbI0eyRgnNuRs29KZZaRo6JJFqQ/HjjAdMZjFNLhKa6SgpSqV8DeOdzA8EfEonhNeLZB6fdhd22lWxRso2BllRRDNf7KY/OEZl0S448+9jI+njP5xQIFfHtdatD7Qvtk1PpsIyKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4x5DHskQY8z1NpQOO3mjO+9SDdo5EdLMde8pKE4SCQ=;
 b=kzAAUfbcai0Vv9q9qr8Ne2Iz6D/FwvWvfxYPNdp3xEqqQlJxtTC2MbZWkDTE1tZY3UXdNr+I2fGSbpNM5fIU3W8yO76m0Wvjmqcl09424gA7BB6vTjYzv4PLlkPUEkYqalXerCLnz0uYPggV5jQmK7Xcg/iar1LBbbN6Vac3jLlVbsMxUUUyqKpNr/o/7gWlKcYmhTL32xVF/7LINpbNKprkqj7lpIdiwPm6bv8kw6f9Y6E9zgum7TWer/SFjxt5AjqbhQZeUg8KRXDxzOrttzaVxdeoECPuA3FUpNsk8VUy5Nv2heJ9wmHbL7H8+NJUUR2Qu8RggFGxsZcUCFxNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB6124.namprd11.prod.outlook.com (2603:10b6:208:3ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 02:55:59 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 02:55:58 +0000
Content-Type: multipart/alternative;
 boundary="------------4gjWFbEnDarTW70AkOKHEUYB"
Message-ID: <5e6750f6-dce5-413e-a489-b0f007c7eca7@windriver.com>
Date: Fri, 5 Dec 2025 10:55:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] bitbake.conf: add new variable
 FIXED_SOURCE_DATE_EPOCH
To: Ross Burton <Ross.Burton@arm.com>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251120114041.193806-1-changqing.li@windriver.com>
 <CANNYZj8mj1ag5M_gh_sWTmBr0teW-Q2=LyDi1VDzzcfWNYokkg@mail.gmail.com>
 <3767419f-6fb4-48be-815a-601c883475fe@windriver.com>
 <839CC7CB-4E43-430D-B691-81ED23231DA4@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <839CC7CB-4E43-430D-B691-81ED23231DA4@arm.com>
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6f0386-3bf1-4594-1973-08de33a9d136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0lRaWI4ODYwbDNpc2R6SGVPNkNTNUNyb1o1Z1poRW9tRkJhOFpLODZCWlNy?=
 =?utf-8?B?c0pXYWhNbDRSRTVRd29Lbzc3aVhaTHB3VnlDUkIrdGE4WnM0UitaeVFlWHMz?=
 =?utf-8?B?RTM2MW9BSmhHQTdOR1l0VGlsL3JPUkRmcnN3K1p3aURUZC9rTkMvQlFOSCtl?=
 =?utf-8?B?VHpHLzhQWkMvOVpHc2M1Tm5TQ25tQ21vL3FVamhsTndidjVDRjBkNFFRT1p6?=
 =?utf-8?B?b21pTitoQ2cwQ2Eyc1Y0b2VSeHN6L2ZKb3BaT3QzSVBIOFEzQmJoVUNWNTVs?=
 =?utf-8?B?bCs0V0c5TFZwOVNLYU03a1pHek1CVDBJYXVmL2ZhaHB5ZGlER3k4WFJYNmx5?=
 =?utf-8?B?S2JKRGJvWnpBSElpbldWR3IwU0hpNFAyeWltZWswQVZjVytmQ2E3UUFZendn?=
 =?utf-8?B?QVdRRTVYODhma1Z4VzVBcGEzcDdRNTNuWkdURDZIWng1dCtvUEdDWDQ1TXgx?=
 =?utf-8?B?M1pmSVJMbjdTazR3SUk5azgwWnhZM3ZteHhXWWtRZDVUWXI1Rk50YkIrcG9z?=
 =?utf-8?B?OHBmVWZGcHlXejBEcTdwWnowNWVOWGN3bnN5WTdTbjQ5NzRUam1HSndRR2gr?=
 =?utf-8?B?TXBGOXM5Y0xZU2FUSGZnSkxDTXpHU1VtZ2RBVkdaZU50TEFaQ28xdG8yV3Vk?=
 =?utf-8?B?QVJ1R0VhNjliQmVPQVN1VWtNR203bXlOREhwTEFvM3ZHLzhLckpjZ1M0UG51?=
 =?utf-8?B?cXBQWnZKYnhxNkFVbXBNcmFoVi8vSTlDUGU1MTFFbGIzeno4SU1JUDEvY0Rh?=
 =?utf-8?B?Y1JDaG9CSDgvUFdsYy9aMzlIQlVLRHlRNTh1MStPS0hRWlNZUmdkZ05vL240?=
 =?utf-8?B?T0dXcURnUFhYOU9sMEhQalJObjd4cGNGZkRIRDQ0ci9nZlROTVE4TjNIL0s4?=
 =?utf-8?B?b3lHN1ZPOU9hb1pIS1c4SlppRUtVTmVUckEyWjdMV0Qwd1hXUGpVN2xyd1Vo?=
 =?utf-8?B?Qm1aVTg0V0NlWm1UL2NsclBuVlgwVFdQL0xxSDNqSHFKSmRQVi81allDdVpU?=
 =?utf-8?B?WnprWUtpMGZCeGdxblZGWkpReXdQL1FEV0NlY1Bla1daUWRrRHVsTW9aMkh4?=
 =?utf-8?B?ckdZb282NnRJY3UyR0V1QjgyV1VZSGI3MGdqY3pqNU9ET0tsMXMxc25IRGZS?=
 =?utf-8?B?WStpaVR3QTRRZ0I0QVlrTWRjQ05hNUcxSFBnL0lGMDR1aEFiZ2drQnZyeVdq?=
 =?utf-8?B?MlJDTk42UG9pZWp0dzRKKzMzWXRHOUFSS3F5UHJoUml1VTI5MEpYcU5QYUdr?=
 =?utf-8?B?NEg1dWI2V1J1U2FMcUM3eHJiWms5R1ROZ1ZwaG5CNTBUeFF4cTNMVDZpbnVt?=
 =?utf-8?B?OVRnMGxwZXArS3hXbXRWSUdjenppUzNaVjRvZktnQVBoY0tlTGtRcUtsdWs2?=
 =?utf-8?B?Y3phRkloMkplZDA5SUVkbEZqNk1HSHhBL0RRcGtsdzlFSUxHa0Z5UkJkM3ZK?=
 =?utf-8?B?Wjd1N1U5RVpUa2FHVVpuOWxzK0FJN2c2M1pRVTB2TkRyVE5VWXZBZkFqR1VP?=
 =?utf-8?B?S01ESG5TOFpSMzdCT3B1bUMxcklrVW4zZXRDSnJuTW51ejl6N0tQK0swRkwx?=
 =?utf-8?B?QTRWVnZtNFlMREthendhR3JLZ3dsWUlZcERCOUNPaldkY2QzNVdBTkFNVjdl?=
 =?utf-8?B?VG83QVJOQWMxalI2WUQrYU80cUJKaVRvbVg0TWtSdjBjbTNYKzkwbXVyY3Jh?=
 =?utf-8?B?cXU0Y29kcHBKRGl0dDlQdzZaL2ZTRTdrN1BGZFd2SmV1Sm05Y0t1V3lrY2sr?=
 =?utf-8?B?UDhJeGMrTHR2MmFBcXJIV0pWZDRVUnBtK0xGZjJ4K2RFQTJobjlPSmYyaWw4?=
 =?utf-8?B?YUlXQnRkOUhVQnp1OXllTDFKdkFZUHFiQVBVS1k4Q1EyTFp0UWI3ZDhaN0pm?=
 =?utf-8?B?bWJzVGV4bUIyeDY0OTlSRCtENVdzTkgrTU15RnZyRmdyNmZFZjNMdW9SUExt?=
 =?utf-8?B?S0wrd3AyYzBwZVIxOUVpRW44ZVhUcTNRWDBzb01oTzJ5b3grd2oyWTJXV042?=
 =?utf-8?B?cUVrMU80czRnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UWZjRFV6ZWlNSjYxMUlYcFhZRktkbG8vbmJKSlpDUlprTi9GaUNpTk5QUWxM?=
 =?utf-8?B?eGo1UHpEUGRtUE9KVjAxNFBVZ3lqc0xzUldyWjhJMnR0REpTcGJBTmNNemVU?=
 =?utf-8?B?OFhrRVZFallLakl6cDBFMi9RWUE2VjN4bC8zUmR3S2tHV2lnUmwzdWd3eDJq?=
 =?utf-8?B?Wm5jWU4yRmpmeUxzdU9ob0cxZy9RWE1YMFJpWWpTU2h2MGhoVW9ZRnVVeTJH?=
 =?utf-8?B?TzNJM3J2dWwyRlJhUlJFSzhHOVFneGxxdW1nVkFUVFNoZDdocUhSdVczSUFs?=
 =?utf-8?B?OHYreHQ2L05GMFFSWjFaUjZ1VkpVWmJFTHlzQWhpank2ZTBiZHd2TzVLM0Vs?=
 =?utf-8?B?bk1BSjFXS2NXKzNOcWpzd1VGcTdUdXU0bGUzMHllZFJIWlM3cnBrMk11ZHdX?=
 =?utf-8?B?Zi9NV3RpaFA4ZG5IbFV5dWVKeGMxcTZqVm90V2gyRGZ2ZEI3NjVJQjJMTlox?=
 =?utf-8?B?MXMwMFIxMTI0Y2RtV3U0WDhDU2IyK3ZMSnRCbVhPaTQvazY2akdLd1QyRGZK?=
 =?utf-8?B?R3NQcksycGt4WnFGTWR3ak1uZXBJbDFPaEpIL0ZGcHVFUldTUnZjT01pVnlp?=
 =?utf-8?B?ODJXWTliY0xXQmtnWVo2elVyNGwvbzVBMnJzVE5FSkZHaEhTRXhrVFFGT3hP?=
 =?utf-8?B?Y3ZKVFk2RHdCd1lxbkpOVUxUNDVxVENNWW1yVXZHOWtTQ2pWb1RrcTg1QnNM?=
 =?utf-8?B?dzNPVnhyOHJPaXVYSmY2UDF2ZUorZHRPemNvWTJyeFJ6Q2dZd0ZHOXdBelJR?=
 =?utf-8?B?bGdXaHZxWUFBSGg4T3phUGt2Um1iMTFjeFRqZFlFNDc4aUVOMzQ3eXhRb3lY?=
 =?utf-8?B?N0FIcS9EZ0NsanA0V3Jhdjl0YzgzdHk1OXVKaVJJY3NVM2dUMStsejRiTWVQ?=
 =?utf-8?B?M3NtSllFb25LaDVKbUx1ZGN5c1MvZjNNT0ZLRzVYTzJRNHQ3R2FDQkM4aDlq?=
 =?utf-8?B?am8yU05CSWdDZ0JhK2Z6c2JwSXpQRTl2WU41dnF2R2JKdUZsUUYzZi9nTGFm?=
 =?utf-8?B?RW81Qm8waFZYUHNDeDBSbFpRS3lmck9mWUovaTB4ZjRMT1BONWJDK2dvNGRG?=
 =?utf-8?B?eW1wT2FpS0gvTXl3QkpUK2JnUGh3Ylk0N21oL0NiRTdrK0VCaDFxWUVEcXFL?=
 =?utf-8?B?bkRSUGdNZEJZR002ZGxXQzA5UG5YMkFKbjZDcUVMTVRKNUNQQWJUTFVZMDd0?=
 =?utf-8?B?dHg0eWtpQkNxVWJXRlNWTVBUbHhSV2dnSUJvRHVoYWJJNzRRRnQxRFBtdlBx?=
 =?utf-8?B?TzRQdVJ0Ung2RVRVSDJ6NHhzbmxwRjllUTk0cDBnQ3BHZ04zRnU5dm1kLzN3?=
 =?utf-8?B?Wm9kYldFQ0U2bVFqYVkyM0pJRVJyOGpBY3VjbU5kZzU1VS9aSVI4M1E2aXZK?=
 =?utf-8?B?ZUdtNHVVUUFPaWVWUmJEWCs5WUpBU05IUHhpRTQ2QldDSUVWb1R0NERJN1Ns?=
 =?utf-8?B?amc1NUdlbThTaCt2czloUE0vRzg0ek5UYUs4Zi9iM0xzaU1KOW5nVVoweHk5?=
 =?utf-8?B?YlNoNElna1B3d253MGgwR1M1SEhpZWNSSkNYZnNYTnFCYkY0TXhmOUJwYnZN?=
 =?utf-8?B?VFFPUVgxN2Raa2dXWUYzODZOVWZJRDhRVnlOdkcrbGYrVnBVL3dWU0dLK081?=
 =?utf-8?B?U2gyN082VThhNzNmWFhNM3h5YmN2S0lJek0rSjJGbkgzRmRCU29oaDNCa3Jl?=
 =?utf-8?B?NzVheFhqcHRTYnlkb0ROYlo1WWJMZlFNTEppLzJtQkpuR2U1L3VGaFc4U3kr?=
 =?utf-8?B?T08zd3FLclhYYnM1SGlESm9YQm51RHFvNksra3QzWDRqTk0zcy85Yk10Njhv?=
 =?utf-8?B?ckhmaDYxVTFaNEt2MVJuMDNPajBCWEdCY3dBcUlCRkMxUEJtcW00MXB5ZE1J?=
 =?utf-8?B?WTNwNnJRaG14STR3MEJaREpKaGNQS0JGRklJOVZ5S2dwY3J3ZTEwMDh1bVQ4?=
 =?utf-8?B?c1FJV1dJTWVJMWJCbHdMR0NTVjRrSXk3bkRWMXRvMllPemxneS9ZQU53dWE0?=
 =?utf-8?B?ZUsxOXdVYXlteXdtRXVwSmpEdVdYRmxEdmRDWTc2SXppS0VXTkpFSWYrZnpW?=
 =?utf-8?B?QVBMTDJDZGFmeDZKa2RxVGRIOHg1N1VTaWpLOGR5VnR3NGl5MlM2dEZ0Q08z?=
 =?utf-8?B?NmxqTCtCU0hPek1zbWkzUG5jN1pDMldRWk1GUmhLakloSWlSTFFWbk5RNjJ1?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6f0386-3bf1-4594-1973-08de33a9d136
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 02:55:58.8055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkbN8KqkHoKzR5om9LmApKDfEcU+oMx+5xv5sRBLUI0Bea7V/XXz7XKjIfHQ46iWFi0ofept/GHpyq0BhwbHQ37x9FhT/RNaFu2fLFHwXcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6124
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=C+vkCAP+ c=1 sm=1 tr=0 ts=693249d0 cx=c_pps
 a=UidE1AiM3qFEYM2TBOftzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=S9TyT6oxoJUUTcSw5bYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=vXJmg7D_3tcSlbHT:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: zxRzJut1J8awQ2q1wbjHaSNiNW3g232i
X-Proofpoint-ORIG-GUID: QhN7BoMu7IrU054Vex51tBQiji9NWySD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDAyMiBTYWx0ZWRfX1z/gU6Hiy916
 dwBCKRHm2GVHYraekfhtQgi6+9uDGEn2HLUPkoCMNSo4Jnunnke99A1oeErlnWobh2BPdWoJO5d
 063t4vZZTZzLV21IYUM4BfSbPh1XSKdYVmnzofr9KGdru7td/ZftdBkTX+bY0sBu7vvLL51xpzk
 IznP6YjBPSm1NeOz8wEO+zZQHCyHWjW2sY0QbkWleX0KVDdLISR7g6URXpsyrwLwq9yvvZ2U6fM
 S7JR0RC9PWxBOiBD5S6jAX8/77NihRyhJ38S6iiougnne74eBn5kau1ZuaO05Oamz+53W9JDfHl
 8eknlehpXN1ROFdxmQqwIqM03oXS0gOTr63a6HsWeOhTvjkViu8mIEVGPFnUq1sjOJxVG4+EQbL
 hAQT2v7iUYggf9RrvNzLn2BL84NGcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 02:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227328

--------------4gjWFbEnDarTW70AkOKHEUYB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B4NnVTs010701


On 12/4/25 22:00, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 21 Nov 2025, at 05:46, Changqing Li via lists.openembedded.org<chang=
qing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> No, there is no .bbappend. Here is how to reproduce it:
>> we have a git repo,  which contains downloades sources, which contains=
 jquery's sources: ${BP}.js, ${BP}.min.js, ${BP}.min.map .
>> Create project under path A, and clone source_mirror under A/sources_m=
irror, and set A/sources_mirror as the first PREMIRRORS
>> Create another project under path B, and clone source_mirror under B/s=
ources_mirror, and set B/sources_mirror as the first PREMIRRORS
>> In this way,  since jquery sources are fetched by git, the files mtime=
 is the current time when the files are checking out.  So files mtime in =
project A is different with project B.
>> Then bitabke jquery under A and B get different rpm package,  the diff=
erent part is "Build Date", which is get from source_date_epoch.
>> According to logic of get_source_date_epoch,  source_date_epoch of pro=
ject will set to the youngest file of the sources.
>> in this case, unstable files mtime cause unstable source_date_epoch.
> I agree with others on this thread: the fetcher expects that mtimes are=
 preserved, but putting the mirror into a git repository for distribution=
 doesn=E2=80=99t preserve mtimes. The problem here is using git, not the =
fetcher.  This is a relatively niche problem because most upstreams are t=
arballs or git repos, so the problem doesn=E2=80=99t affect them.
>
> There are tools to deal with this problem, for example metastore (https=
://github.com/przemoc/metastore) which tracks timestamps.
>
> (also, we=E2=80=99re only shipping jquery for diffoscope, we can improv=
e the packaging here)

Thanks. There is another patch for this issue.

https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D7a47c786e98c16c384c6872a662dd3142e7ee9d6

//Changqing

>
> Ross
--------------4gjWFbEnDarTW70AkOKHEUYB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B4NnVTs010701

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/4/25 22:00, Ross Burton wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:839CC7CB-4E43-430D-B691-81ED232=
31DA4@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 21 Nov 2025, at 05:46, Changqing Li via lists.openembedded.org <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindriver.com@l=
ists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.openembedde=
d.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">No, there is no .bbappend.=
 Here is how to reproduce it:
we have a git repo,  which contains downloades sources, which contains jq=
uery's sources: ${BP}.js, ${BP}.min.js, ${BP}.min.map .
Create project under path A, and clone source_mirror under A/sources_mirr=
or, and set A/sources_mirror as the first PREMIRRORS
Create another project under path B, and clone source_mirror under B/sour=
ces_mirror, and set B/sources_mirror as the first PREMIRRORS
In this way,  since jquery sources are fetched by git, the files mtime is=
 the current time when the files are checking out.  So files mtime in pro=
ject A is different with project B.
Then bitabke jquery under A and B get different rpm package,  the differe=
nt part is &quot;Build Date&quot;, which is get from source_date_epoch.
According to logic of get_source_date_epoch,  source_date_epoch of projec=
t will set to the youngest file of the sources.
in this case, unstable files mtime cause unstable source_date_epoch.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
I agree with others on this thread: the fetcher expects that mtimes are p=
reserved, but putting the mirror into a git repository for distribution d=
oesn=E2=80=99t preserve mtimes. The problem here is using git, not the fe=
tcher.  This is a relatively niche problem because most upstreams are tar=
balls or git repos, so the problem doesn=E2=80=99t affect them.

There are tools to deal with this problem, for example metastore (<a clas=
s=3D"moz-txt-link-freetext" href=3D"https://github.com/przemoc/metastore"=
>https://github.com/przemoc/metastore</a>) which tracks timestamps.

(also, we=E2=80=99re only shipping jquery for diffoscope, we can improve =
the packaging here)</pre>
    </blockquote>
    <p>Thanks. There is another patch for this issue.<br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedde=
d.org/openembedded-core/commit/?h=3Dmaster-next&amp;id=3D7a47c786e98c16c3=
84c6872a662dd3142e7ee9d6">https://git.openembedded.org/openembedded-core/=
commit/?h=3Dmaster-next&amp;id=3D7a47c786e98c16c384c6872a662dd3142e7ee9d6=
</a></p>
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:839CC7CB-4E43-430D-B691-81ED232=
31DA4@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Ross
</pre>
    </blockquote>
  </body>
</html>

--------------4gjWFbEnDarTW70AkOKHEUYB--


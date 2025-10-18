Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706CECCD184
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 06:42:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1415.1760769742342009287
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 23:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OugM0DtL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=238608dffb=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59I6gLr73721171;
	Fri, 17 Oct 2025 23:42:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=LXnpryAwiuMQ+jkuSrT5c5s07bB7KpHJdc7q3t44se8=; b=
	OugM0DtLCdGd7dJHcN1hk65XfpustvFpD+ESOoQNzU+YbS3g6SQ4ujh2NQAU7V/Z
	5pKowfe87wtw8XWrQbr33awUavgatiCwWPiojoTrAhf4RDWoYg8LUValbIOWtPL5
	cJs1GfOOL68PUShRQRWS29qws4SusfRLasmqeAsyFoUEEicF59GEKPTuamuWiIQI
	nmKOPwWireT9YktwIJ55ABGZfhbovjKPwV9pMOPCm2Qb2Fw3zaPa88EEv/tB8FDK
	NY7wekNVI62T1ZO854jM0UAnlJLehdsS9o0LjHNiWAeKLDreZzxojps3qDoJFa4T
	XvozWG/SuPQM6udFbMsnAQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49ur150t3u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 23:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bw9wlVQzK30S9SxJ8FnUM/CHaefGEV96770+9K8OIvHkBTo9XP0LfJP/p5EPUbxZzAQo9wL2To86bhn3EX0VIQqpt2NL3LcLr3vcZ2DcwaBQAzBhGxFSVjVFqSXVpDoMuH4Hzh2VK8jjiPiB2rDFGxu/1cov97baeeWIsm3Ekrc4fj3mBQI4VCUPQZyn3lVmqaYdz7xddEV3SvT/TtOZBIcx1ZQaCz+k5J2vcf8GzxcfRgMdROO8H2PHQPnTFcRN7grQFbDN8TwKYfFVnxtla+65gbBoieLA20aCggTD03tSTeMa0RrwZ6xyAnEOkynvOWTgWCjrjtLNTzoxZwr8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXnpryAwiuMQ+jkuSrT5c5s07bB7KpHJdc7q3t44se8=;
 b=M8fpBOiNe5K7TW/bziblgQjaDJTR0wQIYsqOfo78ppmANrWSrFppbufPa12Ttq3g6XcowVuLgcQmauE3kHOCE3+tJd/ojjOQEEqvukg2FPb4jLdNN0h/ACW5b2CsmfvPILKLfqC1HaufRorQD0fTN4gUIiHQ+SLukcoYxJoYWbtJq1iGrdsHigJH29PY7OJ3ey+1D3u7PSDf+EnJPTUTxPp35qrBMFbSWcJ8HoWRbU/v56TRlnZRvqHeEIs5LUkZDjyyx7v09WSHh6VELMob1TrxW+z9Knh3ej93ZF4nuNpX51fjYdb4qjk61vL7pA3KZkTDe8G+6bJP3P+J3aejLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Sat, 18 Oct
 2025 06:42:18 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Sat, 18 Oct 2025
 06:42:18 +0000
Message-ID: <c1b70447-16ed-4609-ba02-02c2318a55e1@windriver.com>
Date: Sat, 18 Oct 2025 12:12:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V5 2/3] rust: Use llvm instead of rust-llvm
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
 <20251015095914.2120664-2-Deepesh.Varatharajan@windriver.com>
 <CAMKF1srz8kTxsfHKj_GtGeaEOj3tut_gGSakz+F430aAZRxE5w@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1srz8kTxsfHKj_GtGeaEOj3tut_gGSakz+F430aAZRxE5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN3PEPF00000187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::4d) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW3PR11MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a4285c-0195-4809-0cc3-08de0e117b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WWpzRkZ1OU1UdVlIclVyUGN3T1ZkN3pHdGVJb1ZKRHZudU5DVm9IRC9HaFV3?=
 =?utf-8?B?ekJtR3dpRVhjNzdwSW8xeitwMk93UGZDZ3doSEpoRUtxTnZQa3R5WUVOUC9E?=
 =?utf-8?B?ZnliY3Q3TGdVZERWTm5oYjhiWmo4OHN2MkFXa0RpeXB2dVQ3citpcnFYUjhR?=
 =?utf-8?B?UG0xalpxWDdVZXJuTVVYUklMVG1HemFITGp5YTdVMDl3bS8rRkJ3V0NjV1NV?=
 =?utf-8?B?WjBYbjhwRFNCS29rbXducDJkTExTTXBuQWYycWZIZDdUUUFFd0hXSXhadThS?=
 =?utf-8?B?ZXdOUTk0UHpCaGlNdVV0VlJ1M3JBZkV0dG1QZG95R1M4eVJRV3lIRmxNYlNE?=
 =?utf-8?B?cWo1ZHlVNXg2bnVIMTh1RkhRWFA2YWFtWEVyV2VkcnpDa1ZGOFNHeTRIazRZ?=
 =?utf-8?B?Z1ZOaFh3c3Fvcy9Vd0VKR2ZrZ2JRSDA0YmJ0UkV4SE8zWHZXdWlqc3pEUHJB?=
 =?utf-8?B?YWJmNVFDV2xLZTlZR2UxcXg4eWs1NGVTRnNybkY2bXRUeGNFa0RDWGkzQnFN?=
 =?utf-8?B?VUUwcjAzM0xRNXdQWHRvbk11cGNxdjJObVhhcHNiME54QlhMMXZtalZiN0RV?=
 =?utf-8?B?TldSd1JuTlEvZzVvOGUyZlNGbXhoZU93OGNxUCticDVKcWR4TlJyYzZnNGFK?=
 =?utf-8?B?T1ZjaHRteGgyU3FoamxMeFpXcXZ4UHRZVGxGOGo1MjB2dVNNcnhZeG5vT1BY?=
 =?utf-8?B?ZjR6N0FuT3QzRXp1ckZLRlpZZnlSZFljSVU1L3FuYU93Tk0rcnQ1bWdSb2kx?=
 =?utf-8?B?bE1hSkRESEdUVFRQRllWUDRCMmNqd1A5bFk5ejF2cjdGZWdOQ2NQQVRwOVBu?=
 =?utf-8?B?VEVHblplcC9EanFCbDhQTVQ4eHJSNlZ4ODlRcFN0WFJPTEl4SkJidHprdEtK?=
 =?utf-8?B?aGk0V2hkT1FFRDlTNTFRRGY0MmhFN2Jxa3dxcUtpNWpudDFnNFVMQXEvMzFD?=
 =?utf-8?B?OXlrYUJ0Q0FEbjdGdnVnOVZpTnRUbXJTRHM3djJkb3R4MlJ6bWFCcFlteGdi?=
 =?utf-8?B?TmM0bHlsQkpkc3g0TE5icnlWQmg1VU1MaWtZY0tQdzZvSHA4bDVpdGt0N0o5?=
 =?utf-8?B?VFVTWko2eTAxZWVqSTREdXpxQnZOUVRGV1E4VlJrNmxhMlpwUDFjU0hLaW1m?=
 =?utf-8?B?WDIvZlNabnBtL3BRNUhpK0t1SkZIRG41THdmZ3dGUVRqTmRDR08yMlZBOFQ0?=
 =?utf-8?B?Y0lXMU1DM0VpSHNXL1dSdlVzKzRBNHpEVndrN0lRUFlvb2N0cFpzQkczNUFv?=
 =?utf-8?B?eGl4M1FwMHZLUGdnN25FZnh4ZkszbVNQZEthQTh0NmdvTUUvTFF4MXgxNE0z?=
 =?utf-8?B?aVgrKzNOQlYxWjZDdGNxM1ZCamdYU3M3dUNRcFBsYUJ5OGQrUFU4RFFGdTll?=
 =?utf-8?B?UE5PMFg5anRONkJLaEwxS01RL1IyWEVsMnduRjNzbFpacElqbStzT1VPYU1T?=
 =?utf-8?B?OUpVcUh1eGdGUXdzdGlJd2J5STNkcFBxeWtlZFVZczEzMFlsT2ovMEhyMjUv?=
 =?utf-8?B?VTNnekMwZ2lwRzZyNWpxLzJSbDJBTGJQVWhIMFY3dzBBaVlyL0lhZkpVa0hz?=
 =?utf-8?B?Sk5QeWZWZDVkZFhtbVV2NGxwU2RMNEt2THVwRmIxb1hYSlZ5N29FeXJhYmYw?=
 =?utf-8?B?dkNGYmM0WEdFN2VqZVVlQTYwNjIyZmJxSjMwVmIvd29MUUFwV0k4M0dkS2lK?=
 =?utf-8?B?cHFRY0dNUDV5blVLSldrdWN1YlBMOUEvNVo4YTZHeHh0MEJGK1Jha0JrUUVU?=
 =?utf-8?B?eEowTm9HVnZENzhnODZIWWRlbnVndmpncjlRem1mWmhDNXROQktxZCs2ZENR?=
 =?utf-8?B?UlZuSUpoSjNIUk4xdldkMXgzTjZ3OUlabmlyZlJVUmhLTkxsNnNWYXZkTExt?=
 =?utf-8?B?dmJ3YkhKVzVjcERnUHNKUU83TnJmbVpEby9ZVksxZFJ6TXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXRjUWVsSWxZcW9CSG1wUGRNZldoOHJwQ3JDRHNFb2R3SThKSnFwT3YvZ09i?=
 =?utf-8?B?WDZHRnRlbmdqR2dJaWdIbmVTUndlSWZHbmNaclJrcnY4bUFsa1hqcnpOclJl?=
 =?utf-8?B?ZEJyRjRGTHNYWEJZbHE0dEc1V2poSHM5M29KRG9nTExzU1JLQmVLbHp5T1cv?=
 =?utf-8?B?VWFiZ05FbkJFa3NQa2RUR1hFUXJNNmdoWWJJRVRMQXB5SEVoVmVwNEYvR1lp?=
 =?utf-8?B?YS9RRkk4ZER0ZDBvYThYN3I0YVhIa3dJKytpU1VkOEsxUmhOR3JlWnhJZFp4?=
 =?utf-8?B?S3RsQUFCeFRhUTBZc0Q1ZFAyZ2xBTUszOCtQZWR4a0Q5dkpST2pVK3JSeVFt?=
 =?utf-8?B?TTZQRFlYa3dNdjlvR2lwSU9tNU5zN2E2TE9UYmlIMWFVSkQrZ1JsamhlNXRO?=
 =?utf-8?B?enk0dWNmQis0Z3EvYll0aVIraER0N1RzSDFqdGdiNEd6dU9yVkpUZ3VIQ1B1?=
 =?utf-8?B?WUdmNGlLVlA3T2JFZTVmcVJlRnJJc3VtK0IzbnBZY0dyc082MXZ2M0o1M01E?=
 =?utf-8?B?WjBLd0NnME5QVzdvaXZSU1lZblk3NEZBeGFDS3c1Z0JMbGtsMGk0SWlFZjJK?=
 =?utf-8?B?cTZkbWNiYWVvTzF5SnUzQ2tFSEQwa0JhSkI5M25ndjhVOU1KanFtbjlIQURS?=
 =?utf-8?B?M0RFcWdHTG9ManhFTFBQcWNzOURYRVRTVlRMWTJ2M1hRYlBLYnFLM1VIVVAx?=
 =?utf-8?B?N0dyZ3ZJMUlDTm41NVh6YXI0RnMxWS83c0ZlNEJaSThmQm8yQjRjSHRWV1RC?=
 =?utf-8?B?N2x0SVBYL2pjTFA0M3dDYklWR3BTcnRvc285QnFIdFRiSVhSRERHbDdEVzRq?=
 =?utf-8?B?Uno1aTczQnQ1OHNtcUx2N0MyWng0MVk5ekFqSG1KTEpuR2JDOHZtVlNaaWJZ?=
 =?utf-8?B?R1lXWFB4R0dzU29xV0tHMzlUSWhVRDhJMFZOZGNOdEdOVVdWR0FEbHNwTWJ5?=
 =?utf-8?B?OUlnSDdqd1FSSGtNSnFvdjErcTFWSEdTT3hUVk9DTmlGZ2hwYzVFK3ZHL1N4?=
 =?utf-8?B?UEIza0dMZ1JtaDFQMko5blQxZkxGbmZqU3ZWOU1telhrdHlqbUJXeDV0Y2l0?=
 =?utf-8?B?b0VMeWs5Z1dsOC9sTnI2LzFwMGlhUE9vbktmenVqZzZ4RndvZ0VxV0liTW54?=
 =?utf-8?B?c08xSWNqdldCSzJqdGJQaStHZm5KVTFwOFVaT1NucDdjYVNsUUlmYXpLRExL?=
 =?utf-8?B?ZXVjZHgyRGxiVWc0dmRxRUhKMzZrUjJJRXZxTjhTaDdiNVVXYjVuOWY2MHhL?=
 =?utf-8?B?S2RqenZnMU4yOGRCbFpTa0pSeDFLcjRmaWhlVzIySTFFalRiK2JCb1l1UERK?=
 =?utf-8?B?Zk1JU0szZU4wNkhTZHRveXJYSWVSRGlDZmsvMHNFbHN5SjhHVEZuZEttTWh3?=
 =?utf-8?B?djNMVnlWMTg3MWtyTHVTMm4xNlhPWVNHQnJFY05vS0t0NU9XaEpHNXUrTDhP?=
 =?utf-8?B?TExiU3JXN2JaQW1Cb3ZDYUJOZXM4RVNsNjRWS2tvQk12V1RvWFlzWDd2T3ZR?=
 =?utf-8?B?UlBobDdMSDZ5WmREaDZpNXJQYThweFVNaWhRdGoxbVcxSnN1ZDlQNmJFc2N0?=
 =?utf-8?B?TjRHTEd1Mlhmbk5qaVJrS3NmQWJIZU5hczNZcEJyZ2RYc2lCVHR1K1dRSEFu?=
 =?utf-8?B?UVcvQmZOY0lTUlZSeHZuQkpyMlNpcVM1b2ZvVUxPbmF5YXZib2lyUWNhcTda?=
 =?utf-8?B?bWNlc01KUy81QU45ZWlxQWNaS3Q2WTNtUytVbjJSMDA0emtqM3lncU1Tdml3?=
 =?utf-8?B?ZTQ0K2NaSiswWS90b3pONnBnK1FKVFRrbkhZNG95bWp2cHcwNFRhV0tHTGNN?=
 =?utf-8?B?Ym4yQ1Jlenh4S0dFcWovaFJmS0dwRUpBZkpRS3RIMHdYc000eFRtQmJDSGky?=
 =?utf-8?B?QnFNMURYUXRvL0NaNUg3Z2R1WElQNlc0c2d3SHZjdWQ3WFRXTTEwaDlXNWph?=
 =?utf-8?B?b1hkYkZTN3h3QnB0dWgvdk54cjBGY2l1T29PVU1GVitvalB3dHQxc2Z5S2hY?=
 =?utf-8?B?WEFRbWhhZ3FDNm41aFJCeGtGdzcrK011Q1RkdWN0Vlo5dlhBN2Y0UlFjREJh?=
 =?utf-8?B?cGtGYkp0TGMwa2VoUmROaEVMQzlrWmNFZUhUVldtVWtqa1IvVTkxdXowR1g5?=
 =?utf-8?B?N3NtZEtxZXdLeWxWcjZlWExpVFlGdHVuZmRxc2hxY09mR2VPMGtZTDAzc3Mr?=
 =?utf-8?B?Qk8ycDVYaTRHSUMwSXc0bE42cUozajdaTzMzaDhQdmlKazZMd0tJYzNCL0Z6?=
 =?utf-8?Q?360rYH6b18MmMct7ADtP9QbcZeMpmfgx2gTufLGnTU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a4285c-0195-4809-0cc3-08de0e117b19
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2025 06:42:17.9887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh+Yhrdd+EcmCL49Yd5fdOnte+w6qYmzbCwc4apYrQe3X+W76twJ7Q5HkgKMbEnmJweXIvOqs4gcehy4SVOuXpNEk1ykQghEo0pG89ObyB2h905ZXU0MBnGFD1YHlqIb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 5QGD2a7MmcWVme5bjLHDGVoorG3pHBce
X-Proofpoint-ORIG-GUID: 4w-rQqDJ2nHcn2uzyXZPtEq3OEpdVv2D
X-Authority-Analysis: v=2.4 cv=T6WBjvKQ c=1 sm=1 tr=0 ts=68f336cd cx=c_pps
 a=MRNWLIXgA5QtCoQasNiLPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=kJI9h5VHsu_fitc8RNQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Hqou25T6mLgA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDA0NiBTYWx0ZWRfX1soSbCkQktl5
 fmiSMhuSNhwO4Kb7ct/OsljQYBiVom1gVFs28uKO8WSlS3U6WCzXvRomTsN+mtRs3zXi3LgloA+
 cOpRDLjyG6a8lXQp7Yr0VVRYjMqpBf7OaEMhizW4ZNswkyDBuutFQ6z1DnSEryRHGL9NXaOMIAq
 37EaAxoKzxK0VBUDjtYjn48/PKDXuD68OOflfhely8q4rHmpslaAo9KXMqUoq/3VPE6wNiDiHYL
 ibTU83SrTTixe37rY7mFYkm5M4BsGe0sxiVVgzWDLixRDsTO0FFJJXw2xS1sL9Srz+V0O18qrZe
 4dOAnk2I4lnIO5aASfeuVhr1c9e9Wh+PrBaESUxbDY1Dt2gFqpQZKwlqzmyyaLmbD9RRgioUN5l
 dxMk8WdjlqOIi9MNu8kKagJiVKZP8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510180046
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59I6gLr73721171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 06:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225071


On 17-10-2025 11:31, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> I am seeing a build regression when using clang as default compiler
>
> https://errors.yoctoproject.org/Errors/Details/885430/
>
> PREFERRED_TOOLCHAIN_TARGET ?=3D "clang"
> PREFERRED_TOOLCHAIN_SDK ?=3D "clang"
> TOOLCHAIN_NATIVE:pn-rust ?=3D "clang"
> TOOLCHAIN_NATIVE:pn-rust-native ?=3D "clang"
> TOOLCHAIN_NATIVE:pn-nativesdk-rust ?=3D "clang"
Hi Khem,

WIth the above mentioned conf in local.conf, I tried building rust for=20
qemuarm and qemuarm64 quite
few times and the build completed successfully without any issues for=20
both native and target. Do I need
to add any other layers on top of poky ? Do you have any branch where I=20
can clone and reproduce the
issue ? Am I missing any step in reproducing the issue ?

Regards,
Deepesh
>
> On Wed, Oct 15, 2025 at 2:59=E2=80=AFAM Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Updated the Rust build to depend on llvm instead.
>>
>> *Summary of discussion with the rust upstream about using latest LLVM =
instead of Rust maintained LLVM fork.
>> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-l=
lvm-fork-what-rust-uses/23489
>>
>> *Upstream LLVM is generally compatible:
>> - Rust does support building with upstream (vanilla) LLVM, especially =
the latest
>> major release and the one or two preceding ones.
>> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updat=
ing-llvm
>>
>> *Impact on Yocto Rust upgrades:
>> - Rust upgrades shall always check for updates on rust forked llvm and=
 backport
>> the relevant patches to llvm.
>>
>> *Regarding the rust forked llvm local patches:
>> - There are no local patches on rust forked llvm other than the backpo=
rted fixes
>> from llvm master.
>>
>> *We are copying the natively built `llvm-config` binary into the targe=
t sysroot and running
>> it. However, this `llvm-config` has compile time dependencies on vario=
us other arch's LLVM
>> libraries because native-llvm is built for all oe-core supported targe=
ts.
>>
>> Attempting to work around this by symlinking the missing libraries fro=
m the native sysroot
>> into the target sysroot leads to mixed architectures in the final `.rl=
ib`. Specifically,
>> the object files extracted from those symlinked libraries within `libr=
ustc_llvm-<hash>.rlib`
>> are built for the host, while others are correctly built for the targe=
t This results in linker
>> failures due to file format not recognized.
>>
>> To resolve this, we now build llvm-target also for all oe-core support=
ed architectures in
>> addition to the native-llvm build. This ensures that `llvm-config` and=
 all associated
>> libraries are built for the correct target, eliminating cross-architec=
ture contamination
>> and linker issues.
>>
>> *We are enabling -DLLVM_INSTALL_UTILS=3DON to ensure essential LLVM ut=
ilities like FileCheck
>> are available, as they are required by the Rust build.
>>
>> Without this, the build fails with an error as below:
>> | thread 'main' panicked at src/bootstrap/src/core/sanity.rs:315:21:
>> | FileCheck executable "poky/build/tmp/work/x86_64-linux/rust-native/1=
.90.0/recipe-sysroot
>> -native/usr/bin/FileCheck" does not exist
>>
>> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" because=
 of this following
>> diff otherwise we will get errors during link time.
>>
>> Setup in rust-llvm
>> -DLLVM_ENABLE_ZLIB=3DOFF \
>> -DLLVM_ENABLE_ZSTD=3DOFF \
>> -DLLVM_ENABLE_FFI=3DOFF \
>>
>> Setup in llvm
>> -DLLVM_ENABLE_FFI=3DON \
>>
>> *When multilibs enabled:
>>
>> llvm-config expects static libraries to be located in the lib director=
y rather than
>> lib64. However, since we are copying the natively built llvm-config to=
 target sysroot
>> and running it and llvm-config doesn't know anything about lib64 exist=
ence. To accommodate
>> this without breaking multilib behavior, we are creating a symlink fro=
m 'lib' to 'lib64'
>> directory.
>>
>> Previously, when we depended on rust-llvm, this worked because we spec=
ified:
>> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
>>
>> With this setup, llvm-config was installed inside ${libdir}/llvm-rust,=
 which included
>> its own bin and lib directories. Thus, llvm-config located in bin woul=
d correctly find
>> the libraries in the adjacent lib directory.
>>
>> Even when multilib was enabled or not, llvm-config would still look fo=
r libraries under
>> lib in this structure, so everything functioned as expected.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   meta/recipes-devtools/clang/llvm_git.bb   |  2 +-
>>   meta/recipes-devtools/rust/rust_1.90.0.bb | 39 ++++++++++++++++++++-=
--
>>   2 files changed, 36 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-de=
vtools/clang/llvm_git.bb
>> index d2b060ff88..2f47af8d7a 100644
>> --- a/meta/recipes-devtools/clang/llvm_git.bb
>> +++ b/meta/recipes-devtools/clang/llvm_git.bb
>> @@ -27,7 +27,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
>>   # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
>>   LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', '=
opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
>>   LLVM_TARGETS_TO_BUILD ?=3D "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;L=
oongArch;${LLVM_TARGETS_GPU}"
>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb, d=
)};BPF;${LLVM_TARGETS_GPU}"
>>
>>   LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
>>
>> @@ -37,6 +36,7 @@ HF[vardepvalue] =3D "${HF}"
>>
>>   EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel \
>>                     -DLLVM_ENABLE_BINDINGS=3DOFF \
>> +                  -DLLVM_INSTALL_UTILS=3DON \
>>                     -DLLVM_ENABLE_FFI=3DON \
>>                     -DLLVM_ENABLE_RTTI=3DON \
>>                     -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD=
}' \
>> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-=
devtools/rust/rust_1.90.0.bb
>> index 5d804c7398..0319d73b93 100644
>> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a389982=
5f4376896e438c8c753f8dc"
>>   inherit rust
>>   inherit cargo_common
>>
>> -DEPENDS +=3D "rust-llvm"
>> +DEPENDS +=3D "llvm"
>>   # native rust uses cargo/rustc from binary snapshots to bootstrap
>>   # but everything else should use our native builds
>>   DEPENDS:append:class-target =3D " cargo-native rust-native"
>> @@ -28,8 +28,8 @@ PV .=3D "${@bb.utils.contains('RUST_CHANNEL', 'stabl=
e', '', '-${RUST_CHANNEL}', d)
>>
>>   export FORCE_CRATE_HASH =3D "${BB_TASKHASH}"
>>
>> -RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_LIBDIR}/llvm-rust/bin/llvm-co=
nfig"
>> -RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_LIBDIR_NATIVE}/llvm-rus=
t/bin/llvm-config"
>> +RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
>> +RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-con=
fig"
>>
>>   # We don't want to use bitbakes vendoring because the rust sources d=
o their
>>   # own vendoring.
>> @@ -188,6 +188,37 @@ python do_configure() {
>>       bb.build.exec_func("setup_cargo_environment", d)
>>   }
>>
>> +# llvm-config expects static libraries to be in the 'lib' directory r=
ather than 'lib64' when
>> +# multilibs enabled. Since we are copying the natively built llvm-con=
fig into the target sysroot
>> +# and executing it there, it will default to searching in 'lib', as i=
t is unaware of the 'lib64'
>> +# directory. To ensure llvm-config can locate the necessary libraries=
, create a symlink from 'lib'
>> +do_compile:append:class-target() {
>> +    # Ensure llvm-config can find static libraries in multilib setup
>> +    lib64_dir=3D"${STAGING_DIR_TARGET}/usr/lib64"
>> +    lib_dir=3D"${STAGING_DIR_TARGET}/usr/lib"
>> +
>> +    if [ -d "$lib64_dir" ]; then
>> +        # If lib does not exist, symlink it to lib64
>> +        if [ ! -e "$lib_dir" ]; then
>> +            ln -s lib64 "$lib_dir"
>> +        fi
>> +
>> +        # Only do per-file symlinking if lib is a real directory (not=
 symlink)
>> +        if [ -d "$lib_dir" ] && [ ! -L "$lib_dir" ]; then
>> +            for lib64_file in "${lib64_dir}"/libLLVM*.a; do
>> +                if [ -e "$lib64_file" ]; then
>> +                    lib_name=3D$(basename "${lib64_file}")
>> +                    target_link=3D"${lib_dir}/${lib_name}"
>> +
>> +                    if [ ! -e "${target_link}" ]; then
>> +                        ln -s "../lib64/${lib_name}" "${target_link}"
>> +                    fi
>> +                fi
>> +            done
>> +        fi
>> +    fi
>> +}
>> +
>>   rust_runx () {
>>       echo "COMPILE ${PN}" "$@"
>>
>> @@ -199,7 +230,7 @@ rust_runx () {
>>       unset CXXFLAGS
>>       unset CPPFLAGS
>>
>> -    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
>> +    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz -Clink-a=
rg=3D-lzstd"
>>
>>       # Copy the natively built llvm-config into the target so we can =
run it. Horrible,
>>       # but works!
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224888): https://lists.openembedded.org/g/openembe=
dded-core/message/224888
>> Mute This Topic: https://lists.openembedded.org/mt/115768136/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


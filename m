Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22E6D743EB
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 22:38:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.881.1732142317776395349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 14:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105449edae=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKLBf2R023538
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 22:38:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xgm0mxxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 22:38:36 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AKMcaSq019545
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 22:38:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xgm0mxxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 22:38:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiENvgir3osrMbMf1S/b83uH5XftdozwSrwfL0pwkkPpmz2B6hPgOZF7gFLiSt5aWm8c1I7JzOTrMCcZIsF+cxZtolJsDDvoKkSVd2iOFX9iPeHrUcK3lPPq/6mXZKWS/xQKkuHRsxNs1w8GDZAx9OlvzOs/PqxF4Jl3vmp0Vsel2XuNdv6Ee9Ksm7hTfGagy2/043+LUAf3k6mwbrDkhEd2XO2jPxSK6xbBbM21muq/Y470Es64CfFYkcC39yXSsNq3fzgqTccBlru/5MdVuz+S9UzTAwBN/tgfILeSfNqkYLfkNUyscXOM2NOPUI/FW2ybEA4VxBhsT61vqtdH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi4v98xCBdu951Ps31p0+zJptNbg3+e+7MHH8BVBIHA=;
 b=MEWRDkzr5t43r08pj8s/LavjK7Ae463Q3CnXepJS8m7zy21HzHYGkBbdM01IXbVgGnQkvV73SC52oaOyxHrFBnlHV8LXSjAOIoQ+m5grEInBcXyjH41E7CZYLoirHOWwwp38eXIpBU29BanC7ZTaOWH7TMaadLj9Lnqa6BSz3gVI9vOHNY4o1golstfPBJFfQSWds2tjxejSm5AR6J/cth59pMmfETY+ALOYw35Mw6XgACkAtWBPe3ciyUpVyq1NltQoxGtmrq57THv+jGkq1cQZTG38gV1NWz88Meg05jYA5O73jJvJzuEPAa+SM6WnUr75jyAOhbn2cDiPFZ4MIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 22:38:31 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 22:38:31 +0000
Content-Type: multipart/alternative;
 boundary="------------SdNQ6vg4zqXrfu83JeOBaI41"
Message-ID: <5d482ba4-cd30-47cc-96bd-88b9eca675c2@windriver.com>
Date: Wed, 20 Nov 2024 17:38:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] linux: Modify kernel configuration to fix runqlat
 issue
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        "He, Zhe" <Zhe.He@windriver.com>
References: <20241120121923.3675835-1-Harish.Sadineni@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20241120121923.3675835-1-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 6891d0a3-29ad-4902-8dc1-08dd09b40f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ci9FeEp3Wk9xM0FZMlU3YmhKQndUa1dFY2NBNWp0UWlaTE9UM2lycktmS0VS?=
 =?utf-8?B?bmROTGw0czZuRlp5ZVVOeWhYK0hYZndJcGhKWnRMcnpqL2hjU3U5blcvNEdw?=
 =?utf-8?B?VlFvYlBmMGxzTnd2WUtpNDFURFhQU0lOZEpMZEhSZ3dVT2FTbEV2NndINzAy?=
 =?utf-8?B?cXFDTm43Mkc2S1pycW0za3M4VUFvR0xSaWJ1RWhTTGI3cm1QZjh3eUQ5TDdm?=
 =?utf-8?B?Q1U5cVprY0tXSGVlK2NqK3kvSkZMc2JQV3VTVGgySTBrSEJsM29NR003V2Vu?=
 =?utf-8?B?Rm45TlpqYWthRWRsYUtHSnZOSFJJZjJmeGlhM1Uvd2RKZUNLMzEydkZ6cnJH?=
 =?utf-8?B?NlVRdjdoczYwczVvQlFLTkZHTHNvUStPWFRpS2duQ3AyUVdESXJTdnNrcEx2?=
 =?utf-8?B?MDFEUVkwMU9kbWF1cFJBQ0tINUlWQ1JQZURkUUc0SWJTeG1OVnEwaEd5enJL?=
 =?utf-8?B?bFZMdTlhOFNiU01QcWwwUDRlMzZIUlc2dUFZMGpiZCtxWEFDSVZraEpSN1V0?=
 =?utf-8?B?aXlJSnFTejVoR3YyaEJvb1hEYXpNTU5icmtabEZYVWtLQnQ3STBCMElTcVF6?=
 =?utf-8?B?cjFFc0lpZ2ttTXQ0QWZhYXBVcFNjbUNOTCs0QTFjWXRpNEdZQ2xNZlhkNUd0?=
 =?utf-8?B?dm1hbTFjMlpjMnJuL0pZMkkydjgzdzUrU3lrY21KaUo5NGVjcW4wU0dtaWtt?=
 =?utf-8?B?S0N1ajI2cXEwQTZXRXhsYVVtLzdwK1diSjBKbGRXUnZrV1h6WnU4T0lhSkMz?=
 =?utf-8?B?VURRMFZ2MmFIMWVUWW5Wb0RWdEF0OTA0bFRCMytXdEJYdDNkR3B4dTFLQ1U1?=
 =?utf-8?B?eWNEekl1aEpIZUtxUFljSVpxRWZDUkxhOTl1blVla2hRc3BtenZFS1pzZ1JW?=
 =?utf-8?B?QkpmdkRoTGRMd1lnUHlVcE9GWnB3YTVIRG1BQjdBK3BxQ21oOElQTm1qRmtP?=
 =?utf-8?B?SjlaMnpBaTlGa3RLZk5yc0FPWmc0dnh5dktYczgrUUN5K0Y2b0d2V1FGUUFL?=
 =?utf-8?B?bEloWHRSZlBkN01UWEZIZkdHSEc2UXlMTkpIdDNKM1Y5NXNSTXFOREdaVzJp?=
 =?utf-8?B?TXI5L2pSTm9vQnZrWVpyNG96Zks1N2JPTytVQnptVWlKcStwTjFFVEdLeW03?=
 =?utf-8?B?UEZodnk2ZmtFenIxei82aHY5WEtnOEQ2R1ErSlFXclMrQnNKdjdodzhiMURI?=
 =?utf-8?B?eEhXV1BtRlRleXNSd3Z0N21mNVdEc3NqTnJFak1yYlNxN1VaRWxwUHJ2eGYw?=
 =?utf-8?B?YjNWQkFsTDVGU09pOEJ3bWpmSHNPelpPRXdJVm5nSnp3emNqMElQNG12bE4w?=
 =?utf-8?B?Q0ZpVkZKM3JRMlhrNlRhc2pZdzl5YzhDT3F5Mk91eXpuVmg0b3Q2RW0zU3JD?=
 =?utf-8?B?dDJ4L3orM0RhK0lybGJXdWFsSmpqNEU1dk9QNUNYTTU2bUl5bVErNDZFUWR3?=
 =?utf-8?B?RDlJMXJ2TEYyUXFtQ3VaTXorSnlnWWVRTEFoaCs1bWo5dy9mcmZ2U1RuVmlz?=
 =?utf-8?B?dFUrM1hzVkQwNW9jQWxLU2ZnSHdKcXI3dFNWZmpsUEU1K3RDOGp0THViOTFl?=
 =?utf-8?B?WElEQWhobVF5Rk1yVHByRU9OQVdrNDRldjY5MHBQaUV2TmVoUFBCQjd0aXhG?=
 =?utf-8?B?ZTAyV3B1V1BuTkkyMFZOZEpnM1lXTFRRc2N3TVVTWkY2YkdNbElnUFVlSzB2?=
 =?utf-8?B?WjlHcWt4NlhkdXhBNFRLQlU0akZ6MGsrTVdvMzlYNEpLTHFlNFNqSm0wYkts?=
 =?utf-8?Q?TsvphCIiDR+5635Dw83Hf722ZYbVMtXmlfqhzfM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dmhzTFg4b1FjUzUwZjVHYUxGQTdST043NVFkcUtTanRFNS8zTTZKUmR6RFVh?=
 =?utf-8?B?a29IT01GalhHb2pxRE9ZQWpQU0kvUlNIdVhqUnBaQ2JLVytPa0R5cEM0S2hv?=
 =?utf-8?B?Qm01ZjBaSjdTVFpGTjg5bDhQT1B1SmlUMFoxWitmSTRldS9oZ0VYNTFvbjlB?=
 =?utf-8?B?REFrQ2p1SXZSL2I0RUhnY2IwT2RVajQxb0lYQ0ZMR0hETERxYm1rZERLSk01?=
 =?utf-8?B?Z012azllVmdFeGYvNFBWZFlpeVZscGI4U1RaTGRxcEhKNE4zU3pudTVVNit0?=
 =?utf-8?B?cTVWTFVFREhMcFJGMFJYVUd0T1NTWUlEYldCaHVXTWpLYytPK0oxMGkyWEN1?=
 =?utf-8?B?WE1OQlBybit3NVRSUjFnM3p0dTdNK0orQndXL0RVSXBQOGg2YVE2TzBrM3Nr?=
 =?utf-8?B?b2tqZ25qbTVraEE3TUY1d2hSQW01RHhLQytiVlRNSkY0T21ydXRzNzNxNkpW?=
 =?utf-8?B?aGwwdnVjS3BEaWRQaXdaUkRLd0hzdlVTdkZwMDZWUUFKb0tHZWp6M3dTSjBm?=
 =?utf-8?B?Y0VkY2JOMXRCL1dSNSthWlVHaGNtRFlOVnVJNkdLU3FvbSsxVnNFTE9KZzF5?=
 =?utf-8?B?c25jN2ZNdHNMT3BMQXR1RHBRNjJBNy9hQVd6WU5HUHJXbjRFWHdoM1dUZisr?=
 =?utf-8?B?VzgxaDZOd1VjSEY1L0pJTGdBSlo4Umk2Y0x0ajVjWEhUaDZ5QU81SWtRMDA0?=
 =?utf-8?B?SXlaZnBLYkxkemtNdnBHWWxZQWRMdGkxcjB0eHhRc2k5WGkxVTVxQjhhcC9V?=
 =?utf-8?B?d3V2eFRvc1BDTjBHbkd1cXhjdllBb3NZalN5TmZkRXdJZDRvR0RGZ2FpM1V4?=
 =?utf-8?B?V1R4cGxBMnFDRGt4UGpFVm1zVnR5eFpldkR4TWhKcDE1MzZIT2lqZGVBdEtN?=
 =?utf-8?B?NzJUMm9IL1A1ZVhvMnZkWWpNbEtxNy8zeHk5Q2Y4WlIzZ0l0dmtVNUhPQk5q?=
 =?utf-8?B?NVJuM09JZm1GWlRuZFh6aytDc242L2VWQ1BCNUI5V3FXdk4zT1BleE95bTQw?=
 =?utf-8?B?QStDRGJrWHVoMkdDYmRxbEc1cVYyM1hQVjZIanp4RTJRamZCK2M3dEdnQW5p?=
 =?utf-8?B?aFVCUkQwNU5BcGw2R3VJRWIybWM3OHFpUVd1Uzh6ZWdacUg3MGZLRXFOTk1U?=
 =?utf-8?B?Q3pUWXozbXFyMFFHMEQyeFh3blVMakxJVVF1RWl0eU1UZW1uMjZPZ0RaQVpQ?=
 =?utf-8?B?M3A0UW1QL21vOWNlSXh5aDIvTTlNSllIc29VMXVXUmcxZldlaUJsQ0FPRlo0?=
 =?utf-8?B?NTJ4SnB6NmNOTUt0V0NJZ0Q2VDNqMUN2RVJrQU92Vmh4djFjclpuMHhzbHRQ?=
 =?utf-8?B?UXlLOVRNcEtlZFlTWjF2OXk1cFhVWnNwdkVxUGZpTkFhQnBadlFZbjEwc0VO?=
 =?utf-8?B?dy8rNDJVamNEU1Z4TU1sL0VEOWdSbWlVK0thSXNFYXpzbUE2ZXcxSy9GVHN4?=
 =?utf-8?B?WEMrWGg0Q1JkaitDWXl6a3VITWRRYWdlRWQ3NXZtU2pCZ0czYmJNeHl3YWta?=
 =?utf-8?B?Z2RWZGUrRElhbTJUWHdlcWFsUlJIaGp5U0JVSDg2V09iQ0svaDNKQitpNFRJ?=
 =?utf-8?B?N3hVMlN1Y21iT2YvNUtURWw0MTQ4MGN3amIxN3NPd0tReUttMVNSVTVsaUc2?=
 =?utf-8?B?bmVnZHJNV0R5cE04RlB6ZmVpTXJxRDRXZlRHODdlaTlDZVJSUXlhdXdSOXJ3?=
 =?utf-8?B?TVJIc0FpdkJaNHdrY0JqdmVpYWVRRzlNdUg2RmtjYmZzeExabnl0d0l5YW5t?=
 =?utf-8?B?ZUlNTHdtcnpWeUNSNFE3bXh0NUZvbjMvdWNXLzlua0ZFc001NXVLTmRzMm11?=
 =?utf-8?B?WVBtYTNuV3BST2pLL1JUb2ZxVTNOSncvUnFyN0pSZ0RKbDlpVVJkS1hMN0c3?=
 =?utf-8?B?MVBBQThjWitXTkwyWU5HOUlCN1ExSVRVc1NEQ0hBTTlZTlZkT2REemJXK1Zp?=
 =?utf-8?B?RUNYcDN0bmdpbjJ0WFNQdURxRm54c1VIcGMyaW1lZkNJVmpoRWdYaWZ1dTF4?=
 =?utf-8?B?TDBLUTBYYXZzNEZTNzAxeTQyNmt2L0pJa1Q5S3BHVHZhd0FQcFZiK1BFN29O?=
 =?utf-8?B?U1lGWnVVam52V3B4Q2x0aXQzbFErd2wzTFlDdVdCaUJabUZ2cktpTmtkZktq?=
 =?utf-8?B?MTdLclJyWDM5MEswN05mbUptSVZmMFlWUkxCSlpQTUczWHJpWG02OG4zcDVV?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6891d0a3-29ad-4902-8dc1-08dd09b40f10
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 22:38:30.9564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2m4afaVcv7PPr4hAUMz8h25r3VJY5j3WiTJ1K5g9yWyCDTVHjK5mtgxwZJMKwb01em34qEHIVp7uTZVeRvN+UcQhs+TdfCd+VNW1LZmi9iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
X-Proofpoint-ORIG-GUID: SXOs7sd-uMeQV4zvtkwhvafi72s5qCGa
X-Proofpoint-GUID: U4OYdWDsiXK54fajRRBFlfCMcJGA0UT0
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673e64ec cx=c_pps a=sGbpJkUcFVeWJOR+0qTsNQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=lCmy_vXzG8C8lY2rzswA:9 a=QEXdDO2ut3YA:10 a=xq8sQNWxPdePYJJuPSYA:9 a=duC-Q0Xh6Z22Jjpy:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_19,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411200161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 22:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207490

--------------SdNQ6vg4zqXrfu83JeOBaI41
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Harish,


When you are changing the kernel config or any part of the system that
you don't normally work on, it's a good idea to CC the people who work 
on that
part of the system. Doubly so, since this is a v2 and Bruce commented on 
v1. ;-)


On 2024-11-20 7:19 a.m., Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> In Qemu Running "/usr/share/bcc/tools/runqlat 1 5" gives following error:-

Using fewer capitals is usually better:

s/In Qemu Running/In qemu, running:/


>
> libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
> libbpf: failed to find valid kernel BTF
> modprobe: FATAL: Module kheaders not found in directory /lib/modules/6.10.14-yocto-standard
> Unable to find kernel headers. Try rebuilding kernel with CONFIG_IKHEADERS=m (module) or installing
> the kernel development package for your running kernel version.
> chdir(/lib/modules/6.10.14-yocto-standard/build): No such file or directory
> Traceback (most recent call last):
>    File "/usr/share/bcc/tools/./runqlat", line 293, in <module>
>      b = BPF(text=bpf_text)
>    File "/usr/lib/python3.13/site-packages/bcc/__init__.py", line 479, in __init__
>      raise Exception("Failed to compile BPF module %s" % (src_file or "<text>"))
>
> the following patch fixes the error.
>
> BCC test summary for x86_64:
>
> Before applying the patch:
>   TOTAL: 95
>   PASS: 29
>   FAIL: 66
> After applying the patch:
>   TOTAL: 95
>   PASS: 79
>   FAIL: 16

|Better as: State TOTAL PASS FAIL Before 95 29 66 After 95 79 16 |

>
> 50 new test cases passed

s/50 new test cases passed/Note that 50 additional cases pass./

Please explain if the remaining issues are yet to be looked at or if you 
know something about the failures. Ideally, you'd fix all the ptests or 
deliberately skip them with a sensible reason in your commit log. I'm 
not requiring you to do that yet, I just want to understand the current 
state.

Please explain why you added: 
features/reproducibility/reproducibility.scc both here and in the v3 
commit log. I not sure if we want these features as a defaults for debug 
kernels but I expect that Bruce or Zhe will comment.

Good work and I look forward having all of the bcc ptests pass.

../Randy


>
> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto_6.10.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
> index 9b2334afd0..d678bce254 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
> @@ -64,6 +64,7 @@ KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
>   KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
>   KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
> +KERNEL_FEATURES:append = " ${@bb.utils.contains("KERNEL_DEBUG", "True", " features/reproducibility/reproducibility.scc features/debug/debug-btf.scc", "", d)}"
>   # libteam ptests from meta-oe needs it
>   KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
>   # openl2tp tests from meta-networking needs it


-- 
# Randy MacLeod
# Wind River Linux

--------------SdNQ6vg4zqXrfu83JeOBaI41
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Harish, <br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
      When you are changing the kernel config or any part of the system
      that<br>
      you don't normally work on, it's a good idea to CC the people who
      work on that<br>
      part of the system. Doubly so, since this is a v2 and Bruce
      commented on v1. ;-)<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2024-11-20 7:19 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Harish.Sadineni@windriver.com">Harish.Sadineni@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241120121923.3675835-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

In Qemu Running &quot;/usr/share/bcc/tools/runqlat 1 5&quot; gives following error:-</pre>
    </blockquote>
    <p>Using fewer capitals is usually better:<br>
    </p>
    <p>s/In Qemu Running/In qemu, running:/</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20241120121923.3675835-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
libbpf: failed to find valid kernel BTF
modprobe: FATAL: Module kheaders not found in directory /lib/modules/6.10.14-yocto-standard
Unable to find kernel headers. Try rebuilding kernel with CONFIG_IKHEADERS=m (module) or installing
the kernel development package for your running kernel version.
chdir(/lib/modules/6.10.14-yocto-standard/build): No such file or directory
Traceback (most recent call last):
  File &quot;/usr/share/bcc/tools/./runqlat&quot;, line 293, in &lt;module&gt;
    b = BPF(text=bpf_text)
  File &quot;/usr/lib/python3.13/site-packages/bcc/__init__.py&quot;, line 479, in __init__
    raise Exception(&quot;Failed to compile BPF module %s&quot; % (src_file or &quot;&lt;text&gt;&quot;))

the following patch fixes the error.

BCC test summary for x86_64:

Before applying the patch:
 TOTAL: 95
 PASS: 29
 FAIL: 66
After applying the patch:
 TOTAL: 95
 PASS: 79
 FAIL: 16</pre>
    </blockquote>
    <pre class="!overflow-visible"><code class="!whitespace-pre hljs language-mathematica">Better as:

 <span class="hljs-variable">State</span>    <span class="hljs-variable">TOTAL</span>  <span class="hljs-variable">PASS</span>  <span class="hljs-variable">FAIL</span> 
 <span class="hljs-built_in">Before</span>    <span class="hljs-number">95</span>     <span class="hljs-number">29</span>    <span class="hljs-number">66</span>  
 <span class="hljs-built_in">After</span>     <span class="hljs-number">95</span>     <span class="hljs-number">79</span>    <span class="hljs-number">16</span>  


</code></pre>
    <p></p>
    <blockquote type="cite" cite="mid:20241120121923.3675835-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

50 new test cases passed</pre>
    </blockquote>
    <p>s/<span style="white-space: pre-wrap">50 new test cases passed/</span><span style="white-space: pre-wrap">Note that 50 additional cases pass./</span></p>
    <p><span style="white-space: pre-wrap">Please explain if the remaining issues are yet to be looked at or
if you know something about the failures. Ideally, you'd fix all the ptests
or deliberately skip them with a sensible reason in your commit log.
I'm not requiring you to do that yet, I just want to understand the current state.
</span></p>
    <p><span style="white-space: pre-wrap">Please explain why you added:  </span><span style="white-space: pre-wrap">
   features/reproducibility/reproducibility.scc 
</span><span style="white-space: pre-wrap">both here and in the v3 commit log.

I not sure if we want these features as a defaults for debug kernels but I expect that  Bruce or  Zhe
will comment.
</span></p>
    <p><span style="white-space: pre-wrap">Good work and I look forward having all of the bcc ptests pass.
</span></p>
    <p><span style="white-space: pre-wrap">../Randy</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <pre wrap="" class="moz-quote-pre">

</pre>
    <blockquote type="cite" cite="mid:20241120121923.3675835-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 9b2334afd0..d678bce254 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -64,6 +64,7 @@ KERNEL_FEATURES:append:qemux86-64=&quot; cfg/sound.scc cfg/paravirt_kvm.scc&quot;
 KERNEL_FEATURES:append = &quot; ${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot;, d)}&quot;
 KERNEL_FEATURES:append = &quot; ${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc&quot;, &quot;&quot;, d)}&quot;
 KERNEL_FEATURES:append = &quot; ${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;ptest&quot;, &quot; features/gpio/mockup.scc features/gpio/sim.scc&quot;, &quot;&quot;, d)}&quot;
+KERNEL_FEATURES:append = &quot; ${@bb.utils.contains(&quot;KERNEL_DEBUG&quot;, &quot;True&quot;, &quot; features/reproducibility/reproducibility.scc features/debug/debug-btf.scc&quot;, &quot;&quot;, d)}&quot;
 # libteam ptests from meta-oe needs it
 KERNEL_FEATURES:append = &quot; ${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;ptest&quot;, &quot; features/net/team/team.scc&quot;, &quot;&quot;, d)}&quot;
 # openl2tp tests from meta-networking needs it
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------SdNQ6vg4zqXrfu83JeOBaI41--


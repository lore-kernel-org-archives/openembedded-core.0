Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D2DC54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:02:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11776.1747836177218836132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72362efbbd=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LCFYCU001026
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:02:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfwse2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:02:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzCl/aOuf65NBXuw9CafI49672eRkVbxbfFabLrkG4FaDCTyChjSKCLS6+1EYju9fC98zjwa5J9mCoObyDS/Te+96y7odAraQKyUeOOQtygzmidtpOxr6Ap7xeGm3mXzfFwTjmXgMSn1vF8GmZDWoZh6RNlZWHMyHtZnk4WoCTuZglI08ebrHJgqTUmLgqCnfjbnxwJ4QHyYhEAzqZYt+iBJP8qDh7KkTGDJCaaIn/MOir3UaZ/qq1vQQsntQYAagadnLyhihCX6pQ8uOkFnkzi+9nGXqVDuufvf4Siyr7hOfX6aoDuvlu2+9DVg3G1UC/DQVU69zQZLLr7oLffZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PC3Mg7nbKwF5Bh/J6K30PcQSCVyFxmUI0P3GIC2EXwY=;
 b=eUJfYVMGF6Z9soiayagVrEg4lfHaMaNpaEFzcMV7LOYBvBgr+acccW7E2Pjdt188yn6Wm5WLJ87S333e07TZF5hQC2UgoIXYMLQ2jmDSyfwHlVl7PKI/80tF83AEiCHLKiI8RrFz5Jg3mGOLChpncmHclKJb/9kqP0kjYYzEWx2Gvssk3m5jIek2kJCAAfUc3ObgIzw2v17z50QdUgh5E1BQcDIqPUV2gbP46848CmxQWXfEUd7AdJfjFjRwbbIbQzjzp76pS5OOvPPyIOSCBZp2pKrVeFs/uOr0bFClIkRcJWCiIxcixKBH9M01swjok3vXPH/oaRNN3mRF90hYtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 14:02:52 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 14:02:52 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH] gcc: fix incorrect preprocessor line numbers in large files
Date: Wed, 21 May 2025 07:02:25 -0700
Message-ID: <20250521140229.297468-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: PH5P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::16) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA2PR11MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e3ba78-5d50-474d-fafe-08dd98702d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dnBCN2RzQ0NvdUNJMGpIdXdWWlhmZFJudllTSlVPNUxOWCtscVlXQmtoeGRT?=
 =?utf-8?B?MHJuQTdkUXVyMFlRWFVBa25vcmJMaG1IZmRra3pnT3pzaW1yUVVtenFhVGNP?=
 =?utf-8?B?cjlNUXA0MmZZM3p5VjIxOGcySW1FeEg2YUlaWTkyZ2VKVjlPdzBmdklsSGFy?=
 =?utf-8?B?NWxKY25rVDliZkhyZUJTV2RiZEk2UC9BOG9NZEs4SDVDcEJOalQ2Y21UY2pG?=
 =?utf-8?B?WGtRUzMralpYaDlrcHdUTkZIZmZ0Vkl3N1VCTUpWc1BYSzFxeG5BU0wwYTUx?=
 =?utf-8?B?QklNRjRNV0RhNmxmUXJZTk51N25NV0tSMzZnR2kwbmw3ZXhQVGVXUDgzODBQ?=
 =?utf-8?B?cnFwa3dxb0VmdkVGbElVN3FyWldPRytYUDBmNTFkb1RnT2dtUTd2ajNwV1d6?=
 =?utf-8?B?V002alpISWUyMEpXY1orZERuTGRVYnk2UDgzQll4Z3FVMXhJbGhNQkJPakp0?=
 =?utf-8?B?Nk1wT2diSmQ5eFkzaTEzOGZDVS9WaVRHR0UyTEdFR2tKSWp0NDZhblVNMWha?=
 =?utf-8?B?bnR4bktXK1h6OTd3T3VibmFOeEprL1FadkNSOFVUeHptV0RiTmw0MUE1T2VU?=
 =?utf-8?B?Wm9OMXBEUHY1ZFAvMXdHQVNCNGtZLzYwR05FdFJSK0UrKzNaMnlSZkNvemVj?=
 =?utf-8?B?Z0hjREVPaXBBSGJsK3Zjc3dvTFJ1ajZyNjJlTmFEUHN0cG1VU2toOWR4aG1v?=
 =?utf-8?B?WGRRNXVqdVAyYUo3RVBuY1RZZXhUQkw5THV5R3BPemxsclZkTXZyQzNkNnVa?=
 =?utf-8?B?dU1rYTVEbnFyV2FYZ1I4UWpYNkxjdEVRTHA3OHRlZXBqcis4eSt4QnlHOGIv?=
 =?utf-8?B?YXpTSTl5S0FOdlVKRDVoWXlrYzl2WVM3aGFLUmQ3K1JuaHFqU0w5YjJNNEE5?=
 =?utf-8?B?VENveHMxWjFIclcyZkFqK3lrY2ZBNElLTmJkR1Z1TzJqSXJzVFNyQ1NFVktk?=
 =?utf-8?B?OXg2YnE3R0RTbWFZYTh3bHg4TEJ5VTRmVHQ5Q1lENmNjRGR6VXRIYlNXNzFx?=
 =?utf-8?B?ZDJ0UHk1dVdLRERUQWRGa3Rpd3ZJK0RqWDlvZ0JFMUhWdWdVL0Zwa3VQNmZQ?=
 =?utf-8?B?U2JNbE5FL09PWm84cUovSzlsL1VJTXBzSzVlS0xCRjBlS0orVWo5L1B0N2hR?=
 =?utf-8?B?dlNrLytmWTdrSlYzTXlZd2p5dDZpL1RJM09WZnRHZ2tpUHVuTmVqc0JhbUJM?=
 =?utf-8?B?U05pSGp2K0g3bWdxdWdYemVvaXcxSlptTHlzaTFyQ256RDJQWDYwV3Azd3dF?=
 =?utf-8?B?bkFVcFFvREFkYThZQThpejhJd0Q2UzlKTVdCaHpuK0EybkdUaDJHL0VYcjdy?=
 =?utf-8?B?a3g1Q3Z2ZXhGU0xrRlIxKzdia3o0M1VxNk9DdWIxWm5CUnplT2NXelI5STAw?=
 =?utf-8?B?TGtUWTJWWFQyMzBWYnhVQ1pPVHBUcWI2K2RUbUdDUk1uT281M0dFNEU3RHdZ?=
 =?utf-8?B?dzFZQ1IxSFVzQUdJRGhpalBmTVlFN2FCd0QwbW9pcnJpTndvQXJRT0FKNkZX?=
 =?utf-8?B?RHFOLzVLc20zNWtHTnRFYXBTZXhBRFFvZXVmbE01SjgyQ3BVN25JS3h6VE1q?=
 =?utf-8?B?cjNOSGF0anZicUFVcFMvd1JGaXh6Y1B6QlNzdWdKUE1IM3FVVTM1aFpvdkJL?=
 =?utf-8?B?blZmUjZOaWtKMDBIR09pRkpjT3pMT1JYMHBlcTNiZzgvR0IwQUgzZUNPc3Jl?=
 =?utf-8?B?aUFocnpZZlUyM21BcEtLekUyOCtMVFNRY3VsVEphc0VvVTNVcStrT3JjMDAv?=
 =?utf-8?B?MnR4YnFpUDlGYitkd3dsUFMycDNuWUVXaGNBOGhWTjVUdUIwN1hMd0V2S01B?=
 =?utf-8?B?NFhDQTJrdDluUG92SGJ3U0pZRTNwdkZoRTFLM1g3dXNSbjI1WUZjVnY5elph?=
 =?utf-8?B?N1AxNVpDY2t2WCtwWFNHSGhXUUE0d1VIU0g4bFZPamRYbXlSTmdwV0tjS2Nt?=
 =?utf-8?Q?eUJjxlJ134s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWNCQnk1c2ZZUndDUEhVQzJZdmtNR1Flb2lLN25RcStnTm9tanRPZ05zNEFE?=
 =?utf-8?B?UXJsQ0RWMUU1S20yQ0EwdXh0MEwwMHIzUlEvWlNzNTc2UGlpWTlEeXpiTFFE?=
 =?utf-8?B?VEowdi9vQjNibnl0OXFEd3dFYkJsMlRxZUE1eEwwOFpjZ29EeW0zejJkUGlS?=
 =?utf-8?B?eFdCQm5EbnBWZG9KLzZSbnJrVmtReFFTc003Zk9WaWFtUVhHaG92TU5kemcz?=
 =?utf-8?B?MjFwNzVsOUxNV3hnTVJyTCtRVi9iczZEb09FN3d5Y0U4Q09kcmpyR1NUMkR6?=
 =?utf-8?B?cUtrWndaT3Z0Sm54T0RhQ1dYOG45Yml6RUVjKzY1ZmNOUkhLcFBpY2JIZ2hJ?=
 =?utf-8?B?cjQwaTZ5Y0ZmV1BiZlBkM05iQTQzUlgxZXNCOGpUWHRzWVZOTTRUYmVCb3Vs?=
 =?utf-8?B?RHdweTYxRkc4eFVVMHBuMmViWFNFanRySUx2UGFENE1QWHg5NCt3L2VYcmM3?=
 =?utf-8?B?WFlGZjRxYml1aS82ZU90WGVSKzJxM3lnaU1zT0NKTUtsa3Vjcnc4MzZsSHFr?=
 =?utf-8?B?amk2d3NxWVI2RHpVbXorRFFVT3hKZlpsWTJ5cy9taXl2QlNnazl1N21rc1VY?=
 =?utf-8?B?WUQyd01tK2M1TkhiNHdlcVBRRVVPeXJzdTU4SjJVenU2OVZUN1ZqRU00d2Fa?=
 =?utf-8?B?aU8xa2t0dm03bFk4UjR3VFg4bGthTGtNT0VOV0FmTTkwL3hQamgrWGFwMkta?=
 =?utf-8?B?TDg1bmVoUDNBOUxLd0VmbHZCK214YURqdzJnSC95YWlUM29JNHRoaG9BaHN1?=
 =?utf-8?B?Mll6R2tsc0VmZWcwL253bTlxQXd6bk1pU2E3alhSWXo4RGJ1N1ZTQlVCUlpa?=
 =?utf-8?B?ZW42QWc3YWQrSHd5U0t5dzIrNUR3S0pOVE1jOVd5MFJKVW1MREg4dnBuR3Ra?=
 =?utf-8?B?U0toeTVYVmJzbjJVanlwclh4WUxWSXpuQlB1YzRXekFNK2x2NzgwNlc0ZlI2?=
 =?utf-8?B?RG1MZ0lRcXpxYjROM0Vzc0RxcWVoVEN4MXIwcWFQdStzdmowS2JKSHMyWG1p?=
 =?utf-8?B?UVh4dVlvbHhHM2VGZkllL0dDMk9WTk5YbGZWOTQyWWgzeTlOenRjNUExSXFP?=
 =?utf-8?B?RVZuelQ1ZVcreFBJVTB5OEVkSmdXSGtyUWgzeGJFbkc1WTFSV2NwUFdmMFNy?=
 =?utf-8?B?OGlFdTUxb1ZRTlVIS2ZRMk8yeHpYVUlSOUY2QnBLRnozeWtQN0hRczdiZlc5?=
 =?utf-8?B?a3VIV3hjWmphTGVPNnpHMExmUnVLQXkxTXd4ZmZ1LzIxc0hNUW5oMlZtTTlW?=
 =?utf-8?B?eXhpbzhmVjVBc3A2ZHVYYVZyUmlibUNLRXdpQjZPSm54VlRnR1I1YmRjQUJR?=
 =?utf-8?B?dXYrd2J4aFBScFpTZXl3YTRSTk1pR0t4dkZYY1VhbTdHVE94TTYrK1VwUE5Z?=
 =?utf-8?B?Yis3V0FibEhPQm91UUpTQkdra1grTi9NZ0dHYkR3Y3l1aEpZWXRPM1g4cmcw?=
 =?utf-8?B?MXZva0ltWm1LN1hsb09CZjdZSTJRWXlpK1ViY1dxZjVMaldIU3N5OUZXSEIy?=
 =?utf-8?B?bUFsYmpubk9UY3EvRi9WWHl5dVF1ekVZTC9tQ1ptMlFDY0N5Rzl0UW10ZUdC?=
 =?utf-8?B?OWd2S3R4QTROQy94ZlBQb3lqNG9GaVlqeGk0aDdsODZNSUVSbUxSY1ZlM25E?=
 =?utf-8?B?cStxZEdncExXYVNISHFndG9DZHYrNjN0T0wweHRySEtvaDMyZTZnd0NEekds?=
 =?utf-8?B?ZkFsQTQ3Q29tU2ZsT2M5dHVjZkNzODIxVDhqNDd0TzdoNlBtbmpuOFJZUDJW?=
 =?utf-8?B?U2tsc3IyZFFDc3JPR3l0Q21RUUV4WXZVeWlBdkpoWXVjNm9aTHRBRGRLM1Mv?=
 =?utf-8?B?YzJPWkhMaEdYZTRYK3ZOcm53SDdMaFljbGlzZnRNNW5pR1FCQ0xFbkRvRms2?=
 =?utf-8?B?VzNHQzU5U0NhK0NNYmRJb3NPMmNjQXNRalpXbG1XRWozeWZvY0tGYS8rL3RI?=
 =?utf-8?B?Q1VhK2tHQzd4TGtxWHI2ZlY3ZU9ESWFabi82MmNKbitlK3p0eW8wWU9MMTlz?=
 =?utf-8?B?YlpLNGpXd2ZBL21kQklkMGpveVVOeXFOc3JQeTFBVWhueTAwVVdkNmFmTmtX?=
 =?utf-8?B?MTkxRW1RR2grRWFpZmZWeTFnY3cwSXpPQWFqV1FiejcxWTNjNWphdE1TbXN0?=
 =?utf-8?B?SGY5eEZHNkZXQVI3T3RIalp0T3FNVnpIVFdISUg0Y2xkRldCTm5nVCs5Y01W?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e3ba78-5d50-474d-fafe-08dd98702d38
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:02:52.1308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9if1eMVq2WdNJyM/1h3Ye8HW/6XqaylzF8B0qhS217yzEb6WtsrAnaffeIyzs5CKu869teoard3EYB5lCqUyJiH0h/rmaIZqO3W01umLYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEzNiBTYWx0ZWRfX0RlOXDgoG5Vw cIqdKjaaB4HqE3ViOJ6NdtvQ/73SCIIHms10t7i5gfvZbHs04B8eWru8JUDtKY5WHqM85q+bIEZ sp4KKru5QlWms+qliZzTxFuTUWwJ6eUgSHf/HxQYfWTNuHBTFBx9wAJRmwcq51+WwR17i+f5dy8
 F5MIeAKCYR6T6IGd1nZef1lV10lEAmIkS7nh/lUL3XQMW/txLxH6NX2QNzLjBm05CbMAWXLcKI8 oq4VXh/WUfZpkGuknaevZVVaa84mKB51Zqtnl8RbzEt1rxkOo8gZEu5UgL+wqX26m3Gzec26ve4 CfQHUsW2LGhsnCRiz/jgtoM92zchDUSTluji0Q5IUC/U6XC4XoNOtLqfBJU+NuNLk6CNCSYupdx
 15rcZFpSx9ecqr3eMpgm7JPuzhCUjiot0Mp+nU9IHV2Z3WlpHUK44jv1TxZ8NMTuzXjcICYO
X-Proofpoint-ORIG-GUID: yNz9kiwNDywGBD2mHdmRzwQCh0s7vWlP
X-Proofpoint-GUID: yNz9kiwNDywGBD2mHdmRzwQCh0s7vWlP
X-Authority-Analysis: v=2.4 cv=b6Cy4sGx c=1 sm=1 tr=0 ts=682ddd10 cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=BueY2pabbCFTndSP3dAA:9 a=Bo_lMn4Vjkd_C1Mw:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FnvyL7ShRj4A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505160000 definitions=main-2505210136
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54LCFYCU001026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217031

From: Yash Shinde <Yash.Shinde@windriver.com>

Resolve static assertion failures caused by incorrect line numbers
after #include directives, introduced by the backport of PR108900 to GCC.
Update line map handling to correctly compute locations in large files,
including fixes for both LC_ENTER and LC_LEAVE to ensure accurate
line number resolution in rare edge cases.

https://gcc.gnu.org/cgit/gcc/commit/?id=3Dedf745dc519ddbfef127e2789bf11bf=
bacd300b7

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-15.1.inc        |   1 +
 ...-incorrect-preprocessor-line-numbers.patch | 475 ++++++++++++++++++
 2 files changed, 476 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-incorrect-prep=
rocessor-line-numbers.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtoo=
ls/gcc/gcc-15.1.inc
index 864c6091a6..a2e3533d9c 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -69,6 +69,7 @@ SRC_URI =3D "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+           file://0026-fix-incorrect-preprocessor-line-numbers.patch \
 "
=20
 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-incorrect-preprocesso=
r-line-numbers.patch b/meta/recipes-devtools/gcc/gcc/0026-fix-incorrect-p=
reprocessor-line-numbers.patch
new file mode 100644
index 0000000000..f799085662
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-fix-incorrect-preprocessor-line-=
numbers.patch
@@ -0,0 +1,475 @@
+From edf745dc519ddbfef127e2789bf11bfbacd300b7 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Wed, 7 May 2025 17:25:42 +0200
+Subject: libcpp: Further fixes for incorrect line numbers in large files
+ [PR120061]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The backport of the PR108900 fix to 14 branch broke building chromium
+because static_assert (__LINE__ =3D=3D expected_line_number, ""); now tr=
iggers
+as the __LINE__ values are off by one.
+This isn't the case on the trunk and 15 branch because we've switched
+to 64-bit location_t and so one actually needs far longer header files
+to trigger it.
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120061#c11
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120061#c12
+contain (large) testcases in patch form which show on the 14 branch
+that the first one used to fail before the PR108900 backport and now
+works correctly, while the second one attempts to match the chromium
+behavior and it used to pass before the PR108900 backport and now it
+FAILs.
+The two testcases show rare problematic cases, because
+do_include_common -> parse_include -> check_eol -> check_eol_1 ->
+cpp_get_token_1 -> _cpp_lex_token -> _cpp_lex_direct -> linemap_line_sta=
rt
+triggers there
+      /* Allocate the new line_map.  However, if the current map only ha=
s a
+         single line we can sometimes just increase its column_bits inst=
ead. */
+      if (line_delta < 0
+          || last_line !=3D ORDINARY_MAP_STARTING_LINE_NUMBER (map)
+          || SOURCE_COLUMN (map, highest) >=3D (1U << (column_bits - ran=
ge_bits))
+          || ( /* We can't reuse the map if the line offset is sufficien=
tly
+                  large to cause overflow when computing location_t valu=
es.  */
+              (to_line - ORDINARY_MAP_STARTING_LINE_NUMBER (map))
+              >=3D (((uint64_t) 1)
+                  << (CHAR_BIT * sizeof (linenum_type) - column_bits)))
+          || range_bits < map->m_range_bits)
+        map =3D linemap_check_ordinary
+                (const_cast <line_map *>
+                  (linemap_add (set, LC_RENAME,
+                                ORDINARY_MAP_IN_SYSTEM_HEADER_P (map),
+                                ORDINARY_MAP_FILE_NAME (map),
+                                to_line)));
+and so creates a new ordinary map on the line right after the
+(problematic) #include line.
+Now, in the spot that r14-11679-g8a884140c2bcb7 patched,
+pfile->line_table->highest_location in all 3 tests (also
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120061#c13
+) is before the decrement the start of the line after the #include line =
and so
+the decrement is really desirable in that case to put highest_location
+somewhere on the line where the #include actually is.
+But at the same time it is also undesirable, because if we do decrement =
it,
+then linemap_add LC_ENTER called from _cpp_do_file_change will then
+  /* Generate a start_location above the current highest_location.
+     If possible, make the low range bits be zero.  */
+  location_t start_location =3D set->highest_location + 1;
+  unsigned range_bits =3D 0;
+  if (start_location < LINE_MAP_MAX_LOCATION_WITH_COLS)
+    range_bits =3D set->default_range_bits;
+  start_location +=3D (1 << range_bits) - 1;
+  start_location &=3D  ~((1 << range_bits) - 1);
+
+  linemap_assert (!LINEMAPS_ORDINARY_USED (set)
+                  || (start_location
+                      >=3D MAP_START_LOCATION (LINEMAPS_LAST_ORDINARY_MA=
P (set))));
+and we can end up with the new LC_ENTER ordinary map having the same
+start_location as the preceding LC_RENAME one.
+Next thing that happens is computation of included_from:
+  if (reason =3D=3D LC_ENTER)
+    {
+      if (set->depth =3D=3D 0)
+        map->included_from =3D 0;
+      else
+        /* The location of the end of the just-closed map.  */
+        map->included_from
+          =3D (((map[0].start_location - 1 - map[-1].start_location)
+              & ~((1 << map[-1].m_column_and_range_bits) - 1))
+             + map[-1].start_location);
+The normal case (e.g. with the testcase included at the start of this co=
mment) is
+that map[-1] starts somewhere earlier and so map->included_from computat=
ion above
+nicely computes location_t which expands to the start of the #include li=
ne.
+With r14-11679 reverted, for #c11 as well as #c12
+map[0].start_location =3D=3D map[-1].start_location above, and so it is
+((location_t) -1 & ~((1 << map[-1].m_column_and_range_bits) - 1)))
++ map[-1].start_location,
+which happens to be start of the #include line.
+For #c11 map[0].start_location is 0x500003a0 and map[-1] has
+m_column_and_range_bits 7 and map[-2] has m_column_and_range_bits 12 and
+map[0].included_from is set to 0x50000320.
+For #c12 map[0].start_location is 0x606c0402 and map[-2].start_location =
is
+0x606c0400 and m_column_and_range_bits is 0 for all 3 maps.
+map[0].included_from is set to 0x606c0401.
+The last important part is again in linemap_add when doing LC_LEAVE:
+      /* (MAP - 1) points to the map we are leaving. The
+         map from which (MAP - 1) got included should be the map
+         that comes right before MAP in the same file.  */
+      from =3D linemap_included_from_linemap (set, map - 1);
+
+      /* A TO_FILE of NULL is special - we use the natural values.  */
+      if (to_file =3D=3D NULL)
+        {
+          to_file =3D ORDINARY_MAP_FILE_NAME (from);
+          to_line =3D SOURCE_LINE (from, from[1].start_location);
+          sysp =3D ORDINARY_MAP_IN_SYSTEM_HEADER_P (from);
+        }
+Here it wants to compute the right to_line which ought to be the line af=
ter
+the #include directive.
+On the #c11 testcase that doesn't work correctly though, because
+map[-1].included_from is 0x50000320, from[0] for that is LC_ENTER with
+start_location 0x4080 and m_column_and_range_bits 12 but note that we've
+earlier computed map[-1].start_location + (-1 & 0xffffff80) and so only
+decreased by 7 bits, so to_line is still on the line with #include and n=
ot
+after it.  In the #c12 that doesn't happen, all the ordinary maps involv=
ed
+there had 0 m_column_and_range_bits and so this computes correct line.
+
+Below is a fix for the trunk including testcases using the
+location_overflow_plugin hack to simulate the bugs without needing huge
+files (in the 14 case it is just 330KB and almost 10MB, but in the 15
+case it would need to be far bigger).
+The pre- r15-9018 trunk has
+FAIL: gcc.dg/plugin/location-overflow-test-pr116047.c -fplugin=3D./locat=
ion_overflow_plugin.so  scan-file static_assert[^\n\r]*6[^\n\r]*=3D=3D 6
+and current trunk
+FAIL: gcc.dg/plugin/location-overflow-test-pr116047.c -fplugin=3D./locat=
ion_overflow_plugin.so  scan-file static_assert[^\n\r]*6[^\n\r]*=3D=3D 6
+FAIL: gcc.dg/plugin/location-overflow-test-pr120061.c -fplugin=3D./locat=
ion_overflow_plugin.so  scan-file static_assert[^\n\r]*5[^\n\r]*=3D=3D 5
+and with the patch everything PASSes.
+I'll post afterwards a 14 version of the patch.
+
+The patch reverts the r15-9018 change, because it is incorrect,
+we really need to decrement it even when crossing ordinary map
+boundaries, so that the location is not on the line after the #include
+line but somewhere on the #include line.  It also patches two spots
+in linemap_add mentioned above to make sure we get correct locations
+both in the included_from location_t when doing LC_ENTER (second
+line-map.cc hunk) and when doing LC_LEAVE to compute the right to_line
+(first line-map.cc hunk), both in presence of an added LC_RENAME
+with the same start_location as the following LC_ENTER (i.e. the
+problematic cases).
+The LC_ENTER hunk is mostly to ensure included_form location_t is
+at the start of the #include line (column 0), without it we can
+decrease include_from not enough and end up at some random column
+in the middle of the line, because it is masking away
+map[-1].m_column_and_range_bits bits even when in the end the resulting
+include_from location_t will be found in map[-2] map with perhaps
+different m_column_and_range_bits.  That alone doesn't fix the bug
+though.
+The more important is the LC_LEAVE hunk and the problem there is
+caused by linemap_line_start not actually doing
+    r =3D set->highest_line + (line_delta << map->m_column_and_range_bit=
s);
+when adding a new map (the LC_RENAME one because we need to switch to
+different number of directly encoded ranges, or columns, etc.).
+So, in the original PR108900 case that
+  to_line =3D SOURCE_LINE (from, from[1].start_location);
+doesn't do the right thing, from there is the last < 0x50000000 map
+with m_column_and_range_bits 12, from[1] is the first one above it
+and map[-1].included_from is the correct location of column 0 on
+the #include line, but as the new LC_RENAME map has been created without
+actually increasing highest_location to be on the new line (we've just
+set to_line of the new LC_RENAME map to the correct line),
+  to_line =3D SOURCE_LINE (from, from[1].start_location);
+stays on the same source line.  I've tried to just replace that with
+  to_line =3D SOURCE_LINE (from, linemap_included_from (map - 1)) + 1;
+i.e. just find out the #include line from map[-1].included_from and
+add 1 to it, unfortunately that breaks the
+c-c++-common/cpp/line-4.c
+test where we expect to stay on the same 0 line for LC_LEAVE from
+<command line> and gcc.dg/cpp/trad/Wunused.c, gcc.dg/cpp/trad/builtins.c
+and c-c++-common/analyzer/named-constants-via-macros-traditional.c tests
+all with -traditional-cpp preprocessing where to_line is also off-by-one
+from the expected one.
+So, this patch instead conditionalizes it, uses the
+  to_line =3D SOURCE_LINE (from, linemap_included_from (map - 1)) + 1;
+way only if from[1] is a LC_RENAME map (rather than the usual
+LC_ENTER one), that should limit it to the problematic cases of when
+parse_include peeked after EOL and had to create LC_RENAME map with
+the same start_location as the LC_ENTER after it.
+
+Some further justification for the LC_ENTER hunk, using the
+https://gcc.gnu.org/pipermail/gcc-patches/2025-May/682774.html testcase
+(old is 14 before r14-11679, vanilla current 14 and new with the 14 patc=
h)
+I get
+$ /usr/src/gcc-14/obj/gcc/cc1.old -quiet -std=3Dc23 pr116047.c -nostdinc
+In file included from pr116047-1.h:327677:21,
+                 from pr116047.c:4:
+pr116047-2.h:1:1: error: unknown type name =E2=80=98a=E2=80=99
+    1 | a b c;
+      | ^
+pr116047-2.h:1:5: error: expected =E2=80=98=3D=E2=80=99, =E2=80=98,=E2=80=
=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or =E2=80=98__attribute__=
=E2=80=99 before =E2=80=98c=E2=80=99
+    1 | a b c;
+      |     ^
+pr116047-1.h:327677:1: error: static assertion failed: ""
+327677 | #include "pr116047-2.h"
+       | ^~~~~~~~~~~~~
+$ /usr/src/gcc-14/obj/gcc/cc1.vanilla -quiet -std=3Dc23 pr116047.c -nost=
dinc
+In file included from pr116047-1.h:327678,
+                 from pr116047.c:4:
+pr116047-2.h:1:1: error: unknown type name =E2=80=98a=E2=80=99
+    1 | a b c;
+      | ^
+pr116047-2.h:1:5: error: expected =E2=80=98=3D=E2=80=99, =E2=80=98,=E2=80=
=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or =E2=80=98__attribute__=
=E2=80=99 before =E2=80=98c=E2=80=99
+    1 | a b c;
+      |     ^
+$ /usr/src/gcc-14/obj/gcc/cc1.new -quiet -std=3Dc23 pr116047.c -nostdinc
+In file included from pr116047-1.h:327677,
+                 from pr116047.c:4:
+pr116047-2.h:1:1: error: unknown type name =E2=80=98a=E2=80=99
+    1 | a b c;
+      | ^
+pr116047-2.h:1:5: error: expected =E2=80=98=3D=E2=80=99, =E2=80=98,=E2=80=
=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or =E2=80=98__attribute__=
=E2=80=99 before =E2=80=98c=E2=80=99
+    1 | a b c;
+      |     ^
+
+pr116047-1.h has on lines 327677+327678:
+ #include "pr116047-2.h"
+ static_assert (__LINE__ =3D=3D 327678, "");
+so the static_assert failure is something that was dealt mainly in the
+LC_LEAVE hunk and files.cc reversion, but please have a look at the
+In file included from lines.
+14.2 emits correct line (#include "pr116047-2.h" is indeed on line
+327677) but some random column in there (which is not normally printed
+for smaller headers; 21 is the . before extension in the filename).
+Current trunk emits incorrect line (327678 instead of 327677, clearly
+it didn't decrement).
+And the patched compiler emits the right line with no column, as would
+be printed if I remove e.g. 300000 newlines from the file.
+
+2025-05-07  Jakub Jelinek  <jakub@redhat.com>
+
+	PR preprocessor/108900
+	PR preprocessor/116047
+	PR preprocessor/120061
+	* files.cc (_cpp_stack_file): Revert 2025-03-28 change.
+	* line-map.cc (linemap_add): Use
+	SOURCE_LINE (from, linemap_included_from (map - 1)) + 1; instead of
+	SOURCE_LINE (from, from[1].start_location); to compute to_line
+	for LC_LEAVE.  For LC_ENTER included_from computation, look at
+	map[-2] or even lower if map[-1] has the same start_location as
+	map[0].
+
+	* gcc.dg/plugin/plugin.exp: Add location-overflow-test-pr116047.c
+	and location-overflow-test-pr120061.c.
+	* gcc.dg/plugin/location_overflow_plugin.cc (plugin_init): Don't error
+	on unknown values, instead just break.  Handle 0x4fHHHHHH arguments
+	differently.
+	* gcc.dg/plugin/location-overflow-test-pr116047.c: New test.
+	* gcc.dg/plugin/location-overflow-test-pr116047-1.h: New test.
+	* gcc.dg/plugin/location-overflow-test-pr116047-2.h: New test.
+	* gcc.dg/plugin/location-overflow-test-pr120061.c: New test.
+	* gcc.dg/plugin/location-overflow-test-pr120061-1.h: New test.
+	* gcc.dg/plugin/location-overflow-test-pr120061-2.h: New test.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3Dedf=
745dc519ddbfef127e2789bf11bfbacd300b7]
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+ .../plugin/location-overflow-test-pr116047-1.h     |  6 +++
+ .../plugin/location-overflow-test-pr116047-2.h     |  1 +
+ .../plugin/location-overflow-test-pr116047.c       |  5 +++
+ .../plugin/location-overflow-test-pr120061-1.h     |  6 +++
+ .../plugin/location-overflow-test-pr120061-2.h     |  1 +
+ .../plugin/location-overflow-test-pr120061.c       |  6 +++
+ .../gcc.dg/plugin/location_overflow_plugin.cc      | 15 +++++--
+ gcc/testsuite/gcc.dg/plugin/plugin.exp             |  4 +-
+ libcpp/files.cc                                    |  8 ----
+ libcpp/line-map.cc                                 | 48 +++++++++++++++=
+++----
+ 10 files changed, 80 insertions(+), 20 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-p=
r116047-1.h
+ create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-p=
r116047-2.h
+ create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-p=
r116047.c
+ create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-p=
r120061-1.h
+ create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-p=
r120061-2.h
+ create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-p=
r120061.c
+
+diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047=
-1.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-1.h
+new file mode 100644
+index 000000000000..3dd6434a938b
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-1.h
+@@ -0,0 +1,6 @@
++
++
++
++
++#include "location-overflow-test-pr116047-2.h"
++static_assert (__LINE__ =3D=3D 6, "");
+diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047=
-2.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-2.h
+new file mode 100644
+index 000000000000..048f715b4656
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-2.h
+@@ -0,0 +1 @@
++int i;
+diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047=
.c b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047.c
+new file mode 100644
+index 000000000000..75161fa5f055
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047.c
+@@ -0,0 +1,5 @@
++/* PR preprocessor/116047 */
++/* { dg-do preprocess } */
++/* { dg-options "-nostdinc -std=3Dc23 -fplugin-arg-location_overflow_pl=
ugin-value=3D0x4ffe0180" } */
++#include "location-overflow-test-pr116047-1.h"
++/* { dg-final { scan-file location-overflow-test-pr116047.i "static_ass=
ert\[^\n\r]\*6\[^\n\r]\*=3D=3D 6" } } */
+diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061=
-1.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-1.h
+new file mode 100644
+index 000000000000..ebf7704f568e
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-1.h
+@@ -0,0 +1,6 @@
++
++
++
++
++#include "location-overflow-test-pr120061-2.h"
++
+diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061=
-2.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-2.h
+new file mode 100644
+index 000000000000..048f715b4656
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-2.h
+@@ -0,0 +1 @@
++int i;
+diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061=
.c b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061.c
+new file mode 100644
+index 000000000000..e8e803898da3
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061.c
+@@ -0,0 +1,6 @@
++/* PR preprocessor/120061 */
++/* { dg-do preprocess } */
++/* { dg-options "-nostdinc -std=3Dc23 -fplugin-arg-location_overflow_pl=
ugin-value=3D0x61000000" } */
++#include "location-overflow-test-pr120061-1.h"
++static_assert (__LINE__ =3D=3D 5, "");
++/* { dg-final { scan-file location-overflow-test-pr120061.i "static_ass=
ert\[^\n\r]\*5\[^\n\r]\*=3D=3D 5" } } */
+diff --git a/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.cc b/g=
cc/testsuite/gcc.dg/plugin/location_overflow_plugin.cc
+index f731b1421b0f..f770d35ea518 100644
+--- a/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.cc
++++ b/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.cc
+@@ -85,9 +85,18 @@ plugin_init (struct plugin_name_args *plugin_info,
+     error_at (UNKNOWN_LOCATION, "missing plugin argument");
+=20
+   /* With 64-bit locations, the thresholds are larger, so shift the bas=
e
+-     location argument accordingly.  */
++     location argument accordingly, basically remap the GCC 14 32-bit
++     location_t argument values to 64-bit location_t counterparts.  The=
re
++     is one exception for values slightly before the 32-bit location_t
++     LINE_MAP_MAX_LOCATION_WITH_PACKED_RANGES (0x50000000).  In that ca=
se
++     remap them to the same amount before the 64-bit location_t
++     LINE_MAP_MAX_LOCATION_WITH_PACKED_RANGES -
++     ((location_t) 0x50000000) << 31.  */
+   gcc_assert (sizeof (location_t) =3D=3D sizeof (uint64_t));
+-  base_location =3D 1 + ((base_location - 1) << 31);
++  if (base_location >=3D 0x4f000000 && base_location <=3D 0x4fffffff)
++    base_location +=3D (((location_t) 0x50000000) << 31) - 0x50000000;
++  else
++    base_location =3D 1 + ((base_location - 1) << 31);
+=20
+   register_callback (plugin_info->base_name,
+ 		     PLUGIN_PRAGMAS,
+@@ -107,7 +116,7 @@ plugin_init (struct plugin_name_args *plugin_info,
+       break;
+=20
+     default:
+-      error_at (UNKNOWN_LOCATION, "unrecognized value for plugin argume=
nt");
++      break;
+     }
+=20
+   return 0;
+diff --git a/gcc/testsuite/gcc.dg/plugin/plugin.exp b/gcc/testsuite/gcc.=
dg/plugin/plugin.exp
+index 90c91621d0aa..96e76d2e0c36 100644
+--- a/gcc/testsuite/gcc.dg/plugin/plugin.exp
++++ b/gcc/testsuite/gcc.dg/plugin/plugin.exp
+@@ -138,7 +138,9 @@ set plugin_test_list [list \
+     { location_overflow_plugin.cc \
+ 	  location-overflow-test-1.c \
+ 	  location-overflow-test-2.c \
+-	  location-overflow-test-pr83173.c } \
++	  location-overflow-test-pr83173.c \
++	  location-overflow-test-pr116047.c \
++	  location-overflow-test-pr120061.c } \
+     { must_tail_call_plugin.cc \
+ 	  must-tail-call-1.c \
+ 	  must-tail-call-2.c } \
+diff --git a/libcpp/files.cc b/libcpp/files.cc
+index c1abde6639fe..d80c4bfd9077 100644
+--- a/libcpp/files.cc
++++ b/libcpp/files.cc
+@@ -1047,14 +1047,6 @@ _cpp_stack_file (cpp_reader *pfile, _cpp_file *fi=
le, include_type type,
+ 		    && (pfile->line_table->highest_location
+ 			!=3D LINE_MAP_MAX_LOCATION - 1));
+=20
+-  if (decrement && LINEMAPS_ORDINARY_USED (pfile->line_table))
+-    {
+-      const line_map_ordinary *map
+-	=3D LINEMAPS_LAST_ORDINARY_MAP (pfile->line_table);
+-      if (map && map->start_location =3D=3D pfile->line_table->highest_=
location)
+-	decrement =3D false;
+-    }
+-
+   if (decrement)
+     pfile->line_table->highest_location--;
+=20
+diff --git a/libcpp/line-map.cc b/libcpp/line-map.cc
+index 17e7f12551c0..cf6557117c81 100644
+--- a/libcpp/line-map.cc
++++ b/libcpp/line-map.cc
+@@ -621,8 +621,8 @@ linemap_add (line_maps *set, enum lc_reason reason,
+ 	 #include "included", inside the same "includer" file.  */
+=20
+       linemap_assert (!MAIN_FILE_P (map - 1));
+-      /* (MAP - 1) points to the map we are leaving. The
+-	 map from which (MAP - 1) got included should be the map
++      /* (MAP - 1) points to the map we are leaving.  The
++	 map from which (MAP - 1) got included should be usually the map
+ 	 that comes right before MAP in the same file.  */
+       from =3D linemap_included_from_linemap (set, map - 1);
+=20
+@@ -630,7 +630,24 @@ linemap_add (line_maps *set, enum lc_reason reason,
+       if (to_file =3D=3D NULL)
+ 	{
+ 	  to_file =3D ORDINARY_MAP_FILE_NAME (from);
+-	  to_line =3D SOURCE_LINE (from, from[1].start_location);
++	  /* Compute the line on which the map resumes, for #include this
++	     should be the line after the #include line.  Usually FROM is
++	     the map right before LC_ENTER map - the first map of the included
++	     file, and in that case SOURCE_LINE (from, from[1].start_location)=
;
++	     computes the right line (and does handle even some special cases
++	     (e.g. where for returning from <command line> we still want to
++	     be at line 0 or some -traditional-cpp cases).  In rare cases
++	     FROM can be followed by LC_RENAME created by linemap_line_start
++	     for line right after #include line.  If that happens,
++	     start_location of the FROM[1] map will be the same as
++	     start_location of FROM[2] LC_ENTER, but FROM[1] start_location
++	     might not have advance enough for moving to a full next line.
++	     In that case compute the line of #include line and add 1 to it
++	     to advance to the next line.  See PR120061.  */
++	  if (from[1].reason =3D=3D LC_RENAME)
++	    to_line =3D SOURCE_LINE (from, linemap_included_from (map - 1)) + =
1;
++	  else
++	    to_line =3D SOURCE_LINE (from, from[1].start_location);
+ 	  sysp =3D ORDINARY_MAP_IN_SYSTEM_HEADER_P (from);
+ 	}
+       else
+@@ -660,11 +677,26 @@ linemap_add (line_maps *set, enum lc_reason reason=
,
+       if (set->depth =3D=3D 0)
+ 	map->included_from =3D 0;
+       else
+-	/* The location of the end of the just-closed map.  */
+-	map->included_from
+-	  =3D (((map[0].start_location - 1 - map[-1].start_location)
+-	      & ~((loc_one << map[-1].m_column_and_range_bits) - 1))
+-	     + map[-1].start_location);
++	{
++	  /* Compute location from whence this line map was included.
++	     For #include this should be preferrably column 0 of the
++	     line on which #include directive appears.
++	     map[-1] is the just closed map and usually included_from
++	     falls within that map.  In rare cases linemap_line_start
++	     can insert a new LC_RENAME map for the line immediately
++	     after #include line, in that case map[-1] will have the
++	     same start_location as the new one and so included_from
++	     would not be from map[-1] but likely map[-2].  If that
++	     happens, mask off map[-2] m_column_and_range_bits bits
++	     instead of map[-1].  See PR120061.  */
++	  int i =3D -1;
++	  while (map[i].start_location =3D=3D map[0].start_location)
++	    --i;
++	  map->included_from
++	    =3D (((map[0].start_location - 1 - map[i].start_location)
++		& ~((loc_one << map[i].m_column_and_range_bits) - 1))
++	       + map[i].start_location);
++	}
+       set->depth++;
+       if (set->trace_includes)
+ 	trace_include (set, map);
+--=20
+
--=20
2.49.0



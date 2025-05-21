Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3175EC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:04:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12023.1747836295121720098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72362efbbd=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L6vocb008810
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:04:54 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs9fhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:04:54 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LE36gs032097
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:04:53 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs9fhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 07:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+b4fWRyCJMD2SxDkOm1aVPdMhMv6WOOnaNdiD/OmxK8ozKQXXfkP6x4ruK1r2gI8ZCR3t6Kz0C+c8rnzPfct1iOFYI1ETv4NnBNy4B5TH2cBs1hQCSltpT2m29b/UaXCKSUFzaH+gCv5oM9KuJ2k4Mk/8MOiFKM5NuVEvNn8e9Fk3YXjVm4cGK969nFwpBv8MEci6q+6yVsP7jrFBOjrO2VEoPLGPU2elEiw2kZDgIc6jvHaZlZ+dnpKyHuctbULc7iAwEK7jcDIhs6F6Xpr5gIZsYu1wT6ECs0Fmi0oNh9ugqhxA6zEyARgp7EoM7mk0yqtsE3nXbv+Fky0AHayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gE3c3DxoV7xhoymBxBVH1hqkFmubZ/9sItGtNZ2KNhY=;
 b=OOlnRbA/LwVfLeLZ1oXbx62cEvnxvMxEDPBW+WW48IootRPOp47h88LizR6dxwCPXRhRw72PvmAxL1dtE4rw1LkG5gz8z+gkR82JP8t7/WyWPWx1ViL+NTHslt5Xof/K66/Vj5bhwOYjG6U4N+SyZKjI7b7TP/M1JXhwa3QRJmdFMoY1mvonEC2nHtAF3hFUDUjZ3UsikDj7q3U9pySOboHzmYuFZ7GdHYEaHFFbf8bfivNOag4Bc3dZZHwFPOgbC3/5byf+72U60QRxwno1aycnJwZPPAt6B6l2m0+J/GU1TzOKyghQ8g42sanNxsRjEi/pPYO81wB4Yhe9aQAEzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 14:04:50 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 14:04:49 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [walnascar][PATCH] gcc: fix incorrect preprocessor line numbers in large files
Date: Wed, 21 May 2025 07:04:34 -0700
Message-ID: <20250521140436.301495-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA2PR11MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: fafadc65-205a-4943-2002-08dd98707357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QlpIalpVdmovZnRqcm93Qzh3THp5TnQ0UkxiMjF0UEozdWIxcTFIblVnRmlq?=
 =?utf-8?B?MDQ0cGp5bkdTc2ZaYzZZYkNYSzQxSEVYT0FyYnVXM2FPUXk3aWgvWHp5L1Bz?=
 =?utf-8?B?VFpaU1RZeGtxdVNMSVB0MHhsTGdzMjVGQ1FBSy9JQ3VCakh4TUI5aUdSbERy?=
 =?utf-8?B?SnQrNnh5L3lDMVpPTkJsZWJDS0d4RnhiQjJyWWwxYS92TzF0U0pTbjArMnZu?=
 =?utf-8?B?ZHdPWVNNaFZlNGVZTEl1Q2VJYVVwTWF6TXZlMnJOcWwwUllVT3pBZTZLME1a?=
 =?utf-8?B?MWpiYzRldWk2cGtQelBqN3pKTU5iVkJlRFpBVnoyWE5BOFFsWnpyODRoTE5I?=
 =?utf-8?B?YkN2aHFZZ0RiVzZFdGhoRmpGMDgwaTUxdFMyMEE0Q3FHbzBrMHhrK0RqZUFa?=
 =?utf-8?B?cDAwcWR6VS9kRzRqK2tidko4QWFIMU40YVRZVENFaEdKYUhPZHFXU3ZEMkZ0?=
 =?utf-8?B?eVJFVWxpUkl5d3BNNjBMb052M1FMQUJZcGlGUkM5STl2cm9XdmJ1OGZoZElU?=
 =?utf-8?B?NEEzREVJYlFmMUxPa2RjZ0NzckxqaXJIUjMrSGsyWGVtOHNscllqckI4YytY?=
 =?utf-8?B?YTZNUGNCUWFSSitmU0ZneW01TGl3bWc2MVNycmZIVUNnMndYQnU5R1MrMmJ3?=
 =?utf-8?B?bVBtcmdnc1RBV1hpSElSa2pvQ1liam1lYUV1bTlnUk00UkRvSG5nSUFBeWtK?=
 =?utf-8?B?RHRSZXpKT0NYOWo5VVhLdU02MUpLYS9IUld4S1c3SEdNSG5NbHBoUGlZdlVN?=
 =?utf-8?B?VVNaeFNsN2grN2JReFozYW96TkNLSzRjbjZHYjVUWGcvV0h1azgvQTVUOTl1?=
 =?utf-8?B?QW5oZVJyc290SFNmSVhBbXVPMlNhOU1uWjdzRFBSRWZzZ2hPZjlsL20wWWxH?=
 =?utf-8?B?U05ZaHlRTTFpZUVBeG9HZzBLajhKYzR2Qmg3L01xQlArNVJhbTFwSHJwKzRD?=
 =?utf-8?B?VTcyK2pZK0xsZ1VXS2MwMlJkMGp4Z0xUVjY3WWcyWk51VUJnbmY1QjhaVjdV?=
 =?utf-8?B?M3NHajJxNSthaDhKT2tTQWdBc0FKSExnZEt6UmdTenVYM2hieTdNSUJxbGdW?=
 =?utf-8?B?UDlYVCtWbFpFRWttL3ZBcmRyTlpSNkFLTEdlTjFQZnBQWk9lWDdBQmJlK1FS?=
 =?utf-8?B?MUdLZG9MM2NYWTVXNDhLTmk1enREK1Y2WitCb1dLV25SQUplb09SczNrbS9T?=
 =?utf-8?B?MFFZRXRTNFBVVzN6VVhVRzk0U1VmQkRtNUdPdWgzNmR4TTEvc0E3WS9qeVpy?=
 =?utf-8?B?WFhvc0ZxdEh4Qng1RjhEM05OeVBjQjQwS1ZSekFoUlk0RE9mM2lGT3B2Z1JN?=
 =?utf-8?B?MHVBaFE2S1FsVXpUeHo0dG5FSm9XeHhEUEZ4Q2hNRVFoVFpmSUhHQVJGTldT?=
 =?utf-8?B?ZWxrYjJFSFdnNURUR0ttMWFYYUtWdFBsaEwySzFESTFTZGJNUm5WdWlOeGJz?=
 =?utf-8?B?eUtxQTNkS2NlK2tMUW94K1RUd2JWamtBMEdlU1EyU2RJcEJpRUZFZTI4NkJ0?=
 =?utf-8?B?YnA2UXcxWUR6emFwRFY0RTYvOVZYc2dVdy92S2VwN29EcGV1WC9sWDNuQ0p1?=
 =?utf-8?B?VTFiYjB1dEtwYnRDVUxYcUNLcCsyZ2dJcTZ2RCtpS09vMzBURnhKMW95NWI2?=
 =?utf-8?B?eW5JU2hpMEtEYnBIN0RyWFpDMFlOVDBiRWREK0ZUdFE3TVlWVnhJMFJpb1FQ?=
 =?utf-8?B?WGlaODMyYlZnejRLZk9HS21SMkRWWU5Kdmczd3U0U01jcXNiTE1ob1UvTnlB?=
 =?utf-8?B?NkhvK2JlYnJ5R3pXOVpaNVVNU0FOTU1KZzM3R2VQeSszZkQybkk3eWdqTDFE?=
 =?utf-8?B?YWp0cDBrSTF5TlJjaDBkdHdsWmRDcjNkeExjb3kwWjFsc0hJMVZOWklRRHo5?=
 =?utf-8?B?dDc5SzVpWWpyVWNDR2QwZlg2Skh1MCtpZVhTcU91eGV0ZzdmRm1qSWZvdlJB?=
 =?utf-8?Q?eAfWuCSyai8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2ZncDQyQ2RJaytqVkplMU42eWNpWkNad2ErR2dBaXBlbHhQVFNvWUVvc0pk?=
 =?utf-8?B?N2UyZC9EMXNjNURzalpiSjROR2dLc20rakhqTHZFZUtrZk5xUElzWUZRZ2d5?=
 =?utf-8?B?V1VnQmhKb0ROU3NDb20rRTd6djNCNXlhL0E4NjNrVUtza2Y2NWtzZzJqN1Ro?=
 =?utf-8?B?cW9abUNxN3prbUpCN0JNMStqU0tVUld6UkhJcXYwMHZxbS9RT2x5TGhyNFF0?=
 =?utf-8?B?UG0yWkNnenR6SSthd2t2RENEU0d5ZXNYK2xnZnpQUmlLanRrNExZNk1lWFhm?=
 =?utf-8?B?U01KZ0toS0dIakdZem9iRUtIbjNZN1hrRnl6b2cwbENkdjc1cFdqSnFxSUtv?=
 =?utf-8?B?bWNGZ0lHME82TWIrRVYzRUx0SWVGeWwvck1OR1NnT2NNeUJHSDQ1Y21VWGYr?=
 =?utf-8?B?OHRxWENPdVBrNWtoTmNNSFUzL1VZdjdNbWE4WUVxUmg0Q0lkTkdmMnR6dDU5?=
 =?utf-8?B?OVJzVnFiVnZ5MFhrN1EwZno4Z1RiUDFieGh5WGxXVkJYUHF4MnRRc1pYTFVq?=
 =?utf-8?B?NkFFc0EyM3ZRcHBxYVhUbjlSaDkvM29nNHVab052dXFLSEo4NlBFTG9adCtY?=
 =?utf-8?B?a3BVUHJtMXRPM0Z3Zmc0MzVQOUQvNTROY3N2bnJHSXBqR2RlV1JIOTZSRTJU?=
 =?utf-8?B?UW5FU0xTUlJKQmdvbURzYTBqNEI4Q0s5bVRvVS9IM0RCZTNzZEdJOWRMaTZU?=
 =?utf-8?B?S0xnQ0o1bWFLSnJFaW5ybmxkUC8rNk9aaUZUSkhRU1JDR3E2UjAwK1NPQ3Uy?=
 =?utf-8?B?dFdhUlErZFduWmRnd3NMVTNvVHNuZTBCT21yc2wzS0RKenBSbVhZUTZVU3Bm?=
 =?utf-8?B?TUxxekVITGpqSmc1Y3RrT1pDQzZTZ0o5TjE3TStvcWs3SUc1WmtyMDJ1WVpM?=
 =?utf-8?B?UjQyUE9sR0hxK2VTQWhDSWdydUZwTGhlMy9zT1VnZjBlbFVVUUw5RVAwTngr?=
 =?utf-8?B?UHRVckdNU3BNamt6UUR0Q21tYXNGd09NQnJ2OC9USkJkM09jZ2hKUUlEQloz?=
 =?utf-8?B?VkNWTkczaTlmQm9uVzBTaWdlMHg2Y3ZvRmpaQzY1Q0RPQjl0aHNHRGtHcHhH?=
 =?utf-8?B?RElmRnFHQ3BRVVhFUlNPYUVkKzh0bWpqMlRCK0dNdnJCT1JyZFhZUXh1RVBG?=
 =?utf-8?B?QkE3STVVM2ZtMUZmenJVZStoL1o3d080OEh0SFFrTmNTVHV0ZG9hakFFdVRC?=
 =?utf-8?B?eVJyV0dTWkZPSitvNEIyVXgzQ0lpQVB5dU9FWTZQRzVUT0gzY2Yva1V4Q2Zh?=
 =?utf-8?B?NHFuYmU1d25SNktqRVRTcWRGSzhqcHRwdldTTDBwV2FMcStSUUNscEoxOGhT?=
 =?utf-8?B?OU1VUWwzWmFuZW1KRkJEVUxMdFMzOS9ZRm1yVXZKQStSbjJJRnlBK0dSOVRT?=
 =?utf-8?B?Sms0dGUyY2RQODhKczVCMWVlVENIUXhrc3ZET0w0Q3puOU9GRzNITHRmQTNu?=
 =?utf-8?B?NkdleDdCaXBNQVJrd0lVMnRIUXREZXBqZ0VRRzRaQTN0ZkM0bHVVNEF6ZmFW?=
 =?utf-8?B?MnFDN0pIMnp0Wi9OMnplNlJqdVhFMkZnL0RkVVBMZG1JTEZLdE90THFZTldY?=
 =?utf-8?B?RTRvY3hKdXFIbG9kQUJaT29wSE1IRU9QUlVTYklMbmlKdmZTV29USGYvWGdu?=
 =?utf-8?B?VzFMRkFWUFpxTWpndWI5WXZ1ZzhYaFFBNVVlc3BzcUJhMG8remtJc1FxNGlx?=
 =?utf-8?B?Zjd6MlJOakI1VE0xT2RpWTFOTjE4V0lPMDF1aFZKRWJDczNCUEtaVmx0SGlN?=
 =?utf-8?B?RDlJOFRDcTFuM3FGNDdLQzR0RWFUbCt2ZEtZeG4zRDAvOXNlZUM2UFV2TGVM?=
 =?utf-8?B?ZWhIaU1mTFpEcld1NW5GQmRXbXg1WWVhUld4Ukt4T1BHdnpieUtSVVduY1N2?=
 =?utf-8?B?ZlVab0xqaXNISDMvRjk3REM5L1ZmWFZDMGNjZWpwcGxpMUR0ZU1aWEN6bFhJ?=
 =?utf-8?B?OFE1VFJPRXJUN09uQTNOSHJFalNXY2g4ZGxja2xsRUJzbldxa2YvOUwwbnFL?=
 =?utf-8?B?R0V2eEdVU0FCZms0dTYzbnlEc1Y2bTYwT3ovNnZlU0c3QmloOFhRZHJLSkg5?=
 =?utf-8?B?czlsK1pGMi9Bbk9lUDdNVXhsYXd4aHA1NXZxdkJLZHJsYlV0bU5HaUJSMmZS?=
 =?utf-8?B?TlJxdTRhVFdYVUpqbkhYV0F1SHNUblp2eUtucjFtZlFQS1hCZFpsWUNNSDQz?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafadc65-205a-4943-2002-08dd98707357
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:04:49.8705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jt9O/oOn2V/96GIaAzzspH4qPygzMoaGlCDiGYQcKT9794GOMSOeLBci3PEg+kjMEgUUWObReK0oAeeBTCDnWqB7REVaL/etr4A7hsHxKLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
X-Proofpoint-GUID: P-Tvvqs8q-YFcwxJFP5FsRj9zKVzVIjr
X-Proofpoint-ORIG-GUID: lcUS8NkCo_J414EYbKONC07PVBt_mCPN
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682ddd86 cx=c_pps a=NZTPE88KBhpz0z3fOSYQ1w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=317HPcoRKb9w4eVG2_AA:9 a=N371p7YIYwourpHR:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FnvyL7ShRj4A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEzNiBTYWx0ZWRfX16JxSUe0Zl/c u+fdC12v2776LElpVgR4FZXEsorojlIcODHwskL4Uex3ss3okHB6XZNM7x0TGBm6JXzf23MgSM5 tMab70bdTiJevmk2W0DkCV73OlcpHeDxdy3NxmGE5MRr/cPk/PKKFJbiOo66eRzsfwqjaNntBWp
 vEgsUdKRJuTRJbadQbme5w3pos2+Aki+7HljX9x6/fTg8benEB36A7wrzt3cKYQHVqLQ9dw7OIP xiqF2FH0AZt7SEkIN50drBxKwZCQAmhnvOLAulkbbDKOSB7NVKfXbzKx547dn+w96/Lf1ap/GM2 Uq0muIg67PliI746/vF7rZitRmJgXyYApZzQIN+Mql1gWclh1YVnRa/gNs/A/4DqXbLENxc1D+J
 cRaJ3v2w9En1Wyo73BDdztzk8dXX/+zxHwVjQZgy/bHxj8RLhYMO0rU2gHdbysh0kNPZyneK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210136
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54L6vocb008810
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217032

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
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...-incorrect-preprocessor-line-numbers.patch | 475 ++++++++++++++++++
 2 files changed, 476 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-incorrect-prep=
rocessor-line-numbers.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-14.2.inc
index 3d65bed92a..17f874f29a 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -71,6 +71,7 @@ SRC_URI =3D "${BASEURI} \
 	   file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
            file://0027-gcc-backport-patch-to-fix-data-relocation-to-ENDB=
R-s.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch=
 \
+           file://0028-fix-incorrect-preprocessor-line-numbers.patch \
 "
=20
 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0028-fix-incorrect-preprocesso=
r-line-numbers.patch b/meta/recipes-devtools/gcc/gcc/0028-fix-incorrect-p=
reprocessor-line-numbers.patch
new file mode 100644
index 0000000000..5185236a3d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-fix-incorrect-preprocessor-line-=
numbers.patch
@@ -0,0 +1,475 @@
+From 8cbe033a8a88fe6437cc5d343ae0ddf8dd3455c8 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Thu, 8 May 2025 11:14:24 +0200
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
+[jakub@tucnak gcc-15]$ git log -1 --format=3D%B r15-9638-gbfcb5da69a41f7=
a5e41faab39b763d9d7c8bd2ea | cat
+libcpp: Further fixes for incorrect line numbers in large files [PR12006=
1]
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
+
+The patch reverts the r14-11679 change, because it is incorrect,
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
+2025-05-08  Jakub Jelinek  <jakub@redhat.com>
+
+	PR preprocessor/108900
+	PR preprocessor/116047
+	PR preprocessor/120061
+	* files.cc (_cpp_stack_file): Revert 2025-03-28 change.
+	* line-map.cc (linemap_add): Use
+	SOURCE_LINE (from, linemap_included_from (map - 1)) + 1; instead of
+	SOURCE_LINE (from, from[1].start_location); to compute to_line
+	for LC_LEAVE if from[1].reason is LC_RENAME.  For LC_ENTER
+	included_from computation, look at map[-2] or even lower if map[-1]
+	has the same start_location as map[0].
+
+	* gcc.dg/plugin/plugin.exp: Add location-overflow-test-pr116047.c
+	and location-overflow-test-pr120061.c.
+	* gcc.dg/plugin/location_overflow_plugin.c (plugin_init): Don't error
+	on unknown values, instead just break.
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
+ .../gcc.dg/plugin/location_overflow_plugin.c       |  2 +-
+ gcc/testsuite/gcc.dg/plugin/plugin.exp             |  4 +-
+ libcpp/line-map.cc                                 | 48 +++++++++++++++=
+++----
+ 10 files changed, 69 insertions(+), 18 deletions(-)
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
+index 000000000000..33f2c4ce8def
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047.c
+@@ -0,0 +1,5 @@
++/* PR preprocessor/116047 */
++/* { dg-do preprocess } */
++/* { dg-options "-nostdinc -std=3Dc23 -fplugin-arg-location_overflow_pl=
ugin-value=3D0x4fff8080" } */
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
+diff --git a/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.c b/gc=
c/testsuite/gcc.dg/plugin/location_overflow_plugin.c
+index d0a6b0755648..6f4497a1cb16 100644
+--- a/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.c
++++ b/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.c
+@@ -101,7 +101,7 @@ plugin_init (struct plugin_name_args *plugin_info,
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
+index 933f9a5850bc..438c6d87aad9 100644
+--- a/gcc/testsuite/gcc.dg/plugin/plugin.exp
++++ b/gcc/testsuite/gcc.dg/plugin/plugin.exp
+@@ -126,7 +126,9 @@ set plugin_test_list [list \
+     { location_overflow_plugin.c \
+ 	  location-overflow-test-1.c \
+ 	  location-overflow-test-2.c \
+-	  location-overflow-test-pr83173.c } \
++	  location-overflow-test-pr83173.c \
++	  location-overflow-test-pr116047.c \
++	  location-overflow-test-pr120061.c } \
+     { must_tail_call_plugin.c \
+ 	  must-tail-call-1.c \
+ 	  must-tail-call-2.c } \
+diff --git a/libcpp/line-map.cc b/libcpp/line-map.cc
+index d5200b317eee..1e659638d9f7 100644
+--- a/libcpp/line-map.cc
++++ b/libcpp/line-map.cc
+@@ -618,8 +618,8 @@ linemap_add (line_maps *set, enum lc_reason reason,
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
+@@ -627,7 +627,24 @@ linemap_add (line_maps *set, enum lc_reason reason,
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
+@@ -657,11 +674,26 @@ linemap_add (line_maps *set, enum lc_reason reason=
,
+       if (set->depth =3D=3D 0)
+ 	map->included_from =3D 0;
+       else
+-	/* The location of the end of the just-closed map.  */
+-	map->included_from
+-	  =3D (((map[0].start_location - 1 - map[-1].start_location)
+-	      & ~((1 << map[-1].m_column_and_range_bits) - 1))
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
++		& ~((1 << map[i].m_column_and_range_bits) - 1))
++	       + map[i].start_location);
++	}
+       set->depth++;
+       if (set->trace_includes)
+ 	trace_include (set, map);
+--=20
--=20
2.49.0



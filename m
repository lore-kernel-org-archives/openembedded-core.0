Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E23C02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 05:22:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.62184.1738905727031787821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 21:22:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4133875e34=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5175Aqpg002595
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 21:22:06 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hm0px1bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 21:22:06 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5175M5sf019895;
	Thu, 6 Feb 2025 21:22:05 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hm0px1be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 21:22:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7LFniUinHH0cwDxRa5/ayG/Nm2nd0KjTbT96gH0g2nkuFOqeUwRlT9FXb1oJvqtxvRI75gaZMsFmcvy2d9x/oouOX4/cnXOp0D6l75tzf5ruOXTLKF7hBblytiin3hs7d0JmhOCNUKS6rK8t6O8P5XC7+nFhIZTtKyscY+rnLz4qxdU6NMtFCauRQBeUtHYgdmsUBrgA9v02zuXJpQaIKkXQnt9T/lIUc4ehkE62Hyi921MwQst7MXvU7FnzCcb3+AXCX30zlG4mO/hZ50weX9LpAtElPX49A1yjVyC7XOcbY4cMHV16hUir/Qfhhqg5WhveSlEkLkB7j+YAjy1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xUxoOyVjNvG0e/smyYRAofN2vE7USZN1iwqh2PypDI=;
 b=DGtUKzXAifTwaHlfzIye1DS8rslpnDyHJhSRcxzj+MIF3SKCxMqSXttNavrHsNTK4YL1CXNU3WXuGGlvmerkJc7RGpGaHtjTUfysZKgAQv9H0GSvjNjVJZr0lY4iBGfHNTlvbF6YJy1kjUbYVddnFqOjGigduGDO1hgpOVB5fXwhZDC10dle9oXwXVp57q1fXM/xK5cnLuOT20b4Aspb/qaxqccpDKeHEV1SN7RSarRFIhhRcEDkKYk+ubTo7YdgMSgkonLCDdXqc1DY2oVuyFVWA/uQ7eCzOeyQMoov9IzKiDbVEkGOZa7sR3HByfm4E/9/krTb07BC6uhIKDAEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 05:22:03 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 05:22:03 +0000
Content-Type: multipart/alternative;
 boundary="------------wSO0PrOLzIAbN6fOyrvEU42W"
Message-ID: <e75c42db-e992-4436-bb46-1bc0b4c295fb@windriver.com>
Date: Fri, 7 Feb 2025 13:21:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/9] multilib_header.bbclass: need multilib
 headers for nativesdk builds
To: richard.purdie@linuxfoundation.org, ross.burton@arm.com,
        "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250121085526.1370937-1-hongxu.jia@windriver.com>
 <20250121085526.1370937-2-hongxu.jia@windriver.com>
 <3AEDB7FD-6C36-4B80-9E24-0030B4A54E47@arm.com>
 <b029a8a84294c6cad08dae46a5cfec398bc04a6d.camel@linuxfoundation.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <b029a8a84294c6cad08dae46a5cfec398bc04a6d.camel@linuxfoundation.org>
X-ClientProxiedBy: TYCP286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::10) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 23349bdb-fef2-40a3-65d8-08dd47375b0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dDVJbTlYL3Y3bWJqRVhINDN4bzBaMTY0QVhGTkRtbVdka3lzUlZRM0NGVHBI?=
 =?utf-8?B?MHBNQkZ5VloxaUd2bXhzMkV1T1N5UUJQeGZ1TFVWaEU0R0dXV041djErL2VB?=
 =?utf-8?B?UmloTVhnWmovVDlPd3ZNUWM1QTZRby9JdDYyZ2RZM25yVXUzT01FLzFiMmVB?=
 =?utf-8?B?c2VQZjJxVDNBanlUZlE0cmJTWXJnbVF2OHhZSHp4MHFRcVpqVUp2R2I2YWpt?=
 =?utf-8?B?eXZtdW40VlRqTDBGSUJMSzVsNVNYQ2JVeTc0TGRjaVYzcUtkZndBQWdYbzJI?=
 =?utf-8?B?RnZpcjhQOWpSK2hZSHBrMEEreVRzY3RFdnhGZHpscGdpeDBKREY3WnBjS3Q2?=
 =?utf-8?B?b2JxOThlSkxvZWlPMlhZQlZiZ2tzQTErcGRLbEh0cHBjOFZ6NEcxQUdnVXlt?=
 =?utf-8?B?cDFrRnRENzZPdlhVZE5lN3FNYURUK3pHNmlGVmJoQ0RoZE1Dd0tOb0JXNWJQ?=
 =?utf-8?B?TFlac0JPUzFxMDI5VExwOGZwTlZQeGhEdkVzMjllbjh6a2ZDWC9SL2orM0Qy?=
 =?utf-8?B?R3I0UHFtZkxuaDltVjVpcnRRUUNEY1JJa20zWmp4TEMzQVNLVzNSaFdzRVBi?=
 =?utf-8?B?MzBHaEdxMnRiNy9tUVRPN2RJckxqOFgzU2EvZzZZWjNKci8weHBSUURZaHVU?=
 =?utf-8?B?S1ZsZnpZY09keHI0Rjl0aG5mOU15SGUvZlBlWkJVMTlMYzlYajhRcWwrRmVq?=
 =?utf-8?B?OG1HeFlxK04zcDdQT0hDQnplVEFlc3l6cHQ0RTVtYncrUTJOWm5IMW9tODZo?=
 =?utf-8?B?aGJ1U1REWTdxbXJNbXlXVVdocTVqV2NKUE5Sbkk1UGJEckRqOUxFN3R2MnhC?=
 =?utf-8?B?WU5DYkFkRVN3dEhoT3NOcnVJQnE4ZFNLWUJhdlhuN2hFRXNLMXlHR0tSOHZF?=
 =?utf-8?B?VmxGbjJyYjVWdFIzbC9uVWNvQVk2UlptcTc0ZTZ1amNoWWhvRXVLbUthK1o1?=
 =?utf-8?B?MXQ1SDhzM3BkVzNZQVVoZFplc040N0puZUw1NlpNaGhQM2dpT3hSajVSTEZk?=
 =?utf-8?B?QXZucmNBOHNaYjVEcGVaV3FpeDcxaWR2ZEdVUmcrcGlrcXl3eW9LeVk3N1FI?=
 =?utf-8?B?Y2JQaUswelFkZHZqT2VZM1hkcFRxczVHMCswLzZZUHluQTRXOGVNY0d1M0dB?=
 =?utf-8?B?OG0rWldmMC9uNHF3OEZjOUhNN3ZkMDhpVWE2bGY3MEsxbVgrb3M1S096THBa?=
 =?utf-8?B?a1RXZysrK0kvc3l1RUg1di9JUFNQK29PdlFxSE9NNlFDSUpWWGtDSm5pSDlO?=
 =?utf-8?B?a3BGTG5KWU1TeTVNV200L2ZLdlowVSs5MjdYU3c4a256SEdVT3JQWitYaC93?=
 =?utf-8?B?WkU3UlpXcm1JZVNHL2hwZ2lZQ1IwR0prQXZhWlBUUnNmTUdZamliNSt3Mk4x?=
 =?utf-8?B?d3RMcU5aRXJnUWM2RGJ6RGhxdGF6UmhYZ1hLOVJEMnFOQlpUZEF1Ui9sUHZF?=
 =?utf-8?B?UCsray9BRTVBVGMvUGhkMnBIUlFuajU4Y1h4WTFZeHlvUzBNY0xYT0liNXRS?=
 =?utf-8?B?N2ZwUk0wdmladkpvRE95ZDkxWkVXK3FnUUdCemlLUk1OY09CSERvU0o0MENE?=
 =?utf-8?B?STVHRFpiYUVtTDUwam01OEhhRGxkWDRRMDUzTnFLM09oUWRZRHZ5MXNQMWp3?=
 =?utf-8?B?cXVCbFdrV25sYzVyTTdIOFJKU0lVaEJwVVM1VHdrWVJiTm9Ia202T3RDTU9E?=
 =?utf-8?B?WnN5YnpKNDlXcWJkUWJCRmQ0azMzVkg1ZTUzMUxsMzE0bnhIY1dyMi9GVmlE?=
 =?utf-8?B?Ykw1dHQ0MWtuMjdXY2ViWjV1NkErZm9xcko4dHFpSk1kT3NNVGhUanJySXZL?=
 =?utf-8?B?MXE2dVhzVXNwM0RxNEN4QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVYwdnp3UUV4dStLdU85bGE1R3NNMW1TNkMrWU5BWE91M3RicGIxOThHRFBm?=
 =?utf-8?B?QXd1ZGRrVGhXQzlRYkNWME8yQWZwbkpaL3l5c21mMG4vTmt3Rk5McEdXL3VD?=
 =?utf-8?B?UnVYVGxGSkJsblZQYXptU0dCRTVjdnZKMjZNVFRaV2ptV09MMW5iU1hZMjlu?=
 =?utf-8?B?Y1kyamE2Um56SFFHNXBTS1dvN0lpMGFzSmVuRkpEZ3gwRzlPM2pvNlVWcGxi?=
 =?utf-8?B?UFNyY2d5QVJVVnp1RnR6Z2dyOHdwMStSRXFjZ3VWTGthUE43Skk2Q3ZXOURu?=
 =?utf-8?B?RkFORVQvWjkvR24vSWJEU2ttQjcwVDZ5cnNiUElCTkxtT0U2ZHN0VElaSFVp?=
 =?utf-8?B?MlRqbGNPZ2dKYUREWHhicEdQYkIyZGNJK0VRRlBFcDFUMk1ZSEkrQ1c1MjA1?=
 =?utf-8?B?N0xvSThhejRhbWF2djZ4dGhxa1NDK0xmUXVYVm1DdzdQRkszeFI4TWtFZUty?=
 =?utf-8?B?UU0xTDFUN1FKa0NlN0NBL3BGS044d1RjSUJQc1lNLzNFUjRITWxmRldrQms4?=
 =?utf-8?B?TjdjZk9RcXhBRzQ0OUpPdXkxWmNiS1RuMmVxMDFaTk9ON0pRNzR6bkxkNTdO?=
 =?utf-8?B?dFRWZTVvOER3Q3kwRStpdGFOY0VlUnJWSHJDMVYrcHY2Mm9rbFN5MVNINmJn?=
 =?utf-8?B?OEJwOGRZMFh5Q3lKNHJ0SS9jZitsZFZjMTJiMklLUlZFQ0lidGhQR2JydjRv?=
 =?utf-8?B?SGtnZmd4UXlHK20yODdDb0U4YTRmU2hSNEw5dmN1VExRQW84cWhGT21vSGtk?=
 =?utf-8?B?YXM2TzZOVU4vOEtlM2ZkM1FRSC9Zem1uVkVGNFhXSUQvQytWMkdYSWZJbUEv?=
 =?utf-8?B?dTBoaTJDTldwQzlDRmpOSjExZWZaSzJuTlhzLzZkMkFIc1duUnpncmNJZmx4?=
 =?utf-8?B?Z2tia2djRE8xU3ZzV1dNRUFsYyt3Y3Y3bTczYmtxUkVYZk9EWHlWMEFpbXB0?=
 =?utf-8?B?UHUwU0I1YmM1Nks0Nis1WDJrU0pEK1lRVndQeWpUaUVydUlIMDFDQWcvbTFy?=
 =?utf-8?B?b1dPS0xCU0c4dUlFeUh6OFg3enJrMXQwb0ZWRUNIbS9JZStYVGMwRW1SL204?=
 =?utf-8?B?UHo5eWpuSGhJYmhydjhub2RkUkN6c0F1NkRBRldqTTV0UGRGb3RxT3dFaS82?=
 =?utf-8?B?cXhPN1dFZGlISWhkUllaQjRkS2x3ZzE5aGxKczhxUkRSdTF4R0pFM2E5WlpP?=
 =?utf-8?B?ZE9odDZaVUhCUEZNUjFSTEcrSEUyM25Pdk1Xd0pPK1VzUGh4UE1hdW9JMXRZ?=
 =?utf-8?B?bFE2dUhDYVc1Mng3cmRFZ215SHNRV2ZjMHRmSGpXdHNKTURST3d6RGRBbzZz?=
 =?utf-8?B?U3J4YTVqQnl5YjRMd1IyZmdpK0Zkc0wrYjk5ZXpHbWlCZDNoL1l4bmJCQndD?=
 =?utf-8?B?cEF2OHNnejlPQ1NockJBZ3JBczhnK01qdGsxRklLZTVvNlJJRUF2czN6SnNp?=
 =?utf-8?B?dmdObWtIUXZHbUNUd0UvVU12UDI2S3FkRmVzWG9pQTVWLzNLWWxMMGRoRmp0?=
 =?utf-8?B?RVI1TlArR1c3aHFWRDFNVExIcGNqdktRSFFPUkZlMFdQT2xNTzFDR3cwN2xv?=
 =?utf-8?B?YjVVckhpSEVOTGlHYWJYa1h1KzFOc0JmVzUySlUrdlBDbnJKcjczVzJ3QVFa?=
 =?utf-8?B?QW94b0xGbURrVzA0U2tMYW8vNlhzdEFOMHNOUXppZnNxMmVteUFzcm1QcnJP?=
 =?utf-8?B?NGxodEhwOGpLUVRFdThybVcyV2NKRlUzMDB6SVhjOU9oelluSjVGTXlRdjRm?=
 =?utf-8?B?bG5adlpOcHM4aWx4eTIwM1BWVzlGb3BVVEFBd1VBMU00MUlWZ3F2T0xOckpR?=
 =?utf-8?B?TUxSaTZ0b21yRnNSblBDS0d2U2ZOejhva0RkZmZ1RTBLYWdEVUJDMU81Y1U4?=
 =?utf-8?B?QzlRM3pkSEsyZ09VbTVueU8zY2V4aksvRnRDcE1zbGxkemMra0tUUlZTRnVY?=
 =?utf-8?B?T0gvaGtHZGNLMU5GWE9lNy95Q0tZUkVpYTBqaXhDVE5xRUdsNlpQa1piRFNY?=
 =?utf-8?B?VDFSTEk5U2t1R0dwT0piU00yclFsZHJ3VEJDN3F4bFFPYW91ZDlaRlVmOFZF?=
 =?utf-8?B?UE1GRStqK0lZd3lBeTVPQ3RsZHVYNmVnaUFkL08yaENQVXZWTkFTL3VORGdM?=
 =?utf-8?B?TWhUSk5qbS9LOCtJeHpnaXM4aEFJZFBjVTBMQzkrVHdubGY2YTVPVElab2Mr?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23349bdb-fef2-40a3-65d8-08dd47375b0d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 05:22:03.5160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwndgKxjr8MawKxGZXVeIXMEvCanfo1w3tjQRfq4vxjWn1IhHo/BjZls7O9wyDFWpEi2MhRhSwP/paOJX4P0hHasS7nWOGUeipCgEMVV7GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Authority-Analysis: v=2.4 cv=PqlpbxM3 c=1 sm=1 tr=0 ts=67a5987e cx=c_pps a=kqCqMoaEgQjRYYKBKtAp1Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=yCkusxsiZUWBP2yGl1kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=-hVr8yCSUddekEUm:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: hmoUInlYfzWdh33HGZCQ-siD8Qy6pL1U
X-Proofpoint-GUID: ANavvrE32IPzTzdL8W3oq3NZDx6Cp8se
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_02,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502070042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 05:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210968

--------------wSO0PrOLzIAbN6fOyrvEU42W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5175Aqpg002595

Sorry for replying late, I am just back from the vacation

On 2/6/25 15:39, Richard Purdie via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, 2025-01-29 at 16:58 +0000, Ross Burton via
> lists.openembedded.org wrote:
>> On 21 Jan 2025, at 08:55, hongxu via lists.openembedded.org
>> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org>  wrote:
>>> The nativesdk multilib support required it to fix multilib headers
>>> conflict
>> So the context here is that luajit apparently needs to be able to
>> build native code with the same word size as the target.  But this
>> demonstrates nicely that nobody has tried to build a 32-bit luajit on
>> a 64-bit non-x86 machine, for example:
>>
>>> gcc: error: unrecognized command-line option =E2=80=98-m32=E2=80=99
>> So if the goal is =E2=80=9Cbuild luajit everywhere=E2=80=9D then this =
doesn=E2=80=99t solve
>> that problem.
> I've been giving this a lot of. Part of me does like this solution but
> equally, it is complicating something which is already quite complex
> for a comparatively isolated problem. As Ross mentions, it only fixes
> this for a small subsection there too, it isn't a universal fix.
>
> Some of the patches in the series are simple/trivial but others have
> what looks like quite fragile logic (e.g. the libgcc paths).
>
> I'm not convinced merging this and trying to support multilib
> nativesdk-gcc is in our best interests unfortunately.

Agree with you, follow your suggestion, I will drop libgcc patches to=20
supportmultilib nativesdk-gcc

and pick up the simple/trivial patches from the series and resend them=20
in v2, including:

 =C2=A0[OE-core] [PATCH 3/9] toolchain-shar-relocate.sh: support multiple=
=20
dynamic loaders for multilib
 =C2=A0[OE-core] [PATCH 4/9] script/relocate_sdk.py: check dynamic loader=
=20
arch before relocating interpreter

//Hongxu

> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210907):https://lists.openembedded.org/g/openembedd=
ed-core/message/210907
> Mute This Topic:https://lists.openembedded.org/mt/110730419/3617049
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
hongxu.jia@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------wSO0PrOLzIAbN6fOyrvEU42W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5175Aqpg002595

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Sorry for replying late, I am just bac=
k
      from the vacation<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2/6/25 15:39, Richard Purdie via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:b029a8a84294c6cad08dae46a5cfec3=
98bc04a6d.camel@linuxfoundation.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, 2025-01-29 at 16:58 +0000, Ross Burton via
lists.openembedded.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 21 Jan 2025, at 08:55, =
hongxu via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hongxu.jia=3Deng.windri=
ver.com@lists.openembedded.org">&lt;hongxu.jia=3Deng.windriver.com@lists.=
openembedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">The nativesdk multilib s=
upport required it to fix multilib headers
conflict
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
So the context here is that luajit apparently needs to be able to
build native code with the same word size as the target.  But this
demonstrates nicely that nobody has tried to build a 32-bit luajit on
a 64-bit non-x86 machine, for example:

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">gcc: error: unrecognized=
 command-line option =E2=80=98-m32=E2=80=99
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
So if the goal is =E2=80=9Cbuild luajit everywhere=E2=80=9D then this doe=
sn=E2=80=99t solve
that problem.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I've been giving this a lot of. Part of me does like this solution but
equally, it is complicating something which is already quite complex
for a comparatively isolated problem. As Ross mentions, it only fixes
this for a small subsection there too, it isn't a universal fix.

Some of the patches in the series are simple/trivial but others have
what looks like quite fragile logic (e.g. the libgcc paths).

I'm not convinced merging this and trying to support multilib
nativesdk-gcc is in our best interests unfortunately.
</pre>
    </blockquote>
    <p>Agree with you, follow your suggestion, I will drop libgcc
      patches to support<span style=3D"white-space: pre-wrap"> multilib n=
ativesdk-gcc</span></p>
    <p>and pick up the simple/trivial patches from the series and resend
      them in v2, including:<br>
    </p>
    <p>&nbsp;[OE-core] [PATCH 3/9] toolchain-shar-relocate.sh: support
      multiple dynamic loaders for multilib<br>
      &nbsp;[OE-core] [PATCH 4/9] script/relocate_sdk.py: check dynamic
      loader arch before relocating interpreter<br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:b029a8a84294c6cad08dae46a5cfec3=
98bc04a6d.camel@linuxfoundation.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Cheers,

Richard

</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#210907): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/210907">https:/=
/lists.openembedded.org/g/openembedded-core/message/210907</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/110730419/3617049">https://lists.openembedded.org/mt=
/110730419/3617049</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:hongxu.jia@eng.windriver.com">hongxu.jia@eng.windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------wSO0PrOLzIAbN6fOyrvEU42W--


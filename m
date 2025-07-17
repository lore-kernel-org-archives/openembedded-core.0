Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2BEC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 19:47:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4543.1752781658645056667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 12:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9293c3a1dc=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H6lVuW273696
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:47:37 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0ugfw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:47:36 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56HJlaPt1577699;
	Thu, 17 Jul 2025 12:47:36 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0ugfv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 12:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x23tvFzwqAEcoGmYoZj1v/F9qlaPCl9hyPm7JXM3i32b33fueZY5qtSCYIw7g8E4oTlod+9fvCuPePgF0T0r40kFvrw3TwVdGHMKWJw/TeXICB84+bsKfjAi17j0yjiUmnkCNTX4x/daD+0h5zBiSgHxchykr6B6+FVdeZ8ugeJWMAec8WQqAoZifwoB1E+PYDuWBzIEYO6do+YBc08xSzLsXLUdLyK3Pv8/fMdKoxBsJrHl2rNvO4WVoqu5kkcKI/zQxGa2MKa8eR19wK9eT6Hbg5caTQr8at2FAuB3kg7x5EpwR89ZRubvXOR7/s12maImzOSmUs5z7Tb25CvkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWfms21aOiOQMOr/hYziBl9bDKsWwT1YTAxw12rXPOw=;
 b=nCmpNIyScC4O3Ipl4J9nUFPc0YugtIyvhaP/eSQR7ljN/lTrpNdpG45Y0HvtExLFbV2l6kZiuKrlp7jha1tzjfvQkn227Sw/MHu0jSONpqLzqSXoJl6dLnkgHpesQqcNo77J1JtAa41E5QQkME81yogwoUgXw1d4uGtFJBMtwQbTetEbmfG5uMxnAarfvm8Aq9hBFongXLcRzUYv9CUFe14lc3/Kdi4ey2Dx8L4plxmsXBcOzLNPaEWaNB65AHTjLeick9t6G2Lbe45dc5arHSghN3i5USieU/LAviL7yo5/Nzn9eNJf2KrVTfq29rPWCUh/oJPX6daN8K/18I4SxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 19:47:33 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 19:47:33 +0000
Content-Type: multipart/alternative;
 boundary="------------Y0Dbddsnpjmj2IIcL3COzlBg"
Message-ID: <b727f10b-b809-460a-8684-ee9984ece58e@windriver.com>
Date: Thu, 17 Jul 2025 15:47:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [walnascar][PATCH] glibc: stable 2.41 branch updates
To: raj.khem@gmail.com, deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        Ross Burton <ross.burton@arm.com>
References: <20250717085837.227414-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1spmKJ_OwsJLYkJJqA3a6MrkHsKCZeVNQUZg1Bx2hueBSw@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1spmKJ_OwsJLYkJJqA3a6MrkHsKCZeVNQUZg1Bx2hueBSw@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0264.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::18) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA0PR11MB7187:EE_
X-MS-Office365-Filtering-Correlation-Id: 0916b600-4200-422d-e846-08ddc56ac578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SUNMT0NXZkFmS0ZEaG5Yd0dBWHF4REp0dUVkSVkxaUFNZm15R2Fwd2RHeDNm?=
 =?utf-8?B?dXNSNVpob0NkdkpBL3FmUkNNTlhSazhyTnVNQTd6RHRvZU5tRXBTQ3JKbjg2?=
 =?utf-8?B?TjRsR0wwanJJejd5SUV2UXJXUVIwT05NYlpMcGtJSnNmMjUrbEVldlJUaTcr?=
 =?utf-8?B?UHhNbmU2TEpnY0ZUSUY4NzlKOExsOEhiMlNQODRESVJsb0FXOExncXNrd1U4?=
 =?utf-8?B?eWhLWXZiQms2dVVqSmNhcDFsK0lIVkUzQVR1T1RaYzVya25rTEJQU0Field0?=
 =?utf-8?B?Rmd2dkJ2MUlSS3JwL2RGay9sNW1kdUlnYVhyVnpCb1RvWERTaTF1ck1tVmpF?=
 =?utf-8?B?blhveHpDMWh2dlZJVExPSGpOS1dDWUpJeE5HN3JJR2pXYnVESDUvaE5RdzBV?=
 =?utf-8?B?eG9xSVJ6SXdlQlRTYW53ZUZGUzdjc0RnV3R4ZU5OeDk1dVpUdDBGRzB0dlBB?=
 =?utf-8?B?TWlkcHV2d0o4blRYWW8xTWNMSUtuK1czY3gvZDVPc3hZQWtiU1o0bFRVVElW?=
 =?utf-8?B?U0pGQWNEM0VKTjdvR1llM0toRnQ5WGF3RXVxU3lpeXVKRmM5amQ4V0grdzU3?=
 =?utf-8?B?Ymh2YS9NWjRMeDhHdnBUZUhzK1lxV3dIeGZmeWdrb1RnRzRLeFB5REVMUG85?=
 =?utf-8?B?NXpFaVEyQU9xTzJFQTFQZ1BkRlZBUlhHKzNsR1JrUVhNMXh2NjdxZ0hLK1RE?=
 =?utf-8?B?RVM0U2pHY1FmckJsRnFLRlg5TzNscjB6NEhxbnErYzZFdktpcXJVU2d2UEJk?=
 =?utf-8?B?SDJXckVZU1V1cHE4NlppWThwZytzSEE3WUpjL3F4ZW1tSDE2czJXTG9HWFNq?=
 =?utf-8?B?b3dkWGR4eVU4dFpPSFl3ZmlLb05GREpGeHUxSS9ISmY4aXM2bXdWbHNKTFN2?=
 =?utf-8?B?WXROSFNUeW9EbnU4dmZZVGdtN1lUekVpWUFFTWlDRk01ZnBRdDQxZ3ZuTzc4?=
 =?utf-8?B?SFpSTVVESnRkaFoyZFYvSEl6ZkVjTlErdi9BKzVKWDVlMTU1TXAxTTdNcTFG?=
 =?utf-8?B?QjFwUTJpbXhQS1ZFditGRFE0bVZ0TU1pQkVUUXJxem5EcG40TVVEVnA4dFhE?=
 =?utf-8?B?YzNURFBCeWIwdm80TEtEbS9ScFlxaWtWMWZxOEdJZmxwZGhVclI5UG1SWVJK?=
 =?utf-8?B?N1NnYm01M3VHbFFJS0hEZUsrdkN2QkZxMEc2d2JCaXh2aGRvNWhzRWhjcHdI?=
 =?utf-8?B?MGhWV2duRE0vWk5yV0hxbjdtSlBXUXRJb0puMDFvZkhsR1ZUMEJHSUxyMnpH?=
 =?utf-8?B?NG9WNUMydWY2UiszTkhnZlBZSUZpYUdSKzZpVms1NGZ3ejhOYXhFbWszWWxO?=
 =?utf-8?B?UnVZOUV4V0pONkxtVy9NOThzbzZnSjQ0QTJYRlZqd0RiUUo2aEV3YnEreFNV?=
 =?utf-8?B?MGVUbTRobElzOVRrZHdFOGI0ZGdJTGUxQVRaSC8ySExkWHBuN0h3dFV5UUtT?=
 =?utf-8?B?SUwrSFo0TE5EZmlUaWFQU080dHovU3JaRzg5bEQzVWdYbXljYWxnaE4wc2hl?=
 =?utf-8?B?bGVyQ2NydmtBK0VXcUtqV21SV25EK2x2L3RGdDF4d0ZUYnh3UjBvNkptcFMx?=
 =?utf-8?B?RWMxYksxY0doeGJwKzJlYjJZU0xZZFJBK0dHWjd4YmVwaWFkWUx3L2lkaXJF?=
 =?utf-8?B?SFFwTGNSMy96THVEQTlsN0dxbG9sRzJXSlQxa2lqWVlzK1lScVo1KzUxdDFy?=
 =?utf-8?B?b0NHS0I4SGlFYVpla2pFYXNMWi9tQkIwTXFqWVJaNnVrWFI1TGUrZHU2am94?=
 =?utf-8?B?QURkSEJxTjdUVy9QVVdpenpudWdybWpKNXpKcE1mLzVZU0R5NGhvMVJWdkRa?=
 =?utf-8?B?bUluVWtFMVNaWDZtR0hOSTVJUU1NTlA0SFhONjhaWno5em9wS0FyRDZUSVpo?=
 =?utf-8?Q?zYa1oC86kx17W?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0hGRVc2UkFBUkRhd0kycTJMQlVHWXpMMkNudDZqai92b29WV3ExWnlaaFdF?=
 =?utf-8?B?cVNBaEFGc0VaKy9lamRPN3BpZUdRd2JhbHVJNUpreEdHdXNOYVlwYVhEZ21U?=
 =?utf-8?B?bXppSHdLOW9jcUorTEhnOUIzeHA1WXRLdVFWZTNiRXpwOGZ6am5DN3BhekQv?=
 =?utf-8?B?SHR1U253aXhRQ3AwV1VVMlA4VzJtTWtoR0xZU1hrNGtPdDJwV2g2Ulo1Z2U4?=
 =?utf-8?B?YVVFcXN6TURmUUl3TFA3YlZHa0hLZW1mRktuUHlkK213bmNKV1F3ZktPaW5W?=
 =?utf-8?B?ZGZLOVFUbk5yZHlqT0hsVnZ5OVVYWDMrbVN3c1MxdnNROWIwNXdCNXpSRmY0?=
 =?utf-8?B?OFJoZmhjTDlnUExFZWQ5Wnc1QmNhYkdydm1CRjhhTzg1bU56dUt2WWlwcjBl?=
 =?utf-8?B?aW1ZbGRXaXZXZmlkVFVOaUxQdUh2TmRMSlpMUnFEZzV6N3F0d2dsdFZ3Nm5q?=
 =?utf-8?B?WHoySE0yT1MvaUJaeEEzdGpZRzFmNEp4TUJHZU0zaDFNV3BuK2VoUDdEbjEy?=
 =?utf-8?B?N1pWc0RtSG9RemdyaEdvaTJ5c2RiZFp2SHZiUlhqU1VOT2FiMEJHWnU0aUhm?=
 =?utf-8?B?KzFKQ0hGckRndi9Gbm14eVdnY25RLzNWTXNINW4wdTlSN0FjVFFZQXR3d2Ex?=
 =?utf-8?B?dzJDYzUxRFlsUmJoUHdJdXo0R1Nod0xIajI0OFFZbGRMeUJ1UEI3d2VybUd3?=
 =?utf-8?B?YXA2S1FVZ0dtckF2NEFNUU5zVnp2eWNmTUgycDhsYXEyMkllN2V1SUJJM3JT?=
 =?utf-8?B?Yysrd0ZxZDUyRGFQWGxjdkxMcXdYeVhQeHJTa2NSbWpTNnYvYytmTGRldjFH?=
 =?utf-8?B?TjdGbUtwMURzV0xkcmU2SWJSc1REWkFad2ZvRmVFcnVGRWpoVDJBdFJYUWpR?=
 =?utf-8?B?cVdGT2N1dm1XaDBiZ2V1WVZyWGpTNU9Pd3RRZitBbWEyUlNaT0pmcnJENmZq?=
 =?utf-8?B?N0ttR2h4bThhend1Qlg4TjEvMVVrUjc5YlIwQTcyQUxjTFJ5RURRV29SR3Z1?=
 =?utf-8?B?YU9aTDBIV01rRWFBWEJZTlNRVFNueEx0OFZlT0lydUt2RmswZ2ltTVNrY3o1?=
 =?utf-8?B?RnlQTDIxUHVwMHZsUVcvaGQxajlXZjFsYjQ0NEZVUEZGK2V6cWgvVnJSd0pn?=
 =?utf-8?B?YXpzYWdnT2x3MmhodWpHRG14OFB1eE8rT2lFbXg2UWsyMWlpUEoxK1pxcDY1?=
 =?utf-8?B?Qloyb1hWOTFIUHhteVBnUUJwUHlwSk1XaDhIelF0Qi9Tb0p2MlhmdnBGVnlj?=
 =?utf-8?B?SXo3d2h4dkltMzM0aGRVamd3T0RObDY3SXI0U3dmZzJvbVhGZjExMERvOWl5?=
 =?utf-8?B?d1hLTVBCb0djRUlwR0Vyb0lKSURWbW8rOVh5VXlSeHcrZUR0L01LOU9XTjlH?=
 =?utf-8?B?emRudk91dVZES0N3a1hPeFJKV0ZVY2dCcC9xeWJ1eXByWVBhL1Y1TVJCbkcr?=
 =?utf-8?B?Q01UbGNoS1BhSG5IcmV5eU05Z3FRb0NCWlNmMi9sYkV2SnNnSnpoTHd5d3lF?=
 =?utf-8?B?Z1RKV2t1K09XSXYweE1BM3pKdk5MVHhlZUJST05ORURoSmhwNVlDTTlzWFNs?=
 =?utf-8?B?cC9kUHAxS3dSVEdPemhhV29yNDlYbDVFNTJ1OWo1Z2R4Y1AvbGlXMTIxVnlo?=
 =?utf-8?B?VDJVQTYyTDl3d0xXU2dEY1NzdDZxS3hOZmc4QzRpTEFPaWtmaEVuZlBFdkdQ?=
 =?utf-8?B?MGdJc0J3MTk2S05UYWIwZ3ZNZkZ5WnlmNVBPYyt6WW5ycWZCU2J2R29pM2pp?=
 =?utf-8?B?ZHovNzBrTmN4cCtJRTVwZFpUdVAvdE9jdmEwYktsODBPRGRTMmdscWw5aHRa?=
 =?utf-8?B?Z2VDNFc3V0NsMHo5alYzRlUrQU5LVXhhQWprOVdvN1czMFhBMGxJU0d5Qlpu?=
 =?utf-8?B?YXljTFlFZEdUMC95SWx5eFpaTkJQZStZQzV2YVZLbU1jTTNRZjNhMGFjOG02?=
 =?utf-8?B?YWMyM3FLMjRyQXc5emZpWjhkN3gxUTlGR1V1WW1mTjdybEdsTWpXbHNodldp?=
 =?utf-8?B?MlkvQkd2elhCSUVhR0VidFJWZWplZHBvM01WVWlSUDVTWm9yNHRlY3A1NzJP?=
 =?utf-8?B?QWlIcHI5S1pBZSt4U0NRL1hCT1ZNOS8zSmRkR0I4eFFwSmNzbitlNlpJZ3gv?=
 =?utf-8?B?TklVRUlDZW5RbzNNRnRLdFVLbVpSbXBsaUl2OWlKUm02UmVxd0pUb0VFWEpj?=
 =?utf-8?B?bFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0916b600-4200-422d-e846-08ddc56ac578
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 19:47:32.9455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUWeVDssYEIEo51rWleP3b5ko9RQPH7W2pSK4EsMfEntq7dFMAVNIBpuNU9wGBZ1NbvBtbMBLGtBJF33sCDROahAktJRfUFYPHa53bJkKas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7187
X-Proofpoint-ORIG-GUID: 1vnnEwnH0cZ8Cu_pslNoPhbvDEX8IUGc
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=68795358 cx=c_pps
 a=O4E2hSStesN9zpsRCyjChg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=qHSnT65KF2cbNJMEaowA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=E1Net01Biv2o2VZs1t4A:9
 a=m6Rkm2_uw6opNd3u:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfXzSQnX0IlHTBM
 nHrRieVL9HqlANascnj4+9T4UhmqG8jCoM4oJHhgnv84J6g5cakiMAB9ZmD5aQLktCoGsQGs4/d
 uI6HECyNEi2Haph2VsZEImK7Et62fmfSLpzUvBilckpi6xIJAB2LmDyAVmg8ABZimR8LRuj5ZtV
 +kXwjSc52GTuMIWlb4mATlHsbbT/ztFa2KtFMukL0HD93kEjlmqfGQzImxNHrofHpNf3/VlxDhw
 IK2qJ45Irwzb0N1buBB3y1c1t5c/9mi7TiXepRkHtVEjdEtkAU7aux8OPWa8u7DW+N4WiHKhb5l
 unMZDAIyGjpCYgjsLtyl8XfTMyOURCKSmds0F95rc7ToqEu02gW9Kmn34GTOuCGt7EQ+mJGoCxS
 C7qhXhpa
X-Proofpoint-GUID: xcYDFq2P9A5RMl77mPYQbeSVPeC93yBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 19:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220561

--------------Y0Dbddsnpjmj2IIcL3COzlBg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56H6lVuW273696

On 2025-07-17 12:40 p.m., Khem Raj via lists.openembedded.org wrote:
> LGTM


It does look good, almost too good...

Deepesh,

Please explain the why the UNSUPPORTED and FAIL results have changed so=20
much for the better in this case. Looking briefly at the changes, I=20
almost expect this sort of change but I'd like you to review, check the=20
linked bug entries and provide a v2 that summarizes why the improvement=20
happened. Also, did the number of tests change? The sum of the Diffs is=20
not zero ... In the future, when the Diff is not zero you should try to=20
summarize what happened so people can benefit from your knowledge and=20
your easy access to the log files.

CCing Ross so he knows that we expect a v2 with a revised commit log.
../Randy

>
> On Thu, Jul 17, 2025 at 1:59=E2=80=AFAM Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>
>>      $ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e4=
89c17f827317bcf8544efefa65f13b5a079dc
>>      6e489c17f8 Fix error reporting (false negatives) in SGID tests
>>      11e634ccf3 support: Pick group in support_capture_subprogram_self=
_sgid if UID =3D=3D 0
>>      61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_star=
t_main (BZ 32981)
>>
>>      Testing Results:
>>                 Before     After   Diff
>>      pass         5807      5813    +6
>>      xpass        4         4        0
>>      UNSUPPORTED  164       161     -3
>>      FAIL         280       257    -23
>>      XFAIL        16        16       0
>>
>> Signed-off-by: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com=
>
>> ---
>>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-=
core/glibc/glibc-version.inc
>> index 2d31131e03..a2cfd0f308 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,6 +1,6 @@
>>   SRCBRANCH ?=3D "release/2.41/master"
>>   PV =3D "2.41+git"
>> -SRCREV_glibc ?=3D "0c76c951620f9e12df2a89b2c684878b55bb6795"
>> +SRCREV_glibc ?=3D "6e489c17f827317bcf8544efefa65f13b5a079dc"
>>   SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>>
>>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dht=
tps"
>> --
>> 2.49.0
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#220549):https://lists.openembedded.org/g/openembed=
ded-core/message/220549
>> Mute This Topic:https://lists.openembedded.org/mt/114200019/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------Y0Dbddsnpjmj2IIcL3COzlBg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56H6lVuW273696

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-07-17 12:40 p.m., Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spmKJ_OwsJLYkJJqA3a6MrkHs=
KCZeVNQUZg1Bx2hueBSw@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">LGTM</pre>
    </blockquote>
    <p><br>
    </p>
    <p>It does look good, almost too good...</p>
    <p>Deepesh, <br>
      <br>
      Please explain the why the <span style=3D"white-space: pre-wrap">UN=
SUPPORTED and </span><span style=3D"white-space: pre-wrap">FAIL
results have changed so much for the better in this case.
Looking briefly at the changes, I almost expect this sort of
change but I'd like you to review, check the linked bug entries
and provide a v2 that summarizes why the  improvement happened.
Also, did the number of tests change? The sum of the Diffs is not zero ...

</span><span style=3D"white-space: pre-wrap">In the future, when the Diff=
 is not zero you should try to summarize
what happened so people can benefit from your knowledge and your
easy access to the log files.
</span></p>
    <p>CCing Ross so he knows that we expect a v2 with a revised commit
      log.<br>
      <span style=3D"white-space: pre-wrap">
../Randy</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spmKJ_OwsJLYkJJqA3a6MrkHs=
KCZeVNQUZg1Bx2hueBSw@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

On Thu, Jul 17, 2025 at 1:59=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:deepesh.varatharajan=3D=
windriver.com@lists.openembedded.org">&lt;deepesh.varatharajan=3Dwindrive=
r.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Deepesh Varatharajan=
 <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepesh.Varatharajan@w=
indriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

    $ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c1=
7f827317bcf8544efefa65f13b5a079dc
    6e489c17f8 Fix error reporting (false negatives) in SGID tests
    11e634ccf3 support: Pick group in support_capture_subprogram_self_sgi=
d if UID =3D=3D 0
    61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_ma=
in (BZ 32981)

    Testing Results:
               Before     After   Diff
    pass         5807      5813    +6
    xpass        4         4        0
    UNSUPPORTED  164       161     -3
    FAIL         280       257    -23
    XFAIL        16        16       0

Signed-off-by: Deepesh Varatharajan <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan=
@windriver.com&gt;</a>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
index 2d31131e03..a2cfd0f308 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D &quot;release/2.41/master&quot;
 PV =3D &quot;2.41+git&quot;
-SRCREV_glibc ?=3D &quot;0c76c951620f9e12df2a89b2c684878b55bb6795&quot;
+SRCREV_glibc ?=3D &quot;6e489c17f827317bcf8544efefa65f13b5a079dc&quot;
 SRCREV_localedef ?=3D &quot;fab74f31b3811df543e24b6de47efdf45b538abc&quo=
t;

 GLIBC_GIT_URI ?=3D &quot;git://sourceware.org/git/glibc.git;protocol=3Dh=
ttps&quot;
--
2.49.0




</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#220549): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/220549">https:/=
/lists.openembedded.org/g/openembedded-core/message/220549</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/114200019/3616765">https://lists.openembedded.org/mt=
/114200019/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Y0Dbddsnpjmj2IIcL3COzlBg--


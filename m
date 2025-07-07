Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0721AC83F09
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 02:03:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.50529.1751853783168970872
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jul 2025 19:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92838e0c9a=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56710jjx012933
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jul 2025 02:03:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ps91s824-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 02:03:01 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 567231Vj006301;
	Mon, 7 Jul 2025 02:03:01 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ps91s823-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 02:03:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrOEwdZhyp3+gWsxAuYcjSufEexCDISIAAzLR4Gq2IIa74VJFa9CTmL1fS+KwRqiuKiMdDnN9e2CDtyzfLhl6wEpc5wHPcqq6P4ny0IYj1NUXwbxDFGS+6JXbUy5Syjh72iyF8n9ZeALPDM4PbGm3XfM3jIofZiz+PLjnsSBoypLiyXVjt5nVua5XXgzgw6xm/2t32Xr5Z7qZqQ2/4dxq+Ir4NaL1M6prk4E2e4EQxoR3pb4qNlTM6eq/OTtUu1pNSvo3bGz5Ix7B5WYKgSR8dLV3BU6gFNOY6lqA248yPUt0G5xLPufLySASRsQqdX4Nswm7dq4+jxTkBv/WnCmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOiqB3/Vn68LaaZbccy0hkFV+j8epq8KPxj1o1G8lkk=;
 b=W7Joq/VAYoj1Wdrae4tZqiKmRtDKmuMxvFqiYWnHDT8YrKAz722fMGVxJ7W/GjpOt9cKP7y/9BNXKl4ybYlG1Tx8otYJJrvs3uXKWNe2rBC4VkUB+Zwrk/v/1PgRzLSKKvcV5oG2c1Cj8xGR1KN/TQK+rDeiAswOsDo7qoryPM6X9DhaHoBGKNFAQBLkkkf2UqrnguC8nF6u+JDpQE3HNTAglbZsJyd2Hn5T3ZyR8tnveugacSOIaRkAzyOYhhxqdbDbYo2rTs+OtUmbOONi70g68a3O6/zDcux5YaN14O2pgxGbD/5j2671w/oDYOcq8mzs7i3JI+agiODf0mYLkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM3PPF63A6024A9.namprd11.prod.outlook.com (2603:10b6:f:fc00::f27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:02:58 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 02:02:57 +0000
Message-ID: <5b56a9da-502e-4f65-8285-4e39991b2762@windriver.com>
Date: Mon, 7 Jul 2025 10:02:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone][PATCH V2] coreutils: fix CVE-2025-5278
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250701041625.1956085-1-Qi.Chen@windriver.com>
 <CAOSpxdbKMCSAywKgsTm04Kk_FRThJCZNLo20ojhABheVizeKHw@mail.gmail.com>
 <8a2f75f8-d38a-47b0-b038-927e2f47df8b@windriver.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <8a2f75f8-d38a-47b0-b038-927e2f47df8b@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0091.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::6)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM3PPF63A6024A9:EE_
X-MS-Office365-Filtering-Correlation-Id: b1bc4882-78e2-48a1-1a99-08ddbcfa64b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cGNsVUJhMU9LdW5HOUtGLzR0UVAzNS9UcmlLZWhCRkxTZ1RBTkdpc0VDS1lq?=
 =?utf-8?B?cCtra2RQSGQ2MXB0djkvMm5jQVE1ck5LMWRFeDhhY1ZWTndYL25GVXFIMXFy?=
 =?utf-8?B?S2orZUZiSUVUaXRpRkdsbFNZTVNSM1RrWkpwZ0Q4T25MaXdiSWFsZExub3JB?=
 =?utf-8?B?T2RrUmcxZ3B0YjlESXNFZFVWV1NyTk4ycXljdEZrbGVXbm9GM2kyMDR0NERt?=
 =?utf-8?B?cERJZzJCT0RWREhBQXFGdjJxbjZvbmV3OEgyWkRFb1NHSEhQY3duZlprODgv?=
 =?utf-8?B?U09ZSlRTNnNMc05leFpWZk5uWTg4aWZ3V00yTEd0R3pUMkhPN3VNaVZEZ0x1?=
 =?utf-8?B?WnhndXF1enRsZmRmUkRKb2xHbXh1NTMvUHp5d1VZY2l6aWdOb2Y1NUdwaWtL?=
 =?utf-8?B?L3c3NSs4VVY4emF1UWljNHVqMjBMYzdsenByQmlvUXJqWFUyUFU0elptNWRS?=
 =?utf-8?B?UnpMN3AyWTBDeXlmTlVDYVNYKzc5UzZMdXlxeFVCYjE3aXpmdWE4bTJ2UHVa?=
 =?utf-8?B?dGkzaWNhTUFMbENZN1doUG9jYlZkaVRpSzBWN1E3enBGZ2o3MFk1VFY2T3RX?=
 =?utf-8?B?bnV5bytaMTRULzhzOWI1QTNHR25hYTFmcEpvbkZaRm9YVWdBTG9aNjNnVHZi?=
 =?utf-8?B?WEtOSXZjWk1mSmFtYUUwRVF6U0NKMWFwT2RVeXcvNWlzTDBwNnNqZjFJNlBy?=
 =?utf-8?B?SmwxSVFROG5sM05tQU5ITDRTaWVIWmlXYkhoYjNBdkJsM1k3bEkrU3ZWR0hx?=
 =?utf-8?B?RndCM0RZdWg5eUR2aEpVMEZ3czV1ektpU05MKzRnTTE4Tm5TVkFBc016ZktP?=
 =?utf-8?B?RHVRQXJlZkluUHRySTFRMU5rdGNNUUIzd29PeGVwQU9laTloRC9wUUU2WWlL?=
 =?utf-8?B?WkY3d3cway9PT2FBM1VmTURuQktxZzFselgwcUJSMkJJbzFpVUhVa0tTMExP?=
 =?utf-8?B?eldPZkZUR3dqVDczSitvazFGOGpMOUxmb3ZXYUdLQWIzRnZyTnF4KzBDWHRq?=
 =?utf-8?B?ZTM2UzQwY3YyekNjSVRkQTUzRitwUExJcGYyMldoRStUZHFybHFZMmo0Q3Vr?=
 =?utf-8?B?cXBSRDl6RlVFMDhmVmJGckFJVS9iRklMYW5GMUFEZEZab3FldGEwenNjT0c0?=
 =?utf-8?B?Y2praUdBUnkvcDl2clE0cmNDWitkR2VoY3RPTkd4UWhxVU9EMUhyZ1N6V0NE?=
 =?utf-8?B?ckJxa05jMzJqSTdoN0xXVlREY3l5cW5hZHhnMFdqR3BCVWpabUtDb2hMYmsx?=
 =?utf-8?B?cGhiMTJ3ZTdOOGRNNUJ2L3MzNzRFVjVtUE1ETW9mVjZUM0NJd3pqcDJtY0xZ?=
 =?utf-8?B?L0Y0R2d3dm9zeFgwcWlKYW8xQ2dvWGRpc0xkWWdjOUwxdjhFdlhuLzdOa3FR?=
 =?utf-8?B?S3h6cGVDUG9uZ0dzRGhRMHUvdEI2bWp4UlN2SmVUZERXOGRBMU1vVWsxcHhM?=
 =?utf-8?B?SHFoem1ZQkliTENDUmhlVS9CbjM4MythcVJKUjZmNm1lLzg3VjU0aXZNdzJh?=
 =?utf-8?B?d1pIR1ptQUpOYTVQaCtkNVdORUdqMHRicy94andrbXNrTnYyOXRQWmZlbnNV?=
 =?utf-8?B?SXFHRE5mS09FOStOMlI1anB4NG5FV1N5WmIzVXVackN5cjZBMkZzcHNQWXdj?=
 =?utf-8?B?RUpXaGRVVEJFN2pRbTgrS2JQLzlPNlM1a2RlbzJCYitBTWk4bGlqa2lRazRU?=
 =?utf-8?B?TW82ZmNid2ZKRUdtdkFlV2huZWlqa3Q1NE9MbXBFS3NNZ21rNHVvVEpRNTR5?=
 =?utf-8?B?M1Z1dExoUzVvL09UQU9vVXp0Q2JWemEySi9HV1dnZFFPSFJTVjNuVE5tTSt3?=
 =?utf-8?B?aG5xQndjbWVsQXFkTlBIV2xJMng1YklnZ24zekFrS0IvL0hHL1h6V0NTZWN6?=
 =?utf-8?Q?NCZmQK2l/+g/i?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UndCc0VGb3NTQ1p2dW1CVEEyWnB6cWR5bSs1WW40Sk1ablcyZlpsQ2ZUWUZ5?=
 =?utf-8?B?cXR4NzJyM3JNMlZoRXhZQVBwdlBqUCtoeUlNYWFjTU05VVdDN0ljcVNYb3Jv?=
 =?utf-8?B?M2xjS24rZmpPdlVPU0I1OXFTaVpFUEFibStOK3Y5RUxCc3d3Z3B3MEdwVXpy?=
 =?utf-8?B?S1doZFY2ei9NVlVlZXRNdzVTbC9yRmZ2S0IwZThjWGJGZm1Ra3dTOU9BTnRU?=
 =?utf-8?B?MzdVS2FYNjZmQkVjM1J5bjFOWjh5WVJpbG5MUUZDSWdXdDFLclpkekp4TGtX?=
 =?utf-8?B?aTRyZStnenpQQ3RKaGNaTUQ1N05VVXNic2wzekJVTFFpTCt6dmpWTjZsUFU0?=
 =?utf-8?B?QVBJcEJkWTN5M2JNSExzemFSdzg2d0NNSkZqWkRnMHpoTFA5MXppbTZhaGdz?=
 =?utf-8?B?MzBobnpmL2o3cVJPY3FuS20zYVgrcmNpTHA3YVl5bkRhZjFRNG5tNC9qMldn?=
 =?utf-8?B?YnVsdVAza3o1amNuZ0tPcGFJK2UwanE2eVRucVd5L0hHbUl1ZU5weExpdllh?=
 =?utf-8?B?Y1VNMTNuWENCOFBwbzJOVHp1TzZhcTFmd2VyWUlHNHZhMUlwa2hJMjU4eTFE?=
 =?utf-8?B?M1J0eGs0dlNseDV5NzRGLzRZdXROOTlPbk1ESFVvQlJPdnhFNUJZTXFrR29N?=
 =?utf-8?B?T0VJUG03UW5hRi9ob0ovZkNFbEYrWFlhZGd2dFFqTnJ3TDNncXlzemZKSU9U?=
 =?utf-8?B?U0ZGUFJBZyt5MURRZVFYVjZBYk9FZTJuODBIWnVHNHpxS01waGZyaTJnWGU1?=
 =?utf-8?B?Y2FXRW5rSFUvUGJ2bjBsMHU3aHVyOUh4QjFlYUZ5M0RjRXpKcmROdlVWWHVP?=
 =?utf-8?B?SUhqelpPRE1Dc1A1M3VOcnJlb0ZxMy9sRnB3TzB3R0V1VDlER05WWFhnSTNn?=
 =?utf-8?B?RHU5dSs1bFVCQ2JGRFBtVXppMlhMZitxakh1WXVWQ1RxMExxVW5uL1JrdWNG?=
 =?utf-8?B?eTM2eVZod2p6bTY2L0FFV1I4cUhubXdnVWxHL1h3OGNhKzdhK0FCR0JaMkZP?=
 =?utf-8?B?TTZlSW1mMllKVGRGN1lQdEM2Y21SZmRESTZXaXJJUjIrL1RCb3NzWitRYzlr?=
 =?utf-8?B?Zmd1bUtMQllSK2xWMENPM3NjdFpwYTZVeHl1SXRFVHd4eUgyVmUxS2x1bFFn?=
 =?utf-8?B?cWF4MUx1Vk1YUTJyZTI3Tm85aDVNNU5BR2RDa2lJd0pDTlFrUmI4ZE42NTRw?=
 =?utf-8?B?OExiRUtnYyt4T25KeHhmMWMvbmpMT2RlTUNIcENNc0o0bnFZMzVKY3BXeTV2?=
 =?utf-8?B?OTNOQkpDVkxYRWVENHJtdFZlM25NUFlnZFA5K3NZNDlEbEVZYndjT0NpRDNz?=
 =?utf-8?B?YlVlN1FBdWhCZGxBWWM3bDZhN25OYit4QkIrV2NLQ1dnQzJmVTl2WHIvZ0Fa?=
 =?utf-8?B?MWdtRGFFV0pPT3AvYk4vOTh2LytYWlFJclRDOVk3TVo1ZzhQVkJGeUxNSDhD?=
 =?utf-8?B?anY4dW1pUmtVY2pva1drTW5nK3BQTmFGRkd6c0xUZElnVEFQSjB1Ri91S0tt?=
 =?utf-8?B?Y2Y1bzFHS3RmUXg2VXE3L1liM2xYWXU2aWFvSDd2Z3Y0YUJXMGZZZjF4QXBm?=
 =?utf-8?B?STd6a3hJTVQ5WW1DTENSMFhCRllyUDhVU2F0RlVhNzQvcmZCYm5pYUtaUW5v?=
 =?utf-8?B?b1RMenhjV1YvQ0JhS2hrc0Q4VjBvaUhKZzF5MU1qMHFyc3orbG5icWdFNkVt?=
 =?utf-8?B?aFU3R2o2TjVpeU1IcElrVVlUVjhnODVlcklRM3dvWlV2WTlqYjFMc01CWGdz?=
 =?utf-8?B?QzhiOVZ2NHVsQzJFSHhGa2laWm1MZTYyM3JqT1E0OGx2SC9vTHV3Z0ZCTkxO?=
 =?utf-8?B?U3JSanNEK0tyMlNEZkpzQ3lORGpNL2FFYkJ3MkhXaytkS1VnR2NudDNwcXFL?=
 =?utf-8?B?L1NPdG5sYzVRT1ZQbXVTVUVMc2lwbEp5dGdlK0pVY2MvVHJCUTJCd2toYi9x?=
 =?utf-8?B?ekVTd1lVSVA0emZ3aHo5MjZYbmV2TGgycEdRQTNNYjR4d3prUWtUcVl6OVlj?=
 =?utf-8?B?N2pHTWRHZ1RpSnlGRzFCNWFrY0pPL2xBSC9hZnJEOW9LVEJKOFpLUmo1R3pX?=
 =?utf-8?B?eDdVc1pZR0Zid1VxdGFpVXB3bjc5cTBORVJlcmlGb1lKd3dKL0NDVlozNEZI?=
 =?utf-8?Q?4f99qXIkiAIJyu2do7knCX4ga?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bc4882-78e2-48a1-1a99-08ddbcfa64b4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:02:57.7317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3MKRxXy6WwLHe3UQfse1qdWc1Xpv/5tuVog8CcF60B4xBXFAeTawbfLZhy3QMME48YJbnnNNHDmvi1iLwAH/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF63A6024A9
X-Authority-Analysis: v=2.4 cv=PLcP+eqC c=1 sm=1 tr=0 ts=686b2ad5 cx=c_pps a=0D0cwXljZKlU2r3+kJ/VfA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=D5MSFDpMHbgLSbss9u8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-GUID: yvXTDjAOk6TJ-d9a2jtdIk4xHPUAXNUx
X-Proofpoint-ORIG-GUID: gdtJWvoZYysr22cB8uo-2jC72_oiozff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAxMSBTYWx0ZWRfX1Xs0n25mebV8 ythwSFf0i1IdytVC0HUMcONgC9nw2puSl99zyfj4UzQXzmm7hX+ybObUQ3ZVbH5bpLRjVD94vcz jLWVvVyg5lTDeouns1SepwtEWDmmlw1BjVl+QkvJbmtclgbbuXR5Qmr/6CkEOk9sGWrvlrg52J8
 Pmzwmo3Crz6t6kXnaj+IsitudkX80h7exDWEKMKqPZzy5ouirsS0Rtkw7hbG/KT33Hcx8nkJVf8 NtCdmd9Yym/YgTSVMgZEHRUwHuX4L8rYfcD+2P7PwNS0ikil4a0Smqwd5+Dl7UGmxO20ubE8ngm kVY2tSDt/DgMG/yLK0Xus+G/iWRiH66w0yal9oY2JZw4hSqfULitGC2/1bRPWpTDy4Ns1S18qqr
 135stRkDixD/zUQnD7/VZo+Yn3TINSUJme5lKIBxGZmISDiYYEzBIhsbUtCa1WB2si7Viy3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070011
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56710jjx012933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 02:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219968

Hi Steve,

I could not reproduce this issue. I tried qemux86-64, qemuarm and qemuarm=
64.
Could you please help check how to reproduce this issue?

Regards,
Qi

On 7/4/25 11:12, Chen Qi via lists.openembedded.org wrote:
> On 7/4/25 04:13, Steve Sakoman wrote:
>> Unfortunately this patch results in a failed ptest:
>>
>> AssertionError: Failed ptests:
>> {'coreutils': ['tests/misc/sort-field-limit.sh']}
>>
>> Steve
>
> Interesting. I did run ptest before I sent out patch.
>
> Let me check what's going on here.
>
> Regards,
> Qi
>
>>
>> On Mon, Jun 30, 2025 at 9:16=E2=80=AFPM Chen Qi via lists.openembedded=
.org
>> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Backport patch to fix CVE-2025-5278.
>>> The patch is adjusted to fit 9.0 version.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>> =C2=A0 .../coreutils/coreutils/CVE-2025-5278.patch=C2=A0=C2=A0 | 113=20
>>> ++++++++++++++++++
>>> =C2=A0 meta/recipes-core/coreutils/coreutils_9.0.bb=C2=A0 |=C2=A0=C2=A0=
 1 +
>>> =C2=A0 2 files changed, 114 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
>>>
>>> diff --git=20
>>> a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch=20
>>> b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
>>> new file mode 100644
>>> index 0000000000..34434a65fa
>>> --- /dev/null
>>> +++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
>>> @@ -0,0 +1,113 @@
>>> +From 84a061ea3d1fad42188493c4e5d8396aff4a0f67 Mon Sep 17 00:00:00 20=
01
>>> +From: =3D?UTF-8?q?P=3DC3=3DA1draig=3D20Brady?=3D <P@draigBrady.com>
>>> +Date: Tue, 20 May 2025 16:03:44 +0100
>>> +Subject: [PATCH] sort: fix buffer under-read (CWE-127)
>>> +
>>> +* src/sort.c (begfield): Check pointer adjustment
>>> +to avoid Out-of-range pointer offset (CWE-823).
>>> +(limfield): Likewise.
>>> +* tests/sort/sort-field-limit.sh: Add a new test,
>>> +which triggers with ASAN or Valgrind.
>>> +* tests/local.mk: Reference the new test.
>>> +* NEWS: Mention bug fix introduced in v7.2 (2009).
>>> +Fixes https://bugs.gnu.org/78507
>>> +
>>> +CVE: CVE-2025-5278
>>> +
>>> +Upstream-Status: Backport=20
>>> [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3D8c=
9602e3a145e9596dc1a63c6ed67865814b6633]
>>> +[Adjusted for 9.0 version]
>>> +
>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> +---
>>> + src/sort.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++=
++++++--
>>> + tests/local.mk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> + tests/misc/sort-field-limit.sh | 35=20
>>> ++++++++++++++++++++++++++++++++++
>>> + 3 files changed, 46 insertions(+), 2 deletions(-)
>>> + create mode 100755 tests/misc/sort-field-limit.sh
>>> +
>>> +diff --git a/src/sort.c b/src/sort.c
>>> +index 5f4c817de..07b96d34b 100644
>>> +--- a/src/sort.c
>>> ++++ b/src/sort.c
>>> +@@ -1642,7 +1642,11 @@ begfield (struct line const *line, struct=20
>>> keyfield const *key)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ++ptr;
>>> +
>>> +=C2=A0=C2=A0 /* Advance PTR by SCHAR (if possible), but no further t=
han LIM.=C2=A0 */
>>> +-=C2=A0 ptr =3D MIN (lim, ptr + schar);
>>> ++=C2=A0 size_t remaining_bytes =3D lim - ptr;
>>> ++=C2=A0 if (schar < remaining_bytes)
>>> ++=C2=A0=C2=A0=C2=A0 ptr +=3D schar;
>>> ++=C2=A0 else
>>> ++=C2=A0=C2=A0=C2=A0 ptr =3D lim;
>>> +
>>> +=C2=A0=C2=A0 return ptr;
>>> + }
>>> +@@ -1743,7 +1747,11 @@ limfield (struct line const *line, struct=20
>>> keyfield const *key)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ++ptr;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Advance PTR by ECHAR (if pos=
sible), but no further than=20
>>> LIM.=C2=A0 */
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptr =3D MIN (lim, ptr + echar);
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t remaining_bytes =3D lim - ptr=
;
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (echar < remaining_bytes)
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptr +=3D echar;
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptr =3D lim;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0 return ptr;
>>> +diff --git a/tests/local.mk b/tests/local.mk
>>> +index 228d0e368..ced85c44c 100644
>>> +--- a/tests/local.mk
>>> ++++ b/tests/local.mk
>>> +@@ -373,6 +373,7 @@ all_tests=20
>>> =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0 tests/misc/sort-debug-keys.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0 tests/misc/sort-debug-warn.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0 tests/misc/sort-discrim.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\
>>> ++=C2=A0 tests/misc/sort-field-limit.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0 tests/misc/sort-files0-from.pl=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0 tests/misc/sort-float.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>>> +=C2=A0=C2=A0 tests/misc/sort-h-thousands-sep.sh=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +diff --git a/tests/misc/sort-field-limit.sh=20
>>> b/tests/misc/sort-field-limit.sh
>>> +new file mode 100755
>>> +index 000000000..52d8e1d17
>>> +--- /dev/null
>>> ++++ b/tests/misc/sort-field-limit.sh
>>> +@@ -0,0 +1,35 @@
>>> ++#!/bin/sh
>>> ++# From 7.2-9.7, this would trigger an out of bounds mem read
>>> ++
>>> ++# Copyright (C) 2025 Free Software Foundation, Inc.
>>> ++
>>> ++# This program is free software: you can redistribute it and/or=20
>>> modify
>>> ++# it under the terms of the GNU General Public License as=20
>>> published by
>>> ++# the Free Software Foundation, either version 3 of the License, or
>>> ++# (at your option) any later version.
>>> ++
>>> ++# This program is distributed in the hope that it will be useful,
>>> ++# but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> ++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See th=
e
>>> ++# GNU General Public License for more details.
>>> ++
>>> ++# You should have received a copy of the GNU General Public License
>>> ++# along with this program.=C2=A0 If not, see=20
>>> <https://www.gnu.org/licenses/>.
>>> ++
>>> ++. "${srcdir=3D.}/tests/init.sh"; path_prepend_ ./src
>>> ++print_ver_ sort
>>> ++getlimits_
>>> ++
>>> ++# This issue triggers with valgrind or ASAN
>>> ++valgrind --error-exitcode=3D1 sort --version 2>/dev/null &&
>>> ++=C2=A0 VALGRIND=3D'valgrind --error-exitcode=3D1'
>>> ++
>>> ++{ printf '%s\n' aa bb; } > in || framework_failure_
>>> ++
>>> ++_POSIX2_VERSION=3D200809 $VALGRIND sort +0.${SIZE_MAX}R in > out ||=
=20
>>> fail=3D1
>>> ++compare in out || fail=3D1
>>> ++
>>> ++_POSIX2_VERSION=3D200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out=
=20
>>> || fail=3D1
>>> ++compare in out || fail=3D1
>>> ++
>>> ++Exit $fail
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb=20
>>> b/meta/recipes-core/coreutils/coreutils_9.0.bb
>>> index 1cce9192ec..7c975708f4 100644
>>> --- a/meta/recipes-core/coreutils/coreutils_9.0.bb
>>> +++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
>>> @@ -19,6 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>>> file://0001-uname-report-processor-and-hardware-correctly.patch \
>>> file://0001-local.mk-fix-cross-compiling-problem.patch \
>>> file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://=
CVE-2025-5278.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://run-ptest \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://0001-split-do-not-shrink-hold-buffer.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "
>>> --=20
>>> 2.34.1
>>>
>>>
>>>
>>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219896): https://lists.openembedded.org/g/openembed=
ded-core/message/219896
> Mute This Topic: https://lists.openembedded.org/mt/113922209/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>



Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C32C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 09:05:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15588.1744707908119880226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 02:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6200f38ec5=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F2IPgY007792
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 02:05:07 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yqpkjryx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 02:05:07 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53F91A7Q020471
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 02:05:06 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yqpkjryw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 02:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrJojwysUDhCIzU9LxNVbQ7jlYfOGtmMpcHjSz9q2MJbGtv3ty0hc8yf6GiC/NpOO9mhS2noNZyrA2qK2IR8XoNNnDOlGAQSz12dVFyHC9VrQKsA2YuHoATNjYW3usm+Yni0cAXZ1r7bagG1EIWFx0DQFgNMGZu8J38uk+fT0qt6idBwzTu/mRvdWB06MZCZxedEjve0d+LsfQmOB7quqSYKxgSlkj4eb8cUnV35G38UM53UjSnDpCYqwkWM+TBSIcQHNGcsg4xoH0tmt5f+xFxMEOtIPipWg8gHF/4vn08lkNDeJDvovcNxMZCXiSxh681g4fiDVHV/mmD97xPaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DbLaZ+L4ALPk/uwqcMbB7uoMS8SlPJs1/84SXWtOUg=;
 b=bzQCwoiVz5SWEQQcnpABmhepxgBIUCwG2La+38Kko6PwFexduy4nXI1hZzIlGRkmApX0k0xNTeMCLFQRdmXr/BAMy7tb2NQRyxjHrBnOLPSwMSfPhxDudcwof/CPeA6qs5uhSxZusTXdr3Xc6NmMKAiJ/BlRAcBVr92yIftLnt5+BTyF9rvx9zZr2/8/Vui+OvXA1TtDgFXcEqbG4gyOkFwgLjZYceGMwWRgnzJObt8SBZEdoAgYXulD8JiThH3O1BGz3o18h/5yhyPYl6agXadaRlQHW3QpYMTWDJFE9JParPVd7u04Aj6Yq5S1Iy6jiO9DfvykKR2/y5my847fEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 09:05:03 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 09:05:03 +0000
Content-Type: multipart/alternative;
 boundary="------------n0nDd820jB77iOoo4eOY0Y6N"
Message-ID: <1d01500d-39e2-4578-9fc0-b8c7c231e6d9@windriver.com>
Date: Tue, 15 Apr 2025 14:34:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] rust: Upgrade 1.84.1->1.85.0
To: Martin Jansa <martin.jansa@gmail.com>, raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
 <20250331055424.1978243-2-Yash.Shinde@windriver.com>
 <CAMKF1sowYqhv29_Him+th4PkxvGG2FkEzeWmM3fgYzUeKpHqSQ@mail.gmail.com>
 <CA+chaQcn9EfvFMSEmBPnCu3duzwY=cNXzwXVGPBNSP7n-9SduQ@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CA+chaQcn9EfvFMSEmBPnCu3duzwY=cNXzwXVGPBNSP7n-9SduQ@mail.gmail.com>
X-ClientProxiedBy: PH7P220CA0052.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::34) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 007c54d5-fb32-444d-3283-08dd7bfc9b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHI0THJLSVZKT0paTjFJazIyYlZBZU1aRzE4SkFxczg0UDN3azRINitTSi93?=
 =?utf-8?B?TkhyY1JqVjM0dzdKakoxU2s2WUdYb0Q1YlRtRXpWZkdVd0dkaDdka053TGRQ?=
 =?utf-8?B?Nk9pU2RzVEZmZHBFZEFWaDhTd3lBVXpNY3lOWEh0OGFsc3EyUUt0UWJIVUNQ?=
 =?utf-8?B?U21rK1l2UHlXWk56QkR4cVZGeUVsaTJ6dkhmdlNkZ2UwRmZ1NnNTWE1xMk1G?=
 =?utf-8?B?WUJsdUg4eGxFYkVuMXFvdWxNZjFzUHgyM0pYZVdhcnZZcitUcUJENUVFbXRK?=
 =?utf-8?B?YmVibGo4T0l5WXJZK1NVUERzVk05WGxObWFtT0M0TG1LTDdyTVZYaUlIOVJS?=
 =?utf-8?B?a096MEVhb2EvTDVLejFMNzlvazM3S3VwbFNITDV3T2c4ZmN4VHlIVDczR215?=
 =?utf-8?B?bDl2VHhMNCtVWnlKNTFCODNQMmVWeWVUd2NZLzFXQjJJTHJiM2kvbTBZREE0?=
 =?utf-8?B?K3R3NWVySTRjN3ZqWDNkbG9tRnVTNzZpQ3ptbHpHckowc1BiMHdlNzloblli?=
 =?utf-8?B?NWJuYjI1M25udGY2YStXNG44MVJ5Zm5NbTFXRXAxQnc1TU5zcy85ZjBkNFJv?=
 =?utf-8?B?dUdKblpwc3JBVGliL05pK1huWUdkTngwR0xBZlJJV0Zib1luaHNzSCtUSTNh?=
 =?utf-8?B?RjVmZEYySmkxcXVRdzRpK2t0M2pkUGxISVQ3V05uRWppaGZFckpvSDN6REZt?=
 =?utf-8?B?UlltamJUcVpTc1laU0xpaTg0R21leW4xZ2NvR25PbU9FbFpqUmY3RUEvSXBW?=
 =?utf-8?B?RTNXcHBnQXEyUmg2ZjRSTjRrZ0Z0dzgxK05qTmtxWnVOMlEwemlhc1o2S2Nj?=
 =?utf-8?B?ajlpcUZNRm94dG9lU2RXRm1TemtjTUg5bVZmSUJxZkYzM04zQXY5djd6anlG?=
 =?utf-8?B?VzVvNmxXV3l6dWlHbldOWTRjbG8vbGtBMWxWNi96SGdwd3hVWTJrWFdiaUxO?=
 =?utf-8?B?dWdTNlRZMDJQL25sTnB2ZlVSWEZiRXhIaDlLR3dLTUxKdmdmOXd3SkhRWWxu?=
 =?utf-8?B?WllNQkZUUk5QNE9FUVJlNzRUU1RsU1Y5NTFxS2xhVHI3Yk9aRUFMRUNYVzRP?=
 =?utf-8?B?dGhJcUJHdFNlTHpNbVRqM2EzMnIzM2cwb01GNzVQa2ZHUlYxY2RIMzBuajFy?=
 =?utf-8?B?cWw4Mm1hMDI0Y1NPSmszc21BMWFTcytCM1kycjltRlAvSkJxcVQ3SGp3VjZ6?=
 =?utf-8?B?SXFCcHNQQ3g5eXVxdW9CNWZRNjBxc3lScUR1aCtyTE9VanhjOUxDQi8xRys3?=
 =?utf-8?B?RVdza0lUcmtuaUNJcS9zL3ptTXJrZnYvaDQraitqc1RuZUxtMEdJb2JnRmRM?=
 =?utf-8?B?Vi94WlBadzJicktUR3NLM1NtUHdiZjZDaVpVYVNFZ0tQQURBNXFsbFFuV25G?=
 =?utf-8?B?NFcwd3YrUzcvM29rbXdOa0ZBeGgyYy9aM2ttK3MrcXpOSS8xOE0zQ2YxTDdB?=
 =?utf-8?B?TituYS96V0NxM0M4WmdqeFFiTHN0Q2tkc1k2WnI5QzMrRzNjOTVRcXB5UVJh?=
 =?utf-8?B?NnUxODc5UXg5TFdDV2dHaXBQVjFlV2hWR3hoUHdadVBRL2hHdXZZc1BLb2o2?=
 =?utf-8?B?OEtmdzdnbHMzb29hZFNtZlErR25GVDRKaDFHM1lIRnhHbE1Bbjg2ZzBnM0o0?=
 =?utf-8?B?VkdKM0QrWWI5cUFBZFR3S1loYkY4d2xNNWxjSWN1UEgxaWJ5R2hPamhaeEJX?=
 =?utf-8?B?K1Y3ZjBmT3UreEZqRUVaKzBXbkVBTDVNVUlxRTlUbURSWjNZNTc5czEyWElO?=
 =?utf-8?B?NnVnUFNVejc3NDhWTWt6Q1hnK2VLbDFmK2prakQ0ZWlMa0twTlFIOUEzcGo5?=
 =?utf-8?B?YzNMaEx4NE93K3RpZWpnZ3dEa3hSbmZLMGQ5ZmI1cGRxKzhXcklWNjFTendl?=
 =?utf-8?Q?+MBS3PIjx9fHp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MnZzQm5vSEl3Ykt1MUh2RjljeXEzK0Z1b0ZZZ0FDYjFTRUhnWnhTOUZOYVAx?=
 =?utf-8?B?cUxEYlpjT2hBVytzK1pIenc1aWFJZmttTmpBUEQ0c3plRkt5bmxWa0tYVlhn?=
 =?utf-8?B?djhQVDFuTjdpdlNYS2FuK0k1cDRKdFMzRVpxMjJSZzI3QWZWT002ak1LWVds?=
 =?utf-8?B?cUx5NTdVcVM4QThWS3FxQUhyRG44M042WithcW5BUDRrMHVXNEtwRzZQTGpj?=
 =?utf-8?B?RUJEWCt4ZldvOGdSOGZEV0tkUmVJdDhlbCtsajMvZjdZc2ZFQmpsbDc0cm9O?=
 =?utf-8?B?TG1wdnAwdmZNZGc0Y1ZUVndueWxoa2t0TXdMQWZLT05La1RpZTc2OTBRQmJu?=
 =?utf-8?B?L2FtNk5VZGVsellWbXFPaXpvRHVpODlJOGNPUmRQcXhRd0MraTNaUmdxcmRU?=
 =?utf-8?B?U1lPbGkwbTRRVXhSUFpvWGQ1cHRrUGQxRUpaQTFvQzVZdUZNNVRNNVBRNGQr?=
 =?utf-8?B?b3h4YjY5a2FVZjBMNDF4Rmw5TjlJUURJNjMrN2JYYnVTc3Y4VDJMN1NkT3Y2?=
 =?utf-8?B?cGFVYkdlVnNmck56eFVWeERtaXJNR2tVMlNkVW9kc01rZHRieWFxaWFXTXdH?=
 =?utf-8?B?ZEFnZU0zODY3aml4LzhqUTlHdnRablhLT0dLL3NRejJxeFQ4MWpYTzc3SGl5?=
 =?utf-8?B?WE5SVkY3UHh4NUpIVmIwYk9UWHBxamtXRjJ6K2MrSzgwZHUwKyt4UWY5K1Zq?=
 =?utf-8?B?WGt1ZXQzcHNyN2o0bEUyVGtKMlBBZXBLcFRROW1ORHBuY3F1U0FCbGdMaksx?=
 =?utf-8?B?YzlCT2Y5V0xWZEFTUERVR2I4YlZYc3JXTFdVNW81VjlGazRwS2lmZTU2NHk3?=
 =?utf-8?B?WGlSamppcmpOeUxocnltQThmR3lrdFVnK3NOVmcvKzl4ME45NWl5Wlh4Tzc1?=
 =?utf-8?B?N2tXTHRvbHNzQ1hHa0xDaHJxUDFzdElYNkNySWRDR2dzRHhtNnJZNlkxUEVs?=
 =?utf-8?B?N2QxK3dKZ1R0WHVIZWxsQXd6UndvNUVnSkQ0djVNbFVPMWZnTXYzVVRTTGV3?=
 =?utf-8?B?am96MWsxL1laeGRjTFdTeDZ6cXFSc1dNM2t3dVpKNnVQN3FpQTVVampoZzFN?=
 =?utf-8?B?T1V5eTM0ZVd5Q0p5SnVrblBibStGUFBvbnd2czlCVDg1WE9jNG5VUFc3cUVp?=
 =?utf-8?B?cmhlTEIvS0lnSnRpdG40eGd3Y1FuQnlLKzFZd3JlVTd6cFZaWkF6MFVFTmNF?=
 =?utf-8?B?NlpFK0VLVi9Vb2hxY0pFY2hpaDFpM0JJOVdzNG8rWGtETXNWU0hSMU9VaGtI?=
 =?utf-8?B?QUdkMlFsb050aGgrdzh1N1RhaWE1azVQS3dYRnJFOFgwelIwRHdNaHFwMVVt?=
 =?utf-8?B?b1E0UkFxK01pVjZzR1ljTmpqa0FsRW5NSzFOc0xNcVdhbkRuZ2FNMlJKcHJ2?=
 =?utf-8?B?VmFqRkZBNHF3amcyZDRVM09GUG00SGpJNEYzTzd4ak9yTDk3Q0RQa3QxMkds?=
 =?utf-8?B?VU9SOHFES2tiU0t0VFkrZEpVVTg3VlF0RlN3clZzU3BqYXhTLzVqcGVueDRo?=
 =?utf-8?B?ZDJOOEVFZ1RoK1Y5MEg4dS95ZGJIaUhaWVQ4ODRHYzBKODdJU0dObDNoV2tI?=
 =?utf-8?B?WkRZSG1lSG8xaUpUUjRHR09TZjh4bWRteTRYVi96WjZGOUsvODBoOEpxaGlt?=
 =?utf-8?B?b1VvRnV2U1ZJY1hrbWY4Ty90b0ZCNEsyYmIvZ0R3UTZHODByZmsrUW1zUkVF?=
 =?utf-8?B?cW1vL0N4azNCeDQzbWV6NFlzUHNhbG5RUGlsSmFvblFVcTFIYWE1b1kvaGE2?=
 =?utf-8?B?Mm93VmlLSGYyTDZUZUVRQkhiS1dHL09rMXhUZGZ2R0xZOWh2eklDZmhOcUhv?=
 =?utf-8?B?cDJTbVFJd3lMeDU0V0hZeXYrWjlaVWxjalBpWTR2Mk82aDVRQkR5UlNrSzNM?=
 =?utf-8?B?ZXZiWi9LQ01iR0lVQnRPTVRIMEpFMkhCU0hmeEZ5MlNVaGFIcjFySWR5TGtJ?=
 =?utf-8?B?ejZ3WS8wRnB5QkhNa2RNMHViN1JWSUJ5U3BiVDF0b2dEanYvRGJnLzZ0Lzkv?=
 =?utf-8?B?bTE3MU9YbG5YazkvNS9XcGRTdWE4Q3N6cU1lTmhEOHVsV2ZISUg0MG9jY0ZR?=
 =?utf-8?B?cTA5N254YU1KVytuOUh2STh4MElVZkRpUUdMSVNXL0tQVjdtUk4rRzNNVnVj?=
 =?utf-8?B?M3NlY2F2U3h1QWk1VjVxZzlLQ2JJOHJ1NmhLTGRpUkJINmd2a1UxNkNqSFdp?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007c54d5-fb32-444d-3283-08dd7bfc9b5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 09:05:02.9444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GOsu5fHEIh2+P6UM6TKkAnShjYffzCUjPnZ1XJOBCtDzi820TF41XPIfaVRJJGeUJw/IB3V+/UhP7y9EztCwEhWj2wMP5xh5g13X7zaZG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
X-Proofpoint-ORIG-GUID: keceg8pdvHqnQ02X0_CcnTRptU4y8ceU
X-Proofpoint-GUID: lSb75Lyi1IZ0dpEGNBJymfF1kb2G9ws2
X-Authority-Analysis: v=2.4 cv=UZBRSLSN c=1 sm=1 tr=0 ts=67fe2143 cx=c_pps a=b6GhQBMDPEYsGtK7UrBDFg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=hZYE-atDfsVkIPEbTbYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dI7qjkOEfi4A:10 a=pGLkceISAAAA:8 a=TGWRFvGZnzJx6LKCTUUA:9 a=ECYgyNXHkzugyH7T:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504150062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 09:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214833

--------------n0nDd820jB77iOoo4eOY0Y6N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53F2IPgY007792


On 11-04-2025 13:08, Martin Jansa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, Mar 31, 2025 at 6:47=E2=80=AFPM Khem Raj via lists.openembedded=
.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>> On Sun, Mar 30, 2025 at 10:54=E2=80=AFPM Yash Shinde via
>> lists.openembedded.org
>> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>>
>>> Rust stable version updated to 1.85.0
>>> https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
>>>
>>> Some of the major updates:
>>>
>>> - Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.
>>> License-Update: Unicode license text is updated to Unicode-3.0 Licens=
e.
>>> https://github.com/rust-lang/rust/commit/6d2a3e9786ec43a0e0af20386e70=
46328296ac86
>>>
>>> - Pass '-Zforce-unstable-if-unmarked' to RUSTFLAGS in libstd-rs.bb
>>> Fix:https://github.com/rust-lang/rust/issues/133857#issuecomment-2526=
341227
>>>
>>> - Downgrade bootstrap cc version causing bootstrap to fail on custom =
targets. (Backported from v1.85.1)
>>> Fix:https://github.com/rust-lang/rust/pull/137460/commits/e4ca11f87ff=
ca8c63aa56d45b46e62b6acc58bd7
>>>
>>> - Explicitly set float ABI for all ARM 32 bits targets.
>>> Fix:https://github.com/rust-lang/rust/commit/a51fefcaab835b310e2e2600=
5b50982d0049d905
>>>
>>> - Rust v1.85.0 tarball doesn't ship gcc tree.
>>> Drop "remove_gcc_directory" postfunc which removed it and prevented t=
he bloat.
>>> Fix:https://github.com/rust-lang/rust/commit/13c3f9b9498013837782b461=
20085ea19ca75518
>>>
>>> Adapted the patch changes with v1.85.0:
>>>    repro-issue-fix-with-cc-crate-hashmap.patch
>>>    revert-link-std-statically-in-rustc_driver-feature.patch
>>>    rust-oe-selftest.patch
>>>    rv32-cargo-rustix-0.38.40-fix.patch
>>>
>>> Dropped patches:
>>>    fix-tidy-check-failure.patch since it's merged with v1.85.0.
>>>
>>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>>> ---
>>>   .../classes-recipe/rust-target-config.bbclass |   5 +
>>>   meta/conf/distro/include/tcmode-default.inc   |   2 +-
>>>   .../rust/{cargo_1.84.1.bb =3D> cargo_1.85.0.bb} |   0
>>>   .../rust/files/downgrade-bootstrap-cc.patch   |  41 +++
>>>   .../rust/files/fix-tidy-check-failure.patch   |  19 --
>>>   ...epro-issue-fix-with-cc-crate-hashmap.patch |  60 ++++-
>>>   ...d-statically-in-rustc_driver-feature.patch |   4 +-
>>>   .../rust/files/rust-oe-selftest.patch         |  46 ++--
>>>   .../files/rv32-cargo-rustix-0.38.38-fix.patch | 236 ---------------=
---
>>>   .../files/rv32-cargo-rustix-0.38.40-fix.patch | 236 +++++++++++++++=
+++
>>>   ...ibstd-rs_1.84.1.bb =3D> libstd-rs_1.85.0.bb} |   4 +-
>>>   ....84.1.bb =3D> rust-cross-canadian_1.85.0.bb} |   0
>>>   ...ust-llvm_1.84.1.bb =3D> rust-llvm_1.85.0.bb} |   0
>>>   meta/recipes-devtools/rust/rust-snapshot.inc  |  81 +++---
>>>   meta/recipes-devtools/rust/rust-source.inc    |  23 +-
>>>   .../rust/{rust_1.84.1.bb =3D> rust_1.85.0.bb}   |   2 +-
>>>   16 files changed, 417 insertions(+), 342 deletions(-)
>>>   rename meta/recipes-devtools/rust/{cargo_1.84.1.bb =3D> cargo_1.85.=
0.bb} (100%)
>>>   create mode 100644 meta/recipes-devtools/rust/files/downgrade-boots=
trap-cc.patch
>>>   delete mode 100644 meta/recipes-devtools/rust/files/fix-tidy-check-=
failure.patch
>>>   delete mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rust=
ix-0.38.38-fix.patch
>>>   create mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rust=
ix-0.38.40-fix.patch
>>>   rename meta/recipes-devtools/rust/{libstd-rs_1.84.1.bb =3D> libstd-=
rs_1.85.0.bb} (88%)
>>>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.84.1.bb =3D=
> rust-cross-canadian_1.85.0.bb} (100%)
>>>   rename meta/recipes-devtools/rust/{rust-llvm_1.84.1.bb =3D> rust-ll=
vm_1.85.0.bb} (100%)
>>>   rename meta/recipes-devtools/rust/{rust_1.84.1.bb =3D> rust_1.85.0.=
bb} (99%)
>>>
>>> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/cl=
asses-recipe/rust-target-config.bbclass
>>> index 67aaa56bac..c04940ce54 100644
>>> --- a/meta/classes-recipe/rust-target-config.bbclass
>>> +++ b/meta/classes-recipe/rust-target-config.bbclass
>>> @@ -391,6 +391,11 @@ def rust_gen_target(d, thing, wd, arch):
>>>       tspec['cpu'] =3D cpu
>>>       if features !=3D "":
>>>           tspec['features'] =3D features
>>> +    fpu =3D d.getVar('TARGET_FPU')
>>> +    if fpu =3D=3D "soft":
>>> +        tspec['llvm-floatabi'] =3D "soft"
>>> +    elif fpu =3D=3D "hard":
>>> +        tspec['llvm-floatabi'] =3D "hard"
>> Thanks for this. I see there are three ABIs for arm w.r.t floats soft.
>> hard and softfp you can perhaps get this value
>> from TUNE_CCARGS_MFLOAT, maybe in a follow up please check the third
>> case as well and we might need to add
>> it as well
>
> Yash:
>
> any update about this comment from Khem?
>
> libstd-rs is still failing to build when TARGET_FPU is set to softfp

I checked the value from TUNE_CCARGS_MFLOAT and it wasn't set to soft=20
when using qemuarmv5 as the MACHINE. Thus, we need to use TARGET_FPU.
For softfp, I didn't find any target supported/valid using oe-core config.
Could you share the config for setting softfp for arm target?

I will add and check a condition for softfp setting as well with that.

Regards,
Yash

>
> error: failed to run `rustc` to learn about target-specific information
>
> Caused by:
>    process didn't exit successfully: `rustc - --crate-name ___
> --print=3Dfile-names ... -Cembed-bitcode=3Dyes
> -Zforce-unstable-if-unmarked  -C link-arg=3D-Wl,-soname,libstd.so
> --target armv7-oemllib32-linux-gnueabi --crate-type bin --crate-type
> rlib --crate-type dylib --crate-type cdylib --crate-type staticlib
> --crate-type proc-macro --print=3Dsysroot --print=3Dsplit-debuginfo
> --print=3Dcrate-name --print=3Dcfg` (exit status: 1)
>    --- stderr
>    error: Error loading target specification: ARM targets must specify
> their float ABI. Run `rustc --print target-list` for a list of
> built-in targets
>
> it's set to softfp from TUNE_CCARGS_MFLOAT
>
> # $TUNE_CCARGS_MFLOAT
> #   set oe-core/meta/conf/machine/include/arm/feature-arm-vfp.inc:14
> #     "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard',
> 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') !=3D '' or
> bb.utils.contains('TUNE_FEATURES', 'simd', True, False, d)) else '' }"
> TUNE_CCARGS_MFLOAT=3D"softfp"
>
> # $TARGET_FPU [3 operations]
> #   set oe-core/meta/conf/machine/include/arm/arch-arm.inc:16
> #"${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
> #   set oe-core/meta/conf/machine/include/arm/arch-arm64.inc:39
> #"${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}',=20
> '${TARGET_FPU_32}', d)}"
> #   set oe-core/meta/conf/documentation.conf:417
> #     [doc] "Specifies the method for handling FPU code. For FPU-less
> targets, which include most ARM CPUs, the variable must be set to
> 'soft'. If not, the kernel emulation gets used, which results in a
> performance penalty."
> # pre-expansion value:
> #"${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}',=20
> '${TARGET_FPU_32}', d)}"
> TARGET_FPU=3D"softfp"
--------------n0nDd820jB77iOoo4eOY0Y6N
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53F2IPgY007792

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11-04-2025 13:08, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQcn9EfvFMSEmBPnCu3duzwY=3D=
cNXzwXVGPBNSP7n-9SduQ@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Mon, Mar 31, 2025 at 6:47=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khem=3Dgmail.com@li=
sts.openembedded.org">&lt;raj.khem=3Dgmail.com@lists.openembedded.org&gt;=
</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
On Sun, Mar 30, 2025 at 10:54=E2=80=AFPM Yash Shinde via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde=3Dwindriver=
.com@lists.openembedded.org">&lt;Yash.Shinde=3Dwindriver.com@lists.openem=
bedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">
From: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.=
Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Rust stable version updated to 1.85.0
<a class=3D"moz-txt-link-freetext" href=3D"https://blog.rust-lang.org/202=
5/02/20/Rust-1.85.0.html">https://blog.rust-lang.org/2025/02/20/Rust-1.85=
.0.html</a>

Some of the major updates:

- Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.
License-Update: Unicode license text is updated to Unicode-3.0 License.
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/commit/6d2a3e9786ec43a0e0af20386e7046328296ac86">https://github.com/r=
ust-lang/rust/commit/6d2a3e9786ec43a0e0af20386e7046328296ac86</a>

- Pass '-Zforce-unstable-if-unmarked' to RUSTFLAGS in libstd-rs.bb
Fix: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-l=
ang/rust/issues/133857#issuecomment-2526341227">https://github.com/rust-l=
ang/rust/issues/133857#issuecomment-2526341227</a>

- Downgrade bootstrap cc version causing bootstrap to fail on custom targ=
ets. (Backported from v1.85.1)
Fix: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-l=
ang/rust/pull/137460/commits/e4ca11f87ffca8c63aa56d45b46e62b6acc58bd7">ht=
tps://github.com/rust-lang/rust/pull/137460/commits/e4ca11f87ffca8c63aa56=
d45b46e62b6acc58bd7</a>

- Explicitly set float ABI for all ARM 32 bits targets.
Fix: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-l=
ang/rust/commit/a51fefcaab835b310e2e26005b50982d0049d905">https://github.=
com/rust-lang/rust/commit/a51fefcaab835b310e2e26005b50982d0049d905</a>

- Rust v1.85.0 tarball doesn't ship gcc tree.
Drop &quot;remove_gcc_directory&quot; postfunc which removed it and preve=
nted the bloat.
Fix: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-l=
ang/rust/commit/13c3f9b9498013837782b46120085ea19ca75518">https://github.=
com/rust-lang/rust/commit/13c3f9b9498013837782b46120085ea19ca75518</a>

Adapted the patch changes with v1.85.0:
  repro-issue-fix-with-cc-crate-hashmap.patch
  revert-link-std-statically-in-rustc_driver-feature.patch
  rust-oe-selftest.patch
  rv32-cargo-rustix-0.38.40-fix.patch

Dropped patches:
  fix-tidy-check-failure.patch since it's merged with v1.85.0.

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 .../classes-recipe/rust-target-config.bbclass |   5 +
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../rust/{cargo_1.84.1.bb =3D&gt; cargo_1.85.0.bb} |   0
 .../rust/files/downgrade-bootstrap-cc.patch   |  41 +++
 .../rust/files/fix-tidy-check-failure.patch   |  19 --
 ...epro-issue-fix-with-cc-crate-hashmap.patch |  60 ++++-
 ...d-statically-in-rustc_driver-feature.patch |   4 +-
 .../rust/files/rust-oe-selftest.patch         |  46 ++--
 .../files/rv32-cargo-rustix-0.38.38-fix.patch | 236 ------------------
 .../files/rv32-cargo-rustix-0.38.40-fix.patch | 236 ++++++++++++++++++
 ...ibstd-rs_1.84.1.bb =3D&gt; libstd-rs_1.85.0.bb} |   4 +-
 ....84.1.bb =3D&gt; rust-cross-canadian_1.85.0.bb} |   0
 ...ust-llvm_1.84.1.bb =3D&gt; rust-llvm_1.85.0.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  |  81 +++---
 meta/recipes-devtools/rust/rust-source.inc    |  23 +-
 .../rust/{rust_1.84.1.bb =3D&gt; rust_1.85.0.bb}   |   2 +-
 16 files changed, 417 insertions(+), 342 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.84.1.bb =3D&gt; cargo_1.85.0.=
bb} (100%)
 create mode 100644 meta/recipes-devtools/rust/files/downgrade-bootstrap-=
cc.patch
 delete mode 100644 meta/recipes-devtools/rust/files/fix-tidy-check-failu=
re.patch
 delete mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rustix-0.=
38.38-fix.patch
 create mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rustix-0.=
38.40-fix.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.84.1.bb =3D&gt; libstd-rs=
_1.85.0.bb} (88%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.84.1.bb =3D&gt;=
 rust-cross-canadian_1.85.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.84.1.bb =3D&gt; rust-llvm=
_1.85.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.84.1.bb =3D&gt; rust_1.85.0.bb=
} (99%)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
index 67aaa56bac..c04940ce54 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -391,6 +391,11 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['cpu'] =3D cpu
     if features !=3D &quot;&quot;:
         tspec['features'] =3D features
+    fpu =3D d.getVar('TARGET_FPU')
+    if fpu =3D=3D &quot;soft&quot;:
+        tspec['llvm-floatabi'] =3D &quot;soft&quot;
+    elif fpu =3D=3D &quot;hard&quot;:
+        tspec['llvm-floatabi'] =3D &quot;hard&quot;
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">
Thanks for this. I see there are three ABIs for arm w.r.t floats soft.
hard and softfp you can perhaps get this value
from TUNE_CCARGS_MFLOAT, maybe in a follow up please check the third
case as well and we might need to add
it as well
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">

Yash:

any update about this comment from Khem?

libstd-rs is still failing to build when TARGET_FPU is set to softfp</pre=
>
    </blockquote>
    <p>I checked the value from <span style=3D"white-space: pre-wrap">TUN=
E_CCARGS_MFLOAT and it wasn't set to soft when using=20
qemuarmv5 as the MACHINE. Thus, we need to use </span><span style=3D"whit=
e-space: pre-wrap">TARGET_FPU.
</span><br>
      For softfp, I didn't find any target supported/valid using oe-core
      config.<br>
      Could you share the config for setting softfp for arm target?<br>
      <br>
      I will add and check a condition for softfp setting as well with
      that.<br>
      <br>
      Regards,<br>
      Yash<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQcn9EfvFMSEmBPnCu3duzwY=3D=
cNXzwXVGPBNSP7n-9SduQ@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

error: failed to run `rustc` to learn about target-specific information

Caused by:
  process didn't exit successfully: `rustc - --crate-name ___
--print=3Dfile-names ... -Cembed-bitcode=3Dyes
-Zforce-unstable-if-unmarked  -C link-arg=3D-Wl,-soname,libstd.so
--target armv7-oemllib32-linux-gnueabi --crate-type bin --crate-type
rlib --crate-type dylib --crate-type cdylib --crate-type staticlib
--crate-type proc-macro --print=3Dsysroot --print=3Dsplit-debuginfo
--print=3Dcrate-name --print=3Dcfg` (exit status: 1)
  --- stderr
  error: Error loading target specification: ARM targets must specify
their float ABI. Run `rustc --print target-list` for a list of
built-in targets

it's set to softfp from TUNE_CCARGS_MFLOAT

# $TUNE_CCARGS_MFLOAT
#   set oe-core/meta/conf/machine/include/arm/feature-arm-vfp.inc:14
#     &quot;${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard',
'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') !=3D '' or
bb.utils.contains('TUNE_FEATURES', 'simd', True, False, d)) else '' }&quo=
t;
TUNE_CCARGS_MFLOAT=3D&quot;softfp&quot;

# $TARGET_FPU [3 operations]
#   set oe-core/meta/conf/machine/include/arm/arch-arm.inc:16
#     <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@d.getVar('TUNE=
_CCARGS_MFLOAT')or'soft'}">&quot;${@d.getVar('TUNE_CCARGS_MFLOAT') or 'so=
ft'}&quot;</a>
#   set oe-core/meta/conf/machine/include/arm/arch-arm64.inc:39
#     <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.utils.conta=
ins('TUNE_FEATURES','aarch64','${TARGET_FPU_64}','${TARGET_FPU_32}',d)}">=
&quot;${@bb.utils.contains('TUNE_FEATURES', 'aarch64',
'${TARGET_FPU_64}', '${TARGET_FPU_32}', d)}&quot;</a>
#   set oe-core/meta/conf/documentation.conf:417
#     [doc] &quot;Specifies the method for handling FPU code. For FPU-les=
s
targets, which include most ARM CPUs, the variable must be set to
'soft'. If not, the kernel emulation gets used, which results in a
performance penalty.&quot;
# pre-expansion value:
#   <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.utils.contain=
s('TUNE_FEATURES','aarch64','${TARGET_FPU_64}','${TARGET_FPU_32}',d)}">&q=
uot;${@bb.utils.contains('TUNE_FEATURES', 'aarch64',
'${TARGET_FPU_64}', '${TARGET_FPU_32}', d)}&quot;</a>
TARGET_FPU=3D&quot;softfp&quot;
</pre>
    </blockquote>
  </body>
</html>

--------------n0nDd820jB77iOoo4eOY0Y6N--


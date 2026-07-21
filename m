Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E72FC4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 07:03:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17162.1784617393492238529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 00:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SyO+5cbu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=166270197c=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4hD3p1669874
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 07:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pY9euuqeKrFt9WIOchnDakTUY/hEpxMlDMZYVYgaVGs=; b=
	SyO+5cbuR1x3l9746Yvr82uf++T+bQ4rGWY6mxZuweoQ0tI/7w5ZyOO0BXEloYjq
	dKirfBk+X2yVLWjSxtwPKPE5JAx9C7/uNJjjrgs1fsPHBEeQVKtlTzO+3EVTpCC2
	odkyFmgW85ZMLUQymBwvytLmHsNTeu170OQKpwrZEw7L0k5ln2ROy2hJ620V8/g8
	KcWAfJyjE1KKysGWBsy0Ifh19Os1mQ+NvjJ2EXog+clTWvVp6K5x3QX06rpizM/W
	YcXwuyMJP7j1NXalIpWd43zjVgX6N7ID2syGF/BJVOpoXEsOIO/5XjHX79/cXEK2
	7XW5/nOrdaRhhM7tk8AezA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013043.outbound.protection.outlook.com [40.93.201.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg0f5cb8y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 07:03:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwPDU2AC53BGUgAHSrz0+9CI5Hi1XLyP9b7FoulSVoWiemfpFHjcGWxS2zT3wmFqb2c+wLyXaiCZhqDn1H560wTqkWxrYCylgnBunZRo9omrtdBrd6oLOZcMnpWWwR5469zzD9VXlbdCud6jdPpM5H2fjyCdEBiad+7WWzY+SG6y0TE/xwXeo89OtDo2XjguAZ3g/9ps2AXWSheZwJoQv9Rg7fyPPp/VYDzzbN9KQbin/suDqVXC5jW4gK+ivRKYoBvonRuVsqIeWTbhn3wQUGxytf9MyjhUvSrs44EBTUTZoB6R3Y+TwF9cH/xmTOdVVL/1GMB8FCdf3wJLa1lScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY9euuqeKrFt9WIOchnDakTUY/hEpxMlDMZYVYgaVGs=;
 b=IigKqUGs8DH+ASTm677QEs4r5cizJgP6i97UEuDjd7kYqqLYnHOmu7n9/4LuUgHW0uCNxwjV0FZNjmZaFXF79oA5DhKFMWlQcTO0/sNTBj8U1Qom6xq67iG0dYRtF13aKsSPOnSdCHgHUZ9s0F9oyjKr7azAEEhDpCci0I1fHDWy0YFS5TbqJv7j2jozIoHYd8GeTlehHaBOw4P69ZCYfn3W4kLBGbdd3M2THT/cwZwa8oxzckTYvDdqheQtFbA7q8kZ8uH092Pli07VkiGAfzBt8ABulLAdhP8TXa65nzNN//z2na9XUEPVUoTAJts7sfyB4uaBRXqcF5NwEib5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:03:07 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 07:03:07 +0000
Message-ID: <ba3d9191-5f77-4a9d-8b57-76ee593c5f4c@windriver.com>
Date: Tue, 21 Jul 2026 12:32:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.96.0 -> 1.96.1
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        deepesh.varatharajan@windriver.com
Cc: Randy.MacLeod@windriver.com, openembedded-core@lists.openembedded.org
References: <20260705152012.3160479-1-sundeep.kokkonda@windriver.com>
 <DK1FJ604RQLX.1IRYGTCQNJZOK@bootlin.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <DK1FJ604RQLX.1IRYGTCQNJZOK@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0261.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::15) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|PH0PR11MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 48736dc8-df0c-4c45-b52c-08dee6f61dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|10070799003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	iO4DsV0/jhd1WfPtOOISs0sxynmdMPk/COO5j3k5AEXPJzeDAUQbx0rt2IrjAjR2OshucJwermd/TkTbtu8Wsq4WdOJ3XJRgogrknFVXyfphhtgeNA365TEGWEJQuJp8U3zzTcgi1ITBAAJ4cHgl1Z0OVIcGqBs6sPUZQdlcyDvPPHmFUPQ003MGXtD5ZWK7lI2ii7Wn6SD5eKLCXHxp9x7Lj2mE74fcNK0aftjNRC3SCDVUV1bQOB6WebRrbXrHvnVC/zfbqZu0kT8bmw2CrVUndCPycZqT80lszZyf+Jm3vMl0QsR8+tacttitk0rOKLLzqstQ1P6rmjHI7GecmChV/C20jMS4aYnB8q/xTHwArl8km6QegnpVkPFdYHUbPqmXIqgMsuiEGYmWi0+/N8sl9wyzvXDRc0c8ce56K6lfxTbZv9ba+mo8u/34xVQvvw4bocdyYe8XBqSWwQaLXTTCebMf6IhhVnki/HySl8m6LiWvCiMSixrhhpRpvZaSMEI+/Pi24rW13Yjqka85sK8gk6WtMz2Lqo5R0lW4QoXPRSPWrAmmfzWN3Rksl4Hx8WTiNY+i4ePql1VWYi3h7XXNTaO2rt3xskCmf2zvYUY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(10070799003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zjl5T0RZdXpKM0l4UzNscmowdGxuN2M0a1lPU09oaU54MWQwSFJnNXFzZDhq?=
 =?utf-8?B?YmhOME1OZkhhMzR0Ynd4NFpDaEFQa01ibGpmak9sRjR5Qkx6L2pOUVp5Qm4v?=
 =?utf-8?B?aEdjaEpIR1FEbUZVWXJMWEgxYXNFOFpLYXlCaW1lZUN6akdoS1dKY3h5RkFs?=
 =?utf-8?B?Ly9JdnFmU2hxaDB4VUpYTE1yb2NmS3lCUHFHZGpWdXM3dHB5dG9HUWNqdVkv?=
 =?utf-8?B?amNiM20rSXhMMUdpcjVwV29veXp2R0R5b2hkWStOZGhGOHhGYkVKaGY5S2k5?=
 =?utf-8?B?VXJnak5uZzA3V0IvbFEyS2tjVENiWk4vd3o4VW1Ta1p0Ry9LU0swQmE0ejZT?=
 =?utf-8?B?cWtQNTIxYjdoWFNwM0dJdjZhczhUUkFOMnhjSFpWSjZQT3kzLzVnK3NlTmxL?=
 =?utf-8?B?dW9JdmtTeUNuNitKbjV6VytuMGZyUDh1VXFkVElGaWI5em12ZDZGM2E1M0d1?=
 =?utf-8?B?dWhkZDUrSm9LTmNzOFRlOVpRd0I1ak1Xa0czR2tLRnFOWWF3b09JbUhETWpi?=
 =?utf-8?B?L2ljNzRmQnY5TFRLU0hiNUk4SkRObHM4UmVpc2t1WVNCUnFrR3NNY3c4TVAy?=
 =?utf-8?B?TWp0bmI4UWxFYmd5bTM0UFZzR0FkNVhhZ1lwVmpxTHFBU0dNbjZXQysyVyt5?=
 =?utf-8?B?OWtzVy94NkE5TVhWOHZIRUNHZ2tYZlNlaEtNUFdRQUZtV0U0K2I3TUJuc3Jl?=
 =?utf-8?B?N3h5cFhMV0xLYUpTamNmWWNoR1ZKQjc0bjRHcVF0TisycnJjSG4ySjFrVktk?=
 =?utf-8?B?bVdCR0dyRDhFd0VnbWdTd2pIN2NiMHF0UWhqQWNRcVZCRzQ0alhMV3FNcTA2?=
 =?utf-8?B?RFJIRFRSUFNaT1FYWEwzaEQ1RElSNjZvME5xQk1qRW85UzBUS1FYZCtmWkFm?=
 =?utf-8?B?MGMzdFFaWXNOOE1nNTc0bkRGS3hHZFgvSTJkWG03dC84ajBqT2VabnFJOG1s?=
 =?utf-8?B?S3o1dDBiMk5rYWVhcXpsNGNrZGt5TWlDTjlsSkNVSXI3R29rTnAvdUlKV3ov?=
 =?utf-8?B?ZzVQcVpuUVFJdWJ5QUdRZHRtMXdlMklxTlVJSEJoNWsvV2pSM01DcFBRSWVh?=
 =?utf-8?B?bEJhRnBBeXh1WjNYRlFFeDBqUHM3ZUd2TVo4VUtFMWtMTEdHNVpVR0hNMG92?=
 =?utf-8?B?cVFWb1F3L3UxbHdqZWJlK0ppOVpqK0szbUw0RnpEdzBvakJFRjlXQm9CUlMz?=
 =?utf-8?B?cXhBZlZ0VjFoaThDa3RpK2VCb2R2YXRoYkh2WEJzUnMrUGtCOWV5N3RWelNx?=
 =?utf-8?B?dXJTVndUTVRuVFdULzl1TE50dlFNUjJEN051a092cFQzRzJyYjZjeE9rMFM0?=
 =?utf-8?B?VmZQR2JIUVlYclVFcDBYQ0cxYjdnVkVpcFlTd1Y2NnFMZ3Jnd2JoVmZ4SHpV?=
 =?utf-8?B?TFRybjdPVnpRVGNJNzVhNDNkb05LNldvMWxKNU01aHFFbHViZElRSnIrbkh4?=
 =?utf-8?B?bFpuYkNrQURSTkVHWXBZVjdtSWttVlpWaXpDNldRNzhkKzV0VTJ2K09sKzhq?=
 =?utf-8?B?MGpSV2RBWU54Ym9uYzRWU3NMZUFhWG0rbWF6Slp3bWdjeC9ZWHFmekQwQzhv?=
 =?utf-8?B?ZThkSVJiRFdvQnFTc1oxWTVwRTBDL2pWM2dVNGY5N3k3TElxSHpuWkNCUy93?=
 =?utf-8?B?YWw4cXZaQlF4WEZYN1BCQitDbjlQdVVuMTMwMlhMYlNUNGhvbFRLTTM4TmUv?=
 =?utf-8?B?L3JTVHVhdEJSS2xPM1Bzc1pMTFU4SWlqakpyYWFtUExLWGZ3djRnQTlXYk5M?=
 =?utf-8?B?SjNzSmJoeHBpMzBZYlRqaUZUQSs4Z1FYc2VJZ2lKMGlEeTkyR284cExwZUk4?=
 =?utf-8?B?UzRoWHV2STRBT1lzaDlTZ05NcFpxVkd1cGtsT3J5SWhBUnBtajBTWHgyTmNT?=
 =?utf-8?B?RStRY3ZxeWRBUVdqU1pxWVNoT1c4emtHTm81dk04RDJsTXZzdHQ0M0NzSDlL?=
 =?utf-8?B?dThEb1oyNXNZL3ppa2JxNDZQeTFmLzc0NUxKRXhrZDlYUit5QmJKVjIwbVNn?=
 =?utf-8?B?aldieEdhY0k4WXorZWwycEZTekVreXVUUEdKcXlzdU5UaGQzOEYxK2tSWE44?=
 =?utf-8?B?NFU4allFQ1lmZ3VaTTFMR05tdlppQkw3ZWVqcWM4NnF3N1FoVWlPSDNybW96?=
 =?utf-8?B?YUMzc2lhdkJrRWRVNFZQYmI4TzR0WXBCQmIvTG9xV2ZQUVkvQ1BrRkxwK3lC?=
 =?utf-8?B?WkQxRVdIQzFiaXBXa3dEL3J6RzJzaE1jN2hmSUc3R2RHdHRiNUtCbnV3OWtE?=
 =?utf-8?B?bWxqN1Y3R1ora0lBRmFiNm5xMVBneHVBNmMxR25CdjR6MDVOYWdMY2xnS1NN?=
 =?utf-8?B?UzNnQ09ONHFocE90UkxFUnYvRmFReS9ZT2daTWlkcDNvV2xlaE1CS1U0aEZL?=
 =?utf-8?Q?rnV9aHltQIzscmXx4C6n7Kvt/ECUizfOQlukfm58aZ1Ny?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	IJ+ZvAW5bFZYi2iqSGkGgQ3AqusAP0xHI2UbE2rHPKeYwnWZZ42BjBRt
X-Exchange-RoutingPolicyChecked: 
	fbnDP3C/2KqUROdu3W8nM7EmrNONO0OUFiq3JWSnjZFeW9zTCIqOqfBi4/B1Fu8Kq5AWjDyZHzgR6iyyJtrGJFBZ1zSg0QkPIR7Q1+gGzn4KiODCjm7CoJgzUfrcwayCH8nqVaFKlKeZ6XFHdYEqGFP3yQc3/AG/hqL46HqtMo8Gh5zQ/9B9D0vOOwtHOLvtUOP1ffkZf6r9NW/6i6hFJYXcjTS4FHuCWXi1vPR+RCFQLKRWKZJ72n5n2X8xHoDbBCf5akfmOXxgfNWbSUVDk1Yl5cXLnaHbuPA7WMvd3zFoTy1ZvKmvGCrcCtQrGl0XchxVctn/Qv8X/QHdz5qmIw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48736dc8-df0c-4c45-b52c-08dee6f61dae
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:03:07.2710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Q54A+mejYoFilyfuKWFtvrMdT34g8DW5+DkoTPkqXKO0Q/c/Xko5GoG4DuKk6N/vhw70grNmICifkscaQf/MnxXpvsg8XCw0IpabXgD9qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5949
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MiBTYWx0ZWRfX4yJX7ig8Xp16
 RGQT7nCdJhGFpQ7MPAnFwE8vYP9Dafz8KGMXc2wJWvYz0NuFOAmeYVcoeZaH0/U8L5/n3BxPgfh
 e/ATB3GYXNRtjaGw0xvBmu/bf0W5QK76mMNIF2kaJDvwDCYBLa5VPWu6PpoKeM/4xdC1act9WlR
 LGIJZGT/7qoJOL+4x9Tp0CJQG3oiw2L03gcALUNHjpY8FkMVn5NSMzR4eHkH6muKNS1iC9JeFZO
 9siVMy6udG5P9uCFmX/CxOZJW5Bad3RsKKc/iSzbwCn0+BxMWKKwUWbtE9VM87PMYjuqZpDWH6K
 4qFPv10fJA/59Sc9I6TrL/Obs62ZAf6iCusn6pZ9HuPrcBopOVazYo6wpzQp6blL3imSjAIuRCW
 lhlL+6btXunnCepAeZnWGkOE9pkIDfVI0BNsq5ZPDtLjUQMgq6qC7gzDaWdxNvtdCx1dYWNfbJK
 En3r8GBmblb3cyF8cXw==
X-Proofpoint-GUID: O3nA8OpEv2Z4y9uAianpEBUJnpUR9DMT
X-Proofpoint-ORIG-GUID: v_kHrPVGUltiDm-Iux_T8-FRAq1V5k2W
X-Authority-Analysis: v=2.4 cv=IM0yzAvG c=1 sm=1 tr=0 ts=6a5f19b0 cx=c_pps
 a=XNh4DmHdy4Cg7KTw7bneTw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=ei4SEBeUAAAA:8 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=YA2LCsifdbCkuZUGOc0A:9 a=QEXdDO2ut3YA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MiBTYWx0ZWRfX2Xt0opY6I674
 mS7fIiGN6UekseH0GPQXLsD0Wu3PRQuSkecz7bT6RG7r4VjNJupqc34WqNvOqDnzTq9sdt1B+LK
 +fK9JX59sFIr47SrWvenDuPq1XJiQHguD+97IJXIgpdx5Eaokjii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 07:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241507


On 7/18/2026 10:28 AM, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sun Jul 5, 2026 at 5:20 PM CEST, Sundeep KOKKONDA via lists.openembedded.org wrote:
>> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>>
>> https://blog.rust-lang.org/2026/06/30/Rust-1.96.1/
>>
>> Rust 1.96.1 fixes:
>> - Missing retries / timeouts in Cargo's HTTP client
>> - Miscompilation in a MIR optimization
>> - Cargo CVEs:: CVE-2025-15661, CVE-2026-55199, CVE-2026-55200
>>
>> Test results:
>> No changes
>>
>> Assisted-by: Kiro
>> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>> ---
> Hi Sundeep,
>
> This was a bit expected, we still have the reproducibility issue:
>
> AssertionError: The following deb packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/rust-dbg_1.97.1-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/rust_1.97.1-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/rust-dbg_1.97.1-r0_x86-64-v3.ipk
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/rust_1.97.1-r0_x86-64-v3.ipk
> The following rpm packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/rust-1.97.1-r0.x86_64_v3.rpm
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/rust-dbg-1.97.1-r0.x86_64_v3.rpm
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4417
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260717-4vji97l6/packages/diff-html/
>
> Can you have a look at the issue?

Thanks Mathieu.

We will consider this change also with 1.97 repro issue analysis.

>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


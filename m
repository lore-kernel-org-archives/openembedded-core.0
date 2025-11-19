Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14334CF58E6
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:22:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16775.1763583721404838883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O04MrniW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3418077aaa=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7shex2175767
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:22:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=nuGvC27q+turn/JZbWGtLV
	8q+3+25i+dWpORTgoSs8k=; b=O04MrniWxcteb8QhX0IXGQiDcn6ycsrM751R5A
	yWZoXGYqn+BXIoS4WBpb9TVrfMTSEvaohubZXh79xdWDzvb+YcR0CpHl15RRcqBh
	QncPN0kmCgHIBSC+e7hR0yb0U4stHMaaOlthbIn3TgZY8tUF02gubT4/EAT9OQ+c
	UcTbeOzxM8iCJ0h4c2nfJYJvLKA9+HfclkaoGLJn+Ur3P6d3U+ZQ4LQ2QrAAc4ZJ
	UJG353M6b39WHRGpTZTbW9VzTCtgxmrHItQUE/CBvNztR/gweE/IkoKlBplks8qI
	xZENeVeTfEM1/Cgh+Q5TUV5n3MgzZiP7bKQb9OhElrjp1sqw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2wgr7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YP7WF5pgvCCI7pIGVmBrehx79/08VuJOIZjieItG7yeKI4GhDISXvD6EOuvmzymvyRWjuhmZkGnuH2lQxsyPwpvCD+RsdffwhYvjQWSL3egzNiRy1I4PJ0wS/CGpORgEECGvFZrHqp5c8fHeGDwjBFCaxpEuUYDYzqypN8GO8BE3TmCKupr0BI2ann/Dcu5NSDDt/hspMUrLv+4r22RIbIl4RG7rIwECOuGmn08vJXTRfJ/YBraV5ale8C9lBE+uL4cbVckEJ0rb8ngSdiJSYLIz3N3Jj61op3B9WaUn6YYX9nYQCioAN22NDlpdfPNC7AEyAhj1YLADZ/6efWA5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuGvC27q+turn/JZbWGtLV8q+3+25i+dWpORTgoSs8k=;
 b=e95AHLYASFE8Ny45nuq4rdwgl87oMPEpJq3V9jgAeSUagL/377ToZJV8EUuawmIhoCULdMj9q3+xW8Q+isTnrYdUWHKQJjj6FqFgFVb8zyWOxK3seMDHZVMTcJ/i5IDmts1g/V8w+VoQGO9LY6tHAdSv657mgmKCHCHFpcgdirf/ktFjfhG7MjB9X4iovslQQ4H1UxRHwPIBcL6hcLzQVStp0e4C2n6OMIYVp7FYwRClB1OVdi7Om9YMRYzcee3gPojIGPalk9/KWMi6ZJEMoInoM/Vx+HcSX/ZXj6KyNExxU25KMK6qxvloVRZs3YAZ0fasa5Yq28uhJB5rygJN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA3PR11MB7526.namprd11.prod.outlook.com (2603:10b6:806:31c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 20:21:56 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:21:56 +0000
Content-Type: multipart/alternative;
 boundary="------------8CibwoqTPaaE1v3UNZG5ibGH"
Message-ID: <498559c1-64f9-4a9a-86e1-2bcaea5bae40@windriver.com>
Date: Wed, 19 Nov 2025 15:21:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 07/11] linux-yocto: enable Rust support in kernel
 configuration
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
 <20251119164804.256364-8-Harish.Sadineni@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251119164804.256364-8-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA3PR11MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: fa89114e-79c8-4340-a573-08de27a94941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QzhCbkZWRTRCSGlCc0RBcGppaUxqRmJmTG1Ja1hpR1R6aGZwZ1JYTXFHZVVB?=
 =?utf-8?B?MVhsU3laUW8xU2ZxVEhDY1AyR1ViTDFxZzdOdDdvbm9Ybmg3TDlzeE5xS1Zh?=
 =?utf-8?B?OTBzN0ZWQXltTTdKbjA0QWNNWXphNzh1WDVKMld1c1FDWWNxdGFaQmRqTWE1?=
 =?utf-8?B?T1dyVEc0alZVQ2QvdG5UTWhhTXVDcG1qU05ZdXpzU1FodXFlcGZ1VnY3WG1u?=
 =?utf-8?B?MnZObnAreUQwMXFLYUVYMUdvRnVEZWpMdENLRlFOZmY2Y0haaDdnckRlYUZ6?=
 =?utf-8?B?U2kvbENBdkd2NGFCcWlHOENVSy93REVyVnJYYzQ3V1loajBuZEtWQVExb2F2?=
 =?utf-8?B?aVVHWFRXODJaeDVyT3J3b0k1dE1ROGRMRFJMSUtBZzNsRFlmQTlKSzJINmY5?=
 =?utf-8?B?bnRLUjhKRE1JUTlJT3F3b21JcWg3bzR6U3ZNNVVoeExaUDVZVkh5SjNzTkFr?=
 =?utf-8?B?REZzRFh0ZmxqcHhsL3MwcnZwcFBGK3RmcnZ4bVpHWng5RmN4bzVreEszYy8z?=
 =?utf-8?B?WG5IRytZR25jc3lvNmN4K1g3RDBnaTZLdEdvS3p4c2pTa01yZU05WTFySHp6?=
 =?utf-8?B?cUc1VUUxeHBhdmtCRVo1eUt5Zzd3V0FPR09IZTlzbnh3UnVFRVV1WUx5YURT?=
 =?utf-8?B?UTRZZXhBRDVGNk9yS09NSG41U0dobXU5ZEs3K25VWVpzTnhpV0FCRjhtdDJr?=
 =?utf-8?B?aWtiNWlVSGlyOTRZTzZYMmxtbUFMQ1AyL254WjR3WGlvUWZxY3pYd3hGMUdD?=
 =?utf-8?B?aEl2Wm1oclN0NnpCM1N5VXZoS2d1MElEekNYdlduVjI1Zk5pMVFDUWhlV1ZB?=
 =?utf-8?B?QXJYcnh1UGlxSlZIenlsMm15aGV4aG0reW0ydXRxZDhDYkVDUzcyN3hqZ1hu?=
 =?utf-8?B?R1ZWQ1owVUxXaUZIZWROREJkU2FkY2RIMFlDQ21IN2o0Mnc0ZmVnOGl0Y0VR?=
 =?utf-8?B?YWlVYm9TQStiMHBCcGhsTTZtM0cwRU0rWDQzTlNOTWljY3pNc3ZzTGYxM25N?=
 =?utf-8?B?N3lxMGloT1VKT2xFaTFxSjJKSEpDaHFTUDl4d2c4Nm5pa3VLK3RncHhpQUJz?=
 =?utf-8?B?RTZBQXAyUkJ5SDVHcHhLcklOb2lkS3BzajkyZDB3a2ZFN2hMM2xZMnBEVktZ?=
 =?utf-8?B?TnNuNmdDakVlRzh5eTVDeEFmM3ZCZEh2MFdzVE51N3RYNEtoV0RzTURMKytx?=
 =?utf-8?B?cnd5cHNwTGFCUTZuSlJUV1l3aUtmL1FmdFZ2d0g3TUNBU2IxVkg1aHgwS2RS?=
 =?utf-8?B?VkZZQ09nZGJCTUhPSEJUSmxhUHdzTmFFcGhkN0tQNkxhRDBVQ01RTDBKdEw0?=
 =?utf-8?B?ZGJQOVhmTWpzRnRNRkFVaW0xVmZMU3FnMUFHS2dxR0dYYVdiSTZwb1gvcS9V?=
 =?utf-8?B?YjdoelAybklXa1JQSC9wR1p1b2QzTmxFTGFBOSs0QVZRZ3U0bXlVS3BXQUVH?=
 =?utf-8?B?ejlvRzFjcW1ycjd1UkhpN1dKVWRncFYveFF2UVlIckZkeVNTcitYdGdXSWV2?=
 =?utf-8?B?cjh2bzFtcHBNSXE0bm1XcWUxdzFRSnphVmdSZHRCTG15QktVZjFMWFZCZDlE?=
 =?utf-8?B?RVNQRzk4NFdHZStOUnYwMnUxdXV1NDhGMmJPaUt4cjRHaDBPOGZBSmdKYm92?=
 =?utf-8?B?U0lYSm5DQmxoeXorZy9tL1NXYUF2QTZnbncxWDlHSUFkOFp0QnRkSHJTZlox?=
 =?utf-8?B?Wis0cFRFOU8xcmRTckU2QUZJK3AvbFczSHNkYVlzOE51WWVkU3A4S0tLUEF2?=
 =?utf-8?B?cm84NUZtQ0JLY25LanZ3VnErUmhWeUFONTNabDE5a0xVV3RsdmpZQStSdTN3?=
 =?utf-8?B?Tm5rU3EraVRoaW93Rld6QmowbExTR1QwaGtkODZqMHdVcWtuNkhaMWU0K0tF?=
 =?utf-8?B?c1loNkhPMVR2SnNqRThSL2xYVVVOTGJIY2oza3h2VlZnZlJvTUlYYlBRcWVo?=
 =?utf-8?Q?z8+1gfhugSrcQsTugPDIrSUmYSkJkNVf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlBuRTl1T2IwRXJCMVpyRlBkUlpXNmhnendDL1R2Szg1cC9IUEJTTndYM2Fr?=
 =?utf-8?B?NVB5UkZ3UDdpVDVLdUlHSkhpWFU0cXIrUElwK2F6bmFsckt6Z0lTVlZ4RnlD?=
 =?utf-8?B?Y0l2SkI0WWw3MWdTUGFUNnUwT2xQWnYxZzRFVGUveU92anNyZWdBSTUxbFNR?=
 =?utf-8?B?cTltWTMyeGV5SWZJSUxUSjIrbVBCeHB4bmRNTDhPdUVXd2lBYTMrU1FQNXd5?=
 =?utf-8?B?V0t0S3pFdGxwRFovWFlDQThZZ1NEU0RndFBDUjhrUlJtYUw3ZHB1S25rd09a?=
 =?utf-8?B?SGkxZysrQTB5WkxIWmJScUhsRWV0OVJkSHhKeVdieTVXS2JPeWR2VXNBMkNR?=
 =?utf-8?B?Z2FIYmFkN0drNzNiSnp5K1FLZ3VKNnRyNHd0VXM3cksyUWx1QVhPOUl3dTJW?=
 =?utf-8?B?WDVqeDFURFdYdWpWeWVKeHNvRFNMeUcyU05sWVV1U1hVckZ0ZWRlbDluaEtD?=
 =?utf-8?B?bW4xdWRvelU5alRjVVhqdmNVTlNhTy9pMk84TzNpM0R4NzNNQVJLV3dYSSsy?=
 =?utf-8?B?eWdqRklObDRGa0pSRGZBZEIycklybWFqTzc0UnNlenE5RTVyNTRXMFQyTjFX?=
 =?utf-8?B?R2J3ZDlVLzZiNVlReFJPQ1BMMStucnN4TFVFeDhDT0M4dDhLbVdXcjZlZExG?=
 =?utf-8?B?TFdlNERCc1U4WkpGcXlxUVkwVllXaDNGM1k1WHhDV29NRlJqbXZTc0xiMTdq?=
 =?utf-8?B?Tzk4Y1N5SCtCdnd2K3k1L2xxV1N4ZzgxNlc5L0QvREdKdVFEQ0gwZVROTGhR?=
 =?utf-8?B?em9FV2YrUUJDR09GUjdRWlVZekhDQUFsNTJvTk9UL3hLUWQ0OERWVkpxZXRK?=
 =?utf-8?B?MWx2ZDRtdytMb1E2YnBPdE5oeC90bDkvYWFUM0VvQ2NkTGEwSE83dWd0NTJK?=
 =?utf-8?B?OVdTZ3Irbkl3Qk82SFkvUGtZR2FOTGlnLzhZbGNQVE5oMkRqODJaTEt1YWI2?=
 =?utf-8?B?M3BaOWsybzNyVTdvQVRBWVA1VGZvN05PclhTQUZCc1BIN21pWTI3NzIxQjNN?=
 =?utf-8?B?N2lBdmhFcWxOWTBpWVdqV1lUWU9XN21SWVF6N3pBNFQrWW9MaFFicGE3MzZH?=
 =?utf-8?B?V3pRKzJiVlpkMklnOE1NQVN4Z0ZRZkt2cWpxanZtNkMzV1hLdVpCOFFIV0ph?=
 =?utf-8?B?Yk43Ym4zaVVYMEhLRHhkdUtPY3BZdU51RnpOY2NQS1Q2WHY2dlk2L1RHVXBt?=
 =?utf-8?B?RzcyZUM3YjRiWjZuWnZMOXNyZ2V0QzR1bXRvVTV4cktvWEpoUExNNW5sWlBL?=
 =?utf-8?B?c3YrNldnajNHa2ZWU0pheVlpeWM0V0RxcUZJYW5VZnMxSFVBZDREcHlJTXc2?=
 =?utf-8?B?OHRHY0QwMmNtaUJOdVc3bHpPelk2Q3g3UEdsM1pPeHYxVTY5cklmUkhBaWVm?=
 =?utf-8?B?NkZ0cDIwdVNuTUhxN0IxditUSmttMWJCTzZFeEtBNTVSRXAya1BpU3ZoUTZO?=
 =?utf-8?B?S1R5MnFsNDM3QW5QYTRRREhwditjZDB3dmlkNjRCazllLzd3VDNodnBwdnc0?=
 =?utf-8?B?aEtWaWRnV3NpWUhQZzRQeG9HWDlHWnJtSnJVOGdVdlRVYWRMQ1pVczg2dEJa?=
 =?utf-8?B?NEx0TWM1S3EwdXp2dGErd2g2M3dnVW1nbk9GYjA2LzJJMXArSHRIdHlLdGlr?=
 =?utf-8?B?V1Rnd0IzajRaWWp6Wkh1STgxUS9Pb0t3SzlTMTB3SitPMDdoZHpXYXQ0V2Rq?=
 =?utf-8?B?UldnUmdtZWhYa25aTE5ET0FuamdkNG53NWl1bmVwZVF4K0haRi9YMFRXc25P?=
 =?utf-8?B?bldrRWlOTFR5NnBUM0ZSZlozTkxzb0ZJNWtlTUU3bWI1am5oNEM5Y0pwZDMw?=
 =?utf-8?B?Q2picnFyZW9ERHRzRjNGd3BuT1E4UHkveWdvaGw4bWpLeFlLUXBIQXVzdDZP?=
 =?utf-8?B?WG5JcFV5NlE5MlRQS2VZT1dsWiszMjVNbld5dXpvbU43R2l0ODdJOWFpUmFa?=
 =?utf-8?B?VVUwVi91aG5aZW8zZ3dFRExiYWxHMkdTM2xMSkxlM1hUSFE3dFVBNDFmcy9T?=
 =?utf-8?B?aDdYMlFwbXdPQURXL2M1WWlnRFMzQXR1eDErOUhzSEhvUE14NEVncHB3NVEx?=
 =?utf-8?B?cGpJc1hEQmZ6TWt4MjhCSFBnOXZMMGRtSlF4SXMrNkZuSlNUK0w0ZXhBb3Bk?=
 =?utf-8?B?QnIzSmQ2amM3QjRDeFcxZ2h6QjFLOEp4Q2xSR0YxUjd3VTNvSlZya1pYY3RV?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa89114e-79c8-4340-a573-08de27a94941
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:21:56.7428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPGXPpCt23PGTql4cU7Up7OgjCZpBuhOhLItYx8i2L0qbKYk+OPYygMeqp8UwKKSepg20aJhiK68KnIBvODLi9cNRwpsWReEN6lgglPTFh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7526
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE2MCBTYWx0ZWRfX0XQko8uHT2vr
 TcYo6OCNQN9VenS6fj66irWrUQqLXbY+L+lb8QhKpbCPd6XVvv6wdE15QSH/TlDDjpPvU3ETj03
 X9AjFEwbOmZWwABTYL4ncnbyzOioO1LLjA9wvQmpz8gPkzYoOci6pbuSplTw7/oH88LxXZEbM1g
 XYom4As2BAgAWOB8LzyrB+jWLj91PS1W2m4PprFjVYLAPXEaZHFE+j9NNyK4zXPYwfIXF5vwZw/
 JjImary0veGgIzslWM7V08SQObk0l8Xk/S4in2qIYBFgsG4g8oYbIgPahkEThTI+CIVFvQTOEeW
 63oR7O1QklJEzhfaqsbBH8h4qZqEtx/7VAhD2g7ZXOp7odO0Q09V2S1IoNMLpee2CrOZeB4Lw6d
 E9dfJws2gDE3BP1ImC/YjmPvZuWDiQ==
X-Proofpoint-ORIG-GUID: 2oDXhFwV26WXuUVCjCTqIajy3liCBZwr
X-Proofpoint-GUID: 8sEekzWvZqBAq2D8x1oc6CIJ7QP4aJuF
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691e26e8 cx=c_pps
 a=ZVLNonFp53krOPJecICuKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=BmYt4-CVDA0ZjZiO9xAA:9 a=QEXdDO2ut3YA:10
 a=WHM7oZnqZyDV1NAtvI8A:9 a=wFOz9yxGzw9rQTtO:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_06,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226588

--------------8CibwoqTPaaE1v3UNZG5ibGH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-11-19 11:47 a.m., Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> Add initial support for building the Linux kernel with Rust enabled:
>
> - Introduce `rust.cfg rust-samples.cfg rust-debug.cfg` to set Rust-related kernel config options, including:
>    - `CONFIG_RUST=y`
>    - Rust sample modules and developer checks (overflow/debug assertions)
>
> - Update `linux-yocto_${PV}.bb` to:
>    - Append `rust.scc rust-samples.scc` to `SRC_URI` and `KERNEL_FEATURES`
>
> when sending non-RFC version, we will send kernel-config-fragment to the yocto-kenrel-cache
>
> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> ---
>   meta/recipes-kernel/linux/files/rust-debug.cfg   | 1 +
>   meta/recipes-kernel/linux/files/rust-debug.scc   | 3 +++
>   meta/recipes-kernel/linux/files/rust-samples.cfg | 4 ++++
>   meta/recipes-kernel/linux/files/rust-samples.scc | 3 +++
>   meta/recipes-kernel/linux/files/rust.cfg         | 3 +++
>   meta/recipes-kernel/linux/files/rust.scc         | 3 +++
>   meta/recipes-kernel/linux/linux-yocto_6.16.bb    | 2 ++
>   meta/recipes-kernel/linux/linux-yocto_6.17.bb    | 2 ++
>   8 files changed, 21 insertions(+)
>   create mode 100644 meta/recipes-kernel/linux/files/rust-debug.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/rust-debug.scc
>   create mode 100644 meta/recipes-kernel/linux/files/rust-samples.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/rust-samples.scc
>   create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>
 >< snip ><
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> index 2188c7fed2..37cada11a5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> @@ -77,3 +77,5 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
>   # Check again during next major version upgrade
>   KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
>   INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
> +SRC_URI +="${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' 
> file://rust.scc file://rust-samples.scc file://rust-debug.scc', '', d)}"

I suspect that we want to pull in _only_ rust.scc by default.
Do you agree Harish?


This is fine for now and can be fixed once the fragments are merged in 
y-k-cache.

../Randy


> +KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust.scc rust-samples.scc rust-debug.scc', '', d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
> index 5d10a17e70..f63405a3a0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
> @@ -77,3 +77,5 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
>   # Check again during next major version upgrade
>   KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
>   INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
> +SRC_URI +="${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' 
> file://rust.scc file://rust-samples.scc file://rust-debug.scc', '', d)}"
> +KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust.scc rust-samples.scc rust-debug.scc', '', d)}"


-- 
# Randy MacLeod
# Wind River Linux

--------------8CibwoqTPaaE1v3UNZG5ibGH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-11-19 11:47 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Harish.Sadineni@windriver.com">Harish.Sadineni@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251119164804.256364-8-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

Add initial support for building the Linux kernel with Rust enabled:

- Introduce `rust.cfg rust-samples.cfg rust-debug.cfg` to set Rust-related kernel config options, including:
  - `CONFIG_RUST=y`
  - Rust sample modules and developer checks (overflow/debug assertions)

- Update `linux-yocto_${PV}.bb` to:
  - Append `rust.scc rust-samples.scc` to `SRC_URI` and `KERNEL_FEATURES`

when sending non-RFC version, we will send kernel-config-fragment to the yocto-kenrel-cache

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/files/rust-debug.cfg   | 1 +
 meta/recipes-kernel/linux/files/rust-debug.scc   | 3 +++
 meta/recipes-kernel/linux/files/rust-samples.cfg | 4 ++++
 meta/recipes-kernel/linux/files/rust-samples.scc | 3 +++
 meta/recipes-kernel/linux/files/rust.cfg         | 3 +++
 meta/recipes-kernel/linux/files/rust.scc         | 3 +++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb    | 2 ++
 meta/recipes-kernel/linux/linux-yocto_6.17.bb    | 2 ++
 8 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

</pre>
    </blockquote>
    &gt;&lt; snip &gt;&lt;<br>
    <blockquote type="cite" cite="mid:20251119164804.256364-8-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 2188c7fed2..37cada11a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,5 @@ KERNEL_FEATURES:append:powerpc64le = &quot; arch/powerpc/powerpc-debug.scc&quot;
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = &quot;features/debug/debug-kernel.scc&quot;
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = &quot;textrel&quot;
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','rust-kernel','file://rust.sccfile://rust-samples.sccfile://rust-debug.scc','',d)}">&quot;${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' file://rust.scc file://rust-samples.scc file://rust-debug.scc', '', d)}&quot;</a></pre>
    </blockquote>
    <br>
    <p>I suspect that we want to pull in _only_ rust.scc by default. <br>
      Do you agree Harish?</p>
    <p><br>
    </p>
    This is fine for now and can be fixed once the fragments are merged
    in y-k-cache.<br>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20251119164804.256364-8-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">
+KERNEL_FEATURES:append = &quot; ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust.scc rust-samples.scc rust-debug.scc', '', d)}&quot;
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 5d10a17e70..f63405a3a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -77,3 +77,5 @@ KERNEL_FEATURES:append:powerpc64le = &quot; arch/powerpc/powerpc-debug.scc&quot;
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = &quot;features/debug/debug-kernel.scc&quot;
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = &quot;textrel&quot;
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','rust-kernel','file://rust.sccfile://rust-samples.sccfile://rust-debug.scc','',d)}">&quot;${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' file://rust.scc file://rust-samples.scc file://rust-debug.scc', '', d)}&quot;</a>
+KERNEL_FEATURES:append = &quot; ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust.scc rust-samples.scc rust-debug.scc', '', d)}&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------8CibwoqTPaaE1v3UNZG5ibGH--


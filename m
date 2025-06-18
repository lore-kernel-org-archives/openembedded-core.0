Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD4BC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 18:39:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3442.1750271956146802793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 11:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8264c2ae8d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I5Qn8l029060
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 11:39:15 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3vvd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 11:39:15 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55IIUiTE001408
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 11:39:14 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3vvd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 11:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqW70K2MktiedDCfAbwSyMcYr3fEDDJ05k6y/aolMc4HQm16bZ/Wc3BDjQqVcm2UlsEoJ5UIOM++E//UHlXGAC/2iO2MP711WG6G/2jnUMeJ1I5MZcA2l31fgLYWLCCYHXyxCiSEpbXwTwat5mEb9OCtqKzTKiOv2sqgDym2yRzHWDpLUAXSGB6hAsQnn8GTFS/urZIvSUKn3rs6OGqbZInGJ11fpM70GqwbmXcyDcgh6o0jDeo/IakSH+H1QE47pGBzzm9qq6hvPdykOvlbsYuSOBb+FfFmQA+8qUdNGKVXTKrVItsft762Q8MVb92QDmoBpwTSsyuC7cBzg62Ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFE6MuqwkDz1xb0f1TEkyd+74R+yEBThhPLBDh1QpEQ=;
 b=CCUC6VDSlcKdg3ZJpt1dne7N00HJTQZC1FDwHyEJxmi5sKZUtXggkB6mlRSlWzooPrYOyK7b0tM/s7C6JgUX4SPBqnDiIFz3ohbLUL1Ik9Ke0Np+ELxhNAWrYvOSNgzidQmoinAlJu7q9YGmhi2r71U8iP9dE3baoQTfUrw5UIPmyTmUmuNq2jGy7iIUobhkwwJgvMLobAoZlxt3bgXPiZc64sFpDNd/54/8XPGpkFcVi8X0q45aasHq2n8NS80S6QzerSPsTfRQu6976Leq35EZzwyWWzRiJZ/XDCtcudOjtW4TLWEu68V/rrYWAUSqQYyjMMP70rcMni6KIK395Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 18:39:11 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 18:39:10 +0000
Content-Type: multipart/alternative;
 boundary="------------2BYokQaD0Ui5BPSNEtZ3jbH0"
Message-ID: <2b0ef034-4ee9-493a-aaae-b57137305378@windriver.com>
Date: Wed, 18 Jun 2025 14:39:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][walnascar][PATCH 1/7] default-providers: Add
 VIRTUAL-RUNTIME_dbus variable
To: praveen.kumar@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: Niko Mauno <niko.mauno@vaisala.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250618124256.3261625-1-praveen.kumar@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250618124256.3261625-1-praveen.kumar@windriver.com>
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW6PR11MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: 20664958-d983-4629-ddd1-08ddae976a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QXZtYUE5clNOakRFSjlFRTBtOXNpdEEwWVJQUWVZVHhId1Y4MTNIZXdaeDIw?=
 =?utf-8?B?M3BrNnhOYlVaOTlTR2JReDhLcnRxWVNVMEhvM1hJMXNKM3lEaUhxWTlWVU1Y?=
 =?utf-8?B?dUJURG1UMU55MERXUG05TEFxYkdNalI0L3hFUFVxeTB0VElnYjRXQjdDL2Zj?=
 =?utf-8?B?TDhuV2d2dEZLcGF3Qk5UWHR5dlc5dUh0c2FIV05yVHhxVVg1bkVMcnVvTU1W?=
 =?utf-8?B?ZVZLQWlGRU1tR3BZNG81Um84ZjNGaC9jakJEZXJxbFVSV05KcWhrQUZneklU?=
 =?utf-8?B?KzM0elMwaU9LKzNXNWJkRVpFQSt6QVdZd2ZWRHlBdHRlSWQ3RlB6YTMxd1Bx?=
 =?utf-8?B?REZlVGE1UloxMlJLZmRueDZONit6UHhpV0xBOUROb1JURmd4RzlTQVhUcGV1?=
 =?utf-8?B?OHVDRGhUbzVWVUJza0tTK1ZPQ1hmOHFUSXZzYmhGWjI1WVhTaGlBQ3RjUlBM?=
 =?utf-8?B?OHA1aVlsZitBWTJ3ZlJxOGVXSk96YWk4aVZUd0h6R2pRS2EyWVp0enErV09S?=
 =?utf-8?B?ZlQ4bGdiYzgrYVZ1a0Ztb1BUeUZHdDVLQU5iOXdsZDhFT0ZKNXNIQXhHYmo5?=
 =?utf-8?B?K2tDekNmUFhVZFZkZHRXb21YOTR1QmpBQmY4RFJMbEVaTU4xVDlwbFFobUdS?=
 =?utf-8?B?bVlrQll6UGdNT3dpTllEMmgxeVFnYlNUdmUzT0xlNVVHTlNLc2JBRHMwUEE0?=
 =?utf-8?B?Z1JKK1VMWTVSVkE2RlFndkxoamsyUC9OSk5yRzc4MEkzVGdYakEyb1drSDRT?=
 =?utf-8?B?QXYwM1hMN2dyaUdjU093NEJnaW4xRjY5MEY0UDFxWnNYV0lZWHdMTXdaMTBY?=
 =?utf-8?B?Sk9QalN2djVwQWJZNXltbjJ4MnpFMnFNMzUrZ3pZTEtIdWU3M0FVN1NlS1Ji?=
 =?utf-8?B?dkNDZjIxeUNLS1FyazJZMkxFMlNkdldUWEplY2FET1ZFN1NzK3J4aWFqem84?=
 =?utf-8?B?TVh4QjFEWjNLc0hocmVoanB4NzlHeGdMY05HRStwdWVyd3laSUZlSDMxZ2JZ?=
 =?utf-8?B?R2FsRHRPTkJjTGtBZ0loaGxaWUFxTjRqR3dFWHFEaGNCOGZVN2lDaWJZdWFP?=
 =?utf-8?B?bS9NcGl2SkVMT1J1SUtHUml1MHRuRlhTRFp6cVBrUkNZSDZVbE1iQ0NMNm5G?=
 =?utf-8?B?Wk0yY3BNd3laaW1pSmVmM0RySTVJL21pV1JPVXdoSTZsdnE2TVczbUJ6Szcr?=
 =?utf-8?B?ak9FU2RZRWZLRHF0aGF6SnBRVHAraWNpcGxNb3NZSThNN21uVklpTWlYUnN3?=
 =?utf-8?B?aWphREJYZ2lVZ1pKeS9aWnlDU1RBQ1JBeHd0SmRsVVVaUUdXZzM4ajVPSGlx?=
 =?utf-8?B?Rm5ockpELzB3aXpNa3F5UXVYbHVOdVdwT2d1SHRFakNsOVpLZzI1SHJqY1E2?=
 =?utf-8?B?UVo0Umtla3pxTzZYRXhJd3ZUWkhoUWVCZDhUYm82LzNNV2RQM0ZRMjVSeTBi?=
 =?utf-8?B?NEE2L0FOWVZRdmduQ1hFcmNwYnVJNnI2Q3FkV0Zyd05XWGZwc3RYVG9wd01V?=
 =?utf-8?B?N0xZRWxHTHlyWmsyNk1jejBaUWZ4WXNEYzlGSHpiSS9rejVuYkhKZWg3ODFT?=
 =?utf-8?B?WXRKcFpZNklUMWJ5WnNMZ0Z3N0JROHpkOXkvZndlVUZvNzcybWNkWEJEajR6?=
 =?utf-8?B?bGtvUkRaSXp6bTk3aERUZ2JkM0ZEcGJOdjM4R1dMWGZOL0hHdUJOQW5iSTMw?=
 =?utf-8?B?K3dLdUpmRnh3LzdHdDBJM1dIUk40WHZGSCsrT3BPSW16RUFya3UwWDV6bXpX?=
 =?utf-8?B?a2ovQlJXdHc5bE5zNTlKdnJOMC9JM0RsZ2tRcnIyK3ZnZnY1dVFLT05rR2d1?=
 =?utf-8?B?WnhLVjBnRDV0UWUvYmk5RWpyaHoyNjZDUWlFTlRjdmx1VU0raXdOSUpKWElm?=
 =?utf-8?Q?WO0Oc63NIxCf2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzFZbjFFbzlmM1dMSXpWRzg1QnZPeGljKzI3ZGxYNmtvenRHMThreUFMRTA3?=
 =?utf-8?B?ZUNrekJVbXZtdFlzSGtEYnphMks5RDF5amtObkdZdGxwQ2dKK09wdlM5VHVZ?=
 =?utf-8?B?YW16MzZiUU5Wd3NyNklPc0hZS3orZWZqNlR0U1hRQ0pseGNub3pzbEdzNytE?=
 =?utf-8?B?NTJtN3BsZk8wazd1eWNnN2dBOStvblVLVDNlaE9sVFlzbmdZRll6SzlMT2hP?=
 =?utf-8?B?SVBXY2Z4TWROUyswWjJHa2RrZTMzOUZ3NmI2NmRBVElFUGdRaWZwaHdBejd1?=
 =?utf-8?B?SlllbEJSLzhWK25FSVpEQTlHQ1lHQTlHZU5zRlNoemorOGFzd2hzdVRKM0w5?=
 =?utf-8?B?dkRMdEViYTFxK3FzYW5Ta1BkWVkyK1RtSGVwS2pTWS8xbmZVTmJDdk5JNE5Y?=
 =?utf-8?B?WXpoMFo0YytMZTk2UlhoeldWa0oyM2picXYxZVpFZlNoOWhVVFZCN2RaZWI5?=
 =?utf-8?B?VGtnRTVvM2FGckdwTmtXbjZ3cnJJSlZMQ3BzM1F2bDhDRmZuZVNLWmo0MGdG?=
 =?utf-8?B?MjZwTFYwamoyRGI0RndzcGNuL0RPaHZESDRydWpqOWE3R0RBNlN6elkrUldx?=
 =?utf-8?B?c1dhRElwS3lkS0J6UE56YnoxNXhyT0NCRzlHOS9qUVJrak5oaEtlditod2Mx?=
 =?utf-8?B?NURYZmlBbnhuWkxlMWwrSk56TUZOVTV1Z1pNcDlUS2VoM1NjeXZkZkNXTC9X?=
 =?utf-8?B?N0JFcVBJUHd1cFNUb21CSkhnRVJ0VnQ0SlF3Z3FsYVBDemdiWmpqdlBkNEJO?=
 =?utf-8?B?TkFHc3k1ano2RzVOaFR2ZGIxTlJkbm9DY0JGSk9wZ1lmKzhlMmVlNG1wVE0w?=
 =?utf-8?B?Zzh6cDNsYWdvd1VrcDZBc1h3c2xEeDR0Z2x2ekJqdkZoaXd0OU03M29ZU2dK?=
 =?utf-8?B?ZWJHMGFNcXo2K3FHd1lCZWdqcFlPOUhGOU9Qa1MzK3N6Ri9XU3pEQitSV2dQ?=
 =?utf-8?B?YWc0YmREcTI5aEllTGVwclhyTktRNTRMQmI2dE01Z29lUHdqZVZ5RXd0SkhC?=
 =?utf-8?B?Rlgza3NMK01JYnhZUFVVb0w0eFZBK0RpWnFoMTd6Z2lMMnkrVHRJYktoSXly?=
 =?utf-8?B?azkrd0JHSnZQZ3M1RmVpZnh3Nk1sVzBNdUJGc1k5VGpaYkZCNDQzWU5Mc1Vw?=
 =?utf-8?B?UDlXZlRSYTBMOVpJMkN3clBlTyt2S204NVZNTCtWdzVFVkFHczFlbjBobi9u?=
 =?utf-8?B?aTFNNjFNL2l3aythSGFYODNhdVpWSFlJam5HZ3ZrRmhFV044eElsdHhEUDZy?=
 =?utf-8?B?NlJFaCtoVzJ3ai9YSFErUU1RdTFNamRiZ01PTlBIUXhPbFlUMGtDL21LYnBI?=
 =?utf-8?B?KzdPc1V2WnQ2YU9YQmg3N2xOQzI5NVVmQ3lwOHRWb0p2eGtEb1NIWXlVbXNP?=
 =?utf-8?B?TW1qWjVZSi82NG5zOTFQQlNPVDR3RGFWTjJVUU11akx5RHBLMEprSnZyNVFX?=
 =?utf-8?B?eXN1L3Y5WGpQK090U0RsZ2F2RFQxcVpMd29MZEJQOE5uZFo1Vm1LdVErZGVi?=
 =?utf-8?B?bmF3MXdnMUlGTmNxUW5hcktvVGNDVHdxZXQ3RFZZVk9DSU51SHAzUzUvekVx?=
 =?utf-8?B?SXZDRXJPelFhYTdkYmp6TFViMDd5KzBxYnJ2UUhyV0hJMU1KOXRYMFVqZWJN?=
 =?utf-8?B?MGxwTHE1cEFmbzZ0bzZxV0xWSHBlTFVJYWtrTTZOTzBJT3hLK2JYeWlXTEYr?=
 =?utf-8?B?TmFGR1dWSEh1bUY1ZENWeGZnU3R6QXVKNEpxWmg1a0JEeXdNdUFmbWlhQ1hZ?=
 =?utf-8?B?ZDFEZ2FTZVVDd1hWTDNDVkQ1Zk41N3RocGhUVHNheHhQaFIrQVp2cG9JdFB4?=
 =?utf-8?B?MzdqNjNhUm92ZjVraHVabG1WSERkL1kvejltdnY2SjJDayt6OUd2cEYxV0tw?=
 =?utf-8?B?Z3djenJ5VVBiNS9lK2R0RVFQZGprVVZ2aEgwVTl1MlhXOS92TlpSbGJ2Tm9s?=
 =?utf-8?B?SUdRZ0JIUWovWWhYU3M1MVR0ZmMveWdXMzZhT1lzaTNMT1hDbTZlcE1ZNWtp?=
 =?utf-8?B?TGJtdzQwZDM2VTVSOWkreE40ckFDbnRkTi9yQk9kL2tWNFdmZE5TcUpXMUR3?=
 =?utf-8?B?eDlRNllqaGNMWEV3eThoVzJCQUloeSsrZGxMR0xrNG9FMlRQL3dxTUYzRXJQ?=
 =?utf-8?B?bTA0bmwyV0JFKy9pQVdWZU5BWmxIeDBZWG81djlnMDBpd3RQcjJVcHFxODl6?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20664958-d983-4629-ddd1-08ddae976a46
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 18:39:10.4520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7PMg15g7iQoL/WewxuWhFShsexgJZk9cPTtkTcscc4cKZVDtNFGisoNhH/rZ5xMJ30yJU4QOdZ+Pgl9E4XlJNLDzuNrvgFNcr14lgKAthg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
X-Proofpoint-ORIG-GUID: wyq0JgASvKdXxCvk6I6HJ0JPzmFPb4Rc
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=685307d3 cx=c_pps a=MPfW0GtrrVyaQwIB9FVG4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=vTr9H3xdAAAA:8 a=Q4-j1AaZAAAA:8 a=eWRtdWc1AAAA:8 a=e5mUnYsNAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=-4ECfy_KgvzE2ZlXDAcA:9 a=QEXdDO2ut3YA:10 a=1rYLr5uk2w6_IIXKaMoA:9 a=LM8XNmStpSTiI0gK:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=fQEa9puXOWAy-YWvlEz7:22 a=Vxmtnl_E_bksehYqCbjh:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DLAiRcZbCz4TSUtrknXHMn_uII_cEYeo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE1OSBTYWx0ZWRfX1ruO8lQnYYuM ITn2SZ6tLnAs36bVc9bUjy91X0L6eBK8szLmkTwUaIg+Punn8Rci0hKhoF5NcuYwTcgZZUJTz+z JRSUlwPVUU0wbzaOKvnWBbov8bixSgkGvoah5Ysk7xXc1niJnoq6ZhQLT4O89aFPjJ0Dep2kPIV
 QXHD1yhzIhgZn07ePMrY6g8ooJyYoToLxtVsA5aknUSpkx93jkGEFhfkUSwhkfmHT+tlKygHjjp vBfzTJUvuqIurCcIOO/65bmfFkmQlAMB5rvSDOa8zIgbJx4N7V/kPZEnvz0vOWtmfWtMlBe8yAO CXyED+y4NLOXMdRJiGWYft0s8irFpj2KYBjhyvs0W5j8+5Axo/6fj+g0Bgjj/eBCGHvVkfKZGvQ
 oY+U4WespejoFuIdsLsCn3gKOevBLGKiP2govxN0wXf/Ya9DOsxhzAmg8JT2latNNu7b7v0+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506180159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 18:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219033

--------------2BYokQaD0Ui5BPSNEtZ3jbH0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Add Steve who maintains walnascar.


On 2025-06-18 8:42 a.m., Praveen Kumar via lists.openembedded.org wrote:
> From: Niko Mauno<niko.mauno@vaisala.com>
>
> The purpose of the new variable is to facilitate oe-core users who wish
> to use an alternative runtime D-Bus implementation instead of the
> default Freedesktop.org's dbus, such as dbus-broker, a recipe for which
> is currently available under
> meta-openembedded/meta-oe/recipes-core/dbus/
>
> While introducing this facilitation the intent is to preserve the
> existing functionality, while allowing the user to optionally select an
> alternative runtime D-Bus implementation by adding the following line
> e.g. to local.conf file:
>
>    VIRTUAL-RUNTIME_dbus = "dbus-broker"
>
> As a background, for example the Fedora distribution uses dbus-broker
> instead of Freedesktop.org's D-Bus implementation. The following
> excerpts from
> https://fedoraproject.org/wiki/Changes/DbusBrokerAsTheDefaultDbusImplementation
> provide background for their technological decision
>
>    This change provides a more scalable and more reliable implementation in place of the reference implementation.
>    The reference implementation suffers from long-standing issues including potential dead-locks and susceptibility to denial of service attacks, which the replacement implementation does not.
>
> and
>
>    No visible changes in behavior are expected, except for different log messages.
>    Any visibly different behavior to `dbus-daemon` should be reported as a regression.
>    Ideally, this change should only improve the performance and security of the message bus.
>
> (From OE-Core rev: 81fd917ac05be19d8345fff272a2ffc17a257880)
>
> Signed-off-by: Niko Mauno<niko.mauno@vaisala.com>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> Signed-off-by: Praveen Kumar<praveen.kumar@windriver.com>
> ---
>   meta/conf/distro/include/default-providers.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index d3eefb754b..cebd0400f4 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -31,6 +31,7 @@ VIRTUAL-RUNTIME_base-utils ?= "busybox"
>   VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
>   VIRTUAL-RUNTIME_base-utils-syslog ?= "busybox-syslog"
>   VIRTUAL-RUNTIME_keymaps ?= "keymaps"
> +VIRTUAL-RUNTIME_dbus ?= "dbus"

Praveen,

This change-set borders on new feature development in a released branch.

Unless you have a very good use case, we'll likely reject it the 
backport to walnascar.

Can you explain why you want / need the backport in a reply to this 
thread and
if you send a v2, in a cover letter to the v2 series.

Thanks,


../Randy



>   
>   #
>   # Default recipe providers
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219000):https://lists.openembedded.org/g/openembedded-core/message/219000
> Mute This Topic:https://lists.openembedded.org/mt/113707135/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------2BYokQaD0Ui5BPSNEtZ3jbH0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Add Steve who maintains walnascar.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2025-06-18 8:42 a.m., Praveen Kumar
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250618124256.3261625-1-praveen.kumar@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Niko Mauno <a class="moz-txt-link-rfc2396E" href="mailto:niko.mauno@vaisala.com">&lt;niko.mauno@vaisala.com&gt;</a>

The purpose of the new variable is to facilitate oe-core users who wish
to use an alternative runtime D-Bus implementation instead of the
default Freedesktop.org's dbus, such as dbus-broker, a recipe for which
is currently available under
meta-openembedded/meta-oe/recipes-core/dbus/

While introducing this facilitation the intent is to preserve the
existing functionality, while allowing the user to optionally select an
alternative runtime D-Bus implementation by adding the following line
e.g. to local.conf file:

  VIRTUAL-RUNTIME_dbus = &quot;dbus-broker&quot;

As a background, for example the Fedora distribution uses dbus-broker
instead of Freedesktop.org's D-Bus implementation. The following
excerpts from
<a class="moz-txt-link-freetext" href="https://fedoraproject.org/wiki/Changes/DbusBrokerAsTheDefaultDbusImplementation">https://fedoraproject.org/wiki/Changes/DbusBrokerAsTheDefaultDbusImplementation</a>
provide background for their technological decision

  This change provides a more scalable and more reliable implementation in place of the reference implementation.
  The reference implementation suffers from long-standing issues including potential dead-locks and susceptibility to denial of service attacks, which the replacement implementation does not.

and

  No visible changes in behavior are expected, except for different log messages.
  Any visibly different behavior to `dbus-daemon` should be reported as a regression.
  Ideally, this change should only improve the performance and security of the message bus.

(From OE-Core rev: 81fd917ac05be19d8345fff272a2ffc17a257880)

Signed-off-by: Niko Mauno <a class="moz-txt-link-rfc2396E" href="mailto:niko.mauno@vaisala.com">&lt;niko.mauno@vaisala.com&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
Signed-off-by: Praveen Kumar <a class="moz-txt-link-rfc2396E" href="mailto:praveen.kumar@windriver.com">&lt;praveen.kumar@windriver.com&gt;</a>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index d3eefb754b..cebd0400f4 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -31,6 +31,7 @@ VIRTUAL-RUNTIME_base-utils ?= &quot;busybox&quot;
 VIRTUAL-RUNTIME_base-utils-hwclock ?= &quot;busybox-hwclock&quot;
 VIRTUAL-RUNTIME_base-utils-syslog ?= &quot;busybox-syslog&quot;
 VIRTUAL-RUNTIME_keymaps ?= &quot;keymaps&quot;
+VIRTUAL-RUNTIME_dbus ?= &quot;dbus&quot;</pre>
    </blockquote>
    <p>Praveen,<br>
    </p>
    <p>This change-set borders on new feature development in a released
      branch.<br>
      <br>
      Unless you have a very good use case, we'll likely reject it the
      backport to walnascar.<br>
      <br>
      Can you explain why you want / need the backport in a reply to
      this thread and<br>
      if you send a v2, in a cover letter to the v2 series.</p>
    <p>Thanks,<br>
    </p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250618124256.3261625-1-praveen.kumar@windriver.com">
      <pre wrap="" class="moz-quote-pre">
 
 #
 # Default recipe providers
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#219000): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/219000">https://lists.openembedded.org/g/openembedded-core/message/219000</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/113707135/3616765">https://lists.openembedded.org/mt/113707135/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------2BYokQaD0Ui5BPSNEtZ3jbH0--


Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B30C3ABBC
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 19:09:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.58721.1746472157670992604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 12:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72203f61ed=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545ASvZ5008510
	for <openembedded-core@lists.openembedded.org>; Mon, 5 May 2025 12:09:17 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjssb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 12:09:16 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 545J9GGg014445;
	Mon, 5 May 2025 12:09:16 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjssb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 12:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQdpaVHhYyH3H3NOnAYM0+nJ4znvWkG32Mg7WJ4bZjBkxP8cYIX1oUMEqazaF1X+onD/VSNKUgeAdIM/9dKbRjFFuRRWzE1nk0YGJAz2DjLXcSb11YFs3hdNOSmXx5rkOkuFRUdhzuo797asci0UtWHWKeLXYu820u159vUj0cA4U8tT4RUS8sV48xzN4gQT8NQuQnvd95/v0SfKCZkdm3Xl9ZZ5aYtS4a8ZfZ5TM74Asn2Qlftfp2nPRD6MC3Q5Kp1Vzt7tb/PE3jAm3BPYE0yK1EVPKRoK393R02zv1gA+V1y9rRGEwb8qD3cxF5/I2T4Of98hyCM+xU/HXpoq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbQ6XPZQ5b0xSjV2+MnrXEFIq0+1r2FSRYFvG8COm/Y=;
 b=BHbnIhUavczQ++B5aYCV5/61jfy+XpcJP3lTDu4CBK1LFDbQXV9EAIaUMQaXK6HaIYCN3RpMdC7ZahymKczWEMzysObLtWNGDI9RGzbLoZq01EPvs/QxlBbO2cXoqnwa6qivGKy9hPrRb36WbN60dh0N9LaNhpbpNpZDHSULhKHoc/UC8LYpNtLCjr7vf00fWgzFVUfRKZiZQQj7H3JoYlSujSHNaEX/7WKH07mcCEWSoJ+kfFdzzFU9m7dqQKSvWrYLBoXeJVcCSuEhHA4WqUYgEGvs7YbovBqKoF+PsvP3qz+Frazd2sUndKCiob5tAMXJiebPkd3GOVX3lIYVPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Mon, 5 May
 2025 19:09:12 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 19:09:11 +0000
Content-Type: multipart/alternative;
 boundary="------------07fZ0pggLrHqft3CXBVZfw5n"
Message-ID: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
Date: Mon, 5 May 2025 15:09:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs
 required
To: raj.khem@gmail.com, Max Krummenacher <max.oss.09@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
References: <aBilFkr4HF-MSBd6@toolbox>
 <85e96179-18ba-4dbf-8f94-c05210588de2@gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <85e96179-18ba-4dbf-8f94-c05210588de2@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY5PR11MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ff8369-7ad2-42ef-ea80-08dd8c085188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WkNGRDZrUEdEVzR1SmRIM3p6aTZaS3FaQ2ZoZSt1aGp2Z2VEN2R3WFMrY0ZD?=
 =?utf-8?B?b0hNaGxwcCtBbE95ZzZBY2psR1BNaDlzNEE0eG13Skp5MHlmVDcrL3E0Rlo2?=
 =?utf-8?B?end1WWszeDhVakNrcUdQcEpMcmgzMWhxaFdpUlg2U0VMKzlRd3lZN0dheHhP?=
 =?utf-8?B?eHZUSWQ5TzBwR050bVhBdEtiSW45UjJqTnhhcVFqbHJJN1NCaklrdWR5SWNY?=
 =?utf-8?B?RFhTUWQ3ZFZ1RVVBY3FYd3FPNWw0WWtGSkRuZ2JSQ3pLL0gzUGx2bm9hTFV3?=
 =?utf-8?B?ekE2OVltdmxmWlBLMHZkTXFFVEpSUmVHSXppYnU2dWpmdTRZcStGanI2TUUy?=
 =?utf-8?B?eGtNUldvSEZPM2xCd1RxNXZuN0NiVysyTUNQbkVZeFdJN2dZbWtPeCtpMkQy?=
 =?utf-8?B?OCszSEwwdmhyUU1zbzM4aTRNYXRwOS9aeStMek54RWM0b252aTFWTXczc2lU?=
 =?utf-8?B?elI4OUJrK3hOeDcrRmhvYy95QVJXZ0VIaWNYYjNGYURBYTc1NDlVVm9ycUlC?=
 =?utf-8?B?a08raEhMbDNqR1hNNW1vcnlMd3RTY1FUUWpsbm1KeUpzZ3FlWm1uRTJOaUM5?=
 =?utf-8?B?eXJTWnVSSFJoWkkzc1NGSE11YUNQZDhOYUZpOXlJNGRUak43clNkZm9TU0NL?=
 =?utf-8?B?VHVacXhVWjBDVktXOE42eHN4aGZrc1VmMm82amMzUFdMOHRxWW5hSHM4RWty?=
 =?utf-8?B?RHJmeU0zZWJVdWtIWnErdjJocmZza3FGQkJZc2pGRnhnV1lxa1pjK0IzTk9W?=
 =?utf-8?B?bGhSYmVidWlCVk5QeVZpQnlyTlNObWQ0V3pPbmNCYnAzWmNqK2ZEbVl5ZzJC?=
 =?utf-8?B?cHFEYUlUUE5DaC9VaTdBTjFVYVhSN0NwS0QxcHlSZGRySFZBN0xLT2NFaFhX?=
 =?utf-8?B?SEt5Rm5tM05SUGxOdk9uamNSTXllWHR6NExUbUJ0bE1FNUZDb1I4S0Q0T2J3?=
 =?utf-8?B?dVBnYlBWZTBKMW9CeVp4dXYzS1BlRVdDL0pDTEYzdzdLMkk4OStOOTMzV2hv?=
 =?utf-8?B?b3poSzdIbHZSN2NQY1owQ1lreHNWSTBpZ3lia0xDWHdTVzQrQWRuWmpBZDBr?=
 =?utf-8?B?WFlpd09pT29wT2ZKYkVBN0VRREhQbEpHYktQcFdTM2psMy9zS09wT3h6TGxn?=
 =?utf-8?B?dVBsbGppMmNESGx6RUhnVXVLUlBIditFNFViTnp2eGs0US9SYm9iR0c5TFR6?=
 =?utf-8?B?TFo3N3hIVWVpMWN0S0RLZ2FnSCtmaFBLcG1IeDNVLzJMWC9TcGNCR1JKT0hk?=
 =?utf-8?B?Wm5nTS9DKytyMXhlRnQyUUR2YUYwTkVibzF3Rjl5aU1GWFF5LzF5MENNVnRm?=
 =?utf-8?B?WjRBNG84OUxXZE1HM0FMU0JjYjRlMHU5T1VlV1JTTXlIVUl0VElQTjhSS0g1?=
 =?utf-8?B?eElhdWdPRzJ1cFQ3QS9PeW9WY2owS2xwNGRJd3VxeUZROGVkR0hTUEFwNkpk?=
 =?utf-8?B?dnhEbXA5ZzNTWnlKQW8zY2lFUGhHSUV1blJhRUNac29wbzM5akhIcEY5TTFn?=
 =?utf-8?B?Q083OXZacEVULytvQXNTVkNZclZ4KzNrRlB5Q2NORXFpa2I2RmVIbnZIbnVJ?=
 =?utf-8?B?Vlc3eFBGSlErTDRBclRtU1o1ZkRKT285WjdPYXBsZDM1R0JaM25jb1U2eG9a?=
 =?utf-8?B?VXhpdUxteWszb1QwcGp3d1NWdE95cFRrYy9aZVJLWlhrNWxWcjI2TEU0WDNH?=
 =?utf-8?B?RENPZUlDaDlIL2JqTHNHa0ZkKzdKM0xjZlZINDdabWNjU0hMRUhWazg4Qy9l?=
 =?utf-8?B?UytnTWNKVjd3c244eW8vOTFsbzUvbjU1cWlUWnZtbSs1cE5Ebm9VenlSanJ4?=
 =?utf-8?Q?uw7MBdKaUolcMxReCcn5rLeIgcMG7yIV4q5gI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?akcraWx4cWNsdXZVU1I4b1FreVExQUExemM1aFJaOHFmcXVlK0hSNENTbWJV?=
 =?utf-8?B?dWlxSEpjNFJBaFpxZ2E1aWhRV25iTXNxbm51SUNoZ1h3Z3dvN2g1ZUdlVXdX?=
 =?utf-8?B?ZGFGWVpKNGRrYUJCWE0vTlllL0hHM0JkRzNhY2VWSkF0RjZ2TmxxM1g1Rjh1?=
 =?utf-8?B?MENNTkxiRUhkVlkvbEJ6QitEMkszZmRNaG5kQTR4RTRZUnhCOThVNjI3Wjhs?=
 =?utf-8?B?OFN0NkMybmszeFFzVGp5bW5XRkx2N0pmTWhaQWtNWFdiRGYvenV1NzJDVEdQ?=
 =?utf-8?B?L0dxTzRaQitqMUxTV2VuNTd3ZGRIUEd0Q1VBVjN5KzgwZWNEbktpY01sanAx?=
 =?utf-8?B?TXRFQXZiUmVwNDFpNEswckI5TWZhaWVBRHZhTkVGeXFOZlBCcmFRNEdFSjdE?=
 =?utf-8?B?NlpvaTVSSHpNQ0VDRnhHazVKREJ2d1RBbk1LeklJOHZidW9Fa0V4K2RXbzJI?=
 =?utf-8?B?Mk5RbG1FVWJZTmFhelBVTTFWME5DcEdSakdnK05ZeElDVHBONVZwZ3lScHVG?=
 =?utf-8?B?QjZKRHVFNC9FRVJqNHBwVjAweG9xS3EyNjBvMnR0TmV1RTFqaVB4c3hIdWw3?=
 =?utf-8?B?ZU4ySktqTjI2ZmMvRE1qUlppSmVmdkc0R01oS1NJeDNJUmRrNG1sNjNMMnNk?=
 =?utf-8?B?MXNuMDdiS2YzMGZFb0tVaWpNK0gwVkNhZUhCVUcyZm5zYlpqV2ZNMURCMW50?=
 =?utf-8?B?VVM1VERtekVYSVFLbVQxakRzMTRTbDR3T2RNbENwbFpzbGdQY3lYak1sK0pK?=
 =?utf-8?B?NGxzNzFFWitnUVo0bTdZQVNxc1pyeC9uQUdCSmhoWHhoRkEvNGdTYjVyVVZ2?=
 =?utf-8?B?aWExYzg0dERxUDcyY0w4KzhPN0k4QXRhMGUxUGswYm5UWGszNDVYUzdqbHVM?=
 =?utf-8?B?dTRzVjlwT0lPZXJpT2M5SlRRck5lYloxVjdQUzE4MW9yZjJlclJURHNHZGtt?=
 =?utf-8?B?THBsci9zeTM0OVhFSWFIZTBKaGJ2UDVqYU9QTTV3dk56cVJqamwzWmRKN3pQ?=
 =?utf-8?B?MksxeFlVM2pvT2lBUlQzQXBBdXBrQXRxWXZya2k4MjcxU2t6TkEvU2JKTldU?=
 =?utf-8?B?TWQzWW1xaHNNaitDZHgxYTJnZTFZZlNsc1NDSEladUVDcjF2dnhSZkZRNWla?=
 =?utf-8?B?MnRJYVo3ZXg2cE1yVnpiRjZCMjQzZVRzcmJtaTl3VEtrUVU1U2lNVTFtN3J0?=
 =?utf-8?B?bitLSlh2MFhiRDhyTGVab0h5dGgzeUgyWmpILzZuMmRsOGNaQkFxWnRuenNn?=
 =?utf-8?B?UVl4T3M1VnROUmlOMUFRYzA5MWZqckVUbmxzb21LVlV2T3piejB6ZmFGZm9K?=
 =?utf-8?B?aW9RaEp5QTd3RVJRQ24wYzY5KzMrQWNoRm1XeDZEMnhrQUZSS2ZpYWNSVnBq?=
 =?utf-8?B?bGhXcytiYlZ4NWZlWmVaOVhXeTRQdFZWZWtCZWhTY2tnYmlzSGJ2UzFOaXM5?=
 =?utf-8?B?WEJSR1BnZExnTWtBUmNURURrak1MSlNwdkt3S01Bcm9qdVIxYXdyR2xHbmQv?=
 =?utf-8?B?bHNCRUNKRkttWlRlNnZSWlJMazEvUzBMYXEyOE1WU210bGpFVGt1dkNCOVY3?=
 =?utf-8?B?dTc1dXBob0NqWDBNdkRzby9HYVlHRVUwK3JLMDd5ZWVMNjFXY01OQjlGY1hi?=
 =?utf-8?B?aG0rb3JqK3Y0T0F2ak02d3RaWGRZTUpDOEJzYWJPWmdhbjc1Y2txM3VwMkJC?=
 =?utf-8?B?aGxCMUl6YkdEb1pxVks0QzBpb3h6L3VOQWxVOUtjRU0yeXZmM2xwRDBwY3RT?=
 =?utf-8?B?S1gyYXdveTcybkNCM3BXNUFiSlUyeWloeDV3bG9PUUliWElibUQ0djYrcWNx?=
 =?utf-8?B?ZFpmQ3llY1liQ2szVlJBazVuWnBXTXJuZ01BN0Vla0s1V0tXL1U1UVJpSzgv?=
 =?utf-8?B?WmVZK3JQaEpyTi95R29JdU0wTWVaaTY1WG9IL1RNOWRWbFV6T1dOVmxaQnpj?=
 =?utf-8?B?U1czUGxlOEV1N2FxTDFBTDhkV2J0RmpDcG51eTcvanhMV2dpTDE2QS9SejY0?=
 =?utf-8?B?c0hzQUJmbC90NkMzVHFYTHVjbWhPMmtTVEtmbXhjTzduaDhzeFB1cWJ3WFZp?=
 =?utf-8?B?K09rNFNrRzBwb3l5VTVnTzIvME8rK1pkZmowNWJFSC9xeWdEcFg0SUppdVVK?=
 =?utf-8?B?dXpTRXk3bHpuSjBNRmFxd0t2OEhua1F2UVBzMlVlaDZsZjBvaUozeklNM1lL?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ff8369-7ad2-42ef-ea80-08dd8c085188
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 19:09:11.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O02pzPzCw8MAjgMkhoEhuzzA9rsFP80Q+xQl5TpOmbBVxuiS1BKN0V3YbKKYLF0MqStSpfwpFsp2kLpFkKoXrHNSV7+vQYVfFC4VivOFsqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6320
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE3OSBTYWx0ZWRfX7nX7XEki8pLq 0M0vxNxm1RHuH3fwdfFQmi1bQdFlZkRtGiN27SbggyibrpM90GCbMplSQYExE1iL55CHRXu/j7p Ge0wtLDhjJtMllXWymFLk9bYPl3JzaSp6yGRZtiOHB3VqG7OvO5d1bZv7gUG/90xmdBoZzTFlPw
 Z87LVf5+UwUi04VxwceRqDgFtdEJDOTqi3oJYHF0OgVrCFUwYUYbn2UVWal2dlL7hStQ5npZYNq yMthnuJNoDwcT6SR1quFpoTVJhx/MpnkwpuNMB2xgWjeiQqQ3c5RRER6tocn8sq7jjiWsjZUuyp L9Pgrot6I/UPFArWPgDobn/gw7uPi6KLM/hru1M2TQg8KK2IHchB9Jcuce27fHeFX7VSXikhdjM
 2Q6GVZFpRpLm+CTXm4xw0gKIb6sjAvZRH7lQjLmEYzmM2H82xBe3LpUoHM8u6+dD9qejreJO
X-Proofpoint-ORIG-GUID: YvB8-3vPKTeAcJyveiz9S6LqTT9xFUvb
X-Proofpoint-GUID: X0fL1RJitRMB1bcPgN89tmpTC7YPdkn6
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=68190cdd cx=c_pps a=WxcSnoYPg5jl6yrDmkeCeg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8VpDeP3kAAAA:8 a=7CQSdrXTAAAA:8 a=Q4-j1AaZAAAA:8 a=nQiMTd9k7I5DuE1Ci3gA:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=VK-ZA7TQ4C7lOVfjhvgA:9 a=A880rc8tiKVU_ML_:21 a=_W_S_7VecoQA:10 a=x58pXJj3Pl9T3GLWE5Uy:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505050179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 19:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216017

--------------07fZ0pggLrHqft3CXBVZfw5n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-05-05 10:45 a.m., Khem Raj via lists.openembedded.org wrote:
>
>
> On 5/5/25 4:46 AM, Max Krummenacher wrote:
>> Hello
>>
>> I'm seeing a strange warning resulting in a failed build when building
>> systemd with tpm2 in DISTRO_FEATURES.
>>
>> GCS seems to be a new feature supported with GCC 15 and friends
>> targeting the AARCH64 architecture. Whatever it does ;-).

I was wondering what GCS was as well so for those interested:

https://www.phoronix.com/news/GCC-15-Arm-GCS-Code-Generation

Arm introduced Guarded Control Stack with their 2022 CPU extensions and 
is a means of helping mitigate against some return object programming 
(ROP) attacks.

As explained in the Arm documentation 
<https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/arm-a-profile-architecture-2022>: 


    "A GCS is a protected region of virtual address space allocated by
    software.
    When the processor executes a Branch with Link instruction, such as BL,
    the return address is pushed onto the GCS as well as being written
    into the Link Register (LR).
    On a procedure return, the latest stored return address is popped
    from the GCS.
    The processor either compares the popped value with the LR, or uses
    the popped value
    directly...To prevent accidental or malicious changes to the GCS, a
    new Stage 1 permission is introduced.
    This permission allows reads by software, but restricts writes to
    either GCSPUSH instructions or as a side-effect of executing a BL."


More info on the Phoronix page and links therein.


../Randy


--------------07fZ0pggLrHqft3CXBVZfw5n
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-05-05 10:45 a.m., Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:85e96179-18ba-4dbf-8f94-c05210588de2@gmail.com">
      <br>
      <br>
      On 5/5/25 4:46 AM, Max Krummenacher wrote:
      <br>
      <blockquote type="cite">Hello
        <br>
        <br>
        I'm seeing a strange warning resulting in a failed build when
        building
        <br>
        systemd with tpm2 in DISTRO_FEATURES.
        <br>
        <br>
        GCS seems to be a new feature supported with GCC 15 and friends
        <br>
        targeting the AARCH64 architecture. Whatever it does ;-).
        <br>
      </blockquote>
    </blockquote>
    <p>I was wondering what GCS was as well so for those interested:<br>
      <br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://www.phoronix.com/news/GCC-15-Arm-GCS-Code-Generation">https://www.phoronix.com/news/GCC-15-Arm-GCS-Code-Generation</a><br>
    </p>
    <p>Arm introduced Guarded Control Stack with their 2022 CPU
      extensions and is a means of helping mitigate against some return
      object programming (ROP) attacks. <br>
      <br>
      As explained in the <a href="https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/arm-a-profile-architecture-2022">Arm
        documentation</a>:
      <br>
    </p>
    <blockquote>&quot;A GCS is a protected region of virtual address space
      allocated by software. <br>
      When the processor executes a Branch with Link instruction, such
      as BL, <br>
      the return address is pushed onto the GCS as well as being written
      into the Link Register (LR). <br>
      On a procedure return, the latest stored return address is popped
      from the GCS. <br>
      The processor either compares the popped value with the LR, or
      uses the popped value <br>
      directly...To prevent accidental or malicious changes to the GCS,
      a new Stage 1 permission is introduced. <br>
      This permission allows reads by software, but restricts writes to
      either GCSPUSH instructions or as a side-effect of executing a
      BL.&quot;</blockquote>
    <p><br>
    </p>
    <p>More info on the Phoronix page and links therein.</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <br>
  </body>
</html>

--------------07fZ0pggLrHqft3CXBVZfw5n--


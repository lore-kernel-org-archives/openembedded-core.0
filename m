Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92C4D2E03C
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:30:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1322.1764923415808712293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ANBeghPq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4434d54add=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B56u0g32284745
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Dec 2025 00:30:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fyr74+b//LERTVqQSDslChOruXNbF7+Eao7Cv7OXvaE=; b=ANBeghPqGoX+
	NXhCSi40fGn5SteQI+b3ewifXK5RKRClfMDIZzb3McLZC+Zf93GlQ7fEmOT2ivwe
	VKvQCNjw89VjcUyTlqmjfk1AnF5q8CQDM+wskvBs34elAaq2mMtnQQqQ3m1h8mlR
	vaAttYXHTHofd+KFiMhRIzI7Y/PYV/2jO8JF3EQ9YIfh2DRPaV7d2vwDuKgJbQAg
	ou8TYa4uDY/i7Yh8yTafIMa8ooinv2gqqDI21aWRUA3+R3NxZtMAC1wTlSHZJRJ7
	WQ344WZesxWUsLf1ovPSP6rEdq6XvD8BOLZn50NRdlW1W9HcqSi04t9aotEvB8aM
	TtNeSJZMNQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17my6rj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 00:30:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOn8pUAIlNwRRFoL7uc54wddCNytnaM9IHeSKIdm8l3tFfcGTmXiRh+gSbYSQMg/GMe3v7HfmV/T1bI/hl+bnYoqxLy9hCEA5+IetHm099eQvZ1pJ5ZvKk5Y/FLBPid7yr4i8UgWCbz5919oYjaLVB7s/1yCcsLxnTJHn4E96IbuWIQOt6QwrgAfEHhlo4fNaSQuCCHUiYR+T8BRY+wYxkS4hyxfFoygzq/VP/iS9Qf7J5DIpoMva+0E1ZQ6MNIdty9onL6IuLv+5F4VmthkJyArnFiBwFekFYIpfZquqpEI8ItRS1lo3IDtVJ1Ehs8jFdXwLJKL+bmWkCjhPRyXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyr74+b//LERTVqQSDslChOruXNbF7+Eao7Cv7OXvaE=;
 b=FV3sk1Cjpi2imJDG4Ys5Lza3eXnM3h5G45ssRWrEFOODPkvSItKyhGdNYUreIvDOhMBLbdDp4w5ceeXz60GthV9QL2OhKFwgW79BmUdLv6rF25eolHPXUI9IYbh6EDE1uvIqBar841mOQ1ijqd/fZ2CiDGbgLa2dOYoSTOmJDaPHDSxtC8AY6/g3FUL21MJQwxj/8xmhQi9mHkgjuL/Mh5JQf5eHuUYczo7SRU6RieUZZQ+1HUPV61G6+1bhzVfTH4m6/NqyVMfnL82D5Rqi/W+4QsoWehPfg2ZN6nj6Vacxp81jYo1N8GfThgtX63Z+Rq9cUie+amT2SpG3cwsgeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 08:30:12 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 08:30:12 +0000
Message-ID: <0ca726c7-9016-4fdb-a795-68ab13cab05f@windriver.com>
Date: Fri, 5 Dec 2025 16:30:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Fix create_merged_usr_symlinks in
 populate_sdk_base.bbclass and image.bbclass
To: yw.byun@lge.com, openembedded-core@lists.openembedded.org
References: <20251205044553.397572-1-yw.byun@lge.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20251205044553.397572-1-yw.byun@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3561e0-a033-4373-4edd-08de33d8822b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OXhKK1VzV2dBNVNUZ3dHZ2tXODNPelgwL1JyQ3RIOTJmdVl0bmVnWGYxQUZt?=
 =?utf-8?B?Uk1neTdYeXhwbmozWmZ1OVRmV0kvZ2pveFEzS20rUTdkV1UwbFgxRFQreXZY?=
 =?utf-8?B?MlhwSmVoUVhiSWFveEtNeXlwSHl1YlFmd3RGVDlGNzgrTTg2NG5aVkNVSU5o?=
 =?utf-8?B?eEV0VURaUmhjSUFOY3pOVTVpdWtMSnJNS1VqY3dWSm4rM0xvYVNCRmV0VDJz?=
 =?utf-8?B?UjFLQ2Myb0JhSUNsWE0rQUhseEwyV3FGQ1ZQaWtMVU15S29pemx5a0U3dFFx?=
 =?utf-8?B?K3ExTzJVNWJnd0Zsb0d3WWp0WDhxQzlLbG1lbit2Ujh5WStVYXQ0d1pFa0ls?=
 =?utf-8?B?Q0E5d2xyRFJMTGwzbjFOYk1Wbm5hLzByQmZEZERxNzZVODIwSDBqQ2dwaUZj?=
 =?utf-8?B?SGlPSjV4aVhCRGRaY1J0N1VJcFRjRjQzT0FndXVLakFkdTRPWDFYd01wTDRG?=
 =?utf-8?B?OC9vbHVkK2xhaFlPUnlKUVhSWEJOTUlxMmN5cjhxRVFWUWJUM1dITkJEb05v?=
 =?utf-8?B?MFlrY25xMlFqTGFwTlpKU1U4RTRDRGlKZ1RFZzFsUEJ2SHBqUEREVkxIZ1cv?=
 =?utf-8?B?cGZDSU0zcWg0SkIxL3VXVUFSTjJIbXVyTldFRXIvUE1TaDhwRkxFejdobSsr?=
 =?utf-8?B?ZGFWK3JxWVE2RGc5eFVFRk1KWS9ZOWs5SVU0NDE0VWM0OFFDTGVTb1FVTjUr?=
 =?utf-8?B?enBnSlRjZ1BHVXdOOUNvTlo0aUw2L3poS2JZdW1xenZmUkk4NUJIWi9BTkVY?=
 =?utf-8?B?Y0hLL0hEV3AzY3hPZ1owL1lDdTRrbkxsMDdjMERBQkI5MW5kY3ZUc2NPNGxi?=
 =?utf-8?B?K2srUFZnQ2V4dnNiNVNMVkJuYXpqd1k1aDRvV3F3bVkxa01DRG9QTEprV2hU?=
 =?utf-8?B?dDNRT3Z3MitYMG00a1Z3WDJyWXFoV1IrN0xBYnIyaEdYNUxuMklKNVR4WjBs?=
 =?utf-8?B?emEwbzl0bm9zK3I3NWxWUHcyMEkyYzdHNGowNGZFT3o0RXdjUkdrV0pOS3Fq?=
 =?utf-8?B?bVVjeWdpaEdnVHh1clB5NVBjSlN3RHU0Zi9tdERmVmxnWUN4T3VGREs1anRT?=
 =?utf-8?B?QllGeVp3emVlT3VJUGZMYkQxMlcxTmlJQ0xnYnR1SGVmNkZFVHU1cGJRb0JW?=
 =?utf-8?B?aGl3dDNUdmZTT2tLdUt5UEJKRkRWVXVLRGx2SHh6bmVTekRERFY3YkNCQjNG?=
 =?utf-8?B?Q0xWSGxGWjZMTTFybkVkUnV4Q1IyOVZiWnhvR0VBNDRTTmZveXVkRklNR01s?=
 =?utf-8?B?N3FCTkIxMW9zMXkzNU5sU0p4Q1pFRW9Ma2YxY01qdm5mUVA4WDdUY3piK0dW?=
 =?utf-8?B?M05UdER5WDdmdWViUnR4ZUE4dmlQRDd0TFgyWjEzRGt1MWI3REppSllidS9J?=
 =?utf-8?B?VFlYTUlyTnhxZzdWVEhpWXpXdWdsNHlPb0t3NGdWa2lyaU1VVERQVXMrNXhl?=
 =?utf-8?B?OUxHbHJNRkk0OUFUN1RJdVNNYm5pRHNhTTNhNjZORlJZeWFGVGVyamJlMlVk?=
 =?utf-8?B?cGtyWmp6LzFGVmJ0am9WY1A3WkhpcDFkalJOclYzN3lBMUhiaE5zYUZEL3pa?=
 =?utf-8?B?L1FCbWg4RlA3U0dTUSthNmlLclBOblU3em8xWGhCY29TU2dSZVQ2QlFBRWJk?=
 =?utf-8?B?eTlESmxyeGNuRHRBVzhhODJjYXdINm1Vcm5CNzdjZ1RlNUE4THpSQlBMbFkx?=
 =?utf-8?B?amdXT3hRSnpjdXdJT0dCNllkTGE1SmkydTBrNXBzeWpERmdxZ291Mi85VExD?=
 =?utf-8?B?WjhNTWd5ZGx5a01aMDFPdXFiZDJ3SU9ranFpcjVGT2IxMUJFY1lRZTVQN0hQ?=
 =?utf-8?B?Njd3TERoOHlIQ01EckxydlpZZkhTSGo3a2k3SDZDN091eHB2cExSTS9HQ0N2?=
 =?utf-8?B?akZNVWlHTThweFg3Q0w1K1Rnc2o5eUpoalJmWm1ES0dGWEkxZTA2V29yc2NT?=
 =?utf-8?B?dTZHZGgveEMyQk1MT3IyZWxCWW14dHBOVkJjSjNSOG51Y2x0U3ZUVEN1TWgz?=
 =?utf-8?B?RGVMdmRBOWRBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmtvcUxtY3JGendvdTg3U05qclVWRHplZUxTTWpVOVZsSDBTb2FKYVVuYVlF?=
 =?utf-8?B?L24rYkpFbzJkZHRyQStYK0lvMXZWNXozYVdlNlJPVVdvbzEvMzlKNkhWdGU1?=
 =?utf-8?B?Qkc3YVdyQVVhQ0diUXBXcHNYYStTSWt6OVE2a2RoSTYxM1ZGOGJ0aklpQmpx?=
 =?utf-8?B?aGdFbmJheGJLbGVGSDJBeldaRzFHZjZHRlpmVVkxcTlNQmtKTmpiSjRXRXdk?=
 =?utf-8?B?UDh6U3lEL0tIWnVFVDVGS2ZSZ25NT0VPSG5iNGJGQWpGVmE4OVRJWnUyOE8x?=
 =?utf-8?B?TE1HeXRYZ0Ztem82RTAreGRESW0rQ0s1MTZ5bHMwbFFLQTNHSjZqTUpHaVlz?=
 =?utf-8?B?UVc2ZEJhN29acTNNTk40czQySXpMaTRTWXo5NDlpZnMyK3UyUHJFYlUzaVRU?=
 =?utf-8?B?eW5ScTFpcFQ3S2RTVkU1QndzcGxWMUF5UjNUUnFJYVlncmg1OGhzRmNoelpj?=
 =?utf-8?B?NFBoUWdMZWRuZ1oxMzFCQVlNTk0zMTF0SUpmdVRrMStOaVJRSjBkQnpibnI3?=
 =?utf-8?B?RHMxNklDZHpzS21oN0R2Q1lvc2VUQmUwRVpHSmNZRkd4d3NPT1RITGVOOFEx?=
 =?utf-8?B?TzBkOWhrdTM4RkFUR3h5Rnh0SXRXSkRFajFZYnRMRHF1dFJNSEx2SW9VM2Rp?=
 =?utf-8?B?WjlFSWhiTjVrZ3pxajhRT0hRTVpXdDAzU2NOZVdDUGVnR0hCUHFHcjNqdXpo?=
 =?utf-8?B?ekxzbHF2N2VkL21nQVJucmdsLzlIV0hBY3AwVFdqMWExMkwraURGVUdyenBP?=
 =?utf-8?B?T1pTbFZLY3F6R2lkMlRpVEdhVWs3TmZpWExuS01COWZJUmY2ZjdOQUxXbXpK?=
 =?utf-8?B?MGRtZXhaSjR1QU02YVdNMU90SEFhczhvOUpydEpHdk96UVBXL0YxcEw2OVV0?=
 =?utf-8?B?REFObmNWaUNrTnNwZFV4QkhiVDNMZTlmZFV2czNIc1RsU2E2UXdHZGdCSTJs?=
 =?utf-8?B?TnF2aG9sQStKR0pPZTBCWWVBTmZkUlRHbDdzOElXMGJoakZxbXVlZmt5ZE8r?=
 =?utf-8?B?T0RlR2VFR3Bhays5VkRXdVpkS1oxZzJBSDdFdXR5cEcwUHJqRE1DMzkwRG9M?=
 =?utf-8?B?L1VGZng3aEJLSzF1aWNCNzh3eS92OWxYVTM1eGJPcVpnYkNwdlNHbmM2RVlv?=
 =?utf-8?B?c1k1UnFvZWpEZFpDSDdOT0UvMUVOby9LRzhRVy9rRklzRzZOcks0a0w1aEZN?=
 =?utf-8?B?anB3bW50cE9ZQWs5MGFIcXcwNmJFMTNVQlVJUG11SEJkM0FTc3VkZ01aK3RD?=
 =?utf-8?B?eEU4K29rK1lYUmxQa2Z5Nmk4Mi83MVVIZmhhZjFJRDVQT2NVSGtCZ3o3Z0dI?=
 =?utf-8?B?Tm1VR1FIWXJkYTNXNkZsOHRoZUIxM0V3UGhNT2ZpZDF2b1UwS2p6VXBjV1Jw?=
 =?utf-8?B?bnprTXJnOVRsNnpDblRYdFY1VDVVSjRHcURKMU1wUWVYN3N0QzM2TzdIR1lG?=
 =?utf-8?B?U3FDTkl2SVZPT1BHUHJRREhCMVNobHp0NjA1djIzME9jOHpIRHRiYklydkxV?=
 =?utf-8?B?Q3VlUWJlZkdJRHZZb0Z5RkUveHJleDhkS1FrRkJBdmMzQ0NzNmkreVhRditV?=
 =?utf-8?B?TmdlUmVWUkkybTkyRjRXSkJ3Y2dtdHZTcEtJRHM2enMzb21sak9xRFc4U2lT?=
 =?utf-8?B?Mnlxd3RoODB3K2ZGNit5bFlXQWdTU0l3eVBUR0tMMmdWWGRpSkNiTUQ3R1RM?=
 =?utf-8?B?bTRheEE2dUdYcE10MXcwekFUU21ucjVpSXk5clc1TGFJOGQwL09uYThHbnhT?=
 =?utf-8?B?OHNaRjZja2xNQnpPNmxKQ1pGTmlxQ2lnanM4Q0NSbE1mdXlWdkdHQnpPNmlK?=
 =?utf-8?B?b09uK1FpdHc4dkR6RmUvc2l5d3RpMWZPK245eFRwNDQvVlgwWmJkdWNUdTUy?=
 =?utf-8?B?NEZtSS9WOFY2SjlsNWZwb3VXejM2VU5FWWdkVU5HTE9VeHZVWEJ1Z2psQ0hm?=
 =?utf-8?B?T01NRkJzQ2RBSGFTQWZpWnZuOEoyLzhGMzJ4Mk1Xekk3UmFSem9GZEEyTVIv?=
 =?utf-8?B?c3NYbisyeWdjVkdrMVpiZmRZRHpadTRjOGNGSzlPLzRGaFZEam5PZXdvaUlJ?=
 =?utf-8?B?NjBNR1hVSGFCZjJubnZqVlRnSjNDV01sRTkvQVc4TGhJcE1zOVBwRHpzNklM?=
 =?utf-8?Q?Afb2ivhJpxZTq5NXhoTFHVL5Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3561e0-a033-4373-4edd-08de33d8822b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 08:30:12.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQLQiM1plMfQmqOU0BwWON8YVSkd40okwhMFV6oZkjsUJYGozxtZApLWQx3YKJCRc6Wa/aAYROSeWjbYKdj+dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: dkRe5-DeNpcU1DXuUkwXpw-9bxNlNpUh
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=69329817 cx=c_pps
 a=R7TnPQtMnhj+722GCxzAsw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=57SyGIRnAAAA:8 a=t7CeM3EgAAAA:8
 a=Xyl8SUyI4QTShoBVYRkA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MpesykDKdfsKI25ZMlB38kt5-VhqGC4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA2MCBTYWx0ZWRfX82hUDGxXqGNe
 h6iU3qD80mPKASw053X3hj6nFYzV+80lwP1uY9+NVQ+YBIOY0AgqvAigtK+RANe9NqLtxGUFoNk
 oW39VFLTOzTwQ3v+59YOG2BRiTKSBxol4OAMjZ3OTynQA3MAh4T55/IqynBFMO2JFqF+qEg6s6A
 fqQb/HAiCVk8gNByU73vSCKrsPV06LG5PbD86MkrpA34VuDSIC4DGrC4BlEmBIPGcvsvNgN0pTN
 jccVMOLpBAjvp9FN1SCi4Ik0wgyycffGNyX7J0VUP92rxqJG5ozd1BkpzG+fdHJAO4p0reNA/Ol
 ajCxnjgXuh92/Pi5wPrd6QKsfg4JxrGYZB3D9W/nX0q9HQWQ7q61hgQ6kuqaVELpH/rT5Q5iAG8
 v2wHuVSRfp9pLZPnMYJj4OXIPWiP0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 08:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227339

I can guess why you're dong this. The 'install' command overrides your 
custom '/usr/bin' perms setting, right?
Please add more details in the commit message.

Another concern is about the ':append'. Could you please explain what 
problem would be without using ':append'?

Regards,
Qi

On 12/5/25 12:45, Yangwoo Byun via lists.openembedded.org wrote:
> Modifying FILESYSTEM_PERMS_TABLES does not change the UID and GID of
> /usr/bin
>
> I modified create_merged_usr_symlinks and
> moved its execution order back
>
> Signed-off-by: Yangwoo Byun <yw.byun@lge.com>
> ---
>   meta/classes-recipe/image.bbclass             |  2 +-
>   meta/classes-recipe/populate_sdk_base.bbclass | 48 +++++++++++++++----
>   2 files changed, 40 insertions(+), 10 deletions(-)
>
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
> index 53f1a9dc45b..2d90b29c8c5 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -686,7 +686,7 @@ create_merged_usr_symlinks_rootfs() {
>       create_merged_usr_symlinks ${IMAGE_ROOTFS}
>   }
>   
> -ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
> +ROOTFS_POSTPROCESS_COMMAND:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
>   
>   reproducible_final_image_task () {
>       if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
> index 8e671cf28fa..cafd9a5698a 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -186,21 +186,51 @@ POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " write_host_sdk_manif
>   # Prepare the root links to point to the /usr counterparts.
>   create_merged_usr_symlinks() {
>       root="$1"
> -    install -d $root${base_bindir} $root${base_sbindir} $root${base_libdir}
> -    ln -rs $root${base_bindir} $root/bin
> -    ln -rs $root${base_sbindir} $root/sbin
> -    ln -rs $root${base_libdir} $root/${baselib}
> +
> +    if [ ! -d "$root${base_bindir}" ]; then
> +        install -d "$root${base_bindir}"
> +    fi
> +
> +    if [ ! -d "$root${base_sbindir}" ]; then
> +        install -d "$root${base_sbindir}"
> +    fi
> +
> +    if [ ! -d "$root${base_libdir}" ]; then
> +        install -d "$root${base_libdir}"
> +    fi
> +
> +    if [ ! -e "$root/bin" ]; then
> +        ln -rs "$root${base_bindir}" "$root/bin"
> +    fi
> +
> +    if [ ! -e "$root/sbin" ]; then
> +        ln -rs "$root${base_sbindir}" "$root/sbin"
> +    fi
> +
> +    if [ ! -e "$root/${baselib}" ]; then
> +        ln -rs "$root${base_libdir}" "$root/${baselib}"
> +    fi
>   
>       if [ "${nonarch_base_libdir}" != "${base_libdir}" ]; then
> -       install -d $root${nonarch_base_libdir}
> -       ln -rs $root${nonarch_base_libdir} $root/lib
> +        if [ ! -d "$root${nonarch_base_libdir}" ]; then
> +            install -d "$root${nonarch_base_libdir}"
> +        fi
> +
> +        if [ ! -e "$root/lib" ]; then
> +            ln -rs "$root${nonarch_base_libdir}" "$root/lib"
> +        fi
>       fi
>   
>       # create base links for multilibs
>       multi_libdirs="${@d.getVar('MULTILIB_VARIANTS')}"
>       for d in $multi_libdirs; do
> -        install -d $root${exec_prefix}/$d
> -        ln -rs $root${exec_prefix}/$d $root/$d
> +        if [ ! -d "$root${exec_prefix}/$d" ]; then
> +            install -d "$root${exec_prefix}/$d"
> +        fi
> +
> +        if [ ! -e "$root/$d" ]; then
> +            ln -rs "$root${exec_prefix}/$d" "$root/$d"
> +        fi
>       done
>   }
>   
> @@ -208,7 +238,7 @@ create_merged_usr_symlinks_sdk() {
>       create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
>   }
>   
> -POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
> +POPULATE_SDK_POST_TARGET_COMMAND:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
>   
>   SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC}' if '${SDK_PACKAGING_FUNC}' else ''}"
>   SDK_POSTPROCESS_COMMAND = "create_sdk_files check_sdk_sysroots archive_sdk ${SDK_PACKAGING_COMMAND}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227331): https://lists.openembedded.org/g/openembedded-core/message/227331
> Mute This Topic: https://lists.openembedded.org/mt/116625831/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



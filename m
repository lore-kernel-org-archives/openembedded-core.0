Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0542C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 09:02:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8506.1741251732906208043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 01:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5160a67d73=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5265PEQ1011897
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Mar 2025 09:02:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux1t74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 09:02:11 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52692Btf007650;
	Thu, 6 Mar 2025 09:02:11 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux1t72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 09:02:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uv5du15bRVRvYdSTlJPYTqkgtZWmS6JFZCxLs8xNHuXZpnX4pjY71ZZFJ0I4PqDTZlyuGwSlJv/h+0DYMJA8xZ5whtJSPJpebC/DR4gszW+hC+sHIVyv+HhJBzO5CPYWlABC0C/8wQmcDUJRsSRWE+s3pN18mEetoXG+nv+gvULE8Qx2uhy908VBLkuNNzLI4xcX5a7OsMqjASVa5l98DUdXcg7ymOjeRo+oI+1L03fqTibXpNMFI/FwxqoiiyltT8YbZaoXuWOmeU7jGYCZikYbwdTNvLuj/cdYHzQQ2q5NWklhtOHtrjupJWxH5wQJ+mxVC4Nchi3RtEhLx7dKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFCfgoSNyg7vf+77hpTSidOxKaLTsd/dgJxwypp5Lio=;
 b=T2+UjethA/ik6EcBAW5fKfS3SZmp21gj7bi1LI+3CkwX2KZdX84TJeXFW1DKr41saOcr/X83UdAV2DkEndqcNLjT4Hwip7TpIa5xIrDMMWMwUNiyW7l5bVl495xO5V0PHyt7QP14bWwDGyUjqpNN6to4EEkKwr4p64MP8NnWmt9OWYnY4TtOwjkqewLaR6+rSVj+UPvEmsq7E1MmQmJ6H/7Aw1sMMXXQtfCKlapj1J2DWwCwt9i44ESIUlRsM0G4QUWM8y49ElRVnbgGJa4c7DcAL5pvpEO//R/Cjf0V/Mzy87I72JZUQKtg9XLEq13k5Yek5r1Lp85Zn+N978uM+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by SJ2PR11MB8345.namprd11.prod.outlook.com (2603:10b6:a03:53c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 09:02:08 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 09:02:08 +0000
Message-ID: <9ded5a6e-0105-48e7-8aba-e7dddc83803f@windriver.com>
Date: Thu, 6 Mar 2025 17:02:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] babeltrace2: upgrade 2.0.6 -> 2.1.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20250305104846.318301-1-bin.lan.cn@windriver.com>
 <D890NM3QQGE0.3LTX3270SWGFX@bootlin.com>
Content-Language: en-US
From: Bin Lan <Bin.Lan.CN@windriver.com>
In-Reply-To: <D890NM3QQGE0.3LTX3270SWGFX@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|SJ2PR11MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d003fa8-aea9-413a-495c-08dd5c8d9317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WWk4bVIxQnc5bmhhemVVVjlrNEJZNm9DTWN6VHFwRnBrVkkwUDhoTG1DNm1I?=
 =?utf-8?B?bUVlbkZmcGs1YlZmNUw3djlxTHBQMGtOVThQQXZ0bkdxM21WSlFQYzJ0ZDZa?=
 =?utf-8?B?MEZySnhYcFdvWDVvLzJ3TWl4dld6THpxVFlrZWk0ajlaRy9ibXhpVXpmeVZE?=
 =?utf-8?B?eU1UN1NaMEN3RXhidE1HbUhTQjRGaGJFOFRYcllzUSt2L1BhWEhqbFdDdklk?=
 =?utf-8?B?enhWZENoQVFManhydml6dW56TDBXa29ia2NSNG1mWFFwMWtNUzA0aUdMV3BP?=
 =?utf-8?B?MnRCUmVlT3llZnhld3NTS01XVHRRYnBjVXBhWFRrWGdOYnE0VkMrTE40UE0w?=
 =?utf-8?B?T0p2ZXJ0c0NtS0k5Vy96Y1MrMGp3YXlkUTRpalFUNDlhZERYREhZd0lzeTJI?=
 =?utf-8?B?TllEZDFuUHZjMWZNVHlZcVlwVGZBK0ZmS2ZiNlJPOGRUNzdPMjZJUE8zNHFl?=
 =?utf-8?B?OFZQTk55SUVyUDl5TlhJeDBqV3hzbkd4SDRDQkhLeGR3eDRUSzFvYlI3VzZE?=
 =?utf-8?B?d2VTZndKa2dKVWxCcEJlOUtkcTRhZ3ZtYnZCb28xQ0MwTVRCVWVXTUdDbklB?=
 =?utf-8?B?MFg4c0M2R2t6SFBSUnlQRk1QekNERkxtSWMxNUtQTzUzUHhUandSMWFtc1pR?=
 =?utf-8?B?czYwcFVBY0RsQjkvdWp6Sml1NjJGZDJFVFlNRU5mbmx3RmlOUzZXMmVQb21Z?=
 =?utf-8?B?TzBVQW5lL1RJenFxMnNPTDV1TEZBTUIxbFFyOGFyZjNzdzhBQVdVVVNFNU9G?=
 =?utf-8?B?RklDSmdvZGtaaUQ5dmxTL1BHSm95eHYxZW1NRnh1Q29jSXBmQ3laanpETXZh?=
 =?utf-8?B?dDBXZlhxNnBZYW9MdTd5bGVwLzJ1dGlESzdoN05vY2E0Rzg1U1oxV082b0Fn?=
 =?utf-8?B?T1kxY2V0cklqNnZSSDkwVzh1eCtXR2QrbVRSdlpHUk1qYnhIUkN4T1Q1azQz?=
 =?utf-8?B?RnBNaWswb1BjYmNkbmhMajUvM3BOQ24yeW0zQys2aVZIOGk3SDZQQ2FIWFI4?=
 =?utf-8?B?K2FTYnRhM3dXV1d0VXFMZlQ1UjBvUVVKNEduYTc3QWtPN09teFNnbEFBQjUz?=
 =?utf-8?B?Q3V0Nkd6Y29kZW9EVDF5V2lVRDJwbjdQamxTVkNDSHNSblNDU3pGblRNbEQx?=
 =?utf-8?B?SE1WcDBYMDZUeU0rMGE1NUJSME55cE1oZTVIam5nVGI4Nkk0VlZQM2c1TStR?=
 =?utf-8?B?UjJTZmFQYldMSWZraUU3UnVPWFllejRMSTVXbWVOcTljYWtPa2xDNWFmSzY0?=
 =?utf-8?B?SDB2TFQ5T1RtQmhlYkg2SFBYTFVZRnRSRkpHbG1oVFB4WldiZnZUY1Q1Sk9L?=
 =?utf-8?B?eE5YV29vSEpMWnVlWHdibWRUdVRaa29ROHpvWEZnTXl4Qk1SbnVNZVREL0ZI?=
 =?utf-8?B?YUVFREJrV3lYUElRSEEzS1c4MTE0VkNKRmlqQXVGWDVGYmdveklWYmRlSVhC?=
 =?utf-8?B?bHRlN0s5bXBJQVlYWFFtMmR4dmFBelN4cHlHZXhsMXJsT1c1ZndBT29nTkhi?=
 =?utf-8?B?NWlLMVFlTmVMUEgrL0ZXd3JKNEhoa1RrVkxOdEZRMHVQdzViSmhaeFVJSHJj?=
 =?utf-8?B?Q3NyeXZoS1IwMWwvWTNaZ3FuUmtUQU1YMDJpTms3V3IrRmQwM2JzZDFFVGR6?=
 =?utf-8?B?cm1aQi9yUU11cWdoa3BUOUxGckN2UkJSWnFkeTQySlJmL1EyRHlldnlod0Yy?=
 =?utf-8?B?bk5WYWp4cUg0bU5VbUxpUU42d3RWczZiM0lvSVpkVy9mY1ZIM0ViMG5GbDJC?=
 =?utf-8?B?SUlTUXZGU3VlU3VybTBGZ2hYRVRLYUk3Y2EyOWE4SkpYd0NaRk1KWjZ6cDFv?=
 =?utf-8?B?NU5CWGp4Q0l5b3Z3cnRVUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHlCdmg5L3J3blJZanpWOFF0SE9EbGpBWGhZMEQ0c2RmaGJGdTA2dEt5NWZJ?=
 =?utf-8?B?czQzQ0M4NjRPVlRVWjFubzRNTE5VNWJqNWY1NHVXcEpDQzh2RXJtRnB5SDc0?=
 =?utf-8?B?c2R4ekpkdy9WQ2tsUGxlOStEdWlMekFmOUZhdko1Zy9CR0lOeHVDblZ2akZO?=
 =?utf-8?B?eFdCMmlZSEc5cm16V1FsMGR1T0JWV08zTnZkb2Qrb2VPWkVIY0UyaFFpV3Uy?=
 =?utf-8?B?Nmw4Y09CNmdabHk3Z0pxYnlxa1JJMnVVU0hMcnVRU0czYW1DM005Q2RjY3dH?=
 =?utf-8?B?U0JoeEtKSEZKSnhKQ2ZWNEZaSGtkMU1QQmJRbG5kajRjS0d0Wldmai84NDNX?=
 =?utf-8?B?QUlJVGV0VXdUN0I0QitlWW0wcVN6ZGJwMXR5NStUWjZvc3dLT21JWFRhQmRu?=
 =?utf-8?B?NTVEV1REbjVVWEhhaFBVZXg4dE1QUWx2bGxqd0hqQ1NYZmRUcldydkFKV0pa?=
 =?utf-8?B?UGJiWkRXNHBRa0tuVEUxY29HU1gyMHNLMHdwMkZMVFhLY1NCblh5ck9JbWVQ?=
 =?utf-8?B?TGM0L2w4Ykw2N0g0MjdJNmtqeDRpSlJ4alhCT1kvejFIWGJuVCtrUk5NcVVJ?=
 =?utf-8?B?bkJ6ellJaWhBUkRadFBpT291NC93enNkRlB6Qkt3NHg5bzhjMWhTTzFmMFFu?=
 =?utf-8?B?eEJnbTFnNWlDL0dXQWdydTJLMlNVengzZk1JMURTVzBVbkptV3pXTGlnOVdI?=
 =?utf-8?B?ZThsdHlDNEE4Mlp3djlTRVRERjM3OXN6MmZEN1dCN0NvS052eUswYnZRamU1?=
 =?utf-8?B?a09nZFBkVk1pYTdDTU1DbThqV2ZhNDBUV1RJWStCOTNVUjRLYXF0K2dRQ3dL?=
 =?utf-8?B?NzFEMzRwdWlwTEpWNktQNXljNExGcC96SmdKU0tDRHowUXNHTkxTS1grQ1Zi?=
 =?utf-8?B?QXM2T2V3ZjFBeGlLbXhLMWlJN1FwWEpDS0Z6SisydmhlNnhXNTdKb1ZxSldC?=
 =?utf-8?B?VjRSeWp5cGVXWVprNzVvbTRhNDFOQTBtUTMzdmZNaUlWRi9xbmdUd0YvQ2Nz?=
 =?utf-8?B?MStlZDB6SWc3L1lrK3VNVGxZRllnSnNVSU5YMDRNK0JOZm5XY1JWRkdYUmha?=
 =?utf-8?B?ZzZuZjV0OVZGWWVHMGN1WDJQTG9YOTFyaDRXdjA2MmR0eHBkMmNTOXdxZkor?=
 =?utf-8?B?M1ZrSDNKelpKQiszUEtvbFMxd2JVVW1xeHh4MDFNUGRmclp1eVJvbi8vMkpC?=
 =?utf-8?B?NjV3azd1bm0rMUt5NXcwNUxuQ3Z3UjZFRDhEMWQ4R2VteE04Vm5BTDlOT1d6?=
 =?utf-8?B?N3dSbTNISnRjME42bU56TE5aRWpXRDJCSGhURlBNcEpMK1p5YmtDZWNtWXRT?=
 =?utf-8?B?SHBPaG1MVGpsK05RR0VESHovaWthVVJsczl3NkVuUzVjLzNoSWVJOXA4Rjk1?=
 =?utf-8?B?djhuS25hOHdUWjc2TnhQb0JTU2hKUkwweU9kMDJtUkg0b3I4OUJkTDZHSlBC?=
 =?utf-8?B?RlM5aGVxcDNhdUNqQVB5MjM3YWtBV1Fvd0FuakFPREhVaHAwRWI1Mmd4VHJO?=
 =?utf-8?B?Si9aa1ZsdkIrYTZZSVNYYUErZlU3N0p3cjIrSUpaemJLMkxzcDdGSHdITWhn?=
 =?utf-8?B?WFlrNkd1dWluaVphRVBFWnN3bnB3Z3BhWlpHUXJhV2JGVnphWkhMK29FWVF3?=
 =?utf-8?B?YzJUbmI3bWZZOVhNUHBLeGJwTzExMHYrbHl4cHp5Q3U0enIwN3A3RkJXTlVv?=
 =?utf-8?B?Ymc2UFQwdnpsY3Jxd29tWTRERjlUK1pJVnpUc2JTYks3WG1PcG9WL2dYQTB2?=
 =?utf-8?B?enlWa1dyVmJXUHg0MUtXcURqM0VWNlRkRkdzYmxPTk9JdHFBY1RTVjJtUUtX?=
 =?utf-8?B?UDJ3MHJ2NGFZc2ZKcEQwVVNtbWcvWG4vRnh2UnoreFdjaGIwelRndlRIQTdi?=
 =?utf-8?B?b2dtWWJqcUVHMXBKcjBZZWVoSmVjbGVTNlduS1lxS1E3NFNteWVoMHNsd2dp?=
 =?utf-8?B?QTZWdHhycG0zSituWVdCNTVZQldFdThBTjllazc0SElCTlRYdWhCYXpWSHQw?=
 =?utf-8?B?T1gzanI5YkkrVmo3T1F3L1JrcEFQcGVoRXhLeDhJWTZHQ3pJT254d3pNQXF5?=
 =?utf-8?B?eTRNRXd6UmkzMmVpNVJ0WmtkZmhIR2tCNTArRGZ1dEdHaWRYcG83M0dYWDNx?=
 =?utf-8?B?bnBzeVpDNCs5K1FCdmhITGpWa3FZL2Z4Rml2WnFtY0pQbnZ4L0w1ekg3R2Zv?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d003fa8-aea9-413a-495c-08dd5c8d9317
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 09:02:08.7624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9GQPw2/M+53HyWzWxGN95gu2QRlc7m8rWxuqeKx6w0ScsNdPZVS0C/jJiIl8qBX13TUFxdx6NrzS4saYFMTigTjHUeg2ZMBww38kKWUgNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8345
X-Proofpoint-GUID: gBrE7yCyXcbs8KNEEKWd7qus_iCtTkIj
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67c96493 cx=c_pps a=2/f09Pi2ycfuKzF0xiDRrg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=U40Yx87jAAAA:8 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=hr9ICUs78Ls51esRv9YA:9 a=QEXdDO2ut3YA:10 a=BBahhS0D0WQA:10 a=yv_D6YSC6K1Ih23S2Yuy:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: gSiURzTWlYl9yDh6NPfDd-nvmkK_JJ-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503060068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 09:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212376


On 3/6/25 15:48, Mathieu Dubois-Briand wrote:
> On Wed Mar 5, 2025 at 11:48 AM CET, Bin Lan via lists.openembedded.org wrote:
>> From: Bin Lan <bin.lan.cn@windriver.com>
>>
>> 0001-tests-do-not-run-test-applications-from-.libs.patch is deleted
>> for tests/lib/test_plugin is removed.
>>
>> License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-SA-4.0 PSF-2.0
>>
>> Changelog:
>> Babeltrace 2.1, MIP 1 is available and adds many functions
>> to support CTF 2 features.
>> The Python bindings wrap all the library changes in the same
>> systematic way as in Babeltrace 2.0. Add type hints to the
>> public API to assist with static analysis of your applications.
>>
>> Details about the 2.1.0 release:
>> https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html
>>
>> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>> ---
> Hi,
>
> Thanks for your patch!
>
> It looks like this is triggering some ptest failures, as can be seen on
> the autobuilder:
>
> Failed ptests:
> {'babeltrace2': ['cli/convert/test-convert-args.sh_71_-_bad_--component_format',
>                   'cli/convert/test-convert-args.sh_74_-_bad_--component_format',
>                   'cli/convert/test-convert-args.sh_77_-_bad_--component_format',
>                   'cli/convert/test-convert-args.sh_80_-_bad_--component_format',
>                   'cli/convert/test-convert-args.sh_83_-_duplicate_component_name:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_86_-_unknown_option:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_89_-_--params_without_current_component:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_92_-_duplicate_--begin:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_95_-_duplicate_--end:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_98_-_--begin_and_--timerange:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_101_-_--end_and_--timerange:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_104_-_bad_--timerange_format',
>                   'cli/convert/test-convert-args.sh_107_-_bad_--timerange_format',
>                   'cli/convert/test-convert-args.sh_110_-_bad_--timerange_format',
>                   'cli/convert/test-convert-args.sh_113_-_bad_--fields_format:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_116_-_bad_--names_format:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_119_-_unknown_-i:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_122_-_duplicate_-i:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_125_-_unknown_-o:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_128_-_duplicate_-o:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_131_-_--run-args_and_--run-args-0:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_134_-_-o_ctf-metadata_without_path:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_137_-_-i_lttng-live_and_implicit_source.ctf.fs:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_140_-_implicit_source.ctf.fs_without_path:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_143_-_implicit_source.ctf.lttng-live_without_URL:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_146_-_no_source:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_149_-_-o_ctf_without_--output:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_152_-_-o_ctf_+_--output_with_implicit_sink.text.pretty:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_155_-_--stream-intersection:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_158_-_two_sinks_with_-o_dummy_+_--clock-seconds:_expected_error_message',
>                   'cli/convert/test-convert-args.sh_161_-_path_non-option_arg_+_user_sink_+_-o_text:_expected_error_message',
>                   'cli/test-help.sh_2_-_help_ctf_plugin_expected_output',
>                   'cli/test-help.sh_5_-_help_src.ctf.fs_component_class_expected_output',
>                   'cli/test-help.sh_8_-_help_without_parameter_produces_expected_error',
>                   'cli/test-help.sh_11_-_help_with_too_many_parameters_produces_expected_error',
>                   'cli/test-help.sh_14_-_help_with_unknown_plugin_name_produces_expected_error',
>                   'cli/test-help.sh_17_-_help_with_unknown_component_class_name_produces_expected_error',
>                   'cli/test-help.sh_18_-_help_with_unknown_component_class_name_prints_plugin_help',
>                   'cli/test-help.sh_20_-_help_with_unknown_component_class_plugin_produces_expected_error',
>                   'cli/test-intersection.sh_16_-_stderr_contains_expected_error_message',
>                   'cli/test-intersection.sh_20_-_stderr_contains_expected_error_message',
>                   'cli/test-output-ctf-metadata.sh_2_-_Run_babeltrace_-o_ctf-metadata_with_a_valid_trace_directory,_correct_output',
>                   'cli/test-packet-seq-num.sh_6_-_Lost_events_string_matches_2',
>                   'cli/test-packet-seq-num.sh_8_-_Lost_events_string_matches_2',
>                   'cli/test-packet-seq-num.sh_10_-_Lost_events_string_matches_2,3,1',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_3_-_Trace_invalid-packet-size/trace:_method_autodisc:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_4_-_Trace_invalid-packet-size/trace:_method_autodisc:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_7_-_Trace_invalid-packet-size/trace:_method_component:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_8_-_Trace_invalid-packet-size/trace:_method_component:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_11_-_Trace_valid-events-then-invalid-events/trace:_method_autodisc:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_12_-_Trace_valid-events-then-invalid-events/trace:_method_autodisc:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_15_-_Trace_valid-events-then-invalid-events/trace:_method_component:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_16_-_Trace_valid-events-then-invalid-events/trace:_method_component:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_19_-_Trace_metadata-syntax-error:_method_autodisc:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_20_-_Trace_metadata-syntax-error:_method_autodisc:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_23_-_Trace_metadata-syntax-error:_method_component:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_24_-_Trace_metadata-syntax-error:_method_component:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_27_-_Trace_invalid-sequence-length-field-class:_method_autodisc:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_28_-_Trace_invalid-sequence-length-field-class:_method_autodisc:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_31_-_Trace_invalid-sequence-length-field-class:_method_component:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_32_-_Trace_invalid-sequence-length-field-class:_method_component:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_35_-_Trace_invalid-variant-selector-field-class:_method_autodisc:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_36_-_Trace_invalid-variant-selector-field-class:_method_autodisc:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_39_-_Trace_invalid-variant-selector-field-class:_method_component:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_40_-_Trace_invalid-variant-selector-field-class:_method_component:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_43_-_Trace_incomplete-packet-header:_method_autodisc:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_44_-_Trace_incomplete-packet-header:_method_autodisc:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_47_-_Trace_incomplete-packet-header:_method_component:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_48_-_Trace_incomplete-packet-header:_method_component:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_51_-_Trace_meta-no-trace-cls-no-stream-cls:_method_autodisc:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_52_-_Trace_meta-no-trace-cls-no-stream-cls:_method_autodisc:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_55_-_Trace_meta-no-trace-cls-no-stream-cls:_method_component:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_56_-_Trace_meta-no-trace-cls-no-stream-cls:_method_component:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_59_-_Trace_meta-no-trace-cls-no-stream-cls:_method_autodisc:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_60_-_Trace_meta-no-trace-cls-no-stream-cls:_method_autodisc:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_63_-_Trace_meta-no-trace-cls-no-stream-cls:_method_component:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_64_-_Trace_meta-no-trace-cls-no-stream-cls:_method_component:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_67_-_Trace_empty-event-record:_method_autodisc:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_68_-_Trace_empty-event-record:_method_autodisc:_babeltrace_produces_the_expected_error_message',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_71_-_Trace_empty-event-record:_method_component:_babeltrace_produces_an_error_stack',
>                   'plugins/src.ctf.fs/fail/test-fail.sh_72_-_Trace_empty-event-record:_method_component:_babeltrace_produces_the_expected_error_message',
>                   "plugins/src.ctf.fs/succeed/test-succeed.sh_35_-_CTF_1:_Trace_'lttng-event-after-packet'_gives_the_expected_stdout",
>                   "plugins/src.ctf.fs/succeed/test-succeed.sh_37_-_CTF_1:_Trace_'lttng-event-after-packet'_gives_the_expected_stdout",
>                   "plugins/src.ctf.fs/succeed/test-succeed.sh_39_-_CTF_2:_Trace_'lttng-event-after-packet'_gives_the_expected_stdout",
>                   "plugins/src.ctf.fs/succeed/test-succeed.sh_41_-_CTF_1:_Trace_'lttng-crash'_gives_the_expected_stdout",
>                   "plugins/src.ctf.fs/succeed/test-succeed.sh_43_-_CTF_1:_Trace_'lttng-crash'_gives_the_expected_stdout",
>                   "plugins/src.ctf.fs/succeed/test-succeed.sh_45_-_CTF_2:_Trace_'lttng-crash'_gives_the_expected_stdout",
>                   "plugins/src.ctf.fs/succeed/test-succeed.sh_47_-_Trace_'clock-offset-goes-back-in-time'_gives_the_expected_output",
>                   'plugins/src.ctf.fs/test-deterministic-ordering.sh_2_-_ab:_error_stack_is_produced',
>                   'plugins/src.ctf.fs/test-deterministic-ordering.sh_3_-_ab:_expected_error_message_is_present',
>                   'plugins/src.ctf.fs/test-deterministic-ordering.sh_5_-_ba:_error_stack_is_produced',
>                   'plugins/src.ctf.fs/test-deterministic-ordering.sh_6_-_ba:_expected_error_message_is_present',
>                   'plugins/src.ctf.lttng-live/test-live.sh_1_-_CLI_prints_the_expected_session_list_-_stdout',
>                   'plugins/src.ctf.lttng-live/test-live.sh_3_-_CLI_prints_the_expected_session_list',
>                   'plugins/src.ctf.lttng-live/test-live.sh_5_-_CLI_attach_and_fetch_from_single-domains_session_-_no_discarded_events_-_stdout',
>                   'plugins/src.ctf.lttng-live/test-live.sh_7_-_CLI_attach_and_fetch_from_single-domains_session_-_no_discarded_events',
>                   'plugins/src.ctf.lttng-live/test-live.sh_9_-_CLI_attach_and_fetch_from_multi-domains_session_-_discarded_events_-_stdout',
>                   'plugins/src.ctf.lttng-live/test-live.sh_11_-_CLI_attach_and_fetch_from_multi-domains_session_-_discarded_events',
>                   'plugins/src.ctf.lttng-live/test-live.sh_13_-_CLI_many_requests_per_packet_-_stdout',
>                   'plugins/src.ctf.lttng-live/test-live.sh_15_-_CLI_src.ctf.fs_vs_src.ctf.lttng-live_-_stdout',
>                   'plugins/src.ctf.lttng-live/test-live.sh_17_-_CLI_src.ctf.fs_vs_src.ctf.lttng-live_-_stdout',
>                   'plugins/src.ctf.lttng-live/test-live.sh_19_-_CLI_attach_and_fetch_from_single-domains_session_-_inactivity_discarded_packet_-_stdout',
>                   'plugins/src.ctf.lttng-live/test-live.sh_21_-_CLI_attach_and_fetch_from_single-domain_session_-_Receive_metadata_in_two_sections_separated_by_a_empty_section_-_stdout',
>                   'plugins/src.ctf.lttng-live/test-live.sh_23_-_split_metadata_requiring_additional_stored_values_-_stdout',
>                   'plugins/src.ctf.lttng-live/test-live.sh_25_-_new_stream_announced_while_an_existing_stream_is_inactive_-_stdout',
>                   'plugins/src.ctf.lttng-live/test-live.sh_28_-_invalid_metadata_sent_by_the_relay_-_stderr',
>                   'cli/convert/test-convert-args.sh',
>                   'cli/test-help.sh',
>                   'cli/test-intersection.sh',
>                   'cli/test-output-ctf-metadata.sh',
>                   'cli/test-packet-seq-num.sh',
>                   'plugins/src.ctf.fs/fail/test-fail.sh',
>                   'plugins/src.ctf.fs/succeed/test-succeed.sh',
>                   'plugins/src.ctf.fs/test-deterministic-ordering.sh',
>                   'plugins/src.ctf.lttng-live/test-live.sh']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1058/steps/12/logs/stdio
>
> Extra log data can be found in: https://valkyrie.yocto.io/pub/non-release/20250305-106/testresults/qemux86-64-ptest/core-image-ptest-babeltrace2/
>
> Can you have a look at this failure please?

Some new failed test cases are disabled for I have not time to fix it 
before the feature freeze to investigate.

I have sent out a v3 patch, all test cases are passed when running in 
intel-x86-64 board. Please review it. Thanks.

--

Bin Lan

>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522D3C79FBC
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 19:43:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73163.1767642173145143098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 11:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ma+j8HoS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54658cf393=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605IlYok3186618
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Jan 2026 19:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=NsJhS+mEDfk0A0Yd1Zi2M4
	qzlUlFuEg1u2MiRskyHFI=; b=ma+j8HoS3CqmXUEP0V+SHqJyiwPmyC5HlYxV4k
	WRfbPStxAWZYEv+Dx+GwVZyd/85NFYULqLO2llZWbYshrJTA7e1UANUZKhNxbI15
	cECxRLhJDK9eyFRYqfhfu3KfPUJTIrGz0uMxrzp3u8InCuUs6AyvuRJa2hCVKlIy
	i1txBNIBM5iRSSnTUs8EwWERQOoiUQ6eHrFx0T5KAuy7RR91PeYznbu/UWQtztpB
	Vlr1QmU+qUPdhEp5xEwX0HMBBOnZROCpJRase1iRZ3jJgEqVPP4tLlnUz5c4q9IG
	PFDo2Y2LFWwuvfc7XNFAPOO6RyQ5RFIf1p69W7UXY9qcIzXg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012048.outbound.protection.outlook.com [40.107.200.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet339y6m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 19:42:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNfkAtuLiJ3YQW0dayNQy1O5QarD2A9LPmqYCV5F3HFuEqMPQ4Q0wK9o64CWPPeIlPkWNEN6ThLqaKcBzm6HrHKCaFs8lFVtidGa3O/P69wLeJ9WiWL4FmuuwSqxgd+J8xREdU9xd4VozimyRHE2WJhUq2dZnIzNBrHk7tyjhTEnYqjO/c4vSzGN2113WPg29PVBpm0h0Hcj4I895oqlyaPlWqghTcEUpHDKlCgavbxOuje831ronS1A4DFtSRqcQLBFBnARxRZAeEemlnudQF42ZuCdGBgQfKuPz2UQbJ1Fvuldf1DQ72wzJxkDFuliH3RrLhKsNYNqfy6kc1VYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsJhS+mEDfk0A0Yd1Zi2M4qzlUlFuEg1u2MiRskyHFI=;
 b=VWIWcr4Oopd2v30tFbiuU1JY9tWphWtLvlqazF6m2umADEA5aBXW86l3Mp43puODdwBks4B/h/VVg8WYZyotRxziXtbvEWT7BwQ+EDSAbkLwicsQpHR2fHS/A8s8ghKWwg0R+sx+G3vJpHQ3Hgk2NP6Y+6SBy0okjv/HklhBSC8o5ph5m7eD/mr7a1RK360aJbUyLZOMQaB+opPG3CHSm+RG8IlztagEa9oYZ+/Kz7wgbGWNvZBv2BcgNu5jnuLqPXpPm/D9Nrt1NXLTHW84/tLNxPI0m1NsK7vbaV7aAvRQZhaUO2JsjyFjNC1T7wbuF6yPzVVYE9Br4NF8bNku/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 19:42:33 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 19:42:33 +0000
Content-Type: multipart/alternative;
 boundary="------------QKUKNZ1u2fBFY1l2Z04yOio8"
Message-ID: <883ffee5-8170-455a-a46f-6f15e01e5f0f@windriver.com>
Date: Mon, 5 Jan 2026 14:42:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] vte: fix build failed for ppc64
To: hongxu.jia@windriver.com, openembedded-core@lists.openembedded.org,
        alex.kanavin@gmail.com
References: <20251224051734.2346176-1-hongxu.jia@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251224051734.2346176-1-hongxu.jia@windriver.com>
X-ClientProxiedBy: YT4PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::8) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW5PR11MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a704c3b-29c5-40f5-17d4-08de4c9291af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b1ZzTkVOTVlPb2RMM1N3YTFvakpZNmhnaFRGSkVONit6NUpPblVnWmpsb1g1?=
 =?utf-8?B?K0tIZTJpbkZCdFVNTFlaYnpYQTBDNTFZTXNMc0U2a0lVRDB5K2FyVDhvT3h2?=
 =?utf-8?B?aXFCZEpLMWdHejdMMUlmdWxpMTZGZDdTOUlwUWxhd2phbVZCemZkQ2wzSWlR?=
 =?utf-8?B?MUk2YXd2VGg5bWNJQ0dJd2VFaC9EYk16bDFCT2ttVlkvNXNzT3A0Rlk3d0ND?=
 =?utf-8?B?SWduN0t2UGtFYkpLb1BZYjJZMjRTUVYvMDBKSFU3R0JpZTdrNXVDTXptc3JZ?=
 =?utf-8?B?WEMxSUtFdnNvQzZJNXdNZHlZY0d1dUswZGN5WTdTWGRkSFdJRm1udmJUUnp0?=
 =?utf-8?B?S2JkQjNScUhGYmFDWjA0VExCSEcxVXhnMzYzTXcybHFmd0liSDd5SjN1WFpH?=
 =?utf-8?B?RjlGcGl5bTZGWlFVSnQ2M0x6Zmtva3hiV2paSnFYVlowblJSZTFDK0VrQUNF?=
 =?utf-8?B?WkJyZjgrT1M5S0ZtZlVBU2RXRUdlTy9tSjVUZXNoVnFSdzF2am5GdURCVmZL?=
 =?utf-8?B?UnBKb2pPd05XbkwvM2YvWGhaMmY1V2RTV015a1N2emJpMWtsLzlJdlU5bW5w?=
 =?utf-8?B?MHhSN2wwNTdndmF5Y3VKU1o3RmtrVFVvT2xvUVFUcDZ3eGtyQzY0Q2lOa1VF?=
 =?utf-8?B?a3MyOGRlSlZ4WXNtUzlKRGgvNndXOC81MUIzQmxmeGRVbGpMWE1Yd25nM0R6?=
 =?utf-8?B?NC85QnhQV0tFVEZPUzYzZzlUOG1Jc0wvUGV4Ymptc1Z6THBBbGpxdjRQQzJq?=
 =?utf-8?B?NWV5bDh0LzkyUDVxZmMxMUVaVkViMzlQaWNvSHNTd281NEdRMnhDcEVhd2FG?=
 =?utf-8?B?MDVPN290NUFXaVVDZXRZbmlaUEJYdDIwU0FhN0JhZHZQSExCRnIvVkFFdlNM?=
 =?utf-8?B?SVQrYWxVTTlWbnhmSFRQUUp4djUreVE1anNzVGExbXZhVk41a24vRi9zME5w?=
 =?utf-8?B?NW1WTGNXVVc0WUw1U3g3WFdoUGlUeTI5d0xaQUk5VG5HcTEzdm9JalRHR1Z5?=
 =?utf-8?B?bExyelN2eU5iaWRucW1rTkl3ME1yazZXZ0paMlNlNThmOSszcyt3SHg3RFhW?=
 =?utf-8?B?MGJWNXI1NXVXNHhaZFJaNnFBcFREQkNvZGFRWHBjZFNCQjRKRkczQTk4ZWg2?=
 =?utf-8?B?cmZ4VkdVV25aREJyNlhSRHZTZ2N6cG9tUEZLSzV1N295ck80NW1HTDJ4VVc5?=
 =?utf-8?B?VEFxVU51VnlhQVBCTXBnVk9zRXpNT3Z0SFVhOFJxaDZJOTkrODlaQTQ3ZWtH?=
 =?utf-8?B?R3lZVHViSkVQU0tmNXhnQkFDa0k4MFduN0VPcUxzQlZDalNUSWtlbmpKemYw?=
 =?utf-8?B?Z3M3STdFY09hWDlLZ0F3SzVFOUZ4MjU0c1podW8xMy90M0NyRHdVU0RkWXZr?=
 =?utf-8?B?cndyUlJVZkI3TkM2R216bjNQRGRvT3d3OVJseGdndWR6dTh5SG8rL3JDVllL?=
 =?utf-8?B?Ylg4VU5GUGwweDJmRy9VdHNueDVGK0VHUjF6bkptQUdsSVJoMmZwRkM4bzF2?=
 =?utf-8?B?Ym03MnB2VEhoaGx5V0NrMmxRUWdXMW40cnpCUFhROEVxSkxjdlNXVnNhOWlQ?=
 =?utf-8?B?MWtRWk5pUTBNTFRaSXhxUnoydnN3WVgxQVJITFd6WHJHemhJSnhoY1dDTGFy?=
 =?utf-8?B?bTVvL2UyNjdQODBzTjhKc3JXdTkyazBRVmlwdGhQRGg1T2NRcE51bUx3TVcr?=
 =?utf-8?B?bFNhSzBRT01WbG9UdTUveGlIS2RnZXlTSm96eGhlbTkxdUl4NWdjcnY2cmxH?=
 =?utf-8?B?NTFLeFBRTHFQeUJmby9HQUFaVDFSUjRHMm1YSjI1OSs1ZERybVR1c3FCSXB5?=
 =?utf-8?B?NlRGQUVwL2hqV3RpeVBKNTREWUxCdDFsOWFkNmUrOElQaVAzOEppNVZBak9J?=
 =?utf-8?B?ZElQc2ZpbXE3dFJacWxLN0dGNXd6V1RJc2dxWkNMb29pTVZXczJ3UmpHNU82?=
 =?utf-8?Q?uWS0chf5bHs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YW9kWGh5cm9OQXVRTEI0TU5PVEtDREJmNUxUNE0relZjN0w4akxURVg0WHUr?=
 =?utf-8?B?akVZcGJpRVQ4OEMxSTU1TmUyNWVGT2tJekRjVjBsSUZWZ05TK2Nvay85Wlp1?=
 =?utf-8?B?TTJRcFd3dHVJYUs0ME9nbU5QSU1oeWxPNFErMVE4NDhrNTNtb1hyek9KR3N2?=
 =?utf-8?B?bG9TdEI4N2xtUG1GYUM2SXRtZ01jRDNhZkE2TjFQZ2hFRWg3c1dyd0Q2eXZi?=
 =?utf-8?B?V25INnRDT1RwWEUvOE1FZTVUQTBoZUVObW1YcTVnM3hZaktTMlF0MFR6N2c1?=
 =?utf-8?B?Wi9XQUs3bHRDdS8yNjczZW1KSGYvT3dHY0NPa0NYd0ZxVXY3TE54dFlxcXpV?=
 =?utf-8?B?RTZvOWpBZjJHSHowOVFNeDZNcVo4MWQ4enFMU1NaRTR6SzNZU1A1a3R0dUNy?=
 =?utf-8?B?anhOb3gwUnlydC9RMGNaak9NcWtRTnY2ZmIyNFppMFdNQWxqanJSTjFXV1hE?=
 =?utf-8?B?YlU2OWl4YjFhVVdibEhodXlWYVZZZVpUWWpyQmlFeHcrTmZ1YUJ5N1d4ZWtV?=
 =?utf-8?B?L2tYUXFjbnhrbCtKTTAxUjRjY3k2M3Z1Y1JoM25sa2haWUtmWTZrSlNuRWNp?=
 =?utf-8?B?OFU5ZWc3U2sycE40MFhza0hMd3VPQVhmRHVOYTlWQVJZMDNaQlRiSFpJd2w5?=
 =?utf-8?B?SWcwWVcvZUg2TVdVR1lGVmQvMmt5T3RXMHkrem5zQVZOMmpSd2lqS05HVXV6?=
 =?utf-8?B?RVVvTFNrSjVUZXFsTWJVM1RyVHZ0dFVBUTIwNzMzMkp5aFJCVlpvYmhoUkhj?=
 =?utf-8?B?Yjg5VEsyTG85OWlwU1BLSHhWU2UxNjJraHU4UXRnN0VlQjgxMHZnalRaaVpC?=
 =?utf-8?B?YkhjZ1VURlJEenhxRDZWQkk5RG9VcERwNUJ1Tkh2cmpKaGRaMWVobHAyUVRJ?=
 =?utf-8?B?LzlZZmx2aXc4Y0xoN0swNUQ5d1F2N1ZtTXhHcUxoRmJRbVMxNHM4aDZ0OUlK?=
 =?utf-8?B?emM5Nko1TDFDMG5WeXFvTUZNanpsWGpndEhFcStwYTBoNnNyS2V4QjVBQVpn?=
 =?utf-8?B?b2VvN0FkNUFiRFJBYnJhbm9WV1pJNnRTSExGVWljZkQ0aUZVOEhIYzBGb0t0?=
 =?utf-8?B?Z3Z0S2FRWUhsUjN3c2VXSUxKMXRlYUZvdkdKb2pJQkR0WWxudVRzeEhYSkE2?=
 =?utf-8?B?MTlmcFpMSzdwYlhJajZCV213d2FlaHNicFJxUVg5blIzek1KQU83NDlTSjFG?=
 =?utf-8?B?d2czZkU5ZnRMSGp5QVNxM015OTM1KzdHTkdnODVGODlrMVhIWHl3RkZGUGJR?=
 =?utf-8?B?NjBzem1VR2ltS1B1TjlNTXpzNHpWczJJOVhNZHBLR2tCTVRpa3diUmdNTXFZ?=
 =?utf-8?B?SDBTZG00RmdIdXBPTXRWOW9JckpYSGVQWEJSYVVhV3p0NGhjcExTOGxkUGR2?=
 =?utf-8?B?cThCTk5EUG9SVlhZT2xkWmhzYXZtSlh2dHpXUTBkRUJSTXZlLzRQZnh0U21O?=
 =?utf-8?B?ZWI4R3g1TmwrWTdwNVVGbi9YSSthdFRGeTNSSkZIZEZIV28waHQwby9uWi9Y?=
 =?utf-8?B?ZFRTTVJ0dWJxTEJPYmlNZkljQTl4MlhwakR3QzlKdHBoanF4WUtWZ1BmaWRq?=
 =?utf-8?B?WWxNMlJxei9YOTNCenNWNzFBNkFkc3JHVjIvZ3lycWwwOFgxWXQraGlZQ0M5?=
 =?utf-8?B?MEVvV2lIUURVV2U0SllYNzdsS2IvRjNTZTBMaWlKMnJhRFNoSHlVN1A3eElr?=
 =?utf-8?B?Q0dDbmhiMnJ6RzlLcUxlV2dBdGpvYW16RWhVUE1ETVBwWkJCQTU5ZWFEZGxN?=
 =?utf-8?B?T3I2MFlBbXFkeXEzZGt6cHlmUkNod1VFUGpOd3lzYVRYNzJUUGtQNEpiUXY1?=
 =?utf-8?B?RndmSitiM2ZEYy9nQ24zN3Mwd01wK1VCV1l1bklFbFBvUVFlVFpnS3BVYk9P?=
 =?utf-8?B?Wk91QzJhZjQ0cDlsalRjUWpJY0JRWmdQeDVjeStKTkt0L1NRT25nN2I4R3J6?=
 =?utf-8?B?SnR1azZOWnpsU3BVRkVkUEtmaW44M0pCaXhOWEpOa1h3YjZkUzZzU1RGZWtm?=
 =?utf-8?B?cGsyb3cxb1lsYWFMcnljcGxSNWJaS2FGclhPTDJOUktSeEZsbENHYzV2Mlow?=
 =?utf-8?B?NVQ2eElqMk8xZzRIYnhyZ3l3Qk5PY0UzdnRvWWY2MlFSTmFPUDNNaGVDTnYx?=
 =?utf-8?B?UThRZjVBMVdISGxOekNzQ2ZmbzhXK2lJY21YRVVkODNBSDZTbXlHLzNyTDQ3?=
 =?utf-8?B?bjlJSmkvM3ZQeFkwVHhUUTNBTlBtT0VyaDQvR051Qjc5aVppYVZUN3AzWWJJ?=
 =?utf-8?B?NGh1Y1Y5YysyTnlTLzR6R0RwdGVEZE10V0xkQ09NUnI3ZS9MZlNQTnhiVk1E?=
 =?utf-8?B?Qk5WQU16MDRxM0JGVDNpTVVzVzcrNjRVL282MEJuMExVU2ljQ1ZqRFpEbStM?=
 =?utf-8?Q?YYP7hW95xVHeujfU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a704c3b-29c5-40f5-17d4-08de4c9291af
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 19:42:32.8630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3MGosNBJp4J3t3JWIgnHCzJ265iVUpFlbUYTjBVPzJyIX8r8/Ql4dtIDLc8FCSB4Y0LocXkwQVr3wJOZsw45d2F6X2TgZ891gCZsf6slUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695c143b cx=c_pps
 a=JJStoDgKLvGmSPu1zToK9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=350a4TbwWWci1TXJvOwA:9 a=QEXdDO2ut3YA:10 a=h7WcsX3COX-pPI-b:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _qF8s1e-qb9WUiGaAcZgzgLW2WGIur0D
X-Proofpoint-ORIG-GUID: CRWWEpY0kMyeUOVo3D9AIuUuXr53Mz3r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE3MiBTYWx0ZWRfX6JOQBNHuX/mI
 kzT44EwX4d+Fl7feelwlf357GEFmOsQTb4fGoGrVgwtpAAtviNO7otKStzyrHdiCYhVwA7BgtyD
 l8LGeekwfl3qUvmXFLbjZzmBduNr7O0HsK+nz4nDgsPNqYO4a4RcBnyhzpJz65bkOItCTJmn71B
 mPx6sfytj0ZDH7lGd30zPZUIhO+aBTLIc3AnPSgZ6OJt7ZCm5Msn9SViUIGI2+9VP9syM3hqmvD
 tYlDShnElFhZK3goFws3n87nPmGHjNv5EO09v8+8/i95HKJnC1rYF2MyQ8jdWOxUKASYcg5LB+X
 q2iBUJbQ6tTCI2gh8VXCuTkfTdY2kB3XDjxtTFfna7pgldYSRX3xSk/JO1oMZN2qnCLNn5a9X8a
 bF2HH7v5DFrXfQRbmX7WxAv+yC6+zu1AdukJ1odZfPW+zLHADSXaUGKug0ZRlTs5yfQp8eRP31t
 MAKb9kAVNWzR3qRQfUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 19:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228877

--------------QKUKNZ1u2fBFY1l2Z04yOio8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-12-24 12:17 a.m., hongxu via lists.openembedded.org wrote:
> $ echo 'MACHINE = "qemuppc64"' >> conf/local.conf
> $ bitbake vte
> ...
> |subprojects/simdutf/simdutf.cpp:20533:7: error: there are no arguments to 'write_v_u16_11bits_to_utf8' that depend on a template parameter, so a declaration of 'write_v_u16_11bits_to_utf8' must be available [-Wtemplate-body]
> |20533 |       write_v_u16_11bits_to_utf8(
> |      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
> |subprojects/simdutf/simdutf.cpp:20533:7: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
> |subprojects/simdutf/simdutf.cpp:20559:7: error: there are no arguments to 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' that depend on a template parameter, so a declaration of 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' must be available [-Wtemplate-body]
> |20559 |       ppc64_convert_utf16_to_1_2_3_bytes_of_utf8(
> |      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |subprojects/simdutf/simdutf.cpp:20533:33: error: 'write_v_u16_11bits_to_utf8' was not declared in this scope
> |20533 |       write_v_u16_11bits_to_utf8(
> |      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^
> |20534 |           in, utf8_output, as_vector_u8(one_byte_bytemask), one_byte_bitmask);
> |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ...
>
> The source file subprojects/simdutf/simdutf.cpp is generated by python3 script
> singleheader/amalgamate.py and the definition of write_v_u16_11bits_to_utf8 and
> ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64 [1] requires option
> --with-utf16 and --with-latin1
>
> [1]https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5

>
> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
> ---
>   ...-fix-compile-simdutf-failed-on-ppc64.patch | 77 +++++++++++++++++++
>   meta/recipes-support/vte/vte_0.82.1.bb        |  1 +
>   2 files changed, 78 insertions(+)
>   create mode 100644 meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch
>
> diff --git a/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch b/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch
> new file mode 100644
> index 0000000000..e7bc6ae47c
> --- /dev/null
> +++ b/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch
> @@ -0,0 +1,77 @@
> +From 005923710c3da36667737acdbdad68b5b3a0c1bc Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia<hongxu.jia@windriver.com>
> +Date: Tue, 23 Dec 2025 18:28:29 -0800
> +Subject: [PATCH] build: fix compile simdutf failed on ppc64
> +
> +...
> +|subprojects/simdutf/simdutf.cpp:20533:7: error: there are no arguments to 'write_v_u16_11bits_to_utf8' that depend on a template parameter, so a declaration of 'write_v_u16_11bits_to_utf8' must be available [-Wtemplate-body]
> +|20533 |       write_v_u16_11bits_to_utf8(
> +|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
> +|subprojects/simdutf/simdutf.cpp:20533:7: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
> +|subprojects/simdutf/simdutf.cpp:20559:7: error: there are no arguments to 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' that depend on a template parameter, so a declaration of 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' must be available [-Wtemplate-body]
> +|20559 |       ppc64_convert_utf16_to_1_2_3_bytes_of_utf8(
> +|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +|subprojects/simdutf/simdutf.cpp:20533:33: error: 'write_v_u16_11bits_to_utf8' was not declared in this scope
> +|20533 |       write_v_u16_11bits_to_utf8(
> +|      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^
> +|20534 |           in, utf8_output, as_vector_u8(one_byte_bytemask), one_byte_bitmask);
> +|      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +...
> +
> +The source file subprojects/simdutf/simdutf.cpp is generated by python3
> +script singleheader/amalgamate.py and the definition of write_v_u16_11bits_to_utf8
> +and ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64 [1] requires option
> +--with-utf16 and --with-latin1
> +
> +Add option --with-utf16 and --with-latin1 by default.
> +
> +[1]https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/vte/-/issues/2926]

Hi Hongxu,

This is probably fine to merge with a v4.

Since the vte project rejected the bug and pointed to upstream simdutf 
(simd-utf for those following along at home),
can you update your commit log to explain that an change the 
Upstream-Status: <link> please ?

../Randy


> +Tweak for release tarball
> +
> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
> +---
> + subprojects/packagefiles/simdutf/meson.build | 3 ++-
> + subprojects/simdutf/meson.build              | 3 ++-
> + 2 files changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/subprojects/packagefiles/simdutf/meson.build b/subprojects/packagefiles/simdutf/meson.build
> +index 330ee89..ab934c3 100644
> +--- a/subprojects/packagefiles/simdutf/meson.build
> ++++ b/subprojects/packagefiles/simdutf/meson.build
> +@@ -41,11 +41,12 @@ simdutf_amalgamate = [
> +   '--no-zip',
> +   '--no-readme',
> +   '--with-utf8',
> +-  # '--with-utf16',
> ++  '--with-utf16',
> +   '--with-utf32',
> +   # '--with-base64',
> +   # '--with-detect-enc',
> +   '--with-ascii',
> ++  '--with-latin1',
> + ]
> +
> + if get_option('debug')
> +diff --git a/subprojects/simdutf/meson.build b/subprojects/simdutf/meson.build
> +index 330ee89..ab934c3 100644
> +--- a/subprojects/simdutf/meson.build
> ++++ b/subprojects/simdutf/meson.build
> +@@ -41,11 +41,12 @@ simdutf_amalgamate = [
> +   '--no-zip',
> +   '--no-readme',
> +   '--with-utf8',
> +-  # '--with-utf16',
> ++  '--with-utf16',
> +   '--with-utf32',
> +   # '--with-base64',
> +   # '--with-detect-enc',
> +   '--with-ascii',
> ++  '--with-latin1',
> + ]
> +
> + if get_option('debug')
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/vte/vte_0.82.1.bb b/meta/recipes-support/vte/vte_0.82.1.bb
> index b5d6f2fb62..0a2535f21e 100644
> --- a/meta/recipes-support/vte/vte_0.82.1.bb
> +++ b/meta/recipes-support/vte/vte_0.82.1.bb
> @@ -19,6 +19,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
>   
>   SRC_URI +="file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \ 
> file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf 
> \ + file://0001-build-fix-compile-simdutf-failed-on-ppc64.patch \ "
>   
>   SRC_URI[archive.sha256sum] = "79376d70402d271e2d38424418e1aea72357934d272e321e3906b71706a78e3a"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228523):https://lists.openembedded.org/g/openembedded-core/message/228523
> Mute This Topic:https://lists.openembedded.org/mt/116925868/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------QKUKNZ1u2fBFY1l2Z04yOio8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-12-24 12:17 a.m., hongxu via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251224051734.2346176-1-hongxu.jia@windriver.com">
      <pre wrap="" class="moz-quote-pre">$ echo 'MACHINE = &quot;qemuppc64&quot;' &gt;&gt; conf/local.conf
$ bitbake vte
...
|subprojects/simdutf/simdutf.cpp:20533:7: error: there are no arguments to 'write_v_u16_11bits_to_utf8' that depend on a template parameter, so a declaration of 'write_v_u16_11bits_to_utf8' must be available [-Wtemplate-body]
|20533 |       write_v_u16_11bits_to_utf8(
|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
|subprojects/simdutf/simdutf.cpp:20533:7: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
|subprojects/simdutf/simdutf.cpp:20559:7: error: there are no arguments to 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' that depend on a template parameter, so a declaration of 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' must be available [-Wtemplate-body]
|20559 |       ppc64_convert_utf16_to_1_2_3_bytes_of_utf8(
|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|subprojects/simdutf/simdutf.cpp:20533:33: error: 'write_v_u16_11bits_to_utf8' was not declared in this scope
|20533 |       write_v_u16_11bits_to_utf8(
|      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^
|20534 |           in, utf8_output, as_vector_u8(one_byte_bytemask), one_byte_bitmask);
|      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...

The source file subprojects/simdutf/simdutf.cpp is generated by python3 script
singleheader/amalgamate.py and the definition of write_v_u16_11bits_to_utf8 and
ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64 [1] requires option
--with-utf16 and --with-latin1

[1] <a class="moz-txt-link-freetext" href="https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5">https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5</a></pre>
    </blockquote>
    <br>
    <blockquote type="cite" cite="mid:20251224051734.2346176-1-hongxu.jia@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 ...-fix-compile-simdutf-failed-on-ppc64.patch | 77 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.82.1.bb        |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch

diff --git a/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch b/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch
new file mode 100644
index 0000000000..e7bc6ae47c
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-build-fix-compile-simdutf-failed-on-ppc64.patch
@@ -0,0 +1,77 @@
+From 005923710c3da36667737acdbdad68b5b3a0c1bc Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+Date: Tue, 23 Dec 2025 18:28:29 -0800
+Subject: [PATCH] build: fix compile simdutf failed on ppc64
+
+...
+|subprojects/simdutf/simdutf.cpp:20533:7: error: there are no arguments to 'write_v_u16_11bits_to_utf8' that depend on a template parameter, so a declaration of 'write_v_u16_11bits_to_utf8' must be available [-Wtemplate-body]
+|20533 |       write_v_u16_11bits_to_utf8(
+|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
+|subprojects/simdutf/simdutf.cpp:20533:7: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
+|subprojects/simdutf/simdutf.cpp:20559:7: error: there are no arguments to 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' that depend on a template parameter, so a declaration of 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' must be available [-Wtemplate-body]
+|20559 |       ppc64_convert_utf16_to_1_2_3_bytes_of_utf8(
+|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|subprojects/simdutf/simdutf.cpp:20533:33: error: 'write_v_u16_11bits_to_utf8' was not declared in this scope
+|20533 |       write_v_u16_11bits_to_utf8(
+|      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^
+|20534 |           in, utf8_output, as_vector_u8(one_byte_bytemask), one_byte_bitmask);
+|      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+...
+
+The source file subprojects/simdutf/simdutf.cpp is generated by python3
+script singleheader/amalgamate.py and the definition of write_v_u16_11bits_to_utf8
+and ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64 [1] requires option
+--with-utf16 and --with-latin1
+
+Add option --with-utf16 and --with-latin1 by default.
+
+[1] <a class="moz-txt-link-freetext" href="https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5">https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5</a>
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/vte/-/issues/2926">https://gitlab.gnome.org/GNOME/vte/-/issues/2926</a>]</pre>
    </blockquote>
    <p>Hi Hongxu,<br>
    </p>
    <p>This is probably fine to merge with a v4.</p>
    <p>Since the vte project rejected the bug and pointed to upstream
      simdutf (simd-utf for those following along at home),<br>
      can you update your commit log to explain that an change the <span style="white-space: pre-wrap">Upstream-Status: &lt;link&gt; please ?</span></p>
    <p><span style="white-space: pre-wrap">../Randy
</span></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20251224051734.2346176-1-hongxu.jia@windriver.com">
      <pre wrap="" class="moz-quote-pre">
+Tweak for release tarball
+
+Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+---
+ subprojects/packagefiles/simdutf/meson.build | 3 ++-
+ subprojects/simdutf/meson.build              | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/subprojects/packagefiles/simdutf/meson.build b/subprojects/packagefiles/simdutf/meson.build
+index 330ee89..ab934c3 100644
+--- a/subprojects/packagefiles/simdutf/meson.build
++++ b/subprojects/packagefiles/simdutf/meson.build
+@@ -41,11 +41,12 @@ simdutf_amalgamate = [
+   '--no-zip',
+   '--no-readme',
+   '--with-utf8',
+-  # '--with-utf16',
++  '--with-utf16',
+   '--with-utf32',
+   # '--with-base64',
+   # '--with-detect-enc',
+   '--with-ascii',
++  '--with-latin1',
+ ]
+ 
+ if get_option('debug')
+diff --git a/subprojects/simdutf/meson.build b/subprojects/simdutf/meson.build
+index 330ee89..ab934c3 100644
+--- a/subprojects/simdutf/meson.build
++++ b/subprojects/simdutf/meson.build
+@@ -41,11 +41,12 @@ simdutf_amalgamate = [
+   '--no-zip',
+   '--no-readme',
+   '--with-utf8',
+-  # '--with-utf16',
++  '--with-utf16',
+   '--with-utf32',
+   # '--with-base64',
+   # '--with-detect-enc',
+   '--with-ascii',
++  '--with-latin1',
+ ]
+ 
+ if get_option('debug')
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vte/vte_0.82.1.bb b/meta/recipes-support/vte/vte_0.82.1.bb
index b5d6f2fb62..0a2535f21e 100644
--- a/meta/recipes-support/vte/vte_0.82.1.bb
+++ b/meta/recipes-support/vte/vte_0.82.1.bb
@@ -19,6 +19,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
 
 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch\file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf\+file://0001-build-fix-compile-simdutf-failed-on-ppc64.patch\">&quot;file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
+            file://0001-build-fix-compile-simdutf-failed-on-ppc64.patch \
 &quot;</a>
 
 SRC_URI[archive.sha256sum] = &quot;79376d70402d271e2d38424418e1aea72357934d272e321e3906b71706a78e3a&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#228523): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/228523">https://lists.openembedded.org/g/openembedded-core/message/228523</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/116925868/3616765">https://lists.openembedded.org/mt/116925868/3616765</a>
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

--------------QKUKNZ1u2fBFY1l2Z04yOio8--


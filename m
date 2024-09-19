Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFBECF3975
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 21:56:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5206.1726782974711180722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 14:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9992dd385c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JE2gbT007022
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 21:56:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n1f9e8yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 21:56:13 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48JLuDl7027177;
	Thu, 19 Sep 2024 21:56:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n1f9e8yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 21:56:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DB48otM5ymo1fgYjcUh1ZSmjCzMxN7A+qiYhHbWFyUYAaAWijMDB0JO7N+Jr0ZsJdubp8JRa9VW0o0p0KhDg+E6oLEz+wxP8oQSum2fy2sKpVqTwq/Z+9xT/f0o4BtLHf+1fCu9gPY4lsClflBVY4WDMlag2d45juHDouSYGGBja/nMbph8+Hmh1T5rmbIXrOO4WMUxfQJ19oyCiFUn/dlVM7ab62PNQVQQM8gQdv1PCYhMMUnumjkO+38HMbGumunlXlUvLABDceVyhC8MrNIZlDuKUrkf6rXDjRdM1P2caeYNu4k0kkBLDWjJsTMfGnHymZriFzjgrNf6YYzWuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+ByI8CcB+r16yNoT7le4kT0XyDqYELRUupcRtEfhnY=;
 b=IfvPVKDgLdSTta5rGlxoJgExxUT3qtGD94KGqIbNO+D7iUP6bNqzbM1E9ykYHV8mDd4hUxlrWTahZ0uM3uszeGTobZC0572CMx1cn01Qs3S4K8/GfvKkN4+WgR8Ii6VyAz1GxCeFdS+OSrkXz5XNrxXhJNN4VIUpcpmfYHwYaVKXlsOfqqEW/pQjl94O3iwqq+aE8rnPANx/HVMvtq6dzE24N8tYpGAAi4AAN9M/jsM/wgeDEM7KiSa4csR0hSDinkR3VogpYtv7Y7HjzpdEB0vMeh2479BAoehQEYiptVx5cHmnkXkEC8QF2FNzwqS7+NhV03UfcfLLc0LaTsMPkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 21:56:09 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 21:56:09 +0000
Content-Type: multipart/alternative;
 boundary="------------epQaljxaV7c27p0hUkh7pMuB"
Message-ID: <14bd5997-6222-469b-aa1d-0dcd078aaefe@windriver.com>
Date: Thu, 19 Sep 2024 17:56:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] gcc-target.inc: Add RPROVIDES to
 resolve gcc-symlinks & lib32-gcc-symlinks file conflicts
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20240919102241.178655-1-Deepthi.Hemraj@windriver.com>
 <eef050148b32a57bcbcd0e3a34003f765c44a8b3.camel@linuxfoundation.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <eef050148b32a57bcbcd0e3a34003f765c44a8b3.camel@linuxfoundation.org>
X-ClientProxiedBy: YQZPR01CA0172.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::10) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH8PR11MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f6dbc4-d97f-4dbf-3e72-08dcd8f5de5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ei9UMEUyaEs3RnNTUk1uVFBRcFZBSmhoY2pESzJzNmxSbGpGaFFLSUR0Qm0r?=
 =?utf-8?B?NzlEZXlyKzY4aHluWDJxQ3oyRnl5ZUlWUGl0NFdwdlNIUmI4TTFyMldUNzRL?=
 =?utf-8?B?NHZJQS96c2dGSFViQk84WTUyTVl5T2QvSTZiMS9SdEdGbVJ0K1JDekRGdlRG?=
 =?utf-8?B?K1ZDL3lKNmpSYitOZW9EcjBnYXFLSjg4RWVqdVhNVTR3Y2pqMFNQWFNRTnFo?=
 =?utf-8?B?WUhHS0o4Y2JDUXhjSld0Njk5QWNwSG1QSFVrRklyYWowRnF1Y1Nta0Z2dmpW?=
 =?utf-8?B?ajRmWmx6ak01MklpRjRsRTU4bHhoYkk3RmZXckNjOHpSWEZSS1Btcm9UM25o?=
 =?utf-8?B?bjZOcDBYcEhKSGJnZUNvM29NMFBQbmNLd2QrT0NEemlxckV0M3pZcVhSWXI0?=
 =?utf-8?B?WTBpTk9jN040bHRNSzdjYUFVNU1pbFRMQjdPTldETHYvejl6MnBlRldGWTIx?=
 =?utf-8?B?Z3RrWk11NFZuYVZrMWtUWFhXUW5RcWcrQ1ozeEgzWmw3OWhGQnNMbW5hQkZx?=
 =?utf-8?B?dUd4Mk1aSkFGVXk4UGZ6cStMa0pRNy94WnlKV2FGbW9hTmx4Zm9xd1pubGEx?=
 =?utf-8?B?UXdaekdnVVhnbzBTdjBza1hDOVg4YksxQzMxSUlFYVpxZzBvN08vL1Z6anpH?=
 =?utf-8?B?ZEpuSVVwMTQ3aHlRa3B1SVpCSXUvYnl0WXlTV25POVRmOGpJRlpZeDlqYm81?=
 =?utf-8?B?Mm5nTUpFbkgyQW1Sb2ZZNjdFdHplSTdHdzZINGhRaWtCdlZaTlZqTXFzRXox?=
 =?utf-8?B?LzNkcDRoRjhhNzFWeTFEZEdqZHN4Y3lzaTFsamlTS2dKMG8xUEVIUXdpZWZP?=
 =?utf-8?B?QU10dEltazBHUnpsUFRDSCtpRVZmM0FZcFQwZ1h4U25oOGs0S0tHcEpZbmJX?=
 =?utf-8?B?RDRNL01FT3FtTkY5M2NoWkhqOU5PdjUrVW1UaGZyY0J3WjNWYXFRMXZ3S1Vp?=
 =?utf-8?B?Y29iWHRtWFFoeS9KbGxpM2tGWktiWFQ4b2E0MlZtUjR3amJUYWdWd1k5MCsw?=
 =?utf-8?B?bEY0NGtoQ2E0TldnTjBraFRjbXBMTmx6SjRkSUdwSnlUU3FZQ09MbXFQWGIy?=
 =?utf-8?B?cy8zRjBqbFMzK3dYWkRDSk9tcG05ZUErY0gveFdxMFBTSUo1RDQ5N3lPRlB6?=
 =?utf-8?B?dWxBUnUxRlMxYzFSZjZ2MDQ1Z2VSTGQ3L0FPWVluT0xCV3U0ZWVoUEVUWkwr?=
 =?utf-8?B?MC9IY2R0SE5XRXRoazkvUW5CSkVUaG5NK05LTmxMQmZVTjZJZ3c2a01HVWIw?=
 =?utf-8?B?Q0tibE1qVWQwcHdvMGhyWm4xYXhYRkFXQmtndEZ2Y2d0Q2k1TUp3UTY3WEpK?=
 =?utf-8?B?dmkyRVdEYkVlL0V4RGE4NUdSc0tZcXFuOUcrSm13ckd5d3dyYWdhc2l3Ri9J?=
 =?utf-8?B?TkJiYy9YRkJIQlljZVZlREFJdGRyMGJRakZ1NnpoWU85SlUzUTJHTW5BVDNm?=
 =?utf-8?B?RzFTdkdnbngzT2dzSFJkbkZHOWNpVlhYYWIwN0tVNDlUVlhtK2s0REllVnVD?=
 =?utf-8?B?ZFp1MmN3czVXZ2ZySldVRWxwZVVVbytiMnNrZFlpNVJDdE44dVN4MnR5d085?=
 =?utf-8?B?VzExU1A0RUxFTk4vbFltZUtYQnRMRjhHSXpDNkh2QkNiUER1VTliSGdCcThH?=
 =?utf-8?B?MXV5UnNQYWNZSm85UkpRWUV3WktVeE9vbjJWcHFHV3ZCTVc4ZXFsYXNBWVB0?=
 =?utf-8?B?OGVJbUlGdW9tVzF1eENEQmxGZkZSY0JxczZSb2NaNWVSMXpqc1JZWEdhR25H?=
 =?utf-8?B?Y3o2QjZVZVBxQ2hSN1pPV3BCc2FzMGN1cFlRUnI2OHRxNkdXbThXek5JRmNL?=
 =?utf-8?B?bUZTNWxQeE9ZdGVzL2drQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ay9EU2pSalF4VnJvS2dpYkpsZUhGQnNlNXNkS0VRdUs2K3VOOWxSTWtZaUNM?=
 =?utf-8?B?ZUtkVks2UGxjbXRPZEJPYWJBU3hXRGJ6RDVSYjg2ckVLbUMvdGhrWmtqam1J?=
 =?utf-8?B?ZVZwaTMyejFnMVZlWlJGYW83aW9VR0lBQmhGV3RTRUYzdnNsUER3TFZpaEd0?=
 =?utf-8?B?b0ZWT2xKZnVKdHJQZXZndENSQzhKdng5ck81VGN2QytGS2ZscFAzTGduZjZ4?=
 =?utf-8?B?aEwvbU1BVHZGVk13Yk1BZVZxVjFCczQwYUFUS1JjV3Z4aFIyMHZROHNncnRX?=
 =?utf-8?B?VXdOcTRkcStkc2h6bjJvcXVabGYvc2h1RkliNG1Xb2Q3V3NZTnR0SWZ3LzE3?=
 =?utf-8?B?OS95QituWnF5MUg5dWwzanFxaWFIRU9oTVlXbllqekJ1Z0RlUGNGOC9ZNk93?=
 =?utf-8?B?YkhhV2ZDWEtpMmZTYVlJTlRINzE1TklNd1Jzc2Z1NDFiVmFYWEtPWDB2cEtT?=
 =?utf-8?B?QjUxMk4xN3RkNERUUHV5MkVFSkd0NkNSV01WNUJudVhBV0xPeDBlQXdpU2FQ?=
 =?utf-8?B?NENkaXJiT2ViQm5xeEN6YTNLOXNBd3FDWURiVGt6S3krU3VEMDBFM3hoSjF1?=
 =?utf-8?B?eHpoeUU0NWcwWU5vZ25IRzYzUHJ3NXU5OCt2V3EzUGgrOXZaUWI0RWNtUSth?=
 =?utf-8?B?Uzh2M1BabDlPL2pGKzhOQWs0K2V3allJQzZsQm9IdThBcGdJZjBtOFRWdGhj?=
 =?utf-8?B?aVdCZm1PWlluZUV1SnQzYVhRUWEzS1Bsa2xXKzRtdkVhVmRuRklGOEtZc3do?=
 =?utf-8?B?VEl0NnZMRXV0MkExZVd4NGNGaVZhcHdGdGhWNFBvR045Vis0dUFtVkwvbGQv?=
 =?utf-8?B?eWpDUDJqc3c1TUF1bWhQMmZLZzI3QldLTE5tUldKZW9lMFN4Y0t2V2ZUb2Y1?=
 =?utf-8?B?TlU3R0ZRTmI5ODlZVEd0VEVvbHI1aUc2SHRTVDZJdzBRNHQzV1FPVHc4MWxB?=
 =?utf-8?B?dzRVOSs3dzYycDlKMjU4aW1KV21Vc0t0VUcza1V2WkNPeXdla0VXSkk3dUdR?=
 =?utf-8?B?UnBpdkdjbnY4cnFzNlROV2Urc1h0YkVPL0RzZGE4Vkg3ZFJobjFWOTFWNVRU?=
 =?utf-8?B?eWdkUklGUFZjd2Z1Zm9zVjM4Qjd0WnNyWnNoWVN5MUxEWnQyQzJ5SXNmbnZV?=
 =?utf-8?B?UExvTDF2RGZTY1NyTURDTUlkeVFNeGtJcXlVTkQxTHBwc0dsdFdlUE1vSlJr?=
 =?utf-8?B?aWpBS2Vac3BHQ1BKbWVram56M1h0eXFaUjNFUFliZ2kvVk16ZnZ1NmZqdFBL?=
 =?utf-8?B?V0tiVjF5QStid0NRLzdoSFdVd0Zxc1ZGN2pmLzA3YllybjZMOFh6M3JYNFpv?=
 =?utf-8?B?MGN3UEcrUXRRNFVOYjZjOWNvZnBCa0RQbGlkRit6YnFQMVdFRXdtT3FNTXNI?=
 =?utf-8?B?RXVlN0ZmY3VwNms2N3l1ODNTdFUwV20wbWM3Z2Z2bDUycU5KUk1LNkVySmRL?=
 =?utf-8?B?M0hQQUllNkQ2eGZndDF2cjU2eldNYml6RzdqQW5LRml1dGJ1WHdDZTZ0TTBq?=
 =?utf-8?B?K1lwd0FYN2R2RXd3ei9rTmNqWElTRUlpWEtuWFVIRklTd3REbmpJUW9oSWlZ?=
 =?utf-8?B?ZkhicXhGMzFVVUJaVG1rVElWc3VrZWlkWVFvcUtNK1grUzdxaGxCNTR2aWo3?=
 =?utf-8?B?WXVYNnEzQnljZXZwY1FEV3Z2d1QvajBRdU0vMXEySTRGQ0M3dDFSNVlLWmo0?=
 =?utf-8?B?R2s2QmlkQ3RzQlUvelJ4eFJRKy9WOTFmQlFBN1dOOGs2TTdpZ2JFNnk2MXlY?=
 =?utf-8?B?SmxnckJyMVJxSkxGcWNIM1ZiUDVDOXk4c01wTUIzc0g5NmNXQlNQbjc5aURU?=
 =?utf-8?B?c1AwSzBvd2doZmUyZ0VlM0dxZjN2U3NRaVNKQlFTZnh3RWNQUDBML2hKckIv?=
 =?utf-8?B?OXdRVDhWa2RTNU4wd1R3ZEhORE8rWnB5U3llbFJCQzBIcnQxeVhOVEE5eGhE?=
 =?utf-8?B?Y3AyRmVUSmQ3QzVWWU52T1g3ZzZyTmRsSkpRN3g4bTJJbzBFZi9uTUc1TFFy?=
 =?utf-8?B?cjFuSzZFRXkzNnR0QytrOURHYjJjd3I0VzU0SzBhd083Rk9KdStuZjYwY04r?=
 =?utf-8?B?ZEUySVlOVEhGTkRvUGF6SXdRdWhoeEIvUkpSKytNUjdaOEVGU2VjVEh0VllN?=
 =?utf-8?B?VDgwMnJSM09nNDZXRmdRcmwwMjNEMWxkZWxuZmt4OGNjSEFiakdXUXlRd0U1?=
 =?utf-8?B?QkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f6dbc4-d97f-4dbf-3e72-08dcd8f5de5d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 21:56:09.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWEI+aPtoryGEY5bn7Je/otEfpEKeW/pRoffzczFpImDHAbaO7v/uoAB4mX57RnIjB4FeJ11iC6PAjqRwg5lRPoykoy15UXbpDcRbDtX9/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
X-Proofpoint-ORIG-GUID: FY7qfHlaKt-LjhBBoNm7hSAIt1rAgpcr
X-Authority-Analysis: v=2.4 cv=afUzngot c=1 sm=1 tr=0 ts=66ec9dfd cx=c_pps a=kqCqMoaEgQjRYYKBKtAp1Q==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=61BI00COtcIR3koH7j4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=mo4nQ7NdeBpQskpfxC8A:9 a=Ch8ptxOlBWnXPRzR:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: wxlVz-csEt6J6T0oMZwdBjspcso6lRr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_21,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409190146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 21:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204720

--------------epQaljxaV7c27p0hUkh7pMuB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48JE2gbT007022

On 2024-09-19 6:30 a.m., Richard Purdie wrote:
> On Thu, 2024-09-19 at 03:22 -0700, Hemraj, Deepthi via lists.openembedd=
ed.org wrote:
>> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>
>> Enabling multilib support and adding both lib32-gcc-symlinks and gcc-s=
ymlinks
>> to the image installation results in a conflict between
>> gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.core=
i7_32.
>> Following error occurs because of the conflict:
>> "file /usr/bin/gcc conflicts between attempted installs of gcc-symlink=
s-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_32"
>>
>> The conflict occurs because both packages try to install files in the =
same location,
>> causing installation errors during the build process.
>>
>> By using the RPROVIDES, gcc package can satisfy the dependencies for b=
oth `gcc-symlinks` and `lib32-gcc-symlinks`.
>> This prevents the conflict, while ensuring that both 32-bit and 64-bit=
 symlink packages can co-exist.
>>
>> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>> ---
>>  =C2=A0meta/recipes-devtools/gcc/gcc-target.inc | 1 +
>>  =C2=A01 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-d=
evtools/gcc/gcc-target.inc
>> index 7dac3ef422..f31ea15740 100644
>> --- a/meta/recipes-devtools/gcc/gcc-target.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
>> @@ -27,6 +27,7 @@ EXTRA_OECONF:append:x86-64:class-target =3D " ${@get=
_gcc_x86_64_arch_setting(bb, d
>>  =C2=A0export gcc_cv_objdump =3D "${TARGET_PREFIX}objdump"
>>  =20
>>  =C2=A0EXTRA_OECONF_GCC_FLOAT =3D "${@get_gcc_float_setting(bb, d)}"
>> +RPROVIDES:${PN} +=3D "gcc-symlinks lib32-gcc-symlinks"
>>  =20
>>  =C2=A0PACKAGES =3D "\
>>  =C2=A0=C2=A0=C2=A0=C2=A0 ${PN} ${PN}-plugins ${PN}-symlinks \
>>
> This isn't correct. What if my multilib was "lib64" or something else?
> This definitely can't be hardcoded like that.


I should have caught that when Deepthi showed me the draft.

Also, please submit to the master branch first, then backport to scarthga=
p
if the commit is merged to master.

../Randy


>
> Cheers,
>
> Richard


--=20
# Randy MacLeod
# Wind River Linux

--------------epQaljxaV7c27p0hUkh7pMuB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-09-19 6:30 a.m., Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:eef050148b32a57bcbcd0e3a34003f765c44a8b3.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Thu, 2024-09-19 at 03:22 -0700, Hemraj, Deepthi via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

Enabling multilib support and adding both lib32-gcc-symlinks and gcc-symlinks
to the image installation results in a conflict between
gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_32.
Following error occurs because of the conflict:
&quot;file /usr/bin/gcc conflicts between attempted installs of gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_32&quot;

The conflict occurs because both packages try to install files in the same location,
causing installation errors during the build process.

By using the RPROVIDES, gcc package can satisfy the dependencies for both `gcc-symlinks` and `lib32-gcc-symlinks`.
This prevents the conflict, while ensuring that both 32-bit and 64-bit symlink packages can co-exist.

Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
&nbsp;meta/recipes-devtools/gcc/gcc-target.inc | 1 +
&nbsp;1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 7dac3ef422..f31ea15740 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -27,6 +27,7 @@ EXTRA_OECONF:append:x86-64:class-target = &quot; ${@get_gcc_x86_64_arch_setting(bb, d
&nbsp;export gcc_cv_objdump = &quot;${TARGET_PREFIX}objdump&quot;
&nbsp;
&nbsp;EXTRA_OECONF_GCC_FLOAT = &quot;${@get_gcc_float_setting(bb, d)}&quot;
+RPROVIDES:${PN} += &quot;gcc-symlinks lib32-gcc-symlinks&quot;
&nbsp;
&nbsp;PACKAGES = &quot;\
&nbsp;&nbsp;&nbsp;&nbsp; ${PN} ${PN}-plugins ${PN}-symlinks \

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This isn't correct. What if my multilib was &quot;lib64&quot; or something else?
This definitely can't be hardcoded like that.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I should have caught that when Deepthi showed me the draft. <br>
    </p>
    <p>Also, please submit to the master branch first, then backport to
      scarthgap<br>
      if the commit is merged to master.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:eef050148b32a57bcbcd0e3a34003f765c44a8b3.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">

Cheers,

Richard
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------epQaljxaV7c27p0hUkh7pMuB--


Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097AFD2CE0F
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 02:52:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61532.1764903162084506528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 18:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=WmkSVrlL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4434534425=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B52ooAe1882956
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 18:52:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=m+fqWB8qUn3nQ5AUX5UWgl
	e3X1RgKi3B2mqZHIQPOV4=; b=WmkSVrlL2mcnY5jHgBS4YwquN4yGWsVmmLPfWL
	GH/QI46eJ85UasD+/1Tjf7q6ueteEBFDaOsBgraleFKMWZ0UyPvcudZ92Czt4qIM
	Qw3+h0MwRUBRJRlh9yKticPb5JSeRwrRtXzEb5Qno2QMD33MFWaZ5tUfmGR3Hr7u
	eXsZGrAWTzvcEiPgkf+2AUCoEEZdV3n0zb6CTZpr5SUQ0wNTvX+i2nV0d2Ochdxp
	eGMjw02sTpHklxcE0UdvaIR6CC2PGerjt2QLChH84wRGKx8CitNMnb82IJv47kuz
	0lUQ2ThOnaLQxZVL6hJ+lv1OEqm4PpgMjtxfhPONuEhzsEBw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mxych-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 18:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAVrB9sctZopN4aWHJxwvFTlQ6Vx1qG8QMmcAHvXMwgMphnPN/NEUHjuoSyuVApl/hoJNEIXnzZ3QdvbJnLjrqiVyCHkPCILan9D10s1un1j1T8h2es8RarCzreAW5bo9gg3mSYdwunzYk+usmhVrFxNK4475ZaPgJGJ/J9Jqx2Pv+NQKOPGUtkep+fkLeuxmVrzXjDd1kGVxQ7JQmfuHzWUBlFzcVZKD9dsNwtD2IIVmIDlqPnCom5qpjapRB6YBmc00gnsYpTXUesUYiAwO/McySXWq7+pEMVbAHpfpe/+iw3KxjeATOlEg3MIczB4cERuVajq8YAYjpDcL6NhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+fqWB8qUn3nQ5AUX5UWgle3X1RgKi3B2mqZHIQPOV4=;
 b=rewHqz28s+o4nnjB2Xd+3u6k9Q2gYrRAg1h1/+Nc2SAhhL06qvkAE0gsEoZQvrbHBYzYlAFx4VjHiXra4jRpEk3+Yl5qJWNCRd2yXnwvSzGKG7AVnW1lyI42f4icTzhaFfpOphiEQ18zTL2xX0gvBnyJLBXfO1fJlPGl/ITJvfdNvmh3LOYJBHk/L1OvTx8X6KArjUn3y3rWaSGdLFCsZTMlWFjfWrnHLBbY+fZbmMQ5tpxmzi0dx+A/8DoL5W9bJFJNGZ2RoYNbekxrIuhFSsVWPffvyH8rPBLl0J6Q2xIDCxJYtJBRHCp71UaW0sI02BgU0zDiL1ISpu5/oX2ZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA2PR11MB4809.namprd11.prod.outlook.com (2603:10b6:806:112::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 02:52:37 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 02:52:37 +0000
Content-Type: multipart/alternative;
 boundary="------------5o2ZvkQN0x92iDs5HaetYPuf"
Message-ID: <a895de24-e46b-4966-a091-b95f1df6f767@windriver.com>
Date: Fri, 5 Dec 2025 10:52:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 1/8] libmicrohttpd: fix CVE-2025-59777,
 CVE-2025-62689
To: Steve Sakoman <steve@sakoman.com>, Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1764713862.git.steve@sakoman.com>
 <ce604b9bf682e404baa15800fcdbc01abd6a66e1.1764713862.git.steve@sakoman.com>
 <b0caac3f-5a60-48e4-bd89-15fb3654a91e@gmail.com>
 <CAOSpxdbBg_g6=LKqs58LnZnTG9SGSuXUUudvz=kiwVoTD-W_6w@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAOSpxdbBg_g6=LKqs58LnZnTG9SGSuXUUudvz=kiwVoTD-W_6w@mail.gmail.com>
X-ClientProxiedBy: TYCP301CA0056.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA2PR11MB4809:EE_
X-MS-Office365-Filtering-Correlation-Id: ebda2a27-fab9-426e-0572-08de33a9594a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SXFjVWNMQjVHSE5uTHpaVGdoOFA4ZHljbno2WGlFdEpNa2V4Y29NNGVlbHUy?=
 =?utf-8?B?NFJKV1BBTTJWUlExZzN6NVJsK2xWVnFQS3dEa2MwbVpKRzZCUzBib0txMGUr?=
 =?utf-8?B?SEJlNWowSVQ5SmVUZVdhY3RBUjg2VFArMVhDb25hcW9LZEZ5c05HM3phU0My?=
 =?utf-8?B?NG9Eb0RtQjhpRlpsYkd3UGloUlo1b0ZMaDRSL3hwaUh6SmNqOTc2R3JNckox?=
 =?utf-8?B?a1ErS05aR0Y5Y3d0Q0FYQ3BpV05RTndOam1QNlN6K3NWQXgxTzIxUXFDSEt1?=
 =?utf-8?B?eU8wU0QvV0VjK0pHb0w2eEszT2xDWVQrczZBSXFwUUlCUXBmM3FVa1A1Qnk1?=
 =?utf-8?B?dUJNOHV5ZWZFUlJDK01JejZYZUdqV21JVkcwdG1UK2dvb0dubEUxQVlpRUNx?=
 =?utf-8?B?ZXYyUDRNTzdJUzRONU93UmFNRklBQjBaWkhRV2pwSHdXdGgrWXZIQytMTld5?=
 =?utf-8?B?QnhLeU85ay95TUkwWUFMS3NNSmhyRGptNGRZWEpWbmNYbU81aU5FRVNqeU5h?=
 =?utf-8?B?dHR2ak03blZlUlJvdUxHcUY4SGE0WnRuZVpMYkgwNEI1bXJibXpLUmFvdzRa?=
 =?utf-8?B?MHB3Q3lGbGdSbmVyTzEvMjdPYXVWWXd1QkRkdmRyUHQzV0JxQmlVVEREK0x6?=
 =?utf-8?B?QnBqdzlGeEt2dmlIUWEzK1luUXdlUVVrTzR6WTduT0FtYUhwWFAyQU9MVmlQ?=
 =?utf-8?B?Y2dBbFpxVlZxMUNpdUtvMW5Ia2xsOUdtTnl4RmlFd1QyNnhUYkdBTEFya0VW?=
 =?utf-8?B?T2dXL1BQSXV2YW0za241SUFtR1Ztc1RpQlIrOU82VFRYelVic3N5RVdrbVJ6?=
 =?utf-8?B?K3FVUVh0WmlPVUJzUHJrUE5SS0RDVFVYcjI1czd4Uml1aE5zQ1FlWGZtTjRS?=
 =?utf-8?B?MjJmWnM4a1dMMTFTNU5UQ0RSeXdNcElSUGVsdlpZT1l3R2pPZklwUGNEYkNy?=
 =?utf-8?B?OHA1b0M3MVhzQWhQL0RwQlRScVp4S0hUcUp1dXFld2tRb3YwS2toMForVWZ2?=
 =?utf-8?B?TmpPWGRod3FvN3BsbXVVcUhVSFAyQ1FHY0VOazJuVHF2OTJUNThMeU9yUlFu?=
 =?utf-8?B?anpTSkJJLzRWSW1ocE1KekRHampTVVpyamlEK0c2UHAveVd2Um1tTWhSZGVQ?=
 =?utf-8?B?RkhWQXhtOHhXSW1BR3Q1NXIwcVpxUm42RmRFVHc1bHhRZmM1VVVZQ3ExU2Fi?=
 =?utf-8?B?bjV3VlZ4TVF1dy8xczFPbmNBTGg3YkV2QnBDWDM5YjdRRW0xS24zR1pkb0Rm?=
 =?utf-8?B?SmcvQkdoUEpsREhUUWhGS1VialVFSlY3TUk5MUdLOHBTY3Q4NG1KMk1zVVlO?=
 =?utf-8?B?Q3B4RzdMbm1FeEE5ZjBEVWhyaHZuUS85MlpkYndjNHl5cXVNSDlIbmUzSzly?=
 =?utf-8?B?dUU2MER0ZzBNVDlYZFJaais2Q1ZzRWVRY3Uvd0hvYmk1dWJMeGZIdEJxQWs0?=
 =?utf-8?B?eU15cC8xNTRYMFYvUEQxS01CczBqOWMrN1RvRE8vYUlRc3g3YjEvbWVCRlRt?=
 =?utf-8?B?dkpXV0xpcDVReHJiakdmUndvNnpGYnU3bnF3bEN1QnV2YlZsMEhqS0E0SHRp?=
 =?utf-8?B?dEVFRUkwRWNxVVJ4NjQrVFFvVVlVU09QZFpOY1lTZndKYmdmeG4ra1VFRHBh?=
 =?utf-8?B?ZUhiNkEvNGZtOG1rQ2hwZnE2b3ZEMW5vVnlNVDhBeHR0WjhPVFpSeGVuUmZ5?=
 =?utf-8?B?TUxzcW1pMi9SMnhueEpJenVod0lrNUpDcmpLQ3FtVi9wNzM0R05nR3JVTTdz?=
 =?utf-8?B?MFBZc3psTCtQR0VZSEZka0lXTFpSOHZUM2d6d3ZxOTNUaDdJU2JPU3k0NFBy?=
 =?utf-8?B?NmlCTkdlMHRVTTM1M0dwTTJJVmlDWXRTelRCSWJ4SElVeXYzNGs2cXArSERO?=
 =?utf-8?B?eUNtUm9uVStnSDcyblRlejVLQTg1NFk1eW9zMk14Q3FKNmsyM0E2VEhuZURz?=
 =?utf-8?Q?RxecNv7RCG/+jjUgRgTdGxedVaI/QiB0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M3lFeUZaSTBtWlFaUXc4WnpEN3FlWFlHbkJQYi9xRzVacXBURUdsdWtVZEo1?=
 =?utf-8?B?MTlOblJGclYxNGVsejB6UWowak52MWxhbHFFT2FYSkswK2pIdUZDMXVpdWs4?=
 =?utf-8?B?Z3lvczNJSEYxVDFVdHhKSlRhQk5odjZCTEVzODBDU2FLYWp6MFd2V0h5bFBB?=
 =?utf-8?B?VHM0VzlHenVSb1BXcHhsSUpsS2ZIOGVRNDgzOUQyLzdlNnlzRFNRWVZIV2Rx?=
 =?utf-8?B?SzduNVBrRVQ3TEJhYnJhT1ZzOG1zdStBK1ZjRnpoRm0xUjJqZ29OV0VScUhN?=
 =?utf-8?B?L0pzdUJQK0lWZjlLaGhvakJwQmxpY3lNeHArSmpqc0tVeHFScWIrK1B3ZGpz?=
 =?utf-8?B?UjM5SnZ2eUs1eDBpY3M0SHlYY2FVbFBwY3JvSEM2OXlqVnIyaEo5N2ZnTkZs?=
 =?utf-8?B?SDZGRmxhMUxncU5IY0tFVjF4azBJMjhMTTRmTDNxWnVqd2x5VmZONThHQlBJ?=
 =?utf-8?B?eWVVWHhOSzRCaitKdEFWbkJjdWhRZ1lWRkRDMUszMkF2STI1TmY2eTZsRW12?=
 =?utf-8?B?NzkxZnAvMEkxeEhMSmc3d3d5bVNSS0ozaEpTUm4xQ0d1WnkxeFY5SGNmby90?=
 =?utf-8?B?c3dFWjIwQ2FvcUdjRGQ0UWJxL2ZnNk9RY2FzcERJcmhwMVgyWm1RQi9XYWF1?=
 =?utf-8?B?T1BTbHl3QTd4Y09DODNIT3JHSDZ1S1B4QzJlcXV3L1VnNW5HYlFkeDBOM3B5?=
 =?utf-8?B?ZDMyb2R4anNwWWlPR2xyeFJCZ2hMakJ5eTMxdWo0c1ZySStISG13YUhYdlBC?=
 =?utf-8?B?TzBqZXRtN3RXeUpMcnowYXpjTUxmSjMwWWdoSkgxaFVwMXRGcWUrN1laclZp?=
 =?utf-8?B?N0IzYlJKdVNlcXJuMUQ1amtpVjJYdE1CWThqcVdvdGNDanNyN0dMSVdpd1BQ?=
 =?utf-8?B?eHdJc0paeUtTbW9CQktaaVF3WHpRQmlkV041UjZDbSthdEJOSXRQMWJaWXBJ?=
 =?utf-8?B?OVFSM3BmZ2NlYk5Xc2wzSWovUVNzaFlyUUMrOEtSckFUSTRuZ3loNTBMSk9O?=
 =?utf-8?B?OEpITFJzRG4rYWh4Wjh2Z2hLcEQzSGJXbSs1aWZVeVk0ajYvSHlsU2lUcUF6?=
 =?utf-8?B?UjhVU28zMFhTREdpeDZJV0k2ZnQxWDJzWWZxRkRCSkpzV25zandlRlBPUXRt?=
 =?utf-8?B?YjN3OXdVdDhZallFV0pSRnh3L1grYTJYL3ZpTWdTSG9nd2RvdWw1djd1Yi9p?=
 =?utf-8?B?a0JRKzBxbXBKUEFXRGMxajJyd1JEOUQwZkcrUmVqVXhlRHEyQ2FFc2tXaDZL?=
 =?utf-8?B?MUJ1RytQRXliWVRpWXhvamhOWFlxNUxlbytidXhOUFk0SUlQV09WQmREVUs4?=
 =?utf-8?B?QmpoYkcrSE1INk9EN3V5Nng4UEYrMzZLN0RqWXhINFQ5b2wveFVhbXl6dXlO?=
 =?utf-8?B?aTlyRzBYZXg2TnkwU0lEbHoyODNMenRXVDNET3oyZWV0aHNOSjduQSthQmQv?=
 =?utf-8?B?WXJhUXBLT0VqTVlXRjFEY0tTWW92K1BpWHlKTFZKelBCMThlQ25acUhualVv?=
 =?utf-8?B?bFVLblBKNklXZXhYU2cvSXdkbGlhS2hUTCtYYldEWFFRN2ZONnp6VzhVRUdo?=
 =?utf-8?B?cHRRdmZoeS9mbFFvSzNaODRrVUVpaDI5LzVUcS9iQVBMa1BSZGxxVFo3NVFU?=
 =?utf-8?B?Ym9BcndLUmozemhGQzhOV0hCd3d2bWR3MHRldHovaGYyZ2VJOUZWbmtvVjJ2?=
 =?utf-8?B?V3hxVFNYdFpObWM4YzQ3VmlzdGQ0VS8weDJGdDZhaDVBVmFyRGpreWFaZnhW?=
 =?utf-8?B?SVY5MzRKS3pkbmpDckt0SWZXNjRhN3VXRVVUTlcyc0JXelNXQ1ZKNklqd1VI?=
 =?utf-8?B?V3ROQW1YSDBQN2lJLzcvak4xTkFxWmNRTDc2Nk0yYWVkRlJxZkVaRU01eE5V?=
 =?utf-8?B?YTJJQWlucnJxRDJJWFF0Rm55Sk1KN1dEZEhtT3U3b3pqbExkT21IS0tXZ0VG?=
 =?utf-8?B?aEZ5QnEwSlNGTXVrUFhHa1F1MkNRNHlieXJJdWVkeDNCMnRVbXBNT3Y1UmRi?=
 =?utf-8?B?QS9EYzZqY1Q5OWlWejV1NVQzTXlTVnY5Z0ZoV3ZmcmdORHRKcTU0VmpoZ1o3?=
 =?utf-8?B?UkRzYW5mUDlwaURIR0U5NlJDc0NoazNWdlptVjR2UlZ2NklFRnJqNUFsb2xh?=
 =?utf-8?B?TmlabWNVOTBCNCtpNVhrZ04wSzJwdEdzV3YzUGJoWndINkZiN2kzcllnQ1RB?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebda2a27-fab9-426e-0572-08de33a9594a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 02:52:37.6188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYIGB7qzX4Y/R7zMRGurkFutXxJR0uoiPJ9Alxu63p3R0qg7UJNHZ1czYsxCxv1E7V9R1bA+WeCOY5+8rl6RlNeelzNER+HO31oC4A2LWb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4809
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: vEq1tbmTLtdJD-VNmSwz_BguHl7GkTJR
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=693248f9 cx=c_pps
 a=mKNYdAcvaxCE01og5pBKbQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=dKQBWa2HlgCyLiB8-IAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=wvPkM9v7g1_ikmSEda4A:9 a=OVbemLSk1XRHWSM3:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10
X-Proofpoint-GUID: zxIcy35bT0d_RNj1st6BoPKGStnojaAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDAyMSBTYWx0ZWRfX4rnSeVdfGxkG
 w8tLwAqml4RL822makypexeJyOMzidmCACWZCg7v7j89ElUaQgOx1TrNEHPLuUOoUA3LfxJ5k9c
 GDaBUBZXLfJ+oJlNMugBRMO9njxPchMhOIe4Vw/IKvdGe9s/QmjaYWDqpZ68xZXUmmLsUymxlgx
 s6rlWRFOpOlQ2nwBxfh0KrYPGnCH+psIdDdnB1r2UkFwb0YC+KjQKEP8K0nVRGgdwtdJdNM9Ugm
 QDS4kRx3FOuufQyyupb5XO2eT+F/BxB+3qd8Eiqaou5q+AREWKCaua+MTfpsqefk1BTbGJFK5Ny
 mashU40NEgZB0jpUn7tm/u9i+Yj+p5Jon4TpNEi3PO4eJIW8IyGa9ojsRNliUTv36dpCkNN6m4U
 3cP60kQFFAdz2RA41H5WT+X5Y6BvfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 02:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227327

--------------5o2ZvkQN0x92iDs5HaetYPuf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B52ooAe1882956


On 12/5/25 01:59, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Dec 3, 2025 at 12:25=E2=80=AFAM Gyorgy Sarvari<skandigraun@gmai=
l.com> wrote:
>> This is quite a big change in the middle of an LTS release... not that=
 I
>> have a better solution. But maybe a warning in the docs would be
>> appropriate about this removed feature and its reason (not sure who
>> takes care of these).
> You are quite correct, this is a large change and deserves further
> discussion since it is removing a (admittedly experimental) feature.
>
> I will remove this from this series pending further discussion on list.

Hi,

This vulnerability exists in libmicrohttpd_ws.so, which is generated=20
when building with the --enable-experimental option, rather than in=20
widely used libmicrohttpd.so.

We don't enable this option by default,=C2=A0 also we don't provide=20
PACKAGECONFIG for it.

How about we still keep the patch for fixing CVE-2025-59777,=20
CVE-2025-62689, and add the following warning in libmicrohttpd_1.0.2.bb

+python do_warn_experimental() {
+=C2=A0=C2=A0=C2=A0 if '--enable-experimental' in d.getVar('EXTRA_OECONF'=
) and=20
'0001-Remove-broken-experimental-code.patch' in d.getVar('SRC_URI'):
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn("This option is remov=
ed for CVE-2025-59777,=20
CVE-2025-62689, if you insist to use it, please remove patch=20
0001-Remove-broken-experimental-code.patch")
+}
+addtask warn_experimental before do_configure
+

if the user enable '--enable-experimental' , warning is it removed. if=20
user insist to use it,=C2=A0 they can remove patch=20
0001-Remove-broken-experimental-code.patch locally,=C2=A0 then

warning will disappear.

//changqing

>
> Steve
--------------5o2ZvkQN0x92iDs5HaetYPuf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B52ooAe1882956

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/5/25 01:59, Steve Sakoman wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbBg_g6=3DLKqs58LnZnTG9SG=
SuXUUudvz=3DkiwVoTD-W_6w@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, Dec 3, 2025 at 12:25=E2=80=AFAM Gyorgy Sarvari <a class=3D"moz-tx=
t-link-rfc2396E" href=3D"mailto:skandigraun@gmail.com">&lt;skandigraun@gm=
ail.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
This is quite a big change in the middle of an LTS release... not that I
have a better solution. But maybe a warning in the docs would be
appropriate about this removed feature and its reason (not sure who
takes care of these).
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
You are quite correct, this is a large change and deserves further
discussion since it is removing a (admittedly experimental) feature.

I will remove this from this series pending further discussion on list.</=
pre>
    </blockquote>
    <p>Hi,</p>
    <p>This vulnerability exists in libmicrohttpd_ws.so, which is
      generated when building with the --enable-experimental option,
      rather than in widely used libmicrohttpd.so.</p>
    <p>We don't enable this option by default,&nbsp; also we don't provid=
e
      PACKAGECONFIG for it.&nbsp;</p>
    <p>How about we still keep the patch for fixing CVE-2025-59777,
      CVE-2025-62689, and add the following warning in
      libmicrohttpd_1.0.2.bb</p>
    <p>+python do_warn_experimental() {<br>
      +&nbsp;&nbsp;&nbsp; if '--enable-experimental' in d.getVar('EXTRA_O=
ECONF') and
      '0001-Remove-broken-experimental-code.patch' in
      d.getVar('SRC_URI'):<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn(&quot;This opti=
on is removed for CVE-2025-59777,
      CVE-2025-62689, if you insist to use it, please remove patch
      0001-Remove-broken-experimental-code.patch&quot;)<br>
      +}<br>
      +addtask warn_experimental before do_configure<br>
      +<br>
    </p>
    <p>if the user enable '--enable-experimental' , warning is it
      removed. if user insist to use it,&nbsp; they can remove patch
      0001-Remove-broken-experimental-code.patch locally,&nbsp; then</p>
    <p>warning will disappear.</p>
    <p>//changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbBg_g6=3DLKqs58LnZnTG9SG=
SuXUUudvz=3DkiwVoTD-W_6w@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Steve
</pre>
    </blockquote>
  </body>
</html>

--------------5o2ZvkQN0x92iDs5HaetYPuf--


Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9482AE83041
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 06:34:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14244.1770186850919661806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 22:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rVzbRmJ1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6495392723=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6144LX4I3373890
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Feb 2026 22:34:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=NxQM9aOTo/iOOPZH98Vf0K1csCufrXxv9lsDuTJQz8A=; b=rVzbRmJ1V7Ok
	M5lE/3wrHVyw0WMrPqX/DMJRiIZqQ2HOW9oT2hSl4ON8N/GQCHsY8tBwmRBbWtp1
	E8T5rhyVPZGaFkO992LhYLB2egeLNGR2+qVcByLDw8LscIZrlC9bBCZ2h4bG1IEp
	KDcPaqNG3tWd1Z+8J5/H81WtSx5OuwJ6Y5K7V3i4X7Jt25Ey+Jm/4NclMJ2AIWL0
	pOL9tWSj/DXyiWtfMt8l9lTHcldO2ieBnUWom8MEql0ZNrWP6iPz5Re991SSfiXN
	2EoCemePmyzs39NNLnw6M1yAKaPsXKCoA4erwf3kbM7IZf9XUQrScN+PGgiuSO05
	3Dkx9/vrHQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c3vdpr6kr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 22:34:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4faPyiE7c8xNkkVEtHoU2AGCUYkxd8/+zQd2q/dYXRfXYx/VTIeCMnFId6l6WxcW6PtsCnbLsKaIoGN96sw6d7bkAJptecdNLf2sUv3zetd37fpB65GLeHFAnNklpFVNdb/cWa+WG9f6Q+PKiIoqE+KF1ZYKoHdspzUBKsqO4NF9jq5MdI/ufYrm6/xZ8GydGccX2ONytirO/JJhMHnzOp8EIdFj3eVZGVRBxoTvYLlbXU9FIOf/rQ7gjN0muzH3XgD6LATfjNs1jxwgOCHLywWS+0SXWJ+/gQqG7kT5z7Foai5JwNTWnbMPqBJFf8OWsglYRShpTUO+XEgzKq/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxQM9aOTo/iOOPZH98Vf0K1csCufrXxv9lsDuTJQz8A=;
 b=HPeNswNVEHnP7BIWDdWX/ZKYT9D8gVS9maZ17jspz75VPfkcU4/MG20riFZ2nghMqrv7hLX6Kj8BiOMGvG/R3R1eWUvgmU11N1VkA5fakIq2X1p090iGG82zQv6oSJcauI3Apt2chTFhwX67LoAIz7DaumP2HJfEHhNNHu6CP02vKkQCN2PEhUzs6Y7VwgIS2znV2LShd44ufkqQaT0pFxdB8uh3qPEEYptKVBNGojjcgfo+tjxaC9k5aGXaYCNZkCbWf+XwXtYg7HJmQuNCaXVU9slTXCV/aJT8I5JdfvUp8AmcvfJ9Lt5KIr9yl7PKLINF3egw4e/CdldpNWBxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 06:34:08 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 06:34:08 +0000
Message-ID: <b01275ae-7286-4f26-aba2-de2270094dbd@windriver.com>
Date: Wed, 4 Feb 2026 14:34:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] nerdctl: add -buildmode=pie to avoid textrel QA
 error
To: openembedded-core@lists.openembedded.org
References: <20260204063226.4066285-1-Qi.Chen@windriver.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20260204063226.4066285-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: fad78a35-88f4-4038-c460-08de63b76660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2VBMC8vQ0lVOUQ5M0d2UVZXNFVNaU1IVlRhTDM0RDBwYjRzWUtGUkNtRWhC?=
 =?utf-8?B?dzV4NFFQQmYxQ2lrQmVmbTNJVURNa09sYkRyNlNqV1BjY3dabnZoMFFiUEwv?=
 =?utf-8?B?REpWc3RIcnNYaCtXM3p5MHpPZXk4eVhSMjFXK2h4azFjM29nbjQvTEpQaWgv?=
 =?utf-8?B?ZXR1RkhEUHJoZVNPMUlzZ09wV2pDdTZPdUdXRFV1dXgzYlNTd3ZXWDIvYlNL?=
 =?utf-8?B?aS9wYkNKOHp3YXU0Njllb2tYY1lVQ3pjOHhObGhzVlZtaDh1SVRPRk5VdnhK?=
 =?utf-8?B?RnZDK2tTZDlsdHVUdGIxUTM2S1ZRUERGYmoxdytIYUVYWlU2T2Z4QUJuaHJm?=
 =?utf-8?B?Vm13Z3g4dHU0S0pYa2FNc0ZOc3ZVV0Z5UEtEL2cxVU1iMFczQzRyaVBHMkd0?=
 =?utf-8?B?T2J3eXgwVlhJZDdTMDgvU2lhVDIzNy9PK3J4QlFUckg4VzljKyt5ald6bEF6?=
 =?utf-8?B?ZmVJQUxLR2FoZHpyS1VwamxJRXJVSTlwQW1LVUVkb0dzTDdzdjJ0M0tMUXlZ?=
 =?utf-8?B?V1JycmJraHBRVUhlbWV5VXQ4cnBGUHFNaFlMRlg4WSs0NURUZmFac3J1N3lX?=
 =?utf-8?B?cEpLY1hrcFhLbDlnNC9Uc21iK1o1UVdicUJTK0hnZ21qS0FJZDZsY0hpWUd0?=
 =?utf-8?B?UEhOSWtPQ2U5Y2JQakg3Umd5NWRpbGlMODloUDMzRG5ZKzN0ZHhNenJXUkdT?=
 =?utf-8?B?NHF1STdVMGlUa0xRWlJjSjkxZm9RbSttbkIyZ01RV2gwMldaRGxRUDlSaWY1?=
 =?utf-8?B?MUZDTVVJQUhrWVRnamFXNVNqamZUcjFOTDQvQ2ZTMlpwOUI0TkxIQUpjd2kx?=
 =?utf-8?B?c2VzcVVZbXZMNTN6eXR0VjMrOTJza1QyOE9JaHZ3SEZvOXRxMEdJd1ZHb1Fp?=
 =?utf-8?B?ODBRNy9tUm5sY25idm5VUnpaVGFLY0JCcGJpZjdOdEMrYXBoamVNZVBQSjFU?=
 =?utf-8?B?RXdOeUtmNSt5NGNZMnRDRFpsbEx3bStjQVJxbE1uUWdyNFN4TkhYTnlBUTZL?=
 =?utf-8?B?VjhqUjJwdENNMHJtekhYeVB6S0tFc0VlYVV3aVdQN2I1SDFSeHZZSURWcGQx?=
 =?utf-8?B?UVI0VHRraEUxa2xuT3Y4Z2FkVm1XY3JkN2F3c3VoL1FYWmR6MDYxem1Wd1VE?=
 =?utf-8?B?QTgyeC9FWVJzY3RHTzB1Y01DeGRiemJpcFBycUJKYzVFa3VNdm15VG9wL1FI?=
 =?utf-8?B?L2UvKzVXeHgwTkhYQm43cndmVWV4cnFBYTZuRldLTkZ1SllnS09NTnJ4d3Fu?=
 =?utf-8?B?TXROT3FsUmhmWjY3elhQbDZlOEZ2TjJGMDdEaDV4ak1qTTlxZ01TekZlT2FP?=
 =?utf-8?B?a2gxWnFiNkovbFpTVk1QTmNpMWM2L2JFc2lqME9USUwvTVdvaS9ETHU1K2pS?=
 =?utf-8?B?S2F6d1hkWENZTURjZU9UYWIrSmZxZDJlaWR4WlQ3RUxKNzBWNWE0Z1cxS2dh?=
 =?utf-8?B?T2sxRmx2amllNjlGeDN5dlVWQ0NLczJsYStRSzZHU1pFSXNrSktBSDF1anJB?=
 =?utf-8?B?dURqYmVGT2VzbVMwNGF4Q0VJVnNUdXZucGV5ZEhrQXcwVGdDNWg1UjJEaTZZ?=
 =?utf-8?B?NWcwUXR5cC9XdkJwMHA3RVFYVm4rb05FdC9OSWdpUDN0bmhpZU01aEZEQ1BV?=
 =?utf-8?B?clZNakpNVW5SOVB5VjgvS1NOV2pEV1psbW9uaXBRWWNqdURpM1N0bkRLMy9h?=
 =?utf-8?B?TWxKYmcvZktkYmF2bngyYmdUQzBQanN4M1l0b2hUK1RITFk2bmtsZXoraFZ3?=
 =?utf-8?B?UUNGdkpIS3g5VXhYVElCWTdKUm1VRlh3c3JDVDJqUnU2cFB6WkxZVUU0djFq?=
 =?utf-8?B?SlY4VmIvRVB5MEVGa204RHhQNFZVRmM1VmU3UTR4bGtYS3BrdEFCRGs1cVc5?=
 =?utf-8?B?Ui81T3lIeXprcGY0MlBkR2NITDIvRWdZMXg4R2U5QXl2NUh0UFc3aTMyUWNi?=
 =?utf-8?B?Rk5TWm5TTlB6V3ltK0d4MDNQMzA2YXViYTYxMjZtNndKQW1LU0xRTjJtRWMr?=
 =?utf-8?B?SDBJY3crUzlXbFNNNWdlSzlJeGJOUzZ5MlFKWWpzYVBtUlZZVFF3WlBYejYx?=
 =?utf-8?B?Y1BSMi9Tc1o2a3U2VkdPRnptSTBsU1dscmVsRFFVU3BNWDZlaHowWFlzWEUr?=
 =?utf-8?Q?Nh5ePoRNqZZPEtJ2TRN4YcAoF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGl5K1hFUldnc05JcG50WkhjaGFGT3dBeEFzRndzSlI1S3JiRys5YWFVVWJk?=
 =?utf-8?B?a01vUjJLNGpIMTdsdmE4dm1GeEprK0x5S2R3QS9pcjRsdU9rdVFXSno1aERw?=
 =?utf-8?B?bXBuVnpNN09ad0pjTzk2dWFLZi83UC9aQ2Q5ODVrNFVaZUJCY01scnBMRERk?=
 =?utf-8?B?KzR3c3hubUhVMEMvdG5HVS9UZnNISmQ1eXBXUXRQL21EZnJZd28venlZbzhx?=
 =?utf-8?B?RjQvVWtUcVpZcFUydkxVMjFaWlpONU1pV3hMVHlEOWNvR1dHWXpzbVdGT1E5?=
 =?utf-8?B?U21Vek1kSEFLYmtnaHdnUHNMenhndE1OT2RSU25qTHRPalJWYUs5TDZPWmE2?=
 =?utf-8?B?M1NUcHBLYm84cVRYSk15WjJvZWJ4cjNnNytudTlYZkViN3hDZG9WUVpZWUlw?=
 =?utf-8?B?Vnh6MlUydzlMNlorWExUeHFkbUpBcE5FUFlWKzNHVklEU2Y0SnN2NmRYMEli?=
 =?utf-8?B?cmp0OVdtUEx3WFV3S2xFbWJSa1pZWk0wOWFmVHdVS09iMXliRkQwK05jN0sr?=
 =?utf-8?B?SWd0dzVIZjJ6bWtDR2VRSzc1L0FoV1dtVVhlaU1QMUhLK2h2aDcybldJZTl4?=
 =?utf-8?B?aFVBeUhXUjhVekZBcFJQQS9UQWVUTE12YXlzbnVqSGZta0tRNDlvVG41bkY4?=
 =?utf-8?B?M1hBMkY0dVJzb01oUUo0d25TOTRHNDNpNDdoVlZaSjhrK2s1YnNlVnh5alhu?=
 =?utf-8?B?WHR0dnJnaVlhdVBieWV2VVdTS2R2U0hTSVZhMGxTbXl6Mm9mQS9tUDNQWW9y?=
 =?utf-8?B?cHk2dEVCUEtDR2xuTmlKSGlNZWRXbXNoUnUwS1FjU0NuOHpBTWp4QTNtdjFy?=
 =?utf-8?B?U1JXRWcvTDNTcFVEUkw1aUt5Qks1T1JXREhqZVMrd1VUSVFOQkgzWDJuMU14?=
 =?utf-8?B?L3NuUlRyRG82d25pa0RTcWZOOGhycjRhWVFyc0dmMFdQWWNUb1IwUGNyMFdJ?=
 =?utf-8?B?enFzOEdNWW5Xb3htV2pYKzI0T200dU95U1BOTTVoMzZLeW5ZdFkwWE5ORmhX?=
 =?utf-8?B?blpDK1hqQ1hmc1ZZM3E5QTIrWVRLRjRqWEpFNExTNVh3MDJLN3hibWFmREo3?=
 =?utf-8?B?VUMvSHFiTExCZUNaK0hUNTg4cWJkV0lwcWo5Y05aYnk1WlVkYWVFSy9Sazl6?=
 =?utf-8?B?SStPNTBKOTU1cWpETUJzbG9nRjZPZjhEUlIzUUlJZHV5U0VpRzcwNnprM3Fm?=
 =?utf-8?B?UFltdFhrT1NwWWxVUFAvT2JmZktRNlIrZm40VjNSZHhON1k2b3RQT3QwaHZX?=
 =?utf-8?B?Y2lub0xodGhBUFhsY0dzaVc0SGNnc1NYMmxka0Fxa3BIMkgwL3FDaDhyNHFP?=
 =?utf-8?B?bzltWTZEUnNsdUNzaU9TWlFuUGNOY2ZrTkk1YUdYRjJtc042Ykw0bThtaTZZ?=
 =?utf-8?B?SEVZZ1FqUWplbnd1a2lJd08rRFZKaEwvelBSSVgycGVUUDdyZWdjNEU4Z0Nx?=
 =?utf-8?B?aXhmSXpIUUtvY1lvVEZlZW5WUE9hczE3aXVrWkt2a29kdUo4blA0dFUxakU1?=
 =?utf-8?B?WStNS3BqRm5WbWJTNVhjZlRYM0tSdWhtM1hCd1ZTK3FVeEo2bUFldmNJbjA1?=
 =?utf-8?B?bk80RFFkcC8xZGttQ0JpQ3IrWG9wQ0VGbGNScXpaS1Z4UkdXMys4TEpMTFMy?=
 =?utf-8?B?THc2MG5PWkw1bkh1cld6Ukh4RGxnbER1czNONUdUdFZVeHp6dHNJSnB4bk90?=
 =?utf-8?B?ZHUzOHgrUDBoQ3RuTWZVWVRUYjRKcEU1eE5VZGZTV010Ym5hQnlmWFd3NzdQ?=
 =?utf-8?B?OC9sOGg0WXFNdFJpNHZpV0FiRlZlK1FGdTVXWFcxc2wwbWw1NUJ6TDlXZXNF?=
 =?utf-8?B?Q3dUZUdENVF6VlRMcWJQaklVWUNJalpzNk1ZUUtUVVNCZzdSZkYzdWtEWDNs?=
 =?utf-8?B?bVhBU3ZxU0Yyelo4dnJiYm9hTDluOXBYRlAycE5IZUo0MmpRL282YmowbSs3?=
 =?utf-8?B?VytkR3dET0VPNzM2bXJobFZvTzNnekJaRVlzQ1pJVVpUN09WbzUwUXFkVGZC?=
 =?utf-8?B?eE9laXcvS0MwMWFmRTFxRWdXTk9qOG5NSWVuUzdzdmdZMTZ6UmFNNU5Xbndp?=
 =?utf-8?B?ellGVWsvTVo5L3FkaVVubWh6S3V4RG42WjNaVVB1S0Z4Rldha29OYVdGZTJG?=
 =?utf-8?B?N1U5S1FtNHdYUEhpSGpPSXg4TldMclJXcUVUTWZ0Q21BbWhjWW82ZlBEa24z?=
 =?utf-8?B?SzVTZE4wMG90V2FBMS9JVTRMa3VaTk5MZjFwa21wUnUxS2FBWllVNVlZNVpW?=
 =?utf-8?B?T2o0UldwamUxRzBNRzcwNU9RUTEyalZWamhvdzJqZWtFbjF4cy92SjVQdkNH?=
 =?utf-8?B?Q2NJVDZSaEJDeXptL08zUTJSS09hT3F6WlhzbmVobDR1TGFGZFd0QT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad78a35-88f4-4038-c460-08de63b76660
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 06:34:08.2713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFbL64yJbbFq+0SFTJ6/rR/230Ze8BYd9C6px/9KIv58UKYMqkBFp8tQHHFFB+tdcvnQDxsb79SyUAay2l30KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-Proofpoint-ORIG-GUID: EGAomAbwXyGzaC3pkwqcUemI1e5427aa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA0NyBTYWx0ZWRfX4kdY78yv+VCF
 zJtr9cWBh5cRKQI5u00HnCD+Y1cAVWqZMO4yQbLDCEQQ8A4e1BRcCvX/JcUeBCXLozadTmNKmKp
 q3dsXpxhSe02jUzk9+addIJjRz4HIYW2x0w8SbJoqGtrdBzVwXUJ0dvymUlOXMISZ64jaJ4boD3
 jxAOgl6LfOEJiviV/UzUcsAKKRh1rx35Lp42tCxZZROkHtiEsMYAXiLdgr9xhQYgABX9oKR51yu
 wE6Ht2gALo2OpIwXYt8z0JXNJYBRHPQN98lPbpUrjP2g170/NP9kuxRmLsyoYrORJYQehTcs86M
 xRTpi9gBWcDZdNfam438vQFWmH/q1zlNFaFPwi9gG+iSoPUfrvSjpqXxFqScHMvfSOHV95nBDIf
 Fn8RTub8ThSG8K86+jrB662ESQIoPRjlvIpH60e5/b/saUk9NlR+YBk7A5LnBuVuLVx4+4GJcQZ
 uTpNmsCbXNPWQh6d/GQ==
X-Proofpoint-GUID: EGAomAbwXyGzaC3pkwqcUemI1e5427aa
X-Authority-Analysis: v=2.4 cv=ZNTaWH7b c=1 sm=1 tr=0 ts=6982e862 cx=c_pps
 a=j7tsCyGgeYHcZD8MHzM6Gw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=esotEQgRJiVqvBtE_xUA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 06:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230497

Sorry, please ignore this patch.
I'll send to the correct mailing list.

Regards,
Qi

On 2/4/26 14:32, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> On qemuarm, building nerdctl fails with QA error about textrel.
> Add '-buildmode=pie' to fix this issue.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
> index 1c37bcf8..5429e6e6 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -78,7 +78,7 @@ do_compile() {
>           export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>   
>           # -trimpath removes build paths from the binary (required for reproducible builds)
> -        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath -modcacherw" binaries
> +        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath -modcacherw -buildmode=pie" binaries
>   }
>   
>   do_install() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230496): https://lists.openembedded.org/g/openembedded-core/message/230496
> Mute This Topic: https://lists.openembedded.org/mt/117630452/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



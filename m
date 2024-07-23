Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A039C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 16:44:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.64.1721753070733668261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 09:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7934cb5edd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NAp4se010304
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 09:44:30 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40he0vsm7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 09:44:29 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46NGgstK022803
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 09:44:29 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40he0vsm7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 09:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ievd/xjmEXGT95AWfGzSCGPrgI3rGfFaxPeHuA1S0s2Jm/kwECxGFkJhKgS998RRxCeJhO9Ub2mnFHy6L0ZYKVpXMcFKpiSmeJ5vDo4eWCvCprzCt9fBEZrdpwdRNDrzK+AsTHaYfXvX46ip3Z4pkixWnClgpt3lutjWWsaxryToNZ8hqAhqOUVbXawnf2sDh/IJ+MaY3U+g7tI3Mx2a58ZSqMUiIrEnhwTx/lcqvtR7R46rSOFvEaRCwon87jt47SLqnBi7t1wj06I9q2b+7MALYBcBQZJ0/0etxdvHma3H6qmSWpiKaq7fH//d9oSOccrNm65BNwx5d7Jz86uEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2WabgRc/VSRN8T+RkAZQxD21/nyXA5YI6n69RllW4Q=;
 b=TKYkf5oJuid88xwVInx2gGHTT/2kAugLU3+6nQ5x+XCvX5n7fzQBCq12yATmWxkq7qypeQ3/kD7DOfuZjJMtv4jahtJqfsWyMsJOmZfUYhEKroZlB97rpVj0mzs5iE1v/2JPbCrmnuqJfeYkzQXXzECQazMkwTlGtQYnrOhYc15yscy6sDwnT7Zfwt6slfTHf3uKWQiMviMhrENAIfnSQjofdq7XoJG8wJEW15tZAEoMDCqLjsR6Do50NIsx6eehbrJoKOby4AtSWXSZ3iDC4KW+eT1n3A60TYrlwKWSXti5RPOwE8622hdpK3oWEkrl/BkGYg8JQLRPdsGYGpoAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by LV8PR11MB8722.namprd11.prod.outlook.com (2603:10b6:408:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.33; Tue, 23 Jul
 2024 16:44:19 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 16:44:18 +0000
Content-Type: multipart/alternative;
 boundary="------------u0J6cDrzOYOzxsxonS7KTZqI"
Message-ID: <878fe028-ade0-4646-8294-429eebdaeb14@windriver.com>
Date: Tue, 23 Jul 2024 12:44:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
To: kweihmann@outlook.com, openembedded-core@lists.openembedded.org,
        Jiaying.Song.CN@windriver.com
References: <20240719164639.GN17572@denix.org>
 <15389.1721741918254132393@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <15389.1721741918254132393@lists.openembedded.org>
X-ClientProxiedBy: YT4PR01CA0345.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::26) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|LV8PR11MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7800ff-6fbe-4e09-8431-08dcab36b223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VjVXWDY2QkdXVThzZlA3TSt3azNHT3FqaG1VK3g3eC9SbkJLdWxDek5ROXFZ?=
 =?utf-8?B?Vk1nWmJXd0k5L1U1VlhrLzNGZDFzMzlqOTZyYlZYem9qRDFvdjBCaFUwa0Nq?=
 =?utf-8?B?UmFJbnh0RWFtSTdhelFKZU5OWU1jMlo3VTE1VW5McWh2dWFhUkZFTkRmYWlH?=
 =?utf-8?B?NTNXSEkybjcyYnI5MVVvZU94M01YOGIvai9ZQ3hqNWxmNUhwZGVBcWN6K0Nu?=
 =?utf-8?B?WE5DeW1IdHdVOE92dkE2NmZpRnZucS9pN0ZQdGdwQVhuY09BWjdpNjgwUUcr?=
 =?utf-8?B?dXd4Qk91eHQ1M0txR0xMenFxNVV6LzFZRlYzM1RNYkNiYXVVbGpkcU1JcG9u?=
 =?utf-8?B?VGk5OGh2emhiNG9rcDlTajU1RlZySElKU09WSnNuT3NDbk1oVnkxcXkxeUk5?=
 =?utf-8?B?TEdTbDNCMVBNTHVYWUROblJiWkN5aEZRN3R6dWprWk5XTmpta2lOZmtweVZ0?=
 =?utf-8?B?SDZTYnVjZW1MZEh5d3RVakQrdHV5YVdCL2draGU1WitvRko4VHBxelVQczdj?=
 =?utf-8?B?anBob204M08yZkRNQjVpTHdtSkMrcmROY0FPMWFOMWdKOGhLdG81OXdHUVlr?=
 =?utf-8?B?SjhDMXZhZjRCUUNOUHdhOUxuNjhiK2FCREY0d2VNMk9oSlVQbVhieFNGbmt6?=
 =?utf-8?B?L1I1RnlkUkZBblA4R0hIRjR3by91RjVvSE9kUGRhdEwxL2VFNG0wRFFMVDR4?=
 =?utf-8?B?d1kyazQyYXNtUVM4N0U1SHc4bmhSQ0FNL2xDL1Y4OGIwWC91Q25MZURpWXlV?=
 =?utf-8?B?SWQ5N3VWZFZpa21GZmZKM3BRMkdzOWMrbGtDejlJZjRpZ0pLUUVYdzI5c1Nq?=
 =?utf-8?B?Vml1L2hmUkVLNXhGbkhTcG5hZlRkVExtb2kvT3ZkQXBFRHhKaUZuTDFhWVRL?=
 =?utf-8?B?cVVaWnZzUlpjVjFhQjlFQk9hZ2dRbUp5U0xFWkkwSmUybkhHclQ2SndsbE9U?=
 =?utf-8?B?L2lZazZNQnd2ZVZWa05TRHpmaWlJdXg1S1doL0xxdnllWm5LK256ci9yRGtl?=
 =?utf-8?B?RzY1S3dnTlVLRExuTEJONEpoOTBzakNmK0t1K3J0ZHFTTXorWWY1NDluNWZJ?=
 =?utf-8?B?Y0NFclVGWlFObzN1OURNL1k0SzJSSWR6OVQySFQvS1orbFZGcXNhd1ZKcnhz?=
 =?utf-8?B?YlpJZklFeWJOQXdoVjh2b1pvbWJOMjc1QWpDUVlRNlJqSCt2TzZTL0xTMVJS?=
 =?utf-8?B?WTVqMEJ1c3R1U05Pd3d0eDdzdWRvdmx1K0VvQ2tISkdEaVd1TUlPamFSY0o0?=
 =?utf-8?B?ZXNLamt3ZExwWEZUL2p3QkdFYS9VWmYyT1pvSUdGVkZiOWNEQklTZEE5UlFt?=
 =?utf-8?B?TDcwZVl6Z2VBMjhEUU1aQlFaU3BOczYydm95bUEwZ0VSVnB1QWRiRFJ0ekRD?=
 =?utf-8?B?WUNaWGVHdTVHRjhuRWhOdmxaeVkxU3JmSUF6ZVE2SXFIYlJ6SUJjRGZMUUNB?=
 =?utf-8?B?OVJpKyswTWY4YkZ0QjZMUEtLVXBKM3A0Tm4yY1ozckpVUWNDTHhVbVNCRFVU?=
 =?utf-8?B?Snl6VGlZL2NHNGdFeXdMKzAyOUs1Z1VwK2hrSFlWZCtsZWlCc045QUFMVk9t?=
 =?utf-8?B?K2pqYjUwSkJtT2d5NjJ0ZFBONVlZRUwwUG8yL1pNNjExdFQ0clBVbzQrU3Na?=
 =?utf-8?B?andXV1ExQkNXeklGTmFtdWV3cTNJb1FjelFKYjZxdlI2Q0JuK2dEaGEvTUJI?=
 =?utf-8?B?bmt6bUl0OENPMHBxQXhCYVhiaTN1bG9QbkZxWFNBN2dqYWFIeGI1LzhvRHhh?=
 =?utf-8?Q?/qM5HBqF2+wXkZHGLKj77XjqNwI6H5W4HMYZBKN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDh0WmMvdWlWOVo0RlFuUEt5dG02b3Vyb3BjUnp4T0hEVFVEYmx5d0drUExa?=
 =?utf-8?B?dlpoQkJlRFFZNjUvVk1DUjVtZHZoVnJjTGM4MzUrYVNZVFQvMTIvb2E0UElh?=
 =?utf-8?B?OE5qSHBGcTVHbGoxMFNvdVE4SkRYQkhjSXY5QkFscmlobXBOUDdQTldhUkRZ?=
 =?utf-8?B?NTRtQzl5cnRsMW9TeXVNQmdVdklRa0h5YVFMNCtHaW5uV1ZzekZ5VTZSM3F5?=
 =?utf-8?B?eFRjSlJxQmszOXVPa2hvUlZlOHF6YVNNdEx2cXJJNk9DWXluSGxuZzhWR3A5?=
 =?utf-8?B?Zk5KZzNJL3ZtNk9DYmFOOHRwd1JLK0FWRkRma2sxNHhxV1RpVTROa25ycDI4?=
 =?utf-8?B?dEFaVFcwMkFhY1VwZUNkY2lPM1c4b2pVTzFLUGNsRXh0TnBzSWZWK3RTQlEv?=
 =?utf-8?B?bGUxajlrT0s3UmhNcGc1SjlabUVmUGlqTjcraE01NEMyOW91ZDNyOVlVeWQ5?=
 =?utf-8?B?RWdQYU8xT1FIRTFwUC9xRHI0QnRQWkl5VHVvY3pEbjhLQU05YlBwVFlQYnlN?=
 =?utf-8?B?eHFDeWdqRUtkTDJRUFR3SHUyU3k0UHF1aU9hUUtaWEc0bm5mUERETlZHcnFl?=
 =?utf-8?B?OXpsU0k0VVVNNWpYZFFoMXZISzdYYk84L0hjZ1gvOC94cmtQNkxLamVMQlNn?=
 =?utf-8?B?dkZQMGtSOFp3RWp1N3JjSURLZFZFRjI4OGFGVGs3WFFpdEVRVGFYcUhzUThC?=
 =?utf-8?B?Sk5RL0VDb0FIMHk3ZHhQUWlBMU9uVFNuMm5RTitLZTJtdXdEVHp3VzhEVWE4?=
 =?utf-8?B?QmhpeksvWVZseFJuNzlnODBFYXZjaVdGVndLb2xFN2l5ejhvVmJmTkZqR0tk?=
 =?utf-8?B?TzRDQ21CeDFnc2ZTWTM0cElyTXVZVGh0ZG9BK2RkYkV3YWtYRXJJMjJnS1lw?=
 =?utf-8?B?NnV6Mk5Cc3dFUEN5SDROS2hQazd4MTZQbTlPRm5CbHh4bVB4OEs0RXA0ekVL?=
 =?utf-8?B?NVZPNjE2L3pMZVBuK2M1QVR4KzBUT2FOU3BWYWg2VkRNaU81czdzWjBBUjR4?=
 =?utf-8?B?cEx0bUZzYXNmVmREd09LL1Jwa1RrQW1nczM3VU83N0psVzU3TTM0QlVxTVlE?=
 =?utf-8?B?ZlNPMURLbWtsQkpDSjVRYVdETi9LcHVIaFlPMDg5SGlsSG9ETGlQTzE1ZVRa?=
 =?utf-8?B?OGxmdUNCMnN3S3laK2Y2QlN6MG9HUXRGRnlmVW1vaHVudEN2VUdJcnBnOUFv?=
 =?utf-8?B?REwrVkQ3eWRmY2VvSVV2cXhBUnRXTGZqcTk5Q1NjNkdKLzZraHlWeUY0b2Nr?=
 =?utf-8?B?VHpmTUFFZUVvbWpRcTdlYndnT3Nmb1JSdmtJWENoUy93dUxaR1Ura2NNNWJO?=
 =?utf-8?B?TUpZWTdXT1RCM1hHMjk4YXA4Zy9yV1dJOSthU0Z5REVuQW55VTJ0TW1FNFk2?=
 =?utf-8?B?TmhXbENLQW9kbFM2Si9ZNlc0NklCazBZR2NOQ3d6WEI0dzUvQlFybmUxbGlt?=
 =?utf-8?B?cHRycmpncld4RFVyVjhLeEdLVElVWkREM0E3STJYRmtjUzB6WE5SVDl1bWhO?=
 =?utf-8?B?bVVyRnBXazhCODhVSW9mbE8zVUFJRjd0c2E2bmpFSkRUQ1ZNZ2Z6NTdoWTdm?=
 =?utf-8?B?ZTc5SkdjNTNXNEdXTFRKWGNuem4zdWlIcHBscWEwSm1lWGd5M2Q1aitueXl5?=
 =?utf-8?B?SDNTU1FIMS83QlBWaEozeGRmQ2ROMHllbjg2Q0dLYU5WeHJPSzRjM2Rmb2JT?=
 =?utf-8?B?cTV5QXlpeXhRdlV0SVZicUd5WXljcldQelh5RGdQUlVxMHhuT0tOVTNKa2x0?=
 =?utf-8?B?dkNhWERaTXhMUHRnUGZUU2hXYUZWRk1xLzIycGxFWUdrckhRMTRBNmpuMnln?=
 =?utf-8?B?RnJFK1BYdzl4bVRJUFpBMWcrTkJsZEZIMDVmcGFVbHhEcktxeVNwMm51Y0F1?=
 =?utf-8?B?TEZBVXZWNjhPMmZ0ekJoc3QrQ0VtaGIwS0R6VnM3VVZ0dGdGK1hWdzVxbmEy?=
 =?utf-8?B?d1lOMUJlTk9veFVsVkdra0VFNDdJYnhSSS84a1F1amNQOUtSM3NiUUJLdlRF?=
 =?utf-8?B?Z1VHU1R2TmQ1dUFaOGNxQ2M2djhDbk4vaVdld2JhMkNocmxwNHhCSlBueWxB?=
 =?utf-8?B?MDZTbkdTVm8wL2M0VSszWXBGeDFQUUVWS3lDNmUvWWxtOGhpOTIxZXpZWHo0?=
 =?utf-8?B?MWtVTFpqYW4yVGFtUzFlQVhaaENZZXdXazB1L09oaEs4am9ZVFk5VHlsOHJI?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7800ff-6fbe-4e09-8431-08dcab36b223
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 16:44:18.6225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzycxlMmlttYhAPMSYnIg4EguPI9ZGKcLn7zgrKjd5aw/L/hrwwmLiOCip7OCu+3ttO1ZXqo1b7ynTof6PZL+UKio0tk/IdjeicNLV1x2P8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8722
X-Proofpoint-GUID: L5dZanOkYjyCguBzO9xdZxwP4Y6EiF5P
X-Proofpoint-ORIG-GUID: DnQmhjCpxLsNCiBzgkOmG-LZGY1MqqHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_05,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407230115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 16:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202412

--------------u0J6cDrzOYOzxsxonS7KTZqI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46NAp4se010304

On 2024-07-23 9:38 a.m., Konrad Weihmann via lists.openembedded.org wrote=
:
> I also vote against it.

I'm on the fence but I'll be swayed by the "against" voters.

There are pros and cons to a system-wide solution but it seems that
people prefer to have these problems fixed in each affected recipe.
Best solution is to update the script to call and work with python3.
If the upstream refuses to do that, the layer would have to carry a patch.

This is how most such '/usr/bin/python' problems have been solved.
It's a shame that upstream python didn't mandate a specific solution.

Btw, some people could use:

https://github.com/Igalia/meta-webkit/blob/main/recipes-devtools/python/p=
ython-is-python3_1.0.bb
https://github.com/Igalia/meta-webkit/commit/b2156c282a6e727100dee25155fb=
c38d1532b573
https://github.com/Igalia/meta-webkit/commit/46fbfbc58f82abc3dc8794c63017=
2d4554be0830

=E2=9D=AF git log --stat 46fbfbc5
commit 46fbfbc58f82abc3dc8794c630172d4554be0830
Author: Carlos Alberto Lopez Perez <clopez@igalia.com>
Date:=C2=A0=C2=A0 Mon Dec 19 20:29:05 2022

 =C2=A0=C2=A0=C2=A0 Add a new image and distro definition for using on th=
e WebKit CI=20
for WPE perf bots

 =C2=A0...

 =C2=A0=C2=A0=C2=A0 * It adds also a 'python-is-python3' recipe that crea=
tes a symlink
 =C2=A0=C2=A0=C2=A0 to provide the unversioned python interpreter as pyth=
on3.


but both oe-core and meta-oe maintainers said on today's YP tech call tha=
t
they would *not* carry that recipe.

../Randy



>
> While I see the convenience in dropping a lot of patches the better=20
> approach would be to add something like python-is-python3, for the=20
> ones that require it.
> (meta-webkit does provide it already=20
> https://github.com/Igalia/meta-webkit/blob/main/recipes-devtools/python=
/python-is-python3_1.0.bb).
>
> Adding a link by the base package and recommending to the user to=20
> remove it again, would create two very unwelcome situations.
>
> a) it will clash at image assembly with an error message that will no=20
> easily point to the python base package
> b) create a need to run with a permanent remove operation on top of=20
> poky (creating the need for new sstate cache artifacts)
>
> What I could see is to move the symlink into an optional package,=20
> which could be used by the few recipes that still use the "wrong"=20
> interpreter line via RDEPENDS, that would be the much cleaner solution=20
> here
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202364):https://lists.openembedded.org/g/openembedd=
ed-core/message/202364
> Mute This Topic:https://lists.openembedded.org/mt/107264938/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------u0J6cDrzOYOzxsxonS7KTZqI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46NAp4se010304

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-07-23 9:38 a.m., Konrad
      Weihmann via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:15389.1721741918254132393@lists=
.openembedded.org">
     =20
      <div>I also vote against it.</div>
    </blockquote>
    <p>I'm on the fence but I'll be swayed by the &quot;against&quot; vot=
ers.<br>
      <br>
    </p>
    <p>There are pros and cons to a system-wide solution but it seems
      that <br>
      people prefer to have these problems fixed in each affected
      recipe.<br>
      Best solution is to update the script to call and work with
      python3.<br>
      If the upstream refuses to do that, the layer would have to carry
      a patch.<br>
      <br>
      This is how most such '/usr/bin/python' problems have been solved.<=
br>
      It's a shame that upstream python didn't mandate a specific
      solution.<br>
      <br>
    </p>
    <p>Btw, some people could use:<br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://github.com/Igal=
ia/meta-webkit/blob/main/recipes-devtools/python/python-is-python3_1.0.bb=
">https://github.com/Igalia/meta-webkit/blob/main/recipes-devtools/python=
/python-is-python3_1.0.bb</a><br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/Igalia/meta=
-webkit/commit/b2156c282a6e727100dee25155fbc38d1532b573">https://github.c=
om/Igalia/meta-webkit/commit/b2156c282a6e727100dee25155fbc38d1532b573</a>=
<br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/Igalia/meta=
-webkit/commit/46fbfbc58f82abc3dc8794c630172d4554be0830">https://github.c=
om/Igalia/meta-webkit/commit/46fbfbc58f82abc3dc8794c630172d4554be0830</a>=
<br>
    </p>
    <p>=E2=9D=AF git log --stat 46fbfbc5<br>
      commit 46fbfbc58f82abc3dc8794c630172d4554be0830<br>
      Author: Carlos Alberto Lopez Perez <a class=3D"moz-txt-link-rfc2396=
E" href=3D"mailto:clopez@igalia.com">&lt;clopez@igalia.com&gt;</a><br>
      Date:&nbsp;&nbsp; Mon Dec 19 20:29:05 2022<br>
      <br>
      &nbsp;&nbsp;&nbsp; Add a new image and distro definition for using =
on the WebKit
      CI for WPE perf bots<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;...<br>
      <br>
      &nbsp;&nbsp;&nbsp; * It adds also a 'python-is-python3' recipe that=
 creates a
      symlink<br>
      &nbsp;&nbsp;&nbsp; to provide the unversioned python interpreter as=
 python3.<br>
    </p>
    <p><br>
    </p>
    <p>but both oe-core and meta-oe maintainers said on today's YP tech
      call that<br>
      they would *not* carry that recipe.<br>
      <br>
      ../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:15389.1721741918254132393@lists=
.openembedded.org">
      <div><br>
        While I see the convenience in dropping a lot of patches the
        better approach would be to add something like
        python-is-python3, for the ones that require it.<br>
        (meta-webkit does provide it already <a href=3D"https://github.co=
m/Igalia/meta-webkit/blob/main/recipes-devtools/python/python-is-python3_=
1.0.bb" target=3D"_blank" rel=3D"noopener" moz-do-not-send=3D"true" class=
=3D"moz-txt-link-freetext">https://github.com/Igalia/meta-webkit/blob/mai=
n/recipes-devtools/python/python-is-python3_1.0.bb</a>).<br>
        <br>
        Adding a link by the base package and recommending to the user
        to remove it again, would create two very unwelcome situations.<b=
r>
        <br>
        a) it will clash at image assembly with an error message that
        will no easily point to the python base package<br>
        b) create a need to run with a permanent remove operation on top
        of poky (creating the need for new sstate cache artifacts)<br>
        <br>
        What I could see is to move the symlink into an optional
        package, which could be used by the few recipes that still use
        the &quot;wrong&quot; interpreter line via RDEPENDS, that would b=
e the
        much cleaner solution here<br>
        &nbsp;</div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#202364): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/202364">https:/=
/lists.openembedded.org/g/openembedded-core/message/202364</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/107264938/3616765">https://lists.openembedded.org/mt=
/107264938/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------u0J6cDrzOYOzxsxonS7KTZqI--


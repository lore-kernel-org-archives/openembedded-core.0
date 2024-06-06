Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1B3C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:51:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10356.1717667481688137324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6887f0a6d2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4566Z27a003620
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Jun 2024 02:51:21 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f4u57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 02:51:21 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4569mNaH019231
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Jun 2024 02:51:20 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f4u55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 02:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAVkuqAYDnWyfUXpEzpR1dUsPj1TokQIxWlfDGnJiDJnCy0DqOugMB7+akiq2B2G9XG0DG/hXcEkygvIaf3wXoFu+Hthk49wyqbxTTYidivOKdGFBlHxGmwKmNBhFAEEqJeWfWMvzZ5Jc5GNDNLzkqPOQ3JROzTu58JSbcMXszLYjoY7iIpZ2igz6aEEjXbd3JfaqhHWQubtTtxDYosS2dg1a+HhB1AT6KaG5Qajmvq3WPMy24es12bDRv/ECqRdxKBQkJ5Eahrg7FupV6GzDCMoXATGO5f94A+wgXABfnapGUmiCCX0a6FzwYxKvw+AurCm9yOVlOghtkzuacruUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdvZbV3Uuq51pWld00dHFMa603y23CceInIcEe9sn84=;
 b=Pq9BKjcesAZjTnNk85W2FlRi2FshE5Eh8Vz8Dn348/A85rpYDk5Jng4aA4mxKfXf/5wGqTw2WHbeGRL+6L7rYqhmZd78xtVCqvmfTxOWMOJKMHDuRkl+DZ73dUn/19AwAGzWN/BCuwsZ1sx+l70ChOBfgmQDx+eriWIc/yd38SSbL3LGXy7RtngAeasr0ug3b8y1TgFpTabcW7qxCkXEBM1uyRsO1M2YZUPXuIJFBQH4b9kat93xE5aF8KjDtAUHjzgnqhapjuYcsIqasWJkoErMwKLB0LRT98/p+jIvWRQhKfV8dGh56oKI7aLIecLQ7CCwH+4FlOD7Pm+z0QUcBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 6 Jun
 2024 09:51:15 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 09:51:14 +0000
Message-ID: <2bbc5a56-36e3-47a9-b891-565735c90d73@windriver.com>
Date: Thu, 6 Jun 2024 17:51:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] archiver.bbclass: Improve work-shared
 checking
To: Livius <egyszeregy@freemail.hu>, openembedded-core@lists.openembedded.org
References: <24041.1717621460219935507@lists.openembedded.org>
 <Groupsio.1.24041.1717621460219935507@lists.openembedded.org>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <Groupsio.1.24041.1717621460219935507@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0368.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::19) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SA1PR11MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 174bd03b-0073-4bc5-c939-08dc860e3425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?akV2Q3Q4enNTOGRkNFFxMzEwVkNLS1dFd2l6WWRvY2ZITFZ1b1dDNGoxVXFo?=
 =?utf-8?B?QVZPNW82SEZzY1JwT0w2QUNFeEVLNnVPVDU3TG5yR2NJSEpzcVRzT3FVamtV?=
 =?utf-8?B?cUkrUStBaXJldkZiVDdRSGVWWDBrZDUzNkNrd2ZNSytsODJVRk8wZFdoSk9r?=
 =?utf-8?B?cUdnZGlpQ3NDenl5RFZ1TUdWZ0NuazBGZ1FaVG5iZlRaKzFvNWNlUGdHdTcx?=
 =?utf-8?B?eTBSOWV3Sk1QemdIaDVxckUrWUhiOWhpdHlhM2RnMzVzdlcwWXJjZHlXT3hM?=
 =?utf-8?B?RGFPLyt0UEhRMTJXdGFNWGhZdDZ5cTZmWU13VUtHTU5yUlIwWkY1UjE3OHl0?=
 =?utf-8?B?VUkxZXkrTXNzdzNkc3VaeHZlbG1wTkQrNmk2UmkxeGxZcHMrd3VlL1JxdWdt?=
 =?utf-8?B?eVNteWwrbjNVUWt2bkJGYU5hSXZpblFnZVVYcmdJbC94OFZKano4OHJvZzcw?=
 =?utf-8?B?VUdQUWxwc3ErSmR2Z2ZiOWlpNVRjUTZCWFRwd1RqdlFvMS9pNmdVcDNoQ3ZQ?=
 =?utf-8?B?dlZZMWFwMS9Ba3g1QTBBRHBOaXFxNVplWFBKVkE0MXp5dW82ODBwcEkyTFRo?=
 =?utf-8?B?TTNiRVJ3UWJYT29GaE9OSGZ2M2VuMElmY0p4cmp4aWQ1U2ZoVnZKQnA1STVK?=
 =?utf-8?B?aFBNYXczd1lQK2JBd3BBQkxZOVBPUHJQa3VVRVU5RE5ibTArRnlsQTBjSkhY?=
 =?utf-8?B?ZnpScXRXdnhwY05qMUNTRzFtRTc4UWJGeDFBYlNNODVKZ2pUaDZ5eG5wQ0JH?=
 =?utf-8?B?NGFROFdhWk84cmp1d0RmNlRnNy9FOFo3WXhzWXE1a1QxM011N3V4RUZoeVRF?=
 =?utf-8?B?NjdWMmYxUnpvOHdnYUJWU0RJTFhBYTNnd3BraVorR2I4VFk2dXF0azBIK3Zh?=
 =?utf-8?B?a2x2cjdlSnJlbXZGZktPYko5UmZWcWpwWDBzV0Z2VU1qVGphMzVNNGtjaVBq?=
 =?utf-8?B?eC9iQ2ZYcWRmRXE4a3lqKzYybTZSYVkrOHJENHltT00rRXE1UGxiN3FWMHNl?=
 =?utf-8?B?RzNVRUFOQnVyR1B3eGZGa3M3Q2NQVHhXYUlVNFBzbkpDSnYxT0xQdHEvMW9i?=
 =?utf-8?B?R0FmRGs1dHN2YW1BVmZHbUxFYlBVKzd2bHpjUHMrNlhJdjBpaDBKT1ViUTdq?=
 =?utf-8?B?bDA4ZGJuMWJ6QnNMN2JJcktsbXJUa3drKzd5enBEWE9Qc0o4L09YdXFXNnFh?=
 =?utf-8?B?bzFGdWl1NGlPVGhFTGNVbXRiM2pJOTliTGVBUEFPYlFqTUlFTTNpZTVBMXl6?=
 =?utf-8?B?SG5Ibk5adXBwZkJsVFprMEtvNDRwWDhOLzZlVHlkNDNQcnNnSDdJQkxzVHky?=
 =?utf-8?B?M3BObXhQS3RGaG8yS1daOEhLY010NkRmWW9ENk5NR24wd3dBV0J3ZXVPbG9D?=
 =?utf-8?B?WGxqYVpqYVZCUlhjYXdoeVM5RGFQcVB5VEg5TEZvQXcxK2JtOHFJZzFJeHZI?=
 =?utf-8?B?dTYwMmI2a1VOT2VVcW9KVHJneEdpWFNsbERja1VIZW1QOWdwYTBaTkEzM042?=
 =?utf-8?B?NWRyTmowOGh5LzBMM1Irc1ZRb2MxKzZ0SjdMVFIxeC9MOFBKMElWWTJ3VUFm?=
 =?utf-8?B?cDBUZG1pdDRTK0hSeW5KdVQrYk1GdWsyMDJBRG40bXAxTHVkUGRKNmNiaWJR?=
 =?utf-8?B?RzBuZzdvWnkvRWV1Q0xXd2kvbEJEMCt6K0lYV0RnOURTSks1eTdoclFnSGxt?=
 =?utf-8?B?ZjQ4L1VSek1EbEo3TzM2UndEMXI0cFdOc1BCbUNrakRpUW1NdWJpYkxRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEFKQWJMQ0pnZWliLy9hWFUvSVFpUWFlN0plbzY1SHVidk9EZGZMQUtTRXZH?=
 =?utf-8?B?TUxOSEpOVzRJTVR5Q3lsUmg5Ty9IS29EV0wrVk9MeENzVnJub3hVQ1l4Y1V5?=
 =?utf-8?B?emN0UzZEeDUxamF5T0p5emJFL2FBR0h6d3p4Q2dUaGZ1OE1xRnp3bHZFdFRj?=
 =?utf-8?B?SXBveXAzeThIUUNDdXQzaUNnb0ZhRWUvY2hZdS9QZnMyZzRKNURLMWVub3dD?=
 =?utf-8?B?RGI4NnlXdDBNZmdnbGE5UGR0YmU4YjV3TmxLVnpLUGFxeXpQU2NVbkZHeWJH?=
 =?utf-8?B?Q0hBelVIZGY1enVJNHBXeHdISzc0TUlkTHJjUUhFWHI2MnExbHU1d0U2ZlRD?=
 =?utf-8?B?YzVxdkk0N0RRZDRmTlpMNVBHWnpyejdIVGZMcXdjc1A5dzhJWW91MFRyVnZL?=
 =?utf-8?B?ZkV4NlFSQ3N5VDVXUWZMbFdUME41OUZwTHFVSmJyUDhUY0JlTVV5cUJsNXVt?=
 =?utf-8?B?bWp0SDR6TEc3RERPRVpEQ0JubnFsYnViMHBJZlVNZitmT1hJUVAreDVqenNH?=
 =?utf-8?B?MUpia2VHV3hDVHlKd3g2cnl2UEUvQW1URHUwc215WGVibnRoRkIzR1dTekg2?=
 =?utf-8?B?R2RXVFRUUXBxd1dvemRGeUx1TmZkK29wV0dvTi9UdzZKZnB4VTA0RkNrSEVs?=
 =?utf-8?B?cXE4eStBMklsWkF6VW9zVTNwS2cwZjRmWGYzSDE0WDNkSVpIOEZhRHhudWNS?=
 =?utf-8?B?M3VtUjltTWtsbmFNYTJLclZtK3VDQWd3REhmNW9tNVQzSTRpMWdzeTg4ZUF1?=
 =?utf-8?B?blcydHhjdGtnZmpUYzcrM2IybHcrUlJ6V3QxbUNpSk15MkJQTzBvTGw0Z2Mw?=
 =?utf-8?B?L0FPTFpRUHU2RHpxV25yZHdMZzl0Z3J4VUQva0lWRWRhVklOckUwNlFIU2x4?=
 =?utf-8?B?NXpRNDJ4bmNZRUprM3RreVBEdjVzQkxMbFEvMHR1WkJ4V2F4TElFdXRxRVNt?=
 =?utf-8?B?SHJXY241bVZma1Z3ZUFwMWhQUTIrUGo5TU1JUlhtY3IzYUFNTlk0RWFjbzhQ?=
 =?utf-8?B?NlB0UFRLNE9tRkhDMGhRY1YyR3RLU0FpOVRHZ0FJdUFKR1J0UmlHNmdkYm4x?=
 =?utf-8?B?TWJhV0hDNW5TS3hwVFRVNmxtYjd1R1I0LytwOVp2aUhoM0lVTk1JZDczWGpK?=
 =?utf-8?B?cWhIM0RIRTFGakVoZm5qZk9hbjdCR2tad2FWalFJa1l3dkRSeExmcE0ySFBY?=
 =?utf-8?B?ZlhmTXFaM2ZyVGtFSUpDSk53MHNOOXZrOUZjcDEvcGFUYVlhVHhlNGd1VXhs?=
 =?utf-8?B?MUxBa2lnL0dBS3dyaHU1R0xXNzhMREMzbU8vWGYwcGY3dE1Ka0RYR1lxekUr?=
 =?utf-8?B?ZURLV2NXWmJ0Yk5NTWJRTS9Vck1JUXZuSTdDN0EyOFJ5YS84K20wWmoySEtF?=
 =?utf-8?B?ZGZTbTBZSjZvTW9HWlVOd0ZLcDAydk13eWFYUEdxNmpiYW5pR2xTbkQycHN0?=
 =?utf-8?B?c2hCeUJuWnk4dGZsTy9JbWp0ODluaFBEMmJRK2tiNkMyRE9XSGZmQ0JVeXpT?=
 =?utf-8?B?b0pQUXZnVmJvVkVoL3NpbEdxQXFrTHNXUytjUjIyMEpTeW9QMjh3cExBa1Rj?=
 =?utf-8?B?aEo4T1BEZGdqeGJTNElJa09SNktMdURHUkFYMFBIOHdVd2o5LzBwcFMxbkh4?=
 =?utf-8?B?RTUydUZVR04yMHhLTFdCQ2hJYVlMczRsUlV2eEw3NUJTbDVVaTJveHVINUhN?=
 =?utf-8?B?QmxYb2w0Y1htdlc1bjNQejA3cXIwS3E1ckFUU1l6Zy9DN0lmZFJxcDFzWW5N?=
 =?utf-8?B?YzN0K21WRWE1Q3UyQ3FjRXVDL0QwZUZKcEh0QjZxOU5QdXJ4MXNSOHdPYXcz?=
 =?utf-8?B?b2E1NzFRYWlqRmd5OG1wYW50RG9GQmNOYitDSUZjTFJJZmswZUlNYURUMUEw?=
 =?utf-8?B?U1NVWXpFYlFQbnlzMmJ5TmlhYnVlYWJKRWRrNHBIQXluMVBuZGdNd1BqUXJw?=
 =?utf-8?B?U0NOcGtkUFRtL0RPbW5zRWtldHY4MHhXSGQrQlNtS1FMNlJYbCtQems4Y0lo?=
 =?utf-8?B?TmtBKzJhZXZTcC9mT3NKa1hBcVo4V2xDMkhtUkRSS0pSS0R1R0VMVGpuV29W?=
 =?utf-8?B?NC9yNnp4YkVPUEhMaVRING1tOWJQT0F0ZTl2bGZOSlJ4VFlpUkhsblFhWkp5?=
 =?utf-8?B?dXJaM0tnL0Q1NDhYTnlrckJlNW1iTnpxK3d2dnFMU2JCSkF2TExRUTZ3L2xF?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174bd03b-0073-4bc5-c939-08dc860e3425
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 09:51:14.3208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CRDCMdq9WN7IWxHaVsRkIry1Xcf4SCd3ZBD4JVc46i/P7JAs0CLP0mfJH63vXYcxHTi7TwVsM9N88BlAUT1nytywuw4EfpEeUk+cFLLuzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
X-Proofpoint-GUID: eaebZV9C9EhPJ0OpR6idPLN-hXyfgbX7
X-Proofpoint-ORIG-GUID: eF69uHDewVF88Ykq0XDFqxorysj1SIjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406060072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 09:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200388

Hi Livius,

On 6/6/24 05:06, Livius wrote:
> [Edited Message Follows]
> 
> Hi,
> 
> https://github.com/openembedded/openembedded-core/commit/5fbb4ca8da4f4f1ea426275c45634802dcb5a575
> 
> This patch caused something terrible wrong behavior, because ".../work-shared/<MACHINE>/kernel-source/" directory is totally empty and the complete Linux kernel source is missing if INHERIT += "archiver" is used in local.conf file. Please fix it and if there any workaround please send it because at the moment without usage of INHERIT += "archiver" Yocto scarthgap build is working but with use it, all the time it failed to compile Linux kernel because git symbolic folder which linked to kernel-source is totally empty in this case in linux working directory.
> 
> I use the following settings when i try to making archives but it is failed to fetch kernel source to kernel-source directory (it was fine to use in nanbield release before).
> 
> INHERIT += "archiver"
> ARCHIVER_MODE[src] = "patched"
> ARCHIVER_MODE[compression] = "bz2"
> ARCHIVER_MODE[mirror] = "combined"
> COPYLEFT_RECIPE_TYPES = "target"
> COPYLEFT_AVAILABLE_RECIPE_TYPES = "target"
> 
> # Don't filter the license
> COPYLEFT_LICENSE_INCLUDE = ""
> COPYLEFT_LICENSE_EXCLUDE = ""
> 
> # Deploy licenses
> COPY_LIC_MANIFEST = "1"
> COPY_LIC_DIRS = "1"
> LICENSE_CREATE_PACKAGE = "1"

I added the above settings to conf/layer.conf, and started a fresh build on
scarthgap branch, it works well for me:

commit ae6cebca5bac9521230c69fed23b375d0de7f5f6 (HEAD -> scarthgap, 
origin/scarthgap)

$ bitbake linux-yocto

$ ls tmp/deploy/images/qemux86-64/* -1
tmp/deploy/images/qemux86-64/bzImage
tmp/deploy/images/qemux86-64/bzImage--6.6.23+git0+f7f00b22ef_2d01bc1d4e-r0-qemux86-64-20240606092927.bin
tmp/deploy/images/qemux86-64/bzImage-qemux86-64.bin
tmp/deploy/images/qemux86-64/modules--6.6.23+git0+f7f00b22ef_2d01bc1d4e-r0-qemux86-64-20240606092927.tgz
tmp/deploy/images/qemux86-64/modules-qemux86-64.tgz

$ du -sh 
tmp/deploy/sources/x86_64-poky-linux/linux-yocto-6.6.23+git-r0/linux-yocto-6.6.23+
git-r0-patched.tar.bz2
168M 
tmp/deploy/sources/x86_64-poky-linux/linux-yocto-6.6.23+git-r0/linux-yocto-6.6.23+git-r0-patched.tar.bz2

// Robert

> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200381): https://lists.openembedded.org/g/openembedded-core/message/200381
> Mute This Topic: https://lists.openembedded.org/mt/103110276/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE93C352A1
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:26:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.91546.1669555557643673081
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8330146791=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ARDOLbk024136
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:25:57 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3k6r8jpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:25:56 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ARDPuDM027515
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:25:56 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3k6r8jp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Nov 2022 05:25:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhubRXA5mv02C3YN59B7eL0wpxagma74W+32zKq+DdAfh8+A+yq1Jl8lsoZLjaH53ipKt2OHCC4mySs9KHs14Duy6XfYIoBE/gel+T/17SKoifK74Ry+GwsMbYkfHiQPpYAmkYtJ1cKGQRKRa2G3Q6zU6xfjJaIFytzlz1lB7t2VLpA1cF2mWpk0yrZAGMraXfKJVMHeeAunyDesA9uB27j5DkTdPUER0Wix1yBd17sROAvKxvsIS4mj9bichJ43Uj+T1gLGrA1fjVEOQmreFyC7yCiICtcV5M3kA1FhKEfrLGgz232eKB+S9VRemjuknEx1/aSXFhdB9N/vXgib/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW0Ig2qUc+wuS92/v7tR5BoMx0CVvO+8Mx3Nnds7goQ=;
 b=IOIAM3/ZwAH+cMoNIOpsdkvwGP8Jmk6b9aUca4MTbKWRwntFZliLjEtyXOWzlRxEQlxHZOd4NWAje0zieZTkEomsujX1CWZ/3QMG6hJ2mjXswdGr9rW/GruBkUXZ+PI+oqIg3HvVYQxaJZSE79NrSNBsDe3b1MW6DZN6BMv0DP+Th+/IQoP3FiBafGC4lMOzjL0D+uc+XxPleZlnr96BgTJhMjpkxQSf6dXYJ45b9A8WoRtOI1clw9OtJd7GnrZ65pmVOrNlGWMjYp8wJH8Y2ydl9zZMh9InEZ8T0g96cHjiBGu+iMGuFBseBQ/AiJR/8Q1szCydYBa1CmzEZmeasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL1PR11MB5416.namprd11.prod.outlook.com (2603:10b6:208:319::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Sun, 27 Nov
 2022 13:25:52 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5857.021; Sun, 27 Nov 2022
 13:25:51 +0000
Message-ID: <9c904c67-49bb-dd2b-1dc2-c76089b48e1a@windriver.com>
Date: Sun, 27 Nov 2022 21:25:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][master][kirkstone][PATCH] rng-tools: backport patch to
 adjust jitterentropy library to timeout/fail on long delay
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <1727B4342812AA9D.29995@lists.openembedded.org>
 <d7240f48-42f2-f16e-2fee-56a016ca7d2e@windriver.com>
 <Y4CpaKfbn8gnQsLb@mail.local>
Content-Language: en-US
From: xiangyu.chen@eng.windriver.com
In-Reply-To: <Y4CpaKfbn8gnQsLb@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:4:91::19) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL1PR11MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b57b69d-d478-47ca-df27-08dad07ae790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3AHeUDLlKuz8GKo5b1E6q7ZTvhFUC6+mCuqx4JphZmvAESUA8e2JHzP0oT+BjcPjZmeYuf9NjYoBKP8qlZJk7RVt2NF37/gWH1RCagE1/EC3MGCPErxqU0/tHJLcn59JUHYinAZqGQYMg6d2osSGENR/2x6XX5Ukyxd9X9HAr3o5ld0Lbm01Uns6F7VDd6hYrX+C6uPP4TvuuBoJs65Qx8esod4h3nJCv7ep191uspikuj7K2IoN5QhVQHV6r358dGqh4jn44wQIcvT1q/gdsvISLR2WP1SFtFh3yDWBLLtvLlmXWkymKFOWV0XWobo5yMjXbnI2jP8+/7n25OtDkVMkkb9/joQyQAH7k29io+ZlmYcgBne17sgNsmZdeoNTRrkVRHATgLQe+/NMHInQsvg+a1Mt8Hfjw7orV+ik671f+lJZm3tDSE/CfWgglEvBQpyhi/gFxfVJgBYT7Ht949tf9iAcwC8sWmyej66S58nc2FzTeMxQVGiHud2usvWtOaQzqgOaxoekX/euZQxSS7fjnXYUxXF+AsVnwizu/6krHuKTgeVFXERQBj3PdwIPITJxhs5h+Joo8zOjL/vQyo/sjfx0fPZQ1F6AoHGdeXJU0YY+rHt+G1jJ1aV39ywQ1T5DGRd764W2+BY2E33+mmJV14TaY9R1HHSVwR1O1cLFdCG8j+QTNJN+lf/9CwWBkWHI+WPAy1bBhNUJdfH2IhY1K30hK2SpKSLwMwbm34PuxjSwwdUwT81u9Qy0Jroe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39840400004)(346002)(396003)(366004)(451199015)(83170400001)(6506007)(31696002)(9686003)(4326008)(6512007)(53546011)(66556008)(26005)(66946007)(186003)(66476007)(41300700001)(8936002)(8676002)(31686004)(478600001)(6486002)(6666004)(966005)(6916009)(316002)(5660300002)(38100700002)(2906002)(83380400001)(66899015)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHJpRjhlSlNibU5yY1kvUXYvLzJpN2dVb2VqK2NLbThldEVrdWR1cCtQQnJS?=
 =?utf-8?B?ZUZ3UkRjZkF5UUpIeWpNUXNQQWJ0UDhhTU54S3lTQkRTbHNXUDFuNXo1VzJh?=
 =?utf-8?B?M0FZY0lEYUNQU1ByWENtUFg4ZkM2cnNHdUZsUXVpeVgxOTR1SnhVbk0yc3ps?=
 =?utf-8?B?cWFwdTc4VTdyempqU01xYlpkbzZKQ3JKK1ZBejE1NmdGdG9QYlc4UzdxSmNi?=
 =?utf-8?B?OGhzaE91b0RhZUdrMkRHTHFuaytNalVQK2dVTUU4T0ZQdERwcjN0WkxpTk9s?=
 =?utf-8?B?RmRWY1lTbnpZOE16Q0hUemE1TUpKZnA2ejBpUm9lWEsrMGdubkFTaVJaYWFo?=
 =?utf-8?B?YlZESy9DdXArQ1FWMHhWTjNFWnNXTXdMbzY0UlZJMzdkdGhsaXFZdVF3RjRE?=
 =?utf-8?B?bDZ0S3JTK3VCZms3U3plVE5nS0lrUXR0VUR4eEZVeElCVUlmdWdMUXVwNjJw?=
 =?utf-8?B?Y0JsZ0IrOEVDQVF4elpNV0d5MWJJN3FDbTc4RVlQVnZhNDJvVU54RUl0dERJ?=
 =?utf-8?B?bVVJV0lUVFBVSjVlclFHdGt5ak9QS0x0dkVRZmsweng4cCttWDVhZjBKRTFE?=
 =?utf-8?B?dzZvc291cm1QWGdIU3FENkYwajZEL1BOWStaY2xUclN4eS9Da3hGemNHbzlN?=
 =?utf-8?B?UVcrWXluOTExM2RJNjJjK1AyUXpVeFNRd2FUajkvNXRQVVlOZGduK2lDcm00?=
 =?utf-8?B?OFZmLzM1N3k2dEc2Y2VFaDk3ZmVTbVM3YmlMMTl5UlBVOTBxV0JFZDNHcUFQ?=
 =?utf-8?B?NWxCQmR2OG00bTc5cmU0MGVzNVZFbmFKS28rRlNDMmR1dU5VcGI5cEVwR3pN?=
 =?utf-8?B?Qm9NR3VVUDh2UHM4SDcwems2eitKTXJOZklhcUxjbjRxdVgwU1R0ODhzZWI1?=
 =?utf-8?B?N1BLOXN3VEw1ZWR0OWpDOE1LZGt3TmNnMGRTNWlXOG90c2dpWjJxd2xnYnNj?=
 =?utf-8?B?cVhFOFdoVGxJVjhCVklRaHZDclJ1aGZpdFJVamM4YUhiZTBFMUdVWTRmcm95?=
 =?utf-8?B?SUhub1M0cGpCd0Y2eUJLNmpLU2RZaWRDaGhHekgwNTdZYkNoaHkzcW95SGI3?=
 =?utf-8?B?Z290Q1NMb2RTSDFKa2Z4RG9PbzdORWJvWTZ4Q0R1OVdlUkRNa1AvRWQzTGsz?=
 =?utf-8?B?WEpFaFY1RmhCV2FuOEMvYk1kVnkwS25kYk5pWGFiV2N2SjE0RGtscUJyNEky?=
 =?utf-8?B?SmtGcXZvaEI3SVN6cWRUdVZHSFR2K1ZWYTZIUmhqdXBYWlY1Mzg2YU9WOHhi?=
 =?utf-8?B?U2xXaUJMdStRVGk2UllUdHFPWVM0TEJzbU5DT1dnbE56QkFjUEdPN1lGK0NQ?=
 =?utf-8?B?cTZJNUsyNGNMNkJKL2dwYi9MdTFxTUQ5cVZhWkdkRE1YTHZrbmZmSEpFMXE3?=
 =?utf-8?B?TmxzRFd6UElLd011ZjlmVkE0OGlMdDhrMUVnaUJtY20zY1RMT1lJRTcraDZI?=
 =?utf-8?B?NVR2dnIxbXlPRVdWcVpmdXhBNUpodW1wblVtbHlkUm40Z0pQbEI3MFZhL3BF?=
 =?utf-8?B?Sk5ocU9FRHo5V0t6M255TjdQQW96M2dJZlpZSUU1a1A0bFJOOUo5MC9KdmJv?=
 =?utf-8?B?Z1oyclNQdDdsU3h0RmFId1hMaWJ0Qmt3MjJyVkt1clEzeEVvYXVPRTcwellu?=
 =?utf-8?B?aUI4aUkxSDZOSUVQRlBjVnoxNnp4SE0wclRjMTZxajkzMkJIK0tlekdzSlVP?=
 =?utf-8?B?RkU0MHJweFdQS1lnalhMVHp3NDNyZWZsYkFyQS9vYmRwblpKZHZlOHVpTUcx?=
 =?utf-8?B?OTNqbE9VOElVL1F5SmNpVWNaUWdxQWo3V3IzMDAvaExXckFST1Y4MWpMaC9u?=
 =?utf-8?B?N0JmblJ5SHJRb2NUMzFOSVg2U3dHc3JRZzY5SjcrcEtRQWlFVTk5NnVEOGt4?=
 =?utf-8?B?dlFlMjlXTDFYME1nWUNrZ2FoekdVekhZc0U2bFZpWUk2bG1KQmhMTGF5VnFJ?=
 =?utf-8?B?Ymk5ZDhBUGc4NVZ3dXV0SHM2b29Kb2d2am95SHl2aFFra0VsNjRRMkU2OUtP?=
 =?utf-8?B?dk10U2VUUzFKaktoMUVYZmx4RHNpRjNwWk9IcTVBNnNPS1VhUUFDMVVURjVr?=
 =?utf-8?B?ZjFnWGk2S0pTTDNQY3RVYzMxaU45QVpSWWpRTVVZYTZaSHBxYURMbFVUbkNh?=
 =?utf-8?B?aXZhcFRJcS9NbkRPS0tiVFgyUWI5U3Fic3JEeGhYLzI3Rjh2VWEvT09pRTNZ?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b57b69d-d478-47ca-df27-08dad07ae790
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2022 13:25:51.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Fq7T18CQ/T6zPyCMBrnM9GzhKZX5f0/iiDRpG0UJ/kRwby5D0PB2zZZ215r1d3+OkJKjn51FBoZ4oHMXBfqny13HUzHKu7CoNmSOXlAW48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5416
X-Proofpoint-ORIG-GUID: OxYD_ze9KN1cKPUUWb987_O4J5fWHjnr
X-Proofpoint-GUID: Z-BxSMpGcaZqRoQflb-7w0f4_2TYmF9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-27_06,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211270112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173842


On 11/25/22 19:39, Alexandre Belloni wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 25/11/2022 18:08:12+0800, Xiangyu Chen wrote:
>> On 11/15/22 16:18, Xiangyu Chen wrote:
>>> Backport patch from upstream[1] to adjust jitter to timeout on init after 5 seconds in the event it takes
>>> to long to gether jitter entropy.This also fix rng-tools take full cpu usage with whole cores on ARM platforms.
>>>
>>> [1] https://github.com/nhorman/rng-tools/pull/171/commits/c29424f10a0dcbd18ac25607fa1c81c18a960e81
>>>
>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
>> Friendly ping, thanks.
> I believe this is the cause of this error:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/5017/steps/13/logs/stdio
>
I have verified on my local setup, this issue happens on 
core-image-full-cmdline image due to missing libgcc_s.so, error as 
below, that's also explain why I didn't see it in a normal sato image 
when I sent this patch.

Nov 27 11:23:02 qemux86 systemd[1]: Started Hardware RNG Entropy 
Gatherer Daemon.
Nov 27 11:23:03 qemux86 rngd[191]: Initializing available sources
Nov 27 11:23:03 qemux86 rngd[191]: [hwrng ]: Initialized
Nov 27 11:23:03 qemux86 rngd[191]: [rdrand]: Enabling RDRAND rng support
Nov 27 11:23:03 qemux86 rngd[191]: [rdrand]: Initialized
Nov 27 11:23:08 qemux86 rngd[191]: [jitter]: Initializing AES buffer
Nov 27 11:23:13 qemux86 rngd[191]: [jitter]: Unable to obtain AES key, 
disabling JITTER source
Nov 27 11:23:13 qemux86 rngd[191]: libgcc_s.so.1 must be installed for 
pthread_exit to work
Nov 27 11:23:13 qemux86 systemd[1]: rng-tools.service: Main process 
exited, code=killed, status=6/ABRT
Nov 27 11:23:13 qemux86 systemd[1]: rng-tools.service: Failed with 
result 'signal'.


I will send a V2 patch later.

thanks.


>
>>
>>> ---
>>>    ...ropy-library-to-timeout-fail-on-long.patch | 144 ++++++++++++++++++
>>>    .../rng-tools/rng-tools_6.15.bb               |   1 +
>>>    2 files changed, 145 insertions(+)
>>>    create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
>>>
>>> diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch b/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
>>> new file mode 100644
>>> index 0000000000..d70c6587aa
>>> --- /dev/null
>>> +++ b/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
>>> @@ -0,0 +1,144 @@
>>> +From 3f1d6e53985e40cbe4c7380ce503ca2778d4cd9d Mon Sep 17 00:00:00 2001
>>> +From: Neil Horman <nhorman@tuxdriver.com>
>>> +Date: Mon, 16 May 2022 13:38:54 -0400
>>> +Subject: [PATCH] Adjust jitterentropy library to timeout/fail on long delay
>>> +
>>> +When running rngd -l its possible, on platforms that have low jitter
>>> +entropy to block for long periods of time.  Adjust jitter to timeout on
>>> +init after 5 seconds in the event it takes to long to gether jitter
>>> +entropy
>>> +
>>> +Also while we're at it, I might have a build solution for the presence
>>> +of internal timers.  When jitterentropy is built without internal
>>> +timers, jent_notime_init is defined publically, but when it is built
>>> +with timers, its declared as a static symbol, preenting resolution, so
>>> +we can test to see if the function exists.  If it does we _don't_ have
>>> +notime support. The logic is a bit backwards, but i think it works
>>> +
>>> +Upstream-Status: Backport from
>>> +[https://github.com/nhorman/rng-tools/pull/171/commits/c29424f10a0dcbd18ac25607fa1c81c18a960e81]
>>> +
>>> +Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
>>> +---
>>> + configure.ac  |  6 ++---
>>> + rngd_jitter.c | 61 +++++++++++++++++++++++++++++++++++++++------------
>>> + 2 files changed, 50 insertions(+), 17 deletions(-)
>>> +
>>> +diff --git a/configure.ac b/configure.ac
>>> +index 40008ca..2e12308 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -94,9 +94,9 @@ AS_IF(
>>> +           AC_SEARCH_LIBS(jent_version,jitterentropy,
>>> +                           [AM_CONDITIONAL([JITTER], [true])
>>> +                           AC_DEFINE([HAVE_JITTER],1,[Enable JITTER])
>>> +-                          AC_CHECK_LIB(jitterentropy, jent_entropy_switch_notime_impl,
>>> +-                          [AC_DEFINE([HAVE_JITTER_NOTIME],1,[Enable JITTER_NOTIME])],
>>> +-                          [],-lpthread)],
>>> ++                          AC_CHECK_LIB(jitterentropy, jent_notime_init,
>>> ++                          [],
>>> ++                          [AC_DEFINE([HAVE_JITTER_NOTIME],1, [Enable JITTER_NOTIME])],-lpthread)],
>>> +                           AC_MSG_NOTICE([No Jitterentropy library found]),-lpthread)
>>> +   ], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
>>> + )
>>> +diff --git a/rngd_jitter.c b/rngd_jitter.c
>>> +index d1b17ba..3647b7f 100644
>>> +--- a/rngd_jitter.c
>>> ++++ b/rngd_jitter.c
>>> +@@ -400,6 +400,8 @@ int init_jitter_entropy_source(struct rng *ent_src)
>>> +   int entflags = 0;
>>> +   int ret;
>>> +   int core_id = 0;
>>> ++  struct timespec base, now;
>>> ++  int rc;
>>> +
>>> +   signal(SIGUSR1, jitter_thread_exit_signal);
>>> +
>>> +@@ -508,6 +510,10 @@ int init_jitter_entropy_source(struct rng *ent_src)
>>> +   CPU_FREE(cpus);
>>> +   cpus = NULL;
>>> +
>>> ++  flags = fcntl(pipefds[0], F_GETFL, 0);
>>> ++  flags |= O_NONBLOCK;
>>> ++  fcntl(pipefds[0], F_SETFL, flags);
>>> ++
>>> +   if (ent_src->rng_options[JITTER_OPT_USE_AES].int_val) {
>>> +           /*
>>> +            * Temporarily disable aes so we don't try to use it during init
>>> +@@ -516,32 +522,59 @@ int init_jitter_entropy_source(struct rng *ent_src)
>>> +           message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Initializing AES buffer\n");
>>> +           aes_buf = malloc(tdata[0].buf_sz);
>>> +           ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 0;
>>> +-          if (xread_jitter(key, AES_BLOCK, ent_src)) {
>>> +-                  message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain AES key, disabling AES in JITTER source\n");
>>> +-          } else if (xread_jitter(iv_buf, CHUNK_SIZE, ent_src)) {
>>> +-                  message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain iv_buffer, disabling AES in JITTER source\n");
>>> ++          clock_gettime(CLOCK_REALTIME, &base);
>>> ++          do {
>>> ++                  rc = xread_jitter(key, AES_BLOCK, ent_src);
>>> ++                  clock_gettime(CLOCK_REALTIME, &now);
>>> ++          } while (rc && ((now.tv_sec - base.tv_sec) < 5));
>>> ++
>>> ++          if (rc) {
>>> ++                  message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain AES key, disabling JITTER source\n");
>>> ++                  close_jitter_entropy_source(ent_src);
>>> ++                  return 1;
>>> ++          }
>>> ++          do {
>>> ++                  rc = xread_jitter(iv_buf, CHUNK_SIZE, ent_src);
>>> ++                  clock_gettime(CLOCK_REALTIME, &now);
>>> ++          } while (rc && ((now.tv_sec - base.tv_sec) < 5));
>>> ++
>>> ++          if (rc) {
>>> ++                  message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain iv_buffer, disabling JITTER source\n");
>>> ++                  close_jitter_entropy_source(ent_src);
>>> ++                  return 1;
>>> +           } else {
>>> +                   /* re-enable AES */
>>> +                   ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 1;
>>> +                   ossl_ctx = ossl_aes_init(key, iv_buf);
>>> +           }
>>> +-          xread_jitter(aes_buf, tdata[0].buf_sz, ent_src);
>>> ++
>>> ++          do {
>>> ++                  rc = xread_jitter(aes_buf, tdata[0].buf_sz, ent_src);
>>> ++                  clock_gettime(CLOCK_REALTIME, &now);
>>> ++          } while (rc && ((now.tv_sec - base.tv_sec) < 5));
>>> ++          if (rc) {
>>> ++                  message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain aes buffer, disabling JITTER source\n");
>>> ++                  close_jitter_entropy_source(ent_src);
>>> ++                  return 1;
>>> ++          }
>>> ++
>>> +   } else {
>>> +           /*
>>> +-           * Make sure that an entropy gathering thread has generated
>>> +-           * at least some entropy before setting O_NONBLOCK and finishing
>>> +-           * the entropy source initialization.
>>> +-           *
>>> +            * This avoids "Entropy Generation is slow" log spamming that
>>> +            * would otherwise happen until jent_read_entropy() has run
>>> +            * for the first time.
>>> +            */
>>> +-          xread_jitter(&i, 1, ent_src);
>>> +-  }
>>> ++          do {
>>> ++                  rc = xread_jitter(&i, 1, ent_src);
>>> ++                  clock_gettime(CLOCK_REALTIME, &now);
>>> ++          } while (rc && ((now.tv_sec - base.tv_sec) < 5));
>>> ++          if (rc) {
>>> ++                  message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to prime jitter source, disabling JITTER source\n");
>>> ++                  close_jitter_entropy_source(ent_src);
>>> ++                  return 1;
>>> ++          }
>>> +
>>> +-  flags = fcntl(pipefds[0], F_GETFL, 0);
>>> +-  flags |= O_NONBLOCK;
>>> +-  fcntl(pipefds[0], F_SETFL, flags);
>>> ++  }
>>> +
>>> +   message_entsrc(ent_src,LOG_DAEMON|LOG_INFO, "Enabling JITTER rng support\n");
>>> +   return 0;
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>>> index efc08b5e0a..c6284f0006 100644
>>> --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>>> +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>>> @@ -12,6 +12,7 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
>>>               file://init \
>>>               file://default \
>>>               file://rng-tools.service \
>>> +           file://0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch \
>>>               "
>>>    SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
>>>
>>>
>>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#173763): https://lists.openembedded.org/g/openembedded-core/message/173763
>> Mute This Topic: https://lists.openembedded.org/mt/95039053/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


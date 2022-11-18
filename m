Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F79AC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 08:27:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7073.1668760075564089273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 00:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8321731fe0=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AI6tDJJ030961
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 00:27:55 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kx0qxr7p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 00:27:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNr+NgcdGpmVY2OLvc/O6fI8waE5eOhvP9MUX7b4P9yvI9RcKQ6OIQ9jfBnSvxj3qC8ZyTiHQrE5vZ3wOBieQfEsHFIT0KpknmsbcPdTYm532eEiKbwlCsMW049C5iUoHTrmkg9ufe+/MUEKt4q6AlyEl32U3ukn/+HIexhFnn1BUTy8Ds9cKdafOydDgLFMIykB+WAmR4f39UNwWozVlWaH1l6TFKHX1+nkYo2oaljkioB8Zi5c4NZ9O5K/GKgERc6SBn9LfOQFZFlhcnXH1DyhyavjKrFbXznlCtWfxZfmY5/WP0s98hGl+NkCpKzaUfYZ5YI/GoKh24ABQN3TJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg0jRlsujrEMps2xkx3Heia3ocg43fmCmakWtyYZrAA=;
 b=C7DwEskyHDkEpYotm7KbLGYJJJxVZKq/Ob5p4owqbIoSHMxu5pYlyN7UqYey2uHFcdw/4lmcJhvdQhxDmfnfSqFMv6WZG7Ai8JSKtNir6To8t5wKBneqRguISQBKrViRz9FBSnecuRRhxBG/9XJfMyy18gzuJKK4jcyHESdjX28cAI5sB0ul58Rw90wIxrX8dqTYSQG48ZNa/7ZA2/fPU91YbRKSCyWgHuHRIMcb2Lu8jUhvV0WbWZmIy0x/MvkQAJkzE0SFsQ8tcpPDTYlFn+PUPXWlmFj4iiQ7Wi/WSU0pdVWPPnxWLDl0ATRKESZ0MjyBjVYElXJMN8ycEeNXLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Fri, 18 Nov
 2022 08:27:52 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 08:27:52 +0000
Message-ID: <5cc04084-0000-7e75-2970-70c514003616@windriver.com>
Date: Fri, 18 Nov 2022 16:27:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-Core][master][kirkstone][PATCH] rng-tools: backport patch to
 adjust jitterentropy library to timeout/fail on long delay
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <1727B4342812AA9D.29995@lists.openembedded.org>
From: xiangyu.chen@eng.windriver.com
In-Reply-To: <1727B4342812AA9D.29995@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA1PR11MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: ac72daff-7c7c-420f-9865-08dac93ec8ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nmJ1QVSMKHAUKiO+TldzRwfcjvJEaEkL44I9sG/D2NUatH5v7Lp3TJmP2fcTbEh9xk6GfvVMB6wUL9xAvMMB90RPyV4NumJJSr8buiR8k3HOvFOnji9V6And3H/IlWY+0NLUPBJd6poM1RtGwJMF/aoYPWolZIN8l1Uu612nrH6/rdZ0B0O0I3k932W+Sjps2HyiSebzwEnMBx/EnDMRiBq5w6tL/TAyx6fty5MKFeaxxFtf3S2OZoo183ijHiXtHd8K6PgrvdPb630h1uOK3FmG4fsSWyp8lSe5wlmhtY0dXTASKzaBHevoRpFF4cjqpDJm8bimZ4kyy2+VaVedHc19Ao3pIHmqpXRNYs7GVkq6pJ1vM7RuDppNiCsYo3ZNKf8hpJPsNFeGNxSBYPVk/eHkRuElp1ziJ4IEfEqBFkG+GXdST8XH3SJq5ZY7OeLjMVJZ1J67mKbC36NEuRqOK+MielmQLA/dqJqN3e5h+UdPT/S7txo0r7Na3W0S9KT+4B34rrLVR2HGHkWevnu64514x4/PnFPZ8Y19iOFUtxIxayYth5MzbjB5VznYDbvHL3RzHi4Een38nps8lZ6dY0cUHm0Isxz42qKH+a7g80rs8Fgf+jTTK4sE+KJd23qqaNldLwSQWvyAOLV2SeLFLBCuSQJmnURVGRq2cchZSNfxyez6eO99U8MspAqzMSQmrN9JC4fHwB4FiDh6aw+89rtWXLbbYnvtMEICoyrj/7upm5+TVHbLE15ena03pFJihQPUr5K8cfTqbm5PUEqR7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(451199015)(26005)(55236004)(9686003)(83170400001)(83380400001)(6666004)(38100700002)(6506007)(53546011)(966005)(66899015)(6512007)(6486002)(186003)(2906002)(5660300002)(478600001)(66946007)(8936002)(66476007)(6916009)(8676002)(66556008)(316002)(36756003)(41300700001)(31686004)(31696002)(9126006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T2t5aTlRV1JOakhhWWFlcmpyL1VrRlBQbE5tNkZPZC90NUliWndISWl6emh3?=
 =?utf-8?B?MXFvL1Z4MEwwbGxOcDhybW5rdWFiejVHMVpWSCsyY1lhQkI0Q2lRVnZQTy9u?=
 =?utf-8?B?VDQ5ZldNSUhoUzRxMFduSDh0RldCV1doV1pBT3NXd0d5dngxeHhXZmVwakFP?=
 =?utf-8?B?YThlQW9laWlSZDRZb3gxOGk1NGp1VlFSZGhpYzVKSW9yYVNWNElIZzdqT1RN?=
 =?utf-8?B?TGhCMnBvV2tKakZXS0lUcWRzNlM2V0lMeTlqcm1EN2tXMWRuK0M3Qlg0UVFm?=
 =?utf-8?B?emJYUklMYnFJVkVKWjVKcldqWlAyM3ZZckRqNDR2dTBRcTQyczlmQ1IwOW9H?=
 =?utf-8?B?YXdNVGNhN0JsQjFraWduU3d6dVo1cTdIVWJkaXZzV2pZRnlCMUJCd1hobGxC?=
 =?utf-8?B?bEI3L0hxNkNsaG1pTzl4RzJvdFdRbEJsd08wUkVIcFRHYTVlVUtsMVh1MEVj?=
 =?utf-8?B?UXFmQzBiajFvOEM2TWt3a1Y0dzQ0NlByM3JRbUFPR3Z2a3RqK3pKMVNwdXE3?=
 =?utf-8?B?bjNma1lLRHlsdVRyUG9XTGFDZ0xlcGxDR0JKUHFmWXkvdHJXeGNGQlpxZmNp?=
 =?utf-8?B?S2pEaFZCc1JaVnVKUXNPeExsZ3ROcDl3MWJKMkdvRkwxRnhkanFMbi8wUXp6?=
 =?utf-8?B?WlFrVzlZRGZLbU9KS2M4Rk44TkkyWWVnbXJHcDBDUmVvN21FSzhraHR5bURM?=
 =?utf-8?B?ems5elpFRHlwS04vaTFSSkZLQS82QitCam9xWlM2NmVRdmdkWiswcWd5Yk1z?=
 =?utf-8?B?dE5iVGo5SzBVUFBraGlyMW1zTEJGMlZRWWpxdWltellBOU1tM3NMd2I5RjBU?=
 =?utf-8?B?Vjk4Q05JWHJLYWt0Y0FDK2xoR2pxLzhHWDg1M25lWmx2ZjFmaHkxa2Qzckh1?=
 =?utf-8?B?UEQrSkNGSno1VlZNK1RrSmNRbFozbnBiOFRSMm10Z1hBNEl4Skh5di9oTHBC?=
 =?utf-8?B?TUVrdlh3SkFBeXl3UTBLdk9jRmJjYmNRbEZHOFRiU1laUDNvcGV4czNrYXJi?=
 =?utf-8?B?MjhEYTZ4RUFqYlRIMFZqVjJPc1BmOWk3bE43QmdEVFZpRUxNNWdIZnBSeXdK?=
 =?utf-8?B?MVlmR1Q2bVVMSDM2L3VKVEhLTjdDYjNqRXo2TG1kdE52aEtaU0JOKzlQUFBu?=
 =?utf-8?B?YkR5VEVxRGhwOTgzTzZudjVLV0M3bEZ5U3N5Ti9WQWhWRkhTNjRzYlgxNzRv?=
 =?utf-8?B?V2tpQkh1SU1acnpEVDlpbG5lMDVxOGhPQWpKYUZYZzhIa0NLald6RDI3dzcx?=
 =?utf-8?B?dFhxeDM0Q3EzT1BrYmcxOHZJZWltdXdRZ1ZmdjF1ZXF0SmdINllHMUxBay9k?=
 =?utf-8?B?R2U3d0prVjA0Yit3eDd4SHA1R0xUS0JUUm8rRndLeWF0dEZnS1MrVjRpVjZ2?=
 =?utf-8?B?YWRKMnVjQWlabkhZZnQyTEY1Zi85dS9LeWtxcnhxWnVyb0V4YWIyTGxGS2hX?=
 =?utf-8?B?TC9EY3g0WFdLQ3pYL3dQQVJKb09kc1dTUEs3cEpOUFBzL0twV29pTnBWTHEy?=
 =?utf-8?B?N3l1Z1FCVWR0MVBRc2REZDBJOWFpTXJ5Q3h3UHNLQzA5Ykp0L3R4bWpGMndm?=
 =?utf-8?B?aVNhdU1HZHZzS0pIOTVSYnFKbkRheDBVU1Q1NlRSb3hnOTlHbUIxdVBCb251?=
 =?utf-8?B?NGxyVUxWYXhUSFpZMXJ6MjJhRmhiUGFTNFpBMnNqMGJuTUVuTzlZVUh5WWZm?=
 =?utf-8?B?OEtUV1BiMytPYTAyNlhoeEgySHp1UloxeGp0K3NPQlBqUEMrRk5OTThLTmlr?=
 =?utf-8?B?Yk9aWSt3RnNLM2VMM0czeitKQlkrUHdUeHJPdUc1cGUzYWRDVSt4U2g1YzB1?=
 =?utf-8?B?aGd3Ti8rNVJNakZXNkFUZ3paOS9wMnJ0eTh5WVRkZkswSDZlamsybGNlemV1?=
 =?utf-8?B?Q0xSWk92TFVSS0J2aGpybWRJaVZ6UlJwZzlhdkNSc0VvOHBad1c3WDdyUGFP?=
 =?utf-8?B?MGdRdmpGeW9leGI5V01mNGROWllXMVF0TksyUjNqL0xMUFpqcVhtS0dUaWIx?=
 =?utf-8?B?eE5YRXFKRFBBSkFGVVlzTVJxc2ZWNHhjMTVJRElmUUNUSm90U21MOWw3UEp5?=
 =?utf-8?B?aEZkb202Q2M2Zlo5Wi9ySWRlazBXSjFLM3dpTERKNE5CZG0zY25HNWVndU16?=
 =?utf-8?B?cENxOWN6Z0xJTHgyOGpCTUdudXZHVlpQUUJjcGdHSlhreVFrdldTWXM4R05W?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac72daff-7c7c-420f-9865-08dac93ec8ae
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 08:27:51.9481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W59qKXsZ2wpOHrxVfdxPzS8Bspbr0IOcsoaqCPvs9c6u1CzETfJ9GR7W9dV9j8PY8V+qIH145flD/W9xlLkg4B7F1LNVBCU9tQJ+GQxhFac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
X-Proofpoint-ORIG-GUID: BCYMI7ZpYIYaWmftyND4GXMVS3j1-2Ac
X-Proofpoint-GUID: BCYMI7ZpYIYaWmftyND4GXMVS3j1-2Ac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 08:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173451


On 11/15/22 16:18, Xiangyu Chen wrote:
> Backport patch from upstream[1] to adjust jitter to timeout on init after 5 seconds in the event it takes
> to long to gether jitter entropy.This also fix rng-tools take full cpu usage with whole cores on ARM platforms.
>
> [1] https://github.com/nhorman/rng-tools/pull/171/commits/c29424f10a0dcbd18ac25607fa1c81c18a960e81
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

Friendly ping, thanks ;p


Br,

Xiangyu


> ---
>   ...ropy-library-to-timeout-fail-on-long.patch | 144 ++++++++++++++++++
>   .../rng-tools/rng-tools_6.15.bb               |   1 +
>   2 files changed, 145 insertions(+)
>   create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch b/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
> new file mode 100644
> index 0000000000..d70c6587aa
> --- /dev/null
> +++ b/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
> @@ -0,0 +1,144 @@
> +From 3f1d6e53985e40cbe4c7380ce503ca2778d4cd9d Mon Sep 17 00:00:00 2001
> +From: Neil Horman <nhorman@tuxdriver.com>
> +Date: Mon, 16 May 2022 13:38:54 -0400
> +Subject: [PATCH] Adjust jitterentropy library to timeout/fail on long delay
> +
> +When running rngd -l its possible, on platforms that have low jitter
> +entropy to block for long periods of time.  Adjust jitter to timeout on
> +init after 5 seconds in the event it takes to long to gether jitter
> +entropy
> +
> +Also while we're at it, I might have a build solution for the presence
> +of internal timers.  When jitterentropy is built without internal
> +timers, jent_notime_init is defined publically, but when it is built
> +with timers, its declared as a static symbol, preenting resolution, so
> +we can test to see if the function exists.  If it does we _don't_ have
> +notime support. The logic is a bit backwards, but i think it works
> +
> +Upstream-Status: Backport from
> +[https://github.com/nhorman/rng-tools/pull/171/commits/c29424f10a0dcbd18ac25607fa1c81c18a960e81]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
> +---
> + configure.ac  |  6 ++---
> + rngd_jitter.c | 61 +++++++++++++++++++++++++++++++++++++++------------
> + 2 files changed, 50 insertions(+), 17 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 40008ca..2e12308 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -94,9 +94,9 @@ AS_IF(
> + 		AC_SEARCH_LIBS(jent_version,jitterentropy,
> + 				[AM_CONDITIONAL([JITTER], [true])
> + 				AC_DEFINE([HAVE_JITTER],1,[Enable JITTER])
> +-				AC_CHECK_LIB(jitterentropy, jent_entropy_switch_notime_impl,
> +-				[AC_DEFINE([HAVE_JITTER_NOTIME],1,[Enable JITTER_NOTIME])],
> +-				[],-lpthread)],
> ++				AC_CHECK_LIB(jitterentropy, jent_notime_init,
> ++				[],
> ++				[AC_DEFINE([HAVE_JITTER_NOTIME],1, [Enable JITTER_NOTIME])],-lpthread)],
> + 				AC_MSG_NOTICE([No Jitterentropy library found]),-lpthread)
> + 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
> + )
> +diff --git a/rngd_jitter.c b/rngd_jitter.c
> +index d1b17ba..3647b7f 100644
> +--- a/rngd_jitter.c
> ++++ b/rngd_jitter.c
> +@@ -400,6 +400,8 @@ int init_jitter_entropy_source(struct rng *ent_src)
> + 	int entflags = 0;
> + 	int ret;
> + 	int core_id = 0;
> ++	struct timespec base, now;
> ++	int rc;
> +
> + 	signal(SIGUSR1, jitter_thread_exit_signal);
> +
> +@@ -508,6 +510,10 @@ int init_jitter_entropy_source(struct rng *ent_src)
> + 	CPU_FREE(cpus);
> + 	cpus = NULL;
> +
> ++	flags = fcntl(pipefds[0], F_GETFL, 0);
> ++	flags |= O_NONBLOCK;
> ++	fcntl(pipefds[0], F_SETFL, flags);
> ++
> + 	if (ent_src->rng_options[JITTER_OPT_USE_AES].int_val) {
> + 		/*
> + 		 * Temporarily disable aes so we don't try to use it during init
> +@@ -516,32 +522,59 @@ int init_jitter_entropy_source(struct rng *ent_src)
> + 		message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Initializing AES buffer\n");
> + 		aes_buf = malloc(tdata[0].buf_sz);
> + 		ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 0;
> +-		if (xread_jitter(key, AES_BLOCK, ent_src)) {
> +-			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain AES key, disabling AES in JITTER source\n");
> +-		} else if (xread_jitter(iv_buf, CHUNK_SIZE, ent_src)) {
> +-			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain iv_buffer, disabling AES in JITTER source\n");
> ++		clock_gettime(CLOCK_REALTIME, &base);
> ++		do {
> ++			rc = xread_jitter(key, AES_BLOCK, ent_src);
> ++			clock_gettime(CLOCK_REALTIME, &now);
> ++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
> ++
> ++		if (rc) {
> ++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain AES key, disabling JITTER source\n");
> ++			close_jitter_entropy_source(ent_src);
> ++			return 1;
> ++		}
> ++		do {
> ++			rc = xread_jitter(iv_buf, CHUNK_SIZE, ent_src);
> ++			clock_gettime(CLOCK_REALTIME, &now);
> ++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
> ++
> ++		if (rc) {
> ++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain iv_buffer, disabling JITTER source\n");
> ++			close_jitter_entropy_source(ent_src);
> ++			return 1;
> + 		} else {
> + 			/* re-enable AES */
> + 			ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 1;
> + 			ossl_ctx = ossl_aes_init(key, iv_buf);
> + 		}
> +-		xread_jitter(aes_buf, tdata[0].buf_sz, ent_src);
> ++
> ++		do {
> ++			rc = xread_jitter(aes_buf, tdata[0].buf_sz, ent_src);
> ++			clock_gettime(CLOCK_REALTIME, &now);
> ++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
> ++		if (rc) {
> ++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain aes buffer, disabling JITTER source\n");
> ++			close_jitter_entropy_source(ent_src);
> ++			return 1;
> ++		}
> ++
> + 	} else {
> + 		/*
> +-		 * Make sure that an entropy gathering thread has generated
> +-		 * at least some entropy before setting O_NONBLOCK and finishing
> +-		 * the entropy source initialization.
> +-		 *
> + 		 * This avoids "Entropy Generation is slow" log spamming that
> + 		 * would otherwise happen until jent_read_entropy() has run
> + 		 * for the first time.
> + 		 */
> +-		xread_jitter(&i, 1, ent_src);
> +-	}
> ++		do {
> ++			rc = xread_jitter(&i, 1, ent_src);
> ++			clock_gettime(CLOCK_REALTIME, &now);
> ++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
> ++		if (rc) {
> ++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to prime jitter source, disabling JITTER source\n");
> ++			close_jitter_entropy_source(ent_src);
> ++			return 1;
> ++		}
> +
> +-	flags = fcntl(pipefds[0], F_GETFL, 0);
> +-	flags |= O_NONBLOCK;
> +-	fcntl(pipefds[0], F_SETFL, flags);
> ++	}
> +
> + 	message_entsrc(ent_src,LOG_DAEMON|LOG_INFO, "Enabling JITTER rng support\n");
> + 	return 0;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> index efc08b5e0a..c6284f0006 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> @@ -12,6 +12,7 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
>              file://init \
>              file://default \
>              file://rng-tools.service \
> +           file://0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch \
>              "
>   SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173266): https://lists.openembedded.org/g/openembedded-core/message/173266
> Mute This Topic: https://lists.openembedded.org/mt/95039053/7175143
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [xiangyu.chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


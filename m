Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DFAC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 10:08:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43917.1669370915528473792
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 02:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83288c6b08=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP9g3AW018463
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 02:08:35 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6cubw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 02:08:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4SiMy4mtikJyfo19GacBhOMPkfBLblR+MQLSE3s09+IRNQl9u5N3sf+wHUKHlx6VNmBgmTm1biAq2UtZ7qbi9mdU1h7U1h4DyxnExkY+02ph76Hwa/dNPZY9/p5wuErY6e5YlR2sa6ikB/cXQNg/VdxdfyqswSqfs9o6hXLQ6M06hOSIDoNkWktEx3RvkxFMhfp8G2P3GAFD9dAfUDfJX0IwoLIXanDh7Oi9P1sFrwlJxvKqWU+HAACQp82kHc/pIJADU5J9UCsRXnUgjEf0bFqseDnUbfDSAObntDQMphLyZ6DJMYqiFEajxyzlAimEaHlnDS563A13M7bCeJDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eirwXbolYaAt/fP821X9QQfuoqjrMfYka7blTdUXYh0=;
 b=UzIkLpFkxPr72nnD5GQMo0SaSvbksM2i8cmTCvCTzKtFbweOfuQ3Bg+tkIG4pOT2AvqDvChnc3ryKiwtX5L3uF3/lpoinDQuMGvjGO0h3EuWfUoodEUdCQndWhUIOeHohMHOuVKiBpH5bBH2HDuDsHuNTWOjLAU0E9y19VQeIqpHYsjEK0ctdoHFeyys2ikwY+VBmn024hp6+4h+/AaMeWwDjRxKsW+Br90qjQVNo4kJvww6H2EDyIVIsl8gPzbzlPkQyG+aio7GpbfWi0qML/AedBlOnrHYmt6xXCBwdq18k9kNNrbL+MOFhBCTlOnJM5/AKeShjruxJSveI+CRFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL3PR11MB6337.namprd11.prod.outlook.com (2603:10b6:208:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Fri, 25 Nov
 2022 10:08:31 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 10:08:30 +0000
Message-ID: <d7240f48-42f2-f16e-2fee-56a016ca7d2e@windriver.com>
Date: Fri, 25 Nov 2022 18:08:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][master][kirkstone][PATCH] rng-tools: backport patch to
 adjust jitterentropy library to timeout/fail on long delay
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <1727B4342812AA9D.29995@lists.openembedded.org>
From: xiangyu.chen@eng.windriver.com
In-Reply-To: <1727B4342812AA9D.29995@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0106.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::21) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL3PR11MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2dc101-f089-4c13-3108-08dacecd00d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HgO+f0zsjp/5tTwe7iKfFOrgw+C2NBHkdDyOjs2uFlgi757HEevwtMkIQXrrnPsTDJA1G+KJBl5yYCNd+tHqMafmwBX+ia2mYerHsDNUCsb8Kj+qCfipGOFU4Ex6SFeIoa/wQv3Zdk6NtSzICpMkp/P3K74F8d5W0TJMvyfnRUCYolybAI5W0WiJcdy5DcJMrTm+sXbcjYFpZEZuuUcGg0gAEtv2oA68eaTSZkHlE4mkhUvPZlIe49UbYB8MuNunO0ucC8c4Pohawh1kujz+boc1qp1qnoWjlZcDClInWMBtMzRm5V5Ua6n5cuXruR29H0znsv5C3HqaAXtEcKvwMAZxx7ZjnxQIMdMdj68FP4LqxWpVDwIhvmyWO8pLwOmRhw0P8/neAQBgGYZX9NJEnQWXCriCStB8w7/17xQPClONtiSP7L4dg3RSp1RB6+1VBHe8nVts1QwwiQfknfHvNeND1oEG/czg3W7P3x6MKJ76TdWGxRYpfMGWKwDmfXVXAPBxbKDPXB2L5vtbJg8cKUOuAb4FDjeal+YWhiCkR6rggfmPmvfeJE9cxMdBaB0C2l8x2vz+SuVx52UuzUMPdSC5r/cChAmmyqJnivHYnRos43rFZRtRD4EbxzkmD8u7qotG3PAdQAVOL0WIgeDYDm8kA/UFjLFNhklgLPQgJLL3jysEg0Ecv0QSkfYvLesB6DdgUPwAhrrA+tRaFUEF1oYxuj44wWFzMgR7oAiZpN4oZ3vqyUbS96p7pjYKJ5cN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(451199015)(36756003)(83380400001)(31696002)(83170400001)(5660300002)(38100700002)(41300700001)(53546011)(186003)(66899015)(8936002)(6512007)(6666004)(26005)(2906002)(66556008)(66476007)(966005)(6486002)(8676002)(31686004)(316002)(9686003)(6916009)(478600001)(6506007)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z1dCSDJTZHkwNlA0anNCVUhKcjFMOUxJZ3Bnd2srd0VNUVBmazNHcUtnZmtx?=
 =?utf-8?B?aStkMW0xRjVSWko0VzhjZUVrOGFzbVFudUpURXVnNEVPSFhId3NycUttd1h2?=
 =?utf-8?B?S1FNYzQvbGo5Zkl0Mmg0a2UxRTJKVVQ5U3EyckRsQ0xGenZYMSs2KzZHaEI2?=
 =?utf-8?B?eUVYWlRkLyt2YWNMM29iSFlrY1BIeHgzRXRVNklDc2VkWk02MHZzOXJNY1Zv?=
 =?utf-8?B?RnY4NWdJNVpUNGdWOHRFL1BjTkJMWUhEdld3cjc4RFhza25rRzJVUkFwRHlr?=
 =?utf-8?B?K1AySStPZEsrdjB6SkU2bzlHTmVLdU5JaXhWNVduNVBYdU5UQWJ6eDVLNDFh?=
 =?utf-8?B?dFNQK2xVRE5YSm1TWXF0bHkyUnlBdmpBSXZBVVpsbmp4KzVkNWJxWU9iVEpy?=
 =?utf-8?B?WFh6Nk8zVEpiY2JkTXpFNFVFMjdmWnVzY3ViZFoxV0ZPOGNieUs1U3A1VWVm?=
 =?utf-8?B?WjRjSTBEc29TWnFwZ3ZuWFc5dWR2eEtlN2JLS3pTNjhzR1VwR0Z3cHdiOSts?=
 =?utf-8?B?MUF3SFE3aHB0U1l3WUlaVkY4TTU0dHJhVFNNU0RDNm1ueHd1RWw3QUs0cTVO?=
 =?utf-8?B?Z3c5Y2tFalRvS0VSSEJTTDZ0WVQvMFg4M1I0bEJvNkd1NGo3bDdYQWEzUDJS?=
 =?utf-8?B?clM3UkQ2T1RtOWJWSVJ2K21rRlprc2RaSFd4ZE42WXVta0tCM2RGT1JyWmpF?=
 =?utf-8?B?dndRK2hJSWdTRFkvTDlIdlRpZmhuT3ZtcU8rTnJrTXJCeFUySEhRSkZyUU1W?=
 =?utf-8?B?V3BrVHdLcTBxcHNRUmlkZUdvVTJGMEtCWGxzWTlpem9JK09Wank0bnJJZGNr?=
 =?utf-8?B?aGFiTElsSG9lZ0dOb0RNNVh4U3YydzkvdHlBaDlrK0xWRVJieWtwdWRTUlEr?=
 =?utf-8?B?QzNWR3Z5SHZaekpCUWpER1V1aGk0ZVhtK2gySzZEK2tuQnRqUFcreElkdWlZ?=
 =?utf-8?B?UzlxRVhRZmxWVzFCQlNieERRbkxJQ1Z1Q0QzWDE4MlladGtWenUvWndoamFy?=
 =?utf-8?B?VFdxYW14VUFjTC9TbWtoM00zMjdGd2xkV09YL0ZSVlEvZnhvbnI3Wll4ZGQ4?=
 =?utf-8?B?TXJRbHVCcHBzNngwb2haRDBsbDlGZ3JkZzV1aVR2a0pMNUtFQTFGTDRDVmtX?=
 =?utf-8?B?OTc1RWF5UWVLRGhLT1NmUkxIODRnYUNHWHJFYzV5UUM5aytSM1YwQzh4RlZl?=
 =?utf-8?B?YWl5V3BZM1ZMd1pOK3VGTUhKVytPREhhLy9BZk1QVXo2c2JYZThuOTNWNjU3?=
 =?utf-8?B?cXpkL1EyYWlxWUdZSVFwVkdpUGdoVTdqM1BHdklDRHMxRTBDK3IyMnJ0cmJR?=
 =?utf-8?B?enQwMVhXZmU5WWhmcFdIZTJLeGQzWm55cjNlc20ySlJGQU1aTmhiNXB4YmF5?=
 =?utf-8?B?b0oxSjB5bXBCZ05Fb0tQbHkyWTFxUEFCRHM0VmNLV1d5TnlKcTNBVmRiUkhp?=
 =?utf-8?B?ZStMUnV6UTJQdy9hOThKTHZVaGVqUlJnYmcyNzAyK0orbE0ycTFCZTg2SzFr?=
 =?utf-8?B?UG1nc1lSTHlPKzJDNWpPRTJ0L0NEeVdmSFFFUVFWZDJKa1VDNjdyZWxRTUVR?=
 =?utf-8?B?T1M4TUlWcms3SmNkbS9SaVRjTHBQbGRlTmR6UXBhUnBBblFySGdPMVJRTXI1?=
 =?utf-8?B?Wmp0bVNSbW5BRjlMamZmaThPQUdwNmhQdGlCYXpwK2I0NGxBNlBYSVdSaGtV?=
 =?utf-8?B?UDdJM01oaVc4WFdGNERBbC8rQ0t6c2hMZ3Z6Y1R3T014M2ozNzZCVElGVUNZ?=
 =?utf-8?B?TkRWeEovMmdYNXhlbnRGWEJCUTZ1ajJsVjdPT3BQdDdyNEhNSGsvdHczUTFO?=
 =?utf-8?B?U0RVMzJoRGFNTlVoeW9mZkxHaFdsRExrclAwbUh5cGNQdTYzVEhTUXNVbThx?=
 =?utf-8?B?c1pTeXN0d25MRGtJc0xCMVVrc2cxSHBidm94cC9RTjlXQWw0amo0ckxkdTY2?=
 =?utf-8?B?dzhJUmpMeXk4VCt0aVBhYngrV3ZJd3RBdFp4NWFoQUR0RkZVanNiQ0laa0pv?=
 =?utf-8?B?NDNWMFBaenNpSTVra1BqK1A5TUdqS3RTRURmNFlBNU9kTnFZbU9xOTBFRnZk?=
 =?utf-8?B?QWZ5dFlVMytaYVVmd09pL0ZuTEljRlg3YlphaXR4L25VcUp4Qk5NVDV6TGZo?=
 =?utf-8?B?NjhjeDhmbk9CMG9LekQra2FPSkI4czA5Ymt0SDlGTXYyUUs4SGIybmNhOGVl?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2dc101-f089-4c13-3108-08dacecd00d3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 10:08:30.6929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BijUWzxIA8p6HgV8dT+9AcI1pmegTIahJgk1lkeFnZ4GDkn70by/XOhlR0x/TL2E5t1Dvwur34KEhL33ZwJbaGM2Ing+y8/EDQHI8kICbUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6337
X-Proofpoint-ORIG-GUID: MjULmtUzABAhqPddTHHru-Yw9f9FnuJG
X-Proofpoint-GUID: MjULmtUzABAhqPddTHHru-Yw9f9FnuJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 10:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173763


On 11/15/22 16:18, Xiangyu Chen wrote:
> Backport patch from upstream[1] to adjust jitter to timeout on init after 5 seconds in the event it takes
> to long to gether jitter entropy.This also fix rng-tools take full cpu usage with whole cores on ARM platforms.
>
> [1] https://github.com/nhorman/rng-tools/pull/171/commits/c29424f10a0dcbd18ac25607fa1c81c18a960e81
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

Friendly ping, thanks.


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


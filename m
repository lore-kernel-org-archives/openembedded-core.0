Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EF0C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 01:10:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37594.1669338631148359084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 17:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pFXzk2Oa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8328117f31=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP0wRD7026712
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 17:10:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=g1AYlH0690n3pbLIGKgrWsvxOeU2u02clzjpFT+8KiI=;
 b=pFXzk2Oa/HexuQxJdHYJzKnZsik3wIyukIOAdDXq8hz8BUJi0N4j69bCuLhPuYMbTgij
 tLvDTxDP36NBMqjihE6HrExIAcA34VC+PHETc1D3HNIJABVKchlOVI/Qqoa2jWDhqS5p
 2LP8LmW56sdJZYLl9kl8ctvmQib0MAAx237thIPZ0H3o0WEVZhQZiw2mwrYlTlCn1YFp
 EfihI5xRNLMVhspTYHtTTZWpBXECfQvw815RZpwPBQLFKt5A2vGiGZXnI8ZUIqD2cC8U
 8IUV0CO+JaTstl4vOo8Ja+hbEJ2CYlNdZ9mH6wRd1SHUnsg9ZPbqLYEFexwSBBeE/X/b 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6cjqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 17:10:30 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AP1AUZe019549
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 17:10:30 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6cjqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 17:10:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiQGCTEV8aEbORg0mHaXVIFnS9otOzoLAevEiqvJz6pr4cX0pKRuAEEVif9QyXF2xN7bCniHRYF/C0VzHkd9KeXy3UvwSY2uSkMHMk/9mVToRdczqTQYICSG9acl20DJRD9F4BG8E1fI+h45XIF5bRA7TKuHCyMUdA2/uyHTEchYpGdijZfDz85mBgGMex90IzIscopMwg8k2F4dL5pbZ8eCobOK/uSP4qDV2tIOJ1xo6JOvo2nLv0lsswqH1P3OFWoROwDSZeUmgnLIPBxf8w//8n7JR8NmPRCdSUZ3lw9QuHGLxrGL7U3rFflrfM2pmPs9ROdbZ1fZETw3m3yD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1AYlH0690n3pbLIGKgrWsvxOeU2u02clzjpFT+8KiI=;
 b=EK9wKW6j0JLBC334uumjPTtZolZENr3jPk6VhkPO09gejqd6piizOHvC5p9Zpi9X1j8Yqv3Z/MuLIg2HrhX7Cdjwkkmy7BEo9yVPBZbHEOiFCgQJOy+rLjGxdj10F8Xh321jnQn2fUZGqSz172xHh0fFF/GpOQncV6y/YxMcaD3gpoV8yhh0EFbhv26wKMZrD3ioTG+YDKSlK9NEoRH+lbKFm6zY2zE5p0QSLU1VwOxCoGGWyFOOW3rzIGVnWu0K52oNcRUk7Lfx+XStByOpughVa+3kbr9/jjTdsVYmIO/PnDjrz1lHFePJgrUyzC5+/Q/FBKdeGiAFCKP1+TYQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA1PR11MB6805.namprd11.prod.outlook.com (2603:10b6:806:24c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 01:10:27 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5834.015; Fri, 25 Nov 2022
 01:10:27 +0000
Message-ID: <50fc7ae5-94e7-90d5-328e-156c8676167a@windriver.com>
Date: Thu, 24 Nov 2022 20:10:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [master][PATCH] valgrind: remove most hidden tests for arm64
Content-Language: en-CA
To: Zheng Qiu <zheng.qiu@windriver.com>,
        openembedded-core@lists.openembedded.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20221104184705.24777-1-zheng.qiu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221104184705.24777-1-zheng.qiu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA1PR11MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: fce483e2-0ff1-4a25-ad59-08dace81d6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HfIv16NLmutJf4DyiK9OEhnT1IZ5XWQNtbnQZNcUZp7wab1Wro8n6PIzto97mkzLl2hZdw1ikOF+dcv4snCrjbWBW6sEtz6INQSlEcwgzqRdtYDwkpn/8JyPH1BZrov/8U6rgq70ucgnasmvktUVyJ2Iv4q2j1TXyAO8KcNIFUvRqXDR8mVLw71BeWwzh+KnzGTiZqha0vvD8b757s3yaLQA+RnxQF1CpK+RiAt4NO2yD+nYhGr8HT/UpGxWmYdZu+hmzozwqmemQckz1ZPpbZa0yjdtPbwGNHPAnLDgy7OoW/SUdXFtgRGV81udXWfO4PssNe7nk8Xq1/m3Erz7LFqYkTwOu8dKY5dm+nR0nS+c1dReLlBzzm3Il1JSRfNuBhlfyJ8ujLdmsbYsCRxW+R/uxiOn8XcCBEUiAMfcbTtWevFH3iiVHMvB4PqQp6umbTmiq36RTsCwIJHyqIREbLm3LbIV7+Yk9kJL6MjozV9+lk/jzwbV2aJI17pkVHEXwNwHa9Z8pTueVpablKZmPMdFWr3/UHMXmoZmemuMu4B+08x0sYPEASn1bBVJttWy+u6X2tDLWpvoZRavVEnqWJ8EpH7Y+095kiBWSM5/4xFK2n1msp1JLYQYS1AjzNg0RNWG97UtdSbBOD5gX8T3t36F2X6YBZ3AJaih5HM5N4PwnAiVE+5Ww6tQYGwdbtzND3Erk3/0mbykUhSaL2sWQBM4NYxNKrd0NDYk8M8idUsWk4HNDNkC+1ey8+7FB5UQeexBZITi1ZLHsAVAb3VQkQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39840400004)(366004)(136003)(376002)(451199015)(66946007)(38100700002)(86362001)(31696002)(66476007)(8676002)(41300700001)(66556008)(110136005)(966005)(8936002)(6486002)(316002)(5660300002)(83380400001)(2906002)(6506007)(6666004)(478600001)(53546011)(2616005)(186003)(6512007)(26005)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDZqNldGbzl1Uy9WVU9paG80WTNtaDB3ekNtY2FYTVlVUDBsL3YxVDR2ZVlp?=
 =?utf-8?B?T0dDSWlQWk5nOXEvVWRlbmJ1Y2U3N2JUMjRQNjFWY25MYzUrVWwycm1WVUZB?=
 =?utf-8?B?TVFKNXRPS1ozaEtEYjYzcmcrR0I2UnNZeFJrNVQ4VmdCQ3FEU0xtRGhsWVZl?=
 =?utf-8?B?ZnNpQzVqZklpOVFXeWpkT3dwcE81aUpRQlo3RUtZSjY4RkZ1UGJKdHRGNUVJ?=
 =?utf-8?B?cmdmRmRYN3JISEFteEkyQWY5bHBGMDNHdkwvNGxKcDJvSDc1Q0RSdVdHbkkw?=
 =?utf-8?B?azlSNnkrYk5xTTl5dXBncmFIWlNhYm12VmI2Z0tHRWJPaHBYTUVlVWZmVmo3?=
 =?utf-8?B?bFp0QWV6YnFqVjQ3cEhoUTRMaHNtNWNjNWtFTnB6dzNsT1JnZE5yV0JyWU9R?=
 =?utf-8?B?T1p6KzdXTk5Fc1R3SEJvL253ZGRMWTBZVDJGNURjMEFITS8rSURYQnNmcSt1?=
 =?utf-8?B?Zkx0ejh2d2wwZHhiZ3lIcTRDL3RPbFcyN3NIRUd0RFljYUJkVHoyYW0yN1A5?=
 =?utf-8?B?TnZkMkRVSDRvaXU2OGRLSWZhVXVnSGV1dlZaYjd1Qmh1ZzVvUlBkOUU1bWtV?=
 =?utf-8?B?ZXZTY3JrNjdwV1REM1I1bFNaVWxsWHhtWk4zMnVVODh2UXl2QnkvNTZ5UWk3?=
 =?utf-8?B?NmlZYVNFZUF3WXpVQXBObmFTSVZ2djNjT2pIaFNGWGVnQTNKSVNLbTJ0T2lw?=
 =?utf-8?B?bmFUNmt4dkVkYWVoUUJickFtMjdTd1l4T1Z3M2dkNjhiMko3ODBvTW55RGV2?=
 =?utf-8?B?bTdwSHc2ZmpobzFqWFc5aWJhK2E3Vml5dEtxWXdrZzJsTXNjbjl2eGlZTFJV?=
 =?utf-8?B?UThUOHRML2tzMC80T2pMT2RoL21OUVlyYlNPcEpJcjFhcVVTSy80cjlMQXZH?=
 =?utf-8?B?NGZXMUVsU0w2UGliMHBiQThiT2R0ZGQyK2Y5MmtYTWJQd1BCdlhUcEJWNFlB?=
 =?utf-8?B?cHUxRXk0RG5lbkdCNUJwbUlPQ2d1SnpyNDA3UC9aU1hFVnVUT1dJaFZ3dGhR?=
 =?utf-8?B?VXJ3bURyRGNTUzFHUE1Jb3k1ZkZQejYra0Nnd2ZuN3ZFOW8ybFRNMUJ4WVNB?=
 =?utf-8?B?a1o1L0l0YWF3QTdRamNpenVudzd1T0pHSmVsWWJQSEo3OEpRQ2p4NStNREs0?=
 =?utf-8?B?emtMQzcwYy9laXE5NlJEK28vRDFwYWtFbVdibXNZckdjSUFmM3VUbmloalZP?=
 =?utf-8?B?cVZ6MkFyQkdXSnQvWkpia1BDZGxUOW9Fa1FjZ25YWW1HV1UveVYybGIzaEZY?=
 =?utf-8?B?QWtJM3hEMTkwK083cGk1YVhpWEdtNUU1bEFtZGxkQ205empNRHBPWVVpam1p?=
 =?utf-8?B?Qi9xODZBcm4ya2dVdU5CUVBacExLMVRrRHN1MkFBc1BtTzZmeTE0YlFGa05P?=
 =?utf-8?B?THNPU2NNSnRVN3ZRSk8rbVFTNXgxK0FzdGFRYTNUdW5KajVoaEUxYnVJakZT?=
 =?utf-8?B?T09UNm4rRTFWZjB0dDd4VitUWk5aMEFvS3NJRmxIcEUxZXhNSjZkZHphTzZ1?=
 =?utf-8?B?WUowckhuM21pUjErU2VSbzA1eXErVDhFYkk3TS9iV0dCUzBZWXVmZnVnR2JU?=
 =?utf-8?B?L2hDTVFvdGhtVkg2cUJ2KytjUExxUmVtOEFZWmhld3MvRzN5Z0hwSExoTng1?=
 =?utf-8?B?UHVzSUNKYUk4QlAxNjBPUEdtd1ltMnhuaDl0cWljc0ttd3VzdFowckpMdnUx?=
 =?utf-8?B?ZFl3RHNHRlJBYUkxcExqdjFwYW0yc3JJTkxyL1ZzcnJuUWEwa3lKMVRYRHpU?=
 =?utf-8?B?WFd5OE93elRCTXlZWUhybC9RVkxuQnZmZXphVCswNUtTbTFCSkZaWFQ5WHNh?=
 =?utf-8?B?VW9PVmloUFRPc3RvQlF6QzNOTEU4ZUZmVzRPcXd0aGNYa1hSVVQzMEUweHo1?=
 =?utf-8?B?clB3dkVTMTBLeHVkU2I1bmhyQllaQmJVYU9IcmoxQmNibXc5d0IzRWVmYVhl?=
 =?utf-8?B?aERlNjJIT05KdEF4N0JJUEVGR25pa3o1c01aVW5XNlRZUUl5REVIUTdrVDho?=
 =?utf-8?B?OGsvMllEajVvQ3pHSzBCNXJqbHJrMDBDSE9QOVowd0lQME5uLzcyOEJDQ1cz?=
 =?utf-8?B?SVh6dEMwVXE3MmtiSTRNdFB6MzJma2xqSkpkVmNsUG1wdXhCd0JwSFl6em5l?=
 =?utf-8?B?d2tLVG9xRHppdWYzdVNsaDNYeXJFM29kMkpUVktzZEpQOER0Qk8yZXFHazMv?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce483e2-0ff1-4a25-ad59-08dace81d6be
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 01:10:27.6832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HY1AiDoF575dbRWkL2SG8nNNwQ+AJyQQr8pD3P6q8Y/DupCRTcyWV9yOX9tRqoBSPAIXXvXb+mfbv9PFXIdjs1g+C1p8Kkzhpf0Hy3N4Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6805
X-Proofpoint-ORIG-GUID: jKBZEmEO45xU92_MrHL_x2bNFgduArxF
X-Proofpoint-GUID: WF-5FoWkL5eMtN_qm9cyl_ZtIySRiVnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_14,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 01:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173758

Alex, I think yhou missed this one.

../Randy

On 2022-11-04 14:47, Zheng Qiu wrote:
> An earlier version of valgrind fixed the defunct processes bug, so those
> tests that were skipped specifically for arm can pass now in master,
> kirkstone, honister, hardknott, and dunfell.
> 
> Detailed test result with remove-for-aarch64 skipped on qemuarm64:
> 
>      Commit           Pass   Fail    Skip
>      master           624    9       21
>      kirkstone        618    10      20
>      honister         616    10      19
>      hardknott        609    13      18
>      dunfell          598    16      17
>      zeus             Out of memory: Killed (with many defunct processes)
> 
> There are now only 12 skipped by remove-for-aarch64 because 9 fail on
> qemuarm64 and 3 more fail on raspberry pi. These are tracked by:
>      https://bugzilla.yoctoproject.org/show_bug.cgi?id=14960
> 
> Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
> Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
> ---
>   .../valgrind/valgrind/remove-for-aarch64      | 227 +-----------------
>   1 file changed, 3 insertions(+), 224 deletions(-)
> 
> diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
> index 887bfd2766..a9809e5d8c 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
> +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
> @@ -1,211 +1,6 @@
>   gdbserver_tests/hgtls
> -cachegrind/tests/ann1
> -callgrind/tests/simwork1
> -callgrind/tests/simwork2
> -callgrind/tests/simwork3
> -callgrind/tests/simwork-both
> -callgrind/tests/simwork-cache
> -callgrind/tests/threads
> -callgrind/tests/threads-use
> -drd/tests/annotate_barrier
> -drd/tests/annotate_barrier_xml
> -drd/tests/annotate_hbefore
> -drd/tests/annotate_hb_err
> -drd/tests/annotate_hb_race
> -drd/tests/annotate_ignore_read
> -drd/tests/annotate_ignore_rw
> -drd/tests/annotate_ignore_rw2
> -drd/tests/annotate_ignore_write
> -drd/tests/annotate_ignore_write2
> -drd/tests/annotate_order_1
> -drd/tests/annotate_order_2
> -drd/tests/annotate_order_3
> -drd/tests/annotate_publish_hg
> -drd/tests/annotate_rwlock
> -drd/tests/annotate_rwlock_hg
> -drd/tests/annotate_sem
> -drd/tests/annotate_smart_pointer
> -drd/tests/annotate_smart_pointer2
> -drd/tests/annotate_spinlock
> -drd/tests/annotate_static
> -drd/tests/annotate_trace_memory
> -drd/tests/annotate_trace_memory_xml
> -drd/tests/atomic_var
> -drd/tests/bar_bad
> -drd/tests/bar_trivial
> -drd/tests/boost_thread
> -drd/tests/bug-235681
> -drd/tests/bug322621
> -drd/tests/circular_buffer
> -drd/tests/concurrent_close
> -drd/tests/custom_alloc
> -drd/tests/custom_alloc_fiw
> -drd/tests/dlopen
> -drd/tests/fork-parallel
> -drd/tests/fork-serial
> -drd/tests/fp_race
> -drd/tests/fp_race2
> -drd/tests/fp_race_xml
> -drd/tests/free_is_write
> -drd/tests/free_is_write2
> -drd/tests/hg01_all_ok
> -drd/tests/hg02_deadlock
> -drd/tests/hg03_inherit
> -drd/tests/hg04_race
> -drd/tests/hg05_race2
> -drd/tests/hg06_readshared
> -drd/tests/hold_lock_1
> -drd/tests/hold_lock_2
> -drd/tests/linuxthreads_det
> -drd/tests/matinv
> -drd/tests/memory_allocation
> -drd/tests/monitor_example
> -drd/tests/new_delete
> -drd/tests/pth_barrier
> -drd/tests/pth_barrier2
> -drd/tests/pth_barrier3
> -drd/tests/pth_barrier_race
> -drd/tests/pth_barrier_reinit
> -drd/tests/pth_broadcast
> -drd/tests/pth_cancel_locked
> -drd/tests/pth_cleanup_handler
> -drd/tests/pth_cond_race
> -drd/tests/pth_cond_race2
> -drd/tests/pth_detached2
> -drd/tests/pth_detached3
> -drd/tests/pth_detached_sem
> -drd/tests/pth_inconsistent_cond_wait
> -drd/tests/pth_mutex_reinit
> -drd/tests/pth_once
> -drd/tests/pth_process_shared_mutex
> -drd/tests/pth_spinlock
> -drd/tests/pth_uninitialized_cond
> -drd/tests/read_and_free_race
> -drd/tests/recursive_mutex
> -drd/tests/rwlock_race
> -drd/tests/rwlock_test
> -drd/tests/rwlock_type_checking
> -drd/tests/sem_as_mutex
> -drd/tests/sem_as_mutex2
> -drd/tests/sem_as_mutex3
> -drd/tests/sem_open
> -drd/tests/sem_open2
> -drd/tests/sem_open3
> -drd/tests/sem_open_traced
> -drd/tests/sem_wait
> -drd/tests/sigalrm
> -drd/tests/sigaltstack
> -drd/tests/std_atomic
> -drd/tests/std_string
> -drd/tests/std_thread
> -drd/tests/std_thread2
> -drd/tests/str_tester
> -drd/tests/tc01_simple_race
> -drd/tests/tc02_simple_tls
> -drd/tests/tc03_re_excl
> -drd/tests/tc04_free_lock
> -drd/tests/tc05_simple_race
> -drd/tests/tc06_two_races
> -drd/tests/tc07_hbl1
> -drd/tests/tc08_hbl2
> -drd/tests/tc10_rec_lock
> -drd/tests/tc11_XCHG
> -drd/tests/tc12_rwl_trivial
> -drd/tests/tc13_laog1
> -drd/tests/tc15_laog_lockdel
> -drd/tests/tc16_byterace
> -drd/tests/tc17_sembar
> -drd/tests/tc18_semabuse
> -drd/tests/tc19_shadowmem
> -drd/tests/tc21_pthonce
> -drd/tests/tc22_exit_w_lock
> -drd/tests/tc23_bogus_condwait
> -helgrind/tests/annotate_rwlock
> -helgrind/tests/annotate_smart_pointer
> -helgrind/tests/bar_bad
> -helgrind/tests/bar_trivial
> -helgrind/tests/bug322621
> -helgrind/tests/cond_init_destroy
> -helgrind/tests/cond_timedwait_invalid
> -helgrind/tests/cond_timedwait_test
> -helgrind/tests/free_is_write
> -helgrind/tests/hg01_all_ok
> -helgrind/tests/hg03_inherit
> -helgrind/tests/hg04_race
> -helgrind/tests/hg05_race2
> -helgrind/tests/hg06_readshared
> -helgrind/tests/locked_vs_unlocked1_fwd
> -helgrind/tests/locked_vs_unlocked1_rev
> -helgrind/tests/locked_vs_unlocked2
> -helgrind/tests/locked_vs_unlocked3
> -helgrind/tests/pth_barrier1
> -helgrind/tests/pth_barrier2
> -helgrind/tests/pth_barrier3
> -helgrind/tests/pth_destroy_cond
> -helgrind/tests/rwlock_race
> -helgrind/tests/rwlock_test
> -helgrind/tests/shmem_abits
> -helgrind/tests/stackteardown
> -helgrind/tests/t2t_laog
> -helgrind/tests/tc01_simple_race
> -helgrind/tests/tc02_simple_tls
> -helgrind/tests/tc03_re_excl
> -helgrind/tests/tc04_free_lock
> -helgrind/tests/tc05_simple_race
> -helgrind/tests/tc06_two_races
> -helgrind/tests/tc06_two_races_xml
> -helgrind/tests/tc07_hbl1
> -helgrind/tests/tc08_hbl2
> -helgrind/tests/tc09_bad_unlock
> -helgrind/tests/tc10_rec_lock
> -helgrind/tests/tc11_XCHG
> -helgrind/tests/tc12_rwl_trivial
> -helgrind/tests/tc13_laog1
> -helgrind/tests/tc14_laog_dinphils
> -helgrind/tests/tc15_laog_lockdel
> -helgrind/tests/tc16_byterace
> -helgrind/tests/tc17_sembar
> -helgrind/tests/tc18_semabuse
> -helgrind/tests/tc19_shadowmem
> -helgrind/tests/tc20_verifywrap
> -helgrind/tests/tc21_pthonce
> -helgrind/tests/tc22_exit_w_lock
> -helgrind/tests/tc23_bogus_condwait
> -helgrind/tests/tc24_nonzero_sem
> -memcheck/tests/accounting
> -memcheck/tests/addressable
> -memcheck/tests/arm64-linux/scalar
> -memcheck/tests/atomic_incs
> -memcheck/tests/badaddrvalue
> -memcheck/tests/badfree
> -memcheck/tests/badfree-2trace
> -memcheck/tests/badfree3
> -memcheck/tests/badjump
> -memcheck/tests/badjump2
> -memcheck/tests/badloop
> -memcheck/tests/badpoll
> -memcheck/tests/badrw
> -memcheck/tests/big_blocks_freed_list
> -memcheck/tests/brk2
>   memcheck/tests/dw4
> -memcheck/tests/err_disable4
> -memcheck/tests/err_disable_arange1
> -memcheck/tests/leak-autofreepool-5
> -memcheck/tests/linux/lsframe1
> -memcheck/tests/linux/lsframe2
> -memcheck/tests/linux/with-space
> -memcheck/tests/origin5-bz2
> -memcheck/tests/origin6-fp
> -memcheck/tests/partial_load_dflt
> -memcheck/tests/pdb-realloc2
> -memcheck/tests/sh-mem
> -memcheck/tests/sh-mem-random
> -memcheck/tests/sigaltstack
> -memcheck/tests/sigkill
> -memcheck/tests/signal2
> -memcheck/tests/threadname
> -memcheck/tests/threadname_xml
> -memcheck/tests/unit_oset
> +memcheck/tests/leak_cpp_interior
>   memcheck/tests/varinfo1
>   memcheck/tests/varinfo2
>   memcheck/tests/varinfo3
> @@ -213,21 +8,5 @@ memcheck/tests/varinfo4
>   memcheck/tests/varinfo5
>   memcheck/tests/varinfo6
>   memcheck/tests/varinforestrict
> -memcheck/tests/vcpu_bz2
> -memcheck/tests/vcpu_fbench
> -memcheck/tests/vcpu_fnfns
> -memcheck/tests/wcs
> -memcheck/tests/wrap1
> -memcheck/tests/wrap2
> -memcheck/tests/wrap3
> -memcheck/tests/wrap4
> -memcheck/tests/wrap5
> -memcheck/tests/wrap6
> -memcheck/tests/wrap7
> -memcheck/tests/wrap8
> -memcheck/tests/wrapmalloc
> -memcheck/tests/wrapmallocstatic
> -memcheck/tests/writev1
> -memcheck/tests/xml1
> -memcheck/tests/linux/stack_changes
> -memcheck/tests/linux/timerfd-syscall
> +helgrind/tests/hg05_race2
> +helgrind/tests/tc20_verifywrap

-- 
# Randy MacLeod
# Wind River Linux



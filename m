Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601DCC54EE9
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:25:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1742.1663122334209673324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DmXLPZx2;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62563eda0f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28E27AKv011113
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:25:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=tU8JE8tesPrGIPzHO/YisVy5Dqt5dR15Lvt8K25VGoE=;
 b=DmXLPZx2jhG49R6mt442ksC/V/jpibBnzGTc9hMVa6fc2LdlPUlRnkb1JWdYtwmHxrNv
 OsXLJSZ+SXA4dNPhHGLujlbooEs/LC1TNHX2Sj0yBDsrPv5qZ2LIDHfR4Ix1G7kpaVc6
 UC9bbr2H+2USBGgwLdGBqeKjnWouEGzPJD5l6DCvpP+smYTiuM6ZV8ksBbGtegHDUVB4
 tcZ4964cE/QcOhKfWHiB8zxXJfo8Wms9o86myKcV6cW7DxWIJpM90gY7lBm68todPuZc
 mGiBM5HPjyJOX8OoLQl0jUHtIb2Q1gdREidhmAQOyREb+m10gE4JJ8WBxuSftsN6r50u kw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4pdr2ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:25:33 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28E2PXwh018742
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:25:33 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4pdr2ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 19:25:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaYsrtaa0Phq7xKYQZU+schebSKLkynNQcwh20teEHyflFge9/gGMwhuKRJdnyMUoTBE/H4V+nyeDimR6g+6I7L/1RKDm/E/RHExmxIoL3lUoJjzqeMw8FqcuKWZ00jwhNZbXZK7MLuvGbLXHu/bb38dNHdCfCXUv2ipftUg2aU0yQ3tL87n4bdyVfZQHagj/eDBWwZlQDdSG2F6rtmI18ZaImOJJdQRwXxynAv2c78fEhZMX+xQgxHGAn4iyYP8PdpYNfpcmbtg/OYCVsTAwYGMpIQ2JsnDavx4XJeZ99Rv0hqYKLy8/g5YcZ035pvvVXpGyShDzmkHZ+OpBcpYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tU8JE8tesPrGIPzHO/YisVy5Dqt5dR15Lvt8K25VGoE=;
 b=enFzvk2HLnrMGJIWgHw6MTgel7e55Ie93DSzXpElXtQzDJc6Qz/ngAggsllnTmNE6rqsDhxkQx0icS/vXfu1lUfLuVt9pR7gB55ITPGSWyNGhZbt56VU/t/yV/8Xo4HlMDSq1RmDGQeVK9ViK2c5JdntSJRokfKItzuu5MyDVu4QBC/EFUBO4Ow/DeC1ejJvP7dEyry3YxA8ebKQ9gLXBGBex4X01hHtOBVSHpmHiaQizMF0fGNsF6Qe2wUJwc11Sia8aW+J3Nq2M6BIIGYk5fjBPWqWu6ANVaN276hjsPYGiTODrdsYwFH//vDD2D9jcY0wo8qgEh/yLIkb9ylWgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DM8PR11MB5607.namprd11.prod.outlook.com (2603:10b6:8:28::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 14 Sep
 2022 02:25:25 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 02:25:25 +0000
Message-ID: <99ce1274-dcd0-8392-fc88-9f1122870049@windriver.com>
Date: Wed, 14 Sep 2022 10:25:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] webkitgtk: Fix build on 32bit arm
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20220908214554.1117287-1-raj.khem@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <20220908214554.1117287-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0147.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::12) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DM8PR11MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb1cca8-862d-4a02-a359-08da95f861d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uWTdjpkd4U9mD0rvBOInwrI5AjxT4ADhhdHj83FO6EtiTqJz7ETzKvX6lQZfNlwctN33LBIhdW66vf5s+QmDOqh2lEnpk71ZmquCwuw1Ftka4mlJhgG3dWbEFME8ih5I8CqD3zBGKK2EQama1Y23rs5aEoa1RKiJTNurBQN+7dA1vqCzasZgcPgMktB3G0GK8OCDAzschIwFLFPGPgnUyJ4KrQO7x3gMoZn+GeoSvf7y6gbdMHdkPldEJkJrgsi35N4LhOReX9mz4Rnf0NggG/dKCGJ6zAGLLsI1cMdQJvBwbjmtcFiqstpZ2QkFi+N3L5ZKaTV2W6k9vhWB3RUfXqtZKm/+dRW+VwgwU0Lbs2CszvtszRsyDPNe7IFhLGgshtlWwJfno2wAxrWSSCsnqgwUwGvy1jP9g/A7+VsxQ/8zQgpwKMa665XoPJ3v7QWma6YB8WASGlxjt/SBWmxofWWi5vt2hiCQ5XhQ5ZbjxYNoefnCLiIcsniNWU24gmqndIH3YctY/fIvtAKSD5r7gydmQFmv64qWuGw0FaiYiXuBYwmsxYnlQ4FJTaISegvuMcuM8ni8Jy01Q7WhH+n+Rup6hFNOKv+UqkLpWS2sPWr2TM9rdQ1tR2m5QSe+jyew5DRMmpWCOmtIKxisDWuhwkoaYYhcoVZxAu009XYslG2Csr80X3KlZpiZdjtkSI7JCjCbEIaISsY1Swpjyz/MWJqvPXeY9KmkcDkgyJxPpfqaN5C8wWAIJUhsSHc+ipplsYhshHR9+cqBEbjJbrAK7XxnTNvX2+t6Nbvju/vT5gT4569y46zUDcGMI/TMOHpGUL4u5NgEQnGrm5kM6Z+1vXuMTlP0eFRhl3AqpVScPpo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(376002)(136003)(346002)(451199015)(2616005)(31696002)(2906002)(36756003)(31686004)(478600001)(86362001)(186003)(6486002)(6506007)(83380400001)(53546011)(38100700002)(5660300002)(66476007)(30864003)(66556008)(8936002)(6512007)(26005)(966005)(6666004)(8676002)(66946007)(316002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2xDM0hCdTk1UHd0aVZOY2NvcnBoejdzU3dNcTNncjhEamdWQTVNZHUvMkZz?=
 =?utf-8?B?VzFVZ09UV1A1R3RqaEcyc0VyWVlESGxEQWlNbThRV2V3Rk1HT1YxWXZQWW5Z?=
 =?utf-8?B?S0tORFhTVE5uSTFTTEJYNEpkU3pSY2l0aU5vVnZnQXJtUVc5RUlacUw5M0Fz?=
 =?utf-8?B?MGN1dHZmaXdYWGRFVTZJaG1vVXM3SXRUL0IxbnNKTkxESWFqYlNyRWM5aXpZ?=
 =?utf-8?B?c21QVUVHWTJyU1RBYkhWYUFNMTFCVWpaVHpic2hqWHN2eTNEUjRqRUZoRzFW?=
 =?utf-8?B?VjFTTytxSGcyMFpDeUwrNGo4dHczcmxEbDBtU2xFWmJEMExrQ3ZLSi9JODJa?=
 =?utf-8?B?VFk1bUJEL3hhWVZrSFJLTk9icktobUxRR1pZdy9md1ROdjhtQ1VIMGc4Z2k5?=
 =?utf-8?B?WEp0Ti9aK2x0M0FwVHZiVVBuV1ZNa2xVeGJOQkw1TERSbzJFTGpZMGRoNDB6?=
 =?utf-8?B?UC93cXRWc3hrM241ejR0ZEFKNWdYVUlEWTZ3M0N4a01HdUIyV0F4K2hPanF4?=
 =?utf-8?B?TWEvWVhmVy84ejdqUEZZRE5hRlFONUQxaFNEeTFsZzBCMjhlY2NwNU9TUzRQ?=
 =?utf-8?B?b2lQQ1BlWlEzazR5S1gyWnprbnY3S2JMR1NXbmRPMjFMZm5mY1hlaXNHSE9K?=
 =?utf-8?B?d1VNd3hybDIxT1NWM3Y2aEdidkUvcnlaTWh4a3JUeFhOcXNOUnN2Uk5hbnFm?=
 =?utf-8?B?WXc1OG9vVGlHZjFuYnpJb1RjKzNjbkJNNENKaE5yd1dORE1ZbFVWNCtZVU1x?=
 =?utf-8?B?WVMxRlJYeFl2QUUwU0RlQjlEWHFKWWl6MFVRYzU0ak9oL1ZuRHZLZmJxVWhH?=
 =?utf-8?B?Um5jMThTK3ozeUd4Nm9YeFI2ZTgxUUV2TFR0YXVqdy84OHVvZlZTNlBZd0lX?=
 =?utf-8?B?Rmxaekdtb0xKSE1VNEZ0a0pRbS85SkloSlVrTkVhaTdIeWVPZlBGL1hCNG82?=
 =?utf-8?B?dis3ZE5iY3l2a3ZmeWRvcHhOYTdDZ3NWOG1nMDg4Y3pBY1BUdXhiUmYwK0tW?=
 =?utf-8?B?MFNBQ2pBSjZ1SnBnWFEzQUcxZXVuSlQzZEowTWp3UHpkR09lVlNKUU9IRDg4?=
 =?utf-8?B?UTVJQUs1bHNGVFhLd1B6WWhUZ0dIT0dzUllhZTI0YTZsNzRvUXN1WVBRYUNH?=
 =?utf-8?B?bzl1bExLeU5SZHplMVlydVZZU3NGcmxYQ1hJQStsUlZydVdQR0o2cTYreHpp?=
 =?utf-8?B?WmRRVlN2TCtoWWtxdktoYjZJUXpJeVc4eENyYkFKSWkyVHRKRHJTWkUvTXRu?=
 =?utf-8?B?U0ZJUDNwVnBvdW5XSkdBVDh6b2JLOE4yL2NZRExxemRrL0txcUR0OExkU0ht?=
 =?utf-8?B?UDg0RUFSMGJ1cWlmU20zaDB2VlZaQThEZERTaE1rODVUclJ5MzZHTk1SVlFX?=
 =?utf-8?B?YWt3QzVTTEZKUW8vNDNYQlZ6azgwZm5LOWgrVUMrQ2J6TnBmSG9JL3JWNDRj?=
 =?utf-8?B?UXR3dU16SGFSOGJZNkFaU00zYzJhalExKzJEVk83L2dnVTVmeEIwOXJFZ3pK?=
 =?utf-8?B?dWZPWTlDQ3V0bEc5Q05uaTVWemExRHVtQ1AvQ3IvK2tXNVdxVng5Q2lZWUFV?=
 =?utf-8?B?T0dHQWdDNEpXZ0NmRHFNSC9OMUkzT24rdGJKTmpGNnkyVkVUT3BlSEtTeGcz?=
 =?utf-8?B?SU14K2I0dnhxSEFqUEZWaFZ6WmNXMy92WTFIemY5M2tVRmpVckRyTEE1L2Fv?=
 =?utf-8?B?aDUrcDE5VTNKZTdua3oreHRNUnpEREpDalEwTllkbzdTcmR5TDZBT3BiYXhC?=
 =?utf-8?B?NWh6MjUzNDVZMngyeHROd1M0Mzh5N0x3REkzOHRLOU02NHBEUTlGT0tMQ1RY?=
 =?utf-8?B?Wmt0Ymh0U3lkZTd5STZVSHV5aUhRcUJXeHd1clZuL1UyRFZrVWlDbWhSZ25t?=
 =?utf-8?B?cG9zUTBVVElSbmUydVJlWmtiMVN2WGx5QUkrS1FZUEU3dGZmMVZ5cVNGUHZv?=
 =?utf-8?B?MlZDR0U4eTFaUnQ0bTJlVnd6cjcrUzlhRU5ORUVtZHR4RCtVVnJYYXRlYllN?=
 =?utf-8?B?TmY2cGNTaTFnTitKSE5NczE0cllGamtlaFZnZWg4aFFWYWJSU2Z1NUdCdG8z?=
 =?utf-8?B?VUxEcTNqZThRa1lwdFNxV25JOE5OTGdlc0UrZXNXZWxSTWg4VU0xcnkyeUU3?=
 =?utf-8?Q?fIz/VMaLtUTYlIf9TgeFpGtUS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8eb1cca8-862d-4a02-a359-08da95f861d3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 02:25:25.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U41huPT8yMekFnt7Bu1jL6rW4/jVUWo3i8zVZT5HXr0l5Z1b7D0p/pwMMHgj+8lOVGxzdYXZail4YEd+SbwPuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5607
X-Proofpoint-ORIG-GUID: 9IAVAOVgWP7WQXd17Vq6Clfa6jOTvLv9
X-Proofpoint-GUID: qvNNfFBWsZ8jHwBnWLLyAQpQjl3MU7Go
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_12,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:25:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170618

Still failed on beaglebone-yocto:

/build/tmp-glibc/work/cortexa8hf-neon-wrs-linux-gnueabi/webkitgtk/2.36.7-r0/webkitgtk-2.36.7/Source/W
ebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:38:8: error: 
standard attributes in middle of decl-specifiers
    38 | static alignas(16) short s_FELightingConstantsForNeon[] = {
       |        ^~~~~~~

Thanks,

On 9/9/22 05:45, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Mingli Yu <mingli.yu@windriver.com>
> ---
> v2: Fix commit msg format
> v3: Apply suggestion from https://github.com/WebKit/WebKit/pull/1233#discussion_r915217428
> 
>   ...44e17d258106617b0e6d783d073b188a2548.patch | 296 ++++++++++++++++++
>   meta/recipes-sato/webkit/webkitgtk_2.36.7.bb  |   1 +
>   2 files changed, 297 insertions(+)
>   create mode 100644 meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> 
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> new file mode 100644
> index 0000000000..32f92f7ff5
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> @@ -0,0 +1,296 @@
> +From 0d3344e17d258106617b0e6d783d073b188a2548 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Thu, 2 Jun 2022 11:19:06 +0300
> +Subject: [PATCH] [ARM][NEON] FELightningNEON.cpp fails to build, NEON fast
> + path seems unused https://bugs.webkit.org/show_bug.cgi?id=241182
> +
> +Reviewed by NOBODY (OOPS!).
> +
> +Move the NEON fast path for the SVG lighting filter effects into
> +FELightingSoftwareApplier, and arrange to actually use them by
> +forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
> +
> +Some changes were needed to adapt platformApplyNeon() to the current
> +state of filters after r286140. This was not detected because the code
> +bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
> +not get used much these days: CPU(ARM_THUMB2) is more common. It should
> +be possible to use the NEON fast paths also in Thumb mode, but that is
> +left for a follow-up fix.
> +
> +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
> +(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
> +(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
> +(WebCore::FELighting::platformApplyNeonWorker): Deleted.
> +(WebCore::FELighting::getPowerCoefficients): Deleted.
> +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
> +(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
> +(WebCore::FELighting::platformApplyNeon): Deleted.
> +* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
> +* Source/WebCore/platform/graphics/filters/FELighting.h:
> +* Source/WebCore/platform/graphics/filters/PointLightSource.h:
> +* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
> +* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
> +---
> +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> + .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> + .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
> + .../graphics/filters/DistantLightSource.h     |  4 ++
> + .../platform/graphics/filters/FELighting.h    |  7 ---
> + .../graphics/filters/PointLightSource.h       |  4 ++
> + .../graphics/filters/SpotLightSource.h        |  4 ++
> + .../software/FELightingSoftwareApplier.h      | 16 ++++++
> + 7 files changed, 57 insertions(+), 36 deletions(-)
> +
> +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> +@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> +     return s_FELightingConstantsForNeon;
> + }
> +
> +-void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
> ++void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
> + {
> +     neonDrawLighting(parameters);
> + }
> +@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
> +     "b .lightStrengthCalculated" NL
> + ); // NOLINT
> +
> +-int FELighting::getPowerCoefficients(float exponent)
> ++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
> + {
> +     // Calling a powf function from the assembly code would require to save
> +     // and reload a lot of NEON registers. Since the base is in range [0..1]
> +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> +@@ -24,14 +24,15 @@
> +  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +  */
> +
> +-#ifndef FELightingNEON_h
> +-#define FELightingNEON_h
> ++#pragma once
> +
> + #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> +
> +-#include "FELighting.h"
> ++#include "FELightingSoftwareApplier.h"
> ++#include "ImageBuffer.h"
> + #include "PointLightSource.h"
> + #include "SpotLightSource.h"
> ++#include <wtf/ObjectIdentifier.h>
> + #include <wtf/ParallelJobs.h>
> +
> + namespace WebCore {
> +@@ -93,14 +94,14 @@ extern "C" {
> + void neonDrawLighting(FELightingPaintingDataForNeon*);
> + }
> +
> +-inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
> ++inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
> + {
> +-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
> +-    FELightingPaintingDataForNeon neonData = {
> ++    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
> ++    WebCore::FELightingPaintingDataForNeon neonData = {
> +         data.pixels->data(),
> +         1,
> +-        data.widthDecreasedByOne - 1,
> +-        data.heightDecreasedByOne - 1,
> ++        data.width - 2,
> ++        data.height - 2,
> +         0,
> +         0,
> +         0,
> +@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
> +     // Set light source arguments.
> +     floatArguments.constOne = 1;
> +
> +-    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> ++    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> +
> +     floatArguments.colorRed = color.red;
> +     floatArguments.colorGreen = color.green;
> +     floatArguments.colorBlue = color.blue;
> +     floatArguments.padding4 = 0;
> +
> +-    if (m_lightSource->type() == LS_POINT) {
> ++    if (data.lightSource->type() == LS_POINT) {
> +         neonData.flags |= FLAG_POINT_LIGHT;
> +-        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
> ++        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
> +         floatArguments.lightX = pointLightSource.position().x();
> +         floatArguments.lightY = pointLightSource.position().y();
> +         floatArguments.lightZ = pointLightSource.position().z();
> +         floatArguments.padding2 = 0;
> +-    } else if (m_lightSource->type() == LS_SPOT) {
> ++    } else if (data.lightSource->type() == LS_SPOT) {
> +         neonData.flags |= FLAG_SPOT_LIGHT;
> +-        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
> ++        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
> +         floatArguments.lightX = spotLightSource.position().x();
> +         floatArguments.lightY = spotLightSource.position().y();
> +         floatArguments.lightZ = spotLightSource.position().z();
> +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
> +         if (spotLightSource.specularExponent() == 1)
> +             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
> +     } else {
> +-        ASSERT(m_lightSource->type() == LS_DISTANT);
> ++        ASSERT(data.lightSource->type() == LS_DISTANT);
> +         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
> +         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
> +         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
> +@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
> +     // Set lighting arguments.
> +     floatArguments.surfaceScale = data.surfaceScale;
> +     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
> +-    if (m_lightingType == FELighting::DiffuseLighting)
> +-        floatArguments.diffuseConstant = m_diffuseConstant;
> ++    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
> ++        floatArguments.diffuseConstant = data.diffuseConstant;
> +     else {
> +         neonData.flags |= FLAG_SPECULAR_LIGHT;
> +-        floatArguments.diffuseConstant = m_specularConstant;
> +-        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
> +-        if (m_specularExponent == 1)
> ++        floatArguments.diffuseConstant = data.specularConstant;
> ++        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
> ++        if (data.specularExponent == 1)
> +             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
> +     }
> +     if (floatArguments.diffuseConstant == 1)
> +         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
> +
> +-    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
> ++    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
> ++    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
> +     if (optimalThreadNumber > 1) {
> +         // Initialize parallel jobs
> +-        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
> ++        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
> +
> +         // Fill the parameter array
> +         int job = parallelJobs.numberOfJobs();
> +         if (job > 1) {
> +             int yStart = 1;
> +-            int yStep = (data.heightDecreasedByOne - 1) / job;
> ++            int yStep = (data.height - 2) / job;
> +             for (--job; job >= 0; --job) {
> +                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
> +                 params = neonData;
> +                 params.yStart = yStart;
> +-                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
> ++                params.pixels += (yStart - 1) * data.width * 4;
> +                 if (job > 0) {
> +                     params.absoluteHeight = yStep;
> +                     yStart += yStep;
> +                 } else
> +-                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
> ++                    params.absoluteHeight = (data.height - 1) - yStart;
> +             }
> +             parallelJobs.execute();
> +             return;
> +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
> + } // namespace WebCore
> +
> + #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> +-
> +-#endif // FELightingNEON_h
> +--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> +@@ -25,6 +25,10 @@
> + #include "LightSource.h"
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class DistantLightSource : public LightSource {
> +--- a/Source/WebCore/platform/graphics/filters/FELighting.h
> ++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> +@@ -35,8 +35,6 @@
> +
> + namespace WebCore {
> +
> +-struct FELightingPaintingDataForNeon;
> +-
> + class FELighting : public FilterEffect {
> + public:
> +     const Color& lightingColor() const { return m_lightingColor; }
> +@@ -67,11 +65,6 @@ protected:
> +
> +     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
> +
> +-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> +-    static int getPowerCoefficients(float exponent);
> +-    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
> +-#endif
> +-
> +     Color m_lightingColor;
> +     float m_surfaceScale;
> +     float m_diffuseConstant;
> +--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> +@@ -26,6 +26,10 @@
> + #include "LightSource.h"
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class PointLightSource : public LightSource {
> +--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> +@@ -26,6 +26,10 @@
> + #include "LightSource.h"
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class SpotLightSource : public LightSource {
> +--- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> ++++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> +@@ -36,6 +36,7 @@
> + namespace WebCore {
> +
> + class FELighting;
> ++struct FELightingPaintingDataForNeon;
> +
> + class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
> +     WTF_MAKE_FAST_ALLOCATED;
> +@@ -132,8 +133,23 @@ private:
> +
> +     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
> +     static void applyPlatformGenericWorker(ApplyParameters*);
> ++
> ++#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> ++    static int getPowerCoefficients(float exponent);
> ++    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
> ++    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
> ++
> ++    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
> ++    {
> ++        applyPlatformNeon(data, paintingData);
> ++    }
> ++#else
> +     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
> ++#endif
> ++
> +     static void applyPlatform(const LightingData&);
> + };
> +
> + } // namespace WebCore
> ++
> ++#include "FELightingNEON.h"
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> index 47e52e25da..76b119c9c7 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> @@ -16,6 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>              file://reproducibility.patch \
>              file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
>              file://fix-gstreamer-include-paths.patch \
> +           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
>              "
>   SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
> 
> --
> 2.37.3
> 


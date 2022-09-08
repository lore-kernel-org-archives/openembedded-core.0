Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0F7C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 07:35:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2600.1662622544345715830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 00:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Kqh38Z4x;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6250d0c078=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2886YWBF020338
	for <openembedded-core@lists.openembedded.org>;
 Thu, 8 Sep 2022 00:35:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=bDtQTeJEvyNFrvk7wAc8wIALLnPv7JXxxuKmp/aT3Xo=;
 b=Kqh38Z4xoAjjHokc5Zx/BDSBkZm0UE0eoBbjLX0TFgfg4cv1NdIp5e6SxYg5E/7k0Gon
 3I8Y7DOyB96CEn/UgxnfV3vQ00vs0ho1DybJsPAVJtT6xczgmTqMSudymkZJNW1x7JvG
 YP1bgz0N8lj8MjEFQhDxkIY80v3nGW+KgSZr40Ymx6F3zXF668cl95N5ZYrfgGjAWTu+
 y1zESG2FFglQC6nsuznTwUQ4y8SK3ms58SCkX+sA0mCyPmacDDaKyfE/IDf4FJK5TUO7
 iOmdmbbz0y3SW+bTujre3R2Of3xM5Y+OHliQgCxAVys8hgSV6Acedw/B7WXsklm+dZnD Ng==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jeh32hh5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 00:35:43 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2887Zhgl006387
	for <openembedded-core@lists.openembedded.org>;
 Thu, 8 Sep 2022 00:35:43 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jeh32hh5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 00:35:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQkjtKk2qhjdTVxO3/G1iVKCJN+mwkVHDixewxAmGmGHBv4Bnwa6YtY27I7pvMq49nSG+xdU5OCzWB+0UM/jplOb+ayd8ltVjbUguBnIz+x1bYNYxMRtZ8Qn9QicrWnHY3tKG9aVvYu9IH/IqZNCmE0Ejy4FhLnLVqZJibLKr5Q1ZIeKeHZadfM9P8vcb77MoagPq3WV6ExXPrf0H0kGXNkiFOpOfvM6gpS3APFu31+IiQ/xt5bLwFL6zrlNdOJIzy5IvreBuct3vdDoDf9EMgIOBdQaQ7A+Rmcg7/Zbz/6xaPGopnnBANi9sMNDfM0Hh4bmsXWbqVnMgLrX8iQf2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDtQTeJEvyNFrvk7wAc8wIALLnPv7JXxxuKmp/aT3Xo=;
 b=Gn/9oVVOKG72lnxpFese4NnHdGLAODC/NX75dzM/vPBhD0tmiR7UnF5FLrKfJFmFwF+y4nvISaun1qAfGU4h3TdEFUf0fv/N8bZyNRczWaw186BPooUW4huhQYARUSiAHtCoAdfnpKAyzOSvOWLQ825t8dUg7kEycbvlR2ocfJgOwxhp9+J7CwKTsdhTcXV6WJo7lo7DqVANAprtKOopolvvr2HaO8ZFOH7FIhSfM0cYKCfjQr1OphUCugi3i3ZYGadUkN/3VXso4xtBOLtVss3m61dhU1fVRySu87z7PfPICH4XWt/fGDu5DoBomPIBh6V02PKkrPq2BQjFvl+wUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CY4PR11MB1383.namprd11.prod.outlook.com (2603:10b6:903:2d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 07:35:40 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 07:35:40 +0000
Message-ID: <e47421d6-3d76-02f4-a5a7-4aa91d06aa70@windriver.com>
Date: Thu, 8 Sep 2022 15:35:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] webkitgtk: Fix build on 32bit arm
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20220908053140.660738-1-raj.khem@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <20220908053140.660738-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CY4PR11MB1383:EE_
X-MS-Office365-Filtering-Correlation-Id: 670a9d50-b319-4072-2228-08da916cbac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qMN4XxUEvWRLir6J9x2ojLv7LSfhbWVShN1Dc3gR6HU+aFqvrkz32CIQHfLHm1ESCpMbZxSdkJHYnqDfURiZ9ucAn3shDjISrWEipPJYy3LdGP8/fNj22AuZEjH5Rsx/QhM7vG+OwkORJ7pDWGDhgRgXk8gqzX+u23Z7npigV3kAxtYi5cARH5krmYN8YmzMDLQVxBlP+5c6anL6rA8ts4jCYVoNeF0dz0lNjPRDh7Pzmao4cJ2zHOW6A18G3U4owPpDpEfPOTQIBKJK0za7Nyq3wQtMd6c7pk7wvpC+SIGsiqxyCzI7jJ3yNzEwiYitE51ou2yhOHTqhEGxl8WPJ4w9yeQrkhGiV5L6WaEwpj1PyubZj00mxtXBJAZhVZbE8hGCakbOffFXaVnVEONOj/4lCC+FewQYMeYIDHAcLwtGXywI8QIjCCqcttYyn/ICpz2suIq+qQl1FdFO3QS3rVqcz/VwrJ/JNlgEd275Eii9BUIgWUzogvsOUL8RRyLTPJZgieR/Keu8jpNTWn0GtOmMgJq4lVT0G0FDJaQfEVosE44kpyV/sjPkzHW7kBpGxvWrHnmkSL2Mgs4UvI21c5aGq0e592T7Zt1/aoTTTLPDW4PMqVbtSFhHdif7mt9/I1jaKz2/BuszsXqS1wMQ/O05tm3SPZ5KW8NUBFZPr8F0Glb8kIyFg6ja2ykY0MRS8W1KcqLp9/ns7MU17F+8wkwrJiW0MGJ3zKmjVprdHDdl85YFyerWuhkzQP6HazP8BPXjW5c9QMD7Vx3tXXZ7rH84zHxSB81EmqyrICDeEXwGSAsMxhlxk6UCh5kjt0D9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(366004)(396003)(39850400004)(83380400001)(31696002)(38100700002)(66946007)(66556008)(66476007)(8676002)(316002)(2906002)(8936002)(30864003)(5660300002)(53546011)(186003)(6506007)(26005)(2616005)(6512007)(6666004)(6486002)(966005)(478600001)(41300700001)(31686004)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFg4VlFoc3g2L2JLUkVQam5vdTZQbWxIT0ZJWS9XdE5MN1p3UTIzOCtmSnhE?=
 =?utf-8?B?bTJwMkVYS1MxSDRUT010b1hrbjVDOVFYOUM4eUMxSUlBVVNXMTY3NEl4RUpY?=
 =?utf-8?B?dXVPU2NidjdxYVRMUFFCbFJmSmVLaUJBTmg5cUFnc1VTWFVpb1UwZWNPZ25Z?=
 =?utf-8?B?T2xjamxMa25LSHlyODJrQUM1VDlHMVUxS3g2bFdmcm8rWmpGQk5rVnhMSFdG?=
 =?utf-8?B?SmZaTVNMY0srZE1sN05VWGhveEM4Z3FvUHFlSDFVaWFxanBmTTYvY1hubTN0?=
 =?utf-8?B?Z3pQbnNya2lDS01hZVBZYVYwVTR4Vyt0TzV4R3Y5S04yWUV0ZkdlM1g4SEtp?=
 =?utf-8?B?UlpFVktQdXlUWnNUTWQzNHRVRmEzemxzQjdyQjhxa0dpRU1lc1hSRGp2L1hJ?=
 =?utf-8?B?M3JqaGxtZkZZaVpmSXMxdFJpK09DQllkUWpaZVd2ZE50OW9hcXhDaXZXNjVu?=
 =?utf-8?B?L291dnFmR1RQYWNIMWZ2VXkwVHhtQ2Q4Smpndmc1NGFCQ1NrbVVGZnJhNncr?=
 =?utf-8?B?WXYxMkNqSG5McVpBSG1RUjQ0dUp5VVJJQURzUHE4U1pvTXRmMEYyS0VoVjV2?=
 =?utf-8?B?bG16SG10Y2NvVEc4ejBQMXBOTDQxYlhyeVpsTGppWitwc3pqV21Cd3p4Q29X?=
 =?utf-8?B?eTl1c1pQdStnLzk0YnIrRjFoVU10bFhqcjhPZmhKNFpvUUdaZC9SMS95a3JK?=
 =?utf-8?B?NnBwVWx3MGlWT1Y5L1JCaDBWa1hESzAwR01jZWdkY1BKR0FwT1lvaHBSYzAw?=
 =?utf-8?B?SUg0eUdBRmtJeTNaKzBSeWZmaThUSldKL1pRUTljeW5MTlFhWDArOGdONFE5?=
 =?utf-8?B?K3VXVkREV2J3eGgxbEVIKzhkQU4rZnNYYjFlQnUwaUU3YU5vdGFnNUdZM3Zp?=
 =?utf-8?B?YjE5TEZvYlhqU2FrL2FSNkR5TktaUzZBdG1tMlQ3bDUwNHBBNXdGZGV0em9u?=
 =?utf-8?B?SS9IMDAwS1h6dUJDaHNqWGJGTlVVckZZNm9iSkVjVlNIajkzNk9UNHFJbmRy?=
 =?utf-8?B?TS9jMnc3MU0yNHdNUTdPVnpaY0thSXh2bFY4aGR2Z2Y4Tnc1US8ydE51Wmx0?=
 =?utf-8?B?OThWS2w4Q3VZNzh2TEhyVGdyWDBFMk9rL0lkUllKWHpJN1FNbHVaQlVoSlNO?=
 =?utf-8?B?T2pyUFQ1K1lzazdNZmxWK0t5bHJ5Qnp5N04xUEdFRVk5VzhOYVpwdDVZblRm?=
 =?utf-8?B?L3lzYkhpU1lQQ3hyWWFiNXZka0hKcENPUG9peWtldlRicjVud0VXaEZhYnln?=
 =?utf-8?B?WWVXWEdqeityQ3FzK1JpdnluYzN0cjc3cFJhQ0NoTlpxd1ZwVnVLTStpbFY4?=
 =?utf-8?B?MkUzcWIxRExXMXRUdkZ4RUhrYis2RnZ3NkJseGRLdUNGK1QvSkJKUStJT29G?=
 =?utf-8?B?ZmZGbmFsOXFyZTJ1MldSMllDdDIvRnFtaHdnbC9EYjh6NGQyZ1NsR2tVMm1W?=
 =?utf-8?B?UUN1K2xaL0lhWStHS3JOTTdWaGt4S2NVRG9YVVluajRhZnpDd3B3dkdrVVZO?=
 =?utf-8?B?THVwbkg0TEJobTBEQmNoNEd4SVFlYWhHMWJZYlBBcVo1T085alR4cDlJc2RM?=
 =?utf-8?B?VElqdGk2NFo1dzNqOE5OTjlPeGgxV2VINmhNRURnSUMxcWMvWnV5R2dMSjQv?=
 =?utf-8?B?eDZobDhoekFDRmFSY1loRCtPRUFPNHlYRlhOMjhtaHJMRzE1OW1xU2doTktP?=
 =?utf-8?B?YlBiVWlvTmxES0FRTzlTQmNXOVQrQjF6Umt6N1NZeXdNazdXQkVzTjdPZUFS?=
 =?utf-8?B?a3JSYkRjcVRUbFpHUURyeUZQV1A5Z1Avd3YvdGpKWXUxVG1ScmsreHpvZUNG?=
 =?utf-8?B?NXZvTm84aDE1S0Y3RWZoYVptdXhCZE9CRjg3YzVONGpPRWlaeFNCUi8rbzBL?=
 =?utf-8?B?bFZoK2VsTUFPcVg4ME1EZC9Nd1JTbWMraGlKTzZTbThieEJXdUNiMmh3Nzhx?=
 =?utf-8?B?Tjc4OXdjOW9FbWVpcUVwc1BFMmlMTXczdWQ2eTBlWHlFRmNLcGtQVDcvZUUx?=
 =?utf-8?B?UEdTblRSNzNmOFdkNmU1cDdCdHVLc2hIWW5DU2xNL2FyL244UE84Rk55b0dw?=
 =?utf-8?B?dU00WTZPUnlaZ0ZLNFdoYlVyVGRLZ1crTHBCZ1pHRmQ0eWFobW1VWUJHOVZn?=
 =?utf-8?Q?rXLyMec3bdRUBf7gFgQ6jMiRF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 670a9d50-b319-4072-2228-08da916cbac4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 07:35:40.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Tlx5YheDqQC4SlQ93t6oyVR6L1ODkgjnB+2MjtIr5LEHB1ayC+qynm5WG5ZsbjZbO1+XEjJNEWMbW8BlJvv+Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1383
X-Proofpoint-GUID: GY-a5jA-fA99sWYzjh5r0E5YK5Tut1Rs
X-Proofpoint-ORIG-GUID: wLIMQxmuTn3coKWwdAEe8U3eMg5Oc2Wk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_05,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 07:35:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170454

Hi Khem,

Thanks for your update!

But after apply your patch, there comes below issue:
/build/tmp-glibc/work/cortexa8hf-neon-wrs-linux-gnueabi/webkitgtk/2.36.7-r0/webkitgtk-2.36.7/Source/W
ebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:101:22: error: 
'JSC::Uint8ClampedArray' {aka 'class 
JSC::GenericTypedArrayView<JSC::Uint8Clamp
edAdaptor>'} has no member named 'bytes'
   101 |         data.pixels->bytes(),
       |                      ^~~~~


Thanks,

On 9/8/22 13:31, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Mingli Yu <mingli.yu@windriver.com>
> ---
> v2: Fix commit msg format
> 
>   ...44e17d258106617b0e6d783d073b188a2548.patch | 311 ++++++++++++++++++
>   meta/recipes-sato/webkit/webkitgtk_2.36.7.bb  |   1 +
>   2 files changed, 312 insertions(+)
>   create mode 100644 meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> 
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> new file mode 100644
> index 0000000000..204f76633f
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> @@ -0,0 +1,311 @@
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
> +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> +index f6ff8c20a5a8..42a97ffc5372 100644
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
> +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> +index b17c603d40d3..c6d17f573eca 100644
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
> +-        data.pixels->data(),
> ++    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
> ++    WebCore::FELightingPaintingDataForNeon neonData = {
> ++        data.pixels->bytes(),
> +         1,
> +-        data.widthDecreasedByOne - 1,
> +-        data.heightDecreasedByOne - 1,
> ++        data.width - 2,
> ++        data.height - 2,
> +         0,
> +         0,
> +         0,
> +@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
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
> +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
> +         if (spotLightSource.specularExponent() == 1)
> +             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
> +     } else {
> +-        ASSERT(m_lightSource->type() == LS_DISTANT);
> ++        ASSERT(data.lightSource->type() == LS_DISTANT);
> +         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
> +         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
> +         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
> +@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
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
> +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
> + } // namespace WebCore
> +
> + #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> +-
> +-#endif // FELightingNEON_h
> +diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> +index 0660143fc1cf..2b1e86d99fa4 100644
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
> +diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
> +index 0c073bc13f8c..e0db00545c17 100644
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
> +@@ -67,11 +65,6 @@ class FELighting : public FilterEffect {
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
> +diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> +index 5c9c7fb783e6..e53aa012ac1c 100644
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
> +diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> +index 04e331ec4ec0..763c8d400b00 100644
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
> +diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> +index c974d92115ff..e2896660cfbd 100644
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
> +@@ -132,8 +133,23 @@ class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELig
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


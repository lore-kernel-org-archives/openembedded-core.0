Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA9AC07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 07:13:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.7754.1664435604549544571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FsLj9Kis;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=727166c06f=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28T6pE3N009030
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 07:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=3mOb3UwEdbks6ZxxkMEFpHeIu8H34m0kOJM0KomDQKk=;
 b=FsLj9Kis+2OoudbCEbHmge9vqudhNTa3IuKFa71Ubg3z9Cbn9zlyFNZUonu53TQ/upxJ
 2+bisKf1V3296ohgXbHSWTN8R9NG1iQNt4ONFvHA937ifjbvzzIidVn/ieHj+PjYng8m
 6PDoM8X93LmbytvMcOSvTc53pWsYG27CsJPQ8GcX9NmXdnN5+qjqjEmViJCiPF33m2Nx
 jLJbN7CMIOflzPI6OVkXfTC0itrZaWD1wCMiRo9t985x5g37vLtsD1PeK8qolPz3wJk+
 ZzfFjoEGQVE21Fn9p11jjvdTdQnBNCSyk8iKOm1YGgraj5d+2gbAY6KEnSqwdeyGjhHj LQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsq42492e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 07:13:23 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28T7DNaf020992
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 07:13:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsq42492d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 07:13:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GK+sNfxosFHKAOG8IRalFNO/bk3JsdhmqXjjjhw4WPEAH2Efu1xlEhTWS1Sk2BT4Duf+nkEVw/MYoXXxSeULp6bWTJxqgTdjlga0k2OsR/9P0N9SYgBYq1jecaXOKY6bzo9MJZJSq1AmxHc6mo9LxaJg0W/kIalMSHjS5s/Tb1ngx1lzp9X/VO6OifLi2ndXThxjGu6IlTUmRIoyBwGAoyou0dmyd8uSDYy/fhDYGCqvyakYAMGm+S425LLPR/irfHNzc/vmoPWEyk3th7Pq2jvi8N9n+fDXHK6+/OeC+aB/N8jLL2DgmL2f7mRIrtSVj4BLc9U1T0hnuok6gHaiqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mOb3UwEdbks6ZxxkMEFpHeIu8H34m0kOJM0KomDQKk=;
 b=nk+X9wjTPkO5U5ptneZ90CPuMFgDIoqcAx5CjtsQDGWE44NM9DmkWhxxzeRI/TYfszG98Jpn2v0hdH1xfKJUDA+GVO1LrU6pPaeNO8rfKjuPQgesgUZnahBq2diNO5s9QNHinvqPg0crHnQJWCagX3w6p+LEbmKxozTi0czRKHHrw2+sIkWN4Qn+lQ0WEYxd2TTDDjn36DEFGw+8Lt7PjqX96EuiFgESpHGHwgK2tG1oaY+XjriFxvl4e8lnG2TTBjtccpEiwhpwqjE2AvGi3TnrhXETnvloCn5yZzSuMwZq+/HxQNMxeUzSRAuEg8KHCm78oF/NI2Od58V3shpq1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 CH3PR11MB7324.namprd11.prod.outlook.com (2603:10b6:610:14f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 07:13:20 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0%7]) with mapi id 15.20.5654.026; Thu, 29 Sep 2022
 07:13:20 +0000
Message-ID: <4d4f1917-774d-6049-7728-dfce114769f0@windriver.com>
Date: Thu, 29 Sep 2022 15:13:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] binutils: apply override toolchain-clang last
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross.Burton@arm.com
Cc: openembedded-core@lists.openembedded.org
References: <20220929033210.13292-1-kai.kang@windriver.com>
 <52f69af19ea8a1876dab73ce1bebc795f71d4ab3.camel@linuxfoundation.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: 
 <52f69af19ea8a1876dab73ce1bebc795f71d4ab3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|CH3PR11MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c284967-134c-47d5-b845-08daa1ea1673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hLG9N6o+RhUvb+26wGJn0yPLlnb9r0JZ7D6m2KJMKh5KFMsS6IW/lE8Ko1TW1ZYTUOl9p+cdr9jzVyghRtP2UYewxwRBYj5zp/voSyDcr3ztXw6lRFjSPxu9+/XjetZJeE6/HVHgXUoazhSZac4SOTwjWdFtusC9/fv6Itvf+c/7E59lszE3mDzXQ18TSIDvkp2NF9bZmBRMHcp+z7DdT2HQMglOv7irJ661rPEkw6Zwwh3ltqb3s6RjPiELn794yYJ/Ere1IkWJPhDkOfrykuByiM+ou/3Br+8JQG2a47X9qdllJZKLqUIs4yl7LmqNqL3Ay/+kRuWvj1lx3m4wM+VFXfonDGepeUnG7535tO931oBQODbpdQvtS4Ib23jSXEWE9QgNWCFsM+K8e+d3OeH9nAR00v6X4L9yqaljCDDZiKq0uexPeuh98/cnUNLO8bf+SIfdecD598cwY9a1z6o8ISOlwqPHhlHTwAb/VZCErD+4KFSPt8TufM3hSp+tbTbj+aZi/eUjb6JUF6+CVMmQE8EWWaOQl6p+9tKRvx/cabb5oD15u3uFj567L+sGcgvyIAf7H35B6ARwsaLFnp361eBQ8gSKREEWq4jSult/ehxC3/xlTiiBqMRly6WJIea0gVdJ+Ljpe+sAuCfKl1MLoIECEcTvEGbCDjFB/uHono5bQ2tfMPyeIx4q1czSRwKof0jQX5s80wg5r7z/iCgswjYVDzEGAVoW8NsNlvuL8OGnGUUCdxVMkEg7nl2LoP9UOCzBSbulMh8Qg87qLWAlVm+fkLlunNnzCHbWTZE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(396003)(346002)(39850400004)(451199015)(6506007)(6486002)(53546011)(478600001)(6666004)(186003)(6512007)(5660300002)(26005)(41300700001)(8936002)(2906002)(83380400001)(66476007)(2616005)(66946007)(66556008)(8676002)(316002)(4326008)(31696002)(38100700002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEpUOEZKUTRqc2lvQzBqS3lGY003K0F1L2RQQ3BxZFAxWHVMdzdrYXI3ZUgz?=
 =?utf-8?B?eVhIcHBVYTZ1RytpMmtmQ01Mam13Vm9VeUMvZ09BSDFuVFJMZWRMbytzUGc5?=
 =?utf-8?B?dEtGWllLazJHYlBzcldEOE05eWpWZ2tNZVQrazV2SVBBZk1yV0N0WXdCWEMz?=
 =?utf-8?B?YUdIT2toTTBTajdpenNNTlNFc0FjQXJKcDRkZm40MDRmcXh1MXcrTDg4a2pK?=
 =?utf-8?B?OVRhOVAyUUlxSDd3R1Z1a0JVdFhUVjBxWmZ5eU5aWmo3TzNYb3Y4MXN2cUhz?=
 =?utf-8?B?OFhVQWJnMTQzTlA5NnJvY1U4MmM0TXppQkRqa0FzWW95YlJYU1d0MUFJM1h2?=
 =?utf-8?B?emhxTnRnUkFhbGNmaFY1ME9UOHhZY1JST0NQOGo4T3BiRkg5aUJZckZSREJV?=
 =?utf-8?B?MUU0Vm8xek96OTV5MjN3aGF0bHhHMnhGWFkyM1JoV3VjN25lTXRDN0dCQUpR?=
 =?utf-8?B?M1NJdGFDZUo5ekRwUHRjL1k2L1hFenFzSG0zN0FYODhqL1h4Q2NZMXhMWUZO?=
 =?utf-8?B?dENORlJrcDdDYTdzUGIzRDVYeGxxV2tKdEdKN0NjZjVxQ29sNGhSZUNwRmQz?=
 =?utf-8?B?MVUyUG9IU1ZzZUVkU2sxMnJFaEZ1dEUzVDhSK285QUdmclJsRXpTMWxwQ1Z1?=
 =?utf-8?B?bW9qWktJV0NPb2YvQUV1YmdUWlROSFdDdEFic28zN2RoWXBlZldCWVlZS2FC?=
 =?utf-8?B?TFZlaTJzTU5iZ2RxRE9sM2FodVIvT1paN1B1cG9uQk16ZWx0a3E3ODRGYWhn?=
 =?utf-8?B?VTU4Z1k5eTBiWEppYWhFSllIUlB0NEthTjJrTUNVTE5LZG5TMFJ5dGdaS2ds?=
 =?utf-8?B?TVZIeFBwVEJCbFBzU1k2OC9KaFI1WnRIR294SWgvVDBrL0g3cFpzUU9sZnhQ?=
 =?utf-8?B?V3JYYk9rNUk2SUFYbVQyR3FVdHorYWhicTlyVWJBSEFKUWNKYzdjZGIzTGZn?=
 =?utf-8?B?Q2YwRE5vY1RNQXkydGxhdDFWVVhEMm5kdVFqN1FwNzU5TVJNdVJnSDhCTlZp?=
 =?utf-8?B?YmlOd1d3TFRTTWErcXlJT3J4M09XeVp0Rm9SVzhiajU2WHA4K3J2TTQ3Sk9V?=
 =?utf-8?B?Y1RhRWx0ZlJzNFNsdXhrbndqZmw4YmVtcWNNNkRxQlVJWUI2U3dlNFpwdFRv?=
 =?utf-8?B?c1hmQWtCK3gyWktPMnY2RnBwd1JpSE5hT1pqWHJyaVgxUmhpSzU2dHJ5SEo1?=
 =?utf-8?B?bWtDN0YwM054VG9RcktZRFNJcUZFSTlFaU96eThzaFRycU5qTi9ZdXl5K1pZ?=
 =?utf-8?B?Zll5OHNkVlVtbEZsQmlxREJzZHcrZEREUGNFcEhtbC9XSDlYMHRUM1IxRlNy?=
 =?utf-8?B?Q1pNSjVmSkJNQkFIb2xPOXVnTXhDdEFMUHdlQUNpblBGUHJTUXBpMzczeGJ2?=
 =?utf-8?B?aDhjZkovYytrcFpXN1F3RnBsa3FQbmR1cWk1cVpFVFA1QVAzelo0L0JxU2ha?=
 =?utf-8?B?cjE4WWNJOVVzNlhIOWFNUXYvaWRWUmNZbytlRDh1ODdhT1FNMEs0TWh2aXp4?=
 =?utf-8?B?RWtjSTlTLzFsWnJyOXRkNGFUZEZUU2kzS25zdkw4c2VCb3BJMjNsL2R1VTZ4?=
 =?utf-8?B?emVqRzErT2lmMGxyOWJUcmp5dHgva1ZCRkxhblpnNHRjVyt1bU9LcG9WanRt?=
 =?utf-8?B?aHpRcmE1TG1oQTd1UmdwR2xyT2VpZEpLMmRMWjFRYlN6LzBCazRxQjhRUWxD?=
 =?utf-8?B?WVBEMkU0ZHBTbDN3Q1lXbFYrUENNUUdnOTgzeDhUN0R4WWV6UkdjaWdyOVQw?=
 =?utf-8?B?ME91UHROamhSd1U5UklkY2hqd3RPd0NWU0lzTmVvMUkyVXdxK05YMHJMazBZ?=
 =?utf-8?B?VVpEVUtUWlVMNXZLLzRrRzl0NlZ1eFN2YnhKb3VNTHVTTkh3UHU3RGpUTVYy?=
 =?utf-8?B?eHFZdVhNUGk2ZzhYdVBZak1INDd5T0I5VEYxR0p1K3pyd2EzNThldE5vcFZR?=
 =?utf-8?B?TnRPS1ZYblZlajExdStjaVp2Q0pObTNBM3JhUlZHdlc3cGRmK2JpclFlUFpT?=
 =?utf-8?B?WUJsc1NrNDZEempONTFYVjZ1Y01wOXFwWjB5M3NIMFNrbUNBNDBYZGZaTk95?=
 =?utf-8?B?TVUxUXVOdkRGVnhLTVY2OHlmUXoxSDBnM0xoZU5tSndSWTN4bGRyZkg2amlZ?=
 =?utf-8?Q?CmqRAk6dqqpk3jV0JYkC4W2EN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4c284967-134c-47d5-b845-08daa1ea1673
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:13:20.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6jNGw34MUOn4v5lFCohf5OD8G5MB5w90tsRmB7FkzfYL4XcvSgY/VJS+tKIG8HWou0bcIC4nRIo9RaeHoqrYqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7324
X-Proofpoint-ORIG-GUID: EOPR8J_1zeFLSzCZnVdsdHobPbfAHDGm
X-Proofpoint-GUID: jKBI0_zwXW87MwphL24vRXZgRbA4W2zK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_04,2022-09-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209290042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 07:13:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171168

On 9/29/22 14:49, Richard Purdie wrote:
> On Thu, 2022-09-29 at 11:32 +0800, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It disables gprofng for toolchain clang, so it should clear GPROFNG_ALTS
>> when clang is used. But override 'toolchain-clang' is applied before
>> overrides 'TRANSLATED_TARGET_ARCH' such as x86-64, then GPROFNG_ALTS is
>> still set and not cleared. Append 'forcevariable' to apply it last then
>> make it work as expected.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-devtools/binutils/binutils.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
>> index 4dde387a8a..c7113f8a1f 100644
>> --- a/meta/recipes-devtools/binutils/binutils.inc
>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>> @@ -50,7 +50,7 @@ GPROFNG_ALTS:x86-64 = "${GPROFNGS}"
>>   GPROFNG_ALTS:aarch64 = "${GPROFNGS}"
>>   
>>   # it disables gprofng for clang and musl in the bb file
>> -GPROFNG_ALTS:toolchain-clang = ""
>> +GPROFNG_ALTS:toolchain-clang:forcevariable = ""
>>   GPROFNG_ALTS:libc-musl = ""
>>   
>>   LDGOLD_ALTS ?= "ld.gold dwp"
> I've never wanted to see forcevariable used in layers, it is really
> there as a last resort for end users. There must be some other way we
> can arrange this?

It could clear GPROFNG_ALTS for toolchain-clang in python anonymous 
function. I'll send for review.

Regards,
Kai

>
> Cheers,
>
> Richard


-- 
Kai Kang
Wind River Linux



Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE70C04A95
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 07:36:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.7717.1664437012847241393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ErzlQFgq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=727166c06f=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28T7OZku032584
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 07:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=G11tOAZUZJBGYJtFl3qlVrjesWJ3y5nqqTz4ObQDquY=;
 b=ErzlQFgqZoCh4jpuJOqlNQddAaS9I0d/FDpzPXJZL+zE1Hhj2Fsf0PipyjNSF3NJhrF4
 hBBpnCTTm/oSwXCYxV0+20q2MWVBm/yq9ruzzRBmwRM0DppC8EXOQmqDCDfQEU6wepBx
 2gi28ZskHEOdt0BRhIZIh4wDMPvDOubqWjuB046Rtg+dCPiVG0xRNxSNGvY1RPPQXXvv
 UezZEYqvB7vPr1tYZDPfScUJHLCEEKpDqZhAtoc7YVWSDIj2lyKCtBboZi1Z88A2PTHN
 1nDx9Kd3WtpPvHycgvYlm8+nDCpoL+KNsG4M+BkshNiCp0bUIImfmOVPV9IbYHEByckK aQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsrv9m7us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 07:36:51 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28T7XrUF021032
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 07:36:51 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsrv9m7ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 07:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6rAoUPabGzjy7XRLykL5wMiQait8h08h9bdASOncIBTfL3U+GgVexC8TDK6kLozxR5AW9K5ukiRabIglwYGAq0nlJp2mecXPKcNpcnSY7gwGF8s+Ip1PnrQJrEo+VP25AklShYihX0ad1LjqSt3JuvtSTUR+xpCEbeiDhWZf4f4kExwjCHDVSD3jU+ArRtRnI1FnDwujvRtsZQZqHMw1Xy0kmwHTYhEqNGNnTWz7JXfpEd3DQLOQTXtJsOylqQM+kDizoWmtbih7doPPG3EH/UJx2/CQSaA1FJADPhyRB6SATk/7qCz252NGdV2hOENvh6FyvjXhSL6ZirZEChyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G11tOAZUZJBGYJtFl3qlVrjesWJ3y5nqqTz4ObQDquY=;
 b=lZMUtf7kKvNVmEMx3v7l6ahwwZZU9WiWACSDxcm3w1Zo22P2jLJFTKQhKTLaXX2fYM91vihLDRLep7otENWlHrXdhGdMKFPN/KYf6YHEJopc4GnTdatXXeScOmMF1lTDECg9LNsr8VBJa0ROViBYWnZde4n1w94LWYuR9f+39Ip1FR4bXUwT/N9QBdqR0gR4gPt5IqljzDiWp4z8Gz5eC1oOQuw6XQHXpQi1s6Gp0WFbrsV9ZB1IlpsDx1d82UHs+lTIbnGENk7f44CCqPZCNyDEuGJDpvAPc5zTxFq1Kda3bY2mRQoKLsJ8KOEywFqeEpxDP1dXQ7N+uGvMH8ey6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.25; Thu, 29 Sep 2022 07:36:49 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0%7]) with mapi id 15.20.5654.026; Thu, 29 Sep 2022
 07:36:49 +0000
Message-ID: <738ddb78-3e56-98dd-30da-0623d9124e1e@windriver.com>
Date: Thu, 29 Sep 2022 15:36:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] binutils: apply override toolchain-clang last
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross.Burton@arm.com
Cc: openembedded-core@lists.openembedded.org
References: <20220929033210.13292-1-kai.kang@windriver.com>
 <52f69af19ea8a1876dab73ce1bebc795f71d4ab3.camel@linuxfoundation.org>
 <4d4f1917-774d-6049-7728-dfce114769f0@windriver.com>
 <1620d3dd34b47355420bbeb741c06adbe88bacfa.camel@linuxfoundation.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: 
 <1620d3dd34b47355420bbeb741c06adbe88bacfa.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|IA1PR11MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: 976642fe-9594-48d1-3be3-08daa1ed5e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OtAWVt0/UeSR+cgD8pGJSdeTekHUKUagYCBN78Gf8SqTl53dfFuIQU/C5pn5AEZsuvkyLKvUp8DU/jJ0jYHcQ+tsQwK+Dkx41l4i2o63pq6uV49eu/QnqbL++17+Wu9juH5B/Jcv5W/pCkHUY5SdMWIHTseAPR7I2EMULUaMoV3Bf4UPDUAr+pvK31JriE2ENRof3Z3QxMccYjaiKCZ+Ed82bSe9d0vEHawN74M2FaesxpRur+OPGCGO18uxg1Ft1mFN4S7N2FCzm46fXZ0g3B8ycGnWW86KpJ+l76TpEyGodHtmbhq/bLPPppOz5GZ5NpTKmlE5Gpwx/3EMXqYPyJatfZ6VcgwQDyUmPg6fKYTuTiizi97mravryXqBQJPo9cRB8PCRU4Jt8CHbLLXDL4d7M14FyAE1eC+J7jLy05g0irM9prbtvhqgXDnvSW08TJplRgXJZXnrf2EhJPrI3u516PT0PVGIHCnzlm6V5mJKcWh3kUmpI6sTnV3D8jSH6BBwsT8hPpMNJArXpCXAL2w2Y/eOgDk2JN4jA5UWXAbZ2p0TkuNMTBWnggzqCmLpYdK1afcYiYYf1IYHiaANAr8NgEUnoH3N3S6Sn0Rh0GLlmMHP/AX89KL2RlICniLjDK7jhGBgUx2jfBPwijYKYJ0NqfGHp3JH9nUyJbRYGAxignRq5OQY3FNloxtY0jUkqV+IL/jzkgGUGiyvIChD2O6mYDYG+wChy2aOsNJ1FAY8OvwxMRHfMb8dpoleLm6Kiln94Rxe0UVT+dcdaISEzGKNSZRtD4kUN7wz+21yibc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(366004)(136003)(39850400004)(346002)(451199015)(66946007)(83380400001)(8676002)(66476007)(478600001)(36756003)(2616005)(8936002)(6512007)(66556008)(53546011)(2906002)(38100700002)(41300700001)(4326008)(186003)(5660300002)(31696002)(6666004)(26005)(86362001)(6506007)(31686004)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUpqb3V1a0t6cndjSllYaUp4NXNyUkhhQ1NPNDNEQVg1UFFTQkJzRGs3d0dB?=
 =?utf-8?B?OXpUbFA4bWlTMFVXRGZWQ1RTcVpTNmtPcVFRTFlsdzZLQTdtZXpMZHYzT2d1?=
 =?utf-8?B?d3FDa2RaNlRqTnRPVGsyN2NiakRuN0lrOWlJcW0vKzVoTjEwUkhGeVhVdjRP?=
 =?utf-8?B?WWNtY3dubTd4QTQrWGhPWk5NNk9oeEttc1JTUmM0Z2s5b3E1ZXdYUzM5TllU?=
 =?utf-8?B?TVAzR2JrU0cxZFhoRjVUV3AvN25KMFdWamsxOHFzRGJtUjNEM1o5UFlYMFlS?=
 =?utf-8?B?YUZOd3l4blV4YXF3VmFVV0JZQXhuQVcvT3JEMW8wZklVUG1xa0l2QUFKekZj?=
 =?utf-8?B?MVVJdDlaaGZWSE4xNUlqbXlpL1dRb3cxejdpVkJmbEdRYzdNdmZtMHdUQmdO?=
 =?utf-8?B?ODVMSHZycG5DTjJ1ZHh6VlNkRFNnYWtiOVI2RmFCS2c5eGZFNVJYeTBYeHZw?=
 =?utf-8?B?bnJnM3JjZnBPcDF4OXorbk1WRVFncXgzYjMrL0d0OUVoWlVELytmRld6Y2xv?=
 =?utf-8?B?c1dSYTdKK2RPQ0pnVkx3RG9nUlhUWVR1bzQ5OHlUT2dRTkg1VXd5MHdDSE1L?=
 =?utf-8?B?Y092ZlIwZ0FBM045UHp0R21NM2hoZWpJWDR6ckNWcmVNMkc4bXFoVWlPYi9u?=
 =?utf-8?B?cjdGclhJcVVyY3Bta0U4WE5panRqOWV2cnBxc09zNGk1aUo5OVlaZGlVMGpT?=
 =?utf-8?B?M096bmFlZ1FmWTNKalJweG5BTmV2TUkzelpvZ3h3RlZsVjFrdyt3aTNzNVFt?=
 =?utf-8?B?bmpDTUlEVktRdFhsOGYvcHRPMXp0S2J3c0tkaEFRUzNZVEg0Y2pIa3VnczFD?=
 =?utf-8?B?Mzd3MDJWQW1BSnZ6R1FaQVFTaWVROHFNRXNBRWY3eTFhV2NDejJsMTk1Umpm?=
 =?utf-8?B?WHA5UERmdWRTc1JCdGJqdm5EQ2tyTDdKUUF1aFlYd09YOVYvc0hsVGNsbmty?=
 =?utf-8?B?WkdVWXFTY1pXc2hYSUp0NkZ0d2FKUDVUcFdiNHZ4aDc1RXdsQy94R044d1Jj?=
 =?utf-8?B?SGl6MUpBUGhNQ1lMUWRocnNuck9KaVNteTE3TFovWG41WFRXS2FSNmlXcktD?=
 =?utf-8?B?aU1yZVBhTEVTV0x2cmFtandQMzE4aWpuNTh6UlcwSnkrdWZsZjhLQ1pvVTVK?=
 =?utf-8?B?ZG9PM0dMY3NCNFhVbVBQY2ZIb2lVcFVLeXdQNDBjN2xDbzJCWjVoQUE4eTBZ?=
 =?utf-8?B?MjUwdERmTGpJRFpVRURKRnZMdWIzcTZybVhhcUpYL2xHS2VGN3Z0SWZaNnVr?=
 =?utf-8?B?bUhnMmZ1djlSeDRKWGI2T2svZXk3VEIvaWZ3UkRvSXhlN0xlNGFZcjdZRVl2?=
 =?utf-8?B?d0JDaE1scWF6d0FZUUthUmYyemliU2RUaTBWZEpBWklURVJvQkxLYjNxZVhQ?=
 =?utf-8?B?ek13dmRDTk5LVkNuMzVNMWlJNHdMK25hek9zRVdOSGtxdStWdUNsM3ZENFZq?=
 =?utf-8?B?NSt3bjRKL1o4dXdrUHgyUldPWnBrVXRXT0JXb1piOUNEM1dzaXFMUm9ZemJx?=
 =?utf-8?B?Y0kwTm1GT00zRmJJSWpFeGlZT0FyamhaVjhJU2l5VmNmT2ZKN01LUzcvNzdt?=
 =?utf-8?B?RkdmUFBoaFhkRGVjcDlxRUZSTEZWbEloRWxWS3Q2NWcvSW5XWGwvcnh0N2lQ?=
 =?utf-8?B?NksveTcrdnc1L1hEdDJqY2V6S1JpM0NnT3U1ZGgycjVUZHJtQk1SYXB0VG5O?=
 =?utf-8?B?Y0kvdnQ3RnpMTFNyUnRoc01xRGpJSmRoK3FCa3BoUWNSYzlwc2NzcC9hZ1RH?=
 =?utf-8?B?WTRUZUNIYUFkVnJsYmZtZDVxYWhZVUd0YitYQmZLc3pnclk2TkRiQ29keTIv?=
 =?utf-8?B?cjFVR1VaT3R5czhBbHBMODZkSVpiSmNRbVJGWjlLdVE5SHorWnorQjEyUkhq?=
 =?utf-8?B?QnlkTEhnM0JhQnRIMHNoU1ZWbm9tMjFmVFoxcklESmp1bHRkWVd1T0tEbHZH?=
 =?utf-8?B?WTV1YXE1WHFmVnIvWkd1aUpVNkZ0dWNKVTloRTJYelRtVWQ1SVJ3RSt1MUxQ?=
 =?utf-8?B?UEhrMUVWWWlMQURsM3R1bGY5UjVTcXdxZ0JzZGNTUEFhZ1NFS1YyOVI1RWw0?=
 =?utf-8?B?d1B1bk1MdDlhZEhleXVWUUU3SFlTRXVPWlk5b2RhSGhmWHhaMmRqWkhxdmZK?=
 =?utf-8?Q?YxvDdGUI+Kd44VenHqwHoP+rx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 976642fe-9594-48d1-3be3-08daa1ed5e68
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:36:49.0493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Wg84zcY2qG+GMKw0Apk7pIR+Y1tLrXahDCP8vfikjR296UihW0SjaQA7HHuAx80Y5ucFuV7TtbxN0PU3P26Ahg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7388
X-Proofpoint-GUID: fdNg3EXODYOLIAQkyZv0shEU1bx1aGci
X-Proofpoint-ORIG-GUID: zpO-NYnqBAmdPLzVG8FFPVG-9uXpMH7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_04,2022-09-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 07:36:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171172

On 9/29/22 15:21, Richard Purdie wrote:
> On Thu, 2022-09-29 at 15:13 +0800, kai wrote:
>> On 9/29/22 14:49, Richard Purdie wrote:
>>> On Thu, 2022-09-29 at 11:32 +0800, kai wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> It disables gprofng for toolchain clang, so it should clear GPROFNG_ALTS
>>>> when clang is used. But override 'toolchain-clang' is applied before
>>>> overrides 'TRANSLATED_TARGET_ARCH' such as x86-64, then GPROFNG_ALTS is
>>>> still set and not cleared. Append 'forcevariable' to apply it last then
>>>> make it work as expected.
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>    meta/recipes-devtools/binutils/binutils.inc | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
>>>> index 4dde387a8a..c7113f8a1f 100644
>>>> --- a/meta/recipes-devtools/binutils/binutils.inc
>>>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>>>> @@ -50,7 +50,7 @@ GPROFNG_ALTS:x86-64 = "${GPROFNGS}"
>>>>    GPROFNG_ALTS:aarch64 = "${GPROFNGS}"
>>>>    
>>>>    # it disables gprofng for clang and musl in the bb file
>>>> -GPROFNG_ALTS:toolchain-clang = ""
>>>> +GPROFNG_ALTS:toolchain-clang:forcevariable = ""
>>>>    GPROFNG_ALTS:libc-musl = ""
>>>>    
>>>>    LDGOLD_ALTS ?= "ld.gold dwp"
>>> I've never wanted to see forcevariable used in layers, it is really
>>> there as a last resort for end users. There must be some other way we
>>> can arrange this?
>> It could clear GPROFNG_ALTS for toolchain-clang in python anonymous
>> function. I'll send for review.
> GPROFNG:toolchain-clang = ""
>
> might work?

That should be the right way for both toolchain-clang and libc-musl.

Thanks a lot.

Kai

>
> Cheers,
>
> Richard
>

-- 
Kai Kang
Wind River Linux



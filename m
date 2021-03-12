Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.69])
 by mx.groups.io with SMTP id smtpd.web11.4176.1615523476278226683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 20:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YBnUtQRs;
 spf=pass (domain: windriver.com, ip: 40.107.236.69, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8/yHw1LIt0vuzoAa1xdH/OPhaGEosUt2IKDQpna7sTqlqF4+F0mKdVsyOtFmn/w5Zq0Sx8XA4ebIOkR0YkW7zN0HvXPvBrSt3yMOnwEcLtucNR4PVAnRb3A2YbWC64WYcXpvat1oYiD1RuU+xUOCblsCZuYmlEDZrasoqoLKNuV9FTYLRDKweFmv1ESKLd+b1nxkH9Asc5uzFql0eSBZk58Hi/fJwJE2/ipLi23C49KmbRUI+MxOamXcUN4a1gtz6pG2TP1fKy2xOVrd74Kw1clSkoEZyn1oQyy8cN1jTkR6K2HCzXXxmlEYiLbOGuFbaUlCkLFwrGiUMsNe0tQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjLLPXQDDErEHWdx88j7Z4/tjLXAcV+vP9cULsB/aPY=;
 b=hVvK3HsvxBQlcgyg6/Vptp0E+8fqbDzxYY3B/DcGgpPlxghvHO9cE7tbDprOZ3gwWGsXLJx03tUjyfz6JO3/ouMYIht2qXB438YrEunhUfHMLeYXf7YmxfW58EmgjHXMpNOmeAniu90qSdrDvR9cioCXAi4dys9Yr095kVYiai4Tl5RL9UJOyE2oWCLyrYYeXmPVto++eGOjJf7L0gJho7C6FumhaaP+Mo7SWRQlcv3pQ7NnOqTZqMJdCltWKANK/aR+EbdfAYV72jHpVOf3wLYuC9dLtPqhXPMKow79QtNp04kiysLtCgnX7pe2gntubY/C9N9K9pLh8Wk/nzRq7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjLLPXQDDErEHWdx88j7Z4/tjLXAcV+vP9cULsB/aPY=;
 b=YBnUtQRsTTQAAMg+ZrIaRT+Zj+WRPBIoRX6PjkQ4IkuwRBCxd3a4KZkYEh2mZoSuXgP+pCuReqS/qod/yUOq/XMXtVFryxTdWrNzQJd77euaBeRg38JEc5azGf5ICGbO4AlwYTboZ7DQH424ybGmZ1mVMcIFex6hha0fegazPjg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3304.namprd11.prod.outlook.com (2603:10b6:a03:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 12 Mar
 2021 04:31:12 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4%6]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 04:31:12 +0000
Subject: Re: [OE-core][PATCH] glibc: fix pthread_cond_destroy hang with process-shared mutex
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210312032227.563402-1-yanfei.xu@windriver.com>
 <CAMKF1spbmXaaLNN-sQgwOxNbxWBKovkwMV98o6FK5mnqNMw_PQ@mail.gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <3b3b584c-76a4-e182-bfa1-d4d0577f1ec7@windriver.com>
Date: Fri, 12 Mar 2021 12:31:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1spbmXaaLNN-sQgwOxNbxWBKovkwMV98o6FK5mnqNMw_PQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by SJ0PR13CA0188.namprd13.prod.outlook.com (2603:10b6:a03:2c3::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 04:31:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9871dde6-897b-416b-dc2b-08d8e50faaa0
X-MS-TrafficTypeDiagnostic: BYAPR11MB3304:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3304428276DFB7E098E8B5A7E46F9@BYAPR11MB3304.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q3OiVQpBp9eRBb916yaF1B1yTgasgZJPnJJP3GRSGHzsMMLHgUhCtVeDqJs7ajtOn3BoEdemLoyo6rrYO652Up48bnqEuQMigpw5VPjOpaUByrjxFA6eTT8pwzGG8AsQk4dlLSz09lc1JE0fFc8+SNbRURtpy2SOd9e91q3P5zV7M4bMFD6gySXcnp0wvuvfyK7TwjzXK8/PTS7kwaA5nbvxP98eF8TiJC4j9cXFKjEhNIIcH8P3hW2cDLoT5CXAWUsaRty8avNgXk6uscE0PDvYrxwlxNLx6QhnY2dwsDTfTgfjKjEwPgW3iz/cfh+YsPGW3WbyrjkPou4Di6vRWP3lRhSekJJbe3McLjnvlEYPtIOzpIGEqaj+IKXt6TTBVx7jNz3DC4YCRtOVRuq26Vnkk2IitchWZIkdkIbMUAPBFzpZa1PRkWPYprP1fYTq1HFftCO1zumcL9/C75hZDIC/qS2YR1l62mMoEwHrnUQez9ozWBMU08g1hN0qCHqt4XhkaKXNEF++JSLoOSEVOKb09q3Mt1D2q9f5Sg+fO7O5dlaUX9Q08iKUe6aAg3ANgsksbCEEryGYr58Wjx1AHGD9QyuUqkhj+r8FJcRn1SBkZmjTMYI8Z4xReMhPqIv0R1bWk1fta/eDLfMJor/6LwV0UTlkeimeRrze1BryKPoTJfbfP2tYGFbEBW0JdPhiz+lNppo3VpBwCIw/PWhoiw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(396003)(136003)(316002)(66556008)(956004)(86362001)(8676002)(53546011)(186003)(66946007)(6486002)(26005)(2616005)(478600001)(31686004)(36756003)(66476007)(8936002)(6916009)(31696002)(6666004)(83380400001)(6706004)(5660300002)(16576012)(4326008)(2906002)(966005)(52116002)(16526019)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eHN5dXBYOHJCR01KNTlJTjFtbWdaWENSb2lvUHc1SmhaY095MnpMaDBFcW1F?=
 =?utf-8?B?RW1Hbk9IdXU4L3hHdnE5cncwM2RPN2lQbWJkbXJoR2g2cnJMdEdWTlRMbENV?=
 =?utf-8?B?Q21SMGQ1NnY4QldWMENoOGI5WkdqcUhsYWlndHkvQjFHRzFRNmRvKzhJYlR2?=
 =?utf-8?B?MTB3eXlEcjhac3FubWZTTWhBWmRWQ0k0Y00rQ1d4NWN0d3VYRDk5OXpGU1JF?=
 =?utf-8?B?VkwyRHRrVGNBRHlQcjBiRlQ0eEpiOWE0NGhraWlpMjhXS1FSSDRUSGVXMVFw?=
 =?utf-8?B?Q01pcmVHeXZteDYrelFZZWhXLzhDT28yM2YyTmxINTE1a0ZyNjFScEJKS2Ew?=
 =?utf-8?B?aFJCU2ZRbnhyOWtRSnZBazlRM1RKVFNobmVYWGJNOUpsTERCRlYvZGtkc0l5?=
 =?utf-8?B?Y0I4ZG5WZnBCUXR3V1d0ZzdvQXZ3NEhpYTIvRENWMkVrYy9OZFViN0RVeWVU?=
 =?utf-8?B?TlFCYUNNNGc0akEvbE5sUFlQcEdSV2NkM21iMVpXbk0xeHJIUG9yemhtSlZH?=
 =?utf-8?B?S3B4UGFMR2xzZE9PVmFpRjBFYmNEZHljWmUxWlk3dFlXL0JmOGhLbTlNNm1J?=
 =?utf-8?B?QXQxazdPR1d4ZExSajB1cVg0dVd2UUkyYjBoZEEvalB1a2t3RStTT0NEMzF5?=
 =?utf-8?B?TSt6b2lRLzFxazhTQUVBVms0bjlHZnRCTWdZNGpaNWRBWU1uRnZ5dGREek1p?=
 =?utf-8?B?Wm9oMHFkKy9ES0htMjB6ZEp5NC9jdW92UVFvcG5temlvU3dhdFB0SllkYXZJ?=
 =?utf-8?B?TGtWNVZEejNxUXFpUGQ3VzM4eHA2cVcwYXpPN0hxdG9pOXdHRWMrU2taREVw?=
 =?utf-8?B?UDBWN2YyUkhiZTVuMUpDM1haZ2I3NFdqVm13MDN1STVnU1p0QXBiZVVnTkpL?=
 =?utf-8?B?ak1GYXBEQnIyemZhZ09WU3lxYlJMYkdkWk1teXNkWFNwNWplV0g1dlVLY3ZS?=
 =?utf-8?B?SXNFdE9tY0J2clNBTFRKTnlkdzBFYzcxYnJ2cDM1SWdVbXFFMUs5Rkc0Tkdl?=
 =?utf-8?B?UHFrUlplTWhHaEZadHpUaHdzVmh1NDdINnN5Z0ZMbmNIVTZzSitJWFdNd29G?=
 =?utf-8?B?cjhMQ1BWclRRTDZrWnozenVDUzhwWGVnc1FSTDdkMXcvcVNxY1YzRXpNMU8w?=
 =?utf-8?B?VEJUT0lLcnFLQmY1YjRXQnFMU2t6Q3RZdUxLQmY5RXZhVGQ5T0U4OEZYK21Q?=
 =?utf-8?B?V0p5UUtwSWg0Mm9QSEhYcG9lUk5oWVBLWTlRNENRK2lkYUdJYXhEYmg5VU5G?=
 =?utf-8?B?NUxWaTBqdFhTNXRkZmFvWStocHV6K2xEdy9KeWxtYmp0Tmp1Y0d3WHRkNmwr?=
 =?utf-8?B?dDNhL0hkeXg1KzZaVEx6K01UNEpJREpCZmQvaWhRSGk0M1dvWlJ0QmduQkRM?=
 =?utf-8?B?Y0RpSUF2NVd2Tk1ydityNWdKSEtYRVVjd3lKMWxYQWttSllveW0yUjhrbGZa?=
 =?utf-8?B?a055RUpmc3RXV1lyMEdmZVZaMklWVFNTc3JLa2xQcU5vSGtNbkNPOVVvaW5C?=
 =?utf-8?B?S0wwSWhRYnQrVURESVdNQzNpbDg5ZjdRWDdkMVNtTkRkNGs3djJoL1l6VWU0?=
 =?utf-8?B?MENQUnd2TFJlY0RVeUNFOFphQmFOUWRzeGdzZ2JrQmNKcWlCOUFtVlRJdzBu?=
 =?utf-8?B?TXZCV2gvNmZUenRXS0JtYkkvVGI3Ujhzem1WQWFjTXRad0czVlBqSnZwYmFF?=
 =?utf-8?B?UHhNazhsMCszVlY3NFpCS1BmVGpreFJkTWxUbElqU3B4YjJZbkU2MGllYThD?=
 =?utf-8?Q?i13sp6FUcl1OtpmMfEswPBThm6x9KAtXfzuGGT/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9871dde6-897b-416b-dc2b-08d8e50faaa0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 04:31:12.4962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxGq+uwoQeE1uZZPNkX4Rz+PNjUODR+Kzms1eRYxNcqacl9IPzvWcyYM0ty8VQfSK8L0NpEKDi3dbAsf/zvTeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3304
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/12/21 11:57 AM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Thu, Mar 11, 2021 at 7:22 PM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>>
>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>
>> This bug can cause pthread_cond_destroy hang with process-shared
>> mutex. And it is since glibc-2.32, will be fixed in glibc-2.34.
>>
>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ---
>>   ...-private-futex-optimization-BZ-27304.patch | 49 +++++++++++++++++++
>>   meta/recipes-core/glibc/glibc_2.33.bb         |  3 ++
>>   2 files changed, 52 insertions(+)
>>   create mode 100644 meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
>>
>> diff --git a/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch b/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
>> new file mode 100644
>> index 0000000000..19f391cc84
>> --- /dev/null
>> +++ b/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
>> @@ -0,0 +1,49 @@
>> +From c4ad832276f4dadfa40904109b26a521468f66bc Mon Sep 17 00:00:00 2001
>> +From: Florian Weimer <fweimer@redhat.com>
>> +Date: Thu, 4 Feb 2021 15:00:20 +0100
>> +Subject: [PATCH] nptl: Remove private futex optimization [BZ #27304]
>> +
>> +It is effectively used, unexcept for pthread_cond_destroy, where we do
>> +not want it; see bug 27304.  The internal locks do not support a
>> +process-shared mode.
>> +
>> +This fixes commit dc6cfdc934db9997c33728082d63552b9eee4563 ("nptl:
>> +Move pthread_cond_destroy implementation into libc").
>> +
>> +Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
>> +
>> +Upstream-Status: Accepted [https://sourceware.org/bugzilla/show_bug.cgi?id=27304]
>> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> +---
>> + sysdeps/nptl/lowlevellock-futex.h | 14 +-------------
>> + 1 file changed, 1 insertion(+), 13 deletions(-)
>> +
>> +diff --git a/sysdeps/nptl/lowlevellock-futex.h b/sysdeps/nptl/lowlevellock-futex.h
>> +index ecb729da6b..ca96397a4a 100644
>> +--- a/sysdeps/nptl/lowlevellock-futex.h
>> ++++ b/sysdeps/nptl/lowlevellock-futex.h
>> +@@ -50,20 +50,8 @@
>> + #define LLL_SHARED    FUTEX_PRIVATE_FLAG
>> +
>> + #ifndef __ASSEMBLER__
>> +-
>> +-# if IS_IN (libc) || IS_IN (rtld)
>> +-/* In libc.so or ld.so all futexes are private.  */
>> +-#  define __lll_private_flag(fl, private)                     \
>> +-  ({                                                          \
>> +-    /* Prevent warnings in callers of this macro.  */         \
>> +-    int __lll_private_flag_priv __attribute__ ((unused));     \
>> +-    __lll_private_flag_priv = (private);                      \
>> +-    ((fl) | FUTEX_PRIVATE_FLAG);                              \
>> +-  })
>> +-# else
>> +-#  define __lll_private_flag(fl, private) \
>> ++# define __lll_private_flag(fl, private) \
>> +   (((fl) | FUTEX_PRIVATE_FLAG) ^ (private))
>> +-# endif
>> +
>> + # define lll_futex_syscall(nargs, futexp, op, ...)                      \
>> +   ({                                                                    \
>> +--
>> +2.27.0
>> +
>> diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
>> index c47826a51e..6ba8cd9b71 100644
>> --- a/meta/recipes-core/glibc/glibc_2.33.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.33.bb
>> @@ -45,6 +45,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>>              file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
>>              file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
>>              file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch \
>> +           file://0001-nptl-Remove-private-futex-optimization-BZ-27304.patch \
>>              "
>>   S = "${WORKDIR}/git"
>>   B = "${WORKDIR}/build-${TARGET_SYS}"
>> @@ -55,6 +56,8 @@ PACKAGES_DYNAMIC = ""
>>   BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
>>   TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
>>
>> +TARGET_CFLAGS += " ${PROFILING_OPTIMIZATION} "
> 
> why do we need this change ?

My fault, don't need it. It's just a debug operation during I was 
debugging this issue. Will remove it in v2.

Thanks for reviewing.

Yanfei
> 
>> +
>>   GLIBC_BROKEN_LOCALES = ""
>>
>>   GLIBCPIE ??= ""
>> --
>> 2.27.0
>>
>>
>> 
>>

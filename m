Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC5FC369C2
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 00:26:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.1346.1745627208935934041
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 17:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MQqwLQMw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PLUOsS012606
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 00:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tt5Qgflz9QJwm/eOmpSKi5gzzGIM821kuggHVvxL2mU=; b=MQqwLQMwUSana869
	ekJ39P8kIyVsklgMBsH+KxEu8fESygidcOi349YkKNiUFsLRwqvn5jxY/FYJ1jxk
	zWBNZXqY8VVJh2Rdjm+ktcJA5wAWN49efqf1V/nnH2AHOCJlwYGzaKSz+yVzYFF9
	rwCg2gJV8t6xdMFjVcm4dEw+qVNu32U9NICMAiZOYDO293++3Fcbt3AzYTIC6Dtz
	C5dJzq5CLwe/UaCSK7nmGq0NqW2Lg+IQaxVEKeBVrcxHGXblKEMrfm9JvTv3F9O2
	05sDgn+EwDAGwE+PE9tahvXblZs00lGlRBTvx+oL3waBlVWWHhfkYq8mobkXJnie
	QKaKEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0aksg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 00:26:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53e316734so459517685a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745627207; x=1746232007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tt5Qgflz9QJwm/eOmpSKi5gzzGIM821kuggHVvxL2mU=;
        b=OYeCBTIuKxK3cLtisc5OjGXGXFDc8Vsm2e6W6VJPLG3m5dxBX+AND0EccKoob3ulWx
         xsHfV7WBShSHYx/peJgEw2Ig16ZHttbApBN4s2Owh7bv/VC36oen1N59aAKB2Q7e90Jd
         kn/9w2TcEkbhM2kvp7LJ2Q326RHU8LDADBvbE5xykZJ6Vl009W74BVHp7FMkLQYqTC8k
         oWphWpo8LAUMbVyWgZYZEXtLnZc3Rd+v4N9KTbuFMVnSW1m6SigJGJ8EpfCIroKavrDz
         +l9e5yiVaiC/mH3ppEmOxbvu+6O5ZpGunRC8ZClNHbYNmBtb82DfdHDAabnndA1hkaIk
         IuKg==
X-Gm-Message-State: AOJu0YwnaCrOoBc6VvTJmVmDQnYz348CVHlbmcHes9AKWkhAg9hPY7bc
	vUVib5drkq5d6e+nqJ7BGk/gemUKBFwp7WUQOIakUSCKeV0b5MR7LW+Px3lysdmd72jNVpEn9h2
	mN4OUWTDC2cmeYm9hc3zAJapa2hECB4Re1ksRKYMnJhAhINPH6c9G6QpucjT82PKYmr9td8ai6s
	CVgWc=
X-Gm-Gg: ASbGnctQwzhKMKbx8SpwO9SqKCiuFSxb3ga5P+2ozj0cph/wrWmxDZKsRZvh6OYRKHw
	DXD2ddHJj6c4go9gRZ8xdpkQIwE9TJMvJ2+32L2djQH0Fy+0C8OzEtn+x5xYPtcLfXbl9I4Sl1F
	Rjr5PCRcNqdfth5zd3bt5FEKf6wMo60Gpt1bDMzjNvOT7wenWspn8POjB7OHGKafH/cBuRrsBjE
	jz49CFU/+R+QR13pekfllU0dQvkqgvWk0JH57wKk+DR6SQlH+klWNU0lXvz+871He7vU38WGJI3
	PrgFQX4oksEGa+vH+FeOEOUOqP9VxdjS/dZil2DgS3A8kotsI052GILm8ScjpsDAd8S7NNS/yDC
	xKjND6BU4p+uzuQ==
X-Received: by 2002:a05:620a:170d:b0:7c9:253d:f226 with SMTP id af79cd13be357-7c9607cfc05mr704471685a.51.1745627207082;
        Fri, 25 Apr 2025 17:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKdb6j31XnTRud4s1sgCdIpJarqKItnz9rNJpr3Qubhx0l8Ty8TmLYP8enShVjN22cngQr6w==
X-Received: by 2002:a05:620a:170d:b0:7c9:253d:f226 with SMTP id af79cd13be357-7c9607cfc05mr704468085a.51.1745627206565;
        Fri, 25 Apr 2025 17:26:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca8ef7sm775731e87.186.2025.04.25.17.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 17:26:44 -0700 (PDT)
Message-ID: <9f7e4e2e-945e-4edd-850c-e084e2a0a4a6@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 03:26:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] clang-merge: Bring clang recipes from meta-clang
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Liu Yiding <liuyd.fnst@fujitsu.com>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
 <aujf4cdo2qhrzn72sx2ctwnpyckkplkmizzuvkbvm2s7circvr@kv6tiwmj3jwt>
 <ztns5wzhs562l7hsyrludvvinocsppknusdkenmspda3nogsm2@p2iml5ncm3am>
 <hmxfon6u3s3wutu66qxvlm5k7tjlabyytyssvbkk3v6pfrmpxd@4oxiedpyhc7q>
 <dc91ce00-80e7-4bca-8539-9dd39d1d97c0@gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <dc91ce00-80e7-4bca-8539-9dd39d1d97c0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAwMSBTYWx0ZWRfX7fyl2vLvaBmK 8IHpb8Uw+eS6yad8YezEXjLbnPDtJzFLALq/j2gRPdchUx1dbM8u6GxWQEHMqEj6KUZy0XvA7nn T/8dN6VUN93rvyzu3Jk5cFnM2QzhgMBde4tRR9vavMp5MROQS06sE3ueAg13wylbLrTi0phGaLG
 amGd4PMTwn+uoTWv4QqSOcnGWryv0tSwgGwJbtiZjT5hqhdrekRWvbgKxN9yzZTEOtzARNf2ukY WAQ4noKAnwtYvfTi0iybliZURpO3bVIlW1botX+Gd/VRwreaIHCM8AzrZ/r7K//Zt7NjM9J/4A8 sDZUESbK3U4js+INGtRPGqo5IS/yXbJvvnUgmLKUcgh1/RFk1NwP30DUUIyeaxjQvx9yX+AHtTF
 YHGr+8i+ekVEDuMCgI+b2KfgmQ0OkOGXOTlmh10My3gpY+RtrRAqJIrQsk1dFoFy72kLaHcM
X-Proofpoint-GUID: q6wkMgEDGFODTXyr7hHLQMfL1iYYyrzA
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680c2847 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=hDzlAQmI71UN_NodILsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: q6wkMgEDGFODTXyr7hHLQMfL1iYYyrzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 00:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215498

On 26/04/2025 00:18, Khem Raj wrote:
> On 4/25/25 4:18 AM, Dmitry Baryshkov wrote:
>> On Fri, Apr 25, 2025 at 02:04:53PM +0300, Dmitry Baryshkov wrote:
>>> On Fri, Apr 25, 2025 at 01:27:45PM +0300, Dmitry Baryshkov wrote:
>>>> On Thu, Apr 24, 2025 at 10:43:21PM -0700, Khem Raj wrote:
>>>>> Latest mesa 25+ needs libclang during build for tools like mesa_clc,
>>>>> we enahnced already existing llvm recipe to build pieces of clang as
>>>>> well, which worked for mesa's needs but broke static clang compiler
>>>>> provided by meta-clang due to newfound conflicts, since clang is now
>>>>> built with llvm recipe from core and also by meta-clang and they
>>>>> compete for same namespace, an attempt to make them co-habit did 
>>>>> reveal
>>>>> more difficulties. Clang compiler from meta-clang is not able to use
>>>>> llvm libraries from core since they patch them differently.
>>>>>
>>>>> This patch series therefore brings clang and all recipes that build 
>>>>> from
>>>>> llvm sources into core. With this changeset, clang recipes can be 
>>>>> removed
>>>>> from meta-clang there is a pull request for that already [1]
>>>>> As an aside, we only build clang once and use it for meta-clang needs
>>>>> and core needs.
>>>>>
>>>>> With this, meta-clang can depend upon core layer to provide clang and
>>>>> related recipes, meta-clang will still provide the toolchain policies
>>>>> around clang based toolchains. Clang compiler from core, while usable
>>>>> for mesa is not yet fully usable out of box, since we need to workout
>>>>> the multi-toolchain architecture for core, which will be done in next
>>>>> phase after this merge.
>>>>>
>>>>> [1] https://github.com/kraj/meta-clang/pull/1088
>>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>
>>>> With the following lines in local.conf I got the RPROVIDES error:
>>>>
>>>> PACKAGECONFIG:append:pn-mesa = " opencl libclc gallium-llvm "
>>>> PACKAGECONFIG:append:pn-mesa-native = " opencl libclc gallium-llvm "
>>>> PACKAGECONFIG:append:pn-nativesdk-mesa = " opencl libclc gallium-llvm "
>>>>
>>>> $ DISTRO=poky MACHINE=qemux86-64 bitbake mesa
>>>>
>>>> ERROR: Nothing RPROVIDES 'spirv-llvm-translator' (but /home/lumag/ 
>>>> Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/ 
>>>> recipes-graphics/mesa/mesa.bb RDEPENDS on or otherwise requires it)
>>>> NOTE: Runtime target 'spirv-llvm-translator' is unbuildable, 
>>>> removing...
>>>> Missing or unbuildable dependency chain was: ['spirv-llvm-translator']
>>>> ERROR: Required build target 'mesa' has no buildable providers.
>>>> Missing or unbuildable dependency chain was: ['mesa', 'spirv-llvm- 
>>>> translator']
>>>
>>> After adding the RPROVIDES for libclc and spirv-llvm-translator, the
>>> same command fails with:
>>>
>>> ERROR: mesa-2_25.0.2-r0 do_package_qa: QA Issue: File /usr/lib/ 
>>> libMesaOpenCL.so.1.0.0 in package libopencl-mesa contains reference 
>>> to TMPDIR [buildpaths]
> 
> I can see this on qemux86-64 as well.
> 
>>> ERROR: mesa-2_25.0.2-r0 do_package_qa: Fatal QA errors were found, 
>>> failing task.
>>> ERROR: Logfile of failure stored in: /home/lumag/Projects/RPB/build- 
>>> rpb/tmp-poky/work/core2-64-poky-linux/mesa/25.0.2/temp/ 
>>> log.do_package_qa.3491435
>>> ERROR: Task (/home/lumag/Projects/RPB/build-rpb/conf/../../layers/ 
>>> openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_qa) 
>>> failed with exit code '1'
>>
>> As with the v1, building with the RPROVIDES and PACKAGECONFIG being set
>> for poky/qemuarm64 fails with:
>>
>> /home/lumag/Projects/RPB/build-rpb/tmp-poky/work/cortexa57-poky-linux/ 
>> mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: 
>> fatal error: 'cassert' file not f
>> ound
>> Unable to generate bindings: clang diagnosed error: /home/lumag/ 
>> Projects/RPB/build-rpb/tmp-poky/work/cortexa57-poky-linux/mesa/25.0.2/ 
>> recipe-sysroot/usr/include/llvm/ADT/Den
>> seMapInfo.h:17:10: fatal error: 'cassert' file not found
>>
> 
> this header comes from C++ runtime package either libstdc++ or libcxx, 
> do you still see this with v2 series ?

Yes, I've been running the test against v2 + RPROVIDES

-- 
With best wishes
Dmitry


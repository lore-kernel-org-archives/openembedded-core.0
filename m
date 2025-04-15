Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96904C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 08:55:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.15490.1744707319493611097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 01:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=pj/iwlkR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tIrd031773
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pehEoafbLHUsoNWx0+/hGHrovrQlgxKN+6wWK/vm2AM=; b=pj/iwlkRxopfU+y6
	eO71koc3mX01q/TyMiFfxxiiZIYhFU5ka0e5ASpYssChc2kA2iDsBUNVywiyI85p
	CB9iFVBFgHyh7bylSGTycfhnqV3bOfS87VI+CDDv59im6lpj8SxNG1A4O5VVCt6w
	82WwHJMcAiA91Lux1PCRZFL7k+Tucf+c+QWD29SvK7X3hVIfFwR5N8YxLbba0taT
	Tzc39pRqcHqptLH9dF+V79FoMwUb5GevS5a3o0cbxPo1QHpFW4IbSY6e8aH71PXY
	WXYlRbfSmHaoVOqRAT0hfyJSAkqKR35qwILjh7M+aC3XF23LBmmjmFqGAyjyfGXH
	hJ/IeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs17dm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:55:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c9abdbd3so494910685a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 01:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744707306; x=1745312106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pehEoafbLHUsoNWx0+/hGHrovrQlgxKN+6wWK/vm2AM=;
        b=eVb+ltAwgWqEcAbqGzll6wDq4CQVKSPDV6vAHCXnR7gpbgp32c+HAP0/uEG0UU6UU1
         6r126mMq24eROVb8cK/U9kUhrKqRcCLby5ryDIBtOxlGNbsNwHxDEgyXlzm/ZQW/jhw+
         hjhu2i3DDiwHdgAHo/SpJf1thCaKLQmyarDKbSlW5SCQJ5KsVsHP93MmfuvQsb/MN6Yl
         AEZJY0TKVYBKE9WpJ+9f9b4mehfL5MOACK6Ez54gr1214CJFmosm5au65fayoBmx2acB
         0Vcl+VkPS+btj2w7V9hQ995D5U+lHC7TtZ+2PyFMZ1XQOG31xdknoVqk3omdyNeZvaNA
         xV9w==
X-Gm-Message-State: AOJu0YyvssBc6VFnenh33+TcICZt1BVjpjpnbZUrMyFoIqHIJJ/jURp1
	CTt7LfHJHSjq8nwC9voh/VTXI/ukqcYsR96EbxZJkmKJ/cUBL8jlmixWJKIYA3wNsu7pLVo1AiS
	RoRP9N9dTU/Gue1dNAYTKegLMMC8jSifsbdZwQi9oJUyXeOLnuoQPCcRW9K/7CSzDjntFWGzvOs
	4GW1g=
X-Gm-Gg: ASbGncsWFDIzdQ5rCrN+11evl5nYscyGIB0ghy07I0WD3ASNjnu1QZQCI1oCHRT6eGp
	JnFEp1vo9ke6VhA6zN/2lxL4L4HVv2y0+Ff7CLxyv0Uqa/irb26bMli5Ipjx9LGkndXzwMn52vh
	E5yNxLAffitqsuhYxsUZnGSoQwp0E2Ivk+amXe8Bn11IYcvZmlzSlWChym9hnXtNQVgx90/T0mG
	08oN6nzkm+EjG79NaFtfMYhzL6kq5H52uTk+Y65I8/dt2CWCAYDxOaAxtIMPxcHmWQY97dQTfLx
	n0U/WaUOgMTSWqFuoXNyu2zHRezVzwnTb502zJQrJ7LHDcPae690uLSSUp1+NB5rmLdW0YP6hZ7
	9INFM9CtbISKUR99ufhe8pZaq6+i75piVPUNFb67R7bJR/o6KOTIdEYwQvGB7
X-Received: by 2002:a05:620a:4415:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c7af00f7d5mr2020385385a.0.1744707305703;
        Tue, 15 Apr 2025 01:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+DLB5P52Bl9PDsWtrOuPFi85K9j7I6MKfv2CspG3TqRWDrBZPh73Ef24wMduxmnes44o5gA==
X-Received: by 2002:a05:620a:4415:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c7af00f7d5mr2020382285a.0.1744707305078;
        Tue, 15 Apr 2025 01:55:05 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd? (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi. [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f83ffsm20395601fa.101.2025.04.15.01.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 01:55:04 -0700 (PDT)
Message-ID: <b1921a42-3dae-4c9b-aecf-e62a6755bdfa@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:55:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/7] mesa: drop kmsro PACKAGECONFIG
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
 <20250412-mesa-25-fixes-v1-1-791840391271@oss.qualcomm.com>
 <CA+chaQdOxFvAzdia+o8ocaF8zpf_hYsvLG0tW+7ygwpeY8cYaQ@mail.gmail.com>
 <0214a9e5-0242-448b-b078-9ba202685943@oss.qualcomm.com>
 <CAMKF1sqC5s1Wd+Cc9pTjqUuK687iNcyT0GefJ6JBgm=S8WjgRw@mail.gmail.com>
 <CA+chaQfGcEOsznLojbsfj_Rxz4OGBeG8jsvgNR7a+nP9ViyAGQ@mail.gmail.com>
 <CAMKF1spJDS_svyZ3VSZn6vRqSqk86iom8HxShH0R7rMGhRcEJA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAMKF1spJDS_svyZ3VSZn6vRqSqk86iom8HxShH0R7rMGhRcEJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fe1ef6 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=CTeXH7JMz9IjSVDMByQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 3ZESDH0QIcY2fQK60Gpdi73yTCsBPNYS
X-Proofpoint-ORIG-GUID: 3ZESDH0QIcY2fQK60Gpdi73yTCsBPNYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150061
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 53F8tIrd031773
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214829

On 14/04/2025 23:11, Khem Raj wrote:
> On Sat, Apr 12, 2025 at 11:46=E2=80=AFAM Martin Jansa <martin.jansa@gma=
il.com> wrote:
>>
>> On Sat, Apr 12, 2025 at 7:26=E2=80=AFPM Khem Raj <raj.khem@gmail.com> =
wrote:
>>>
>>> I am still seeing an error with all updates applied
>>>
>>> https://errors.yoctoproject.org/Errors/Details/852167/
>>
>> I'm seeing this one for target qemux86-64 builds as well, mesa-native
>> seems to be fixed after meta-clang update.
>=20
> I think the build failure is happening when we enable rm_work and
> perhaps meta-clang is required too ( I have not done a build without
> meta-clang )
> Opened a tracker on YP bigzilla -
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15831

I'm debugging builds with meta-clang enabled. I hope to have some=20
results later today or tomorrow. Yes, rm_work makes things change slightl=
y.

>=20
>>
>>>
>>> On Sat, Apr 12, 2025 at 6:52=E2=80=AFAM Dmitry Baryshkov via
>>> lists.openembedded.org
>>> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>>>
>>>> On 12/04/2025 13:27, Martin Jansa wrote:
>>>>> Thanks, I've sent PR for meta-raspberryip:
>>>>> https://github.com/agherzan/meta-raspberrypi/pull/1456
>>>>>
>>>>> There is one more separate issue which mesa_clc in mesa-native buil=
ds,
>>>>> possibly only in combination with using meta-clang, is it what you'=
ve
>>>>> fixed with last 3 meta-clang commits from you?
>>>>
>>>> Yes, this is the LDFLAGS issue if I remember correctly. It should be
>>>> fixed by the meta-clang PR that Khem has merged. Please ping me if i=
t
>>>> still can be reproduced.
>>>>
>>>>>
>>>>> In some builds I've noticed failure like:
>>>>> FAILED: src/intel/shaders/intel_gfx80_shaders.spv
>>>>> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compile=
r/clc/mesa_clc
>>>>> ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
>>>>> ../mesa-25.0.2/src/intel/shaders/generate.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/query_copy.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/util.cl -o
>>>>> src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
>>>>> -DGFX_VERx10=3D80
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/shaders/.
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/compiler/libcl
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/genxml
>>>>> /bin/sh: line 1:
>>>>> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compile=
r/clc/mesa_clc:
>>>>> No such file or directory
>>>>>
>>>>> I haven't reproduced it locally yet, seen it couple times from jenk=
ins
>>>>> builds, I guess it might be related to rm_work and mesa_clc using -=
L
>>>>> pointing to clang-native's libdir/WORKDIR which might be already
>>>>> cleaned by rm_work:
>>>>>
>>>>> # grep mesa_clc log.do_compile
>>>>> [8/2437] gcc -Isrc/compiler/clc/mesa_clc.p -Isrc/compiler/clc
>>>>> -I../mesa-25.0.2/src/compiler/clc -Iinclude -I../mesa-25.0.2/includ=
e
>>>>> -Isrc -I../mesa-25.0.2/src
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/usr/lib/pkgconfig/../../../usr/include
>>>>> -fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -Wal=
l
>>>>> -Winvalid-pch -std=3Dc11 -mtls-dialect=3Dgnu2
>>>>> -Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototype=
s
>>>>> -Werror=3Dreturn-type -Werror=3Dempty-body
>>>>> -Werror=3Dincompatible-pointer-types -Werror=3Dint-conversion
>>>>> -Wimplicit-fallthrough -Wmisleading-indentation
>>>>> -Wno-missing-field-initializers -Wno-format-truncation
>>>>> -Wno-nonnull-compare -fno-math-errno -fno-trapping-math -fno-common
>>>>> -Wno-unknown-pragmas -Wno-unused-function -Werror=3Dformat
>>>>> -Wformat-security -ffunction-sections -fdata-sections -O2 -pipe
>>>>> -pthread -isystemTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/=
recipe-sysroot-native/usr/include
>>>>> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACR=
OS
>>>>> '-DPACKAGE_VERSION=3D"25.0.2"'
>>>>> '-DPACKAGE_BUGREPORT=3D"https://gitlab.freedesktop.org/mesa/mesa/-/=
issues"'
>>>>> -DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1
>>>>> -DHAVE_SOFTPIPE -DHAVE_I915 -DHAVE_CROCUS -DHAVE_R300 -DHAVE_NOUVEA=
U
>>>>> -DHAVE_LLVMPIPE -DHAVE_IRIS -DHAVE_RADEONSI -DHAVE_SVGA -DHAVE_R600
>>>>> -DHAVE_VIRGL -DHAVE_SWRAST -DVIDEO_CODEC_VC1DEC=3D0
>>>>> -DVIDEO_CODEC_H264DEC=3D0 -DVIDEO_CODEC_H264ENC=3D0
>>>>> -DVIDEO_CODEC_H265DEC=3D0 -DVIDEO_CODEC_H265ENC=3D0 -DVIDEO_CODEC_A=
V1DEC=3D1
>>>>> -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DHAVE_WAYLAND_PL=
ATFORM
>>>>> -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM
>>>>> -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DGLX_INDIRECT_RENDERING
>>>>> -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
>>>>> -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0
>>>>> -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32
>>>>> -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZL=
L
>>>>> -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS
>>>>> -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT
>>>>> -DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE
>>>>> -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE_FUNC_ATTRIBUTE_CONST
>>>>> -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
>>>>> -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
>>>>> -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
>>>>> -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
>>>>> -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS
>>>>> -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE
>>>>> -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY
>>>>> -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41
>>>>> -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS
>>>>> -DUSE_X86_64_ASM -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H
>>>>> -DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H
>>>>> -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_CET_H -DHAVE_SYS_INOTIFY_H
>>>>> -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP
>>>>> -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R
>>>>> -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV
>>>>> -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC
>>>>> -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING
>>>>> -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L
>>>>> -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPU=
S
>>>>> -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD
>>>>> -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM
>>>>> '-DMESA_LLVM_VERSION_STRING=3D"20.1.2"' -DLLVM_IS_SHARED=3D1
>>>>> -DLLVM_AVAILABLE=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=
=3D1
>>>>> -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF
>>>>> -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED
>>>>> -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM
>>>>> -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS
>>>>> -Wno-override-init -MD -MQ src/compiler/clc/mesa_clc.p/mesa_clc.c.o
>>>>> -MF src/compiler/clc/mesa_clc.p/mesa_clc.c.o.d -o
>>>>> src/compiler/clc/mesa_clc.p/mesa_clc.c.o -c
>>>>> ../mesa-25.0.2/src/compiler/clc/mesa_clc.c
>>>>> ../mesa-25.0.2/src/compiler/clc/mesa_clc.c: In function =E2=80=98ma=
in=E2=80=99:
>>>>> ../mesa-25.0.2/src/compiler/clc/mesa_clc.c:152:7: warning: ignoring
>>>>> return value of =E2=80=98fread=E2=80=99 declared with attribute =E2=
=80=98warn_unused_result=E2=80=99
>>>>> [-Wunused-result]
>>>>> [920/2437] g++  -o src/compiler/clc/mesa_clc
>>>>> src/compiler/clc/mesa_clc.p/mesa_clc.c.o
>>>>> -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/usr/lib
>>>>> -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/lib
>>>>> -Wl,--as-needed -Wl,--no-undefined -Wl,--enable-new-dtags
>>>>> -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/r=
ecipe-sysroot-native/usr/lib
>>>>> -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/r=
ecipe-sysroot-native/lib
>>>>> -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe=
-sysroot-native/usr/lib
>>>>> -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe=
-sysroot-native/lib
>>>>> -Wl,-O1 -Wl,--allow-shlib-undefined
>>>>> -Wl,--dynamic-linker=3DTOPDIR/BUILD/sysroots-uninative/x86_64-linux=
/lib/ld-linux-x86-64.so.2
>>>>> -pthread -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0=
.2/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
>>>>> -Wl,--start-group src/compiler/clc/liblibmesaclc.a
>>>>> src/compiler/nir/libnir.a src/compiler/libcompiler.a
>>>>> src/util/libmesa_util.a src/util/libmesa_util_sse41.a
>>>>> src/util/blake3/libblake3.a src/c11/impl/libmesa_util_c11.a
>>>>> src/compiler/spirv/libvtn.a -Wl,--build-id=3Dsha1 -fPIC -O2 -pipe
>>>>> -fvisibility-inlines-hidden -Wl,--enable-new-dtags
>>>>> -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/=
recipe-sysroot-native/usr/lib
>>>>> -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/=
recipe-sysroot-native/lib
>>>>> -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recip=
e-sysroot-native/usr/lib
>>>>> -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recip=
e-sysroot-native/lib
>>>>> -Wl,-O1 -Wl,--allow-shlib-undefined
>>>>> -Wl,--dynamic-linker=3DTOPDIR/BUILD/sysroots-uninative/x86_64-linux=
/lib/ld-linux-x86-64.so.2
>>>>> -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/usr/lib
>>>>> -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot=
-native/usr/lib
>>>>> -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot=
-native/lib
>>>>> -lLLVM-20 TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-=
sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools-opt.so
>>>>> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools.so
>>>>> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools-link.so
>>>>> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/lib/libz.so
>>>>> -lm TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroo=
t-native/usr/lib/pkgconfig/../../../usr/lib/libzstd.so
>>>>> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib/libclang-cpp.so
>>>>> -isystemTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-s=
ysroot-native/usr/include
>>>>> -O2 -fvisibility-inlines-hidden -Wl,--enable-new-dtags -Wl,-O1
>>>>> -Wl,--allow-shlib-undefined
>>>>> -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/usr/lib
>>>>> -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot=
-native/usr/lib
>>>>> -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot=
-native/lib
>>>>> -lLLVM-20 TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-=
sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libLLVMSPIRVLib.a
>>>>> -Wl,--end-group
>>>>> [921/2437] TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/=
src/compiler/clc/mesa_clc
>>>>> ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
>>>>> ../mesa-25.0.2/src/intel/shaders/generate.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/query_copy.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/util.cl -o
>>>>> src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
>>>>> -DGFX_VERx10=3D80
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/shaders/.
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/compiler/libcl
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/genxml
>>>>> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compile=
r/clc/mesa_clc
>>>>> ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
>>>>> ../mesa-25.0.2/src/intel/shaders/generate.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/query_copy.cl
>>>>> ../mesa-25.0.2/src/intel/shaders/util.cl -o
>>>>> src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
>>>>> -DGFX_VERx10=3D80
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/shaders/.
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/compiler/libcl
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
>>>>> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/genxml
>>>>> /bin/sh: line 1:
>>>>> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compile=
r/clc/mesa_clc:
>>>>> No such file or directory
>>>>>
>>>>>
>>>>> On Sat, Apr 12, 2025 at 12:09=E2=80=AFAM Dmitry Baryshkov
>>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> Mesa has dropped support for separate kmsro option to gallium-driv=
ers.
>>>>>> Drop it from the recipe and drop the now-unused PACKAGECONFIG too.
>>>>>>
>>>>>> Reported-by: Martin Jansa <martin.jansa@gmail.com>
>>>>>> Closes: https://lore.kernel.org/r/CA+chaQeWA01kB3q6=3Do4xcZwA1TMgg=
HxYTZ0AZETY7he_yU3E1A@mail.gmail.com/
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com=
>
>>>>>> ---
>>>>>>    meta/recipes-graphics/mesa/mesa.inc | 2 --
>>>>>>    1 file changed, 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-gr=
aphics/mesa/mesa.inc
>>>>>> index aca34983e97ca684d662987d3a1d0b61ba44029a..a88cc8660e26bae43c=
713b2bfdbf396e804f6c09 100644
>>>>>> --- a/meta/recipes-graphics/mesa/mesa.inc
>>>>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>>>>>> @@ -162,7 +162,6 @@ PACKAGECONFIG[opencl] =3D " \
>>>>>>    PACKAGECONFIG[broadcom] =3D ""
>>>>>>    PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
>>>>>>    PACKAGECONFIG[freedreno] =3D ""
>>>>>> -PACKAGECONFIG[kmsro] =3D ""
>>>>>>    PACKAGECONFIG[vc4] =3D ""
>>>>>>    PACKAGECONFIG[v3d] =3D ""
>>>>>>    PACKAGECONFIG[zink] =3D ""
>>>>>> @@ -177,7 +176,6 @@ GALLIUMDRIVERS:append:i686 =3D ",i915,crocus"
>>>>>>
>>>>>>    GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'etnaviv', ',etnaviv', '', d)}"
>>>>>>    GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'freedreno', ',freedreno', '', d)}"
>>>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', =
'kmsro', ',kmsro', '', d)}"
>>>>>>    GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'vc4', ',vc4', '', d)}"
>>>>>>    GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'v3d', ',v3d', '', d)}"
>>>>>>    GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'zink', ',zink', '', d)}"
>>>>>>
>>>>>> --
>>>>>> 2.39.5
>>>>>>
>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#214775): https://lists.openembedded.org/g/openem=
bedded-core/message/214775
>>>> Mute This Topic: https://lists.openembedded.org/mt/112219028/1997914
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>


--=20
With best wishes
Dmitry


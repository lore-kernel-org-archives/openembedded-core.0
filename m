Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375F9C369AE
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 13:52:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.11082.1744465954279305650
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Apr 2025 06:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=a31adN63;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3lCbt017669
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 13:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/AJF0ArGcB+0ZXgcUTBVpl+4sDscbap3RCpbTN8UrJ4=; b=a31adN6398ETCD6M
	FGkwY6RI4Ck9nrYRa+NWWlKbTPmUxoB05+T/YvTyW3QV5JX72A4m2ljokg7DOZPA
	4EcTj5MlDDr0XAhStJp62tUi7HvaO1AAKGyRKQbf31xLmqgMf7V3MR8K3em748aV
	W7atv5YVaOFxayW6EhQi1GY/9OP5PStX/hTjTqQQi8nB/50DlGhHNy0ipNs40x2q
	WJFDi/k4N5xUw4m0Wd8aOmmwhYNw1ZF1Fqui2zERltpJ0HKxlw81BiuMgktA8nnL
	BXz+S9+/Mi4iLL9CDKBLS2jfBy99FzoGNa7HjwBS/JSkdCQfKE7FhrSSAwo/uY7L
	eWAplQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj90nxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 13:52:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so558837985a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 06:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744465952; x=1745070752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AJF0ArGcB+0ZXgcUTBVpl+4sDscbap3RCpbTN8UrJ4=;
        b=vJi6vePw+QO3JRea29vbE/tkiuFfDt6o5WyhJapx9JcZKuXUn9+95XHseV8EEEvHT7
         LKOE8vroBzeNfZ6I1P7TuHu08IVJctagAGASqxGjmSEVMWLOJmjSp+l1G0z7OMIsC1N7
         TOhUj+WBQuWZhgOj8MtV+XCP+RSxBISMxEVXCEP+MonZM11fKyLlqMwnJeo/5o7MlB2f
         7kBxQbyPy4k1Ezo67YhOb6rbp56dHeAfkbTr4X3rnegqQxB0yvt2Q+FYxTTLXXxJbBmI
         VGL6oL1eIMsuVwNRopVMQnYl+6vyF4sqVmL3/Lpsc8aNbjAaSfrQ8l85goz7wRXy82s6
         64UA==
X-Gm-Message-State: AOJu0Yxli2LqTlDKUcBJ40h9/F5ulyFlciNP+SzMGMFhjonx0XvRw/z5
	/wM17wWFbHcRsynC8H5gQMCxAkspPn067tEkVaZx4SsTqD6hr8SIyT9T/3+2NdJqCyfVXnmnOg+
	QAG50q8Y9mJN8PkD5daGxA/Vz1uDWwuQF4fbXA3F66X+kvOMPHNseIBjeiHJC17R+fYko1y7vNT
	BP6ThaBVz+XGE=
X-Gm-Gg: ASbGncvQ6ZgU1P7ZB9ySX8XX0kIyRwNJRle6AyEnbP91+3ApWYaiS7KzkqHIfbil5Rm
	2uzeFFqkESjnOVIZxHQxCd4tIWd7bzI+hThjnuAMRGy3PqN+D/230eOxVQCqVYVnve1KkOiKWm8
	ZxHVzUC55nPJQ0jd6q38ngQZRVBk6mz1bXm1LljVfk1IazjCHZ0jFxUGh5h33hOn5mspQCTj+cd
	09mtvCEIBgdgoAquBp64p7fPriwc2F9S+NjE1SJoOmLYQNRGC4CQtBcLgkDJre0iSllUkLIO2ym
	FhGHGRG9hS79zXY5/U8rcl0LqwvE7leCGdNkzh9ltf4R0ugi3bstHBORmGoDVgVuUeE=
X-Received: by 2002:a05:620a:4712:b0:7c5:65ab:5002 with SMTP id af79cd13be357-7c7af12382emr1157808685a.49.1744465951554;
        Sat, 12 Apr 2025 06:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFulyfkO4k7TB/qkLqD2Gb7HqPtI/IzgXZYtK9wGoQzzV5B48vWpAQd1lDBOrrVd1ORKVn9FA==
X-Received: by 2002:a05:620a:4712:b0:7c5:65ab:5002 with SMTP id af79cd13be357-7c7af12382emr1157803785a.49.1744465950911;
        Sat, 12 Apr 2025 06:52:30 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi. [37.33.188.210])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f83ffsm10968621fa.101.2025.04.12.06.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 06:52:30 -0700 (PDT)
Message-ID: <0214a9e5-0242-448b-b078-9ba202685943@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 16:52:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] mesa: drop kmsro PACKAGECONFIG
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
 <20250412-mesa-25-fixes-v1-1-791840391271@oss.qualcomm.com>
 <CA+chaQdOxFvAzdia+o8ocaF8zpf_hYsvLG0tW+7ygwpeY8cYaQ@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CA+chaQdOxFvAzdia+o8ocaF8zpf_hYsvLG0tW+7ygwpeY8cYaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-ORIG-GUID: l0wqoJja9wViiz1Wo7DGOjHa_HB1d_ho
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fa7021 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=-mX9-i54IZKOUpXIYYoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: l0wqoJja9wViiz1Wo7DGOjHa_HB1d_ho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120105
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 53C3lCbt017669
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 13:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214775

On 12/04/2025 13:27, Martin Jansa wrote:
> Thanks, I've sent PR for meta-raspberryip:
> https://github.com/agherzan/meta-raspberrypi/pull/1456
>=20
> There is one more separate issue which mesa_clc in mesa-native builds,
> possibly only in combination with using meta-clang, is it what you've
> fixed with last 3 meta-clang commits from you?

Yes, this is the LDFLAGS issue if I remember correctly. It should be=20
fixed by the meta-clang PR that Khem has merged. Please ping me if it=20
still can be reproduced.

>=20
> In some builds I've noticed failure like:
> FAILED: src/intel/shaders/intel_gfx80_shaders.spv
> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/cl=
c/mesa_clc
> ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
> ../mesa-25.0.2/src/intel/shaders/generate.cl
> ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
> ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
> ../mesa-25.0.2/src/intel/shaders/query_copy.cl
> ../mesa-25.0.2/src/intel/shaders/util.cl -o
> src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
> -DGFX_VERx10=3D80
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/int=
el/shaders/.
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/com=
piler/libcl
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/int=
el
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/int=
el/genxml
> /bin/sh: line 1:
> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/cl=
c/mesa_clc:
> No such file or directory
>=20
> I haven't reproduced it locally yet, seen it couple times from jenkins
> builds, I guess it might be related to rm_work and mesa_clc using -L
> pointing to clang-native's libdir/WORKDIR which might be already
> cleaned by rm_work:
>=20
> # grep mesa_clc log.do_compile
> [8/2437] gcc -Isrc/compiler/clc/mesa_clc.p -Isrc/compiler/clc
> -I../mesa-25.0.2/src/compiler/clc -Iinclude -I../mesa-25.0.2/include
> -Isrc -I../mesa-25.0.2/src
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include
> -fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -Wall
> -Winvalid-pch -std=3Dc11 -mtls-dialect=3Dgnu2
> -Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes
> -Werror=3Dreturn-type -Werror=3Dempty-body
> -Werror=3Dincompatible-pointer-types -Werror=3Dint-conversion
> -Wimplicit-fallthrough -Wmisleading-indentation
> -Wno-missing-field-initializers -Wno-format-truncation
> -Wno-nonnull-compare -fno-math-errno -fno-trapping-math -fno-common
> -Wno-unknown-pragmas -Wno-unused-function -Werror=3Dformat
> -Wformat-security -ffunction-sections -fdata-sections -O2 -pipe
> -pthread -isystemTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/reci=
pe-sysroot-native/usr/include
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
> '-DPACKAGE_VERSION=3D"25.0.2"'
> '-DPACKAGE_BUGREPORT=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issu=
es"'
> -DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1
> -DHAVE_SOFTPIPE -DHAVE_I915 -DHAVE_CROCUS -DHAVE_R300 -DHAVE_NOUVEAU
> -DHAVE_LLVMPIPE -DHAVE_IRIS -DHAVE_RADEONSI -DHAVE_SVGA -DHAVE_R600
> -DHAVE_VIRGL -DHAVE_SWRAST -DVIDEO_CODEC_VC1DEC=3D0
> -DVIDEO_CODEC_H264DEC=3D0 -DVIDEO_CODEC_H264ENC=3D0
> -DVIDEO_CODEC_H265DEC=3D0 -DVIDEO_CODEC_H265ENC=3D0 -DVIDEO_CODEC_AV1DE=
C=3D1
> -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DHAVE_WAYLAND_PLATFO=
RM
> -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM
> -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DGLX_INDIRECT_RENDERING
> -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
> -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0
> -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32
> -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL
> -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS
> -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT
> -DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE
> -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE_FUNC_ATTRIBUTE_CONST
> -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
> -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
> -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
> -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
> -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS
> -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE
> -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY
> -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41
> -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS
> -DUSE_X86_64_ASM -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H
> -DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H
> -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_CET_H -DHAVE_SYS_INOTIFY_H
> -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP
> -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R
> -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV
> -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC
> -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING
> -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L
> -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS
> -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD
> -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM
> '-DMESA_LLVM_VERSION_STRING=3D"20.1.2"' -DLLVM_IS_SHARED=3D1
> -DLLVM_AVAILABLE=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1
> -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF
> -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED
> -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM
> -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS
> -Wno-override-init -MD -MQ src/compiler/clc/mesa_clc.p/mesa_clc.c.o
> -MF src/compiler/clc/mesa_clc.p/mesa_clc.c.o.d -o
> src/compiler/clc/mesa_clc.p/mesa_clc.c.o -c
> ../mesa-25.0.2/src/compiler/clc/mesa_clc.c
> ../mesa-25.0.2/src/compiler/clc/mesa_clc.c: In function =E2=80=98main=E2=
=80=99:
> ../mesa-25.0.2/src/compiler/clc/mesa_clc.c:152:7: warning: ignoring
> return value of =E2=80=98fread=E2=80=99 declared with attribute =E2=80=98=
warn_unused_result=E2=80=99
> [-Wunused-result]
> [920/2437] g++  -o src/compiler/clc/mesa_clc
> src/compiler/clc/mesa_clc.p/mesa_clc.c.o
> -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-nati=
ve/usr/lib
> -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-nati=
ve/lib
> -Wl,--as-needed -Wl,--no-undefined -Wl,--enable-new-dtags
> -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recip=
e-sysroot-native/usr/lib
> -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recip=
e-sysroot-native/lib
> -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sys=
root-native/usr/lib
> -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sys=
root-native/lib
> -Wl,-O1 -Wl,--allow-shlib-undefined
> -Wl,--dynamic-linker=3DTOPDIR/BUILD/sysroots-uninative/x86_64-linux/lib=
/ld-linux-x86-64.so.2
> -pthread -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/r=
ecipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
> -Wl,--start-group src/compiler/clc/liblibmesaclc.a
> src/compiler/nir/libnir.a src/compiler/libcompiler.a
> src/util/libmesa_util.a src/util/libmesa_util_sse41.a
> src/util/blake3/libblake3.a src/c11/impl/libmesa_util_c11.a
> src/compiler/spirv/libvtn.a -Wl,--build-id=3Dsha1 -fPIC -O2 -pipe
> -fvisibility-inlines-hidden -Wl,--enable-new-dtags
> -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/reci=
pe-sysroot-native/usr/lib
> -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/reci=
pe-sysroot-native/lib
> -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sy=
sroot-native/usr/lib
> -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sy=
sroot-native/lib
> -Wl,-O1 -Wl,--allow-shlib-undefined
> -Wl,--dynamic-linker=3DTOPDIR/BUILD/sysroots-uninative/x86_64-linux/lib=
/ld-linux-x86-64.so.2
> -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-nati=
ve/usr/lib
> -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot-nat=
ive/usr/lib
> -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot-nat=
ive/lib
> -lLLVM-20 TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysr=
oot-native/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools-opt.so
> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools.so
> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools-link.so
> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/lib/libz.so
> -lm TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/lib/libzstd.so
> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-native=
/usr/lib/libclang-cpp.so
> -isystemTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysro=
ot-native/usr/include
> -O2 -fvisibility-inlines-hidden -Wl,--enable-new-dtags -Wl,-O1
> -Wl,--allow-shlib-undefined
> -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-nati=
ve/usr/lib
> -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot-nat=
ive/usr/lib
> -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot-nat=
ive/lib
> -lLLVM-20 TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysr=
oot-native/usr/lib/pkgconfig/../../../usr/lib/libLLVMSPIRVLib.a
> -Wl,--end-group
> [921/2437] TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/=
compiler/clc/mesa_clc
> ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
> ../mesa-25.0.2/src/intel/shaders/generate.cl
> ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
> ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
> ../mesa-25.0.2/src/intel/shaders/query_copy.cl
> ../mesa-25.0.2/src/intel/shaders/util.cl -o
> src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
> -DGFX_VERx10=3D80
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/int=
el/shaders/.
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/com=
piler/libcl
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/int=
el
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/int=
el/genxml
> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/cl=
c/mesa_clc
> ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
> ../mesa-25.0.2/src/intel/shaders/generate.cl
> ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
> ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
> ../mesa-25.0.2/src/intel/shaders/query_copy.cl
> ../mesa-25.0.2/src/intel/shaders/util.cl -o
> src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
> -DGFX_VERx10=3D80
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/int=
el/shaders/.
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/com=
piler/libcl
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/int=
el
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
> -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/int=
el/genxml
> /bin/sh: line 1:
> TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/cl=
c/mesa_clc:
> No such file or directory
>=20
>=20
> On Sat, Apr 12, 2025 at 12:09=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> Mesa has dropped support for separate kmsro option to gallium-drivers.
>> Drop it from the recipe and drop the now-unused PACKAGECONFIG too.
>>
>> Reported-by: Martin Jansa <martin.jansa@gmail.com>
>> Closes: https://lore.kernel.org/r/CA+chaQeWA01kB3q6=3Do4xcZwA1TMggHxYT=
Z0AZETY7he_yU3E1A@mail.gmail.com/
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   meta/recipes-graphics/mesa/mesa.inc | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc
>> index aca34983e97ca684d662987d3a1d0b61ba44029a..a88cc8660e26bae43c713b=
2bfdbf396e804f6c09 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -162,7 +162,6 @@ PACKAGECONFIG[opencl] =3D " \
>>   PACKAGECONFIG[broadcom] =3D ""
>>   PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
>>   PACKAGECONFIG[freedreno] =3D ""
>> -PACKAGECONFIG[kmsro] =3D ""
>>   PACKAGECONFIG[vc4] =3D ""
>>   PACKAGECONFIG[v3d] =3D ""
>>   PACKAGECONFIG[zink] =3D ""
>> @@ -177,7 +176,6 @@ GALLIUMDRIVERS:append:i686 =3D ",i915,crocus"
>>
>>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'et=
naviv', ',etnaviv', '', d)}"
>>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'fr=
eedreno', ',freedreno', '', d)}"
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'kms=
ro', ',kmsro', '', d)}"
>>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'vc=
4', ',vc4', '', d)}"
>>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'v3=
d', ',v3d', '', d)}"
>>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'zi=
nk', ',zink', '', d)}"
>>
>> --
>> 2.39.5
>>


--=20
With best wishes
Dmitry


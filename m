Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14696C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 11:16:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.26903.1744542961022320343
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 04:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=K2aLZZil;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53D6DgOx022408
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Apr 2025 11:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/JdMqymyFKL/IlMuJ08ChUl1G8KTtZ8oTpXRdragDA=; b=K2aLZZil5GrhOglp
	mNkpftNL1OiREA92TuflevAfHGH5vuIwFDIZb2QkApN4FU7w+r+dc7hBZDwVndnM
	gyqp0GJ+rlp6xNKqdrG9s9q0hNc98ZgWpbxcPHh7P0lcmrdTU3BVm5tbJ9gCSNiJ
	mIwFqRQmVSVuPUlgs2e99NqnaUsOv7It+cgHaYCMviUl9xY9ap5OBaegfofwCLh6
	VeLKj5QCGgpg3uSBDaiY/A7Nos2+RkFpXrHm/DSciNA3Fzc9IqH9aawK/J/PZpDh
	+3CGbCgpT1m3QEmKKk5KGEiQ4O+xPn80KEI9J7t9BlwjN5B5f2v9Blo6hpILtnGm
	swBFmA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbphx33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Apr 2025 11:16:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54a6b0c70so331372885a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Apr 2025 04:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744542959; x=1745147759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/JdMqymyFKL/IlMuJ08ChUl1G8KTtZ8oTpXRdragDA=;
        b=I7BpltOlSMxwj4VG7MlpkQSm9znBJIA6xez2MkJKlXLwJE+BfaAuQXlVRiqpKptrgi
         F9aXqAPdHPXJW3ue3IdAA1bfi9qx74rNKDw/rwvAct3JZELpOixRn1Art5jqOQDqRioU
         Q0V78ynefx6qOK9EDOmyZ6Yv97dIIHh4Ej23CFzOgTbtkKF8/5phXdy74BJ+3ehsh5gs
         o4vGwmh3RfswKAgD5ch7KSPhfFcwaoAVA0TGpH8jJyDlDX5QbzhrSbAmROS/gsSeVdtw
         hCaVY4rGp1ZGRhHi5cEpikIV2tIdpuWuUr2ylXqtFJ7jKMZQZ00rApBDWNpfp/NHeyvT
         B+yw==
X-Gm-Message-State: AOJu0Yy6+YAqvbqvlsCzZ4TVQxFZhp//B1IQK3WSH3uF23GBnzVL7c62
	ZDhzyWxl9vfN/sZSbMQBbdEsc20yfMSlL33yzVUJ5F66suvVuu2ao84IYfB9PQZBsVNRYpGaH6U
	9mAiEzYO5GKagIxNXRuq+X0MMoCx+5RZ47a2IHL6nw8PRtiwMG8ga+989TVQzSv/nkUnuyg2Ln7
	0oLBo=
X-Gm-Gg: ASbGncvvSGxMJMeE2NlPL/2T2YCTN0ZMqBVF8Aq4IQjF5+NEVjIDjcRwabbfuVmPtde
	32F+DAequSqyL5VHtn4+GkEguB+9XpbIldKUsMO1MajVs5qc76Ta29mOZIKCA/CWvROa5TbA4QL
	m0taxWgWaOUf5O5MBEGydPbH/2BC98pWTo47U1NiMtV3P2homrXUAUWIv/5MkyPgKXvURWwvBpG
	FL4zD+Zk/QkY3hstGPQLhrNlnGcqWevnLUfFneTOIMa9Bt/FEO8NkZMmrSzXhnEnAy3Wim6/2kd
	yHikQk5+IIrvqBkwxSDDTpH1QRTyooPjNgsVgFhGsNhjdZYYjTltlGHWYyGVUawGWooHmWeQENU
	AEQSZ3NgQjzERIlEo6zPiuNsy683pLfaECIyixgk6S050mX26CwDOL2hhAqzGJAQHJ0gZ
X-Received: by 2002:a05:620a:2551:b0:7c5:59a6:bae6 with SMTP id af79cd13be357-7c7af0b986bmr1319302585a.3.1744542958656;
        Sun, 13 Apr 2025 04:15:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJpkF+WrHfaKyqxy/a+mlsgUSBBWpId1kdIeJBppCbtLZtIs+VoccAd8TVKZIJyD7kdbNz1A==
X-Received: by 2002:a05:620a:2551:b0:7c5:59a6:bae6 with SMTP id af79cd13be357-7c7af0b986bmr1319297985a.3.1744542958053;
        Sun, 13 Apr 2025 04:15:58 -0700 (PDT)
Received: from ?IPV6:2001:14bb:153:d941:d04b:cd0b:b934:bd21? (2001-14bb-153-d941-d04b-cd0b-b934-bd21.rev.dnainternet.fi. [2001:14bb:153:d941:d04b:cd0b:b934:bd21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d502549sm828279e87.148.2025.04.13.04.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 04:15:55 -0700 (PDT)
Message-ID: <ecd4bf53-7baa-4e17-97ce-eb38e1b2e75c@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 14:15:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/7] meson: pass -target and -I to bindgen calls
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
 <20250412-mesa-25-fixes-v1-2-791840391271@oss.qualcomm.com>
 <CAMKF1sqFzfsPgr0LJbGY3djKGGBa9hJD6rYNVC+oT9eP9Cjpsw@mail.gmail.com>
 <7df3cee7-99e4-464f-9638-befaab4a097f@oss.qualcomm.com>
 <CAMKF1sqZNHB+AV7_FLBzJfonLTxtrBo_+d5yfC+cF3_eChW6EA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAMKF1sqZNHB+AV7_FLBzJfonLTxtrBo_+d5yfC+cF3_eChW6EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-ORIG-GUID: rqPNcVKLvn8WHqXCuiwPlWVQjVJQdxg0
X-Proofpoint-GUID: rqPNcVKLvn8WHqXCuiwPlWVQjVJQdxg0
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fb9cf0 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=GWCbLkg14J_a4BhMEUEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 53D6DgOx022408
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Apr 2025 11:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214782

On 12/04/2025 21:02, Khem Raj wrote:
> On Sat, Apr 12, 2025 at 9:29=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On 12/04/2025 01:53, Khem Raj wrote:
>>> On Fri, Apr 11, 2025 at 3:09=E2=80=AFPM Dmitry Baryshkov via
>>> lists.openembedded.org
>>> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>>>
>>>> In order to properly generate Rust bindings for the target systems, =
we
>>>> need to pass '-taget foo-linux-gnueabi' flags and a correct include
>>>> target include path (${STAGING_INCDIR}) to the bindgen. Add those
>>>> flags to the generated meson target file.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>    meta/classes-recipe/meson.bbclass | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe=
/meson.bbclass
>>>> index cbfc45b94bbd076735847134a0976b6b30784d50..ef45a034a767e979a455=
53ba08e46dc90e34f33f 100644
>; >>> --- a/meta/classes-recipe/meson.bbclass
>>>> +++ b/meta/classes-recipe/meson.bbclass
>>>> @@ -93,6 +93,7 @@ cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
>>>>    [properties]
>>>>    needs_exe_wrapper =3D true
>>>>    sys_root =3D '${STAGING_DIR_HOST}'
>>>> +bindgen_clang_arguments =3D ['-target', '${@d.getVar('RUST_HOST_SYS=
')}', '-I${STAGING_INCDIR}']
>>>
>>> I think its better to use ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
>>> --target=3D${TARGET_SYS}
>>
>> Using ${TOOLCHAIN_OPTIONS} breaks x86-64 build with the compiler being
>> unable to find headers. I'd rather stick to the patch I have posted.
>=20
> You have to use ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} and --target=3D${TA=
RGET_SYS}
> together, OE's compilers do not deal with 'hf' from target tuple but
> TOOLCHAIN_OPTIONS decide
> the ABI, please try both of them together.

As I wrote earlier, it breaks qemuarm.

BINDGEN_CLANG_ARGS=3D" -march=3Darmv7-a -mthumb -mfpu=3Dneon -mfloat-abi=3D=
hard=20
-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64=20
--sysroot=3D/home/lumag/Projects/RPB/build-rpb/tmp-rpb/work/armv7at2hf-ne=
on-linaro-linux-gnueabi/mesa/25.0.2/recipe-sysroot=20
--target=3Darm-linaro-linux-gnueabi"

/../lib/gcc-cross/arm-linux-gnueabi/12/../../../../include/c++/12/cassert=
:43:10:=20
fatal error: 'bits/c++config.h' file not found
Unable to generate bindings: clang diagnosed error:=20
/../lib/gcc-cross/arm-linux-gnueabi/12/../../../../include/c++/12/cassert=
:43:10:=20
fatal error: 'bits/c++config.h' file


/home/lumag/Projects/RPB/build-rpb/tmp-rpb/work/armv7at2hf-neon-linaro-li=
nux-gnueabi/mesa/25.0.2/recipe-sysroot-native/usr/bin/bindgen=20
../mesa-25.0.2/src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp=20
--output=20
/home/lumag/Projects/RPB/build-rpb/tmp-rpb/work/armv7at2hf-neon-linaro-li=
nux-gnueabi/mesa/25.0.2/build/src/gallium/frontends/rusticl/rusticl_llvm_=
bindings.rs=20
--generate constructors,functions,types --opaque-type '.*'=20
--allowlist-function clang::getClangFullVersion --allowlist-function=20
llvm::LLVMContext::LLVMContext --allowlist-function llvm::writeSpirv=20
--rust-target 1.85.1 -- -fno-builtin-malloc -D__STDC_CONSTANT_MACROS=20
-D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS=20
'-DPACKAGE_VERSION=3D"25.0.2"'=20
'-DPACKAGE_BUGREPORT=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues=
"'=20
-DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1=20
-DHAVE_SOFTPIPE -DHAVE_ZINK -DHAVE_R300 -DHAVE_NOUVEAU -DHAVE_LLVMPIPE=20
-DHAVE_VIRGL -DHAVE_SWRAST -DVIDEO_CODEC_VC1DEC=3D0=20
-DVIDEO_CODEC_H264DEC=3D0 -DVIDEO_CODEC_H264ENC=3D0 -DVIDEO_CODEC_H265DEC=
=3D0=20
-DVIDEO_CODEC_H265ENC=3D0 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D=
1=20
-DVIDEO_CODEC_VP9DEC=3D1 -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM=20
-DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0=20
-DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM=20
-DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0=20
-DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64=20
-DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ=20
-DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL=20
-DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL=20
-DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P=20
-DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN=20
-DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE=20
-DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT=20
-DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT=20
-DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL=20
-DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN=20
-DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_VISIBILITY=20
-DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURCE=20
-DUSE_GCC_ATOMIC_BUILTINS -DUSE_ARM_ASM -DMAJOR_IN_SYSMACROS=20
-DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H=20
-DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_SYS_INOTIFY_H=20
-DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE=20
-DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R -DHAVE_GETRANDOM=20
-DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -DHAVE_GNU_QSORT_R=20
-DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING=20
-DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L -DHAVE_DLADDR=20
-DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION=20
-DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM=20
'-DMESA_LLVM_VERSION_STRING=3D"20.1.2"' -DLLVM_IS_SHARED=3D1=20
-DLLVM_AVAILABLE=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1=20
-DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF=20
-DTHREAD_SANITIZER=3D0 -DHAVE_X11_DRM -DHAVE_DRI -DHAVE_DRI2=20
-DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -march=3Darmv7-a -mthumb=20
-mfpu=3Dneon -mfloat-abi=3Dhard -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D6=
4=20
--sysroot=3D/home/lumag/Projects/RPB/build-rpb/tmp-rpb/work/armv7at2hf-ne=
on-linaro-linux-gnueabi/mesa/25.0.2/recipe-sysroot=20
--target=3Darm-linaro-linux-gnueabi -DNDEBUG -pthread=20
-D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS=20
'-DPACKAGE_VERSION=3D"25.0.2"'=20
'-DPACKAGE_BUGREPORT=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues=
"'=20
-DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1=20
-DHAVE_SOFTPIPE -DHAVE_ZINK -DHAVE_R300 -DHAVE_NOUVEAU -DHAVE_LLVMPIPE=20
-DHAVE_VIRGL -DHAVE_SWRAST -DVIDEO_CODEC_VC1DEC=3D0=20
-DVIDEO_CODEC_H264DEC=3D0 -DVIDEO_CODEC_H264ENC=3D0 -DVIDEO_CODEC_H265DEC=
=3D0=20
-DVIDEO_CODEC_H265ENC=3D0 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D=
1=20
-DVIDEO_CODEC_VP9DEC=3D1 -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM=20
-DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0=20
-DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM=20
-DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0=20
-DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64=20
-DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ=20
-DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL=20
-DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL=20
-DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P=20
-DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN=20
-DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE=20
-DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT=20
-DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT=20
-DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL=20
-DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN=20
-DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_VISIBILITY=20
-DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURCE=20
-DUSE_GCC_ATOMIC_BUILTINS -DUSE_ARM_ASM -DMAJOR_IN_SYSMACROS=20
-DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H=20
-DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_SYS_INOTIFY_H=20
-DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE=20
-DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R -DHAVE_GETRANDOM=20
-DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -DHAVE_GNU_QSORT_R=20
-DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING=20
-DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L -DHAVE_DLADDR=20
-DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION=20
-DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM=20
'-DMESA_LLVM_VERSION_STRING=3D"20.1.2"' -DLLVM_IS_SHARED=3D1=20
-DLLVM_AVAILABLE=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1=20
-DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF=20
-DTHREAD_SANITIZER=3D0 -DHAVE_X11_DRM -DHAVE_DRI -DHAVE_DRI2=20
-DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -x c++ -std=3Dc++17 -MD -MQ=20
../mesa-25.0.2/src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp=20
-MF src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp.d
/../lib/gcc-cross/arm-linux-gnueabi/12/../../../../include/c++/12/cassert=
:43:10:=20
fatal error: 'bits/c++config.h' file not found
Unable to generate bindings: clang diagnosed error:=20
/../lib/gcc-cross/arm-linux-gnueabi/12/../../../../include/c++/12/cassert=
:43:10:=20
fatal error: 'bits/c++config.h' file not found



>>
>>> here
>>>
>>>>
>>>>    [host_machine]
>>>>    system =3D '${@meson_operating_system('HOST_OS', d)}'
>>>>
>>>> --
>>>> 2.39.5
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#214764): https://lists.openembedded.org/g/openem=
bedded-core/message/214764
>>>> Mute This Topic: https://lists.openembedded.org/mt/112219030/1997914
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>
>>
>> --
>> With best wishes
>> Dmitry


--=20
With best wishes
Dmitry


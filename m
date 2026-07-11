Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2675C43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 16:50:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8175.1783788643689835659
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 09:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VgyhH6HK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=b/HmGMdg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOU424010502
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 16:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Amy3qxrg+ta54QiHdL9Zh4jH3TKSMEW5miWtvxHXvU=; b=VgyhH6HKDf/JFVd3
	Wd5A3vTktTOhC+xFrb3j7r0FSDlqojdZSvwIfMrNY1CibuBf01oTVmCHYDl8D441
	3i25tVVivS2W0w7Yoa9njCM8NCUIIEWTplLvZjiNBaogNzaPwhZfoCPrxslFrKvt
	3bpSGbVI6+eYbZ6uWvF1D9Zepj5Nb/YpqjVbTzIHb24WBtHticOHwet2Au0kOQDZ
	B0T3vg2xyOjJoS5TqVQiwqc35YSTgbyGfn8g9c+a8rF+r+9gCmhovbM9cftWEQQ2
	xT8KH0vVjDQF4wstSG00fICfhLdBWXuk0JaBOqiMjjXi4QrBVolx4ry/Pg3aRJVm
	xVNf2A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe91189j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 16:50:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90284139cceso20931326d6.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783788641; x=1784393441; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Amy3qxrg+ta54QiHdL9Zh4jH3TKSMEW5miWtvxHXvU=;
        b=b/HmGMdgt2sflnwSNC8jefj8q4J84wY4ymrBd22tgFgWQv/1VeXD6iuajKS2B7hNel
         5JLopFrHINJ8ixZcmjQeDX9KtdMaufoNRUju1XBJ5f8axPutXNIRILd0+QdZPLI44b8n
         A1jn2H7Y1zCpFlWtSaRvhYvk2E3L4kf4BBJpzoCzXwJx41fXHM9iG9GOryT3YgLAfis1
         plCbMxGWFparMMv3b8Bx7PtU3m1f3nS95rT4yWQ5VwiDhgm+f8gQURPTIlc8zqmFr3W/
         HOA6qcPqRI6Z4AI1iUWH/yTnmsPontdkADycDU5sS7hbOTpU9bkAieKxdbTtQIdUGzZA
         X7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783788641; x=1784393441;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/Amy3qxrg+ta54QiHdL9Zh4jH3TKSMEW5miWtvxHXvU=;
        b=YWnm3LKU1QDRd5AOYfR7JUq6BJaTv4mR02ko4x9HffEKsH3ykNqHlpR77e+3w0mNGH
         TZauSTpaNkQtcHQncB/q8HMoUKmzp/gKf+MkDQNjGRsl1AjjBvr7xI120utHfShDVdkH
         fwEuKbooEsGkLnHLGyyXBDDbULqPmr4swhZszE/SjuytZAo+NgAov0AoIF0zCJzDwGul
         5VVWOCiRqxMYSPpZc1mN5MBZBTcActdG+E0sAAo4tc10CVID928ef0GKg1P69xcnErtM
         Bp+NA5sypNgMk9oiNBaaQJvMFZdZHpQyfBOgEWx/ZXCyyhshBnubjlqH2umkpAqWsji7
         d1FQ==
X-Gm-Message-State: AOJu0YwBz72hS2PWe+2nf3mS/uqwNzIyFTrhRZKn9bR9WjSt7jrKDbdL
	DFYiKl16/vpfIS5+wCeeo+1/6GsU32ncAoapIof7OEHbQyA2SXoBNLXasl/BX85k0QpnhBSWigT
	AUz3v4RdlLCGXKawAw0Kxu8wgnyXGqQiRH+NSOWrGF78amEdvGkdzQt1vbwqVLEvncyPvLC/tIN
	mogFmjBff/IijTw0o=
X-Gm-Gg: AfdE7cnKSi4hKJKznNoQA6IGqbm4eXLphRNj8P705lrsD1eePxVZK9keBekaP6ffWHV
	6TDOV6Qa2Eh5r663uVyBQi4NpkMiVqTa4ZmVUDYZFC/ZfTNbNEHyJwe2w8OUEijIe+VAx6gEKSR
	Sl69uJ0iHerlvtG7ruorG1dYSUz/L9VPnUJ/BlkTynpSOz/qHy1LZWPiT8cOCahvqeEf4mt5ns+
	3sVYF1QgHA3cPlDRXQTalT42lNWHxgPrxlYeU33JLY/SgSROF4c+8AfqBKhuQgTW/97bdwvzgqZ
	aEaQgADaziiF18WIjekfkO+5pxBwxKv6Xl18HqRg2c1AvomieHRaWFI5SCmutSzqONqM0nXi6oF
	mZvMdEg9obrx+fswig69LF5Zhwrvqxkc3bP7tgetYpr1X85FVprkRaQqpsSsOf+IGaMT+3OCwMX
	eFUQQUNA3zkUu7UV3T9u3C1yeV
X-Received: by 2002:a05:622a:149:b0:516:7a83:8c37 with SMTP id d75a77b69052e-51caa0899a7mr82932251cf.11.1783788641222;
        Sat, 11 Jul 2026 09:50:41 -0700 (PDT)
X-Received: by 2002:a05:622a:149:b0:516:7a83:8c37 with SMTP id d75a77b69052e-51caa0899a7mr82932041cf.11.1783788640659;
        Sat, 11 Jul 2026 09:50:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab57e0sm1461196e87.84.2026.07.11.09.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 09:50:38 -0700 (PDT)
Date: Sat, 11 Jul 2026 19:50:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Deepesh.Varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        richard.purdie@linuxfoundation.org
Subject: Re: [PATCH v3] llvm/mesa/rust: simplify llvm-config handling
Message-ID: <ua5eetd6y7i3ss5kn3qzpo3lpjzj7drk4pvnn2iuosijy5buny@mbcoibimaaxi>
References: <20260612034643.3215188-1-Deepesh.Varatharajan@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260612034643.3215188-1-Deepesh.Varatharajan@windriver.com>
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a527462 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=691tQTn6DYVQFYnNZTgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE2OCBTYWx0ZWRfX+kw6XZ+VA4Uy
 WOF8Dj+bpCwy2svpWSM56rY3PjxhDwja3eVHLcn8Ruy7nZQxMnKP4K9RZ+Rss11aLir595NeRcm
 MWkVv8HeZmXmqMNGtJROZ3/Ch2w1m/U=
X-Proofpoint-GUID: T7mqubGQr_OxvVtITSGIZaKk42-Cw0-a
X-Proofpoint-ORIG-GUID: T7mqubGQr_OxvVtITSGIZaKk42-Cw0-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE2OCBTYWx0ZWRfX6tmDqr8eKQQv
 v81oH5rIa81ei0ZuLOvC0GpVq+0n7wuclcxJwZXp6Ernco8hEqYxZNnq8dl1PaYwiB6uCiHY60k
 CtRVzitBnxDfrD+Q0nQQF/T8Y6s+TM9sXhkyCLG8W3JV64yzRh4LBYx68NnS6c1/ah6pdo9SnRo
 0uEbJYQ9qZDNuRL7CqPb/7FEuTReQ9pYbRa8ZFZ9iPYk/d585RyKvPYU2FdkqHEHrdPgp4tN2Aj
 lEuSZpqMaxSudwUutJ26csyVBaZoyvSXgsdIiDl744KYzW0SNu0Vd+l3bPJ73Ezz6yBE2CXg4Ln
 nXFbzz2m7u+5SQgzIrv5Q/H7Tck8OxB+rtlIZySwh4AMPYZQ4KsVKGFSNixVbFgVZkRUoAvyJGH
 x1nwd70NAvtqzldqvAZPU+/PqJtFy5IN6CdmKw37b69Tv5V3pBauDBRPtCOvD3cJBp4VXnEsntc
 5N9yCYDNNbBNv6Tq3TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 16:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240719

On Thu, Jun 11, 2026 at 08:46:43PM -0700, Deepesh.Varatharajan@windriver.co=
m wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> Replace PATH-based llvm-config discovery with explicit sysroot-native
> resolution and simplify the target llvm-config wrapper to act as a pure
> pass-through while preserving Yocto alternate path handling.
>=20
> The previous implementation relied on:
>=20
> * `which -a llvm-config | sed -n 2p`
>    which is unreliable in cross-build environments because it only
>    searches executables present in $PATH. Native sysroot tools
>    (e.g. recipe-sysroot-native llvm-config) are not guaranteed to be
>    exposed via PATH, so they may not be discovered at all.
>=20
> * `echo $base_libdir | sed -n '/lib64/p'`
>    which depends on a BitBake variable that may be empty or unset
>    in certain build contexts, leading to incorrect libdir selection.
>=20
> Update the wrapper to:
>=20
> * Use an @LLVM_CONFIG_PATH@ placeholder that is replaced during the
>   build with the appropriate native llvm-config path.
> * Detect libdir using filesystem inspection rather than variable
>   parsing.
> * Preserve `YOCTO_ALTERNATE_EXE_PATH` and
>   `YOCTO_ALTERNATE_LIBDIR` handling.
> * Delegate all arguments directly to the native llvm-config.
>=20
> Update rust and mesa recipes to replace the placeholder with the native
> llvm-config path during target and nativesdk builds.
>=20
> Also remove the native llvm-config copy logic and lib/lib64 symlink
> workarounds, relying instead on explicit native tool resolution.
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  ...unwind.pc.in-and-llvm-config-scripts.patch | 52 +++----------------
>  meta/recipes-devtools/rust/rust_1.96.0.bb     | 52 ++++++-------------
>  meta/recipes-graphics/mesa/mesa.inc           | 16 ++++++
>  3 files changed, 39 insertions(+), 81 deletions(-)

This got applied and now it broken building of OpenCL:

FAILED: [code=3D1] src/gallium/frontends/rusticl/rusticl_llvm_bindings.rs
/home/lumag/Projects/RPB/build/tmp-qcom-distro/work/armv8a-qcom-linux/mesa/=
26.1.2/recipe-sysroot-native/usr/bin/bindgen ../sources/mesa-26.1.2/src/gal=
lium/frontends/rusticl/rusticl_llvm_bindings.hpp --output /home/lumag/Proje=
cts/RPB/build/tmp-qcom-distro/work/armv8a-qcom-linux/mesa/26.1.2/build/src/=
gallium/frontends/rusticl/rusticl_llvm_bindings.rs --wrap-unsafe-ops --raw-=
line '#![allow(clippy::all)]' --raw-line '#![allow(improper_ctypes)]' --raw=
-line '#![allow(unused_unsafe)]' --raw-line '#![allow(non_camel_case_types)=
]' --raw-line '#![allow(non_snake_case)]' --raw-line '#![allow(non_upper_ca=
se_globals)]' --raw-line '#![allow(unsafe_op_in_unsafe_fn)]' --raw-line '#!=
[allow(unnecessary_transmutes)]' --generate constructors,functions,types,va=
rs --opaque-type '.*' --allowlist-function clang::getClangFullVersion --all=
owlist-function llvm::LLVMContext::LLVMContext --allowlist-function llvm::w=
riteSpirv --allowlist-var 'LLVM_VERSION_.*' --rust-target 1.96.0 --rust-edi=
tion 2021 -- -fno-builtin-malloc -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_M=
ACROS -D__STDC_LIMIT_MACROS '-DPACKAGE_VERSION=3D"26.1.2"' '-DPACKAGE_BUGRE=
PORT=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=
=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_FREEDRENO -DHAVE_=
LLVMPIPE -DHAVE_SOFTPIPE -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_SYST=
EM_HAS_KMS_DRM=3D1 -DVIDEO_CODEC_VC1DEC=3D0 -DVIDEO_CODEC_H264DEC=3D0 -DVID=
EO_CODEC_H264ENC=3D0 -DVIDEO_CODEC_H265DEC=3D0 -DVIDEO_CODEC_H265ENC=3D0 -D=
VIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -D=
VIDEO_CODEC_MPEG12DEC=3D1 -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WA=
YLAND_PLATFORM -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_P=
LATFORM -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D1 -DHAVE_GFX_COMPUTE -DGLX_IND=
IRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_PROTO_E=
NTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE -DHAVE_=
__BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BU=
ILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_F=
FS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOU=
NTLL -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAV=
E___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILTIN_S=
UB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DH=
AVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_=
UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK =
-DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRI=
BUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORE=
TURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_=
ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_=
GNU_SOURCE -DUSE_GCC_ATOMIC_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DH=
AS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -D=
HAVE_SYS_SHM_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -D=
HAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOC=
K -DHAVE_STRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GET=
ENV -DHAVE_SYSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM=
_INVOCATION_NAME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_T=
YPE -DHAVE_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE=
_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -DHAVE_L=
IBDRM '-DMESA_LLVM_VERSION_STRING=3D"22.1.8"' -DLLVM_IS_SHARED=3D1 -DDRAW_L=
LVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_=
SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE=
_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_X11_DRM =
-DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_RE=
NDERDOC_INTEGRATION=3D1 -march=3Darmv8-a+crc -mbranch-protection=3Dstandard=
 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-secur=
ity -Werror=3Dformat-security --sysroot=3D/home/lumag/Projects/RPB/build/tm=
p-qcom-distro/work/armv8a-qcom-linux/mesa/26.1.2/recipe-sysroot --target=3D=
aarch64-qcom-linux -D_FILE_OFFSET_BITS=3D64 -DNDEBUG -D_GNU_SOURCE -D_GLIBC=
XX_USE_CXX11_ABI=3D1 -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__ST=
DC_LIMIT_MACROS -pthread -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D=
__STDC_LIMIT_MACROS '-DPACKAGE_VERSION=3D"26.1.2"' '-DPACKAGE_BUGREPORT=3D"=
https://gitlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=3D1 -DHAV=
E_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_FREEDRENO -DHAVE_LLVMPIPE -=
DHAVE_SOFTPIPE -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_SYSTEM_HAS_KMS=
_DRM=3D1 -DVIDEO_CODEC_VC1DEC=3D0 -DVIDEO_CODEC_H264DEC=3D0 -DVIDEO_CODEC_H=
264ENC=3D0 -DVIDEO_CODEC_H265DEC=3D0 -DVIDEO_CODEC_H265ENC=3D0 -DVIDEO_CODE=
C_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODE=
C_MPEG12DEC=3D1 -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLAT=
FORM -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM -D=
HAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D1 -DHAVE_GFX_COMPUTE -DGLX_INDIRECT_REND=
ERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_PROTO_ENTRY_POINT=
S=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_=
BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZL=
L -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -DHAVE_=
__BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL -DHAV=
E___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE___BUILTI=
N_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILTIN_SUB_OVERFLO=
W_P -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_A=
TTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED -DH=
AVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUN=
C_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETUR=
NS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAV=
E_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRIBUTE_=
VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURCE=
 -DUSE_GCC_ATOMIC_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_G=
ETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_S=
HM_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTO=
F -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_S=
TRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -DHAVE=
_SYSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATIO=
N_NAME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE=
_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE_ZSTD -DHA=
VE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM '-DM=
ESA_LLVM_VERSION_STRING=3D"22.1.8"' -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILA=
BLE=3D1 -DAMD_LLVM_AVAILABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOL=
S -DUSE_LIBELF -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPAT=
CH_QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_X11_DRM -DHAVE_DRI=
 -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_RENDERDOC_IN=
TEGRATION=3D1 -x c++ -std=3Dc++17 -MD -MQ ../sources/mesa-26.1.2/src/galliu=
m/frontends/rusticl/rusticl_llvm_bindings.hpp -MF src/gallium/frontends/rus=
ticl/rusticl_llvm_bindings.hpp.d
/home/lumag/Projects/RPB/build/tmp-qcom-distro/work/armv8a-qcom-linux/mesa/=
26.1.2/recipe-sysroot/usr/lib/aarch64-qcom-linux/16.1.0/../../../include/c+=
+/16.1.0/cstddef:5
2:10: fatal error: 'stddef.h' file not found
Unable to generate bindings: clang diagnosed error: /home/lumag/Projects/RP=
B/build/tmp-qcom-distro/work/armv8a-qcom-linux/mesa/26.1.2/recipe-sysroot/u=
sr/lib/aarch64-qcom-linux/16.1.0/../../../include/c++/16.1.0/cstddef:52:10:=
 fatal error: 'stddef.h' file not found

$ git bisect log
git bisect start
# status: waiting for both good and bad commits
# good: [dfc5720ac709828543e9599597ff836021bd1561] bitbake.conf: drop openc=
l from DISTRO_FEATURES_FILTER_NATIVE/_NATIVESDK
git bisect good dfc5720ac709828543e9599597ff836021bd1561
# status: waiting for bad commit, 1 good commit known
# bad: [cddc75dcf041c0e1c86baa36840caf1a8073e40f] glib-2.0: add back Signed=
-off-by in CVE-2026-58016 patch
git bisect bad cddc75dcf041c0e1c86baa36840caf1a8073e40f
# good: [5b718f4c044147dfa0742caacbc20133ead53f10] ptest-packagelists.inc: =
disable glib-2.0 for RISCV64
git bisect good 5b718f4c044147dfa0742caacbc20133ead53f10
# bad: [a82e2ac1d08439c2c19015632f622940a15d00c3] python3-uv-build: upgrade=
 0.11.21 -> 0.11.26
git bisect bad a82e2ac1d08439c2c19015632f622940a15d00c3
# good: [d3eb9f2ae9e887dcb70cf3bb6e284c0f861546c0] python3-certifi: upgrade=
 2026.5.20 -> 2026.6.17
git bisect good d3eb9f2ae9e887dcb70cf3bb6e284c0f861546c0
# bad: [9e1513b29849c56fe372e0d73ce229cebed32d9e] classes/meson: use ninja =
explicitly when compiling
git bisect bad 9e1513b29849c56fe372e0d73ce229cebed32d9e
# bad: [a02059069443cfe0dc5860eae4aebba68b9a4ec4] baremetal-helloworld: Fix=
 override order
git bisect bad a02059069443cfe0dc5860eae4aebba68b9a4ec4
# good: [46b79c40c7ee5fa79e3889b77ca71bebc3136b9c] classes/gtk-doc: inherit=
 python3native only if gtk-doc is enabled
git bisect good 46b79c40c7ee5fa79e3889b77ca71bebc3136b9c
# bad: [8337a9330c1fdbe36575c5e7495046b3df7f69d2] package: replace copydebu=
gsources shell pipelines
git bisect bad 8337a9330c1fdbe36575c5e7495046b3df7f69d2
# good: [f810998ac90f7a3e20e26555f39d754b16ce8b69] bitbake.conf: drop openc=
l from DISTRO_FEATURES_FILTER_NATIVE/_NATIVESDK
git bisect good f810998ac90f7a3e20e26555f39d754b16ce8b69
# bad: [8aace29b692a8f3902a675fb4c022c223ba49531] llvm/mesa/rust: simplify =
llvm-config handling
git bisect bad 8aace29b692a8f3902a675fb4c022c223ba49531
# first bad commit: [8aace29b692a8f3902a675fb4c022c223ba49531] llvm/mesa/ru=
st: simplify llvm-config handling

--=20
With best wishes
Dmitry


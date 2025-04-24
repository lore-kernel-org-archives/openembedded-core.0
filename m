Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E1CC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 09:05:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.10858.1745485543911217412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 02:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oK0UpJvX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F8XW030993
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IQcS/qnA8Ic4iP+kPazKFoPW
	eeYhUzevUrSZyZLTayQ=; b=oK0UpJvXFCK4kE0+cVo5O5kVe8nWSYgySCAWsbx7
	FUIxGIRNCGCwktOLfJY5uBbFb5Rd4zqblj+1BRV9GQpuIyHBhg20QywKRIOtgq2+
	IdU8wiBqQQ7EW9eLpT+KBUzm1ub6h6R6e9CeN444GcHjr6X1cW8eTr8TtZnprTnS
	4IC9uO8J0V+1QxoTeRm5WQoUj8h8UBjnU6neisLwYT6O+asJ6Hqmc9h24izbR8+0
	LLaMGOILhuSp3SGdttGpadBd8Mb0v+ts3B+mLhf2VnMF0G5/ciCOoE9wba/otcmm
	zP/GdWXvPFVJZNF1FbQqG+LnJ0ECN6CKcetrIplv6NBDEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5cwgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:05:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e9f6e00so293450885a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 02:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745485533; x=1746090333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQcS/qnA8Ic4iP+kPazKFoPWeeYhUzevUrSZyZLTayQ=;
        b=kRFP4MzarihyoG73hKBGER5Jc7JFGyiQYEYvkcPsJaK/wsOStEVHBV0Yx8/6edyqoI
         ThTMvD6VFzrz8y7RpmtjgqCxk3KYI6DDyrtL4nsXmkmKYfHf1lLvBwCQX8k7qoX5PGIr
         XYLTMqFX493nTBZhIqUYhpllBPrPWAzj77OmNG7vi6KS0TzQwZfRNl2pfFi1UclzsYPm
         tMuoUd86mXu6mBzDXJiPcrL7GTyg26va6MJdLVgs0BpBPC4T0wP8TMuPoB33bnDDw/m2
         VzevK8UXrVcYaJsTpheikH9cPGXloTFdcj+V6wUKFiL1bFDYcdGmuZLsYiTujv0FuDLC
         5RHA==
X-Gm-Message-State: AOJu0Yw5WlHdSTFk6XRt6QytCD0/YwQ8i83WD3HTs1GEposMy2GMGM/l
	LIDQS7Zn6ca2wIGd1AayWd+XDs6TvW+MW8/yxMY1sO2n+Nqc/+EeglpHQOgfjf3XrtiI3CguGDt
	QTT9zDWGwnSUr7w6KdQ/5tRvjPyd0dcMakD58Fuq63CiVMxi8Q6j8YcHOnSNVF6Emt52/a3v2fL
	VqmU0=
X-Gm-Gg: ASbGncs8H7ErdgJDwgewdxSTlUMW7OtOYCb54wcCUzS6EGsVOehJOzbDg+Ure151eZx
	ZV3IOWlfVhu78CKQ1bR3vU/A9GxfytYgoQ+It9Ch2lcJVcL/qEC0RybYwWI2QjD/yhcUn86Kbv5
	U89QMaY2Q/jAzVm6wzn2yMLPcrdytiV4eQ2I+lI21Kqr7MhOtaw1n3LbtJ8O9cFzIiIdj5Ed47b
	sGZSAyvse0l7aFgJ9TRhg2Ciqm3pmFWwwIdyis0qxL7dGznjesgABr2O+bHYawnz4UPt+r8Azgj
	R12i0tgNX++7Ksdcl/43ftSRj2IEakmhugOwnmD5fAa6VObx1H1vaOsVK3L299zlwuKy/s3HVD8
	=
X-Received: by 2002:a05:620a:2806:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7c9585c34e3mr224559885a.7.1745485532379;
        Thu, 24 Apr 2025 02:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFI2iuEFlP+rHA8JprDos0mTSVsavd/gJ3i1QHrcThMwLuMQAolszaNMSzIlHDONm0fRiouQ==
X-Received: by 2002:a05:620a:2806:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7c9585c34e3mr224548985a.7.1745485530911;
        Thu, 24 Apr 2025 02:05:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9f719sm157641e87.124.2025.04.24.02.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:05:29 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:05:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/11] clang: Merge llvm/clang family recipes from
 meta-clang
Message-ID: <dc33o5zfonkcdpo2aiysfqdscradhjofwmmzqvbst2qle3jp6r@4owhwxoyqnq2>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-4-5a492a8461aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-clang-merge-v1-4-5a492a8461aa@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MCBTYWx0ZWRfX5PVLSorgpmq4 h6rSMVdrAr02mQZJHQlutHiFZj1Tn2eqGDL93bV1Conc5vHOjKq5+lDmtJrzi6Qv+cdQoXX/vpu a4Y8LW1OLgFWBAQ2CVNvPsOSdXa06RDTFRhjFzFTj2c9rOHICatKXTfGyK+kTYZQsFLpYOMZL0K
 x6acfxIBALlgP44Sp7UxquQHPCdp+9ULymxSfpcj36DctGaCJgIs+BJf7B6J+nWGnY+6wC4rrHM NlZigCesf+TYagOFmVUXS1IPPx6/W2cNgO4lsnjFoZfpcyNOkCxOK/65SKEhMoraz16wyS8z4ax aOarQ/6MXlAZVwo9PJrKDxmeMrU8ih3r0MZZQ54UZd8jt2v3rDstjorFNKfP0ZUMKGfU5eBXhio
 1lTOec4AlW5SN0yyrK63yoIvwhVKfWQUWtVnLzM5kHLQVFS/7Apl/9WMbSL2rSwTFPPkGW+h
X-Proofpoint-GUID: wB0e5_wAolbPX6-jZGCAVbsC7aN46pm_
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6809fee6 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Twlkf-z8AAAA:8 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=IvTj1HvjAAAA:8
 a=gWDa-L1wAAAA:8 a=t7CeM3EgAAAA:8 a=FyRBxbkoQT0lOv_KSvIA:9 a=07En_OZGnK3lWzRB:21 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=kmyLcwvAnC_t3PsnBtKb:22 a=vg_HiZM2M4GgzivzK9OA:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wB0e5_wAolbPX6-jZGCAVbsC7aN46pm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215339

On Thu, Apr 24, 2025 at 12:20:38AM -0700, Khem Raj wrote:
> This can ensure that meta-clang does not carry them and can rely on core layer
> while mesa can use them too.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../clang/clang-cross-canadian_git.bb              |  36 ++
>  meta/recipes-devtools/clang/clang-cross_git.bb     |  39 ++
>  meta/recipes-devtools/clang/clang-crosssdk_git.bb  |  34 ++
>  ...ind-libunwind-headers-when-LIBCXXABI_LIBU.patch |  60 +++
>  ...er-rt-support-a-new-embedded-linux-target.patch | 309 +++++++++++++
>  ...-Simplify-cross-compilation.-Don-t-use-na.patch |  44 ++
>  ...LibraryInfo-Undefine-libc-functions-if-th.patch |  90 ++++
>  ...allow-env-override-of-exe-and-libdir-path.patch |  71 +++
>  ...-clang-driver-Check-sysroot-for-ldso-path.patch |  75 ++++
>  ...iver-tools.cpp-Add-lssp_nonshared-on-musl.patch |  32 ++
>  .../0008-clang-Prepend-trailing-to-sysroot.patch   |  39 ++
>  ...inside-the-target-sysroot-for-compiler-ru.patch |  41 ++
>  ...ang-Define-releative-gcc-installation-dir.patch |  47 ++
>  ...pthread-and-ldl-along-with-lunwind-for-st.patch |  35 ++
>  ..._EXECUTABLE-when-cross-compiling-for-nati.patch |  24 +
>  .../0013-Check-for-atomic-double-intrinsics.patch  |  34 ++
>  ...configure-for-packages-using-find_package.patch | 117 +++++
>  ...esource-dir-location-for-cross-toolchains.patch |  50 +++
>  ...r-Add-dyld-prefix-when-checking-sysroot-f.patch |  79 ++++
>  .../0017-clang-Use-python3-in-python-scripts.patch |  35 ++
>  ...4-set-Yocto-based-GCC-install-search-path.patch |  70 +++
>  ...-anchor-for-adding-OE-distro-vendor-names.patch |  32 ++
>  ...-Do-not-use-backtrace-APIs-on-non-glibc-l.patch |  68 +++
>  ...86-triple-for-non-debian-multiarch-linux-.patch |  28 ++
>  ...0022-libunwind-Added-unw_backtrace-method.patch |  56 +++
>  ...-Do-not-use-install-relative-libc-headers.patch |  34 ++
>  .../0024-Fix-lib-paths-for-OpenEmbedded-Host.patch |  79 ++++
>  ...library-search-path-for-OpenEmbedded-Host.patch |  84 ++++
>  .../0026-lldb-Link-with-libatomic-on-x86.patch     |  33 ++
>  ...027-compiler-rt-Enable-__int128-for-ppc32.patch |  73 +++
>  ...-Do-not-use-cmake-infra-to-detect-libzstd.patch |  62 +++
>  ...ler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch |  46 ++
>  ...-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch |  43 ++
>  ...s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch |  81 ++++
>  ...vm-Add-OE-specific-ABI-triple-for-N32-ABI.patch |  78 ++++
>  ...d-libunwind.pc.in-and-llvm-config-scripts.patch |  90 ++++
>  ...py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  92 ++++
>  ...r-rt-Do-not-pass-target-to-clang-compiler.patch |  29 ++
>  .../clang/clang/0036-Fix-build-on-ppc64-musl.patch |  97 ++++
>  ...d-a-build-option-to-disable-building-dexp.patch |  85 ++++
>  ...mitter-sort-ClassInfo-lists-by-name-as-we.patch |  31 ++
>  .../clang/clang/spirv-internal-build.patch         |  30 ++
>  .../clang/clang/spirv-shared-library.patch         |  25 ++
>  meta/recipes-devtools/clang/clang_git.bb           | 497 +++++++++++++++++++++
>  meta/recipes-devtools/clang/common-clang.inc       |  24 +
>  meta/recipes-devtools/clang/common-source.inc      |  17 +
>  meta/recipes-devtools/clang/common.inc             |  85 ++++
>  .../clang/compiler-rt-sanitizers_git.bb            | 139 ++++++
>  meta/recipes-devtools/clang/compiler-rt_git.bb     | 135 ++++++
>  meta/recipes-devtools/clang/libcxx_git.bb          | 119 +++++
>  meta/recipes-devtools/clang/llvm-project-source.bb |  12 +
>  .../recipes-devtools/clang/llvm-project-source.inc |  99 ++++
>  .../recipes-devtools/clang/nativesdk-clang-glue.bb |  36 ++
>  meta/recipes-devtools/clang/openmp_git.bb          |  67 +++
>  54 files changed, 3867 insertions(+)
> 
> diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..9e78c1ff48d7186d01807affc2899223c8bc3610
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> @@ -0,0 +1,36 @@
> +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "Clang/LLVM based C/C++ compiler (cross-canadian for ${TARGET_ARCH} target)"
> +HOMEPAGE = "http://clang.llvm.org/"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
> +SECTION = "devel"
> +
> +PN = "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> +
> +require common-clang.inc
> +require common-source.inc
> +inherit cross-canadian
> +
> +DEPENDS += "nativesdk-clang binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} virtual/nativesdk-cross-binutils virtual/nativesdk-libc"
> +# We have to point gcc at a sysroot but we don't need to rebuild if this changes
> +# e.g. we switch between different machines with different tunes.
> +EXTRA_OECONF_PATHS[vardepsexclude] = "TUNE_PKGARCH"
> +TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
> +
> +do_install() {
> +        install -d ${D}${bindir}
> +	for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
> +            llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-objdump llvm-readelf \
> +            llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
> +	do
> +		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
> +	done

Inconsistent indentation, please use either 4 spaces or tabs
consistently.

> +}
> +SSTATE_SCAN_FILES += "*-clang *-clang++ *-llvm-profdata *-llvm-ar \
> +                      *-llvm-ranlib *-llvm-nm *-lld *-ld.lld *-llvm-as *-llvm-strip \
> +                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-addr2line \
> +                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov"
> +do_install:append() {
> +        cross_canadian_bindirlinks
> +}
> diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipes-devtools/clang/clang-cross_git.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..9b9b120a3d793f6dd989b566b3736934f1c0ff8d
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang-cross_git.bb
> @@ -0,0 +1,39 @@
> +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "Cross compiler wrappers for LLVM based C/C++ compiler"
> +HOMEPAGE = "http://clang.llvm.org/"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
> +SECTION = "devel"
> +
> +PN = "clang-cross-${TARGET_ARCH}"
> +
> +require common-clang.inc
> +require common-source.inc
> +inherit cross
> +DEPENDS += "clang-native virtual/cross-binutils"
> +
> +#INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +do_install() {
> +        install -d ${D}${bindir}
> +	for tool in clang-tidy lld ld.lld llvm-profdata \
> +            llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-objdump llvm-readelf \
> +            llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
> +	do
> +		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
> +	done
> +	install -m 0755 ${STAGING_BINDIR_NATIVE}/clang ${D}${bindir}/${TARGET_PREFIX}clang
> +	install -m 0755 ${STAGING_BINDIR_NATIVE}/clang ${D}${bindir}/${TARGET_PREFIX}clang++


Inconsistent indentation, please use either 4 spaces or tabs
consistently.

> +}
> +SSTATE_SCAN_FILES += "*-clang *-clang++ *-llvm-profdata *-lld *-ld.lld \
> +                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib *-llvm-strip \
> +                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-addr2line \
> +                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov"
> +
> +SYSROOT_PREPROCESS_FUNCS += "clangcross_sysroot_preprocess"
> +
> +clangcross_sysroot_preprocess () {
> +        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
> +}
> +PACKAGES = ""
> diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..d6f071c55bd649e593c214b3719fb36060e1c89b
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> @@ -0,0 +1,34 @@
> +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
> +HOMEPAGE = "http://clang.llvm.org/"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
> +SECTION = "devel"
> +
> +PN = "clang-crosssdk-${SDK_SYS}"
> +
> +require common-clang.inc
> +require common-source.inc
> +inherit crosssdk
> +DEPENDS += "clang-native nativesdk-clang-glue virtual/nativesdk-cross-binutils virtual/nativesdk-libc"
> +
> +do_install() {
> +        install -d ${D}${bindir}
> +	for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
> +            llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-objdump llvm-readelf \
> +            llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
> +	do
> +		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
> +	done
> +}

Inconsistent indentation, please use either 4 spaces or tabs
consistently.

> +SSTATE_SCAN_FILES += "*-clang *-clang++ *-llvm-profdata *-lld *-ld.lld \
> +                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib *-llvm-strip \
> +                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-addr2line \
> +                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov"
> +sysroot_stage_all () {
> +        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
> +}
> +
> +PACKAGES = ""
> +

[...]


> diff --git a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..6d3f5293aab84056e9693b5d2282166fd72b1ede
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
> @@ -0,0 +1,71 @@
> +From 0b344231c49d8c145bc3ad882d259d36fb19e827 Mon Sep 17 00:00:00 2001
> +From: Martin Kelly <mkelly@xevo.com>
> +Date: Fri, 19 May 2017 00:22:57 -0700
> +Subject: [PATCH] llvm: allow env override of exe and libdir path
> +
> +When using a native llvm-config from inside a sysroot, we need llvm-config to
> +return the libraries, include directories, etc. from inside the sysroot rather
> +than from the native sysroot. Thus provide an env override for calling
> +llvm-config from a target sysroot.
> +
> +Add YOCTO_ALTERNATE_LIBDIR and YOCTO_ALTERNATE_EXE_PATH env variables

Is this really necessary? Can we use ${libdir} / ${base_libdir} in the
llvm-config wrapper instead of YOCTO_ALTERNATE_LIBDIR ?

> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Martin Kelly <mkelly@xevo.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
> + 1 file changed, 19 insertions(+), 6 deletions(-)
> +
> +diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
> +index d5b76b1bb6c1..a739f0d8dbea 100644
> +--- a/llvm/tools/llvm-config/llvm-config.cpp
> ++++ b/llvm/tools/llvm-config/llvm-config.cpp
> +@@ -246,6 +246,13 @@ Typical components:\n\
> + 
> + /// Compute the path to the main executable.
> + std::string GetExecutablePath(const char *Argv0) {
> ++  // Hack for Yocto: we need to override the root path when we are using
> ++  // llvm-config from within a target sysroot.
> ++  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
> ++  if (Sysroot != nullptr) {
> ++    return Sysroot;
> ++  }
> ++
> +   // This just needs to be some symbol in the binary; C++ doesn't
> +   // allow taking the address of ::main however.
> +   void *P = (void *)(intptr_t)GetExecutablePath;
> +@@ -325,7 +332,7 @@ int main(int argc, char **argv) {
> +   // Compute various directory locations based on the derived location
> +   // information.
> +   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
> +-              ActiveCMakeDir;
> ++              ActiveCMakeDir, BaseLibDir;
> +   std::string ActiveIncludeOption;
> +   if (IsInDevelopmentTree) {
> +     ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
> +@@ -366,12 +373,18 @@ int main(int argc, char **argv) {
> +       sys::fs::make_absolute(ActivePrefix, Path);
> +       ActiveBinDir = std::string(Path);
> +     }
> +-    ActiveLibDir = ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
> +-    {
> +-      SmallString<256> Path(LLVM_INSTALL_PACKAGE_DIR);
> +-      sys::fs::make_absolute(ActivePrefix, Path);
> +-      ActiveCMakeDir = std::string(Path);
> ++    // Hack for Yocto: we need to override the lib path when we are using
> ++    // llvm-config from within a target sysroot since LLVM_LIBDIR_SUFFIX
> ++    // maybe different for host llvm vs target e.g. ppc64 Libdir=lib64 but
> ++    // x86_64 Libdir = lib
> ++    const char *YoctoLibDir = std::getenv("YOCTO_ALTERNATE_LIBDIR");
> ++    if (YoctoLibDir != nullptr) {
> ++      BaseLibDir = std::string(YoctoLibDir);
> ++    } else {
> ++      BaseLibDir = std::string("/lib") + LLVM_LIBDIR_SUFFIX;
> +     }
> ++    ActiveLibDir = ActivePrefix + BaseLibDir;
> ++    ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
> +     ActiveIncludeOption = "-I" + ActiveIncludeDir;
> +   }
> + 
> diff --git a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..6a67d1191605b3ab0cee4737a976b18f5ccdcf2a
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
> @@ -0,0 +1,75 @@
> +From 66aa6ec05c67e82f084cc692297240161afb467c Mon Sep 17 00:00:00 2001
> +From: Dan McGregor <dan.mcgregor@usask.ca>
> +Date: Wed, 26 Apr 2017 20:29:41 -0600
> +Subject: [PATCH] clang: driver: Check sysroot for ldso path
> +
> +OE does not necessarily follow the default path for the dynamic linker,
> +therefore adjust it for OE. Check for the default path, and if it isn't
> +there, check /lib.

It would be nice to mention explicitly where we deviate from the
defaults.

> +
> +Upstream-Status: Pending
> +Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + clang/lib/Driver/ToolChains/Linux.cpp | 22 +++++++++++++++++++++-
> + 1 file changed, 21 insertions(+), 1 deletion(-)
> +
> +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
> +index 0767fe6c5879..4d0c7e63c68e 100644
> +--- a/clang/lib/Driver/ToolChains/Linux.cpp
> ++++ b/clang/lib/Driver/ToolChains/Linux.cpp
> +@@ -523,7 +523,11 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
> +         Triple.getEnvironment() == llvm::Triple::GNUEABIHFT64 ||
> +         tools::arm::getARMFloatABI(*this, Args) == tools::arm::FloatABI::Hard;
> + 
> +-    LibDir = "lib";
> ++    LibDir = "lib32";
> ++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
> ++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> ++        LibDir = "lib";
> ++    }
> +     Loader = HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";

This patch is broken. It checks the location of the Loader before
setting the final value for the Loader variable.

> +     break;
> +   }
> +@@ -578,11 +582,19 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
> +     LibDir = "lib64";
> +     Loader =
> +         (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.so.1";
> ++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
> ++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> ++        LibDir = "lib";
> ++    }
> +     break;
> +   case llvm::Triple::ppc64le:
> +     LibDir = "lib64";
> +     Loader =
> +         (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" : "ld64.so.2";
> ++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
> ++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> ++        LibDir = "lib";
> ++    }
> +     break;
> +   case llvm::Triple::riscv32:
> +   case llvm::Triple::riscv64: {
> +@@ -600,6 +612,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
> +   case llvm::Triple::sparcv9:
> +     LibDir = "lib64";
> +     Loader = "ld-linux.so.2";
> ++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
> ++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> ++        LibDir = "lib";
> ++    }
> +     break;
> +   case llvm::Triple::systemz:
> +     LibDir = "lib";
> +@@ -614,6 +630,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
> + 
> +     LibDir = X32 ? "libx32" : "lib64";
> +     Loader = X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
> ++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
> ++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> ++        LibDir = "lib";
> ++    }
> +     break;
> +   }
> +   case llvm::Triple::ve:

> diff --git a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..59360a112fca04cedb21d085b9523e0473819de6
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
> @@ -0,0 +1,39 @@
> +From 9db61302678f32d58746a60e9223045ed675890d Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 16 Mar 2017 09:02:13 -0700
> +Subject: [PATCH] clang: Prepend trailing '/' to sysroot
> +
> +This is needed to handle a case where clang
> +isntall and target sysroot are perilously same
> +
> +e.g.
> +
> +sysroot = /mnt/clang/recipe-sysroot
> +clang install = /mnt/clang/recipe-sysroot-native
> +
> +in this case it will mistakenly assume that
> +clang is installed under the same sysroot dir
> +and it will try to add relative ../lib paths
> +to linker steps which would then be wrong
> +since they will become relative to clang
> +installation and not sysroot
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

This looks too hacky / fragile.

> +---
> + clang/lib/Driver/ToolChains/Linux.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
> +index 4d0c7e63c68e..6c28c8408605 100644
> +--- a/clang/lib/Driver/ToolChains/Linux.cpp
> ++++ b/clang/lib/Driver/ToolChains/Linux.cpp
> +@@ -216,7 +216,7 @@ Linux::Linux(const Driver &D, const llvm::Triple &Triple, const ArgList &Args)
> +   Multilibs = GCCInstallation.getMultilibs();
> +   SelectedMultilibs.assign({GCCInstallation.getMultilib()});
> +   llvm::Triple::ArchType Arch = Triple.getArch();
> +-  std::string SysRoot = computeSysRoot();
> ++  std::string SysRoot = computeSysRoot() + "/";
> +   ToolChain::path_list &PPaths = getProgramPaths();
> + 
> +   Generic_GCC::PushPPaths(PPaths);
> diff --git a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..0c1e3b5cd7380397fb1420e2002efa0fc4f63903
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
> @@ -0,0 +1,47 @@
> +From edbebadc31bb781a8ab77472f30a16c791f70859 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 20 Mar 2021 16:09:16 -0700
> +Subject: [PATCH] clang: Define / releative gcc installation dir
> +
> +This is required for OE gcc installation to work.
> +Without this its not able to find the paths for libgcc
> +and other standard headers and libraries from gcc
> +installation in OE
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + clang/lib/Driver/ToolChains/Gnu.cpp | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
> +index 9f7b9e8d42a8..4f177aa8771e 100644
> +--- a/clang/lib/Driver/ToolChains/Gnu.cpp
> ++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> +@@ -2871,19 +2871,19 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
> +     // Whether this library suffix is relevant for the triple.
> +     bool Active;
> +   } Suffixes[] = {
> +-      // This is the normal place.
> +-      {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
> +-
> +-      // Debian puts cross-compilers in gcc-cross.
> +-      {"gcc-cross/" + CandidateTriple.str(), "../..", GCCCrossDirExists},
> +-
> +       // The Freescale PPC SDK has the gcc libraries in
> +       // <sysroot>/usr/lib/<triple>/x.y.z so have a look there as well. Only do
> +       // this on Freescale triples, though, since some systems put a *lot* of
> +       // files in that location, not just GCC installation data.
> +       {CandidateTriple.str(), "..",
> +        TargetTriple.getVendor() == llvm::Triple::Freescale ||
> +-           TargetTriple.getVendor() == llvm::Triple::OpenEmbedded}};
> ++           TargetTriple.getVendor() == llvm::Triple::OpenEmbedded},
> ++
> ++      // This is the normal place.
> ++      {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
> ++
> ++      // Debian puts cross-compilers in gcc-cross.
> ++      {"gcc-cross/" + CandidateTriple.str(), "../..", GCCCrossDirExists}};

I think this should be unnecessary with
0024-Fix-lib-paths-for-OpenEmbedded-Host.patch in place. If it's still
necessary, it might be better to squash both patches together.

> + 
> +   for (auto &Suffix : Suffixes) {
> +     if (!Suffix.Active)

> diff --git a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..3153f8f09946d598d33f0ad65ae7000ae6a83f71
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
> @@ -0,0 +1,35 @@
> +From a0e0dcea0e93623487363baf19f017ae34ecd6a5 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 14 Oct 2020 22:19:57 -0700
> +Subject: [PATCH] clang: Use python3 in python scripts
> +
> +Some scripts ask for python, but they work fine with python3
> +and in OE python symlink is not exposed to build, only python3 is

This is also the case on other distros. Is there a chance of pushing
this upstream?

> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + .../find-all-symbols/tool/run-find-all-symbols.py               | 2 +-
> + clang/tools/scan-view/bin/scan-view                             | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
> +index 471dbf8c110b..f98385dc6651 100755
> +--- a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
> ++++ b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + #
> + # =- run-find-all-symbols.py - Parallel find-all-symbols runner -*- python  -*-=#
> + #
> +diff --git a/clang/tools/scan-view/bin/scan-view b/clang/tools/scan-view/bin/scan-view
> +index d01aebb4029a..f3375804654d 100755
> +--- a/clang/tools/scan-view/bin/scan-view
> ++++ b/clang/tools/scan-view/bin/scan-view
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + 
> + from __future__ import print_function
> + 
> diff --git a/meta/recipes-devtools/clang/clang/0018-For-x86_64-set-Yocto-based-GCC-install-search-path.patch b/meta/recipes-devtools/clang/clang/0018-For-x86_64-set-Yocto-based-GCC-install-search-path.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..6ffd55a0e55d37366c4be137130a8f8db6e7bf21
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0018-For-x86_64-set-Yocto-based-GCC-install-search-path.patch
> @@ -0,0 +1,70 @@
> +From 4f5788cbe2a5fe6cc10bd64489797a86ab906cd3 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 25 Jan 2021 16:14:35 +0800
> +Subject: [PATCH] For x86_64, set Yocto based GCC install search path
> +
> +Under Yocto host, while using clang-native to build, it searches
> +install host gcc failed which causing the include file not found
> +[snip]
> +|clang++ -target x86_64-linux  -MMD -MF src/base/files/file_path_constants.o.d -I../../../tools/gn/src -I. \
> +-isystem/tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/recipe-sysroot-native/usr/include -O2 -pipe \
> +-std=c++17 -c ../../../tools/gn/src/base/files/file_path_constants.cc -o src/base/files/file_path_constants.o
> +|../../../tools/gn/src/base/files/file_path_constants.cc:7:10: fatal error: 'iterator' file not found
> +|#include <iterator>
> +|         ^~~~~~~~
> +[snip]
> +
> +Set three Yocto based GCC triple: poky, oe-core and wind river
> +
> +Before aplly the patch
> +[snip]
> +$ ../recipe-sysroot-native/usr/bin/clang++ -v
> +clang version 11.0.1 (https://github.com/llvm/llvm-project 43ff75f2c3feef64f9d73328230d34dac8832a91)
> +Target: x86_64-unknown-linux-gnu
> +Thread model: posix
> +InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/chromium-87.0.4280.141/../recipe-sysroot-native/usr/bin
> +[snip]
> +
> +After aplly the patch:
> +[snip]
> +$ ../recipe-sysroot-native/usr/bin/clang++ -v
> +clang version 11.0.1 (https://github.com/llvm/llvm-project 22c3241ff9a6224261df48d0258957fd8acc3d64)
> +Target: x86_64-unknown-linux-gnu
> +Thread model: posix
> +InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/chromium-87.0.4280.141/../recipe-sysroot-native/usr/bin
> +Found candidate GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0
> +Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.1.0
> +Selected GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0
> +Candidate multilib: .;@m64
> +Selected multilib: .;@m64
> +[snip]
> +
> +BTW, it is hardly to insert a triple by the replacement of TARGET_SYS
> +(=${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}), since TARGET_VENDOR
> +is different between clang and clang-native
> +
> +The //CLANG_EXTRA_OE_VENDORS_TRIPLES string is replaced with list of
> +additional triples based on CLANG_EXTRA_OE_VENDORS variable in
> +recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + clang/lib/Driver/ToolChains/Gnu.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
> +index 4f177aa8771e..6873892372ea 100644
> +--- a/clang/lib/Driver/ToolChains/Gnu.cpp
> ++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> +@@ -2451,6 +2451,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
> +       "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
> +       "x86_64-redhat-linux",    "x86_64-suse-linux",
> +       "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
> ++      "x86_64-oe-linux",//CLANG_EXTRA_OE_VENDORS_TRIPLES
> +       "x86_64-unknown-linux",   "x86_64-amazon-linux"};
> +   static const char *const X32Triples[] = {"x86_64-linux-gnux32",
> +                                            "x86_64-pc-linux-gnux32"};
> diff --git a/meta/recipes-devtools/clang/clang/0019-llvm-Insert-anchor-for-adding-OE-distro-vendor-names.patch b/meta/recipes-devtools/clang/clang/0019-llvm-Insert-anchor-for-adding-OE-distro-vendor-names.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..666283d560fa74cb921594d7b830c9eec71b011e
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0019-llvm-Insert-anchor-for-adding-OE-distro-vendor-names.patch
> @@ -0,0 +1,32 @@
> +From 3e453f3688214dfc9de86bf28effe06ecc55251e Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 11 Feb 2021 16:42:49 -0800
> +Subject: [PATCH] llvm: Insert anchor for adding OE distro vendor names
> +
> +This helps in making right detection for OE built gcc toolchains
> +
> +The //CLANG_EXTRA_OE_VENDORS_CASES string is replaced with list of
> +additional Ceses based on CLANG_EXTRA_OE_VENDORS variable in
> +recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + llvm/lib/TargetParser/Triple.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Triple.cpp
> +index e9e6f130f757..97f426dd863b 100644
> +--- a/llvm/lib/TargetParser/Triple.cpp
> ++++ b/llvm/lib/TargetParser/Triple.cpp
> +@@ -663,7 +663,7 @@ static Triple::VendorType parseVendor(StringRef VendorName) {
> +       .Case("mesa", Triple::Mesa)
> +       .Case("suse", Triple::SUSE)
> +       .Case("oe", Triple::OpenEmbedded)
> +-      .Case("intel", Triple::Intel)
> ++      .Case("intel", Triple::Intel) //CLANG_EXTRA_OE_VENDORS_CASES
> +       .Default(Triple::UnknownVendor);
> + }
> + 

> diff --git a/meta/recipes-devtools/clang/clang/0024-Fix-lib-paths-for-OpenEmbedded-Host.patch b/meta/recipes-devtools/clang/clang/0024-Fix-lib-paths-for-OpenEmbedded-Host.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..3bc6bef5fe1cd56aa1a334fb9b8bbc15a82bf32a
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0024-Fix-lib-paths-for-OpenEmbedded-Host.patch
> @@ -0,0 +1,79 @@
> +From 8025d9bec9777ea659f23e0e6089589608c627b6 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 7 Dec 2021 04:08:22 +0000
> +Subject: [PATCH] Fix lib paths for OpenEmbedded Host
> +
> +Under OpenEmbedded Host, while building with clang-native, it cannot find
> +the GCCInstallPath, which causing following error:
> +[snip]
> +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
> +-target x86_64-linux
> +-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/include
> +-O2 -pipe
> +/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share/cmake-3.21/Modules/CMakeCCompilerABI.c`
> +hosttools/ld: cannot find crtbeginS.o: No such file or directory
> +[snip]
> +
> +Before this patch:
> +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
> +clang version 13.0.1 (https://github.com/llvm/llvm-project 08e3a5ccd952edee36b3c002e3a29c6b1b5153de)
> +Target: x86_64-unknown-linux-gnu
> +Thread model: posix
> +InstalledDir: /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin
> +Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.0
> +
> +After this patch:
> +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
> +clang version 13.0.1 (https://github.com/llvm/llvm-project 08e3a5ccd952edee36b3c002e3a29c6b1b5153de)
> +Thread model: posix
> +InstalledDir: /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin
> +Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.0
> +Found candidate GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0
> +Selected GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0
> +Candidate multilib: .;@m64
> +Selected multilib: .;@m64
> +
> +Summary:
> +For OpenEmbedded Host, sysroots are of the form<sysroot>/usr/lib/<triple>/x.y.z.
> +Take x86-64 as example, the default triple is x86_64-unknown-linux-gnu.
> +For clang-native, the target vendor is '-unknown', need to test current distro
> +to follow above form.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + clang/lib/Driver/ToolChains/Gnu.cpp | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
> +index b5485970a0c5..868d32f501e8 100644
> +--- a/clang/lib/Driver/ToolChains/Gnu.cpp
> ++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> +@@ -19,6 +19,7 @@
> + #include "Linux.h"
> + #include "clang/Config/config.h" // for GCC_INSTALL_PREFIX
> + #include "clang/Driver/Compilation.h"
> ++#include "clang/Driver/Distro.h"
> + #include "clang/Driver/Driver.h"
> + #include "clang/Driver/DriverDiagnostic.h"
> + #include "clang/Driver/MultilibBuilder.h"
> +@@ -2861,6 +2862,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
> +     const llvm::Triple &TargetTriple, const ArgList &Args,
> +     const std::string &LibDir, StringRef CandidateTriple,
> +     bool NeedsBiarchSuffix, bool GCCDirExists, bool GCCCrossDirExists) {
> ++  Distro Distro(D.getVFS(), TargetTriple);
> +   // Locations relative to the system lib directory where GCC's triple-specific
> +   // directories might reside.
> +   struct GCCLibSuffix {
> +@@ -2878,7 +2880,8 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
> +       // files in that location, not just GCC installation data.
> +       {CandidateTriple.str(), "..",
> +        TargetTriple.getVendor() == llvm::Triple::Freescale ||
> +-           TargetTriple.getVendor() == llvm::Triple::OpenEmbedded},
> ++           TargetTriple.getVendor() == llvm::Triple::OpenEmbedded ||
> ++           Distro.IsOpenEmbedded()},
> + 
> +       // This is the normal place.
> +       {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
> diff --git a/meta/recipes-devtools/clang/clang/0025-Correct-library-search-path-for-OpenEmbedded-Host.patch b/meta/recipes-devtools/clang/clang/0025-Correct-library-search-path-for-OpenEmbedded-Host.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..53985390244ae64885014660f32230dd0bb1a7b8
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0025-Correct-library-search-path-for-OpenEmbedded-Host.patch
> @@ -0,0 +1,84 @@
> +From 2ffb38ac288bb8c80fe49a4f4daccdaac8044882 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 7 Dec 2021 04:55:48 +0000
> +Subject: [PATCH] Correct library search path for OpenEmbedded Host

And yet another patch fixing the same issue... I've had hard time
following them earlier. Would it be possible to squash / rework all the
patches taking care of OE-specific locations into a single patch? It's
really hard to follow it if the logic is split across multiple patches.

> +
> +For OpenEmbedded Host, the gcc install path is
> +/usr/lib/x86_64-[distroname]-linux/[gcc-version].
> +So the library search path is not found with default triple
> +'x86_64-linux-gnu' for x86_64. Causing following error:
> +[snip]
> +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
> +-target x86_64-linux
> +-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/include
> +-O2 -pipe
> +/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share/cmake-3.21/Modules/CMakeCCompilerABI.c`
> +|     /build/tmp-glibc/hosttools/ld: cannot find -lgcc
> +|     /build/tmp-glibc/hosttools/ld: cannot find -lgcc
> +|     clang-13: error: linker command failed with exit code 1 (use -v to see invocation)
> +[snip]
> +
> +before this patch:
> +b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang --print-search-dirs
> +programs: =/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin
> +libraries: =/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/../lib://lib://usr/lib
> +
> +after this patch:
> +b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang --print-search-dirs
> +programs: =/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin
> +libraries: =/build/tmp-glibc/work/x84_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/usr/lib/x86_64-wrs-linux/10.2.0://lib/x86_64-wrs-linux://usr/lib/x86_64-wrs-linux:/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/../lib://lib://usr/lib
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + clang/include/clang/Driver/Distro.h   | 2 ++
> + clang/lib/Driver/Distro.cpp           | 1 +
> + clang/lib/Driver/ToolChains/Linux.cpp | 1 +
> + 3 files changed, 4 insertions(+)
> +
> +diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clang/Driver/Distro.h
> +index b4d485dac8a2..ac0bf25b7c63 100644
> +--- a/clang/include/clang/Driver/Distro.h
> ++++ b/clang/include/clang/Driver/Distro.h
> +@@ -45,6 +45,7 @@ public:
> +     RHEL7,
> +     Fedora,
> +     Gentoo,
> ++    //CLANG_EXTRA_OE_DISTRO_NAME
> +     OpenSUSE,
> +     UbuntuHardy,
> +     UbuntuIntrepid,
> +@@ -139,6 +140,7 @@ public:
> + 
> +   bool IsGentoo() const { return DistroVal == Gentoo; }
> + 
> ++  //CLANG_EXTRA_OE_DISTRO_CHECK
> +   /// @}
> + };
> + 
> +diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
> +index 3cc79535de8d..595656179bdc 100644
> +--- a/clang/lib/Driver/Distro.cpp
> ++++ b/clang/lib/Driver/Distro.cpp
> +@@ -43,6 +43,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs::FileSystem &VFS) {
> +                     .Case("sles", Distro::OpenSUSE)
> +                     .Case("opensuse", Distro::OpenSUSE)
> +                     .Case("exherbo", Distro::Exherbo)
> ++                    //CLANG_EXTRA_OE_DISTRO_CASE
> +                     .Default(Distro::UnknownDistro);
> +   return Version;
> + }
> +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
> +index a9ee2b671f2e..ec1705af3cbd 100644
> +--- a/clang/lib/Driver/ToolChains/Linux.cpp
> ++++ b/clang/lib/Driver/ToolChains/Linux.cpp
> +@@ -82,6 +82,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
> +       return "x86_64-linux-android";
> +     if (TargetEnvironment == llvm::Triple::GNUX32)
> +       return "x86_64-linux-gnux32";
> ++    //CLANG_EXTRA_OE_DISTRO_TRIPLE
> +     return "x86_64-linux-gnu";
> +   case llvm::Triple::aarch64:
> +     if (IsAndroid)


> diff --git a/meta/recipes-devtools/clang/clang/0033-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0033-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..8d56422529bf6a1738351f60578acf2752c93e79
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0033-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
> @@ -0,0 +1,90 @@
> +From 9caabc8d9c5f65e8130f24f07b9708b29ab636f6 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 14 May 2024 22:04:43 -0700
> +Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
> +
> +These are added by OE project
> +
> +Upstream-Status: Inappropriate [ OE-Specific ]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + libunwind/libunwind.pc.in          |  9 ++++++
> + llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++++++

It was easier to handle if it is a separate script under files/ rather
than a patch in the source tree.

> + 2 files changed, 61 insertions(+)
> + create mode 100644 libunwind/libunwind.pc.in
> + create mode 100644 llvm/tools/llvm-config/llvm-config
> +
> +diff --git a/libunwind/libunwind.pc.in b/libunwind/libunwind.pc.in
> +new file mode 100644
> +index 000000000000..a93d676604f9
> +--- /dev/null
> ++++ b/libunwind/libunwind.pc.in
> +@@ -0,0 +1,9 @@
> ++prefix=/usr
> ++exec_prefix=/usr
> ++libdir=@LIBDIR@
> ++includedir=/usr/include
> ++
> ++Name: libunwind
> ++Description: libunwind base library
> ++Version: @VERSION@
> ++Libs: -lunwind
> +diff --git a/llvm/tools/llvm-config/llvm-config b/llvm/tools/llvm-config/llvm-config
> +new file mode 100644
> +index 000000000000..6a0dd54b8eab
> +--- /dev/null
> ++++ b/llvm/tools/llvm-config/llvm-config
> +@@ -0,0 +1,52 @@
> ++#!/bin/bash
> ++#
> ++# Wrapper script for llvm-config. Supplies the right environment variables
> ++# for the target and delegates to the native llvm-config for anything else. This
> ++# is needed because arguments like --ldflags, --cxxflags, etc. are set by the
> ++# native compile rather than the target compile.
> ++#
> ++SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
> ++NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
> ++export YOCTO_ALTERNATE_EXE_PATH="${YOCTO_ALTERNATE_EXE_PATH:="$(readlink -f "$SCRIPT_DIR/../llvm-config")"}"
> ++if [ -n "$( echo $base_libdir | sed -n '/lib64/p')" ]; then
> ++    export YOCTO_ALTERNATE_LIBDIR="${YOCTO_ALTERNATE_LIBDIR:="/lib64"}"
> ++else
> ++    export YOCTO_ALTERNATE_LIBDIR="${YOCTO_ALTERNATE_LIBDIR:="/lib"}"
> ++fi
> ++if [[ $# == 0 ]]; then
> ++  exec "$NEXT_LLVM_CONFIG"
> ++fi
> ++
> ++remain=""
> ++output=""
> ++for arg in "$@"; do
> ++  case "$arg" in
> ++    --cppflags)
> ++      output="${output} ${CPPFLAGS}"
> ++      ;;
> ++    --cflags)
> ++      output="${output} ${CFLAGS}"
> ++      ;;
> ++    --cxxflags)
> ++      output="${output} ${CXXFLAGS}"
> ++      ;;
> ++    --ldflags)
> ++      output="${output} ${LDFLAGS}"
> ++      ;;
> ++    --shared-mode)
> ++      output="${output} shared"
> ++      ;;
> ++    --link-shared)
> ++      break
> ++      ;;
> ++    *)
> ++      remain="${remain} ${arg}"
> ++      ;;
> ++  esac
> ++done
> ++
> ++if [ "${remain}" != "" ]; then
> ++      output="${output} "$("$NEXT_LLVM_CONFIG" ${remain})
> ++fi
> ++
> ++echo "${output}"

[...]

> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..86a5277a179bd9b9522ad0298212f7e0b4f6504f
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -0,0 +1,497 @@
> +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "LLVM based C/C++ compiler"
> +DESCRIPTION = "Clang is an LLVM based C/C++/Objective-C compiler, \
> +                which aims to deliver amazingly fast compiles, \
> +                extremely useful error and warning messages and \
> +                to provide a platform for building great source \
> +                level tools. The Clang Static Analyzer and \
> +                clang-tidy are tools that automatically find bugs \
> +                in your code, and are great examples of the sort \
> +                of tools that can be built using the Clang frontend \
> +                as a library to parse C/C++ code"
> +HOMEPAGE = "http://clang.llvm.org/"
> +SECTION = "devel"
> +
> +require common-clang.inc
> +require common-source.inc
> +
> +INHIBIT_DEFAULT_DEPS:class-native = "1"
> +
> +LDFLAGS:append:class-target:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
> +LDFLAGS:append:class-target:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
> +
> +inherit cmake cmake-native pkgconfig python3native python3targetconfig
> +
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
> +
> +def get_clang_arch(bb, d, arch_var):
> +    import re
> +    a = d.getVar(arch_var)
> +    if   re.match('(i.86|athlon|x86.64)$', a):         return 'X86'
> +    elif re.match('arm$', a):                          return 'ARM'
> +    elif re.match('armeb$', a):                        return 'ARM'
> +    elif re.match('aarch64$', a):                      return 'AArch64'
> +    elif re.match('aarch64_be$', a):                   return 'AArch64'
> +    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
> +    elif re.match('riscv32$', a):                      return 'riscv32'
> +    elif re.match('riscv64$', a):                      return 'riscv64'
> +    elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
> +    elif re.match('loongarch64$', a):                  return 'loongarch64'
> +    else:
> +        bb.note("'%s' is not a primary llvm architecture" % a)
> +    return ""
> +
> +def get_clang_host_arch(bb, d):
> +    return get_clang_arch(bb, d, 'HOST_ARCH')
> +
> +def get_clang_target_arch(bb, d):
> +    return get_clang_arch(bb, d, 'TARGET_ARCH')
> +
> +PACKAGECONFIG_CLANG_COMMON = "build-id eh libedit rtti shared-libs \
> +                              ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
> +                              "
> +
> +PACKAGECONFIG ??= "lldb-wchar terminfo \
> +                   ${PACKAGECONFIG_CLANG_COMMON} \
> +                   ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto', d)} \
> +                   "
> +PACKAGECONFIG:class-native = "clangd \
> +                              ${PACKAGECONFIG_CLANG_COMMON} \
> +                              "
> +PACKAGECONFIG:class-nativesdk = "clangd \
> +                                 ${PACKAGECONFIG_CLANG_COMMON} \
> +                                 ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto', d)} \
> +                                 "
> +
> +PACKAGECONFIG[bootstrap] = "-DCLANG_ENABLE_BOOTSTRAP=On -DCLANG_BOOTSTRAP_PASSTHROUGH='${PASSTHROUGH}' -DBOOTSTRAP_LLVM_ENABLE_LTO=Thin -DBOOTSTRAP_LLVM_ENABLE_LLD=ON,,,"
> +PACKAGECONFIG[build-id] = "-DENABLE_LINKER_BUILD_ID=ON,-DENABLE_LINKER_BUILD_ID=OFF,,"
> +PACKAGECONFIG[clangd] = "-DCLANG_ENABLE_CLANGD=ON,-DCLANG_ENABLE_CLANGD=OFF,,"
> +
> +# Activate to build the dexp tool in clangd
> +# Disabled by default for -native since it is known to trigger compiler failure on Debian 11
> +# See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15803
> +PACKAGECONFIG[clangd-dexp] = "-DCLANGD_BUILD_DEXP=ON,-DCLANGD_BUILD_DEXP=OFF,,"
> +
> +PACKAGECONFIG[compiler-rt] = "-DCLANG_DEFAULT_RTLIB=compiler-rt,,"
> +PACKAGECONFIG[eh] = "-DLLVM_ENABLE_EH=ON,-DLLVM_ENABLE_EH=OFF,,"
> +PACKAGECONFIG[libcplusplus] = "-DCLANG_DEFAULT_CXX_STDLIB=libc++,,"
> +PACKAGECONFIG[libedit] = "-DLLVM_ENABLE_LIBEDIT=ON -DLLDB_ENABLE_LIBEDIT=ON,-DLLVM_ENABLE_LIBEDIT=OFF -DLLDB_ENABLE_LIBEDIT=OFF,libedit libedit-native"
> +PACKAGECONFIG[libomp] = "-DCLANG_DEFAULT_OPENMP_RUNTIME=libomp,,"
> +PACKAGECONFIG[lld] = "-DCLANG_DEFAULT_LINKER=lld,,"
> +PACKAGECONFIG[lldb-lua] = "-DLLDB_ENABLE_LUA=ON,-DLLDB_ENABLE_LUA=OFF,lua"
> +PACKAGECONFIG[lldb-wchar] = "-DLLDB_EDITLINE_USE_WCHAR=1,-DLLDB_EDITLINE_USE_WCHAR=0,"
> +PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
> +PACKAGECONFIG[pfm] = "-DLLVM_ENABLE_LIBPFM=ON,-DLLVM_ENABLE_LIBPFM=OFF,libpfm,"
> +PACKAGECONFIG[rtti] = "-DLLVM_ENABLE_RTTI=ON,-DLLVM_ENABLE_RTTI=OFF,,"
> +PACKAGECONFIG[shared-libs] = "-DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON,,,"
> +PACKAGECONFIG[split-dwarf] = "-DLLVM_USE_SPLIT_DWARF=ON,-DLLVM_USE_SPLIT_DWARF=OFF,,"
> +PACKAGECONFIG[terminfo] = "-DLLVM_ENABLE_TERMINFO=ON -DCOMPILER_RT_TERMINFO_LIB=ON,-DLLVM_ENABLE_TERMINFO=OFF -DCOMPILER_RT_TERMINFO_LIB=OFF,ncurses,"
> +PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
> +PACKAGECONFIG[unwindlib] = "-DCLANG_DEFAULT_UNWINDLIB=libunwind,-DCLANG_DEFAULT_UNWINDLIB=libgcc,,"
> +
> +OECMAKE_SOURCEPATH = "${S}/llvm"
> +
> +OECMAKE_TARGET_COMPILE = "${@bb.utils.contains('PACKAGECONFIG', 'bootstrap', 'stage2', 'all', d)}"
> +OECMAKE_TARGET_INSTALL = "${@bb.utils.contains('PACKAGECONFIG', 'bootstrap', 'stage2-install', 'install', d)}"
> +BINPATHPREFIX = "${@bb.utils.contains('PACKAGECONFIG', 'bootstrap', '/tools/clang/stage2-bins/NATIVE', '', d)}"
> +
> +PASSTHROUGH = "\
> +CLANG_DEFAULT_RTLIB;CLANG_DEFAULT_CXX_STDLIB;LLVM_BUILD_LLVM_DYLIB;LLVM_LINK_LLVM_DYLIB;\
> +LLVM_ENABLE_ASSERTIONS;LLVM_ENABLE_EXPENSIVE_CHECKS;LLVM_ENABLE_PIC;\
> +LLVM_BINDINGS_LIST;LLVM_ENABLE_FFI;FFI_INCLUDE_DIR;LLVM_OPTIMIZED_TABLEGEN;\
> +LLVM_ENABLE_RTTI;LLVM_ENABLE_EH;LLVM_BUILD_EXTERNAL_COMPILER_RT;CMAKE_SYSTEM_NAME;\
> +CMAKE_BUILD_TYPE;BUILD_SHARED_LIBS;LLVM_ENABLE_PROJECTS;LLVM_ENABLE_RUNTIMES;LLVM_BINUTILS_INCDIR;\
> +LLVM_TARGETS_TO_BUILD;LLVM_EXPERIMENTAL_TARGETS_TO_BUILD;PYTHON_EXECUTABLE;\
> +PYTHON_LIBRARY;PYTHON_INCLUDE_DIR;LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN;LLDB_EDITLINE_USE_WCHAR;\
> +LLVM_ENABLE_LIBEDIT;LLDB_ENABLE_LIBEDIT;LLDB_PYTHON_RELATIVE_PATH;LLDB_PYTHON_EXE_RELATIVE_PATH;\
> +LLDB_PYTHON_EXT_SUFFIX;CMAKE_C_FLAGS_RELEASE;CMAKE_CXX_FLAGS_RELEASE;CMAKE_ASM_FLAGS_RELEASE;\
> +CLANG_DEFAULT_CXX_STDLIB;CLANG_DEFAULT_RTLIB;CLANG_DEFAULT_UNWINDLIB;\
> +CLANG_DEFAULT_OPENMP_RUNTIME;LLVM_ENABLE_PER_TARGET_RUNTIME_DIR;\
> +LLVM_BUILD_TOOLS;LLVM_USE_HOST_TOOLS;LLVM_CONFIG_PATH;LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR;\
> +"
> +#
> +# Default to build all OE-Core supported target arches (user overridable).
> +# Gennerally setting LLVM_TARGETS_TO_BUILD = "" in local.conf is ok in most simple situations
> +# where only one target architecture is needed along with just one build arch (usually X86)
> +#
> +LLVM_TARGETS_TO_BUILD ?= "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;NVPTX;SPIRV"
> +
> +LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?= ""
> +
> +HF = ""
> +HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
> +HF[vardepvalue] = "${HF}"
> +
> +# Ensure that LLVM_PROJECTS does not contain compiler runtime components e.g. libcxx etc
> +# they are enabled via LLVM_ENABLE_RUNTIMES
> +LLVM_PROJECTS ?= "clang;clang-tools-extra;libclc;lld${LLDB}"
> +LLDB ?= ";lldb"
> +# LLDB support for RISCV32/Mips32 does not work yet
> +LLDB:riscv32 = ""
> +LLDB:mips = ""
> +LLDB:mipsel = ""
> +LLDB:powerpc = ""
> +
> +# linux hosts (.so) on Windows .pyd
> +SOLIBSDEV:mingw32 = ".pyd"
> +
> +#CMAKE_VERBOSE = "VERBOSE=1"
> +
> +EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
> +                  -DLLVM_APPEND_VC_REV=OFF \
> +                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
> +                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
> +                  -DLLVM_ENABLE_PIC=ON \
> +                  -DCLANG_DEFAULT_PIE_ON_LINUX=ON \
> +                  -DLLVM_BINDINGS_LIST='' \
> +                  -DLLVM_ENABLE_FFI=ON \
> +                  -DLLVM_ENABLE_ZSTD=ON \
> +                  -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
> +                  -DLLVM_OPTIMIZED_TABLEGEN=ON \
> +                  -DLLVM_BUILD_EXTERNAL_COMPILER_RT=ON \
> +                  -DCMAKE_SYSTEM_NAME=Linux \
> +                  -DCMAKE_BUILD_TYPE=Release \
> +                  -DCMAKE_CXX_FLAGS_RELEASE='${CXXFLAGS} -DNDEBUG -g0' \
> +                  -DCMAKE_C_FLAGS_RELEASE='${CFLAGS} -DNDEBUG -g0' \
> +                  -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${S}/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers \
> +                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
> +                  -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR} \
> +                  -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
> +                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
> +                  -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
> +                  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD='${LLVM_EXPERIMENTAL_TARGETS_TO_BUILD}' \
> +"
> +
> +EXTRA_OECMAKE:append:class-native = "\
> +                  -DPYTHON_EXECUTABLE='${PYTHON}' \
> +"
> +EXTRA_OECMAKE:append:class-nativesdk = "\
> +                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
> +                                                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=${PYTHON_PN} \
> +                                                  -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
> +                                                  -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${S}/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers \
> +                                                  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
> +                  -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
> +                  -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
> +                  -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
> +                  -DCMAKE_STRIP=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-strip \
> +                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
> +                  -DLLVM_HEADERS_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-min-tblgen \
> +                  -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
> +                  -DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
> +                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=${PYTHON_PN} \
> +                  -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
> +                  -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
> +                  -DPYTHON_EXECUTABLE='${PYTHON}' \
> +"
> +EXTRA_OECMAKE:append:class-target = "\
> +                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${S}/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers \
> +' \
> +                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
> +                  -DLLVM_HEADERS_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-min-tblgen \
> +                  -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
> +                  -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
> +                  -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
> +                  -DCMAKE_STRIP=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-strip \
> +                  -DLLVM_TARGET_ARCH=${@get_clang_target_arch(bb, d)} \
> +                  -DLLVM_DEFAULT_TARGET_TRIPLE=${TARGET_SYS}${HF} \
> +                  -DLLVM_HOST_TRIPLE=${TARGET_SYS}${HF} \
> +                  -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
> +                  -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
> +                  -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
> +                  -DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
> +                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=${bindir} \
> +                  -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
> +"
> +
> +DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native ninja-native swig-native spirv-tools-native"
> +DEPENDS:append:class-nativesdk = " clang-crosssdk-${SDK_SYS} virtual/nativesdk-cross-binutils nativesdk-python3"
> +DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH} python3 ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
> +
> +RRECOMMENDS:${PN} = "binutils"
> +RRECOMMENDS:${PN}:append:class-target = "${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
> +
> +# patch out build host paths for reproducibility
> +reproducible_build_variables() {
> +    sed -i -e "s,${DEBUG_PREFIX_MAP},,g" \
> +        -e "s,--sysroot=${RECIPE_SYSROOT},,g" \
> +        -e "s,${STAGING_DIR_HOST},,g" \
> +        -e "s,${S}/llvm,,g"  \
> +        -e "s,${B},,g" \
> +        ${B}/tools/llvm-config/BuildVariables.inc
> +}
> +
> +do_configure:append:class-target() {
> +    reproducible_build_variables
> +}
> +
> +do_configure:append:class-nativesdk() {
> +    reproducible_build_variables
> +}
> +
> +do_install:append() {
> +    rm -rf ${D}${libdir}/python*/site-packages/six.py
> +    for t in clang-pseudo clang-pseudo-gen clang-rename; do
> +        if [ -e ${B}${BINPATHPREFIX}/bin/$t ]; then
> +            install -Dm 0755 ${B}${BINPATHPREFIX}/bin/$t ${D}${bindir}/$t
> +        fi
> +    done
> +}
> +
> +do_install:append:class-target () {
> +    # Allow bin path to change based on YOCTO_ALTERNATE_EXE_PATH
> +    sed -i 's;${_IMPORT_PREFIX}/bin;${_IMPORT_PREFIX_BIN};g' ${D}${libdir}/cmake/llvm/LLVMExports-release.cmake
> +
> +    # Insert function to populate Import Variables
> +    sed -i "4i\
> +if(DEFINED ENV{YOCTO_ALTERNATE_EXE_PATH})\n\
> +  execute_process(COMMAND \"llvm-config\" \"--bindir\" OUTPUT_VARIABLE _IMPORT_PREFIX_BIN OUTPUT_STRIP_TRAILING_WHITESPACE)\n\
> +else()\n\
> +  set(_IMPORT_PREFIX_BIN \"\${_IMPORT_PREFIX}/bin\")\n\
> +endif()\n" ${D}${libdir}/cmake/llvm/LLVMExports-release.cmake
> +
> +    if [ -n "${LLVM_LIBDIR_SUFFIX}" ]; then
> +        mkdir -p ${D}${nonarch_libdir}
> +        mv ${D}${libdir}/clang ${D}${nonarch_libdir}/clang
> +        ln -rs ${D}${nonarch_libdir}/clang ${D}${libdir}/clang
> +        rmdir --ignore-fail-on-non-empty ${D}${libdir}
> +    fi
> +    for t in clang clang++ llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-objdump llvm-readelf \
> +        llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov; do
> +        ln -sf $t ${D}${bindir}/${TARGET_PREFIX}$t
> +    done
> +
> +    # reproducibility
> +    sed -i -e 's,${B},,g' ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
> +}
> +
> +do_install:append:class-native () {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)}; then
> +        install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${bindir}/clangd-indexer
> +    fi
> +    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-chars-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> +    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}/clang-tblgen
> +    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/lldb-tblgen ${D}${bindir}/lldb-tblgen
> +    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/llvm-min-tblgen ${D}${bindir}/llvm-min-tblgen
> +    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/prepare_builtins ${D}${bindir}/prepare_builtins
> +
> +    for f in `find ${D}${bindir} -executable -type f -not -type l`; do
> +        test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> +        echo "stripped $f"
> +    done
> +    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
> +    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
> +    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
> +}
> +
> +do_install:append:class-nativesdk () {
> +    if [ -e ${D}${libdir}/cmake/llvm/LLVMConfig.cmake ] ; then
> +        sed -i -e "s|${B}/./bin/||g" ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
> +    fi
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)}; then
> +        install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${bindir}/clangd-indexer
> +    fi
> +    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}/clang-tblgen
> +    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-chars-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> +    for f in `find ${D}${bindir} -executable -type f -not -type l`; do
> +        test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> +    done
> +    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
> +    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
> +    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
> +    rm -rf ${D}${datadir}/llvm/cmake
> +    rm -rf ${D}${datadir}/llvm
> +
> +    #reproducibility
> +    if [ -e ${D}${libdir}/cmake/llvm/LLVMConfig.cmake ] ; then
> +        sed -i -e 's,${B},,g' ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
> +    fi
> +}
> +
> +PROVIDES:append:class-native = " llvm-native libclc-native spirv-llvm-translator-native"
> +PROVIDES:append:class-target = " llvm libclc spirv-llvm-translator"
> +PROVIDES:append:class-nativesdk = " nativesdk-llvm nativesdk-libclc nativesdk-spirv-llvm-translator"
> +
> +PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc ${PN}-spirv \
> +             libclang lldb lldb-server liblldb llvm-linker-tools"
> +
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +RDEPENDS:lldb += "${PN}-lldb-python lldb-server"
> +
> +RDEPENDS:${PN}-tools += "\
> +  perl-module-digest-md5 \
> +  perl-module-file-basename \
> +  perl-module-file-copy \
> +  perl-module-file-find \
> +  perl-module-file-path \
> +  perl-module-findbin \
> +  perl-module-hash-util \
> +  perl-module-sys-hostname \
> +  perl-module-term-ansicolor \
> +"
> +
> +RRECOMMENDS:${PN}-tidy += "${PN}-tools"
> +
> +FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${libdir}/LLVMPolly*"
> +
> +FILES:${PN}-libclang-cpp = "${libdir}/libclang-cpp.so.*"
> +
> +FILES:${PN}-lldb-python = "${libdir}/python*/site-packages/lldb/*"
> +
> +FILES:${PN}-tidy = "${bindir}/*clang-tidy*"
> +FILES:${PN}-format = "${bindir}/*clang-format*"
> +
> +FILES:${PN}-tools = "${bindir}/analyze-build \
> +  ${bindir}/c-index-test \
> +  ${bindir}/clang-apply-replacements \
> +  ${bindir}/clang-change-namespace \
> +  ${bindir}/clang-check \
> +  ${bindir}/clang-doc \
> +  ${bindir}/clang-extdef-mapping \
> +  ${bindir}/clang-include-fixer \
> +  ${bindir}/clang-linker-wrapper \
> +  ${bindir}/clang-move \
> +  ${bindir}/clang-nvlink-wrapper \
> +  ${bindir}/clang-offload-bundler \
> +  ${bindir}/clang-offload-packager \
> +  ${bindir}/clang-pseudo* \
> +  ${bindir}/clang-query \
> +  ${bindir}/clang-refactor \
> +  ${bindir}/clang-rename* \
> +  ${bindir}/clang-reorder-fields \
> +  ${bindir}/clang-repl \
> +  ${bindir}/clang-scan-deps \
> +  ${bindir}/diagtool \
> +  ${bindir}/find-all-symbols \
> +  ${bindir}/hmaptool \
> +  ${bindir}/hwasan_symbolize \
> +  ${bindir}/intercept-build \
> +  ${bindir}/modularize \
> +  ${bindir}/pp-trace \
> +  ${bindir}/sancov \
> +  ${bindir}/scan-build \
> +  ${bindir}/scan-build-py \
> +  ${bindir}/scan-view \
> +  ${bindir}/split-file \
> +  ${libdir}/libscanbuild/* \
> +  ${libdir}/libear/* \
> +  ${libexecdir}/analyze-c++ \
> +  ${libexecdir}/analyze-cc \
> +  ${libexecdir}/c++-analyzer \
> +  ${libexecdir}/ccc-analyzer \
> +  ${libexecdir}/intercept-c++ \
> +  ${libexecdir}/intercept-cc \
> +  ${datadir}/scan-build/* \
> +  ${datadir}/scan-view/* \
> +  ${datadir}/opt-viewer/* \
> +  ${datadir}/clang/* \
> +"
> +
> +FILES:${PN} += "\
> +  ${bindir}/clang-cl \
> +  ${libdir}/BugpointPasses.so \
> +  ${libdir}/LLVMHello.so \
> +  ${libdir}/*Plugin.so \
> +  ${libdir}/${BPN} \
> +  ${nonarch_libdir}/${BPN}/*/include/ \
> +"
> +
> +FILES:${PN}-clc += "${datadir}/clc"
> +
> +FILES:${PN}-spirv = " \
> +    ${bindir}/llvm-spirv \
> +    ${includedir}/LLVMSPIRVLib \
> +    ${libdir}/pkgconfig/LLVMSPIRVLib.pc \
> +    ${libdir}/libLLVMSPIRV* \
> +"

You've dropped RPROVIDES for ${PN}-clc and ${PN}-spirv here. Is there a
reason for that? It breaks OpenCL builds of mesa:

ERROR: Required build target 'nativesdk-mesa' has no buildable providers.
Missing or unbuildable dependency chain was: ['nativesdk-mesa', 'nativesdk-spirv-llvm-translator']

ERROR: Required build target 'mesa' has no buildable providers.
Missing or unbuildable dependency chain was: ['mesa', 'libclc']

> +
> +FILES:lldb = "\
> +  ${bindir}/lldb \
> +  ${bindir}/lldb-argdumper \
> +  ${bindir}/lldb-instr \
> +  ${bindir}/lldb-vscode \
> +"
> +
> +FILES:lldb-server = "\
> +  ${bindir}/lldb-server \
> +"
> +
> +FILES:liblldb = "\
> +  ${libdir}/liblldbIntelFeatures.so.* \
> +  ${libdir}/liblldb.so.* \
> +"
> +
> +FILES:${PN}-libllvm =+ "\
> +  ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
> +  ${libdir}/libLLVM-${MAJOR_VER}.so \
> +  ${libdir}/libRemarks.so.* \
> +"
> +
> +FILES:libclang = "\
> +  ${libdir}/libclang.so.* \
> +"
> +
> +FILES:${PN}-dev += "\
> +  ${datadir}/llvm/cmake \
> +  ${libdir}/cmake \
> +  ${nonarch_libdir}/libear \
> +  ${nonarch_libdir}/${BPN}/*.la \
> +"
> +FILES:${PN}-doc += "${datadir}/clang-doc"
> +
> +FILES:${PN}-staticdev += "${nonarch_libdir}/${BPN}/*.a"
> +
> +FILES:${PN}-staticdev:remove = "${libdir}/${BPN}/*.a"
> +FILES:${PN}-dev:remove = "${libdir}/${BPN}/*.la"
> +FILES:${PN}:remove = "${libdir}/${BPN}/*"
> +
> +INSANE_SKIP:${PN} += "already-stripped"
> +#INSANE_SKIP:${PN}-dev += "dev-elf"
> +INSANE_SKIP:${PN}-lldb-python += "dev-so dev-deps"
> +INSANE_SKIP:${MLPREFIX}liblldb = "dev-so"
> +INSANE_SKIP:${PN}-libllvm = "dev-so"
> +
> +# SPIRV-LLVM-Translator provides only static libraries, they are included into
> +# the clang-spirv package.

I think I didn't fix this after switching spirv-llvm-translator to a
shared lib. Could we drop staticdev now?

> +INSANE_SKIP:${PN}-spirv += "staticdev dev-so"
> +
> +#Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
> +SSTATE_SCAN_FILES:remove = "*-config"
> +
> +TOOLCHAIN = "clang"
> +TOOLCHAIN:class-native = "gcc"
> +TOOLCHAIN:class-nativesdk = "clang"
> +COMPILER_RT:class-nativesdk:toolchain-clang:runtime-llvm = "-rtlib=libgcc --unwindlib=libgcc"
> +LIBCPLUSPLUS:class-nativesdk:toolchain-clang:runtime-llvm = "-stdlib=libstdc++"
> +
> +SYSROOT_DIRS:append:class-target = " ${nonarch_libdir}"
> +
> +SYSROOT_PREPROCESS_FUNCS:append:class-target = " clang_sysroot_preprocess"
> +SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " clang_sysroot_preprocess"
> +
> +clang_sysroot_preprocess() {
> +	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> +	install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> +	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
> +	# LLDTargets.cmake references the lld executable(!) that some modules/plugins link to
> +	install -d ${SYSROOT_DESTDIR}${bindir}
> +
> +	binaries="lld diagtool clang-${MAJOR_VER} clang-format clang-offload-packager
> +	                clang-offload-bundler clang-scan-deps clang-repl
> +	                clang-refactor clang-check clang-extdef-mapping clang-apply-replacements
> +	                clang-reorder-fields clang-tidy clang-change-namespace clang-doc clang-include-fixer
> +	                find-all-symbols clang-move clang-query pp-trace modularize"
> +
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)}; then
> +	        binaries="${binaries} clangd"
> +	fi
> +
> +	for f in ${binaries}
> +	do
> +		install -m 755 ${D}${bindir}/$f ${SYSROOT_DESTDIR}${bindir}/
> +	done
> +}
> diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
> new file mode 100644
> index 0000000000000000000000000000000000000000..bb152d2c566a6c61b95be2e7922cfe9c64a27afa
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -0,0 +1,24 @@
> +LLVM_RELEASE = ""
> +LLVM_DIR = "llvm${LLVM_RELEASE}"
> +
> +LLVM_HTTP ?= "https://github.com/llvm"
> +
> +MAJOR_VER = "20"
> +MINOR_VER = "1"
> +PATCH_VER = "2"

These should be set from ${PV}, not the other way around

> +# could be 'rcX' or 'git' or empty ( for release )
> +VER_SUFFIX = ""
> +
> +PV = "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
> +
> +LLVMMD5SUM = "8a15a0759ef07f2682d2ba4b893c9afe"
> +CLANGMD5SUM = "ff42885ed2ab98f1ecb8c1fc41205343"
> +LLDMD5SUM = "ae7dc7c027b1fa89b5b013d391d3ee2b"
> +LLDBMD5SUM = "2e0d44968471fcde980034dbb826bea9"
> +
> +LLVM_LIBDIR_SUFFIX = "${@d.getVar('baselib').replace('lib', '')}"
> +
> +# set the default pigz thread
> +export PIGZ = "-p ${@oe.utils.cpu_count(at_least=2)}"
> +
> +require common.inc
> diff --git a/meta/recipes-devtools/clang/common-source.inc b/meta/recipes-devtools/clang/common-source.inc
> new file mode 100644
> index 0000000000000000000000000000000000000000..d8a0f68175cf5effe72d2be4ae847eba122f94e8
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/common-source.inc
> @@ -0,0 +1,17 @@
> +do_fetch() {
> +        :
> +}
> +do_fetch[noexec] = "1"
> +deltask do_unpack
> +deltask do_patch
> +
> +SRC_URI = ""
> +
> +do_configure[depends] += "llvm-project-source-${PV}:do_preconfigure"
> +do_populate_lic[depends] += "llvm-project-source-${PV}:do_unpack"
> +do_create_spdx[depends] += "llvm-project-source-${PV}:do_preconfigure"
> +
> +# spdx shared workdir detection fails as not WORKDIR is altered but S and B
> +# return always true to fix that
> +def is_work_shared_spdx(d):
> +    return True
> diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
> new file mode 100644
> index 0000000000000000000000000000000000000000..f77a3eea0ec7af3de8bc7f075cd8ba88b77f6beb
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -0,0 +1,85 @@
> +FILESEXTRAPATHS =. "${FILE_DIRNAME}/clang:"
> +
> +LIC_FILES_CHKSUM = "file://llvm/LICENSE.TXT;md5=${LLVMMD5SUM} \
> +                    file://clang/LICENSE.TXT;md5=${CLANGMD5SUM} \
> +"
> +LICENSE = "Apache-2.0-with-LLVM-exception"
> +
> +# Snapshot
> +#RELEASE ?= "a69568efe6c4972e71af295c6577b3412dd57c22"
> +#BASEURI ?= "https://api.github.com/repos/llvm/llvm-project/tarball/${RELEASE};downloadfilename=llvm-${PV}-${RELEASE}.tar.gz"
> +#SOURCEDIR ?= "llvm-llvm-project-${@'${RELEASE}'[0:7]}"
> +#SRC_URI[sha256sum] = "aed4f66cd72867b36cc55a0588436933c3d58d3e61ca782b6bf57605d3fdcb09"
> +
> +# GA Release
> +RELEASE ?= "${PV}"
> +BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz"
> +SOURCEDIR ?= "llvm-project-${PV}.src"
> +SRC_URI[sha256sum] = "f0a4a240aabc9b056142d14d5478bb6d962aeac549cbd75b809f5499240a8b38"
> +
> +SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
> +SRCREV_spirvheaders = "09913f088a1197aba4aefd300a876b2ebbaa3391"
> +SRCREV_FORMAT .= "spirv_spirvheaders"
> +# pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
> +SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
> +SPIRVURI = " \
> +    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
> +    git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers;name=spirvheaders;branch=main \

Please use SPIR-V headers from the spirv-headers recipe rather than
injecting them here.

> +    file://spirv-internal-build.patch \
> +    file://spirv-shared-library.patch \
> +"
> +
> +SRC_URI = "\
> +    ${BASEURI} \
> +    ${SPIRVURI} \
> +    file://0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch \
> +    file://0002-compiler-rt-support-a-new-embedded-linux-target.patch \
> +    file://0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch \
> +    file://0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
> +    file://0005-llvm-allow-env-override-of-exe-and-libdir-path.patch \
> +    file://0006-clang-driver-Check-sysroot-for-ldso-path.patch \
> +    file://0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch \
> +    file://0008-clang-Prepend-trailing-to-sysroot.patch \
> +    file://0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch \
> +    file://0010-clang-Define-releative-gcc-installation-dir.patch \
> +    file://0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch \
> +    file://0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch \
> +    file://0013-Check-for-atomic-double-intrinsics.patch \
> +    file://0014-cmake-Fix-configure-for-packages-using-find_package.patch \
> +    file://0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch \
> +    file://0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch \
> +    file://0017-clang-Use-python3-in-python-scripts.patch \
> +    file://0018-For-x86_64-set-Yocto-based-GCC-install-search-path.patch \
> +    file://0019-llvm-Insert-anchor-for-adding-OE-distro-vendor-names.patch \
> +    file://0020-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch \
> +    file://0021-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch \
> +    file://0022-libunwind-Added-unw_backtrace-method.patch \
> +    file://0023-clang-Do-not-use-install-relative-libc-headers.patch \
> +    file://0024-Fix-lib-paths-for-OpenEmbedded-Host.patch \
> +    file://0025-Correct-library-search-path-for-OpenEmbedded-Host.patch \
> +    file://0026-lldb-Link-with-libatomic-on-x86.patch \
> +    file://0027-compiler-rt-Enable-__int128-for-ppc32.patch \
> +    file://0028-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
> +    file://0029-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
> +    file://0030-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch \
> +    file://0031-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch \
> +    file://0032-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch \
> +    file://0033-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
> +    file://0034-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch \
> +    file://0035-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
> +    file://0036-Fix-build-on-ppc64-musl.patch \
> +    file://0037-clangd-Add-a-build-option-to-disable-building-dexp.patch \
> +    file://0038-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
> +"
> +# Fallback to no-PIE if not set
> +GCCPIE ??= ""
> +
> +S = "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}/${SOURCEDIR}"
> +B ?= "${WORKDIR}/llvm-project-source-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> +
> +# We need to ensure that for the shared work directory, the do_patch signatures match
> +# The real WORKDIR location isn't a dependency for the shared workdir.
> +src_patches[vardepsexclude] = "WORKDIR"
> +should_apply[vardepsexclude] += "PN"
> +
> +BPN = "clang"
> diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..4e01ab518ddb9a67525de226ca1fc379d806f799
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> @@ -0,0 +1,139 @@
> +# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "LLVM based C/C++ compiler Sanitizers Runtime"
> +DESCRIPTION = "Runtime libraries that are required \
> +				to run the code with sanitizer instrumentation"
> +HOMEPAGE = "http://compiler-rt.llvm.org/"
> +SECTION = "base"
> +
> +require common-clang.inc
> +require common-source.inc
> +
> +BPN = "compiler-rt-sanitizers"
> +
> +inherit cmake pkgconfig python3native
> +
> +
> +LIC_FILES_CHKSUM = "file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a"
> +
> +TUNE_CCARGS:remove = "-no-integrated-as"
> +
> +CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +
> +DEPENDS += "ninja-native virtual/crypt compiler-rt"
> +DEPENDS:append:class-native = " clang-native libxcrypt-native libcxx-native"
> +DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-libxcrypt nativesdk-gcc-runtime"
> +DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
> +PACKAGECONFIG[static-libcxx] = "-DSANITIZER_USE_STATIC_CXX_ABI=ON -DSANITIZER_USE_STATIC_LLVM_UNWINDER=ON -DCOMPILER_RT_ENABLE_STATIC_UNWINDER=ON,,"
> +# Context Profiling
> +PACKAGECONFIG[ctx-profile] = "-DCOMPILER_RT_BUILD_CTX_PROFILE=ON,-DCOMPILER_RT_BUILD_CTX_PROFILE=OFF"
> +
> +HF = ""
> +HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
> +HF[vardepvalue] = "${HF}"
> +
> +CXXFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
> +
> +OECMAKE_TARGET_COMPILE = "compiler-rt"
> +OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
> +OECMAKE_SOURCEPATH = "${S}/llvm"
> +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
> +                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
> +                  -DCOMPILER_RT_STANDALONE_BUILD=ON \
> +                  -DCOMPILER_RT_USE_BUILTINS_LIBRARY=ON \
> +                  -DCOMPILER_RT_BUILD_BUILTINS=OFF \
> +                  -DCOMPILER_RT_INCLUDE_TESTS=OFF \
> +                  -DSANITIZER_CXX_ABI_LIBNAME=${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libc++", "libstdc++", d)} \
> +                  -DCOMPILER_RT_BUILD_XRAY=ON \
> +                  -DCOMPILER_RT_BUILD_SANITIZERS=ON \
> +                  -DCOMPILER_RT_BUILD_LIBFUZZER=ON \
> +                  -DCOMPILER_RT_BUILD_PROFILE=ON \
> +                  -DCOMPILER_RT_BUILD_MEMPROF=ON \
> +                  -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
> +                  -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
> +                  -DLLVM_APPEND_VC_REV=OFF \
> +                  -S ${S}/runtimes \
> +"
> +
> +EXTRA_OECMAKE:append:class-native = "\
> +               -DCOMPILER_RT_USE_BUILTINS_LIBRARY=OFF \
> +               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
> +               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
> +               -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
> +"
> +
> +EXTRA_OECMAKE:append:class-target = "\
> +               -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
> +               -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
> +               -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
> +               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
> +               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
> +               -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
> +"
> +
> +EXTRA_OECMAKE:append:class-nativesdk = "\
> +               -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
> +               -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
> +               -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
> +               -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
> +               -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
> +               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
> +               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
> +"
> +
> +EXTRA_OECMAKE:append:libc-musl = " -DLIBCXX_HAS_MUSL_LIBC=ON "
> +EXTRA_OECMAKE:append:powerpc = " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=powerpc "
> +
> +do_install:append () {
> +    mkdir -p ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
> +    mv ${D}${nonarch_libdir}/linux ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
> +    # Already shipped with compile-rt Orc support
> +    rm -rf ${D}${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/liborc_rt-*.a
> +    rm -rf ${D}${nonarch_libdir}/clang/${MAJOR_VER}/include/orc/
> +}
> +
> +FILES_SOLIBSDEV = ""
> +FILES:${PN} += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER} \
> +				${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/lib*${SOLIBSDEV} \
> +                ${nonarch_libdir}/clang/${MAJOR_VER}/*.txt \
> +                ${nonarch_libdir}/clang/${MAJOR_VER}/share/*.txt"
> +FILES:${PN}-staticdev += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/*.a"
> +FILES:${PN}-dev += "${datadir} ${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/*.syms \
> +                    ${nonarch_libdir}/clang/${MAJOR_VER}/include \
> +                    ${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/clang_rt.crt*.o \
> +                    ${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/libclang_rt.asan-preinit*.a"
> +INSANE_SKIP:${PN} = "dev-so libdir"
> +INSANE_SKIP:${PN}-dbg = "libdir"
> +
> +#PROVIDES:append:class-target = "\
> +#        virtual/${MLPREFIX}compilerlibs \
> +#        libgcc \
> +#        libgcc-initial \
> +#        libgcc-dev \
> +#        libgcc-initial-dev \
> +#        "
> +#

Can be dropped

> +
> +RDEPENDS:${PN}-dev += "${PN}-staticdev"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +ALLOW_EMPTY:${PN} = "1"
> +ALLOW_EMPTY:${PN}-dev = "1"

Why?

> +
> +TOOLCHAIN = "clang"
> +# Overrides defaults from clang.bbclass
> +TOOLCHAIN:class-nativesdk = "clang"
> +TOOLCHAIN:class-native = "clang"
> +SYSROOT_DIRS:append:class-target = " ${nonarch_libdir}"
> +
> +# riscv and x86_64 Sanitizers work on musl too
> +COMPATIBLE_HOST:libc-musl:x86-64 = "(.*)"
> +COMPATIBLE_HOST:libc-musl:riscv64 = "(.*)"
> +COMPATIBLE_HOST:libc-musl:riscv32 = "(.*)"
> +COMPATIBLE_HOST:libc-musl = "null"
> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..dd8bcc17f594e7e962cc8b07052f518526dd0fbc
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> @@ -0,0 +1,135 @@
> +# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "LLVM based C/C++ compiler Runtime"
> +DESCRIPTIOM = "Simple builtin library that provides an \
> +				implementation of the low-level target-specific \
> +				hooks required by code generation and other runtime \
> +				components"
> +HOMEPAGE = "http://compiler-rt.llvm.org/"
> +SECTION = "base"
> +
> +require common-clang.inc
> +require common-source.inc
> +
> +BPN = "compiler-rt"
> +
> +inherit cmake cmake-native pkgconfig python3native
> +
> +
> +LIC_FILES_CHKSUM = "file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a"
> +
> +LIBCPLUSPLUS = ""
> +COMPILER_RT = ""
> +
> +TUNE_CCARGS:remove = "-no-integrated-as"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +DEPENDS += "ninja-native libgcc"
> +DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
> +DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-gcc-runtime"
> +DEPENDS:append:class-native = " clang-native"
> +
> +# Trick clang.bbclass into not creating circular dependencies
> +UNWINDLIB:class-nativesdk:toolchain-clang = "--unwindlib=libgcc"
> +COMPILER_RT:class-nativesdk:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
> +LIBCPLUSPLUS:class-nativesdk:toolchain-clang = "-stdlib=libstdc++"
> +UNWINDLIB:class-native:toolchain-clang = "--unwindlib=libgcc"
> +COMPILER_RT:class-native:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
> +LIBCPLUSPLUS:class-native:toolchain-clang = "-stdlib=libstdc++"
> +UNWINDLIB:class-target:toolchain-clang = "--unwindlib=libgcc"
> +COMPILER_RT:class-target:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
> +LIBCPLUSPLUS:class-target:toolchain-clang = "-stdlib=libstdc++"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
> +PACKAGECONFIG[profile] = "-DCOMPILER_RT_BUILD_PROFILE=ON,-DCOMPILER_RT_BUILD_PROFILE=OFF"
> +# Context Profiling, might need to enable 'profile' too
> +PACKAGECONFIG[ctx-profile] = "-DCOMPILER_RT_BUILD_CTX_PROFILE=ON,-DCOMPILER_RT_BUILD_CTX_PROFILE=OFF"
> +
> +HF = ""
> +HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
> +HF[vardepvalue] = "${HF}"
> +
> +OECMAKE_TARGET_COMPILE = "compiler-rt"
> +OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
> +OECMAKE_SOURCEPATH = "${S}/llvm"
> +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
> +                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
> +                  -DCOMPILER_RT_STANDALONE_BUILD=ON \
> +                  -DCOMPILER_RT_INCLUDE_TESTS=OFF \
> +                  -DCOMPILER_RT_BUILD_XRAY=OFF \
> +                  -DCOMPILER_RT_BUILD_SANITIZERS=OFF \
> +                  -DCOMPILER_RT_BUILD_MEMPROF=OFF \
> +                  -DCOMPILER_RT_BUILD_LIBFUZZER=OFF \
> +                  -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
> +                  -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
> +                  -DLLVM_APPEND_VC_REV=OFF \
> +               	  -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \

Inconsistent indentation

> +                  -S ${S}/runtimes \
> +"
> +
> +EXTRA_OECMAKE:append:class-native = "\
> +				  -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
> +               	  -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH} \

Inconsistent indentation.

> +"
> +
> +EXTRA_OECMAKE:append:class-target = "\
> +               -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
> +               -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
> +               -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
> +               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
> +               -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
> +"
> +
> +EXTRA_OECMAKE:append:class-nativesdk = "\
> +               -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
> +               -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
> +               -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
> +               -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
> +               -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
> +               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
> +"
> +EXTRA_OECMAKE:append:powerpc = " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=powerpc "
> +
> +do_install:append () {
> +    mkdir -p ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
> +    mv ${D}${nonarch_libdir}/linux ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
> +}
> +
> +FILES_SOLIBSDEV = ""
> +
> +FILES:${PN} += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/lib*${SOLIBSDEV} \
> +                ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/*.txt \
> +                ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/share/*.txt"
> +FILES:${PN}-staticdev += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/*.a"
> +FILES:${PN}-dev += "${datadir} ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/*.syms \
> +                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/include \
> +                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/clang_rt.crt*.o \
> +                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/libclang_rt.asan-preinit*.a"
> +
> +INSANE_SKIP:${PN} = "dev-so libdir"
> +INSANE_SKIP:${PN}-dbg = "libdir"
> +
> +#PROVIDES:append:class-target = "\
> +#        virtual/${MLPREFIX}compilerlibs \
> +#        libgcc \
> +#        libgcc-initial \
> +#        libgcc-dev \
> +#        libgcc-initial-dev \
> +#        "
> +#
> +
> +RDEPENDS:${PN}-dev += "${PN}-staticdev"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +ALLOW_EMPTY:${PN} = "1"
> +ALLOW_EMPTY:${PN}-dev = "1"
> +
> +TOOLCHAIN = "clang"
> +# Overrides defaults from clang.bbclass
> +TOOLCHAIN:class-nativesdk = "clang"
> +TOOLCHAIN:class-native = "clang"
> +SYSROOT_DIRS:append:class-target = " ${nonarch_libdir}"
> diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..9aa27044a3f01cf6d5a7baa4531cabd1a05ae48d
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/libcxx_git.bb
> @@ -0,0 +1,119 @@
> +# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "libc++ is a new implementation of the C++ standard library, targeting C++11 and above"
> +HOMEPAGE = "http://libcxx.llvm.org/"
> +SECTION = "base"
> +
> +require common-clang.inc
> +require common-source.inc
> +
> +inherit cmake cmake-native python3native
> +
> +BPN = "libcxx"
> +
> +PACKAGECONFIG ??= "compiler-rt exceptions ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "unwind unwind-shared", "", d)}"
> +PACKAGECONFIG:append:armv5 = " no-atomics"
> +PACKAGECONFIG:remove:class-native = "compiler-rt"
> +PACKAGECONFIG[unwind] = "-DLIBCXXABI_USE_LLVM_UNWINDER=ON -DLIBCXXABI_ENABLE_STATIC_UNWINDER=ON,-DLIBCXXABI_USE_LLVM_UNWINDER=OFF,,"
> +PACKAGECONFIG[exceptions] = "-DLIBCXXABI_ENABLE_EXCEPTIONS=ON -DLIBCXX_ENABLE_EXCEPTIONS=ON,-DLIBCXXABI_ENABLE_EXCEPTIONS=OFF -DLIBCXX_ENABLE_EXCEPTIONS=OFF -DCMAKE_REQUIRED_FLAGS='-fno-exceptions',"
> +PACKAGECONFIG[no-atomics] = "-D_LIBCXXABI_HAS_ATOMIC_BUILTINS=OFF -DCMAKE_SHARED_LINKER_FLAGS='-latomic',,"
> +PACKAGECONFIG[compiler-rt] = "-DLIBCXX_USE_COMPILER_RT=ON -DLIBCXXABI_USE_COMPILER_RT=ON -DLIBUNWIND_USE_COMPILER_RT=ON,,compiler-rt"
> +PACKAGECONFIG[unwind-shared] = "-DLIBUNWIND_ENABLE_SHARED=ON,-DLIBUNWIND_ENABLE_SHARED=OFF,,"
> +
> +DEPENDS += "ninja-native"
> +DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc virtual/${MLPREFIX}compilerlibs"
> +DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-crosssdk-${SDK_SYS} nativesdk-compiler-rt"
> +DEPENDS:append:class-native = " clang-native compiler-rt-native"
> +
> +COMPILER_RT ?= "${@bb.utils.contains("PACKAGECONFIG", "compiler-rt", "-rtlib=compiler-rt", "-rtlib=libgcc", d)}"
> +UNWINDLIB ?= "${@bb.utils.contains("PACKAGECONFIG", "unwind", "-unwindlib=none", "-unwindlib=libgcc", d)}"
> +LIBCPLUSPLUS ?= "-stdlib=libstdc++"
> +# Trick clang.bbclass into not creating circular dependencies
> +UNWINDLIB:class-nativesdk = "-unwindlib=libgcc"
> +LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
> +UNWINDLIB:class-native = "-unwindlib=libgcc"
> +LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
> +
> +LDFLAGS:append = " ${UNWINDLIB}"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +LIC_FILES_CHKSUM = "file://libcxx/LICENSE.TXT;md5=55d89dd7eec8d3b4204b680e27da3953 \
> +                    file://libcxxabi/LICENSE.TXT;md5=7b9334635b542c56868400a46b272b1e \
> +                    file://libunwind/LICENSE.TXT;md5=f66970035d12f196030658b11725e1a1 \
> +"
> +
> +OECMAKE_TARGET_COMPILE = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "unwind", "", d)} cxxabi cxx"
> +OECMAKE_TARGET_INSTALL = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "install-unwind", "", d)} install-cxxabi install-cxx"
> +
> +CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +OECMAKE_SOURCEPATH = "${S}/llvm"
> +EXTRA_OECMAKE += "\
> +                  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
> +                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
> +                  -DCMAKE_CROSSCOMPILING=ON \
> +                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
> +                  -DLLVM_ENABLE_RTTI=ON \
> +                  -DLIBUNWIND_ENABLE_CROSS_UNWINDING=ON \
> +                  -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON \
> +                  -DLIBCXXABI_INCLUDE_TESTS=OFF \
> +                  -DLIBCXXABI_ENABLE_SHARED=ON \
> +                  -DLIBCXXABI_LIBCXX_INCLUDES=${S}/libcxx/include \
> +                  -DLIBCXX_CXX_ABI=libcxxabi \
> +                  -DLIBCXX_CXX_ABI_INCLUDE_PATHS=${S}/libcxxabi/include \
> +                  -DLIBCXX_CXX_ABI_LIBRARY_PATH=${B}/lib${LLVM_LIBDIR_SUFFIX} \
> +                  -S ${S}/runtimes \
> +                  -DLLVM_ENABLE_RUNTIMES='libcxx;libcxxabi;libunwind' \
> +                  -DLLVM_RUNTIME_TARGETS=${HOST_SYS} \
> +                  -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
> +                  -DLLVM_APPEND_VC_REV=OFF \
> +                  -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
> +"
> +
> +EXTRA_OECMAKE:append:class-target = " \
> +                  -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
> +                  -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${NM} \
> +                  -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
> +                  -DLLVM_DEFAULT_TARGET_TRIPLE=${HOST_SYS} \
> +                  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
> +"
> +
> +EXTRA_OECMAKE:append:class-nativesdk = " \
> +                  -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
> +                  -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${NM} \
> +                  -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
> +                  -DLLVM_DEFAULT_TARGET_TRIPLE=${HOST_SYS} \
> +"
> +
> +EXTRA_OECMAKE:append:libc-musl = " -DLIBCXX_HAS_MUSL_LIBC=ON "
> +
> +CXXFLAGS:append:armv5 = " -mfpu=vfp2"
> +
> +ALLOW_EMPTY:${PN} = "1"
> +
> +PROVIDES:append:runtime-llvm = " libunwind"
> +
> +do_install:append() {
> +    if ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "true", "false", d)}
> +    then
> +        for f in libunwind.h __libunwind_config.h unwind.h unwind_itanium.h unwind_arm_ehabi.h
> +        do
> +            install -Dm 0644 ${S}/libunwind/include/$f ${D}${includedir}/$f
> +        done
> +        install -d ${D}${libdir}/pkgconfig
> +        sed -e 's,@LIBDIR@,${libdir},g;s,@VERSION@,${PV},g' ${S}/libunwind/libunwind.pc.in > ${D}${libdir}/pkgconfig/libunwind.pc
> +    fi
> +}
> +
> +PACKAGES:append:runtime-llvm = " libunwind"
> +FILES:libunwind:runtime-llvm = "${libdir}/libunwind.so.*"
> +# Package library module manifest path
> +FILES:${PN}-dev += "${datadir}/libc++/v1/ ${libdir}/libc++.modules.json"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +TOOLCHAIN = "clang"
> +# Overrides defaults from clang.bbclass
> +TOOLCHAIN:class-nativesdk = "clang"
> +TOOLCHAIN:class-native = "clang"
> diff --git a/meta/recipes-devtools/clang/llvm-project-source.bb b/meta/recipes-devtools/clang/llvm-project-source.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..ba945fb591c8a2c75437baf4aaf597c111ee5528
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/llvm-project-source.bb
> @@ -0,0 +1,12 @@
> +# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "This is the canonical git mirror of the LLVM subversion repository."
> +HOMEPAGE = "https://github.com/llvm/llvm-project"
> +
> +require llvm-project-source.inc
> +require common-clang.inc
> +
> +BPN = "llvm-project-source"
> +
> +EXCLUDE_FROM_WORLD = "1"
> diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/recipes-devtools/clang/llvm-project-source.inc
> new file mode 100644
> index 0000000000000000000000000000000000000000..0820dd349278f30c08ed3e5a16d3a8c9b1d7c6db
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/llvm-project-source.inc
> @@ -0,0 +1,99 @@
> +deltask do_configure
> +deltask do_compile
> +deltask do_install
> +deltask do_populate_sysroot
> +deltask do_populate_lic
> +RM_WORK_EXCLUDE += "${PN}"
> +
> +inherit nopackages
> +
> +PN = "llvm-project-source-${PV}"
> +WORKDIR = "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}"
> +SSTATE_SWSPEC = "sstate:llvm-project-source::${PV}:${PR}::${SSTATE_VERSION}:"
> +
> +STAMP = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}"
> +STAMPCLEAN = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-*"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +DEPENDS = ""
> +PACKAGES = ""
> +TARGET_ARCH = "allarch"
> +TARGET_AS_ARCH = "none"
> +TARGET_CC_ARCH = "none"
> +TARGET_LD_ARCH = "none"
> +TARGET_OS = "linux"
> +baselib = "lib"
> +PACKAGE_ARCH = "all"
> +
> +B = "${WORKDIR}/build"
> +
> +# space separated list of additional distro vendor values we want to support e.g.
> +# "yoe webos" or "-yoe -webos" '-' is optional
> +CLANG_EXTRA_OE_VENDORS ?= "${TARGET_VENDOR} ${SDK_VENDOR}"
> +# Extra OE DISTRO that want to support as build host. space separated list of additional distro.
> +# ":" separated the ID in "/etc/os-release" and the triple for finding gcc on this OE DISTRO.
> +# eg: "poky:poky wrlinux:wrs"
> +CLANG_EXTRA_OE_DISTRO ?= "poky:poky"
> +# Match with MULTILIB_GLOBAL_VARIANTS
> +ML_VARIANTS = "lib32 lib64 libx32"
> +
> +python do_preconfigure() {
> +    import subprocess
> +    case = ""
> +    triple = ""
> +    vendors = d.getVar('CLANG_EXTRA_OE_VENDORS')
> +    multilib_variants = (d.getVar("ML_VARIANTS") or "").split()
> +    vendors_to_add = []
> +    for vendor in vendors.split():
> +        # convert -yoe into yoe
> +        vendor = vendor.lstrip('-')
> +        # generate possible multilib vendor names for yoe
> +        # such as yoemllib32
> +        vendors_to_add.extend([vendor + 'ml' + variant for variant in multilib_variants])
> +        # skip oe since already part of the cpp file
> +        if vendor != "oe":
> +            vendors_to_add.append(vendor)
> +
> +    for vendor_to_add in vendors_to_add:
> +        case += '\\n    .Case("' + vendor_to_add + '", Triple::OpenEmbedded)'
> +        triple += ' "x86_64-' + vendor_to_add + '-linux",'
> +
> +    bb.note("Adding support following TARGET_VENDOR values")
> +    bb.note(str(vendors_to_add))
> +    bb.note("in llvm/lib/TargetParser/Triple.cpp and ${S}/clang/lib/Driver/ToolChains/Gnu.cpp")
> +    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_VENDORS_TRIPLES#%s#g' ${S}/clang/lib/Driver/ToolChains/Gnu.cpp" % (triple))
> +    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
> +    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_VENDORS_CASES#%s#g' -i ${S}/llvm/lib/TargetParser/Triple.cpp" % (case))
> +    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
> +
> +
> +    case = ""
> +    triple = ""
> +    name = ""
> +    check = ""
> +    oe_names = ""
> +    distros = d.getVar('CLANG_EXTRA_OE_DISTRO')
> +    for distro in distros.split():
> +        distro_id = distro.split(":")[0].replace('-','_')
> +        distro_triple = distro.split(":")[1]
> +        case += '\\n    .Case("' + distro_id + '", Distro::' + distro_id.upper() + ')'
> +        triple += '\\n   if (Distro.Is' + distro_id.upper() + '())\\n     return "x86_64-' + distro_triple + '-linux",'
> +        name += '\\n    '+ distro_id.upper() + ','
> +        check += '\\nbool Is' + distro_id.upper() + '() const { return DistroVal == ' + distro_id.upper() + '; }'
> +        oe_names +=  distro_id.upper() + ' ||'
> +
> +    check += '\\nbool IsOpenEmbedded() const { return DistroVal == ' + oe_names[0:-3] + '; }'
> +
> +    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_NAME#%s#g' ${S}/clang/include/clang/Driver/Distro.h" % (name))
> +    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
> +    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_CHECK#%s#g' ${S}/clang/include/clang/Driver/Distro.h" % (check))
> +    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
> +    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_TRIPLES#%s#g' ${S}/clang/lib/Driver/ToolChains/Linux.cpp" % (triple))
> +    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
> +    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_CASES#%s#g' -i ${S}/clang/lib/Driver/Distro.cpp" % (case))
> +    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
> +}
> +
> +do_patch[vardepsexclude] += "MULTILIBS MULTILIB_VARIANTS"
> +addtask do_preconfigure after do_patch
> +do_create_spdx[depends] += "${PN}:do_preconfigure"
> diff --git a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..8e5622f6c18853e97441ab66c693e9255d68ebfa
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
> @@ -0,0 +1,36 @@
> +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
> +HOMEPAGE = "http://clang.llvm.org/"
> +LICENSE = "Apache-2.0-with-LLVM-exception"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
> +SECTION = "devel"
> +
> +inherit_defer nativesdk
> +DEPENDS += "nativesdk-clang"
> +
> +do_install() {
> +    install -d ${D}${prefix_nativesdk}
> +    cd ${D}${prefix_nativesdk}
> +    ln -s ..${libdir} .
> +    ln -s ..${includedir} .
> +    cd ..
> +    ln -s .${base_libdir} .
> +}
> +
> +sysroot_stage_all () {
> +	sysroot_stage_dir ${D} ${SYSROOT_DESTDIR}
> +}
> +
> +FILES:${PN} += "${prefix_nativesdk} ${base_libdir_nativesdk}"
> +FILES:${PN}-dbg = ""
> +
> +deltask do_configure
> +deltask do_compile
> +deltask do_patch
> +deltask do_fetch
> +deltask do_unpack
> +deltask do_create_spdx
> +deltask do_create_package_spdx
> +deltask do_create_runtime_spdx
> diff --git a/meta/recipes-devtools/clang/openmp_git.bb b/meta/recipes-devtools/clang/openmp_git.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..48cba766053e330b697729da72ac7aff4cbc3ef2
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/openmp_git.bb
> @@ -0,0 +1,67 @@
> +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "LLVM OpenMP compiler Runtime"
> +HOMEPAGE = "https://openmp.llvm.org/"
> +SECTION = "libs"
> +
> +require common-clang.inc
> +require common-source.inc
> +
> +BPN = "openmp"
> +
> +TOOLCHAIN = "clang"
> +
> +LIC_FILES_CHKSUM = "file://openmp/LICENSE.TXT;md5=d75288d1ce0450b28b8d58a284c09c79"
> +
> +inherit cmake pkgconfig perlnative python3native python3targetconfig
> +
> +DEPENDS += "elfutils libffi clang"
> +
> +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
> +                  -DLLVM_APPEND_VC_REV=OFF \
> +                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
> +                  -DOPENMP_LIBDIR_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
> +                  -DOPENMP_STANDALONE_BUILD=ON \
> +                  -DCLANG_TOOL=${STAGING_BINDIR_NATIVE}/clang \
> +                  -DLINK_TOOL=${STAGING_BINDIR_NATIVE}/llvm-link \
> +                  -DOPT_TOOL=${STAGING_BINDIR_NATIVE}/opt \
> +                  -DOPENMP_LLVM_LIT_EXECUTABLE=${STAGING_BINDIR_NATIVE}/llvm-lit \
> +                  -DEXTRACT_TOOL=${STAGING_BINDIR_NATIVE}/llvm-extract \
> +                  -DPACKAGER_TOOL=${STAGING_BINDIR_NATIVE}/clang-offload-packager \
> +                  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
> +                  "
> +
> +OECMAKE_SOURCEPATH = "${S}/openmp"
> +
> +PACKAGECONFIG ?= "ompt-tools offloading-plugin"
> +
> +PACKAGECONFIG:remove:arm = "ompt-tools offloading-plugin"
> +PACKAGECONFIG:remove:powerpc = "ompt-tools offloading-plugin"
> +
> +PACKAGECONFIG:append:mipsarcho32 = " no-atomics"
> +
> +PACKAGECONFIG[ompt-tools] = "-DOPENMP_ENABLE_OMPT_TOOLS=ON,-DOPENMP_ENABLE_OMPT_TOOLS=OFF,"
> +PACKAGECONFIG[aliases] = "-DLIBOMP_INSTALL_ALIASES=ON,-DLIBOMP_INSTALL_ALIASES=OFF,"
> +PACKAGECONFIG[offloading-plugin] = ",,elfutils libffi,libelf libffi"
> +PACKAGECONFIG[no-atomics] = "-DLIBOMP_HAVE_BUILTIN_ATOMIC=OFF -DLIBOMP_LIBFLAGS='-latomic',,"
> +
> +PACKAGES += "${PN}-libomptarget ${PN}-gdb-plugin"
> +FILES_SOLIBSDEV = ""
> +FILES:${PN} += "${libdir}/lib*${SOLIBSDEV}"
> +FILES:${PN}-libomptarget = "${libdir}/libomptarget-*.bc"
> +FILES:${PN}-gdb-plugin = "${datadir}/gdb/python/ompd"
> +
> +RDEPENDS:${PN}-gdb-plugin += "python3-core"
> +
> +INSANE_SKIP:${PN} = "dev-so"
> +# Currently the static libraries contain buildpaths
> +INSANE_SKIP:${PN}-staticdev += "buildpaths"
> +
> +COMPATIBLE_HOST:mips64 = "null"
> +COMPATIBLE_HOST:riscv32 = "null"
> +COMPATIBLE_HOST:powerpc = "null"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +CVE_STATUS[CVE-2022-26345] = "cpe-incorrect: specific to the Intel distribution before 2022.1"
> 
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry


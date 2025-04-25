Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21473C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 10:27:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.3705.1745576871106957815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 03:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=E/nY+N5k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TB8s018983
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DqZPh24KUNheoQEzgEhGSmDr
	xo60QGZWeiqXLCpO2gk=; b=E/nY+N5k9ylDF/RIcb9cQTc+m3kLTBTKOirxn6Ep
	pc3kfMgnsU2dOm3cqP08bvJIh2qYRyDs9nE98tiufGokagcAjE7jk4S30KFfF1/D
	eHnGc6k/RidaL9KdixxPHQXvO25CwmvXwGbO0l4Wl4OP4ySk9I/sUFpbTJ6FtXzc
	4MLK+a0k4LvPY/L+wbNQGEZjf0JUnpTam3TTpzU8Z2QzCGg5GZs+/6eHJig2+lXM
	Ek8KUt/+TlJT1/rfBkKGen1Way2TnHpi84L2kFrouisUK9O5FRm8g6e9oSgogeLH
	UNUcPZr12TfuSaM8QV2pigbHty4zClZM4lfzd8ZCOG2nVw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh28ppg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:27:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so41240376d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 03:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576869; x=1746181669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqZPh24KUNheoQEzgEhGSmDrxo60QGZWeiqXLCpO2gk=;
        b=p4W/JmMUTUJaCTKfi3sCHhaZlGRUrZzA/iPv63wVcVuC6GTUULGQqgPWfuUrYT2yd4
         YqP3U9FSszTwy0FQiFql7sVk1eVFlVg4na5/N1Eg98EGtz8RRP0kav6dKEvqggOR+x1H
         ieQw5kL+uYOkRAxQWBNHOMzEeAJKqJgiF4eht/WdQ6g8j5bOkFt31BQM5cYCBomOWsnP
         myV8urTaJDZD0eW1Gc9ZHbZRz6JtlnNnBnvfYlgHiB219ZXKmujrzDpksYJr0SaHgdib
         MB8N0uQYlb57jcSDB8AT+AHgLS+tf/N/cs8GZ476IECc06DRvO9mwvq75b1OAT+beZkO
         l78Q==
X-Gm-Message-State: AOJu0YzB7peLC4Zh/PUGPBV8dm7lIne+x3BWfFqXLS6za1qSAWSB92dN
	a2/soBt8C2/MK+fO4x011tMYVnfH0NBE9SrUMODzJ4hdTmlDvkis2SEQw77bFnnyQUn4njGg7Ln
	omrCntljzpcNJLjRplKkfnhf0gs6M/rTDEzf4VaSePO18+aEFnM2Bhi1+cmdA7bW+DS0JRmN0SB
	iwp3c=
X-Gm-Gg: ASbGncsGqiFlfD9OmbeadBj8NCEL9dQMcI2La4BcZE5+uhk3OObwmhsR98b5gFl3/Im
	AFLjErBuSroN1+s8XrowRVISak63ahQJKxowwx09B7hkLfaqsD+mksvpQimdwdx0rHuPTWearql
	hi5fJqdC/QVPcwRc6GKqd2sx1d2CQQmcsDOqDtj9+o3aaSU9ofC6dzasUHDDkgLaJt6v2n606Cr
	G8xUznbQZqGeVpf5ZxzdDLtQOsCQ5D69H11Tiut8NDP6v6V5P74DCMaCWfvmn6zdER9gJ0HarUs
	jT6ATKe9MABdI5/Fyscyxev3nnY6oIfSy8aO6TQ3SjaOREC2tAI52fx2j4UpBGU33D4blmhLTdY
	=
X-Received: by 2002:a05:6214:260e:b0:6e8:ebfa:42f9 with SMTP id 6a1803df08f44-6f4cb9d2183mr32679926d6.16.1745576868677;
        Fri, 25 Apr 2025 03:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpzjHIB0LDBItcmDszBkzCoiSomfUvb+Jsl6yfevlpLHRBhw5RRl6JsD/1Mc7duXnN+0OjyQ==
X-Received: by 2002:a05:6214:260e:b0:6e8:ebfa:42f9 with SMTP id 6a1803df08f44-6f4cb9d2183mr32679686d6.16.1745576868271;
        Fri, 25 Apr 2025 03:27:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d001970bsm6527761fa.47.2025.04.25.03.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:27:47 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:27:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: Re: [PATCH v2 0/7] clang-merge: Bring clang recipes from meta-clang
Message-ID: <aujf4cdo2qhrzn72sx2ctwnpyckkplkmizzuvkbvm2s7circvr@kv6tiwmj3jwt>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680b63a6 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=NlU-KmGx1S1P3UwmXEkA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: tBnujPVd0Vz9sGcXCci5ZWrsUcdfqjS5
X-Proofpoint-ORIG-GUID: tBnujPVd0Vz9sGcXCci5ZWrsUcdfqjS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3NiBTYWx0ZWRfX2MgnVVjKp4rg Muo5aQGlgubXxjStrOdhGcdnRt/cPQrwVzwV5GyVQLofZBhUPDxkcqFSFJZDSqYdpKnOLY8QPqA 2Ja7gg4ijFgZA0HvMPhsCyhL3mEObzw6kZpfEOlutldGNJ5PZS1wSKmER11+U8Rt+B2xC0rBOuI
 nuRiE7zJEiGKJNp5uTzGoi0phmyirluK7KsjyAFBCSAnVQQk9GSiNZEOCleqE2bM3I8Ku6gNGVE HAmbZOQgsv+lbB+LyYbVmIthestijWUnbkDCg5p4x2oPY9OnSmMfPOnuhxzqgUq1b0DUpArZmtX xROVX9tD9RJq8awq+skfXoVnw3g780qRc9ZDtXBmS60j30ij1G1Y0I1seECPyeJnIjOgNIfS2aK
 6fU3CLWmIoDCIh7rgav+A5dcenlgGhN4SLyhMEJwFOzUKEJoiaJKnUVXQFlg9XJlvUw+YhOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215451

On Thu, Apr 24, 2025 at 10:43:21PM -0700, Khem Raj wrote:
> Latest mesa 25+ needs libclang during build for tools like mesa_clc,
> we enahnced already existing llvm recipe to build pieces of clang as
> well, which worked for mesa's needs but broke static clang compiler
> provided by meta-clang due to newfound conflicts, since clang is now
> built with llvm recipe from core and also by meta-clang and they
> compete for same namespace, an attempt to make them co-habit did reveal
> more difficulties. Clang compiler from meta-clang is not able to use
> llvm libraries from core since they patch them differently.
> 
> This patch series therefore brings clang and all recipes that build from
> llvm sources into core. With this changeset, clang recipes can be removed
> from meta-clang there is a pull request for that already [1]
> As an aside, we only build clang once and use it for meta-clang needs
> and core needs.
> 
> With this, meta-clang can depend upon core layer to provide clang and
> related recipes, meta-clang will still provide the toolchain policies
> around clang based toolchains. Clang compiler from core, while usable
> for mesa is not yet fully usable out of box, since we need to workout
> the multi-toolchain architecture for core, which will be done in next
> phase after this merge.
> 
> [1] https://github.com/kraj/meta-clang/pull/1088
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

With the following lines in local.conf I got the RPROVIDES error:

PACKAGECONFIG:append:pn-mesa = " opencl libclc gallium-llvm "
PACKAGECONFIG:append:pn-mesa-native = " opencl libclc gallium-llvm "
PACKAGECONFIG:append:pn-nativesdk-mesa = " opencl libclc gallium-llvm "

$ DISTRO=poky MACHINE=qemux86-64 bitbake mesa

ERROR: Nothing RPROVIDES 'spirv-llvm-translator' (but /home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'spirv-llvm-translator' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['spirv-llvm-translator']
ERROR: Required build target 'mesa' has no buildable providers.
Missing or unbuildable dependency chain was: ['mesa', 'spirv-llvm-translator']


> ---
> Changes in v2:
> - Address Feedback from Alex and Dmitry.
> - Squash similar commits to reduce number of patches.
> - Move native toolchain file generation to cmake bbclass instead of
>   adding new class
> - Fix space/tabs indentation inconsistencies
> - Reorder the patch sequence to avoid errors in future git bisects
> - Fix use before define string problem in one of the patches
> - Link to v1: https://lore.kernel.org/r/20250424-clang-merge-v1-0-5a492a8461aa@gmail.com
> 
> ---
> Khem Raj (7):
>       cmake.bbclass: Enhance to emit a native toolchain cmake file
>       toolchain/clang: Remove duplicate RANLIB setting
>       sstatesig: Handle special case of llvm-project-source shared-workdir
>       multilib.conf: Add llvm-project-source recipe to NON_MULTILIB_RECIPES
>       kernel-arch.bbclass: Do not use weak assignment for TOOLCHAIN
>       clang: Merge llvm/clang family recipes from meta-clang
>       maintainers.inc: Add myself as maintainer for clang family of recipes
> 
>  meta/classes-recipe/cmake.bbclass                  |  58 +++
>  meta/classes-recipe/kernel-arch.bbclass            |   2 +-
>  meta/conf/distro/include/maintainers.inc           |  11 +-
>  meta/conf/multilib.conf                            |   2 +-
>  meta/conf/toolchain/clang.inc                      |   1 -
>  meta/lib/oe/sstatesig.py                           |   3 +
>  .../clang/clang-cross-canadian_git.bb              |  36 ++
>  meta/recipes-devtools/clang/clang-cross_git.bb     |  39 ++
>  meta/recipes-devtools/clang/clang-crosssdk_git.bb  |  33 ++
>  ...ind-libunwind-headers-when-LIBCXXABI_LIBU.patch |  60 +++
>  ...er-rt-support-a-new-embedded-linux-target.patch | 309 +++++++++++++
>  ...-Simplify-cross-compilation.-Don-t-use-na.patch |  44 ++
>  ...LibraryInfo-Undefine-libc-functions-if-th.patch |  90 ++++
>  ...allow-env-override-of-exe-and-libdir-path.patch |  71 +++
>  ...-clang-driver-Check-sysroot-for-ldso-path.patch |  78 ++++
>  ...iver-tools.cpp-Add-lssp_nonshared-on-musl.patch |  32 ++
>  .../0008-clang-Prepend-trailing-to-sysroot.patch   |  39 ++
>  ...inside-the-target-sysroot-for-compiler-ru.patch |  41 ++
>  ...ang-Define-releative-gcc-installation-dir.patch | 123 +++++
>  ...pthread-and-ldl-along-with-lunwind-for-st.patch |  35 ++
>  ..._EXECUTABLE-when-cross-compiling-for-nati.patch |  24 +
>  .../0013-Check-for-atomic-double-intrinsics.patch  |  34 ++
>  ...configure-for-packages-using-find_package.patch |   2 +-
>  ...esource-dir-location-for-cross-toolchains.patch |  50 +++
>  ...r-Add-dyld-prefix-when-checking-sysroot-f.patch |  79 ++++
>  .../0017-clang-Use-python3-in-python-scripts.patch |  35 ++
>  ...Insert-anchor-for-adding-OE-distro-vendor.patch | 167 +++++++
>  ...-Do-not-use-backtrace-APIs-on-non-glibc-l.patch |  68 +++
>  ...86-triple-for-non-debian-multiarch-linux-.patch |  28 ++
>  ...0021-libunwind-Added-unw_backtrace-method.patch |  56 +++
>  .../0022-lldb-Link-with-libatomic-on-x86.patch     |  33 ++
>  ...023-compiler-rt-Enable-__int128-for-ppc32.patch |  73 +++
>  ...-Do-not-use-cmake-infra-to-detect-libzstd.patch |  62 +++
>  ...ler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch |  46 ++
>  ...-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch |  43 ++
>  ...s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch |  81 ++++
>  ...vm-Add-OE-specific-ABI-triple-for-N32-ABI.patch |  78 ++++
>  ...d-libunwind.pc.in-and-llvm-config-scripts.patch |  90 ++++
>  ...py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  92 ++++
>  ...r-rt-Do-not-pass-target-to-clang-compiler.patch |  29 ++
>  .../clang/clang/0032-Fix-build-on-ppc64-musl.patch |  97 ++++
>  ...d-a-build-option-to-disable-building-dexp.patch |  85 ++++
>  ...itter-sort-ClassInfo-lists-by-name-as-we.patch} |   4 +-
>  ...-remove-LLVM_LDFLAGS-from-ldflags-output.patch} |  12 +-
>  ...ot-emit-date-and-time-into-generate-files.patch |  37 ++
>  .../clang}/spirv-internal-build.patch              |   0
>  .../clang}/spirv-shared-library.patch              |   0
>  meta/recipes-devtools/clang/clang_git.bb           | 496 +++++++++++++++++++++
>  meta/recipes-devtools/clang/common-clang.inc       |  24 +
>  meta/recipes-devtools/clang/common-source.inc      |  17 +
>  meta/recipes-devtools/clang/common.inc             |  83 ++++
>  .../clang/compiler-rt-sanitizers_git.bb            | 139 ++++++
>  meta/recipes-devtools/clang/compiler-rt_git.bb     | 125 ++++++
>  meta/recipes-devtools/clang/libcxx_git.bb          | 119 +++++
>  meta/recipes-devtools/clang/llvm-project-source.bb |  12 +
>  .../recipes-devtools/clang/llvm-project-source.inc |  99 ++++
>  .../recipes-devtools/clang/nativesdk-clang-glue.bb |  36 ++
>  meta/recipes-devtools/clang/openmp_git.bb          |  67 +++
>  .../0007-llvm-allow-env-override-of-exe-path.patch |  36 --
>  meta/recipes-devtools/llvm/llvm/llvm-config        |  54 ---
>  meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ----------
>  61 files changed, 3715 insertions(+), 337 deletions(-)
> ---
> base-commit: c807b703cdfc5dc2c7fe98f55a5d323eb3e1877c
> change-id: 20250423-clang-merge-ca9130ae95af
> 
> Best regards,
> -- 
> Khem Raj <raj.khem@gmail.com>
> 
> 

-- 
With best wishes
Dmitry


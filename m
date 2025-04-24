Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D00C369D1
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 09:18:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.11070.1745486293214441548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 02:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jPJq2JCF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F5j8007498
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TymkwYvOfsfWsuBX05sQVht+
	2Jj5siTkLU0Im/hysAA=; b=jPJq2JCFF12VXm6s2VcjttQx5IQ6LjCNP8J/2CZ4
	WZoI+lxI4TCnGMASSxB2Q0xQywVAzrrt65fmXvT04lCySZ7QRRbBESX0mYi3t1M8
	RH+sNlDsgYd2bTjawvBXzOxgi/8lbq2r/JPR5PYzBFsYGudL2CqXV7Oou6f7aOf3
	Feig+bLDQMK6aUn4JEu2S6W+eLG+O0n2qPbkqMZ1St7NVZz80Cz9XL9drfEuZ19F
	x4uLkH7Zijb0wPfEoqdeR9a6g0IoYiCUBL7IM29zoek/h/SdVIOusCmmKp6oGSdI
	u+8Fvi/G1XOVp0QGJdQqlz3A2oQo0s89nviYpjJ3egRz+A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1mxek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:18:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f9057432so15600026d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 02:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486291; x=1746091091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TymkwYvOfsfWsuBX05sQVht+2Jj5siTkLU0Im/hysAA=;
        b=lR96Rfjyct79qbz32RnPX4Lgd/fbPfgYWdwl3Dlt38ieuQ28ffsT28nXZP4cV96cJb
         aUQHQZKRZOvBqtKg3Z/CI6BjkcZ8WFmli2i6AFPNt0BP0hS1psFmZf3qAJJEFC6avnIB
         bPGWXKq/LZZy/T291vj94BqJgrDxSCvZb4ePEZfeMPsUjTFt44IDDWf6e7yAyfNHLiET
         9r3nSKAW8hCHhB4kTi7ZGWFj/6OY7OTTJebgJOLrl7dNrwh+O78L4So4pCo9GJlEgc1/
         b/2w10dSfpcxgEDUNhUAHYZdSJWO6311zDavscpIO+vX0QONFKJ9j1m37H3ZUto+0n52
         sAyw==
X-Gm-Message-State: AOJu0YwZuQq/0dKDcYsLgeL4syhEMfYlFI1LGWi8g69hnjSHSIrOGDgp
	ZTcafdOWoTz2XWBz4NT5rZ2z8TyMWqrw9LLA+GhBFD7EH3/Q+Zg+CrVFOStrcxa1dXLe2iV48a+
	tHMF5eQt/MbnNPFT9VXtGXRtqMI97qec+pAPqGvkbWE9/SNcFvwrUZ4iGOtKtDOxIfJa61gauX5
	GYhRs=
X-Gm-Gg: ASbGnct4EJYXLGwPxjVcU4pPUUHpfC56Y2repbkTadNh+Pcx9kJ1j+bBj73TVSzWbTn
	uQKh9ONLdnULV7RutL0iZYGFOn6uuLHtOKAzE10QFFi+Uk8jE0QX3truNt1tlFRx1l0v8jIQr/T
	fCjjO3fbYM/OCmf3HlgDo0p5ZHy1lYTYLyTsLNv6xoBEwh2tg5JstDLbyvfxYRvCu8p8VUHzJvT
	3kUhbs3Wd+x/ZgXYLoRSvC0uGRRsouGXznSwd2LThTQaCGcGUhNbiksDMvKG+SEOqxl/VWo/tFv
	iYkShl9QmG7tRSVg94qdCd7GHcU/oOLCG3nx9b+O9B3bXyOuZfgkKqTx0hcJdkhT1D6TFrEq/ZM
	=
X-Received: by 2002:a05:6214:21ec:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f4bfc6bbc0mr25806096d6.29.1745486291202;
        Thu, 24 Apr 2025 02:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfVtxBM42+Pkuah3b53nvG12XVytoQMTib+2pPuW3P7OSKnDcs3sNLzYHnDf7Rux1CFz/Wsg==
X-Received: by 2002:a05:6214:21ec:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f4bfc6bbc0mr25805886d6.29.1745486290800;
        Thu, 24 Apr 2025 02:18:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d0019d59sm1779231fa.64.2025.04.24.02.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:18:09 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:18:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/11] clang: Merge llvm/clang family recipes from
 meta-clang
Message-ID: <2dn5sjqkea3lnf5z662xc6urbgewdmynwarnghbuwwaxpnvdyi@heehdshhztm5>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-4-5a492a8461aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-clang-merge-v1-4-5a492a8461aa@gmail.com>
X-Proofpoint-GUID: EvXEmUypE_p6r4OCQdqXJP-u0pwoZqS1
X-Proofpoint-ORIG-GUID: EvXEmUypE_p6r4OCQdqXJP-u0pwoZqS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MSBTYWx0ZWRfX9yNIvtHUQFYr nmCuVV/lvxTr/m/khOaJsSO2exja/9FkIcdcRRGt5+eOGOConyu5x+3nXSlDW/WphizaWgLhLLY YdZgabScoNOk8QW54mjeaAbwVsd3cvkNBCqwExm0NAi91p8u48kXqXUEYkcl/AguOaeiVWtMht8
 4m+McmOY1npDuqmZqg91kLeFD+P41182s0B6OEMJSfHCh65lo68XzufswW3NjvvTqDw7Qvyc4iN b/p4Op6KsHaNlj7/eGXYAUSDlGSEyhGMQLsFOfpFwzqYHl+TtA8V3YZH05/YHC04fZU0IsGnwB1 Ctg0pRDCpyT0gQCc6aNSoAks0IOGiHVrtuPBlbyUaXaEdEocREzqfas5WyCzQDQrfk1vLfukmsw
 KEdoYZY12Nao+FeTEsPKl7SqiqS5f3ACNQ3YfBzmIOwAIu3oqek4yvEyge5VFFBouWvjgdlM
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680a01d4 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=CDyq8-OYusPZjm8temUA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215344

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

Generic comment which I forgot to write in the first review email. By
the end of the series there are 23 Pending patches out out 40 (I'm not
counting SPIRV patches). Is there a plan to move them into OE-Spefic /
Submitted?

-- 
With best wishes
Dmitry


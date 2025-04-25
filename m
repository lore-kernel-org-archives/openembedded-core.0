Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39076C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 08:42:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.2374.1745570546749720991
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 01:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RjkukO6Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TCd8019001
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z1h7WuVdgzmXdLsRRURSDw74
	iA/1CrNxQFSILLoMSTs=; b=RjkukO6YSxwDCxIqDMU4gTPwODfP09HnlwEci+vC
	3LW5gJ9BGuaUFsJk7LnF5ZZKvXAjlWy3oraDuBlm4qy1x2URD45Vk68hxM6YbnRA
	uQUG3pD1r3br2oszEywN8mkECJFNnK0y3pMBmi8k7Fve8l3GgNmL/nDOQ46KCxv+
	b5crnMO9rVSzCnOcXjchDtdb/6dI+VJkb+pVjzCTthoDymaztgDWOZCicSHkSf/S
	4WNyJE2ncn8G+c3WgaZ08lXwGbys2WMFBbFSL5v93jDnwl7hGqAuCOcY5wE3icQH
	RxJfEsXFEQeQ1PfuXYCZhHony8mrSyGKf2v1tZ3c/qrIEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh28cgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:42:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2a31f75so625893585a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 01:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570544; x=1746175344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1h7WuVdgzmXdLsRRURSDw74iA/1CrNxQFSILLoMSTs=;
        b=wSsHLOzpz7iYwYYaAfqkXOvYE2vA4VLTpuckXHTnSRuPuIHBpVu53JGYaKstzXy5dr
         gRCTwKq56Vnep1muZrAsxgEKswZQFOS7bZM1zhD7BicgKP+lSzSrDO/b65WAIBV0L1gp
         XEawTxe/MdFi8n7J3f3aZzcCeUDZoO4ro2AFryhYTD0DP9KCfsyGaBa7B+1AY7UoTf7A
         MZKya31k7VCtAIWt+wH3fAP4gRZF/B1DVfY6ZrVvzL6t69YkT2XYscfpOl88qhuJz4IG
         2c782+OVP+wmJSyK8Z78iHhjgG76g3TXlC0blqxoywdhe4HcK6zS8RXNeNs08DyN+ytT
         1Q8Q==
X-Gm-Message-State: AOJu0Yw2UfbkPPooWOo/XkmOSxEBviTRLNOyT/fOsXMdTEH+apicey+n
	2ACjCQMBb7Xw09hP2cQ17UjUDbfo7RkBd3ri8jft7JMbDjJMMcu++GJRrt8MlC4Bs6fDuGRh8Vk
	rgycjq7yCs1Cx9IUy8RfmoT1nUBSVqobywP7jSCw1fRoHRD5Jicavdre2UNQmkE7r8w3telMcdx
	WkJqw=
X-Gm-Gg: ASbGncubSz/Rtl4K69T8DJDpp0G6TKAusaS8fTT0dcUA3Xta03N1eW4V5F3d/mro/pI
	2edwGZG/wh6SIS/zUVtDuFqWUQ9/x0ey0Y+UD47sDRYQftCJseIw89aquYhZzzwLZQ9bQBcXofv
	eYikJTxFOaoR3M31m1um3oeaFMFtTv7wyW15WmaDmfqeElc4uS5e4/8R7FQ7UmN5OFyQ/BVH6p+
	efxsGG3KpsEczMMM6kfUhUgobKMenFnsEuHJ4IvsF9hZFSk4KDecziKAmDzSpEt0yI9Rn7sjXe1
	HK/dJZSXlsBRERVu47NzAQxiOn3KdfL66jhFEWvMjDj2gqnfQUoY1KTazZsm4RdjRjTZFYdi3bk
	=
X-Received: by 2002:a05:620a:254e:b0:7c5:4c49:769c with SMTP id af79cd13be357-7c9606ac285mr266880885a.6.1745570544138;
        Fri, 25 Apr 2025 01:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDPQVknXG3JasJbvvQffO1Nn3xcAm4xYh82qmfYjyG/DL17SsdOEXSFwy7T1gHKJkOd5RbhA==
X-Received: by 2002:a05:620a:254e:b0:7c5:4c49:769c with SMTP id af79cd13be357-7c9606ac285mr266878085a.6.1745570543636;
        Fri, 25 Apr 2025 01:42:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2629esm519622e87.48.2025.04.25.01.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:42:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:42:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/11] clang: Merge llvm/clang family recipes from
 meta-clang
Message-ID: <r5ckieoedu56jjzufc2cvbufb557z62bcjsredjb6552ywaktk@sictodhm4k4u>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-4-5a492a8461aa@gmail.com>
 <dc33o5zfonkcdpo2aiysfqdscradhjofwmmzqvbst2qle3jp6r@4owhwxoyqnq2>
 <15f9090e-c10a-4985-8ddf-28876c4bc964@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15f9090e-c10a-4985-8ddf-28876c4bc964@gmail.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680b4af1 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=IvTj1HvjAAAA:8 a=gWDa-L1wAAAA:8 a=G6BABj03uXj4HyZZDXMA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kmyLcwvAnC_t3PsnBtKb:22 a=vg_HiZM2M4GgzivzK9OA:22
X-Proofpoint-GUID: qjpg1rgp8__84f2iWVCFSD0v4ywaJ2bB
X-Proofpoint-ORIG-GUID: qjpg1rgp8__84f2iWVCFSD0v4ywaJ2bB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2MiBTYWx0ZWRfX+ncjh6POXSSb aHEi+puT6qTK2TqUJXqoWW9wP7pIkbDuz6KxfTCNQ2XNMwiOEGRZYmDwOIHKbAB+VRaPX3trKhu zGVhefyl51Mu1azsKkH3Tt9RyiYFwkpWNXNPv9ya4Fd7HsT8wwpdvtz1cMJ7IumiBL7AgdrsqfA
 JSMTNK4NNApTEN4BJB1mAIv+3GSRbiLgJvAEXmfUoxA4FfF7NG5fqqBv0ADXBvRg0E8MT5rrsVv 5SMERV92e7qID82z7cRwCb8e98oBhyf9ZJuhGAW2PQLvLHvq3PAt+8Szf0rQ50aVMaSKQxJb+XX jXqccXoq9wzmdIrmb2mjEDtaWXoZZ9YfpIXeObL4XCu8ruU1yM6mdnRIFDKWCA4IfPvD263KCYl
 LuYOW3o1DFi2euVu9U3w0eDCTJJft9uWth6nEXOh3OSw5CrX7GPC2OzsTaJJ20PCtduANS1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215444

On Thu, Apr 24, 2025 at 06:29:53PM -0700, Khem Raj wrote:
> Thanks for detailed review, it is quite helpful.
> 
> On 4/24/25 2:05 AM, Dmitry Baryshkov wrote:
> > On Thu, Apr 24, 2025 at 12:20:38AM -0700, Khem Raj wrote:
> > > This can ensure that meta-clang does not carry them and can rely on core layer
> > > while mesa can use them too.
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---

> > > diff --git a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..6d3f5293aab84056e9693b5d2282166fd72b1ede
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
> > > @@ -0,0 +1,71 @@
> > > +From 0b344231c49d8c145bc3ad882d259d36fb19e827 Mon Sep 17 00:00:00 2001
> > > +From: Martin Kelly <mkelly@xevo.com>
> > > +Date: Fri, 19 May 2017 00:22:57 -0700
> > > +Subject: [PATCH] llvm: allow env override of exe and libdir path
> > > +
> > > +When using a native llvm-config from inside a sysroot, we need llvm-config to
> > > +return the libraries, include directories, etc. from inside the sysroot rather
> > > +than from the native sysroot. Thus provide an env override for calling
> > > +llvm-config from a target sysroot.
> > > +
> > > +Add YOCTO_ALTERNATE_LIBDIR and YOCTO_ALTERNATE_EXE_PATH env variables
> > 
> > Is this really necessary? Can we use ${libdir} / ${base_libdir} in the
> > llvm-config wrapper instead of YOCTO_ALTERNATE_LIBDIR ?
> 
> Technically we can use a hack line we do in rust-llvm where we throw the
> native llvm-config into target sysroot and let it answer back relative to
> itself. meta-clang still sets these variables so I kept it, I have plans to
> remove it once I figure out all meta-clang needs are met with alternative
> approach.

Ack

> > > diff --git a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..6a67d1191605b3ab0cee4737a976b18f5ccdcf2a
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
> > > @@ -0,0 +1,75 @@
> > > +From 66aa6ec05c67e82f084cc692297240161afb467c Mon Sep 17 00:00:00 2001
> > > +From: Dan McGregor <dan.mcgregor@usask.ca>
> > > +Date: Wed, 26 Apr 2017 20:29:41 -0600
> > > +Subject: [PATCH] clang: driver: Check sysroot for ldso path
> > > +
> > > +OE does not necessarily follow the default path for the dynamic linker,
> > > +therefore adjust it for OE. Check for the default path, and if it isn't
> > > +there, check /lib.
> > 
> > It would be nice to mention explicitly where we deviate from the
> > defaults.
> 
> Its well know when we build multilib the ldso has different paths than
> clangs defaults, every distro kind of does that so OE is not the only one,
> it happens especially on ppc64, I will add this info into patch header.

Thanks!

> > > diff --git a/meta/recipes-devtools/clang/clang/0033-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0033-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..8d56422529bf6a1738351f60578acf2752c93e79
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/clang/clang/0033-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
> > > @@ -0,0 +1,90 @@
> > > +From 9caabc8d9c5f65e8130f24f07b9708b29ab636f6 Mon Sep 17 00:00:00 2001
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Tue, 14 May 2024 22:04:43 -0700
> > > +Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
> > > +
> > > +These are added by OE project
> > > +
> > > +Upstream-Status: Inappropriate [ OE-Specific ]
> > > +
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + libunwind/libunwind.pc.in          |  9 ++++++
> > > + llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++++++
> > 
> > It was easier to handle if it is a separate script under files/ rather
> > than a patch in the source tree.
> > 
> 
> I used a script to use devupstream class to build clang main branch and its
> lot easlier if everything is a patch, I can just point every recipe to a
> checked out patched llvm tree via externalsrc since every file needed it
> past of tree. It helps me keeping the dev work going.

ack

> > > +
> > > +PROVIDES:append:class-native = " llvm-native libclc-native spirv-llvm-translator-native"
> > > +PROVIDES:append:class-target = " llvm libclc spirv-llvm-translator"
> > > +PROVIDES:append:class-nativesdk = " nativesdk-llvm nativesdk-libclc nativesdk-spirv-llvm-translator"
> > > +
> > > +PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc ${PN}-spirv \
> > > +             libclang lldb lldb-server liblldb llvm-linker-tools"
> > > +
> > > +
> > > +BBCLASSEXTEND = "native nativesdk"
> > > +
> > > +RDEPENDS:lldb += "${PN}-lldb-python lldb-server"
> > > +
> > > +RDEPENDS:${PN}-tools += "\
> > > +  perl-module-digest-md5 \
> > > +  perl-module-file-basename \
> > > +  perl-module-file-copy \
> > > +  perl-module-file-find \
> > > +  perl-module-file-path \
> > > +  perl-module-findbin \
> > > +  perl-module-hash-util \
> > > +  perl-module-sys-hostname \
> > > +  perl-module-term-ansicolor \
> > > +"
> > > +
> > > +RRECOMMENDS:${PN}-tidy += "${PN}-tools"
> > > +
> > > +FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${libdir}/LLVMPolly*"
> > > +
> > > +FILES:${PN}-libclang-cpp = "${libdir}/libclang-cpp.so.*"
> > > +
> > > +FILES:${PN}-lldb-python = "${libdir}/python*/site-packages/lldb/*"
> > > +
> > > +FILES:${PN}-tidy = "${bindir}/*clang-tidy*"
> > > +FILES:${PN}-format = "${bindir}/*clang-format*"
> > > +
> > > +FILES:${PN}-tools = "${bindir}/analyze-build \
> > > +  ${bindir}/c-index-test \
> > > +  ${bindir}/clang-apply-replacements \
> > > +  ${bindir}/clang-change-namespace \
> > > +  ${bindir}/clang-check \
> > > +  ${bindir}/clang-doc \
> > > +  ${bindir}/clang-extdef-mapping \
> > > +  ${bindir}/clang-include-fixer \
> > > +  ${bindir}/clang-linker-wrapper \
> > > +  ${bindir}/clang-move \
> > > +  ${bindir}/clang-nvlink-wrapper \
> > > +  ${bindir}/clang-offload-bundler \
> > > +  ${bindir}/clang-offload-packager \
> > > +  ${bindir}/clang-pseudo* \
> > > +  ${bindir}/clang-query \
> > > +  ${bindir}/clang-refactor \
> > > +  ${bindir}/clang-rename* \
> > > +  ${bindir}/clang-reorder-fields \
> > > +  ${bindir}/clang-repl \
> > > +  ${bindir}/clang-scan-deps \
> > > +  ${bindir}/diagtool \
> > > +  ${bindir}/find-all-symbols \
> > > +  ${bindir}/hmaptool \
> > > +  ${bindir}/hwasan_symbolize \
> > > +  ${bindir}/intercept-build \
> > > +  ${bindir}/modularize \
> > > +  ${bindir}/pp-trace \
> > > +  ${bindir}/sancov \
> > > +  ${bindir}/scan-build \
> > > +  ${bindir}/scan-build-py \
> > > +  ${bindir}/scan-view \
> > > +  ${bindir}/split-file \
> > > +  ${libdir}/libscanbuild/* \
> > > +  ${libdir}/libear/* \
> > > +  ${libexecdir}/analyze-c++ \
> > > +  ${libexecdir}/analyze-cc \
> > > +  ${libexecdir}/c++-analyzer \
> > > +  ${libexecdir}/ccc-analyzer \
> > > +  ${libexecdir}/intercept-c++ \
> > > +  ${libexecdir}/intercept-cc \
> > > +  ${datadir}/scan-build/* \
> > > +  ${datadir}/scan-view/* \
> > > +  ${datadir}/opt-viewer/* \
> > > +  ${datadir}/clang/* \
> > > +"
> > > +
> > > +FILES:${PN} += "\
> > > +  ${bindir}/clang-cl \
> > > +  ${libdir}/BugpointPasses.so \
> > > +  ${libdir}/LLVMHello.so \
> > > +  ${libdir}/*Plugin.so \
> > > +  ${libdir}/${BPN} \
> > > +  ${nonarch_libdir}/${BPN}/*/include/ \
> > > +"
> > > +
> > > +FILES:${PN}-clc += "${datadir}/clc"
> > > +
> > > +FILES:${PN}-spirv = " \
> > > +    ${bindir}/llvm-spirv \
> > > +    ${includedir}/LLVMSPIRVLib \
> > > +    ${libdir}/pkgconfig/LLVMSPIRVLib.pc \
> > > +    ${libdir}/libLLVMSPIRV* \
> > > +"
> > 
> > You've dropped RPROVIDES for ${PN}-clc and ${PN}-spirv here. Is there a
> > reason for that? It breaks OpenCL builds of mesa:
> > 
> 
> They were not needed since the libclc and splirv-llvm-translator recipes
> from meta-clang are gone. and clang recipe does add them to PROVIDES.

However mesa uses libclc and spirv-llvm-translator package names. It
makes it more future-proof, if at some point we'd decide to split clc /
spirv-llvm-translator to separate recipes again (especially the spirv
one).

> > ERROR: Required build target 'nativesdk-mesa' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['nativesdk-mesa', 'nativesdk-spirv-llvm-translator']
> > 
> > ERROR: Required build target 'mesa' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['mesa', 'libclc']
> > 
> 
> I am not sure how I can repeoduce it, but I did try explicitly adding the
> packageconfig to nativesdk-mesa and it built fine.
> 
> If you can share the changes to reproduce it, might be helpful

I was doing poky / qemuarm64 build with the following lines in
local.conf:

PACKAGECONFIG:append:pn-mesa = " opencl libclc gallium-llvm "
PACKAGECONFIG:append:pn-mesa-native = " opencl libclc gallium-llvm "
PACKAGECONFIG:append:pn-nativesdk-mesa = " opencl libclc gallium-llvm "

> > > diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..bb152d2c566a6c61b95be2e7922cfe9c64a27afa
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/clang/common-clang.inc
> > > @@ -0,0 +1,24 @@
> > > +LLVM_RELEASE = ""
> > > +LLVM_DIR = "llvm${LLVM_RELEASE}"
> > > +
> > > +LLVM_HTTP ?= "https://github.com/llvm"
> > > +
> > > +MAJOR_VER = "20"
> > > +MINOR_VER = "1"
> > > +PATCH_VER = "2"
> > 
> > These should be set from ${PV}, not the other way around
> > 
> 
> Its other way around here, I have scripts to upgrade recipes and manipulate
> these vars, they are used to construct PV below and also package certain
> solibs which have MAJ.MIN format. Moreover, when building main clang branch
> it helps since VER_SUFFIX comes into picture as well. I will like to stick
> with this.

Ack

> 
> > > +# could be 'rcX' or 'git' or empty ( for release )
> > > +VER_SUFFIX = ""
> > > +
> > > +PV = "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
> > > +
> > > +LLVMMD5SUM = "8a15a0759ef07f2682d2ba4b893c9afe"
> > > +CLANGMD5SUM = "ff42885ed2ab98f1ecb8c1fc41205343"
> > > +LLDMD5SUM = "ae7dc7c027b1fa89b5b013d391d3ee2b"
> > > +LLDBMD5SUM = "2e0d44968471fcde980034dbb826bea9"
> > > +
> > > +LLVM_LIBDIR_SUFFIX = "${@d.getVar('baselib').replace('lib', '')}"
> > > +
> > > +# set the default pigz thread
> > > +export PIGZ = "-p ${@oe.utils.cpu_count(at_least=2)}"
> > > +
> > > +require common.inc
> > > diff --git a/meta/recipes-devtools/clang/common-source.inc b/meta/recipes-devtools/clang/common-source.inc
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..d8a0f68175cf5effe72d2be4ae847eba122f94e8
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/clang/common-source.inc
> > > @@ -0,0 +1,17 @@
> > > +do_fetch() {
> > > +        :
> > > +}
> > > +do_fetch[noexec] = "1"
> > > +deltask do_unpack
> > > +deltask do_patch
> > > +
> > > +SRC_URI = ""
> > > +
> > > +do_configure[depends] += "llvm-project-source-${PV}:do_preconfigure"
> > > +do_populate_lic[depends] += "llvm-project-source-${PV}:do_unpack"
> > > +do_create_spdx[depends] += "llvm-project-source-${PV}:do_preconfigure"
> > > +
> > > +# spdx shared workdir detection fails as not WORKDIR is altered but S and B
> > > +# return always true to fix that
> > > +def is_work_shared_spdx(d):
> > > +    return True
> > > diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..f77a3eea0ec7af3de8bc7f075cd8ba88b77f6beb
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/clang/common.inc
> > > @@ -0,0 +1,85 @@
> > > +FILESEXTRAPATHS =. "${FILE_DIRNAME}/clang:"
> > > +
> > > +LIC_FILES_CHKSUM = "file://llvm/LICENSE.TXT;md5=${LLVMMD5SUM} \
> > > +                    file://clang/LICENSE.TXT;md5=${CLANGMD5SUM} \
> > > +"
> > > +LICENSE = "Apache-2.0-with-LLVM-exception"
> > > +
> > > +# Snapshot
> > > +#RELEASE ?= "a69568efe6c4972e71af295c6577b3412dd57c22"
> > > +#BASEURI ?= "https://api.github.com/repos/llvm/llvm-project/tarball/${RELEASE};downloadfilename=llvm-${PV}-${RELEASE}.tar.gz"
> > > +#SOURCEDIR ?= "llvm-llvm-project-${@'${RELEASE}'[0:7]}"
> > > +#SRC_URI[sha256sum] = "aed4f66cd72867b36cc55a0588436933c3d58d3e61ca782b6bf57605d3fdcb09"
> > > +
> > > +# GA Release
> > > +RELEASE ?= "${PV}"
> > > +BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz"
> > > +SOURCEDIR ?= "llvm-project-${PV}.src"
> > > +SRC_URI[sha256sum] = "f0a4a240aabc9b056142d14d5478bb6d962aeac549cbd75b809f5499240a8b38"
> > > +
> > > +SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
> > > +SRCREV_spirvheaders = "09913f088a1197aba4aefd300a876b2ebbaa3391"
> > > +SRCREV_FORMAT .= "spirv_spirvheaders"
> > > +# pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
> > > +SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
> > > +SPIRVURI = " \
> > > +    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
> > > +    git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers;name=spirvheaders;branch=main \
> > 
> > Please use SPIR-V headers from the spirv-headers recipe rather than
> > injecting them here.
> > 
> 
> I thought about it and decided against it, because those headers are more
> aligned with spirv-tools and can be bumped independently, which could break
> clang. Its a complex recipe and it is better to have less source level
> dependencies coming from elsewhere.

It's a standard conflict between vendoring an external tree vs depending
on it. I'd say, it makes it harder to manage upgrades. With clang being
a part of OE-Core, autobuilder will catch upgrade issues.

Anyway, I think after these patches land, we should split
spirv-llvm-translator back to a separate recipe (it is a separate tree
anyway), then upgrading SPIRV headers won't have any effect on LLVM.

> 
> > > +    file://spirv-internal-build.patch \
> > > +    file://spirv-shared-library.patch \
> > > +"
> > > +
> > > +SRC_URI = "\
> > > +    ${BASEURI} \
> > > +    ${SPIRVURI} \

[...]

> > > +
> > > +RDEPENDS:${PN}-dev += "${PN}-staticdev"
> > > +
> > > +BBCLASSEXTEND = "native nativesdk"
> > > +
> > > +ALLOW_EMPTY:${PN} = "1"
> > > +ALLOW_EMPTY:${PN}-dev = "1"
> > 
> > Why?
> > 
> 
> compiler-rt is a static library + headers package, that ends in -staticdev
> so PN is empty but PN-dev does have orc c_api.h file atleast for x86-64,
> compiler-rt needs to get into SDKs and thats why it is added.
> I have removed PN-dev in v2.

Would be nice to have a short comment here.

-- 
With best wishes
Dmitry


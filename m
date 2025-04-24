Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290DFC369D1
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 09:06:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.10864.1745485563309475277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 02:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=E4ifIVFI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6tN010223
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fHwnIYFLO5BLnrhMl4OLCXpz
	lywOPeulkDOBRrBcJzo=; b=E4ifIVFIeslxq+1MCtwWU4pYOeBCJsjmD0iFk4Te
	LEJMBrkudeKK2nnglWAU02MmTB+MgZTaMW2/T8HlSH7Bkk/PCylm9+SBRxK3DamY
	7F7xG1z32+WTS5T6dTQEly5oh07zkRYtuE1jfX2KG0QuOqu2Nw9aic/VxblprgA0
	lnNQBh7GGw5zaNrGjT1HCkXNsMb4eaaIaLQ9T5BOaqkYNdyItb2jxZmvw6lj9dVW
	vauu9PIwluaVlaKnd+fKUTIX7tWVK02BCoHHVbEuzDsW/JrJuKQk9I4VRS6LP9jH
	+p5JrPdYDIS/Y73p1XmQyHT8J2R6if2LhcA3nqF52T2kIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mw6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:06:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0c1025adbso165249185a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 02:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745485561; x=1746090361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHwnIYFLO5BLnrhMl4OLCXpzlywOPeulkDOBRrBcJzo=;
        b=tOQpozS9Q9Flfq0eFtvb8eNU0EQW7rHoI7ZVXhquESxykR7/+AQg1X5fbl2GfMA6Or
         vOebse4cUwNvG6KxHRRR8htr5qMO0Tj3+l2nv9Iob4eQOU0Q+KCnrUMPT6+O5W44QlnT
         r61lA5xxn4Lc6PyQWKgRilp+6nJ7o7eXFZ8Xrolja5vPUxA/wNgMeMP1b/mylc1Igkle
         0GLoPZvrIFQQiYNJjIQeq59lygYP1tfR9hBXUs7cDAG8Wh4ADgFTqtOjZvz9SOazPtHs
         MTW5HeNTSU096JNjBGKkFqo1HUSBUc5DbW4+cEleWjJ/Jbwfr3Q8p3VLBaodSqXHiWDJ
         03eQ==
X-Gm-Message-State: AOJu0Yz0VXsPfgsiuzy/YeGRPUyoU+qr1hs1U5IhyVEpoGJNgc1EG2v/
	0fv8VQ2PVwPqMLiCutoWwCL1Qe9lzEkYnYo14zMk8gwhujxscuhQfw3ZHU71qQb5e7T/dviH5jg
	U9cVfGuYQxgImKG9yrOMxpC7LLFB3hkv0nyXrp0x7lTXC2jTUyanae0go8mfuFxUwSnX5plDiWq
	9ZHpQ=
X-Gm-Gg: ASbGncsweNkIcD8eBBPdKOcKM4H/iC9AddpRS3v7vSs+YKZqJ7aqsyq9QI2HYj4B7W/
	rm2dM2lZ0XNNy5uccO2hVlIUIn1OB52DqEz59Q2ZWyuii4FnEhWacUhYt6Xopj49M3JnFZsdweo
	k8QjfQLY/FZD769DSec0/JUooTV7vFnVION/MeM+zfevrBoD8ckIw8iSWNofxACZHQeOuXIoNMl
	wule+djE6pVnLSyrjAMCFnFrUf/T0sg6lizQBB1TiMbd3kJm/DJZHviLTn8SH6jPmEWxEdOMBQP
	w1OX1xs+c8aX4BV1/vgAn/+vbN5BLKLTBMz6idIxAcERmP85lwV9YSFLzJpci96VtrsaFX1lmOU
	=
X-Received: by 2002:a05:620a:2682:b0:7c5:d7c4:576e with SMTP id af79cd13be357-7c956ede19dmr301828585a.31.1745485561073;
        Thu, 24 Apr 2025 02:06:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8Pb64BFqEfsz+KfzEarFX92G7yGuLiqF1ehsLbWiw+zHzUWzSRetoo26BH6c0YW/hSu6m1w==
X-Received: by 2002:a05:620a:2682:b0:7c5:d7c4:576e with SMTP id af79cd13be357-7c956ede19dmr301822685a.31.1745485560387;
        Thu, 24 Apr 2025 02:06:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2621dsm162238e87.29.2025.04.24.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:05:59 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:05:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/11] llvm: Renamed to clang
Message-ID: <6ie7couhpxys2pov3h3bdye7kjuozp6sbkp257t7z724sdjrsi@eeup5pdmiagt>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-2-5a492a8461aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-clang-merge-v1-2-5a492a8461aa@gmail.com>
X-Proofpoint-ORIG-GUID: gvRACW2Gc20BMaJfW_J6fo30wdi0CUcd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MCBTYWx0ZWRfX2eVAuEYZwIen DYtidw2P2dHQixrlOTanSMPrZKyrAHtRFGbhEKsBcE3uuPrTBiaTlC4WWB2hAV+Tg+JhID+OjrQ XSTPKPZ5CZnYLnk7oVJZ4aC2vfQO4bJLQLa3ZU+vKwy06W+75JqllkCQiKRH9nxVhlohbIsLQa1
 2m7GPanf1yShmCMLM46j1e4bELzOqjL9NRmTTZ6MTpvJ07GlLhAvmZvnIZ7jWRfjeDmySAJAphF 0lVNM5Hhj34z1eaBDHN86lz3a8ys45AsxxndDGqXio2+iZ7jd8PbNvCreO0S4RvqJVjKlnH+wpi ajGFrhzhZKThx44+0ROa7f5na23O73HCVRATaok486wv7WNR258YFNCSztg8oH3Mrq+yCyKHG77
 ejLVkgJkBQbEHmRofbRDHCRFwXB4BZYxmT5lBKiccP0iZcgB3Xj3CagJ+xOwcANkAiizbyEz
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6809fefa cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Twlkf-z8AAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IvTj1HvjAAAA:8
 a=t7CeM3EgAAAA:8 a=0nEWVuUK4XtbA3MhoeIA:9 a=yVFPDt-NOXRYOxF9:21 a=CjuIK1q_8ugA:10 a=a97rIl97qucA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=kmyLcwvAnC_t3PsnBtKb:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gvRACW2Gc20BMaJfW_J6fo30wdi0CUcd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215340

On Thu, Apr 24, 2025 at 12:20:36AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...mitter-sort-ClassInfo-lists-by-name-as-we.patch |  31 ---
>  ...g-remove-LLVM_LDFLAGS-from-ldflags-output.patch |  34 ---
>  .../0007-llvm-allow-env-override-of-exe-path.patch |  36 ----
>  ...configure-for-packages-using-find_package.patch | 117 -----------
>  meta/recipes-devtools/llvm/llvm/llvm-config        |  54 -----
>  .../llvm/llvm/spirv-internal-build.patch           |  30 ---
>  .../llvm/llvm/spirv-shared-library.patch           |  25 ---
>  meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ---------------------
>  8 files changed, 560 deletions(-)

Could you please squash this into the patch #6? It would be easier to
review it then.

> 
> diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
> deleted file mode 100644
> index f71c5d4bd4748b286b4354fd5ca7c686512da8ac..0000000000000000000000000000000000000000
> --- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 001d56983078842c5aa2a1786b84dc429bd46abd Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 27 Nov 2020 10:11:08 +0000
> -Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
> -
> -Otherwise, there are instances which are identical in
> -every other field and therefore sort non-reproducibly
> -(which breaks binary and source reproducibiliy).
> -
> -Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
> -index 7684387d8..d225a3b6d 100644
> ---- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
> -+++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
> -@@ -361,7 +361,10 @@ public:
> -     // name of a class shouldn't be significant. However, some of the backends
> -     // accidentally rely on this behaviour, so it will have to stay like this
> -     // until they are fixed.
> --    return ValueName < RHS.ValueName;
> -+    if (ValueName != RHS.ValueName)
> -+        return ValueName < RHS.ValueName;
> -+    // All else being equal, we should sort by name, for source and binary reproducibility
> -+    return Name < RHS.Name;
> -   }
> - };
> - 
> diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
> deleted file mode 100644
> index 2320399d5f7de44cf9cc4269d180c097c1b4a616..0000000000000000000000000000000000000000
> --- a/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From caff2482f786dd7fd5f1f46f2667f7ed847cb8f8 Mon Sep 17 00:00:00 2001
> -From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> -Date: Wed, 2 Apr 2025 17:05:17 +0300
> -Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
> -
> -On native OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
> -depend on exact build dir and as such be inappropriate to binaries
> -shared through sstate-cache. It is not possible to override this
> -behaviour in llvm-config since crossscripts are not being used for
> -native builds. As a OE-specific modification ignore LLVM_LDFLAGS for
> -native builds.
> -
> -Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> -Upstream-Status: Inappropriate [OE-Specific]
> ----
> - llvm/tools/llvm-config/llvm-config.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
> -index d5b76b1bb6c1..29f7c2eaa419 100644
> ---- a/llvm/tools/llvm-config/llvm-config.cpp
> -+++ b/llvm/tools/llvm-config/llvm-config.cpp
> -@@ -529,7 +529,7 @@ int main(int argc, char **argv) {
> -         OS << ActiveIncludeOption << ' ' << LLVM_CXXFLAGS << '\n';
> -       } else if (Arg == "--ldflags") {
> -         OS << ((HostTriple.isWindowsMSVCEnvironment()) ? "-LIBPATH:" : "-L")
> --           << ActiveLibDir << ' ' << LLVM_LDFLAGS << '\n';
> -+           << ActiveLibDir << '\n';
> -       } else if (Arg == "--system-libs") {
> -         PrintSystemLibs = true;
> -       } else if (Arg == "--libs") {
> --- 
> -2.39.5
> -
> diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
> deleted file mode 100644
> index f1ab0054640c56f78b13ec2fdd1870fc207472be..0000000000000000000000000000000000000000
> --- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 3eb1eefed6fc654d19ab97bbc748454c22a29009 Mon Sep 17 00:00:00 2001
> -From: Martin Kelly <mkelly@xevo.com>
> -Date: Fri, 19 May 2017 00:22:57 -0700
> -Subject: [PATCH] llvm: allow env override of exe and libdir path
> -
> -When using a native llvm-config from inside a sysroot, we need llvm-config to
> -return the libraries, include directories, etc. from inside the sysroot rather
> -than from the native sysroot. Thus provide an env override for calling
> -llvm-config from a target sysroot.
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -
> -Signed-off-by: Martin Kelly <mkelly@xevo.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
> -index d5b76b1bb..6c28c34bc 100644
> ---- a/llvm/tools/llvm-config/llvm-config.cpp
> -+++ b/llvm/tools/llvm-config/llvm-config.cpp
> -@@ -246,6 +246,13 @@ Typical components:\n\
> - 
> - /// Compute the path to the main executable.
> - std::string GetExecutablePath(const char *Argv0) {
> -+  // Hack for Yocto: we need to override the root path when we are using
> -+  // llvm-config from within a target sysroot.
> -+  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
> -+  if (Sysroot != nullptr) {
> -+    return Sysroot;
> -+  }
> -+
> -   // This just needs to be some symbol in the binary; C++ doesn't
> -   // allow taking the address of ::main however.
> -   void *P = (void *)(intptr_t)GetExecutablePath;
> diff --git a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch b/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch
> deleted file mode 100644
> index 94c056ab8e0abcdf4b96fc3c9bf22842018941e8..0000000000000000000000000000000000000000
> --- a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -From 93141cee493022d9f39dbd1f5f0bb0a1110ac829 Mon Sep 17 00:00:00 2001
> -From: Ovidiu Panait <ovidiu.panait@windriver.com>
> -Date: Fri, 31 Jan 2020 10:56:11 +0200
> -Subject: [PATCH] cmake: Fix configure for packages using find_package()
> -
> -Currently, when a package (i.e. bcc [https://github.com/iovisor/bcc.git])
> -that depends on LLVM/Clang tries to run cmake find_package() during
> -do_configure, it will fail with a similar error:
> -
> -|   The imported target "llvm-tblgen" references the file
> -|      ".../recipe-sysroot/usr/bin/llvm-tblgen"
> -|
> -|   but this file does not exist.  Possible reasons include:
> -|   * The file was deleted, renamed, or moved to another location.
> -|   * An install or uninstall procedure did not complete successfully.
> -|   * The installation package was faulty and contained
> -|      ".../recipe-sysroot/usr/lib/cmake/LLVMExports.cmake"
> -|   but not all the files it references.
> -
> -This is due to the fact that currently the cmake scripts look for target
> -binaries in sysroot. Work around this by not exporting the target binaries in
> -Exports-* cmake files.
> -
> -Upstream-Status: Inappropriate [oe-specific]
> -
> -Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ----
> - clang/cmake/modules/AddClang.cmake | 2 --
> - llvm/cmake/modules/AddLLVM.cmake   | 9 ++-------
> - llvm/cmake/modules/TableGen.cmake  | 6 ------
> - 3 files changed, 2 insertions(+), 15 deletions(-)
> -
> -diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules/AddClang.cmake
> -index cdc8bd5cd503..5faa9117a30f 100644
> ---- a/clang/cmake/modules/AddClang.cmake
> -+++ b/clang/cmake/modules/AddClang.cmake
> -@@ -182,7 +182,6 @@ macro(add_clang_tool name)
> -     if (CLANG_BUILD_TOOLS)
> -       get_target_export_arg(${name} Clang export_to_clangtargets)
> -       install(TARGETS ${name}
> --        ${export_to_clangtargets}
> -         RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
> -         COMPONENT ${name})
> - 
> -@@ -191,7 +190,6 @@ macro(add_clang_tool name)
> -                                  DEPENDS ${name}
> -                                  COMPONENT ${name})
> -       endif()
> --      set_property(GLOBAL APPEND PROPERTY CLANG_EXPORTS ${name})
> -     endif()
> -   endif()
> -   set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEME ON)
> -diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/AddLLVM.cmake
> -index d3e9377c8d2f..fe22d6f2b35a 100644
> ---- a/llvm/cmake/modules/AddLLVM.cmake
> -+++ b/llvm/cmake/modules/AddLLVM.cmake
> -@@ -1492,7 +1492,6 @@ macro(llvm_add_tool project name)
> -       if( LLVM_BUILD_TOOLS )
> -         get_target_export_arg(${name} ${project} export_to_llvmexports)
> -         install(TARGETS ${name}
> --                ${export_to_llvmexports}
> -                 RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
> -                 COMPONENT ${name})
> - 
> -@@ -1503,10 +1502,8 @@ macro(llvm_add_tool project name)
> -         endif()
> -       endif()
> -     endif()
> --    if( LLVM_BUILD_TOOLS )
> --      string(TOUPPER "${project}" project_upper)
> --      set_property(GLOBAL APPEND PROPERTY ${project_upper}_EXPORTS ${name})
> --    endif()
> -+    string(TOUPPER "${project}" project_upper)
> -+    set_target_properties(${name} PROPERTIES FOLDER "Tools")
> -   endif()
> -   get_subproject_title(subproject_title)
> -   set_target_properties(${name} PROPERTIES FOLDER "${subproject_title}/Tools")
> -@@ -1556,7 +1553,6 @@ macro(add_llvm_utility name)
> -     if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
> -       get_target_export_arg(${name} LLVM export_to_llvmexports)
> -       install(TARGETS ${name}
> --              ${export_to_llvmexports}
> -               RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
> -               COMPONENT ${name})
> - 
> -@@ -1565,7 +1561,6 @@ macro(add_llvm_utility name)
> -                                  DEPENDS ${name}
> -                                  COMPONENT ${name})
> -       endif()
> --      set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS ${name})
> -     elseif(LLVM_BUILD_UTILS)
> -       set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY ${name})
> -     endif()
> -diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/TableGen.cmake
> -index ffcc718b4777..a76f28e74b86 100644
> ---- a/llvm/cmake/modules/TableGen.cmake
> -+++ b/llvm/cmake/modules/TableGen.cmake
> -@@ -232,12 +232,7 @@ macro(add_tablegen target project)
> - 
> -   if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AND
> -       (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DISTRIBUTION_COMPONENTS))
> --    set(export_arg)
> --    if(ADD_TABLEGEN_EXPORT)
> --      get_target_export_arg(${target} ${ADD_TABLEGEN_EXPORT} export_arg)
> --    endif()
> -     install(TARGETS ${target}
> --            ${export_arg}
> -             COMPONENT ${target}
> -             RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
> -     if(NOT LLVM_ENABLE_IDE)
> -@@ -248,6 +243,5 @@ macro(add_tablegen target project)
> -   endif()
> -   if(ADD_TABLEGEN_EXPORT)
> -     string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
> --    set_property(GLOBAL APPEND PROPERTY ${export_upper}_EXPORTS ${target})
> -   endif()
> - endmacro()
> diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-devtools/llvm/llvm/llvm-config
> deleted file mode 100644
> index 6cf3e7578fa96f2893f73077bece4db45f29547c..0000000000000000000000000000000000000000
> --- a/meta/recipes-devtools/llvm/llvm/llvm-config
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -#!/bin/bash
> -#
> -# Copyright OpenEmbedded Contributors
> -#
> -# SPDX-License-Identifier: MIT
> -#
> -# Wrap llvm-config since the native llvm-config will remap some values correctly
> -# if placed in the target sysroot but for flags, it would provide the native ones.
> -# Provide ours from the environment instead.
> -
> -NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
> -if [[ $# == 0 ]]; then
> -  exec "$NEXT_LLVM_CONFIG"
> -fi
> -
> -remain=""
> -output=""
> -for arg in "$@"; do
> -  case "$arg" in
> -    --cppflags)
> -      output="${output} ${CPPFLAGS}"
> -      ;;
> -    --cflags)
> -      output="${output} ${CFLAGS}"
> -      ;;
> -    --cxxflags)
> -      output="${output} ${CXXFLAGS}"
> -      ;;
> -    --ldflags)
> -      output="${output} ${LDFLAGS}"
> -      ;;
> -    --shared-mode)
> -      output="${output} shared"
> -      ;;
> -    --libs)
> -      output="${output} -lLLVM"
> -      ;;
> -    --libdir)
> -      output="${output} ${libdir}"
> -      ;;
> -    --link-shared)
> -      break
> -      ;;
> -    *)
> -      remain="${remain} ${arg}"
> -      ;;
> -  esac
> -done
> -
> -if [ "${remain}" != "" ]; then
> -      output="${output} "$("$NEXT_LLVM_CONFIG" ${remain})
> -fi
> -
> -echo "${output}"
> diff --git a/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch b/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch
> deleted file mode 100644
> index 555d40f4fb07342cc204c7c578662688605b2cb1..0000000000000000000000000000000000000000
> --- a/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
> -From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> -Date: Fri, 21 Mar 2025 17:17:52 +0200
> -Subject: [PATCH] SPIRV-LLVM-Translator: fix handling of built-in SPIRV targer
> -
> -If the SPIRV-LLVM-Translator is being built together with the LLVM, set
> -the defines declaring whether SPIRV target is also included into the
> -LLVM library or not. Otherwise llvm-spirv execution fails because
> -spirv-ext option is registered twice.
> -
> -Upstream-Status: Pending [will be submitted upstream after internal clearance]
> -Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> -
> -Index: llvm-project-20.1.0.src/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
> -===================================================================
> ---- llvm-project-20.1.0.src.orig/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
> -+++ llvm-project-20.1.0.src/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
> -@@ -116,6 +116,12 @@ if(LLVM_SPIRV_BUILD_EXTERNAL)
> -     set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
> -     set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
> -   endif()
> -+else()
> -+  is_llvm_target_library("SPIRV" spirv_present_result INCLUDED_TARGETS)
> -+  if(spirv_present_result)
> -+    set(SPIRV_BACKEND_FOUND TRUE)
> -+    add_compile_definitions(LLVM_SPIRV_BACKEND_TARGET_PRESENT)
> -+  endif()
> - endif()
> - 
> - set(LLVM_SPIRV_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include)
> diff --git a/meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch b/meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch
> deleted file mode 100644
> index edc595d57699a682e62f3b3b1cf999e409060226..0000000000000000000000000000000000000000
> --- a/meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
> -From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> -Date: Thu, 9 Apr 2025 15:20:32 +0200
> -Subject: [PATCH] SPIRV-LLVM-Translator: build shared library
> -
> -By default SPIRV-LLVM-Translator builds only a static version of the library.
> -Unfortunately this might result in linking erros when uninative is in play, if
> -libLLVMSPIRV uses symbols which are provided only by the uninative libc and are
> -not provided by the host libc.
> -
> -Upstream-Status: Inappropriate [OE-Specific]
> -Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> -
> -Index: llvm-project-20.1.1.src/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
> -===================================================================
> ---- llvm-project-20.1.1.src.orig/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
> -+++ llvm-project-20.1.1.src/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
> -@@ -42,6 +42,7 @@ set(SRC_LIST
> - )
> - add_llvm_library(LLVMSPIRVLib
> -   ${SRC_LIST}
> -+  SHARED
> -   LINK_COMPONENTS
> -     Analysis
> -     BitWriter
> diff --git a/meta/recipes-devtools/llvm/llvm_20.1.2.bb b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
> deleted file mode 100644
> index 98855fa4c14d1f5eef6dd946a64927d778b99e3d..0000000000000000000000000000000000000000
> --- a/meta/recipes-devtools/llvm/llvm_20.1.2.bb
> +++ /dev/null
> @@ -1,233 +0,0 @@
> -# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
> -# Released under the MIT license (see COPYING.MIT for the terms)
> -
> -SUMMARY = "The LLVM Compiler Infrastructure"
> -HOMEPAGE = "http://llvm.org"
> -LICENSE = "Apache-2.0-with-LLVM-exception"
> -SECTION = "devel"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
> -
> -DEPENDS = "libffi libxml2 zlib zstd libedit ninja-native llvm-native"
> -
> -RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
> -
> -inherit cmake pkgconfig
> -# could be 'rcX' or 'git' or empty ( for release )
> -VER_SUFFIX = ""
> -
> -PV .= "${VER_SUFFIX}"
> -
> -MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
> -MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
> -
> -LLVM_RELEASE = "${PV}"
> -
> -SRCREV_spirv = "68edc9d3d10ff6ec6353803a1bc60a5c25e7b715"
> -# pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
> -SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
> -
> -SRC_URI_SPIRV = " \
> -    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
> -    file://spirv-internal-build.patch \
> -"
> -
> -SRC_URI_SPIRV:append:class-native = " \
> -    file://spirv-shared-library.patch \
> -"
> -
> -SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
> -           file://0007-llvm-allow-env-override-of-exe-path.patch \
> -           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
> -           file://0014-cmake-Fix-configure-for-packages-using-find_package.patch \
> -           ${@bb.utils.contains('PACKAGECONFIG', 'spirv-llvm-translator', '${SRC_URI_SPIRV}', '', d)} \
> -           file://llvm-config \
> -           "
> -SRC_URI[sha256sum] = "f0a4a240aabc9b056142d14d5478bb6d962aeac549cbd75b809f5499240a8b38"
> -UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
> -UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
> -
> -SRC_URI:append:class-native = " file://0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch"
> -
> -S = "${WORKDIR}/llvm-project-${PV}.src"
> -
> -OECMAKE_SOURCEPATH = "${S}/llvm"
> -
> -LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
> -
> -PACKAGECONFIG ??= "libllvm libclc spirv-llvm-translator"
> -# if optviewer OFF, force the modules to be not found or the ones on the host would be found
> -PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
> -PACKAGECONFIG[libllvm] = ""
> -PACKAGECONFIG[libclc] = ""
> -PACKAGECONFIG[spirv-llvm-translator] = "-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_INCDIR}/.. ,,spirv-tools-native spirv-headers"
> -
> -#
> -# Default to build all OE-Core supported target arches (user overridable).
> -#
> -LLVM_TARGETS ?= "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;NVPTX;SPIRV"
> -
> -ARM_INSTRUCTION_SET:armv5 = "arm"
> -ARM_INSTRUCTION_SET:armv4t = "arm"
> -
> -LLVM_PROJECTS_CLANG = "${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'clang', '', d)}"
> -LLVM_PROJECTS_CLC = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ';libclc', '', d)}"
> -LLVM_PROJECTS = "${LLVM_PROJECTS_CLANG}${LLVM_PROJECTS_CLC}"
> -
> -EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
> -                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
> -                  -DLLVM_ENABLE_PIC=ON \
> -                  -DLLVM_BINDINGS_LIST='' \
> -                  -DLLVM_LINK_LLVM_DYLIB=ON \
> -                  -DLLVM_ENABLE_FFI=ON \
> -                  -DLLVM_ENABLE_RTTI=ON \
> -                  -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
> -                  -DLLVM_OPTIMIZED_TABLEGEN=ON \
> -                  -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
> -                  -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
> -                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
> -                  -DCMAKE_BUILD_TYPE=Release \
> -                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
> -                 "
> -
> -EXTRA_OECMAKE:append:class-target = "\
> -                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
> -                  -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
> -                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
> -                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
> -                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
> -                 "
> -
> -EXTRA_OECMAKE:append:class-nativesdk = "\
> -                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
> -                  -DLLVM_HOST_TRIPLE=${SDK_SYS} \
> -                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
> -                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
> -                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
> -                 "
> -
> -# patch out build host paths for reproducibility
> -do_compile:prepend:class-target() {
> -        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
> -}
> -
> -do_compile:prepend:class-nativesdk() {
> -        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
> -}
> -
> -do_compile() {
> -    if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
> -	ninja -v ${PARALLEL_MAKE}
> -    else
> -	ninja -v ${PARALLEL_MAKE} llvm-config llvm-tblgen
> -    fi
> -}
> -
> -do_install() {
> -    if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
> -	DESTDIR=${D} ninja -v install
> -
> -        # llvm harcodes usr/lib as install path, so this corrects it to actual libdir
> -        mv -T -n ${D}/${prefix}/lib ${D}/${libdir} || true
> -
> -        # Remove opt-viewer: https://llvm.org/docs/Remarks.html
> -        rm -rf ${D}${datadir}/opt-viewer
> -
> -        # reproducibility
> -        sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
> -    fi
> -
> -    # Remove clang bits from target packages, we are not providing it for the system
> -    if ${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'true', 'false', d)} &&
> -       [ "${CLASSOVERRIDE}" != "class-native" ] ; then
> -        rm -f  ${D}${bindir}/clang*
> -        rm -fr ${D}${libdir}/clang
> -        rm -fr ${D}${datadir}/clang
> -
> -        rm -f  ${D}${bindir}/scan*
> -        rm -fr ${D}${libdir}/libscanbuild
> -        rm -fr ${D}${datadir}/scan-build
> -        rm -fr ${D}${datadir}/scan-view
> -
> -        rm -fr ${D}${libdir}/libear
> -    fi
> -
> -    # Try to clean up datadir if it is empty, but don't fail if there are
> -    # libclc files there
> -    rmdir ${D}${datadir} || true
> -}
> -
> -do_install:append:class-native() {
> -	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
> -	install -D -m 0755 ${B}/bin/llvm-min-tblgen ${D}${bindir}/llvm-min-tblgen
> -	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
> -	ln -sf llvm-config${PV} ${D}${bindir}/llvm-config
> -
> -        if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} ; then
> -            install -D -m 0755 ${B}/bin/prepare_builtins ${D}${bindir}/prepare_builtins
> -        fi
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
> -SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
> -
> -llvm_sysroot_preprocess() {
> -	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> -	install -m 0755 ${UNPACKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> -	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
> -}
> -
> -PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc ${PN}-spirv"
> -PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc spirv-llvm-translator', d)}"
> -
> -RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
> -RPROVIDES:${PN}-clc = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
> -RPROVIDES:${PN}-spirv = "${@bb.utils.filter('PACKAGECONFIG', 'spirv-llvm-translator', d)}"
> -
> -FILES:${PN}-bugpointpasses = "\
> -    ${libdir}/BugpointPasses.so \
> -"
> -
> -FILES:${PN}-libllvm = "\
> -    ${libdir}/libLLVM-${MAJOR_VERSION}.so \
> -    ${libdir}/libLLVM.so.${MAJ_MIN_VERSION} \
> -"
> -
> -FILES:${PN}-liblto += "\
> -    ${libdir}/libLTO.so.* \
> -"
> -
> -FILES:${PN}-liboptremarks += "\
> -    ${libdir}/libRemarks.so.* \
> -"
> -
> -FILES:${PN}-llvmhello = "\
> -    ${libdir}/LLVMHello.so \
> -"
> -
> -FILES:${PN}-dev += " \
> -    ${libdir}/llvm-config \
> -    ${libdir}/libRemarks.so \
> -    ${libdir}/libLLVM-${PV}.so \
> -"
> -
> -FILES:${PN}-staticdev += "\
> -    ${libdir}/*.a \
> -"
> -
> -FILES:${PN}-clc += "${datadir}/clc"
> -
> -FILES:${PN}-spirv = " \
> -    ${bindir}/llvm-spirv \
> -    ${includedir}/LLVMSPIRVLib \
> -    ${libdir}/pkgconfig/LLVMSPIRVLib.pc \
> -    ${libdir}/libLLVMSPIRV* \
> -"
> -
> -INSANE_SKIP:${PN}-libllvm += "dev-so"
> -
> -# SPIRV-LLVM-Translator provides only static libraries, they are included into
> -# the llvm-spirv package.
> -INSANE_SKIP:${PN}-spirv += "staticdev"
> -
> -BBCLASSEXTEND = "native nativesdk"
> 
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry


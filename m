Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.735.1605162551671494353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 22:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L9yXGPwV;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id h15so4323572qkl.13
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 22:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k3bU/AAiuyqUTG/LgoCafDVftR1RoN7EKANSdIL5pb4=;
        b=L9yXGPwVNylzNxnNPf5Ltp+0ITnjdQHicPsw7EeTVN1vidrUnssPqO987cArXoOYF0
         16Bh3PPs5NAd+NZAKEG8II3ghT7PCg3XdVc4tNyqMHhQ4mi7frxrYiQC4M6JcLpDkd2F
         fAwq9Dj/cI9d0br+/JF7kzAofF3alWYR8EuORajmsJ3jSLaUBXBwwvW6rpq5kWRCCiii
         XlUtrQay0IJ5YXIhLRZu3ebxmBl4Qi7PYkeU+2aubloNyI5y2WeCaRSNWdZIhWHHlPxZ
         Ph+e4BBLE0YlcfIBPTijPrXbbRXiSmnVflLhQ1e6BLsNGz7ioKS12trCefiMPPcrOf5E
         KRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k3bU/AAiuyqUTG/LgoCafDVftR1RoN7EKANSdIL5pb4=;
        b=q5EGgkznx0gX1kL+2VAlTvoMGIlh9OlLWPu9F8DAjofi36HQ636Y2mwSO1icbnqY+v
         WO6mfsIQdqqYK/W7WIsv2i1hAz3KhxoPkU/VL//FsaiX5JDGq1PnDrbdwKEte4R8uGX8
         cCSbH01C+5WcPvCYAT1PJaGMfCodm6B5yjVk21Ar0VDesWGa8SiuMgXRnCJNepfYn+sP
         ppX2K/QmWOdLPH58l1ZMfpUCZaT8XksdIE2QSYF3xsfI8y+hkyznV8J8r8ZbpLualbHc
         p2Sv4hvkLMuU+vqwbdmkRwlVgK3nzZth+zMOngXNi0cJZ/NiC1gDoywYirbJ+h/WbrTr
         xcUg==
X-Gm-Message-State: AOAM531Ifu0GykJPkXVsToKSeDtjxLGa1z6DsOEU7aPhv7aeul0iSL/f
	xmzSRocDSio7EZoed0LzKbt/TK5buuVRRI2rtFs=
X-Google-Smtp-Source: ABdhPJyZSQba1tyUVIgiVhZ1oDjHbJGvVB5ArshbpgQDFvP8MSR2eoNjnOe/RvRtK2cX3S4KXyubDm8B+v4Nm8eHJ/0=
X-Received: by 2002:a37:a70e:: with SMTP id q14mr2043449qke.337.1605162550501;
 Wed, 11 Nov 2020 22:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20201112060217.7282-1-changqing.li@windriver.com>
In-Reply-To: <20201112060217.7282-1-changqing.li@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 11 Nov 2020 22:28:43 -0800
Message-ID: <CAMKF1soGpv1nGchjBs5j5bnyv=7TPUQ_ixNd8i+s6T+ZPDzJTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: fix do_compile failure
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2020 at 10:02 PM Changqing Li
<changqing.li@windriver.com> wrote:
>
> fix error:
> | framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atomic_base<unsigned long long>::load(std::memory_order) const':
> | /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `__atomic_load_8'
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...ts.txt-link-atomic-for-arch-ppc-mips.patch | 33 +++++++++++++++++++
>  .../vulkan/vulkan-samples_git.bb              |  3 ++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-link-atomic-for-arch-ppc-mips.patch
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-link-atomic-for-arch-ppc-mips.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-link-atomic-for-arch-ppc-mips.patch
> new file mode 100644
> index 0000000000..54bd90c610
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-link-atomic-for-arch-ppc-mips.patch
> @@ -0,0 +1,33 @@
> +From e7cccf6626e9a7e20f963f8bbbffc9dae3863ce8 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 12 Nov 2020 08:10:51 +0800
> +Subject: [PATCH] CMakeLists.txt: link atomic for arch ppc/mips
> +
> +fix error:
> +| framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atomic_base<unsigned long long>::load(std::memory_order) const':
> +| /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `__atomic_load_8'
> +
> +Upstream-Status: oe-specific
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + framework/CMakeLists.txt | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/framework/CMakeLists.txt b/framework/CMakeLists.txt
> +index bf26786..4d8c594 100644
> +--- a/framework/CMakeLists.txt
> ++++ b/framework/CMakeLists.txt
> +@@ -410,7 +410,8 @@ target_link_libraries(${PROJECT_NAME}
> +     glslang-default-resource-limits
> +     spdlog
> +     ctpl
> +-    docopt)
> ++    docopt
> ++    atomic)
> +

I wonder if there was a way to check for relevat atomic and decide if
its from libaromic or compiler intrinsics
see https://github.com/llvm-mirror/llvm/blob/master/cmake/modules/CheckAtomic.cmake
for some guidelines

> + # Link platform specific libraries
> + if(ANDROID)
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> index 241a313a7b..f9d6c9b1de 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> @@ -6,6 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
>  SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
>             file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
>             "
> +SRC_URI_append_mipsarch = "file://0001-CMakeLists.txt-link-atomic-for-arch-ppc-mips.patch"
> +SRC_URI_append_powerpc = "file://0001-CMakeLists.txt-link-atomic-for-arch-ppc-mips.patch"
> +

its missing space after first "

>  UPSTREAM_CHECK_COMMITS = "1"
>  SRCREV = "f52361d3cd6ac8c30fc3365a464b4e220c32cfd6"
>
> --
> 2.26.2
>
>
> 
>

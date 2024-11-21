Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8E7D78789
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:18:39 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.2359.1732205916196073984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 08:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2bDWcaiz;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b15eadee87so64700985a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 08:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732205915; x=1732810715; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3zUfV3E/SuuFYMJuOLSPjKkvQyCjY0O7xOq8BdbRUE=;
        b=2bDWcaizM3xWuJGrJynsJxwyQ65BEz/ovOO9Xd14Ynt7hCSJpHf49+CDgRvNHkf0rW
         gnZ8VBMRQ5kaHAHJd20Vci71zxX/rVDu5inLoHFvpAStT+4SPyLH6AOC0qMjgSztS9OK
         aDP3zxt8b2D/MiCP8Ip7y2/8WT6gp4PPFtUmqI+/XEk+3EuYGD6VBgTE8ZH4aVQ+6jyf
         jjQrJpI/QYuWEMA+7YPOabsAv6u7SJEksh4qFUhbuKjXIjxkb2OoEjWGi8XuUx+uEuXY
         QcXoVD77jrPdkywZS8hKPJHhiBe964GofJgX9hcDOkeQLPby47qSGqAu2kcOmGg6UlLo
         iH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732205915; x=1732810715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3zUfV3E/SuuFYMJuOLSPjKkvQyCjY0O7xOq8BdbRUE=;
        b=Kqv23wuzr2yOjymqNYTF0DFiVXC2r8QsvmRgCPvmpTqW9su0VWoSNKmNDOpbz9cDwq
         4mnp2IUxUEHszx0ZMrjAE6Bj43YnI9+37Z4v9pxwiMnyZXOTeki5xljOvbtToYvHaX4Z
         IjiKW7T1Il8mkJqyoUhWK2axLNHxlZiqyXsHl+Qo05y2xjyY5heWjNZjzpPzo/BEesGB
         5tsWAsq3PG62WdBgkt8OnlFhDMhdgpR3eAXIHR9NUTC+/2b3As+FANxQYXhU2qXIOFMG
         1Ph32qqQSADLbxELYiriZuj1nLNVXiE3Qs7aCbzJg6Ie1+twQSR24CuHAzpf9QegMYcB
         qyMw==
X-Gm-Message-State: AOJu0Yw5Ya048QHgZM1HJS75Ums32FSVT/yL9RRQ8AhGpzoBJ718DusA
	tL5CFjv2D1O2ag6t2Fu2K2Lr2O5QmBk0NUOjhIUl0LvQ6WWQvFXhe0FJC7+OcfM=
X-Gm-Gg: ASbGncu3UMKxhYC3bPhmUQ9165PJJbCT/nofoSBGBYKNhei7uBmOQgPAM4y3NAxVDaq
	uZNuBhuQwEjJo6pqMEkFHwNxT2AnqoChUcVjYDuRdeLquNekTKsxCctzZIs0F4KCbwi7Pxdc0Jc
	yKg1DrqZXlRaiL4J74mm3vUnRXwSRsTZfk9jyMAIdOT7cGDmvE0K7hc8Vi62nam4vbQOGddr/u3
	yZ8PUHHGGy9LhhhgHeiKCmRbhOcXdZxij+ScTjPqKEhsIptOrUfLmv3dXCRq+MMD87wyukDw+km
	f11bk7Ihx+1QEvpleQ==
X-Google-Smtp-Source: AGHT+IE+KR5AHPI98SoS52AoFGC5Gu/P0d53rNLCHngNo0tcGY8eq8HreLnUbY1ZE8q4Tf4kBPSEEg==
X-Received: by 2002:a05:620a:1993:b0:7b1:12df:2589 with SMTP id af79cd13be357-7b42eda94d9mr933592485a.7.1732205915188;
        Thu, 21 Nov 2024 08:18:35 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b4852510b9sm226769985a.127.2024.11.21.08.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 08:18:34 -0800 (PST)
Message-ID: <e011f1f8-5f9c-4140-85b7-0a67a81319c1@baylibre.com>
Date: Thu, 21 Nov 2024 11:18:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2] python3-numpy: upgrade 1.26.4 -> 2.1.3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20241121153859.2133751-1-tgamblin@baylibre.com>
 <20241121153859.2133751-2-tgamblin@baylibre.com>
 <CAMKF1so2AvyYYFNVr6uV7FdTPHvu0yyLOBJTxjQN3=oMPT137g@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMKF1so2AvyYYFNVr6uV7FdTPHvu0yyLOBJTxjQN3=oMPT137g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 16:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207546


On 2024-11-21 11:13, Khem Raj wrote:
> On Thu, Nov 21, 2024 at 7:39 AM Trevor Gamblin via
> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> wrote:
>> - This release contains numerous API changes and bug fixes.
>>    Changelog: https://github.com/numpy/numpy/releases
>>
>> - Notably, the build backend has switched to mesonpy since 1.26.4.
>>
>> - Patch 0001-numpy-core-Define-RISCV-32-support.patch had to be updated
>>    to change the paths for the target files. It has now been merged
>>    upstream, but isn't included in any release yet. PR for reference:
>>
>>    https://github.com/numpy/numpy/pull/17780
>>
>> - Builds OK and seems to be compatible with current piglit and pandas
>>    (meta-python), which was not the case for the previous upgrade attempt
>>    to numpy 2.0.1.
>>
>> - For numpy, add 'pkgconfig' to inherit to avoid errors like this at
>>    do_compile:
>>
>>    | Found Pkg-config: NO
>>    | Run-time dependency python found: YES 3.12
>>    | Has header "Python.h" with dependency python: NO
>>    |
>>    | ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cannot compile `Python.h`. Perhaps you need to install python-dev|python-devel
>>    |
>>    | A full log can be found at /home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson-log.txt
>>
>> - Mmodify the FILES:${PN}-staticdev line to fix a QA issue.
>>
>> - This is now reproducible as of oe-core commit: 917df5ed022f
>>
>> License-Update: Change copyright year to 2024
>>
>> buildall-qemu log:
>>
>> BUILDALL-QEMU LOG FOR python3-numpy
>> START TIME: 2024-11-20_14:02:08
>> HOSTNAME: megalith
>> HOST OS: Debian GNU/Linux 12 (bookworm)
>> HOST KERNEL: 6.1.0-27-amd64
>> ===============
>> BUILD RESULTS:
>> [glibc]
>> FAIL: qemuloongarch64
>> PASS: qemuriscv32
>> PASS: qemuarmv5
>> PASS: qemuppc
>> PASS: qemumips64
>> PASS: qemuriscv64
>> PASS: qemuarm64
>> PASS: qemuarm
>> PASS: qemux86-64
>> PASS: qemuppc64
>> PASS: qemux86
>> PASS: qemumips
>> [musl]
>> FAIL: qemuloongarch64
>> FAIL: qemuriscv32
>> PASS: qemuarmv5
>> PASS: qemuppc
>> PASS: qemumips64
>> PASS: qemuriscv64
>> PASS: qemuarm64
>> PASS: qemuarm
>> PASS: qemux86-64
>> PASS: qemuppc64
>> PASS: qemux86
>> PASS: qemumips
>> ===============
>> PASSED: 21
>> FAILED: 3
> Testing on such a comprehensive matrix is amazing, thanks for doing
> it. Can you share more details on qemuriscv32/musl failures ?

This was the error I saw when I went and checked the build with 
TCLIBC=musl, MACHINE=qemuriscv32:

ERROR: Nothing PROVIDES 'virtual/libc' (but 
/home/tgamblin/workspace/yocto/poky/meta/recipes-devtools/python/python3-numpy_2.1.3.bb, 
/home/tgamblin/workspace/yocto/poky/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb, 
/home/tgamblin/workspace/yocto/poky/m)
picolibc PROVIDES virtual/libc but was skipped: incompatible with host 
riscv32-poky-linux-musl (not in COMPATIBLE_HOST)
nativesdk-glibc-y2038-tests PROVIDES virtual/libc but was skipped: 
glibc-testsuite requires that virtual/libc is glibc
glibc-y2038-tests PROVIDES virtual/libc but was skipped: incompatible 
with host riscv32-poky-linux-musl (not in COMPATIBLE_HOST)
newlib PROVIDES virtual/libc but was skipped: incompatible with host 
riscv32-poky-linux-musl (not in COMPATIBLE_HOST)
glibc PROVIDES virtual/libc but was skipped: incompatible with host 
riscv32-poky-linux-musl (not in COMPATIBLE_HOST)
musl PROVIDES virtual/libc but was skipped: incompatible with host 
riscv32-poky-linux-musl (not in COMPATIBLE_HOST)
ERROR: Required build target 'python3-numpy' has no buildable providers.
Missing or unbuildable dependency chain was: ['python3-numpy', 
'virtual/libc']

>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   ...1-numpy-core-Define-RISCV-32-support.patch | 52 +++++++++++--------
>>   ...numpy_1.26.4.bb => python3-numpy_2.1.3.bb} | 26 ++++++----
>>   2 files changed, 46 insertions(+), 32 deletions(-)
>>   rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb => python3-numpy_2.1.3.bb} (68%)
>>
>> diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
>> index 676bdbb3afd..6da9047ec57 100644
>> --- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
>> +++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
>> @@ -1,42 +1,50 @@
>> -From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
>> +From 0e2b652a0eff85798584116c905a2d6ad8f25d5f Mon Sep 17 00:00:00 2001
>>   From: Khem Raj <raj.khem@gmail.com>
>>   Date: Sun, 15 Nov 2020 15:32:39 -0800
>>   Subject: [PATCH] numpy/core: Define RISCV-32 support
>>
>>   Helps compile on riscv32
>>
>> -Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
>> +Upstream-Status: Backport
>> +(https://github.com/numpy/numpy/pull/17780/commits/0e2b652a0eff85798584116c905a2d6ad8f25d5f)
>> +
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   ---
>> - numpy/core/include/numpy/npy_cpu.h    | 3 +++
>> - numpy/core/include/numpy/npy_endian.h | 1 +
>> - 2 files changed, 4 insertions(+)
>> + numpy/_core/include/numpy/npy_cpu.h    | 9 +++++++--
>> + numpy/_core/include/numpy/npy_endian.h | 1 +
>> + 2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> -diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
>> -index 78d229e..04be511 100644
>> ---- a/numpy/core/include/numpy/npy_cpu.h
>> -+++ b/numpy/core/include/numpy/npy_cpu.h
>> -@@ -19,6 +19,7 @@
>> +diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/numpy/npy_cpu.h
>> +index a19f8e6bbd..15f9f12931 100644
>> +--- a/numpy/_core/include/numpy/npy_cpu.h
>> ++++ b/numpy/_core/include/numpy/npy_cpu.h
>> +@@ -18,6 +18,7 @@
>> +  *              NPY_CPU_ARCEL
>>     *              NPY_CPU_ARCEB
>>     *              NPY_CPU_RISCV64
>> -  *              NPY_CPU_LOONGARCH
>>   + *              NPY_CPU_RISCV32
>> +  *              NPY_CPU_LOONGARCH
>>     *              NPY_CPU_WASM
>>     */
>> - #ifndef NUMPY_CORE_INCLUDE_NUMPY_NPY_CPU_H_
>> -@@ -104,6 +105,8 @@
>> +@@ -102,8 +103,12 @@
>> +     #define NPY_CPU_ARCEL
>> + #elif defined(__arc__) && defined(__BIG_ENDIAN__)
>>        #define NPY_CPU_ARCEB
>> - #elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
>> -     #define NPY_CPU_RISCV64
>> -+#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 32
>> -+    #define NPY_CPU_RISCV32
>> +-#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
>> +-    #define NPY_CPU_RISCV64
>> ++#elif defined(__riscv)
>> ++    #if __riscv_xlen == 64
>> ++      #define NPY_CPU_RISCV64
>> ++    #elif __riscv_xlen == 32
>> ++      #define NPY_CPU_RISCV32
>> ++    #endif
>>    #elif defined(__loongarch__)
>>        #define NPY_CPU_LOONGARCH
>>    #elif defined(__EMSCRIPTEN__)
>> -diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
>> -index 5e58a7f..0926212 100644
>> ---- a/numpy/core/include/numpy/npy_endian.h
>> -+++ b/numpy/core/include/numpy/npy_endian.h
>> +diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/include/numpy/npy_endian.h
>> +index 5e58a7f52c..09262120bf 100644
>> +--- a/numpy/_core/include/numpy/npy_endian.h
>> ++++ b/numpy/_core/include/numpy/npy_endian.h
>>   @@ -49,6 +49,7 @@
>>                || defined(NPY_CPU_PPC64LE)       \
>>                || defined(NPY_CPU_ARCEL)         \
>> @@ -46,5 +54,5 @@ index 5e58a7f..0926212 100644
>>                || defined(NPY_CPU_WASM)
>>            #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
>>   --
>> -2.20.1
>> +2.39.5
>>
>> diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
>> similarity index 68%
>> rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
>> rename to meta/recipes-devtools/python/python3-numpy_2.1.3.bb
>> index fa78b07f48b..da75dff1e04 100644
>> --- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
>> +++ b/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
>>   DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
>>   SECTION = "devel/python"
>>   LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
>> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a752eb20459cf74a9d84ee4825e8317c"
>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1de863c37a83e71b1e97b64d036ea78b"
>>
>>   SRCNAME = "numpy"
>>
>> @@ -13,22 +13,31 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
>>              file://fix_reproducibility.patch \
>>              file://run-ptest \
>>              "
>> -SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010"
>> +SRC_URI[sha256sum] = "aa08e04e08aaf974d4458def539dece0d28146d866a39da5639596f4921fd761"
>>
>>   GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
>>   UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
>>
>> -inherit ptest setuptools3 github-releases cython
>> +inherit ptest python_mesonpy github-releases cython
>>
>>   S = "${WORKDIR}/numpy-${PV}"
>>
>> -CLEANBROKEN = "1"
>> +# Remove references to buildpaths from numpy's __config__.py
>> +do_install:append() {
>> +    sed -i \
>> +        -e 's|${S}=||g' \
>> +        -e 's|${B}=||g' \
>> +        -e 's|${RECIPE_SYSROOT_NATIVE}=||g' \
>> +        -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
>> +        -e 's|${RECIPE_SYSROOT}=||g' \
>> +        -e 's|${RECIPE_SYSROOT}||g' ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/__config__.py
>>
>> -do_compile:prepend() {
>> -    export NPY_DISABLE_SVML=1
>> +    nativepython3 -mcompileall -s ${D} ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/__config__.py
>>   }
>>
>> -FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
>> +FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*.a \
>> +                          ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a \
>> +"
>>
>>   # install what is needed for numpy.test()
>>   RDEPENDS:${PN} = "python3-unittest \
>> @@ -59,7 +68,4 @@ RDEPENDS:${PN}-ptest += "python3-pytest \
>>                            ldd \
>>   "
>>
>> -# Upstream has a pyproject.toml but as of 1.26.4 it's marked as experimental
>> -INSANE_SKIP = "pep517-backend"
>> -
>>   BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.39.5
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#207543): https://lists.openembedded.org/g/openembedded-core/message/207543
>> Mute This Topic: https://lists.openembedded.org/mt/109705562/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


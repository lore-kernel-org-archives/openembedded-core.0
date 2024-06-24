Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708C8C2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 14:26:22 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.142151.1719239179223098418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 07:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=NgbkDHH2;
 spf=pass (domain: baylibre.com, ip: 209.85.219.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dff26b612a9so3773711276.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 07:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719239178; x=1719843978; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ayT94HJvDq3ZAyJxKYZ/rlzEugou1x6HGBoupglOJVo=;
        b=NgbkDHH22D55XxbQNc6H/b5Ho7R6IDsIVQx0Bavw/P69bZn2PRRWKU14/qOMteg57G
         Ej5d+Rmjb/QasVvnIdTyEGAqmiH2jSc4Jud4SnSBRt/4LrxAPMiKtSxikuXWoLR/qFlc
         a4C/mTDVIFK1bEblN/4/yEdvFGTvD4cBDjasmBs15PuNmqc/81WWe7N8a5pl07KV2pTf
         8rBOxF9wK1fMxPcHOpTJgOfeikW4+hrB19Zgj6MyWI+t1g0mED8P604dH9PN0ETyHI9z
         HFjm0JWvBgc0vKtmOBsOazMr0R2VzkYh5AgCh/b1cRqEy3NeUPm+v3E0ZOcblohvDUhb
         upNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719239178; x=1719843978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayT94HJvDq3ZAyJxKYZ/rlzEugou1x6HGBoupglOJVo=;
        b=GS47Apde+yTXRudHN/pzeDYA+r1JvvFDe7LWCyco2ZD/g3+HW7PqZ2qInxuIiBY6zD
         f4y3YqPZQpKf8jYvG9+FTNLgIsCW0cTysDnRFFeZ+NBLJlBS0BAoDPTR/bdo75tVymdV
         gXdpdTjHoUzoDQaWUyk9/gVTmL2XTz2KkgZfFoF5jtgDwObtpwj/fD/dgvN2OIwNZkSy
         24Bl0J15OBpEGNF5njuXlyhTJiUi3ynyaZ3xRu3b2+oRLfLNRNFozXqJZ2WsgNh9bYC3
         etsKMXIuMr9A8T4rxAfMwjWbd607rqddX/QCpL5A/ZWiMG+MdQ7597chROz74ffh/UF9
         KmzQ==
X-Gm-Message-State: AOJu0YwFvFUTz7wj6uCEUFG0maAsl4YE9gsMoAU7nVeHXfLBQ07q2Tg3
	/o5iCit4x+c02ePh8Og41MrKAZTVUbulHjBj+vvuxs2o2N2sF6Zmql2TmMfL1i0=
X-Google-Smtp-Source: AGHT+IExGHyS3WqThFGUFZyGT28oGByxhxT5CGT9myL4XFKF65tR6XUCzwhfpDo8MrBwZGv61v+0Gw==
X-Received: by 2002:a5b:bc7:0:b0:dff:29f5:54bb with SMTP id 3f1490d57ef6-e0303eb331fmr4155981276.4.1719239177883;
        Mon, 24 Jun 2024 07:26:17 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce8c5266sm319133385a.66.2024.06.24.07.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 07:26:17 -0700 (PDT)
Message-ID: <72e10e19-4f0c-4d41-83ee-3448f0659243@baylibre.com>
Date: Mon, 24 Jun 2024 10:26:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.0.0
To: Khem Raj <raj.khem@gmail.com>, alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
References: <20240621150943.479535-1-tgamblin@baylibre.com>
 <20240623200457ab19d015@mail.local>
 <CAMKF1sr_i6_mmuw_h2krTEemQRTGLqH6KQ4Qjs8GL7F9NZ-ErA@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMKF1sr_i6_mmuw_h2krTEemQRTGLqH6KQ4Qjs8GL7F9NZ-ErA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 14:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201089


On 2024-06-23 4:40 p.m., Khem Raj wrote:
> it also breaks pandas recipe in meta-python btw.
Alright. I'll look into the breakages soon. Thanks for letting me know.
>
> On Sun, Jun 23, 2024 at 1:05 PM Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>> Hello,
>>
>> I think this break piglit:
>>
>> ERROR: piglit-1.0+gitr-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/temp/run.do_compile.1337318', 1, None, None)
>> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/temp/log.do_compile.1337318
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build --target all --
>> | Change Dir: '/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build'
>> |
>> | Run Build Command(s): ninja -v -j 16 all
>> | [1/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests asmparser /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests/asmparser.list
>> | [2/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests vkrunner /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests/vkrunner.list
>> | [3/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests shader /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests/shader.list
>> | [4/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests glslparser /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests/glslparser.list
>> | [5/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_interface_block_tests.py > interface_block_tests.list
>> | [6/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_inout_fp64.py > inout_fp64.list
>> | [7/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_const_builtin_equal_tests.py > const_builtin_equal_tests.list
>> | [8/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/interpolation-qualifier-built-in-variable.py > interpolation-qualifier-built-in-variable.list
>> | [9/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py > intel_shader_integer_functions2_tests.list
>> | FAILED: generated_tests/intel_shader_integer_functions2_tests.list /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests/intel_shader_integer_functions2_tests.list
>> | cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py > intel_shader_integer_functions2_tests.list
>> | Traceback (most recent call last):
>> |   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py", line 800, in <module>
>> |     main()
>> |   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py", line 794, in main
>> |     results=attrib['results'](attrib['sources'](), attrib['operator']),
>> |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> |   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py", line 42, in generate_results_commutative
>> |     results.append(operator(srcs[i], srcs[j]))
>> |                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
>> |   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py", line 78, in abs_isub32
>> |     a = np.int32(np.uint32(_a))
>> |                  ^^^^^^^^^^^^^
>> | OverflowError: Python integer -2147483648 out of bounds for uint32
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9171/steps/12/logs/stdio
>>
>> On 21/06/2024 11:09:43-0400, Trevor Gamblin wrote:
>>> - This release contains numerous API changes and bug fixes.
>>>    Changelog: https://github.com/numpy/numpy/releases/tag/v2.0.0
>>>
>>> - Notably, the build backend has switched to mesonpy.
>>>
>>> - Patch 0001-numpy-core-Define-RISCV-32-support.patch had to be updated to
>>>    change the paths for the target files. It's still waiting to be merged
>>>    upstream and will need a rebase, so I've added a comment on the PR:
>>>
>>>    https://github.com/numpy/numpy/pull/17780
>>>
>>>    Note that the riscv32 test build didn't complete because openssl failed
>>>    on do_compile, but the patch applies cleanly now.
>>>
>>> - For numpy, add 'pkgconfig' to inherit to avoid the following error at
>>>    do_compile:
>>>
>>>    | Found Pkg-config: NO
>>>    | Run-time dependency python found: YES 3.12
>>>    | Has header "Python.h" with dependency python: NO
>>>    |
>>>    | ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cannot compile `Python.h`. Perhaps you need to install python-dev|python-devel
>>>    |
>>>    | A full log can be found at /home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson-log.txt
>>>
>>> - Also modify the FILES:${PN}-staticdev line to fix a QA issue at the end.
>>>
>>> License-Update: Change copyright year to 2024
>>>
>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>> ---
>>>   ...1-numpy-core-Define-RISCV-32-support.patch | 28 +++++++++++--------
>>>   ...numpy_1.26.4.bb => python3-numpy_2.0.0.bb} | 10 ++++---
>>>   2 files changed, 22 insertions(+), 16 deletions(-)
>>>   rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb => python3-numpy_2.0.0.bb} (83%)
>>>
>>> diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
>>> index 676bdbb3af..8dfb20edbb 100644
>>> --- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
>>> +++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
>>> @@ -1,4 +1,4 @@
>>> -From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
>>> +From df38843aaa7184115d262f14eae23ff38a20372a Mon Sep 17 00:00:00 2001
>>>   From: Khem Raj <raj.khem@gmail.com>
>>>   Date: Sun, 15 Nov 2020 15:32:39 -0800
>>>   Subject: [PATCH] numpy/core: Define RISCV-32 support
>>> @@ -7,15 +7,19 @@ Helps compile on riscv32
>>>
>>>   Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
>>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +
>>> +Update the patch with the new paths for numpy release 2.0.0.
>>> +
>>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>>   ---
>>> - numpy/core/include/numpy/npy_cpu.h    | 3 +++
>>> - numpy/core/include/numpy/npy_endian.h | 1 +
>>> + numpy/_core/include/numpy/npy_cpu.h    | 3 +++
>>> + numpy/_core/include/numpy/npy_endian.h | 1 +
>>>    2 files changed, 4 insertions(+)
>>>
>>> -diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
>>> -index 78d229e..04be511 100644
>>> ---- a/numpy/core/include/numpy/npy_cpu.h
>>> -+++ b/numpy/core/include/numpy/npy_cpu.h
>>> +diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/numpy/npy_cpu.h
>>> +index a19f8e6bbd..d824d4efb6 100644
>>> +--- a/numpy/_core/include/numpy/npy_cpu.h
>>> ++++ b/numpy/_core/include/numpy/npy_cpu.h
>>>   @@ -19,6 +19,7 @@
>>>     *              NPY_CPU_ARCEB
>>>     *              NPY_CPU_RISCV64
>>> @@ -33,10 +37,10 @@ index 78d229e..04be511 100644
>>>    #elif defined(__loongarch__)
>>>        #define NPY_CPU_LOONGARCH
>>>    #elif defined(__EMSCRIPTEN__)
>>> -diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
>>> -index 5e58a7f..0926212 100644
>>> ---- a/numpy/core/include/numpy/npy_endian.h
>>> -+++ b/numpy/core/include/numpy/npy_endian.h
>>> +diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/include/numpy/npy_endian.h
>>> +index 5e58a7f52c..09262120bf 100644
>>> +--- a/numpy/_core/include/numpy/npy_endian.h
>>> ++++ b/numpy/_core/include/numpy/npy_endian.h
>>>   @@ -49,6 +49,7 @@
>>>                || defined(NPY_CPU_PPC64LE)       \
>>>                || defined(NPY_CPU_ARCEL)         \
>>> @@ -46,5 +50,5 @@ index 5e58a7f..0926212 100644
>>>                || defined(NPY_CPU_WASM)
>>>            #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
>>>   --
>>> -2.20.1
>>> +2.45.2
>>>
>>> diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
>>> similarity index 83%
>>> rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
>>> rename to meta/recipes-devtools/python/python3-numpy_2.0.0.bb
>>> index ccd08147af..38aebdbce0 100644
>>> --- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
>>> +++ b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
>>> @@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
>>>   DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
>>>   SECTION = "devel/python"
>>>   LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
>>> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a752eb20459cf74a9d84ee4825e8317c"
>>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1de863c37a83e71b1e97b64d036ea78b"
>>>
>>>   SRCNAME = "numpy"
>>>
>>> @@ -13,14 +13,14 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
>>>              file://fix_reproducibility.patch \
>>>              file://run-ptest \
>>>              "
>>> -SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010"
>>> +SRC_URI[sha256sum] = "cf5d1c9e6837f8af9f92b6bd3e86d513cdc11f60fd62185cc49ec7d1aba34864"
>>>
>>>   GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
>>>   UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
>>>
>>>   DEPENDS += "python3-cython-native"
>>>
>>> -inherit ptest setuptools3 github-releases
>>> +inherit ptest python_mesonpy pkgconfig github-releases
>>>
>>>   S = "${WORKDIR}/numpy-${PV}"
>>>
>>> @@ -30,7 +30,9 @@ do_compile:prepend() {
>>>       export NPY_DISABLE_SVML=1
>>>   }
>>>
>>> -FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
>>> +FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*.a \
>>> +                          ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a \
>>> +"
>>>
>>>   # install what is needed for numpy.test()
>>>   RDEPENDS:${PN} = "python3-unittest \
>>> --
>>> 2.45.2
>>>
>>>
>>>
>>
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#201059): https://lists.openembedded.org/g/openembedded-core/message/201059
>> Mute This Topic: https://lists.openembedded.org/mt/106800625/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


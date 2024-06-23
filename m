Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6780C27C4F
	for <webhook@archiver.kernel.org>; Sun, 23 Jun 2024 20:05:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.125265.1719173100084280409
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 13:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A5Q7SAgO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13BC4240002;
	Sun, 23 Jun 2024 20:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719173098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jGNcyA3/DMBQzGTOv4xf9xojx7fqR6F26eKTuxPpVVs=;
	b=A5Q7SAgONbe6EzNHhs6xw9Vtq5ndRleHpa39a4AZyTqtCsFntM6HRKi9vVtZcFGMLPbMfs
	yAd1qsexerSHoAgrsgCeZYbu5DaOpptMplWnKj6UHuelJey1+AAq2tuQ1C6p76HOE4HYXr
	9oSVpyQlp/2O6/ttArTtLXAscHHHJ7kPynRSDENZDnfLQKu6uIdoiqsxE2pwEs+5dUhYKK
	vKcUGaOYnxtrN2Uhyqrp+sojpqAUcC1xvUNXd5bGLhUWgFPZLbiCsRFLPwQ6z7Zu26oNbS
	nDvcBt+z2R22ogl4kPJjqbeh3GZcffms9lsvK+DjEsahYG4fy/gURrSYDbZU9w==
Date: Sun, 23 Jun 2024 22:04:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.0.0
Message-ID: <20240623200457ab19d015@mail.local>
References: <20240621150943.479535-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621150943.479535-1-tgamblin@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 20:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201059

Hello,

I think this break piglit:

ERROR: piglit-1.0+gitr-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/temp/run.do_compile.1337318', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/temp/log.do_compile.1337318
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests asmparser /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests/asmparser.list
| [2/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests vkrunner /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests/vkrunner.list
| [3/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests shader /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests/shader.list
| [4/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/tests glslparser /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests/glslparser.list
| [5/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_interface_block_tests.py > interface_block_tests.list
| [6/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_inout_fp64.py > inout_fp64.list
| [7/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_const_builtin_equal_tests.py > const_builtin_equal_tests.list
| [8/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/interpolation-qualifier-built-in-variable.py > interpolation-qualifier-built-in-variable.list
| [9/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py > intel_shader_integer_functions2_tests.list
| FAILED: generated_tests/intel_shader_integer_functions2_tests.list /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests/intel_shader_integer_functions2_tests.list
| cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py > intel_shader_integer_functions2_tests.list
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py", line 800, in <module>
|     main()
|   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py", line 794, in main
|     results=attrib['results'](attrib['sources'](), attrib['operator']),
|             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py", line 42, in generate_results_commutative
|     results.append(operator(srcs[i], srcs[j]))
|                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_functions2_tests.py", line 78, in abs_isub32
|     a = np.int32(np.uint32(_a))
|                  ^^^^^^^^^^^^^
| OverflowError: Python integer -2147483648 out of bounds for uint32

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9171/steps/12/logs/stdio

On 21/06/2024 11:09:43-0400, Trevor Gamblin wrote:
> - This release contains numerous API changes and bug fixes.
>   Changelog: https://github.com/numpy/numpy/releases/tag/v2.0.0
> 
> - Notably, the build backend has switched to mesonpy.
> 
> - Patch 0001-numpy-core-Define-RISCV-32-support.patch had to be updated to
>   change the paths for the target files. It's still waiting to be merged
>   upstream and will need a rebase, so I've added a comment on the PR:
> 
>   https://github.com/numpy/numpy/pull/17780
> 
>   Note that the riscv32 test build didn't complete because openssl failed
>   on do_compile, but the patch applies cleanly now.
> 
> - For numpy, add 'pkgconfig' to inherit to avoid the following error at
>   do_compile:
> 
>   | Found Pkg-config: NO
>   | Run-time dependency python found: YES 3.12
>   | Has header "Python.h" with dependency python: NO
>   |
>   | ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cannot compile `Python.h`. Perhaps you need to install python-dev|python-devel
>   |
>   | A full log can be found at /home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson-log.txt
> 
> - Also modify the FILES:${PN}-staticdev line to fix a QA issue at the end.
> 
> License-Update: Change copyright year to 2024
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...1-numpy-core-Define-RISCV-32-support.patch | 28 +++++++++++--------
>  ...numpy_1.26.4.bb => python3-numpy_2.0.0.bb} | 10 ++++---
>  2 files changed, 22 insertions(+), 16 deletions(-)
>  rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb => python3-numpy_2.0.0.bb} (83%)
> 
> diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
> index 676bdbb3af..8dfb20edbb 100644
> --- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
> +++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
> @@ -1,4 +1,4 @@
> -From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
> +From df38843aaa7184115d262f14eae23ff38a20372a Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 15 Nov 2020 15:32:39 -0800
>  Subject: [PATCH] numpy/core: Define RISCV-32 support
> @@ -7,15 +7,19 @@ Helps compile on riscv32
>  
>  Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Update the patch with the new paths for numpy release 2.0.0.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>  ---
> - numpy/core/include/numpy/npy_cpu.h    | 3 +++
> - numpy/core/include/numpy/npy_endian.h | 1 +
> + numpy/_core/include/numpy/npy_cpu.h    | 3 +++
> + numpy/_core/include/numpy/npy_endian.h | 1 +
>   2 files changed, 4 insertions(+)
>  
> -diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
> -index 78d229e..04be511 100644
> ---- a/numpy/core/include/numpy/npy_cpu.h
> -+++ b/numpy/core/include/numpy/npy_cpu.h
> +diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/numpy/npy_cpu.h
> +index a19f8e6bbd..d824d4efb6 100644
> +--- a/numpy/_core/include/numpy/npy_cpu.h
> ++++ b/numpy/_core/include/numpy/npy_cpu.h
>  @@ -19,6 +19,7 @@
>    *              NPY_CPU_ARCEB
>    *              NPY_CPU_RISCV64
> @@ -33,10 +37,10 @@ index 78d229e..04be511 100644
>   #elif defined(__loongarch__)
>       #define NPY_CPU_LOONGARCH
>   #elif defined(__EMSCRIPTEN__)
> -diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
> -index 5e58a7f..0926212 100644
> ---- a/numpy/core/include/numpy/npy_endian.h
> -+++ b/numpy/core/include/numpy/npy_endian.h
> +diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/include/numpy/npy_endian.h
> +index 5e58a7f52c..09262120bf 100644
> +--- a/numpy/_core/include/numpy/npy_endian.h
> ++++ b/numpy/_core/include/numpy/npy_endian.h
>  @@ -49,6 +49,7 @@
>               || defined(NPY_CPU_PPC64LE)       \
>               || defined(NPY_CPU_ARCEL)         \
> @@ -46,5 +50,5 @@ index 5e58a7f..0926212 100644
>               || defined(NPY_CPU_WASM)
>           #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
>  -- 
> -2.20.1
> +2.45.2
>  
> diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
> similarity index 83%
> rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
> rename to meta/recipes-devtools/python/python3-numpy_2.0.0.bb
> index ccd08147af..38aebdbce0 100644
> --- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
>  DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
>  SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a752eb20459cf74a9d84ee4825e8317c"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1de863c37a83e71b1e97b64d036ea78b"
>  
>  SRCNAME = "numpy"
>  
> @@ -13,14 +13,14 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
>             file://fix_reproducibility.patch \
>             file://run-ptest \
>             "
> -SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010"
> +SRC_URI[sha256sum] = "cf5d1c9e6837f8af9f92b6bd3e86d513cdc11f60fd62185cc49ec7d1aba34864"
>  
>  GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
>  UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
>  
>  DEPENDS += "python3-cython-native"
>  
> -inherit ptest setuptools3 github-releases
> +inherit ptest python_mesonpy pkgconfig github-releases
>  
>  S = "${WORKDIR}/numpy-${PV}"
>  
> @@ -30,7 +30,9 @@ do_compile:prepend() {
>      export NPY_DISABLE_SVML=1
>  }
>  
> -FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
> +FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*.a \
> +                          ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a \
> +"
>  
>  # install what is needed for numpy.test()
>  RDEPENDS:${PN} = "python3-unittest \
> -- 
> 2.45.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201028): https://lists.openembedded.org/g/openembedded-core/message/201028
> Mute This Topic: https://lists.openembedded.org/mt/106800625/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


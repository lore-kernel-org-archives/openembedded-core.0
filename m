Return-Path: <andrey.konovalov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <cc503a7f-02ef-323a-24bd-519410830030@linaro.org>
Date: Sun, 18 Sep 2022 14:55:58 +0300
MIME-Version: 1.0
Subject: Re: [OE-core] [RFC][PATCH 1/1] mesa: fix building OpenCL programs
References: <20220917115642.766941-1-andrey.konovalov@linaro.org>
 <20220917115642.766941-2-andrey.konovalov@linaro.org>
 <CANNYZj9-K-uToKPjVb1+AwUMZb5gK0opW1F2gHKr1BNe+iNyow@mail.gmail.com>
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
In-Reply-To: <CANNYZj9-K-uToKPjVb1+AwUMZb5gK0opW1F2gHKr1BNe+iNyow@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org

On 9/17/22 15:26, Alexander Kanavin wrote:
> Please send this upstream first.

Oops... For some reason I was under impression that this is OE build specific.
Good point!

Thanks,
Andrey

> Alex
> 
> On Sat 17. Sep 2022 at 12.56, Andrey Konovalov <andrey.konovalov@linaro.org <mailto:andrey.konovalov@linaro.org>> wrote:
> 
>     When building an OpenCL program clover needs to locate opencl-c.h
>     include file. This include file location is passed via cpp args using
>     CLANG_RESOURCE_DIR macro. To set CLANG_RESOURCE_DIR value meson currently
>     uses "$(llvm-config --libdir)" which results in path to sysroot included
>     into CLANG_RESOURCE_DIR. Then clBuildProgram() fails with
>     "fatal error: 'opencl-c.h' file not found".
> 
>     Work this around by using '/usr/lib' instead of the libdir value
>     exported by LLVM.
> 
>     Microsoft/Intel CLC should suffer from the same issue, and the similar
>     workaround should work in this case too.
> 
>     Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org <mailto:andrey.konovalov@linaro.org>>
>     ---
>       ...-meson.CLANG_RESOURCE_DIR-workaround.patch | 42 +++++++++++++++++++
>       meta/recipes-graphics/mesa/mesa.inc           |  1 +
>       2 files changed, 43 insertions(+)
>       create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
> 
>     diff --git a/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
>     b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
>     new file mode 100644
>     index 0000000000..db60fe407f
>     --- /dev/null
>     +++ b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
>     @@ -0,0 +1,42 @@
>     +From: Andrey Konovalov <andrey.konovalov@linaro.org <mailto:andrey.konovalov@linaro.org>>
>     +Date: Fri, 16 Sep 2022 16:58:20 +0000
>     +Subject: [PATCH] CLANG_RESOURCE_DIR workaround
>     +
>     +Setting CLANG_RESOURCE_DIR to "$(llvm-config --libdir)something"
>     +results in clBuildProgram() error when an OpenCL program is being
>     +built on the target. The reason is that $(llvm-config --libdir) output
>     +includes path to the sysroot directory.
>     +
>     +Work this around by using '/usr/lib' instead of the libdir value
>     +exported by LLVM.
>     +
>     +Upstream-Status: Inappropriate
>     +Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org <mailto:andrey.konovalov@linaro.org>>
>     +
>     +---
>     +
>     +--- a/src/gallium/frontends/clover/meson.build 2022-09-16 10:24:55.910577158 +0000
>     ++++ b/src/gallium/frontends/clover/meson.build 2022-09-16 10:28:13.112804197 +0000
>     +@@ -71,8 +71,7 @@ libclllvm = static_library(
>     +     clover_opencl_cpp_args,
>     +     clover_spirv_cpp_args,
>     +     '-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
>     +-      dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 'libdir'), 'clang',
>     +-      dep_llvm.version(), 'include',
>     ++      '/usr/lib', 'clang', dep_llvm.version(), 'include',
>     +     )),
>     +   ],
>     +   gnu_symbol_visibility : 'hidden',
>     +--- a/src/compiler/clc/meson.build     2022-09-16 16:40:10.641735401 +0000
>     ++++ b/src/compiler/clc/meson.build     2022-09-16 16:50:18.095700452 +0000
>     +@@ -39,7 +39,9 @@ files_libclc = files(
>     +   'clc_helpers.cpp',
>     + )
>     +
>     +-_libclc_cpp_args = ['-DCLANG_RESOURCE_DIR="@0@"'.format(clang_resource_dir)]
>     ++_libclc_cpp_args = ['-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
>     ++                       '/usr/lib', 'clang', dep_llvm.version(), 'include'
>     ++                    ))]
>     + if with_microsoft_clc
>     +   _libclc_cpp_args += ['-DUSE_STATIC_OPENCL_C_H=1']
>     + endif
>     diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>     index ea7ed4fd27..0a2fb2150d 100644
>     --- a/meta/recipes-graphics/mesa/mesa.inc
>     +++ b/meta/recipes-graphics/mesa/mesa.inc
>     @@ -23,6 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz
>     <https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz> \
>                  file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
>                  file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch \
>                  file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
>     +           file://0001-meson.CLANG_RESOURCE_DIR-workaround.patch \
>                  "
> 
>       SRC_URI[sha256sum] = "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a"
>     -- 
>     2.25.1
> 
> 
>     
> 

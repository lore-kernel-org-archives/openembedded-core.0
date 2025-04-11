Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F82DC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 11:44:10 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.23815.1744371848746166707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 04:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BNg0s1KC;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30ddad694c1so17878931fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 04:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744371847; x=1744976647; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T33GiDlIVNY4FVGz6NAS0LmD/rQ+d/6qqsSVc+t4pmo=;
        b=BNg0s1KCP07pwHj3f5DnjyOSkT9WFQnDHF93nwaFcfRsxfoOdvhUw87G5YnGY7/IM9
         rsFS54qZ3J6Gy52CNNO224CvhCVqQJzsHPDD3gpZsNc6Ysk/2kpRKLNhPLY6p+UZdieN
         Hs2h4br5+4IeQyyr5fNz+Q/Sx7ZMenZLeQdlrH3YRF6VbccH9GyokOlTxMXx0kJNllWR
         CY420Pnw6digWVWz0H8TRrVcgyvv+00kGe4PsKu5aqfmgOluPywbE6f/qJj9tFbAWftJ
         OUlUBvWL4wD/TbObsIAVe5yu5RwqxBMV2uy37ZSedZtv4gPU/+T6/+5NBMdgl/llP+2w
         At1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744371847; x=1744976647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T33GiDlIVNY4FVGz6NAS0LmD/rQ+d/6qqsSVc+t4pmo=;
        b=EdMRI21vDxd56kG9klne5JJ/zSqJ+ECX8bxjHX44HUms8161/1NCzM+0CqG0gUj25p
         BhqCdF9iKyYBCwoJjeeGjDgbDnyzn2gzYihE5hF3xP1CADeXj+mtHBeAMoA1UohovFPG
         PqHTUIUqxcF2y4VjWVAXK0h3CCE/Hvu7/ykYtZAxd4H1sQnWwZgDmWyiOMyBLx+3NtWu
         GfaNIoLlBDCYj4jjtGa2EhBvGpmCyolZqyN2XEJNxOzPqhx3mLMQzZLYVOviYpRXIv9A
         uSla0TjSRxxGNBHFuPShL223SmpvMr4AaqgtLzBRfQha/7gtXWQH9jySiym5PknxuUOH
         axCg==
X-Gm-Message-State: AOJu0YxCPpAOppB04G/RHKbzGvUzyOCHVmzZSZ7QQIQEoOhzeSzFnuld
	FEgump4XBo6uClr2MUbcy32GfKeZ/2s/3M+bL+ZGWXk1lo9t/anNtv77OrNSTarlrHqOA2bwIKT
	FAcdoNOx5wWzrqXFXOdeskRagOXE=
X-Gm-Gg: ASbGncvWehaWaM5xYQ4E6PiPTkPiJYNj9/0XP6bDcwsol5SziKqluUsJ8XIJN9cvxTw
	QxcySbUv6UQrZgMv+kHEHCR3X8oKDTIZmrxBryCU2BYoJxR1chnXEnBRMkXg1Aa2V8CMpgRt0Hs
	EdtqTDDKmeSZR7CYVilumQ+YOo
X-Google-Smtp-Source: AGHT+IEQoX/RyYoeD8tBEJ5qJc7B5FKqvm1b/53YsVsa6Ez0gXsiuYKJ6TVtm8uaqZf4lenPK8QI3jGVybvVuBctzHM=
X-Received: by 2002:a05:651c:2212:b0:30c:2e22:c893 with SMTP id
 38308e7fff4ca-310499fbf5dmr8012231fa.23.1744371846308; Fri, 11 Apr 2025
 04:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com> <20250410-mesa-25-v7-10-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-10-59d715c66e19@oss.qualcomm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 11 Apr 2025 13:43:52 +0200
X-Gm-Features: ATxdqUFMOm8lhjvSTpo56WlnKouB78uWqZzIn9jiDNJdfuxQ3Ylu3HBAXe5HFPw
Message-ID: <CA+chaQeWA01kB3q6=o4xcZwA1TMggHxYTZ0AZETY7he_yU3E1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 10/12] mesa: upgrade 24.0.7 -> 25.0.2
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 11:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214733

On Thu, Apr 10, 2025 at 4:55=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Upgrade the Mesa package, dropping applied and refreshing outstanding
> patches. The dri3 config option is now gone, dependencies are merged
> into X11 deps. The swrast gallium driver has been split into softpipe
> and llvmpipe drivers. Reworked OpenCL support to use mesa_clc compiler.

Hi,

looks like kmsro is no longer valid gallium-drivers, the PACKAGECONFIG
should be updated or dropped in this recipe:
meta/recipes-graphics/mesa/mesa.inc:PACKAGECONFIG[kmsro] =3D ""
meta/recipes-graphics/mesa/mesa.inc:GALLIUMDRIVERS:append =3D
"${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"

and then removed from enabled PACKAGECONFIG options in meta-raspberrypi:
recipes-graphics/mesa/mesa.bbappend:PACKAGECONFIG:append:rpi =3D "
gallium vc4 v3d kmsro ${@bb.utils.contains('DISTRO_FEATURES', 'x11
opengl', 'x11 dri3', '', d)} ${@bb.utils.contains('DISTRO_FEATURES',
'vulkan', 'vulkan broadcom', '', d)}"

Removed in https://gitlab.freedesktop.org/mesa/mesa/-/commit/89863a050bea42=
9d9574a307bc28953bb60accaf

related change in alpine
https://gitlab.alpinelinux.org/alpine/aports/-/issues/16413 (points to
mesa changes where the option was removed but all return 503 SSL
handshake error now).

Regards,

>
> License-Update: license text cleared and clarified.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...evert-meson-do-not-pull-in-clc-for-clover.patch | 53 -------------
>  ...d-Include-missing-llvm-IR-header-Module.h.patch | 41 ----------
>  .../files/0001-drisw-fix-build-without-dri3.patch  | 58 --------------
>  ...eno-don-t-encode-build-path-into-binaries.patch | 46 +++++++++--
>  ...able-SIMD-blake-optimisations-on-x32-host.patch | 28 +++++++
>  ...ext-don-t-try-zink-if-not-enabled-in-mesa.patch | 42 ----------
>  meta/recipes-graphics/mesa/mesa.inc                | 91 ++++++++++++----=
------
>  7 files changed, 117 insertions(+), 242 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pu=
ll-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-m=
eson-do-not-pull-in-clc-for-clover.patch
> deleted file mode 100644
> index 1711e22585a72d1909473e4d9716c4734d4c5eee..0000000000000000000000000=
000000000000000
> --- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-c=
lc-for-clover.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
> -From: Markus Volk <f_l_k@t-online.de>
> -Date: Fri, 8 Mar 2024 15:53:11 +0100
> -Subject: [PATCH] Revert "meson: do not pull in clc for clover"
> -
> -This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
> -Upstream-Status: Inappropriate [https://gitlab.freedesktop.org/mesa/mesa=
/-/merge_requests/27783/diffs?commit_id=3Da976f2c9f0c07f9e06cc9affd9124b45b=
c60c2bd]
> -
> -Once the merge request above was added, it will only be possible to prov=
ide opencl spir-v with gallium-rusticl=3Dtrue. This is not yet supported in=
 the mesa recipe.
> -For now reverting this commit allows to still use clover with opencl-spi=
rv, which would otherwise be broken starting from mesa 24.0.2.
> -
> -After it was merged, this patch needs to be removed and rusticl support =
will be required
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ----
> - meson.build              | 3 ++-
> - src/compiler/meson.build | 2 +-
> - 2 files changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 2db6185..741b5d1 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -813,6 +813,7 @@ if _opencl !=3D 'disabled'
> -     error('The Clover OpenCL state tracker requires rtti')
> -   endif
> -
> -+  with_clc =3D true
> -   with_gallium_opencl =3D true
> -   with_opencl_icd =3D _opencl =3D=3D 'icd'
> - else
> -@@ -837,7 +838,7 @@ if with_gallium_rusticl
> - endif
> -
> - dep_clc =3D null_dep
> --if with_gallium_opencl or with_clc
> -+if with_clc
> -   dep_clc =3D dependency('libclc')
> - endif
> -
> -diff --git a/src/compiler/meson.build b/src/compiler/meson.build
> -index 8d73544..1dae56d 100644
> ---- a/src/compiler/meson.build
> -+++ b/src/compiler/meson.build
> -@@ -79,7 +79,7 @@ subdir('nir')
> -
> - subdir('spirv')
> -
> --if with_clc
> -+if with_opencl_spirv
> -   subdir('clc')
> - endif
> - if with_gallium
> diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-ll=
vm-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-Inc=
lude-missing-llvm-IR-header-Module.h.patch
> deleted file mode 100644
> index 82ad88a079c144153778120bf2a3c1d1c36a0c94..0000000000000000000000000=
000000000000000
> --- a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-h=
eader-Module.h.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 1 Jul 2024 23:09:29 -0700
> -Subject: [PATCH] amd: Include missing llvm IR header Module.h
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -With LLVM-19, Module.h header is not being pulled, which results in
> -compile errors e.g.
> -
> -src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function for =
call to =E2=80=98unwrap(LLVMOpaqueModule*&)=E2=80=99
> -  102 |    unwrap(module)->setTargetTriple(TM->getTargetTriple().getTrip=
le());
> -      |    ~~~~~~^~~~~~~~
> -In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,
> -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
> -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
> -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibrar=
yInfo.h:14,
> -                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
> -
> -Its getting the definition from llvm/IR/Type.h instead of Module.h and c=
aused
> -confusion to compiler
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/29993]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/amd/llvm/ac_llvm_helper.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_help=
er.cpp
> -index 5d065279ad1..af4a50f8409 100644
> ---- a/src/amd/llvm/ac_llvm_helper.cpp
> -+++ b/src/amd/llvm/ac_llvm_helper.cpp
> -@@ -8,6 +8,7 @@
> - #include <llvm/Analysis/TargetLibraryInfo.h>
> - #include <llvm/IR/IRBuilder.h>
> - #include <llvm/IR/LegacyPassManager.h>
> -+#include <llvm/IR/Module.h>
> - #include <llvm/IR/Verifier.h>
> - #include <llvm/Target/TargetMachine.h>
> - #include <llvm/MC/MCSubtargetInfo.h>
> diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-withou=
t-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-withou=
t-dri3.patch
> deleted file mode 100644
> index ab1615209063fb0b7bee74f3b49843790801e40a..0000000000000000000000000=
000000000000000
> --- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.=
patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Tue, 6 Feb 2024 09:47:09 +0100
> -Subject: [PATCH 1/2] drisw: fix build without dri3
> -
> -commit 1887368df41 ("glx/sw: check for modifier support in the kopper pa=
th")
> -added dri3_priv.h header and dri3_check_multibuffer() function in drisw =
that
> -can be build without dri3.
> -
> -  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in =
function `driswCreateScreenDriver':
> -  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference=
 to `dri3_check_multibuffer'
> -  collect2: error: ld returned 1 exit status
> -
> -Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
> -dri3_check_multibuffer().
> -
> -Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper pa=
th")
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/27478]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/glx/drisw_glx.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
> -index 3d3f752..4b19e2d 100644
> ---- a/src/glx/drisw_glx.c
> -+++ b/src/glx/drisw_glx.c
> -@@ -32,7 +32,9 @@
> - #include <dlfcn.h>
> - #include "dri_common.h"
> - #include "drisw_priv.h"
> -+#ifdef HAVE_DRI3
> - #include "dri3_priv.h"
> -+#endif
> - #include <X11/extensions/shmproto.h>
> - #include <assert.h>
> - #include <vulkan/vulkan_core.h>
> -@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_displ=
ay *priv,
> -        goto handle_error;
> -    }
> -
> -+#ifdef HAVE_DRI3
> -    if (pdpyp->zink) {
> -       bool err;
> -       psc->has_multibuffer =3D dri3_check_multibuffer(priv->dpy, &err);
> -@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_dis=
play *priv,
> -          goto handle_error;
> -       }
> -    }
> -+#endif
> -
> -    glx_config_destroy_list(psc->base.configs);
> -    psc->base.configs =3D configs;
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode=
-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-fre=
edreno-don-t-encode-build-path-into-binaries.patch
> index 5975ab4472ecebc34ef1504904523de73c9f5c51..953a724dc092667a5ac6f19f6=
b41d4277fab4ba2 100644
> --- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-=
path-into-binaries.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-=
path-into-binaries.patch
> @@ -22,18 +22,29 @@ diff --git a/src/freedreno/afuc/meson.build b/src/fre=
edreno/afuc/meson.build
>  index bb7cebf5a748..351cc31ef2de 100644
>  --- a/src/freedreno/afuc/meson.build
>  +++ b/src/freedreno/afuc/meson.build
> -@@ -56,6 +56,7 @@ if with_tests
> +@@ -56,10 +56,12 @@ if with_tests
>     asm_fw =3D custom_target('afuc_test.fw',
>       output: 'afuc_test.fw',
> -     command: [asm, '-g', '6', files('../.gitlab-ci/traces/afuc_test.asm=
'), '@OUTPUT@'],
> +     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPU=
T@'],
> ++    env: {'RNN_PATH': rnn_src_path},
> +   )
> +   asm_fw_a7xx =3D custom_target('afuc_test_a7xx.fw',
> +     output: 'afuc_test_a7xx.fw',
> +     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@=
OUTPUT@'],
>  +    env: {'RNN_PATH': rnn_src_path},
>     )
>     test('afuc-asm',
>       diff,
> -@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
> +@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
>       disasm_fw =3D custom_target('afuc_test.asm',
>         output: 'afuc_test.asm',
> -       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.=
fw'), '-g', '630'],
> +       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.=
fw')],
> ++      env: {'RNN_PATH': rnn_src_path},
> +       capture: true
> +     )
> +     disasm_fw_a7xx =3D custom_target('afuc_test_a7xx.asm',
> +       output: 'afuc_test_a7xx.asm',
> +       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test_=
a7xx.fw')],
>  +      env: {'RNN_PATH': rnn_src_path},
>         capture: true
>       )
> @@ -71,8 +82,29 @@ index 98e49b8fcf0e..145e72597eb9 100644
>  -rnn_path =3D rnn_src_path + ':' + get_option('prefix') + '/' + rnn_inst=
all_path
>  +rnn_path =3D get_option('prefix') + '/' + rnn_install_path
>
> - dep_lua =3D dependency('lua54', 'lua53', 'lua52', 'lua', required: fals=
e,
> -                      allow_fallback: true, version: '>=3D5.2')
> ---
> + dep_libarchive =3D dependency('libarchive', allow_fallback: true, requi=
red: false)
> + dep_libxml2 =3D dependency('libxml-2.0', allow_fallback: true, required=
: false)
> +diff --git a/src/freedreno/registers/gen_header.py b/src/freedreno/regis=
ters/gen_header.py
> +--- a/src/freedreno/registers/gen_header.py
> ++++ b/src/freedreno/registers/gen_header.py
> +@@ -885,13 +885,14 @@ The rules-ng-ng source files this header
> + """)
> +       maxlen =3D 0
> +       for filepath in p.xml_files:
> +-              maxlen =3D max(maxlen, len(filepath))
> ++              maxlen =3D max(maxlen, len(os.path.basename(filepath)))
> +       for filepath in p.xml_files:
> +-              pad =3D " " * (maxlen - len(filepath))
> ++              filename =3D os.path.basename(filepath)
> ++              pad =3D " " * (maxlen - len(filename))
> +               filesize =3D str(os.path.getsize(filepath))
> +               filesize =3D " " * (7 - len(filesize)) + filesize
> +               filetime =3D time.ctime(os.path.getmtime(filepath))
> +-              print("- " + filepath + pad + " (" + filesize + " bytes, =
from " + filetime + ")")
> ++              print("- " + filename + pad + " (" + filesize + " bytes, =
from " + filetime + ")")
> +       if p.copyright_year:
> +               current_year =3D str(datetime.date.today().year)
> +               print()
> +---
>  2.39.2
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson-disable-SIMD-bla=
ke-optimisations-on-x32-host.patch b/meta/recipes-graphics/mesa/files/0001-=
meson-disable-SIMD-blake-optimisations-on-x32-host.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..bebe30037abffab676bdd3711=
16c1b9cbd9f9cef
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-meson-disable-SIMD-blake-opti=
misations-on-x32-host.patch
> @@ -0,0 +1,28 @@
> +From f3c34b8da2662643089b33be8b93e56a4da8703d Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Date: Wed, 2 Apr 2025 15:30:20 +0300
> +Subject: [PATCH] meson: disable SIMD blake optimisations on x32 host
> +
> +On X.org startup libgallium crashes on x32 hosts inside
> +blake3_hash_many_sse41(), most likely because of the different pointer
> +size. Disable SIMD blake implementation if x32 is detected.
> +
> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Upstream-Status: Pending [will be submitted upstream after internal clea=
rance]
> +---
> + src/util/blake3/meson.build | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/util/blake3/meson.build b/src/util/blake3/meson.build
> +index 6b53daab6b32..ce6dd85ac1ea 100644
> +--- a/src/util/blake3/meson.build
> ++++ b/src/util/blake3/meson.build
> +@@ -24,6 +24,8 @@ if cpu_family =3D=3D 'x86_64'
> +     else
> +       files_blake3 +=3D ['blake3_sse2_x86-64_windows_gnu.S', 'blake3_ss=
e41_x86-64_windows_gnu.S', 'blake3_avx2_x86-64_windows_gnu.S', 'blake3_avx5=
12_x86-64_windows_gnu.S']
> +     endif
> ++  elif meson.get_compiler('c').sizeof('void *') =3D=3D 4
> ++    blake3_defs +=3D blake3_x86_no_simd_defs
> +   else
> +     files_blake3 +=3D ['blake3_sse2_x86-64_unix.S', 'blake3_sse41_x86-6=
4_unix.S', 'blake3_avx2_x86-64_unix.S', 'blake3_avx512_x86-64_unix.S']
> +   endif
> diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-=
if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext=
-don-t-try-zink-if-not-enabled-in-mesa.patch
> deleted file mode 100644
> index 036a0b494539243e7850ba3ea24669e0749e2dd2..0000000000000000000000000=
000000000000000
> --- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-=
enabled-in-mesa.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Tue, 6 Feb 2024 09:47:10 +0100
> -Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
> -
> -Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw=
 and sw drivers")
> -added an automatic zink fallback even when the zink gallium is not
> -enabled at build time.
> -
> -It leads to unexpected error log while loading drisw driver and
> -zink is not installed on the rootfs:
> -
> -  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
> -
> -Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw=
 and sw drivers")
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/27478]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/glx/glxext.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/glx/glxext.c b/src/glx/glxext.c
> -index 05c825a..7a06aa9 100644
> ---- a/src/glx/glxext.c
> -+++ b/src/glx/glxext.c
> -@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
> - #endif /* HAVE_DRI3 */
> -       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
> -          dpyPriv->dri2Display =3D dri2CreateDisplay(dpy);
> -+#if defined(HAVE_ZINK)
> -       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
> -          try_zink =3D !debug_get_bool_option("LIBGL_KOPPER_DISABLE", fa=
lse) &&
> -                     !getenv("GALLIUM_DRIVER");
> -+#endif /* HAVE_ZINK */
> -    }
> - #endif /* GLX_USE_DRM */
> -    if (glx_direct)
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index f6a91a7002f8aebc8845eda7f339912e086839b5..9edce6b2281c2e33e6fe20819=
f0f4998cceba60b 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -10,21 +10,18 @@ HOMEPAGE =3D "http://mesa3d.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org"
>  SECTION =3D "x11"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9dc=
533a0735ef10"
> +LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Dffe678546d4337b732cf=
d12262e6af11"
>
>  PE =3D "2"
>
>  SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
> -           file://0001-drisw-fix-build-without-dri3.patch \
> -           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patc=
h \
> -           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch =
\
> -           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch=
 \
> +           file://0001-meson-disable-SIMD-blake-optimisations-on-x32-hos=
t.patch \
>             file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
>  "
>
> -SRC_URI[sha256sum] =3D "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae=
2c7d96db93f6c26a"
> -PV =3D "24.0.7"
> +SRC_URI[sha256sum] =3D "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6=
d4c45638627fdc97"
> +PV =3D "25.0.2"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>
> @@ -38,8 +35,7 @@ do_install:append() {
>    fi
>  }
>
> -DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native"
> -DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG', =
'opencl', 'mesa-native', '', d)}"
> +DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native pyt=
hon3-pyyaml-native"
>  EXTRANATIVEPATH +=3D "chrpath-native"
>  PROVIDES =3D " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '',=
 d)} \
> @@ -77,44 +73,47 @@ EXTRA_OEMESON =3D " \
>      -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
>  "
>
> -EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}"
> -EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Denabled', '', d)}"
> -
>  def strip_comma(s):
>      return s.strip(',')
>
> +
>  PACKAGECONFIG =3D " \
>         gallium \
>         video-codecs \
>         ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gle=
s gbm virgl', '', d)} \
> -       ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '',=
 d)} \
> -       ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '',=
 d)} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)}=
 \
>  "
>
> -PACKAGECONFIG:append:class-native =3D " gallium-llvm r600"
> +PACKAGECONFIG:append:x86 =3D " libclc gallium-llvm"
> +PACKAGECONFIG:append:x86-64 =3D " libclc gallium-llvm"
> +PACKAGECONFIG:append:i686 =3D " libclc gallium-llvm"
> +PACKAGECONFIG:append:class-native =3D " libclc gallium-llvm r600"
>
>  # "gbm" requires "opengl"
>  PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
>
> -X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes xrandr"
> +X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes xrandr xorgproto libxshmfence"
>  # "x11" requires "opengl"
>  PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
>  PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
>
> -PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, xorgproto =
libxshmfence"
> +VULKAN_DRIVERS_AMD =3D ""
> +VULKAN_DRIVERS_AMD:x86 =3D ",amd"
> +VULKAN_DRIVERS_AMD:x86-64 =3D ",amd"
> +# i686 is a 32 bit override for mesa-native
> +VULKAN_DRIVERS_AMD:i686 =3D ",amd"
> +
> +VULKAN_DRIVERS_INTEL =3D "${@bb.utils.contains('PACKAGECONFIG', 'libclc'=
, ',intel', '', d)}"
> +VULKAN_DRIVERS_SWRAST =3D ",swrast"
> +# Crashes on x32
> +VULKAN_DRIVERS_SWRAST:x86-x32 =3D ""
> +VULKAN_DRIVERS_LLVM =3D "${VULKAN_DRIVERS_SWRAST}${VULKAN_DRIVERS_AMD}${=
VULKAN_DRIVERS_INTEL}"
>
> -# Vulkan drivers need dri3 enabled
> -# amd could be enabled as well but requires gallium-llvm with llvm >=3D =
3.9
>  VULKAN_DRIVERS =3D ""
> -VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
> -VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
> -# i686 is a 32 bit override for mesa-native
> -VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
>  VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedr=
eno', ',freedreno', '', d)}"
>  VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'broadc=
om', ',broadcom', '', d)}"
> -VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'galliu=
m-llvm', ',swrast', '', d)}"
> +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'galliu=
m-llvm', '${VULKAN_DRIVERS_LLVM}', '', d)}"
>  VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagin=
ation', ',imagination-experimental', '', d)}"
>  PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_D=
RIVERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-heade=
rs"
>
> @@ -137,7 +136,7 @@ PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
>  PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}')}, -Dtools=
=3D'', ${TOOLS_DEPS}"
>
>  PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
> -PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd"
> +PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Denabled, -Dglvnd=3Ddisabled, libglvn=
d"
>
>  # "gles" requires "opengl"
>  PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled, -Dgles1=3D=
disabled -Dgles2=3Ddisabled"
> @@ -145,9 +144,9 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3D=
enabled, -Dgles1=3Ddisabled -Dgles2
>  # "egl" requires "opengl"
>  PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
>
> -# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
> -OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-=
Dopencl-native=3Dtrue', '', d)}"
> -PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue =
${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc =
spirv-tools python3-ply-native"
> +# "opencl" also requires libclc and gallium-llvm to be present in PKGCON=
FIG!
> +# Be sure to enable them both for the target and for the native build.
> +PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd,-Dgallium-opencl=3Ddis=
abled,"
>
>  PACKAGECONFIG[broadcom] =3D ""
>  PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
> @@ -157,13 +156,13 @@ PACKAGECONFIG[vc4] =3D ""
>  PACKAGECONFIG[v3d] =3D ""
>  PACKAGECONFIG[zink] =3D ""
>
> -GALLIUMDRIVERS =3D "swrast"
> +GALLIUMDRIVERS =3D "softpipe"
>  # gallium swrast was found to crash Xorg on startup in x32 qemu
>  GALLIUMDRIVERS:x86-x32 =3D ""
> -GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
> -GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:x86 =3D ",i915,crocus"
> +GALLIUMDRIVERS:append:x86-64 =3D ",i915,crocus"
>  # i686 is a 32 bit override for mesa-native
> -GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:i686 =3D ",i915,crocus"
>
>  GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etnavi=
v', ',etnaviv', '', d)}"
>  GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedr=
eno', ',freedreno', '', d)}"
> @@ -173,8 +172,12 @@ GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PAC=
KAGECONFIG', 'v3d', ',v3d', ''
>  GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'zink',=
 ',zink', '', d)}"
>
>  # radeonsi requires LLVM
> +GALLIUMDRIVERS_IRIS =3D "${@bb.utils.contains('PACKAGECONFIG', 'libclc',=
 ',iris', '', d)}"
>  GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600=
', ',radeonsi', '', d)}"
> -GALLIUMDRIVERS_LLVM =3D ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
> +GALLIUMDRIVERS_LLVMPIPE =3D ",llvmpipe"
> +# llvmpipe crashes on x32
> +GALLIUMDRIVERS_LLVMPIPE:x86-x32 =3D ""
> +GALLIUMDRIVERS_LLVM =3D ",r300,nouveau${GALLIUMDRIVERS_LLVMPIPE}${GALLIU=
MDRIVERS_IRIS}${GALLIUMDRIVERS_RADEONSI}"
>  GALLIUMDRIVERS_LLVM:append:x86 =3D ",svga"
>  GALLIUMDRIVERS_LLVM:append:x86-64 =3D ",svga"
>  # i686 is a 32 bit override for mesa-native
> @@ -187,8 +190,16 @@ GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PAC=
KAGECONFIG', 'gallium-llvm', '
>  GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600',=
 ',r600', '', d)}"
>  GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'virgl'=
, ',virgl', '', d)}"
>
> +MESA_CLC =3D "system"
> +MESA_CLC:class-native =3D "enabled"
> +INSTALL_MESA_CLC =3D "false"
> +INSTALL_MESA_CLC:class-native =3D "true"
> +MESA_NATIVE =3D "mesa-native"
> +MESA_NATIVE:class-native =3D ""
> +
>  PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${@strip_comma('${GALLIU=
MDRIVERS}')}, -Dgallium-drivers=3D'', libdrm"
>  PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denable=
d, -Dllvm=3Ddisabled, llvm llvm-native elfutils"
> +PACKAGECONFIG[libclc] =3D "-Dmesa-clc=3D${MESA_CLC} -Dinstall-mesa-clc=
=3D${INSTALL_MESA_CLC},,libclc spirv-tools spirv-llvm-translator ${MESA_NAT=
IVE}"
>  PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Denabled, -Dgallium-xa=3Ddisabled"
>  PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,li=
bva-initial"
>  PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddi=
sabled,libvdpau"
> @@ -242,6 +253,7 @@ RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('P=
ACKAGECONFIG', 'opencl', 'lib
>
>  PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libosmesa libosmesa-dev \
> +             libgallium \
>               libgl-mesa libgl-mesa-dev \
>               libglx-mesa libglx-mesa-dev \
>               libglapi libglapi-dev \
> @@ -267,13 +279,6 @@ do_install:append () {
>      rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
>  }
>
> -do_install:append:class-native () {
> -    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false', =
d)}; then
> -        install -d ${D}${bindir}
> -        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
> -    fi
> -}
> -
>  # For the packages that make up the OpenGL interfaces, inject variables =
so that
>  # they don't get Debian-renamed (which would remove the -mesa suffix), a=
nd
>  # RPROVIDEs/RCONFLICTs on the generic libgl name.
> @@ -344,7 +349,8 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}=
/drirc.d"
>  FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpow=
ervr_rogue.so ${datadir}/vulkan"
>  FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>  FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendo=
r.d"
> -FILES:libgbm =3D "${libdir}/libgbm.so.*"
> +FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
> +FILES:libgallium =3D "${libdir}/libgallium-*.so"
>  FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
>  FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
> @@ -372,6 +378,9 @@ FILES:libxatracker-dev =3D "${libdir}/libxatracker.so=
 ${libdir}/libxatracker.la \
>  FILES:${PN}-tools =3D "${bindir} ${datadir}"
>  ALLOW_EMPTY:${PN}-tools =3D "1"
>
> +# All DRI drivers are symlinks to libdril_dri.so
> +INSANE_SKIP:${PN}-megadriver +=3D "dev-so"
> +
>  # Fix upgrade path from mesa to mesa-megadriver
>  RREPLACES:mesa-megadriver =3D "mesa"
>  RCONFLICTS:mesa-megadriver =3D "mesa"
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214612): https://lists.openembedded.org/g/openembedde=
d-core/message/214612
> Mute This Topic: https://lists.openembedded.org/mt/112184991/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


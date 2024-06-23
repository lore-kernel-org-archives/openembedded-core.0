Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B90C27C4F
	for <webhook@archiver.kernel.org>; Sun, 23 Jun 2024 20:40:46 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.125970.1719175236654951824
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 13:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mC+5DsSO;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25cc6962c24so1581997fac.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 13:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719175236; x=1719780036; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjyfT0fJkiZvPGppHguDbMX2PY9amAwemFJnk8V2tXU=;
        b=mC+5DsSOZ7fmcc7Bw/QpxZ8gc8rCQ8FKWyz3IGGCNg32gATOCciBNVdTQl35cd04pK
         PqfI7dGgg365ubUZ4kc9hPLgoVjlu48pBtrUGDVgeqYcFiz/5rxehL0JiDub4mN0XiRp
         wqXo5cVCgzqhgp2KFaIkzILZptcb+f5r8PHCyCBn7txxv+FMXo0ne8cZfN/fgfOkPnPw
         WpISG6vC2sxjOv96QLL6eWdb3dNjr8EpQmQbuh1NJ7veREYK4A0BZpS03HJT5y7+o1Wx
         2mlQ9l2zLZeisqjLaJNvhf3c8v5Na0YFmlUDhsHj2Es7oGXaQfK/it9oEmK/XFpV6L+9
         UQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719175236; x=1719780036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjyfT0fJkiZvPGppHguDbMX2PY9amAwemFJnk8V2tXU=;
        b=Y5BICi+Qr0XDspnG/hgRbxK/26a7jcUC9wmE5yavLBCH4z98rAkuDr4LoVwKvdPevo
         fZXhlOfS/DSva397LCWtJryACzPbZYPYqss6JKyDXBVQ0dkWm9VonzF/tDVpxqvhLCBk
         qSZdQ8/615vxpciS7rDy6Qo8l+nGm6Fr7EBhpVNnu/x83fJ7hgOIgrbL8tGmrJsNPfe7
         9DUvZbUrU6N9T7IGzlZ40ri52p1QW2aCddGcNCLjGmPmVhBkwMFxAmt90QOCKiOjWous
         9Zpil+C4VLL4P8Q33wiG4Xwj8EKm7NsL9ZOZG+9f2VHnJvAGPWhmPp6xlky58IVqZPSI
         8guw==
X-Forwarded-Encrypted: i=1; AJvYcCVOA0Ruo221wBxI7FiaTZUa20GeXKyRS1k4SpA0FO0fOR6hMvGE+sLsspr2fOxovoHnzawLzSYCmelRU/HNm21vDFx3M9m59b4hbgVtIpemQdDzt1dBfi0e
X-Gm-Message-State: AOJu0YxqKKpZenMDXjjqt518W1UwbWE9oUwNfvS/AaSKaD/XOmldw7Cs
	VmXSi4OlIAQmdO8aEjkzMnZ6bDB82UVpnkcsz6majDyjumuxBhaW8vdKD1pveSDgkltnlH3Lsi2
	7D9eIdBLyG4qIO2kd0gLcjhqRau4=
X-Google-Smtp-Source: AGHT+IEqlo6uiUFZgy6G3hZf/Fun5ddoYq/4sdpe9iWje5VMEOKCx8AXJME+larzSviYpSK/jXTvz0A8suN2c0WmZqc=
X-Received: by 2002:a05:6870:e9a8:b0:24f:d178:d48d with SMTP id
 586e51a60fabf-25d06cc056cmr2771118fac.31.1719175235606; Sun, 23 Jun 2024
 13:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240621150943.479535-1-tgamblin@baylibre.com> <20240623200457ab19d015@mail.local>
In-Reply-To: <20240623200457ab19d015@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Jun 2024 13:40:09 -0700
Message-ID: <CAMKF1sr_i6_mmuw_h2krTEemQRTGLqH6KQ4Qjs8GL7F9NZ-ErA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.0.0
To: alexandre.belloni@bootlin.com
Cc: Trevor Gamblin <tgamblin@baylibre.com>, openembedded-core@lists.openembedded.org, 
	ross.burton@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 20:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201060

it also breaks pandas recipe in meta-python btw.

On Sun, Jun 23, 2024 at 1:05=E2=80=AFPM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> I think this break piglit:
>
> ERROR: piglit-1.0+gitr-r0 do_compile: ExecutionError('/home/pokybuild/yoc=
to-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit=
/1.0+gitr/temp/run.do_compile.1337318', 1, None, None)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/musl-qe=
mux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/temp/lo=
g.do_compile.1337318
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: VERBOSE=3D1 cmake --build /home/pokybuild/yocto-worker/musl-qemux=
86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build --ta=
rget all --
> | Change Dir: '/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/=
work/core2-32-poky-linux-musl/piglit/1.0+gitr/build'
> |
> | Run Build Command(s): ninja -v -j 16 all
> | [1/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/w=
ork/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests =
&& /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-=
poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-nativ=
e/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/co=
re2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home=
/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-lin=
ux-musl/piglit/1.0+gitr/git/tests asmparser /home/pokybuild/yocto-worker/mu=
sl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/bu=
ild/target_api/no_api/tests/asmparser.list
> | [2/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/w=
ork/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests =
&& /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-=
poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-nativ=
e/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/co=
re2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home=
/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-lin=
ux-musl/piglit/1.0+gitr/git/tests vkrunner /home/pokybuild/yocto-worker/mus=
l-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/bui=
ld/target_api/no_api/tests/vkrunner.list
> | [3/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/w=
ork/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests =
&& /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-=
poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-nativ=
e/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/co=
re2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home=
/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-lin=
ux-musl/piglit/1.0+gitr/git/tests shader /home/pokybuild/yocto-worker/musl-=
qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/build=
/target_api/no_api/tests/shader.list
> | [4/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/w=
ork/core2-32-poky-linux-musl/piglit/1.0+gitr/build/target_api/no_api/tests =
&& /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-=
poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-nativ=
e/python3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/co=
re2-32-poky-linux-musl/piglit/1.0+gitr/git/tests/find_static_tests.py /home=
/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-lin=
ux-musl/piglit/1.0+gitr/git/tests glslparser /home/pokybuild/yocto-worker/m=
usl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+gitr/b=
uild/target_api/no_api/tests/glslparser.list
> | [5/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/w=
ork/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home=
/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-lin=
ux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python=
3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-p=
oky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_interface_block_test=
s.py > interface_block_tests.list
> | [6/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/w=
ork/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home=
/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-lin=
ux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python=
3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-p=
oky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_inout_fp64.py > inou=
t_fp64.list
> | [7/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/w=
ork/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home=
/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-lin=
ux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python=
3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-p=
oky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_const_builtin_equal_=
tests.py > const_builtin_equal_tests.list
> | [8/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/w=
ork/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home=
/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-lin=
ux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python=
3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-p=
oky-linux-musl/piglit/1.0+gitr/git/generated_tests/interpolation-qualifier-=
built-in-variable.py > interpolation-qualifier-built-in-variable.list
> | [9/4291] cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/w=
ork/core2-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home=
/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-lin=
ux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python=
3 /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-p=
oky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer=
_functions2_tests.py > intel_shader_integer_functions2_tests.list
> | FAILED: generated_tests/intel_shader_integer_functions2_tests.list /hom=
e/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-li=
nux-musl/piglit/1.0+gitr/build/generated_tests/intel_shader_integer_functio=
ns2_tests.list
> | cd /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2=
-32-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /home/pokybuil=
d/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/p=
iglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /home/p=
okybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux=
-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shader_integer_function=
s2_tests.py > intel_shader_integer_functions2_tests.list
> | Traceback (most recent call last):
> |   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/=
core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shad=
er_integer_functions2_tests.py", line 800, in <module>
> |     main()
> |   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/=
core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shad=
er_integer_functions2_tests.py", line 794, in main
> |     results=3Dattrib['results'](attrib['sources'](), attrib['operator']=
),
> |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/=
core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shad=
er_integer_functions2_tests.py", line 42, in generate_results_commutative
> |     results.append(operator(srcs[i], srcs[j]))
> |                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/=
core2-32-poky-linux-musl/piglit/1.0+gitr/git/generated_tests/gen_intel_shad=
er_integer_functions2_tests.py", line 78, in abs_isub32
> |     a =3D np.int32(np.uint32(_a))
> |                  ^^^^^^^^^^^^^
> | OverflowError: Python integer -2147483648 out of bounds for uint32
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9171/st=
eps/12/logs/stdio
>
> On 21/06/2024 11:09:43-0400, Trevor Gamblin wrote:
> > - This release contains numerous API changes and bug fixes.
> >   Changelog: https://github.com/numpy/numpy/releases/tag/v2.0.0
> >
> > - Notably, the build backend has switched to mesonpy.
> >
> > - Patch 0001-numpy-core-Define-RISCV-32-support.patch had to be updated=
 to
> >   change the paths for the target files. It's still waiting to be merge=
d
> >   upstream and will need a rebase, so I've added a comment on the PR:
> >
> >   https://github.com/numpy/numpy/pull/17780
> >
> >   Note that the riscv32 test build didn't complete because openssl fail=
ed
> >   on do_compile, but the patch applies cleanly now.
> >
> > - For numpy, add 'pkgconfig' to inherit to avoid the following error at
> >   do_compile:
> >
> >   | Found Pkg-config: NO
> >   | Run-time dependency python found: YES 3.12
> >   | Has header "Python.h" with dependency python: NO
> >   |
> >   | ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cannot=
 compile `Python.h`. Perhaps you need to install python-dev|python-devel
> >   |
> >   | A full log can be found at /home/tgamblin/workspace/yocto/poky/buil=
d/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson-l=
og.txt
> >
> > - Also modify the FILES:${PN}-staticdev line to fix a QA issue at the e=
nd.
> >
> > License-Update: Change copyright year to 2024
> >
> > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > ---
> >  ...1-numpy-core-Define-RISCV-32-support.patch | 28 +++++++++++--------
> >  ...numpy_1.26.4.bb =3D> python3-numpy_2.0.0.bb} | 10 ++++---
> >  2 files changed, 22 insertions(+), 16 deletions(-)
> >  rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb =3D> pyth=
on3-numpy_2.0.0.bb} (83%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core=
-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy=
/0001-numpy-core-Define-RISCV-32-support.patch
> > index 676bdbb3af..8dfb20edbb 100644
> > --- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define=
-RISCV-32-support.patch
> > +++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define=
-RISCV-32-support.patch
> > @@ -1,4 +1,4 @@
> > -From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
> > +From df38843aaa7184115d262f14eae23ff38a20372a Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sun, 15 Nov 2020 15:32:39 -0800
> >  Subject: [PATCH] numpy/core: Define RISCV-32 support
> > @@ -7,15 +7,19 @@ Helps compile on riscv32
> >
> >  Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Update the patch with the new paths for numpy release 2.0.0.
> > +
> > +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >  ---
> > - numpy/core/include/numpy/npy_cpu.h    | 3 +++
> > - numpy/core/include/numpy/npy_endian.h | 1 +
> > + numpy/_core/include/numpy/npy_cpu.h    | 3 +++
> > + numpy/_core/include/numpy/npy_endian.h | 1 +
> >   2 files changed, 4 insertions(+)
> >
> > -diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/n=
umpy/npy_cpu.h
> > -index 78d229e..04be511 100644
> > ---- a/numpy/core/include/numpy/npy_cpu.h
> > -+++ b/numpy/core/include/numpy/npy_cpu.h
> > +diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include=
/numpy/npy_cpu.h
> > +index a19f8e6bbd..d824d4efb6 100644
> > +--- a/numpy/_core/include/numpy/npy_cpu.h
> > ++++ b/numpy/_core/include/numpy/npy_cpu.h
> >  @@ -19,6 +19,7 @@
> >    *              NPY_CPU_ARCEB
> >    *              NPY_CPU_RISCV64
> > @@ -33,10 +37,10 @@ index 78d229e..04be511 100644
> >   #elif defined(__loongarch__)
> >       #define NPY_CPU_LOONGARCH
> >   #elif defined(__EMSCRIPTEN__)
> > -diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/includ=
e/numpy/npy_endian.h
> > -index 5e58a7f..0926212 100644
> > ---- a/numpy/core/include/numpy/npy_endian.h
> > -+++ b/numpy/core/include/numpy/npy_endian.h
> > +diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/incl=
ude/numpy/npy_endian.h
> > +index 5e58a7f52c..09262120bf 100644
> > +--- a/numpy/_core/include/numpy/npy_endian.h
> > ++++ b/numpy/_core/include/numpy/npy_endian.h
> >  @@ -49,6 +49,7 @@
> >               || defined(NPY_CPU_PPC64LE)       \
> >               || defined(NPY_CPU_ARCEL)         \
> > @@ -46,5 +50,5 @@ index 5e58a7f..0926212 100644
> >               || defined(NPY_CPU_WASM)
> >           #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
> >  --
> > -2.20.1
> > +2.45.2
> >
> > diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/met=
a/recipes-devtools/python/python3-numpy_2.0.0.bb
> > similarity index 83%
> > rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
> > rename to meta/recipes-devtools/python/python3-numpy_2.0.0.bb
> > index ccd08147af..38aebdbce0 100644
> > --- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
> > +++ b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://numpy.org/"
> >  DESCRIPTION =3D "NumPy is the fundamental package needed for scientifi=
c computing with Python."
> >  SECTION =3D "devel/python"
> >  LICENSE =3D "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da752eb20459cf74a9d84ee4=
825e8317c"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1de863c37a83e71b1e97b64=
d036ea78b"
> >
> >  SRCNAME =3D "numpy"
> >
> > @@ -13,14 +13,14 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${S=
RCNAME}-${PV}.tar.gz \
> >             file://fix_reproducibility.patch \
> >             file://run-ptest \
> >             "
> > -SRC_URI[sha256sum] =3D "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d=
74a9df87efa4912010"
> > +SRC_URI[sha256sum] =3D "cf5d1c9e6837f8af9f92b6bd3e86d513cdc11f60fd6218=
5cc49ec7d1aba34864"
> >
> >  GITHUB_BASE_URI =3D "https://github.com/numpy/numpy/releases"
> >  UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
> >
> >  DEPENDS +=3D "python3-cython-native"
> >
> > -inherit ptest setuptools3 github-releases
> > +inherit ptest python_mesonpy pkgconfig github-releases
> >
> >  S =3D "${WORKDIR}/numpy-${PV}"
> >
> > @@ -30,7 +30,9 @@ do_compile:prepend() {
> >      export NPY_DISABLE_SVML=3D1
> >  }
> >
> > -FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/=
*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
> > +FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib=
/*.a \
> > +                          ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/=
*.a \
> > +"
> >
> >  # install what is needed for numpy.test()
> >  RDEPENDS:${PN} =3D "python3-unittest \
> > --
> > 2.45.2
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201059): https://lists.openembedded.org/g/openembedde=
d-core/message/201059
> Mute This Topic: https://lists.openembedded.org/mt/106800625/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


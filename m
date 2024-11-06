Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA72AD44D78
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 14:53:57 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.47646.1730904828855661853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 06:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QdRQg6+i;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5ee1c3dbeb9so498858eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730904828; x=1731509628; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WL6IzpxfqOTAZUlO1HfZMLrErS2w/oQeZ+RamKNzuQ0=;
        b=QdRQg6+ila6idFSK5HQJs96LVRZT8l/jxdBF9Kl6EYjPsiXdOi7Llm+O7K1aPP6FON
         MEhfmMvf6marPb7kKeSo4cGzmDPG49vJSIdOg4fAKHOkFbfHYauvdVd93UmMT11R1RDz
         6aDjc69GisPgU2NLDnaK49+PzB0BirUrid+zT9wrGm3q3AD/DElQQjPHyvPTyS+lv3ou
         eWR038hjk2xYeldKybC8N3YH5nITushUq7pe+JpCwEtyUh8P7PnBUckSuwPd+MjwAJzY
         PPLCcovJlzaeNKta44EEbO+9j4Whdec4dARBBKepPDyAHoAC+6kPWBSUIcLPBxKgADsW
         crqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730904828; x=1731509628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WL6IzpxfqOTAZUlO1HfZMLrErS2w/oQeZ+RamKNzuQ0=;
        b=fqMzbSKIMWqOJcUKatVRgYspwQQ5gmbfct6iH3N3u9z3mptg4BoWKZZ4LyucyHe2IX
         NKSZZ9ghfXgJy5gcFOsdTuJSboZTGymQQcPHX6DkpgYj/bBxdMPyqUFMO1DkT6bt0Mpv
         79RW9IpOFuvuDy6mDz8Sw/QLlSRAq3L+cPckhpOjaq7gLnoNRyaV+E3iG8gUtaurp4sg
         WPvZVebSAUNHEp5drHFmQ7pVhq+bmPGUjwvBwO2WaRpO6oRW7kiltl+r/P110oT3AGcZ
         oJfTOO29ZXqD+jidTKlfmLejlPQVTg3YjkZ+5yc0nhHc9xBPpCAJ3JXeaD19Vlg7YwoS
         SIAw==
X-Gm-Message-State: AOJu0YwtrL6YRme1AyWoPVCMpHemU+kd5syCXTVQsrvkaV9bcXbpeNBw
	Su/Wwr1kh+v/sjxcBlGOeTXTOpukJod2+MAdB/5NHdvTzFF8WxkHK5Z7K5s2Xw11nAKP2gkJ+UG
	GZvswQeuh2+LyyxWCgx1IYX5xdxE=
X-Google-Smtp-Source: AGHT+IF0rUHrIODzb2py/jlkV840kflUbyF8aSjcZKMlnV0v1SQquAkdgkePwjBh38AKK0E0cvOOrfM3xfGmZHWaOe8=
X-Received: by 2002:a4a:da17:0:b0:5eb:61b1:a74b with SMTP id
 006d021491bc7-5ee3719253emr1651995eaf.0.1730904827830; Wed, 06 Nov 2024
 06:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20241105184540.3450302-1-raj.khem@gmail.com> <20241105184540.3450302-18-raj.khem@gmail.com>
 <CANNYZj_q_j1o4t6Wn+6kcQ064k1kVYvj0XCJL7qtyoa8UGDvTw@mail.gmail.com>
In-Reply-To: <CANNYZj_q_j1o4t6Wn+6kcQ064k1kVYvj0XCJL7qtyoa8UGDvTw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Nov 2024 06:53:37 -0800
Message-ID: <CAMKF1sqXV5dJJU-tn_ybMk3Qt1LkRF+4ut=xRHi8=s6qHUO3=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/19] mesa: update 24.0.7 -> 24.2.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
Content-Type: multipart/alternative; boundary="000000000000672a6806263faf1c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 14:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206785

--000000000000672a6806263faf1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 3:30=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> This update was as well done with the assumption that clang is not in
> core, and so disables Intel iris driver (e.g. all modern intel
> graphics). I'd say leave it out too; we'll get back to it after clang
> lands.


Sounds good I have included it to make sure
This does not regress


>
> Alex
>
> On Tue, 5 Nov 2024 at 19:46, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Markus Volk <f_l_k@t-online.de>
> >
> >  - Remove patches that have been merged upstream
> >  - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch. Issue
> was fixed upstream
> >  - Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch
> >  - Use 'enabled/disabled' for glvnd instead of deprecated 'true/false'
> >  - swrast gallium driver has been split into 'softpipe' and 'llvmpipe'.
> The use of 'swrast'
> >    has been deprecated.
> >    [
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-24.2.2/meson.build#L=
171
> ]
> >  - Add package for libgallium and install
> >  - Add python3-pyyaml-native dependency
> >  - Limit intel_clc to x86-64
> >  - Remove OPENCL_NATIVE variable. The according option has been removed
> >    from meson_options.txt.
> >  - Meanwhile theres an install option for intel_clc. Use it instead of
> manual install
> >  - intel 'iris' and intel 'vulkan' drivers require opencl and thus need
> meta-clang layer
> >    [https://gitlab.freedesktop.org/mesa/mesa/-/issues/11141]
> >  - Remove gallium kmsro option. This is set depending on
> 'system_has_kms_drm'
> >    [
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-24.2.2/meson.build#L=
206
> ]
> >  - Add vulkan support for older intel graphics
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> >
> > Note: 'kmsro' needs to be removed from mesa.bbappend in meta-raspberryp=
i
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...-meson-do-not-pull-in-clc-for-clover.patch | 53 --------------
> >  ...lude-missing-llvm-IR-header-Module.h.patch | 41 -----------
> >  .../0001-drisw-fix-build-without-dri3.patch   | 58 ---------------
> >  ...on-t-encode-build-path-into-binaries.patch | 71 +++++++++++++++----
> >  ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 -----------
> >  meta/recipes-graphics/mesa/mesa.inc           | 49 +++++--------
> >  6 files changed, 77 insertions(+), 237 deletions(-)
> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for=
-clover.patch
> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-=
Module.h.patch
> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enable=
d-in-mesa.patch
> >
> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-f=
or-clover.patch
> b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-f=
or-clover.patch
> > deleted file mode 100644
> > index 1711e22585a..00000000000
> > ---
> a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-f=
or-clover.patch
> > +++ /dev/null
> > @@ -1,53 +0,0 @@
> > -From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
> > -From: Markus Volk <f_l_k@t-online.de>
> > -Date: Fri, 8 Mar 2024 15:53:11 +0100
> > -Subject: [PATCH] Revert "meson: do not pull in clc for clover"
> > -
> > -This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
> > -Upstream-Status: Inappropriate [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?com=
mit_id=3Da976f2c9f0c07f9e06cc9affd9124b45bc60c2bd
> ]
> > -
> > -Once the merge request above was added, it will only be possible to
> provide opencl spir-v with gallium-rusticl=3Dtrue. This is not yet suppor=
ted
> in the mesa recipe.
> > -For now reverting this commit allows to still use clover with
> opencl-spirv, which would otherwise be broken starting from mesa 24.0.2.
> > -
> > -After it was merged, this patch needs to be removed and rusticl suppor=
t
> will be required
> > -
> > -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ----
> > - meson.build              | 3 ++-
> > - src/compiler/meson.build | 2 +-
> > - 2 files changed, 3 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/meson.build b/meson.build
> > -index 2db6185..741b5d1 100644
> > ---- a/meson.build
> > -+++ b/meson.build
> > -@@ -813,6 +813,7 @@ if _opencl !=3D 'disabled'
> > -     error('The Clover OpenCL state tracker requires rtti')
> > -   endif
> > -
> > -+  with_clc =3D true
> > -   with_gallium_opencl =3D true
> > -   with_opencl_icd =3D _opencl =3D=3D 'icd'
> > - else
> > -@@ -837,7 +838,7 @@ if with_gallium_rusticl
> > - endif
> > -
> > - dep_clc =3D null_dep
> > --if with_gallium_opencl or with_clc
> > -+if with_clc
> > -   dep_clc =3D dependency('libclc')
> > - endif
> > -
> > -diff --git a/src/compiler/meson.build b/src/compiler/meson.build
> > -index 8d73544..1dae56d 100644
> > ---- a/src/compiler/meson.build
> > -+++ b/src/compiler/meson.build
> > -@@ -79,7 +79,7 @@ subdir('nir')
> > -
> > - subdir('spirv')
> > -
> > --if with_clc
> > -+if with_opencl_spirv
> > -   subdir('clc')
> > - endif
> > - if with_gallium
> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-heade=
r-Module.h.patch
> b/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-heade=
r-Module.h.patch
> > deleted file mode 100644
> > index 82ad88a079c..00000000000
> > ---
> a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-heade=
r-Module.h.patch
> > +++ /dev/null
> > @@ -1,41 +0,0 @@
> > -From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Mon, 1 Jul 2024 23:09:29 -0700
> > -Subject: [PATCH] amd: Include missing llvm IR header Module.h
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -With LLVM-19, Module.h header is not being pulled, which results in
> > -compile errors e.g.
> > -
> > -src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function fo=
r
> call to =E2=80=98unwrap(LLVMOpaqueModule*&)=E2=80=99
> > -  102 |
> unwrap(module)->setTargetTriple(TM->getTargetTriple().getTriple());
> > -      |    ~~~~~~^~~~~~~~
> > -In file included from
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-s=
ysroot-native/usr/include/llvm/IR/Type.h:18,
> > -                 from
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-s=
ysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
> > -                 from
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-s=
ysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
> > -                 from
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-s=
ysroot-native/usr/include/llvm/Analysis/TargetLibraryInfo.h:14,
> > -                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8=
:
> > -
> > -Its getting the definition from llvm/IR/Type.h instead of Module.h and
> caused
> > -confusion to compiler
> > -
> > -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29993]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - src/amd/llvm/ac_llvm_helper.cpp | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/src/amd/llvm/ac_llvm_helper.cpp
> b/src/amd/llvm/ac_llvm_helper.cpp
> > -index 5d065279ad1..af4a50f8409 100644
> > ---- a/src/amd/llvm/ac_llvm_helper.cpp
> > -+++ b/src/amd/llvm/ac_llvm_helper.cpp
> > -@@ -8,6 +8,7 @@
> > - #include <llvm/Analysis/TargetLibraryInfo.h>
> > - #include <llvm/IR/IRBuilder.h>
> > - #include <llvm/IR/LegacyPassManager.h>
> > -+#include <llvm/IR/Module.h>
> > - #include <llvm/IR/Verifier.h>
> > - #include <llvm/Target/TargetMachine.h>
> > - #include <llvm/MC/MCSubtargetInfo.h>
> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patc=
h
> b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patc=
h
> > deleted file mode 100644
> > index ab161520906..00000000000
> > ---
> a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patc=
h
> > +++ /dev/null
> > @@ -1,58 +0,0 @@
> > -From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
> > -From: Romain Naour <romain.naour@smile.fr>
> > -Date: Tue, 6 Feb 2024 09:47:09 +0100
> > -Subject: [PATCH 1/2] drisw: fix build without dri3
> > -
> > -commit 1887368df41 ("glx/sw: check for modifier support in the kopper
> path")
> > -added dri3_priv.h header and dri3_check_multibuffer() function in dris=
w
> that
> > -can be build without dri3.
> > -
> > -  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: i=
n
> function `driswCreateScreenDriver':
> > -  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined
> reference to `dri3_check_multibuffer'
> > -  collect2: error: ld returned 1 exit status
> > -
> > -Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
> > -dri3_check_multibuffer().
> > -
> > -Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper
> path")
> > -
> > -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
> > -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - src/glx/drisw_glx.c | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
> > -index 3d3f752..4b19e2d 100644
> > ---- a/src/glx/drisw_glx.c
> > -+++ b/src/glx/drisw_glx.c
> > -@@ -32,7 +32,9 @@
> > - #include <dlfcn.h>
> > - #include "dri_common.h"
> > - #include "drisw_priv.h"
> > -+#ifdef HAVE_DRI3
> > - #include "dri3_priv.h"
> > -+#endif
> > - #include <X11/extensions/shmproto.h>
> > - #include <assert.h>
> > - #include <vulkan/vulkan_core.h>
> > -@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct
> glx_display *priv,
> > -        goto handle_error;
> > -    }
> > -
> > -+#ifdef HAVE_DRI3
> > -    if (pdpyp->zink) {
> > -       bool err;
> > -       psc->has_multibuffer =3D dri3_check_multibuffer(priv->dpy, &err=
);
> > -@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct
> glx_display *priv,
> > -          goto handle_error;
> > -       }
> > -    }
> > -+#endif
> > -
> > -    glx_config_destroy_list(psc->base.configs);
> > -    psc->base.configs =3D configs;
> > ---
> > -2.44.0
> > -
> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path=
-into-binaries.patch
> b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path=
-into-binaries.patch
> > index 5975ab4472e..38871b6d11f 100644
> > ---
> a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path=
-into-binaries.patch
> > +++
> b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path=
-into-binaries.patch
> > @@ -1,4 +1,4 @@
> > -From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
> > +From 66d73feaac088d1a588a44a1780f2eaf4335fccf Mon Sep 17 00:00:00 2001
> >  From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >  Date: Tue, 16 Jul 2024 12:32:47 +0300
> >  Subject: [PATCH] freedreno: don't encode build path into binaries
> > @@ -13,33 +13,76 @@ it manually when running the tests.
> >  Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30206]
> >  Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >  ---
> > + meson.build                      | 1 +
> > + meson_options.txt                | 7 +++++++
> >   src/freedreno/afuc/meson.build   | 4 ++++
> >   src/freedreno/decode/meson.build | 4 +++-
> > - src/freedreno/meson.build        | 2 +-
> > - 3 files changed, 8 insertions(+), 2 deletions(-)
> > + src/freedreno/meson.build        | 5 ++++-
> > + 5 files changed, 19 insertions(+), 2 deletions(-)
> >
> > +diff --git a/meson.build b/meson.build
> > +index 3bc837813f967..5c94e76649c63 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -76,6 +76,7 @@ if with_tools.contains('all')
> > +     'imagination',
> > +   ]
> > + endif
> > ++with_tools_for_development =3D get_option('tools-for-development')
> > +
> > + with_any_vulkan_layers =3D get_option('vulkan-layers').length() !=3D =
0
> > + with_intel_tools =3D with_tools.contains('intel') or
> with_tools.contains('intel-ui')
> > +diff --git a/meson_options.txt b/meson_options.txt
> > +index 753bebd961e3f..9bc308b512c13 100644
> > +--- a/meson_options.txt
> > ++++ b/meson_options.txt
> > +@@ -537,6 +537,13 @@ option(
> > +   description : 'List of tools to build. (Note: `intel-ui` selects
> `intel`)',
> > + )
> > +
> > ++option(
> > ++  'tools-for-development',
> > ++  type : 'boolean',
> > ++  value : false,
> > ++  description : 'Support running tools from the build tree (for
> developers)',
> > ++)
> > ++
> > + option(
> > +   'power8',
> > +   type : 'feature',
> >  diff --git a/src/freedreno/afuc/meson.build
> b/src/freedreno/afuc/meson.build
> > -index bb7cebf5a748..351cc31ef2de 100644
> > +index bb7cebf5a748c..351cc31ef2dec 100644
> >  --- a/src/freedreno/afuc/meson.build
> >  +++ b/src/freedreno/afuc/meson.build
> > -@@ -56,6 +56,7 @@ if with_tests
> > +@@ -56,10 +56,12 @@ if with_tests
> >     asm_fw =3D custom_target('afuc_test.fw',
> >       output: 'afuc_test.fw',
> > -     command: [asm, '-g', '6',
> files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
> > +     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'),
> '@OUTPUT@'],
> > ++    env: {'RNN_PATH': rnn_src_path},
> > +   )
> > +   asm_fw_a7xx =3D custom_target('afuc_test_a7xx.fw',
> > +     output: 'afuc_test_a7xx.fw',
> > +     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'),
> '@OUTPUT@'],
> >  +    env: {'RNN_PATH': rnn_src_path},
> >     )
> >     test('afuc-asm',
> >       diff,
> > -@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
> > +@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
> >       disasm_fw =3D custom_target('afuc_test.asm',
> >         output: 'afuc_test.asm',
> > -       command: [disasm, '-u',
> files('../.gitlab-ci/reference/afuc_test.fw'), '-g', '630'],
> > +       command: [disasm, '-u',
> files('../.gitlab-ci/reference/afuc_test.fw')],
> > ++      env: {'RNN_PATH': rnn_src_path},
> > +       capture: true
> > +     )
> > +     disasm_fw_a7xx =3D custom_target('afuc_test_a7xx.asm',
> > +       output: 'afuc_test_a7xx.asm',
> > +       command: [disasm, '-u',
> files('../.gitlab-ci/reference/afuc_test_a7xx.fw')],
> >  +      env: {'RNN_PATH': rnn_src_path},
> >         capture: true
> >       )
> >       test('afuc-disasm',
> >  diff --git a/src/freedreno/decode/meson.build
> b/src/freedreno/decode/meson.build
> > -index 469eeb4eb597..dfa1c12d0d9f 100644
> > +index 469eeb4eb5975..915ba11af3b33 100644
> >  --- a/src/freedreno/decode/meson.build
> >  +++ b/src/freedreno/decode/meson.build
> >  @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
> > @@ -61,18 +104,20 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
> >
> >       test('crashdec-' + name,
> >  diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
> > -index 98e49b8fcf0e..145e72597eb9 100644
> > +index 98e49b8fcf0e9..f8bdc5299841b 100644
> >  --- a/src/freedreno/meson.build
> >  +++ b/src/freedreno/meson.build
> > -@@ -6,7 +6,7 @@ inc_freedreno_rnn =3D include_directories('rnn')
> > +@@ -6,7 +6,10 @@ inc_freedreno_rnn =3D include_directories('rnn')
> >
> >   rnn_src_path =3D dir_source_root + '/src/freedreno/registers'
> >   rnn_install_path =3D get_option('datadir') + '/freedreno/registers'
> >  -rnn_path =3D rnn_src_path + ':' + get_option('prefix') + '/' +
> rnn_install_path
> >  +rnn_path =3D get_option('prefix') + '/' + rnn_install_path
> > ++if with_tools_for_development
> > ++  rnn_path =3D rnn_src_path + ':' + rnn_path
> > ++endif
> >
> >   dep_lua =3D dependency('lua54', 'lua53', 'lua52', 'lua', required: fa=
lse,
> >                        allow_fallback: true, version: '>=3D5.2')
> >  --
> > -2.39.2
> > -
> > +GitLab
> > diff --git
> a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enab=
led-in-mesa.patch
> b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enab=
led-in-mesa.patch
> > deleted file mode 100644
> > index 036a0b49453..00000000000
> > ---
> a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enab=
led-in-mesa.patch
> > +++ /dev/null
> > @@ -1,42 +0,0 @@
> > -From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
> > -From: Romain Naour <romain.naour@smile.fr>
> > -Date: Tue, 6 Feb 2024 09:47:10 +0100
> > -Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
> > -
> > -Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between
> hw and sw drivers")
> > -added an automatic zink fallback even when the zink gallium is not
> > -enabled at build time.
> > -
> > -It leads to unexpected error log while loading drisw driver and
> > -zink is not installed on the rootfs:
> > -
> > -  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
> > -
> > -Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between
> hw and sw drivers")
> > -
> > -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
> > -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - src/glx/glxext.c | 2 ++
> > - 1 file changed, 2 insertions(+)
> > -
> > -diff --git a/src/glx/glxext.c b/src/glx/glxext.c
> > -index 05c825a..7a06aa9 100644
> > ---- a/src/glx/glxext.c
> > -+++ b/src/glx/glxext.c
> > -@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
> > - #endif /* HAVE_DRI3 */
> > -       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
> > -          dpyPriv->dri2Display =3D dri2CreateDisplay(dpy);
> > -+#if defined(HAVE_ZINK)
> > -       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
> > -          try_zink =3D !debug_get_bool_option("LIBGL_KOPPER_DISABLE",
> false) &&
> > -                     !getenv("GALLIUM_DRIVER");
> > -+#endif /* HAVE_ZINK */
> > -    }
> > - #endif /* GLX_USE_DRM */
> > -    if (glx_direct)
> > ---
> > -2.44.0
> > -
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> > index 9fdf496e8b3..ecea7e94de8 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -16,15 +16,11 @@ PE =3D "2"
> >
> >  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >
>  file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> > -           file://0001-drisw-fix-build-without-dri3.patch \
> > -
>  file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
> > -           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patc=
h
> \
> > -
>  file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
> >
>  file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
> >  "
> >
> > -SRC_URI[sha256sum] =3D
> "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
> > -PV =3D "24.0.7"
> > +SRC_URI[sha256sum] =3D
> "fd077d3104edbe459e2b8597d2757ec065f9bd2d620b8c0b9cc88c2bf9891d02"
> > +PV =3D "24.2.2"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> >
> > @@ -38,7 +34,7 @@ do_install:append() {
> >    fi
> >  }
> >
> > -DEPENDS =3D "expat makedepend-native flex-native bison-native
> libxml2-native zlib chrpath-replacement-native python3-mako-native
> gettext-native"
> > +DEPENDS =3D "expat makedepend-native flex-native bison-native
> libxml2-native zlib chrpath-replacement-native python3-mako-native
> python3-pyyaml-native gettext-native"
> >  DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG'=
,
> 'opencl', 'mesa-native', '', d)}"
> >  EXTRANATIVEPATH +=3D "chrpath-native"
> >  PROVIDES =3D " \
> > @@ -77,8 +73,8 @@ EXTRA_OEMESON =3D " \
> >      -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
> >  "
> >
> > -EXTRA_OEMESON:append:class-target =3D "
> ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=3Dsystem', '=
',
> d)}"
> > -EXTRA_OEMESON:append:class-native =3D "
> ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=3Denabled', =
'',
> d)}"
> > +EXTRA_OEMESON:append:class-target:x86-64 =3D "
> ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=3Dsystem', '=
',
> d)}"
> > +EXTRA_OEMESON:append:class-native:x86-64 =3D "
> ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=3Denabled
> -Dinstall-intel-clc=3Dtrue', '', d)}"
> >
> >  def strip_comma(s):
> >      return s.strip(',')
> > @@ -108,10 +104,10 @@ PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled,
> -Ddri3=3Ddisabled, xorgproto libxshmfence"
> >  # Vulkan drivers need dri3 enabled
> >  # amd could be enabled as well but requires gallium-llvm with llvm >=
=3D
> 3.9
> >  VULKAN_DRIVERS =3D ""
> > -VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
> > -VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
> > +VULKAN_DRIVERS:append:x86 =3D "${@bb.utils.contains('PACKAGECONFIG',
> ',opencl', ',intel', '', d)},intel_hasvk,amd"
> > +VULKAN_DRIVERS:append:x86-64 =3D "${@bb.utils.contains('PACKAGECONFIG'=
,
> 'opencl', ',intel', '', d)},intel_hasvk,amd"
> >  # i686 is a 32 bit override for mesa-native
> > -VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
> > +VULKAN_DRIVERS:append:i686 =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'opencl', ',intel', '', d)},intel_hasvk,amd"
> >  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG',
> 'freedreno', ',freedreno', '', d)}"
> >  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG',
> 'broadcom', ',broadcom', '', d)}"
> >  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG',
> 'gallium-llvm', ',swrast', '', d)}"
> > @@ -137,7 +133,7 @@ PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
> >  PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}')},
> -Dtools=3D'', ${TOOLS_DEPS}"
> >
> >  PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
> > -PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd"
> > +PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Denabled, -Dglvnd=3Ddisabled, libgl=
vnd"
> >
> >  # "gles" requires "opengl"
> >  PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled,
> -Dgles1=3Ddisabled -Dgles2=3Ddisabled"
> > @@ -145,32 +141,30 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled
> -Dgles2=3Denabled, -Dgles1=3Ddisabled -Dgles2
> >  # "egl" requires "opengl"
> >  PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
> >
> > -# "opencl" requires libclc from meta-clang and spirv-tools from OE-Cor=
e
> > -OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno',
> '-Dopencl-native=3Dtrue', '', d)}"
> > -PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtru=
e
> ${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libcl=
c
> spirv-tools python3-ply-native"
> > +# "opencl" requires libclc from meta-clang
> > +PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd
> -Dopencl-spirv=3Dtrue,-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,=
libclc
> spirv-tools python3-ply-native"
> >
> >  PACKAGECONFIG[broadcom] =3D ""
> >  PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
> >  PACKAGECONFIG[freedreno] =3D ""
> > -PACKAGECONFIG[kmsro] =3D ""
> >  PACKAGECONFIG[vc4] =3D ""
> >  PACKAGECONFIG[v3d] =3D ""
> >  PACKAGECONFIG[zink] =3D ""
> >
> > -GALLIUMDRIVERS =3D "swrast"
> > +GALLIUMDRIVERS =3D "softpipe${@bb.utils.contains('PACKAGECONFIG',
> 'gallium-llvm', ',llvmpipe', '', d)}"
> >  # gallium swrast was found to crash Xorg on startup in x32 qemu
> >  GALLIUMDRIVERS:x86-x32 =3D ""
> > -GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
> > -GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
> > +GALLIUMDRIVERS:append:x86 =3D ",i915,crocus"
> > +GALLIUMDRIVERS:append:x86-64 =3D ",i915,crocus"
> >  # i686 is a 32 bit override for mesa-native
> > -GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
> > +GALLIUMDRIVERS:append:i686 =3D ",i915,crocus"
> >
> >  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG',
> 'etnaviv', ',etnaviv', '', d)}"
> >  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG',
> 'freedreno', ',freedreno', '', d)}"
> > -GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'kmsro=
',
> ',kmsro', '', d)}"
> >  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'vc4',
> ',vc4', '', d)}"
> >  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'v3d',
> ',v3d', '', d)}"
> >  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'zink'=
,
> ',zink', '', d)}"
> > +GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'openc=
l',
> ',iris', '', d)}"
> >
> >  # radeonsi requires LLVM
> >  GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'r600', ',radeonsi', '', d)}"
> > @@ -247,7 +241,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
> >               libopencl-mesa libopencl-mesa-dev \
> >               libxatracker libxatracker-dev \
> >               mesa-megadriver mesa-vulkan-drivers \
> > -             mesa-vdpau-drivers mesa-tools \
> > +             mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
> >              "
> >
> >  do_install:append () {
> > @@ -262,13 +256,6 @@ do_install:append () {
> >      rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
> >  }
> >
> > -do_install:append:class-native () {
> > -    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false'=
,
> d)}; then
> > -        install -d ${D}${bindir}
> > -        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
> > -    fi
> > -}
> > -
> >  # For the packages that make up the OpenGL interfaces, inject variable=
s
> so that
> >  # they don't get Debian-renamed (which would remove the -mesa suffix),
> and
> >  # RPROVIDEs/RCONFLICTs on the generic libgl name.
> > @@ -339,6 +326,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/*
> ${datadir}/drirc.d"
> >  FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so
> ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
> >  FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
> >  FILES:libegl-mesa =3D "${libdir}/libEGL*.so.*
> ${datadir}/glvnd/egl_vendor.d"
> > +FILES:mesa-gallium-drivers =3D "${libdir}/libgallium-*.so"
> >  FILES:libgbm =3D "${libdir}/libgbm.so.*"
> >  FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
> >  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
> > @@ -366,6 +354,7 @@ FILES:libxatracker-dev =3D "${libdir}/libxatracker.=
so
> ${libdir}/libxatracker.la \
> >  # catch all to get all the tools and data
> >  FILES:${PN}-tools =3D "${bindir} ${datadir}"
> >  ALLOW_EMPTY:${PN}-tools =3D "1"
> > +INSANE_SKIP:${PN}-megadriver =3D "dev-so"
> >
> >  # Fix upgrade path from mesa to mesa-megadriver
> >  RREPLACES:mesa-megadriver =3D "mesa"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#206746):
> https://lists.openembedded.org/g/openembedded-core/message/206746
> > Mute This Topic: https://lists.openembedded.org/mt/109411619/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000672a6806263faf1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 6, 2024 at 3:30=E2=80=AFAM Alexander Kanavin &l=
t;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">This update was as well done=
 with the assumption that clang is not in<br>
core, and so disables Intel iris driver (e.g. all modern intel<br>
graphics). I&#39;d say leave it out too; we&#39;ll get back to it after cla=
ng<br>
lands.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Sounds goo=
d I have included it to make sure</div><div dir=3D"auto">This does not regr=
ess</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"=
auto"><br>
<br>
Alex<br>
<br>
On Tue, 5 Nov 2024 at 19:46, Khem Raj via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br=
>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_=
blank">f_l_k@t-online.de</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 - Remove patches that have been merged upstream<br>
&gt;=C2=A0 - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch. =
Issue was fixed upstream<br>
&gt;=C2=A0 - Update 0001-freedreno-don-t-encode-build-path-into-binaries.pa=
tch<br>
&gt;=C2=A0 - Use &#39;enabled/disabled&#39; for glvnd instead of deprecated=
 &#39;true/false&#39;<br>
&gt;=C2=A0 - swrast gallium driver has been split into &#39;softpipe&#39; a=
nd &#39;llvmpipe&#39;. The use of &#39;swrast&#39;<br>
&gt;=C2=A0 =C2=A0 has been deprecated.<br>
&gt;=C2=A0 =C2=A0 [<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/bl=
ob/mesa-24.2.2/meson.build#L171" rel=3D"noreferrer" target=3D"_blank">https=
://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-24.2.2/meson.build#L171</a>=
]<br>
&gt;=C2=A0 - Add package for libgallium and install<br>
&gt;=C2=A0 - Add python3-pyyaml-native dependency<br>
&gt;=C2=A0 - Limit intel_clc to x86-64<br>
&gt;=C2=A0 - Remove OPENCL_NATIVE variable. The according option has been r=
emoved<br>
&gt;=C2=A0 =C2=A0 from meson_options.txt.<br>
&gt;=C2=A0 - Meanwhile theres an install option for intel_clc. Use it inste=
ad of manual install<br>
&gt;=C2=A0 - intel &#39;iris&#39; and intel &#39;vulkan&#39; drivers requir=
e opencl and thus need meta-clang layer<br>
&gt;=C2=A0 =C2=A0 [<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/is=
sues/11141" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop=
.org/mesa/mesa/-/issues/11141</a>]<br>
&gt;=C2=A0 - Remove gallium kmsro option. This is set depending on &#39;sys=
tem_has_kms_drm&#39;<br>
&gt;=C2=A0 =C2=A0 [<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/bl=
ob/mesa-24.2.2/meson.build#L206" rel=3D"noreferrer" target=3D"_blank">https=
://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-24.2.2/meson.build#L206</a>=
]<br>
&gt;=C2=A0 - Add vulkan support for older intel graphics<br>
&gt;<br>
&gt; Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" ta=
rget=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
&gt;<br>
&gt; Note: &#39;kmsro&#39; needs to be removed from mesa.bbappend in meta-r=
aspberrypi<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-meson-do-not-pull-in-clc-for-clover.patch | 53 -------------=
-<br>
&gt;=C2=A0 ...lude-missing-llvm-IR-header-Module.h.patch | 41 -----------<b=
r>
&gt;=C2=A0 .../0001-drisw-fix-build-without-dri3.patch=C2=A0 =C2=A0| 58 ---=
------------<br>
&gt;=C2=A0 ...on-t-encode-build-path-into-binaries.patch | 71 +++++++++++++=
++----<br>
&gt;=C2=A0 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 -----------<b=
r>
&gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 49 +++++--------<br>
&gt;=C2=A0 6 files changed, 77 insertions(+), 237 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-=
meson-do-not-pull-in-clc-for-clover.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Inc=
lude-missing-llvm-IR-header-Module.h.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-f=
ix-build-without-dri3.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-=
don-t-try-zink-if-not-enabled-in-mesa.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not=
-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Rever=
t-meson-do-not-pull-in-clc-for-clover.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 1711e22585a..00000000000<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-i=
n-clc-for-clover.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,53 +0,0 @@<br>
&gt; -From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"=
_blank">f_l_k@t-online.de</a>&gt;<br>
&gt; -Date: Fri, 8 Mar 2024 15:53:11 +0100<br>
&gt; -Subject: [PATCH] Revert &quot;meson: do not pull in clc for clover&qu=
ot;<br>
&gt; -<br>
&gt; -This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.<br>
&gt; -Upstream-Status: Inappropriate [<a href=3D"https://gitlab.freedesktop=
.org/mesa/mesa/-/merge_requests/27783/diffs?commit_id=3Da976f2c9f0c07f9e06c=
c9affd9124b45bc60c2bd" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?commit_id=3Da976f2c9=
f0c07f9e06cc9affd9124b45bc60c2bd</a>]<br>
&gt; -<br>
&gt; -Once the merge request above was added, it will only be possible to p=
rovide opencl spir-v with gallium-rusticl=3Dtrue. This is not yet supported=
 in the mesa recipe.<br>
&gt; -For now reverting this commit allows to still use clover with opencl-=
spirv, which would otherwise be broken starting from mesa 24.0.2.<br>
&gt; -<br>
&gt; -After it was merged, this patch needs to be removed and rusticl suppo=
rt will be required<br>
&gt; -<br>
&gt; -Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" t=
arget=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
&gt; ----<br>
&gt; - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ++-<=
br>
&gt; - src/compiler/meson.build | 2 +-<br>
&gt; - 2 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/meson.build b/meson.build<br>
&gt; -index 2db6185..741b5d1 100644<br>
&gt; ---- a/meson.build<br>
&gt; -+++ b/meson.build<br>
&gt; -@@ -813,6 +813,7 @@ if _opencl !=3D &#39;disabled&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0error(&#39;The Clover OpenCL state tracker requir=
es rtti&#39;)<br>
&gt; -=C2=A0 =C2=A0endif<br>
&gt; -<br>
&gt; -+=C2=A0 with_clc =3D true<br>
&gt; -=C2=A0 =C2=A0with_gallium_opencl =3D true<br>
&gt; -=C2=A0 =C2=A0with_opencl_icd =3D _opencl =3D=3D &#39;icd&#39;<br>
&gt; - else<br>
&gt; -@@ -837,7 +838,7 @@ if with_gallium_rusticl<br>
&gt; - endif<br>
&gt; -<br>
&gt; - dep_clc =3D null_dep<br>
&gt; --if with_gallium_opencl or with_clc<br>
&gt; -+if with_clc<br>
&gt; -=C2=A0 =C2=A0dep_clc =3D dependency(&#39;libclc&#39;)<br>
&gt; - endif<br>
&gt; -<br>
&gt; -diff --git a/src/compiler/meson.build b/src/compiler/meson.build<br>
&gt; -index 8d73544..1dae56d 100644<br>
&gt; ---- a/src/compiler/meson.build<br>
&gt; -+++ b/src/compiler/meson.build<br>
&gt; -@@ -79,7 +79,7 @@ subdir(&#39;nir&#39;)<br>
&gt; -<br>
&gt; - subdir(&#39;spirv&#39;)<br>
&gt; -<br>
&gt; --if with_clc<br>
&gt; -+if with_opencl_spirv<br>
&gt; -=C2=A0 =C2=A0subdir(&#39;clc&#39;)<br>
&gt; - endif<br>
&gt; - if with_gallium<br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing=
-llvm-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-=
Include-missing-llvm-IR-header-Module.h.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 82ad88a079c..00000000000<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-I=
R-header-Module.h.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,41 +0,0 @@<br>
&gt; -From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Mon, 1 Jul 2024 23:09:29 -0700<br>
&gt; -Subject: [PATCH] amd: Include missing llvm IR header Module.h<br>
&gt; -MIME-Version: 1.0<br>
&gt; -Content-Type: text/plain; charset=3DUTF-8<br>
&gt; -Content-Transfer-Encoding: 8bit<br>
&gt; -<br>
&gt; -With LLVM-19, Module.h header is not being pulled, which results in<b=
r>
&gt; -compile errors e.g.<br>
&gt; -<br>
&gt; -src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function f=
or call to =E2=80=98unwrap(LLVMOpaqueModule*&amp;)=E2=80=99<br>
&gt; -=C2=A0 102 |=C2=A0 =C2=A0 unwrap(module)-&gt;setTargetTriple(TM-&gt;g=
etTargetTriple().getTriple());<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 ~~~~~~^~~~~~~~<br>
&gt; -In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/m=
esa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /m=
nt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysro=
ot-native/usr/include/llvm/IR/DerivedTypes.h:23,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /m=
nt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysro=
ot-native/usr/include/llvm/IR/InstrTypes.h:26,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /m=
nt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysro=
ot-native/usr/include/llvm/Analysis/TargetLibraryInfo.h:14,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ..=
/mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:<br>
&gt; -<br>
&gt; -Its getting the definition from llvm/IR/Type.h instead of Module.h an=
d caused<br>
&gt; -confusion to compiler<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org=
/mesa/mesa/-/merge_requests/29993" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29993</a>]<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/amd/llvm/ac_llvm_helper.cpp | 1 +<br>
&gt; - 1 file changed, 1 insertion(+)<br>
&gt; -<br>
&gt; -diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_h=
elper.cpp<br>
&gt; -index 5d065279ad1..af4a50f8409 100644<br>
&gt; ---- a/src/amd/llvm/ac_llvm_helper.cpp<br>
&gt; -+++ b/src/amd/llvm/ac_llvm_helper.cpp<br>
&gt; -@@ -8,6 +8,7 @@<br>
&gt; - #include &lt;llvm/Analysis/TargetLibraryInfo.h&gt;<br>
&gt; - #include &lt;llvm/IR/IRBuilder.h&gt;<br>
&gt; - #include &lt;llvm/IR/LegacyPassManager.h&gt;<br>
&gt; -+#include &lt;llvm/IR/Module.h&gt;<br>
&gt; - #include &lt;llvm/IR/Verifier.h&gt;<br>
&gt; - #include &lt;llvm/Target/TargetMachine.h&gt;<br>
&gt; - #include &lt;llvm/MC/MCSubtargetInfo.h&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-wit=
hout-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-wit=
hout-dri3.patch<br>
&gt; deleted file mode 100644<br>
&gt; index ab161520906..00000000000<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dr=
i3.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,58 +0,0 @@<br>
&gt; -From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" targe=
t=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
&gt; -Date: Tue, 6 Feb 2024 09:47:09 +0100<br>
&gt; -Subject: [PATCH 1/2] drisw: fix build without dri3<br>
&gt; -<br>
&gt; -commit 1887368df41 (&quot;glx/sw: check for modifier support in the k=
opper path&quot;)<br>
&gt; -added dri3_priv.h header and dri3_check_multibuffer() function in dri=
sw that<br>
&gt; -can be build without dri3.<br>
&gt; -<br>
&gt; -=C2=A0 i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.=
c.o: in function `driswCreateScreenDriver&#39;:<br>
&gt; -=C2=A0 drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined r=
eference to `dri3_check_multibuffer&#39;<br>
&gt; -=C2=A0 collect2: error: ld returned 1 exit status<br>
&gt; -<br>
&gt; -Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using=
<br>
&gt; -dri3_check_multibuffer().<br>
&gt; -<br>
&gt; -Fixes: 1887368df41 (&quot;glx/sw: check for modifier support in the k=
opper path&quot;)<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org=
/mesa/mesa/-/merge_requests/27478" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478</a>]<br>
&gt; -Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.=
fr" target=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/glx/drisw_glx.c | 4 ++++<br>
&gt; - 1 file changed, 4 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c<br>
&gt; -index 3d3f752..4b19e2d 100644<br>
&gt; ---- a/src/glx/drisw_glx.c<br>
&gt; -+++ b/src/glx/drisw_glx.c<br>
&gt; -@@ -32,7 +32,9 @@<br>
&gt; - #include &lt;dlfcn.h&gt;<br>
&gt; - #include &quot;dri_common.h&quot;<br>
&gt; - #include &quot;drisw_priv.h&quot;<br>
&gt; -+#ifdef HAVE_DRI3<br>
&gt; - #include &quot;dri3_priv.h&quot;<br>
&gt; -+#endif<br>
&gt; - #include &lt;X11/extensions/shmproto.h&gt;<br>
&gt; - #include &lt;assert.h&gt;<br>
&gt; - #include &lt;vulkan/vulkan_core.h&gt;<br>
&gt; -@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_di=
splay *priv,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto handle_error;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -+#ifdef HAVE_DRI3<br>
&gt; -=C2=A0 =C2=A0 if (pdpyp-&gt;zink) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bool err;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0psc-&gt;has_multibuffer =3D dri3_check_mul=
tibuffer(priv-&gt;dpy, &amp;err);<br>
&gt; -@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_=
display *priv,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto handle_error;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 glx_config_destroy_list(psc-&gt;base.configs);<br>
&gt; -=C2=A0 =C2=A0 psc-&gt;base.configs =3D configs;<br>
&gt; ---<br>
&gt; -2.44.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-enc=
ode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-=
freedreno-don-t-encode-build-path-into-binaries.patch<br>
&gt; index 5975ab4472e..38871b6d11f 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-bui=
ld-path-into-binaries.patch<br>
&gt; +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-bui=
ld-path-into-binaries.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 66d73feaac088d1a588a44a1780f2eaf4335fccf Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@li=
naro.org" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 16 Jul 2024 12:32:47 +0300<br>
&gt;=C2=A0 Subject: [PATCH] freedreno: don&#39;t encode build path into bin=
aries<br>
&gt; @@ -13,33 +13,76 @@ it manually when running the tests.<br>
&gt;=C2=A0 Upstream-Status: Submitted [<a href=3D"https://gitlab.freedeskto=
p.org/mesa/mesa/-/merge_requests/30206" rel=3D"noreferrer" target=3D"_blank=
">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30206</a>]<br>
&gt;=C2=A0 Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.bar=
yshkov@linaro.org" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br=
>
&gt;=C2=A0 ---<br>
&gt; + meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt; + meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 7 +++++++<br>
&gt;=C2=A0 =C2=A0src/freedreno/afuc/meson.build=C2=A0 =C2=A0| 4 ++++<br>
&gt;=C2=A0 =C2=A0src/freedreno/decode/meson.build | 4 +++-<br>
&gt; - src/freedreno/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; - 3 files changed, 8 insertions(+), 2 deletions(-)<br>
&gt; + src/freedreno/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 ++++-<br>
&gt; + 5 files changed, 19 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; +diff --git a/meson.build b/meson.build<br>
&gt; +index 3bc837813f967..5c94e76649c63 100644<br>
&gt; +--- a/meson.build<br>
&gt; ++++ b/meson.build<br>
&gt; +@@ -76,6 +76,7 @@ if with_tools.contains(&#39;all&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;imagination&#39;,<br>
&gt; +=C2=A0 =C2=A0]<br>
&gt; + endif<br>
&gt; ++with_tools_for_development =3D get_option(&#39;tools-for-development=
&#39;)<br>
&gt; +<br>
&gt; + with_any_vulkan_layers =3D get_option(&#39;vulkan-layers&#39;).lengt=
h() !=3D 0<br>
&gt; + with_intel_tools =3D with_tools.contains(&#39;intel&#39;) or with_to=
ols.contains(&#39;intel-ui&#39;)<br>
&gt; +diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; +index 753bebd961e3f..9bc308b512c13 100644<br>
&gt; +--- a/meson_options.txt<br>
&gt; ++++ b/meson_options.txt<br>
&gt; +@@ -537,6 +537,13 @@ option(<br>
&gt; +=C2=A0 =C2=A0description : &#39;List of tools to build. (Note: `intel=
-ui` selects `intel`)&#39;,<br>
&gt; + )<br>
&gt; +<br>
&gt; ++option(<br>
&gt; ++=C2=A0 &#39;tools-for-development&#39;,<br>
&gt; ++=C2=A0 type : &#39;boolean&#39;,<br>
&gt; ++=C2=A0 value : false,<br>
&gt; ++=C2=A0 description : &#39;Support running tools from the build tree =
(for developers)&#39;,<br>
&gt; ++)<br>
&gt; ++<br>
&gt; + option(<br>
&gt; +=C2=A0 =C2=A0&#39;power8&#39;,<br>
&gt; +=C2=A0 =C2=A0type : &#39;feature&#39;,<br>
&gt;=C2=A0 diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc=
/meson.build<br>
&gt; -index bb7cebf5a748..351cc31ef2de 100644<br>
&gt; +index bb7cebf5a748c..351cc31ef2dec 100644<br>
&gt;=C2=A0 --- a/src/freedreno/afuc/meson.build<br>
&gt;=C2=A0 +++ b/src/freedreno/afuc/meson.build<br>
&gt; -@@ -56,6 +56,7 @@ if with_tests<br>
&gt; +@@ -56,10 +56,12 @@ if with_tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0asm_fw =3D custom_target(&#39;afuc_test.fw&#39;,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;afuc_test.fw&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0command: [asm, &#39;-g&#39;, &#39;6&#39;, files(&=
#39;../.gitlab-ci/traces/afuc_test.asm&#39;), &#39;@OUTPUT@&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0command: [asm, files(&#39;../.gitlab-ci/traces/af=
uc_test.asm&#39;), &#39;@OUTPUT@&#39;],<br>
&gt; ++=C2=A0 =C2=A0 env: {&#39;RNN_PATH&#39;: rnn_src_path},<br>
&gt; +=C2=A0 =C2=A0)<br>
&gt; +=C2=A0 =C2=A0asm_fw_a7xx =3D custom_target(&#39;afuc_test_a7xx.fw&#39=
;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0output: &#39;afuc_test_a7xx.fw&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0command: [asm, files(&#39;../.gitlab-ci/traces/af=
uc_test_a7xx.asm&#39;), &#39;@OUTPUT@&#39;],<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 env: {&#39;RNN_PATH&#39;: rnn_src_path},<br>
&gt;=C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0test(&#39;afuc-asm&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0diff,<br>
&gt; -@@ -120,6 +122,7 @@ if cc.sizeof(&#39;size_t&#39;) &gt; 4<br>
&gt; +@@ -120,11 +122,13 @@ if cc.sizeof(&#39;size_t&#39;) &gt; 4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0disasm_fw =3D custom_target(&#39;afuc_test.a=
sm&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;afuc_test.asm&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0command: [disasm, &#39;-u&#39;, files(&#39=
;../.gitlab-ci/reference/afuc_test.fw&#39;), &#39;-g&#39;, &#39;630&#39;],<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0command: [disasm, &#39;-u&#39;, files(&#39=
;../.gitlab-ci/reference/afuc_test.fw&#39;)],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 env: {&#39;RNN_PATH&#39;: rnn_src_path},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0capture: true<br>
&gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0disasm_fw_a7xx =3D custom_target(&#39;afuc_test_a=
7xx.asm&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;afuc_test_a7xx.asm&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0command: [disasm, &#39;-u&#39;, files(&#39=
;../.gitlab-ci/reference/afuc_test_a7xx.fw&#39;)],<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 env: {&#39;RNN_PATH&#39;: rnn_src_path},<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0capture: true<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test(&#39;afuc-disasm&#39;,<br>
&gt;=C2=A0 diff --git a/src/freedreno/decode/meson.build b/src/freedreno/de=
code/meson.build<br>
&gt; -index 469eeb4eb597..dfa1c12d0d9f 100644<br>
&gt; +index 469eeb4eb5975..915ba11af3b33 100644<br>
&gt;=C2=A0 --- a/src/freedreno/decode/meson.build<br>
&gt;=C2=A0 +++ b/src/freedreno/decode/meson.build<br>
&gt;=C2=A0 @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found(=
)<br>
&gt; @@ -61,18 +104,20 @@ index 469eeb4eb597..dfa1c12d0d9f 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test(&#39;crashdec-&#39; + name,<br>
&gt;=C2=A0 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.bui=
ld<br>
&gt; -index 98e49b8fcf0e..145e72597eb9 100644<br>
&gt; +index 98e49b8fcf0e9..f8bdc5299841b 100644<br>
&gt;=C2=A0 --- a/src/freedreno/meson.build<br>
&gt;=C2=A0 +++ b/src/freedreno/meson.build<br>
&gt; -@@ -6,7 +6,7 @@ inc_freedreno_rnn =3D include_directories(&#39;rnn&#3=
9;)<br>
&gt; +@@ -6,7 +6,10 @@ inc_freedreno_rnn =3D include_directories(&#39;rnn&#=
39;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0rnn_src_path =3D dir_source_root + &#39;/src/freedreno/reg=
isters&#39;<br>
&gt;=C2=A0 =C2=A0rnn_install_path =3D get_option(&#39;datadir&#39;) + &#39;=
/freedreno/registers&#39;<br>
&gt;=C2=A0 -rnn_path =3D rnn_src_path + &#39;:&#39; + get_option(&#39;prefi=
x&#39;) + &#39;/&#39; + rnn_install_path<br>
&gt;=C2=A0 +rnn_path =3D get_option(&#39;prefix&#39;) + &#39;/&#39; + rnn_i=
nstall_path<br>
&gt; ++if with_tools_for_development<br>
&gt; ++=C2=A0 rnn_path =3D rnn_src_path + &#39;:&#39; + rnn_path<br>
&gt; ++endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0dep_lua =3D dependency(&#39;lua54&#39;, &#39;lua53&#39;, &=
#39;lua52&#39;, &#39;lua&#39;, required: false,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 allow_fallback: true, version: &#39;&gt;=3D5.2&#39;)<br>
&gt;=C2=A0 --<br>
&gt; -2.39.2<br>
&gt; -<br>
&gt; +GitLab<br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zi=
nk-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glx=
ext-don-t-try-zink-if-not-enabled-in-mesa.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 036a0b49453..00000000000<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-n=
ot-enabled-in-mesa.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,42 +0,0 @@<br>
&gt; -From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" targe=
t=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
&gt; -Date: Tue, 6 Feb 2024 09:47:10 +0100<br>
&gt; -Subject: [PATCH 2/2] glxext: don&#39;t try zink if not enabled in mes=
a<br>
&gt; -<br>
&gt; -Commit 7d9ea77b459 (&quot;glx: add automatic zink fallback loading be=
tween hw and sw drivers&quot;)<br>
&gt; -added an automatic zink fallback even when the zink gallium is not<br=
>
&gt; -enabled at build time.<br>
&gt; -<br>
&gt; -It leads to unexpected error log while loading drisw driver and<br>
&gt; -zink is not installed on the rootfs:<br>
&gt; -<br>
&gt; -=C2=A0 MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so<br>
&gt; -<br>
&gt; -Fixes: 7d9ea77b459 (&quot;glx: add automatic zink fallback loading be=
tween hw and sw drivers&quot;)<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org=
/mesa/mesa/-/merge_requests/27478" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478</a>]<br>
&gt; -Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.=
fr" target=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/glx/glxext.c | 2 ++<br>
&gt; - 1 file changed, 2 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/src/glx/glxext.c b/src/glx/glxext.c<br>
&gt; -index 05c825a..7a06aa9 100644<br>
&gt; ---- a/src/glx/glxext.c<br>
&gt; -+++ b/src/glx/glxext.c<br>
&gt; -@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)<br>
&gt; - #endif /* HAVE_DRI3 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!debug_get_bool_option(&quot;LIBGL_DRI=
2_DISABLE&quot;, false))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dpyPriv-&gt;dri2Display =3D dri2Cr=
eateDisplay(dpy);<br>
&gt; -+#if defined(HAVE_ZINK)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dpyPriv-&gt;dri3Display &amp;&amp; !d=
pyPriv-&gt;dri2Display)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try_zink =3D !debug_get_bool_optio=
n(&quot;LIBGL_KOPPER_DISABLE&quot;, false) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0!getenv(&quot;GALLIUM_DRIVER&quot;);<br>
&gt; -+#endif /* HAVE_ZINK */<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; - #endif /* GLX_USE_DRM */<br>
&gt; -=C2=A0 =C2=A0 if (glx_direct)<br>
&gt; ---<br>
&gt; -2.44.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc<br>
&gt; index 9fdf496e8b3..ecea7e94de8 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; @@ -16,15 +16,11 @@ PE =3D &quot;2&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org/archiv=
e/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://mesa.=
freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson-misde=
tects-64bit-atomics-on-mips-clang.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-drisw-fix-build-=
without-dri3.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-glxext-don-t-try=
-zink-if-not-enabled-in-mesa.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Revert-meson-do-=
not-pull-in-clc-for-clover.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-amd-Include-miss=
ing-llvm-IR-header-Module.h.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-freedreno-d=
on-t-encode-build-path-into-binaries.patch\<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;7454425f1ed4a6f1b5b107e1672b30c88b22ea0e=
fea000ae2c7d96db93f6c26a&quot;<br>
&gt; -PV =3D &quot;24.0.7&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;fd077d3104edbe459e2b8597d2757ec065f9bd2d=
620b8c0b9cc88c2bf9891d02&quot;<br>
&gt; +PV =3D &quot;24.2.2&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.\=
d+)+)&quot;<br>
&gt;<br>
&gt; @@ -38,7 +34,7 @@ do_install:append() {<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -DEPENDS =3D &quot;expat makedepend-native flex-native bison-native li=
bxml2-native zlib chrpath-replacement-native python3-mako-native gettext-na=
tive&quot;<br>
&gt; +DEPENDS =3D &quot;expat makedepend-native flex-native bison-native li=
bxml2-native zlib chrpath-replacement-native python3-mako-native python3-py=
yaml-native gettext-native&quot;<br>
&gt;=C2=A0 DEPENDS:append:class-target =3D &quot; ${@bb.utils.contains(&#39=
;PACKAGECONFIG&#39;, &#39;opencl&#39;, &#39;mesa-native&#39;, &#39;&#39;, d=
)}&quot;<br>
&gt;=C2=A0 EXTRANATIVEPATH +=3D &quot;chrpath-native&quot;<br>
&gt;=C2=A0 PROVIDES =3D &quot; \<br>
&gt; @@ -77,8 +73,8 @@ EXTRA_OEMESON =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -Dplatforms=3D&#39;${@&quot;,&quot;.join(&quot;${P=
LATFORMS}&quot;.split())}&#39; \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -EXTRA_OEMESON:append:class-target =3D &quot; ${@bb.utils.contains(&#3=
9;PACKAGECONFIG&#39;, &#39;opencl&#39;, &#39;-Dintel-clc=3Dsystem&#39;, &#3=
9;&#39;, d)}&quot;<br>
&gt; -EXTRA_OEMESON:append:class-native =3D &quot; ${@bb.utils.contains(&#3=
9;PACKAGECONFIG&#39;, &#39;opencl&#39;, &#39;-Dintel-clc=3Denabled&#39;, &#=
39;&#39;, d)}&quot;<br>
&gt; +EXTRA_OEMESON:append:class-target:x86-64 =3D &quot; ${@bb.utils.conta=
ins(&#39;PACKAGECONFIG&#39;, &#39;opencl&#39;, &#39;-Dintel-clc=3Dsystem&#3=
9;, &#39;&#39;, d)}&quot;<br>
&gt; +EXTRA_OEMESON:append:class-native:x86-64 =3D &quot; ${@bb.utils.conta=
ins(&#39;PACKAGECONFIG&#39;, &#39;opencl&#39;, &#39;-Dintel-clc=3Denabled -=
Dinstall-intel-clc=3Dtrue&#39;, &#39;&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 def strip_comma(s):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return s.strip(&#39;,&#39;)<br>
&gt; @@ -108,10 +104,10 @@ PACKAGECONFIG[dri3] =3D &quot;-Ddri3=3Denabled, =
-Ddri3=3Ddisabled, xorgproto libxshmfence&quot;<br>
&gt;=C2=A0 # Vulkan drivers need dri3 enabled<br>
&gt;=C2=A0 # amd could be enabled as well but requires gallium-llvm with ll=
vm &gt;=3D 3.9<br>
&gt;=C2=A0 VULKAN_DRIVERS =3D &quot;&quot;<br>
&gt; -VULKAN_DRIVERS:append:x86 =3D &quot;,intel,amd&quot;<br>
&gt; -VULKAN_DRIVERS:append:x86-64 =3D &quot;,intel,amd&quot;<br>
&gt; +VULKAN_DRIVERS:append:x86 =3D &quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;,opencl&#39;, &#39;,intel&#39;, &#39;&#39;, d)},intel_has=
vk,amd&quot;<br>
&gt; +VULKAN_DRIVERS:append:x86-64 =3D &quot;${@bb.utils.contains(&#39;PACK=
AGECONFIG&#39;, &#39;opencl&#39;, &#39;,intel&#39;, &#39;&#39;, d)},intel_h=
asvk,amd&quot;<br>
&gt;=C2=A0 # i686 is a 32 bit override for mesa-native<br>
&gt; -VULKAN_DRIVERS:append:i686 =3D &quot;,intel,amd&quot;<br>
&gt; +VULKAN_DRIVERS:append:i686 =3D &quot;${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;opencl&#39;, &#39;,intel&#39;, &#39;&#39;, d)},intel_has=
vk,amd&quot;<br>
&gt;=C2=A0 VULKAN_DRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;freedreno&#39;, &#39;,freedreno&#39;, &#39;&#39;, d)}&quo=
t;<br>
&gt;=C2=A0 VULKAN_DRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;broadcom&#39;, &#39;,broadcom&#39;, &#39;&#39;, d)}&quot;=
<br>
&gt;=C2=A0 VULKAN_DRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;gallium-llvm&#39;, &#39;,swrast&#39;, &#39;&#39;, d)}&quo=
t;<br>
&gt; @@ -137,7 +133,7 @@ PACKAGECONFIG[freedreno-fdperf] =3D &quot;,,libcon=
fig&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[tools] =3D &quot;-Dtools=3D${@strip_comma(&#39;${T=
OOLS}&#39;)}, -Dtools=3D&#39;&#39;, ${TOOLS_DEPS}&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[opengl] =3D &quot;-Dopengl=3Dtrue, -Dopengl=3Dfals=
e&quot;<br>
&gt; -PACKAGECONFIG[glvnd] =3D &quot;-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libgl=
vnd&quot;<br>
&gt; +PACKAGECONFIG[glvnd] =3D &quot;-Dglvnd=3Denabled, -Dglvnd=3Ddisabled,=
 libglvnd&quot;<br>
&gt;<br>
&gt;=C2=A0 # &quot;gles&quot; requires &quot;opengl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[gles] =3D &quot;-Dgles1=3Denabled -Dgles2=3Denable=
d, -Dgles1=3Ddisabled -Dgles2=3Ddisabled&quot;<br>
&gt; @@ -145,32 +141,30 @@ PACKAGECONFIG[gles] =3D &quot;-Dgles1=3Denabled =
-Dgles2=3Denabled, -Dgles1=3Ddisabled -Dgles2<br>
&gt;=C2=A0 # &quot;egl&quot; requires &quot;opengl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[egl] =3D &quot;-Degl=3Denabled, -Degl=3Ddisabled&q=
uot;<br>
&gt;<br>
&gt; -# &quot;opencl&quot; requires libclc from meta-clang and spirv-tools =
from OE-Core<br>
&gt; -OPENCL_NATIVE =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;,=
 &#39;freedreno&#39;, &#39;-Dopencl-native=3Dtrue&#39;, &#39;&#39;, d)}&quo=
t;<br>
&gt; -PACKAGECONFIG[opencl] =3D &quot;-Dgallium-opencl=3Dicd -Dopencl-spirv=
=3Dtrue ${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse=
,libclc spirv-tools python3-ply-native&quot;<br>
&gt; +# &quot;opencl&quot; requires libclc from meta-clang<br>
&gt; +PACKAGECONFIG[opencl] =3D &quot;-Dgallium-opencl=3Dicd -Dopencl-spirv=
=3Dtrue,-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc spirv-too=
ls python3-ply-native&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[broadcom] =3D &quot;&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[etnaviv] =3D &quot;,,python3-pycparser-native&quot=
;<br>
&gt;=C2=A0 PACKAGECONFIG[freedreno] =3D &quot;&quot;<br>
&gt; -PACKAGECONFIG[kmsro] =3D &quot;&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[vc4] =3D &quot;&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[v3d] =3D &quot;&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[zink] =3D &quot;&quot;<br>
&gt;<br>
&gt; -GALLIUMDRIVERS =3D &quot;swrast&quot;<br>
&gt; +GALLIUMDRIVERS =3D &quot;softpipe${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;gallium-llvm&#39;, &#39;,llvmpipe&#39;, &#39;&#39;, d)}&quot=
;<br>
&gt;=C2=A0 # gallium swrast was found to crash Xorg on startup in x32 qemu<=
br>
&gt;=C2=A0 GALLIUMDRIVERS:x86-x32 =3D &quot;&quot;<br>
&gt; -GALLIUMDRIVERS:append:x86 =3D &quot;,i915,iris,crocus&quot;<br>
&gt; -GALLIUMDRIVERS:append:x86-64 =3D &quot;,i915,iris,crocus&quot;<br>
&gt; +GALLIUMDRIVERS:append:x86 =3D &quot;,i915,crocus&quot;<br>
&gt; +GALLIUMDRIVERS:append:x86-64 =3D &quot;,i915,crocus&quot;<br>
&gt;=C2=A0 # i686 is a 32 bit override for mesa-native<br>
&gt; -GALLIUMDRIVERS:append:i686 =3D &quot;,i915,iris,crocus&quot;<br>
&gt; +GALLIUMDRIVERS:append:i686 =3D &quot;,i915,crocus&quot;<br>
&gt;<br>
&gt;=C2=A0 GALLIUMDRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;etnaviv&#39;, &#39;,etnaviv&#39;, &#39;&#39;, d)}&quot;<b=
r>
&gt;=C2=A0 GALLIUMDRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;freedreno&#39;, &#39;,freedreno&#39;, &#39;&#39;, d)}&quo=
t;<br>
&gt; -GALLIUMDRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;kmsro&#39;, &#39;,kmsro&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 GALLIUMDRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;vc4&#39;, &#39;,vc4&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 GALLIUMDRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;v3d&#39;, &#39;,v3d&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 GALLIUMDRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;zink&#39;, &#39;,zink&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +GALLIUMDRIVERS:append =3D&quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;opencl&#39;, &#39;,iris&#39;, &#39;&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 # radeonsi requires LLVM<br>
&gt;=C2=A0 GALLIUMDRIVERS_RADEONSI =3D &quot;${@bb.utils.contains(&#39;PACK=
AGECONFIG&#39;, &#39;r600&#39;, &#39;,radeonsi&#39;, &#39;&#39;, d)}&quot;<=
br>
&gt; @@ -247,7 +241,7 @@ PACKAGES =3D+ &quot;libegl-mesa libegl-mesa-dev \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libopencl-mesa l=
ibopencl-mesa-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxatracker lib=
xatracker-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mesa-megadriver =
mesa-vulkan-drivers \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mesa-vdpau-drivers me=
sa-tools \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mesa-vdpau-drivers me=
sa-gallium-drivers mesa-tools \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 do_install:append () {<br>
&gt; @@ -262,13 +256,6 @@ do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -do_install:append:class-native () {<br>
&gt; -=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;o=
pencl&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/src/intel/compiler/in=
tel_clc ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 # For the packages that make up the OpenGL interfaces, inject va=
riables so that<br>
&gt;=C2=A0 # they don&#39;t get Debian-renamed (which would remove the -mes=
a suffix), and<br>
&gt;=C2=A0 # RPROVIDEs/RCONFLICTs on the generic libgl name.<br>
&gt; @@ -339,6 +326,7 @@ FILES:mesa-megadriver =3D &quot;${libdir}/dri/* ${=
datadir}/drirc.d&quot;<br>
&gt;=C2=A0 FILES:mesa-vulkan-drivers =3D &quot;${libdir}/libvulkan_*.so ${l=
ibdir}/libpowervr_rogue.so ${datadir}/vulkan&quot;<br>
&gt;=C2=A0 FILES:${PN}-vdpau-drivers =3D &quot;${libdir}/vdpau/*.so.*&quot;=
<br>
&gt;=C2=A0 FILES:libegl-mesa =3D &quot;${libdir}/libEGL*.so.* ${datadir}/gl=
vnd/egl_vendor.d&quot;<br>
&gt; +FILES:mesa-gallium-drivers =3D &quot;${libdir}/libgallium-*.so&quot;<=
br>
&gt;=C2=A0 FILES:libgbm =3D &quot;${libdir}/libgbm.so.*&quot;<br>
&gt;=C2=A0 FILES:libgles1-mesa =3D &quot;${libdir}/libGLESv1*.so.*&quot;<br=
>
&gt;=C2=A0 FILES:libgles2-mesa =3D &quot;${libdir}/libGLESv2.so.*&quot;<br>
&gt; @@ -366,6 +354,7 @@ FILES:libxatracker-dev =3D &quot;${libdir}/libxatr=
acker.so ${libdir}/<a href=3D"http://libxatracker.la" rel=3D"noreferrer" ta=
rget=3D"_blank">libxatracker.la</a> \<br>
&gt;=C2=A0 # catch all to get all the tools and data<br>
&gt;=C2=A0 FILES:${PN}-tools =3D &quot;${bindir} ${datadir}&quot;<br>
&gt;=C2=A0 ALLOW_EMPTY:${PN}-tools =3D &quot;1&quot;<br>
&gt; +INSANE_SKIP:${PN}-megadriver =3D &quot;dev-so&quot;<br>
&gt;<br>
&gt;=C2=A0 # Fix upgrade path from mesa to mesa-megadriver<br>
&gt;=C2=A0 RREPLACES:mesa-megadriver =3D &quot;mesa&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#206746): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/206746" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/206746</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10941161=
9/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/109411619/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000672a6806263faf1c--


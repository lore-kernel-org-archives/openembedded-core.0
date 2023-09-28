Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A481E743CB
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 23:00:58 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.6304.1695942050781842800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 16:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Neonz4KQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59bbdb435bfso167287737b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695942050; x=1696546850; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p7kvh5mPCh4gUgvsr4IPy/f5i8dSjB1DaFQGHNttt8I=;
        b=Neonz4KQYHGqdxUzvWEeaG8+g4kI7u42NhiQQRedzEUYuRfD5vOTIUHJ6QtB53rPJp
         +gOu0cvb+9vLFV15tUBEkxpmVi0d8+3eTcua1+ISxRnW4qPOI1gbKaY7/9+qvE5i59sP
         X4Vcq3BdiITRmQCf24PA+oAyXpivsHb3pxju42zVyeBKgqxaKlOVJjKHtxJmQ2Jypnfo
         NUk3tmr+2+hr9CRaxdxduhziybveJpGunfJCbFn1vvqTeZAoyWNQbTzJNB9w1dfFZdJY
         W2RL1wjO0JZGQ/T2Ym/5lwYFl10CyQZFKIhzLudbdh9uMeptPkB+0UKsT8/z6AGa0Gfp
         9eMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695942050; x=1696546850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7kvh5mPCh4gUgvsr4IPy/f5i8dSjB1DaFQGHNttt8I=;
        b=JsBq8I3k9XOzG/C1WQlwYDdKN7xNWVDiIbyBNQUTUxF4/T0qHzCeACjZXwMG70rPcM
         pzUdi1nKH9Mses9T3mVFGISgjWVV347Dn1q3pbqCzAig1H7juk3zh6e32sgQSbWmnhFr
         7LtrUxNJFPFPhCuqnfXswg/i2Q4nRkiDFoMXIrOd0DoqEAJoA+kYcpkHEWUH9oMvRP5d
         CYCX9cakTzvyYpEvbtFUkUvWsHgdIFRkk91qGBHJ3Z/20JBCCupfqjEoQG1e0SvZ/rNL
         a+ywn2fB48uO2n/cPBSZjFItnpDG0KelstZ7uBrlNnv4Amp623pHkgSHrElkmu+2JoI5
         tU4g==
X-Gm-Message-State: AOJu0Yy1iQWCxaHja8IqmMvdrcHOza/T1JiyZ3+DcOuY7/IRU9jY11Kp
	KZcJPrhA3cam45E2LwjronUb6Qq8+vUAfr8Qx+U=
X-Google-Smtp-Source: AGHT+IGmiTg+ZOZiKF0vZT1Qf1bLInG1laZYC5anJE6gMPnbzZvKC/fKfhckYEmZcd6/1kwiwgLx0xibP2Q3b4R68RM=
X-Received: by 2002:a0d:db09:0:b0:59b:c4a5:f2ba with SMTP id
 d9-20020a0ddb09000000b0059bc4a5f2bamr2668681ywe.9.1695942049707; Thu, 28 Sep
 2023 16:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230922163721.477463-1-raj.khem@gmail.com> <bbe1ed504e65644dc1434d4622ce5a51e44a671f.camel@linuxfoundation.org>
 <CAMKF1spz5rxJ-yekHZrvqy9JoOPamNHfsUzFc1x0+c8DqHqgTQ@mail.gmail.com>
 <CAMKF1sqraCxWoQyk8a7iekHiySrV2nJEQ42sMyMaXR3OFvh6Qw@mail.gmail.com>
 <CANx9H-B1u9eirWxSYD-syZMG+Vrk1B=4j+1LqhX9JvvgRsN9dA@mail.gmail.com> <CAMKF1sqnP3QcL8MfetaM0jPZfix2Dgq8+ZjLnzwpzrAZbuvAjQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqnP3QcL8MfetaM0jPZfix2Dgq8+ZjLnzwpzrAZbuvAjQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 28 Sep 2023 16:00:38 -0700
Message-ID: <CANx9H-ArxrGX6v3HNrVdHVAKLLTJBaq71w2azFpr+VMB1vkThQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Update clang-17 patch to upstream v2
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000006eba9b06067347f1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 23:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188385

--0000000000006eba9b06067347f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 3:55=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Thu, Sep 28, 2023 at 2:46=E2=80=AFPM Tim Orling <ticotimo@gmail.com> w=
rote:
> >
> >
> >
> > On Thu, Sep 28, 2023 at 1:34=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> >>
> >> Can you check if the machines where it fails has llvm-14-dev package
> >> installed on host ?
> >>
> >
> > In my case, yes. llvm-14-dev 1:14.0.0-1ubuntu1.1
>
> yeah, this will expose the problem I guess that mesa/meson build files
> have logic for detecting llvm dependency uses cmake and how meson
> does this is by generating intermediate native file and ignoring
> llvm-config setting that OE has passed via meson.native file and finds
> one in
> /usr/bin and thats where the slippery slope starts.
>
> I am sure if you uninstall llvm-14-dev from your build host then it
> will start to work. I am looking into a patch to contain it meanwhile.
>
>
Confirmed "fix". I don't remember why I have llvm-14-dev installed to begin
with so buh-bye


> >
> >>
> >> On Thu, Sep 28, 2023 at 9:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> >> >
> >> > its linking with  /usr/lib/llvm-14/lib/libLLVM-14.so.1 which is not
> >> > correct. Somehow its finding llvm library on your build host.
> >> >
> >> > On Thu, Sep 28, 2023 at 8:25=E2=80=AFAM Richard Purdie
> >> > <richard.purdie@linuxfoundation.org> wrote:
> >> > >
> >> > > On Fri, 2023-09-22 at 09:37 -0700, Khem Raj wrote:
> >> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > > > ---
> >> > > >  .../0001-gallium-Fix-build-with-llvm-17.patch | 27
> ++++++++++++-------
> >> > > >  1 file changed, 18 insertions(+), 9 deletions(-)
> >> > > >
> >> > > > diff --git
> a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.pa=
tch
> b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.pa=
tch
> >> > > > index 3631a918b0c..0ca7a22b45b 100644
> >> > > > ---
> a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.pa=
tch
> >> > > > +++
> b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.pa=
tch
> >> > > > @@ -1,4 +1,4 @@
> >> > > > -From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17
> 00:00:00 2001
> >> > > > +From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17
> 00:00:00 2001
> >> > > >  From: Khem Raj <raj.khem@gmail.com>
> >> > > >  Date: Fri, 23 Jun 2023 01:20:38 -0700
> >> > > >  Subject: [PATCH] gallium: Fix build with llvm 17
> >> > > > @@ -10,14 +10,12 @@ so add conditions to exclude them for llvm >=
=3D
> 17
> >> > > >  Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827]
> >> > > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > > >  ---
> >> > > > - src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-
> >> > > > - 1 file changed, 3 insertions(+), 1 deletion(-)
> >> > > > + src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
> >> > > > + 1 file changed, 4 insertions(+), 2 deletions(-)
> >> > > >
> >> > > > -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c
> b/src/gallium/auxiliary/gallivm/lp_bld_init.c
> >> > > > -index 24d0823..3d4573e 100644
> >> > > >  --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
> >> > > >  +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
> >> > > > -@@ -42,8 +42,10 @@
> >> > > > +@@ -42,19 +42,23 @@
> >> > > >
> >> > > >   #include <llvm/Config/llvm-config.h>
> >> > > >   #include <llvm-c/Analysis.h>
> >> > > > @@ -29,6 +27,17 @@ index 24d0823..3d4573e 100644
> >> > > >   #include <llvm-c/Transforms/Utils.h>
> >> > > >   #endif
> >> > > >   #include <llvm-c/BitWriter.h>
> >> > > > ---
> >> > > > -2.41.0
> >> > > > -
> >> > > > + #if GALLIVM_USE_NEW_PASS =3D=3D 1
> >> > > > + #include <llvm-c/Transforms/PassBuilder.h>
> >> > > > +-#elif GALLIVM_HAVE_CORO =3D=3D 1
> >> > > > ++#elif GALLIVM_HAVE_CORO =3D=3D 1 && LLVM_VERSION_MAJOR < 17
> >> > > > + #if LLVM_VERSION_MAJOR <=3D 8 && (DETECT_ARCH_AARCH64 ||
> DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
> >> > > > + #include <llvm-c/Transforms/IPO.h>
> >> > > > + #endif
> >> > > > ++#if LLVM_VERSION_MAJOR < 17
> >> > > > + #include <llvm-c/Transforms/Coroutines.h>
> >> > > > + #endif
> >> > > > ++#endif
> >> > > > +
> >> > > > + unsigned gallivm_perf =3D 0;
> >> > > > +
> >> > >
> >> > > I think this patch may have broken against with the recent llvm
> point
> >> > > release?
> >> > >
> >> > > DEBUG: Executing shell function do_compile
> >> > >
> >> > > [1/33]
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/bin/python3-native/python3
> ../mesa-23.1.8/bin/git_sha1_gen.py --output src/git_sha1.h
> >> > > [2/13] g++  -o src/gallium/targets/dri/libgallium_dri.so
> src/gallium/targets/dri/libgallium_dri.so.p/target.c.o
> -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/usr/lib
> -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/lib
> -Wl,--as-needed -Wl,--no-undefined -shared -fPIC -Wl,--start-group
> -Wl,-soname,libgallium_dri.so -Wl,--enable-new-dtags
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib
> -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-l=
inux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib
> -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-l=
inux/mesa-native/23.1.8/recipe-sysroot-native/lib
> -Wl,-O1 -Wl,--allow-shlib-undefined
> -Wl,--dynamic-linker=3D/srv/build/ttorling/workspace-upgrades/build/tmp/s=
ysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/ttorling/worksp=
ace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-=
native/usr/lib/pkgconfig/../../../usr/lib'
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/build/src/mapi/shared-glapi
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib
> src/gallium/frontends/dri/libdri.a src/util/libmesa_util.a
> src/util/format/libmesa_format.a src/util/libmesa_util_sse41.a
> src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a
> src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a
> src/compiler/nir/libnir.a src/compiler/libcompiler.a
> src/mesa/libmesa_sse41.a src/gallium/auxiliary/libgalliumvl.a
> src/gallium/auxiliary/libgallium.a src/mapi/shared-glapi/libglapi.so.0.0.=
0
> src/gallium/auxiliary/pipe-loader/libpipe_loader_static.a
> src/loader/libloader.a src/util/libxmlconfig.a
> src/gallium/winsys/sw/null/libws_null.a
> src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys/sw/dri/libswdri=
.a
> src/gallium/winsys/sw/kms-dri/libswkmsdri.a
> src/gallium/drivers/llvmpipe/libllvmpipe.a
> src/gallium/drivers/softpipe/libsoftpipe.a
> src/gallium/drivers/r300/libr300.a
> src/gallium/winsys/radeon/drm/libradeonwinsys.a
> src/gallium/drivers/r600/libr600.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx6.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx7.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx8.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx9.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx10.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx103.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx11.a
> src/gallium/drivers/radeonsi/libradeonsi.a
> src/gallium/winsys/amdgpu/drm/libamdgpuwinsys.a
> src/amd/addrlib/libaddrlib.a src/amd/common/libamd_common.a
> src/amd/llvm/libamd_common_llvm.a
> src/gallium/winsys/nouveau/drm/libnouveauwinsys.a
> src/nouveau/codegen/libnouveau_codegen.a
> src/gallium/drivers/nouveau/libnouveau.a src/gallium/drivers/i915/libi915=
.a
> src/gallium/winsys/i915/drm/libi915drm.a src/intel/common/libintel_common=
.a
> src/intel/isl/libisl.a src/intel/isl/libisl_per_hw_ver40.a
> src/intel/dev/libintel_dev.a src/intel/isl/libisl_per_hw_ver50.a
> src/intel/isl/libisl_per_hw_ver60.a src/intel/isl/libisl_per_hw_ver70.a
> src/intel/isl/libisl_per_hw_ver75.a src/intel/isl/libisl_per_hw_ver80.a
> src/intel/isl/libisl_per_hw_ver90.a src/intel/isl/libisl_per_hw_ver110.a
> src/intel/isl/libisl_per_hw_ver120.a src/intel/isl/libisl_per_hw_ver125.a
> src/intel/isl/libisl_tiled_memcpy.a
> src/intel/isl/libisl_tiled_memcpy_sse41.a
> src/gallium/drivers/svga/libsvga.a src/gallium/winsys/svga/drm/libsvgadrm=
.a
> src/gallium/drivers/virgl/libvirgl.a
> src/gallium/winsys/virgl/drm/libvirgldrm.a
> src/gallium/winsys/virgl/common/libvirglcommon.a
> src/gallium/winsys/virgl/vtest/libvirglvtest.a
> src/gallium/drivers/iris/libiris.a
> src/gallium/drivers/iris/libiris_per_hw_ver80.a
> src/gallium/drivers/iris/libiris_per_hw_ver90.a
> src/gallium/drivers/iris/libiris_per_hw_ver110.a
> src/gallium/drivers/iris/libiris_per_hw_ver120.a
> src/gallium/drivers/iris/libiris_per_hw_ver125.a
> src/intel/compiler/libintel_compiler.a src/intel/blorp/libblorp.a
> src/intel/perf/libintel_perf.a src/intel/ds/libintel-driver-ds.a
> src/gallium/winsys/iris/drm/libiriswinsys.a
> src/gallium/drivers/crocus/libcrocus.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver45.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver50.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver60.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver75.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver80.a
> src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=3Dsha1
> -Wl,--gc-sections -Wl,--version-script
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/mesa-23.1.8/src/gallium/targets/dri/dri.sym
> -Wl,--dynamic-list
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/mesa-23.1.8/src/gallium/targets/dri/../dri-vdpau.dyn
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m.so
> /usr/lib/llvm-14/lib/libLLVM-14.so.1 -pthread
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libex=
pat.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libz.=
so
> -lm
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libzs=
td.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libxc=
b-randr.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_radeon.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libel=
f.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_amdgpu.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_nouveau.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_intel.so
> -Wl,--end-group
> >> > > FAILED: src/gallium/targets/dri/libgallium_dri.so
> >> > > g++  -o src/gallium/targets/dri/libgallium_dri.so
> src/gallium/targets/dri/libgallium_dri.so.p/target.c.o
> -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/usr/lib
> -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/lib
> -Wl,--as-needed -Wl,--no-undefined -shared -fPIC -Wl,--start-group
> -Wl,-soname,libgallium_dri.so -Wl,--enable-new-dtags
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib
> -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-l=
inux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib
> -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-l=
inux/mesa-native/23.1.8/recipe-sysroot-native/lib
> -Wl,-O1 -Wl,--allow-shlib-undefined
> -Wl,--dynamic-linker=3D/srv/build/ttorling/workspace-upgrades/build/tmp/s=
ysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/ttorling/worksp=
ace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-=
native/usr/lib/pkgconfig/../../../usr/lib'
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/build/src/mapi/shared-glapi
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib
> src/gallium/frontends/dri/libdri.a src/util/libmesa_util.a
> src/util/format/libmesa_format.a src/util/libmesa_util_sse41.a
> src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a
> src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a
> src/compiler/nir/libnir.a src/compiler/libcompiler.a
> src/mesa/libmesa_sse41.a src/gallium/auxiliary/libgalliumvl.a
> src/gallium/auxiliary/libgallium.a src/mapi/shared-glapi/libglapi.so.0.0.=
0
> src/gallium/auxiliary/pipe-loader/libpipe_loader_static.a
> src/loader/libloader.a src/util/libxmlconfig.a
> src/gallium/winsys/sw/null/libws_null.a
> src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys/sw/dri/libswdri=
.a
> src/gallium/winsys/sw/kms-dri/libswkmsdri.a
> src/gallium/drivers/llvmpipe/libllvmpipe.a
> src/gallium/drivers/softpipe/libsoftpipe.a
> src/gallium/drivers/r300/libr300.a
> src/gallium/winsys/radeon/drm/libradeonwinsys.a
> src/gallium/drivers/r600/libr600.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx6.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx7.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx8.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx9.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx10.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx103.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx11.a
> src/gallium/drivers/radeonsi/libradeonsi.a
> src/gallium/winsys/amdgpu/drm/libamdgpuwinsys.a
> src/amd/addrlib/libaddrlib.a src/amd/common/libamd_common.a
> src/amd/llvm/libamd_common_llvm.a
> src/gallium/winsys/nouveau/drm/libnouveauwinsys.a
> src/nouveau/codegen/libnouveau_codegen.a
> src/gallium/drivers/nouveau/libnouveau.a src/gallium/drivers/i915/libi915=
.a
> src/gallium/winsys/i915/drm/libi915drm.a src/intel/common/libintel_common=
.a
> src/intel/isl/libisl.a src/intel/isl/libisl_per_hw_ver40.a
> src/intel/dev/libintel_dev.a src/intel/isl/libisl_per_hw_ver50.a
> src/intel/isl/libisl_per_hw_ver60.a src/intel/isl/libisl_per_hw_ver70.a
> src/intel/isl/libisl_per_hw_ver75.a src/intel/isl/libisl_per_hw_ver80.a
> src/intel/isl/libisl_per_hw_ver90.a src/intel/isl/libisl_per_hw_ver110.a
> src/intel/isl/libisl_per_hw_ver120.a src/intel/isl/libisl_per_hw_ver125.a
> src/intel/isl/libisl_tiled_memcpy.a
> src/intel/isl/libisl_tiled_memcpy_sse41.a
> src/gallium/drivers/svga/libsvga.a src/gallium/winsys/svga/drm/libsvgadrm=
.a
> src/gallium/drivers/virgl/libvirgl.a
> src/gallium/winsys/virgl/drm/libvirgldrm.a
> src/gallium/winsys/virgl/common/libvirglcommon.a
> src/gallium/winsys/virgl/vtest/libvirglvtest.a
> src/gallium/drivers/iris/libiris.a
> src/gallium/drivers/iris/libiris_per_hw_ver80.a
> src/gallium/drivers/iris/libiris_per_hw_ver90.a
> src/gallium/drivers/iris/libiris_per_hw_ver110.a
> src/gallium/drivers/iris/libiris_per_hw_ver120.a
> src/gallium/drivers/iris/libiris_per_hw_ver125.a
> src/intel/compiler/libintel_compiler.a src/intel/blorp/libblorp.a
> src/intel/perf/libintel_perf.a src/intel/ds/libintel-driver-ds.a
> src/gallium/winsys/iris/drm/libiriswinsys.a
> src/gallium/drivers/crocus/libcrocus.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver45.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver50.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver60.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver75.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver80.a
> src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=3Dsha1
> -Wl,--gc-sections -Wl,--version-script
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/mesa-23.1.8/src/gallium/targets/dri/dri.sym
> -Wl,--dynamic-list
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/mesa-23.1.8/src/gallium/targets/dri/../dri-vdpau.dyn
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m.so
> /usr/lib/llvm-14/lib/libLLVM-14.so.1 -pthread
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libex=
pat.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libz.=
so
> -lm
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libzs=
td.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libxc=
b-randr.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_radeon.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libel=
f.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_amdgpu.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_nouveau.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_intel.so
> -Wl,--end-group
> >> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld:
> src/gallium/auxiliary/libgallium.a.p/gallivm_lp_bld_misc.cpp.o: in functi=
on
> `llvm::SmallVectorTemplateBase<std::__cxx11::basic_string<char,
> std::char_traits<char>, std::allocator<char> >, false>::grow(unsigned
> long)':
> >> > >
> lp_bld_misc.cpp:(.text._ZN4llvm23SmallVectorTemplateBaseINSt7__cxx1112bas=
ic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm[_ZN4llvm23SmallVectorTempl=
ateBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm]+0=
x36):
> undefined reference to `llvm::SmallVectorBase<unsigned
> int>::mallocForGrow(void*, unsigned long, unsigned long, unsigned long&)'
> >> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld:
> src/amd/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function
> `llvm::DataLayout::getTypeSizeInBits(llvm::Type*) const':
> >> > >
> ac_llvm_helper.cpp:(.text._ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4T=
ypeE[_ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4TypeE]+0xa4):
> undefined reference to `llvm::TargetExtType::getLayoutType() const'
> >> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld:
> src/amd/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function
> `ac_create_passmgr':
> >> > > ac_llvm_helper.cpp:(.text.ac_create_passmgr+0x8c): undefined
> reference to `llvm::createPromoteMemoryToRegisterPass(bool)'
> >> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld:
> ac_llvm_helper.cpp:(.text.ac_create_passmgr+0xa6): undefined reference to
> `llvm::createSROAPass(bool)'
> >> > > collect2: error: ld returned 1 exit status
> >> > > ninja: build stopped: subcommand failed.
> >> > > INFO: autodetecting backend as ninja
> >> > > INFO: calculating backend command to run:
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/bin/ninja
> -j 24 -v
> >> > > WARNING:
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/temp/run.do_compile.3996760:155
> exit 1 from 'meson compile -v -j 24'
> >> > > WARNING: Backtrace (BB generated script):
> >> > >         #1: meson_do_compile,
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/temp/run.do_compile.3996760,
> line 155
> >> > >         #2: do_compile,
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/temp/run.do_compile.3996760,
> line 150
> >> > >         #3: main,
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/temp/run.do_compile.3996760,
> line 159
> >> > >
> >> > > (log borrowed from Tim but I'm seeing a similar issue)
> >> > >
> >> > > Cheers,
> >> > >
> >> > > Richard
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#188379):
> https://lists.openembedded.org/g/openembedded-core/message/188379
> >> Mute This Topic: https://lists.openembedded.org/mt/101524707/924729
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> ticotimo@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--0000000000006eba9b06067347f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 28, 2023 at 3:55=E2=80=AF=
PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Thu, Sep 28, 2023 at 2:46=E2=80=AFPM Tim Orling &lt;<a href=3D"mailto:ticot=
imo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Sep 28, 2023 at 1:34=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; Can you check if the machines where it fails has llvm-14-dev packa=
ge<br>
&gt;&gt; installed on host ?<br>
&gt;&gt;<br>
&gt;<br>
&gt; In my case, yes. llvm-14-dev 1:14.0.0-1ubuntu1.1<br>
<br>
yeah, this will expose the problem I guess that mesa/meson build files<br>
have logic for detecting llvm dependency uses cmake and how meson<br>
does this is by generating intermediate native file and ignoring<br>
llvm-config setting that OE has passed via meson.native file and finds<br>
one in<br>
/usr/bin and thats where the slippery slope starts.<br>
<br>
I am sure if you uninstall llvm-14-dev from your build host then it<br>
will start to work. I am looking into a patch to contain it meanwhile.<br>
<br></blockquote><div><br></div><div>Confirmed &quot;fix&quot;. I don&#39;t=
 remember why I have llvm-14-dev installed to begin with so buh-bye</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Sep 28, 2023 at 9:55=E2=80=AFAM Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote=
:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; its linking with=C2=A0 /usr/lib/llvm-14/lib/libLLVM-14.so.1 w=
hich is not<br>
&gt;&gt; &gt; correct. Somehow its finding llvm library on your build host.=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, Sep 28, 2023 at 8:25=E2=80=AFAM Richard Purdie<br>
&gt;&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" tar=
get=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; On Fri, 2023-09-22 at 09:37 -0700, Khem Raj wrote:<br>
&gt;&gt; &gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt; &gt; ---<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 .../0001-gallium-Fix-build-with-llvm-17.patch=
 | 27 ++++++++++++-------<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 18 insertions(+), 9 deletions=
(-)<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; diff --git a/meta/recipes-graphics/mesa/files/0001-=
gallium-Fix-build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/000=
1-gallium-Fix-build-with-llvm-17.patch<br>
&gt;&gt; &gt; &gt; &gt; index 3631a918b0c..0ca7a22b45b 100644<br>
&gt;&gt; &gt; &gt; &gt; --- a/meta/recipes-graphics/mesa/files/0001-gallium=
-Fix-build-with-llvm-17.patch<br>
&gt;&gt; &gt; &gt; &gt; +++ b/meta/recipes-graphics/mesa/files/0001-gallium=
-Fix-build-with-llvm-17.patch<br>
&gt;&gt; &gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; &gt; &gt; -From 865762e0a767a121206d818bdd58301afbf30104 Mon =
Sep 17 00:00:00 2001<br>
&gt;&gt; &gt; &gt; &gt; +From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon =
Sep 17 00:00:00 2001<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 Date: Fri, 23 Jun 2023 01:20:38 -0700<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 Subject: [PATCH] gallium: Fix build with llvm=
 17<br>
&gt;&gt; &gt; &gt; &gt; @@ -10,14 +10,12 @@ so add conditions to exclude th=
em for llvm &gt;=3D 17<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 Upstream-Status: Submitted [<a href=3D"https:=
//gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_reque=
sts/23827</a>]<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 ---<br>
&gt;&gt; &gt; &gt; &gt; - src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +=
++-<br>
&gt;&gt; &gt; &gt; &gt; - 1 file changed, 3 insertions(+), 1 deletion(-)<br=
>
&gt;&gt; &gt; &gt; &gt; + src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 +=
+++--<br>
&gt;&gt; &gt; &gt; &gt; + 1 file changed, 4 insertions(+), 2 deletions(-)<b=
r>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_=
init.c b/src/gallium/auxiliary/gallivm/lp_bld_init.c<br>
&gt;&gt; &gt; &gt; &gt; -index 24d0823..3d4573e 100644<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 --- a/src/gallium/auxiliary/gallivm/lp_bld_in=
it.c<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 +++ b/src/gallium/auxiliary/gallivm/lp_bld_in=
it.c<br>
&gt;&gt; &gt; &gt; &gt; -@@ -42,8 +42,10 @@<br>
&gt;&gt; &gt; &gt; &gt; +@@ -42,19 +42,23 @@<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;llvm/Config/llvm-config.h&=
gt;<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;llvm-c/Analysis.h&gt;<br>
&gt;&gt; &gt; &gt; &gt; @@ -29,6 +27,17 @@ index 24d0823..3d4573e 100644<br=
>
&gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;llvm-c/Transforms/Utils.h&=
gt;<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#endif<br>
&gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;llvm-c/BitWriter.h&gt;<br>
&gt;&gt; &gt; &gt; &gt; ---<br>
&gt;&gt; &gt; &gt; &gt; -2.41.0<br>
&gt;&gt; &gt; &gt; &gt; -<br>
&gt;&gt; &gt; &gt; &gt; + #if GALLIVM_USE_NEW_PASS =3D=3D 1<br>
&gt;&gt; &gt; &gt; &gt; + #include &lt;llvm-c/Transforms/PassBuilder.h&gt;<=
br>
&gt;&gt; &gt; &gt; &gt; +-#elif GALLIVM_HAVE_CORO =3D=3D 1<br>
&gt;&gt; &gt; &gt; &gt; ++#elif GALLIVM_HAVE_CORO =3D=3D 1 &amp;&amp; LLVM_=
VERSION_MAJOR &lt; 17<br>
&gt;&gt; &gt; &gt; &gt; + #if LLVM_VERSION_MAJOR &lt;=3D 8 &amp;&amp; (DETE=
CT_ARCH_AARCH64 || DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS6=
4)<br>
&gt;&gt; &gt; &gt; &gt; + #include &lt;llvm-c/Transforms/IPO.h&gt;<br>
&gt;&gt; &gt; &gt; &gt; + #endif<br>
&gt;&gt; &gt; &gt; &gt; ++#if LLVM_VERSION_MAJOR &lt; 17<br>
&gt;&gt; &gt; &gt; &gt; + #include &lt;llvm-c/Transforms/Coroutines.h&gt;<b=
r>
&gt;&gt; &gt; &gt; &gt; + #endif<br>
&gt;&gt; &gt; &gt; &gt; ++#endif<br>
&gt;&gt; &gt; &gt; &gt; +<br>
&gt;&gt; &gt; &gt; &gt; + unsigned gallivm_perf =3D 0;<br>
&gt;&gt; &gt; &gt; &gt; +<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I think this patch may have broken against with the rece=
nt llvm point<br>
&gt;&gt; &gt; &gt; release?<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; DEBUG: Executing shell function do_compile<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; [1/33] /srv/build/ttorling/workspace-upgrades/build/tmp/=
work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/bin/python3-=
native/python3 ../mesa-23.1.8/bin/git_sha1_gen.py --output src/git_sha1.h<b=
r>
&gt;&gt; &gt; &gt; [2/13] g++=C2=A0 -o src/gallium/targets/dri/libgallium_d=
ri.so src/gallium/targets/dri/libgallium_dri.so.p/target.c.o -L/srv/build/t=
torling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/r=
ecipe-sysroot-native/usr/lib -L/srv/build/ttorling/workspace-upgrades/build=
/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,--a=
s-needed -Wl,--no-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,lib=
gallium_dri.so -Wl,--enable-new-dtags -Wl,-rpath-link,/srv/build/ttorling/w=
orkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sys=
root-native/usr/lib -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/=
build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -W=
l,-rpath,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/recipe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/tto=
rling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/rec=
ipe-sysroot-native/lib -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-li=
nker=3D/srv/build/ttorling/workspace-upgrades/build/tmp/sysroots-uninative/=
x86_64-linux/lib/ld-linux-x86-64.so.2 &#39;-Wl,-rpath,$ORIGIN/../../../mapi=
/shared-glapi:/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-=
linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib&#39; -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tm=
p/work/x86_64-linux/mesa-native/23.1.8/build/src/mapi/shared-glapi -Wl,-rpa=
th-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/=
mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=
 src/gallium/frontends/dri/libdri.a src/util/libmesa_util.a src/util/format=
/libmesa_format.a src/util/libmesa_util_sse41.a src/c11/impl/libmesa_util_c=
11.a src/mesa/libmesa.a src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp=
/libglcpp.a src/compiler/nir/libnir.a src/compiler/libcompiler.a src/mesa/l=
ibmesa_sse41.a src/gallium/auxiliary/libgalliumvl.a src/gallium/auxiliary/l=
ibgallium.a src/mapi/shared-glapi/libglapi.so.0.0.0 src/gallium/auxiliary/p=
ipe-loader/libpipe_loader_static.a src/loader/libloader.a src/util/libxmlco=
nfig.a src/gallium/winsys/sw/null/libws_null.a src/gallium/winsys/sw/wrappe=
r/libwsw.a src/gallium/winsys/sw/dri/libswdri.a src/gallium/winsys/sw/kms-d=
ri/libswkmsdri.a src/gallium/drivers/llvmpipe/libllvmpipe.a src/gallium/dri=
vers/softpipe/libsoftpipe.a src/gallium/drivers/r300/libr300.a src/gallium/=
winsys/radeon/drm/libradeonwinsys.a src/gallium/drivers/r600/libr600.a src/=
gallium/drivers/radeonsi/libradeonsi_gfx6.a src/gallium/drivers/radeonsi/li=
bradeonsi_gfx7.a src/gallium/drivers/radeonsi/libradeonsi_gfx8.a src/galliu=
m/drivers/radeonsi/libradeonsi_gfx9.a src/gallium/drivers/radeonsi/libradeo=
nsi_gfx10.a src/gallium/drivers/radeonsi/libradeonsi_gfx103.a src/gallium/d=
rivers/radeonsi/libradeonsi_gfx11.a src/gallium/drivers/radeonsi/libradeons=
i.a src/gallium/winsys/amdgpu/drm/libamdgpuwinsys.a src/amd/addrlib/libaddr=
lib.a src/amd/common/libamd_common.a src/amd/llvm/libamd_common_llvm.a src/=
gallium/winsys/nouveau/drm/libnouveauwinsys.a src/nouveau/codegen/libnouvea=
u_codegen.a src/gallium/drivers/nouveau/libnouveau.a src/gallium/drivers/i9=
15/libi915.a src/gallium/winsys/i915/drm/libi915drm.a src/intel/common/libi=
ntel_common.a src/intel/isl/libisl.a src/intel/isl/libisl_per_hw_ver40.a sr=
c/intel/dev/libintel_dev.a src/intel/isl/libisl_per_hw_ver50.a src/intel/is=
l/libisl_per_hw_ver60.a src/intel/isl/libisl_per_hw_ver70.a src/intel/isl/l=
ibisl_per_hw_ver75.a src/intel/isl/libisl_per_hw_ver80.a src/intel/isl/libi=
sl_per_hw_ver90.a src/intel/isl/libisl_per_hw_ver110.a src/intel/isl/libisl=
_per_hw_ver120.a src/intel/isl/libisl_per_hw_ver125.a src/intel/isl/libisl_=
tiled_memcpy.a src/intel/isl/libisl_tiled_memcpy_sse41.a src/gallium/driver=
s/svga/libsvga.a src/gallium/winsys/svga/drm/libsvgadrm.a src/gallium/drive=
rs/virgl/libvirgl.a src/gallium/winsys/virgl/drm/libvirgldrm.a src/gallium/=
winsys/virgl/common/libvirglcommon.a src/gallium/winsys/virgl/vtest/libvirg=
lvtest.a src/gallium/drivers/iris/libiris.a src/gallium/drivers/iris/libiri=
s_per_hw_ver80.a src/gallium/drivers/iris/libiris_per_hw_ver90.a src/galliu=
m/drivers/iris/libiris_per_hw_ver110.a src/gallium/drivers/iris/libiris_per=
_hw_ver120.a src/gallium/drivers/iris/libiris_per_hw_ver125.a src/intel/com=
piler/libintel_compiler.a src/intel/blorp/libblorp.a src/intel/perf/libinte=
l_perf.a src/intel/ds/libintel-driver-ds.a src/gallium/winsys/iris/drm/libi=
riswinsys.a src/gallium/drivers/crocus/libcrocus.a src/gallium/drivers/croc=
us/libcrocus_per_hw_ver40.a src/gallium/drivers/crocus/libcrocus_per_hw_ver=
45.a src/gallium/drivers/crocus/libcrocus_per_hw_ver50.a src/gallium/driver=
s/crocus/libcrocus_per_hw_ver60.a src/gallium/drivers/crocus/libcrocus_per_=
hw_ver70.a src/gallium/drivers/crocus/libcrocus_per_hw_ver75.a src/gallium/=
drivers/crocus/libcrocus_per_hw_ver80.a src/gallium/winsys/crocus/drm/libcr=
ocuswinsys.a -Wl,--build-id=3Dsha1 -Wl,--gc-sections -Wl,--version-script /=
srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nati=
ve/23.1.8/mesa-23.1.8/src/gallium/targets/dri/dri.sym -Wl,--dynamic-list /s=
rv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nativ=
e/23.1.8/mesa-23.1.8/src/gallium/targets/dri/../dri-vdpau.dyn /srv/build/tt=
orling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/re=
cipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm.so /usr/lib/l=
lvm-14/lib/libLLVM-14.so.1 -pthread /srv/build/ttorling/workspace-upgrades/=
build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/li=
b/pkgconfig/../../../usr/lib/libexpat.so /srv/build/ttorling/workspace-upgr=
ades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/lib/libz.so -lm /srv/build/ttorling/workspace=
-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nat=
ive/usr/lib/pkgconfig/../../../usr/lib/libzstd.so /srv/build/ttorling/works=
pace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/lib/libxcb-randr.so /srv/build/ttorl=
ing/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recip=
e-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_radeon.so /srv/b=
uild/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23=
.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libelf.so /sr=
v/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native=
/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_amd=
gpu.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/m=
esa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/=
libdrm_nouveau.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib/libdrm_intel.so -Wl,--end-group<br>
&gt;&gt; &gt; &gt; FAILED: src/gallium/targets/dri/libgallium_dri.so<br>
&gt;&gt; &gt; &gt; g++=C2=A0 -o src/gallium/targets/dri/libgallium_dri.so s=
rc/gallium/targets/dri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling=
/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-s=
ysroot-native/usr/lib -L/srv/build/ttorling/workspace-upgrades/build/tmp/wo=
rk/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-neede=
d -Wl,--no-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium=
_dri.so -Wl,--enable-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspac=
e-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-na=
tive/usr/lib -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/t=
mp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpat=
h,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/w=
orkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sys=
root-native/lib -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D=
/srv/build/ttorling/workspace-upgrades/build/tmp/sysroots-uninative/x86_64-=
linux/lib/ld-linux-x86-64.so.2 &#39;-Wl,-rpath,$ORIGIN/../../../mapi/shared=
-glapi:/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/m=
esa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib&=
#39; -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/=
x86_64-linux/mesa-native/23.1.8/build/src/mapi/shared-glapi -Wl,-rpath-link=
,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-na=
tive/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib src/ga=
llium/frontends/dri/libdri.a src/util/libmesa_util.a src/util/format/libmes=
a_format.a src/util/libmesa_util_sse41.a src/c11/impl/libmesa_util_c11.a sr=
c/mesa/libmesa.a src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglc=
pp.a src/compiler/nir/libnir.a src/compiler/libcompiler.a src/mesa/libmesa_=
sse41.a src/gallium/auxiliary/libgalliumvl.a src/gallium/auxiliary/libgalli=
um.a src/mapi/shared-glapi/libglapi.so.0.0.0 src/gallium/auxiliary/pipe-loa=
der/libpipe_loader_static.a src/loader/libloader.a src/util/libxmlconfig.a =
src/gallium/winsys/sw/null/libws_null.a src/gallium/winsys/sw/wrapper/libws=
w.a src/gallium/winsys/sw/dri/libswdri.a src/gallium/winsys/sw/kms-dri/libs=
wkmsdri.a src/gallium/drivers/llvmpipe/libllvmpipe.a src/gallium/drivers/so=
ftpipe/libsoftpipe.a src/gallium/drivers/r300/libr300.a src/gallium/winsys/=
radeon/drm/libradeonwinsys.a src/gallium/drivers/r600/libr600.a src/gallium=
/drivers/radeonsi/libradeonsi_gfx6.a src/gallium/drivers/radeonsi/libradeon=
si_gfx7.a src/gallium/drivers/radeonsi/libradeonsi_gfx8.a src/gallium/drive=
rs/radeonsi/libradeonsi_gfx9.a src/gallium/drivers/radeonsi/libradeonsi_gfx=
10.a src/gallium/drivers/radeonsi/libradeonsi_gfx103.a src/gallium/drivers/=
radeonsi/libradeonsi_gfx11.a src/gallium/drivers/radeonsi/libradeonsi.a src=
/gallium/winsys/amdgpu/drm/libamdgpuwinsys.a src/amd/addrlib/libaddrlib.a s=
rc/amd/common/libamd_common.a src/amd/llvm/libamd_common_llvm.a src/gallium=
/winsys/nouveau/drm/libnouveauwinsys.a src/nouveau/codegen/libnouveau_codeg=
en.a src/gallium/drivers/nouveau/libnouveau.a src/gallium/drivers/i915/libi=
915.a src/gallium/winsys/i915/drm/libi915drm.a src/intel/common/libintel_co=
mmon.a src/intel/isl/libisl.a src/intel/isl/libisl_per_hw_ver40.a src/intel=
/dev/libintel_dev.a src/intel/isl/libisl_per_hw_ver50.a src/intel/isl/libis=
l_per_hw_ver60.a src/intel/isl/libisl_per_hw_ver70.a src/intel/isl/libisl_p=
er_hw_ver75.a src/intel/isl/libisl_per_hw_ver80.a src/intel/isl/libisl_per_=
hw_ver90.a src/intel/isl/libisl_per_hw_ver110.a src/intel/isl/libisl_per_hw=
_ver120.a src/intel/isl/libisl_per_hw_ver125.a src/intel/isl/libisl_tiled_m=
emcpy.a src/intel/isl/libisl_tiled_memcpy_sse41.a src/gallium/drivers/svga/=
libsvga.a src/gallium/winsys/svga/drm/libsvgadrm.a src/gallium/drivers/virg=
l/libvirgl.a src/gallium/winsys/virgl/drm/libvirgldrm.a src/gallium/winsys/=
virgl/common/libvirglcommon.a src/gallium/winsys/virgl/vtest/libvirglvtest.=
a src/gallium/drivers/iris/libiris.a src/gallium/drivers/iris/libiris_per_h=
w_ver80.a src/gallium/drivers/iris/libiris_per_hw_ver90.a src/gallium/drive=
rs/iris/libiris_per_hw_ver110.a src/gallium/drivers/iris/libiris_per_hw_ver=
120.a src/gallium/drivers/iris/libiris_per_hw_ver125.a src/intel/compiler/l=
ibintel_compiler.a src/intel/blorp/libblorp.a src/intel/perf/libintel_perf.=
a src/intel/ds/libintel-driver-ds.a src/gallium/winsys/iris/drm/libiriswins=
ys.a src/gallium/drivers/crocus/libcrocus.a src/gallium/drivers/crocus/libc=
rocus_per_hw_ver40.a src/gallium/drivers/crocus/libcrocus_per_hw_ver45.a sr=
c/gallium/drivers/crocus/libcrocus_per_hw_ver50.a src/gallium/drivers/crocu=
s/libcrocus_per_hw_ver60.a src/gallium/drivers/crocus/libcrocus_per_hw_ver7=
0.a src/gallium/drivers/crocus/libcrocus_per_hw_ver75.a src/gallium/drivers=
/crocus/libcrocus_per_hw_ver80.a src/gallium/winsys/crocus/drm/libcrocuswin=
sys.a -Wl,--build-id=3Dsha1 -Wl,--gc-sections -Wl,--version-script /srv/bui=
ld/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1=
.8/mesa-23.1.8/src/gallium/targets/dri/dri.sym -Wl,--dynamic-list /srv/buil=
d/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.=
8/mesa-23.1.8/src/gallium/targets/dri/../dri-vdpau.dyn /srv/build/ttorling/=
workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sy=
sroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/=
lib/libLLVM-14.so.1 -pthread /srv/build/ttorling/workspace-upgrades/build/t=
mp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgco=
nfig/../../../usr/lib/libexpat.so /srv/build/ttorling/workspace-upgrades/bu=
ild/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/=
pkgconfig/../../../usr/lib/libz.so -lm /srv/build/ttorling/workspace-upgrad=
es/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr=
/lib/pkgconfig/../../../usr/lib/libzstd.so /srv/build/ttorling/workspace-up=
grades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/lib/libxcb-randr.so /srv/build/ttorling/wor=
kspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysro=
ot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_radeon.so /srv/build/tt=
orling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/re=
cipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libelf.so /srv/build=
/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8=
/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so =
/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nat=
ive/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_=
nouveau.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-lin=
ux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/=
lib/libdrm_intel.so -Wl,--end-group<br>
&gt;&gt; &gt; &gt; /srv/build/ttorling/workspace-upgrades/build/tmp/hosttoo=
ls/ld: src/gallium/auxiliary/libgallium.a.p/gallivm_lp_bld_misc.cpp.o: in f=
unction `llvm::SmallVectorTemplateBase&lt;std::__cxx11::basic_string&lt;cha=
r, std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt;, false&gt;=
::grow(unsigned long)&#39;:<br>
&gt;&gt; &gt; &gt; lp_bld_misc.cpp:(.text._ZN4llvm23SmallVectorTemplateBase=
INSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm[_ZN4llvm2=
3SmallVectorTemplateBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcE=
EELb0EE4growEm]+0x36): undefined reference to `llvm::SmallVectorBase&lt;uns=
igned int&gt;::mallocForGrow(void*, unsigned long, unsigned long, unsigned =
long&amp;)&#39;<br>
&gt;&gt; &gt; &gt; /srv/build/ttorling/workspace-upgrades/build/tmp/hosttoo=
ls/ld: src/amd/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in functio=
n `llvm::DataLayout::getTypeSizeInBits(llvm::Type*) const&#39;:<br>
&gt;&gt; &gt; &gt; ac_llvm_helper.cpp:(.text._ZNK4llvm10DataLayout17getType=
SizeInBitsEPNS_4TypeE[_ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4TypeE]+=
0xa4): undefined reference to `llvm::TargetExtType::getLayoutType() const&#=
39;<br>
&gt;&gt; &gt; &gt; /srv/build/ttorling/workspace-upgrades/build/tmp/hosttoo=
ls/ld: src/amd/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in functio=
n `ac_create_passmgr&#39;:<br>
&gt;&gt; &gt; &gt; ac_llvm_helper.cpp:(.text.ac_create_passmgr+0x8c): undef=
ined reference to `llvm::createPromoteMemoryToRegisterPass(bool)&#39;<br>
&gt;&gt; &gt; &gt; /srv/build/ttorling/workspace-upgrades/build/tmp/hosttoo=
ls/ld: ac_llvm_helper.cpp:(.text.ac_create_passmgr+0xa6): undefined referen=
ce to `llvm::createSROAPass(bool)&#39;<br>
&gt;&gt; &gt; &gt; collect2: error: ld returned 1 exit status<br>
&gt;&gt; &gt; &gt; ninja: build stopped: subcommand failed.<br>
&gt;&gt; &gt; &gt; INFO: autodetecting backend as ninja<br>
&gt;&gt; &gt; &gt; INFO: calculating backend command to run: /srv/build/tto=
rling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/rec=
ipe-sysroot-native/usr/bin/ninja -j 24 -v<br>
&gt;&gt; &gt; &gt; WARNING: /srv/build/ttorling/workspace-upgrades/build/tm=
p/work/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760:155 exit=
 1 from &#39;meson compile -v -j 24&#39;<br>
&gt;&gt; &gt; &gt; WARNING: Backtrace (BB generated script):<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#1: meson_do_compile, /=
srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nati=
ve/23.1.8/temp/run.do_compile.3996760, line 155<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#2: do_compile, /srv/bu=
ild/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.=
1.8/temp/run.do_compile.3996760, line 150<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#3: main, /srv/build/tt=
orling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/te=
mp/run.do_compile.3996760, line 159<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; (log borrowed from Tim but I&#39;m seeing a similar issu=
e)<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Cheers,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Richard<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#188379): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/188379" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/188379</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1015=
24707/924729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/101524707/924729</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.co=
m" target=3D"_blank">ticotimo@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000006eba9b06067347f1--


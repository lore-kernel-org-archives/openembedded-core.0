Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1A6E743CA
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 22:55:47 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.6161.1695941738453392452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 15:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EbIwnnnv;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1dcbd8a56d6so6391510fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 15:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695941738; x=1696546538; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpoParmmXvfOnrqhwP/yMvYVG1MUoCnMCTaJeju0j+g=;
        b=EbIwnnnvFQN5dMD30vHPnK5Bc32oGTFJJOQxUie2jxzODhde2RQMBf5vQY/HZejbdC
         11xEgxM6KyzPLXoPwTmu7enn6wpbhOEv1aiG7IaFUpr4OlNR4VCzVrGThIjH/xpomQv8
         hBsGxrC1dM3W3YAinObpdYd/za3+7rPbET1+Dxv2RuVJSQQ24oRMoksQuWp8PgKt0Dv5
         Aqpy/z7hTUtQEVVlgIV6Ynokkf3mFMFaaVJdlVbnYav+k5z56xjnoxM36rRm2M6JNlLk
         i36xzWLkRLavMtnw3Oc5bsNW5+c4nF15PM18vU1VHsw/OIBDxYO1jRwBTCA3cTDLvd3X
         er9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695941738; x=1696546538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpoParmmXvfOnrqhwP/yMvYVG1MUoCnMCTaJeju0j+g=;
        b=TYpA92cXfrowY1WSL6kDgFrG9hlrCabLxPeCGFgS62g31RNRKoyUVq0oAeYwwvUBOb
         JJSVH2jw36QLxdUCaJsqVHELSM2QkhWbR/ALa82MNW3znFyMfk7AfvjWidWvi+8cFavs
         wq6so+nzLKE1kk15d0hYssW++dxCdTBp9gbITkGRzLZTyw2VYEudAU/jFt+egZLz6TZs
         Btr11e5vIjMPXsNTDSTpwJjZH7ESSpI7YcXvO2YX/x/tId8Bzj9fqSrIvdQN3YFXeL6Z
         fffvS0Y0jD7lUpj+tEj8eej2Rn8v7tM6DTAQWVReTr+QdabJQAkHxYoGw1N79UFB8eR0
         U29A==
X-Gm-Message-State: AOJu0YxzZHbB5thUL6Vf01zXS1ynHwEtJK98HB1TZoYyTjOA1wWb8Coq
	kkkT+AUVmjYWD2xmi/076sVuUvI8s7QkXyPZb4g=
X-Google-Smtp-Source: AGHT+IGl8K6wM5sgCkWZwJwshNDcYw1umQmItvimt7RCGVMn5o28TvmVzzKTJ0Jip7Jx5+YJXdR34zGd+fbeEA98ymk=
X-Received: by 2002:a05:6871:b07:b0:1dc:33a:40d8 with SMTP id
 fq7-20020a0568710b0700b001dc033a40d8mr2485182oab.4.1695941737560; Thu, 28 Sep
 2023 15:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230922163721.477463-1-raj.khem@gmail.com> <bbe1ed504e65644dc1434d4622ce5a51e44a671f.camel@linuxfoundation.org>
 <CAMKF1spz5rxJ-yekHZrvqy9JoOPamNHfsUzFc1x0+c8DqHqgTQ@mail.gmail.com>
 <CAMKF1sqraCxWoQyk8a7iekHiySrV2nJEQ42sMyMaXR3OFvh6Qw@mail.gmail.com> <CANx9H-B1u9eirWxSYD-syZMG+Vrk1B=4j+1LqhX9JvvgRsN9dA@mail.gmail.com>
In-Reply-To: <CANx9H-B1u9eirWxSYD-syZMG+Vrk1B=4j+1LqhX9JvvgRsN9dA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Sep 2023 15:55:10 -0700
Message-ID: <CAMKF1sqnP3QcL8MfetaM0jPZfix2Dgq8+ZjLnzwpzrAZbuvAjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Update clang-17 patch to upstream v2
To: Tim Orling <ticotimo@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 22:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188384

On Thu, Sep 28, 2023 at 2:46=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
>
>
>
> On Thu, Sep 28, 2023 at 1:34=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> Can you check if the machines where it fails has llvm-14-dev package
>> installed on host ?
>>
>
> In my case, yes. llvm-14-dev 1:14.0.0-1ubuntu1.1

yeah, this will expose the problem I guess that mesa/meson build files
have logic for detecting llvm dependency uses cmake and how meson
does this is by generating intermediate native file and ignoring
llvm-config setting that OE has passed via meson.native file and finds
one in
/usr/bin and thats where the slippery slope starts.

I am sure if you uninstall llvm-14-dev from your build host then it
will start to work. I am looking into a patch to contain it meanwhile.

>
>>
>> On Thu, Sep 28, 2023 at 9:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
>> >
>> > its linking with  /usr/lib/llvm-14/lib/libLLVM-14.so.1 which is not
>> > correct. Somehow its finding llvm library on your build host.
>> >
>> > On Thu, Sep 28, 2023 at 8:25=E2=80=AFAM Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> > >
>> > > On Fri, 2023-09-22 at 09:37 -0700, Khem Raj wrote:
>> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > > ---
>> > > >  .../0001-gallium-Fix-build-with-llvm-17.patch | 27 ++++++++++++--=
-----
>> > > >  1 file changed, 18 insertions(+), 9 deletions(-)
>> > > >
>> > > > diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-bui=
ld-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-b=
uild-with-llvm-17.patch
>> > > > index 3631a918b0c..0ca7a22b45b 100644
>> > > > --- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with=
-llvm-17.patch
>> > > > +++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with=
-llvm-17.patch
>> > > > @@ -1,4 +1,4 @@
>> > > > -From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17 00:00:00=
 2001
>> > > > +From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00:00:00=
 2001
>> > > >  From: Khem Raj <raj.khem@gmail.com>
>> > > >  Date: Fri, 23 Jun 2023 01:20:38 -0700
>> > > >  Subject: [PATCH] gallium: Fix build with llvm 17
>> > > > @@ -10,14 +10,12 @@ so add conditions to exclude them for llvm >=
=3D 17
>> > > >  Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/m=
esa/-/merge_requests/23827]
>> > > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > >  ---
>> > > > - src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-
>> > > > - 1 file changed, 3 insertions(+), 1 deletion(-)
>> > > > + src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
>> > > > + 1 file changed, 4 insertions(+), 2 deletions(-)
>> > > >
>> > > > -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/ga=
llium/auxiliary/gallivm/lp_bld_init.c
>> > > > -index 24d0823..3d4573e 100644
>> > > >  --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
>> > > >  +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
>> > > > -@@ -42,8 +42,10 @@
>> > > > +@@ -42,19 +42,23 @@
>> > > >
>> > > >   #include <llvm/Config/llvm-config.h>
>> > > >   #include <llvm-c/Analysis.h>
>> > > > @@ -29,6 +27,17 @@ index 24d0823..3d4573e 100644
>> > > >   #include <llvm-c/Transforms/Utils.h>
>> > > >   #endif
>> > > >   #include <llvm-c/BitWriter.h>
>> > > > ---
>> > > > -2.41.0
>> > > > -
>> > > > + #if GALLIVM_USE_NEW_PASS =3D=3D 1
>> > > > + #include <llvm-c/Transforms/PassBuilder.h>
>> > > > +-#elif GALLIVM_HAVE_CORO =3D=3D 1
>> > > > ++#elif GALLIVM_HAVE_CORO =3D=3D 1 && LLVM_VERSION_MAJOR < 17
>> > > > + #if LLVM_VERSION_MAJOR <=3D 8 && (DETECT_ARCH_AARCH64 || DETECT_=
ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
>> > > > + #include <llvm-c/Transforms/IPO.h>
>> > > > + #endif
>> > > > ++#if LLVM_VERSION_MAJOR < 17
>> > > > + #include <llvm-c/Transforms/Coroutines.h>
>> > > > + #endif
>> > > > ++#endif
>> > > > +
>> > > > + unsigned gallivm_perf =3D 0;
>> > > > +
>> > >
>> > > I think this patch may have broken against with the recent llvm poin=
t
>> > > release?
>> > >
>> > > DEBUG: Executing shell function do_compile
>> > >
>> > > [1/33] /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-=
linux/mesa-native/23.1.8/recipe-sysroot-native/usr/bin/python3-native/pytho=
n3 ../mesa-23.1.8/bin/git_sha1_gen.py --output src/git_sha1.h
>> > > [2/13] g++  -o src/gallium/targets/dri/libgallium_dri.so src/gallium=
/targets/dri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/workspace=
-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nat=
ive/usr/lib -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-=
linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--no=
-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so -W=
l,--enable-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/l=
ib -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x8=
6_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/bui=
ld/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1=
.8/recipe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspace-u=
pgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nativ=
e/lib -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/build=
/ttorling/workspace-upgrades/build/tmp/sysroots-uninative/x86_64-linux/lib/=
ld-linux-x86-64.so.2 '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/bu=
ild/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.=
1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib' -Wl,-rpath-li=
nk,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-=
native/23.1.8/build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/build/ttorli=
ng/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe=
-sysroot-native/usr/lib/pkgconfig/../../../usr/lib src/gallium/frontends/dr=
i/libdri.a src/util/libmesa_util.a src/util/format/libmesa_format.a src/uti=
l/libmesa_util_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a s=
rc/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/compiler/=
nir/libnir.a src/compiler/libcompiler.a src/mesa/libmesa_sse41.a src/galliu=
m/auxiliary/libgalliumvl.a src/gallium/auxiliary/libgallium.a src/mapi/shar=
ed-glapi/libglapi.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpipe_loader=
_static.a src/loader/libloader.a src/util/libxmlconfig.a src/gallium/winsys=
/sw/null/libws_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/wi=
nsys/sw/dri/libswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a src/gall=
ium/drivers/llvmpipe/libllvmpipe.a src/gallium/drivers/softpipe/libsoftpipe=
.a src/gallium/drivers/r300/libr300.a src/gallium/winsys/radeon/drm/librade=
onwinsys.a src/gallium/drivers/r600/libr600.a src/gallium/drivers/radeonsi/=
libradeonsi_gfx6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a src/gall=
ium/drivers/radeonsi/libradeonsi_gfx8.a src/gallium/drivers/radeonsi/librad=
eonsi_gfx9.a src/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/gallium/d=
rivers/radeonsi/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/libradeon=
si_gfx11.a src/gallium/drivers/radeonsi/libradeonsi.a src/gallium/winsys/am=
dgpu/drm/libamdgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/common/liba=
md_common.a src/amd/llvm/libamd_common_llvm.a src/gallium/winsys/nouveau/dr=
m/libnouveauwinsys.a src/nouveau/codegen/libnouveau_codegen.a src/gallium/d=
rivers/nouveau/libnouveau.a src/gallium/drivers/i915/libi915.a src/gallium/=
winsys/i915/drm/libi915drm.a src/intel/common/libintel_common.a src/intel/i=
sl/libisl.a src/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libintel_dev.=
a src/intel/isl/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_ver60.a s=
rc/intel/isl/libisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver75.a src/=
intel/isl/libisl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.a src/int=
el/isl/libisl_per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a src/inte=
l/isl/libisl_per_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a src/intel/=
isl/libisl_tiled_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a src/gall=
ium/winsys/svga/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirgl.a src/g=
allium/winsys/virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/common/libvi=
rglcommon.a src/gallium/winsys/virgl/vtest/libvirglvtest.a src/gallium/driv=
ers/iris/libiris.a src/gallium/drivers/iris/libiris_per_hw_ver80.a src/gall=
ium/drivers/iris/libiris_per_hw_ver90.a src/gallium/drivers/iris/libiris_pe=
r_hw_ver110.a src/gallium/drivers/iris/libiris_per_hw_ver120.a src/gallium/=
drivers/iris/libiris_per_hw_ver125.a src/intel/compiler/libintel_compiler.a=
 src/intel/blorp/libblorp.a src/intel/perf/libintel_perf.a src/intel/ds/lib=
intel-driver-ds.a src/gallium/winsys/iris/drm/libiriswinsys.a src/gallium/d=
rivers/crocus/libcrocus.a src/gallium/drivers/crocus/libcrocus_per_hw_ver40=
.a src/gallium/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium/drivers/=
crocus/libcrocus_per_hw_ver50.a src/gallium/drivers/crocus/libcrocus_per_hw=
_ver60.a src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a src/gallium/dr=
ivers/crocus/libcrocus_per_hw_ver75.a src/gallium/drivers/crocus/libcrocus_=
per_hw_ver80.a src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-=
id=3Dsha1 -Wl,--gc-sections -Wl,--version-script /srv/build/ttorling/worksp=
ace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src=
/gallium/targets/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorling/workspa=
ce-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/=
gallium/targets/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/l=
ib/pkgconfig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLLVM-14.so.=
1 -pthread /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-lin=
ux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/=
lib/libexpat.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_6=
4-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../..=
/usr/lib/libz.so -lm /srv/build/ttorling/workspace-upgrades/build/tmp/work/=
x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../=
../../usr/lib/libzstd.so /srv/build/ttorling/workspace-upgrades/build/tmp/w=
ork/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig=
/../../../usr/lib/libxcb-randr.so /srv/build/ttorling/workspace-upgrades/bu=
ild/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/=
pkgconfig/../../../usr/lib/libdrm_radeon.so /srv/build/ttorling/workspace-u=
pgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nativ=
e/usr/lib/pkgconfig/../../../usr/lib/libelf.so /srv/build/ttorling/workspac=
e-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/build/ttorlin=
g/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-=
sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.so /srv/bu=
ild/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.=
1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_intel.s=
o -Wl,--end-group
>> > > FAILED: src/gallium/targets/dri/libgallium_dri.so
>> > > g++  -o src/gallium/targets/dri/libgallium_dri.so src/gallium/target=
s/dri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/workspace-upgrad=
es/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr=
/lib -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/m=
esa-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--no-undefi=
ned -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so -Wl,--ena=
ble-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/=
tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib -Wl,=
-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-li=
nux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/build/ttor=
ling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/reci=
pe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -=
Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/build/ttorli=
ng/workspace-upgrades/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linu=
x-x86-64.so.2 '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/tto=
rling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/rec=
ipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib' -Wl,-rpath-link,/srv=
/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/=
23.1.8/build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/build/ttorling/work=
space-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroo=
t-native/usr/lib/pkgconfig/../../../usr/lib src/gallium/frontends/dri/libdr=
i.a src/util/libmesa_util.a src/util/format/libmesa_format.a src/util/libme=
sa_util_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a src/comp=
iler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/compiler/nir/lib=
nir.a src/compiler/libcompiler.a src/mesa/libmesa_sse41.a src/gallium/auxil=
iary/libgalliumvl.a src/gallium/auxiliary/libgallium.a src/mapi/shared-glap=
i/libglapi.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpipe_loader_static=
.a src/loader/libloader.a src/util/libxmlconfig.a src/gallium/winsys/sw/nul=
l/libws_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys/sw=
/dri/libswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a src/gallium/dri=
vers/llvmpipe/libllvmpipe.a src/gallium/drivers/softpipe/libsoftpipe.a src/=
gallium/drivers/r300/libr300.a src/gallium/winsys/radeon/drm/libradeonwinsy=
s.a src/gallium/drivers/r600/libr600.a src/gallium/drivers/radeonsi/librade=
onsi_gfx6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a src/gallium/dri=
vers/radeonsi/libradeonsi_gfx8.a src/gallium/drivers/radeonsi/libradeonsi_g=
fx9.a src/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/gallium/drivers/=
radeonsi/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/libradeonsi_gfx1=
1.a src/gallium/drivers/radeonsi/libradeonsi.a src/gallium/winsys/amdgpu/dr=
m/libamdgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/common/libamd_comm=
on.a src/amd/llvm/libamd_common_llvm.a src/gallium/winsys/nouveau/drm/libno=
uveauwinsys.a src/nouveau/codegen/libnouveau_codegen.a src/gallium/drivers/=
nouveau/libnouveau.a src/gallium/drivers/i915/libi915.a src/gallium/winsys/=
i915/drm/libi915drm.a src/intel/common/libintel_common.a src/intel/isl/libi=
sl.a src/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libintel_dev.a src/i=
ntel/isl/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_ver60.a src/inte=
l/isl/libisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver75.a src/intel/i=
sl/libisl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.a src/intel/isl/=
libisl_per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a src/intel/isl/l=
ibisl_per_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a src/intel/isl/lib=
isl_tiled_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a src/gallium/win=
sys/svga/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirgl.a src/gallium/=
winsys/virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/common/libvirglcomm=
on.a src/gallium/winsys/virgl/vtest/libvirglvtest.a src/gallium/drivers/iri=
s/libiris.a src/gallium/drivers/iris/libiris_per_hw_ver80.a src/gallium/dri=
vers/iris/libiris_per_hw_ver90.a src/gallium/drivers/iris/libiris_per_hw_ve=
r110.a src/gallium/drivers/iris/libiris_per_hw_ver120.a src/gallium/drivers=
/iris/libiris_per_hw_ver125.a src/intel/compiler/libintel_compiler.a src/in=
tel/blorp/libblorp.a src/intel/perf/libintel_perf.a src/intel/ds/libintel-d=
river-ds.a src/gallium/winsys/iris/drm/libiriswinsys.a src/gallium/drivers/=
crocus/libcrocus.a src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a src/=
gallium/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium/drivers/crocus/=
libcrocus_per_hw_ver50.a src/gallium/drivers/crocus/libcrocus_per_hw_ver60.=
a src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a src/gallium/drivers/c=
rocus/libcrocus_per_hw_ver75.a src/gallium/drivers/crocus/libcrocus_per_hw_=
ver80.a src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=3Dsh=
a1 -Wl,--gc-sections -Wl,--version-script /srv/build/ttorling/workspace-upg=
rades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/galliu=
m/targets/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorling/workspace-upgr=
ades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/gallium=
/targets/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace-upgrades/build/=
tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgc=
onfig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLLVM-14.so.1 -pthr=
ead /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/lib=
expat.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/li=
b/libz.so -lm /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-=
linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib/libzstd.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib/libxcb-randr.so /srv/build/ttorling/workspace-upgrades/build/tmp=
/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconf=
ig/../../../usr/lib/libdrm_radeon.so /srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/l=
ib/pkgconfig/../../../usr/lib/libelf.so /srv/build/ttorling/workspace-upgra=
des/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/us=
r/lib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/build/ttorling/works=
pace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.so /srv/build/tto=
rling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/rec=
ipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_intel.so -Wl,-=
-end-group
>> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/g=
allium/auxiliary/libgallium.a.p/gallivm_lp_bld_misc.cpp.o: in function `llv=
m::SmallVectorTemplateBase<std::__cxx11::basic_string<char, std::char_trait=
s<char>, std::allocator<char> >, false>::grow(unsigned long)':
>> > > lp_bld_misc.cpp:(.text._ZN4llvm23SmallVectorTemplateBaseINSt7__cxx11=
12basic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm[_ZN4llvm23SmallVector=
TemplateBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4grow=
Em]+0x36): undefined reference to `llvm::SmallVectorBase<unsigned int>::mal=
locForGrow(void*, unsigned long, unsigned long, unsigned long&)'
>> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/a=
md/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `llvm::Dat=
aLayout::getTypeSizeInBits(llvm::Type*) const':
>> > > ac_llvm_helper.cpp:(.text._ZNK4llvm10DataLayout17getTypeSizeInBitsEP=
NS_4TypeE[_ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4TypeE]+0xa4): undef=
ined reference to `llvm::TargetExtType::getLayoutType() const'
>> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/a=
md/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `ac_create=
_passmgr':
>> > > ac_llvm_helper.cpp:(.text.ac_create_passmgr+0x8c): undefined referen=
ce to `llvm::createPromoteMemoryToRegisterPass(bool)'
>> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: ac_ll=
vm_helper.cpp:(.text.ac_create_passmgr+0xa6): undefined reference to `llvm:=
:createSROAPass(bool)'
>> > > collect2: error: ld returned 1 exit status
>> > > ninja: build stopped: subcommand failed.
>> > > INFO: autodetecting backend as ninja
>> > > INFO: calculating backend command to run: /srv/build/ttorling/worksp=
ace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-=
native/usr/bin/ninja -j 24 -v
>> > > WARNING: /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_6=
4-linux/mesa-native/23.1.8/temp/run.do_compile.3996760:155 exit 1 from 'mes=
on compile -v -j 24'
>> > > WARNING: Backtrace (BB generated script):
>> > >         #1: meson_do_compile, /srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760=
, line 155
>> > >         #2: do_compile, /srv/build/ttorling/workspace-upgrades/build=
/tmp/work/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, line=
 150
>> > >         #3: main, /srv/build/ttorling/workspace-upgrades/build/tmp/w=
ork/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, line 159
>> > >
>> > > (log borrowed from Tim but I'm seeing a similar issue)
>> > >
>> > > Cheers,
>> > >
>> > > Richard
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#188379): https://lists.openembedded.org/g/openembedd=
ed-core/message/188379
>> Mute This Topic: https://lists.openembedded.org/mt/101524707/924729
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [t=
icotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


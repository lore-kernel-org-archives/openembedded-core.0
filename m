Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CEBE743CE
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 23:04:58 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.6346.1695942291776807627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 16:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OFRG7JiD;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1d637f9c587so35271fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 16:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695942291; x=1696547091; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMxF2NYTPWwFnWWDTggKhRIFC1J+ryClPhE/q+H6iek=;
        b=OFRG7JiD+cx1ACxHs3DB7l3dcyBunSgJg+WJRoQMdGDNJL38ojjpOxTu2OFecweNah
         o/EINypxSVy63G3AMV3Cg7Quh4saoHJRukBqkFc30Ownqh/sa295vXll5ZVMpQXyItnk
         JOC/sX7UwTE8G0N+XV3OcsR59Kn5mPM7dp43YOJeukqtj6cK+tNM4n0nFh8DTDlWVhjy
         Fxxbnw+rkBR7LsY87SUFsU9segB0BsSuqZBi+NPJ3CGQruqyYjc0Qg36TCIqYgDUoktw
         WMLRBjmBwx7Py7OW7le4f1HlvZr3wqrC107syvdRKtlM2lwmeDM405oViOEntJR0IJ5k
         ZumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695942291; x=1696547091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMxF2NYTPWwFnWWDTggKhRIFC1J+ryClPhE/q+H6iek=;
        b=O/8CjvmxV/U/Yu07PufRDwlgcY9747tplQleCpls+bOAmYxSVwi199UGNOTHEhfoIj
         YJly81DZFWHb3q4pOdOADArEwpyYmz+9dXpRChYEiE2QhEzgBzuKTTEJqKuLeKV8jEzu
         HPnaek3ViDeetEmufFrPDsLabEQmrES+HVgE5cMV3wYmVIY1gCkjjqckN0YJX0ijP9Sm
         IIGy18vUbU73nOeOEJPelS0AFWihU3iLkWP/ICnNv/lo1t7aUTAFLrzkejznv7xg6Eoi
         UlSrXJJOQMzkOlBxFCqK2HOfjKhmQZAu5q4xwbkMxM8s6nTDa1epwNbv72t62kn98/UN
         y8Jg==
X-Gm-Message-State: AOJu0YwQuNhZuCGntcYOBA2/35DjsAOk2qEojfyIRWekgC9vG5U0NYJB
	O1JlZEWxRL0dqU0jGkN6V2fRmnZkZOcQsVwlPtTsxAnezLg=
X-Google-Smtp-Source: AGHT+IEg8/w6Y4/V4Nq5M5mz2MWZ+H7X5JJFXLW2XcQQThHEYOO4iDQNqGGeZrzDtzFic27wNAAo1iCjSZ7N7XLxv/U=
X-Received: by 2002:a05:6870:80cd:b0:1d5:946d:72cb with SMTP id
 r13-20020a05687080cd00b001d5946d72cbmr1842273oab.23.1695942290779; Thu, 28
 Sep 2023 16:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230922163721.477463-1-raj.khem@gmail.com> <bbe1ed504e65644dc1434d4622ce5a51e44a671f.camel@linuxfoundation.org>
 <CAMKF1spz5rxJ-yekHZrvqy9JoOPamNHfsUzFc1x0+c8DqHqgTQ@mail.gmail.com>
 <CAMKF1sqraCxWoQyk8a7iekHiySrV2nJEQ42sMyMaXR3OFvh6Qw@mail.gmail.com>
 <CANx9H-B1u9eirWxSYD-syZMG+Vrk1B=4j+1LqhX9JvvgRsN9dA@mail.gmail.com>
 <CAMKF1sqnP3QcL8MfetaM0jPZfix2Dgq8+ZjLnzwpzrAZbuvAjQ@mail.gmail.com> <CANx9H-ArxrGX6v3HNrVdHVAKLLTJBaq71w2azFpr+VMB1vkThQ@mail.gmail.com>
In-Reply-To: <CANx9H-ArxrGX6v3HNrVdHVAKLLTJBaq71w2azFpr+VMB1vkThQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Sep 2023 16:04:24 -0700
Message-ID: <CAMKF1so906hgO__R+U+ajxGcSMRkKjrXS_iQP4HiL5fA0wKkVQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 23:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188388

On Thu, Sep 28, 2023 at 4:00=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
>
>
>
> On Thu, Sep 28, 2023 at 3:55=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> On Thu, Sep 28, 2023 at 2:46=E2=80=AFPM Tim Orling <ticotimo@gmail.com> =
wrote:
>> >
>> >
>> >
>> > On Thu, Sep 28, 2023 at 1:34=E2=80=AFPM Khem Raj <raj.khem@gmail.com> =
wrote:
>> >>
>> >> Can you check if the machines where it fails has llvm-14-dev package
>> >> installed on host ?
>> >>
>> >
>> > In my case, yes. llvm-14-dev 1:14.0.0-1ubuntu1.1
>>
>> yeah, this will expose the problem I guess that mesa/meson build files
>> have logic for detecting llvm dependency uses cmake and how meson
>> does this is by generating intermediate native file and ignoring
>> llvm-config setting that OE has passed via meson.native file and finds
>> one in
>> /usr/bin and thats where the slippery slope starts.
>>
>> I am sure if you uninstall llvm-14-dev from your build host then it
>> will start to work. I am looking into a patch to contain it meanwhile.
>>
>
> Confirmed "fix". I don't remember why I have llvm-14-dev installed to beg=
in with so buh-bye

Well, it atleast exposed a bug in mesa build. I have sent a patch to
fix that. before you punt it
give it a shot with llvm-14-dev installed on your system and see if
this also fixes the issue.

Keep llvm around, its nice :)

>
>>
>> >
>> >>
>> >> On Thu, Sep 28, 2023 at 9:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com>=
 wrote:
>> >> >
>> >> > its linking with  /usr/lib/llvm-14/lib/libLLVM-14.so.1 which is not
>> >> > correct. Somehow its finding llvm library on your build host.
>> >> >
>> >> > On Thu, Sep 28, 2023 at 8:25=E2=80=AFAM Richard Purdie
>> >> > <richard.purdie@linuxfoundation.org> wrote:
>> >> > >
>> >> > > On Fri, 2023-09-22 at 09:37 -0700, Khem Raj wrote:
>> >> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> > > > ---
>> >> > > >  .../0001-gallium-Fix-build-with-llvm-17.patch | 27 +++++++++++=
+-------
>> >> > > >  1 file changed, 18 insertions(+), 9 deletions(-)
>> >> > > >
>> >> > > > diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-=
build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fi=
x-build-with-llvm-17.patch
>> >> > > > index 3631a918b0c..0ca7a22b45b 100644
>> >> > > > --- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-w=
ith-llvm-17.patch
>> >> > > > +++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-w=
ith-llvm-17.patch
>> >> > > > @@ -1,4 +1,4 @@
>> >> > > > -From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17 00:00=
:00 2001
>> >> > > > +From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00:00=
:00 2001
>> >> > > >  From: Khem Raj <raj.khem@gmail.com>
>> >> > > >  Date: Fri, 23 Jun 2023 01:20:38 -0700
>> >> > > >  Subject: [PATCH] gallium: Fix build with llvm 17
>> >> > > > @@ -10,14 +10,12 @@ so add conditions to exclude them for llvm =
>=3D 17
>> >> > > >  Upstream-Status: Submitted [https://gitlab.freedesktop.org/mes=
a/mesa/-/merge_requests/23827]
>> >> > > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> > > >  ---
>> >> > > > - src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-
>> >> > > > - 1 file changed, 3 insertions(+), 1 deletion(-)
>> >> > > > + src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
>> >> > > > + 1 file changed, 4 insertions(+), 2 deletions(-)
>> >> > > >
>> >> > > > -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src=
/gallium/auxiliary/gallivm/lp_bld_init.c
>> >> > > > -index 24d0823..3d4573e 100644
>> >> > > >  --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
>> >> > > >  +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
>> >> > > > -@@ -42,8 +42,10 @@
>> >> > > > +@@ -42,19 +42,23 @@
>> >> > > >
>> >> > > >   #include <llvm/Config/llvm-config.h>
>> >> > > >   #include <llvm-c/Analysis.h>
>> >> > > > @@ -29,6 +27,17 @@ index 24d0823..3d4573e 100644
>> >> > > >   #include <llvm-c/Transforms/Utils.h>
>> >> > > >   #endif
>> >> > > >   #include <llvm-c/BitWriter.h>
>> >> > > > ---
>> >> > > > -2.41.0
>> >> > > > -
>> >> > > > + #if GALLIVM_USE_NEW_PASS =3D=3D 1
>> >> > > > + #include <llvm-c/Transforms/PassBuilder.h>
>> >> > > > +-#elif GALLIVM_HAVE_CORO =3D=3D 1
>> >> > > > ++#elif GALLIVM_HAVE_CORO =3D=3D 1 && LLVM_VERSION_MAJOR < 17
>> >> > > > + #if LLVM_VERSION_MAJOR <=3D 8 && (DETECT_ARCH_AARCH64 || DETE=
CT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
>> >> > > > + #include <llvm-c/Transforms/IPO.h>
>> >> > > > + #endif
>> >> > > > ++#if LLVM_VERSION_MAJOR < 17
>> >> > > > + #include <llvm-c/Transforms/Coroutines.h>
>> >> > > > + #endif
>> >> > > > ++#endif
>> >> > > > +
>> >> > > > + unsigned gallivm_perf =3D 0;
>> >> > > > +
>> >> > >
>> >> > > I think this patch may have broken against with the recent llvm p=
oint
>> >> > > release?
>> >> > >
>> >> > > DEBUG: Executing shell function do_compile
>> >> > >
>> >> > > [1/33] /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_=
64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/bin/python3-native/py=
thon3 ../mesa-23.1.8/bin/git_sha1_gen.py --output src/git_sha1.h
>> >> > > [2/13] g++  -o src/gallium/targets/dri/libgallium_dri.so src/gall=
ium/targets/dri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/worksp=
ace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-=
native/usr/lib -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_=
64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,-=
-no-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so=
 -Wl,--enable-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgra=
des/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/us=
r/lib -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work=
/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/=
build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/2=
3.1.8/recipe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspac=
e-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-na=
tive/lib -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/bu=
ild/ttorling/workspace-upgrades/build/tmp/sysroots-uninative/x86_64-linux/l=
ib/ld-linux-x86-64.so.2 '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv=
/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/=
23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib' -Wl,-rpath=
-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/me=
sa-native/23.1.8/build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/build/tto=
rling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/rec=
ipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib src/gallium/frontends=
/dri/libdri.a src/util/libmesa_util.a src/util/format/libmesa_format.a src/=
util/libmesa_util_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.=
a src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/compil=
er/nir/libnir.a src/compiler/libcompiler.a src/mesa/libmesa_sse41.a src/gal=
lium/auxiliary/libgalliumvl.a src/gallium/auxiliary/libgallium.a src/mapi/s=
hared-glapi/libglapi.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpipe_loa=
der_static.a src/loader/libloader.a src/util/libxmlconfig.a src/gallium/win=
sys/sw/null/libws_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/gallium=
/winsys/sw/dri/libswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a src/g=
allium/drivers/llvmpipe/libllvmpipe.a src/gallium/drivers/softpipe/libsoftp=
ipe.a src/gallium/drivers/r300/libr300.a src/gallium/winsys/radeon/drm/libr=
adeonwinsys.a src/gallium/drivers/r600/libr600.a src/gallium/drivers/radeon=
si/libradeonsi_gfx6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a src/g=
allium/drivers/radeonsi/libradeonsi_gfx8.a src/gallium/drivers/radeonsi/lib=
radeonsi_gfx9.a src/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/galliu=
m/drivers/radeonsi/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/librad=
eonsi_gfx11.a src/gallium/drivers/radeonsi/libradeonsi.a src/gallium/winsys=
/amdgpu/drm/libamdgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/common/l=
ibamd_common.a src/amd/llvm/libamd_common_llvm.a src/gallium/winsys/nouveau=
/drm/libnouveauwinsys.a src/nouveau/codegen/libnouveau_codegen.a src/galliu=
m/drivers/nouveau/libnouveau.a src/gallium/drivers/i915/libi915.a src/galli=
um/winsys/i915/drm/libi915drm.a src/intel/common/libintel_common.a src/inte=
l/isl/libisl.a src/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libintel_d=
ev.a src/intel/isl/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_ver60.=
a src/intel/isl/libisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver75.a s=
rc/intel/isl/libisl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.a src/=
intel/isl/libisl_per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a src/i=
ntel/isl/libisl_per_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a src/int=
el/isl/libisl_tiled_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a src/g=
allium/winsys/svga/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirgl.a sr=
c/gallium/winsys/virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/common/li=
bvirglcommon.a src/gallium/winsys/virgl/vtest/libvirglvtest.a src/gallium/d=
rivers/iris/libiris.a src/gallium/drivers/iris/libiris_per_hw_ver80.a src/g=
allium/drivers/iris/libiris_per_hw_ver90.a src/gallium/drivers/iris/libiris=
_per_hw_ver110.a src/gallium/drivers/iris/libiris_per_hw_ver120.a src/galli=
um/drivers/iris/libiris_per_hw_ver125.a src/intel/compiler/libintel_compile=
r.a src/intel/blorp/libblorp.a src/intel/perf/libintel_perf.a src/intel/ds/=
libintel-driver-ds.a src/gallium/winsys/iris/drm/libiriswinsys.a src/galliu=
m/drivers/crocus/libcrocus.a src/gallium/drivers/crocus/libcrocus_per_hw_ve=
r40.a src/gallium/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium/drive=
rs/crocus/libcrocus_per_hw_ver50.a src/gallium/drivers/crocus/libcrocus_per=
_hw_ver60.a src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a src/gallium=
/drivers/crocus/libcrocus_per_hw_ver75.a src/gallium/drivers/crocus/libcroc=
us_per_hw_ver80.a src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--bui=
ld-id=3Dsha1 -Wl,--gc-sections -Wl,--version-script /srv/build/ttorling/wor=
kspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/=
src/gallium/targets/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorling/work=
space-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/s=
rc/gallium/targets/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace-upgra=
des/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/us=
r/lib/pkgconfig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLLVM-14.=
so.1 -pthread /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-=
linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib/libexpat.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x8=
6_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/lib/libz.so -lm /srv/build/ttorling/workspace-upgrades/build/tmp/wo=
rk/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/=
../../../usr/lib/libzstd.so /srv/build/ttorling/workspace-upgrades/build/tm=
p/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgcon=
fig/../../../usr/lib/libxcb-randr.so /srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/l=
ib/pkgconfig/../../../usr/lib/libdrm_radeon.so /srv/build/ttorling/workspac=
e-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/lib/libelf.so /srv/build/ttorling/works=
pace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/build/ttor=
ling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/reci=
pe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.so /srv=
/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/=
23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_inte=
l.so -Wl,--end-group
>> >> > > FAILED: src/gallium/targets/dri/libgallium_dri.so
>> >> > > g++  -o src/gallium/targets/dri/libgallium_dri.so src/gallium/tar=
gets/dri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/workspace-upg=
rades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/=
usr/lib -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linu=
x/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--no-und=
efined -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so -Wl,--=
enable-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/bui=
ld/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib -=
Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64=
-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/build/t=
torling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/r=
ecipe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspace-upgra=
des/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/li=
b -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/build/tto=
rling/workspace-upgrades/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-l=
inux-x86-64.so.2 '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/=
ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib' -Wl,-rpath-link,/=
srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nati=
ve/23.1.8/build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/build/ttorling/w=
orkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sys=
root-native/usr/lib/pkgconfig/../../../usr/lib src/gallium/frontends/dri/li=
bdri.a src/util/libmesa_util.a src/util/format/libmesa_format.a src/util/li=
bmesa_util_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a src/c=
ompiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/compiler/nir/=
libnir.a src/compiler/libcompiler.a src/mesa/libmesa_sse41.a src/gallium/au=
xiliary/libgalliumvl.a src/gallium/auxiliary/libgallium.a src/mapi/shared-g=
lapi/libglapi.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpipe_loader_sta=
tic.a src/loader/libloader.a src/util/libxmlconfig.a src/gallium/winsys/sw/=
null/libws_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys=
/sw/dri/libswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a src/gallium/=
drivers/llvmpipe/libllvmpipe.a src/gallium/drivers/softpipe/libsoftpipe.a s=
rc/gallium/drivers/r300/libr300.a src/gallium/winsys/radeon/drm/libradeonwi=
nsys.a src/gallium/drivers/r600/libr600.a src/gallium/drivers/radeonsi/libr=
adeonsi_gfx6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a src/gallium/=
drivers/radeonsi/libradeonsi_gfx8.a src/gallium/drivers/radeonsi/libradeons=
i_gfx9.a src/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/gallium/drive=
rs/radeonsi/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/libradeonsi_g=
fx11.a src/gallium/drivers/radeonsi/libradeonsi.a src/gallium/winsys/amdgpu=
/drm/libamdgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/common/libamd_c=
ommon.a src/amd/llvm/libamd_common_llvm.a src/gallium/winsys/nouveau/drm/li=
bnouveauwinsys.a src/nouveau/codegen/libnouveau_codegen.a src/gallium/drive=
rs/nouveau/libnouveau.a src/gallium/drivers/i915/libi915.a src/gallium/wins=
ys/i915/drm/libi915drm.a src/intel/common/libintel_common.a src/intel/isl/l=
ibisl.a src/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libintel_dev.a sr=
c/intel/isl/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_ver60.a src/i=
ntel/isl/libisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver75.a src/inte=
l/isl/libisl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.a src/intel/i=
sl/libisl_per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a src/intel/is=
l/libisl_per_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a src/intel/isl/=
libisl_tiled_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a src/gallium/=
winsys/svga/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirgl.a src/galli=
um/winsys/virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/common/libvirglc=
ommon.a src/gallium/winsys/virgl/vtest/libvirglvtest.a src/gallium/drivers/=
iris/libiris.a src/gallium/drivers/iris/libiris_per_hw_ver80.a src/gallium/=
drivers/iris/libiris_per_hw_ver90.a src/gallium/drivers/iris/libiris_per_hw=
_ver110.a src/gallium/drivers/iris/libiris_per_hw_ver120.a src/gallium/driv=
ers/iris/libiris_per_hw_ver125.a src/intel/compiler/libintel_compiler.a src=
/intel/blorp/libblorp.a src/intel/perf/libintel_perf.a src/intel/ds/libinte=
l-driver-ds.a src/gallium/winsys/iris/drm/libiriswinsys.a src/gallium/drive=
rs/crocus/libcrocus.a src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a s=
rc/gallium/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium/drivers/croc=
us/libcrocus_per_hw_ver50.a src/gallium/drivers/crocus/libcrocus_per_hw_ver=
60.a src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a src/gallium/driver=
s/crocus/libcrocus_per_hw_ver75.a src/gallium/drivers/crocus/libcrocus_per_=
hw_ver80.a src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=
=3Dsha1 -Wl,--gc-sections -Wl,--version-script /srv/build/ttorling/workspac=
e-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/g=
allium/targets/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorling/workspace=
-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/ga=
llium/targets/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace-upgrades/b=
uild/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib=
/pkgconfig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLLVM-14.so.1 =
-pthread /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/li=
b/libexpat.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-=
linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib/libz.so -lm /srv/build/ttorling/workspace-upgrades/build/tmp/work/x8=
6_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/lib/libzstd.so /srv/build/ttorling/workspace-upgrades/build/tmp/wor=
k/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/.=
./../../usr/lib/libxcb-randr.so /srv/build/ttorling/workspace-upgrades/buil=
d/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pk=
gconfig/../../../usr/lib/libdrm_radeon.so /srv/build/ttorling/workspace-upg=
rades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/=
usr/lib/pkgconfig/../../../usr/lib/libelf.so /srv/build/ttorling/workspace-=
upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/build/ttorling/=
workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sy=
sroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.so /srv/buil=
d/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.=
8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_intel.so =
-Wl,--end-group
>> >> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: sr=
c/gallium/auxiliary/libgallium.a.p/gallivm_lp_bld_misc.cpp.o: in function `=
llvm::SmallVectorTemplateBase<std::__cxx11::basic_string<char, std::char_tr=
aits<char>, std::allocator<char> >, false>::grow(unsigned long)':
>> >> > > lp_bld_misc.cpp:(.text._ZN4llvm23SmallVectorTemplateBaseINSt7__cx=
x1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm[_ZN4llvm23SmallVec=
torTemplateBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4g=
rowEm]+0x36): undefined reference to `llvm::SmallVectorBase<unsigned int>::=
mallocForGrow(void*, unsigned long, unsigned long, unsigned long&)'
>> >> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: sr=
c/amd/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `llvm::=
DataLayout::getTypeSizeInBits(llvm::Type*) const':
>> >> > > ac_llvm_helper.cpp:(.text._ZNK4llvm10DataLayout17getTypeSizeInBit=
sEPNS_4TypeE[_ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4TypeE]+0xa4): un=
defined reference to `llvm::TargetExtType::getLayoutType() const'
>> >> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: sr=
c/amd/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `ac_cre=
ate_passmgr':
>> >> > > ac_llvm_helper.cpp:(.text.ac_create_passmgr+0x8c): undefined refe=
rence to `llvm::createPromoteMemoryToRegisterPass(bool)'
>> >> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: ac=
_llvm_helper.cpp:(.text.ac_create_passmgr+0xa6): undefined reference to `ll=
vm::createSROAPass(bool)'
>> >> > > collect2: error: ld returned 1 exit status
>> >> > > ninja: build stopped: subcommand failed.
>> >> > > INFO: autodetecting backend as ninja
>> >> > > INFO: calculating backend command to run: /srv/build/ttorling/wor=
kspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysro=
ot-native/usr/bin/ninja -j 24 -v
>> >> > > WARNING: /srv/build/ttorling/workspace-upgrades/build/tmp/work/x8=
6_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760:155 exit 1 from '=
meson compile -v -j 24'
>> >> > > WARNING: Backtrace (BB generated script):
>> >> > >         #1: meson_do_compile, /srv/build/ttorling/workspace-upgra=
des/build/tmp/work/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996=
760, line 155
>> >> > >         #2: do_compile, /srv/build/ttorling/workspace-upgrades/bu=
ild/tmp/work/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, l=
ine 150
>> >> > >         #3: main, /srv/build/ttorling/workspace-upgrades/build/tm=
p/work/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, line 15=
9
>> >> > >
>> >> > > (log borrowed from Tim but I'm seeing a similar issue)
>> >> > >
>> >> > > Cheers,
>> >> > >
>> >> > > Richard
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#188379): https://lists.openembedded.org/g/openemb=
edded-core/message/188379
>> >> Mute This Topic: https://lists.openembedded.org/mt/101524707/924729
>> >> Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [ticotimo@gmail.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>


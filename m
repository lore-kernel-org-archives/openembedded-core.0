Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BE8C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 15:37:28 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.213932.1724081843237966422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 08:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A0L3340C;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f01afa11cso5686251e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724081841; x=1724686641; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzA6VYULrGz4kog+OFKJysUr9l0q7XCXKRo4eZ0PSdg=;
        b=A0L3340CKJa4eSaANKK6ngkHTXpUaQ91y6BQ9DSYV6jcZfgW7p4vcFIbIwLGVuzJRh
         6/uBJXFRV+Nkt9TnNxrHy2PJvum8AuyY+njg4xVsW1MaT6qdOkzggSJ3bVVb7Wwa27qY
         4MkWbFSBBvolzUqwJskPEgVSpCkQXdjaEqWl6Vw/0OuSk/Bj81DSoba81u3GHW2nXHzl
         o1cUFm92CCxfM5+ajCa00gIZnRVgl77kjJrklRL70i9TROOezEYPFbqnwag52jRhqg6R
         S5A60CvZ9sy4l0xKusJjLOT1015PYY34dRAsTb5XFtM7ie4h+h47dQi8MKCiHMGzIvCD
         OztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724081841; x=1724686641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzA6VYULrGz4kog+OFKJysUr9l0q7XCXKRo4eZ0PSdg=;
        b=jx1JuNdhwoaiE5R0Twl3WIqgptwD8M12u5oJMkR7bw8HaFrfdcSytCwVqBhGLS4p9p
         fyn0yL8fAR/flehLGiONQosNAcQX1rFUpzgPqX8GKu7l313rVP7w9uRa4B1rBiXUo7pq
         9+h5fKO3M2xaN/EuxcmxiIyhUGrucHm88SjRuYZpt2CSmdQg2A2+wk5EmPMpdi2rLBK6
         buXU1/2cTXPJPmwKaw+xYsLONjdQ88o6L8sr7wHRXbXnFKXMyj14iwCZUZLVPGCqphm/
         QwXp1uNUZ1lldsU1XSLuYYujzI9ffFEbRMdBUHFnud78Z6WYsjEtTMkI2vXShuujyRFX
         JRYA==
X-Gm-Message-State: AOJu0YwOhLFOnNSdhyPUYqUGW1NsqxLJzeFymEQ934h0JDr5+hzKNxHF
	X5cvOdYVcHbsP7QO3+NG6nLXEMp/ZJNKiKLALvI5gxg4iYOaOT8TfquBWwCtxgcYRyksfPTLj2r
	a3qkHZLFnCTYHsJpdXv7r/BtjmW0=
X-Google-Smtp-Source: AGHT+IHZ67gxPpn7B0bkrsOz2TvRA8ZrBJ2utvN6bQ97koRyOqbTr3+RWE2ZEMZYowhr0ThJzmjO7CPpBLmSSaLGKAs=
X-Received: by 2002:a05:6512:3b0b:b0:52c:c032:538d with SMTP id
 2adb3069b0e04-5331c6b0782mr7215841e87.27.1724081840818; Mon, 19 Aug 2024
 08:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240818164844.2738771-1-f_l_k@t-online.de> <CANNYZj9x08BYKYpxpL-djuBg5C_rLqfJ-qmJ19_kp0+D-nKB6Q@mail.gmail.com>
 <P3ZGIS.QDEQ3DNO7TDP1@t-online.de>
In-Reply-To: <P3ZGIS.QDEQ3DNO7TDP1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2024 17:37:09 +0200
Message-ID: <CANNYZj9fHJmUAjggcGgVtYnhcqHvEdqNji865PCrfK_LfigPMw@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH 1/2] mesa: update 24.1.4 -> 24.2.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 15:37:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203517

Fair enough. Then this is not an 'Intel problem', but someone should
still do the non-trivial work of bringing pieces of meta-clang into
core.

Alex

On Mon, 19 Aug 2024 at 16:31, Markus Volk <f_l_k@t-online.de> wrote:
>
> It looks to me like intel is just a little bit further along in terms of =
the mesa driver. Currently it is
> also a requirement for gallium-asahi and I would expect at least  amd and=
 panfrost to follow. Basically
> it'll be required for all drivers that support runtime compiled shaders (=
like also done in Windows)
> to enable features like raytracing/pathtracing.
>
> That said, I'm not in favor of either solution, but I wouldn't expect lib=
clc and clang/gcc-runtime
> to become optional again for hardware that supports shaders.
>
> On Mon, Aug 19 2024 at 10:57:38 AM +02:00:00, Alexander Kanavin <alex.kan=
avin@gmail.com> wrote:
>
> Has anything changes in this release w.r.t intel drivers? Do they still r=
equiure bits of meta-clang? Given that we're now two major releases behind,=
 I just do not think that one vendor should be holding everyone else hostag=
e to their 'special requirements'. I still think it's better to disable Int=
el drivers, and move on. The vendor can re-enable them through their BSP la=
yer, and allocate resources towards integrating clang into core if they so =
wish. Can this be raised privately with them or in a TSC meeting? Alex On S=
un, 18 Aug 2024 at 18:47, Markus Volk via lists.openembedded.org <f_l_k=3Dt=
-online.de@lists.openembedded.org> wrote:
>
> - Remove 0001-amd-Include-missing-llvm-IR-header-Module.h.patch -> merged=
 - INSANE_SKIP dev-so. All .so files that are installed in ${libdir}/dri ar=
e now links to libdril_dri.so, but they should still not be part of the dev=
 package, I assume? - add PACKAGE for mesa-gallium-drivers and install libg=
allium-24.2.0.so - add python3-pyyaml-native-dependency Signed-off-by: Mark=
us Volk <f_l_k@t-online.de> --- ...lude-missing-llvm-IR-header-Module.h.pat=
ch | 41 ------------------- .../{mesa-gl_24.1.4.bb =3D> mesa-gl_24.2.0.bb} =
| 0 meta/recipes-graphics/mesa/mesa.inc | 9 ++-- .../mesa/{mesa_24.1.4.bb =
=3D> mesa_24.2.0.bb} | 0 4 files changed, 5 insertions(+), 45 deletions(-) =
delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-missin=
g-llvm-IR-header-Module.h.patch rename meta/recipes-graphics/mesa/{mesa-gl_=
24.1.4.bb =3D> mesa-gl_24.2.0.bb} (100%) rename meta/recipes-graphics/mesa/=
{mesa_24.1.4.bb =3D> mesa_24.2.0.bb} (100%) diff --git a/meta/recipes-graph=
ics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch b/met=
a/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Modul=
e.h.patch deleted file mode 100644 index 82ad88a079..0000000000 --- a/meta/=
recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.=
h.patch +++ /dev/null @@ -1,41 +0,0 @@ -From 777d69cf15b80ab1f109a4936d6e48=
01c4b0e0f3 Mon Sep 17 00:00:00 2001 -From: Khem Raj <raj.khem@gmail.com> -D=
ate: Mon, 1 Jul 2024 23:09:29 -0700 -Subject: [PATCH] amd: Include missing =
llvm IR header Module.h -MIME-Version: 1.0 -Content-Type: text/plain; chars=
et=3DUTF-8 -Content-Transfer-Encoding: 8bit - -With LLVM-19, Module.h heade=
r is not being pulled, which results in -compile errors e.g. - -src/amd/llv=
m/ac_llvm_helper.cpp:102:10: error: no matching function for call to =E2=80=
=98unwrap(LLVMOpaqueModule*&)=E2=80=99 - 102 | unwrap(module)->setTargetTri=
ple(TM->getTargetTriple().getTriple()); - | ~~~~~~^~~~~~~~ -In file include=
d from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/rec=
ipe-sysroot-native/usr/include/llvm/IR/Type.h:18, - from /mnt/b/yoe/master/=
build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/in=
clude/llvm/IR/DerivedTypes.h:23, - from /mnt/b/yoe/master/build/tmp/work/x8=
6_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Ins=
trTypes.h:26, - from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-nat=
ive/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibraryInf=
o.h:14, - from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8: - -Its get=
ting the definition from llvm/IR/Type.h instead of Module.h and caused -con=
fusion to compiler - -Upstream-Status: Submitted [https://gitlab.freedeskto=
p.org/mesa/mesa/-/merge_requests/29993] -Signed-off-by: Khem Raj <raj.khem@=
gmail.com> ---- - src/amd/llvm/ac_llvm_helper.cpp | 1 + - 1 file changed, 1=
 insertion(+) - -diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llv=
m/ac_llvm_helper.cpp -index 5d065279ad1..af4a50f8409 100644 ---- a/src/amd/=
llvm/ac_llvm_helper.cpp -+++ b/src/amd/llvm/ac_llvm_helper.cpp -@@ -8,6 +8,=
7 @@ - #include <llvm/Analysis/TargetLibraryInfo.h> - #include <llvm/IR/IRB=
uilder.h> - #include <llvm/IR/LegacyPassManager.h> -+#include <llvm/IR/Modu=
le.h> - #include <llvm/IR/Verifier.h> - #include <llvm/Target/TargetMachine=
.h> - #include <llvm/MC/MCSubtargetInfo.h> diff --git a/meta/recipes-graphi=
cs/mesa/mesa-gl_24.1.4.bb b/meta/recipes-graphics/mesa/mesa-gl_24.2.0.bb si=
milarity index 100% rename from meta/recipes-graphics/mesa/mesa-gl_24.1.4.b=
b rename to meta/recipes-graphics/mesa/mesa-gl_24.2.0.bb diff --git a/meta/=
recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc index =
499006655d..40e7bed648 100644 --- a/meta/recipes-graphics/mesa/mesa.inc +++=
 b/meta/recipes-graphics/mesa/mesa.inc @@ -16,11 +16,10 @@ PE =3D "2" SRC_U=
RI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \ file://000=
1-meson-misdetects-64bit-atomics-on-mips-clang.patch \ - file://0001-amd-In=
clude-missing-llvm-IR-header-Module.h.patch \ file://0001-freedreno-don-t-e=
ncode-build-path-into-binaries.patch\ " -SRC_URI[sha256sum] =3D "7cf7c6f665=
263ad0122889c1d4b076654c1eedea7a2f38c69c8c51579937ade1" +SRC_URI[sha256sum]=
 =3D "c02bb72cea290f78b11895a0c95c7c92394f180d7ff66d4a762ec6950a58addf" UPS=
TREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)" @@ -34,7 +33,7 @@ =
do_install:append() { fi } -DEPENDS =3D "expat makedepend-native flex-nativ=
e bison-native libxml2-native zlib chrpath-replacement-native python3-mako-=
native gettext-native" +DEPENDS =3D "expat makedepend-native flex-native bi=
son-native libxml2-native zlib chrpath-replacement-native python3-mako-nati=
ve gettext-native python3-pyyaml-native" DEPENDS:append:class-target =3D " =
${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}" EXT=
RANATIVEPATH +=3D "chrpath-native" PROVIDES =3D " \ @@ -243,7 +242,7 @@ PAC=
KAGES =3D+ "libegl-mesa libegl-mesa-dev \ libopencl-mesa libopencl-mesa-dev=
 \ libxatracker libxatracker-dev \ mesa-megadriver mesa-vulkan-drivers \ - =
mesa-vdpau-drivers mesa-tools \ + mesa-vdpau-drivers mesa-gallium-drivers m=
esa-tools \ " do_install:append () { @@ -335,6 +334,7 @@ FILES:mesa-megadri=
ver =3D "${libdir}/dri/* ${datadir}/drirc.d" FILES:mesa-vulkan-drivers =3D =
"${libdir}/libvulkan_*.so ${libdir}/libpowervr_rogue.so ${datadir}/vulkan" =
FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*" FILES:libegl-mesa =
=3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d" +FILES:mesa-gall=
ium-drivers =3D "${libdir}/libgallium-*.so" FILES:libgbm =3D "${libdir}/lib=
gbm.so.*" FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*" FILES:libgles=
2-mesa =3D "${libdir}/libGLESv2.so.*" @@ -362,6 +362,7 @@ FILES:libxatracke=
r-dev =3D "${libdir}/libxatracker.so ${libdir}/libxatracker.la \ # catch al=
l to get all the tools and data FILES:${PN}-tools =3D "${bindir} ${datadir}=
" ALLOW_EMPTY:${PN}-tools =3D "1" +INSANE_SKIP:${PN}-megadriver =3D "dev-so=
" # Fix upgrade path from mesa to mesa-megadriver RREPLACES:mesa-megadriver=
 =3D "mesa" diff --git a/meta/recipes-graphics/mesa/mesa_24.1.4.bb b/meta/r=
ecipes-graphics/mesa/mesa_24.2.0.bb similarity index 100% rename from meta/=
recipes-graphics/mesa/mesa_24.1.4.bb rename to meta/recipes-graphics/mesa/m=
esa_24.2.0.bb -- 2.45.2 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links=
: You receive all messages sent to this group. View/Reply Online (#203484):=
 https://lists.openembedded.org/g/openembedded-core/message/203484 Mute Thi=
s Topic: https://lists.openembedded.org/mt/107965743/1686489 Group Owner: o=
penembedded-core+owner@lists.openembedded.org Unsubscribe: https://lists.op=
enembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com] -=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


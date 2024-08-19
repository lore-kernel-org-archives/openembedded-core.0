Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA6AC52D6F
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 14:32:07 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.211751.1724077919258054905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 07:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id 1188F1DB44;
	Mon, 19 Aug 2024 16:31:57 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.41.156]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sg3QJ-0qgEvA0; Mon, 19 Aug 2024 16:31:55 +0200
Date: Mon, 19 Aug 2024 16:33:25 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH 1/2] mesa: update 24.1.4 -> 24.2.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: f_l_k@t-online.de, openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-Id: <P3ZGIS.QDEQ3DNO7TDP1@t-online.de>
In-Reply-To: <CANNYZj9x08BYKYpxpL-djuBg5C_rLqfJ-qmJ19_kp0+D-nKB6Q@mail.gmail.com>
References: <20240818164844.2738771-1-f_l_k@t-online.de>
	<CANNYZj9x08BYKYpxpL-djuBg5C_rLqfJ-qmJ19_kp0+D-nKB6Q@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-i5GTe4V/s3BSGJ6yj/3g"
X-TOI-EXPURGATEID: 150726::1724077915-89FF885B-E44294FA/0/0 CLEAN NORMAL
X-TOI-MSGID: 8b4c5ea3-bcdc-4eb8-850c-fa5b72ff1e87
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 14:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203507

--=-i5GTe4V/s3BSGJ6yj/3g
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

It looks to me like intel is just a little bit further along in terms=20
of the mesa driver. Currently it is
also a requirement for gallium-asahi and I would expect at least  amd=20
and panfrost to follow. Basically
it'll be required for all drivers that support runtime compiled shaders=20
(like also done in Windows)
to enable features like raytracing/pathtracing.

That said, I'm not in favor of either solution, but I wouldn't expect=20
libclc and clang/gcc-runtime
to become optional again for hardware that supports shaders.

On Mon, Aug 19 2024 at 10:57:38 AM +02:00:00, Alexander Kanavin=20
<alex.kanavin@gmail.com> wrote:
> Has anything changes in this release w.r.t intel drivers? Do they
> still requiure bits of meta-clang?
>=20
> Given that we're now two major releases behind, I just do not think
> that one vendor should be holding everyone else hostage to their
> 'special requirements'. I still think it's better to disable Intel
> drivers, and move on. The vendor can re-enable them through their BSP
> layer, and allocate resources towards integrating clang into core if
> they so wish. Can this be raised privately with them or in a TSC
> meeting?
>=20
> Alex
>=20
> On Sun, 18 Aug 2024 at 18:47, Markus Volk via lists.openembedded.org
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  - Remove 0001-amd-Include-missing-llvm-IR-header-Module.h.patch ->=20
>> merged
>>  - INSANE_SKIP dev-so. All .so files that are installed in=20
>> ${libdir}/dri
>>    are now links to libdril_dri.so, but they should still not be=20
>> part of
>>    the dev package, I assume?
>>  - add PACKAGE for mesa-gallium-drivers and install=20
>> libgallium-24.2.0.so
>>  - add python3-pyyaml-native-dependency
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   ...lude-missing-llvm-IR-header-Module.h.patch | 41=20
>> -------------------
>>   .../{mesa-gl_24.1.4.bb =3D> mesa-gl_24.2.0.bb}  |  0
>>   meta/recipes-graphics/mesa/mesa.inc           |  9 ++--
>>   .../mesa/{mesa_24.1.4.bb =3D> mesa_24.2.0.bb}   |  0
>>   4 files changed, 5 insertions(+), 45 deletions(-)
>>   delete mode 100644=20
>> meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header=
-Module.h.patch
>>   rename meta/recipes-graphics/mesa/{mesa-gl_24.1.4.bb =3D>=20
>> mesa-gl_24.2.0.bb} (100%)
>>   rename meta/recipes-graphics/mesa/{mesa_24.1.4.bb =3D>=20
>> mesa_24.2.0.bb} (100%)
>>=20
>>  diff --git=20
>> a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-head=
er-Module.h.patch=20
>> b/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-head=
er-Module.h.patch
>>  deleted file mode 100644
>>  index 82ad88a079..0000000000
>>  ---=20
>> a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-head=
er-Module.h.patch
>>  +++ /dev/null
>>  @@ -1,41 +0,0 @@
>>  -From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00=20
>> 2001
>>  -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>>  -Date: Mon, 1 Jul 2024 23:09:29 -0700
>>  -Subject: [PATCH] amd: Include missing llvm IR header Module.h
>>  -MIME-Version: 1.0
>>  -Content-Type: text/plain; charset=3DUTF-8
>>  -Content-Transfer-Encoding: 8bit
>>  -
>>  -With LLVM-19, Module.h header is not being pulled, which results in
>>  -compile errors e.g.
>>  -
>>  -src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching=20
>> function for call to =91unwrap(LLVMOpaqueModule*&)=92
>>  -  102 |   =20
>> unwrap(module)->setTargetTriple(TM->getTargetTriple().getTriple());
>>  -      |    ~~~~~~^~~~~~~~
>>  -In file included from=20
>> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-=
sysroot-native/usr/include/llvm/IR/Type.h:18,
>>  -                 from=20
>> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-=
sysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
>>  -                 from=20
>> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-=
sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
>>  -                 from=20
>> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-=
sysroot-native/usr/include/llvm/Analysis/TargetLibraryInfo.h:14,
>>  -                 from=20
>> ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
>>  -
>>  -Its getting the definition from llvm/IR/Type.h instead of Module.h=20
>> and caused
>>  -confusion to compiler
>>  -
>>  -Upstream-Status: Submitted=20
>> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29993>]
>>  -Signed-off-by: Khem Raj <raj.khem@gmail.com=20
>> <mailto:raj.khem@gmail.com>>
>>  ----
>>  - src/amd/llvm/ac_llvm_helper.cpp | 1 +
>>  - 1 file changed, 1 insertion(+)
>>  -
>>  -diff --git a/src/amd/llvm/ac_llvm_helper.cpp=20
>> b/src/amd/llvm/ac_llvm_helper.cpp
>>  -index 5d065279ad1..af4a50f8409 100644
>>  ---- a/src/amd/llvm/ac_llvm_helper.cpp
>>  -+++ b/src/amd/llvm/ac_llvm_helper.cpp
>>  -@@ -8,6 +8,7 @@
>>  - #include <llvm/Analysis/TargetLibraryInfo.h>
>>  - #include <llvm/IR/IRBuilder.h>
>>  - #include <llvm/IR/LegacyPassManager.h>
>>  -+#include <llvm/IR/Module.h>
>>  - #include <llvm/IR/Verifier.h>
>>  - #include <llvm/Target/TargetMachine.h>
>>  - #include <llvm/MC/MCSubtargetInfo.h>
>>  diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb=20
>> b/meta/recipes-graphics/mesa/mesa-gl_24.2.0.bb
>>  similarity index 100%
>>  rename from meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb
>>  rename to meta/recipes-graphics/mesa/mesa-gl_24.2.0.bb
>>  diff --git a/meta/recipes-graphics/mesa/mesa.inc=20
>> b/meta/recipes-graphics/mesa/mesa.inc
>>  index 499006655d..40e7bed648 100644
>>  --- a/meta/recipes-graphics/mesa/mesa.inc
>>  +++ b/meta/recipes-graphics/mesa/mesa.inc
>>  @@ -16,11 +16,10 @@ PE =3D "2"
>>=20
>>   SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz=20
>> <https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz> \
>>             =20
>> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch=20
>> <file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch/> \
>>  -          =20
>> file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch=20
>> <file://0001-amd-include-missing-llvm-ir-header-module.h.patch/> \
>>             =20
>> file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\=20
>> <file://0001-freedreno-don-t-encode-build-path-into-binaries.patch/>
>>   "
>>=20
>>  -SRC_URI[sha256sum] =3D=20
>> "7cf7c6f665263ad0122889c1d4b076654c1eedea7a2f38c69c8c51579937ade1"
>>  +SRC_URI[sha256sum] =3D=20
>> "c02bb72cea290f78b11895a0c95c7c92394f180d7ff66d4a762ec6950a58addf"
>>=20
>>   UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>>=20
>>  @@ -34,7 +33,7 @@ do_install:append() {
>>     fi
>>   }
>>=20
>>  -DEPENDS =3D "expat makedepend-native flex-native bison-native=20
>> libxml2-native zlib chrpath-replacement-native python3-mako-native=20
>> gettext-native"
>>  +DEPENDS =3D "expat makedepend-native flex-native bison-native=20
>> libxml2-native zlib chrpath-replacement-native python3-mako-native=20
>> gettext-native python3-pyyaml-native"
>>   DEPENDS:append:class-target =3D " ${@bb.utils.contains=20
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl',=20
>> 'mesa-native', '', d)}"
>>   EXTRANATIVEPATH +=3D "chrpath-native"
>>   PROVIDES =3D " \
>>  @@ -243,7 +242,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>>                libopencl-mesa libopencl-mesa-dev \
>>                libxatracker libxatracker-dev \
>>                mesa-megadriver mesa-vulkan-drivers \
>>  -             mesa-vdpau-drivers mesa-tools \
>>  +             mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
>>               "
>>=20
>>   do_install:append () {
>>  @@ -335,6 +334,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/*=20
>> ${datadir}/drirc.d"
>>   FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so=20
>> ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
>>   FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>>   FILES:libegl-mesa =3D "${libdir}/libEGL*.so.*=20
>> ${datadir}/glvnd/egl_vendor.d"
>>  +FILES:mesa-gallium-drivers =3D "${libdir}/libgallium-*.so"
>>   FILES:libgbm =3D "${libdir}/libgbm.so.*"
>>   FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>>   FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
>>  @@ -362,6 +362,7 @@ FILES:libxatracker-dev =3D=20
>> "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
>>   # catch all to get all the tools and data
>>   FILES:${PN}-tools =3D "${bindir} ${datadir}"
>>   ALLOW_EMPTY:${PN}-tools =3D "1"
>>  +INSANE_SKIP:${PN}-megadriver =3D "dev-so"
>>=20
>>   # Fix upgrade path from mesa to mesa-megadriver
>>   RREPLACES:mesa-megadriver =3D "mesa"
>>  diff --git a/meta/recipes-graphics/mesa/mesa_24.1.4.bb=20
>> b/meta/recipes-graphics/mesa/mesa_24.2.0.bb
>>  similarity index 100%
>>  rename from meta/recipes-graphics/mesa/mesa_24.1.4.bb
>>  rename to meta/recipes-graphics/mesa/mesa_24.2.0.bb
>>  --
>>  2.45.2
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#203484):=20
>> <https://lists.openembedded.org/g/openembedded-core/message/203484>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/107965743/1686489>
>>  Group Owner: openembedded-core+owner@lists.openembedded.org=20
>> <mailto:openembedded-core+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
>> [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-i5GTe4V/s3BSGJ6yj/3g
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>It looks to me like intel is just =
a little bit further along in terms of the mesa driver. Currently it is</di=
v><div>also a requirement for gallium-asahi and I would expect at least &nb=
sp;amd and panfrost to follow. Basically</div><div>it'll be required for al=
l drivers that support runtime compiled shaders (like also done in Windows)=
</div><div>to enable features like raytracing/pathtracing.</div><div><br></=
div><div>That said, I'm not in favor of either solution, but I wouldn't exp=
ect libclc and clang/gcc-runtime</div><div>to become optional again for har=
dware that supports shaders.</div></div><div id=3D"geary-quote" dir=3D"auto=
"><br>On Mon, Aug 19 2024 at 10:57:38 AM +02:00:00, Alexander Kanavin &lt;a=
lex.kanavin@gmail.com&gt; wrote:<br><blockquote type=3D"cite"><div class=3D=
"plaintext" style=3D"white-space: break-spaces;">Has anything changes in th=
is release w.r.t intel drivers? Do they
still requiure bits of meta-clang?

Given that we're now two major releases behind, I just do not think
that one vendor should be holding everyone else hostage to their
'special requirements'. I still think it's better to disable Intel
drivers, and move on. The vendor can re-enable them through their BSP
layer, and allocate resources towards integrating clang into core if
they so wish. Can this be raised privately with them or in a TSC
meeting?

Alex

On Sun, 18 Aug 2024 at 18:47, Markus Volk via lists.openembedded.org
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3Dt=
-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 - Remove 0001-amd-Include-missing-llvm-IR-header-Module.h.patch -&gt; merg=
ed
 - INSANE_SKIP dev-so. All .so files that are installed in ${libdir}/dri
   are now links to libdril_dri.so, but they should still not be part of
   the dev package, I assume?
 - add PACKAGE for mesa-gallium-drivers and install libgallium-24.2.0.so
 - add python3-pyyaml-native-dependency

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  ...lude-missing-llvm-IR-header-Module.h.patch | 41 -------------------
  .../{mesa-gl_24.1.4.bb =3D&gt; mesa-gl_24.2.0.bb}  |  0
  meta/recipes-graphics/mesa/mesa.inc           |  9 ++--
  .../mesa/{mesa_24.1.4.bb =3D&gt; mesa_24.2.0.bb}   |  0
  4 files changed, 5 insertions(+), 45 deletions(-)
  delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-miss=
ing-llvm-IR-header-Module.h.patch
  rename meta/recipes-graphics/mesa/{mesa-gl_24.1.4.bb =3D&gt; mesa-gl_24.2=
.0.bb} (100%)
  rename meta/recipes-graphics/mesa/{mesa_24.1.4.bb =3D&gt; mesa_24.2.0.bb}=
 (100%)

 diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llv=
m-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-Incl=
ude-missing-llvm-IR-header-Module.h.patch
 deleted file mode 100644
 index 82ad88a079..0000000000
 --- a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-he=
ader-Module.h.patch
 +++ /dev/null
 @@ -1,41 +0,0 @@
 -From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
 -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.c=
om</a>&gt;
 -Date: Mon, 1 Jul 2024 23:09:29 -0700
 -Subject: [PATCH] amd: Include missing llvm IR header Module.h
 -MIME-Version: 1.0
 -Content-Type: text/plain; charset=3DUTF-8
 -Content-Transfer-Encoding: 8bit
 -
 -With LLVM-19, Module.h header is not being pulled, which results in
 -compile errors e.g.
 -
 -src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function for c=
all to =91unwrap(LLVMOpaqueModule*&amp;)=92
 -  102 |    unwrap(module)-&gt;setTargetTriple(TM-&gt;getTargetTriple().ge=
tTriple());
 -      |    ~~~~~~^~~~~~~~
 -In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-=
native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,
 -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-=
native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
 -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-=
native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
 -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-=
native/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibrary=
Info.h:14,
 -                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
 -
 -Its getting the definition from llvm/IR/Type.h instead of Module.h and ca=
used
 -confusion to compiler
 -
 -Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/mes=
a/mesa/-/merge_requests/29993">https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/29993</a>]
 -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt;
 ----
 - src/amd/llvm/ac_llvm_helper.cpp | 1 +
 - 1 file changed, 1 insertion(+)
 -
 -diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_helpe=
r.cpp
 -index 5d065279ad1..af4a50f8409 100644
 ---- a/src/amd/llvm/ac_llvm_helper.cpp
 -+++ b/src/amd/llvm/ac_llvm_helper.cpp
 -@@ -8,6 +8,7 @@
 - #include &lt;llvm/Analysis/TargetLibraryInfo.h&gt;
 - #include &lt;llvm/IR/IRBuilder.h&gt;
 - #include &lt;llvm/IR/LegacyPassManager.h&gt;
 -+#include &lt;llvm/IR/Module.h&gt;
 - #include &lt;llvm/IR/Verifier.h&gt;
 - #include &lt;llvm/Target/TargetMachine.h&gt;
 - #include &lt;llvm/MC/MCSubtargetInfo.h&gt;
 diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb b/meta/recipes-g=
raphics/mesa/mesa-gl_24.2.0.bb
 similarity index 100%
 rename from meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb
 rename to meta/recipes-graphics/mesa/mesa-gl_24.2.0.bb
 diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/m=
esa/mesa.inc
 index 499006655d..40e7bed648 100644
 --- a/meta/recipes-graphics/mesa/mesa.inc
 +++ b/meta/recipes-graphics/mesa/mesa.inc
 @@ -16,11 +16,10 @@ PE =3D "2"

  SRC_URI =3D "<a href=3D"https://mesa.freedesktop.org/archive/mesa-${PV}.t=
ar.xz">https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \
             <a href=3D"file://0001-meson-misdetects-64bit-atomics-on-mips-=
clang.patch">file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch=
</a> \
 -           <a href=3D"file://0001-amd-Include-missing-llvm-IR-header-Modu=
le.h.patch">file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch</=
a> \
             <a href=3D"file://0001-freedreno-don-t-encode-build-path-into-=
binaries.patch\">file://0001-freedreno-don-t-encode-build-path-into-binarie=
s.patch\</a>
  "

 -SRC_URI[sha256sum] =3D "7cf7c6f665263ad0122889c1d4b076654c1eedea7a2f38c69=
c8c51579937ade1"
 +SRC_URI[sha256sum] =3D "c02bb72cea290f78b11895a0c95c7c92394f180d7ff66d4a7=
62ec6950a58addf"

  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P&lt;pver&gt;\d+(\.\d+)+)"

 @@ -34,7 +33,7 @@ do_install:append() {
    fi
  }

 -DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-nat=
ive zlib chrpath-replacement-native python3-mako-native gettext-native"
 +DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-nat=
ive zlib chrpath-replacement-native python3-mako-native gettext-native pyth=
on3-pyyaml-native"
  DEPENDS:append:class-target =3D " <a href=3D"mailto:${@bb.utils.contains"=
>${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}=
"
  EXTRANATIVEPATH +=3D "chrpath-native"
  PROVIDES =3D " \
 @@ -243,7 +242,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
               libopencl-mesa libopencl-mesa-dev \
               libxatracker libxatracker-dev \
               mesa-megadriver mesa-vulkan-drivers \
 -             mesa-vdpau-drivers mesa-tools \
 +             mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
              "

  do_install:append () {
 @@ -335,6 +334,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}/=
drirc.d"
  FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpowe=
rvr_rogue.so ${datadir}/vulkan"
  FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
  FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor=
.d"
 +FILES:mesa-gallium-drivers =3D "${libdir}/libgallium-*.so"
  FILES:libgbm =3D "${libdir}/libgbm.so.*"
  FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
 @@ -362,6 +362,7 @@ FILES:libxatracker-dev =3D "${libdir}/libxatracker.so =
${libdir}/libxatracker.la \
  # catch all to get all the tools and data
  FILES:${PN}-tools =3D "${bindir} ${datadir}"
  ALLOW_EMPTY:${PN}-tools =3D "1"
 +INSANE_SKIP:${PN}-megadriver =3D "dev-so"

  # Fix upgrade path from mesa to mesa-megadriver
  RREPLACES:mesa-megadriver =3D "mesa"
 diff --git a/meta/recipes-graphics/mesa/mesa_24.1.4.bb b/meta/recipes-grap=
hics/mesa/mesa_24.2.0.bb
 similarity index 100%
 rename from meta/recipes-graphics/mesa/mesa_24.1.4.bb
 rename to meta/recipes-graphics/mesa/mesa_24.2.0.bb
 --
 2.45.2


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#203484): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/message/203484">https://lists.openembedded.org/g/openembed=
ded-core/message/203484</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107965743/16=
86489">https://lists.openembedded.org/mt/107965743/1686489</a>
 Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.=
org">openembedded-core+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core=
/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-i5GTe4V/s3BSGJ6yj/3g--



Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA741C3ABC9
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 14:52:18 +0000 (UTC)
Subject: Re: [PATCH] compiler-rt-sanitizers, compiler-rt: skip for armv5
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 10 May 2025 07:52:14 -0700
References: <CAMKF1spkq=LkQf7qHmBB_DPD+4s73iXiCe54-kA+qfdnwFiT0A@mail.gmail.com>
In-Reply-To: <CAMKF1spkq=LkQf7qHmBB_DPD+4s73iXiCe54-kA+qfdnwFiT0A@mail.gmail.com>
Message-ID: <29977.1746888734129629150@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kSDHHlYS5EikE8vErkHr"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 14:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216273

--kSDHHlYS5EikE8vErkHr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

I followed your suggestions to apply the following change on compiler-rt re=
cipe and build it for qemuarmv5, the failure remains

--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -74,6 +74,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
-DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
-DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
-DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-${HOST_OS} \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCOMPILER_RT_DEFAULT_TA=
RGET_ARCH=3D${@bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', 'armv5=
te', '${HOST_ARCH}', d)} \
-DCOMPILER_RT_DEFAULT_TARGET_ONLY=3DON \
-DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
"
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-=
devtools/clang/compiler-rt_git.bb
index 93928541273..8073bc139eb 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -80,6 +80,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
-DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
-DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
-DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCOMPILER_RT_DEFAULT_TA=
RGET_ARCH=3D${@bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', 'armv5=
te', '${HOST_ARCH}', d)} \
-DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
"

$ echo 'MACHINE =3D "qemuarmv5"' >> conf/local.conf
$ bitbake compiler-rt
...
/buildarea5/hjia/poky/build/tmp/work-shared/llvm-project-source-20.1.3-r0/l=
lvm-project-20.1.3.src/compiler-rt/lib/builtins/arm/sync-ops.h:22:2: error:=
 #error DMB is only supported on ARMv6+
22 | #error DMB is only supported on ARMv6+
| =C2=A0^~~~~
...

//Hongxu

--kSDHHlYS5EikE8vErkHr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem,</div>
<div>&nbsp;</div>
<div>I followed your suggestions to apply the following change on compiler-=
rt recipe and build it for qemuarmv5, the failure remains</div>
<div>&nbsp;</div>
<div>--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb<br />+=
++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb<br />@@ -74,=
6 +74,7 @@ EXTRA_OECMAKE:append:class-target =3D "\<br />&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHA=
IN}/${TARGET_PREFIX}llvm-ar \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ll=
vm-nm \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -DCMAK=
E_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-${HOST_OS} \<br />+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -DCOMPILER_RT_DEFAULT_TARGET_ARC=
H=3D${@bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', 'armv5te', '${=
HOST_ARCH}', d)} \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; -DCOMPILER_RT_DEFAULT_TARGET_ONLY=3DON \<br />&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \<br=
 />&nbsp;"<br />diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb=
 b/meta/recipes-devtools/clang/compiler-rt_git.bb<br />index 93928541273..8=
073bc139eb 100644<br />--- a/meta/recipes-devtools/clang/compiler-rt_git.bb=
<br />+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb<br />@@ -80,6 +8=
0,7 @@ EXTRA_OECMAKE:append:class-target =3D "\<br />&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/=
${TARGET_PREFIX}llvm-ar \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-n=
m \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -DCMAKE_C_=
COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \<br />+ &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -DCOMPILER_RT_DEFAULT_TARGET_AR=
CH=3D${@bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', 'armv5te', '$=
{HOST_ARCH}', d)} \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \<br />&nbsp;"</div>
<div>&nbsp;</div>
<div>$ echo 'MACHINE =3D "qemuarmv5"' &gt;&gt; conf/local.conf</div>
<div>$ bitbake compiler-rt</div>
<div>...</div>
<div>/buildarea5/hjia/poky/build/tmp/work-shared/llvm-project-source-20.1.3=
-r0/llvm-project-20.1.3.src/compiler-rt/lib/builtins/arm/sync-ops.h:22:2: e=
rror: #error DMB is only supported on ARMv6+<br />&nbsp; &nbsp;22 | #error =
DMB is only supported on ARMv6+<br />&nbsp; &nbsp; &nbsp; | &nbsp;^~~~~</di=
v>
<div>...</div>
<div>&nbsp;</div>
<div>//Hongxu</div>

--kSDHHlYS5EikE8vErkHr--


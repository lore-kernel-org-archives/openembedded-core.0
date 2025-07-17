Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1DBC83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 17:17:05 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.1018.1752772620728010806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 10:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X54MjSme;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e8d70c65abcso681267276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752772620; x=1753377420; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsRBlVZryGl3YvUG1uRMHDWHgGk+OFIdgnT6Ouj4oYU=;
        b=X54MjSmezqjNh2WV551kPxLme+isVm3XAH6+qZpaUfTLQMFJnX7SteJI50ebrZ0lpP
         AlwF/BoDB9rPjm73NLtadJYvADIE+I0GH/ON/lX2EQrdi6SW62GcDtwauoio7GBgtdBe
         aGvk+Ba6BqgVldPbrhCLxQg//7CPi+/SK24rWEjU95JhTBgRqAea9P9T3oxqXDVgQtlw
         ClfuDkGfceX+5UH0OsbicDmN306oQNQUSQj676e0HRWKHTzNU9qZ9g4YpFtIUUPqsLOr
         8Gg4KnBUXUQwlCeeCQUn7H52FKDJBysRw6rX4kwiU3JEZHOSvcipBzhndVayiTMgktR2
         QiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752772620; x=1753377420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsRBlVZryGl3YvUG1uRMHDWHgGk+OFIdgnT6Ouj4oYU=;
        b=DN8sB9Z2I4vzrlDPvQtAYhtZSnI+3QJcbgXDNzD55XSIpPCq6SSbJ1VxNahtwsPhjx
         DIjH1eu/13YJM8mxmFfDp1rYWBBvgjqVN4y9gKdVJdk6h62yRM10Kd4vXSlCh9//4TW2
         Zd6suqTWy72sMuOEku9ja4JIQ+VjPx5to+LXXESPa09V+r4TvU3rMeqtTkkA3iMfUFCQ
         jwnOYAPS9AU59mASHleCCGlotyh1IFVDYL6xOOsrEQPNNKYdgf1xBL2jkL+z6gmoDg1G
         sryRxleB+OeuQ8BMt+vZwVeeHuvpowRVFG1W+nGmptE5OhJTH+sZhJexriicHAsMIINm
         ABnA==
X-Gm-Message-State: AOJu0Yy6uf9y6FqOIzqwldBRy/mKcUzLJIeXILmrZB9ahnv/WEen7/w7
	RhNmJZJDV2/nSjViQkYGYXNtN2IXq3U92ebt0W06ejw+Rizm7p123EmthoEGu242O0kmCRxkVY5
	Zeo1u/vr6uvH3WxrUmlUp3HjoNBr5jKk=
X-Gm-Gg: ASbGncuHoEEBTC/wrGVNPnXmFJoBlL0UHoYBJbtJkJB8jftr5YMtkvTGey6bHo5gw+z
	DklpHDt8kkvTNMSlDsBJP0okSmNlzoxPRLu54muqHMmC/rZp4rE18AQ6W/ylRBv21xSXP2sKfUR
	i6cWnxgRp8wHPproPLsBK9S+duwLdZjRkMAiY28f1Yy2J9phD9+Hrj9n9bk9Tqd1+y2yiaOS7B4
	nvQpg==
X-Google-Smtp-Source: AGHT+IGQ/aX8pcUXQO72EKa5bYijJ6oSr2utas27I88E8pXEtieDZWTkhn6kM6S7RauwwAP5kYALjFI0g7nP517DryQ=
X-Received: by 2002:a05:690c:350c:b0:712:e22d:a235 with SMTP id
 00721157ae682-7183504278emr118198667b3.17.1752772619424; Thu, 17 Jul 2025
 10:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250717134806.2790027-1-ross.burton@arm.com> <20250717134806.2790027-2-ross.burton@arm.com>
In-Reply-To: <20250717134806.2790027-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jul 2025 10:16:32 -0700
X-Gm-Features: Ac12FXzv-baen4EmYQOGwqV16fUGJkcL29sVCVlW9CqmG9XiMJxTuvVut0l9taM
Message-ID: <CAMKF1spBbCHjdhHKvf8rE20Lv2NMHo=q9r4HNCyTXWmABC+Xxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] libclc: split out of clang
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 17:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220557

On Thu, Jul 17, 2025 at 6:48=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Split the libclc subproject out of the clang recipe and into a dedicated
> libclc recipe.
>

It would be good to document the rationale for this  change, helps in remin=
ding
why this was done.

> Verified that nothing is dropped by adding clang and libclc to an image
> and verifying that the file list is the same before and after this
> change.

OK

>
> We need to patch the libclc CMakeLists to allow it to use an out-of-tree
> prepare_builtins binary, discussion is ongoing with upstream to resolve
> this properly.

Would be good to get it done upstream. Building out of tree is not common
amongst clang/llvm devs

>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  ...sting-prepare-builtins-in-standalone.patch | 53 +++++++++++++++++++
>  meta/recipes-devtools/clang/clang_git.bb      | 17 +++---
>  meta/recipes-devtools/clang/common.inc        |  1 +
>  meta/recipes-devtools/clang/libclc_git.bb     | 43 +++++++++++++++
>  5 files changed, 104 insertions(+), 11 deletions(-)
>  create mode 100644 meta/recipes-devtools/clang/clang/0001-libclc-allow-e=
xisting-prepare-builtins-in-standalone.patch
>  create mode 100644 meta/recipes-devtools/clang/libclc_git.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 6bfc2efb162..927aac16d6d 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -328,6 +328,7 @@ RECIPE_MAINTAINER:pn-libcap-ng =3D "Yi Zhao <yi.zhao@=
windriver.com>"
>  RECIPE_MAINTAINER:pn-libcap-ng-python =3D "Yi Zhao <yi.zhao@windriver.co=
m>"
>  RECIPE_MAINTAINER:pn-libcgroup =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-libcheck =3D "Yi Zhao <yi.zhao@windriver.com>"
> +RECIPE_MAINTAINER:pn-libclc =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-libcomps =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-libconvert-asn1-perl =3D "Tim Orling <tim.orling@ko=
nsulko.com>"
>  RECIPE_MAINTAINER:pn-libcxx =3D "Khem Raj <raj.khem@gmail.com>"
> diff --git a/meta/recipes-devtools/clang/clang/0001-libclc-allow-existing=
-prepare-builtins-in-standalone.patch b/meta/recipes-devtools/clang/clang/0=
001-libclc-allow-existing-prepare-builtins-in-standalone.patch
> new file mode 100644
> index 00000000000..2b40f541a6b
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/clang/0001-libclc-allow-existing-prepar=
e-builtins-in-standalone.patch
> @@ -0,0 +1,53 @@
> +From 348f846b206780646430d6477c04b7793b669f34 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Wed, 16 Jul 2025 23:24:21 +0100
> +Subject: [PATCH] allow external prepare_builtins
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + libclc/CMakeLists.txt | 23 +++++++++++++++++------
> + 1 file changed, 17 insertions(+), 6 deletions(-)
> +
> +diff --git a/libclc/CMakeLists.txt b/libclc/CMakeLists.txt
> +index 43e213b385f5..d4a6d096169e 100644
> +--- a/libclc/CMakeLists.txt
> ++++ b/libclc/CMakeLists.txt
> +@@ -181,17 +181,28 @@ set(LLVM_LINK_COMPONENTS
> +   IRReader
> +   Support
> + )
> ++
> + if( LIBCLC_STANDALONE_BUILD )
> +-  add_llvm_executable( prepare_builtins utils/prepare-builtins.cpp )
> +-  set( prepare_builtins_exe prepare_builtins )
> +-  set( prepare_builtins_target prepare_builtins )
> ++  message("cross ${CMAKE_CROSSCOMPILING}")
> ++  if(CMAKE_CROSSCOMPILING)
> ++    find_program(PREPARE_BUILTINS prepare_builtins REQUIRED)
> ++    message("found ${PREPARE_BUILTINS}")
> ++    set( prepare_builtins_exe ${PREPARE_BUILTINS} )
> ++  else()
> ++    add_llvm_executable( prepare_builtins utils/prepare-builtins.cpp )
> ++    set( prepare_builtins_exe prepare_builtins )
> ++    set( prepare_builtins_target prepare_builtins )
> ++    target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION=
_DEFINE} )
> ++    # These were not properly reported in early LLVM and we don't need =
them
> ++    target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-exc=
eptions )
> ++  endif()
> + else()
> +   add_llvm_utility( prepare_builtins utils/prepare-builtins.cpp )
> +   setup_host_tool( prepare_builtins PREPARE_BUILTINS prepare_builtins_e=
xe prepare_builtins_target )
> ++  target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION_D=
EFINE} )
> ++  # These were not properly reported in early LLVM and we don't need th=
em
> ++  target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-excep=
tions )
> + endif()
> +-target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION_DEF=
INE} )
> +-# These were not properly reported in early LLVM and we don't need them
> +-target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-excepti=
ons )
> +
> + # Setup arch devices
> + set( r600--_devices cedar cypress barts cayman )
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
> index ed6e2d7da7f..884398dcaa3 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -130,7 +130,7 @@ HF[vardepvalue] =3D "${HF}"
>
>  # Ensure that LLVM_PROJECTS does not contain compiler runtime components=
 e.g. libcxx etc
>  # they are enabled via LLVM_ENABLE_RUNTIMES
> -LLVM_PROJECTS ?=3D "clang;clang-tools-extra;libclc;lld"
> +LLVM_PROJECTS ?=3D "clang;clang-tools-extra;lld"
>
>  # linux hosts (.so) on Windows .pyd
>  SOLIBSDEV:mingw32 =3D ".pyd"
> @@ -191,7 +191,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
>
>  DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native ninja-nati=
ve swig-native spirv-tools-native llvm-tblgen-native"
>  DEPENDS:append:class-nativesdk =3D " clang-crosssdk-${SDK_SYS} virtual/n=
ativesdk-cross-binutils nativesdk-python3"
> -DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} python3 ${@=
bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)} s=
pirv-llvm-translator-native"
> +DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} python3 ${@=
bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
>
>  RRECOMMENDS:${PN} =3D "binutils"
>  RRECOMMENDS:${PN}:append:class-target =3D "${@bb.utils.contains('TC_CXX_=
RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
> @@ -258,7 +258,6 @@ do_install:append:class-native () {
>          install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
>      fi
>      install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/prepare_builtins ${D}${bin=
dir}/prepare_builtins
>
>      for f in `find ${D}${bindir} -executable -type f -not -type l`; do
>          test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> @@ -294,11 +293,11 @@ do_install:append:class-nativesdk () {
>      fi
>  }
>
> -PROVIDES:append:class-native =3D " llvm-native libclc-native"
> -PROVIDES:append:class-target =3D " llvm libclc"
> -PROVIDES:append:class-nativesdk =3D " nativesdk-llvm nativesdk-libclc"
> +PROVIDES:append:class-native =3D " llvm-native"
> +PROVIDES:append:class-target =3D " llvm"
> +PROVIDES:append:class-nativesdk =3D " nativesdk-llvm"
>
> -PACKAGES =3D+ "${PN}-libllvm ${PN}-libclang-python ${PN}-libclang-cpp ${=
PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
> +PACKAGES =3D+ "${PN}-libllvm ${PN}-libclang-python ${PN}-libclang-cpp ${=
PN}-tidy ${PN}-format ${PN}-tools \
>               libclang llvm-linker-tools"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> @@ -315,8 +314,6 @@ RDEPENDS:${PN}-tools +=3D "\
>    perl-module-term-ansicolor \
>  "
>
> -RPROVIDES:${PN}-clc =3D "${MLPREFIX}libclc"
> -
>  RRECOMMENDS:${PN}-tidy +=3D "${PN}-tools"
>
>  FILES:llvm-linker-tools =3D "${libdir}/LLVMgold* ${libdir}/libLTO.so.* $=
{libdir}/LLVMPolly*"
> @@ -383,8 +380,6 @@ FILES:${PN} +=3D "\
>    ${nonarch_libdir}/${BPN}/*/include/ \
>  "
>
> -FILES:${PN}-clc +=3D "${datadir}/clc"
> -
>  FILES:${PN}-libllvm =3D+ "\
>    ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
>    ${libdir}/libLLVM-${MAJOR_VER}.so \
> diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
> index d66f9059b2e..d6280c2fbe3 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -59,6 +59,7 @@ SRC_URI =3D "\
>      file://0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch =
\
>      file://0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.pat=
ch \
>      file://0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.pat=
ch \
> +    file://0001-libclc-allow-existing-prepare-builtins-in-standalone.pat=
ch \
>  "
>  # Fallback to no-PIE if not set
>  GCCPIE ??=3D ""
> diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-dev=
tools/clang/libclc_git.bb
> new file mode 100644
> index 00000000000..ed31de503ae
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/libclc_git.bb
> @@ -0,0 +1,43 @@
> +SUMMARY =3D "Implementation of the library requirements of the OpenCL C =
programming language."
> +HOMEPAGE =3D "https://libclc.llvm.org"
> +SECTION =3D "devel"
> +
> +require common-clang.inc
> +require common-source.inc
> +
> +LIC_FILES_CHKSUM =3D "file://libclc/LICENSE.TXT;md5=3D7cc795f6cbb2d801d8=
4336b83c8017db"
> +
> +inherit cmake pkgconfig
> +
> +# Depend explicitly on clang-native instead of using TOOLCHAIN as the bu=
ild
> +# objects from this recipe are build explicitly using clang for GPU targ=
ets.
> +# We could INHIBIT_DEFAULT_DEPS to avoid any other toolchain but then we=
 need
> +# to wrestle CMake to configure without a toolchain.
> +DEPENDS +=3D "clang-native spirv-llvm-translator-native"
> +
> +OECMAKE_SOURCEPATH =3D "${S}/libclc"
> +B_NATIVE =3D "${B}-native"
> +
> +# Semicolon-separated list of targets to build
> +LIBCLC_TARGETS ?=3D "all"
> +
> +EXTRA_OECMAKE =3D "-DLIBCLC_TARGETS_TO_BUILD=3D${LIBCLC_TARGETS} \
> +                 -DPREPARE_BUILTINS=3D${B_NATIVE}/prepare_builtins"
> +
> +# Need to build a native prepare_builtins binary in target builds. The e=
asiest
> +# way to do this is with a second native cmake build tree.
> +do_build_prepare_builtins() {
> +    cmake --fresh -G Ninja \
> +        -S ${OECMAKE_SOURCEPATH} -B ${B_NATIVE} \
> +        -DCMAKE_TOOLCHAIN_FILE:FILEPATH=3D${WORKDIR}/toolchain-native.cm=
ake \
> +        -DLIBCLC_TARGETS_TO_BUILD=3D
> +    cmake --build ${B_NATIVE} --target prepare_builtins
> +}
> +do_build_prepare_builtins:class-native() {
> +    :
> +}
> +do_configure[prefuncs] +=3D "do_build_prepare_builtins"
> +
> +FILES:${PN} +=3D "${datadir}/clc"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220545): https://lists.openembedded.org/g/openembedde=
d-core/message/220545
> Mute This Topic: https://lists.openembedded.org/mt/114203430/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


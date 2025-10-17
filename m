Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2869CCCD184
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 06:01:38 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.9361.1760680895208513189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 23:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kt7GvMxr;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-781421f5bf5so16595987b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 23:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760680894; x=1761285694; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6zgXaELHzYScV4/SFwDdPGhUq7h+GHpZj4yCbzpOuY=;
        b=kt7GvMxr16NiwREsEk/thSX5QTn0KMqAlJ8bKNMduDHgM7kZ7HNRY01XwG6ESEqqqL
         oJ88wXZOa4J3cURjOzONX4WpbtUImSU6KiyfPlWakfAW8tV01uRFxn5og0PaD6nVUyxV
         6E3nClysVeE6QlQbqcQXw2NiO62TRF5xHrgHDeWvz5L87cbh6EzRI21B843wX+DwFsAC
         68J53uKbws/E2QbqNKratLBZmbAwzYYFnvMTFwxcTkiEGc1VUq4WoMfnSnNO5fmiuF1R
         4hq6KHNWkpuHe7ZxKo2coooU0BRVVgIMs7ZKlHimplXvXL5eJsqsux/Ra71ou442bABn
         /wjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760680894; x=1761285694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6zgXaELHzYScV4/SFwDdPGhUq7h+GHpZj4yCbzpOuY=;
        b=WvtAImvoq/jLTMcW55x++w5UneRud255/ErroICQAyXxgdB0+EbQJUkAJDT3xtBGBK
         hZ5WYCqiUB+be5MNVRN0f+CRSWKjjwQ84iD7tIO7+XlijoNUxYj9oa5vkHhEvCl4A34P
         /9DFk3uvt+qOMBer5MH/1Bo028iwJ7BFqILk7bsXcqMuiyDZ2D4Z/TaKrLFFKnR+SV4t
         CeuKOe6MbAhOASZMH1xP2q4dbXicAovwGnPVA9t71V8kl40Vv1mTR4F9NpqW1MQ7QWn1
         kCPPFtA9JRE32MwRb+bR8Hos5Pbl16xeeub5OkN6OtFOrPGHUz0evTFxbl3zAMQO8FHe
         ZFMg==
X-Gm-Message-State: AOJu0YwfWoYjsKvpzJVJ9RR4MHlVzS2EETVksErgxDPJRt/tShQtv4+Z
	DghmCpPeKoVDwxaJjp37tzrws+SFnI67r5Hq+fysKkWHAvEQYpePBilWSiJCiKgjt8f1QtnKts2
	8UgEMTg/Ic+3yRVPVknnwj3h+7lkWMacZT7AWbEY=
X-Gm-Gg: ASbGncvYbpkKD8qpYoqNpjIc+w3xFiyIPGB1xQl6BAD19XXbaYXunmQ1YSzlwNN1+gp
	W5RY8JebiFcuGbn+FcYxw0rWfBcuEiwSq+b0wFHRSIlY156wb6Js+H7z/LQ9Fw/zvrbyT3FZyPB
	Cmv6dqPppVG25dIV65+gS8O1mxRgci3rQt6OWTfxbkh1f9nZBqJlcpdmwPvxqkBkAr6gFGH+WkB
	fguKovcgrDJ+5XbDgMMgGIFbdPvNhgP69w/NKwzJ4WUz5Xa8BDQXFyR4gDwEzC1ioxE4pASUuhS
	U0Yhmm6T047Qfvbeb9ElXRGhUDTWVKSTiTb1IgVF0ldtfS7HGsOXo89garlqU3BA+J2nJVm4Bv2
	r+JlLFbMQNYij8g==
X-Google-Smtp-Source: AGHT+IF0f4rBl4wfa9i9y7Ogg68z1jPY/gPp6Aaho8rWHAxtg1bLyL3t3M2R0Zt+Huz8BKMKuEqCjh8u2/Wmqzq6Bbs=
X-Received: by 2002:a05:690c:3390:b0:783:796c:c18f with SMTP id
 00721157ae682-783796cc387mr6186167b3.43.1760680894082; Thu, 16 Oct 2025
 23:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com> <20251015095914.2120664-2-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251015095914.2120664-2-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Oct 2025 23:01:07 -0700
X-Gm-Features: AS18NWDtQOZkcf1kB5_GRCqBSZdHDmoSQl8JIlAwSN7x-NP38tkbcfGGsp-5J8U
Message-ID: <CAMKF1srz8kTxsfHKj_GtGeaEOj3tut_gGSakz+F430aAZRxE5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 2/3] rust: Use llvm instead of rust-llvm
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 06:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224995

I am seeing a build regression when using clang as default compiler

https://errors.yoctoproject.org/Errors/Details/885430/

PREFERRED_TOOLCHAIN_TARGET ?=3D "clang"
PREFERRED_TOOLCHAIN_SDK ?=3D "clang"
TOOLCHAIN_NATIVE:pn-rust ?=3D "clang"
TOOLCHAIN_NATIVE:pn-rust-native ?=3D "clang"
TOOLCHAIN_NATIVE:pn-nativesdk-rust ?=3D "clang"

On Wed, Oct 15, 2025 at 2:59=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Updated the Rust build to depend on llvm instead.
>
> *Summary of discussion with the rust upstream about using latest LLVM ins=
tead of Rust maintained LLVM fork.
> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm=
-fork-what-rust-uses/23489
>
> *Upstream LLVM is generally compatible:
> - Rust does support building with upstream (vanilla) LLVM, especially the=
 latest
> major release and the one or two preceding ones.
> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating=
-llvm
>
> *Impact on Yocto Rust upgrades:
> - Rust upgrades shall always check for updates on rust forked llvm and ba=
ckport
> the relevant patches to llvm.
>
> *Regarding the rust forked llvm local patches:
> - There are no local patches on rust forked llvm other than the backporte=
d fixes
> from llvm master.
>
> *We are copying the natively built `llvm-config` binary into the target s=
ysroot and running
> it. However, this `llvm-config` has compile time dependencies on various =
other arch's LLVM
> libraries because native-llvm is built for all oe-core supported targets.
>
> Attempting to work around this by symlinking the missing libraries from t=
he native sysroot
> into the target sysroot leads to mixed architectures in the final `.rlib`=
. Specifically,
> the object files extracted from those symlinked libraries within `librust=
c_llvm-<hash>.rlib`
> are built for the host, while others are correctly built for the target T=
his results in linker
> failures due to file format not recognized.
>
> To resolve this, we now build llvm-target also for all oe-core supported =
architectures in
> addition to the native-llvm build. This ensures that `llvm-config` and al=
l associated
> libraries are built for the correct target, eliminating cross-architectur=
e contamination
> and linker issues.
>
> *We are enabling -DLLVM_INSTALL_UTILS=3DON to ensure essential LLVM utili=
ties like FileCheck
> are available, as they are required by the Rust build.
>
> Without this, the build fails with an error as below:
> | thread 'main' panicked at src/bootstrap/src/core/sanity.rs:315:21:
> | FileCheck executable "poky/build/tmp/work/x86_64-linux/rust-native/1.90=
.0/recipe-sysroot
> -native/usr/bin/FileCheck" does not exist
>
> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" because of=
 this following
> diff otherwise we will get errors during link time.
>
> Setup in rust-llvm
> -DLLVM_ENABLE_ZLIB=3DOFF \
> -DLLVM_ENABLE_ZSTD=3DOFF \
> -DLLVM_ENABLE_FFI=3DOFF \
>
> Setup in llvm
> -DLLVM_ENABLE_FFI=3DON \
>
> *When multilibs enabled:
>
> llvm-config expects static libraries to be located in the lib directory r=
ather than
> lib64. However, since we are copying the natively built llvm-config to ta=
rget sysroot
> and running it and llvm-config doesn't know anything about lib64 existenc=
e. To accommodate
> this without breaking multilib behavior, we are creating a symlink from '=
lib' to 'lib64'
> directory.
>
> Previously, when we depended on rust-llvm, this worked because we specifi=
ed:
> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
>
> With this setup, llvm-config was installed inside ${libdir}/llvm-rust, wh=
ich included
> its own bin and lib directories. Thus, llvm-config located in bin would c=
orrectly find
> the libraries in the adjacent lib directory.
>
> Even when multilib was enabled or not, llvm-config would still look for l=
ibraries under
> lib in this structure, so everything functioned as expected.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-devtools/clang/llvm_git.bb   |  2 +-
>  meta/recipes-devtools/rust/rust_1.90.0.bb | 39 ++++++++++++++++++++---
>  2 files changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devto=
ols/clang/llvm_git.bb
> index d2b060ff88..2f47af8d7a 100644
> --- a/meta/recipes-devtools/clang/llvm_git.bb
> +++ b/meta/recipes-devtools/clang/llvm_git.bb
> @@ -27,7 +27,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
>  # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
>  LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'open=
cl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
>  LLVM_TARGETS_TO_BUILD ?=3D "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;Loong=
Arch;${LLVM_TARGETS_GPU}"
> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb, d)};=
BPF;${LLVM_TARGETS_GPU}"
>
>  LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
>
> @@ -37,6 +36,7 @@ HF[vardepvalue] =3D "${HF}"
>
>  EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel \
>                    -DLLVM_ENABLE_BINDINGS=3DOFF \
> +                  -DLLVM_INSTALL_UTILS=3DON \
>                    -DLLVM_ENABLE_FFI=3DON \
>                    -DLLVM_ENABLE_RTTI=3DON \
>                    -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD}' \
> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-dev=
tools/rust/rust_1.90.0.bb
> index 5d804c7398..0319d73b93 100644
> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a3899825f4=
376896e438c8c753f8dc"
>  inherit rust
>  inherit cargo_common
>
> -DEPENDS +=3D "rust-llvm"
> +DEPENDS +=3D "llvm"
>  # native rust uses cargo/rustc from binary snapshots to bootstrap
>  # but everything else should use our native builds
>  DEPENDS:append:class-target =3D " cargo-native rust-native"
> @@ -28,8 +28,8 @@ PV .=3D "${@bb.utils.contains('RUST_CHANNEL', 'stable',=
 '', '-${RUST_CHANNEL}', d)
>
>  export FORCE_CRATE_HASH =3D "${BB_TASKHASH}"
>
> -RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_LIBDIR}/llvm-rust/bin/llvm-confi=
g"
> -RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_LIBDIR_NATIVE}/llvm-rust/b=
in/llvm-config"
> +RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
> +RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-config=
"
>
>  # We don't want to use bitbakes vendoring because the rust sources do th=
eir
>  # own vendoring.
> @@ -188,6 +188,37 @@ python do_configure() {
>      bb.build.exec_func("setup_cargo_environment", d)
>  }
>
> +# llvm-config expects static libraries to be in the 'lib' directory rath=
er than 'lib64' when
> +# multilibs enabled. Since we are copying the natively built llvm-config=
 into the target sysroot
> +# and executing it there, it will default to searching in 'lib', as it i=
s unaware of the 'lib64'
> +# directory. To ensure llvm-config can locate the necessary libraries, c=
reate a symlink from 'lib'
> +do_compile:append:class-target() {
> +    # Ensure llvm-config can find static libraries in multilib setup
> +    lib64_dir=3D"${STAGING_DIR_TARGET}/usr/lib64"
> +    lib_dir=3D"${STAGING_DIR_TARGET}/usr/lib"
> +
> +    if [ -d "$lib64_dir" ]; then
> +        # If lib does not exist, symlink it to lib64
> +        if [ ! -e "$lib_dir" ]; then
> +            ln -s lib64 "$lib_dir"
> +        fi
> +
> +        # Only do per-file symlinking if lib is a real directory (not sy=
mlink)
> +        if [ -d "$lib_dir" ] && [ ! -L "$lib_dir" ]; then
> +            for lib64_file in "${lib64_dir}"/libLLVM*.a; do
> +                if [ -e "$lib64_file" ]; then
> +                    lib_name=3D$(basename "${lib64_file}")
> +                    target_link=3D"${lib_dir}/${lib_name}"
> +
> +                    if [ ! -e "${target_link}" ]; then
> +                        ln -s "../lib64/${lib_name}" "${target_link}"
> +                    fi
> +                fi
> +            done
> +        fi
> +    fi
> +}
> +
>  rust_runx () {
>      echo "COMPILE ${PN}" "$@"
>
> @@ -199,7 +230,7 @@ rust_runx () {
>      unset CXXFLAGS
>      unset CPPFLAGS
>
> -    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
> +    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz -Clink-arg=
=3D-lzstd"
>
>      # Copy the natively built llvm-config into the target so we can run =
it. Horrible,
>      # but works!
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224888): https://lists.openembedded.org/g/openembedde=
d-core/message/224888
> Mute This Topic: https://lists.openembedded.org/mt/115768136/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


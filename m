Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85AFCCD195
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 17:12:18 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.web10.9580.1760807525138893150
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Oct 2025 10:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K9Hut5ot;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63bc1aeb427so3164554d50.3
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760807524; x=1761412324; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57B+sh+OlaQaSlEzp1lYsiUCOygQtfr0tkpcYx6duLg=;
        b=K9Hut5ot/s6SwskBtLSi5XqC6BCSxBMLRYr+7zNe8NwfoT3O+/pYrLb3iDoKfBXqg+
         KrqKNz4wwS/fT811lVvnBPMLQL+IqkQ2C5rYr1HwjO16Xl1578M1l6HU+bbFLiwVhhqb
         QX2Vl4Wx5ilMFD03xIO1FxSDKSxyIJuLEZ6C9nowpuuNeSD5m/PNl8IYLPLSf5A4Zn9t
         ZEfuA94TJR4ITjrecQ+/9qWWm/ZAa1/HiDa8Y/Ma9e7t3bdVhFnsYhWLusJoSoJlkFlu
         MXlJAPF8yCvnx79QXAbIlu5XYEviFXdmvF7Or5ONlvwzFBeqyY1axtZVM/XFvwLg2rWS
         Al1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760807524; x=1761412324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57B+sh+OlaQaSlEzp1lYsiUCOygQtfr0tkpcYx6duLg=;
        b=AGyvgVb1eheF528tQEO0rp0s+b7wAoOy2JiYvLlX7n7J/gaIADQHwp0Luw8/DnCnu0
         QmPxaJ0OG0W77PBKVRqKKOVVD2mEA9nIViqunYsq7NrxBOAbDjW81ilUoCvgTOs4uMMz
         3Bx2EVAjFf/qbaXKlYbGEY9hlLVqO0Gl2J9zCW3L/39SoaZZ/VTiCMbq1tKopR3JhxZy
         mGbJJ2fcyqG4VqiLiUKiuRNMF7Ov8HAxLwA4k12MCY88RiyT7NkgQThfYMgQg94dNAqi
         w0THtQf5fedW3215WFDErr3Ztke38+UHvtGbL7ziHXLySfiDkFISUzJamMhDm+7uGW3P
         wODQ==
X-Gm-Message-State: AOJu0Yx1r2gbx/g84/UfwywDe4CxQUL/UUgva24LZjgPmlkXkhmua1Vm
	j+SbtNjgQ8AP0M7UaMyf7aL49RzzGAFq3FregcY9MNpvo6EBg76ZDBa1nMJ08OWywwFI5FxOAoI
	juNBVnJWSyG/bqW8RlLTGyIukGdiIQMQ=
X-Gm-Gg: ASbGncvi4/+0pF57DvnUxOoOdlR+XlUmggUIa1gOVS+IPl038G0AhDzpcYj+waQXs5g
	JsCk/vxLu91vlUXXeURe++yWiS25t364oB3TGGfg73DU6YiNWaIeNAQ4PdfyvY1MQZjKU51/BK4
	ytQ2f/WXUwnX45d58JrZljjJWy4aQmlRj905FCo3aimsSI6nV3+1RWnTV5yUK0B9FIl4p8bRuXQ
	DW0O9u9eX71JfTlenjfGHOOBN1ebhBpOmZYFS+AheJJTt/g+W6n+GUBBio4xG429mZBcM4MiCUQ
	ULDP1QXeTyFLZs/1V3u1Jxc5oSO5Eyy9It+djopOqva6L8rVq4ji3BPdYYafdBR1TaWlah9shVI
	zZ23+YRktWUiNRMVNeydZKIZQ
X-Google-Smtp-Source: AGHT+IGIwxWDmVB04daN/+vgsF69+6bpmf/T43BF3IZS1k6E6AEj3ptXicUV1m6QEpMGm8Cn1OhuVVjg85/G7lysGTw=
X-Received: by 2002:a05:690e:128b:b0:63e:31c3:304 with SMTP id
 956f58d0204a3-63e31c30b85mr572963d50.6.1760807524036; Sat, 18 Oct 2025
 10:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
 <20251015095914.2120664-2-Deepesh.Varatharajan@windriver.com>
 <CAMKF1srz8kTxsfHKj_GtGeaEOj3tut_gGSakz+F430aAZRxE5w@mail.gmail.com> <c1b70447-16ed-4609-ba02-02c2318a55e1@windriver.com>
In-Reply-To: <c1b70447-16ed-4609-ba02-02c2318a55e1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Oct 2025 10:11:37 -0700
X-Gm-Features: AS18NWDcRYoCOG-bZZuX5FdlNxy4hguZcHwOGimZCZbz00xlJ7obFGEw92wUY7Q
Message-ID: <CAMKF1srTD1Hx_E209=RsjZCAEmsod3TNZA7k6D=jM9=LL87GAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 2/3] rust: Use llvm instead of rust-llvm
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 17:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225076

On Fri, Oct 17, 2025 at 11:42=E2=80=AFPM Deepesh Varatharajan
<deepesh.varatharajan@windriver.com> wrote:
>
>
> On 17-10-2025 11:31, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > I am seeing a build regression when using clang as default compiler
> >
> > https://errors.yoctoproject.org/Errors/Details/885430/
> >
> > PREFERRED_TOOLCHAIN_TARGET ?=3D "clang"
> > PREFERRED_TOOLCHAIN_SDK ?=3D "clang"
> > TOOLCHAIN_NATIVE:pn-rust ?=3D "clang"
> > TOOLCHAIN_NATIVE:pn-rust-native ?=3D "clang"
> > TOOLCHAIN_NATIVE:pn-nativesdk-rust ?=3D "clang"
> Hi Khem,
>
> WIth the above mentioned conf in local.conf, I tried building rust for
> qemuarm and qemuarm64 quite
> few times and the build completed successfully without any issues for
> both native and target. Do I need
> to add any other layers on top of poky ? Do you have any branch where I
> can clone and reproduce the
> issue ? Am I missing any step in reproducing the issue ?
>

Yeah, I missed a setting which I think could be the reason

TC_CXX_RUNTIME =3D "llvm"


> Regards,
> Deepesh
> >
> > On Wed, Oct 15, 2025 at 2:59=E2=80=AFAM Varatharajan, Deepesh via
> > lists.openembedded.org
> > <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
> >> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >>
> >> Updated the Rust build to depend on llvm instead.
> >>
> >> *Summary of discussion with the rust upstream about using latest LLVM =
instead of Rust maintained LLVM fork.
> >> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-l=
lvm-fork-what-rust-uses/23489
> >>
> >> *Upstream LLVM is generally compatible:
> >> - Rust does support building with upstream (vanilla) LLVM, especially =
the latest
> >> major release and the one or two preceding ones.
> >> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updat=
ing-llvm
> >>
> >> *Impact on Yocto Rust upgrades:
> >> - Rust upgrades shall always check for updates on rust forked llvm and=
 backport
> >> the relevant patches to llvm.
> >>
> >> *Regarding the rust forked llvm local patches:
> >> - There are no local patches on rust forked llvm other than the backpo=
rted fixes
> >> from llvm master.
> >>
> >> *We are copying the natively built `llvm-config` binary into the targe=
t sysroot and running
> >> it. However, this `llvm-config` has compile time dependencies on vario=
us other arch's LLVM
> >> libraries because native-llvm is built for all oe-core supported targe=
ts.
> >>
> >> Attempting to work around this by symlinking the missing libraries fro=
m the native sysroot
> >> into the target sysroot leads to mixed architectures in the final `.rl=
ib`. Specifically,
> >> the object files extracted from those symlinked libraries within `libr=
ustc_llvm-<hash>.rlib`
> >> are built for the host, while others are correctly built for the targe=
t This results in linker
> >> failures due to file format not recognized.
> >>
> >> To resolve this, we now build llvm-target also for all oe-core support=
ed architectures in
> >> addition to the native-llvm build. This ensures that `llvm-config` and=
 all associated
> >> libraries are built for the correct target, eliminating cross-architec=
ture contamination
> >> and linker issues.
> >>
> >> *We are enabling -DLLVM_INSTALL_UTILS=3DON to ensure essential LLVM ut=
ilities like FileCheck
> >> are available, as they are required by the Rust build.
> >>
> >> Without this, the build fails with an error as below:
> >> | thread 'main' panicked at src/bootstrap/src/core/sanity.rs:315:21:
> >> | FileCheck executable "poky/build/tmp/work/x86_64-linux/rust-native/1=
.90.0/recipe-sysroot
> >> -native/usr/bin/FileCheck" does not exist
> >>
> >> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" because=
 of this following
> >> diff otherwise we will get errors during link time.
> >>
> >> Setup in rust-llvm
> >> -DLLVM_ENABLE_ZLIB=3DOFF \
> >> -DLLVM_ENABLE_ZSTD=3DOFF \
> >> -DLLVM_ENABLE_FFI=3DOFF \
> >>
> >> Setup in llvm
> >> -DLLVM_ENABLE_FFI=3DON \
> >>
> >> *When multilibs enabled:
> >>
> >> llvm-config expects static libraries to be located in the lib director=
y rather than
> >> lib64. However, since we are copying the natively built llvm-config to=
 target sysroot
> >> and running it and llvm-config doesn't know anything about lib64 exist=
ence. To accommodate
> >> this without breaking multilib behavior, we are creating a symlink fro=
m 'lib' to 'lib64'
> >> directory.
> >>
> >> Previously, when we depended on rust-llvm, this worked because we spec=
ified:
> >> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
> >>
> >> With this setup, llvm-config was installed inside ${libdir}/llvm-rust,=
 which included
> >> its own bin and lib directories. Thus, llvm-config located in bin woul=
d correctly find
> >> the libraries in the adjacent lib directory.
> >>
> >> Even when multilib was enabled or not, llvm-config would still look fo=
r libraries under
> >> lib in this structure, so everything functioned as expected.
> >>
> >> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
> >> ---
> >>   meta/recipes-devtools/clang/llvm_git.bb   |  2 +-
> >>   meta/recipes-devtools/rust/rust_1.90.0.bb | 39 ++++++++++++++++++++-=
--
> >>   2 files changed, 36 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-de=
vtools/clang/llvm_git.bb
> >> index d2b060ff88..2f47af8d7a 100644
> >> --- a/meta/recipes-devtools/clang/llvm_git.bb
> >> +++ b/meta/recipes-devtools/clang/llvm_git.bb
> >> @@ -27,7 +27,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
> >>   # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
> >>   LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', '=
opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
> >>   LLVM_TARGETS_TO_BUILD ?=3D "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;L=
oongArch;${LLVM_TARGETS_GPU}"
> >> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb, d=
)};BPF;${LLVM_TARGETS_GPU}"
> >>
> >>   LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
> >>
> >> @@ -37,6 +36,7 @@ HF[vardepvalue] =3D "${HF}"
> >>
> >>   EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel \
> >>                     -DLLVM_ENABLE_BINDINGS=3DOFF \
> >> +                  -DLLVM_INSTALL_UTILS=3DON \
> >>                     -DLLVM_ENABLE_FFI=3DON \
> >>                     -DLLVM_ENABLE_RTTI=3DON \
> >>                     -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD=
}' \
> >> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-=
devtools/rust/rust_1.90.0.bb
> >> index 5d804c7398..0319d73b93 100644
> >> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
> >> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
> >> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a389982=
5f4376896e438c8c753f8dc"
> >>   inherit rust
> >>   inherit cargo_common
> >>
> >> -DEPENDS +=3D "rust-llvm"
> >> +DEPENDS +=3D "llvm"
> >>   # native rust uses cargo/rustc from binary snapshots to bootstrap
> >>   # but everything else should use our native builds
> >>   DEPENDS:append:class-target =3D " cargo-native rust-native"
> >> @@ -28,8 +28,8 @@ PV .=3D "${@bb.utils.contains('RUST_CHANNEL', 'stabl=
e', '', '-${RUST_CHANNEL}', d)
> >>
> >>   export FORCE_CRATE_HASH =3D "${BB_TASKHASH}"
> >>
> >> -RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_LIBDIR}/llvm-rust/bin/llvm-co=
nfig"
> >> -RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_LIBDIR_NATIVE}/llvm-rus=
t/bin/llvm-config"
> >> +RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
> >> +RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-con=
fig"
> >>
> >>   # We don't want to use bitbakes vendoring because the rust sources d=
o their
> >>   # own vendoring.
> >> @@ -188,6 +188,37 @@ python do_configure() {
> >>       bb.build.exec_func("setup_cargo_environment", d)
> >>   }
> >>
> >> +# llvm-config expects static libraries to be in the 'lib' directory r=
ather than 'lib64' when
> >> +# multilibs enabled. Since we are copying the natively built llvm-con=
fig into the target sysroot
> >> +# and executing it there, it will default to searching in 'lib', as i=
t is unaware of the 'lib64'
> >> +# directory. To ensure llvm-config can locate the necessary libraries=
, create a symlink from 'lib'
> >> +do_compile:append:class-target() {
> >> +    # Ensure llvm-config can find static libraries in multilib setup
> >> +    lib64_dir=3D"${STAGING_DIR_TARGET}/usr/lib64"
> >> +    lib_dir=3D"${STAGING_DIR_TARGET}/usr/lib"
> >> +
> >> +    if [ -d "$lib64_dir" ]; then
> >> +        # If lib does not exist, symlink it to lib64
> >> +        if [ ! -e "$lib_dir" ]; then
> >> +            ln -s lib64 "$lib_dir"
> >> +        fi
> >> +
> >> +        # Only do per-file symlinking if lib is a real directory (not=
 symlink)
> >> +        if [ -d "$lib_dir" ] && [ ! -L "$lib_dir" ]; then
> >> +            for lib64_file in "${lib64_dir}"/libLLVM*.a; do
> >> +                if [ -e "$lib64_file" ]; then
> >> +                    lib_name=3D$(basename "${lib64_file}")
> >> +                    target_link=3D"${lib_dir}/${lib_name}"
> >> +
> >> +                    if [ ! -e "${target_link}" ]; then
> >> +                        ln -s "../lib64/${lib_name}" "${target_link}"
> >> +                    fi
> >> +                fi
> >> +            done
> >> +        fi
> >> +    fi
> >> +}
> >> +
> >>   rust_runx () {
> >>       echo "COMPILE ${PN}" "$@"
> >>
> >> @@ -199,7 +230,7 @@ rust_runx () {
> >>       unset CXXFLAGS
> >>       unset CPPFLAGS
> >>
> >> -    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
> >> +    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz -Clink-a=
rg=3D-lzstd"
> >>
> >>       # Copy the natively built llvm-config into the target so we can =
run it. Horrible,
> >>       # but works!
> >> --
> >> 2.49.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#224888): https://lists.openembedded.org/g/openembe=
dded-core/message/224888
> >> Mute This Topic: https://lists.openembedded.org/mt/115768136/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>


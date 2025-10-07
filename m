Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCDFCCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 20:18:07 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web11.29177.1759868284351797434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 13:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eH+t3a11;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6354a4b4871so8184886d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 13:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759868283; x=1760473083; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUQdWOxeIs1sdw6Opu278wIaKgpgNlP9krOq4u9/n68=;
        b=eH+t3a11RPEjsOme3hklOrKT1/QSJ85ll7mMGQLwHqfm2YP18axvGu6qI7BPoJujWC
         WD9AOxn+k9TE/Zs5EHMOhNYhq0OAXvZ+GMkWHICNA1YIKUfC+IjyTLwxLqEcPxt9pCAy
         UweWQuC1YM0OJ7+4zfV5EptQb/+V68d8LCeMFRiQTnJc+MAC/l+zwVoQOB4IgXcj3Z+a
         hTNGvMHiXGhFdmreqZjCnwlt0Ml4eC272b7Lu8L3UXIjVQvbiHhmWuqKA+nWH7zv9cPV
         4Do4NuvVoFuTg6bBFfadoO1yMmiphLXCuwsHxqrjxzelsqwJygX4N9k83WK4oeI8ew9w
         RdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868283; x=1760473083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUQdWOxeIs1sdw6Opu278wIaKgpgNlP9krOq4u9/n68=;
        b=lDFmd1xSTCTu5vRe1WcMFbW9RGsc1bC2O6jTrY8Yj/Egsg3aLh3G2YHaTyNH+AXHLU
         1AfpwGCMZuPrOeDo4oZnc/mxjnCDYHdqu/mSZmGD3Bd6VOB9myHGGgqAvQQhoLkfquPq
         DCucGDOUjZXLPo0ihQBghEl00ByRRcJ0TLa+V/fIbZXXivYSRnaf8zvD3HP/ATfsriKx
         sq/SxeyZj73qfrxh3a9Bc2NaGYBl6Gkr6IpP55mMrD6ksrE104GdNdhSuaLf+AE5tcv7
         q9xRg7Glhq6Z607EoxdqmXB6X/T4xV/1vxV6LS7tEMqyXCWLGYpPbgHYaf3KO1E/63zY
         az0Q==
X-Gm-Message-State: AOJu0YykOXGmppWVt20/ZeqtFAVHTzbV6UWn0OljTH2n5+euOfdXrrLa
	pCvJpbJhvPMIEUizYR/avFdqncbFA4NPjeVeUmaX+npoK75JrgY+TNjhYHieM+/MAWnOq5j0lNt
	5q7mNFbtyipeEfkn9RL02AVurVz1DYaE=
X-Gm-Gg: ASbGncu3USHGxvoK1F18OgDgRSr97jatjT+DJdOdRtkrBV8lHFdLEjKwMMXBZUU+R6L
	0/Rl9XiaW8XV46e66y2oiNIs9WKGNh4AOLL2kV+A1KAbjnR6uG+pIH0B/v+xfLTld2ILQphVzPm
	9Jj1oWL6BRDqAA7/TO35AR/tg3zyHsGTdoSjFLuD1nQ+RXv5PQF0XhUXf8+HBKBgxEjvY1erUZF
	5jJJrvO6642AqsRPKey5HMjmXyrgMrx4/r+aQnpZQqdOl0gY2dQE4ccRg1K89gylKCRRcsF2j9Z
	I/m0cj58HU/eqWGYJg/7cwil9sqhdvJZxRP4VS6hZRvoNurUQ8mBppnw+coti7d0atzOL14LvkE
	Big==
X-Google-Smtp-Source: AGHT+IHBt6jfRo7fKmInPQdBkWM0w6aKemFdBg/0F6s3/gVYs6/vgqVOLSKe67vnVMBeok1hQR/1tuSFxMTScpGV5EQ=
X-Received: by 2002:a53:864c:0:b0:636:d520:32e4 with SMTP id
 956f58d0204a3-63ccb95f9e3mr775741d50.53.1759868283045; Tue, 07 Oct 2025
 13:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
 <9433bf5a-8648-4142-a17f-69092253dd46@gmail.com> <f07bc225-e3b6-4ac9-b6e4-de52d4053618@windriver.com>
 <CAMKF1spO_MP=CtN8rdG3S=YE2qmUEVYfCDsRrxzo6pipvpJD6w@mail.gmail.com> <55dd2edb-6faf-446d-b28a-4bace9859169@windriver.com>
In-Reply-To: <55dd2edb-6faf-446d-b28a-4bace9859169@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Oct 2025 13:17:36 -0700
X-Gm-Features: AS18NWB78_TYSs_A6LQjWVcsgkGV-UxuQji_sOqVlKKlsyhyeWXRCtQUODu8W0s
Message-ID: <CAMKF1srTjQc4ib7vo4+OPdDxzKj6fWowniUQajcvRGy-nUDv2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 1/2] rust: Use clang instead of rust-llvm
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 20:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224558

On Tue, Oct 7, 2025 at 4:10=E2=80=AFAM Deepesh Varatharajan
<deepesh.varatharajan@windriver.com> wrote:
>
>
> On 02-10-2025 00:59, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Mon, Sep 29, 2025 at 1:29=E2=80=AFAM Deepesh Varatharajan
> > <deepesh.varatharajan@windriver.com> wrote:
> >>
> >> On 26-09-2025 23:00, Khem Raj wrote:
> >>> CAUTION: This email comes from a non Wind River email account!
> >>> Do not click links or open attachments unless you recognize the sende=
r
> >>> and know the content is safe.
> >>>
> >>> On 9/26/25 3:24 AM, Varatharajan, Deepesh via lists.openembedded.org
> >>> wrote:
> >>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >>>>
> >>>> Updated the Rust build to depend on Clang instead.
> >>>>
> >>>> *Summary of discussion with the rust upstream about using latest LLV=
M
> >>>> instead of Rust maintained LLVM fork.
> >>>> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of=
-llvm-fork-what-rust-uses/23489
> >>>>
> >>>>
> >>>> *Upstream LLVM is generally compatible:
> >>>> - Rust does support building with upstream (vanilla) LLVM, especiall=
y
> >>>> the latest
> >>>> major release and the one or two preceding ones.
> >>>> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#upd=
ating-llvm
> >>>>
> >>>>
> >>>> *Impact on Yocto Rust upgrades:
> >>>> - Rust upgrades shall always check for updates on rust forked llvm
> >>>> and backport
> >>>> the relevant patches to clang's llvm.
> >>>>
> >>>> *Regarding the rust forked llvm local patches:
> >>>> - There are no local patches on rust forked llvm other than the
> >>>> backported fixes
> >>>> from llvm master.
> >>>>
> >>>> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" becau=
se of
> >>>> this following
> >>>> diff otherwise we will get errors during link time.
> >>>>
> >>>> Setup in rust-llvm
> >>>> -DLLVM_ENABLE_ZLIB=3DOFF \
> >>>> -DLLVM_ENABLE_ZSTD=3DOFF \
> >>>> -DLLVM_ENABLE_FFI=3DOFF \
> >>>>
> >>>> Setup in clang
> >>>> -DLLVM_ENABLE_FFI=3DON \
> >>>> -DLLVM_ENABLE_ZSTD=3DON \
> >>>>
> >>>> *When multilibs enabled:
> >>>>
> >>>> llvm-config expects static libraries to be located in the lib
> >>>> directory rather than
> >>>> lib64. However, since LLVM is built as a non-multilib component, the
> >>>> lib directory
> >>>> doesn't contain any library files. To accommodate this without
> >>>> breaking multilib
> >>>> behavior, we copy the required library files appropriately.
> >>>>
> >>>> Previously, when we depended on rust-llvm, this worked because we
> >>>> specified:
> >>>> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
> >>>>
> >>>> With this setup, llvm-config was installed inside
> >>>> ${libdir}/llvm-rust, which included
> >>>> its own bin and lib directories. Thus, llvm-config located in bin
> >>>> would correctly find
> >>>> the libraries in the adjacent lib directory.
> >>>>
> >>>> Even when multilib was enabled or not, llvm-config would still look
> >>>> for libraries under
> >>>> lib in this structure, so everything functioned as expected.
> >>>>
> >>>> *Changes needs to be done when llvm splits from clang:
> >>>> In rust recipe:
> >>>> Update the dependency from:
> >>>> DEPENDS +=3D "ninja-native clang" to DEPENDS +=3D "ninja-native llvm=
"
> >>>>
> >>>> In llvm recipe:
> >>>> Apply the same changes that were made in the Clang recipe, as those
> >>>> configurations have now been moved to the LLVM recipe after the spli=
t.
> >>>>
> >>>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.=
com>
> >>>> ---
> >>>>    meta/recipes-devtools/clang/clang_git.bb     |  4 ++--
> >>>>    meta/recipes-devtools/clang/common-clang.inc |  6 +++---
> >>>>    meta/recipes-devtools/rust/rust_1.90.0.bb    | 18 ++++++++++++++-=
---
> >>>>    3 files changed, 19 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/meta/recipes-devtools/clang/clang_git.bb
> >>>> b/meta/recipes-devtools/clang/clang_git.bb
> >>>> index 53bca1c24f..3e117b308b 100644
> >>>> --- a/meta/recipes-devtools/clang/clang_git.bb
> >>>> +++ b/meta/recipes-devtools/clang/clang_git.bb
> >>>> @@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
> >>>>    # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.=
txt
> >>>>    LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES'=
,
> >>>> 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
> >>>>    LLVM_TARGETS_TO_BUILD ?=3D
> >>>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU=
}"
> >>>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb,
> >>>> d)};BPF;${LLVM_TARGETS_GPU}"
> >>> compiler we build is building all architectures once because it then
> >>> reuses same compiler for all cross compilers just by creating canonic=
al
> >>> symlinks, this change is not going to work.
> >> We removed this line because, for the clang class-target build, LLVM w=
as
> >> only compiling
> >> libraries for the target architecture and GPU targets and kept inside
> >> the target
> >> sysroot. Since we use the llvm-config built for the class-target durin=
g
> >> the Rust target build,
> >> it was failing due to the absence of static libraries for other
> >> architectures in the target sysroot.
> >> Here the target is x86 arch. So, it compiled libraries for x86 arch on=
ly
> >> and we can see the error
> >> for missing libraries for other archs as below:
> >>
> >> |   --- stderr
> >> |   llvm-config: error: missing:
> >> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMAArch64Info.a
> >> |   llvm-config: error: missing:
> >> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMLoongArchInfo.a
> >> |   llvm-config: error: missing:
> >> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMLoongArchDisassembler.a
> >> |   llvm-config: error: missing:
> >> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMMipsInfo.a
> >> |   llvm-config: error: missing:
> >> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMPowerPCInfo.a
> >> |   llvm-config: error: missing:
> >> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMRISCVTargetMCA.a
> >> .
> >> .
> >> .
> >> |   thread 'main' panicked at compiler/rustc_llvm/build.rs:277:16:
> >> |   command did not execute successfully:
> >> "poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/u=
sr/lib/llvm-config"
> >>
> >> "--link-static" "--libs" "aarch64" "amdgpu" "arm" "asmparser"
> >> "bitreader" "bitwriter" "bpf" "coverage" "instrumentation" "ipo" "link=
er"
> >> "loongarch" "lto" "mips" "nvptx" "powerpc" "riscv" "x86"
> >> |   expected success, got: exit status: 1
> >>
> >> Maybe instead of removing. Can we change
> >> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb,
> >> d)};BPF;${LLVM_TARGETS_GPU}"
> >> to
> >> -LLVM_TARGETS_TO_BUILD:class-target ?=3D
> >> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;;BPF;${LLVM_TARGETS_=
GPU}"
> >> ?
> > I think we don't want to build all the general arches for target, only
> > the target arch and gpu arches
> > is what is needed.  If we build all the backends, that will slow down
> > things. But if target rust needs
> > to support all the architectures to generate code for, then we don't
> > have much choice. Can you see
> > if we are ok to just target one architecture ?
> The issue doesn't originate from Rust directly, it stems from the
> following logic
> in the Rust recipe, where the natively built llvm-config is copied into
> the target sysroot:
>
>      # Copy the natively built llvm-config into the target so we can run
> it. Horrible,
>      # but works!
>      if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D
> ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
>          mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
>          cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
>          if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
>              patchelf --set-rpath \$ORIGIN/../../../../../`basename
> ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
>          else
>              patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
>          fi
>      fi
>
> Since llvm-config is being copied from ${STAGING_BINDIR_NATIVE} to
> ${STAGING_BINDIR},
> and the native Clang was built with the following configuration:
> LLVM_TARGETS_TO_BUILD ?=3D
> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"
>
> The copied llvm-config will expect the corresponding target libraries to
> be present in the ${STAGING_LIBDIR}.
>
> To address this issue, as far as I can see we have three options.
>
> 1) Build clang-target also for all mentioned archs for clang-native.
> 2) Copy all the required libraries from ${STAGING_LIBDIR_NATIVE} to
> ${STAGING_LIBDIR}.
> 3) Instead of copying llvm-config from ${STAGING_BINDIR_NATIVE} to
> ${STAGING_BINDIR},
>       directly make rust-target build dependent
> on  ${STAGING_BINDIR_NATIVE}/llvm-config.
>
> Are there any better or cleaner alternatives to handle this situation?
> Any suggestions would be greatly appreciated.

I would prefer option 3 since these libs are inherently cross built,
it perhaps does not matter if
they come from native or cross built clang. But that would have been
default before this copy dance
was done. I might have forgotten now, if this was done specifically to addr=
ess a
case which we can testout now.

>
> Regards,
> Deepesh
>
> >>>>    LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
> >>>>
> >>>> @@ -107,6 +106,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DO=
FF \
> >>>>                      -DLLVM_ENABLE_PIC=3DON \
> >>>>                      -DCLANG_DEFAULT_PIE_ON_LINUX=3DON \
> >>>>                      -DLLVM_BINDINGS_LIST=3D'' \
> >>>> +               -DLLVM_INSTALL_UTILS=3DON \
> >>> tabs vs spaces inconsistenty. Please fix it.
> >> Sure.
> >>>>                      -DLLVM_ENABLE_FFI=3DON \
> >>>>                      -DLLVM_ENABLE_ZSTD=3DON \
> >>>>                      -DFFI_INCLUDE_DIR=3D$(pkg-config
> >>>> --variable=3Dincludedir libffi) \
> >>>> @@ -137,7 +137,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
> >>>> -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
> >>>> -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
> >>>> -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-str=
ip \
> >>>> -                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
> >>>> + -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d)} \
> >>> why is this change needed ?
> >>>
> >> I made this change to ensure that LLVM_TARGET_ARCH is set correctly to
> >> the actual target architecture.
> >> However, it appears that even without this change, the build completes
> >> successfully for the target. I checked
> >> and printed the value of HOST_ARCH and realized it was already set
> >> correctly my mistake. This change is
> >> not required.
> > LLVM_TARGET_ARCH is different than the backend architecture which is
> > denoted by LLVM_TARGETS_TO_BUILD
> >
> >>>> -DLLVM_DEFAULT_TARGET_TRIPLE=3D${TARGET_SYS}${HF} \
> >>>>                      -DLLVM_HOST_TRIPLE=3D${TARGET_SYS}${HF} \
> >>>>                      -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
> >>>> diff --git a/meta/recipes-devtools/clang/common-clang.inc
> >>>> b/meta/recipes-devtools/clang/common-clang.inc
> >>>> index bf3a63914a..c22e3c1b19 100644
> >>>> --- a/meta/recipes-devtools/clang/common-clang.inc
> >>>> +++ b/meta/recipes-devtools/clang/common-clang.inc
> >>>> @@ -30,10 +30,10 @@ def get_clang_arch(bb, d, arch_var):
> >>>>        elif re.match('aarch64$', a):                      return
> >>>> 'AArch64'
> >>>>        elif re.match('aarch64_be$', a):                   return
> >>>> 'AArch64'
> >>>>        elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mi=
ps'
> >>>> -    elif re.match('riscv32$', a):                      return 'RISC=
V'
> >>>> -    elif re.match('riscv64$', a):                      return 'RISC=
V'
> >>>> +    elif re.match('riscv32$', a):                      return 'risc=
v32'
> >>>> +    elif re.match('riscv64$', a):                      return 'risc=
v64'
> >>> This is representing LLVM backend name and not normal arch and clang
> >>> uses RISCV for both rv64 and rv32
> >>>
> >> After this change were made,
> >> -                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
> >> +                  -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d=
)} \
> >> do_configure of clang failed
> >> with the following error:
> >>
> >> | CMake Error at cmake/config-ix.cmake:585 (message):
> >> |   Unknown architecture riscv
> >>
> >> Since this change is irrelevant
> >> -                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
> >> +                  -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d=
)} \
> >>
> >> The below changes are also not needed.
> >>    -    elif re.match('riscv32$', a):                      return 'RIS=
CV'
> >>    -    elif re.match('riscv64$', a):                      return 'RIS=
CV'
> >> +    elif re.match('riscv32$', a):                      return 'riscv3=
2'
> >> +    elif re.match('riscv64$', a):                      return 'riscv6=
4'
> >> -    elif re.match('loongarch64$', a):                  return 'LoongA=
rch'
> >> +    elif re.match('loongarch64$', a):                  return
> >> 'loongarch64'
> >>>>        elif re.match('p(pc|owerpc)(|64)', a):             return
> >>>> 'PowerPC'
> >>>> -    elif re.match('loongarch64$', a):                  return
> >>>> 'LoongArch'
> >>>> +    elif re.match('loongarch64$', a):                  return
> >>>> 'loongarch64'
> >>> same problem as above here
> >>>
> >>>>        else:
> >>>>            bb.fatal("Unhandled architecture %s" % arch_val)
> >>>>            return ""
> >>>> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb
> >>>> b/meta/recipes-devtools/rust/rust_1.90.0.bb
> >>>> index 5d804c7398..c2cb8f8829 100644
> >>>> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
> >>>> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
> >>>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> >>>> "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c753f8dc"
> >>>>    inherit rust
> >>>>    inherit cargo_common
> >>>>
> >>>> -DEPENDS +=3D "rust-llvm"
> >>>> +DEPENDS +=3D "ninja-native clang"
> >>> I think using 'llvm' instead of 'clang' here is more appropriate to
> >>> represent the dependency, clang provides llvm as well, it also ensure=
s
> >>> that when we split llvm out of clang recipe then you do not need to
> >>> change it.
> >> Sure will do that.
> >>>>    # native rust uses cargo/rustc from binary snapshots to bootstrap
> >>>>    # but everything else should use our native builds
> >>>>    DEPENDS:append:class-target =3D " cargo-native rust-native"
> >>>> @@ -28,8 +28,8 @@ PV .=3D "${@bb.utils.contains('RUST_CHANNEL',
> >>>> 'stable', '', '-${RUST_CHANNEL}', d)
> >>>>
> >>>>    export FORCE_CRATE_HASH =3D "${BB_TASKHASH}"
> >>>>
> >>>> -RUST_ALTERNATE_EXE_PATH ?=3D
> >>>> "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
> >>>> -RUST_ALTERNATE_EXE_PATH_NATIVE =3D
> >>>> "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
> >>>> +RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
> >>>> +RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-c=
onfig"
> >>>>
> >>>>    # We don't want to use bitbakes vendoring because the rust source=
s
> >>>> do their
> >>>>    # own vendoring.
> >>>> @@ -188,6 +188,16 @@ python do_configure() {
> >>>>        bb.build.exec_func("setup_cargo_environment", d)
> >>>>    }
> >>>>
> >>>> +#llvm-config expecting static libraries in 'lib' instead of 'lib64'=
.
> >>>> +#Since LLVM is built as a non-multilib component, the 'lib' directo=
ry
> >>>> +#doesn't have any library files when multilibs enabled. So, copying
> >>>> +#library files without impacting multilib behavior.
> >>>> +do_compile:append:class-target() {
> >>>> +if [ -d ${STAGING_DIR_TARGET}/usr/lib64 ]; then
> >>>> +    cp ${STAGING_DIR_TARGET}/usr/lib64/libLLVM*.a
> >>>> ${STAGING_DIR_TARGET}/usr/lib/.
> >>>> +fi
> >>>> +}
> >>>> +
> >>>>    rust_runx () {
> >>>>        echo "COMPILE ${PN}" "$@"
> >>>>
> >>>> @@ -199,7 +209,7 @@ rust_runx () {
> >>>>        unset CXXFLAGS
> >>>>        unset CPPFLAGS
> >>>>
> >>>> -    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
> >>>> +    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz
> >>>> -Clink-arg=3D-lzstd"
> >>>>
> >>>>        # Copy the natively built llvm-config into the target so we c=
an
> >>>> run it. Horrible,
> >>>>        # but works!
> >>>>
> >>>>
> >>>>
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#224075):
> >>>> https://lists.openembedded.org/g/openembedded-core/message/224075
> >>>> Mute This Topic: https://lists.openembedded.org/mt/115446166/1997914
> >>>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> >>>> [raj.khem@gmail.com]
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>


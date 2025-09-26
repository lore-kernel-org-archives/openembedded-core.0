Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3DFCAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 17:31:06 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.1054.1758907861044052905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 10:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jxbiNbwe;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-8a936b682b3so184795239f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758907860; x=1759512660; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1F0RVqMU8cKseI7jp65tq4oFoBeqdtOiz3XpmQNX9Y=;
        b=jxbiNbwek8UwIR2jXbLSF5vgDJsb/+m/wpm6jAy8IZbUbN2A4DWOf5EAb6Pxc6dRQB
         f1Ei43mQQm2C5MtoUBZyMlIzsn6LDyZtIj9fRiV8UtZPM0jSZEoDb1L3NMKvfNB4KZXu
         fRvX7RN/RKpK0n7JTZ6JxZFq/GSQwL8aA9WnCbFbYxE0Mt3PkkyeSk9Jj0jeCXBRPFam
         wZvUNjNjWbCxpFkgoupub2XM5RbxFkc8KMUjdij5PyYjQ4uMfDoURxe0dOTLzsMZsSox
         NgrzQIiAvbHObcnmnARpkpUgrzlTKP1g4TeKHHvRGUebH+IGLvs4Os/AE9bsk2VOM0VM
         IBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758907860; x=1759512660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1F0RVqMU8cKseI7jp65tq4oFoBeqdtOiz3XpmQNX9Y=;
        b=qfnhw1t4qAwh8L//qIvOBqlXXkGMeaG9wW2i4C4P4G/9f14U4NDntE56MMjRNIRSUl
         wPO2ULiZYNFgXcwl5jYvLvnSbpLikfp9u7LSmCyo+ns8Gox7cEfekVkUHDynZ8n1pbKc
         MXih3kV1/K3np+JsNqgkxcL7ahrKhTfgfEr1uFgW/TtvB9Ik9d9fUgvzDm31j/F6hsZ2
         YvwRJc8dSXEVD86z0PSF2mLMIP+gDHpm6lVG5vVgwzwZUelyN1p4n9bM8eG1HIqQ/XIn
         HK3gwzgSXAzNWZPJ00r6q1AcHB8C0hR+h6sLF5VgpDoS0rg9SynXlelsgljQPi4wrjeN
         DxTA==
X-Forwarded-Encrypted: i=1; AJvYcCX2HGpMruaG2xVI2PtM/5/GZYRPK93wc5jT769nISkVKsZpWpdGBwm7M6O9BGfcrJ65bTwQorXp/b7q+zAx/pG8HA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxCBizEMIqKp83o5WW3wDaI1TdAcrLZ7zMWBiuPh8BNNstEzFci
	ualfz9oDUcKghKYDa3TeZEAL9WZ+Ud/IzTaeaKEHOO+hG6b7d3T814wYXv43LH3h
X-Gm-Gg: ASbGncsScK6oS9hu0aJoptqlCJ9Y6dy84tJGHBc2dhZF4SEaXvfOKbfkM502Kax7nRl
	+4j5wWH/sJ7QvPOzPDIEHybQT9i2SfDxgVZAYt5YpPNzNapNqHfnB93iT9nykTcngUifjEEiOML
	8magrEbYIQu3RxHdKCAQsUdp+4Y+8iMmO5mV68mf3S+UprwKHha8b2G/IjuLXf+I9MYh40N/+nD
	E7RQft4TIOIAo8KYUb5mryIeXvT/2C1ZklZgt3+w1P5tCIRLdATcgKmaYNYeelcEWEB8QEcuZ0Y
	hzB9wIu4g5we/rOhHSBRWHHaIC7kjk+tmiXqL+BSFoxz7Koq1zc8QcoK5RWltfjVSULUU3bPDSJ
	CIF6tmGnbGvSRNV/kI3Vcrr3EkVvgpr+Va1JNul0XO+442drUGKKN9+Pi8/N4RzDaBeTSntRJJb
	tdm4Jzi6eiIJ+dEs6A2OqzcN/IYKSyeRZ7d7zVEn3e5TbsjjapQ72WNv9COP6DagyXEEltlXXoT
	TnNsT0Bhxjsyc5vHkEA5bLemEWNnzJx/GgXPWTuHw==
X-Google-Smtp-Source: AGHT+IEUvOx1Vc7jcN4U1pxLDPP2gwUQFYt3XivULyGWZXpuRNABCkzcJFhI9Av7gXmolZNXLndyaQ==
X-Received: by 2002:a05:6602:6b87:b0:892:a19e:fc7e with SMTP id ca18e2360f4ac-9016c57c232mr1355392439f.16.1758907859946;
        Fri, 26 Sep 2025 10:30:59 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:8d7c:fa44:7948:cb52? ([2601:646:8201:fd20:8d7c:fa44:7948:cb52])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-903dbb2b459sm197374039f.0.2025.09.26.10.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 10:30:59 -0700 (PDT)
Message-ID: <9433bf5a-8648-4142-a17f-69092253dd46@gmail.com>
Date: Fri, 26 Sep 2025 10:30:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3 1/2] rust: Use clang instead of rust-llvm
To: deepesh.varatharajan@windriver.com,
 openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 17:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224090



On 9/26/25 3:24 AM, Varatharajan, Deepesh via lists.openembedded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> 
> Updated the Rust build to depend on Clang instead.
> 
> *Summary of discussion with the rust upstream about using latest LLVM instead of Rust maintained LLVM fork.
> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489
> 
> *Upstream LLVM is generally compatible:
> - Rust does support building with upstream (vanilla) LLVM, especially the latest
> major release and the one or two preceding ones.
> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm
> 
> *Impact on Yocto Rust upgrades:
> - Rust upgrades shall always check for updates on rust forked llvm and backport
> the relevant patches to clang's llvm.
> 
> *Regarding the rust forked llvm local patches:
> - There are no local patches on rust forked llvm other than the backported fixes
> from llvm master.
> 
> *We now add these flags "-Clink-arg=-lz -Clink-arg=-lzstd" because of this following
> diff otherwise we will get errors during link time.
> 
> Setup in rust-llvm
> -DLLVM_ENABLE_ZLIB=OFF \
> -DLLVM_ENABLE_ZSTD=OFF \
> -DLLVM_ENABLE_FFI=OFF \
> 
> Setup in clang
> -DLLVM_ENABLE_FFI=ON \
> -DLLVM_ENABLE_ZSTD=ON \
> 
> *When multilibs enabled:
> 
> llvm-config expects static libraries to be located in the lib directory rather than
> lib64. However, since LLVM is built as a non-multilib component, the lib directory
> doesn't contain any library files. To accommodate this without breaking multilib
> behavior, we copy the required library files appropriately.
> 
> Previously, when we depended on rust-llvm, this worked because we specified:
> -DCMAKE_INSTALL_PREFIX:PATH=${libdir}/llvm-rust
> 
> With this setup, llvm-config was installed inside ${libdir}/llvm-rust, which included
> its own bin and lib directories. Thus, llvm-config located in bin would correctly find
> the libraries in the adjacent lib directory.
> 
> Even when multilib was enabled or not, llvm-config would still look for libraries under
> lib in this structure, so everything functioned as expected.
> 
> *Changes needs to be done when llvm splits from clang:
> In rust recipe:
> Update the dependency from:
> DEPENDS += "ninja-native clang" to DEPENDS += "ninja-native llvm"
> 
> In llvm recipe:
> Apply the same changes that were made in the Clang recipe, as those
> configurations have now been moved to the LLVM recipe after the split.
> 
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>   meta/recipes-devtools/clang/clang_git.bb     |  4 ++--
>   meta/recipes-devtools/clang/common-clang.inc |  6 +++---
>   meta/recipes-devtools/rust/rust_1.90.0.bb    | 18 ++++++++++++++----
>   3 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
> index 53bca1c24f..3e117b308b 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH = "${S}/llvm"
>   # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
>   LLVM_TARGETS_GPU ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
>   LLVM_TARGETS_TO_BUILD ?= "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"
> -LLVM_TARGETS_TO_BUILD:class-target ?= "${@get_clang_host_arch(bb, d)};BPF;${LLVM_TARGETS_GPU}"

compiler we build is building all architectures once because it then 
reuses same compiler for all cross compilers just by creating canonical 
symlinks, this change is not going to work.

>   
>   LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?= ""
>   
> @@ -107,6 +106,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
>                     -DLLVM_ENABLE_PIC=ON \
>                     -DCLANG_DEFAULT_PIE_ON_LINUX=ON \
>                     -DLLVM_BINDINGS_LIST='' \
> +		  -DLLVM_INSTALL_UTILS=ON \

tabs vs spaces inconsistenty. Please fix it.

>                     -DLLVM_ENABLE_FFI=ON \
>                     -DLLVM_ENABLE_ZSTD=ON \
>                     -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
> @@ -137,7 +137,7 @@ EXTRA_OECMAKE:append:class-target = "\
>                     -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
>                     -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
>                     -DCMAKE_STRIP=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-strip \
> -                  -DLLVM_TARGET_ARCH=${HOST_ARCH} \
> +                  -DLLVM_TARGET_ARCH=${@get_clang_target_arch(bb, d)} \

why is this change needed ?

>                     -DLLVM_DEFAULT_TARGET_TRIPLE=${TARGET_SYS}${HF} \
>                     -DLLVM_HOST_TRIPLE=${TARGET_SYS}${HF} \
>                     -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
> diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
> index bf3a63914a..c22e3c1b19 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -30,10 +30,10 @@ def get_clang_arch(bb, d, arch_var):
>       elif re.match('aarch64$', a):                      return 'AArch64'
>       elif re.match('aarch64_be$', a):                   return 'AArch64'
>       elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
> -    elif re.match('riscv32$', a):                      return 'RISCV'
> -    elif re.match('riscv64$', a):                      return 'RISCV'
> +    elif re.match('riscv32$', a):                      return 'riscv32'
> +    elif re.match('riscv64$', a):                      return 'riscv64'

This is representing LLVM backend name and not normal arch and clang 
uses RISCV for both rv64 and rv32

>       elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
> -    elif re.match('loongarch64$', a):                  return 'LoongArch'
> +    elif re.match('loongarch64$', a):                  return 'loongarch64'

same problem as above here

>       else:
>           bb.fatal("Unhandled architecture %s" % arch_val)
>           return ""
> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
> index 5d804c7398..c2cb8f8829 100644
> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
>   inherit rust
>   inherit cargo_common
>   
> -DEPENDS += "rust-llvm"
> +DEPENDS += "ninja-native clang"

I think using 'llvm' instead of 'clang' here is more appropriate to 
represent the dependency, clang provides llvm as well, it also ensures
that when we split llvm out of clang recipe then you do not need to 
change it.

>   # native rust uses cargo/rustc from binary snapshots to bootstrap
>   # but everything else should use our native builds
>   DEPENDS:append:class-target = " cargo-native rust-native"
> @@ -28,8 +28,8 @@ PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)
>   
>   export FORCE_CRATE_HASH = "${BB_TASKHASH}"
>   
> -RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
> -RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
> +RUST_ALTERNATE_EXE_PATH ?= "${STAGING_BINDIR}/llvm-config"
> +RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_BINDIR_NATIVE}/llvm-config"
>   
>   # We don't want to use bitbakes vendoring because the rust sources do their
>   # own vendoring.
> @@ -188,6 +188,16 @@ python do_configure() {
>       bb.build.exec_func("setup_cargo_environment", d)
>   }
>   
> +#llvm-config expecting static libraries in 'lib' instead of 'lib64'.
> +#Since LLVM is built as a non-multilib component, the 'lib' directory
> +#doesn't have any library files when multilibs enabled. So, copying
> +#library files without impacting multilib behavior.
> +do_compile:append:class-target() {
> +if [ -d ${STAGING_DIR_TARGET}/usr/lib64 ]; then
> +    cp ${STAGING_DIR_TARGET}/usr/lib64/libLLVM*.a ${STAGING_DIR_TARGET}/usr/lib/.
> +fi
> +}
> +
>   rust_runx () {
>       echo "COMPILE ${PN}" "$@"
>   
> @@ -199,7 +209,7 @@ rust_runx () {
>       unset CXXFLAGS
>       unset CPPFLAGS
>   
> -    export RUSTFLAGS="${RUST_DEBUG_REMAP}"
> +    export RUSTFLAGS="${RUST_DEBUG_REMAP} -Clink-arg=-lz -Clink-arg=-lzstd"
>   
>       # Copy the natively built llvm-config into the target so we can run it. Horrible,
>       # but works!
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224075): https://lists.openembedded.org/g/openembedded-core/message/224075
> Mute This Topic: https://lists.openembedded.org/mt/115446166/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



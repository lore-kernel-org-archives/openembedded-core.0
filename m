Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAE7C83F20
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 16:32:59 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.18323.1752251571657272733
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 09:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MZvS8a8v;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-40a4bf1eb0dso1063197b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 09:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752251571; x=1752856371; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y65d0YVdLoJuqrpqF6O/WowcxGx2qcLolP85Tp9PlfA=;
        b=MZvS8a8vdseD96K/exib8bQKf3v/kdGZz7B+qxisXFnKK2RtAOboL7181k9xLsTVLz
         +W2hk7+tgM0gVVaOy2e8/W7D68TkM4MZpXhlR3r6LDdpdGVG5kpyrBFY63BftqXn36kB
         I9sXwF1kgtmyVhGcPqI5AwpHPSy4AMIolB5csEk8s7JqjpJVhSnHXLfj4X/rgqcc7Vfh
         Yf3ECykXLspXSz4nBMSIUeYCnTAAWYh0IvPFvFj2ZdR4j1tSMvqrTMUigIQjVUSWzveN
         L3E3niq7i21/y8bCzajhhlmp1zXlefzuePraqupjTe+Tprot5Sq3dsuH/iEJWxIcKs67
         kNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752251571; x=1752856371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y65d0YVdLoJuqrpqF6O/WowcxGx2qcLolP85Tp9PlfA=;
        b=vEHsnvTOf0zoZuHz8MvK2zl3L9Tj653ue9HNURpugS/u+CfHqAhnWRhe4OcxIjW0r4
         GqPXoLDyTAb5a0/29GMFp4XQoevS2rDnewIXhM0utwyGg6ciKNKXeQPufIK6QR+wbT5F
         q96WDg5IIJNvqz2YUcstkEf/jwjhupR8kdVXevnpGt9B/CU4Lffyp2EvjIBMhhrQfVqy
         QWizEDbV0KY95OamSpb70gmMeSRl1uoP2NB01+oV9fBsK/KLs45s9hrBIA60HSBcLUSt
         bKz7YwyfyMT9R7xN2lHvcPYCyioa3h068oQqXHVnEQ7VTqB1ZpL2gRc4JJAPyzBt+DfO
         MBtA==
X-Forwarded-Encrypted: i=1; AJvYcCWZo7UYLVtkBqK5HSZFH3Pq2SLKMbSlmFpS35UQCnMTBVLcnAv84lz6TB+iE49xetWJLT/PbDGSjyxvZSsKvciz3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyn/D2j0z2qHkDNgYygvfIGiGQRctOXwmfn1pkCnzrHOI/ttIMW
	s6G50+SYG+0koBd7aF+H/jgO1q2wln9k9HNJ9hFRWkGxoAIdqdR4hp3q
X-Gm-Gg: ASbGncsTTEsINNDYsvmHm1E1gNDZzEmOdZn+Ps37ohWVpMTt+kLYJdDaCP0uS4ZsW7D
	WTUYrUD/bb+KKOCeeNcmTiu4qrwweN/L2UG8G9TNUOZrikdOtRnxNw8BmPK9IvGZRoG4viDDH50
	8xVXc6UM+FOmHQqzTNEfXVes1ynyz5xGbPyEIBV6/Z2+8SACCZ9SGSqFd+3tzSYl0FmCkU63xav
	/VEaY3fjORe4cgbdsbM1QYOfEOVI8p+rlXq5OodOS7D9k22M/LrSr36/alMEmw+PwNfWAYEynAv
	3uXqg1Kci16D54QenCTbET1wz31KUotHL92OwMG33D7a6DXjfLcXrDH90r4RLzlqXf0UGumHbhA
	JqgOoVWN1Ih4ek6Y6klMG6PrcXD21IMf9zzP/k+Nl14UjOz9TdGMzhipT16sFzA3ecJNmV3TXuI
	BFcBKla9CmNw==
X-Google-Smtp-Source: AGHT+IH7OBDaPifUp3wf8hZrsEMN3ick4WjFLLihhOoKlbaREcA7vjrWMCHsFbiIOuWEAKIB7+s1Zw==
X-Received: by 2002:a05:6808:5242:b0:40a:561a:9e8c with SMTP id 5614622812f47-41537567287mr2702487b6e.3.1752251570720;
        Fri, 11 Jul 2025 09:32:50 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:f056:4b03:1ef9:9958? ([2601:646:8201:fd20:f056:4b03:1ef9:9958])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf10a5ba3sm612040a34.24.2025.07.11.09.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 09:32:50 -0700 (PDT)
Message-ID: <d5adf3d0-e363-4dba-bec5-d8f2c8967b7c@gmail.com>
Date: Fri, 11 Jul 2025 09:32:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] lldb: add new recipe, split out of clang
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250711155136.2172651-1-ross.burton@arm.com>
 <20250711155136.2172651-3-ross.burton@arm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250711155136.2172651-3-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 16:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220159



On 7/11/25 8:51 AM, Ross Burton via lists.openembedded.org wrote:
> LLDB takes a reasonable amount of time to compile, but also isn't an
> essential component of the LLVM suite.
> 
> Instead of always building it when we build clang, split it out into a
> separate recipe.
> 
> On my build machine where clang takes 21 minutes to build with lldb, it
> takes 19 minutes without lldb.
> 

These changes look fine in general to me.

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/conf/distro/include/maintainers.inc |  1 +
>   meta/recipes-devtools/clang/clang_git.bb | 54 +++---------------------
>   meta/recipes-devtools/clang/lldb_git.bb  | 53 +++++++++++++++++++++++
>   3 files changed, 61 insertions(+), 47 deletions(-)
>   create mode 100644 meta/recipes-devtools/clang/lldb_git.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 331c438fd67..f49d7317ee9 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -479,6 +479,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>   RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>   RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>   RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
> +RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
>   RECIPE_MAINTAINER:pn-llvm-project-source-20.1.7 = "Khem Raj <raj.khem@gmail.com>"
>   RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
>   RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
> index 0f1b950cc63..be56b169c29 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -55,7 +55,7 @@ PACKAGECONFIG_CLANG_COMMON = "build-id eh libedit rtti shared-libs libclang-pyth
>                                 ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
>                                 "
>   
> -PACKAGECONFIG ??= "lldb-wchar terminfo \
> +PACKAGECONFIG ??= "terminfo \
>                      ${PACKAGECONFIG_CLANG_COMMON} \
>                      ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto', d)} \
>                      "
> @@ -79,11 +79,9 @@ PACKAGECONFIG[clangd-dexp] = "-DCLANGD_BUILD_DEXP=ON,-DCLANGD_BUILD_DEXP=OFF,,"
>   PACKAGECONFIG[compiler-rt] = "-DCLANG_DEFAULT_RTLIB=compiler-rt,,"
>   PACKAGECONFIG[eh] = "-DLLVM_ENABLE_EH=ON,-DLLVM_ENABLE_EH=OFF,,"
>   PACKAGECONFIG[libcplusplus] = "-DCLANG_DEFAULT_CXX_STDLIB=libc++,,"
> -PACKAGECONFIG[libedit] = "-DLLVM_ENABLE_LIBEDIT=ON -DLLDB_ENABLE_LIBEDIT=ON,-DLLVM_ENABLE_LIBEDIT=OFF -DLLDB_ENABLE_LIBEDIT=OFF,libedit libedit-native"
> +PACKAGECONFIG[libedit] = "-DLLVM_ENABLE_LIBEDIT=ON,-DLLVM_ENABLE_LIBEDIT=OFF,libedit libedit-native"
>   PACKAGECONFIG[libomp] = "-DCLANG_DEFAULT_OPENMP_RUNTIME=libomp,,"
>   PACKAGECONFIG[lld] = "-DCLANG_DEFAULT_LINKER=lld,,"
> -PACKAGECONFIG[lldb-lua] = "-DLLDB_ENABLE_LUA=ON,-DLLDB_ENABLE_LUA=OFF,lua"
> -PACKAGECONFIG[lldb-wchar] = "-DLLDB_EDITLINE_USE_WCHAR=1,-DLLDB_EDITLINE_USE_WCHAR=0,"
>   PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
>   PACKAGECONFIG[pfm] = "-DLLVM_ENABLE_LIBPFM=ON,-DLLVM_ENABLE_LIBPFM=OFF,libpfm,"
>   PACKAGECONFIG[rtti] = "-DLLVM_ENABLE_RTTI=ON,-DLLVM_ENABLE_RTTI=OFF,,"
> @@ -107,9 +105,8 @@ LLVM_BINDINGS_LIST;LLVM_ENABLE_FFI;FFI_INCLUDE_DIR;LLVM_OPTIMIZED_TABLEGEN;\
>   LLVM_ENABLE_RTTI;LLVM_ENABLE_EH;LLVM_BUILD_EXTERNAL_COMPILER_RT;CMAKE_SYSTEM_NAME;\
>   CMAKE_BUILD_TYPE;BUILD_SHARED_LIBS;LLVM_ENABLE_PROJECTS;LLVM_ENABLE_RUNTIMES;LLVM_BINUTILS_INCDIR;\
>   LLVM_TARGETS_TO_BUILD;LLVM_EXPERIMENTAL_TARGETS_TO_BUILD;PYTHON_EXECUTABLE;\
> -PYTHON_LIBRARY;PYTHON_INCLUDE_DIR;LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN;LLDB_EDITLINE_USE_WCHAR;\
> -LLVM_ENABLE_LIBEDIT;LLDB_ENABLE_LIBEDIT;LLDB_PYTHON_RELATIVE_PATH;LLDB_PYTHON_EXE_RELATIVE_PATH;\
> -LLDB_PYTHON_EXT_SUFFIX;CMAKE_C_FLAGS_RELEASE;CMAKE_CXX_FLAGS_RELEASE;CMAKE_ASM_FLAGS_RELEASE;\
> +PYTHON_LIBRARY;PYTHON_INCLUDE_DIR;LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN;\
> +LLVM_ENABLE_LIBEDIT;CMAKE_C_FLAGS_RELEASE;CMAKE_CXX_FLAGS_RELEASE;CMAKE_ASM_FLAGS_RELEASE;\
>   CLANG_DEFAULT_CXX_STDLIB;CLANG_DEFAULT_RTLIB;CLANG_DEFAULT_UNWINDLIB;\
>   CLANG_DEFAULT_OPENMP_RUNTIME;LLVM_ENABLE_PER_TARGET_RUNTIME_DIR;\
>   LLVM_BUILD_TOOLS;LLVM_USE_HOST_TOOLS;LLVM_CONFIG_PATH;LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR;\
> @@ -133,13 +130,7 @@ HF[vardepvalue] = "${HF}"
>   
>   # Ensure that LLVM_PROJECTS does not contain compiler runtime components e.g. libcxx etc
>   # they are enabled via LLVM_ENABLE_RUNTIMES
> -LLVM_PROJECTS ?= "clang;clang-tools-extra;libclc;lld${LLDB}"
> -LLDB ?= ";lldb"
> -# LLDB support for RISCV32/Mips32 does not work yet
> -LLDB:riscv32 = ""
> -LLDB:mips = ""
> -LLDB:mipsel = ""
> -LLDB:powerpc = ""
> +LLVM_PROJECTS ?= "clang;clang-tools-extra;libclc;lld"
>   
>   # linux hosts (.so) on Windows .pyd
>   SOLIBSDEV:mingw32 = ".pyd"
> @@ -172,10 +163,7 @@ EXTRA_OECMAKE:append:class-native = "\
>                     -DPYTHON_EXECUTABLE='${PYTHON}' \
>   "
>   EXTRA_OECMAKE:append:class-nativesdk = "\
> -                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
> -                                                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=${PYTHON_PN} \
> -                                                  -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
> -                                                  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
> +                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
>                     -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
>                     -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
>                     -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
> @@ -183,9 +171,6 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
>                     -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
>                     -DLLVM_HEADERS_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-min-tblgen \
>                     -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
> -                  -DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
> -                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=${PYTHON_PN} \
> -                  -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
>                     -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
>                     -DPYTHON_EXECUTABLE='${PYTHON}' \
>   "
> @@ -202,9 +187,6 @@ EXTRA_OECMAKE:append:class-target = "\
>                     -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
>                     -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
>                     -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
> -                  -DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
> -                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=${bindir} \
> -                  -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
>   "
>   
>   DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native ninja-native swig-native spirv-tools-native llvm-tblgen-native"
> @@ -317,12 +299,10 @@ PROVIDES:append:class-target = " llvm libclc"
>   PROVIDES:append:class-nativesdk = " nativesdk-llvm nativesdk-libclc"
>   
>   PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
> -             libclang lldb lldb-server liblldb llvm-linker-tools"
> +             libclang llvm-linker-tools"
>   
>   BBCLASSEXTEND = "native nativesdk"
>   
> -RDEPENDS:lldb += "${PN}-lldb-python lldb-server"
> -
>   RDEPENDS:${PN}-tools += "\
>     perl-module-digest-md5 \
>     perl-module-file-basename \
> @@ -343,8 +323,6 @@ FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${libdir}/L
>   
>   FILES:${PN}-libclang-cpp = "${libdir}/libclang-cpp.so.*"
>   
> -FILES:${PN}-lldb-python = "${libdir}/python*/site-packages/lldb/*"
> -
>   FILES:${PN}-libclang-python = "${PYTHON_SITEPACKAGES_DIR}/clang/*"
>   
>   FILES:${PN}-tidy = "${bindir}/*clang-tidy*"
> @@ -407,22 +385,6 @@ FILES:${PN} += "\
>   
>   FILES:${PN}-clc += "${datadir}/clc"
>   
> -FILES:lldb = "\
> -  ${bindir}/lldb \
> -  ${bindir}/lldb-argdumper \
> -  ${bindir}/lldb-instr \
> -  ${bindir}/lldb-vscode \
> -"
> -
> -FILES:lldb-server = "\
> -  ${bindir}/lldb-server \
> -"
> -
> -FILES:liblldb = "\
> -  ${libdir}/liblldbIntelFeatures.so.* \
> -  ${libdir}/liblldb.so.* \
> -"
> -
>   FILES:${PN}-libllvm =+ "\
>     ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
>     ${libdir}/libLLVM-${MAJOR_VER}.so \
> @@ -449,8 +411,6 @@ FILES:${PN}:remove = "${libdir}/${BPN}/*"
>   
>   INSANE_SKIP:${PN} += "already-stripped"
>   #INSANE_SKIP:${PN}-dev += "dev-elf"
> -INSANE_SKIP:${PN}-lldb-python += "dev-so dev-deps"
> -INSANE_SKIP:${MLPREFIX}liblldb = "dev-so"
>   INSANE_SKIP:${PN}-libllvm = "dev-so"
>   
>   #Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
> diff --git a/meta/recipes-devtools/clang/lldb_git.bb b/meta/recipes-devtools/clang/lldb_git.bb
> new file mode 100644
> index 00000000000..a07be0e3d4c
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/lldb_git.bb
> @@ -0,0 +1,53 @@
> +SUMMARY = "LLDB"
> +DESCRIPTION = "LLDB is a next generation, high-performance debugger."
> +HOMEPAGE = "https://lldb.llvm.org"
> +SECTION = "devel"
> +
> +require common-clang.inc
> +require common-source.inc
> +
> +COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|powerpc64).*-linux"
> +
> +LIC_FILES_CHKSUM = "file://lldb/LICENSE.TXT;md5=2e0d44968471fcde980034dbb826bea9"
> +
> +inherit cmake pkgconfig python3native python3targetconfig
> +
> +# This actually just depends on LLVM but right now llvm and clang are built together
> +DEPENDS = "llvm-tblgen-native clang"
> +
> +OECMAKE_SOURCEPATH = "${S}/lldb"
> +
> +EXTRA_OECMAKE = "-DLLDB_INCLUDE_TESTS=OFF \
> +                 -DLLDB_ENABLE_LUA=OFF \
> +                 -DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
> +                 -DLLDB_PYTHON_EXE_RELATIVE_PATH=${PYTHON_PN} \
> +                 -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
> +                 -DLLVM_DIR=${STAGING_LIBDIR}/cmake/llvm/ \
> +                 -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
> +                 -DLLDB_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/lldb-tblgen \
> +"
> +
> +PACKAGECONFIG ??= "libedit libxml2 lzma"
> +PACKAGECONFIG[libedit] = "-DLLDB_ENABLE_LIBEDIT=ON,-DLLDB_ENABLE_LIBEDIT=OFF,libedit"
> +PACKAGECONFIG[libxml2] = "-DLLDB_ENABLE_LIBXML2=ON,-DLLDB_ENABLE_LIBXML2=OFF,libxml2"
> +PACKAGECONFIG[lzma] = "-DLLDB_ENABLE_LLDB_ENABLE_LZMA=ON,-DLLDB_ENABLE_LLDB_ENABLE_LZMA=OFF,xz"
> +PACKAGECONFIG[python] = "-DLLDB_ENABLE_PYTHON=ON,-DLLDB_ENABLE_PYTHON=OFF,swig-native"
> +
> +do_install:append() {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
> +        # Fix a bad symlink that points to the -dev .so
> +        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/lldb/_lldb.so
> +        ln -s ${libdir}/liblldb.so.${MAJOR_VER}.${MINOR_VER} ${D}${PYTHON_SITEPACKAGES_DIR}/lldb/_lldb.so
> +    fi
> +}
> +
> +PACKAGES =+ "${PN}-python ${PN}-server"
> +
> +FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
> +RDEPENDS:${PN}-python = "${PN}"
> +# This has a symlink to the lldb library
> +INSANE_SKIP:${PN}-python = "dev-so"
> +
> +FILES:${PN}-server = "${bindir}/lldb-server"
> +
> +BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220147): https://lists.openembedded.org/g/openembedded-core/message/220147
> Mute This Topic: https://lists.openembedded.org/mt/114102603/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



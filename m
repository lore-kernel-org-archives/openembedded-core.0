Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A073C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 16:35:39 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.18385.1752251734770876491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 09:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QKV3uS3F;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2da3c572a0bso2109548fac.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 09:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752251734; x=1752856534; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++WZ+/IKL2Esg8/KuQEj1rQPAcpS0WxTTDvmF7oLSLU=;
        b=QKV3uS3FvO15pI+p9CXv84OBpI1QZDwcMHkSYsGeRpzIx9QOFtP9dPPXlY/gn/hWyt
         sy/VdJOiX+jA/AucC9OI+w5G+kJJYnSkcML+BePyO3+Ar9YFmnc2YCQZPKNPdDYsmFL5
         sjP+6N1iuae20PJPlxnoHB2CNjLCP9ZJcMP1JlWbS4WcYX9UNI42zb15Ep1cxRuGjLeF
         lLWa1H7cZJy/4kyjWjLkW3KA+M04kFdn3VWJzTjUBTTV0KNeorkpB5i98cDP3yQID6YN
         5I1RJ1Kc5isvGRDZ2FbhfmCaSmJwXs/6rg2/o2h9mmM5z+9byg8+RWvPaATeJbC5K3v4
         V+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752251734; x=1752856534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++WZ+/IKL2Esg8/KuQEj1rQPAcpS0WxTTDvmF7oLSLU=;
        b=nVoqdxphAGFkzYlueOH0wTVPGbA4cyolxG7llC4/UkDf4jy16+7l+sRNrwLpDKD3Xb
         HEaApgYMpcBEEHcH2WcJbraJLLwN0LxgmcrQhmLBSYX0uRSnUqgUGJnbYLjHiVwwXGA6
         kv8w0JL00RxQDVJB7BL9th/u1yDwx+tz+pJAtkrIR8EDfBjs1HKvMS6mdj7ukOLoH2Qo
         KIlD5nLhMXgSLauLZFvJnnIOEDLmLC9u9a5SPWu38Oo1ghifKk8rDjHrYNRsvaN3kNBK
         GTAA9NvUvbLG4w9Kmup/a7QWgkYM0fLkY8gnjhcrd0HlkWVSnkMnlYBX8cVDaB/U63tp
         OMrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtp4YyRuB5rnT0wBnY9Hkr5isBafypG1k5w4/FUS1xYkC69JvsHDdo51K156ae4YO8dhjoN7I32m8K485101rCDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrqsfBxPXa9SPeD6F+3oJr0rbxghPUdZZ6/pddRQt5GnyVYHbE
	pfrQSiyIgwbtZfjrcXnfoYH5+NXLQX2udNL80h/jkxlxpRgmFXRRHa9o
X-Gm-Gg: ASbGncsaxkeRH37b5DjaurV/KMGXPmf/yZqxSRI3kAfyYJsOhoEe4w12gpFmyA+JodZ
	K0XXGax72BB9fowdiwAuw6FjYWzC6AHKgBpjOeXkr5NFUvDGUpsJAFazRI4wetCEqzXsfm4sXYs
	GXUqW4Zqlj2cqhB5k6dn7glHR9rAqRmy4916jX70r8S0aZ7SgMrF+cdwJQowG4x/iIUkJNEINOl
	7mV6VfCo+Dq3+nO/QFjm1h8HMLFqGgbM6T4jYJkvbAQe3MsCGlCHOT5ZBhUKjs+fwT60Feij2ta
	UOjBZfYz+PNE/ACyWJB/MKJiftvr9QzmlhT69oHL/BPkcNGQLqwQBwSJ7YDx8lngZLBtLE0Ro/q
	H4h+4BDVPxftD+W35vzHpCD475YCcdJKrFP6++HKzW3W7Su42JO7Hi/b3O5nKEAlVbru2s6khwF
	4A7/5+0ZCcSw==
X-Google-Smtp-Source: AGHT+IHwdxYLtWOE2mGvhaFlcJFcc27OWEo40gJJFrs3WXEoHlHM30ZL7BXGvcEsyNMu1DQa4mhiXA==
X-Received: by 2002:a05:6870:2dc3:b0:29e:559b:d694 with SMTP id 586e51a60fabf-2ff2698a63emr3048619fac.32.1752251733780;
        Fri, 11 Jul 2025 09:35:33 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:f056:4b03:1ef9:9958? ([2601:646:8201:fd20:f056:4b03:1ef9:9958])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116d22easm776354fac.33.2025.07.11.09.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 09:35:33 -0700 (PDT)
Message-ID: <a2c24138-767f-479e-986f-75bfe50f6707@gmail.com>
Date: Fri, 11 Jul 2025 09:35:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] llvm-tblgen-native: add new recipe
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250711155136.2172651-1-ross.burton@arm.com>
 <20250711155136.2172651-2-ross.burton@arm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250711155136.2172651-2-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 16:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220160



On 7/11/25 8:51 AM, Ross Burton via lists.openembedded.org wrote:
> Building the LLVM projects often means using the TableGen tools
> (llvm-tblgen etc).
> 
> We currently build them as part of clang-native, but I am teasing the
> clang recipe into its component parts and having to build llvm-native
> or lldb-native simply for one tool isn't ideal.
> 
> Instead, add a native recipe that simply builds the tablegen binaries
> for llvm, clang, and lldb
> ---
>   meta/conf/distro/include/maintainers.inc      |  1 +
>   meta/recipes-devtools/clang/clang_git.bb      | 10 +++----
>   .../clang/llvm-tblgen-native_git.bb           | 27 +++++++++++++++++++
>   3 files changed, 32 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-devtools/clang/llvm-tblgen-native_git.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 60f04da6089..331c438fd67 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -480,6 +480,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com
>   RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>   RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>   RECIPE_MAINTAINER:pn-llvm-project-source-20.1.7 = "Khem Raj <raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
>   RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
>   RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
>   RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
> index 2b5d3a27524..0f1b950cc63 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -207,7 +207,7 @@ EXTRA_OECMAKE:append:class-target = "\
>                     -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
>   "
>   
> -DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native ninja-native swig-native spirv-tools-native"
> +DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native ninja-native swig-native spirv-tools-native llvm-tblgen-native"
>   DEPENDS:append:class-nativesdk = " clang-crosssdk-${SDK_SYS} virtual/nativesdk-cross-binutils nativesdk-python3"
>   DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH} python3 ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)} spirv-llvm-translator-native"
>   
> @@ -276,18 +276,16 @@ do_install:append:class-native () {
>           install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${bindir}/clangd-indexer
>       fi
>       install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-chars-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}/clang-tblgen
> -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/lldb-tblgen ${D}${bindir}/lldb-tblgen
> -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/llvm-min-tblgen ${D}${bindir}/llvm-min-tblgen

they are not installed but They are still being built internally I 
suppose ? in that case I wonder if it can use the binaries from 
llvm-tblgen-native during build and we can disable them from build in 
clang-native explicitly, should save some more time

>       install -Dm 0755 ${B}${BINPATHPREFIX}/bin/prepare_builtins ${D}${bindir}/prepare_builtins
>   
>       for f in `find ${D}${bindir} -executable -type f -not -type l`; do
>           test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
>           echo "stripped $f"
>       done
> -    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
> -    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
>       ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
> +
> +    # These are provided by llvm-tblgen-native
> +    rm ${D}${bindir}/*-tblgen
>   }
>   
>   do_install:append:class-nativesdk () {
> diff --git a/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb b/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb
> new file mode 100644
> index 00000000000..be04c1aa4d1
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "LLVM TableGen binaries, for the build host"
> +SECTION = "devel"
> +
> +# Building the LLVM projects often means using the TableGen tools (llvm-tblgen,
> +# etc). We could build these as part of llvm-native, but there are cases where
> +# this would be overkill. For example, building a target LLDB needs native
> +# tablegen binaries and a target libllvm so having to build a complete native
> +# llvm is not needed.
> +
> +require common-clang.inc
> +require common-source.inc
> +
> +inherit cmake pkgconfig native
> +
> +OECMAKE_SOURCEPATH = "${S}/llvm"
> +
> +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS='llvm;clang;lldb'"
> +
> +BINARIES = "llvm-min-tblgen llvm-tblgen clang-tblgen lldb-tblgen"
> +
> +OECMAKE_TARGET_COMPILE = "${BINARIES}"
> +
> +do_install() {
> +    for f in ${BINARIES}; do
> +        install -D ${B}/bin/$f ${D}${bindir}/$f
> +    done
> +}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220146): https://lists.openembedded.org/g/openembedded-core/message/220146
> Mute This Topic: https://lists.openembedded.org/mt/114102602/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.9154.1626280021669366828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 09:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iCmsf6Rm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso4278783wmh.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=AMYVru4pnP2m0jfKIo8NW6pwt2kH5sxJqcOFd9/gmn0=;
        b=iCmsf6Rmz1MLHehtLFz5DH0hm9DtvNYuQl23fxtD1U8B//qRI+KrFxCFi0yMdRNwDa
         cLWuKGnm8YGNvgiFg2T6g995ylHqOzJtQeW8nltVLyAEobDvVRUppQ4Rx+LL6SlB8MRG
         R5l2ND0/4TmrtBzOlEDYKDfoHUgBQBDuuEOD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AMYVru4pnP2m0jfKIo8NW6pwt2kH5sxJqcOFd9/gmn0=;
        b=VzGPgmrNBy86S463bqvQtgKrbjJgbP5HwOe5mgaKAhx8RXqlsx0IkJBrLKdWUiIdIQ
         s86573SE3dkYAxxCMO2Pvpj3oLJ3mcwnhFN+I0/ry5uCKUlTMMFKeNQ3jbFKGKZzQ1Ar
         EgaLM1kelZOUZBo4zp/lXpiMH46ceKw9l+iU7clw49aVyUQco5+3OEbWnsgPNun0wkNX
         8r7TUNDSbm4azsN0fiWddDr2zUzsr7wzmEJiceWzZCold+46SEHl6Qwtzv5wGd5aff4G
         9hu/PbVAIJ903FxyvBijfX3O2YmbYiQUxpaKOj9ku05sRmf0jVNvhwhr2B4RYBP/+ZAO
         mgVA==
X-Gm-Message-State: AOAM532w4MmxghsXnRFsa6gXv//PMTeXDBOaxLuO1GYt+D6mVqW1SsDG
	V0XAnJbuMSL7pPHB+/9Z+HbW+w==
X-Google-Smtp-Source: ABdhPJzzilcKqBolE9Q0d84SgVDv3GVw9Fyjnbr8CYY2pwJnyeUD5MMWdDaShbPcWN58vO6LedOPXQ==
X-Received: by 2002:a05:600c:4841:: with SMTP id j1mr12195080wmo.88.1626280020000;
        Wed, 14 Jul 2021 09:27:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bb3:54c5:c899:49e? ([2001:8b0:aba:5f3c:bb3:54c5:c899:49e])
        by smtp.gmail.com with ESMTPSA id z11sm3056178wru.65.2021.07.14.09.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 09:26:59 -0700 (PDT)
Message-ID: <bd224e1b93a24ec261502e4311ac4cb7252ed27e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Jul 2021 17:26:56 +0100
In-Reply-To: <20210714141432.610106-1-alex.kanavin@gmail.com>
References: <20210714141432.610106-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-14 at 16:14 +0200, Alexander Kanavin wrote:
> oe-core has not been providing multiple versions for any of these items
> for a long time, it's not likely to change anytime soon, and it makes
> automated (or semi-automated) versions updates with devtool impossible,
> as PREFERRED_VERSION masks the updated recipe in devtool workspace.
> 
> Specifically, this was prompted by investigating why automated llvm update
> doesn't work; it does now.
> 
> v2: GCC is excluded as overriding the version through GCCVERSION is used
> across several layers, and the list of things to override is large.
> 
> v3: exclude linux-libc-headers too, as that is using a separate update
> process without involving devtool.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 36 ---------------------
>  1 file changed, 36 deletions(-)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 1d4aa1e11f..e655bd85ce 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -18,12 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  
> 
> 
> 
>  GCCVERSION ?= "11.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.36%"
> -GDBVERSION ?= "10.%"
> -GLIBCVERSION ?= "2.33"
>  LINUXLIBCVERSION ?= "5.13%"
> -QEMUVERSION ?= "6.0%"
> -GOVERSION ?= "1.16%"
>  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>  # llvm version being used, so always bump it with llvm recipe version bump
>  LLVMVERSION ?= "12.0.1"
> @@ -42,42 +37,11 @@ PREFERRED_VERSION_libgfortran ?= "${GCCVERSION}"
>  PREFERRED_VERSION_nativesdk-gcc ?= "${SDKGCCVERSION}"
>  PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
>  PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
> -PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
> -PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?= "${GDBVERSION}"
> -PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GDBVERSION}"
>  
> 
> 
> 
>  PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
> -PREFERRED_VERSION_glibc                    ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-locale             ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-mtrace             ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-scripts            ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_nativesdk-glibc          ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
> -
> -PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
> -PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
> -PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
>  
> 
> 
> 
>  # Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
>  # from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
>  # go-native.
>  PREFERRED_PROVIDER_go-native ?= "go-binary-native"
> -PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
> -PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
> -PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
> -PREFERRED_VERSION_go-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GOVERSION}"
> -PREFERRED_VERSION_go ?= "${GOVERSION}"
> -PREFERRED_VERSION_go-native ?= "${GOVERSION}"
> -PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
> -PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
> -PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
> -
> -PREFERRED_VERSION_llvm = "${LLVMVERSION}"
> -PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
> -PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"

$ grep LLVMVERSION * -R
classes/meson.bbclass.orig:llvm-config = 'llvm-config${LLVMVERSION}'
classes/meson.bbclass:llvm-config = 'llvm-config${LLVMVERSION}'

which is why we have LLVMVERSION. I'm sure some other layer breaks if we
don't do this.

To be honest I think this starts to look like we can drop qemu and
not much else, the rest have many different related providers and
are pretty toolchain like where it is hard to guess what the form the 
variables should take. That was the design purpose of the tcmode 
include file. Most of those components wouldn't likely work with 
devtool upgrade anyway and would need more careful handling.

Cheers,

Richard


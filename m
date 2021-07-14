Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.6219.1626267345475635078
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DCr4KUeh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id a13so3066658wrf.10
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=wl8+Hbc627EH3QcqpDmABdN/omTrgygtDODfhrczooQ=;
        b=DCr4KUehSzeGV6NPUrfBngFOF88MNeOPBmO3nFFRyoKcbA0SA83x1s2ikPGV8byeaY
         U1vjLiU1fETjs0UHQl155bNMmpG4EQQx6VtsMx/kmmgkOiwNXrLHnk+9apz8XvfwuBZs
         IeVEAsj/Ch0S3Fj22cQwWVOf/z/322HVFBZ4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wl8+Hbc627EH3QcqpDmABdN/omTrgygtDODfhrczooQ=;
        b=G1dT7xsEcjTwVLySNoe756PzlKZKKIx76CZ4NKA1pn0rMjBkOk2b5ohtV2K6wqGMrb
         zl8Y6h5GzaaT9wXQ8Gzd7Cl7qFkajNQZ1z5LOlT7OzELgSHKyBfpvA//h4+u4hHJtkk8
         nhd0qVuasIOQv5PywbusV4t5SG3LLLd0nt2Q9jX6Fm8sP8NUBAV36zO7eOWGkQTIHqgc
         S3E9/DXJVPp++pR3SeK/JQ7RdiiNCQw7hIFTkWkqDcSzEABTubkn5kIyqALzmy+Sc+Ko
         TXQTotPrKL2kVrNmPam75xuf1/EpQSrBixcOtRtoz5RIrBa3u+IIqm4TTH6seX85ZaJl
         v2GQ==
X-Gm-Message-State: AOAM5308cGuGT2hgkz4Vb0hqSkB0+WkJfbS/MkEftDoUXR2uQNDHNUdk
	lW05kvpog+Bud0AAeIbk2sXRQw==
X-Google-Smtp-Source: ABdhPJy8/v5JWaqdWF7rSx8/IEFOOjmpUIrTPDnYAZhsTGSCrxHaHXm459EfuYbCr1TGPDLh+2VGmg==
X-Received: by 2002:adf:f4c4:: with SMTP id h4mr12431474wrp.79.1626267343987;
        Wed, 14 Jul 2021 05:55:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bb3:54c5:c899:49e? ([2001:8b0:aba:5f3c:bb3:54c5:c899:49e])
        by smtp.gmail.com with ESMTPSA id n23sm1949722wms.4.2021.07.14.05.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:55:43 -0700 (PDT)
Message-ID: <7304a1fd6d1ccfb9da17ec47125de68035094256.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/21] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Jul 2021 13:55:42 +0100
In-Reply-To: <20210714122606.605142-2-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
	 <20210714122606.605142-2-alex.kanavin@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-14 at 14:25 +0200, Alexander Kanavin wrote:
> oe-core has not been providing multiple versions for any of these items
> for a long time, it's not likely to change anytime soon, and it makes
> automated (or semi-automated) versions updates with devtool impossible,
> as PREFERRED_VERSION masks the updated recipe in devtool workspace.
> 
> Specifically, this was prompted by investigating why automated llvm update
> doesn't work; it does now.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 57 ---------------------
>  1 file changed, 57 deletions(-)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 68e5d848ba..0571304fdc 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -16,68 +16,11 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
>  # Default libc config
>  PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  
> 
> 
> 
> 
> 
> 
> 
> -GCCVERSION ?= "11.%"
> -SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.36%"
> -GDBVERSION ?= "10.%"
> -GLIBCVERSION ?= "2.33"
> -LINUXLIBCVERSION ?= "5.13%"
> -QEMUVERSION ?= "6.0%"
> -GOVERSION ?= "1.16%"
>  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>  # llvm version being used, so always bump it with llvm recipe version bump
>  LLVMVERSION ?= "12.0.0"
>  
> 
> 
> 
> 
> 
> 
> 
> -PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
> -PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
> -PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GCCVERSION}"
> -PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
> -PREFERRED_VERSION_gcc-sanitizers ?= "${GCCVERSION}"
> -PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_nativesdk-gcc-sanitizers ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
> -PREFERRED_VERSION_libgcc-initial ?= "${GCCVERSION}"
> -PREFERRED_VERSION_libgfortran ?= "${GCCVERSION}"
> -PREFERRED_VERSION_nativesdk-gcc ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
> -PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
> -PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?= "${GDBVERSION}"
> -PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GDBVERSION}"
> -
> -PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
> -PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
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
> -
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
> -

At the very least the GCC variable is well used in other layers as it is hard to 
remember all the different bits of gcc that are listed here so I think that 
should stay. Some of these can probably be removed but I'm not sure how far
we could/should go. glibc's list of recipes isn't trivial either...

Cheers,

Richard


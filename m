Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.7130.1626271326981065501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 07:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sslqiumI;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id l1so3220566edr.11
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D8a0BuSUmY7r6+idiojXs1A5ZrdUZ0FsAA4h3EAPCaU=;
        b=sslqiumIAqpaxuomaIEIs+b7qmWWWyIM0/QIroqxrW6auOqrdyCT5G50MNOFkGBThu
         ZJO54XDkPEEtQplM1IlrpnIrumVuyBNI6c/F+e+cqgtw8zyC0S3R+o7bwcBY97k/bwNS
         qKTcr6UFq0XwiTw17efClAcXhfc8jocta/3YuJOAvdTEtrYkOfAFEMwPIU3oHV8vLDII
         jmgL/ETCxuV4fkDvIyA9HJA+Dm+RnZhYmpaDkO8iKPS9723keS1tEIjyZmDtem8HjQIV
         4cw20UltI6+fTzGQIewz0PKcGMqj94e9yhp0xyTXvvqCwTqLT+aJrBXswtdt5LT65yM9
         ueKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D8a0BuSUmY7r6+idiojXs1A5ZrdUZ0FsAA4h3EAPCaU=;
        b=uKtfk+Ll9lkkFDvl+iECAdxmnKvbRpqJKQNG0p8owcLWUyr02IWh05bwkEmeCUMFPy
         ahU9gcn066wfY2QiWH7LohkU5lotJt9CNcuCbhpu6AusBIOA5GJpgRqUOgyRmucIV2/h
         RaivX3L1mXjxKUPC/rUp7tZdmjG2i17e0pVVHAop8Y+M5vOJ5iYoOd8CaGf3coIOTYry
         tOjHVHFY+il4PBgRxCA9EtxPMQrrpo0UyYfAkp7VT3aUs92jWlgF5vQD9XDfbXGv4AZD
         ePb29MP/OpuX7IvNMzq1OU0fif01K3LyQB8W9NPdfwvAIHjkOohpap/iL5xYJxya/lfP
         z+/A==
X-Gm-Message-State: AOAM530GjFCCEgKh8GNtg9hXR4SORyzyuSSMnGzeEyl7Flji40FQb0mB
	5smzdbn/P/+GlUvL5dUIT7xNZX8TTKVGk+13xJE=
X-Google-Smtp-Source: ABdhPJytQPv2HLhJPwVfjqgZ+IjiZ8fcT3drQ9qIvm7GJ/bhMm+tX+8DfsaVhBx8qzrUvIo8ZC4ltCDjWqt6N7wU4qc=
X-Received: by 2002:a05:6402:d63:: with SMTP id ec35mr13984282edb.347.1626271325394;
 Wed, 14 Jul 2021 07:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210714122606.605142-1-alex.kanavin@gmail.com> <20210714122606.605142-2-alex.kanavin@gmail.com>
In-Reply-To: <20210714122606.605142-2-alex.kanavin@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 14 Jul 2021 10:01:54 -0400
Message-ID: <CADkTA4N09rGXOSwev-C4oEihwWsvwqtCpY=XHNShF_xUUzkWZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/21] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 14, 2021 at 8:26 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
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
>  meta/conf/distro/include/tcmode-default.inc | 57 ---------------------
>  1 file changed, 57 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 68e5d848ba..0571304fdc 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -16,68 +16,11 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
>  # Default libc config
>  PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>
> -GCCVERSION ?= "11.%"
> -SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.36%"
> -GDBVERSION ?= "10.%"
> -GLIBCVERSION ?= "2.33"
> -LINUXLIBCVERSION ?= "5.13%"

I'd prefer that libcheaders stays explicitly set.

Bumping libc-headers is something we do carefully, and should not be a
common devtool
operation, and is not something that we want automated at all. Having
that extra variable
to set is a good thing for the headers, it helps reenforce that you
really should know what
you are doing.

Bruce


> -QEMUVERSION ?= "6.0%"
> -GOVERSION ?= "1.16%"
>  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>  # llvm version being used, so always bump it with llvm recipe version bump
>  LLVMVERSION ?= "12.0.0"
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
>  # Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
>  # from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
>  # go-native.
>  PREFERRED_PROVIDER_go-native ?= "go-binary-native"
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
> --
> 2.31.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

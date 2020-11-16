Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web08.42410.1605564903021337002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 14:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XCg2r7Uv;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: alistair23@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id t8so19047457iov.8
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 14:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w2C7pUrQKDrR4P8K8WRZKIUAQyeD8WCHOgQhPxlXII0=;
        b=XCg2r7UvwxDPYDPDw4jsFun11ckd4D7M8a87l92ZlMpqsT4CZOZ5pKjT23WJvJYtun
         wzmRNfC/cYUUH2Mt5vR7pNUt9QeLbn9cjVmh7NxR/QJe/oKdztSrJgNk9HxuXT5Qb+2f
         83SOAWcWmHXleb4yIIq60eD2uwfxsdRvz3iFa/JcJ4LNQemrciV8xlYPWVgFCxaokX8H
         KM/UP5eX/Qrs0uBsgt5Vfy/mdSqMHjeJcKIj8u/jEDuJ4TGhptfZlIsGb+4Gg2u1vYLt
         SgFZ1xKir61j+FH4rMWZoNnWpRbrHqSt5h+pLGrOC/cQJejrONScdbhxRq7OOKqaXbd/
         RKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w2C7pUrQKDrR4P8K8WRZKIUAQyeD8WCHOgQhPxlXII0=;
        b=P6tKNIUNIXVqQBLSt/hY3Ngz5qGEzDK4th9DJf/y46LwbM22HYaOEhDRdJCsJm4j5M
         WvhYHQNgQnQTyR6ty9y1ywXlL3DSql40bPSSdIWU6DuPXwRrb3+lqknEa22poAjngiP9
         2i+PrWNjS+QRRcpNT7lZdl1Gx16g32EnG8TFRurXAfIRik2NvY3cw/+/cT2808seAieT
         1oRLsfjD67umIeXvNTiY2E1lSZr91Yh6Mh5qxpCS/M6XdLJsDr/kBAz4EZ2X1FPuu9BF
         a7XGunb2dca1RFSSBD3rgn19INPBV9PddqyYiZsd8+X0COFhR+0BCloIsLLf7Qyb9SsR
         12uA==
X-Gm-Message-State: AOAM531zwQ+15Ml0/MaLBIcfdQT6peIk2TW0jTE4H9z9ZZNkDE82phSP
	LoWzB5f6I70mRC/gFg4APULDBDoFDk0orYDBf6Y=
X-Google-Smtp-Source: ABdhPJzBEjkZmYgtKbSDx8ooCmzEgS+BtlrQfZfD55OWOvhTb0ngytpB49hVhn4l4vo965wv/qXQtLIQGXDVWubmU18=
X-Received: by 2002:a05:6602:2d4e:: with SMTP id d14mr9534587iow.105.1605564902407;
 Mon, 16 Nov 2020 14:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20201116195559.1240940-1-raj.khem@gmail.com>
In-Reply-To: <20201116195559.1240940-1-raj.khem@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Mon, 16 Nov 2020 14:02:46 -0800
Message-ID: <CAKmqyKMhHqodar=6OuJESguSnJ14Rxo21xZK-PGb9TrA3R2rng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] python-numpy: Add support for riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2020 at 11:56 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Address upstream comments in proposed patch
>
>  ...1-numpy-core-Define-RISCV-32-support.patch | 56 +++++++++++++++++++
>  .../python-numpy/python-numpy.inc             |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
>
> diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
> new file mode 100644
> index 0000000000..b60ca1d216
> --- /dev/null
> +++ b/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
> @@ -0,0 +1,56 @@
> +From dbcf296f84e5cef6a3ff0f1c469a4508f1e0fb15 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 15 Nov 2020 15:32:39 -0800
> +Subject: [PATCH] numpy/core: Define RISCV-32 support
> +
> +Helps compile on riscv32
> +
> +Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + numpy/core/include/numpy/npy_cpu.h    | 9 +++++++--
> + numpy/core/include/numpy/npy_endian.h | 1 +
> + 2 files changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
> +index 4dbf9d84e..bc41a7eda 100644
> +--- a/numpy/core/include/numpy/npy_cpu.h
> ++++ b/numpy/core/include/numpy/npy_cpu.h
> +@@ -18,6 +18,7 @@
> +  *              NPY_CPU_ARCEL
> +  *              NPY_CPU_ARCEB
> +  *              NPY_CPU_RISCV64
> ++ *              NPY_CPU_RISCV32
> +  *              NPY_CPU_WASM
> +  */
> + #ifndef _NPY_CPUARCH_H_
> +@@ -100,8 +101,12 @@
> +     #define NPY_CPU_ARCEL
> + #elif defined(__arc__) && defined(__BIG_ENDIAN__)
> +     #define NPY_CPU_ARCEB
> +-#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
> +-    #define NPY_CPU_RISCV64
> ++#elif defined(__riscv)
> ++    #if __riscv_xlen == 64
> ++      #define NPY_CPU_RISCV64
> ++    #elif __riscv_xlen == 32
> ++      #define NPY_CPU_RISCV32
> ++    #endif
> + #elif defined(__EMSCRIPTEN__)
> +     /* __EMSCRIPTEN__ is defined by emscripten: an LLVM-to-Web compiler */
> +     #define NPY_CPU_WASM
> +diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
> +index aa367a002..d59484573 100644
> +--- a/numpy/core/include/numpy/npy_endian.h
> ++++ b/numpy/core/include/numpy/npy_endian.h
> +@@ -49,6 +49,7 @@
> +             || defined(NPY_CPU_PPC64LE)       \
> +             || defined(NPY_CPU_ARCEL)         \
> +             || defined(NPY_CPU_RISCV64)       \
> ++            || defined(NPY_CPU_RISCV32)       \
> +             || defined(NPY_CPU_WASM)
> +         #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
> +     #elif defined(NPY_CPU_PPC)                \
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
> index b1058b26c8..40f81046ee 100644
> --- a/meta/recipes-devtools/python-numpy/python-numpy.inc
> +++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
> @@ -7,6 +7,7 @@ SRCNAME = "numpy"
>
>  SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
>             file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
> +           file://0001-numpy-core-Define-RISCV-32-support.patch \
>             "
>  SRC_URI[sha256sum] = "9179d259a9bc53ed7b153d31fc3156d1ca560d61079f53191cf177c3efc4a498"
>
> --
> 2.29.2
>
>
> 
>

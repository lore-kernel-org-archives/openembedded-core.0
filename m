Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web08.1950.1606246364270993292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 11:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=icpkbVvX;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id l2so22269384qkf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 11:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=blnSHqQwKRVE4/eSkT+1gTcfJcOOiDKw8bBhjInBWLY=;
        b=icpkbVvX5Kf2OR7p6OnPy550t3NP2DLGWo8PNOdw5ClRrKGCaS3yX8SqOnuLn0dglB
         5K603LF2WNjpbB9ax3DSdkPwY5WnXolXDv31/3dVPJmQ4f2zJJzlVAcNWMqSIe452Lfk
         mnr+CexF23CVLqDytHWOL1jYXvBZPl8qquJfWSSKhjiXW0GsW09npp3s152/kKWhEmup
         itoSE2BCcmU9FIsIG/QWBYapHAyguLz3cIJ61g23lPQko6k1Q3wmYq/lzRXxMfb33hbq
         wWk7SxJPc7FtkGb2jdyLSED7aBeYN7TipLxsQtEVV31M9sv0LI5oJ9Qawo+sYSLz8LwF
         Higw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=blnSHqQwKRVE4/eSkT+1gTcfJcOOiDKw8bBhjInBWLY=;
        b=Ayxnc/Zfgqa145QaamXHq/zhAJplOB9LrN25OfaH1k0u8yp/Lu7qtOP+WHoAzntAYe
         bN0kAS/qnZra3sWzz9J0g0YYJZpxRrbrXdLVD7fCyMknDRqHN+hPiPSZTGPNXseJkpVm
         JijgL974R6DiiPHPT3CpGGHzE86KsaerJex2X0pPCpC9Uidj40SR9b4Mf9C5VdF45NNQ
         9ZVK4z1MHjcjzNilWyIi8xHuxHlVy0A6XVoyJ1IW+UcGCx55jfVvBVhq4GVdnhDDZTKs
         xKloMDJ3+3RAbe+I2EsLDBscPkpmjBek8COUujHvm1/R/ekUJWAwUlws97QSlu0J9KJO
         bZZg==
X-Gm-Message-State: AOAM53291QypSOd5gi/rJ8jLssWfvfvQ4liId4RwjrBFKlWX3t37M1PV
	znqFjSnJVTW2Yb+bDrQaMHBMXUpSKUJrFJFG1VZkDein6n2IKw==
X-Google-Smtp-Source: ABdhPJxxoMu9OYFsT6G+/wzgPmFYbDQjHPBdTPS+wxBIn/V3RJjQwFD6CJp7HYY4oODNT7+ciQuuMb93WlCq/6+uitQ=
X-Received: by 2002:a37:8943:: with SMTP id l64mr454780qkd.212.1606246363386;
 Tue, 24 Nov 2020 11:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20201122124853.30262-1-andrej.valek@siemens.com>
 <20201123190029.13811-1-andrej.valek@siemens.com> <20201123190029.13811-2-andrej.valek@siemens.com>
In-Reply-To: <20201123190029.13811-2-andrej.valek@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 24 Nov 2020 11:32:17 -0800
Message-ID: <CAMKF1srWhM8ja4Q_tEUzsAh-oEDepm=FrwQptGbwcjbS0NVC7w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] cmake: split release and debug flags
To: Andrej Valek <andrej.valek@siemens.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Pascal Bach <pascal.bach@siemens.com>, Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 11:04 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Keep only flags related to release in particular part _RELEASE (same for
> debug). This option allows to really use the Release/Debug build type
> in cmake. The corresponding build type will have corresponding flags set
> with/without optimization. Flags are respecting selected optimization from
> the whole build.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes/cmake.bbclass | 36 ++++++++++++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 7c055e8a3d..1305b40bf9 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -25,14 +25,25 @@ python() {
>  OECMAKE_AR ?= "${AR}"
>
>  # Compiler flags
> -OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
> -OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
> -OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
> -OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
> -OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
> -OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
> -CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> -CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> +OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS} ${CFLAGS_COMMON}"

CMAKE_<LANG>_FLAGS are seeded with CFLAGS/CXXFLAGS etc from the
environment and used during configure steps
when cmake is invoking compiler to compile small sample to determine
functionality and these tests will start to fail. especially
cases where we use security flags which should accompany some -On or
else compile will warn and if warnings are being treated
as errors then it will fail the test.

> +OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS_COMMON}"
> +OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${lcl_maybe_fortify} -DNDEBUG"
> +OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${lcl_maybe_fortify} -DNDEBUG"
> +OECMAKE_C_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
> +OECMAKE_CXX_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
> +OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
> +OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS_COMMON} ${LDFLAGS}"
> +OECMAKE_LINKER_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${lcl_maybe_fortify}"
> +OECMAKE_LINKER_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
> +CXXFLAGS += "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS}"
> +CFLAGS += "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS}"
> +
> +# Common compiler flags
> +# CFLAGS/CXXFLAGS without optimization
> +# HOST_CC_ARCH without fortify
> +CFLAGS_COMMON = "${@d.getVar('CFLAGS').replace(d.getVar('SELECTED_OPTIMIZATION'),'')}"
> +CXXFLAGS_COMMON = "${@d.getVar('CXXFLAGS').replace(d.getVar('SELECTED_OPTIMIZATION'),'')}"
> +HOST_CC_ARCH_COMMON = "${@d.getVar('HOST_CC_ARCH').replace(d.getVar('lcl_maybe_fortify'),'')}"
>
>  def oecmake_map_compiler(compiler, d):
>      args = d.getVar(compiler).split()
> @@ -107,8 +118,17 @@ set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
>  set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "Additional CFLAGS for release" )
>  set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "Additional CXXFLAGS for release" )
>  set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "Additional ASM FLAGS for release" )
> +set( CMAKE_C_FLAGS_DEBUG "${OECMAKE_C_FLAGS_DEBUG}" CACHE STRING "Additional CFLAGS for debug" )
> +set( CMAKE_CXX_FLAGS_DEBUG "${OECMAKE_CXX_FLAGS_DEBUG}" CACHE STRING "Additional CXXFLAGS for debug" )
> +set( CMAKE_ASM_FLAGS_DEBUG "${OECMAKE_C_FLAGS_DEBUG}" CACHE STRING "Additional ASM FLAGS for debug" )
>  set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>  set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
> +set( CMAKE_SHARED_LINKER_FLAGS_RELEASE "${OECMAKE_LINKER_FLAGS_RELEASE}" CACHE STRING "Additional SHARED LINKER FLAGS for release" )
> +set( CMAKE_SHARED_LINKER_FLAGS_DEBUG "${OECMAKE_LINKER_FLAGS_DEBUG}" CACHE STRING "Additional SHARED LINKER FLAGS for debug" )
> +set( CMAKE_MODULE_LINKER_FLAGS_RELEASE "${OECMAKE_LINKER_FLAGS_RELEASE}" CACHE STRING "Additional MODULE LINKER FLAGS for release" )
> +set( CMAKE_MODULE_LINKER_FLAGS_DEBUG "${OECMAKE_LINKER_FLAGS_DEBUG}" CACHE STRING "Additional MODULE LINKER FLAGS for debug" )
> +set( CMAKE_EXE_LINKER_FLAGS_RELEASE "${OECMAKE_LINKER_FLAGS_RELEASE}" CACHE STRING "Additional EXE LINKER FLAGS for release" )
> +set( CMAKE_EXE_LINKER_FLAGS_DEBUG "${OECMAKE_LINKER_FLAGS_DEBUG}" CACHE STRING "Additional EXE LINKER FLAGS for debug" )
>
>  # only search in the paths provided so cmake doesnt pick
>  # up libraries and tools from the native build machine
> --
> 2.11.0
>
>
> 
>

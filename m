Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web09.36647.1606143833781485856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:03:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SqGqFDoX;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id q22so17198551qkq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 07:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mqLtIFcwFpn2zAcSyNJuN4c0slGZb/TfutQTVxzpMSA=;
        b=SqGqFDoX4YIGekAHNwbzun2utA1xOpVDC8g/gEfXdDfupG1NsLr079N5hfL5kgvzhb
         qBjRbYRr/Xa3jb8Cq3Ts5dK8mNRR6QGXYQCkYwpuBTKUcIDwRNpEPiQ676meYYc0Lfoi
         zhYi/qDA2fvq76kpcnfK1/qnRSLSO/0CwTOTSSa37p5H/OHH7cPtXHQKpk45k7EWlVKU
         bRhR/DmUYkzrYfFgbNyQRMgwM0tTdMJw9rY6EQHiHgK5qbz7IM2CH1Df52SsMlmdq3hS
         RZC4SiPI1MuD6RY5Q5eNorausfx41UvcPn+yQRx6vML3p5LYaA5UhCCW6Ee3FjFeyMjq
         jknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mqLtIFcwFpn2zAcSyNJuN4c0slGZb/TfutQTVxzpMSA=;
        b=LXXds4yLENik4Z5PYXJB4hStpl9+IsH1QAH/Uk1jOYUSSCwn2PO90sqFlzF8HHaH1s
         TCXRRMh55s/QK7mwcXbyk7u95xmfiIUfIumQG4P0xjDiji4QvU76yD+fA5Z4MLK0VLOb
         xYOc5FwD4i86x3x1UJ8YlJKD8ggWp8U0yKAudWRlXmPhn8wj89eD4kXUbMT2Ab786d2m
         4qsDml5vFctLk4j5FouIUVKyaFRWxS/fGW2LKdX0sqBtJO0UgomGMFeiQ1YGCwJ/biBG
         SHS48aQQociEDMYKvGANY5SywNUxENKHWmVK1eVzoEldw0NkIelmkpx6yAzCwpcKnZnv
         Khrw==
X-Gm-Message-State: AOAM533E5c8PDxlN5OFDMjm7ZRE8SLrcxRMxQddUNYMDSEYUoBpEH8OF
	DK/wjzJwDZZDnBV7oUXYDR/wlLVO5BZw5cpba2k=
X-Google-Smtp-Source: ABdhPJy9tzF8vr0ymJxFiKTH475/FdtxvGAJh0Bh9hKnKuZ44tWSW23dC58bgi1JUf0MD3nGsO+pKwA31u+lp1xEnOk=
X-Received: by 2002:a37:58c1:: with SMTP id m184mr16631510qkb.9.1606143832829;
 Mon, 23 Nov 2020 07:03:52 -0800 (PST)
MIME-Version: 1.0
References: <20201122124853.30262-1-andrej.valek@siemens.com> <20201122124853.30262-2-andrej.valek@siemens.com>
In-Reply-To: <20201122124853.30262-2-andrej.valek@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 23 Nov 2020 07:03:25 -0800
Message-ID: <CAMKF1srXUBHS0CXAPApjv_caAUBGRXxHCaurjVykq5L7-6drvA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] cmake: split release and debug flags
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembedded-core@lists.openembedded.org, 
	Pascal Bach <pascal.bach@siemens.com>, Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"

I am seeing several failures due to this series see

https://errors.yoctoproject.org/Errors/Build/113114/

On Sun, Nov 22, 2020 at 4:49 AM Andrej Valek <andrej.valek@siemens.com> wrote:
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
>  meta/classes/cmake.bbclass | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 7c055e8a3d..a0ce92ce46 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -25,15 +25,23 @@ python() {
>  OECMAKE_AR ?= "${AR}"
>
>  # Compiler flags
> -OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
> -OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
> -OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
> -OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
> +OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS_COMMON}"
> +OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS_COMMON}"
> +OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
> +OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
> +OECMAKE_C_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
> +OECMAKE_CXX_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
>  OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
> -OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
> +OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS_COMMON} ${LDFLAGS}"
> +OECMAKE_LINKER_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION}"
> +OECMAKE_LINKER_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
>  CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
>  CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
>
> +# Common CFLAGS/CXXFLAGS without optimization
> +CFLAGS_COMMON = "${@d.getVar('CFLAGS').replace(d.getVar('SELECTED_OPTIMIZATION'),'')}"
> +CXXFLAGS_COMMON = "${@d.getVar('CXXFLAGS').replace(d.getVar('SELECTED_OPTIMIZATION'),'')}"
> +
>  def oecmake_map_compiler(compiler, d):
>      args = d.getVar(compiler).split()
>      if args[0] == "ccache":
> @@ -107,8 +115,17 @@ set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
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

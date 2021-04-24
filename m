Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.580.1619281168696206631
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 09:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XjreUnG8;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id x11so52569029qkp.11
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+FQTLHhtQjEtmhN6EUEOSiskjnzqi9aATeUWynFFDk=;
        b=XjreUnG8l9mGx35tL+6tuRUMK7zha2yVGqnwNgwngcCuS4/8ONAXy9SvgJty88EdON
         9KhQZKXPjQomI/iiSuhzC9XPS3v8TXHRhb+M7lkXQxzq0nFRtWR6H437PihUfnXp1tkv
         7HSzp34l1Rou7qZ/Mxq/rRzc6Ecz2u4ACz+W3qJELgGyhli1nkuFfTm70mj3J0P52Cu1
         fOliEFQldDrZz8NVKaUAVWb2RtC2tTTE1eY3jXkxRgd1aFURcUC2JWDp+O9+WspCj7z8
         OsfTaRX9Exu5fCxvAwtRjU3CrWREhM9kfHP40oN08i/shiDGkzVSUjkLxjYBLzsrgdbr
         25Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+FQTLHhtQjEtmhN6EUEOSiskjnzqi9aATeUWynFFDk=;
        b=WxASqaWg1t7qTEkT1lml6P94N/8j5y1gdAwoslkKOUeiMP5nmxwp7k3T3qaYNtA7ZN
         mbFVA8Zzz2f0cO2tY8kYebYk9AFWsM5p4ocJAQaSSs95fqE1tkE8mnQjPIWifRMxuTMZ
         Varwub5nLxKHMAwPPv8QcmZJowtBOYnWR6K4dK35NWkZdJlPUhEL7fQOmP171ODYgkcL
         qtJFyS7qhVoQdyEmvodIxiexBiAE/d7kbO6hUuNzceeaBmfFuX2CtkOfAkWsK3p7b+k3
         Fl/zN1yHO7v5Gpb5mdKJVrje80FpJ4tp3WM2hjw/2C8Hen9dBdXF12d2xXF96pnQrX7M
         ofYw==
X-Gm-Message-State: AOAM532Cldfp2fjZhO0ItUdzAzt5aw77ET/SJftzcVQZAswTqAxv6obE
	M0pOzythcd/oOwdDbuL4bBTkhJ5x/vkBUsgDfyQ=
X-Google-Smtp-Source: ABdhPJx3ylu5bEyuhE+9O4Hgzb7ptk3Y4oEfGBoUdSMzRapoBbB2SwRUZLGJ586V/JpYxPFTrlatuCoZSg06CRbsLtc=
X-Received: by 2002:a37:9607:: with SMTP id y7mr9587567qkd.25.1619281167723;
 Sat, 24 Apr 2021 09:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210424155639.1131482-1-akuster808@gmail.com> <20210424155639.1131482-2-akuster808@gmail.com>
In-Reply-To: <20210424155639.1131482-2-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 24 Apr 2021 09:19:01 -0700
Message-ID: <CAMKF1spzMi=8N1+GevuLQzykUXdmaLyDDOPYh64uPEqpKYS8sw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] libseccomp: move recipe from meta-security to core
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 24, 2021 at 8:56 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> ptest results:
> Regression Test Summary
>  tests run: 1404
>  tests skipped: 369
>  tests passed: 1402
>  tests failed: 2
>  tests errored: 154
>
> Add feature_check so that the other recipes who can take
> advantage of this funtionality can enable it.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../libseccomp/files/run-ptest                |  4 ++
>  .../libseccomp/libseccomp_2.5.1.bb            | 49 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-support/libseccomp/files/run-ptest
>  create mode 100644 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>
> diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/meta/recipes-support/libseccomp/files/run-ptest
> new file mode 100644
> index 00000000000..54b4a63cd2c
> --- /dev/null
> +++ b/meta/recipes-support/libseccomp/files/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +cd tests
> +./regression -a
> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> new file mode 100644
> index 00000000000..667d5da8242
> --- /dev/null
> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> @@ -0,0 +1,49 @@
> +SUMMARY = "interface to seccomp filtering mechanism"
> +DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
> +SECTION = "security"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
> +
> +DEPENDS += "gperf-native"
> +
> +SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
> +
> +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
> +           file://run-ptest \
> +           "
> +
> +COMPATIBLE_HOST_riscv32 = "null"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig ptest features_check
> +
> +REQUIRED_DISTRO_FEATURES = "seccomp"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python3"
> +
> +DISABLE_STATIC = ""

do we need apps to use some static libs ? if so which library is it,
Or is it all internal?

> +
> +do_compile_ptest() {
> +    oe_runmake -C tests check-build
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    install -d ${D}${PTEST_PATH}/tools
> +    for file in $(find tests/* -executable -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> +    done
> +    for file in $(find tests/*.tests -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> +    done
> +    for file in $(find tools/* -executable -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
> +    done
> +}
> +
> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
> +
> +RDEPENDS_${PN}-ptest = "coreutils bash"
> --
> 2.25.1
>
>
> 
>

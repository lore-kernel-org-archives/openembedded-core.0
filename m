Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.4546.1619302587422119607
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 15:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DSt/eV5g;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id f12so38993452qtf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 15:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fvggf34fJ0tZAtWE5jhpwUYNpKhTSVVB8XHG8/xpfaE=;
        b=DSt/eV5g+z9QbRnWkw6rZ0irgsJyhQykLoFYARzJL1dWnU9DOm6s1V4IdCw90VDigG
         WgR8mxIl8TfWyBlIyaLQ3I2XSkGyXrjfvPmCEqn9jkCCjd6Gyg9P8rP7sTFPcJh7J0Mi
         NmLM4d8suZKc5CrGfRyEdUktOak8DBwb6eS5MCXNOP/t7sGmQ2QAl5R4ChzBE4tDoC3V
         NJUSTN7yPOR6ZeoywPpFu6SqoPa9P11TULS+pCCCa8cl8MUyZsm83INA8qhZBm26aNEh
         pXiRE318OE+oXFU0cX8khWJTVkSf/nKQexyEfeOA9NQe/ng4VjHjPvRvXa3kvZDyovoF
         QSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fvggf34fJ0tZAtWE5jhpwUYNpKhTSVVB8XHG8/xpfaE=;
        b=hiBxfnupc2Q5/RHA5PCNC9iBp+TMkew+fAvsZzq+0kxwtWUHWxactgk3CDoC804Ttq
         IjfjTsG5feJU+0FVONpcVQsRCzC7cejOhp+jqOwc5LzTIf7wcblbzFQwFNmf6F/kIlc9
         Qs+rKySHP8Yi62DgSYTrZZ2xcF0lpQIGBTZfLdV6I7iicBoAJF2DGu2dqoVGWN0qtKZd
         mrBAccZIW8ry7KrQX7tFr8KJYmt/G+dVdHHsvfSedE3VDDAgOG7mY2QK5ATpM2yyRAqL
         Qjb4bdnWk5b71O4eBthgShdXJLp4l+dQvn7BtAI9lLrH5JueiqR/zWzoRfklAFsHsCIT
         U74A==
X-Gm-Message-State: AOAM5339dkJV4XrcAATlnKzqsV2/aRb33RbxkX9LrsnfkaE4OtT1Rxty
	06HMB+Hk5N16Fe8vccAEYWQXKkLHDbKpR4IGCos=
X-Google-Smtp-Source: ABdhPJwHcch6X657w8tY4AFdAkvXesJ9wyN47PxZ3pZZrAWpZf3asM4JlJ2KK9T4r6663J2kEehEvolLNc1UHCf4ro0=
X-Received: by 2002:ac8:7c4d:: with SMTP id o13mr9726106qtv.369.1619302586452;
 Sat, 24 Apr 2021 15:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210424155639.1131482-1-akuster808@gmail.com> <20210424155639.1131482-2-akuster808@gmail.com>
In-Reply-To: <20210424155639.1131482-2-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 24 Apr 2021 15:16:00 -0700
Message-ID: <CAMKF1sqK5+BHjiDcY=JJeueeUHw+3WPpu0hE-4EddpBF0OFvLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] libseccomp: move recipe from meta-security to core
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

riscv32 is not happy

ERROR: Nothing PROVIDES 'libseccomp' (but
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-core/systemd/systemd_247.6.bb,
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-support/gnutls/gnutls_3.7.1.bb
DEPENDS on or otherwise requires it)
libseccomp was skipped: incompatible with host riscv32-yoe-linux (not
in COMPATIBLE_HOST)

see
http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuriscv32/1123/consoleFull

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

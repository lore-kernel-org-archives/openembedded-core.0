Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.2106.1606246210833802509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 11:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MU6D8VWe;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id n132so22233228qke.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 11:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ZdYJDDEQbC3pys6NWqhw82cIlupFM4qItuTLCrPc10=;
        b=MU6D8VWejYZDvFXzm8wD6nXlBFD27YHWO+egV4zolIgrOoWpN0w0uQxsfauD270sQj
         6TbrGwPZTINAttnKDdl+whAGKp02M/GhHufcFNmXPhOVkNTDBQIhi3NDcnfspC5kgq4M
         hvTOICM1hte2MXPxbXp1UHdOxTRFlS2/y8VMijzwD6gDaf7VzX5TTkHjRi3zCqpziSXW
         qKh6X8vijUkqlxVzN1cpNUPRPrbs4E8/yBOYMEYUBPQlgwkDsBa0wiFArPXBtf0HkOnW
         yJZ3AoC042EQSYu/4gPHhKOuYy+Khne+AOwQlCnXxFooE0IpmUQw9Sru9fBy1cA44IRd
         ZkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ZdYJDDEQbC3pys6NWqhw82cIlupFM4qItuTLCrPc10=;
        b=tio/SgzFbfn+3WxvwMQz/ds/VJQAdh5yDW54cqqsxNnOw8FN9m3ipcX08O21fwkIac
         M/db8iBcKf2BGVoiWrDjT84gveLGuRi95LX+Wf4VkzVLr/faJnngivnl5zHC1WHk0AVb
         /rYbLLCzgITr6O61gZ6azhz6Z5T0DK93dvj3FP8qry64vjRC3DT0eLo5HZn+FRhrKT5i
         odGAnTm5U/vHtX/0OijVXYK39AeNpsKSDyWHeuWlzmm3xUQ2XWOVt5hUdnajUWPu718C
         ClqA404nTELJ8M7Mz6T9jPL0xn8TNiKs7HDThGzCI1FLcmCKt03tBjtck/MTTKtlWlDX
         yzHA==
X-Gm-Message-State: AOAM532jN+jKT6mNo34rdTXsdLGjiG//sz4Gc6HvdiBYMFyPx3M8riHy
	7yE9CcWLZSWf8Lp/ZnQD6YagmhFUbRVDO/ZEM6Y=
X-Google-Smtp-Source: ABdhPJwh48i4JEzOT/FzE3DwI5tHu9YMGoLn1ZIab5tQDEC1FH0xvw+zEHa7+2apA2w0g+0r6ckBJ5dlQvfKSMEJiPE=
X-Received: by 2002:a37:a70e:: with SMTP id q14mr6466287qke.337.1606246209393;
 Tue, 24 Nov 2020 11:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20201122124853.30262-1-andrej.valek@siemens.com> <20201123190029.13811-1-andrej.valek@siemens.com>
In-Reply-To: <20201123190029.13811-1-andrej.valek@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 24 Nov 2020 11:29:43 -0800
Message-ID: <CAMKF1srcDd6QbPzQiofUcs6GwDVx0dbCjnPquoffjRmaQmtQxg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 1/2] bitbake.conf: Split optimization into common part
To: Andrej Valek <andrej.valek@siemens.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Pascal Bach <pascal.bach@siemens.com>, Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 11:04 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> This option allows correctly handle the release/debug flags separation in
> upper recipe like cmake. Adopt SELECTED_OPTIMIZATION usage in other
> recipes.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/conf/bitbake.conf                            | 7 ++++---
>  meta/conf/distro/include/security_flags.inc       | 8 ++++----
>  meta/conf/local.conf.sample.extended              | 1 +
>  meta/recipes-devtools/valgrind/valgrind_3.16.1.bb | 1 +
>  4 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0d38eac094..5555093e24 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -569,7 +569,7 @@ TARGET_CPPFLAGS = ""
>  export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
>  BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
>  export CFLAGS = "${TARGET_CFLAGS}"
> -TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
> +TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
>
>  export BUILD_CXXFLAGS = "${BUILD_CFLAGS}"
>  BUILDSDK_CXXFLAGS = "${BUILDSDK_CFLAGS}"
> @@ -616,8 +616,9 @@ DEBUG_PREFIX_MAP ?= "-fmacro-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTEND
>  DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
>
>  # Disabled until the option works properly -feliminate-dwarf2-dups
> -FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
> -DEBUG_OPTIMIZATION = "-Og ${DEBUG_FLAGS} -pipe"
> +COMMON_OPTIMIZATION = "${DEBUG_FLAGS} -pipe"
> +FULL_OPTIMIZATION = "-O2"
> +DEBUG_OPTIMIZATION = "-Og"
>  SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"

SELECTED_OPTIMIZATION is a kind of final sum of flags that is seen by
recipes, there are more distro policies that append to it e.g.
security_flags
lto, etc and recipe space also relies on it for deducing option logic.
here we are moving some options, -pipe ${DEBUG_FLAGS} out into another
variable
COMMON_OPTIMIZATION but we do not add it back as it is but it seems
after this patch we will have two variables to look out for
SELECTED_OPTIMIZATION and COMMON_OPTIMIZATION which complicates
things. I would rather expect to make it simpler. Where there is one
final global flag set which becomes distro
policy.

>  SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
>  BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g -feliminate-unused-debug-types', '-O2', d)} -pipe"
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index 4e64eb99f9..60370eeb17 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -63,7 +63,7 @@ SECURITY_STACK_PROTECTOR_pn-glibc-testsuite = ""
>  # handled in recipes-graphics/xorg-driver/xorg-driver-common.inc
>  SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
>
> -TARGET_CC_ARCH_append_pn-binutils = " ${SELECTED_OPTIMIZATION}"
> -TARGET_CC_ARCH_append_pn-gcc = " ${SELECTED_OPTIMIZATION}"
> -TARGET_CC_ARCH_append_pn-gdb = " ${SELECTED_OPTIMIZATION}"
> -TARGET_CC_ARCH_append_pn-perf = " ${SELECTED_OPTIMIZATION}"
> +TARGET_CC_ARCH_append_pn-binutils = " ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
> +TARGET_CC_ARCH_append_pn-gcc = " ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
> +TARGET_CC_ARCH_append_pn-gdb = " ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
> +TARGET_CC_ARCH_append_pn-perf = " ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
> diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
> index 5ece522fa8..51cea43b9e 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -99,6 +99,7 @@
>  #
>  # PROFILE_OPTIMIZATION = "-pg"
>  # SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
> +# COMMON_OPTIMIZATION = ""
>  # LDFLAGS =+ "-pg"
>
>  # TCMODE controls the characteristics of the generated packages/images by
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> index bcba55f327..395d603cec 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> @@ -97,6 +97,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
>  # (via CFLAGS) means we interfere with that. Only pass DEBUG_FLAGS to it
>  # which fixes build path issue in DWARF.
>  SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
> +COMMON_OPTIMIZATION = ""
>
>  do_configure_prepend () {
>      rm -rf ${S}/config.h
> --
> 2.11.0
>
>
> 
>

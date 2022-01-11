Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF51C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 07:55:26 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.4232.1641887725792307136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 23:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qTiEPrq+;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id v7so14413258qtw.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 23:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OZ43CoGiyHhZgq97Jmrrvbtkf9vaMFol203CbyelRL8=;
        b=qTiEPrq+dovgkiOrYPTzTDk9AlfZaj5BYBsJ0A5spqttbmSLS+qaXhuKWW6mKno243
         woRE6UfAtwXmiYFS79pBN1hlEOTxBdXwfI6XBjsROjMT2hrZQgNqQKQYSnVoyC377Cbo
         l4++o0m0bAeOZC2oHybiv03RMverLU6+Ms6Vh8QzNRqHG1Fu/Q47rn5thFFQgotsKEaF
         huJAntoOKW4np9JxjArS44AapWXNLgaxS/xqN6kSIrDZXCIawbJkQMIbWkyUR3U1ITfk
         CXqlRdODONQvs8hKxJwvEcg9hJfrsHsYcpgExC4Ool5Fo5E20AcmUIw/LSDmeKdlx4fC
         rqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OZ43CoGiyHhZgq97Jmrrvbtkf9vaMFol203CbyelRL8=;
        b=U6dmew03/R5bsDdsCZZrE9sRzu3mVsQYVAVtXo38Pk6yWXOjdqQRxMOdtUAstI5xh5
         cGzYYp+SA+t4uFEbtE7pRCPEF872PrhjgT2EJqw7Bi2NhOxMY216RJpXXgRI9qFU47UH
         EPZ6mAI0tCZ3EXciDePnyFWeSsbgnEYeTet4vaL7wQ1cB3Y4ZeboYYFXqJW1WgW3MU8y
         /xT7lHL+l/d15Z111Ba0V7LSoIQPp0deIhyI1MX4MTuxaPitDPgWiTi3jQj+91s/gBTn
         HrSaN6ZFP7uA5zomeAui0uj8bUQ/xDA36xH+mz5WC1z58mJJbV3+harW7c5CHvKgeZMR
         ttYA==
X-Gm-Message-State: AOAM5310200KhQWqeZ5s+wSnrhwGF6P9+M4KnKK9K11AexKOqhd6Cmz4
	/qw+oYTSeaFvfO2nBetjOYGQfGr1cIUsyeZD0I4=
X-Google-Smtp-Source: 
 ABdhPJzc+Ed7JGqHZghwKYFOtZRDWzu32/KgsOMSO9iGFMMuYUlkpEJqBXWvD6rHyYkwmCXqn4QDIH8eYF6UQgztOZs=
X-Received: by 2002:a05:622a:48c:: with SMTP id
 p12mr2790903qtx.532.1641887724661;
 Mon, 10 Jan 2022 23:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20220111025030.1428488-1-alejandro@enedino.org>
In-Reply-To: <20220111025030.1428488-1-alejandro@enedino.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jan 2022 23:54:58 -0800
Message-ID: 
 <CAMKF1sqnEYZn4j722Wm-UvLBNZMQu8qHWr8Xo_Q4WNZNXXpu-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-cross-canadian: Fix cross canadian compiler
 for baremetal targets
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 07:55:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160388

On Mon, Jan 10, 2022 at 6:50 PM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> While building GCC it checks whether the include directory exists,
> if it doesnt it throws an error and exits:
>
> | The directory that should contain system headers does not exist:
> | tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-riscv32/
>     11.2.0-r0/recipe-sysroot/usr/include/
> | make[1]: *** [Makefile:3257: stmp-fixinc] Error 1
>
> Even though for the baremetal toolchain not having this directory
> does make sense.
>
> We overcame this by removing the --with-sysroot=/not/exist argument
> for baremetal toolchains (via TARGET_OS override), however, the
> newlib toolchain does have headers and an includedir, hence by fixing
> the baremetal toolchain we broke the newlib one since it uses the same
> TARGET_OS as baremetal, causing for example (on newlib):
>
> /sdk/sysroots/x86_64-pokysdk-linux/usr/lib/riscv32-poky-elf/gcc/
>     riscv32-poky-elf/11.2.0/include/stdint.h:9:16:
> fatal error: stdint.h: No such file or directory
>
> | # include_next <stdint.h>
>                  ^~~~~~~~~~
> compilation terminated.
>
> By creating a dummy includedir, and removing the previous fix we
> allow GCC to be built the same way, unifying the cross compiler
> for all targets.
>
> After this fix both TCLIBC=baremetal and TCLIBC=newlib SDKs work
> properly.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 495dd9070b..168486bd4e 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -45,6 +45,9 @@ export WINDRES_FOR_TARGET = "${TARGET_PREFIX}windres"
>  export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET}"
>
>  do_configure () {
> +        if [ ! -d ${RECIPE_SYSROOT}/${target_includedir} ]; then
> +            mkdir -p ${RECIPE_SYSROOT}/${target_includedir}
> +        fi

this looks ok from looks of it. Can you check what changes in
buildhistory when doing this for baremetal ( non-newlib ) build ?

>         export CC_FOR_BUILD="${BUILD_CC}"
>         export CXX_FOR_BUILD="${BUILD_CXX}"
>         export CFLAGS_FOR_BUILD="${BUILD_CFLAGS}"
> @@ -180,9 +183,6 @@ SYSTEMLIBS = "${target_base_libdir}/"
>  SYSTEMLIBS1 = "${target_libdir}/"
>
>  EXTRA_OECONF += "--enable-poison-system-directories"
> -EXTRA_OECONF:remove:elf = "--with-sysroot=/not/exist"
> -EXTRA_OECONF:remove:eabi = "--with-sysroot=/not/exist"
> -EXTRA_OECONF:append:elf = " --without-headers --with-newlib"
> -EXTRA_OECONF:append:eabi = " --without-headers --with-newlib"
> +
>  # gcc 4.7 needs -isystem
>  export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160383): https://lists.openembedded.org/g/openembedded-core/message/160383
> Mute This Topic: https://lists.openembedded.org/mt/88341227/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


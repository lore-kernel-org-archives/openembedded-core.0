Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5164ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 23:30:18 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.5120.1662161417398022192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 16:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mk/zOfuE;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id q63so3182305pga.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 16:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/Ns4YNHYqXw8apAgaC7nhkoNJKHSZq1uutApqu+co3U=;
        b=mk/zOfuExF9zY/AYR+NKnVkk8EwuUbUAOp8qo7ayPpRtLsrKGI8seJycAdVP5m9zE+
         H78VpvrZ8kS6EDGJZChY/LQt69AYk7CPgtGyRmS1be+Ten9BRzcYM1gu9ch6gwZ8+4Cz
         ORqaZGG/4Nt7Ks+Lz5oTCEbAU0jtLMLFQ0twVOj73jsCv1uxu93tCAOwOTpxzKWDNT+5
         TEUqvlgwOwyLPia0+vaDKDzr265a1C+gJEXp416LZhC3CDMR4JuUENB5cSuO5n0uilxF
         xOsbXhHXqSj7px6Sjioqva1CHYTY/ZkPscbICVsCrpMSGnsXZ6e4fyZznPBdrjSz0mvV
         QL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/Ns4YNHYqXw8apAgaC7nhkoNJKHSZq1uutApqu+co3U=;
        b=HmR9sUmtB8RJBlPBWz51MEIHGoaBltjxYW7xxVS5cAigW1+JG591xatxSeBlfjqBZq
         dV7td/ubqhjPp8qf6ZQmktdWyxzIV5xNlCqSECyBYr6nQIWzk5gIiJ3jrPiYVaQmAEk1
         CTgNRTZbekPv0C6Ntb+Ks+IVhvZyPzd4AHps8nQLtHGIK851uQoglyJ7sjbh6taie9iW
         xitleVk+F5+e1swEKBZQOKP+gAeFQn7rOpXNR4FbPON2a4+rXTvmAZwtv7SEBUdlOEpR
         VLgvPvft2jv7GD/1kYXThW3SsBHLmSE6fCJBp6yr2nj3z/i1Cb0/y1pt34lVw9SMvrg0
         mJ9w==
X-Gm-Message-State: ACgBeo3i0ilITWiSqwFnalvKV2uIFMPWkAWdQBB8P1df5cgvfSPFRwRI
	j/UFohUzqEip5etA9xZicwcCenKUMFOQPPzLI3Ni7+3c
X-Google-Smtp-Source: 
 AA6agR7CdU0mv8uTZyTYNeoBapFsJM4IIxlH8NQb2AkBLZbObp860OMKZc52Yd1CYoJInJrqJoleBnHR7u7CphQV9Ks=
X-Received: by 2002:a05:6a00:1d1f:b0:53a:be2f:df38 with SMTP id
 a31-20020a056a001d1f00b0053abe2fdf38mr15162208pfx.20.1662161416742; Fri, 02
 Sep 2022 16:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220902160958.321738-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220902160958.321738-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 2 Sep 2022 20:30:06 -0300
Message-ID: 
 <CADkTA4MtJH4vqav6OO0601SXKG3XUJMs9+fvweiGQKpYVGs+0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Always set CC and LD for the kernel
 build
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 23:30:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170264

On Fri, Sep 2, 2022 at 1:10 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> It as been bothering me a bit that we don't set CC and LD consistently
> for the kernel make calls and this can lead to interesting bugs as the
> kernel increases in complexity. Add them to EXTRA_OEMAKE so they're
> always passed in. This makes everything slightly more consistent and
> less likely to break in future.
>

Looks good to me .. it was definitely organic and ad-hoc to end up in
the current state :)

Bruce

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-recipe/kernel.bbclass | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index b5ddd6dabc8..e752874177e 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -237,8 +237,9 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
>  # Some Linux kernel configurations need additional parameters on the command line
>  KERNEL_EXTRA_ARGS ?= ""
>
> -EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
> -EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false"
> +EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}"'
> +EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
> +EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false'
>
>  KERNEL_ALT_IMAGETYPE ??= ""
>
> @@ -381,7 +382,7 @@ kernel_do_compile() {
>                 use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
>         fi
>         for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> -               oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> +               oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
>         done
>  }
>
> @@ -413,7 +414,7 @@ do_compile_kernelmodules() {
>                 bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
>         fi
>         if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
> -               oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> +               oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
>
>                 # Module.symvers gets updated during the
>                 # building of the kernel modules. We need to
> @@ -604,7 +605,7 @@ sysroot_stage_all () {
>         :
>  }
>
> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" LD="${KERNEL_LD}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" LD="${KERNEL_LD}" oldnoconfig"
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
>
>  python check_oldest_kernel() {
>      oldest_kernel = d.getVar('OLDEST_KERNEL')
> @@ -642,7 +643,7 @@ kernel_do_configure() {
>
>  do_savedefconfig() {
>         bbplain "Saving defconfig to:\n${B}/defconfig"
> -       oe_runmake -C ${B} LD='${KERNEL_LD}' savedefconfig
> +       oe_runmake -C ${B} savedefconfig
>  }
>  do_savedefconfig[nostamp] = "1"
>  addtask savedefconfig after do_configure
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170257): https://lists.openembedded.org/g/openembedded-core/message/170257
> Mute This Topic: https://lists.openembedded.org/mt/93422840/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


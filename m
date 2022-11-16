Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E577FC4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 08:24:32 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.4460.1668587063344065087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 00:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fYWlq5mU;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id a15so20830569ljb.7
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IeThOk5trviReUjBTuFmikQCPtlcRF8n1lTqm2DeIr0=;
        b=fYWlq5mUxwJt8O1rf6euUPtxxoWyLsoHEj64izSwe5F7TSQKtU3eavmMZbt2L9NxR5
         NnSXDegI9vy9N5h6OwVNbtcZCj3ze1WvM24TC3Wcc1HEpt6YKU8kOzXgYPKfY2Agnj+l
         JgS/y+F/KDDF+wwspWpm41jYFInEp3V8P96BtUOcdJczclwNJHvvhObzWhz8WpQ7DHlM
         S9l18lXvOIMbkZ4rUq0H+Bdec4jmdkaTHCOmpBl34df8i2iOQwZ46m6Du832qVU40Coq
         JR6uNleHTi4BhwcjQhGylckuTp2yzLsyXrPZ31Riz16xDUwtJeIzZyO24vmq0rxV7KpS
         k6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeThOk5trviReUjBTuFmikQCPtlcRF8n1lTqm2DeIr0=;
        b=jvvcZj/tn5bxrccb+HvjM4XP0TnPy+aZRHDAs0MC0Rsep9iurBHdHX63Crdm+JTKIG
         D5ClnKTU7eUyQuYWSJiWKxMSmqpeJUF211la/+Sm3l/hFdbUFFv4nLtL6xktwiqSM2ay
         J3lEVz1vhtiqqIOfYU//HC43TIo/uB0c23JYEjmNSmSxt6v4JGfKOVSgbBwmPsixGU8i
         FVwZgF4TT5FuKTd53pghB371qwZHhMG0Hex+Ki1H3DbWuHYT8znGW+BLZcw9LSjhSumF
         8ez3WRcrKmPuF5GLbdv/IM7+nCiO+6QwgoSvjdN6KaJ0GXZZ/PMhv7uPBghtH9Snov8s
         +wFg==
X-Gm-Message-State: ANoB5pmUhaDnAeD1oHhARdIMP1jTtQpL9avfJzR6lVLKG8UJeCfhX7rL
	mdzmKPjMux0NcOVpzqhcjX/KO3YdsohF6dxNUvw=
X-Google-Smtp-Source: AA0mqf4JL/ypePW0daqBcXX1wcGz2SNiSXrH+xmXD9dSX+EYHCOubhey70QkxqqLGtTXiXuvZEkEs2zuLntne4OzjME=
X-Received: by 2002:a2e:6d11:0:b0:26f:c081:9aed with SMTP id
 i17-20020a2e6d11000000b0026fc0819aedmr7181053ljc.222.1668587061170; Wed, 16
 Nov 2022 00:24:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668558954.git.bruce.ashfield@gmail.com> <71cfe4b75e2078194882ea32325683dd88050536.1668558954.git.bruce.ashfield@gmail.com>
In-Reply-To: <71cfe4b75e2078194882ea32325683dd88050536.1668558954.git.bruce.ashfield@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Nov 2022 09:24:09 +0100
Message-ID: <CANNYZj-TRN0-wWKVz3FWCebyh+m-d+OhYaUqRNZumoGPoZ2ZfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 09/10] kernel-devsrc: fix for v6.1+
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 08:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173381

I guess many people have seen already seen this, but 6.1 has initial
rust support:
https://lwn.net/Articles/910762/

So if anyone wants a project that will make them look hip and sexy and
cool (software development-wise): draft an RFC patch for how we could
do this in Yocto.

Alex


On Wed, 16 Nov 2022 at 01:38, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> The 6.1 kernel has a number of Kbuild and architecture changes
> that required us to update our devsrc recipe. With these changes
> we are once again able to build on target modules for all
> supported archectures.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 25 ++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 46d706b955..253b8d307d 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -145,6 +145,9 @@ do_install() {
>
>         cp -a scripts $kerneldir/build
>
> +       # for v6.1+ (otherwise we are missing multiple default targets)
> +       cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
> +
>         # if our build dir had objtool, it will also be rebuilt on target, so
>         # we copy what is required for that build
>         if [ -f ${B}/tools/objtool/objtool ]; then
> @@ -171,6 +174,9 @@ do_install() {
>             # arch/arm64/include/asm/opcodes.h references arch/arm
>             cp -a --parents arch/arm/include/asm/opcodes.h $kerneldir/build/
>
> +           # v6.1+
> +           cp -a --parents arch/arm64/kernel/asm-offsets.c $kerneldir/build/
> +
>              cp -a --parents arch/arm64/kernel/vdso/*gettimeofday.* $kerneldir/build/
>              cp -a --parents arch/arm64/kernel/vdso/sigreturn.S $kerneldir/build/
>              cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
> @@ -206,6 +212,9 @@ do_install() {
>             cp -a --parents arch/powerpc/kernel/vdso/*.S $kerneldir/build 2>/dev/null || :
>             cp -a --parents arch/powerpc/kernel/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
>             cp -a --parents arch/powerpc/kernel/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
> +
> +           # v6,1+
> +           cp -a --parents arch/powerpc/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
>         fi
>         if [ "${ARCH}" = "riscv" ]; then
>              cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
> @@ -234,6 +243,9 @@ do_install() {
>              fi
>
>              cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
> +            # v6.1+
> +            cp -a --parents arch/arm/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
> +            cp -a --parents arch/arm/kernel/signal.h $kerneldir/build/ 2>/dev/null || :
>         fi
>
>         if [ -d arch/${ARCH}/include ]; then
> @@ -282,15 +294,24 @@ do_install() {
>             # objtool requires these files
>             cp -a --parents arch/x86/lib/inat.c $kerneldir/build/ 2>/dev/null || :
>             cp -a --parents arch/x86/lib/insn.c $kerneldir/build/ 2>/dev/null || :
> +
> +           # v6.1+
> +           cp -a --parents arch/x86/kernel/asm-offsets* $kerneldir/build || :
> +           # for capabilities.h, vmx.h
> +           cp -a --parents arch/x86/kvm/vmx/*.h $kerneldir/build || :
> +           # for lapic.h, hyperv.h ....
> +           cp -a --parents arch/x86/kvm/*.h $kerneldir/build || :
>         fi
>
> +       # moved from arch/mips to all arches for v6.1+
> +       cp -a --parents kernel/time/timeconst.bc $kerneldir/build 2>/dev/null || :
> +       cp -a --parents kernel/bounds.c $kerneldir/build 2>/dev/null || :
> +
>         if [ "${ARCH}" = "mips" ]; then
>             cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
>             cp --parents $(find  -type f -name "Platform") $kerneldir/build
>             cp --parents arch/mips/boot/tools/relocs* $kerneldir/build
>             cp -a --parents arch/mips/kernel/asm-offsets.c $kerneldir/build
> -           cp -a --parents kernel/time/timeconst.bc $kerneldir/build
> -           cp -a --parents kernel/bounds.c $kerneldir/build
>             cp -a --parents Kbuild $kerneldir/build
>             cp -a --parents arch/mips/kernel/syscalls/*.sh $kerneldir/build 2>/dev/null || :
>             cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build 2>/dev/null || :
> --
> 2.19.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173372): https://lists.openembedded.org/g/openembedded-core/message/173372
> Mute This Topic: https://lists.openembedded.org/mt/95057295/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


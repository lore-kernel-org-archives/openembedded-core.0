Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6B8C433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 13:26:34 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web12.7158.1668605192369852632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 05:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UyRr3eqJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id r2so9097116ilg.8
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qBl5H+/CP/oE/zfc33I1VR9ZdEVCo1WVP2Yj8SQO4qI=;
        b=UyRr3eqJOeP7ZI27aRr7F50YAWO9+LmJ/63H4NKY9EAL0GIQdjuX8jdOP24Qe8lILY
         CUMJGRsk3piQ64KsjeTePodGGmF3K+BvCwakuTd1kiCFdRISHfsgsm3zRlZR15Qke7CL
         HcILUlQkIsv+iDcHqXnv4rfkKxWSBg+lKaK8NABRUXnAhdfoSj84VHBBgLjgKT0Y/s81
         L9PsZU4Rx/hBO6QWSmcg9iMLWrDEjWcwzRyt6+bRVpD1Lw6bUki4d24wvAf4JFFlc44B
         pyNtIejRvcSnFpflQSr8O1tjrtgV1b3vH2AYad48bMG1+KFMsJKE7bWfoKtpkf3Rishq
         ah0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBl5H+/CP/oE/zfc33I1VR9ZdEVCo1WVP2Yj8SQO4qI=;
        b=6KdovlnICCo9QiT5VJxwh63TXEy+VcDGJ3CW0qIc7KbUsf+ilmwBdMdZ8DNQxEMF8o
         5TB6iXI9ufxHzg1NvhvvBwDPGCzTjlvcb2UL9dfW9Rxv32XEnR7e+iLq1PNOsvxHU5+U
         mu81wtpPL7Aa8wXHr/KUOPkEimbo+/fb0X2zlc/NeKopIVlHcljlUULlQDaNWauYlqgW
         CWzwAJFxyGOgdnvKNb7fFXqMM75V2kY7XBgbl+zcjXZj83lsRFzm2/wX6bwUEgv/PN8Y
         fDoZMzQwOx5PWMRAa/ZVvzZ3uw4h3ldfyD7fXJsD1P9Vt5ZxVRCnn5cdhmupyVhhV9lj
         cRXg==
X-Gm-Message-State: ANoB5plzrN6FQtBxkVqRf4Sb2X5pgMdxNBgCXCKrfKW0d+dIE0RlXkJ4
	nHpNYsmyXbRntv1peNYf9gm1FlkH/0HuQ68ldSA=
X-Google-Smtp-Source: AA0mqf5Kiv2NhC4lBIEXCwmc6HHeLkHEjqHVzf5xzcEIIn1SeOJ1MXICb09z9SRwInUVhnzwHLffI1DQzo1OYZ1lVMs=
X-Received: by 2002:a05:6e02:505:b0:300:cb73:b9d0 with SMTP id
 d5-20020a056e02050500b00300cb73b9d0mr10639691ils.276.1668605191461; Wed, 16
 Nov 2022 05:26:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
 <71cfe4b75e2078194882ea32325683dd88050536.1668558954.git.bruce.ashfield@gmail.com>
 <CANNYZj-TRN0-wWKVz3FWCebyh+m-d+OhYaUqRNZumoGPoZ2ZfA@mail.gmail.com>
In-Reply-To: <CANNYZj-TRN0-wWKVz3FWCebyh+m-d+OhYaUqRNZumoGPoZ2ZfA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Nov 2022 08:26:20 -0500
Message-ID: <CADkTA4O3h2HDZnNse883VYHDE0e94+Jq4gboC9E17sDKc7zi4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 09/10] kernel-devsrc: fix for v6.1+
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 13:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173384

On Wed, Nov 16, 2022 at 3:24 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I guess many people have seen already seen this, but 6.1 has initial
> rust support:
> https://lwn.net/Articles/910762/

Indeed. I was just happy that it is optional now, so I could get through the 6.1
introduction cycle without needing to figure out how to get the rust
dependencies included (I think I'd still be waiting for rust to build
now, if that
had been the case).

>
> So if anyone wants a project that will make them look hip and sexy and
> cool (software development-wise): draft an RFC patch for how we could
> do this in Yocto.

+1

I'll eventually look at it, but I'd be happy to be beaten to the work by an
interested party!

Bruce

>
> Alex
>
>
> On Wed, 16 Nov 2022 at 01:38, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The 6.1 kernel has a number of Kbuild and architecture changes
> > that required us to update our devsrc recipe. With these changes
> > we are once again able to build on target modules for all
> > supported archectures.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/kernel-devsrc.bb | 25 ++++++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > index 46d706b955..253b8d307d 100644
> > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > @@ -145,6 +145,9 @@ do_install() {
> >
> >         cp -a scripts $kerneldir/build
> >
> > +       # for v6.1+ (otherwise we are missing multiple default targets)
> > +       cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
> > +
> >         # if our build dir had objtool, it will also be rebuilt on target, so
> >         # we copy what is required for that build
> >         if [ -f ${B}/tools/objtool/objtool ]; then
> > @@ -171,6 +174,9 @@ do_install() {
> >             # arch/arm64/include/asm/opcodes.h references arch/arm
> >             cp -a --parents arch/arm/include/asm/opcodes.h $kerneldir/build/
> >
> > +           # v6.1+
> > +           cp -a --parents arch/arm64/kernel/asm-offsets.c $kerneldir/build/
> > +
> >              cp -a --parents arch/arm64/kernel/vdso/*gettimeofday.* $kerneldir/build/
> >              cp -a --parents arch/arm64/kernel/vdso/sigreturn.S $kerneldir/build/
> >              cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
> > @@ -206,6 +212,9 @@ do_install() {
> >             cp -a --parents arch/powerpc/kernel/vdso/*.S $kerneldir/build 2>/dev/null || :
> >             cp -a --parents arch/powerpc/kernel/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
> >             cp -a --parents arch/powerpc/kernel/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
> > +
> > +           # v6,1+
> > +           cp -a --parents arch/powerpc/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
> >         fi
> >         if [ "${ARCH}" = "riscv" ]; then
> >              cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
> > @@ -234,6 +243,9 @@ do_install() {
> >              fi
> >
> >              cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
> > +            # v6.1+
> > +            cp -a --parents arch/arm/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
> > +            cp -a --parents arch/arm/kernel/signal.h $kerneldir/build/ 2>/dev/null || :
> >         fi
> >
> >         if [ -d arch/${ARCH}/include ]; then
> > @@ -282,15 +294,24 @@ do_install() {
> >             # objtool requires these files
> >             cp -a --parents arch/x86/lib/inat.c $kerneldir/build/ 2>/dev/null || :
> >             cp -a --parents arch/x86/lib/insn.c $kerneldir/build/ 2>/dev/null || :
> > +
> > +           # v6.1+
> > +           cp -a --parents arch/x86/kernel/asm-offsets* $kerneldir/build || :
> > +           # for capabilities.h, vmx.h
> > +           cp -a --parents arch/x86/kvm/vmx/*.h $kerneldir/build || :
> > +           # for lapic.h, hyperv.h ....
> > +           cp -a --parents arch/x86/kvm/*.h $kerneldir/build || :
> >         fi
> >
> > +       # moved from arch/mips to all arches for v6.1+
> > +       cp -a --parents kernel/time/timeconst.bc $kerneldir/build 2>/dev/null || :
> > +       cp -a --parents kernel/bounds.c $kerneldir/build 2>/dev/null || :
> > +
> >         if [ "${ARCH}" = "mips" ]; then
> >             cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
> >             cp --parents $(find  -type f -name "Platform") $kerneldir/build
> >             cp --parents arch/mips/boot/tools/relocs* $kerneldir/build
> >             cp -a --parents arch/mips/kernel/asm-offsets.c $kerneldir/build
> > -           cp -a --parents kernel/time/timeconst.bc $kerneldir/build
> > -           cp -a --parents kernel/bounds.c $kerneldir/build
> >             cp -a --parents Kbuild $kerneldir/build
> >             cp -a --parents arch/mips/kernel/syscalls/*.sh $kerneldir/build 2>/dev/null || :
> >             cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build 2>/dev/null || :
> > --
> > 2.19.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173372): https://lists.openembedded.org/g/openembedded-core/message/173372
> > Mute This Topic: https://lists.openembedded.org/mt/95057295/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


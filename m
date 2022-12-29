Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E004AC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 19:25:47 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.2016.1672341947230063793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 11:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TBT6Nv6Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id fc4so47025455ejc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 11:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jy5HhxqzRKvBY2pjZrn+gLdove8U+PjtNb7wZ2KJdk=;
        b=TBT6Nv6ZhirpcoxxNfZ8v+J+aSDZy/YK7DRHPdThhD40lGYmuo6lqBprPjlsqFX2v2
         5fc1madCn8vsPOxcrswvVZKK5zNiL/D6QkW/J3UElc/1mK+dDIBSTXzwvIZHvrk1wP8e
         c44kIlAcZMG63iZ2LFqd9T0a3ow/uKRpmov+RXFnLiv72AjeMsJKYpBWUxJe5S8KOjWo
         vLjO21hFl5HIzfYiAMvHrBRaooWQg4XARe+1cffftj3KOtyh4c9iKzln3xdzZC6JSoMN
         FJZf1xp5vNfdB3BlEheHr3m7uXTecXkHjzAEQ7EHACfaiVRXrziFI3ixAjJDMs/eSiUd
         zK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Jy5HhxqzRKvBY2pjZrn+gLdove8U+PjtNb7wZ2KJdk=;
        b=X4CFpfBOQ6ab/5R6/wZhGLmkzxhoXdmcWs7w4fwn5Ah2ne633PxcxZ+tmxpvADWElI
         Aw/exYkYGh0/3m/+cT+OiIi0sJrYhQ3cekzZanY60T2xjpeCoRfp8G5dHz4tdX+05EQd
         IeQiap98C0EtJRlp+Qqv8AAziO2VJ8vZ68xtDnWiRwXt1ByfOxtwF+s5/DQUJ17MYAYH
         HWKX8XWIuQyvtiUvgCnsas2tFR6VonzVCRnQAKEzCPskIBFwK6x1A5UzB3QLCQ/Iw/Hg
         DCGuDgKjdTuKiw8d8Dl3ane9AYcV8mkfwUlnh35dIfRmJwFcuPINILOcD4H7W4UXNIgN
         zLdA==
X-Gm-Message-State: AFqh2kqQHyCOX3TykzgzgnF3Y/+UUGG6Il5Gyupg/K7uxrSVf6Vd3nGZ
	J3M5Wo8soan2uJgJHIhh01Gh+h36R68WrUxqsGM=
X-Google-Smtp-Source: AMrXdXsO/erRb3KvHSHGPuJ5h3N+RH2G52IDhEw2EncuASqlY/UJJB9doKMOBH2j9MI5jyMAesRqMJ13hy/UHgSfRcw=
X-Received: by 2002:a17:906:3e8e:b0:7c1:1007:a346 with SMTP id
 a14-20020a1709063e8e00b007c11007a346mr1997566ejj.559.1672341945679; Thu, 29
 Dec 2022 11:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
 <d9a2558d888f94721deb2696a426773dced38c44.camel@linuxfoundation.org>
 <CAO5Uq5RdKixvptDjxb4GqxSgFMosT+-Gf0=gjw3o=HXCpJCYcA@mail.gmail.com>
 <2da2bcbfa690802a5dd68e7def0b7b07d1c9c277.camel@linuxfoundation.org>
 <CAO5Uq5S1MvMr1rM36ovf-+_xPmUq8q6BzBiY20=SYsztj6i9VA@mail.gmail.com> <98901e74ee915574e306c3c0896354d8a4565778.camel@linuxfoundation.org>
In-Reply-To: <98901e74ee915574e306c3c0896354d8a4565778.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 29 Dec 2022 19:25:33 +0000
Message-ID: <CAO5Uq5T0KPmTgV41MODOa_i3WL3Ct1yR7XySW=RqA4SEP7EG-Q@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v4 00/11] Add rust runtime tests
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 19:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175129

On Thu, Dec 29, 2022 at 12:53 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-12-28 at 14:51 +0000, Alex Kiernan wrote:
> > On Wed, Dec 28, 2022 at 12:01 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2022-12-27 at 18:09 +0000, Alex Kiernan wrote:
> > > > On Mon, Dec 26, 2022 at 6:33 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Sun, 2022-12-25 at 21:59 +0000, Alex Kiernan wrote:
> > > > > > This series adds runtime tests for rust and cargo, merges (most of) the
> > > > > > include files into the base recipes and fixes target cargo builds.
> > > > > >
> > > > > > Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
> > > > > > of packagegroup-core-sdk.
> > > > > >
> > > > > > Changes in v4:
> > > > > > - Fixup `__stack_chk_fail_local` in musl-x86
> > > > > > - Add crossbeam atomics fixes for ppc/mips
> > > > > >
> > > > > > Changes in v3:
> > > > > > - Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
> > > > > >   (which defaults to SDK_TOOLCHAIN_LANGS)
> > > > > >
> > > > > > Changes in v2:
> > > > > > - Drop rust.inc/rust.bb merge, not actually made use of in the change
> > > > > >   set
> > > > > > - Reorder so cargo test goes after build fixes
> > > > > >
> > > > > > Alex Kiernan (11):
> > > > > >   rust-llvm: Merge .inc into .bb
> > > > > >   rust-llvm: Update LLVM_VERSION to match embedded version
> > > > > >   packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
> > > > > >   packagegroup-core-sdk: Add SDK toolchain language selection support
> > > > > >   cargo: Merge .inc into .bb
> > > > > >   cargo: Extend DEBUG_PREFIX_MAP to cover vendor
> > > > > >   rust: Merge .inc into .bb
> > > > > >   rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source
> > > > > >   cargo: Override crossbeam-utils with 0.8.14
> > > > > >   packagegroup-rust-sdk-target: Add cargo
> > > > > >   oeqa/runtime/rust: Add cargo test
> > > > >
> > > > > Looks much better thanks. There was one remaining issue which showed up
> > > > > in testing with a reproducibility issue:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2119/steps/12/logs/stdio
> > > > >
> > > > > We did already have an open bug for a rust reproducibility issue and we
> > > > > excluded it from the tests until we could get to the bottom of it, I
> > > > > suspect cargo may have the same issue. It frustrates me a bit as it is
> > > > > the one reproducibility exclusion for core.
> > > > >
> > > > > Ideally we would fix it but excluding it from the tests and noting it
> > > > > in the bug may be an option if it is the same issue. It may be simpler
> > > > > to reproduce and fix the issue with cargo too.
> > > > >
> > > > > Cc: Sundeep who as been looking at it.
> > > > >
> > > >
> > > > Just reading the ticket and the upstream ones... the upstream ticket
> > > > is closed as remap path fixes it (which it looks like it does to me),
> > > > there are build paths embedded in the build directory which don't get
> > > > caught by that, but they're in thing like bootstrap which isn't
> > > > packaged (which may or may not be an issue, but I'm suspecting not);
> > > > it kinda feels like we're missing something.
> > > >
> > > > Can I get hold of the cargo packages generated here to have a poke at them?
> > >
> > > Yes. The key line in the log is:
> > >
> > > 022-12-26 11:56:30,555 - oe-selftest - INFO - Non-reproducible packages will be copied to /srv/autobuilder/autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221226-0vk5efsk
> > >
> > > i.e.
> > >
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221226-0vk5efsk
> > >
> > > where you'll find both the package files and diffoscope output:
> > >
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221226-0vk5efsk/packages/diff-html/
> > >
> > > which seems to be saying the symbol table changed size which is
> > > unusual. I didn't look very deeply.
> > >
> >
> > Upstream has this ticket which, given how I did the patching for
> > cargo, feels like the right kind of thing (rust has something similar
> > out of the box):
> >
> > https://github.com/rust-lang/rust/issues/98185
> >
> > I've switched it around so that it uses local patching rather than
> > cargo patching, which if it is this, seems like it might resolve it.
>
> It was a different issue, thanks for tracking that down and fixing it!
>

I'm not so sure - there's a .cargo/config.toml in the vendored rustc
tarball which explicitly patches one of the vendored sources (it feels
odd, but hey...), so I think we'll trip over this issue (assuming
that's what the problem is).

> The tests all passed so I merged the v5 series. Thanks for working
> through things, I think this makes our rust situation much more robust
> and should help future proof it :)
>

:)

-- 
Alex Kiernan


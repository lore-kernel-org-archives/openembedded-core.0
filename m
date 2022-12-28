Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1D1C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 14:51:35 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.181844.1672239088475748026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 06:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LNaOalR7;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id c17so23073019edj.13
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 06:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fFE82l5B85feyATaewUy32i1h6mmfYtsTYjVmfKT7yo=;
        b=LNaOalR7rqoYiXRF0EvWKF4o2xxO4WWAYmxeN6qIOSWdp078XoMPgODIZ7JgdWI0il
         q6lXJ/4j42EsaJZm9ELEAjbPAwZyR6Bz2+Sg6bEdJWkZT3tehOH3KKLcSTiH0h9Qapem
         EBnIJmLS7Qo3FP0QcEl/XdY55unqH1G4GgjLQbkoWfIjbe5nfZYoootNehNDEJaFLEr2
         8WPtAlsbGKpoFxntT5+we4kjLMHsdhe+pCEcrYA5MfnGM8/z9F4rVawh9oBER3BLkb/S
         LseGrpscPGI9vG44UmMMB+jlIbv/ukXan1iKUjJOJSQYqEiepO7HluGAuflc6Koc5C5P
         FnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFE82l5B85feyATaewUy32i1h6mmfYtsTYjVmfKT7yo=;
        b=rGCTFp3j1vKp61ygQokewH1Oa3oS9EQ1Kl++zZOEDgSelQgCHvc+4lfgyTjRhO2sVa
         ENcnKio2qrgcWwc1PUODqHjkltXps5zfz2kq7BazH3T6FFBB4NZol/VT0LpwBO4ZW3YG
         yK4ms0nieF34w04JDWy/uOpVOQAzch/P9WYk2hCK1UFQA12pAvVWDrFxA4blQ919zANu
         hqMQ5mRwQHMmimF7Ki0e77ss2Wf8d+cV0DRt5TIpSVdMQzx4byz9WQAZChylS82tO8XH
         2Bq2ZFdVb0dyhLPqI7jjzbRzo93+p1ZGiH9zrY8Lyylyhi1Szo0sBcQ+UkUDCrGEKZT5
         f7QA==
X-Gm-Message-State: AFqh2koYd1LmcbHwwqFFtkFAT9YRKnD0fFioCAE0UtGK3hFTQZI3qAML
	fxYT3UOWZKvQVEYh+qhzyMjEgJbpYdfbCj9KbIA=
X-Google-Smtp-Source: AMrXdXvTbZ7xVnIAeeDKuOwXy6iyedajt8uabUjeBQz/BH7k66X/Q0FGnncAky35P9NcMe10zWt5A2SO6CM8+6mqGt0=
X-Received: by 2002:a05:6402:1c9b:b0:459:53dc:adc9 with SMTP id
 cy27-20020a0564021c9b00b0045953dcadc9mr1955762edb.166.1672239086563; Wed, 28
 Dec 2022 06:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
 <d9a2558d888f94721deb2696a426773dced38c44.camel@linuxfoundation.org>
 <CAO5Uq5RdKixvptDjxb4GqxSgFMosT+-Gf0=gjw3o=HXCpJCYcA@mail.gmail.com> <2da2bcbfa690802a5dd68e7def0b7b07d1c9c277.camel@linuxfoundation.org>
In-Reply-To: <2da2bcbfa690802a5dd68e7def0b7b07d1c9c277.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 28 Dec 2022 14:51:15 +0000
Message-ID: <CAO5Uq5S1MvMr1rM36ovf-+_xPmUq8q6BzBiY20=SYsztj6i9VA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v4 00/11] Add rust runtime tests
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 14:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175069

On Wed, Dec 28, 2022 at 12:01 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-12-27 at 18:09 +0000, Alex Kiernan wrote:
> > On Mon, Dec 26, 2022 at 6:33 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Sun, 2022-12-25 at 21:59 +0000, Alex Kiernan wrote:
> > > > This series adds runtime tests for rust and cargo, merges (most of) the
> > > > include files into the base recipes and fixes target cargo builds.
> > > >
> > > > Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
> > > > of packagegroup-core-sdk.
> > > >
> > > > Changes in v4:
> > > > - Fixup `__stack_chk_fail_local` in musl-x86
> > > > - Add crossbeam atomics fixes for ppc/mips
> > > >
> > > > Changes in v3:
> > > > - Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
> > > >   (which defaults to SDK_TOOLCHAIN_LANGS)
> > > >
> > > > Changes in v2:
> > > > - Drop rust.inc/rust.bb merge, not actually made use of in the change
> > > >   set
> > > > - Reorder so cargo test goes after build fixes
> > > >
> > > > Alex Kiernan (11):
> > > >   rust-llvm: Merge .inc into .bb
> > > >   rust-llvm: Update LLVM_VERSION to match embedded version
> > > >   packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
> > > >   packagegroup-core-sdk: Add SDK toolchain language selection support
> > > >   cargo: Merge .inc into .bb
> > > >   cargo: Extend DEBUG_PREFIX_MAP to cover vendor
> > > >   rust: Merge .inc into .bb
> > > >   rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source
> > > >   cargo: Override crossbeam-utils with 0.8.14
> > > >   packagegroup-rust-sdk-target: Add cargo
> > > >   oeqa/runtime/rust: Add cargo test
> > >
> > > Looks much better thanks. There was one remaining issue which showed up
> > > in testing with a reproducibility issue:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2119/steps/12/logs/stdio
> > >
> > > We did already have an open bug for a rust reproducibility issue and we
> > > excluded it from the tests until we could get to the bottom of it, I
> > > suspect cargo may have the same issue. It frustrates me a bit as it is
> > > the one reproducibility exclusion for core.
> > >
> > > Ideally we would fix it but excluding it from the tests and noting it
> > > in the bug may be an option if it is the same issue. It may be simpler
> > > to reproduce and fix the issue with cargo too.
> > >
> > > Cc: Sundeep who as been looking at it.
> > >
> >
> > Just reading the ticket and the upstream ones... the upstream ticket
> > is closed as remap path fixes it (which it looks like it does to me),
> > there are build paths embedded in the build directory which don't get
> > caught by that, but they're in thing like bootstrap which isn't
> > packaged (which may or may not be an issue, but I'm suspecting not);
> > it kinda feels like we're missing something.
> >
> > Can I get hold of the cargo packages generated here to have a poke at them?
>
> Yes. The key line in the log is:
>
> 022-12-26 11:56:30,555 - oe-selftest - INFO - Non-reproducible packages will be copied to /srv/autobuilder/autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221226-0vk5efsk
>
> i.e.
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221226-0vk5efsk
>
> where you'll find both the package files and diffoscope output:
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221226-0vk5efsk/packages/diff-html/
>
> which seems to be saying the symbol table changed size which is
> unusual. I didn't look very deeply.
>

Upstream has this ticket which, given how I did the patching for
cargo, feels like the right kind of thing (rust has something similar
out of the box):

https://github.com/rust-lang/rust/issues/98185

I've switched it around so that it uses local patching rather than
cargo patching, which if it is this, seems like it might resolve it.

--
Alex Kiernan


Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027BFC4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 18:10:09 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.162910.1672164605891122747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 10:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zx8NRDnJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id z11so4114992ede.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YxQ2Ys3/ioFmon4dRcylNfOCThm9wceut8q+6a1l8wY=;
        b=Zx8NRDnJbROUrR0nTmBwwgwBq0uqUp+d8xmu8baZ7AQrZ33l4IH1483oKlULB6a2ff
         5oxxMp6fbVWZJrmaMOFArfJbdFtW8mJARatz5fUb+R39v2IWSrvV2LY8I1lpdYdErOCX
         v865zkgn3prJ2mJBFRShHUnFyD8oLPWPuOhF5Jq9rSrVwZNUJxSNzz3AVtxDUGqe9Ow1
         EMm+H6vUQ3dY4q2H/0NKZy69JfCAwgmixBLTpgMbQ3LwFAtwCr/dRKsgcdYHJ9zLUtuJ
         COxpMsG1o+M6xqNABzuVbqACUBELyjbFTc1cQIzQHOhroC/y80DJzf7/JvUcPEue9e6r
         cZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxQ2Ys3/ioFmon4dRcylNfOCThm9wceut8q+6a1l8wY=;
        b=c9gLknMbftkLt0zv/JNb9Jx6XOpM529f6+Ax1pMY6dj8TS3MH3ljDFAoCvun2g8Jpo
         BiqhJl77ZGW3VYz3/4Z9vJPgKcS5r2DTH958K1Im6f6FpjzIj3eDcTAGT+hBKbtWcYfZ
         jDvtYaBBEVHl9AN6tEwzPGpcq5tau4epUspn92wZEH3FNDue4C7td1W2P2OxtAqOkUWH
         rLtAAV/ah8W5yPkDY4Dx5OYcH3nxXcR6mzlxCugBGEi7ROpdWYtVVT2kvvGA+vupMTSl
         TSPEjaq7fxWMwoYwHG6/FlbxShk0p1JEhhi6ayPgbribmJVPE7+Nqfs233MDeBAAdzL7
         ip/w==
X-Gm-Message-State: AFqh2krZqFIT+qnA69wXoksgkfYRI1tcGUjERXSZb9jvn2eb3JvQhG7u
	W34bEimyg8iXFdsw/Xg2qnX5Vo4+r4RNUQSgi2A=
X-Google-Smtp-Source: AMrXdXuy4yhB7c1HPYT4DQg5T0lakxwbuy+rSAXiwrc3wuJHsJKcCM4KIPVa/L7X/wO4o5TKuX+trjZPvha9WcVIlc8=
X-Received: by 2002:aa7:c742:0:b0:46d:66e6:5dd4 with SMTP id
 c2-20020aa7c742000000b0046d66e65dd4mr2669610eds.373.1672164604328; Tue, 27
 Dec 2022 10:10:04 -0800 (PST)
MIME-Version: 1.0
References: <20221225215921.12868-1-alex.kiernan@gmail.com> <d9a2558d888f94721deb2696a426773dced38c44.camel@linuxfoundation.org>
In-Reply-To: <d9a2558d888f94721deb2696a426773dced38c44.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 27 Dec 2022 18:09:51 +0000
Message-ID: <CAO5Uq5RdKixvptDjxb4GqxSgFMosT+-Gf0=gjw3o=HXCpJCYcA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v4 00/11] Add rust runtime tests
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 18:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175032

On Mon, Dec 26, 2022 at 6:33 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2022-12-25 at 21:59 +0000, Alex Kiernan wrote:
> > This series adds runtime tests for rust and cargo, merges (most of) the
> > include files into the base recipes and fixes target cargo builds.
> >
> > Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
> > of packagegroup-core-sdk.
> >
> > Changes in v4:
> > - Fixup `__stack_chk_fail_local` in musl-x86
> > - Add crossbeam atomics fixes for ppc/mips
> >
> > Changes in v3:
> > - Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
> >   (which defaults to SDK_TOOLCHAIN_LANGS)
> >
> > Changes in v2:
> > - Drop rust.inc/rust.bb merge, not actually made use of in the change
> >   set
> > - Reorder so cargo test goes after build fixes
> >
> > Alex Kiernan (11):
> >   rust-llvm: Merge .inc into .bb
> >   rust-llvm: Update LLVM_VERSION to match embedded version
> >   packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
> >   packagegroup-core-sdk: Add SDK toolchain language selection support
> >   cargo: Merge .inc into .bb
> >   cargo: Extend DEBUG_PREFIX_MAP to cover vendor
> >   rust: Merge .inc into .bb
> >   rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source
> >   cargo: Override crossbeam-utils with 0.8.14
> >   packagegroup-rust-sdk-target: Add cargo
> >   oeqa/runtime/rust: Add cargo test
>
> Looks much better thanks. There was one remaining issue which showed up
> in testing with a reproducibility issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2119/steps/12/logs/stdio
>
> We did already have an open bug for a rust reproducibility issue and we
> excluded it from the tests until we could get to the bottom of it, I
> suspect cargo may have the same issue. It frustrates me a bit as it is
> the one reproducibility exclusion for core.
>
> Ideally we would fix it but excluding it from the tests and noting it
> in the bug may be an option if it is the same issue. It may be simpler
> to reproduce and fix the issue with cargo too.
>
> Cc: Sundeep who as been looking at it.
>

Just reading the ticket and the upstream ones... the upstream ticket
is closed as remap path fixes it (which it looks like it does to me),
there are build paths embedded in the build directory which don't get
caught by that, but they're in thing like bootstrap which isn't
packaged (which may or may not be an issue, but I'm suspecting not);
it kinda feels like we're missing something.

Can I get hold of the cargo packages generated here to have a poke at them?

-- 
Alex Kiernan


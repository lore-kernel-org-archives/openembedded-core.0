Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3026EECAAA3
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 23:24:52 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.31006.1661469885494861270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 16:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XUJaXpDw;
 spf=pass (domain: gmail.com, ip: 209.85.128.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-33dc345ad78so68084047b3.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 16:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=owJ9oD43zi2NYydEOFQ9wry75jSODTpuLoMWYe2VXUc=;
        b=XUJaXpDwjNdrMs4xR3BJAQyTNZYgYMIf/O1FC40kXlKylRILfddlYEyFsGCutX7dU6
         gHyuxX8ZOKJDOWsEpEUSweDU5Gnbfx3KQbDNkqzcLFU/sk3HWJpbOlSkDGsjb4qkanQY
         bhohF0VHX/pvbAfCuhGC4q/yqA54xXFw1oFkIzcOJjhuA15TZ/T51/XqL8lRnHgQyYjX
         Ld7yzx+6l4pfVvw++U6PNaID/doAnh5v92JJZpKkLqp+qMPwhkPSZ1y05hl9opv8lyKG
         9Ejvdfrp6NKb89nKoHwwusNbUHVEH3bO9HiRnF3d3J04y61yOmTQWcMB7GGAqO/1fxin
         IqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=owJ9oD43zi2NYydEOFQ9wry75jSODTpuLoMWYe2VXUc=;
        b=I2hoJl9bTzNR2S0YR/ftxJJmEy+hJkfJq0Mw0ilZYoAO5A9UWtxCAEWb4SPccD0ex2
         ECiI+Ca9ZcT8Bipj0A+kwre8IJE3IfeZS71MpcUc1HhZiBCrNlrKH2mGL2XouoAvQA0v
         8WGjBEbfWzLllvTTsLq8p6K9lsplxhjGeAZ/i1aelllXP9wnmPWxut+sz0qTBl0DyHA0
         tYRpHIzpEc0/b/XpjrHgfnrwbh4HtOZETWk3VwjaTY7iDKalZH/vlzybrWs/lDryZW3r
         VM3aRByT7M9Krc75Jdhv2XOeIRtymYE5R7VTVwYGhIxVX0sE94COsD8OVCH91+8hjHID
         urbg==
X-Gm-Message-State: ACgBeo09Bgz2Ksc1AuOZQOEcIb1OZd1rp9x3DYVukTiyGTXpvNw/B8XC
	ZfMEIE0yBfpDt2898SiiYS6EiTzmGgBYrnmgpok=
X-Google-Smtp-Source: 
 AA6agR4uMYDwPj0MeVmKgUUBNsrREceO836yRSe23KtIRjEaW56vp9oqtq9m8XbxYQmBHzq2Rtx/7uDtRg8NrxWdO80=
X-Received: by 2002:a81:b61c:0:b0:333:9118:4020 with SMTP id
 u28-20020a81b61c000000b0033391184020mr5826383ywh.282.1661469884627; Thu, 25
 Aug 2022 16:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
 <CANNYZj_7Eroqgrf0bJr9ubDWEogOekWm3gYMUxUEO6ERrzBS4g@mail.gmail.com>
 <6eac7847f432cc60d66c9afba010308818bbbb46.camel@linuxfoundation.org>
 <CANNYZj91fDezS+i1tdX7zZ1B6M_roVgn3wh5gHyNzkj=rn-BFw@mail.gmail.com>
 <0e3c6ff17930e446338e75dc4bf6f6d4bf53c166.camel@linuxfoundation.org>
 <9b77dad2-3e98-02db-d248-822bc8b3e138@windriver.com>
In-Reply-To: <9b77dad2-3e98-02db-d248-822bc8b3e138@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2022 16:24:18 -0700
Message-ID: 
 <CAMKF1soOjRBF9yPrNQrjHDzn+HYS4TDvnyzoqTX8viK0_yXMQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] rust: Fix crossbeam-utils for arches
 without atomics
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 23:24:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169897

On Thu, Aug 25, 2022 at 12:11 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-08-25 07:53, Richard Purdie wrote:
> > On Thu, 2022-08-25 at 13:04 +0200, Alexander Kanavin wrote:
> >> On Thu, 25 Aug 2022 at 12:59, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >>> The usptreamable version of the patch would probably be something which
> >>> splits the target names in no_atomics up into components and matched on
> >>> subsections of it rather than the whole string. My rust isn't really up
> >>> to doing that though.
> >>>
> >>> I didn't really want us to maintain a separate list of targets which
> >>> have atomics issues given it and the list in no_atomics would get out
> >>> of sync very easily too.
> >> But then the same patch needs to be applied to (and maintained
> >> separately in) librsvg - and everything else that includes a copy of
> >> crossbeam. Perhaps it's worth to at least make the above suggestion
> >> about making it upstreamable in the patch commit message?
> > Yes, I can improve the patch header. I do understand the patch isn't
> > ideal.
> >
> > The alternatives are:
> >
> > * we take my patch
> > * we break powerpc, mips, armv5, riscv32 and others
> > * we drop the rust upgrades (the latent problem still exists)
> > * we rewrite the patch
> >
> > For me to rewrite the patch, I'll need to learn more rust. I'm sure I
> > can do that but it will take time and that time is time I can't use for
> > other things.
> >
> > I'm hoping that by explaining the issue and documenting it, *someone*
> > would step up and work out the upstreamable patch. This hasn't worked
> > well for the rust recipes so far as I've had to do a lot of work to get
> > them more into shape. I'm hoping the problem was just the shear scale
> > and now issues are in easier smaller pieces others can/will help. It
> > will certainly be time before someone else can schedule that in, we
> > don't have anyone who can do it now.
>
> Yes, with the range of things I have had going on, re-writing the
> rust classes/recipes was too big a task to consider. However, I can
> and will work to get this patch into a form that is upstreamable.
>
> I've created a bug to track that:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14904
>
> and at least started to look at some of the code!
>


Also opening an issue upstream at
https://github.com/crossbeam-rs/crossbeam

would be a good thing. crossbeam is vendored by many rust packages and
we will end up spewing
the all such recipes with the tweak in addition to regenerating the
checksums in toml files with every
upgrade.

> ../Randy
>
>
> >
> > I will say that I'm really really tired.
> >
> > I have a ton of autobuilder failures and in order to resolve them I'm
> > rewriting patches many times over, first to get them to work, then
> > taking review feedback and people complaining they're not perfect or
> > don't fix other issues. I have a pile of other problems like this.
> >
> > I appreciate the desire not to have patches, particularly when they're
> > as painful as the rust ones are. I appreciate the patch can be improved
> > and should go upstream. I was hoping to take some time off tomorrow but
> > it looks like I have other things to do (in reality probably on the
> > weekend, I need to rework the llvm patches too and both sets take hours
> > in rebuild time even to test).
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169885): https://lists.openembedded.org/g/openembedded-core/message/169885
> Mute This Topic: https://lists.openembedded.org/mt/93245408/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2523C3DA71
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 22:00:51 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.346.1673992848070277769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 14:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AUEwARq2;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id d30so44156938lfv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r/m9j9696jt7wo2z/J5Ewzz0qwfrHzWhJGSnK33jIK0=;
        b=AUEwARq2MaQSN882+Noy5u9Xq6BLspnaf3u9bX4lUe+FbufcnhiejwJxrNrBhADyII
         q30kNNOgxrDJh+yShcO5o10qdGkslcxr7ZpRMoQ7sy36nN6mHBRwMVv2rYGNqnIZTTjX
         S7+Jygf+wryAzehh3EmTyst6/d49K5ursqxE7qMiEusdhFa3w/hjHDiauIl5NQWGgjJU
         rTvUDD+XxZJolc3zLFvrqhci/pPFvE8MU1uGuDJlJYCBuSJ0OfZe7w04QUO+QoHjvLRk
         ZWGSivBYe6ys2jus6Y8QJiLH4Mu4JeMafthsb2fEEa5BNNfm2BbBMbMv8hxQu/aH7+KD
         rnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/m9j9696jt7wo2z/J5Ewzz0qwfrHzWhJGSnK33jIK0=;
        b=mAVqHSFOPvAefhFZUQ55cxHKWmVGa9uZCckBs9wb5wrVFx17Dt96f+ryGzAQnHWWt+
         NgdZxBs81goOh/wV8M+EHdofjuxWHwMsNWkqx2S6mB+rwkdXz+64oudXCNaG/6E1Ma0N
         IZrt7ai0yX2e4ExWrQOUb1zS9HVMGGuIAacAg9K9O/9PHeSZFFUZdCHUMmr7fyt+LKIJ
         LEoJYD872wtUh1vvc065BYCrKyaX2oPxZDooQDn57fN2JRiuK2fpYGylayQYfupHFdFk
         Pg01h72N5YSLazHKLaLmAq4HbRiwbl4ENKMc+sMHxZIx0YQ5S+MRJhp8Gu5RAxUj3c9X
         9IdQ==
X-Gm-Message-State: AFqh2krl6hMm3YRiekma3RpfyItvmrymyt7zrst2zttEEvlaSGI7PP1D
	xHTOZ74JnABHbj+iHtnuQaoy8Sj/4JkHXehUukU=
X-Google-Smtp-Source: AMrXdXvQfiggKEgnf5qVJ8wPVKp8aCRSNO/NNiEU4XqS7oArL9VHMNUyACdTWy7CZhfYqCES4mI3zJDNVGbmzUo3i/c=
X-Received: by 2002:a05:6512:b23:b0:4d5:835c:d9d2 with SMTP id
 w35-20020a0565120b2300b004d5835cd9d2mr181348lfu.263.1673992846067; Tue, 17
 Jan 2023 14:00:46 -0800 (PST)
MIME-Version: 1.0
References: <17490.1673869297796319682@lists.openembedded.org>
 <17490.1673882452401971192@lists.openembedded.org> <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
 <41add1d8b8a0f94c13e6599bd4c400dee7c611d1.camel@linuxfoundation.org> <49909f0e-9fc9-cb74-66f4-e6feec95f8d0@windriver.com>
In-Reply-To: <49909f0e-9fc9-cb74-66f4-e6feec95f8d0@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Jan 2023 23:00:34 +0100
Message-ID: <CANNYZj_UxfHNdOyT0t1S=gov7DXDVnNdCOQ4i8-cXfK9VGw0GQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, sundeep.kokkonda@windriver.com, 
	openembedded-core@lists.openembedded.org, 
	"steve@sakoman.com" <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 22:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176064

Option 1 looks like a new policy too. If we can upgrade rust across
many major versions in a stable release, then why not other items?

Alex

On Tue, 17 Jan 2023 at 22:57, Randy MacLeod <randy.macleod@windriver.com> wrote:
>
> On 2023-01-17 16:54, Richard Purdie wrote:
> > On Tue, 2023-01-17 at 15:29 -0500, Randy MacLeod wrote:
> >> On 2023-01-16 10:20, Kokkonda, Sundeep via lists.openembedded.org
> >> wrote:
> >>
> >>>   Rust community said the security fixes are only for the current
> >>> stable relases.
> >>>
> >>> https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older
> >>> -releases/18152/3?u=sundeep-kokkonda
> >>>   For old release we've to backport the patches ourselves.
> >> The other alternatives are
> >> 1. upgrade to 1.66.1 on older branches,
> >> 2. add 1.66.1, which will be the PREFERRED_VERSION but keep the older
> >> version for those who are risk averse,
> >> 3. add a mix-in layer (1) with the upgrade to 1.66.1.
> >>   For langdale, we'd update from 1.63 and for kirkstone, we'd update
> >> from 1.59
> >> See the link above for a discussion about what Fedora/RHEL and other
> >> distros are doing
> >>   and a description of the rust / crates.io test system known as
> >> crater that builds the
> >>   world for any significant rust change.
> >>
> >> Is there any objection to doing 2 and if we don't see any problems
> >> after some time,
> >>   then removing the older version?
> >> Sundeep,
> >> If no one object, please update kirkstone and see if librsvg or
> >> python-cryptography or
> >>   anything else encounters a problem.
> >
> > I'm afraid I don't like option 2. We don't do this for anything else so
> > we're now inventing some new policy. Either the upgrade is what we
> > decide is right or it isn't, I don't really like the idea of hedging
> > our bets and providing two versions, one of which nobody will use until
> > they're forced. It will also make security scans tricky as is the issue
> > dealt with or not?
> >
> > Just for context, going back in time OE used to be awash with many
> > version of recipes and I'm reluctant to go back there as it was
> > horrible. They were added for exactly this kind of reasoning, which at
> > first seemed like a good idea.
>
> Okay, make sense, option 1 it is!
>
> ../Randy
> >
> > Cheers,
> >
> > Richard
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
> View/Reply Online (#176063): https://lists.openembedded.org/g/openembedded-core/message/176063
> Mute This Topic: https://lists.openembedded.org/mt/96218038/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4937C38142
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 22:37:39 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.1298.1673995055259022542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 14:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=AM4Bky8G;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id mp20so32349681ejc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RY6vZW8+lXcnmE+weNKXAHQqkLiWcHmnVR3mqHDqk0Q=;
        b=AM4Bky8GCsbl0q07Qv6oluKke6/6AjSHzTm5DQmh/E+a3TCMZ2WkLBVNe8sQc+ODJE
         rS2oqVsn3bYHc1suNhldGKUmveNbcDL0Ggn0h1z3DuN0pFcwRl9yRygi3C+HFIe5WKtp
         9ry9cmQRej5R4Wo0qgrK1O1/k0GZXzJVXd3Gx0eZQbpFuRjEalqzIX7Vb01tefl8uA4J
         z4+6Ry8uY1nSSEoLuA0VRD3u50QkXl0xtOFep6ZRcL9CN7W84cgaXupMQT6DCvJaQiKQ
         +E9wT0vnB612BgQmCTjBWCDvk06IhDvfKkTfsrUXTiSKBPd/QorE4h0mYPgl71sPHK+F
         KW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RY6vZW8+lXcnmE+weNKXAHQqkLiWcHmnVR3mqHDqk0Q=;
        b=xbMlMw2t+rl/ZJJOcxfEV/ecJoIcLqPFxmfPJNCT7maSOXDmRM2chAEm/3iJYozwg5
         acbqG2SPONLFfVr4gdOzCxhMTt6/CoKAfT+4S0tGsyOo8U5zqwSUpSf5afHPcxxT4I26
         05eaam34OWGGHbzogv30/01zx5tQDzG1GqDVQ8VtDTpRITR/Msd4OnrW4VGggsD308Ca
         dGwFRFuoBW6n0OMONY/t9y61CV3Y19DUnOUzZZ3Km1Z9PahXdV+1WZeAy/XnHAkDVrqU
         U4dUg0u8GVjyYEhQIlShWmOcZxhzvTfDk/Zv6/orQjdnS0wrz05jbdQtHfOsPTP1m4eN
         /zsg==
X-Gm-Message-State: AFqh2kpmtkpuQ9LOthMr86OCksbJfVCZap0Grzd0DEGXggl16JzUhSXO
	Qq98tTMkHk5eKF/ja6p+XrpH/WrqICV2zsonlT99uw==
X-Google-Smtp-Source: AMrXdXvQclkYR1kFEKXM8KI1Znc5T3wyiKE/6neJ8K832mWXKAVVFkJiIb+q6S0+zNELMKNl976ryNpZfqnQrW3OnK4=
X-Received: by 2002:a17:906:4308:b0:865:d677:1f6c with SMTP id
 j8-20020a170906430800b00865d6771f6cmr525535ejm.584.1673995053400; Tue, 17 Jan
 2023 14:37:33 -0800 (PST)
MIME-Version: 1.0
References: <17490.1673869297796319682@lists.openembedded.org>
 <17490.1673882452401971192@lists.openembedded.org> <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
 <41add1d8b8a0f94c13e6599bd4c400dee7c611d1.camel@linuxfoundation.org>
 <49909f0e-9fc9-cb74-66f4-e6feec95f8d0@windriver.com> <CANNYZj_UxfHNdOyT0t1S=gov7DXDVnNdCOQ4i8-cXfK9VGw0GQ@mail.gmail.com>
In-Reply-To: <CANNYZj_UxfHNdOyT0t1S=gov7DXDVnNdCOQ4i8-cXfK9VGw0GQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 17 Jan 2023 12:37:22 -1000
Message-ID: <CAOSpxda3VsmobDFyVCmNH6cqGd+MZahO=g=yf_6XNY0sJAwcLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, sundeep.kokkonda@windriver.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 22:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176065

On Tue, Jan 17, 2023 at 12:00 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Option 1 looks like a new policy too. If we can upgrade rust across
> many major versions in a stable release, then why not other items?

According to the stable release "rules" option 1 would require an
exception granted by the TSC.  Otherwise it is a no go.

So it seems to me that this is a classic case for using a mix-in layer.

Steve

> On Tue, 17 Jan 2023 at 22:57, Randy MacLeod <randy.macleod@windriver.com> wrote:
> >
> > On 2023-01-17 16:54, Richard Purdie wrote:
> > > On Tue, 2023-01-17 at 15:29 -0500, Randy MacLeod wrote:
> > >> On 2023-01-16 10:20, Kokkonda, Sundeep via lists.openembedded.org
> > >> wrote:
> > >>
> > >>>   Rust community said the security fixes are only for the current
> > >>> stable relases.
> > >>>
> > >>> https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older
> > >>> -releases/18152/3?u=sundeep-kokkonda
> > >>>   For old release we've to backport the patches ourselves.
> > >> The other alternatives are
> > >> 1. upgrade to 1.66.1 on older branches,
> > >> 2. add 1.66.1, which will be the PREFERRED_VERSION but keep the older
> > >> version for those who are risk averse,
> > >> 3. add a mix-in layer (1) with the upgrade to 1.66.1.
> > >>   For langdale, we'd update from 1.63 and for kirkstone, we'd update
> > >> from 1.59
> > >> See the link above for a discussion about what Fedora/RHEL and other
> > >> distros are doing
> > >>   and a description of the rust / crates.io test system known as
> > >> crater that builds the
> > >>   world for any significant rust change.
> > >>
> > >> Is there any objection to doing 2 and if we don't see any problems
> > >> after some time,
> > >>   then removing the older version?
> > >> Sundeep,
> > >> If no one object, please update kirkstone and see if librsvg or
> > >> python-cryptography or
> > >>   anything else encounters a problem.
> > >
> > > I'm afraid I don't like option 2. We don't do this for anything else so
> > > we're now inventing some new policy. Either the upgrade is what we
> > > decide is right or it isn't, I don't really like the idea of hedging
> > > our bets and providing two versions, one of which nobody will use until
> > > they're forced. It will also make security scans tricky as is the issue
> > > dealt with or not?
> > >
> > > Just for context, going back in time OE used to be awash with many
> > > version of recipes and I'm reluctant to go back there as it was
> > > horrible. They were added for exactly this kind of reasoning, which at
> > > first seemed like a good idea.
> >
> > Okay, make sense, option 1 it is!
> >
> > ../Randy
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#176063): https://lists.openembedded.org/g/openembedded-core/message/176063
> > Mute This Topic: https://lists.openembedded.org/mt/96218038/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >


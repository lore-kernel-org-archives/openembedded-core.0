Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09986C004D4
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 10:12:23 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.11792.1674036740864298992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 02:12:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p6ESyBPY;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id i17so11954531ila.9
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 02:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aslPjpfx+IEgzPfvkbnBMfYAd5Mo7fd280YrCdMHHWU=;
        b=p6ESyBPY+ffE40AISXMp9+elArpd8yPwP/LXEYJKLRpp4QgR9HZKeVmhEfxMOwybw7
         hdiMnvzv1FhPF4V1+dGJljV9Ryps9w+eYHB7aMDEljzY5RtUUwLFKVPU2YBd0UAJFJK3
         njJndN4VPK6JviM19qQuyB8JPZDxv2pJrapVHH4lSqG3xQJ2RwK0oacjLKVNJQJUyTFB
         irijYTw9H7HpVm74H26WLQpzjxCK0ZWe16QGbo3b1qCLp/AQvtF3qSCWAberQnr9Dgip
         dENWFESz33dsm4saarUNa1evzOmUqBAEm49+jJypSIaz+aPnLtFkp1mz9c3MOVrr1qi8
         05sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aslPjpfx+IEgzPfvkbnBMfYAd5Mo7fd280YrCdMHHWU=;
        b=MaVo906uViVffYr9FXeB4BawW+JMfYxgA+01CxkJ/bnW9UKUL4G3zMhml+LbkXWmdT
         9mlxZMg4D8c6tAZEMYDcRRfMq2/VdFVKdXQk0bOn2VnjQS27buuXaWd7N751qH90nY0T
         m+5tWTwy/rpExl6ZdL/ZdFhvJ91WpMLJSarlJRB6rVMEFerjfweH76XkeXrPw4+Vf/WB
         /cdlbyIUFLZA3F63EkjpWDaEJ3uPX1C7PQk2GQcvwv15P8ee1WlAI5Nx1mG1aR0b0xCn
         6rtEH3DctqCAUINj1JVRsCw58K54Ko9SjZiNydKv+DsvPvGLu0MqxKyPh/4hXTXbqYgx
         fGvQ==
X-Gm-Message-State: AFqh2kpJcEYNojxvcXBggB3E6rFiYqa1rA2t4lRaPOwdUkEKL9E+rZ7Q
	MfCSKnoUHbL6czc/U1ZwG2kUvo7ozcAEvPzrJow=
X-Google-Smtp-Source: AMrXdXsTB9symjSk0hqg9KJaMq7FO9rYi4q1lBy3LgoDw9cMK2Z28n1j4dE1Uo91+dWtU2piJ+pbJBT935fTTVMOJmw=
X-Received: by 2002:a92:c530:0:b0:30d:7b65:7559 with SMTP id
 m16-20020a92c530000000b0030d7b657559mr403600ili.157.1674036740215; Wed, 18
 Jan 2023 02:12:20 -0800 (PST)
MIME-Version: 1.0
References: <17490.1673869297796319682@lists.openembedded.org>
 <17490.1673882452401971192@lists.openembedded.org> <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
 <41add1d8b8a0f94c13e6599bd4c400dee7c611d1.camel@linuxfoundation.org>
 <49909f0e-9fc9-cb74-66f4-e6feec95f8d0@windriver.com> <CANNYZj_UxfHNdOyT0t1S=gov7DXDVnNdCOQ4i8-cXfK9VGw0GQ@mail.gmail.com>
 <CAOSpxda3VsmobDFyVCmNH6cqGd+MZahO=g=yf_6XNY0sJAwcLg@mail.gmail.com>
 <765d5133-42eb-2ef6-7ba0-b5556a7a1d1b@windriver.com> <CANNYZj8-Y62NRXg9Z+Lbju8ZVcpamE8408B6veYDKG_r-YK3Gw@mail.gmail.com>
 <Y8epA6iPn+do73vB@nuoska>
In-Reply-To: <Y8epA6iPn+do73vB@nuoska>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 18 Jan 2023 10:12:08 +0000
Message-ID: <CAO5Uq5T_VZL+VXx=YoHn9u3rFE6fSXKKUgS5J8CQTfasNjYTHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>, 
	Steve Sakoman <steve@sakoman.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 10:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176084

On Wed, Jan 18, 2023 at 8:08 AM Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Hi,
>
> On Wed, Jan 18, 2023 at 08:45:56AM +0100, Alexander Kanavin wrote:
> > On Wed, 18 Jan 2023 at 03:08, Randy MacLeod <randy.macleod@windriver.com> wrote:
> > > So far, there haven't been many Rust/Cargo CVEs so maybe we're making
> > > too big a deal out of this. I certainly don't miss the deluge of memory management CVEs that
> > > C/C++ applications suffer from!
> >
> > For what it's worth I'm with you here, and I actually have an even
> > more radical view (that may offend some - apologies). I think this
> > whole 'CVE backporting' business is both enormously wasteful and never
> > complete (or even close to it). Backporting CVEs and the stable
> > release policy is basically a cover-up for bad (or altogether absent)
> > CI at the project users side. If you upgrade a component, and it
> > causes trouble, the trouble should be caught by pipeline, and not in
> > the end product when the update has shipped.
>
> It's usually not lack of CI, continuous integration, but lack of testing
> coverage which is visible as risk management where any changes are
> avoided and someties FUD replaces hard facts. A CI run may not show that
> SW compatibility or some use cases are broken.

We've been running with rust in production for a couple of years, I
think we hit our first instance of an upgrade issue last week - a ureq
crate upgrade changed something (I suspect in its pooling code) which
meant that we ended up using all file descriptors. Wasn't caught in CI
as nothing ran for long enough, but was caught in test (we still need
to get to the root cause - right now we just rolled back that crate).

But over that time we've aggressively upgraded rust from something
like 1.48 to 1.66.1, all the crates we build against and to the best
of my knowledge this is the first time we've been tripped up.

> > The saner policy would have been 'a Yocto stable release contains
> > component versions all within their support windows by respective
> > upstreams'. If the only supported version is the latest one, then so
> > be it.
>
> When mainting yocto SW stack for a long time, I made the distinction
> between development tools and target SW. Basically all -native and
> nativesdk- recipes and those target recipes which are not in the product
> by default are development tools.
>
> Development tools can be updated to new versions to fix severe bugs and
> CVEs. For target SW, this can be done if ABI compatibility is preserved,
> or in case of severe issues where ABI is part of the problem or
> backporting the fix is more risky than an update, but this requires a
> managed transition with the product platform where all users of the SW
> are checked. ABI compatibility is important because frequently real
> products often need to integrate binaries where source code is not available
> to the bitbake build.
>
> With this approach, I've updated tools and compiler versions. I would
> not mind similar policy in upstream. Maintaining multiple rust/cargo
> versions well is not likely going to happen so I'd accept this and
> accept same updates in all branches.
>
> If the same tool version works well and is tested in another yocto
> branch and there are no major issues porting the same changes to another
> LTS branch, this gives confidence that the update is ok.
>

For vendor reasons, we're stuck on thud (I know...), however we've a
pile of backports so we can mostly just pick current recipes out of
master or stable branches (python packages are the one which we're
coming up against now as a blocker - fortunately we've expunged python
from our target code base).

My view for a very long time has been that you basically have to stay
very close to the most current release of whatever upstream code
you're consuming, otherwise you're doomed to spending more and more of
your life finding/fixing issues (security or otherwise) which were
long since addressed upstream.

-- 
Alex Kiernan


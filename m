Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F16C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 21:27:58 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.3189.1638394076836314288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 13:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fvc9kvAx;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id g14so107458755edb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hje953oa6+YfbRZqZ5ZRuye8BEatmdJNO5fTdcZWE8Y=;
        b=Fvc9kvAxiA86sny12CjFecZWwVGN0+mcvv1eM4e/LLeDw7yv3o8p0NjJk1pv2y2R97
         a3Y6UrqCr9xYhGrDKK7NVziqYKvthnSsU9B/iXFo05GfxEEG7QZeO9N6AboVuM2K6BSn
         xh0cDKJeGbWs94MSzsUNaV79qhBaDtQYdzvDBffOaY9XhSuyHKsAuQBcWpfywDFXR+zA
         g+VAI5lXsYAdIHhFuu8hFn8NpbwSFgA/w2OQaGVjTVEc23QDSuzng7VmTkuGQsJO7bwt
         5qTh1SIZYUNvEfKnm3K0wDbmJ+HC11Z4fYg3c/Odb/R1m3/vVejhfPipScacwr386Ra+
         GAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hje953oa6+YfbRZqZ5ZRuye8BEatmdJNO5fTdcZWE8Y=;
        b=dqbMMDhfk/L+vlLzX6ecVY+4pYqGMbUPvvgpwoMpl4NOLodrE5+0N9lwl7VWhOUb1/
         ZjoG6k3NlzRqgFBkn84slQDyVAMQ4vD2O3ZNFPDmnVzwwKaEk5K1e/NiHQBSHvExvZBJ
         HM6Y1VEfRbkdlYiYHhEMNIfPq0MDRW1qogxvEp3RQxGkMYfAYBV7/vol9eYKzhpT8owT
         GAFFGTAi2a8iYxcwr4JoHp+K1ZtOw/L79vii6grql/fDMAsm7G6inbpe6jYdurmIfJRV
         YZjlXD+e+IYzPu5QLkuRZ2mijKdwJf528qEeM4jziZUxyJ2gFZSIs2DFUyvdbjHUi8M2
         xDoQ==
X-Gm-Message-State: AOAM532FIfkhEV3Qr0bS7S+4OCQxaSN3s2MO8bVuL9zPCqBejzw2rq8x
	f66sp5P20s+bQ3c3GE3qLeNld1SxSZtgPywZDMI=
X-Google-Smtp-Source: 
 ABdhPJwsHYI4Nw8L2ovGTJ6e1YJqT4k6nUFj0UtdP/rPemGk2txpwtlENNS/0OVX2dR+3B3XoCQ3NzWFIH9avFhldnE=
X-Received: by 2002:a17:906:5951:: with SMTP id
 g17mr10254155ejr.315.1638394075107;
 Wed, 01 Dec 2021 13:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20211201043934.3212357-1-kexin.hao@windriver.com>
 <f2c3aa7c59a874f99b80d49bde596e93664a5392.camel@linuxfoundation.org>
In-Reply-To: 
 <f2c3aa7c59a874f99b80d49bde596e93664a5392.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 1 Dec 2021 16:27:44 -0500
Message-ID: 
 <CADkTA4N_zXDJVH8hwZMVqa+tsHvrm4zD+UDKiYV4qHwu4WPx3g@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto-dev: Make -dev kernel work for a fixed
 revision
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Kevin Hao <kexin.hao@windriver.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Linux Yocto <linux-yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 21:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159060

On Wed, Dec 1, 2021 at 6:28 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-12-01 at 12:39 +0800, Kevin Hao wrote:
> > By default the -dev kernel uses the "AUTOREV" to pull in the branch
> > head as the revision. Some of our BSPs are based on the -dev kernel and
> > we choose to nail down the kernel to a specific revision when releasing
> > our product by using some setting like below:
> >   PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
> >   SRCREV_machine:pn-linux-yocto-dev = "6fb48ae18a10770702266dd1f1aa500149e361ec"
> >   KBRANCH:pn-linux-yocto-dev = "standard/x86"
> >   LINUX_VERSION = "5.15"
> >
> > Since all the standard/* branches will be rebased after each kernel
> > version bump, we would get bitbake fetch failure due to that specific
> > commit is not reachable in the new version branch. This kind of issue
> > can be fixed by setting the "nobranch" parameter in the SRC_URI because
> > it will cause the fetcher to skip the SHA validation for the branch.
> > And this also won't cause other side effect because all the branches
> > will be created in the do_kernel_checkout() and the current branch will
> > be reset to the reversion we want in do_validate_branches().
> >
> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto-dev.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > index 6b6ea9a7e864..7204c3eddc11 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > @@ -19,7 +19,8 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.inc
> >  KBRANCH = "standard/base"
> >  KMETA = "kernel-meta"
> >
> > -SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
> > +# Set nobranch to skip the SHA validation for branch if a fixed revesion is used
> > +SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;nobranch=1 \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA}"
> >
> >  # Set default SRCREVs. Both the machine and meta SRCREVs are statically set
>
> I'm afraid this looks to be a bit of a horrible workaround/hack. It happens that
> if you specify a branch and set nobranch it might do what you want but that
> certainly isn't by design.
>
> Either the revision is in the branch or it isn't. The error is telling you the
> configuration you set isn't valid and you really need to set a valid
> configuration, i.e. a revision and a branch or a revision and set nobranch but
> not both.
>
> I'm not sure I understand why the kernel would be rebasing after each kernel
> release? Is this because it is one of the unversioned branches?

Yah, it is exactly that. The -dev kernel has always been a rebase
tree, like linux-next upstream.

Since the BSP work started against it (the -dev tree), when I move on
from a -dev version, I've been saving all work into versioned branches
... versus removing them (and storing the history in the
kernel-cache).

That being said, we merged some code some time ago that allows the
-dev kernel to automatically switch to the versioned branches, versus
the rebased "standard/*" branches. (that supports existing releases
with the -dev kernel as I move the one in master to new versions).
Have a look at do_validate_branches(), but unfortunately the fetcher
error will have already been thrown and we can't adjust to the fixed
SRCREV.

The issue here is the attempt to pin the revision (like Richard is
saying), since if you use AUTOREV the code I just mentioned code kicks
in to make sure a versioned branch is used. Nothing should be released
against -dev, so any issues with pinned SRCREVs and branches should be
transient.

I've floated the idea a few times that now that versioned branches are
being created (to keep older dev kernels around) I could just create
the branches from the start as versioned, and then you wouldn't have
the issue you are seeing, even with a pinned SRCREV. We are in a
middle state, since the structure of -dev has changed over time as
more use for it appeared (and it was also created when even the
linux-yocto branches were not versioned). But that isn't something
that I could do until the next -dev version and only part of the next
yocto release.

But for the short term, the fetcher error you are seeing should happen
once, and you could have a bbappend to adjust the KBRANCH accordingly,
or similar .. which shouldn't be much extra effort, as you mentioned
it was something in a release.  If you have somewhere that you are
setting the SRCREV, why not set the KBRANCH in the same place ?

Cheers,

Bruce

>
> I can fix the fetcher to hard error if both are set...
>
> Cheers,
>
> Richard
>
>
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


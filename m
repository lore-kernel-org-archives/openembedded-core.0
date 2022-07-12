Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9298C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 23:30:42 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.16060.1657668637269955851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 16:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DQ4Vc552;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id oy13so12131417ejb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 16:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5EmC3eohRG1JpPjgk0RkTvNp6z8XpkTqzQLRyOq5Hwg=;
        b=DQ4Vc552bwzp32LnXjgabWuhMKVtTN3UK8pw4eRSUnqVk7Vk8aMt/vfl3RvsJ1BnGq
         g+aome26y+XdQVFjeGFKBhrHRgAKgEENM/tioeSlHHj+Ctn3FJswvR2USqLvaNx/K3rv
         y/uwTgNdJoXVqRdCqYb+iRrkdOtLYCQtuJWAP7YB1EzDGKVVH4nxHTy+UJIuf6C4NaEq
         0Gda0HRUw9aa7ilXmDgJzeRLuShC1KieE5x/WgEMKoPhLgvZE0TT63IlaF3cS2YU6Vvk
         uEknnXyiUCYbpqdVGDWgPgWmx+L4ENJv+5ewCO4/kP5BR6SMvTj2Yam6FhLmhXiQQ3OQ
         XTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5EmC3eohRG1JpPjgk0RkTvNp6z8XpkTqzQLRyOq5Hwg=;
        b=uaZq2D5UNzygImp2XfrEVIacdE1Wq6ZYm0vmRLqpAGDeB/cP0M4Itx2FPc/IntZ8Ib
         l8yxhJwbrYnPELYBGc6qtrp/MBoEWpELLnp1H7mRhVhL0P0A0GayeVhsG6KAtyzRC7eg
         RyMtXLGGuz5tYakrii8GnCcjeQYL1Iym80Wy7DTvqCxm5YJBV71TXP2M2dNpVEadUdBu
         YFUd1PeCYFBH9ey4me6BC7PE5/Zu6fs7KwelQbZLZqALASGagcY4y/G6rL5istw5Vvea
         mtg1K7SeHFtlWR6OL/LhCWvuCD1I/RXWdfaGSEZXzrUF0JfjSMgATP0nN2R8RpQNtxe/
         4aDQ==
X-Gm-Message-State: AJIora8xEW//i1TmDpWPKpm1r9Rj6Ds84F3UENTwHejKHr8B9PWl9hSS
	tOtubl78mlFxdEMupUT5irgLV8SxeI2ttQRK1Rw=
X-Google-Smtp-Source: 
 AGRyM1vGPNjzB3SmY5C6b5XNZJkqqcxOvDavt8BwIP6gkhjUnBLcM50iIAe6j8xMINV52QixaGpe3Sx53mKKUWUg7c8=
X-Received: by 2002:a17:907:1c24:b0:72b:838f:cada with SMTP id
 nc36-20020a1709071c2400b0072b838fcadamr527970ejc.125.1657668635372; Tue, 12
 Jul 2022 16:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <ba078de5f59105d61daed5b8abc69cd1e15bc43e.camel@linuxfoundation.org>
 <CAMw=ZnRwkp6nkZzqw69Xc83xDp0QRCZ+MNwHx=QiTdmncZ5L3A@mail.gmail.com>
 <d4dd373c6d1718f6fd417c8484a057268df6d495.camel@linuxfoundation.org>
In-Reply-To: 
 <d4dd373c6d1718f6fd417c8484a057268df6d495.camel@linuxfoundation.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 13 Jul 2022 00:30:24 +0100
Message-ID: 
 <CAMw=ZnQxrxMS_B-5RYp+krab8s6yR+5ny_q1_ioaL=W-u68XdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 23:30:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167947

On Tue, 12 Jul 2022 at 22:55, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-07-12 at 18:16 +0100, Luca Boccassi wrote:
> > On Mon, 11 Jul 2022 at 23:06, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2022-07-11 at 21:29 +0100, Luca Bocassi wrote:
> > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > >
> > > > Support for unmerged-usr is deprecated upstream, taints the system and will be
> > > > removed in the near future.
> > > > Enforce building merged-usr images when using systemd.
> > > >
> > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > ---
> > > > We intend to deprecate unmerged-usr at some point, and we are doing the
> > > > rounds ensuring distros are moving along so that there are no surprises
> > > > when the time comes.
> > > >
> > > > See:
> > > > https://lists.freedesktop.org/archives/systemd-devel/2022-April/047673.html
> > > >
> > > >  meta/recipes-core/systemd/systemd.inc | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> > > > index b8dbe2263a..f9e109bba4 100644
> > > > --- a/meta/recipes-core/systemd/systemd.inc
> > > > +++ b/meta/recipes-core/systemd/systemd.inc
> > > > @@ -21,3 +21,8 @@ SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${S
> > > >  "
> > > >
> > > >  S = "${WORKDIR}/git"
> > > > +
> > > > +# unmerged-usr support is deprecated upstream, taints the system and will be
> > > > +# removed in the near future. Fail the build if it is not enabled.
> > > > +inherit features_check
> > > > +REQUIRED_DISTRO_FEATURES = "usrmerge"
> > >
> > > Given none of our systemd testing on the autobuilder is done under
> > > usrmerge and we've never mentioned this requirement to any of our
> > > userbase before, this is going to come as a bit of a surprise to
> > > people. The above change will break the autobuilder as things stand :(.
> >
> > Yes I was expecting there would be these kind of issues, the purpose
> > of sending this was mainly to find out about them.
> > So where are these configurations stored? How can we get them updated?
>
> The configuration is yocto-autobuilder-helper but the best place to
> start is probably the poky-altcfg distro config.
>
> Once we change that we'll have to run through the testing, see how much
> breaks and then find someone to try and fix any issues if/as needed.
> There is a lot of work just in pulling things together for testing and
> triaging the result and I'm depressed it will probably end up on my
> plate when I personally disagree with the decision.

We've been running this configuration internally for ~3 years in our
Yocto downstream, never seen any issue, not even at the beginning, it
just worked.
Nowadays most major distros have switched over, Gentoo's the other one
left but it's planned for this year.
Any issues in upstream softwares should have been fixed years ago when
Fedora started the process.
So hopefully it shouldn't be too bad?

> I was asked earlier today if we should just make the systemd include
> files force usrmerge on. The challenge is that OE/YP give users choice
> to configure their system how they wish, we don't just force
> configurations upon them. Or only real option is therefore to throw
> errors and have them decide what to do (which basically amounts to
> submitting to the upstream decision).
>
> > Also is a deprecation notification needed? How is it handled usually?
>
> Do we have time for such a notification or are we in the situation
> where we just throw errors to the user and let them agree to the
> usrmerge change? The timescale is unclear but if the systems are
> already throwing deprecation warnings at runtime, this isn't a good
> experience for our users.

It's not urgent. But the build-time warning has been in place for a
couple of years now, you should have already seen it.
The runtime is a taint flag in 'systemctl status', and was introduced
in the most recent release.
There is no timeline as of now for dropping legacy compat code and
configuration, as the runtime taint was just added.
Certainly won't be this year. I've been doing the rounds ensuring
everyone who hasn't switched already is aware with plenty of time to
spare.

> > Aside from process details, I assume there's no problem with doing the
> > change in principle?
>
> There is, but it appears a done deal which we just have to accept so
> I'm trying not to start a discussion which I don't think can go
> anywhere productive. If this isn't a done deal, then let me know as
> that would be different.

It is a done deal as far as we are concerned upstream, matter of
'when' not 'if'.

Kind regards,
Luca Boccassi


Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68433C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 18:10:50 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.122.1666203040137453965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 11:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WcUUh0OK;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 203so21796507ybc.10
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l8HLPgYktx3uOk3TAhclRLIDS/xK1gQVj6+OONm6Nho=;
        b=WcUUh0OKndn0DiBEX/N+LG0iotE0CjBpKyKBDPra4I3NmTIE4jqOc1mnn0u9Gtdgs+
         G3SK8+QWJKFSAavl7qq7N0NZx/dm6k50Dl6Irfyz9aRsHPIIwODjUWiWjRWuzG73C753
         HJNmiHOjW447kZZn9QcVpWmrddxuUmt0x1DLGdsHuHrAv6BPx4m7RTSizS6huZR+Huo4
         B+crI+iGKjPwTHwEkyWaPsHWG/D0ub5h6vTwBxqNKpdGeDrtslNNPmUJXQUYbE1SXDgt
         7Qo05yjFjotdzs1J25WMpUsT8DqRK4msQxFFyaFZuTrj9GTM78pY/0pUMKGmcqUNgP8+
         moNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8HLPgYktx3uOk3TAhclRLIDS/xK1gQVj6+OONm6Nho=;
        b=X3scVr4MbiK4wrZ34Iyq9o0JPe3PWiPCQgK8U8UoJW8W2doGUmf55JOHEcDpBgCcdG
         sMX+BIDxvJqBv+IJqfOHrOhxXHpjEnVWR2DV8SQWsXaVE5vvl8hGf9+GkkePX3UMxqCR
         vRRI4bbE3XP1RXEx6U78aImNgunjjSsHRdAbxiqki5dGiZ+Sg6IF/fbLWpAYhkiT8LlM
         f3KeAaG8RlxB8en9yXv/6UVxTOYr+LrosTZgE+QqplsXYJWINwhcGtiYszpPg6YPdAg6
         48F8JItVaNMvXJBAjqf5rHG0nDz0u7yhoU33qcjA6gq9Y7yOrCtpUAP6h+bQ4hWtENff
         8c9Q==
X-Gm-Message-State: ACrzQf2PZJTz9U43mQ0ppgHhJ3nO3bCuinDBJQMUeaxJg4XxDmXibhsv
	qR8kKKdqvPO52queNuWxcgLMgdwhLYd6Npg7+Zo=
X-Google-Smtp-Source: AMsMyM6pl8VBCSFum1yya+89LaBDW/iOYZkVUauyd07n4ikaL52h7Fx9UIFHjgX6s9itkD0f3Lzrbwa5NqYqqxuGoK0=
X-Received: by 2002:a25:1ed4:0:b0:6b4:7f09:c55b with SMTP id
 e203-20020a251ed4000000b006b47f09c55bmr8124809ybe.559.1666203039230; Wed, 19
 Oct 2022 11:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <ba078de5f59105d61daed5b8abc69cd1e15bc43e.camel@linuxfoundation.org>
 <CAMw=ZnRwkp6nkZzqw69Xc83xDp0QRCZ+MNwHx=QiTdmncZ5L3A@mail.gmail.com>
 <d4dd373c6d1718f6fd417c8484a057268df6d495.camel@linuxfoundation.org> <CAMw=ZnQxrxMS_B-5RYp+krab8s6yR+5ny_q1_ioaL=W-u68XdQ@mail.gmail.com>
In-Reply-To: <CAMw=ZnQxrxMS_B-5RYp+krab8s6yR+5ny_q1_ioaL=W-u68XdQ@mail.gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 19 Oct 2022 19:10:27 +0100
Message-ID: <CAMw=ZnRuTFn-x_RpbSe=d1TtXUEX7XMxXvLObQs-E4wN7muAzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to REQUIRED_DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Paul Eggleton <paul.eggleton@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 18:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171977

On Wed, 13 Jul 2022 at 00:30, Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Tue, 12 Jul 2022 at 22:55, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2022-07-12 at 18:16 +0100, Luca Boccassi wrote:
> > > On Mon, 11 Jul 2022 at 23:06, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Mon, 2022-07-11 at 21:29 +0100, Luca Bocassi wrote:
> > > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > >
> > > > > Support for unmerged-usr is deprecated upstream, taints the system and will be
> > > > > removed in the near future.
> > > > > Enforce building merged-usr images when using systemd.
> > > > >
> > > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > > ---
> > > > > We intend to deprecate unmerged-usr at some point, and we are doing the
> > > > > rounds ensuring distros are moving along so that there are no surprises
> > > > > when the time comes.
> > > > >
> > > > > See:
> > > > > https://lists.freedesktop.org/archives/systemd-devel/2022-April/047673.html
> > > > >
> > > > >  meta/recipes-core/systemd/systemd.inc | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> > > > > index b8dbe2263a..f9e109bba4 100644
> > > > > --- a/meta/recipes-core/systemd/systemd.inc
> > > > > +++ b/meta/recipes-core/systemd/systemd.inc
> > > > > @@ -21,3 +21,8 @@ SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${S
> > > > >  "
> > > > >
> > > > >  S = "${WORKDIR}/git"
> > > > > +
> > > > > +# unmerged-usr support is deprecated upstream, taints the system and will be
> > > > > +# removed in the near future. Fail the build if it is not enabled.
> > > > > +inherit features_check
> > > > > +REQUIRED_DISTRO_FEATURES = "usrmerge"
> > > >
> > > > Given none of our systemd testing on the autobuilder is done under
> > > > usrmerge and we've never mentioned this requirement to any of our
> > > > userbase before, this is going to come as a bit of a surprise to
> > > > people. The above change will break the autobuilder as things stand :(.
> > >
> > > Yes I was expecting there would be these kind of issues, the purpose
> > > of sending this was mainly to find out about them.
> > > So where are these configurations stored? How can we get them updated?
> >
> > The configuration is yocto-autobuilder-helper but the best place to
> > start is probably the poky-altcfg distro config.
> >
> > Once we change that we'll have to run through the testing, see how much
> > breaks and then find someone to try and fix any issues if/as needed.
> > There is a lot of work just in pulling things together for testing and
> > triaging the result and I'm depressed it will probably end up on my
> > plate when I personally disagree with the decision.
>
> We've been running this configuration internally for ~3 years in our
> Yocto downstream, never seen any issue, not even at the beginning, it
> just worked.
> Nowadays most major distros have switched over, Gentoo's the other one
> left but it's planned for this year.
> Any issues in upstream softwares should have been fixed years ago when
> Fedora started the process.
> So hopefully it shouldn't be too bad?
>
> > I was asked earlier today if we should just make the systemd include
> > files force usrmerge on. The challenge is that OE/YP give users choice
> > to configure their system how they wish, we don't just force
> > configurations upon them. Or only real option is therefore to throw
> > errors and have them decide what to do (which basically amounts to
> > submitting to the upstream decision).
> >
> > > Also is a deprecation notification needed? How is it handled usually?
> >
> > Do we have time for such a notification or are we in the situation
> > where we just throw errors to the user and let them agree to the
> > usrmerge change? The timescale is unclear but if the systems are
> > already throwing deprecation warnings at runtime, this isn't a good
> > experience for our users.
>
> It's not urgent. But the build-time warning has been in place for a
> couple of years now, you should have already seen it.
> The runtime is a taint flag in 'systemctl status', and was introduced
> in the most recent release.
> There is no timeline as of now for dropping legacy compat code and
> configuration, as the runtime taint was just added.
> Certainly won't be this year. I've been doing the rounds ensuring
> everyone who hasn't switched already is aware with plenty of time to
> spare.

FYI, we now have a tentative timeline: first release of H2 2023 will
drop support for split-usr and unmerged-usr:

https://github.com/systemd/systemd/blob/v252-rc2/NEWS#L14

Kind regards,
Luca Boccassi


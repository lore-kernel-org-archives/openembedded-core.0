Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1B4C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 15:52:27 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.23644.1657727541774331209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 08:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qblQ9rNA;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id r18so14637048edb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 08:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uZVO8CLJ2pm//SyLRO6YPaIQbl0sjzCRYWefOD5Xhms=;
        b=qblQ9rNANKj9AJDW/2+R+rAKrwpDKgLiVoSaJyXqytHpkp1pUl7ZnsVTJoOb9yY8Zi
         oa5ARZE9Hk6ojVaW8AWMrjRfHhVwebJAG5T5aXk/G2ulr8ikVQOhAJ87nihyLIBx45R1
         sJVpY08ZtTqLnWmJAkByc4Be4FilfbpW0o48ow7Z7Pn/INAJD5x44RT3iROB08kMlnok
         l2hnZq2aIvi1CKmT2CyzsIlzC0EEKgcvydlsvV59yHB4hqMH9/unq//uS0371updQMjj
         hRwYJhfVCSoHZbYIyyux1trfjoJ2l5wKj3YAyZje38l9j/hYx3Ik7QdSXeq4fvvoOOkL
         cKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uZVO8CLJ2pm//SyLRO6YPaIQbl0sjzCRYWefOD5Xhms=;
        b=7P11ZI1RoA2hbl4VXRuyq/DP5zA0ndD7T3FqrTS7bsdd1O266U1iwVYMIT2Xe3zdVk
         U2DcGG6/btLnPZRlRuneun6+D3lsqxPhJtUlEg+Kohb9q9NXE8hzvY3umukbsFVf3E70
         yg7jftzdBneirDKSefRbFHANRX5rJ0OEF25tH2v9oX+2Omt0Bt7zNtzbKSNi+ks0UdiF
         8gh1rgfpI2no3RU6OLdwqgDATMQDOfqfH7HeZvLXdXsBt/RwYXE8NzUBagdIIYkvKpGk
         MUSci+to+6dNTnicFt8jXxFmeG8RUsiarJz1kGzCaDzifeMhgIamVFv+6lOpzGeCuuAP
         4Eng==
X-Gm-Message-State: AJIora8f6q2MYa88P2nlvwVO6TrQB0XdXIgndWWR+tS+QZQFj5f4aM3p
	WKNwTIbF7kqfdYQALFbgI3PzsyjemrRCMrTa0Vg=
X-Google-Smtp-Source: 
 AGRyM1upWKgsfQwKFdqj6bJ4OzEWcQSjsB5azse+qT3uqbnUJJoP10oIj21lw1zZWZBeCwO8l0IPY9S47Kmy9t1s/wk=
X-Received: by 2002:a05:6402:695:b0:435:65f3:38c2 with SMTP id
 f21-20020a056402069500b0043565f338c2mr5964314edy.347.1657727540130; Wed, 13
 Jul 2022 08:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <ba078de5f59105d61daed5b8abc69cd1e15bc43e.camel@linuxfoundation.org>
 <CAMw=ZnRwkp6nkZzqw69Xc83xDp0QRCZ+MNwHx=QiTdmncZ5L3A@mail.gmail.com>
 <d4dd373c6d1718f6fd417c8484a057268df6d495.camel@linuxfoundation.org>
 <CAMw=ZnQxrxMS_B-5RYp+krab8s6yR+5ny_q1_ioaL=W-u68XdQ@mail.gmail.com>
 <9f596d5368294084433399218427fb0d14031fd1.camel@linuxfoundation.org>
In-Reply-To: 
 <9f596d5368294084433399218427fb0d14031fd1.camel@linuxfoundation.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 13 Jul 2022 16:52:08 +0100
Message-ID: 
 <CAMw=ZnQ6htXa4+_dbZK5aL+e8k+SX0L8zddJJ2cOVZAs4oWaDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 15:52:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167961

On Wed, 13 Jul 2022 at 14:19, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-07-13 at 00:30 +0100, Luca Boccassi wrote:
> > On Tue, 12 Jul 2022 at 22:55, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > The configuration is yocto-autobuilder-helper but the best place to
> > > start is probably the poky-altcfg distro config.
> > >
> > > Once we change that we'll have to run through the testing, see how much
> > > breaks and then find someone to try and fix any issues if/as needed.
> > > There is a lot of work just in pulling things together for testing and
> > > triaging the result and I'm depressed it will probably end up on my
> > > plate when I personally disagree with the decision.
> >
> > We've been running this configuration internally for ~3 years in our
> > Yocto downstream, never seen any issue, not even at the beginning, it
> > just worked.
> > Nowadays most major distros have switched over, Gentoo's the other one
> > left but it's planned for this year.
> > Any issues in upstream softwares should have been fixed years ago when
> > Fedora started the process.
> > So hopefully it shouldn't be too bad?
>
> My worry is the QA framework and tests likely haven't been used with
> it. It may be fine or it may not. I do know how much of my time this
> stuff takes up with other issues.

I have sent v2 with the poky-altcfg configuration change.

> > > I was asked earlier today if we should just make the systemd include
> > > files force usrmerge on. The challenge is that OE/YP give users choice
> > > to configure their system how they wish, we don't just force
> > > configurations upon them. Or only real option is therefore to throw
> > > errors and have them decide what to do (which basically amounts to
> > > submitting to the upstream decision).
> > >
> > > > Also is a deprecation notification needed? How is it handled usually?
> > >
> > > Do we have time for such a notification or are we in the situation
> > > where we just throw errors to the user and let them agree to the
> > > usrmerge change? The timescale is unclear but if the systems are
> > > already throwing deprecation warnings at runtime, this isn't a good
> > > experience for our users.
> >
> > It's not urgent. But the build-time warning has been in place for a
> > couple of years now, you should have already seen it.
>
> I haven't :(.
>
> > The runtime is a taint flag in 'systemctl status', and was introduced
> > in the most recent release.
> > There is no timeline as of now for dropping legacy compat code and
> > configuration, as the runtime taint was just added.
> > Certainly won't be this year. I've been doing the rounds ensuring
> > everyone who hasn't switched already is aware with plenty of time to
> > spare.
>
> Well, it is good to have the warning, thanks.
>
> >
> > > > Aside from process details, I assume there's no problem with doing the
> > > > change in principle?
> > >
> > > There is, but it appears a done deal which we just have to accept so
> > > I'm trying not to start a discussion which I don't think can go
> > > anywhere productive. If this isn't a done deal, then let me know as
> > > that would be different.
> >
> > It is a done deal as far as we are concerned upstream, matter of
> > 'when' not 'if'.
>
> This is not going to help systemd's reputation. Basically, we have to
> do what Fedora does and look as we're told to, which does go against
> our configurability objective. We already have tensions around musl and
> this will further demonstrate our direction and systemd's are not
> aligned. I do understand why systemd is doing what it is doing and that
> it really doesn't care about our use cases. That doesn't stop some
> users wanting it (but also wanting other things we have like musl).

Well, it's not just Fedora nowadays, it's Fedora, RHEL, CentOS, Alma,
Rocky, SUSE, Archlinux, Debian, Ubuntu, Mint, PopOS, Endless,
OpenMandriva, Mariner... and Gentoo is planning it. There's probably
more, those are the ones I know off the top of my head. Whether to do
this change or not was discussed at length almost ten years ago. We
can't keep reopening the same things again and again, it's discussed
once (or twice...) and then the decision is documented and slowly
implemented, like any other project does. Every project has breaking
changes every now and then, Yocto included. We're doing our best to
document and notify and spread the word, and sending patches too in
some cases.

Kind regards,
Luca Boccassi


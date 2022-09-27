Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2EFC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 16:17:05 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.13167.1664295416613784851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MmdpWoFv;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id o2so16421867lfc.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vc0aDL27OF9iqYrV/DQgYEw+aG0JDOtN2z1UOmNCvUg=;
        b=MmdpWoFvdve4c19uwim30KIjGd0Qw7w9toMa8jZA1kQ/s+2zuVgwsliN8anA2qWs3x
         yCITgMretFdKd+9FdkGaKqtgDg+wkRHbw/xh/Z9UKgh1MlpKi+IOIQ8UwlfTHCRNgr36
         vtzGPWgvH7z3G8+mRxKL+TKV54gXcI1jNPCk6gEnTEUYoNGjGy/TskEaG+C3TpIU9sjG
         HNZH/6D+EY5JFImTguCHtEmKlAPN5SiMppJyS2eHUF6aqvA4gyVzeAIUqIlnLM9dHB0U
         dVSSHouubcGzw5aXDejttfJDPwRtdPlduFUirQoX+LGmkIJJtBII0XOjmcGYbA5NK8gH
         yjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vc0aDL27OF9iqYrV/DQgYEw+aG0JDOtN2z1UOmNCvUg=;
        b=VsV269JlmN7xsArCrqu/2p0jL2gAmVcgK86havpNqVX57IUpdzNUUvto+3RErVhJga
         nn+iDZ4HbsAAt5CcpFu/TT93oGYdtsM2VB7TljtrVezMsWBbBT9rbEAYVD0WqXwJXSVA
         v4qj39dUb93EeiFKkQ64m1Gro5RA86zRNwqJ/4PR8/Ookr2juo4UZ5xdtS5ogkZT5tzB
         BxxnWgP72pd00hC0jUT5BgQDLJLEeb9CjyuD5PFbT6XTISPBkijjL6wfUqe5Wztpda5p
         xNkICtuGFwzpHi9Wx0vq0KmGrJXWEnrbVl53qwEz6rNmd56OSfQpegCXWN59GjvfXoyR
         3sKA==
X-Gm-Message-State: ACrzQf1RPg1DU0fTBLWYrk9ztEv3bdAAR5I+yyeXuCKtlmbpM4fiB652
	S+pMG/wGInCU7EZKxm6t6lPBmh7heiSLxtZu9oY=
X-Google-Smtp-Source: 
 AMsMyM4WIXxt4Rj6OyOJEt20MiuP3mLMGFR+MPhEl4W+OiEZVqITEiWBga7N/rbjMEyZvQ3YzHM6y+KGlmE38t1zGPY=
X-Received: by 2002:a05:6512:950:b0:497:c41e:3d0c with SMTP id
 u16-20020a056512095000b00497c41e3d0cmr12088523lft.673.1664295414820; Tue, 27
 Sep 2022 09:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <6dbf0e264c68433a8aee1a772015c852@axis.com>
 <1718C14CEB633922.9698@lists.openembedded.org>
 <CANNYZj_rRJFsnOcSrkONYfmkZdUe1eCZKYcvnkpPj7jm7eVu+g@mail.gmail.com>
 <faab0d74b95849bdb1d39ac0146dd523@axis.com>
In-Reply-To: <faab0d74b95849bdb1d39ac0146dd523@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Sep 2022 18:16:43 +0200
Message-ID: 
 <CANNYZj_2+-GiZ4Qa67GJ3KFJMqFxLFXW6XKMtL+a9=NrPmi66A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 16:17:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171110

On Tue, 27 Sept 2022 at 18:06, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> > Otherwise, yes, I will say this:
> > fix your scripts, and stop complaining.
>
> I can (and will) of course do that, but since I believe my fix is of
> interest not only to us, but others who setup their environment
> using the .templateconf file, my primary goal is to try to improve
> upstream first.

Yes, but:

1. There is no evidence anyone else except Axis is actually using .templateconf.

2. .templateconf is now officially retired as a way to set the
template location. The patch you've sent is completely contrary to
that: rather it makes the incorrect impression that it is still
supported, and the implication is that the core upstream would still
have to accommodate and think of those who are using it going forward.
Yes it's mildly annoying to delete the build directory, but can you
just do it and move on? And yes, make a plan for replacing it with
TEMPLATECONF, which is what I've been trying to squeeze out of you for
I don't know how many times.

Alex


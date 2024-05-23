Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009E2C41513
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 08:35:49 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.12119.1716453343940999307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 01:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sqj9qWoX;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e45c0a8360so64769971fa.3;
        Thu, 23 May 2024 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716453342; x=1717058142; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y8vYyXPXWWUeY48qDX8keo86HqZX9T8+0brj/mq+Pw=;
        b=Sqj9qWoXEweL2l68bOfM0JWXiyOcvOshFH/KB5sT6GWOcOjxT0h0CY4dTs7YMRKnnu
         HaZ+AV6hcFzGEj5Ql44oaq8FrXQAAbXR1mRPA8aibT9715h1ZHAj/Lpda4BZi2p7iDmw
         tVnahcXlmucl5H/YK24EHSCteYgvHw+CjYHRFBWk/ZTp6X0dmVtuYcZcqDsJ2z3z2qJf
         iOYJtHqk9Wzr75dqToYA2WvCiYAoaN8+uSZ9xYw9+fh1hSTHoTz7oqs7XeyFbosbxlP6
         NC6JhvXybfBZSbRkYVThtBKkExgBmUK2DHoojP1TqFL/ii05esn1T3tXmctU4OVbB+9H
         kffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453342; x=1717058142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y8vYyXPXWWUeY48qDX8keo86HqZX9T8+0brj/mq+Pw=;
        b=JDD5Yhoo1dEDoqHAIAFFoRUJJsqW3pAlpP1XCGYip8G8dFnYRhovzkUMGkI0ThEA2v
         YuzgWuiv6cYSXsYHwS+K0IKB+1o6ND9UKccYeU1pkcfntgqFkPHQhlJmqy1L0gadvZd+
         b+hmlZzQT6BHXZHo4fdzR01yKoagvpTeKVOHLEVh7lDpk5O1Eo2o1b8xpXWxSVDoU2fr
         BciTV00QmwIXuR10B4YF5t2Dk4kb3tWegfbWPsvcgIGWt2cfk0ldXUc8A2AWeEmhLy0B
         5jC+c/6SEFoNm5sJoeVv/eAa62orsLTJ2+VujpwVSaiAJX3u51pN8WqqHKOjs4egrZeh
         c1sg==
X-Forwarded-Encrypted: i=1; AJvYcCULeqLQw1SPOb4Up0+hnNsrH3NeNWxarte38UCBxdmls/WFBuVLLuzmyjYMpecKiJ4jGgZGLvqDlY0FxXs4lY+DvzAZaRy18JOLLCRB3H4n0TVLq/yhy/bj
X-Gm-Message-State: AOJu0YwcfTbHeI7rUPq3PbeikeBrIAhcDBiremN8gm0FlbAC45Ql8l5x
	2wv3r2REn+iiAiCL4oDOyIrwd/vIM+lHnWVb0ZaAfK8Nq3BFYYZ3i3RAW29L6cfkCPQApJuPF04
	a4DHFJn37FssLZmyw9u19yhAjxc4=
X-Google-Smtp-Source: AGHT+IFCWgD4oEiWAEF2VLLDhaZbNNklGuMWPrF0S16ZNqm9YFOL5O1WBYdCY3+H/kPP4mJYagD1KBRL1MvxOkMwtAQ=
X-Received: by 2002:ac2:5f69:0:b0:51a:e03a:aa15 with SMTP id
 2adb3069b0e04-526bebb45bamr2309701e87.5.1716453341823; Thu, 23 May 2024
 01:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj84YtfRPXWm7c=DV6mOeQwVJaKLyeOHd7ni6PtZYx88BQ@mail.gmail.com>
 <6a6aaf4acf3baf2406789f7d00f4f07ee2444d95.camel@linuxfoundation.org>
In-Reply-To: <6a6aaf4acf3baf2406789f7d00f4f07ee2444d95.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 May 2024 10:35:29 +0200
Message-ID: <CANNYZj-DL-vo-7kdmij6Rze8J2gy1MYmdfOVGN6F7-73dVdbFw@mail.gmail.com>
Subject: Re: [Openembedded-architecture] proposal: controlled deprecation
 process for oe-core
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 08:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199785

On Wed, 22 May 2024 at 10:24, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> So yes, there may well be a long list of things you want to remove from
> core, however, we also have to think about the project's use and why
> people use it. It is often because we're able to support many weird use
> cases and interesting scenarios that people do adopt and use the
> project. I don't want to have a clinical core that is so opinionated
> about how it should be configured, people can't innovate or experiment
> and go and use other tools and systems.

This and the rest of the message presents the project users'
perspective well and the arguments are solid. I don't have any
substantial disagreements.

What it doesn't do, is acknowledge or mention the maintainers'
situation, and the unhealthy dynamic they find themselves in. It's
nothing new to you perhaps, but to make it clear: appreciation rarely
if ever happens, but complaints and demands come steadily; work has
been routine for years; asking for help is met with indifference. All
the ingredients for burnout are present. And we're all left to deal
with it on our own, developing coping strategies privately.

Lately I've been feeling downright *resentful* towards the embedded
"industry" and the amount of freeloading they do. So this original
email was partly born out of that sentiment: try and see if I can do
something that shifts this balance, particularly by being able to say
'no' to some items that are in core but in my view shouldn't be.

Mental health is not a privilege.

Alex


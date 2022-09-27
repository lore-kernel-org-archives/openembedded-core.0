Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22FEC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 20:39:23 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.37.1664311156968874666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 13:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j1IVwmGA;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id c7so12179742ljm.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 13:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=E+a88azNvZcIR4JyZcxy/PRcfMAf8UsHvfRbfg65Eys=;
        b=j1IVwmGAyj3Lab4pFwiIk8pwsPdTRUG4KD7wNVeBQrvGEZnZcHk43Cb/yRG/0U9MYK
         DeQM0uJU+lyL/kdC02n7joC5/qs5uIFD1fO4WSoVBs/CWhLV18JSnBWCQapD/92+s4D/
         /TEyFGNy4B3hdzHIVPEl23KQG85wsqxd3toXnR+TdSuJ/CrLTOMOD+f4HeU+e7ukJe4h
         jY7rYDFYTxwfiC0PfQt1cO6hGtzKn9BlqDXfbKBGNs62IhD+RR0rk9MaQPOXSupbT0Tk
         x3RBwCyo77/0VFjUJT9Vu+Q8B0io9bZvmLuffmiOQ0xmUI/sb9O2vUIT7a8+Rnba1UlH
         OucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=E+a88azNvZcIR4JyZcxy/PRcfMAf8UsHvfRbfg65Eys=;
        b=HC0bbblkuMYg9x/4UBfhl3RDnQCVV+MNRcl3yPUli0XT/SyMLpujEJVeJuj7RdXmJC
         DL4miQESF5+CIPJML6OijJWub7hDKu15erhvcInfhUkqnDeizDly03yqRfNErCSYAtyL
         qudkP87OurqYmdzecYJO6cMPeM58OgtmfI9PGpOpcWPIHtalX2oEMh+tFS+v9GATHK/b
         wv/P5tUw7gTKGYV+3lPY2JsUkED9QyXpaM5C+VQJsHkoDQ0TvOQ/p7PG1GNNRq5/OO/r
         uQXJjb5Yyj2cGUKSMUq0svJA8kY057MZeyRzSffE4k5xwYlEVxAqUbhKzwTqeLdVpQnY
         +ukw==
X-Gm-Message-State: ACrzQf2ZsZx1tqJXHcrYbrlzx1WBj6ViFSh7uQqnOstV1WeRBagQLQuD
	R1dxowmre/4ftbm9JwWz28T8mZiir6YasTZ8GC0=
X-Google-Smtp-Source: 
 AMsMyM4ywYNkAyFpkqzifDo+aV/aDsFYlfTKc/1fAeKldt8duahv+EXZP/socFCQb+U5aDgBimwNSvYV83CxIfgvEHY=
X-Received: by 2002:a05:651c:17aa:b0:26c:27cd:3fe3 with SMTP id
 bn42-20020a05651c17aa00b0026c27cd3fe3mr9902529ljb.68.1664311155125; Tue, 27
 Sep 2022 13:39:15 -0700 (PDT)
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
 <CANNYZj-c_z73wttGbAUv7FyKA5oGW6AaohuxMjoV6vEnmPg2wQ@mail.gmail.com>
 <6abf4530302c415fab1356d820757237@axis.com>
In-Reply-To: <6abf4530302c415fab1356d820757237@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Sep 2022 22:39:03 +0200
Message-ID: 
 <CANNYZj_00rp354TnURkMBdME=_2JmBA+sG028G--a-sGX3jWYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 20:39:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171132

On Tue, 27 Sept 2022 at 21:22, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> > Not drive-by patches to fix your specific product problems,
>
> I'm sorry to hear that you think all I do is drive-by patches.
> I thought my contributions were a little bit more appreciated
> than that. :(

They are appreciated like any contribution is, but let me clarify:
anything that is not a part of a long term commitment to maintaining
some piece is a drive-by patch. If you're not sure what needs a
maintainer, let me remind you of that as well:
https://git.yoctoproject.org/poky/tree/MAINTAINERS.md

> > but upstream proper: something that makes the project sustainable,
> > e.g. fixing medium+/high bugs, working on new features, upgrading
> > recipes, sending pending patches upstream. This works never ends, and
> > no one wants to do it.
>
> And I can assure you that everyone appreciate the ungrateful
> work you and others do to keep things running. We really do.

You should understand the gravity of my situation as an independent
consultant, Peter. I constantly have to explain to my clients why
fixing their custom internal crap (that benefits only them) is not
always my top priority. Last week, I had to essentially blackmail a
client that pays real money, saying that I will not do any further
work for them, until they allow me to spend time upstream, and allow
me to bill them for it. I am still waiting for an answer. The timing
was poor as well, on the same day my friends and relatives in my home
country started getting draft notices to what is likely to be useless
deaths.

Alex


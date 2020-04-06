Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.208.1586196017303819754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 11:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K41Xqk4j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id a25so593289wrd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 11:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DpwzE+4XZ3etcfBjFojfq1Mu6T5y8n70dQAlf1GOiK4=;
        b=K41Xqk4jz+64VjeR+R54sRWO/JVWfcqYP4ekV1nweLqcZgVx1A6sDuO0wmRqRYMJOp
         PuXiTwN4bYPDaoT+CVTDmUZpFs8E8kLO2eGqugP1IJdXUXkZteeop11EFLbM3B//zu5F
         zoVdnKFHtC63IjYiIoCBrqMTdFbhbARU8oBas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DpwzE+4XZ3etcfBjFojfq1Mu6T5y8n70dQAlf1GOiK4=;
        b=Grhn4zH0022Y6uOmcEzaDQaV44RELkkF5/ZMDj9s8W2qdMGnHrRA/aSvXuFm/cN78R
         2Mth51VHMrZatJkOHUHM+FOGZaQ55Ydu5mvmpCdbpip3yD3ooPCn3yVr9qNuymJU6JtO
         HvRO/tcIavLtbfJ3ngIE6CElW4TlSzkfEGdCdVq/Qi6A71h7fg1XWevRj+BhvFYNRQ19
         XY02J8Ey6lO5VaTpe9UcxTN+FMAycoYTbOP9dKYXeZlBzuZesnPkRyAWpP+DJJdgzX5t
         wKocIrh9omYxuCCiAv+mfsSR0+jfvudCkqifsTpCF0TsafEMDckfxSY5YfFEsim1Aj64
         pbrQ==
X-Gm-Message-State: AGi0PubnwRDUvF8i7uvQmnBSFUUGGIaG+Ub/V1Jep4WX8MJj3ISiMkeo
	ES9wqF/9vB5dM7l8hd5+m9BjpQ==
X-Google-Smtp-Source: APiQypKFW8k57FdMq+1iMWg8gDeMCaq2g7m8uYniLbtPF84G9WFFZuSF36ba67eNca2d0mpq5717eQ==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr437028wrr.394.1586196015844;
        Mon, 06 Apr 2020 11:00:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s9sm662711wmc.2.2020.04.06.11.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 11:00:13 -0700 (PDT)
Message-ID: <0ea9d7e55351659c3bc4805537f5a7e74fca7892.camel@linuxfoundation.org>
Subject: Re: [OE-core] couple questions on PACKAGECONFIG (for improving docs)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, Quentin Schulz
	 <quentin.schulz@streamunlimited.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Mon, 06 Apr 2020 19:00:12 +0100
In-Reply-To: <alpine.LFD.2.21.2004061318090.20608@localhost.localdomain>
References: <alpine.LFD.2.21.2004061153450.16686@localhost.localdomain>
	 <20200406163831.verkxulxeru3kwsy@qschulz>
	 <alpine.LFD.2.21.2004061318090.20608@localhost.localdomain>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-06 at 13:58 -0400, rpjday@crashcourse.ca wrote:
> On Mon, 6 Apr 2020, Quentin Schulz wrote:
> 
> > On Mon, Apr 06, 2020 at 12:05:15PM -0400, rpjday@crashcourse.ca
> > wrote:
> > >   wanted to tweak the ref manual entry for PACKAGECONFIG, so a
> > > couple
> > > issues. first, the ref manual entry:
> > > 
> > > https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG
> > > 
> > > says nothing about the possible *sixth* entry, described in
> > > base.bbclass as "foo_conflict_packageconfig", so i can add that
> > > but
> > > i'm open to proper wording since i'd probably screw it up.
> > > (i'd add an actual example from poky/ demonstrating this, such
> > > as:
> > > 
> > > meta/recipes-support/curl/curl_7.69.1.bb:PACKAGECONFIG[threaded-
> > > resolver]
> > >   = "--enable-threaded-resolver,--disable-threaded-
> > > resolver,,,,ares"
> > 
> > https://media.giphy.com/media/puPeyz4SOYEKY/giphy.gif
> > [minion screaming what]
> > 
> > Didn't know about that one :) So PLEASE, document :)
> 
>   yeah, that was one of those cases where i just wanted to match
> examples against the actual processing in base.bbclass, and went,
> "whoa, what the heck is *that*?" then went looking for examples. in
> fact, curl is a nice example, as it contains:
> 
> # 'ares' and 'threaded-resolver' are mutually exclusive
> PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-
> ares,,,threaded-resolver"
> ... snip ...
> PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,
> --disable-threaded-resolver,,,,ares"
> 
> so that's the obvious example to demonstrate that. i'd never noticed
> that before.

FWIW it was only added recently within the last month or so. We've not
got around to the docs for various reasons but happy to have help
there!

Cheers,

Richard


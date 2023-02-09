Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFA7C05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 09:17:20 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.10273.1675934232919436721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 01:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bbHm9DWP;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id f34so2282258lfv.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 01:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MiQI0U024f25k1+HjEnrdl5p9TqsW37v3wAmQ9EfibY=;
        b=bbHm9DWPQRz5lWw9+xnYj1UH9A3Sv+Lx7i3mg1W8ngYT5iHKc2YIG719OI2ZSnWCXQ
         62CM6y3/7cMF0YuGgNxDY7qNFtbNcGwFHmgU+iaQZObG5yg/nVxuGMqbm1rE6/N0Tw7v
         nGWURNpckRt5jP43FQ+Y/l4EazntixTQxr78WY3OltNTIhvALd+JWnBaLw8MaYzHu3u/
         i/icdx9Qwmr2k5Vbyu7Xe4D4iMvMwN9T3MwF6WULspzJUA7w8riaMJjhlwhlVC2KWb4S
         4NEkKMZ7EmcbIT353shtqSSY69T9ilIe/Q98sRyLjtJDQx2XYhmRkwuY48oTfPn31bUS
         hB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MiQI0U024f25k1+HjEnrdl5p9TqsW37v3wAmQ9EfibY=;
        b=doWpUrmgrfecXyHU3wnzlQRSpt4qPkEEae6OHmtMvOznJQlDZKsxg/R0xn/kXUIXVb
         3620Sjf3Z/WV2WYHoY9KKlAQX6MgGIIH+fhVIlsD3++vn58a9XvQlj22yR4YAFevMmSI
         iDMtcn3H1ZwYe7x66DkQVHEJLoep+a+qBQUZL+d5bFU/PfTBZvQupwslR2ivBUtLRise
         kPWKNOxMT4SpNsQsxVfOnEAFyDUvKF9+07MV4EFaAVPpSW+TkYR1xnFvVehQyzDH8m6G
         D6YwOj1jQ1dr52dCzwgfWs+bYE7JFegBBtnG+Estbte41x/yAnFFuNZQ0USRgoKIwxhy
         GJtQ==
X-Gm-Message-State: AO0yUKUcKUdJx1UAQoAeYeBRVXn31Ix7H2CnI4s0+h6rluPFoE9PHgvP
	nOKaJKmkj2A9dU9/n7n627AbfXZayTc39wIPdz8=
X-Google-Smtp-Source: AK7set+QJdJjvt41eYRRKKsuOVaI/0JZqe8jEpotFfsiIK5+Xkv0AiWCfnJfugXyXMSpHcvrhpS4i2fqj85m1qBz9XA=
X-Received: by 2002:ac2:5dcf:0:b0:4cc:7571:8b1d with SMTP id
 x15-20020ac25dcf000000b004cc75718b1dmr2276149lfq.58.1675934230934; Thu, 09
 Feb 2023 01:17:10 -0800 (PST)
MIME-Version: 1.0
References: <SJ1PR11MB6129BF5151577F93D523A6F4EBD99@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <766c318c861eadd02c374d65617895c60c06ec46.camel@linuxfoundation.org>
In-Reply-To: <766c318c861eadd02c374d65617895c60c06ec46.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Feb 2023 10:16:59 +0100
Message-ID: <CANNYZj8NxyAqCBzrqUhjQN5bi637dRfpvnH0aBLvCZW7JGdJpQ@mail.gmail.com>
Subject: Re: [OE-core] Qemu doesn't respond while logging in for the Rust
 Oe-Selftest implementation.
To: "Shinde, Yash" <yash.shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Gowda, Naveen" <Naveen.Gowda@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 09:17:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176931

On Thu, 9 Feb 2023 at 09:58, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This failure could have many causes. To try and help narrow it down,
> does another oe-selftest that uses runqemu work ok? That would tell us
> if this is specific to the rust test or a more general issue since the
> other tests are known to work for others.
>
> I assume you're just running "oe-selftest -r rust" with no other tests
> active?
>
> It is unlikely to be debug-tweaks related since the connection is
> refused, which means it never gets as far as trying to authenticate and
> therefore likely isn't user/privilege related.

I would also suggest that you look at the steps that the test
performs, and replicate them on the command line. That way you could
work towards narrowing the failure down to the specific point where it
occurs.

Alex


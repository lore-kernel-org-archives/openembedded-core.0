Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69F2C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 16:49:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.67076.1702658963823737946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 08:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LxdoFcap;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50bfd8d5c77so997206e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702658962; x=1703263762; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dn0GBQQisquuRP0oAWHrBuj4TfcIRrHYv6IHIU3W/PA=;
        b=LxdoFcapLJwePv6QSkZNekLHx1Ih13J6hplbvKSOHnWtg19rwCidABIOrn3qsijcXD
         9Nuj4/+a6FJVyOaN9cJj1g6XOkZn+tnOqtaNShLmzvVcckO8UkgwP5twI+g80CjgHZBo
         llX2TxaA+IXg8qme0jVlVqpygNvtSInLyxa3rEsXnbrpQ5JW7ev6LInvbWS22530j8uq
         NrvliHCgjTF2vrHisLBUlROmwqgejbQHXJxegu4oA4EQ/xf6pZpsXj88XrDztrjpChGa
         tByDB2fjmjGPi/fGYTOl9li64oBpsL1TKIKzhg8nG3iGUGHFp5vLQZIHtbDsS3au58oZ
         fLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702658962; x=1703263762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dn0GBQQisquuRP0oAWHrBuj4TfcIRrHYv6IHIU3W/PA=;
        b=kP0TLCr/P+DfE4ZtDIkO7AeOUEq8FCoxuuJD+3nWqj5I+kIJb61WDaKQzplmdV7Q/P
         rvWnnhAfvIo+xHCt3rJ+Chj0Z06MmImL+KEeOClO/ldKIFUDWH3GXFKdyqebKT/46Ebj
         /p6Lbrim/PPciZre9UA2fLp4b4bOulQXW1SNknDzKbhhdNjWhlBxHd5NLv+PQntPkc1c
         RlqgGUpW5BUo9NZbgaBQMsoEPhmdKh06Mr44grLn4cTvW/4ATaqaiXzsRRW7bn4B5Wul
         dR3nd40bmxvUIVSbHXkecUAbklSOJWQFN2RTS5X95MQp28HunzPKfoxBPgbJZu1jBkGv
         HluA==
X-Gm-Message-State: AOJu0YwKjY7MXelmz5kv1qbt65u8txNF895BoMr0rDL9tBxFFOfm5C5G
	ScZ2oxH8ZcWyPgkcCVBT03P910BzDhEj6cUWQLw=
X-Google-Smtp-Source: AGHT+IEn16x/9SZiAnmR6SpqnGv1sXzUIFoAJT1R/VY27eFIZ8/gACBA3f/ZILxg3oSNekywAiX32ytTgDlSshyBHTs=
X-Received: by 2002:a05:6512:214f:b0:50d:12e8:841f with SMTP id
 s15-20020a056512214f00b0050d12e8841fmr2358740lfr.15.1702658961714; Fri, 15
 Dec 2023 08:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20231214134528.1973602-1-alex@linutronix.de> <20231214134528.1973602-3-alex@linutronix.de>
 <bc4906880058d64446e62a2ff6f983b85246750b.camel@linuxfoundation.org>
 <CANNYZj-3r41Ukp1GUGhChbbJK+ATh_eOBvpWJAhn90_UKBMBoQ@mail.gmail.com> <70310808800e92bdb957f9f6fa7d937fcb1bc2f1.camel@linuxfoundation.org>
In-Reply-To: <70310808800e92bdb957f9f6fa7d937fcb1bc2f1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Dec 2023 17:49:10 +0100
Message-ID: <CANNYZj-E4kiuX+R+d29_4Bq3m1hnkgPch709QSKqyHRRAgR1vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/9] bitbake/runqueue: initialize
 RunQueueExecute before printdiff rather than after
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 16:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192534

On Fri, 15 Dec 2023 at 17:04, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> > Meanwhile I'd like to implement what I mentioned in note (1) in patch
> > 4/9, as it's a real regression that I realized only today as I was
> > preparing the patchset for submission and now it's bothering me :)
>
> Yes, it is and I do agree we need to fix that.

I just completed the fixing. It all works wonderfully in local builds,
but who knows what situations AB will be able to come up with :) It's
a bit crowded on the AB right now to start the tests there, so here
are the patches:
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/fix-printdiff
(I run the tests with a special contrib/kanavin/ branch of
autobuilder-helper that only runs the three needed selftests, and not
the whole gigantic set)

I also reverted the gnu-config tweak in that branch as it should be no
longer necessary.

I'll cherry-pick the bitbake patch before doing any further tests, but
it's now Friday evening, so anxiously watching ongoing selftests is
perhaps not the best idea.

Alex


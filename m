Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7D0D1F9CC
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 20:52:51 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.7691.1729025570186776860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 13:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=guqZUN3S;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so14549581fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 13:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729025568; x=1729630368; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSwDIAK9G7BhhrpnAOT3E2izx0Hu1FtfT9VSonFxwMk=;
        b=guqZUN3SkFNJlV/IUKminMTGFcj45M+zDNeGpWj57VfD36Hw4gA9FtUqq7UFilRovV
         NdEakPYR5kMLqftKn5TH9OYY28iC4Bz0tho9KgrvGY04PHxZdxNm0cbaLe5Ma8HfLhS5
         8xzdFotbcIzO55E3Hbw0GCLY+Lfqn7a7mSesIpVeDhha21x8zDhYD/Ra9IDCwzZ5vrJe
         w0sViD3lvCsKsSfQA0irjUliqT34uqE6kvHrb7+5Jdw2rOq5c9OO0QHjBH72m1Km4lEC
         RgCtKltxwTa7JiwSkdPjqJewDnQg8nb9c1h/S3Z8mqdVJuq3ihXsBIWGdQZbjwNgyTFT
         ILpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729025568; x=1729630368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSwDIAK9G7BhhrpnAOT3E2izx0Hu1FtfT9VSonFxwMk=;
        b=RSNsYmwiGEJhIpl5Yq6oylaX71ILqnrCChOgqOe4PHaRQc77P9oFnquAc1FfCgDSC1
         1eWS2WTuCsp4es7IMp9sEf77oYNoOdnXItJMUNw668lnMXkpvwkrb97A3p7Nx6X8jgzX
         jv/Pbvy9rCTCMlcjHTT3cOWBQH2+G9KdCAcXEaq3HdNIDWrsPRKmYJYix/KQ80spNpTL
         Kh94S9LtUdIyOgoFeFLTkK1RmSOacoBXI0OLX4pln2sEEpvFFEKSlWu2u57DPiPiU6sv
         MORr0kcGTQp/r6YHN+vY/GpoHL+KallkUVB2b8spvMXb3ZpJS0cG08/cIOSQKV1Hie9K
         NSGw==
X-Forwarded-Encrypted: i=1; AJvYcCUJdjTpi4FncYlWENVE64jInRZfD/Ej/YEIuV01D5VKwqo4QZEc9CbdCN6z5jGgDrO2DUrkUbdiagId5oEHRL8fig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YygWH33zHSF5R86Y4xQ0HxoTsHSxQ8ex0GOqylxqKC2nNQPJtOJ
	wBS2MkLv7XdVrgA50jTy+KX23WhbzPm03lkl3duLZX8mA7GBNwJcAF0RTeg12n2NbVYNZCzrXYj
	cc+RA37ZIShyIVxvm30FBnHn/Dxk=
X-Google-Smtp-Source: AGHT+IER/Rim9dB8eD2fWl1UKZJQDGzDwb0xoRx2qnJIT8hxw/JS5o3dpqrsuDgGqxWNpGjcPWZro9rp6BM279zvOXg=
X-Received: by 2002:a2e:6101:0:b0:2fa:e4ae:3364 with SMTP id
 38308e7fff4ca-2fb3f1af9c0mr52085161fa.16.1729025567866; Tue, 15 Oct 2024
 13:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <D2078899-7FD6-481C-8B0B-032B62F078D7@amazon.com> <d091124adf15effe833452090f1dbfcca8739a38.camel@linuxfoundation.org>
In-Reply-To: <d091124adf15effe833452090f1dbfcca8739a38.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Oct 2024 22:52:36 +0200
Message-ID: <CANNYZj-Pdr9V-06e3_ctUYyyJRM5iRB54TvFKjgHhPN-6oYLQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: remove corrupted artifacts from local mirror
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: yumx@amazon.com, "Sobon, Przemyslaw" <psobon@amazon.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 20:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205946

On Tue, 15 Oct 2024 at 22:32, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > So that's the tricky thing for us. We will have to run the script at
> > a time window where no builds are happening. Because when I tried
> > deleting corrupted objects from the s3 sstate cache manually, the
> > corrupted sstate object ended up being reuploaded by ongoing
> > builds... And this is pretty difficult to execute reliably, since we
> > have so many builds.
>
> I'm a little bit puzzled here. How would something upload the corrupt
> artefact back into the system?

I am also puzzled by this. I was going to suggest that perhaps there's
a rare bug in zstd compressor that deterministically (and
reproducibly) creates a corrupt archive on a certain input, because
ongoing builds can't simply 'reupload' something corrupted that has
been deleted from sstate. But maybe there's some extra proprietary
layer of 'overwriting' and 'synchronization' where all this trouble is
coming from.

Alex


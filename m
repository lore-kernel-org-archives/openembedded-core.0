Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95ACC47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 17:40:56 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.3197.1709142053872756656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 09:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YTBwMAN3;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512bde3d197so5397412e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 09:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709142052; x=1709746852; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6TW4Xmwyl+k5M3MonMihPQXh6JeXYBLnikp8kcmhQyY=;
        b=YTBwMAN3s96c9XQGIXSGA/aCpAwpt1gtiUCuG98zVwpjpt9RstFX0ShZMaFm1jY4T5
         6SpLIzYGv+dvQ3lOzby+ZdYNprgcZn2Nd+rNjuczjTDwfFNkHqLOtqp80dL60zj+KMka
         jUmM7AWBjPODaT9QL9b3qshR8CaUN40YgsCQ2tef1UfB1FWS5gqk2uVhd3T7bQc9tDrw
         oKejYJI8W+7fwSZ29CKZjq+BusSunye6VAzITSwCENvnqzXDryZqF93CXnJve2QUL54/
         kPRYjZmbKpyEpLspvI9Yj/XxJspNrJZ+2fMy5St+Ma5UxiRQFEnRKvMJCnVPxy0d+32U
         GJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709142052; x=1709746852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TW4Xmwyl+k5M3MonMihPQXh6JeXYBLnikp8kcmhQyY=;
        b=CbXu0sWAQoGPzfeLBgHNCZ0XZtvZspVw96tA1FRkfKQhCO0WTgmd2ZgHZngCTKVI+a
         n5TIppUHny6ar2BNdAwQfUHar9hwfT0d9DebHgZ8dUmsraMY2MgyRY1nrC5nhOvrmTCY
         NDGFYWn0rh0zBZ7h5dh2PN2liR8Oki4Q41mcv70XGkx91DzwGQXC53EpVyalwtoIAOn3
         Yib6B59oWMLcapVf0vYpXf+N8vITAgOT/OspXv5wLfs6fTkzJjwUpmjeDvNUftkU5g7c
         GeemDRhkdCx4PKsTfplk7HYMrDLI6yu4f+amIy1+1PRvGPIQwhf5OQ2egX+4UJRBVLfL
         Tp9w==
X-Forwarded-Encrypted: i=1; AJvYcCUh4dJTiYuXETpbFLA5ZchlckffYxDBNUf+vKp5nkG3s5cwXz1w9CMiCFdwtf/yF6W7bvFCzOI9N9fXzFn2FMvy1ebXzNXKqyrLLjVuBsLaeDz8j2yRdpsz
X-Gm-Message-State: AOJu0YzfLeKQFParF1+lpDM77ps5YFm/P/miJW61yhrA9dBbHWYYBwNo
	VZlviRIgveqksaTOYRgDBXG0J8q/UEnL3Cy1FJ3aN/TN+mg0ylb88dvpgLvJq7fUz52Sz+ZhNsB
	8Abj/j6ABGNmzgkpy0atxOL177vM=
X-Google-Smtp-Source: AGHT+IGmGr5ODwklVyWlBKFhr/3QcCQaNbzTpUvHlIMFzKN9HsA/fsYLcvHhwTsuQWTjkKKw2qD7yURgSgAaMyFAj+0=
X-Received: by 2002:a05:6512:214d:b0:513:1ecc:cde5 with SMTP id
 s13-20020a056512214d00b005131ecccde5mr227929lfr.19.1709142051680; Wed, 28 Feb
 2024 09:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20240228062139.473528-1-philip.lorenz@bmw.de> <e5139011c4d44fab2f927332a01947a7eb2c42ab.camel@linuxfoundation.org>
 <c95a7daa-8f9a-4767-ac6d-5158647781ed@bmw.de>
In-Reply-To: <c95a7daa-8f9a-4767-ac6d-5158647781ed@bmw.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Feb 2024 18:40:40 +0100
Message-ID: <CANNYZj9rcqN44L==NwV=o-GWKCqzU1rOK_U03VK2XQufWos6Dw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/1] package.bbclass: Expose list of split
 out debug files
To: Philip Lorenz <philip.lorenz@bmw.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 17:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196398

On Wed, 28 Feb 2024 at 16:41, Philip Lorenz <philip.lorenz@bmw.de> wrote:
> > I'm assuming this data wouldn't be that large or that expensive to
> > compute so I'd prefer not to hide it behind extra configuration options
> > if we can help it. That does depend on the overheads/costs though.
> >
> I just executed build ID extraction on the debug packages of our medium
> sized kirkstone based distro (see my reply to Alex for more details).
> Sequentially extracting build IDs from around 8000 files took around
> 1:30 minutes on my machine. While I wouldn't call this excessive, I am
> also not sure whether this is too much overhead given that I only expect
> this data to be used in some deployments.

I have to object to the numbers because they were done with a
sequential shell loop. Debuginfod does it in threads and is able to
complete the scans much faster. So you need to check how quickly it
completes its job when started with oe-debuginfod rather. There might
be an improvement coming from what you are proposing, but it's most
likely not going to be as drastic.

From debuginfod manpage:

-c NUM --concurrency=NUM
Set the concurrency limit for the scanning queue threads, which work
together to process archives & files located by the traversal thread.
This important for controlling CPU-intensive operations like parsing
an ELF file and especially decompressing archives. The default is the
number of processors on the system; the minimum is 1.
https://manpages.debian.org/testing/debuginfod/debuginfod.8.en.html

There's also something else I noticed just now: there seems to be an
alternative implementation of debuginfod you want to introduce? Why?
If the original from elfutils isn't working well enough, shouldn't we
make it better?

One possibility is teaching it to mass-import pre-computed entries
into its index, so that sweeping file tree scans with archive
extractions can be avoided altogether. Or doing incremental index
imports directly from do_package.

Alex


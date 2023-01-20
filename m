Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B009C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 19:39:10 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.84630.1674243540421495131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 11:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F89cADcv;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id y25so9544423lfa.9
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 11:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WNGh9EzuDswW/BCdySD8+w/R6VD7Ps6VDA6uQVwYhIM=;
        b=F89cADcvbZuC0N179vpzVCjwlpurBjH7qchk4hSqlahjC7mX6ppDQPBIOM5Gkq815T
         8qVMgv20rzyb3C+GkHaaqB1ORkrOHzbVto/uhengQUvpzqRQqPvgJF+HYNjvbfszXZqR
         FIlvZ1BoxdaeWoHmfs5c0ZqB/a3+oVhB/MKCHe7ka0WmNV/4HZWmjK+o4hjbCABYV2Db
         bMzeXLlsb03xX02BXvAR5B/3ebK9/9rhXn7G9JPp/5f0lReHquiLzx5uBoS3OAQ+zMrV
         OzrRTVh6x6SINCO2su2tikTYPexyjw/fWG+yE1bsFV9kZ8ypbRsuNQlyUmXLbBcq8LZN
         dGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNGh9EzuDswW/BCdySD8+w/R6VD7Ps6VDA6uQVwYhIM=;
        b=4GPb7YHjzWasdaiNskMoPngsu3aMQpbvSz5L2RJeDCj9Dvpib3KjUknqqY55Z7BAbH
         RYho8ChPhEbTdBiSuMaxlA8KMF5oN/ll+3GlFLORLUJt7J038imoqYewPqbywVAqBkKN
         HNd9hOr2YwfKoRz9YimFzENuUtXB9bn6MN3w7qaOPweptsvCmN2YbsO9N/staOn7svo2
         kVv2dXQPPSoTuUu8uoWugvdw2Avv+cp4z8GVRi/WqPPTMveyfvcV7ZEXm0WdP0ARlF2g
         3UVBHZbpWOwl1jiYbCyQM6FQdFgQ0zIk+njAAIvBvWDstRx2M6nMrmJDtg/eT3p/Yt3F
         rnhg==
X-Gm-Message-State: AFqh2kpOZMLjCna5gX8uKz89TK/+HvmlhBYtvwyrsA322mp5b7389KsG
	IrVdR7mxcZ1ys/yQeqVuevllZIN3ALZXQZ5ZMFw=
X-Google-Smtp-Source: AMrXdXs9JPg8gZXlNMt8SPwei1MvOiHLX2wldx8NCqss4LTTEegVtMRueLQlvdaQNud7yXmOiFG/I8PbFQzRDimePKQ=
X-Received: by 2002:ac2:488c:0:b0:4b5:4502:1323 with SMTP id
 x12-20020ac2488c000000b004b545021323mr1027138lfc.345.1674243538600; Fri, 20
 Jan 2023 11:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
 <20230119102423.3493565d@booty> <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
 <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com> <CADkTA4OFa9oKKHUYNcpXY2Rfvs_kyJOCbiWMDMDb2Y=84KHPJQ@mail.gmail.com>
 <CANNYZj_C7-U=a-TohJtcEVOYyaj0sYNnV_2EBnA55wT2QHT0Jw@mail.gmail.com> <CADkTA4Nq=X6d9qz1a+Q0mEpb=ob0_+TsoHdkGn2nycd8+FOz=g@mail.gmail.com>
In-Reply-To: <CADkTA4Nq=X6d9qz1a+Q0mEpb=ob0_+TsoHdkGn2nycd8+FOz=g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Jan 2023 20:38:47 +0100
Message-ID: <CANNYZj9yXjUFiAkoGnefvoKzCTut8BMgR-y4y7zu+=0vom9TKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error handling
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 19:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176251

On Fri, 20 Jan 2023 at 20:29, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> Because I'm simply not going to insist on it in all the patches. I
> need all the contributions I can get, and I'm not going to
> pedantically insist on that.
>
> meta-virt is not oe-core, I do the lifting. Therefore, if bitbake
> errors, I have to fix it.

But you do not need to insist on the needed metadata or fix it after
the fact. Bitbake will do the insisting for you, when contributors
test the change locally *before* they send it to you. If bitbake
errors on your side, this means they never built their contribution,
and you should raise a concern for that reason, and not for the
missing metadata.

Alex


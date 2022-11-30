Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED02AC433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 09:48:52 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.7243.1669801723339715930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 01:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DHxd/l/B;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id j16so26035960lfe.12;
        Wed, 30 Nov 2022 01:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=17NNrTsH0z5WWFBWW09rfre6nfK96+LcGm9agSlD+R0=;
        b=DHxd/l/BezbrWti0u67rRZghF9rxvnUuvJVBHVfxpAG+B9ZlbSAlWr/EM3xTw6nr4O
         HiG7+83o8I4ZNAuhUd2CUgry0aDui0i8RlyxoeBPFCG8QyuwozIjZ+Z6CqMKp+gBdEzg
         pHYA/BTsGN+gN8StobscjV3PcYbcf1mM1SW9zOv+J4tBRX9T5OPhc29tUzfuIOKtZKUK
         I+vu8/J4ccSnKy2TTVCzS2j4P+Ddyvm26QD2VLXE3XvEM0sMS66d6szThSkhFjcc4DSN
         ytWVT7zXKU4KIXxCyA11kukLanEDQbcM1N0xWQ9seQnPPGnuqvdbaVzN20uUnhf+VHq8
         byEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17NNrTsH0z5WWFBWW09rfre6nfK96+LcGm9agSlD+R0=;
        b=LwXaak/lRno7NizXpy7/TYzce1PTo71QqdKEWkd9PQK8Q1d5uymii7bZD082B44KzS
         zdq9yMpdj/th/8yMdY5rnQg4OYyYBGzOERkMuJuiinQ9mLmA8a2b3b2nkxGdOw+QAvLo
         KdKisG1pSQSh71kE8qkmZFwQBrrQea+x4fHntkasZPW2AAMqTF3UULpcT8f8bN57m7Vr
         P9yKvovSeywvLzAeGwVq5MEL5VD8fYq9xrgL4Nayzb2cfb25nM6Z+NGi96tAOSvwj3mV
         FHSXk+Tb9aRgz0zdUNcc6sqPcFZfShcy9PRWbHovmdhdnkkA1/jvBg+6NDr+UOwwdF10
         nPtw==
X-Gm-Message-State: ANoB5pkD/jp/dqSiZuTb4pT6T2QuWrrIxknQty+Aj/WuXQfUp1Q+7ys2
	oqbQYyAkRNkcw7irlzc9Wedisp49kQ55BU2APfQ=
X-Google-Smtp-Source: AA0mqf4WaWK868UR477y/BxrVy0FiIghhN/ty1dE8GnxuHp4ttPwh9MKoE9yrQ9iOaSMHTm1ooB9jnHroKk1DRI1dGY=
X-Received: by 2002:a05:6512:3445:b0:4a9:39f4:5793 with SMTP id
 j5-20020a056512344500b004a939f45793mr17261977lfr.131.1669801721273; Wed, 30
 Nov 2022 01:48:41 -0800 (PST)
MIME-Version: 1.0
References: <0b6801d90409$885d6860$99183920$@gmail.com> <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
 <20221130092832.62067104@wsk> <CANNYZj-31p1n_f_oh3+Le4O4vYrRLquvYxzdAk4uY+EOeS_V0A@mail.gmail.com>
 <20221130104006.526c0c71@wsk>
In-Reply-To: <20221130104006.526c0c71@wsk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 Nov 2022 10:48:29 +0100
Message-ID: <CANNYZj-5DhQiDzt7uOMuPskmf1es9n1TN8gskOGpfBFvGFtRog@mail.gmail.com>
Subject: Re: [yocto] Y2038 proposal
To: Lukasz Majewski <lukma@denx.de>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Stephen Jolley <sjolley.yp.pm@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 09:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173999

On Wed, 30 Nov 2022 at 10:40, Lukasz Majewski <lukma@denx.de> wrote:

> It would be even better if the meta-y2038 could be dropped and _all_
> its functionality could be merged to poky.
>
> That would be _awesome_.
>
> Please just be aware that this meta layer has some fixes for some
> packages (for Y2038 ready glibc).

Little by little. As long as we have a well-defined test plan, a
well-known list of issues, and follow a strict 'upstream first' policy
in addressing them (e.g. no fixes in layers that are 'forever
pending', un-upstreamable or have been rejected by upstreams), we'll
eventually get there.

And absolutely no promise to make this available anywhere except
master. If someone is using ancient yocto releases, they should run a
retro computing museum rather than critical infrastructure.

Alex


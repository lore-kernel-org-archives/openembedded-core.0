Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C65C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 09:19:08 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.38798.1674465538703998791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 01:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c/80jGNN;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id o7so12439869ljj.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 01:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dcSvruDYidcSYNGgq71Jpu8VnsVyYlz+c98lHZh1h9I=;
        b=c/80jGNNTWXEt0ExGjixv4QMYjP+/sr0poKalSZZIjF1vdbbdo0EUppWlFpZLeA7Ql
         m43assWsh3gLqw1WEw0sw/31a3I7dxudq5YO/lSgGrC54+Y6YwFQ7izb0TWqxHbCZgEJ
         Jv7pUkqpXRtxFKRqtvzwpZXFEAu9cuRMNBZhEwJM1zwrj1raIvvY8cfMgXjLZEihQrzx
         ACvMq9vMW3rVtNVNb75uvTc34gxVQ6zakeKViOLct5JZjBtuzH+reppZPdOKT7msTKGB
         P2kk6QowXrqcLaERdXqStoHV/XhKAxXgUML2O7TEXZ8Sa43GdhHnISkDFjuiv6Ibsers
         FsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcSvruDYidcSYNGgq71Jpu8VnsVyYlz+c98lHZh1h9I=;
        b=ex29sEr8MNCdVE3lI0BCw/SEsl1F6sqB4rm7HtmYaVU/ZF/9BfKE09co2m/vvzMjHZ
         E/4U+btwJqQrnOM+Bvuk+yBp2XiAseZeuTiRTCIJcmVc3adzFDy4dMaYhGIkwGTl10GQ
         yd7RbJTRwGVQKKiZ9xTqL/yBo1SGMYg3oLRa7ZVwe/XYPTemkQJt+g3whAOsF6j2O/ll
         jI3DrFR3ofLzFhOQ1aliGGnjmYHAXaheWPGL0orhTzKqu2dZMgHxGen34UVHz3amv39j
         kRazfCKeJ3ehW3NENQqKwld+SbOs+LNB6tcgsMk866v2jsXBPnPCToHm5SSiYEl6PYrH
         Wm7g==
X-Gm-Message-State: AFqh2krxJNRiE7IV1eNqgUoA+JHtExh6TK+ezIpQjFhnziYCZF74LFK1
	UB39ESytiNirsANl3BxmJH3nWUTfKrntYYjzoBo=
X-Google-Smtp-Source: AMrXdXtz7Xt/DCfmaxzBpWP/BwxRQ74vsepDXGMQTNPwmSntTwrOjlpUQqFEn7OOScLU+XeKzHk673ZmJHTHe+Snq/Y=
X-Received: by 2002:a2e:b042:0:b0:28b:6d42:c63a with SMTP id
 d2-20020a2eb042000000b0028b6d42c63amr2224328ljl.45.1674465536926; Mon, 23 Jan
 2023 01:18:56 -0800 (PST)
MIME-Version: 1.0
References: <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
 <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com> <CADkTA4OFa9oKKHUYNcpXY2Rfvs_kyJOCbiWMDMDb2Y=84KHPJQ@mail.gmail.com>
 <CANNYZj_C7-U=a-TohJtcEVOYyaj0sYNnV_2EBnA55wT2QHT0Jw@mail.gmail.com>
 <CADkTA4Nq=X6d9qz1a+Q0mEpb=ob0_+TsoHdkGn2nycd8+FOz=g@mail.gmail.com>
 <CANNYZj9yXjUFiAkoGnefvoKzCTut8BMgR-y4y7zu+=0vom9TKA@mail.gmail.com>
 <3b311ccc982ae39cc72c428ddc97386fe8d653e7.camel@linuxfoundation.org>
 <b354270257b047d5bcfcc73a7ac13270@axis.com> <1cfa5fc2c0edda2cd9990de4839d130e3f7b5be9.camel@linuxfoundation.org>
 <Y85AbhShAXaXZP4U@nuoska>
In-Reply-To: <Y85AbhShAXaXZP4U@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Jan 2023 10:18:45 +0100
Message-ID: <CANNYZj_Qie+ZRYGOg-hcu8XoWDQyvEXxH4r8hGAtg9=4v7CmPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error handling
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Ross Burton <Ross.Burton@arm.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 09:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176298

On Mon, 23 Jan 2023 at 09:08, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > I was hoping something simpler would suffice. I don't think I have a
> > lot of interest in going beyond this, particularly given the likely
> > impacts, both code wise and socially. If people don't want to do this I
> > am really running low on the energy to try and push it forward. Making
> > changes is hard, the socialising acceptance of a patch is the piece
> > many people overlook and it isn't here in this case.
>
> I'm requesting Upstream-Status to be filled to every patch file in
> reviews. There is a lot of value in this information when maintaining
> layers for a longer time. I want this. Everyone I speak with understands
> how important this information is and that it's better to figure things
> out or at least trigger discussion with upstream projects before
> accepting patches.

Perhaps you and Peter could prototype the per-layer option then?

Alex


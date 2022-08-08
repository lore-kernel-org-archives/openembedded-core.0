Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B68C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 13:21:08 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.25457.1659964865398837001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 06:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lc3Q/Paz;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id o2so5318489lfb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z5h7LFoxnpUF1QJLIWeQTv8xjQamEarDi69cnxFQgUQ=;
        b=Lc3Q/PazNT62ws+/UncXDa0Yg/Ti1qNc0t7mFyti3/gRB0in3q69kG8royuG+8lcJP
         GCJaLWtJj+A1jm9pIFEcK/CIbY71m2MDaAqQdmqaY8BoIX4MAbAGhRFr1Ba2foN4anda
         aPyyOYBtJeb1ppXwKHoozrOJUmAYVqzNqepO8cygGdj2vtWAc9hTR3CDFjY74zOmjFor
         NyLk8X6H9mUU7A5YNWEXNj727e2PrtUwNt9jUtJUPWGXZD7oPS1PFX9LdObCQzAVmCg8
         8qDQlfE5palZ3xpXJl2xWeCCg02xEK5nR1CZGxP0LR/x65ML7Rs0OfdLYztgR4Ep9X2X
         UJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z5h7LFoxnpUF1QJLIWeQTv8xjQamEarDi69cnxFQgUQ=;
        b=HiedwkZEqHgZwT70tjrnbiFijIwQE5OpIK14c1FJSsdEPAikVtC6f203wjRI3VMuT/
         kKhX1iICBK32DeN+7IjobKn7yIE7g2ONsBwjoDPkchNjC0Re6vMpr4fLxGXnzDnUs8ie
         h5pfgztQRc1J6q4kG+mH84tgWuREPpAcABFdNutwPwYwuKW55wVvmUKxiV83JCrBlI+F
         F3jA6GjvTNIsZzL6gV41IvgCt+Z+1a5/vmK+I+15YUIUz0Mek440FxL8iAf4JE8RJVQI
         J/1QayrvlrkcRVCydrGCv48R6bRa6+rDlTCS7YB2QqYNynMobNikVq8Ii/ad++PmxmYz
         GBLA==
X-Gm-Message-State: ACgBeo21XNctZ9rXGcS+5AtT3l6xmTgizCTuW24feZhwIfqWXrVZ5RiS
	NGRkxX4q4tj5CfupbV2wWpEEQxH4JXInKfXeUHM=
X-Google-Smtp-Source: 
 AA6agR5gcWb5NAV4VK+1pjavofUDu2WlVQyQJ5SweGyuBJfDZqY1DV4ob+bw1AwvKRsSiHlx1miP9gna7++dQY4zNbQ=
X-Received: by 2002:a05:6512:33d4:b0:48b:3a5f:e6e7 with SMTP id
 d20-20020a05651233d400b0048b3a5fe6e7mr5537752lfg.665.1659964863378; Mon, 08
 Aug 2022 06:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
 <22bce10c2755711b42b7a3bd0ce61705961c2552.camel@linuxfoundation.org>
 <CADkTA4NvmFOT+gW4z9Lx_2VMQ4aVSPkGcXnfTXDZ8zwD61G0ag@mail.gmail.com>
 <87a68d011dd53f284b7021a8d2a3858140ef2c4d.camel@linuxfoundation.org>
 <CADkTA4MhH1bmu1zMu1SjXfOuA7o8PnhQA-COOUzAhrY6q-d4Vw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MhH1bmu1zMu1SjXfOuA7o8PnhQA-COOUzAhrY6q-d4Vw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Aug 2022 15:20:51 +0200
Message-ID: 
 <CANNYZj_3o6es2F=mjY6Svk+Jt4tCqK43nnkgLrDVRGigwDNijQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/13] kernel-yocto: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex@linutronix.de>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 13:21:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169087

On Mon, 8 Aug 2022 at 15:12, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > This is virgl GL passthrough in qemu so not a commonly tested thing,
> > you'd need to run the selftest. I'm hoping AlexK has some ideas on this
> > one.

I'm running a build now, will report.

> > The kernel didn't remove x32 did it? That would make this easy!
>
>
> I can hope and check!

One of these days I'll send a patch to gcc upstream to drop x32
support (and not tell anyone here until it lands :-)

Alex


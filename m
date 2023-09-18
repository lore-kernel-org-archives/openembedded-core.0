Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59494C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 17:17:17 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.57482.1695057429441915349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 10:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ty+qAPLZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c008d8fd07so22291521fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695057427; x=1695662227; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QcZvGaMzYaPpUmrEFZdYu2urMmFBwGsAReAmEdks+gM=;
        b=Ty+qAPLZULZeaf+7166XF7SZIKrzXFZnjrGRd1vxN73ZHgdoOiCktHqPlXA6wtJtiB
         Tbou7SOqL8Sjndmx792TZ+blFnyQZpXiA6EbESCQdrtUhTRSx92oYfdXPBpPXz0H2u1u
         hjKaL51fB6McnV7UTA6TS4FTw+4mplVUnE2O8TJgPyC/So7G+8NB5FKVF+hDa+M0Bp50
         Iayk/+jX8MI07vslfqf9QZkIRWQLtnlrH+20F3nLiA8UHCv2nvbH0mInNCNHjUto1QX3
         wJ8khfFLN+AVl8GE1aBqNmUAjyPwsZVSuebzMuNVvugSW+pKpXjZ7an7pA47mLcCHNBc
         O13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695057427; x=1695662227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcZvGaMzYaPpUmrEFZdYu2urMmFBwGsAReAmEdks+gM=;
        b=MGaRrqAyiLXSJCBW6JjdEur7F+KW3u4seJUR/qosfCnH5vKRdKU1axHk2WZy9OZMrG
         XPr5fmnguu6tCev4xlrwT0MNLbwVEIG3n9sTuhJndwqxNVTxb4mNaPJc5Hf2ou/PIzb2
         lR8+0GV5CRUWUl/fS02Qp0oxjYZ8NLsnNL9A7VrCihymOK+1qC91Qrkci62/cVQYoaKV
         cNjCiiIU29qJot9Nk5812H/j/QNPJqYYWt2hYOucJZX1tg9YDfELXzY4V5cBM/YU/nPt
         xtsPoFMpKSwQzK83hH7RyA/PPi895Rs5SqVJ7h03r4e4WujhIYRbDGQ0283lNAghZthG
         yg/Q==
X-Gm-Message-State: AOJu0YyoRhdtLLaEEJBV1RElk4dw2p+ZxDmh5sgcvmSB/WS3bvNdcftx
	J30lbr2+61MQHIUo0lrTeLWpgQk3AiayT+UiYVY=
X-Google-Smtp-Source: AGHT+IEZu0c5gE6dC5Onp5oxQ0dAgMipYQ6KiddXXhMcJXyS0ih1NI4ohg6AxUrQFqBrmpVCqM/uB0khdugmpm042kA=
X-Received: by 2002:a2e:8044:0:b0:2bd:291:803 with SMTP id p4-20020a2e8044000000b002bd02910803mr8116218ljg.44.1695057427266;
 Mon, 18 Sep 2023 10:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <0101018a9a36c5d5-dcf81a91-7709-4c49-933d-29b6888c00ba-000000@us-west-2.amazonses.com>
 <071e06cc-37ab-fd55-aac5-a089bc1501b0@bootlin.com>
In-Reply-To: <071e06cc-37ab-fd55-aac5-a089bc1501b0@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Sep 2023 19:16:55 +0200
Message-ID: <CANNYZj9Sy+vMoOF5s9yHejT2fCbE1LhOtbxMEXqME4sPePyJ+A@mail.gmail.com>
Subject: Re: [OE-core] [AUH] alsa-lib: upgrading to 1.2.10 FAILED
To: michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 17:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187839

On Mon, 18 Sept 2023 at 18:28, Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe *alsa-lib* to *1.2.10* has Failed(do_compile).
> >
> > Detailed error information:
> >
> > do_compile failed
> >
> Ouch, as far as I am concerned, the AUH patch didn't cause any failure
> on Poky "master".
> After applying a fix to the alsa-utils 2.10 recipe, I could also build
> this recipe depending on alsa-lib 1.2.10 and check that "speaker-test"
> starts.
>
> Any advice for cases when you can't reproduce the AUH failures?

The failure is with musl, and I easily reproduced it there. The main
report itself isn't saying it, but attached log file name should
indicate the failing configuration.

Alex


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F98C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 07:52:43 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.15750.1661154756905798907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gzrRBhvD;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id be9so6166949lfb.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=wf0G7Cu4ruBB3eKA9cvKOfgoEyyijjVt/da3jamjD9w=;
        b=gzrRBhvDlDGOKY1Y5mpjrGYF2s95cCWhBkh3UGA5efRI7onRueJIeqNWZd/a9TJs4F
         KwvdvbYjEVJUmiP45RZ98eu2AMLjE02yVjKalEOwHukX+8fg5d1hGNoL2BgSXgDJTl5i
         HdVVyR2cJNbVHEcP75iO8QLbPm913e69pGjPvn6gshfVBMEYQZ6SyrDT2t+k2XuNc7rA
         VEohNIrF5Hyt3hf9zIHUJIDEplsKS3j1+rCpBn6WGsRPt6EOBroJ3MO3IC3ip4ROTVRI
         EeGBk37akUk22JYa90vbcJvCEqvzFZm3oJ2sbuhcrDm1AQtZz9OAdX1rIDy/fUoKNbeh
         8l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wf0G7Cu4ruBB3eKA9cvKOfgoEyyijjVt/da3jamjD9w=;
        b=vKbhzPcrFOPvB8ykBzJaglK2AbZAj98x2nMQpjDiRj5Gkjkt/0a50azTWhcTYxuPjq
         CWYqPOxahCsr+K2rQ0s7Iq+s8f2KPkM8tjIOyOSpK0+f1mBGZVTGZFUbLtSLHUWjTpPa
         KwJHg0w6VC6WEGM/LD/DFsx7tbLZM9eynHikQQi4a0bDdqNpLz93/Gb/b0o6op4W3LpT
         Vs+1oNlwHisvS7qcTR0AnmBCgv1O2aaJBx7HnqDiBmpDE49akSDl5kt65XBHmPC0+qw4
         u7RsKaIWvq88o+0UKYkVG+suGB8rmfkTKt8Of6x6/saFhpUun7g0OwfvTC01AVvaXrFS
         qMAQ==
X-Gm-Message-State: ACgBeo32IqFDthzJEE41yFT8nZgdiBToEQezLMhg8tdn4csD0OtCt44u
	/naMGHDLz76Oh37lBuGn05Xx4G6662wplKpe46k=
X-Google-Smtp-Source: 
 AA6agR6J8j0hZobVrFcab39gwI5W806nFnxiNEU54pHG1yo0Ar0xRhvr9pRQrOHNNWn/cnSzhfWf4ZnPEQo7OLD2pv0=
X-Received: by 2002:a05:6512:3697:b0:492:e5a5:648b with SMTP id
 d23-20020a056512369700b00492e5a5648bmr1053968lfs.521.1661154755075; Mon, 22
 Aug 2022 00:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220817131023.4093773-1-alex@linutronix.de>
 <20220817131023.4093773-4-alex@linutronix.de>
 <CAB=6tBQEuiwNq6W-qT6P6fcnGOpQtxH2cRDBd2NrfKqWrNsXiA@mail.gmail.com>
In-Reply-To: 
 <CAB=6tBQEuiwNq6W-qT6P6fcnGOpQtxH2cRDBd2NrfKqWrNsXiA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Aug 2022 09:52:23 +0200
Message-ID: 
 <CANNYZj_6xBA2_-MnURpVbRTDrNDa-4n-LDOub_u8AkW77BeHcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] scripts/oe-setup-layers: add a script that
 restores the layer configuration from a json file
To: Chuck Wolber <chuckwolber@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 07:52:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169662

On Mon, 22 Aug 2022 at 03:20, Chuck Wolber <chuckwolber@gmail.com> wrote:
> One feedback item I might suggest is to check if the layer is already pulled and to avoid pulling
> again. Same goes for the commit hash - no reason to checkout the hash if HEAD is already pointing
> at it.

The script does 'git fetch' which is an incremental operation, and
becomes cheap and quick after the initial fetch.
Same for the checkout, which is trivial. I'd rather not complicate the
code with additional conditions, unless
there's some scenario I am not aware of. The script needs to be robust
on a bulletproof level.

> Adding those checks would enable your script to be added as a pre-build step in a developer
> workflow wrapper script. Our environment takes a different approach to repository pinning, but if
> setup-layers had those checks, we could probably switch to this approach.

Please explain the details, I'd like to understand where the problem
is specifically.

Alex


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E46C77B73
	for <webhook@archiver.kernel.org>; Sat,  3 Jun 2023 18:21:07 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.2748.1685816462437683311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jun 2023 11:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ewjzL/5E;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b1bf74e080so4852701fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 11:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685816460; x=1688408460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5wp/TxSqbL44QvQtoMZAe6JRjUJPpGPFQv0uNvhbpVI=;
        b=ewjzL/5Ey1TRSB0u8QhYYhqI8/XqeztSGNPLT31Pey/rtMaGQAHPxewHuPYUmcEFyQ
         YIAhiLW6hJkwu6pqXJO6K1lyfGOXAulkzFsowcQUZXkyOap6CtkGkRN3VbpA9kc7NVXb
         xYkUb5qUc1t9u+FGP22KKOyO2ezYCyDkG7pR6UhoWww/Wo8ose/woOgUUhWrm18nx06E
         dLg/bLVTZyuSL01jQQRK5PnqOH9K/v6oM5MFaKPt/7zXqUI8b9hv8Ptr3mfvQtN5/pap
         lb2IejjP1TbCiFkPuu+Vb7V0BRjyCrIthRY07IL3BdxPuOh5sinJW9VlQrvRJm+E17Ev
         hvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685816460; x=1688408460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wp/TxSqbL44QvQtoMZAe6JRjUJPpGPFQv0uNvhbpVI=;
        b=gKF25TwUWpEI01wiMrGAAbk96c4tQIr3JRpTe4Yg2d5uDNy29xuXtE04qm+d17eN68
         u3q8XQrTxT5L1cUoBf8s1rfK4rdOEDJ1DTvzBxeHsoBA5Ciyo0OmLgiun+izEgPPiGc9
         13Dc5u/vJv2jNpBjv7aRM+aX/lVd5ZVb/JtkfiW1XqJne8x9kPDc+0hFhe4K+GFu8vz6
         /lu2VqoHJ7qrwoXhJUdUDCx9HftoaaWwvxtAkuc+bXyrDBzz/ieKIJp3t/6B+ODqkBig
         SYcJgoHYUr0ywN3Aqo3qu41V3P8BVY8XJdRJK1gqPAonvxkKuqHd0xM8nCVp56k3jS+s
         2Q9w==
X-Gm-Message-State: AC+VfDy5dcmeMuLQtFpn51piToE7nF9RfnCBGPBzk6J7tf9xLus0RuOM
	vD6M4++XEcnC5qgAo2ZQjW6sSMs0VplAG4znc5k=
X-Google-Smtp-Source: ACHHUZ5AB6nA7zWybJ+FgGceNYxoIb/ehSbz0g4fg09gY6SjY2J74UFuLDnUUNcBsn9PPera0oBnKL7mNPOIi+4ScUU=
X-Received: by 2002:a2e:7d04:0:b0:2b1:bbca:349c with SMTP id
 y4-20020a2e7d04000000b002b1bbca349cmr605075ljc.12.1685816460389; Sat, 03 Jun
 2023 11:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230527133252.284132-1-f_l_k@t-online.de> <20230527133252.284132-2-f_l_k@t-online.de>
 <17635252DFD4EDDE.6918@lists.openembedded.org> <CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
 <VDGDVR.YBUKQ953M2TP3@t-online.de> <CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
 <POIDVR.URDIMNIKV0SE3@t-online.de> <CANNYZj-megU_4p_eR84XiSt7YvwWu57tWBEZDKoBFkjRj8ZKVQ@mail.gmail.com>
 <MEJDVR.WDZW7MFB3W9N1@t-online.de> <CANNYZj_-ptiJqvmf+cU0qV7VkKG0ds=guN9aTU1VirjcG8WjQA@mail.gmail.com>
 <7bb5f101af77af3a051a1b049206800aec542ccd.camel@linuxfoundation.org>
 <ZG5FVR.L4YKBKAES08S3@googlemail.com> <0718565165c8175882355d0674588f71c36b8bb7.camel@linuxfoundation.org>
 <NYUOVR.OW8C8JU503CT2@t-online.de>
In-Reply-To: <NYUOVR.OW8C8JU503CT2@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 3 Jun 2023 20:20:48 +0200
Message-ID: <CANNYZj_UKMM6P4tk0eXjGFiN74tYqM0XZCUUJwK82LD0St-hRw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 18:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182352

On Sat, 3 Jun 2023 at 19:52, Markus Volk <f_l_k@t-online.de> wrote:
> I had some time to look at this problem. virtual/crypt-native is not installed into recipe-sysroot-native because of this entry in bitbake.conf:
> ASSUME_PROVIDED = "virtual/crypt-native"
>
> Removing the entry solved the issue for me. I could successfully build core-image-minimal for musl and glibc without crypt.h from host machine.
>
> But I don't know the reason why this is ASSUME_PROVIDED, so I'm unsure if this should even be touched.
>
> In a second step I created a musl-native recipe to be able to install musl crypt.h into recipe-sysroot-native, but I'm not sure if this is necessary either.
>
> https://github.com/MarkusVolk/openembedded-core/commits/virtual/crypt-native

I took a look; I believe this is by design, and for native recipes
crypt.h does indeed need to be provided by the host distro, and not
any of the recipes. This is where it was added:
https://git.yoctoproject.org/poky/commit/?id=29f65bda6d2c

Alex


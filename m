Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CC9C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 19:30:18 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.3365.1724182213955505127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 12:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tw9zsRM9;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f1798eaee6so55313191fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 12:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724182212; x=1724787012; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=meVveenc6XAh/IU7/nPgnIwpFMLcbNs+uc8Hg8v3ciE=;
        b=Tw9zsRM93XPciKnsnTpnEZOCJNawTd3Py1mLoql37yXtTOjBuw3uwRcKaxWESDSHl6
         dv9ETx930+gHzojY4rFoWI0kc90djxLWDB6b4b5ZNjGcb28uathigri0z2XFJ247Uyj9
         Sn26WnMUc4l9C0UDCTeqD9PBFdnDA849dUZq3bjoNq1QSJ1Z1cWxGLfnpXTLtPKdhjfX
         POnayr9h2BZaLBC60G9c2ylOAMAzE0w8AjVYyc6ZzlzF2q2pdPbnxTEIxF7T4tX720vm
         yjmcG0v+PMpp2N/zQCPBtPqn20jnLD9/ohbRor6/LndPoQC4BtwNJCbIRTKi4wigOnBQ
         5MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724182212; x=1724787012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meVveenc6XAh/IU7/nPgnIwpFMLcbNs+uc8Hg8v3ciE=;
        b=GdLBz9dBb7VI0Wkjnf3FMfq7GRAIcVRMDK0hubxy6Zgi0nrxg6nTGHPhbhRW173Jed
         MYN1g3VHnWs+KYAO7i7otAoR0tj7BNDhxFsBIsyWdu2gHdW+g0Q/6NMRMfobYJHHgKzW
         86QTx7U+1OV10M/exj8wMApSwv5J6deddrNODhEprtJ480L4Cj6FD5pSnn33LwDGW42g
         FhIqicblEXK3LLp+b+jBBvEvzKLXMFu4vE3hgLuOoi4oOKjxFVvBUvAhqClanYcz2St2
         zzLMY9ZfHwRcgZ/dej+pJO6xTwAWR+eVqt72niEAdQifsGuifZOuNwsr9zonieV9ut6G
         CEug==
X-Forwarded-Encrypted: i=1; AJvYcCUqdsrjK11TVBYZCqMxwOm2H0k3oKQ3s72qfvJQKlH7qstV9bkYTErFM1ObJJDkFGCGEN1AdgeKH9ExgDLldOWu7g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxeLPDPveLX7Y060LCxdr5eNYEn095e20bHleEgCjGnWn43Gm0D
	NqTNVRT1ggZ4KAqj0Wq1tBypG5r845loMAIlsOy7MVl8NSgNeVQBBB8YyovhNoe5WiRP6YDLtPV
	LGIjAsm/yfLBaO7CpTabwIxKquJY=
X-Google-Smtp-Source: AGHT+IF5keNECGEN+alWWvVtP+436kQXw7uqsXfBNyqoQv4MpaN4ECskYqbEyx4OC4Ewnbe65zDA9MH+1TvaAmvMIVQ=
X-Received: by 2002:a2e:7a10:0:b0:2f3:f5e0:1a16 with SMTP id
 38308e7fff4ca-2f3f894d13bmr155391fa.38.1724182211470; Tue, 20 Aug 2024
 12:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240815140736.3189704-1-tgamblin@baylibre.com>
 <2024082016241749789ab3@mail.local> <4a465e4d-9cb5-462c-929b-1107e5e227c0@baylibre.com>
 <17ED7F9EA2077539.18027@lists.openembedded.org> <CANNYZj_=bBn1tuTjuL3Setj=CyJX56g4qRc2FoFXpj+0-XR=jg@mail.gmail.com>
 <1b2a0a57-db8e-43ae-ac59-27c3678391b6@baylibre.com>
In-Reply-To: <1b2a0a57-db8e-43ae-ac59-27c3678391b6@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Aug 2024 21:30:00 +0200
Message-ID: <CANNYZj-FLW1Mqp=U8D67gpJupgP8rbSzF8FhQ31stb3m9hhD-g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] piglit: upgrade 22eaf6a91c -> c11c9374c1
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 19:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203566

On Tue, 20 Aug 2024 at 20:39, Trevor Gamblin <tgamblin@baylibre.com> wrote:
> PACKAGECONFIG[x11] = "-DPIGLIT_USE_X11=1 -DPIGLIT_BUILD_GL_TESTS=ON
> -PIGLIT_BUILD_DMA_BUF_TESTS=ON,-DPIGLIT_USE_X11=0
> -DPIGLIT_BUILD_GL_TESTS=OFF
> -DPIGLIT_BUILD_DMA_BUF_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
>
> Is there a cleaner way to do this?

Maybe, but such fine-tuning should be left to people actively working
with this configuration. If you just want to update the revision in
master, you only need to ensure it builds, and AB tests (if any) pass.

Alex


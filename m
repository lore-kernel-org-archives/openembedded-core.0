Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0261CE7CFE
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:36:28 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.77406.1727775382869075899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 02:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZMzTtWnC;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so24097991fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727775381; x=1728380181; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGw4c/R/9l8vWWArz0I47MIHW3k6s/zUpiLhRF2emA8=;
        b=ZMzTtWnClcTd+DKgj9uC12kElef9gKnpud3qcK+OVl9n+RZaG4K90DBOyX1owmlIeU
         hjVUkMH9M3hsJrhnplBVpjkv7Jz8L2kWoo8YMXWe08MJsEFf6Yo4onT6atJaJyr56u2M
         0QllXWUUYI0dhLbFfRP25JgLCwSaLLGTs7KP1bGumOvopWvPtwi8K0h+0BCVktgjnv8a
         +5JkF4ns3LjYAOYkPMh0ZXvPUKBYTMiPOGv5nmhYvdBkA4sfe4W8mIzwoxW4HXHMV80I
         YMkkZD6gEJx/ijet7hTPhj15QrhaHoZffRSbFLzPjLsiLTmmQ+9sSce462Fcs0Z5NKux
         xqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727775381; x=1728380181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGw4c/R/9l8vWWArz0I47MIHW3k6s/zUpiLhRF2emA8=;
        b=NUJXLZBwafqF+0LdYHHlEXpWc11mF6lkr18txRG2FqAgCxbI/bdEhpehFS1V9jKkZS
         cAnEeSAy6w/Epb514667ArKbCr8WuHyCAu3bF7NI+5fgSBGONvdsnj+TbIOW5I8wznpX
         qGjtGNLYFe1/oR0ezEhjJLfw+F0ZBKwc2grmNWeE0mwQZV+1kBBiRkiK3KEn1k9b5Viq
         MtacFb9hfqVQKntps3Z5fGPjHu0Wd1EwDmqyGVEUVfInxxMFhAQwldpD4diINYgRqQEe
         gyNpeKOzack6MFoZFwF7ZkiM2+3Dd5m7BI29MyBmlHaFd+cYrQCri+v5GlvXXsp/0mBv
         k+dw==
X-Gm-Message-State: AOJu0YyBesb72KT9ZcvoX0U3FqKU7Aoftfx1e1kLj92PLISWE9ZdfGTI
	nM/GwVhEOSTgwPL+OpKI+jP/Kk+4imdk+caBXI/naJlGNKt1g8yWp9RJjp48fcLH3ca72gaevW4
	Prpz3Wh48hh3Vym66mgtjnPJULoM=
X-Google-Smtp-Source: AGHT+IEnWzMKBWgwKTb6wv/hnw4pXMt63USY03PdzB8IBzXe7tKJMx4jOLDAtuWfFzjnTQA3fTkKevQrkLSYbdBTN/8=
X-Received: by 2002:a05:651c:b0c:b0:2fa:d4ad:f4df with SMTP id
 38308e7fff4ca-2fad4adf732mr25188821fa.7.1727775380526; Tue, 01 Oct 2024
 02:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240930091015.21148-1-yoann.congal@smile.fr> <CANNYZj8uwvjD3kLRP_YmsriveP_1kjWQpFzwTRfnoQoU8w5rrA@mail.gmail.com>
 <f6f743c9-89ea-4831-a03c-7b88fa403489@smile.fr>
In-Reply-To: <f6f743c9-89ea-4831-a03c-7b88fa403489@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Oct 2024 11:36:08 +0200
Message-ID: <CANNYZj8gk8W-dB2SEq+pJN0vxXkOR2KsH0AiLROK5FKxAi43YA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] reproducibility: continue testing in case of
 build failure
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205150

On Mon, 30 Sept 2024 at 16:49, Yoann Congal <yoann.congal@smile.fr> wrote:
> The problem I'm trying to solve here is the reproducibility of meta-opene=
mbedded. While oe-core world is always buildable, this is, sadly, not the c=
ase for meta-openembedded layers. In order to move forward with its reprodu=
cibility, we need to know the reproducibility state of as much packages as =
possible.
>
> Do you think that goal is worth making the code more complex? Do you have=
 a suggestion on how to approach this? Making (and keeping) meta-oe build e=
very time is the goal, but history shows that it is hard [0].
> [0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155

The real problem is that meta-oe isn't built in lockstep with oe-core
changes, and regressions slip in all the time, and are fixed after the
fact through heroic efforts of Khem and others.

Maybe the new AB setup will allow including meta-oe builds into a-full?

Alex


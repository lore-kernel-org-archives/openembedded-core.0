Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797C1C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 10:05:02 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.28894.1701252298239011055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 02:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y+Gnk8gt;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c9c18e7990so2992321fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 02:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701252296; x=1701857096; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lrckfoBPOHLTndn25AZ4JWjIolSCffUDvC+zM1U+5AU=;
        b=Y+Gnk8gtWYSDz7agM3J5jY9fR7Ab6aLvdrK0O/tTngN9qMwLgOw3em5CPZAwFemO0e
         04BWUrYzTPWhNjIb4gbdWhjqx2pjdedh3ecz9EOqtDJQIzBlIhKTjoCe1EIFBKzF6k2I
         kxY8lP7kLS5gdHJwmyM4A55FwSXf79hf1lnepVID1RBbQYnUSvmqminLUCVol4AtSiyC
         CAAy6nlAGA4LQ40gHbsoMkYJ3yW5nqKOb6iE0FA8m7JKxg8gAAslu5wtsmxLwA4eokbU
         /fsi3n0rQInKjCKGjzQ37vmMEpgViyGe4cMA+ESJX3yp2AxWfJGqeUyH6xistA0jYKwQ
         cHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701252296; x=1701857096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrckfoBPOHLTndn25AZ4JWjIolSCffUDvC+zM1U+5AU=;
        b=WC2g7mkWwFchuaCKsZJV8WPTiB9FdprJ8BkD1xMd8t+TB0QjONQ8xtHjjBydlJOsi1
         6tWmgrV6wN2ElAt0cty6LpLBT8JZzeBVj9u4Uk5jP/Dg1ewNpNSeQoQsPmAe7NXGRfa8
         HTJp78kkEEHqi5GjaYVF/WLMbiEB1dPHwEVIz+Raw2I36LLkp9jF0Rg+DtLeeMRbb4Be
         fvUewxLRzorEWviU9/RTZKhc2SH47u7270wF9O9BIJqrokLUOX7gpmABz8k/muVeTp9Z
         Hc5eeLJcseXy0aCqMoNrmIKjFHWRthiUqt2h+CI2dWBtS1SNeo5zXqYRZHb39YSi9xYx
         ZwAQ==
X-Gm-Message-State: AOJu0YzgzT9fqI9u/rii0kWFENjKgj2LoHWymz+12qp2Q0wx3tv6HcSw
	xxyhjF35h0n5NrgB6rwIdOG654hsHGkbiTvCU+I=
X-Google-Smtp-Source: AGHT+IGmhjIQYe7o3xVzC8uNt2Fb9nzWwLGSekPsqcaxSi1r8ZvbmplqqH3UVatS0KwC4bjZZ1Yi05YoBu/5tB7wwxI=
X-Received: by 2002:a2e:9cd9:0:b0:2c9:b972:d2ff with SMTP id
 g25-20020a2e9cd9000000b002c9b972d2ffmr1990671ljj.45.1701252296140; Wed, 29
 Nov 2023 02:04:56 -0800 (PST)
MIME-Version: 1.0
References: <20231128224743.2854095-1-m.felsch@pengutronix.de>
 <AS1PR10MB569750733E9544DDFF316DC0FD83A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <20231129093610.34gr6zwe26xkiyii@pengutronix.de>
In-Reply-To: <20231129093610.34gr6zwe26xkiyii@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Nov 2023 11:04:44 +0100
Message-ID: <CANNYZj87m=2M6mvhybSTM1iTyZAYCjmkSZ2UcT35QtB5RDx9Rw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] json-c: fix icecc compilation
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"yocto@pengutronix.de" <yocto@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 10:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191436

On Wed, 29 Nov 2023 at 10:36, Marco Felsch <m.felsch@pengutronix.de> wrote:
> > I don't like removing WERROR unconditionally which decreases quality checks.
> > Can we do it only in case ICECC is used?
> > Something like "${@'-DDISABLE_WERROR=ON' if bb.data.inherits_class(icecc, d) else ''}"
>
> Good point, but IMHO IMHO Werror builds are for the project itself. It's
> not oe-core's purpose to check each package that Werror builds do
> succeed else you would need to enable it for all packages.

In general we remove -Werror wherever we see it. If all components had
it, every gcc version update would cause an unfixable mountain of
fails all over the place. And version updates for the components
themselves would cause non-deterministic native fails too, depending
on which gcc version the build host has.

-Werror is something components should run only in their own CI.

Alex


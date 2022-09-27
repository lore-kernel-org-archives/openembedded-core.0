Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3649C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 11:51:13 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.9973.1664279470173038416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 04:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=gHR6/etN;
 spf=pass (domain: qtec.com, ip: 209.85.222.52, mailfrom: daniel@qtec.com)
Received: by mail-ua1-f52.google.com with SMTP id c23so3467224uan.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=CGs5f2jDV2BUZD1fdW6KfYuKmj+OqPFk+rSF5ID3Fxg=;
        b=gHR6/etNJRMlSTT70pFxrTA4cAuf4f+En1xazCT0LGilRd8ybKTyF/xZdvWadLJXUW
         qdcytU5bgg3vU3mCJ8guSWqX0B5yzXbEXbZ2v+h5PRHsrA19MgRm6IM5Tdp4wGkEyvad
         +rrdNfDZdxdBc+RO0xpmyN4adEZCg0PpiODKayg83we994tEgJ1GbN6KMXPFl8I0qzXM
         7JXk7tRlpxrInQyKOSTqd9SUUrp7xGLfyqXLrJJlh0huZAIjCZitx47cJurcsXuvjq+J
         EMflhw4gzT6uY5YUe+IU8PebS4DIYTOWPJ2TzbkZSZOkKp2l7aaoB8ZqZE2EEtkDxEir
         XaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CGs5f2jDV2BUZD1fdW6KfYuKmj+OqPFk+rSF5ID3Fxg=;
        b=NFeGkD0i4FRt86rW61JkDy2KjNkwGvGmIvoCTfmVJ/bofkGV/gY6rxYIPLKWBxQZ26
         VAusWG6LWHVDM2qq0dNoqWieB/ijvFban46ceXAqFV3osTHgGhkJ2zDV2KEcAZmwnnJ+
         qox0vUatGdPY6v6zLV74xmICPh1AUS001lXuULb1gOaSprL7/2U1FN0qpKhMimCoZVpY
         Cx+FXSplOYehuiFwXNsUgW6itFzSj+jwI6AvknoknNiITCJpi+piI/nQ0/6YGRHHvEMG
         OZnUZTllpOmH1jGxyXNsezHO/L1/jxu11sVH5VVUBvoVTFKyE1/axWwESeupgWrcaLE6
         HcUw==
X-Gm-Message-State: ACrzQf2Y3h3J2+Ki0h2+BZuLsyeMGGQ7V4BL24/ckAib6JBJ8E8R0JtH
	oGyivEySVS1HWgfcS1Qf7ZmujarL8P1D471+Im245g==
X-Google-Smtp-Source: 
 AMsMyM5kvnNCSmhCWz28TlhNmtsu1OZTVpJfWk24JHCSGipPcuGB64CT5VhknBrvxuo0bBomuafLsyNPeHZNfu+Kwog=
X-Received: by 2002:ab0:1c0c:0:b0:3d0:d782:4108 with SMTP id
 a12-20020ab01c0c000000b003d0d7824108mr1168948uaj.40.1664279469219; Tue, 27
 Sep 2022 04:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220720194416.89631-1-daniel@qtec.com>
 <8B7B30C0-321F-4AB4-9105-894148FC9D9C@arm.com>
 <f8a73d8f5126aab9d1b9b2c145ac6be0edbf0967.camel@codeconstruct.com.au>
 <258A1233-0D8F-4A61-B976-AE5D4A1516C5@arm.com>
In-Reply-To: <258A1233-0D8F-4A61-B976-AE5D4A1516C5@arm.com>
From: Daniel Gomez <daniel@qtec.com>
Date: Tue, 27 Sep 2022 13:50:58 +0200
Message-ID: 
 <CAH1Ww+R4iC9k7mHS_RJ=MxyJVbo7oEAKmTzP9LDn82-htPfN0A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] dropbear: Enable x11 forwarding
To: Ross Burton <Ross.Burton@arm.com>
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"dagmcr@gmail.com" <dagmcr@gmail.com>,
 "yi.zhao@windriver.com" <yi.zhao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 11:51:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171095

On Mon, 25 Jul 2022 at 10:49, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 25 Jul 2022, at 04:11, Matt Johnston <matt@codeconstruct.com.au> wrote=
:
> > The upstream method for Dropbear configuration is #define entries in a
> > localoptions.h file.  default_options.h should be left untouched.  Addi=
ng it
> > to CFLAGS for configure would also work, as
> >
> > ./configure CFLAGS=3D"-Os -Wall -DDROPBEAR_X11FWD=3D1=E2=80=9D
>
> Perfect, thanks Matt!

I've just sent a new version [1] using CFLAGS but I think I should
have used localoptions.h instead
as that will match the upstream configuration method. What do you
think? Shall I change to localoptions.h instead?
I think that should be a more elegant solution.

[1] https://lore.kernel.org/all/20220927102904.722281-1-daniel@qtec.com/
>
> Ross
>


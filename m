Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3544CC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 14:05:35 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.12023.1707833131146588552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 06:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZMfurNnW;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5119da22560so475076e87.2;
        Tue, 13 Feb 2024 06:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707833129; x=1708437929; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TU9QnFWD8fhxxrihDxmvUsNnMbkco9+vgYCYgeEPSmo=;
        b=ZMfurNnWISL7vjTNlbliyBTmTyjbZC4d8knvtxEwjJP7oWUmeaVB7oeDC3vuzxxijn
         jGVFyDDb7evzoRyUyzx+VCZvjaT5kd9O2owPe7DpHskJf6gZg5AaoSHNR70RK2HmGG1p
         bkFTjU+5OnYF+ywH3KRr3J+49TmQ8ecHDRNaqo2o7twHVDIdcuoKNsMREgD5EwwZKodl
         4g7VMKRmZlkpblJyicEsFjfvskjSiZIP14bnojM44k4sSGB1pgXCCVnuBcqnwUkMUWr3
         hOot0QWKceLfvH9h6ttgb+xZwXDEt16wlvXAqR6u+x/FzSM6/klac/XooodS8A4v1Kt0
         Vg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707833129; x=1708437929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TU9QnFWD8fhxxrihDxmvUsNnMbkco9+vgYCYgeEPSmo=;
        b=Y5WThj6i06VRdVZaHqB0k6hmf1LFW72At2orurQcDdjfGUZfgVxb/tNLDg4MAj2ufY
         hcyo9DvB40cLSApo/7ueaRErj1TzZPdphuiOV9WbPCh8L5NUSDujXMR/Fquwso0AcHnT
         rqiYbSRyKdxsUB3g4PPMS0Njc4T/IsS6Jeqq9MJ84NXi0+lc8ziDaj1t6xhZIYnHbeFa
         uQvGSgaPZZxlzeGB26L4m38YdVkDJivchKp1OM1w/LJjql5D7tnQJBEYdQSJfPqY8E/i
         5oK7TmJ/VU+HIHjgy0M6ysfn99/geX8HdE6VCDf93euFIi0PUutLX6Xhm62+Qlqys47m
         7Dpg==
X-Forwarded-Encrypted: i=1; AJvYcCXojLEqCZAJj3wrN7TZn23D3RLOl1N5Zg0Gc5/F45woEnqyjik3ANOgYQqs1sp5yRfxGsDUG6r6sxMYeFnCLXSUrfbnlR9x/6eK1WoNW5DiHmM6MmiCcOmftGXKs81kDaxD6MOps8kKP4pTy61PLo8GG0YRqZnCYOr2nh4DM3Fqt9du2Oe1bnXO/Wo=
X-Gm-Message-State: AOJu0YxuqMrwZR4uhEi/VPOOLW6+Ajju2uMLkLRtflhKKXaOofRo0BJc
	mlqKYUBfQ0mvMKDv8VUcc1Bcn3SdoMWVLp1nh4eob+BzkeLKCDTLsQlJP7xDZ3GicFWu2ljSp2k
	lIjrPQQmIiD8GoX5lHrVuiBUTdmo=
X-Google-Smtp-Source: AGHT+IG21yPxcm3hkvEhWDsBSwk+IQZAA+VwhwHq/Lwi/0CJ+/t2T3L9qkyotBP9ueNR/QYA08HGMOIgke1pg57e2wE=
X-Received: by 2002:a05:6512:138a:b0:511:8cb1:7c9d with SMTP id
 fc10-20020a056512138a00b005118cb17c9dmr5897156lfb.24.1707833129259; Tue, 13
 Feb 2024 06:05:29 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <17ACA59E7A7FD97B.16230@lists.openembedded.org> <CANNYZj9X5qRSup7i9S=rtRpwo5nCNHp8VJOZAuvu5JzqhLYD_g@mail.gmail.com>
 <f1c9d0f8cbf8ea1972aafac0c29690ca400178d7.camel@linuxfoundation.org>
 <CANNYZj8tyOy=z3L=uM9L_R8uP6eZSUkYXm9BwvsU+ERpE9QcZw@mail.gmail.com>
 <018185898b86e2fccabf68570a6aec6039a0c6d6.camel@linuxfoundation.org>
 <CANNYZj_UMqZe+hDs2RzOPaLZzRmyg=8X74+HCwytN5616jZgNg@mail.gmail.com> <e26e53be93a4f34b75e3e66becbaa4c6ac15133d.camel@linuxfoundation.org>
In-Reply-To: <e26e53be93a4f34b75e3e66becbaa4c6ac15133d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Feb 2024 15:05:17 +0100
Message-ID: <CANNYZj_GFnmvmYRNGBFkivTNY7Xi-Ok3GoDEJ7+wO3A=fW3JQg@mail.gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195401

On Tue, 13 Feb 2024 at 14:44, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> In theory you can start a local hash server and then report all the
> hashes to it?

Yes, but I'd like to replicate what bitbake does: check configuration,
start the local server if needed, and only then do the mass-import
from the file.

Alex


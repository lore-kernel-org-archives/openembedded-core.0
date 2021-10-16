Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F0AC433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 09:18:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.8843.1634375936472378734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 02:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a1/Z9ng4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id r7so30681834wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 02:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6e9ROL/+SBsGchAwgWu9I04RaLjm1dvMkBcPYNmVyUk=;
        b=a1/Z9ng4ES5PjEigf+fZJ1Lc3GS/sh7tW+jYfXpZu/XcgEXc/DkS8+IKhzMj2+B5HC
         yVnxJFrSxZ1D6ord0wUd9dL5kr+1sd2e9kouOknqf4DQ92kAEcCut6spy1NP0I1KU2Lz
         MpPMzM8uiV6uUup0V3iGqVLYW2gA2h4FKmON4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6e9ROL/+SBsGchAwgWu9I04RaLjm1dvMkBcPYNmVyUk=;
        b=hLKTBZxypBj4+6NO2A0IVJnK3FdXfHee5izKSO1Dy8++7m+cOFCmnAog4KtYQ9xm8T
         KdqFF7fHJNPza2P/FcsAlpctKNrI1Dzgq6l8FWIv4rCLDcFfSUn3yqeRVZAYNTIeoHzH
         GvS8vN8Fzb3ZnDbLZLHQOZ1LdvOwUJLi/5xUI0RsJlQJbLSW25Cx8EjyzwNhXd4R9hLb
         nc5R1XWdo0CbvE9+vtCguSAMIQ8pgRKkc1l2O80i6ulnRuu89bpUZTOL0dMAeuPrMjCX
         /Q82x5NySCkHUkFjTTtJzwO/eZzvNmq/OCnFtsAooN5r/7rtBX1SUR1xq2X+i2jPgVcu
         C6Zw==
X-Gm-Message-State: AOAM532KejNU8qHe6sc7DqUDtkSbzF7ddc+rxQy/VNNFZ2ZA9+rHEEKi
	XcC1nU/ZqjlapdL+oesmSdiw/w==
X-Google-Smtp-Source: 
 ABdhPJxUjzf439uza5YmnJlTJ3q97f/w04YufhfJUKaEfbOZgNAE0Hr+ArkR9h1Ir3lwgBnuC5VUuw==
X-Received: by 2002:adf:a411:: with SMTP id
 d17mr20829104wra.393.1634375934733;
        Sat, 16 Oct 2021 02:18:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac10:8c11:13d1:3cb9?
 ([2001:8b0:aba:5f3c:ac10:8c11:13d1:3cb9])
        by smtp.gmail.com with ESMTPSA id
 a16sm7013313wrp.14.2021.10.16.02.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 02:18:54 -0700 (PDT)
Message-ID: 
 <8ce841ccb955a926ad02668a257505492a5670f7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] populate_sdk_base: add support for zstd
 compression (and default to it)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj
	 <raj.khem@gmail.com>
Date: Sat, 16 Oct 2021 10:18:50 +0100
In-Reply-To: 
 <CANNYZj-RwGKeut0Lf2iecz-VvcMiBdLZ8TcZeAeKNN1Wn3O0vw@mail.gmail.com>
References: <20211015170630.1069043-1-alex@linutronix.de>
	 <5b92ee280a2f08291fa77a303d7b9edc98a61d30.camel@linuxfoundation.org>
	 <CANNYZj-RwGKeut0Lf2iecz-VvcMiBdLZ8TcZeAeKNN1Wn3O0vw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Oct 2021 09:18:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157012

On Fri, 2021-10-15 at 22:54 +0200, Alexander Kanavin wrote:
> On Fri, 15 Oct 2021 at 19:29, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > Can you quantify "more"?
> > 
> > I'd be interested to know if a higher compression helps and what the
> > time/cost
> > tradeoff is too. Not sure I'm keep to have it increase in size. This likely
> > increases the eSDK size a lot too?
> > 
> 
> 
> The benefit is indeed not unquestionable, hence the RFC.

Thanks, I think we need data to be able to comment effectively! :)

> 1. The eSDK is mostly made of already compressed sstate artifacts, so the
> effect on size is minimal and the zstd's time benefit is clear:
> 
> $ bitbake -c populate_sdk_ext core-image-sato (to have everything ready)
> $ bitbake -c cleansstate core-image-sato buildtools-tarball
> $ time bitbake -c populate_sdk_ext core-image-sato
> 
> xz time/size
> 4m46s 1.7G
> 
> zstd compression level/time/size
> 19 3m4s 1.7G
> 10 2m44s 1.8G

For the eSDK this looks like an ok change.

> 2. For the basic SDK (bitbake commands are similar), xz's better (but slower)
> compression does show clearly, but zstd's time wins are similar : 
> 
> xz time/size
> 5m20s 581M
> 
> zstd compression level/time/size:
> 19 4m5s 837M
> 15 3m44s 979M
> 10 3m22s 993M
> default(3) 3m19s 1.1G

but nearly doubling the size of the standard SDK isn't going to be well received
by people using it, those numbers don't look like they can work even if it is
faster. The key things are primarily size and secondly decompression time,
compression time is in third place and unfortunate but something the build
systems can afford to pay.

Cheers,

Richard







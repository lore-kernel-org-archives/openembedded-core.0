Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C936C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:40:29 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.72087.1744108820857313836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HT6adQt9;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b0d638e86so6525740e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744108819; x=1744713619; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h0HSHtWzLkDkqbHjDoqpGDqpMGMce9t0XrTHUZyelWY=;
        b=HT6adQt9MQlPFE527X54dJVKfkrUm848xW23KAV9wmeNnGSwond87SdXkaUJE/TcRH
         c5Fs9JKvKQFFWofXB1LKaJ0/2q2Q8JQDVxNVeyyhv6jcByuoVIvvdj+Cq8+gClnaOHHa
         TChVaQhAHlIIhnwQDEnWZ9rOIf7nWMDvYmwcOZQZIlI/iC7XOqeCjQuXlwDDCst3M85n
         IUfRYQi3XjJCOeD2F5hWbPoyuJT8EWUBOU73hPv8ST6Wk09LzAnL9WE1QWr6Rrii07CQ
         p5S+LUN6d7tPX+ZXL4l0wENxn4FpLMiBRKhhOlJtUBX+Ov1w6VAZq1hVhmZVCDCQNxFw
         9UKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108819; x=1744713619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0HSHtWzLkDkqbHjDoqpGDqpMGMce9t0XrTHUZyelWY=;
        b=FRG17PhVpzHzDIex45vUtZ2but79rffiFt9A6xjzAaccjHxc4l4O27RMYECbiH+GO3
         Mvm06CKk7ZF6Ylty6f739Q4guu3R26q8OL6YQ2yGUDrRRA4nRBXSPOjoz7LbRes8tFTR
         X6E07HMXGKGPphbyUjZsxhRjM5bKlaoJaCfRxCqNAb0yrcEuT2veZW0PYnrfbooNzvWh
         Ls1/PEyTfxEznK7t7Ym5OX9smj9MVZ9sX63BkkFCSBoYWf74rHpkxo1cXQomb2TT60Zc
         vETo4dDHDKrSxxUH/SxFPpJgkSgLzrKuBXGsqHGq5BiJLRd+/K3yq6HdeJKz2Emek6Hi
         h78g==
X-Gm-Message-State: AOJu0YyUnWiUE7C2frS7yEhTKRtAmRTzqzJ00pJMV+gM4s7KEPpQ4hMM
	F3+xoriDyUK5iSEmlr+pXWR6tHg6Af1vCUMGN1exC4r/DJ8jAEIWEHI71JrfQbc=
X-Gm-Gg: ASbGnctKvUFlFqz8BF0jpAtpdNmATskANsYw6fMlDz9fEfDp8akyseL0jN+dyoI+Qyi
	ugVn4/T7InCT4/fkiOch+ce6drg2ELvf8xk+3i2JoKNTVzTnBpVizZSkmLsKPM0YWQEtaWonQBG
	mwe0aaf6wk2D9rVk8vQO9BC53hlSP+TllGvjVh1hNUzrcd20zXeJSiK3fIZVQxoYbYt7cff4dM9
	SMB++DEKw/wuElFVn+uMYH4zpjz01ZsBbndiw9BY9BLvmFlfFr4UfCd88Pi6Z6ZdzYTUYo0CAZF
	3BTobMtC8K7TRSRk707uUdQj5PSJE9SZG/YBbbvfXu+thR+EO+2K0w2AiOt0CDwlIeIYxXjw43H
	ja6VVfFJWAPfL
X-Google-Smtp-Source: AGHT+IGJUTINSH+KcvRXnjnPWax8TvdiPgmQwcwTIj93ypef12NyADtMy7Z21x1cZalyrb77bx5Q+w==
X-Received: by 2002:a05:6512:3ca0:b0:549:8809:ee32 with SMTP id 2adb3069b0e04-54c22778719mr4440536e87.22.1744108818873;
        Tue, 08 Apr 2025 03:40:18 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e63e8c3sm1500537e87.158.2025.04.08.03.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:40:18 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:40:17 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] u-boot: set git repo branch with SRCBRANCH
Message-ID: <Z_T9EYnAgrjI_rR5@nuoska>
References: <20250404075136.385270-1-mikko.rapeli@linaro.org>
 <e20b2f4791b7481a018ce2c5d3cee9ede1a88fe9.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e20b2f4791b7481a018ce2c5d3cee9ede1a88fe9.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 10:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214525

Hi,

On Tue, Apr 08, 2025 at 10:00:05AM +0100, Richard Purdie wrote:
> On Fri, 2025-04-04 at 10:51 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > Enables changing branch from "master" to "next"
> > when building bleeding edge upstream versions for
> > testing purposes. Now local.conf setup to
> > build latest "next" version becomes:
> > 
> > INHERIT += "poky-bleeding"
> > POKY_AUTOREV_RECIPES += "u-boot"
> > SRCBRANCH:pn-u-boot = "next"
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ++--
> > �1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > index fc860248ed..9e96c46b74 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > @@ -13,8 +13,8 @@ PE = "1"
> > �# We use the revision in order to avoid having to fetch it from the
> > �# repo during parse
> > �SRCREV = "6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72"
> > -
> > -SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
> > +SRCBRANCH ?= "master"
> > +SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=${SRCBRANCH}"
> > �
> > �S = "${WORKDIR}/git"
> > �B = "${WORKDIR}/build"
> 
> I do want to be able to do this kind of thing,�so to be clear, I do
> strongly support the idea.
> 
> I am however worried about the implication of how this will scale (or
> not). If I merge this, I'm likely to get this change for many other
> recipes. I also suspect people will want to parameterise the
> "source.denx.de/u-boot/u-boot.git" url part too so they can use their
> own local repo.
> 
> I can't help wonder if we need some other mechanism for this. I've
> talked with Joshua about variable "filter" mecahnisms before which
> would be one idea. It would also be possible to filter the variable
> with some inline python magic, in much the same way that the code
> already tweaks SRCREV to add AUTOREV.
> 
> I did also wonder whether our mirror rewriting code could be used
> somehow...

So a variable for pokybleeding_version_handler() to rewrite
"branch" variable in SRC_URI?

That could work but at the moment outside of fetcher code.

Cheers,

-Mikko


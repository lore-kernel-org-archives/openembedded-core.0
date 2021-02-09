Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.12098.1612885594222547098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:46:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PcL7Ars5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id y134so3945278wmd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 07:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SuXpZ9ZsoXrQcgQxKDfBD0MGjja3PqG7AaWlVXKIOaE=;
        b=PcL7Ars5Zhu8pk936QI/r4OsypYGf2aDVcgA8WeNsvo9EPXXrY9grIJFTwJ+4ZGuuS
         LxmiLR0D/mGoGcx485xvxZjykbgWDwFivjI6bI4vv1b47Um8WST0pNAF9YgrhGb9A+VW
         FrUPsyk+EMF77tKKs76hJ71wxfymzcYemHNX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SuXpZ9ZsoXrQcgQxKDfBD0MGjja3PqG7AaWlVXKIOaE=;
        b=Qr9yQwzxMKkFthia402NudKvj/gOO7Ndj1WlvDdrYBCpD0nNmbGLSMG0q+Ym4Sa0rG
         IChDHV+21MBl6j0R9tiGp95fhJa0xmP3AHta7cvp8f1AQD2aYvAM+gYlsfFJnOtR2m25
         e1q1dOvcYsIUdeAaOboZaB6JCrKMiEVlr0X0fKFWS09rxd1ylafvuIhWsOHMkRekVvjj
         x3iCJAGNkGiPzlQ5IvkQw4ypjXsWBwnVY3gHJvBZC3RPdnJhbZ+3LP/fflyeOZzdG72z
         cgno/fwDKBaCxspAebA8QVCGJrjzvAqB48GigwjADjXh6OBPHCqpW7wJDNFvJIr96cfk
         fbQw==
X-Gm-Message-State: AOAM532rq7rBOGnWevB+aq3yeos4M7HKAvNh6U0Ltk+PTh/RYOE4XpRE
	1CO/UwD2yZUnr+u5o53i2OuAiA==
X-Google-Smtp-Source: ABdhPJwWMEBjixLb6CFjzaqEmp9TrCFCR79Z89rwTXDXPlazNPFf7NpfnDjd0DupidJO6kWcWvKzEw==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr4077367wmj.182.1612885592732;
        Tue, 09 Feb 2021 07:46:32 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c? ([2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c])
        by smtp.gmail.com with ESMTPSA id d5sm17608224wrb.14.2021.02.09.07.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 07:46:32 -0800 (PST)
Message-ID: <1e96542badf8a0e272bb9d1456509976c89695b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] license_image: Introduce SKIP_LICENSE_MANIFEST_RECIPES variable to prevent from trying to use license recipeinfo file from image recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Feb 2021 15:46:29 +0000
In-Reply-To: <CAJkqNs17+aUbbqg+Yw9HM0nKMXSPw_kri7Hho4eDeHOh1am8ew@mail.gmail.com>
References: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com>
	 <f0c6dc4481894031536eda836d13510ae919935c.camel@linuxfoundation.org>
	 <CAJkqNs17+aUbbqg+Yw9HM0nKMXSPw_kri7Hho4eDeHOh1am8ew@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-02-09 at 16:37 +0100, Tomasz Dziendzielski wrote:
> 
> Thanks for the answer.
> 
> > I've been giving this some thought and I really don't like having
> > to
> > remember to manually add special cases like this, it sounds/looks
> > like
> > something we should really fix in a better way.
> 
> The other way that comes to my mind would be to loop over all
> dependencies and check if they inherit image.bbclass which would
> increase build time. Another problem is that we don't have direct
> access to other recipes' metadata, so we would need to prepare such
> mechanism.

That isn't something we want to support.

> > Perhaps we should just skip license files if they don't exist? We
> > could
> > perhaps show a warning if the match isn't for a recipe called *-
> > image?
> 
> There might be recipes inheriting image.bbclass that don't have
> "image" in its name (which is also my case). I can prepare the change
> to just print a warning instead of error if the recipe can't find a
> license manifest for any recipe, not only the ones called *-image.
> Unfortunately that way we could not catch missing manifests with
> recipes that should provide them. Would such change be accepted?

I think the warn/error issue isn't the real solution, "good" builds
shouldn't show warnings and this case would.

I guess the other option is to enable populate_lic for image recipes
rather than deleting the task, then there would be some kind of license
information available. Not sure whether that makes sense or not (and
whether it should be the image recipe license or the sum of the
licences making up that image is a secondary difficult question)...

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6932C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 23:05:13 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.460.1636067112551722196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 16:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QApd9rC0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso8342318wmd.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 16:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uf0zQNtv+FYcQ6MmTKTng5PFgbNsWyCU4dNC83OU4u0=;
        b=QApd9rC09VV2mXtC0rOVDaUzkZasPkbE41TOaUu5rJ+pV1XIp6gvYzlHbU2vgiRkDI
         MiqLjJ59AGSP8GUEzVT8alJDW/SyCdxYkQXiv46cHq88LlTfs4L++ceXJ1aMq0pD+UuK
         uWm4362IHi4/caKHM0HOJQK4w4zwMBUsyLYLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uf0zQNtv+FYcQ6MmTKTng5PFgbNsWyCU4dNC83OU4u0=;
        b=uG6YY8OWDeRjEsZd7uhpfM28L0U95UeCgV0R4lyjDubdoPUcHXdjpBDwTlyKShcgWX
         1ApWYvptUqR09pk2b0qEvVj4TSfAqFuz+SCY84sjUjN6A8z4e6aBtwpwTQv6tk7cC9Gm
         xOEGnFde7hoaWk+kXgDIgpSie2lOtI5YozFfUtgfnV+nfwMXFO3ChL03enpNjSDWEUcJ
         WrvyvmGQjtjWdAbica6sLFY13QEjamyDDECzxF3XrpGftxwNMeX4AlkYGW1yjoXzPFhK
         WAlYRlMGJFkZoIQQwsOMPAGUKI8RsGwH5eFvNkuDJaVKUL7nlQffqFiomHMA4/JQ0Tpz
         kUCQ==
X-Gm-Message-State: AOAM530+NM3PUrMak2uIxJYoy4aMAE3Dzm7lP/3vZTl1HlDhGpd2ODlT
	90y4+hOFgzTWZIwbj0CUOO/UFA==
X-Google-Smtp-Source: 
 ABdhPJwRjHUR154CX0bLygJMWWxUaVZuY7JKME/yOnx938cSJ/3idi/1IGJ97JB4QlDC69AOZbCE0A==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr26532860wmk.32.1636067110982;
        Thu, 04 Nov 2021 16:05:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:38e6:15ea:3134:28e5?
 ([2001:8b0:aba:5f3c:38e6:15ea:3134:28e5])
        by smtp.gmail.com with ESMTPSA id f8sm5223454wmf.2.2021.11.04.16.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 16:05:10 -0700 (PDT)
Message-ID: 
 <6eecd17728ac05da52a02d1d985ed2be006eb042.camel@linuxfoundation.org>
Subject: Re: Re: [OE-core] [PATCH] opkg: Fix poor operator combination choice
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Stewart <alex.stewart@ni.com>, Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 04 Nov 2021 23:05:05 +0000
In-Reply-To: <55a04e1f-b2a2-39c5-dbe7-d2fb06a7666f@ni.com>
References: <20211104140257.3622680-1-richard.purdie@linuxfoundation.org>
	 <YYPvsoYTwoCH3PRT@korppu> <55a04e1f-b2a2-39c5-dbe7-d2fb06a7666f@ni.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 23:05:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157878

On Thu, 2021-11-04 at 17:05 -0500, Alex Stewart wrote:
> On 11/4/21 09:35, Mikko Rapeli wrote:
> > On Thu, Nov 04, 2021 at 02:02:57PM +0000, Richard Purdie wrote:
> > > Combining :append with += rarely makes sense. Improve it to use the standard
> > > format (and tweak the implied spacing).
> > Maybe I'm silly but I find :append with += safer to do than manually remembring
> > to add the space character.
> 
> I tend to agree; hence why I wrote it that way in the original patch. 
> But I'm not going to defend the practice in this case, so ACK from me 
> either way.

There is a patch on the bitbake list which would make this usage a warning. It
certainly isn't obvious to most new users that:

YYY:append += "XXX"

really means

YYY:append = " XXX"

so I tend to prefer the later as being much clearer about what is happening.
Part of what we need to to improve usability is to remove some of these
confusions so standardising on things like this seems to make sense.

> I'm intending to drop this recipe warning after the opkg_0.5.0 release 
> in December. So the recipe-as-written will only exist in the mainline 
> for another few months.

Sounds good.

Cheers,

Richard





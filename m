Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0842C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 15:09:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.18005.1739372811100771791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 07:06:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TnlJfgnv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43946b5920cso23176995e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 07:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739372809; x=1739977609; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d/1vQkg8rV0XVgENekp25MzLlueor1wS311z4W8nAFA=;
        b=TnlJfgnv7erhTO4Rszu1vNKJq/fsIWc/m/FSzkvoIcOmg1+3uDPwsmnpRjetvkuCbr
         PIYPbyfBDhIWFop+WMcEu61yu3+2Sa4YF7fs++kmWRcGdSM3SL6BTcJyLHI8uD0dfS4z
         lR5/gN6DbPBwCNO4XOP7Gq3HM+7mAP2b/E6w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739372809; x=1739977609;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/1vQkg8rV0XVgENekp25MzLlueor1wS311z4W8nAFA=;
        b=tu4nHCqcjWMZuW6EaIzize7F2v1MO2De/WfguU/rdL8WnqdwyskBmuMxCR5Mw1ieIM
         fj6BVa/VZTo7+Fg2bAK9sR+K92RBtshso+mt4C/0I6ImxBKOZXYS4ewBFMFI/G8+SslT
         JEhjS4fIPGd0VtHAu6UXoHEejrr2pcRkPK2fwEQ+v59pUFLA3wXGehKoQ7RKuK2zj1Sh
         ioGK6EBpxI8IQMTmVxu2jb+GDBls0C6k0oiVcDVOS7vHQNmP6OLRACHdZVaPMWx1x4TS
         phV4k1RJ7LtcE0g7dZwL/iu/78EWMzXuV8RtTm+89O85FkKNPmxbrnEQ6V/lSX/E8Paj
         vfGg==
X-Forwarded-Encrypted: i=1; AJvYcCVrTAla3gc4mO2lQJM1CsHhRbVYkSX8x/5Smp1uB05aw7QyksJadQ0kFdAaRLMw8TRiCPI508vltNfnPmG0TDa8tQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwjpOLeQOjRWlbkzxY9HmON6aPx6BMYlSfdHdVDRBSfaGeuJWVH
	GazK5Q93Xw/FHPEIPNxeuoZptiEhQv+a4/lWYJQtLWo8WsdUofZbLCsQfx6I9xo=
X-Gm-Gg: ASbGncstE6JckqwAJlm3UQVpl1JvnlaCg9qN4dAPwey4b/FLbMKiJugmslW4X1R7pMX
	lQ+z9hB2PeMC6Vs/c4Wtdvp4pXBcQvqGYCCcXQHO4yqAhJnFr+EpMJ8AtLFAKSTG11O36YgDsWl
	l0lY4bT9IVFwSTuxVfU6I8wfBRyWDM+HCxdVyW6+0GOY9KJumSLdoNFOhDxn2A+Q/Vwr751JpcY
	fAHYBIdbw6jS+LLcFVGnFHrVcXvWsVT1KSTLnCmS7t7Igm50e/L+GOud6uy42agmjc9tDq9EbqU
	SyAePDUo03C27fjmdatv/p763K0QzRttBoasQOa1yz5GsykCWlu4e9r+uL6F88xyPu+mvBM7adx
	rGg==
X-Google-Smtp-Source: AGHT+IGMcGLYhCJvvS1+G86CikNNVkFqJ+q/5ErfPHFz3MxQyt5BRI80Nlk2V3fBVqfl9WRpF/gALA==
X-Received: by 2002:a05:600c:310a:b0:439:4d00:3ade with SMTP id 5b1f17b1804b1-439581ca5ffmr29838285e9.26.1739372809266;
        Wed, 12 Feb 2025 07:06:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:af16:73ba:601:d9ae? ([2001:8b0:aba:5f3c:af16:73ba:601:d9ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395f0451ffsm6751335e9.15.2025.02.12.07.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:06:48 -0800 (PST)
Message-ID: <8b9a69f0ac59c31a8048387a5ebbaeca92a966c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor
 cargo class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>, 
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Wed, 12 Feb 2025 15:06:47 +0000
In-Reply-To: <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com>
References: 
	<20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org>
	 <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211247

On Wed, 2025-02-12 at 15:36 +0100, Stefan Herbrechtsmeier wrote:
> My problem is the double standards. We support a fetcher which
> dynamic resolve dependencies and without manual update step since
> years. Nobody suggests to make the gitsm fetcher obsolete and
> requests the users to run an update task after a SRC_URI change to
> create a .inc file with the SRC_URIs of all the recursive submodules.
> Nobody=C2=A0complains about the missing components in the recipe.

FWIW there have been problems and complaints about gitsm. There were
some people who explicitly converted gitsm recipes into git urls due to
issues with the fetcher.

We have on the most part dealt with the worst issues in gitsm now but
there are still some who don't use it.

With git there is at least a relatively wide understanding of the
technology. With many other areas like node, go and rust, the tools are
much younger without some of the features we sometimes need, at least
in the past and people's overall trust is much lower as a result.

At this point I'm not sure there would be demand to change gitsm but
there are still the concerns about that approach.

> =C2=A0Whether we have hard requirements and introduce a git submodule
> support which satisfy the requirements or we accept the advantages of
> a simple user interface and minimize the disadvantages.
>
> =C2=A0It doesn't matter if we run the resolve function inside a resolve,
> fetch or=C2=A0update task. The questions is do we want to support dynamic
> SRC_URIs or do we want an manual update task. The task needs to be
> manual run after a SRC_URI change and can produces a lot of noise in
> the update commit. In any case the manual editing of the SRC_URI
> isn't practical and the users will use the package manager to update
> dependencies and its recursive dependencies.
> =C2=A0
> As a compromise we could add a new feature to generate .inc cache
> files before the main bitbake run. This would eliminate the manual
> update run and the commit noise as well as special fetch, unpack and
> patch task.

I've partly being trying to channel some of the feelings I've been
hearing expressed in different places, as I do want any new solution to
meet the needs of the widest group we can. If the .inc is generated but
not checked in (to remove the commit noise), I suspect it loses some of
the value that people have wanted.

I'm personally very torn. I get pushed many different ways, which
include robustness, simplicity and complexity reduction, performance
and various extremes of auditing. I feel I'm doing a bad job of trying
to represent everything :(.

I do see that there are basically two conflicting approaches and I'm
not sure everyone is going to be happy with either. This does worry me
a lot and puts me in a difficult place too.

Cheers,

Richard



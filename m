Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963AEC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 14:01:16 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.33083.1701180073312021512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 06:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l1yF7j9e;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c9b8aa4fc7so4323141fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 06:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701180071; x=1701784871; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ase3Nbu92BN6MYizCj5N7DlIPG8prWq2JeuwWkMsAGQ=;
        b=l1yF7j9ehIT50kxIe9SYi06uiTP+nZKVJmo9AeFJt1+zXEgqmHJVZiF2VEZiv+GLAJ
         DjO6cnfgH6l4Ola5jDb7QCF6Zhjpc5lCq+2PRxrIMNWoHBdbVvzAyh622lCz48iiemIa
         m1jqlPnm49EFVwC9vBcs0o57bTc6TUdqmGhA5wqO8NKNjDjx8QoRkQbKupVHF/2+Ty36
         S6C758i3yslb3bXilCIII4G8nfzZgLT9VBDTABQ5T1JIIBrubLpseiZubX5tzcrjpHLH
         J6saoHpkMTlgmgINkgnfOz6bCluwOW9mi0svQYqovdK3ewpBklqJcHCWpdnmZKpvK2IA
         YwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180071; x=1701784871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ase3Nbu92BN6MYizCj5N7DlIPG8prWq2JeuwWkMsAGQ=;
        b=ObAEjTvGwtca0lvREqZBYMrBxL8hwtvbPQkkLpVvY+bbKjKebqOCpeUHA2caN0U5u9
         M7KzfSPibl4KSFn0qsMb2Pqq0+l2YoaTARst4z5Yt1NUW8YjQOBYwDz1frEp9fxf7/CF
         F3CEiqPtgn3JNKFN+RjW3V2OcCi5v+m61CWZVXUblZxf65SbHXKmJI8N+4+MDqu70Iec
         8R61eaHxE9plMM6P6K6Yu3hsxKgLMY/Jt6ApskU3G69zm8c44EsmvRbhbV6UzQWAiCSK
         5PnN1RrXMTUZJszc7LWrNgoSMqbcOAZuo0bMM5OUpZURywWigZzeRCidiR2sv2cnSCXt
         lFzQ==
X-Gm-Message-State: AOJu0YwNx8llzDx6fDhbBsKqGyEVazw4XlJAe4MD0TPMpFIA/7zGkYlk
	5oE/3TywHeiEOwC3H7oJP3TDpn5PtHboQgNufTA=
X-Google-Smtp-Source: AGHT+IEtpro1q9Are4un5ouee84gvh0VsCLT050burBg2heaEuXXrS8vFnGxYNMLLdKTYeB7sYdtzJoUCnMAKjNlJXI=
X-Received: by 2002:a2e:a692:0:b0:2c9:a08a:ba3f with SMTP id
 q18-20020a2ea692000000b002c9a08aba3fmr4867791lje.2.1701180070680; Tue, 28 Nov
 2023 06:01:10 -0800 (PST)
MIME-Version: 1.0
References: <20231128131954.337015-1-alexander.sverdlin@siemens.com>
 <CANNYZj92XtmcpJpyo1eo04X1dpqPmU6cCKVhpP7aJnMK6RWPTQ@mail.gmail.com> <e0c37461b71d6159a2867726388fbc052bb4f624.camel@siemens.com>
In-Reply-To: <e0c37461b71d6159a2867726388fbc052bb4f624.camel@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Nov 2023 15:00:57 +0100
Message-ID: <CANNYZj9PeVWsM9SFoTG_F7rPjB5dhq8ZN0uGMP9hqU0XumCDpg@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: use install-nodedup make target
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Marko, Peter" <Peter.Marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191373

On Tue, 28 Nov 2023 at 14:50, Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
> > In general, || in shell scripts should be avoided because it ignores
> > the reason for the failure (ignoring some fails may be ok, ignoring
> > all fails is not ok, as it will cause silent regressions).
>
> 20231111 will be problematic because rdfind will be required, but there is
> no make target yet. My patch is at least falling back to "make install",
> so it supports both 20231030 and versions after 20231111. It's not ignoring
> the errors, falling back to "|| make install" will eventually fail the whole
> build.

So once someone sends an update to 20231111, they should also backport
the patch that introduces the new make target, and use that target.
And if there's an update to an even newer version, then the new target
can be used without any patching. But for now, I think nothing needs
to be done?

The problem with || is this: imagine that you have specified A || B,
and you introduced A in addition to B, assuming some specific reason X
that A can fail. What if it starts failing for some other reason Y?
Then the fall-through to B may be valid, or it may not, and whatever
had caused Y needs to be fixed some other way than executing B. This
fall-through will happen quietly and no one is going to notice it, and
that's where the regression is.

Alex


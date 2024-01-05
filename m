Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBC4C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 11:22:55 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.21565.1704453774533041652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 03:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bADUXNKK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d76923ec4so13786285e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 03:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704453773; x=1705058573; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YLa2LRkgUqpL2vESK8ddq3tQtZLv4DRtu706aTRBbkY=;
        b=bADUXNKK3gJhoOWCjdedfLa/31ayueDLMIpdj35vhajBHz0StHBzmIYpbW4r9lOXQb
         1nTBHYLFOcuVkHEOxCbnGXTbdncIhPN6JelHLPILmxmqt1+2folZvWXkZItJFxCnGsTn
         dnEkHK2VdI5TdGGRefAc1LtSwM271h2ZoXrws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704453773; x=1705058573;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLa2LRkgUqpL2vESK8ddq3tQtZLv4DRtu706aTRBbkY=;
        b=OvRZxOE0WUjFogRQTbqI490cq2EYiS0y6U82woB05+4Twus34mkdtaJIMPwpuMI8Tw
         s1QED39/M9jGnsKm0W6bQGLd6u3yJ1MB46Ym9sHdou6Kf4Fo4Jozob2Xc2wpl24b5nUN
         x5RUqaFHhpRPZe9erWSLv1cUy/V1tofOb676J5yEcX7mV4XPx43Eq0NwqY2ABBRozuzV
         X9lRlFrxBkhKzFb22cUYuSfX/GaQ02x/39tVV4W9bKri1mnqWIiYmN2mXyl+hlRFdB47
         CZqmE5z08cH72GUEb0y2qSx78l1raAAWqhNDz5qXmLrMi2mSJ9r8acwHsvB1DdU8aAbB
         XLSg==
X-Gm-Message-State: AOJu0YzX8EdmzegXQzDFA99GMQM6hCgVMr1slRIoFhTlLselMzBP/Hyv
	u/c461XYaCBhxLhTi3aqqXU2+kruHvEPUw==
X-Google-Smtp-Source: AGHT+IHji6eOxWCASiu4LZtKLbof0De0qtomdnWcDv5SdF0b+yhfFItGM6X9eFjRqahdEjWqUfjAyA==
X-Received: by 2002:a05:600c:3b20:b0:40c:6e8:610a with SMTP id m32-20020a05600c3b2000b0040c06e8610amr1002779wms.56.1704453772925;
        Fri, 05 Jan 2024 03:22:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8000:8a34:98ad:54c2? ([2001:8b0:aba:5f3c:8000:8a34:98ad:54c2])
        by smtp.gmail.com with ESMTPSA id l4-20020adfc784000000b003364aa5cc13sm1206291wrg.1.2024.01.05.03.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 03:22:52 -0800 (PST)
Message-ID: <c35a799d9843214d220362c0a190129e2299b93e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/7] sstatesig/find_siginfo: unify a
 disjointed API
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 05 Jan 2024 11:22:51 +0000
In-Reply-To: <20231218084403.599015-3-alex@linutronix.de>
References: <20231218084403.599015-1-alex@linutronix.de>
	 <20231218084403.599015-3-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 11:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193351

On Mon, 2023-12-18 at 09:43 +0100, Alexander Kanavin wrote:
> find_siginfo() returns two different data structures depending
> on whether its third argument (list of hashes to find) is empty or
> not:
> - a dict of timestamps keyed by path
> - a dict of paths keyed by hash
>=20
> This is not a good API design; it's much better to return
> a dict of dicts that include both timestamp and path, keyed by
> hash. Then the API consumer can decide how they want to use these
> fields, particularly for additional diagnostics or informational
> output.
>=20
> I also took the opportunity to add a binary field that
> tells if the match came from sstate or local stamps dir, which
> will help prioritize local stamps when looking up most
> recent task signatures.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/oe/buildhistory_analysis.py        |  2 +-
>  meta/lib/oe/sstatesig.py                    | 31 +++++++++------------
>  meta/lib/oeqa/selftest/cases/sstatetests.py | 10 +++----
>  3 files changed, 19 insertions(+), 24 deletions(-)

I can see why you've done this. I had thought this might have been a
compatibility issue but it wasn't, it was just bad design from the
start (and I wasn't responsible for it for a change!).

It gives me a real headache for merging though since it requires OE-
Core and bitbake to change in lockstep.

There is a risk people might just update bitbake but not OE-Core and
also vice versa, they update OE-Core but not bitbake. This can happen
for all kinds of reasons, e.g. mixing a newer bitbake with an older
release.

The latter is easy to address with a bitbake version check bit the
former is not really possible to detect with our current code as
bitbake can't know OE-Core doesn't support what it needs.

With other changes in the pipeline like inherit_defer and the fact
there is a bug related to this on a stable branch, it makes it all the
more likely people will try and mix/match different versions.

I've a few ideas on how we might be able to detect potential problems,
I'll continue to try and work something out but I want to make it clear
there are some things it is hard to change :/.

Cheers,

Richard








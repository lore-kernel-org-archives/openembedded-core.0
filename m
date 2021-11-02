Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2F4C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 20:06:42 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.724.1635883601106549782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 13:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=B33+8hqB;
 spf=pass (domain: burtonini.com, ip: 209.85.128.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f52.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso2891019wmd.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 13:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C1l/dVR3WedcO23EXGZSRN+xSZ5e0Pyb1eukBKsJOtY=;
        b=B33+8hqBqZXkBNHlSUd27qO742/Famb232X70vPgADbf2qyux5AaLKgbPMSwFaS23x
         xjls9KRVy57YSFAevVEww2pm62PNZKzh11iCe88h5geCQFp9xsCGMgxkVAU162x968sZ
         YgbPkE0kYmaHrL+QExAUsPOnodmm2ovzfJJYHHQPogGCvFwSTOdfl02Dq2w0roMYRhUB
         MIknO/SAZync2EmSoV/OeNLv8RRqWV58tEkrKmLVVzKkgotI+auisU1XHq2PtOf+HkOz
         2Oq8Jkc+mreOb6uXBevtx7kmrnhU63QKkCYj0cDNCbORaaaAmUksREobypRIJldH1DrH
         NSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C1l/dVR3WedcO23EXGZSRN+xSZ5e0Pyb1eukBKsJOtY=;
        b=iOEpRekuO/WRpGtfnROMNeGEpr+J4c5OowhVMQpIZqdtpq6rkgPpXzJoZ02YehCLqF
         NJd3E1kxdCADyVIEvKL4ChuZtmbCr+qEF/wceK5DLZ8d6WtD00SkGavDzx6ut2igHnvV
         Z3jdQbeD4mh+CaC/toJERUKgQknt+lA47XsQqa1zPP8t4tOeiZYF2RsohoEOVGXel5FE
         pP2WKSFdggPD781MdX5pzyATPcYt2CukrqboUcuuJ4BFF3hvoeOw96vD8Nt2PLFIsBZy
         L1J2hl+26pDeJEzw4XGumFjQxNrahMqZv90NYLL75Plq8HrN2IJHKlsaMIcOI16sq1bB
         5bqw==
X-Gm-Message-State: AOAM530qc0JxETPmRZNaJ7CAJuUd9d1DuImhHIQPyxizCqR4uki3zzhC
	NxyUntWmSANDJMcfm4Bi7Osq/kbX0P/lkAQqCbW3xA==
X-Google-Smtp-Source: 
 ABdhPJxEPkF+lz3iZL/y/6wvYiALVarjaO3ltvvaAgiSkpGx0zmRAVp0txXhBidOSky5kJcyXqEZARDgDUZZW+PGAsE=
X-Received: by 2002:a05:600c:4f04:: with SMTP id
 l4mr9600621wmq.25.1635883599384;
 Tue, 02 Nov 2021 13:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211102180233.4104293-1-ross.burton@arm.com>
 <CAMKF1spVJSF9tpjK5nz7WYVB_XXEjXvuXARvXnpTKjOa4S-Brg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spVJSF9tpjK5nz7WYVB_XXEjXvuXARvXnpTKjOa4S-Brg@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 2 Nov 2021 20:06:27 +0000
Message-ID: 
 <CAAnfSTs3mb+KxE+LbMR3Jj-HdKPXQFro0YCx=15vXzPAiVG6XQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: silence DeprecationWarnings in
 python3-config
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 20:06:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157814

On Tue, 2 Nov 2021 at 18:06, Khem Raj <raj.khem@gmail.com> wrote:
> So shouldn=E2=80=99t we fix python3-config to not use distutils and switc=
h to setup tools instead ?
>
> I am afraid that masking the warning will come biting soon when this is t=
urned into a hard error

That is a much bigger question that needs to be done, but most likely
involves rewriting large chunks of the cross integration as from what
I can tell, setuptools doesn't expose sysconfig (and we patch
distutils.sysconfig).

We can continue hacking the hack, until we solve this properly.  This
may happen as part of the pyo3 rust/python problem.

Ross


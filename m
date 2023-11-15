Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73683C4332F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 00:01:25 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.1488.1700006480739286253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 16:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=LZe1xkN4;
 spf=pass (domain: smile.fr, ip: 209.85.218.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9f282203d06so36467166b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 16:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700006479; x=1700611279; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19ULQDt0MLr8iabEYpn968Mcr2H5dY4xkOHvZPU2EPA=;
        b=LZe1xkN4mpqoX6DGcciw9pkZAanXBEHcH4fN+WphCjHkALGuCOqsYXtJs6ii9w48Ez
         fO4Vayk8MJ9P8MmWVUYt3Z6uGflg33PvRZ86avUXT3fDKQc7YX/djiBZgubVZE9OgLH2
         hhdEMxBa8s1snvekeLLOmg7Ror0Os4rWSjvjXwghtRK131qTsL8zAsF2rKEGO1Mna7ow
         qeiQj1XpZrdRLRvEbwL/np31IilJFrCh9eMxQ6LwqVmqYkw9eao5rCvOEzmldgRzzrSO
         HQIc9LqBH+eoG9utgzasj4u70SysMDdhfStRNvy6V7y+crFdi+2Nc5mvM2DMbxIaGdsU
         QdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700006479; x=1700611279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19ULQDt0MLr8iabEYpn968Mcr2H5dY4xkOHvZPU2EPA=;
        b=UUZq4C8euLfSQwX5T/pS+awDqn4UN4z/goov39lBtCRFZr0MvvMUGgOxGZZRbfDxXI
         WpjuKOnrrrZylro1226ywOIW7wRBL6OykbyDojdSf3zUA4SfiSVKPJ4/9zd4OQo3nsjR
         uL41EahCxXKUVQElOi7J9cHTEDpCYshvHV32TZGSsoLOpWJo3KjX8yCRl9HlOOITBXD+
         VQgJrLnN2HEZJAtvGqheR8DkYs4A3Bi0CHXl7J+FmAeuc360TQSmA1nB8HhlowKw6WO4
         YFgTDAit7L+dK6ie74ubRkZV2WHXFsylgVgk6kAQJdblVQeEhnHOUKkjvv3hTtZgAtvx
         yRUQ==
X-Gm-Message-State: AOJu0YwEMsbW1WZW3WYV0kfS7VPtO1qCXVGpZIPtc6aCvTkugT4Ati1h
	2c24XWgbCQEnD8TytOGx/gTGSoinwcYbBjIrWADnUXeE925JZR04R44=
X-Google-Smtp-Source: AGHT+IGBtWE3puKafDZlRhQ+bfzsny2vDAVAEMKLjkxVIHI4sgvTaL6c7GQ2KIYoBnTrAcBAPYf7uBk/vEuNG/EyZSo=
X-Received: by 2002:a17:907:bb8e:b0:9d5:7c6f:de5d with SMTP id
 xo14-20020a170907bb8e00b009d57c6fde5dmr7927773ejc.39.1700006479029; Tue, 14
 Nov 2023 16:01:19 -0800 (PST)
MIME-Version: 1.0
References: <20231114235332.112208-1-yoann.congal@smile.fr>
In-Reply-To: <20231114235332.112208-1-yoann.congal@smile.fr>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Wed, 15 Nov 2023 01:00:52 +0100
Message-ID: <CAMSfU+7geR0kW9Wr=YUUMZKS=CwZSahqcBaUU-9R8U90SKFDxA@mail.gmail.com>
Subject: Re: [PATCH] selftest/reproducible: Allow packages exclusion via config
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 00:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190528

Le mer. 15 nov. 2023 =C3=A0 00:53, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES can be used to prevent known
> not-reproducible packages to make the reproducible test fail.
>
> For example, in local.conf:
>   OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES =3D "example-not-reproducible"
>
> To quote the original exclusion commit (4864764667097b32a3ee1935e2c52df73=
2d55632)
> > selftest/reproducible: add an exclusion list for items that are not yet=
 reproducible
> > [...]
> > Non-reproducible excluded packages are not given to diffoscope and do n=
ot cause a
> > failure, but still saved side-by-side with non-reproducible failing one=
s to make
> > investigation easier.
>
> NB: Patch was written by Richard with small fixes and a commit message
> from Yoann.
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

NB: This does clash with Richard's patch :
[PATCH 1/2] oeqa/selftest/reproducible: Add
OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES support
https://lists.openembedded.org/g/openembedded-core/message/190523


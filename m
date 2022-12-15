Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98400C4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 18:31:43 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.142224.1671129100122241377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 10:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qIK4rV4z;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id s25so10874555lji.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 10:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ9Y1vCzwmRcUDT1+IHJI2q/nGlY19j2uvqJzFcf5K8=;
        b=qIK4rV4zJUzMQHy2zSlO+TmqGyvTUlIIBiN7aiCozqp7itC9myMMy6BeTw7oXornhL
         neqeYA4yKMnWhoTxc2WvkV8IkNHt3NnUwc8AQNQq4dV0Z7mSecoQ0j5pSV0GhvZUxnYh
         hVhvrC3TNQcYfJ7LNoMc1ztCTT+mzW0m7G4XMQvZaT7oVmAF5pwcsl3yAmlhD8uGyOIe
         ZFnKgzoQiC0eSNxc8F40pn9B4D5OtJtuk9sR6RVDthiMHyp8mBLDaldgk69hppldpT5B
         Itc4F7kFh9JauiGtmY4qBgjlJGPcSMa8ScSpYX4xw1yQjsNPUtGUOUNHSAozeARXbbOQ
         Y62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZ9Y1vCzwmRcUDT1+IHJI2q/nGlY19j2uvqJzFcf5K8=;
        b=LEOtNm6tmH4+mFbu6NzGhTvyaIOQrvVcwqdMoo75GcaL1YfKN4EbnGz2DAyXBfzBHC
         tkdfD/j7j/fXmobLGPj/n/o0ean1M1fYNyW8JdB68D9IddVIG1KC8phxGt7B4TSUQhWT
         Z3KyYC7m2nXw+wWqQ5kGJO1FfXD0vd5W6TwrUwZbETpNylob95ryQN/FsY5uD+f8rqoY
         raa44Lw1MGpVVHJscZ0RIxD7AGKHXzsc7mJ7WudpEtocXHiksiFh9fVTmQcgdxakY0Cm
         xn+DWQKLK5PAQu4FziHdsqwRzV3pBlSJkgU4LVGmEeiYbFQA7Q3MBfI3IqUsfVjY/fWE
         quEA==
X-Gm-Message-State: ANoB5pkGE2jla5+wN+0dHNoyBcZ8mY2Y+hzU68ADBRutGV97W+cEKdbi
	CylVqNwOwtkPqrg5nikCqlaYo+DolX5vDRDYQLg=
X-Google-Smtp-Source: AA0mqf6yDlq9IgGrkQTWgJgk549oyL7GQ0AuISm/pXUnKNDUCfDtHxvJQvc4tCUB3fRn5IPF49defUvUd4uqmls6qM8=
X-Received: by 2002:a2e:9584:0:b0:27a:2285:411b with SMTP id
 w4-20020a2e9584000000b0027a2285411bmr3415219ljh.33.1671129098380; Thu, 15 Dec
 2022 10:31:38 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
 <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
 <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
 <1731096B411C6A99.9432@lists.openembedded.org> <CANNYZj9BmxffYxhd1gWy6dUBcsjHi6kXgswC=4LVXUnePSOo1w@mail.gmail.com>
 <CAHMutrZhNPdLoiFTfOVvHiqqeYwSOyPB3v2qmmy7BUoraj=GZg@mail.gmail.com> <CAHMutrbJo2ocWz88UbQsRjBDccXr0yVDC60SZ35bdMaXHw8LAw@mail.gmail.com>
In-Reply-To: <CAHMutrbJo2ocWz88UbQsRjBDccXr0yVDC60SZ35bdMaXHw8LAw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Dec 2022 19:31:26 +0100
Message-ID: <CANNYZj86ubrqjVbJdkgknUj6h6y=7OjZz+eU4i4Q-OhzUUMnqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 18:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174591

On Thu, 15 Dec 2022 at 19:24, Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:
> Actually how would this make it any simpler?, if we remove PV from the fi=
lenames, the correct place to put the variable is in rust-source.inc since =
all others include it (rust-cross-canadian, rust, rust-llvm), if like I sai=
d, rust-source.inc gets included from somewhere else, wouldnt that override=
 PV for the other recipe as well? beating the whole purpose of the change, =
this, or creating a new .inc file just for this seems too convoluted IMO.
>
> If changing RUST_VERSION is too problematic on every upgrade I think appr=
oach #2 its a lot simpler just specifying RUST_VERSION on other recipes sin=
ce it would be very seldom used and it wont conflict with upgrades

It's also possible to not try to reuse rust-source.inc, and just
redefine the needed entries in those custom recipes. Including .inc
files across layers is already something I am not comfortable with.

Alex


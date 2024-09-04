Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D4ACA0ED3
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 09:17:46 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.45623.1725441463770304025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 02:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g580JPvv;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53346132348so777878e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725441462; x=1726046262; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gBoM1dsXIMTJYX3WVE7uQsTE2mInn9rppNYSjxwOKg8=;
        b=g580JPvvge6vjpxo8iy32QyQepUesZxjvIeB2oEsW0/w8c1FgKobYuWq2sx73qnQoF
         QwVJyJ+BmI//HFUhkm+zCrf5EzB+8RKLL+ucOZcWRwgZxwuQcEn42eIRmshxPuUGdiP8
         R7o51mP+hSm9/PyGLiku+LG6+bK6BB5NEj68U529ox1HgB2LEUMkMhtAhwzPR1xv2/tl
         cAKHz9og7NH1WVXDi6AEqNfjc3muE+LgTAF6Qau4FfEdaQtg3PkxhFTxhWB6u16SMTr2
         5evzQ2KLcCHy0Vt9zRmrLJ+3mwLKFZseThJqezW/sw1AEANGsGyIMT6tdcmwuoPuWV6V
         r47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725441462; x=1726046262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBoM1dsXIMTJYX3WVE7uQsTE2mInn9rppNYSjxwOKg8=;
        b=X+zZ2cWxfpp1/1ehL1y6BwytvfS2SOGO1Q0XtNINO06MhlLyGxpheLS95sfCxdhMjo
         TC12fDEiRegZUu1fyejBITkgduYEM+lva+V1mS06oeIlFecb3nh9hHzWBXm3Xr0eVMU2
         UCC+qfE4pwxEvX7DYqY3Bgj/zvT3v7zVT4RVmePtkGo7z0iPsl2fm2q0GtDlzqdn3wdw
         aj7l4kgC4agTj+A1pfPAZj7VbFlX/TFvVFAd5ZXeWVG3qIwrv986ERhe7IpsL2/6tsb3
         kMiVJhxxbBsfGtZ8j+5YaFP4UBOH15mfB/qe1HV+olQmbrq3FCLiJumv++WB6GdsCR5l
         gG4Q==
X-Gm-Message-State: AOJu0YxW4eIUMTtj40j6HKYs2/iQK/CzaBIowP5E9FNDBr/tHYeaNwo8
	HDRhFit03wmYWWIkTvekb8q08VeBAk616YSTowRUwQ1am7fobyGrXLPIuDx3ZwrfABPjqYmwI0Y
	rnCHav3arIrZ5upmvrGekOBRJuVs=
X-Google-Smtp-Source: AGHT+IFIecizYg825RAs+xvT437mSQ3kBfQ5jl1Uyjwox4RpJfvMjnI1pmudsXqycBl2LRP9JLqjHPhEgFnxMWZW4yQ=
X-Received: by 2002:a05:6512:2582:b0:535:66bb:3303 with SMTP id
 2adb3069b0e04-53566bb358dmr1136598e87.12.1725441460967; Wed, 04 Sep 2024
 02:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240902105825.40177-1-mikko.rapeli@linaro.org>
 <20240902105825.40177-3-mikko.rapeli@linaro.org> <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
 <ZtWgPF0JN4uyjU1u@nuoska> <CANNYZj9ke4yEQh0hAxk4fUazaEzQMP7JUKv6LYRv16CTwXpqFQ@mail.gmail.com>
 <ZtWuxNNd9KNxT4T3@nuoska> <CANNYZj-uXEDm2CuqtorwdZNABaZNPm4UtOFZvw4wMXdjhh+0ig@mail.gmail.com>
 <17F16FAE8869E0F4.11433@lists.openembedded.org> <ZtXIY7nwRpNJSVmx@nuoska>
 <CANNYZj8rA+unjecEiofA3Ht94Y2mqBygLnBP-rWEeZPfEEq+Kw@mail.gmail.com> <ZtgSunyGsn1gtMfF@nuoska>
In-Reply-To: <ZtgSunyGsn1gtMfF@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Sep 2024 11:17:29 +0200
Message-ID: <CANNYZj93pH+571auNTZD+VKKWnP10=4fumhM-f4h_FhG9HWpvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building Unified
 Kernel Images (UKI)
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 09:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204196

On Wed, 4 Sept 2024 at 09:56, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > Not rejected per se; I would suggest that the existing wic
> > implementation is rewritten to use the class (and hopefully becomes
> > radically simpler and shorter)!
> >
> > It's fine to not be entirely backwards compatible; this is master, and
> > we can break things.
>
> Does the implementation have to be a wic plugin?
>
> wic is another wrapper over bitbake and I'd need to teach openssl native
> and python3native things to it which seems a bit too much. uki.bbclass
> is much simpler and wic can process the produced .efi file when creating
> the ESP boot partition. I can try to fix the tests to work with uki.bbclass.

No, implementation can stay in the bbclass. But I don't exactly
remember how the whole thing fits together, and whether you can keep
what the bbclass functionality in the bbclass and have wic call into
it (perhaps indirectly) or vice versa.

I just would like to avoid the situation where there are two entirely
different implementations of the same thing in core, and only one of
them gets tested. If wic can work together with the bbclass, then the
existing wic selftests will test the bbclass as well.

Alex


Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF24C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 15:52:19 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.23717.1744732335726567703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 08:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NxQE6Abr;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30db1bc464dso54685021fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744732334; x=1745337134; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoxjPrHbHIwsQSh0ScjQOZ4z/VX/iSbv6tVKlmQpCV8=;
        b=NxQE6Abr32dzQUloas5/FwESze6rzptQsdUvsyNImC9cJo1uC9aINIIS13YUWy6YfJ
         vyeZ7NImNLn/tzBfCdEA/4bSu65OLcBEv4hO4rgCVsChaw3nq9uGhuVXI+iS3wwAMPzg
         dIiGyzTXDhpC6S1Wy8g8LTACZzkRKEBc6Qlj03kOT0YG3ZvOx39h6RtI/BUndoxECvwT
         xU3Eh10md9ydX6LCsUsMwgKA7IB9atFE2cRbzd8A2MH5ga77nB9L/+grc10oCcSq7INr
         C8rI9LgZTuKsteGZraO2HuohgBQ4kPKmtfH1Mlk0HJkaG0cAqxLJhvhuawYMXeCRqT12
         H9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744732334; x=1745337134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoxjPrHbHIwsQSh0ScjQOZ4z/VX/iSbv6tVKlmQpCV8=;
        b=hTXiuqvsEnC5o1v9NnheIW0dq/7U9CgTpIU9vkn5tS+uou9u9jwuVisqZSQJWpYX9m
         /6aXA9AvC4RXeuGjphllRW2/ty5haGTahDtN9QLzbW7BUg0SYynchgt1B7kHQJGx3tyY
         ZeUtr7XzjpyhJnqgCukzenaAis0tt9RjOY6DxhT8l0YmhsYXBjZex7EQH4JCoxKUa5U4
         ZYF8V2HKsfeOGeot5POL9rPCooysjTLmi3dI86v3HWT+HiKB+i0BydG916d5aWYxbA88
         TvIvoLQmNhsmYTZ3dnofbl1tTSKBYhINA9/lfDCxGD/X98NGK1nkqztSkY+8xhDR2nN0
         5Zhg==
X-Forwarded-Encrypted: i=1; AJvYcCWqxBf1txfiRsacoOqHzb7MD2gR/oi5jYQBu0OnE+K+BUI5HZM8hAnN6jUO6s1xbXwmQRdWusvJPPkcoWOBgkoXSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzCwH/zWrkrO4/lu6XH1hsuP/00v1+XIUzErAwtakDN/05LwOwr
	yM2E8apcL/BKZfcvUjlAOvK4wjsHL6kjr5ReCEd4qgSDcMxqNSJVMxRdrS+VN9B1lhxRNyp4ug7
	Q1Elri0dDQxH/sut9wICv5O1N3oc=
X-Gm-Gg: ASbGncsLZl+OODlNLW5n1RzjqY4tBfHjmGztEhq2mpo+IUsnfG3dZzI4K/o0/OyljlZ
	4foWrtF0ecbyGQJYhP6xy1WbL+PUtZODkaElkCOOXDjCVZIqJ7NUiOjTsTGAAJEM/PMer2Vkzd7
	seVXOZM3pOl/Wp6Fc1EAl6QHNA
X-Google-Smtp-Source: AGHT+IFTSSQ3a0JW2ZEdP00sJOSoPPeRs5kjKy2zeYmsM2pZNTbFkMSbmrquExSxVAocW0YGoefGBPdke6x5lpB4Ie0=
X-Received: by 2002:a05:651c:2104:b0:30b:d073:9e7d with SMTP id
 38308e7fff4ca-31049aaf6cdmr48825971fa.37.1744732333451; Tue, 15 Apr 2025
 08:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
 <20250331055424.1978243-2-Yash.Shinde@windriver.com> <CAMKF1sowYqhv29_Him+th4PkxvGG2FkEzeWmM3fgYzUeKpHqSQ@mail.gmail.com>
 <CA+chaQcn9EfvFMSEmBPnCu3duzwY=cNXzwXVGPBNSP7n-9SduQ@mail.gmail.com>
 <1d01500d-39e2-4578-9fc0-b8c7c231e6d9@windriver.com> <CA+chaQf_eWJgp9QVKQQ9iGviZU54Zc_1h-LyWW2yurWf06zCLA@mail.gmail.com>
 <16187529-d92e-4cac-b900-bafe8d603c73@windriver.com>
In-Reply-To: <16187529-d92e-4cac-b900-bafe8d603c73@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 15 Apr 2025 17:52:01 +0200
X-Gm-Features: ATxdqUEvUa69PY9NiiIKASDFywgmda5HcnaLAoOEx9fDRVYJUiPMlbP9A6WUf_w
Message-ID: <CA+chaQfvUii4KyMTgD4+RvHkQF9Tf0_jpym0UC8dkKupfhscjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] rust: Upgrade 1.84.1->1.85.0
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 15:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214952

On Tue, Apr 15, 2025 at 5:46=E2=80=AFPM Yash Shinde <Yash.Shinde@windriver.=
com> wrote:
>
>
> On 15-04-2025 17:08, Martin Jansa wrote:
>
> qemuarmv5 uses tune-arm926ejs which uses armv5te, I think you would
> need to use armv5te-vfp to reproduce this, or use qemuarm with
> tune-cortexa15 but switch from default cortexa15thf-neon to
> cortexa15t-neon
>
> I was seeing it in multilib builds e.g. with
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
master&id=3D40e9c4744a7f1eb2d91af9539d69555d36dfba30
> which uses DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7at-neon"
>
> unfortunately just treating softfp as soft ends with segfaults in rust
> as shown nere:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
master&id=3Dc65eda95e5dd3ad0be0565477236d7902d5d625c
>
> Regards,
>
> On Tue, Apr 15, 2025 at 11:05=E2=80=AFAM Yash Shinde <Yash.Shinde@windriv=
er.com> wrote:
>
> I checked for softfp tuning using (which gave TARGET_FPU =3D softfp):
>
> TUNE_FEATURES =3D "vfp armv5te"
> DEFAULTTUNE =3D "armv5te-vfp"
> TUNE_PKGARCH =3D "armv5te-vfp"
>
> But, it seems that softfp is not a valid value for llvm-floatabi in rust.
> It gives error as follows:
>
> |   --- stderr
> |   error: Error loading target specification: 'softfp' is not a valid va=
lue for llvm-floatabi. Use 'soft' or 'hard'.. Run `rustc --print target-lis=
t` for a list of built-in targets
>
> As you mentioned, using soft instead of softfp also doesn't work either.
> It seems that unless upstream Rust provides support for this, we won't be=
 able to build Rust with softfp on ARM targets.

The last 2 paragraphs were rendered as white font on white background,
but I see it now.

It was building fine in this setup before the last rust upgrade.


Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98822D3B7D5
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 13:27:51 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6919.1765027670264055501
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Dec 2025 05:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gPWwMIrq;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2e52cc04so1089963f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 05:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765027668; x=1765632468; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XND0VNBudRwUDYhgDy4imoXRHGR26NLcdLL2hh0QSQ8=;
        b=gPWwMIrqNGJBqpDd/EAd1NgWKduZYVxsAnMuNx5uUiPnd+bjzKeE6d0ncwZGfpbpl0
         xYoNEBCeVHxH3qgjRKkaGvgb053d7r5O2SwGB0pGVDXxkk9AufO9VJc2ZkaANC6OuZLF
         3wPuCv7HbCFDtptNTiTs1NRfxUJ2RjY21C8Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765027668; x=1765632468;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XND0VNBudRwUDYhgDy4imoXRHGR26NLcdLL2hh0QSQ8=;
        b=UMI5MXKYfwk0sNEKjI5XaTyaF4yzw8L3zFmq/6EJ8TJumE7ieh8myQQCT2LSPVJ986
         YftUO87zQWKw9rBmIcyFS8LVNdxOML8rc72S56kanSIG8CcDiu8O3MMp80wq/W/fcwUs
         lJ6dG5GBk3VZfi8EoaNu4N1NqJLzrV5JvgKPDQrMLj74wkBmqBmxcanj1G1twhBvsgKZ
         P6XDI2ZaL9oj04dtzsB4MQ5tCNRHP+L6H9ZdH4++bqkulhGNjjiN7b3r9hXSxRj8Jw6h
         VJyzGWo+zWy9JOGfpdUwl/B5unckkdCFs2aI0HMpuOvcIeql6LZIJ8EM7IRwhbOLSpvp
         drYw==
X-Gm-Message-State: AOJu0YzmA5kEw7VGIydspHhcdE7rgaxAXD1lcGbw+bj/KA1VTzeZ7A7L
	McIzeaZsf5qxV6kcYbo6aPfDG/IDuNs4wPxwBdejoK+UnSf1DJwSDQ6XKRWhR3Q5XpazBbeUW1b
	UZuemxwhNDK5e7pGyBD0sT1CBXEEJqPTWyOg0LeX97L8mt0CeXW+tNKE=
X-Gm-Gg: ASbGnctDmXzPAxE5U6TBfhxnJgezP4JSkErj1nMj46DokW4kzXw7+ZxbcFpmPhML0jj
	F7D/mSec2J6t3fOsBTTzsQFxx4gqIHB328MOUj+EsyPeY2+M5v+jE8S3xxG47Qkj0T01gnmrUJm
	PPSmYj+/48nMCzmkLb1DuUUruC2kY21tcCdP0nuucQbOfyKorYwaJzDiLicC7KfDSIy0JeN01om
	UQpc6plvMJEQgBRTRbCgje6Pc4GqK2kMcK3kAZSEdaNkEPnWRpssCTK4Uz/9a53EnaWK+O/g9MD
	p2Amy4MTJ41AiwAybsEzazXqSZ9ppQ==
X-Google-Smtp-Source: AGHT+IHVXXjHxb9Ij3ZFE8Rhs89rT0j61/u1ikh4BzKaQL6TmTwvmkJRGf4+Io+5kHQSVH7g49MqlIYH5k+IOOjNP5Y=
X-Received: by 2002:a05:6000:200e:b0:429:cd3f:f43a with SMTP id
 ffacd0b85a97d-42f89f0fba0mr2214163f8f.7.1765027668165; Sat, 06 Dec 2025
 05:27:48 -0800 (PST)
MIME-Version: 1.0
References: <20251204113058.948115-1-yoann.congal@smile.fr>
In-Reply-To: <20251204113058.948115-1-yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 6 Dec 2025 14:27:22 +0100
X-Gm-Features: AQt7F2pQIaqLiNJQUlat1TxqXaw7GmMbf5CZvoAN_zh11RxGAorwT8FP0f-s4p4
Message-ID: <CAMSfU+4heaZZvGO9=6r+QsKWzeUDvhHRGV8-CyFgPtFSRB_AZw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] Kernel Rust out-of-tree module support
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 13:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227366

Le jeu. 4 d=C3=A9c. 2025 =C3=A0 12:31, Yoann Congal <yoann.congal@smile.fr>=
 a =C3=A9crit :
>
> As followup of Harish Sadineni's RFC v4 series "Enable rust support for
> linux kernel" [0] (and to increase its test coverage), this series add
> support for out-of-tree kernel module written in Rust as well as
> associated test.
>
> [0]: https://lists.openembedded.org/g/openembedded-core/message/226623
>
> v1->v2: Fix tests:
> * maintainers.inc is not supposed to cover meta-skeleton =3D> removed the
>   patch adding myself as the new recipe maintainer
> * enabled meta-skeleton in the test

Thanks to Mathieu, this series has been successfully tested on the autobuil=
der:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2800

>
> Yoann Congal (5):
>   kernel.bbclass: Copy include/config/auto.conf in
>     STAGING_KERNEL_BUILDDIR
>   kernel.bbclass: Export artifacts needed for out-of-tree Rust
>     compilation
>   module.bbclass: Prepare out-of-tree rust module compilation
>   meta-skeleton: Add rust-out-of-tree-module recipe
>   runtime_test: Add rust-out-of-tree selftest
>
>  .../rust-out-of-tree-module_git.bb            | 18 ++++++++++++++++++
>  meta/classes-recipe/kernel.bbclass            | 19 +++++++++++++++++++
>  meta/classes-recipe/module.bbclass            |  8 ++++++++
>  meta/lib/oeqa/selftest/cases/runtime_test.py  | 12 +++++++++++-
>  4 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/=
rust-out-of-tree-module_git.bb
>


--=20
Yoann Congal
Smile ECS


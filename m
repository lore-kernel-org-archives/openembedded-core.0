Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180EACD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 21:22:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6531.1781040147136207292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 14:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aqgbW3jV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b613a17bso59491815e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 14:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781040145; x=1781644945; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PG0WcwKTlLc0yJuMXMQoo1Z59F9xxs5Nt/Bi+mQhz1Y=;
        b=aqgbW3jVU6aEpEjYqczJc7b2JEE0ORTkBm6P/LQ/5gF8JobWOnc1HAuDjJSH03Q0Xe
         8LTXZiD0iIAtMVOaiDw1RZmwQsiBtcYXst/COPeNxmKanSCKNyZDIPgQF5w0supQfRKx
         aQlBl5d64kCrW3oEsd3o6W+v3igHVpAg82/eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040145; x=1781644945;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PG0WcwKTlLc0yJuMXMQoo1Z59F9xxs5Nt/Bi+mQhz1Y=;
        b=D8LBP2yFN8RXpv3TrZXwNFaKVV7S7CcNFrrEqFSLvlrv0Vs2BmZi7HvYRnllxT4Wjh
         TMRBwtM8PEGdpbQu2AxGGlMaX9M2s8TublikibgvUgoo+dnGo2rZW6UCBDoelqfNHlB3
         JEJQyYJxpSHc56ldL2/pcTbFONW9iJEYO6czcthbycBNuO9+aTkzpzq6G+imZv+pUHA0
         zuupM8Pue40O8zfNOrJ9DItT/FvpXD0vzxFxsX5JQp8bVRc4duEFjaC/KkXtAEYmEyAT
         kWk1O660XFxDA56Rnm06lonXWAiR3ybKldhQBpT/7C9QI3QpKVlRLpPwenw1pV5VHRit
         IlEw==
X-Forwarded-Encrypted: i=1; AFNElJ/QJQjQVaX+o1yM7rjR8LUFEGbGd9N/lkxgTJbPuym6A0ZaQ3Txd7qOOprI3uB5hKbw+3XW0lmasdcgjuB4OAU0HQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzR3hlQrfvns4v8Kdk8R/YKasfkbeKdjBDsScBNLdB0iEtcPZnV
	aqedvRI6EUd5WHBsxhAb76wwjZw8qupxHSLFmSGdGDQDA9Q7zdw6exn2s3qZsJb7Yl/XVk+CBt9
	xz81T
X-Gm-Gg: Acq92OFOlgppR/DA5mLDhSUnvwaFVFhYSCBbcac2FbwCjYNVvJRi95pfodjVLlnOl2c
	GDWUojNl8Kxok2aRr1iGXsWoy3qTRzZBoFFW7MnQnF5TZ4+OncFARMC1Z2VkpPJlSh2zJiUMG5A
	/iDi8ZxNvTJfJuSrhyEoOk/K4A9MiJVSlYohj8gyFvxW4H48fKaNoX0z3fPqGmJGwRmORtHn7Tp
	1ccWK6EmjfctbM6Uv2uHTrxgPV8pSjscnGOxZkhjebJtLjtj4nuIVIZC+cvZpxQftN1Ir6zObbF
	94RN1BV+eEbud9jLzaPtQBiE9w0xH8L3oC4CFHctt/qlIDQ/IyS9Z2UcP0jJJ7O8ZVbmLbxzA3o
	1TojN1T5zizokRZTn58sUPgl32WgoQP34x4uPaDS+GkrAmqJxqZuNX3mWRql7Ef1pmc2H6v2cuJ
	xqG8HefUCeVD7hxJVI52uZ1YmrStJcbynK7emGotKCVE8CxypVw5RJcnTnlrGa1r3NFjPOw3Zzb
	FQ5z5XBPu8yQIEOsNZucuHu4rI=
X-Received: by 2002:a05:600c:3b08:b0:490:44eb:c1e0 with SMTP id 5b1f17b1804b1-490d72241bamr61002825e9.21.1781040145394;
        Tue, 09 Jun 2026 14:22:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af64:92fa:d514:2768? ([2001:8b0:aba:5f3c:af64:92fa:d514:2768])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm545271745e9.12.2026.06.09.14.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:22:22 -0700 (PDT)
Message-ID: <17026ba0e0798abb23fe7fdb5f14360c4bede4f3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] llvm/rust: simplify llvm-config handling for
 target builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Jun 2026 22:22:21 +0100
In-Reply-To: <20324.1781014965849398736@lists.openembedded.org>
References: <20260609141916.2724362-1-Deepesh.Varatharajan@windriver.com>
	 <20324.1781014965849398736@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 21:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238301

Hi Deepesh,

On Tue, 2026-06-09 at 07:22 -0700, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> Tested the patch with the following builds and all completed
> successfully:
>=20
> rust
> clang
> mesa
> =C2=A0 =C2=A0--with multilibs enabled
>=20
> The changes correctly resolve llvm-config from the native sysroot,
> eliminate the need for the previous llvm-config copy/symlink
> workarounds, and work correctly with multilib (lib64) configurations.

Did you test this on non-x86?

I ran this through the autobuilder and there was a lot of red:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3956

much of which look related to this change :(

Cheers,

Richard


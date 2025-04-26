Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73956C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 23:35:44 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.18350.1745710534940808325
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 16:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q/X0w5Ze;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60658e1fedfso700256eaf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 16:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745710534; x=1746315334; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ur29WI5E14L1VkcUoHvsj3PzQ6+1iXOjIXeXNYE9XB0=;
        b=Q/X0w5ZenVCX0Pu3GSd7UhH4ZVtl9+haEusiYE6Lvfh9sm1agjjpymzjJCQYXBCZn2
         sE3Rth3sH7PNJp82yU58c3UluiNQdM/HZ/ZXrUkmCFGqV+h0MkKgHFY3o77/SoOcBUR4
         oIjsBynFliyYxk21O2QCE0fBfO/sYUpscjoAGvOLjw/JU0+RGMyi5Q2Qa0qw1VPI7alc
         /VmPcR2HxN0evXb3fx9tmU9B3jD5+2FdY2/sKP40qb6cdjJrXnm/0ksv4VXAq7rlATb7
         oYRWqve153JoE7WkoE7cj/bkxlHEtSivsGrcQhCEQUA2XyQhlT5umamiTg+sBS16VSyO
         zalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745710534; x=1746315334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ur29WI5E14L1VkcUoHvsj3PzQ6+1iXOjIXeXNYE9XB0=;
        b=AloQWkexuTJ5UTmrTnNoAX2lFsFMJmOD7yx0QFfio4MEGuWW9AFeTbIeOOnIOGubgy
         HDowmgRJrjMnzs2wsDgRtz0kVjmySmiRZF8vQDFASDrktwD50tLxzNq7CyxuQYcvvdj4
         CoqTfhoZjpoqXTyRkAiIfQLU9YNNL4folfmx033h7wiK8UDfzejkfZwfnY6K3CLDF2Xi
         nClFmyWBBhY3LPPEJ837lm5TGKQFqbndd3OcIM/BjAJy+CbqjmFXTqy9VAtN+DT+6LxD
         Qoufo9a09pjcWfOzzD17d2C8wVIwwWyyOJ7XrNBZ8rs22BT7Sz4ulmkmCRH940qEj/1c
         ko9g==
X-Gm-Message-State: AOJu0YzobTvJCoFaSF7Db93tD3S+Z/yIZiSF/sGWMOd8xWjpkMLgyQen
	Aiub/orzB4XZ95qZ1ueYqr2DBFzVeDyhVyFTHDdX76H7KXaMU5ZFrvchuZwutuFAW2xD69RxQIA
	qQwOLzRWtddly+tKNXV49ATAZmtE=
X-Gm-Gg: ASbGncsmTNN3MxbKHtAZ/4LDchSSaIpHdoYyg0coG35E5BPUW88p1zXXAL/YGvigNPl
	hQfboy9K2KamAWbLyfRx7sOF0wE7Ivwd3bTFRHrrMkXRUVxrHc5ei7AYcgyG2VOJYp91b+Xu9DH
	36AnzVgMpIl6NRdBHlrr6rZOkVtnG/RsLv
X-Google-Smtp-Source: AGHT+IHZ08AKx7QTmqCHo6h5srBpsxxV1gCLRptfOR6h+gwEwa7rlV0X1AYlPQA3+R86HH072T1EfVT0o5NZ02cSw+0=
X-Received: by 2002:a05:6820:150f:b0:606:361b:52ad with SMTP id
 006d021491bc7-60652b98b02mr3831613eaf.3.1745710534093; Sat, 26 Apr 2025
 16:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250425165030.1367643-1-raj.khem@gmail.com> <559a26a16dd125d9e0ccb48b2b6a8c3e85b778ea.camel@linuxfoundation.org>
In-Reply-To: <559a26a16dd125d9e0ccb48b2b6a8c3e85b778ea.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2025 16:35:08 -0700
X-Gm-Features: ATxdqUGtb3EbPpiWQXRSeFISPZvWCB3fDqiBVyIxixlYVYHDDijxxJ9r3Fcmnyw
Message-ID: <CAMKF1soSrPvquXgNiULiZF6f-77ViE=rY0h87duRpf2V8FS82g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Upgrade GCC to 15 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 23:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215528

On Sat, Apr 26, 2025 at 3:25=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2025-04-25 at 09:50 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > * Nios2 has been removed and aarch64/ilp32 is deprecated
> > * Default C dialect is switched to C23
> > * {0} initializer in C or C++ for unions no longer guarantees
> > clearing of the whole union
> > * Compile speed improvements with LTO
> > * Vectorizer can support loops with early exists but it is limited to
> > loops
> >   with fixed vector lengths
> >
> > This is major release of gcc, the changes are noted [1]
> >
> > [1] https://gcc.gnu.org/gcc-15/changes.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> I did run this through testing and unfortunately there do seem to be
> some issues:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1472
>
> In particular:
>
> harfbuzz:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1478
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/1465
>

I think this needs fixing harfbuzz

>
> selftest:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1428
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1531
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1377
>

I have sent v3, which should fix the baremetal cross-gcc failure.

> reproducible/selftest-ed:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/1505
>

this is running a selftest which is building code which is using bool
needs fixing for gcc-15

> Cheers,
>
> Richard
>


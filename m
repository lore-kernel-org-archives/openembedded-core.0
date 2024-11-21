Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31B7D75BA5
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 02:58:29 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.2476.1732157898699539200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 18:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ksTN4EaK;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ebc4e89240so265796eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 18:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732157898; x=1732762698; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXxzOlyI2r3ycp2G1hlxt1a8cwUe5tmpWEiHFLTyZSs=;
        b=ksTN4EaKPd1OhSk/tBBG6iPJkj0e1g+UgZKno4i5gBDG64KLzrqVYmWzcK8v0BAdNK
         /Nk1EmG56eGv+8l0cmV5d6b2r2m0VA8ePU3Bnl2Gr1nG2XzksZ9oQPRllTZEVL+cdOf3
         axgLsPPaZRPrMWPzMnp5cr8P960Ot9Vh929uBlpSKZCbOM9xKqFN+f9jYWowVGSRnwcP
         jBYcprJNT4Rfo3EGar08juRnb70TFN8FVkiKb8agjtaKojLohVQARAWNZdqEL+IHl9rg
         oRSxZtpVTE4mFjhHRsPgXn4SflSaH1QYN8R8cRo/LQyTM0kXuD0can4pno8TmNcPr7mO
         Bx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732157898; x=1732762698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXxzOlyI2r3ycp2G1hlxt1a8cwUe5tmpWEiHFLTyZSs=;
        b=dK5yHy8AvlvJXggLOceBfYnCAoZctU8QyTHA0p0CTGAoOawxYiLOpkwhvZnkGgkAR7
         Sruzz7XsXiUEHv2PqU3yuyasMV/JUN+2WvNfJyk3j30e+ZHwLPn3ANtwe7W+w2OFCtMW
         dIRifjj/VKx1vETyN4A7tbFtzUXfup3e5NHO0G6TzBRJpleni/KoCCul96fJ+a7vUKkM
         EikNK0RdUy/ovfoJ0xI5JVEMhAym/A5Ck6Idh1WqD7Qoc7HGf3F2OtnhTBo3nRTJ5xay
         BzcbU1KeAoAkXgTWzU9lAaDw5E0F9z1D55hTn5sUNA1ht5FVwY5X4eK2r+kgXe3X8y9d
         ya+w==
X-Gm-Message-State: AOJu0YwXbcF0f8IxwlB/gKtve/lCpSJE3b2Oc3Bv7DT30nSGPdDWA06x
	O2mjFErzBFxclo9erqbj5DCSxFqf3bQw5zczgUYPYxt/BMAHRF4KA4/bXagdvuOdP9gbSekGB89
	f48UJYXTHmR4RXRKjF1dQzye/O8s=
X-Google-Smtp-Source: AGHT+IEL/5GlJI4nvcvTIDaqSVvVX9JRTtNMT18tDamsHiYX8a7FXP19mRBDIRz1aZp2MN4Uy3lg2vCIuc1WvXs/d2Q=
X-Received: by 2002:a05:6808:2801:b0:3e7:f452:2ce0 with SMTP id
 5614622812f47-3e7f4522d48mr98243b6e.26.1732157897758; Wed, 20 Nov 2024
 18:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20241120101429.209176-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20241120101429.209176-1-Harish.Sadineni@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Nov 2024 18:57:51 -0800
Message-ID: <CAMKF1sr7jXkwrfx=nk+Lcr3urk_7RyVo-Orrakh4d7bDoHGtqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-target-config: fix cargo build with
 toolchain clang for riscv64
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 02:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207496

On Wed, Nov 20, 2024 at 2:14=E2=80=AFAM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> bitbake cargo is getting failed when building  with toolchain clang
> for riscv64 with the bellow error:
>
> error[E0512]: cannot transmute between types of different sizes, or depen=
dently-sized types
>    --> /usr/src/debug/cargo/1.79.0/rustc-1.79.0-src/vendor/dbus-0.9.7/src=
/ffidisp/connection.rs:298:50
>     |
> 298 |         if r =3D=3D -1 { Err(e) } else { Ok(unsafe { mem::transmute=
(r) }) }
>     |                                                  ^^^^^^^^^^^^^^
>     |
>     =3D note: source type: `i32` (32 bits)
>     =3D note: target type: `DBusRequestNameReply` (64 bits)
>
> Issue will be fixed by changing TARGET_C_INT_WIDTH to 32 instead of 64.
>

Thanks for looking into it.
Infact it should be 32 for all architectures not just rv64

> Referred TARGET_C_INT_WIDTH for riscv64 from the following link:
> https://docs.rs/crate/rustc-ap-rustc_target/587.0.0/source/spec/riscv64gc=
_unknown_none_elf.rs
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
> index f7aa6c74d8..d5fcfa1e2a 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -247,7 +247,7 @@ MAX_ATOMIC_WIDTH[riscv32gc] =3D "32"
>  DATA_LAYOUT[riscv64gc] =3D "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
>  TARGET_ENDIAN[riscv64gc] =3D "little"
>  TARGET_POINTER_WIDTH[riscv64gc] =3D "64"
> -TARGET_C_INT_WIDTH[riscv64gc] =3D "64"
> +TARGET_C_INT_WIDTH[riscv64gc] =3D "32"
>  MAX_ATOMIC_WIDTH[riscv64gc] =3D "64"
>
>  ## loongarch64-unknown-linux-{gnu, musl}
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207420): https://lists.openembedded.org/g/openembedde=
d-core/message/207420
> Mute This Topic: https://lists.openembedded.org/mt/109681834/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


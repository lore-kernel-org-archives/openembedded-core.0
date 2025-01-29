Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0FBC0218A
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 00:38:42 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web11.2508.1738111116609510025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 16:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oa0NIl2a;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alistair23@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso1754388137.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 16:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738111115; x=1738715915; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09eGjbIygG3NgnUiLYPkLNWBolAvDTIqomt+925oKOw=;
        b=Oa0NIl2a6GKiImDI5RsEmuO2j508N5GHCaf3w2qF73aHPp00pbcrabVh+oqvhq+Opm
         9dA4KRL/Q4VMHOqyknjy0E1keJHiGz00CNZYGG/o3DMYqviOoiu+9onlSBd4smob7A3m
         uaBzoLo8wwMkhqSYy+1wapFEyTjljrGFZv3D6POO5B3NIcFj7NA5EwRh6BJst0Y8TV8G
         KO9m1I8iALumbkUlgm5rHwJYA5GfRAqrLg0e8MwkBVwCInxv5zaLEVMidWk6uQ1zH6ji
         V8qC317D01c99FCJgAmaOT5+OTP711O9KguIpDXPuGlgyH/xI6RRsIiBnyyXlqzgn0nK
         Kckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738111115; x=1738715915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09eGjbIygG3NgnUiLYPkLNWBolAvDTIqomt+925oKOw=;
        b=iFGL/GLn2RGgXrYeXAg0aCJmCMjagEBnMKLaPWZXioGw741c0EJcPYz1/uOc0VRtvK
         ACCuViCGNmDH95tcvTv2gYzaOIxqbK+50/9DrJHrAM2IytkqsDoJD81zbpNINHW6zCQH
         d53GlnZha6DHsWQPZq/CCr0ydkaZUakwk8x1IWcfcC4JmT4zKXl5s4EFMk/jIwF8ehJq
         bsCPBONx7S1nFsnarSwSf1OMD2bcN1ZCinM3L3YYqqEVs9+7e87kFFbU1pl256Egh9ye
         HzqnTI3FXjYAULnE7vTNmNvRKciJqCLyNDjCD2kmD5SOLntIemLgkykwgeOlO/wDhUGe
         bDRw==
X-Forwarded-Encrypted: i=1; AJvYcCWk1a2UK7cMFZpwWQXIHmzAhAktg7txKl42iyJDzNyT16Re9eNMe6Qb0dItgm/lIay+xfJd1iROdnwpGYSA4xt0Sw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyt6RJMRKMKzfs1/ruZh9MEjzk4BhoeaTFldiSUSnWxZskvc0RO
	V8Dnd0HPx8s1z34b5SU/CN8uz8hqJ9V/0Kc0Ruwo7tgs9UOqV6I4lGxg41ICuq9CzON8+SlXEHd
	I3I0ksiQF4T2TAzYOhfNQCQwc8Ug=
X-Gm-Gg: ASbGnct8CjGk6i+dbWvVON3ei078AXn5VUaFy21aPkYPGhRlS6140pm4kgVQNxXyynm
	HA4waxOU6o4gm6W4A+yO/vlpqc4b4m3g1wJ26j/jgEwlPbm2MNSuaq/XHB8tzJn5OIvvh3se1rE
	l8zCE0/NG09CYjywAj3VpIfe5GAg==
X-Google-Smtp-Source: AGHT+IF8T35Rt08gSPgS+rltivGzc1n46rlZ4IJWTrtMU6+4Meg16ttu5QyyLuTCeM+u1qBLwY2qfkYxheoYoJJMR+c=
X-Received: by 2002:a05:6102:3750:b0:4b2:48cc:5c5a with SMTP id
 ada2fe7eead31-4b9a4fc2cccmr969135137.15.1738111115514; Tue, 28 Jan 2025
 16:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20250128101633.3664659-1-Yash.Shinde@windriver.com> <96981090-c00a-40cb-802c-f709450036f1@windriver.com>
In-Reply-To: <96981090-c00a-40cb-802c-f709450036f1@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Jan 2025 10:38:09 +1000
X-Gm-Features: AWEUYZmeMaCm0qBKcb6_VdAP0sAbMDaPfHsqOZuj93eDJdUom3nLw3DXUbowrsw
Message-ID: <CAKmqyKNHc0rGAAc=3cJZN+uQ8BPhSAyb96Y1+pFGt8bk=ouY6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuriscv: Enable Sv39 memory address scheme by default
To: randy.macleod@windriver.com
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	"Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Sundeep.Kokkonda@windriver.com, "Hao, Kexin" <Kexin.Hao@windriver.com>, 
	"He, Zhe" <Zhe.He@windriver.com>, Trevor Woerner <twoerner@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 00:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210340

On Wed, Jan 29, 2025 at 1:51=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Add Raj, Khem, Kexin and Zhe who know more about RISC-V than I do.
> Kexin and Zhe are on holiday for a week or more.
> CC a few people who have contributed to riscv* conf.
>
> I am not all that familiar with either qemu internals or riscv specificat=
ions so any input is appreciated.
>
> I have some comments and questions below.
>
> On 2025-01-28 5:16 a.m., Yash.Shinde@windriver.com wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> Currently, GCC Asan supports only Sv39 on RISC-V due to custom allocator =
configurations optimized for large allocations.
> These configurations are incompatible with larger address spaces like Sv4=
8/Sv57.
> This fix enables RISC-V's configuration for Sv39 by default when running =
`runqemu nographic`,
> eliminating the need for manual configuration via command line flags (`qe=
muparams=3D"-cpu rv64, sv39=3Dtrue"`).
>
> Fixes [YOCTO #15691]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15691
>
> Reference: https://git.openembedded.org/openembedded-core/commit/?id=3D4b=
4450ff695ef73bf7a2437e142d2e0730d6a547
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
> index d01d988eee..6170ce65f2 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
>  # qemuboot options
>  QB_SMP ?=3D "-smp 4"
>  QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> +QB_CPU =3D "-cpu rv64, sv39=3Dtrue"
>
> Thanks Yash.
>
> To save everyone from doing the math, sv39 gives the system 512 GB virtua=
l address space.
>
> Should we use the ?=3D operator here so that users can easily override th=
is specification
> just as is done for  QB_SMP two lines above?
>
> Please summarize what testing you did.
>
> Did you test with TCLIBC=3Dmusl ?
>
> Since you are changing qemuriscv.inc you and the YP AB should test qemuri=
scv32 and qemuriscv64.
> qemuriscv32 should, if I'm understanding how this works, be unaffected si=
nce it has to use sv32 mode.
>
> Did you find out why sv39 isn't the default for qemu?

QEMU defaults to the max supported SATP mode. I'm not sure there is a
specific reason, that's just what we have always done since we allowed
a user to specify the SATP mode.

> If not, please check the git history and it there isn't an answer there, =
ask one of the qemu developers
> who work on risc-v. It would be nice to have a sentence about that in the=
 commit log.
>
> Did you consider a different RISC-V cpu sub-arch such as rva22s64 ?

I think defaulting to a profile (RVA22S64) would be the way to go,
that will also enable a known set of extensions.

Alistair

>
>    https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b9870d2=
2a8814
>
> I'm only asking because it seems like it might be a good fit for us and I=
 noticed it when
> searching the qemu commit logs looking for sv39.
>
>
> ../Randy
>
>
>
>
>  QB_MACHINE =3D "-machine virt"
>  QB_DEFAULT_BIOS =3D "fw_jump.elf"
>  QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscr=
ipt=3Dno"
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210329): https://lists.openembedded.org/g/openembedde=
d-core/message/210329
> Mute This Topic: https://lists.openembedded.org/mt/110856569/3619028
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
istair23@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


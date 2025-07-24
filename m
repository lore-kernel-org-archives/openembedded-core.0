Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AE9C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 18:14:08 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.760.1753380847937192676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 11:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z9nlMDRJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-719a4206caeso15378217b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753380847; x=1753985647; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PA+FDGnm8KFRDI1WG5qjPM7Ak8dSwQI6T1oFO9TvYfs=;
        b=Z9nlMDRJFkgTzqyv4gaoKpHyAl/UFaiR/qNLePV9ONtj3RUF2k2l8lQphpfh1GwvPm
         9tGGiUxaYDRoVTV4dcVHkJmn/9Uk0H4YiZmmArNzdMJgYDOsHtZ9nAtWjF+CCLlsbZvX
         6oZhtM7qiMNStAHvKbpk8Gw41+NKgae4PmwY7DNYDfH2KOIun9Qz4J7ORGH/fgtR3HW8
         AVCGKzjCWjt21hvlD7h61VP15AwcUbtoa5j91VE/uBAoFyLoqQj5hFa2alZGbDJZM5DS
         fjTznik6bT+xckszBw4mvyz34XxodGNJjzzJKTiN+MppHZTTrNIoLmem4qUVOZPc26tz
         w6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753380847; x=1753985647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PA+FDGnm8KFRDI1WG5qjPM7Ak8dSwQI6T1oFO9TvYfs=;
        b=QgICT9I93C8dy/S6z9mt8aJoN28QjZqs0nDKnSPlePxE9CUVM8scqS4XJWGmvQ3H4N
         oz51z8uiPh7znGosMFN8tfSkPAlfqCITSk0vfNlKw4ut5s5cshQ34QXvtd/qdfwE4gnI
         VmWwNiyRIhJjbw452raiMo/04tWuGuZxNPdoyp0iAcSo/9bWM5jE9nbHwyGus+gEjHor
         CqsoVAw8v9M3XPEMWh1wIj9isUZacATHojkv+0N+DogqhMLrfL9KcgtxJk8lliqev2T+
         /T0GjMKILS1wC5DNwtLd2ubNHdAL3Z6YjIQ3rRDRqPQCdAr3km+jzhUZCHGMFdfWy/wu
         Nnyg==
X-Gm-Message-State: AOJu0YwLwa9u4ar6kIzBSWiJ7XpmoZsrWm9bgcMsv608UnNjwN78zKzf
	fODWt+y/K4SZ51ucnnpiKe1TEjwN5RTkKjDMFYno2dWMVxLRWrb80fjRPZV/flRrX2X8luySPud
	5z/1a5KGDiNkSbHatjwRlWlUZs9KiXrs=
X-Gm-Gg: ASbGncu49fyeJspIB+2qjCXxIWl5kP75HPK0XHwTwfAEopItepLqOaQ7mImfStp7yka
	OO7MMyi/0ENYufKgl2chUxdzKEGl+CFt5TXvY23DbdnYwNE95fx066+BOGCBeR+E2kdlPfWct4s
	IpddZ6rICqt+XCZYQYYqZ1yKX4eId+h+APHo53LvDmYtT9eNAlNNAv1GJccAfDXDHZ8L7zLYJL6
	1m1bvZfI4YrjVMK7zAt8EfnP/mCQXB00P4A
X-Google-Smtp-Source: AGHT+IGVbdugpIy64GFm10Vys91wi+VFltmrb2E/3C6mcetIWRMWGGkrEAAFtCMkEn2pFk9v1RI52K136J0W9DEJfBE=
X-Received: by 2002:a05:690c:685:b0:711:7128:114f with SMTP id
 00721157ae682-719b41550f7mr101657737b3.12.1753380846430; Thu, 24 Jul 2025
 11:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250723012936.3799471-1-raj.khem@gmail.com> <ed194d92-ea63-4282-bf93-a93e01a97816@cherry.de>
In-Reply-To: <ed194d92-ea63-4282-bf93-a93e01a97816@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jul 2025 11:13:40 -0700
X-Gm-Features: Ac12FXxqSPT3_A95uTGUujmtV0wKYumnmBh6TflP4MZcUzwxGEskx98uNb8_JBY
Message-ID: <CAMKF1srDvVomf-3kDmrW0Ox_WGCxJd7-gvQY7JM-H4U=x=QMdA@mail.gmail.com>
Subject: Re: [PATCH v3] feature-arm-crypto: Add +nocrypto to -mcpu when crypto
 not in features
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 18:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220855

On Wed, Jul 23, 2025 at 2:06=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Khem,
>
> On 7/23/25 3:29 AM, Khem Raj wrote:
> > When crypto is not in tune features then add +nocryto to
> > -mcpu explicitly. This makes the behavior between clang
> > and gcc match. Currently -mcpu=3Dcortex-a72 has different
> > behavior in clang and gcc in terms of what features are
> > considered default. Clang enables different set of common
> > features than gcc on other hand. For example clang
> > enables crypto with default set but gcc
> > does not, gcc recommends to disable unavailable extentions
>
> s/extentions/extensions/
>
> > in -mcpu [1] explicitly. crypto is optional on cortext-a53
>
> s/cortext/cortex/
>
> I am not disputing this patch is needed but there's just conflicting
> information (to me).
>
> This says
>
> """
> For example clang enables crypto with default set but gcc
> does not, gcc recommends to disable unavailable extentions
> in -mcpu explicitly
> """
>
> which can be summed up to "gcc does not enable crypto by default, but
> recommends disabling it when unsupported", doesn't that mean it's
> enabled by default?

yes

>
> And I finally managed to understand what bothered me.
>
> -mcpu is the one which enables extensions by default it seems? But the
> variable (TUNE_CCARGS_MARCH_OPTS) here is for -march, not -mcpu! And
> -march doesn't specify what it enables by default in the docs it seems
> like, see

Well, extensions can be enabled/disabled either with -mcpu or with -march a=
nd
they should have the same effect, but they are not documented as the
same set between mcpu and march in gcc manual atleast, maybe it could
be made better.
Perhaps renaming the variable to something like  TUNE_CCARGS_CPU_EXTENTIONS
might be appropriate since it is currently used for ARM architecture
only, I don't see
a reason why it can not be used for other architectures. For RISCV e.g. the
infra to compute the march/mcpu options is different. Perhaps some
logic could be
made common

see below, the list is identical between mcpu/march.

aarch64-linux-gnu-gcc -mcpu=3Dcortex-a72+predres1 ~/tests/a.c
cc1: error: invalid feature modifier 'predres1' in '-mcpu=3Dcortex-a72+pred=
res1'
cc1: note: valid arguments are: rng flagm flagm2 lse fp simd dotprod
sm4 rdma crc sha2 aes crypto sha3 fp16 fp16fml jscvt fcma rcpc rcpc2
rcpc3 frintts i8mm bf16 sve sve-b16b16 f32mm f64mm sve2 sve2-aes
sve2-bitperm sve2-sha3 sve2-sm4 sve2p1 sme memtag sb predres ssbs
profile tme pauth ls64 wfxt xs sme-f64f64 sme-i16i64 sme2 sme2p1
sme-b16b16 sme-f16f16 mops cssc lse128 d128 the gcs fp8 fp8fma
ssve-fp8fma faminmax fp8dot4 ssve-fp8dot4 fp8dot2 ssve-fp8dot2 lut
cpa; did you mean 'predres'?


aarch64-linux-gnu-gcc -march=3Darmv8.1-a+predres1 ~/tests/a.c
cc1: error: invalid feature modifier 'predres1' in '-march=3Darmv8.1-a+pred=
res1'
cc1: note: valid arguments are: rng flagm flagm2 lse fp simd dotprod
sm4 rdma crc sha2 aes crypto sha3 fp16 fp16fml jscvt fcma rcpc rcpc2
rcpc3 frintts i8mm bf16 sve sve-b16b16 f32mm f64mm sve2 sve2-aes
sve2-bitperm sve2-sha3 sve2-sm4 sve2p1 sme memtag sb predres ssbs
profile tme pauth ls64 wfxt xs sme-f64f64 sme-i16i64 sme2 sme2p1
sme-b16b16 sme-f16f16 mops cssc lse128 d128 the gcs fp8 fp8fma
ssve-fp8fma faminmax fp8dot4 ssve-fp8dot4 fp8dot2 ssve-fp8dot2 lut
cpa; did you mean 'predres'?

>
> https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#index-march-2
>
> vs
>
> https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#index-mcpu-2
>
> So we need to modify the commit log to reflect that and not be misleading=
.
>
> While at it, I'm wondering if we shouldn't simply do that for all
> TUNE_CCARGS_MARCH_OPTS that we have today?
>

Perhaps yes

> I see:
>
> +crc, +fp, +simd, +dsp, +idiv as well that have a +no variant.
>
> +sve and +sve2 though, couldn't find them in the official docs of GCC
> (though
> https://community.arm.com/arm-community-blogs/b/tools-software-ides-blog/=
posts/getting-ready-for-sve-with-gcc-11
> and
> https://github.com/gcc-mirror/gcc/blob/master/gcc/config/aarch64/aarch64-=
option-extensions.def
> define both, so I guess it's fine too). We probably should report or fix
> this in the GCC docs?
>
> > and cortex-a72 while, this is not as common but Broadcom
>
> "while, " is a bit odd here :)
>
> > SOCs in raspberrypi3/4 have dropped crypto for cost
> > reasons [2]. This results in illegal instruction
> > traps [3] [4] when building components e.g. chromium,
> > qtwebengine, weston etc. with clang using -mcpu=3Dcortex-a72
> > for rpi4 target.
> >
> > Adding +nocrypto makes it behave like gcc does today. We
>
> s/it/clang/
>
> > do have separate tune if crypto enabled cortex-a72 cores
> > are to be targeted (cortexa72-cryto) as DEFAULTTUNE
> >
> > They are added to default feature file since crypto extension
> > is available in multiple arm architecture versions e.g. armv8,
> > armv9. It is optional extention as per spec [5]
>
> s/extention/extension/
>

I have tried to address typos and thinkos in v4

> Cheers,
> Quentin


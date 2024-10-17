Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A80D374B1
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 16:02:52 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.1724.1729180970338044588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 09:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vw5fuCZK;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5e56759e6d7so649218eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729180969; x=1729785769; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1m1awddg6uoVdtpcmlZbyyUVkfwLqjT5qOiAl50eRY=;
        b=Vw5fuCZKFH+P1MW4ycKr5RR0uBvYdfpplLvK+9vLU6C7qW/Pd1KiT2GTQgEVipcLRQ
         CiZ/6kfHFjFDhBiXXbMlPo3IzV12T+zi1dhjXxCEe38ZM8nGhvmj3x8kdr5PEfYU0/4m
         nKjswbCA/PF+4Dw5rUMFQkXG6V/LRkFSGfK53l7pKNbpfEgu8q0/2hS9SL5xVyxe/ieh
         np0AfNyYiElo+owcKerbwx8Js8QySegoZlbY69xwfhXPhLwpF422M/SeB6yX7WLH4iuP
         +2e1VQYEZ6x9eXVmpav+iMo42737K7f/oQkUnfQpXfwpsZp8Igqk2ZbuIBzFwdoO++9z
         98nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729180969; x=1729785769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1m1awddg6uoVdtpcmlZbyyUVkfwLqjT5qOiAl50eRY=;
        b=mzasXlR4kq4PkJ2H43/zKccIPEqIgPPPzqqyZP0/nkSVfJBLxdIM9+9qWG1cljqci6
         4CJBN+BpUH4M6sWcQBiVinulmGqI7SCfQ1Fh6HQg5qi/RUX0oHYZ2BJJlmyuOzgjunxS
         zy1ZJMZS0VX2lb0ArKEKO+auczl7ib/QKLjF4jWOoi4X+Cc9DEuRDdAYa0RSl9Bwukv1
         k30auOdUAt6fyExvLDLLTpjLuP5TD8PmSVSpnl3kfBYxmLzUlBMWl2C40wD3HNlFrE9V
         +ZPFqO4kF8q7afWV3xdhqdRmiOd6zoaUn49GIZFo2tYHjqGBuhpBDICVxpz0V9gXRsi4
         XKRg==
X-Gm-Message-State: AOJu0YydabpgETmw6GU/Y6hL9Xa2WIfhHXnKqhV8HPuyxHYk31/A5WgE
	aG/oJST4dRCy1iCYTJ17QUYiVKVuvle2MeOmNpGtyYvTj2eus6UYyLBMCss4+HcseYWpY86kbYs
	jgpULM0yQ16cF7S/o9hEzMu7hvx6pACOr
X-Google-Smtp-Source: AGHT+IFrx94uX3G8whbWRd3UIGgPHr3qODreDB7nku0aKxerbHtMtI3DFcl9aAGsUZUyb4ddC7XjZiZRYMqnh2gappw=
X-Received: by 2002:a05:6820:1ac1:b0:5e1:eba9:8fe7 with SMTP id
 006d021491bc7-5eb1a1a9932mr13420333eaf.3.1729180969391; Thu, 17 Oct 2024
 09:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241017123244.2418344-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20241017123244.2418344-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Oct 2024 09:02:23 -0700
Message-ID: <CAMKF1sqpqAoKA65ggR=zn=CjCT6+h-yj4rwx1O2ed9_K--2QWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-target-config: Update the data layout for
 x86-64 target
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Naveen.Gowda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 16:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206031

This patch is ok, any rust version using clang 18 or newer will need this.

On Thu, Oct 17, 2024 at 5:33=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> The data layout for x86-64 target was different in rust from llvm.
> It resulted in the following data layout error:
> -------------------------------------------------------------------------=
-------------
> error: data-layout for target `x86_64-linux`, `e-m:e-i64:64-f80:128-n8:16=
:32:64-S128`,
> differs from LLVM target's `x86_64-unknown-linux-gnu` default layout,
> `e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:=
64-S128`
> -------------------------------------------------------------------------=
-------------
>
> The issue was reported in meta-rust layer as:
> https://github.com/meta-rust/meta-rust/pull/442
>
> Hence, the data layout for x86-64 is modified as per the llvm sources whi=
ch fixes the issue.
>
> After running the testsuite with the modified data layout; it was observe=
d that the
> "tests/codegen/i128-x86-align.rs" passed. The modified data layout fixed =
the scalar pair which
> resolved the testcase failure. Hence, the testcase has been removed from =
the exclude list.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 2 +-
>  meta/lib/oeqa/selftest/cases/rust.py           | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
> index 334f2e7d5f..f7aa6c74d8 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -153,7 +153,7 @@ TARGET_C_INT_WIDTH[aarch64] =3D "32"
>  MAX_ATOMIC_WIDTH[aarch64] =3D "128"
>
>  ## x86_64-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[x86_64] =3D "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
> +DATA_LAYOUT[x86_64] =3D "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i=
128:128-f80:128-n8:16:32:64-S128"
>  TARGET_ENDIAN[x86_64] =3D "little"
>  TARGET_POINTER_WIDTH[x86_64] =3D "64"
>  TARGET_C_INT_WIDTH[x86_64] =3D "32"
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
> index cbe6366f75..88d7bb9518 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -83,7 +83,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
>                              'src/tools/tidy/src/',
>                              'tests/assembly/asm/aarch64-outline-atomics.=
rs',
>                              'tests/codegen/abi-main-signature-32bit-c-in=
t.rs',
> -                            'tests/codegen/i128-x86-align.rs',
>                              'tests/codegen/issues/issue-122805.rs',
>                              'tests/codegen/thread-local.rs',
>                              'tests/mir-opt/',
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206017): https://lists.openembedded.org/g/openembedde=
d-core/message/206017
> Mute This Topic: https://lists.openembedded.org/mt/109062536/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1369BCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 16:15:00 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.304.1757434494284522595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 09:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kCEvAM8r;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d6051afbfso48654627b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 09:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757434493; x=1758039293; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrNshKefPxIgkE92FbCy3LYFPqJxDBjJvxnuhbK/6Tg=;
        b=kCEvAM8rpdtOvb3bhMEXceUAhhUcP9i3jcAh4iZMgiO0f+UiCieP/Ll/NLww31bZpp
         vIUS9HAzbr1v4NuIAZln9BJmvJQI28j3iFJPKc2kJa58f8WaJs8ICkRoR6jQcvTAtUuj
         0oL+zddVjq6j1sM0tpiJCXr/2d/lYy6vCSVt10L6hhd7tOJuyrOIjZr47FByZqOi2evx
         S6fVdHL/KrXkc5DWwMRxNmr0/8GmVd0bx8kUya7Fz68aUC7hlUiqfLskWWtQpueAHQlh
         mTBj+/v5mmL3ukLiciGO5kOL46SzJ/XuLGz+mxxD7wtpR+4oMlYz/b+xWPkjzwF3AHqw
         7nuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434493; x=1758039293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrNshKefPxIgkE92FbCy3LYFPqJxDBjJvxnuhbK/6Tg=;
        b=JTCRh8OzeWsSnoqZFl3eN25BEZyHaa8f2TBaX2a10S1csw5yXo9IKxtjzXYP0n4vik
         ke8mQxMVhdW1KFdtMxYqJanSFI920+huslj4JmIrCHy1VY2inSJ659canRInK4TEoIPH
         SxUMXJF6rW4RR0pPZJM/u8xUSWsPsgH0YfMVviSYTXLnxJ7SDRCXJc92c8wHr1SfV3tH
         gF+Qvs7PKe/30/SCwC3/nfTUqj8DlQdTJrXTgiuW+7xnDFlUTAg4PKhCYMTMVsJqZiRe
         I4EuVMvQ2fpib6Umi/XQS1P0kxG+bObMGJDSiJDxMov3ky1Zppb9YsJ7yxST+B9C3+KO
         28aA==
X-Forwarded-Encrypted: i=1; AJvYcCVarocdST+q3jUiN+zZXktuaG3wFPvMm3sjk1z1k/R/fRuhsJtWRsa1VQxzLvnYWU7VxDetmKAzFvLpc6nbhheP5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3V06yqt7uiMdp3MggJu0M8y6DJEnk1igBmIMiKJwC1bxlAUWx
	/cLcIix7+phOiToQ3KL+TE0StI6NXUWSVxp0pyjMr4zKmMkfglvwZxR6LKchP+YjuVTAbk+0kho
	ciGPHeVSoJ1bgC5SbjI01JYnpx8faqqY=
X-Gm-Gg: ASbGncszKAu1VetD23NyqFL2Y+8ieXtnbqG7x9JiT7s8oHEI96DNJH4swzM4jj13zrO
	yVtFcbsh1rTt7oDfNQkRziEmnhsh6KdFcPBByJbsL0bGkxnN9XmUn9XKO8XdUSoo6De4CERBoi8
	izvwr8d0OksktVsvsnGDpWbKDhnTqWz1MTKhX9izZCuqk8oNhDdK55oXPQzOMR12e2pzfUCGpoY
	kXARGyrV6/IU/ZY0a3kauAPNbNMYHkNwj4bJ0j/WNCcd/VTloGJ426fmRID2n9n9tTzdY0Ugmh9
	h6qMkyA9r5a0i4AcE4Q7VC9Mi9TWEE2dv2oAED05f4yuAW+JKHiUksMuPdqCDp1BNR7AQaw24m7
	W/g==
X-Google-Smtp-Source: AGHT+IEI6fFzO+paoqsv6sn9re0x0jyPwtNOUQKHuq922eVOvsMjgtRQgCZB85eQ96yZxlrevSfICGXdr19f5ZZx1ac=
X-Received: by 2002:a05:690c:6386:b0:721:5b31:54bf with SMTP id
 00721157ae682-727f4969c21mr119756047b3.35.1757434492384; Tue, 09 Sep 2025
 09:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
 <CANNYZj99rO9YpEUe1_sGBFXiaOA0dgoRMRK_AwgPKkaQWCnhfA@mail.gmail.com> <454f5ba1-09a2-456c-8df8-0a0fe441f6cf@windriver.com>
In-Reply-To: <454f5ba1-09a2-456c-8df8-0a0fe441f6cf@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Sep 2025 09:14:26 -0700
X-Gm-Features: Ac12FXwFG-l5mhc-XBUQf08pId5j7j69rEgZIQzqB8jl45qd1CzQqXaF_eyPpeQ
Message-ID: <CAMKF1srZbQepXc5MAHphPARTu9XJFyQM-9fyotVX9bqA4LQNBg@mail.gmail.com>
Subject: Re: [OE-core] Drop rust-llvm and use clang instead
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>, 
	"Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 16:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223122

On Tue, Sep 9, 2025 at 1:19=E2=80=AFAM Deepesh Varatharajan
<deepesh.varatharajan@windriver.com> wrote:
>
>
> On 28-08-2025 18:33, Alexander Kanavin wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Thu, 28 Aug 2025 at 13:45, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> We have removed rust-llvm and updated the Rust build to depend on Clang i=
nstead.
> With this change, we successfully built Rust for both native and target. =
Additionally,
> we ran a full bitbake world build without encountering any issues after d=
ropping rust-llvm.
>
> We now add these flags "-C link-arg=3D-lz -C link-arg=3D-lzstd" because o=
f this following diff
> otherwise we will get errors during link time.
>
> Setup in rust-llvm
> -DLLVM_ENABLE_ZLIB=3DOFF \
> -DLLVM_ENABLE_ZSTD=3DOFF \
> -DLLVM_ENABLE_FFI=3DOFF \
>
> Setup in clang
> -DLLVM_ENABLE_FFI=3DON \
> -DLLVM_ENABLE_ZSTD=3DON \
>
> You can find the relevant changes on the poky-contrib branch here:
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dharish/rust-llvm
>
> Differences seen in builds:
>
> with rust-llvm for bitbake rust
> real    54m54.184s
> user   0m13.470s
> sys     0m1.380s
>
> f/s usage
> 41G
>
> without rust-llvm for bitbake rust
> real    57m51.015s
> user   0m18.129s
> sys     0m2.051s
>
> f/s usage
> 45G
>
> We are open for suggestions, improvements, or concerns regarding this cha=
nge.
>
> Thanks for checking this! Is it possible to have a conversation in the
> rust upstream about starting to use proper clang, or reasons to
> continue using rust-llvm? Maybe there's a ticket or you can open one?
>
> While 'proper clang' appears to work now, deviating from what rust
> developers do is risky and can cause problems.
>
> Alex
>
> Hi All,
>
> Summary of discussion with the rust upstream about using latest LLVM inst=
ead of Rust maintained LLVM fork.
> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm=
-fork-what-rust-uses/23489
>
>
> Upstream LLVM is generally compatible:
> - Rust does support building with upstream (vanilla) LLVM, especially the=
 latest major release and the one or two preceding ones.
> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating=
-llvm
>

Thanks for the discussion, I think its expected that there are rust
specific backports, but it seems its not a whole lot of patches with
llvm20
and I hope things are just getting better with future releases. We
need to ensure that such patches are not regressing clang if we do
that sort
of backport, hopefully there will be no conflcits.

>
> Things to note when using Upstream LLVM:
> - Rust may include cherry-picked bugfixes in its LLVM fork and so using u=
pstream LLVM might lacking bug fixes from rust's forked llvm. (But,
> this anyway we will catch it up with newly released rust update)
> - If a bug shows up using vanilla LLVM, it's on us to track it down unles=
s it's a known issue. (In general, the latest llvm is always under test wit=
h
> rust nightly builds)
>
>
> Impact on Yocto Rust upgrades:
> - Rust upgrades shall always check for updates on rust forked llvm and ba=
ckport the relevant patches to clang's llvm.

right

>
>
> Regarding the rust forked llvm local patches:
> - There are no local patches on rust forked llvm other than the backporte=
d fixes from llvm master.
>
>
> Do let us know how can we proceed on this.
>

I think we should go ahead, we have llvm-21 already in final stages so
that might be a bit to address, do find out which version of rust will
use llvm 21.

> Regards,
> Deepesh


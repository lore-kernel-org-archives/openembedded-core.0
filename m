Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CBAC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:27:32 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.124.1700497647632457028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DjubtEqs;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-54553e4888bso6346196a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700497645; x=1701102445; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1x1oBAyimzhQ1awHQEtF5DMRDL39ny3YjZwjv9JSbE=;
        b=DjubtEqsNXrSKW2C0YhaM/D5WKJFFc8nibhq3zFxUXmGnBonHmtDfij00tnVZdnk37
         6uhnZUkGA/aifUkQFmM/wac0dH4tfgohpRD7K8WUaHr9McGRt3Vh1gFQKiPVCg1ixV93
         MfYWfZv+dYtAakZ+T+al/Wc4lHzX8HbQTi6DuBXyc1CEOvEoXpQin95+YrmBdNnGA3L5
         muT2nAjuw8BNaflriPpHWBhwBfLgJVciYh6c8WJjw2cRKlwduIfHEfjNBmOaDGkaDB5k
         Iv3R4QLWnB9HK48IZv9lsm5jHm2o3kxWy4oXKKZiWF7b/QZg03kj74ZWDH8eBjSEsb2/
         ufaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700497645; x=1701102445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1x1oBAyimzhQ1awHQEtF5DMRDL39ny3YjZwjv9JSbE=;
        b=fKaESIOooWIEwEE3/UtaM8c0oHwccLYRYUHbxfDo12qtAVQeLsDG7VtqgLgRMbgUPI
         avtTFBXN7AT8f70wzj8Pbp12Qk40H+4ttd/AXShnsjwAk1mNCiD8+ZRF1XtvQyLyy/AY
         XkI4Rfr71z7vled+/DmB8EWVE+5O2zY54qBkXQ24n4vTRa8j2Auo62gaWsDenVi5dNup
         6Qj/x5Mz6f7m8Ke39fGqI2teD1uK17jrSlJaEQdCGYND6Kbtd8a9un2090/kcy0yj9wT
         Jm5qPd4nbJO5XCnJkKS3RwSzC7PLTRcWx1LKtd52IsXA+s3hTxHWQSUPdCvmk4bP/sNr
         y2oQ==
X-Gm-Message-State: AOJu0Yz2633psrNGFL3I5ikevBMbgjCkpNqm+j+qZ/3HmiBkYyAfZi3i
	T2FzwGHx2pFwAUAU4xubFScOtMtLw+M27Rotg3mApJWyfkM=
X-Google-Smtp-Source: AGHT+IGzaOSPkupqgY+gM3i4M9nK4gtAwIfxRvW0+I1U4pjyZCSRlna4liIggzqtfzS+qDx0M0mlp4V7k5OGjGqR+y4=
X-Received: by 2002:a17:906:92:b0:a00:9860:7fa7 with SMTP id
 18-20020a170906009200b00a0098607fa7mr926452ejc.68.1700497644552; Mon, 20 Nov
 2023 08:27:24 -0800 (PST)
MIME-Version: 1.0
References: <1795D005C571B567.15940@lists.openembedded.org>
 <94196e06-f078-4df5-afee-e29c05f11b37@windriver.com> <CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com>
 <685c9a01-2160-4f1d-afd0-cec3593b1be6@windriver.com> <179867874B67F596.6542@lists.openembedded.org>
In-Reply-To: <179867874B67F596.6542@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 20 Nov 2023 16:27:09 +0000
Message-ID: <CAO5Uq5Tn=M_P5ZqPobN8nsu1KtgvHgZhPhQWpvUSR-6UmFdzeg@mail.gmail.com>
Subject: Re: [OE-core] [RFC 1/5] valgrind: make ptest depend on all components
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: randy.macleod@windriver.com, Alexander Kanavin <alex.kanavin@gmail.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "Shinde, Yash" <yash.shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190888

On Fri, Nov 17, 2023 at 12:04=E2=80=AFPM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Wed, Nov 15, 2023 at 4:30=E2=80=AFPM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > On 2023-11-15 9:48 a.m., Alexander Kanavin wrote:
> >
> ...
> > Rust would be nice to do too.
> >
> > Indeed.
> >
> > Yash and Sundeep have 1.72/1.73 updated and are working on
> >
> > getting the test suite to work but struggling with that.
> > I asked him to track what's happening in:
> >    https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15275
> >
>
> I did start looking at this... mostly I've failed to find enough time
> to even get to the point where I've got a useful environment for
> running the tests outside of bitbake (and hence avoid a complete rust
> build cycle).
>
> Rust 1.74.0 landed yesterday, so I'm going to have another look... if
> it's useful to anyone my (very much WIP) tree is here:
>
> https://github.com/akiernan/poky
>

I've finally got this running in a way I can usefully inspect and try
things and it's beginning to feel like we've headed into something
which simply isn't supported.

The failure is this:

  thread 'main' panicked at src/tools/compiletest/src/common.rs:519:30:
  no entry found for key

Which is empty because the mapping list is collected by running rustc
with -Z unstable-options --print=3Dall-target-specs-json, but that fails
because we're not running a nightly compiler:

  error: the option `Z` is only accepted on the nightly compiler
  help: consider switching to a nightly toolchain: `rustup default nightly`
  note: selecting a toolchain with `+toolchain` arguments require a
rustup proxy; see
<https://rust-lang.github.io/rustup/concepts/index.html>
  note: for more information about Rust's stability policy, see
<https://doc.rust-lang.org/book/appendix-07-nightly-rust.html#unstable-feat=
ures>

Basically feels like running the test suite is only supported on the
nightlies...

This is the full piece of useful logs for reference:

Testing stage1 compiletest suite=3Drun-coverage mode=3Drun-coverage
(aarch64-unknown-linux-gnu -> aarch64-poky-linux-gnu)
thread 'main' panicked at src/tools/compiletest/src/common.rs:519:30:
no entry found for key
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race
Note that not all variants of mir-opt tests are going to be blessed,
as no mapping between
a 32bit and a 64bit target was found for aarch64-poky-linux-gnu.
You can add that mapping by changing MIR_OPT_BLESS_TARGET_MAPPING in
src/bootstrap/test.rs
Testing stage1 compiletest suite=3Dmir-opt mode=3Dmir-opt
(aarch64-unknown-linux-gnu -> aarch64-poky-linux-gnu)
thread 'main' panicked at src/tools/compiletest/src/common.rs:519:30:
no entry found for key
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race
error: the option `Z` is only accepted on the nightly compiler

help: consider switching to a nightly toolchain: `rustup default nightly`

note: selecting a toolchain with `+toolchain` arguments require a
rustup proxy; see
<https://rust-lang.github.io/rustup/concepts/index.html>

note: for more information about Rust's stability policy, see
<https://doc.rust-lang.org/book/appendix-07-nightly-rust.html#unstable-feat=
ures>

error: 1 nightly option were parsed

thread 'main' panicked at synthetic_targets.rs:66:9:
failed to gather the target spec for aarch64-poky-linux-gnu
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race

--=20
Alex Kiernan


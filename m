Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F238DEDEC4F
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 12:58:05 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.11174.1694609883625877598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 05:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LGj7GFXo;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bcd7a207f7so108724831fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694609882; x=1695214682; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbZv/WEyc3y05BRZ9mynhoJ1vU/tKF+PzjH+ulg5fto=;
        b=LGj7GFXosCZF8gV0uRFCE6Q5ijTyIkJD1TP3Rqwe31KspMLmvfq4OUySHMOCdO6ZUd
         21yeDqQwEGTkI2gm/AbbG1hBKyl6L5/77t13/OjQ0wzPyFPM0R0eApFL4afSbFKMhgnB
         22QbCLa6FeYwe2cc9dcqtx689+Q6sRfsFgZJTNHQj5pz6mae0o7nHZPV2bCejgVmKJMF
         aN9V83x+mEixqgwdT2iAG19Cotk22kLUOB+vVW4lA8OkWtJ8JoRNbpRiag76FutSL9Zv
         gka8FLJMWoCdU9cRQIegA+qOsUInsvb4XktKzxR+az4qdxgruhNDTXsA2ojNQ8upNJfA
         a1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694609882; x=1695214682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbZv/WEyc3y05BRZ9mynhoJ1vU/tKF+PzjH+ulg5fto=;
        b=H31Fcf/p9vrDeL4pEHAEyxQLDzt+DCVhq3G/4H2ZnyTSUjhKKGtboE015wqRlWNGPe
         fD2/oLqAQkuiVDHbDwVQ++wI4m2C6KfJQevrbiEzq1+J/JTVi+R4DALFQO6dtXw5qBQH
         i6J9XOa3e1n0Qe/ggw0/n/kii2ChXuZydFv0ss4qrAbAQznIhFEOkmBWbzgXSW8/ajJQ
         OAGi1KTM/Zg+Q5ZSPHFKvoDDRUiLlkFXW6EP84IdpzIh0rW9vbIfm3hV0Hn2zSArPeQc
         Vw7HiuWO098YbK0643Ud4KzO8z3fwjXJjdd3XRo0HvGuoxG21hk5ETipAU73bUIs1Rpf
         8XxA==
X-Gm-Message-State: AOJu0Yy9gD9iA6Q5ju3AXuOsscmky5yVrgYJOPsa59dlgC2OEGrkGYRH
	k9S15l4BJmXgsOpjfWer5R8qmfeK1HCx+4ZM3Bs=
X-Google-Smtp-Source: AGHT+IGsOW4eXWSeQJj54yLWhjYE4kIYjFTXlmOm7s8saPchjyrcCKcfWoGea6RfPf7yjsWUIxDAycDnXQsXQds9ilc=
X-Received: by 2002:a2e:2c12:0:b0:2bc:b224:98ac with SMTP id
 s18-20020a2e2c12000000b002bcb22498acmr2259816ljs.31.1694609881387; Wed, 13
 Sep 2023 05:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <CADEQF5GFW16EDaPdyiOTouH8nTeMG+TTdZerTHyStgAiKy+_Vw@mail.gmail.com>
 <CANNYZj9XFxJvN6UjbRfBgRVsMi-oASar_neY5cDn-XcnQVK8bw@mail.gmail.com> <CADEQF5FGORKTYsNxR5aw+H1Uy-Wh_BbMyOs_SExbqb6+Ttg8Aw@mail.gmail.com>
In-Reply-To: <CADEQF5FGORKTYsNxR5aw+H1Uy-Wh_BbMyOs_SExbqb6+Ttg8Aw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Sep 2023 14:57:49 +0200
Message-ID: <CANNYZj_xGVfDuF7+XCo4r54451PRPy=89QOC01Np4bJhDHJLSw@mail.gmail.com>
Subject: Re: [OE-core] mickledore - adding rust tooling to sdk seems to create
 problematic rustc/cargo executable configurations
To: Danny <dadleyy@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 12:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187589

Can you try this in a plain poky checkout (to the same revision as in
your setup) with no other layers? Machine qemuarm, image
core-image-minimal. If it works, you have a reference point to compare
with and untangle where the breaking difference is. If it doesn't
work, then I or someone else have a way to reproduce the issue.

Alex

On Tue, 12 Sept 2023 at 23:42, Danny <dadleyy@gmail.com> wrote:
>
> Hi Alex! Thanks for the quick response. I tried removing my `TOOLCHAIN_HO=
ST_TASK` assignment and adding the `SDK_TOOLCHAIN_LANGS` entry but I'm stil=
l seeing the error.
>
> fwiw the output from `cargo build --verbose` shows me the `rustc` calls:
>
> ```
> rustc --crate-name omg --edition=3D2021 src/main.rs --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts,future-incompat --diagnostic-w=
idth=3D157 --crate-type bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C=
 debuginfo=3D2 -C metadata=3D62f339e5c64d61ff -C extra-filename=3D-62f339e5=
c64d61ff --out-dir <omitted>/target/armv7-unknown-linux-gnueabihf/debug/dep=
s --target armv7-unknown-linux-gnueabihf -C linker=3Dtarget-rust-ccld -C in=
cremental=3D<omitted>/target/armv7-unknown-linux-gnueabihf/debug/incrementa=
l -L dependency=3D<omitted>/target/armv7-unknown-linux-gnueabihf/debug/deps=
 -L dependency=3D<omitted>/target/debug/deps --sysroot=3D<omitted>/sysroots=
/cortexa7t2hf-neon-vfpv4-linux-gnueabi/usr -C link-arg=3D--sysroot=3D<omitt=
ed>/sysroots/cortexa7t2hf-neon-vfpv4-linux-gnueabi
> ```
> should I be double checking something is available to me in those sysroot=
 paths?
>
>
> On Tue, Sep 12, 2023 at 1:48=E2=80=AFPM Alexander Kanavin <alex.kanavin@g=
mail.com> wrote:
>>
>> On Tue, 12 Sept 2023 at 19:26, Danny Hadley <dadleyy@gmail.com> wrote:
>>
>> > I can provide as much additional information as needed!
>>
>> I think you need to set
>> SDK_TOOLCHAIN_LANGS =3D "rust"
>> and then things should just work.
>>
>> Alex


Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770F3C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:52:12 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.5784.1702291924128651514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 02:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C3gXo2l1;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so52568991fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 02:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702291922; x=1702896722; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+scgJVrGF2yXXOmeK04PshrjrWFUhhE2T3rpIhEN2sM=;
        b=C3gXo2l1bENvJf+BldoknpiZHuRToeZwUUOwwbUNpWlsS1XR1Sj6YncHt8gGCjq3a5
         PFRPd0xJ5MdcFQQGSuElx7b+bnF2u/APXy91cCDzmbABSQb0kc8X6OVnP50HlvJ5hOX0
         7M2UIkG68hkAnLs3M4QY9O5yPfTE9Z/ueZJc4Q0x6m2t2iimlofXWQ8XO9fBKJd2ry0b
         sB+Gg8bWVUZMR3qotX0cLJFPJf1YAxK1x6rKBIdRaOb8KzYEs+72mtAfWtRMs25GAvG+
         3GABq2bAEtfT8chnneEpuealMAHmoMaYWlfxRHb7Er5Ilv/hN/OCRsgOvB29mivVF4pN
         MMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291922; x=1702896722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+scgJVrGF2yXXOmeK04PshrjrWFUhhE2T3rpIhEN2sM=;
        b=KU4OMaRMlML11Mo3wVQ+Jyntp1IziEm2n2Nm8ldC6WkAQuNm7OlO4VmwWQe7gD9sec
         JFljwHwwZOktQHfLnEouVMUEgJ7+4zAKcMTTB7SCk2i+blZrhqepOLSCu/JUgNG64JZU
         DBq6EbAeJxWFd3RHfNBsElx0hPyiYeL8HgpopmSgsCJ+nfLOylcn8k21EciErTTFzYKt
         ghw7lfBdfv0FdbxiJ5APQw/WwFcz+klinWv0SWneMhfu4nESrpIcvmghTUqnELWrrbVh
         n7JOMZSRo9KtfFwBUrbxgHlX2LQpdZSzsBIbjzWvL3suTZd60xNxrarb/zxQOJ60UOLG
         3g/Q==
X-Gm-Message-State: AOJu0YzdMh3yMNpf8juNdk01yetRdMbfBbk0GXT+yj84X6m9ws0YoH18
	IWz+jQsF+ghvXpI9/pnjAs4/0qykMujFV3r3/4HnyyW0p2U=
X-Google-Smtp-Source: AGHT+IHB3OoWcJB4bK0ZSHVXVGkO1mgqM4KHrJes/cTXV7KPlJrr106hb+H5dKvc9gdNiYDSCRQJ4Qdx11HC9ck3Ir8=
X-Received: by 2002:a05:651c:608:b0:2cb:2f03:3a8a with SMTP id
 k8-20020a05651c060800b002cb2f033a8amr682136lje.21.1702291921945; Mon, 11 Dec
 2023 02:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20231210191046.4785-1-alex.kiernan@gmail.com> <CANNYZj-Z9apFWXOw6J63fQn+CRn-dLUEEer-oW7nieVHJ+M0pQ@mail.gmail.com>
 <CAO5Uq5SPRKNTSACY6X7+8FcswTNMkg2JEL5ub7oBJfSWoNCDow@mail.gmail.com>
 <CANNYZj_6KHT0=WDhcUqL7tEY0kZmhkU4wvRKGRp_cHcgN-Q=QA@mail.gmail.com> <CAO5Uq5Q=MJVhmo7cWBm23C05RnLW6eNCQXTo_=4zoDgmb9vLKg@mail.gmail.com>
In-Reply-To: <CAO5Uq5Q=MJVhmo7cWBm23C05RnLW6eNCQXTo_=4zoDgmb9vLKg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 11 Dec 2023 10:51:49 +0000
Message-ID: <CAO5Uq5ToD0o5p6jf=-s-UFUQMiy=XenKp5s88btLjsqJA_YrRA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] cargo-update-recipe-crates: Use CARGO_LOCK_PATH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Frederic Martinsons <frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192161

On Mon, Dec 11, 2023 at 9:43=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:
>
> On Mon, Dec 11, 2023 at 9:28=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Mon, 11 Dec 2023 at 10:09, Alex Kiernan <alex.kiernan@gmail.com> wro=
te:
> > > In a single project there are (potentially) multiple Cargo.toml, but
> > > just one Cargo.lock. If there's multiple Cargo.lock files in a repo,
> > > that implies multiple projects which I don't think we've any way of
> > > building from a single recipe.
> >
> > I'm thinking of projects like librsvg, python3-bcrypt or
> > python3-cryptography where the build is orchestrated by meson,
> > autoconf or setuptools, and where we don't run cargo directly and
> > leave it to those tools. They may have single Cargo.lock now, but will
> > that hold? Also, that Cargo.lock is not necessarily in the root of
> > ${S}, so you'd have to set the location manually, instead of not
> > having to worry about it. Is CARGO_LOCK_PATH or its parent variables
> > already set correctly for all of them? I see this is not done from
> > python3-cryptography; shouldn't the build error out, if
> > cargo_common_do_patch_paths requires the location? Something doesn't
> > compute fully here.
> >
>
> That's exactly the one I was going to look at next, as I agree
> something doesn't add up there.
>

cargo_common_do_patch_paths isn't in the call graph for
python3-cryptography, it gets patched in like this:

do_configure[postfuncs] +=3D "cargo_common_do_patch_paths"

I'm unclear why that doesn't execute, I'm wondering if its related to
the autogenerated do_configure and this is a usage that just doesn't
work?

# line: 1, file: autogenerated
do_configure() {
        setup_target_config
    python_setuptools3_rust_do_configure
}

However even if it was in the call graph, we wouldn't have errored in
it as there's no patches to apply to the cargo config as the crates
are all satisfied from the vendored sources we deliver.

It does feel like we're missing a piece in our python/rust integration
since if you did have a crate delivered from git then we wouldn't
patch up the cargo config correctly and I guess end up erroring out.


--
Alex Kiernan


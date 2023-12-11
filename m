Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28F5C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 16:36:19 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.192.1702312574503003754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 08:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CKPT7Xjl;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cc2238f597so13732181fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 08:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702312573; x=1702917373; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntVoq22fbdp5XZGY9UEFF9miax2UcFwxcFwdwr/jItE=;
        b=CKPT7XjlCFOvvl/YQVz6CunEsh/lyprXhV7TuHabFYaaZsA3WeGRMOKUZG4PU/KRHY
         VPOlFpfVzuhPb7SZ5NRAn5KZUSXFvSAeMTjVlSJETTyeEEhdo6Q0xXw6jMDd8H6ujDiZ
         M3jhn8IXOkUgemkdScp9yu81DIzNJKFJ4peE1FWmJbxw007rje4+HHOzkUlAdhwyftXP
         ztR8pKhvUjZ8ZTEz6WyRaUA2Y+dvO2K4QDmfQHvXVYAHIUZWcMDj0XBGn8cAQtznnhwE
         nCJr5Cj9C5ih2Di4/d90vi8bzjkiGkejYC0MdBUyESztF7AGRqVD06RylP/aOSTw1Ns4
         zTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312573; x=1702917373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntVoq22fbdp5XZGY9UEFF9miax2UcFwxcFwdwr/jItE=;
        b=lDN0JJG+394bRVtnDDkT5impPRu1k3EDOxUHO31OhQBYpHDv0holcmbfDHi47ewSMm
         8zezQ8dvyzw1K5P0j1vEh07uwMPCmDOC/nJU7Njmjy8EYMQXH/0AmhKVCYwCsRpl5nRM
         ctAJ7UvW3fg4lZYhJWuYPufER9fu/GqFaSvRa7+So0p8E3VhmoEdbsWaA5sI98halSKL
         7DXYTRK/wcmIEvtDBIKcA+vAARFePjcLvPc4Es6q66sRFegRqaB7vpWr7sE7w42eOO/O
         pPJSCPdaSA0gS13yys13pPBgrwXnF4qiJF1AeZQ+WjR5/jAxDaBObve2jcRLiFCFDRRw
         mQ3Q==
X-Gm-Message-State: AOJu0Yzb3/NwfUcLgbi2QMPqqSdEZFqL4Ethj3I1B29zDzrko0KdfTOT
	M13ONGfDgBZDEwm02LyJJdj3y8aHb+MPqdJyaCY=
X-Google-Smtp-Source: AGHT+IFHrMt3QGG7i/Oo74AtbDIxN9JGQ9RbcRqbuEI7L3Lh15WNalI/e4paZFjHmXIuClw9lcQeWGlExq7HwfZW5xA=
X-Received: by 2002:a2e:9790:0:b0:2c9:fa37:c53 with SMTP id
 y16-20020a2e9790000000b002c9fa370c53mr599917lji.52.1702312572394; Mon, 11 Dec
 2023 08:36:12 -0800 (PST)
MIME-Version: 1.0
References: <20231210191046.4785-1-alex.kiernan@gmail.com> <CANNYZj-Z9apFWXOw6J63fQn+CRn-dLUEEer-oW7nieVHJ+M0pQ@mail.gmail.com>
 <CAO5Uq5SPRKNTSACY6X7+8FcswTNMkg2JEL5ub7oBJfSWoNCDow@mail.gmail.com>
 <CANNYZj_6KHT0=WDhcUqL7tEY0kZmhkU4wvRKGRp_cHcgN-Q=QA@mail.gmail.com>
 <CAO5Uq5Q=MJVhmo7cWBm23C05RnLW6eNCQXTo_=4zoDgmb9vLKg@mail.gmail.com> <179FC17C79673844.24323@lists.openembedded.org>
In-Reply-To: <179FC17C79673844.24323@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 11 Dec 2023 16:35:59 +0000
Message-ID: <CAO5Uq5TXRTB=ZTLWrN3g=n_bu2Pz+Ht8pGz-JoVQMiwoNb7zfw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] cargo-update-recipe-crates: Use CARGO_LOCK_PATH
To: alex.kiernan@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Frederic Martinsons <frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 16:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192179

On Mon, Dec 11, 2023 at 10:52=E2=80=AFAM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Mon, Dec 11, 2023 at 9:43=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.=
com> wrote:
> >
> > On Mon, Dec 11, 2023 at 9:28=E2=80=AFAM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > On Mon, 11 Dec 2023 at 10:09, Alex Kiernan <alex.kiernan@gmail.com> w=
rote:
> > > > In a single project there are (potentially) multiple Cargo.toml, bu=
t
> > > > just one Cargo.lock. If there's multiple Cargo.lock files in a repo=
,
> > > > that implies multiple projects which I don't think we've any way of
> > > > building from a single recipe.
> > >
> > > I'm thinking of projects like librsvg, python3-bcrypt or
> > > python3-cryptography where the build is orchestrated by meson,
> > > autoconf or setuptools, and where we don't run cargo directly and
> > > leave it to those tools. They may have single Cargo.lock now, but wil=
l
> > > that hold? Also, that Cargo.lock is not necessarily in the root of
> > > ${S}, so you'd have to set the location manually, instead of not
> > > having to worry about it. Is CARGO_LOCK_PATH or its parent variables
> > > already set correctly for all of them? I see this is not done from
> > > python3-cryptography; shouldn't the build error out, if
> > > cargo_common_do_patch_paths requires the location? Something doesn't
> > > compute fully here.
> > >
> >
> > That's exactly the one I was going to look at next, as I agree
> > something doesn't add up there.
> >
>
> cargo_common_do_patch_paths isn't in the call graph for
> python3-cryptography, it gets patched in like this:
>
> do_configure[postfuncs] +=3D "cargo_common_do_patch_paths"
>
> I'm unclear why that doesn't execute, I'm wondering if its related to
> the autogenerated do_configure and this is a usage that just doesn't
> work?
>
> # line: 1, file: autogenerated
> do_configure() {
>         setup_target_config
>     python_setuptools3_rust_do_configure
> }
>
> However even if it was in the call graph, we wouldn't have errored in
> it as there's no patches to apply to the cargo config as the crates
> are all satisfied from the vendored sources we deliver.
>
> It does feel like we're missing a piece in our python/rust integration
> since if you did have a crate delivered from git then we wouldn't
> patch up the cargo config correctly and I guess end up erroring out.
>

Okay, I'm wrong. The pieces are all there, just we have no git crates
to patch in for python3-cryptography so the existence check for
Cargo.lock never runs. Maybe that should be hoisted earlier in the
function so you see the failure if Cargo.lock isn't where it would be
expected to be.

--=20
Alex Kiernan


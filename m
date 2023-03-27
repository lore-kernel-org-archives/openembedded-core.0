Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55B0C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 09:13:08 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.30440.1679908380375073723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 02:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WsXAW8HP;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id y20so10446188lfj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 02:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679908378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aPaRgrzGnsq6b1zSeXLgjlnvLW9n2HT8p0F8DuQ7kTg=;
        b=WsXAW8HPTZPpMDA8yrD9h2JZmOvqNJElqDHNGViV0R0h1iaaH0v4UuqZ0SFeTwpSh/
         en95EXwKruWNc9QBZDMdFN/VsAi1IprHbOdP0NmV/CdiH/vhjzLyivcFdvZ7qNAombmd
         ou5s0nkLe41EycWeESbi3qUNqBqSBbaYK5RgYCrsu0tKxCKqUnFcSSNPkUmbfUBhvLCO
         XaeVn8UbKGHuJuAXqe3kOxufuRKX98ZDV0dsCpmhTZEsOD9JO5MymLoncTiSUhK1cwLw
         gGxfSKv/Nw2GvnHg/k4pixIJpXhZvjEhZGIOTu2VDQf0tfRK0IsD6OF2CtAp16Fso4MO
         dFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679908378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPaRgrzGnsq6b1zSeXLgjlnvLW9n2HT8p0F8DuQ7kTg=;
        b=Q0jJTDD4f88Ep8dI3KNJhGfDdDjtXGzJFRJoYaRiy9SaL0kUzqXGkBHlvbcnkdxwz9
         T/ZowVpfoCaASBOjOzfKRfYvWDYphukD7hgJuBcJUXv7UIOykkNQuvGJt2AMOBJsJ7k4
         lVyRS+1MsQqUhRBFx7OsiugwaIPGOTimLWrpbxDnIGuWanPRTieGz+c5Pw46ZkiSY13K
         xrhFglSEW3zFB7MnvbaRjcr/dvNcHJf2j6H03J6ZNNFRzUkJMojEabJPEF9iehbbBTD+
         dhHAgwOOe8hmD/SNV2SgW0etpTZ9yW8H6W8AOqc/8tun2P0KtIx8m3fxHxl/kT2FjstV
         s+Rw==
X-Gm-Message-State: AAQBX9cHo+ZdUIWDYSFYzYRj8zDEpD5x+gwgSQSAxwkDTYsga51zykGA
	Mq3q5FLmVjpkXd+7Cc60b218mkeED99BYI/ncQw=
X-Google-Smtp-Source: AKy350aP9WKWpQ6FsEk3N3ww+6Rli8Y0dKYQntYo9koopUULwLe0bJwP3DUUbhSUAJpYnRm2ijgPyi1cPo6KjPGoMyQ=
X-Received: by 2002:ac2:522e:0:b0:4ea:e2f8:5ed6 with SMTP id
 i14-20020ac2522e000000b004eae2f85ed6mr3020581lfl.11.1679908378346; Mon, 27
 Mar 2023 02:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679842454.git.frederic.martinsons@gmail.com>
 <2e5fd3f0a5145af70fb1caee38d5cbf0a7c42877.1679842454.git.frederic.martinsons@gmail.com>
 <89ef864d-c816-b4e1-2425-85a46d001d18@berginkonsult.se>
In-Reply-To: <89ef864d-c816-b4e1-2425-85a46d001d18@berginkonsult.se>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Mar 2023 11:12:47 +0200
Message-ID: <CANNYZj8kqi2Vgg13esDKnS9JDgDdRhU5Dew-HZQOhq1B5GshQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCHV2 3/5] rust-example: provide a recipe for zvariant
To: Peter Bergin <peter@berginkonsult.se>, 
	Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 09:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179151

rust-hello-world is actually used in test images to verify that
toolchains produce working binaries.

For zvariant I guess meta-skeleton would work best, if the recipe
comes with a README explaining why is it there, and how to handle
maintenance of similar recipes.

Alex

On Mon, 27 Mar 2023 at 10:58, Peter Bergin <peter@berginkonsult.se> wrote:
>
>
> On 2023-03-26 16:56, Frederic Martinsons wrote:
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > This recipe is for showing a "real world" example of
> > a crate that depends on some git repositories.
> >
> > Usually, this kind of crate is built within a global
> > workspace (here it is the zbus project) and so
> > doesn't need a Cargo.lock on its own.
> >
> > For the sake of the demonstration, I had to add
> > a patch for providing a Cargo.lock and modifying
> > zvariant_derive to get it from crates.io instead
> > of pulling locally with a relative path.
> >
> > The use case where the crate had some git repository
> > in dependency is very common for "private" crate that
> > are not aimed to be published on crates.io.
> > When the project grow bigger, it is common to have
> > a bin and multiple lib developped in parallel, and these
> > libs are surely on a git repostitory.
> >
> > Hence the need of this support in oe-core.
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >   .../rust-example/zvariant-crates.inc          |  140 ++
> >   .../0001-Tweak-zvariant-cargo-config.patch    | 1249 +++++++++++++++++
> >   .../rust-example/zvariant_3.12.0.bb           |   20 +
> >   3 files changed, 1409 insertions(+)
> >   create mode 100644 meta/recipes-extended/rust-example/zvariant-crates.inc
> >   create mode 100644 meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-config.patch
> >   create mode 100644 meta/recipes-extended/rust-example/zvariant_3.12.0.bb
>
> Why not use meta-skeleton for the examples? I know and have seen before
> that for some reason the rust-example is placed in oe-core/meta, but
> think rust-example should have its home in meta-skeleton as it is the
> place for example recipes. Just a suggestion to move this now before
> filling up more example recipes among the core recipes.
>
> /Peter
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179150): https://lists.openembedded.org/g/openembedded-core/message/179150
> Mute This Topic: https://lists.openembedded.org/mt/97862976/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


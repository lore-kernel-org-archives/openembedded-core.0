Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F605C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 15:04:36 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.123579.1699542270392955284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 07:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bu+j32HI;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6ce37d0f1a9so518897a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 07:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699542269; x=1700147069; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fNMxzem3FH15JK0NTOYt8uLY23MGYdD4IkybJeELKY=;
        b=bu+j32HInaIH+t4kLBzZ6vjmXYK6A+bHzpzWvxK9c6EwB/YJtq8a2hd3zCz0YXJQM8
         nmnhlbLRkXnjHBfnqon2ktn4BnjxyUXdOBzdHyoUvroGnkbJOM7HHotkhGHnpMqJ1Jw5
         kz0DONb5nXVHn9jChPOqbYH7d7xYbYT3GoAGDId1JsTQxJamY9NoM3CRk0yftTtFZfnM
         4ZGri/YvnNyn41Cgfgie4lEM8ajhQ0LJ6FVnfM5JgwZ6PYbsmx6+f2WTuDtXmEpsTGXx
         pUeAfFSD+j6tTiROXrn8alZIydV02dniVlmr5itb9mKwRfZF4Qj5z9H/XivQ2yZP8agl
         ZgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699542269; x=1700147069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fNMxzem3FH15JK0NTOYt8uLY23MGYdD4IkybJeELKY=;
        b=MVPO4gROrhVg/4px3Awgpzhf8glqMURgxvGVKvhnSUkU/qkoAZ1rzGe5RcW80E3njm
         DI1u9uZiPJbuaUFccdL9uZ+ujlLWi9a1jGc8WKahEGaMYL+gJ7g02ePXDUABzqtSpoGm
         7RN7XcXxvWHb7IgPRBcF8L4tKHVrtOP2j62fx9sRg/NwoNkyVkLlqGv7W8nsW3zlUub0
         xk/MX7HEdySb/qyQEs+KZ36EC+TjvXuue8Lk0AO3uKbPGockEqMyQmzMaVbLEu1mIC4C
         NOELTWwmFdJDQvd9Hwo+LT2k4LiXTu+8QiKczXVfRzuFBn7m48WZTA4kgixQiwDg2TTc
         RBLg==
X-Gm-Message-State: AOJu0YxHEnwEoTNJV3t8BgiKSUM1BOvYuEDrkHV6e0H9QNWzrwnU/nxZ
	WNTKtp8ACGeuUzR3UZJf94ZH3EncrFcVdn9LmEc=
X-Google-Smtp-Source: AGHT+IHU4QUWQbqOleL7SPFVynW0m4S3FuO45oRC9Mzq8EIOpKB7JyJ2l3GtyQ5g2J5807oM25b7ygQAQjpBUGX2Cn8=
X-Received: by 2002:a05:6871:2216:b0:1e9:feb7:71db with SMTP id
 sc22-20020a056871221600b001e9feb771dbmr5664390oab.36.1699542269482; Thu, 09
 Nov 2023 07:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20231109065042.2418002-1-raj.khem@gmail.com> <5d539cfbb0f523f97a160413b171d16b30d5e2e8.camel@linuxfoundation.org>
In-Reply-To: <5d539cfbb0f523f97a160413b171d16b30d5e2e8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Nov 2023 07:04:03 -0800
Message-ID: <CAMKF1spwoO==EN3yYYmm0sJdfMr7WDptgQ7p69hcWCJ6v7zJSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: Fix build for riscv32
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 15:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190389

On Thu, Nov 9, 2023 at 6:00=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-11-08 at 22:50 -0800, Khem Raj wrote:
> > Add missing support for linux-raw-sys
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../librsvg/0001-Add-riscv32-support.patch    | 1511 +++++++++++++++++
> >  meta/recipes-gnome/librsvg/librsvg_2.56.3.bb  |    3 +-
> >  2 files changed, 1513 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Add-riscv32=
-support.patch
> >
> > diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Add-riscv32-suppor=
t.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Add-riscv32-support.patch
> > new file mode 100644
> > index 00000000000..2e36eaf5084
> > --- /dev/null
> > +++ b/meta/recipes-gnome/librsvg/librsvg/0001-Add-riscv32-support.patch
> > @@ -0,0 +1,1511 @@
> > +From a4066c09bec2d4ec956459237e0a48501cc4780f Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 8 Nov 2023 22:41:54 -0800
> > +Subject: [PATCH] Add riscv32 support
> > +
> > +Upstream-Status: Submitted [https://github.com/sunfishcode/linux-raw-s=
ys/pull/95]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/riscv32/ioctl.rs | 1490 +++++++++++++++++++++++++++++++++++++++++=
-
> > + 1 file changed, 1488 insertions(+), 2 deletions(-)
> > +
> >
> [...]
>
> > +2.42.1
> > +
> > diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb b/meta/recipe=
s-gnome/librsvg/librsvg_2.56.3.bb
> > index 4b9aaeecbe7..32d720d2b92 100644
> > --- a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
> > +++ b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
> > @@ -19,6 +19,7 @@ inherit cargo_common gnomebase pixbufcache gobject-in=
trospection rust vala gi-do
> >  require ${BPN}-crates.inc
> >
> >  SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-to-cargo-also-w=
hen-not-.patch \
> > +            file://0001-Add-riscv32-support.patch;patchdir=3D../cargo_=
home/bitbake/linux-raw-sys-0.4.3 \
> >             "
> >
> >  SRC_URI[archive.sha256sum] =3D "5a328048a02d014645cd27f61140f4e0b11280=
fb2c7f2a21864fe0c59ac1ce88"
> > @@ -38,7 +39,7 @@ export RUST_TARGET =3D "${RUST_HOST_SYS}"
> >  RUSTFLAGS:append:mips =3D " --cfg crossbeam_no_atomic_64"
> >  RUSTFLAGS:append:mipsel =3D " --cfg crossbeam_no_atomic_64"
> >  RUSTFLAGS:append:powerpc =3D " --cfg crossbeam_no_atomic_64"
> > -RUSTFLAGS:append:riscv32 =3D " --cfg crossbeam_no_atomic_64"
> > +#RUSTFLAGS:append:riscv32 =3D " --cfg crossbeam_no_atomic_64"
> >
> >  do_configure[postfuncs] +=3D "cargo_common_do_configure"
>
> Is this change at the end meant to be here? It isn't mentioned in the
> commit message.

Yeah I saw that too and
I think it can be a separate commit. Let me send a v2 without atomic_64 for=
 now.
and follow up with the patch for atomics

>
> Cheers,
>
> Richard


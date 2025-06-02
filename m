Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5703C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 21:48:48 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.7463.1748900919680074686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 14:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HNI+fMk8;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad69e4f2100so737662766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 14:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748900918; x=1749505718; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+gv9+Pm0Pp0u9n07GG5hiNZNYh+b9RsIkhKE/FxXPo=;
        b=HNI+fMk8AzKd73ViAbYcdc9QtS5FYhLYTD9LrGu6Xeg2CcTa29y0zrG1DZCI2izSf8
         M3e2GM4nNfebH3keLuVcZicCkC9HrBjs9dgENbxOiqAcD6UMu0MP8kewAGNszwLQVhGm
         iGlya7NewALuFIHfKMwpty2VobzYRcTDS7two=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748900918; x=1749505718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+gv9+Pm0Pp0u9n07GG5hiNZNYh+b9RsIkhKE/FxXPo=;
        b=Hv9ZZSlvRNdwAUMQBfsiNNsOSVAjviHWvTR1xytXh7dsyx2lEkmuFLPmAZnkORkMC6
         uzqKHhleu1J2ZIRYx03AR/H5gXya0xgWpE/TgTKmrPym58qbyW3XhTrq2zibzvCx9iAG
         yghtRRBc/0P6Wqub+4sMTfOeI2Xiq+E76Hg4N+wUXvRztWl2Cxobrsmw/cBY0FUSmad0
         vX5lkWHkESV2BcEopw0CVQvWP6AvzQHIZ6IrwTXMsknagCaDUTaVYVg2XIUaOX1wpGPA
         wrTT/LtPtz+JExM1nMdhAKUhwAOzzc/osv37qpP4eowEZynV+dJYePYYxIVufGKgFhty
         TCLg==
X-Gm-Message-State: AOJu0Yw86jXkDLE7IebisClxrvG5cFS6Ahm70Fa8HpMUAKyZWi1J1lEv
	skwgjyLokGcGyQfNYN8Jx9BtOiUWSPd7UKFzt0jLNBW3+Doinf/dFuMwlYE8Tz9dG8vNQAWfN0K
	z0miS0qxzkau+hcIyS44eEtu1rN8EkRWEq3xnXO1hyg==
X-Gm-Gg: ASbGncutGaWE2nOJm7Kq5EYDGQuFdkh7ypqKaiJlmMjh4HYIpXMTbL0dsixcAkmhGKk
	tillPA/Zu/u8lKxPmTw1d9pEi9rWgl3Fd0Jk2jsJSsp4e8qyNaK6d/JAx24D+D0Vc6m+kaJN19H
	i0zqHDH9Ie1p9xdImsZEqm70LcgNh1/tKM
X-Google-Smtp-Source: AGHT+IGrvh3+Xe1Nc2qSQtUzXQ2pOo0DljqRak2RmpZQXsrbivzx1yt5r25OH78R1BiPZcQPbUYhpALKTmf9bCz5Ejs=
X-Received: by 2002:a17:907:db03:b0:ad2:28be:9a16 with SMTP id
 a640c23a62f3a-adb36c117ffmr1201205066b.51.1748900917970; Mon, 02 Jun 2025
 14:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748816484.git.tim.orling@konsulko.com> <09d7e38bfe20f3de0e2489d52305c81be2975d4b.1748816484.git.tim.orling@konsulko.com>
 <CAMKF1sprSxJnkOkM+v_k6tmwtPOiq26_A1AU0RikUrRfTN5NWA@mail.gmail.com>
In-Reply-To: <CAMKF1sprSxJnkOkM+v_k6tmwtPOiq26_A1AU0RikUrRfTN5NWA@mail.gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Mon, 2 Jun 2025 14:48:26 -0700
X-Gm-Features: AX0GCFsJgBAotuWXoBp8UZz-Oq59jZdIMzLntwM3QQEt8TcSUdpN1JNb0BnY8d8
Message-ID: <CAOyo-86pp7rnKLBLDrUj6P5q3vZqJnwkSgQTXPWNNG36LC5Nzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/8] python3-maturin: upgrade 1.8.3 -> 1.8.6
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f6965506369db9d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 21:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217740

--000000000000f6965506369db9d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 2:32=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Jun 1, 2025 at 3:26=E2=80=AFPM Tim Orling via lists.openembedded.=
org
> <tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:
> >
> > From: Tim Orling <tim.orling@konsulko.com>
> >
> > Comparing changes since 1.8.3:
> > https://github.com/PyO3/maturin/compare/v1.8.3...v1.8.6
> >
> > Changelog:
> >
> > 1.8.6
> > * Print a message when overriding platform tag from _PYTHON_HOST_PLATFO=
RM
> >   in #2594
> > * Use the current python interpreter's version when the abi3 feature is
> set
> >   with no explicit version in #2597
> >
> > 1.8.5
> > * Fix release CI build
> >
> > 1.8.4
> > * Install a Rust toolchain into a temporary directory when building
> maturin
> >   itself or a package and a Rust toolchain is missing. Set
> >   MATURIN_NO_INSTALL_RUST to disable this behavior. #2421
> > * Fix broken maturin develop with latest uv in #2584
> > * Add PYO3_PYTHON env var support in #2534
> > * Sort RECORD file in wheel archives to make them deterministic in #255=
0
> > * Publish wheel for loongarch64 in #2548
> > * Add --compression-level option to build command in #2572
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> > oe-selftest for maturin passes
> >
> >  .../python/python3-maturin-crates.inc         |  20 +-
> >  ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 -----
> >  .../python/python3-maturin_1.8.3.bb           |  43 --
> >  .../python/python3-maturin_1.8.6.bb           | 405 ++++++++++++++++++
> >  4 files changed, 415 insertions(+), 163 deletions(-)
> >  delete mode 100644
> meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes=
-on-riscv32gc-unknown-linux-g.patch
>
> Please keep this patch, this version of maturin still uses libc
> 0.2.167, it breaks riscv32 builds without it.
>

Yes, I caught that with v2. But thank you for the confirmation.
https://lists.openembedded.org/g/openembedded-core/message/217722

>
> >  delete mode 100644 meta/recipes-devtools/python/
> python3-maturin_1.8.3.bb
> >  create mode 100644 meta/recipes-devtools/python/
> python3-maturin_1.8.6.bb
> <snip>

--000000000000f6965506369db9d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 2, =
2025 at 2:32=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Sun, Jun 1, 2025 at 3:26=E2=80=AFPM Tim Orling via <a =
href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank"=
>lists.openembedded.org</a><br>
&lt;tim.orling=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org" tar=
get=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;<br>
&gt; Comparing changes since 1.8.3:<br>
&gt; <a href=3D"https://github.com/PyO3/maturin/compare/v1.8.3...v1.8.6" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/PyO3/maturin/compare/=
v1.8.3...v1.8.6</a><br>
&gt;<br>
&gt; Changelog:<br>
&gt;<br>
&gt; 1.8.6<br>
&gt; * Print a message when overriding platform tag from _PYTHON_HOST_PLATF=
ORM<br>
&gt;=C2=A0 =C2=A0in #2594<br>
&gt; * Use the current python interpreter&#39;s version when the abi3 featu=
re is set<br>
&gt;=C2=A0 =C2=A0with no explicit version in #2597<br>
&gt;<br>
&gt; 1.8.5<br>
&gt; * Fix release CI build<br>
&gt;<br>
&gt; 1.8.4<br>
&gt; * Install a Rust toolchain into a temporary directory when building ma=
turin<br>
&gt;=C2=A0 =C2=A0itself or a package and a Rust toolchain is missing. Set<b=
r>
&gt;=C2=A0 =C2=A0MATURIN_NO_INSTALL_RUST to disable this behavior. #2421<br=
>
&gt; * Fix broken maturin develop with latest uv in #2584<br>
&gt; * Add PYO3_PYTHON env var support in #2534<br>
&gt; * Sort RECORD file in wheel archives to make them deterministic in #25=
50<br>
&gt; * Publish wheel for loongarch64 in #2548<br>
&gt; * Add --compression-level option to build command in #2572<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt; oe-selftest for maturin passes<br>
&gt;<br>
&gt;=C2=A0 .../python/python3-maturin-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 20 +-<br>
&gt;=C2=A0 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 -----<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-maturin_1.8.3.bb" rel=3D"no=
referrer" target=3D"_blank">python3-maturin_1.8.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 43 --<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-maturin_1.8.6.bb" rel=3D"no=
referrer" target=3D"_blank">python3-maturin_1.8.6.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 405 ++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 415 insertions(+), 163 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python3-maturin/=
0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch<br>
<br>
Please keep this patch, this version of maturin still uses libc<br>
0.2.167, it breaks riscv32 builds without it.<br></blockquote><div><br></di=
v><div>Yes, I caught that with v2. But thank you for the confirmation.</div=
><div><a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/217722">https://lists.openembedded.org/g/openembedded-core/message/217722<=
/a>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-maturin_1.8.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-ma=
turin_1.8.3.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-maturin_1.8.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-ma=
turin_1.8.6.bb</a><br>&lt;snip&gt;</blockquote></div></div>

--000000000000f6965506369db9d9--


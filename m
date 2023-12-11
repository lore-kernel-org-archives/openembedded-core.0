Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45658C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:01:42 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.5087.1702288894743077731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 02:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TcDpGAak;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-67a91a373edso29069886d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 02:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702288894; x=1702893694; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HzGPFKh1zZjaFX8ByR0AYD3YirgNQNqmHg6TyNo2wOU=;
        b=TcDpGAakaex/4BnT8iwmHiCmNRbgmUHTme0XMdU9RhlbI7KcqmWuu2Ik3S8pNStpw6
         AeY5JBTV11W4ggD0U0rJ0NTz41wimHF7EqZy/3aGREpcJ00h4fJeuz1382ggJ4bHXRfJ
         QfEtlfMsHuRHU/r273+t3XZ76MDy4y/hs5/fOAZfATNyrG9sCdCRxLFn3SdeIrtcxq8j
         UEYw7qvc83sseBNglHzZtkw6b8xojKE1uKoSbFAcrizAr1v99x0yv2+c2TxCdRp8cmc3
         UfuVnOkcKP2qEAFz0Zx1HZPlYgfcj68CiA8U7w4nWA9Fiivge1QQW1/NZucKzGuDOuMK
         MefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288894; x=1702893694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzGPFKh1zZjaFX8ByR0AYD3YirgNQNqmHg6TyNo2wOU=;
        b=CGcIOLLvfFFpJ5KBmCRa5C1VjDnftF0EacSC9dDSstiKxfoIHrhiRWICjk4ey/ZDTq
         evNitP3acCyguVnJkp9T8S4stVVcPVlaiEAPRKC34eUge5rxXJT4k+sfTyM2YZZeaB2z
         cjbUVOZL+uw5orQ7fkeHL0kHlk1PWcx4iMfipz4Mg3zU3WSAc94LyJpLlqa4tQw22gOE
         ccF0XLJo4F4ptYDUi2gfMQq34IusKWmHuebbOnftx217TvbKQv7C1t84oahRV/TRTuoy
         GCnpmVTnO5TYmk2u++eIl0Bxc9Ox87DRzJiq8/R2s5d5UuuoJhf7dupzsJFsIUr5mu6J
         19lQ==
X-Gm-Message-State: AOJu0Yw5OXZosEpvApfVjfz/H5H69p3m+eicsnbPnaP5akjO1046fdSs
	yZa1TyzzqVoQDTvoL/Ik5/X5MNO4+IrSHQZM4IY=
X-Google-Smtp-Source: AGHT+IHU2C5Di41XJzQEbYT9CreJW/3eR4h3hnrCie1SoGePTK2qLlRcGsC/zEKNtX1DoEcotFzEOaMmDw9x7K2KzxA=
X-Received: by 2002:a05:6214:8d0:b0:67a:c772:fd3d with SMTP id
 da16-20020a05621408d000b0067ac772fd3dmr4597967qvb.56.1702288893633; Mon, 11
 Dec 2023 02:01:33 -0800 (PST)
MIME-Version: 1.0
References: <20231208140349.3576-1-alex.kiernan@gmail.com> <20231208140349.3576-3-alex.kiernan@gmail.com>
 <a394853b1f2302baab431afe6fd0a1880b8238bd.camel@linuxfoundation.org>
 <CAO5Uq5RaQYvgye7a=qtwO2abDRP6WvggbKvjLpWuepJ1Rr3Z4A@mail.gmail.com>
 <CA+cAkerS0D8ai-PhV=tiL=6kbbwbaSV2YTKS0oSrTksNpmDNqA@mail.gmail.com> <CAO5Uq5S4S=e-zGNLbEscxjroX488=gM4nkT9RMAxdXxJ+uKU-A@mail.gmail.com>
In-Reply-To: <CAO5Uq5S4S=e-zGNLbEscxjroX488=gM4nkT9RMAxdXxJ+uKU-A@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 11 Dec 2023 11:01:22 +0100
Message-ID: <CA+cAkeoxd1eu8KzNbycBFwYYjuR-w8Wx+y+bSNc1u5qmhHFWSg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 3/7] rust: Upgrade 1.71.0 -> 1.71.1
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cf6ac0060c39049e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192153

--000000000000cf6ac0060c39049e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Dec 2023 at 10:17, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Mon, Dec 11, 2023 at 7:15=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> >
> >
> > On Sun, 10 Dec 2023 at 21:28, Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> >>
> >> On Sun, Dec 10, 2023 at 7:39=E2=80=AFPM Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >
> >> > On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrote:
> >> > > https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html
> >> > >
> >> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >> > > ---
> >> > >
> >> > >  meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.1.bb}=
 |
> 0
> >> > >  .../rust/{libstd-rs_1.71.0.bb =3D> libstd-rs_1.71.1.bb}          =
 |
> 0
> >> > >  ...t-cross-canadian_1.71.0.bb =3D> rust-cross-canadian_1.71.1.bb}=
 |
> 0
> >> > >  .../rust/{rust-llvm_1.71.0.bb =3D> rust-llvm_1.71.1.bb}          =
 |
> 0
> >> > >  meta/recipes-devtools/rust/rust-source.inc                      |
> 2 +-
> >> > >  meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.bb}  =
 |
> 0
> >> > >  6 files changed, 1 insertion(+), 1 deletion(-)
> >> > >  rename meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D>
> cargo_1.71.1.bb} (100%)
> >> > >  rename meta/recipes-devtools/rust/{libstd-rs_1.71.0.bb =3D>
> libstd-rs_1.71.1.bb} (100%)
> >> > >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.0.bb
> =3D> rust-cross-canadian_1.71.1.bb} (100%)
> >> > >  rename meta/recipes-devtools/rust/{rust-llvm_1.71.0.bb =3D>
> rust-llvm_1.71.1.bb} (100%)
> >> > >  rename meta/recipes-devtools/rust/{rust_1.71.0.bb =3D>
> rust_1.71.1.bb} (100%)
> >> > >
> >> > > diff --git a/meta/recipes-devtools/rust/cargo_1.71.0.bb
> b/meta/recipes-devtools/rust/cargo_1.71.1.bb
> >> > > similarity index 100%
> >> > > rename from meta/recipes-devtools/rust/cargo_1.71.0.bb
> >> > > rename to meta/recipes-devtools/rust/cargo_1.71.1.bb
> >> > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> b/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
> >> > > similarity index 100%
> >> > > rename from meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> >> > > rename to meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
> >> > > diff --git a/meta/recipes-devtools/rust/
> rust-cross-canadian_1.71.0.bb b/meta/recipes-devtools/rust/
> rust-cross-canadian_1.71.1.bb
> >> > > similarity index 100%
> >> > > rename from meta/recipes-devtools/rust/
> rust-cross-canadian_1.71.0.bb
> >> > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
> >> > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> b/meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
> >> > > similarity index 100%
> >> > > rename from meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> >> > > rename to meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
> >> > > diff --git a/meta/recipes-devtools/rust/rust-source.inc
> b/meta/recipes-devtools/rust/rust-source.inc
> >> > > index 3a192e42db7d..0729db6f0b45 100644
> >> > > --- a/meta/recipes-devtools/rust/rust-source.inc
> >> > > +++ b/meta/recipes-devtools/rust/rust-source.inc
> >> > > @@ -7,7 +7,7 @@ SRC_URI +=3D "
> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
> >> > >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
> >> > >
> file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=3D$=
{RUSTSRC}
> \
> >> > >  "
> >> > > -SRC_URI[rust.sha256sum] =3D
> "5814699031aafdcc2e2f71fc9b389678cd7042350d1583da061463d8e88681c7"
> >> > > +SRC_URI[rust.sha256sum] =3D
> "371af0fbe04051e20a74dbea6d4e4e548f10f15309c49cae2688afb882b6c7f1"
> >> > >
> >> > >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> >> > >
> >> > > diff --git a/meta/recipes-devtools/rust/rust_1.71.0.bb
> b/meta/recipes-devtools/rust/rust_1.71.1.bb
> >> > > similarity index 100%
> >> > > rename from meta/recipes-devtools/rust/rust_1.71.0.bb
> >> > > rename to meta/recipes-devtools/rust/rust_1.71.1.bb
> >> >
> >> > I ran some testing and it looks like we could merge up to 1.71.1
> >> > without autobuilder failures in this series. Beyond that we have the
> >> > reproducibility and zvariant issues.
> >> >
> >>
> >> Thanks.
> >>
> >> Was the failure at that point reproducibility or the zvariant trait
> >> failure? I just posted an update for zvariant which doesn't see the
> >> trait recursion failure, but at the same time it no longer exercises
> >> crates pulled from git which looked like it was the main purpose it
> >> was fulfilling for testing.
> >>
> > I didn't follow issues about this upgrade, but yes, the zvariant recipe
> > was a demonstration on how to handle crates dependencies that come from
> git.
> > (there is a specific crate fetcher url parameter: 'git-dependency')
> >
>
> 3.12 (which was what we had) exploded with unbounded recursion inside
> a trait on later compilers, upgrading to 3.15 fixes it, but they've
> dropped the git dependency crate and just used upstream crates:
>
> commit 9e34dd510bf1a50f5168d5164578ebe8958928e3
> Author: Zeeshan Ali Khan <zeeshanak@gnome.org>
> Date:   Wed May 10 20:45:26 2023 +0200
>
>     zv: Swtich glib from git to latest released version
>
>     We don't need the git version and cargo caching action doesn't help
> with
>     cloning of git repos so the build takes longer in the CI than it need=
s
>     to.
>
> > If, for some reason, this is no more possible, the whole recipe can be
> removed
> > (unless there is a direct dependency to zvariant in some  other recipes=
)
> >
>
> Sounds like just deleting it might be the thing to do. I did go on a
> search for something else which had git dependency crates and didn't
> find anything (and I suspect even if we did, we might well be back
> here in 6 months if upstream churn deletes it). Maybe we just need
> something synthetic which is used here?
>

 I can come up with a simple recipe which will have sources locally
and a dependencies to some of crates fetched by git if you think
it would be useful.

I have lot of these kind (git crate dependency) because we have internally
a lot of unpublished (private)
crates in our git repo.



> --
> Alex Kiernan
>

--000000000000cf6ac0060c39049e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Dec 2023 at 10:17, Alex Ki=
ernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Mon, Dec 11, 2023 at 7:15=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Sun, 10 Dec 2023 at 21:28, Alex Kiernan &lt;<a href=3D"mailto:alex.=
kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; On Sun, Dec 10, 2023 at 7:39=E2=80=AFPM Richard Purdie<br>
&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrote:<br>
&gt;&gt; &gt; &gt; <a href=3D"https://blog.rust-lang.org/2023/08/03/Rust-1.=
71.1.html" rel=3D"noreferrer" target=3D"_blank">https://blog.rust-lang.org/=
2023/08/03/Rust-1.71.1.html</a><br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.k=
iernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt; ---<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/rust/{<a href=3D"http://carg=
o_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.0.bb</a> =3D&g=
t; <a href=3D"http://cargo_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">=
cargo_1.71.1.bb</a>} | 0<br>
&gt;&gt; &gt; &gt;=C2=A0 .../rust/{<a href=3D"http://libstd-rs_1.71.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.0.bb</a> =3D&gt; <a href=
=3D"http://libstd-rs_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">libstd=
-rs_1.71.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt; &gt;=C2=A0 ...<a href=3D"http://t-cross-canadian_1.71.0.bb" r=
el=3D"noreferrer" target=3D"_blank">t-cross-canadian_1.71.0.bb</a> =3D&gt; =
<a href=3D"http://rust-cross-canadian_1.71.1.bb" rel=3D"noreferrer" target=
=3D"_blank">rust-cross-canadian_1.71.1.bb</a>} | 0<br>
&gt;&gt; &gt; &gt;=C2=A0 .../rust/{<a href=3D"http://rust-llvm_1.71.0.bb" r=
el=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.0.bb</a> =3D&gt; <a href=
=3D"http://rust-llvm_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-l=
lvm_1.71.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/rust/rust-source.inc=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
-<br>
&gt;&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/rust/{<a href=3D"http://rust=
_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0.bb</a> =3D&gt;=
 <a href=3D"http://rust_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rus=
t_1.71.1.bb</a>}=C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt; &gt;=C2=A0 6 files changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http=
://cargo_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.0.bb</a=
> =3D&gt; <a href=3D"http://cargo_1.71.1.bb" rel=3D"noreferrer" target=3D"_=
blank">cargo_1.71.1.bb</a>} (100%)<br>
&gt;&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http=
://libstd-rs_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71=
.0.bb</a> =3D&gt; <a href=3D"http://libstd-rs_1.71.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">libstd-rs_1.71.1.bb</a>} (100%)<br>
&gt;&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http=
://rust-cross-canadian_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust=
-cross-canadian_1.71.0.bb</a> =3D&gt; <a href=3D"http://rust-cross-canadian=
_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-canadian_1.71.1=
.bb</a>} (100%)<br>
&gt;&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http=
://rust-llvm_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71=
.0.bb</a> =3D&gt; <a href=3D"http://rust-llvm_1.71.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">rust-llvm_1.71.1.bb</a>} (100%)<br>
&gt;&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http=
://rust_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0.bb</a> =
=3D&gt; <a href=3D"http://rust_1.71.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">rust_1.71.1.bb</a>} (100%)<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http:=
//cargo_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.0.bb</a>=
 b/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.71.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">cargo_1.71.1.bb</a><br>
&gt;&gt; &gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http:/=
/cargo_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.0.bb</a><=
br>
&gt;&gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://c=
argo_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.1.bb</a><br=
>
&gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http:=
//libstd-rs_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.=
0.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://libstd-rs_1.71.1.bb=
" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.1.bb</a><br>
&gt;&gt; &gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http:/=
/libstd-rs_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.0=
.bb</a><br>
&gt;&gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://l=
ibstd-rs_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.1.b=
b</a><br>
&gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http:=
//rust-cross-canadian_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-=
cross-canadian_1.71.0.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http:/=
/rust-cross-canadian_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-c=
ross-canadian_1.71.1.bb</a><br>
&gt;&gt; &gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http:/=
/rust-cross-canadian_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-c=
ross-canadian_1.71.0.bb</a><br>
&gt;&gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://r=
ust-cross-canadian_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-cro=
ss-canadian_1.71.1.bb</a><br>
&gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http:=
//rust-llvm_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.=
0.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.71.1.bb=
" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.1.bb</a><br>
&gt;&gt; &gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http:/=
/rust-llvm_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.0=
.bb</a><br>
&gt;&gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://r=
ust-llvm_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.1.b=
b</a><br>
&gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/rust-source.inc =
b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt;&gt; &gt; &gt; index 3a192e42db7d..0729db6f0b45 100644<br>
&gt;&gt; &gt; &gt; --- a/meta/recipes-devtools/rust/rust-source.inc<br>
&gt;&gt; &gt; &gt; +++ b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt;&gt; &gt; &gt; @@ -7,7 +7,7 @@ SRC_URI +=3D &quot;<a href=3D"https://st=
atic.rust-lang.org/dist/rustc-$%7BRUST_VERSION%7D-src.tar.xz;n" rel=3D"nore=
ferrer" target=3D"_blank">https://static.rust-lang.org/dist/rustc-${RUST_VE=
RSION}-src.tar.xz;n</a><br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://z=
lib-off64_t.patch;patchdir=3D${RUSTSRC} \<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0=
001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=3D${RUSTSRC} =
\<br>
&gt;&gt; &gt; &gt;=C2=A0 &quot;<br>
&gt;&gt; &gt; &gt; -SRC_URI[rust.sha256sum] =3D &quot;5814699031aafdcc2e2f7=
1fc9b389678cd7042350d1583da061463d8e88681c7&quot;<br>
&gt;&gt; &gt; &gt; +SRC_URI[rust.sha256sum] =3D &quot;371af0fbe04051e20a74d=
bea6d4e4e548f10f15309c49cae2688afb882b6c7f1&quot;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 RUSTSRC =3D &quot;${WORKDIR}/rustc-${RUST_VERSION}=
-src&quot;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http:=
//rust_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0.bb</a> b=
/meta/recipes-devtools/rust/<a href=3D"http://rust_1.71.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">rust_1.71.1.bb</a><br>
&gt;&gt; &gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http:/=
/rust_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0.bb</a><br=
>
&gt;&gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://r=
ust_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.1.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I ran some testing and it looks like we could merge up to 1.7=
1.1<br>
&gt;&gt; &gt; without autobuilder failures in this series. Beyond that we h=
ave the<br>
&gt;&gt; &gt; reproducibility and zvariant issues.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks.<br>
&gt;&gt;<br>
&gt;&gt; Was the failure at that point reproducibility or the zvariant trai=
t<br>
&gt;&gt; failure? I just posted an update for zvariant which doesn&#39;t se=
e the<br>
&gt;&gt; trait recursion failure, but at the same time it no longer exercis=
es<br>
&gt;&gt; crates pulled from git which looked like it was the main purpose i=
t<br>
&gt;&gt; was fulfilling for testing.<br>
&gt;&gt;<br>
&gt; I didn&#39;t follow issues about this upgrade, but yes, the zvariant r=
ecipe<br>
&gt; was a demonstration on how to handle crates dependencies that come fro=
m git.<br>
&gt; (there is a specific crate fetcher url parameter: &#39;git-dependency&=
#39;)<br>
&gt;<br>
<br>
3.12 (which was what we had) exploded with unbounded recursion inside<br>
a trait on later compilers, upgrading to 3.15 fixes it, but they&#39;ve<br>
dropped the git dependency crate and just used upstream crates:<br>
<br>
commit 9e34dd510bf1a50f5168d5164578ebe8958928e3<br>
Author: Zeeshan Ali Khan &lt;<a href=3D"mailto:zeeshanak@gnome.org" target=
=3D"_blank">zeeshanak@gnome.org</a>&gt;<br>
Date:=C2=A0 =C2=A0Wed May 10 20:45:26 2023 +0200<br>
<br>
=C2=A0 =C2=A0 zv: Swtich glib from git to latest released version<br>
<br>
=C2=A0 =C2=A0 We don&#39;t need the git version and cargo caching action do=
esn&#39;t help with<br>
=C2=A0 =C2=A0 cloning of git repos so the build takes longer in the CI than=
 it needs<br>
=C2=A0 =C2=A0 to.<br>
<br>
&gt; If, for some reason, this is no more possible, the whole recipe can be=
 removed<br>
&gt; (unless there is a direct dependency to zvariant in some=C2=A0 other r=
ecipes)<br>
&gt;<br>
<br>
Sounds like just deleting it might be the thing to do. I did go on a<br>
search for something else which had git dependency crates and didn&#39;t<br=
>
find anything (and I suspect even if we did, we might well be back<br>
here in 6 months if upstream churn deletes it). Maybe we just need<br>
something synthetic which is used here?<br></blockquote><div><br></div><div=
>=C2=A0I can come up with a simple recipe which will have sources locally</=
div><div>and a dependencies to some of crates fetched by git if you think</=
div><div>it would be useful.</div><div><br></div><div>I have lot of these k=
ind (git crate dependency) because we have internally a lot of unpublished =
(private)</div><div>crates in our git repo.</div><div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Alex Kiernan<br>
</blockquote></div></div>

--000000000000cf6ac0060c39049e--


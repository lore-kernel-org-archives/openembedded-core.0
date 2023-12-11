Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5C6C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 12:58:23 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.7586.1702299494791844338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 04:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cjU1tEF+;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5d7692542beso42575707b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 04:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702299494; x=1702904294; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SCKVSNFg++oaHawTbcawa6jZ6iwYS/yD7A3CE4gAjcY=;
        b=cjU1tEF+IG/8apH3FmzQ6b+9N2LPQs1NXHr5V9YJF+Xoi4y5I6XR2clx/umgg+MHF5
         9a8302rQ30nEsLeLekkaMRsOB3rJRj0z4ZqAZy7P4aq6r9w1Fmq4uv+/9XCBYMvG1HE3
         cMC/vmwnbbGHP9CGvaFz83XUd4odsO2Z0YKaXKiMKKCotcjlPWO8Cwf+WxzrYr+0FFJs
         +9zeV9OyA+paB59bWVMBl9KWw3tO4tuBULbzB3j6nh7F5sepfybO1caznkHu2210C/+x
         olKhKWfBv5KNPCx1LVt2eQvNFcdj8DJjedCfzj4YmoAebhhrYj+uTvCw0LgGjXgqjQCH
         6Qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702299494; x=1702904294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCKVSNFg++oaHawTbcawa6jZ6iwYS/yD7A3CE4gAjcY=;
        b=ZrB0wSg+1mYGh6h7LswRsXk4R9nvyFq8co+GIX51P0XN997q9OjNTQKCjjEcS+f/pz
         SIqHHQUHN8zrPtfSU75LA6tgfgp9x/EaHaW8CQmiuL6uuFi4u9OMRuG0bCn/yoHzeN6u
         PWziWA+UC35mmGwZRuDtcMqdOwzc3ZHiYshA859vTGTFNS4zLm0mlLnDUzYvyhV2IJed
         cx96fTL86P7QC2d3sffBUnN7YwQ+tHoWyDJsPeZl+FnLOKfTT8C0pvR2LFH6thimbEI0
         jMx/7/H3vPWWzLh9Bz8RZZJhzwEOHv1PuN9lVRyLse0ZIc/f5+dJZDlufsCc2bsExWlm
         q2nw==
X-Gm-Message-State: AOJu0YzbVx4g4HeFl1HzjXXWCZ3TfAnREcpaiG0ePAybSZQJ39A+7MvF
	Lw7u3wP54NxtI6KqonDw3j3nNl6cWoJy5r+087U=
X-Google-Smtp-Source: AGHT+IEh8WL6NDaHdgOorMsc7MsoULteSmwr7GAKZIzwkpvMoU3q351hJF3zklzsTUCBklXKMoAxq90EsLdaGztgRmw=
X-Received: by 2002:a5b:787:0:b0:d80:68d1:b826 with SMTP id
 b7-20020a5b0787000000b00d8068d1b826mr3244611ybq.6.1702299493826; Mon, 11 Dec
 2023 04:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20231208140349.3576-1-alex.kiernan@gmail.com> <20231208140349.3576-3-alex.kiernan@gmail.com>
 <a394853b1f2302baab431afe6fd0a1880b8238bd.camel@linuxfoundation.org>
 <CAO5Uq5RaQYvgye7a=qtwO2abDRP6WvggbKvjLpWuepJ1Rr3Z4A@mail.gmail.com>
 <CA+cAkerS0D8ai-PhV=tiL=6kbbwbaSV2YTKS0oSrTksNpmDNqA@mail.gmail.com>
 <CAO5Uq5S4S=e-zGNLbEscxjroX488=gM4nkT9RMAxdXxJ+uKU-A@mail.gmail.com>
 <CA+cAkeoxd1eu8KzNbycBFwYYjuR-w8Wx+y+bSNc1u5qmhHFWSg@mail.gmail.com> <CAO5Uq5TLJuuEEKHx4PX395yB6=XpoYQ+FE_AWic3a+QS0YixRA@mail.gmail.com>
In-Reply-To: <CAO5Uq5TLJuuEEKHx4PX395yB6=XpoYQ+FE_AWic3a+QS0YixRA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 11 Dec 2023 13:58:02 +0100
Message-ID: <CA+cAkepHt9u-mVc-1NxFBTVyx2+ACagGcje8ujTBGHuHd4WxRA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 3/7] rust: Upgrade 1.71.0 -> 1.71.1
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a1850a060c3b7c90"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 12:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192165

--000000000000a1850a060c3b7c90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Dec 2023 at 12:44, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Mon, Dec 11, 2023 at 10:01=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> >
> >
> > On Mon, 11 Dec 2023 at 10:17, Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> >>
> >> On Mon, Dec 11, 2023 at 7:15=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
> >> <frederic.martinsons@gmail.com> wrote:
> >> >
> >> >
> >> >
> >> > On Sun, 10 Dec 2023 at 21:28, Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> >> >>
> >> >> On Sun, Dec 10, 2023 at 7:39=E2=80=AFPM Richard Purdie
> >> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >> >
> >> >> > On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrote:
> >> >> > > https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html
> >> >> > >
> >> >> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >> >> > > ---
> >> >> > >
> >> >> > >  meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.1.=
bb}
> | 0
> >> >> > >  .../rust/{libstd-rs_1.71.0.bb =3D> libstd-rs_1.71.1.bb}
>  | 0
> >> >> > >  ...t-cross-canadian_1.71.0.bb =3D> rust-cross-canadian_1.71.1.=
bb}
> | 0
> >> >> > >  .../rust/{rust-llvm_1.71.0.bb =3D> rust-llvm_1.71.1.bb}
>  | 0
> >> >> > >  meta/recipes-devtools/rust/rust-source.inc
> | 2 +-
> >> >> > >  meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.bb=
}
>  | 0
> >> >> > >  6 files changed, 1 insertion(+), 1 deletion(-)
> >> >> > >  rename meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D>
> cargo_1.71.1.bb} (100%)
> >> >> > >  rename meta/recipes-devtools/rust/{libstd-rs_1.71.0.bb =3D>
> libstd-rs_1.71.1.bb} (100%)
> >> >> > >  rename meta/recipes-devtools/rust/{
> rust-cross-canadian_1.71.0.bb =3D> rust-cross-canadian_1.71.1.bb} (100%)
> >> >> > >  rename meta/recipes-devtools/rust/{rust-llvm_1.71.0.bb =3D>
> rust-llvm_1.71.1.bb} (100%)
> >> >> > >  rename meta/recipes-devtools/rust/{rust_1.71.0.bb =3D>
> rust_1.71.1.bb} (100%)
> >> >> > >
> >> >> > > diff --git a/meta/recipes-devtools/rust/cargo_1.71.0.bb
> b/meta/recipes-devtools/rust/cargo_1.71.1.bb
> >> >> > > similarity index 100%
> >> >> > > rename from meta/recipes-devtools/rust/cargo_1.71.0.bb
> >> >> > > rename to meta/recipes-devtools/rust/cargo_1.71.1.bb
> >> >> > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> b/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
> >> >> > > similarity index 100%
> >> >> > > rename from meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> >> >> > > rename to meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
> >> >> > > diff --git a/meta/recipes-devtools/rust/
> rust-cross-canadian_1.71.0.bb b/meta/recipes-devtools/rust/
> rust-cross-canadian_1.71.1.bb
> >> >> > > similarity index 100%
> >> >> > > rename from meta/recipes-devtools/rust/
> rust-cross-canadian_1.71.0.bb
> >> >> > > rename to meta/recipes-devtools/rust/
> rust-cross-canadian_1.71.1.bb
> >> >> > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> b/meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
> >> >> > > similarity index 100%
> >> >> > > rename from meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> >> >> > > rename to meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
> >> >> > > diff --git a/meta/recipes-devtools/rust/rust-source.inc
> b/meta/recipes-devtools/rust/rust-source.inc
> >> >> > > index 3a192e42db7d..0729db6f0b45 100644
> >> >> > > --- a/meta/recipes-devtools/rust/rust-source.inc
> >> >> > > +++ b/meta/recipes-devtools/rust/rust-source.inc
> >> >> > > @@ -7,7 +7,7 @@ SRC_URI +=3D "
> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
> >> >> > >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
> >> >> > >
> file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=3D$=
{RUSTSRC}
> \
> >> >> > >  "
> >> >> > > -SRC_URI[rust.sha256sum] =3D
> "5814699031aafdcc2e2f71fc9b389678cd7042350d1583da061463d8e88681c7"
> >> >> > > +SRC_URI[rust.sha256sum] =3D
> "371af0fbe04051e20a74dbea6d4e4e548f10f15309c49cae2688afb882b6c7f1"
> >> >> > >
> >> >> > >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> >> >> > >
> >> >> > > diff --git a/meta/recipes-devtools/rust/rust_1.71.0.bb
> b/meta/recipes-devtools/rust/rust_1.71.1.bb
> >> >> > > similarity index 100%
> >> >> > > rename from meta/recipes-devtools/rust/rust_1.71.0.bb
> >> >> > > rename to meta/recipes-devtools/rust/rust_1.71.1.bb
> >> >> >
> >> >> > I ran some testing and it looks like we could merge up to 1.71.1
> >> >> > without autobuilder failures in this series. Beyond that we have
> the
> >> >> > reproducibility and zvariant issues.
> >> >> >
> >> >>
> >> >> Thanks.
> >> >>
> >> >> Was the failure at that point reproducibility or the zvariant trait
> >> >> failure? I just posted an update for zvariant which doesn't see the
> >> >> trait recursion failure, but at the same time it no longer exercise=
s
> >> >> crates pulled from git which looked like it was the main purpose it
> >> >> was fulfilling for testing.
> >> >>
> >> > I didn't follow issues about this upgrade, but yes, the zvariant
> recipe
> >> > was a demonstration on how to handle crates dependencies that come
> from git.
> >> > (there is a specific crate fetcher url parameter: 'git-dependency')
> >> >
> >>
> >> 3.12 (which was what we had) exploded with unbounded recursion inside
> >> a trait on later compilers, upgrading to 3.15 fixes it, but they've
> >> dropped the git dependency crate and just used upstream crates:
> >>
> >> commit 9e34dd510bf1a50f5168d5164578ebe8958928e3
> >> Author: Zeeshan Ali Khan <zeeshanak@gnome.org>
> >> Date:   Wed May 10 20:45:26 2023 +0200
> >>
> >>     zv: Swtich glib from git to latest released version
> >>
> >>     We don't need the git version and cargo caching action doesn't hel=
p
> with
> >>     cloning of git repos so the build takes longer in the CI than it
> needs
> >>     to.
> >>
> >> > If, for some reason, this is no more possible, the whole recipe can
> be removed
> >> > (unless there is a direct dependency to zvariant in some  other
> recipes)
> >> >
> >>
> >> Sounds like just deleting it might be the thing to do. I did go on a
> >> search for something else which had git dependency crates and didn't
> >> find anything (and I suspect even if we did, we might well be back
> >> here in 6 months if upstream churn deletes it). Maybe we just need
> >> something synthetic which is used here?
> >
> >
> >  I can come up with a simple recipe which will have sources locally
> > and a dependencies to some of crates fetched by git if you think
> > it would be useful.
> >
> > I have lot of these kind (git crate dependency) because we have
> internally a lot of unpublished (private)
> > crates in our git repo.
> >
>
> Just discovered we have one in meta-oe - thin-provisioning-tools uses
> a git dep. Though for test purposes in oe-core, I think I'd still lean
> towards something synthetic which we know won't move.
>

ok , great.

> --
> Alex Kiernan
>

--000000000000a1850a060c3b7c90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Dec 2023 at 12:44, Alex Ki=
ernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Mon, Dec 11, 2023 at 10:01=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, 11 Dec 2023 at 10:17, Alex Kiernan &lt;<a href=3D"mailto:alex.=
kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; On Mon, Dec 11, 2023 at 7:15=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martins=
ons<br>
&gt;&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_bl=
ank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Sun, 10 Dec 2023 at 21:28, Alex Kiernan &lt;<a href=3D"mai=
lto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt=
; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Sun, Dec 10, 2023 at 7:39=E2=80=AFPM Richard Purdie<br=
>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrot=
e:<br>
&gt;&gt; &gt;&gt; &gt; &gt; <a href=3D"https://blog.rust-lang.org/2023/08/0=
3/Rust-1.71.1.html" rel=3D"noreferrer" target=3D"_blank">https://blog.rust-=
lang.org/2023/08/03/Rust-1.71.1.html</a><br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Signed-off-by: Alex Kiernan &lt;<a href=3D"mail=
to:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;=
<br>
&gt;&gt; &gt;&gt; &gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/rust/{<a href=3D"ht=
tp://cargo_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.0.bb<=
/a> =3D&gt; <a href=3D"http://cargo_1.71.1.bb" rel=3D"noreferrer" target=3D=
"_blank">cargo_1.71.1.bb</a>} | 0<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 .../rust/{<a href=3D"http://libstd-rs_1.7=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.0.bb</a> =3D&gt=
; <a href=3D"http://libstd-rs_1.71.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">libstd-rs_1.71.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 ...<a href=3D"http://t-cross-canadian_1.7=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">t-cross-canadian_1.71.0.bb</a>=
 =3D&gt; <a href=3D"http://rust-cross-canadian_1.71.1.bb" rel=3D"noreferrer=
" target=3D"_blank">rust-cross-canadian_1.71.1.bb</a>} | 0<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 .../rust/{<a href=3D"http://rust-llvm_1.7=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.0.bb</a> =3D&gt=
; <a href=3D"http://rust-llvm_1.71.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">rust-llvm_1.71.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/rust/rust-source.in=
c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/rust/{<a href=3D"ht=
tp://rust_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0.bb</a=
> =3D&gt; <a href=3D"http://rust_1.71.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">rust_1.71.1.bb</a>}=C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 6 files changed, 1 insertion(+), 1 deleti=
on(-)<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a hre=
f=3D"http://cargo_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.7=
1.0.bb</a> =3D&gt; <a href=3D"http://cargo_1.71.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">cargo_1.71.1.bb</a>} (100%)<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a hre=
f=3D"http://libstd-rs_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">libst=
d-rs_1.71.0.bb</a> =3D&gt; <a href=3D"http://libstd-rs_1.71.1.bb" rel=3D"no=
referrer" target=3D"_blank">libstd-rs_1.71.1.bb</a>} (100%)<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a hre=
f=3D"http://rust-cross-canadian_1.71.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">rust-cross-canadian_1.71.0.bb</a> =3D&gt; <a href=3D"http://rust-cross=
-canadian_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-canadi=
an_1.71.1.bb</a>} (100%)<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a hre=
f=3D"http://rust-llvm_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-=
llvm_1.71.0.bb</a> =3D&gt; <a href=3D"http://rust-llvm_1.71.1.bb" rel=3D"no=
referrer" target=3D"_blank">rust-llvm_1.71.1.bb</a>} (100%)<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a hre=
f=3D"http://rust_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.=
0.bb</a> =3D&gt; <a href=3D"http://rust_1.71.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">rust_1.71.1.bb</a>} (100%)<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=
=3D"http://cargo_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71=
.0.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.71.1.bb" r=
el=3D"noreferrer" target=3D"_blank">cargo_1.71.1.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; similarity index 100%<br>
&gt;&gt; &gt;&gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=
=3D"http://cargo_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71=
.0.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D=
"http://cargo_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.1.=
bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=
=3D"http://libstd-rs_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd=
-rs_1.71.0.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://libstd-rs_=
1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.1.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; similarity index 100%<br>
&gt;&gt; &gt;&gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=
=3D"http://libstd-rs_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd=
-rs_1.71.0.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D=
"http://libstd-rs_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs=
_1.71.1.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=
=3D"http://rust-cross-canadian_1.71.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">rust-cross-canadian_1.71.0.bb</a> b/meta/recipes-devtools/rust/<a href=
=3D"http://rust-cross-canadian_1.71.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">rust-cross-canadian_1.71.1.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; similarity index 100%<br>
&gt;&gt; &gt;&gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=
=3D"http://rust-cross-canadian_1.71.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">rust-cross-canadian_1.71.0.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D=
"http://rust-cross-canadian_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>rust-cross-canadian_1.71.1.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=
=3D"http://rust-llvm_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-l=
lvm_1.71.0.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_=
1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.1.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; similarity index 100%<br>
&gt;&gt; &gt;&gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=
=3D"http://rust-llvm_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-l=
lvm_1.71.0.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D=
"http://rust-llvm_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm=
_1.71.1.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/rust-so=
urce.inc b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt;&gt; &gt;&gt; &gt; &gt; index 3a192e42db7d..0729db6f0b45 100644<br>
&gt;&gt; &gt;&gt; &gt; &gt; --- a/meta/recipes-devtools/rust/rust-source.in=
c<br>
&gt;&gt; &gt;&gt; &gt; &gt; +++ b/meta/recipes-devtools/rust/rust-source.in=
c<br>
&gt;&gt; &gt;&gt; &gt; &gt; @@ -7,7 +7,7 @@ SRC_URI +=3D &quot;<a href=3D"h=
ttps://static.rust-lang.org/dist/rustc-$%7BRUST_VERSION%7D-src.tar.xz;n" re=
l=3D"noreferrer" target=3D"_blank">https://static.rust-lang.org/dist/rustc-=
${RUST_VERSION}-src.tar.xz;n</a><br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=3D${=
RUSTSRC} \<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 &quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt; -SRC_URI[rust.sha256sum] =3D &quot;5814699031aa=
fdcc2e2f71fc9b389678cd7042350d1583da061463d8e88681c7&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt; +SRC_URI[rust.sha256sum] =3D &quot;371af0fbe040=
51e20a74dbea6d4e4e548f10f15309c49cae2688afb882b6c7f1&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 RUSTSRC =3D &quot;${WORKDIR}/rustc-${RUST=
_VERSION}-src&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=
=3D"http://rust_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0=
.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://rust_1.71.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.71.1.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; similarity index 100%<br>
&gt;&gt; &gt;&gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=
=3D"http://rust_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0=
.bb</a><br>
&gt;&gt; &gt;&gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D=
"http://rust_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.1.bb=
</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I ran some testing and it looks like we could merge =
up to 1.71.1<br>
&gt;&gt; &gt;&gt; &gt; without autobuilder failures in this series. Beyond =
that we have the<br>
&gt;&gt; &gt;&gt; &gt; reproducibility and zvariant issues.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Thanks.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Was the failure at that point reproducibility or the zvar=
iant trait<br>
&gt;&gt; &gt;&gt; failure? I just posted an update for zvariant which doesn=
&#39;t see the<br>
&gt;&gt; &gt;&gt; trait recursion failure, but at the same time it no longe=
r exercises<br>
&gt;&gt; &gt;&gt; crates pulled from git which looked like it was the main =
purpose it<br>
&gt;&gt; &gt;&gt; was fulfilling for testing.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; I didn&#39;t follow issues about this upgrade, but yes, the z=
variant recipe<br>
&gt;&gt; &gt; was a demonstration on how to handle crates dependencies that=
 come from git.<br>
&gt;&gt; &gt; (there is a specific crate fetcher url parameter: &#39;git-de=
pendency&#39;)<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; 3.12 (which was what we had) exploded with unbounded recursion ins=
ide<br>
&gt;&gt; a trait on later compilers, upgrading to 3.15 fixes it, but they&#=
39;ve<br>
&gt;&gt; dropped the git dependency crate and just used upstream crates:<br=
>
&gt;&gt;<br>
&gt;&gt; commit 9e34dd510bf1a50f5168d5164578ebe8958928e3<br>
&gt;&gt; Author: Zeeshan Ali Khan &lt;<a href=3D"mailto:zeeshanak@gnome.org=
" target=3D"_blank">zeeshanak@gnome.org</a>&gt;<br>
&gt;&gt; Date:=C2=A0 =C2=A0Wed May 10 20:45:26 2023 +0200<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0zv: Swtich glib from git to latest released ver=
sion<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0We don&#39;t need the git version and cargo cac=
hing action doesn&#39;t help with<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0cloning of git repos so the build takes longer =
in the CI than it needs<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0to.<br>
&gt;&gt;<br>
&gt;&gt; &gt; If, for some reason, this is no more possible, the whole reci=
pe can be removed<br>
&gt;&gt; &gt; (unless there is a direct dependency to zvariant in some=C2=
=A0 other recipes)<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Sounds like just deleting it might be the thing to do. I did go on=
 a<br>
&gt;&gt; search for something else which had git dependency crates and didn=
&#39;t<br>
&gt;&gt; find anything (and I suspect even if we did, we might well be back=
<br>
&gt;&gt; here in 6 months if upstream churn deletes it). Maybe we just need=
<br>
&gt;&gt; something synthetic which is used here?<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 I can come up with a simple recipe which will have sources local=
ly<br>
&gt; and a dependencies to some of crates fetched by git if you think<br>
&gt; it would be useful.<br>
&gt;<br>
&gt; I have lot of these kind (git crate dependency) because we have intern=
ally a lot of unpublished (private)<br>
&gt; crates in our git repo.<br>
&gt;<br>
<br>
Just discovered we have one in meta-oe - thin-provisioning-tools uses<br>
a git dep. Though for test purposes in oe-core, I think I&#39;d still lean<=
br>
towards something synthetic which we know won&#39;t move.<br></blockquote><=
div><br></div><div>ok , great.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
-- <br>
Alex Kiernan<br>
</blockquote></div></div>

--000000000000a1850a060c3b7c90--


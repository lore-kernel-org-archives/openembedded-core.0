Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF14C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 08:52:48 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.30068.1679907165560059278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 01:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GDlDgH35;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id e11so8093007lji.8
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 01:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679907163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R1ZOYNkiSRNFRftB6/eHfej58Ta7p6v0SaEWV9ko8rM=;
        b=GDlDgH352mXKN/BVh7yUu98Fx0wEX7adyx3QyWHFATgxqTA4jpTI6zAgz+Nz43T7cD
         Ru3buZqdXvv8gW/Hg1jaEkD3CG5pHkjyquXMdI8RDIJ8Fz1YGZVfIPrTwfBjDlOqA3fb
         X6nWkmQFGWNiUUE139oR2LkzD9azisgovX0DYfGprbUs2DnyhSdAAkGTxHz/kGy/WuxX
         x6Ysa72ZrLmuEmb/X2WNwU+D5aevcTjyHqyXlHKDs2FE5AKXXXsjW5vv6qItTW1bNQXl
         bNDwyhkvvL4Iqq/kjEKEOvCGDqcLYfGEixoxDa1//NaO88tiTa8U23uV7tYYJ14xHOAE
         ttHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679907163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1ZOYNkiSRNFRftB6/eHfej58Ta7p6v0SaEWV9ko8rM=;
        b=4HxZxX46ND0nLH9VlHKVCtk2RRCXuU2eSWqfRqsQmsRiicmWZu/KoWUoLx/YltvQ7k
         KoaajWJHyjnY/Mi3v/BisvU6aL8rFYddHQ1IdUDcCTwXA2K7YTePvwq1TK1F0mzzGG7a
         MKcnFujbXAmBy6qoGSJRDZFdJJrQMp7RJXoYr42pBEZhx9TRnA6SgDxylO9JUZL7908z
         KXdt57aTHFeSLB8iTWV1rv4p3F3Wh0OFSE/+ffzuyDHpFuj99BMOPTCiPcXDdyY2GIQe
         3jcy+HKRDibkkM90hR+IR8ph3RqdY2LtuBueRYVPB0xTP2W5jhzjqV+gaKGhIFr3JI9c
         G3Ng==
X-Gm-Message-State: AAQBX9fcDtqir/SNbO9p/OGCcTJFcKmALBbnY3rbTWtUnhjhYZp2QsgC
	Jote9jb1E31bTMiEi8W3uz8w4CRhoarVFYBBA/o=
X-Google-Smtp-Source: AKy350bkkNtfZg8R4we6TT6LpydSosYvOufom5FrR225HYz5IjaLEOI0Q4ByVcHJcsIj9mPSFNi+pF/7UdObrtLH0vI=
X-Received: by 2002:a2e:9d59:0:b0:298:b32c:e4f9 with SMTP id
 y25-20020a2e9d59000000b00298b32ce4f9mr3187267ljj.3.1679907163135; Mon, 27 Mar
 2023 01:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <417bea7e5fbf6c5e82d8594eac002c2a809686d2.1679734210.git.frederic.martinsons@gmail.com>
 <CANNYZj_Fjk7RqbP6ZhrfTDW3Ra3g7=gmmmSPN4juqciptBMVmg@mail.gmail.com>
 <CA+cAkeqY9spjHQ8Hsbn=wXPfu2zNSD-Nm2T9+oYtGM3V3rSx9Q@mail.gmail.com>
 <CANNYZj_VMD3wzdh_hty5qvP6ptDt7=htFhQN4Vz_hUwweOe0ug@mail.gmail.com>
 <CA+cAker6ty7PV9qn9mYWN0ri4TV+cAKGW+GRiBJRY=Boq6jr7w@mail.gmail.com>
 <CANNYZj9EY6bimJSOE_oMAohXTY81mJvRRkLHztMjreNVtVtKcA@mail.gmail.com>
 <CAO5Uq5Q1LPWpw=QnmPqqvKkR7MfcKSiyZc_OpJf_iGm7LtSp5g@mail.gmail.com>
 <CA+cAkerf9TrTevXWXoJWsxJkv_eCCGcqA02usiMBFkwDfJb_bA@mail.gmail.com> <CAO5Uq5TTFbhgQ34sTFYtcH2zRYhi1UT-iLS=d-NMs638=BdsqA@mail.gmail.com>
In-Reply-To: <CAO5Uq5TTFbhgQ34sTFYtcH2zRYhi1UT-iLS=d-NMs638=BdsqA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 27 Mar 2023 10:52:30 +0200
Message-ID: <CA+cAkepLdzpPH_hP_15myFvE9JCCx_B9AKaYdfcPFzO4_hjvXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] rust-example: provide a recipe for zvariant
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b6e09105f7dddd2a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 08:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179149

--000000000000b6e09105f7dddd2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

True, no rust project will ever DEPENDS on the zvariant recipe and as you
said
will simply list zvariant as a crate.
My main concern with the example was to address this comment:
https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.102=
12-2-alex.kiernan@gmail.com/#6450

So , do you think it's still worth providing such an example ? and if yes,
can I place it
in meta-openembedded/meta-oe/recipes-extended/ ?



On Mon, 27 Mar 2023 at 10:42, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> I think modelling meta-rust on meta-python is wrong - rust doesn't
> package crates, they get consumed into the main recipe (which I've
> just realised means I think we have some work on licensing to do).
>
> For this example, I think it's just a regular recipe which should sit
> alongside other recipes in meta-oe; anyone who wants to consume
> zvariant is going to list it as part of their Cargo.toml, not DEPEND
> on this recipe.
>
> I guess I'm really arguing that meta-rust is purely a legacy thing at
> this point (one which I continue to need and maintain a fork of!).
>
> On Mon, Mar 27, 2023 at 9:30=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > There is a stalled merge request for this clean:
> https://github.com/meta-rust/meta-rust/pull/364
> >
> > But I think Alex is right, all needed things for rust/cargo projects
> seem to be already in oe-core except
> > for examples of recipes.
> >
> > What about adding meta-rust in meta-openembedded which will contains th=
e
> example, something like
> >
> > meta-rust/
> > =E2=94=9C=E2=94=80=E2=94=80 conf
> > =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 layer.conf
> > =E2=94=9C=E2=94=80=E2=94=80 COPYING.MIT
> > =E2=94=9C=E2=94=80=E2=94=80 README
> > =E2=94=94=E2=94=80=E2=94=80 recipes-extended
> >     =E2=94=9C=E2=94=80=E2=94=80 zvariant
> >     =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 0001-Tweak-zvariant-cargo-c=
onfig.patch
> >     =E2=94=9C=E2=94=80=E2=94=80 zvariant_3.12.0.bb
> >     =E2=94=94=E2=94=80=E2=94=80 zvariant-crates.inc
> >
> >
> > On Mon, 27 Mar 2023 at 10:19, Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> >>
> >> If you're on master I don't think there's anything useful in meta-rust
> >> - its providing toolchains for older branches.
> >>
> >> On Mon, Mar 27, 2023 at 7:40=E2=80=AFAM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > You could meanwhile review meta-rust, and see what is useful and wha=
t
> >> > is obsolete perhaps? I see it still carries toolchain recipes for
> >> > example, I have no idea why.
> >> >
> >> > Alex
> >> >
> >> > On Mon, 27 Mar 2023 at 06:09, Fr=C3=A9d=C3=A9ric Martinsons
> >> > <frederic.martinsons@gmail.com> wrote:
> >> > >
> >> > > Ok, should I work on this cleaning of meta-rust and merging in
> meta-oe ? or should I wait for other opinions ?
> >> > >
> >> > > On Sun, 26 Mar 2023 at 18:55, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >> > >>
> >> > >> rust-hello-world is installed into test images, and has a runtime
> test
> >> > >> to verify that the toolchain produces working binaries:
> >> > >> meta/lib/oeqa/runtime/cases/rust.py
> >> > >>
> >> > >> I thought meta-rust could be cleaned up, and added to meta-oe
> perhaps?
> >> > >> Same as meta-perl/meta-python.
> >> > >> https://github.com/meta-rust/meta-rust
> >> > >>
> >> > >> Alex
> >> > >>
> >> > >> On Sat, 25 Mar 2023 at 21:43, Fr=C3=A9d=C3=A9ric Martinsons
> >> > >> <frederic.martinsons@gmail.com> wrote:
> >> > >> >
> >> > >> > I thought that would be treated the same as
> rust-hello-world_git.bb which is in oe-core.
> >> > >> >
> >> > >> > Anyway, I don't mind placing it elsewhere, which layer do you
> think this recipe would land?
> >> > >> >
> >> > >> >
> >> > >> >
> >> > >> > Le sam. 25 mars 2023, 19:52, Alexander Kanavin <
> alex.kanavin@gmail.com> a =C3=A9crit :
> >> > >> >>
> >> > >> >> I don't think this should be going in oe-core, as it's not
> actually
> >> > >> >> used by anything, or in any automated tests. But you can place
> it in a
> >> > >> >> separate layer.
> >> > >> >>
> >> > >> >> Alex
> >> > >> >>
> >> > >> >> On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons
> >> > >> >> <frederic.martinsons@gmail.com> wrote:
> >> > >> >> >
> >> > >> >> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >> > >> >> >
> >> > >> >> > This recipe is for showing an "real world" example of
> >> > >> >> > a crate that depends on some git repositories.
> >> > >> >> >
> >> > >> >> > Usually, this kind of crate is built within a global
> >> > >> >> > workspace (here it is the zbus project) and so
> >> > >> >> > doesn't need a Cargo.lock on its own.
> >> > >> >> >
> >> > >> >> > For the sake of the demonstration, I had to add
> >> > >> >> > a patch for probiding a Cargo.lock and modifying
> >> > >> >> > zvariant_deriver to get it from crates.io instead
> >> > >> >> > of pulling locally with a relative path
> >> > >> >> >
> >> > >> >> > The use case where the crate had some git repository
> >> > >> >> > in dependency is very common for "private" crate that
> >> > >> >> > are not aimed to be published on crate.io.
> >> > >> >> > When the project grow bigger, it is common to have
> >> > >> >> > a bin and multiple lib developped in parallel, and these
> >> > >> >> > libs are surely on a git repostitory.
> >> > >> >> >
> >> > >> >> > Hence the need of this support in oe-core.
> >> > >> >> >
> >> > >> >> > Signed-off-by: Frederic Martinsons <
> frederic.martinsons@gmail.com>
> >> > >> >> > ---
> >> > >> >> >  .../rust-example/zvariant-crates.inc          |  140 ++
> >> > >> >> >  .../0001-Tweak-zvariant-cargo-config.patch    | 1249
> +++++++++++++++++
> >> > >> >> >  .../rust-example/zvariant_3.12.0.bb           |   20 +
> >> > >> >> >  3 files changed, 1409 insertions(+)
> >> > >> >> >  create mode 100644
> meta/recipes-extended/rust-example/zvariant-crates.inc
> >> > >> >> >  create mode 100644
> meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-con=
fig.patch
> >> > >> >> >  create mode 100644 meta/recipes-extended/rust-example/
> zvariant_3.12.0.bb
> >> > >> >> >
> >> > >> >> > diff --git
> a/meta/recipes-extended/rust-example/zvariant-crates.inc
> b/meta/recipes-extended/rust-example/zvariant-crates.inc
> >> > >> >> > new file mode 100644
> >> > >> >> > index 0000000000..297a784661
> >> > >> >> > --- /dev/null
> >> > >> >> > +++ b/meta/recipes-extended/rust-example/zvariant-crates.inc
> >> > >> >> > @@ -0,0 +1,140 @@
> >> > >> >> > +SRC_URI +=3D " \
> >> > >> >> > +    crate://crates.io/anes/0.1.6 \
> >> > >> >> > +    crate://crates.io/anyhow/1.0.70 \
> >> > >> >> > +    crate://crates.io/arrayvec/0.7.2 \
> >> > >> >> > +    crate://crates.io/atty/0.2.14 \
> >> > >> >> > +    crate://crates.io/autocfg/1.1.0 \
> >> > >> >> > +    crate://crates.io/bitflags/1.3.2 \
> >> > >> >> > +    crate://crates.io/bumpalo/3.12.0 \
> >> > >> >> > +    crate://crates.io/byteorder/1.4.3 \
> >> > >> >> > +    crate://crates.io/cast/0.3.0 \
> >> > >> >> > +    crate://crates.io/cfg-if/1.0.0 \
> >> > >> >> > +    crate://crates.io/chrono/0.4.24 \
> >> > >> >> > +    crate://crates.io/ciborium-io/0.2.0 \
> >> > >> >> > +    crate://crates.io/ciborium-ll/0.2.0 \
> >> > >> >> > +    crate://crates.io/ciborium/0.2.0 \
> >> > >> >> > +    crate://crates.io/clap/3.2.23 \
> >> > >> >> > +    crate://crates.io/clap_lex/0.2.4 \
> >> > >> >> > +    crate://crates.io/criterion-plot/0.5.0 \
> >> > >> >> > +    crate://crates.io/criterion/0.4.0 \
> >> > >> >> > +    crate://crates.io/crossbeam-channel/0.5.7 \
> >> > >> >> > +    crate://crates.io/crossbeam-deque/0.8.3 \
> >> > >> >> > +    crate://crates.io/crossbeam-epoch/0.9.14 \
> >> > >> >> > +    crate://crates.io/crossbeam-utils/0.8.15 \
> >> > >> >> > +    crate://crates.io/either/1.8.1 \
> >> > >> >> > +    crate://crates.io/enumflags2/0.7.5 \
> >> > >> >> > +    crate://crates.io/enumflags2_derive/0.7.4 \
> >> > >> >> > +    crate://crates.io/form_urlencoded/1.1.0 \
> >> > >> >> > +    crate://crates.io/futures-channel/0.3.27 \
> >> > >> >> > +    crate://crates.io/futures-core/0.3.27 \
> >> > >> >> > +    crate://crates.io/futures-executor/0.3.27 \
> >> > >> >> > +    crate://crates.io/futures-macro/0.3.27 \
> >> > >> >> > +    crate://crates.io/futures-task/0.3.27 \
> >> > >> >> > +    crate://crates.io/futures-util/0.3.27 \
> >> > >> >> > +    crate://crates.io/getrandom/0.2.8 \
> >> > >> >> > +    crate://crates.io/half/1.8.2 \
> >> > >> >> > +    crate://crates.io/hashbrown/0.12.3 \
> >> > >> >> > +    crate://crates.io/heck/0.3.3 \
> >> > >> >> > +    crate://crates.io/hermit-abi/0.1.19 \
> >> > >> >> > +    crate://crates.io/hermit-abi/0.2.6 \
> >> > >> >> > +    crate://crates.io/idna/0.3.0 \
> >> > >> >> > +    crate://crates.io/indexmap/1.9.2 \
> >> > >> >> > +    crate://crates.io/itertools/0.10.5 \
> >> > >> >> > +    crate://crates.io/itertools/0.9.0 \
> >> > >> >> > +    crate://crates.io/itoa/1.0.6 \
> >> > >> >> > +    crate://crates.io/js-sys/0.3.61 \
> >> > >> >> > +    crate://crates.io/lazy_static/1.4.0 \
> >> > >> >> > +    crate://crates.io/libc/0.2.140 \
> >> > >> >> > +    crate://crates.io/log/0.4.17 \
> >> > >> >> > +    crate://crates.io/memchr/2.5.0 \
> >> > >> >> > +    crate://crates.io/memoffset/0.8.0 \
> >> > >> >> > +    crate://crates.io/num-integer/0.1.45 \
> >> > >> >> > +    crate://crates.io/num-traits/0.2.15 \
> >> > >> >> > +    crate://crates.io/num_cpus/1.15.0 \
> >> > >> >> > +    crate://crates.io/once_cell/1.17.1 \
> >> > >> >> > +    crate://crates.io/oorandom/11.1.3 \
> >> > >> >> > +    crate://crates.io/os_str_bytes/6.5.0 \
> >> > >> >> > +    crate://crates.io/percent-encoding/2.2.0 \
> >> > >> >> > +    crate://crates.io/pin-project-lite/0.2.9 \
> >> > >> >> > +    crate://crates.io/pin-utils/0.1.0 \
> >> > >> >> > +    crate://crates.io/pkg-config/0.3.26 \
> >> > >> >> > +    crate://crates.io/plotters-backend/0.3.4 \
> >> > >> >> > +    crate://crates.io/plotters-svg/0.3.3 \
> >> > >> >> > +    crate://crates.io/plotters/0.3.4 \
> >> > >> >> > +    crate://crates.io/ppv-lite86/0.2.17 \
> >> > >> >> > +    crate://crates.io/proc-macro-crate/0.1.5 \
> >> > >> >> > +    crate://crates.io/proc-macro-crate/1.3.1 \
> >> > >> >> > +    crate://crates.io/proc-macro-error-attr/1.0.4 \
> >> > >> >> > +    crate://crates.io/proc-macro-error/1.0.4 \
> >> > >> >> > +    crate://crates.io/proc-macro2/1.0.53 \
> >> > >> >> > +    crate://crates.io/quote/1.0.26 \
> >> > >> >> > +    crate://crates.io/rand/0.8.5 \
> >> > >> >> > +    crate://crates.io/rand_chacha/0.3.1 \
> >> > >> >> > +    crate://crates.io/rand_core/0.6.4 \
> >> > >> >> > +    crate://crates.io/rayon-core/1.11.0 \
> >> > >> >> > +    crate://crates.io/rayon/1.7.0 \
> >> > >> >> > +    crate://crates.io/regex-syntax/0.6.29 \
> >> > >> >> > +    crate://crates.io/regex/1.7.2 \
> >> > >> >> > +    crate://crates.io/ryu/1.0.13 \
> >> > >> >> > +    crate://crates.io/same-file/1.0.6 \
> >> > >> >> > +    crate://crates.io/scopeguard/1.1.0 \
> >> > >> >> > +    crate://crates.io/serde/1.0.158 \
> >> > >> >> > +    crate://crates.io/serde_bytes/0.11.9 \
> >> > >> >> > +    crate://crates.io/serde_derive/1.0.158 \
> >> > >> >> > +    crate://crates.io/serde_json/1.0.94 \
> >> > >> >> > +    crate://crates.io/serde_repr/0.1.12 \
> >> > >> >> > +    crate://crates.io/slab/0.4.8 \
> >> > >> >> > +    crate://crates.io/static_assertions/1.1.0 \
> >> > >> >> > +    crate://crates.io/strum/0.18.0 \
> >> > >> >> > +    crate://crates.io/strum_macros/0.18.0 \
> >> > >> >> > +    crate://crates.io/syn/1.0.109 \
> >> > >> >> > +    crate://crates.io/syn/2.0.8 \
> >> > >> >> > +    crate://crates.io/system-deps/1.3.2 \
> >> > >> >> > +    crate://crates.io/textwrap/0.16.0 \
> >> > >> >> > +    crate://crates.io/thiserror-impl/1.0.40 \
> >> > >> >> > +    crate://crates.io/thiserror/1.0.40 \
> >> > >> >> > +    crate://crates.io/time-core/0.1.0 \
> >> > >> >> > +    crate://crates.io/time-macros/0.2.8 \
> >> > >> >> > +    crate://crates.io/time/0.3.20 \
> >> > >> >> > +    crate://crates.io/tinytemplate/1.2.1 \
> >> > >> >> > +    crate://crates.io/tinyvec/1.6.0 \
> >> > >> >> > +    crate://crates.io/tinyvec_macros/0.1.1 \
> >> > >> >> > +    crate://crates.io/toml/0.5.11 \
> >> > >> >> > +    crate://crates.io/toml_datetime/0.6.1 \
> >> > >> >> > +    crate://crates.io/toml_edit/0.19.8 \
> >> > >> >> > +    crate://crates.io/unicode-bidi/0.3.13 \
> >> > >> >> > +    crate://crates.io/unicode-ident/1.0.8 \
> >> > >> >> > +    crate://crates.io/unicode-normalization/0.1.22 \
> >> > >> >> > +    crate://crates.io/unicode-segmentation/1.10.1 \
> >> > >> >> > +    crate://crates.io/url/2.3.1 \
> >> > >> >> > +    crate://crates.io/uuid/1.3.0 \
> >> > >> >> > +    crate://crates.io/version-compare/0.0.10 \
> >> > >> >> > +    crate://crates.io/version_check/0.9.4 \
> >> > >> >> > +    crate://crates.io/walkdir/2.3.3 \
> >> > >> >> > +    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> >> > >> >> > +    crate://crates.io/wasm-bindgen-backend/0.2.84 \
> >> > >> >> > +    crate://crates.io/wasm-bindgen-macro-support/0.2.84 \
> >> > >> >> > +    crate://crates.io/wasm-bindgen-macro/0.2.84 \
> >> > >> >> > +    crate://crates.io/wasm-bindgen-shared/0.2.84 \
> >> > >> >> > +    crate://crates.io/wasm-bindgen/0.2.84 \
> >> > >> >> > +    crate://crates.io/web-sys/0.3.61 \
> >> > >> >> > +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> >> > >> >> > +    crate://crates.io/winapi-util/0.1.5 \
> >> > >> >> > +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> >> > >> >> > +    crate://crates.io/winapi/0.3.9 \
> >> > >> >> > +    crate://crates.io/winnow/0.4.0 \
> >> > >> >> > +    crate://crates.io/zvariant_derive/3.12.0 \
> >> > >> >> > +    crate://crates.io/zvariant_utils/1.0.0 \
> >> > >> >> > +    git://
> github.com/gtk-rs/glib;protocol=3Dhttps;nobranch=3D1;name=3Dglib;destsuff=
ix=3Dglib
> \
> >> > >> >> > +    git://
> github.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dglib-sys;dests=
uffix=3Dglib-sys;subpath=3Dglib-sys
> \
> >> > >> >> > +    git://
> github.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dgobject-sys;de=
stsuffix=3Dgobject-sys;subpath=3Dgobject-sys
> \
> >> > >> >> > +"
> >> > >> >> > +
> >> > >> >> > +SRCREV_FORMAT .=3D "_glib"
> >> > >> >> > +SRCREV_glib =3D "c9ee583cea07830c099cdcccd33eda9ef705ea93"
> >> > >> >> > +
> >> > >> >> > +SRCREV_FORMAT .=3D "_glib-sys"
> >> > >> >> > +SRCREV_glib-sys =3D "5f35e26c65d24f8f018f643218de0f5807ba5f=
01"
> >> > >> >> > +
> >> > >> >> > +SRCREV_FORMAT .=3D "_gobject-sys"
> >> > >> >> > +SRCREV_gobject-sys =3D
> "5f35e26c65d24f8f018f643218de0f5807ba5f01"
> >> > >> >> > diff --git
> a/meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-c=
onfig.patch
> b/meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-c=
onfig.patch
> >> > >> >> > new file mode 100644
> >> > >> >> > index 0000000000..638ba3ed4d
> >> > >> >> > --- /dev/null
> >> > >> >> > +++
> b/meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-c=
onfig.patch
> >> > >> >> > @@ -0,0 +1,1249 @@
> >> > >> >> > +From e85ce4136694899f0010d48f47c5e905c3a9d461 Mon Sep 17
> 00:00:00 2001
> >> > >> >> > +From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >> > >> >> > +Date: Thu, 23 Mar 2023 07:12:37 +0100
> >> > >> >> > +Subject: [PATCH] Tweak zvariant cargo config
> >> > >> >> > +
> >> > >> >> > +This library crate is a part of zbus project, and is aimed =
to
> >> > >> >> > +be published amongst the whole project.
> >> > >> >> > +
> >> > >> >> > +Nevertheless, this recipe is for showing example of real
> >> > >> >> > +code which uses a local registry via git url inside yocto
> >> > >> >> > +environment.
> >> > >> >> > +
> >> > >> >> > +I didn't find a real example of binary crate that uses git
> >> > >> >> > +dependency but it seems to me a very common use case
> >> > >> >> > +when we are working on multiple local crates that are not
> >> > >> >> > +aimed to be published on public registry.
> >> > >> >> > +
> >> > >> >> > +Long story short, this patch add a modified Cargo.toml
> >> > >> >> > +to use the zvariant_derive dependency from crates.io instea=
d
> >> > >> >> > +of zbus local one and a pre generated Cargo.lock in order
> >> > >> >> > +to make cargo patch process inside cargo_common.bbclass wor=
k
> >> > >> >> > +
> >> > >> >> > +Upstream-Status: Inappropriate
> >> > >> >> > +Signed-off-by: Frederic Martinsons <
> frederic.martinsons@gmail.com>
> >> > >> >> > +---
> >> > >> >> > + zvariant/Cargo.lock | 1198
> +++++++++++++++++++++++++++++++++++++++++++
> >> > >> >> > + zvariant/Cargo.toml |    2 +-
> >> > >> >> > + 2 files changed, 1199 insertions(+), 1 deletion(-)
> >> > >> >> > + create mode 100644 zvariant/Cargo.lock
> >> > >> >> > +
> >> > >> >> > +diff --git a/zvariant/Cargo.lock b/zvariant/Cargo.lock
> >> > >> >> > +new file mode 100644
> >> > >> >> > +index 00000000..02a83d42
> >> > >> >> > +--- /dev/null
> >> > >> >> > ++++ b/zvariant/Cargo.lock
> >> > >> >> > +@@ -0,0 +1,1198 @@
> >> > >> >> > ++# This file is automatically @generated by Cargo.
> >> > >> >> > ++# It is not intended for manual editing.
> >> > >> >> > ++version =3D 3
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "anes"
> >> > >> >> > ++version =3D "0.1.6"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "anyhow"
> >> > >> >> > ++version =3D "1.0.70"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302df237e4"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "arrayvec"
> >> > >> >> > ++version =3D "0.7.2"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "serde",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "atty"
> >> > >> >> > ++version =3D "0.2.14"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "hermit-abi 0.1.19",
> >> > >> >> > ++ "libc",
> >> > >> >> > ++ "winapi",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "autocfg"
> >> > >> >> > ++version =3D "1.1.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "bitflags"
> >> > >> >> > ++version =3D "1.3.2"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "bumpalo"
> >> > >> >> > ++version =3D "3.12.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "0d261e256854913907f67ed06efbc3338dfe6179796deefc1ff763fc1aee5535"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "byteorder"
> >> > >> >> > ++version =3D "1.4.3"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "cast"
> >> > >> >> > ++version =3D "0.3.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "cfg-if"
> >> > >> >> > ++version =3D "1.0.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "chrono"
> >> > >> >> > ++version =3D "0.4.24"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "4e3c5919066adf22df73762e50cffcde3a758f2a848b113b586d1f86728b673b"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "num-integer",
> >> > >> >> > ++ "num-traits",
> >> > >> >> > ++ "serde",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "ciborium"
> >> > >> >> > ++version =3D "0.2.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "b0c137568cc60b904a7724001b35ce2630fd00d5d84805fbb608ab89509d788f"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "ciborium-io",
> >> > >> >> > ++ "ciborium-ll",
> >> > >> >> > ++ "serde",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "ciborium-io"
> >> > >> >> > ++version =3D "0.2.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "346de753af073cc87b52b2083a506b38ac176a44cfb05497b622e27be899b369"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "ciborium-ll"
> >> > >> >> > ++version =3D "0.2.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "213030a2b5a4e0c0892b6652260cf6ccac84827b83a85a534e178e3906c4cf1b"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "ciborium-io",
> >> > >> >> > ++ "half",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "clap"
> >> > >> >> > ++version =3D "3.2.23"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f7023ad47c144e4e473a5"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "bitflags",
> >> > >> >> > ++ "clap_lex",
> >> > >> >> > ++ "indexmap",
> >> > >> >> > ++ "textwrap",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "clap_lex"
> >> > >> >> > ++version =3D "0.2.4"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "os_str_bytes",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "criterion"
> >> > >> >> > ++version =3D "0.4.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "e7c76e09c1aae2bc52b3d2f29e13c6572553b30c4aa1b8a49fd70de6412654cb"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "anes",
> >> > >> >> > ++ "atty",
> >> > >> >> > ++ "cast",
> >> > >> >> > ++ "ciborium",
> >> > >> >> > ++ "clap",
> >> > >> >> > ++ "criterion-plot",
> >> > >> >> > ++ "itertools 0.10.5",
> >> > >> >> > ++ "lazy_static",
> >> > >> >> > ++ "num-traits",
> >> > >> >> > ++ "oorandom",
> >> > >> >> > ++ "plotters",
> >> > >> >> > ++ "rayon",
> >> > >> >> > ++ "regex",
> >> > >> >> > ++ "serde",
> >> > >> >> > ++ "serde_derive",
> >> > >> >> > ++ "serde_json",
> >> > >> >> > ++ "tinytemplate",
> >> > >> >> > ++ "walkdir",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "criterion-plot"
> >> > >> >> > ++version =3D "0.5.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "6b50826342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c673706b1"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "cast",
> >> > >> >> > ++ "itertools 0.10.5",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "crossbeam-channel"
> >> > >> >> > ++version =3D "0.5.7"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "cf2b3e8478797446514c91ef04bafcb59faba183e621ad488df88983cc14128c"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "cfg-if",
> >> > >> >> > ++ "crossbeam-utils",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "crossbeam-deque"
> >> > >> >> > ++version =3D "0.8.3"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "cfg-if",
> >> > >> >> > ++ "crossbeam-epoch",
> >> > >> >> > ++ "crossbeam-utils",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "crossbeam-epoch"
> >> > >> >> > ++version =3D "0.9.14"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "46bd5f3f85273295a9d14aedfb86f6aadbff6d8f5295c4a9edb08e819dcf5695"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "autocfg",
> >> > >> >> > ++ "cfg-if",
> >> > >> >> > ++ "crossbeam-utils",
> >> > >> >> > ++ "memoffset",
> >> > >> >> > ++ "scopeguard",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "crossbeam-utils"
> >> > >> >> > ++version =3D "0.8.15"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "3c063cd8cc95f5c377ed0d4b49a4b21f632396ff690e8470c29b3359b346984b"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "cfg-if",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "either"
> >> > >> >> > ++version =3D "1.8.1"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "enumflags2"
> >> > >> >> > ++version =3D "0.7.5"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "e75d4cd21b95383444831539909fbb14b9dc3fdceb2a6f5d36577329a1f55ccb"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "enumflags2_derive",
> >> > >> >> > ++ "serde",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "enumflags2_derive"
> >> > >> >> > ++version =3D "0.7.4"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "f58dc3c5e468259f19f2d46304a6b28f1c3d034442e14b322d2b850e36f6d5ae"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 1.0.109",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "form_urlencoded"
> >> > >> >> > ++version =3D "1.1.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "a9c384f161156f5260c24a097c56119f9be8c798586aecc13afbcbe7b7e26bf8"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "percent-encoding",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "futures-channel"
> >> > >> >> > ++version =3D "0.3.27"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "164713a5a0dcc3e7b4b1ed7d3b433cabc18025386f9339346e8daf15963cf7ac"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "futures-core",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "futures-core"
> >> > >> >> > ++version =3D "0.3.27"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "86d7a0c1aa76363dac491de0ee99faf6941128376f1cf96f07db7603b7de69dd"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "futures-executor"
> >> > >> >> > ++version =3D "0.3.27"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "1997dd9df74cdac935c76252744c1ed5794fac083242ea4fe77ef3ed60ba0f83"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "futures-core",
> >> > >> >> > ++ "futures-task",
> >> > >> >> > ++ "futures-util",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "futures-macro"
> >> > >> >> > ++version =3D "0.3.27"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "3eb14ed937631bd8b8b8977f2c198443447a8355b6e3ca599f38c975e5a963b6"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 1.0.109",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "futures-task"
> >> > >> >> > ++version =3D "0.3.27"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "fd65540d33b37b16542a0438c12e6aeead10d4ac5d05bd3f805b8f35ab592879"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "futures-util"
> >> > >> >> > ++version =3D "0.3.27"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "3ef6b17e481503ec85211fed8f39d1970f128935ca1f814cd32ac4a6842e84ab"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "futures-core",
> >> > >> >> > ++ "futures-macro",
> >> > >> >> > ++ "futures-task",
> >> > >> >> > ++ "pin-project-lite",
> >> > >> >> > ++ "pin-utils",
> >> > >> >> > ++ "slab",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "getrandom"
> >> > >> >> > ++version =3D "0.2.8"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "cfg-if",
> >> > >> >> > ++ "libc",
> >> > >> >> > ++ "wasi",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "glib"
> >> > >> >> > ++version =3D "0.10.0"
> >> > >> >> > ++source =3D "git+
> https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0#c9ee583cea07830c099cdccc=
d33eda9ef705ea93
> "
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "bitflags",
> >> > >> >> > ++ "futures-channel",
> >> > >> >> > ++ "futures-core",
> >> > >> >> > ++ "futures-executor",
> >> > >> >> > ++ "futures-task",
> >> > >> >> > ++ "futures-util",
> >> > >> >> > ++ "glib-macros",
> >> > >> >> > ++ "glib-sys",
> >> > >> >> > ++ "gobject-sys",
> >> > >> >> > ++ "libc",
> >> > >> >> > ++ "once_cell",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "glib-macros"
> >> > >> >> > ++version =3D "0.10.0"
> >> > >> >> > ++source =3D "git+
> https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0#c9ee583cea07830c099cdccc=
d33eda9ef705ea93
> "
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "anyhow",
> >> > >> >> > ++ "heck",
> >> > >> >> > ++ "itertools 0.9.0",
> >> > >> >> > ++ "proc-macro-crate 0.1.5",
> >> > >> >> > ++ "proc-macro-error",
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 1.0.109",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "glib-sys"
> >> > >> >> > ++version =3D "0.10.0"
> >> > >> >> > ++source =3D "git+
> https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "libc",
> >> > >> >> > ++ "system-deps",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "gobject-sys"
> >> > >> >> > ++version =3D "0.10.0"
> >> > >> >> > ++source =3D "git+
> https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "glib-sys",
> >> > >> >> > ++ "libc",
> >> > >> >> > ++ "system-deps",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "half"
> >> > >> >> > ++version =3D "1.8.2"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "eabb4a44450da02c90444cf74558da904edde8fb4e9035a9a6a4e15445af0bd7"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "hashbrown"
> >> > >> >> > ++version =3D "0.12.3"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "heck"
> >> > >> >> > ++version =3D "0.3.3"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa6c65c904e9e132c"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "unicode-segmentation",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "hermit-abi"
> >> > >> >> > ++version =3D "0.1.19"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "libc",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "hermit-abi"
> >> > >> >> > ++version =3D "0.2.6"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "libc",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "idna"
> >> > >> >> > ++version =3D "0.3.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d657209e6"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "unicode-bidi",
> >> > >> >> > ++ "unicode-normalization",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "indexmap"
> >> > >> >> > ++version =3D "1.9.2"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c3293e98c5ba0c8b399"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "autocfg",
> >> > >> >> > ++ "hashbrown",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "itertools"
> >> > >> >> > ++version =3D "0.9.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "either",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "itertools"
> >> > >> >> > ++version =3D "0.10.5"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "either",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "itoa"
> >> > >> >> > ++version =3D "1.0.6"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "js-sys"
> >> > >> >> > ++version =3D "0.3.61"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "445dde2150c55e483f3d8416706b97ec8e8237c307e5b7b4b8dd15e6af2a0730"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "wasm-bindgen",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "lazy_static"
> >> > >> >> > ++version =3D "1.4.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "libc"
> >> > >> >> > ++version =3D "0.2.140"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f80c"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "log"
> >> > >> >> > ++version =3D "0.4.17"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "cfg-if",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "memchr"
> >> > >> >> > ++version =3D "2.5.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "memoffset"
> >> > >> >> > ++version =3D "0.8.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "autocfg",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "num-integer"
> >> > >> >> > ++version =3D "0.1.45"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "autocfg",
> >> > >> >> > ++ "num-traits",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "num-traits"
> >> > >> >> > ++version =3D "0.2.15"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "autocfg",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "num_cpus"
> >> > >> >> > ++version =3D "1.15.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "hermit-abi 0.2.6",
> >> > >> >> > ++ "libc",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "once_cell"
> >> > >> >> > ++version =3D "1.17.1"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "oorandom"
> >> > >> >> > ++version =3D "11.1.3"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b63caa84da26b575"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "os_str_bytes"
> >> > >> >> > ++version =3D "6.5.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb3e514fa4238e267"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "percent-encoding"
> >> > >> >> > ++version =3D "2.2.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "478c572c3d73181ff3c2539045f6eb99e5491218eae919370993b890cdbdd98e"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "pin-project-lite"
> >> > >> >> > ++version =3D "0.2.9"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "pin-utils"
> >> > >> >> > ++version =3D "0.1.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "pkg-config"
> >> > >> >> > ++version =3D "0.3.26"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "plotters"
> >> > >> >> > ++version =3D "0.3.4"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "2538b639e642295546c50fcd545198c9d64ee2a38620a628724a3b266d5fbf97"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "num-traits",
> >> > >> >> > ++ "plotters-backend",
> >> > >> >> > ++ "plotters-svg",
> >> > >> >> > ++ "wasm-bindgen",
> >> > >> >> > ++ "web-sys",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "plotters-backend"
> >> > >> >> > ++version =3D "0.3.4"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "193228616381fecdc1224c62e96946dfbc73ff4384fba576e052ff8c1bea8142"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "plotters-svg"
> >> > >> >> > ++version =3D "0.3.3"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "f9a81d2759aae1dae668f783c308bc5c8ebd191ff4184aaa1b37f65a6ae5a56f"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "plotters-backend",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "ppv-lite86"
> >> > >> >> > ++version =3D "0.2.17"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "proc-macro-crate"
> >> > >> >> > ++version =3D "0.1.5"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "1d6ea3c4595b96363c13943497db34af4460fb474a95c43f4446ad341b8c9785"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "toml",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "proc-macro-crate"
> >> > >> >> > ++version =3D "1.3.1"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "once_cell",
> >> > >> >> > ++ "toml_edit",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "proc-macro-error"
> >> > >> >> > ++version =3D "1.0.4"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro-error-attr",
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 1.0.109",
> >> > >> >> > ++ "version_check",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "proc-macro-error-attr"
> >> > >> >> > ++version =3D "1.0.4"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "version_check",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "proc-macro2"
> >> > >> >> > ++version =3D "1.0.53"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "ba466839c78239c09faf015484e5cc04860f88242cff4d03eb038f04b4699b73"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "unicode-ident",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "quote"
> >> > >> >> > ++version =3D "1.0.26"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "rand"
> >> > >> >> > ++version =3D "0.8.5"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "libc",
> >> > >> >> > ++ "rand_chacha",
> >> > >> >> > ++ "rand_core",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "rand_chacha"
> >> > >> >> > ++version =3D "0.3.1"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "ppv-lite86",
> >> > >> >> > ++ "rand_core",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "rand_core"
> >> > >> >> > ++version =3D "0.6.4"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "getrandom",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "rayon"
> >> > >> >> > ++version =3D "1.7.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "1d2df5196e37bcc87abebc0053e20787d73847bb33134a69841207dd0a47f03b"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "either",
> >> > >> >> > ++ "rayon-core",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "rayon-core"
> >> > >> >> > ++version =3D "1.11.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "4b8f95bd6966f5c87776639160a66bd8ab9895d9d4ab01ddba9fc60661aebe8d"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "crossbeam-channel",
> >> > >> >> > ++ "crossbeam-deque",
> >> > >> >> > ++ "crossbeam-utils",
> >> > >> >> > ++ "num_cpus",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "regex"
> >> > >> >> > ++version =3D "1.7.2"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "cce168fea28d3e05f158bda4576cf0c844d5045bc2cc3620fa0292ed5bb5814c"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "regex-syntax",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "regex-syntax"
> >> > >> >> > ++version =3D "0.6.29"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "ryu"
> >> > >> >> > ++version =3D "1.0.13"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "same-file"
> >> > >> >> > ++version =3D "1.0.6"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "winapi-util",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "scopeguard"
> >> > >> >> > ++version =3D "1.1.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "serde"
> >> > >> >> > ++version =3D "1.0.158"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "771d4d9c4163ee138805e12c710dd365e4f44be8be0503cb1bb9eb989425d9c9"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "serde_derive",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "serde_bytes"
> >> > >> >> > ++version =3D "0.11.9"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "416bda436f9aab92e02c8e10d49a15ddd339cea90b6e340fe51ed97abb548294"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "serde",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "serde_derive"
> >> > >> >> > ++version =3D "1.0.158"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "e801c1712f48475582b7696ac71e0ca34ebb30e09338425384269d9717c62cad"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 2.0.8",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "serde_json"
> >> > >> >> > ++version =3D "1.0.94"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "1c533a59c9d8a93a09c6ab31f0fd5e5f4dd1b8fc9434804029839884765d04ea"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "itoa",
> >> > >> >> > ++ "ryu",
> >> > >> >> > ++ "serde",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "serde_repr"
> >> > >> >> > ++version =3D "0.1.12"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "bcec881020c684085e55a25f7fd888954d56609ef363479dc5a1305eb0d40cab"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 2.0.8",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "slab"
> >> > >> >> > ++version =3D "0.4.8"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "autocfg",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "static_assertions"
> >> > >> >> > ++version =3D "1.1.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "strum"
> >> > >> >> > ++version =3D "0.18.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "57bd81eb48f4c437cadc685403cad539345bf703d78e63707418431cecd4522b"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "strum_macros"
> >> > >> >> > ++version =3D "0.18.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "87c85aa3f8ea653bfd3ddf25f7ee357ee4d204731f6aa9ad04002306f6e2774c"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "heck",
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 1.0.109",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "syn"
> >> > >> >> > ++version =3D "1.0.109"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "unicode-ident",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "syn"
> >> > >> >> > ++version =3D "2.0.8"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "bcc02725fd69ab9f26eab07fad303e2497fad6fb9eba4f96c4d1687bdf704ad9"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "unicode-ident",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "system-deps"
> >> > >> >> > ++version =3D "1.3.2"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "0f3ecc17269a19353b3558b313bba738b25d82993e30d62a18406a24aba4649b"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "heck",
> >> > >> >> > ++ "pkg-config",
> >> > >> >> > ++ "strum",
> >> > >> >> > ++ "strum_macros",
> >> > >> >> > ++ "thiserror",
> >> > >> >> > ++ "toml",
> >> > >> >> > ++ "version-compare",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "textwrap"
> >> > >> >> > ++version =3D "0.16.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "thiserror"
> >> > >> >> > ++version =3D "1.0.40"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "thiserror-impl",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "thiserror-impl"
> >> > >> >> > ++version =3D "1.0.40"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 2.0.8",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "time"
> >> > >> >> > ++version =3D "0.3.20"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b92017ebdf4999a5890"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "serde",
> >> > >> >> > ++ "time-core",
> >> > >> >> > ++ "time-macros",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "time-core"
> >> > >> >> > ++version =3D "0.1.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "time-macros"
> >> > >> >> > ++version =3D "0.2.8"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "fd80a657e71da814b8e5d60d3374fc6d35045062245d80224748ae522dd76f36"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "time-core",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "tinytemplate"
> >> > >> >> > ++version =3D "1.2.1"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "serde",
> >> > >> >> > ++ "serde_json",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "tinyvec"
> >> > >> >> > ++version =3D "1.6.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "tinyvec_macros",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "tinyvec_macros"
> >> > >> >> > ++version =3D "0.1.1"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "toml"
> >> > >> >> > ++version =3D "0.5.11"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "serde",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "toml_datetime"
> >> > >> >> > ++version =3D "0.6.1"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "3ab8ed2edee10b50132aed5f331333428b011c99402b5a534154ed15746f9622"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "toml_edit"
> >> > >> >> > ++version =3D "0.19.8"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "239410c8609e8125456927e6707163a3b1fdb40561e4b803bc041f466ccfdc13"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "indexmap",
> >> > >> >> > ++ "toml_datetime",
> >> > >> >> > ++ "winnow",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "unicode-bidi"
> >> > >> >> > ++version =3D "0.3.13"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "unicode-ident"
> >> > >> >> > ++version =3D "1.0.8"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "unicode-normalization"
> >> > >> >> > ++version =3D "0.1.22"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "tinyvec",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "unicode-segmentation"
> >> > >> >> > ++version =3D "1.10.1"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "1dd624098567895118886609431a7c3b8f516e41d30e0643f03d94592a147e36"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "url"
> >> > >> >> > ++version =3D "2.3.1"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb51c09f22b83c4643"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "form_urlencoded",
> >> > >> >> > ++ "idna",
> >> > >> >> > ++ "percent-encoding",
> >> > >> >> > ++ "serde",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "uuid"
> >> > >> >> > ++version =3D "1.3.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "1674845326ee10d37ca60470760d4288a6f80f304007d92e5c53bab78c9cfd79"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "serde",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "version-compare"
> >> > >> >> > ++version =3D "0.0.10"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "d63556a25bae6ea31b52e640d7c41d1ab27faba4ccb600013837a3d0b3994ca1"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "version_check"
> >> > >> >> > ++version =3D "0.9.4"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "walkdir"
> >> > >> >> > ++version =3D "2.3.3"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "36df944cda56c7d8d8b7496af378e6b16de9284591917d307c9b4d313c44e698"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "same-file",
> >> > >> >> > ++ "winapi-util",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "wasi"
> >> > >> >> > ++version =3D "0.11.0+wasi-snapshot-preview1"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "wasm-bindgen"
> >> > >> >> > ++version =3D "0.2.84"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d33594b3df58b2007ca53b"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "cfg-if",
> >> > >> >> > ++ "wasm-bindgen-macro",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "wasm-bindgen-backend"
> >> > >> >> > ++version =3D "0.2.84"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "95ce90fd5bcc06af55a641a86428ee4229e44e07033963a2290a8e241607ccb9"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "bumpalo",
> >> > >> >> > ++ "log",
> >> > >> >> > ++ "once_cell",
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 1.0.109",
> >> > >> >> > ++ "wasm-bindgen-shared",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "wasm-bindgen-macro"
> >> > >> >> > ++version =3D "0.2.84"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "4c21f77c0bedc37fd5dc21f897894a5ca01e7bb159884559461862ae90c0b4c5"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "wasm-bindgen-macro-support",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "wasm-bindgen-macro-support"
> >> > >> >> > ++version =3D "0.2.84"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4e32d823066102f35a5f6"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 1.0.109",
> >> > >> >> > ++ "wasm-bindgen-backend",
> >> > >> >> > ++ "wasm-bindgen-shared",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "wasm-bindgen-shared"
> >> > >> >> > ++version =3D "0.2.84"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "0046fef7e28c3804e5e38bfa31ea2a0f73905319b677e57ebe37e49358989b5d"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "web-sys"
> >> > >> >> > ++version =3D "0.3.61"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "e33b99f4b23ba3eec1a53ac264e35a755f00e966e0065077d6027c0f575b0b97"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "js-sys",
> >> > >> >> > ++ "wasm-bindgen",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "winapi"
> >> > >> >> > ++version =3D "0.3.9"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "winapi-i686-pc-windows-gnu",
> >> > >> >> > ++ "winapi-x86_64-pc-windows-gnu",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "winapi-i686-pc-windows-gnu"
> >> > >> >> > ++version =3D "0.4.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "winapi-util"
> >> > >> >> > ++version =3D "0.1.5"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "winapi",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "winapi-x86_64-pc-windows-gnu"
> >> > >> >> > ++version =3D "0.4.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "winnow"
> >> > >> >> > ++version =3D "0.4.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "deac0939bd6e4f24ab5919fbf751c97a8cfc8543bb083a305ed5c0c10bb241d1"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "memchr",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "zvariant"
> >> > >> >> > ++version =3D "3.12.0"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "arrayvec",
> >> > >> >> > ++ "byteorder",
> >> > >> >> > ++ "chrono",
> >> > >> >> > ++ "criterion",
> >> > >> >> > ++ "enumflags2",
> >> > >> >> > ++ "glib",
> >> > >> >> > ++ "libc",
> >> > >> >> > ++ "rand",
> >> > >> >> > ++ "serde",
> >> > >> >> > ++ "serde_bytes",
> >> > >> >> > ++ "serde_json",
> >> > >> >> > ++ "serde_repr",
> >> > >> >> > ++ "static_assertions",
> >> > >> >> > ++ "time",
> >> > >> >> > ++ "url",
> >> > >> >> > ++ "uuid",
> >> > >> >> > ++ "zvariant_derive",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "zvariant_derive"
> >> > >> >> > ++version =3D "3.12.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "34c20260af4b28b3275d6676c7e2a6be0d4332e8e0aba4616d34007fd84e462a"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro-crate 1.3.1",
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 1.0.109",
> >> > >> >> > ++ "zvariant_utils",
> >> > >> >> > ++]
> >> > >> >> > ++
> >> > >> >> > ++[[package]]
> >> > >> >> > ++name =3D "zvariant_utils"
> >> > >> >> > ++version =3D "1.0.0"
> >> > >> >> > ++source =3D "registry+
> https://github.com/rust-lang/crates.io-index"
> >> > >> >> > ++checksum =3D
> "53b22993dbc4d128a17a3b6c92f1c63872dd67198537ee728d8b5d7c40640a8b"
> >> > >> >> > ++dependencies =3D [
> >> > >> >> > ++ "proc-macro2",
> >> > >> >> > ++ "quote",
> >> > >> >> > ++ "syn 1.0.109",
> >> > >> >> > ++]
> >> > >> >> > +diff --git a/zvariant/Cargo.toml b/zvariant/Cargo.toml
> >> > >> >> > +index 45367729..6981862a 100644
> >> > >> >> > +--- a/zvariant/Cargo.toml
> >> > >> >> > ++++ b/zvariant/Cargo.toml
> >> > >> >> > +@@ -27,7 +27,7 @@ byteorder =3D "1.4.3"
> >> > >> >> > + serde =3D { version =3D "1.0", features =3D ["derive"] }
> >> > >> >> > + arrayvec =3D { version =3D "0.7.2", features =3D ["serde"]=
,
> optional =3D true }
> >> > >> >> > + enumflags2 =3D { version =3D "0.7.5", features =3D ["serde=
"],
> optional =3D true }
> >> > >> >> > +-zvariant_derive =3D { version =3D "=3D3.12.0", path =3D
> "../zvariant_derive" }
> >> > >> >> > ++zvariant_derive =3D "3.12.0"
> >> > >> >> > + serde_bytes =3D { version =3D "0.11", optional =3D true }
> >> > >> >> > + static_assertions =3D "1.1.0"
> >> > >> >> > + libc =3D "0.2.137"
> >> > >> >> > +2.34.1
> >> > >> >> > +
> >> > >> >> > diff --git a/meta/recipes-extended/rust-example/
> zvariant_3.12.0.bb b/meta/recipes-extended/rust-example/zvariant_3.12.0.b=
b
> >> > >> >> > new file mode 100644
> >> > >> >> > index 0000000000..ab769b3fce
> >> > >> >> > --- /dev/null
> >> > >> >> > +++ b/meta/recipes-extended/rust-example/zvariant_3.12.0.bb
> >> > >> >> > @@ -0,0 +1,20 @@
> >> > >> >> > +SUMMARY =3D "Provides API for encoding/decoding of data
> to/from D-Bus wire format"
> >> > >> >> > +DESCRIPTION =3D "This crate provides API for encoding/decod=
ing
> of data to/from D-Bus wire format.\
> >> > >> >> > +This binary wire format is simple and very efficient and
> hence useful outside of D-Bus context as well.\
> >> > >> >> > +A modified form of this format, GVariant is very commonly
> used for efficient storage of arbitrary \
> >> > >> >> > +data and is also supported by this crate."
> >> > >> >> > +HOMEPAGE =3D "https://gitlab.freedesktop.org/dbus/zbus/"
> >> > >> >> > +LICENSE =3D "MIT"
> >> > >> >> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Db377b220f43d747efdec40d69fcaa69d"
> >> > >> >> > +
> >> > >> >> > +SRC_URI =3D " \
> >> > >> >> > +    git://
> gitlab.freedesktop.org/dbus/zbus;protocol=3Dhttps;branch=3Dmain;subpath=
=3Dzvariant
> \
> >> > >> >> > +
> file://0001-Tweak-zvariant-cargo-config.patch;striplevel=3D2 \
> >> > >> >> > +"
> >> > >> >> > +
> >> > >> >> > +SRCREV =3D "07506776fab5f58e029760bb4b288f670c7eecd6"
> >> > >> >> > +S =3D "${WORKDIR}/zvariant"
> >> > >> >> > +
> >> > >> >> > +inherit cargo cargo-update-recipe-crates
> >> > >> >> > +
> >> > >> >> > +require ${BPN}-crates.inc
> >> > >> >> > --
> >> > >> >> > 2.34.1
> >> > >> >> >
> >> > >> >> >
> >> > >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > >> >> > Links: You receive all messages sent to this group.
> >> > >> >> > View/Reply Online (#179092):
> https://lists.openembedded.org/g/openembedded-core/message/179092
> >> > >> >> > Mute This Topic:
> https://lists.openembedded.org/mt/97840364/1686489
> >> > >> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > >> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> >> > >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > >> >> >
> >>
> >>
> >>
> >> --
> >> Alex Kiernan
>
>
>
> --
> Alex Kiernan
>

--000000000000b6e09105f7dddd2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">True, no rust project will ever DEPENDS on the zvariant re=
cipe and as you said<div>will simply list zvariant as a crate.</div><div>My=
 main concern with the example was to address this comment:=C2=A0<a href=3D=
"https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.10=
212-2-alex.kiernan@gmail.com/#6450">https://patchwork.yoctoproject.org/proj=
ect/oe-core/patch/20221030173815.10212-2-alex.kiernan@gmail.com/#6450</a></=
div><div><br></div><div>So , do you think it&#39;s still worth providing su=
ch an example ? and if yes, can I place it</div><div>in meta-openembedded/m=
eta-oe/recipes-extended/ ?</div><div><br></div><div><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 27 Ma=
r 2023 at 10:42, Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com"=
>alex.kiernan@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">I think modelling meta-rust on meta-python is wrong =
- rust doesn&#39;t<br>
package crates, they get consumed into the main recipe (which I&#39;ve<br>
just realised means I think we have some work on licensing to do).<br>
<br>
For this example, I think it&#39;s just a regular recipe which should sit<b=
r>
alongside other recipes in meta-oe; anyone who wants to consume<br>
zvariant is going to list it as part of their Cargo.toml, not DEPEND<br>
on this recipe.<br>
<br>
I guess I&#39;m really arguing that meta-rust is purely a legacy thing at<b=
r>
this point (one which I continue to need and maintain a fork of!).<br>
<br>
On Mon, Mar 27, 2023 at 9:30=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; There is a stalled merge request for this clean: <a href=3D"https://gi=
thub.com/meta-rust/meta-rust/pull/364" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/meta-rust/meta-rust/pull/364</a><br>
&gt;<br>
&gt; But I think Alex is right, all needed things for rust/cargo projects s=
eem to be already in oe-core except<br>
&gt; for examples of recipes.<br>
&gt;<br>
&gt; What about adding meta-rust in meta-openembedded which will contains t=
he example, something like<br>
&gt;<br>
&gt; meta-rust/<br>
&gt; =E2=94=9C=E2=94=80=E2=94=80 conf<br>
&gt; =E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 layer.conf<br>
&gt; =E2=94=9C=E2=94=80=E2=94=80 COPYING.MIT<br>
&gt; =E2=94=9C=E2=94=80=E2=94=80 README<br>
&gt; =E2=94=94=E2=94=80=E2=94=80 recipes-extended<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 zvariant<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 0=
001-Tweak-zvariant-cargo-config.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 <a href=3D"http://zvari=
ant_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">zvariant_3.12.0.bb</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 zvariant-crates.inc<br>
&gt;<br>
&gt;<br>
&gt; On Mon, 27 Mar 2023 at 10:19, Alex Kiernan &lt;<a href=3D"mailto:alex.=
kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; If you&#39;re on master I don&#39;t think there&#39;s anything use=
ful in meta-rust<br>
&gt;&gt; - its providing toolchains for older branches.<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Mar 27, 2023 at 7:40=E2=80=AFAM Alexander Kanavin<br>
&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; You could meanwhile review meta-rust, and see what is useful =
and what<br>
&gt;&gt; &gt; is obsolete perhaps? I see it still carries toolchain recipes=
 for<br>
&gt;&gt; &gt; example, I have no idea why.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Alex<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, 27 Mar 2023 at 06:09, Fr=C3=A9d=C3=A9ric Martinsons<b=
r>
&gt;&gt; &gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=
=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Ok, should I work on this cleaning of meta-rust and merg=
ing in meta-oe ? or should I wait for other opinions ?<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; On Sun, 26 Mar 2023 at 18:55, Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; rust-hello-world is installed into test images, and =
has a runtime test<br>
&gt;&gt; &gt; &gt;&gt; to verify that the toolchain produces working binari=
es:<br>
&gt;&gt; &gt; &gt;&gt; meta/lib/oeqa/runtime/cases/rust.py<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I thought meta-rust could be cleaned up, and added t=
o meta-oe perhaps?<br>
&gt;&gt; &gt; &gt;&gt; Same as meta-perl/meta-python.<br>
&gt;&gt; &gt; &gt;&gt; <a href=3D"https://github.com/meta-rust/meta-rust" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/meta-rust/meta-rust<=
/a><br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Alex<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; On Sat, 25 Mar 2023 at 21:43, Fr=C3=A9d=C3=A9ric Mar=
tinsons<br>
&gt;&gt; &gt; &gt;&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com"=
 target=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; I thought that would be treated the same as <a =
href=3D"http://rust-hello-world_git.bb" rel=3D"noreferrer" target=3D"_blank=
">rust-hello-world_git.bb</a> which is in oe-core.<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Anyway, I don&#39;t mind placing it elsewhere, =
which layer do you think this recipe would land?<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Le sam. 25 mars 2023, 19:52, Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; I don&#39;t think this should be going in o=
e-core, as it&#39;s not actually<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; used by anything, or in any automated tests=
. But you can place it in a<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; separate layer.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; Alex<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; On Sat, 25 Mar 2023 at 10:01, Frederic Mart=
insons<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:frederic.martinsons@g=
mail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; From: Frederic Martinsons &lt;<a href=
=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">frederic.martin=
sons@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; This recipe is for showing an &quot;re=
al world&quot; example of<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; a crate that depends on some git repos=
itories.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Usually, this kind of crate is built w=
ithin a global<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; workspace (here it is the zbus project=
) and so<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; doesn&#39;t need a Cargo.lock on its o=
wn.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; For the sake of the demonstration, I h=
ad to add<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; a patch for probiding a Cargo.lock and=
 modifying<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; zvariant_deriver to get it from <a hre=
f=3D"http://crates.io" rel=3D"noreferrer" target=3D"_blank">crates.io</a> i=
nstead<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; of pulling locally with a relative pat=
h<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; The use case where the crate had some =
git repository<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; in dependency is very common for &quot=
;private&quot; crate that<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; are not aimed to be published on <a hr=
ef=3D"http://crate.io" rel=3D"noreferrer" target=3D"_blank">crate.io</a>.<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; When the project grow bigger, it is co=
mmon to have<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; a bin and multiple lib developped in p=
arallel, and these<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; libs are surely on a git repostitory.<=
br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Hence the need of this support in oe-c=
ore.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Signed-off-by: Frederic Martinsons &lt=
;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">frederi=
c.martinsons@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../rust-example/zvariant-crates=
.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 140 ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../0001-Tweak-zvariant-cargo-co=
nfig.patch=C2=A0 =C2=A0 | 1249 +++++++++++++++++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../rust-example/<a href=3D"http=
://zvariant_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">zvariant_3.12.0=
.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 3 files changed, 1409 insertions=
(+)<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-=
extended/rust-example/zvariant-crates.inc<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-=
extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-config.patch<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-=
extended/rust-example/<a href=3D"http://zvariant_3.12.0.bb" rel=3D"noreferr=
er" target=3D"_blank">zvariant_3.12.0.bb</a><br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; diff --git a/meta/recipes-extended/rus=
t-example/zvariant-crates.inc b/meta/recipes-extended/rust-example/zvariant=
-crates.inc<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; index 0000000000..297a784661<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +++ b/meta/recipes-extended/rust-examp=
le/zvariant-crates.inc<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; @@ -0,0 +1,140 @@<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +SRC_URI +=3D &quot; \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/anes/0.1.6" rel=3D"noreferrer" target=3D"_blank">crates.io/ane=
s/0.1.6</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/anyhow/1.0.70" rel=3D"noreferrer" target=3D"_blank">crates.io/=
anyhow/1.0.70</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/arrayvec/0.7.2" rel=3D"noreferrer" target=3D"_blank">crates.io=
/arrayvec/0.7.2</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/atty/0.2.14" rel=3D"noreferrer" target=3D"_blank">crates.io/at=
ty/0.2.14</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/autocfg/1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/=
autocfg/1.1.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/bitflags/1.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io=
/bitflags/1.3.2</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/bumpalo/3.12.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/bumpalo/3.12.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/byteorder/1.4.3" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/byteorder/1.4.3</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/cast/0.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/cas=
t/0.3.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/cfg-if/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/c=
fg-if/1.0.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/chrono/0.4.24" rel=3D"noreferrer" target=3D"_blank">crates.io/=
chrono/0.4.24</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/ciborium-io/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates=
.io/ciborium-io/0.2.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/ciborium-ll/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates=
.io/ciborium-ll/0.2.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/ciborium/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/ciborium/0.2.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/clap/3.2.23" rel=3D"noreferrer" target=3D"_blank">crates.io/cl=
ap/3.2.23</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/clap_lex/0.2.4" rel=3D"noreferrer" target=3D"_blank">crates.io=
/clap_lex/0.2.4</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/criterion-plot/0.5.0" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/criterion-plot/0.5.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/criterion/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/criterion/0.4.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/crossbeam-channel/0.5.7" rel=3D"noreferrer" target=3D"_blank">=
crates.io/crossbeam-channel/0.5.7</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/crossbeam-deque/0.8.3" rel=3D"noreferrer" target=3D"_blank">cr=
ates.io/crossbeam-deque/0.8.3</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/crossbeam-epoch/0.9.14" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/crossbeam-epoch/0.9.14</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/crossbeam-utils/0.8.15" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/crossbeam-utils/0.8.15</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/either/1.8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/e=
ither/1.8.1</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/enumflags2/0.7.5" rel=3D"noreferrer" target=3D"_blank">crates.=
io/enumflags2/0.7.5</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/enumflags2_derive/0.7.4" rel=3D"noreferrer" target=3D"_blank">=
crates.io/enumflags2_derive/0.7.4</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/form_urlencoded/1.1.0" rel=3D"noreferrer" target=3D"_blank">cr=
ates.io/form_urlencoded/1.1.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/futures-channel/0.3.27" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/futures-channel/0.3.27</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/futures-core/0.3.27" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/futures-core/0.3.27</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/futures-executor/0.3.27" rel=3D"noreferrer" target=3D"_blank">=
crates.io/futures-executor/0.3.27</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/futures-macro/0.3.27" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/futures-macro/0.3.27</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/futures-task/0.3.27" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/futures-task/0.3.27</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/futures-util/0.3.27" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/futures-util/0.3.27</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/getrandom/0.2.8" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/getrandom/0.2.8</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/half/1.8.2" rel=3D"noreferrer" target=3D"_blank">crates.io/hal=
f/1.8.2</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/hashbrown/0.12.3" rel=3D"noreferrer" target=3D"_blank">crates.=
io/hashbrown/0.12.3</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/heck/0.3.3" rel=3D"noreferrer" target=3D"_blank">crates.io/hec=
k/0.3.3</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/hermit-abi/0.1.19" rel=3D"noreferrer" target=3D"_blank">crates=
.io/hermit-abi/0.1.19</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/hermit-abi/0.2.6" rel=3D"noreferrer" target=3D"_blank">crates.=
io/hermit-abi/0.2.6</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/idna/0.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/idn=
a/0.3.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/indexmap/1.9.2" rel=3D"noreferrer" target=3D"_blank">crates.io=
/indexmap/1.9.2</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/itertools/0.10.5" rel=3D"noreferrer" target=3D"_blank">crates.=
io/itertools/0.10.5</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/itertools/0.9.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/itertools/0.9.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/itoa/1.0.6" rel=3D"noreferrer" target=3D"_blank">crates.io/ito=
a/1.0.6</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/js-sys/0.3.61" rel=3D"noreferrer" target=3D"_blank">crates.io/=
js-sys/0.3.61</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/lazy_static/1.4.0" rel=3D"noreferrer" target=3D"_blank">crates=
.io/lazy_static/1.4.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/libc/0.2.140" rel=3D"noreferrer" target=3D"_blank">crates.io/l=
ibc/0.2.140</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/log/0.4.17" rel=3D"noreferrer" target=3D"_blank">crates.io/log=
/0.4.17</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/memchr/2.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/m=
emchr/2.5.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/memoffset/0.8.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/memoffset/0.8.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/num-integer/0.1.45" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/num-integer/0.1.45</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/num-traits/0.2.15" rel=3D"noreferrer" target=3D"_blank">crates=
.io/num-traits/0.2.15</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/num_cpus/1.15.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/num_cpus/1.15.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/once_cell/1.17.1" rel=3D"noreferrer" target=3D"_blank">crates.=
io/once_cell/1.17.1</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/oorandom/11.1.3" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/oorandom/11.1.3</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/os_str_bytes/6.5.0" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/os_str_bytes/6.5.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/percent-encoding/2.2.0" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/percent-encoding/2.2.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/pin-project-lite/0.2.9" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/pin-project-lite/0.2.9</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/pin-utils/0.1.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/pin-utils/0.1.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/pkg-config/0.3.26" rel=3D"noreferrer" target=3D"_blank">crates=
.io/pkg-config/0.3.26</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/plotters-backend/0.3.4" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/plotters-backend/0.3.4</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/plotters-svg/0.3.3" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/plotters-svg/0.3.3</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/plotters/0.3.4" rel=3D"noreferrer" target=3D"_blank">crates.io=
/plotters/0.3.4</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/ppv-lite86/0.2.17" rel=3D"noreferrer" target=3D"_blank">crates=
.io/ppv-lite86/0.2.17</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/proc-macro-crate/0.1.5" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/proc-macro-crate/0.1.5</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/proc-macro-crate/1.3.1" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/proc-macro-crate/1.3.1</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/proc-macro-error-attr/1.0.4" rel=3D"noreferrer" target=3D"_bla=
nk">crates.io/proc-macro-error-attr/1.0.4</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/proc-macro-error/1.0.4" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/proc-macro-error/1.0.4</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/proc-macro2/1.0.53" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/proc-macro2/1.0.53</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/quote/1.0.26" rel=3D"noreferrer" target=3D"_blank">crates.io/q=
uote/1.0.26</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/rand/0.8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/ran=
d/0.8.5</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/rand_chacha/0.3.1" rel=3D"noreferrer" target=3D"_blank">crates=
.io/rand_chacha/0.3.1</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/rand_core/0.6.4" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/rand_core/0.6.4</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/rayon-core/1.11.0" rel=3D"noreferrer" target=3D"_blank">crates=
.io/rayon-core/1.11.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/rayon/1.7.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ra=
yon/1.7.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/regex-syntax/0.6.29" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/regex-syntax/0.6.29</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/regex/1.7.2" rel=3D"noreferrer" target=3D"_blank">crates.io/re=
gex/1.7.2</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/ryu/1.0.13" rel=3D"noreferrer" target=3D"_blank">crates.io/ryu=
/1.0.13</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/same-file/1.0.6" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/same-file/1.0.6</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/scopeguard/1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.=
io/scopeguard/1.1.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/serde/1.0.158" rel=3D"noreferrer" target=3D"_blank">crates.io/=
serde/1.0.158</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/serde_bytes/0.11.9" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/serde_bytes/0.11.9</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/serde_derive/1.0.158" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/serde_derive/1.0.158</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/serde_json/1.0.94" rel=3D"noreferrer" target=3D"_blank">crates=
.io/serde_json/1.0.94</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/serde_repr/0.1.12" rel=3D"noreferrer" target=3D"_blank">crates=
.io/serde_repr/0.1.12</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/slab/0.4.8" rel=3D"noreferrer" target=3D"_blank">crates.io/sla=
b/0.4.8</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/static_assertions/1.1.0" rel=3D"noreferrer" target=3D"_blank">=
crates.io/static_assertions/1.1.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/strum/0.18.0" rel=3D"noreferrer" target=3D"_blank">crates.io/s=
trum/0.18.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/strum_macros/0.18.0" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/strum_macros/0.18.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/syn/1.0.109" rel=3D"noreferrer" target=3D"_blank">crates.io/sy=
n/1.0.109</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/syn/2.0.8" rel=3D"noreferrer" target=3D"_blank">crates.io/syn/=
2.0.8</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/system-deps/1.3.2" rel=3D"noreferrer" target=3D"_blank">crates=
.io/system-deps/1.3.2</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/textwrap/0.16.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/textwrap/0.16.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/thiserror-impl/1.0.40" rel=3D"noreferrer" target=3D"_blank">cr=
ates.io/thiserror-impl/1.0.40</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/thiserror/1.0.40" rel=3D"noreferrer" target=3D"_blank">crates.=
io/thiserror/1.0.40</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/time-core/0.1.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/time-core/0.1.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/time-macros/0.2.8" rel=3D"noreferrer" target=3D"_blank">crates=
.io/time-macros/0.2.8</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/time/0.3.20" rel=3D"noreferrer" target=3D"_blank">crates.io/ti=
me/0.3.20</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/tinytemplate/1.2.1" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/tinytemplate/1.2.1</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/tinyvec/1.6.0" rel=3D"noreferrer" target=3D"_blank">crates.io/=
tinyvec/1.6.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/tinyvec_macros/0.1.1" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/tinyvec_macros/0.1.1</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/toml/0.5.11" rel=3D"noreferrer" target=3D"_blank">crates.io/to=
ml/0.5.11</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/toml_datetime/0.6.1" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/toml_datetime/0.6.1</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/toml_edit/0.19.8" rel=3D"noreferrer" target=3D"_blank">crates.=
io/toml_edit/0.19.8</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/unicode-bidi/0.3.13" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/unicode-bidi/0.3.13</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/unicode-ident/1.0.8" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/unicode-ident/1.0.8</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/unicode-normalization/0.1.22" rel=3D"noreferrer" target=3D"_bl=
ank">crates.io/unicode-normalization/0.1.22</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/unicode-segmentation/1.10.1" rel=3D"noreferrer" target=3D"_bla=
nk">crates.io/unicode-segmentation/1.10.1</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/url/2.3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/url/=
2.3.1</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/uuid/1.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/uui=
d/1.3.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/version-compare/0.0.10" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/version-compare/0.0.10</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/version_check/0.9.4" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/version_check/0.9.4</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/walkdir/2.3.3" rel=3D"noreferrer" target=3D"_blank">crates.io/=
walkdir/2.3.3</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/wasi/0.11.0+wasi-snapshot-preview1" rel=3D"noreferrer" target=
=3D"_blank">crates.io/wasi/0.11.0+wasi-snapshot-preview1</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/wasm-bindgen-backend/0.2.84" rel=3D"noreferrer" target=3D"_bla=
nk">crates.io/wasm-bindgen-backend/0.2.84</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/wasm-bindgen-macro-support/0.2.84" rel=3D"noreferrer" target=
=3D"_blank">crates.io/wasm-bindgen-macro-support/0.2.84</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/wasm-bindgen-macro/0.2.84" rel=3D"noreferrer" target=3D"_blank=
">crates.io/wasm-bindgen-macro/0.2.84</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/wasm-bindgen-shared/0.2.84" rel=3D"noreferrer" target=3D"_blan=
k">crates.io/wasm-bindgen-shared/0.2.84</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/wasm-bindgen/0.2.84" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/wasm-bindgen/0.2.84</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/web-sys/0.3.61" rel=3D"noreferrer" target=3D"_blank">crates.io=
/web-sys/0.3.61</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/winapi-i686-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D=
"_blank">crates.io/winapi-i686-pc-windows-gnu/0.4.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/winapi-util/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates=
.io/winapi-util/0.1.5</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=
=3D"_blank">crates.io/winapi-x86_64-pc-windows-gnu/0.4.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/winapi/0.3.9" rel=3D"noreferrer" target=3D"_blank">crates.io/w=
inapi/0.3.9</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/winnow/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/w=
innow/0.4.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/zvariant_derive/3.12.0" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/zvariant_derive/3.12.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http=
://crates.io/zvariant_utils/1.0.0" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/zvariant_utils/1.0.0</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http:/=
/github.com/gtk-rs/glib;protocol=3Dhttps;nobranch=3D1;name=3Dglib;destsuffi=
x=3Dglib" rel=3D"noreferrer" target=3D"_blank">github.com/gtk-rs/glib;proto=
col=3Dhttps;nobranch=3D1;name=3Dglib;destsuffix=3Dglib</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http:/=
/github.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dglib-sys;destsu=
ffix=3Dglib-sys;subpath=3Dglib-sys" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dglib-sys;destsuffi=
x=3Dglib-sys;subpath=3Dglib-sys</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http:/=
/github.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dgobject-sys;des=
tsuffix=3Dgobject-sys;subpath=3Dgobject-sys" rel=3D"noreferrer" target=3D"_=
blank">github.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dgobject-s=
ys;destsuffix=3Dgobject-sys;subpath=3Dgobject-sys</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +SRCREV_FORMAT .=3D &quot;_glib&quot;<=
br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +SRCREV_glib =3D &quot;c9ee583cea07830=
c099cdcccd33eda9ef705ea93&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +SRCREV_FORMAT .=3D &quot;_glib-sys&qu=
ot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +SRCREV_glib-sys =3D &quot;5f35e26c65d=
24f8f018f643218de0f5807ba5f01&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +SRCREV_FORMAT .=3D &quot;_gobject-sys=
&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +SRCREV_gobject-sys =3D &quot;5f35e26c=
65d24f8f018f643218de0f5807ba5f01&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; diff --git a/meta/recipes-extended/rus=
t-example/zvariant/0001-Tweak-zvariant-cargo-config.patch b/meta/recipes-ex=
tended/rust-example/zvariant/0001-Tweak-zvariant-cargo-config.patch<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; index 0000000000..638ba3ed4d<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +++ b/meta/recipes-extended/rust-examp=
le/zvariant/0001-Tweak-zvariant-cargo-config.patch<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; @@ -0,0 +1,1249 @@<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +From e85ce4136694899f0010d48f47c5e905=
c3a9d461 Mon Sep 17 00:00:00 2001<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +From: Frederic Martinsons &lt;<a href=
=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">frederic.martin=
sons@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +Date: Thu, 23 Mar 2023 07:12:37 +0100=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +Subject: [PATCH] Tweak zvariant cargo=
 config<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +This library crate is a part of zbus =
project, and is aimed to<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +be published amongst the whole projec=
t.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +Nevertheless, this recipe is for show=
ing example of real<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +code which uses a local registry via =
git url inside yocto<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +environment.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +I didn&#39;t find a real example of b=
inary crate that uses git<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +dependency but it seems to me a very =
common use case<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +when we are working on multiple local=
 crates that are not<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +aimed to be published on public regis=
try.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +Long story short, this patch add a mo=
dified Cargo.toml<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +to use the zvariant_derive dependency=
 from <a href=3D"http://crates.io" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io</a> instead<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +of zbus local one and a pre generated=
 Cargo.lock in order<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +to make cargo patch process inside ca=
rgo_common.bbclass work<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +Signed-off-by: Frederic Martinsons &l=
t;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">freder=
ic.martinsons@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +---<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + zvariant/Cargo.lock | 1198 +++++++++=
++++++++++++++++++++++++++++++++++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + zvariant/Cargo.toml |=C2=A0 =C2=A0 2=
 +-<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + 2 files changed, 1199 insertions(+),=
 1 deletion(-)<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + create mode 100644 zvariant/Cargo.lo=
ck<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +diff --git a/zvariant/Cargo.lock b/zv=
ariant/Cargo.lock<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +new file mode 100644<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +index 00000000..02a83d42<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +--- /dev/null<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++++ b/zvariant/Cargo.lock<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +@@ -0,0 +1,1198 @@<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++# This file is automatically @genera=
ted by Cargo.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++# It is not intended for manual edit=
ing.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D 3<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;anes&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.1.6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;4b46cbb362ab87529=
21c97e041f5e366ee6297bd428a31275b9fcf1e380f7299&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;anyhow&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.70&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;7de8ce5e0f9f8d882=
45311066a578d72b7af3e7088f32783804676302df237e4&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;arrayvec&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.7.2&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;8da52d66c7071e2e3=
fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;atty&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.14&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;d9b39be18770d1142=
1cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;hermit-abi 0.1.19&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;libc&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;winapi&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;autocfg&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.1.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;d468802bab17cbc0c=
c575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;bitflags&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.3.2&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;bef38d45163c2f1dd=
e094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;bumpalo&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;3.12.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;0d261e25685491390=
7f67ed06efbc3338dfe6179796deefc1ff763fc1aee5535&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;byteorder&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.4.3&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;14c189c53d0989454=
99cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;cast&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;37b2a672a2cb129a2=
e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;cfg-if&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;baf1de4339761588b=
c0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;chrono&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.4.24&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;4e3c5919066adf22d=
f73762e50cffcde3a758f2a848b113b586d1f86728b673b&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;num-integer&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;num-traits&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;ciborium&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;b0c137568cc60b904=
a7724001b35ce2630fd00d5d84805fbb608ab89509d788f&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;ciborium-io&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;ciborium-ll&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;ciborium-io&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;346de753af073cc87=
b52b2083a506b38ac176a44cfb05497b622e27be899b369&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;ciborium-ll&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;213030a2b5a4e0c08=
92b6652260cf6ccac84827b83a85a534e178e3906c4cf1b&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;ciborium-io&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;half&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;clap&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;3.2.23&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;71655c45cb9845d32=
70c9d6df84ebe72b4dad3c2ba3f7023ad47c144e4e473a5&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;bitflags&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;clap_lex&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;indexmap&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;textwrap&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;clap_lex&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.4&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;2850f2f5a82cbf437=
dd5af4d49848fbdfc27c157c3d010345776f952765261c5&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;os_str_bytes&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;criterion&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.4.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;e7c76e09c1aae2bc5=
2b3d2f29e13c6572553b30c4aa1b8a49fd70de6412654cb&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;anes&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;atty&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;cast&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;ciborium&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;clap&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;criterion-plot&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;itertools 0.10.5&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;lazy_static&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;num-traits&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;oorandom&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;plotters&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;rayon&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;regex&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde_derive&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde_json&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;tinytemplate&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;walkdir&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;criterion-plot&quot;<=
br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.5.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;6b50826342786a51a=
89e2da3a28f1c32b06e387201bc2d19791f622c673706b1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;cast&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;itertools 0.10.5&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;crossbeam-channel&quo=
t;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.5.7&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;cf2b3e84787974465=
14c91ef04bafcb59faba183e621ad488df88983cc14128c&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;crossbeam-deque&quot;=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.8.3&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;ce6fd6f855243022d=
cecf8702fef0c297d4338e226845fe067f6341ad9fa0cef&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;crossbeam-epoch&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;crossbeam-epoch&quot;=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.9.14&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;46bd5f3f85273295a=
9d14aedfb86f6aadbff6d8f5295c4a9edb08e819dcf5695&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;memoffset&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;scopeguard&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;crossbeam-utils&quot;=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.8.15&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;3c063cd8cc95f5c37=
7ed0d4b49a4b21f632396ff690e8470c29b3359b346984b&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;either&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.8.1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;7fcaabb2fef8c910e=
7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;enumflags2&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.7.5&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;e75d4cd21b9538344=
4831539909fbb14b9dc3fdceb2a6f5d36577329a1f55ccb&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;enumflags2_derive&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;enumflags2_derive&quo=
t;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.7.4&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;f58dc3c5e468259f1=
9f2d46304a6b28f1c3d034442e14b322d2b850e36f6d5ae&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;form_urlencoded&quot;=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.1.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;a9c384f161156f526=
0c24a097c56119f9be8c798586aecc13afbcbe7b7e26bf8&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;percent-encoding&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;futures-channel&quot;=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;164713a5a0dcc3e7b=
4b1ed7d3b433cabc18025386f9339346e8daf15963cf7ac&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-core&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;futures-core&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;86d7a0c1aa76363da=
c491de0ee99faf6941128376f1cf96f07db7603b7de69dd&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;futures-executor&quot=
;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;1997dd9df74cdac93=
5c76252744c1ed5794fac083242ea4fe77ef3ed60ba0f83&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-core&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-task&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-util&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;futures-macro&quot;<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;3eb14ed937631bd8b=
8b8977f2c198443447a8355b6e3ca599f38c975e5a963b6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;futures-task&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;fd65540d33b37b165=
42a0438c12e6aeead10d4ac5d05bd3f805b8f35ab592879&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;futures-util&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;3ef6b17e481503ec8=
5211fed8f39d1970f128935ca1f814cd32ac4a6842e84ab&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-core&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-macro&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-task&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;pin-project-lite&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;pin-utils&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;slab&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;getrandom&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.8&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;c05aeb6a22b8f6254=
0c194aac980f2115af067bfe15a0734d7277a768d396b31&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;libc&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;wasi&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;glib&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.10.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;git+<a href=3D"http=
s://github.com/gtk-rs/glib?rev=3Dc9ee583cea0#c9ee583cea07830c099cdcccd33eda=
9ef705ea93" rel=3D"noreferrer" target=3D"_blank">https://github.com/gtk-rs/=
glib?rev=3Dc9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93</a>&quot;<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;bitflags&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-channel&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-core&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-executor&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-task&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;futures-util&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;glib-macros&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;glib-sys&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;gobject-sys&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;libc&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;once_cell&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;glib-macros&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.10.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;git+<a href=3D"http=
s://github.com/gtk-rs/glib?rev=3Dc9ee583cea0#c9ee583cea07830c099cdcccd33eda=
9ef705ea93" rel=3D"noreferrer" target=3D"_blank">https://github.com/gtk-rs/=
glib?rev=3Dc9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93</a>&quot;<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;anyhow&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;heck&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;itertools 0.9.0&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro-crate 0.1.5&quot;,=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro-error&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;glib-sys&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.10.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;git+<a href=3D"http=
s://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/gtk-rs/sys#5f35e26c65d24f8=
f018f643218de0f5807ba5f01</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;libc&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;system-deps&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;gobject-sys&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.10.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;git+<a href=3D"http=
s://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/gtk-rs/sys#5f35e26c65d24f8=
f018f643218de0f5807ba5f01</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;glib-sys&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;libc&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;system-deps&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;half&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.8.2&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;eabb4a44450da02c9=
0444cf74558da904edde8fb4e9035a9a6a4e15445af0bd7&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;hashbrown&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.12.3&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;8a9ee70c43aaf417c=
914396645a0fa852624801b24ebb7ae78fe8272889ac888&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;heck&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.3&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;6d621efb26863f0e9=
924c6ac577e8275e5e6b77455db64ffa6c65c904e9e132c&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;unicode-segmentation&quot;,<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;hermit-abi&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.1.19&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;62b467343b94ba476=
dcb2500d242dadbb39557df889310ac77c5d99100aaac33&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;libc&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;hermit-abi&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;ee512640fe35acbfb=
4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;libc&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;idna&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;e14ddfc70884202db=
2244c223200c204c2bda1bc6e0998d11b5e024d657209e6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;unicode-bidi&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;unicode-normalization&quot;,<=
br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;indexmap&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.9.2&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;1885e79c1fc4b10f0=
e172c475f458b7f7b93061064d98c3293e98c5ba0c8b399&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;hashbrown&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;itertools&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.9.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;284f18f85651fe11e=
8a991b2adb42cb078325c996ed026d994719efcfca1d54b&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;either&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;itertools&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.10.5&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;b0fd2260e829bddf4=
cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;either&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;itoa&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;453ad9f582a441959=
e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;js-sys&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.61&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;445dde2150c55e483=
f3d8416706b97ec8e8237c307e5b7b4b8dd15e6af2a0730&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;wasm-bindgen&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;lazy_static&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.4.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;e2abad23fbc42b370=
0f2f279844dc832adb2b2eb069b2df918f455c4e18cc646&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;libc&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.140&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;99227334921fae1a9=
79cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f80c&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;log&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.4.17&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;abb12e687cfb44aa4=
0f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;memchr&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;2.5.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;2dffe52ecf27772e6=
01905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;memoffset&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.8.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;d61c719bcfbcf5d62=
b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;num-integer&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.1.45&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;225d3389fb3509a24=
c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;num-traits&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;num-traits&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.15&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;578ede34cf02f8924=
ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;num_cpus&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.15.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;0fac9e2da13b5eb44=
7a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;hermit-abi 0.2.6&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;libc&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;once_cell&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.17.1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;b7e5500299e16ebb1=
47ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;oorandom&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;11.1.3&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;0ab1bc2a289d34bd0=
4a330323ac98a1b4bc82c9d9fcb1e66b63caa84da26b575&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;os_str_bytes&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;6.5.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;ceedf44fb00f2d198=
4b0bc98102627ce622e083e49a5bacdb3e514fa4238e267&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;percent-encoding&quot=
;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;2.2.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;478c572c3d73181ff=
3c2539045f6eb99e5491218eae919370993b890cdbdd98e&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;pin-project-lite&quot=
;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.9&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;e0a7ae3ac2f117308=
5d398531c705756c94a4c56843785df85a60c1a0afac116&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;pin-utils&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.1.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;8b870d8c151b6f2fb=
93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;pkg-config&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.26&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;6ac9a59f73473f1b8=
d852421e59e64809f025994837ef743615c6d0c5b305160&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;plotters&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.4&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;2538b639e64229554=
6c50fcd545198c9d64ee2a38620a628724a3b266d5fbf97&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;num-traits&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;plotters-backend&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;plotters-svg&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;wasm-bindgen&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;web-sys&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;plotters-backend&quot=
;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.4&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;193228616381fecdc=
1224c62e96946dfbc73ff4384fba576e052ff8c1bea8142&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;plotters-svg&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.3&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;f9a81d2759aae1dae=
668f783c308bc5c8ebd191ff4184aaa1b37f65a6ae5a56f&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;plotters-backend&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;ppv-lite86&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.17&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;5b40af805b3121fea=
b8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;proc-macro-crate&quot=
;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.1.5&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;1d6ea3c4595b96363=
c13943497db34af4460fb474a95c43f4446ad341b8c9785&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;toml&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;proc-macro-crate&quot=
;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.3.1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;7f4c021e1093a5662=
6774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;once_cell&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;toml_edit&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;proc-macro-error&quot=
;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.4&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;da25490ff9892aab3=
fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro-error-attr&quot;,<=
br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;version_check&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;proc-macro-error-attr=
&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.4&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;a1be40180e52ecc98=
ad80b184934baf3d0d29f979574e439af5a55274b35f869&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;version_check&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;proc-macro2&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.53&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;ba466839c78239c09=
faf015484e5cc04860f88242cff4d03eb038f04b4699b73&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;unicode-ident&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;quote&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.26&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;4424af4bf778aae20=
51a77b60283332f386554255d722233d09fbfc7e30da2fc&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;rand&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.8.5&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;34af8d1a0e25924bc=
5b7c43c079c942339d8f0a8b57c39049bef581b46327404&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;libc&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;rand_chacha&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;rand_core&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;rand_chacha&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;e6c10a63a0fa32252=
be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;ppv-lite86&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;rand_core&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;rand_core&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.6.4&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;ec0be4795e2f6a280=
69bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;getrandom&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;rayon&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.7.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;1d2df5196e37bcc87=
abebc0053e20787d73847bb33134a69841207dd0a47f03b&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;either&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;rayon-core&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;rayon-core&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.11.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;4b8f95bd6966f5c87=
776639160a66bd8ab9895d9d4ab01ddba9fc60661aebe8d&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;crossbeam-channel&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;crossbeam-deque&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;num_cpus&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;regex&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.7.2&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;cce168fea28d3e05f=
158bda4576cf0c844d5045bc2cc3620fa0292ed5bb5814c&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;regex-syntax&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;regex-syntax&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.6.29&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;f162c6dd7b008981e=
4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;ryu&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.13&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;f91339c0467de6236=
0649f8d3e185ca8de4224ff281f66000de5eb2a77a79041&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;same-file&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;93fc1dc3aaa9bfed9=
5e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;winapi-util&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;scopeguard&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.1.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;d29ab0c6d3fc0ee92=
fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;serde&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.158&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;771d4d9c4163ee138=
805e12c710dd365e4f44be8be0503cb1bb9eb989425d9c9&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde_derive&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;serde_bytes&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.11.9&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;416bda436f9aab92e=
02c8e10d49a15ddd339cea90b6e340fe51ed97abb548294&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;serde_derive&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.158&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;e801c1712f4847558=
2b7696ac71e0ca34ebb30e09338425384269d9717c62cad&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 2.0.8&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;serde_json&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.94&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;1c533a59c9d8a93a0=
9c6ab31f0fd5e5f4dd1b8fc9434804029839884765d04ea&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;itoa&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;ryu&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;serde_repr&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.1.12&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;bcec881020c684085=
e55a25f7fd888954d56609ef363479dc5a1305eb0d40cab&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 2.0.8&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;slab&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.4.8&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;6528351c9bc8ab223=
53f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;static_assertions&quo=
t;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.1.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;a2eb9349b6444b326=
872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;strum&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.18.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;57bd81eb48f4c437c=
adc685403cad539345bf703d78e63707418431cecd4522b&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;strum_macros&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.18.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;87c85aa3f8ea653bf=
d3ddf25f7ee357ee4d204731f6aa9ad04002306f6e2774c&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;heck&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;syn&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.109&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;72b64191b275b66ff=
e2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;unicode-ident&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;syn&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;2.0.8&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;bcc02725fd69ab9f2=
6eab07fad303e2497fad6fb9eba4f96c4d1687bdf704ad9&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;unicode-ident&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;system-deps&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.3.2&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;0f3ecc17269a19353=
b3558b313bba738b25d82993e30d62a18406a24aba4649b&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;heck&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;pkg-config&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;strum&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;strum_macros&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;thiserror&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;toml&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;version-compare&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;textwrap&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.16.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;222a222a5bfe1bba4=
a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;thiserror&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.40&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;978c9a314bd8dc99b=
e594bc3c175faaa9794be04a5a5e153caba6915336cebac&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;thiserror-impl&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;thiserror-impl&quot;<=
br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.40&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;f9456a42c5b0d803c=
8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 2.0.8&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;time&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.20&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;cd0cbfecb4d19b5ea=
75bb31ad904eb5b9fa13f21079c3b92017ebdf4999a5890&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;time-core&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;time-macros&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;time-core&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.1.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;2e153e1f1acaef8ac=
c537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;time-macros&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.8&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;fd80a657e71da814b=
8e5d60d3374fc6d35045062245d80224748ae522dd76f36&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;time-core&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;tinytemplate&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.2.1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;be4d6b5f19ff7664e=
8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde_json&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;tinyvec&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.6.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;87cc5ceb3875bb20c=
2890005a4e226a4651264a5c75edb2421b52861a0a0cb50&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;tinyvec_macros&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;tinyvec_macros&quot;<=
br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.1.1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;1f3ccbac311fea05f=
86f61904b462b55fb3df8837a366dfc601a0161d0532f20&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;toml&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.5.11&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;f4f7f0dd8d50a853a=
531c426359045b1998f04219d88799810762cd4ad314234&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;toml_datetime&quot;<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.6.1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;3ab8ed2edee10b501=
32aed5f331333428b011c99402b5a534154ed15746f9622&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;toml_edit&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.19.8&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;239410c8609e81254=
56927e6707163a3b1fdb40561e4b803bc041f466ccfdc13&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;indexmap&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;toml_datetime&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;winnow&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;unicode-bidi&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.13&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;92888ba5573ff0807=
36b3648696b70cafad7d250551175acbaa4e0385b3e1460&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;unicode-ident&quot;<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.8&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;e5464a87b239f13a6=
3a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;unicode-normalization=
&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.1.22&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;5c5713f0fc4b5db66=
8a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;tinyvec&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;unicode-segmentation&=
quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.10.1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;1dd62409856789511=
8886609431a7c3b8f516e41d30e0643f03d94592a147e36&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;url&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;2.3.1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;0d68c799ae75762b8=
c3fe375feb6600ef5602c883c5d21eb51c09f22b83c4643&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;form_urlencoded&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;idna&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;percent-encoding&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;uuid&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.3.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;1674845326ee10d37=
ca60470760d4288a6f80f304007d92e5c53bab78c9cfd79&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;version-compare&quot;=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.0.10&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;d63556a25bae6ea31=
b52e640d7c41d1ab27faba4ccb600013837a3d0b3994ca1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;version_check&quot;<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.9.4&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;49874b5167b65d719=
3b8aba1567f5c7d93d001cafc34600cee003eda787e483f&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;walkdir&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;2.3.3&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;36df944cda56c7d8d=
8b7496af378e6b16de9284591917d307c9b4d313c44e698&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;same-file&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;winapi-util&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;wasi&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.11.0+wasi-snapsh=
ot-preview1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;9c8d87e72b64a3b4d=
b28d11ce29237c246188f4f51057d65a7eab63b7987e423&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;wasm-bindgen&quot;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.84&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;31f8dcbc21f30d9b8=
f2ea926ecb58f6b91192c17e9d33594b3df58b2007ca53b&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;wasm-bindgen-macro&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;wasm-bindgen-backend&=
quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.84&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;95ce90fd5bcc06af5=
5a641a86428ee4229e44e07033963a2290a8e241607ccb9&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;bumpalo&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;log&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;once_cell&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;wasm-bindgen-shared&quot;,<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;wasm-bindgen-macro&qu=
ot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.84&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;4c21f77c0bedc37fd=
5dc21f897894a5ca01e7bb159884559461862ae90c0b4c5&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;wasm-bindgen-macro-support&qu=
ot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;wasm-bindgen-macro-su=
pport&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.84&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;2aff81306fcac3c75=
15ad4e177f521b5c9a15f2b08f4e32d823066102f35a5f6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;wasm-bindgen-backend&quot;,<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;wasm-bindgen-shared&quot;,<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;wasm-bindgen-shared&q=
uot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.2.84&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;0046fef7e28c3804e=
5e38bfa31ea2a0f73905319b677e57ebe37e49358989b5d&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;web-sys&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.61&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;e33b99f4b23ba3eec=
1a53ac264e35a755f00e966e0065077d6027c0f575b0b97&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;js-sys&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;wasm-bindgen&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;winapi&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.3.9&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;5c839a674fcd7a989=
52e593242ea400abe93992746761e38641405d28b00f419&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;winapi-i686-pc-windows-gnu&qu=
ot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;winapi-x86_64-pc-windows-gnu&=
quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;winapi-i686-pc-window=
s-gnu&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.4.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;ac3b87c63620426dd=
9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;winapi-util&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.1.5&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;70ec6ce85bb158151=
cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;winapi&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;winapi-x86_64-pc-wind=
ows-gnu&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.4.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;712e227841d057c1e=
e1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;winnow&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;0.4.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;deac0939bd6e4f24a=
b5919fbf751c97a8cfc8543bb083a305ed5c0c10bb241d1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;memchr&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;zvariant&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;3.12.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;arrayvec&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;byteorder&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;chrono&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;criterion&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;enumflags2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;glib&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;libc&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;rand&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde_bytes&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde_json&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;serde_repr&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;static_assertions&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;time&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;url&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;uuid&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;zvariant_derive&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;zvariant_derive&quot;=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;3.12.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;34c20260af4b28b32=
75d6676c7e2a6be0d4332e8e0aba4616d34007fd84e462a&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro-crate 1.3.1&quot;,=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;zvariant_utils&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++[[package]]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++name =3D &quot;zvariant_utils&quot;<=
br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++version =3D &quot;1.0.0&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++source =3D &quot;registry+<a href=3D=
"https://github.com/rust-lang/crates.io-index" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++checksum =3D &quot;53b22993dbc4d128a=
17a3b6c92f1c63872dd67198537ee728d8b5d7c40640a8b&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++dependencies =3D [<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;quote&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +diff --git a/zvariant/Cargo.toml b/zv=
ariant/Cargo.toml<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +index 45367729..6981862a 100644<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +--- a/zvariant/Cargo.toml<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++++ b/zvariant/Cargo.toml<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +@@ -27,7 +27,7 @@ byteorder =3D &quot=
;1.4.3&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + serde =3D { version =3D &quot;1.0&qu=
ot;, features =3D [&quot;derive&quot;] }<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + arrayvec =3D { version =3D &quot;0.7=
.2&quot;, features =3D [&quot;serde&quot;], optional =3D true }<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + enumflags2 =3D { version =3D &quot;0=
.7.5&quot;, features =3D [&quot;serde&quot;], optional =3D true }<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +-zvariant_derive =3D { version =3D &q=
uot;=3D3.12.0&quot;, path =3D &quot;../zvariant_derive&quot; }<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ++zvariant_derive =3D &quot;3.12.0&quo=
t;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + serde_bytes =3D { version =3D &quot;=
0.11&quot;, optional =3D true }<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + static_assertions =3D &quot;1.1.0&qu=
ot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + libc =3D &quot;0.2.137&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +2.34.1<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; diff --git a/meta/recipes-extended/rus=
t-example/<a href=3D"http://zvariant_3.12.0.bb" rel=3D"noreferrer" target=
=3D"_blank">zvariant_3.12.0.bb</a> b/meta/recipes-extended/rust-example/<a =
href=3D"http://zvariant_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">zva=
riant_3.12.0.bb</a><br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; index 0000000000..ab769b3fce<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +++ b/meta/recipes-extended/rust-examp=
le/<a href=3D"http://zvariant_3.12.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">zvariant_3.12.0.bb</a><br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; @@ -0,0 +1,20 @@<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +SUMMARY =3D &quot;Provides API for en=
coding/decoding of data to/from D-Bus wire format&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +DESCRIPTION =3D &quot;This crate prov=
ides API for encoding/decoding of data to/from D-Bus wire format.\<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +This binary wire format is simple and=
 very efficient and hence useful outside of D-Bus context as well.\<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +A modified form of this format, GVari=
ant is very commonly used for efficient storage of arbitrary \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +data and is also supported by this cr=
ate.&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https:/=
/gitlab.freedesktop.org/dbus/zbus/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.freedesktop.org/dbus/zbus/</a>&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LIC=
ENSE;md5=3Db377b220f43d747efdec40d69fcaa69d&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +SRC_URI =3D &quot; \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http:/=
/gitlab.freedesktop.org/dbus/zbus;protocol=3Dhttps;branch=3Dmain;subpath=3D=
zvariant" rel=3D"noreferrer" target=3D"_blank">gitlab.freedesktop.org/dbus/=
zbus;protocol=3Dhttps;branch=3Dmain;subpath=3Dzvariant</a> \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 file://0001-Tweak-zvari=
ant-cargo-config.patch;striplevel=3D2 \<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +SRCREV =3D &quot;07506776fab5f58e0297=
60bb4b288f670c7eecd6&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +S =3D &quot;${WORKDIR}/zvariant&quot;=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +inherit cargo cargo-update-recipe-cra=
tes<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +require ${BPN}-crates.inc<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; 2.34.1<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Links: You receive all messages sent t=
o this group.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; View/Reply Online (#179092): <a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/179092" rel=
=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/openembe=
dded-core/message/179092</a><br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Mute This Topic: <a href=3D"https://li=
sts.openembedded.org/mt/97840364/1686489" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/mt/97840364/1686489</a><br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Group Owner: <a href=3D"mailto:openemb=
edded-core%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-c=
ore+owner@lists.openembedded.org</a><br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.=
openembedded.org/g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Alex Kiernan<br>
<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div>

--000000000000b6e09105f7dddd2a--


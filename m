Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7C1C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 07:07:20 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.7732.1681196833120458567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 00:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GF9oJXkh;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id k101-20020a9d19ee000000b006a14270bc7eso979931otk.6
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681196832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWkdnQaG4nSyhXXNilx75bfAgBOQC1FVxlop0e9UEyQ=;
        b=GF9oJXkh3+so2osqZb2Y6e+fwJp3bthGoEsafH8eddkx2PA4FeYNy2/bso7L6ur41D
         92S2RG/Oc0o2kPR3HfvgHhPkyG1nHNteyLI1PcoP5yFJ09l/FsPoDcREpS+rCgRdLsOK
         AZO2qFTff9wirJlhGExs5B5JBxGE08UbSP3oiY0ibWYhT3uQCdr+3bYpw4E2cOUXwusg
         o1puiztH+AMbWdVsYcRa4hXF7j2BKiovHg3lN5il6AF8e/IBLkG1KPJYUQQPHCHDk30s
         QuCgwBaXSp2cFQ3rwOODtXXfjpg5tMGq8+rt9LZi7izBZ6usPztvo069Ffcdq+SNnxaB
         npaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681196832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWkdnQaG4nSyhXXNilx75bfAgBOQC1FVxlop0e9UEyQ=;
        b=1HsCSsCSDmd8aokCzWsXCfrNC6U3JtBnlg3iajeeUZ1BiYNrV2OZL+ejc2XKNJ21ej
         llHJvLIG/ub6DGISE2nbfq8053VsMzA+SzUIsDIFW6iUhXZgyN4s1LM3hKSjBoOzVh7+
         TK+C6paZPH/heybvz45iirPLxY0SG7KEMQrhFzBYZiRhDa0wrNNiWgSP+1wrBVG4Vxqw
         6eZNN5Tu1poObfNioq/9XseMiGr/AHEcXUt750felGNRAdUgIupWZq7GFgUcyk8bn9M0
         9KPHDkVWrjK4My4ucgQ64gIwb/XJM28QYottR5a76ZyCZ6gT7cB1mGhQPG7DOerz7iQ8
         mvyw==
X-Gm-Message-State: AAQBX9cYvc2PK1IBzRM2ijoNgnEgJgj3CEgdW3mnFtoaeVm3rvI7Ofzd
	zwg59GLv4WgbfJktkWhRsHOBAeA7tbRrHvmWFxE=
X-Google-Smtp-Source: AKy350ZmX15xrS7qxYKBNcVZxM4wvv/EzSRvdpkNgbzrV3HwULlv6wa5b1PmGG1Ciutl6Bz0IDAkkkOEIa8Cdp//rwA=
X-Received: by 2002:a9d:6c01:0:b0:6a1:4c0e:1268 with SMTP id
 f1-20020a9d6c01000000b006a14c0e1268mr3466070otq.2.1681196832321; Tue, 11 Apr
 2023 00:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230410094122.5865-1-alex.kiernan@gmail.com> <CAMKF1sq_jvEn5VYmAnRj8HKrXtGAWj8cmD+O6eRHiBqdsLf_EQ@mail.gmail.com>
 <2023041017305195b4c7aa@mail.local> <CAMKF1sp-r4THLG2xfSDiVf=gkaO3aH8SvM0s+keNgAR9mow0tQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp-r4THLG2xfSDiVf=gkaO3aH8SvM0s+keNgAR9mow0tQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Apr 2023 00:06:45 -0700
Message-ID: <CAMKF1sqyY+MAk_JtE831a7h0SaARKmMtNDf4Vfznx0h4j1d8rA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.68.1 -> 1.68.2
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 07:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179908

alright my builds for cargo on qemuriscv32/musl went ok so I guess its ok.

On Mon, Apr 10, 2023 at 11:11=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> Thanks, I'll also check it out. I think the checksums for the musl
> patch would need updating I think as the versions of these crates
> might have changed.
>
> On Mon, Apr 10, 2023 at 10:30=E2=80=AFAM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > My current a-full has this patch.
> >
> > On 10/04/2023 10:21:16-0700, Khem Raj wrote:
> > > If possible, Can you test this on top of contrib/abelloni/master-next
> > > for musl target ?
> > >
> > > On Mon, Apr 10, 2023 at 2:42=E2=80=AFAM Alex Kiernan <alex.kiernan@gm=
ail.com> wrote:
> > > >
> > > > Changes:
> > > >
> > > > * Update the GitHub RSA host key bundled within Cargo. The key was
> > > >   rotated by GitHub on 2023-03-24 after the old one leaked.
> > > > * Mark the old GitHub RSA host key as revoked. This will prevent Ca=
rgo
> > > >   from accepting the leaked key even when trusted by the system.
> > > > * Add support for @revoked and a better error message for
> > > >   @cert-authority in Cargo=E2=80=99s SSH host key verification
> > > >
> > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > ---
> > > >
> > > >  meta/recipes-devtools/rust/{cargo_1.68.1.bb =3D> cargo_1.68.2.bb} =
| 0
> > > >  .../rust/{libstd-rs_1.68.1.bb =3D> libstd-rs_1.68.2.bb}           =
| 0
> > > >  ...t-cross-canadian_1.68.1.bb =3D> rust-cross-canadian_1.68.2.bb} =
| 0
> > > >  .../rust/{rust-llvm_1.68.1.bb =3D> rust-llvm_1.68.2.bb}           =
| 0
> > > >  meta/recipes-devtools/rust/rust-source.inc                      | =
2 +-
> > > >  meta/recipes-devtools/rust/{rust_1.68.1.bb =3D> rust_1.68.2.bb}   =
| 0
> > > >  6 files changed, 1 insertion(+), 1 deletion(-)
> > > >  rename meta/recipes-devtools/rust/{cargo_1.68.1.bb =3D> cargo_1.68=
.2.bb} (100%)
> > > >  rename meta/recipes-devtools/rust/{libstd-rs_1.68.1.bb =3D> libstd=
-rs_1.68.2.bb} (100%)
> > > >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.68.1.bb =
=3D> rust-cross-canadian_1.68.2.bb} (100%)
> > > >  rename meta/recipes-devtools/rust/{rust-llvm_1.68.1.bb =3D> rust-l=
lvm_1.68.2.bb} (100%)
> > > >  rename meta/recipes-devtools/rust/{rust_1.68.1.bb =3D> rust_1.68.2=
.bb} (100%)
> > > >
> > > > diff --git a/meta/recipes-devtools/rust/cargo_1.68.1.bb b/meta/reci=
pes-devtools/rust/cargo_1.68.2.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/rust/cargo_1.68.1.bb
> > > > rename to meta/recipes-devtools/rust/cargo_1.68.2.bb
> > > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.68.1.bb b/meta/=
recipes-devtools/rust/libstd-rs_1.68.2.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
> > > > rename to meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
> > > > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.=
bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.b=
b
> > > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
> > > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.68.1.bb b/meta/=
recipes-devtools/rust/rust-llvm_1.68.2.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
> > > > rename to meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
> > > > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/reci=
pes-devtools/rust/rust-source.inc
> > > > index c8f5a5a9c4c4..6d3a4b131e26 100644
> > > > --- a/meta/recipes-devtools/rust/rust-source.inc
> > > > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > > > @@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rus=
tc-${RUST_VERSION}-src.tar.xz;n
> > > >              file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;=
patchdir=3D${RUSTSRC} \
> > > >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
> > > >  "
> > > > -SRC_URI[rust.sha256sum] =3D "5b8ea94085b65e75c1fa6310e2f90bd706fa8=
0bfcb3544fe26f4037b911d9fb2"
> > > > +SRC_URI[rust.sha256sum] =3D "ce1a115f6aafa912b4622906a92b626354973=
afa9288e2c7750df4dcf3390fc0"
> > > >
> > > >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> > > >
> > > > diff --git a/meta/recipes-devtools/rust/rust_1.68.1.bb b/meta/recip=
es-devtools/rust/rust_1.68.2.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/rust/rust_1.68.1.bb
> > > > rename to meta/recipes-devtools/rust/rust_1.68.2.bb
> > > > --
> > > > 2.39.0
> > > >
> > > >
> > > >
> > > >
> >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#179897): https://lists.openembedded.org/g/openemb=
edded-core/message/179897
> > > Mute This Topic: https://lists.openembedded.org/mt/98172309/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [alexandre.belloni@bootlin.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F7AC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 16:14:11 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.643.1755101645337269886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 09:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UCmJavcy;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d601859f5so539797b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755101644; x=1755706444; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIPbZ17ucBOR82xzuBb7BnkZMaZAYIrXL+gQ7JD2Snw=;
        b=UCmJavcyynP0+Sb8Dbv/qmnHFWTWaawETotoxDs/zmaVblnaUYXgu1XadkELRPxlZ7
         q3YbCAQ3LQmXKxjBz0PG58BUqfQblqfwhoRl0worz/dAgP523NaLJU55KleNnAjHTiMT
         Dmv+aZJCfeMPotrwjt0aavFeNISWkLqiUPiOFXvnB5lxDzLL7eojZYH9qzDM13DQSvEK
         b8v6c+eE3HwSB6z/NKLv8uxdpsFrlNmxU3C4wN8HeNag2C0ssd+HaLYJljWsue3h3wX9
         7DXPCRyeBp1IG4LjHFP7OvUfdvyIskr2+9pYDSB6hp/xZ7SwZ3x9uriYCH8FC/lmhANf
         g+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755101644; x=1755706444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIPbZ17ucBOR82xzuBb7BnkZMaZAYIrXL+gQ7JD2Snw=;
        b=sqSe/+Ikzn9L7uzth3FhLmnl2bnXvFIS1X6eutQxIpggqTp2B4FBAQauFsv7MsZwKT
         4cPVCwKEUFzbptutDnBgQNgRkxS1vh52Kyy8xah25t/1tzy77utSM7BDwfxpGB6kznGY
         gyxd+HXo0WfQA5cUk24x8eGu50dtcWt9JTsyPRyZwTsJ1A9fCdxbUknNG8iZnpE6JKYm
         vZwnctCs9ZuWI2FNm4JgXXjKNJ8h3tTAUmiPsMzSndkGNWtdK96Bl/0snCPtpjhcJbz4
         FYbsFbKZ8MFPhvOirpfhngWH/z5NCLNkxTmVqegh70bgQwhfFhseOVOtoWrypMzPg/Or
         Jz3Q==
X-Gm-Message-State: AOJu0YxQJNueC9+lt6KrdTKRVY9ODlIS0qlwjfIKUmzpPzurcCHLVNDn
	55cGbV0B3Z33DawZTv5+ajISSfRIFFVjzNwhQm9vl+x95KVN6BLiq2mEPjBQJvDTuZyZNfuRM0p
	X3oQ0w9UdlB2NroRQFr4FkyszXlm1qQ8Fkct7X2MuhvGD7qR+yEt1
X-Gm-Gg: ASbGncsvBY5KVkkI3TycR+MLGu+Ryg3rlPck4qrqhqkjwAAMr8DSdIyXv5ejJyv5FUS
	n8NhlUEReEumIKdIuKEDVFpOuk0bn32Ox/smo0lKyewSY0cJPSl0xUouNXOgkM5A+8jEYkEOQdV
	X3CZ1Oygh03FWMIeYnjStFTvp84T0hoPgKNsYiLo2v9Cc3yOFPXLO6llosNOqeFKB42/WCqZspH
	0eUDn+oqviBerrxHeD1HUSIwKu1XIlxtVEvmvNBu6lj/gmO5A==
X-Google-Smtp-Source: AGHT+IF+AcM2xcDaDoLPTYjVipsnt6m0SvFE+wWZ7yBk9dKaFqUVb5YDrh3lKXKPsv6oGSRVVlBO5IPu3QoeS8b1wJA=
X-Received: by 2002:a05:690c:6e0a:b0:71a:2d5f:49b1 with SMTP id
 00721157ae682-71d4e3fd798mr42577247b3.4.1755101644287; Wed, 13 Aug 2025
 09:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755005205.git.steve@sakoman.com> <1a8f58b2e7c2005757fcf1a5d4b57f7239925133.1755005205.git.steve@sakoman.com>
 <ebdeab05-86f3-41b8-8611-43318652b7e6@gmail.com>
In-Reply-To: <ebdeab05-86f3-41b8-8611-43318652b7e6@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Aug 2025 09:13:53 -0700
X-Gm-Features: Ac12FXy4-T3TBYPkAmh41jsrtRO-nlGVuAlhWyuY6YUW7e6p5dkgA2hJoZVxjuk
Message-ID: <CAOSpxdZqxpHaCGdLeuRux+JW5TBK+iWstL+nduTSpUp0rWDDhw@mail.gmail.com>
Subject: Re: [OE-core][walnascar 3/3] bitbake.conf: Switch prefix mapping to
 use -ffile-prefix-map
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Gyorgy Sarvari <skandigraun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 16:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221816

On Wed, Aug 13, 2025 at 9:11=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> Is this more than cosmetic in walnascar? If it isn't, than should this
> really go into a stable branch? In my understanding this will require a
> brand new sstate cache.

Khem,

Can you comment on this?

Thanks!

Steve

>
> On 8/12/25 15:29, Steve Sakoman via lists.openembedded.org wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > -ffile-prefix map is more comprehensive when it comes to reproducible
> > builds and its superset of all prefix-mapping options in compilers
> >
> > (From OE-Core rev: ff73fa7ef7666a6dbe34f15515bc3ab6e574c5b0)
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com=
>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes-recipe/kernel-arch.bbclass            |  6 ++----
> >  meta/conf/bitbake.conf                             | 14 +++++---------
> >  meta/lib/oe/package.py                             |  2 +-
> >  meta/recipes-devtools/gcc/libgfortran.inc          |  2 +-
> >  .../python/python3-maturin_1.8.3.bb                |  2 +-
> >  meta/recipes-devtools/rust/cargo_1.84.1.bb         |  2 +-
> >  6 files changed, 11 insertions(+), 17 deletions(-)
> >
> > diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-rec=
ipe/kernel-arch.bbclass
> > index 36a6e0a60a..749a266ea3 100644
> > --- a/meta/classes-recipe/kernel-arch.bbclass
> > +++ b/meta/classes-recipe/kernel-arch.bbclass
> > @@ -73,10 +73,8 @@ HOST_OBJCOPY_KERNEL_ARCH ?=3D "${TARGET_OBJCOPY_KERN=
EL_ARCH}"
> >
> >  KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
> >   -fuse-ld=3Dbfd ${DEBUG_PREFIX_MAP} \
> > - -fdebug-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \
> > - -fmacro-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \
> > - -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH} =
\
> > - -fmacro-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH} =
\
> > + -ffile-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \
> > + -ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH} \
> >  "
> >  KERNEL_LD =3D "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
> >  KERNEL_AR =3D "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 501808204e..b1dae17267 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install =3D "${PARALLEL=
_MAKEINST} "
> >  ##################################################################
> >  TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
> >  # Beware: applied last to first
> > -DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> > - -fmacro-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> > - -fdebug-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> > - -fmacro-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> > - -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> > - -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > - -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > - -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > - -fmacro-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > +DEBUG_PREFIX_MAP ?=3D "\
> > + -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> > + -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> > + -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > + -ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> >  "
> >  DEBUG_LEVELFLAG ?=3D "-g"
> >
> > diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> > index 0db14f2164..0bcc04ea54 100644
> > --- a/meta/lib/oe/package.py
> > +++ b/meta/lib/oe/package.py
> > @@ -991,7 +991,7 @@ def copydebugsources(debugsrcdir, sources, d):
> >
> >          prefixmap =3D {}
> >          for flag in cflags.split():
> > -            if not flag.startswith("-fdebug-prefix-map"):
> > +            if not flag.startswith("-ffile-prefix-map"):
> >                  continue
> >              if "recipe-sysroot" in flag:
> >                  continue
> > diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-d=
evtools/gcc/libgfortran.inc
> > index 4560421ed1..fa6aecaaa3 100644
> > --- a/meta/recipes-devtools/gcc/libgfortran.inc
> > +++ b/meta/recipes-devtools/gcc/libgfortran.inc
> > @@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS =3D "\
> >  # An arm hard float target like raspberrypi4 won't build
> >  # as CFLAGS don't make it to the fortran compiler otherwise
> >  # (the configure script sets FC to $GFORTRAN unconditionally)
> > -export GFORTRAN =3D "${FC} -fcanon-prefix-map -fdebug-prefix-map=3D${S=
}=3D${TARGET_DBGSRC_DIR} -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} -=
gno-record-gcc-switches"
> > +export GFORTRAN =3D "${FC} -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_=
DIR} -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} -gno-record-gcc-switch=
es"
> >
> >  do_configure () {
> >       for target in libbacktrace libgfortran
> > diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/me=
ta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > index 17c8fb7083..ad61aac856 100644
> > --- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > +++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > @@ -9,7 +9,7 @@ SRC_URI[sha256sum] =3D "304762f86fd53a8031b1bf006d12572=
a2aa0a5235485031113195cc015
> >
> >  S =3D "${WORKDIR}/maturin-${PV}"
> >
> > -CFLAGS +=3D "-fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}=
/cargo_home"
> > +CFLAGS +=3D "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/=
cargo_home"
> >
> >  DEPENDS +=3D "\
> >      python3-setuptools-rust-native \
> > diff --git a/meta/recipes-devtools/rust/cargo_1.84.1.bb b/meta/recipes-=
devtools/rust/cargo_1.84.1.bb
> > index db18ecfda9..150c2d2b80 100644
> > --- a/meta/recipes-devtools/rust/cargo_1.84.1.bb
> > +++ b/meta/recipes-devtools/rust/cargo_1.84.1.bb
> > @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
> >
> >  inherit cargo pkgconfig
> >
> > -DEBUG_PREFIX_MAP +=3D "-fdebug-prefix-map=3D${RUSTSRC}/vendor=3D${TARG=
ET_DBGSRC_DIR}"
> > +DEBUG_PREFIX_MAP +=3D "-ffile-prefix-map=3D${RUSTSRC}/vendor=3D${TARGE=
T_DBGSRC_DIR}"
> >
> >  do_cargo_setup_snapshot () {
> >       ${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.s=
h --prefix=3D"${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
> >
>


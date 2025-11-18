Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AE0CEE354
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6486.1763497132282311829
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 12:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+JLGfhj;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78802ac22abso58608887b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763497131; x=1764101931; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dL9dHLJUqBqux8XR8EzwrHiM+xBRzuGuxhsMLJvc96A=;
        b=X+JLGfhjGZQEdu7vQtOkRAKsGPodDS86VODX69Rs6gDYkx0ssjgasUee5YvQeKLFEl
         1GErf+arBWqDWc8INzRoOCtpJTpM+xg9R4EhMNJbTKRFYMKniZ5mt+knLtKkMkV75dy6
         FpqhNzmVgvtBew1I8YHY/B/WLjXv6NUzjDgvdvOuhWtU2mylp7dP3B+BJWzawEuWHkSr
         0xrw8syznNfOU2iEcp2H2d5/cJR+ip8id8qdH23J1yuO5SslsCWCcj2lAmLsFc2LUX0C
         OI+ZthAw5V4KlJxoWYQgDXPYwqbADAua/L89/QGxbYR77CbR4Q+uVfihtjSsWCwDI1yK
         rbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763497131; x=1764101931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dL9dHLJUqBqux8XR8EzwrHiM+xBRzuGuxhsMLJvc96A=;
        b=Xp/hWTzxTOPfR9qYY4AvG9d+8Jednad4KD3qbO2lmoQa9R+1tOJy3JF3pYBiE/rY6h
         MABUXnZdKlK2Su746UmTkEr+Sx5Gg6fgh0SlJeBygO5ux0cG/sMR0V19BMa/8QajLnHj
         Z4+oKe5NqEzHeR9D0NhE3TPt01cjy7fqQzj1FXcEN/2qhAoitF7EhrANHWd55TKcT/Ux
         5RQqilAFxvNtLCZLs1htcvU5P6VKwjeEFlzCNBJ1U3HWG7Vp1KvDNuENui8ff+hJychn
         rx3WcufEHzpKa6JTH070PXfcbp41uR78PNJIzzZkpwedxv5UnY2uky+q6c+l/XXxoktU
         UNkA==
X-Gm-Message-State: AOJu0YxRUIfhbBgyxHbs2qgcgiMeLLrtZ2VS6H0AzH4IG7xYcaFxd7Ch
	+70WaLxyzZ/v9tQWvGF/rXVQZcWDFD4DOpYxQzsija+D/nrhUwavKvsVtdx7r8QKyyTu/BmQa7H
	3wQJfOVJICGvZb7QnGrqg5Zr7SZ5Hr68obGJTocU=
X-Gm-Gg: ASbGnctgeyibAGbDISVevtd5TZVsJfiv1Chf3jdteIrNVLMKJCFEGkwa/wH36pw0r7b
	a20weCP6FD/mfMw+WGiuVNOy3aBBbU49Sljy9bVH0NL/+FY97St8lugGpK8o/EXIGZ7dtkSduzX
	BtncL+6S0H4o4M8aAZYvBNLlDik3o+3Cr+pVJLFk+hEYRjthfHu6vz6Wjne4IQfPTm54ZteFla5
	6KUCdP/2ayd5Y1SVBAsT9RkTwNvRPlbaRIZR3yJ67GiMMhKyQpLkZ3mgQsFoJSGhbmv7pM9z1Es
	DJkb5o9iHa57kqfr6rz2vOxkkKy54fVcRWmcqurfB6YZdl92OVBmWVdLAr2jF77uaNzvU+ISZjP
	aJJCSr5jEUPKNcOMgJSCfCYUDMogQjXdVU/Dpbi0ZkMieu8In4jbM
X-Google-Smtp-Source: AGHT+IGAWQGX2vQTZe+qqqiP3EIBp45Fs/2449vOOYplpaysJJRzuz3z/4ybFPw1X735O3hHazhsp3q6yghCGYOQpt4=
X-Received: by 2002:a05:690c:64c5:b0:786:5be2:d467 with SMTP id
 00721157ae682-78929e0e4c4mr161247537b3.3.1763497131322; Tue, 18 Nov 2025
 12:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20250421172915.1651803-1-raj.khem@gmail.com> <20250421172915.1651803-2-raj.khem@gmail.com>
 <84993796-5eab-4fff-9980-3946f4bb6034@gmail.com>
In-Reply-To: <84993796-5eab-4fff-9980-3946f4bb6034@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Nov 2025 12:18:25 -0800
X-Gm-Features: AWmQ_bkCyVHIALBVzJsl_0X2RBhU0OJglyADkb4E_OCrSFGEU0V3KYnMq-ELyJk
Message-ID: <CAMKF1so+3b72=0gXypz5SDvvrMSTUNJgKwYbnEQs8nOVVJuDOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] bitbake.conf: Switch prefix mapping to
 use -ffile-prefix-map
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jacob Kroon <jacob.kroon@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001331470643e42c8a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226535

--0000000000001331470643e42c8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 10:12=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.=
com>
wrote:

> This patch seems to have caused some regression in packaging the source
> for some recipes.
> I don't have a lot of info yet, just finished bisecting.
>
> The issue I see is with "audiofile" recipe from meta-oe that I wanted to
> debug with master branch: with this patch the -src package is empty.
> Without it, it is populated fine. I guess there are other recipes also,
> but that's what I stumbled upon.
>

It's an old package, I wonder if it has a mind of its own when it comes to
compiler
flags. I don't see anything in the recipe metadata that leads towards the
issue.
I wonder if this recipe can be dropped going forward.


>
> Will try to look at it, but if you have any ideas, I'm all ears. But in
> any case, FYI.
>
> On 4/21/25 19:29, Khem Raj via lists.openembedded.org wrote:
> > -ffile-prefix map is more comprehensive when it comes to reproducible
> > builds and its superset of all prefix-mapping options in compilers
> >
> > This makes is cleaner and workable across gcc and clang, clang does not
> > support -fcanon-prefix-map and it has to be explicitly omitted when usi=
ng
> > clang.
> >
> > There are lambdas generated in templates by clang which still get the
> > absolute paths despite -fdebug-prefix-map, this helps with that as well=
.
> >
> > nasm is an outlier and we have fixed it by adding -fdebug-prefix-map
> option
> > luckily we do not pass DEBUG_PREFIX_MAP to nasm, in all recipes which u=
se
> > nasm either pass -fdebug-prefix-map explicitly to nasm or they rewrite =
it
> > to use nasm flags syntax.
> >
> > We have discussed this in past [1]
> >
> > [1]
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230428032030.2=
047920-1-raj.khem@gmail.com/#10281
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Jacob Kroon <jacob.kroon@gmail.com>
> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > v2: Drop using --ffile-prefix in go
> > v3: Fix copydebugsources to use --file-prefix-map instead of
> -fdebug-prefix-map
> >     and few more places
> >
> >  meta/classes-recipe/kernel-arch.bbclass            |  6 ++----
> >  meta/conf/bitbake.conf                             | 14 +++++---------
> >  meta/lib/oe/package.py                             |  2 +-
> >  meta/recipes-devtools/gcc/libgfortran.inc          |  2 +-
> >  .../python/python3-maturin_1.8.3.bb                |  2 +-
> >  meta/recipes-devtools/rust/cargo_1.85.1.bb         |  2 +-
> >  6 files changed, 11 insertions(+), 17 deletions(-)
> >
> > diff --git a/meta/classes-recipe/kernel-arch.bbclass
> b/meta/classes-recipe/kernel-arch.bbclass
> > index 968551267f9..7aea9cd3e8e 100644
> > --- a/meta/classes-recipe/kernel-arch.bbclass
> > +++ b/meta/classes-recipe/kernel-arch.bbclass
> > @@ -73,10 +73,8 @@ HOST_OBJCOPY_KERNEL_ARCH ?=3D
> "${TARGET_OBJCOPY_KERNEL_ARCH}"
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
> > index 8f90026f7c2..b4e1964f77d 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install =3D
> "${PARALLEL_MAKEINST} "
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
> > index 0db14f21642..0bcc04ea54a 100644
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
> > diff --git a/meta/recipes-devtools/gcc/libgfortran.inc
> b/meta/recipes-devtools/gcc/libgfortran.inc
> > index 4560421ed1f..fa6aecaaa30 100644
> > --- a/meta/recipes-devtools/gcc/libgfortran.inc
> > +++ b/meta/recipes-devtools/gcc/libgfortran.inc
> > @@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS =3D "\
> >  # An arm hard float target like raspberrypi4 won't build
> >  # as CFLAGS don't make it to the fortran compiler otherwise
> >  # (the configure script sets FC to $GFORTRAN unconditionally)
> > -export GFORTRAN =3D "${FC} -fcanon-prefix-map
> -fdebug-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR}
> -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} -gno-record-gcc-switches=
"
> > +export GFORTRAN =3D "${FC} -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_=
DIR}
> -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
> >
> >  do_configure () {
> >       for target in libbacktrace libgfortran
> > diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > index 3ec4d0c103b..08975e177f0 100644
> > --- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > +++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > @@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D
> "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc015
> >
> >  S =3D "${WORKDIR}/maturin-${PV}"
> >
> > -CFLAGS +=3D
> "-fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/cargo_home"
> > +CFLAGS +=3D
> "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/cargo_home"
> >
> >  DEPENDS +=3D "\
> >      python3-setuptools-rust-native \
> > diff --git a/meta/recipes-devtools/rust/cargo_1.85.1.bb
> b/meta/recipes-devtools/rust/cargo_1.85.1.bb
> > index db18ecfda9a..150c2d2b801 100644
> > --- a/meta/recipes-devtools/rust/cargo_1.85.1.bb
> > +++ b/meta/recipes-devtools/rust/cargo_1.85.1.bb
> > @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
> >
> >  inherit cargo pkgconfig
> >
> > -DEBUG_PREFIX_MAP +=3D
> "-fdebug-prefix-map=3D${RUSTSRC}/vendor=3D${TARGET_DBGSRC_DIR}"
> > +DEBUG_PREFIX_MAP +=3D
> "-ffile-prefix-map=3D${RUSTSRC}/vendor=3D${TARGET_DBGSRC_DIR}"
> >
> >  do_cargo_setup_snapshot () {
> >       ${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.s=
h
> --prefix=3D"${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#215180):
> https://lists.openembedded.org/g/openembedded-core/message/215180
> > Mute This Topic: https://lists.openembedded.org/mt/112379635/6084445
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--0000000000001331470643e42c8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 18,=
 2025 at 10:12=E2=80=AFAM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@=
gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">This patch seems to have caused some regre=
ssion in packaging the source<br>
for some recipes.<br>
I don&#39;t have a lot of info yet, just finished bisecting.<br>
<br>
The issue I see is with &quot;audiofile&quot; recipe from meta-oe that I wa=
nted to<br>
debug with master branch: with this patch the -src package is empty.<br>
Without it, it is populated fine. I guess there are other recipes also,<br>
but that&#39;s what I stumbled upon.<br></blockquote><div><br></div><div>It=
&#39;s an old package, I wonder if it has a mind of its own when it comes t=
o compiler</div><div>flags. I don&#39;t see anything in the recipe metadata=
 that leads towards the issue.</div><div>I wonder if this recipe can be dro=
pped going forward.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Will try to look at it, but if you have any ideas, I&#39;m all ears. But in=
<br>
any case, FYI.<br>
<br>
On 4/21/25 19:29, Khem Raj via <a href=3D"http://lists.openembedded.org" re=
l=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; -ffile-prefix map is more comprehensive when it comes to reproducible<=
br>
&gt; builds and its superset of all prefix-mapping options in compilers<br>
&gt;<br>
&gt; This makes is cleaner and workable across gcc and clang, clang does no=
t<br>
&gt; support -fcanon-prefix-map and it has to be explicitly omitted when us=
ing<br>
&gt; clang.<br>
&gt;<br>
&gt; There are lambdas generated in templates by clang which still get the<=
br>
&gt; absolute paths despite -fdebug-prefix-map, this helps with that as wel=
l.<br>
&gt;<br>
&gt; nasm is an outlier and we have fixed it by adding -fdebug-prefix-map o=
ption<br>
&gt; luckily we do not pass DEBUG_PREFIX_MAP to nasm, in all recipes which =
use<br>
&gt; nasm either pass -fdebug-prefix-map explicitly to nasm or they rewrite=
 it<br>
&gt; to use nasm flags syntax.<br>
&gt;<br>
&gt; We have discussed this in past [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patc=
h/20230428032030.2047920-1-raj.khem@gmail.com/#10281" rel=3D"noreferrer" ta=
rget=3D"_blank">https://patchwork.yoctoproject.org/project/oe-core/patch/20=
230428032030.2047920-1-raj.khem@gmail.com/#10281</a><br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com" target=3D=
"_blank">jacob.kroon@gmail.com</a>&gt;<br>
&gt; Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=
=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Drop using --ffile-prefix in go<br>
&gt; v3: Fix copydebugsources to use --file-prefix-map instead of -fdebug-p=
refix-map<br>
&gt;=C2=A0 =C2=A0 =C2=A0and few more places<br>
&gt;<br>
&gt;=C2=A0 meta/classes-recipe/kernel-arch.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++----<br>
&gt;=C2=A0 meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++---=
------<br>
&gt;=C2=A0 meta/lib/oe/package.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
&gt;=C2=A0 meta/recipes-devtools/gcc/libgfortran.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-maturin_1.8.3.bb" rel=3D"no=
referrer" target=3D"_blank">python3-maturin_1.8.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 meta/recipes-devtools/rust/<a href=3D"http://cargo_1.85.1.bb" re=
l=3D"noreferrer" target=3D"_blank">cargo_1.85.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 6 files changed, 11 insertions(+), 17 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-re=
cipe/kernel-arch.bbclass<br>
&gt; index 968551267f9..7aea9cd3e8e 100644<br>
&gt; --- a/meta/classes-recipe/kernel-arch.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel-arch.bbclass<br>
&gt; @@ -73,10 +73,8 @@ HOST_OBJCOPY_KERNEL_ARCH ?=3D &quot;${TARGET_OBJCOP=
Y_KERNEL_ARCH}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 KERNEL_CC =3D &quot;${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_=
ARCH} \<br>
&gt;=C2=A0 =C2=A0-fuse-ld=3Dbfd ${DEBUG_PREFIX_MAP} \<br>
&gt; - -fdebug-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \<br=
>
&gt; - -fmacro-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \<br=
>
&gt; - -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH}=
 \<br>
&gt; - -fmacro-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH}=
 \<br>
&gt; + -ffile-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \<br>
&gt; + -ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH} =
\<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 KERNEL_LD =3D &quot;${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}&=
quot;<br>
&gt;=C2=A0 KERNEL_AR =3D &quot;${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}&quot=
;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 8f90026f7c2..b4e1964f77d 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install =3D &quot;${PA=
RALLEL_MAKEINST} &quot;<br>
&gt;=C2=A0 ################################################################=
##<br>
&gt;=C2=A0 TARGET_DBGSRC_DIR ?=3D &quot;/usr/src/debug/${PN}/${PV}&quot;<br=
>
&gt;=C2=A0 # Beware: applied last to first<br>
&gt; -DEBUG_PREFIX_MAP ?=3D &quot;-fcanon-prefix-map \<br>
&gt; - -fmacro-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \<br>
&gt; - -fdebug-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \<br>
&gt; - -fmacro-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \<br>
&gt; - -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \<br>
&gt; - -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt; - -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt; - -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
&gt; - -fmacro-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
&gt; +DEBUG_PREFIX_MAP ?=3D &quot;\<br>
&gt; + -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \<br>
&gt; + -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \<br>
&gt; + -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt; + -ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 DEBUG_LEVELFLAG ?=3D &quot;-g&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
&gt; index 0db14f21642..0bcc04ea54a 100644<br>
&gt; --- a/meta/lib/oe/package.py<br>
&gt; +++ b/meta/lib/oe/package.py<br>
&gt; @@ -991,7 +991,7 @@ def copydebugsources(debugsrcdir, sources, d):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefixmap =3D {}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for flag in cflags.split():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not flag.startswith(&quo=
t;-fdebug-prefix-map&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not flag.startswith(&quo=
t;-ffile-prefix-map&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;recipe-sysroo=
t&quot; in flag:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt; diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-=
devtools/gcc/libgfortran.inc<br>
&gt; index 4560421ed1f..fa6aecaaa30 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/libgfortran.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/libgfortran.inc<br>
&gt; @@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS =3D &quot;\<br>
&gt;=C2=A0 # An arm hard float target like raspberrypi4 won&#39;t build<br>
&gt;=C2=A0 # as CFLAGS don&#39;t make it to the fortran compiler otherwise<=
br>
&gt;=C2=A0 # (the configure script sets FC to $GFORTRAN unconditionally)<br=
>
&gt; -export GFORTRAN =3D &quot;${FC} -fcanon-prefix-map -fdebug-prefix-map=
=3D${S}=3D${TARGET_DBGSRC_DIR} -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_=
DIR} -gno-record-gcc-switches&quot;<br>
&gt; +export GFORTRAN =3D &quot;${FC} -ffile-prefix-map=3D${S}=3D${TARGET_D=
BGSRC_DIR} -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} -gno-record-gcc-=
switches&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_configure () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for target in libbacktrace libgfortran<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-ma=
turin_1.8.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.8.3.=
bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1.8=
.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.8.3.bb</a><br=
>
&gt; index 3ec4d0c103b..08975e177f0 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1=
.8.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.8.3.bb</a><=
br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1=
.8.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.8.3.bb</a><=
br>
&gt; @@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D &quot;304762f86fd53a8031b1bf0=
06d12572a2aa0a5235485031113195cc015<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/maturin-${PV}&quot;<br>
&gt;=C2=A0 <br>
&gt; -CFLAGS +=3D &quot;-fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSR=
C_DIR}/cargo_home&quot;<br>
&gt; +CFLAGS +=3D &quot;-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC=
_DIR}/cargo_home&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-setuptools-rust-native \<br>
&gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.85.1=
.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.85.1.bb</a> b/meta/recipe=
s-devtools/rust/<a href=3D"http://cargo_1.85.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">cargo_1.85.1.bb</a><br>
&gt; index db18ecfda9a..150c2d2b801 100644<br>
&gt; --- a/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.85.1.bb" re=
l=3D"noreferrer" target=3D"_blank">cargo_1.85.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.85.1.bb" re=
l=3D"noreferrer" target=3D"_blank">cargo_1.85.1.bb</a><br>
&gt; @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY =3D &quot;${RUSTSRC}/vendo=
r&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit cargo pkgconfig<br>
&gt;=C2=A0 <br>
&gt; -DEBUG_PREFIX_MAP +=3D &quot;-fdebug-prefix-map=3D${RUSTSRC}/vendor=3D=
${TARGET_DBGSRC_DIR}&quot;<br>
&gt; +DEBUG_PREFIX_MAP +=3D &quot;-ffile-prefix-map=3D${RUSTSRC}/vendor=3D$=
{TARGET_DBGSRC_DIR}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_cargo_setup_snapshot () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${UNPACKDIR}/rust-snapshot-components/${CARG=
O_SNAPSHOT}/install.sh --prefix=3D&quot;${WORKDIR}/${CARGO_SNAPSHOT}&quot; =
--disable-ldconfig<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#215180): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/215180" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/215180</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11237963=
5/6084445" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/112379635/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:skandigraun@gmail.com=
" target=3D"_blank">skandigraun@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div></div>

--0000000000001331470643e42c8a--


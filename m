Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA15C531F7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 16:58:00 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1539.1784825877068287902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 09:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d7eHBE5X;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66893db7bccso786143d50.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784825876; cv=none;
        d=google.com; s=arc-20260327;
        b=e27R2J0T8qePnMscAqPagvOZjGt+kU8hSRlbaBui9zlWy2BI19kihQjW/ICJ1dxNR0
         YmyGWv8XFM1xDw7wpJzflF7BSUktejYV5R7Mi4cL3gDj6ykLhBC3C8IFppDTuRWjY7yz
         wHVZaNB9AErGAz3asEtb7dwxvXBYg9Cpwh4O+jStTGCMCRY/GbmjjkLu+5D+vNj1iNVX
         m67mHSpr+MSn+VHHf0o1HuPdaU8sCTHqndetFYtU6WqO9B91ZuYxRHxIWNq/4vz7KzC2
         01A+mLo2JUadpq42C7j6mEqaE96BtHxQf9alaSMO7YsZvItMwpHeujuhGhoZu/q5rHWQ
         ym8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bJD7xiCnRBi7Hr7XsYnzM+oXIu0/ZQkdo8MvRsT9ctE=;
        fh=Oyp0vZkthY33qxuTu49euvFnXWw2uEogdk3yUFh22TY=;
        b=XXLiQTN90k8BM9Li3KyiRYpI/vfkYPILrnyhsYloa2otFSRk7IthXhKeVE2jh2MiBI
         RM7jbW5o0RZacYH2WOj3OzyM9JQQnlce6Bi9NZH4F2wadvRXddezHBCu0hs2cqVRQGI+
         kLxGD5nkSxa6z2J8EPx1VUMJXq/pqmi1VwnpZZaZAlBVspQZu0EXSnItA9kmlmVcbXUR
         FWGMHknNN+ziCLupFk/biOfR+q4DhiCsECukYJgUFZSjaEPA53BcEJWFGCoV5xW/AFbQ
         yfJ68xhdKC79PrEgZ6cCVG3cqAXq81klVFiLocG/wOVt8ibRaby/ASagG6Sh4b/cyaRk
         D5MQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784825876; x=1785430676; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJD7xiCnRBi7Hr7XsYnzM+oXIu0/ZQkdo8MvRsT9ctE=;
        b=d7eHBE5XmZhpTboJZbw4St3dwXSdXyCiXXCeqP+b6LVJu+rxpq8dUkILUvMYIT/xNG
         0QCFjUV9C/9/VzoUFJLNi6ngPI9Fqk0owOeZk6CcerqDv237HHsPiClsR2iJrag1cwni
         gfnVf6LuoB7ogdlyGx+1KR6EmSoZOogNp2ijAfuxkHcWfxHkmUgMf6WYHpMMeuaiQYAo
         gmITe4u0FJZ+PhrtsMv+cb8EpMiAwGcIFFtwvjenc4eG3MoqCEcxJCyPyCnRvnqxRrsX
         +3H+/1eiCKSmc8/3K6MG91tcrL4cMcITnt7+mFfrxOaZDDsTVD9p8THsGxjTR9qMed/f
         Aq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784825876; x=1785430676;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bJD7xiCnRBi7Hr7XsYnzM+oXIu0/ZQkdo8MvRsT9ctE=;
        b=S/Z4KRAgHkS7kmSjgMf3ASgz0eTbbITgzE+YpIj8kFz/E96o1+RQATjJyrvUskW4G4
         u8O4MRisKeI9YslRBGtgRkxi2OzyuF//xy7k04IIOKlm7Wftb+SclrGh2U0lz2Rm2fmB
         998yReNBBMb5HMp7e6sMc76W5a+kAkevXjNa94yaCz4mqPm5BTL1AsGCOmkfIqTO1Cz8
         6jnYISOmFayigCQ5wBIxagf0Sozo8agVqR7LDebNYKriUqORrRrNPU1Q86FygYCaOGy+
         LNSMoQVENYUcVlUwS75hctNzrcuhnpZN3eq7s2lWlY4R3zWufwVchfc7Mjj9fJJlMS92
         z4Sw==
X-Gm-Message-State: AOJu0YxnT8fBSLIlT59fstXn2soLa7s9zgw6js6I3gvsnMvtEbwT6G+b
	UZstTVsNy8Ddkh/qHw4YtEmKF1R603jS91imHMe9bHnnM23s8+7ecRFi65OeFr/yhnIC5rV/14o
	bU1Lg+TntNNfO+e6b7zetgLfenuF7TW4=
X-Gm-Gg: AR+sD10vQc/s3zo5A6l6h/sjDMCHRrXieaLwqX4N+2pdrORRep16aXFOaOylohCcwgC
	ZIxmCOa6jlMP6zI5QATrFcUDembYt6uqsEg/ULGy02wXzZzgpYDC58NvtzJNzz1qK4Ag4kTWk+W
	J8WTVehryxLAqnHB4wEL65tkt3fL1WombCTb+BslSuYDagdA1yZJH2E1to7ZPLPXuXWzx7NMIbR
	8zAUhdKcWGHsBuZFhVSSnKOCfmzjRDQe8q4doRO5w4MOcXhbqKFmC4vYoMQLn9q6xE5eWuzf78O
	c+uBNYR54t3gyXkGmv0Rzbtv3/uy7+s41rj3fmSkSNNMs3cHtW7pCbtlzGbW0ucprXLIhxbAnmt
	wkriXO2N11DUTj6+UHEXJKhaSY2TIcgdPfG9sY0mEu8BOQO0luOCw4IASsoHle7F1tgtcAI0=
X-Received: by 2002:a53:9004:0:b0:667:e51a:118e with SMTP id
 956f58d0204a3-668a4bb3a53mr872271d50.15.1784825875692; Thu, 23 Jul 2026
 09:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260722215737.1940382-1-khem.raj@oss.qualcomm.com>
 <20260722215737.1940382-2-khem.raj@oss.qualcomm.com> <DK63FRAJRSGX.FKZ2NYM616PN@bootlin.com>
In-Reply-To: <DK63FRAJRSGX.FKZ2NYM616PN@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jul 2026 09:57:29 -0700
X-Gm-Features: AUfX_mzHgwYhC0AvDwaDynLyrdMSKsd0fxEMJBbCFCt0-o-RsbrPIx6P3i6aYXQ
Message-ID: <CAMKF1soyoYh_tiyHX9u5DewpRaqpLc=ubuwO3uc1x9zeE7VPbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/4] libpsl: convert to meson build system
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000004e83c006574a2899"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 16:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241865

--0000000000004e83c006574a2899
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 9:33=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Wed Jul 22, 2026 at 11:57 PM CEST, Khem Raj via lists.openembedded.org
> wrote:
> > Switch the recipe from autotools to meson:
> >
> > - inherit meson instead of autotools; drop gettext (the meson build has
> >   no i18n)
> > - Map the PACKAGECONFIG knobs to meson options: --enable-runtime=3DX
> >   becomes -Druntime=3DX, and builtin PSL data stays enabled via meson's
> >   default (-Dbuiltin=3Dtrue), matching the previous --enable-builtin.
> > - Disable the bundled tests and fuzzers with -Dtests=3Dfalse.
> > - The gtk-doc class drives -Ddocs on its own via GTKDOC_MESON_OPTION.
> >
> > Unlike the autotools tarball, meson regenerates psl.1 at build time and
> > stamps it with `date +%B %Y`, which is not reproducible. Backport the
> > proposed upstream fix to honour SOURCE_DATE_EPOCH.
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
>
> Hi Khem,
>
> > --- a/meta/recipes-support/libpsl/libpsl_0.23.0.bb
> > +++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
> > @@ -12,15 +12,18 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D49296c1806ef92c28297fb264163d81e \
> >                      "
> >
> >  SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
> > +           file://0001-Support-reproducible-builds.patch \
> >             "
> >  SRC_URI[sha256sum] =3D
> "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
> >
> >  GITHUB_BASE_URI =3D "https://github.com/rockdaboot/libpsl/releases"
> >
> > -inherit autotools gettext gtk-doc manpages pkgconfig lib_package
> github-releases
> > +inherit meson gtk-doc pkgconfig lib_package github-releases manpages
> > +
> > +# Do not build the bundled tests and fuzzers.
> > +EXTRA_OEMESON =3D "-Dtests=3Dfalse"
> >
> >  PACKAGECONFIG ?=3D "idn2"
> > -PACKAGECONFIG[manpages] =3D "--enable-man,--disable-man,libxslt-native=
"
>
> It looks like we have some user of this PACKAGECONFIG:
>
> ERROR: libpsl-0.23.0-r0 do_configure: QA Issue: libpsl: invalid
> PACKAGECONFIG(s): manpages [invalid-packageconfig]
> ERROR: libpsl-0.23.0-r0 do_configure: Fatal QA errors were found, failing
> task.
>

yeah this is because of inheriting manpages perhaps. I will take a look.

>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4039
>
> Looking at oe-core it's not obvious to me where it comes from, and why
> we have this error. I also note I did not reproduce it locally on a
> quick test, maybe we have to use a specific configuration.
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000004e83c006574a2899
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 23,=
 2026 at 9:33=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathie=
u.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed Jul 22=
, 2026 at 11:57 PM CEST, Khem Raj via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
&gt; Switch the recipe from autotools to meson:<br>
&gt;<br>
&gt; - inherit meson instead of autotools; drop gettext (the meson build ha=
s<br>
&gt;=C2=A0 =C2=A0no i18n)<br>
&gt; - Map the PACKAGECONFIG knobs to meson options: --enable-runtime=3DX<b=
r>
&gt;=C2=A0 =C2=A0becomes -Druntime=3DX, and builtin PSL data stays enabled =
via meson&#39;s<br>
&gt;=C2=A0 =C2=A0default (-Dbuiltin=3Dtrue), matching the previous --enable=
-builtin.<br>
&gt; - Disable the bundled tests and fuzzers with -Dtests=3Dfalse.<br>
&gt; - The gtk-doc class drives -Ddocs on its own via GTKDOC_MESON_OPTION.<=
br>
&gt;<br>
&gt; Unlike the autotools tarball, meson regenerates psl.1 at build time an=
d<br>
&gt; stamps it with `date +%B %Y`, which is not reproducible. Backport the<=
br>
&gt; proposed upstream fix to honour SOURCE_DATE_EPOCH.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Khem,<br>
<br>
&gt; --- a/meta/recipes-support/libpsl/<a href=3D"http://libpsl_0.23.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libpsl_0.23.0.bb</a><br>
&gt; +++ b/meta/recipes-support/libpsl/<a href=3D"http://libpsl_0.23.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libpsl_0.23.0.bb</a><br>
&gt; @@ -12,15 +12,18 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D49=
296c1806ef92c28297fb264163d81e \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Support-reproduc=
ible-builds.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;f39b9631b3d369a21259ea4654f8875c0ec=
6995ce9551c0eb5d423e4c011f911&quot;<br>
&gt;<br>
&gt;=C2=A0 GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/rockdabo=
ot/libpsl/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rockdaboot/libpsl/releases</a>&quot;<br>
&gt;<br>
&gt; -inherit autotools gettext gtk-doc manpages pkgconfig lib_package gith=
ub-releases<br>
&gt; +inherit meson gtk-doc pkgconfig lib_package github-releases manpages<=
br>
&gt; +<br>
&gt; +# Do not build the bundled tests and fuzzers.<br>
&gt; +EXTRA_OEMESON =3D &quot;-Dtests=3Dfalse&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ?=3D &quot;idn2&quot;<br>
&gt; -PACKAGECONFIG[manpages] =3D &quot;--enable-man,--disable-man,libxslt-=
native&quot;<br>
<br>
It looks like we have some user of this PACKAGECONFIG:<br>
<br>
ERROR: libpsl-0.23.0-r0 do_configure: QA Issue: libpsl: invalid PACKAGECONF=
IG(s): manpages [invalid-packageconfig]<br>
ERROR: libpsl-0.23.0-r0 do_configure: Fatal QA errors were found, failing t=
ask.<br></blockquote><div><br></div><div>yeah this is because of inheriting=
 manpages perhaps. I will take a look.=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/buil=
ds/4039" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/17/builds/4039</a><br>
<br>
Looking at oe-core it&#39;s not obvious to me where it comes from, and why<=
br>
we have this error. I also note I did not reproduce it locally on a<br>
quick test, maybe we have to use a specific configuration.<br>
<br>
Can you have a look at the issue?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000004e83c006574a2899--


Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55C7C30653
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 09:07:28 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.21478.1719392841063838909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 02:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b7AGdoIy;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-424ad289912so4581445e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719392839; x=1719997639; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zvtG1WbeHN0KBewFxiPLtbVg2GcYz0FD0KObMklZLNI=;
        b=b7AGdoIyTpi6F4RW5C4fPngqnPpo2bJoxAHG6aZm9RFW4FOFki+31fd5skpssBZQE2
         gxX9qIaoYMIKoFWNjWiQsTwaLu7w+r545COaxsPfW46uRwFpZX+Z6EpX14mDqqso6GaG
         c2DY3VPPq6Dz6mrX9+IA7jBRGf9lz2PyGIusqXLFSnYC17z0SlOR7+uKwW6i0sNwmjOe
         79zoZnCdpG0eTYXZRIP16BGFIC9p+T7YtIoTDUhvjwE2hxQADR3Cdzzm9EldiQ1gSdAk
         /gicrRrosPYbI3g9wvwLF8oEHg5d4LYF2CrSXo2BDqS2c3j6tOC47wVHsoHBAgVPk6zA
         7Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719392839; x=1719997639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvtG1WbeHN0KBewFxiPLtbVg2GcYz0FD0KObMklZLNI=;
        b=pEJGUdHGMqClrLaNoUsb9SA3h0ZAKa0OT7h97GN9efTLqV97haBOLRgfv/nMdvYW1/
         Sb0QZSp2QTgd09d185z4Cp5pZAzo+M3HAhlQoM1NYQK41FoZdtd8ohCqx4qP5gpHEzai
         VtTzLg2UbFIsK264uw7btZk2hYqNjYdC64A7iRJkea10Mh6MPib4UomGuL2JxFKV/NSs
         nwfzcW5j6hoKXILbu8k+2R0sP1HwyyiJIlC8j43kHse3UtdwEF2PCaH7rWiRoVMv3l5/
         FJyxDWC8oReZW7s6KusX6wK+ne5V5BRD5zU8eijiWj+QbBuRJaR0X2mwhFrkN/99HgEh
         NExw==
X-Gm-Message-State: AOJu0Yw0oloHMCBHBKhG8YePl12ggMPU/W/auV00fMrrUSqmApN4kxkC
	izVQTRvAAB+ZBbvgwGkgQFK2P6p11pto7dNJFFKK8/AgWMBt0vwYbBI62SEvn7yMcKwRf+ghQuk
	3RZNN/279GnF1wq/geV7wZDY0EEc=
X-Google-Smtp-Source: AGHT+IEv1CMh5t3H+KiYLawYdo0dv3Fi8snaqyDh+wu87dlMlMlJH42ojx0FMKasfKzwcBlpfq4xDpPo4wCPWNfIFX0=
X-Received: by 2002:a05:6000:178c:b0:366:e9f5:7814 with SMTP id
 ffacd0b85a97d-366e9f578a4mr7934771f8f.42.1719392838675; Wed, 26 Jun 2024
 02:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240625191513.22142-1-sreejith.ravi087@gmail.com> <77c5ad08b533613dbc8d57fdf565d53a373160d2.camel@linuxfoundation.org>
In-Reply-To: <77c5ad08b533613dbc8d57fdf565d53a373160d2.camel@linuxfoundation.org>
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
Date: Wed, 26 Jun 2024 10:07:07 +0100
Message-ID: <CAFt4JuG1QWoyoi0gja4hNVb9NYeiGo=DQ2_a=ijz1XUZK6regA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: Add Requires.private field in package_do_pkgconfig()
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000060f2a7061bc75745"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 09:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201154

--00000000000060f2a7061bc75745
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No, static libraries were not enabled. I am using only the -dev IPK, which
has only the shared libraries. With this change, it is successfully
building. Also, if it links to the static library, it will fail as I am not
installing the static IPK.

In the latest pkgconf commit, it looks like Requires.private is needed for
header inclusion also:
https://github.com/pkgconf/pkgconf/commit/2d26db3a984e7a69cedc6274c22119de4=
bcf1b40

Cheers
Sreejith

On Tue, Jun 25, 2024 at 10:41=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2024-06-25 at 19:15 +0000, Sreejith Ravi via
> lists.openembedded.org wrote:
> > Currently, the package_do_pkgconfig() only handles the "Requires" key
> > field from the .pc file and ignores the "Requires.private" field while
> > generating the dev dependency chain. This results in a broken dependenc=
y
> > list and requires the installation of recommended packages to resolve
> > the build dependencies when using the dev IPKs. This increases the
> > hard disk space usage and download time and installs many unnecessary
> > packages as part of the recommendations.
> >
> > This patch ensures that the "Requires.private" field is also considered
> > when creating the dependency list for the dev IPKs. With this, the dev
> > IPK will have the proper dependencies listed, eliminating the need to
> > install recommended packages to resolve the build time dependencies.
> >
> > Example: usr/lib/pkgconfig/libical.pc
> > ----------
> > Libs: -L${libdir} -lical -licalss -licalvcal
> > Libs.private: -lpthread
> > Requires.private: icu-i18n
> > ----------
> > Depends field generated for libical-dev
> > Depends: glib-2.0-dev, libical (=3D 3.0.7-r0)
> > ------------
> >
> > When trying to resolve the build time dependency with libical
> > package using =E2=80=9C-dev=E2=80=9D ipk generated, it will throw the b=
elow error.
> > -----------
> > Package icu-i18n was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `icu-i18n.pc'
> > to the PKG_CONFIG_PATH environment variable
> > Package 'icu-i18n', required by 'libical', not found
> > -----------
> >
> > This patch will fix the broken dependency list.
> >
> > -------
> > libical-dev depends field generated with this patch
> > Depends: glib-2.0-dev, icu-dev, libical (=3D 3.0.7-r0)
> > -------
> >
> > Other examples of packages generated with broken dev dependency.
> >
> > libflac-dev : https://packages.debian.org/sid/libflac-dev
> > Without patch:
> > Depends: flac (=3D 1.3.3-r0), libflac, libflac++
> > with patch:
> > Depends: flac (=3D 1.3.3-r0), libflac, libflac++, libogg-dev
> >
> > libglib2.0-dev : https://packages.debian.org/buster/libglib2.0-dev
> > without patch:
> > Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev
> > with patch:
> > Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev,
> >          util-linux-dev, zlib-dev
> >
> > Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
> > ---
> >  meta/classes/package.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclas=
s
> > index 67351b2510..084fe428e5 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -2182,7 +2182,7 @@ python package_do_pkgconfig () {
> >                          if m:
> >                              hdr =3D m.group(1)
> >                              exp =3D pd.expand(m.group(2))
> > -                            if hdr =3D=3D 'Requires':
> > +                            if hdr =3D=3D 'Requires' or hdr =3D=3D
> 'Requires.private':
> >                                  pkgconfig_needed[pkg] +=3D
> exp.replace(',', ' ').split()
> >                                  continue
> >                          m =3D var_re.match(l)
> >
>
>
> As I understand it, Requires.private are only needed for static linking
> so shouldn't this dependency just be added to the -staticdev package?
> The -dev package wouldn't contain a static library anyway. Did you have
> static libraries enabled?
>
> Cheers,
>
> Richard
>
>
>

--00000000000060f2a7061bc75745
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, static libraries were not enabled. I am using only the=
 -dev IPK, which has only the shared libraries. With this change, it is suc=
cessfully building. Also, if it links to the static library, it will fail a=
s I am not installing the static IPK.<br><br>In the latest pkgconf commit, =
it looks like Requires.private is needed for header inclusion also:<br><a h=
ref=3D"https://github.com/pkgconf/pkgconf/commit/2d26db3a984e7a69cedc6274c2=
2119de4bcf1b40">https://github.com/pkgconf/pkgconf/commit/2d26db3a984e7a69c=
edc6274c22119de4bcf1b40</a><br><div><br></div><div>Cheers</div><div>Sreejit=
h</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Jun 25, 2024 at 10:41=E2=80=AFPM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, 2024-06-25 at 19:15 +0000, Sreejith Ravi via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; Currently, the package_do_pkgconfig() only handles the &quot;Requires&=
quot; key<br>
&gt; field from the .pc file and ignores the &quot;Requires.private&quot; f=
ield while<br>
&gt; generating the dev dependency chain. This results in a broken dependen=
cy<br>
&gt; list and requires the installation of recommended packages to resolve<=
br>
&gt; the build dependencies when using the dev IPKs. This increases the<br>
&gt; hard disk space usage and download time and installs many unnecessary<=
br>
&gt; packages as part of the recommendations.<br>
&gt; <br>
&gt; This patch ensures that the &quot;Requires.private&quot; field is also=
 considered<br>
&gt; when creating the dependency list for the dev IPKs. With this, the dev=
<br>
&gt; IPK will have the proper dependencies listed, eliminating the need to<=
br>
&gt; install recommended packages to resolve the build time dependencies.<b=
r>
&gt; <br>
&gt; Example: usr/lib/pkgconfig/libical.pc<br>
&gt; ----------<br>
&gt; Libs: -L${libdir} -lical -licalss -licalvcal<br>
&gt; Libs.private: -lpthread<br>
&gt; Requires.private: icu-i18n<br>
&gt; ----------<br>
&gt; Depends field generated for libical-dev<br>
&gt; Depends: glib-2.0-dev, libical (=3D 3.0.7-r0)<br>
&gt; ------------<br>
&gt; <br>
&gt; When trying to resolve the build time dependency with libical<br>
&gt; package using =E2=80=9C-dev=E2=80=9D ipk generated, it will throw the =
below error.<br>
&gt; -----------<br>
&gt; Package icu-i18n was not found in the pkg-config search path.<br>
&gt; Perhaps you should add the directory containing `icu-i18n.pc&#39;<br>
&gt; to the PKG_CONFIG_PATH environment variable<br>
&gt; Package &#39;icu-i18n&#39;, required by &#39;libical&#39;, not found<b=
r>
&gt; -----------<br>
&gt; <br>
&gt; This patch will fix the broken dependency list.<br>
&gt; <br>
&gt; -------<br>
&gt; libical-dev depends field generated with this patch<br>
&gt; Depends: glib-2.0-dev, icu-dev, libical (=3D 3.0.7-r0)<br>
&gt; -------<br>
&gt; <br>
&gt; Other examples of packages generated with broken dev dependency.<br>
&gt; <br>
&gt; libflac-dev : <a href=3D"https://packages.debian.org/sid/libflac-dev" =
rel=3D"noreferrer" target=3D"_blank">https://packages.debian.org/sid/libfla=
c-dev</a><br>
&gt; Without patch:<br>
&gt; Depends: flac (=3D 1.3.3-r0), libflac, libflac++<br>
&gt; with patch:<br>
&gt; Depends: flac (=3D 1.3.3-r0), libflac, libflac++, libogg-dev<br>
&gt; <br>
&gt; libglib2.0-dev : <a href=3D"https://packages.debian.org/buster/libglib=
2.0-dev" rel=3D"noreferrer" target=3D"_blank">https://packages.debian.org/b=
uster/libglib2.0-dev</a><br>
&gt; without patch:<br>
&gt; Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev<br>
&gt; with patch:<br>
&gt; Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev,<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 util-linux-dev, zlib-=
dev<br>
&gt; <br>
&gt; Signed-off-by: Sreejith Ravi &lt;<a href=3D"mailto:sreejith.ravi087@gm=
ail.com" target=3D"_blank">sreejith.ravi087@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/package.bbclass | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcla=
ss<br>
&gt; index 67351b2510..084fe428e5 100644<br>
&gt; --- a/meta/classes/package.bbclass<br>
&gt; +++ b/meta/classes/package.bbclass<br>
&gt; @@ -2182,7 +2182,7 @@ python package_do_pkgconfig () {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if m:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 hdr =3D m.group(1)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 exp =3D pd.expand(m.group(2))<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if hdr =3D=3D &#39;Requires&#39;:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if hdr =3D=3D &#39;Requires&#39; or hdr =3D=3D &#39;Requ=
ires.private&#39;:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgconfig_needed[pkg] +=3D=
 exp.replace(&#39;,&#39;, &#39; &#39;).split()<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 m =3D var_re.match(l)<br>
&gt; <br>
<br>
<br>
As I understand it, Requires.private are only needed for static linking<br>
so shouldn&#39;t this dependency just be added to the -staticdev package?<b=
r>
The -dev package wouldn&#39;t contain a static library anyway. Did you have=
<br>
static libraries enabled?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--00000000000060f2a7061bc75745--


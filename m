Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.2761.1603324921050442372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 17:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RBZPl35+;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id p88so3718700qtd.12
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 17:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVvMRKFhD1c2FQLlD/GTwMtFcCDjZdKFUzec9IwsAj0=;
        b=RBZPl35+0tIgy2BU+LEFdY95OqyGOCfwdRhd/H91cP1IW3+pcjOWuVs1gWlhtU5DGq
         OXESPSgox5KMLD3xQLwbsowhhaclq8lMJjMRPaWjt0SG/1RLkGlrmmPOb9ya0wcGn8NO
         JSdvwZpQcvIzTdi9evbc2eeScOZJ0XW7031dsOWeWHqsu72JJlnFNXY82ei6LO5wsbQk
         3wLIHMYjF1sCfLd0x9p5B6aw2z3VK+KzWNQcCGGVneK8v3NsR8Tg8Uc+HpoMDWJuiq4v
         zoB9SPaqBPYvE71g1oGiR58s3poZ3xIzsTnb71vyVTSpynilz5eGD6F1Jn3rHomKg+cr
         HKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVvMRKFhD1c2FQLlD/GTwMtFcCDjZdKFUzec9IwsAj0=;
        b=ku43IxmJhlC5OgJv8VULYLG3yWZkYung2P/MDy2UL+AZE20iUqENasNSvyaZapsi8e
         iQO2nX/ReSG0jrp/CFRgpe80USkaeZFPBOMyYOMMBcziYT8DC+EnuKo4RsdHNvg4/u5b
         B3JpUMWH5/xqbavXlbogHVzYjEim22RlSpddL0i5NijEsEcP0qsF59k2Ax1A4kEAT6yB
         8oL/2iQ62iJ7H98sX1l1RRPRua/MLWgzsJ4deiXbnv1BT23yRTK1G0usE0pGhtud0fze
         TVh8sA1NAffL3J+ZzFYqUNDyNS4LiQWyVzDO6ErBReSIqrRAXzYd3ZSFZcVhEJOEZpNR
         rWSA==
X-Gm-Message-State: AOAM532QNUzZf0iXnBm2eNBJRkO+Y2xiFyUwJGUrIpOO8KFD8ITb0M2E
	FIA0VcCs3svGbwvEYjOQB+zSxzqDtfxHVsdFphZ1jPrJI0E=
X-Google-Smtp-Source: ABdhPJw6fkAAr1bbHiBoc9MG7MzvMINzGOcvlU5am/mXblcYbRvTorTC4Ovq1qtye58KPzGlcX5GzMNR9gTWn+4GaBc=
X-Received: by 2002:ac8:3975:: with SMTP id t50mr5671464qtb.53.1603324919986;
 Wed, 21 Oct 2020 17:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201021210932.984184-1-raj.khem@gmail.com> <d4a88c9df72243f4e334d3b408200062b6113b59.camel@linuxfoundation.org>
In-Reply-To: <d4a88c9df72243f4e334d3b408200062b6113b59.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 21 Oct 2020 17:01:47 -0700
Message-ID: <CAMKF1sp+iH=H3yTPWSr_6iSJK2F0yDGBHk59K_zq4_6JYLwwUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] multilib_header.bbclass: Do not install the stubs for non-multilib case
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000050bde005b2372cf2"

--00000000000050bde005b2372cf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 2:47 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-10-21 at 14:09 -0700, Khem Raj wrote:
> > We mark certain headers which are not usable in multilib case through
> > this function, this however is a unnessary indirection when building
> > distros without multilib feature. Additionally it also addresses a
> > case
> > where we compile baremetal software e.g. bootloaders or BPF binaries
> > e.g. which are a different target effectively but can be built using
> > same toolchain with some flags. This does not work when we always
> > install the stubs since the stubs require a fixed wordsize definition
> > and that may not be true for the BPF cases e.g. it will work fine
> > when
> > multilib is enabled since that would have provided the headers it
> > needed
> > say for 32bit multilib. Currently they go missing for a non-multilib
> > case and we end up with errors like
> >
> > recipe-sysroot/usr/include/bits/long-double.h:23:10: fatal error:
> > 'bits/long-double-32.h' file
> > not found
> > > #include <bits/long-double-32.h>
> >
> > Therefore lets install these stubs only when using
> > multilib in distro
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/classes/multilib_header.bbclass | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/multilib_header.bbclass
> > b/meta/classes/multilib_header.bbclass
> > index e03f5b13b2..9ccdf46be5 100644
> > --- a/meta/classes/multilib_header.bbclass
> > +++ b/meta/classes/multilib_header.bbclass
> > @@ -6,7 +6,9 @@ inherit siteinfo
> >  # all of the ABI variants for that given architecture.
> >  #
> >  oe_multilib_header() {
> > -
> > +     if [ -z "${MULTILIB_VARIANTS}" ]; then
> > +             return
> > +     fi
> >       case ${HOST_OS} in
> >       *-musl*)
> >               return
>
> I have a feeling this was written specifically not to touch that
> variable so that a multilib build can reuse components from a non-
> multilib build and share the sstate if you configure it that way. This
> change would force *all* multilibs to be stores as their own sstate and
> require their own namespace.


In practice either you use multilib or you don=E2=80=99t such a usecase is =
not that
common besides perhaps testing scenarios and maybe some OS vendor test
farms which considers all sort of combinations

And in some cases e.g x86-64 BASELIB gets defined differently if you enable
multilib or not so I guess we already are not reusing sstate between non
multilib and multilib builds for same arch

>
>
> We may therefore have to find a different control for this :/.
>
> Cheers,
>
> Richard
>
>
>
>

--00000000000050bde005b2372cf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 21, 2020 at 2:47 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2020-=
10-21 at 14:09 -0700, Khem Raj wrote:<br>
&gt; We mark certain headers which are not usable in multilib case through<=
br>
&gt; this function, this however is a unnessary indirection when building<b=
r>
&gt; distros without multilib feature. Additionally it also addresses a<br>
&gt; case<br>
&gt; where we compile baremetal software e.g. bootloaders or BPF binaries<b=
r>
&gt; e.g. which are a different target effectively but can be built using<b=
r>
&gt; same toolchain with some flags. This does not work when we always<br>
&gt; install the stubs since the stubs require a fixed wordsize definition<=
br>
&gt; and that may not be true for the BPF cases e.g. it will work fine<br>
&gt; when<br>
&gt; multilib is enabled since that would have provided the headers it<br>
&gt; needed<br>
&gt; say for 32bit multilib. Currently they go missing for a non-multilib<b=
r>
&gt; case and we end up with errors like<br>
&gt; <br>
&gt; recipe-sysroot/usr/include/bits/long-double.h:23:10: fatal error:<br>
&gt; &#39;bits/long-double-32.h&#39; file<br>
&gt; not found<br>
&gt; &gt; #include &lt;bits/long-double-32.h&gt;<br>
&gt; <br>
&gt; Therefore lets install these stubs only when using<br>
&gt; multilib in distro<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/multilib_header.bbclass | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/multilib_header.bbclass<br>
&gt; b/meta/classes/multilib_header.bbclass<br>
&gt; index e03f5b13b2..9ccdf46be5 100644<br>
&gt; --- a/meta/classes/multilib_header.bbclass<br>
&gt; +++ b/meta/classes/multilib_header.bbclass<br>
&gt; @@ -6,7 +6,9 @@ inherit siteinfo<br>
&gt;=C2=A0 # all of the ABI variants for that given architecture.<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 oe_multilib_header() {<br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ -z &quot;${MULTILIB_VARIANTS}&quot; ]; then<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case ${HOST_OS} in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*-musl*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
I have a feeling this was written specifically not to touch that<br>
variable so that a multilib build can reuse components from a non-<br>
multilib build and share the sstate if you configure it that way. This<br>
change would force *all* multilibs to be stores as their own sstate and<br>
require their own namespace.</blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">In practice either you use multilib or you don=E2=80=99t such a=
 usecase is not that common besides perhaps testing scenarios and maybe som=
e OS vendor test farms which considers all sort of combinations=C2=A0</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">And in some cases e.g x86-64 =
BASELIB gets defined differently if you enable multilib or not so I guess w=
e already are not reusing sstate between non multilib and multilib builds f=
or same arch=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
We may therefore have to find a different control for this :/.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000050bde005b2372cf2--

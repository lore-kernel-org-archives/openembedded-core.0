Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web11.9706.1591174486147888979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 01:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pw82MKCW;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id c9so577277uao.11
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dgt5veKhKqQABiwKpnD3daDH1RUoVPNHPWYjlS8i8Rs=;
        b=pw82MKCWw6p3/L7N+1vzS9baKgubQn9jfVCKdWOGI9AQ+A4srmrhsPL7Mx7aGpb/qt
         JqpGMmzF/Lo2MwdihMMSjUzHPgjTZtHzGPYXnne9ZZmvmB0EKukT7nN6ZydtrSkxjbZe
         elA9xVJBfCTvMG14BLsZGejgXSSt6O3VObhR1jif0Pd2pQEfOhGkzIkgCX7rqX0WP8aN
         YCH+6x1vrtaB1Y1Vp5vsZCbUtI5v4sPaoJHMwnTEh77bbkHGywM6nmm9Xuy0Hv1k+G4P
         6DBIytT7vkH3Dp2dq2MPfxPI7uw2QxnV1a7tH9Xl8MUzyx8Yrb377N9vNJJ4P9o76p0l
         gafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dgt5veKhKqQABiwKpnD3daDH1RUoVPNHPWYjlS8i8Rs=;
        b=ZP67wuoK5iCuqKkxUHRVU041cAUw7+Cp6aExwPL8ljzWPqHTqP7DJpAYg2jsIHpnl4
         J/XFRdWRr85KBYv7103fg9CGh7NPnYAnEimw5dbcSFEbTo4wRcu5plWbtQ0GadpV8IjU
         SA+f3m9vNjI+gTPvUPWZC61f1CmNX1wVE7aWwRjTrQ0fizkTiHv9w56B3oZzsymCD/vT
         gGCtiKeV4IFjKSTKXJrGo3nJpzVNEioKgZOzxe3ywYNjPnbYoLfD+HJgRlviWvjsL7RL
         TQkYxeNAh1crMUkcwpPW0uoFmCEsIMjoVogPWHufYXNsfzkCiNweSGonzFTQQg/jsqnV
         SaXw==
X-Gm-Message-State: AOAM5319FogrSdD/wsjVbQuixLpX4OAort1JQ5urBhXx+Sr9ENjB9Vj/
	mFDbtsuq+mG9atnFButxC0lbO5X137VqB2f/lQY=
X-Google-Smtp-Source: ABdhPJyy55poaxZtxvXJGrPPYMbLDzASyJJBnV64lb5e+NZdETWH1Fjdi4e3U9hk0syjSQ3r+lSOHZVZCOu1vXN2FhQ=
X-Received: by 2002:a9f:326a:: with SMTP id y39mr3835475uad.93.1591174485316;
 Wed, 03 Jun 2020 01:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200603054858.6762-1-Qi.Chen@windriver.com> <84ee1d38f14362475fae9900f94794535a44bafd.camel@linuxfoundation.org>
In-Reply-To: <84ee1d38f14362475fae9900f94794535a44bafd.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 3 Jun 2020 10:54:33 +0200
Message-ID: <CANNYZj9LVxKhwUurdMyb2SZ5GwN-gVtFv_mrSN6jgyX2NmSvrg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] db: enable verify PACKAGECONFIG
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Chen Qi <Qi.Chen@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f9184f05a72a2df4"

--000000000000f9184f05a72a2df4
Content-Type: text/plain; charset="UTF-8"

By the way upcoming rpm 4.16 deprecates db backend in favor of ndb (not
sure what that uses exactly, but it's not berkeley db), and they're working
on sqlite support as well. So a major consumer of bdb should be eliminated,
and then we can look at moving bdb out of core, as it never got proper
upstream maintenance.

Alex

On Wed, 3 Jun 2020 at 10:41, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-06-03 at 13:48 +0800, Chen Qi wrote:
> > On target, when running `db_verify /var/lib/rpm/Packages', we get
> > the following error.
> >
> >   db_verify: BDB0571 library build did not include support for database
> verification
> >
> > Enable the 'verify' PACKAGECONFIG to avoid such issue.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-support/db/db_5.3.28.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/db/db_5.3.28.bb
> b/meta/recipes-support/db/db_5.3.28.bb
> > index 3a0923ae36..b64c4c089a 100644
> > --- a/meta/recipes-support/db/db_5.3.28.bb
> > +++ b/meta/recipes-support/db/db_5.3.28.bb
> > @@ -61,7 +61,7 @@ DB5_CONFIG ?= "--enable-o_direct
> --disable-cryptography --disable-queue --disabl
> >
> >  EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx
> --with-sysroot STRIP=true"
> >
> > -PACKAGECONFIG ??= ""
> > +PACKAGECONFIG ??= "verify"
> >  PACKAGECONFIG[verify] = "--enable-verify, --disable-verify"
> >  PACKAGECONFIG[dbm] = "--enable-dbm,--disable-dbm,"
>
> Do we ever need to run this on target? I'm wondering why we need this
> and what the implications are (extra size to the binaries?). Perhaps we
> just shouldn't ship that binary if verify isn't enabled?
>
> Cheers,
>
> Richard
>
> 
>

--000000000000f9184f05a72a2df4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>By the way upcoming rpm 4.16 deprecates db backend in=
 favor of ndb (not sure what that uses exactly, but it&#39;s not berkeley d=
b), and they&#39;re working on sqlite support as well. So a major consumer =
of bdb should be eliminated, and then we can look at moving bdb out of core=
, as it never got proper upstream maintenance.</div><div><br></div><div>Ale=
x<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, 3 Jun 2020 at 10:41, Richard Purdie &lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Wed, 2020-06-03 at 13:48 +0800, Chen Qi wrote:<br>
&gt; On target, when running `db_verify /var/lib/rpm/Packages&#39;, we get=
<br>
&gt; the following error.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0db_verify: BDB0571 library build did not include support =
for database verification<br>
&gt; <br>
&gt; Enable the &#39;verify&#39; PACKAGECONFIG to avoid such issue.<br>
&gt; <br>
&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" t=
arget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/db/<a href=3D"http://db_5.3.28.bb" rel=3D"=
noreferrer" target=3D"_blank">db_5.3.28.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/db/<a href=3D"http://db_5.3.28.bb" =
rel=3D"noreferrer" target=3D"_blank">db_5.3.28.bb</a> b/meta/recipes-suppor=
t/db/<a href=3D"http://db_5.3.28.bb" rel=3D"noreferrer" target=3D"_blank">d=
b_5.3.28.bb</a><br>
&gt; index 3a0923ae36..b64c4c089a 100644<br>
&gt; --- a/meta/recipes-support/db/<a href=3D"http://db_5.3.28.bb" rel=3D"=
noreferrer" target=3D"_blank">db_5.3.28.bb</a><br>
&gt; +++ b/meta/recipes-support/db/<a href=3D"http://db_5.3.28.bb" rel=3D"=
noreferrer" target=3D"_blank">db_5.3.28.bb</a><br>
&gt; @@ -61,7 +61,7 @@ DB5_CONFIG ?=3D &quot;--enable-o_direct --disable-c=
ryptography --disable-queue --disabl<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;${DB5_CONFIG} --enable-shared --enable-c=
xx --with-sysroot STRIP=3Dtrue&quot;<br>
&gt;=C2=A0 <br>
&gt; -PACKAGECONFIG ??=3D &quot;&quot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;verify&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[verify] =3D &quot;--enable-verify, --disable-veri=
fy&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[dbm] =3D &quot;--enable-dbm,--disable-dbm,&quot;<=
br>
<br>
Do we ever need to run this on target? I&#39;m wondering why we need this<=
br>
and what the implications are (extra size to the binaries?). Perhaps we<br=
>
just shouldn&#39;t ship that binary if verify isn&#39;t enabled?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--000000000000f9184f05a72a2df4--

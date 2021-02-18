Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.8733.1613662592708827299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 07:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r7zfnryA;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id v3so1652257qtw.4
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 07:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3HKPz4BG7hdV0UULYjXs/q97Gr5hC5u3RoSizrAj+6Q=;
        b=r7zfnryAY9D9pQVTXd7dnoPSEtmHVZSesO1EujGTBxi8snQXkc4mTbk1Jfaav9CX4W
         qzoyirBNzVV2J7ZDkrX5myQ0iP4uawovz5TV6eLgUqogbaSKgpqW4vENBHB8otntGkgx
         w3UORj4jJXAZshl1YOl0DaRLThD207GLUuOW9JB0q4CyqRMP8RHGQe/WGIlXPRubvlhE
         JreQvOMrnQW5gjjnwu617I2vdj3+/bRvEzHQUIt10IFY3SoLHxpltewW93Xy/rt6fRZI
         duUtZb9bS2i7WFec5aqm0/qXryd8ACBQNC3IEudSD0w7P2IQnm4PS0l8oD7pE2EOdOCE
         I+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3HKPz4BG7hdV0UULYjXs/q97Gr5hC5u3RoSizrAj+6Q=;
        b=RKwr9bDHMAxeBj9ox/Ch3/4XVLdfebTY/FQeO9xR2lUjrOkGjnkx/hfM9uXndhXawg
         at3a2QR63EzFKtVCQd7G9BoH55iGcCIpROe2s8ffm0aKNM7J9HykPTEZI5hizHqxvcBO
         BCkaznHua2DKiugYW+SXQTILxjCnPIsanI9xjB0OyTK6gUnou8iucaQX6jNQzpCVK2iN
         L1FQ5HAPxU1Aw4sDCBrxQua7Yn7kNL8G3K0onsFJ7M8nmogU6HxmzPITIN39u3CfEQt5
         UqWwfnlSviaXyD8CaRRtopgNkB4nJ/4q/9QYZS0eCRD1rV9xKhBmc6xQvTNvQX7rUdIc
         czJg==
X-Gm-Message-State: AOAM530YPU88aFlJ5yuxeg2o1dvNTk3/XDscAbAYsAH5Q0SYYcdsPhWD
	HHcOwz0DpIyyMJlMKw6Ta/jygvNGWp40Xd46chs=
X-Google-Smtp-Source: ABdhPJw7qsAnD+yWKOSshAppG45zCn6DEBn5Y6hlKgPCLdpp3+CFgA4cqY+95SoRqeub/aW5Tbk1WfFVtNf67O5NUHg=
X-Received: by 2002:ac8:7210:: with SMTP id a16mr4714611qtp.82.1613662591760;
 Thu, 18 Feb 2021 07:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20210218035220.3828246-1-raj.khem@gmail.com> <AM9PR09MB46420DA765CB5143252F750EA8859@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB46420DA765CB5143252F750EA8859@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Feb 2021 07:36:21 -0800
Message-ID: <CAMKF1srgBRXaZL_7tceYc8KWc25BKtu+gkZxdO9oEX9OBSid7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ruby: Do not use ucontext implementation for coroutines on musl/riscv
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000091bad205bb9e19c7"

--00000000000091bad205bb9e19c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don=E2=80=99t think it should be default since other options if implement=
ed will
perform better so it=E2=80=99s a last resort solution so I would suggest t=
o use it
only where it=E2=80=99s needed

On Thu, Feb 18, 2021 at 3:23 AM Konrad Weihmann <kweihmann@outlook.com>
wrote:

> I think I saw something similar on x86 builds (or was it arm32, don't
> remember) - so it might be worth discussing to make this setting the
> default and configurable to the user - thoughts?
>
> On 18.02.21 04:52, Khem Raj wrote:
> > The coroutine implementation in ruby has either arch specific
> > implementations or it falls back to slower ucontext API based
> > implementation assuming libc will provide the needed APIs, however mus=
l
> > does not implement ucontext APIs like glibc, therefore fallback is to
> > use libucontext library on musl. However, libucontext is not ported to
> > riscv yet. which means on musl/riscv ruby is unbuildable, however a
> > third option is to use copy implementation for coroutines, which will =
be
> > not as good performance-wise, but it will do the job, therefore for no=
w
> > use copy implementation for rv32/rv64 when using musl
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/recipes-devtools/ruby/ruby_3.0.0.bb | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/ruby/ruby_3.0.0.bb
> b/meta/recipes-devtools/ruby/ruby_3.0.0.bb
> > index 5e143ee87f..28e12c3cd7 100644
> > --- a/meta/recipes-devtools/ruby/ruby_3.0.0.bb
> > +++ b/meta/recipes-devtools/ruby/ruby_3.0.0.bb
> > @@ -32,6 +32,13 @@ EXTRA_OECONF_append_libc-musl =3D "\
> >       ac_cv_func_isinf=3Dyes \
> >   "
> >
> > +EXTRA_OECONF_append_libc-musl_riscv64 =3D "\
> > +    --with-coroutine=3Dcopy \
> > +"
> > +EXTRA_OECONF_append_libc-musl_riscv32 =3D "\
> > +    --with-coroutine=3Dcopy \
> > +"
> > +
> >   do_install() {
> >       oe_runmake 'DESTDIR=3D${D}' install
> >   }
> >
> >
> >
> >=20
> >
>

--00000000000091bad205bb9e19c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I don=E2=80=99t think it should be default since other op=
tions if implemented will perform better so it=E2=80=99s a last resort solu=
tion so I would suggest to use it only where it=E2=80=99s needed=C2=A0</div=
><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, Feb 18, 2021 at 3:23 AM Konrad Weihmann &lt;<a href=3D"mailto:kweih=
mann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">I think I saw something similar on x86 builds (or was i=
t arm32, don&#39;t <br>
remember) - so it might be worth discussing to make this setting the <br>
default and configurable to the user - thoughts?<br>
<br>
On 18.02.21 04:52, Khem Raj wrote:<br>
&gt; The coroutine implementation in ruby has either arch specific<br>
&gt; implementations or it falls back to slower ucontext API based<br>
&gt; implementation assuming libc will provide the needed APIs, however mu=
sl<br>
&gt; does not implement ucontext APIs like glibc, therefore fallback is to=
<br>
&gt; use libucontext library on musl. However, libucontext is not ported t=
o<br>
&gt; riscv yet. which means on musl/riscv ruby is unbuildable, however a<b=
r>
&gt; third option is to use copy implementation for coroutines, which will=
 be<br>
&gt; not as good performance-wise, but it will do the job, therefore for n=
ow<br>
&gt; use copy implementation for rv32/rv64 when using musl<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">ruby_3.0.0.bb</a> | 7 +++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">ruby_3.0.0.bb</a> b/meta/recipes-d=
evtools/ruby/<a href=3D"http://ruby_3.0.0.bb" rel=3D"noreferrer" target=3D"=
_blank">ruby_3.0.0.bb</a><br>
&gt; index 5e143ee87f..28e12c3cd7 100644<br>
&gt; --- a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">ruby_3.0.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">ruby_3.0.0.bb</a><br>
&gt; @@ -32,6 +32,13 @@ EXTRA_OECONF_append_libc-musl =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_func_isinf=3Dyes \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +EXTRA_OECONF_append_libc-musl_riscv64 =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 --with-coroutine=3Dcopy \<br>
&gt; +&quot;<br>
&gt; +EXTRA_OECONF_append_libc-musl_riscv32 =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 --with-coroutine=3Dcopy \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; install=
<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--00000000000091bad205bb9e19c7--

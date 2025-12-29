Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D28D3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 12:49:42 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42570.1767012580532105002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 04:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R/TW7VlR;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so9830428a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 04:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767012580; x=1767617380; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NpVz4Cu8zICnSJpWt5uzfTUMVdhTSdhX49UnN3WsqJ8=;
        b=R/TW7VlR8f++u3TPh5dvgOVhpyaHZTuLDKEBojwvK4T6IH44oBGiw9LGXFqA6pFfNA
         d4oFAddNgDFf6JK1tRe/uWXC2R4xiFn5GyJjZXbJxwRxqDM6VxMTm0V1mCDv176T35eQ
         PDF4RYGi11+4qaK/4YVg/fwedWyp/8kJrS4f7RTtsOl0tJDt7aycAAUIS85RW6tQWob4
         YhZeLkuBBTIPJTaePAEB5dE2e1u03PBYDc6cMPN0sFiUkjMIGrDUB4iozk9YiERkx9/U
         KiqqobLo78Q1u+43uYhEaLh340RLxZfEteOzZZI4QZBhZgLI0woAsf7M5y7waeZKLmI5
         fg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012580; x=1767617380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpVz4Cu8zICnSJpWt5uzfTUMVdhTSdhX49UnN3WsqJ8=;
        b=i+yM32wWQIwXqohMlVc+21HYdRBPs/XeKX6GAzOokd77h/Sr7hPZ/KuRUd87tqRfNV
         Y3aMZmIILcJQpQEXvH2HoC2vzrJ+NmCtuPGzUfXXdmKRDWifmyC+3WFn2TPgEOg0gfqx
         WhNG/mU5ZQcD7G+/4ssgT96xCmIPnFGVoSixaciiVV6XabzK8PWgNPsx56Nv+h22iNs0
         /7WJtUQwBPNhcZcKHyeRerRDC68ez0MZo8nKC9Hhl581JJo41zAzduFHYwcAJj+oUZNI
         Bvye/hnhyIDkenlVsRq28WdXAJwJE/lFoO9GzaU5DcykME2+WDbErZPs/qH4YpulJ+HC
         /J0Q==
X-Gm-Message-State: AOJu0Yyt3kCNDo9W9gUVxwYaL8xp8ur0wjiogVEfhGnRa2xGWVZeuLJU
	a0kEiltHWVITeAyoLwvJztN2Gjyx8nYRlHoYdTLfAMFThWU3BjrN+ULe9A1BnLqwMR56DsnGnQB
	9IEZ0XB3Gtz9gp4/Fjf0iuNEwy9gLdfQ=
X-Gm-Gg: AY/fxX64oDxEu5QpQ33WeTggwSoZ5MPuorlgdtKq7pMAMWEGwVLyIJZ/jHrJtuRZrTG
	sSc7cz8Qz3Jma1dJjt8nsROsXUQuj32MEnVcKhsITnGbyqgYwjXPailjz2GDCiFkTBMUqEUCG8t
	M6JrX4Sd4CUeBqJFu1lAjozQ4k9Ct6k8I7SpfIxTEF/3+vvjrjqq9jPNQU5llKykxWdMIvYltNT
	fmPJWU3F6j65yewERQOkcmTzO3O8opWxK4+7t4tnxYiS8vVa5+enT5tK1S4KUMKlZaMbg==
X-Google-Smtp-Source: AGHT+IEwJLrKTMwm59V1ECqcTWhjSliEc7pYN1Co7xdmtuUNZJ6iebWuuMCtU2VKyRSgeo0MS+v+SJtN1HjP9KN0h0Q=
X-Received: by 2002:a17:90b:2e8e:b0:340:ca7d:936a with SMTP id
 98e67ed59e1d1-34e921b0623mr26180066a91.18.1767012579717; Mon, 29 Dec 2025
 04:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
 <20251227113251.773795-11-Harish.Sadineni@windriver.com> <CADkTA4MO1Xxi_p+w6jV5ZCiVCG+QrK9o2KHucBK5TZruf1BjWQ@mail.gmail.com>
 <a0143cb6-96bf-4181-b1f4-df7db2e77563@windriver.com>
In-Reply-To: <a0143cb6-96bf-4181-b1f4-df7db2e77563@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Dec 2025 08:49:27 -0400
X-Gm-Features: AQt7F2rn_LaMzwjnyZrn1xFK6dGKUzOU-2GkJz6NffAH4HXF9AFy-udMaUuXnvc
Message-ID: <CADkTA4MCTJ+hpeGGOzS0eR+uTFJZ1N5QHLSd7NcQBRBWB1sd0g@mail.gmail.com>
Subject: Re: [PATCH 10/16] kernel-devsrc: copying rust-kernel source to $kerneldir/build
To: Harish Sadineni <Harish.Sadineni@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr, 
	elmehdi.younes@smile.fr
Content-Type: multipart/alternative; boundary="00000000000020b6a1064716adce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 12:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228605

--00000000000020b6a1064716adce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 7:25=E2=80=AFAM Harish Sadineni <
Harish.Sadineni@windriver.com> wrote:

>
> On 12/27/2025 8:39 PM, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >
> > On Sat, Dec 27, 2025 at 7:33=E2=80=AFAM <Harish.Sadineni@windriver.com>=
 wrote:
> >> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >>
> >> In sdk while running: 'make prepare' in kernel-source directory after
> enabling rust config,
> >> it will throw errors since only makefile is present in rust kernel
> sources.
> > Can you show exactly how much of the infrastructure is needed for
> > make prepare to succeed ? We've gone through a lot of effort over
> > the years to not copy whole directories, many which have plenty
> > of source code just like the rust directories do.
> >
> > If we can just copy the Makefiles and Kbuild files + a few elements
> > that are needed for regeneration, that is ideal.
> Without this patch:
>
> After populating the SDK and sourcing the environment, in the kernel
> source directory I run 'make rustavailable', then 'make scripts',
> and enable Rust support (RUST) in the kernel configuration. When running
> 'make prepare', the build fails.
>
> The failure is due to missing Rust infrastructure. To understand the
> minimum required set, I attempted to add files incrementally based on
> the reported errors.
> This resulted in the following dependency chain:
>
> Initial failure during make prepare:
>
> RUSTC   L rust/core.o
> EXPORTS rust/exports_core_generated.h
> make[2]: *** No rule to make target 'rust/bindings/bindings_helper.h',
>             needed by 'rust/bindings/bindings_generated.rs'.  Stop.
>
> After adding rust/bindings/bindings_helper.h:
>
> make[2]: *** No rule to make target 'rust/bindgen_parameters',
>             needed by 'rust/bindings/bindings_generated.rs'.  Stop.
>
> After adding rust/bindgen_parameters:
>
> BINDGEN rust/bindings/bindings_generated.rs
> make[2]: *** No rule to make target 'rust/helpers/helpers.c',
>             needed by 'rust/bindings/bindings_helpers_generated.rs'. Stop=
.
>
> After adding rust/helpers/helpers.c, bindgen fails due to additional C
> source dependencies:
>
> rust/helpers/helpers.c:10:10: fatal error: 'auxiliary.c' file not found
> rust/helpers/helpers.c:11:10: fatal error: 'blk.c' file not found
>
>
Right. This is what I've had to do for the other subsystems and so
far we've mostly avoided large copies.



>
> At this point, it becomes apparent that make prepare continues to pull
> in further Rust and C source dependencies(chain of dependency is very
> large),
> and in practice ends up requiring most of the Rust infrastructure rather
> than just a small set of Makefiles or files.
>
> After applying this patch total size of rust directory  is 1.8MB.
>

If we are making such a relatively large addition, both the commit
message and above the copy in the code .. explain in detail what
the rust directory does / generates during make prepare and what
it provides that a kernel module build requires.

Cheers,

Bruce




> > Bruce
> >
> >> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> >> ---
> >>   meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> index 23a9093ede..1505a1d70c 100644
> >> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> @@ -139,6 +139,10 @@ do_install() {
> >>           cd ${S}
> >>
> >>           cp -a scripts $kerneldir/build
> >> +
> >> +        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel',
> 'true', 'false', d)}; then
> >> +            cp -a rust ${kerneldir}/build
> >> +        fi
> >>
> >>           # for v6.1+ (otherwise we are missing multiple default
> targets)
> >>           cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
> >> --
> >> 2.49.0
> >>
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000020b6a1064716adce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 29, 2025 at 7:25=
=E2=80=AFAM Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriver=
.com">Harish.Sadineni@windriver.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>
On 12/27/2025 8:39 PM, Bruce Ashfield wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt;<br>
&gt; On Sat, Dec 27, 2025 at 7:33=E2=80=AFAM &lt;<a href=3D"mailto:Harish.S=
adineni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&=
gt; wrote:<br>
&gt;&gt; From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windri=
ver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; In sdk while running: &#39;make prepare&#39; in kernel-source dire=
ctory after enabling rust config,<br>
&gt;&gt; it will throw errors since only makefile is present in rust kernel=
 sources.<br>
&gt; Can you show exactly how much of the infrastructure is needed for<br>
&gt; make prepare to succeed ? We&#39;ve gone through a lot of effort over<=
br>
&gt; the years to not copy whole directories, many which have plenty<br>
&gt; of source code just like the rust directories do.<br>
&gt;<br>
&gt; If we can just copy the Makefiles and Kbuild files + a few elements<br=
>
&gt; that are needed for regeneration, that is ideal.<br>
Without this patch:<br>
<br>
After populating the SDK and sourcing the environment, in the kernel <br>
source directory I run &#39;make rustavailable&#39;, then &#39;make scripts=
&#39;,<br>
and enable Rust support (RUST) in the kernel configuration. When running <b=
r>
&#39;make prepare&#39;, the build fails.<br>
<br>
The failure is due to missing Rust infrastructure. To understand the <br>
minimum required set, I attempted to add files incrementally based on <br>
the reported errors.<br>
This resulted in the following dependency chain:<br>
<br>
Initial failure during make prepare:<br>
<br>
RUSTC=C2=A0=C2=A0 L rust/core.o<br>
EXPORTS rust/exports_core_generated.h<br>
make[2]: *** No rule to make target &#39;rust/bindings/bindings_helper.h&#3=
9;,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needed b=
y &#39;rust/bindings/<a href=3D"http://bindings_generated.rs" rel=3D"norefe=
rrer" target=3D"_blank">bindings_generated.rs</a>&#39;.=C2=A0 Stop.<br>
<br>
After adding rust/bindings/bindings_helper.h:<br>
<br>
make[2]: *** No rule to make target &#39;rust/bindgen_parameters&#39;,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needed b=
y &#39;rust/bindings/<a href=3D"http://bindings_generated.rs" rel=3D"norefe=
rrer" target=3D"_blank">bindings_generated.rs</a>&#39;.=C2=A0 Stop.<br>
<br>
After adding rust/bindgen_parameters:<br>
<br>
BINDGEN rust/bindings/<a href=3D"http://bindings_generated.rs" rel=3D"noref=
errer" target=3D"_blank">bindings_generated.rs</a><br>
make[2]: *** No rule to make target &#39;rust/helpers/helpers.c&#39;,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needed b=
y &#39;rust/bindings/<a href=3D"http://bindings_helpers_generated.rs" rel=
=3D"noreferrer" target=3D"_blank">bindings_helpers_generated.rs</a>&#39;. S=
top.<br>
<br>
After adding rust/helpers/helpers.c, bindgen fails due to additional C <br>
source dependencies:<br>
<br>
rust/helpers/helpers.c:10:10: fatal error: &#39;auxiliary.c&#39; file not f=
ound<br>
rust/helpers/helpers.c:11:10: fatal error: &#39;blk.c&#39; file not found<b=
r>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Right. This is what I&#39;ve had to do for the other subsy=
stems and so</div><div class=3D"gmail_default" style=3D"font-size:small">fa=
r we&#39;ve mostly avoided large copies.</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
At this point, it becomes apparent that make prepare continues to pull <br>
in further Rust and C source dependencies(chain of dependency is very <br>
large),<br>
and in practice ends up requiring most of the Rust infrastructure rather <b=
r>
than just a small set of Makefiles or files.<br>
<br>
After applying this patch total size of rust directory=C2=A0 is 1.8MB.<br><=
/blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">If we are making such a relatively large addition, both the com=
mit</div><div class=3D"gmail_default" style=3D"font-size:small">message and=
 above the copy in the code .. explain in detail what</div><div class=3D"gm=
ail_default" style=3D"font-size:small">the rust directory does / generates =
during make prepare and what</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">it provides that a kernel module build requires.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Bruce<br>
&gt;<br>
&gt;&gt; Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadine=
ni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<b=
r>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-dev=
src.bb" rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 4 ++++<=
br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-de=
vsrc.bb" rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" =
target=3D"_blank">kernel-devsrc.bb</a><br>
&gt;&gt; index 23a9093ede..1505a1d70c 100644<br>
&gt;&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb=
" rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
&gt;&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb=
" rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
&gt;&gt; @@ -139,6 +139,10 @@ do_install() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a scripts $kerneldir/b=
uild<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;rust-kernel&#39;, &#39;true&#39;, &#39;false&#39;, d)}; =
then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a rust ${kerneldir}=
/build<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# for v6.1+ (otherwise we =
are missing multiple default targets)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents Kbuild $ke=
rneldir/build 2&gt;/dev/null || :<br>
&gt;&gt; --<br>
&gt;&gt; 2.49.0<br>
&gt;&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000020b6a1064716adce--


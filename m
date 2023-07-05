Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA4CEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 18:30:45 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web11.2741.1688581844176198140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 11:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UzRovaLl;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-47e106c3f56so2274292e0c.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 11:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688581843; x=1691173843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kM41GIiF8obGn4wqVNpHnIrP1lq/4wclQ3bG8awJ2Ao=;
        b=UzRovaLlw82yOoLUz7Wi41mPKW8eQ2wCHDCrdXUrC2GaqEHXPu4DQu/fmhL5vNM7TT
         UrVslArZrQjL/kDUO/afsUBkkD6b0HxUzshJIiKZRSxX5RdyNXauQywmC64kJFTmW2F4
         YbYgwX3PuuXTmMyLSxqKJW/MxS7abUOo9UAkI3fIUkM5JN5cxYbYYmtGqUFeNTyhZ8Rq
         l+Nj+8NwEp1MIaIMvIu3PkRFRhB4mH3Uu8aLispTo5snYFnSeuLMgr7zvn9HDcBtAVhQ
         eaUozWqI1hXVN7zPIi3MnVDsXC7nZqFVoR+pKZG+ObknTsOu92przYrV56YRD0zn9L1g
         JC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688581843; x=1691173843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kM41GIiF8obGn4wqVNpHnIrP1lq/4wclQ3bG8awJ2Ao=;
        b=PQ1vjSIaZF7wQFphQ/Tob1gGC/sKVqfI/PIJxv9TqwiE7iRfXgvnyi9QMp9y14La9j
         WPEgR3CKdaGTC/H7mNZt5BTbufJvEOY+gKElxMF1/vvO/GZNU9rVVjMTSrZX00p6XePc
         5iquLgPhEEKEtparLwyf7MKeh0kkcm+qKjdUyTYhFXf+8+X5cFK8JsHB6zz5pZvPjFwR
         1LjugppopUDfIYIMcKl+XRIEvx2UjUP2OvfsyQPj9x91dAGRP/JuPMpR7h6cAobXaxui
         Sw3n3q/ikpp8RG6jOLCI5MpFDO2xIgwCV10LnVLRtnFuYE28WtikrrPs0ssGePg6pxuK
         bQuw==
X-Gm-Message-State: ABy/qLYunGAKDpUzYw618WxqRDw8z3HMZQdIR+YyKQBDGU48OHfArOVQ
	UENAKy/IdTKGfMAUm/2++wTQEqSW068LcgY9nFc=
X-Google-Smtp-Source: APBJJlHLparMPKccYicEin4kjK6vbWLoMqjXLtdakbOBB2Sx42W25jdAoUdf8NLiwd3WVqy3ixXYI2+QvIiUd4pESak=
X-Received: by 2002:a67:ee19:0:b0:443:67bd:d2f5 with SMTP id
 f25-20020a67ee19000000b0044367bdd2f5mr8254240vsp.24.1688581843067; Wed, 05
 Jul 2023 11:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230705180358.382955-1-jose.quaresma@foundries.io> <CANNYZj-s4hu9q+j1rgHw5rndJzBn_WbX+z_tZkA9boC5HP-g8w@mail.gmail.com>
In-Reply-To: <CANNYZj-s4hu9q+j1rgHw5rndJzBn_WbX+z_tZkA9boC5HP-g8w@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 5 Jul 2023 19:30:32 +0100
Message-ID: <CANPvuRnx8J+MeubV-xPw73=ut4cCpiRDEEHq=er7=3LO4Qn79w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] openssl: check the existence of the PERL5LIB path
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000ee271e05ffc1983c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 18:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183903

--000000000000ee271e05ffc1983c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quarta,
5/07/2023 =C3=A0(s) 19:24:

> There is no need to export the other two variables, they can stay as they
> were.
>

I can add another one just to store the external path and do the check like
PERLEXTERNAL and use it on
PERL5LIB=3D$PERLEXTERNAL to be less invasive.
In fact we don't even need the PERL5LIB anymore because everything is
working without it as it
currently have a wrong value.

Jose


> Alex
>
>
> On Wed, 5 Jul 2023 at 20:04, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > When upstream change is better to fail or removing the PERL5LIB
> > if they are nott need anymore.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/recipes-connectivity/openssl/openssl_3.1.1.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> > index f5f3f32a97..0dce7f71bc 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> > @@ -137,7 +137,10 @@ do_configure () {
> >         fi
> >         # WARNING: do not set compiler/linker flags (-I/-D etc.) in
> EXTRA_OECONF, as they will fully replace the
> >         # environment variables set by bitbake. Adjust the environment
> variables instead.
> > -       HASHBANGPERL=3D"/usr/bin/env perl" PERL=3Dperl
> PERL5LIB=3D"${S}/external/perl/Text-Template-1.46/lib/" \
> > +       export HASHBANGPERL=3D"/usr/bin/env perl"
> > +       export PERL=3Dperl
> > +       export PERL5LIB=3D"${S}/external/perl/Text-Template-1.46/lib"
> > +       test -d "$PERL5LIB" || bberror "PERL5LIB '$PERL5LIB' not found!=
"
> >         perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS}
> ${DEPRECATED_CRYPTO_FLAGS} --prefix=3D$useprefix --openssldir=3D${libdir}=
/ssl-3
> --libdir=3D${libdir} $target
> >         perl ${B}/configdata.pm --dump
> >  }
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#183900):
> https://lists.openembedded.org/g/openembedded-core/message/183900
> > Mute This Topic: https://lists.openembedded.org/mt/99970131/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ee271e05ffc1983c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia q=
uarta, 5/07/2023 =C3=A0(s) 19:24:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">There is no need to export the other two variables, they =
can stay as they were.<br></blockquote><div><br>I can add another one just =
to store the external path and do the check like PERLEXTERNAL and use it on=
<br>PERL5LIB=3D$PERLEXTERNAL to be less invasive.<br>In fact we don&#39;t e=
ven need the PERL5LIB anymore because everything is working without it as i=
t</div><div>currently have a wrong value.</div><div><br></div><div>Jose<br>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
<br>
On Wed, 5 Jul 2023 at 20:04, Jose Quaresma &lt;<a href=3D"mailto:quaresma.j=
ose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; When upstream change is better to fail or removing the PERL5LIB<br>
&gt; if they are nott need anymore.<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.1.=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.1.1.bb</a> | 5 ++++-<b=
r>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://opens=
sl_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.1.1.bb</a> b/me=
ta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.1.1.bb" rel=3D"=
noreferrer" target=3D"_blank">openssl_3.1.1.bb</a><br>
&gt; index f5f3f32a97..0dce7f71bc 100644<br>
&gt; --- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.1.=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.1.1.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.1.=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.1.1.bb</a><br>
&gt; @@ -137,7 +137,10 @@ do_configure () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# WARNING: do not set compiler/linker=
 flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# environment variables set by bitbak=
e. Adjust the environment variables instead.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0HASHBANGPERL=3D&quot;/usr/bin/env perl&quo=
t; PERL=3Dperl PERL5LIB=3D&quot;${S}/external/perl/Text-Template-1.46/lib/&=
quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0export HASHBANGPERL=3D&quot;/usr/bin/env p=
erl&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0export PERL=3Dperl<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0export PERL5LIB=3D&quot;${S}/external/perl=
/Text-Template-1.46/lib&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0test -d &quot;$PERL5LIB&quot; || bberror &=
quot;PERL5LIB &#39;$PERL5LIB&#39; not found!&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perl ${S}/Configure ${EXTRA_OECONF} $=
{PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=3D$useprefix -=
-openssldir=3D${libdir}/ssl-3 --libdir=3D${libdir} $target<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perl ${B}/<a href=3D"http://configdat=
a.pm" rel=3D"noreferrer" target=3D"_blank">configdata.pm</a> --dump<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#183900): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/183900" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/183900</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99970131=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/99970131/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000ee271e05ffc1983c--


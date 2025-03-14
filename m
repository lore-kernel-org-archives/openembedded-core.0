Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098A7C28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 19:44:14 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.2962.1741981443767355647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 12:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RrnxD3vS;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4769bbc21b0so24845081cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 12:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741981443; x=1742586243; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iW4IjX0eESRxyBNp7sggw2STu/5rt1rA2VUl9uULi3Y=;
        b=RrnxD3vSJORodnzOMxe23cILmwIcVsYyAxWO2lPOLxLV6OiShPxwJxsOtnXy865bGU
         vUpKCW/mMLBs61a670ketpe4uGUEjINH8m2LiAHXFBVpZnjRX7YSI82mkFX+MhG4ETLM
         PyBpYjyOcnakdEkEn7bDOtuLrA9k9B+8LDiobh4oJhpZJqlk5VdPZzwyIx346LjgUVeX
         iV485glDvqBc6+0uc6MMQMJ3XWQu5ML5Vkg4jqxdXj/ukea0n9ychIgWVQSgxtt7n0jV
         S3jo012ZhSld0xqQcFVqVp5/+QCPt5ym3FEJNfdRo7EV4C/50+xCvuWlcIlSyUd9K+Ee
         5y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741981443; x=1742586243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iW4IjX0eESRxyBNp7sggw2STu/5rt1rA2VUl9uULi3Y=;
        b=kBVEFTkkjLEGKhiR4hcv5IcTNWIyyJwCUTQAEMhjelG1SPRZcQtpyqOvKo5wFFN8Bt
         38t0NvvCop8uhvGHtdXiIIvPfo7qs2ABNylaweUNb1NU78mLTFNH6vRf97Xwk6vzwosG
         Fh9mVDwU2X/A4XoetZyGF7Nglou0t5g5DxO0r8+eqZb+q5Dpo5YMoD0dFKLEBX22dZig
         RByOk8C0nEMWprqrLQfUUzW66kfTj9T5f3hWp53MI5lGbHkRmfAHuhIwcdkqQfPWg+wY
         tRDdwPLU13C51H8/KoauoBz/XRYwJwyj75Tp3pOYZYd4uTMeN0KtNwsHetUNkYzIwmuk
         71jA==
X-Gm-Message-State: AOJu0Yy6FfVoEYePnZcpDOIX5U9Z9tDQI/B9oqGWL37pgatiVL5nLdC2
	1aqrD3/wj2imyHm1+QuhizuvGRQlTeCf9/z7OZ0rrFLvwzQ0+HgJiciXm2YfkPRJs56mZF/HRXQ
	xiY1i6se8lLAZSMn9/ldIklpzBcLnQg==
X-Gm-Gg: ASbGncszr/NGX+rcH6iXRkquGOr0Qjl6ZYdOUKT0J8RnoN2G0RZgnkDwghYmFBPt3eS
	dnl3qP3h22PVB2QQMgyqOvCvxetxgD3veVVK2n706gGaR4GAol8YG2ZCVHotQ6GkN60CL68LNBX
	e9suF/NAAz1GyiRXn2rQyeJfC21O6wNe3/odfY4lWwWlzRl6c1m/Appmli0V0=
X-Google-Smtp-Source: AGHT+IG29NtorPShQ2eiv9F3Wo+xuExJd9aisCd6GqQshTUf61gY8sdgVuVeLqBGoLHC51v8Lk3vf4f6JVGfmtb43us=
X-Received: by 2002:a05:6214:2b0d:b0:6e6:6713:3ea8 with SMTP id
 6a1803df08f44-6eaeaa970eamr56739166d6.23.1741981442705; Fri, 14 Mar 2025
 12:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250314094638.1893858-1-alex.kanavin@gmail.com> <CAMKF1spjC=gUZi4-O+qOLNgRu8Pzdc04j0ti=qdrSjokXE6kHw@mail.gmail.com>
In-Reply-To: <CAMKF1spjC=gUZi4-O+qOLNgRu8Pzdc04j0ti=qdrSjokXE6kHw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Mar 2025 20:43:51 +0100
X-Gm-Features: AQ5f1JqoAXZldei5cqWp8uuj-Fzr2fBjoN_PGqxPaTijjl5MSnoG19CQ-kIhj2o
Message-ID: <CANNYZj85oxxiCp4sRK_rL6-YRVrUDK5akza_Q6mWEN_tNw8_4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ppp: remove erroneous generated header from the
 source tree
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000190e78063052a9ac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 19:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212864

--000000000000190e78063052a9ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good point that. I=E2=80=99ll make a new patch.

Alex

On Fri 14. Mar 2025 at 19.07, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Mar 14, 2025 at 2:46=E2=80=AFAM Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > From: Alexander Kanavin <alex@linutronix.de>
> >
> > ppp-2.5.2 tarball ships a generated header with various
> > configuration settigns that takes precedence over the same
> > header generated into the build directory during the actual build.
> >
> > This resulted in various linking fails that were worked around
> > by enabling multilink in 2.5.2 version update. The correct fix
> > that removes all contamination is to remove the bogus header first.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/recipes-connectivity/ppp/ppp_2.5.2.bb | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> > index 9ea99cc15a3..fd9223d2d1c 100644
> > --- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> > +++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> > @@ -29,11 +29,16 @@ SRC_URI[sha256sum] =3D
> "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55
> >
> >  inherit autotools pkgconfig systemd
> >
> > -PACKAGECONFIG =3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}
> openssl multilink"
> > +PACKAGECONFIG =3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}
> openssl"
> >  PACKAGECONFIG[pam] =3D "--with-pam=3Dyes,--with-pam=3Dno,libpam"
> >  PACKAGECONFIG[openssl] =3D "--with-openssl=3Dyes,--with-openssl=3Dno,o=
penssl"
> >  PACKAGECONFIG[multilink] =3D "--enable-multilink,--disable-multilink"
> >
> > +# https://github.com/ppp-project/ppp/issues/541#issuecomment-272226036=
3
> > +do_configure:prepend () {
> > +       rm -rf ${S}/pppd/pppdconf.h
> > +}
> > +
>
> I wonder if it should be a patch instead, it can be better tracked that
> way.
>
> >  do_install:append () {
> >         mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d
> >         mkdir -p ${D}${sysconfdir}/ppp/ip-up.d/
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#212827):
> https://lists.openembedded.org/g/openembedded-core/message/212827
> > Mute This Topic: https://lists.openembedded.org/mt/111695980/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000190e78063052a9ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Good point that. I=E2=80=99ll make a new patch.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Alex=C2=A0</div><div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri 14. Mar 2025 at 19.07, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Fr=
i, Mar 14, 2025 at 2:46=E2=80=AFAM Alexander Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" targ=
et=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;<br>
&gt; ppp-2.5.2 tarball ships a generated header with various<br>
&gt; configuration settigns that takes precedence over the same<br>
&gt; header generated into the build directory during the actual build.<br>
&gt;<br>
&gt; This resulted in various linking fails that were worked around<br>
&gt; by enabling multilink in 2.5.2 version update. The correct fix<br>
&gt; that removes all contamination is to remove the bogus header first.<br=
>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.5.2.bb" re=
l=3D"noreferrer" target=3D"_blank">ppp_2.5.2.bb</a> | 7 ++++++-<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.5.2=
.bb" rel=3D"noreferrer" target=3D"_blank">ppp_2.5.2.bb</a> b/meta/recipes-c=
onnectivity/ppp/<a href=3D"http://ppp_2.5.2.bb" rel=3D"noreferrer" target=
=3D"_blank">ppp_2.5.2.bb</a><br>
&gt; index 9ea99cc15a3..fd9223d2d1c 100644<br>
&gt; --- a/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.5.2.bb" re=
l=3D"noreferrer" target=3D"_blank">ppp_2.5.2.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.5.2.bb" re=
l=3D"noreferrer" target=3D"_blank">ppp_2.5.2.bb</a><br>
&gt; @@ -29,11 +29,16 @@ SRC_URI[sha256sum] =3D &quot;47da358de54a10cb10bf6=
ff2cf9b1c03c0d3555518f6182e8f701b8e55<br>
&gt;<br>
&gt;=C2=A0 inherit autotools pkgconfig systemd<br>
&gt;<br>
&gt; -PACKAGECONFIG =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;,=
 &#39;pam&#39;, d)} openssl multilink&quot;<br>
&gt; +PACKAGECONFIG =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;,=
 &#39;pam&#39;, d)} openssl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[pam] =3D &quot;--with-pam=3Dyes,--with-pam=3Dno,li=
bpam&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[openssl] =3D &quot;--with-openssl=3Dyes,--with-ope=
nssl=3Dno,openssl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[multilink] =3D &quot;--enable-multilink,--disable-=
multilink&quot;<br>
&gt;<br>
&gt; +# <a href=3D"https://github.com/ppp-project/ppp/issues/541#issuecomme=
nt-2722260363" rel=3D"noreferrer" target=3D"_blank">https://github.com/ppp-=
project/ppp/issues/541#issuecomment-2722260363</a><br>
&gt; +do_configure:prepend () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/pppd/pppdconf.h<br>
&gt; +}<br>
&gt; +<br>
<br>
I wonder if it should be a patch instead, it can be better tracked that way=
.<br>
<br>
&gt;=C2=A0 do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${bindir}/ ${D}${sysconf=
dir}/init.d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${sysconfdir}/ppp/ip-up.=
d/<br>
&gt; --<br>
&gt; 2.39.5<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#212827): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/212827" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/212827</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11169598=
0/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/111695980/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000190e78063052a9ac--


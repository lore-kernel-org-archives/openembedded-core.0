Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFB7C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 11:54:40 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web08.6167.1665489275561816209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 04:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S8w0e/oE;
 spf=pass (domain: gmail.com, ip: 209.85.167.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id y72so8866038oia.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 04:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TGFW9kgsgc/7Ts+zJhuxFBs20lhCiTB3yB1XXQX4Cuw=;
        b=S8w0e/oEG1HUh869gHvedTxlEWPVXZ8hznQA3NJ+iV0pUuY0kb7lA0SrEYc8ovhipR
         5XmxQ+x2Dr0Hmli+lOQ6T/XgOUfsoYuM+nbU3puZ4PyQt6hkI4xRqOA4Pnw9IDtd2HgP
         H/dUS9hA23ABu83uZBqiWZ3XqaIwzBgJQ0DmWfnEdyCc09mY7tr7qU0EqH/aQIaaYG8U
         w9Yh7fIDb4LMr/5+RH3ZJzoCf5ko+jkn8G0t5jZOga9aK8ZPonpeNTKNY7UaP6zIYpKM
         vMXcc+Y5eQ/L9atRwklsxSjih9YbjrTnjakmNSrQfgw4kdx7m7+hBjI7e/UqX3AoW9hJ
         uxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGFW9kgsgc/7Ts+zJhuxFBs20lhCiTB3yB1XXQX4Cuw=;
        b=CQUweVvtw1664dk/IaXM1WmY8T0Sxdexu3KB2DcfCsJIPtj6OYnbkdDHcG8FECtUZG
         OSsbYeSSezKcyYCahhxSHfHKgc3nfQ4gcoQhZpFw4JEF+U/VjSolHDhiyRedDM+UFjHp
         iNxWnQU8DzquNrBezrRsyan2w8bpDDtjOCHf7c5JuHUg8DyrTgIaTO4xdQwv0D8wW276
         aubgiggTKhKZhrU4U4waD0aIfhXYC2nd2JwMhdCJ8MaF4Kml0Bor1Tmw0oVd4iOW5Qsl
         a9Bi+BwDqri+LqbEz6vPhQpRhxlBFJ5m5ZLRk3bPAPxacB8bZqktAhZpYDU+9dvrVJ9h
         tbXQ==
X-Gm-Message-State: ACrzQf26ry4OU142Sitoz2KK13pN9zFN5NVktRBtqfB0aCS0ylr6LMVa
	vCToQiVYIbCv7RmyJVaTWG22PrMdl7I8etEW/vw=
X-Google-Smtp-Source: 
 AMsMyM7SOKKmiroHXlxmvYpxviWr6MwJw6lomKJsoboqTWnGmgiM0gSfP5lb9Dwzn96Qqu3KElLcIg77HcRT9jcY588=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr581305oiw.96.1665489274863; Tue, 11 Oct
 2022 04:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
 <8757104C-1103-45EA-8CEF-43EEE0CF18F8@arm.com>
 <CADkTA4OKoeVa0VgJjEKbsoATtmQ03L28p1QVUdn0ibJ=jcoEwA@mail.gmail.com>
 <401F2D51-AB9E-4D52-84D4-E15C18D6A88A@arm.com>
 <CADkTA4MXezS7rJBJmHsMDX2EEN4nu4HCwsGc=cEDgkLhz1PZuA@mail.gmail.com>
 <402BFFEF-566A-4A10-B374-E3C3BCFFEC72@arm.com>
 <CADkTA4NsnL2CJ_wRVcwrOwSfWjuWD3gQ4esxrYaieOv1h_Bzrg@mail.gmail.com>
 <cdcb6e0a62ca48dab8e2b288f542d956@axis.com>
 <CAMKF1sp29wFTm1b76xE09826nZHoBUgvDobYH9BgziHwm21Mew@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp29wFTm1b76xE09826nZHoBUgvDobYH9BgziHwm21Mew@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Oct 2022 07:54:23 -0400
Message-ID: 
 <CADkTA4Mvz2uyW7aRtq_fM7XGoZaycBgWAg_Eyo851KfqEVH_AQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Ross Burton <Ross.Burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009b066f05eac0f0ac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 11:54:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171622

--0000000000009b066f05eac0f0ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 10:57 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Oct 7, 2022 at 8:00 AM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Bruce Ashfield
> > > Sent: den 6 oktober 2022 16:02
> > > To: Ross Burton <Ross.Burton@arm.com>
> > > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; openembedded=
-
> > > core@lists.openembedded.org
> > > Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on
> > > setuptools3
> > >
> > > On Thu, Oct 6, 2022 at 9:43 AM Ross Burton <Ross.Burton@arm.com>
> wrote:
> > > >
> > > > On 6 Oct 2022, at 14:29, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> > > > > I'm not particularly concerned if the extra RDEPENDS arrives with
> > > > > this, since if it is acceptable for other packages inheriting the
> > > > > setuptools (I thought it was build support only!), it really
> should be
> > > > > ok for perf as well. In particular since perf is debug/optional.
> Or am
> > > > > I missing something there ?
> > > >
> > > > With this change the base perf package will always runtime-depend o=
n
> > > > python3, even if perf-python isn=E2=80=99t installed.  That sounds
> suboptimal.
> > > >
> > >
> > > But is triggered on the 'scripting' packageconfig, which does mean we
> > > want the support, so it is at least somewhat conditional .. but yes, =
I
> > > agree that once we've built and packaged, it does make sense to keep
> > > the python dependencies in the dedicated package.
> > >
> > > Let me re-work this and do the remove of the RDEPENDS and send a v2.
> > >
> > > Bruce
> > >
> > > > Ross
> >
> > To me it sounds as what setuptools3-base.bbclass really should to is
> > something like:
> >
> > FOOBAR ??=3D "${PN}"
> > RDEPENDS:${FOOBAR}:append:class-target =3D " ${PYTHON_PN}-core"
> > ...
> > FILES:${FOOBAR} +=3D "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
> >
> > so that the typical Python only recipes continue to just inherit
> > setuptools3, but recipes that produce other packages than the
> > Python package can do something like:
> >
> > FOOBAR =3D "${PYTHON_PN}-${PN}"
> >
> > Unfortunately this does not work as it results in a gazillion
> > warnings like:
> >
> > WARNING: .../meta-oe/recipes-support/libiio/libiio_git.bb: Variable key
> FILES:${PN}-${PYTHON_PN} (${PYTHON_SITEPACKAGES_DIR}) replaces original k=
ey
> FILES:libiio-python3 ( ${libdir}/* ${libdir}/${PYTHON_DIR}/*).
> > WARNING: .../meta-oe/recipes-support/libiio/libiio_git.bb: Variable key
> RDEPENDS:${PN}-${PYTHON_PN} (${PN} ${PYTHON_PN}-ctypes
> ${PYTHON_PN}-stringold ${PYTHON_PN}-core) replaces original key
> RDEPENDS:libiio-python3 ( ${PYTHON_PN}-core).
> >
> > (I chose libiio as it is an example of another recipes that currently
> > does RDEPENDS:${PN}:remove =3D "${PYTHON_PN}-core" to counteract what
> > setuptools3-base.bbclass does).
> >
>
> Ran into this today too. I think you dont need all the bells and
> whistles of setuptools3 class. Adding
>
> DEPENDS +=3D "python3-setuptools-native"
>
> should get the job done.
>

Aha. I read this after your patch email.

Worth trying this, it may clear up the AB issue we are seeing!

Bruce



>
> > :(
> >
> > //Peter
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171527):
> https://lists.openembedded.org/g/openembedded-core/message/171527
> > Mute This Topic: https://lists.openembedded.org/mt/94118767/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009b066f05eac0f0ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Oct 10, 2022 at 10:57 PM Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Oct 7, 2022 at 8=
:00 AM Peter Kjellerstedt<br>
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openemb=
edded-<br>
&gt; &gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">=
core@lists.openembedded.org</a>&gt; On Behalf Of Bruce Ashfield<br>
&gt; &gt; Sent: den 6 oktober 2022 16:02<br>
&gt; &gt; To: Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=
=3D"_blank">Ross.Burton@arm.com</a>&gt;<br>
&gt; &gt; Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;; o=
penembedded-<br>
&gt; &gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">=
core@lists.openembedded.org</a><br>
&gt; &gt; Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on=
<br>
&gt; &gt; setuptools3<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Oct 6, 2022 at 9:43 AM Ross Burton &lt;<a href=3D"mailto:=
Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 6 Oct 2022, at 14:29, Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&=
gt; wrote:<br>
&gt; &gt; &gt; &gt; I&#39;m not particularly concerned if the extra RDEPEND=
S arrives with<br>
&gt; &gt; &gt; &gt; this, since if it is acceptable for other packages inhe=
riting the<br>
&gt; &gt; &gt; &gt; setuptools (I thought it was build support only!), it r=
eally should be<br>
&gt; &gt; &gt; &gt; ok for perf as well. In particular since perf is debug/=
optional. Or am<br>
&gt; &gt; &gt; &gt; I missing something there ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; With this change the base perf package will always runtime-d=
epend on<br>
&gt; &gt; &gt; python3, even if perf-python isn=E2=80=99t installed.=C2=A0 =
That sounds suboptimal.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; But is triggered on the &#39;scripting&#39; packageconfig, which =
does mean we<br>
&gt; &gt; want the support, so it is at least somewhat conditional .. but y=
es, I<br>
&gt; &gt; agree that once we&#39;ve built and packaged, it does make sense =
to keep<br>
&gt; &gt; the python dependencies in the dedicated package.<br>
&gt; &gt;<br>
&gt; &gt; Let me re-work this and do the remove of the RDEPENDS and send a =
v2.<br>
&gt; &gt;<br>
&gt; &gt; Bruce<br>
&gt; &gt;<br>
&gt; &gt; &gt; Ross<br>
&gt;<br>
&gt; To me it sounds as what setuptools3-base.bbclass really should to is<b=
r>
&gt; something like:<br>
&gt;<br>
&gt; FOOBAR ??=3D &quot;${PN}&quot;<br>
&gt; RDEPENDS:${FOOBAR}:append:class-target =3D &quot; ${PYTHON_PN}-core&qu=
ot;<br>
&gt; ...<br>
&gt; FILES:${FOOBAR} +=3D &quot;${libdir}/* ${libdir}/${PYTHON_DIR}/*&quot;=
<br>
&gt;<br>
&gt; so that the typical Python only recipes continue to just inherit<br>
&gt; setuptools3, but recipes that produce other packages than the<br>
&gt; Python package can do something like:<br>
&gt;<br>
&gt; FOOBAR =3D &quot;${PYTHON_PN}-${PN}&quot;<br>
&gt;<br>
&gt; Unfortunately this does not work as it results in a gazillion<br>
&gt; warnings like:<br>
&gt;<br>
&gt; WARNING: .../meta-oe/recipes-support/libiio/<a href=3D"http://libiio_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">libiio_git.bb</a>: Variable key=
 FILES:${PN}-${PYTHON_PN} (${PYTHON_SITEPACKAGES_DIR}) replaces original ke=
y FILES:libiio-python3 ( ${libdir}/* ${libdir}/${PYTHON_DIR}/*).<br>
&gt; WARNING: .../meta-oe/recipes-support/libiio/<a href=3D"http://libiio_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">libiio_git.bb</a>: Variable key=
 RDEPENDS:${PN}-${PYTHON_PN} (${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-string=
old ${PYTHON_PN}-core) replaces original key RDEPENDS:libiio-python3 ( ${PY=
THON_PN}-core).<br>
&gt;<br>
&gt; (I chose libiio as it is an example of another recipes that currently<=
br>
&gt; does RDEPENDS:${PN}:remove =3D &quot;${PYTHON_PN}-core&quot; to counte=
ract what<br>
&gt; setuptools3-base.bbclass does).<br>
&gt;<br>
<br>
Ran into this today too. I think you dont need all the bells and<br>
whistles of setuptools3 class. Adding<br>
<br>
DEPENDS +=3D &quot;python3-setuptools-native&quot;<br>
<br>
should get the job done.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">Aha. I read this after your patch =
email.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Worth trying this,=
 it may clear up the AB issue we are seeing!</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt; :(<br>
&gt;<br>
&gt; //Peter<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#171527): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/171527" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/171527</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94118767=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/94118767/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000009b066f05eac0f0ac--


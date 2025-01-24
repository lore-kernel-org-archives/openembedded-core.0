Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C80C0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:39:44 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.16953.1737736782714632280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 08:39:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JSxrihUv;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ddcff5a823so18075426d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 08:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737736782; x=1738341582; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kIoC6Gtk57Itq+VISpUeOx04neyQP4Vv8WLmzAnbD/s=;
        b=JSxrihUvt6nuMzcnqepovvyjZ7qLTbzg5CBqiuJQiVlw+MxPmSmvqx3rQqXiGw58rk
         jVuv/iat6/CwwCkmxgF0X4N9J+5CzjknBf0dMOAVXPss2DrSy2YWHPIOhVuhsFEDNFpz
         FEgENfeEKH+d9aiHmQ+JXiVNkhwZGM/P9AQCpA75ut8wuEFGsg1bRqFe2Sx31Jr5XvBU
         rJT2c6P2XC2+k2mqV0aPFkiutuJt9qsZ07luj48sV+KkDvWzuAJUCC0ppBDejiqhpWyq
         VUvDUgckIQXkqBvfd5/62cOjZMXLnn3oUBCXr2X7wPZC5zAAzQrL8cO9VxXxIXurU36s
         M/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737736782; x=1738341582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIoC6Gtk57Itq+VISpUeOx04neyQP4Vv8WLmzAnbD/s=;
        b=a8QOHZVD8pxR0huoH9S0Bd7lS8/8vsis4mBC1s3zB3NZj6qwmiHlmtHxEfqBerHkLU
         dTpGEomod0qoSngkNOKO7TglEPscWgt/X6YeFRB8mCy3P0ec6Nb2QsZk3ZcGElPUxrv4
         sSyRDf2Wjqqc7VnVaR3WWjLv3Kt7PsQ8f2J+SaTBeH9qu+3PCZBco8HYBzhebupLRLQV
         jLarnaPz/ANUWWe30OgnC9qsxYxW7dA40whkXKkM9nEunkdoiawxGFy6G+uZXBMjQ31E
         CMcT+50TwuOUrxARRXydBxogT2beueXELaNfr5/UnkTX7SGpgU1qYooW0/AOXoSvIcX6
         Zejw==
X-Forwarded-Encrypted: i=1; AJvYcCUeXdVzbW5U5Kn0Q1kYqzUve/NHeZRoA3fGUuooDD5CpJ4SYfBpKoB3PS27H70uvuQEzJLjAZ/kTT576S342rFPAw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjUlRHOUCJEefibWnHt8Kr7w5TOcfuhsosM5gOrFL+0Y/HSYSl
	Vq+GNYxLUtrtbF2QDNtJ4+DGZVRLPesgIZ1ujyXTNC1XNhZtS2uERgZ3yQL4Yf2EWbu2dmxwyuz
	GAeJZIJGil3N2hv9CubKCCMIqVHY=
X-Gm-Gg: ASbGncub8Yb+RFGjX8+dKLRMoihvS2EYSi57m6Z+xNp86w/r33txeC+YS0XEHmS1/9V
	Y59toP+4ahGDXfi8ZG53lqRB9tFj0NOfqLVveMOQjDVfKe83/hGOFX8yKWmwL157RPD8uB/JPh/
	itJXX5msDPKomXdiEs6uAz
X-Google-Smtp-Source: AGHT+IEWHesO6cAC0hs+XS//hFTUxe95/rGRmWbhMVP/IO8I4jbiN5KRx/n0BcdqzI+33IlSaIcY9TGSGSWtKfqBYrk=
X-Received: by 2002:a05:6214:2aa7:b0:6d8:8cb0:b40d with SMTP id
 6a1803df08f44-6e1b224ca3amr483321026d6.39.1737736781726; Fri, 24 Jan 2025
 08:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20250123201229.182266-1-marex@denx.de> <CAMKF1sohTGBUO0Lv3YWykjZg-6BB2Fcrd7x=g23iRxHe3TpqSg@mail.gmail.com>
 <a9914d2c-72c9-4cc0-b414-33d33d4c4f42@denx.de>
In-Reply-To: <a9914d2c-72c9-4cc0-b414-33d33d4c4f42@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2025 17:39:31 +0100
X-Gm-Features: AWEUYZmWjbWuktILFOXD81-zQ8Q-ctZJZkD2q3pm_Wu-7K1u8IeGeur_PgmrCG0
Message-ID: <CANNYZj8XgBiaa9aqRPmETXzFgn1v-oeqN2-1zqugDAK6xuyYxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
To: marex@denx.de
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000968958062c765f33"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 16:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210242

--000000000000968958062c765f33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wonder if we can just drop /etc/shells altogether from base-files?

Alex

On Fri 24. Jan 2025 at 16.26, Marek Vasut via lists.openembedded.org <marex=
=3D
denx.de@lists.openembedded.org> wrote:

> On 1/23/25 10:18 PM, Khem Raj wrote:
> > On Thu, Jan 23, 2025 at 12:12=E2=80=AFPM Marek Vasut via
> > lists.openembedded.org <marex=3Ddenx.de@lists.openembedded.org> wrote:
> >>
> >> Remove /bin/sh from bash RPROVIDES as this has a side-effect which
> >> confuses rpm package manager when also busybox provides /bin/sh and
> >> base-files depend on /bin/sh . The problem is broken down below.
> >>
> >> First, bash depends on base-files and bash pkg_postinst must run
> >> after base-files was installed, because it requires /etc/shells
> >> provided by base-files to be in place.
> >>
> >> Second, base-files depends on /bin/sh, which is provided by either
> >> bash or busybox in this case. This is the actual problem here, if
> >> bash is selected as /bin/sh provider, then there is cyclic dependency
> >> between bash and base-files, and that confuses dnf which may install
> >> the packages in the wrong order, bash first and base-files second .
> >>
> >> To make this worse, if busybox is also /bin/sh provider, it can and
> >> does happen that some systems pick busybox as the /bin/sh provider,
> >> while others pick bash as the /bin/sh provider, and that cyclic
> >> dependency does not always appear.
> >>
> >> Attempt to break this dependency, drop RPROVIDES /bin/sh from bash
> >> recipe to always force base-files to pick /bin/sh from busybox .
> >> (I am really unsure about this approach)
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> ---
> >> Cc: Alexander Kanavin <alex@linutronix.de>
> >> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> ---
> >>   meta/recipes-extended/bash/bash.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-extended/bash/bash.inc
> b/meta/recipes-extended/bash/bash.inc
> >> index 634209c9115..6a061b8a612 100644
> >> --- a/meta/recipes-extended/bash/bash.inc
> >> +++ b/meta/recipes-extended/bash/bash.inc
> >> @@ -134,4 +134,4 @@ FILES:${PN}-loadable +=3D "${libdir}/bash/*"
> >>
> >>   # Limit the RPROVIDES here to class target so that if usrmerge is
> enabled for nativesdk, it does not
> >>   # include host system paths in /bin/
> >> -RPROVIDES:${PN}:append:class-target =3D "
> ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh /bin/bash',
> '', d)}"
> >> +RPROVIDES:${PN}:append:class-target =3D "
> ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/bash', '', d)}"
> >
> > Does this now mean that system will always need busybox ?
>
> The system will require some other /bin/sh provider than bash .
>
> I suspect there will always be one , but maybe I am wrong and there are
> systems without busybox and with bash only (probably yes) ?
>
> >  some distros
> > may not want that and simply use
> > other variants to fill in the shoes. I wonder if shell choice could be
> > a distro option or image feature which can then
> > help sort this out ?
> I don't think this specific fix is the correct solution, I think what I
> need to figure out is how to make sure base-files is installed before
> bash, even if there is this cyclic dependency which confuses rpm/dnf
> into installing the two packages in arbitrary order:
>
> base-files -depends_on-> /bin/sh -depends_on-> bash (the /bin/sh provider=
)
>
> bash -depends_on-> base-files
>
> I still have to check the input from Martin Jansa , there was some hint
> which might be the better fix for this.
>
> Any ideas ?
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210223):
> https://lists.openembedded.org/g/openembedded-core/message/210223
> Mute This Topic: https://lists.openembedded.org/mt/110778651/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000968958062c765f33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I wonder if we can just drop /etc/shells altogether from =
base-files?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Fri 24. Jan 2025 at 16.26, Marek Vasut via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;marex=3D<a h=
ref=3D"mailto:denx.de@lists.openembedded.org">denx.de@lists.openembedded.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)">On 1/23/25 10:18 PM, Khem Raj wr=
ote:<br>
&gt; On Thu, Jan 23, 2025 at 12:12=E2=80=AFPM Marek Vasut via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;marex=3D<a href=3D"mailto:denx.de@l=
ists.openembedded.org" target=3D"_blank">denx.de@lists.openembedded.org</a>=
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Remove /bin/sh from bash RPROVIDES as this has a side-effect which=
<br>
&gt;&gt; confuses rpm package manager when also busybox provides /bin/sh an=
d<br>
&gt;&gt; base-files depend on /bin/sh . The problem is broken down below.<b=
r>
&gt;&gt;<br>
&gt;&gt; First, bash depends on base-files and bash pkg_postinst must run<b=
r>
&gt;&gt; after base-files was installed, because it requires /etc/shells<br=
>
&gt;&gt; provided by base-files to be in place.<br>
&gt;&gt;<br>
&gt;&gt; Second, base-files depends on /bin/sh, which is provided by either=
<br>
&gt;&gt; bash or busybox in this case. This is the actual problem here, if<=
br>
&gt;&gt; bash is selected as /bin/sh provider, then there is cyclic depende=
ncy<br>
&gt;&gt; between bash and base-files, and that confuses dnf which may insta=
ll<br>
&gt;&gt; the packages in the wrong order, bash first and base-files second =
.<br>
&gt;&gt;<br>
&gt;&gt; To make this worse, if busybox is also /bin/sh provider, it can an=
d<br>
&gt;&gt; does happen that some systems pick busybox as the /bin/sh provider=
,<br>
&gt;&gt; while others pick bash as the /bin/sh provider, and that cyclic<br=
>
&gt;&gt; dependency does not always appear.<br>
&gt;&gt;<br>
&gt;&gt; Attempt to break this dependency, drop RPROVIDES /bin/sh from bash=
<br>
&gt;&gt; recipe to always force base-files to pick /bin/sh from busybox .<b=
r>
&gt;&gt; (I am really unsure about this approach)<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" ta=
rget=3D"_blank">marex@denx.de</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" ta=
rget=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; Cc: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@boot=
lin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
&gt;&gt; Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-extended/bash/bash.inc | 2 +-<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-ex=
tended/bash/bash.inc<br>
&gt;&gt; index 634209c9115..6a061b8a612 100644<br>
&gt;&gt; --- a/meta/recipes-extended/bash/bash.inc<br>
&gt;&gt; +++ b/meta/recipes-extended/bash/bash.inc<br>
&gt;&gt; @@ -134,4 +134,4 @@ FILES:${PN}-loadable +=3D &quot;${libdir}/bash=
/*&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0# Limit the RPROVIDES here to class target so that if =
usrmerge is enabled for nativesdk, it does not<br>
&gt;&gt;=C2=A0 =C2=A0# include host system paths in /bin/<br>
&gt;&gt; -RPROVIDES:${PN}:append:class-target =3D &quot; ${@bb.utils.contai=
ns(&#39;DISTRO_FEATURES&#39;, &#39;usrmerge&#39;, &#39;/bin/sh /bin/bash&#3=
9;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; +RPROVIDES:${PN}:append:class-target =3D &quot; ${@bb.utils.contai=
ns(&#39;DISTRO_FEATURES&#39;, &#39;usrmerge&#39;, &#39;/bin/bash&#39;, &#39=
;&#39;, d)}&quot;<br>
&gt; <br>
&gt; Does this now mean that system will always need busybox ?<br>
<br>
The system will require some other /bin/sh provider than bash .<br>
<br>
I suspect there will always be one , but maybe I am wrong and there are <br=
>
systems without busybox and with bash only (probably yes) ?<br>
<br>
&gt;=C2=A0 some distros<br>
&gt; may not want that and simply use<br>
&gt; other variants to fill in the shoes. I wonder if shell choice could be=
<br>
&gt; a distro option or image feature which can then<br>
&gt; help sort this out ?<br>
I don&#39;t think this specific fix is the correct solution, I think what I=
 <br>
need to figure out is how to make sure base-files is installed before <br>
bash, even if there is this cyclic dependency which confuses rpm/dnf <br>
into installing the two packages in arbitrary order:<br>
<br>
base-files -depends_on-&gt; /bin/sh -depends_on-&gt; bash (the /bin/sh prov=
ider)<br>
<br>
bash -depends_on-&gt; base-files<br>
<br>
I still have to check the input from Martin Jansa , there was some hint <br=
>
which might be the better fix for this.<br>
<br>
Any ideas ?<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210223): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210223" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210223</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110778651/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110778651/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000968958062c765f33--


Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4002C433EF
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 16:00:27 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.7688.1657382425323518930
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 09:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=nOpU54jp;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.182,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f182.google.com with SMTP id r2so1971772qtx.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=lu0IDn57Bbuvnw+kb2EalJoBudYkdZxK+XC8aGIdwEQ=;
        b=nOpU54jpfK+x9sislYYpRaM8+yjMIBZygrWLvQDROwdbHAYg9irUxCn73J6m0vJrpd
         qfPUUuOP0unO3N/ZsBL3x23i1a140Lpru4xH77Oa7ePJj1RXCy5HWpMxoOb1poHFoeZi
         Vy9fJoOMvnql8wfL4SB68kiQijyUJ2gCxI39YBFmK3r0iP/QVo4btGTpKe6JY6bnvkjN
         71l9yV/RhPfAJ4y5KeouAslDpV5KuQCKUY7IqVQrYH5iOzpQAOW79gsC+AeiGj5LOOjQ
         GtaZNWSrOhiPwEvRJkxqDPfOJ6KgUuodcrLSD/WevF8KQ1X0SE4ONKWzBj6LdcwlNdpV
         iThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=lu0IDn57Bbuvnw+kb2EalJoBudYkdZxK+XC8aGIdwEQ=;
        b=E1vdqyP0lEtPrnaRSbjgDTE0RHK4iawzQm8XnM6dLbFKORMaqPvWBePKzB4ovXOkDr
         5yuJyYbYkEIXSeuFjt605Kto6WFBDS02x+JscC8MTuvJsY1R8/PiyP9awc19zBi5IvaB
         29Smi4h6RYdCnMalsl8YY6gJGDbsWMr2RuPNs+Jz1BPvWX90u01z7WZCGlDHEkgbyv1c
         czMtnvb2P6997NAENX3ux7Qfa7gYAZCS6V7fzeYnSxYzRCzym/tOdJQDz/aFvrz8XPz2
         mClSDJd3PsrADHZHX2cWjbjbThCUY+pkefQcRQ7F2En2cJFpzd5X2giImkdhbNYKnfZ1
         VODw==
X-Gm-Message-State: AJIora8w6zOMq/zc+t8/QOBxLZOYf7dF2tyLCIN6TiYMxBF1NWW8T2WQ
	Rw91LbQwgpUkgC/7HkKxS+yL+wvc+XJjZXb1
X-Google-Smtp-Source: 
 AGRyM1sZ/xWrCEyrj8w7RptXhGLXvAk9pGA/qQDLpiKjNQ74/5XGw9dYmqXrsu62u9wTnYncmQYE1A==
X-Received: by 2002:a05:622a:186:b0:319:1d49:2db7 with SMTP id
 s6-20020a05622a018600b003191d492db7mr7426465qtw.444.1657382424094;
        Sat, 09 Jul 2022 09:00:24 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id
 g10-20020ac8580a000000b00304e2e4bf1esm1615335qtg.88.2022.07.09.09.00.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jul 2022 09:00:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f171.google.com with SMTP id g6so1990752qtu.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 09:00:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:31e:af75:edaa with SMTP id
 s7-20020a05622a178700b0031eaf75edaamr1502729qtk.82.1657382423010; Sat, 09 Jul
 2022 09:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220707171904.338441-1-otavio@ossystems.com.br>
 <c817c9f437c1003e63a2cd462b459bed21b39ace.camel@linuxfoundation.org>
In-Reply-To: 
 <c817c9f437c1003e63a2cd462b459bed21b39ace.camel@linuxfoundation.org>
Date: Sat, 9 Jul 2022 13:00:11 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKq1a9R37aD-3uzabL7XFgww4n6K2c3BUh6=sYaQKqZRqA@mail.gmail.com>
Message-ID: 
 <CAP9ODKq1a9R37aD-3uzabL7XFgww4n6K2c3BUh6=sYaQKqZRqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust-common: Fix use of target definitions
 for SDK generation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: multipart/alternative; boundary="00000000000094a38005e3616a81"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Jul 2022 16:00:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167840

--00000000000094a38005e3616a81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 9 de jul. de 2022 =C3=A0s 10:14, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Thu, 2022-07-07 at 14:19 -0300, Otavio Salvador wrote:
> > We need full target passed for build so we changed the
> > rust-cross-canadian to use same code used in regular rust recipes and
> > added support to use specific llvm-target for the building host.
> >
> > Fixes: ef566af964 ("rust: fix issue building cross-canadian tools for
> aarch64 on x86_64")
> > Fixes: bd36593ba3 ("rust-common: Drop LLVM_TARGET and simplify")
> > Fixes: 8ed000debb ("rust-common: Fix for target definitions returning
> 'NoneType' for arm")
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >
> >  meta/recipes-devtools/rust/rust-common.inc    | 21 ++++++++++++------
> >  .../rust/rust-cross-canadian-common.inc       | 22 ++++++++++++++++---
> >  2 files changed, 33 insertions(+), 10 deletions(-)
>
> I ran these through the autobuilder:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3809/st=
eps/14/logs/stdio
>
> seems there is some syntax that recent python doesn't like. I do need
> to look at the patches in more detail but wanted to share the
> autobuilder results.
>

I will fix and send a v2.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000094a38005e3616a81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em s=C3=A1b., 9 de jul. de 2022 =C3=
=A0s 10:14, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2022-07-07 at 14:19 =
-0300, Otavio Salvador wrote:<br>
&gt; We need full target passed for build so we changed the<br>
&gt; rust-cross-canadian to use same code used in regular rust recipes and<=
br>
&gt; added support to use specific llvm-target for the building host.<br>
&gt; <br>
&gt; Fixes: ef566af964 (&quot;rust: fix issue building cross-canadian tools=
 for aarch64 on x86_64&quot;)<br>
&gt; Fixes: bd36593ba3 (&quot;rust-common: Drop LLVM_TARGET and simplify&qu=
ot;)<br>
&gt; Fixes: 8ed000debb (&quot;rust-common: Fix for target definitions retur=
ning &#39;NoneType&#39; for arm&quot;)<br>
&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt;=C2=A0 meta/recipes-devtools/rust/rust-common.inc=C2=A0 =C2=A0 | 21 +++=
+++++++++------<br>
&gt;=C2=A0 .../rust/rust-cross-canadian-common.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 22 ++++++++++++++++---<br>
&gt;=C2=A0 2 files changed, 33 insertions(+), 10 deletions(-)<br>
<br>
I ran these through the autobuilder:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/3809/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3809/steps/14/logs/=
stdio</a><br>
<br>
seems there is some syntax that recent python doesn&#39;t like. I do need<b=
r>
to look at the patches in more detail but wanted to share the<br>
autobuilder results.<br></blockquote><div><br></div><div>I will fix and sen=
d a v2.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D=
"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br=
</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" ta=
rget=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981=
-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750=C2=A0</di=
v></div>

--00000000000094a38005e3616a81--


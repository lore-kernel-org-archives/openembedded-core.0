Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89314C25B77
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 13:29:18 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.13820.1715866157109291107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 06:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ivvjuLGU;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2b3646494a8so164620a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715866156; x=1716470956; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X+Ru3sE3jb0Bc6RpDgwTjG5oQr4U7GPPPdGV12R9VW8=;
        b=ivvjuLGUTBvvqZw82nYg9YBA7TsKYCW1c+fqrxQQljKGsnkAGoQ8gh9Kgu9CuxXBt1
         raZZYKssdEUjM6afobs574YAbe3QFiMleUVyC4VjvEie5XwcDMzwKHp0sd7wuUUpxFGK
         hb8bWD6sQvau+5XXcFHtlJSWNxMWiHCIGC+HzFYQs3lggDgqj7wwrfY7uUBIsYh071sZ
         n2J6FbttZT0aMufHhCFY1wtBVrUsZLbopE2LsmE3kl2Zqq6thhwTnFeRW4Zn76NtEjcY
         uLV5HH9jG7h1meJQkahbllMrRBucBq8MUH5PN2bG/EZcRvouaBmeth0kX4d7hTJFvHb7
         xF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715866156; x=1716470956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+Ru3sE3jb0Bc6RpDgwTjG5oQr4U7GPPPdGV12R9VW8=;
        b=ts/LjGHAtvYkfKHZTYiublQUfyjz7o1T+X7xqxFP8T3wKbZ9bIBoK2W/X895iqDabD
         fqR/i6gCQmNSzRIBAFoFZyERsrDzclVrLkyfXHXABY7W/z9PKkoSBuY5LzAZEDqvpBhv
         Awe9QZrC77Lpp9+eEmG9BoclmLIsbNpn8JcP6QmDKzQSQKhA2hJF6miFM6mU9bicUj/v
         ZSlygcxzcczH/KNp9BJSmmiNCPfUzoQRSxMWLlQF/F/nCgFkRhsMWFWVXnBu4BjD+FKM
         Zcqth9N3TGl5H822V/SYs1mT8dtVZpXcFx0bcTxZ7FiMeOVvS7H1efr+P7JR021jx0xR
         JSXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSrm+e6mxPdOP+J89I+g0Abqq8lR+IkAGylJlJvY9JZUKPe5GDiGzG3QBkRxhBTIXj0dlkFechxhS6KjRd6uKYPV//5hlCLJp7hCtbrGoHdJoSZdKjfAiV
X-Gm-Message-State: AOJu0YywKU391ml6zCEjsQ1xq1uIeJCzkEpriL6mdmjgDmC0JqZs4+Md
	IZYJ/BrQFjLGlu8yIDwNwuvpar85Jb+W+T4uM8LkIzXgvCnDfnUEP7y4f2hCuC8VqHTrbcD54Dv
	CK6b4ph9a1xTizpu5mGUMHFNkuJSCBOvzGaE=
X-Google-Smtp-Source: AGHT+IGmigUyxsVMK6GzUqfQbt6MYEinVZ1bvjKcCAdDncoLN1rd5qHu3YTRjc+7d2SRI+HrkulQ7PLGYactFpDzWGA=
X-Received: by 2002:a17:90a:5901:b0:2b3:28be:dd6e with SMTP id
 98e67ed59e1d1-2b6ccd6baedmr16578041a91.33.1715866156471; Thu, 16 May 2024
 06:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=SACqdG_g=2LUj1=-ECJY20p=r8RoPTag-if-kpo0ozQg@mail.gmail.com>
 <AS1PR10MB56970C6C0F897879109E49D2FDED2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56970C6C0F897879109E49D2FDED2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 16 May 2024 15:29:04 +0200
Message-ID: <CAApg2=TEATp-LeJ5=2gJ7rQSrambtSnPjNzuzbZOeWqbvGu67Q@mail.gmail.com>
Subject: Re: [yocto-security] CVE status for scathgap on 2024-05-16 and ask
 for help
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	"liezhi.yang@windriver.com" <liezhi.yang@windriver.com>, "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bd241d0618923804"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 13:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199488

--000000000000bd241d0618923804
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Marko for the feedback! For CVE-2024-34397 the reason is simple:

"affected": [
                {
                    "vendor": "n/a",
                    "product": "n/a",
                    "versions": [
                        {
                            "version": "n/a",
                            "status": "affected"
                        }
                    ]
                }
            ],

I'm fixing this... Strange that this one was assigned by MITRE itself...

Regards,
Marta

On Thu, May 16, 2024 at 3:26=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> Hello Marta,
>
>
>
> Glibc fixes are already staged in scarthgap-nut.
>
> Interesting would be to check why the prototype does not list glib-2.0
> CVE-2024-34397 which is staged there, too.
>
>
>
> Peter
>
>
>
> *From:* yocto-security@lists.yoctoproject.org <
> yocto-security@lists.yoctoproject.org> *On Behalf Of *Marta Rybczynska
> via lists.yoctoproject.org
> *Sent:* Thursday, May 16, 2024 15:21
> *To:* yocto-security@lists.yoctoproject.org; OE-core <
> openembedded-core@lists.openembedded.org>
> *Cc:* Richard Purdie <richard.purdie@linuxfoundation.org>; Steve Sakoman =
<
> steve@sakoman.com>; liezhi.yang@windriver.com; wangmy@fujitsu.com; Khem
> Raj <raj.khem@gmail.com>
> *Subject:* [yocto-security] CVE status for scathgap on 2024-05-16 and ask
> for help
>
>
>
> > Hello all,
>
> > The prototype CVE check via the MITRE database is giving the following
> for scathgap today (adding maintainers of affected packages in copy):
>
> >
>
> > CVE-2024-32002.json: affected: git 2.44.0
> > CVE-2024-32004.json: affected: git 2.44.0
> > CVE-2024-32020.json: affected: git 2.44.0
> > CVE-2024-32021.json: affected: git 2.44.0
> > CVE-2024-3205.json: affected: libyaml 0.2.5
> > CVE-2024-32465.json: affected: git 2.44.0
> > CVE-2024-33599.json: affected glibc 2.39
> > CVE-2024-33600.json: affected: glibc 2.39
> > CVE-2024-33601.json: affected: glibc 2.39
> > CVE-2024-33602.json: affected: glibc 2.39
>
> >
>
> > I would also like to ask for volunteers to help with looking up the
> following CVEs and submitting fixes to
> https://github.com/mrybczyn/cvelistV5-overrides/tree/overrides if they
> are malformed:
>
> > go: CVE-2024-24788, CVE=3D2024-24787
>
> > aiohttp: CVE-2024-30251
>
> > x server: CVE-2024-31053, CVE-2024-31082
>
> > bluez: CVE-2023-27349, CVE-2023-50229, CVE-2023-50230
>
> > gstreamer: CVE-2023-50186, CVE-2023-44446
>
> > less: CVE-2024-32407
>
> > ncurses: CVE-2023-45988
>
> > ofono: CVE-2023-4234, CVE-2023-4233
>
> >
>
> > If you have any question on how to do that, ask me.
>
> >
>
> > Kind regards,
>
> > Marta
>

--000000000000bd241d0618923804
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you Marko for the feedback! For CVE-2024-34397 =
the reason is simple:</div><div><br></div><div>&quot;affected&quot;: [<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vendor&quot;:=
 &quot;n/a&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;product&quot;: &quot;n/a&quot;,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;versions&quot=
;: [<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;version&quot;: &quot;n/=
a&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;status&quot;: &quot;affected&quot;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],</div><div><br></div><div>=
I&#39;m fixing this... Strange that this one was assigned by MITRE itself..=
.</div><div><br></div><div>Regards,</div><div>Marta<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 16=
, 2024 at 3:26=E2=80=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@si=
emens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div class=3D"msg-8372015783517696480">





<div style=3D"overflow-wrap: break-word;" lang=3D"EN-US">
<div class=3D"m_-8372015783517696480WordSection1">
<p class=3D"MsoNormal">Hello Marta,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Glibc fixes are already staged in scarthgap-nut.<u><=
/u><u></u></p>
<p class=3D"MsoNormal">Interesting would be to check why the prototype does=
 not list glib-2.0 CVE-2024-34397 which is staged there, too.<u></u><u></u>=
</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Peter<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:yocto-security@lists.=
yoctoproject.org" target=3D"_blank">yocto-security@lists.yoctoproject.org</=
a> &lt;<a href=3D"mailto:yocto-security@lists.yoctoproject.org" target=3D"_=
blank">yocto-security@lists.yoctoproject.org</a>&gt;
<b>On Behalf Of </b>Marta Rybczynska via <a href=3D"http://lists.yoctoproje=
ct.org" target=3D"_blank">lists.yoctoproject.org</a><br>
<b>Sent:</b> Thursday, May 16, 2024 15:21<br>
<b>To:</b> <a href=3D"mailto:yocto-security@lists.yoctoproject.org" target=
=3D"_blank">yocto-security@lists.yoctoproject.org</a>; OE-core &lt;<a href=
=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">open=
embedded-core@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;; Stev=
e Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@=
sakoman.com</a>&gt;; <a href=3D"mailto:liezhi.yang@windriver.com" target=3D=
"_blank">liezhi.yang@windriver.com</a>; <a href=3D"mailto:wangmy@fujitsu.co=
m" target=3D"_blank">wangmy@fujitsu.com</a>; Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<b>Subject:</b> [yocto-security] CVE status for scathgap on 2024-05-16 and =
ask for help<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">&gt; Hello all,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; The prototype CVE check via the MITRE database =
is giving the following for scathgap today (adding maintainers of affected =
packages in copy):<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; CVE-2024-32002.json: affected: git 2.44.0<br>
&gt; CVE-2024-32004.json: affected: git 2.44.0<br>
&gt; CVE-2024-32020.json: affected: git 2.44.0<br>
&gt; CVE-2024-32021.json: affected: git 2.44.0<br>
&gt; CVE-2024-3205.json: affected: libyaml 0.2.5<br>
&gt; CVE-2024-32465.json: affected: git 2.44.0<br>
&gt; CVE-2024-33599.json: affected glibc 2.39<br>
&gt; CVE-2024-33600.json: affected: glibc 2.39<br>
&gt; CVE-2024-33601.json: affected: glibc 2.39<br>
&gt; CVE-2024-33602.json: affected: glibc 2.39<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; I would also like to ask for volunteers to help=
 with looking up the following CVEs and submitting fixes to
<a href=3D"https://github.com/mrybczyn/cvelistV5-overrides/tree/overrides" =
target=3D"_blank">https://github.com/mrybczyn/cvelistV5-overrides/tree/over=
rides</a> if they are malformed:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; go: CVE-2024-24788, CVE=3D2024-24787<u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; aiohttp: CVE-2024-30251<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; x server: CVE-2024-31053, CVE-2024-31082<u></u>=
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; bluez: CVE-2023-27349, CVE-2023-50229, CVE-2023=
-50230<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; gstreamer: CVE-2023-50186, CVE-2023-44446<u></u=
><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; less: CVE-2024-32407<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; ncurses: CVE-2023-45988<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; ofono: CVE-2023-4234, CVE-2023-4233<u></u><u></=
u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; If you have any <span class=3D"m_-8372015783517=
696480ng">question</span> on how to do that, ask me.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; Kind regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; Marta<u></u><u></u></p>
</div>
</div>
</div>
</div>

</div></blockquote></div>

--000000000000bd241d0618923804--


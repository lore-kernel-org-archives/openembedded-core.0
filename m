Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34E5C73C66
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 10:17:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.8237.1750313542694871299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 23:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sifive.com header.s=google header.b=k3aDzzMj;
 spf=pass (domain: sifive.com, ip: 209.85.128.49, mailfrom: jimmy.ho@sifive.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453426170b6so8953115e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 23:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750313541; x=1750918341; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cYanlfONYj9XYK9YfnTmV4KmkpsrqcXkW1mkky6CWpY=;
        b=k3aDzzMjIbd9R4zQqV60mp4v80PM3VOjiphGG3N/fzHb/tSk0O9ju7QEdPtwFOLVop
         UB+l7X5UpGH5H2Sv/RcgKyF3Vh6YakfqHYx/U4R3R/PXRCm18Sb/fcD1HUr6RtH/uiYz
         fnbkUmHSCInJkabJoHvCtLk82qBCVv9q3d59c6l7+Hylt6vbRb5+7aY+e6YkkQEmD2+c
         NBjN0Po4gi6g0DNbyatXs5J/RLCQo0ywoUy4vPyCdbDatamYNmrIsa8sEw1jwXJGec5D
         w5mhi/sFqfZgcvsKd/QDuGCkahh7/f7NLV6G43/HmvVGlLnrt/d6rm4t88u1nsVUEBet
         WGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750313541; x=1750918341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYanlfONYj9XYK9YfnTmV4KmkpsrqcXkW1mkky6CWpY=;
        b=jE5cEu/ofBGbKb5FqwJHei1O3rvADXLJ21y8l8zfLopC0w7QvqnnkCNMumMZ8Wxix/
         r12WdWuKptYrKyxs7wUq0ZGxNkKL9/IAyBWtCOi0Fj9iVlKUXQqSDzIfwIchRTr8VH4K
         jEPXQaKinGyDswjNHgjpZik1gGPvLyTuOsUh/FXUPR9SNqFy8GtQtIytE5hHbW/1DLEF
         c8+fz4eKCfJZ5apo41ZawMeeK6q1KMDXSej4b03L9mBEZ4cwGOl2xgXfym+9Nyrkowt4
         aO/wPWX9uD7RJeLKuO901u3WtAGBs6oAk+krx3myuGtp0GNNEuaQw69pBiBuJWAzuXNR
         ZJ5g==
X-Gm-Message-State: AOJu0YyUXaiBA+SodMClcRKiJ9dw4QKDG6Pu5Xuq8cWmU4hpzG+Iz7VK
	FY17ZGP+vGWq9nqrL1HQ2V2EiFJBHk4oizIIQ2gGYGHVX+HMVCGtOCKgmSyqgwe7T/C4AVZIq/t
	8UEUAhIxcp3n6PB5g2b4NOYnufS/eS0rXEsvk1Vl4rg==
X-Gm-Gg: ASbGncvATByc8JwhiAYboSa7MavNUqpBq397+mBAogWy57+Jnb3WbdvCPpNBm04i4Lh
	wxV//9mM8D6eNkRsnV7ceZqXiHOJoYrXfucSLVLwxOUzJGDFtfBoQFRwlhec+op9ErSlKy6wejD
	5kgnOKl1nQGLEhe3va/19lVTOU1943Om+6veQkxgxKyt8uJg==
X-Google-Smtp-Source: AGHT+IEXHgD5/Ny7/hi7b8hlj2HZC4EK91ilkUO5boXADe6eVQgdd5mjY4kEtVI8JWmL4Km/ZaNEeAErGEMhgdwOF+M=
X-Received: by 2002:a05:6000:400d:b0:3a4:e231:8632 with SMTP id
 ffacd0b85a97d-3a6c96ba73dmr1652825f8f.12.1750313541038; Wed, 18 Jun 2025
 23:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250616074341.32477-1-jimmy.ho@sifive.com> <CANNYZj-njPQU9VN3yxZSs1cRiWNvZ172nzV=abD2jVm0mGfpdQ@mail.gmail.com>
In-Reply-To: <CANNYZj-njPQU9VN3yxZSs1cRiWNvZ172nzV=abD2jVm0mGfpdQ@mail.gmail.com>
From: Jimmy Ho <jimmy.ho@sifive.com>
Date: Thu, 19 Jun 2025 14:12:09 +0800
X-Gm-Features: Ac12FXxUlkdiG8dSrNHYE-bhVyqXmeu3sYsz24vEgLldPdTJUcUDDhtjwNBCyms
Message-ID: <CAJh9TSLZvZG6VJdqOZiMhGJykKQHCf2uem3ebVxRH_0o0FahYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nfsrootfs: disable warning message if bootargs root parameter have not been defined
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dc07f80637e6a001"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 10:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219063

--000000000000dc07f80637e6a001
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Alexander:
in one of our use case, we don't define root in bootargs,
if [ ${bootparam_root} !=3D "/dev/nfs" ] will output /init.d/85-nfsrootfs:
line 4: [: !=3D: unary operator expected
by checking   if [-z ${bootparam_root} ] can clear this warning message
thanks
best regards
jimmy ho

On Mon, Jun 16, 2025 at 9:52=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Mon, 16 Jun 2025 at 13:56, Jimmy Ho via lists.openembedded.org
> <jimmy.ho=3Dsifive.com@lists.openembedded.org> wrote:
> >  nfsrootfs_enabled() {
> > -       if [ ${bootparam_root} !=3D "/dev/nfs" ] || [ -z
> ${bootparam_nfsroot} ]; then
> > +       if [ -z ${bootparam_root} ] || [ ${bootparam_root} !=3D "/dev/n=
fs"
> ] || [ -z ${bootparam_nfsroot} ]; then
> >                 return 1
> >         fi
> >         return 0
>
> This needs a bit more explanation. What is the warning message, why
> does it need to be disabled, and how does the above change achieve it?
>
> Alex
>

--000000000000dc07f80637e6a001
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi Alexander:<div>in one of our use case, we don&#39;t def=
ine root in bootargs,<span style=3D"color:rgb(80,0,80)">=C2=A0<br>if [=C2=
=A0</span><span style=3D"color:rgb(80,0,80)">${bootparam_root} !=3D &quot;/=
dev/nfs&quot; ] will output=C2=A0</span><span style=3D"background-color:tra=
nsparent;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,=
Consolas,&quot;Liberation Mono&quot;,monospace;color:rgb(31,35,40);font-siz=
e:11.9px">/init.d/85-nfsrootfs: line 4: [: !=3D: unary operator expected</s=
pan></div>by checking=C2=A0=C2=A0<span style=3D"color:rgb(80,0,80)">=C2=A0i=
f [-z ${bootparam_root} ] can clear this warning message=C2=A0</span><div><=
span style=3D"color:rgb(80,0,80)">thanks=C2=A0</span></div><div><span style=
=3D"color:rgb(80,0,80)">best regards=C2=A0</span></div><font color=3D"#8888=
88"><div><span style=3D"color:rgb(80,0,80)">jimmy ho</span></div></font></d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Jun 16, 2025 at 9:52=E2=80=AFPM Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mo=
n, 16 Jun 2025 at 13:56, Jimmy Ho via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;jimmy.ho=3D<a href=3D"mailto:sifive.com@lists.openembedded.org" target=
=3D"_blank">sifive.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;=C2=A0 nfsrootfs_enabled() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${bootparam_root} !=3D &quot;/dev/nfs=
&quot; ] || [ -z ${bootparam_nfsroot} ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z ${bootparam_root} ] || [ ${bootpar=
am_root} !=3D &quot;/dev/nfs&quot; ] || [ -z ${bootparam_nfsroot} ]; then<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>
<br>
This needs a bit more explanation. What is the warning message, why<br>
does it need to be disabled, and how does the above change achieve it?<br>
<br>
Alex<br>
</blockquote></div>

--000000000000dc07f80637e6a001--


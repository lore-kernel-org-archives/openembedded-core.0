Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA85C3ABB2
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 20:01:53 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.4587.1726516906094102332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 13:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VbGNdj9u;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so53436701fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 13:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726516904; x=1727121704; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4hH6lmEy6r4nlp6Ks25YO0gdMTP+Pn7acxB2c8megXw=;
        b=VbGNdj9uu8jKl/Vetq5UwfNztIHEeoq6JJxdBtyaZN8Cm8JqN43nKMfZNTTRTLI0yQ
         lCghYewPorR1T1NzdWjH4ymF9b+0NPKlDW8n3L5bwax1qAOIPNAnI3Vm7O1D73fvYnTQ
         Ty8Dngg/fdO8WYPq4v0i1Ep6NSQ9CaqZ1gi/XBtS0+7+RTan6ynr1vznUyVVl890l4Ty
         1fc4i9JwAnGq3Xc6IW3W17wsikZXw2Np5NiBj86lLArNSdXwJGiVArBTxdy2VB34IoEN
         TNVvSVLhadVSnt+wZn5nTae1PqlcsNk/O8GQYGW+4uEr7efiCQdIkaym+HLyUaPVmvi/
         gSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726516904; x=1727121704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hH6lmEy6r4nlp6Ks25YO0gdMTP+Pn7acxB2c8megXw=;
        b=PI7Pf1nzGaC2teoDQ7gBY1WwsaZsKOpPYCH7gUoDQXxF2fYvZTwmWitgXI9qMT+BjR
         6roQuv4NCPAV8MM4QKOYANAZ8cl74B0WCl/KSC4ZbM5+0ITX0xXZiYSRagXmXIOAW4aS
         MF1YFf902wxOycw8XaJNu+vmpeyHLZy3S6ux606sI3EDdWEAh/zKoCL65J8Z6IdZosjx
         QKDhANT8On49O5wz4uVdVWeDZCQ3O6eyPDGC/QMDwXfgHLTnnHoAHL9FoFavVznsqaYq
         QqQ30vxVGzjDO34WlIWwZKxw3xgM6FmePFl8kEde9HbMLfjldUvEWOAt9o4E+1XSE00G
         TpSw==
X-Forwarded-Encrypted: i=1; AJvYcCUf29vLgYVVJ3GOlF/3n/W13TK9+V6wE77NkEl6XC0H52gVUB/76aBkDDXQJ4buyDBSKuDI+pTelCLFDb4R9EhSjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YywmdtL5qjEUgXKNnWZO+mqNYKcOkLJPkh9YML7cgDez4n0CmxZ
	/1nVnedI/Kd7RzF/4/lA6Nvj33o15hVX2nKh7AuZDPM1aDGkDpoK3zWT9xB+y+gtQJAfFg2L7Ps
	jJR0li47EFVBvkZoddKPYrM/YFg0=
X-Google-Smtp-Source: AGHT+IHR2KdkKUORt5110/IcVg3oinMlxvQl6jX/yD4M5qiXS02xXzXZmrhuy/9LZKGHulNS3FJGY5A5m6R0kOT68dw=
X-Received: by 2002:a05:651c:210d:b0:2ef:2dc7:a8f7 with SMTP id
 38308e7fff4ca-2f787da4d8bmr79989731fa.7.1726516903353; Mon, 16 Sep 2024
 13:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <DU0PR10MB7076812C64238EC056EFCE1AAD602@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DU0PR10MB7076812C64238EC056EFCE1AAD602@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Sep 2024 22:01:32 +0200
Message-ID: <CANNYZj90D5mtHdiviR7uG9j-ntWZHFvdPqDi3+zgxf2TmSORcA@mail.gmail.com>
Subject: Re: [OE-core] Backport fix for inter-recipe useradd dependencies bug #13419
To: mark.jonas@de.bosch.com
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"steve@sakoman.com" <steve@sakoman.com>, "pidge@baylibre.com" <pidge@baylibre.com>, 
	"alex@linutronix.de" <alex@linutronix.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Simoes Ricardo (BT-FS/ENG1.1-Ovr)" <Ricardo.Simoes@pt.bosch.com>
Content-Type: multipart/alternative; boundary="000000000000b9292b0622420a76"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 20:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204610

--000000000000b9292b0622420a76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We can certainly discuss in person in Vienna but my answer for now is that
you should implement the workaround suggested by me in the bug.

Alex

On Mon 16. Sep 2024 at 21.39, Mark Jonas via lists.openembedded.org
<mark.jonas=3Dde.bosch.com@lists.openembedded.org> wrote:

> Hello Steve and Richard,
>
> I am wondering whether it would be reasonable to ask for backporting of
> the fix for inter-recipe useradd dependencies to Kirkstone?
>
> I am referring to the fix for bug #13419 which was fixed on Scarthgap.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13419
>
> I understand that the backporting would involve the addition of
> USERADD_DEPENDS to useradd.bbclass as well a fix to bitbake.
>
> My colleague Ricardo and I are visiting the OSSEU this week in case
> somebody would like to discuss this in person.
>
> Cheers,
> Mark
>
> Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)
> Bosch Sicherheitssysteme GmbH | Fritz-Sch=C3=A4ffer-Stra=C3=9Fe 9 | 81737=
 M=C3=BCnchen |
> GERMANY | www.boschsecurity.com
>
> Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
> Aufsichtsratsvorsitzender: Frank Meyer; Gesch=C3=A4ftsf=C3=BChrung: Thoma=
s Quante,
> Peter L=C3=B6ffler, Henrik Siegle, Peter von Wartenberg
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204609):
> https://lists.openembedded.org/g/openembedded-core/message/204609
> Mute This Topic: https://lists.openembedded.org/mt/108488497/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b9292b0622420a76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">We can certainly discuss in person in Vienna but my answe=
r for now is that you should implement the workaround suggested by me in th=
e bug.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 1=
6. Sep 2024 at 21.39, Mark Jonas via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;mark.jonas=3D<a href=3D"mailto:de.bosch.=
com@lists.openembedded.org">de.bosch.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border=
-left-color:rgb(204,204,204)">Hello Steve and Richard,<br>
<br>
I am wondering whether it would be reasonable to ask for backporting of the=
 fix for inter-recipe useradd dependencies to Kirkstone?<br>
<br>
I am referring to the fix for bug #13419 which was fixed on Scarthgap.<br>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13419" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13419</a><br>
<br>
I understand that the backporting would involve the addition of USERADD_DEP=
ENDS to useradd.bbclass as well a fix to bitbake.<br>
<br>
My colleague Ricardo and I are visiting the OSSEU this week in case somebod=
y would like to discuss this in person.<br>
<br>
Cheers,<br>
Mark<br>
<br>
Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)<br>
Bosch Sicherheitssysteme=C2=A0GmbH | Fritz-Sch=C3=A4ffer-Stra=C3=9Fe 9 | 81=
737 M=C3=BCnchen | GERMANY | <a href=3D"http://www.boschsecurity.com" rel=
=3D"noreferrer" target=3D"_blank">www.boschsecurity.com</a><br>
<br>
Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118<br>
Aufsichtsratsvorsitzender: Frank Meyer; Gesch=C3=A4ftsf=C3=BChrung: Thomas =
Quante, Peter L=C3=B6ffler, Henrik Siegle, Peter von Wartenberg<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#204609): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/204609" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/204609</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108488497/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108488497/1686489</a><br>
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

--000000000000b9292b0622420a76--


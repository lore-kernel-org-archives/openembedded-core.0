Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CA3C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 12:17:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.32749.1744287455196389928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cKPH9Kq0;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edb40f357so6608965e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744287453; x=1744892253; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OnSD5XZMQKidxfJivDOlwz5Dj495WS6gGrIQdX3wI6Q=;
        b=cKPH9Kq0P/Hn07zBXGrCeyy32LN+ZNtrFX7+1kU5Ic85pgxWZwGDD+DS9TuW/X1nPP
         oTZpMILdDjYyapnFMy0Aaq+N5LbYHh1/eQEBmfmSiH48CXoM/tCZ0ZkxzNu0FtC19JCc
         ERx1cHnSFwnVY1VPVjJtjEVI07FUXjwURUjaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287453; x=1744892253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnSD5XZMQKidxfJivDOlwz5Dj495WS6gGrIQdX3wI6Q=;
        b=TyQVKPii07JGpTXlsn4jS95/bHopC8iO+XXGOE4iDYmP/dR0zEataFGfRiYOr55D23
         d+oR/U4pNTb+xDmdEuFdqOxXdKLfqGCJarJMLvRbvEmXk0LlfuNLU1KIRN6RAJvJJOpI
         jc+CgjiVqNNdDchSpFXiU0aln7MAlpeB3ZY87Mep6Ji97HAUUFMKvuK7Jdz1UQnMXKTy
         Ih/cbOgNpJvWJeWbIr5gD4KiJtSoHx/+75lrroXE3J918a1RdoWTv6ESVbhqvYuQodDR
         tvMtKzUOgTVe323mPHjGi0+GLQtW1NUPQjOAiPAjrwH9ZFqygTuXYYEeXbatsyCCPkiT
         Hvag==
X-Forwarded-Encrypted: i=1; AJvYcCWltimGWqEJ0wW+ETxwjIH3fr9xeeVLUoVoDR3LPb2yhlfpHiy0VEH7DZr1X0OizzfV+f8Ns1BKUXwjOw8urhJWqw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzdQhxvB7fLgeccuJWe7wSyXIOXRzx/5Zf4zhsJIYRWZmBS1d7M
	IjyGSQE6Yc4+FX/VpC11CLeEV4Axu8aJSKvnueELnN4xuDmBm9sTk3EYmKEHxlfSzVCc9X4mcwL
	DgVOd5cpFdeSkScmHv/QlQEUAcfQCg+zhHk4iuQ==
X-Gm-Gg: ASbGncv4aaMRwU7tVmnTS9ywHKfrN/ochtGh63Oddr3fJXF4zMdPmQ9bXAx633bRrH3
	xLZahphkgfnijI+7OalETnLJaSEInt7cR1sbnZcAxZ9pblMMSXTAcihy9YyZbKAKVmjkAtYSZOF
	oufxE9aPmybTrDPG42Kz68Y9F3
X-Google-Smtp-Source: AGHT+IEb/zg7ieZEfJbYCWV4T8YZLtC/nEhzGcelUUCgy3R0YiJ6RlkAqitiqErnb90rUl7q21UZESGTONJgpPfixQ4=
X-Received: by 2002:a05:600c:3c91:b0:43c:fab3:4fad with SMTP id
 5b1f17b1804b1-43f2d7e932emr32825485e9.16.1744287453497; Thu, 10 Apr 2025
 05:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250407174904.1191173-1-jeroen@myspectrum.nl>
 <a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundation.org>
 <ecc77fe1-4e85-407c-aa6e-e4b8dcb6e96b@myspectrum.nl> <687a5c15fb54930b999cf16a59baaff8f9897a94.camel@linuxfoundation.org>
 <7eb23b12-1fd1-48a5-83cd-eab2edb8777b@myspectrum.nl> <CANNYZj-+Td=3EtykeKT3mEq-0c6Ue5EKQ9if_3OCY3TrxTPUJg@mail.gmail.com>
In-Reply-To: <CANNYZj-+Td=3EtykeKT3mEq-0c6Ue5EKQ9if_3OCY3TrxTPUJg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 10 Apr 2025 14:17:06 +0200
X-Gm-Features: ATxdqUExtmxU1LCxCSpvo54f83QR_9by9MHNWB0gdSU_HYuA4tGLeS2NlU4xO88
Message-ID: <CAMSfU+4QKpU=2YaO8L03R+aBzByUq=x3h-sn8yy3rRCxX==YmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] udev-extraconf: fix ifupdown for non hotplug devices
To: alex.kanavin@gmail.com
Cc: oe@myspectrum.nl, richard.purdie@linuxfoundation.org, 
	Jeroen Hofstee <jeroen@myspectrum.nl>, openembedded-core@lists.openembedded.org, 
	Jeroen Hofstee <jhofstee@victronenergy.com>
Content-Type: multipart/alternative; boundary="0000000000000d684606326b92b4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214659

--0000000000000d684606326b92b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 10 avr. 2025 =C3=A0 12:14, Alexander Kanavin via lists.openembedded=
.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> On Wed, 9 Apr 2025 at 12:40, Jeroen Hofstee via lists.openembedded.org
> <oe=3Dmyspectrum.nl@lists.openembedded.org> wrote:
> > For completeness, this is not some theoretical issue, always calling if
> up
> > directly after a network device is discovered does cause issues and is
> > against spec as well.
> >
> > The sed stuff isn't that complicated, is it?
>
> I beg to differ. The code is basically unreadable (unless you want to
> write an elaborate comment with example input->output transformations
> for every single line it), and that in itself is reason not to take
> it. Any software solution must not only solve the problem, it must
> also be written such that other humans can understand and change it.
>
> I think I'd prefer a patch to busybox; even if upstream rejects or
> ignores it, we still have something that is easier to take care of.
>

FWIW, I agree with Alexander here.
A patch (even a local one) will be easier to maintain in the long run.


>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214638):
> https://lists.openembedded.org/g/openembedded-core/message/214638
> Mute This Topic: https://lists.openembedded.org/mt/112138312/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000000d684606326b92b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 10 avr. 2025 =C3=A0=C2=A012:14, =
Alexander Kanavin via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 9 Apr 2025=
 at 12:40, Jeroen Hofstee via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;oe=3D<a href=3D"mailto:myspectrum.nl@lists.openembedded.org" target=3D"=
_blank">myspectrum.nl@lists.openembedded.org</a>&gt; wrote:<br>
&gt; For completeness, this is not some theoretical issue, always calling i=
f up<br>
&gt; directly after a network device is discovered does cause issues and is=
<br>
&gt; against spec as well.<br>
&gt;<br>
&gt; The sed stuff isn&#39;t that complicated, is it?<br>
<br>
I beg to differ. The code is basically unreadable (unless you want to<br>
write an elaborate comment with example input-&gt;output transformations<br=
>
for every single line it), and that in itself is reason not to take<br>
it. Any software solution must not only solve the problem, it must<br>
also be written such that other humans can understand and change it.<br>
<br>
I think I&#39;d prefer a patch to busybox; even if upstream rejects or<br>
ignores it, we still have something that is easier to take care of.<br></bl=
ockquote><div><br></div><div>FWIW, I agree with Alexander here.</div><div>A=
 patch (even a local one) will be easier to maintain in the long run.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214638): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214638" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214638</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112138312/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112138312/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000000d684606326b92b4--


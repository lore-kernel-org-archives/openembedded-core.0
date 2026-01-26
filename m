Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6686ED13C3F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 16:02:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23227.1769443357297614703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 08:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=egfXqQQu;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: liu.ming50@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so2249041a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:02:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769443357; cv=none;
        d=google.com; s=arc-20240605;
        b=QgD7xcMPQZW1B0mnoGZGIpbCqWlWSS2zz3Q9ZdgdV5YSxa0sdGtKwLQ5CK1LVqqOC0
         DsgGZymAZn1okQiRA0MbRORZxcfLSNJzbl+Rx0mBCYvIRBavXfafmjk0eQ6jTF7QXjVw
         vqMS9SBEjwvxHVEQJAtcDnA2DyaYdH7fHypo9cEm+U6gJuY4Qul+6LwARNunAddS7U3p
         qnONhC3l7S3jb6F0hkmGro7qRfePa2Ct7+gz6/8avPdX/kp5RyUQ4gpQu5pmy7e04mq8
         GpHT539ERMH5zXqYVWuMqK9gc07xUa6r17fCzPRNjc4SJgIKIl15T/qyPOPHLipUP6e4
         im+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kAu79G00ZfhdqBEmPe+BtfU91y5ZOuG1j8BTsyR5RD0=;
        fh=toEqJZwqRVBtWFdjvbnHcK/jgjDz0NeahqiJS/bEzeo=;
        b=apx440b+50zDNybajH9TRcEcwPvmijoCJEo4c2DyS3Xgpz0tDPXXHoXChaHycuKlt7
         +HvPgwWm3fPwqFVw+wHnYmQ94Hq6FxV0gIJiIa2ADxLlp9XuEJTDRI42LOi4UqYiSeKa
         erzdSa7dUzUkkL51wGbrcGn9ZUj80BD0Bnd08t1icvLANrY0DfMz8hnvr7y3GQiBMh2t
         f+JrRbXPRBklUiBfCj1p12RuVIUL1woImoPcZ+aDA7SPyZWxeaBHtMi69kiGYC0+g4uu
         AkAqFRA1sABzejXAJTUvmu61zjyyaaTgsc77I9lvKw0BAm4Q7a5mV47mrrik4dTK3YqX
         nZiQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769443357; x=1770048157; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kAu79G00ZfhdqBEmPe+BtfU91y5ZOuG1j8BTsyR5RD0=;
        b=egfXqQQuDQkUCSQWJ9GflQgn9vMbO8cfyoRAgpVmH/2LqqPO/viIrxI03rdsXh1cX2
         3F4AeFcAIS8njBTKME7gFxVLT8470wCKlqXldOGj/1aUqB5y99qLDAVf8hUoKKq0s6+O
         NfOK9bbqLhF01aXUkDjqnJd5VoLye7jIO9uMP50hDCknpMTcKT0UXRHGfDOdTWuQTWgx
         ubA/CXXg6IEqRH0hetxrRW5MDyEdcQ3jBfngwCKYBjfMEDSH+GUnazgzvDI8Pfv3c+yf
         B4peOndTbC4+pKqV9vFSAJlA6Tg+acm5RFfX4XWvydKmSHagJ04OJtCO4jAz4sajaeNk
         mqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769443357; x=1770048157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAu79G00ZfhdqBEmPe+BtfU91y5ZOuG1j8BTsyR5RD0=;
        b=o78JcdqrUQP7zZv9WjyFDovDudSjhdL5ASXZrIGrDpY9IF4ZHnxsnuwhWyWTI06bbP
         at+a/+IRAfaPtuFB76EVb4qZZEMjo3hhZVH+nDxljSEyP9y9gbMbXzhwpVejucjz2TM4
         C0kyttXFYmJZZQIaCe8YXTQJGHZ+rUjbEKF4/Ar5ej89rtJTr+IWikR0BEv1JONwYWLM
         v8eBcgIYIsHACu9yat4ek8CEy8wtDuLVWtk/42/h3f4Ywg+IG+k+mwNDmU8/YXyUms7Z
         9eTG3Iykfr0+J9+mHDQeu2yABCeI5pBFjYatzj71ayGsZR68N5R22u0mrMd7CWM6RjTX
         4Dlg==
X-Gm-Message-State: AOJu0YwX4i5iIMCOHB++oNeyBprJ8/A5HKEEBYiyTUfw8wvX6RflLn9K
	00cL+qf2xLj91NRPqyiyJwOY15fqbTqvRvOwqOOZhZZKf19LMOeJIYZfe0rUs12Tj1gOmALxz8a
	qwKBJUFHm0hi1F2+ujnD+4DK/TiaHxOY=
X-Gm-Gg: AZuq6aJM4+8yDJnFQD0tJdRhBTDH9EI9G6hVEW/3Mte4lgjxlWtj8oCXXuSnBa5VdMT
	LcwqLGfT+pEEx1QFugfmpY5Ij8xJ2/BdUcPR69XcjQk61U7NolWAvjKTxRHkLMAz+Q/JXH/pFe+
	FV/lTGBXA8L4aBaVw5Ym+AfUs/F4Kt6+qbWcY2EDzzAFsM8VhumHSV5nt+Kbi6YncDqgcBuB2PU
	hGuXZXpPraldh6LklksZJHbfV59O4rS4xp4igHZS3//GpZC+itchIPIrfi+p4jYPdINeZ/CLmjk
	Ue7DITPKKuVvPxHbLpCkDrpzpK5LLM60joN2Sdu3Ygn2g7spkXtKtSh8hPuo
X-Received: by 2002:a17:90b:5703:b0:336:b60f:3936 with SMTP id
 98e67ed59e1d1-353c40c677cmr4638886a91.12.1769443356318; Mon, 26 Jan 2026
 08:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20260126140414.11731-1-liu.ming50@gmail.com> <CANNYZj_6oyX5kXUvdL018JhcrQPO4QER9zHfaUKYT_X+XrvWkw@mail.gmail.com>
In-Reply-To: <CANNYZj_6oyX5kXUvdL018JhcrQPO4QER9zHfaUKYT_X+XrvWkw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 26 Jan 2026 17:02:25 +0100
X-Gm-Features: AZwV_QgSA_dj8bwmEFAg-HQvQqNbif-mgM3luHuDh7K1aDmtMWJCh2xEdIqqGqc
Message-ID: <CALatG=6fL5Cs3amWgvDZLQZH-91gm-Lb4UFGecBeG9iBkdGdSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] elfutils: fix a compilation race issue
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b41f8006494ca2da"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 16:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230020

--000000000000b41f8006494ca2da
Content-Type: text/plain; charset="UTF-8"

OK, that makes sense, it must be a elfutils internal build issue, I will
keep investigating, please ignore this MR.

the best
Ming Liu


On Mon, 26 Jan 2026 at 15:04, Ming Liu via lists.openembedded.org
> <liu.ming50=gmail.com@lists.openembedded.org> wrote:
> > A following error was observed occasionally:
> >
> > | in function `_start':
> > |
> /usr/src/debug/lib32-glibc/2.39+git/csu/../sysdeps/arm/start.S:118:(.text+0x40):
> undefined reference to `main'
> >
> > the issue due to build/src/readelf.o is zero size.
> >
> > it can be fixed by inheriting autotools-brokensep per test.
>
> I don't understand. If something is racing around creating and
> accessing some .o file, it will continue to race regardless of where
> the build directory is located.
>
> This needs a proper investigation and fix.
>
> Alex
>

--000000000000b41f8006494ca2da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">OK, that makes sense, it must be a elfutils internal buil=
d issue, I will keep investigating, please ignore this MR.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">the best</div><div dir=3D"auto">Ming Liu=
</div><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)">On Mon, 26 Jan 2026 a=
t 15:04, Ming Liu via <a href=3D"http://lists.openembedded.org" rel=3D"nore=
ferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;liu.ming50=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; A following error was observed occasionally:<br>
&gt;<br>
&gt; | in function `_start&#39;:<br>
&gt; | /usr/src/debug/lib32-glibc/2.39+git/csu/../sysdeps/arm/start.S:118:(=
.text+0x40): undefined reference to `main&#39;<br>
&gt;<br>
&gt; the issue due to build/src/readelf.o is zero size.<br>
&gt;<br>
&gt; it can be fixed by inheriting autotools-brokensep per test.<br>
<br>
I don&#39;t understand. If something is racing around creating and<br>
accessing some .o file, it will continue to race regardless of where<br>
the build directory is located.<br>
<br>
This needs a proper investigation and fix.<br>
<br>
Alex<br>
</blockquote></div></div>

--000000000000b41f8006494ca2da--


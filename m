Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE23C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 20:22:57 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.6496.1716841367007194791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 13:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DFUn3O8h;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6f8ed204e13so117832a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716841366; x=1717446166; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4r0CRmeUW1Mb6cfb3djkUmcfSoRfBKyZK6FB0C1PPnY=;
        b=DFUn3O8hvUqXSIn045/VLa3HCp0AZVjArNgDDGJPAbAE1OXmyTpiXesXisFYBhtlJx
         62xWihhVEtohYOe11UP0kQgAThpPNxa3M8dLZMef8Heh1hifJYrJN12fF6ZKwyjz1WSv
         iIzOmSEaF/rryTSGcQyFf8RW/NSCwtXgav2UDpGUl6PwLJ4IXivIclhLZhTQo4Y2+Tk/
         XaHnHohl2PXF6YQPwkzflL1EVXQJbV3F9koLT5eE5whx6MHpasFWSIJ4c9mYc/DbcDTg
         FAwB4iAiEadMoetSK6NZUlcgbV+JAadsLzSUpIvCpVeDFbwQ5dYVqmCEHAEeu2xw6clq
         uQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716841366; x=1717446166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4r0CRmeUW1Mb6cfb3djkUmcfSoRfBKyZK6FB0C1PPnY=;
        b=Db1a6MZQYMXAqb8OW2QgxWepnGalIdU9t3ksu26/am1ojA30FgxLVoBWQhEiUlwyLj
         iACelgimy/NsKg4zbEiW/q4Soc7SVs7CLzrGBKyZQ3AnUZBQBG3iSoytIufDJWJuwvh+
         Zs/Sl5sTpNkxXsQO8QiTzy2mhW/SCyfmWR61K5Wvs92Zy0FsuGxU9qpnt8mL3q2L+A+3
         NPT4rxtAekMCMr25++qrHQ9J/Ljk5s8lI/p+WSI5LHuOxMKlgqMjXoPTGHMSp77QOHIM
         oXE5xfPzQf/WbXnwXYQuX644XbiqY50xZTGIJRXe7wp9/IqT2awSmWpR80YEZhev5dWy
         3Tqg==
X-Forwarded-Encrypted: i=1; AJvYcCWM/fRiYCJeZhSKIBBxkDa5kmG1NUSFSR+sYheyRQiHh9yMOLOPn23tOJhQHNlRsQbDtWexk/3Vt098nq9fbG9OX18YvunavoI0frYAMwxk29K1ymwWEq7h
X-Gm-Message-State: AOJu0YxVjsOjgl+PxVi3Es0wIJ5uLTdPx+dmctqGCmYHvgaZMnkvoleg
	2Tu6lGIgIo4fG7qELpl/k9+zpAzTz0D4w18hWWKwJ67AH2tNPCHb8B9WhiskNRu31qZ/+mVQ2C+
	CkEuLI3uuvaoVhEVWFZkP0t2MDlU=
X-Google-Smtp-Source: AGHT+IEChAczfX77wP/Fh+xufWBRe898ZMtoa3N+jA6OANCdcj3G372620k1aNCRNRItTPI9G2luDhbl8WMUMMn5miU=
X-Received: by 2002:a05:6870:700e:b0:24c:ba5b:54d6 with SMTP id
 586e51a60fabf-24cba5b6e45mr11098073fac.59.1716841366139; Mon, 27 May 2024
 13:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
 <20240527181214.1778037-7-alex.kanavin@gmail.com> <CAMKF1sr3rzt545xOEiukEpVPGPxyQ_VX+scB8gzySuP6tbuGMw@mail.gmail.com>
 <CANNYZj-282UQn2iELdYkQHBunkNDn1nZq6a=EKBx-BSUTvZZ8Q@mail.gmail.com>
In-Reply-To: <CANNYZj-282UQn2iELdYkQHBunkNDn1nZq6a=EKBx-BSUTvZZ8Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2024 13:22:34 -0700
Message-ID: <CAMKF1so2JOiUdm=g5b8X-OSvXZCwG76t6N+hUAZUr6JAxK5BLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/13] icu: upgrade 74-2 -> 75-1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3be7906197547c0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 20:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199941

--000000000000c3be7906197547c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 12:50=E2=80=AFPM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> On Mon, 27 May 2024 at 21:10, Khem Raj <raj.khem@gmail.com> wrote:
> > > +# Remove when https://github.com/harfbuzz/harfbuzz/issues/4671 is
> resolved
> > > +EXTRA_OEMESON +=3D "-Dcpp_std=3Dc++17>
> > GCC 13+ and clang16+ defaults to c++17, so I wonder why it does not wor=
k
> here.
>
> harfbuzz resets that to c++11:
> https://github.com/harfbuzz/harfbuzz/blob/main/meson.build#L7


I see. Thanks, ideally harfbuzz should have done it as a fallback if
default were not > c++11

> <https://github.com/harfbuzz/harfbuzz/blob/main/meson.build#L7>
>
> Alex
>

--000000000000c3be7906197547c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 27, 2024 at 12:50=E2=80=AFPM Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">On Mon, 27 Ma=
y 2024 at 21:10, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; +# Remove when <a href=3D"https://github.com/harfbuzz/harfbuzz/is=
sues/4671" rel=3D"noreferrer" target=3D"_blank">https://github.com/harfbuzz=
/harfbuzz/issues/4671</a> is resolved<br>
&gt; &gt; +EXTRA_OEMESON +=3D &quot;-Dcpp_std=3Dc++17&gt;<br>
&gt; GCC 13+ and clang16+ defaults to c++17, so I wonder why it does not wo=
rk here.<br>
<br>
harfbuzz resets that to c++11:<br>
<a href=3D"https://github.com/harfbuzz/harfbuzz/blob/main/meson.build#L7" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/harfbuzz/harfbuzz/bl=
ob/main/meson.build#L7</a></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I see. Thanks, ideally harfbuzz should have done it as a fallback=
 if default were not &gt; c++11</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"=
auto"><a href=3D"https://github.com/harfbuzz/harfbuzz/blob/main/meson.build=
#L7" rel=3D"noreferrer" target=3D"_blank"></a><br>
<br>
Alex<br>
</blockquote></div></div>

--000000000000c3be7906197547c0--


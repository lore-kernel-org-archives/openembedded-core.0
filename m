Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.6293.1612968099890493129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 06:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=THCY33Sy;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: raymsmithuk@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id f2so3112881ljp.11
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mNs3mCuEi758RBP4ia6Rsef+FV9tagfCvxOiV6v+WEo=;
        b=THCY33SyG1CKPox4oZUbcj7PGxspZ+6erjHx3jfJGlQhuTVX8gIeaDaz+m9sZWdgWT
         5lXWwtSNMN4MoHNMaMIO5FKRAChK0Ph6o1dPvWfRRBLEpn6cXktLlYNuHFAhv8jdJXse
         HOFqxAlTF/ddACcVuwK7WtmMQ2VVzIa166OHWKFTr4rh0cdqJfRtd6VhQ8p3tjzjGmcM
         tXhkAeza/ON7D1swH+05ngl456E9hiD9/gzX4NiFb3Sb1QhaTtq1q7C14RKIf2gKWrSc
         51IXN6uR7DopJfFFEsGWlIeSyUHftcRg8iNSdJVlPgMxxDSHwEbsSQZBDBINO07Bb4fx
         oqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mNs3mCuEi758RBP4ia6Rsef+FV9tagfCvxOiV6v+WEo=;
        b=TNsj+8+UOZVmNbj2ssvV0nRCeOrpxBHDGp5oY1O8ivxa60Hk4dF61fOSHtBTzBnOcL
         nQ+GLoGmeHZSj3vKS1jiiT6D2VnpEy0Mu91l3hU9+o6FfONEYCYJa+ZoGVTWl2LwY9ix
         fEZzexCGBwVchrxZB094R5o06q9FPp2K6i4VW8I7KHowAfs2w700XFKCCTV+7/JuFkGY
         xHt9Uvig/9SzKtA+vaiapygm8jkWxvWOKfKnYryKpJsq1jikNTwqWowB90T/+JqIgnOw
         2aNWkfrYOsuiFzYEFDgsjAB8k5pKUrU77HtxskF4Ck9Km/UtZVpMBOLj6ORto5jWW7XH
         mW5g==
X-Gm-Message-State: AOAM531t/FGAX0H0qcmIYoe27J+BdTTlGJrN8Nt57I4Ie5cl7HhGmOQv
	aU7sfAyaxA7Ra9bjJTUPpmGA/GfOqDDPvFQvZjo=
X-Google-Smtp-Source: ABdhPJwJxaLYm/8qm7e208PKN1MJVDXO65N8AEl2VAwq4/QX8nu9j4wQi200qm4Msh03a/8MAOLIn9YAo2cdBS2TddU=
X-Received: by 2002:a2e:7815:: with SMTP id t21mr2237107ljc.94.1612968097922;
 Wed, 10 Feb 2021 06:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20210210111113.17318-1-raymsmithuk@gmail.com> <CAP9ODKqqrhboqgEGa_7MRprs2OZhE8GMRFCS3K77Jt2-4G9KKw@mail.gmail.com>
In-Reply-To: <CAP9ODKqqrhboqgEGa_7MRprs2OZhE8GMRFCS3K77Jt2-4G9KKw@mail.gmail.com>
From: "Ray Smith" <raymsmithuk@gmail.com>
Date: Wed, 10 Feb 2021 14:41:26 +0000
Message-ID: <CAHS1ALKpm9+5Fa+roQ8ZJ3m3jGa3m=yymWpG8ftfEkVdAk+RqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000082c0be05bafc6608"

--00000000000082c0be05bafc6608
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021 at 1:26 PM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

>
> I didn't understand what you mean here. Could you elaborate this?
>
>
If you try to build mesa with PACKAGECONFIG "egl gles dri" you get an error:
../mesa-20.3.2/meson.build:144:4: ERROR: Problem encountered: building
OpenGL ES without OpenGL is not supported.

This means that in practice you can't get a GLES-only build of mesa, so
mesa always provides OpenGL (ignoring Vulkan). But for an abstract graphics
driver that's not true - many drivers provide GLES but not OpenGL. I'd
argue that this is an implementation detail (and maybe a minor bug) of
mesa. If mesa internally requires code from its OpenGL support to build
GLES, it should silently include that if it's been configured for GLES-only.

I only mention it to be clear that in general "GLES requires OpenGL" is not
true, even though mesa's build system enforces that.

--00000000000082c0be05bafc6608
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Feb 10, 2021 at 1:26 PM Otavio Salvador &lt;<a href=3D"mailt=
o:otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.br</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><br><div>I didn&#39;t understand what you mean here. Could you el=
aborate this?<br></div><br></div></blockquote><div><br></div><div>If you tr=
y to build mesa with PACKAGECONFIG &quot;egl gles dri&quot; you get an erro=
r:</div><div>../mesa-20.3.2/meson.build:144:4: ERROR: Problem encountered: =
building OpenGL ES without OpenGL is not supported.</div><div><br></div><di=
v>This means that in practice you can&#39;t get a GLES-only build of mesa, =
so mesa always provides OpenGL (ignoring Vulkan). But for an abstract graph=
ics driver that&#39;s not true - many drivers provide GLES but not OpenGL. =
I&#39;d argue that this is an implementation detail (and maybe a minor bug)=
 of mesa. If mesa internally requires code from its OpenGL support to build=
 GLES, it should silently include that if it&#39;s been configured for GLES=
-only.</div><div><br></div><div>I only mention it to be clear that in gener=
al &quot;GLES requires OpenGL&quot; is not true, even though mesa&#39;s bui=
ld system enforces that.<br></div></div></div>

--00000000000082c0be05bafc6608--

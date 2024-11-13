Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B3BD637C3
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 21:00:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.22314.1731531650148845562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 13:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AktM2CMY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so4659241f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 13:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731531648; x=1732136448; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c1m5v8CqIzjA9c51THZOxRZMaH9ofIT4iv0/ln+/Z38=;
        b=AktM2CMYwB9TOlrl4Wn1i3c1AMaTwlB8YgPoIOsHKhu9yQqGoafu0FYQEO9Phv8DSa
         G/aKnFxhF4HynfMS0jClX0VFPqaQaDGpjyqWabhKTpqVOzJJGWmVHcFAbdINuo/6/BLP
         /pRv3nqOCPE6xWbZe45Y9kkAFpcMl/slHGMgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731531648; x=1732136448;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c1m5v8CqIzjA9c51THZOxRZMaH9ofIT4iv0/ln+/Z38=;
        b=ldovH6X59GcL4+OQ7QLtmu2ZBxNztP/mCpM2tzgqjvDScl2Ao9fXDjPstXkHodOMtB
         YmE+Unqs+i6uFymNA1OkhNakx9aXEAZuIKKAOatX1O+GuKZ++xIxy9h61z92dOKXDb5t
         Ole/ET/7w8NvbhLUsY9i9w9OP08EHb5bvDzeZUCzQyNJ315cXUj2B3KalLp2NeD12dKF
         wuEI3BLVpdCHoTFzFMvM51Uwr/kTuFamtn7oDJ3onareiyQ/NkRAGRqbOo/2fKDr3OUI
         Kkhr91cQhWZ+mUFnkKNSLti+y7F1KNOD4bAmuuaP5Qlr/1qb7Qzuq7gmucA7YZ0Jom4J
         Y+xw==
X-Forwarded-Encrypted: i=1; AJvYcCUyniCQMJAafPlmXT52COr7ISrIq7DHRt0W1JukMwufo2GTI0tZPloPweAjLmoubMFtZPEzFU+Z7AkYuvaGLNLbwA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRl+t26yw/YtVXuo4IbM+yD5AU0m315Sfn5YHm7XtRSBSD9DPY
	9/jDI+S2Vg7/euL5EijNj2sc6Co6gaS27KBO+SovyHy6ydgGe4PiZjhoY4jpXvg=
X-Google-Smtp-Source: AGHT+IHaHOwIGYGzKXKEYX1qsdcyDeXThQwquwsrSTz7AwcD9XDLpbfoI/XA9H230lxA4ABBYkcufw==
X-Received: by 2002:a5d:47a4:0:b0:37d:4dcc:7fb4 with SMTP id ffacd0b85a97d-381f1863442mr15746769f8f.10.1731531648534;
        Wed, 13 Nov 2024 13:00:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ab73:49b3:d413:b355? ([2001:8b0:aba:5f3c:ab73:49b3:d413:b355])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381fc0f5f91sm10851030f8f.62.2024.11.13.13.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 13:00:48 -0800 (PST)
Message-ID: <09beb7916b128c124630fc188e63b2963895b05c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc-target.inc: Fix gcc symlink handling for
 multilib support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>,
 Deepthi.Hemraj@windriver.com, 	openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	leo.yan@linaro.org, Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Nov 2024 21:00:46 +0000
In-Reply-To: <29602c0d-93f6-4eae-81a6-9546d9cef478@windriver.com>
References: <20241113125147.4193489-1-Deepthi.Hemraj@windriver.com>
	 <da8159be7e9d212681a4c2b52643bb2b019ab462.camel@linuxfoundation.org>
	 <29602c0d-93f6-4eae-81a6-9546d9cef478@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 21:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207134

On Wed, 2024-11-13 at 14:58 -0500, Randy MacLeod wrote:
> =C2=A0On 2024-11-13 8:23 a.m., Richard Purdie wrote:
> =C2=A0On Wed, 2024-11-13 at 04:51 -0800, Hemraj, Deepthi via
> > lists.openembedded.org wrote:
> > =C2=A0
> > > =C2=A0
> > > From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> > >=20
> > > Enabling multilib support and adding both lib32-gcc-symlinks and
> > > gcc-symlinks
> > > to the image installation results in a conflict between
> > > gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-
> > > r0.corei7_32.
> > > Following error occurs because of the conflict:
> > > "file /usr/bin/gcc conflicts between attempted installs of gcc-
> > > symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-
> > > r0.corei7_32"
> > >=20
> > > The conflict occurs because both packages try to install files in
> > > the same location,
> > > causing installation errors during the build process.
> > >=20
> > > Updated the gcc target recipe to correctly handle symlinks for
> > > multilib support by using ${MLPREFIX}gcc
> > > instead of just gcc for the gcc binary symlink in ${PN}-symlinks.
> > > This ensures that the symlinks point to the appropriate multilib
> > > gcc binary for 32-bit and 64-bit configurations.
> > >=20
> > > Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> > > ---
> > > =C2=A0meta/recipes-devtools/gcc/gcc-target.inc | 4 ++--
> > > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/gcc/gcc-target.inc
> > > b/meta/recipes-devtools/gcc/gcc-target.inc
> > > index 6b47c10413..ff59eb1b52 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-target.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> > > @@ -71,7 +71,7 @@ FILES:${PN}-dev =3D "\
> > > =C2=A0"
> > > =C2=A0FILES:${PN}-symlinks =3D "\
> > > =C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/cc \
> > > -=C2=A0=C2=A0=C2=A0 ${bindir}/gcc \
> > > +=C2=A0=C2=A0=C2=A0 ${bindir}/${MLPREFIX}gcc \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/gccbug \
> > > =C2=A0"
> > > =C2=A0
> > > @@ -182,7 +182,7 @@ do_install () {
> > > =C2=A0		ln -sf gfortran f95 || true
> > > =C2=A0	fi
> > > =C2=A0	ln -sf ${TARGET_PREFIX}g++ g++
> > > -	ln -sf ${TARGET_PREFIX}gcc gcc
> > > +	ln -sf ${TARGET_PREFIX}gcc ${MLPREFIX}gcc
> > > =C2=A0	ln -sf ${TARGET_PREFIX}cpp cpp
> > > =C2=A0	ln -sf ${TARGET_PREFIX}gcov gcov
> > > =C2=A0	ln -sf ${TARGET_PREFIX}gcov-tool gcov-tool
> > >=20
> > > =C2=A0
> > =C2=A0
> > No, sorry, but definitely not.
> >=20
> > You can install one of these or the other but both doesn't make any
> > sense, just don't do that.
> > =C2=A0
> =C2=A0
> I agree that one should avoid this if possible.

With these kinds of issues you need to take a step back and think about
what is going on.

gcc is parallel installable since the 32 and 64 bit triplets are
different. The gcc-symlinks package provides a mapping of "gcc" to one
of them. If you rename "gcc" to "${MLPREFIX}gcc" it won't help anything
since the software is still looking for "gcc" if it depends on gcc-
symlinks.

You could make the software using "gcc" use the full name instead and
skip gcc-symlinks. You could realise it doesn't matter and make both
the 32 and 64 bit versions use "gcc" and skip the lib32-gcc-symlinks.

I don't see a scenario where lib32-gcc-symlinks being installed at the
same time as gcc-symlinks makes sense though. If you rename the
symlink, nothing is going to use it, it just hacks around the conflict.

I have said several times that just throwing a MLPREFIX in front of
things is sometimes *not* the right solution and that you need to keep
the big picture in mind and how this fits into it.



> We'll have to see if we actually care about lib32-gcc-symlinks.
> =C2=A0
> =C2=A0
> The only use case that I can see is to be able to easily install both
> 32 and 64 bit toolchains, symlinks
> =C2=A0on target to be able to build say a kernel module and a userspace
> package for self-hosted
> =C2=A0development.
> =C2=A0

gcc and lib32-gcc can be installed together ok as far as I know. The
symlinks package is what links "gcc" to the triplet gcc and you can
only have one of them. Which is why I'm pushing back on this patch.

Cheers,

Richard


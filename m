Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3ECC61D97
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 22:45:19 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.7638.1700606710143289610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 14:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i3oXmxSd;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1f0f94943d9so2888111fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 14:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700606709; x=1701211509; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6uxe9P2GtLY/71qGidOP6rfFwtL0u5ZfwTcwCYi54E=;
        b=i3oXmxSdc4j96WU/4sqL1scaVcxrhCcmKc4MYpHKdEAm5usB9qEhClZ/YVxKzcYVb5
         EO8qs6bZ72KQADdWBkQKwrMDJ8z74058fJeHHmzSq+LYebKgPNTszFfhoRqfibojk3vt
         ch/P3WzTJEDV5j/YsGmh1TQfqNBNvv31DIBCqathsNo2Fa/hgt//zedvo1KNmTY/fB+Y
         XeGDP1w+DLM1YoLX6ePsq5rKSJuf5vg1CFMUaZ99do42E+BhKzrY9FrMGuNzvw1VlcCn
         IO5poL2KCmKTNXhViqehROj9y2IuZhGUpb+FknXMHHSkr9Xl3zzQXHQd1CBDmasJCS0J
         c1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606709; x=1701211509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6uxe9P2GtLY/71qGidOP6rfFwtL0u5ZfwTcwCYi54E=;
        b=uE1hj1diJS9c5c3XW3Ya3lAXrNv99nNAwpQYJF++9EowA9tpy3nJSzBlqhpdGE6Byt
         dEKwiihaVrrpmm8lCcS8J8BAB/8Q4jsSovJiwwdSlZylTWY22+rb1VZL4mKClH5ZWE64
         MRMI0XECvBqft/X2QtcHxkz2wjsqdQDvhSKFCdKYlKwPii7D/m4wwSGMdkynKxICvIuN
         Fz7udvZFGhECD8nZ/xzXdAUvIWK0czVGgAl726A/9XZ8jVqGBPqILskc3CYg3tdJynpd
         TqV8czXHDrDO+GW6lFq8BIcMlXYRvi/2QkSfjkZL7AzYfuOMW7iUpu1EYNHKmQ8jwQCQ
         n1fw==
X-Gm-Message-State: AOJu0YwMrMSShdw1J1Batjp40lzwvUL7wO/fRvGveDHj+GFnjdIZ13KK
	FoUWkjDCBdu+vNzfsFngA+evGccJAwRLgB7j00o=
X-Google-Smtp-Source: AGHT+IFxp+VuoxNYKxOwHXzInHnT1mH/fkRZo2RT034vRRMQAmH5LXW55Hipe4i70oOMpGqnY7Z5CsL3e6ooaUnpCmA=
X-Received: by 2002:a05:6870:bacf:b0:1f0:8120:88a6 with SMTP id
 js15-20020a056870bacf00b001f0812088a6mr790569oab.58.1700606709257; Tue, 21
 Nov 2023 14:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20231121094154.3406211-1-wenlin.kang@windriver.com> <7946b5be5430d60cf12b4a342c6c9047e2b1b843.camel@linuxfoundation.org>
In-Reply-To: <7946b5be5430d60cf12b4a342c6c9047e2b1b843.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Nov 2023 14:44:42 -0800
Message-ID: <CAMKF1srWETQTQ3Gc_VAHt0Yi6tb5PpXhPzQcDOZdm9nzUG=rNw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libxcrypt: fixed some build error for nativesdk
 with mingw
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: wenlin.kang@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 22:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190995

On Tue, Nov 21, 2023 at 2:42=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-11-21 at 01:41 -0800, wenlin.kang@windriver.com via
> lists.openembedded.org wrote:
> > From: Wenlin Kang <wenlin.kang@windriver.com>
> >
> > Steps to reproduce
> >   1) add layer meta-mingw
> >   2) add line in local.conf
> >      SDKMACHINE =3D "x86_64-mingw32"
> >   3) bitbake nativesdk-libxcrypt
> >
> > Fixed:
> > 1. pedantic error
> >   | ../git/lib/crypt.c:316:24: error: ISO C does not allow extra ';' ou=
tside of a function [-Werror=3Dpedantic]
> >   |   316 | SYMVER_crypt_gensalt_rn;
> >   |       |
> >
> > 2. conversion error
> >   | ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_=
bytes':
> >   | ../git/lib/util-get-random-bytes.c:140:42: error: conversion from '=
size_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [=
-Werror=3Dconversion]
> >   |   140 |           ssize_t nread =3D read (fd, buf, buflen);
> >
> > Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> > ---
> >  ...dom-bytes.c-fixed-conversion-error-w.patch | 47 +++++++++++++++++++
> >  meta/recipes-core/libxcrypt/libxcrypt.inc     |  6 ++-
> >  2 files changed, 52 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-core/libxcrypt/files/0001-lib-util-get=
-random-bytes.c-fixed-conversion-error-w.patch
> >
> > diff --git a/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random=
-bytes.c-fixed-conversion-error-w.patch b/meta/recipes-core/libxcrypt/files=
/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch
> > new file mode 100644
> > index 0000000000..3846f76674
> > --- /dev/null
> > +++ b/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.=
c-fixed-conversion-error-w.patch
> > @@ -0,0 +1,47 @@
> > +From ff99091eb8a6b9e6edc567f6d2552183fbaacec3 Mon Sep 17 00:00:00 2001
> > +From: Wenlin Kang <wenlin.kang@windriver.com>
> > +Date: Mon, 6 Nov 2023 14:43:28 +0800
> > +Subject: [PATCH] lib/util-get-random-bytes.c: fixed conversion error w=
ith
> > + mingw
> > +
> > +With x86_64-w64-mingw32-gcc. get below error:
> > +| ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_b=
ytes':
> > +| ../git/lib/util-get-random-bytes.c:140:42: error: conversion from 's=
ize_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [-=
Werror=3Dconversion]
> > +|   140 |           ssize_t nread =3D read (fd, buf, buflen);
> > +|       |                                          ^~~~~~
> > +
> > +In util-get-random-bytes.c, has get_random_bytes(void *buf, size_t buf=
len),
> > +but in mingw-w64-mingw-w64/mingw-w64-headers/crt/io.h, read() has "uns=
igned int"
> > +read(int _FileHandle,void *_DstBuf,unsigned int _MaxCharCount), and ha=
s:
> > + #ifdef _WIN64
> > +   __MINGW_EXTENSION typedef unsigned __int64 size_t;
> > + #else
> > +   typedef unsigned int size_t;
> > + #endif /* _WIN64 */
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> > +---
> > + lib/util-get-random-bytes.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/lib/util-get-random-bytes.c b/lib/util-get-random-bytes.c
> > +index 79816db..68cd378 100644
> > +--- a/lib/util-get-random-bytes.c
> > ++++ b/lib/util-get-random-bytes.c
> > +@@ -137,7 +137,11 @@ get_random_bytes(void *buf, size_t buflen)
> > +         dev_urandom_doesnt_work =3D true;
> > +       else
> > +         {
> > ++#ifdef _WIN64
> > ++          ssize_t nread =3D read (fd, buf, (unsigned int)buflen);
> > ++#else
> > +           ssize_t nread =3D read (fd, buf, buflen);
> > ++#endif
> > +           if (nread < 0 || (size_t)nread < buflen)
> > +             dev_urandom_doesnt_work =3D true;
> > +
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-c=
ore/libxcrypt/libxcrypt.inc
> > index ba93d91aef..b93d56b4dc 100644
> > --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> > +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> > @@ -13,7 +13,9 @@ SRC_URI =3D "git://github.com/besser82/libxcrypt.git;=
branch=3D${SRCBRANCH};protocol=3D
> >  SRCREV =3D "f531a36aa916a22ef2ce7d270ba381e264250cbf"
> >  SRCBRANCH ?=3D "master"
> >
> > -SRC_URI +=3D "file://fix_cflags_handling.patch"
> > +SRC_URI +=3D "file://fix_cflags_handling.patch \
> > +            file://0001-lib-util-get-random-bytes.c-fixed-conversion-e=
rror-w.patch \
> > +         "
> >
> >  PROVIDES =3D "virtual/crypt"
> >
> > @@ -26,4 +28,6 @@ CPPFLAGS:append:class-nativesdk =3D " -Wno-error"
> >  API =3D "--disable-obsolete-api"
> >  EXTRA_OECONF +=3D "${API}"
> >
> > +CFLAGS:append:class-nativesdk =3D " -Wno-pedantic"
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
>
> Should this go to meta-mingw instead of OE-Core? Shouldn't something be
> submitted upstream? This certainly isn't the kind of patch we want to
> carry.
>

yeah I tend to agree, even though they are backports but the nature of
fixes is very
windows specific

> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190994): https://lists.openembedded.org/g/openembedde=
d-core/message/190994
> Mute This Topic: https://lists.openembedded.org/mt/102725680/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


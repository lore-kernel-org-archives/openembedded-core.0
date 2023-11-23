Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9B2C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:37:58 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.92087.1700750272530821050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XsiUc3Fx;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-548d1f8b388so1390942a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 06:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700750271; x=1701355071; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ovEo7xhyffynvGdvl6DhxpXMgzSVCbFPRWjHrMoiNc=;
        b=XsiUc3FxxH6OhsYK3Yr9TKln0/oJlxQe+S1dova5k+1e50lYNwnlrgAmV6lfzYBUuj
         /9tsMbgkaNeGEn7KIsNemevKAMwovjs5qLKGrbPdvZ4opLjPsdwd5ErrvjqHusHu1lnq
         V7Vfr4dIuVf3MoZroQjDKiJcQO2Fs80wZjOa8vwxHTKAK1cDYVUkVncdXryvMZuOhmGi
         NAsKbsSWWUdiA2yfFE/acnVfB89vpMmcfYmMu5NeubGIPMNInyvlKrGCQzVgxLWsNNU9
         2qsHqzIutr+iUFF6iCUwkHM2qNCz3g+/9TbvUMU937mVJ3JF8iq14DLrL8Ng2W6wLt9E
         kQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750271; x=1701355071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ovEo7xhyffynvGdvl6DhxpXMgzSVCbFPRWjHrMoiNc=;
        b=aouJpUyr0exwoEa0YZZx0lI16TKC8azUeeSSIcmatRwsQ3xshOQLKOlQUV9Xcgc4dE
         yQGI2+VuRb1K5AXAM9QUDGzJLCm3NqfKdCBrwrVN2Y20Z4B2Q0DVYUvzxvgwHE9X6oFI
         ZjnV28cg3BavbZXizIN1REWEE74QR9V9eqEEjQCNAuSpmea3FqDHLImzooW3xsnwLuce
         tTRWEgEXT0boK08QELX7nymtPQ74t3CsAm3Gd0healxA9Cr7uoC0Ou/FnCcIuiJa/PMn
         9FnNlBcm8N9rozN71CpEb2mXCU0c2EXEEbENmdBUAy7JPkGLlLFq6P+VllInu9olJV+Q
         QLFw==
X-Gm-Message-State: AOJu0YyAUeAj24cZmCx1uOGD4qWvz+4L99ywWFyVaRuzj18BXfc6Y8Nl
	H8hzB16Rdnxf+AP+EQHwlrqxMkJAOP0iISowGWUNXA==
X-Google-Smtp-Source: AGHT+IHqMZEjwmGScNuudiHdiwUHw+GnYW+rNVM9R087ylbNTrIPKz8Wzj4yk9ZhxcPB7JcwhoGJASVj+udGviSXUmQ=
X-Received: by 2002:a17:906:446:b0:a01:cb1b:f23c with SMTP id
 e6-20020a170906044600b00a01cb1bf23cmr3390206eja.59.1700750270520; Thu, 23 Nov
 2023 06:37:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1700620126.git.steve@sakoman.com> <ca4866d14f725ae6c99c6651a69333d9453713a2.1700620126.git.steve@sakoman.com>
 <c54ab4f4e673b355bb0ee37bbf2d33c6dc0565fb.camel@linuxfoundation.org>
In-Reply-To: <c54ab4f4e673b355bb0ee37bbf2d33c6dc0565fb.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 23 Nov 2023 04:37:39 -1000
Message-ID: <CAOSpxdYEdajGZ1bb462LHLmFx45gFyfrbn9SUmQbvU12kJqMeg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 16/16] libxcrypt: fixed some build error for
 nativesdk with mingw
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191163

On Thu, Nov 23, 2023 at 2:39=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-11-21 at 16:31 -1000, Steve Sakoman wrote:
> > From: Wenlin Kang <wenlin.kang@windriver.com>
> >
> > Steps to reproduce
> >   1) add layer meta-mingw
> >   2) add line in local.conf
> >      SDKMACHINE =3D "x86_64-mingw32"
> >   3) bitbake nativesdk-libxcrypt
> >
> > Fixed:
> > 1. .symver error
> >   | {standard input}: Assembler messages:
> >   | {standard input}:4: Error: unknown pseudo-op: `.symver'
> >
> > 2. pedantic error
> >   | ../git/lib/crypt.c:316:24: error: ISO C does not allow extra ';' ou=
tside of a function [-Werror=3Dpedantic]
> >   |   316 | SYMVER_crypt_gensalt_rn;
> >   |       |
> >
> > 3. conversion error
> >   | ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_=
bytes':
> >   | ../git/lib/util-get-random-bytes.c:140:42: error: conversion from '=
size_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [=
-Werror=3Dconversion]
> >   |   140 |           ssize_t nread =3D read (fd, buf, buflen);
> >
> > Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  .../0001-Fix-for-compilation-on-Windows.patch | 37 +++++++++++++++
> >  ...dom-bytes.c-fixed-conversion-error-w.patch | 47 +++++++++++++++++++
> >  meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 ++
> >  3 files changed, 88 insertions(+)
> >  create mode 100644 meta/recipes-core/libxcrypt/files/0001-Fix-for-comp=
ilation-on-Windows.patch
> >  create mode 100644 meta/recipes-core/libxcrypt/files/0001-lib-util-get=
-random-bytes.c-fixed-conversion-error-w.patch
>
> This isn't in master, not is it going to be.

OK, I will drop this patch for kirkstone.  Thanks for the review.

Steve


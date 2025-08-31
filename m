Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8A8CA0FF2
	for <webhook@archiver.kernel.org>; Sun, 31 Aug 2025 16:05:54 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.31725.1756656343917689846
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Aug 2025 09:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LmBXmdFq;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7227bc08c97so1740267b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 09:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756656343; x=1757261143; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM3lBlYtJDY+g6yFBjEvN5M3DSnP3L7WBVgqilERp0Q=;
        b=LmBXmdFq9CNowu0NiyZjCS2vsDQ4bDNzqq/acxb/RWtFhTQEDrovD11scqQLfVrwK9
         /PDiUAJY2KoDKA2ZD7z+iKz19QBKdDOWYLlm89Tc6/K294njtlKDOxW3cNQ00GIfQ3tu
         mTJ/wH4whQ6uyMUpgkw+QWBuLaHoVNN5159ClGbDD+us6cRSlWsJlZdfRWSLinHcw/V0
         s/dZH6dXu+Lm4RkpMHq1eHjT4JHk2DAkfdwvfBASXkTWxn+kHRaLipvneD9UZTBX1YhU
         icXP1zLy8D2k0kIwJ+x1UmDuQHOdzh5J83S1usrZTB75OFKfoZHhlxsT8R14vT3G+Vvi
         VMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756656343; x=1757261143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM3lBlYtJDY+g6yFBjEvN5M3DSnP3L7WBVgqilERp0Q=;
        b=gLT1lqlk4Zl9LCf8A5LvtO6IcrA9K9fhyRYMt4dn/tJgk6QOY75OxXS8zgwVdVExK+
         N9U3MPQ7trVUuRLGgrJgqrrLyH1/5bPSzPh1FAAOF7iT+Tmx5qiJHmz2BWJ748ZHeAYq
         e/0E2amBT2EAh8BgwriegFjAZmwv8nZYAhcZsr3Y1pdO/Ijk48+HwsLD715FL+cozOHb
         zB40E+gMqdWWjKTOXY8HEqeoEjLL+amUgpxwL2uTNws8n44T+6YjhEYbXFWQcapnkWsA
         OOim4BH1M0yxFCHr0aMaILJ+q41kMYjhQrfdg2P4qAdNknfaUUu2bFAbSinIaxxoOvb6
         uTpw==
X-Gm-Message-State: AOJu0YwtbCtyYKzN8gXZ++h5esRDmWFye6MMccPNLWkN+W9ii+An7v3q
	nYfqHsKd/fUUJ3B9eKZOwEx7Pwfk+DXY35TIRx//M2gGP3hKH5UWVPVra93/pWS72AwfdIb9uf0
	5PVfpS+HovioILE03thcpGw6oiPu0dnI=
X-Gm-Gg: ASbGncvjvahKo66ggx8HGU/kS+SWEA/Hw5hsPdfhG59o35EvDNX2oL/ZtWPcVERB4vu
	ZzbVAfE0GxirNbIJV3AtRHIMcnliWymGl09Bw049OBV/jwKWRwLnpushN/LQk5wyokRWGcotL3l
	YviCNJ6CzB0mIm2Wk0tQWFg4gdSQq5bIRz5Y1zansBifQYfTU0XJ9om2HpqgdQXplbqws4DSxqs
	Gb35qtMwCjdud/WiLk76qi7XszHWCONrnWjryZ4I70c+zy7zE67P+jqcuqL335ZNoDq5Ump3vzr
	xjbzh8daxUIXxRAufObileNdCZj4cRHho9uBUjT3vqWwESI0sKwtsDFZog==
X-Google-Smtp-Source: AGHT+IHa9ETMsvarPR2tTmBELQERUcnQvupVf5vXcH4D0BENmZ8LKEiv3/4ArT+MXo7Cb/T8AAzU6YwHNWzmLOuliLQ=
X-Received: by 2002:a05:690c:7091:b0:71e:6583:7d37 with SMTP id
 00721157ae682-72273d26873mr63492977b3.14.1756656342942; Sun, 31 Aug 2025
 09:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250831075336.7857-1-zboszor@gmail.com>
In-Reply-To: <20250831075336.7857-1-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Aug 2025 09:05:15 -0700
X-Gm-Features: Ac12FXyXvYwWwj213J7WVY80JrFmYWnRJtMbUPZHc926HDT7nuYvaXAoVqjcXYA
Message-ID: <CAMKF1srdw3mfmy3u3WF1kGX8B0Q5rQ0AXPrkP3i7F2CH61a_3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tiff: Disable liblerc
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Signed-off-by : Alexander Kanavin" <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 16:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222634

On Sun, Aug 31, 2025 at 12:53=E2=80=AFAM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org>
wrote:
>
> tiff-native may pick up liblerc from the host, in which case
> it's added as a private requirement in libtiff-4.pc.
> That in turn causes a build error in gtk4-native in Yocto.
>
> This was observed on Fedora 42 with gdk-pixbuf2-devel installed
> on the host, where libtiff 4.7.0 is built with liblerc enabled.
>
> Since liblerc does not exist in Yocto, disable its use in tiff.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> Backport-to: walnascar
> ---
>  meta/recipes-multimedia/libtiff/tiff_4.7.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.7.0.bb
> index 26e3811ff8..c21b352d3c 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
> @@ -32,6 +32,8 @@ inherit autotools multilib_header
>
>  CACHED_CONFIGUREVARS =3D "ax_cv_check_gl_libgl=3Dno"
>
> +EXTRA_OECONF =3D "--disable-lerc"

It would be good to make it a packageconfig that is disabled by default.

> +
>  PACKAGECONFIG ?=3D "cxx jpeg zlib lzma \
>                    strip-chopping extrasample-as-alpha check-ycbcr-subsam=
pling"
>
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222629): https://lists.openembedded.org/g/openembedde=
d-core/message/222629
> Mute This Topic: https://lists.openembedded.org/mt/114987790/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


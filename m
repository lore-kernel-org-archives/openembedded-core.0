Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA69C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:44:52 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.45762.1721745892269458724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TzCcj8dF;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6519528f44fso52178157b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721745891; x=1722350691; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bALmt8leHG5/4o8U4i+rZKQWwzWgr9heYIoeuK7ZxfQ=;
        b=TzCcj8dFmVHTLlNYwyX3FjH0BnqAjBPfzYB5Gda8g42EuVce/p8JRX1rbPznnv9YsL
         9ztjCM/y4s6mhz0MIs3ykC7CybPmJsCdLEsKHRIWD49DdQ+psszyGOGQy/J20P77MC5g
         p15uUrcFhkEmuJ7WqW76KgDZOtN/XeNFVu4zaKmZfsqBsvsY3aXS6DHN37Ouv/WsNvwy
         /AoKAQwCyGxo02HoCi60SCzfAWo9RHCGQ+/Hi6mX/cS/xgqpN5eNKn0JyKKC7dA8OpCO
         eIVP9OkZ4rgMzLWvlltXtEowbd7v5wuHWV5XsCn8zTqx2dRX7abEePefouDn4ZN0XQYw
         AvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721745891; x=1722350691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bALmt8leHG5/4o8U4i+rZKQWwzWgr9heYIoeuK7ZxfQ=;
        b=hp4C7k1XBebe8WBXlU8PnaHdz8ujDbxenv6J50yA1Nkq8NpvwfZnhYI14KAnnjmtfG
         PCKbJ3j4HbWLzdv2l9AqbCQRYQ/NfhkE9bmA7rmGo64iB8eIFZVBmn1nv72FLUiQe9Hx
         cMuQ9uNASXs4d0rFxnx6p+L8WHlXNKvHORbj/t9RY9eDxsx8mgs5IG6G/Q+Pd/7xKhfM
         K2V8i58Juvpgsvxj8+gOztEZ62HHUMjueUIELTV5x9dBIN9oQj3LZNig+rgWammrKiX+
         p2/KOYYNbJJu6GX5m9Lg0KGhNuBjDEj/sVie+9eHVLKmBzkqsajgvCH8HZ5PsUs5cz7n
         aFcA==
X-Gm-Message-State: AOJu0YzTDltN5OVD1KOxgQ6FLQsgNE5Jildx0Dc++laX5f5MM7HUWd4l
	U3B18HBTXTZN98I+T/mXeBGgw9Y6Fogyd524oTWyrI3KUOfAku1pSeLap2cvhVxpXt2iskO0FhO
	Qj0RdZsFm0YIiLZ1/bVetrbuaUPEad9NwFNlBaw==
X-Google-Smtp-Source: AGHT+IGPZ/H6rmSSdD2OpxbWmMZVse0LmpkarGz9JPHgdyi7INHfDNvudvzw/LkTqH0ZFcIb4OhOAo7LZ14tB55Ixa0=
X-Received: by 2002:a05:690c:fc4:b0:64b:75d8:5002 with SMTP id
 00721157ae682-66a682cbfb7mr153512397b3.9.1721745891392; Tue, 23 Jul 2024
 07:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1721740245.git.steve@sakoman.com> <247f62169d1fff5df16606c64aed38b642f36857.1721740245.git.steve@sakoman.com>
 <f038c7ff-ecbb-4cbb-a1c5-5712d1e4e985@gmail.com>
In-Reply-To: <f038c7ff-ecbb-4cbb-a1c5-5712d1e4e985@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 23 Jul 2024 07:44:39 -0700
Message-ID: <CAOSpxdZTYxK7J1Mu5jrL63yTOQeZLovMfr1uAFuJwGSA+qckng@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 02/17] mesa: upgrade 24.0.5 -> 24.0.7
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202366

On Tue, Jul 23, 2024 at 7:32=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> 24.0.9 is the latest bugfix release

If you would like to prepare a patch for this upgrade I would be happy
to take it.

Master has moved off of this release, so there won't be a master patch
to cherry-pick.

Steve

> 2024. 07. 23. 15:13 keltez=C3=A9ssel, Steve Sakoman via lists.openembedde=
d.org =C3=ADrta:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Mesa 24.0.7 is a bug fix release
> >
> > Changelog:
> >   https://docs.mesa3d.org/relnotes/24.0.7.html
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 55d962ff7e3475d2c46e1a76d9efa55e1de6e940)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >   .../mesa/{mesa-gl_24.0.5.bb =3D> mesa-gl_24.0.7.bb}               | 0
> >   meta/recipes-graphics/mesa/mesa.inc                             | 2 +=
-
> >   meta/recipes-graphics/mesa/{mesa_24.0.5.bb =3D> mesa_24.0.7.bb}   | 0
> >   3 files changed, 1 insertion(+), 1 deletion(-)
> >   rename meta/recipes-graphics/mesa/{mesa-gl_24.0.5.bb =3D> mesa-gl_24.=
0.7.bb} (100%)
> >   rename meta/recipes-graphics/mesa/{mesa_24.0.5.bb =3D> mesa_24.0.7.bb=
} (100%)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb b/meta/recipe=
s-graphics/mesa/mesa-gl_24.0.7.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb
> > rename to meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index 7cc48e8a04..9157fe9c3f 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -21,7 +21,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mes=
a-${PV}.tar.xz \
> >              file://0001-Revert-meson-do-not-pull-in-clc-for-clover.pat=
ch \
> >   "
> >
> > -SRC_URI[sha256sum] =3D "38cc245ca8faa3c69da6d2687f8906377001f63365348a=
62cc6f7fafb1e8c018"
> > +SRC_URI[sha256sum] =3D "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000=
ae2c7d96db93f6c26a"
> >
> >   UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa_24.0.5.bb b/meta/recipes-g=
raphics/mesa/mesa_24.0.7.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa_24.0.5.bb
> > rename to meta/recipes-graphics/mesa/mesa_24.0.7.bb
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#202347): https://lists.openembedded.org/g/openembed=
ded-core/message/202347
> > Mute This Topic: https://lists.openembedded.org/mt/107504024/3617728
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
zboszor@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


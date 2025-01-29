Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCE6C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 14:38:57 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.13957.1738161531923000445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 06:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w64PQ38E;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.177, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e549be93d5eso12235271276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 06:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738161531; x=1738766331; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yxf2BQWIEOJRR+Eqj0WQ9lMvzdBeHXT6+xPW6IvzDlw=;
        b=w64PQ38EAPwNU+gG9rQlbpwjtIly8dAy2ZstyRtn0QvmgL31lsz1If0MMJtPp8OyaM
         EQbyIR/r0hsUVwHP1YC6LA3LvS+tC9m5O1YcZh/Amn3933cCicVKExAC1H1NIYIbWyYY
         obCa8iT2De7ULZA+jFKxPkGxs++7Sil7lA2pAliWTCsUv5bzoDmECASM8Gwu0kJsnuqb
         O8aoUbM3UW9+paI5w2MX0ScRpl48j2jif8Txz3INH67srGos0OoQ45rQKwQXRpw1ENVA
         3FvcorNx0GgmFUk6171qmEZD+1uRWf1wQcsG8SFFKBtfxmB6V5jrI0jky39F2hpxjdPH
         jzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738161531; x=1738766331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yxf2BQWIEOJRR+Eqj0WQ9lMvzdBeHXT6+xPW6IvzDlw=;
        b=ryB5yPmotBjkpBcANY205D+V1uQqkePUbQfXB0GF7PGx/r6OdvBnbmml0i9b0ZvJXl
         5/2lIh3p4TfXLM87fZsDvxZo36YTNBGGv1tLglbtfyk2lPY2Fkkv7CE7yFmOOVa+IkDR
         3nfD25atWIeSztjc5MEnQRK4E7v0BlobIVcT8U/PwdgJWjuytXtZgoV5mUVhEVTW1Xaj
         GqcEx4z7y8LWAsTbbg7CIXY0a+ZmfsGQy4BFXx0NGSOqpNkMq42wlHoEkcklu7Njv+j4
         eNajP9lVeXg+MdWMGJuT7C5umMh14vjbZpGnEbdmTw3IEhtHUy9KaoAr1BBS5NG7ohac
         Wl5w==
X-Gm-Message-State: AOJu0YyhsNSV0eXSn4LyqqNC8Q3AS9zCfZBFe6HX8PeD3rJ18juRnvn0
	KThoPUZOY7JArQNNDx/fDRJUrcWBYkLuMSf5RV+uZuC3Fn3yP6YqDGpWQUBLBJYyJseY3ied3oQ
	Z6bMk9EcKJcw56/f4XvgwkYOyqL4teIHW3QYEYA==
X-Gm-Gg: ASbGnctXB1nw3WoeCifFw/nA+MGfWCHSHOn/8atYWW8ugCeZQXuEkg3+nV36+jv8rCf
	Ecivef5oRMnjJ9Dvky3g7DLY+VdRFWsKH40nMexKFXQldQ1EDb5YZcK3egkFfRYIX3xe/HbS8
X-Google-Smtp-Source: AGHT+IGrAIOCNB7L7UaNY2fkk4Rhug6Vt/aKd+/JWF+ifpnqKCjkv7RQm2fdnomeLWRYO/PryNm7qE8R9QPAmi4+tvY=
X-Received: by 2002:a05:690c:6ac9:b0:6ee:65ae:2184 with SMTP id
 00721157ae682-6f7a848f089mr27502837b3.37.1738161529555; Wed, 29 Jan 2025
 06:38:49 -0800 (PST)
MIME-Version: 1.0
References: <20250125154215.3316474-1-gudni.m.g@gmail.com>
In-Reply-To: <20250125154215.3316474-1-gudni.m.g@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 29 Jan 2025 06:38:38 -0800
X-Gm-Features: AWEUYZmihibosiiJDv1fYgyj80vuhGuX5wamqQmn62mfOafdQMrUvO-v47SdkB0
Message-ID: <CAOSpxdZXZvG2XcXDeDXV8wKC1sDHchOihQFk4PVnKS_M5+xqwA@mail.gmail.com>
Subject: Re: [OE-core] [styhead][PATCH 0/3] Cherry pick commits from master to
 sync styhead's gnupg recipe.
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 14:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210385

I'm getting a build failure with this series:

| configure:
| ***
| *** You need libgpg-error to build this program.
| **  This library is for example available at
| ***   https://gnupg.org/ftp/gcrypt/gpgrt
| *** (at least version 1.51 is required.)
| ***
| configure: error:
| ***
| *** Required libraries not found. Please consult the above messages
| *** and install them before running configure again.
| ***
| NOTE: The following config.log files may provide further information.
| NOTE: /home/steve/builds/poky-contrib-styhead/build/tmp/work/core2-64-pok=
y-linux/gnupg/2.5.2/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
ERROR: Task (/home/steve/builds/poky-contrib-styhead/meta/recipes-support/g=
nupg/gnupg_2.5.2.bb:do_configure)
failed with exit code '1'

Steve

On Sat, Jan 25, 2025 at 7:42=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
>
> Gu=C3=B0ni M=C3=A1r Gilbert (1):
>   gnupg: remove obsolete patch
>
> Wang Mingyu (1):
>   gnupg: upgrade 2.5.1 -> 2.5.2
>
> hongxu (1):
>   gnupg: upgrade 2.5.0 -> 2.5.1
>
>  ...erride-init-is-not-needed-with-gcc-9.patch |  2 +-
>  ...-a-custom-value-for-the-location-of-.patch |  6 ++--
>  .../0001-fix-compile-failure-with-musl.patch  | 36 -------------------
>  ...use-pkgconfig-instead-of-npth-config.patch |  2 +-
>  ...h-fix-find-version-for-beta-checking.patch |  2 +-
>  .../gnupg/gnupg/relocate.patch                | 18 +++++-----
>  .../gnupg/{gnupg_2.5.0.bb =3D> gnupg_2.5.2.bb}  | 15 ++------
>  7 files changed, 18 insertions(+), 63 deletions(-)
>  delete mode 100644 meta/recipes-support/gnupg/gnupg/0001-fix-compile-fai=
lure-with-musl.patch
>  rename meta/recipes-support/gnupg/{gnupg_2.5.0.bb =3D> gnupg_2.5.2.bb} (=
85%)
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210265): https://lists.openembedded.org/g/openembedde=
d-core/message/210265
> Mute This Topic: https://lists.openembedded.org/mt/110808443/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


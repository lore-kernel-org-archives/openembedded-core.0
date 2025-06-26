Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E46C7EE31
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 15:43:13 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.11243.1750952584633399509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 08:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=toXtYMoW;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.180, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70f862dbeaeso12770887b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750952583; x=1751557383; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfX1BxemUS0vXw6tTEXWPB83wd628tYDDgTzoRYCGQk=;
        b=toXtYMoWS0KwHw1xSvb6hR907cYns+OuiCtZXxQWP+Vp72BDOY5s+au3xnVq7osSkf
         8MGsjO28aAMKNLZ43j/FDzxU6h/KySo9Ero803m6E8HiEdcvfAQsgKyehRFyZNnjaAP2
         KBoA2xMXbKfxlTTp9qYiH4ywM1jdeRtWjLPhgaKHS5vNFKV5t3h7i7KHa/eKeHzwyLeb
         JsfYsG7ojeSLpbJxePJURGO9wGiOAmLKNpgKt8p0BfHOyvXF3NjXlUS2zdGNzfhFKocN
         FOjdRQGsaqNsUZXiRnfdXrcdgBsqFmhm/N8Q9eAxxyUE6rQv0bOW/fc8DY0GXScMhGUD
         YUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750952583; x=1751557383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfX1BxemUS0vXw6tTEXWPB83wd628tYDDgTzoRYCGQk=;
        b=njU7JyXAuLTszTm+z89Gxw61zpK2BIPjpR5XK5Lz985HNvZjNz4L5D0Ajs+0VjATNL
         IYTfLE4oMlh49tXFAbCp5bxHZf8uJ/WwfC74UJlyFaw6OAQ8exlrPYXpxAZx6MocD/Nw
         4CjOhbJTk2J9M2vTQB2xhTFtiTc4LctA04hLWqAj6up/ihDmJQbKbMl4ruH336KvU6JF
         pTxl2e1nu7h3rmXiPIJZueJ/BrXJXhbamNJY1O0CZbDvZ1qdW32B1gEoMu0ZizQJW9SK
         Q0n3Z1oycpm1K0qHX0IyfdrZYVYHGuNIjDrs2CC/cdpjVHWNmQ/GvfloX2p83V7a4ggD
         jFeg==
X-Gm-Message-State: AOJu0YyWVFcFFuWwzUhL/j/OYll9fMOsuxEeccLyzg21N8DgfAcVPgEf
	9/338LD6ft+Pma8kpcdZs2RPvga7xxhOdhwAUQpB4eBFcP/UIBhzHjK0bxM3HlpZT8pPRXNqSod
	3dztVPrnnAtlJPwaeDbfpHNRbrhVjBDErKIPLK6NcI+BGVxKPhFlN
X-Gm-Gg: ASbGncssU6DRJZxcPM8g926mz0HCmBH+GrQvfEAdWKUdAChhl250fSZlOBGpDzDgd+3
	qj6hP8JP6YuXOy9FJzhtD2ngUWOMQFDTc6+VFaUvA0Fec+rcQLhcm5g8NHDakoLHxzCkW/FQ4sk
	DBJ6NefxfG6u8T/jUxzEp7aPhT+61TRGWskgEJgrL7OTg0NgY6v9Z+fEnfzMbmoqRze1GWTePTB
	GA=
X-Google-Smtp-Source: AGHT+IHwcXoBWbKCS9h7uJoyuOo7YXRPwrnz6ul7uQXHV0G5Dg7Ybp+ZuwkpX+tyxvKTKxfV7WfyxuJ/tsrADUZMJaY=
X-Received: by 2002:a05:690c:6f88:b0:70e:16a3:ce96 with SMTP id
 00721157ae682-71406df7e67mr112405217b3.26.1750952577007; Thu, 26 Jun 2025
 08:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250626104814.3113263-1-divya.chellam@windriver.com> <20250626104814.3113263-2-divya.chellam@windriver.com>
In-Reply-To: <20250626104814.3113263-2-divya.chellam@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 26 Jun 2025 08:42:46 -0700
X-Gm-Features: Ac12FXzZizLAaQNqjSOCpINW0R1TjMS0aka8O3u2a7ezIO7CfeIJtGcKreq0_lM
Message-ID: <CAOSpxdb5zMEdr3Q2Tv2isPzfzkqfT5WSD9usOWrrma2RuVmSsw@mail.gmail.com>
Subject: Re: [OE-core][walnascar][PATCH 2/2] libarchive: upgrade 3.7.9 -> 3.8.1
To: Divya.Chellam@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 15:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219365

Hi Divya,

Unfortunately libarchive 3.8.0 adds new features and therefore is not
eligible for backporting to a stable release.

Steve

On Thu, Jun 26, 2025 at 3:48=E2=80=AFAM dchellam via lists.openembedded.org
<Divya.Chellam=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Divya Chellam <divya.chellam@windriver.com>
>
> Includes bugfixes for CVE-2025-5914, CVE-2025-5915, CVE-2025-5916, CVE-20=
25-5917
> and CVE-2025-5918, which are introduced in version 3.8.0.
>
> License-Update: Public Domain file changed from libarchive/archive_getdat=
e.c
>     to libarchive/archive_parse_date.c
>     https://github.com/libarchive/libarchive/commit/c26f0377457db392bd57a=
640e8fe25506120f810
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://github.com/libarchive/libarchive/releases/tag/v3.8.0
> https://github.com/libarchive/libarchive/releases/tag/v3.8.1
>
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  .../libarchive/{libarchive_3.7.9.bb =3D> libarchive_3.8.1.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/libarchive/{libarchive_3.7.9.bb =3D> libarc=
hive_3.8.1.bb} (93%)
>
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/=
recipes-extended/libarchive/libarchive_3.8.1.bb
> similarity index 93%
> rename from meta/recipes-extended/libarchive/libarchive_3.7.9.bb
> rename to meta/recipes-extended/libarchive/libarchive_3.8.1.bb
> index d70cdb3d83..472b5820f0 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.8.1.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "C library and command-line tools for rea=
ding and writing tar, cpi
>  HOMEPAGE =3D "http://www.libarchive.org/"
>  SECTION =3D "devel"
>  LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd499814247adaee08d88080841cb5=
665"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7ce08437ff7f5e24d72e666313ae4=
084"
>
>  DEPENDS =3D "e2fsprogs-native"
>
> @@ -31,7 +31,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
>
>  SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
>
> -SRC_URI[sha256sum] =3D "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d=
7b5cf6af66fd009f"
> +SRC_URI[sha256sum] =3D "bde832a5e3344dc723cfe9cc37f8e54bde04565bfe6f136b=
c1bd31ab352e9fab"
>
>  inherit autotools update-alternatives pkgconfig
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219348): https://lists.openembedded.org/g/openembedde=
d-core/message/219348
> Mute This Topic: https://lists.openembedded.org/mt/113841058/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


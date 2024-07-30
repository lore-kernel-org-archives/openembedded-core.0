Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A396C3DA70
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 14:18:01 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.18552.1722349074169746568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 07:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ySsFtsRa;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.176, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfef5980a69so3555964276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722349073; x=1722953873; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrFQv9Lj4eAqwvonqluR0cKP2N+06VWFkXo7TeZ/+2g=;
        b=ySsFtsRaDilA3QsE4o0YXOe5ddEpTDYTYE0Vz82N6iaxcvPsiRKTka6XFU+pTI+g9j
         84Qgwwbuxv61tuxVwLyRLI19L2o1iVs5wN5vNYTZg743Uz3is05KVndmy5Rr/7g1+8yD
         NPnA1XRn0imaIy6qycb8l/ILGbX1JAY/nyclX9uO5OdlpBpnmeGe3EXTiWiJ0+oetFSB
         iN6ejCy74cJyBBUfIq6GZHXAzZO1szwHVw6JnmX5z69cWAZz03tOtmgd/rqspoB8el4F
         sEwJJiHzdND4qqLPAgYREB040JHFlW/zHOUaT7e9Eim4y3BVY9h0lxzziBlCOmZbaz/U
         dCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722349073; x=1722953873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrFQv9Lj4eAqwvonqluR0cKP2N+06VWFkXo7TeZ/+2g=;
        b=XppZt0HHaEgIAvHfAOTVX+WU6NWZI6Dm9IjeD1XbE5ucKJ0AW18Wbsz40LN+ce3VFg
         BneGzSBfID0cHiHyTPj4cbYACzZfN5T+veN7pn/TFHYugjIod/C8bzeAqHJMTt3wIDuk
         6Py+j3aGJzb7W8Lwe5gf5qMxRhPLYPGSuGQas7WWDdeYAXqXnUiK2oe7a9xx9ywagYdd
         f3/4fCapecOUrf8rfjaktU64aCi/6CDRGjXdT0uK4s+GJrqAcD9mQ7z1MeIz2eUFs2p9
         C97cfRqPlZ2VFfc87v5Kx9289AQJpxwFmhUdlCeYWNPwB5LjWZeQvfNbIya5SzbL9c7T
         MYhA==
X-Gm-Message-State: AOJu0YxSwt00tYzuScV26o3jT49T1VNBP9hBCQbZJgeNfxNCECNe4zWn
	YDC2EQaok5YDx9A0cALT05nDFuj5x+pXdjNbsVzXWRf5tqCg/IPA/jnwG+DOefmzJqV7zvYufTI
	p9TC1y+b6LI1TBYaK2h2I+ByEm4hjN7jNDGngmA==
X-Google-Smtp-Source: AGHT+IEdbG9iJsi5qbogzCF74C/b4BJoo7oZFeQ/oN+oXZdkqnm5nDJyPHNcdJB82PCWw8kt/Pmje9940EiWRWHf0xU=
X-Received: by 2002:a05:6902:1029:b0:e0b:4aa4:1704 with SMTP id
 3f1490d57ef6-e0b5446cb77mr14443965276.18.1722349073277; Tue, 30 Jul 2024
 07:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240730101039.1757198-1-vanusuri@mvista.com>
In-Reply-To: <20240730101039.1757198-1-vanusuri@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 30 Jul 2024 07:17:42 -0700
Message-ID: <CAOSpxdY3A+q1sPGWDyDiNQ5kf74yjQ=8fFs=YBubYVyA+ZfycA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] orc: upgrade 0.4.38 -> 0.4.39
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 14:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202677

 I won't be able to take this patch until it hits master first.

Steve

On Tue, Jul 30, 2024 at 3:10=E2=80=AFAM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Changelog:
>
> - Security: Fix error message printing buffer overflow leading to possibl=
e
>   code executation in orcc with specific input files (CVE-2024-40897). Th=
is
>   only affects developers and CI environments using orcc, not users of li=
borc
>   (Sebastian Dr=C3=B6ge, L. E. Segovia)
> - div255w: fix off-by-one error in the implementations (L. E. Segovia)
> - x86: only run AVX detection if xgetbv is available (L. E. Segovia)
> - x86: fix AVX detection by implementing the check recommended by Intel (=
L. E. Segovia)
> - Only enable JIT compilation on Apple arm64 if running on macOS, fixes c=
rashes on iOS (Piotr Brzezi=C5=84ski)
> - Fix potential crash in emulation mode if logging is enabled (L. E. Sego=
via)
> - Handle undefined TARGET_OS_OSX correctly (Joshua Root)
> - orconce: Fix typo in GCC __sync-based implementation (Jakub Van=C4=9Bk)
> - orconce: Fix usage of __STDC_NO_ATOMICS__ (Alexander Slobodeniuk)
> - Fix build with MSVC 17.10 + C11 (L. E. Segovia)
> - Support stack unwinding on Windows (L. E. Segovia)
> - Major opcode and instruction set code clean-ups and refactoring (Jorge =
Zapata)
> - Refactor allocation and chunk initialization of code regions (L. E. Seg=
ovia)
> - Fall back to emulation on Linux if JIT support is not available,
>   e.g. because of SELinux sandboxing or noexec mounting) (L. E. Segovia)
>
> Ref: https://github.com/GStreamer/orc/blob/0.4.39/RELEASE
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta/recipes-devtools/orc/{orc_0.4.38.bb =3D> orc_0.4.39.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/orc/{orc_0.4.38.bb =3D> orc_0.4.39.bb} (92%=
)
>
> diff --git a/meta/recipes-devtools/orc/orc_0.4.38.bb b/meta/recipes-devto=
ols/orc/orc_0.4.39.bb
> similarity index 92%
> rename from meta/recipes-devtools/orc/orc_0.4.38.bb
> rename to meta/recipes-devtools/orc/orc_0.4.39.bb
> index 5d2296694a..320abf536a 100644
> --- a/meta/recipes-devtools/orc/orc_0.4.38.bb
> +++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3d857=
97e"
>
>  SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D "a55a98d4772567aa3faed8fb84d540c3db77eaba16d3e2e1=
0b044fbc9228668d"
> +SRC_URI[sha256sum] =3D "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad08=
5ae51143d3040cc0"
>
>  inherit meson pkgconfig gtk-doc
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202669): https://lists.openembedded.org/g/openembedde=
d-core/message/202669
> Mute This Topic: https://lists.openembedded.org/mt/107625073/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


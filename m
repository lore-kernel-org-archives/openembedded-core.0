Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DCEE77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 18:36:03 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.16.1736447756253726233
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 10:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PChyXpX9;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-29e149aff1dso392609fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 10:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736447755; x=1737052555; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn0BWMOlCwjkbvXrVLQtLhxRmzZQwUbki3RsuG9i9/k=;
        b=PChyXpX9IJLW+79QyFrqZr8DEDqWwF8N4JyfATqFDd1bUbY20qsSc3r1fGP9uDE8Su
         m9yMZiCxVAwHqnpvDrqcmB/yCXFJO0VayV+cs9bxVJwYVeqbUliXHjsRY5WlDuY31335
         FpHVSSais9rNuMizZMrHhwxhNGVNljkOHzBelOR3U2j4GxuuiUeiO8LE7W1TcuxDaNQv
         V+FqXw83fbxXfqzIAi5B4k02iyXB1Fc6wxYSuJAmDOsvcWR929BbQSOZP8lFYcAEivy9
         DPQANEt3JbODRUSkRtNGXpx61yA7ehfPXnolDRxxHsnvjpyZrDc/dulRN0/ZMq1UC0RK
         OtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736447755; x=1737052555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bn0BWMOlCwjkbvXrVLQtLhxRmzZQwUbki3RsuG9i9/k=;
        b=ns0EjU5pxejYb9Dmr7naVpZ7Vy2u+kBRlUC9TJ3gjjK8WdA1hrAo/fyAF75u69Twkq
         fdp0RORrSR7SSwXLNNpBxKLsvJm4RsvF7cLvSmdTEm2bg1OHEdmtd8omtzNl+2b86T55
         NFdEuIlh+lXnmNPCEfvzN+279EK0t59jdIHqk+brcO4303di+sXRxWfOH8/Lu3nkuzef
         B0E3N12jYMPpjJfVjfAZepY/WPe+BeGaPXUcRKEl+HuP+KIxeTlQkKxq4dr39bCZlk9A
         QrRt6K+ID9vVxYcoiw87+eFz74uW34QsFHA8pJsGbcrfvzSmjunccBDZG4x2IRKMtZ63
         g/EA==
X-Gm-Message-State: AOJu0YzGooS1HTTAWOYFOSeLlfG2oldIIxw8qoU/6ZnCW7oS8wmJhr1L
	mQVzUV2hYXsIfKQGXYLERB42hOit8l6JXu7HCdNl8XTZgU5yI/g+PMsGwV8Y91yk9OmJd2I85R/
	D4YZVsHvdcVmS8yu99NgEqBy15wI=
X-Gm-Gg: ASbGncv9xeXo3v3PwjFgUb5n937sKA9ZxXlRKZaMyt+d/K8Gciiv0sZuKlGBJBFwP5H
	eB7tId+edxHNQ7iyaQUUTlOyjgy/ZgfE7M+yLJw==
X-Google-Smtp-Source: AGHT+IFTTobiBkVuEh49vWnvAi736Mx3ul8o0tZJtN1wTvEUdkSFBZEGqcQ+RraPLKflpATACBeZJH9A4oFhCIUAFgw=
X-Received: by 2002:a05:6871:6009:b0:29e:32e7:5f1f with SMTP id
 586e51a60fabf-2aa0695b7fdmr4717946fac.27.1736447755291; Thu, 09 Jan 2025
 10:35:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1736150475.git.liezhi.yang@windriver.com> <b6a3ea4a7a3c811d7f3f9fa74e11d5001321ecb1.1736150475.git.liezhi.yang@windriver.com>
In-Reply-To: <b6a3ea4a7a3c811d7f3f9fa74e11d5001321ecb1.1736150475.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Jan 2025 10:35:29 -0800
X-Gm-Features: AbW1kvZJtqx6iMG1EQGxV2Qmxw6eB_1o14XYScv8XTZ20_DZu5DmWT2SmUJlf-g
Message-ID: <CAMKF1soHePWfU3Vf5614+rW2iCLKmfmXwqFhh+genW++s_JcYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] fmt: 11.0.2 -> 11.1.1
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 18:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209632

I know this patch is applied but I still want to bring it to attention
Many packages in other layers depend on fmt.  fmt's APIs are not or
not used in a very backward compatible way
some packages provide an option to use vendored version of fmt so in
case of system fmt being not compatible is not
a huge issue other than duplication, but some packages e.g. gerbera
rely on system provided fmt and it still has not moved to
11.1

I have tried to fix some of this fall out in meta-openembedded layers
but this kind of stuff comes unplanned, so please build/test
fmt upgrades with more than oe-core,  oe-core has 1 recipe ( ccache )
which depends on fmt but meta-openembedded has more complex use cases
of fmt.

On Mon, Jan 6, 2025 at 12:02=E2=80=AFAM Robert Yang via lists.openembedded.=
org
<liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> Remove backported patch 0001-Get-rid-of-std-copy.patch.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../fmt/fmt/0001-Get-rid-of-std-copy.patch    | 52 -------------------
>  .../fmt/{fmt_11.0.2.bb =3D> fmt_11.1.1.bb}      |  6 +--
>  2 files changed, 2 insertions(+), 56 deletions(-)
>  delete mode 100644 meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-cop=
y.patch
>  rename meta/recipes-devtools/fmt/{fmt_11.0.2.bb =3D> fmt_11.1.1.bb} (80%=
)
>
> diff --git a/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch=
 b/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch
> deleted file mode 100644
> index 1b495ea075..0000000000
> --- a/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 6e462b89aa22fd5f737ed162d0150e145ccb1914 Mon Sep 17 00:00:00 2001
> -From: Victor Zverovich <viz@meta.com>
> -Date: Mon, 29 Jul 2024 15:58:05 -0700
> -Subject: [PATCH] Get rid of std::copy
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Backport [https://github.com/fmtlib/fmt/commit/6e462b89=
aa22fd5f737ed162d0150e145ccb1914]
> ----
> - include/fmt/color.h | 11 +++++------
> - 1 file changed, 5 insertions(+), 6 deletions(-)
> -
> -diff --git a/include/fmt/color.h b/include/fmt/color.h
> -index f0e9dd94..231d93c8 100644
> ---- a/include/fmt/color.h
> -+++ b/include/fmt/color.h
> -@@ -560,31 +560,30 @@ struct formatter<detail::styled_arg<T>, Char> : fo=
rmatter<T, Char> {
> -   auto format(const detail::styled_arg<T>& arg, FormatContext& ctx) con=
st
> -       -> decltype(ctx.out()) {
> -     const auto& ts =3D arg.style;
> --    const auto& value =3D arg.value;
> -     auto out =3D ctx.out();
> -
> -     bool has_style =3D false;
> -     if (ts.has_emphasis()) {
> -       has_style =3D true;
> -       auto emphasis =3D detail::make_emphasis<Char>(ts.get_emphasis());
> --      out =3D std::copy(emphasis.begin(), emphasis.end(), out);
> -+      out =3D detail::copy<Char>(emphasis.begin(), emphasis.end(), out)=
;
> -     }
> -     if (ts.has_foreground()) {
> -       has_style =3D true;
> -       auto foreground =3D
> -           detail::make_foreground_color<Char>(ts.get_foreground());
> --      out =3D std::copy(foreground.begin(), foreground.end(), out);
> -+      out =3D detail::copy<Char>(foreground.begin(), foreground.end(), =
out);
> -     }
> -     if (ts.has_background()) {
> -       has_style =3D true;
> -       auto background =3D
> -           detail::make_background_color<Char>(ts.get_background());
> --      out =3D std::copy(background.begin(), background.end(), out);
> -+      out =3D detail::copy<Char>(background.begin(), background.end(), =
out);
> -     }
> --    out =3D formatter<T, Char>::format(value, ctx);
> -+    out =3D formatter<T, Char>::format(arg.value, ctx);
> -     if (has_style) {
> -       auto reset_color =3D string_view("\x1b[0m");
> --      out =3D std::copy(reset_color.begin(), reset_color.end(), out);
> -+      out =3D detail::copy<Char>(reset_color.begin(), reset_color.end()=
, out);
> -     }
> -     return out;
> -   }
> diff --git a/meta/recipes-devtools/fmt/fmt_11.0.2.bb b/meta/recipes-devto=
ols/fmt/fmt_11.1.1.bb
> similarity index 80%
> rename from meta/recipes-devtools/fmt/fmt_11.0.2.bb
> rename to meta/recipes-devtools/fmt/fmt_11.1.1.bb
> index 5c60921efa..a99a377ad4 100644
> --- a/meta/recipes-devtools/fmt/fmt_11.0.2.bb
> +++ b/meta/recipes-devtools/fmt/fmt_11.1.1.bb
> @@ -4,10 +4,8 @@ HOMEPAGE =3D "https://fmt.dev"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db9257785fc4f3803a4b71b76c1412=
729"
>
> -SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dhttp=
s \
> -           file://0001-Get-rid-of-std-copy.patch \
> -           "
> -SRCREV =3D "0c9fce2ffefecfdce794e1859584e25877b7b592"
> +SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dhttp=
s"
> +SRCREV =3D "e3ddede6c4ee818825c4e5a6dfa1d384860c27d9"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.44.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209422): https://lists.openembedded.org/g/openembedde=
d-core/message/209422
> Mute This Topic: https://lists.openembedded.org/mt/110453434/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2D21061B07
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 14:43:31 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53254.1774881808341332221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 07:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ljk5AG2X;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a12c19affeso7778668e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 07:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774881806; cv=none;
        d=google.com; s=arc-20240605;
        b=P5fiJuEfdLs7LpXVmM0eUYQlE+S2Vrl14+iga7Kiz/Jakw6AWm4yfj2fvsH/XDqgoI
         Ctx/iERFfCI/Xrdbv3799uvnW2ii9OHsBDGXKq64IZmLNBVAt9GaS9QUcBBjovHcIr00
         v0j31SW5LwcuQA9+TdeEwQTU1Wzqb41fJ9gP/cPyx+p70lLKEj015b3/jX2Ghcz9HIYv
         Nq29lpIUM72JGCnbXTEG/z24BhJm96S/7LVbs/564PlA3p0Y0/QJzXLPORWUk1tAjany
         uPzLIPqwxRejLP8nUgvgc7pY7GqCCkojKS7v6JpMx7QG975yRn1OgPwAaAnXv5gx1buV
         5nWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1/CmcWDot9i7oKCs4zduLj1ZeoknYYUxNVhbZJkW2Gg=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=GQqpLmqoX9u8tg0XS2iNmQf4Ultzp3E+7w7G27mODi8OydmNfkBlQe2VIt6yJd0TOc
         xC3ycGje4DIKob9mKWV21I+PDfTdf8L3ZWiQEvGxozWuCqoDHZRjP3KSMUMRrxEvf+1X
         bCNMNRpDjjM+KC6GUWQVfbpUez6SJZBH9CFeTBslGoOeAC+NcmzQbI2KZx9znxS2GLLA
         Y4bPKBZyVnhX5EkXULTN14jgjxLibXahd00sm6MLbKTWtEfshZWmqvJYyWOSWKRCJK5H
         rL1KnGdF8pxSVERUbDXVo4v2rziBW5SEVdQFvNry1nYPSGUt6GU1lmjdPPm7GRNCFTbB
         H4pg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774881806; x=1775486606; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/CmcWDot9i7oKCs4zduLj1ZeoknYYUxNVhbZJkW2Gg=;
        b=Ljk5AG2XRmrjUdf7SOr134PgKM9R0m6t0kU7BnuBf1Hy3aj+8romd+48H7O74OR8eA
         TIQzLxPfMsx6iTgwlMBLzWz0lKvmCG9YwrbbvGMA+YFJAOtORh5dwLZxvHb5KSOQyI2H
         83eCFOY1T5hp7TFFfVHNA76gCQlItZJP0g6tPuL3eQwc6ZqPWoaabQdEjv8JDpxZg+Vj
         hFHWyTyPKqL1Io0QTqyRsLcApJ3C1PM+GdEt1Dtj0ckN9s+Dwxymx3YzANtDAqu4nUMQ
         hVMyRMkOpAz4A+y8Hfnx5pwxx2Yluesvajvkzpj7RK83B92VhxEUpg2XM3ouSoTEceL+
         pAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881806; x=1775486606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1/CmcWDot9i7oKCs4zduLj1ZeoknYYUxNVhbZJkW2Gg=;
        b=alvx88ErhL4qfRH0+ZADN0obtuAJeutwOERjvAGTUXsJgMFQDUr9CuotgxV/Ps+40S
         ZCq/uBm3mfdnFvStC6Dyb40HJvf5W2eqqcdAJPOPvmKZIvznshrCeaRO7BZXvi6MIbOD
         139S91zF5i6YaMxY5jr08W8Fxrw08Js+UTpSsS8To9fNe8wlgjGed6CAkY+6tkISXUDo
         e0czsKWTpL0SIxj8hbIsrc3sSrUwSl8YHf768G3Yb6eihE1IFPTK3kbN651ntTP87rrF
         J/+mb+8dz2mkVCVSt6vhNp7t4xrRRMVnhHlVIC04BOiCaRidYRKqxQFkyDf9fSz4k+mE
         7fQQ==
X-Gm-Message-State: AOJu0YzxMlV+RAJ3PzUEDPwU4sKcG0knkvZqQYv4/VCmoOhZGkwOhGJR
	PuM5qAL9OS1V4mmziBqqgdm5fWsRbmI99pQeuXE0zU5BXZkth9QnedPRuWec0uY7O1LwUzykVGv
	GtGGQBrH0N8BCcSiFF1yh9FlFJSQdN90=
X-Gm-Gg: ATEYQzzElIJjWmGpriJGsEag+QgKzF5m/oE1gtECrbo7O494ut++P+R6NRbeIfENZAw
	KEIXzLWbqZNZvijfybJ/WUkOWCFyjj9SZPnpn6ERNH7DsLF3DBpxT2ZqzuLIoFZ58YddsLzEDMk
	xx7mOodVE2jcSMlgN2kzPLVNMNP8ta8kKS4hbGgMryqk1JJwXOacAYL38See6XF8yYtdhaMeN+p
	pyZonYe6vTSP/swWaGN+VaAddM7jImOtkAwZKEXjmd4ja7g4EwobAd8EG/FKNPe7Mwp6iem0DCM
	kvTYqluXyw==
X-Received: by 2002:a05:6512:a85:b0:5a2:7cde:3438 with SMTP id
 2adb3069b0e04-5a2a508cfddmr5825071e87.22.1774881806106; Mon, 30 Mar 2026
 07:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774824253.git.yoann.congal@smile.fr> <58ef52e9ee33c76689a57e6c39e91c00c257c43f.1774824253.git.yoann.congal@smile.fr>
 <DHG6XYWYS20G.3GXDCN07SKIGJ@smile.fr>
In-Reply-To: <DHG6XYWYS20G.3GXDCN07SKIGJ@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 Mar 2026 16:43:12 +0200
X-Gm-Features: AQROBzD7KgCOkIvqrKYKQVHICvpbDrXApHMrFChrjM2GtDNrZjJCaCWFrplHqVU
Message-ID: <CA+chaQemR2LDxSnBQ++4hWerEzfCkLTLD_g4vq1dCstHV-16Mw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 04/11] dtc: backport fix for build with glibc-2.43
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 14:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234240

On Mon, Mar 30, 2026 at 4:36=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> On Mon Mar 30, 2026 at 12:46 AM CEST, Yoann Congal wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
> > https://errors.yoctoproject.org/Errors/Details/903983/
> >
> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98overlay=
_fixup_phandle=E2=80=99:
> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment dis=
cards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
> >       |                     ^
> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment dis=
cards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
> >   434 |                 sep =3D memchr(name, ':', fixup_len);
> >       |                     ^
> > cc1: all warnings being treated as errors
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > [YC: upstream commit 28552a7b6c94060c7ab3899619ab8afb74124d02]
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
>
> Hello Martin,
>
> FYI, while it looked good, this patch and your whole series about glibc
> 2.43 support:
> * [scarthgap 04/11] dtc: backport fix for build with glibc-2.43
> * [scarthgap 05/11] pseudo: Add fix for glibc 2.43
> * [scarthgap 06/11] yocto-uninative: Update to 5.0 for needed patchelf up=
dates
> * [scarthgap 07/11] yocto-uninative: Update to 5.1 for glibc 2.43
> * [scarthgap 08/11] elfutils: don't add -Werror to avoid discarded-qualif=
iers
> * [scarthgap 09/11] binutils: backport patch to fix build with glibc-2.43=
 on host
> ... will be put on hold until I can test it: So, not until Ubuntu 26.04
> is released and the autobuilder gain an Ubuntu 26.04 worker (most likely
> after Wrynose release).

OK, I have similar 7 patch series with additional fix for m4, gettext,
systemd for whinlatter. Should I send it for review or put it on hold
as well?

I've built images with latest 26.04 snapshot in docker with scarthgap,
whinlatter, wrynose for rpi - there might be more native recipes used
for other BSPs (or included only in bitbake world), but build-wise
these 2 series should cover most of it.

Regards,


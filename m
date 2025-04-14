Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CBFC369A2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 17:03:47 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.198.1744650219802121548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 10:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cvAzQL45;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so4618248e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744650218; x=1745255018; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEl1J0Z1GziyTBN+nzfGSCI3ULM1C4KokYNm034Brl0=;
        b=cvAzQL45lcwqN1K7amBQ+fnC8zn2gVhrt7D2Pvw4sJWQKDRDm0sJ+wD88UFp9KRj89
         wDSx3eYv9Ks6FuGa+D9RrX7Rpdp9nGz7fNMNGURZ3w0afpu1qKlJEkK5/k7jRe2AzSm6
         QkX7BHUdtVsB/EKLADiacfy3XuxI/arLOkBIHacH/E/laooGRSRBlgtISDEQrNyrMvNc
         WiBh6xlDU3oXbTnIjtmi0WCSLWMq/SfHmsctgggRCUJL16nB3FE7TbpD1IPTYzYZgw0M
         eb2QUhMj82ZXNWelF3o7YkNVnQLc9mQPgsMdsCfp5v/73IbpPb7RLiJCNpzpxXqOAZan
         agSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744650218; x=1745255018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEl1J0Z1GziyTBN+nzfGSCI3ULM1C4KokYNm034Brl0=;
        b=K+iAAuQhEU0JO4fEjaDs4bDr9iMovByZfApY054dYUzXuCOTPu+JTuAs0gInRya4wl
         vSuewdahugwA+ddmSDBwgs+Y8aoCXxBM/YmtvZnqZYp3F5mre2Uy2PDRYS5Xbn6Jc5bk
         iITIDu2I7/faaXvEMrDh+WmIEa58VHn75thMEztbYEYg89+lCJAkkinAUNfkgMPQiIDk
         t8l+KAR1a1MnKc8LHOlgSFndp8Pc7aB4Xjdc5lDfSwOmpvJijM9VWjgJahay4W7w4uYG
         QjGta99DB02BbD5vSb0A6B9x83anEqyYFOsISjU//0nRqEjp83swB1FTBqofAQmuueMH
         G1OA==
X-Gm-Message-State: AOJu0YyUQtMQZib1Rv8ISl0rjAMRZIAITH9ur4glE2hYeuPr+27cgvMY
	dnIciPokV3p4iITtw2nvr27Gpqgv4BeRceMBjdJ614XW6L7rvLxuH7hY+BryFM8jwd77U2D9G+0
	M0agf5/Q79CZKlR+TbHMXaF5sMK8=
X-Gm-Gg: ASbGncuFcne5NK7bSLioNekD+P26VFbBsSmeHD4R//sMV73ueFGuqmjN/4zuSAtCWi4
	WLMbabs6T9gn7Hh6BJPNHd1m04FE6MR7gufsdrw1wPZGht8uj5ZKLGM7N+VJmPrrdXDV+vZACJo
	5ihgDgDuvFCTvjOTjzJ4kOtDOA3IzYl+PGLsHj
X-Google-Smtp-Source: AGHT+IHjqcLzbRa+Ilmp++hHNcNkb0+9x1WO7ZpHKcb8rMKGZ2ypTLOOFqdcG8izy9pH/Ak7HYqyQ6pqAsIyeNbEq5M=
X-Received: by 2002:a05:6512:b82:b0:549:38d5:8858 with SMTP id
 2adb3069b0e04-54d45298faamr3878390e87.20.1744650217420; Mon, 14 Apr 2025
 10:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250409101545.5936-1-eichest@gmail.com>
In-Reply-To: <20250409101545.5936-1-eichest@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 14 Apr 2025 11:03:25 -0600
X-Gm-Features: ATxdqUHKEYdmHPZCvh2szVumPR1sNeQVxJrEdbv8ccfgv-t-CL5UFtGiwpLAxZg
Message-ID: <CAJdd5Ga7-Swcb8Zej8dpuLP5AzuBHiTmFVSatL33Biwjhym+rA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Allow overriding PNI name policies
To: eichest@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 17:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214806

On Wed, Apr 9, 2025 at 4:15=E2=80=AFAM Stefan Eichenberger via
lists.openembedded.org <eichest=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> Add two new variables, PNI_NAME_POLICY and PNI_ALTNAMES_POLICY, to allow
> overriding the default Predictable Network Interface (PNI) name and
> alternative name policies respectively.
>
> This allows setting different name policies via a .bbappend file if the
> defaults are not suitable for a specific use case.

It's very difficult to configured systemd in a way that is acceptable
to everyone, and I'm not sure adding variable "knobs" for every
possible configuration option is feasible for systemd.

You could do the exact same thing by putting your sed command in a
do_install:append() function (since you want to set them from a
bbappend anyway), and in that case it's irrelevant if pni-names is set
in PACKAGECONFIG or not.

>
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  meta/recipes-core/systemd/systemd_257.4.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-co=
re/systemd/systemd_257.4.bb
> index 24aad11c0a..00edd702fb 100644
> --- a/meta/recipes-core/systemd/systemd_257.4.bb
> +++ b/meta/recipes-core/systemd/systemd_257.4.bb
> @@ -273,6 +273,10 @@ WATCHDOG_TIMEOUT ??=3D "60"
>  # and the watchdog is enabled. (defaults is no hardware watchdog use)
>  WATCHDOG_RUNTIME_SEC ??=3D ""
>
> +# Predictable network interface name policies
> +PNI_NAME_POLICY ??=3D "keep kernel database onboard slot path mac"
> +PNI_ALTERNATIVE_NAMES_POLICY ??=3D "database onboard slot path mac"
> +
>  do_install() {
>         meson_do_install
>
> @@ -398,12 +402,8 @@ do_install() {
>         fi
>
>         if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'fa=
lse', d)}; then
> -               if ! grep -q '^NamePolicy=3D.*mac' ${D}${nonarch_libdir}/=
systemd/network/99-default.link; then
> -                       sed -i '/^NamePolicy=3D/s/$/ mac/' ${D}${nonarch_=
libdir}/systemd/network/99-default.link
> -               fi
> -               if ! grep -q 'AlternativeNamesPolicy=3D.*mac' ${D}${nonar=
ch_libdir}/systemd/network/99-default.link; then
> -                       sed -i '/AlternativeNamesPolicy=3D/s/$/ mac/' ${D=
}${nonarch_libdir}/systemd/network/99-default.link
> -               fi
> +               sed -i 's/^NamePolicy=3D.*/NamePolicy=3D${PNI_NAME_POLICY=
}/' ${D}${nonarch_libdir}/systemd/network/99-default.link
> +               sed -i 's/^AlternativeNamesPolicy=3D.*/AlternativeNamesPo=
licy=3D${PNI_ALTERNATIVE_NAMES_POLICY}/' ${D}${nonarch_libdir}/systemd/netw=
ork/99-default.link
>         else
>                 # Actively disable Predictable Network Interface Names
>                 sed -i 's/^NamePolicy=3D.*/NamePolicy=3D/;s/^AlternativeN=
amesPolicy=3D.*/AlternativeNamesPolicy=3D/' ${D}${nonarch_libdir}/systemd/n=
etwork/99-default.link
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214582): https://lists.openembedded.org/g/openembedde=
d-core/message/214582
> Mute This Topic: https://lists.openembedded.org/mt/112169516/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


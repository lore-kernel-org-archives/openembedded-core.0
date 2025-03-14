Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5AFC282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 18:07:13 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.880.1741975626928825066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 11:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nF0dPMHV;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60029342c98so1322868eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 11:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741975626; x=1742580426; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROHT2Xw0zSDNoVS9FZb8huCNL3lDdH75fAc3AbyRqUY=;
        b=nF0dPMHVJsKQryxF+5qXYo4i+uATm63csmBYZs6+aHH+Ow5lR9/UOadHWtxGvOVSrR
         GAWSTxj3EYsWzQBw0J2bu5wqGIcVbhBc5RLgnwuShmM9xB53AB6LykmnUkLCdEErtLEs
         kRBQDdE2RdCJ6yVSNeFHn4vK+Gq84baPVRovCNm4er8GINnmhu3gS7ITf6HJxHXxT5v2
         shcAU6ZGRO3jAfc+W3AqglhKN+U+USvy1kYxjxHnC0JOKnsxGZJ3WZ15CPQLFCaBdza8
         OR4btLzUbj2x+/zIOmwJCl3MNNOSRlXjJv+ViXl8p2nn6bvNLtfF5rJGYvLLGbBWiNqu
         DJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741975626; x=1742580426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROHT2Xw0zSDNoVS9FZb8huCNL3lDdH75fAc3AbyRqUY=;
        b=N/E9C3+ZE9xcRkF22LqSCkiTayOF9swbKKHoTfccw5tpB80g0B+iOPaWT0o5uJn6On
         Oawx1YO+YaDDfso24Xd5j8BTx8QkoKFz2DWGwxlMTA45TmnodJ3puzvCAdhQf8qbb3p/
         GXg1a2rXq5jPg5Mf86MHNy4uahOWM5qqoXA+Lf2H1QaD+NMBpRftj7N9GKXbQEOGxJ8E
         MRq8IueiLm7te2zV5lesE3vUX79PlnUDt21VYFuAGmQNo0S0GN4I4IrMkELFrhhOS1D9
         msSwWv8V4PLG8eTbqCgq230Rd+od0jCcB5zNnhhVuGFKz5AiMCchRKI2yKg5iBjflCz6
         Qp2w==
X-Gm-Message-State: AOJu0YxDMNOUDlPOJQvvmERSzQQCa/kV8BORAKgWBjYTYyvfDYNmJ7oB
	gApAgaX9G/ULcLwVPC4zN7JlGUF5SQrZGX3nO49h/k7TKjjAcIAtZbWuSyzg/u1QNhQcRs8X7VD
	Ow/rliXltVgfwAvqKl4aavokZKbs=
X-Gm-Gg: ASbGnctgqO27kFsYz/xKgkPJcPuzC9uGABgS3PR7H1NW6tKFH123WTdeYjN6ebRwfaB
	KrXhci5nDka+V9tY/e8IfCuS057wHreBq3mpVLBf9weVUQtCJadKt8vFFm3SkkY5KjGMpP5O4Sd
	CpTbvDQ0RW5VZwOlI0D77tt1HWqESSNmwFr9Jj
X-Google-Smtp-Source: AGHT+IEjp6aYKU+JtVbUjF9VxeysA9tXI4e0I3/QBvWd+LvziEn0AH698rOhWbr77aai4JgYOR0xhH8r0wmh3r3YBGs=
X-Received: by 2002:a05:6820:3091:b0:601:b270:d2bb with SMTP id
 006d021491bc7-601e460cbe2mr1661841eaf.5.1741975625871; Fri, 14 Mar 2025
 11:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250314094638.1893858-1-alex.kanavin@gmail.com>
In-Reply-To: <20250314094638.1893858-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Mar 2025 11:06:39 -0700
X-Gm-Features: AQ5f1JooimHgeG9kjzMxuK7zVtEDkby4z0DJCjTQ-DfI6Exa38vnZaVTe_ZQ2KM
Message-ID: <CAMKF1spjC=gUZi4-O+qOLNgRu8Pzdc04j0ti=qdrSjokXE6kHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ppp: remove erroneous generated header from the
 source tree
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 18:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212855

On Fri, Mar 14, 2025 at 2:46=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> ppp-2.5.2 tarball ships a generated header with various
> configuration settigns that takes precedence over the same
> header generated into the build directory during the actual build.
>
> This resulted in various linking fails that were worked around
> by enabling multilink in 2.5.2 version update. The correct fix
> that removes all contamination is to remove the bogus header first.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-connectivity/ppp/ppp_2.5.2.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-co=
nnectivity/ppp/ppp_2.5.2.bb
> index 9ea99cc15a3..fd9223d2d1c 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> @@ -29,11 +29,16 @@ SRC_URI[sha256sum] =3D "47da358de54a10cb10bf6ff2cf9b1=
c03c0d3555518f6182e8f701b8e55
>
>  inherit autotools pkgconfig systemd
>
> -PACKAGECONFIG =3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} open=
ssl multilink"
> +PACKAGECONFIG =3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} open=
ssl"
>  PACKAGECONFIG[pam] =3D "--with-pam=3Dyes,--with-pam=3Dno,libpam"
>  PACKAGECONFIG[openssl] =3D "--with-openssl=3Dyes,--with-openssl=3Dno,ope=
nssl"
>  PACKAGECONFIG[multilink] =3D "--enable-multilink,--disable-multilink"
>
> +# https://github.com/ppp-project/ppp/issues/541#issuecomment-2722260363
> +do_configure:prepend () {
> +       rm -rf ${S}/pppd/pppdconf.h
> +}
> +

I wonder if it should be a patch instead, it can be better tracked that way=
.

>  do_install:append () {
>         mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d
>         mkdir -p ${D}${sysconfdir}/ppp/ip-up.d/
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212827): https://lists.openembedded.org/g/openembedde=
d-core/message/212827
> Mute This Topic: https://lists.openembedded.org/mt/111695980/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


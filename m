Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8340EC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 00:09:02 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.191.1701130136671595591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 16:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WB01trSQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1f066fc2a2aso2511588fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 16:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701130136; x=1701734936; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGj+UfqmyQNtcsck2hboUSsu16Gv+EdiS/GxaQQoD7Q=;
        b=WB01trSQO6Nfgivvlqkr63YIypnGHwe4PN6aBnRcGtBEYJk9hil7Fh3CTDbKXKZmGY
         5egjDEJzlJdef/YD3Ik9SoW2KyvInnAtvrCwy1SJZpX+QE3RXdbgTFkewaTVJjZQPLSJ
         Z82F4RtOQyux0L9mnOd6d+wHQlgQBhC/L6kyygTAKpiVvZaC1fImT4kXPQaNzc95LB9t
         HVZnBOueKgcjza3qlGEIZynKxFbPLKCewqR43u7+UrpFzBT3P0NCkdt7Mz7gFfgIeFt/
         hLTycAIVPl0IpCvPHBVveMsEBDzZnM/Z3hQViN/rqSupsjt9gQTqQNB9kryNh+J+D/su
         eNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701130136; x=1701734936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGj+UfqmyQNtcsck2hboUSsu16Gv+EdiS/GxaQQoD7Q=;
        b=SAeIuY5vwsHca3HnxhBa459ZNu7yyNwi0OkGqn+ocm13iaW0lI2zO50fKtYVIXf59h
         Rchc19YcB70iUz/pSXYbiEG4N7KiUAtRAicnUc44AdSk/7J5Tqlh1VZyyagchqAbElYU
         4X9gfA2iR7nMt7jLZIhE/L2jWYeJflRQ5Lr5hd3qR9B3rXGzzJ8p/TLOMnOqes7WTOlU
         zf9AhfiYq4Vg5UuqZXfkVoAOBtsZMiq32p+6Ee2e1uoWk1kwQ71w91qddcGvGhDkomY6
         hoiOMhGrcp8jtBnMg1dnLP+AIOCDMbw/YSL1e8j3d4F1a37fK47lijGmWqKofa/GmOZA
         xLgQ==
X-Gm-Message-State: AOJu0Yy0S2wPkxFNHjStSCr1hYaGLykgh0qlObIDdyUhF8ZlECZDWEPZ
	IPihzBF50rfA+AqRnnWwgz8eee2dVteE3rlZX6Q=
X-Google-Smtp-Source: AGHT+IHfuplrKHe4S2De9NRuNNAG/DF4+uxLuG41FLgwFpQjhvmrxNNPjU6icmV1niLFH/XhX82roYM6I+NAqUFCX8g=
X-Received: by 2002:a05:6870:9d8d:b0:1f9:5699:e53c with SMTP id
 pv13-20020a0568709d8d00b001f95699e53cmr17273803oab.36.1701130135639; Mon, 27
 Nov 2023 16:08:55 -0800 (PST)
MIME-Version: 1.0
References: <20231125073823.159294-1-raj.khem@gmail.com> <20231125073823.159294-3-raj.khem@gmail.com>
 <PA4PR08MB7411F95FD927EE786C9FB2CAE8BFA@PA4PR08MB7411.eurprd08.prod.outlook.com>
In-Reply-To: <PA4PR08MB7411F95FD927EE786C9FB2CAE8BFA@PA4PR08MB7411.eurprd08.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Nov 2023 16:08:29 -0800
Message-ID: <CAMKF1sqZUM6m4gBWP0GMQOrDZ8BbTns4i-xEh3mLKODVr9PADA@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] vte: Separate out gtk4 pieces of vte into
 individual packages
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 00:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191331

On Sat, Nov 25, 2023 at 6:04=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> Does this allow installing the gtk4 libraries without gtk3? Looks like th=
e GIR files will mean pulling in both.

I have sent a v11 where Vte-3.91.gir is packaged into ${PN}-gtk4-dev,
that should solve this concern.

>
> Ross
> ________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Saturday, November 25, 2023 7:38:21 AM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Cc: Khem Raj <raj.khem@gmail.com>; Ross Burton <Ross.Burton@arm.com>
> Subject: [PATCH v10 3/3] vte: Separate out gtk4 pieces of vte into indivi=
dual packages
>
> This avoids adding gtk4 dependencies when image may only desire the gtk3
> pieces of vte.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
> v10: Added new
>
>  meta/recipes-support/vte/vte_0.74.1.bb | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vte/vte_0.74.1.bb b/meta/recipes-suppor=
t/vte/vte_0.74.1.bb
> index 8a7054a13cd..91c331d44cc 100644
> --- a/meta/recipes-support/vte/vte_0.74.1.bb
> +++ b/meta/recipes-support/vte/vte_0.74.1.bb
> @@ -36,7 +36,15 @@ PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,=
gtk4"
>  PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
>  PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd=
"
>
> -PACKAGES =3D+ "libvte ${PN}-prompt"
> +PACKAGES =3D+ "libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-prompt=
"
> +FILES:libvte-gtk4 =3D "${libdir}/lib*gtk4.so.* ${libdir}/girepository-1.=
0/Vte-3.91.typelib"
> +FILES:${PN}-gtk4 =3D"${bindir}/vte-2.91-gtk4"
> +FILES:${PN}-gtk4-dev =3D "${libdir}/lib*gtk4.so \
> +                        ${libdir}/pkgconfig/vte-2.91-gtk4.pc \
> +                        ${datadir}/vala/vapi/vte-2.91-gtk4.deps \
> +                        ${datadir}/vala/vapi/vte-2.91-gtk4.vapi \
> +                        ${includedir}/vte-2.91-gtk4 \
> +                        "
>  FILES:${PN} +=3D"${systemd_user_unitdir}"
>  FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
>  FILES:${PN}-prompt =3D " \
> --
> 2.43.0
>


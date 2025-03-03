Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33394C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 15:09:16 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.55663.1741014554752236738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 07:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gtQgphop;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.47, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e891e447dcso51487586d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 07:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741014554; x=1741619354; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCRpt0Z/t7ZqFeZgGHOlrQTFxlH8tvlgt89gdUXgF3E=;
        b=gtQgphop/tMx3q7SoRN2AlDZ/7UxXfLEnQuDgYUHNlVhzqnOxk9kAV56ks5zhRrmOe
         G9GN5ePr9gVtO2Rqw5DZBidpazMf/zkJDKwew/WaRR1oikg/cGxHHU6Fl0m4mryPPNVt
         +DLg1oOum+VyaO0pQ0Ttte+11wHrH44nMgvnOdxAVGTTjmmq1goyLhps4MZfZGtwqEVy
         7OIzAt3thZw9SD5Y70zpS/WaJXOqnKOseYJ/H9gLEIipMf/IvSv9GWPQXCeXAnVshHAc
         SeBSjcr/tWGmgvGZPWFPoKo0xufHvtnTmMHN5C4cyLKILRbqX8H3s7X7c10rwMHkZBDF
         sb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014554; x=1741619354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCRpt0Z/t7ZqFeZgGHOlrQTFxlH8tvlgt89gdUXgF3E=;
        b=I5SL91AQMNtOljkcyXG++9wD9ZgPrfcsbuP0fiNDELGLDTWeN6ODH02icZVXv9F99g
         7NmrApteioGnWcSAQURHeXbZiS3QuPTIHyquGZbEPA0Vg5Bow/EmzEv70QrR5huzIBBD
         2ZlU1JntfFhMb+za6okyMaWE+11rTwPcs+FgVtFm6EmKnWnkiFRa0OcKe33boJk2tvno
         //Vgp9M9Um3POj5DkguG4kdHmIpF2as7/zMByiVteTjIZLXs0I4Sy9z3if6A+Oy1EgYD
         m+aKT/2IRrwb5g4DtxkBMAW4Ffp/1ZHDQi2rhHU5WMjM6fN7+StWJnayU+4hhqBHYlV7
         DEHw==
X-Gm-Message-State: AOJu0YykMMZ7q4gPQvsMk+d5rUIb9dl6cofQR6LKyLXye+C043Tu9Yxc
	GXv6UuLJnMpsY5suLFY2rg1bYWU/a/4i2wZMoRJbx4KOJoKGL5iHUiOBzah3kWahNnO1EMMpn3D
	OPIjvlChba0bVdnWjYaQswR1SB6njxQ03zzNb1A==
X-Gm-Gg: ASbGncsVG5+/pUBKMil+BpP7c0d3JUCvHATizr4VGi4zKCjPc/Sj8bIWi1ZGWIo1KCv
	p3Hya01sbvVs7Aid0qYlojqSGsUvnUM4JpwgFlZEEOKr88sNXtELykmUbl94fVkOdzrFrJ7+rbC
	+StnNZc19m/7PYxxezHMX3pmWB9aQQWz0iyqvPxJNY1bfCjpuDUkj2AVmmuQ==
X-Google-Smtp-Source: AGHT+IHpvbmiw/Im6fFuUTWrkfD/5UYpSE6h9Onv6q9O5dl4BYjXEBR+1cFkUPVc3zQU4rT+aTKky80mZDRh7j8V0xk=
X-Received: by 2002:a05:6214:500f:b0:6e8:8791:54e5 with SMTP id
 6a1803df08f44-6e8a0d14d2amr199468986d6.26.1741014552106; Mon, 03 Mar 2025
 07:09:12 -0800 (PST)
MIME-Version: 1.0
References: <20250303134038.102355-1-alexis.cellier@smile.fr>
In-Reply-To: <20250303134038.102355-1-alexis.cellier@smile.fr>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 3 Mar 2025 07:09:01 -0800
X-Gm-Features: AQ5f1JoG38YBNxAvo6s4O0xWfOAIVX7wthhCuh0EGeHnNuJXElfKCG4Kz5ysRyo
Message-ID: <CAOSpxdayD11HBG8t2CCNgGF1PkEMH=pagm2tfh7hfk3HhRjU6Q@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS
 if pcre2 is enabled
To: alexis.cellier@smile.fr
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 15:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212209

Is this also an issue on master?  If so, this needs to be accepted
there first before I can take it for the stable branches.

Steve

On Mon, Mar 3, 2025 at 5:41=E2=80=AFAM Alexis Cellier via
lists.openembedded.org
<alexis.cellier=3Dsmile.fr@lists.openembedded.org> wrote:
>
> The libpcre2 is now dlopen'ed, so it is not automatically added to the
> DEPENDS anymore. Add it to the RRECOMMENDS list.
>
> Cc: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Alexis Cellier <alexis.cellier@smile.fr>
> ---
>  meta/recipes-core/systemd/systemd_255.17.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_255.17.bb b/meta/recipes-c=
ore/systemd/systemd_255.17.bb
> index 8f5170929f..f85ad61080 100644
> --- a/meta/recipes-core/systemd/systemd_255.17.bb
> +++ b/meta/recipes-core/systemd/systemd_255.17.bb
> @@ -188,7 +188,7 @@ PACKAGECONFIG[oomd] =3D "-Doomd=3Dtrue,-Doomd=3Dfalse=
"
>  PACKAGECONFIG[openssl] =3D "-Dopenssl=3Dtrue,-Dopenssl=3Dfalse,openssl"
>  PACKAGECONFIG[p11kit] =3D "-Dp11kit=3Dtrue,-Dp11kit=3Dfalse,p11-kit"
>  PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam,${PAM_PLUGINS}=
"
> -PACKAGECONFIG[pcre2] =3D "-Dpcre2=3Dtrue,-Dpcre2=3Dfalse,libpcre2"
> +PACKAGECONFIG[pcre2] =3D "-Dpcre2=3Dtrue,-Dpcre2=3Dfalse,libpcre2,,libpc=
re2"
>  PACKAGECONFIG[polkit] =3D "-Dpolkit=3Dtrue,-Dpolkit=3Dfalse"
>  # If polkit is disabled and networkd+hostnamed are in use, enabling this=
 option and
>  # using dbus-broker will allow networkd to be authorized to change the
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212208): https://lists.openembedded.org/g/openembedde=
d-core/message/212208
> Mute This Topic: https://lists.openembedded.org/mt/111487747/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


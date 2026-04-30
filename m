Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E74FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 13:43:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20904.1777556587799319910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 06:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E2dQYLok;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488d2079582so9740035e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777556586; x=1778161386; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNFsH76ggmBAfvJoyscdNguDZRm/4eEGnQi/qg0hZqc=;
        b=E2dQYLoki6H5Jr+xG4lbWKIli9bkwJ0ptfTO62YReSd4NNUWzCLjEhLhRYfZlbiuKJ
         AVRRGMjuBH5WTKKZD5DVedsaBgDIAUMVts5GJLQLKS0AXOH6zNWwNquAU9wq7O+IDMJP
         +pWH2QUWmsuvPXNcIuIjFRsqmdMt5QyyiuofE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777556586; x=1778161386;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNFsH76ggmBAfvJoyscdNguDZRm/4eEGnQi/qg0hZqc=;
        b=Y5oRb41+JJh+NRNWaShMWJcSUAVwKMA+D3UjLCJkoMtwD6D7j0RhpGNjwuazY7K+aK
         vP1bch1gm6VmMEvmAA9G7UZFwGF91n18RWZ22QthkI5IZSKfyLexBWsgrTiy9jxturx5
         gnxHy7BNnAKcPzU58Xpu5Kt58HAAUUcne7py8pB1FaffD1QcgG7pswtzicMql/K2YzSu
         xY1IUHKJeBWcM1I1qCQ2GrLxyuvHLyGgs2HgEWCRxypprv5S90bp2ii4Ybd5LMyHN5Ua
         cnrKCBGXtGaLNGixp3ZD912YOBVKOz+bhusbN61tU3uPKFPtGXITWdbLjwzFg+DMPYrN
         56ZA==
X-Forwarded-Encrypted: i=1; AFNElJ+bPtPRg5Ozsn7bSYt7bLjIyK4ckTgwqbDr9i7s6wR0w2WBnNXU44XXA47MIOkgBIgk4OYycWwIKi5ttXXwUwU9bw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwqcSTXCuKqRZhEpxoU28YpqhnfIFzPi2/TAN+y3gDUUre8IZuS
	o4+/MNTQDdwPWv5pz011bsHZm2kEYh7mF46OyYgyNJ34qcHU6x5ywondWtY50SolyEo=
X-Gm-Gg: AeBDiet7xJPqVMrhZfgFGoQwnIpiiFhenbxpQ6LnhoVetcHre0//o+nBiv+o7/PwUKU
	kR144nGNjivvTIwTdZ5vyNi6IwUHPimYsKem/ibuSZRayCcFoD/B+z4g1yCtWsWWmzVnQKJhh2w
	SOGGppH8j/NDI3vxUE6pZTYcpBVTfBgFeY9k+otw/1ZT6CkSGEFsXp6rEMCr3KN/6W1Sri2E8p5
	w/onzEnYo7t7qflHPfESnYPZPIiCPZ4mMY9JoZcZ97dmUDhhdoHQr8Srl/bBUu8fO7KJFQENCaD
	IimBpOYf7WsZCBv2g4mQ2615pgAYeCHfzQ5jp+Qu/6sHEl4kEyQ4A6aVUvP09vji5MDWpRVl0JK
	4j5n16Piew6hSDTCggbAyoCH8fVW/Y+yV/U8+vnovbGHm/9l7mSp8kaZlTSi7JS/mPOGLqgf/fJ
	WpntAf/hSWaRhnhqyQRHOJMZXLuooCLIV1Jl/Hswdm1kG1LijiEI2AH9q3vJ2Wlwowm+7pgGXgm
	o4GwAjamNFeXlS5bb3MHDzO18M=
X-Received: by 2002:a05:600c:4fc8:b0:48a:7772:c26b with SMTP id 5b1f17b1804b1-48a8445d259mr52139295e9.26.1777556586042;
        Thu, 30 Apr 2026 06:43:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c319385sm60372275e9.9.2026.04.30.06.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:43:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 15:43:04 +0200
Message-Id: <DI6J7XTUQ6CP.EB98FAD9J0WE@smile.fr>
Subject: Re: [OE-core][scarthgap][patch] gdk-pixbuf: Fix CVE-2026-5201
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260428070240.2691024-1-vanusuri@mvista.com>
In-Reply-To: <20260428070240.2691024-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 13:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236168

On Tue Apr 28, 2026 at 9:02 AM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> Pick patch according to [1]
>
> [1] https://security-tracker.debian.org/tracker/CVE-2026-5201
> [2] https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/304
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch | 44 +++++++++++++++++++
>  .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-520=
1.patch
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch=
 b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
> new file mode 100644
> index 0000000000..97e0dddb62
> --- /dev/null
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
> @@ -0,0 +1,44 @@
> +From 6cce9311e70b969cbcc6e3e1e74ae1756ed02d5b Mon Sep 17 00:00:00 2001
> +From: Matthias Clasen <mclasen@redhat.com>
> +Date: Mon, 30 Mar 2026 12:21:56 -0400
> +Subject: [PATCH] jpeg: Reject unsupported number of components
> +
> +This condition was already checked for incremental loading.
> +This commit adds the same check in the nonincremental
> +code path.
> +
> +Closes: #304
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/c=
ommit/6cce9311e70b969cbcc6e3e1e74ae1756ed02d5b]
> +CVE: CVE-2026-5201
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + gdk-pixbuf/io-jpeg.c | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/gdk-pixbuf/io-jpeg.c b/gdk-pixbuf/io-jpeg.c
> +index 9ee1d21..d419812 100644
> +--- a/gdk-pixbuf/io-jpeg.c
> ++++ b/gdk-pixbuf/io-jpeg.c
> +@@ -625,6 +625,18 @@ gdk_pixbuf__real_jpeg_image_load (FILE *f, struct j=
peg_decompress_struct *cinfo,
> + 	cinfo->do_fancy_upsampling =3D FALSE;
> + 	cinfo->do_block_smoothing =3D FALSE;
> +=20
> ++	/* Reject unsupported component counts */
> ++	if (cinfo->output_components !=3D 3 && cinfo->output_components !=3D 4=
 &&
> ++	    !(cinfo->output_components =3D=3D 1 &&
> ++	      cinfo->out_color_space =3D=3D JCS_GRAYSCALE)) {
> ++		g_set_error (error,
> ++			     GDK_PIXBUF_ERROR,
> ++			     GDK_PIXBUF_ERROR_CORRUPT_IMAGE,
> ++			     _("Unsupported number of color components (%d)"),
> ++			     cinfo->output_components);
> ++		goto out;
> ++	}
> ++
> + 	pixbuf =3D gdk_pixbuf_new (GDK_COLORSPACE_RGB,=20
> + 				 cinfo->out_color_components =3D=3D 4 ? TRUE : FALSE,=20
> + 				 8,
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/r=
ecipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> index 7c58fe1e1d..2f0de425b5 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-$=
{PV}.tar.xz \
>             file://0001-meson.build-allow-a-subset-of-tests-in-cross-comp=
ile.patch \
>             file://CVE-2025-7345.patch \
>             file://CVE-2025-6199.patch \
> +           file://CVE-2026-5201.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a1=
48cb669ab748e3c7"

Hi Vijay=20

Thanks for this patch, but unfortunately I have to put it on hold.

The fix is merged in the upstream project gtk-pixbuf from the version 2.44.=
6,
and the oe-core master branch is currently using gtk-pixbuf 2.44.5.

You'll need to either submit to master a backport of this patch or=20
bump to 2.44.6 before I can approve it here.

Thank you.

--=20
Fabien Thomas
Smile ECS



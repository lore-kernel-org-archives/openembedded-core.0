Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE32EC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 21:59:19 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.4604.1748555957943158486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 14:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fVtPAaqY;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-400fa6b3012so1514471b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748555957; x=1749160757; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX5DVgbgZFdHSKX+iBVWCQ/v7W4EJAWbEtWlom28Ljc=;
        b=fVtPAaqYiu+16iLXV2tWspcXxn87P0Ym0g9Q4SArW25WfS8m1RSgDpudAaBn+VFsCA
         kX7PtljhtQ6utKfVDlr13Qr2rm0qtkfdkXC739gB6nPLSGghG1qABDQGm4782QwO2/CU
         t9tn/XLVAh1Q7d3Y2qeyhsjX2kZMIxpc+Zlqp7bHvfNk85AqI781G15zIuEjAAMkZt+d
         lE7qsFukHG3Oc9362SKOvmBtRHqZh1Y3+CMr0FJSI7x/SMAG3EbmMh3/+4H1mYzF2SmZ
         UhWBHClWgFjhIbXwz8UsJuSPVsrgDt3Eme+C+uzU4U55rtquJQd5BjYaphwJ9LisBHqe
         kegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748555957; x=1749160757;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pX5DVgbgZFdHSKX+iBVWCQ/v7W4EJAWbEtWlom28Ljc=;
        b=VRXKKWH+fMQXGabZ3ImXcApsNoP2FoAtl2fkYqOelrFDr1Cyeb4oe/Zw0SoiYtTvEG
         m/TQ1n+YmGMbC6CcYPg/gQOtL98PnxI69Mxob7e3yTOST31KXRqGhSQk1REkfjF9/IPD
         8mos4r9HFiP4lEkl1PkvWC2Hxtc/F13tSz3XQPKv1D6BmQmKc2Td9wKpW/xdwS2svlGR
         hCtzyKhdwgDinjmXmWLLwuLtHvPlKgeAmS/HGaApVJRzIojztqFDipOoui0vrhbGxnao
         zZVtmKL0qEv3oD44UvRWUIQk2qPvmYi7tvlVFbsWiqeOckc6GgFLiNaWsJ2MgOxj0b7w
         A3Qw==
X-Gm-Message-State: AOJu0YwI/PwqGIPtOTyliX9lZl2zCFHYfYrbCxBQsAtgR0eLN8AzSFbV
	bmHw90OEUXq5iuLO4IBuFHZw++nyjAGHSZDXcXgO2FBuz99QhR4Rmg0eyqcM3kiYrdZy9U/tkgW
	XDgENeCU5TMu3RMZWWSmllg18N+tdPQEoo6zR
X-Gm-Gg: ASbGnctRi1c+gAE2fI6u4YRz61wlmMEKZZl+1NLKJqIxUMWQa7Au42bDscvsLPwr2Dl
	meU6iQQyeNbDVRcxPSqcbynem9lh4PXs/SlPNKHW4vkov0Ec2JyKu3U8YqwJI3j40UEYrpjw9PZ
	3lQgmMBNe10HVbyjvY8roobpqojmYtjaQn
X-Google-Smtp-Source: AGHT+IEIEsZwFgVOOX3UJbNdAWHJaC1QVSlrlOIw4FZoFpvQB/OQSSQ5yo0j7KEirWNWmyH4FB7FJjTTkxjTCrKN5F0=
X-Received: by 2002:a05:6808:680a:b0:404:ed12:450 with SMTP id
 5614622812f47-40679fd28c5mr578225b6e.14.1748555956847; Thu, 29 May 2025
 14:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250529210239.2070257-1-raj.khem@gmail.com> <20250529210239.2070257-3-raj.khem@gmail.com>
In-Reply-To: <20250529210239.2070257-3-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 May 2025 14:58:50 -0700
X-Gm-Features: AX0GCFvgR3Vu97928Xos9rkGby-3_y32jezIsjBE5f5s8wCO2K_XJ9_NUIJBq3A
Message-ID: <CAMKF1srsu487Zp9tsbZ=24VttRD5pYVtrPKf=YnK0DYTuLoOqg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] vte: Pin to use GCC
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 21:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217455

I did realize that this is not working, because the problem is in the
libraries in sysroot perhaps which are linking to the program and are
built using clang
so just limiting TOOLCHAIN for this recipe is not enough

On Thu, May 29, 2025 at 2:02=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Fixes Qemu usermode crashes during GI data generation for armv7ve
> when using clang
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/vte/vte_0.78.2.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-support/vte/vte_0.78.2.bb b/meta/recipes-suppor=
t/vte/vte_0.78.2.bb
> index 0593d16cd86..b8a19a03693 100644
> --- a/meta/recipes-support/vte/vte_0.78.2.bb
> +++ b/meta/recipes-support/vte/vte_0.78.2.bb
> @@ -26,6 +26,10 @@ SRC_URI[archive.sha256sum] =3D "35d7bcde07356846b4a128=
81c8e016705b70a9004a9082285e
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
> +# qemu usermode crashes when using clang as system compiler but works wi=
th gcc
> +# see https://patchwork.yoctoproject.org/project/oe-core/patch/202409232=
34336.3978188-1-raj.khem@gmail.com/
> +TOOLCHAIN =3D "gcc"
> +
>  EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dv=
api=3Dtrue', '-Dvapi=3Dfalse', d)}"
>  EXTRA_OEMESON:append =3D " ${@bb.utils.contains('GI_DATA_ENABLED', 'Fals=
e', '-Ddocs=3Dfalse', '', d)}"
>


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1674CE6917E
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:24:47 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.28321.1732292683903232114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Cl8j+kYY;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.176, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e388186edbfso2216949276.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732292683; x=1732897483; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ar+IF7CC1ob7zq/Xi5SLsU4SyTh72zwXkC71AOHylz0=;
        b=Cl8j+kYYmNOF/Vm9H5DGyJD0vKPGB8ShTopbqnF1r7B0PtomEw1TnAJ0WrfS7qFUA/
         nFP6eG/F4mdHBBOf9UKw/LUgNbpuNQeGL+H87m/MG80rivqywWBVTunKNiCiaoZs9gsJ
         5JpwK26vuNV/9jSgy7mVFqWPXX8DQm75nPpWnZ4V6WUiC2slQ7ew5sR/d7l5DE69rImY
         XCZUoYIlLugHGYA0zwvcml2QaRZvC0qEBLWrFh9eCIIe+xploR9zVJHoS/HupugjT9cE
         l8T8rGBEKT2ozPOQxy/ZotjJkdxbbrtZnzDEkyOW8gjXJQ/KDerbLQH/U15TtvFKQq5e
         bPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292683; x=1732897483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ar+IF7CC1ob7zq/Xi5SLsU4SyTh72zwXkC71AOHylz0=;
        b=e/jhcuJuM5MNXpZSS2q8NCDWfe24ecuQ/Dj8YlNwIoQ74S8Je22iUS/j8xOJz/uWgo
         Nz4pSAJMf6o4D4iAUU95OA/XSHGVEzvdKpRzq2BUdv5+fJR6A//KoIjSMELmO2ki8ysk
         w79xE+47bP2RbrNgQKo+nUYAOqVUEO6Q8f6bXruXpcTYv5+OqpDyL1EZ/b8skg0u3u2N
         QxUFYiGm4bA7H6e02KbxP/ayY1OJWujPxoP3b4xMkchrZST4fK8SFU9eUDQeGUP0VXPq
         1dBFudKkdXuVuqdvHvvpnxZmwOi+uTTrtr7WTx9STwJofXXWaZFkToFeRjHRHOLXnKvp
         YSdQ==
X-Gm-Message-State: AOJu0YyY5ajw1pVxrDk+4MpDMbILngYjgzbNmh77QhBCylvse8tIJ9A0
	7nWQDyQOlZu9PWiJqdhfIYxkwVjrpl1VzIOuzejCbb3WuefJLeQu3/D8oCkkH7cDQ73drga7UVv
	4IZUetm8YHP/TDUG9Tm9gAhVHnWnyznUltS3K9A==
X-Gm-Gg: ASbGnctKnkcf2cDHxRcOwgl5FkzRu0PWg1vq2Gqbi1tbDwxNNCa3D/TUsvGahshAOHF
	81oEyUixAXjful7Y1rCuZWofzlPSGd28=
X-Google-Smtp-Source: AGHT+IH5wb7dK3xSE44OCq4JN5qid3h+TciY8w/AAtgNT1Nd0VwXV7C9omNtcqpBsz8/GbkhiA/fDcJS4Tz+vtgAU10=
X-Received: by 2002:a05:6902:702:b0:e38:1c88:7d80 with SMTP id
 3f1490d57ef6-e38f8ac8695mr3456510276.9.1732292682978; Fri, 22 Nov 2024
 08:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20241121134300.1074541-1-alex.kanavin@gmail.com>
In-Reply-To: <20241121134300.1074541-1-alex.kanavin@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 22 Nov 2024 08:24:32 -0800
Message-ID: <CAOSpxdaYU3PL3Bc0zzYnbuU3G-WYCHKLwF2R3SHej8_nN2B30Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] package_rpm: use zstd's default
 compression level
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207638

This is causing breakage on the autobuilder for kirkstone:

https://errors.yoctoproject.org/Errors/Details/822859/

The scarthgap version is fine, haven't tested styhead yet.

Steve

On Thu, Nov 21, 2024 at 5:43=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> zstd uses 3 by default, while 19 is the highest and slowest.
> It's not clear why 19 was picked to begin with, possibly
> I copy-pasted it from rpm's examples without thinking:
> https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D4a4d5f78a6=
962dda5f63e9891825c80a8a87bf66
>
> This brings significant speedups in rpm's compression step:
> for example compressing webkitgtk takes 11s instead of 36s.
>
> The rpm size increases from 175648k to 234860k. I think it's
> a worthy default tradeoff.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/package_rpm.bbclass | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.=
bbclass
> index f403af53439..3541be07aeb 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -2,9 +2,7 @@ inherit package
>
>  IMAGE_PKGTYPE ?=3D "rpm"
>
> -RPM=3D"rpm"
> -RPMBUILD=3D"rpmbuild"
> -RPMBUILD_COMPMODE ?=3D "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'=
))}"
> +RPMBUILD_COMPMODE ?=3D "${@'w3T%d.zstdio' % int(d.getVar('ZSTD_THREADS')=
)}"
>
>  PKGWRITEDIRRPM =3D "${WORKDIR}/deploy-rpms"
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207535): https://lists.openembedded.org/g/openembedde=
d-core/message/207535
> Mute This Topic: https://lists.openembedded.org/mt/109703382/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


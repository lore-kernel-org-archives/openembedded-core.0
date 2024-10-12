Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9F2CF257E
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 20:41:31 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.18918.1728765682364004228
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 13:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nZATWGkP;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5eb17036f27so1179731eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 13:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728765681; x=1729370481; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufcliJKvsodLIZDeow2anQ8yOWtMePG2sO7Cg8zSqc8=;
        b=nZATWGkPlsISfQlX5Pl0QPyJZwDb3iJBUl5GKR5cVM/W1+20+eIaGhnAEsNnMlhrp6
         6AOguAYdmIUulXIgDpn/EsQ3t2SdKpIUAJvYlnPJIfkt1KpzQudSwCcDgXQvOe60qh+C
         ReKtRl+vAAAXkesLP8JA1Pcet+ABtrG+tc587JlRr1xpnMjQeIT4ZcoGIrVEGjjdqqSj
         DMau1sXB/8VoyESvRmntPf3rv6qTlT8B99wFPc7v6ceUTt3nftkm5CtqPs+NoSiZvOWF
         lQYQnD6vPHfnNGv9vHl+/DThIf5/XhGZr/sDLVeQeLgtjGnSt7oumgtvzqhcZ8YLYWSo
         S04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728765681; x=1729370481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufcliJKvsodLIZDeow2anQ8yOWtMePG2sO7Cg8zSqc8=;
        b=tmFhiEuLK8xb7fW9ebo4oHppn84lXTbVCswxruixs9w9L15d4J/Ji+FPw8x47s2Z93
         R1UejXcU3GIOOm40w+cI8rPOcjFbV0azmadrOpmODA481k4Y6qPv2MocHjITLz7i7w+x
         X8XW6Lu7GglU32Zb1V5Avitb27Gra+wrrxbv/oHS1fzQPLgNJshNs8oYAr4QY2Ikz5cx
         Ie8xXtJkDgze9QB5FWqNW/UIMgvp1P4Vvwvix9TG0UCoF0bvzYMqoO3PPqnwDI/4EugP
         GjKRNMQdVC+w3pFJCIYGC/WpTW0hHN/vrwCL/HX3bOjWgeUdmDw4kVqB6uCcO+KVuwfv
         ESwg==
X-Gm-Message-State: AOJu0Yz8aBH4f6C19S9DekerRZqk63w9twJu+KKXj6n6tV0dZbWfzTlX
	HZcjvs9cbUZzYbE0baTOSpYjZUhlXwPK7oESQVKJ1RYFA17xyksQ4va3yrJLuTD/nGnd4rfUdhr
	dGB0Ma7lL7kyGI8aWkImjlXQmv3g=
X-Google-Smtp-Source: AGHT+IEnoHb+/dZ/s5W4kM3iXBSUkv+6us7BokyLV2QAiikWzGNWvL3hCSezpV4qDzfjbYVFf2Ia+rPPA4/Sjf9vYOM=
X-Received: by 2002:a05:6820:54e:b0:5ba:ec8b:44b5 with SMTP id
 006d021491bc7-5eb1a19a9cemr3868567eaf.3.1728765681585; Sat, 12 Oct 2024
 13:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241010160623.2880937-1-ross.burton@arm.com> <20241010160623.2880937-2-ross.burton@arm.com>
In-Reply-To: <20241010160623.2880937-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Oct 2024 13:40:55 -0700
Message-ID: <CAMKF1sr5mCiT1H4tGTK-3SAA_F7ejMJtyS-eqmTbrNBjZjsJtg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 02/11] ffmpeg: no need for textrel INSANE_SKIP
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 20:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205712

The textrels still occur on qemux86 when using clang+lld

https://errors.yoctoproject.org/Errors/Details/809513/


On Thu, Oct 10, 2024 at 9:06=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> It appears in testing that modern ffmpeg no longer needs to disable PIC,
> so there's no need to ignore textrel warnings.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> index b16bd51dbd7..af66104ebf3 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> @@ -181,13 +181,3 @@ FILES:libpostproc =3D "${libdir}/libpostproc${SOLIBS=
}"
>  FILES:libswresample =3D "${libdir}/libswresample${SOLIBS}"
>  FILES:libswscale =3D "${libdir}/libswscale${SOLIBS}"
>  FILES:${PN}-examples =3D "${datadir}/${PN}/examples"
> -
> -# ffmpeg disables PIC on some platforms (e.g. x86-32)
> -INSANE_SKIP:${MLPREFIX}libavcodec =3D "textrel"
> -INSANE_SKIP:${MLPREFIX}libavdevice =3D "textrel"
> -INSANE_SKIP:${MLPREFIX}libavfilter =3D "textrel"
> -INSANE_SKIP:${MLPREFIX}libavformat =3D "textrel"
> -INSANE_SKIP:${MLPREFIX}libavutil =3D "textrel"
> -INSANE_SKIP:${MLPREFIX}libswscale =3D "textrel"
> -INSANE_SKIP:${MLPREFIX}libswresample =3D "textrel"
> -INSANE_SKIP:${MLPREFIX}libpostproc =3D "textrel"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205411): https://lists.openembedded.org/g/openembedde=
d-core/message/205411
> Mute This Topic: https://lists.openembedded.org/mt/108932124/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


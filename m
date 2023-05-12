Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADE8C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 19:33:34 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.33881.1683920008093252106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 12:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=By4bjOLI;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so92418635a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 12:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683920006; x=1686512006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Srx5EKB5V7Plh6d9QrVwj0pP3T7gB0aRr6QtpIJw+GM=;
        b=By4bjOLIYRUWovTROcGdvrDuGbQu9A0N0r2BzrcfrsvTPl40f/dv/b2i8B833A2vNm
         RCKGbekfwwTgsNsvvq01uKRtAVa8vhmYD/CkEYzn7bWvglnVwtHnSCiQ/2q5gtk7mluo
         nYBgdLyiCNGA+hqkprKPRzZDfEdQvL8PvcjLZVFR+56eXi5A4Bh0cKQIqfNobuKk3Eu+
         +e9TFdAvoAx672YiHBqVjO+D8FiKh4EMHsEOIcXho5Dq7KQcCy4LpMEKQAV2ZdgCMWZq
         YPUVHAfgUKw8J1+9Ztb86RpPx9s72an/7zc4SN6wtN4L6DNcGfzmzxSK10w61gJhx8qh
         FJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683920006; x=1686512006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Srx5EKB5V7Plh6d9QrVwj0pP3T7gB0aRr6QtpIJw+GM=;
        b=WGvdo42XcoGWxE4pgQeWTB0G2uJAjxuuNpb05aOuWd0iujcAgawnuED7K4pykEs5T0
         4ok0XLSWajJNGCBTlzSWa8gS7CgxFNz19RF51xznDyPfS4k4CTekpSDadIjimGcPt/ix
         I0ollNlM+1UvJziR7WfJeltMp64uv5jHNj8NoIMnwRBUYt4nzK8IhPS2uWUYy6/tHvGl
         XB6VD8BlP7X98Hbnt5+fgKPqlobS3pf58TBtIA48tgWC5puW4wIAUxCQTVC+57Ue8POD
         554BzV3ob0SEa5aRdTR3sckanNxZwYEPDghuUIKY5pdk/KufmBm6JZI23tM/x1MqKTyD
         l8gQ==
X-Gm-Message-State: AC+VfDxy86oB+qqjI8oQdmSr0QAF1Rfaf6Qfb8C+5DdwEb6CClZhcbT4
	xZQE2s4jESCM1uysuvpxjr72sRIobDlZrZoBh/NdRQ==
X-Google-Smtp-Source: ACHHUZ4kc0ewJo53TvAwb7aTYk8R4rNQIIQuA02Wr/j2xzvOqo3T7yLbjN4B134Rt3GgBeJqFnAqVmW1fAcgsE2095Q=
X-Received: by 2002:a17:907:7ba3:b0:966:61b3:f638 with SMTP id
 ne35-20020a1709077ba300b0096661b3f638mr20472033ejc.26.1683920005968; Fri, 12
 May 2023 12:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <SJ0PR03MB70500DC32860BC4008C279C6AF759@SJ0PR03MB7050.namprd03.prod.outlook.com>
In-Reply-To: <SJ0PR03MB70500DC32860BC4008C279C6AF759@SJ0PR03MB7050.namprd03.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 12 May 2023 09:33:15 -1000
Message-ID: <CAOSpxdYFEinXX58O8bnZxRYq=LpEeKzkZMjZZFzJPagpAOqN5Q@mail.gmail.com>
Subject: Re: [OE-core] [Kirkstone][PATCH] kernel.bbclass: Backport improve
 initramfs bundle processing time
To: fabatera <fabiferro@hotmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 19:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181194

Hi Fabatera,

We have this patch in kirkstone:

https://git.yoctoproject.org/poky/commit/?h=3Dkirkstone&id=3D115d07b2d4f702=
fc569d47b64deb95d1fcb994a0

Thanks!

Steve

On Fri, May 12, 2023 at 7:31=E2=80=AFAM fabatera <fabiferro@hotmail.com> wr=
ote:
>
> From 6ec497c2c87ceb75cd61dee9b91dcbe650287326 Mon Sep 17 00:00:00 2001
> From: Fabiano Ferronato <fabiferro@hotmail.com>
> Date: Fri, 12 May 2023 18:05:48 +0200
> Subject: [Kirkstone][PATCH] kernel.bbclass: Backport improve initramfs bu=
ndle
>  processing time
>
> Building a bundled initramfs, on do_bundle_initramfs task,
> -j defaults to 1, which means no parallel make.
>
> Passing PARALLEL_MAKE explicitly to ensure parallel build.
>
> Backported from upstream.
>
> (From Poky rev: 01f0a371b139d35a6f6f39fdd96f0d1a796684d7)
> (From OE-Core rev: 88fd394ecf0f2174b792075d409d87046896426b)
>
> Signed-off-by: Fabiano Ferronato <fabiferro@hotmail.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b315737fd2..d45fa25c32 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -377,7 +377,7 @@ kernel_do_compile() {
>                 use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr=
/${INITRAMFS_IMAGE_NAME}.cpio
>         fi
>         for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> -               oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alter=
nate_initrd
> +               oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA=
_ARGS} $use_alternate_initrd
>         done
>  }
>
> --
> 2.30.2
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181192): https://lists.openembedded.org/g/openembedde=
d-core/message/181192
> Mute This Topic: https://lists.openembedded.org/mt/98854060/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


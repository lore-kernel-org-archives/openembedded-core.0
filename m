Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E315C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 12:53:55 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.40129.1738846430426239042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 04:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aMNYA1DN;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dd049b5428so6431336d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 04:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738846429; x=1739451229; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W+G5WZfZMj73qA+ZA4VueqqDtSXEisLAeG1iSZdPVp0=;
        b=aMNYA1DNGFtAs0IEC0Xw29g6Opa7+h3I3dGMu0iMTLFcFU124y2jclbL1JRwnde8qu
         FHrESNU99kELiqVJxFXmkN6D5N1gor+MwyRmrcGloFUrMYuuwbyIjVsNIT1+1w/iworO
         TTaAtNZew9T6/p3zz9JSGi+jMTxnfbBjUL+HOaJ+DWSDeCvNncMQZEyrLJRIitPjE8Xj
         wUcSyHuN7WPG5VU+fU+cRuPUQoymnotUW2t1uF05R/O/WPuVO13Z1OCm9znVZk2ccvnk
         jI4U9HJjUU62VTJScRGfxZ3pRE9ld29WnY0c5XfAdBn2mTOr/b3S5GQVAstm6PP2vz69
         CveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738846429; x=1739451229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+G5WZfZMj73qA+ZA4VueqqDtSXEisLAeG1iSZdPVp0=;
        b=lNDtuTn6dnQu09OMOFhOlF2Pg2Vwlvj3Xm8ea8VN286HG1pxJlXmaDnBhniaJabd2i
         RtaFf97Iskfy1VRAyJydZk2cs+pfNNUU5sVVwo5k2k5Vtr/PRMOHd0zIn4Z8/EEGfqTo
         nymE+oKSE2nIGs7gRJjpjNQEH8BMCUGoyqKshDUcFmMBYhggs5G+FfBoSe77YZ5KlXik
         skSibxyaJhflGO1z/a7RQPXl+n/Hf6Zg1XAsiCbd1fg/mCndOnQZ1/QwdxgDcKL9n8GG
         omsC/ftq/X8QgiAldQKfZDprX+r/9ya8zmFFj1x2iTb75m13RMUP/8foEB2Xb6Brh2xf
         JJBQ==
X-Gm-Message-State: AOJu0Yz03Yl7DYHOlBIVxdXG0LQP5LFnmLZMDRUHXgmgkeejgCTxVZCP
	CulAAglz5wDGdzo5m5+HjrE5Zuuh8i0KrL9yEraUvjcjzBwxvBfjWt3aSQBvwnAPpqlI25V/6y5
	DgoHQNRhXYWIsnzF/c/IU3LKV4D4=
X-Gm-Gg: ASbGnctcVBiAkwJqRyV6uw1F/3Y9CuPy/nlqXzBKcFyJPUCYSxP7r5TVNW6sY7oNLDn
	DGS2lVAgsEFSyvGTXEuG7tQUV6Ust6NaoOWYZtkLhKik9FVWhrphGIE8VfwQXOo5lLK74RKDrc8
	BFm7/Jd8Y6YILHlDdTPFzIrGR0NGAur1o=
X-Google-Smtp-Source: AGHT+IGFoGXmB4RaJmytlyrav+gapDYF5HcBXOjn326KBrdjJYNh/oiNBs7pyWH3iy2GY7ayKC2QVhFWVtfXvLPjds0=
X-Received: by 2002:a05:6214:4a05:b0:6dc:d101:2baf with SMTP id
 6a1803df08f44-6e42fb95c61mr96730626d6.17.1738846429338; Thu, 06 Feb 2025
 04:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20250206124941.342980-1-pascal.weisser.ext@karlstorz.com> <20250206124941.342980-2-pascal.weisser.ext@karlstorz.com>
In-Reply-To: <20250206124941.342980-2-pascal.weisser.ext@karlstorz.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Feb 2025 13:53:37 +0100
X-Gm-Features: AWEUYZmPj0ydGynmn5Q0PhpgEGbBlrZCP8twj6lkRmRiuSqeyqyXSNe3Gi8s85c
Message-ID: <CANNYZj8xHUcyrcRk6XMu0nYw0YC3tVbtHFpSsHRqjbz_suqHxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: Add weak default value for IMAGE_ROOTFS_MAXSIZE
To: Pascal.Weisser.ext@karlstorz.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 12:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210933

I'm sorry, but we do not endorse that linter, and do not accommodate
its (sometimes strange) demands. You need to fix the linter, not
oe-core.

Alex

On Thu, 6 Feb 2025 at 13:50, Weisser, Pascal.ext via
lists.openembedded.org
<Pascal.Weisser.ext=karlstorz.com@lists.openembedded.org> wrote:
>
> This would help the recipe linter oelint-adv from meta-sca layer to add
> the variable IMAGE_ROOTFS_MAXSIZE to the list of known variables.
>
> See https://github.com/priv-kweihmann/oelint-adv/issues/695By for details.
>
> Setting the weak default value to the empty string actually imposes no
> limit on the image size per default.
>
> Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
> ---
>  meta/conf/bitbake.conf | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8b607088c6..0a9e27a27f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -866,6 +866,10 @@ MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
>  # and no effect if less than it.
>  IMAGE_ROOTFS_SIZE ??= "65536"
>
> +# The maximum size in Kbytes for the generated image.
> +# Per default no limit is imposed.
> +IMAGE_ROOTFS_MAXSIZE ??= ""
> +
>  # Forcefully set CACHE now so future changes to things like
>  # MACHINE don't change the path to the cache
>  CACHE := "${CACHE}"
> --
> 2.48.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210931): https://lists.openembedded.org/g/openembedded-core/message/210931
> Mute This Topic: https://lists.openembedded.org/mt/111030916/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


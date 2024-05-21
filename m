Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34520C41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:17:44 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.17184.1716290263243243208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fSM0Kn1+;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52327368e59so5917345e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716290261; x=1716895061; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NdZxDPB/jqpStywRiHpSvKK+zzwBjEwj8skk1rc+Vcg=;
        b=fSM0Kn1+rK6316xRFWRXTkeLT+xhKwfSF20TA+sl0FgqbDNVrWvqfQDWLOJczNapEA
         NhGqYfXt3/qpoEhnyEKEYp7tHRjojtQklfzJJJ/duDghKO9v+1sJsGApZ75uNDx/4mpf
         +B+8O3BmJ3zJuKVeIqkYVPx/nwZhQiXXcU/BWKJuq12SbVqVcCpTU7mT2MzFdDyru82p
         kFAh7VWMq/aKilrzVy2w2M+ceHnmmTKJvWdEOHJmGGKTNAP+Q3ZpHExoVLV76iJK+1Fj
         IF6iO/B4ATCQzch+O8bR1UszgPIiDglckLWOsgtJmZi8majOmUIBOyJ14Qw2Hgyu57i4
         cZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290261; x=1716895061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdZxDPB/jqpStywRiHpSvKK+zzwBjEwj8skk1rc+Vcg=;
        b=oa3fBsX1njBCM1XjdsMEQe/2B7siXMlMGKmzciCgPkcKRftr9qrn82nKt45xkm/uyY
         31cB1HFYoRmSiEvjKYIPFDEDvVu4VBMxhn7N8D4NdygksVq7rJDI1QNU2MVhYyxUcICu
         QaV1wlEE+9Feo4gn0w0r5LhU3qV3RkHdAyl0XbZ3JKhsey8ftU9Pa5piXvKDX5SyXt42
         vvyhQ5Hb203OyOUmNWISd/hx/R6zsVfi56sJy7Rrihjjkh6fupe1XJGbRZBQONG33GWt
         0R6txFJQp9fI+4HBfg40O699lR3JKQ4rBK0OesZX8rTDbz+T0pxBC7yHEA6wmADW5TGx
         QtKQ==
X-Gm-Message-State: AOJu0YxQDouTXYvmvs+hfmasvFvUSB1Qc2HkYJKokCpYtaUHUERnXpdU
	d8Ek6xs249oiRLV1fQzSWiW/uBXSgmorNqIHfI30stGcWzx3tdb9hB0fsma9U6B/6su9xbD/12G
	dVOnNwxCHbwwD6rasrMaiHSa8BH0=
X-Google-Smtp-Source: AGHT+IFblBM0wdiTF05JYDidMcn5PIasKjpoMxDgUOOF1gnLT0QBHhwbQeQodsEkJkkGLiIz8VqcV00oYpq1e2OpViM=
X-Received: by 2002:ac2:5bc6:0:b0:51b:9254:91e2 with SMTP id
 2adb3069b0e04-522100749bbmr16770940e87.55.1716290261117; Tue, 21 May 2024
 04:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240520153106.150218-1-igor.opaniuk@foundries.io>
In-Reply-To: <20240520153106.150218-1-igor.opaniuk@foundries.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2024 13:17:29 +0200
Message-ID: <CANNYZj8TiMHaZ3OjaBYvuyVW4g8HGsRAy=kb=LBvWaaAPPjbTQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/1] initramfs-framework: support force
 reboot if fatal error occurs
To: igor.opaniuk@foundries.io
Cc: openembedded-core@lists.openembedded.org, jorge@foundries.io, 
	jose.quaresma@foundries.io
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199618

Seems ok to me, you can resend without the RFC.

Alex

On Mon, 20 May 2024 at 17:31, Igor Opaniuk via lists.openembedded.org
<igor.opaniuk=foundries.io@lists.openembedded.org> wrote:
>
> Add support for force reboot in the case of fatal error. In some cases
> it's better to force reboot (especially when hw watchdog is not
> engaged) instead of waiting for 3600 seconds, for example in order to
> trigger some recovery procedure during next boot procedure
> (after unsuccessful OTA update etc).
>
> ALso fix indendation issues in the fatal() function implementation.
>
> Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
> ---
>  .../initrdscripts/initramfs-framework/init    | 23 +++++++++++--------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
> index 567694aff7..e3d8caa0e1 100755
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/init
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
> @@ -54,17 +54,20 @@ debug() {
>  }
>
>  # Prints a message and start a endless loop
> +# Force reboot if init_fatal_reboot bootparam is set
>  fatal() {
> -    echo $1 >/dev/console
> -    echo >/dev/console
> -
> -    if [ -n "$bootparam_init_fatal_sh" ]; then
> -        sh
> -    else
> -       while [ "true" ]; do
> -               sleep 3600
> -       done
> -    fi
> +       echo $1 >/dev/console
> +       echo >/dev/console
> +
> +       if [ -n "$bootparam_init_fatal_reboot" ]; then
> +               reboot -f
> +       elif [ -n "$bootparam_init_fatal_sh" ]; then
> +               sh
> +       else
> +               while [ "true" ]; do
> +                       sleep 3600
> +               done
> +       fi
>  }
>
>  # Variables shared amoung modules
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199595): https://lists.openembedded.org/g/openembedded-core/message/199595
> Mute This Topic: https://lists.openembedded.org/mt/106205536/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


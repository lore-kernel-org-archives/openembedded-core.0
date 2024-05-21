Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0C4C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 15:55:26 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.23410.1716306923311545240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 08:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=dEhkLhhf;
 spf=pass (domain: foundries.io, ip: 209.85.210.53, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6f10092c8c7so2754927a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1716306922; x=1716911722; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=223zD8CfzipdZUuv0rjj2B30t6NorKPj15DOnG4RnC4=;
        b=dEhkLhhf+FZW7ayg3t+iB/UPlsQTHXSEzQtI0/wWyGBhNrUyubAe4wbe0GHIWtXaXS
         RpJRVD8s9w/CyyqZ2/epXv0gnZlUSavCdmb1c/KQgSyagTH9mxLQkxYb+SMvg//AHgOb
         SHQZlZcRiYmYcSjBxdkRYwWW91XmI7h8BmR9WSQP52AsrIiCQgA7ep8HOkcalYBmReY4
         Ktprkl2banvvNvDPuOw+dDYCLR+No2IVYmdgJgN6DrY+tpbrtM+DZx4yZZ+kARCO1xjV
         Kd9+t3V/wfrIomDmBDC44bcIrUtQ8fa3hMR1vmuzCw3+R6Pbcl7jO+vdJVXZjNnAUEdp
         QnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716306922; x=1716911722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=223zD8CfzipdZUuv0rjj2B30t6NorKPj15DOnG4RnC4=;
        b=geS7SU55ZEOgh7JproEwR3tsniw/woQi5czGeteTwH7GRLMSUXS01mworVIo+MS72V
         t3k20eMH1Bgz5T0nTrXIUpf3fjfghFfDphVJSIeras18rGhoixdISXrOfHhX29n2MBaf
         8tQ4/CtvfH3HJVjZr/0Qm7g/Xg4oBdqiCFKLQ7SwZ51rxKbUMxMcC8T5BpHjpltbeMIS
         9x8Bg1/4USXzTArFx1iKsF17ceRGXhVccdh4owZlNzNCiDnPVVigHug1Fdy9MIdPdFC+
         iOoRo6DG5HhC9+uIoOmeRrP1HfMTc7Xu9M/PqQai1vU+M96x0MZV+MYBISGsei15LlVg
         S64w==
X-Gm-Message-State: AOJu0Ywbxkj/DCdqJhtkEE7DrqtrcessqRqoE56XxSR8H6F9ikg3NzNR
	BE/dhYPVC0pWcJDe9YbEEPVHDK40PE97eycr2R6FhxTRVuK6PDkmE4nwTc3arhRz4xiZMn7zddY
	LwJT12Zau+BaySPtDaqDpBPw5JD1OTWJRGHHLzw==
X-Google-Smtp-Source: AGHT+IFK+SV+B12aUiWB88n+Qm0dDsbnzKC2jN7rEnRiL5uA89t5TDAKggfgK8oKI2nDO3C6P4cTrXWrgJw550bA+wM=
X-Received: by 2002:a05:6830:44f:b0:6f0:e64d:727e with SMTP id
 46e09a7af769-6f0e92b7621mr44408916a34.31.1716306922644; Tue, 21 May 2024
 08:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <17D1855D8B94E58B.4453@lists.openembedded.org>
In-Reply-To: <17D1855D8B94E58B.4453@lists.openembedded.org>
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Tue, 21 May 2024 17:55:08 +0200
Message-ID: <CAL6CDMEY0csmwW8FeS_kyNLV4oA0QgicmfsVADOcxe9KEKStwg@mail.gmail.com>
Subject: Re: [OE-core] [RESEND][PATCH v2 1/1] initramfs-framework: support
 force reboot if fatal error occurs
To: igor.opaniuk@foundries.io
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com, 
	jorge@foundries.io, jose.quaresma@foundries.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 15:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199655

On Tue, May 21, 2024 at 4:28=E2=80=AFPM Igor Opaniuk via
lists.openembedded.org
<igor.opaniuk=3Dfoundries.io@lists.openembedded.org> wrote:
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
>
> Changes in v2:
> - Drop RFC tag as requested by Alexander Kanavin
>
>  .../initrdscripts/initramfs-framework/init    | 23 +++++++++++--------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/m=
eta/recipes-core/initrdscripts/initramfs-framework/init
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199641): https://lists.openembedded.org/g/openembedde=
d-core/message/199641
> Mute This Topic: https://lists.openembedded.org/mt/106223321/6685241
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ig=
or.opaniuk@foundries.io]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
FYI, this patch (with [RESEND] tag) is identical to the previous one
sent 2 mins before, but
with Alexander Kanavin in CC (sorry, forgot to update CC list).

--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk
Senior Software Engineer, Embedded & Security
E: igor.opaniuk@foundries.io
W: www.foundries.io


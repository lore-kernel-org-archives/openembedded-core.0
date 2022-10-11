Return-Path: <liambeguin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DB2C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 21:54:03 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.13571.1665525234428594486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 14:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XNYzIphP;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: liambeguin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id f8so1997268qkg.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MZNGuTbPYo7HHsczl+u/oit9IYJpUfhLDnv0mNYvIlM=;
        b=XNYzIphPQ7vwTj//3bE1PX5TwZhpjj2eW2D+ANMqD8RxNfiaWFITf33luQtI7aOfJH
         CNKxEULJUVn7IYjQdEJMMF9YWb3rwQex42GNwckAjd9TfyWJcNcAQij593bt6y38S6QD
         I+/3QRXdddpB+gS7Ndgp0It6YDS+Ui6qAYqkuSqaMyYM+OcSIU6/i2fwkF+cOjBqaMVH
         WpVZ57ZwgjamMeSGFPJrM7nSS1Aqzm6hcx4mX+ZjhD5lPoGGu5e2pBoONcEbNWG4YMHR
         sAJamaXLY9Log4CmrWYwwTyz4DXDDir2hMRqqTIc4UdlrYZGMy0nee7gNRb3so32/POx
         X03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZNGuTbPYo7HHsczl+u/oit9IYJpUfhLDnv0mNYvIlM=;
        b=0y4yMWCQl8nlDEJ4QvVt7MIqFNhnQV9oIUvPpAEZSC3iUqgHWyZT+YH4j45dTbesUE
         ptt6q+z6JXzWmZRL+puvkHghqkRZcfqJYb49Acqh0LU+P7AKNmxOpvqDSCqavNBZWvRs
         Khn3813f+CjFNuxEtpvlAh1RziURBQ/1+CAA0wqXu95zwOIoe8ikxDw1Ik1CT9L5vlKG
         dMf8qFyslJq9v8IbEByZF0IFIzJkfbZqefFfqB8+V0Wuich0KcuHDIyPlDb+eKyuZXiC
         sN82Jq9IkEVCjv8m2vEbjdIN2eydlQoGfALimx63FxVDh9oOE5GdQ51BuKDzOIiSSjnY
         n7Gw==
X-Gm-Message-State: ACrzQf3NmHtM+QGvwBzmBI2ycMq6mBB8Bl1oeyHyRMV2IZjtLROaduX1
	HbUuK0VxBcwQwLtp7YnM7dVvLBZJIO4=
X-Google-Smtp-Source: AMsMyM4P4MlhDeGEHFEfks1Q2Ip+UD5xccWxgx4HTdZjLmet8ammVN1td+IJ5Y+eUfkBNQg3U4W6Hg==
X-Received: by 2002:a05:620a:4388:b0:6ee:8796:e390 with SMTP id a8-20020a05620a438800b006ee8796e390mr2835139qkp.289.1665525233230;
        Tue, 11 Oct 2022 14:53:53 -0700 (PDT)
Received: from shaak (modemcable055.92-163-184.mc.videotron.ca. [184.163.92.55])
        by smtp.gmail.com with ESMTPSA id y9-20020a37f609000000b006cea2984c9bsm4738496qkj.100.2022.10.11.14.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 14:53:52 -0700 (PDT)
Date: Tue, 11 Oct 2022 17:53:51 -0400
From: Liam Beguin <liambeguin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, peter.kjellerstedt@axis.com
Subject: Re: [PATCH v3] meson: make wrapper options sub-command specific
Message-ID: <Y0Xl75mvvCkli/9d@shaak>
References: <20220929025056.2799287-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929025056.2799287-1-liambeguin@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 21:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171643

Hi,

On Wed, Sep 28, 2022 at 10:50:56PM -0400, Liam Beguin wrote:
> The meson-wrapper adds setup options to facilitate cross-compilation.
> The current options are exclusive to the setup sub-command and might
> cause issues with other sub-commands.
> 
> Update the wrapper to make options sub-command specific.
> 
> Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> ---
>  .../meson/meson/meson-wrapper                 | 21 +++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)

Any comments on this patch?

Cheers,
Liam

> diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
> index c62007f5077e..fca64a569299 100755
> --- a/meta/recipes-devtools/meson/meson/meson-wrapper
> +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> @@ -5,7 +5,7 @@ if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
>  fi
>  
>  if [ -z "$SSL_CERT_DIR" ]; then
> -    export SSL_CERT_DIR="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/"
> +    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/etc/ssl/certs/"
>  fi
>  
>  # If these are set to a cross-compile path, meson will get confused and try to
> @@ -13,7 +13,20 @@ fi
>  # config is already in meson.cross.
>  unset CC CXX CPP LD AR NM STRIP
>  
> +for arg in "$@"; do
> +    case "$arg" in
> +    -*) continue ;;
> +    *) SUBCMD="$arg"; break ;;
> +    esac
> +done
> +
> +if [ "$SUBCMD" = "setup" ] || [ -d "$SUBCMD" ]; then
> +    MESON_SUB_OPTS=" \
> +        --cross-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> +        --native-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.native" \
> +        "
> +fi
> +
>  exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
> -     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> -     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
> -     "$@"
> +    "$@" \
> +    $MESON_SUB_OPTS
> 
> base-commit: a2659cc2bf5d3f1cedf5c52c3b45e0427d40732d
> -- 
> 2.37.1.223.g6a475b71f8c4
> 


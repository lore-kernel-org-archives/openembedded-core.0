Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.472.1605907307585736986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 13:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gBGisWe8;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id h185so5792067vsc.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 13:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TqAszbljV9LdXtG7BMgy+3bYpT2zfZRTa74kFwmwamo=;
        b=gBGisWe8WwOuVtDPH3+vJNMTiIr1rC2441QPQvML5d6R3xYXWBOqObFnthdPd0fAwD
         bKZPd+MZMkkfv4HxhZzLxDaFiUOE0Vb2nVepdQRfvClHKxeRyHQ/Qv0MLkJHAo2b+lmJ
         NySa7eWFF8iO6lfqOhIZm9X8rTdBdeZQch7rNGxHuUbAzJWl/fS4eEhB/GlRowYb45UN
         ANCJnKr2sLdH3vOu4cJnet9oRo3oB8EkSAaF8h4L/KApKfqkimlW1uEyfdCuMU2WFKw9
         pwy56PcZcMMleX4KulS2sWDuLswOMpLDYT+ChHq9kUXosFmleATHDVJFkh7fKORY0GF1
         8ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TqAszbljV9LdXtG7BMgy+3bYpT2zfZRTa74kFwmwamo=;
        b=U9NALwcr0qto+63RUjVsjC/4Q95tBw3xqs1bYTeAfY3CIz7a9IvTxSyzP47mdF3Q80
         FlsqGWmMlogH617/c7NT2IWl+p4A+WSZVc6Twp3T8NRDpmQuXtjL/f902T3ju1/huOHP
         z9WrgQogSY4ljwiMIVU/3+Hu01XxUhuhomhb70HwaZ4qdwkoxyoslsDdmnNVilq2A13t
         PUYQ5oMy99EJxqvy9166EpKTseI2p6G6hHLFY5YJtvFxx3aW6QUAJgCjt9KxXGpcdfFy
         d0EwcbRaRaVZ7jdANuzb9Uj74Wqt3w1mD9hhiJoMpEq4GOCWw4MUqQRZLKb+agad+p0H
         6Gsw==
X-Gm-Message-State: AOAM532uAAqDnpxWbDJbYivtMDQlWYzfXTyDf2OPBPhWK+Z9TjKCd0J7
	H1pSvU376LqxOxHdTdpmbt/2RrsZQqhyKk65XhA=
X-Google-Smtp-Source: ABdhPJz3KgXHcHpd6hoxEQ6Q6xgsqQR+OiCQhYjXl0MKRjcLaaFbP8EetoEDfSzCuuxGm33qLEjYR/ADf+DPIecva9s=
X-Received: by 2002:a05:6102:38c:: with SMTP id m12mr14387433vsq.18.1605907306369;
 Fri, 20 Nov 2020 13:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20201120173630.1296722-1-otavio@ossystems.com.br> <20201120173630.1296722-2-otavio@ossystems.com.br>
In-Reply-To: <20201120173630.1296722-2-otavio@ossystems.com.br>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 20 Nov 2020 13:21:37 -0800
Message-ID: <CAJ86T=W1EYUXGPVpk6LMSiraUthAa3ye3_-w8LJoaKGMB_nECw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-base: Use bb.utils.filter to reduce code
To: Otavio Salvador <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2020 at 9:36 AM Otavio Salvador
<otavio.salvador@gmail.com> wrote:
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  .../gstreamer/gstreamer1.0-plugins-base_1.18.1.bb          | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
> index 8813b8faca..43d51552f1 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
> @@ -64,12 +64,7 @@ PACKAGECONFIG[wayland]      = ",,wayland-native wayland wayland-protocols libdrm
>  PACKAGECONFIG[dispmanx]     = ",,virtual/libomxil"
>  PACKAGECONFIG[viv-fb]       = ",,virtual/libgles2 virtual/libg2d"
>
> -OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', ' x11', '', d)}"
> -OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gbm', ' gbm', '', d)}"
> -OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'wayland', ' wayland', '', d)}"
> -OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'dispmanx', ' dispmanx', '', d)}"
> -OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'egl', ' egl', '', d)}"
> -OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'viv-fb', ' viv-fb', '', d)}"
> +OPENGL_WINSYS_append = "${@bb.utils.filter('PACKAGECONFIG', 'x11 gbm wayland dispmanx egl viv-fb', d)}"

This drops the first leading space so isn't exactly equivalent.

>  EXTRA_OEMESON += " \
>      -Ddoc=disabled \
> --
> 2.29.2
>
>
> 
>

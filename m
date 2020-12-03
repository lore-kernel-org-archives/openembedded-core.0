Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.1528.1607022086839167948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IV0TC9vn;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id 7so2167942qtp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=77gaKKAk9andO+tTVuou1oaBCinef4F9lT4tCMY88Uw=;
        b=IV0TC9vnI+cplM81ajz2Jr7TdredGPXPVcpiyBLVQHFLDb1Kz0LlFxwkV+OgV4ItpS
         2XRIFPm6h9Z73FWad1v3doI6TigHtOnglodBTbS4sFg6sEcefcRd5wTxS/UzTYu8BLWp
         M/n+VJotk9NCmaqNl4CNbbBpmdHsE9iDw88gzlnh6wc0XD0Vw31w8eOjYv34HMRSLgdQ
         GhekBUvIHD8f/Zm8YGK68wVFcLaos6a4cakJf8x69bFdS/HhT/IydOqDzm71D9zSc1/J
         H2L0dma1BHYVDTMOxjiHhtysBm20yedQ5BJyg8MXpy1Xh5b4SsYsMyaVVxTeQYxNsNdI
         dqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=77gaKKAk9andO+tTVuou1oaBCinef4F9lT4tCMY88Uw=;
        b=VnLq40sDjKdYLCrgUaAEuSd9VElFJ2GgE/ess5veEcGTgvquk+0UAGSarKjvPbw4p1
         GpHoHqhU8Lo5IrMJ118gA9EmRZGPAkzCjhLiVOx6VFn/80E7t7Bw/55Ln307dps+wORV
         8dAoKMb9AxGmoyGOFT6RuakjNNFaFZDqRbE22iMats9kRf+9Pr0H74GRVyFcWrItcQBi
         6VxjnTuYy+6PdiqMG0KMcAWI6JgM73dNSLc/gC1honWPJAW9+A8VQeLmABJN84cSM5/Z
         iEP5ixVL/ojaMKLn2nOpzL01XrLPiFNy8yJ3T1a5/SdzyLRkZQYao0tpExj/VuqJ2SZN
         pD9A==
X-Gm-Message-State: AOAM531DagjlEk3k3TBphOxnIt2jjYFaHqCPRFHRvdQlqbb1XZyX2Rhn
	g63ZcAVZpbvv2bpHChjM6G/+6RIOVYsg3WHVp90=
X-Google-Smtp-Source: ABdhPJz1izq9NNdkE8TGfI5yIyXkKDc4XLgy/wUHGuS+GKjodT9LnGP/srIoRwKu6dw2buarQ/qY55pH9n9FJddRFVY=
X-Received: by 2002:ac8:2ff6:: with SMTP id m51mr4837747qta.194.1607022085928;
 Thu, 03 Dec 2020 11:01:25 -0800 (PST)
MIME-Version: 1.0
References: <20201203133526.2075-1-twoerner@gmail.com>
In-Reply-To: <20201203133526.2075-1-twoerner@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 11:00:59 -0800
Message-ID: <CAMKF1sqDGwjkour8X=F9YPmFNY=nyPvFb8q8O9YvVxQGMsJK_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa.inc: add dispmanx support
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 5:35 AM Trevor Woerner <twoerner@gmail.com> wrote:
>
> On the RaspberryPi it is possible to run gles2 applications on top of dispmanx
> without the need for x11/wayland/etc.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index a6652b0ddb..34cb3c35e2 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -51,7 +51,7 @@ inherit meson pkgconfig python3native gettext features_check
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
> +ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan dispmanx"
>

dispmanx is only supported by userland graphics and we do have a
machine feature knob for that
this addition seems not common enough to warrant inclusion in OE-Core.
I would suggest to keep it
in meta-raspberrypi via a bbappend using the machine feature check.

>  PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
>                 ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)} \
> --
> 2.28.0.497.g54e85e7af1
>
>
> 
>

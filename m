Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web08.41162.1606161296266824236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 11:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LqHzUewM;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id r5so9796661vsp.7
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 11:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GnEjl3/nXD6Bd7sQPuzhI4ghyrwk/MQqVieV7DChqGA=;
        b=LqHzUewM9GcGUNEcvwKsLyVRUWBWmgLHyy0mWO29pjdKHU3X+ZLmOg096NeIbTNInc
         lFsQN4+/bXVg7qcY4UhajKaZo+lhd5lTilnqjQxn4suCq88teVUjMiD1jmUeiWkXmCgU
         LaJLxegMi0fR510vmBjI+pkkOLiR883Hh+IEmbWRqXVa29xxWlOE0hE6mMQNoCChGJf8
         63DI5T/G2MZaKCrhBHgrVtRefm4hSKM0eVPTptk8IOHoAAxWoCFIxWltGJYpiz3FPtd7
         i9J5RoKmuS/EL9AtGEGSh8gC/V34kSpwtMCvIgewE6sNgd2QHxSVyI7tdEW2o7P0uSfh
         GpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GnEjl3/nXD6Bd7sQPuzhI4ghyrwk/MQqVieV7DChqGA=;
        b=KAaN4UNq96W9nnPZyAybMBA1aowA4ie6QeE8H0rni5/lP+g1d0X+AsV2/b52KBFVGz
         I3CsJqUo6/fWsIbzGMvX/wg1Iqe8cePELglMfgWh9Rk0tT+a5HHPgYxj+NAzn0/vgbV5
         dxvyL3h7VPayww8W2R/1A+lCSzOyJPt3C0eCE7pP83omRCGpvD5XJ+i4bQWLHjo5RRWG
         7EzUP+DlFnlu64+QsTw9KhKcg4YihAJ4s1J6RfaZCN1jJl2+1lVEr/orW3XDBvMus5ku
         w9msQz0wbAwDS0qauEz3PapACGshDy2DO6zeOwRyoa4oevNuoTnJmXUBKItIetqZR3uE
         1yVg==
X-Gm-Message-State: AOAM531fslhSEdbdPDxTxofhRzfQ5iWZaNKpJwAsZFlseCvTuqcbEw4p
	3CRxxUfd6z3VSJ6MuOe6b9cFagWtjUpvlO90/P4=
X-Google-Smtp-Source: ABdhPJx4C6Tyyc2D+5Edy9gDIB+11oTTC1tzHrUqYHcDcQWR+BuSXJv8DEV5m3M5g8p5abEwlTeFvngHpIkEgYZKWM8=
X-Received: by 2002:a67:2d84:: with SMTP id t126mr1502814vst.0.1606161295392;
 Mon, 23 Nov 2020 11:54:55 -0800 (PST)
MIME-Version: 1.0
References: <20201123191349.7503-1-toertel@gmail.com>
In-Reply-To: <20201123191349.7503-1-toertel@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 23 Nov 2020 11:54:48 -0800
Message-ID: <CAJ86T=URx1WJ9=+7-pQ+iUoTi5yT4jJaPdct0zOqa0gYFTF8Mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: Add directfb to PACKAGECONFIG rdepends
To: Mark Jonas <toertel@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 11:14 AM Mark Jonas <toertel@gmail.com> wrote:
>
> When building libsdl2 with PACKAGECONFIG[directfb] then directfb is
> added to the DEPENDS. But the automatically generated runtime
> dependencies do not add the directfb package to the runtime
> dependencies. Most likely this happens because libsdl2 does not link
> against directfb but uses dlopen() or similar. Thus, the runtime
> dependency to directfb needs to be declared explicitly.
>
> Here, a runtime recommendation is used to allow ignoring the runtime
> dependency using NO_RECOMMENDATIONS.

Why would anyone want to ignore the runtime dependency?

> Signed-off-by: Mark Jonas <toertel@gmail.com>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> index 2ef7d2e5ef..ae42db2610 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> @@ -58,7 +58,7 @@ PACKAGECONFIG ??= " \
>  "
>  PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
>  PACKAGECONFIG[arm-neon]   = "--enable-arm-neon,--disable-arm-neon"
> -PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb"
> +PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb,,directfb"
>  PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
>  PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
>  PACKAGECONFIG[kmsdrm]     = "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
> --
> 2.25.1
>
>
> 
>

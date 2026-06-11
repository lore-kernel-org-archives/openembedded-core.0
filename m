Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDA6CD98CF
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:07:46 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43981.1781180216989709991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 05:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redhat.com header.s=google header.b=E8hbciCt;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: marcandre.lureau@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-69e1eba21a6so5207767eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 05:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781180216; cv=none;
        d=google.com; s=arc-20240605;
        b=Pcf+K9iPk2pqv04mf0qIH9Y8KlW627ohvw02uK4N+lipTwPypSoDED+LQVa2bDW9uY
         GedGmddaiLRtmeLdxovF27cSZRiH02qCbaad+HrOb7LHDfs/6d/Je1DFviiLJicCEbZ+
         lMpfVL7fnbRcDFMixSnrO8urLkjcHGY7/QjGzFC5yz+D34n4HLJA6jJ8744v0fSKlXz+
         Aev+rrhK1YdtXgTY6UuCYs4Ii+Rql5V2l6fhAF2V18mqBhmPTzZGWlHScjNLsMNGm1+y
         VSnIpq73t18xdHEod2HLulPR2Fjn+AB14OVWQYJmzVzahxV0wVvVH3Flzecl44e0Nq99
         9cLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yEHPNMUtuJVFhsfZw0PGpQB8RdCznX2EEXKGdRKxTP4=;
        fh=SUz4NKTadQ2LvGEoqR5vpU8C8oVKOx2bx6ua0+8Dj8E=;
        b=Z5drsSeDFSLj+yJxxDyyKSpEDjuQiBqecfJjSmreM/6Dm7xHevsnAfYaRsPEyKeX88
         r7ZurykEUpmMnImKfLM3eApLy2AjTVvkjr4h2FBeshU8ahmpc3g3VeQdJpY17o52G1L6
         +OtCA3XaKAy95XToT1O3b8sgmcML2Z4zpZ3bXcIrJu+Y5NaXhK0NG1UV9JODH81DfDcW
         nXON3KPs1bXJg/kew3kLdswsSV9qufAsEn/SRLVT+OjCrSyrMnzVqH3qQOmimhs09SWb
         O19dPEK10dOMbf1pJYZB2np8q7VgYViXj9KXrV5MZVbkDNyYaYnOgKrXaFp+JPSeihEG
         mbVg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781180216; x=1781785016; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEHPNMUtuJVFhsfZw0PGpQB8RdCznX2EEXKGdRKxTP4=;
        b=E8hbciCtW4LV5B3P87pq89tHBXw3OtVBD9j1wG5IHxTeN7Q87X7ATFUhmMJaQSEsLY
         XQlb3i0Cb+ETvN+24vYHOF8Rb+oPmEQjP9vtnUWyFqnOe0MsunhWV6O4gVuYj0jSl5Mj
         lT77APQ2qSjWi/SKVTwJWWWZIQYspE+AVuEc/AXkkBqbnSbBbKeCFIGTA7kPKpqF5xZu
         WXm6P21LcQ3a8YQq3luVaWIZl0PkaNoDjSWwxGR4Ugp0vo4O2YwpV4hTg1vIj5owyBl/
         ua/31lzQpuLCjzwwp2DytcXLquOQRBJEjcPJDEgbljdENUmpmiiaJTTy7f+Ob+GAv7D2
         WKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180216; x=1781785016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yEHPNMUtuJVFhsfZw0PGpQB8RdCznX2EEXKGdRKxTP4=;
        b=Mjj5WLrvddsVr2X+pvrce0OUG7IsXn1uLlULqLVw3H0RyB/WJYMEMcKLlLYT2CaKmf
         RsvMCtgg3Yd/eiSU6+/rnrPc1OjUhRmeGMyfOcOLXPQyxXzPgLUwjKWHzQALPtswoK5Y
         NkNDpQmoRZ+BbrSmHR6XtN84/XYgKO+aVgFITFOyXSfOmszK8mceN4XqzP+So1yGtD29
         gHV6qPpKSRqyISxkw2E/gaAzXKuDdQR999uiZXbGUqYfOiZS5sN8GvNkZq6kiZxZrmFe
         aBRMLTml5+1k02t25YJ09XCXBoI3l3ZTQ+2TnVO1KcZUqB9Ax89bnlS9tpE41FcaX/vV
         UYAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SWQWOxwR38pvfsXd+5LunFQ0CrbkpM/CjCeyL6efRRS1XsIwMUzIPohQ4ET25YV92k2A5tJKLSz0oLgxCgB1GHg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6X7Oo7rHDq7zaaSS9cBRHldbfh6GEu7S5u9Gkr9K3Rf6IaitS
	wQxUpvfZGuroAUDnCcmF+7uqW+3PUFJtVzVWrlF2QStDx91Ulit7Pgt0vIYolo0QfKtf2g1AitB
	0w43fc287wB4TUMnmkr3M8Hhe5zUgfnebRcigzYg=
X-Gm-Gg: Acq92OFji9klyywlNhJpJse67KAxqY1oniaPPf3J4r0SPDNhFkS/m/Uw3oEJKFwCRQq
	jMuGs24T5VYQsSfl2l6KjexXERLGaRg7ozsvg2ZRgaiUOVkbz2tsR5EBNr0+0GJenahzFMMeI2N
	5MRMwFad7Yp3KVK35poZZjfGYzVpACpCljTBDVKzOy/l7O+X4w7uMoHgT9IZGCDKo+uReMnbTmA
	RpJ1B6eV/RFgvSzsYAlwaBZWWQ3y2pKK7nnQ4ifeNZ/F+j5cqDlj41/uvGGMNJ1fWsSVggunkxm
	g+NaOw/qWDoPb7gzvxSlknqyD0O5WowiWvsCMoVH30sj6yMohw==
X-Received: by 2002:a05:7300:3b07:b0:2c8:6361:ab2e with SMTP id
 5a478bee46e88-3080464d07bmr2042695eec.8.1781179837103; Thu, 11 Jun 2026
 05:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-sdl-v1-1-93d4a51684bb@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260611-sdl-v1-1-93d4a51684bb@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 11 Jun 2026 16:10:24 +0400
X-Gm-Features: AVVi8CeKktUtG17zkQ_sDczcJ1uN6ZntoJuZlpWgGNef4bldB48X-Fg4-i4orcc
Message-ID: <CAJ+F1CKF+89hT57ekdhQutecCteH4Z1Sbd16Hgwj+0Q26Sfqpw@mail.gmail.com>
Subject: Re: [PATCH] ui/sdl2: Explicitly specify EGL platform
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Alexander Kanavin <alex.kanavin@gmail.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Quan.Sun@windriver.com, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238450

On Thu, Jun 11, 2026 at 4:00=E2=80=AFPM Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> Mesa's eglGetDisplay() chooses the native EGL platform from
> EGL_PLATFORM, limited autodetection, or the build-time default. If that
> selects Wayland while SDL is using the X11 video backend, Mesa can treat
> the X11 Display pointer as a wl_display and crash during eglInitialize().
>
> Probe EGL with the X11 platform explicitly before enabling
> SDL_HINT_VIDEO_X11_FORCE_EGL.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3540
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
> Resolving the issue described in the GitLab work item also requires:
> https://github.com/libsdl-org/SDL/pull/15806
> ---
>  include/ui/egl-helpers.h | 5 +++++
>  ui/egl-helpers.c         | 4 ++--
>  ui/sdl2.c                | 3 ++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
> index acf993fcf52f..c97a0d5c248f 100644
> --- a/include/ui/egl-helpers.h
> +++ b/include/ui/egl-helpers.h
> @@ -61,6 +61,11 @@ void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf);
>
>  EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, EGLNativeWindowTyp=
e win);
>
> +#if defined(CONFIG_X11) || defined(CONFIG_GBM) || defined(WIN32)
> +EGLDisplay qemu_egl_get_display(EGLNativeDisplayType native,
> +                                EGLenum platform);
> +#endif
> +
>  #if defined(CONFIG_X11) || defined(CONFIG_GBM)
>
>  int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, DisplayGLMode mode);
> diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
> index e3f2872cc14b..069a52495541 100644
> --- a/ui/egl-helpers.c
> +++ b/ui/egl-helpers.c
> @@ -520,8 +520,8 @@ EGLSurface qemu_egl_init_surface_x11(EGLContext ectx,=
 EGLNativeWindowType win)
>   * platform extensions (EGL_KHR_platform_gbm and friends) yet it doesn't=
 seem
>   * like mesa will be able to advertise these (even though it can do EGL =
1.5).
>   */
> -static EGLDisplay qemu_egl_get_display(EGLNativeDisplayType native,
> -                                       EGLenum platform)
> +EGLDisplay qemu_egl_get_display(EGLNativeDisplayType native,
> +                                EGLenum platform)
>  {
>      EGLDisplay dpy =3D EGL_NO_DISPLAY;
>
> diff --git a/ui/sdl2.c b/ui/sdl2.c
> index 4fcdbd79d3c0..ce14bd1f4e15 100644
> --- a/ui/sdl2.c
> +++ b/ui/sdl2.c
> @@ -862,7 +862,8 @@ static void sdl2_set_hint_x11_force_egl(void)
>      }
>
>      /* Prefer EGL over GLX to get dma-buf support. */
> -    egl_display =3D eglGetDisplay((EGLNativeDisplayType)x_disp);
> +    egl_display =3D qemu_egl_get_display((EGLNativeDisplayType)x_disp,
> +                                       EGL_PLATFORM_X11_KHR);
>
>      if (egl_display !=3D EGL_NO_DISPLAY) {
>          /*
>
> ---
> base-commit: 2db91528542672cf0db78b3f2cc0e22b36302b38
> change-id: 20260611-sdl-a148cd469727
>
> Best regards,
> --
> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>
>


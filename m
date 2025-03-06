Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A5FC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 11:14:22 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.10506.1741259655917236259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 03:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LS0bDYGa;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e6c082eac0so4767066d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 03:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741259655; x=1741864455; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=108M9RZXPbk5qmDuDKwDr92yCZ22PnLLUxbKQISHwoo=;
        b=LS0bDYGaQFH48aC6B77aKagCVYhlXN7aaiN0EKDTOhyRwpNebewz8pSi4hgR8JfHgU
         5QxyMXEqGRIpsRExKaNR3Xc+2TuNUDsjAwemihqV77zITwJsjIzxqDj4jK4MivYQy+gw
         Hb1Wa3c0AIqrIlIs6OsiWyUW13F1spThUjovnWXV7/Nf5Cv6mGSBKw3ZdkAJgWgxhcN4
         Rz+sahda7AuU0iSn9lMLOh23gNy52oYucuvLHm+JIB0urp1CRqBiVWyumlupdsrKHIEj
         9auLOZgHs6n6Ccfdd05GuqgWpA+v2l7YL0BlrWTu++hCOOyQTKoJJ/tHm3o51WDcXVCd
         tXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259655; x=1741864455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=108M9RZXPbk5qmDuDKwDr92yCZ22PnLLUxbKQISHwoo=;
        b=hzo3DjkwvIMYxOdjTqxZwd/kWhA6u+IXAxXXjzpP7HTG+ODvCpzPFC026Dyq3EHeyH
         rk4pg7uZmPxIi/1QKStriuXc7/EXM6Uk3bd47hvyK/IMeOy5lR3XO/er/YCo+3SbXsoE
         WT70Acz/xnsGDHj0KTUsVcn88pOVaqEoSAMaVIJgcHi6ZzvWRhwVSZlM+4DxNY0qlAdZ
         RV1GaudNrph1VRZ9BD2v2XE2dkRa2D1OHRaNR6CDP4hwkf2+NwUwOheBq6CC+ff/ShXE
         fzOhJW9/BWjyxdsfDD2yP9z+7q7P8c9JfY6HvPq2ZeJwwK8m8LZ2gQra9YMi18S9o+Rh
         brHA==
X-Gm-Message-State: AOJu0Ywng94TAF9Mxxea3SyQ3ODVnKyU5dglxZ933DsWPpPetaodt70v
	VXv8vAhKCFMWL0vquJCyzT1xlrfGzccP5apmhIPD+12l1xdhi2FzoAV/fXZhMxZ22YBqxmHjp7O
	Foae65DIYFdCohjn6t/27jgW51Jk=
X-Gm-Gg: ASbGncss1TSHFreJqjohBYl1MIpdKdupJCo/NnFMR3q4qUaI4PpmRkcPqVLvD8iuLCz
	e4yufnA7FVeGPFdgIzeMvou+vx95mcwznPsY1MjCPFUwKY86xLZsKShdiFX+4CLwNIXF2YeHHaZ
	zYv9wQSp6dxD5+/MXAayE9S7hf3zLgtl9wdBCw/WTUQq5lod+FN1bkUE00+jlW
X-Google-Smtp-Source: AGHT+IGo6g0V3NUBkvy92g0JO2y47WV4KxIDK56OarQHY019HRU1AbJgX8mGLIiQTv97wBhEK8EUrClQN+lI2zsXh3g=
X-Received: by 2002:ad4:5aec:0:b0:6e6:6c10:76fb with SMTP id
 6a1803df08f44-6e8e6d8fc11mr102011056d6.25.1741259654774; Thu, 06 Mar 2025
 03:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20250305175432.2040027-1-f_l_k@t-online.de>
In-Reply-To: <20250305175432.2040027-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Mar 2025 12:14:03 +0100
X-Gm-Features: AQ5f1JrzVH24CCY2SKrtwuQWTRpt8zFu1sOUudJbQfx2EY7CsJ8Mey6FbeO9S7Q
Message-ID: <CANNYZj_8-YW4jN6wcWg-i7GOw2evaVnXi=Mz56ctN=e_zG0QpQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] libsdl2: update 2.30.12 -> 2.32.2
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 11:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212385

Thanks :) We probably need a libsdl3 recipe at some point. It could be
developed in meta-oe first to a mature, stable state perhaps, and
moved to oe-core when consumers start appearing.
(not asking that you do it, just as a general note)

Alex

On Wed, 5 Mar 2025 at 18:54, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
> SDL 3.0 recommended!
>
> The SDL development team is focusing efforts on SDL3 and making sdl2-compat a drop-in replacement for SDL2.
> If you run into issues with SDL2, please consider upgrading to SDL3 or trying out sdl2-compat. We have made
> significant improvements across all platforms and your issue may already be resolved.
>
> 2.32.2:
> This is a stable bugfix release, with the following changes:
>
>     Fixed stack overflow when setting thread debug names on Windows
>     Fixed flushing audio forever in some cases when recording PulseAudio on Linux
>     Fixed a crash when initializing with controllers connected on macOS
>     Added SDL_HINT_JOYSTICK_HAPTIC_AXES to specify how many haptic axes a device has
>
> 2.32.0:
> This is a stable bugfix release, with the following changes:
>
>     Allow destroying a window and its renderer in either order
>     Added cursor-shape-v1 protocol support on Wayland
>     Fixed full immersive mode in Android 9 and higher
>     Improved event processing latency when gamepad/sensor is open
>     Added SDL_HINT_APPLE_RWFROMFILE_USE_RESOURCES to control whether SDL tries to open files from the app's resource directory on macOS
>     Fixed conditional effect playback on Moza Racing devices
>     Fixed input for Thrustmaster PlayStation wheels when hid-tmff2 is installed
>     Enabled direct VRAM access when using the window surface API on PSP
>     Improved window surface support on Nintendo 3DS
>     Fixed condition variable implementation on Nintendo 3DS
>     Fixed byte order detection on Solaris
>     Implemented SDL_TriggerBreakpoint() on aarch64-w64-mingw32
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libsdl2/{libsdl2_2.30.12.bb => libsdl2_2.32.2.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.12.bb => libsdl2_2.32.2.bb} (97%)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
> similarity index 97%
> rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
> rename to meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
> index b0ad55e314..2b28b3dfa9 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
> @@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
>
>  S = "${WORKDIR}/SDL2-${PV}"
>
> -SRC_URI[sha256sum] = "ac356ea55e8b9dd0b2d1fa27da40ef7e238267ccf9324704850d5d47375b48ea"
> +SRC_URI[sha256sum] = "c5f30c427fd8107ee4a400c84d4447dd211352512eaf0b6e89cc6a50a2821922"
>
>  inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
>
> --
> 2.48.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212345): https://lists.openembedded.org/g/openembedded-core/message/212345
> Mute This Topic: https://lists.openembedded.org/mt/111532762/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


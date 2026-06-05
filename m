Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F23BCD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 15:17:37 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10622.1780672650046924664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 08:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SZnZi/ua;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-660e9ff0587so972458d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 08:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780672649; cv=none;
        d=google.com; s=arc-20240605;
        b=K5iH2anxNd0RH6UwLhkPdw0+NfAYvy1avHDpi9Ck7sXjvRCGrALPYvDvseATUX2cHX
         /ain9ZOt0xT+z39rsBslDVfISwaGuytcW9K05HLG54kAsHHjlnLIUTxu6NMO9AktQ0R0
         Ed4TLJ+I3W2RKsRWIjm01RqSTtMsZF7uyf4EhPi3gjb5FRpiCT7uugTrjub/our/Iz0A
         cVsKKENbrloL7lmE6+ZpbIFOsM9/br/WKuiR8dbSoanFIZpfDfh9zO0oEoJ1NfdigdrL
         N+sX3EhFOiu5oipcjnhK2GPhHXlGHWPCct8kBkGZgAmdvc1P0886wcLAoXuozxFLwCdh
         1VPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TlV6uccuueVL0o7X6oXfHPstPNTZx+NZFCwWUlnenr8=;
        fh=uRuEWXVtm8M9vb8ncdOcpl9TquOS8WjLtGSt5OghfX4=;
        b=OQZ0ckkMnKVE69tpZLYAibruXocSdGayX3FjrY++JCap2fbWnYXXXQ9du3W3aiSPbr
         1D5GrYXAJU3G8lBS+UnsSZmXXT5XLHgbj1YbKZO38MwlEtRlxl8Q6iaAbmX6XOI8NRvd
         bQJHt6ePckL5CLMDRM1a4pnPYCR6TikSC7KUoLIlgvmsUKDRdBJnoHBRtzB3elxuNqmQ
         nV68OIJJa9RcumKUXP8v88FXqTx5fxKO0VKBGlOT/Np16dcyk2fVOGMNK5Qkxvss/QdV
         67lrB5X1G+3cuvBf0bcTN+H8ia2GwyJtkzDMf98ttzTyYKwK1AZTVlTJHxPFelQSwKqV
         HpEw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780672649; x=1781277449; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TlV6uccuueVL0o7X6oXfHPstPNTZx+NZFCwWUlnenr8=;
        b=SZnZi/uarSckFw4wcTVhr7lg+HUs3lPwT2TRQPSJWLH19AVo2IiVHUeanvahD5jZ3r
         byOVi4LrWFSccGxq3lFIcTq2PFz0B0GGQgD17Csn8KqjvFejfXjQTLhmyz8XKpykoMgq
         XS3anCtf8yEb7ihGFXqdZl8Jk+v5LnWO3usVbTZHBGUAWgg2XA9WVxw38xDe0CpRnBd+
         6eowJBeVnPTv5SzovRyOYn2t/zVyoBarFvL+VZa/gBE7jePWvl5Gzn4XTtKHTdaqliuF
         toW/TMrqO2GwwxJhTOAjv7qOaScOcMCOoJ2XJGrXiHQXKTaVDS04MR01zNLfANB84rTe
         cMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780672649; x=1781277449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlV6uccuueVL0o7X6oXfHPstPNTZx+NZFCwWUlnenr8=;
        b=scyDL+aYccccCPPMbyj31P4dwB9IAf2DdbYeoVM2VEF9QC8Xaa1X4B8I9PM4TiS2Wo
         zRhQACa0Ws+m8aLHEcjiJLWJ15Xn4qPJyUywt8gcBR8O0g1vuHHfzqjkqqS+QPF20Ajw
         FU+irtcUQVknDySjMzDrHV8bMo318dCgelM2kRC1H5R4nDNr0u6y2Z+JGMgryaLZlJXl
         nucVLVsLm04uPGg/v5vJCjE2a6c50sT8JC7TFdqeC03rrG1LPvlRh/Uum2vsjasohmjh
         L8RM6mQrNk8DyG44H07NDzn47snzLlQIq18UKiKB8+jOm7qT1f4cwjPVkAcWBy/7rCPV
         5C4g==
X-Forwarded-Encrypted: i=1; AFNElJ85t58jkXUU9OnSHeVPbtdS/6l62DOnBECMjLeqGdEKD660Ft24mV6w2o9EO+IPsLo0yuDZ6f7rZ7v7acwru64NvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1txPRuBdwKFDKqzqbXlSYiJXZKfy7ZWkHsOEmY9SqgUazaSoM
	fMtXfo/wcsIqq7pg0osIti74bNAWy1ZnOaR5oFxy1SiR6dkWsfCTjDfu7QwFyzNCnvFaVRVh1xQ
	+GlwFWaJ5Y3VAdRD9ZxtBFEUNKK6GvWA=
X-Gm-Gg: Acq92OHhqgeOGHcwaQNRaB+opXL7H8tamRO916CYjBh8wUOWUIx/347a5JIWmJrO+XC
	2cQlyBVWoYk9qpU3dU+lS9VNIjBzlFpWgUVLOwmMiDVcDUIYhMyXuyP2PnRzdu3FHaLlNiUi5Qv
	RFFelzpCPhEor4PT2IGf9+ASIdRhuyuvDL0yGhSoPyYTwMIqm1GDhVs1nQNIS5Nwm8G0jJdsI+F
	CMUdvFeM7fpga6jv8i7/v1MPaC1o6nQ6qfEnBdKfG8j2x5ZS5jbsGLpO2GMpJoGaXDyL5/etEcZ
	f57OwrQgOgiJUnYRm5m5Qgabq5AxE9KBN3T+Az0TRvFCmCk1tViQ
X-Received: by 2002:a05:690e:1514:b0:660:6318:eec8 with SMTP id
 956f58d0204a3-66106f89b2bmr3767009d50.56.1780672648758; Fri, 05 Jun 2026
 08:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com> <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com> <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
 <237df978-b1f2-4c66-ab4c-5894f7a44a02@mailo.com> <aiKEeH2UZgdePzjX@redhat.com>
 <CANNYZj-x8efUVB9Z5d2T9Ye4so6v3zamHVTexRCGmzOmkB6EuA@mail.gmail.com> <dd1729c6-f6e8-4790-b166-a635e34b3b1c@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <dd1729c6-f6e8-4790-b166-a635e34b3b1c@rsg.ci.i.u-tokyo.ac.jp>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jun 2026 17:17:16 +0200
X-Gm-Features: AVHnY4JcqpDYLub8_8wPU29zStbbhcGH8sdT2jqueQJnsE185kLpS_82lfvts7c
Message-ID: <CANNYZj9X4bSFxOMapsL7fB=q-GEO6oJMtwz3oPkfcX1ww1oaMw@mail.gmail.com>
Subject: Re: ui: Regression calling eglInitialize() since v11.0.0
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Quan.Sun@windriver.com, 
	QEMU Developers <qemu-devel@nongnu.org>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238177

On Fri, 5 Jun 2026 at 15:08, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:

> > Note that the environment we run in is X11 without wayland, e.g. a
> > XTigervnc server that provides a X11 display.
>
> Cc'ing Pierre-Eric Pelloux-Prayer
>
> My best bet is that SDL_HINT_VIDEO_X11_FORCE_EGL triggered the host
> issue, but the stack trace cited above contradicts with that. I don't
> exclude the possibility of a QEMU bug either.
>
> Can you confirm the stack trace is from a run with X11? If so, the next
> step would be to symbolize the stack trace. Otherwise, re-generating the
> stack trace with X11 may help.

Please note the comment above about the environment - it is x11
without wayland, provided by xtigervnc.

I got a stack trace with symbols:

#0  0x00007ffff721b4f4 in pthread_mutex_lock () from
/home/akanavin/bitbake-builds/poky-master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
#1  0x00007ffff5a9a9e6 in wl_proxy_create_wrapper
(proxy=0x5555583f2940) at
../sources/wayland-1.25.0/src/wayland-client.c:2800
#2  0x00007ffff58bf994 in dri2_initialize_wayland_drm
(disp=0x555559548070) at
../sources/mesa-26.0.6/src/egl/drivers/dri2/platform_wayland.c:2680
#3  0x00007ffff58c0e7e in dri2_initialize_wayland
(disp=disp@entry=0x555559548070) at
../sources/mesa-26.0.6/src/egl/drivers/dri2/platform_wayland.c:3288
#4  0x00007ffff58b899d in dri2_initialize
(disp=disp@entry=0x555559548070) at
../sources/mesa-26.0.6/src/egl/drivers/dri2/egl_dri2.c:895
#5  0x00007ffff58abc3b in eglInitialize (dpy=<optimized out>,
major=0x0, minor=0x0) at
../sources/mesa-26.0.6/src/egl/main/eglapi.c:697
#6  0x00007ffff7cc77f5 in SDL_EGL_LoadLibrary
(_this=_this@entry=0x5555584054a0, egl_path=egl_path@entry=0x0,
native_display=0x5555583f2940, platform=platform@entry=0)
    at /home/akanavin/bitbake-builds/poky-master/build/tmp/work/x86_64-linux/libsdl2-native/2.32.10/sources/SDL2-2.32.10/src/video/SDL_egl.c:547
#7  0x00007ffff7cf4695 in X11_GLES_LoadLibrary
(_this=_this@entry=0x5555584054a0, path=path@entry=0x0)
    at /home/akanavin/bitbake-builds/poky-master/build/tmp/work/x86_64-linux/libsdl2-native/2.32.10/sources/SDL2-2.32.10/src/video/x11/SDL_x11opengles.c:56
#8  0x00007ffff7cf3ec8 in X11_GL_LoadLibrary (_this=0x5555584054a0,
path=<optimized out>)
    at /home/akanavin/bitbake-builds/poky-master/build/tmp/work/x86_64-linux/libsdl2-native/2.32.10/sources/SDL2-2.32.10/src/video/x11/SDL_x11opengl.c:270
#9  0x00007ffff7cd4734 in SDL_GL_LoadLibrary_REAL (path=path@entry=0x0)
    at /home/akanavin/bitbake-builds/poky-master/build/tmp/work/x86_64-linux/libsdl2-native/2.32.10/sources/SDL2-2.32.10/src/video/SDL_video.c:3493
#10 0x00007ffff7cd66c3 in SDL_CreateWindow_REAL (title=0x555556029e87
"", x=536805376, y=536805376, w=1, h=1, flags=42)
    at /home/akanavin/bitbake-builds/poky-master/build/tmp/work/x86_64-linux/libsdl2-native/2.32.10/sources/SDL2-2.32.10/src/video/SDL_video.c:1717
#11 0x00007ffff7c52688 in SDL_CreateWindow (a=a@entry=0x555556029e87
"", b=b@entry=536805376, c=c@entry=536805376, d=<optimized out>,
e=e@entry=1, f=f@entry=42)
    at /home/akanavin/bitbake-builds/poky-master/build/tmp/work/x86_64-linux/libsdl2-native/2.32.10/sources/SDL2-2.32.10/src/dynapi/SDL_dynapi_procs.h:545
#12 0x0000555555be7b04 in sdl2_window_create
(scon=scon@entry=0x5555584240f0) at
../sources/qemu-11.0.0/ui/sdl2.c:106
#13 0x0000555555be92de in sdl2_gl_console_init (scon=0x5555584240f0)
at ../sources/qemu-11.0.0/ui/sdl2-gl.c:306
#14 0x0000555555be78e9 in sdl2_display_init (ds=<optimized out>,
o=0x555557124140 <dpy>) at ../sources/qemu-11.0.0/ui/sdl2.c:957
#15 0x0000555555b2938f in qemu_init_displays () at
../sources/qemu-11.0.0/system/vl.c:2689
#16 qemu_init (argc=<optimized out>, argv=<optimized out>) at
../sources/qemu-11.0.0/system/vl.c:3847
#17 0x0000555555892529 in main (argc=<optimized out>, argv=<optimized
out>) at ../sources/qemu-11.0.0/system/main.c:71


To me it seems like forcing EGL triggers those wayland code paths
where the crash happens.

Alex


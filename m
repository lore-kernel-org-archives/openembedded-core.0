Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EE8E677F5
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 09:17:18 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.13861.1730539029572925291
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 02:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hM3FzWGY;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso25661301fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730539028; x=1731143828; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQ1XFoNI10QIW0dT0Hql0+0hTYEQTe29CZCd1KW1XOI=;
        b=hM3FzWGYoClF8yF/T2h7GaKmQOqoN/3OIGLziNS9r6ugqwQNCseuNnKyq2x670/b4q
         yayLc0e+rgIe0o7uBgntmqQDDjCN/7KpZRQDVA615H+JIUjJdOvy/XrHDUE6dBYmgmCX
         3pM3r0PWPAGHdUoXs2nR7rfFje6e8KASVR0kHrgHmwZtYARtjypiBLu0X/hI6HAkXeN4
         iAuiQv/of11BpxL+uN01sW+Du3L1EcIjge7v0zK77To1/Ybqv378j/WDmAw5irKO6Avz
         ioKMKuEqvR+yGeQ/UvktCVyB5ZyOJlCFo6lttz43ZOn6S2sfb6wjrjGKnKcLpOhPv9KM
         SKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730539028; x=1731143828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ1XFoNI10QIW0dT0Hql0+0hTYEQTe29CZCd1KW1XOI=;
        b=XqbOO3R3Cdy93iWhVDMn5UphL3pSNTROrUWGdkQq8wM8WdJenlEZpt/SkCQlfxe4bE
         kxL9l4RBY2qh+gezrCP3rktTyjurvCZdhJskC30ZQWd0KXVR9Hmq2FB/Dr2saN5sC67v
         P3LMTmp7U6Z0Pvi41OzSu0yx05gl91RoGk6zo6rDCkEd2+lhl590h6EkTpBAA/JIz8e7
         aoBhQaJzgV4ScmPwx+fU1BnvUSjl1ggrr33pIxWdEO3W8g63hZIz7YdPrzlhi9Dh1B5o
         +D89M4PRkVEjenp/xuqBLnVo3tCNb7YP95YyKiFRedDiNCh2zDzZ64qGaEQ94VDSUc6R
         M6cA==
X-Gm-Message-State: AOJu0YzkgFnNiV5DUeZIlLC+hcjKhs8d1p1S2yLm74t9D9RXRSQCnWLV
	rRUHtQepCzbfJBk4+f7zu/3yOPJTZETGhWMIsFw/4bOOtZtXVkQC5EEgI9ZhJFF2HGnR80WxypU
	/CXk92vp9/6AspBkSzYDi+y95Uio=
X-Google-Smtp-Source: AGHT+IFBWhgkW2lFmM2xQwSGrO8wGBlh5jvXSWXjuDk08fv2FI3xeJT33sSST7ybN9XFj5Z8k+2x3Y/+FdRvdAA/jiI=
X-Received: by 2002:a2e:611a:0:b0:2fc:9759:4e3d with SMTP id
 38308e7fff4ca-2fd059396demr57118781fa.19.1730539027443; Sat, 02 Nov 2024
 02:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241101184156.2368109-1-hiagofranco@gmail.com>
 <CANNYZj-nmnzTFqPT2nCY2EWWirCpyo1Yw9gFUz9_=dMt3diYXA@mail.gmail.com>
 <20241101202323.4ld6jdczxaoxk6fb@hiago-nb> <CANNYZj_tFUibOLa5MUDLOSBvKt2F=bZqdk7q4_6besXMJ4pgHA@mail.gmail.com>
 <20241101233812.sus2trjtvv76xtwb@hiago-nb>
In-Reply-To: <20241101233812.sus2trjtvv76xtwb@hiago-nb>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Nov 2024 10:16:56 +0100
Message-ID: <CANNYZj8xih5oKa2oC6DG3=J-Zwm7djrWS61p0v0cC-Z1RrA8MA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] drm-info: add recipe
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 09:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206650

Thanks, this does seem useful. I'd want input from people actively
working with graphics, but not sure who to ask.

Alex

On Sat, 2 Nov 2024 at 00:38, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Fri, Nov 01, 2024 at 09:35:27PM +0100, Alexander Kanavin wrote:
> > Perhaps you can show what the tool outputs?
>
> Sure, here is the output for qemu x86-64:
>
> root@qemux86-64:~# drm_info
> Node: /dev/dri/card0
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Driver: bochs-drm (bochs dispi vga in=
terface (qemu stdvga)) version 1.0.0 (201309)
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CLIENT_CAP_STEREO_3D =
supported
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CLIENT_CAP_UNIVERSAL_=
PLANES supported
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CLIENT_CAP_ATOMIC sup=
ported
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CLIENT_CAP_ASPECT_RAT=
IO supported
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CLIENT_CAP_WRITEBACK_=
CONNECTORS supported
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CLIENT_CAP_CURSOR_PLA=
NE_HOTSPOT not supported
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_DUMB_BUFFER =3D 1
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_VBLANK_HIGH_CRTC =
=3D 1
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_DUMB_PREFERRED_DE=
PTH =3D 24
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_DUMB_PREFER_SHADO=
W =3D 0
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_PRIME =3D 3
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_TIMESTAMP_MONOTON=
IC =3D 1
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_ASYNC_PAGE_FLIP =
=3D 0
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_CURSOR_WIDTH =3D =
64
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_CURSOR_HEIGHT =3D=
 64
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_ADDFB2_MODIFIERS =
=3D 1
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_PAGE_FLIP_TARGET =
=3D 0
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_CRTC_IN_VBLANK_EV=
ENT =3D 1
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_SYNCOBJ =3D 0
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80DRM_CAP_SYNCOBJ_TIMELINE =
=3D 0
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80DRM_CAP_ATOMIC_ASYNC_PAGE=
_FLIP =3D 0
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Device: PCI 1234:1111
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80Available nodes: primary
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Framebuffer size
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Width: [0, 8192]
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80Height: [0, 8192]
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Connectors
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80Connector 0
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Object ID: 32
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Type: virtual
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Status: connected
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Physical size: 320=C3=
=97200 mm
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Subpixel: unknown
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Encoders: {0}
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Modes
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801280=C3=
=97800@74.99 preferred driver nhsync nvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801920=C3=
=971080@60.00 driver nhsync nvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801920=C3=
=971080@50.00 driver phsync pvsync 16:9
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801600=C3=
=971200@60.00 driver phsync pvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801680=C3=
=971050@59.95 driver nhsync pvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801400=C3=
=971050@59.98 driver nhsync pvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801280=C3=
=971024@60.02 driver phsync pvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801440=C3=
=97900@59.89 driver nhsync pvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801280=C3=
=97960@60.00 driver phsync pvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801360=C3=
=97768@60.02 driver phsync pvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801280=C3=
=97768@59.87 driver nhsync pvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=801024=C3=
=97768@60.00 driver nhsync nvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80800=C3=97=
600@60.32 driver phsync pvsync
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80640=C3=97=
480@60.00 driver nhsync nvsync 4:3
> =E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80640=C3=97=
480@59.94 driver nhsync nvsync
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80=E2=94=80Properties
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"DPMS": enum {On,=
 Standby, Suspend, Off} =3D On
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"link-status": en=
um {Good, Bad} =3D Good
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"non-desktop" (im=
mutable): range [0, 1] =3D 0
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"TILE" (immutable=
): blob =3D 0
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"CRTC_ID" (atomic=
): object CRTC =3D 36
> =E2=94=82           =E2=94=94=E2=94=80=E2=94=80=E2=94=80"EDID" (immutable=
): blob =3D 33
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Encoders
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80Encoder 0
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Object ID: 37
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Type: none
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80CRTCS: {0}
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80=E2=94=80Clones: {0}
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80CRTCs
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80CRTC 0
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Object ID: 36
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Legacy info
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Mode: 128=
0=C3=97800@74.99 preferred driver nhsync nvsync
> =E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80Gamma siz=
e: 0
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80=E2=94=80Properties
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"ACTIVE" (atomic)=
: range [0, 1] =3D 1
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"MODE_ID" (atomic=
): blob =3D 39
> =E2=94=82           =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=801280=
=C3=97800@74.99 preferred driver nhsync nvsync
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"OUT_FENCE_PTR" (=
atomic): range [0, UINT64_MAX] =3D 0
> =E2=94=82           =E2=94=94=E2=94=80=E2=94=80=E2=94=80"VRR_ENABLED": ra=
nge [0, 1] =3D 0
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80Planes
>     =E2=94=94=E2=94=80=E2=94=80=E2=94=80Plane 0
>         =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Object ID: 34
>         =E2=94=9C=E2=94=80=E2=94=80=E2=94=80CRTCs: {0}
>         =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Legacy info
>         =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80FB ID: 38
>         =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Objec=
t ID: 38
>         =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Size:=
 1280=C3=97800
>         =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Forma=
t: XRGB8888 (0x34325258)
>         =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Modif=
ier: DRM_FORMAT_MOD_LINEAR (0x0000000000000000)
>         =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80Plane=
s:
>         =E2=94=82   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80=E2=94=80P=
lane 0: offset =3D 0, pitch =3D 5120 bytes
>         =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80Formats:
>         =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80XRGB8888 (0x3=
4325258)
>         =E2=94=82       =E2=94=94=E2=94=80=E2=94=80=E2=94=80BGRX8888 (0x3=
4325842)
>         =E2=94=94=E2=94=80=E2=94=80=E2=94=80Properties
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"type" (immutable): enum =
{Overlay, Primary, Cursor} =3D Primary
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"FB_ID" (atomic): object =
framebuffer =3D 38
>             =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Object ID: 38
>             =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Size: 1280=C3=
=97800
>             =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Format: XRGB8=
888 (0x34325258)
>             =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Modifier: DRM=
_FORMAT_MOD_LINEAR (0x0000000000000000)
>             =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80Planes:
>             =E2=94=82       =E2=94=94=E2=94=80=E2=94=80=E2=94=80Plane 0: =
offset =3D 0, pitch =3D 5120 bytes
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"IN_FENCE_FD" (atomic): s=
range [-1, INT32_MAX] =3D -1
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"CRTC_ID" (atomic): objec=
t CRTC =3D 36
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"CRTC_X" (atomic): srange=
 [INT32_MIN, INT32_MAX] =3D 0
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"CRTC_Y" (atomic): srange=
 [INT32_MIN, INT32_MAX] =3D 0
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"CRTC_W" (atomic): range =
[0, INT32_MAX] =3D 1280
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"CRTC_H" (atomic): range =
[0, INT32_MAX] =3D 800
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"SRC_X" (atomic): range [=
0, UINT32_MAX] =3D 0
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"SRC_Y" (atomic): range [=
0, UINT32_MAX] =3D 0
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"SRC_W" (atomic): range [=
0, UINT32_MAX] =3D 1280
>             =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"SRC_H" (atomic): range [=
0, UINT32_MAX] =3D 800
>             =E2=94=94=E2=94=80=E2=94=80=E2=94=80"IN_FORMATS" (immutable):=
 blob =3D 35
>                 =E2=94=94=E2=94=80=E2=94=80=E2=94=80DRM_FORMAT_MOD_LINEAR=
 (0x0000000000000000)
>                     =E2=94=9C=E2=94=80=E2=94=80=E2=94=80XRGB8888 (0x34325=
258)
>                     =E2=94=94=E2=94=80=E2=94=80=E2=94=80BGRX8888 (0x34325=
842)
>
> It is basically a dump with information about DRM devices.
>
> >
> > Alex
> >
> > On Fri 1. Nov 2024 at 21.23, Hiago De Franco <hiagofranco@gmail.com> wr=
ote:
> >
> > > Hi Alexander,
> > >
> > > On Fri, Nov 01, 2024 at 08:22:03PM +0100, Alexander Kanavin wrote:
> > > > Should this go to meta-oe rather? Why core?
> > >
> > > I was not 100% sure, I just selected here because I saw the recipe fo=
r
> > > 'libdrm' and the 'recipes-graphics/drm'. I can move this to meta-oe i=
f
> > > openembedded-core is not the correct place. Please let me know.
> > >
> > > >
> > > > Alex
> > > >
> > > > On Fri 1. Nov 2024 at 19.42, Hiago De Franco via lists.openembedded=
.org
> > > > <hiagofranco=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > >
> > > > > This recipe provides information about DRM devices, useful for
> > > debugging
> > > > > and checking information about DRM.
> > > > >
> > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > ---
> > > > >  meta/conf/distro/include/maintainers.inc    |  1 +
> > > > >  meta/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
> > > > >  2 files changed, 14 insertions(+)
> > > > >  create mode 100644 meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > >
> > > > > diff --git a/meta/conf/distro/include/maintainers.inc
> > > > > b/meta/conf/distro/include/maintainers.inc
> > > > > index 7aafa7a2d146..2c2779f8cf83 100644
> > > > > --- a/meta/conf/distro/include/maintainers.inc
> > > > > +++ b/meta/conf/distro/include/maintainers.inc
> > > > > @@ -156,6 +156,7 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets =
=3D "Yi
> > > > > Zhao <yi.zhao@windriver.com>"
> > > > >  RECIPE_MAINTAINER:pn-dos2unix =3D "Khem Raj <raj.khem@gmail.com>=
"
> > > > >  RECIPE_MAINTAINER:pn-dosfstools =3D "Yi Zhao <yi.zhao@windriver.=
com>"
> > > > >  RECIPE_MAINTAINER:pn-dpkg =3D "Unassigned <unassigned@yoctoproje=
ct.org
> > > >"
> > > > > +RECIPE_MAINTAINER:pn-drm-info =3D "Hiago De Franco <
> > > > > hiago.franco@toradex.com>"
> > > > >  RECIPE_MAINTAINER:pn-dropbear =3D "Yi Zhao <yi.zhao@windriver.co=
m>"
> > > > >  RECIPE_MAINTAINER:pn-dtc =3D "Wang Mingyu <wangmy@fujitsu.com>"
> > > > >  RECIPE_MAINTAINER:pn-dwarfsrcfiles =3D "Alexander Kanavin <
> > > > > alex.kanavin@gmail.com>"
> > > > > diff --git a/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > new file mode 100644
> > > > > index 000000000000..9f1cbb47fbfd
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > @@ -0,0 +1,13 @@
> > > > > +SUMMARY =3D "Small utility to dump info about DRM devices"
> > > > > +HOMEPAGE =3D "https://gitlab.freedesktop.org/emersion/drm_info"
> > > > > +LICENSE =3D "MIT"
> > > > > +LIC_FILES_CHKSUM =3D
> > > "file://LICENSE;md5=3D32fd56d355bd6a61017655d8da26b67c"
> > > > > +
> > > > > +SRC_URI =3D "git://
> > > > >
> > > gitlab.freedesktop.org/emersion/drm_info.git;branch=3Dmaster;protocol=
=3Dhttps"
> > > > > +SRCREV =3D "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
> > > > > +
> > > > > +S =3D "${WORKDIR}/git"
> > > > > +
> > > > > +inherit meson pkgconfig
> > > > > +
> > > > > +DEPENDS =3D "json-c libdrm"
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#206628):
> > > > > https://lists.openembedded.org/g/openembedded-core/message/206628
> > > > > Mute This Topic: https://lists.openembedded.org/mt/109340073/1686=
489
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/u=
nsub
> > > [
> > > > > alex.kanavin@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >
> > > > >
> > >
> > > Regards,
> > >
> > > Hiago.
> > >
>
> Regards,
>
> Hiago.


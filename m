Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EB0E67802
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 14:59:20 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.18502.1730559553830837159
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 07:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nHWsSph3;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e5a0177531so2265867a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730559553; x=1731164353; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BHQgDFHSMzzXn37qDGaRvwoP8vcMMaqVc7qiOlhYC+w=;
        b=nHWsSph3X8V0/sd3+L/ih3zgm+yyhswX3FJPwvNkUNRIX2R2gkFpvfcnBzj0KVg7BN
         V0JdIsGkRCJ2OwizG3YJVH94fK/3dqS53JdSlAJAlqIJS9yV8Xu5P1TbTa+OECohCYz8
         IrWe2o52kd+tjDLQI5TzOju284fBGu9quSQYpNiAndOECB+yzBqbuZP0KKqrMh880qww
         GKqcVy1esEOwMF79ebyu/fXR0Xv0/auPKBcrgTi6IJwmWhN6l7yH6JlHfkn35iRGFd0Y
         M94NCHW+/kAu7KLiZsMNFkdOZ2B68NHpSV34P7UaaGDkfZPw0qj0Gdr1w3dAoW3K7aOn
         fkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730559553; x=1731164353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHQgDFHSMzzXn37qDGaRvwoP8vcMMaqVc7qiOlhYC+w=;
        b=vwaBRmngnIsITdYW3rw9MT9tX8C4P0bH1JvJoSUQx8FgYPkFWl+0lgTEm3/PjsM49A
         fhaEO26DRFxqXlLBVZSGSrEQQTZGmxOkEvxWKQL2ase+rD1Az9KiNzMEEc5oX/4GuPng
         iU6v6mNf14Jrg6/Wfzhspv+AXJE8Ln2jmDjYyAB4AZnL9nnn1NWqoobnBCjpVAg92Y7Z
         psyFmpD5sabXS5XN2cB1rhSsuaRY2WFhTDA4TMTsTm7/m8tAfRkoeFtbldsklrKxJjm9
         HKuIBY0X+CrNaZBd7CZSmui8OObXwv3ePyUccCuVdNofo0UlBXM/A4O6NcOl7c+1FFsh
         tbTw==
X-Gm-Message-State: AOJu0YxjIGL/TiJnz+x/afTzuGd/QOO2BiuIDxZg1ZKaVHinY3f3CGnq
	IEQTm2ud8FGQ4iRBsFcPDt2/Iinlf5t9wSZH2wvxCUO74dlnV/F0
X-Google-Smtp-Source: AGHT+IHNQEc+X+XbOO+87dq3MWcG8wUjnsQfzKKWqJvYIX36PGx2HrTrukhJ1X/+19pu6IXUP39z+A==
X-Received: by 2002:a17:90b:3848:b0:2e0:5748:6ea1 with SMTP id 98e67ed59e1d1-2e8f11dcec5mr29532712a91.37.1730559553049;
        Sat, 02 Nov 2024 07:59:13 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c0:1be5:6c8:bca9:2a85:63c9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93da8e2cdsm4959714a91.12.2024.11.02.07.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 07:59:12 -0700 (PDT)
Date: Sat, 2 Nov 2024 11:59:09 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: Re: [oe-core][PATCH] drm-info: add recipe
Message-ID: <20241102145909.mbs2omdeef6n3sqe@hiago-nb>
References: <20241101184156.2368109-1-hiagofranco@gmail.com>
 <CANNYZj-nmnzTFqPT2nCY2EWWirCpyo1Yw9gFUz9_=dMt3diYXA@mail.gmail.com>
 <20241101202323.4ld6jdczxaoxk6fb@hiago-nb>
 <CANNYZj_tFUibOLa5MUDLOSBvKt2F=bZqdk7q4_6besXMJ4pgHA@mail.gmail.com>
 <20241101233812.sus2trjtvv76xtwb@hiago-nb>
 <CANNYZj8xih5oKa2oC6DG3=J-Zwm7djrWS61p0v0cC-Z1RrA8MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj8xih5oKa2oC6DG3=J-Zwm7djrWS61p0v0cC-Z1RrA8MA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 14:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206652

On Sat, Nov 02, 2024 at 10:16:56AM +0100, Alexander Kanavin wrote:
> Thanks, this does seem useful. I'd want input from people actively
> working with graphics, but not sure who to ask.

Maybe Wang Mingyu could also comment here? I am not sure.

> 
> Alex
> 
> On Sat, 2 Nov 2024 at 00:38, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > On Fri, Nov 01, 2024 at 09:35:27PM +0100, Alexander Kanavin wrote:
> > > Perhaps you can show what the tool outputs?
> >
> > Sure, here is the output for qemu x86-64:
> >
> > root@qemux86-64:~# drm_info
> > Node: /dev/dri/card0
> > ├───Driver: bochs-drm (bochs dispi vga interface (qemu stdvga)) version 1.0.0 (201309)
> > │   ├───DRM_CLIENT_CAP_STEREO_3D supported
> > │   ├───DRM_CLIENT_CAP_UNIVERSAL_PLANES supported
> > │   ├───DRM_CLIENT_CAP_ATOMIC supported
> > │   ├───DRM_CLIENT_CAP_ASPECT_RATIO supported
> > │   ├───DRM_CLIENT_CAP_WRITEBACK_CONNECTORS supported
> > │   ├───DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT not supported
> > │   ├───DRM_CAP_DUMB_BUFFER = 1
> > │   ├───DRM_CAP_VBLANK_HIGH_CRTC = 1
> > │   ├───DRM_CAP_DUMB_PREFERRED_DEPTH = 24
> > │   ├───DRM_CAP_DUMB_PREFER_SHADOW = 0
> > │   ├───DRM_CAP_PRIME = 3
> > │   ├───DRM_CAP_TIMESTAMP_MONOTONIC = 1
> > │   ├───DRM_CAP_ASYNC_PAGE_FLIP = 0
> > │   ├───DRM_CAP_CURSOR_WIDTH = 64
> > │   ├───DRM_CAP_CURSOR_HEIGHT = 64
> > │   ├───DRM_CAP_ADDFB2_MODIFIERS = 1
> > │   ├───DRM_CAP_PAGE_FLIP_TARGET = 0
> > │   ├───DRM_CAP_CRTC_IN_VBLANK_EVENT = 1
> > │   ├───DRM_CAP_SYNCOBJ = 0
> > │   ├───DRM_CAP_SYNCOBJ_TIMELINE = 0
> > │   └───DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP = 0
> > ├───Device: PCI 1234:1111
> > │   └───Available nodes: primary
> > ├───Framebuffer size
> > │   ├───Width: [0, 8192]
> > │   └───Height: [0, 8192]
> > ├───Connectors
> > │   └───Connector 0
> > │       ├───Object ID: 32
> > │       ├───Type: virtual
> > │       ├───Status: connected
> > │       ├───Physical size: 320×200 mm
> > │       ├───Subpixel: unknown
> > │       ├───Encoders: {0}
> > │       ├───Modes
> > │       │   ├───1280×800@74.99 preferred driver nhsync nvsync
> > │       │   ├───1920×1080@60.00 driver nhsync nvsync
> > │       │   ├───1920×1080@50.00 driver phsync pvsync 16:9
> > │       │   ├───1600×1200@60.00 driver phsync pvsync
> > │       │   ├───1680×1050@59.95 driver nhsync pvsync
> > │       │   ├───1400×1050@59.98 driver nhsync pvsync
> > │       │   ├───1280×1024@60.02 driver phsync pvsync
> > │       │   ├───1440×900@59.89 driver nhsync pvsync
> > │       │   ├───1280×960@60.00 driver phsync pvsync
> > │       │   ├───1360×768@60.02 driver phsync pvsync
> > │       │   ├───1280×768@59.87 driver nhsync pvsync
> > │       │   ├───1024×768@60.00 driver nhsync nvsync
> > │       │   ├───800×600@60.32 driver phsync pvsync
> > │       │   ├───640×480@60.00 driver nhsync nvsync 4:3
> > │       │   └───640×480@59.94 driver nhsync nvsync
> > │       └───Properties
> > │           ├───"DPMS": enum {On, Standby, Suspend, Off} = On
> > │           ├───"link-status": enum {Good, Bad} = Good
> > │           ├───"non-desktop" (immutable): range [0, 1] = 0
> > │           ├───"TILE" (immutable): blob = 0
> > │           ├───"CRTC_ID" (atomic): object CRTC = 36
> > │           └───"EDID" (immutable): blob = 33
> > ├───Encoders
> > │   └───Encoder 0
> > │       ├───Object ID: 37
> > │       ├───Type: none
> > │       ├───CRTCS: {0}
> > │       └───Clones: {0}
> > ├───CRTCs
> > │   └───CRTC 0
> > │       ├───Object ID: 36
> > │       ├───Legacy info
> > │       │   ├───Mode: 1280×800@74.99 preferred driver nhsync nvsync
> > │       │   └───Gamma size: 0
> > │       └───Properties
> > │           ├───"ACTIVE" (atomic): range [0, 1] = 1
> > │           ├───"MODE_ID" (atomic): blob = 39
> > │           │   └───1280×800@74.99 preferred driver nhsync nvsync
> > │           ├───"OUT_FENCE_PTR" (atomic): range [0, UINT64_MAX] = 0
> > │           └───"VRR_ENABLED": range [0, 1] = 0
> > └───Planes
> >     └───Plane 0
> >         ├───Object ID: 34
> >         ├───CRTCs: {0}
> >         ├───Legacy info
> >         │   ├───FB ID: 38
> >         │   │   ├───Object ID: 38
> >         │   │   ├───Size: 1280×800
> >         │   │   ├───Format: XRGB8888 (0x34325258)
> >         │   │   ├───Modifier: DRM_FORMAT_MOD_LINEAR (0x0000000000000000)
> >         │   │   └───Planes:
> >         │   │       └───Plane 0: offset = 0, pitch = 5120 bytes
> >         │   └───Formats:
> >         │       ├───XRGB8888 (0x34325258)
> >         │       └───BGRX8888 (0x34325842)
> >         └───Properties
> >             ├───"type" (immutable): enum {Overlay, Primary, Cursor} = Primary
> >             ├───"FB_ID" (atomic): object framebuffer = 38
> >             │   ├───Object ID: 38
> >             │   ├───Size: 1280×800
> >             │   ├───Format: XRGB8888 (0x34325258)
> >             │   ├───Modifier: DRM_FORMAT_MOD_LINEAR (0x0000000000000000)
> >             │   └───Planes:
> >             │       └───Plane 0: offset = 0, pitch = 5120 bytes
> >             ├───"IN_FENCE_FD" (atomic): srange [-1, INT32_MAX] = -1
> >             ├───"CRTC_ID" (atomic): object CRTC = 36
> >             ├───"CRTC_X" (atomic): srange [INT32_MIN, INT32_MAX] = 0
> >             ├───"CRTC_Y" (atomic): srange [INT32_MIN, INT32_MAX] = 0
> >             ├───"CRTC_W" (atomic): range [0, INT32_MAX] = 1280
> >             ├───"CRTC_H" (atomic): range [0, INT32_MAX] = 800
> >             ├───"SRC_X" (atomic): range [0, UINT32_MAX] = 0
> >             ├───"SRC_Y" (atomic): range [0, UINT32_MAX] = 0
> >             ├───"SRC_W" (atomic): range [0, UINT32_MAX] = 1280
> >             ├───"SRC_H" (atomic): range [0, UINT32_MAX] = 800
> >             └───"IN_FORMATS" (immutable): blob = 35
> >                 └───DRM_FORMAT_MOD_LINEAR (0x0000000000000000)
> >                     ├───XRGB8888 (0x34325258)
> >                     └───BGRX8888 (0x34325842)
> >
> > It is basically a dump with information about DRM devices.
> >
> > >
> > > Alex
> > >
> > > On Fri 1. Nov 2024 at 21.23, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > > Hi Alexander,
> > > >
> > > > On Fri, Nov 01, 2024 at 08:22:03PM +0100, Alexander Kanavin wrote:
> > > > > Should this go to meta-oe rather? Why core?
> > > >
> > > > I was not 100% sure, I just selected here because I saw the recipe for
> > > > 'libdrm' and the 'recipes-graphics/drm'. I can move this to meta-oe if
> > > > openembedded-core is not the correct place. Please let me know.
> > > >
> > > > >
> > > > > Alex
> > > > >
> > > > > On Fri 1. Nov 2024 at 19.42, Hiago De Franco via lists.openembedded.org
> > > > > <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > > >
> > > > > > This recipe provides information about DRM devices, useful for
> > > > debugging
> > > > > > and checking information about DRM.
> > > > > >
> > > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > ---
> > > > > >  meta/conf/distro/include/maintainers.inc    |  1 +
> > > > > >  meta/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
> > > > > >  2 files changed, 14 insertions(+)
> > > > > >  create mode 100644 meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > >
> > > > > > diff --git a/meta/conf/distro/include/maintainers.inc
> > > > > > b/meta/conf/distro/include/maintainers.inc
> > > > > > index 7aafa7a2d146..2c2779f8cf83 100644
> > > > > > --- a/meta/conf/distro/include/maintainers.inc
> > > > > > +++ b/meta/conf/distro/include/maintainers.inc
> > > > > > @@ -156,6 +156,7 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi
> > > > > > Zhao <yi.zhao@windriver.com>"
> > > > > >  RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
> > > > > >  RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
> > > > > >  RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org
> > > > >"
> > > > > > +RECIPE_MAINTAINER:pn-drm-info = "Hiago De Franco <
> > > > > > hiago.franco@toradex.com>"
> > > > > >  RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
> > > > > >  RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
> > > > > >  RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <
> > > > > > alex.kanavin@gmail.com>"
> > > > > > diff --git a/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > > b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > > new file mode 100644
> > > > > > index 000000000000..9f1cbb47fbfd
> > > > > > --- /dev/null
> > > > > > +++ b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > > @@ -0,0 +1,13 @@
> > > > > > +SUMMARY = "Small utility to dump info about DRM devices"
> > > > > > +HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
> > > > > > +LICENSE = "MIT"
> > > > > > +LIC_FILES_CHKSUM =
> > > > "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
> > > > > > +
> > > > > > +SRC_URI = "git://
> > > > > >
> > > > gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
> > > > > > +SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
> > > > > > +
> > > > > > +S = "${WORKDIR}/git"
> > > > > > +
> > > > > > +inherit meson pkgconfig
> > > > > > +
> > > > > > +DEPENDS = "json-c libdrm"
> > > > > >
> > > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > > > Links: You receive all messages sent to this group.
> > > > > > View/Reply Online (#206628):
> > > > > > https://lists.openembedded.org/g/openembedded-core/message/206628
> > > > > > Mute This Topic: https://lists.openembedded.org/mt/109340073/1686489
> > > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > > > [
> > > > > > alex.kanavin@gmail.com]
> > > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > > >
> > > > > >
> > > >
> > > > Regards,
> > > >
> > > > Hiago.
> > > >
> >
> > Regards,
> >
> > Hiago.

Regards,

Hiago.


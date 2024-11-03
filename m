Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD2BD11187
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 18:03:17 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.40581.1730656988981224326
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 10:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNBxGaua;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: hiagofranco@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7f3da2c2cb5so37634a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Nov 2024 10:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730656988; x=1731261788; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JhMphPVIW7iXm/XHgY5+Lf73K6wSxqLx5XrEtVxo1E4=;
        b=nNBxGauaP32EbGWmKD2TlBfKdAjrYERYNtzaB0GAkaiMkAbvQcD8CCPlrg/9n1Lffi
         UILDgdgKzUzBicWv/4lH6cCwspG/OOrYp05rHcQlo6pd6HaX7ZRii+mHz9nX0J1UxdDP
         hLRCa0AXN5lhJTEIhp4/qfNkmWHhwXS782Rhl5luUI0mPTNiBgpUxZaD7tQ+KG0ElVUj
         zNWMAUsi5L1fZM3Khj0ppefqimkR9diIkyzbNg+vMmfa2gv3E7H0ycPpL/NUSFLb3M05
         0rp7KyaILlNiJ7ctw3IHxh5rLhLC5Vr420eYoZpHfLah/RFSM6gcHh39ua0ixzlbrse8
         b7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730656988; x=1731261788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JhMphPVIW7iXm/XHgY5+Lf73K6wSxqLx5XrEtVxo1E4=;
        b=j76lYgidaKFE4isrRUKhP+P3UqGg2wwNGSxu/1mwRyt+wqguWJmf7RLU+TB20xWUX9
         4GOR4BLLUo5aqGiER9uAIuipiNTGXjr9NQVprsz92+m1eiraZuSVTgKKWqmYCdhwjXP+
         ZLJJI4H06nRNh9iJFYlJJ0KHEzr1CRFyxRr2eIn2yUYecQuVcM9AVsfGBp/wAwcxQ6gF
         K3Q9tA1tBjImL3OaCwVu8zN5qfpVP9z5lrEyBSwgCQZsZ7/tOzOffcCs3TzBL53GcRpQ
         Iwi8ki3Gt+3BVIoOPY+W2SYTGcBnpuow9Ly7OSDb4Glln9HWHCxuDgnkma/Bbj+uOxlp
         4Zew==
X-Gm-Message-State: AOJu0Yy2fpkx4aqa1Nmq6/PWynA28ouWGYEHPZOMij+GIYCE4SXicbth
	usOSevsxHCfxg/wThGXPK3qFecQmsisUZ9aFdCAM3ZgZmI2c8+iK
X-Google-Smtp-Source: AGHT+IHCVmWybZpXpi0ibhoOznNoyAmP6YYEcQ04/oVR5h2XHPZcnHULIrmpsO8RDH7QCOWFiBVhiA==
X-Received: by 2002:a17:90a:f2d5:b0:2e2:e549:2dbc with SMTP id 98e67ed59e1d1-2e8f11d9429mr33176874a91.34.1730656988055;
        Sun, 03 Nov 2024 10:03:08 -0800 (PST)
Received: from hiago-nb ([2804:1b3:a7c0:1be5:78d:7a64:653a:de2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fbdfeeesm8189238a91.36.2024.11.03.10.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 10:03:07 -0800 (PST)
Date: Sun, 3 Nov 2024 15:03:04 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: Re: [oe-core][PATCH] drm-info: add recipe
Message-ID: <20241103180304.niem22k2km6krnoh@hiago-nb>
References: <20241101184156.2368109-1-hiagofranco@gmail.com>
 <CANNYZj-nmnzTFqPT2nCY2EWWirCpyo1Yw9gFUz9_=dMt3diYXA@mail.gmail.com>
 <20241101202323.4ld6jdczxaoxk6fb@hiago-nb>
 <CANNYZj_tFUibOLa5MUDLOSBvKt2F=bZqdk7q4_6besXMJ4pgHA@mail.gmail.com>
 <20241101233812.sus2trjtvv76xtwb@hiago-nb>
 <CANNYZj8xih5oKa2oC6DG3=J-Zwm7djrWS61p0v0cC-Z1RrA8MA@mail.gmail.com>
 <20241102145909.mbs2omdeef6n3sqe@hiago-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241102145909.mbs2omdeef6n3sqe@hiago-nb>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Nov 2024 18:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206666

On Sat, Nov 02, 2024 at 11:59:09AM -0300, Hiago De Franco wrote:
> On Sat, Nov 02, 2024 at 10:16:56AM +0100, Alexander Kanavin wrote:
> > Thanks, this does seem useful. I'd want input from people actively
> > working with graphics, but not sure who to ask.
> 
> Maybe Wang Mingyu could also comment here? I am not sure.

After checking more closely, this recipe should go to meta-oe instead. I
will send a proper patch to meta-oe, please do not merge this one into
oe-core. Sorry about the noise.

> 
> > 
> > Alex
> > 
> > On Sat, 2 Nov 2024 at 00:38, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > On Fri, Nov 01, 2024 at 09:35:27PM +0100, Alexander Kanavin wrote:
> > > > Perhaps you can show what the tool outputs?
> > >
> > > Sure, here is the output for qemu x86-64:
> > >
> > > root@qemux86-64:~# drm_info
> > > Node: /dev/dri/card0
> > > ├───Driver: bochs-drm (bochs dispi vga interface (qemu stdvga)) version 1.0.0 (201309)
> > > │   ├───DRM_CLIENT_CAP_STEREO_3D supported
> > > │   ├───DRM_CLIENT_CAP_UNIVERSAL_PLANES supported
> > > │   ├───DRM_CLIENT_CAP_ATOMIC supported
> > > │   ├───DRM_CLIENT_CAP_ASPECT_RATIO supported
> > > │   ├───DRM_CLIENT_CAP_WRITEBACK_CONNECTORS supported
> > > │   ├───DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT not supported
> > > │   ├───DRM_CAP_DUMB_BUFFER = 1
> > > │   ├───DRM_CAP_VBLANK_HIGH_CRTC = 1
> > > │   ├───DRM_CAP_DUMB_PREFERRED_DEPTH = 24
> > > │   ├───DRM_CAP_DUMB_PREFER_SHADOW = 0
> > > │   ├───DRM_CAP_PRIME = 3
> > > │   ├───DRM_CAP_TIMESTAMP_MONOTONIC = 1
> > > │   ├───DRM_CAP_ASYNC_PAGE_FLIP = 0
> > > │   ├───DRM_CAP_CURSOR_WIDTH = 64
> > > │   ├───DRM_CAP_CURSOR_HEIGHT = 64
> > > │   ├───DRM_CAP_ADDFB2_MODIFIERS = 1
> > > │   ├───DRM_CAP_PAGE_FLIP_TARGET = 0
> > > │   ├───DRM_CAP_CRTC_IN_VBLANK_EVENT = 1
> > > │   ├───DRM_CAP_SYNCOBJ = 0
> > > │   ├───DRM_CAP_SYNCOBJ_TIMELINE = 0
> > > │   └───DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP = 0
> > > ├───Device: PCI 1234:1111
> > > │   └───Available nodes: primary
> > > ├───Framebuffer size
> > > │   ├───Width: [0, 8192]
> > > │   └───Height: [0, 8192]
> > > ├───Connectors
> > > │   └───Connector 0
> > > │       ├───Object ID: 32
> > > │       ├───Type: virtual
> > > │       ├───Status: connected
> > > │       ├───Physical size: 320×200 mm
> > > │       ├───Subpixel: unknown
> > > │       ├───Encoders: {0}
> > > │       ├───Modes
> > > │       │   ├───1280×800@74.99 preferred driver nhsync nvsync
> > > │       │   ├───1920×1080@60.00 driver nhsync nvsync
> > > │       │   ├───1920×1080@50.00 driver phsync pvsync 16:9
> > > │       │   ├───1600×1200@60.00 driver phsync pvsync
> > > │       │   ├───1680×1050@59.95 driver nhsync pvsync
> > > │       │   ├───1400×1050@59.98 driver nhsync pvsync
> > > │       │   ├───1280×1024@60.02 driver phsync pvsync
> > > │       │   ├───1440×900@59.89 driver nhsync pvsync
> > > │       │   ├───1280×960@60.00 driver phsync pvsync
> > > │       │   ├───1360×768@60.02 driver phsync pvsync
> > > │       │   ├───1280×768@59.87 driver nhsync pvsync
> > > │       │   ├───1024×768@60.00 driver nhsync nvsync
> > > │       │   ├───800×600@60.32 driver phsync pvsync
> > > │       │   ├───640×480@60.00 driver nhsync nvsync 4:3
> > > │       │   └───640×480@59.94 driver nhsync nvsync
> > > │       └───Properties
> > > │           ├───"DPMS": enum {On, Standby, Suspend, Off} = On
> > > │           ├───"link-status": enum {Good, Bad} = Good
> > > │           ├───"non-desktop" (immutable): range [0, 1] = 0
> > > │           ├───"TILE" (immutable): blob = 0
> > > │           ├───"CRTC_ID" (atomic): object CRTC = 36
> > > │           └───"EDID" (immutable): blob = 33
> > > ├───Encoders
> > > │   └───Encoder 0
> > > │       ├───Object ID: 37
> > > │       ├───Type: none
> > > │       ├───CRTCS: {0}
> > > │       └───Clones: {0}
> > > ├───CRTCs
> > > │   └───CRTC 0
> > > │       ├───Object ID: 36
> > > │       ├───Legacy info
> > > │       │   ├───Mode: 1280×800@74.99 preferred driver nhsync nvsync
> > > │       │   └───Gamma size: 0
> > > │       └───Properties
> > > │           ├───"ACTIVE" (atomic): range [0, 1] = 1
> > > │           ├───"MODE_ID" (atomic): blob = 39
> > > │           │   └───1280×800@74.99 preferred driver nhsync nvsync
> > > │           ├───"OUT_FENCE_PTR" (atomic): range [0, UINT64_MAX] = 0
> > > │           └───"VRR_ENABLED": range [0, 1] = 0
> > > └───Planes
> > >     └───Plane 0
> > >         ├───Object ID: 34
> > >         ├───CRTCs: {0}
> > >         ├───Legacy info
> > >         │   ├───FB ID: 38
> > >         │   │   ├───Object ID: 38
> > >         │   │   ├───Size: 1280×800
> > >         │   │   ├───Format: XRGB8888 (0x34325258)
> > >         │   │   ├───Modifier: DRM_FORMAT_MOD_LINEAR (0x0000000000000000)
> > >         │   │   └───Planes:
> > >         │   │       └───Plane 0: offset = 0, pitch = 5120 bytes
> > >         │   └───Formats:
> > >         │       ├───XRGB8888 (0x34325258)
> > >         │       └───BGRX8888 (0x34325842)
> > >         └───Properties
> > >             ├───"type" (immutable): enum {Overlay, Primary, Cursor} = Primary
> > >             ├───"FB_ID" (atomic): object framebuffer = 38
> > >             │   ├───Object ID: 38
> > >             │   ├───Size: 1280×800
> > >             │   ├───Format: XRGB8888 (0x34325258)
> > >             │   ├───Modifier: DRM_FORMAT_MOD_LINEAR (0x0000000000000000)
> > >             │   └───Planes:
> > >             │       └───Plane 0: offset = 0, pitch = 5120 bytes
> > >             ├───"IN_FENCE_FD" (atomic): srange [-1, INT32_MAX] = -1
> > >             ├───"CRTC_ID" (atomic): object CRTC = 36
> > >             ├───"CRTC_X" (atomic): srange [INT32_MIN, INT32_MAX] = 0
> > >             ├───"CRTC_Y" (atomic): srange [INT32_MIN, INT32_MAX] = 0
> > >             ├───"CRTC_W" (atomic): range [0, INT32_MAX] = 1280
> > >             ├───"CRTC_H" (atomic): range [0, INT32_MAX] = 800
> > >             ├───"SRC_X" (atomic): range [0, UINT32_MAX] = 0
> > >             ├───"SRC_Y" (atomic): range [0, UINT32_MAX] = 0
> > >             ├───"SRC_W" (atomic): range [0, UINT32_MAX] = 1280
> > >             ├───"SRC_H" (atomic): range [0, UINT32_MAX] = 800
> > >             └───"IN_FORMATS" (immutable): blob = 35
> > >                 └───DRM_FORMAT_MOD_LINEAR (0x0000000000000000)
> > >                     ├───XRGB8888 (0x34325258)
> > >                     └───BGRX8888 (0x34325842)
> > >
> > > It is basically a dump with information about DRM devices.
> > >
> > > >
> > > > Alex
> > > >
> > > > On Fri 1. Nov 2024 at 21.23, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > >
> > > > > Hi Alexander,
> > > > >
> > > > > On Fri, Nov 01, 2024 at 08:22:03PM +0100, Alexander Kanavin wrote:
> > > > > > Should this go to meta-oe rather? Why core?
> > > > >
> > > > > I was not 100% sure, I just selected here because I saw the recipe for
> > > > > 'libdrm' and the 'recipes-graphics/drm'. I can move this to meta-oe if
> > > > > openembedded-core is not the correct place. Please let me know.
> > > > >
> > > > > >
> > > > > > Alex
> > > > > >
> > > > > > On Fri 1. Nov 2024 at 19.42, Hiago De Franco via lists.openembedded.org
> > > > > > <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > > > > >
> > > > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > >
> > > > > > > This recipe provides information about DRM devices, useful for
> > > > > debugging
> > > > > > > and checking information about DRM.
> > > > > > >
> > > > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > > ---
> > > > > > >  meta/conf/distro/include/maintainers.inc    |  1 +
> > > > > > >  meta/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
> > > > > > >  2 files changed, 14 insertions(+)
> > > > > > >  create mode 100644 meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > > >
> > > > > > > diff --git a/meta/conf/distro/include/maintainers.inc
> > > > > > > b/meta/conf/distro/include/maintainers.inc
> > > > > > > index 7aafa7a2d146..2c2779f8cf83 100644
> > > > > > > --- a/meta/conf/distro/include/maintainers.inc
> > > > > > > +++ b/meta/conf/distro/include/maintainers.inc
> > > > > > > @@ -156,6 +156,7 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi
> > > > > > > Zhao <yi.zhao@windriver.com>"
> > > > > > >  RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
> > > > > > >  RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
> > > > > > >  RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org
> > > > > >"
> > > > > > > +RECIPE_MAINTAINER:pn-drm-info = "Hiago De Franco <
> > > > > > > hiago.franco@toradex.com>"
> > > > > > >  RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
> > > > > > >  RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
> > > > > > >  RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <
> > > > > > > alex.kanavin@gmail.com>"
> > > > > > > diff --git a/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > > > b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..9f1cbb47fbfd
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > > > > @@ -0,0 +1,13 @@
> > > > > > > +SUMMARY = "Small utility to dump info about DRM devices"
> > > > > > > +HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
> > > > > > > +LICENSE = "MIT"
> > > > > > > +LIC_FILES_CHKSUM =
> > > > > "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
> > > > > > > +
> > > > > > > +SRC_URI = "git://
> > > > > > >
> > > > > gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
> > > > > > > +SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
> > > > > > > +
> > > > > > > +S = "${WORKDIR}/git"
> > > > > > > +
> > > > > > > +inherit meson pkgconfig
> > > > > > > +
> > > > > > > +DEPENDS = "json-c libdrm"
> > > > > > >
> > > > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > > > > Links: You receive all messages sent to this group.
> > > > > > > View/Reply Online (#206628):
> > > > > > > https://lists.openembedded.org/g/openembedded-core/message/206628
> > > > > > > Mute This Topic: https://lists.openembedded.org/mt/109340073/1686489
> > > > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > > > > [
> > > > > > > alex.kanavin@gmail.com]
> > > > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > > > >
> > > > > > >
> > > > >
> > > > > Regards,
> > > > >
> > > > > Hiago.
> > > > >
> > >
> > > Regards,
> > >
> > > Hiago.
> 
> Regards,
> 
> Hiago.

Regards,

Hiago.


Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF97E6F096
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 23:38:25 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.7608.1730504296895060727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 16:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BQezF/8d;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c77459558so22093755ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 16:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730504296; x=1731109096; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p6ffiDAgeWr8L4vFV1NpoWRoi898Pk/xSY6hxa+eg3o=;
        b=BQezF/8d+EignJYoc8S0xh5YyS0mzrwClwm95lGO7mO0phK47nFxwu3hqHJgEqLXew
         mufIfvDJMgHJxDk+/JHQXk1274aNrx4VDmXM/6m1E+RxeBrGPjo2/na/NK2zVfxvPjX2
         ETYdC3TwOebBT8Pc9xq+VexwI+R+nyZfLSzP68k5Zn897SPz6itwRehz8lujKzfCDtMB
         8k04Y6gYNhssC3LJUoBaUUWehRyrsyEW6ViMBMJkBP/q4STSXkUDPuzV2Wey3SroM3hk
         tI//XXVLF6HV7lyJOUM1V30M9pdPb8FTI4Q4NApgBnSkK7hH0KTPBy/4DQV/Pa63ns4d
         2etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730504296; x=1731109096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6ffiDAgeWr8L4vFV1NpoWRoi898Pk/xSY6hxa+eg3o=;
        b=ZzTeMgP+8EAjqilF/Owp0hQGjObi40gpYdeRLxy7clKx37jq8GbGnaheE2zYCXxVLI
         CTa0Km4zIC0RwKxQ++8LyGdAq7wAiwdyjFpqp42Sb7RipxV2VIRyofZbUDBeSut+GVON
         lvjLL/MxChue1aWaSTumRA/PtZDRDns6b/StjVpDk/bjXczth8djctQoF07c/jSibSxT
         VZ1YZYFplN4q2kRs905Mq/MpgkW+spjR/geoxAkESb7TJkHUVL1uYSRzUJMm2RfAYBqV
         25gt1z2Jk+2Sit9/8xKcjAgkfrapBudywJaZA4+IWEkV/lVExLMAsdgNy1SH0Uv38V0t
         4k5A==
X-Gm-Message-State: AOJu0YwB2mc2VEyv2DEex3bm82JQFsney7abIlrwEVl7lzFa4McdHkvF
	0EMHZRnBH3nmGqm870b8KtT+TYhWvuN1aybtX+U6EDYEn9fTN6Kt
X-Google-Smtp-Source: AGHT+IGsfD9xBREmkPexKr7uxQtVuQMGh0COOx+rgXzU2xW2PSlQUNQI/5Tm+OFFjE9wQudmpXQi1w==
X-Received: by 2002:a17:902:cec1:b0:20c:a19b:8ddd with SMTP id d9443c01a7336-210f76f2952mr174556925ad.51.1730504296210;
        Fri, 01 Nov 2024 16:38:16 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c0:1be5:de63:5f4c:54ed:27f0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a5bb8sm26108735ad.152.2024.11.01.16.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 16:38:15 -0700 (PDT)
Date: Fri, 1 Nov 2024 20:38:12 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [oe-core][PATCH] drm-info: add recipe
Message-ID: <20241101233812.sus2trjtvv76xtwb@hiago-nb>
References: <20241101184156.2368109-1-hiagofranco@gmail.com>
 <CANNYZj-nmnzTFqPT2nCY2EWWirCpyo1Yw9gFUz9_=dMt3diYXA@mail.gmail.com>
 <20241101202323.4ld6jdczxaoxk6fb@hiago-nb>
 <CANNYZj_tFUibOLa5MUDLOSBvKt2F=bZqdk7q4_6besXMJ4pgHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj_tFUibOLa5MUDLOSBvKt2F=bZqdk7q4_6besXMJ4pgHA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 23:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206641

On Fri, Nov 01, 2024 at 09:35:27PM +0100, Alexander Kanavin wrote:
> Perhaps you can show what the tool outputs?

Sure, here is the output for qemu x86-64:

root@qemux86-64:~# drm_info
Node: /dev/dri/card0
├───Driver: bochs-drm (bochs dispi vga interface (qemu stdvga)) version 1.0.0 (201309)
│   ├───DRM_CLIENT_CAP_STEREO_3D supported
│   ├───DRM_CLIENT_CAP_UNIVERSAL_PLANES supported
│   ├───DRM_CLIENT_CAP_ATOMIC supported
│   ├───DRM_CLIENT_CAP_ASPECT_RATIO supported
│   ├───DRM_CLIENT_CAP_WRITEBACK_CONNECTORS supported
│   ├───DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT not supported
│   ├───DRM_CAP_DUMB_BUFFER = 1
│   ├───DRM_CAP_VBLANK_HIGH_CRTC = 1
│   ├───DRM_CAP_DUMB_PREFERRED_DEPTH = 24
│   ├───DRM_CAP_DUMB_PREFER_SHADOW = 0
│   ├───DRM_CAP_PRIME = 3
│   ├───DRM_CAP_TIMESTAMP_MONOTONIC = 1
│   ├───DRM_CAP_ASYNC_PAGE_FLIP = 0
│   ├───DRM_CAP_CURSOR_WIDTH = 64
│   ├───DRM_CAP_CURSOR_HEIGHT = 64
│   ├───DRM_CAP_ADDFB2_MODIFIERS = 1
│   ├───DRM_CAP_PAGE_FLIP_TARGET = 0
│   ├───DRM_CAP_CRTC_IN_VBLANK_EVENT = 1
│   ├───DRM_CAP_SYNCOBJ = 0
│   ├───DRM_CAP_SYNCOBJ_TIMELINE = 0
│   └───DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP = 0
├───Device: PCI 1234:1111
│   └───Available nodes: primary
├───Framebuffer size
│   ├───Width: [0, 8192]
│   └───Height: [0, 8192]
├───Connectors
│   └───Connector 0
│       ├───Object ID: 32
│       ├───Type: virtual
│       ├───Status: connected
│       ├───Physical size: 320×200 mm
│       ├───Subpixel: unknown
│       ├───Encoders: {0}
│       ├───Modes
│       │   ├───1280×800@74.99 preferred driver nhsync nvsync
│       │   ├───1920×1080@60.00 driver nhsync nvsync
│       │   ├───1920×1080@50.00 driver phsync pvsync 16:9
│       │   ├───1600×1200@60.00 driver phsync pvsync
│       │   ├───1680×1050@59.95 driver nhsync pvsync
│       │   ├───1400×1050@59.98 driver nhsync pvsync
│       │   ├───1280×1024@60.02 driver phsync pvsync
│       │   ├───1440×900@59.89 driver nhsync pvsync
│       │   ├───1280×960@60.00 driver phsync pvsync
│       │   ├───1360×768@60.02 driver phsync pvsync
│       │   ├───1280×768@59.87 driver nhsync pvsync
│       │   ├───1024×768@60.00 driver nhsync nvsync
│       │   ├───800×600@60.32 driver phsync pvsync
│       │   ├───640×480@60.00 driver nhsync nvsync 4:3
│       │   └───640×480@59.94 driver nhsync nvsync
│       └───Properties
│           ├───"DPMS": enum {On, Standby, Suspend, Off} = On
│           ├───"link-status": enum {Good, Bad} = Good
│           ├───"non-desktop" (immutable): range [0, 1] = 0
│           ├───"TILE" (immutable): blob = 0
│           ├───"CRTC_ID" (atomic): object CRTC = 36
│           └───"EDID" (immutable): blob = 33
├───Encoders
│   └───Encoder 0
│       ├───Object ID: 37
│       ├───Type: none
│       ├───CRTCS: {0}
│       └───Clones: {0}
├───CRTCs
│   └───CRTC 0
│       ├───Object ID: 36
│       ├───Legacy info
│       │   ├───Mode: 1280×800@74.99 preferred driver nhsync nvsync
│       │   └───Gamma size: 0
│       └───Properties
│           ├───"ACTIVE" (atomic): range [0, 1] = 1
│           ├───"MODE_ID" (atomic): blob = 39
│           │   └───1280×800@74.99 preferred driver nhsync nvsync
│           ├───"OUT_FENCE_PTR" (atomic): range [0, UINT64_MAX] = 0
│           └───"VRR_ENABLED": range [0, 1] = 0
└───Planes
    └───Plane 0
        ├───Object ID: 34
        ├───CRTCs: {0}
        ├───Legacy info
        │   ├───FB ID: 38
        │   │   ├───Object ID: 38
        │   │   ├───Size: 1280×800
        │   │   ├───Format: XRGB8888 (0x34325258)
        │   │   ├───Modifier: DRM_FORMAT_MOD_LINEAR (0x0000000000000000)
        │   │   └───Planes:
        │   │       └───Plane 0: offset = 0, pitch = 5120 bytes
        │   └───Formats:
        │       ├───XRGB8888 (0x34325258)
        │       └───BGRX8888 (0x34325842)
        └───Properties
            ├───"type" (immutable): enum {Overlay, Primary, Cursor} = Primary
            ├───"FB_ID" (atomic): object framebuffer = 38
            │   ├───Object ID: 38
            │   ├───Size: 1280×800
            │   ├───Format: XRGB8888 (0x34325258)
            │   ├───Modifier: DRM_FORMAT_MOD_LINEAR (0x0000000000000000)
            │   └───Planes:
            │       └───Plane 0: offset = 0, pitch = 5120 bytes
            ├───"IN_FENCE_FD" (atomic): srange [-1, INT32_MAX] = -1
            ├───"CRTC_ID" (atomic): object CRTC = 36
            ├───"CRTC_X" (atomic): srange [INT32_MIN, INT32_MAX] = 0
            ├───"CRTC_Y" (atomic): srange [INT32_MIN, INT32_MAX] = 0
            ├───"CRTC_W" (atomic): range [0, INT32_MAX] = 1280
            ├───"CRTC_H" (atomic): range [0, INT32_MAX] = 800
            ├───"SRC_X" (atomic): range [0, UINT32_MAX] = 0
            ├───"SRC_Y" (atomic): range [0, UINT32_MAX] = 0
            ├───"SRC_W" (atomic): range [0, UINT32_MAX] = 1280
            ├───"SRC_H" (atomic): range [0, UINT32_MAX] = 800
            └───"IN_FORMATS" (immutable): blob = 35
                └───DRM_FORMAT_MOD_LINEAR (0x0000000000000000)
                    ├───XRGB8888 (0x34325258)
                    └───BGRX8888 (0x34325842)

It is basically a dump with information about DRM devices.

> 
> Alex
> 
> On Fri 1. Nov 2024 at 21.23, Hiago De Franco <hiagofranco@gmail.com> wrote:
> 
> > Hi Alexander,
> >
> > On Fri, Nov 01, 2024 at 08:22:03PM +0100, Alexander Kanavin wrote:
> > > Should this go to meta-oe rather? Why core?
> >
> > I was not 100% sure, I just selected here because I saw the recipe for
> > 'libdrm' and the 'recipes-graphics/drm'. I can move this to meta-oe if
> > openembedded-core is not the correct place. Please let me know.
> >
> > >
> > > Alex
> > >
> > > On Fri 1. Nov 2024 at 19.42, Hiago De Franco via lists.openembedded.org
> > > <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > >
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > >
> > > > This recipe provides information about DRM devices, useful for
> > debugging
> > > > and checking information about DRM.
> > > >
> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > ---
> > > >  meta/conf/distro/include/maintainers.inc    |  1 +
> > > >  meta/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
> > > >  2 files changed, 14 insertions(+)
> > > >  create mode 100644 meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > >
> > > > diff --git a/meta/conf/distro/include/maintainers.inc
> > > > b/meta/conf/distro/include/maintainers.inc
> > > > index 7aafa7a2d146..2c2779f8cf83 100644
> > > > --- a/meta/conf/distro/include/maintainers.inc
> > > > +++ b/meta/conf/distro/include/maintainers.inc
> > > > @@ -156,6 +156,7 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi
> > > > Zhao <yi.zhao@windriver.com>"
> > > >  RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
> > > >  RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
> > > >  RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org
> > >"
> > > > +RECIPE_MAINTAINER:pn-drm-info = "Hiago De Franco <
> > > > hiago.franco@toradex.com>"
> > > >  RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
> > > >  RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
> > > >  RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <
> > > > alex.kanavin@gmail.com>"
> > > > diff --git a/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > new file mode 100644
> > > > index 000000000000..9f1cbb47fbfd
> > > > --- /dev/null
> > > > +++ b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > > @@ -0,0 +1,13 @@
> > > > +SUMMARY = "Small utility to dump info about DRM devices"
> > > > +HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
> > > > +LICENSE = "MIT"
> > > > +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
> > > > +
> > > > +SRC_URI = "git://
> > > >
> > gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
> > > > +SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +inherit meson pkgconfig
> > > > +
> > > > +DEPENDS = "json-c libdrm"
> > > >
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#206628):
> > > > https://lists.openembedded.org/g/openembedded-core/message/206628
> > > > Mute This Topic: https://lists.openembedded.org/mt/109340073/1686489
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [
> > > > alex.kanavin@gmail.com]
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > >
> > > >
> >
> > Regards,
> >
> > Hiago.
> >

Regards,

Hiago.


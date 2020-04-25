Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.1103.1587841250290000515
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 12:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r1nerGhM;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id x4so14983947wmj.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GUrMdX3Z1VvGPxTnMqvg87FCGpGYa3ClD3725btFIFM=;
        b=r1nerGhMSbH+jG3fuY0IP6TCaTw7SVt8L0vJ+Bvb20uGddnzm5DPRTOrxDwEPHFVWj
         XSWnX+RNJ/Hoyyr5RBmcSerpNIARGIPsW0rh8oQXD7RpV0DhOiGtZgmwBwRK3en7vegx
         NsAQ88INhmT/VwW42kczBeyTmkiMs/qfs5uXlrEU6Avrw162FMRga86j2WR4uDFfRDmM
         wg0UJNnmvYPOsIs101KbOLuzqv4TutalloznQo4G7Hg5Cfuzv99oGtq/t2kHC3rewbw9
         dsgE13MmNtGaw+oJ7jV/cTMbW3k84c0Pj5yIgqM/y0iWfWBk4dUR2tSHQ7jnMVZ8M+bD
         mlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GUrMdX3Z1VvGPxTnMqvg87FCGpGYa3ClD3725btFIFM=;
        b=NJxnMAnVBkBeZOW1fTyEF5c7WdZPrNfy39Hb05WjZZtjIndRkBEqzbJvp/iU1x/pdV
         xpYDc0lyy4isJN7tUBL9TaVP4xVeczCvx8DJy0dKSc6wLYpQAKI+FqeHfwnRPNdcE4cK
         A5IuxCvqRsPvW2wCpB2d1fL9W0Mqe3D9DB7Qld1RaURxJCIarU6pRSPSFEVS+B8aWU71
         AkK4qrlAujGDXPb5pjGOspX+bQw+qKs09oF7HV8BPqbFFvR64oIGBGNhH+ENo6f1Uigh
         kXXZkJJ+4x7r0BHWcgwf8lRcIo4Bl/+LIsIRH2DlfuUtV30x3aMkG2ltDFzZ9q8hLzv3
         EiZA==
X-Gm-Message-State: AGi0Puak6HJitJnSatLkvVG/d3lQasiVUgt66t6LMVf/ou2q0pwU+hGL
	PTZQLamxam2NgjdfSlhtu8AUJ1Lw
X-Google-Smtp-Source: APiQypIuk/sFTUxlq/CnJD6Ql86cWKCu+F7pfAUknyumwA1gD/EuYry+VTacU4JIx5cNQJRdmoA2/A==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr16889997wmg.36.1587841248192;
        Sat, 25 Apr 2020 12:00:48 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id n25sm3494135wmk.9.2020.04.25.12.00.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 12:00:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] virgl: enable in qemu when 'opengl' is in DISTRO_FEATURES
Date: Sat, 25 Apr 2020 21:00:15 +0200
Message-Id: <cover.1587841042.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virgl is a virtualized accelerated 3D graphics support for the qemu
guests. This patchset enables virgl in qemu, when 'opengl' is in
DISTRO_FEATURES. Virgl is entirely opt-in (via non-default options
to 'runqemu'). By default qemu behaves exactly as before, and does
not use virgl.

This adds a few native dependencies to qemu-system-native
(particularly, libdrm, virglrenderer and a special minimal configuration
of mesa-native). I tested the impact on build times: it is about 20
seconds on a 32 core machine. 'bitbake core-image-minimal' goes from
22m23s to 22m44s.

The following changes since commit f9e11276432f1903047f483a68ca4b5a0d6c6111:

  Updated patch for publishing (2020-04-24 15:21:14 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/qemu-split-virgl-gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/qemu-split-virgl-gtk

Alexander Kanavin (3):
  bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk
    from target
  libsdl2: enable opengl option for native/nativesdk, subject to
    'opengl' in DISTRO_FEATURES
  qemu: enable virglrenderer and glx options subject to 'opengl'
    DISTRO_FEATURE

 meta/conf/bitbake.conf                         |  4 ++--
 meta/lib/oeqa/selftest/cases/runtime_test.py   | 18 ++++++------------
 .../qemu/qemu-system-native_4.2.0.bb           |  4 +++-
 meta/recipes-devtools/qemu/qemu_4.2.0.bb       |  5 ++++-
 meta/recipes-gnome/gtk+/gtk+3.inc              |  2 ++
 meta/recipes-graphics/cairo/cairo_1.16.0.bb    |  2 ++
 .../libepoxy/libepoxy_1.5.4.bb                 |  2 --
 .../recipes-graphics/libsdl2/libsdl2_2.0.12.bb |  4 ++--
 .../virglrenderer/virglrenderer_0.8.2.bb       |  2 --
 9 files changed, 21 insertions(+), 22 deletions(-)

-- 
2.26.1


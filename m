Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8F1C48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.17928.1708013893055206606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YefZT2vY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1db562438e0so8821045ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013892; x=1708618692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=r5oJC/uZKlicUIsrlPrUBNJHSCI0jAS4Yd3UqmqIeEE=;
        b=YefZT2vY1twTbFa3KiyXLOHjMuoUG7apMkj/CopW89YQOxs0VjLFdTr7Pm34tVlFLS
         oL7yWUNxDff/RQ9EU3JzrCPW6Qv+wNPcxXREt9wPqvX0HuE3YcTdceFtXO3j7JsC/UCE
         b6YA64NP5/l+FFkGjB4ViGrz2G99CD7ferZDNCXv2OLBFA96PXEj/wD+uWvk390ZLu6D
         Ki4LXfyIAURrEIMFjKIB6eSgyo4w8AphQvDWYiT4Y2EEceLgICUc+Szn91qTZeNjBMpp
         4ODUATKcOYOdpLZJ++i1rv5cLOnB+2cgjAPjptA3tTwVpEz8HjnBO67rT2ZBPMTgAOah
         Ll/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013892; x=1708618692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5oJC/uZKlicUIsrlPrUBNJHSCI0jAS4Yd3UqmqIeEE=;
        b=biBVrsRtf/Bja7WwceuQVSbXBrNC0ct2EcG/VnP5sgZAz/peRLwpffXTZyShkYnFy5
         55FqRtvd9IiSEhbagYeS14E15pPKLWhVrkYoxwV3HhE/CBPuNVFUL8tMbcn/rLgk777s
         GivhJd83XTZs/C9JNJvsBHcVG6SyWFgVsBX4eRow2g+UJGWA/+clWDNz+u7wt9iDW2ZB
         ia+dxsvzcCA4m7S+2yxxc4JdkZJ6GVVW5kuoW7PPhCk9YjtHGF2dacoHaja2B3gNAqkB
         rqiJIXUtYzLUlVQrcJzaLUY9pLviJObIX76ATY0VIJ2wLsPrk+Z/XnTpb9/Oi2idlSfE
         dODQ==
X-Gm-Message-State: AOJu0YyrDn2ZSbJRB98d0H6SJId6X5N379jMlRf0SNQm31LGsXREhyNn
	8C9+so/iCEnaQ5NOqWq0HM+10Uru+odE4vIdN4dqmji3d29iktPSYhZ0dUnIeCpyEw13kpyDJsH
	Jca4=
X-Google-Smtp-Source: AGHT+IF1Mj+YDH4vfiE4IRIdkH3bZqn/wiEjvmo+u0gOB6exzOawS4/l6cni2z/MoXgJGkmF/Ayvcg==
X-Received: by 2002:a17:903:22c6:b0:1d9:95c5:296e with SMTP id y6-20020a17090322c600b001d995c5296emr2572948plg.53.1708013892030;
        Thu, 15 Feb 2024 08:18:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 00/21] Patch review
Date: Thu, 15 Feb 2024 06:17:43 -1000
Message-Id: <cover.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195520

Please review this set of changes for nanbield and have comments back by
end of day Monday, February 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6568

The following changes since commit 0584d01f623e1f9b0fef4dfa95dd66de6cbfb7b3:

  build-appliance-image: Update to nanbield head revision (2024-02-08 03:49:03 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Alexander Sverdlin (1):
  linux-firmware: upgrade 20231030 -> 20231211

Benjamin Bara (1):
  glibc: stable 2.38 branch updates

Chen Qi (1):
  multilib_global.bbclass: fix parsing error with no kernel module split

Jonathan GUILLOT (1):
  udev-extraconf: fix unmount directories containing octal-escaped chars

Julien Stephan (1):
  externalsrc: fix task dependency for do_populate_lic

Kai Kang (1):
  xserver-xorg: 21.1.9 -> 21.1.11

Peter Marko (1):
  zlib: ignore CVE-2023-6992

Richard Purdie (3):
  allarch: Fix allarch corner case
  reproducible: Fix race with externalsrc/devtool over lockfile
  pseudo: Update to pull in gcc14 fix and missing statvfs64 intercept

Robert Joslyn (1):
  gtk: Set CVE_PRODUCT

Ross Burton (3):
  libssh2: backport fix for CVE-2023-48795
  cve_check: handle CVE_STATUS being set to the empty string
  cve_check: cleanup logging

Simone Weiß (1):
  gcc: Update status of CVE-2023-4039

Wang Mingyu (3):
  at-spi2-core: upgrade 2.50.0 -> 2.50.1
  cpio: upgrade 2.14 -> 2.15
  gstreamer: upgrade 1.22.8 -> 1.22.9

Yogita Urade (2):
  tiff: fix CVE-2023-6228
  tiff: fix CVE-2023-52355 and CVE-2023-52356

baruch@tkos.co.il (1):
  overlayfs: add missing closing parenthesis in selftest

 .../overlayfs-user/overlayfs-user.bb          |   2 +-
 meta/classes-recipe/allarch.bbclass           |   4 +-
 meta/classes/externalsrc.bbclass              |   1 +
 meta/classes/multilib_global.bbclass          |   1 +
 meta/lib/oe/cve_check.py                      |  17 +-
 meta/lib/oe/reproducible.py                   |   3 +
 meta/recipes-core/glibc/glibc-version.inc     |   5 +-
 .../recipes-core/udev/udev-extraconf/mount.sh |   2 +-
 meta/recipes-core/zlib/zlib_1.3.bb            |   1 +
 meta/recipes-devtools/gcc/gcc-13.2.inc        |   1 +
 .../pseudo/files/glibc238.patch               |  13 -
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../cpio/{cpio_2.14.bb => cpio_2.15.bb}       |   3 +-
 ...e-needed-header-for-major-minor-macr.patch |  48 --
 meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb      |   2 +
 meta/recipes-gnome/gtk+/gtk4_4.12.3.bb        |   2 +
 ...xorg_21.1.9.bb => xserver-xorg_21.1.11.bb} |   2 +-
 ...20231030.bb => linux-firmware_20231211.bb} |   7 +-
 ...tools_1.22.8.bb => gst-devtools_1.22.9.bb} |   2 +-
 ...1.22.8.bb => gstreamer1.0-libav_1.22.9.bb} |   2 +-
 ...x_1.22.8.bb => gstreamer1.0-omx_1.22.9.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.22.9.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.22.9.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.22.9.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.22.9.bb} |   3 +-
 ....22.8.bb => gstreamer1.0-python_1.22.9.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.22.9.bb} |   2 +-
 ...1.22.8.bb => gstreamer1.0-vaapi_1.22.9.bb} |   2 +-
 ...er1.0_1.22.8.bb => gstreamer1.0_1.22.9.bb} |   2 +-
 .../libtiff/tiff/CVE-2023-52355-0001.patch    | 238 +++++++++
 .../libtiff/tiff/CVE-2023-52355-0002.patch    |  28 ++
 .../libtiff/tiff/CVE-2023-52356.patch         |  49 ++
 .../libtiff/tiff/CVE-2023-6228.patch          |  31 ++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |   4 +
 ...-core_2.50.0.bb => at-spi2-core_2.50.1.bb} |   2 +-
 .../libssh2/libssh2/CVE-2023-48795.patch      | 466 ++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.0.bb |   1 +
 37 files changed, 864 insertions(+), 94 deletions(-)
 rename meta/recipes-extended/cpio/{cpio_2.14.bb => cpio_2.15.bb} (94%)
 delete mode 100644 meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.9.bb => xserver-xorg_21.1.11.bb} (92%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231030.bb => linux-firmware_20231211.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.8.bb => gst-devtools_1.22.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.8.bb => gstreamer1.0-libav_1.22.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.8.bb => gstreamer1.0-omx_1.22.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.8.bb => gstreamer1.0-plugins-bad_1.22.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.8.bb => gstreamer1.0-plugins-base_1.22.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.8.bb => gstreamer1.0-plugins-good_1.22.9.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.8.bb => gstreamer1.0-plugins-ugly_1.22.9.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.8.bb => gstreamer1.0-python_1.22.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.8.bb => gstreamer1.0-rtsp-server_1.22.9.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.8.bb => gstreamer1.0-vaapi_1.22.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.8.bb => gstreamer1.0_1.22.9.bb} (97%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.50.0.bb => at-spi2-core_2.50.1.bb} (95%)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch

-- 
2.34.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB7ACCA487
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:09 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.4017.1657773364375872794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Vh2IrDd9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id x184so829733pfx.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nWaWn98E5e6+Na+k/2o2EduNOtJsx0Lf3dPZTGVhVVY=;
        b=Vh2IrDd9FYmIh+uOOHK+JDpb+n0x+CiUBH8bma8LOU5ieasb4nd3CS0e0rkARC9E0Q
         Yq6mGJCIafUsuVTWARrmwoxfCj8ZiKimxM2k7K4QrnsQbiWcIvE3ooaVkE/9I/0+QToP
         IUuEESuUhxUb0de+EN6/txgGDHMHQo8Q/Puzwi6xYV4+U5NosVClAZjvwz4uJt+RYlsL
         wYp35r8MEKLrpXbMrmdRYSTDx5TcM3l3Ztj4ajgmUWXDvrJy3fLOtCLdj7UWK19jTciH
         W4z0sEs8v5nAXs4dqMmHS2SKtdKwFhTQCYhiOOhljaDGR5nsugL1lxCjEbmp5DWUhWfN
         dZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nWaWn98E5e6+Na+k/2o2EduNOtJsx0Lf3dPZTGVhVVY=;
        b=XLk81RTLezNtxu1N5eMEy0HaJ51t2GWnbskkbGWxvSZ3Bw0TUHKoI+9yhr84tnoC4E
         zYQ7tYY+rstTVUFy98e0qasYg2L7ptik0kF9KCrl/3uaAUB3WdJQH6eTPfB98pNKNwjd
         hQvvetM9WMg9gJccQ1swfG6yMn20a7P2bsrq8msIjNovSrCG8Q8D4NhfeYBXWYucMht4
         vKD6/f/yO4eVF/Mo1sKt77YQVDWQ6L6s4mOSSYSM0gRm04X4mKqv/9LZNAHAr6I2Gj4U
         tt4Qkc0lmIIaPgYN5WJiKZkRFrm0xKNTsMFDCm0rmurfJcBXmlWcqIfj67oZX44k7jO4
         G3kA==
X-Gm-Message-State: AJIora/KLxToVypAuBZiw6sFNnem/fqk+3yffGr2ojZG2bTyMT4g9JHX
	8FJbJ/Hof0AnsL4giBkAnMqT2lRpcxSFMAlV
X-Google-Smtp-Source: 
 AGRyM1tUvR0Vt3/cQ30nztL8X/Qz13k1pKMKZBblr/Wuc9TTq5OeHzVGdFr7XnwQeEJYywbJKKR4lg==
X-Received: by 2002:a05:6a00:1d8f:b0:52a:b787:b480 with SMTP id
 z15-20020a056a001d8f00b0052ab787b480mr6661658pfw.71.1657773362816;
        Wed, 13 Jul 2022 21:36:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/27] Patch review
Date: Wed, 13 Jul 2022 18:35:20 -1000
Message-Id: <cover.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167997

Please review this set of patches for kirkstone and have comments back by end
of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3911

with the exception of an intermittent autobuilder issue on qemumips-alt which
passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3279

The following changes since commit 4667abcc925ae0c430cccb480ec530506f6201ae:

  dropbear: break dependency on base package for -dev package (2022-07-01 08:35:07 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (6):
  openssl: update 3.0.4 -> 3.0.5
  gstreamer1.0: upgrade 1.20.2 -> 1.20.3
  weston: update 10.0.0 -> 10.0.1
  glib-2.0: upgrade 2.72.2 -> 2.72.3
  glib-networking: upgrade 2.72.0 -> 2.72.1
  libsoup: upgrade 3.0.6 -> 3.0.7

Richard Purdie (2):
  qemu: Avoid accidental librdmacm linkage
  glibc-tests: Avoid reproducibility issues

Ross Burton (2):
  tiff: backport the fix for CVE-2022-2056, CVE-2022-2057, and
    CVE-2022-2058
  vim: upgrade to 9.0.0021

Sakib Sajal (1):
  u-boot: fix CVE-2022-34835

Steve Sakoman (3):
  ruby: add PACKAGECONFIG for capstone
  qemu: add PACKAGECONFIG for capstone
  qemu: Avoid accidental libvdeplug linkage

Sundeep KOKKONDA (2):
  glibc: stable 2.35 branch updates
  binutils : stable 2.38 branch updates

Wentao Zhang (1):
  harfbuzz: fix CVE-2022-33068

wangmy (10):
  gst-devtools: upgrade 1.20.2 -> 1.20.3
  gstreamer1.0-libav: upgrade 1.20.2 -> 1.20.3
  gstreamer1.0-omx: upgrade 1.20.2 -> 1.20.3
  gstreamer1.0-plugins-bad: upgrade 1.20.2 -> 1.20.3
  gstreamer1.0-plugins-base: upgrade 1.20.2 -> 1.20.3
  gstreamer1.0-plugins-good: upgrade 1.20.2 -> 1.20.3
  gstreamer1.0-plugins-ugly: upgrade 1.20.2 -> 1.20.3
  gstreamer1.0-python: upgrade 1.20.2 -> 1.20.3
  gstreamer1.0-rtsp-server: upgrade 1.20.2 -> 1.20.3
  gstreamer1.0-vaapi: upgrade 1.20.2 -> 1.20.3

 ...ffer-overflow-vulnerability-in-i2c-m.patch | 126 ++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   1 +
 .../{openssl_3.0.4.bb => openssl_3.0.5.bb}    |   2 +-
 .../glib-2.0/glib-2.0/relocate-modules.patch  |   2 +-
 ...{glib-2.0_2.72.2.bb => glib-2.0_2.72.3.bb} |   2 +-
 ...ng_2.72.0.bb => glib-networking_2.72.1.bb} |   2 +-
 meta/recipes-core/glibc/glibc-tests_2.35.bb   |   3 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/reproducible-paths.patch      |  23 +++
 .../binutils/binutils-2.38.inc                |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 meta/recipes-devtools/ruby/ruby_3.1.2.bb      |   1 +
 .../harfbuzz/harfbuzz/CVE-2022-33068.patch    |  35 ++++
 .../harfbuzz/harfbuzz_4.0.1.bb                |   3 +-
 .../{weston_10.0.0.bb => weston_10.0.1.bb}    |   4 +-
 ...tools_1.20.2.bb => gst-devtools_1.20.3.bb} |   2 +-
 ...1.20.2.bb => gstreamer1.0-libav_1.20.3.bb} |   2 +-
 ...x_1.20.2.bb => gstreamer1.0-omx_1.20.3.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.3.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.3.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.3.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.3.bb} |   2 +-
 ....20.2.bb => gstreamer1.0-python_1.20.3.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.3.bb} |   2 +-
 ...1.20.2.bb => gstreamer1.0-vaapi_1.20.3.bb} |   2 +-
 ...er1.0_1.20.2.bb => gstreamer1.0_1.20.3.bb} |   2 +-
 ...-the-FPE-in-tiffcrop-415-427-and-428.patch | 182 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 .../{libsoup_3.0.6.bb => libsoup_3.0.7.bb}    |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 30 files changed, 399 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.4.bb => openssl_3.0.5.bb} (99%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.2.bb => glib-2.0_2.72.3.bb} (96%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.72.0.bb => glib-networking_2.72.1.bb} (93%)
 create mode 100644 meta/recipes-core/glibc/glibc/reproducible-paths.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch
 rename meta/recipes-graphics/wayland/{weston_10.0.0.bb => weston_10.0.1.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.2.bb => gst-devtools_1.20.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.2.bb => gstreamer1.0-libav_1.20.3.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.2.bb => gstreamer1.0-omx_1.20.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.2.bb => gstreamer1.0-plugins-bad_1.20.3.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.2.bb => gstreamer1.0-plugins-base_1.20.3.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.2.bb => gstreamer1.0-plugins-good_1.20.3.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.2.bb => gstreamer1.0-plugins-ugly_1.20.3.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.2.bb => gstreamer1.0-python_1.20.3.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.2.bb => gstreamer1.0-rtsp-server_1.20.3.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.2.bb => gstreamer1.0-vaapi_1.20.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.2.bb => gstreamer1.0_1.20.3.bb} (97%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch
 rename meta/recipes-support/libsoup/{libsoup_3.0.6.bb => libsoup_3.0.7.bb} (94%)

-- 
2.25.1



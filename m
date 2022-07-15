Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6E9C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 21:49:18 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.2527.1657921752860050852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 14:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RbwD/EoK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id bf13so5501925pgb.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 14:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xotA89nyF5UXm9XTmn1cnwKq9p2Tl95XGpttrGi1Ir4=;
        b=RbwD/EoKukXPhvEkg+4PyOPcGA/itPuAMkZ92JfDYHZM8z60YWVnukKNyc/9f7PKUx
         6l0oiXPCgYGe+PmZ2VLCeOxhDVVWKKA/vCkd9+KVjti8xZF4j7ol9oSCUJjnhHfGOVvf
         R5C2EwHiFHo0Nd2eirLUqh6nPdFq2/epT97iMW6y+6du+b2B02PCavyvG974X2NqghAC
         6ffZbTDJ3zOsLQiCK9mV8ZFhV2Q8g9XDj9GfR/qJ3ZY/h4K6R8PM2+ggjlqrvtWwpOSP
         3GlQjAIOndIEQtNIazu4WXwWUQ3Yljw91FvPYvG5FlDe8vaDdbHaVLkkWcEAaq+5mVuY
         1syQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xotA89nyF5UXm9XTmn1cnwKq9p2Tl95XGpttrGi1Ir4=;
        b=Wm6GE9gaMo5dqZKK9SUolMX8dqFe4GefWalnLhLJcqDEkI2hZw+mJQc12uK/BHX2D4
         9zm4xBTONTOb1wgTgiwOZazZX92nHLuQPufxrYplC7QKZM1i0Xlx81avJN82XZ17BAhU
         HkiFwmIV7QBz40QBYlHmOTf57URmdr86QPlgpUa/IJ6ENuUzR4XkX/YlrHfdVVDo7CsZ
         zySCdJw7RqhwtBOVvkBClvx7KjBeN6fBbr565GdVkld4l0UmbaQR/ZY0nUTqoKxOk3IF
         mrUYxhA+JlxGQqPaDeL80NoUZ2W5mE+8TNOtnZB5Iv26o2kLSXnURvKFqU5LgEkRDEsq
         +K4A==
X-Gm-Message-State: AJIora+d0jLCo5feOOXZ2ORG4IEGk5q4y81oOaFapyzxoqdnjgjHLd9V
	Bw0TgRSURoM4Wvb0OvyR2HUokuKQdX+8P6Jf
X-Google-Smtp-Source: 
 AGRyM1sazR1c2sh/Zl3DfNkwwRJ/8RbQSBWnG0shJ1jlMpeTZiwgmzUNKSe+RYXF/ozvCoxQa/RzEA==
X-Received: by 2002:a63:6bc1:0:b0:40d:ffa7:9dc3 with SMTP id
 g184-20020a636bc1000000b0040dffa79dc3mr14344350pgc.111.1657921751555;
        Fri, 15 Jul 2022 14:49:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 lp2-20020a17090b4a8200b001e87bd6f6c2sm6209495pjb.50.2022.07.15.14.49.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 14:49:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/27] Pull request (cover letter only)
Date: Fri, 15 Jul 2022 11:48:59 -1000
Message-Id: <cover.1657921656.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 21:49:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168140

The following changes since commit 4667abcc925ae0c430cccb480ec530506f6201ae:

  dropbear: break dependency on base package for -dev package (2022-07-01 08:35:07 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

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



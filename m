Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7E7C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:07 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.46635.1674657726281230072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=HZBiI8r5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id jl3so18052462plb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEnwYEMW7ZK1EqL+xHZFfzQtX5xgk/XeGJI9rXxI5ko=;
        b=HZBiI8r5KcdcnggIppiiO3iu+b8BbTtkai74Wj/nwGJlm1uSQVAlL8spAUR0QxwicK
         ojoOseCaWuYdHLur/3ry0+8VfpZk6ETfRdSnjCi40bKPk+nv+Vgi8InqzvEl5A55jUB/
         Crgfa8/EorgUiXA/GxWLQJE1llBTwXqKW/Jcw/5BvIePhnVvPXy+IwKDK6iTPnxe47oK
         yDRpD2uRc82wJIkx+hPev/7A/HJ2k5xnlP9CngPScrZZg83VIKerLXA62HTksbXkk/wv
         NGLw6fAS+iAjTDs7izijyCFpFi5NyJF4KO6218nuELC3paBUNyYNClDPRZ6cQMYl/FoP
         bujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEnwYEMW7ZK1EqL+xHZFfzQtX5xgk/XeGJI9rXxI5ko=;
        b=pgeVa+dHo7BTEL3HGKCv0KgNms9++pBwGkHlHekB6tLPeDCT0iyOEVljDYXRAjoJyP
         +0D0tSkWxcGV3mv0vq1TRb8hjP0wxnUaZCsGsjWTKQqWxvWr5tnhAB7iUaWUEwt/NsMo
         hvHHhBfFV99J5CyEMEXwWVe2Fd376fFRq0/C6kbNDiVszOzZqfm13schn6iv/KWCRZv/
         rRLiNSeNXR5i1FwvOtfeGjqIlr6xFtX9K6maYqEHONuW5OWO+sVwiRCxPnuWC+oeZf/D
         Cto+tFosQcyLizMEyuuKpOSAH3V3WWk0bObgF1whbx3mBNkEoah/wzrNorZ3mCeOS+/s
         h3+Q==
X-Gm-Message-State: AFqh2kpAlm0mKKE5MYt7twnUNI7nCeYJMBk+4Zh9K+CucTdSCgPFXDIn
	cO1P7LxeF9ppoTSci+6oQaFaZYdbrowHtejCzaY=
X-Google-Smtp-Source: AMrXdXtopKGTZ06wdqOBIAJ0KfEiqGxdqi3tt2xD3NaY6dSQTJSNzRESuMPNO2frPoM0S8Ba8HZQZw==
X-Received: by 2002:a05:6a21:339a:b0:b6:4270:6dfc with SMTP id yy26-20020a056a21339a00b000b642706dfcmr41922220pzb.6.1674657725029;
        Wed, 25 Jan 2023 06:42:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Patch review
Date: Wed, 25 Jan 2023 04:41:43 -1000
Message-Id: <cover.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176351

Please review this set of patches for dunfell and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4828

with the exception of a known autobuilder intermittent issue on qemuppc:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14824

which passed on subsequent re-test:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/6517

The following changes since commit db81e3c7e7f1d4d9eba52ac35ac97627d0240b63:

  build-appliance-image: Update to dunfell head revision (2023-01-13 18:11:40 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (2):
  linux-firmware: upgrade 20221109 -> 20221214
  selftest/virgl: use pkg-config from the host

Benoît Mauduit (1):
  lib/oe/reproducible: Use git log without gpg signature

Bhabu Bindu (1):
  ffmpeg: Fix CVE-2022-3109

Hitendra Prajapati (2):
  QEMU: CVE-2022-4144 QXL: qxl_phys2virt unsafe address translation can
    lead to out-of-bounds read
  xserver-xorg: Fix Multiple CVEs

Jan Kircher (1):
  toolchain-scripts: compatibility with unbound variable protection

Jermain Horsman (1):
  cve-check: write the cve manifest to IMGDEPLOYDIR

Marta Rybczynska (1):
  cve-update-db-native: avoid incomplete updates

Niko Mauno (1):
  systemd: Consider PACKAGECONFIG in RRECOMMENDS

Quentin Schulz (1):
  cairo: fix CVE patches assigned wrong CVE number

Randy MacLeod (1):
  vim: upgrade 9.0.0947 -> 9.0.1211

Ross Burton (2):
  cve-update-db-native: add more logging when fetching
  cve-update-db-native: show IP on failure

Steve Sakoman (1):
  python3: fix packaging of Windows distutils installer stubs

jan (1):
  cve-update-db-native: Allow to overrule the URL in a bbappend.

 meta/classes/cve-check.bbclass                |   6 +-
 meta/classes/toolchain-scripts.bbclass        |   2 +-
 meta/lib/oe/reproducible.py                   |   3 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +-
 .../recipes-core/meta/cve-update-db-native.bb |  97 ++++++++++++-----
 meta/recipes-core/systemd/systemd_244.5.bb    |   4 +-
 .../python/python3/python3-manifest.json      |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
 .../cairo/cairo/CVE-2019-6461.patch           |  46 +++-----
 .../cairo/cairo/CVE-2019-6462.patch           |  46 +++++---
 .../xserver-xorg/CVE-2022-4283.patch          |  39 +++++++
 .../xserver-xorg/CVE-2022-46340.patch         |  55 ++++++++++
 .../xserver-xorg/CVE-2022-46341.patch         |  86 +++++++++++++++
 .../xserver-xorg/CVE-2022-46342.patch         |  78 +++++++++++++
 .../xserver-xorg/CVE-2022-46343.patch         |  51 +++++++++
 .../xserver-xorg/CVE-2022-46344.patch         |  75 +++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   8 +-
 ...20221109.bb => linux-firmware_20221214.bb} |   4 +-
 .../ffmpeg/ffmpeg/CVE-2022-3109.patch         |  41 +++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 22 files changed, 670 insertions(+), 86 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb => linux-firmware_20221214.bb} (99%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3109.patch

-- 
2.25.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C1AC83F15
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:32:44 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.15164.1724938361254826863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VWoRhoy/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d679b094ffso477500a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938360; x=1725543160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QoAcv/pIu77Ud9erVK1zJFuRL2Nul8fp14gCaxx+izw=;
        b=VWoRhoy/xmOCPD+4MUhxae64zeA7jCQ1IZ8pYaqA6oXO4V1OHaVA+uAPMGQciDbXTR
         G2NujZODlv839b7/yvqQ1A5uWN9KQxdXVAL9VoO3U7DZC07O+Pb1EPNOeNO60CGad/k+
         nxP2gSzniT6DemRD9+BC+ZGAQvW6+tTKrv6blozsLsdnppXdnf4ddimCNub6KPpaLLjV
         IMr6ikcyS/Ge3Uxz4o8VSWenmHRZMDKUpiwibgqIq2CcefjOI8pZ13OtYmiaNnlZ31TW
         mgee/5aKXrSV0TYedXSeJhXTQTNKRSSCCOk6zEukB3FQCzkSvn4h+DTPZHg06glJO36g
         XitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938360; x=1725543160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QoAcv/pIu77Ud9erVK1zJFuRL2Nul8fp14gCaxx+izw=;
        b=BTOen59A97X0Wqlw1KjA+vtDDIq8OvsvTs76l9p4r1Bk6R1I+xhI5HVGchqb74DthG
         Ykbaa7EnpDOunW1SPVdP0UItUojx8pR65/K/nzBd8dXxuwEVpGvVsmxgKUPAZIScvjvX
         6uIbwjkeiR4qh0X2OgCW8MP9nnSExlDFq06mYHy9SKSdIyY7hDyOMc2mnznX8BFpcqu8
         3bba9TrMW7kKyMZplD5QfTVQw9MXj0MyM0kra4XfNFJ56/S+MbQBkvphMgBbN+nPtck1
         hF3tyLH5tWl5JyJdPY4UAublcptukh+TUeIjkL8pURiFj9pdqHJdcpR25+Ipm7WyRPJe
         Omsw==
X-Gm-Message-State: AOJu0YxZciXOykYwQfXldpp5cK7A05lXsW6zxpdRAu1WY/MMXfc3g603
	p4lkW8ELbHjDAWUOCRG7kwlhfV6+LlTQ/mpAhOgvkIyABvhlefWBDdNNWEt7XoHGVSGCot0Js5W
	mz90=
X-Google-Smtp-Source: AGHT+IF5fX8mjOPW26S9VXeqA62V+LxMfkqZhOgjzLLJTyLMIcBZ2bjAYt2topCGdQsUDDXJrOzQmA==
X-Received: by 2002:a17:90a:38a1:b0:2d3:bd32:fc89 with SMTP id 98e67ed59e1d1-2d8563a03e7mr2747796a91.29.1724938360281;
        Thu, 29 Aug 2024 06:32:40 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.32.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:32:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/12] Patch review
Date: Thu, 29 Aug 2024 06:32:23 -0700
Message-Id: <cover.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203920

Please review this set of changes for scarthgap and have comments back by
end of day Monday, September 2

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7287

The following changes since commit 8b5c66c91d94f4c8521fe9443e65d86063dba5e5:

  oeqa/utils/postactions: transfer whole archive over ssh instead of doing individual copies (2024-08-20 05:03:49 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (2):
  ffmpeg: fix CVE-2024-32230
  qemu: fix CVE-2024-7409

Bartosz Golaszewski (1):
  linux-firmware: add a package for ath12k firmware

Changqing Li (2):
  expect-native: fix do_compile failure with gcc-14
  libcap-ng: update SRC_URI

Niko Mauno (1):
  util-linux: Add PACKAGECONFIG option to mitigate rootfs remount error

Peter Marko (2):
  libyaml: Ignore CVE-2024-35325
  curl: Patch CVE-2024-7264

Quentin Schulz (1):
  weston-init: fix weston not starting when xwayland is enabled

Siddharth Doshi (1):
  vim: Upgrade 9.1.0114 -> 9.1.0682

Simone Weiß (1):
  curl: Ignore CVE-2024-32928

Yogita Urade (1):
  qemu: fix CVE-2024-4467

 .../util-linux/util-linux_2.39.3.bb           |   12 +-
 meta/recipes-devtools/expect/expect_5.45.4.bb |    2 +-
 meta/recipes-devtools/qemu/qemu.inc           |    9 +
 .../qemu/qemu/CVE-2024-4467-0001.patch        |  112 ++
 .../qemu/qemu/CVE-2024-4467-0002.patch        |   55 +
 .../qemu/qemu/CVE-2024-4467-0003.patch        |   57 +
 .../qemu/qemu/CVE-2024-4467-0004.patch        | 1187 +++++++++++++++++
 .../qemu/qemu/CVE-2024-4467-0005.patch        |  239 ++++
 .../qemu/qemu/CVE-2024-7409-0001.patch        |  167 +++
 .../qemu/qemu/CVE-2024-7409-0002.patch        |  175 +++
 .../qemu/qemu/CVE-2024-7409-0003.patch        |  126 ++
 .../qemu/qemu/CVE-2024-7409-0004.patch        |  164 +++
 meta/recipes-graphics/wayland/weston-init.bb  |    2 +-
 .../linux-firmware/linux-firmware_20240312.bb |    8 +-
 .../ffmpeg/ffmpeg/CVE-2024-32230.patch        |   36 +
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |    1 +
 .../curl/curl/CVE-2024-7264-1.patch           |   61 +
 .../curl/curl/CVE-2024-7264-2.patch           |  316 +++++
 meta/recipes-support/curl/curl_8.7.1.bb       |    3 +
 .../libcap-ng/libcap-ng-python_0.8.5.bb       |    2 -
 meta/recipes-support/libcap-ng/libcap-ng.inc  |    8 +-
 meta/recipes-support/libyaml/libyaml_0.2.5.bb |    1 +
 ...m-add-knob-whether-elf.h-are-checked.patch |   39 -
 meta/recipes-support/vim/vim.inc              |    5 +-
 24 files changed, 2737 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-7264-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-7264-2.patch
 delete mode 100644 meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch

-- 
2.34.1



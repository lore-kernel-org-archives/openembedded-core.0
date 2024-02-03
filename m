Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDB4C4828D
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:14:53 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.23463.1706987690007576985
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SYdUNNJe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e03af57c97so10713b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987688; x=1707592488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=21oDGyZyyoS5Mxei76crjqMLxwD1jsnLxBE05tyQNb8=;
        b=SYdUNNJeGWI9PCSd1JT211NTg7WU56J0GVykR7RvFaF4NALZgE/apxJ709yVAH2bUU
         Aj4Bb4NVu8loX8brUucagefU3hz1HEp8hcD9pkUHpR24LozhBRSNLxJWLCoctL5wi0d7
         YCkxlKb1GO5Aj5zUERU/CdctoRa+cEzKvlg5WAYFxQWlLkV/5+E55Dh1EFcPH0lmcPr6
         q/LwYzN2CR2h/Gq9aO8/npslfu8NjcAYA16DBtUcr78E5jfYi/kpqJru0RIm7yHLeVsO
         nnoXNuvo3IfqplJjwZOvc25jJygPHYIj4VP6FLrpiNz5SvoN0j9wBdXANlRmeS+Dzo3g
         O40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987688; x=1707592488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=21oDGyZyyoS5Mxei76crjqMLxwD1jsnLxBE05tyQNb8=;
        b=PWsXvP0V1mSBLoHvblWfkJ+Lm5xebpH7aWtdnP87telXA/hqmWV4wfJVKTtOo1Minr
         Oh9uKvtUKxM90XxX2tGalPdjRw3NIxKRpSiLPv/9BfP3JtbngEKAHdgjHr75GspibmGJ
         UyJ0dYorTuG/5uhvBrpks6XgKQruNcdjHtx4/daf93OfrjrZJjpBuWj5dw5gpVT9al8b
         lBOPDHY2efTm7iU1oQ9IQyeUCkCQltCgwZax4wnz+aoYslXzU89Oxg6Gei/ACQqr3qrJ
         ZDwWghRrEZ/dqdzC5Cf+5+JOdWnDP9Bh0n8CngBoj+3XhFKDJRTAIHfSBvwzhjlE/3fv
         uupw==
X-Gm-Message-State: AOJu0YwV2yi5ixOIM0D1aKQVs3dh+SFNRltMz/WpE4FvcciD3s/dAEqU
	s6h6U3RyAYAxTG4x15WD8CzvL7YYjZYJwGjMgdtcT9w2KP0Uld9to2ij5bGxhU91RwfXI91P0lW
	9emM=
X-Google-Smtp-Source: AGHT+IFjWzFZzMZRiue1J6OPpc5dYe6JhN2t5AT7qV2AcJ797GNNpcDh4DgNe7FEhe/7aEZDYi3eFA==
X-Received: by 2002:a05:6a21:3511:b0:19c:b3e7:fe39 with SMTP id zc17-20020a056a21351100b0019cb3e7fe39mr13992838pzb.0.1706987688428;
        Sat, 03 Feb 2024 11:14:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.14.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:14:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 00/15] Patch review
Date: Sat,  3 Feb 2024 09:14:27 -1000
Message-Id: <cover.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194844

Please review this set of changes for nanbield and have comments back by
end of day Tuesday, February 6

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6527

The following changes since commit a27983e0b6bde730fe501c9931119bf18b2c376b:

  package.py: OEHasPackage: Add MLPREFIX to packagename (2024-01-26 04:58:49 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Alexander Kanavin (2):
  glibc-y2038-tests: do not run tests using 32 bit time APIs
  icon-naming-utils: take tarball from debian

Khem Raj (1):
  tcl: Fix prepending to run-ptest script

Ming Liu (2):
  grub: fs/fat: Don't error when mtime is 0
  qemu.bbclass: fix a python TypeError

Peter Marko (2):
  sqlite3: upgrade 3.43.1 -> 3.43.2
  sqlite: drop obsolete CVE ignore

Richard Purdie (1):
  curl: Disable test 1091 due to intermittent failures

Rodrigo M. Duarte (1):
  linux-firmware: Fix the linux-firmware-bcm4373 FILES variable

Simone Weiß (1):
  glibc: Set status for CVE-2023-5156 & CVE-2023-0687

Trevor Gamblin (1):
  scripts/runqemu: fix regex escape sequences

Wang Mingyu (2):
  gstreamer1.0: upgrade 1.22.7 -> 1.22.8
  aspell: upgrade 0.60.8 -> 0.60.8.1

William Lyu (1):
  elfutils: Update license information

Yang Xu (1):
  rootfs.py: check depmodwrapper execution result

 ...pell_0.60.8.bbappend => aspell_%.bbappend} |   0
 meta/classes-recipe/qemu.bbclass              |   2 +-
 meta/lib/oe/rootfs.py                         |   3 +-
 ...1-fs-fat-Don-t-error-when-mtime-is-0.patch |  70 ++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +
 meta/recipes-core/glibc/glibc/run-ptest       |  12 +--
 .../elfutils/elfutils_0.189.bb                |  19 ++--
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb     |   2 +-
 .../linux-firmware/linux-firmware_20231030.bb |   1 +
 ...tools_1.22.7.bb => gst-devtools_1.22.8.bb} |   2 +-
 ...1.22.7.bb => gstreamer1.0-libav_1.22.8.bb} |   2 +-
 ...x_1.22.7.bb => gstreamer1.0-omx_1.22.8.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.22.8.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.22.8.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.22.8.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.22.8.bb} |   2 +-
 ....22.7.bb => gstreamer1.0-python_1.22.8.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.22.8.bb} |   2 +-
 ...1.22.7.bb => gstreamer1.0-vaapi_1.22.8.bb} |   2 +-
 ...er1.0_1.22.7.bb => gstreamer1.0_1.22.8.bb} |   2 +-
 .../icon-naming-utils_0.8.90.bb               |   4 +-
 .../{aspell_0.60.8.bb => aspell_0.60.8.1.bb}  |   7 +-
 .../aspell/files/CVE-2019-25051.patch         | 101 ------------------
 meta/recipes-support/curl/curl/disable-tests  |   2 +
 .../{sqlite3_3.43.1.bb => sqlite3_3.43.2.bb}  |   5 +-
 scripts/runqemu                               |   8 +-
 27 files changed, 115 insertions(+), 146 deletions(-)
 rename meta-selftest/recipes-test/aspell/{aspell_0.60.8.bbappend => aspell_%.bbappend} (100%)
 create mode 100644 meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.7.bb => gst-devtools_1.22.8.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.7.bb => gstreamer1.0-libav_1.22.8.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.7.bb => gstreamer1.0-omx_1.22.8.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.7.bb => gstreamer1.0-plugins-bad_1.22.8.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.7.bb => gstreamer1.0-plugins-base_1.22.8.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.7.bb => gstreamer1.0-plugins-good_1.22.8.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.7.bb => gstreamer1.0-plugins-ugly_1.22.8.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.7.bb => gstreamer1.0-python_1.22.8.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.7.bb => gstreamer1.0-rtsp-server_1.22.8.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.7.bb => gstreamer1.0-vaapi_1.22.8.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.7.bb => gstreamer1.0_1.22.8.bb} (97%)
 rename meta/recipes-support/aspell/{aspell_0.60.8.bb => aspell_0.60.8.1.bb} (83%)
 delete mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.43.1.bb => sqlite3_3.43.2.bb} (48%)

-- 
2.34.1



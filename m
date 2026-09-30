Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F63CA5FC1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:12:11 +0000 (UTC)
Received: from mail-wr2-f36.google.com (mail-wr2-f36.google.com [74.125.225.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8519.1790755925640559055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LG7VkQqi;
 spf=pass (domain: smile.fr, ip: 74.125.225.100, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f36.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso2528879f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790755924; x=1791360724; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CcG7qw2D5LIdizLtdddznEzBtqBTcu67seaOmDD4to=;
        b=LG7VkQqiiXTLbO3P6DhCU9f2yB4/mwbH93SDihKv6QisrLeSaQ358jOG+PgbjcZ7SJ
         022yxcDbIEruBtQneeU0mF/aVp8X4z1858+s8JrOo10iAtavbDydb9LStI3Am75XDtkR
         AaxN6glBcu81Nlmt3CZFXZ8DB6LQNsrN2wAi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755924; x=1791360724;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/CcG7qw2D5LIdizLtdddznEzBtqBTcu67seaOmDD4to=;
        b=LRWshzcP9S+7ixEIw33RWkYeM1n8zC88S8RofwByjLGhqSXiv8QppgXCEEkrJSJYq/
         pVUhAoO0CXDtmHDr/pAx6+Ht6uaubJL/WbQXZW7E6NeC46ZDOrJVfjZ0SwpMbBJ/sZlV
         jqZybur0QPEc7/ySoszDXii8TqDO5hrdi+KcvVNZNp9aErtYiV4WJdceHw7YC3eLOcdN
         kDBNCaARPY9Z2H6GNaWGksfKqibcqH96wJ/X7n4jOwf8Jvi6hELsrvgYIBPTafh2ZBR6
         SBpsvbIhDbWZARnAAvvCNEyAGucQ+YC6Gk1vYAFERCbLK1lAIaZHWFssxJn5QXkUWIeq
         4z8g==
X-Gm-Message-State: AFq9FYKOEXAwtPE4pKdxVM/SEF4yuwxJFFRdSFrmwRYcDjBz8hMC6e61
	vTGIJWP0VlNDgKf4bBOsd1G5oQoZFAy1Zr0ITvNopJC9a4Eo3ERpcqXY70+fklrbOYPXMURuRL4
	b0h6DA6I=
X-Gm-Gg: AYBFou1AMCKfPIQhBLQH68O0LpCrKMTgN5dqhdBVc53gjys7Vojskni8BcpDcm+FOYF
	CFayjEsR1QFKEj5PIiIC/wiSe/G5lDcioMzxZAp7U4gZja0/ZbwvvsR6bmMZnacx7NEd6hvSBuK
	BtUQJ0HrqmUV2uVNTED4JYNlI/mEtatd+keV47Hup6CTO9nZdR8+LVjEdruolbWdzup1HShn1vY
	aaEMSnu1gc9pujxf4JcEWob4Tp3ETufYvUc9yKwRbOD+UD9mmfeqTdxNeiIQTXvK/GdgZYanyFy
	cwuTu5Pwk5ZRBPBiO+7qhhi0WDAJKi+DbLPi97srYeyOgHNbwlPBZNRlBTqu7sEZeMlrZmNXTg6
	lGFYe1lMJhH5igxdiu6CHYB2CCnLzEiIjSVCsgcvNqPy9f4urC3fsSr8/JjZsFpCbmfrvwBW7G0
	7rv681KTE8TbWGNL4+WW9xmuhz6rmiBNUqk6BuJpLO2b79vnKEZbxMnt65Q+YD863uX0wquUbBy
	bWyE3xyj7zjEr5NNZgz/ZjVBAMw4dMezb7p3V8JySYr72Zfv7iHSZM0qcEaVQosolBbiNK2hWC1
	2KQE4g==
X-Received: by 2002:a05:6000:3c7:b0:486:f42f:6860 with SMTP id ffacd0b85a97d-48b0258e863mr1301903f8f.56.1790755923557;
        Wed, 30 Sep 2026 01:12:03 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f01d9sm1465064f8f.23.2026.09.30.01.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:12:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/28] Pull request (cover letter only)
Date: Wed, 30 Sep 2026 10:11:41 +0200
Message-ID: <cover.1790754758.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246923

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1790494949.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4811

The following changes since commit cc4695f65beb6e5069fbecc16475fa5a27c768e9:

  mesa: align x86 mesa config with LLVM graphics (2026-09-24 12:36:03 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 40993b0c42411caa5df71a75739b569fdffe981f:

  linux-yocto/6.18: fix kernel reproducibility issues (2026-09-26 23:10:37 +0200)

----------------------------------------------------------------

Adrian Freihofer (1):
  bitbake.conf: pseudo add rootfs-dbg to PSEUDO_INCLUDE_PATHS

Ankur Tyagi (3):
  ffmpeg: mark CVE-2026-52295, CVE-2026-52296 and CVE-2026-52297 fixed
  libxfont2: patch CVE-2026-59679
  libxfont2: patch CVE-2026-44950

Benjamin Robin (3):
  sbom-cve-check-update-db: Exclude recipes from rm_work
  python3-sbom-cve-check: update to version 1.3.4
  python3-sbom-cve-check: update to version 1.3.5

Bhavesh R Maheshwari (3):
  ffmpeg: Fix for CVE-2026-66037
  ffmpeg: Fix for CVE-2026-66038
  ffmpeg: Fix for CVE-2026-66039

Bruce Ashfield (4):
  linux-yocto/6.18: rt: update to v6.18.37-rt6
  linux-yocto/6.18: update to v6.18.50
  linux-yocto/6.18: update to v6.18.52
  linux-yocto/6.18: fix kernel reproducibility issues

Daniel Dragomir (1):
  toolchain-scripts: fix kernel host tool builds broken in the SDK

Devansh Patel (1):
  vim: Fix CVE-2026-28417 hostname regression

Jonas Juffinger (1):
  kernel-fit-image: Don't add hash node when signing is enabled

Peter Marko (2):
  go: upgrade 1.26.7 -> 1.26.8
  fmt: update branch name to main

Richard Purdie (4):
  dhcpcd: upgrade 10.3.1 -> 10.3.2
  sbom-cve-check-update-{nvd-native,cvelist-native}: upgrade 2026.08.25
    -> 2026.09.12
  sstate: Update mtime/atime for sig/siginfo files in
    sstate_checkhashes()
  sstate: Update unpack touch code to be consistent

Roopa Kalmath (1):
  qemu: fix CVE-2026-48914

Tim Orling (1):
  at-spi2-core: RDEPENDS on gsettings-desktop-schemas

Wang Mingyu (1):
  sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native:
    upgrade 2026.08.03-000011 -> 2026.08.25-000009

Xiuzhuo Shang (1):
  bluez5: restrict delta=0 RSSI to proximity filters

Yoann Congal (1):
  cpio: fix "CVE:" marker in CVE-2026-66484.patch

 meta/classes-global/sstate.bbclass            | 16 +--
 meta/classes-recipe/toolchain-scripts.bbclass |  2 +
 meta/conf/bitbake.conf                        |  2 +-
 meta/lib/oe/fitimage.py                       |  2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |  8 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ct-delta-0-RSSI-to-proximity-filters.patch | 86 ++++++++++++++++
 .../{dhcpcd_10.3.1.bb => dhcpcd_10.3.2.bb}    |  2 +-
 ...mprove-the-sitation-of-working-with-.patch |  2 +-
 ...-conflict-error-when-enable-multilib.patch |  4 +-
 ...e-INCLUDEDIR-to-prevent-build-issues.patch |  4 +-
 meta/recipes-devtools/fmt/fmt_12.1.0.bb       |  2 +-
 .../go/{go-1.26.7.inc => go-1.26.8.inc}       |  2 +-
 ...e_1.26.7.bb => go-binary-native_1.26.8.bb} |  6 +-
 ..._1.26.7.bb => go-cross-canadian_1.26.8.bb} |  0
 ...{go-cross_1.26.7.bb => go-cross_1.26.8.bb} |  0
 ...osssdk_1.26.7.bb => go-crosssdk_1.26.8.bb} |  0
 ...runtime_1.26.7.bb => go-runtime_1.26.8.bb} |  0
 .../go/{go_1.26.7.bb => go_1.26.8.bb}         |  0
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-48914.patch            | 60 +++++++++++
 ...3.3.bb => python3-sbom-cve-check_1.3.5.bb} |  2 +-
 ...check-update-cvelist-native_2026-09-12.bb} |  2 +-
 .../sbom-cve-check-update-db.inc              |  1 +
 ...ck-update-nvd-native_2026.09.12-000023.bb} |  2 +-
 .../cpio/files/CVE-2026-66484.patch           |  2 +-
 .../xorg-lib/libxfont2/CVE-2026-44950.patch   | 99 +++++++++++++++++++
 .../xorg-lib/libxfont2/CVE-2026-59679.patch   | 93 +++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |  2 +
 .../linux/linux-yocto-rt_6.18.bb              |  6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 ++---
 .../ffmpeg/ffmpeg/CVE-2026-66037.patch        | 39 ++++++++
 .../ffmpeg/ffmpeg/CVE-2026-66038.patch        | 50 ++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-66039.patch        | 38 +++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  6 ++
 .../atk/at-spi2-core_2.60.0.bb                |  2 +
 .../vim/files/CVE-2026-28417-regression.patch | 65 ++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 39 files changed, 596 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.1.bb => dhcpcd_10.3.2.bb} (97%)
 rename meta/recipes-devtools/go/{go-1.26.7.inc => go-1.26.8.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.7.bb => go-binary-native_1.26.8.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.7.bb => go-cross-canadian_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.7.bb => go-cross_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.7.bb => go-crosssdk_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.7.bb => go-runtime_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.7.bb => go_1.26.8.bb} (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-48914.patch
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.3.bb => python3-sbom-cve-check_1.3.5.bb} (82%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-08-03.bb => sbom-cve-check-update-cvelist-native_2026-09-12.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.08.03-000011.bb => sbom-cve-check-update-nvd-native_2026.09.12-000023.bb} (89%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-44950.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-59679.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66037.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66038.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66039.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression.patch



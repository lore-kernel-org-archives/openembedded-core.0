Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2ADF357BB
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:32:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21455.1771943566883978310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s8CXZ/6O;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso47760395e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943565; x=1772548365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dMgsXWMzMzdHUxY90qgfNLzeKDwpJm0uuPQlbcZxDk=;
        b=s8CXZ/6OH0z746pRgz8E0huhXGcJVC+pDbWFv1tKMGGg3Ss8kcQn+bPRvwwe1ANp/7
         O5hIElKgNeUfqKBTJtuq7GXZjp2o2ixbpyxKV+X3/LtYw7YeqVkWG4SCryAB/2D2XlLG
         TOcAf5K0k3wJCa8tdH4fkdq++CWQ4EvpxYR8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943565; x=1772548365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dMgsXWMzMzdHUxY90qgfNLzeKDwpJm0uuPQlbcZxDk=;
        b=FRPe8KL62WU/GsNbrZ3Wh70Jvz8CXCsMkC6dvqC1LnTDqsw6ZAlZzNQDS0yAx3ZdcR
         28HvtyUm99z6KXu2PYLyW889yHRVit7i6zj9hYshp3pMcrb9eljX3dKan6IBGHCIBsZm
         A68sZsEzwTQjZHdX+v5Bh4wNQE+DGFZAI2prI+yQC/QYaWEd2It3KcBS7tsbfSeCh5Cm
         HRfri3l4GU43dpshq1jCdIxI73arrc07M35NMH3ddP6nEmWcnPoGfA9JWXn33XUvN5LT
         xIWIcW6u8sWXJ1X2t7ECxYa7TF8Gbx+tO3W01DRM0IEXqHmU9dsIryV3P/r99knwlal3
         8EBA==
X-Gm-Message-State: AOJu0YydBlHnCool3IT2cgkQ0IJJ723kquIJ79FqXNdkRWKriQ6kjAY8
	CdliVd/hK2ZUsSNx/KZ9FAitMC6PceDXTrW5go1GwPZSmoE2GFgiu2t8+tmHj1c3Qou6Y7x9OsP
	bNh0k
X-Gm-Gg: AZuq6aIOLVQexDSpebdhQCXmB1+yRH59CYIvoyWbvdw/dEsQoADvmCQ+2BLBqdh+21n
	lei50e7aMpwb5kefgKAti7eCR1RSWy6U9qX79uPGSz/l3y0vmIPQhNY9IxKSbXzK/peJ3PBtxFg
	WNOzDVtxeb5M3J8Emac3grD5S0wbhB+5UbvXiMVf5W4QrnXlFEI6fvy7Wte1lbO70X2eBR3uZ9g
	oZuhrw+QxrF06ZLy745UASOR7c0Pop5ttjGRc+ycCbSRgKaKPsSJTAdl9wgONjAqbwJUpVGc/I9
	4tbOVJPUVXFTMdau7wkAsuPG4wIvnh2uiH9CnQPkCvoZCosf3kQ9eW4cZU+XfFgo/G/xHBQxMD+
	JBLn2iEO8vrqnzEEBmz4vjyuAbCmN09/QwZi3qDYZQ0ADvUmbhkZhfhYCgmOWwsci8HT0Kobx+w
	8Jks2YW/mj7B2a2FyIBCy3xgZNCdmNbnTCULHnlC6Ifc7ABpkLMEmDf8OgQ3Q1X1oiiicwUAvIl
	bK+vXrD2sjitk0wcjNBQppraHbY3ao+wxtWT44wce/f
X-Received: by 2002:a05:600c:4452:b0:480:52fd:d2e4 with SMTP id 5b1f17b1804b1-483a95a385cmr211323935e9.0.1771943564739;
        Tue, 24 Feb 2026 06:32:44 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/44] Patch review
Date: Tue, 24 Feb 2026 15:31:28 +0100
Message-ID: <cover.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231805

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, February 26.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3276

The following changes since commit a1f4ae4e569bc0e36c27c1e4651e502e54d63b28:

  build-appliance-image: Update to scarthgap head revision (2026-02-16 09:52:44 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to 94a2960e1ae3923599affb6b227ef3f1870f5633:

  u-boot: move CVE patches out of the common .inc file (2026-02-24 10:34:08 +0100)

----------------------------------------------------------------

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.0.15

Amaury Couderc (2):
  avahi: patch CVE-2025-68468
  avahi: patch CVE-2025-68471

Ankur Tyagi (4):
  avahi: patch CVE-2025-68276
  avahi: patch CVE-2026-24401
  mobile-broadband-provider-info: upgrade 20240407 -> 20251101
  vim: ignore CVE-2025-66476

Benjamin Robin (Schneider Electric) (1):
  spdx30_tasks: Exclude 'doc' when exporting PACKAGECONFIG to SPDX

Bruce Ashfield (7):
  linux-yocto/6.6: update to v6.6.112
  linux-yocto/6.6: update to v6.6.114
  linux-yocto/6.6: update to v6.6.116
  linux-yocto/6.6: update to v6.6.118
  linux-yocto/6.6: update to v6.6.119
  linux-yocto/6.6: update to v6.6.120
  linux-yocto/6.6: update to v6.6.123

Daniel Dragomir (1):
  wic/engine: error on old host debugfs for standalone directory copy

Deepak Rathore (7):
  go 1.22.12: Fix CVE-2025-61730
  go 1.22.12: Fix CVE-2025-61726
  go 1.22.12: Fix CVE-2025-61728
  go 1.22.12: Fix CVE-2025-61731
  go 1.22.12: Fix CVE-2025-68119
  go 1.22.12: Fix CVE-2025-61732
  go 1.22.12: Fix CVE-2025-68121

Dragomir, Daniel (2):
  wic/engine: fix copying directories into wic image with ext* partition
  oeqa/selftest/wic: test recursive dir copy on ext partitions

Fabio Berton (1):
  classes/buildhistory: Do not sign buildhistory commits

Hitendra Prajapati (2):
  openssl: fix CVE-2025-15468
  openssl: fix CVE-2025-69419

Ming Liu (1):
  weston: fix a touch-calibrator issue

Peter Marko (10):
  libsndfile1: patch CVE-2025-56226
  libpng: patch CVE-2026-25646
  glib-2.0: patch CVE-2026-1484
  glib-2.0: patch CVE-2026-1485
  glib-2.0: patch CVE-2026-1489
  ffmpeg: ignore CVE-2025-1594
  libtheora: mark CVE-2024-56431 as not vulnerable yet
  ffmpeg: set status of CVE-2025-25468
  gnupg: patch CVE-2025-68973
  alsa-lib: patch CVE-2026-25068

Pratik Farkase (1):
  libevent: merge inherit statements

Richard Purdie (1):
  go-vendor: Fix absolute paths issue

Vijay Anusuri (1):
  bind: Upgrade 9.18.41 -> 9.18.44

Yoann Congal (2):
  pseudo: Update to include a fix for systems with kernel <5.6
  u-boot: move CVE patches out of the common .inc file

 meta/classes/buildhistory.bbclass             |   2 +-
 meta/classes/go-vendor.bbclass                |   6 +-
 meta/lib/oe/spdx30_tasks.py                   |   8 +-
 meta/lib/oeqa/selftest/cases/wic.py           |  65 ++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  12 +-
 meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |  10 +
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   4 +
 .../avahi/files/CVE-2025-68276.patch          |  65 ++
 .../avahi/files/CVE-2025-68468.patch          |  32 +
 .../avahi/files/CVE-2025-68471.patch          |  36 +
 .../avahi/files/CVE-2026-24401.patch          |  74 ++
 .../bind/{bind_9.18.41.bb => bind_9.18.44.bb} |   2 +-
 .../mobile-broadband-provider-info_git.bb     |   4 +-
 .../openssl/openssl/CVE-2025-15468.patch      |  39 +
 .../openssl/openssl/CVE-2025-69419.patch      |  61 ++
 .../openssl/openssl_3.2.6.bb                  |   2 +
 .../glib-2.0/glib-2.0/CVE-2026-1484-01.patch  |  48 +
 .../glib-2.0/glib-2.0/CVE-2026-1484-02.patch  |  45 +
 .../glib-2.0/glib-2.0/CVE-2026-1485.patch     |  44 +
 .../glib-2.0/glib-2.0/CVE-2026-1489-01.patch  |  42 +
 .../glib-2.0/glib-2.0/CVE-2026-1489-02.patch  |  30 +
 .../glib-2.0/glib-2.0/CVE-2026-1489-03.patch  | 290 ++++++
 .../glib-2.0/glib-2.0/CVE-2026-1489-04.patch  |  68 ++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   7 +
 meta/recipes-devtools/go/go-1.22.12.inc       |  10 +
 .../go/go/CVE-2025-61726.patch                | 196 +++++
 .../go/go/CVE-2025-61728.patch                | 171 ++++
 .../go/go/CVE-2025-61730.patch                | 460 ++++++++++
 .../go/go/CVE-2025-61731.patch                |  70 ++
 .../go/go/CVE-2025-61732.patch                |  53 ++
 .../go/go/CVE-2025-68119-dependent.patch      | 175 ++++
 .../go/go/CVE-2025-68119.patch                | 828 ++++++++++++++++++
 .../go/go/CVE-2025-68121_p1.patch             | 253 ++++++
 .../go/go/CVE-2025-68121_p2.patch             | 385 ++++++++
 .../go/go/CVE-2025-68121_p3.patch             |  82 ++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 ...ator-Regularise-surface-view-mapping.patch |  78 ++
 .../recipes-graphics/wayland/weston_13.0.1.bb |   1 +
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +-
 .../alsa/alsa-lib/CVE-2026-25068.patch        |  34 +
 .../alsa/alsa-lib_1.2.11.bb                   |   1 +
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |   3 +-
 .../libpng/files/CVE-2026-25646.patch         |  61 ++
 .../libpng/libpng_1.6.42.bb                   |   1 +
 .../libsndfile1/CVE-2025-56226-01.patch       |  36 +
 .../libsndfile1/CVE-2025-56226-02.patch       |  43 +
 .../libsndfile/libsndfile1_1.2.2.bb           |   2 +
 .../libtheora/libtheora_1.1.1.bb              |   2 +
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 +++
 meta/recipes-support/gnupg/gnupg_2.4.8.bb     |   1 +
 .../libevent/libevent_2.1.12.bb               |   4 +-
 meta/recipes-support/vim/vim_9.1.bb           |   2 +
 scripts/install-buildtools                    |   4 +-
 scripts/lib/wic/engine.py                     |  92 +-
 56 files changed, 4132 insertions(+), 62 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
 rename meta/recipes-connectivity/bind/{bind_9.18.41.bb => bind_9.18.44.bb} (97%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61726.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61728.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61730.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61731.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61732.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68119-dependent.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68119.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68121_p1.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68121_p2.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68121_p3.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-touch-calibrator-Regularise-surface-view-mapping.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-02.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch



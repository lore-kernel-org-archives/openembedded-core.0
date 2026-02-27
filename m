Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA665FD531E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:24:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91525.1772184252045019951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=voQjg+sm;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-436e8758b91so1170867f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 01:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772184250; x=1772789050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qy/hbPUYi16aad6+pONiGYo+8Ix7PJL5mqxaniPx1nw=;
        b=voQjg+sm2tqeo6+qzyYWSkCknwBGx4sHpTJC8HJs985kb9lj6Vg8FU3rv131/NubvJ
         toPGimRP/H/495RbDvNDmnuFByDRFEKqahHa4VrL6N8DAO2/JM12ADNcADpq4os8pnRQ
         l1wJ0gSDPWUQuyjCgqIGkCa2+cfkAjJYA9pYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184250; x=1772789050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy/hbPUYi16aad6+pONiGYo+8Ix7PJL5mqxaniPx1nw=;
        b=ojir8zyngx7AoR9MoEdeclfR0skAYDgtkgfgrLOoyyonZM4mrSpjmALMU3AbDys/yk
         s4LUFHKsPMxNm/fdMy1s/VJ7gvbVCbNIzZpqxLex9fRN1S5IRYREhOTapZnAfP4bgiGc
         SowrK8XZTcjqIKiB0t9oRBuTpx0MWVLwWcw4VAMFovA81KzCqFuBg5MS4YMoHJqstoSV
         sASV6zgbaCfVikMGi7WiU9ybC0a4JmiEI0SdF5TMu90YAICEZVTGbcKSR1Af1H25Tbz3
         u+iNifCOqbW6UnPWElER68ZlRvNaHKoeNXM7Bv/bd6FTfqLlFyKL9fedrEfuo44un7Aj
         1C4g==
X-Gm-Message-State: AOJu0YztDFEh/IcBFIy/OONgTdR+6ZBdOz8+qlu7gbTD9ZIwyWKM1gxh
	GqlgCZPMZIcwLI+s4Z9wjMOQ7ZCNBak+SZQVP/btH7/nXtDatvV4NVRAZ37vKQVOzwZf6PQLiW8
	sQW8A
X-Gm-Gg: ATEYQzytrYDSsckR48socuwTI0X82ODSsHQhGbH61YIO5jC9rvUcRPIkN3x2tZjpn3D
	oOmSSybdQ/k/3iO5tlaLvXyqRXSMS+xxJsqNPbg2b8ML/maRlnb3EvuhdLBhrIjPgNrepcOXq6e
	tjeLRIJgh2t7jmArDawxCZziqux5GYLakmtCzWLAZTEy7buKuHGfd0kEjdLHmSgQdvuEBXF6ZAa
	9oDSTpiK04YbwPc9N4XOoe1Iv2M5zF9YIHtr8xHkHq1TVd3P2FsOoZIEMfgmjDNV72D+Msx6F8D
	mCBfzN+T8MT2ZJaEdZsH9qFQ5ipIfLBGFqKG0yRg4ULZUwOOo8b+HYiDfkg2TYdFHedHbUuslNF
	KU6hP30lxCqOfAlcZwSyd4Us2XeebflZevWr7/SmV+gvkKc3jQTsJASRGQNt+yXqcdxzlo2WAet
	293qnuT0OQKxKiNLnsoU1/Q6Cau/SmLXDsn6/nqY9Cug/tfctZhkStOAQ403Aw91zNEc3LR9J0a
	9pSN0DUeKInLH3bjUwRIbeiLAFOjSQ4dK0DLtQ=
X-Received: by 2002:a05:6000:2287:b0:437:675d:7620 with SMTP id ffacd0b85a97d-4399de2791cmr3035848f8f.35.1772184250123;
        Fri, 27 Feb 2026 01:24:10 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa0054865075f82f42ae.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:5486:5075:f82f:42ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm5516323f8f.7.2026.02.27.01.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:24:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/44] Pull request (cover letter only)
Date: Fri, 27 Feb 2026 10:24:06 +0100
Message-ID: <cover.1772184120.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 09:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232090

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1771943404.git.yoann.congal@smile.fr/T/#t

Passed a-full on autobuilder (no change since patch review request):
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3276

The following changes since commit a1f4ae4e569bc0e36c27c1e4651e502e54d63b28:

  build-appliance-image: Update to scarthgap head revision (2026-02-16 09:52:44 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

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



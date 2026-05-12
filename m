Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43046CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:26:17 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71356.1778577967137984406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 02:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CizvV5vy;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ba840146so47138515e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 02:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778577965; x=1779182765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=os6AD3YjVNDv3q2wL8o3R6/7UNOXINKQGHVeRCUanvs=;
        b=CizvV5vyuCbW6tLRQwjcQO8yAWWmhjJZ/tR84N8WQc8Sjf+ZnUD+jlzrjpH33KtFm1
         0OEUVlYTEa5kOv2iVjn0lCbhcBvUTXOkHRHWMyRBpeef3LGQDiwmEmdj3tfWUIrbSW8n
         vCXGuYUsD5E20XYx+/4LHgbaJmam/r3s/0RiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577965; x=1779182765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os6AD3YjVNDv3q2wL8o3R6/7UNOXINKQGHVeRCUanvs=;
        b=IYR8t0lw2iXdA/NNDvzbnzJKKLZvU64VQxQ3una5dK7bdRbT69BM9tFPvDKc39jcGo
         pmYLuVUIsYgcacbIatEXTFSErPRmArVmtMAk/+S/v1BeAyO1qb+iM4LqWktkEtU4iSZ5
         Hx3D2HkwnX2Wyd4eohYxwAy1w5Ie1ou7x1d1avErRSrUE49KqrH47GKFUPpiCGJ8tjpH
         ryL6jTZssYLe4OYltsDXg+mIycfkKQXPTK+Coso69qgXiLWmz+SxCk8UaqoyhWDMNiyW
         KjY2uXbpSvxvTzpgWFMtjSNQTn4HLp+1LR1f3aYs7n3wPEu2xLGHfT+n7VVLXbjdX06G
         2sOg==
X-Gm-Message-State: AOJu0YxFWX6djNobgI+2MFMYDNMBz2If3nqIBga5xFJPU8jDzBhWV1r5
	q+GD+ZuiqdTdwh0A7RtxK7e3ta6MQRX+S6HKsMD1HI0eaEcxPSNbeuPdBtbYA2Pt2ayZ0GJJNNq
	OeI+XLks=
X-Gm-Gg: Acq92OF+emBLkdq+wzjz35eklxpZ2TJeepTIPfQ8gR+ye5lXJaKbfvntHb091Qt467s
	deNhTW6oqAoNCEsvQon1eXleTWyo8AwK/SMIwY72sFKZpBbdnYYukU9oc1qiWoJVjZ1PWDCXuku
	6/0WRDr3osBIfYZA2aFu2j1EV6rR1bSuIHDBO/WFUu8eIeARG8kiTcOrzjw6PgAz2FlidWwzheq
	+RQxkoQ5/EBGhnsub0nl+qZeg6PVhH1rQusJXGw/v3IhaImqzVv5RwPSJ1dhtgrz+6yXxk+Ptfu
	nohI8O2NSkpxJnakhQS41BNX9d/aQajljgtLFa0+xA89FV+Ll8SXeQ45uC7589ARV6Q9t8iUpvX
	fw/dRlcaKQVmhxfKTQLKtOJY/pTi3wA6JW03gH8jBSSCWIjrRvJ3uq+twxbbSdHV2U75QWuvmkj
	I6nPb4asIKovi0lZDH+d4qScn+klm08vuuiA5wUTELLhu14hiaDBIhfRwTrGr3nFDAX0s75oSaS
	4zbiunDomEG94XpNPrH1kW4l1C2el+UjSckJw==
X-Received: by 2002:a05:600c:a416:b0:48e:7f1c:8760 with SMTP id 5b1f17b1804b1-48e8fe802dfmr26300295e9.27.1778577964983;
        Tue, 12 May 2026 02:26:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a5b65sm32566764f8f.8.2026.05.12.02.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 02:26:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/31] Pull request (cover letter only)
Date: Tue, 12 May 2026 11:25:58 +0200
Message-ID: <cover.1778577638.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236872

Those are the patches from the last two patch reviews:
* https://lore.kernel.org/openembedded-core/cover.1777995876.git.fabien.thomas@smile.fr/T/#u
  * Already sent as pull request: https://lore.kernel.org/openembedded-core/cover.1778186461.git.yoann.congal@smile.fr/
* https://lore.kernel.org/openembedded-core/cover.1778198884.git.yoann.congal@smile.fr/T/#t
I've combined the 2 series in this pull request.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3794

The following changes since commit dc2df90b1d4f71023169d492f3819326e0e6c055:

  liburcu: upgrade 0.14.0 -> 0.14.2 (2026-04-24 16:06:21 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 7952d214393b6c5230ba115f63b6f6d245a728bc:

  glibc: Fix recipe bug that disabled stack protector (2026-05-08 01:06:24 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (2):
  binutils: fix CVE-2025-69647
  binutils: fix CVE-2025-69648

Bruce Ashfield (3):
  linux-yocto/6.6: update to v6.6.124
  linux-yocto/6.6: update to v6.6.126
  linux-yocto/6.6: update to v6.6.127

Changqing Li (2):
  libsoup: fix CVE-2025-14523
  libsoup: fix CVE-2025-32049

Fabien Thomas (1):
  ghostscript: Pin to C17 std

Himanshu Jadon (1):
  apt: Add CVE_PRODUCT to support product name

Hitendra Prajapati (7):
  rsync: fix for CVE-2026-41035
  systemd: fix for CVE-2026-40225
  systemd: fix for CVE-2026-40226
  libarchive: fix for CVE-2026-4426
  vim: fix for CVE-2026-39881
  sudo: fix for CVE-2026-35535
  inetutils: fix for CVE-2026-32772

Hongxu Jia (3):
  u-boot: fix CVE-2025-24857
  ovmf: fix CVE-2025-2296
  ovmf: fix CVE-2024-38798

Hugo SIMELIERE (3):
  expat: patch CVE-2026-32776
  expat: patch CVE-2026-32777
  expat: patch CVE-2026-32778

Ivan Nestlerode (1):
  glibc: Fix recipe bug that disabled stack protector

Jhonata Poma-Hansen (1):
  dbus: gate user-session PACKAGECONFIG on systemd in DISTRO_FEATURES

Martin Jansa (1):
  ghostscript: fix build with gcc-15 on host

Moritz Haase (1):
  devtool: Disable gpg signing when setting up source tree repos

Peter Marko (1):
  coreutils: set CVE_PRODUCT

Sudhir Dumbhare (1):
  libpng: fix CVE-2026-33636

Vijay Anusuri (2):
  avahi: Fix CVE-2026-34933
  gdk-pixbuf: Fix CVE-2026-5201

Xiangyu Chen (1):
  grub: update search parameter

 meta/recipes-bsp/grub/files/cfg               |   2 +-
 .../u-boot/files/CVE-2025-24857.patch         |  42 +
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   4 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   2 +
 .../avahi/files/CVE-2026-34933-1.patch        | 108 +++
 .../avahi/files/CVE-2026-34933-2.patch        |  96 +++
 .../inetutils/inetutils/CVE-2026-32772.patch  | 172 ++++
 .../inetutils/inetutils_2.5.bb                |   1 +
 meta/recipes-core/coreutils/coreutils_9.4.bb  |   2 +
 meta/recipes-core/dbus/dbus_1.14.10.bb        |   2 +-
 .../expat/expat/CVE-2026-32776.patch          |  91 +++
 .../expat/expat/CVE-2026-32777-01.patch       |  49 ++
 .../expat/expat/CVE-2026-32777-02.patch       |  66 ++
 .../expat/expat/CVE-2026-32778-01.patch       |  91 +++
 .../expat/expat/CVE-2026-32778-02.patch       |  61 ++
 meta/recipes-core/expat/expat_2.6.4.bb        |   5 +
 meta/recipes-core/glibc/glibc.inc             |   3 -
 ...mdSev-Halt-on-failed-blob-allocation.patch | 159 ++++
 .../ovmf/ovmf/CVE-2024-38798.patch            | 116 +++
 .../ovmf/ovmf/CVE-2025-2296-1.patch           | 762 ++++++++++++++++++
 .../ovmf/ovmf/CVE-2025-2296-2.patch           | 175 ++++
 .../ovmf/ovmf/CVE-2025-2296-3.patch           |  42 +
 .../ovmf/ovmf/CVE-2025-2296-4.patch           |  34 +
 .../ovmf/ovmf/CVE-2025-2296-5.patch           |  36 +
 .../ovmf/ovmf/CVE-2025-2296-6.patch           |  54 ++
 .../ovmf/ovmf/CVE-2025-2296-7.patch           | 124 +++
 .../ovmf/ovmf/CVE-2025-2296-8.patch           | 125 +++
 .../ovmf/ovmf/CVE-2025-2296-9.patch           | 108 +++
 meta/recipes-core/ovmf/ovmf_git.bb            |  11 +
 .../systemd/systemd/CVE-2026-40225-01.patch   | 131 +++
 .../systemd/systemd/CVE-2026-40225-02.patch   |  39 +
 .../systemd/systemd/CVE-2026-40226-01.patch   |  63 ++
 .../systemd/systemd/CVE-2026-40226-02.patch   |  39 +
 meta/recipes-core/systemd/systemd_255.21.bb   |   4 +
 meta/recipes-devtools/apt/apt_2.6.1.bb        |   3 +
 .../binutils/binutils-2.42.inc                |   2 +
 .../binutils/binutils/CVE-2025-69647.patch    |  85 ++
 .../binutils/binutils/CVE-2025-69648.patch    | 190 +++++
 .../rsync/files/CVE-2026-41035.patch          |  39 +
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
 ...Fix-compatibility-with-C23-compilers.patch |  67 ++
 .../ghostscript/ghostscript_10.05.1.bb        |   3 +
 .../libarchive/libarchive/CVE-2026-4426.patch |  58 ++
 .../libarchive/libarchive_3.7.9.bb            |   1 +
 .../sudo/files/CVE-2026-35535.patch           | 150 ++++
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   1 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch |  44 +
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |   1 +
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +-
 .../libpng/files/CVE-2026-33636.patch         |  99 +++
 .../libpng/libpng_1.6.42.bb                   |   1 +
 .../libsoup-3.4.4/CVE-2025-14523.patch        | 715 ++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32049-1.patch      | 229 ++++++
 .../libsoup-3.4.4/CVE-2025-32049-2.patch      |  34 +
 .../libsoup-3.4.4/CVE-2025-32049-3.patch      | 134 +++
 .../libsoup-3.4.4/CVE-2025-32049-4.patch      | 292 +++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   5 +
 .../vim/files/CVE-2026-39881.patch            | 248 ++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 scripts/lib/devtool/__init__.py               |   2 +-
 62 files changed, 5237 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32776.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-02.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-AmdSev-Halt-on-failed-blob-allocation.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-1.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-2.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-3.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-4.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-5.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-6.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-7.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-8.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-9.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40225-01.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40225-02.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40226-01.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40226-02.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4426.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-35535.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-39881.patch



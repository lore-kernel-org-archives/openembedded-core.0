Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D679ECD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:58:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1059.1778000291508158172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RFNVinUy;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so28817785e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000290; x=1778605090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7eW6Iyn+/Kv2ox3Cc7fF1qcEZhtUOlUcb8cJW2akjc=;
        b=RFNVinUyDFbkVhBjG9i3jaIHchULswSBHhfX7UB1B/h9BjL/B5pgkJEOoFFIQizfdt
         KHgHcOoObXgDSGAQEFgjK75plVDwLzOeskqtIMiy1nwvIg92Prx3An8WAnFBDBa/xpVX
         0feTs8OFFGaGnkM9pqrQ4pvIjzhGJmzAr4QIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000290; x=1778605090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7eW6Iyn+/Kv2ox3Cc7fF1qcEZhtUOlUcb8cJW2akjc=;
        b=r6PVz+7VlD1LJGDXQ7ho1/FluWVZWKTaHjs7tdIe3nS8RXzjWzkLq/OLmSXN8wr2iV
         EbbZZbLW0HfSTlPYew5UFU1mPCWVPdSgJkJRC5ntnoDWaGRS6CDMDNwvWKQOrHg69Zhn
         bEfM8O5Mb10WTr8ouP2zNf5VNBvK3sQr1aXJoSUsXg1/j8rKGEGcqXA4HD4Vw3ywRZe+
         C3JMiG5AdwkJ4SqCOYHvCFdDp0P14305XtQKZPcEC9NKj46/iy3lzZ73l+UutKGxEMKK
         WCukaog9Ww4avyqbnYgfxkCZ5qhhUYCUL+k36EgsBnHzNBnWumDV21xF4fNlI7jXC/7s
         Rw2Q==
X-Gm-Message-State: AOJu0Yxq6qWWHK7vuHuBwuU+2TtPWKD+2lzEgwItgjOujM/YFGB5Sa5X
	kyT21wBJYivEO7NHnRjnszkKBfB5Kc7LuIO6JyOWOuRPupluJPcABujkUwO6Jw1qjlJllnIIDXU
	ccP4O7I0=
X-Gm-Gg: AeBDiet7qhkSr2htH8KTsRCZgZbs5xA4TblIP36+05pVx647DRJR4xej9U9GBF+QR8k
	UQEux2GJzetaQDdhTayTt/rSO/RYODNIcWQh3lrSbR6UlgAf2y40ZCZt8G7qyWGp9wsey6z1i4x
	UuZUlvnl1xdPWWBS9wCp5YucqtcazX6B+dOQwDsSFE5qM3aqGlHqvC3Jz1iYp7TpuDMpSUPDqUZ
	1uE6Wf54fr4Usf8zmZMQwBnhNJPAta3IzX62VkQLrAaP1dhHbTtT1PwqbPsXQ5eLF1wgjbGdDPe
	XlMZ0UbyYTnWBb+hKUP2ESV3bgntgsiPSxlMe9ATBKOHzBStIQEGgf5hpibrZ9AeHhpQ212TYJR
	4xom/FcyFveZ2bK+Q186GKjOcYGgohrARQTpCy2BLkee+BPcZzzMNkgNfEqPV1Otv70NiiVd6NU
	FNQiajR781YAq5LbaE8Iws6MTUTUYvi931etUJLLuAmeLFxTp1f9YKP/3vI23TU7lEMuzqBUtQ+
	pjkgo1GxeJR4sobfpxTd7Jw+cLKvwYvwiml
X-Received: by 2002:a05:600c:2d43:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48e51e166a3mr909385e9.7.1778000289380;
        Tue, 05 May 2026 09:58:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:08 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/23] Patch review
Date: Tue,  5 May 2026 18:57:17 +0200
Message-ID: <cover.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236491

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, May 6.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3774

The following changes since commit dc2df90b1d4f71023169d492f3819326e0e6c055:

  liburcu: upgrade 0.14.0 -> 0.14.2 (2026-04-24 16:06:21 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to 3c2f2b6f7af2bb743655859b64faae4786080cb9:

  libsoup: fix CVE-2025-32049 (2026-05-05 13:01:04 +0200)

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

Hitendra Prajapati (3):
  rsync: fix for CVE-2026-41035
  systemd: fix for CVE-2026-40225
  systemd: fix for CVE-2026-40226

Hongxu Jia (3):
  u-boot: fix CVE-2025-24857
  ovmf: fix CVE-2025-2296
  ovmf: fix CVE-2024-38798

Hugo SIMELIERE (3):
  expat: patch CVE-2026-32776
  expat: patch CVE-2026-32777
  expat: patch CVE-2026-32778

Jhonata Poma-Hansen (1):
  dbus: gate user-session PACKAGECONFIG on systemd in DISTRO_FEATURES

Martin Jansa (1):
  ghostscript: fix build with gcc-15 on host

Sudhir Dumbhare (1):
  libpng: fix CVE-2026-33636

Vijay Anusuri (2):
  avahi: Fix CVE-2026-34933
  gdk-pixbuf: Fix CVE-2026-5201

 .../u-boot/files/CVE-2025-24857.patch         |  42 +
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   4 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   2 +
 .../avahi/files/CVE-2026-34933-1.patch        | 108 +++
 .../avahi/files/CVE-2026-34933-2.patch        |  96 +++
 meta/recipes-core/dbus/dbus_1.14.10.bb        |   2 +-
 .../expat/expat/CVE-2026-32776.patch          |  91 +++
 .../expat/expat/CVE-2026-32777-01.patch       |  49 ++
 .../expat/expat/CVE-2026-32777-02.patch       |  66 ++
 .../expat/expat/CVE-2026-32778-01.patch       |  91 +++
 .../expat/expat/CVE-2026-32778-02.patch       |  61 ++
 meta/recipes-core/expat/expat_2.6.4.bb        |   5 +
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
 50 files changed, 4601 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
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
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch



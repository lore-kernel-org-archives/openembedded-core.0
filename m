Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E332CD37AA
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 20:45:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5844.1778186730792032282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 13:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Uoi+t+2t;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso12658795e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 13:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778186729; x=1778791529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+/Vc1+H/ni61qzhhkMctJY8r5q0SmlOLOl8C6x8tHQ=;
        b=Uoi+t+2tTmFSnEt7mroX2g5K1pq+JOVU3MIQEX1qyGNcOnSv93NHUu/Ko1Udvnc6vM
         UyJJbwy3QVmW5vNMp4h3BFCEJCQAyZX3Va5E7Z3R6r4159d1jR3mFKl/4yX26Ri2CvD1
         4tbAFsxfH9YN6dgpIit0yoPJBZO++p7SCER5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778186729; x=1778791529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+/Vc1+H/ni61qzhhkMctJY8r5q0SmlOLOl8C6x8tHQ=;
        b=qIcqGmg/hnvHkjcVZIfts3LvXWSYYXoOyC09yOSzIYwdwjSJM+7CcovMkLcXYjrjSt
         5RL/K5N/M447Jfkrda8O3grm+k0ItKoOWoHHQFlsWmT91hfJZF8X6fN3AycgKywtSw/1
         Wflz6XsEUOgjiOz8/j07n1h8a57uL8T32uEulaufqRER/oClsPI+0Zgaa8OuR6vqp6WK
         LXWJNTGRglJqfhHz2d5e5JRQxIGVO8fGraIHsGfL9IWPioQat0mWFQmTmZ/FtU5lnJTD
         N/qXEKvGU/f3Vy1IElAXExsT1IVw1/UKvht+tqa/TtuE72s4as6vZHFZqiGFgR483fBy
         3zEw==
X-Gm-Message-State: AOJu0YwEmHxw9vWnXeeeYCsZSrsvGvJnHXVjdLAlOwXa2NpmybarkhZu
	ENVFnTc8zmDr13gUl2mxENc0wCJIZFi3yJVwe5xIJOIutCkqhCdEdPgH63tFKCagXN2AT6+ctkT
	el2RPUB4=
X-Gm-Gg: AeBDietMINGfBCtjt5zMlSsKcrTIoipjvBvO7tdFGMwSkoDc/uc/gZq1MMdEd8WLEoH
	vso4L2o5VNkJMgYUjxo+EVJAlezL77DMUds6MpaIk6r72CD6mWQsKkZwqR/J4Mp3jsv05MWkDnk
	BkYSdg4++yC1lVNX/+LfCbcOhxF24YUzgP2RiETK39XhPyNBVta/luLegvIctx1KO2Wj3HwBOz9
	r64Jg1wnA0fZmZtxUWCmZXgzoX+WHTUAHKjb3SbRrAiqWx1WR5R5atdBfU1OcrlCDYTEYm0VknA
	ONycizv8cu1IdoAOoWVCQ5/JJaySshyFA31w84afp2TvFUEiRO7xpq5gCn8zCAJib5uSmCvQZcT
	PEeaooLQzrXS5WiMjpxcPownWr4QsXgR4aLXXWNShCiivBPa/XBs3/2p0Es2ExtAS7xREujlBsY
	s75AUrpsMC5PjLLZHr1aUVfOlrUzPIqI7h2SJYkGCH5AtJXkUXOnVDRW9VjhEx+au3V8JIyxfA9
	fmqNcIx9P7ow+IYZZFW2xC9LXY=
X-Received: by 2002:a05:600c:8b08:b0:488:a977:8de with SMTP id 5b1f17b1804b1-48e51f32757mr168289075e9.16.1778186728673;
        Thu, 07 May 2026 13:45:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e642e2b29sm6443175e9.1.2026.05.07.13.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:45:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Fabien THOMAS <fabien.thomas@smile.fr>
Subject: [OE-core][scarthgap 00/23] Pull request (cover letter only)
Date: Thu,  7 May 2026 22:45:04 +0200
Message-ID: <cover.1778186461.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 20:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236620

Those are the patches from the last patch review (from Fabien Thomas):
https://lore.kernel.org/openembedded-core/cover.1777995876.git.fabien.thomas@smile.fr/T/#u

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3774

The following changes since commit dc2df90b1d4f71023169d492f3819326e0e6c055:

  liburcu: upgrade 0.14.0 -> 0.14.2 (2026-04-24 16:06:21 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

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



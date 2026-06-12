Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15989CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71884.1781274394030260711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HC7pwcHs;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso7033025e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274392; x=1781879192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=udKtinQO8ZsS2nm9n2JjIStPpUdqR6Hwsl4RhXnuacU=;
        b=HC7pwcHs4v2yugPX68ACULZXRnLYlZmEdUH1di1/KdRqq1DIg99F8lmt8VAK7f6ggq
         NrJT89N1SIRskclnP9am5zKGnzjM+GZm5g+vTivs+VwzADnhqj3hpqufT2z5Hvb8A7in
         YqkdDkcwwxJk0VGvCnqC0n7H+C/r2CT0VMLAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274392; x=1781879192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udKtinQO8ZsS2nm9n2JjIStPpUdqR6Hwsl4RhXnuacU=;
        b=YcqDhoODzTY8G97/T/3XfQmNpazhn2gSTEJ3PwfloeD7gj2iLg9zKDrvc0+dGJNohi
         7Sgi5/ooEhrVgEts0cKsLsW55akbFm+HRshDFutWxq2ufh1myilGvUUlqsEoHmk4FJFK
         nNqASgkIXO3VquVEjHcfGSm5cLylDAVcpyowHk3AwbRenbS+6H7yp1cxMswieQsUS5Ke
         qdy4KP6R5kSmL6UTkhXB/a56PHDZ3eX0beFAvrqEByXydpiwYEJALaMS8f7mlNh2BSiB
         16GvoELUtcVfW07Xco1mH7PhifVqKo18H1r9hstuu7vQRCbHLKHg0YPgXQwmwDpn9WqA
         6eow==
X-Gm-Message-State: AOJu0YyfFtoDVy1nl56WrNQU82uEYRvPvRv/xNGCjfhBdo6jT3e5OoD3
	ujPIp4GESDZ3uwA/rr3PqhS6VM818GmYejxoO+vTA4HVZ2OcdsONflXsHQ5q7Eh1KoNNu+Z2Tar
	N/6Iteg==
X-Gm-Gg: Acq92OEAttxImRhZJJd5PisGqFvcuPcYUtFBbRH569K6Xz5bA7ygS+JHYnurvS++fa1
	qMafejVq7wlFGfIgr4AKI+17PDd0yEwwQBBOjbU9IJbnEM9sitx/4FHJOXQ7Q3HIC81Py6O9WtA
	ZHjGz7ICwfb9kmkdo/nfaXTg6/NXZYDINtSlGFkLd56E/xBFjJdcUUbEHKbkqsEb4movde/NsQt
	YnvzHTFSr6o9GW5ZWyXO1A9q7heIzFrUgWoNrVvYGrmWGf5WSs3kcBEK5hMa9DBYKbjL1iVcQYJ
	EgPyTW8xzNIyvXpbgMY4ZWXr7ZCfJ1Tf/TUI0DFFppNMoguq1XhnQSZGt1p4sY6ptWH+NuVfbrf
	h2+3G+NqEI8ub8JDvFLX2IIz6IRAJEnbo09f2NKUANW2bwMoAriqm5U2sjRELi5qjK/DoR82BmD
	5q8Y/OmobxolsUPGKrloGSzjU=
X-Received: by 2002:a05:600c:1d03:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-490ec501829mr39704965e9.24.1781274392129;
        Fri, 12 Jun 2026 07:26:32 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:31 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/21] Patch review
Date: Fri, 12 Jun 2026 16:25:50 +0200
Message-ID: <cover.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238622

(Acting as LTS maintainer in training, process has been reviewed by
Yoann Congal)

Please review this set of changes for scarthgap and have comments back by 
end of day Tuesday, June 16.                                                                                                                                                                                                              
Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3980

The following changes since commit e2864ea1ac022e43af92badc701fa1e2a9571f46:

  pseudo: Upgrade 1.9.6 -> 1.9.7 (2026-06-05 11:02:52 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to 5e138a5cfb868b2b545161cb2cc706ccde307512:

  meta/lib/oe/package.py: fix path to kernel sources in save_debugsources_info (2026-06-12 11:50:34 +0200)

----------------------------------------------------------------

Enrico Jörns (1):
  devtool: prevent 'devtool modify -n' from corrupting kernel Git repos

Hugo SIMELIERE (Schneider Electric) (3):
  busybox: Fix CVE-2026-29004
  xz: Fix CVE-2026-34743
  util-linux: Fix CVE-2026-27456

João Marcos Costa (Schneider Electric) (1):
  meta/lib/oe/package.py: fix path to kernel sources in
    save_debugsources_info

Sudhir Dumbhare (1):
  nfs-utils: fix CVE-2025-12801

Theo Gaige (Schneider Electric) (14):
  go: patch CVE-2026-27142
  go: patch CVE-2026-32280
  go: patch CVE-2026-32283
  go: patch CVE-2026-32289
  go: patch CVE-2026-33811
  go: patch CVE-2026-39817
  go: patch CVE-2026-39819
  go: patch CVE-2026-39820
  go: patch CVE-2026-39825
  go: patch CVE-2026-39826
  go: patch CVE-2026-42499
  go: patch CVE-2026-42501
  go: patch CVE-2026-42504
  go: patch CVE-2026-42507

Zahir Hussain (1):
  libpng: Fix CVE-2026-33416

 meta/classes/create-spdx-2.2.bbclass          |   2 +-
 meta/lib/oe/package.py                        |   4 +-
 .../nfs-utils/CVE-2025-12801-build-fix.patch  |  44 ++
 .../CVE-2025-12801-dependent_p1.patch         |  71 +++
 .../CVE-2025-12801-dependent_p2.patch         |  81 +++
 .../CVE-2025-12801-dependent_p3.patch         | 185 +++++++
 .../CVE-2025-12801-dependent_p4.patch         | 468 ++++++++++++++++++
 .../nfs-utils/nfs-utils/CVE-2025-12801.patch  | 254 ++++++++++
 .../nfs-utils/nfs-utils_2.6.4.bb              |   6 +
 .../busybox/busybox/CVE-2026-29004-01.patch   |  41 ++
 .../busybox/busybox/CVE-2026-29004-02.patch   |  46 ++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-27456.patch           | 115 +++++
 meta/recipes-devtools/go/go-1.22.12.inc       |  14 +
 .../go/go/CVE-2026-27142.patch                | 386 +++++++++++++++
 .../go/go/CVE-2026-32280.patch                | 289 +++++++++++
 .../go/go/CVE-2026-32283.patch                | 177 +++++++
 .../go/go/CVE-2026-32289.patch                | 217 ++++++++
 .../go/go/CVE-2026-33811.patch                |  46 ++
 .../go/go/CVE-2026-39817.patch                | 105 ++++
 .../go/go/CVE-2026-39819.patch                |  48 ++
 .../go/go/CVE-2026-39820.patch                | 112 +++++
 .../go/go/CVE-2026-39825.patch                | 104 ++++
 .../go/go/CVE-2026-39826.patch                |  65 +++
 .../go/go/CVE-2026-42499.patch                |  91 ++++
 .../go/go/CVE-2026-42501.patch                | 127 +++++
 .../go/go/CVE-2026-42504.patch                |  58 +++
 .../go/go/CVE-2026-42507.patch                | 160 ++++++
 .../xz/xz/CVE-2026-34743.patch                |  68 +++
 meta/recipes-extended/xz/xz_5.4.7.bb          |   1 +
 .../libpng/files/CVE-2026-33416-01.patch      | 143 ++++++
 .../libpng/files/CVE-2026-33416-02.patch      |  53 ++
 .../libpng/files/CVE-2026-33416-03.patch      | 163 ++++++
 .../libpng/files/CVE-2026-33416-04.patch      |  53 ++
 .../libpng/libpng_1.6.42.bb                   |   4 +
 scripts/lib/devtool/standard.py               |   3 +-
 37 files changed, 3803 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-build-fix.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p4.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-27456.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27142.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32280.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32283.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32289.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33811.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39817.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39819.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39820.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39825.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39826.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42499.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42501.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42504.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42507.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2026-34743.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch

-- 
2.53.0



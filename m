Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FA3FC9802
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38617.1774823884915544197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=f0LSmurY;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso536388f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823883; x=1775428683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=avuIygeQgK1IaJO4269DAu008V2JYbcocehmon3mhdw=;
        b=f0LSmurY53RDQYAcZarvH+X6BeW+7J8EMHKjee+mOvOMTiWHZgBuP284UwvlMIIe6e
         LQRT8ev0qBrtiaUtf+mZLcQGhCbxxU8j4kaVZ/jn/QExf1nIutfR1GXsvLRp+HUK7ugb
         LVL3dyzMmElO5G0ivDcIX/M8BMM7fymBc7PDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823883; x=1775428683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avuIygeQgK1IaJO4269DAu008V2JYbcocehmon3mhdw=;
        b=rci6mRh91rRDlDcm03vgEygCCvP8Fx8Tn/MEnWx88MZhWqE/jKvJiGD8++5Ugb3ZyC
         14+6yWqlw8F5K7MYuj3ELA8KLvAZESQpUWDFWaZMOTGDVEO9TRIyAkQlMFV2WIcB3izy
         dgIS+9Ahb8Cdw4GewCL8agIliVnvhk55cUD9M9U8nysXxdcfVYTTUnJwAECS3q8Pv+wT
         ymNAvr2t4pHNH/vjARZ5UOMv9shcOsGxbK1EVMGm1f9Bq6I1Lunsleu2T8TmdaTI789g
         9H6vEIYT5ozTeDQMvzw/JQ3oCR4He5RO5/YHKiXb++CN72LIxqCX1QKNf4pSCcei5PSS
         G7UA==
X-Gm-Message-State: AOJu0Yz/nkHV+huvogUrrUgk0flqd57IJeM/48liGQPyMW62RfD9UfkT
	ybUptbXuCyYrMmxAXB2JJF61TZ23BLjB8gKTmvjPe7N8d/kZmFuIBM1dj5DCGZFtYDby0KbUUBn
	06ehSBnk=
X-Gm-Gg: ATEYQzxbHzByMItro3Wq92jWyjruERr+yY8ANT9/BR1hP894Y7mdfnmjvHDDN/ji7q/
	kZtiE2l9l9KmdXK6dL0YQKJ6CtlFxkqQ9dqFe+wkXVQLnQg9YzQl70MMh2NOVe9zQE0ZlQyR8Kd
	jm0o4Cx1JO8aHGpmUHH5fPnu1tnCqSKKDmpAm7KmrtG0Hg5+ADKaw/sPqXEpuU6snTIvhoGM3TW
	zib9Sregl6IGt1HDSjQ84S0oyrIAnClHV3pQiT0PsTaOCSqRwgCCmFGylIsh4jPjiYFhWg5MgfP
	XcwMuM/ZuAc1PffHBh1+U+fk+Ecb1fQEDoF9SgtBl9pjDgFEgX7oSHTwMhUWes7PX7VX8wdkoH6
	oZ/KlSgrXPsiqshfx16SdEWwwAYYnlJtgLgLWSroypZmHSkUE98jHG9kcbYU8tHvw8ARo/4xo0V
	6JK6ChJeU/96mTBApgYOpcJn8j5H1pBB7zJFiE3jlJUI/S4EckQyGh+gwsZ8FJuHTfXSKxajyfU
	M84furUIsQopIQ+WuqVSxQ4q3yGT5fR1fEaPg==
X-Received: by 2002:a05:6000:2902:b0:43b:45f5:eec with SMTP id ffacd0b85a97d-43b9e9d8c84mr17201296f8f.4.1774823882756;
        Sun, 29 Mar 2026 15:38:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/16] Patch review
Date: Mon, 30 Mar 2026 00:37:32 +0200
Message-ID: <cover.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234158

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, March 31.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3546
Note: This particular build had a gnutls patch that I removed because it needed a small change[0].
Build (currently running) without the gnutls patch: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3551

[0]: https://lore.kernel.org/openembedded-core/DHFLXG1K82R7.3EOQRZ2H6KW8Q@smile.fr/T/#t

The following changes since commit 41597b5260fb5ca811d0fb4ae7e65246d61734eb:

  Revert "scripts/install-buildtools: Update to 5.0.16" (2026-03-26 09:48:20 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to e6f3b2e043259650d80fb6f761797c5cf5587eb5:

  python3-pyopenssl: Fix CVE-2026-27459 (2026-03-30 00:09:38 +0200)

----------------------------------------------------------------

Hitendra Prajapati (2):
  libxml-parser-perl: fix for CVE-2006-10003
  busybox: fix for CVE-2026-26157, CVE-2026-26158

João Marcos Costa (Schneider Electric) (1):
  spdx: add option to include only compiled sources

Martin Jansa (3):
  dtc: backport fix for build with glibc-2.43
  elfutils: don't add -Werror to avoid discarded-qualifiers
  binutils: backport patch to fix build with glibc-2.43 on host

Michael Halstead (2):
  yocto-uninative: Update to 5.0 for needed patchelf updates
  yocto-uninative: Update to 5.1 for glibc 2.43

Nguyen Dat Tho (1):
  python3-cryptography: Fix CVE-2026-26007

Paul Barker (1):
  tzdata,tzcode-native: Upgrade 2025b -> 2025c

Richard Purdie (1):
  pseudo: Add fix for glibc 2.43

Sunil Dora (1):
  rust: Enable dynamic linking with llvm

Vijay Anusuri (3):
  python3-pyopenssl: Fix CVE-2026-27448
  python3-pyopenssl: Fix CVE-2026-27459
  gnutls: Fix CVE-2025-14831

sureshha (1):
  systemd: backport patch to fix journal-file issue

 meta/classes/spdx-common.bbclass              |   3 +
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oe/spdx30_tasks.py                   |  12 +
 .../CVE-2026-26157-CVE-2026-26158-01.patch    | 198 +++++++
 .../CVE-2026-26157-CVE-2026-26158-02.patch    |  37 ++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
 ...not-trigger-assertion-on-removed-or-.patch |  65 +++
 meta/recipes-core/systemd/systemd_255.21.bb   |   1 +
 .../binutils/binutils-2.42.inc                |   1 +
 ...tect-against-standard-library-macros.patch |  31 ++
 .../elfutils/elfutils_0.191.bb                |   1 +
 ...001-config-eu.am-do-not-force-Werror.patch |  34 ++
 .../libxml-parser-perl/CVE-2006-10003.patch   |  73 +++
 .../perl/libxml-parser-perl_2.47.bb           |   1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../python3-cryptography/CVE-2026-26007.patch | 149 ++++++
 .../python/python3-cryptography_42.0.5.bb     |   1 +
 .../python3-pyopenssl/CVE-2026-27448.patch    | 124 +++++
 .../python3-pyopenssl/CVE-2026-27459.patch    | 109 ++++
 .../python/python3-pyopenssl_24.0.0.bb        |   5 +
 meta/recipes-devtools/rust/rust_1.75.0.bb     |   2 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../0001-Fix-discarded-const-qualifiers.patch |  85 +++
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |   1 +
 .../gnutls/gnutls/CVE-2025-14831-1.patch      |  61 +++
 .../gnutls/gnutls/CVE-2025-14831-2.patch      |  30 ++
 .../gnutls/gnutls/CVE-2025-14831-3.patch      |  45 ++
 .../gnutls/gnutls/CVE-2025-14831-4.patch      | 200 +++++++
 .../gnutls/gnutls/CVE-2025-14831-5.patch      | 500 ++++++++++++++++++
 .../gnutls/gnutls/CVE-2025-14831-6.patch      | 119 +++++
 .../gnutls/gnutls/CVE-2025-14831-7.patch      | 150 ++++++
 .../gnutls/gnutls/CVE-2025-14831-8.patch      | 105 ++++
 .../gnutls/gnutls/CVE-2025-14831-9.patch      | 437 +++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   9 +
 34 files changed, 2600 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
 create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch



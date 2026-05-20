Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014C5CD5BAE
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7273.1779265255256383723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=D8gMB3uS;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d7645adbdso3027848f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265253; x=1779870053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H7D4q6q8TGpI/1sGC1P2NXplxqWFMRh+iSy9J4qbqf4=;
        b=D8gMB3uSqOVSQmtp5S3xoPe8YkZ74KJf63O5gyPNZ9166KFaZh9ofpIJIZ8PkBg7q4
         GFa51krGA+IUEbn2JW/Me2z5Y4vKD/goCvgD1ANigiC19KrXHIr7XjOUZGCcO2W8SmnS
         65YzlAAqHShq8KT9dGl6FZBIfr5fGVBLfotW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265253; x=1779870053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7D4q6q8TGpI/1sGC1P2NXplxqWFMRh+iSy9J4qbqf4=;
        b=D9PI7fDB1qLbl7aPZIqTlw6dUHJW679wj67wMPtXWeF2nzz34BVv/kmqrl5K7v/3jB
         fMVh8TlIYJ+cox0rZjsz3+OBvp5td+auY9vNSnUfiUrMNRq2SrqvJJqYtKLbcE54VZX6
         Og86W4/mgYvmBGxXf1cN+zmfgXraEma9JjYWv4lWI3KuIm5IRnwRb815XfKKIL0KAjya
         LTHq8uxDC3P9diwbapiPftk+qoyMc+B0invIKFZkGndwkyi0E31uzdjCSIz7ggSZHeJw
         CVoqPf9x0KaPGz+m0LQqa2HzVC7yCHCMk/ms/oRYoswI3Vn04aqM1wGG6cKPHUPhi0Jv
         yI+Q==
X-Gm-Message-State: AOJu0YwiICcC3fiya+FhI0nuJ7ZL7JOQSP3chxVXwsV48r/cqGEm0VRH
	D0XwCJmaC3HZEoTJfNrAz1v6aGHohEfEW2XGH/g4NDSAP4F5Ej/Mxk9Bp/iil8h0fRfX4k2gJqb
	dmKzR
X-Gm-Gg: Acq92OGk0SW81DeNdzmyzH3UHyomwLLmi5zDER1Q/X3+pgH9Z54jhYy6qN6G5hSafLq
	I9/MgozJN1LW0FtZ7ZkJGErkgdPSDsbRj0/o7U0vtMgV7bpIlMLViA8949zBDWgVkrZZsY7DXyt
	0fmatV/lSJAnXl78D40X/dPOTpsritPqzw9ZAiWkj/lp8Dp3nlsZIU+ynlQkNHJmlfebC2ceQuY
	UZXpQU8IEhlv8dMIsNaKKKjWzsZ2Skq4kArH0rjnIdN1NBwCItNkgOrm8HmaRyYPNhN0P4i3jPa
	YENTXPABV8PaeOsQaN8Xn4YvyTNRXXcLDTp2NVbwLoUhhARTRbSX3pYgJ6v3IN1Kqp2MJvY4Azs
	K5chySchW2w4gF+k0ZK1W1xUFhIEbfLXYPmjNK2jeDp/ZnIyk2ALg2IexaRdUg7v9yMmwvCKE0a
	K6l/K7u97YdjGicE3vjl08nsO2E4y350e0j3Apl7K7pNN7kUUfEqmJai3SX+aNcI7sn/LGf/cbu
	8YpWmTA5bkZrkVInPZJikVbmW4n
X-Received: by 2002:a05:6000:2503:b0:451:4d47:c9d9 with SMTP id ffacd0b85a97d-45e5c367265mr36973019f8f.14.1779265253456;
        Wed, 20 May 2026 01:20:53 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.20.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:20:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 00/28] Patch review
Date: Wed, 20 May 2026 10:20:01 +0200
Message-ID: <cover.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237399

Please review this set of changes for wrynose and have comments back by
end of day Thursday, May 21.

This is the v2 of https://lore.kernel.org/openembedded-core/cover.1779232800.git.yoann.congal@smile.fr/T/#t
v1->v2:
* Removed "[OE-core][wrynose 11/28] libsdl2: set status for CVE-2026-35444" 
* Added "busybox: fix CVE-2026-29004"

A build for this v2 series is running here:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3851
I've run the added busybox patch through autobuilder in an earlier
series, so I'm confident that this build will be OK (AB-INT excepted).

The following changes since commit 080e184ad9a07b469da7e8b045a93cefd5bf2438:

  glibc: Fix recipe bug that disabled stack protector (2026-05-12 16:18:27 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to 42adcd87a15f5921f0cc95424efd930876743824:

  pseudo: Upgrade 1.9.6 -> 1.9.7 (2026-05-20 10:03:07 +0200)

----------------------------------------------------------------

Alexander Kanavin (1):
  sbom-cve-check: set PV from upstream tags and ensure version checks
    are correct

Andrew Geissler (1):
  efivar: Backport patch to fix -march issue for ppc64le

Ankur Tyagi (2):
  tzdata/tzcode-native: upgrade 2026a -> 2026b
  wireless-regdb: upgrade 2026.02.04 -> 2026.03.18

Benjamin Robin (Schneider Electric) (3):
  python3-sbom-cve-check: Update to version 1.3.1
  sbom-cve-check-update-cvelist-native: Update source revision
  sbom-cve-check-update-nvd-native: Update source revision

Chen Qi (1):
  busybox: fix CVE-2026-29004

Daniel McGregor (1):
  python3-requests: Increase chardet upper limit

Dmitry Sakhonchik (1):
  shadow-native: Change upstream status of disable_syslog.patch

Jinwang Li (1):
  bluez5: add patches to fix 8.56 gatt issue

João Marcos Costa (1):
  default-distrovars.inc: add missing spaces in append overrides

Peter Marko (7):
  busybox: patch CVE-2024-58251
  libsoup: set status for CVE-2026-2369
  tiff: patch CVE-2026-4775
  libssh2: patch CVE-2026-7598
  libarchive: set status of CVE-2026-5745
  libsoup: patch CVE-2026-2708
  glibc: stable 2.43 branch updates

Quan Sun (1):
  qemu: fix iotlb_to_section() for different AddressSpace

Richard Purdie (2):
  utils: Handle unexpanded variables in DISTRO_FEATURES
  pseudo: Upgrade 1.9.6 -> 1.9.7

Robert P. J. Day (1):
  features-check.bbclass: add reference to required TUNE_FEATURES

Sam Kent (1):
  oe-pkgdata-util: fix empty runtime-rprovides directory handling

Thomas Perrot (2):
  oe-pkgdata-util: fix runtime-rprovides handling in lookup_pkg error
    path
  scripts/makefile-getvar: quote MAKEFILE variable

Yoann Congal (2):
  README: Add wrynose subject-prefix to git-send-email suggestion
  b4-config: add send-prefixes for wrynose

 .b4-config                                    |   1 +
 README.OE-Core.md                             |   2 +-
 meta/classes-recipe/crosssdk.bbclass          |   3 +-
 meta/classes-recipe/features_check.bbclass    |   2 +-
 meta/classes-recipe/native.bbclass            |   3 +-
 meta/classes-recipe/nativesdk.bbclass         |   3 +-
 .../distro/include/default-distrovars.inc     |   8 +-
 meta/lib/oe/utils.py                          |   9 +
 .../0003-fix-march-issue-for-ppc64le.patch    |  45 +++
 meta/recipes-bsp/efivar/efivar_39.bb          |   1 +
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...use-after-free-caused-by-reentrant-c.patch |  59 ++++
 .../busybox/busybox/CVE-2024-58251.patch      |  51 ++++
 .../busybox/busybox/CVE-2026-29004-01.patch   |  42 +++
 .../busybox/busybox/CVE-2026-29004-02.patch   |  47 +++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   3 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.43.bb         |   4 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
 ...01-Increase-chardet-upper-limit-to-8.patch |  25 ++
 .../python/python3-requests_2.32.5.bb         |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...tlb_to_section-for-different-Address.patch | 274 ++++++++++++++++++
 ...3.0.bb => python3-sbom-cve-check_1.3.1.bb} |   4 +-
 ...check-update-cvelist-native_2026-05-07.bb} |   4 +-
 ...ck-update-nvd-native_2026.05.07-000006.bb} |   4 +-
 .../libarchive/libarchive_3.8.7.bb            |   1 +
 .../shadow/files/disable_syslog.patch         |   3 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 ....02.04.bb => wireless-regdb_2026.03.18.bb} |   2 +-
 .../libtiff/tiff/CVE-2026-4775.patch          |  55 ++++
 meta/recipes-multimedia/libtiff/tiff_4.7.1.bb |   1 +
 .../libsoup/libsoup/CVE-2026-2708.patch       | 218 ++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   2 +
 .../libssh2/libssh2/CVE-2026-7598.patch       |  56 ++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
 scripts/makefile-getvar                       |   4 +-
 scripts/oe-pkgdata-util                       |  19 +-
 38 files changed, 934 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2024-58251.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
 create mode 100644 meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-8.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.0.bb => python3-sbom-cve-check_1.3.1.bb} (76%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native.bb => sbom-cve-check-update-cvelist-native_2026-05-07.bb} (77%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native.bb => sbom-cve-check-update-nvd-native_2026.05.07-000006.bb} (79%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} (94%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch



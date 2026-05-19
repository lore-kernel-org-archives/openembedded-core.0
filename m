Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB24CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.949.1779233428017403818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lFUHfYi2;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490229aa522so9063955e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233426; x=1779838226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XAdDsVRlsx24y3Mbvw85NTxS2MzMCPm2kaWb2bKfz1I=;
        b=lFUHfYi2MBu+8eL9su8qGgLtRtx3yPxkNFUudc9/hCAk2za3ZBvNGsJmv9gjKSN5l8
         V3zX0UjSx+boRm5hThNNr7NHpC1hFXj+J5cV8Z419MbPDmiczUdXHSzDrPIZzRlHy6r4
         xD3u+1PC+ZGpVM1wOU53M3et9TnI/RgFQ3hI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233426; x=1779838226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAdDsVRlsx24y3Mbvw85NTxS2MzMCPm2kaWb2bKfz1I=;
        b=rRd1kZb5iEKfAW6irai1740m38ejjddWHd2beVENtwjcj28QAp2OMUK83XhG6vFQys
         lPIiUHNP0dq9VPH0MNEy/PZ2XaITp4LQNA2u4UxlTfLGDUixFSz3v0okG3GRN/USqMK1
         eJZ17V8xb8gGS2xpI7Cwl+RH/lFbh6KjDdb7vi7pGgHCyJikq9aJ+ItDkGt5TLiWBo08
         GIAjjj4oECgaBnClOLCefwqSYbmC8WyhGVpWTlyKCbLQwr2PRaiTMJYAfMV9lU721QU3
         lqjbolRQL9qudOIxSQL8TaTr2tujatu96ACFHKobJY53nBzNYtNeKZdAqkCF+FtFWmKl
         lcIQ==
X-Gm-Message-State: AOJu0Yy/4DuX03qUCxRtAJM9Hsq7I2+CEexC1AiU+IRl6EmSaMQysz7k
	ZnOVAb3nYSC+Jcc2iE9bezLz8Bly6vOmHHOH7t7AYCOz1xLgmSJrCo7vUkJBKS4rBv/eKUp3A0k
	7nDfS
X-Gm-Gg: Acq92OGsMCTKfrgZs6idUBcMGjsFWs3qLuFJNnM5DCeoJH9fMmhqOiWHzSvbFu35aNn
	6aaW3HEZC1bweAT3BoCuLLdWe1Drtv1C4uQ3FbpwxplvOqGV5ySDW6HUdPd4I1xc6KKkmqar2Eu
	s59zTiUr/MRi17vDJ4ZPu4x0UTCpXraz2sODIBCEvMG+DA3F72+rXr5Pyf+w2ip9+CTNhEqu3LF
	sg3G6b+9PAcHF3vvqle6mCkUGTLg9Xx6ZLv6ZVgwf/uvU/8iMzA86fkot0gbSa0CnH6GX21WBCT
	VhsweBSCNKmmytkHs0iK45Jxg+HdXrXCiKlFkUwgJVipajeqpVkbW8xmnb4umy87nqhwGf+RZ3V
	QxQbaJVwWDkGeynrUlPygxatZ9ajoEFuyyH0HIBfqZMt5WknvoyVcLykJnQGA/IRE3y8GElXMfi
	xxcubiLNbEA6O3TjMi7Qm317Ke+SZ4D5Oant8/KFp524W13I7IiBBvkykxHYpaWQzJiYonJX9db
	0RjUclMQd11TqQIxtV/G4yRPKo=
X-Received: by 2002:a05:600c:8485:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-48fe5fcdec2mr336083305e9.4.1779233425718;
        Tue, 19 May 2026 16:30:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/28] Patch review
Date: Wed, 20 May 2026 01:29:37 +0200
Message-ID: <cover.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237347

Please review this set of changes for wrynose and have comments back by
end of day Thursday, May 21.

Passed a-full on autobuilder with some AB-INT issues:
* https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3846
  * check-layer https://autobuilder.yoctoproject.org/valkyrie/#/builders/27/builds/3851
    Failed due to 16285 – AB-INT: check-layer: unexplained changed signatures
    retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/27/builds/3852
  * qemux86-64-ptest https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3688
    Failed due to 16279 – AB-INT: groff error: couldn't exec preconv: No such file or directory
    retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3689
  * qemuriscv64-ptest https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1610
    Failed due to 16215 – AB-INT PTEST RISCV64: libpng ptest failure
    Retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1611
  * oe-selftest-debian https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3878
    retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3879
    git.openembedded.org hung up a HTTP git clone connection
  * oe-selftest-fedora https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3740
    retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3741
    git.yoctoproject.org hung up a HTTP git clone connection
I attribute the last 2 to the current situation with bot scrappers.

A new build is running here:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3847

The following changes since commit 080e184ad9a07b469da7e8b045a93cefd5bf2438:

  glibc: Fix recipe bug that disabled stack protector (2026-05-12 16:18:27 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to 410768131f4a95394f91cfe32808f56c99c660eb:

  pseudo: Upgrade 1.9.6 -> 1.9.7 (2026-05-20 00:37:26 +0200)

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

Daniel McGregor (1):
  python3-requests: Increase chardet upper limit

Dmitry Sakhonchik (1):
  shadow-native: Change upstream status of disable_syslog.patch

Jinwang Li (1):
  bluez5: add patches to fix 8.56 gatt issue

João Marcos Costa (1):
  default-distrovars.inc: add missing spaces in append overrides

Peter Marko (8):
  busybox: patch CVE-2024-58251
  libsoup: set status for CVE-2026-2369
  libsdl2: set status for CVE-2026-35444
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
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
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
 .../libsdl2/libsdl2_2.32.10.bb                |   2 +
 ....02.04.bb => wireless-regdb_2026.03.18.bb} |   2 +-
 .../libtiff/tiff/CVE-2026-4775.patch          |  55 ++++
 meta/recipes-multimedia/libtiff/tiff_4.7.1.bb |   1 +
 .../libsoup/libsoup/CVE-2026-2708.patch       | 218 ++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   2 +
 .../libssh2/libssh2/CVE-2026-7598.patch       |  56 ++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
 scripts/makefile-getvar                       |   4 +-
 scripts/oe-pkgdata-util                       |  19 +-
 37 files changed, 845 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2024-58251.patch
 create mode 100644 meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-8.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.0.bb => python3-sbom-cve-check_1.3.1.bb} (76%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native.bb => sbom-cve-check-update-cvelist-native_2026-05-07.bb} (77%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native.bb => sbom-cve-check-update-nvd-native_2026.05.07-000006.bb} (79%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} (94%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch



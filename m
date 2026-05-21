Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C58CD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 15:46:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39899.1779378405109054285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 08:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ujjh0LSs;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a14580111so4758837f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779378403; x=1779983203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vUm03ph0K5apGAabHGAfHRd1NXlwVMsK2476mENiQgY=;
        b=ujjh0LSsapI0+cq1NSPbF3XfkxdptdBYnliiPmwEJwwko1FrjlXWmnDu+VfDFer8Uu
         7twj8zQSIxgeycz61WWFcmCVY4eLRpoa2oBQalUzmSr4HRSzs9xFMHr4xiSf1ns1UGKp
         FRbVnZHiRKIj0NiRlvlOQtz5fnFm07gGpa3l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378403; x=1779983203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUm03ph0K5apGAabHGAfHRd1NXlwVMsK2476mENiQgY=;
        b=S6s0BfmGxhXmsl0oCCfkqMuVxfxPIBDoKyiSV0B9Qv1As6DkuQWrc8ZSwNQpAqnLne
         m7S4bd7u2nVO5y5n2I3zJH75g5dMOXv258I4BBfa+3iksyIqQvNAH5b/c24rU8WGITIb
         Ji/R9WShOxejGzem4mJbEpA5AHR1Haax5ZT2zozN7xhF+lq8hx1DXLGQZx5rj0YU5kdi
         +TcnCTY7IAiRFFgmDKd6JEETuQXmmHSCjEg/Jy3GpGquUt7MjsupoIXy9OH5FGfpVxrK
         dFPfjtdMl/KZ7WZmulj5pKf39lCUSduht7/L3LtoHloWW5wJLkxCkYInkVU0qGfas6SH
         t+BA==
X-Gm-Message-State: AOJu0YyE/IuVh384OuGQ5s2j052y8OXfoUkm0UmgyeZ39SDjNFVBaL1C
	feFL3xnueG0jCim9Seh9N4KHxo9lq3EegfpQg5OGhySkflbxf9OxR8I2OWacCy9L+SdmW+endrU
	rPGxb
X-Gm-Gg: Acq92OFXp42MDypt6JIkA9XJnTx9QyD0weJxl73Y4/wQtPeiY+82Aaa83EiGl5ouQrg
	+sArJcbsXoizyZefYxccZQ7Pj2kzNG3NReN/SEOUvetj8HVEEQ90niDmvDclwAAq1kZN/770BC5
	sZGREcY+Yj34NIk01VHkfMhr0RHcI0hYJxJmyYqrEA6hobmTIO2v5YuJN82xOmgAcILsGopelXp
	RI1NqZqkARXpfYK1vK2tGsLaPiI0WioecyjX6+HFRFqldYKRrm38mVSuEvjlDRIGCbWwZlGTMtU
	C6gbG0Jyq+5uNg0IxdxU75PtUuknWzkBMOQcyZyQUURj3iIjx3VR1itDowOHexJl18b/JajKPGi
	ecnK1nDDZo86CvoN+F1kkg4GIlt5D5Bre3Q7SQZRrO69l6Il6GQVQ9W2wwWbnbJmdLE62u9xhfo
	ybbH60oSeXswEdtd9hO8+UXx5hmFB5sjHdl4F00L2KwRy8ihJwkJQTHwM1FidwnyU+F3k7YbGrS
	+HibAGYJXeQp2kx9qkHGXvgzCc=
X-Received: by 2002:a5d:584c:0:b0:452:c246:ab69 with SMTP id ffacd0b85a97d-45ea38c687bmr6343844f8f.13.1779378403165;
        Thu, 21 May 2026 08:46:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cf1c2sm3715031f8f.4.2026.05.21.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:46:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/28] Pull request (cover letter only)
Date: Thu, 21 May 2026 17:46:28 +0200
Message-ID: <cover.1779377938.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 15:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237515

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1779264709.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3851
Got some AB-INTs but nothing related to this series:
* qemux86 https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3766
  => Bug #16284 – AB-INT: do_testsdkext failed with no clear reason
  retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3767
* oe-selftest-debian https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3884
  & oe-selftest-fedora https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3746
  => Reported: 16292 – AB-INT: Hung up HTTP connection while fetching on git.yp.org and git.oe.org
  retried as:
    https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3885
    https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3747
* qemuriscv64-ptest https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1616
  => I reported it: #16290 – AB-INT PTEST RISCV64: procps ptest failure (pgrep_match_against_full_process_name)
  Retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1617

The following changes since commit 080e184ad9a07b469da7e8b045a93cefd5bf2438:

  glibc: Fix recipe bug that disabled stack protector (2026-05-12 16:18:27 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

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



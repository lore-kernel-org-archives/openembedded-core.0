Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7373DC98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:53 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33577.1790495020538215252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GYSuFVdS;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so10364225e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495019; x=1791099819; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXJmf00KiHtnB6AX1W2Sgt6ttjB1NZRE7KJPBvuks2M=;
        b=GYSuFVdSDk2YfeN1/2hesZp+ZpicSmLzAiFRrrjhaPmMjb1oDzsnZSsNDEc/t9MyJP
         fzIC/HRUh1JqMzgmddhlURy9KiQFx1Bf36SmvBTHUhwZN7r88bTdraHJ2KYittRI2gza
         zK55v4kbqiUVcCjWXaQoXkVzhi8yFLFGvSZgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495019; x=1791099819;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXJmf00KiHtnB6AX1W2Sgt6ttjB1NZRE7KJPBvuks2M=;
        b=lguAFS/z+XfEYegi3t1dp3jVEznGcjIF8lW+v7ZsTeFe10lL2cBS/oreP6miChHsQs
         wHMLo6PueUGCrrx7TfLa9tXjUUIr0hHxTlxHdBpV+QmVX25zSEaMa+Q9DNoCl0ds21gc
         WJrg3p4xnBu5orCjDh+SX9XhWuFiyXKZcU7wKyh/4NrqrVjZD/LpZe1+A12IQWRuJFXY
         7g4QDflSXYKPm+F1RbHFKvUiCTDGDN4WW2zbDyIpuHSb/hwZQdHIefTMm+w0YyLQiZZM
         xZi7D/e98EFP59JoZd9TY9wTMMVyKTqJEJfiEHsLwXsie/oygA6ZTzV38FN82+zQ9OAL
         40OA==
X-Gm-Message-State: AFuF++nBX71d3ZHUUbEYnC1mEiWJdUbM0CclV4Uxeev8Lb5IeVznd54p
	w1Ho6BkrJnAY2KgglI+ojZufsMRswV4xnhfhZaf0wNX757/XUUTzO7asCFC6S8aurP/HG8iuJR6
	mktxer/4=
X-Gm-Gg: AYBFou0NYfLPZwRLqAaI/bkawXvgWuSlbOTkgcaeh+rdfsx+Jz7+TXWWOYc6O2LPpAK
	0t/o0eT16B/a9eXbai3vvtP/J8li8Lf56584C4tpSkOq7ka7KxkcZ5b7IwTC55b56IiII2KM7X/
	AtHmg11FPNC45qfXfRkRpPurfJYCqsIvLTo90T4cQBzGGHSbYxK9KSL0Qaot0b5dDmFAQQXLzOv
	SBsKpCek7qYUVb0q+X3uaHthaOW9TWVeYWOgIdCptil7l8w1j9Ol0p6ZUqv5Sw2+IR+67JmK+6z
	Dd5fg+w2FUJcTxMxCuW39dzY1xW0L57PRAtVsiDHZm2Knn3IQlYRUuOQqigaUpyx5fwWRfM8JmB
	is8wxZXlutV5YVPKLV45aK1pf0jittF42HG+KxzArourIP5ppSx9vLfJtk0fPnVfJMsfuSvRZUP
	bAlxVIBUpHbXIYjZ8UKVRbBe4Y2voLKYhcREM6L8jbRwTQ9uBssYps/uGlercjpiGdRjdwC8Sii
	RjsKWX/M/w5jNfTZHf5DmuHlnVVlmcHAFEVo/j0mdCpvuuNcynEn1c6OTo0bbJCgQ2XZG3X3Q==
X-Received: by 2002:a05:600c:6388:b0:4a0:1d2:1a8a with SMTP id 5b1f17b1804b1-4a001d21b90mr12736475e9.16.1790495018309;
        Sun, 27 Sep 2026 00:43:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/28] Patch review
Date: Sun, 27 Sep 2026 09:42:51 +0200
Message-ID: <cover.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246650

Please review this set of changes for wrynose and have comments back by
end of day Tuesday, September 29.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4811

The following changes since commit cc4695f65beb6e5069fbecc16475fa5a27c768e9:

  mesa: align x86 mesa config with LLVM graphics (2026-09-24 12:36:03 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-review

for you to fetch changes up to 40993b0c42411caa5df71a75739b569fdffe981f:

  linux-yocto/6.18: fix kernel reproducibility issues (2026-09-26 23:10:37 +0200)

----------------------------------------------------------------

Adrian Freihofer (1):
  bitbake.conf: pseudo add rootfs-dbg to PSEUDO_INCLUDE_PATHS

Ankur Tyagi (3):
  ffmpeg: mark CVE-2026-52295, CVE-2026-52296 and CVE-2026-52297 fixed
  libxfont2: patch CVE-2026-59679
  libxfont2: patch CVE-2026-44950

Benjamin Robin (3):
  sbom-cve-check-update-db: Exclude recipes from rm_work
  python3-sbom-cve-check: update to version 1.3.4
  python3-sbom-cve-check: update to version 1.3.5

Bhavesh R Maheshwari (3):
  ffmpeg: Fix for CVE-2026-66037
  ffmpeg: Fix for CVE-2026-66038
  ffmpeg: Fix for CVE-2026-66039

Bruce Ashfield (4):
  linux-yocto/6.18: rt: update to v6.18.37-rt6
  linux-yocto/6.18: update to v6.18.50
  linux-yocto/6.18: update to v6.18.52
  linux-yocto/6.18: fix kernel reproducibility issues

Daniel Dragomir (1):
  toolchain-scripts: fix kernel host tool builds broken in the SDK

Devansh Patel (1):
  vim: Fix CVE-2026-28417 hostname regression

Jonas Juffinger (1):
  kernel-fit-image: Don't add hash node when signing is enabled

Peter Marko (2):
  go: upgrade 1.26.7 -> 1.26.8
  fmt: update branch name to main

Richard Purdie (4):
  dhcpcd: upgrade 10.3.1 -> 10.3.2
  sbom-cve-check-update-{nvd-native,cvelist-native}: upgrade 2026.08.25
    -> 2026.09.12
  sstate: Update mtime/atime for sig/siginfo files in
    sstate_checkhashes()
  sstate: Update unpack touch code to be consistent

Roopa Kalmath (1):
  qemu: fix CVE-2026-48914

Tim Orling (1):
  at-spi2-core: RDEPENDS on gsettings-desktop-schemas

Wang Mingyu (1):
  sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native:
    upgrade 2026.08.03-000011 -> 2026.08.25-000009

Xiuzhuo Shang (1):
  bluez5: restrict delta=0 RSSI to proximity filters

Yoann Congal (1):
  cpio: fix "CVE:" marker in CVE-2026-66484.patch

 meta/classes-global/sstate.bbclass            | 16 +--
 meta/classes-recipe/toolchain-scripts.bbclass |  2 +
 meta/conf/bitbake.conf                        |  2 +-
 meta/lib/oe/fitimage.py                       |  2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |  8 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ct-delta-0-RSSI-to-proximity-filters.patch | 86 ++++++++++++++++
 .../{dhcpcd_10.3.1.bb => dhcpcd_10.3.2.bb}    |  2 +-
 ...mprove-the-sitation-of-working-with-.patch |  2 +-
 ...-conflict-error-when-enable-multilib.patch |  4 +-
 ...e-INCLUDEDIR-to-prevent-build-issues.patch |  4 +-
 meta/recipes-devtools/fmt/fmt_12.1.0.bb       |  2 +-
 .../go/{go-1.26.7.inc => go-1.26.8.inc}       |  2 +-
 ...e_1.26.7.bb => go-binary-native_1.26.8.bb} |  6 +-
 ..._1.26.7.bb => go-cross-canadian_1.26.8.bb} |  0
 ...{go-cross_1.26.7.bb => go-cross_1.26.8.bb} |  0
 ...osssdk_1.26.7.bb => go-crosssdk_1.26.8.bb} |  0
 ...runtime_1.26.7.bb => go-runtime_1.26.8.bb} |  0
 .../go/{go_1.26.7.bb => go_1.26.8.bb}         |  0
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-48914.patch            | 60 +++++++++++
 ...3.3.bb => python3-sbom-cve-check_1.3.5.bb} |  2 +-
 ...check-update-cvelist-native_2026-09-12.bb} |  2 +-
 .../sbom-cve-check-update-db.inc              |  1 +
 ...ck-update-nvd-native_2026.09.12-000023.bb} |  2 +-
 .../cpio/files/CVE-2026-66484.patch           |  2 +-
 .../xorg-lib/libxfont2/CVE-2026-44950.patch   | 99 +++++++++++++++++++
 .../xorg-lib/libxfont2/CVE-2026-59679.patch   | 93 +++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |  2 +
 .../linux/linux-yocto-rt_6.18.bb              |  6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 ++---
 .../ffmpeg/ffmpeg/CVE-2026-66037.patch        | 39 ++++++++
 .../ffmpeg/ffmpeg/CVE-2026-66038.patch        | 50 ++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-66039.patch        | 38 +++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  6 ++
 .../atk/at-spi2-core_2.60.0.bb                |  2 +
 .../vim/files/CVE-2026-28417-regression.patch | 65 ++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 39 files changed, 596 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.1.bb => dhcpcd_10.3.2.bb} (97%)
 rename meta/recipes-devtools/go/{go-1.26.7.inc => go-1.26.8.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.7.bb => go-binary-native_1.26.8.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.7.bb => go-cross-canadian_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.7.bb => go-cross_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.7.bb => go-crosssdk_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.7.bb => go-runtime_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.7.bb => go_1.26.8.bb} (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-48914.patch
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.3.bb => python3-sbom-cve-check_1.3.5.bb} (82%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-08-03.bb => sbom-cve-check-update-cvelist-native_2026-09-12.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.08.03-000011.bb => sbom-cve-check-update-nvd-native_2026.09.12-000023.bb} (89%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-44950.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-59679.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66037.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66038.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66039.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression.patch



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42C9CA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 08:52:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4876.1791363155923113713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 01:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0IsOT8fV;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16c399641so15743965e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 01:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791363154; x=1791967954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmvoD6bz1PJK2NiW7SUDatJzoBdMEspZcc2CQf7SctE=;
        b=0IsOT8fVkuxTTRfxbZz5Q0Ph5AGd44yg95VybTYeSssHKdV1qdKm0NCHXWwMwLeBSp
         UTTDNj0GeZN+Q1Qox3XOpNPIu+Zl4eAs0gnMoi17EDBHC93VWTQsYvdV4qiRF+n+ecEe
         EQXko//RUURIEksNcLuyyk1tQNRS7ZnbQlJrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363154; x=1791967954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmvoD6bz1PJK2NiW7SUDatJzoBdMEspZcc2CQf7SctE=;
        b=gbNwiJ6sY4dK1oIu3axOAxUYCC2yikXwPA9rfn+4BCDnJD1umU9k1hyjdrtYAH6feM
         CTniNAwdwf5NY5hNuSyutqpYTvlTpGju0TSoESIVRrp5UbHzugNWJCF5Pf+wE0bsviqo
         S6tGo9T5Hv8/bjC50IdH/fj9JdiZ+k2N0XmkvDygv8foo/Kp9cs5ifhSQ8Vgppzz7/KX
         6hjzV15wG1ERyLRCUgy66T5k+nXP18XAjowM8g+tBbJF7m0Ti4BTCUiNoFCiK/vx0PR6
         Bch+MmsAQ4s19op0UbkGlP4BszzcXZHq4Fplx8+bQIelV4Qk7p7YeefelR7oXlpizy64
         /geA==
X-Gm-Message-State: AFuF++nqAHPwEIYSAclqYawG481L1kZtaLJ2eak3PGO+OuUujhklMHXt
	zZDv6Rn5l0g4UEfv+tEX+jSBuyaSgtCkQwp4gjt2R86LVJ5msQhHX3g6iVVMD71JrJ7O8oP4YAq
	Bp/HHw94=
X-Gm-Gg: AYBFou2vHxFeVUXOUjryew7H3pugfeBUsrVbRuePS1qTNbgLCg6TAPzoL2F9YA6JuKO
	9hVE7dULJn3Rq0YgPOGup8ogs99vA2sVqbfOBtgX3yO7bn4UhOToP3ReE3lc6lePZBH3M94KkCB
	cyljO+hywLJVDhlOKb3zuPK165eecHN8NVoLE2VD00dwOETqNzAE2rsOlW8uTpyZScsRurCSyyM
	Fst4EKiRKcFS+/sIwRqjshsquUS0ivC5M97W5pY2TIkd9XoniHfR7xoz1z6gTUTZiWM2TIlkaTR
	H4JWoTh5oCWiGCOeb6p04PVwMQW1WxW8grGE0hv8wZoquGXQhtCPIMw9b/P9dXgefxwGiKqvopj
	ycoK9YoVNnS72bEQ1HKCD9c9c8sPTguvex2HBFbYbrwyQfDHFpoXUPUu1QguDvWKrFHZM2OVm9B
	jpYIl8uyvrLmmLHPiCWgLviYMKctbTSc/hSUCSyTWlcu6pl6sjYIrsPw2d43o5mNEJvbu4saQ0g
	/07gw==
X-Received: by 2002:a05:600d:864b:20b0:4a1:82b7:72d3 with SMTP id 5b1f17b1804b1-4a182b772famr1794325e9.20.1791363153661;
        Wed, 07 Oct 2026 01:52:33 -0700 (PDT)
Received: from FRSMI25-LASER ([176.159.111.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3f05asm5825664f8f.55.2026.10.07.01.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:52:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 0/8] Pull request (cover letter only)
Date: Wed,  7 Oct 2026 10:52:12 +0200
Message-ID: <cover.1791363018.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 08:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247380

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1791061402.git.yoann.congal@smile.fr/
(No reviews, no changes)

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4868
* qemux86-tc failed with
  Bug 14259 - AB-INT: NFS mounting issue on qemu oe-selftest glibc.GlibcSelfTestSystemEmulated.test_glibc
  that I reopened.
  Retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/28/builds/4746
* oe-selftest-fedora failed with
  Bug 16206 - [scarthgap] AB-INT: runtime_test.SystemTap.test_crosstap_* failures
  Retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4801

The following changes since commit 07ca97baad7b182849ee50f0bd629b68dc9f53b3:

  time64: enable 64-bit time/file-offset flags for 32-bit nativesdk (2026-09-24 08:54:34 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 827730f97b522c4ab31dd2b7b5a33a4933c94750:

  python3-pyasn1: fix CVE-2026-59885 (2026-10-02 17:46:50 +0200)

----------------------------------------------------------------

Deepesh Varatharajan (1):
  glibc: Fix CVE-2026-6238

Devansh Patel (1):
  vim: Fix CVE-2026-28417 regressions

Jakub Szczudlo (Nokia) (1):
  expat: upgrade 2.6.4 -> 2.8.3, exception security update

Richard Purdie (2):
  sstate: Update mtime/atime for sig/siginfo files in
    sstate_checkhashes()
  sstate: Update unpack touch code to be consistent

Tim Orling (1):
  at-spi2-core: RDEPENDS on gsettings-desktop-schemas

Yogita Urade (2):
  python3-pyasn1: fix CVE-2026-30922
  python3-pyasn1: fix CVE-2026-59885

 meta/classes-global/sstate.bbclass            |   16 +-
 ...ests-Cover-indirect-entity-recursion.patch |  103 --
 .../expat/expat/CVE-2024-8176-01.patch        | 1477 -----------------
 .../expat/expat/CVE-2024-8176-02.patch        |  248 ---
 .../expat/expat/CVE-2024-8176-03.patch        |   35 -
 .../expat/expat/CVE-2024-8176-04.patch        |  115 --
 .../expat/expat/CVE-2024-8176-05.patch        |   78 -
 .../expat/expat/CVE-2025-59375-00.patch       |   52 -
 .../expat/expat/CVE-2025-59375-01.patch       |   48 -
 .../expat/expat/CVE-2025-59375-02.patch       |  109 --
 .../expat/expat/CVE-2025-59375-03.patch       |  127 --
 .../expat/expat/CVE-2025-59375-04.patch       |   62 -
 .../expat/expat/CVE-2025-59375-05.patch       |   64 -
 .../expat/expat/CVE-2025-59375-06.patch       |   68 -
 .../expat/expat/CVE-2025-59375-07.patch       |   52 -
 .../expat/expat/CVE-2025-59375-08.patch       |  577 -------
 .../expat/expat/CVE-2025-59375-09.patch       |   43 -
 .../expat/expat/CVE-2025-59375-10.patch       |   54 -
 .../expat/expat/CVE-2025-59375-11.patch       |   66 -
 .../expat/expat/CVE-2025-59375-12.patch       |   58 -
 .../expat/expat/CVE-2025-59375-13.patch       |  309 ----
 .../expat/expat/CVE-2025-59375-14.patch       |  122 --
 .../expat/expat/CVE-2025-59375-15.patch       |   70 -
 .../expat/expat/CVE-2025-59375-16.patch       |  146 --
 .../expat/expat/CVE-2025-59375-17.patch       |   28 -
 .../expat/expat/CVE-2025-59375-18.patch       |   74 -
 .../expat/expat/CVE-2025-59375-19.patch       |  103 --
 .../expat/expat/CVE-2025-59375-20.patch       |  285 ----
 .../expat/expat/CVE-2025-59375-21.patch       |  196 ---
 .../expat/expat/CVE-2025-59375-22.patch       |   37 -
 .../expat/expat/CVE-2025-59375-23.patch       |   47 -
 .../expat/expat/CVE-2025-59375-24.patch       |   36 -
 .../expat/expat/CVE-2026-24515-01.patch       |   43 -
 .../expat/expat/CVE-2026-24515-02.patch       |  117 --
 .../expat/expat/CVE-2026-25210-01.patch       |   27 -
 .../expat/expat/CVE-2026-25210-02.patch       |   38 -
 .../expat/expat/CVE-2026-25210-03.patch       |   28 -
 .../expat/expat/CVE-2026-32776.patch          |   91 -
 .../expat/expat/CVE-2026-32777-01.patch       |   49 -
 .../expat/expat/CVE-2026-32777-02.patch       |   66 -
 .../expat/expat/CVE-2026-32778-01.patch       |   91 -
 .../expat/expat/CVE-2026-32778-02.patch       |   61 -
 .../expat/expat/CVE-2026-41080-01.patch       |   50 -
 .../expat/expat/CVE-2026-41080-02.patch       |   29 -
 .../expat/expat/CVE-2026-41080-03.patch       |  467 ------
 .../expat/expat/CVE-2026-45186-01.patch       |   70 -
 .../expat/expat/CVE-2026-45186-02.patch       |  318 ----
 .../expat/expat/CVE-2026-45186-03.patch       |   46 -
 .../expat/expat/CVE-2026-45186-04.patch       |   32 -
 .../expat/expat/CVE-2026-45186-05.patch       |   32 -
 .../expat/expat/CVE-2026-45186-06.patch       |   87 -
 .../expat/expat/CVE-2026-45186-07.patch       |   52 -
 .../expat/expat/CVE-2026-56132_p1.patch       |   80 -
 .../expat/expat/CVE-2026-56132_p2.patch       |   60 -
 .../expat/expat/CVE-2026-56132_p3.patch       |   74 -
 .../expat/expat/CVE-2026-56132_p4.patch       |   60 -
 .../expat/expat/CVE-2026-56132_p5.patch       |   56 -
 .../expat/expat/CVE-2026-56403_p1.patch       |   81 -
 .../expat/expat/CVE-2026-56403_p2.patch       |   52 -
 .../expat/expat/CVE-2026-56404.patch          |   45 -
 .../expat/expat/CVE-2026-56405.patch          |   30 -
 .../expat/CVE-2026-56406-dependent.patch      |   59 -
 .../expat/expat/CVE-2026-56406.patch          |   34 -
 .../expat/expat/CVE-2026-56407.patch          |   41 -
 .../expat/expat/CVE-2026-56408.patch          |   29 -
 .../expat/expat/CVE-2026-56409.patch          |   51 -
 .../expat/expat/CVE-2026-56410_p1.patch       |   46 -
 .../expat/expat/CVE-2026-56410_p2.patch       |   39 -
 .../expat/expat/CVE-2026-56411.patch          |   50 -
 meta/recipes-core/expat/expat_2.6.4.bb        |  104 --
 meta/recipes-core/expat/expat_2.8.3.bb        |   33 +
 .../glibc/glibc/0025-CVE-2026-6238-0001.patch |   59 +
 .../glibc/glibc/0026-CVE-2026-6238-0002.patch |   81 +
 .../glibc/glibc/0027-CVE-2026-6238-0003.patch |   58 +
 .../glibc/glibc/0028-CVE-2026-6238-0004.patch |   73 +
 .../glibc/glibc/0029-CVE-2026-6238-0005.patch |   69 +
 .../glibc/glibc/0030-CVE-2026-6238-0006.patch |  382 +++++
 meta/recipes-core/glibc/glibc_2.39.bb         |    6 +
 .../recipes-devtools/python/python-pyasn1.inc |    2 +
 .../python3-pyasn1/CVE-2026-30922.patch       |  262 +++
 .../python3-pyasn1/CVE-2026-59885.patch       |  183 ++
 .../atk/at-spi2-core_2.50.1.bb                |    2 +
 .../files/CVE-2026-28417-regression_p1.patch  |   78 +
 .../files/CVE-2026-28417-regression_p2.patch  |   53 +
 meta/recipes-support/vim/vim.inc              |    2 +
 85 files changed, 1353 insertions(+), 7680 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat/0001-tests-Cover-indirect-entity-recursion.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-04.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-05.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-00.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-04.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-05.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-06.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-07.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-08.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-09.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-10.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-11.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-12.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-13.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-14.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-15.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-16.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-17.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-18.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-19.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-20.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-21.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-22.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-23.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-24.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-32776.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch
 delete mode 100644 meta/recipes-core/expat/expat_2.6.4.bb
 create mode 100644 meta/recipes-core/expat/expat_2.8.3.bb
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression_p2.patch



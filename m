Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C024CCFD302
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:14:43 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2703.1763849675898666954
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=O/kfx0tp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3438231df5fso4053961a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849673; x=1764454473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8EPGEfczP3Yfz0SFT3MEgNNQC/MQoCDh9LUfXOIHcc=;
        b=O/kfx0tptJqIfj1RGvFtQBN8aMbUwegMEjMWhcFqgjPeuOm2FPCm3qBdlCFCD50UZr
         5Dnj8ff+zGcduJzQai/TLLny0ryr6NYiLv8VPAc+S+MyvTjA3Btv6k91SKs9kbGxuCzW
         ym/7MDrYV+pL2V4y2Tq//u1u8oznfFL6wlwIWczpRgyFs7Y5hjjDLvT1fb9lzUE2qT8D
         EGw5WX84oCEQkXKwkkru8gWu1/s4rJiYIT2Domztloqrb9ic1ja2BStBv03nXhsFRncK
         wkL7cuV+I/01tF//3PTu+1NQNr/0ZF66ZzELm03ugHlgvuKbZyYIJK5/DBKSatCiJlKj
         JJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849673; x=1764454473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8EPGEfczP3Yfz0SFT3MEgNNQC/MQoCDh9LUfXOIHcc=;
        b=VWtEEAz0iQ9s+HTjjuqIkAPUZZW5Hi+T4y2BEycyMBwsUhoGlQG92e/ZlcBsC4Aoda
         AzSyeJzpYW21Jumu3HQ4GmcZGJD7LKNZ9DkXgnQ+hJSRAid8elgreNG57fVaq6YIRCyS
         1eQHVjUGk2wh3BRGBGQUO/MXL0t6CNVZmYq52UKcvW+ardhWlny7HaUWl5uhUXYv68ZS
         AVuuEwdto9FWjIKHOyOVJvouBwubWQ0HTNAJqspPRFbvgRJjQfB2NiKmtS9NgSjBgySq
         gozua1E3GLhuNUqfFC+dWlnzRCvUn4mPl0upOJn2cmH/X8E9IhZidp0ynKmsUJWiPn3r
         Qdpw==
X-Gm-Message-State: AOJu0YyOZyOZSYB8wcqac0hPmu6hcjakTEVxrQuvv0inTWfLA6MDvP7i
	QEWlvahmm/PD84J/0Iq3ne4IocFkWa1ay2hU92WmvIY6YNR8ktJwT779Rs2mQISals7LDlDFdFL
	SC1A2
X-Gm-Gg: ASbGncuuWSCW50Kf0b67XxffhCbmHkZaQRdDmvzYirs5AeUEqCJTYuQZJobZNfA+gbq
	qZ4/r2Xof8LLn5RZeAwEmaUbrW8+AWZ9l4ZpcZNujhKnzWat2IN3ozL5slwtjpkkYmZCnbyoXJt
	lmmzArF6QTFhPPwHIX4BvvSN4NUuBxXMPIO3gMy/zxuo8TPLCHGT5ziMoH4E3i6LmSepDesasiw
	SqRPAhE1ooN/uu1RomSfJrsmXFYpk3/vG8gyhOt2Od19NHSikMXAB46LQZC5q8gHvsfyQa7qNAm
	boS7TuSd4bsfg8i7jikZHyCRvKjKsz9vQa7vGLZwVRHeF/01oC7GE9c6PT4ItDgn6wUrG+89a5G
	48BWnzMIA0Ir/mrH07uqvvs/DAIwjnS1EnUTNoZfgNcIyyLbNm2iCqNXIwzCV6HLoYXRJ+d4oCO
	tTNg==
X-Google-Smtp-Source: AGHT+IFPMeP6dfSR5l88x0U/i3le3E9N6Ha9InEeQSkjKPkHwVRdCgEz7JQ1gh/qARitnpUU4Nh7iA==
X-Received: by 2002:a17:90b:50d0:b0:341:88c1:6a7d with SMTP id 98e67ed59e1d1-34733f2a76fmr7484148a91.18.1763849672993;
        Sat, 22 Nov 2025 14:14:32 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/21] Patch review
Date: Sat, 22 Nov 2025 14:14:06 -0800
Message-ID: <cover.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226699

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, November 25

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2755

The following changes since commit 471adaa5f77fa3b974eab60a2ded48e360042828:

  build-appliance-image: Update to scarthgap head revision (2025-11-17 17:00:25 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (1):
  goarch.bbclass: do not leak TUNE_FEATURES into crosssdk task
    signatures

Gyorgy Sarvari (2):
  musl: patch CVE-2025-26519
  glslang: fix compiling with gcc15

Hongxu Jia (1):
  spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM

Hugo SIMELIERE (1):
  sqlite3: patch CVE-2025-7709

Osama Abdelkader (3):
  go: add sdk test
  go: extend runtime test
  go: remove duplicate arch map in sdk test

Ovidiu Panait (1):
  rust-target-config: fix nativesdk-libstd-rs build with baremetal

Peter Marko (4):
  spdx30: fix cve status for patch files in VEX
  oeqa: fix package detection in go sdk tests
  oeqa: drop unnecessary dependency from go runtime tests
  oeqa/sdk/buildepoxy: skip test in eSDK

Ross Burton (5):
  xserver-xorg: remove redundant patch
  xserver-xorg: fix CVE-2025-62229 CVE-2025-62230 CVE-2025-62231
  testsdk: allow user to specify which tests to run
  oe/sdk: fix empty SDK manifests
  lib/oe/go: document map_arch, and raise an error on unknown
    architecture

Yogita Urade (3):
  xwayland: fix CVE-2025-62229
  xwayland: fix CVE-2025-62230
  xwayland: fix CVE-2025-62231

 meta/classes-recipe/goarch.bbclass            |   3 +
 .../classes-recipe/rust-target-config.bbclass |   3 +-
 meta/classes-recipe/testsdk.bbclass           |   3 +
 meta/classes/create-spdx-3.0.bbclass          |   5 +
 meta/lib/oe/go.py                             |   6 +-
 meta/lib/oe/sdk.py                            |   3 +-
 meta/lib/oe/spdx30_tasks.py                   |  16 ++-
 meta/lib/oeqa/files/test.go                   |   7 ++
 meta/lib/oeqa/runtime/cases/go.py             |  66 +++++++++++
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |   4 +
 meta/lib/oeqa/sdk/cases/go.py                 | 107 ++++++++++++++++++
 meta/lib/oeqa/sdk/testsdk.py                  |   3 +-
 meta/lib/oeqa/sdkext/testsdk.py               |   3 +-
 .../musl/musl/CVE-2025-26519-1.patch          |  39 +++++++
 .../musl/musl/CVE-2025-26519-2.patch          |  38 +++++++
 meta/recipes-core/musl/musl_git.bb            |   4 +-
 ...uilder.h-add-missing-cstdint-include.patch |  30 +++++
 .../glslang/glslang_1.3.275.0.bb              |   1 +
 ...-duplicate-definitions-of-IOPortBase.patch |  28 -----
 ...after-free-in-present_create_notifie.patch |  91 +++++++++++++++
 ...ke-the-RT_XKBCLIENT-resource-private.patch |  63 +++++++++++
 ...KB-resource-when-freeing-XkbInterest.patch |  92 +++++++++++++++
 ...-Prevent-overflow-in-XkbSetCompatMap.patch |  53 +++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |   7 +-
 .../xwayland/xwayland/CVE-2025-62229.patch    |  89 +++++++++++++++
 .../xwayland/CVE-2025-62230-0001.patch        |  60 ++++++++++
 .../xwayland/CVE-2025-62230-0002.patch        |  89 +++++++++++++++
 .../xwayland/xwayland/CVE-2025-62231.patch    |  50 ++++++++
 .../xwayland/xwayland_23.2.5.bb               |   4 +
 .../sqlite/sqlite3/CVE-2025-7709.patch        |  33 ++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |   1 +
 31 files changed, 964 insertions(+), 37 deletions(-)
 create mode 100644 meta/lib/oeqa/files/test.go
 create mode 100644 meta/lib/oeqa/sdk/cases/go.py
 create mode 100644 meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
 create mode 100644 meta/recipes-core/musl/musl/CVE-2025-26519-2.patch
 create mode 100644 meta/recipes-graphics/glslang/glslang/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-present-Fix-use-after-free-in-present_create_notifie.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0002.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-7709.patch

-- 
2.43.0



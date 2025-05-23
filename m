Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93142C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:46 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.41003.1747972360904630213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BtIZwZpd;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231e21d3b63so88197955ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972360; x=1748577160; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0+HAA1YM/eH2PUj+OEG2zbdFBo8CXx1fj4NLtcY4dtE=;
        b=BtIZwZpdfCc5EHNUlan/VtAv4BqvkOd/XPTFO9RIN/hUS1W8fbWfh9T9t9RbDBPNno
         +q2UsQLDrdLEWJ3lddCGuA6DBWy4mKIveTbvsOhgvnXCmWogZm1niCCqsN8nza5/GdDq
         yi1PtZHySHe8UXPXWK0mRaT4Fd+9Q23D5Qc7rD48oIZGLnSDaTanBzwzCCqsNelS+4Hr
         uDA9I22DSzME1bnqrQsvrMd3QkgB23Z/sAxrX8tyGsE6iytbB0Udo5ZKAZV2PmdUsNSc
         xsReOYyEIJExOKCeI3OMHdQC+dKYp70X7+HcIbF2qI8+gQWj9aPR/Vl2HPcWCW6ESfkn
         S7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972360; x=1748577160;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+HAA1YM/eH2PUj+OEG2zbdFBo8CXx1fj4NLtcY4dtE=;
        b=KzfwnE16N7pqWqUW2EHqMKd0uS1qy3W+rZ24VBM1X/uNCG5YgEqNsLYA8gGZDDyYa9
         i9YNeD5Uzw2fx6XSBYBcInRlOsR3E5vnP4yzONgPobJY2qGkXi+DG0xgssSYI3ZEMaU/
         SG80wmWMLu/YULGju68P92ST/OdnasugJYGvfx4dEYOtnkFoPtaami0zUJ8l7AzOG0D7
         8N6q/wKs3wJx8Nt0YgBXjXzuTWTTcUGimJ/yl5rYxHfYlxGT02PJ3Wp0GGtk99yRPWbj
         EWg9oB/sMYSyughDl4ozZMiWomtxjztgz+QnfDiPEvQiVcf1/cnqYbDDwa1Z50bL/Bx4
         cBnQ==
X-Gm-Message-State: AOJu0YzyEVNqi5+Z/TlpspJy3AwOB46cQT0eAlhJKXtutgHo7VCN9JzG
	xMivcKiI6/lKViaVJ+DBoCE+90K+sYmeJYrO5R58RPkIKTzhXwZ5rFBB
X-Gm-Gg: ASbGncvouzwYkoeCs9VgDK8G8SyiVxdTDEOTaVmufHgspsaV/f3WSeOuBj0qpUlEVUl
	kzS94bm93UetlaNJ8ODbfyFYi/JRhLp15UCsiUuF5DjzIagzeZGrVNTb+mNEBOnb148NLSWN71+
	TRn87lw1ScsEGjnvomSS+LKqiEStcRo0nuWeLfiPEGm1amfqcjQLk4pT4afbi7/JFE6DCSUmMyH
	b8IH3odbRhGoITt5KOBRNshQpmVhXslyROXx16vgZ4ZTOEoGaMwiAbScZ1cuMcU2sIEeUNma3Q7
	gNbIznBu1XHiq6ayqWm3PGwhkI235KM1CjOYCvGAVQ0=
X-Google-Smtp-Source: AGHT+IFgN4XbWjUcCHP3HaTuptvoWj2AjwlIACyQzK+TVxLyhTVEGeG+eyd3otqz+zLT3UZNCliqxg==
X-Received: by 2002:a17:902:d543:b0:22f:af3f:bf22 with SMTP id d9443c01a7336-231de3ba64fmr364337225ad.42.1747972360123;
        Thu, 22 May 2025 20:52:40 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 00/13] clang: Add clang C/C++ toolchain
Date: Thu, 22 May 2025 20:52:34 -0700
Message-Id: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPxL2gC/3WNzQqDMBAGX0VybkrcGH966nuUHmJMdEFNSSS0i
 O/e1ZNQepxvmdmVRRvQRnbLVhZswoh+JpCXjJlBz73l2BEzEKCEymtuRlr54v1Id5y5a3Sthap
 AipKR9QrW4fsoPp7EA8bFh8/xIOX7+r+Vci64am1RutoU2ql7P2kcr8ZPbG8lOPkgfn0gv2uby
 oBtZaXKs79t2xcv3+jW7gAAAA==
X-Change-ID: 20250518-clang-toolchain-f9a8a0572306
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <Ross.Burton@arm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217160

Clang also provided a full fledged C/C++ cross compiler which is
capable of building any C/C++ components.

A mechanism is added to select the toolchain using

TOOLCHAIN = "clang"

in config metadata. This will also add an entry into OVERRIDES
'toolchain-<COMPILER>', e.g. toolchain-clang which can be used
to define clang-specific aspects in metadata.

All packages are not full buildable with clang, e.g. glibc which
rely on some extentions which are only available in gcc. Such
exceptions are made in config metadata using a global file called

meta/conf/distro/include/default-toolchain.inc

This file can be added in every layer to define these details themselves
bitbake will include all such files auotmaticlally.

Defaults are kept as it is, nothing is expected to change if its not
enabled

World builds for qemuarm/qemuarm64/qemuppc/qemumips/qemux86_64
are successful with some exceptions

vulkan-samples - qemuarm64/qemux86-64
bluez - qemuppc
compiler-rt-sanitizers - qemumips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in v3:
- Split TCOVERRIDE into a separate patch.
- Move toolchain classes into classs/toolchain sub-directory.
- Extend systemd-boot clang fix to glibc as well.
- Link to v2: https://lore.kernel.org/r/20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com

Changes in v2:
- Move the changed from default-toolchains.inc file into respective recipes
- Drop adding libomp as toolchain-clang dependency for rpm, it will be
  needed when clang is used for rpm, as of now it does not
- Fix musl world builds for qemuarm/qemuarm64/qemuriscv64/qemuriscv32
- Link to v1: https://lore.kernel.org/r/20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com

---
Khem Raj (13):
      toolchain: Provide abstraction for choosing per-recipe toolchain
      clang.bbclass: Specify ldso when using usermerge
      vte: Disable gi data generation when using clang on arm
      clang: Add compiler-rt to default deps when using clang compiler
      tcf-agent: Fix ranlib call when using llvm-ranlib
      libjpeg-turbo: Fix build on mips/clang
      pixman: Fix build with mips/clang
      vulkan-samples: Disable overriding-option as error
      bluez: Disable invalid-pp-token warning with clang
      systemtap: Pin to build with GCC
      seatd: Disable sign-compare warning as error on clang
      systemd-boot: Pin to use gcc toolchain on arm
      meta: Add TCOVERRIDE for toolchain selection at recipe scope

 meta/classes-global/base.bbclass                   |  5 ++++
 meta/classes-recipe/cross-canadian.bbclass         |  2 ++
 meta/classes-recipe/cross.bbclass                  |  2 ++
 meta/classes-recipe/crosssdk.bbclass               |  2 ++
 meta/classes-recipe/native.bbclass                 |  2 ++
 meta/classes-recipe/nativesdk.bbclass              |  2 ++
 meta/classes/toolchain/clang-native.bbclass        | 28 ++++++++++++++++++++++
 .../clang.inc => classes/toolchain/clang.bbclass}  | 17 +++++++++----
 .../toolchain/gcc-native.bbclass}                  |  1 -
 .../gcc.inc => classes/toolchain/gcc.bbclass}      |  1 +
 meta/conf/bitbake.conf                             |  7 +++---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 meta/recipes-core/seatd/seatd_0.9.1.bb             |  8 +++++++
 meta/recipes-core/systemd/systemd-boot_257.5.bb    |  3 +++
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  5 ++++
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb  |  6 +++++
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb |  4 ++++
 meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb    |  3 +++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  4 ++++
 meta/recipes-support/vte/vte_0.78.2.bb             |  4 ++++
 20 files changed, 98 insertions(+), 9 deletions(-)
---
base-commit: caea04becc791316498275f957af9ab28012eea3
change-id: 20250518-clang-toolchain-f9a8a0572306

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



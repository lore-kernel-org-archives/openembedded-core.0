Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80980C7115A
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 02:29:30 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.21670.1750040967596481343
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 19:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55G2TQ66027430
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 21:29:26 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] ISA based RISC-V tune implementation
Date: Sun, 15 Jun 2025 21:29:19 -0500
Message-Id: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218755

From: Mark Hatle <mark.hatle@amd.com>

The following implements the risc-v processor tune based on the ISA approach
as documented in the oe-architecture post:

https://lists.openembedded.org/g/openembedded-architecture/message/2155

This set also attempts to make u-boot and kernel configurations dynamic
based on the TUNE_FEATURES.

For the linux-yocto, I suspect that the config fragments should be
sent to the kmeta (kernel-cache), but I'd like a review from Bruce and
others before I do this.

Additionally, this enables a new (optional) features_check for TUNE_FEATURES.

I've found numerous items in the system have certain RISC-V ISA expectations
that may need to be addressed over time, however the obvious one is the
Linux kernel requires ima_zicsr_zifencei.  Since it has it's own -march=
setting this will ensure the processor defintion will be compatible.

Also dynamically configure the QEMU cpu based on the tune_features.  This
is nice to ensure that what we're actually building should be able to run
on real hardware.  However, it does highlight some of the (extension)
limitations in the current design.  (limitations as in extension not yet
enabled.)

Note: OpenSBI _requires_ the 'c' extension or it will not execute.  I
suspect this can be fixed, but it's beyond my capabilities at this time.

Mark Hatle (6):
  riscv tunes: ISA Implementation of RISC-V tune features
  linux-yocto: Enable risc-v TUNE_FEATURES ISA selections
  u-boot: Dynamic RISC-V ISA configuration
  qemuriscv: Dynamically configure qemu CPU
  features_check.bbclass: Add support for required TUNE_FEATURES
  linux-yocto.inc: State riscv required tune_features

 meta/classes-recipe/features_check.bbclass    |   2 +-
 meta/conf/machine/include/riscv/README        | 122 ++++++++++++++++
 .../conf/machine/include/riscv/arch-riscv.inc | 138 +++++++++++++++++-
 meta/conf/machine/include/riscv/qemuriscv.inc |  31 +++-
 .../conf/machine/include/riscv/tune-riscv.inc |  40 ++---
 meta/conf/machine/qemuriscv32.conf            |   4 +-
 meta/lib/oe/__init__.py                       |   2 +-
 meta/lib/oe/tune.py                           |  81 ++++++++++
 .../u-boot/files/u-boot-riscv-isa_a.cfg       |   1 +
 .../u-boot/files/u-boot-riscv-isa_c.cfg       |   1 +
 .../u-boot/files/u-boot-riscv-isa_clear.cfg   |   6 +
 .../u-boot/files/u-boot-riscv-isa_d.cfg       |   1 +
 .../u-boot/files/u-boot-riscv-isa_f.cfg       |   1 +
 .../u-boot/files/u-boot-riscv-isa_zbb.cfg     |   1 +
 .../u-boot/files/u-boot-riscv-isa_zicbom.cfg  |   1 +
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  12 ++
 .../linux/files/risc-v-isa-c.cfg              |   1 +
 .../linux/files/risc-v-isa-clear.cfg          |   9 ++
 .../linux/files/risc-v-isa-fpu.cfg            |   1 +
 .../linux/files/risc-v-isa-rv32i.cfg          |   2 +
 .../linux/files/risc-v-isa-rv64i.cfg          |   2 +
 .../linux/files/risc-v-isa-v.cfg              |   1 +
 .../linux/files/risc-v-isa-zbb.cfg            |   1 +
 .../linux/files/risc-v-isa-zicbom.cfg         |   1 +
 meta/recipes-kernel/linux/linux-yocto.inc     |  19 +++
 25 files changed, 439 insertions(+), 42 deletions(-)
 create mode 100644 meta/conf/machine/include/riscv/README
 create mode 100644 meta/lib/oe/tune.py
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_a.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_c.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_clear.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_d.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_f.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zbb.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zicbom.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-c.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-v.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg

-- 
2.34.1



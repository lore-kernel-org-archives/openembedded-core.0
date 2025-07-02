Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE54C83F03
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 21:44:31 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.8319.1751492667449325467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 14:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 562LiP2r015441
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 16:44:25 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/6] ISA based RISC-V tune implementation
Date: Wed,  2 Jul 2025 16:44:18 -0500
Message-Id: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 21:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219858

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

v3:
- The base implementation has been merged.  This is the remaining items for
  kernel dependencies, and linux.  (reworked to use yocto-kernel-cache)  as
  well as the u-boot and qemu items.  (These are the same as v2.)

As noted in 5/6, some of these dynamic ISA options seem to be adjusted by
other default settings.  Specifically CONFIG_ISA_C is enabled by CONFIG_EFI.

I did test various combinations with a custom defconfig (in qemu) to verify
that the code does what it should AND/OR reports any settings it couldn't
disable.

Tested combinations:

rv32ima_zicsr_zifencei
rv32imac_zicsr_zifencei
rv32gc
rv32imafdc_zicsr_zifencei

rv64ima_zicsr_zifencei
rv64imac_zicsr_zifencei
rv64gc
rv64gcv
rv64imafdc_zicsr_zifencei

Testing involved kernel disabling CONFIG_EFI, enabling CONFIG_NONPORTABLE
and the corresponding tune.

v2:

- Note: the linux-yocto change still needs further rework (noted in commit)
  (if everything else is merged, it will still work fine)

- Change the TUNE_FEATURES check to kernel.bbclass per review comments

- Add 7/7 patch for RUST configuration.

Mark Hatle (6):
  u-boot: Dynamic RISC-V ISA configuration
  features_check.bbclass: Add support for required TUNE_FEATURES
  kernel.bbclass: State riscv required tune_features for Linux
  linux-yocto/6.12: riscv: Enable dynamic ISA selection
  linux-yocto/6.12: riscv: Enable TUNE_FEATURES based KERNEL_FEATURES
  qemuriscv: Dynamically configure qemu CPU

 meta/classes-recipe/features_check.bbclass    |  2 +-
 meta/classes-recipe/kernel.bbclass            |  6 +++-
 meta/conf/machine/include/riscv/qemuriscv.inc | 31 +++++++++++++++++--
 .../u-boot/files/u-boot-riscv-isa_a.cfg       |  1 +
 .../u-boot/files/u-boot-riscv-isa_c.cfg       |  1 +
 .../u-boot/files/u-boot-riscv-isa_clear.cfg   |  6 ++++
 .../u-boot/files/u-boot-riscv-isa_d.cfg       |  1 +
 .../u-boot/files/u-boot-riscv-isa_f.cfg       |  1 +
 .../u-boot/files/u-boot-riscv-isa_zbb.cfg     |  1 +
 .../u-boot/files/u-boot-riscv-isa_zicbom.cfg  |  1 +
 meta/recipes-bsp/u-boot/u-boot-common.inc     | 12 +++++++
 .../linux/linux-yocto-rt_6.12.bb              |  2 +-
 .../linux/linux-yocto-tiny_6.12.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto.inc     | 16 ++++++++++
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |  2 +-
 15 files changed, 77 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_a.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_c.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_clear.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_d.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_f.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zbb.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zicbom.cfg

-- 
2.34.1



Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C04C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 00:20:57 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.34923.1750206048482338840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 17:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55I0Klnk028645
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 19:20:47 -0500
Received: from [192.168.2.13] ([192.168.2.13])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 55I0KkJM001010
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 19:20:47 -0500
Message-ID: <aa295c1a-50f3-4f26-92f2-e844c96ba5ed@kernel.crashing.org>
Date: Tue, 17 Jun 2025 19:20:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/7] ISA based RISC-V tune implementation
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <1849F8E3D5C2FC6B.11779@lists.openembedded.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <1849F8E3D5C2FC6B.11779@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 00:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218954

After I hit send, I realized that the order of the patches is likely wrong.

(using mailed order) should probably be:

1, 7, 2, 3, 4, 5, 6

or 1 & 7 squashed..  (7 requires 1..  and without 7 rust won't build after 1 is 
introduced.)

--Mark

On 6/17/25 6:39 PM, Mark Hatle wrote:
> From: Mark Hatle <mark.hatle@amd.com>
> 
> The following implements the risc-v processor tune based on the ISA approach
> as documented in the oe-architecture post:
> 
> https://lists.openembedded.org/g/openembedded-architecture/message/2155
> 
> This set also attempts to make u-boot and kernel configurations dynamic
> based on the TUNE_FEATURES.
> 
> For the linux-yocto, I suspect that the config fragments should be
> sent to the kmeta (kernel-cache), but I'd like a review from Bruce and
> others before I do this.
> 
> Additionally, this enables a new (optional) features_check for TUNE_FEATURES.
> 
> I've found numerous items in the system have certain RISC-V ISA expectations
> that may need to be addressed over time, however the obvious one is the
> Linux kernel requires ima_zicsr_zifencei.  Since it has it's own -march=
> setting this will ensure the processor defintion will be compatible.
> 
> Also dynamically configure the QEMU cpu based on the tune_features.  This
> is nice to ensure that what we're actually building should be able to run
> on real hardware.  However, it does highlight some of the (extension)
> limitations in the current design.  (limitations as in extension not yet
> enabled.)
> 
> Note: OpenSBI _requires_ the 'c' extension or it will not execute.  I
> suspect this can be fixed, but it's beyond my capabilities at this time.
> 
> v2:
> 
> - Note: the linux-yocto change still needs further rework (noted in commit)
>    (if everything else is merged, it will still work fine)
> 
> - Change the TUNE_FEATURES check to kernel.bbclass per review comments
> 
> - Add 7/7 patch for RUST configuration.
> 
> Mark Hatle (7):
>    riscv tunes: ISA Implementation of RISC-V tune features
>    linux-yocto: Enable risc-v TUNE_FEATURES ISA selections ** DO NOT
>      MERGE **
>    u-boot: Dynamic RISC-V ISA configuration
>    qemuriscv: Dynamically configure qemu CPU
>    features_check.bbclass: Add support for required TUNE_FEATURES
>    kernel.bbclass: State riscv required tune_features for Linux
>    rust-target-config.bbclass: Update for new riscv TUNE_FEATURES
> 
>   meta/classes-recipe/features_check.bbclass    |   2 +-
>   meta/classes-recipe/kernel.bbclass            |   6 +-
>   .../classes-recipe/rust-target-config.bbclass |  65 ++++++---
>   meta/conf/machine/include/riscv/README        | 122 ++++++++++++++++
>   .../conf/machine/include/riscv/arch-riscv.inc | 138 +++++++++++++++++-
>   meta/conf/machine/include/riscv/qemuriscv.inc |  31 +++-
>   .../conf/machine/include/riscv/tune-riscv.inc |  40 ++---
>   meta/conf/machine/qemuriscv32.conf            |   4 +-
>   meta/lib/oe/__init__.py                       |   2 +-
>   meta/lib/oe/rust.py                           |   2 -
>   meta/lib/oe/tune.py                           |  81 ++++++++++
>   .../u-boot/files/u-boot-riscv-isa_a.cfg       |   1 +
>   .../u-boot/files/u-boot-riscv-isa_c.cfg       |   1 +
>   .../u-boot/files/u-boot-riscv-isa_clear.cfg   |   6 +
>   .../u-boot/files/u-boot-riscv-isa_d.cfg       |   1 +
>   .../u-boot/files/u-boot-riscv-isa_f.cfg       |   1 +
>   .../u-boot/files/u-boot-riscv-isa_zbb.cfg     |   1 +
>   .../u-boot/files/u-boot-riscv-isa_zicbom.cfg  |   1 +
>   meta/recipes-bsp/u-boot/u-boot-common.inc     |  12 ++
>   .../linux/files/risc-v-isa-c.cfg              |   1 +
>   .../linux/files/risc-v-isa-clear.cfg          |   9 ++
>   .../linux/files/risc-v-isa-fpu.cfg            |   1 +
>   .../linux/files/risc-v-isa-rv32i.cfg          |   2 +
>   .../linux/files/risc-v-isa-rv64i.cfg          |   2 +
>   .../linux/files/risc-v-isa-v.cfg              |   1 +
>   .../linux/files/risc-v-isa-zbb.cfg            |   1 +
>   .../linux/files/risc-v-isa-zicbom.cfg         |   1 +
>   meta/recipes-kernel/linux/linux-yocto.inc     |  14 ++
>   28 files changed, 480 insertions(+), 69 deletions(-)
>   create mode 100644 meta/conf/machine/include/riscv/README
>   create mode 100644 meta/lib/oe/tune.py
>   create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_a.cfg
>   create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_c.cfg
>   create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_clear.cfg
>   create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_d.cfg
>   create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_f.cfg
>   create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zbb.cfg
>   create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zicbom.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-c.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-v.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218946): https://lists.openembedded.org/g/openembedded-core/message/218946
> Mute This Topic: https://lists.openembedded.org/mt/113700336/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


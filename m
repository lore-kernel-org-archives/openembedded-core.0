Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C432ACD8C97
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 12:19:17 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14872.1780748350795215498
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2026 05:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=nPhmGW7y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260606121907f3990f9b740002078f-tb_kfy@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260606121907f3990f9b740002078f
        for <openembedded-core@lists.openembedded.org>;
        Sat, 06 Jun 2026 14:19:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6SM850imXg8gimKE+V1mxhM0sClg7aK0qg0SUQziFQ0=;
 b=nPhmGW7yMgNR31KHil8OltQ9dByDr4wlo0XqkmKlqnd2SqsqPLMkbX8X78MW3tv5i7C1Fp
 zY2Pd/mOiYiM9aKM7oKfI5UQwN6Kfp4L1Y15xDhDwVMUa5orL+NIWN1u5oVqGPgnqvmuwPxz
 ijnt1gAcapTEzE3tgUk/YDC7fqNOt8AWoZ9HXkMfMxIlcqpofI7y+jSOON9cRIN5N50HMLOM
 rwS97ziWVNrsqW8vRivWl+NXxTzwLSkoHnidiRfCs053zKSnJ3hCYKFtNTE4O9d29FKDlcB6
 kC5Kruuycw9v14FWDDPyqewNus1JHz4Fq6kTNtj17I/E5Dmhoee/Vnpg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/3] fitimage selftests: stop hardcoding DISTRO/MACHINE, drop meta-yocto-bsp dependency
Date: Sat,  6 Jun 2026 14:17:54 +0200
Message-ID: <20260606121836.2782754-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2026 12:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238216

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The fitimage selftests had two fundamental issues:

- dependency on meta-yocto-bsp
  Several tests referenced `beaglebone-yocto` and the `bbb-dtbs-as-ext` recipe,
  both of which live in meta-yocto-bsp, not in OE-core. The tests simply could
  not pass in a plain OE-core setup.

- hardcoded MACHINE overrides the caller's configuration
  Every test wrote `MACHINE = "beaglebone-yocto"` unconditionally into
  `selftest.inc`. This means that regardless of what MACHINE the user or
  autobuilder had configured, the tests always built for beaglebone. There are
  two consequences:

This results in a false sense of test coverage:

- The test result says nothing about whether the active machine works — it
  reports a pass for a machine that was silently substituted.
- In environments that configure the machine via OE_FRAGMENTS, bitbake
  `bb.fatal()`s on a non-weak `MACHINE` assignment, so the tests fail
  immediately without even attempting to build.

Patch 3 fixes both problems. Tests no longer write `MACHINE` to the config;
instead they read the active machine at runtime via `get_bb_var("MACHINE")` and
look it up in a new `_MACHINE_SETTINGS` dict. If the machine is not listed, the
test calls `self.skipTest()` — keeping the suite green while making it obvious
which machines are covered. Several correctness fixes follow naturally from
exercising real per-machine code paths (conditional `sign-images`, `setup-1` on
x86, graceful fallback when no key-holding DTB exists). The `bbb-dtbs-as-ext`
recipe is replaced by a machine-agnostic `test-dtbs-as-ext`.
That also means that the FIT image tests are now skipped for most machines,
which is not ideal. But if the FIT image infrastructure is used on those
machines, then the tests can be enabled by adding the appropriate settings to
`_MACHINE_SETTINGS` later on.

Patch 2 fixes a uboot-sign.bbclass bug exposed once the tests ran correctly
in sequence: `mkimage -K` was modifying `spl/u-boot-spl.dtb` in-place,
accumulating `required = "conf"` key nodes across test runs in the same work
directory and causing verification to fail for the second test.

Patch 1 is a trivial whitespace prerequisite.

Tested with `oe-selftest -r fitimage`
- on MACHINEs:
  - qemuarm    (successes=17, skipped=2)
  - qemuarm64  (successes=19, skipped=0)
  - qemux86-64 (successes=17, skipped=4)
  - qemumips   (successes=7, skipped=14)
    this example is without a entry in _MACHINE_SETTINGS
- for bitbake-setup configurations:
  - poky-master
  - oe-nodistro-master (which has no meta-yocto-bsp)

Adrian Freihofer (3):
  oeqa/selftest/fitimage: fix missing whitespace around assignment
  uboot-sign: sign SPL FIT into a copy of the SPL DTB
  oeqa/selftest/fitimage: use the provided DISTRO and MACHINE, skip if
    unsupported

 .../recipes-test/ext-dtb/bbb-dtbs-as-ext.bb   |  29 -
 .../ext-dtb/files/BBORG_RELAY-00A2.dts        |  49 --
 .../ext-dtb/files/am335x-bonegreen-ext.dts    |  14 -
 .../recipes-test/ext-dtb/files/test-ext.dts   |  17 +
 .../ext-dtb/files/test-overlay.dts            |  14 +
 .../recipes-test/ext-dtb/test-dtbs-as-ext.bb  |  25 +
 meta/classes-recipe/uboot-sign.bbclass        |  14 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      | 538 +++++++++++++-----
 8 files changed, 469 insertions(+), 231 deletions(-)
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/test-ext.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/test-overlay.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb

-- 
2.54.0



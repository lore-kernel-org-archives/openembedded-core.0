Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA01CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 11:21:10 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40122.1781868062005761549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 04:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=dBCjrLHH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260619112053b25cfb8555000207cd-pza6ms@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260619112053b25cfb8555000207cd
        for <openembedded-core@lists.openembedded.org>;
        Fri, 19 Jun 2026 13:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=KDB+iJQSd/chR5R+8We/5zxMYMl8S1pijU0ywVSjMVI=;
 b=dBCjrLHHBQ6wmpa+FjmS5AWH6t07qX4kttxqtq/jDnefJlroAeLzAmI/C1r6h82TACaSE1
 Smp0/92zEOHz7mSRDI1Z0Kr2XxnlIgI85FE/4G1t7IKtLnWFigH/2Unzy2W95+5Imo6o5o2h
 /cbkv24D87wLsyJagIKgJ0hRuruuTi4AxX+JJgiTOaCPj1bc+lsNWNjTvdgoMVX1X6fkM2/0
 pZ3dQQCFXUzKu1HjHg//9MlBJsBNeHzAfGRpwBOfWP6ILvJ8gpipBjS+6MLE9sXrNFWBGnMw
 f7zdC+jpAruvzlKiG3prkswlEUltuPSbLaVXT6yUPWBjvqzCNwtQoyuQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/6] fitimage selftests: stop hardcoding DISTRO/MACHINE, drop meta-yocto-bsp dependency
Date: Fri, 19 Jun 2026 13:17:08 +0200
Message-ID: <20260619112046.125876-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 11:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239165

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes in comparison to v1:
- 2 of 3 patches got merged already, this is just the last one of v1
- Split it into 6 smaller commits
  - Final result is equal
  - oe-selftest was run for all commits, for no-distro and for poky

Note: These 6 patches replace the commit
  "oeqa/selftest/fitimage: use the provided DISTRO and MACHINE, skip if
  unsupported"
  on today's master-next.



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

This series fixes both problems. Tests no longer write `MACHINE` to the config;
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

Adrian Freihofer (6):
  oe-selftest: fitimage: replace _gen_random_file with _gen_elf64_dummy
  oe-selftest: fitimage: add machine-agnostic test-dtbs-as-ext recipe
  oe-selftest: fitimage: replace bbb-dtbs-as-ext with test-dtbs-as-ext
  oe-selftest: fitimage: replace MACHINE==qemux86-64 guards with
    KERNEL_SETUP_BIN
  oe-selftest: fitimage: add machine settings table and skip helpers
  oe-selftest: fitimage: stop hardcoding MACHINE and DISTRO in tests

 .../recipes-test/ext-dtb/bbb-dtbs-as-ext.bb   |  29 -
 .../ext-dtb/files/BBORG_RELAY-00A2.dts        |  49 --
 .../ext-dtb/files/am335x-bonegreen-ext.dts    |  14 -
 .../recipes-test/ext-dtb/files/test-ext.dts   |  17 +
 .../ext-dtb/files/test-overlay.dts            |  14 +
 .../recipes-test/ext-dtb/test-dtbs-as-ext.bb  |  25 +
 meta/lib/oeqa/selftest/cases/fitimage.py      | 536 +++++++++++++-----
 7 files changed, 459 insertions(+), 225 deletions(-)
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/test-ext.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/test-overlay.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb

-- 
2.54.0



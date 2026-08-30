Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1270C624D2
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:27 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17146.1788126560348882388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=ikSMsMZX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260830214917f0abe47c0700020783-fm6k5y@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260830214917f0abe47c0700020783
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MeGOq4NJSF1qlTmvXANY9h8ddDBaXdnjFN6c1HKM5qc=;
 b=ikSMsMZXOJbu3vgn+aaYlcNGKZZfRniu0TkT11GZBCYboUo4DMDq/3pZQc7Tftn4BTk3Zv
 G8Np60WmjgvDO63VYlcYBV5AaaoGZd+NFxHrrlbL5Jlx7dCTCyEumkoi/gNbO3xIRmrQaaEY
 BB96KqMxaAfILMCaKaUIqsqSYDw/k32UF0FU72FL1+dNdODpnhk7++8R+yIDoxij2ifXOTfz
 jYEiuT30Tk9jSO3w4PI7IqfkZRIc2LpEIm+XCdB7gi8ShxBHO2ZFMW7qIweygTXW/uDbhKl4
 uhwxJS530PqB1rNo9oe0v7xhEwQ6+dm5GoRsbmkIReOQNtq9dZkNA/Eg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 00/25] devtool: ide-sdk: NFS/slirp support, deploy filtering, and robustness fixes
Date: Sun, 30 Aug 2026 23:48:22 +0200
Message-ID: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 21:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244703

From: Adrian Freihofer <adrian.freihofer@siemens.com>

changes v1 --> v2:
- Complaints from Patchwork
- One more fix commit

This series improves `devtool ide-sdk` and its underlying deploy-target
infrastructure:

- Adds `--nfs` rootfs debugging support (`rootfs`/`rootfs-dbg`), allowing the
  target to boot from a combined companion `rootfs-dbg` — opening up
  possibilities such as code coverage and profiling (e.g. `perf`) and other
  tools that need debug symbols present on the target.
- Runs `do_install` through BitBake instead of shelling out, using a new
  tinfoil prepared-task runner — much better functionally and also much
  quicker than before.
  Requires the latest bitbake master (adds `Tinfoil.run_prepared_task`).
- Adds `runqemu` slirp networking support for ide-sdk (with auto
  port-forwarding and automatic SSH host-key check disabling for loopback
  targets).
- Adds `--package`/`--file-glob` deploy filters to `devtool deploy-target`,
  plus support for deploying directly into a local rootfs path (e.g. an NFS
  export), refactoring the ssh deployment path into its own function.
- Refactors `runqemu-extract-sdk` and `runqemu-export-rootfs` into Python.
- Various ide-sdk fixes: auto-write image debug settings to the bbappend,
  dedupe `solib_search_path` entries, VSCode IntelliSense for rootfs-dbg
  sources, and cpp-example breakpoint/attach fixes.

Each feature/fix is covered by a corresponding oe-selftest addition.

A documentation update covering these changes will be sent as a follow-up series shortly.

Adrian Freihofer (25):
  runqemu-extract-sdk: set PSEUDO_INCLUDE_PATHS for the extraction
  devtool: ide-sdk: dedupe solib_search_path entries
  devtool: ide-sdk: VSCode IntelliSense for rootfs-dbg sources
  cpp-example: fix stuck breakpoints when attaching and daemonize
    properly
  devtool: ide-sdk: auto-write image debug settings to bbappend
  oe-selftest: devtool ide-sdk: adapt tests for auto-written image debug
    settings
  oeqa: QemuTarget: set use_slirp when slirp is in runqemuparams
  devtool: ide-sdk: support runqemu slirp
  devtool: ide-sdk: auto-disable ssh host key checking for loopback
    targets
  oe-selftest: devtool ide-sdk: add slirp networking test
  devtool: deploy-target: add --package/--file-glob filters
  oe-selftest: devtool deploy-target: test --package/--file-glob filters
  devtool: ide-sdk: forward --package/--file-glob deploy filters
  oe-selftest: devtool ide-sdk: cover --package filters
  runqemu-extract-sdk: refactor in Python
  runqemu-export-rootfs: refactor in Python
  devtool: deploy: split ssh deployment into a separate function
  devtool: deploy-target: allow deploying directly into a local rootfs
  oe-selftest: devtool deploy-target: test deploying into a local rootfs
    path
  oe-selftest: tinfoil: test prepared task runner
  devtool: ide-sdk: run do_install through BitBake
  oe-selftest: devtool ide-sdk: test install task
  devtool: ide-sdk: support NFS rootfs
  oe-selftest: devtool ide-sdk: test NFS debug rootfs
  devtool: ide-sdk: fix GDB loading stale libs instead of recipe's own
    build

 .../recipes-test/cpp/cmake-example.inc        |   1 +
 .../recipes-test/cpp/cpp-example.inc          |   4 +
 .../recipes-test/cpp/files/CMakeLists.txt     |   6 +
 .../recipes-test/cpp/files/cpp-example.cpp    |  91 ++-
 .../recipes-test/cpp/files/cpp-example.init   |  10 +-
 .../recipes-test/cpp/files/daemonize.cpp      |  57 ++
 .../recipes-test/cpp/files/daemonize.hpp      |  27 +
 .../recipes-test/cpp/files/meson.build        |   9 +-
 .../recipes-test/cpp/files/meson.options      |   2 +
 .../recipes-test/cpp/meson-example.inc        |   1 +
 .../pseudo-pyc-test/pseudo-pyc-test.bb        |  45 ++
 meta/lib/oeqa/selftest/cases/devtool.py       | 632 +++++++++++++----
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  60 ++
 meta/lib/oeqa/targetcontrol.py                |  23 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb         |   3 +
 scripts/lib/devtool/deploy.py                 | 392 +++++++++--
 scripts/lib/devtool/ide_plugins/__init__.py   |  41 +-
 scripts/lib/devtool/ide_plugins/ide_code.py   |  93 ++-
 scripts/lib/devtool/ide_plugins/ide_none.py   |   8 +-
 scripts/lib/devtool/ide_sdk.py                | 649 +++++++++++++++---
 scripts/lib/runqemu_utils.py                  | 246 +++++++
 scripts/runqemu-export-rootfs                 | 126 +---
 scripts/runqemu-extract-sdk                   | 101 +--
 23 files changed, 2090 insertions(+), 537 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/daemonize.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/daemonize.hpp
 create mode 100644 scripts/lib/runqemu_utils.py

-- 
2.55.0



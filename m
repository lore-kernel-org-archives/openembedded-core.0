Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5727EC5DF7C
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:41:43 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15974.1786909295039581327
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=g5WhOdru;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260816194131573cbbdba50002079d-ai0cvq@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260816194131573cbbdba50002079d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 21:41:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hVdByi5DN+cKZ4QyKTqBn2OJhBG9yVbwK8iM/0aP+f8=;
 b=g5WhOdruCPCotiUvR1p8WKLBikzcc8ShWvHneTwCZhs+3pwdbXV4MJa8mVdbDLdBF3aNeu
 0jVK/zwbm7CxDPmrw3ExGAIA7G8qFiT2ES5ffWfuQ71hTK9LNk9q1TYa+rtGAcUiahyZExQe
 Eb5Z+0wt4ak9ECzwADjTaw2FEga4glBG/3O8bF3c5dYVKv/mhIy4GWK4nk7qGBDczAaVwR81
 S5zYLCk0B/6NIz7JvxCFk8LDHD0WQh3vEuQrCB57tg8kW8n1R699R/YysdbNh+wx+plACyCq
 /lGlP6LJxE0TAHKxA9VdD98BTJNyzqOZvc/9WBT2v6xS6be3Yz/awRYg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 00/14] devtool: ide-sdk: robust attach-mode debugging and test cleanup
Date: Sun, 16 Aug 2026 21:40:43 +0200
Message-ID: <20260816194127.86607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 19:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243555

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This series improves devtool ide-sdk's remote-debugging workflow, focusing
on GDB's attach mode, and cleans up the corresponding selftests.

- Attach-mode debugging
  The old ATTACH mode started gdbserver with "--attach :<port> $(pidof
  <binary>)" under a plain cppdbg "launch" request - the classic attach
  setup, which is fragile and hits several long-standing, unfixed
  cpptools bugs (e.g. microsoft/vscode-cpptools#4166).
  Switch to attaching over the extended-remote protocol instead, merging
  ATTACH into the same persistent "gdbserver --multi" server already used
  for MULTI mode.

  Until microsoft/vscode-cpptools#14684 is merged, this has one downside
  (one reason extended-remote attach wasn't used before): the user is
  prompted to pick the process to attach to instead of it being selected
  automatically. This is temporary, and the new setup is otherwise more
  robust.

- Selftest cleanup
  - Progressively move the ide-sdk and deploy selftests from raw
    SSH/process-list probing over to the QEMU target command API
  - Replace fixed-delay/process-probe waits with proper readiness-marker
    waits
  - Add attach-mode debug workflow verification with an explicit,
    documented execution order to avoid Build-ID mismatches from
    once/deploy side effects.
  - Adds parallel test classes per toolchain/build-system (gcc/clang,
    cmake/meson).

- Other fixes
  - devtool deploy-target: avoid spurious tar "timestamp in the future"
    warnings when the target clock lags the host.
  - devtool ide-sdk: fix meson IntelliSense for the gcc toolchain
  - cpp-example/ccp-example test fixture robustness fixes for compiler
    optimization and PID file handling.
  - devtool ide-sdk: default to all modified recipes when none is given
    explicitly.

Adrian Freihofer (14):
  devtool: deploy-target: pass tar -m to avoid future timestamp warnings
  oe-selftest: devtool deploy: use QEMU target commands
  oe-selftest: devtool ide-sdk: Add new test classes for ide-sdk tests
  devtool: ide-sdk: fix meson IntelliSense for gcc toolchain
  cpp-example: prevent compiler from eliminating debugger test code
  ccp-example: fix PID file handling
  devtool: ide-sdk: default to all modified recipes
  devtool: ide-sdk: let gdbserver reuse the shared debug server wait
    helper
  oe-selftest: devtool ide-sdk: support $ in gdbserver task command
  devtool: ide-sdk: attach via extended-remote
  oe-selftest: devtool ide-sdk: wait for gdbserver readiness
  oe-selftest: devtool ide-sdk: verify debugger shutdown
  oe-selftest: devtool ide-sdk: use qemu.run for target checks
  oe-selftest: devtool ide-sdk: verify attach debug workflow

 .../cpp/files/cpp-example-lib.hpp             |   6 +-
 .../recipes-test/cpp/files/cpp-example.cpp    |  10 +-
 .../recipes-test/cpp/files/cpp-example.init   |   5 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 579 +++++++++++-------
 scripts/lib/devtool/deploy.py                 |   5 +-
 scripts/lib/devtool/ide_plugins/__init__.py   |  81 ++-
 scripts/lib/devtool/ide_plugins/ide_code.py   | 158 +++--
 scripts/lib/devtool/ide_plugins/ide_none.py   |  44 +-
 scripts/lib/devtool/ide_sdk.py                |  18 +-
 9 files changed, 535 insertions(+), 371 deletions(-)

-- 
2.55.0



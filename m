Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9931088E50
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 22:38:33 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27346.1773873511005456354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 15:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=XyG4a6Sx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260318223827ef233dae86000207d3-zqrgrw@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260318223827ef233dae86000207d3
        for <openembedded-core@lists.openembedded.org>;
        Wed, 18 Mar 2026 23:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qo/6meLhwpNCXLlhbqJxiHkYcI5/VEGZEqy2fd+cdy0=;
 b=XyG4a6SxLwXhKEXZWn7PXNQo0Co260KFrztV3pgxKWflqQjLUKaXVPOkAv5pY9FXRR5t+5
 2UGK8cs6xYpX+a2PtOXC6fisaUPsBAjBwNS1WjRRLM5zcsr9VJpZyjDY59LT0Im3kAnLCz1W
 YRwQDOqZ1AjR98dl8nfBCgKtgghWL7/vCEyo4nJjYbW0o4Bf/dRNElUqwqDoWk6gU9L3dBl/
 iYRfwi9qvKEQiLvfkTFT1UmyumuH4F4/jXvq5MzdeGlJGOX92n1HcO/pRC1Q97K1JW2rLWro
 P56T7MdRRlMcIZuKfmROCSRVNNRzhWayI7VAKnBOv5XpYoS5Dktv3wnA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/9] devtool: ide-sdk clang/LLDB support and minor fixes
Date: Wed, 18 Mar 2026 23:36:08 +0100
Message-ID: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 22:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233446

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This series adds clang/LLDB support to devtool ide-sdk and contains
some bug fixes accumulated before the release.

Bug fixes and small improvements:

- Various selftest robustness fixes: use stat(1) instead of ls for
  user/group name lookups, switch to assertRegex, fix conf-file
  ownership with static UIDs/GIDs, add a GDB test that sets a
  breakpoint after std::vector construction.
- ide-sdk: use TOOLCHAIN instead of TCOVERRIDE to detect the active
  toolchain.
- ide-sdk debugger back-end: fix a typo (is_c_ccp -> is_c_cpp) and
  cleanly separate the debugger configuration from the IDE-specific
  launch/task file generation to simplify adding further back-ends.

Clang and LLDB support:

- ide-sdk: add LLDB (CodeLLDB) remote debugging support for the clang
  toolchain, including lldb-server target configuration, RecipeLldbNative
  host wrapper, source-map handling and VSCode launch.json generation.
- meta-selftest: refactor cmake-example and meson-example into shared
  .inc files and add clang variants (cmake-example-clang,
  meson-example-clang) to exercise the new toolchain path.
- oe-selftest: add end-to-end tests for devtool ide-sdk with the clang
  toolchain, including a full remote debugging session where the binary
  is compiled with clang and debugged with LLDB.

Adrian Freihofer (9):
  oe-selftest: devtool: use stat for reading user/group names in ide-sdk
    tests
  oe-selftest: devtool: GDB breakpoint after std::vector is constructed
  oe-selftest: devtool: use assertRegex to match test output for meson
  oe-selftest/cpp-example: fix conf file ownership with static UIDs/GIDs
  devtool: ide-sdk: use TOOLCHAIN not TCOVERRIDE
  devtool: ide-sdk debugger back-end abstraction
  devtool: ide-sdk add LLDB support for clang toolchain
  meta-selftest: refactor cpp examples into .inc files and add clang
    variants
  oe-selftest: devtool ide-sdk: add clang/LLDB test

 meta-selftest/files/static-group              |   2 +
 meta-selftest/files/static-passwd             |   2 +
 .../recipes-test/cpp/cmake-example-clang.bb   |  13 +
 .../recipes-test/cpp/cmake-example.bb         |  20 +-
 .../recipes-test/cpp/cmake-example.inc        |  29 ++
 .../recipes-test/cpp/cmake-example/run-ptest  |  10 -
 .../recipes-test/cpp/cpp-example.inc          |  26 +-
 .../recipes-test/cpp/files/CMakeLists.txt     |  35 +--
 .../recipes-test/cpp/files/meson.build        |  17 +-
 .../recipes-test/cpp/files/meson.options      |   6 +
 .../cpp/{meson-example => files}/run-ptest    |   4 +-
 .../recipes-test/cpp/meson-example-clang.bb   |  13 +
 .../recipes-test/cpp/meson-example.bb         |  24 +-
 .../recipes-test/cpp/meson-example.inc        |  36 +++
 meta/lib/oeqa/selftest/cases/devtool.py       | 229 +++++++++++++++-
 scripts/lib/devtool/ide_plugins/__init__.py   | 258 ++++++++++++------
 scripts/lib/devtool/ide_plugins/ide_code.py   | 146 ++++++++--
 scripts/lib/devtool/ide_plugins/ide_none.py   |  26 +-
 scripts/lib/devtool/ide_sdk.py                |  86 +++++-
 19 files changed, 754 insertions(+), 228 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example-clang.bb
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example.inc
 delete mode 100644 meta-selftest/recipes-test/cpp/cmake-example/run-ptest
 rename meta-selftest/recipes-test/cpp/{meson-example => files}/run-ptest (51%)
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example-clang.bb
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example.inc

-- 
2.53.0



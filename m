Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFA4C88E63
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 07:38:34 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15104.1769413110454518406
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 23:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=R6vQ9YAk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260126073827d028ca747300020777-p5mezd@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260126073827d028ca747300020777
        for <openembedded-core@lists.openembedded.org>;
        Mon, 26 Jan 2026 08:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=51U3h1Th/iXQQZMYTNXSkH4DkItMimE1b8flglm3Z2w=;
 b=R6vQ9YAkjJp9ua0Ha6DaufTUeSQ+fC8h0NaqQql9OmS0bQLXSirVW8l9JESQ4qE9gN7Pvn
 CBQmiIvOVB/fX9f8kdmU4hu1J8U+mfuWC8yY5gFqOteZqQCO7DjZilDmn7F39JmNxMtGkHtT
 jbw5l950m1lg7AKIh34kYIpSsncymfKI6SVMPlwa7BhU+l0O7Djjarbyil3K5DLzGZOHPT64
 KV+MuIKghUTPM9t1APj10Q4aj7zuJY4FC3gm1JhEgpSQQiFz5y7K04RJo0FoDQqf9/E04vdT
 yEi9GLBQyqrgTUWxKjOsi4lgZXv/kLkBFT74LtYlfb7F9xx8qkHx0QNQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 00/13] IDE SDK Improvements
Date: Mon, 26 Jan 2026 08:37:27 +0100
Message-ID: <20260126073809.468495-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229964

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Chagnes in comparison to v2:
- Add one more commit "useradd_base.bbclass: do not use awk" to fix
  a race condition or a dependency issue in useradd_base.bbclass when
  used by bitbake build-sysroots:do_build_target_sysroot.

Changes in comparison to v1:
- Drop commit "devtool: ide-sdk: Support GDB pretty-printing for C++
  STL types". Adding this test is currently very hard, because it there
  are changes on master-next which change how the debug symbols are
  generated. Exactly, what the test checks.

- Improve remote debugging
  - Added GDB pretty-printing for C++ STL types (e.g., std::vector) to
    improve visibility during debugging.
  - Evaluated DEBUG_PREFIX_MAP for accurate source mapping in debug
    sessions.
  - Introduced gdbserver attach mode for more flexible remote debugging.
  - Moved the code that starts GDB sessions on the remote target from
    wrapper scripts into VSCode JSON files. This simplifies
    customization and improves transparency.

- Improve test coverage for ide-sdk features
  - Test the complete VSCode remote debugging workflow by reading VSCode
    JSON files.
  - Added example code using std::vector and tests for pretty-printing.
  - Extended the CMake and Meson examples with a service and added test
    coverage for the new GDB attach mode.
  - Added debug logging in DevtoolIdeSdkTests to aid troubleshooting.

- Fixes
  - Located and integrated bitbake-setup init-build-env for consistent
    environments.

- Misc
  - Added a compile step in ide-sdk tests to ensure builds are up to
    date. This is required when bitbake supports running do_install
    without dependent tasks.

Adrian Freihofer (13):
  useradd_base.bbclass: do not use awk
  devtool: ide-sdk find bitbake-setup init-build-env
  oe-selftest: devtool: DevtoolIdeSdkTests debug logging
  cpp-example: run as a service
  oe-selftest: devtool: check example services are running
  devtool: ide-sdk: add gdbserver attach mode support
  devtool: ide-sdk: move code to ide_none
  devtool: ide-sdk: make install_and_deploy script pass target arg
  devtool: ide-sdk: vscode replace scripts
  oe-selftest: devtool ide-sdk cover vscode remote debugging
  devtool: ide-sdk: evaluate DEBUG_PREFIX_MAP
  cpp-example: Add std::vector example
  devtool: ide-sdk: Support GDB pretty-printing for C++ STL types

 .../recipes-test/cpp/cpp-example.inc          |  52 +-
 .../recipes-test/cpp/files/CMakeLists.txt     |  14 +-
 .../recipes-test/cpp/files/config.h.in        |  10 +
 .../cpp/files/cpp-example-lib.cpp             |  29 ++
 .../cpp/files/cpp-example-lib.hpp             |   3 +
 .../recipes-test/cpp/files/cpp-example.conf   |   3 +
 .../recipes-test/cpp/files/cpp-example.cpp    |  46 +-
 .../recipes-test/cpp/files/cpp-example.init   |  84 ++++
 .../cpp/files/cpp-example.service             |  12 +
 .../recipes-test/cpp/files/meson.build        |  18 +-
 .../cpp/files/test-cpp-example.cpp            |   2 +
 .../recipes-test/cpp/meson-example.bb         |   2 +
 meta/classes/useradd_base.bbclass             |  49 +-
 meta/lib/oeqa/selftest/cases/devtool.py       | 472 +++++++++++++++---
 scripts/lib/devtool/ide_plugins/__init__.py   | 231 ++++-----
 scripts/lib/devtool/ide_plugins/ide_code.py   | 159 ++++--
 scripts/lib/devtool/ide_plugins/ide_none.py   | 140 +++++-
 scripts/lib/devtool/ide_sdk.py                | 285 ++++++++++-
 scripts/lib/devtool/standard.py               |   7 +-
 19 files changed, 1347 insertions(+), 271 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/config.h.in
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.conf
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.init
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.service

-- 
2.52.0



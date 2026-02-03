Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0905DE8B37E
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 22:22:02 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6176.1770157316176898020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 14:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=VT0NPtgt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260203222153eef97df812000207b8-0spkna@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260203222153eef97df812000207b8
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Feb 2026 23:21:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yxPj7WkpPLdJJTaIgoozIOhHkgBO49ItK/9ETg/u7qg=;
 b=VT0NPtgtJ1X047Aj7+E79ViGG8fetsty9NmEjR9CQY34rrl69dDB+BhL30xC7kNkSc2xeD
 3tmgYafrdOZRfjYr548MuC09oTva3L10w++XLZprnlIEP847/R4LHeh4xcDy9L1M+Ofeey38
 RVnI4wViUTUhwwF8qMuHO5dcsnAQY1p4tcGIlFI5Js0ZDFLk+VaAdsz0rZYQipk4UtxsdN1z
 NtnsZJQfvdGZMcqE/amErfOuj5au0ixDZmpomjjSpOHMG/JnehkeaOjesivMO3KzXkPW6wmd
 NI3sGRiOEEAw5qHiObuaORZLo6ZhFijCzaBZIPcIEIy7fERN1gRN1blQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 00/12] IDE SDK Improvements
Date: Tue,  3 Feb 2026 23:16:16 +0100
Message-ID: <20260203222139.1599349-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 22:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230478

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes in comparison to v3:
- Drop the commit "useradd_base.bbclass: do not use awk" again
  This is now fixed properly in master [YOCTO #16135]
- We are back at v1 minus one patch which is conflicting with
  the debug optimization changes on master-next.

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

Adrian Freihofer (12):
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
 meta/lib/oeqa/selftest/cases/devtool.py       | 471 +++++++++++++++---
 scripts/lib/devtool/ide_plugins/__init__.py   | 231 ++++-----
 scripts/lib/devtool/ide_plugins/ide_code.py   | 159 ++++--
 scripts/lib/devtool/ide_plugins/ide_none.py   | 140 +++++-
 scripts/lib/devtool/ide_sdk.py                | 285 ++++++++++-
 scripts/lib/devtool/standard.py               |   7 +-
 18 files changed, 1310 insertions(+), 258 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/config.h.in
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.conf
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.init
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.service

-- 
2.52.0


